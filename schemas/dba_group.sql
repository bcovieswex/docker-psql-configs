DO $$
BEGIN
    -- Check if the role exists
    IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'dba_group') THEN
        -- Create the role with the specified attributes if it does not exist
        PERFORM 1 FROM pg_roles WHERE rolname = 'dba_group';
        CREATE ROLE dba_group
        WITH CREATEDB CREATEROLE INHERIT;
    END IF;
END $$;
