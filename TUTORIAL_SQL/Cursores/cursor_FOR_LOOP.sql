--Cursor FOR LOOP, declaring the cursor
DECLARE

  CURSOR ingresos_por_vendedor IS
    SELECT 
      vendedores.nombre_completo AS NOMBRE_VENDEDOR,
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

BEGIN
  FOR vendedor IN ingresos_por_vendedor LOOP
    DBMS_OUTPUT.PUT_LINE('Vendedor: ' || vendedor.NOMBRE_VENDEDOR ||
                        '. INGRESOS GENERADOS: ' || vendedor.INGRESOS_VENDEDOR || '.');
  END LOOP;
END;