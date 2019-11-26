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
/

--LineaCompras
CREATE OR REPLACE PACKAGE BODY Pruebas_lineaCompras IS

  PROCEDURE inicializar IS
    BEGIN 
      /*borrar contenido de la tabla*/
      DELETE FROM lineaCompras;
  END inicializar;  
  
  PROCEDURE insertar(nombre_prueba VARCHAR2,  w_cantidad IN lineaCompras.cantidad%TYPE, w_Id_I IN lineaCompras.Id_I%TYPE, salida_esperada BOOLEAN) IS
    salida BOOLEAN := true;
    lineaCompra lineaCompras%ROWTYPE;
    w_Id_L NUMBER;
    BEGIN
      /*Insertar lineaCompra*/
      INSERT INTO lineaCompras VALUES(sec_lineaCompra.nextval,w_cantidad, w_Id_I);
      
      /*Seleccionar lineaCompra y comprobar que los datos se insertaron correctamente*/
      w_Id_L := sec_lineaCompra.currval;
      SELECT * INTO lineaCompra FROM lineaCompras WHERE Id_L = w_Id_L;
      IF(lineaCompra.cantidad<>w_cantidad OR lineaCompra.Id_I<>w_Id_I)THEN
        salida := false;
      END IF;  
      COMMIT WORK;
      
      /*Mostrar resultado de la prueba*/
      DBMS_OUTPUT.put_line(nombre_prueba || ':' || ASSERT_EQUALS(salida, salida_esperada));
      
      EXCEPTION
      WHEN OTHERS THEN
        DBMS_OUTPUT.put_line(nombre_prueba || ':' || ASSERT_EQUALS(false,salida_Esperada));
        ROLLBACK;
  END insertar;  
  
  PROCEDURE actualizar(nombre_prueba VARCHAR2, w_Id_L IN lineaCompras.Id_L%TYPE, w_cantidad IN lineaCompras.cantidad%TYPE, w_Id_I IN lineaCompras.Id_I%TYPE, salida_esperada BOOLEAN) IS
    salida BOOLEAN := true;
    lineaCompra lineaCompras%ROWTYPE;
    BEGIN
      
      /*Actualizar lineaCompra*/
      UPDATE lineaCompras SET Cantidad = w_cantidad, Id_I =w_Id_I WHERE  Id_L = w_Id_L;
      
      /*Seleccionar lineaCompra y comprobar que los campos se actualizaron correctamente*/
      SELECT * INTO lineaCompra FROM lineaCompras WHERE Id_L = w_Id_L;
      IF(lineaCompra.cantidad<>w_cantidad OR lineaCompra.Id_I<>w_Id_I)THEN
        salida := false;
      END IF;  
      COMMIT WORK;
      
      /*Mostrar resultado de la prueba*/
      DBMS_OUTPUT.put_line(nombre_prueba || ':' || ASSERT_EQUALS(salida, salida_esperada));
      
      EXCEPTION
      WHEN OTHERS THEN
        DBMS_OUTPUT.put_line(nombre_prueba || ':' || ASSERT_EQUALS(false,salida_Esperada));
        ROLLBACK;
  END actualizar;
  
  PROCEDURE eliminar(nombre_prueba VARCHAR2, w_Id_L IN lineaCompras.Id_L%TYPE, salida_Esperada BOOLEAN) IS
    salida BOOLEAN := true;
    n_lineaCompras INTEGER;
    BEGIN
    
      /*Eliminar lineaCompra*/
      DELETE FROM lineaCompras WHERE Id_L = w_Id_L;
      
      /*Verificar que la lineaCompra no se encuentra en la BD*/
      SELECT COUNT(*) INTO n_lineaCompras FROM lineaCompras WHERE Id_L = w_Id_L;
      IF(n_lineaCompras <> 0) THEN
        salida := false;
      END IF;
      COMMIT WORK;
      
      /*Mostrar resultado de la prueba*/
      DBMS_OUTPUT.put_line(nombre_prueba || ':' || ASSERT_EQUALS(salida, salida_Esperada));
      
      EXCEPTION
      WHEN OTHERS THEN
        DBMS_OUTPUT.put_line(nombre_prueba || ':' || ASSERT_EQUALS(salida, salida_Esperada));
        ROLLBACK;
  END eliminar;
  
END Pruebas_lineaCompras;
/

