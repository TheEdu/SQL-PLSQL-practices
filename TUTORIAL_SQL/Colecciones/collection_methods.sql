-- Collection Methods
DECLARE

TYPE type_desc_aa 
  IS TABLE OF VARCHAR2(50) 
  INDEX BY BINARY_INTEGER;

desc_aa type_desc_aa;
last_position NUMBER;

BEGIN

desc_aa(-1) := 'Soy -1';
desc_aa(123) := 'Soy 123';
desc_aa(51) := 'Soy 51';

last_position := desc_aa.LAST;
DBMS_OUTPUT.PUT_LINE('LAST METHOD RESULT: ' || last_position);

IF desc_aa.EXISTS(last_position) THEN
  DBMS_OUTPUT.PUT_LINE('    El contenido EXISTE y es: ' || desc_aa(last_position));
  DBMS_OUTPUT.PUT_LINE('    El elemento anterior (PRIOR) al ultimo es: ' || desc_aa(desc_aa.PRIOR(last_position)));

ELSE
  DBMS_OUTPUT.PUT_LINE('    El contenido NO EXISTE :(');
END IF;

DBMS_OUTPUT.PUT_LINE('Cantidad de elementos de la coleccion: ' || desc_aa.COUNT);
/*
DELETE --> borra todo
DELETE(INDEX) --> borra el elemento en la posicion dada por INDEX
DELETE(START_INDEX, FINAL_INDEX) --> si el rango es valido, borra todos los elementos en el mismo (inclusive los limites)
*/
desc_aa.DELETE;
DBMS_OUTPUT.PUT_LINE('Cantidad de elementos de la coleccion (after DELETE): ' || desc_aa.COUNT);
END;