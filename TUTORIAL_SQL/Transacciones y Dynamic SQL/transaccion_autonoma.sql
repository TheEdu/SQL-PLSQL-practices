
/*
  Las transacciones autonomas son trasnsacciones independientes
  declarada dentro de un trasaccion padre.
  
  Las transsacciones autonomas no son afectadas por los commit,
  ni los rollback, ni los savepoints generados en la transaccion padre
  
  las transacciones autonomas son PRAGMA directives --> directivas al compilador.
  
  Su principal uso es para generar LOG´s

*/

CREATE OR REPLACE PROCEDURE AutoTrans_LOG_TEST(p_id EDU_TEST_AUTO_TANSC.AT_ID%TYPE) 
AS
PRAGMA AUTONOMOUS_TRANSACTION;
l_msg VARCHAR2(400) DEFAULT 'Test';

BEGIN
  INSERT INTO EDU_LOG_TABLE(log_id,
                        log_at_id,
                        log_msg,
                        log_inset_time)
                  VALUES(XXLINK.edu_log_seq.NEXTVAL,
                        p_id,
                        l_msg,
                        systimestamp);
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Ha ocurrido un Error');
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
    DBMS_OUTPUT.PUT_LINE(DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
   ROLLBACK;
END;
/


/*


 CREATE SEQUENCE edu_log_seq
  MINVALUE 1 
  MAXVALUE 9999999999999999999999999999 
  INCREMENT BY 1 
  START WITH 1 
  NOCYCLE ;
 
*/
