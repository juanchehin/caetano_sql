DROP procedure IF EXISTS `bsp_alta_persona`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `bsp_alta_persona`(
pApellido varchar(60),
pNombre varchar(60),
pDNI int(11),
pFechaNac date,
pEmail varchar(50),
pTelefono varchar(30),
pDireccion varchar(45),
pCiudad varchar(45),
pProvincia varchar(45),
pComentarios varchar(250)
)
SALIR:BEGIN
	/*
    Permite dar de alta una persona controlando que el email no exista ya. 
    La da de alta al final del orden, con estado A: Activa. 
    Devuelve OK + Id o el mensaje de error en Mensaje.
    */
	DECLARE pIdPersona,pIdDireccion,pIdProfesional smallint;
	-- Manejo de error en la transacción
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		SHOW ERRORS;
		-- SELECT 'Error en la transacción. Contáctese con el administrador.' Mensaje;
		-- NULL AS Id;
		ROLLBACK;
	END;
    -- Controla que el correo sea obligatorio 
	IF pCorreo = '' OR pCorreo IS NULL THEN
		SELECT 'Debe proveer un nombre para el correo' AS Mensaje, NULL AS Id;
		LEAVE SALIR;
    END IF;
    
    -- Controla que no exista un entrenador/persona con el mismo correo, '1' para rol de cliente
	IF (pCorreo = (SELECT correo FROM personas WHERE correo = pCorreo )) THEN
		SELECT 'Ya existe un correo con ese nombre' AS Mensaje;
		LEAVE SALIR;
    END IF;
    
    -- Controla que el Documento sea obligatorio
	IF pDocumento = '' OR pDocumento IS NULL THEN
		SELECT 'Debe proveer un documento' AS Mensaje, NULL AS Id;
		LEAVE SALIR;
    END IF;
    
-- Controla que no exista un documento con el mismo numero
	IF EXISTS(SELECT Documento FROM Personas WHERE Documento = pDocumento) THEN
		SELECT 'Ya existe un Documento con ese numero' AS Mensaje;
		LEAVE SALIR;
    END IF;
    
	START TRANSACTION;
		SET pIdDireccion = 1 + (SELECT COALESCE(MAX(IdDireccion),0) FROM Direcciones);
		INSERT INTO Direcciones(IdDireccion,Calle,Piso,Departamento,Ciudad,Pais,Numero) VALUES(pIdDireccion,pCalle,pPiso,pDepartamento,pCiudad,pPais,pNumero);

		SET pIdPersona = 1 + (SELECT COALESCE(MAX(IdPersona),0) FROM Personas);
		INSERT INTO Personas(IdPersona,IdRol,IdDireccion,IdTipoDocumento,Apellido,Nombre,Documento,Password,Telefono,Sexo,Observaciones,Foto,Estado,FechaNac,Correo,Usuario) VALUES(pIdPersona,2,pIdDireccion,pIdTipoDocumento,pApellido,pNombre,pDocumento,MD5(pPassword),pTelefono,pSexo,pObservaciones,pFoto,'A',pFechaNac,pCorreo,pUsuario);
        
        SET pIdProfesional = 1 + (SELECT COALESCE(MAX(IdProfesional),0) FROM Profesionales);
		INSERT INTO Profesionales(IdPersona,IdRol,IdProfesional) VALUES(pIdPersona,2,pIdProfesional);
	SELECT 'Ok' AS Mensaje;
    COMMIT;

END ;;
DELIMITER ;