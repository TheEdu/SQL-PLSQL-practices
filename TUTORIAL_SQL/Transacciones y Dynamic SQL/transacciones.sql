/*

Starting and Ending a Transaction
A transaction has a beginning and an end. A transaction starts when one of the following events take place ?

   --> The first SQL statement is performed after connecting to the database.
    
   --> At each new SQL statement issued after a transaction is completed.

A transaction ends when one of the following events take place ?

    --> A COMMIT or a ROLLBACK statement is issued.

    --> A DDL statement, such as CREATE TABLE statement, is issued; because in that case a COMMIT is automatically performed.

    --> A DCL statement, such as a GRANT statement, is issued; because in that case a COMMIT is automatically performed.

    --> User disconnects from the database.

    --> User exits from SQL*PLUS by issuing the EXIT command, a COMMIT is automatically performed.

    --> SQL*Plus terminates abnormally, a ROLLBACK is automatically performed.

    --> A DML statement fails; in that case a ROLLBACK is automatically performed for undoing that DML statement.


*/

-- DDL auto commit

INSERT INTO XXLINK.EDU_ITEMS(ITEM_ID,ITEM_NAME,ITEM_VALUE)
      VALUES(222,'BEFORE_CREATE_TABLE_FAIL_test',11.11);
      
ROLLBACK;

CREATE TABLE EDU_CREATE_AUTO_COMMIT_TEST(
  id NUMBER PRIMARY KEY
);


/*

  Savepoints are sort of markers that help in splitting a long transaction into smaller units by setting some checkpoints.
  By setting savepoints within a long transaction, you can roll back to a checkpoint if required. 
  This is done by issuing the SAVEPOINT command.

*/

-- Test SAVEPOINT

INSERT INTO XXLINK.EDU_ITEMS(ITEM_ID,ITEM_NAME,ITEM_VALUE)
      VALUES(4,'ROLLBACK_test',11.11);
      
SAVEPOINT test_save;

-- Despues de de ir al savepoint se va a perder este cambio
INSERT INTO XXLINK.EDU_ITEMS(ITEM_ID,ITEM_NAME,ITEM_VALUE)
      VALUES(5,'IN_SAVEPOINT_test',11.11);
      
ROLLBACK TO SAVEPOINT test_save;


INSERT INTO XXLINK.EDU_ITEMS(ITEM_ID,ITEM_NAME,ITEM_VALUE)
      VALUES(6,'OUT_SAVEPOINT_test',11.11);


COMMIT;


/* ********************************************************** */
/*

  To execute a COMMIT automatically whenever an INSERT, UPDATE or 
  DELETE command is executed, you can set the AUTOCOMMIT 
  environment variable as ?
   
  --> SET AUTOCOMMIT ON; 
  
  You can turn-off the auto commit mode using the following command ?

  --> SET AUTOCOMMIT OFF;
  
*/
/* ********************************************************** */



