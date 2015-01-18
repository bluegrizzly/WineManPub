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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-01-18 17:19:20
