## How to configure psql?

Create an rc directory:

```sh
mkdir postgres/rc
```

Add to `postgres/rc/.inputrc`:

```
set editing-mode vi
```

Add to `postgres/.psqlrc`:

```sql
\setenv PAGER 'less -S'
```

Add to `compose.override.yaml`:

```yaml
volumes:
  - ./postgres/rc:/rc:ro
environment:
  INPUTRC: /rc/.inputrc
  PSQLRC: /rc/.psqlrc
```

Finally:

```sh
docker compose down postgres; docker compose up -d postgres
```

# How to install Postgres extensions?

Add to your Dockerfile `apt-get install` line:

```
build-essential postgresql-server-dev-17
```

Add these lines:

```
# pgjwt - Used by auth schema
COPY ./pgjwt /pgjwt
WORKDIR /pgjwt
RUN make
RUN make install

# pg_amqp - Used by api schema
COPY ./pg_amqp /pg_amqp
WORKDIR /pg_amqp
RUN make
RUN make install

WORKDIR /var/lib/postgresql
```

Then:

```sh
docker compose build
```

## How to nuke everything and start again?

```sh
docker compose down --volumes
```
