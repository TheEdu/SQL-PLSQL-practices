--practicas de joins

--Mostrar VENDEDORES
SELECT DISTINCT vend.id AS VENDEDOR_ID, vend.nombre || ' ,' || vend.apellido as NOMBRE_COMPLETO
FROM VENDEDORES vend
INNER JOIN VENTAS vent
ON vend.id = vent.vendedor_id;

--Mostrar INGRESOS X PRODUCTO
SELECT
  RANK() OVER(ORDER BY (p.precio * SUM(v.cantidad)) DESC) AS TOP_RANKING,
  p.descripcion AS PRODUCTO_DESC,  
  p.precio as PRECIO, 
  SUM(v.cantidad) AS CANTIDAD_VENDIDA, 
  p.precio * SUM(v.cantidad) AS INGRESOS_PRODUCTO
FROM VENTAS v
INNER JOIN PRODUCTOS p
ON  p.id = v.producto_id
GROUP BY  p.descripcion,p.precio;
--ORDER BY p.precio * SUM(v.cantidad) DESC; -- no es necesario porque ya lo ordena el RANK

--MOSTRAR INGRESOS X VENTA
SELECT
  v.vendedor_id AS VENDEDOR_ID,
  v.fecha AS FECHA_VENTA,
  p.descripcion AS PRODUCTOS_DESC,
  v.cantidad AS CANTIDAD,
  p.precio AS PRECIO,
  v.cantidad*p.precio AS INGRESOS
FROM VENTAS v
INNER JOIN PRODUCTOS p
ON  p.id = v.producto_id
ORDER BY v.cantidad*p.precio DESC;

--Mostrar INGRESOS_TOTALES X VENDEDOR (con sub-querys)
SELECT 
  vendedores.nombre_completo AS VENDEDOR,
  SUM(ventas.ingresos) AS INGRESOS_VENDEDOR
FROM (SELECT DISTINCT vend.id AS VENDEDOR_ID, vend.nombre || ' ,' || vend.apellido as NOMBRE_COMPLETO
      FROM VENDEDORES vend
      INNER JOIN VENTAS vent
      ON vend.id = vent.vendedor_id) vendedores
INNER JOIN (SELECT
              v.vendedor_id AS VENDEDOR_ID,
              v.fecha AS FECHA_VENTA,
              p.descripcion AS PRODUCTOS_DESC,
              v.cantidad AS CANTIDAD,
              p.precio AS PRECIO,
              v.cantidad*p.precio AS INGRESOS
            FROM VENTAS v
            INNER JOIN PRODUCTOS p
            ON  p.id = v.producto_id
            ORDER BY v.fecha ASC) ventas
ON  vendedores.vendedor_id = ventas.vendedor_id
GROUP BY vendedores.nombre_completo
ORDER BY SUM(ventas.ingresos) DESC;


--Mostrar INGRESOS X VENDEDOR (otra forma)
--Primero saque la tabla de "ingresos_totales_por_vendedor(VENDEDOR_ID,INGRESO_TOTAL) utilizando un doble join para juntar las tablas ("ventas"+"vendedores"+"prductos")
--Segundo hice un JOIN de esa tabla con la tabla de vendedores (para poder sacar el NOMBRE_COMPLETO y evitar los issues con el GROUP BY)

SELECT vd.nombre || ' ,' || vd.apellido AS VENDEDOR, ingresos_totales_por_vendedor.INGRESO_TOTAL AS INGRESOS_VENDEDOR
FROM VENDEDORES vd
INNER JOIN (SELECT vt.vendedor_id AS VENDEDOR_ID, (SUM(vt.cantidad*p.precio)) AS INGRESO_TOTAL
            FROM VENTAS vt
            INNER JOIN PRODUCTOS p ON vt.producto_id = p.id
            INNER JOIN VENDEDORES vd ON vt.vendedor_id = vd.id
            GROUP BY vt.vendedor_id) ingresos_totales_por_vendedor      
ON vd.id = ingresos_totales_por_vendedor.VENDEDOR_ID
ORDER BY ingresos_totales_por_vendedor.INGRESO_TOTAL DESC;

--Mostrar INGRESOS TOTALES X DIA
SELECT 
  vt.fecha AS DIA, 
  SUM(vt.cantidad*p.precio) AS INGRESO_DIA,
  RANK() OVER(ORDER BY  SUM(vt.cantidad*p.precio) DESC) as TOP_RANK
FROM VENTAS vt
INNER JOIN PRODUCTOS p
ON vt.producto_id = p.id
GROUP BY vt.fecha
ORDER BY vt.fecha;


