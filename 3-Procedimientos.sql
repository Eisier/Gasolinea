--PROCEDIMIENTOS--

--Trabajadores
CREATE OR REPLACE PROCEDURE inicializar_trabajadores
IS BEGIN
  DELETE FROM trabajadores;
END;
/
CREATE OR REPLACE PROCEDURE insertar_trabajadores(

  w_nombre            IN trabajadores.nombre%TYPE,
  w_apellidos         IN trabajadores.apellidos%TYPE,
  w_dni               IN trabajadores.dni%TYPE,
  w_telefono          IN trabajadores.telefono%TYPE,
  w_salario           IN trabajadores.salario%TYPE,
  w_tipoEmpleado      IN trabajadores.tipoEmpleado%TYPE,
  w_contraseña        IN trabajadores.contraseña%TYPE,
  w_direccionImagen   IN trabajadores.direccionImagen%TYPE) IS
  
BEGIN
  INSERT INTO trabajadores (id_t, nombre, apellidos, dni, telefono, salario, tipoEmpleado, contraseña, direccionImagen)
  VALUES (sec_trabajador.NEXTVAL, w_nombre, w_apellidos, w_dni, w_telefono, w_salario, w_tipoEmpleado, w_contraseña, w_direccionImagen);
  COMMIT WORK;
END insertar_trabajadores;
/
CREATE OR REPLACE PROCEDURE  actualizar_trabajadores(

  w_id_t              IN trabajadores.id_t%TYPE,
  w_nombre            IN trabajadores.nombre%TYPE,
  w_apellidos         IN trabajadores.apellidos%TYPE,
  w_dni               IN trabajadores.dni%TYPE,
  w_telefono          IN trabajadores.telefono%TYPE,
  w_salario           IN trabajadores.salario%TYPE,
  w_tipoEmpleado      IN trabajadores.tipoEmpleado%TYPE,
  w_contraseña        IN trabajadores.contraseña%TYPE,
  w_direccionImagen   IN trabajadores.direccionImagen%TYPE) IS
  
BEGIN
  UPDATE trabajadores SET nombre=w_nombre                       WHERE id_t=w_id_t;
  UPDATE trabajadores SET apellidos=w_apellidos                 WHERE id_t=w_id_t;
  UPDATE trabajadores SET dni=w_dni                             WHERE id_t=w_id_t;
  UPDATE trabajadores SET telefono=w_telefono                   WHERE id_t=w_id_t;
  UPDATE trabajadores SET salario=w_salario                     WHERE id_t=w_id_t;
  UPDATE trabajadores SET tipoEmpleado=w_tipoEmpleado           WHERE id_t=w_id_t;
  UPDATE trabajadores SET contraseña=w_contraseña               WHERE id_t=w_id_t;
  UPDATE trabajadores SET direccionImagen=w_direccionImagen     WHERE id_t=w_id_t;
  
END actualizar_trabajadores;
/
CREATE OR REPLACE PROCEDURE eliminar_trabajadores(
  w_id_t           IN trabajadores.id_t%TYPE) IS
  
BEGIN
  DELETE FROM trabajadores WHERE (id_t=w_id_t);
  
END eliminar_trabajadores;
/
CREATE OR REPLACE PROCEDURE consultar_trabajadores is
CURSOR C IS
		SELECT * FROM trabajadores;
	w_trabajadores trabajadores%ROWTYPE;
BEGIN
OPEN C;
		FETCH C INTO w_trabajadores;
		DBMS_OUTPUT.PUT_LINE(RPAD('Nombre:', 25) || RPAD('Apellidos:', 25) || RPAD('DNI:', 25) || RPAD('Telefono:', 25) || RPAD('Salario:', 25) || RPAD('Tipo Empleado:', 25) || RPAD('Contraseña:', 25) || RPAD('Direccion imagen:', 25));
		DBMS_OUTPUT.PUT_LINE(LPAD('-', 200, '-'));
		WHILE C%FOUND LOOP 
			DBMS_OUTPUT.PUT_LINE(RPAD(w_trabajadores.nombre, 25) || RPAD(w_trabajadores.apellidos, 25) || RPAD(w_trabajadores.dni, 25) || RPAD(w_trabajadores.telefono, 25) || RPAD(w_trabajadores.salario, 25) || RPAD(w_trabajadores.tipoempleado, 25) || RPAD(w_trabajadores.contraseña, 25) || RPAD(w_trabajadores.direccionImagen, 25));
		FETCH C INTO w_trabajadores;
		END LOOP;
		CLOSE C;
	END consultar_trabajadores;

