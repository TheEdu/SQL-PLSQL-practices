--Nested Tables

DECLARE

  TYPE type_items_nt IS TABLE OF XXLINK.EDU_ITEMS%ROWTYPE /*NOT NULL*/;
  
  l_items_nt type_items_nt DEFAULT TYPE_ITEMS_NT();
  l_items_copy_nt type_items_nt DEFAULT TYPE_ITEMS_NT();

  /*
    No solo tengo que crear la Nested Table, tambien tengo que inicilizarla llamando
    al constructor. El constructor es el nombre del tipo de la NT. ej: type_items_nt()
  */
  
  CURSOR cur_get_items IS
    SELECT *
      FROM XXLINK.EDU_ITEMS;
  
  l_index NUMBER;

BEGIN

  /* 
  EXTEND --> Agrega un elemento NULL al final de la coleccion. 
  
  EXTEND(N) --> Agrega N  elementos NULL´s al final de la coleccion 
  
  EXTEND(N,index) --> Agrega N  elementos al final de la coleccion,
                     con el contenido de coleccion en la posicion 'index'
  */
  
  -- Agregar elementos manualmente
  l_items_nt.EXTEND;
  l_index := l_items_nt.LAST;
  l_items_nt(l_index).item_name := 'Pelota';
    l_items_nt(l_index).item_value := 21.25;
  DBMS_OUTPUT.PUT_LINE('Name: ' || l_items_nt(l_index).item_name
                        || ', Value: ' || l_items_nt(l_index).item_value );
                        
  -- Borrar el contenido de una posicion de mi coleccion
  l_items_nt.DELETE(l_index);
  --l_items_nt.DELETE -- Borra todos el contenido de toda la coleccion (los index quedan)
  
  -- Si quiero borrar el elemento y su contenido tengo que usar TRIM
  --TRIM borra el elemento del final de la coleccion
  --TRIM(N) borra los ultimo N elementos
  
  
  -- Copiar elementos de una tabla en mi Nested  Table
  FOR item IN cur_get_items LOOP
    l_items_nt.EXTEND;
    l_index := l_items_nt.LAST;
    l_items_nt(l_index) := item;
  END LOOP;
  
  DBMS_OUTPUT.PUT_LINE('');
  DBMS_OUTPUT.PUT_LINE('Lista Completa');
  FOR iterator IN l_items_nt.FIRST .. l_items_nt.LAST LOOP
    IF l_items_nt.EXISTS(iterator) IS NOT NULL THEN
      DBMS_OUTPUT.PUT_LINE('Name: ' || l_items_nt(iterator).item_name
                          || ', Value: ' || l_items_nt(iterator).item_value );
    END IF;
  END LOOP;
  
  -- Puedo Asignar el contenido de una NT  a otra NT  del mismo tipo
  l_items_copy_nt := l_items_nt;

  DBMS_OUTPUT.PUT_LINE('');
  DBMS_OUTPUT.PUT_LINE('Lista Completa Copiada!');
  FOR iterator IN l_items_copy_nt.FIRST .. l_items_copy_nt.LAST LOOP
    IF l_items_copy_nt.EXISTS(iterator) IS NOT NULL THEN
      DBMS_OUTPUT.PUT_LINE('Name: ' || l_items_copy_nt(iterator).item_name
                          || ', Value: ' || l_items_copy_nt(iterator).item_value );
    END IF;
  END LOOP;
  
  --Genero un Error
  l_items_nt(1000).item_name := 'Edu'; 
  
EXCEPTION
  /*
    Hay mas excepciones:
      NOT NULL CONSTRAINT
      UNITIALIZE COLLECTION
      NO DATA FOUND
      VALUE ERROR
      SUBSCRIPT OUTSIDE THE LIMIT [1 .. 2147483647] 
  */
  WHEN SUBSCRIPT_BEYOND_COUNT THEN
    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE('***************************************************');
    DBMS_OUTPUT.PUT_LINE('No podes agregar un elemento en un INDEX que no Existe');
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
    DBMS_OUTPUT.PUT_LINE(DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);

END;