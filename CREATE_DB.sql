CREATE DATABASE  IF NOT EXISTS `marios_pizza` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `marios_pizza`;
-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: marios_pizza
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `addressinfo`
--

DROP TABLE IF EXISTS `addressinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addressinfo` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `HouseNumber` varchar(10) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `Zipcode` varchar(6) DEFAULT NULL,
  `City` varchar(45) NOT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedBy` varchar(45) NOT NULL,
  `LastUpdate` datetime NOT NULL,
  `UpdateBy` varchar(45) NOT NULL,
  `Deleted` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `AddressInfoID_UNIQUE` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=92060 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Description` varchar(255) NOT NULL,
  `Active` tinyint NOT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedBy` varchar(45) NOT NULL,
  `LastUpdate` datetime NOT NULL,
  `UpdateBy` varchar(45) NOT NULL,
  `Deleted` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Name_UNIQUE` (`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Municipality_ID` int NOT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedBy` varchar(45) NOT NULL,
  `LastUpdate` datetime NOT NULL,
  `UpdateBy` varchar(45) NOT NULL,
  `Deleted` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`Municipality_ID`),
  KEY `fk_City_Municipality1_idx` (`Municipality_ID`),
  KEY `index_CityName` (`Name`),
  CONSTRAINT `fk_City_Municipality1` FOREIGN KEY (`Municipality_ID`) REFERENCES `municipality` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2451 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coupon`
--

DROP TABLE IF EXISTS `coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupon` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Code` varchar(45) NOT NULL,
  `DiscountPercentage` decimal(7,3) DEFAULT NULL,
  `Discountprice` int DEFAULT NULL,
  `CouponFormula` varchar(500) DEFAULT NULL,
  `Description` varchar(255) NOT NULL,
  `Active` tinyint NOT NULL,
  `StartDate` datetime NOT NULL,
  `EndDate` datetime DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedBy` varchar(45) NOT NULL,
  `LastUpdate` datetime NOT NULL,
  `UpdateBy` varchar(45) NOT NULL,
  `Deleted` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Description_UNIQUE` (`Description`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Birthdate` date DEFAULT NULL,
  `Email` varchar(255) NOT NULL,
  `Phone1` varchar(12) NOT NULL,
  `Phone2` varchar(12) DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedBy` varchar(45) NOT NULL,
  `LastUpdate` datetime NOT NULL,
  `UpdateBy` varchar(45) NOT NULL,
  `Deleted` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CustomerID_UNIQUE` (`ID`),
  UNIQUE KEY `Email_UNIQUE` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=26573 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_addressinfo`
--

DROP TABLE IF EXISTS `customer_addressinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_addressinfo` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Customer_ID` int NOT NULL,
  `AddressInfo_ID` int NOT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedBy` varchar(45) NOT NULL,
  `LastUpdate` datetime NOT NULL,
  `UpdateBy` varchar(45) NOT NULL,
  `Deleted` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`Customer_ID`,`AddressInfo_ID`),
  KEY `fk_Customer_Addressinfo_Customer1_idx` (`Customer_ID`),
  KEY `fk_Customer_Addressinfo_AddressInfo1_idx` (`AddressInfo_ID`),
  CONSTRAINT `fk_Customer_Addressinfo_AddressInfo1` FOREIGN KEY (`AddressInfo_ID`) REFERENCES `addressinfo` (`ID`),
  CONSTRAINT `fk_Customer_Addressinfo_Customer1` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=26590 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deliverytype`
--

DROP TABLE IF EXISTS `deliverytype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deliverytype` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Type` varchar(45) NOT NULL,
  `Active` tinyint NOT NULL DEFAULT '0',
  `CreatedOn` datetime NOT NULL,
  `CreatedBy` varchar(45) NOT NULL,
  `LastUpdate` datetime NOT NULL,
  `UpdateBy` varchar(45) NOT NULL,
  `Deleted` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Type_UNIQUE` (`Type`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `differentopeningtime`
--

DROP TABLE IF EXISTS `differentopeningtime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `differentopeningtime` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Date` date NOT NULL,
  `Open` time NOT NULL,
  `Close` time NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Shop_ID` int NOT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedBy` varchar(45) NOT NULL,
  `LastUpdate` datetime NOT NULL,
  `UpdateBy` varchar(45) NOT NULL,
  `Deleted` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`Shop_ID`),
  KEY `fk_DiffOpeningTime_Shop1_idx` (`Shop_ID`),
  CONSTRAINT `fk_DiffOpeningTime_Shop1` FOREIGN KEY (`Shop_ID`) REFERENCES `shop` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ingredient`
--

DROP TABLE IF EXISTS `ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredient` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Price` decimal(7,3) DEFAULT NULL,
  `Active` tinyint NOT NULL DEFAULT '0',
  `Tax_ID` int NOT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedBy` varchar(45) NOT NULL,
  `LastUpdate` datetime NOT NULL,
  `UpdateBy` varchar(45) NOT NULL,
  `Deleted` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`Tax_ID`),
  KEY `fk_Ingredients_Tax1_idx` (`Tax_ID`),
  CONSTRAINT `fk_Ingredients_Tax1` FOREIGN KEY (`Tax_ID`) REFERENCES `tax` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `item_property`
--

DROP TABLE IF EXISTS `item_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_property` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `PizzaBottom_ID` int DEFAULT NULL,
  `Sauce_ID` int DEFAULT NULL,
  `Ingredient_ID` int DEFAULT NULL,
  `NonPizza_ID` int DEFAULT NULL,
  `Property_ID` int NOT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedBy` varchar(45) NOT NULL,
  `LastUpdate` datetime NOT NULL,
  `UpdateBy` varchar(45) NOT NULL,
  `Deleted` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`Property_ID`),
  KEY `fk_Item_Property_PizzaBottom1_idx` (`PizzaBottom_ID`),
  KEY `fk_Item_Property_Sauce1_idx` (`Sauce_ID`),
  KEY `fk_Item_Property_Ingredient1_idx` (`Ingredient_ID`),
  KEY `fk_Item_Property_Property1_idx` (`Property_ID`),
  KEY `fk_Item_Property_NonPizza1_idx` (`NonPizza_ID`),
  CONSTRAINT `fk_Item_Property_Ingredient1` FOREIGN KEY (`Ingredient_ID`) REFERENCES `ingredient` (`ID`),
  CONSTRAINT `fk_Item_Property_NonPizza1` FOREIGN KEY (`NonPizza_ID`) REFERENCES `nonpizza` (`ID`),
  CONSTRAINT `fk_Item_Property_PizzaBottom1` FOREIGN KEY (`PizzaBottom_ID`) REFERENCES `pizzabottom` (`ID`),
  CONSTRAINT `fk_Item_Property_Property1` FOREIGN KEY (`Property_ID`) REFERENCES `property` (`ID`),
  CONSTRAINT `fk_Item_Property_Sauce1` FOREIGN KEY (`Sauce_ID`) REFERENCES `sauce` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `marioorderdata01`
--

DROP TABLE IF EXISTS `marioorderdata01`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marioorderdata01` (
  `ID` bigint DEFAULT NULL,
  `WinkelID` double DEFAULT NULL,
  `Winkelnaam` text,
  `CustomerID` double DEFAULT NULL,
  `Klantnaam` text,
  `TelefoonNr` text,
  `Email` text,
  `AddressID` double DEFAULT NULL,
  `Adres` text,
  `Woonplaats` text,
  `OrderID` double DEFAULT NULL,
  `Besteldatum` text,
  `DeliveryTypeID` double DEFAULT NULL,
  `AfleverType` text,
  `AfleverDatum` text,
  `AfleverMoment` text,
  `ProductID` double DEFAULT NULL,
  `NonProductID` double DEFAULT NULL,
  `Product` text,
  `PizzaBodemID` double DEFAULT NULL,
  `PizzaBodem` text,
  `PizzaSausID` double DEFAULT NULL,
  `PizzaSaus` text,
  `Prijs` double DEFAULT NULL,
  `Bezorgkosten` double DEFAULT NULL,
  `BezorgkostenDecimal` double DEFAULT NULL,
  `Aantal` bigint DEFAULT NULL,
  `Extra Ingrediënten` text,
  `Prijs Extra Ingrediënten` double DEFAULT NULL,
  `Regelprijs` double DEFAULT NULL,
  `RegelprijsDecimal` double DEFAULT NULL,
  `Totaalprijs` text,
  `TotaalprijsDecimal` double DEFAULT NULL,
  `CouponID` double DEFAULT NULL,
  `Gebruikte Coupon` text,
  `Coupon Korting` double DEFAULT NULL,
  `Te Betalen` double DEFAULT NULL,
  `TeBetalenDecimal` double DEFAULT NULL,
  `ErrorDetails` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mariooverigeproducten`
--

DROP TABLE IF EXISTS `mariooverigeproducten`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mariooverigeproducten` (
  `ID` bigint DEFAULT NULL,
  `categorie` text,
  `categorieUnique` text,
  `categorieID` double DEFAULT NULL,
  `subcategorie` text,
  `subcategorieUnique` text,
  `subcategorieID` double DEFAULT NULL,
  `productnaam` text,
  `productnaamUnique` text,
  `productnaamID` double DEFAULT NULL,
  `productomschrijving` text,
  `productomschrijvingFiltered` text,
  `prijs` double DEFAULT NULL,
  `prijsDecimal` double DEFAULT NULL,
  `spicy` text,
  `spicyTrueFalse` bigint DEFAULT NULL,
  `vegetarisch` text,
  `vegetarischTrueFalse` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mariopizza_bottoms`
