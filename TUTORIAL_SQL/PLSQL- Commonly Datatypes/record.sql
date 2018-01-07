--TYPE RECORD

--Almacena los datos del primer cliente en un registro y lo muestra por dbms
DECLARE
  TYPE vendedor_record_type IS RECORD ( field_0 VENDEDORES.ID%type,
                                        field_1 VENDEDORES.NOMBRE%type,
                                        field_2 VENDEDORES.APELLIDO%type);
  
  vendedor vendedor_record_type;                       
BEGIN
  SELECT tbl_vd.id, tbl_vd.nombre, tbl_vd.apellido
  INTO vendedor.field_0, vendedor.field_1, vendedor.field_2
  FROM xxlink.VENDEDORES tbl_vd
  WHERE tbl_vd.id = 1;
  
  DBMS_OUTPUT.PUT_LINE('ID vendedor: ' || vendedor.field_0);
  DBMS_OUTPUT.PUT_LINE('Nombre vendedor: ' || vendedor.field_1);
  DBMS_OUTPUT.PUT_LINE('Apellido vendedor: ' || vendedor.field_2);

EXCEPTION WHEN OTHERS THEN
  NULL;
END;