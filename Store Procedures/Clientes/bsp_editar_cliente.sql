DROP procedure IF EXISTS `bsp_editar_cliente`;
DELIMITER $$
CREATE PROCEDURE `bsp_editar_cliente`(
pIdCliente int,
pApellidos varchar(60),
pNombres varchar(60),
pDNI int(11),
pFechaNac date,
pEmail varchar(50),
pTelefono varchar(30),
pDireccion varchar(45),
pCiudad varchar(45),
pProvincia varchar(45),
pSexo CHAR(1),
pComentarios varchar(255)
)
SALIR:BEGIN
	/*
    Permite modificar un cliente existente. 
    Devuelve 1 o el mensaje de error en Mensaje.
    */
	-- Manejo de error en la transacción
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		SHOW ERRORS;
		-- SELECT 'Error en la transacción. Contáctese con el administrador.' Mensaje;
		ROLLBACK;
	END;
    
-- Controla que no exista un documento con el mismo numero
	IF NOT EXISTS(SELECT IdCliente FROM clientes WHERE IdCliente = pIdCliente) THEN
		SELECT 'Cliente inexistente' AS Mensaje;
		LEAVE SALIR;
    END IF;    

START TRANSACTION;
	UPDATE Personas SET Apellidos = pApellidos WHERE IdPersona = pIdCliente;
    UPDATE Personas SET Nombres = pNombres WHERE IdPersona = pIdCliente;
    UPDATE Personas SET DNI = pDNI WHERE IdPersona = pIdCliente;
    UPDATE Personas SET FechaNac = pFechaNac WHERE IdPersona = pIdCliente;
    UPDATE Personas SET Email = pEmail WHERE IdPersona = pIdCliente;
    UPDATE Personas SET Telefono = pTelefono WHERE IdPersona = pIdCliente;
    UPDATE Personas SET Direccion = pDireccion WHERE IdPersona = pIdCliente;
    UPDATE Personas SET Ciudad = pCiudad WHERE IdPersona = pIdCliente;
    UPDATE Personas SET Provincia = pProvincia WHERE IdPersona = pIdCliente;
    UPDATE Personas SET Sexo = pSexo WHERE IdPersona = pIdCliente;
    UPDATE Personas SET EstadoPer = pEstadoPer WHERE IdPersona = pIdCliente;
    UPDATE Personas SET Comentarios = pComentarios WHERE IdPersona = pIdCliente;

	SELECT 'Ok';
COMMIT;

END$$
DELIMITER ;