# psql

_psql_ is the command-line interface for interacting with PostgreSQL
databases.

In SuperStack you can access it with `bin/postgres psql`:

```sh
$ bin/postgres psql
psql (17.5 (Debian 17.5-1.pgdg120+1))
Type "help" for help.

app=#
```

Or to run a command inline:

```sh
bin/postgres psql -c 'select version()'
                                                       version
---------------------------------------------------------------------------------------------------------------------
 PostgreSQL 17.5 (Debian 17.5-1.pgdg120+1) on x86_64-pc-linux-gnu, compiled by gcc (Debian 12.2.0-14) 12.2.0, 64-bit
(1 row)
```

## .psqlrc

Configure psql with a .psqlrc configuration file.

Create an rc directory:

```sh
mkdir postgres/rc
```

Add your `postgres/rc/.psqlrc`:

```sql
\pset pager off
\setenv PAGER 'less -S'
```

> 📚 See https://www.postgresql.org/docs/current/app-psql.html

Add to `compose.override.yaml`:

```yaml
volumes:
  - ./postgres/rc:/rc:ro
environment:
  PSQLRC: /rc/.psqlrc
```

Finally:

```sh
docker compose down postgres; docker compose up -d postgres
```

## .inputrc

Create an rc directory:

```sh
mkdir postgres/rc
```

Add your `postgres/rc/.inputrc`:

```
set editing-mode vi
```

Add to `compose.override.yaml`:

```yaml
volumes:
  - ./postgres/rc:/rc:ro
environment:
  INPUTRC: /rc/.inputrc
```

Finally:

```sh
docker compose down postgres; docker compose up -d postgres
```