/

--ItemCompras
CREATE OR replace PROCEDURE eliminar_itemcompras(w_Id_I IN ITEMCOMPRAS.ID_I%TYPE) IS
BEGIN
DELETE FROM ITEMCOMPRAS WHERE ID_I = w_Id_I;
END;
/
CREATE OR replace PROCEDURE inicializar_itemcompras IS
BEGIN
DELETE FROM ITEMCOMPRAS;
END;
/
CREATE OR replace PROCEDURE actualizar_itemcompras(w_Id_I IN ITEMCOMPRAS.ID_I%TYPE,w_stock IN ITEMCOMPRAS.STOCK%TYPE,w_precio IN ITEMCOMPRAS.PRECIO%TYPE) IS
BEGIN
UPDATE ITEMCOMPRAS SET STOCK = w_stock ,PRECIO = w_precio WHERE ID_I=w_Id_I;
END;
/
CREATE OR REPLACE PROCEDURE insertar_itemcompras(w_stock IN ITEMCOMPRAS.STOCK%TYPE, w_precio IN ITEMCOMPRAS.PRECIO%TYPE) IS
BEGIN
INSERT INTO ITEMCOMPRAS(Id_I,STOCK,PRECIO) VALUES (sec_itemCompra.nextval,w_stock,w_precio);
END;
/

--Proveedores
CREATE OR REPLACE PROCEDURE insertar_proveedores
(w_nombre in proveedores.nombre%TYPE,
w_apellidos in proveedores.apellidos%TYPE,
w_dni in proveedores.dni%TYPE,
w_telefono in proveedores.telefono%TYPE,
w_correo in proveedores.correo%TYPE) IS
BEGIN
  INSERT INTO Proveedores (id_pro, nombre, apellidos, dni, telefono, correo)
  VALUES (sec_proveedor.NEXTVAL, w_nombre, w_apellidos, w_dni, w_telefono, w_correo);
END;
/
CREATE OR REPLACE PROCEDURE eliminar_proveedores
(w_id_pro in proveedores.id_pro%TYPE) is
BEGIN 
  DELETE FROM Proveedores WHERE w_id_pro = id_pro;
END;
/
CREATE OR REPLACE PROCEDURE modificar_proveedores
(w_id_pro in proveedores.id_pro%TYPE,
w_nombre in proveedores.nombre%TYPE, 
w_apellidos in proveedores.apellidos%TYPE,
w_dni in proveedores.dni%TYPE,
w_telefono in proveedores.telefono%TYPE,
w_correo in proveedores.correo%TYPE)IS
BEGIN
  UPDATE Proveedores SET nombre = w_nombre, apellidos = w_apellidos, dni = w_dni,
  telefono = w_telefono, correo = w_correo
  WHERE w_id_pro = id_pro;
END;
/
CREATE OR REPLACE PROCEDURE inicializar_proveedores
IS
BEGIN 
  DELETE FROM Proveedores;
END;

/

--Productos
CREATE OR replace PROCEDURE eliminar_productos (idp IN PRODUCTOS.ID_P%TYPE) IS
BEGIN
DELETE FROM PRODUCTOS WHERE ID_P = idp;
END;
/
CREATE OR replace PROCEDURE inicializar_productos IS
BEGIN
DELETE FROM PRODUCTOS;
END;
/
CREATE OR replace PROCEDURE actualizar_productos(idp IN PRODUCTOS.ID_P%TYPE,nom IN PRODUCTOS.NOMBRE%TYPE,cod IN PRODUCTOS.CODIGO%TYPE,
direc IN PRODUCTOS.DIRECCIONIMAGEN%TYPE,idi IN PRODUCTOS.ID_I%TYPE,ida IN PRODUCTOS.ID_A%TYPE,idpro IN PRODUCTOS.ID_PRO%TYPE) IS
BEGIN
UPDATE PRODUCTOS SET NOMBRE = nom,CODIGO = cod,DIRECCIONIMAGEN = direc,ID_I = idi,ID_A = ida,ID_PRO = idpro WHERE ID_P=idp;
END;
/
CREATE OR replace PROCEDURE insertar_productos
(w_nombre IN PRODUCTOS.NOMBRE%TYPE,
w_codigo IN PRODUCTOS.CODIGO%TYPE,
w_DIRECCIONIMAGEN IN PRODUCTOS.DIRECCIONIMAGEN%TYPE,
w_ID_I IN PRODUCTOS.ID_I%TYPE,
w_ID_A IN PRODUCTOS.ID_A%TYPE,
w_ID_PRO IN PRODUCTOS.ID_PRO%TYPE) IS
BEGIN
INSERT INTO PRODUCTOS(ID_P,NOMBRE,CODIGO,DIRECCIONIMAGEN,ID_I,ID_A,ID_PRO) VALUES (sec_producto.nextval,w_nombre,w_codigo,w_direccionImagen,w_ID_I,w_ID_A,w_ID_PRO);
END;
/

