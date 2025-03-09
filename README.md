<p align="center">
  <img alt="Minibase logo" src="https://github.com/explodinglabs/minibase/blob/main/logo-light-mode.png?raw=true#gh-light-mode-only" />
  <img alt="Minibase logo" src="https://github.com/explodinglabs/minibase/blob/main/logo-dark-mode.png?raw=true#gh-dark-mode-only" />
</p>

<p align="center">
  A lightweight and extensible backend.
</p>

## What is Minibase?

Minibase is a backend infrastructure that has an API gateway to Postgres-access
tools. The default setup includes a REST API, but components can be added and
swapped out as needed.

<p align="center">
  <img alt="Architecture diagram" src="https://github.com/explodinglabs/minibase/blob/main/architecture.svg?raw=true" />
</p>

## Installation

```sh
git clone --depth 1 https://github.com/explodinglabs/minibase myapp
cd myapp
cp .example.env .env
docker compose up -d
```

Test it with https://localhost/

To add more components, see the [documentation](https://github.com/explodinglabs/minibase/wiki).
