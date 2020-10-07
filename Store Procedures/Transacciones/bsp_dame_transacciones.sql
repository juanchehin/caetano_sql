DROP procedure IF EXISTS `bsp_dame_transacciones`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `bsp_dame_transacciones`()
BEGIN
	/*
	Permite listar todas las transacciones , ingresos y egresos
    */

    SELECT 		t.IdTransaccion,t.Fecha,p.Apellidos,p.Nombres,t.Cantidad,
                tp.TipoPago,cur.Curso,cor.Corte,prod.Producto,t.Observaciones,
               CASE 
					WHEN e.IdTransaccion != 'null' THEN 'Egreso'
				ELSE 'Ingreso' END AS Tipo
    FROM 		transacciones t
				LEFT JOIN personas p ON p.IdPersona = t.IdPersona
				LEFT JOIN tipospagos tp ON t.IdTipoPago = tp.IdTipoPago
                LEFT JOIN cursos cur ON t.IdCurso = cur.IdCurso
                LEFT JOIN cortes cor ON cor.IdCorte = t.IdCorte
                LEFT JOIN egresos e ON e.IdTransaccion = t.IdTransaccion
                LEFT JOIN productos prod ON e.IdProducto = prod.IdProducto
    -- GROUP BY 	t.IdTransaccion;
    ORDER BY	t.IdTransaccion desc;
 	-- LIMIT 		pDesde,5;
    

END ;;
DELIMITER ;