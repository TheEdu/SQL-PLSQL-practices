--test full join(tablas creadas en inner join)
 
  -- test full join (left + right)
  
  SELECT * FROM SUPPLIERS;
  
  SELECT * FROM ORDERS;
  
  --test 1
  -- devuelve las columnas mostradas en select
  -- devuelve todos los registros de la tabla 1 + todos los registro de la tabla 2 (cumplan o no la condicion)
  -- si no cumplen la condicion a los columnas joineadas de la otra tabla va a tener el valor Null
  SELECT suppliers.supplier_id, orders.supplier_id ,suppliers.supplier_name, orders.order_date
  FROM suppliers
  FULL OUTER JOIN orders
  ON suppliers.supplier_id = orders.supplier_id;
  
  -- test 2
  -- me devuelve todas las columnas de las dos tablas, y el join de cada registro de una tabla con los registros de la otra
  SELECT *
  FROM suppliers
  FULL OUTER JOIN orders
  ON 1=1;