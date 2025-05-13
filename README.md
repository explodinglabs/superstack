<p align="center">
  <img alt="Minibase logo" height="150" src="https://github.com/explodinglabs/minibase/blob/main/.images/logo-light.png?raw=true#gh-light-mode-only" />
  <img alt="Minibase logo" height="150" src="https://github.com/explodinglabs/minibase/blob/main/.images/logo-dark.png?raw=true#gh-dark-mode-only" />
</p>

<h1 align="center">
  Minibase
</h1>

_Minibase_ is an **application backend** with a PostgreSQL database and a REST
API accessed through a reverse proxy. It's a lightweight Supabase alternative.

<p align="center">
  <img alt="Architecture diagram" src="https://github.com/explodinglabs/minibase/blob/main/.images/architecture-light.svg?raw=true#gh-light-mode-only" />
  <img alt="Architecture diagram" src="https://github.com/explodinglabs/minibase/blob/main/.images/architecture-dark.svg?raw=true#gh-dark-mode-only" />
</p>

The middleware layer of services can be built out as needed. Being lightweight,
multiple instances can be brought up locally for development.

## Installation

Clone this repository and start Minibase:

```sh
git clone --depth 1 https://github.com/explodinglabs/minibase myapp
cd myapp
cp example.env .env
docker compose up
```

A Swagger UI is available at
[localhost:8000/rest/](http://localhost:8000/openapi/)
