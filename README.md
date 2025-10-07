<p align="center">
  <img alt="SuperStack logo" src="https://github.com/explodinglabs/superstack/blob/main/logo.png?raw=true" />
</p>

<h1 align="center">SuperStack</h1>

<p align="center">
  <a href="https://explodinglabs.com/superstack/">SuperStack Docs</a>
  | <a href="https://github.com/explodinglabs/superstack/wiki">Developer Wiki</a>
</p>

_SuperStack_ is an **application backend** built on Docker for self-hosting.
Minimal by default, it is endlessly extensible.

```mermaid
flowchart TD
    Proxy["<b>Proxy</b><br><i>Used for traffic shifting</i>"]
    Proxy --> App["<b>Application</b><br><i>Routes, Auth, APIs, Messaging, Workers, etc.</i>"]
```

## 🎯 Perfect For

- **Solo developers** who want full backend control
- **Startups** building fast and lean
- **Teams** that value transparency and modularity
- **Enterprises** that prefer composable infrastructure

## 🚀 Quick Start

1. [Create your repository from the SuperStack template](https://github.com/explodinglabs/superstack/generate)

2. Clone your repository:

```sh
git clone https://github.com/yourname/myapp.git
cd myapp
```

3. Start the proxy service:

```sh
cp app/example.env app/.env
cd proxy && docker compose up -d
```

4. Start the application:

Create environment files:

```sh
cd app
docker compose up -d
```

Test it with:

```sh
$ curl http://localhost:8000/healthcheck
OK
```

## 📚 Documentation

📖 [SuperStack Docs](https://explodinglabs.com/superstack/) — Everything you
need to install, configure, and use SuperStack out of the box.

🛠️ [Developer Wiki](https://github.com/explodinglabs/superstack/wiki) — A
collection of pages to help you add features like authentication, messaging
queues, Stripe webhooks, etc.
