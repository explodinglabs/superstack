#!/bin/zsh
set -e
source ../sqitch-templates/aliases.sh

# Authentication
create-role-authenticator
create-role anon
grant-role-membership authenticator anon
create-schema auth
create-table-auth-user
create-table-auth-refresh-token
create-function-auth-check-role-exists
create-trigger-auth-ensure-user-role-exists
create-extension pgcrypto  # Adds public.crypt function used in auth.encrypt_pass
create-function-auth-encrypt-pass
create-trigger-auth-encrypt-pass
create-extension pgjwt  # Adds public.sign function used in api.jwt_test
create-schema api
create-function-auth-generate-access-token
create-function-api-login
create-function-api-logout
create-function-api-refresh-token
grant-schema-usage api anon
grant-execute api login '(text,text)' anon
grant-execute api logout '()' anon

# Tasks
create-table api task
create-function api task_updated
create-trigger api task task_updated task_updated

# basic_subscriber
create-role basic_subscriber
grant-role-membership authenticator basic_subscriber
grant-schema-usage api basic_subscriber
grant-table-privilege select api task basic_subscriber
grant-table-privilege insert api task basic_subscriber
grant-table-privilege update api task basic_subscriber

# Overwrite some tables and functions that can't be done with aliases
#cp custom-deploy/* deploy/
#cp custom-verify/* verify/
#cp custom-revert/* revert/
