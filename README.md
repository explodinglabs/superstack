<p align="center">
  <img alt="Minibase logo" src="https://github.com/minibasehq/minibase/blob/main/images/logo.png?raw=true" />
</p>

<p align="center">
  <a href="https://github.com/minibasehq/minibase/wiki">Documentation</a> |
  <a href="https://github.com/minibasehq/minibase/discussions">Discussions</a>
</p>

Minibase is an **application backend** with a Postgres base, an API gateway, and a middleware layer of services that can be swapped out as needed.

<p align="center">
  <img alt="Architecture diagram" src="https://github.com/minibasehq/minibase/blob/main/images/architecture-light.svg?raw=true#gh-light-mode-only" />
  <img alt="Architecture diagram" src="https://github.com/minibasehq/minibase/blob/main/images/architecture-dark.svg?raw=true#gh-dark-mode-only" />
</p>

Being more lightweight than the alternatives, multiple applications can be
brought up locally for development.

## Installation

```sh
git clone --depth 1 https://github.com/minibasehq/minibase myapp
cd myapp
cp example.env .env
docker compose up -d
```

Test it with https://localhost/

See the [full documentation](https://github.com/explodinglabs/minibase/wiki).
