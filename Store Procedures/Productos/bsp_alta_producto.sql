DROP procedure IF EXISTS `bsp_alta_producto`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `bsp_alta_producto`(
pProveedor varchar(60),
pCategoria varchar(60),
pProducto varchar(60),
pCodigo varchar(60),
pObservaciones varchar(255)
)
SALIR:BEGIN
	/*
    Permite dar de alta un producto controlando que el mismo no exista ya. 
    La da de alta al final del orden, con estado A: Activa. 
    Devuelve OK + Id o el mensaje de error en Mensaje.
    */
	DECLARE pIdProducto,pIdProveedor,pIdCategoria int;
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
    
-- Controla que el correo sea obligatorio 
	IF pProveedor = '' OR pProveedor IS NULL THEN
		SELECT 'Debe proveer un nombre para el Proveedor' AS Mensaje, NULL AS Id;
		LEAVE SALIR;
    END IF;
-- Controla que el correo sea obligatorio 
	IF pCategoria = '' OR pCategoria IS NULL THEN
		SELECT 'Debe proveer un nombre para la Categoria' AS Mensaje, NULL AS Id;
		LEAVE SALIR;
    END IF;
    
-- Controla que exista la categoria
	IF NOT EXISTS(SELECT categoria FROM categorias WHERE Categoria = pCategoria) THEN
		SELECT 'Categoria inexistente' AS Mensaje;
		LEAVE SALIR;
    END IF;
    
-- Controla que exista el proveedor
	IF NOT EXISTS(SELECT proveedor FROM proveedores WHERE proveedor = pProveedor) THEN
		SELECT 'Proveedor inexistente' AS Mensaje;
		LEAVE SALIR;
    END IF;
    
-- Controla que no exista un documento con el mismo numero
	IF EXISTS(SELECT producto FROM productos WHERE Producto = pProducto) THEN
		SELECT 'Ya existe un Producto con ese nombre' AS Mensaje;
		LEAVE SALIR;
    END IF;
    
-- Obtengo los Id correspondientes
	SET pIdProveedor = (SELECT IdProveedor FROM proveedores WHERE proveedor = pProveedor );
    SET pIdCategoria = (SELECT IdCategoria FROM categorias WHERE categoria = pCategoria);
    
	START TRANSACTION;
		SET pIdProducto = 1 + (SELECT COALESCE(MAX(IdProducto),0) FROM productos);
		INSERT INTO productos VALUES(pIdProducto,pIdProveedor,pIdCategoria,pCodigo,pProducto,0,'A',pObservaciones);

	SELECT 'Ok' AS Mensaje;
    COMMIT;

END ;;
DELIMITER ;