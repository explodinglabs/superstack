<p align="center">
  <img alt="Minibase logo" src="https://github.com/explodinglabs/minibase/blob/main/logo-light-mode.png?raw=true#gh-light-mode-only" />
  <img alt="Minibase logo" src="https://github.com/explodinglabs/minibase/blob/main/logo-dark-mode.png?raw=true#gh-dark-mode-only" />
</p>

<p align="center">
  A lightweight and extensible backend.
</p>

## What is Minibase?

Minibase is an application backend alternative to Supabase and Firebase. It
uses an API gateway to access Postgres via middleware. The default setup
includes a PostgREST API, but components can be added and swapped out as
needed.

<p align="center">
  <img alt="Architecture diagram" src="https://github.com/explodinglabs/minibase/blob/main/architecture.svg?raw=true" />
</p>

Being more lightweight than the alternatives, multiple applications can be
brought up locally for development.

## Installation

```sh
git clone --depth 1 https://github.com/explodinglabs/minibase myapp
cd myapp
cp .example.env .env
docker compose up -d
```

Test it with https://localhost/

See the [full documentation](https://github.com/explodinglabs/minibase/wiki).
