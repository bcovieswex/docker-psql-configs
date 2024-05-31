DO $$
BEGIN
    -- Check if the role exists
    IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'usr_group ') THEN
        -- Create the role with the specified attributes if it does not exist
        PERFORM 1 FROM pg_roles WHERE rolname = 'usr_group ';
        CREATE ROLE usr_group 
        WITH nosuperuser nocreatedb nocreaterole 
        INHERIT admin dba_group;
    END IF;
END $$;
