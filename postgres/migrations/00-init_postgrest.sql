-- Set the JWT secret in the db. This is required by Postgrest. This is a
-- non-transactional statement, it cannot go inside the below transaction.
alter system set pgrst.jwt_secret = '$PGRST_JWT_SECRET';

begin;

create role authenticator noinherit login password '$PGRST_AUTHENTICATOR_PASS';
create role anon;
grant anon to authenticator;
create schema api;
comment on schema api is 'SuperStack API

Main API schema for the SuperStack application. Contains all database
functions, views, and tables exposed through PostgREST. Designed for use as a
REST API interface, with endpoints documented via Swagger UI. This schema
defines the public contract between the database and clients.';

commit;
