CREATE OR REPLACE 
PACKAGE CRUD_SOMETHING AS 

  /* TODO enter package declarations (types, exceptions, methods etc) here */ 
  PROCEDURE create_something
    (
      s_desc SOMETHING_CRUD.DESCRIPTION%type,
      s_price SOMETHING_CRUD.PRICE%type
    );
  PROCEDURE read_something;
  PROCEDURE update_something
    (
      s_id IN SOMETHING_CRUD.ID%type, 
      s_desc IN Something_Crud.Description%TYPE DEFAULT 'description', 
      s_price IN Something_Crud.Price%TYPE DEFAULT 1
    );
  PROCEDURE delete_something(s_desc something_crud.description%type);

END CRUD_SOMETHING;

