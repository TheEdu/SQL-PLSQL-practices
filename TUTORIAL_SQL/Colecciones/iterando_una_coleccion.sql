DECLARE

  TYPE type_desc_aa 
    IS TABLE OF VARCHAR2(50) 
    INDEX BY BINARY_INTEGER;
  
  l_desc_aa type_desc_aa;
  l_index NUMBER;

BEGIN

  l_desc_aa(-1) := 'Soy -1';
  l_desc_aa(123) := 'Soy 123';
  l_desc_aa(51) := 'Soy 51';
  
  FOR elem IN l_desc_aa.FIRST .. l_desc_aa.LAST LOOP
    IF l_desc_aa.EXISTS(elem)THEN
      null;
    END IF;
  END LOOP;
  
  l_index := l_desc_aa.FIRST;
  WHILE l_index IS NOT NULL LOOP
    null;
    l_index := l_desc_aa.NEXT(l_index);
  END LOOP;

  NULL;
END;