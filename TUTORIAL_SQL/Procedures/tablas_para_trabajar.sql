-- tablas para trabajar en el modulo de Procedimientos del tutorial
CREATE TABLE departments
(dept_id NUMBER NOT NULL PRIMARY KEY,
dept_name VARCHAR2(60)
);

CREATE TABLE employee
(emp_id NUMBER NOT NULL PRIMARY KEY,
emp_name VARCHAR2(60),
emp_dept_id NUMBER,
emp_loc VARCHAR2(2),
emp_sal NUMBER,
emp_status VARCHAR2(1),
CONSTRAINT emp_dept_fk FOREIGN KEY(emp_dept_id)
REFERENCES departments(dept_id)
);

--deparmets
INSERT INTO departments(dept_id,dept_name)
  VALUES(1,'IT');
INSERT INTO departments(dept_id,dept_name)
  VALUES(2,'Accounting');
COMMIT;

--employees
INSERT INTO employee(emp_id,emp_name,emp_dept_id,emp_loc,emp_sal,emp_status)
  VALUES(1,'Eduardo Denis',1,'AR',14000,'U');
INSERT INTO employee(emp_id,emp_name,emp_dept_id,emp_loc,emp_sal,emp_status)
  VALUES(2,'Joaquin Test',1,'EU',14000,'D');
INSERT INTO employee(emp_id,emp_name,emp_dept_id,emp_loc,emp_sal,emp_status)
  VALUES(3,'Martin Casas',2,'AR',12222,'U');
INSERT INTO employee(emp_id,emp_name,emp_dept_id,emp_loc,emp_sal,emp_status)
  VALUES(4,'Daniel Ross',2,'EU',999999,'U');
COMMIT;