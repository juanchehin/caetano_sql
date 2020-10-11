DROP procedure IF EXISTS `bsp_dame_proveedores`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `bsp_dame_proveedores`()
BEGIN
	/*
	Permite listar los proveedores dados de alta ordenadas por nombre.
    */
-- Control de el parametro 'pDesde' por si viene igualado a cero
    
	SELECT		*
    FROM		proveedores
    WHERE		EstadoProv = 'A'
    ORDER BY	Proveedor asc;

    
END ;;
DELIMITER ;