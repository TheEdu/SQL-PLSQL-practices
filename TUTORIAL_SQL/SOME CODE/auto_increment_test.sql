-- borrar tabla
drop table edu_test;

--  backup tabla
create table empleado_backup 
as select * from empleado;

-- crear secuencia
 create sequence empleado_backup_seq
  start with 1
  increment by 2
  maxvalue 99999999999
  minvalue 1
  nocycle;
  
-- inicializar secuencia
select empleado_backup_seq.nextval from dual;

--insertar registro en la tabla  
INSERT INTO EMPLEADO_BACKUP emp
(emp.EMPLEADO_ID, emp.APELLIDO_MATERNO,emp.APELLIDO_PATERNO,emp.NOMBRE) 
VALUES(empleado_backup_seq.nextval, 'Gambin','Denis','Edu');
  
  
-- test auto increment by sequqences and triggers

    -- creo tabla de prueba
    CREATE TABLE  edu_test
      (
      ID         INT    NOT NULL,
      something  VARCHAR2(50)  NOT NULL
      );
      
    --  agrego fk 
    ALTER TABLE edu_test ADD (
      CONSTRAINT edu_constraint PRIMARY KEY (ID));
    
    -- creo la secuencia
    CREATE SEQUENCE edu_test_seq
      increment by 2
      maxvalue 99999999999
      minvalue 1
      nocycle;
    
    -- creo un trigger para disparar la secuencia cuando se inserta un registro
    CREATE OR REPLACE TRIGGER edu_test_trigger 
    BEFORE INSERT ON edu_test 
    FOR EACH ROW
    DECLARE
       id_num INT;
    BEGIN
      SELECT  edu_test_seq.NEXTVAL 
      INTO   id_num
      FROM   dual; 
      :new.id := id_num;
    END;
    
    -- inserto dato de prueba
    insert into  edu_test(something) 
    values ('lololo');
    
    -- muestro la tabla
    select ID ,SOMETHING  
    from  edu_test;
    
    

    
    
    
    
    
  
  
  

