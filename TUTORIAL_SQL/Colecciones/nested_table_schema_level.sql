/* 
  Nested Table a nivel del Schema.
  
  Estas nested table pueden ser usadas en todo el sistema sin
  tener que declarar el tipo nuevamente.
  
  Pueden ser usadas como un nuevo tipo en la creacion de tablas.!!!
*/

-- NESTED TABLE con un dato por row
CREATE OR REPLACE TYPE type_items_name_nt AS TABLE OF VARCHAR(2);
desc type_items_name_nt;


-- NESTED TABLE con un record por row
CREATE TYPE items_object AS OBJECT (item_name XXLINK.EDU_ITEMS.ITEM_NAME%TYPE,
                                    item_value XXLINK.EDU_ITEMS.ITEM_VALUE%TYPE);
                                    
CREATE OR REPLACE TYPE type_items_object_nt AS TABLE OF items_object;