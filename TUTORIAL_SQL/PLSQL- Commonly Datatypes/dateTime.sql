--Date Type

--Muestra las mascaras para alamcenar las fehca de la Session y de la Bse de datos respectivamente
SELECT 
current_timestamp AS SESSION_TIME_STAMP, 
systimestamp AS DATA_BASE_TIME_STAMP
FROM dual;

--Puedo modificar la mascara (Date) de la Session de la siguiente manera
--ALTER session SET --some_parameter = some_value


DECLARE
  fecha DATE DEFAULT current_date;
  session_time timestamp with time zone := current_timestamp;
  db_time timestamp with time zone := systimestamp;
  
  --invervalo de tiempo
  intervalo INTERVAL DAY(2) TO SECOND(2);
  
BEGIN
  dbms_output.put_line('Hoy es: ' || fecha);
  dbms_output.put_line('Session time: ' || session_time);
  dbms_output.put_line('DB time: ' || db_time);
  
  intervalo := session_time - db_time;
  dbms_output.put_line('Diferencia de horarios entre el servidor y la base de datos: ' || intervalo);
  
END;

