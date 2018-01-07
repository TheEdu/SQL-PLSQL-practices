--Anonymous Block
--SCOPE AND LABEL

--BEGIN OUTER BLOCK
<<parent>> /*Uso un Label para acceder a las variabldes de mi B_ext desdel el B_int
                    Nota: Esto lo hago porque la variables del B_int y el B_ext tienen el mismo nombre */
DECLARE
  nombre varchar2(50) default 'Pedro (Padre)';
  dni varchar2(50) default '11.111.11';
BEGIN
  --BEGIN INNER BLOCK
  DECLARE
    nombre varchar2(50) default 'Tomas (Hijo)' ;
    dni varchar2(50) default '22.222.222';
  BEGIN
    dbms_output.put_line('Hola, yo soy ' || nombre || ' y el nombre de mi padre es ' || parent.nombre);
    dbms_output.put_line('El DNI de ' || nombre || ' es ' || dni);
    null;
  EXCEPTION
    WHEN OTHERS THEN
      dbms_output.put_line('Ha ocurrido un error en el bloque Interno '||SQLCODE||' -ERROR: '||SQLERRM);
  END;
  --END INNER NUMBER  
  --CONTINUE OUTER BLOCK
  dbms_output.put_line('El DNI de ' || nombre || ' es ' || dni);
EXCEPTION
  WHEN OTHERS THEN
    dbms_output.put_line('Ha ocurrido un error en el bloque Externo '||SQLCODE||' -ERROR: '||SQLERRM);  
END;
--END OUTER BLOCK