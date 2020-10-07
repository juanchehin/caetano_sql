DROP procedure IF EXISTS `bsp_dame_alumnos`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `bsp_dame_alumnos`()
BEGIN
	/*
	Permite listar los alumnos dados de alta ordenadas por apellido.
    */
-- Control de el parametro 'pDesde' por si viene igualado a cero
    
	SELECT		a.IdAlumno,p.Apellidos,p.Nombres,p.DNI,DATE_FORMAT(p.FechaNac,'%d/%m/%Y') as FechaNac,DATE_FORMAT(p.FechaAlta,'%d/%m/%Y') as FechaAlta,p.Email,
				p.Telefono,p.Direccion,p.Ciudad,p.Provincia,p.Sexo,p.EstadoPer,p.Comentarios
    FROM		personas p
				LEFT JOIN alumnos a on p.IdPersona = a.IdAlumno
    WHERE		EstadoPer = 'A' AND p.IdPersona = a.IdAlumno
    ORDER BY	apellidos asc;

    
END ;;
DELIMITER ;