-- Initial migrations to setup PostgREST

-- Revoke default privileges from public
-- See https://docs.postgrest.org/en/stable/explanations/db_authz.html#functions

alter default privileges revoke execute on functions from public;
alter default privileges revoke select, insert, update, delete on tables from public;
alter default privileges revoke usage, select on sequences from public;
