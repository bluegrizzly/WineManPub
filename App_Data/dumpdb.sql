-- MySQL dump 10.13  Distrib 5.6.20, for Win64 (x86_64)
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
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `holidays`
--

DROP TABLE IF EXISTS `holidays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `holidays` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `reason` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `holidays`
--

LOCK TABLES `holidays` WRITE;
/*!40000 ALTER TABLE `holidays` DISABLE KEYS */;
INSERT INTO `holidays` VALUES (1,'2014-10-24','fete des peres'),(3,'2014-12-11','YYY'),(9,'2014-04-09','ava'),(23,'2014-11-27','ffff'),(25,'2014-11-29','aaaa'),(27,'2014-11-29',''),(30,'2014-11-08','hgg'),(31,'2014-11-14','aaa'),(32,'2015-01-30','test');
/*!40000 ALTER TABLE `holidays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_codes`
--

DROP TABLE IF EXISTS `product_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_codes` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `color` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_codes`
--

LOCK TABLES `product_codes` WRITE;
/*!40000 ALTER TABLE `product_codes` DISABLE KEYS */;
INSERT INTO `product_codes` VALUES (11,'ss','Brown'),(55,'red','dd'),(99,'super red','red');
/*!40000 ALTER TABLE `product_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `version` int(11) NOT NULL,
  `nb_stations` int(11) DEFAULT NULL,
  `min_station_hour` int(11) DEFAULT NULL,
  `max_station_hour` int(11) DEFAULT NULL,
  `hour_intervale` int(11) DEFAULT NULL,
  `auto_print` bit(1) DEFAULT b'0',
  PRIMARY KEY (`version`),
  UNIQUE KEY `version_UNIQUE` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (100,3,9,19,60,'\0');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `steps`
--

DROP TABLE IF EXISTS `steps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `steps` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `name_french` varchar(45) DEFAULT NULL,
  `final_step` bit(1) DEFAULT b'0',
  `active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `steps`
--

LOCK TABLES `steps` WRITE;
/*!40000 ALTER TABLE `steps` DISABLE KEYS */;
INSERT INTO `steps` VALUES (1,'Yeast','Levures','\0',''),(2,'Transfer 1','Transfert 1','\0',''),(3,'Transfer 2','Transfert 2','\0',''),(4,'Transfer 3','Transfert 3','\0',''),(5,'Degazaging','Degazage','\0',''),(6,'Clarification','Clarification','\0',''),(7,'Aromate','Aromates','\0',''),(8,'Oak','Chène','\0',''),(9,'Frigo_start','Frigo (Entrer au)','\0',''),(10,'Frigo_end','Frigo (Sortie du)','\0',''),(11,'Filtring','Filtration','\0',''),(12,'Bottling','Embouteillage','','');
/*!40000 ALTER TABLE `steps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction_step`
--

DROP TABLE IF EXISTS `transaction_step`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction_step` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `transaction_id` int(11) NOT NULL,
  `step_id` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `done` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=312 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_step`
--

LOCK TABLES `transaction_step` WRITE;
/*!40000 ALTER TABLE `transaction_step` DISABLE KEYS */;
INSERT INTO `transaction_step` VALUES (66,50,1,'2014-11-29 20:31:04',''),(67,50,2,'2014-12-05 20:31:04','\0'),(68,50,5,'2014-12-17 20:31:04','\0'),(69,50,6,'2014-12-17 20:31:04','\0'),(70,50,11,'2014-12-24 20:31:04','\0'),(71,50,12,'2014-12-30 20:31:04','\0'),(72,51,1,'2014-11-29 20:31:38',''),(73,51,2,'2014-12-05 20:31:38','\0'),(74,51,5,'2014-12-17 20:31:38','\0'),(75,51,6,'2014-12-17 20:31:38','\0'),(76,51,8,'2014-11-29 20:31:38',''),(77,51,11,'2014-12-24 20:31:38','\0'),(78,51,12,'2014-12-30 20:31:38','\0'),(79,52,1,'2014-11-29 20:31:59',''),(80,52,2,'2014-12-13 20:31:59','\0'),(81,52,5,'2014-12-23 20:31:59','\0'),(82,52,6,'2014-12-23 20:31:59','\0'),(83,52,8,'2014-11-29 20:31:59',''),(84,52,11,'2015-01-06 20:31:59','\0'),(85,52,12,'2015-01-12 20:31:59','\0'),(86,53,1,'2014-11-30 10:14:42',''),(87,53,2,'2014-12-06 10:14:42','\0'),(88,53,5,'2014-12-18 10:14:42','\0'),(89,53,6,'2014-12-18 10:14:42','\0'),(90,53,11,'2014-12-25 10:14:42','\0'),(91,53,12,'2014-12-31 10:14:42','\0'),(92,54,1,'2014-11-30 17:06:38',''),(93,54,2,'2014-12-14 17:06:38','\0'),(94,54,5,'2014-12-24 17:06:38','\0'),(95,54,6,'2014-12-24 17:06:38','\0'),(96,54,11,'2014-12-31 17:06:38','\0'),(97,54,12,'2015-01-07 17:06:38','\0'),(98,55,1,'2014-12-10 20:55:19',''),(99,55,2,'2014-12-16 20:55:19','\0'),(100,55,5,'2014-12-28 20:55:19','\0'),(101,55,6,'2014-12-28 20:55:19','\0'),(102,55,11,'2015-01-04 20:55:19','\0'),(103,55,12,'2015-01-10 20:55:19','\0'),(104,56,1,'2014-12-10 21:17:38',''),(105,56,2,'2014-12-16 21:17:38','\0'),(106,56,5,'2014-12-28 21:17:38','\0'),(107,56,6,'2014-12-28 21:17:38','\0'),(108,56,11,'2015-01-04 21:17:38','\0'),(109,56,12,'2015-01-10 21:17:38','\0'),(110,57,1,'2014-12-13 14:27:27',''),(111,57,2,'2014-12-27 14:27:27','\0'),(112,57,5,'2015-01-06 14:27:27','\0'),(113,57,6,'2015-01-06 14:27:27','\0'),(114,57,8,'2014-12-13 14:27:27','\0'),(115,57,11,'2015-01-20 14:27:27','\0'),(116,57,12,'2015-01-26 14:27:27','\0'),(117,58,1,'2014-12-13 14:28:22',''),(118,58,2,'2014-12-19 14:28:22','\0'),(119,58,5,'2014-12-31 14:28:22','\0'),(120,58,6,'2014-12-31 14:28:22','\0'),(121,58,11,'2015-01-13 14:28:22','\0'),(122,58,12,'2015-01-20 14:28:22','\0'),(123,59,1,'2014-12-13 14:28:46',''),(124,59,2,'2014-12-27 14:28:46','\0'),(125,59,5,'2015-01-06 14:28:46','\0'),(126,59,6,'2015-01-06 14:28:46','\0'),(127,59,8,'2014-12-13 14:28:46','\0'),(128,59,11,'2015-01-13 14:28:46','\0'),(129,59,12,'2015-01-20 14:28:46','\0'),(130,60,1,'2014-12-13 14:29:17',''),(131,60,2,'2014-12-27 14:29:17','\0'),(132,60,5,'2015-01-06 14:29:17','\0'),(133,60,6,'2015-01-06 14:29:17','\0'),(134,60,8,'2014-12-13 14:29:17','\0'),(135,60,11,'2015-01-13 14:29:17','\0'),(136,60,12,'2015-01-20 14:29:17','\0'),(137,61,1,'2014-12-24 14:37:30',''),(138,61,2,'2015-01-07 14:37:30','\0'),(139,61,5,'2015-01-17 14:37:30','\0'),(140,61,6,'2015-01-17 14:37:30','\0'),(141,61,8,'2014-12-24 14:37:30','\0'),(142,61,11,'2015-01-24 14:37:30','\0'),(143,61,12,'2015-01-31 14:37:30','\0'),(144,62,1,'2014-12-24 14:47:48',''),(145,62,2,'2014-12-30 14:47:48','\0'),(146,62,5,'2015-01-11 14:47:48','\0'),(147,62,6,'2015-01-11 14:47:48','\0'),(148,62,8,'2014-12-24 14:47:48','\0'),(149,62,11,'2015-01-18 14:47:48','\0'),(150,62,12,'2015-01-24 14:47:48','\0'),(151,63,1,'2014-12-24 15:00:52',''),(152,63,2,'2014-12-30 15:00:52','\0'),(153,63,5,'2015-01-11 15:00:52','\0'),(154,63,6,'2015-01-11 15:00:52','\0'),(155,63,8,'2014-12-24 15:00:52','\0'),(156,63,11,'2015-01-18 15:00:52','\0'),(157,63,12,'2015-01-24 15:00:52','\0'),(158,64,1,'2014-12-24 15:14:01',''),(159,64,2,'2014-12-30 15:14:01','\0'),(160,64,5,'2015-01-11 15:14:01','\0'),(161,64,6,'2015-01-11 15:14:01','\0'),(162,64,8,'2014-12-24 15:14:01','\0'),(163,64,11,'2015-01-18 15:14:01','\0'),(164,64,12,'2015-01-24 15:14:01','\0'),(165,65,1,'2014-12-24 15:16:40',''),(166,65,2,'2014-12-30 15:16:40','\0'),(167,65,5,'2015-01-11 15:16:40','\0'),(168,65,6,'2015-01-11 15:16:40','\0'),(169,65,11,'2015-01-18 15:16:40','\0'),(170,65,12,'2015-01-24 15:16:40','\0'),(171,66,1,'2014-12-24 15:23:47',''),(172,66,2,'2015-01-07 15:23:47','\0'),(173,66,5,'2015-01-17 15:23:47','\0'),(174,66,6,'2015-01-17 15:23:47','\0'),(175,66,8,'2014-12-24 15:23:47','\0'),(176,66,11,'2015-01-24 15:23:47','\0'),(177,66,12,'2015-01-31 15:23:47','\0'),(178,67,1,'2014-12-24 15:31:32',''),(179,67,2,'2015-01-07 15:31:32','\0'),(180,67,5,'2015-01-17 15:31:32','\0'),(181,67,6,'2015-01-17 15:31:32','\0'),(182,67,8,'2014-12-24 15:31:32','\0'),(183,67,11,'2015-01-24 15:31:32','\0'),(184,67,12,'2015-01-31 15:31:32','\0'),(185,68,1,'2014-12-24 15:42:48',''),(186,68,2,'2014-12-30 15:42:48','\0'),(187,68,5,'2015-01-11 15:42:48','\0'),(188,68,6,'2015-01-11 15:42:48','\0'),(189,68,8,'2014-12-24 15:42:48','\0'),(190,68,11,'2015-01-18 15:42:48','\0'),(191,68,12,'2015-01-24 15:42:48','\0'),(192,69,1,'2014-12-24 15:48:35',''),(193,69,2,'2014-12-30 15:48:35','\0'),(194,69,5,'2015-01-11 15:48:35','\0'),(195,69,6,'2015-01-11 15:48:35','\0'),(196,69,8,'2014-12-24 15:48:35','\0'),(197,69,11,'2015-01-18 15:48:35','\0'),(198,69,12,'2015-01-24 15:48:35','\0'),(199,70,1,'2014-12-25 12:27:13',''),(200,70,2,'2014-12-31 12:27:13','\0'),(201,70,5,'2015-01-12 12:27:13','\0'),(202,70,6,'2015-01-12 12:27:13','\0'),(203,70,8,'2014-12-25 12:27:13','\0'),(204,70,11,'2015-01-19 12:27:13','\0'),(205,70,12,'2015-01-25 12:27:13','\0'),(206,71,1,'2014-12-25 12:35:11',''),(207,71,2,'2014-12-31 12:35:11','\0'),(208,71,5,'2015-01-12 12:35:11','\0'),(209,71,6,'2015-01-12 12:35:11','\0'),(210,71,8,'2014-12-25 12:35:11','\0'),(211,71,11,'2015-01-19 12:35:11','\0'),(212,71,12,'2015-01-25 12:35:11','\0'),(213,72,1,'2014-12-25 13:19:40',''),(214,72,2,'2014-12-31 13:19:40',''),(215,72,5,'2015-01-12 13:19:40',''),(216,72,6,'2015-01-12 13:19:40',''),(217,72,8,'2014-12-25 13:19:40',''),(218,72,11,'2015-01-19 13:19:40',''),(219,72,12,'2015-01-25 13:19:40',''),(220,73,1,'2014-12-26 13:22:38',''),(221,73,2,'2015-01-09 13:22:38','\0'),(222,73,5,'2015-01-19 13:22:38','\0'),(223,73,6,'2015-01-19 13:22:38','\0'),(224,73,8,'2014-12-26 13:22:38','\0'),(225,73,11,'2015-02-02 13:22:38','\0'),(226,73,12,'2015-02-08 13:22:38','\0'),(227,74,1,'2014-12-26 13:24:55',''),(228,74,2,'2015-01-01 13:24:55','\0'),(229,74,5,'2015-01-13 13:24:55','\0'),(230,74,6,'2015-01-13 13:24:55','\0'),(231,74,8,'2014-12-26 13:24:55','\0'),(232,74,11,'2015-01-20 13:24:55','\0'),(233,74,12,'2015-01-26 13:24:55','\0'),(234,75,1,'2014-12-26 13:26:44',''),(235,75,2,'2015-01-01 13:26:44','\0'),(236,75,5,'2015-01-13 13:26:44','\0'),(237,75,6,'2015-01-13 13:26:44','\0'),(238,75,8,'2014-12-26 13:26:44','\0'),(239,75,11,'2015-01-20 13:26:44','\0'),(240,75,12,'2015-01-26 13:26:44','\0'),(241,76,1,'2014-12-26 13:58:52',''),(242,76,2,'2015-01-01 13:58:52','\0'),(243,76,5,'2015-01-13 13:58:52','\0'),(244,76,6,'2015-01-13 13:58:52','\0'),(245,76,8,'2014-12-26 13:58:52','\0'),(246,76,11,'2015-01-20 13:58:52','\0'),(247,76,12,'2015-01-26 13:58:52','\0'),(248,77,1,'2015-01-01 13:12:49',''),(249,77,2,'2015-01-07 13:12:49','\0'),(250,77,5,'2015-01-19 13:12:49','\0'),(251,77,6,'2015-01-19 13:12:49','\0'),(252,77,11,'2015-01-26 13:12:49','\0'),(253,77,12,'2015-02-01 13:12:49','\0'),(254,78,1,'2015-01-05 21:15:19',''),(255,78,2,'2015-01-11 21:15:19','\0'),(256,78,5,'2015-01-23 21:15:19','\0'),(257,78,6,'2015-01-23 21:15:19','\0'),(258,78,8,'2015-01-05 21:15:19','\0'),(259,78,11,'2015-01-30 21:15:19','\0'),(260,78,12,'2015-02-05 21:15:19','\0'),(261,79,1,'2015-01-05 21:30:16',''),(262,79,2,'2015-01-11 21:30:16','\0'),(263,79,5,'2015-01-23 21:30:16','\0'),(264,79,6,'2015-01-23 21:30:16','\0'),(265,79,11,'2015-01-30 21:30:16','\0'),(266,79,12,'2015-02-05 21:30:16','\0'),(267,80,1,'2015-01-05 21:34:56',''),(268,80,2,'2015-01-11 21:34:56','\0'),(269,80,5,'2015-01-23 21:34:56','\0'),(270,80,6,'2015-01-23 21:34:56','\0'),(271,80,11,'2015-01-30 21:34:56','\0'),(272,80,12,'2015-02-05 21:34:56','\0'),(273,81,1,'2015-01-05 21:37:42',''),(274,81,2,'2015-01-19 21:37:42','\0'),(275,81,5,'2015-01-29 21:37:42','\0'),(276,81,6,'2015-01-29 21:37:42','\0'),(277,81,8,'2015-01-05 21:37:42','\0'),(278,81,11,'2015-02-05 21:37:42','\0'),(279,81,12,'2015-02-12 21:37:42','\0'),(280,82,1,'2015-01-10 13:08:45',''),(281,82,2,'2015-01-16 13:08:45','\0'),(282,82,5,'2015-01-28 13:08:45','\0'),(283,82,6,'2015-01-28 13:08:45','\0'),(284,82,8,'2015-01-10 13:08:45','\0'),(285,82,11,'2015-02-04 13:08:45','\0'),(286,82,12,'2015-02-10 13:08:45','\0'),(287,83,1,'2015-01-10 13:22:55',''),(288,83,2,'2015-01-16 13:22:55','\0'),(289,83,5,'2015-01-28 13:22:55','\0'),(290,83,6,'2015-01-28 13:22:55','\0'),(291,83,8,'2015-01-10 13:22:55','\0'),(292,83,11,'2015-02-04 13:22:55','\0'),(293,83,12,'2015-02-10 13:22:55','\0'),(294,84,1,'2015-01-10 14:39:55',''),(295,84,2,'2015-01-16 14:39:55','\0'),(296,84,5,'2015-01-28 14:39:55','\0'),(297,84,6,'2015-01-28 14:39:55','\0'),(298,84,11,'2015-02-04 14:39:55','\0'),(299,84,12,'2015-02-10 14:39:55','\0'),(300,85,1,'2015-01-11 11:36:33',''),(301,85,2,'2015-01-17 11:36:33',''),(302,85,5,'2015-01-29 11:36:33',''),(303,85,6,'2015-01-29 11:36:33',''),(304,85,11,'2015-02-05 11:36:33',''),(305,85,12,'2015-02-11 11:36:33',''),(306,86,1,'2015-01-18 16:42:49','\0'),(307,86,2,'2015-01-24 16:42:49','\0'),(308,86,5,'2015-02-05 16:42:49','\0'),(309,86,6,'2015-02-05 16:42:49','\0'),(310,86,11,'2015-02-12 16:42:49','\0'),(311,86,12,'2015-02-18 16:42:49','\0');
/*!40000 ALTER TABLE `transaction_step` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned DEFAULT NULL,
  `wine_brand_id` int(10) unsigned DEFAULT NULL,
  `wine_type_id` int(10) unsigned DEFAULT NULL,
  `wine_category_id` int(10) unsigned DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `date_bottling` datetime DEFAULT NULL,
  `bottling_station` int(4) DEFAULT '0',
  `done` bit(1) DEFAULT b'0',
  `comments` mediumtext,
  `location` varchar(20) DEFAULT NULL,
  `product_code` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (50,1,1,1,1,'2014-12-28 20:17:00','2015-02-18 10:00:00',1,'\0',NULL,NULL,NULL),(51,7,2,2,13,'2014-11-29 20:31:38','2015-02-22 04:00:00',0,'\0',NULL,NULL,NULL),(52,10,3,5,51,'2014-11-29 20:31:59','2015-03-11 08:00:00',1,'\0',NULL,NULL,NULL),(53,11,2,2,13,'2014-11-30 10:14:42','2015-02-14 20:00:00',1,'\0',NULL,NULL,NULL),(54,1,2,4,32,'2014-11-30 17:06:38','2015-03-02 04:00:00',0,'\0',NULL,NULL,NULL),(55,1,1,1,1,'2014-12-10 20:55:19','2015-02-16 12:00:00',1,'\0',NULL,NULL,NULL),(56,2,1,1,1,'2014-12-10 21:17:38','2015-01-10 09:00:00',1,'\0',NULL,NULL,NULL),(57,7,1,1,51,'2014-12-13 14:27:27','2015-01-26 11:00:00',0,'\0',NULL,NULL,NULL),(58,9,2,2,20,'2014-12-13 14:28:22','2015-01-26 09:00:00',1,'\0',NULL,NULL,NULL),(59,12,3,3,32,'2014-12-13 14:28:46','2015-01-26 14:00:00',2,'\0',NULL,NULL,NULL),(60,10,2,4,32,'2014-12-13 14:29:17','2015-01-26 12:00:00',1,'\0',NULL,NULL,NULL),(61,1,2,4,32,'2014-12-24 14:37:30','2015-01-31 11:00:00',1,'\0',NULL,NULL,NULL),(62,1,2,2,13,'2014-12-24 14:47:48','2015-01-24 10:00:00',1,'\0',NULL,NULL,NULL),(63,1,2,2,13,'2014-12-24 15:00:52','2015-01-24 11:00:00',0,'\0',NULL,NULL,NULL),(64,1,2,2,13,'2014-12-24 15:14:01','2015-01-24 14:00:00',0,'\0',NULL,NULL,NULL),(65,1,1,1,1,'2014-12-24 15:16:40','2015-01-24 14:00:00',2,'\0',NULL,NULL,NULL),(66,12,3,3,32,'2014-12-24 15:23:47','2015-01-31 13:00:00',1,'\0',NULL,NULL,NULL),(67,9,2,4,32,'2014-12-24 15:31:32','2015-01-31 13:00:00',0,'\0',NULL,NULL,NULL),(68,9,2,2,13,'2014-12-24 15:42:48','2015-01-24 12:00:00',1,'\0',NULL,NULL,NULL),(69,9,2,2,13,'2014-12-24 15:48:35','2015-01-24 10:00:00',2,'\0',NULL,NULL,NULL),(70,9,2,2,13,'2014-12-25 12:27:13','2015-01-24 15:00:00',1,'\0',NULL,NULL,NULL),(71,9,2,2,13,'2014-12-25 12:35:11','2015-01-24 17:00:00',2,'\0',NULL,NULL,NULL),(72,9,2,2,13,'2014-12-25 13:19:40','2015-01-24 15:00:00',0,'',NULL,NULL,NULL),(73,10,3,5,51,'2014-12-26 13:22:38','2015-02-06 11:00:00',1,'\0',NULL,NULL,NULL),(74,12,2,2,13,'2014-12-26 13:24:55','2015-01-26 14:00:00',1,'\0',NULL,NULL,NULL),(75,7,2,2,13,'2014-12-26 13:26:44','2015-01-26 10:00:00',1,'\0',NULL,NULL,NULL),(76,14,2,2,13,'2014-12-26 16:03:57','2015-01-26 12:00:00',0,'\0',NULL,NULL,NULL),(77,14,1,1,1,'2015-01-01 13:12:49','2015-02-03 11:00:00',0,'\0',NULL,NULL,NULL),(78,1,2,2,13,'2015-01-05 21:15:19','2015-02-05 10:00:00',1,'\0',NULL,NULL,NULL),(79,9,1,1,1,'2015-01-05 21:30:16','2015-02-05 11:00:00',1,'\0',NULL,NULL,NULL),(80,4,1,1,1,'2015-01-05 21:34:56','2015-02-05 13:00:00',1,'\0',NULL,NULL,NULL),(81,10,3,3,32,'2015-01-05 21:37:42','2015-02-12 14:00:00',0,'\0',NULL,NULL,NULL),(82,16,2,2,13,'2015-01-10 13:08:45','2015-02-10 12:00:00',0,'\0',NULL,NULL,NULL),(83,1,2,2,13,'2015-01-10 13:22:55','2015-02-12 17:00:00',0,'\0',NULL,NULL,NULL),(84,4,1,1,1,'2015-01-10 14:39:55','2015-02-11 13:00:00',1,'\0',NULL,NULL,NULL),(85,10,1,1,1,'2015-01-11 11:36:33','2015-02-11 14:00:00',1,'\0',NULL,NULL,NULL),(86,1,1,1,1,'2015-01-18 17:12:57','2015-02-18 11:00:00',1,'\0','bon client\r\n','5',55);
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wine_brands`
--

DROP TABLE IF EXISTS `wine_brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wine_brands` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wine_brands`
--

LOCK TABLES `wine_brands` WRITE;
/*!40000 ALTER TABLE `wine_brands` DISABLE KEYS */;
INSERT INTO `wine_brands` VALUES (1,'Cru Select',''),(2,'Grand Cru',''),(3,'Cellier Classique','');
/*!40000 ALTER TABLE `wine_brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wine_categories`
--

DROP TABLE IF EXISTS `wine_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wine_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `cost` decimal(10,2) DEFAULT NULL,
  `step` int(11) DEFAULT NULL,
  `days` int(11) DEFAULT NULL,
  `symbol` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wine_categories`
--

LOCK TABLES `wine_categories` WRITE;
/*!40000 ALTER TABLE `wine_categories` DISABLE KEYS */;
INSERT INTO `wine_categories` VALUES (1,'4 Blanc',44.00,1,0,'W\r'),(2,'4 Blanc',44.00,2,6,'W\r'),(3,'4 Blanc',44.00,5,18,'W\r'),(4,'4 Blanc',44.00,6,18,'W\r'),(5,'4 Blanc',44.00,11,25,'W\r'),(6,'4 Blanc',44.00,12,31,'W\r'),(7,'4 Rose',44.00,1,0,'S\r'),(8,'4 Rose',44.00,2,6,'S\r'),(9,'4 Rose',44.00,5,18,'S\r'),(10,'4 Rose',44.00,6,18,'S\r'),(11,'4 Rose',44.00,11,25,'S\r'),(12,'4 Rose',44.00,12,31,'S\r'),(13,'4 Rouge',44.00,1,0,'R\r'),(14,'4 Rouge',44.00,2,6,'R\r'),(15,'4 Rouge',44.00,5,18,'R\r'),(16,'4 Rouge',44.00,6,18,'R\r'),(17,'4 Rouge',44.00,8,0,'R\r'),(18,'4 Rouge',44.00,11,25,'R\r'),(19,'4 Rouge',44.00,12,31,'R\r'),(20,'5 Blanc',48.00,1,0,'W\r'),(21,'5 Blanc',48.00,2,6,'W\r'),(22,'5 Blanc',48.00,5,18,'W\r'),(23,'5 Blanc',48.00,6,18,'W\r'),(24,'5 Blanc',48.00,11,31,'W\r'),(25,'5 Blanc',48.00,12,38,'W\r'),(26,'5 Rose',48.00,1,0,'S\r'),(27,'5 Rose',48.00,2,6,'S\r'),(28,'5 Rose',48.00,5,18,'S\r'),(29,'5 Rose',48.00,6,18,'S\r'),(30,'5 Rose',48.00,11,31,'S\r'),(31,'5 Rose',48.00,12,38,'S\r'),(32,'5 Rouge',48.00,1,0,'R\r'),(33,'5 Rouge',48.00,2,14,'R\r'),(34,'5 Rouge',48.00,5,24,'R\r'),(35,'5 Rouge',48.00,6,24,'R\r'),(36,'5 Rouge',48.00,8,0,'R\r'),(37,'5 Rouge',48.00,11,31,'R\r'),(38,'5 Rouge',48.00,12,38,'R\r'),(39,'6 Blanc',54.00,1,0,'W\r'),(40,'6 Blanc',54.00,2,6,'W\r'),(41,'6 Blanc',54.00,5,24,'W\r'),(42,'6 Blanc',54.00,6,24,'W\r'),(43,'6 Blanc',54.00,11,38,'W\r'),(44,'6 Blanc',54.00,12,44,'W\r'),(45,'6 Rose',54.00,1,0,'S\r'),(46,'6 Rose',54.00,2,6,'S\r'),(47,'6 Rose',54.00,5,24,'S\r'),(48,'6 Rose',54.00,6,24,'S\r'),(49,'6 Rose',54.00,11,38,'S\r'),(50,'6 Rose',54.00,12,44,'S\r'),(51,'6 Rouge',54.00,1,0,'R\r'),(52,'6 Rouge',54.00,2,14,'R\r'),(53,'6 Rouge',54.00,5,24,'R\r'),(54,'6 Rouge',54.00,6,24,'R\r'),(55,'6 Rouge',54.00,8,0,'R\r'),(56,'6 Rouge',54.00,11,38,'R\r'),(57,'6 Rouge',54.00,12,44,'R\r'),(58,'Bi',20.00,1,0,'B\r'),(59,'Bi',20.00,2,3,'B\r'),(60,'Bi',20.00,12,18,'B\r'),(61,'En Primeur R',54.00,1,0,'R\r'),(62,'En Primeur R',54.00,2,14,'R\r'),(63,'En Primeur R',54.00,3,24,'R\r'),(64,'En Primeur R',54.00,5,38,'R\r'),(65,'En Primeur R',54.00,6,38,'R\r'),(66,'En Primeur R',54.00,8,0,'R\r'),(67,'En Primeur R',54.00,9,24,'R\r'),(68,'En Primeur R',54.00,10,38,'R\r'),(69,'En Primeur R',54.00,11,53,'R\r'),(70,'En Primeur R',54.00,12,60,'R\r'),(71,'En Primeur W',54.00,1,0,'W\r'),(72,'En Primeur W',54.00,2,6,'W\r'),(73,'En Primeur W',54.00,3,24,'W\r'),(74,'En Primeur W',54.00,5,38,'W\r'),(75,'En Primeur W',54.00,6,38,'W\r'),(76,'En Primeur W',54.00,9,24,'W\r'),(77,'En Primeur W',54.00,10,38,'W\r'),(78,'En Primeur W',54.00,11,53,'W\r'),(79,'En Primeur W',54.00,12,60,'W\r'),(80,'Fruit Blanc',44.00,1,0,'X\r'),(81,'Fruit Blanc',44.00,2,6,'X\r'),(82,'Fruit Blanc',44.00,5,18,'X\r'),(83,'Fruit Blanc',44.00,6,18,'X\r'),(84,'Fruit Blanc',44.00,11,25,'X\r'),(85,'Fruit Blanc',44.00,12,31,'X\r'),(86,'Fruit Rouge',44.00,1,0,'F\r'),(87,'Fruit Rouge',44.00,2,6,'F\r'),(88,'Fruit Rouge',44.00,5,18,'F\r'),(89,'Fruit Rouge',44.00,6,18,'F\r'),(90,'Fruit Rouge',44.00,11,25,'F\r'),(91,'Fruit Rouge',44.00,12,31,'F\r'),(92,'Ice wine',54.00,1,0,'W\r'),(93,'Ice wine',54.00,2,6,'W\r'),(94,'Ice wine',54.00,5,24,'W\r'),(95,'Ice wine',54.00,6,24,'W\r'),(96,'Ice wine',54.00,7,44,'W\r'),(97,'Ice wine',54.00,11,38,'W\r'),(98,'Ice wine',54.00,12,44,'W\r'),(99,'Icewine RED',54.00,1,0,'R\r'),(100,'Icewine RED',54.00,2,6,'R\r'),(101,'Icewine RED',54.00,5,24,'R\r'),(102,'Icewine RED',54.00,6,24,'R\r'),(103,'Icewine RED',54.00,7,24,'R\r'),(104,'Icewine RED',54.00,11,38,'R\r'),(105,'Icewine RED',54.00,12,44,'R\r'),(106,'Mo',69.00,1,0,'W\r'),(107,'Mo',69.00,2,6,'W\r'),(108,'Mo',69.00,3,21,'W\r'),(109,'Mo',69.00,5,45,'W\r'),(110,'Mo',69.00,6,45,'W\r'),(111,'Mo',69.00,9,45,'W\r'),(112,'Mo',69.00,10,59,'W\r'),(113,'Mo',69.00,11,80,'W\r'),(114,'Mo',69.00,12,87,'W\r'),(115,'Mo',69.00,1,0,'W\r'),(116,'Mo',69.00,2,6,'W\r'),(117,'Mo',69.00,3,21,'W\r'),(118,'Mo',69.00,5,73,'W\r'),(119,'Mo',69.00,6,73,'W\r'),(120,'Mo',69.00,8,0,'W\r'),(121,'Mo',69.00,9,21,'W\r'),(122,'Mo',69.00,10,36,'W\r'),(123,'Mo',69.00,11,80,'W\r'),(124,'Mo',69.00,12,87,'W\r'),(125,'Mo',69.00,1,0,'R\r'),(126,'Mo',69.00,2,6,'R\r'),(127,'Mo',69.00,3,21,'R\r'),(128,'Mo',69.00,5,73,'R\r'),(129,'Mo',69.00,6,73,'R\r'),(130,'Mo',69.00,8,0,'R\r'),(131,'Mo',69.00,9,21,'R\r'),(132,'Mo',69.00,10,36,'R\r'),(133,'Mo',69.00,11,80,'R\r'),(134,'Mo',69.00,12,87,'R\r'),(135,'P',44.00,1,0,'W\r'),(136,'P',44.00,2,6,'W\r'),(137,'P',44.00,5,18,'W\r'),(138,'P',44.00,6,18,'W\r'),(139,'P',44.00,8,0,'W\r'),(140,'P',44.00,9,25,'W\r'),(141,'P',44.00,10,32,'W\r'),(142,'P',44.00,11,25,'W\r'),(143,'P',44.00,12,32,'W\r'),(144,'P',54.00,1,0,'W\r'),(145,'P',54.00,2,6,'W\r'),(146,'P',54.00,5,24,'W\r'),(147,'P',54.00,6,24,'W\r'),(148,'P',54.00,8,0,'W\r'),(149,'P',54.00,9,24,'W\r'),(150,'P',54.00,10,37,'W\r'),(151,'P',54.00,11,38,'W\r'),(152,'P',54.00,12,45,'W\r'),(153,'Petillant Rose 6 sem',54.00,1,0,'S\r'),(154,'Petillant Rose 6 sem',54.00,2,6,'S\r'),(155,'Petillant Rose 6 sem',54.00,5,24,'S\r'),(156,'Petillant Rose 6 sem',54.00,6,24,'S\r'),(157,'Petillant Rose 6 sem',54.00,8,0,'S\r'),(158,'Petillant Rose 6 sem',54.00,9,24,'S\r'),(159,'Petillant Rose 6 sem',54.00,10,37,'S\r'),(160,'Petillant Rose 6 sem',54.00,11,38,'S\r'),(161,'Petillant Rose 6 sem',54.00,12,45,'S\r'),(162,'Porto',54.00,1,0,'R\r'),(163,'Porto',54.00,2,6,'R\r'),(164,'Porto',54.00,5,24,'R\r'),(165,'Porto',54.00,6,24,'R\r'),(166,'Porto',54.00,7,44,'R\r'),(167,'Porto',54.00,11,38,'R\r'),(168,'Porto',54.00,12,44,'R\r'),(169,'Porto Blanc',54.00,1,0,'W\r'),(170,'Porto Blanc',54.00,2,6,'W\r'),(171,'Porto Blanc',54.00,5,24,'W\r'),(172,'Porto Blanc',54.00,6,24,'W\r'),(173,'Porto Blanc',54.00,7,44,'W\r'),(174,'Porto Blanc',54.00,11,38,'W\r'),(175,'Porto Blanc',54.00,12,44,'W\r'),(176,'RQ Skin & oak Stick',54.00,1,0,'RQ\r'),(177,'RQ Skin & oak Stick',54.00,2,14,'RQ\r'),(178,'RQ Skin & oak Stick',54.00,5,24,'RQ\r'),(179,'RQ Skin & oak Stick',54.00,6,24,'RQ\r'),(180,'RQ Skin & oak Stick',54.00,8,0,'RQ\r'),(181,'RQ Skin & oak Stick',54.00,11,38,'RQ\r'),(182,'RQ Skin & oak Stick',54.00,12,44,'RQ\r'),(183,'Vin Doux Blanc',54.00,1,0,'W\r'),(184,'Vin Doux Blanc',54.00,2,6,'W\r'),(185,'Vin Doux Blanc',54.00,5,24,'W\r'),(186,'Vin Doux Blanc',54.00,6,24,'W\r'),(187,'Vin Doux Blanc',54.00,7,24,'W\r'),(188,'Vin Doux Blanc',54.00,11,38,'W\r'),(189,'Vin Doux Blanc',54.00,12,44,'W\r'),(190,'Vinerie',55.00,1,0,'R\r'),(191,'Vinerie',55.00,2,14,'R\r'),(192,'Vinerie',55.00,3,24,'R\r'),(193,'Vinerie',55.00,5,38,'R\r'),(194,'Vinerie',55.00,6,38,'R\r'),(195,'Vinerie',55.00,8,0,'R\r'),(196,'Vinerie',55.00,9,24,'R\r'),(197,'Vinerie',55.00,10,38,'R\r'),(198,'Vinerie',55.00,11,53,'R\r'),(199,'Vinerie',55.00,12,60,'R\r'),(200,'',0.00,0,0,'');
/*!40000 ALTER TABLE `wine_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wine_types`
--

DROP TABLE IF EXISTS `wine_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wine_types` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `active` bit(1) DEFAULT b'1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wine_types`
--

LOCK TABLES `wine_types` WRITE;
/*!40000 ALTER TABLE `wine_types` DISABLE KEYS */;
INSERT INTO `wine_types` VALUES (1,'Sauvignon Blanc',1,1,''),(2,'Barolo',2,13,''),(3,'Cabernet-Sauvignon',3,32,''),(4,'Cabernet-Sauvignon/Merlot',2,32,''),(5,'Chianti',3,51,''),(6,'sdfsd',1,1,'');
/*!40000 ALTER TABLE `wine_types` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-01-18 19:57:04
