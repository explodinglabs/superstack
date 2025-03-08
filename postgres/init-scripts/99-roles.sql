-- NOTE: change to your own passwords for production environments
\set pgpass `echo "$POSTGRES_PASSWORD"`

do
$do$
begin
   if exists (
     select from pg_catalog.pg_roles
     where rolname = 'authenticator'
   ) then
      raise notice 'Role already exists, skipping.';
   else
      create role authenticator noinherit login password :'pgpass';
   end if;
end
$do$;
