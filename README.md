<p align="center">
  <img alt="Minibase logo" height="35" src="https://github.com/minibasehq/minibase/blob/main/.images/logo.png?raw=true" />
</p>

<p align="center">
  <a href="https://github.com/minibasehq/minibase/wiki">Documentation</a> |
  <a href="https://github.com/minibasehq/minibase/discussions">Discussions</a>
</p>

Minibase is a Postgres-based **application backend** which is accessed through
a REST API and a reverse proxy.

<p align="center">
  <img alt="Architecture diagram" src="https://github.com/minibasehq/minibase/blob/main/.images/architecture-light.svg?raw=true#gh-light-mode-only" />
  <img alt="Architecture diagram" src="https://github.com/minibasehq/minibase/blob/main/.images/architecture-dark.svg?raw=true#gh-dark-mode-only" />
</p>

The middleware layer of services can be added to as needed. Being more
lightweight than the alternatives like Supabase, multiple applications can be
brought up locally for development.

## Installation

```sh
git clone --depth 1 https://github.com/minibasehq/minibase myapp
cd myapp
cp example.env .env
docker compose up -d
```

Test it with

```sh
curl localhost:8000/rest/
```

<!-- See the [full documentation](https://github.com/explodinglabs/minibase/wiki). -->
