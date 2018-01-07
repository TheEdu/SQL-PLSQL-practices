--CRUD XXLINK.VENDEDORES
--CREATE
CREATE OR REPLACE PROCEDURE create_vendedor(p_nombre IN xxlink.vendedores.nombre%type, 
                                            p_apellido IN xxlink.vendedores.apellido%type, 
                                            p_departamento IN xxlink.departamentos.nombre%type, 
                                            p_dni IN xxlink.vendedores.dni%type)
AS
  CURSOR cr_get_id_dept IS
    SELECT tbl_dpt.ID
      FROM XXLINK.DEPARTAMENTOS tbl_dpt
    WHERE tbl_dpt.NOMBRE = p_departamento;
    
  -- Cursor generico para traer y validad el dni
  rc_generico SYS_REFCURSOR;
    
  l_id_dept XXLINK.VENDEDORES.ID%TYPE;
  
  l_dni_test XXLINK.VENDEDORES.DNI%TYPE;
  
  -- Edu WAY!
  --l_dummy_vendedor_id NUMBER DEFAULT 999999999999;

  l_id_vendedor XXLINK.VENDEDORES.ID%TYPE DEFAULT create_vendedor_seq.nextval;
BEGIN


-- VALIDACION DE QUE SE HAYA INGRESADO UN DNI, NOMBRE Y APELLIDO
  IF ((p_dni IS NULL)  OR (p_nombre IS NULL) OR (p_apellido IS NULL)) THEN
    DBMS_OUTPUT.PUT_LINE('Ingrese un valor de DNI!');
    RETURN;
  ELSE
  -- VALIDACION DE QUE EL DNI NO ESTE REPETIDO
    OPEN rc_generico FOR
      SELECT tbl_vd.dni
        FROM XXLINK.VENDEDORES tbl_vd
      WHERE tbl_vd.dni = p_dni;
    FETCH rc_generico INTO l_dni_test;
    CLOSE rc_generico;
    
    IF l_dni_test IS NOT NULL THEN
      DBMS_OUTPUT.PUT_LINE('Ingrese un valor de DNI (no repetido)!');
      RETURN;
    END IF;
  END IF;
-- FIN VALIDACIONES

-- Conseguir ID departamento en base al nombre de departamento ingresado
  OPEN cr_get_id_dept;
    FETCH cr_get_id_dept INTO l_id_dept;
    IF cr_get_id_dept%NOTFOUND THEN
      DBMS_OUTPUT.PUT_LINE('Ingrese un Nombre de DEPARTAMENTO valido!');
      RETURN;
      NULL;
    END IF;
  CLOSE cr_get_id_dept;
  
-- Insertar Nuevo Registro en la tabla de Vendedores
  INSERT INTO XXLINK.VENDEDORES(id, NOMBRE, APELLIDO, DEPARTAMENTO_ID, dni)
    VALUES(l_id_vendedor,/*Edu WAY! --> l_dummy_vendedor_id,*/
           p_nombre, 
           p_apellido,
           l_id_dept,
           p_dni);
  
  /* Edu WAY!
  UPDATE XXLINK.VENDEDORES tbl_vd
    SET tbl_vd.id =  CREATE_VENDEDOR_seq.nextval
  WHERE tbl_vd.id = l_dummy_vendedor_id;
  */  
  
-- Confirmacion de los cambios  
  COMMIT;
  DBMS_OUTPUT.PUT_LINE('Vendedor Creado con Exito! :)');
  
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
    DBMS_OUTPUT.PUT_LINE(DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
    RAISE;
END;