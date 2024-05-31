DO $$
BEGIN
    -- Check if the role exists
    IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'local_readonly') THEN
        -- Create the role with the specified attributes if it does not exist
        PERFORM 1 FROM pg_roles WHERE rolname = 'local_readonly';
        CREATE ROLE local_readonly 
        WITH nosuperuser nocreatedb nocreaterole 
        INHERIT admin dba_group;
    END IF;
END $$;
