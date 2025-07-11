-- Initial migrations to setup PostgREST

-- Set values here to reduce the chance of env vars being logged
\set pgrst_authenticator_pass '$PGRST_AUTHENTICATOR_PASS'

begin;

-- Create authenticator and anonymous roles. The authenticator role is used for
-- connecting to the database. Anon is for non-authenticated users. 
create role authenticator noinherit login password :'pgrst_authenticator_pass';
create role anon;
grant anon to authenticator;  -- Allow authenticator to switch to anon.

commit;
