-- Cursores genericos anidados
-- listar fechas de venta por vendedor

DECLARE

  rc_cursor_1 SYS_REFCURSOR;
  rc_cursor_2 SYS_REFCURSOR;
  
  l_venta XXLINK.VENTAS%ROWTYPE;
  l_vendedor XXLINK.VENDEDORES%ROWTYPE;


BEGIN

  OPEN rc_cursor_2 FOR
    SELECT tbl_vd.*
    FROM XXLINK.VENDEDORES tbl_vd;
    
  <<VENDEDOR>>
  LOOP 
    FETCH rc_cursor_2 INTO l_vendedor;
    EXIT WHEN rc_cursor_2%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(l_vendedor.nombre);
    
    OPEN rc_cursor_1 FOR
      SELECT tbl_vt.*
      FROM XXLINK.VENTAS tbl_vt
      WHERE TBL_VT.VENDEDOR_ID = l_vendedor.id;
    
    <<VENTA>>  
    LOOP
      FETCH rc_cursor_1 INTO l_venta;
      EXIT WHEN rc_cursor_1%NOTFOUND;
      DBMS_OUTPUT.PUT_LINE(l_venta.fecha);
    END LOOP VENTA;
    
    CLOSE rc_cursor_1;
    
  
  END LOOP VENDEDOR;
  
  CLOSE rc_cursor_2;

EXCEPTION WHEN OTHERS THEN
  DBMS_OUTPUT.PUT_LINE('Ha ocurrido un error:  '||SQLCODE||' -ERROR: '||SQLERRM);
END;