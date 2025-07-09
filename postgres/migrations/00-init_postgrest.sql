-- Initial migrations to setup PostgREST

-- Set values here to reduce the chance of env vars being logged
\set pgrst_jwt_secret '$PGRST_JWT_SECRET'
\set pgrst_authenticator_pass '$PGRST_AUTHENTICATOR_PASS'

-- Set the JWT secret in the db - despite it being set in the PGRST_JWT_SECRET
-- env var, this appears to be also required
alter system set pgrst.jwt_secret = :'pgrst_jwt_secret';

begin;

-- Create authenticator and anonymous roles. The authenticator role is used for
-- connecting to the database. Anon is for non-authenticated users. 
create role authenticator noinherit login password :'pgrst_authenticator_pass';
create role anon;
-- Allow the authenticator role to switch to anon.
grant anon to authenticator;

-- Create the default schema. I'd prefer to let the developer create schemas,
-- but PostgREST won't start without at least one schema in PGRST_DB_SCHEMAS.
create schema api;
comment on schema api is 'SuperStack API

Main API schema for the SuperStack application. Contains all database
functions, views, and tables exposed through PostgREST. Designed for use as a
REST API interface, with endpoints documented via Swagger UI. This schema
defines the public contract between the database and clients.';

commit;
