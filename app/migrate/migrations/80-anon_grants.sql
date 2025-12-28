begin;

-- No need to create the anon role

grant usage on schema api to ar_anon;

-- Allow anon to call refresh_tokens
grant execute on function api.refresh_tokens() to ar_anon;

commit;
