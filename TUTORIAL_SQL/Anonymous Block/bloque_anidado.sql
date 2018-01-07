--Anonymous Block
--BEGIN OUTER BLOCK
DECLARE
BEGIN
  --BEGIN INNER BLOCK
  DECLARE
    inner_number NUMBER;
  BEGIN
    inner_number := 2;
    --Genero un excepcion para disparar el handler de la misma
    inner_number := inner_number / 0;
    dbms_output.put_line('Hola soy el Bloque Interior!');
  EXCEPTION
    WHEN OTHERS THEN
      --Maneja todas las excepciones
      /*Notifica el numero del error y su correspondiente mensaje
      y continua la ejecucion del bloque externo */
      dbms_output.put_line('Ha ocurrido un error en el bloque Interno '||SQLCODE||' -ERROR: '||SQLERRM);
  END;
  --END INNER NUMBER
  --CONTINUE OUTER BLOCK
  dbms_output.put_line('Soy el Bloque Externo!');
EXCEPTION
  WHEN OTHERS THEN
    dbms_output.put_line('Ha ocurrido un error en el bloque Externo '||SQLCODE||' -ERROR: '||SQLERRM);  
END;
--END OUTER BLOCK