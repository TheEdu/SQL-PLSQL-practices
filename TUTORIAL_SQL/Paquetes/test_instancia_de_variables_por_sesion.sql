--Ejecutar el mismo codigo en XXSADEL y en dbTest 
--Las variables del package se instancian por sesion
--Permitiendo a una sesion trabajar independientemente de la otra

BEGIN
  DBMS_OUTPUT.PUT_LINE('XXLINK: ' || XXLINK.PACKAGE_NAME.g_variable);
   XXLINK.PACKAGE_NAME.g_variable := 20;
END;
/

BEGIN
  DBMS_OUTPUT.PUT_LINE('XXLINK: ' || XXLINK.PACKAGE_NAME.g_variable);
END;
/

COMMIT;

GRANT EXECUTE ON XXLINK.PACKAGE_NAME TO XXSADEL;
