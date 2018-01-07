--Cursor Explicito
--Recorro toda la tabla utilizando un cursor y GOTO

DECLARE

  CURSOR cursor_to_producto IS
    SELECT tbl_p.*
    FROM XXLINK.PRODUCTOS tbl_p
    ;--WHERE tbl_p.id = 3;  

  producto XXLINK.PRODUCTOS%rowtype;
  
BEGIN
  
  OPEN cursor_to_producto;
  <<seguir_fetcheando>>
  FETCH cursor_to_producto 
    INTO producto;
  
  IF cursor_to_producto%FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Cantidad de registros fetcheados: ' || cursor_to_producto%ROWCOUNT);
    DBMS_OUTPUT.PUT_LINE('ID: ' || producto.id || ', Descripcion: ' || producto.descripcion || ', Precio: ' || producto.precio); 
    GOTO seguir_fetcheando;  
  END IF;
    
  CLOSE cursor_to_producto;
  
EXCEPTION WHEN OTHERS THEN
  DBMS_OUTPUT.PUT_LINE('Cantidad de registros fetcheados: ' || cursor_to_producto%ROWCOUNT);
  DBMS_OUTPUT.PUT_LINE('Ha ocurrido un error:  '||SQLCODE||' -ERROR: '||SQLERRM);
END;