--

DROP TABLE IF EXISTS `mariopizza_bottoms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mariopizza_bottoms` (
  `ID` bigint DEFAULT NULL,
  `naam` text,
  `diameter` bigint DEFAULT NULL,
  `Active` bigint DEFAULT NULL,
  `toeslag` bigint DEFAULT NULL,
  `Tax_ID` bigint DEFAULT NULL,
  `PizzaBottomType_ID` bigint DEFAULT NULL,
  `omschrijving` text,
  `Available` bigint DEFAULT NULL,
  `beschikbaar` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mariopizza_ingredienten`
--

DROP TABLE IF EXISTS `mariopizza_ingredienten`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mariopizza_ingredienten` (
  `ID` bigint DEFAULT NULL,
  `categorie` text,
  `categorieUnique` text,
  `categorieID` bigint DEFAULT NULL,
  `subcategorie` text,
  `subcategorieUnique` text,
  `subcategorieID` bigint DEFAULT NULL,
  `productnaam` text,
  `productnaamUnique` text,
  `productnaamID` bigint DEFAULT NULL,
  `productomschrijving` text,
  `productomschrijvingFiltered` text,
  `prijs` double DEFAULT NULL,
  `prijsDecimal` double DEFAULT NULL,
  `bezorgtoeslag` bigint DEFAULT NULL,
  `bezorgtoeslagDecimal` double DEFAULT NULL,
  `spicy` text,
  `spicyTrueFalse` bigint DEFAULT NULL,
  `vegetarisch` text,
  `vegetarischTrueFalse` bigint DEFAULT NULL,
  `beschikbaar` text,
  `beschikbaarTrueFalse` bigint DEFAULT NULL,
  `aantalkeer_ingredient` bigint DEFAULT NULL,
  `ingredientnaam` text,
  `ingredientnaamID` bigint DEFAULT NULL,
  `pizzasaus_standaard` text,
  `pizzasausID` text,
  `ErrorDetails` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `municipality`
--

DROP TABLE IF EXISTS `municipality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `municipality` (
  `ID` int NOT NULL,
  `Name` varchar(45) NOT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedBy` varchar(45) NOT NULL,
  `LastUpdate` datetime NOT NULL,
  `UpdateBy` varchar(45) NOT NULL,
  `Deleted` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `index_MunName` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nonpizza`
--

DROP TABLE IF EXISTS `nonpizza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nonpizza` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Active` tinyint NOT NULL,
  `Tax_ID` int NOT NULL,
  `SubCategory_ID` int NOT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedBy` varchar(45) NOT NULL,
  `LastUpdate` datetime NOT NULL,
  `UpdateBy` varchar(45) NOT NULL,
  `Deleted` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`SubCategory_ID`,`Tax_ID`),
  KEY `fk_NonPizza_Tax1_idx` (`Tax_ID`),
  KEY `fk_NonPizza_SubCategory1_idx` (`SubCategory_ID`),
  CONSTRAINT `fk_NonPizza_SubCategory1` FOREIGN KEY (`SubCategory_ID`) REFERENCES `subcategory` (`ID`),
  CONSTRAINT `fk_NonPizza_Tax1` FOREIGN KEY (`Tax_ID`) REFERENCES `tax` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `openingtime`
--

DROP TABLE IF EXISTS `openingtime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `openingtime` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `MonOpen` time DEFAULT NULL,
  `MonClosed` time DEFAULT NULL,
  `TueOpen` time DEFAULT NULL,
  `TueClosed` time DEFAULT NULL,
  `WedOpen` time DEFAULT NULL,
  `WedClosed` time DEFAULT NULL,
  `ThuOpen` time DEFAULT NULL,
  `ThueClosed` time DEFAULT NULL,
  `FriOpen` time DEFAULT NULL,
  `FriClosed` time DEFAULT NULL,
  `SatOpen` time DEFAULT NULL,
  `SatClosed` time DEFAULT NULL,
  `SunOpen` time DEFAULT NULL,
  `SunClosed` time DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedBy` varchar(45) NOT NULL,
  `LastUpdate` datetime NOT NULL,
  `UpdateBy` varchar(45) NOT NULL,
  `Deleted` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `OrderStatus` tinyint NOT NULL,
  `DeliveryPlan` datetime NOT NULL,
  `DeliveryTime` datetime DEFAULT NULL,
  `DeliveryPrice` decimal(7,3) DEFAULT NULL,
  `Customer_Id` int NOT NULL,
  `DeliveryType_ID` int NOT NULL,
  `Shop_ID` int NOT NULL,
  `OrderDate` timestamp NOT NULL,
  `TotalOrderPrice` decimal(7,3) DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedBy` varchar(45) NOT NULL,
  `LastUpdate` datetime NOT NULL,
  `UpdateBy` varchar(45) NOT NULL,
  `Deleted` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`Customer_Id`,`DeliveryType_ID`,`Shop_ID`),
  KEY `fk_Order_Customer_idx` (`Customer_Id`),
  KEY `fk_Order_DeliveryType1_idx` (`DeliveryType_ID`),
  KEY `fk_Order_Shop1_idx` (`Shop_ID`),
  CONSTRAINT `fk_Order_Customer` FOREIGN KEY (`Customer_Id`) REFERENCES `customer` (`ID`),
  CONSTRAINT `fk_Order_DeliveryType` FOREIGN KEY (`DeliveryType_ID`) REFERENCES `deliverytype` (`ID`),
  CONSTRAINT `fk_Order_Shop` FOREIGN KEY (`Shop_ID`) REFERENCES `shop` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=39998 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_coupon`
--

DROP TABLE IF EXISTS `order_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_coupon` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Order_ID` int NOT NULL,
  `Coupon_ID` int NOT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedBy` varchar(45) NOT NULL,
  `LastUpdate` datetime NOT NULL,
  `UpdateBy` varchar(45) NOT NULL,
  `Deleted` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`Coupon_ID`),
  KEY `fk_Order_Coupon_Coupon1_idx` (`Coupon_ID`),
  KEY `fk_Order_Coupon_Order1_idx` (`Order_ID`),
  CONSTRAINT `fk_Order_Coupon_Coupon1` FOREIGN KEY (`Coupon_ID`) REFERENCES `coupon` (`ID`),
  CONSTRAINT `fk_Order_Coupon_Order1` FOREIGN KEY (`Order_ID`) REFERENCES `order` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orderitem`
--

DROP TABLE IF EXISTS `orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderitem` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `OrderID` int NOT NULL,
  `Pizza_ID` int DEFAULT NULL,
  `PizzaBottom_ID` int DEFAULT NULL,
  `NonPizza_ID` int DEFAULT NULL,
  `OrderName` varchar(45) NOT NULL,
  `Amount` int NOT NULL,
  `TotalPrice` decimal(7,3) NOT NULL,
  `Tax` decimal(7,3) NOT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedBy` varchar(45) NOT NULL,
  `LastUpdate` datetime NOT NULL,
  `UpdateBy` varchar(45) NOT NULL,
  `Deleted` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`OrderID`),
  KEY `fk_Order_id` (`OrderID`) /*!80000 INVISIBLE */,
  KEY `fk_OrderItem_NonPizza1_idx` (`NonPizza_ID`),
  KEY `fk_OrderItem_Pizza1_idx` (`Pizza_ID`),
  CONSTRAINT `fk_OrderItem_NonPizza1` FOREIGN KEY (`NonPizza_ID`) REFERENCES `nonpizza` (`ID`),
  CONSTRAINT `fk_OrderItem_Order1` FOREIGN KEY (`OrderID`) REFERENCES `order` (`ID`),
  CONSTRAINT `fk_OrderItem_Pizza1` FOREIGN KEY (`Pizza_ID`) REFERENCES `pizza` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=128588 DEFAULT CHARSET=utf8mb3 KEY_BLOCK_SIZE=16;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pizza`
--

DROP TABLE IF EXISTS `pizza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pizza` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Sauce_ID` int NOT NULL,
  `PizzaBottom_ID` int NOT NULL,
  `IsCustom` tinyint NOT NULL DEFAULT '0' COMMENT 'Standaard GEEN custom pizza',
  `SubCategory_ID` int NOT NULL,
  `Active` tinyint NOT NULL DEFAULT '0',
  `Description` varchar(255) NOT NULL,
  `Price` decimal(7,3) NOT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedBy` varchar(45) NOT NULL,
  `LastUpdate` datetime NOT NULL,
  `UpdateBy` varchar(45) NOT NULL,
  `Deleted` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Name_UNIQUE` (`Name`),
  KEY `fk_Pizza_Sauce1_idx` (`Sauce_ID`),
  KEY `fk_Pizza_PizzaBottom1_idx` (`PizzaBottom_ID`),
  KEY `fk_Pizza_SubCategory1_idx` (`SubCategory_ID`),
  CONSTRAINT `fk_Pizza_PizzaBottom1` FOREIGN KEY (`PizzaBottom_ID`) REFERENCES `pizzabottom` (`ID`),
  CONSTRAINT `fk_Pizza_Sauce1` FOREIGN KEY (`Sauce_ID`) REFERENCES `sauce` (`ID`),
  CONSTRAINT `fk_Pizza_SubCategory1` FOREIGN KEY (`SubCategory_ID`) REFERENCES `subcategory` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pizza_ingredient`
--

DROP TABLE IF EXISTS `pizza_ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pizza_ingredient` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Pizza_ID` int DEFAULT NULL,
  `Ingredient_ID` int DEFAULT NULL,
  `Price` decimal(7,3) DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedBy` varchar(45) NOT NULL,
  `LastUpdate` datetime NOT NULL,
  `UpdateBy` varchar(45) NOT NULL,
  `Deleted` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `fk_Pizza_Ingredient_Ingredient1_idx` (`Ingredient_ID`),
  KEY `fk_Pizza_Ingredient_Pizza1_idx` (`Pizza_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=240 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pizzabottom`
--

DROP TABLE IF EXISTS `pizzabottom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pizzabottom` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Size` varchar(45) NOT NULL,
  `Active` tinyint NOT NULL,
  `Price` decimal(4,3) DEFAULT NULL,
  `Tax_ID` int NOT NULL,
  `PizzaBottomType_ID` int NOT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedBy` varchar(45) NOT NULL,
  `LastUpdate` datetime NOT NULL,
  `UpdateBy` varchar(45) NOT NULL,
  `Deleted` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`Tax_ID`,`PizzaBottomType_ID`),
  UNIQUE KEY `Name_UNIQUE` (`Name`),
  KEY `fk_PizzaBottom_Tax1_idx` (`Tax_ID`),
  KEY `fk_PizzaBottom_PizzaBottomType1_idx` (`PizzaBottomType_ID`),
  CONSTRAINT `fk_PizzaBottom_PizzaBottomType1` FOREIGN KEY (`PizzaBottomType_ID`) REFERENCES `pizzabottomtype` (`ID`),
  CONSTRAINT `fk_PizzaBottom_Tax1` FOREIGN KEY (`Tax_ID`) REFERENCES `tax` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pizzabottomtype`
--

DROP TABLE IF EXISTS `pizzabottomtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pizzabottomtype` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Active` tinyint DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedBy` varchar(45) NOT NULL,
  `LastUpdate` datetime NOT NULL,
  `UpdateBy` varchar(45) NOT NULL,
  `Deleted` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Name_UNIQUE` (`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `property`
--

DROP TABLE IF EXISTS `property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `property` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedBy` varchar(45) NOT NULL,
  `LastUpdate` datetime NOT NULL,
  `UpdateBy` varchar(45) NOT NULL,
  `Deleted` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sauce`
--

DROP TABLE IF EXISTS `sauce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sauce` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Description` varchar(255) NOT NULL,
  `Price` decimal(7,3) DEFAULT NULL,
  `Active` tinyint NOT NULL,
  `Tax_ID` int NOT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedBy` varchar(45) NOT NULL,
  `LastUpdate` datetime NOT NULL,
  `UpdateBy` varchar(45) NOT NULL,
  `Deleted` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`Tax_ID`),
  KEY `fk_Sauce_Tax1_idx` (`Tax_ID`),
  CONSTRAINT `fk_Sauce_Tax1` FOREIGN KEY (`Tax_ID`) REFERENCES `tax` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `servicearea`
--

DROP TABLE IF EXISTS `servicearea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicearea` (
  `ID` int NOT NULL,
  `Zipcode` varchar(6) NOT NULL,
  `BreakpointStart` varchar(6) NOT NULL,
  `BreakpointEnd` varchar(6) NOT NULL,
  `Street_ID` int NOT NULL,
  `Shop_ID` int DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedBy` varchar(45) NOT NULL,
  `LastUpdate` datetime NOT NULL,
  `UpdateBy` varchar(45) NOT NULL,
  `Deleted` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`Street_ID`),
  KEY `fk_ZipCode_Shop1_idx` (`Shop_ID`),
  KEY `fk_ZipCode_StreetName1_idx` (`Street_ID`),
  KEY `index_Zipcode` (`Zipcode`),
  CONSTRAINT `fk_ZipCode_Shop1` FOREIGN KEY (`Shop_ID`) REFERENCES `shop` (`ID`),
  CONSTRAINT `fk_ZipCode_StreetName1` FOREIGN KEY (`Street_ID`) REFERENCES `street` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shop`
--

DROP TABLE IF EXISTS `shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(75) NOT NULL,
  `Phone` varchar(12) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `StreetName` varchar(75) NOT NULL,
  `HouseNumber` varchar(10) NOT NULL,
  `Zipcode` varchar(6) NOT NULL,
  `City` varchar(45) NOT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedBy` varchar(45) NOT NULL,
  `LastUpdate` datetime NOT NULL,
  `UpdateBy` varchar(45) NOT NULL,
  `Deleted` tinyint NOT NULL DEFAULT '0',
  `OpeningTime_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_Shop_OpeningTime1_idx` (`OpeningTime_ID`),
  CONSTRAINT `fk_Shop_OpeningTime1` FOREIGN KEY (`OpeningTime_ID`) REFERENCES `openingtime` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `street`
--

DROP TABLE IF EXISTS `street`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `street` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(75) NOT NULL,
  `City_ID` int NOT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedBy` varchar(45) NOT NULL,
  `LastUpdate` datetime NOT NULL,
  `UpdateBy` varchar(45) NOT NULL,
  `Deleted` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`City_ID`),
  KEY `fk_StreetName_City1_idx` (`City_ID`),
  KEY `index_StreetName` (`Name`),
  CONSTRAINT `fk_StreetName_City1` FOREIGN KEY (`City_ID`) REFERENCES `city` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=117721 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `subcategory`
--

DROP TABLE IF EXISTS `subcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subcategory` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Description` varchar(255) NOT NULL,
  `Active` tinyint NOT NULL DEFAULT '0',
  `Categorie_ID` int NOT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedBy` varchar(45) NOT NULL,
  `LastUpdate` datetime NOT NULL,
  `UpdateBy` varchar(45) NOT NULL,
  `Deleted` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`Categorie_ID`),
  UNIQUE KEY `Name_UNIQUE` (`Name`),
  KEY `fk_SubCategory_Category1_idx` (`Categorie_ID`),
  CONSTRAINT `fk_SubCategory_Category1` FOREIGN KEY (`Categorie_ID`) REFERENCES `category` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tax`
--

DROP TABLE IF EXISTS `tax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tax` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Tax` decimal(7,3) NOT NULL,
  `Description` varchar(255) NOT NULL,
  `CreatedOn` datetime NOT NULL,
  `CreatedBy` varchar(45) NOT NULL,
  `LastUpdate` datetime NOT NULL,
  `UpdateBy` varchar(45) NOT NULL,
  `Deleted` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wrong_order_data`
--

DROP TABLE IF EXISTS `wrong_order_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wrong_order_data` (
  `ID` bigint DEFAULT NULL,
  `WinkelID` double DEFAULT NULL,
  `Winkelnaam` text,
  `CustomerID` double DEFAULT NULL,
  `Klantnaam` text,
  `TelefoonNr` text,
  `Email` text,
  `AddressID` double DEFAULT NULL,
  `Adres` text,
  `Woonplaats` text,
  `OrderID` double DEFAULT NULL,
  `Besteldatum` text,
  `DeliveryTypeID` double DEFAULT NULL,
  `AfleverType` text,
  `AfleverDatum` text,
  `AfleverMoment` text,
  `ProductID` double DEFAULT NULL,
  `NonProductID` double DEFAULT NULL,
  `Product` text,
  `PizzaBodemID` double DEFAULT NULL,
  `PizzaBodem` text,
  `PizzaSausID` double DEFAULT NULL,
  `PizzaSaus` text,
  `Prijs` double DEFAULT NULL,
  `Bezorgkosten` double DEFAULT NULL,
  `BezorgkostenDecimal` double DEFAULT NULL,
  `Aantal` bigint DEFAULT NULL,
  `Extra Ingrediënten` text,
  `Prijs Extra Ingrediënten` double DEFAULT NULL,
  `Regelprijs` double DEFAULT NULL,
  `RegelprijsDecimal` double DEFAULT NULL,
  `Totaalprijs` text,
  `TotaalprijsDecimal` double DEFAULT NULL,
  `CouponID` double DEFAULT NULL,
  `Gebruikte Coupon` text,
  `Coupon Korting` double DEFAULT NULL,
  `Te Betalen` double DEFAULT NULL,
  `TeBetalenDecimal` double DEFAULT NULL,
  `ErrorDetails` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'marios_pizza'
--
/*!50003 DROP FUNCTION IF EXISTS `func_dateTime_to_TimeStamp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `func_dateTime_to_TimeStamp`(
		strDate VARCHAR(30)
        , strTime VARCHAR(30)
) RETURNS datetime
BEGIN
	# Required: SET GLOBAL log_bin_trust_function_creators = 1;
    # Function usage: func_dateTime_to_TimeStamp('maandag 29 juni 2019','11:16')
	DECLARE resultDateTime VARCHAR(255);
    DECLARE strTempDay VARCHAR(10);
    DECLARE strTempVarMonth VARCHAR(15);
    DECLARE strTempYear VARCHAR(4);
    DECLARE strTempTime VARCHAR(8);
    DECLARE tempString VARCHAR(20);
    
    # Input strDate: 			woensdag 5 juni 2019
    # Input strTime: 			20:05
    # Result resultDateTime:	2021-10-10 18:29:54
    
    # Chop off 'day'
    SET tempString = (SELECT SUBSTRING_INDEX(strDate, ' ',-3) );
    
    # Filter daynumber
    SET strTempDay = SUBSTRING_INDEX(SUBSTRING_INDEX(tempString, ' ', 1), ' ', -1);
    
    # Filter monthname
    SET strTempVarMonth = SUBSTRING_INDEX(SUBSTRING_INDEX(tempString, ' ', 2), ' ', -1);
    IF STRCMP(strTempVarMonth, 'Januari') = 0 THEN 
		SET strTempVarMonth = '01';
    ELSEIF STRCMP(strTempVarMonth, 'Februari') = 0 THEN 
		SET strTempVarMonth = '02';
	ELSEIF STRCMP(strTempVarMonth, 'Maart') = 0 THEN 
		SET strTempVarMonth = '03';
	ELSEIF STRCMP(strTempVarMonth, 'April') = 0 THEN 
		SET strTempVarMonth = '04';
	ELSEIF STRCMP(strTempVarMonth, 'Mei') = 0 THEN 
		SET strTempVarMonth = '05';
	ELSEIF STRCMP(strTempVarMonth, 'Juni') = 0 THEN 
		SET strTempVarMonth = '06';
	ELSEIF STRCMP(strTempVarMonth, 'Juli') = 0 THEN 
		SET strTempVarMonth = '07';
	ELSEIF STRCMP(strTempVarMonth, 'Augustus') = 0 THEN 
		SET strTempVarMonth = '08';
	ELSEIF STRCMP(strTempVarMonth, 'September') = 0 THEN 
		SET strTempVarMonth = '09';
	ELSEIF STRCMP(strTempVarMonth, 'Oktober') = 0 THEN 
		SET strTempVarMonth = '10';
	ELSEIF STRCMP(strTempVarMonth, 'November') = 0 THEN 
		SET strTempVarMonth = '11';
	ELSEIF STRCMP(strTempVarMonth, 'December') = 0 THEN 
		SET strTempVarMonth = '12';
	ELSE
		SET strTempVarMonth = strTempVarMonth;
	END IF;
        
    # Filter Year
	SET strTempYear = SUBSTRING_INDEX(tempString, ' ',-1);
    
    # Filter time
    IF (strTime REGEXP '^[[:digit:]]+\\:{0,1}[[:digit:]]*$') = 0 THEN
		SET strTime = '00:00';
    ELSE 
		SET strTime = strTime;
	END IF;
    
    # Putting results together
    SET resultDateTime = (SELECT CONCAT(strTempYear, '-',strTempVarMonth, '-', strTempDay, ' ', strTime, ':00'));
    
    RETURN STR_TO_DATE(resultDateTime, '%Y-%m-%d %H:%i:%s');
    #RETURN LOWER(resultDateTime);
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `func_Strip_non_Digit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `func_Strip_non_Digit`(input VARCHAR(255)) RETURNS varchar(255) CHARSET utf8mb3
BEGIN
   DECLARE output   VARCHAR(255) DEFAULT '';
   DECLARE iterator INT          DEFAULT 1;
   WHILE iterator < (LENGTH(input) + 1) DO
      IF SUBSTRING(input, iterator, 1) IN (',', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9' ) THEN
         SET output = CONCAT(output, SUBSTRING(input, iterator, 1));
      END IF;
      SET iterator = iterator + 1;
   END WHILE;   
   RETURN output;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `func_Strip_non_Digit_return_decimal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `func_Strip_non_Digit_return_decimal`(input VARCHAR(255)) RETURNS decimal(10,0)
BEGIN
# need SET GLOBAL log_bin_trust_function_creators = 1;
   DECLARE output  Decimal(7,3) DEFAULT 0;
   DECLARE temp VARCHAR(255);
   DECLARE iterator INT          DEFAULT 1;
   WHILE iterator < (LENGTH(input) + 1) DO
      IF SUBSTRING(input, iterator, 1) IN (',', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9' ) THEN
         SET temp = CONCAT(output, SUBSTRING(input, iterator, 1));
      END IF;
      SET iterator = iterator + 1;
   END WHILE;   

	SET output = CONVERT(temp, DECIMAL(7,3));
#   RETURN output;
	RETURN output;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `func_temp_dateTime_to_TimeStamp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `func_temp_dateTime_to_TimeStamp`(
		strDate VARCHAR(30)
        , strTime VARCHAR(30)
) RETURNS varchar(255) CHARSET utf8mb3
BEGIN
	# Required: SET GLOBAL log_bin_trust_function_creators = 1;
    # Function usage: func_dateTime_to_TimeStamp('maandag 29 juni 2019','11:16')
	DECLARE resultDateTime VARCHAR(255);
    DECLARE strTempDay VARCHAR(10);
    DECLARE strTempVarMonth VARCHAR(15);
    DECLARE strTempYear VARCHAR(4);
    DECLARE strTempTime VARCHAR(8);
    DECLARE tempString VARCHAR(20);
    
    # Input strDate: 			woensdag 5 juni 2019
    # Input strTime: 			20:05
    # Result resultDateTime:	2021-10-10 18:29:54
    
    # Chop off 'day'
    SET tempString = (SELECT SUBSTRING_INDEX(strDate, ' ',-3) );
    
    # Filter daynumber
    SET strTempDay = SUBSTRING_INDEX(SUBSTRING_INDEX(tempString, ' ', 1), ' ', -1);
    
    # Filter monthname
    SET strTempVarMonth = SUBSTRING_INDEX(SUBSTRING_INDEX(tempString, ' ', 2), ' ', -1);
    IF STRCMP(strTempVarMonth, 'Januari') = 0 THEN 
		SET strTempVarMonth = '01';
    ELSEIF STRCMP(strTempVarMonth, 'Februari') = 0 THEN 
		SET strTempVarMonth = '02';
	ELSEIF STRCMP(strTempVarMonth, 'Maart') = 0 THEN 
		SET strTempVarMonth = '03';
	ELSEIF STRCMP(strTempVarMonth, 'April') = 0 THEN 
		SET strTempVarMonth = '04';
	ELSEIF STRCMP(strTempVarMonth, 'Mei') = 0 THEN 
		SET strTempVarMonth = '05';
	ELSEIF STRCMP(strTempVarMonth, 'Juni') = 0 THEN 
		SET strTempVarMonth = '06';
	ELSEIF STRCMP(strTempVarMonth, 'Juli') = 0 THEN 
		SET strTempVarMonth = '07';
	ELSEIF STRCMP(strTempVarMonth, 'Augustus') = 0 THEN 
		SET strTempVarMonth = '08';
	ELSEIF STRCMP(strTempVarMonth, 'September') = 0 THEN 
		SET strTempVarMonth = '09';
	ELSEIF STRCMP(strTempVarMonth, 'Oktober') = 0 THEN 
		SET strTempVarMonth = '10';
	ELSEIF STRCMP(strTempVarMonth, 'November') = 0 THEN 
		SET strTempVarMonth = '11';
	ELSEIF STRCMP(strTempVarMonth, 'December') = 0 THEN 
		SET strTempVarMonth = '12';
	ELSE
		SET strTempVarMonth = strTempVarMonth;
	END IF;
        
    # Filter Year
	SET strTempYear = SUBSTRING_INDEX(tempString, ' ',-1);
    
    # Putting results together
    SET resultDateTime = (SELECT CONCAT(strTempYear, '-',strTempVarMonth, '-', strTempDay, ' ', strTime, ':00'));
    
    #RETURN STR_TO_DATE(resultDateTime, '%Y-%m-%d %H:%i:%s');
    RETURN LOWER(resultDateTime);
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `uuid_v4` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `uuid_v4`() RETURNS char(36) CHARSET utf8mb3
    NO SQL
BEGIN
    -- Generate 8 2-byte strings that we will combine into a UUIDv4
    SET @h1 = LPAD(HEX(FLOOR(RAND() * 0xffff)), 4, '0');
    SET @h2 = LPAD(HEX(FLOOR(RAND() * 0xffff)), 4, '0');
    SET @h3 = LPAD(HEX(FLOOR(RAND() * 0xffff)), 4, '0');
    SET @h6 = LPAD(HEX(FLOOR(RAND() * 0xffff)), 4, '0');
    SET @h7 = LPAD(HEX(FLOOR(RAND() * 0xffff)), 4, '0');
    SET @h8 = LPAD(HEX(FLOOR(RAND() * 0xffff)), 4, '0');

    -- 4th section will start with a 4 indicating the version
    SET @h4 = CONCAT('4', LPAD(HEX(FLOOR(RAND() * 0x0fff)), 3, '0'));

    -- 5th section first half-byte can only be 8, 9 A or B
    SET @h5 = CONCAT(HEX(FLOOR(RAND() * 4 + 8)),
                LPAD(HEX(FLOOR(RAND() * 0x0fff)), 3, '0'));

    -- Build the complete UUID
    RETURN LOWER(CONCAT(
        @h1, @h2, '-', @h3, '-', @h4, '-', @h5, '-', @h6, @h7, @h8
    ));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ImportZipcodes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ImportZipcodes`(
    IN inZipcode varchar(6),
    IN inBreakpointStart varchar(6),
    IN inBreakpointEnd varchar(6),
    IN inCityName varchar(45),
    IN inStreetName varchar(75),
    IN inMunicipalityId int
)
BEGIN

    SET FOREIGN_KEY_CHECKS = 0;

    /* Check if city exists in DB, if not create */
    SET @city_id = (SELECT id FROM city WHERE Name = inCityName);
    IF (@city_id IS NULL) THEN
        INSERT INTO city (Name, Municipality_ID, CreatedOn, CreatedBy, LastUpdate, UpdateBy)
        VALUE (
               inCityName,
               inmunicipalityId,
               NOW(),
               'System - import',
               NOW(),
               'System - import'
        );

        SELECT last_insert_id() INTO @city_id;
    END IF;

    /* Check if Street exists in DB, if not create */
    SET @street_id = (SELECT id FROM street WHERE Name = inStreetName);
    IF (@street_id IS NULL) THEN
        INSERT INTO street (Name, City_ID, CreatedOn, CreatedBy, LastUpdate, UpdateBy)
        VALUE (
               inStreetName,
               @city_id,
               NOW(),
               'System - import',
               NOW(),
               'System - import'
        );
        SELECT last_insert_id() INTO @street_id;
    END IF;

    /* Check if servicearea exists in DB, if not create */
    SET @servicearea_id = (SELECT id FROM servicearea WHERE Zipcode = inZipcode);
    IF (@servicearea_id IS NULL) THEN
        INSERT INTO servicearea (Zipcode, BreakpointStart, BreakpointEnd, Street_ID, CreatedOn, CreatedBy, LastUpdate, UpdateBy)
        VALUE (
            inZipcode,
            inBreakpointStart,
            inBreakpointEnd,
            @street_id,
            NOW(),
            'System - import',
            NOW(),
            'System - import'
        );
    END IF;

    SET FOREIGN_KEY_CHECKS = 1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_derive_Categories_From_MarioPizzaIngredienten` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_derive_Categories_From_MarioPizzaIngredienten`()
BEGIN
	INSERT IGNORE INTO marios_pizza.category (Name, Description, Active, CreatedOn, CreatedBy, LastUpdate, UpdateBy, Deleted)
SELECT  srcTable.categorie AS Name
		, srcTable.categorieUnique AS Description
		, 1 AS Active
        , CURRENT_TIMESTAMP AS CreatedOn
        , 'System - import' AS CreatedBy
        , CURRENT_TIMESTAMP AS LastUpdate
        , 'System - import' AS UpdateBy
        , 0 AS Deleted
	FROM marios_pizza.mariooverigeproducten as srcTable
    GROUP BY categorie
    ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_derive_Coupons_From_OrderData_And_Insert` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_derive_Coupons_From_OrderData_And_Insert`()
BEGIN
	INSERT IGNORE
INTO marios_pizza.coupon(Code, DiscountPercentage, Discountprice, CouponFormula, Description, Active, StartDate, EndDate, CreatedOn, CreatedBy, LastUpdate, UpdateBy, Deleted)
SELECT uuid_v4() AS Code
	,NULL AS DiscountPercentage
	,NULL AS DiscountPrice
	,NULL AS CouponFormula
	,srcTable.*
FROM (
	SELECT `Gebruikte Coupon` AS Description
		,1 AS Active
		,'2021-10-01 00:00:01' AS StartDate
		,NULL AS EndDate
		,CURRENT_TIMESTAMP AS CreatedOn
		,'System - import' AS CreatedBy
		,CURRENT_TIMESTAMP AS LastUpdate
		,'System - import' AS UpdateBy
		,0 AS Deleted
	FROM marios_pizza.marioorderdata01
	WHERE `Gebruikte Coupon` > '' AND ErrorDetails IS NULL
	GROUP BY `Gebruikte Coupon`
	) AS srcTable
    ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_derive_Customers_from_OrderData` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_derive_Customers_from_OrderData`()
BEGIN
	INSERT IGNORE
	INTO Marios_pizza.customer(Name, Birthdate, Email, Phone1, Phone2, CreatedOn, CreatedBy, LastUpdate, UpdateBy, Deleted)
	SELECT Klantnaam AS Name
		,NULL AS Birthdate
		,Email
		,TelefoonNr AS Phone1
		,NULL AS Phone2
		,CURRENT_TIMESTAMP AS CreatedOn
		,'System - import' AS CreatedBy
		,CURRENT_TIMESTAMP AS LastUpdate
		,'System - import' AS UpdateBy
		,0 AS Deleted
	FROM marios_pizza.marioorderdata01 AS srcTable
    WHERE ErrorDetails IS NULL
    GROUP BY Email
    ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_derive_DeliverType_from_OrderData` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_derive_DeliverType_from_OrderData`()
BEGIN
	INSERT IGNORE INTO marios_pizza.deliverytype (Type, Active, CreatedOn, CreatedBy, LastUpdate, UpdateBy, Deleted)
	SELECT AfleverType	AS Type
					, 1 as Active
					, CURRENT_TIMESTAMP as CreatedOn
					, 'System - import' as CreatedBy
					, CURRENT_TIMESTAMP as LastUpdate
					, 'System - import' as UpdateBy
					, 0 as Deleted
                    FROM marios_pizza.marioorderdata01
                    WHERE ErrorDetails IS NULL
                    GROUP BY AfleverType
    ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_derive_Nonpizza_products_from_mariooverigeproducten` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_derive_Nonpizza_products_from_mariooverigeproducten`()
BEGIN

	INSERT IGNORE INTO marios_pizza.nonpizza (Name, Description, Active, Tax_ID, SubCategory_ID, CreatedOn, CreatedBy, LastUpdate, UpdateBy, Deleted)
	SELECT srcTable.productnaam AS Name
			, srcTable.productomschrijvingFiltered AS Description
            , 1 AS Active
            , 1 AS Tax_ID
            , srcTable.subcategorieID AS SubCategory_ID
            , CURRENT_TIMESTAMP AS CreatedOn
			, 'System - import' AS CreatedBy
			, CURRENT_TIMESTAMP AS LastUpdate
			, 'System - import' AS UpdateBy
			, 0 AS Deleted
    FROM marios_pizza.mariooverigeproducten srcTable
;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_derive_OrderItems_From_OrderData` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_derive_OrderItems_From_OrderData`()
BEGIN
INSERT INTO marios_pizza.orderitem (OrderID, Pizza_ID, PizzaBottom_ID, NonPizza_ID, OrderName, Amount, TotalPrice, Tax, CreatedOn, CreatedBy, LastUpdate, UpdateBy, Deleted)
	SELECT srcTable.OrderID as OrderID
		, srcTable.ProductID as Pizza_ID
        , srcTable.PizzaBodemID as PizzaBottom_ID
        , srcTable.nonProductID as NonPizza_ID
        , srcTable.Product AS OrderName
        , srcTable.Aantal as Amount
        , srcTable.regelprijs as TotalPrice
        , 0 as Tax
		, CURRENT_TIMESTAMP AS CreatedOn
		, 'System - import' AS CreatedBy
		, CURRENT_TIMESTAMP AS LastUpdate
		, 'System - import' AS UpdateBy
		, 0 as Deleted
	FROM marios_pizza.marioorderdata01 AS srcTable
    WHERE srcTable.OrderID IS NOT NULL AND srcTable.ErrorDetails IS NULL
	;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_derive_Orders_From_MarioData` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_derive_Orders_From_MarioData`()
BEGIN
	INSERT INTO marios_pizza.order (OrderStatus, DeliveryPlan, DeliveryTime, DeliveryPrice, Customer_Id, DeliveryType_ID, Shop_ID, OrderDate, TotalOrderPrice, CreatedOn, CreatedBy, LastUpdate, UpdateBy, Deleted)
   SELECT  		CASE	
						WHEN srcTable.AfleverMoment > '' THEN 0
                        WHEN srcTable.AfleverMoment IS NULL OR srcTable.AfleverMoment = ''  THEN 1
					END AS OrderStatus
					, func_dateTime_to_TimeStamp(AfleverDatum,Aflevermoment) AS DeliveryPlan
					, func_dateTime_to_TimeStamp(AfleverDatum,Aflevermoment) AS DeliveryTime
                    , CONVERT(Bezorgkosten, FLOAT) AS DeliveryPrice
                    , CustomerID AS Customer_Id
                    , DeliveryTypeID AS DeliveryType_ID
                    , WinkelID AS Shop_ID
                    , func_dateTime_to_TimeStamp(Besteldatum,'00:00') AS OrderDate
                    , TotaalprijsDecimal AS TotalOrderPrice
					, CURRENT_TIMESTAMP AS CreatedOn
					, 'System - import' AS CreatedBy
					, CURRENT_TIMESTAMP AS LastUpdate
					, 'System - import' AS UpdateBy
					, 0 as Deleted
					FROM marios_pizza.marioorderdata01 srcTable
                    WHERE ErrorDetails IS NULL
					GROUP BY Email, AfleverDatum, Aflevermoment
     ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_derive_PizzaBottomTypes_From_mariopizza_bottoms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_derive_PizzaBottomTypes_From_mariopizza_bottoms`()
BEGIN
	INSERT IGNORE INTO marios_pizza.pizzabottomtype (Name, Description, Active,CreatedOn,CreatedBy,LastUpdate,UpdateBy,Deleted)
SELECT LEFT(srcTable.naam,LOCATE('Pizza',srcTable.naam)-2) AS Name
		, srcTable.omschrijving AS Description
        , 1 AS Active
        , CURRENT_TIMESTAMP AS CreatedOn
		, 'System - import' AS CreatedBy
		, CURRENT_TIMESTAMP AS LastUpdate
		, 'System - import' AS UpdateBy
		, 0 AS Deleted
FROM marios_pizza.mariopizza_bottoms as srcTable
;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_derive_PizzaBottom_From_mariopizzabottoms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_derive_PizzaBottom_From_mariopizzabottoms`()
BEGIN
	INSERT IGNORE INTO marios_pizza.pizzabottom (Name, Size, Active, Price, Tax_ID, PizzaBottomType_ID, CreatedOn, CreatedBy, LastUpdate, UpdateBy, Deleted)
SELECT srcbottomTypeTable.Name AS Name
		, bottomTempTable.diameter AS Size
        , bottomTempTable.Active AS Active
        , bottomTempTable.toeslag AS Price
        , bottomTempTable.Tax_ID AS Tax_ID
        , srcbottomTypeTable.ID AS PizzaBottomType_ID
        , CURRENT_TIMESTAMP AS CreatedOn
        , 'System - import' AS CreatedBy
        , CURRENT_TIMESTAMP AS LastUpdate
        , 'System - import' AS UpdatedBy
        , 0 AS Deleted
FROM marios_pizza.mariopizza_bottoms as bottomTempTable
JOIN marios_pizza.pizzabottomtype as srcbottomTypeTable ON LEFT(bottomTempTable.naam,LOCATE('Pizza',bottomTempTable.naam)-2) = srcbottomTypeTable.Name
;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_derive_PizzaIngredients_From_mariopizza_ingredienten` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_derive_PizzaIngredients_From_mariopizza_ingredienten`()
BEGIN
INSERT IGNORE INTO marios_pizza.pizza_ingredient(Pizza_ID, Ingredient_ID, Price, CreatedOn, CreatedBy, LastUpdate, UpdateBy, Deleted)
SELECT pizzaTable.ID AS Pizza_ID
		, srcTable.ingredientnaamID AS Ingredient_ID
        , srcTable.prijs AS Price
        , CURRENT_TIMESTAMP AS CreatedOn
        , 'System - import' AS CreatedBy
        , CURRENT_TIMESTAMP AS LastUpdate
        , 'System - import' AS UpdateBy
        , 0 AS Deleted
 FROM marios_pizza.mariopizza_ingredienten as srcTable
 JOIN marios_pizza.pizza AS pizzaTable ON srcTable.productnaam = pizzaTable.Name
 WHERE ErrorDetails IS NULL
;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_derive_Pizzas_From_mariopizza_ingredienten` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_derive_Pizzas_From_mariopizza_ingredienten`()
BEGIN
	SET FOREIGN_KEY_CHECKS=0;
INSERT IGNORE INTO marios_pizza.pizza (Name, Sauce_ID, PizzaBottom_ID, IsCustom, SubCategory_ID, Active, Description, Price, CreatedOn, CreatedBy, LastUpdate, UpdateBy, Deleted)
	SELECT destTable.productnaam AS Name
		, destTable.pizzasausID AS Sauce_ID
        , 1 as PizzaBottom_ID
        , 0 AS IsCustom
        , destTable.subcategorieID AS SubCategory_ID
        , 1 AS Active
        , destTable.productomschrijving AS Description
        , destTable.prijs AS Price
        , CURRENT_TIMESTAMP AS CreatedOn
        , 'System - import' AS CreatedBy
        , CURRENT_TIMESTAMP AS LastUpdate
        , 'System - import' AS UpdateBy
        , 0 AS Deleted
 FROM marios_pizza.mariopizza_ingredienten AS destTable
 JOIN marios_pizza.sauce AS sauceTable ON destTable.pizzasaus_standaard = sauceTable.Name
 JOIN marios_pizza.ingredient AS ingredientTable ON destTable.ingredientnaam = ingredientTable.Name
 JOIN marios_pizza.subcategory AS subcatTable ON destTable.subcategorieID = subcatTable.ID
 WHERE destTable.ErrorDetails is NULL
 GROUP BY destTable.Productnaam
 ; 
 
	SET FOREIGN_KEY_CHECKS=1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_derive_SubCategory_From_mariooverigeproducten` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_derive_SubCategory_From_mariooverigeproducten`()
BEGIN
	INSERT IGNORE INTO marios_pizza.subcategory (Name, Description, Active, Categorie_ID, CreatedOn, CreatedBy, LastUpdate, UpdateBy, Deleted)
SELECT  srcTable.subcategorie AS Name
		, srcTable.subcategorieUnique AS Description
		, 1 AS Active
        , srcTable.categorieID AS Categorie_ID
        , CURRENT_TIMESTAMP AS CreatedOn
        , 'System - import' AS CreatedBy
        , CURRENT_TIMESTAMP AS LastUpdate
        , 'System - import' AS UpdateBy
        , 0 AS Deleted
	FROM marios_pizza.mariooverigeproducten as srcTable
    GROUP BY subcategorie
    ;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_derive_SubCategory_From_mariopizza_ingredienten` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_derive_SubCategory_From_mariopizza_ingredienten`()
BEGIN
	INSERT IGNORE INTO marios_pizza.subcategory (Name, Description, Active, Categorie_ID, CreatedOn, CreatedBy, LastUpdate, UpdateBy, Deleted)
SELECT  srcTable.subcategorie AS Name
		, srcTable.subcategorieUnique AS Description
		, 1 AS Active
        , srcTable.categorieID AS Categorie_ID
        , CURRENT_TIMESTAMP AS CreatedOn
        , 'System - import' AS CreatedBy
        , CURRENT_TIMESTAMP AS LastUpdate
        , 'System - import' AS UpdateBy
        , 0 AS Deleted
	FROM marios_pizza.mariopizza_ingredienten as srcTable
    GROUP BY subcategorie
    ;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_Fill_category` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_Fill_category`()
BEGIN
			SET FOREIGN_KEY_CHECKS=0;
	TRUNCATE marios_pizza.category;
	SET FOREIGN_KEY_CHECKS=1;


	INSERT INTO marios_pizza.category (Name, Description, Active, CreatedOn, CreatedBy, LastUpdate, UpdateBy, Deleted)
VALUES ('Specials & Pasta\'s','' , 1, CURRENT_TIMESTAMP, 'System - import', CURRENT_TIMESTAMP, 'System - import', 0)
		,('Drinks & Desserts','' , 1, CURRENT_TIMESTAMP, 'System - import', CURRENT_TIMESTAMP, 'System - import', 0)
		,('Pizza\'s','' , 1, CURRENT_TIMESTAMP, 'System - import', CURRENT_TIMESTAMP, 'System - import', 0)
;

UPDATE marios_pizza.category
SET Description =  REGEXP_REPLACE(Name, '[\]\\[!@#$%.&*`~^_{}:;<>\'/\\|()-]+', '')
;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_Fill_pizza` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_Fill_pizza`()
BEGIN
	SET FOREIGN_KEY_CHECKS=0;
	TRUNCATE marios_pizza.pizza;
	SET FOREIGN_KEY_CHECKS=1;

INSERT INTO marios_pizza.pizza (Name, Sauce_ID, PizzaBottom_ID, IsCustom, SubCategory_ID, Active, Description, Price, CreatedOn, CreatedBy, LastUpdate, UpdateBy, Deleted)
SELECT destTable.productnaam AS Name
		, sauceTable.ID AS Sauce_ID
        , 2 as PizzaBottom_ID
        , 0 AS IsCustom
        , destTable.subcategorie AS SubCategory_ID
        , 1 AS Active
        , destTable.productomschrijving AS Description
        , destTable.prijs AS Price
        , CURRENT_TIMESTAMP AS CreatedOn
        , 'System - import' AS CreatedBy
        , CURRENT_TIMESTAMP AS LastUpdate
        , 'System - import' AS UpdateBy
        , 0 AS Deleted
 FROM marios_pizza.mariopizza_ingredienten AS destTable
 JOIN marios_pizza.sauce AS sauceTable ON destTable.pizzasaus_standaard = sauceTable.Name
 JOIN marios_pizza.ingredient AS ingredientTable ON destTable.ingredientnaam = ingredientTable.Name
 JOIN marios_pizza.subcategory AS subcatTable ON destTable.subcategorie = subcatTable.ID
 GROUP BY destTable.Productnaam
 ; 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_Fill_pizzaBottom` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_Fill_pizzaBottom`()
BEGIN
	SET FOREIGN_KEY_CHECKS=0;
	TRUNCATE marios_pizza.pizzabottom;
	SET FOREIGN_KEY_CHECKS=1;

	INSERT INTO marios_pizza.pizzabottom (Name, Size, Active, Price, Tax_ID, PizzaBottomType_ID, CreatedOn, CreatedBy, LastUpdate, UpdateBy, Deleted)
		VALUES ('Medium Cheesy Crust', 25, 1, 2.00, 1,1, CURRENT_TIMESTAMP, 'System - import', CURRENT_TIMESTAMP, 'System - import', 0)
		,('Medium', 25, 1, 0.00, 1, 2, CURRENT_TIMESTAMP, 'System - import', CURRENT_TIMESTAMP, 'System - import', 0)
        ,('Large', 35, 1, 4.00, 1, 3, CURRENT_TIMESTAMP, 'System - import', CURRENT_TIMESTAMP, 'System - import', 0)
        ,('Family XXL', 40, 1, 5.00, 1, 4, CURRENT_TIMESTAMP, 'System - import', CURRENT_TIMESTAMP, 'System - import', 0)
        ,('Italian', 30, 1, 1.00, 1, 5, CURRENT_TIMESTAMP, 'System - import', CURRENT_TIMESTAMP, 'System - import', 0)
        ,('Medium Fresh Pan', 25, 1, 1.00, 1, 6, CURRENT_TIMESTAMP, 'System - import', CURRENT_TIMESTAMP, 'System - import', 0)
;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_Fill_pizzaBottomType_Table` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_Fill_pizzaBottomType_Table`()
BEGIN
	SET FOREIGN_KEY_CHECKS=0;
	TRUNCATE marios_pizza.pizzabottomtype;
	SET FOREIGN_KEY_CHECKS=1;
    
	INSERT ignore INTO marios_pizza.pizzabottomtype (Name, Description, Active, CreatedOn, CreatedBy, LastUpdate, UpdateBy, Deleted)
	VALUES 	('Medium Cheesy Crust', 'Ambachtelijk uitgeslagen bodem van vers deeg (25 cm). De rand van deze pizza is gevuld met smakelijke gesmolten kaas met kruiden.', 1, CURRENT_TIMESTAMP, 'System - import', CURRENT_TIMESTAMP, 'System - import', 0)
			,(	'Medium', 'Deze klassieke bodem van Domino’s worden ambachtelijk uitgeslagen van ons verse deeg. Met de hand gevormd tot een perfecte bodem.', 1, CURRENT_TIMESTAMP, 'System - import', CURRENT_TIMESTAMP, 'System - import', 0)
			,(	'Large', 'Deze klassieke bodem van Domino’s worden ambachtelijk uitgeslagen van ons verse deeg. Met de hand gevormd tot een perfecte bodem.', 1, CURRENT_TIMESTAMP, 'System - import', CURRENT_TIMESTAMP, 'System - import', 0)
			,(	'Family XXL', 'Deze klassieke bodem van Domino’s worden ambachtelijk uitgeslagen van ons verse deeg. Met de hand gevormd tot een perfecte bodem.', 1, CURRENT_TIMESTAMP, 'System - import', CURRENT_TIMESTAMP, 'System - import', 0)
			,(	'Italian', 'Traditioneel dun uitgeslagen 30 centimeter bodem van vers Domino’s deeg. Lekker dun en krokant gebakken. Met oregano.', 1, CURRENT_TIMESTAMP, 'System - import', CURRENT_TIMESTAMP, 'System - import', 0)
			,(	'Medium Fresh Pan', 'De panpizza van Domino’s is een dikke, luchtige bodem van 25 centimeter met een knapperig korstje van boter en kruiden. In een pannetje gebakken.', 1, CURRENT_TIMESTAMP, 'System - import', CURRENT_TIMESTAMP, 'System - import', 0)
        ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_Fill_pizza_ingredient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_Fill_pizza_ingredient`()
BEGIN
	SET FOREIGN_KEY_CHECKS=0;
	TRUNCATE marios_pizza.pizza_ingredient;
	SET FOREIGN_KEY_CHECKS=1;

	INSERT INTO marios_pizza.pizza_ingredient (Pizza_ID, Ingredient_ID, Price, CreatedOn, CreatedBy, LastUpdate, UpdateBy, Deleted)
	SELECT 	pizzaTable.ID AS Pizza_ID
		, ingredientTable.ID AS Ingredient_ID
        , pizzaTable.Price as Price
        , CURRENT_TIMESTAMP AS CreatedOn
        , 'System - import' AS CreatedBy
        , CURRENT_TIMESTAMP AS LastUpdate
        , 'System - import' AS UpdateBy
        , 0 AS Deleted
	FROM marios_pizza.mariopizza_ingredienten AS destTable
	JOIN marios_pizza.sauce AS sauceTable ON destTable.pizzasaus_standaard = sauceTable.Name
	JOIN marios_pizza.ingredient AS ingredientTable ON destTable.ingredientnaam = ingredientTable.Name
	JOIN marios_pizza.subcategory AS subcatTable ON destTable.subcategorie = subcatTable.ID
	JOIN marios_pizza.pizza AS pizzaTable ON destTable.productnaam = pizzaTable.Name
	ORDER BY destTable.productnaam
	;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_Fill_sauce` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_Fill_sauce`()
BEGIN
	SET FOREIGN_KEY_CHECKS=0;
	TRUNCATE marios_pizza.sauce;
	SET FOREIGN_KEY_CHECKS=1;

	INSERT INTO marios_pizza.sauce (Name, Description, Price, Active, Tax_ID, CreatedOn, CreatedBy, LastUpdate, UpdateBy, Deleted)
	VALUES ('Tomatensaus', '', 0.00, 1, 1, CURRENT_TIMESTAMP, 'System - import', CURRENT_TIMESTAMP, 'System - import', 0)
		, ('Creme Fraiche', '', 0.00, 1, 1, CURRENT_TIMESTAMP, 'System - import', CURRENT_TIMESTAMP, 'System - import', 0)
		, ('Barbecue Saus', '', 0.00, 1, 1, CURRENT_TIMESTAMP, 'System - import', CURRENT_TIMESTAMP, 'System - import', 0)
; 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_Fill_subcategory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_Fill_subcategory`()
BEGIN
		SET FOREIGN_KEY_CHECKS=0;
	TRUNCATE marios_pizza.subcategory;
	SET FOREIGN_KEY_CHECKS=1;

INSERT INTO marios_pizza.subcategory (Name, Description, Active, Categorie_ID, CreatedOn, CreatedBy, LastUpdate, UpdateBy, Deleted)
VALUES ('Famous Artisan Pizza’s','',1,3, CURRENT_TIMESTAMP, 'System - import', CURRENT_TIMESTAMP, 'System - import', 0)
,("Top Taste Pizza's",'',1,3, CURRENT_TIMESTAMP, 'System - import', CURRENT_TIMESTAMP, 'System - import', 0)
,('BBQ Specials','',1,3, CURRENT_TIMESTAMP, 'System - import', CURRENT_TIMESTAMP, 'System - import', 0)
,("Pasta's",'',1,1, CURRENT_TIMESTAMP, 'System - import', CURRENT_TIMESTAMP, 'System - import', 0)
,('Kip, Wedges & Sausjes','',1,1, CURRENT_TIMESTAMP, 'System - import', CURRENT_TIMESTAMP, 'System - import', 0)
,('Broodproducten','',1,1, CURRENT_TIMESTAMP, 'System - import', CURRENT_TIMESTAMP, 'System - import', 0)
,('Salade','',1,1, CURRENT_TIMESTAMP, 'System - import', CURRENT_TIMESTAMP, 'System - import', 0)
,('Desserts','',1,2, CURRENT_TIMESTAMP, 'System - import', CURRENT_TIMESTAMP, 'System - import', 0)
,('Drinks','',1,2, CURRENT_TIMESTAMP, 'System - import', CURRENT_TIMESTAMP, 'System - import', 0)
;

UPDATE marios_pizza.subcategory
SET Description =  REGEXP_REPLACE(Name, '[\]\\[!@#$%.&*`~^_{}:;’<>\'/\\|()-]+', '');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_filter_MisMatch_Ingredients` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_filter_MisMatch_Ingredients`()
BEGIN
		UPDATE marios_pizza.mariopizza_ingredienten destTable
		LEFT JOIN marios_pizza.ingredient as srcTable ON destTable.ingredientnaam = srcTable.Name
		SET destTable.ErrorDetails = 'Ingredients don\'t match'
		WHERE destTable.ErrorDetails is null AND srcTable.ID IS NULL
;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_insertCustomerAddress` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_insertCustomerAddress`()
BEGIN
INSERT IGNORE INTO Marios_pizza.addressinfo(HouseNumber, Address, Zipcode, City, CreatedOn, CreatedBy, LastUpdate, UpdateBy, Deleted)
SELECT regexp_substr(Adres, '[0-9]+$') AS HouseNumber
	,LEFT(Adres, LENGTH(Adres) - LOCATE(' ', REVERSE(Adres)) + 1) AS Address
	,NULL AS Zipcode
	,Woonplaats AS City
	,CURRENT_TIMESTAMP AS CreatedOn
	,'System - import' AS CreatedBy
	,CURRENT_TIMESTAMP AS LastUpdate
	,'System - import' AS UpdateBy
	,0 AS Deleted
FROM marios_pizza.marioorderdata01 AS srcTable
WHERE ErrorDetails IS null
GROUP BY Woonplaats
	,Adres;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_insert_customer_address_info_from_marioorderdata` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_insert_customer_address_info_from_marioorderdata`()
BEGIN
	INSERT IGNORE
INTO marios_pizza.customer_addressinfo (Customer_ID, AddressInfo_ID, CreatedOn, CreatedBy, LastUpdate, UpdateBy, Deleted)
SELECT destTable.CustomerID AS Customer_ID
	,srcTable.ID AS AddressInfo_ID
	,CURRENT_TIMESTAMP AS CreatedOn
	,'System - import' AS CreatedBy
	,CURRENT_TIMESTAMP AS LastUpdate
	,'System - import' AS UpdateBy
	,0 AS Deleted
FROM marios_pizza.marioorderdata01 AS destTable
JOIN marios_pizza.addressinfo AS srcTable ON LEFT(destTable.Adres, LENGTH(destTable.Adres) - LOCATE(' ', REVERSE(destTable.Adres)) + 1) = srcTable.Address
	AND destTable.Woonplaats = srcTable.City
	AND regexp_substr(destTable.Adres, '[0-9]+$') = srcTable.HouseNumber
GROUP BY Email;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_truncate_all_tables` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_truncate_all_tables`()
BEGIN
	SET FOREIGN_KEY_CHECKS=0;
	TRUNCATE marios_pizza.`addressinfo`;
	TRUNCATE marios_pizza.`category`;
	TRUNCATE marios_pizza.`city`;
	TRUNCATE marios_pizza.`coupon`;
	TRUNCATE marios_pizza.`customer`;
	TRUNCATE marios_pizza.`customer_addressinfo`;
	TRUNCATE marios_pizza.`deliverytype`;
	TRUNCATE marios_pizza.`differentopeningtime`;
	TRUNCATE marios_pizza.`ingredient`;
	TRUNCATE marios_pizza.`item_property`;
	TRUNCATE marios_pizza.`marioorderdata01`;
	TRUNCATE marios_pizza.`municipality`;
	TRUNCATE marios_pizza.`nonpizza`;
	TRUNCATE marios_pizza.`openingtime`;
	TRUNCATE marios_pizza.`order`;
	TRUNCATE marios_pizza.`order_coupon`;
	TRUNCATE marios_pizza.`orderitem`;
	TRUNCATE marios_pizza.`pizza`;
	TRUNCATE marios_pizza.`pizza_ingredient`;
	TRUNCATE marios_pizza.`pizzabottom`;
	TRUNCATE marios_pizza.`pizzabottomtype`;
	TRUNCATE marios_pizza.`property`;
	TRUNCATE marios_pizza.`sauce`;
	TRUNCATE marios_pizza.`servicearea`;
	TRUNCATE marios_pizza.`shop`;
	TRUNCATE marios_pizza.`street`;
	TRUNCATE marios_pizza.`subcategory`;
	TRUNCATE marios_pizza.`tax`;
	SET FOREIGN_KEY_CHECKS=1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_truncate_partial_tables` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_truncate_partial_tables`()
BEGIN
	SET FOREIGN_KEY_CHECKS=0;
	TRUNCATE marios_pizza.`coupon`;
	TRUNCATE marios_pizza.`customer`;
	TRUNCATE marios_pizza.`customer_addressinfo`;
	TRUNCATE marios_pizza.`deliverytype`;
	TRUNCATE marios_pizza.`marioorderdata01`;
	TRUNCATE marios_pizza.`order`;
	TRUNCATE marios_pizza.`order_coupon`;
	TRUNCATE marios_pizza.`orderitem`;
    TRUNCATE marios_pizza.`addressinfo`;
	SET FOREIGN_KEY_CHECKS=1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_updateWinkelnaam` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_updateWinkelnaam`()
BEGIN
  DECLARE CURSOR_Id INT;
  DECLARE CURSOR_Winkelnaam VARCHAR(255);
  DECLARE done INT DEFAULT FALSE;
  DECLARE cursor_Order CURSOR FOR SELECT ID, Name FROM marios_pizza.city;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
  OPEN cursor_Order;
  loop_through_rows: LOOP
    FETCH cursor_Order INTO CURSOR_Id, CURSOR_Winkelnaam;
    IF done THEN
      LEAVE loop_through_rows;
    END IF;
    UPDATE new_schema.marioorderdata01 SET Winkelnaam = CURSOR_Id WHERE Name = CURSOR_Winkelnaam;
  END LOOP;
  CLOSE cursor_Order;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_update_CategoryID_mariooverigeproducten` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_update_CategoryID_mariooverigeproducten`()
BEGIN
	UPDATE marios_pizza.mariooverigeproducten destTable
		JOIN marios_pizza.category AS catTable ON categorie = catTable.Name
		SET destTable.categorieID = catTable.ID
	;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_update_CategoryID_On_MariosPizza_Ingredienten` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_update_CategoryID_On_MariosPizza_Ingredienten`()
BEGIN
	UPDATE marios_pizza.mariopizza_ingredienten destTable
    JOIN marios_pizza.category AS srcTable ON destTable.categorie = srcTable.Name
    SET destTable.categorieID = srcTable.ID
    ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_update_CouponID_on_MarioOrderData` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_update_CouponID_on_MarioOrderData`()
BEGIN
	UPDATE marios_pizza.marioorderdata01 AS destTable
    JOIN marios_pizza.coupon srcTable ON destTable.`Gebruikte Coupon` = srcTable.Description
	SET destTable.`CouponID` =  srcTable.ID
    WHERE destTable.`Gebruikte Coupon` > '' AND destTable.ErrorDetails IS NULL

    ;    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_update_CustomerAddressID_on_marioorderdata01` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_update_CustomerAddressID_on_marioorderdata01`()
BEGIN
UPDATE marios_pizza.marioorderdata01 ordData
JOIN marios_pizza.customer AS cust ON ordData.CustomerID = cust.ID
JOIN marios_pizza.customer_addressinfo AS custAddressInfo ON cust.ID = custAddressInfo.Customer_ID
JOIN marios_pizza.addressinfo AS addressInfo ON custAddressInfo.AddressInfo_ID = addressInfo.ID
SET ordData.AddressID = addressinfo.ID
    ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_update_DeliverTypeID_on_OrderData` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_update_DeliverTypeID_on_OrderData`()
BEGIN
UPDATE marios_pizza.marioorderdata01 AS destTable    
JOIN marios_pizza.deliverytype srcTable ON destTable.AfleverType = srcTable.Type
SET destTable.DeliveryTypeID = srcTable.ID
WHERE ErrorDetails IS NULL
;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_update_IngredientID_on_mariopizza_ingredienten` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_update_IngredientID_on_mariopizza_ingredienten`()
BEGIN
UPDATE marios_pizza.mariopizza_ingredienten destTable
JOIN marios_pizza.ingredient as srcTable ON destTable.ingredientnaam = srcTable.Name
SET destTable.ingredientnaamID = srcTable.ID
WHERE destTable.ErrorDetails is null
;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_update_OrderID_on_MarioOrderData` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_update_OrderID_on_MarioOrderData`()
BEGIN
	UPDATE marios_pizza.marioorderdata01 destTable    
		JOIN marios_pizza.order srcTable ON destTable.CustomerID = srcTable.Customer_Id 
		SET destTable.OrderID = srcTable.ID
        # 'woensdag 5 juni 2019' - '2019-06-05 00:00:00'
		WHERE func_dateTime_to_TimeStamp(destTable.Besteldatum,'00:00') = srcTable.OrderDate
        AND
		# 'woensdag 5 juni 2019' (aflevermoment) '20:05'- '2019-06-05 20:05:00'
		func_dateTime_to_TimeStamp(destTable.AfleverDatum,destTable.Aflevermoment) = srcTable.DeliveryTime
		AND
		destTable.WinkelID = srcTable.Shop_ID
        AND ErrorDetails IS NULL
		
;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_Update_Order_Customer_ID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_Update_Order_Customer_ID`()
BEGIN
	UPDATE marios_pizza.marioorderdata01 ord
	JOIN marios_pizza.customer cust USING (Email)
	SET ord.CustomerID = cust.ID
    WHERE ord.ErrorDetails IS NULL
    ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_update_PizzaBodemID_on_marioorderdata` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_update_PizzaBodemID_on_marioorderdata`()
BEGIN
	UPDATE marios_pizza.marioorderdata01 destTable
JOIN marios_pizza.pizzabottom AS srcTable ON LEFT(destTable.PizzaBodem,LOCATE('Pizza',destTable.PizzaBodem)-2) = srcTable.Name
SET destTable.PizzaBodemID = srcTable.ID
    WHERE ErrorDetails IS NULL
;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_update_PizzaSausID_on_marioorderdata` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_update_PizzaSausID_on_marioorderdata`()
BEGIN
	UPDATE marios_pizza.marioorderdata01 destTable
	JOIN marios_pizza.sauce AS srcTable ON destTable.PizzaSaus = srcTable.Name
		SET destTable.PizzaSausID = srcTable.ID
		WHERE destTable.ErrorDetails IS NULL
	;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_update_ProductID_with_NonPizzaIDs_on_marioorderdata` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_update_ProductID_with_NonPizzaIDs_on_marioorderdata`()
BEGIN
UPDATE marios_pizza.marioorderdata01 AS destTable
JOIN marios_pizza.nonpizza AS nonpizzaTable ON destTable.Product = nonpizzaTable.Name
SET destTable.nonProductID = nonpizzaTable.ID
WHERE destTable.ErrorDetails IS NULL
;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_update_ProductID_with_PizzaIDs_on_marioorderdata` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_update_ProductID_with_PizzaIDs_on_marioorderdata`()
BEGIN
	UPDATE marios_pizza.marioorderdata01 AS destTable
	JOIN marios_pizza.pizza AS pizzaTable ON destTable.Product = pizzaTable.Name
	SET destTable.ProductID = pizzaTable.ID
    WHERE destTable.ErrorDetails IS NULL
	;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_update_productnaamID_from_mariooverigeproducten` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_update_productnaamID_from_mariooverigeproducten`()
BEGIN
	UPDATE marios_pizza.mariooverigeproducten AS destTable
    JOIN marios_pizza.nonpizza AS srcTable ON destTable.productnaam = srcTable.Name
    SET destTable.productnaamID = srcTable.ID
    ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_update_SauceID_On_mariopizza_ingredienten` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_update_SauceID_On_mariopizza_ingredienten`()
BEGIN
	UPDATE marios_pizza.mariopizza_ingredienten AS destTable
	JOIN marios_pizza.sauce as srcTable ON destTable.pizzasaus_standaard = srcTable.Name
	SET destTable.pizzaSausID = srcTable.ID
	WHERE destTable.ErrorDetails is null
	;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_update_subcategorieID_mariooverigeproducten` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_update_subcategorieID_mariooverigeproducten`()
BEGIN
	UPDATE marios_pizza.mariooverigeproducten AS destTable
    JOIN marios_pizza.subcategory AS subcatTable ON destTable.subcategorie = subcatTable.Name
    SET destTable.subcategorieID = subcatTable.ID
;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_update_SubcategoryID_On_mariopizza_ingredienten` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_update_SubcategoryID_On_mariopizza_ingredienten`()
BEGIN
	UPDATE marios_pizza.mariopizza_ingredienten destTable
	JOIN marios_pizza.subcategory as srcTable ON destTable.subcategorie = srcTable.Name
	SET destTable.subcategorieID = srcTable.ID
	WHERE destTable.ErrorDetails is null ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_update_WinkelID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_update_WinkelID`()
BEGIN
	UPDATE marios_pizza.marioorderdata01 destTable
    JOIN marios_pizza.shop srcTable ON destTable.Winkelnaam = srcTable.Name
    SET destTable.WinkelID = srcTable.ID
    ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-30 18:35:31
