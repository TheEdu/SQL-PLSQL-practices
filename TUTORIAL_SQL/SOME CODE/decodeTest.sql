
--probando el decode (alta magia)

select * 
from vendedores vd
inner join ventas vt
on vd.id = vt.vendedor_id;

select decode(1,1,query.nombre || ' ,' ||query.apellido) AS NOMBRE_COMPLETO,
       decode(1,1,SUM(query.precio*query.cantidad)) AS INGRESO_TOTAL,
       decode(1,1,(SELECT * FROM dual)) AS SELECT_TEST
from (select * 
      from vendedores vd
      inner join ventas vt
      on vd.id = vt.vendedor_id
      inner join productos p
      on p.id = vt.producto_id ) query
GROUP BY query.nombre,query.nombre || ' ,' ||query.apellido;


create table lideres(
  id number primary key
);

select * from xxmof.tbl_lideres;



