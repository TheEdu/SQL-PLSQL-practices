--Ejercicio de Fer
CREATE OR REPLACE PROCEDURE procedimiento_padre
AS
  TYPE vendedor_record_type IS RECORD ( field_1 XXLINK.VENDEDORES.NOMBRE%type,
                                        field_2 XXLINK.VENDEDORES.APELLIDO%type);
                                        
  vendedor vendedor_record_type; 
  
  cursor_recibido SYS_REFCURSOR; 
  status NUMBER := 2;
                                        
BEGIN
  DBMS_OUTPUT.PUT_LINE('El valor de status antes de entrar al procedure hijo es: ' || status);
  procedimiento_hijo(cursor_recibido,status);
  DBMS_OUTPUT.PUT_LINE('El valor de status es: ' || status);
  DBMS_OUTPUT.PUT_LINE('Lista de Vendedores: ');
  
  LOOP
    FETCH cursor_recibido INTO vendedor;
    EXIT WHEN cursor_recibido%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('Vendedor: ' || vendedor.field_1 ||' '|| vendedor.field_2);
  END LOOP;
  
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('El valor de status es: ' || status);
    DBMS_OUTPUT.PUT_LINE('Le paso la exception al EXCEPTION del proceso principal');
    RAISE;
END;