--WHILE LOOP

DECLARE
 condicion BOOLEAN DEFAULT TRUE;
BEGIN
  WHILE condicion LOOP
    DBMS_OUTPUT.PUT_LINE('HOLA Y CHAU!');
    condicion := NOT condicion;
    NULL;
  END LOOP;
  NULL;
END;