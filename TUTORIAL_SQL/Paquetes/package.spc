CREATE OR REPLACE PACKAGE XXLINK.package_name AS
  g_constant CONSTANT NUMBER(3,0) DEFAULT 100;
  g_variable NUMBER DEFAULT 0;
  
  CURSOR g_rc_get_vendedor_id(p_vendedor_dni XXLINK.VENDEDORES.DNI%TYPE) IS
    SELECT tbl_vd.ID
      FROM XXLINK.VENDEDORES tbl_vd
    WHERE tbl_vd.DNI = p_vendedor_dni; 
  /*
  PACKAGES PROCEDURES AND FUNCTIONS (INTERFACES!!! note:  the declaration is in
                                                          the package body)
  */ 
END XXLINK.package_name;