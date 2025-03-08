<p align="center">
  <img alt="Minibase logo" src="https://github.com/explodinglabs/minibase/blob/main/logo-light-mode.png?raw=true#gh-light-mode-only" />
  <img alt="Minibase logo" src="https://github.com/explodinglabs/minibase/blob/main/logo-dark-mode.png?raw=true#gh-dark-mode-only" />
</p>

<p align="center">
  A lightweight and extensible backend.
</p>

<p align="center">
  <img alt="Architecture diagram" src="https://github.com/explodinglabs/minibase/blob/main/architecture.svg?raw=true" />
</p>

## What is Minibase?

Minibase is a backend infrastructure that uses OpenResty as an API gateway to
database-access tools. The default setup includes PostgREST and Supabase Auth,
but components can be added and swapped out as needed.

## Installation

```sh
git clone --depth 1 https://github.com/explodinglabs/minibase myapp
cd myapp
cp .example.env .env
docker compose up -d
```

## Components

See the [wiki](https://github.com/explodinglabs/minibase/wiki).
