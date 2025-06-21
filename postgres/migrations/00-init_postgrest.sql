begin;

create role authenticator noinherit login password '${PGRST_AUTHENTICATOR_PASS}';
create role anon;
grant anon to authenticator;
create schema "${PGRST_DB_SCHEMAS}";
comment on schema "${PGRST_DB_SCHEMAS}" is 'SuperStack API

The api endpoints for the SuperStack application.';

commit;
