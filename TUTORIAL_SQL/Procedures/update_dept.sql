CREATE OR REPLACE PROCEDURE XXLINK.update_dept AS
  l_emp_id XXLINK.EMPLOYEE.EMP_ID%type := 10;
BEGIN
  UPDATE  XXLINK.EMPLOYEE tbl_emp
    SET TBL_EMP.EMP_DEPT_ID = 2
  WHERE TBL_EMP.EMP_ID = l_emp_id;
  DBMS_OUTPUT.PUT_LINE('Termine con Exito!');
  DBMS_OUTPUT.PUT_LINE('ROWS actualizadas:' || SQL%ROWCOUNT);
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
    DBMS_OUTPUT.PUT_LINE(DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
    ROLLBACK;
    RAISE; -- envia el error a la aplicacion!
END;