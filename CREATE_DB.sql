-- MySQL Script generated by MySQL Workbench
-- Mon Nov  1 15:45:45 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema marios_pizza
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `marios_pizza` ;

-- -----------------------------------------------------
-- Schema marios_pizza
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `marios_pizza` DEFAULT CHARACTER SET utf8 ;
USE `marios_pizza` ;

-- -----------------------------------------------------
-- Table `marios_pizza`.`addressinfo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `marios_pizza`.`addressinfo` ;

CREATE TABLE IF NOT EXISTS `marios_pizza`.`addressinfo` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `HouseNumber` VARCHAR(10) NOT NULL,
  `Address` VARCHAR(100) NOT NULL,
  `Zipcode` VARCHAR(6) NULL DEFAULT NULL,
  `City` VARCHAR(45) NOT NULL,
  `CreatedOn` DATETIME NOT NULL,
  `CreatedBy` VARCHAR(45) NOT NULL,
  `LastUpdate` DATETIME NOT NULL,
  `UpdateBy` VARCHAR(45) NOT NULL,
  `Deleted` TINYINT NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `AddressInfoID_UNIQUE` (`ID` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `marios_pizza`.`category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `marios_pizza`.`category` ;

CREATE TABLE IF NOT EXISTS `marios_pizza`.`category` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Description` VARCHAR(255) NOT NULL,
  `Active` TINYINT NOT NULL,
  `CreatedOn` DATETIME NOT NULL,
  `CreatedBy` VARCHAR(45) NOT NULL,
  `LastUpdate` DATETIME NOT NULL,
  `UpdateBy` VARCHAR(45) NOT NULL,
  `Deleted` TINYINT NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `Name_UNIQUE` (`Name` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `marios_pizza`.`municipality`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `marios_pizza`.`municipality` ;

CREATE TABLE IF NOT EXISTS `marios_pizza`.`municipality` (
  `ID` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `CreatedOn` DATETIME NOT NULL,
  `CreatedBy` VARCHAR(45) NOT NULL,
  `LastUpdate` DATETIME NOT NULL,
  `UpdateBy` VARCHAR(45) NOT NULL,
  `Deleted` TINYINT NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  INDEX `index_MunName` (`Name` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `marios_pizza`.`city`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `marios_pizza`.`city` ;

CREATE TABLE IF NOT EXISTS `marios_pizza`.`city` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Municipality_ID` INT NOT NULL,
  `CreatedOn` DATETIME NOT NULL,
  `CreatedBy` VARCHAR(45) NOT NULL,
  `LastUpdate` DATETIME NOT NULL,
  `UpdateBy` VARCHAR(45) NOT NULL,
  `Deleted` TINYINT NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`, `Municipality_ID`),
  INDEX `fk_City_Municipality1_idx` (`Municipality_ID` ASC) VISIBLE,
  INDEX `index_CityName` (`Name` ASC) VISIBLE,
  CONSTRAINT `fk_City_Municipality1`
    FOREIGN KEY (`Municipality_ID`)
    REFERENCES `marios_pizza`.`municipality` (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `marios_pizza`.`coupon`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `marios_pizza`.`coupon` ;

CREATE TABLE IF NOT EXISTS `marios_pizza`.`coupon` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Code` VARCHAR(45) NOT NULL,
  `DiscountPercentage` DECIMAL(7,3) NULL DEFAULT NULL,
  `Discountprice` INT NULL DEFAULT NULL,
  `CouponFormula` VARCHAR(500) NULL DEFAULT NULL,
  `Description` VARCHAR(255) NOT NULL,
  `Active` TINYINT NOT NULL,
  `StartDate` DATETIME NOT NULL,
  `EndDate` DATETIME NULL DEFAULT NULL,
  `CreatedOn` DATETIME NOT NULL,
  `CreatedBy` VARCHAR(45) NOT NULL,
  `LastUpdate` DATETIME NOT NULL,
  `UpdateBy` VARCHAR(45) NOT NULL,
  `Deleted` TINYINT NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `Description_UNIQUE` (`Description` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `marios_pizza`.`customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `marios_pizza`.`customer` ;

CREATE TABLE IF NOT EXISTS `marios_pizza`.`customer` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Birthdate` DATE NULL DEFAULT NULL,
  `Email` VARCHAR(255) NOT NULL,
  `Phone1` VARCHAR(12) NOT NULL,
  `Phone2` VARCHAR(12) NULL DEFAULT NULL,
  `CreatedOn` DATETIME NOT NULL,
  `CreatedBy` VARCHAR(45) NOT NULL,
  `LastUpdate` DATETIME NOT NULL,
  `UpdateBy` VARCHAR(45) NOT NULL,
  `Deleted` TINYINT NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `CustomerID_UNIQUE` (`ID` ASC) VISIBLE,
  UNIQUE INDEX `Email_UNIQUE` (`Email` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `marios_pizza`.`customer_addressinfo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `marios_pizza`.`customer_addressinfo` ;

CREATE TABLE IF NOT EXISTS `marios_pizza`.`customer_addressinfo` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Customer_ID` INT NOT NULL,
  `AddressInfo_ID` INT NOT NULL,
  `CreatedOn` DATETIME NOT NULL,
  `CreatedBy` VARCHAR(45) NOT NULL,
  `LastUpdate` DATETIME NOT NULL,
  `UpdateBy` VARCHAR(45) NOT NULL,
  `Deleted` TINYINT NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`, `Customer_ID`, `AddressInfo_ID`),
  INDEX `fk_Customer_Addressinfo_Customer1_idx` (`Customer_ID` ASC) VISIBLE,
  INDEX `fk_Customer_Addressinfo_AddressInfo1_idx` (`AddressInfo_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Customer_Addressinfo_AddressInfo1`
    FOREIGN KEY (`AddressInfo_ID`)
    REFERENCES `marios_pizza`.`addressinfo` (`ID`),
  CONSTRAINT `fk_Customer_Addressinfo_Customer1`
    FOREIGN KEY (`Customer_ID`)
    REFERENCES `marios_pizza`.`customer` (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `marios_pizza`.`deliverytype`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `marios_pizza`.`deliverytype` ;

CREATE TABLE IF NOT EXISTS `marios_pizza`.`deliverytype` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Type` VARCHAR(45) NOT NULL,
  `Active` TINYINT NOT NULL DEFAULT '0',
  `CreatedOn` DATETIME NOT NULL,
  `CreatedBy` VARCHAR(45) NOT NULL,
  `LastUpdate` DATETIME NOT NULL,
  `UpdateBy` VARCHAR(45) NOT NULL,
  `Deleted` TINYINT NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `Type_UNIQUE` (`Type` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `marios_pizza`.`openingtime`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `marios_pizza`.`openingtime` ;

CREATE TABLE IF NOT EXISTS `marios_pizza`.`openingtime` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Description` VARCHAR(255) NULL DEFAULT NULL,
  `MonOpen` TIME NULL DEFAULT NULL,
  `MonClosed` TIME NULL DEFAULT NULL,
  `TueOpen` TIME NULL DEFAULT NULL,
  `TueClosed` TIME NULL DEFAULT NULL,
  `WedOpen` TIME NULL DEFAULT NULL,
  `WedClosed` TIME NULL DEFAULT NULL,
  `ThuOpen` TIME NULL DEFAULT NULL,
  `ThueClosed` TIME NULL DEFAULT NULL,
  `FriOpen` TIME NULL DEFAULT NULL,
  `FriClosed` TIME NULL DEFAULT NULL,
  `SatOpen` TIME NULL DEFAULT NULL,
  `SatClosed` TIME NULL DEFAULT NULL,
  `SunOpen` TIME NULL DEFAULT NULL,
  `SunClosed` TIME NULL DEFAULT NULL,
  `CreatedOn` DATETIME NOT NULL,
  `CreatedBy` VARCHAR(45) NOT NULL,
  `LastUpdate` DATETIME NOT NULL,
  `UpdateBy` VARCHAR(45) NOT NULL,
  `Deleted` TINYINT NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `marios_pizza`.`shop`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `marios_pizza`.`shop` ;

CREATE TABLE IF NOT EXISTS `marios_pizza`.`shop` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(75) NOT NULL,
  `Phone` VARCHAR(12) NOT NULL,
  `Email` VARCHAR(255) NOT NULL,
  `StreetName` VARCHAR(75) NOT NULL,
  `HouseNumber` VARCHAR(10) NOT NULL,
  `Zipcode` VARCHAR(6) NOT NULL,
  `City` VARCHAR(45) NOT NULL,
  `CreatedOn` DATETIME NOT NULL,
  `CreatedBy` VARCHAR(45) NOT NULL,
  `LastUpdate` DATETIME NOT NULL,
  `UpdateBy` VARCHAR(45) NOT NULL,
  `Deleted` TINYINT NOT NULL DEFAULT '0',
  `OpeningTime_ID` INT NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Shop_OpeningTime1_idx` (`OpeningTime_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Shop_OpeningTime1`
    FOREIGN KEY (`OpeningTime_ID`)
    REFERENCES `marios_pizza`.`openingtime` (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `marios_pizza`.`differentopeningtime`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `marios_pizza`.`differentopeningtime` ;

CREATE TABLE IF NOT EXISTS `marios_pizza`.`differentopeningtime` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Date` DATE NOT NULL,
  `Open` TIME NOT NULL,
  `Close` TIME NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Description` VARCHAR(255) NULL DEFAULT NULL,
  `Shop_ID` INT NOT NULL,
  `CreatedOn` DATETIME NOT NULL,
  `CreatedBy` VARCHAR(45) NOT NULL,
  `LastUpdate` DATETIME NOT NULL,
  `UpdateBy` VARCHAR(45) NOT NULL,
  `Deleted` TINYINT NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`, `Shop_ID`),
  INDEX `fk_DiffOpeningTime_Shop1_idx` (`Shop_ID` ASC) VISIBLE,
  CONSTRAINT `fk_DiffOpeningTime_Shop1`
    FOREIGN KEY (`Shop_ID`)
    REFERENCES `marios_pizza`.`shop` (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `marios_pizza`.`tax`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `marios_pizza`.`tax` ;

CREATE TABLE IF NOT EXISTS `marios_pizza`.`tax` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Tax` DECIMAL(7,3) NOT NULL,
  `Description` VARCHAR(255) NOT NULL,
  `CreatedOn` DATETIME NOT NULL,
  `CreatedBy` VARCHAR(45) NOT NULL,
  `LastUpdate` DATETIME NOT NULL,
  `UpdateBy` VARCHAR(45) NOT NULL,
  `Deleted` TINYINT NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `marios_pizza`.`ingredient`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `marios_pizza`.`ingredient` ;

CREATE TABLE IF NOT EXISTS `marios_pizza`.`ingredient` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Description` VARCHAR(255) NULL DEFAULT NULL,
  `Price` DECIMAL(7,3) NULL DEFAULT NULL,
  `Active` TINYINT NOT NULL DEFAULT '0',
  `Tax_ID` INT NOT NULL,
  `CreatedOn` DATETIME NOT NULL,
  `CreatedBy` VARCHAR(45) NOT NULL,
  `LastUpdate` DATETIME NOT NULL,
  `UpdateBy` VARCHAR(45) NOT NULL,
  `Deleted` TINYINT NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`, `Tax_ID`),
  INDEX `fk_Ingredients_Tax1_idx` (`Tax_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Ingredients_Tax1`
    FOREIGN KEY (`Tax_ID`)
    REFERENCES `marios_pizza`.`tax` (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `marios_pizza`.`subcategory`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `marios_pizza`.`subcategory` ;

CREATE TABLE IF NOT EXISTS `marios_pizza`.`subcategory` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Description` VARCHAR(255) NOT NULL,
  `Active` TINYINT NOT NULL DEFAULT '0',
  `Categorie_ID` INT NOT NULL,
  `CreatedOn` DATETIME NOT NULL,
  `CreatedBy` VARCHAR(45) NOT NULL,
  `LastUpdate` DATETIME NOT NULL,
  `UpdateBy` VARCHAR(45) NOT NULL,
  `Deleted` TINYINT NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`, `Categorie_ID`),
  UNIQUE INDEX `Name_UNIQUE` (`Name` ASC) VISIBLE,
  INDEX `fk_SubCategory_Category1_idx` (`Categorie_ID` ASC) VISIBLE,
  CONSTRAINT `fk_SubCategory_Category1`
    FOREIGN KEY (`Categorie_ID`)
    REFERENCES `marios_pizza`.`category` (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `marios_pizza`.`nonpizza`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `marios_pizza`.`nonpizza` ;

CREATE TABLE IF NOT EXISTS `marios_pizza`.`nonpizza` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Description` VARCHAR(255) NULL DEFAULT NULL,
  `Active` TINYINT NOT NULL,
  `Tax_ID` INT NOT NULL,
  `SubCategory_ID` INT NOT NULL,
  `CreatedOn` DATETIME NOT NULL,
  `CreatedBy` VARCHAR(45) NOT NULL,
  `LastUpdate` DATETIME NOT NULL,
  `UpdateBy` VARCHAR(45) NOT NULL,
  `Deleted` TINYINT NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`, `SubCategory_ID`, `Tax_ID`),
  INDEX `fk_NonPizza_Tax1_idx` (`Tax_ID` ASC) VISIBLE,
  INDEX `fk_NonPizza_SubCategory1_idx` (`SubCategory_ID` ASC) VISIBLE,
  CONSTRAINT `fk_NonPizza_SubCategory1`
    FOREIGN KEY (`SubCategory_ID`)
    REFERENCES `marios_pizza`.`subcategory` (`ID`),
  CONSTRAINT `fk_NonPizza_Tax1`
    FOREIGN KEY (`Tax_ID`)
    REFERENCES `marios_pizza`.`tax` (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `marios_pizza`.`pizzabottomtype`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `marios_pizza`.`pizzabottomtype` ;

CREATE TABLE IF NOT EXISTS `marios_pizza`.`pizzabottomtype` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL DEFAULT NULL,
  `Description` VARCHAR(255) NULL DEFAULT NULL,
  `Active` TINYINT NULL DEFAULT NULL,
  `CreatedOn` DATETIME NOT NULL,
  `CreatedBy` VARCHAR(45) NOT NULL,
  `LastUpdate` DATETIME NOT NULL,
  `UpdateBy` VARCHAR(45) NOT NULL,
  `Deleted` TINYINT NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `Name_UNIQUE` (`Name` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `marios_pizza`.`pizzabottom`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `marios_pizza`.`pizzabottom` ;

CREATE TABLE IF NOT EXISTS `marios_pizza`.`pizzabottom` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Size` VARCHAR(45) NOT NULL,
  `Active` TINYINT NOT NULL,
  `Price` DECIMAL(4,3) NULL DEFAULT NULL,
  `Tax_ID` INT NOT NULL,
  `PizzaBottomType_ID` INT NOT NULL,
  `CreatedOn` DATETIME NOT NULL,
  `CreatedBy` VARCHAR(45) NOT NULL,
  `LastUpdate` DATETIME NOT NULL,
  `UpdateBy` VARCHAR(45) NOT NULL,
  `Deleted` TINYINT NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`, `Tax_ID`, `PizzaBottomType_ID`),
  UNIQUE INDEX `Name_UNIQUE` (`Name` ASC) VISIBLE,
  INDEX `fk_PizzaBottom_Tax1_idx` (`Tax_ID` ASC) VISIBLE,
  INDEX `fk_PizzaBottom_PizzaBottomType1_idx` (`PizzaBottomType_ID` ASC) VISIBLE,
  CONSTRAINT `fk_PizzaBottom_PizzaBottomType1`
    FOREIGN KEY (`PizzaBottomType_ID`)
    REFERENCES `marios_pizza`.`pizzabottomtype` (`ID`),
  CONSTRAINT `fk_PizzaBottom_Tax1`
    FOREIGN KEY (`Tax_ID`)
    REFERENCES `marios_pizza`.`tax` (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `marios_pizza`.`property`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `marios_pizza`.`property` ;

CREATE TABLE IF NOT EXISTS `marios_pizza`.`property` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NULL DEFAULT NULL,
  `Description` VARCHAR(255) NULL DEFAULT NULL,
  `CreatedOn` DATETIME NOT NULL,
  `CreatedBy` VARCHAR(45) NOT NULL,
  `LastUpdate` DATETIME NOT NULL,
  `UpdateBy` VARCHAR(45) NOT NULL,
  `Deleted` TINYINT NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `marios_pizza`.`sauce`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `marios_pizza`.`sauce` ;

CREATE TABLE IF NOT EXISTS `marios_pizza`.`sauce` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Description` VARCHAR(255) NOT NULL,
  `Price` DECIMAL(7,3) NULL DEFAULT NULL,
  `Active` TINYINT NOT NULL,
  `Tax_ID` INT NOT NULL,
  `CreatedOn` DATETIME NOT NULL,
  `CreatedBy` VARCHAR(45) NOT NULL,
  `LastUpdate` DATETIME NOT NULL,
  `UpdateBy` VARCHAR(45) NOT NULL,
  `Deleted` TINYINT NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`, `Tax_ID`),
  INDEX `fk_Sauce_Tax1_idx` (`Tax_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Sauce_Tax1`
    FOREIGN KEY (`Tax_ID`)
    REFERENCES `marios_pizza`.`tax` (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `marios_pizza`.`item_property`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `marios_pizza`.`item_property` ;

CREATE TABLE IF NOT EXISTS `marios_pizza`.`item_property` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `PizzaBottom_ID` INT NULL DEFAULT NULL,
  `Sauce_ID` INT NULL DEFAULT NULL,
  `Ingredient_ID` INT NULL DEFAULT NULL,
  `NonPizza_ID` INT NULL DEFAULT NULL,
  `Property_ID` INT NOT NULL,
  `CreatedOn` DATETIME NOT NULL,
  `CreatedBy` VARCHAR(45) NOT NULL,
  `LastUpdate` DATETIME NOT NULL,
  `UpdateBy` VARCHAR(45) NOT NULL,
  `Deleted` TINYINT NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`, `Property_ID`),
  INDEX `fk_Item_Property_PizzaBottom1_idx` (`PizzaBottom_ID` ASC) VISIBLE,
  INDEX `fk_Item_Property_Sauce1_idx` (`Sauce_ID` ASC) VISIBLE,
  INDEX `fk_Item_Property_Ingredient1_idx` (`Ingredient_ID` ASC) VISIBLE,
  INDEX `fk_Item_Property_Property1_idx` (`Property_ID` ASC) VISIBLE,
  INDEX `fk_Item_Property_NonPizza1_idx` (`NonPizza_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Item_Property_Ingredient1`
    FOREIGN KEY (`Ingredient_ID`)
    REFERENCES `marios_pizza`.`ingredient` (`ID`),
  CONSTRAINT `fk_Item_Property_NonPizza1`
    FOREIGN KEY (`NonPizza_ID`)
    REFERENCES `marios_pizza`.`nonpizza` (`ID`),
  CONSTRAINT `fk_Item_Property_PizzaBottom1`
    FOREIGN KEY (`PizzaBottom_ID`)
    REFERENCES `marios_pizza`.`pizzabottom` (`ID`),
  CONSTRAINT `fk_Item_Property_Property1`
    FOREIGN KEY (`Property_ID`)
    REFERENCES `marios_pizza`.`property` (`ID`),
  CONSTRAINT `fk_Item_Property_Sauce1`
    FOREIGN KEY (`Sauce_ID`)
    REFERENCES `marios_pizza`.`sauce` (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `marios_pizza`.`order`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `marios_pizza`.`order` ;

CREATE TABLE IF NOT EXISTS `marios_pizza`.`order` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `OrderStatus` TINYINT NOT NULL,
  `DeliveryPlan` DATETIME NOT NULL,
  `DeliveryTime` DATETIME NULL DEFAULT NULL,
  `DeliveryPrice` DECIMAL(7,3) NULL DEFAULT NULL,
  `Customer_Id` INT NOT NULL,
  `DeliveryType_ID` INT NOT NULL,
  `Shop_ID` INT NOT NULL,
  `OrderDate` TIMESTAMP NOT NULL,
  `TotalOrderPrice` DECIMAL(7,3) NULL DEFAULT NULL,
  `CreatedOn` DATETIME NOT NULL,
  `CreatedBy` VARCHAR(45) NOT NULL,
  `LastUpdate` DATETIME NOT NULL,
  `UpdateBy` VARCHAR(45) NOT NULL,
  `Deleted` TINYINT NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`, `Customer_Id`, `DeliveryType_ID`, `Shop_ID`),
  INDEX `fk_Order_Customer_idx` (`Customer_Id` ASC) VISIBLE,
  INDEX `fk_Order_DeliveryType1_idx` (`DeliveryType_ID` ASC) VISIBLE,
  INDEX `fk_Order_Shop1_idx` (`Shop_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Order_Customer`
    FOREIGN KEY (`Customer_Id`)
    REFERENCES `marios_pizza`.`customer` (`ID`),
  CONSTRAINT `fk_Order_DeliveryType`
    FOREIGN KEY (`DeliveryType_ID`)
    REFERENCES `marios_pizza`.`deliverytype` (`ID`),
  CONSTRAINT `fk_Order_Shop`
    FOREIGN KEY (`Shop_ID`)
    REFERENCES `marios_pizza`.`shop` (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `marios_pizza`.`order_coupon`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `marios_pizza`.`order_coupon` ;

CREATE TABLE IF NOT EXISTS `marios_pizza`.`order_coupon` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Order_ID` INT NOT NULL,
  `Coupon_ID` INT NOT NULL,
  `CreatedOn` DATETIME NOT NULL,
  `CreatedBy` VARCHAR(45) NOT NULL,
  `LastUpdate` DATETIME NOT NULL,
  `UpdateBy` VARCHAR(45) NOT NULL,
  `Deleted` TINYINT NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`, `Coupon_ID`),
  INDEX `fk_Order_Coupon_Coupon1_idx` (`Coupon_ID` ASC) VISIBLE,
  INDEX `fk_Order_Coupon_Order1_idx` (`Order_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Order_Coupon_Coupon1`
    FOREIGN KEY (`Coupon_ID`)
    REFERENCES `marios_pizza`.`coupon` (`ID`),
  CONSTRAINT `fk_Order_Coupon_Order1`
    FOREIGN KEY (`Order_ID`)
    REFERENCES `marios_pizza`.`order` (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `marios_pizza`.`pizza`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `marios_pizza`.`pizza` ;

CREATE TABLE IF NOT EXISTS `marios_pizza`.`pizza` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Sauce_ID` INT NOT NULL,
  `PizzaBottom_ID` INT NOT NULL,
  `IsCustom` TINYINT NOT NULL DEFAULT '0' COMMENT 'Standaard GEEN custom pizza',
  `SubCategory_ID` INT NOT NULL,
  `Active` TINYINT NOT NULL DEFAULT '0',
  `Description` VARCHAR(255) NOT NULL,
  `Price` DECIMAL(7,3) NOT NULL,
  `CreatedOn` DATETIME NOT NULL,
  `CreatedBy` VARCHAR(45) NOT NULL,
  `LastUpdate` DATETIME NOT NULL,
  `UpdateBy` VARCHAR(45) NOT NULL,
  `Deleted` TINYINT NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `Name_UNIQUE` (`Name` ASC) VISIBLE,
  INDEX `fk_Pizza_Sauce1_idx` (`Sauce_ID` ASC) VISIBLE,
  INDEX `fk_Pizza_PizzaBottom1_idx` (`PizzaBottom_ID` ASC) VISIBLE,
  INDEX `fk_Pizza_SubCategory1_idx` (`SubCategory_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Pizza_PizzaBottom1`
    FOREIGN KEY (`PizzaBottom_ID`)
    REFERENCES `marios_pizza`.`pizzabottom` (`ID`),
  CONSTRAINT `fk_Pizza_Sauce1`
    FOREIGN KEY (`Sauce_ID`)
    REFERENCES `marios_pizza`.`sauce` (`ID`),
  CONSTRAINT `fk_Pizza_SubCategory1`
    FOREIGN KEY (`SubCategory_ID`)
    REFERENCES `marios_pizza`.`subcategory` (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `marios_pizza`.`orderitem`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `marios_pizza`.`orderitem` ;

CREATE TABLE IF NOT EXISTS `marios_pizza`.`orderitem` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `OrderID` INT NOT NULL,
  `Pizza_ID` INT NULL DEFAULT NULL,
  `PizzaBottom_ID` INT NULL DEFAULT NULL,
  `NonPizza_ID` INT NULL DEFAULT NULL,
  `OrderName` VARCHAR(45) NOT NULL,
  `Amount` INT NOT NULL,
  `TotalPrice` DECIMAL(7,3) NOT NULL,
  `Tax` DECIMAL(7,3) NOT NULL,
  `CreatedOn` DATETIME NOT NULL,
  `CreatedBy` VARCHAR(45) NOT NULL,
  `LastUpdate` DATETIME NOT NULL,
  `UpdateBy` VARCHAR(45) NOT NULL,
  `Deleted` TINYINT NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`, `OrderID`),
  INDEX `fk_Order_id` (`OrderID` ASC) INVISIBLE,
  INDEX `fk_OrderItem_NonPizza1_idx` (`NonPizza_ID` ASC) VISIBLE,
  INDEX `fk_OrderItem_Pizza1_idx` (`Pizza_ID` ASC) VISIBLE,
  CONSTRAINT `fk_OrderItem_NonPizza1`
    FOREIGN KEY (`NonPizza_ID`)
    REFERENCES `marios_pizza`.`nonpizza` (`ID`),
  CONSTRAINT `fk_OrderItem_Order1`
    FOREIGN KEY (`OrderID`)
    REFERENCES `marios_pizza`.`order` (`ID`),
  CONSTRAINT `fk_OrderItem_Pizza1`
    FOREIGN KEY (`Pizza_ID`)
    REFERENCES `marios_pizza`.`pizza` (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3
KEY_BLOCK_SIZE = 16;


-- -----------------------------------------------------
-- Table `marios_pizza`.`pizza_ingredient`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `marios_pizza`.`pizza_ingredient` ;

CREATE TABLE IF NOT EXISTS `marios_pizza`.`pizza_ingredient` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Pizza_ID` INT NULL DEFAULT NULL,
  `Ingredient_ID` INT NULL DEFAULT NULL,
  `Price` DECIMAL(7,3) NULL DEFAULT NULL,
  `CreatedOn` DATETIME NOT NULL,
  `CreatedBy` VARCHAR(45) NOT NULL,
  `LastUpdate` DATETIME NOT NULL,
  `UpdateBy` VARCHAR(45) NOT NULL,
  `Deleted` TINYINT NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  INDEX `fk_Pizza_Ingredient_Ingredient1_idx` (`Ingredient_ID` ASC) VISIBLE,
  INDEX `fk_Pizza_Ingredient_Pizza1_idx` (`Pizza_ID` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `marios_pizza`.`street`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `marios_pizza`.`street` ;

CREATE TABLE IF NOT EXISTS `marios_pizza`.`street` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(75) NOT NULL,
  `City_ID` INT NOT NULL,
  `CreatedOn` DATETIME NOT NULL,
  `CreatedBy` VARCHAR(45) NOT NULL,
  `LastUpdate` DATETIME NOT NULL,
  `UpdateBy` VARCHAR(45) NOT NULL,
  `Deleted` TINYINT NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`, `City_ID`),
  INDEX `fk_StreetName_City1_idx` (`City_ID` ASC) VISIBLE,
  INDEX `index_StreetName` (`Name` ASC) VISIBLE,
  CONSTRAINT `fk_StreetName_City1`
    FOREIGN KEY (`City_ID`)
    REFERENCES `marios_pizza`.`city` (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `marios_pizza`.`servicearea`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `marios_pizza`.`servicearea` ;

CREATE TABLE IF NOT EXISTS `marios_pizza`.`servicearea` (
  `ID` INT NOT NULL,
  `Zipcode` VARCHAR(6) NOT NULL,
  `BreakpointStart` VARCHAR(6) NOT NULL,
  `BreakpointEnd` VARCHAR(6) NOT NULL,
  `Street_ID` INT NOT NULL,
  `Shop_ID` INT NULL DEFAULT NULL,
  `CreatedOn` DATETIME NOT NULL,
  `CreatedBy` VARCHAR(45) NOT NULL,
  `LastUpdate` DATETIME NOT NULL,
  `UpdateBy` VARCHAR(45) NOT NULL,
  `Deleted` TINYINT NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`, `Street_ID`),
  INDEX `fk_ZipCode_Shop1_idx` (`Shop_ID` ASC) VISIBLE,
  INDEX `fk_ZipCode_StreetName1_idx` (`Street_ID` ASC) VISIBLE,
  INDEX `index_Zipcode` (`Zipcode` ASC) VISIBLE,
  CONSTRAINT `fk_ZipCode_Shop1`
    FOREIGN KEY (`Shop_ID`)
    REFERENCES `marios_pizza`.`shop` (`ID`),
  CONSTRAINT `fk_ZipCode_StreetName1`
    FOREIGN KEY (`Street_ID`)
    REFERENCES `marios_pizza`.`street` (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `marios_pizza`.`wrong_order_data`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `marios_pizza`.`wrong_order_data` ;

CREATE TABLE IF NOT EXISTS `marios_pizza`.`wrong_order_data` (
  `ID` BIGINT NULL DEFAULT NULL,
  `WinkelID` DOUBLE NULL DEFAULT NULL,
  `Winkelnaam` TEXT NULL DEFAULT NULL,
  `CustomerID` DOUBLE NULL DEFAULT NULL,
  `Klantnaam` TEXT NULL DEFAULT NULL,
  `TelefoonNr` TEXT NULL DEFAULT NULL,
  `Email` TEXT NULL DEFAULT NULL,
  `AddressID` DOUBLE NULL DEFAULT NULL,
  `Adres` TEXT NULL DEFAULT NULL,
  `Woonplaats` TEXT NULL DEFAULT NULL,
  `OrderID` DOUBLE NULL DEFAULT NULL,
  `Besteldatum` TEXT NULL DEFAULT NULL,
  `DeliveryTypeID` DOUBLE NULL DEFAULT NULL,
  `AfleverType` TEXT NULL DEFAULT NULL,
  `AfleverDatum` TEXT NULL DEFAULT NULL,
  `AfleverMoment` TEXT NULL DEFAULT NULL,
  `ProductID` DOUBLE NULL DEFAULT NULL,
  `NonProductID` DOUBLE NULL DEFAULT NULL,
  `Product` TEXT NULL DEFAULT NULL,
  `PizzaBodemID` DOUBLE NULL DEFAULT NULL,
  `PizzaBodem` TEXT NULL DEFAULT NULL,
  `PizzaSausID` DOUBLE NULL DEFAULT NULL,
  `PizzaSaus` TEXT NULL DEFAULT NULL,
  `Prijs` DOUBLE NULL DEFAULT NULL,
  `Bezorgkosten` DOUBLE NULL DEFAULT NULL,
  `BezorgkostenDecimal` DOUBLE NULL DEFAULT NULL,
  `Aantal` BIGINT NULL DEFAULT NULL,
  `Extra Ingrediënten` TEXT NULL DEFAULT NULL,
  `Prijs Extra Ingrediënten` DOUBLE NULL DEFAULT NULL,
  `Regelprijs` DOUBLE NULL DEFAULT NULL,
  `RegelprijsDecimal` DOUBLE NULL DEFAULT NULL,
  `Totaalprijs` TEXT NULL DEFAULT NULL,
  `TotaalprijsDecimal` DOUBLE NULL DEFAULT NULL,
  `CouponID` DOUBLE NULL DEFAULT NULL,
  `Gebruikte Coupon` TEXT NULL DEFAULT NULL,
  `Coupon Korting` DOUBLE NULL DEFAULT NULL,
  `Te Betalen` DOUBLE NULL DEFAULT NULL,
  `TeBetalenDecimal` DOUBLE NULL DEFAULT NULL,
  `ErrorDetails` DOUBLE NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
