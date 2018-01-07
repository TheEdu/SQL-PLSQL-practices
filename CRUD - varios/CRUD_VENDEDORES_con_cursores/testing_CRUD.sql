--TEST CRUD VENDEDORES
DECLARE
  l_dni XXLINK.VENDEDORES.DNI%TYPE default '22.222.222';
BEGIN

  DBMS_OUTPUT.PUT_LINE('********************************************');  
  list_vendedores();
  DBMS_OUTPUT.PUT_LINE('********************************************');
  
  DBMS_OUTPUT.PUT_LINE('');
  
  create_vendedor('Cristian','Olivera','deportivo','77.777.777');
  DBMS_OUTPUT.PUT_LINE('********************************************');  
  list_vendedores();
  DBMS_OUTPUT.PUT_LINE('********************************************');
  
  DBMS_OUTPUT.PUT_LINE('');
  
  update_vendedor(p_dni => l_dni,
                p_nombre => 'Tito',
                p_apellido => 'Fernandez'
                /*,p_departamento => 1 -- Por defecto vale 1*/);
  DBMS_OUTPUT.PUT_LINE('********************************************');  
  list_vendedores();
  DBMS_OUTPUT.PUT_LINE('********************************************');
  
  DBMS_OUTPUT.PUT_LINE('');
  
  
  delete_vendedor('77.777.777');              
  DBMS_OUTPUT.PUT_LINE('********************************************');  
  list_vendedores();
  DBMS_OUTPUT.PUT_LINE('********************************************');
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
    DBMS_OUTPUT.PUT_LINE(DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
    RAISE;
END;