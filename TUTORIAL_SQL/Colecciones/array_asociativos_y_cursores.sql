/* Asigno el registro apuntado por el cursor al array asociativo. 
Luego  muestro el contenido del item (a travez del array asociativo)*/
DECLARE
  TYPE type_items_aa 
    IS TABLE OF XXLINK.EDU_ITEMS%ROWTYPE /*[NOT NULL]*/
    INDEX BY BINARY_INTEGER;
    
  /*Tambien existen paquetes (dbms_utility, dbms_sql) 
    con tipos predefinidos de array asociativos  
    dbms_utility.number_array --> array asociativo (binary_integer, number) 
    dbms_sql.date             --> array asociativo (binary_integer, date)
  */
  
  /*No se pueden comparar directamente array asociativos
    IF aa_1 = aa_2 THEN --> no se puede hacer.
    Hay que corroborar su longitud y (si son iguales) 
    recorrer cada array comparando sus elementos de a uno
  */
    
  CURSOR cur_get_items IS
    SELECT * FROM XXLINK.EDU_ITEMS;  
  l_items_aa type_items_aa;
  l_index NUMBER DEFAULT 1;
BEGIN

  DBMS_OUTPUT.PUT_LINE('Lista de ITEMS');
  FOR item IN cur_get_items LOOP
    l_items_aa(l_index) := item;
    /* Voy a Imprimir lo mismo usando otro loop y los metodos FIRST Y NEXT(index)
    DBMS_OUTPUT.PUT_LINE('Item_name: ' || l_items_aa(l_index).ITEM_NAME 
                         ||  ' --> Valor: ' || l_items_aa(l_index).ITEM_VALUE);*/
    l_index := l_index + 1;
  END LOOP;
  
  l_index := l_items_aa.FIRST;
  WHILE l_index IS NOT NULL LOOP
   DBMS_OUTPUT.PUT_LINE('Item_name: ' || l_items_aa(l_index).ITEM_NAME 
                         ||  ' --> Valor: ' || l_items_aa(l_index).ITEM_VALUE);
   l_index := l_items_aa.NEXT(l_index);
  END LOOP;
  
  --GENERO UN ERROR
  --DBMS_OUTPUT.PUT_LINE(l_items_aa(l_index).ITEM_NAME );

EXCEPTION
 WHEN NO_DATA_FOUND THEN
  DBMS_OUTPUT.PUT_LINE('***************************************************');
  DBMS_OUTPUT.PUT_LINE('Se ha generado un error ya que el dato al que se trata de acceder no existe');
  DBMS_OUTPUT.PUT_LINE(SQLERRM);
  DBMS_OUTPUT.PUT_LINE(DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
  
  WHEN OTHERS THEN /* ERROR de NULL VALUE ASSIGNED (cuando esta puesta la constraint de NOT NULL)
                      ERROR de Asignacion de valor de diferente tipo al declarado
                      ERROR de overflow con el valor del index*/
    DBMS_OUTPUT.PUT_LINE('***************************************************');
    DBMS_OUTPUT.PUT_LINE('Otro ERROR');
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
    DBMS_OUTPUT.PUT_LINE(DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);
END;