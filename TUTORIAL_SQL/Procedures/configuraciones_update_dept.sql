
-- Ejecuto el procedimiento
call update_dept();
--exec update_dept;
--executo update_dept;



select SYS.DBMS_WARNING.GET_WARNING_SETTING_STRING from dual;

-- Setting Warnings enable (g10+) (severe,performance e informational)
ALTER SESSION SET PLSQL_WARNINGS='ENABLE:ALL';

-- Le digo al procedimiento que trate a los warnings como errores
  -- Las warnings de performance y severe ahora son errores
  -- La warning de 06002 (informational warning) tambies es tratada como error
ALTER PROCEDURE update_dept
  COMPILE PLSQL_WARNINGS = 'ERROR:PERFORMANCE','ENABLE:SEVERE','ENABLE:06002'
  REUSE SETTINGS; -- reuso los configuracion anteriores que no especifique en la nueva


-- Compila los proceddimientos en modo DEBUG
ALTER PROCEDURE update_dept COMPILE DEBUG;

-- Pone en FALSE la opcion de compilar a debug code.
-- Si quiero compilar a debug mode, tengo que hacerlo yo.
ALTER SESSION SET PLSQL_DEBUG = TRUE;

/* Seteando el optimize level a 2
   Code type native se agrega despues de la version 10g o 11g
   (No va a ser posible implementarlo en Toyota)

ALTER SESSION SET PLSQL_OPTIMIZE_LEVEL=2;

SELECT PLSQL_OPTIMIZE_LEVEL,
        PLSQL_CODE_TYPE
FROM ALL_PLSQL_OBJECT_SETTINGS
WHERE NAME = 'UPDATE_DEPT';

*/