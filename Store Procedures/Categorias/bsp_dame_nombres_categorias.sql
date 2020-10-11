DROP procedure IF EXISTS `bsp_dame_nombres_categorias`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `bsp_dame_nombres_categorias`()
BEGIN
	/*
	Permite listar los nombres categorias dados de alta ordenadas por nombre.
    */
-- Control de el parametro 'pDesde' por si viene igualado a cero
    
	SELECT		categoria
    FROM		categorias
    WHERE		EstadoCat = 'A'
    ORDER BY	Categoria asc;

    
END ;;
DELIMITER ;