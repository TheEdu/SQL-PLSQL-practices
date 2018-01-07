CREATE OR REPLACE
  PROCEDURE update_emp( p_emp_id    IN  NUMBER,
                        p_dept_id       NUMBER DEFAULT 1,
                        p_location  OUT VARCHAR2,
                        p_status IN OUT NUMBER)
  AS
    l_number NUMBER;
  BEGIN
  
    /* No va devolver ninguna ubicacion ya que como es un parametro tipo OUT, 
     se seta en null por defecto (sin importar el valor pasado en la llamada del procedimiento)*/
    DBMS_OUTPUT.PUT_LINE('Out parameter p_location initially ' || p_location);
    DBMS_OUTPUT.PUT_LINE('In Out parameter p_status initially ' || p_status);
    --p_emp_id := 2; --no puedo modificar un parametro de entrada IN
    UPDATE XXLINK.EMPLOYEE tbl_emp
      SET  tbl_emp.emp_dept_id = p_dept_id
      WHERE tbl_emp.emp_id = P_EMP_ID
    RETURNING tbl_emp.emp_loc INTO p_location;
    p_status := 1;
    
    --ERROR GENERADO
    l_number := 'CHAR';
    DBMS_OUTPUT.PUT_LINE('proceso hijo status:' || p_status || ' y location: ' || p_location);
    /*Genero un error  para ver que si se produce un error
      los parametros tipo OUT (pass by value) hacen un "rollback" a sus valores originales 
      -> NULL en casa de l_location porque es solo tipo OUT
      -> -1 (valor declarado en el testing_parameters) en caso de l_status ya que es OUT/IN 
      */
    /*Si decalro los tipos de p_location y p_status como IN OUT + NOCOPY (hint),
      Estos se van a comportar como parametros de Entrada/Salida (pass by References),
      Osea que si se genera un error el valor de esos parametros va a quedar alterado
      dependiendo de las acciones realizada en el procedimiento.
    */
    COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('proceso hijo status:' || p_status || ' y location: ' || p_location);
      /*DBMS_OUTPUT.PUT_LINE(SQLERRM);
      DBMS_OUTPUT.PUT_LINE(DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);*/
      --ROLLBACK;
      RAISE;
  END;
  