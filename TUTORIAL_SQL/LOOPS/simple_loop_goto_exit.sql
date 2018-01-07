--Simple LOOP

DECLARE
  db_time timestamp with time zone := systimestamp;
BEGIN
  LOOP
    DBMS_OUTPUT.PUT_LINE(db_time);
    GOTO out_of_loop;
  END LOOP;
  <<out_of_loop>>
  NULL; -- Null necesario
END;