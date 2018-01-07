DECLARE
BEGIN
  
  <<FOR_1>>
  FOR contador_1 in 1..5 LOOP
    DBMS_OUTPUT.PUT_LINE('FOR_1: HOLA');
    <<FOR_2>>
    FOR contador_2 in 1..5 LOOP
      -- Saluda dos veces, por cada vez que saluda FOR_1    
      DBMS_OUTPUT.PUT_LINE('   FOR_2: HOLA');
      
      --CONTINUE FOR_1 WHEN contador_2 = 2; Si se decomenta va a Imprimir lo mismo!
      EXIT FOR_2 WHEN contador_2 = 2;
    
    END LOOP FOR_2;
  END LOOP FOR_1;
  NULL;
  
END;