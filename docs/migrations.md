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

## 🔁 Transactions

Each migration file should start with `BEGIN` and end with `COMMIT`, like
this:

```sql
-- File: postgres/migrations/03-create_table_example.sql
begin;

create table example (
  id serial primary key,
  name text not null
);

commit;
```

## ⚠️ Non-Transactional Migrations

Some statements (like create extension) cannot be wrapped in a transaction.
In those cases, skip the `BEGIN/COMMIT`:

```sql
-- File: postgres/migrations/02-extensions.sql
create extension pgcrypto;
```

## ▶️ Applying Migrations

To apply your migrations, run:

```sh
bin/postgres migrate
```

This will:

- Check for a `.applied_migrations` file inside the container
- Run any migration files that haven’t been applied yet (in filename order)
- Record each successfully applied file in `.applied_migrations`

> 💡 Already-applied scripts are skipped on subsequent runs.

## 🧪 First-Time Setup

When the Postgres container starts with no existing data, SuperStack will
automatically run migrations once.

This happens during initial startup — no manual step needed.

After the first `docker compose up`, migrations will only run if you run
`bin/postgres migrate`.

## 🔄 Resetting

If you want to start fresh:

```sh
docker compose down --volumes
```

Then:

```sh
docker compose up
```

This will wipe your database and re-run all migrations from scratch.
