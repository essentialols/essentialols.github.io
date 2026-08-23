# First-party email tracker

Small Cloudflare Worker for the cold-outreach experiment. It keeps tracking under `t.ingmarsturm.com` and stores only random-token event timestamps in Workers KV.

## Endpoints

- `GET /health` — health check.
- `GET /o/<token>.gif` — records `open`, returns the muted-gray signature dot.
- `GET /c/site/<token>` — records `site_click`, redirects to `https://ingmarsturm.com/`.
- `GET /c/linkedin/<token>` — records `linkedin_click`, redirects to the LinkedIn profile.
- `GET /s/<token>` — returns counts and first/last timestamps for the three event types.

Tokens must be random URL-safe strings with at least 128 bits of entropy and must not contain recipient personally identifiable information.

## Deploy

This project uses current Wrangler automatic provisioning. The `EVENTS` KV namespace is declared without an account-specific ID; `wrangler deploy` creates/binds it automatically. The custom-domain route points the Worker at `t.ingmarsturm.com`; Cloudflare creates the required DNS record and certificate when the domain is attached.

```bash
cd email-tracking-worker
npm install
npx wrangler login
npm run check
npm run deploy
curl -fsS https://t.ingmarsturm.com/health
```

For noninteractive deployment, set `CLOUDFLARE_API_TOKEN` and `CLOUDFLARE_ACCOUNT_ID` in the environment before `npm run deploy`.

## Event model

Each request writes a unique KV key of the form:

```
event:<random-token>:<event-type>:<unix-ms>:<uuid>
```

The Worker deliberately does not record recipient name/email, IP address, referrer, or user-agent. The token-to-prospect mapping stays in the private outreach ledger.

## Interpretation

`open` is noisy telemetry. Gmail image proxying, Apple Mail privacy behavior, caches, and remote-image blocking can create false positives or false negatives. Treat `site_click` and `linkedin_click` as stronger secondary engagement signals, and continue to use reply / qualified conversation as the primary outcome.
