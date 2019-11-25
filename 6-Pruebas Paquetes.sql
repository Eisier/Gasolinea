ALTER SESSION SET NLS_DATE_FORMAT='DD/MM/YYYY HH24:MI';   --Modificar como nos muestra las fechas
/*Activar salida de texto por pantalla*/
SET SERVEROUTPUT ON;

  DECLARE
    Id_C NUMBER;
    Id_T NUMBER;
    Id_E NUMBER;
    Id_I NUMBER;
    Id_COMB NUMBER;
    Id_A NUMBER;
    Id_PRO NUMBER;
    Id_P NUMBER;
    Id_L NUMBER;
    Id_COM NUMBER;
  BEGIN

 /**************************************************************************
          PRUEBAS DE LAS OPERACIONES SOBRE LA TRABAJADOR
  **************************************************************************/ 
DBMS_OUTPUT.PUT_LINE('---------------------------------------------Pruebas Paquetes Trabajador-----------------------------------------------------');
  
pruebas_trabajadores.inicializar;
pruebas_trabajadores.insertar('Prueba 34 - Insercción trabajador correcto','Claudia', 'Guerrero Cuenca', '45555588L', '666555444', 1000, 'DEPENDIENTE', '1478', 'FOTO1', true);
id_T := sec_trabajador.currval;
pruebas_trabajadores.insertar('Prueba 35 - Insercción trabajador con nombre nulo',null, 'Guerrero Cuenca', '45555588L', '666555444', 1000, 'DEPENDIENTE', '1478', 'FOTO1', false);
pruebas_trabajadores.insertar('Prueba 36 - Insercción trabajador con apellidos nulo','Claudia', null, '45555588L', '666555444', 1000, 'DEPENDIENTE', '1478', 'FOTO1', false);
pruebas_trabajadores.insertar('Prueba 37 - Insercción trabajador con dni nulo','Claudia', 'Guerrero Cuenca', null, '666555444', 1000, 'DEPENDIENTE', '1478', 'FOTO1', false);
pruebas_trabajadores.insertar('Prueba 38 - Insercción trabajador con telefono nulo','Claudia', 'Guerrero Cuenca', '45555588L', null, 1000, 'DEPENDIENTE', '1478', 'FOTO1', false);
pruebas_trabajadores.insertar('Prueba 39 - Insercción trabajador con salario nulo','Claudia', 'Guerrero Cuenca', '45555588L', '666555444', null, 'DEPENDIENTE', '1478', 'FOTO1', false);
pruebas_trabajadores.insertar('Prueba 40 - Insercción trabajador con tipoEmpleado nulo','Claudia', 'Guerrero Cuenca', '45555588L', '666555444', 1000, 'null', '1478', 'FOTO1', false);
pruebas_trabajadores.insertar('Prueba 41 - Insercción trabajador con contraseña nulo','Claudia', 'Guerrero Cuenca', '45555588L', '666555444', 1000, 'DEPENDIENTE', null, 'FOTO1', false);
pruebas_trabajadores.insertar('Prueba 42 - Insercción trabajador con direccionImagen nulo','Claudia', 'Guerrero Cuenca', '45555588L', '666555444', 1000, 'DEPENDIENTE', '1478', null, false);
pruebas_trabajadores.insertar('Prueba 43 - Insercción trabajador con DNI superando numero de caracteres en DNI','Claudia', 'Guerrero Cuenca', '4555511588L', '666555444', 1000, 'DEPENDIENTE', '1478', 'FOTO1', false);
pruebas_trabajadores.insertar('Prueba 44 - Insercción trabajador con DNI superando numero de caracteres en telefono','Claudia', 'Guerrero Cuenca', '45555588L', '66655599444', 1000, 'DEPENDIENTE', '1478', 'FOTO1', false);
pruebas_trabajadores.insertar('Prueba 45 - Insercción trabajador de letras y numeros cambiados en DNI','Claudia', 'Guerrero Cuenca', '45C555A8L', '666555444', 1000, 'DEPENDIENTE', '1478', 'FOTO1', false);
pruebas_trabajadores.insertar('Prueba 46 - Insercción trabajador de letras en telefono','Claudia', 'Guerrero Cuenca', '45555588L', '6665YU444', 1000, 'DEPENDIENTE', '1478', 'FOTO1', false);
pruebas_trabajadores.insertar('Prueba 47 - Insercción trabajador de salario con más de 2 decimales','Claudia', 'Guerrero Cuenca', '45555588L', '666555444', 1000.2547, 'DEPENDIENTE', '1478', 'FOTO1', false);
pruebas_trabajadores.insertar('Prueba 48 - Insercción trabajador de salario con más de 9 dígitos','Claudia', 'Guerrero Cuenca', '45555588L', '666555444', 1000000000.00, 'DEPENDIENTE', '1478', 'FOTO1', false);
pruebas_trabajadores.insertar('Prueba 49 - Insercción trabajador con valor tipoEmpleado distinto a JEFE o DEPENDIENTE','Claudia', 'Guerrero Cuenca', '45555588L', '666555444', 1000, 'AMAR', '1478', 'FOTO1', false);
-- Pruebas de actualizar
pruebas_trabajadores.actualizar('Prueba 50 - Actualizar trabajador nombre por otro', id_T, 'Mariaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'Guerrero Cuenca', '45555588L', '666555444', 1000, 'DEPENDIENTE', '1478', 'FOTO1', false);
pruebas_trabajadores.actualizar('Prueba 51 - Actualizar trabajador apellidos por otro', id_T, 'Claudia', 'Mariaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', '45555588L', '666555444', 1000, 'DEPENDIENTE', '1478', 'FOTO1', false);
pruebas_trabajadores.actualizar('Prueba 52 - Actualizar trabajador dni por otro', id_T, 'Claudia', 'Guerrero Cuenca', '778844444444A', '666555444', 1000, 'DEPENDIENTE', '1478', 'FOTO1', false);
pruebas_trabajadores.actualizar('Prueba 53 - Actualizar trabajador telefono por otro', id_T, 'Claudia', 'Guerrero Cuenca', '45555588L', '67799955500000', 1000, 'DEPENDIENTE', '1478', 'FOTO1', false);
pruebas_trabajadores.actualizar('Prueba 54 - Actualizar trabajador salario por otro', id_T, 'Claudia', 'Guerrero Cuenca', '45555588L', '666555444', 15000000000, 'DEPENDIENTE', '1478', 'FOTO1', false);
pruebas_trabajadores.actualizar('Prueba 55 - Actualizar trabajador tipoEmpleado por otro', id_T, 'Claudia', 'Guerrero Cuenca', '45555588L', '666555444', 1000, 'JEFF', '1478', 'FOTO1', false);
pruebas_trabajadores.actualizar('Prueba 56 - Actualizar trabajador contraseña por otro', id_T, 'Claudia', 'Guerrero Cuenca', '45555588L', '666555444', 1000, 'DEPENDIENTE', 'Mariaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'FOTO1', false);
pruebas_trabajadores.actualizar('Prueba 57 - Actualizar trabajador direccionImagen por otro', id_T, 'Claudia', 'Guerrero Cuenca', '45555588L', '666555444', 1000, 'DEPENDIENTE', '1478', 'Mariaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', false);
pruebas_trabajadores.actualizar('Prueba 58 - Actualizar trabajador nombre por null', id_T, null, 'Guerrero Cuenca', '45555588L', '666555444', 1000, 'DEPENDIENTE', '1478', 'FOTO1', false);
pruebas_trabajadores.actualizar('Prueba 59 - Actualizar trabajador apellidos por null', id_T, 'Claudia', null, '45555588L', '666555444', 1000, 'DEPENDIENTE', '1478', 'FOTO1', false);
pruebas_trabajadores.actualizar('Prueba 60 - Actualizar trabajador dni por null', id_T, 'Claudia', 'Guerrero Cuenca', null, '666555444', 1000, 'DEPENDIENTE', '1478', 'FOTO1', false);
pruebas_trabajadores.actualizar('Prueba 61 - Actualizar trabajador telefono por null', id_T, 'Claudia', 'Guerrero Cuenca', '45555588L', null, 1000, 'DEPENDIENTE', '1478', 'FOTO1', false);
pruebas_trabajadores.actualizar('Prueba 62 - Actualizar trabajador salario por null', id_T, 'Claudia', 'Guerrero Cuenca', '45555588L', '666555444', null, 'DEPENDIENTE', '1478', 'FOTO1', false);
pruebas_trabajadores.actualizar('Prueba 63 - Actualizar trabajador tipoEmpleado por null', id_T, 'Claudia', 'Guerrero Cuenca', '45555588L', '666555444', 1000, null, '1478', 'FOTO1', false);
pruebas_trabajadores.actualizar('Prueba 64 - Actualizar trabajador contraseña por null', id_T, 'Claudia', 'Guerrero Cuenca', '45555588L', '666555444', 1000, 'DEPENDIENTE', null, 'FOTO1', false);
pruebas_trabajadores.actualizar('Prueba 65 - Actualizar trabajador direccionImagen por null', id_T, 'Claudia', 'Guerrero Cuenca', '45555588L', '666555444', 1000, 'DEPENDIENTE', '1478', null, false);
-- Prueba de eliminar (Al final del script)

/**************************************************************************
          PRUEBAS DE LAS OPERACIONES SOBRE LA TABLA PROVEEDOR
  **************************************************************************/
  DBMS_OUTPUT.PUT_LINE('---------------------------------------------Pruebas Paquetes Proveedor-----------------------------------------------------');
  
  PRUEBAS_PROVEEDORES.INICIALIZAR;
  PRUEBAS_PROVEEDORES.INSERTAR('Prueba 100 - Insercion proveedor correcta', 'Juan', 'Fernandez Gomez','12345678a', '111222333', 'jfg@correo.es', true);
  id_pro := sec_proveedor.currval;
  PRUEBAS_PROVEEDORES.INSERTAR('Prueba 101 - Insercion proveedor nombre nulo', null, 'Fernandez Sierra','12345678b', '111222334', 'jfg@correo.com', false);
  PRUEBAS_PROVEEDORES.INSERTAR('Prueba 102 - Insercion proveedor apellidos nulo', 'Pepe', null,'12345678c', '111222335', 'jfg@correo.net', false);
  PRUEBAS_PROVEEDORES.INSERTAR('Prueba 103 - Insercion proveedor dni nulo', 'Antonio', 'Fernandez Perez',null, '111222336', 'jfg@correo.org', false);
  PRUEBAS_PROVEEDORES.INSERTAR('Prueba 104 - Insercion proveedor telefono nulo', 'Paco', 'Fernandez Llanos','12345678d', null, 'jfg@correo.info', false);
  PRUEBAS_PROVEEDORES.INSERTAR('Prueba 105 - Insercion proveedor correo nulo', 'Alberto', 'Fernandez Maestre','12345678e', '111222337', null, false);
  PRUEBAS_PROVEEDORES.INSERTAR('Prueba 106 - Insercion proveedor nombre se excede', '.......................................................', 'Fernandez Gomez','12345678a', '111222333', 'jfg@correo.es', false);
  PRUEBAS_PROVEEDORES.INSERTAR('Prueba 107 - Insercion proveedor apellidos se excede', 'Juan', '.......................................................','12345678a', '111222333', 'jfg@correo.es', false);
  PRUEBAS_PROVEEDORES.INSERTAR('Prueba 108 - Insercion proveedor dni se excede', 'Juan', 'Fernandez Gomez','.......................................................', '111222333', 'jfg@correo.es', false);
  PRUEBAS_PROVEEDORES.INSERTAR('Prueba 109 - Insercion proveedor telefono se excede', 'Juan', 'Fernandez Gomez','12345678a', '.......................................................', 'jfg@correo.es', false);
  PRUEBAS_PROVEEDORES.INSERTAR('Prueba 110 - Insercion proveedor correo se excede', 'Juan', 'Fernandez Gomez','12345678a', '111222333', '.......................................................', false);
  PRUEBAS_PROVEEDORES.INSERTAR('Prueba 111 - Insercion proveedor dni mal compuesto', 'Juan', 'Fernandez Gomez','12345678', '111222333', '.......................................................', false);
  PRUEBAS_PROVEEDORES.INSERTAR('Prueba 112 - Insercion proveedor correo sin @', 'Juan', 'Fernandez Gomez','12345678a', '111222333', 'jfg_hotmail.com', false);
  PRUEBAS_PROVEEDORES.INSERTAR('Prueba 113 - Insercion proveedor correo sin .', 'Juan', 'Fernandez Gomez','12345678a', '111222333', 'jfg@hotmail_com', false);
  --Actualizar
  PRUEBAS_PROVEEDORES.ACTUALIZAR('Prueba 114 - Actualizacion correcta', id_pro, 'Federico', 'Fernandez Tartana','12345678a', '111222338', 'jfg@correo.tv', true);
  PRUEBAS_PROVEEDORES.ACTUALIZAR('Prueba 115 - Actualizacion nombre a null', id_pro, null, 'Fernandez Beltran','12345678a', '111222339', 'jfg@correo.fm', false);
  PRUEBAS_PROVEEDORES.ACTUALIZAR('Prueba 116 - Actualizacion apellidos a null', id_pro, 'Ludovico', null,'12345678a', '111222339', 'jfg@correo.fm', false);
  PRUEBAS_PROVEEDORES.ACTUALIZAR('Prueba 117 - Actualizacion dni a null', id_pro, 'Ludovico', 'Fernandez Beltran',null, '111222339', 'jfg@correo.fm', false);
  PRUEBAS_PROVEEDORES.ACTUALIZAR('Prueba 118 - Actualizacion telefono a null', id_pro, 'Ludovico', 'Fernandez Beltran','12345678a', null, 'jfg@correo.fm', false);
  PRUEBAS_PROVEEDORES.ACTUALIZAR('Prueba 119 - Actualizacion correo a null', id_pro, 'Ludovico', 'Fernandez Beltran','12345678a', '111222339', null, false);
  PRUEBAS_PROVEEDORES.ACTUALIZAR('Prueba 120 - Actualizacion nombre se excede', id_pro, '.......................................................', 'Fernandez Tartana','12345678a', '111222338', 'jfg@correo.tv', false);
  PRUEBAS_PROVEEDORES.ACTUALIZAR('Prueba 121 - Actualizacion apellidos se excede', id_pro, 'Federico', '.......................................................','12345678a', '111222338', 'jfg@correo.tv', false);
  PRUEBAS_PROVEEDORES.ACTUALIZAR('Prueba 122 - Actualizacion dni se excede', id_pro, 'Federico', 'Fernandez Tartana','.......................................................', '111222338', 'jfg@correo.tv', false);
  PRUEBAS_PROVEEDORES.ACTUALIZAR('Prueba 123 - Actualizacion telefono se excede', id_pro, 'Federico', 'Fernandez Tartana','12345678a', '.......................................................', 'jfg@correo.tv', false);
  PRUEBAS_PROVEEDORES.ACTUALIZAR('Prueba 124 - Actualizacion correo se excede', id_pro, 'Federico', 'Fernandez Tartana','12345678a', '111222338', '.......................................................', false);
  PRUEBAS_PROVEEDORES.ACTUALIZAR('Prueba 125 - Actualizacion correo sin @', id_pro, 'Federico', 'Fernandez Beltran','12345678a', '111222339', 'jfg_correo.fm', false);
  PRUEBAS_PROVEEDORES.ACTUALIZAR('Prueba 126 - Actualizacion correo sin .', id_pro, 'Federico', 'Fernandez Beltran','12345678a', '111222339', 'jfg@correo_fm', false);
  PRUEBAS_PROVEEDORES.ACTUALIZAR('Prueba 127 - Actualizacion dni mal compuesto', id_pro, 'Federico', 'Fernandez Beltran','123456789', '111222339', 'jfg@correo.fm', false);
  --Eliminar(Al final del script)

  /**************************************************************************
          PRUEBAS DE ELIMINAR TABLAS
  **************************************************************************/
  DBMS_OUTPUT.PUT_LINE('---------------------------------------------Pruebas Eliminación tablas-----------------------------------------------------');
  pruebas_trabajadores.eliminar('Prueba 66 - Eliminar trabajador', id_T, true);
  PRUEBAS_PROVEEDORES.ELIMINAR('Prueba 128 - Eliminar proveedor', id_pro, true);

END;
