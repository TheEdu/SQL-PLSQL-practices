--procedimiento que usa el paquete
DECLARE 
   code customers.id%type := &cc_id; 
BEGIN 
   cust_sal.find_sal(code); 
END;