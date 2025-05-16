<p align="center">
  <img alt="Minibase logo" height="150" src="https://github.com/explodinglabs/minibase/blob/main/images/logo-light.png?raw=true#gh-light-mode-only" />
  <img alt="Minibase logo" height="150" src="https://github.com/explodinglabs/minibase/blob/main/images/logo-dark.png?raw=true#gh-dark-mode-only" />
</p>

<h1 align="center">
  Minibase
</h1>

_Minibase_ is a lightweight **backend stack** that combines PostgreSQL with a
set of middleware services — starting with PostgREST — exposed through a
gateway powered by Caddy.

<p align="center">
  <img alt="Architecture diagram" src="https://github.com/explodinglabs/minibase/blob/main/images/architecture-light.svg?raw=true#gh-light-mode-only" />
  <img alt="Architecture diagram" src="https://github.com/explodinglabs/minibase/blob/main/images/architecture-dark.svg?raw=true#gh-dark-mode-only" />
</p>

It spins up with a single `docker compose up` and gives you instant API access
to your database. Like Firebase, Supabase and Appwrite, it's a backend platform
— but with a Unix philosophy: minimal, composable, and transparent.

**Who Minibase Is For:**

- Developers who want control and visibility over their backend.
- Builders who value fast iteration, low overhead, and Unix-style modularity.
- People who find Firebase/Supabase/Appwrite too heavy, opaque, or opinionated.

The middleware layer of services (PostgREST and Swagger UI) can be built out as
needed. Being lightweight, multiple instances can be brought up locally for
development.

## Installation

Clone this repository and start Minibase:

```sh
git clone --depth 1 https://github.com/explodinglabs/minibase myapp
cd myapp
cp example.env .env
docker compose up
```

A Swagger UI is available at
[localhost:8000/openapi/](http://localhost:8000/openapi/)

## Usage

Minibase uses [Iko](https://github.com/explodinglabs/iko) for database schema
migrations. On startup, a few migrations are made for PostgREST to work. From
there, you can start iterating on the database for your own needs.

Create an Iko command in your local shell:

```sh
iko() { docker compose run --rm -it --no-deps -v ${PWD}/migrations:/repo:rw -v ${PWD}/scripts:/scripts:ro -v ${PWD}/caddy/conf:/etc/caddy:ro --env CADDY_AUTO_HTTPS=off iko "$@" }
```

Ensure it's working with:

```sh
$ iko check
Checking db:postgres://admin@postgres:5432/app
Check successful
```

## To start over

```sh
docker compose down --volumes
docker compose up
```

## Environments

To deploy your app to other environments, you have a few options.

### 1. Version control

- Commit the migrations to your repository
- Push
- Pull changes on the remote server
- `docker compose run --rm iko deploy`

### 2. Build your container image with migrations included

- Build a custom Iko image using the Dockerfile included in this repo just for
  this purpose: `docker build -t yourrepo/youriko .`
- `docker push yourrepo/youriko`

Then on the remote server:

- `docker pull yourrepo/youriko`
- Update the compose.yaml to use your Iko image
- `docker compose run --rm iko deploy`

### 3. Copy migrations to remote

This is another option.
