DO $$
BEGIN
    -- Check if the user exists
    IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'dev') THEN
        -- Create the user with specific attributes if it does not exist
        CREATE ROLE dev WITH LOGIN NOSUPERUSER NOCREATEDB NOCREATEROLE INHERIT;

        -- Set the user's password and validity
        ALTER ROLE dev WITH ENCRYPTED PASSWORD 'dev' VALID UNTIL 'infinity';

        -- Grant the user membership to the application group
        GRANT zina TO dev;

        -- Grant the user connect permission on the specified database
        GRANT CONNECT ON DATABASE dev TO dev;
    END IF;
END $$;