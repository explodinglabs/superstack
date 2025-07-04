# 📜 Migrations

SuperStack includes a simple built-in system for managing database schema
migrations.

## ✍️ Writing Migrations

Place your migration scripts in:

```
postgres/migrations/
```

Each file should be:

- A `.sql` file
- Numbered in order (e.g. `00-init.sql`, `01-extensions.sql`, `02-auth.sql`)
- Written in plain SQL
- But can include environment variables.

## ▶️ Applying Migrations

When the Postgres container starts with no existing data, SuperStack will
automatically run migrations once.

After the first `docker compose up`, migrations will only run if you
manually apply them.

To apply your migrations, run:

```sh
bin/postgres migrate
```

This will:

1. Run any migration files that haven’t been applied yet (in filename order)
2. Record each successfully applied file in `.applied_migrations`

Already-applied scripts are skipped on subsequent runs.

> 💡 `bin/postgres` is short for `docker compose exec postgres`

## 🔄 Resetting

If you want to start fresh:

```sh
docker compose down --volumes
docker compose up -d
```

This will wipe your database and re-run all migrations from scratch.

## 🔁 Transactions

Use `BEGIN;` and `COMMIT;` to wrap migration files when all included
statements are transactional. This ensures that all changes are applied
atomically.

For example:

```sql
-- File: postgres/migrations/03-create_table_example.sql
begin;

create table director (
  id serial primary key,
  name text not null
);

create table movie (
  id serial primary key,
  name text not null,
  director_id integer references director(id)
);

commit;
```

> 💡 If your migration script only contains one statement, there's no need
> to use a transaction, the statement will be auto-committed.

Avoid wrapping non-transactional operations in a transaction — these will
cause errors if used inside `BEGIN ... COMMIT`.

Examples of non-transactional statements include:

```sql
CREATE EXTENSION
DROP EXTENSION
VACUUM
REINDEX
CLUSTER
CREATE DATABASE
DROP DATABASE
CREATE ROLE
CREATE TABLESPACE
DROP TABLESPACE
ALTER SYSTEM
DISCARD ALL
LOAD
```
