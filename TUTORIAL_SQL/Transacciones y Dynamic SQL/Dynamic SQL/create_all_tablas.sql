-- Dynamic SQL
-- Falta agregarle un parametro al metodo para que solo cree las tablas que quiera el usuario
CREATE OR REPLACE PROCEDURE CREATE_ALL_TABLES AUTHID CURRENT_USER
AS

  CURSOR get_table_names IS
    SELECT TBL_TABLE.*
      FROM GT_TABLE_NAMES tbl_table;

  CURSOR get_table_columns(p_table_name VARCHAR2) IS
    SELECT TBL_COLUMNS.COLUMN_NAME, TBL_COLUMNS.COLUMN_TYPE
      FROM GT_COLUMNS_NAMES tbl_columns
    WHERE tbl_columns.COLUMN_TBL_NAME_ID = (SELECT tbl_name_id FROM GT_TABLE_NAMES WHERE TBL_NAME_DESC = p_table_name);

  l_query VARCHAR(1050);
  l_name VARCHAR2(50);
  l_columns VARCHAR2(1000);
BEGIN

FOR tbl_name IN get_table_names LOOP
  l_name := 'CREATE TABLE ' ||   tbl_name.tbl_name_desc;
  l_columns := '(';
  FOR table_column IN get_table_columns(tbl_name.tbl_name_desc) LOOP
    l_columns := l_columns || table_column.COLUMN_NAME || ' ' || table_column.COLUMN_TYPE || ', ';
  END LOOP;
  l_columns := SUBSTR(l_columns,1,LENGTH(l_columns)-2);
  l_columns := l_columns || ')';
  l_query := l_name || ' ' || l_columns;
  
  DBMS_OUTPUT.PUT_LINE(l_name);
  DBMS_OUTPUT.PUT_LINE(l_columns);
  BEGIN
    EXECUTE IMMEDIATE L_QUERY;
  EXCEPTION
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE(SQLERRM);
  END;
  DBMS_OUTPUT.PUT_LINE('******************************************************');
  DBMS_OUTPUT.PUT_LINE('');
END LOOP;  

EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
    DBMS_OUTPUT.PUT_LINE(DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
END;
/

drop table gt_test_1;
drop table gt_test_2;

exec CREATE_ALL_TABLES;