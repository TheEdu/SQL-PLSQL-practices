-- Dynamic SQL --> Get ALL User Tables Current Schema
-- falta terminarlo!
CREATE OR REPLACE PROCEDURE get_all_tables AUTHID CURRENT_USER AS

  TYPE type_rc IS RECORD (column_name XXLINK.GT_COLUMNS_NAMES.COLUMN_NAME%TYPE, 
                          column_type XXLINK.GT_COLUMNS_NAMES.COLUMN_TYPE%TYPE);
  

  TYPE type_aa  IS TABLE OF type_rc INDEX BY BINARY_INTEGER;
  l_columnas type_aa;


  CURSOR get_user_table_name IS
    SELECT tbl_usr.*
    FROM user_tables tbl_usr
    ORDER BY tbl_usr.table_name ASC;
    
  CURSOR get_user_table_columns(p_name VARCHAR2) IS  
    SELECT tbl_columns.column_name, tbl_columns.data_type ||  -- Copy Pasteado de Stack overflow (arreglar!)
                                                              case
                                                              when tbl_columns.data_precision is not null and nvl(tbl_columns.data_scale,0)>0 then '('||tbl_columns.data_precision||','||tbl_columns.data_scale||')'
                                                              when tbl_columns.data_precision is not null and nvl(tbl_columns.data_scale,0)=0 then '('||tbl_columns.data_precision||')'
                                                              when tbl_columns.data_precision is null and tbl_columns.data_scale is not null then '(*,'||tbl_columns.data_scale||')'
                                                              when tbl_columns.char_length>0 then '('||tbl_columns.char_length|| case tbl_columns.char_used 
                                                                                                                       when 'B' then ' Byte'
                                                                                                                       when 'C' then ' Char'
                                                                                                                       else null 
                                                                                                         end||')'
                                                              end||decode(tbl_columns.nullable, 'N', ' NOT NULL')
      FROM ALL_TAB_COLUMNS tbl_columns
        WHERE tbl_columns.OWNER = (SELECT USER FROM dual) AND tbl_columns.TABLE_NAME = p_name;
        
  l_table_name XXLINK.GT_TABLE_NAMES.TBL_NAME_DESC%TYPE;
  l_table_id NUMBER;
  l_column_id NUMBER;
  l_column_id_base NUMBER DEFAULT 0;

BEGIN

  EXECUTE immediate 'DELETE FROM GT_COLUMNS_NAMES';
  EXECUTE immediate 'DELETE FROM GT_TABLE_NAMES';

  l_table_id := 0;
  
  FOR user_table IN get_user_table_name LOOP
    l_table_name := user_table.table_name;
    l_table_id := l_table_id + 1;
    EXECUTE immediate 'INSERT INTO GT_TABLE_NAMES(TBL_NAME_ID, TBL_NAME_DESC) 
                                          VALUES (:id , :name)'
    USING l_table_id, l_table_name;
    
    
    DBMS_OUTPUT.PUT_LINE(l_table_name);
    
    --Usando BULK 
    OPEN get_user_table_columns(l_table_name);    
    LOOP
        FETCH get_user_table_columns
          BULK COLLECT INTO l_columnas LIMIT 100;
          
        EXIT WHEN l_columnas.COUNT = 0;
          
        FOR columna_index IN 1 .. l_columnas.COUNT LOOP
        
          l_column_id := l_column_id_base + columna_index;
        
          
          EXECUTE immediate 'INSERT INTO GT_COLUMNS_NAMES(COLUMN_ID, COLUMN_TBL_NAME_ID, COLUMN_NAME, COLUMN_TYPE)
                                                   VALUES(:id , :tbl_name_id , :name , :type)' 
          USING  l_column_id, l_table_id, l_columnas(columna_index).column_name, l_columnas(columna_index).column_type;
          
          DBMS_OUTPUT.PUT_LINE(l_column_id || '    ' || l_columnas(columna_index).column_name);
        END LOOP;
        l_column_id_base := l_column_id_base + l_columnas.COUNT;
      
    END LOOP;
    CLOSE get_user_table_columns;   
    
  
  END LOOP;

END;
/

exec get_all_tables;