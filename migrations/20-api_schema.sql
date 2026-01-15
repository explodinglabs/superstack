-- ============================================================================
-- API schema - Public surface (views and RPC functions) exposed to untrusted
-- clients
-- ============================================================================

begin;

create schema api;
revoke all on schema api from public;

-- RPC


-- Views



commit;
