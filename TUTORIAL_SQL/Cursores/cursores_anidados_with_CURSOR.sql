--Cursores Anidados en la declaracion
--Simulacion del INNER-JOIN (Ventas,Productos y Vendedores) mediante el uso de cursoresanidados en la declaracion el cursor Explicito

DECLARE
  CURSOR my_cursor IS
    SELECT tbl_vt.FECHA,
            CURSOR(SELECT tbl_vd.* FROM XXLINK.VENDEDORES tbl_vd WHERE TBL_VD.id = TBL_VT.VENDEDOR_ID),
            CURSOR(SELECT tbl_p.* FROM XXLINK.PRODUCTOS tbl_p WHERE TBL_P.id = TBL_VT.PRODUCTO_ID)
    FROM XXLINK.VENTAS tbl_vt
    ORDER BY TBL_VT.FECHA ASC;
    
    l_venta_fecha XXLINK.VENTAS.FECHA%type;
    rc_vendedor_name SYS_REFCURSOR;
    rc_producto_desc SYS_REFCURSOR;
    
    l_vendedor XXLINK.VENDEDORES%rowtype;
    l_producto XXLINK.PRODUCTOS%rowtype;

BEGIN

  OPEN my_cursor;
  LOOP
    FETCH my_cursor INTO l_venta_fecha, rc_vendedor_name,rc_producto_desc;
    EXIT WHEN my_cursor%NOTFOUND;
    
    FETCH rc_vendedor_name INTO l_vendedor;
    FETCH rc_producto_desc INTO l_producto;

    DBMS_OUTPUT.PUT_LINE('FECHA: ' || l_venta_fecha || ', VENDEDOR: ' || l_vendedor.nombre || ', ' || l_vendedor.apellido ||'. PRODUCTO: ' || l_producto.descripcion);
  END LOOP;
  CLOSE my_cursor;
END;