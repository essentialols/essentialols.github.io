import assert from "node:assert/strict";
import test from "node:test";

import worker from "../src/index.js";

const TOKEN = "abcdefghijklmnopqrstuvwx";

function harness({ failReads = false } = {}) {
  const keys = new Map();
  const pending = [];
  const env = {
    EVENTS: {
      async get() {
        if (failReads) throw new Error("KV unavailable");
        return null;
      },
      async put(key, value) {
        keys.set(key, value);
      },
      async list({ prefix }) {
        if (failReads) throw new Error("KV unavailable");
        return {
          keys: [...keys.keys()]
            .filter((name) => name.startsWith(prefix))
            .map((name) => ({ name })),
          list_complete: true,
        };
      },
    },
  };
  const ctx = {
    waitUntil(promise) {
      pending.push(promise);
    },
  };

  return {
    keys,
    async call(path, method = "GET") {
      return worker.fetch(
        new Request(`https://tracker.test${path}`, { method }),
        env,
        ctx,
      );
    },
    async settle() {
      await Promise.all(pending.splice(0));
    },
  };
}

test("health verifies KV and reports storage failures", async () => {
  const healthy = harness();
  let response = await healthy.call("/health");
  assert.equal(response.status, 200);
  assert.equal((await response.json()).ok, true);

  const unavailable = harness({ failReads: true });
  response = await unavailable.call("/health");
  assert.equal(response.status, 503);
  assert.deepEqual(await response.json(), {
    ok: false,
    error: "storage_unavailable",
  });
});

test("pixel and click endpoints record events", async () => {
  const app = harness();

  let response = await app.call(`/o/${TOKEN}.gif`);
  assert.equal(response.status, 200);
  assert.equal(response.headers.get("content-type"), "image/gif");
  await app.settle();

  response = await app.call(`/c/site/${TOKEN}`);
  assert.equal(response.status, 302);
  assert.equal(response.headers.get("location"), "https://ingmarsturm.com/");
  await app.settle();

  response = await app.call(`/s/${TOKEN}`);
  assert.equal(response.status, 200);
  const status = await response.json();
  assert.equal(status.open.count, 1);
  assert.equal(status.site_click.count, 1);
  assert.equal(status.linkedin_click.count, 0);
});

test("invalid routes and methods do not write events", async () => {
  const app = harness();

  let response = await app.call("/o/too-short.gif");
  assert.equal(response.status, 400);

  response = await app.call("/health", "POST");
  assert.equal(response.status, 405);

  response = await app.call("/missing");
  assert.equal(response.status, 404);
  assert.equal(app.keys.size, 0);
});
