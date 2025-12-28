begin;

grant usage on schema api to ar_client;

-- Views

grant select, update on api.identity to ar_client;
grant select on api.organisation to ar_client;
grant select on api.receipt to ar_client;

commit;