--Compras
CREATE OR REPLACE PACKAGE BODY Pruebas_Compras IS
  
  PROCEDURE inicializar
  IS BEGIN
    DELETE FROM compras;
  END inicializar;
 
  PROCEDURE insertar(nombre_prueba VARCHAR2,w_fechaPedido IN COMPRAS.FECHAPEDIDO%TYPE, w_fechaRecogida IN compras.fechaRecogida%TYPE, w_Pagado IN compras.pagado%TYPE, w_Id_C IN compras.Id_C%TYPE, w_Id_T IN compras.Id_T%TYPE, w_Id_L IN compras.Id_L%TYPE, salida_Esperada BOOLEAN) IS
    salida BOOLEAN := true;
    compra compras%ROWTYPE;
    w_Id_COM NUMBER;
    BEGIN
    
      /*Insertar compra*/
       INSERT INTO Compras VALUES (sec_compra.nextval,w_fechaPedido,w_fechaRecogida,W_Pagado,w_Id_C,w_Id_T,w_Id_L);
 
      /*Seleccionar compra y comprobar que los datos se insertaron correctamente*/
      w_Id_COM := sec_compra.currval;
      SELECT * INTO compra FROM compras WHERE Id_COM = w_Id_COM;
      IF(compra.fechaPedido<>w_fechaRecogida OR compra.fechaRecogida<>w_fechaRecogida OR compra.pagado<>w_pagado OR compra.Id_C<>w_Id_C OR compra.Id_T<>w_Id_T OR compra.Id_L<>w_Id_L)THEN
        salida := true;
      END IF;  
      COMMIT WORK;
  
      /*Mostrar resultado de la prueba*/
      DBMS_OUTPUT.put_line(nombre_prueba || ':' || ASSERT_EQUALS(salida,salida_Esperada));
      
      EXCEPTION
      WHEN OTHERS THEN
        DBMS_OUTPUT.put_line(nombre_prueba || ':' || ASSERT_EQUALS(false,salida_Esperada));
        ROLLBACK;
  END insertar;
  
  PROCEDURE actualizar(nombre_prueba VARCHAR2,w_Id_COM IN Compras.Id_COM%TYPE, w_fechaPedido IN COMPRAS.FECHAPEDIDO%TYPE, w_fechaRecogida IN compras.fechaRecogida%TYPE, w_Pagado IN compras.pagado%TYPE,w_Id_C IN compras.Id_C%TYPE, w_Id_T IN compras.Id_T%TYPE, w_Id_L IN compras.Id_L%TYPE, salida_Esperada BOOLEAN) IS
    salida BOOLEAN := true;
    compra compras%ROWTYPE;
    BEGIN
      /*Actualizar compra*/
      UPDATE Compras SET fechaPedido = w_fechaPedido, fechaRecogida = w_fechaRecogida, Pagado =w_pagado ,Id_C = w_Id_C, Id_T = w_Id_T, Id_L = w_Id_L WHERE Id_COM = w_Id_COM;
      
      /*Seleccionar compra y comprobar que los campos se actualizan correctamente*/
      SELECT * INTO compra FROM compras WHERE Id_COM = w_Id_COM;
      IF(compra.fechaPedido<>w_fechaRecogida OR compra.fechaRecogida<>w_fechaRecogida OR compra.pagado<>w_pagado OR compra.Id_C<>w_Id_C OR compra.Id_T<>w_Id_T OR compra.Id_L<>w_Id_L)THEN
        salida := true;
      END IF;  
      COMMIT WORK; 

     /*Mostrar resultado de la prueba*/
      DBMS_OUTPUT.put_line(nombre_prueba || ':' || ASSERT_EQUALS(salida,salida_Esperada));
      
      EXCEPTION
      WHEN OTHERS THEN
        DBMS_OUTPUT.put_line(nombre_prueba || ':' || ASSERT_EQUALS(false,salida_Esperada));
        ROLLBACK;
  END actualizar;
  
  PROCEDURE eliminar(nombre_prueba VARCHAR2, w_Id_COM IN compras.Id_COM%TYPE, salida_Esperada BOOLEAN) IS
    salida BOOLEAN := true;
    n_compras INTEGER;
    BEGIN
    
      /*Eliminar compra*/
      DELETE FROM compras WHERE Id_COM = w_Id_COM;
      
      /*Verificar que la compra no se encuentra en la BD*/
      SELECT COUNT(*) INTO n_compras FROM compras WHERE Id_COM=w_Id_COM;
      IF(n_compras<>0) THEN
        salida := false;
      END IF;
      COMMIT WORK;
      
      /*Mostrar resultado de la prueba*/
      DBMS_OUTPUT.put_line(nombre_prueba || ':' || ASSERT_EQUALS(salida,salida_Esperada));
      
      EXCEPTION
      WHEN OTHERS THEN
        DBMS_OUTPUT.put_line(nombre_prueba || ':' || ASSERT_EQUALS(false,salida_Esperada));
        ROLLBACK;
   END eliminar;     
      
