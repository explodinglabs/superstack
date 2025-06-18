# This script runs on SuperStack's first startup It prepares the
# database for PostgREST.
set -euo pipefail

echo "🔧 Initialising SuperStack database..." >&2

# Abort if this script has already completed
if [ -f /repo/.iko-initialised ]; then
  echo "Iko already initialised, skipping" >&2
  exit
fi

# Initialise a project
init myapp

# Create the authenticator and anon roles
create_login_role authenticator $PGRST_AUTHENTICATOR_PASS
create_role anon
grant_role_membership authenticator anon

# Create the api schema
create_schema $PGRST_DB_SCHEMAS
comment schema $PGRST_DB_SCHEMAS <<'EOF'
SuperStack API

The api endpoints for the SuperStack application.
EOF

# Deploy and verify changes
deploy --verify

# Touch a file to indicate to SuperStack that Iko has completed its
# initialisation
touch /repo/.iko-initialised

echo "✅ Iko initialisation complete." >&2
