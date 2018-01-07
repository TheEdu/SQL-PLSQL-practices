--Declarando un ARRAY ASOSIATIVO

DECLARE
  TYPE type_items_name_aa 
    IS TABLE OF XXLINK.EDU_ITEMS.ITEM_NAME%TYPE
    INDEX BY BINARY_INTEGER;
  
  l_items_name_aa type_items_name_aa;
  
  l_to_print_aa type_items_name_aa;
  
BEGIN

  l_items_name_aa(0) := 'Pelota';
  l_items_name_aa(2) := 'Pandereta';
  l_items_name_aa(3) := 'PS4';
 
 
  l_to_print_aa := l_items_name_aa;

  DBMS_OUTPUT.PUT_LINE('Accediendo a AA index 2 -> ' || l_to_print_aa(2));

END;