--LineaCompras
CREATE OR REPLACE PROCEDURE insertar_lineaCompras
(w_cantidad IN lineaCompras.cantidad%TYPE,
w_Id_I IN lineaCompras.Id_I%TYPE) IS
BEGIN
  INSERT INTO lineaCompras(Id_L,Cantidad,Id_I)
  VALUES(sec_lineaCompra.nextval,w_cantidad, w_Id_I);
END;
/
CREATE OR REPLACE PROCEDURE eliminar_lineaCompras
(w_Id_L in lineaCompras.Id_L%TYPE) IS
BEGIN
  DELETE FROM lineaCompras WHERE Id_L = w_Id_L;
END;
/
CREATE OR REPLACE PROCEDURE actualizar_lineaCompras
(w_Id_L IN lineaCompras.Id_L%TYPE,
w_cantidad IN lineaCompras.cantidad%TYPE,
w_Id_I IN lineaCompras.Id_I%TYPE) IS
BEGIN
  UPDATE lineaCompras SET Cantidad = w_cantidad, Id_I =w_Id_I
  WHERE  Id_L = w_Id_L;
END;
/
CREATE OR REPLACE PROCEDURE inicializar_lineaCompras
IS BEGIN
  DELETE FROM lineaCompras;
END inicializar_lineaCompras;
/

--Compras
CREATE OR REPLACE PROCEDURE insertar_compras
(w_fechaPedido IN COMPRAS.FECHAPEDIDO%TYPE,
w_fechaRecogida IN compras.fechaRecogida%TYPE,
w_pagado IN compras.pagado%TYPE,
w_Id_C IN compras.Id_C%TYPE,
w_Id_T IN compras.Id_T%TYPE,
w_Id_L IN compras.Id_L%TYPE) IS
BEGIN
  INSERT INTO Compras (Id_COM,fechaPedido,fechaRecogida,pagado,Id_C,Id_T,Id_L)
  VALUES (sec_compra.nextval,w_fechaPedido,w_fechaRecogida,w_pagado,w_Id_C,w_Id_T,w_Id_L);
END;
/
CREATE OR REPLACE PROCEDURE eliminar_compras
(w_Id_COM IN compras.Id_COM%TYPE) IS
BEGIN 
  DELETE FROM Compras WHERE Id_COM = w_Id_COM;
END;
/
CREATE OR REPLACE PROCEDURE actualizar_compras
(w_Id_COM IN Compras.Id_COM%TYPE,
w_fechaPedido IN COMPRAS.FECHAPEDIDO%TYPE,
w_fechaRecogida IN compras.fechaRecogida%TYPE,
w_pagado IN compras.pagado%TYPE,
w_Id_C IN compras.Id_C%TYPE,
w_Id_T IN compras.Id_T%TYPE,
w_Id_L IN compras.Id_L%TYPE) IS
BEGIN
  UPDATE Compras SET fechaPedido = w_fechaPedido, fechaRecogida = w_fechaRecogida, pagado = w_pagado ,Id_C = w_Id_C, Id_T = w_Id_T, Id_L = w_Id_L
 WHERE Id_COM = w_Id_COM;
END;
/
CREATE OR REPLACE PROCEDURE inicializar_compras
IS BEGIN
  DELETE FROM Compras;
END inicializar_compras;
/
