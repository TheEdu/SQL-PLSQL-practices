
-- test pattern match

SELECT * FROM EMPLEADO_BACKUP emp
WHERE emp.APELLIDO_MATERNO LIKE 'G%' OR emp.APELLIDO_PATERNO LIKE 'D%';


SELECT rest.NOMBRE_COMPLETO FROM 
  (
    SELECT DISTINCT (emp.NOMBRE || ', ' || emp.APELLIDO_PATERNO) as NOMBRE_COMPLETO
      FROM EMPLEADO_BACKUP emp
        WHERE 
          emp.APELLIDO_MATERNO LIKE 'G%' 
          OR 
          emp.APELLIDO_PATERNO LIKE 'D%'
    ) rest ORDER BY rest.NOMBRE_COMPLETO ASC; --NO ANDA CON EL DISTINC (tengo que hacer select dentro de otro select)

SELECT (emp.NOMBRE || ', ' || emp.APELLIDO_PATERNO) from EMPLEADO_BACKUP emp;


-- test join


CREATE TABLE test_join_1
  (
    id_j1 INT NOT NULL PRIMARY KEY,
    id_test_join_fk INT NOT NULL
  );
  
CREATE TABLE test_join_2
  (
    id_j2 INT NOT NULL PRIMARY KEY,
    something VARCHAR2(50)  NOT NULL
  );

   
 ALTER TABLE test_join_1 
   ADD CONSTRAINT 
   fk_constraint FOREIGN KEY(id_test_join_fk) 
   REFERENCES test_join_2(id_j2);
   
 -- se crearon trigger para las tablas test_join_1 y test_join_2 para generar el AUTO_INCREMENT usando la secuencia edu_test_seq 
 
 -- creacion de datos
INSERT INTO TEST_JOIN_2
(something)
VALUES ('EQWEQWE');

--15 , 17 y 19 (id´s de test_join_2)
INSERT INTO TEST_JOIN_1
(id_test_join_fk)
VALUES (15);

-- muestro el join fk
SELECT t2.something
FROM TEST_JOIN_2 t2
INNER JOIN TEST_JOIN_1 t1
ON t1.ID_TEST_JOIN_FK = t2.ID_J2;


-- test join sin fk
CREATE TABLE test_join_11
  (
    id_j11 INT NOT NULL PRIMARY KEY,
    id_to_join INT NOT NULL
  );
  
CREATE TABLE test_join_22
  (
    id_j22 INT NOT NULL PRIMARY KEY,
    something VARCHAR2(50)  NOT NULL
  );
  
SELECT *
FROM TEST_JOIN_11
INNER JOIN TEST_JOIN_22
ON TEST_JOIN_11.ID_TO_JOIN = TEST_JOIN_22.ID_J22;

SELECT *
FROM TEST_JOIN_11
INNER JOIN TEST_JOIN_22
ON TEST_JOIN_11.ID_TO_JOIN != TEST_JOIN_22.ID_J22;


  