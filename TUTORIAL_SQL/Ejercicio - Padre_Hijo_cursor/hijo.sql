--Ejercicio de Fer
CREATE OR REPLACE PROCEDURE procedimiento_hijo(p_rc_cursor_hijo OUT SYS_REFCURSOR, p_status OUT NUMBER)
AS
  rc_generic SYS_REFCURSOR;
  NUMERO NUMBER;
BEGIN
  DBMS_OUTPUT.PUT_LINE('El valor de status al inicio del procedure hijo es: ' || p_status);

-- Abro el cursor (devuelvo NOMBRE y APELLIDO)
  OPEN  rc_generic FOR
   SELECT tbl_vd.nombre, tbl_vd.apellido FROM XXLINK.VENDEDORES tbl_vd;

-- Asigno el cursor a mi variable de salida   
  p_rc_cursor_hijo := rc_generic;

-- Asgino un valor a status  
  p_status := 1;

-- Genero un error Aproposito  
--  NUMERO := 'ASD';
  RETURN;
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('El valor de status es: ' || p_status);
    /*DBMS_OUTPUT.PUT_LINE('No llamos al handler EXCEPTION del proceso_padre, 
    sino que continuo con el funcionamiento del flujo normal del padre)');*/
    DBMS_OUTPUT.PUT_LINE('Le paso la exception al EXCEPTION del proceso_padre');
    RAISE;
END;