-- Initial migrations to setup PostgREST

-- Set values here to reduce the chance of env vars being logged
\set pgrst_authenticator_pass '$PGRST_AUTHENTICATOR_PASS'

-- Revoke execute on functions from public
-- See https://docs.postgrest.org/en/stable/explanations/db_authz.html#functions
alter default privileges revoke execute on functions from public;

begin;

-- Create authenticator and anonymous roles. The authenticator role is used for
-- connecting to the database. Anon is for non-authenticated users. 
create role authenticator noinherit login password :'pgrst_authenticator_pass';
create role anon;
grant anon to authenticator;  -- Allow authenticator to switch to anon.

commit;
