<p align="center">
  <img alt="Minibase logo" height="35" src="https://github.com/minibasehq/minibase/blob/main/.images/logo.png?raw=true" />
</p>

<p align="center">
  <a href="https://github.com/minibasehq/minibase/wiki">Documentation</a> |
  <a href="https://github.com/minibasehq/minibase/discussions">Discussions</a>
</p>

_Minibase_ is an **application backend** with a PostgreSQL database and a
REST API accessed through a reverse proxy.

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

An Open API should be available at [localhost:8000/rest/](http://localhost:8000/rest/)

<!-- See the [full documentation](https://github.com/explodinglabs/minibase/wiki). -->
