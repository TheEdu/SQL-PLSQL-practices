SELECT get_name(vd.id) AS NOMBRE_COMPLETO
  FROM VENDEDORES vd
  INNER JOIN VENTAS vt
  ON vd.id = vt.vendedor_id
GROUP BY vd.id;
