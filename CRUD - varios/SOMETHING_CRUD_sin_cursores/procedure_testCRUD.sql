--procedimiento que usa el paquete
SET SERVEROUTPUT On

DECLARE

  input_desc something_crud.description%type := '&Descripcion';
  input_price something_crud.price%type := &Price;

BEGIN
    
   crud_something.read_something; 
   crud_something.update_something(1); 
   crud_something.create_something(input_desc,input_price); 
   crud_something.delete_something('description'); --TEST DELETE
END;
