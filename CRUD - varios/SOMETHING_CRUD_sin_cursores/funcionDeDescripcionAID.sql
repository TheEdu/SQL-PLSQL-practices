CREATE OR REPLACE FUNCTION FUNCTION_test(s_desc something_crud.description%TYPE) RETURN NUMBER AS
 id_returned something_crud.id%type;
BEGIN
  select s_tbl.id into id_returned 
  from something_crud s_tbl 
  where s_tbl.description = s_desc;
  RETURN id_returned;
  EXCEPTION WHEN TOO_MANY_ROWS THEN
   ROLLBACK;
END FUNCTION_test;

