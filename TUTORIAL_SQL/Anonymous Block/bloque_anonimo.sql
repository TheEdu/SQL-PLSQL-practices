--Anonymous Block

DECLARE
  numbero NUMBER;
BEGIN
  numbero := 1;
  dbms_output.put_line('Mi numero es:' || numbero);
  NULL;
EXCEPTION
  WHEN OTHERS THEN
    NULL;
END;
--END OUTER BLOCK