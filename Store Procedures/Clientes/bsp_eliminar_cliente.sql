DROP procedure IF EXISTS `bsp_eliminar_cliente`;
DELIMITER $$

CREATE PROCEDURE `bsp_eliminar_cliente`(pIdCliente int)
SALIR:BEGIN
	/*
    Permite cambiar el estado de un cliente a B: Baja siempre y cuando no esté dado de 
    baja ya. Devuelve 1 o el mensaje de error en Mensaje.
	*/
    -- Controla que el cliente no este dado de baja ya
    IF EXISTS(SELECT IdPersona FROM personas WHERE IdPersona = pIdCliente
						AND EstadoPer = 'B') THEN
		SELECT 'El cliente ya está dado de baja.' AS Mensaje;
        LEAVE SALIR;
	END IF;
    
-- Da de baja
    UPDATE personas SET EstadoPer = 'B' WHERE IdPersona = pIdCliente;

    SELECT 1;
END$$
DELIMITER ;