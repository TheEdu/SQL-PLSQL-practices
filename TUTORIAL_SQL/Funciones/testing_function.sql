/* Compilar el codigo pl/sql y las funciones a codigo C nativo.
   Optimiza la ejecucion de funciones.
   Disponible en Oracle10g + 

ALTER SESSION SET PLSQL_CODE_TYPE = NATIVE;
ALTER FUNCTION get_emp_count COMPILE PLSQL_CODE_TYPE = NATIVE;


*/

-- Ejecutando una funcion
DECLARE
  l_number NUMBER;
BEGIN
 l_number := get_emp_count();
 DBMS_OUTPUT.PUT_LINE('Empleados de IT:' || l_number);
END;



-- Otra forma de ejecutar una funcion (sin necesidad de un bloque anonimo)
-- Bind variable
-- pueden declararse afuera de un bloque pl/sql

VARIABLE l_number NUMBER;
EXEC :l_number := GET_EMP_COUNT();
PRINT :l_number;
