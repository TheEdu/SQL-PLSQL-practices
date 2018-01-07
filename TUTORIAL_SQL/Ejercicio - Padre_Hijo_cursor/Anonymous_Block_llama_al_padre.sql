DECLARE
BEGIN   
  procedimiento_padre;
EXCEPTION
  WHEN OTHERS THEN
  DBMS_OUTPUT.PUT_LINE('No hago nada :p');
END;