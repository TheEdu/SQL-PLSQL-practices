--EXCEPTIONS TESTING 

-- para generar una excepcion poner -> raise [[label.]nombre];

<<outer_block>>
DECLARE

  upss EXCEPTION;
  -- RENOMBRO UNA EXCEPTION CONOCIDA
  EXCEPTION_NAME EXCEPTION;
  PRAGMA EXCEPTION_INIT (EXCEPTION_NAME,-1426);
  
  
BEGIN

  <<inner_block>>
  DECLARE
    upss EXCEPTION;
    
  BEGIN
    NULL;
  EXCEPTION
  
  
    WHEN EXCEPTION_NAME THEN
     DBMS_OUTPUT.PUT_LINE('Soy EXCEPTION_NAME del inner block');
     NULL;

  
    WHEN upss THEN
      DBMS_OUTPUT.PUT_LINE('Soy Upss del inner block');
      NULL;
  
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('Soy Others del inner block');

      NULL;
  END;
  
EXCEPTION

    WHEN EXCEPTION_NAME THEN
      DBMS_OUTPUT.PUT_LINE('Soy EXCEPTION_NAME del Outer block');
      NULL;


    WHEN upss THEN
      DBMS_OUTPUT.PUT_LINE('Soy Upss del Outer block');
      NULL;
  
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('Soy Others del Outer block');

      NULL;
END;

