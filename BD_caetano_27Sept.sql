-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema caetano
-- -----------------------------------------------------
-- Base de datos para peluqueria caetano

-- -----------------------------------------------------
-- Schema caetano
--
-- Base de datos para peluqueria caetano
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `caetano` ;
USE `caetano` ;

-- -----------------------------------------------------
-- Table `caetano`.`Personas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `caetano`.`Personas` (
  `IdPersona` INT NOT NULL,
  `Apellidos` VARCHAR(50) NULL,
  `Nombres` VARCHAR(50) NULL,
  `DNI` INT(12) NULL,
  `FechaNac` DATE NULL,
  `FechaAlta` DATE NULL,
  `Email` VARCHAR(255) NULL,
  `Telefono` VARCHAR(45) NULL,
  `Direccion` VARCHAR(255) NULL,
  `Ciudad` VARCHAR(45) NULL,
  `Provincia` VARCHAR(45) NULL,
  `Sexo` CHAR(1) NULL,
  `EstadoPer` CHAR(1) NULL DEFAULT 'A' COMMENT 'A: Alta\nB: Baja',
  `Comentarios` VARCHAR(255) NULL,
  PRIMARY KEY (`IdPersona`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `caetano`.`Clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `caetano`.`Clientes` (
  `IdCliente` INT NOT NULL,
  PRIMARY KEY (`IdCliente`),
  CONSTRAINT `fk_Clientes_Personas1`
    FOREIGN KEY (`IdCliente`)
    REFERENCES `caetano`.`Personas` (`IdPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `caetano`.`Usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `caetano`.`Usuarios` (
  `IdUsuario` INT NOT NULL,
  `FechaBaja` DATE NULL,
  `Horario` VARCHAR(45) NULL,
  `Password` CHAR(32) NOT NULL,
  INDEX `fk_Empleados_Personas1_idx` (`IdUsuario` ASC) ,
  CONSTRAINT `fk_Empleados_Personas1`
    FOREIGN KEY (`IdUsuario`)
    REFERENCES `caetano`.`Personas` (`IdPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `caetano`.`Proveedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `caetano`.`Proveedores` (
  `IdProveedor` INT NOT NULL,
  `Proveedor` VARCHAR(45) NULL,
  `Telefono` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  `EstadoProv` CHAR(1) NULL,
  PRIMARY KEY (`IdProveedor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `caetano`.`Categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `caetano`.`Categorias` (
  `IdCategoria` INT NOT NULL,
  `Categoria` VARCHAR(50) NULL,
  `Descripcion` VARCHAR(255) NULL,
  `EstadoCat` CHAR(1) NULL COMMENT 'A: Alta\nB: Baja',
  PRIMARY KEY (`IdCategoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `caetano`.`Productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `caetano`.`Productos` (
  `IdProducto` INT NOT NULL,
  `IdProveedor` INT NOT NULL,
  `IdCategoria` INT NOT NULL,
  `Producto` VARCHAR(45) NULL,
  `Precio` DECIMAL(12,5) NULL,
  `Stock` INT NULL,
  `EstadoProd` CHAR(1) NULL COMMENT 'A: Alta\nB: Baja',
  `Observaciones` VARCHAR(255) NULL,
  PRIMARY KEY (`IdProducto`),
  INDEX `fk_Productos_Proveedores1_idx` (`IdProveedor` ASC) ,
  INDEX `fk_Productos_Categoria1_idx` (`IdCategoria` ASC) ,
  CONSTRAINT `fk_Productos_Proveedores1`
    FOREIGN KEY (`IdProveedor`)
    REFERENCES `caetano`.`Proveedores` (`IdProveedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Productos_Categoria1`
    FOREIGN KEY (`IdCategoria`)
    REFERENCES `caetano`.`Categorias` (`IdCategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `caetano`.`TiposPagos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `caetano`.`TiposPagos` (
  `IdTipoPago` INT NOT NULL,
  `TipoPago` VARCHAR(60) NULL,
  `Descripcion` VARCHAR(255) NULL,
  PRIMARY KEY (`IdTipoPago`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `caetano`.`Cursos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `caetano`.`Cursos` (
  `IdCurso` INT NOT NULL,
  `Curso` VARCHAR(50) NULL,
  `Precio` DECIMAL(12,5) NULL,
  `EstadoCurso` CHAR(1) NULL,
  `Descripcion` VARCHAR(255) NULL,
  PRIMARY KEY (`IdCurso`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `caetano`.`Cortes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `caetano`.`Cortes` (
  `IdCorte` INT NOT NULL,
  `Corte` VARCHAR(60) NULL,
  `Precio` DECIMAL(12,5) NULL,
  `Descripcion` VARCHAR(255) NULL,
  `EstadoCor` CHAR(1) NULL DEFAULT 'A' COMMENT 'A: Alta\nB: Baja',
  PRIMARY KEY (`IdCorte`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `caetano`.`Transacciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `caetano`.`Transacciones` (
  `IdTransaccion` INT NOT NULL,
  `IdTipoPago` INT NOT NULL DEFAULT 1,
  `IdPersona` INT NOT NULL DEFAULT 1,
  `IdCurso` INT NULL,
  `IdCorte` INT NULL,
  `Observaciones` VARCHAR(255) NULL,
  `Fecha` DATE NULL,
  PRIMARY KEY (`IdTransaccion`),
  INDEX `fk_Transacciones_TipoPago1_idx` (`IdTipoPago` ASC) ,
  INDEX `fk_Transacciones_Personas1_idx` (`IdPersona` ASC) ,
  INDEX `fk_Transacciones_Cursos1_idx` (`IdCurso` ASC) ,
  INDEX `fk_Transacciones_Cortes1_idx` (`IdCorte` ASC) ,
  CONSTRAINT `fk_Transacciones_TipoPago1`
    FOREIGN KEY (`IdTipoPago`)
    REFERENCES `caetano`.`TiposPagos` (`IdTipoPago`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Transacciones_Personas1`
    FOREIGN KEY (`IdPersona`)
    REFERENCES `caetano`.`Personas` (`IdPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Transacciones_Cursos1`
    FOREIGN KEY (`IdCurso`)
    REFERENCES `caetano`.`Cursos` (`IdCurso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Transacciones_Cortes1`
    FOREIGN KEY (`IdCorte`)
    REFERENCES `caetano`.`Cortes` (`IdCorte`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `caetano`.`Alumnos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `caetano`.`Alumnos` (
  `IdAlumno` INT NOT NULL,
  PRIMARY KEY (`IdAlumno`),
  CONSTRAINT `fk_Alumnos_Personas1`
    FOREIGN KEY (`IdAlumno`)
    REFERENCES `caetano`.`Personas` (`IdPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `caetano`.`Turnos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `caetano`.`Turnos` (
  `IdTurno` INT NOT NULL,
  `IdCliente` INT NOT NULL,
  `FechaHora` DATETIME NULL,
  PRIMARY KEY (`IdTurno`, `IdCliente`),
  INDEX `fk_Turno_Clientes1_idx` (`IdCliente` ASC) ,
  CONSTRAINT `fk_Turno_Clientes1`
    FOREIGN KEY (`IdCliente`)
    REFERENCES `caetano`.`Clientes` (`IdCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `caetano`.`Egresos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `caetano`.`Egresos` (
  `IdTransaccion` INT NOT NULL,
  `IdProducto` INT NULL,
  INDEX `fk_Egresos_Transacciones1_idx` (`IdTransaccion` ASC) ,
  INDEX `fk_Egresos_Productos1_idx` (`IdProducto` ASC) ,
  CONSTRAINT `fk_Egresos_Transacciones1`
    FOREIGN KEY (`IdTransaccion`)
    REFERENCES `caetano`.`Transacciones` (`IdTransaccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Egresos_Productos1`
    FOREIGN KEY (`IdProducto`)
    REFERENCES `caetano`.`Productos` (`IdProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `caetano`.`AlumnosCursos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `caetano`.`AlumnosCursos` (
  `IdAlumno` INT NOT NULL,
  `IdCurso` INT NOT NULL,
  `Horario` DATETIME NULL,
  PRIMARY KEY (`IdAlumno`, `IdCurso`),
  INDEX `fk_Alumnos_has_Cursos_Cursos1_idx` (`IdCurso` ASC) ,
  INDEX `fk_Alumnos_has_Cursos_Alumnos1_idx` (`IdAlumno` ASC) ,
  CONSTRAINT `fk_Alumnos_has_Cursos_Alumnos1`
    FOREIGN KEY (`IdAlumno`)
    REFERENCES `caetano`.`Alumnos` (`IdAlumno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Alumnos_has_Cursos_Cursos1`
    FOREIGN KEY (`IdCurso`)
    REFERENCES `caetano`.`Cursos` (`IdCurso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `caetano`.`ClientesCortes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `caetano`.`ClientesCortes` (
  `IdCliente` INT NOT NULL,
  `IdCorte` INT NOT NULL,
  PRIMARY KEY (`IdCliente`, `IdCorte`),
  INDEX `fk_Clientes_has_Cortes_Cortes1_idx` (`IdCorte` ASC) ,
  INDEX `fk_Clientes_has_Cortes_Clientes1_idx` (`IdCliente` ASC) ,
  CONSTRAINT `fk_Clientes_has_Cortes_Clientes1`
    FOREIGN KEY (`IdCliente`)
    REFERENCES `caetano`.`Clientes` (`IdCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Clientes_has_Cortes_Cortes1`
    FOREIGN KEY (`IdCorte`)
    REFERENCES `caetano`.`Cortes` (`IdCorte`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
