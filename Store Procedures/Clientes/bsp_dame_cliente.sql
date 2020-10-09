DROP procedure IF EXISTS `bsp_dame_cliente`;
DELIMITER $$

CREATE PROCEDURE `bsp_dame_cliente` (pIdCliente int)
SALIR:BEGIN
	/*
    Procedimiento que devuelve un cliente de la BD dado un ID
    */
-- Controla que no exista un documento con el mismo numero
	IF NOT EXISTS(SELECT IdCliente FROM clientes WHERE IdCliente = pIdCliente) THEN
		SELECT 'Cliente inexistente' AS Mensaje;
		LEAVE SALIR;
    END IF;
    
    SELECT	*
    FROM	personas p
			JOIN clientes c on p.IdPersona = c.IdCliente
    WHERE	IdCliente = pIdCliente;
    
END$$
DELIMITER ;