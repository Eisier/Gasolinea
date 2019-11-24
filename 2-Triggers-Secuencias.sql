DROP SEQUENCE sec_lineaCompra;
DROP SEQUENCE sec_compra;
DROP SEQUENCE sec_trabajador;

CREATE SEQUENCE sec_trabajador;

CREATE OR REPLACE TRIGGER crea_id_trabajador
BEFORE INSERT ON trabajadores
REFERENCING NEW AS NEW 
FOR EACH ROW 
DECLARE valorSecuencia NUMBER := 0;
BEGIN
  SELECT sec_trabajador.currval INTO valorSecuencia FROM DUAL;
  :NEW.Id_T := valorSecuencia;
END;

CREATE SEQUENCE sec_lineaCompra;

CREATE OR REPLACE TRIGGER crea_id_lineaCompra
BEFORE INSERT ON lineaCompras
REFERENCING NEW AS NEW 
FOR EACH ROW
DECLARE valorSecuencia NUMBER := 0;
BEGIN
  SELECT sec_lineaCompra.CURRVAL INTO valorSecuencia FROM DUAL;
  :NEW.Id_L := valorSecuencia;
END;  
/

CREATE SEQUENCE sec_compra;

CREATE OR REPLACE TRIGGER crea_id_compra
BEFORE INSERT ON compras
REFERENCING NEW AS NEW 
FOR EACH ROW 
DECLARE valorSecuencia NUMBER := 0;
BEGIN
  SELECT sec_compra.CURRVAL INTO valorSecuencia FROM DUAL;
  :NEW.Id_COM := valorSecuencia;
END;  
