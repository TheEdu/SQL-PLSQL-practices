--Assigning a ref cursor to another ref cursor (Mismo ejercicio de ref_cursors.sql)
DECLARE
  TYPE ref_cursor_type IS REF CURSOR RETURN productos%rowtype;
  
  -- Declaro los ref cursors del tipo declarado arriba (ref_cursor_type)
  rc_productos_1 ref_cursor_type;
  rc_productos_2 ref_cursor_type;
  
  -- Variable en la que voy a alamcenar el contenido fetcheado del cursor
  producto productos%rowtype;
  
BEGIN
  --Abro y asigno una query al cursor
  OPEN rc_productos_1 FOR
    SELECT productos_ordenados.* 
    FROM( SELECT tbl_p.*
         FROM XXLINK.productos tbl_p
         ORDER BY tbl_p.precio DESC ) productos_ordenados
    WHERE ROWNUM <= 3;
    
  DBMS_OUTPUT.PUT_LINE('Lista de los tres productos mas caros:');
  
  rc_productos_2 := rc_productos_1;
    
  LOOP
    FETCH rc_productos_2 
    INTO producto;
    EXIT WHEN rc_productos_2%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(rc_productos_2%rowcount || '_ ' || producto.descripcion); 
  END LOOP;
  
  
  DBMS_OUTPUT.PUT_LINE(rc_productos_1%rowcount); -- los dos cursores avanzaron hasta el ultimo registro con el fetch del cursor 2
  CLOSE rc_productos_2;
END;