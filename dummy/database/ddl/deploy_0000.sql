--
--  database
--
CREATE DATABASE dummy;


--
--  role
--
DO
$$
BEGIN
	IF NOT EXISTS (SELECT * FROM pg_catalog.pg_user WHERE usename = 'dummy_ro') THEN
		CREATE ROLE dummy_ro LOGIN;
	END IF;
	IF NOT EXISTS (SELECT * FROM pg_catalog.pg_user WHERE usename = 'dummy_rw') THEN
		CREATE ROLE dummy_rw LOGIN;
	END IF;
	IF NOT EXISTS (SELECT * FROM pg_catalog.pg_user WHERE usename = 'dummy_adm') THEN
		CREATE ROLE dummy_adm LOGIN;
	END IF;
END
$$;

--
--  service accounts
--
DO
$$
BEGIN
    IF NOT EXISTS (SELECT * FROM pg_catalog.pg_user WHERE usename = 'svcjava') THEN
        CREATE USER svcjava PASSWORD 'default';
    END IF;

    IF NOT EXISTS (SELECT * FROM pg_catalog.pg_user WHERE usename = 'svcjasper') THEN
        CREATE USER svcjasper PASSWORD 'reports';
    END IF;
END
$$;


GRANT dummy_rw TO svcjava;
GRANT dummy_adm TO postgres;
GRANT dummy_ro TO svcjasper;


--
--  schema
--
\connect dummy
--  Do not create public schema.  It already exists.
GRANT ALL ON SCHEMA public TO dummy_adm WITH GRANT OPTION;


--  Keep schema is used for undo.
CREATE SCHEMA IF NOT EXISTS keep;
GRANT ALL ON SCHEMA keep TO dummy_adm WITH GRANT OPTION;
