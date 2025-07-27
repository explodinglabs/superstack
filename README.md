<p align="center">
  <img alt="SuperStack logo" src="https://github.com/explodinglabs/superstack/blob/main/logo.png?raw=true" />
</p>

<h1 align="center">SuperStack</h1>

<p align="center">
  <a href="https://explodinglabs.com/superstack/">SuperStack Docs</a>
  | <a href="https://github.com/explodinglabs/superstack/wiki">Developer Wiki</a>
</p>

_SuperStack_ is an **application backend** powered by PostgreSQL and PostgREST,
routed through Caddy. Designed for speed, simplicity, and composability.

```mermaid
flowchart TD
    Gateway["<b>API Gateway</b><br><i>Caddy</i>"]
    Gateway --> API["<b>API Services</b><br><i>PostgREST + Add More</i>"]
    API --> Database["<b>Database</b><br><i>Postgres</i>"]
```

## 🎯 Perfect For

- **Solo developers** who want full backend control
- **Startups** building fast and lean
- **Teams** that value transparency and modularity
- **Enterprises** that prefer composable infrastructure

## 🚀 Quick Start

https://github.com/user-attachments/assets/5b53338a-9eef-405c-820c-cd5253f09d0d

1. [Create your repository from the SuperStack template](https://github.com/explodinglabs/superstack/generate)

2. Clone your repository and start SuperStack:

```sh
git clone https://github.com/yourname/myapp.git
cd myapp
cp example.env .env
docker compose up -d
```

## 📚 Documentation

Explore the full documentation:

📖 [SuperStack Docs](https://explodinglabs.com/superstack/) — Everything you need to install, configure, and use SuperStack out of the box.  
🛠️ [Developer Wiki](https://github.com/explodinglabs/superstack/wiki) — A collection of pages to help you add features like authentication, messaging queues, Stripe webhooks, etc.
