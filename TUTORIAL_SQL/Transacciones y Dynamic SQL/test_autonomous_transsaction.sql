--test

DECLARE
l_id NUMBER DEFAULT 1;

BEGIN


INSERT INTO EDU_TEST_AUTO_TANSC(AT_ID,AT_DESC)
                  VALUES(l_id,'Algo');
                                
AutoTrans_LOG_TEST(l_id);

-- Los cambios hechos por AutoTrans_LOG_TEST van a persistir porque es un transaccion
-- AUOTNOMA y commitea sus propios cambios
rollback;

END;
/


ROLLBACK;
