# 🐰 RabbitMQ

## 📦 1. Install pg_amqp

### Clone the Repository

```sh
git clone https://github.com/omniti-labs/pg_amqp postgres/pg_amqp
```

### Update Your Dockerfile

Edit `postgres/Dockerfile` to build and install the extension:

```sh
RUN apt-get update && apt-get install -y \
 build-essential \
 postgresql-server-dev-17

# pg_amqp - Used by api schema
COPY ./pg_amqp /pg_amqp
WORKDIR /pg_amqp
RUN make
RUN make install

WORKDIR /var/lib/postgresql
```

> You may need to fix "implicit int" errors in pg_amqp, which were reported
> [here](), and [fixed but not yet
> merged](https://github.com/omniti-labs/pg_amqp/pull/43).

Then rebuild:

```sh
docker compose build postgres
```

## ➡️ 2. Add Migrations

### 📚 Load Required Extensions

Add this to a migration file like `01-extensions.sql`:

```sql
-- amqp extension for rabbitmq connection
create extension amqp;
```

> ⚠️ Do not wrap this file in a `BEGIN/COMMIT` block — `create extension` is
> non-transactional.

### 🏗 Use pg_amqp

Add to a migration file, e.g. `10-create_api_schema.sql`.

<details>
<summary>Click to view file</summary>

```sql
-- 10-create_api_schema.sql
begin;

create table api.task (
  id serial primary key,
  name text not null
);

create function api.task_updated() returns void
language plpgsql as $$
begin
  perform amqp.publish(1, 'amq.topic', 'tasks', json_build_object('event', 'task_updated', 'command', command)::text);
end;
$$;

create trigger task_updated
before update on api.task
for each row execute procedure api.task_updated();

commit;
```

</details>

## ▶️ 3. Run the Migrations

Once your migrations are ready:

```sh
bin/postgres migrate
```

SuperStack will execute the new migration files, skipping those already
applied.
