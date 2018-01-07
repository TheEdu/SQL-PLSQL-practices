
DROP TABLE gt_table_names;
DROP TABLE gt_columns_names;

CREATE TABLE gt_table_names(
  tbl_name_id NUMBER NOT NULL PRIMARY KEY,
  tbl_name_desc VARCHAR(50)
);

CREATE TABLE gt_columns_names(
  column_id NUMBER NOT NULL PRIMARY KEY,
  column_tbl_name_id NUMBER NOT NULL,
  column_name VARCHAR(50),
  column_type VARCHAR(50)
);

ALTER TABLE gt_columns_names
  ADD CONSTRAINT
  fk_column_tbl_name_id FOREIGN KEY(column_tbl_name_id)
  REFERENCES gt_table_names(tbl_name_id);
  
INSERT INTO gt_table_names(tbl_name_id, tbl_name_desc)
        VALUES(1,'gt_test_1');
        
INSERT INTO gt_columns_names( column_id,
                              column_tbl_name_id,
                              column_name,
                              column_type)
                      VALUES( 2,
                              1,
                              'column_test_2',
                              'varchar2(50)');
                              
INSERT INTO gt_table_names(tbl_name_id, tbl_name_desc)
        VALUES(2,'gt_test_2');
        
INSERT INTO gt_columns_names( column_id,
                              column_tbl_name_id,
                              column_name,
                              column_type)
                      VALUES( 3,
                              2,
                              'column_test_1',
                              'number not null primary key');
COMMIT;