END Pruebas_Compras;
/

--Combustible
CREATE OR REPLACE PACKAGE BODY Pruebas_COMBUSTIBLES IS

  PROCEDURE inicializar
  IS BEGIN
    DELETE FROM combustibles;
  END inicializar;
  
  PROCEDURE insertar (nombre_prueba VARCHAR2, w_TipoCombustible IN COMBUSTIBLES.TIPOCOMBUSTIBLE%TYPE, w_ID_I IN COMBUSTIBLES.ID_I%TYPE, salida_Esperada BOOLEAN) IS
    salida BOOLEAN := true;
    combustible combustibles%ROWTYPE;
    w_Id_COMB NUMBER;
    BEGIN
      /*Insertar COMBUSTIBLE*/ 
      INSERT INTO Combustibles
      VALUES (sec_combustible.nextval,w_tipoCombustible,w_ID_I);
      /*Seleccionar combustible y comprobar que los datos se insertaron correctamente*/
      w_Id_COMB := sec_combustible.currval;
      SELECT * INTO combustible FROM combustibles WHERE Id_COMB = w_Id_COMB;
      IF(combustible.tipoCombustible<>w_tipoCombustible OR combustible.ID_I<>w_ID_I) THEN
        salida := false;
      END IF;  
    COMMIT WORK;
    
    /*Mostrar resultado de la prueba*/
    DBMS_OUTPUT.put_line(nombre_prueba || ':' || ASSERT_EQUALS(salida,salida_Esperada));
    
    EXCEPTION
    WHEN OTHERS THEN
      DBMS_OUTPUT.put_line(nombre_prueba || ':' || ASSERT_EQUALS(false,salida_Esperada));
      ROLLBACK;
  END insertar;

  PROCEDURE actualizar(nombre_prueba  VARCHAR2, w_ID_COMB IN COMBUSTIBLES.ID_COMB%TYPE,w_TipoCombustible IN COMBUSTIBLES.TIPOCOMBUSTIBLE%TYPE, w_ID_I IN COMBUSTIBLES.ID_I%TYPE, salida_Esperada BOOLEAN) IS
    salida BOOLEAN := true;
    combustible combustibles%ROWTYPE;
    BEGIN
      /*Actualizar combustible*/
      UPDATE combustibles SET tipoCombustible=w_tipoCombustible, ID_I=w_ID_I WHERE Id_COMB = w_Id_COMB;
      /*Seleccionar combustible y comprobar que los campos se actualizan correctamente*/
      SELECT * INTO combustible FROM combustibles WHERE Id_COMB = w_Id_COMB;
      IF (combustible.tipoCombustible<>w_tipoCombustible OR combustible.ID_I<>w_ID_I) THEN
        salida := false;
      END IF;
      COMMIT WORK;
      
      /*Mostrar resultado de la prueba*/
      DBMS_OUTPUT.put_line(nombre_prueba || ':' || ASSERT_EQUALS(salida,salida_Esperada));
      
      EXCEPTION
      WHEN OTHERS THEN
        DBMS_OUTPUT.put_line(nombre_prueba || ':' || ASSERT_EQUALS(false,salida_Esperada));
   END actualizar;
   
   PROCEDURE eliminar(nombre_prueba VARCHAR2, w_ID_COMB IN COMBUSTIBLES.ID_COMB%TYPE, salida_Esperada BOOLEAN) IS
    salida BOOLEAN := true;
    n_combustibles INTEGER;
    BEGIN
      /*Eliminar clientes*/
      DELETE FROM combustibles WHERE Id_COMB=w_Id_COMB;
      /*Verificar que el combustibles no se encuentra en la BD*/
      SELECT COUNT(*) INTO n_combustibles FROM combustibles WHERE Id_COMB=w_Id_COMB;
      IF(n_combustibles<>0) THEN
        salida := false;
      END IF;
      COMMIT WORK;
      
      /*Mostrar resultado de la prueba*/
      DBMS_OUTPUT.put_line(nombre_prueba || ':' || ASSERT_EQUALS(salida,salida_Esperada));
      
      EXCEPTION
      WHEN OTHERS THEN
        DBMS_OUTPUT.put_line(nombre_prueba || ':' || ASSERT_EQUALS(false,salida_Esperada));
        ROLLBACK;
   END eliminar;     
