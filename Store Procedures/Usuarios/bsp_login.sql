DROP procedure IF EXISTS `bsp_login`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `bsp_login`(pUsuario varchar(50),pPassword char(32))
SALIR:BEGIN
	/*
	Procedimiento que sirve para instanciar una persona desde la base de datos por usuario.
    */
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		SHOW ERRORS;
		-- SELECT 'Error en la transacción. Contáctese con el administrador.' Mensaje;
		-- NULL AS Id;
		ROLLBACK;
	END;
    
-- Verifica la existencia del correo, la contraseña y el estado (El usuario no porque puede ser NULL)
	IF NOT EXISTS (SELECT usuario FROM usuarios WHERE (Usuario = pUsuario)) OR (SELECT password FROM usuarios WHERE (Usuario = pUsuario)) != MD5(pPassword) THEN
		SELECT 'Error de credenciales' AS Mensaje;
		LEAVE SALIR;
    END IF;

    
	SELECT	'Ok' AS Mensaje
    FROM	usuarios
    WHERE	Usuario = pUsuario;
    
END ;;
DELIMITER ;