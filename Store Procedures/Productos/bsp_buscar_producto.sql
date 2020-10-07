DROP procedure IF EXISTS `bsp_buscar_producto`;
DELIMITER $$

CREATE PROCEDURE `bsp_buscar_producto`(pTextoBuscar varchar(30))
BEGIN
	/*
	Permite buscar los productos dados de alta que contengan una parte del nombre del producto
    */

    SELECT		prod.IdProducto,prod.Producto,prod.Precio,prod.Stock,prod.Observaciones,prod.EstadoProd,cat.Categoria,prov.Proveedor
    FROM		productos prod
				LEFT JOIN proveedores prov on prod.IdProveedor = prov.IdProveedor
                LEFT JOIN categorias cat on prod.IdCategoria = cat.IdCategoria
    WHERE		prod.Producto LIKE CONCAT('%',pTextoBuscar,'%') AND (prod.EstadoProd = 'A');    
END$$
DELIMITER ;