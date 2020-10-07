DROP procedure IF EXISTS `bsp_dame_cortes`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `bsp_dame_cortes`()
BEGIN
	/*
	Permite listar los cortes ordenadas por nombre.
    */
-- Control de el parametro 'pDesde' por si viene igualado a cero
    
	SELECT		*
    FROM		cortes
    WHERE		EstadoCor = 'A'
    ORDER BY	corte asc;


	/*SELECT COUNT(IdPersona) AS cantProf
	FROM Personas 
    WHERE IdRol = '2' AND EstadoPer = 'A';*/
    
END ;;
DELIMITER ;