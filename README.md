<p align="center">
  <img alt="SuperStack logo" height="150" src="https://github.com/explodinglabs/superstack/blob/main/images/logo-light.png?raw=true#gh-light-mode-only" />
  <img alt="SuperStack logo" height="150" src="https://github.com/explodinglabs/superstack/blob/main/images/logo-dark.png?raw=true#gh-dark-mode-only" />
</p>

<h1 align="center">
  SuperStack
</h1>

**SuperStack** is a minimal, transparent backend powered by PostgreSQL,
PostgREST, and Swagger UI — all routed through Caddy. It’s designed for speed,
simplicity, and composability.

```mermaid
flowchart TD
    Caddy["<b>Caddy</b><br><i>API Gateway</i>"]
    Caddy --> Services["<b>Services</b><br><i>PostgREST, Swagger UI + more</i>"]
    Services --> Postgres["<b>Postgres</b>"]
```

Everything runs with a single command:

```sh
docker compose up
```

## Who It's For

- Developers who want full control and transparency over their backend.
- Builders who value fast iteration, low overhead, and Unix-style modularity.
- Teams who find Firebase, Supabase, or Appwrite too heavy, opaque, or locked-in.

## 🚀 Quick Start

Clone this repository and start SuperStack:

```sh
git clone --depth 1 https://github.com/explodinglabs/superstack myapp
cd myapp
cp example.env .env
docker compose up
```

Then open [localhost:8000/openapi/](https://localhost:8000/openapi/) to explore
your API in Swagger UI.
