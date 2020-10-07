DROP procedure IF EXISTS `bsp_eliminar_producto`;
DELIMITER $$

CREATE PROCEDURE `bsp_eliminar_producto`(pIdProducto int)
SALIR:BEGIN
	/*
    Permite eliminar un producto. Devuelve 1 o el mensaje de error en Mensaje.
	*/
    -- Controla que el producto no este dado de baja ya
    IF NOT EXISTS(SELECT IdProducto FROM Productos WHERE IdProducto = pIdProducto) THEN
		SELECT 'El producto no existe.' AS Mensaje;
        LEAVE SALIR;
	END IF;
    
-- Elimino
	DELETE FROM Productos WHERE IdProducto = pIdProducto;
    
    SELECT 'Ok' AS Mensaje;
END$$
DELIMITER ;