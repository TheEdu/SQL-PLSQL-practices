-- CRUD VENDEDORES
-- DELETE VENDEDOR BY DNI
CREATE OR REPLACE PROCEDURE delete_vendedor(p_dni XXLINK.VENDEDORES.DNI%TYPE) 
AS
  CURSOR rc_get_vendedor IS
    SELECT tbl_vd.*
      FROM XXLINK.VENDEDORES tbl_vd
    WHERE tbl_vd.dni = p_dni
    FOR UPDATE NOWAIT;
  
  l_vendedor XXLINK.VENDEDORES%ROWTYPE;

BEGIN
  OPEN rc_get_vendedor;
    FETCH rc_get_vendedor INTO l_vendedor;
    IF rc_get_vendedor%NOTFOUND THEN
      DBMS_OUTPUT.PUT_LINE('No existe un vendedor con ese DNI.');
      DBMS_OUTPUT.PUT_LINE('Ingrese un otro DNI.');
      RETURN;
    ELSE
      DELETE 
      FROM XXLINK.VENDEDORES tbl_vd
      WHERE CURRENT OF rc_get_vendedor;
    END IF;
  CLOSE rc_get_vendedor;
  COMMIT;
  DBMS_OUTPUT.PUT_LINE('Vendedor Eliminado con Exito :)');
EXCEPTION
  WHEN OTHERS THEN
    RAISE;
END;