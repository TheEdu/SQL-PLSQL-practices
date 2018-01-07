CREATE OR REPLACE PROCEDURE update_vendedor(p_dni IN XXLINK.VENDEDORES.DNI%TYPE,
                                            p_nombre IN XXLINK.VENDEDORES.NOMBRE%TYPE DEFAULT 'NULL_BY_DEFAULT',
                                            P_apellido IN XXLINK.VENDEDORES.APELLIDO%TYPE DEFAULT 'NULL_BY_DEFAULT',
                                            p_departamento IN XXLINK.DEPARTAMENTOS.NOMBRE%TYPE DEFAULT 'NULL_BY_DEFAULT')
AS

  CURSOR rc_get_registro_by_dni IS
    SELECT tbl_vd.*
      FROM XXLINK.VENDEDORES tbl_vd
    WHERE tbl_vd.dni = p_dni
  FOR UPDATE NOWAIT;
  
  l_vendedor  XXLINK.VENDEDORES%ROWTYPE;
  
  l_nombre XXLINK.VENDEDORES.NOMBRE%TYPE;
  l_apellido XXLINK.VENDEDORES.APELLIDO%TYPE;
  l_departamento XXLINK.DEPARTAMENTOS.NOMBRE%TYPE;
  
    
    
BEGIN

  OPEN rc_get_registro_by_dni;
    FETCH rc_get_registro_by_dni INTO l_vendedor;
    
    --Validar existencia registro 
    IF rc_get_registro_by_dni%NOTFOUND THEN
      DBMS_OUTPUT.PUT_LINE('El DNI: ' || p_dni || ' no corresponde a ningun vendedor. Ingrese un DNI VALIDO!');
    ELSE
      -- Si existe el regsitro, LO ACTUALIZO!! (con el where current of correspondiente al cursor)
      IF p_nombre = 'NULL_BY_DEFAULT' THEN
        l_nombre := l_vendedor.nombre;
      ELSE
        l_nombre := p_nombre;
      END IF;
      
      IF p_apellido = 'NULL_BY_DEFAULT' THEN
        l_apellido := l_vendedor.apellido;
      ELSE
        l_apellido := p_apellido;
      END IF;
      
      IF p_departamento = 'NULL_BY_DEFAULT' THEN
        l_departamento := l_vendedor.departamento_id;
      ELSE
        l_departamento := p_departamento;
      END IF;
      
      UPDATE XXLINK.VENDEDORES tbl_vd
        SET tbl_vd.nombre = l_nombre,
            tbl_vd.apellido = l_apellido,
            tbl_vd.departamento_id = l_departamento
        WHERE CURRENT OF rc_get_registro_by_dni;
        
      -- Confirmo los cambios;
      COMMIT;
      DBMS_OUTPUT.PUT_LINE('Vendedor Actualizado! :)');
    END IF;
  CLOSE rc_get_registro_by_dni;
  RETURN;
  
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
    DBMS_OUTPUT.PUT_LINE(DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
    RAISE;
END;