CREATE OR REPLACE PACKAGE BODY CRUD_SOMETHING AS  
   
   PROCEDURE create_something(s_desc SOMETHING_CRUD.DESCRIPTION%type,
   s_price SOMETHING_CRUD.PRICE%type) 
   IS 
   s_id SOMETHING_CRUD.ID%type;
   dummy SOMETHING_CRUD.ID%type;
   BEGIN
   
      --seteo el s_id desde el something_seq.CURRVAL
      SELECT something_seq.CURRVAL INTO s_id FROM dual;
      
      --cargo los valores
      INSERT INTO SOMETHING_CRUD s_tbl
      (s_tbl.ID,s_tbl.DESCRIPTION,s_tbl.PRICE)
      VALUES (s_id,s_desc,s_price);
      
      --avanzo la secuencia del id
      SELECT something_seq.NEXTVAL INTO dummy FROM dual;
   
      dbms_output.put_line('something created: ' || 'id:' || s_id || ', description: '
                            || s_desc || ', price: ' || s_price
                            ); 
   END create_something;
   
   PROCEDURE read_something
   IS
    min_id NUMBER;
    max_id NUMBER;
    s_id_value NUMBER default -1;
    
    s_id SOMETHING_CRUD.ID%TYPE;
    s_desc SOMETHING_CRUD.DESCRIPTION%TYPE;
    s_price SOMETHING_CRUD.PRICE%TYPE;

   BEGIN  
    --seteo max id
    SELECT MAX(ID) into max_id from SOMETHING_CRUD;
    --seteo min id
    SELECT MIN(ID) into min_id from SOMETHING_CRUD;
    
    dbms_output.put_line ('List for ' || min_id || ' to ' || max_id);
    
    FOR s_id IN min_id..max_id LOOP
      BEGIN
        SELECT s_tbl.ID
        INTO s_id_value 
        FROM SOMETHING_CRUD s_tbl
        WHERE s_tbl.ID=s_id;
        EXCEPTION WHEN NO_DATA_FOUND THEN s_id_value := -1;
      END;
      
      dbms_output.put_line(s_id_value);
      
      IF s_id_value <> -1 THEN -- no anda bien el not null preguntar
        SELECT s_tbl.DESCRIPTION, s_tbl.PRICE
        INTO s_desc, s_price 
        FROM SOMETHING_CRUD s_tbl 
        WHERE s_tbl.ID=s_id; 
        
        dbms_output.put_line 
        ('Description:  ' || s_desc || ' Price: ' || s_price);
      
        dbms_output.put_line 
        ('-----------------------------------------------------------');
      END IF;
      
    END LOOP;
    
END read_something;
   
   PROCEDURE update_something(s_id IN SOMETHING_CRUD.ID%type, 
     s_desc IN Something_Crud.Description%TYPE DEFAULT 'description', 
     s_price IN Something_Crud.Price%TYPE DEFAULT 1)
   IS
   desc_default varchar2(50) default 'not descripcion';
   price_default NUMBER default 9999999;
   test_register_exist NUMBER;
   
   
   BEGIN
    SELECT s_tbl.id into test_register_exist FROM something_crud s_tbl where s_tbl.id = s_id;
    UPDATE Something_Crud s_tbl
    SET s_tbl.description = s_desc,
        s_tbl.price = s_price
    WHERE
        s_tbl.id =  s_id;
    COMMIT;
    EXCEPTION WHEN NO_DATA_FOUND THEN
      INSERT INTO something_crud(id,description,price)
      VALUES (s_id,desc_default,price_default);
      COMMIT;
    WHEN OTHERS THEN  -- handles all other errors
      ROLLBACK;      
   END update_something;
   
   PROCEDURE delete_something(s_desc something_crud.description%type )
   IS
   id_to_delete something_crud.id%type;
   BEGIN
   id_to_delete := FUNCTION_test('edu');
   IF id_to_delete<> -2 AND  id_to_delete<> -1 THEN
    delete from something_crud where id = id_to_delete;
    dbms_output.put_line ('REGISTRO BORRADO');
   ELSE
    dbms_output.put_line ('No se pudo borrar el registro (no existe o hay muchos con la misma descripcion)');
   end if;
   END delete_something;
   
END CRUD_SOMETHING; 








