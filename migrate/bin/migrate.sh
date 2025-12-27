#!/bin/sh
set -eu

: "${DATABASE_URL:?DATABASE_URL not set}"

psql "$DATABASE_URL" <<'SQL'
create schema if not exists infra;

create table if not exists infra.schema_migrations (
  version text primary key,
  applied_at timestamptz not null default now()
);
SQL

for f in /migrations/*.sql; do
  version=$(basename "$f")

  applied=$(psql "$DATABASE_URL" -tAc \
    "select 1 from infra.schema_migrations where version = '$version'")

  if [ -z "$applied" ]; then
    echo "Applying $version"
    psql "$DATABASE_URL" -v ON_ERROR_STOP=1 -f "$f"
    psql "$DATABASE_URL" -c \
      "insert into infra.schema_migrations(version) values ('$version')"
  else
    echo "Skipping $version"
  fi
done
