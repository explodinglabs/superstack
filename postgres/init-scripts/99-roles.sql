DO
$$
DECLARE
  pwd TEXT;
BEGIN
  -- Get the password from PostgreSQL settings
  pwd := current_setting('custom.authenticator_password', true);

  -- Check if the role exists before creating it
  IF NOT EXISTS (SELECT FROM pg_roles WHERE rolname = 'authenticator') THEN
    EXECUTE format('CREATE ROLE authenticator WITH LOGIN PASSWORD %L', pwd);
  END IF;
END
$$;
