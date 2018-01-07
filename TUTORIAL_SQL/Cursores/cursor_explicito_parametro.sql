DECLARE

CURSOR mostrar_x_vendedores(x NATURAL DEFAULT 100) IS
  SELECT tbl_vd.id AS IDENTIFICADOR, tbl_vd.nombre || ', ' || tbl_vd.apellido AS NOMBRE_COMPLETO
  FROM XXLINK.VENDEDORES tbl_vd
  WHERE ROWNUM < x;

vendedor mostrar_x_vendedores%rowtype;


BEGIN

  OPEN mostrar_x_vendedores();
  LOOP
    FETCH mostrar_x_vendedores 
    INTO vendedor;   
    EXIT WHEN mostrar_x_vendedores%NOTFOUND;  
    DBMS_OUTPUT.PUT_LINE(vendedor.nombre_completo);
  END LOOP;
  
  IF mostrar_x_vendedores%ISOPEN THEN
    CLOSE mostrar_x_vendedores;
  END IF;

END;