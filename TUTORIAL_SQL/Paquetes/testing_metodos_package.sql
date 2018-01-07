
--TEST CRUD VENDEDORES  (IN PACKAGE)
DECLARE
  l_dni XXLINK.VENDEDORES.DNI%TYPE default '22.222.222';
  l_nombre XXLINK.VENDEDORES.NOMBRE%TYPE;
BEGIN


  DBMS_OUTPUT.PUT_LINE('********************************************'); 
  SELECT tbl_vd.nombre INTO l_nombre FROM XXLINK.VENDEDORES tbl_vd WHERE tbl_vd.dni = l_dni; 
  DBMS_OUTPUT.PUT_LINE(l_nombre);
  VENDEDOR_PKG.calc_sueldo_vendedor(l_dni);
  DBMS_OUTPUT.PUT_LINE('********************************************');  
  DBMS_OUTPUT.PUT_LINE('');
  DBMS_OUTPUT.PUT_LINE('');

  DBMS_OUTPUT.PUT_LINE('********************************************');  
  VENDEDOR_PKG.list_vendedores();
  DBMS_OUTPUT.PUT_LINE('********************************************');
  
  DBMS_OUTPUT.PUT_LINE('');
  
  VENDEDOR_PKG.create_vendedor('Cristian','Olivera','deportivo','77.777.777');
  DBMS_OUTPUT.PUT_LINE('********************************************');  
  VENDEDOR_PKG.list_vendedores();
  DBMS_OUTPUT.PUT_LINE('********************************************');
  
  DBMS_OUTPUT.PUT_LINE('');
  
  VENDEDOR_PKG.update_vendedor(p_dni => l_dni,
                p_nombre => 'Tito',
                p_apellido => 'Fernandez'
                /*,p_departamento => 1 -- Por defecto vale 1*/);
  DBMS_OUTPUT.PUT_LINE('********************************************');  
  VENDEDOR_PKG.list_vendedores();
  DBMS_OUTPUT.PUT_LINE('********************************************');
  
  DBMS_OUTPUT.PUT_LINE('');
  
  
  VENDEDOR_PKG.delete_vendedor('77.777.777');              
  DBMS_OUTPUT.PUT_LINE('********************************************');  
  VENDEDOR_PKG.list_vendedores();
  DBMS_OUTPUT.PUT_LINE('********************************************');
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
    DBMS_OUTPUT.PUT_LINE(DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
    RAISE;
END;
