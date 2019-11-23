--PROCEDIMIENTOS--
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