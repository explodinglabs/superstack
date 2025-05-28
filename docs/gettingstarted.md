## Getting Started

SuperStack uses [Iko](https://github.com/explodinglabs/iko) for database schema
migrations. On startup, a few base migrations are applied so PostgREST can
function. After that, you’re free to evolve the database however you like.

A wrapper script is included at `bin/iko`, that runs the Iko CLI inside Docker
Compose’s network, allowing it to connect properly to the Postgres container.

```sh
echo 'export PATH="${PWD}/bin:$PATH"' >> ~/.bashrc
```

Run Iko commands like this:

```sh
./bin/iko check
```

To avoid typing `./bin/iko` repeatedly, create an alias:

```sh
alias iko=./bin/iko
```

> **Note:** This iko script differs from the standalone Iko CLI which runs via
> `docker run` — the SuperStack wrapper uses `docker compose run` to integrate
> with SuperStack's Compose networking.

See [Iko's commands]() for the full list of available commands.

## Nuke everything and start over

```sh
docker compose down --volumes
rm -rf migrations
```
