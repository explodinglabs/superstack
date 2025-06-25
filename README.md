<p align="center">
  <img alt="SuperStack logo" src="https://github.com/explodinglabs/superstack/blob/main/logo.png?raw=true" />
</p>

<h1 align="center">SuperStack</h1>

_SuperStack_ is a minimal **application backend** powered by PostgreSQL and
PostgREST, routed through Caddy. Designed for speed, simplicity, and
composability.

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

1. [Use this template](https://github.com/explodinglabs/superstack/generate) to
   create a new repository under your GitHub account.
2. **Clone your new project and start the stack:**

```sh
git clone https://github.com/yourname/myapp
cd myapp
cp example.env .env
docker compose up -d
```

3. **Explore your API**

Open [http://localhost:8000/openapi/](http://localhost:8000/openapi/) in your
browser to view and test endpoints using Swagger UI.

## 📚 Full Documentation

👉 [explodinglabs.com/superstack/](https://explodinglabs.com/superstack/)
