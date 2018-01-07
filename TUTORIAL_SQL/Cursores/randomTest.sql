SELECT vd.nombre, count(VT.FECHA)
FROM vendedores vd
INNER JOIN ventas vt
ON VD.id = VT.VENDEDOR_ID
GROUP BY VD.NOMBRE;

