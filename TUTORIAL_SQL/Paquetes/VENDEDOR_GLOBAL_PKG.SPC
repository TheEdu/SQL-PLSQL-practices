-- VENDEDOR_GLOBAL_PKG.SPC
CREATE OR REPLACE PACKAGE XXLINK.vendedor_global_pkg 
AS
  g_base CONSTANT NUMBER DEFAULT 5000;
  --g_ingreso_vendedor NUMBER;
  --g_sueldo_vendedor NUMBER;
  no_existe_vendedor EXCEPTION;
  
  CURSOR g_rc_get_vendedor_id(p_vd_dni XXLINK.VENDEDORES.DNI%TYPE) IS
    SELECT tbl_vd.id
      FROM XXLINK.VENDEDORES tbl_vd
    WHERE tbl_vd.dni = p_vd_dni; 
  
END vendedor_global_pkg;
/* Declaro todas las variables, constantes y cursores globales en otro pacquete,
   Para que mi paquete vendedor_pkg sea STATELESS y asi evitar problemas 
   (en otras sesiones que esten usando vendedor_pkg) 
   al recompilar el paquete vendedor_pkg.
*/
