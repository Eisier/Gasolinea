--PROCEDIMIENTOS--

--Clientes
CREATE OR REPLACE PROCEDURE inicializar_clientes
IS BEGIN
  DELETE FROM clientes;
END;
/
CREATE OR REPLACE PROCEDURE insertar_clientes
(w_nombre IN clientes.nombre%TYPE,
w_apellidos IN clientes.apellidos%TYPE,
w_dni IN clientes.dni%TYPE,
w_telefono IN clientes.telefono%TYPE,
w_correo IN clientes.correo%TYPE,
w_fechaNacimiento IN clientes.fechaNacimiento%TYPE,
w_contraseña IN clientes.contraseña%TYPE,
w_direccionImagen IN clientes.direccionImagen%TYPE) IS
BEGIN
  INSERT INTO clientes (Id_C,nombre,apellidos,dni,telefono,correo,fechaNacimiento,contraseña,direccionImagen)
  VALUES (sec_cliente.nextval,w_nombre,w_apellidos,w_dni,w_telefono,w_correo,w_fechaNacimiento,w_contraseña,w_direccionImagen);
  COMMIT WORK;
END;
/
CREATE OR REPLACE PROCEDURE actualizar_clientes
(w_Id_C IN clientes.Id_C%TYPE,
w_nombre IN clientes.nombre%TYPE,
w_apellidos IN clientes.apellidos%TYPE,
w_dni IN clientes.dni%TYPE,
w_telefono IN clientes.telefono%TYPE,
w_correo IN clientes.correo%TYPE,
w_fechaNacimiento IN clientes.fechaNacimiento%TYPE,
w_contraseña IN clientes.contraseña%TYPE,
w_direccionImagen IN clientes.direccionImagen%TYPE) IS
BEGIN
  UPDATE clientes SET nombre = w_nombre, apellidos = w_apellidos, dni = w_dni, telefono = w_telefono, correo = w_correo, fechaNacimiento = w_fechaNacimiento, contraseña = w_contraseña, direccionImagen = w_direccionImagen
  WHERE Id_C = w_Id_C;
END;
/
CREATE OR REPLACE PROCEDURE eliminar_clientes
(w_Id_C IN clientes.Id_C%TYPE) IS
BEGIN
DELETE FROM CLIENTES WHERE Id_C = w_Id_C;
END;
/
CREATE OR REPLACE PROCEDURE consultar_clientes is
CURSOR C IS
		SELECT * FROM clientes;
	w_clientes clientes%ROWTYPE;
BEGIN
OPEN C;
		FETCH C INTO w_clientes;
		DBMS_OUTPUT.PUT_LINE(RPAD('Nombre:', 25) || RPAD('Apellidos:', 25) || RPAD('DNI:', 25) || RPAD('Telefono:', 25) || RPAD('Correo:', 25) || RPAD('Fecha Nacimiento:', 25) || RPAD('Contraseña:', 25) || RPAD('Direccion imagen:', 25));
		DBMS_OUTPUT.PUT_LINE(LPAD('-', 200, '-'));
		WHILE C%FOUND LOOP
			DBMS_OUTPUT.PUT_LINE(RPAD(w_clientes.nombre, 25) || RPAD(w_clientes.apellidos, 25) || RPAD(w_clientes.dni, 25) || RPAD(w_clientes.telefono, 25) || RPAD(w_clientes.correo, 25) || RPAD(w_clientes.fechanacimiento, 25) || RPAD(w_clientes.contraseña, 25) || RPAD(w_clientes.direccionImagen, 25));
		FETCH C INTO w_clientes;
		END LOOP;
		CLOSE C;
	END consultar_clientes;
/

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


--Embarcaderos
CREATE OR REPLACE PROCEDURE inicializar_embarcaderos
IS BEGIN
  DELETE FROM embarcaderos;
END;
/
CREATE OR REPLACE PROCEDURE insertar_embarcaderos(

  w_disponible            IN embarcaderos.disponible%TYPE) IS

BEGIN
  INSERT INTO embarcaderos (id_e, disponible)
  VALUES (sec_embarcadero.NEXTVAL, w_disponible);
  COMMIT WORK;
END insertar_embarcaderos;
/
CREATE OR REPLACE PROCEDURE actualizar_embarcaderos(

  w_id_e              IN embarcaderos.id_e%TYPE,
  w_disponible        IN embarcaderos.disponible%TYPE) IS

BEGIN
  UPDATE embarcaderos SET disponible=w_disponible WHERE id_e=w_id_e;

END actualizar_embarcaderos;
/
CREATE OR REPLACE PROCEDURE eliminar_embarcaderos(
  w_id_e           IN embarcaderos.id_e%TYPE) IS

BEGIN
  DELETE FROM embarcaderos WHERE (id_e=w_id_e);
END eliminar_embarcaderos;
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
