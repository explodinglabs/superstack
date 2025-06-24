# 🚀 Getting Started

SuperStack uses Docker, so make sure [Docker is
installed](https://docs.docker.com/get-docker/) before you begin.

## 1. Clone the Repository

```sh
git clone https://github.com/explodinglabs/superstack myapp
cd myapp
```

## 2. Configure Your Environment

Copy the example environment file:

```sh
cp example.env .env
```

> 💡 The `.env` file is for local development only. For remote deployments,
> set secrets via CI/CD or with `docker compose --env` (avoid leaking
> secrets to shell history).

## 3. Start SuperStack

```sh
docker compose up -d
```

That's it – your backend is live.

You can now open [localhost:8000/openapi/](http://localhost:8000/openapi/)
to explore your API.

---

## 🧩 What Just Happened?

SuperStack automatically:

- Starts a fresh **Postgres** database
- Applies initial **migrations**
- Launches **PostgREST** and **Swagger UI**
- Serves everything through **Caddy** on http://localhost:8000

```mermaid
flowchart TD
    Caddy["Caddy (API Gateway)"]
    Caddy --> Services["Services (PostgREST, Swagger UI + more)"]
    Services --> Postgres
```

> 💡 Only Caddy exposes a port – all services are routed through it.

## Nuke everything

To wipe your stack and start clean:

```sh
docker compose down --volumes
```

## ➕ What's Next?

👉 [Create your database schema and migrations](migrations.md)  
👉 [Deploy to a remote environment](deploying.md)
