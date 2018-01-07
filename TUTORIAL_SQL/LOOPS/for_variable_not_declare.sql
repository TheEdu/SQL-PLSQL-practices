-- La variable de loopeo del for no se necesita declarar
DECLARE
BEGIN
  FOR counter in 1..3 LOOP
    DBMS_OUTPUT.PUT_LINE(counter);
    NULL;
  END LOOP;
END;