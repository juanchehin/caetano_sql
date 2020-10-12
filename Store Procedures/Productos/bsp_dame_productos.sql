DROP procedure IF EXISTS `bsp_dame_productos`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `bsp_dame_productos`(pIncluyeBajas boolean)
BEGIN
	/*
	Permite listar los productos dados de alta ordenadas por nombre.
    */
-- Control de el parametro 'pDesde' por si viene igualado a cero
    
	SELECT		prod.IdProducto,prod.Producto,prod.Codigo,prov.Proveedor,cat.Categoria,prod.Stock,prod.EstadoProd,prod.Observaciones
    FROM		productos prod
				LEFT JOIN proveedores prov on prov.IdProveedor = prod.IdProveedor
                LEFT JOIN categorias cat on cat.IdCategoria = prod.IdCategoria
    WHERE		((pIncluyeBajas = true) OR (EstadoProd = 'A'))
    ORDER BY	Producto asc;

    
END ;;
DELIMITER ;