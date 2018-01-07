--testing joins
  
  --creacion e inicializacion de tablas
  --https://www.techonthenet.com/oracle/joins.php
  create table suppliers(
    supplier_id NUMBER PRIMARY KEY,
    supplier_name varchar(50)
  );
  
  INSERT 
   INTO suppliers(supplier_id,supplier_name )
   VALUES (10000,'IBM');
  
 INSERT 
  INTO suppliers(supplier_id,supplier_name )
  VALUES (10001,'Hewlett Packard');
  
 INSERT 
  INTO suppliers(supplier_id,supplier_name )
  VALUES (10002,'Microsoft');
  
 INSERT 
  INTO suppliers(supplier_id,supplier_name )
  VALUES (10003,'NVIDIA');
  
  drop table orders;
  create table orders (
    order_id number primary key, 
    supplier_id number,
    order_date date
  );
  
 INSERT 
  INTO orders(order_id,supplier_id,order_date)
  VALUES (500125,10000,TO_DATE('2003/05/12','yyyy/mm/dd'));
  
 INSERT 
  INTO orders(order_id,supplier_id,order_date)
  VALUES (500126,10001,TO_DATE('2003/05/13','yyyy/mm/dd'));

 INSERT 
  INTO orders(order_id,supplier_id,order_date)
  VALUES (500127,10004,TO_DATE('2003/05/14','yyyy/mm/dd'));

  --test inner join
  
  SELECT * FROM SUPPLIERS;
  
  SELECT * FROM ORDERS;
  
  -- test 1
  -- todas las columnas de las dos tablas, y el join de cada registro de una tabla con los registros de la otra
  SELECT *
  FROM suppliers sup
  INNER JOIN orders ord
  ON 1 = 1;
    
  -- test 2  
  -- solo me devuelve las columnas (supplier_id, supplier_name y order_date)
  -- solo me devuelve los registros que cumplen (suppliers.supplier_id = orders.supplier_id)
  SELECT suppliers.supplier_id, suppliers.supplier_name, orders.order_date
  FROM suppliers, orders
  WHERE suppliers.supplier_id = orders.supplier_id;
  
  --test 3
  --idem test 2, pero con todas las columnas de las 2 tablas
  SELECT *
  FROM suppliers, orders
  WHERE suppliers.supplier_id = orders.supplier_id;

  
  
  
  