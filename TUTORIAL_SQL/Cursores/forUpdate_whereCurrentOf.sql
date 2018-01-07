-- FOR UPDATE [of columns list] [NOWAIT]
-- Testing WHERE CURRENT OF 

DECLARE

CURSOR productos_mas_caros IS
  SELECT * 
  FROM  XXLINK.PRODUCTOS tbl_p
  WHERE tbl_p.precio > 10000
  FOR UPDATE NOWAIT;

BEGIN
  FOR producto in productos_mas_caros LOOP
  /* -- with WHERE CURRENT OF
    UPDATE XXLINK.PRODUCTOS tbl_p
      SET tbl_p.precio = tbl_p.precio*(1.1)
      WHERE CURRENT OF productos_mas_caros;
  */ 
    --  with out WHERE CURRENT OF
    UPDATE  XXLINK.PRODUCTOS tbl_p
      SET tbl_p.precio = tbl_p.precio*(1.1)
      WHERE tbl_p.precio = producto.precio; -- tengo que repetir la condicion del cursor
  END LOOP;
  COMMIT;
EXCEPTION WHEN OTHERS THEN
  DBMS_OUTPUT.PUT_LINE('Ha ocurrido un error:  '||SQLCODE||' -ERROR: '||SQLERRM);
END;