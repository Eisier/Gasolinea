-- PROCEDIMIENTOS - CUERPOS --

--Trabajadores
CREATE OR REPLACE PACKAGE BODY pruebas_trabajadores AS

PROCEDURE inicializar AS
BEGIN
    /* Borrar contenido de la tabla */
    DELETE FROM trabajadores;
END inicializar;


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
 salidaEsperada      BOOLEAN)
AS

salida BOOLEAN := true;
trabajador trabajadores%ROWTYPE;
w_id_T INTEGER;

BEGIN
    
    /* Insertar trabajador */
    INSERT INTO trabajadores 
    VALUES(sec_trabajador.nextval, w_nombre, w_apellidos, w_dni, w_telefono, w_salario, w_tipoEmpleado, w_contraseña, w_direccionImagen);
    
    /* Seleccionartrabajador y comprobar que los datos se insertan correctamente */
    w_id_T := sec_trabajador.currval;
    SELECT * INTO trabajador FROM trabajadores WHERE id_T=w_id_T;
    IF (trabajador.nombre<>w_nombre OR
    trabajador.apellidos<>w_apellidos OR
    trabajador.dni<>w_dni OR
    trabajador.telefono<>w_telefono OR
    trabajador.salario<>w_salario OR
    trabajador.tipoEmpleado<>w_tipoEmpleado OR
    trabajador.contraseña<>w_contraseña OR
    trabajador.direccionImagen<>w_direccionImagen) THEN
        salida := false;
    END IF;
    COMMIT WORK;
    
/* Mostrar resultados de la prueba */
DBMS_OUTPUT.put_line(nombre_prueba || ':' || ASSERT_EQUALS(salida, salidaEsperada));
EXCEPTION
WHEN OTHERS THEN 
    DBMS_OUTPUT.put_line(nombre_prueba || ':' || ASSERT_EQUALS(false, salidaEsperada));
    ROLLBACK;
END insertar;



PROCEDURE actualizar
 (nombre_prueba       VARCHAR2,
  w_id_T              IN trabajadores.id_T%TYPE,
  w_nombre            IN trabajadores.nombre%TYPE,
  w_apellidos         IN trabajadores.apellidos%TYPE,
  w_dni               IN trabajadores.dni%TYPE,
  w_telefono          IN trabajadores.telefono%TYPE,
  w_salario           IN trabajadores.salario%TYPE,
  w_tipoEmpleado      IN trabajadores.tipoEmpleado%TYPE,
  w_contraseña        IN trabajadores.contraseña%TYPE,
  w_direccionImagen   IN trabajadores.direccionImagen%TYPE,
  salidaEsperada      BOOLEAN)
AS

salida BOOLEAN := true;
trabajador trabajadores%ROWTYPE;

BEGIN
    
    /* Actualizar trabajador */
    UPDATE trabajadores SET nombre=w_nombre                        WHERE id_T=w_id_T;
    UPDATE trabajadores SET apellidos=w_apellidos                  WHERE id_T=w_id_T;
    UPDATE trabajadores SET dni=w_dni                              WHERE id_T=w_id_T;
    UPDATE trabajadores SET telefono=w_telefono                    WHERE id_T=w_id_T;
    UPDATE trabajadores SET salario=w_salario                      WHERE id_T=w_id_T;
    UPDATE trabajadores SET tipoEmpleado=w_tipoEmpleado            WHERE id_T=w_id_T;
    UPDATE trabajadores SET contraseña=w_contraseña                WHERE id_T=w_id_T;
    UPDATE trabajadores SET direccionImagen=w_direccionImagen      WHERE id_T=w_id_T;
    
    /* Seleccionar trabajador y comprobar que los campos se han actualizado correctamente */
    SELECT * INTO trabajador FROM trabajadores WHERE id_T=w_id_T;
    IF(trabajador.nombre<>w_nombre OR
    trabajador.apellidos<>w_apellidos OR
    trabajador.dni<>w_dni OR
    trabajador.telefono<>w_telefono OR
    trabajador.salario<>w_salario OR
    trabajador.tipoEmpleado<>w_tipoEmpleado OR
    trabajador.contraseña<>w_contraseña OR
    trabajador.direccionImagen<>w_direccionImagen) THEN
      salida := false;
    END IF;
    COMMIT WORK;
    
/* Mostrar resultados de la prueba */
DBMS_OUTPUT.put_line(nombre_prueba || ':' || ASSERT_EQUALS(salida, salidaEsperada));
EXCEPTION
WHEN OTHERS THEN 
    DBMS_OUTPUT.put_line(nombre_prueba || ':' || ASSERT_EQUALS(false, salidaEsperada));
    ROLLBACK;
END actualizar;


PROCEDURE eliminar
 (nombre_prueba       VARCHAR2,
  w_id_T              IN trabajadores.id_T%TYPE,
  salidaEsperada      BOOLEAN)
AS

salida BOOLEAN := true;
n_trabajadores INTEGER;

BEGIN

    /* Eliminar empleado */
    DELETE FROM trabajadores WHERE id_T=w_id_T;
    
    /* Verificar que el trabajador no se encuentra en la BD */
    SELECT COUNT (*) INTO n_trabajadores FROM trabajadores WHERE id_T=w_id_T;
    IF(n_trabajadores<>0) THEN
      SALIDA := false;
    END IF;
    COMMIT WORK;
    
/* Mostrar resultados de la prueba */
DBMS_OUTPUT.put_line(nombre_prueba || ':' || ASSERT_EQUALS(salida, salidaEsperada));
EXCEPTION
WHEN OTHERS THEN 
    DBMS_OUTPUT.put_line(nombre_prueba || ':' || ASSERT_EQUALS(false, salidaEsperada));
    ROLLBACK;
END eliminar;

END pruebas_trabajadores;
