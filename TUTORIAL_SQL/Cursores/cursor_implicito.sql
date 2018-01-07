--Cursores Implicitos

DECLARE
  producto XXLINK.PRODUCTOS%rowtype;
BEGIN
  SELECT *
  INTO producto
  FROM XXLINK.PRODUCTOS tbl_p
  WHERE tbl_p.id = 3;
  
  IF sql%FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Cantidad de registros fetcheados: ' || sql%ROWCOUNT);
    DBMS_OUTPUT.PUT_LINE('ID: ' || producto.id || ', Descripcion: ' || producto.descripcion || ', Precio: ' || producto.precio); 
  END IF;
  
EXCEPTION WHEN OTHERS THEN
  DBMS_OUTPUT.PUT_LINE('Cantidad de registros fetcheados: ' || sql%ROWCOUNT);
  DBMS_OUTPUT.PUT_LINE('Ha ocurrido un error:  '||SQLCODE||' -ERROR: '||SQLERRM);
END;
