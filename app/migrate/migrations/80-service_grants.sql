begin;

-- Single trusted backend role
grant usage on schema api to ar_service;

-- RPC

grant execute on function api.generate_tokens(bigint, text) to ar_service;

grant usage, select on sequence auth.identity_id_seq to ar_service;
grant usage, select on sequence core.organisation_id_seq to ar_service;
grant usage, select on sequence core.invoice_id_seq to ar_service;
grant usage, select on sequence core.payment_id_seq to ar_service;
grant usage, select on sequence core.receipt_id_seq to ar_service;
grant usage, select on sequence core.receipt_attempt_id_seq to ar_service;

-- Views

-- Identity
grant select, insert, update on api.identity_service to ar_service;
-- Organisation
grant select, insert, update on api.organisation_service to ar_service;
grant select on api.organisation_tokens_service to ar_service;
-- Invoice
grant select, insert, update on api.invoice_write_service to ar_service;
-- Payment
grant select on api.payment_service to ar_service;
grant select, insert, update on api.payment_write_service to ar_service;
grant select on api.unreceipted_payment_service to ar_service;
-- Receipt
grant select on api.receipt_service to ar_service;
grant select, insert, update on api.receipt_write_service to ar_service;
-- Receipt attempt
grant select, insert, update on api.receipt_attempt_service to ar_service;

-- Job
/*
grant usage, select on sequence jobs.job_id_seq to ar_service;
grant select, insert, update on api.job_service to ar_service;
*/

commit;
