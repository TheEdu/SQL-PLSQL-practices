-- tablas para futuras pruebas de join
-- vendedores, ventas, y productos

CREATE TABLE VENDEDORES
  (
  id NUMBER PRIMARY KEY,
  nombre varchar(50) not null,
  apellido varchar(50) not null
  );
  
CREATE TABLE DEPARTAMENTOS
  (
  id NUMBER PRIMARY KEY,
  nombre varchar(50) not null
  );
  
  
CREATE TABLE PRODUCTOS
  (
  id NUMBER PRIMARY KEY,
  descripcion varchar(50) NOT NULL,
  precio NUMBER(*,2) NOT NULL
  );
    
  
CREATE TABLE VENTAS
  (
  id NUMBER PRIMARY KEY,
  vendedor_id NUMBER NOT NULL,
  producto_id NUMBER NOT NULL,
  fecha date NOT NULL
  );
  
ALTER TABLE VENTAS
  ADD cantidad NUMBER(*,0);
  
  
ALTER TABLE VENDEDORES
  ADD dni VARCHAR2(30);
  
 ALTER TABLE VENTAS
   ADD CONSTRAINT 
   fk_to_vendedor FOREIGN KEY(vendedor_id) 
   REFERENCES VENDEDORES(id);
   
  
 ALTER TABLE VENTAS
   ADD CONSTRAINT 
   fk_to_producto FOREIGN KEY(producto_id) 
   REFERENCES PRODUCTOS(id);


ALTER TABLE VENDEDORES
  ADD departamento_id NUMBER(*,0);
  
 ALTER TABLE VENDEDORES
   ADD CONSTRAINT 
   fk_to_departamento FOREIGN KEY(departamento_id) 
   REFERENCES DEPARTAMENTOS(id);

--inicializar datos departamentos
INSERT ALL
INTO DEPARTAMENTOS(id,nombre) VALUES(1,'deportivo')
INTO DEPARTAMENTOS(id,nombre) VALUES(2,'electronico')
SELECT * FROM dual;

-- inicializar datos vendedores   
INSERT ALL 
INTO VENDEDORES(id,nombre,apellido) VALUES(1,'Eduardo','Denis','11.111.111')
INTO VENDEDORES(id,nombre,apellido) VALUES(2,'Marcelo','Fernandez','11.111.111')
INTO VENDEDORES(id,nombre,apellido) VALUES(3,'Monica','Gomez','22.222.222')
SELECT * FROM dual;

-- inicializar datos vendedores   
INSERT ALL 
INTO PRODUCTOS(id,descripcion,precio) VALUES(1,'Pelota',100)
INTO PRODUCTOS(id,descripcion,precio) VALUES(2,'Mochila',400)
INTO PRODUCTOS(id,descripcion,precio) VALUES(3,'Limon',999999)
INTO PRODUCTOS(id,descripcion,precio) VALUES(4,'XBOX-ONE',12000)
SELECT * FROM dual;

INSERT ALL
INTO VENTAS(id,vendedor_id,producto_id,cantidad,fecha) VALUES(1,1,1,100,TO_DATE('08/03/2017', 'dd/mm/yyyy'))
INTO VENTAS(id,vendedor_id,producto_id,cantidad,fecha) VALUES(2,1,2,100,TO_DATE('02/03/2017', 'dd/mm/yyyy'))
INTO VENTAS(id,vendedor_id,producto_id,cantidad,fecha) VALUES(3,1,4,3,TO_DATE('02/03/2017', 'dd/mm/yyyy'))
INTO VENTAS(id,vendedor_id,producto_id,cantidad,fecha) VALUES(4,2,1,50,TO_DATE('08/03/2017', 'dd/mm/yyyy'))
INTO VENTAS(id,vendedor_id,producto_id,cantidad,fecha) VALUES(5,2,3,1,TO_DATE('07/03/2017', 'dd/mm/yyyy'))
INTO VENTAS(id,vendedor_id,producto_id,cantidad,fecha) VALUES(6,3,1,5,TO_DATE('08/03/2017', 'dd/mm/yyyy'))
INTO VENTAS(id,vendedor_id,producto_id,cantidad,fecha) VALUES(7,3,4,5,TO_DATE('01/03/2017', 'dd/mm/yyyy'))
SELECT * FROM dual;


