-- tablas creadas en inner_join

  --test left outer join
  
  SELECT * FROM SUPPLIERS;
  
  SELECT * FROM ORDERS;
  

  --test 1
  -- me devuelve todas las columnas de las dos tablas
  -- me deuelve dos registro con los valotes completos (inner join) + los registro de primer tabla con los campos de la segunda tabla en null (left join - inner join)
  SELECT *
  FROM suppliers
  LEFT OUTER JOIN orders
  ON suppliers.supplier_id = orders.supplier_id; 
  
  --test 2 
  --  me devuelve todas las columnas de las dos tablas, y el join de cada registro de una tabla con los registros de la otra
  SELECT *
  FROM suppliers
  LEFT OUTER JOIN orders
  ON 1 = 1; 
  
  
  --test 3
  -- me devuelve todas las columnas de la tabla supplier
  -- me devuelve todos los registros de la tabla supplier
  SELECT suppliers.supplier_id, suppliers.supplier_name
  FROM suppliers
  LEFT OUTER JOIN orders
  ON suppliers.supplier_id = orders.supplier_id;  
  