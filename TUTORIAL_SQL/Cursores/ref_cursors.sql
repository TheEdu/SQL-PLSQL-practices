--Ref Cursors
DECLARE
  -- Declaro el tipo de ref cursor 
  -- Va a devolver un registro del tipo producto (solo voy a poder hacer llamadas a SELECT * FROM PRODUCTOS ...)
  TYPE ref_cursor_type IS REF CURSOR RETURN productos%rowtype;
  -- Declaro el ref cursor del tipo declarado arriba (ref_cursor_type)
  rc_productos ref_cursor_type;
  -- Variable en la que voy a alamcenar el contenido fetcheado del cursor
  producto productos%rowtype;
BEGIN
  --Abro y asigno una query al cursor
  OPEN rc_productos FOR
    SELECT productos_ordenados.* 
    FROM( SELECT tbl_p.*
         FROM XXLINK.productos tbl_p
         ORDER BY tbl_p.precio DESC ) productos_ordenados
    WHERE ROWNUM <= 3;
    
  DBMS_OUTPUT.PUT_LINE('Lista de los tres productos mas caros:');
    
  LOOP
    FETCH rc_productos 
    INTO producto;
    EXIT WHEN rc_productos%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(rc_productos%rowcount || '_ ' || producto.descripcion); 
  END LOOP;
    
  CLOSE rc_productos;
END;