END Pruebas_COMBUSTIBLES;  
/

--Almacenes
CREATE OR REPLACE
PACKAGE BODY pruebas_almacenes AS
  /*Inicializacion*/
  PROCEDURE inicializar AS
  BEGIN 
    /*Borrar contenido de la tabla*/
    DELETE FROM almacenes;
  END inicializar;
  /*Prueba para la insercion de almacenes*/
  PROCEDURE insertar 
   (nombre_prueba VARCHAR2,
   w_direccion in almacenes.direccion%TYPE,
   w_ciudad in almacenes.ciudad%TYPE,
   w_provincia in almacenes.provincia%TYPE,
   salidaEsperada BOOLEAN) AS
  
   salida BOOLEAN :=true;
   almacen almacenes%ROWTYPE;
   w_id_a INTEGER;
  BEGIN
  
    /*Insertar almacen*/
    INSERT INTO almacenes VALUES (sec_almacen.NEXTVAL, w_direccion, w_ciudad, w_provincia);
    
    /*Seleccionar almacen y comprobar que los datos se insertaron bien*/
    w_id_a := sec_almacen.currval;
    SELECT * INTO almacen FROM almacenes WHERE id_a = w_id_a;
    IF (almacen.direccion<>w_direccion
      OR almacen.ciudad<>w_ciudad
      OR almacen.provincia<> w_provincia)THEN
      salida:=false;
    END IF;
    COMMIT WORK;
    
    /*Mostrar resultado de la prueba*/
    DBMS_OUTPUT.put_line(nombre_prueba || ':' || ASSERT_EQUALS(salida,salidaEsperada));
    
    EXCEPTION
    WHEN OTHERS THEN
      DBMS_OUTPUT.put_line(nombre_prueba || ':' || ASSERT_EQUALS(false,salidaEsperada));
      ROLLBACK;
  END insertar;
  /*Prueba para la actualizacion de almacenes*/
  PROCEDURE actualizar (nombre_prueba VARCHAR2,
    w_id_a in almacenes.id_a%TYPE,
    w_direccion in almacenes.direccion%TYPE,
    w_ciudad in almacenes.ciudad%TYPE,
    w_provincia in almacenes.provincia%TYPE,
    salidaEsperada BOOLEAN) AS
    
    almacen almacenes%ROWTYPE;
    salida BOOLEAN :=true;
  BEGIN
    /*Actualizar almacen*/
    UPDATE almacenes SET direccion = w_direccion, ciudad = w_ciudad, provincia = w_provincia
      WHERE id_a = w_id_a;
    /*Seleccionar almacen y comprobar que los campos se actualizaron correctamente*/
    SELECT * INTO almacen FROM almacenes WHERE id_a = w_id_a;
    IF (almacen.direccion<>w_direccion OR almacen.ciudad<>w_ciudad OR almacen.provincia<>w_provincia)
      THEN salida := false;
    END IF;
    COMMIT WORK;
      /*Mostrar resultado de la prueba*/
    DBMS_OUTPUT.put_line(nombre_prueba || ':' || ASSERT_EQUALS(salida,salidaEsperada));
    
    EXCEPTION
    WHEN OTHERS THEN
      DBMS_OUTPUT.put_line(nombre_prueba || ':' || ASSERT_EQUALS(false,salidaEsperada));
      ROLLBACK;
  END actualizar;
  /*Prueba para la eliminacion de almacenes*/
  PROCEDURE eliminar (nombre_prueba VARCHAR2,
    w_id_a in almacenes.id_a%TYPE,
    salidaEsperada BOOLEAN) AS
    
    salida BOOLEAN := true;
    n_almacenes INTEGER;
  BEGIN
    /*Eliminar almacen*/
    DELETE FROM almacenes WHERE id_a = w_id_a;
    /*Verificar que el almacen no se encuentre en la bd*/
    SELECT COUNT (*) INTO n_almacenes FROM almacenes WHERE id_a = w_id_a;
    IF (n_almacenes<> 0) 
      THEN salida :=true ; 
    END IF;
    COMMIT WORK;
    
    /*Mostrar resultado de la prueba*/
    DBMS_OUTPUT.put_line(nombre_prueba || ':' || ASSERT_EQUALS(salida, salidaEsperada));
    EXCEPTION
    WHEN OTHERS THEN
          DBMS_OUTPUT.put_line(nombre_prueba || ':' || ASSERT_EQUALS(false, salidaEsperada));
          ROLLBACK;
  END eliminar;

END;
/

