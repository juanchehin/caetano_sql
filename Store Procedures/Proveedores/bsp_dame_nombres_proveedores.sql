DROP procedure IF EXISTS `bsp_dame_nombres_proveedores`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `bsp_dame_nombres_proveedores`()
BEGIN
	/*
	Permite listar los nombres proveedores dados de alta ordenadas por nombre.
    */
-- Control de el parametro 'pDesde' por si viene igualado a cero
    
	SELECT		Proveedor
    FROM		proveedores
    WHERE		EstadoProv = 'A'
    ORDER BY	Proveedor asc;

    
END ;;
DELIMITER ;