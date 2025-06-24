# Postgres Extensions

## How to load an extension?

Load the extension by adding to a `postgres/migrations/##-extensions.sql`:

```sql
create extension pgcrypto;
```

> Note `create extension` is a non-transactional command, so don't use
> begin/commit in this file.

## Build extension from source

Clone the repository into `postgres/`, e.g..

```sh
git clone https://github.com/michelp/pgjwt postgres/pgjwt
```

Add to `postgres/Dockerfile`:

```
RUN apt-get install build-essential postgresql-server-dev-17

# pgjwt - Used by auth schema
COPY ./pgjwt /pgjwt
WORKDIR /pgjwt
RUN make
RUN make install

WORKDIR /var/lib/postgresql
```

> The last line is just to set the `WORKDIR` back to the default.

Then:

```sh
docker compose build postgres
```
