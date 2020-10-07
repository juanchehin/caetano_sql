DROP procedure IF EXISTS `bsp_dame_usuarios`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `bsp_dame_usuarios`()
BEGIN
	/*
	Permite listar los usuarios dados de alta ordenadas por apellido.
    */
-- Control de el parametro 'pDesde' por si viene igualado a cero
    
	SELECT		u.IdUsuario,p.Apellidos,p.Nombres,p.DNI,DATE_FORMAT(p.FechaNac,'%d/%m/%Y') as FechaNac,DATE_FORMAT(p.FechaAlta,'%d/%m/%Y') as FechaAlta,p.Email,
				p.Telefono,p.Direccion,p.Ciudad,p.Provincia,p.Sexo,p.EstadoPer,p.Comentarios
    FROM		personas p
				JOIN usuarios u on p.IdPersona = u.IdUsuario
    WHERE		EstadoPer = 'A'
    ORDER BY	apellidos asc;

    
END ;;
DELIMITER ;