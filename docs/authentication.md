# 🔐 Authentication

SuperStack includes everything you need to implement secure, JWT-based
authentication using PostgreSQL functions.

## 📦 1. Install pgjwt

To enable JWT signing inside Postgres, you’ll need to install the pgjwt
extension.

### Clone the Repository

```sh
git clone https://github.com/michelp/pgjwt postgres/pgjwt
```

### Update Your Dockerfile

Edit `postgres/Dockerfile` to build and install the extension:

```sh
RUN apt-get update && apt-get install -y \
 build-essential \
 postgresql-server-dev-17

# pgjwt - used by auth schema
COPY ./pgjwt /pgjwt
WORKDIR /pgjwt
RUN make && make install

WORKDIR /var/lib/postgresql
```

Then rebuild:

```sh
docker compose build postgres
```

## ➡️ 2. Add Migrations

### 📚 Load Required Extensions

Add this to a migration file like `01-extensions.sql`:

```sql
-- pgcrypto adds public.crypt used in auth.encrypt_pass
create extension pgcrypto;

-- pgjwt adds public.sign used in auth.generate_access_token
create extension pgjwt;
```

> ⚠️ Do not wrap this file in a `BEGIN/COMMIT` block — `create extension` is
> non-transactional.

### 🏗 Create the Auth Schema

Create a new migration file, e.g. `02-create_auth_schema.sql`.

<details>
<summary>Click to view file</summary>

```sql
-- 02-create_auth_schema.sql
begin;

-- Create auth schema and tables
create schema auth;

create table auth.user (
  username text primary key check (length(username) >= 3),
  password text not null check (length(password) < 512),
  role name not null check (length(role) < 512)
);

create table auth.refresh_token (
  id bigint generated always as identity primary key,
  created_at timestamp not null default now(),
  token text,
  username text
);

-- Enforce that roles exist in pg_roles
create function auth.check_role_exists() returns trigger
language plpgsql as $$
begin
  if not exists (select 1 from pg_roles where rolname = new.role) then
    raise foreign_key_violation using message = 'unknown database role: ' || new.role;
    return null;
  end if;
  return new;
end
$$;

create constraint trigger ensure_user_role_exists
after insert or update on auth.user
for each row execute procedure auth.check_role_exists();

-- Encrypt passwords on insert/update
create function auth.encrypt_pass() returns trigger
language plpgsql as $$
begin
  if tg_op = 'INSERT' or new.password <> old.password then
    new.password := crypt(new.password, gen_salt('bf'));
  end if;
  return new;
end
$$;

create trigger encrypt_pass
before insert or update on auth.user
for each row execute procedure auth.encrypt_pass();

-- Generate JWT access tokens
create function auth.generate_access_token(
  role_ text, user_ text, secret text
) returns text
language plpgsql as $$
declare
  access_token text;
begin
  select public.sign(row_to_json(r), secret) into access_token from (
    select role_ as role, user_ as username,
      extract(epoch from now())::integer + 600 as exp
  ) r;
  return access_token;
end;
$$;

-- Login endpoint
create function auth.login(user_ text, pass text) returns void
language plpgsql security definer as $$
declare
  access_token text;
  headers text;
  refresh_token text;
  role_ name;
begin
  select role into role_
  from auth.user
  where username = user_
    and password = public.crypt(pass, password);

  if role_ is null then
    raise sqlstate 'PT401' using message = 'Invalid user or password';
  end if;

  select auth.generate_access_token(role_, user_, current_setting('pgrst.jwt_secret')) into access_token;

  refresh_token := public.gen_random_uuid();
  insert into auth.refresh_token (token, username) values (refresh_token, user_);

  headers := '[' ||
    '{"Set-Cookie": "access_token=' || access_token || '; Path=/; HttpOnly;"},' ||
    '{"Set-Cookie": "refresh_token=' || refresh_token || '; Path=/rpc/refresh_token; HttpOnly;"}' ||
  ']';
  perform set_config('response.headers', headers, true);
end;
$$;

-- Logout endpoint
create function auth.logout() returns void
language plpgsql security definer as $$
declare headers text;
begin
  headers := '[' ||
    '{"Set-Cookie": "access_token=; path=/; expires=Thu, 01 Jan 1970 00:00:00 GMT;"},' ||
    '{"Set-Cookie": "refresh_token=; path=/; expires=Thu, 01 Jan 1970 00:00:00 GMT;"}' ||
  ']';
  perform set_config('response.headers', headers, true);
end;
$$;

-- Refresh token endpoint
create function auth.refresh_token() returns void
language plpgsql security definer as $$
declare
  user_ text;
  access_token text;
  headers text;
  refresh_token_ text;
  role_ text;
begin
  refresh_token_ := current_setting('request.cookies', true)::json->>'refresh_token';

  select username into user_
  from auth.refresh_token
  where token = refresh_token_
    and created_at > now() - interval '30 days';

  if user_ is null then
    raise sqlstate 'PT401' using message = 'Invalid or expired refresh token';
  end if;

  select role into role_ from auth.user where username = user_;
  if role_ is null then
    raise sqlstate 'PT401' using message = 'Unknown user';
  end if;

  select auth.generate_access_token(role_, user_, current_setting('pgrst.jwt_secret')) into access_token;

  headers := '[{"Set-Cookie": "access_token=' || access_token || '; Path=/; HttpOnly;"}]';
  perform set_config('response.headers', headers, true);
end;
$$;

commit;
```

</details>

### 👮 Grant Permissions

Add another migration such as `99-roles_and_grants.sql`:

```sql
begin;

grant usage on schema auth to anon;
grant execute on function auth.login(text, text) to anon;
grant execute on function auth.logout() to anon;
grant execute on function auth.refresh_token() to anon;

commit;
```

## ▶️ 3. Run the Migrations

Once your migrations are ready:

```sh
bin/postgres migrate
```

SuperStack will execute the new migration files and skip those already
applied.

## 4. Add the Auth Schema to PostgREST

Add the auth schema to Postgres in `compose.yaml`:

```yaml
PGRST_DB_SCHEMAS: api,auth
```

✅ Usage

Explain that all auth endpoints must have a certain header.

Show example of using each endpoint.

- POST-ing a user.
- `/rpc/login`
- `/rpc/logout`
- `/rpc/refresh_token`
