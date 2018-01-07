-- imprimir todos los registros de la tabla Customers
-- select * from tabla, version store procedure

DECLARE 
   -- longitud de la tabla
   longitud_tabla NUMBER;
   --loop var
   customer_id customers.id%type;
   -- datos de la tabla 
   c_name  customers.name%type; 
   c_addr customers.address%type; 
   c_sal  customers.salary%type; 
BEGIN 
  -- seteo la longitud de la tabla
  SELECT count(*) INTO longitud_tabla FROM customers;
  
  -- loop
  FOR customer_id IN 1..longitud_tabla LOOP
    --seteo las variables con los datos
    SELECT custm.NAME, custm.ADDRESS, custm.SALARY 
    INTO c_name, c_addr, c_sal 
    FROM customers custm 
    WHERE custm.id = customer_id;
    
    -- imprimo los variables seteadas
    
    dbms_output.put_line 
    ('Customer ' ||c_name || ' from ' || c_addr || ' earns ' || c_sal);
    
    dbms_output.put_line 
    ('-----------------------------------------------------------');
    
  END LOOP;
END; 


select * from CUSTOMERS;

