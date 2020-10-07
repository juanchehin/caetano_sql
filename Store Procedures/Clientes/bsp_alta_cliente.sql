DROP procedure IF EXISTS `bsp_alta_cliente`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `bsp_alta_cliente`(
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
    Permite dar de alta un cliente controlando que el mismo no exista ya. 
    La da de alta al final del orden, con estado A: Activa. 
    Devuelve OK + Id o el mensaje de error en Mensaje.
    */
	DECLARE pIdPersona int;
	-- Manejo de error en la transacción
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		SHOW ERRORS;
		-- SELECT 'Error en la transacción. Contáctese con el administrador.' Mensaje;
		-- NULL AS Id;
		ROLLBACK;
	END;
    -- Controla que el correo sea obligatorio 
	IF pEmail = '' OR pEmail IS NULL THEN
		SELECT 'Debe proveer un nombre para el correo' AS Mensaje, NULL AS Id;
		LEAVE SALIR;
    END IF;
       
    -- Controla que el Documento sea obligatorio
	IF pDNI = '' OR pDNI IS NULL THEN
		SELECT 'Debe proveer un documento' AS Mensaje, NULL AS Id;
		LEAVE SALIR;
    END IF;
    
-- Controla que no exista un documento con el mismo numero
	IF EXISTS(SELECT DNI FROM personas WHERE DNI = pDNI) THEN
		SELECT 'Ya existe un Documento con ese numero' AS Mensaje;
		LEAVE SALIR;
    END IF;
    
	START TRANSACTION;
		SET pIdPersona = 1 + (SELECT COALESCE(MAX(IdPersona),0) FROM personas);
		INSERT INTO Personas(IdPersona,Apellidos,Nombres,DNI,FechaNac,FechaAlta,Email,Telefono,Direccion,Ciudad,Provincia,Sexo,EstadoPer,Comentarios) 
        VALUES(pIdPersona,pApellidos,pNombres,pDNI,pFechaNac,curdate(),pEmail,pTelefono,pDireccion,pCiudad,pProvincia,pSexo,'A',pComentarios);

		INSERT INTO clientes(IdCliente) VALUES(pIdPersona);
	SELECT 'Ok' AS Mensaje;
    COMMIT;

END ;;
DELIMITER ;