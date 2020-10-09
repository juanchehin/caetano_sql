DROP procedure IF EXISTS `bsp_buscar_cliente`;
DELIMITER $$

CREATE PROCEDURE `bsp_buscar_cliente`(pTextoBuscar varchar(30))
BEGIN
	/*
	Permite buscar los clientes dados de alta que contengan una parte del nombre del titular o transporte
    */

    SELECT		*
    FROM		personas p
				RIGHT JOIN clientes c on p.IdPersona = c.IdCliente
    WHERE		(Apellidos LIKE CONCAT('%',pTextoBuscar,'%')) OR (Nombres LIKE CONCAT('%',pTextoBuscar,'%')); 
END$$
DELIMITER ;