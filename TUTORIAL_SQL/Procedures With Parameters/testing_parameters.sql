DECLARE
  l_emp_id NUMBER           :=10;
  l_dept_id NUMBER          :=1;
  l_location VARCHAR2(2)   :='CA';
  l_status NUMBER           := -1;
BEGIN

-- Passing parameters by name
  /*update_emp(p_emp_id   => l_emp_id,
             -- p_dept_id  => l_dept_id, -- toma el valor por DEFAULT(1)
             p_location => l_location,
             p_status   => l_status);*/
  update_emp(l_emp_id,
            l_dept_id, -- toma el valor por DEFAULT(1)
            l_location,
            l_status);
  DBMS_OUTPUT.PUT_LINE('Returned value of l_location is ' || l_location);
  DBMS_OUTPUT.PUT_LINE('Returned value of l_status is ' || l_status);
EXCEPTION
  WHEN OTHERS THEN
    /*DBMS_OUTPUT.PUT_LINE(SQLERRM);
    DBMS_OUTPUT.PUT_LINE(DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);*/
    DBMS_OUTPUT.PUT_LINE('Inside Exception value of l_location is ' || l_location);
    DBMS_OUTPUT.PUT_LINE('Inside Exception value of l_status is ' || l_status);
    RAISE;
END;