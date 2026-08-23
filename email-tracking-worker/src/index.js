const PIXEL_GIF_BASE64 = "R0lGODdhAQABAIEAAJqgpgAAAAAAAAAAACwAAAAAAQABAAAIBAABBAQAOw==";
const TOKEN_RE = /^[A-Za-z0-9_-]{20,128}$/;
const EVENT_TTL_SECONDS = 60 * 60 * 24 * 730;

const TARGETS = Object.freeze({
  site: "https://ingmarsturm.com/",
  linkedin: "https://www.linkedin.com/in/ingmar-sturm",
});

function commonHeaders(contentType) {
  return {
    "Content-Type": contentType,
    "Cache-Control": "no-store, no-cache, must-revalidate, max-age=0, private",
    Pragma: "no-cache",
    Expires: "0",
    "X-Robots-Tag": "noindex, nofollow, noarchive",
    "Referrer-Policy": "no-referrer",
  };
}

function json(data, status = 200) {
  return new Response(JSON.stringify(data), {
    status,
    headers: commonHeaders("application/json; charset=utf-8"),
  });
}

function decodeGif() {
  const raw = atob(PIXEL_GIF_BASE64);
  const bytes = new Uint8Array(raw.length);
  for (let i = 0; i < raw.length; i += 1) bytes[i] = raw.charCodeAt(i);
  return bytes;
}

function validToken(token) {
  return TOKEN_RE.test(token || "");
}

function logError(message, error, details = {}) {
  console.error(
    JSON.stringify({
      message,
      ...details,
      error: error instanceof Error ? error.message : String(error),
    }),
  );
}

async function recordEvent(env, token, eventType) {
  const ts = Date.now();
  const uuid = crypto.randomUUID();
  const key = `event:${token}:${eventType}:${ts}:${uuid}`;
  await env.EVENTS.put(key, "1", { expirationTtl: EVENT_TTL_SECONDS });
}

async function recordEventSafely(env, token, eventType) {
  try {
    await recordEvent(env, token, eventType);
  } catch (error) {
    // Deliberately omit the token: error telemetry must not become a second
    // tracking-event store.
    logError("event_write_failed", error, { event_type: eventType });
  }
}

async function statusForToken(env, token) {
  const prefix = `event:${token}:`;
  let cursor;
  const events = [];

  do {
    const page = await env.EVENTS.list({ prefix, cursor, limit: 1000 });
    for (const item of page.keys) {
      const parts = item.name.split(":");
      if (parts.length < 5) continue;
      const eventType = parts[2];
      const ts = Number(parts[3]);
      if (!Number.isFinite(ts)) continue;
      events.push({ event: eventType, ts });
    }
    cursor = page.list_complete ? undefined : page.cursor;
  } while (cursor);

  const summarize = (eventType) => {
    const times = events
      .filter((e) => e.event === eventType)
      .map((e) => e.ts)
      .sort((a, b) => a - b);
    return {
      count: times.length,
      first_at: times.length ? new Date(times[0]).toISOString() : null,
      last_at: times.length ? new Date(times[times.length - 1]).toISOString() : null,
    };
  };

  return {
    token,
    open: summarize("open"),
    site_click: summarize("site_click"),
    linkedin_click: summarize("linkedin_click"),
  };
}

export default {
  async fetch(request, env, ctx) {
    if (request.method !== "GET") {
      return json({ error: "method_not_allowed" }, 405);
    }

    const url = new URL(request.url);
    const path = url.pathname;

    if (path === "/health") {
      try {
        // A read-only sentinel lookup verifies that the KV binding is usable,
        // not merely present in the deployed script configuration.
        await env.EVENTS.get("__health__");
        return json({ ok: true, service: "ingmar-email-tracker", storage: "kv" });
      } catch (error) {
        logError("health_check_failed", error);
        return json({ ok: false, error: "storage_unavailable" }, 503);
      }
    }

    const openMatch = path.match(/^\/o\/([A-Za-z0-9_-]+)\.gif$/);
    if (openMatch) {
      const token = openMatch[1];
      if (!validToken(token)) return json({ error: "invalid_token" }, 400);
      ctx.waitUntil(recordEventSafely(env, token, "open"));
      return new Response(decodeGif(), {
        status: 200,
        headers: commonHeaders("image/gif"),
      });
    }

    const clickMatch = path.match(/^\/c\/(site|linkedin)\/([A-Za-z0-9_-]+)$/);
    if (clickMatch) {
      const [, targetName, token] = clickMatch;
      if (!validToken(token)) return json({ error: "invalid_token" }, 400);
      const eventType = targetName === "site" ? "site_click" : "linkedin_click";
      ctx.waitUntil(recordEventSafely(env, token, eventType));
      return new Response(null, {
        status: 302,
        headers: {
          ...commonHeaders("text/plain; charset=utf-8"),
          Location: TARGETS[targetName],
        },
      });
    }

    const statusMatch = path.match(/^\/s\/([A-Za-z0-9_-]+)$/);
    if (statusMatch) {
      const token = statusMatch[1];
      if (!validToken(token)) return json({ error: "invalid_token" }, 400);
      try {
        return json(await statusForToken(env, token));
      } catch (error) {
        logError("status_read_failed", error);
        return json({ error: "storage_unavailable" }, 503);
      }
    }

    return json({ error: "not_found" }, 404);
  },
};
