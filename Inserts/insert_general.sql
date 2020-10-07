-- Archivo de INSERTS , ejecutar en orden

LOCK TABLES `cortes` WRITE;

INSERT INTO `cortes` VALUES (1,'Trenzado',960,'Este es un corte de mujer','A');
INSERT INTO `cortes` VALUES (2,'Desmechado',300,'Este es un corte desmechado','A');
INSERT INTO `cortes` VALUES (3,'Corte recto',960,'Este es un corte recto','A');
INSERT INTO `cortes` VALUES (4,'Rulos con limpieza',1200,'Ninguna ','A');

UNLOCK TABLES;

LOCK TABLES `tipospagos` WRITE;

INSERT INTO `tipospagos` VALUES (1,'-','-');
INSERT INTO `tipospagos` VALUES (2,'Efectivo','Cash');
INSERT INTO `tipospagos` VALUES (3,'Debito','Debito');
INSERT INTO `tipospagos` VALUES (4,'Transferencia bancaria','Transf banc ');

UNLOCK TABLES;



LOCK TABLES `categorias` WRITE;

INSERT INTO `categorias` VALUES (1,'-','-','A');
INSERT INTO `categorias` VALUES (2,'Cosmetica','Categoria cosmetica','A');
INSERT INTO `categorias` VALUES (3,'Cuidado cabello','Categoria cabello','A');
INSERT INTO `categorias` VALUES (4,'Barberia','Categoria barberia','A');

UNLOCK TABLES;

-- proveedores , debe existir las personas

INSERT INTO `personas` VALUES (1,'-','-',0,'2000-02-02',curdate(),'-',0,'-','-','-','-','-','-');
INSERT INTO `personas` VALUES (2,'Abadie','Maria Ines',9604598,'2000-02-02',curdate(),'Abadie@gmail.com',1221378978,'Gral paz 234','San m tucu','Tucuman','M','A','Ninguno');
INSERT INTO `personas` VALUES (3,'Garcia','Francisco',16566,'2001-03-02',curdate(),'garcia@gmail.com',455654,'Santiago 88','Lules','Tucuman','H','A','Ninguno');


LOCK TABLES `proveedores` WRITE;

INSERT INTO `proveedores` VALUES (2,'Sin proveedor',0,'','A');
INSERT INTO `proveedores` VALUES (3,'Distribuidora Elite',45679,'DElite@gmail.com','A');
-- INSERT INTO `proveedores` VALUES (3,'Plusblelle',45646,'Plusblelle@gmail.com','A');
-- INSERT INTO `proveedores` VALUES (4,'Pantene distribuidora',45879,'pantenecontacto@gmail.com','A');

UNLOCK TABLES;

-- Cursos

LOCK TABLES `cursos` WRITE;

INSERT INTO `cursos` VALUES (1,'Curso Barberia',960,'A','Brushing y cortes');
INSERT INTO `cursos` VALUES (2,'Peluqueria damas y unisex',300,'A','Color, peinados');
INSERT INTO `cursos` VALUES (3,'Peluqueria caballeros',960,'A','Caballeros y niños. Tijeras, navajas y maquina');
INSERT INTO `cursos` VALUES (4,'Estilista en corte',1200,'A','Perfeccionamiento completo en corte');

UNLOCK TABLES;

-- Productos

LOCK TABLES `productos` WRITE;

INSERT INTO `productos` VALUES (1,2,3,'Shampoo neutro',960,10,'A','Para dama');
INSERT INTO `productos` VALUES (2,3,1,'Tijeras corte recto',300,12,'A','Buenas tijeras');
INSERT INTO `productos` VALUES (3,2,4,'Polvo decolorante',960,90,'A','Usar con cuidado');
INSERT INTO `productos` VALUES (4,2,2,'Gel fijacion',1200,3,'A','Para hombre adulto');

UNLOCK TABLES;

-- Alumnos

-- LOCK TABLES `alumnos` WRITE;

INSERT INTO `personas` VALUES (4,'Abadie','Maria Ines',9604598,'2000-02-02',curdate(),'Abadie@gmail.com',1221378978,'Gral paz 234','San m tucu','Tucuman','M','A','Ninguno');
INSERT INTO `personas` VALUES (5,'Garcia','Francisco',16566,'2001-03-02',curdate(),'garcia@gmail.com',455654,'Santiago 88','Lules','Tucuman','H','A','Ninguno');
INSERT INTO `personas` VALUES (6,'Gomez','Maria pilar',12327,'1991-02-02',curdate(),'Pilar@gmail.com',2132456789,'Av sarmiento','Concepcion','Tucuman','M','A','Ninguno');
INSERT INTO `personas` VALUES (7,'Jimenez','Susana',12321465,'1665-02-02',curdate(),'susi@gmail.com',12564,'Corrientes 124','Alto verde','Tucuman','M','A','Ninguno');

INSERT INTO `alumnos` VALUES (4);
INSERT INTO `alumnos` VALUES (5);
INSERT INTO `alumnos` VALUES (6);
INSERT INTO `alumnos` VALUES (7);

-- Transacciones

LOCK TABLES `transacciones` WRITE;

INSERT INTO `transacciones` VALUES (1,2,4,2,null,'Ninguna',curdate(),2);
INSERT INTO `transacciones` VALUES (2,1,1,null,1,'Ninguna',curdate(),1);


INSERT INTO `transacciones` VALUES (3,1,1,null,null,'Ninguna',curdate());
INSERT INTO `transacciones` VALUES (4,1,1,null,null,'Ninguna',curdate());
INSERT INTO `egresos` VALUES (3,2);
INSERT INTO `egresos` VALUES (4,1);


UNLOCK TABLES;

-- Usuarios

-- proveedores , debe existir las personas

INSERT INTO `personas` VALUES (8,'Arroyo','Claudio',12345656,'2000-02-02',curdate(),'arroyo@gmail.com',1265456,'Monterio 100','Aguilares','Tucuman','H','A','Ninguni');
INSERT INTO `personas` VALUES (9,'Ghandi','Mayatma',9604598,'2000-02-02',curdate(),'gandhi@gmail.com',4554,'Algerich 1200','Villa','Cordoba','M','A','Ninguno');

INSERT INTO `usuarios` VALUES (8,'admin',null,'Tarde-Noche','81dc9bdb52d04dc20036dbd8313ed055');
INSERT INTO `usuarios` VALUES (9,'Empleado1',null,'Mañana','81dc9bdb52d04dc20036dbd8313ed055');

