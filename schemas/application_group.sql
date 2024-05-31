DO $$
BEGIN
    -- Check if the role exists
    IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'application_group') THEN
        -- Create the role with the specified attributes if it does not exist
        PERFORM 1 FROM pg_roles WHERE rolname = 'application_group';
        CREATE ROLE application_group 
        WITH nosuperuser nocreatedb nocreaterole 
        INHERIT admin dba_group;
    END IF;
END $$;
