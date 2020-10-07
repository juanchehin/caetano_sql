DROP procedure IF EXISTS `bsp_dame_corte`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `bsp_dame_corte`(pIdCorte smallint)
SALIR:BEGIN
	/*
	Procedimiento que sirve para instanciar un corte desde la base de datos.
    */
    IF NOT EXISTS(SELECT IdCorte FROM cortes WHERE IdCorte = pIdCorte) THEN
		SELECT 'El corte no existe!' AS Mensaje;
		LEAVE SALIR;
    END IF;
    
	SELECT	*
	FROM	cortes
	WHERE	IdCorte = pIdCorte;

	
END ;;
DELIMITER ;