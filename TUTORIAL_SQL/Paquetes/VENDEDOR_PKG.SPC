-- VENDEDOR_PKG.SPC
CREATE OR REPLACE PACKAGE vendedor_pkg 
AS
  PROCEDURE calc_sueldo_vendedor(p_dni IN XXLINK.VENDEDORES.DNI%TYPE);
  PROCEDURE list_vendedores;
  PROCEDURE delete_vendedor(p_dni XXLINK.VENDEDORES.DNI%TYPE);
  PROCEDURE create_vendedor(p_nombre IN xxlink.vendedores.nombre%type, 
                                            p_apellido IN xxlink.vendedores.apellido%type, 
                                            p_departamento IN xxlink.departamentos.nombre%type, 
                                            p_dni IN xxlink.vendedores.dni%type);
  PROCEDURE update_vendedor(p_dni IN XXLINK.VENDEDORES.DNI%TYPE,
                                            p_nombre IN XXLINK.VENDEDORES.NOMBRE%TYPE DEFAULT 'NULL_BY_DEFAULT',
                                            P_apellido IN XXLINK.VENDEDORES.APELLIDO%TYPE DEFAULT 'NULL_BY_DEFAULT',
                                            p_departamento IN XXLINK.DEPARTAMENTOS.NOMBRE%TYPE DEFAULT 'NULL_BY_DEFAULT');
END vendedor_pkg;