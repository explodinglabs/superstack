-- ============================================================================
-- Logic schema - Internal business logic (never exposed to untrusted clients)
-- ============================================================================

begin;

create schema if not exists logic;
revoke all on schema logic from public;


commit;
