DROP procedure IF EXISTS `bsp_dame_cursos`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `bsp_dame_cursos`()
BEGIN
	/*
	Permite listar los cursos dados de alta ordenadas por nombre del curso.
    */
-- Control de el parametro 'pDesde' por si viene igualado a cero
    
	SELECT		*
    FROM		cursos
    WHERE		EstadoCurso = 'A'
    ORDER BY	curso asc;

    
END ;;
DELIMITER ;