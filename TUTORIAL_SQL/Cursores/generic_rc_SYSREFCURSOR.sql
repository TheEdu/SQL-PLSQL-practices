--SYS_REFCURSOR es un cursor Weak (sin return type) proporcionado por Oracle
DECLARE

   rc_generico SYS_REFCURSOR;
   
   l_producto XXLINK.PRODUCTOS%ROWTYPE;
   l_vendedor XXLINK.VENDEDORES%ROWTYPE;

BEGIN

  OPEN rc_generico FOR
    SELECT tbl_p.* 
    FROM XXLINK.PRODUCTOS tbl_p;
  
  
  DBMS_OUTPUT.PUT_LINE('-------PRODUCTOS----------');
    
  LOOP
    FETCH rc_generico 
    INTO l_producto;
    EXIT WHEN rc_generico%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(l_producto.descripcion);
  END LOOP;
  
  
  OPEN rc_generico FOR
    SELECT tbl_vd.* 
    FROM XXLINK.VENDEDORES tbl_vd;
  
  
  DBMS_OUTPUT.PUT_LINE('-------VENDEDORES----------');
    
  LOOP
    FETCH rc_generico 
    INTO l_vendedor;
    EXIT WHEN rc_generico%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(l_vendedor.nombre);
  END LOOP;
  
  CLOSE rc_generico;
    
END;  