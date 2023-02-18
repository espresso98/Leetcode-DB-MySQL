-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema global_super_store
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema global_super_store
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `global_super_store` DEFAULT CHARACTER SET utf8 ;
USE `global_super_store` ;

-- -----------------------------------------------------
-- Table `global_super_store`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `global_super_store`.`Customers` (
  `CustomerID` INT NOT NULL,
  `FullNme` VARCHAR(45) NOT NULL,
  `ContactNumber` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `global_super_store`.`Products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `global_super_store`.`Products` (
  `ProductID` INT NOT NULL,
  `ProductName` VARCHAR(45) NULL,
  `AmountInStock` INT NULL,
  `Price` DECIMAL NULL,
  `Category` VARCHAR(45) NULL,
  `Subcategory` VARCHAR(45) NULL,
  PRIMARY KEY (`ProductID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `global_super_store`.`DeliveryAddress`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `global_super_store`.`DeliveryAddress` (
  `AddressID` INT NOT NULL,
  `Street` VARCHAR(45) NULL,
  `PostCode` VARCHAR(45) NULL,
  `City` VARCHAR(45) NULL,
  `State` VARCHAR(45) NULL,
  `Country` VARCHAR(45) NULL,
  PRIMARY KEY (`AddressID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `global_super_store`.`Shipping`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `global_super_store`.`Shipping` (
  `ShipID` INT NOT NULL,
  `ShipDate` DATE NULL,
  `ShipMode` VARCHAR(45) NULL,
  `AddressID` INT NULL,
  `ShipCost` DECIMAL NULL,
  PRIMARY KEY (`ShipID`),
  INDEX `Address_id_fk_idx` (`AddressID` ASC) VISIBLE,
  CONSTRAINT `Address_id_fk`
    FOREIGN KEY (`AddressID`)
    REFERENCES `global_super_store`.`DeliveryAddress` (`AddressID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `global_super_store`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `global_super_store`.`Orders` (
  `OrderID` INT NOT NULL,
  `CustomerID` INT NOT NULL,
  `ProductID` INT NOT NULL,
  `DeliveryID` INT NOT NULL,
  `Quantity` INT NOT NULL,
  `TotalCost` DECIMAL NOT NULL,
  `OrderPriority` VARCHAR(45) NULL,
  `Discount` DECIMAL NULL,
  `ShipID` INT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `Customer_id_fk_idx` (`CustomerID` ASC) VISIBLE,
  INDEX `Procudt_id_fk_idx` (`ProductID` ASC) VISIBLE,
  INDEX `Ship_id_fk_idx` (`ShipID` ASC) VISIBLE,
  CONSTRAINT `Customer_id_fk`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `global_super_store`.`Customers` (`CustomerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `Procudt_id_fk`
    FOREIGN KEY (`ProductID`)
    REFERENCES `global_super_store`.`Products` (`ProductID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `Ship_id_fk`
    FOREIGN KEY (`ShipID`)
    REFERENCES `global_super_store`.`Shipping` (`ShipID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `global_super_store`.`table1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `global_super_store`.`table1` (
)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
