--Defining Sub Types

DECLARE
  SUBTYPE MY_FAVORITE_NUMBER_TYPE IS NUMBER(1,0) NOT NULL;
  numero MY_FAVORITE_NUMBER_TYPE DEFAULT 1;
BEGIN
  dbms_output.put_line('Mi Numero es: ' || numero);
  
  numero := 10; --Genero un error
EXCEPTION
  WHEN OTHERS THEN
    dbms_output.put_line('Ha ocurrido un error en el bloque Externo '||SQLCODE||' -ERROR: '||SQLERRM);  
END;