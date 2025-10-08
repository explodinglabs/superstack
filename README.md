<p align="center">
  <img alt="SuperStack logo" src="https://github.com/explodinglabs/superstack/blob/main/logo.png?raw=true" />
</p>

<h1 align="center">SuperStack</h1>

<p align="center">
  <a href="https://explodinglabs.com/superstack/">SuperStack Docs</a>
  | <a href="https://github.com/explodinglabs/superstack/wiki">SuperStack Wiki</a>
</p>

_SuperStack_ is an **application backend** built on Docker for self-hosting.
Minimal by default, it is endlessly extensible.

```mermaid
flowchart TD
    Proxy["<b>Proxy</b><br><i>Used for traffic shifting</i>"]
    Proxy --> App["<b>Application</b><br><i>API Gateway, Auth, APIs, Messaging, Workers, etc.</i>"]
    App --> Database["<b>Database</b><br><i>Optional</i>"]
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

3. Create environment files:

```sh
cp app/example.env app/.env
```

4. Start the proxy service:

```sh
cd proxy && docker compose up -d
```

5. Start the application:

```sh
cd ../app && docker compose up -d
```

Test it with:

```sh
$ curl http://localhost:8000/healthcheck
OK
```

Add to your application by following guides in the
[Wiki](https://github.com/explodinglabs/superstack/wiki).

## 📚 Links

📖 [SuperStack Docs](https://explodinglabs.com/superstack/) — Everything you
need to install, configure, and use SuperStack out of the box.

🛠️ [SuperStack Wiki](https://github.com/explodinglabs/superstack/wiki) — A
collection of pages to help you add features like authentication, database,
messaging, etc.
