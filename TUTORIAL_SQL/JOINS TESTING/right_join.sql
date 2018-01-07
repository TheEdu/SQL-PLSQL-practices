-- test right join (tablas creadas en inner_join)

  -- test right join
  
   SELECT * FROM SUPPLIERS;
  
   SELECT * FROM ORDERS;
   
   
   -- test 1
   -- me muestra las columnas (order_id, order_date, supplier_name)
   -- todos los registros de la tabla 2 (completada la comlumna de la tabla 1 con null para estos registros) + los resgistros del inner  join entre la tabla 1 y la 2
     
    SELECT orders.order_id, orders.order_date, suppliers.supplier_name
    FROM suppliers
    RIGHT OUTER JOIN orders
    ON suppliers.supplier_id = orders.supplier_id;
    
   --test 2 (version del test1 con el left join y el orden de las tablas invertido) 
    SELECT orders.order_id, orders.order_date, suppliers.supplier_name
    FROM orders
    LEFT OUTER JOIN suppliers
    ON suppliers.supplier_id = orders.supplier_id;
    
    -- test 3 
    --  me devuelve todas las columnas de las dos tablas, y el join de cada registro de una tabla con los registros de la otra
    SELECT *
    FROM orders
    RIGHT OUTER JOIN suppliers
    ON 1 = 1; 

    