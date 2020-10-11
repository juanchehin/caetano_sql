DROP procedure IF EXISTS `bsp_alta_producto`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `bsp_alta_producto`(
pIdProveedor int,
pIdCategoria int,
pProducto varchar(60),
pCodigo varchar(60),
pPrecio decimal(12,5),
pObservaciones varchar(255)
)
SALIR:BEGIN
	/*
    Permite dar de alta un producto controlando que el mismo no exista ya. 
    La da de alta al final del orden, con estado A: Activa. 
    Devuelve OK + Id o el mensaje de error en Mensaje.
    */
	DECLARE pIdProducto int;
	-- Manejo de error en la transacción
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		SHOW ERRORS;
		-- SELECT 'Error en la transacción. Contáctese con el administrador.' Mensaje;
		-- NULL AS Id;
		ROLLBACK;
	END;
    -- Controla que el correo sea obligatorio 
	IF pProducto = '' OR pProducto IS NULL THEN
		SELECT 'Debe proveer un nombre para el producto' AS Mensaje, NULL AS Id;
		LEAVE SALIR;
    END IF;
    
-- Controla que exista la categoria
	IF NOT EXISTS(SELECT IdCategoria FROM categorias WHERE IdCategoria = pIdCategoria) THEN
		SELECT 'Categoria inexistente' AS Mensaje;
		LEAVE SALIR;
    END IF;
    
-- Controla que exista el proveedor
	IF NOT EXISTS(SELECT IdProveedor FROM proveedores WHERE IdProveedor = pIdProveedor) THEN
		SELECT 'Proveedor inexistente' AS Mensaje;
		LEAVE SALIR;
    END IF;
    
-- Controla que no exista un documento con el mismo numero
	IF EXISTS(SELECT producto FROM productos WHERE Producto = pProducto) THEN
		SELECT 'Ya existe un Producto con ese nombre' AS Mensaje;
		LEAVE SALIR;
    END IF;
    
	START TRANSACTION;
		SET pIdProducto = 1 + (SELECT COALESCE(MAX(IdProducto),0) FROM productos);
		INSERT INTO Personas VALUES(pIdProducto,pIdProveedor,pIdCategoria,pCodigo,pProducto,pPrecio,pStock,pEstadoProd,pObservaciones);

	SELECT 'Ok' AS Mensaje;
    COMMIT;

END ;;
DELIMITER ;