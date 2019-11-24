-- PAQUETES - CABECERAS --

--Trabajadores
CREATE OR REPLACE PACKAGE pruebas_trabajadores AS
  
  PROCEDURE inicializar;
  
  PROCEDURE insertar
  (nombre_prueba       VARCHAR2,
   w_nombre            IN trabajadores.nombre%TYPE,
   w_apellidos         IN trabajadores.apellidos%TYPE,
   w_dni               IN trabajadores.dni%TYPE,
   w_telefono          IN trabajadores.telefono%TYPE,
   w_salario           IN trabajadores.salario%TYPE,
   w_tipoEmpleado      IN trabajadores.tipoEmpleado%TYPE,
   w_contraseña        IN trabajadores.contraseña%TYPE,
   w_direccionImagen   IN trabajadores.direccionImagen%TYPE,
   salidaEsperada      BOOLEAN);

   PROCEDURE actualizar
   (nombre_prueba       VARCHAR2,
   w_id_T               IN trabajadores.id_T%TYPE,
   w_nombre             IN trabajadores.nombre%TYPE,
   w_apellidos          IN trabajadores.apellidos%TYPE,
   w_dni                IN trabajadores.dni%TYPE,
   w_telefono           IN trabajadores.telefono%TYPE,
   w_salario            IN trabajadores.salario%TYPE,
   w_tipoEmpleado       IN trabajadores.tipoEmpleado%TYPE,
   w_contraseña         IN trabajadores.contraseña%TYPE,
   w_direccionImagen    IN trabajadores.direccionImagen%TYPE,
   salidaEsperada       BOOLEAN);

   PROCEDURE eliminar
   (nombre_prueba   VARCHAR2,
    w_id_T          IN trabajadores.id_T%TYPE,
   salidaEsperada   BOOLEAN);
 END pruebas_trabajadores;
