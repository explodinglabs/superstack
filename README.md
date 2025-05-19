<p align="center">
  <img alt="Minibase logo" height="150" src="https://github.com/explodinglabs/minibase/blob/main/images/logo-light.png?raw=true#gh-light-mode-only" />
  <img alt="Minibase logo" height="150" src="https://github.com/explodinglabs/minibase/blob/main/images/logo-dark.png?raw=true#gh-dark-mode-only" />
</p>

<h1 align="center">
  Minibase
</h1>

_Minibase_ is a **lightweight backend** designed for rapid application
development. It combines PostgreSQL with a set of modular services — starting
with PostgREST and Swagger UI — that you can extend as needed. All services are
exposed through a fast, modern gateway powered by Caddy.

```mermaid
flowchart TD
    Caddy["<b>Caddy</b><br><i>API Gateway</i>"]
    Caddy --> Middleware["<b>Services</b><br><i>PostgREST, Swagger UI + more</i>"]
    Middleware --> Postgres["<b>Postgres</b>"]
```

Minibase spins up with a single `docker compose up`. Because it's lightweight,
you can run multiple instances locally for testing and development.

**Who Minibase Is For:**

- Developers who want full control and transparency over their backend.
- Builders who value fast iteration, low overhead, and Unix-style modularity.
- Teams who find Firebase, Supabase, or Appwrite too heavy, opaque, or locked-in.

## Installation

Clone this repository and start Minibase:

```sh
git clone --depth 1 https://github.com/explodinglabs/minibase myapp
cd myapp
cp example.env .env
docker compose --env CADDY_AUTO_HTTPS=off up
```

Once it's running, open
[localhost:8000/openapi/](http://localhost:8000/openapi/) to view the Swagger
UI and interact with your API.

## Usage

Minibase uses [Iko](https://github.com/explodinglabs/iko) for database schema
migrations. On startup, a few base migrations are applied so PostgREST can
function. From there, you're free to evolve the database however you like.

A `bin/iko` script is included, and since you'll be running it often, I
recommend creating an alias to it:

```sh
alias iko=./bin/iko
```

Test it's working:

```sh
$ iko check
Checking db:postgres://admin@postgres:5432/app
Check successful
```

See [Iko's commands](https://github.com/explodinglabs/iko).

## Nuke everything and start over

```sh
docker compose down --volumes
rm -rf migrations
```
