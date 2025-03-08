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

Minibase is a lightweight backend infrastructure that uses OpenResty as an API
gateway to database-access tools. The default setup includes PostgREST and
Supabase Auth, but components can be easily added and swapped out as needed.

## Usage

```sh
git clone --depth 1 https://github.com/explodinglabs/minibase myapp
cd myapp
```

Create an env file:

```sh
cp .example.env .env
```

Start Minibase:

```sh
docker compose up -d
```

Full documentation in the [wiki](https://github.com/explodinglabs/minibase/wiki).

## Adding
