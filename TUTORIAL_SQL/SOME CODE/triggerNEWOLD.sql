drop table test_new_and_old;

CREATE TABLE test_new_and_old
  (
    id INT NOT NULL PRIMARY KEY,
    name  VARCHAR2(50)  NOT NULL,
    old_new INT DEFAULT(0)
    );
        
INSERT into test_new_and_old(id,name,old_new)
VALUES (1,'Pedro',2000);

INSERT into test_new_and_old(id,name,old_new)
VALUES (2,'Gaston',4000);


    CREATE OR REPLACE TRIGGER edu_test_new_old
    BEFORE UPDATE ON test_new_and_old 
    FOR EACH ROW
    DECLARE
       diferencia INT;
    BEGIN
      diferencia := :new.old_new - :old.old_new;
      dbms_output.put_line('  Viejo:  ' || :old.old_new);
      dbms_output.put_line('  Nuevo:  ' || :new.old_new);
      dbms_output.put_line('  Diferencia:  ' || diferencia);
    END;
    
    
    UPDATE test_new_and_old 
    SET OLD_NEW= 2000
    WHERE ID = 1;
    