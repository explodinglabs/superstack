\set pgrst_jwt_secret '$PGRST_JWT_SECRET'
\set pgrst_authenticator_pass '$PGRST_AUTHENTICATOR_PASS'

begin;

create role authenticator noinherit login password :'pgrst_authenticator_pass';
create role anon;
grant anon to authenticator;
create schema api;
comment on schema api is 'SuperStack API

Main API schema for the SuperStack application. Contains all database
functions, views, and tables exposed through PostgREST. Designed for use as a
REST API interface, with endpoints documented via Swagger UI. This schema
defines the public contract between the database and clients.';

commit;

-- Non-transactional statements

-- Set the JWT secret in the db - this is required by Postgrest. This is a
-- non-transactional statement, it cannot go inside the below transaction.
alter system set pgrst.jwt_secret = :'pgrst_jwt_secret';
