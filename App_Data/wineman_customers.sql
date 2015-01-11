CREATE DATABASE  IF NOT EXISTS `wineman` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `wineman`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: wineman
-- ------------------------------------------------------
-- Server version	5.6.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `address` longtext,
  `city` varchar(45) DEFAULT NULL,
  `province` varchar(45) DEFAULT 'Quebec',
  `postal_code` varchar(7) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `telephone` varchar(25) DEFAULT NULL,
  `telephone_bur` varchar(25) DEFAULT NULL,
  `telephone_fax` varchar(25) DEFAULT NULL,
  `language` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `CustomerId_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Alain','Dessureaux','4666 mignault','Montreal','Quebec','H1M-1Y7','alain.dessureaux@gmail.com','514 885-0570','514 999-4567','',0),(2,'Johny','Dep','asdsa',NULL,'Quebec',NULL,NULL,'324234234',NULL,NULL,0),(4,'gerard','D L','12313 asjklsdfjsdlf',NULL,'Quebec',NULL,'gerard@gmail.com','514 998-0098',NULL,NULL,0),(7,'Iolanda','Colangelo','4666 mignault','Montreal','Quebec','H1m1y7','IOLANDA.COLANGELO@GMAIL.COM','324-345-4535','324-345-4535','324-345-4535',1),(8,'Robert','Lepage','',NULL,'Quebec',NULL,NULL,NULL,NULL,NULL,0),(9,'Laurent','Dessureaux','2035 st-hubert','MOntreal','Quebec','H23-3F9','laurent.dessureaux@gmail.com','514-885-9595','','',0),(10,'Leanne','Dessureaux','',NULL,'Quebec',NULL,'','514 999-0987',NULL,NULL,0),(12,'Danielle','Barcelo','',NULL,'Quebec',NULL,NULL,NULL,NULL,NULL,0),(13,'Jo','Blow','',NULL,'Quebec',NULL,NULL,NULL,NULL,NULL,0),(14,'Jonathan','coterzi','345345 rue des bobo','Pointe claire','Quebec','h3sd7d3','kljsdhflasdkhfalkjsdfh@gmail.com','514-979-3434','','',0),(15,'Rooooooooooooooodrigo','tresssssssssssssssslonggggggggHEY','',NULL,'Quebec',NULL,NULL,'',NULL,NULL,0),(16,'Charles','Dessureaux','656 askjahs',NULL,'Quebec',NULL,'','450-494-3938',NULL,NULL,0);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-01-11 12:46:27
