DROP procedure IF EXISTS `bsp_editar_corte`;
DELIMITER $$
CREATE PROCEDURE `bsp_editar_corte`(
pIdCorte int(11),
pCorte varchar(60),
pPrecio decimal(12,5),
pDescripcion varchar(255),
pEstadoCor CHAR(1)
)
SALIR:BEGIN
	/*
    Permite actualizar un corte, dado su IdCorte, con todos sus datos.
    Devuelve OK o el mensaje de error en Mensaje.
    */
	-- Manejo de error en la transacción
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		SHOW ERRORS;
		-- SELECT 'Error en la transacción. Contáctese con el administrador.' Mensaje;
		ROLLBACK;
	END;
    
    -- Controla que el documento sea obligatoria 
	IF pCorte = '' OR pCorte IS NULL THEN
		SELECT 'Debe proveer un nombre de corte' AS Mensaje;
		LEAVE SALIR;
    END IF;

-- Actualizo
   	UPDATE Cortes SET IdCorte = pIdCorte WHERE IdCorte = pIdCorte;
	UPDATE Personas SET Corte = pCorte WHERE IdCorte = pIdCorte;
	UPDATE Personas SET Precio = pPrecio WHERE IdCorte = pIdCorte;
	UPDATE Personas SET Descripcion = pDescripcion WHERE IdCorte = pIdCorte;
	UPDATE Personas SET EstadoCor = pEstadoCor WHERE IdCorte = pIdCorte;
    
	SELECT 'Ok' AS Mensaje;
END$$
DELIMITER ;