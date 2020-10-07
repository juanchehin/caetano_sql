DROP procedure IF EXISTS `bsp_nuevo_corte`;
DELIMITER $$
CREATE PROCEDURE `bsp_nuevo_corte`(pCorte VARCHAR(60),pPrecio Decimal(12,5),pDescripcion VARCHAR(255))
SALIR:BEGIN
	/*
    Permite dar de alta un corte controlando que el pCorte no exista ya. 
    La da de alta al final del orden, con estado A: Activa. 
    Devuelve OK o el mensaje de error en Mensaje.
    */
	DECLARE pIdCorte smallint;
	-- Manejo de error en la transacción
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		SHOW ERRORS;
		-- SELECT 'Error en la transacción. Contáctese con el administrador.' Mensaje;
		ROLLBACK;
	END;
    
    -- Controla que el pCorte sea obligatorio
	IF pCorte IS NULL OR pCorte = '' THEN
		SELECT 'El Corte es obligatorio.' AS Mensaje;
        LEAVE SALIR;
    END IF;
    
	IF (SELECT Corte FROM Cortes WHERE Corte = pCorte) THEN
		SELECT 'El Corte ya existe' AS Mensaje;
        LEAVE SALIR;
    END IF;

    
	START TRANSACTION;
		SET pIdCorte = 1 + (SELECT COALESCE(MAX(IdCorte),0) FROM Cortes);

		INSERT INTO Cortes VALUES(pIdCorte,pCorte,pPrecio,pDescripcion,'A');
        SELECT 'OK' AS Mensaje;
    COMMIT;
END$$
DELIMITER ;