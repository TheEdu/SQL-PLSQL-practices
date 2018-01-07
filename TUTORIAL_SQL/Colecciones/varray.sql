DECLARE
  TYPE type_items_va IS VARRAY(3) OF XXLINK.EDU_ITEMS.ITEM_NAME%TYPE;
  l_items_va type_items_va DEFAULT type_items_va();
  l_items_copy_va type_items_va DEFAULT type_items_va();
  
  
  CURSOR cur_get_3_items IS
    SELECT tbl_itm.*
      FROM XXLINK.EDU_ITEMS tbl_itm
      WHERE ROWNUM < 4;

BEGIN

  FOR item IN cur_get_3_items LOOP
    l_items_va.EXTEND;
    l_items_va(l_items_va.LAST) := item.item_name;
  END LOOP;
  
  l_items_copy_va := l_items_va;
  
EXCEPTION 
  WHEN OTHER THEN
    /*
      Las excepciones son muy parecidas a los otros dos tipos de colecciones.
      Adicionalmente no puedo borrar elementos y dejar huecos.
      Tampoco puedo excedemer en el largo del var array
    */
    NULL;
  
END;