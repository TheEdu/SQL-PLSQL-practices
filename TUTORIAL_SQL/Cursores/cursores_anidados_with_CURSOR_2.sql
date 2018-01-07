--Ejercicio de cursores anidados
--Listado de Vendedodes por Departamento


<<main_block>>
DECLARE
  CURSOR rc_departamentos IS
    SELECT tbl_dept.nombre,
           CURSOR(
           SELECT *
           FROM XXLINK.VENDEDORES tbl_vd
           WHERE tbl_vd.departamento_id =  tbl_dept.id
            ) AS cursor_query
     FROM XXLINK.DEPARTAMENTOS tbl_dept;
     
  rc_vendedores SYS_REFCURSOR;
  
  l_dept_name XXLINK.DEPARTAMENTOS.NOMBRE%type;
  l_vendedor XXLINK.VENDEDORES%rowtype;
BEGIN
  OPEN rc_departamentos;
  LOOP
    FETCH rc_departamentos INTO l_dept_name, rc_vendedores;
    EXIT WHEN rc_departamentos%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('DEPARTAMENTO: ' || l_dept_name);
    LOOP
      FETCH rc_vendedores INTO l_vendedor;
      EXIT WHEN rc_vendedores%NOTFOUND;
      DBMS_OUTPUT.PUT_LINE('   ' || l_vendedor.nombre);
    END LOOP;
  END LOOP;  
EXCEPTION WHEN OTHERS THEN
  DBMS_OUTPUT.PUT_LINE('Ha ocurrido un error:  '||SQLCODE||' -ERROR: '||SQLERRM);
END;