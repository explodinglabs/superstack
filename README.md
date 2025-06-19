<p align="center">
  <img alt="SuperStack logo" src="https://github.com/explodinglabs/superstack/blob/main/images/logo-light.png?raw=true#gh-light-mode-only" />
  <img alt="SuperStack logo" src="https://github.com/explodinglabs/superstack/blob/main/images/logo-dark.png?raw=true#gh-dark-mode-only" />
</p>

<h1 align="center">SuperStack</h1>

_SuperStack_ is a minimal application backend powered by PostgreSQL
and PostgREST, routed through Caddy. Designed for speed,
simplicity, and composability.

```mermaid
flowchart TD
    Caddy["<b>Caddy</b><br><i>API Gateway</i>"]
    Caddy --> Services["<b>Services</b><br><i>PostgREST, Swagger UI + more</i>"]
    Services --> Postgres["<b>Postgres</b>"]
```

## 🎯 Perfect For

- **Solo developers** who want full backend control
- **Startups** building fast and lean
- **Teams** that value transparency and modularity
- **Enterprises** that prefer composable infrastructure

## 🚀 Quick Start

Clone this repository to start SuperStack:

```sh
git clone https://github.com/explodinglabs/superstack myapp
cd myapp
cp example.env .env
docker compose up
```

Then open [localhost:8000/openapi/](http://localhost:8000/openapi/) to explore
your API in Swagger UI.

## 📚 Full Documentation

👉 [explodinglabs.com/superstack/](https://explodinglabs.com/superstack/)
