-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: cine
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `cine`
--

DROP DATABASE IF EXISTS `cine`;
CREATE DATABASE `cine`;
USE `cine`;
DROP TABLE IF EXISTS `cine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cine` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `ciudad` varchar(50) DEFAULT NULL,
  `provincia` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cine`
--

LOCK TABLES `cine` WRITE;
/*!40000 ALTER TABLE `cine` DISABLE KEYS */;
INSERT INTO `cine` VALUES (1,'Cines Vistahermosa','C/ Pedro Medario 3','Alicante','Alicante'),(2,'Cines El Salvador','C/ De la Pasa 10','Elche','Alicante'),(3,'Cines Ruzafa','C/ Alan Brito 1','Valencia','Valencia'),(4,'Cines Corea','C/ Edgar Gajo 45','Gandía','Valencia'),(5,'Cines Benlloch','C/ Susana Torio 6','Castellón de la Plana','Castellón'),(6,'Cines Benicasim','C/ Germán Zana 23','Benicasim','Castellón');
/*!40000 ALTER TABLE `cine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra`
--

DROP TABLE IF EXISTS `compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra` (
  `socio` char(9) NOT NULL,
  `entrada` int NOT NULL,
  `descuento_aplicado` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`socio`,`entrada`),
  KEY `entrada` (`entrada`),
  CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`entrada`) REFERENCES `entrada` (`id`),
  CONSTRAINT `compra_ibfk_2` FOREIGN KEY (`socio`) REFERENCES `socio` (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
INSERT INTO `compra` VALUES ('12340000A',154,0.05),('12340000A',535,0.05),('12340000A',559,0.15),('12340000A',841,0.05),('12340000A',896,0.15),('12345678A',144,0.00),('12345678A',257,0.00),('21500123P',19,0.05),('21500123P',43,0.15),('21500123P',84,0.05),('21500123P',133,0.05),('21500123P',157,0.05),('21500123P',236,0.10),('21500123P',385,0.10),('21500123P',397,0.15),('21500123P',474,0.10),('21500123P',643,0.15),('21500123P',739,0.10),('21500123P',822,0.05),('39485729G',57,0.15),('39485729G',75,0.15),('39485729G',169,0.15),('39485729G',202,0.15),('39485729G',266,0.15),('39485729G',384,0.15),('39485729G',541,0.15),('39485729G',574,0.15),('39485729G',585,0.15),('39485729G',786,0.15),('43240000B',69,0.05),('43240000B',818,0.05),('45123467L',298,0.00),('45123467L',623,0.05),('48756900R',240,0.10),('48756900R',260,0.10),('48756900R',295,0.10),('48756900R',411,0.10),('56789209F',315,0.15),('56789209F',856,0.15),('80805553C',379,0.10),('80805553C',393,0.05),('80805553C',469,0.15),('80805553C',713,0.10),('91283712Z',206,0.10),('91283712Z',352,0.10),('91283712Z',432,0.10),('91283712Z',602,0.10);
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrada`
--

DROP TABLE IF EXISTS `entrada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrada` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sesion` int NOT NULL,
  `precio_final` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sesion` (`sesion`),
  CONSTRAINT `entrada_ibfk_1` FOREIGN KEY (`sesion`) REFERENCES `sesion` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=918 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrada`
--

LOCK TABLES `entrada` WRITE;
/*!40000 ALTER TABLE `entrada` DISABLE KEYS */;
INSERT INTO `entrada` VALUES (1,1,6.00),(2,1,6.00),(3,1,6.00),(4,1,6.00),(5,2,7.50),(6,2,7.50),(7,2,7.50),(8,2,7.50),(9,2,7.50),(10,3,4.50),(11,3,4.50),(12,3,4.50),(13,3,4.50),(14,3,4.50),(15,3,4.50),(16,3,4.50),(17,3,4.50),(18,3,4.50),(19,3,4.28),(20,3,4.50),(21,4,7.50),(22,4,7.50),(23,4,7.50),(24,4,7.50),(25,4,7.50),(26,4,7.50),(27,4,7.50),(28,4,7.50),(29,4,7.50),(30,4,7.50),(31,4,7.50),(32,4,7.50),(33,4,7.50),(34,4,7.50),(35,4,7.50),(36,4,7.50),(37,4,7.50),(38,4,7.50),(39,4,7.50),(40,5,6.00),(41,5,6.00),(42,5,6.00),(43,5,5.10),(44,5,6.00),(45,5,6.00),(46,5,6.00),(47,5,6.00),(48,5,6.00),(49,5,6.00),(50,5,6.00),(51,5,6.00),(52,5,6.00),(53,5,6.00),(54,5,6.00),(55,5,6.00),(56,5,6.00),(57,6,5.10),(58,6,6.00),(59,6,6.00),(60,6,6.00),(61,6,5.70),(62,6,6.00),(63,6,6.00),(64,6,6.00),(65,6,6.00),(66,6,6.00),(67,6,6.00),(68,6,6.00),(69,6,5.70),(70,6,6.00),(71,7,7.50),(72,7,7.50),(73,7,7.50),(74,7,7.50),(75,7,6.38),(76,7,7.50),(77,7,7.50),(78,7,7.50),(79,7,7.50),(80,7,7.50),(81,7,7.50),(82,7,7.50),(83,7,7.50),(84,8,7.13),(85,8,7.50),(86,8,7.50),(87,8,7.50),(88,8,7.50),(89,8,7.50),(90,8,7.50),(91,8,7.50),(92,8,7.50),(93,8,7.50),(94,8,7.50),(95,8,7.50),(96,8,7.50),(97,9,6.00),(98,9,6.00),(99,9,6.00),(100,9,6.00),(101,9,6.00),(102,9,6.00),(103,9,6.00),(104,10,6.00),(105,10,6.00),(106,10,6.00),(107,10,6.00),(108,10,6.00),(109,10,6.00),(110,10,6.00),(111,10,6.00),(112,10,6.00),(113,10,6.00),(114,10,6.00),(115,10,6.00),(116,10,6.00),(117,11,6.00),(118,11,6.00),(119,11,6.00),(120,11,6.00),(121,11,6.00),(122,11,6.00),(123,11,6.00),(124,11,6.00),(125,11,6.00),(126,11,6.00),(127,12,6.00),(128,12,6.00),(129,12,6.00),(130,12,6.00),(131,12,6.00),(132,12,6.00),(133,12,5.70),(134,12,6.00),(135,12,6.00),(136,12,6.00),(137,12,6.00),(138,12,6.00),(139,12,6.00),(140,13,7.50),(141,13,7.50),(142,13,7.50),(143,13,7.50),(144,13,7.50),(145,13,7.50),(146,13,7.50),(147,13,7.50),(148,13,7.50),(149,13,7.50),(150,13,7.50),(151,14,6.00),(152,14,6.00),(153,14,6.00),(154,14,5.70),(155,15,4.50),(156,15,4.50),(157,15,4.07),(158,15,4.50),(159,15,4.50),(160,15,4.50),(161,15,4.50),(162,15,4.50),(163,15,4.50),(164,16,6.00),(165,16,6.00),(166,16,6.00),(167,16,6.00),(168,16,6.00),(169,16,5.10),(170,16,NULL),(171,16,6.00),(172,16,6.00),(173,16,6.00),(174,17,7.50),(175,17,7.50),(176,17,7.50),(177,17,7.50),(178,17,7.50),(179,17,7.50),(180,17,7.50),(181,17,7.50),(182,17,7.50),(183,18,4.50),(184,18,4.50),(185,18,4.50),(186,18,4.50),(187,18,4.50),(188,18,4.50),(189,18,4.50),(190,18,4.50),(191,18,4.50),(192,18,4.50),(193,18,4.50),(194,18,4.50),(195,18,NULL),(196,18,4.50),(197,18,4.50),(198,18,4.50),(199,18,4.50),(200,18,4.50),(201,18,4.50),(202,18,3.83),(203,18,4.50),(204,19,7.50),(205,19,7.50),(206,19,6.75),(207,19,7.50),(208,19,7.50),(209,19,7.50),(210,19,7.50),(211,19,7.50),(212,19,7.50),(213,19,7.50),(214,19,7.50),(215,19,7.50),(216,19,7.50),(217,19,7.50),(218,19,7.50),(219,19,7.50),(220,19,7.50),(221,19,7.50),(222,19,7.50),(223,19,7.50),(224,19,7.50),(225,19,7.50),(226,20,6.00),(227,20,6.00),(228,20,6.00),(229,20,6.00),(230,20,6.00),(231,20,6.00),(232,20,6.00),(233,20,6.00),(234,20,6.00),(235,20,6.00),(236,20,5.40),(237,20,6.00),(238,20,6.00),(239,20,6.00),(240,20,5.40),(241,20,6.00),(242,20,6.00),(243,20,6.00),(244,20,6.00),(245,20,6.00),(246,20,6.00),(247,20,6.00),(248,20,6.00),(249,20,6.00),(250,20,6.00),(251,20,6.00),(252,21,6.00),(253,21,6.00),(254,21,6.00),(255,21,6.00),(256,21,6.00),(257,21,6.00),(258,21,6.00),(259,21,6.00),(260,21,5.40),(261,21,6.00),(262,21,6.00),(263,21,6.00),(264,21,6.00),(265,21,6.00),(266,21,5.10),(267,21,6.00),(268,21,6.00),(269,21,6.00),(270,21,6.00),(271,21,6.00),(272,22,7.50),(273,22,7.50),(274,22,7.50),(275,22,7.50),(276,22,7.50),(277,22,7.50),(278,22,7.50),(279,22,7.50),(280,22,7.50),(281,22,7.50),(282,22,7.50),(283,22,7.50),(284,22,7.50),(285,22,7.50),(286,22,7.50),(287,22,7.50),(288,23,7.50),(289,23,7.50),(290,23,7.50),(291,23,7.50),(292,23,7.50),(293,23,7.50),(294,23,7.50),(295,23,6.75),(296,23,7.50),(297,23,7.50),(298,23,7.50),(299,23,7.50),(300,23,7.50),(301,23,7.50),(302,23,7.50),(303,23,7.50),(304,23,7.50),(305,24,6.00),(306,24,6.00),(307,24,6.00),(308,24,6.00),(309,24,6.00),(310,24,6.00),(311,24,6.00),(312,24,6.00),(313,24,6.00),(314,24,6.00),(315,24,5.10),(316,24,6.00),(317,24,6.00),(318,24,6.00),(319,24,6.00),(320,24,6.00),(321,24,6.00),(322,24,6.00),(323,25,6.00),(324,25,6.00),(325,25,6.00),(326,25,6.00),(327,25,6.00),(328,25,6.00),(329,25,6.00),(330,25,6.00),(331,25,6.00),(332,25,6.00),(333,25,6.00),(334,25,6.00),(335,25,6.00),(336,25,6.00),(337,25,6.00),(338,25,6.00),(339,25,6.00),(340,25,6.00),(341,25,6.00),(342,25,6.00),(343,25,6.00),(344,25,6.00),(345,25,6.00),(346,25,6.00),(347,25,6.00),(348,25,6.00),(349,26,6.00),(350,26,6.00),(351,26,6.00),(352,26,5.40),(353,26,6.00),(354,26,6.00),(355,26,6.00),(356,26,6.00),(357,26,6.00),(358,26,6.00),(359,26,6.00),(360,26,6.00),(361,26,6.00),(362,26,6.00),(363,26,6.00),(364,26,6.00),(365,27,4.50),(366,27,4.50),(367,27,4.50),(368,27,4.50),(369,27,4.50),(370,27,4.50),(371,27,4.50),(372,27,4.50),(373,27,4.50),(374,27,4.50),(375,27,4.50),(376,27,4.50),(377,27,4.50),(378,27,4.50),(379,27,4.05),(380,27,4.50),(381,27,4.50),(382,27,4.50),(383,27,4.50),(384,27,3.83),(385,27,4.05),(386,27,4.50),(387,27,4.50),(388,27,4.50),(389,28,6.00),(390,28,6.00),(391,28,6.00),(392,28,6.00),(393,28,5.70),(394,28,6.00),(395,28,6.00),(396,28,6.00),(397,28,5.10),(398,28,6.00),(399,28,6.00),(400,28,6.00),(401,28,6.00),(402,28,6.00),(403,28,6.00),(404,28,6.00),(405,28,6.00),(406,28,6.00),(407,28,6.00),(408,28,6.00),(409,28,6.00),(410,28,6.00),(411,28,5.40),(412,28,6.00),(413,28,6.00),(414,28,6.00),(415,28,6.00),(416,28,6.00),(417,28,6.00),(418,28,6.00),(419,29,4.50),(420,29,4.50),(421,29,4.50),(422,29,4.50),(423,29,4.50),(424,29,4.50),(425,29,4.50),(426,29,4.50),(427,29,4.50),(428,29,4.50),(429,29,4.50),(430,29,4.50),(431,29,4.50),(432,29,4.05),(433,29,4.50),(434,29,4.50),(435,29,4.50),(436,30,6.00),(437,30,6.00),(438,30,6.00),(439,30,6.00),(440,30,6.00),(441,30,6.00),(442,30,6.00),(443,30,6.00),(444,30,6.00),(445,30,6.00),(446,30,6.00),(447,30,6.00),(448,30,6.00),(449,31,4.50),(450,31,4.50),(451,31,4.50),(452,31,4.50),(453,31,4.50),(454,31,4.50),(455,31,4.50),(456,31,4.50),(457,31,4.50),(458,31,4.50),(459,31,4.50),(460,31,4.50),(461,32,4.50),(462,32,4.50),(463,32,4.50),(464,32,4.50),(465,32,4.50),(466,32,4.50),(467,32,NULL),(468,32,4.50),(469,32,3.83),(470,33,6.00),(471,33,6.00),(472,33,NULL),(473,33,6.00),(474,33,5.40),(475,33,6.00),(476,33,6.00),(477,33,6.00),(478,33,6.00),(479,33,6.00),(480,33,6.00),(481,33,6.00),(482,33,6.00),(483,33,6.00),(484,34,4.50),(485,34,4.50),(486,34,4.50),(487,34,4.50),(488,34,4.50),(489,34,4.50),(490,34,4.50),(491,34,4.50),(492,34,4.50),(493,34,4.50),(494,34,4.50),(495,34,4.50),(496,34,4.50),(497,34,4.50),(498,34,4.50),(499,34,4.50),(500,34,4.50),(501,34,4.50),(502,34,4.50),(503,34,4.50),(504,34,4.50),(505,34,4.50),(506,34,4.50),(507,34,4.50),(508,34,4.50),(509,34,4.50),(510,34,4.50),(511,34,4.50),(512,34,4.50),(513,34,4.50),(514,35,7.50),(515,35,7.50),(516,35,7.50),(517,35,7.50),(518,35,7.50),(519,35,7.50),(520,35,7.50),(521,35,7.50),(522,35,7.50),(523,35,7.50),(524,35,7.50),(525,35,7.50),(526,35,7.50),(527,35,7.50),(528,35,7.50),(529,35,7.50),(530,35,7.50),(531,35,7.50),(532,35,7.50),(533,35,7.50),(534,35,7.50),(535,35,7.13),(536,35,7.50),(537,35,7.50),(538,35,7.50),(539,35,7.50),(540,35,7.50),(541,36,5.10),(542,36,6.00),(543,36,6.00),(544,36,6.00),(545,36,NULL),(546,36,6.00),(547,36,6.00),(548,36,6.00),(549,36,6.00),(550,36,6.00),(551,36,6.00),(552,36,6.00),(553,36,6.00),(554,36,6.00),(555,36,6.00),(556,36,6.00),(557,36,6.00),(558,36,6.00),(559,37,6.38),(560,37,7.50),(561,37,7.50),(562,37,7.50),(563,37,7.50),(564,37,7.50),(565,37,7.50),(566,37,7.50),(567,37,7.50),(568,37,7.50),(569,37,7.50),(570,37,7.50),(571,37,7.50),(572,37,7.50),(573,37,7.50),(574,37,6.38),(575,37,7.50),(576,37,7.50),(577,37,7.50),(578,37,7.50),(579,38,6.00),(580,38,6.00),(581,38,6.00),(582,38,6.00),(583,38,6.00),(584,38,6.00),(585,38,5.10),(586,38,6.00),(587,38,6.00),(588,38,6.00),(589,38,6.00),(590,38,6.00),(591,38,6.00),(592,38,6.00),(593,38,6.00),(594,38,6.00),(595,38,6.00),(596,38,6.00),(597,39,6.00),(598,39,6.00),(599,39,6.00),(600,39,6.00),(601,39,6.00),(602,39,5.40),(603,39,6.00),(604,39,6.00),(605,39,6.00),(606,39,6.00),(607,39,6.00),(608,39,6.00),(609,39,6.00),(610,39,6.00),(611,39,6.00),(612,39,6.00),(613,39,6.00),(614,39,6.00),(615,40,7.50),(616,40,7.50),(617,40,7.50),(618,40,7.50),(619,40,7.50),(620,40,7.50),(621,40,7.50),(622,40,7.50),(623,40,7.13),(624,40,7.50),(625,40,7.50),(626,40,7.50),(627,40,7.50),(628,40,7.50),(629,40,7.50),(630,40,7.50),(631,40,7.50),(632,40,7.50),(633,40,7.50),(634,40,7.50),(635,44,6.00),(636,44,6.00),(637,44,6.00),(638,44,6.00),(639,44,6.00),(640,44,6.00),(641,44,6.00),(642,44,6.00),(643,44,5.10),(644,44,6.00),(645,44,6.00),(646,45,4.50),(647,45,4.50),(648,45,4.50),(649,45,4.50),(650,45,4.50),(651,45,4.50),(652,45,4.50),(653,45,4.50),(654,45,4.50),(655,45,4.50),(656,45,4.50),(657,45,4.50),(658,45,4.50),(659,45,4.50),(660,46,10.00),(661,46,10.00),(662,46,10.00),(663,46,10.00),(664,46,10.00),(665,46,10.00),(666,46,10.00),(667,46,10.00),(668,46,10.00),(669,46,10.00),(670,46,10.00),(671,46,10.00),(672,46,10.00),(673,46,10.00),(674,46,10.00),(675,47,4.50),(676,47,4.50),(677,47,4.50),(678,47,4.50),(679,47,4.50),(680,47,4.50),(681,47,4.50),(682,47,4.50),(683,47,4.50),(684,47,4.50),(685,47,4.50),(686,47,4.50),(687,47,4.50),(688,47,4.50),(689,47,4.50),(690,47,4.50),(691,47,4.50),(692,47,4.50),(693,47,4.50),(694,48,8.00),(695,48,8.00),(696,48,8.00),(697,48,8.00),(698,48,8.00),(699,48,8.00),(700,48,8.00),(701,48,8.00),(702,48,8.00),(703,48,8.00),(704,48,8.00),(705,48,8.00),(706,48,8.00),(707,48,8.00),(708,49,7.00),(709,49,7.00),(710,49,7.00),(711,49,7.00),(712,49,7.00),(713,49,6.30),(714,49,7.00),(715,49,7.00),(716,49,7.00),(717,49,7.00),(718,49,7.00),(719,49,7.00),(720,49,7.00),(721,49,7.00),(722,49,7.00),(723,50,6.00),(724,50,6.00),(725,50,6.00),(726,50,6.00),(727,50,6.00),(728,50,6.00),(729,50,6.00),(730,50,6.00),(731,50,6.00),(732,50,6.00),(733,50,6.00),(734,50,6.00),(735,50,6.00),(736,50,6.00),(737,50,6.00),(738,51,4.50),(739,51,4.05),(740,51,4.50),(741,51,4.50),(742,51,4.50),(743,51,4.50),(744,51,4.50),(745,51,4.50),(746,51,4.50),(747,51,4.50),(748,51,4.50),(749,51,4.50),(750,51,4.50),(751,51,4.50),(752,51,4.50),(753,51,4.50),(754,51,4.50),(755,52,6.00),(756,52,6.00),(757,52,6.00),(758,52,6.00),(759,52,6.00),(760,52,6.00),(761,52,6.00),(762,52,6.00),(763,52,6.00),(764,52,6.00),(765,52,6.00),(766,52,6.00),(767,53,NULL),(768,53,6.00),(769,53,6.00),(770,53,6.00),(771,53,6.00),(772,53,6.00),(773,53,6.00),(774,53,6.00),(775,53,6.00),(776,53,6.00),(777,53,6.00),(778,53,6.00),(779,53,6.00),(780,53,6.00),(781,53,6.00),(782,54,5.00),(783,54,5.00),(784,54,5.00),(785,54,5.00),(786,54,4.25),(787,54,5.00),(788,54,5.00),(789,54,5.00),(790,54,5.00),(791,54,5.00),(792,54,5.00),(793,54,5.00),(794,54,5.00),(795,54,5.00),(796,54,5.00),(797,54,5.00),(798,55,6.00),(799,55,6.00),(800,55,6.00),(801,55,6.00),(802,55,6.00),(803,55,6.00),(804,55,6.00),(805,55,6.00),(806,55,6.00),(807,55,6.00),(808,55,6.00),(809,55,6.00),(810,55,6.00),(811,55,6.00),(812,56,5.00),(813,56,5.00),(814,56,5.00),(815,56,5.00),(816,56,5.00),(817,56,5.00),(818,56,4.75),(819,56,5.00),(820,56,5.00),(821,56,5.00),(822,56,4.75),(823,56,5.00),(824,56,5.00),(825,56,5.00),(826,56,5.00),(827,57,6.00),(828,57,6.00),(829,57,6.00),(830,57,6.00),(831,57,6.00),(832,57,6.00),(833,57,6.00),(834,57,6.00),(835,57,6.00),(836,57,6.00),(837,57,6.00),(838,57,6.00),(839,57,6.00),(840,57,6.00),(841,57,5.70),(842,57,6.00),(843,58,6.00),(844,58,6.00),(845,58,6.00),(846,58,6.00),(847,58,NULL),(848,58,6.00),(849,58,6.00),(850,58,6.00),(851,58,NULL),(852,58,6.00),(853,58,6.00),(854,58,6.00),(855,58,6.00),(856,58,5.10),(857,59,6.00),(858,59,6.00),(859,59,6.00),(860,59,6.00),(861,59,6.00),(862,59,6.00),(863,59,6.00),(864,59,6.00),(865,59,6.00),(866,59,6.00),(867,59,6.00),(868,59,6.00),(869,59,6.00),(870,59,6.00),(871,59,6.00),(872,59,6.00),(873,59,6.00),(874,59,6.00),(875,59,6.00),(876,60,5.00),(877,60,5.00),(878,60,5.00),(879,60,5.00),(880,60,5.00),(881,60,5.00),(882,60,5.00),(883,60,5.00),(884,60,5.00),(885,60,5.00),(886,60,5.00),(887,60,5.00),(888,60,5.00),(889,60,5.00),(890,60,5.00),(891,60,5.00),(892,60,5.00),(893,60,5.00),(894,60,5.00),(895,60,5.00),(896,60,4.25),(897,60,5.00),(898,60,5.00),(899,60,5.00),(900,60,5.00),(901,60,5.00),(902,60,5.00),(903,60,5.00),(904,60,5.00),(905,60,5.00),(906,60,5.00),(907,60,5.00),(908,60,5.00),(909,60,5.00),(910,60,5.00),(911,60,5.00),(912,60,5.00),(913,60,5.00),(914,60,5.00),(915,60,5.00),(916,60,5.00),(917,60,5.00);
/*!40000 ALTER TABLE `entrada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipa`
--

DROP TABLE IF EXISTS `equipa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipa` (
  `sala` int NOT NULL,
  `equipamiento` int NOT NULL,
  PRIMARY KEY (`sala`,`equipamiento`),
  KEY `equipamiento` (`equipamiento`),
  CONSTRAINT `equipa_ibfk_1` FOREIGN KEY (`sala`) REFERENCES `sala` (`id`),
  CONSTRAINT `equipa_ibfk_2` FOREIGN KEY (`equipamiento`) REFERENCES `equipamiento` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipa`
--

LOCK TABLES `equipa` WRITE;
/*!40000 ALTER TABLE `equipa` DISABLE KEYS */;
INSERT INTO `equipa` VALUES (1,1),(6,1),(7,1),(12,1),(19,1),(22,1),(7,2),(19,2),(1,3),(6,3),(7,3),(8,3),(12,3),(15,3),(19,3),(20,3),(21,3),(22,3),(6,4),(19,4);
/*!40000 ALTER TABLE `equipa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipamiento`
--

DROP TABLE IF EXISTS `equipamiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipamiento` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipamiento`
--

LOCK TABLES `equipamiento` WRITE;
/*!40000 ALTER TABLE `equipamiento` DISABLE KEYS */;
INSERT INTO `equipamiento` VALUES (1,'Sonido Dolby Atmos'),(2,'Butacas XXL'),(3,'Proyector 3D'),(4,'IMAX');
/*!40000 ALTER TABLE `equipamiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pelicula`
--

DROP TABLE IF EXISTS `pelicula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pelicula` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(50) DEFAULT NULL,
  `genero` varchar(50) DEFAULT NULL,
  `duracion` int DEFAULT NULL,
  `edad_minima` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelicula`
--

LOCK TABLES `pelicula` WRITE;
/*!40000 ALTER TABLE `pelicula` DISABLE KEYS */;
INSERT INTO `pelicula` VALUES (1,'Regreso al futuro','Ciencia ficción',116,7),(2,'El padrino','Drama',180,13),(3,'Avengers','Acción',180,7),(4,'Interstellar','Ciencia Ficción',169,7),(5,'El resplandor','Terror',146,18),(6,'8 Millas','Musical',110,18),(7,'Dejame salir','Terror',160,18),(8,'Terminator 2','Acción',150,16),(9,'Torrente','Comedia',97,18),(10,'The Irishman','Drama',209,16),(11,'Winx Club 3D: La aventura mágica','Fantasía',87,7),(12,'Maquia, una historia de amor inmortal','Drama',115,16),(13,'Nuevos Mutantes','Superheroes',90,12),(14,'The Irishman','Drama',209,16),(19,'Avatar','Ciencia ficción',162,7),(20,'Blade Runner','Ciencia Ficción',117,16),(21,'Lego Las Aventuras de Clutch Powers','Aventuras',82,3),(22,'Black hawk down','Acción',116,18);
/*!40000 ALTER TABLE `pelicula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sala`
--

DROP TABLE IF EXISTS `sala`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sala` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cine` int NOT NULL,
  `numero` int DEFAULT NULL,
  `aforo` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cine` (`cine`),
  CONSTRAINT `sala_ibfk_1` FOREIGN KEY (`cine`) REFERENCES `cine` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sala`
--

LOCK TABLES `sala` WRITE;
/*!40000 ALTER TABLE `sala` DISABLE KEYS */;
INSERT INTO `sala` VALUES (1,1,1,100),(2,1,2,70),(3,1,3,70),(4,1,4,50),(5,1,5,50),(6,2,1,120),(7,2,2,100),(8,2,3,70),(9,2,4,70),(10,2,5,50),(11,2,6,50),(12,3,1,100),(13,3,2,55),(14,3,3,45),(15,4,1,70),(16,4,2,70),(17,4,3,50),(18,4,4,50),(19,5,1,150),(20,5,2,75),(21,5,3,50),(22,6,1,75),(23,6,2,70),(24,6,3,50),(25,6,4,45);
/*!40000 ALTER TABLE `sala` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sesion`
--

DROP TABLE IF EXISTS `sesion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sesion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sala` int NOT NULL,
  `pelicula` int NOT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `precio_base` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sala` (`sala`),
  KEY `pelicula` (`pelicula`),
  CONSTRAINT `sesion_ibfk_1` FOREIGN KEY (`sala`) REFERENCES `sala` (`id`),
  CONSTRAINT `sesion_ibfk_2` FOREIGN KEY (`pelicula`) REFERENCES `pelicula` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sesion`
--

LOCK TABLES `sesion` WRITE;
/*!40000 ALTER TABLE `sesion` DISABLE KEYS */;
INSERT INTO `sesion` VALUES (1,3,7,'2021-02-08','21:30:00',6.00),(2,1,1,'2021-02-07','18:00:00',7.50),(3,1,2,'2021-02-10','17:00:00',4.50),(4,12,11,'2021-08-07','18:00:00',7.50),(5,18,2,'2021-02-09','21:30:00',6.00),(6,25,12,'2021-02-09','19:30:00',6.00),(7,18,3,'2021-03-18','18:00:00',7.50),(8,20,4,'2021-03-18','22:30:00',7.50),(9,8,4,'2021-02-08','21:30:00',6.00),(10,5,6,'2021-02-09','19:30:00',6.00),(11,8,5,'2020-08-15','19:30:00',6.00),(12,4,5,'2020-08-13','21:30:00',6.00),(13,3,5,'2020-08-17','18:00:00',7.50),(14,1,6,'2021-02-09','21:30:00',6.00),(15,1,6,'2021-02-10','16:30:00',4.50),(16,2,1,'2020-01-12','17:30:00',6.00),(17,19,8,'2021-01-12','18:00:00',7.50),(18,14,8,'2021-01-17','21:30:00',4.50),(19,22,10,'2021-02-12','22:30:00',7.50),(20,9,14,'2021-02-08','19:30:00',6.00),(21,24,13,'2021-02-08','19:30:00',6.00),(22,7,5,'2021-10-10','20:30:00',7.50),(23,9,8,'2021-10-10','22:30:00',7.50),(24,5,4,'2021-02-09','19:30:00',6.00),(25,3,1,'2021-02-09','21:30:00',6.00),(26,1,4,'2021-05-27','19:30:00',6.00),(27,5,6,'2021-07-30','16:30:00',4.50),(28,5,11,'2021-02-15','19:30:00',6.00),(29,13,2,'2021-02-17','16:30:00',4.50),(30,1,3,'2021-02-09','19:30:00',6.00),(31,2,4,'2021-02-10','16:30:00',4.50),(32,4,11,'2021-06-16','19:30:00',4.50),(33,16,6,'2021-03-08','19:30:00',6.00),(34,1,8,'2021-02-10','16:30:00',4.50),(35,2,3,'2021-02-12','18:00:00',7.50),(36,20,1,'2021-02-08','19:30:00',6.00),(37,21,4,'2021-02-07','18:00:00',7.50),(38,1,1,'2021-03-15','19:30:00',6.00),(39,2,1,'2021-03-15','21:30:00',6.00),(40,24,1,'2021-01-24','19:30:00',7.50),(41,10,3,'2021-02-09','19:30:00',6.00),(44,1,13,'2021-03-23','19:30:00',6.00),(45,2,8,'2021-03-24','21:30:00',4.50),(46,2,14,'2021-12-20','20:00:00',10.00),(47,1,14,'2021-12-20','18:00:00',4.50),(48,10,3,'2021-05-05','18:25:00',8.00),(49,25,8,'2021-06-14','19:15:00',7.00),(50,7,21,'2021-02-23','19:30:00',6.00),(51,21,7,'2021-02-10','21:30:00',4.50),(52,1,1,'2020-05-11','21:30:00',6.00),(53,1,2,'2021-05-13','21:30:00',6.00),(54,5,4,'2021-02-14','16:30:00',5.00),(55,14,3,'2021-01-12','19:30:00',6.00),(56,5,4,'2021-02-14','16:30:00',5.00),(57,10,1,'2021-02-19','19:30:00',6.00),(58,10,1,'2021-02-19','19:30:00',6.00),(59,14,3,'2021-01-12','19:30:00',6.00),(60,5,4,'2021-02-14','16:30:00',5.00);
/*!40000 ALTER TABLE `sesion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socio`
--

DROP TABLE IF EXISTS `socio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socio` (
  `dni` char(9) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellidos` varchar(100) DEFAULT NULL,
  `descuento_actual` decimal(2,2) DEFAULT NULL,
  PRIMARY KEY (`dni`),
  CONSTRAINT `socio_chk_1` CHECK (((`descuento_actual` >= 0) and (`descuento_actual` <= 0.2)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socio`
--

LOCK TABLES `socio` WRITE;
/*!40000 ALTER TABLE `socio` DISABLE KEYS */;
INSERT INTO `socio` VALUES ('12340000A','Carla','Smith',0.20),('12345678A','Willyam','Gumshoe Adams',0.15),('12345678G','Jose','Martínez',0.05),('12345678Z','Antonio','Vázquez',0.15),('12546789F','Pepito','García',0.10),('19274917D','Pepe','Lopez Hernández',0.10),('21500123P','Laura','Sánchez Perez',0.20),('39485729G','Rodrigo','Caramanzano Verdí',0.10),('43240000B','Andrés','Fuster Alonso',0.20),('45123467L','Felipe','Luis',0.05),('48756900R','Marco','García',0.10),('56789209F','Figo','García Gutierrez',0.15),('80805553C','Paco','Ramune Kioto',0.20),('87665432C','Matias','González Ramírez',0.10),('91283712Z','Pepe','Ruíz',0.05),('98765432K','Mike','Peterson Jackson',0.20);
/*!40000 ALTER TABLE `socio` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-15 11:58:22

DROP DATABASE IF EXISTS comercio;
CREATE DATABASE comercio;
use comercio;

CREATE TABLE articulo (
    codigo character(8) NOT NULL,
    descripcion character varying(100),
    precio numeric(7,2),
    dto numeric(3,1),
    stock integer,
    stock_min integer,
    CONSTRAINT articulo_dto_ck CHECK (((dto >= (0)) AND (dto <= (80)))),
    CONSTRAINT articulo_stock_ck CHECK ((stock >= stock_min))
);

CREATE TABLE cliente (
    codigo integer NOT NULL,
    nombre character varying(50),
    direccion character varying(50),
    cp character(5),
    municipio character varying(5)
);


CREATE TABLE linea_ticket (
    ticket integer NOT NULL,
    nlinea integer NOT NULL,
    cant integer,
    precio numeric(7,2),
    dto numeric(3,1),
    articulo character(8),
    CONSTRAINT lticket_dto_ck CHECK (((dto >= (0)) AND (dto <= (80))))
);



CREATE TABLE municipio (
    codigo character varying(5) NOT NULL,
    nombre character varying(40),
    provincia character(2) NOT NULL
);


CREATE TABLE provincia (
    codigo character(2) NOT NULL,
    nombre character varying(30)
);



CREATE TABLE ticket (
    codigo integer NOT NULL,
    fecha date,
    iva numeric(3,1) DEFAULT 21,
    dto numeric(3,1),
    cliente integer,
    vendedor integer,
    CONSTRAINT ticket_dto_ck CHECK (((dto >= (0)) AND (dto <= (80))))
);



CREATE TABLE vendedor (
    codigo integer NOT NULL,
    nombre character varying(50),
    direccion character varying(50),
    cp character(5),
    municipio character varying(5),
    jefe integer
);



INSERT INTO articulo VALUES ('SEG00001', 'Armero Athenas Arma Corta Alta ', 975.00, 0.0, 5, 3);
INSERT INTO articulo VALUES ('SEG00002', 'Armero Gredos 100-7 Arma Larga', 675.00, 3.0, 4, 4);
INSERT INTO articulo VALUES ('SEG00003', 'Caja Fuerte Camuflada Box-In 22100-S1', 196.00, 10.0, 23, 15);
INSERT INTO articulo VALUES ('SEG00004', 'Caja Fuerte Camuflada GRID 13000W-S0', 85.00, 0.0, 15, 10);
INSERT INTO articulo VALUES ('SEG00005', 'Caja Fuerte Camuflada GRID 13000-WS1', 110.00, 3.0, 16, 11);
INSERT INTO articulo VALUES ('SEG00006', 'Caja Fuerte Camuflada Libro', 18.90, 0.0, 24, 13);
INSERT INTO articulo VALUES ('ESC00001', 'Escalera aluminio 4 peldaños', 28.95, 0.0, 17, 11);
INSERT INTO articulo VALUES ('ESC00002', 'Escalera articulada multifunción acero', 49.95, 0.0, 22, 13);
INSERT INTO articulo VALUES ('ESC00003', 'Escalera industrial 2x10 aluminio', 124.55, 0.0, 28, 15);
INSERT INTO articulo VALUES ('ESC00004', 'Taburete aluminio. 2 p', 41.25, 0.0, 22, 14);
INSERT INTO articulo VALUES ('ESC00005', 'Taburete aluminio 2 peldaños', 31.25, 3.0, 18, 9);
INSERT INTO articulo VALUES ('TOR00001', 'Alcayata galvanizada', 2.25, 0.0, 49, 26);
INSERT INTO articulo VALUES ('TOR00002', 'Ángulo zincado', 0.79, 0.0, 24, 24);
INSERT INTO articulo VALUES ('TOR00003', 'Ángulo zincado canto cuadrado', 0.19, 0.0, 58, 35);
INSERT INTO articulo VALUES ('TOR00004', 'Atado 2 ángulos zincados', 0.99, 0.0, 48, 27);
INSERT INTO articulo VALUES ('TOR00005', 'Atado 2 ángulos zincados', 3.09, 0.0, 43, 33);
INSERT INTO articulo VALUES ('TOR00006', 'Atado 4 ángulos', 1.99, 0.0, 55, 29);
INSERT INTO articulo VALUES ('TOR00007', 'Atado 4 escuadras', 1.20, 0.0, 40, 22);
INSERT INTO articulo VALUES ('TOR00008', 'Atado 4 placas', 2.19, 0.0, 60, 33);
INSERT INTO articulo VALUES ('TOR00009', 'Escuadra zincada canto cuadrado', 0.29, 0.0, 36, 34);
INSERT INTO articulo VALUES ('TOR00010', 'Hembrilla abierta galvanizada', 2.10, 0.0, 46, 34);
INSERT INTO articulo VALUES ('TOR00011', 'Hembrilla abierta galvanizada', 2.25, 0.0, 75, 39);
INSERT INTO articulo VALUES ('CAR00001', 'Carretilla de transporte plegable', 29.98, 0.0, 26, 13);
INSERT INTO articulo VALUES ('CAR00002', 'Carro de transporte ts 850', 102.95, 0.0, 16, 9);
INSERT INTO articulo VALUES ('CAR00003', 'Carretilla plegable 90 kg', 41.98, 0.0, 14, 11);
INSERT INTO articulo VALUES ('MAN00001', 'Aldaba', 3.19, 0.0, 46, 30);
INSERT INTO articulo VALUES ('MAN00002', 'Juego manilla con placa inox', 12.98, 0.0, 27, 14);
INSERT INTO articulo VALUES ('MAN00003', 'Juego manilla con roseta niquel mate', 12.10, 0.0, 27, 15);
INSERT INTO articulo VALUES ('MAN00004', 'Mirilla', 5.69, 0.0, 18, 15);
INSERT INTO articulo VALUES ('MAN00005', 'Mirilla Digital LCD 2,6'' (6,60 cm)', 49.95, 0.0, 17, 9);
INSERT INTO articulo VALUES ('MAN00006', 'Tirador especial placa forja', 8.20, 0.0, 16, 13);
INSERT INTO articulo VALUES ('MAN00007', 'Tirador salomonico placa forja', 8.75, 0.0, 15, 11);
INSERT INTO articulo VALUES ('CUB00001', 'Armario metal para reciclaje basura', 132.00, 0.0, 21, 14);
INSERT INTO articulo VALUES ('CUB00002', 'Armario metal 2 compartimentos blanco', 95.00, 3.0, 12, 9);
INSERT INTO articulo VALUES ('CUB00003', 'Barreño industrial', 18.65, 10.0, 23, 14);
INSERT INTO articulo VALUES ('CUB00004', 'Bolsas de basura con cierra fácil', 1.75, 3.0, 50, 36);
INSERT INTO articulo VALUES ('CUB00005', 'Contenedor selectivo c/ruedas', 31.75, 0.0, 14, 11);
INSERT INTO articulo VALUES ('CUB00006', 'Cubo decobin 40l cofee', 32.95, 0.0, 15, 14);
INSERT INTO articulo VALUES ('CUB00007', 'Cubo metalizado', 25.25, 0.0, 19, 15);
INSERT INTO articulo VALUES ('TEN00001', 'Tendedero extensible plastf. bco. 120C', 65.90, 0.0, 17, 10);
INSERT INTO articulo VALUES ('TEN00002', 'Tendedero extensible aluminio 160c', 45.15, 3.0, 20, 13);
INSERT INTO articulo VALUES ('TEN00003', 'Tendedero con alas pegasus 120', 34.95, 0.0, 10, 8);
INSERT INTO articulo VALUES ('TEN00004', 'Tendedero automatico', 12.98, 0.0, 15, 10);
INSERT INTO articulo VALUES ('TEN00005', 'Pinza ropa / tendedero (x25)', 5.95, 3.0, 12, 9);
INSERT INTO articulo VALUES ('BUZ00001', 'Buzón chapa acero', 23.50, 0.0, 25, 15);
INSERT INTO articulo VALUES ('BUZ00002', 'Cerradura de buzón (lengüeta recta)', 3.49, 3.0, 22, 20);
INSERT INTO articulo VALUES ('BUZ00003', 'Kit cerradura buzon', 9.20, 3.0, 21, 14);
INSERT INTO articulo VALUES ('INF00001', 'Antideslizantes bañera', 3.90, 0.0, 32, 20);
INSERT INTO articulo VALUES ('INF00002', 'Cierre armarios, gancho', 2.09, 0.0, 27, 23);
INSERT INTO articulo VALUES ('INF00003', 'Cierre flexible pequeño', 1.68, 0.0, 40, 36);
INSERT INTO articulo VALUES ('INF00004', 'Esquinas de mueble', 2.38, 0.0, 41, 34);
INSERT INTO articulo VALUES ('INF00005', 'Protector ángulos marrón', 3.99, 10.0, 44, 26);
INSERT INTO articulo VALUES ('INF00006', 'Protector esquinas infantil', 13.50, 0.0, 11, 9);
INSERT INTO articulo VALUES ('INF00007', 'Seguridad en enchufes, movil', 2.10, 0.0, 36, 31);


--
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cliente VALUES (1, 'Andrés', 'Calle Eleuterio Rincones 3', '12001', 'CSTLL');
INSERT INTO cliente VALUES (2, 'Jonás', 'Pasaje de la Constitución 1', '12540', 'VLLRL');
INSERT INTO cliente VALUES (3, 'Michel', 'Calle de Serrano 23', '12530', 'BRRN');
INSERT INTO cliente VALUES (4, 'Estanislao', 'Avenida de Alicante 45', '12600', 'VLLDX');
INSERT INTO cliente VALUES (5, 'Antolín', 'Plaza de Santa María 2', '12500', 'VNRZ');
INSERT INTO cliente VALUES (6, 'Arlette', 'Calle Málaga 23', '12580', 'BNCRL');
INSERT INTO cliente VALUES (7, 'Ernesto', 'Calle Revilla 23', '12581', 'BNCRL');
INSERT INTO cliente VALUES (8, 'Cintia', 'Plaza del Algarrobo 2', '12002', 'CSTLL');
INSERT INTO cliente VALUES (9, 'Vicente', 'Calle Severo Ochoa 12', '12542', 'VLLRL');
INSERT INTO cliente VALUES (10, 'Antonio', 'Calle San Pedro 34', '46901', 'TRRNT');
INSERT INTO cliente VALUES (11, 'Eva', 'Calle Barcelona 23', '46701', 'GND');
INSERT INTO cliente VALUES (12, 'Isaac', 'Avenida Germanías', '46981', 'PTRN');
INSERT INTO cliente VALUES (13, 'Lucía', 'Calle General Elio 3', '46005', 'VLNC');
INSERT INTO cliente VALUES (14, 'Elena', 'Avenida Peris y Valero 32', '46901', 'TRRNT');
INSERT INTO cliente VALUES (15, 'Raquel', 'Calle Gutenberg 2', '46701', 'GND');
INSERT INTO cliente VALUES (16, 'Sofía', 'Avenida Marconi 23', '46980', 'PTRN');
INSERT INTO cliente VALUES (17, 'Marco', 'Calle Río Tajo 56', '46500', 'SGNT');
INSERT INTO cliente VALUES (18, 'Oliver', 'Calle Utiel 12', '03001', 'LCNT');
INSERT INTO cliente VALUES (19, 'Alba', 'Calle Jabonería Nueva 3', '03203', 'LCH');
INSERT INTO cliente VALUES (20, 'Noemi', 'Plaza Centenar de la Ploma 88', '03181', 'TRRVJ');
INSERT INTO cliente VALUES (21, 'Narciso', 'Calle San Pancracio 17', '03501', 'BNDRM');
INSERT INTO cliente VALUES (22, 'Nadia', 'Calle Doctor Nicasio 43', '03311', 'RHL');
INSERT INTO cliente VALUES (23, 'Esteban', 'Calle Italia 3', '03002', 'LCNT');
INSERT INTO cliente VALUES (24, 'Ricardo', 'Calle San Eleuterio 65', '03203', 'LCH');
INSERT INTO cliente VALUES (25, 'María', 'Calle Menudencia 1', '03181', 'TRRVJ');
INSERT INTO cliente VALUES (26, 'Ernesto', 'Avenida del péndulo, 4', '3181 ', 'TRRVJ');


INSERT INTO linea_ticket VALUES (1, 1, 7, 0.79, 0.0, 'TOR00002');
INSERT INTO linea_ticket VALUES (1, 2, 5, 1.20, 0.0, 'TOR00007');
INSERT INTO linea_ticket VALUES (1, 3, 7, 0.79, 0.0, 'TOR00002');
INSERT INTO linea_ticket VALUES (2, 1, 4, 2.10, 0.0, 'TOR00010');
INSERT INTO linea_ticket VALUES (3, 1, 4, 0.99, 0.0, 'TOR00004');
INSERT INTO linea_ticket VALUES (3, 2, 2, 45.15, 3.0, 'TEN00002');
INSERT INTO linea_ticket VALUES (3, 3, 1, 41.25, 0.0, 'ESC00004');
INSERT INTO linea_ticket VALUES (4, 1, 7, 0.79, 0.0, 'TOR00002');
INSERT INTO linea_ticket VALUES (5, 1, 2, 675.00, 3.0, 'SEG00002');
INSERT INTO linea_ticket VALUES (5, 2, 4, 8.75, 0.0, 'MAN00007');
INSERT INTO linea_ticket VALUES (6, 1, 2, 25.25, 0.0, 'CUB00007');
INSERT INTO linea_ticket VALUES (7, 1, 5, 2.25, 0.0, 'TOR00011');
INSERT INTO linea_ticket VALUES (7, 2, 3, 12.98, 0.0, 'MAN00002');
INSERT INTO linea_ticket VALUES (7, 3, 3, 3.09, 0.0, 'TOR00005');
INSERT INTO linea_ticket VALUES (8, 1, 2, 28.95, 0.0, 'ESC00001');
INSERT INTO linea_ticket VALUES (8, 2, 2, 41.25, 0.0, 'ESC00004');
INSERT INTO linea_ticket VALUES (9, 1, 1, 8.75, 0.0, 'MAN00007');
INSERT INTO linea_ticket VALUES (10, 1, 6, 3.90, 0.0, 'INF00001');
INSERT INTO linea_ticket VALUES (11, 1, 1, 975.00, 0.0, 'SEG00001');
INSERT INTO linea_ticket VALUES (12, 1, 2, 32.95, 0.0, 'CUB00006');
INSERT INTO linea_ticket VALUES (12, 2, 4, 8.75, 0.0, 'MAN00007');
INSERT INTO linea_ticket VALUES (12, 3, 2, 95.00, 3.0, 'CUB00002');
INSERT INTO linea_ticket VALUES (12, 4, 7, 1.75, 3.0, 'CUB00004');
INSERT INTO linea_ticket VALUES (13, 1, 1, 28.95, 0.0, 'ESC00001');
INSERT INTO linea_ticket VALUES (14, 1, 7, 2.10, 0.0, 'INF00007');
INSERT INTO linea_ticket VALUES (15, 1, 1, 675.00, 3.0, 'SEG00002');
INSERT INTO linea_ticket VALUES (16, 1, 6, 1.99, 0.0, 'TOR00006');
INSERT INTO linea_ticket VALUES (17, 1, 7, 0.79, 0.0, 'TOR00002');
INSERT INTO linea_ticket VALUES (17, 2, 1, 975.00, 0.0, 'SEG00001');
INSERT INTO linea_ticket VALUES (17, 3, 1, 49.95, 0.0, 'ESC00002');
INSERT INTO linea_ticket VALUES (18, 1, 5, 3.09, 0.0, 'TOR00005');
INSERT INTO linea_ticket VALUES (18, 2, 1, 975.00, 0.0, 'SEG00001');
INSERT INTO linea_ticket VALUES (18, 3, 5, 0.19, 0.0, 'TOR00003');
INSERT INTO linea_ticket VALUES (18, 4, 2, 95.00, 3.0, 'CUB00002');
INSERT INTO linea_ticket VALUES (19, 1, 1, 110.00, 3.0, 'SEG00005');
INSERT INTO linea_ticket VALUES (20, 1, 2, 102.95, 0.0, 'CAR00002');
INSERT INTO linea_ticket VALUES (21, 1, 1, 29.98, 0.0, 'CAR00001');
INSERT INTO linea_ticket VALUES (22, 1, 1, 23.50, 0.0, 'BUZ00001');
INSERT INTO linea_ticket VALUES (23, 1, 2, 41.98, 0.0, 'CAR00003');
INSERT INTO linea_ticket VALUES (24, 1, 2, 102.95, 0.0, 'CAR00002');
INSERT INTO linea_ticket VALUES (25, 1, 2, 8.20, 0.0, 'MAN00006');
INSERT INTO linea_ticket VALUES (26, 1, 3, 1.68, 0.0, 'INF00003');
INSERT INTO linea_ticket VALUES (27, 1, 3, 8.20, 0.0, 'MAN00006');
INSERT INTO linea_ticket VALUES (27, 2, 3, 13.50, 0.0, 'INF00006');
INSERT INTO linea_ticket VALUES (28, 1, 1, 31.75, 0.0, 'CUB00005');
INSERT INTO linea_ticket VALUES (28, 2, 2, 31.25, 3.0, 'ESC00005');
INSERT INTO linea_ticket VALUES (29, 1, 4, 2.10, 0.0, 'INF00007');
INSERT INTO linea_ticket VALUES (30, 1, 1, 23.50, 0.0, 'BUZ00001');
INSERT INTO linea_ticket VALUES (30, 2, 2, 196.00, 10.0, 'SEG00003');
INSERT INTO linea_ticket VALUES (30, 3, 1, 25.25, 0.0, 'CUB00007');
INSERT INTO linea_ticket VALUES (31, 1, 5, 1.99, 0.0, 'TOR00006');
INSERT INTO linea_ticket VALUES (32, 1, 1, 5.69, 0.0, 'MAN00004');
INSERT INTO linea_ticket VALUES (33, 1, 6, 2.10, 0.0, 'INF00007');
INSERT INTO linea_ticket VALUES (34, 1, 2, 124.55, 0.0, 'ESC00003');
INSERT INTO linea_ticket VALUES (35, 1, 2, 975.00, 0.0, 'SEG00001');
INSERT INTO linea_ticket VALUES (35, 2, 7, 3.19, 0.0, 'MAN00001');
INSERT INTO linea_ticket VALUES (35, 3, 4, 2.25, 0.0, 'TOR00001');
INSERT INTO linea_ticket VALUES (35, 4, 4, 0.99, 0.0, 'TOR00004');
INSERT INTO linea_ticket VALUES (36, 1, 2, 23.50, 0.0, 'BUZ00001');
INSERT INTO linea_ticket VALUES (37, 1, 3, 3.99, 10.0, 'INF00005');
INSERT INTO linea_ticket VALUES (37, 2, 2, 49.95, 0.0, 'MAN00005');
INSERT INTO linea_ticket VALUES (37, 3, 1, 28.95, 0.0, 'ESC00001');
INSERT INTO linea_ticket VALUES (38, 1, 3, 3.19, 0.0, 'MAN00001');
INSERT INTO linea_ticket VALUES (39, 1, 1, 975.00, 0.0, 'SEG00001');
INSERT INTO linea_ticket VALUES (40, 1, 2, 12.98, 0.0, 'TEN00004');
INSERT INTO linea_ticket VALUES (41, 1, 1, 975.00, 0.0, 'SEG00001');
INSERT INTO linea_ticket VALUES (42, 1, 5, 3.99, 10.0, 'INF00005');
INSERT INTO linea_ticket VALUES (43, 1, 1, 196.00, 10.0, 'SEG00003');
INSERT INTO linea_ticket VALUES (43, 2, 2, 9.20, 3.0, 'BUZ00003');
INSERT INTO linea_ticket VALUES (44, 1, 1, 18.65, 10.0, 'CUB00003');
INSERT INTO linea_ticket VALUES (44, 2, 7, 2.19, 0.0, 'TOR00008');
INSERT INTO linea_ticket VALUES (45, 1, 3, 5.69, 0.0, 'MAN00004');
INSERT INTO linea_ticket VALUES (46, 1, 1, 124.55, 0.0, 'ESC00003');
INSERT INTO linea_ticket VALUES (46, 2, 2, 32.95, 0.0, 'CUB00006');
INSERT INTO linea_ticket VALUES (46, 3, 2, 32.95, 0.0, 'CUB00006');
INSERT INTO linea_ticket VALUES (46, 4, 4, 13.50, 0.0, 'INF00006');
INSERT INTO linea_ticket VALUES (47, 1, 7, 1.75, 3.0, 'CUB00004');
INSERT INTO linea_ticket VALUES (47, 2, 4, 1.68, 0.0, 'INF00003');
INSERT INTO linea_ticket VALUES (48, 1, 5, 3.09, 0.0, 'TOR00005');
INSERT INTO linea_ticket VALUES (49, 1, 1, 49.95, 0.0, 'ESC00002');
INSERT INTO linea_ticket VALUES (50, 1, 5, 3.49, 3.0, 'BUZ00002');
INSERT INTO linea_ticket VALUES (51, 1, 1, 29.98, 0.0, 'CAR00001');
INSERT INTO linea_ticket VALUES (52, 1, 5, 3.19, 0.0, 'MAN00001');
INSERT INTO linea_ticket VALUES (53, 1, 1, 12.98, 0.0, 'MAN00002');
INSERT INTO linea_ticket VALUES (54, 1, 4, 18.65, 10.0, 'CUB00003');
INSERT INTO linea_ticket VALUES (55, 1, 4, 0.19, 0.0, 'TOR00003');
INSERT INTO linea_ticket VALUES (55, 2, 2, 41.25, 0.0, 'ESC00004');
INSERT INTO linea_ticket VALUES (56, 1, 1, 34.95, 0.0, 'TEN00003');
INSERT INTO linea_ticket VALUES (57, 1, 1, 29.98, 0.0, 'CAR00001');
INSERT INTO linea_ticket VALUES (57, 2, 7, 2.10, 0.0, 'TOR00010');
INSERT INTO linea_ticket VALUES (57, 3, 7, 2.09, 0.0, 'INF00002');
INSERT INTO linea_ticket VALUES (58, 1, 2, 41.98, 0.0, 'CAR00003');
INSERT INTO linea_ticket VALUES (59, 1, 1, 49.95, 0.0, 'MAN00005');
INSERT INTO linea_ticket VALUES (60, 1, 2, 18.90, 0.0, 'SEG00006');
INSERT INTO linea_ticket VALUES (60, 2, 4, 3.99, 10.0, 'INF00005');
INSERT INTO linea_ticket VALUES (60, 3, 7, 0.29, 0.0, 'TOR00009');
INSERT INTO linea_ticket VALUES (60, 4, 2, 18.90, 0.0, 'SEG00006');
INSERT INTO linea_ticket VALUES (60, 5, 1, 25.25, 0.0, 'CUB00007');
INSERT INTO linea_ticket VALUES (60, 6, 5, 3.09, 0.0, 'TOR00005');
INSERT INTO linea_ticket VALUES (61, 1, 5, 2.25, 0.0, 'TOR00011');
INSERT INTO linea_ticket VALUES (61, 2, 1, 132.00, 0.0, 'CUB00001');
INSERT INTO linea_ticket VALUES (62, 1, 2, 32.95, 0.0, 'CUB00006');
INSERT INTO linea_ticket VALUES (62, 2, 3, 1.99, 0.0, 'TOR00006');
INSERT INTO linea_ticket VALUES (62, 3, 3, 2.19, 0.0, 'TOR00008');
INSERT INTO linea_ticket VALUES (63, 1, 1, 34.95, 0.0, 'TEN00003');
INSERT INTO linea_ticket VALUES (63, 2, 2, 132.00, 0.0, 'CUB00001');
INSERT INTO linea_ticket VALUES (63, 3, 2, 29.98, 0.0, 'CAR00001');
INSERT INTO linea_ticket VALUES (64, 1, 4, 13.50, 0.0, 'INF00006');
INSERT INTO linea_ticket VALUES (64, 2, 3, 5.69, 0.0, 'MAN00004');
INSERT INTO linea_ticket VALUES (64, 3, 6, 1.99, 0.0, 'TOR00006');
INSERT INTO linea_ticket VALUES (64, 4, 3, 3.19, 0.0, 'MAN00001');
INSERT INTO linea_ticket VALUES (64, 5, 4, 12.10, 0.0, 'MAN00003');
INSERT INTO linea_ticket VALUES (64, 6, 2, 28.95, 0.0, 'ESC00001');
INSERT INTO linea_ticket VALUES (64, 7, 7, 1.75, 3.0, 'CUB00004');
INSERT INTO linea_ticket VALUES (65, 1, 1, 5.69, 0.0, 'MAN00004');
INSERT INTO linea_ticket VALUES (66, 1, 2, 102.95, 0.0, 'CAR00002');
INSERT INTO linea_ticket VALUES (67, 1, 5, 0.99, 0.0, 'TOR00004');
INSERT INTO linea_ticket VALUES (68, 1, 2, 102.95, 0.0, 'CAR00002');
INSERT INTO linea_ticket VALUES (69, 1, 2, 675.00, 3.0, 'SEG00002');
INSERT INTO linea_ticket VALUES (70, 1, 1, 196.00, 10.0, 'SEG00003');
INSERT INTO linea_ticket VALUES (71, 1, 3, 9.20, 3.0, 'BUZ00003');
INSERT INTO linea_ticket VALUES (72, 1, 2, 65.90, 0.0, 'TEN00001');
INSERT INTO linea_ticket VALUES (73, 1, 2, 13.50, 0.0, 'INF00006');
INSERT INTO linea_ticket VALUES (74, 1, 1, 12.98, 0.0, 'MAN00002');
INSERT INTO linea_ticket VALUES (74, 2, 2, 85.00, 0.0, 'SEG00004');
INSERT INTO linea_ticket VALUES (74, 3, 3, 9.20, 3.0, 'BUZ00003');
INSERT INTO linea_ticket VALUES (74, 4, 2, 29.98, 0.0, 'CAR00001');
INSERT INTO linea_ticket VALUES (75, 1, 1, 95.00, 3.0, 'CUB00002');
INSERT INTO linea_ticket VALUES (76, 1, 7, 0.29, 0.0, 'TOR00009');
INSERT INTO linea_ticket VALUES (76, 2, 4, 3.09, 0.0, 'TOR00005');
INSERT INTO linea_ticket VALUES (77, 1, 2, 975.00, 0.0, 'SEG00001');
INSERT INTO linea_ticket VALUES (78, 1, 7, 0.19, 0.0, 'TOR00003');
INSERT INTO linea_ticket VALUES (79, 1, 4, 3.99, 10.0, 'INF00005');
INSERT INTO linea_ticket VALUES (80, 1, 1, 675.00, 3.0, 'SEG00002');
INSERT INTO linea_ticket VALUES (80, 2, 2, 45.15, 3.0, 'TEN00002');
INSERT INTO linea_ticket VALUES (81, 1, 2, 41.98, 0.0, 'CAR00003');
INSERT INTO linea_ticket VALUES (82, 1, 3, 0.99, 0.0, 'TOR00004');
INSERT INTO linea_ticket VALUES (83, 1, 1, 196.00, 10.0, 'SEG00003');
INSERT INTO linea_ticket VALUES (84, 1, 1, 41.25, 0.0, 'ESC00004');
INSERT INTO linea_ticket VALUES (84, 2, 6, 2.09, 0.0, 'INF00002');
INSERT INTO linea_ticket VALUES (85, 1, 3, 3.90, 0.0, 'INF00001');
INSERT INTO linea_ticket VALUES (86, 1, 3, 5.69, 0.0, 'MAN00004');
INSERT INTO linea_ticket VALUES (87, 1, 1, 5.69, 0.0, 'MAN00004');
INSERT INTO linea_ticket VALUES (87, 2, 5, 0.79, 0.0, 'TOR00002');
INSERT INTO linea_ticket VALUES (88, 1, 1, 18.90, 0.0, 'SEG00006');
INSERT INTO linea_ticket VALUES (89, 1, 1, 31.25, 3.0, 'ESC00005');
INSERT INTO linea_ticket VALUES (90, 1, 1, 41.25, 0.0, 'ESC00004');
INSERT INTO linea_ticket VALUES (90, 2, 4, 12.98, 0.0, 'MAN00002');
INSERT INTO linea_ticket VALUES (90, 3, 3, 3.19, 0.0, 'MAN00001');
INSERT INTO linea_ticket VALUES (90, 4, 1, 32.95, 0.0, 'CUB00006');
INSERT INTO linea_ticket VALUES (91, 1, 2, 31.75, 0.0, 'CUB00005');
INSERT INTO linea_ticket VALUES (91, 2, 1, 41.98, 0.0, 'CAR00003');
INSERT INTO linea_ticket VALUES (92, 1, 2, 95.00, 3.0, 'CUB00002');
INSERT INTO linea_ticket VALUES (93, 1, 1, 34.95, 0.0, 'TEN00003');
INSERT INTO linea_ticket VALUES (94, 1, 2, 196.00, 10.0, 'SEG00003');
INSERT INTO linea_ticket VALUES (94, 2, 2, 41.25, 0.0, 'ESC00004');
INSERT INTO linea_ticket VALUES (94, 3, 3, 2.09, 0.0, 'INF00002');
INSERT INTO linea_ticket VALUES (95, 1, 2, 65.90, 0.0, 'TEN00001');
INSERT INTO linea_ticket VALUES (96, 1, 2, 28.95, 0.0, 'ESC00001');
INSERT INTO linea_ticket VALUES (97, 1, 1, 124.55, 0.0, 'ESC00003');
INSERT INTO linea_ticket VALUES (98, 1, 3, 2.10, 0.0, 'TOR00010');
INSERT INTO linea_ticket VALUES (98, 2, 5, 3.99, 10.0, 'INF00005');
INSERT INTO linea_ticket VALUES (98, 3, 3, 0.19, 0.0, 'TOR00003');
INSERT INTO linea_ticket VALUES (98, 4, 4, 1.75, 3.0, 'CUB00004');
INSERT INTO linea_ticket VALUES (98, 5, 1, 45.15, 3.0, 'TEN00002');
INSERT INTO linea_ticket VALUES (98, 6, 1, 31.75, 0.0, 'CUB00005');
INSERT INTO linea_ticket VALUES (99, 1, 1, 132.00, 0.0, 'CUB00001');
INSERT INTO linea_ticket VALUES (100, 1, 2, 85.00, 0.0, 'SEG00004');
INSERT INTO linea_ticket VALUES (100, 2, 3, 3.19, 0.0, 'MAN00001');
INSERT INTO linea_ticket VALUES (101, 1, 1, 32.95, 0.0, 'CUB00006');
INSERT INTO linea_ticket VALUES (102, 1, 1, 31.25, 3.0, 'ESC00005');
INSERT INTO linea_ticket VALUES (103, 1, 1, 49.95, 0.0, 'MAN00005');
INSERT INTO linea_ticket VALUES (104, 1, 5, 2.10, 0.0, 'INF00007');
INSERT INTO linea_ticket VALUES (105, 1, 2, 45.15, 3.0, 'TEN00002');
INSERT INTO linea_ticket VALUES (106, 1, 2, 132.00, 0.0, 'CUB00001');
INSERT INTO linea_ticket VALUES (107, 1, 1, 31.75, 0.0, 'CUB00005');
INSERT INTO linea_ticket VALUES (108, 1, 1, 45.15, 3.0, 'TEN00002');
INSERT INTO linea_ticket VALUES (108, 2, 2, 32.50, 2.0, NULL);


--
-- Data for Name: municipio; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO municipio VALUES ('CSTLL', 'Castellón de la Plana', 'CA');
INSERT INTO municipio VALUES ('VLLRL', 'Villarreal', 'CA');
INSERT INTO municipio VALUES ('BRRN', 'Burriana', 'CA');
INSERT INTO municipio VALUES ('VLLDX', 'Vall de Uxó', 'CA');
INSERT INTO municipio VALUES ('VNRZ', 'Vinaroz', 'CA');
INSERT INTO municipio VALUES ('BNCRL', 'Benicarló', 'CA');
INSERT INTO municipio VALUES ('VLNC', 'Valencia', 'VA');
INSERT INTO municipio VALUES ('TRRNT', 'Torrente', 'VA');
INSERT INTO municipio VALUES ('GND', 'Gandía', 'VA');
INSERT INTO municipio VALUES ('PTRN', 'Paterna', 'VA');
INSERT INTO municipio VALUES ('SGNT', 'Sagunto', 'VA');
INSERT INTO municipio VALUES ('LCNT', 'Alicante', 'AL');
INSERT INTO municipio VALUES ('LCH', 'Elche', 'AL');
INSERT INTO municipio VALUES ('TRRVJ', 'Torrevieja', 'AL');
INSERT INTO municipio VALUES ('RHL', 'Orihuela', 'AL');
INSERT INTO municipio VALUES ('BNDRM', 'Benidorm', 'AL');
INSERT INTO municipio VALUES ('LCY', 'Alcoy', 'AL');


--
-- Data for Name: provincia; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO provincia VALUES ('VA', 'Valencia');
INSERT INTO provincia VALUES ('AL', 'Alicante');
INSERT INTO provincia VALUES ('CA', 'Castellón');


--
-- Data for Name: ticket; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO ticket VALUES (1, '2020-07-07', 21.0, 3.0, 1, 5);
INSERT INTO ticket VALUES (2, '2020-10-12', 21.0, 0.0, 16, 3);
INSERT INTO ticket VALUES (3, '2020-11-20', 21.0, 0.0, 21, 1);
INSERT INTO ticket VALUES (4, '2019-02-02', 21.0, 10.0, 2, 6);
INSERT INTO ticket VALUES (5, '2020-01-04', 10.0, 3.0, 19, 1);
INSERT INTO ticket VALUES (6, '2020-05-24', 21.0, 3.0, 23, 2);
INSERT INTO ticket VALUES (7, '2019-06-14', 21.0, 3.0, 3, 5);
INSERT INTO ticket VALUES (8, '2020-12-20', 21.0, 3.0, 11, 4);
INSERT INTO ticket VALUES (9, '2020-08-02', 21.0, 0.0, 21, 1);
INSERT INTO ticket VALUES (10, '2019-08-08', 4.0, 3.0, 25, 1);
INSERT INTO ticket VALUES (11, '2019-02-26', 21.0, 0.0, 16, 3);
INSERT INTO ticket VALUES (12, '2019-01-05', 21.0, 10.0, NULL, NULL);
INSERT INTO ticket VALUES (13, '2020-09-27', 21.0, 10.0, 2, 6);
INSERT INTO ticket VALUES (14, '2019-10-06', 21.0, 0.0, NULL, 5);
INSERT INTO ticket VALUES (15, '2020-02-16', 21.0, 0.0, 25, 1);
INSERT INTO ticket VALUES (16, '2020-10-28', 21.0, 0.0, 1, 5);
INSERT INTO ticket VALUES (17, '2020-07-18', 21.0, 0.0, NULL, 6);
INSERT INTO ticket VALUES (18, '2019-03-07', 21.0, 0.0, NULL, 6);
INSERT INTO ticket VALUES (19, '2019-12-11', 21.0, 0.0, 18, 1);
INSERT INTO ticket VALUES (20, '2019-07-11', 21.0, 0.0, 23, 2);
INSERT INTO ticket VALUES (21, '2019-07-22', 21.0, 0.0, 4, 6);
INSERT INTO ticket VALUES (22, '2019-02-23', 10.0, 0.0, NULL, 1);
INSERT INTO ticket VALUES (23, '2020-12-18', 21.0, 10.0, 2, 5);
INSERT INTO ticket VALUES (24, '2020-04-15', 21.0, 0.0, 19, NULL);
INSERT INTO ticket VALUES (25, '2020-01-02', 21.0, 0.0, 21, 2);
INSERT INTO ticket VALUES (26, '2020-09-23', 21.0, 3.0, NULL, 1);
INSERT INTO ticket VALUES (27, '2020-05-24', 21.0, 3.0, 12, 3);
INSERT INTO ticket VALUES (28, '2019-06-21', 10.0, 0.0, 15, 3);
INSERT INTO ticket VALUES (29, '2020-10-17', 21.0, 0.0, NULL, 4);
INSERT INTO ticket VALUES (30, '2020-07-22', 21.0, 3.0, NULL, 4);
INSERT INTO ticket VALUES (31, '2020-08-26', 21.0, 0.0, 5, 6);
INSERT INTO ticket VALUES (32, '2019-10-18', 21.0, 0.0, 24, 1);
INSERT INTO ticket VALUES (33, '2019-01-25', 21.0, 0.0, NULL, 5);
INSERT INTO ticket VALUES (34, '2019-06-24', 21.0, 10.0, NULL, 5);
INSERT INTO ticket VALUES (35, '2019-03-21', 10.0, 0.0, 1, 5);
INSERT INTO ticket VALUES (36, '2019-04-27', 21.0, 0.0, NULL, 2);
INSERT INTO ticket VALUES (37, '2020-10-07', 21.0, 0.0, NULL, 5);
INSERT INTO ticket VALUES (38, '2019-09-05', 21.0, 0.0, 10, 3);
INSERT INTO ticket VALUES (39, '2020-07-21', 21.0, 0.0, 16, 3);
INSERT INTO ticket VALUES (40, '2019-06-12', 21.0, 0.0, NULL, 4);
INSERT INTO ticket VALUES (41, '2020-09-09', 21.0, 0.0, 23, 1);
INSERT INTO ticket VALUES (42, '2020-07-12', 21.0, 3.0, 2, 5);
INSERT INTO ticket VALUES (43, '2019-05-13', 21.0, 3.0, NULL, 5);
INSERT INTO ticket VALUES (44, '2020-09-10', 21.0, 3.0, 7, 5);
INSERT INTO ticket VALUES (45, '2020-08-04', 21.0, 0.0, NULL, 3);
INSERT INTO ticket VALUES (46, '2019-12-28', 21.0, 0.0, 22, 2);
INSERT INTO ticket VALUES (47, '2020-05-05', 21.0, 3.0, 19, NULL);
INSERT INTO ticket VALUES (48, '2019-01-10', 21.0, 0.0, 18, 1);
INSERT INTO ticket VALUES (49, '2020-08-04', 4.0, 3.0, NULL, 1);
INSERT INTO ticket VALUES (50, '2019-05-22', 21.0, 0.0, NULL, NULL);
INSERT INTO ticket VALUES (51, '2020-09-14', 21.0, 3.0, 6, 6);
INSERT INTO ticket VALUES (52, '2019-08-17', 21.0, 0.0, 20, 1);
INSERT INTO ticket VALUES (53, '2020-03-24', 21.0, 3.0, 25, 2);
INSERT INTO ticket VALUES (54, '2019-08-20', 21.0, 0.0, 7, 5);
INSERT INTO ticket VALUES (55, '2019-06-15', 21.0, 0.0, NULL, 4);
INSERT INTO ticket VALUES (56, '2019-04-09', 10.0, 0.0, NULL, 2);
INSERT INTO ticket VALUES (57, '2020-10-05', 21.0, 3.0, 17, 3);
INSERT INTO ticket VALUES (58, '2019-09-14', 21.0, 3.0, NULL, 4);
INSERT INTO ticket VALUES (59, '2019-06-25', 21.0, 0.0, 7, 6);
INSERT INTO ticket VALUES (60, '2019-05-08', 21.0, 0.0, NULL, 6);
INSERT INTO ticket VALUES (61, '2019-07-13', 21.0, 0.0, NULL, 3);
INSERT INTO ticket VALUES (62, '2019-04-05', 21.0, 0.0, 20, 2);
INSERT INTO ticket VALUES (63, '2020-06-15', 21.0, 0.0, 13, 4);
INSERT INTO ticket VALUES (64, '2020-04-17', 21.0, 0.0, 24, 1);
INSERT INTO ticket VALUES (65, '2020-09-04', 21.0, 0.0, NULL, 6);
INSERT INTO ticket VALUES (66, '2019-11-11', 10.0, 15.0, 21, NULL);
INSERT INTO ticket VALUES (67, '2019-03-01', 21.0, 0.0, NULL, 3);
INSERT INTO ticket VALUES (68, '2020-09-23', 21.0, 0.0, 10, 4);
INSERT INTO ticket VALUES (69, '2020-10-26', 21.0, 0.0, 15, 3);
INSERT INTO ticket VALUES (70, '2019-05-04', 21.0, 0.0, 23, 2);
INSERT INTO ticket VALUES (71, '2019-01-11', 4.0, 0.0, NULL, 1);
INSERT INTO ticket VALUES (72, '2020-04-22', 21.0, 0.0, NULL, 2);
INSERT INTO ticket VALUES (73, '2019-05-25', 21.0, 0.0, 20, 2);
INSERT INTO ticket VALUES (74, '2019-07-19', 21.0, 0.0, 25, 1);
INSERT INTO ticket VALUES (75, '2019-12-01', 21.0, 0.0, NULL, 1);
INSERT INTO ticket VALUES (76, '2019-02-11', 21.0, 15.0, 17, 3);
INSERT INTO ticket VALUES (77, '2019-09-18', 21.0, 3.0, NULL, 6);
INSERT INTO ticket VALUES (78, '2019-12-16', 21.0, 0.0, 13, 4);
INSERT INTO ticket VALUES (79, '2020-07-28', 21.0, 0.0, NULL, 1);
INSERT INTO ticket VALUES (80, '2019-11-21', 10.0, 3.0, NULL, 3);
INSERT INTO ticket VALUES (81, '2019-05-06', 21.0, 10.0, 10, 3);
INSERT INTO ticket VALUES (82, '2020-06-10', 21.0, 0.0, NULL, 1);
INSERT INTO ticket VALUES (83, '2020-08-07', 21.0, 3.0, 22, 1);
INSERT INTO ticket VALUES (84, '2020-07-07', 21.0, 0.0, 20, 1);
INSERT INTO ticket VALUES (85, '2020-03-01', 21.0, 0.0, 24, 2);
INSERT INTO ticket VALUES (86, '2020-07-08', 21.0, 3.0, NULL, 4);
INSERT INTO ticket VALUES (87, '2019-02-26', 21.0, 0.0, 17, NULL);
INSERT INTO ticket VALUES (88, '2019-05-10', 10.0, 0.0, 25, 2);
INSERT INTO ticket VALUES (89, '2019-07-11', 21.0, 3.0, NULL, 1);
INSERT INTO ticket VALUES (90, '2020-01-12', 21.0, 0.0, 8, 6);
INSERT INTO ticket VALUES (91, '2019-12-05', 21.0, 10.0, NULL, 1);
INSERT INTO ticket VALUES (92, '2019-06-01', 4.0, 3.0, 18, 2);
INSERT INTO ticket VALUES (93, '2019-03-13', 10.0, 0.0, 24, 2);
INSERT INTO ticket VALUES (94, '2019-03-02', 21.0, 10.0, NULL, 6);
INSERT INTO ticket VALUES (95, '2020-02-28', 21.0, 0.0, 20, 2);
INSERT INTO ticket VALUES (96, '2019-02-20', 21.0, 0.0, 9, 5);
INSERT INTO ticket VALUES (97, '2019-05-22', 21.0, 3.0, NULL, 2);
INSERT INTO ticket VALUES (98, '2019-10-17', 10.0, 0.0, 14, 4);
INSERT INTO ticket VALUES (99, '2019-10-03', 21.0, 0.0, 8, 6);
INSERT INTO ticket VALUES (100, '2019-08-13', 21.0, 0.0, 22, 1);
INSERT INTO ticket VALUES (101, '2020-08-07', 21.0, 15.0, 18, 2);
INSERT INTO ticket VALUES (102, '2019-11-04', 21.0, 0.0, NULL, 5);
INSERT INTO ticket VALUES (103, '2020-11-17', 21.0, 0.0, 20, 2);
INSERT INTO ticket VALUES (104, '2020-03-17', 21.0, 3.0, 17, NULL);
INSERT INTO ticket VALUES (105, '2020-04-03', 4.0, 0.0, 9, 6);
INSERT INTO ticket VALUES (106, '2020-11-08', 21.0, 10.0, 22, 1);
INSERT INTO ticket VALUES (107, '2020-07-22', 21.0, 0.0, 14, 4);
INSERT INTO ticket VALUES (108, '2020-04-23', 21.0, 0.0, 8, 6);


INSERT INTO vendedor VALUES (2, 'Sonia', 'Calle Padre Arrupe 1', '03202', 'LCH', 1);
INSERT INTO vendedor VALUES (4, 'Miriam', 'Avenida Serrano 32', '46002', 'VLNC', NULL);
INSERT INTO vendedor VALUES (1, 'Jorge', 'Calle Vicente Peris 21', '03004', 'LCNT', 4);
INSERT INTO vendedor VALUES (3, 'Tobías', 'Calle Perú 43', '46704', 'GND', 4);
INSERT INTO vendedor VALUES (5, 'Saúl', 'Calle Eustaquio Ribero 2', '12541', 'VLLRL', 6);
INSERT INTO vendedor VALUES (6, 'Mercedes', 'Calle Florencia', '12002', 'CSTLL', 4);



ALTER TABLE  articulo
    ADD CONSTRAINT articulo_codigo_pk PRIMARY KEY (codigo);



ALTER TABLE cliente
    ADD CONSTRAINT cliente_codigo_pk PRIMARY KEY (codigo);



ALTER TABLE linea_ticket
    ADD CONSTRAINT lticket_ticket_nlinea_pk PRIMARY KEY (ticket, nlinea);



ALTER TABLE municipio
    ADD CONSTRAINT municipio_codigo_pk PRIMARY KEY (codigo);



ALTER TABLE provincia
    ADD CONSTRAINT provincia_codigo_pk PRIMARY KEY (codigo);



ALTER TABLE ticket
    ADD CONSTRAINT ticket_codigo_pk PRIMARY KEY (codigo);



ALTER TABLE vendedor
    ADD CONSTRAINT vendedor_codigo_pk PRIMARY KEY (codigo);



ALTER TABLE cliente
    ADD CONSTRAINT cliente_municipio_fk FOREIGN KEY (municipio) REFERENCES municipio(codigo) ON UPDATE CASCADE ON DELETE SET NULL;



ALTER TABLE linea_ticket
    ADD CONSTRAINT lticket_articulo_fk FOREIGN KEY (articulo) REFERENCES articulo(codigo) ON UPDATE CASCADE ON DELETE SET NULL;



ALTER TABLE linea_ticket
    ADD CONSTRAINT lticket_ticket_fk FOREIGN KEY (ticket) REFERENCES ticket(codigo) ON UPDATE CASCADE ON DELETE CASCADE;


ALTER TABLE municipio
    ADD CONSTRAINT municipio_provincia_fk FOREIGN KEY (provincia) REFERENCES provincia(codigo) ON UPDATE CASCADE ON DELETE CASCADE;



ALTER TABLE ticket
    ADD CONSTRAINT ticket_cliente_fk FOREIGN KEY (cliente) REFERENCES cliente(codigo) ON UPDATE CASCADE ON DELETE CASCADE;



ALTER TABLE ticket
    ADD CONSTRAINT ticket_vendedor_fk FOREIGN KEY (vendedor) REFERENCES vendedor(codigo) ON UPDATE CASCADE ON DELETE SET NULL;



ALTER TABLE vendedor
    ADD CONSTRAINT vendedor_jefe_fk FOREIGN KEY (jefe) REFERENCES vendedor(codigo) ON UPDATE CASCADE ON DELETE SET NULL;



ALTER TABLE vendedor
    ADD CONSTRAINT vendedor_municipio_fk FOREIGN KEY (municipio) REFERENCES municipio(codigo) ON UPDATE CASCADE ON DELETE SET NULL;

DROP DATABASE IF EXISTS instituto;
CREATE DATABASE instituto;
use instituto;

CREATE TABLE alumno (
    dni VARCHAR(9) NOT NULL,
    nombre VARCHAR(20),
    apellido1 VARCHAR(20),
    apellido2 VARCHAR(20),
    fechnac date
);

CREATE TABLE asignatura (
    codigo numeric NOT NULL,
    nombre VARCHAR(20),
    curso numeric
);

CREATE TABLE ensenya (
    profesor VARCHAR(9) NOT NULL,
    asignatura numeric NOT NULL,
    grupo character varying(2) NOT NULL
);

CREATE TABLE imparte (
    edificioaula character varying(10) NOT NULL,
    claseaula numeric NOT NULL,
    asignatura numeric NOT NULL
);

CREATE TABLE matricula (
    alumno VARCHAR(9) NOT NULL,
    asignatura numeric NOT NULL,
    nota numeric,
    CONSTRAINT matricula_nota_ck CHECK (((nota >= (0)) AND (nota <= (10))))
);

CREATE TABLE profesor (
    dni VARCHAR(9) NOT NULL,
    nombre VARCHAR(20),
    apellido1 VARCHAR(20),
    apellido2 VARCHAR(20),
    anyoi numeric
);

CREATE TABLE reparto (
    alumno VARCHAR(9) NOT NULL,
    grupo character varying(2) NOT NULL
);

INSERT INTO alumno VALUES ('78392053A', 'Elena', 'Rodriguez', 'Perez', '1998-01-04');
INSERT INTO alumno VALUES ('67392863B', 'Cesar', 'Gomez', 'Sanchez', '1998-01-04');
INSERT INTO alumno VALUES ('73902451B', 'Elisa', 'Fernandez', 'Medina', '1998-02-07');
INSERT INTO alumno VALUES ('45673195B', 'Enrique', 'Suarez', 'Molina', '1998-05-12');
INSERT INTO alumno VALUES ('68902134C', 'Aaron', 'Quiroga', 'Vazquez', '1998-03-21');
INSERT INTO alumno VALUES ('78563401C', 'David', 'Romero', 'Vega', '1998-02-18');
INSERT INTO alumno VALUES ('54389210D', 'Alejandro', 'Ledesma', 'Escobar', '1998-08-06');
INSERT INTO alumno VALUES ('56703214D', 'Bruno', 'Torres', 'Moreno', '1998-10-14');
INSERT INTO alumno VALUES ('78932434F', 'Felix', 'Ramos', 'Ortega', '1998-11-09');
INSERT INTO alumno VALUES ('90067312F', 'Azucena', 'Morales', 'Lopez', '1998-12-17');
INSERT INTO alumno VALUES ('56323453G', 'Beatriz', 'Bermudez', 'Campo', '1998-11-03');
INSERT INTO alumno VALUES ('67863211G', 'Gustavo', 'Jimenez', 'Ortiz', '1998-07-13');
INSERT INTO alumno VALUES ('67895435H', 'Amanda', 'Martínez', 'Rojas', '1998-08-24');
INSERT INTO alumno VALUES ('43214352H', 'Rebeca', 'Blanco', 'Gonzalez', '1998-05-30');
INSERT INTO alumno VALUES ('65473823J', 'Catalina', 'Ortega', 'Caballero', '1998-03-02');
INSERT INTO alumno VALUES ('56743284K', 'Marcos', 'Perez', 'Gutierrez', '1998-04-17');
INSERT INTO alumno VALUES ('65473877K', 'Carmen', 'Castillo', 'Moreno', '1998-03-22');
INSERT INTO alumno VALUES ('22314780L', 'Elias', 'Rodriguez', 'Hernandez', '1998-05-09');
INSERT INTO alumno VALUES ('23145236L', 'Cintia', 'Rodriguez', 'Medina', '1999-05-20');
INSERT INTO alumno VALUES ('76548932M', 'Diana', 'Reyes', 'Martínez', '1999-05-01');
INSERT INTO alumno VALUES ('90765402M', 'Adrian', 'Jimenez', 'Figueroa', '1999-02-17');
INSERT INTO alumno VALUES ('67908723N', 'Delia', 'Salazar', 'Gutierrez', '1999-01-03');
INSERT INTO alumno VALUES ('56436785N', 'Elvira', 'Hernandez', 'Sanchez', '1999-11-14');
INSERT INTO alumno VALUES ('78543289P', 'Esmeralda', 'Fernandez', 'Reyes', '1999-03-25');
INSERT INTO alumno VALUES ('45326478P', 'Arturo', 'Garcia', 'Gomez', '1999-03-06');
INSERT INTO alumno VALUES ('56640176R', 'Felipe', 'Sanchez', 'Garcia', '1999-06-17');
INSERT INTO alumno VALUES ('54323465R', 'Gloria', 'Martínez', 'Fernandez', '1999-05-18');
INSERT INTO alumno VALUES ('70119023S', 'Guillermo', 'Fuentes', 'Vega', '1999-11-29');
INSERT INTO alumno VALUES ('80778905S', 'Blanca', 'Ramos', 'Lopez', '1999-12-04');
INSERT INTO alumno VALUES ('80987689T', 'Maite', 'Nuñez', 'Bermudez', '1999-12-31');
INSERT INTO alumno VALUES ('76589023T', 'Celia', 'Gutierrez', 'Vera', '1999-08-01');
INSERT INTO alumno VALUES ('54676638V', 'Matias', 'Mejía', 'Zambrano', '1999-06-07');
INSERT INTO alumno VALUES ('76899654C', 'Sonia', 'Mendoza', 'Castro', '1999-06-18');
INSERT INTO alumno VALUES ('68875034D', 'Carlos', 'Fuentes', 'Cruz', '1999-04-24');
INSERT INTO alumno VALUES ('67884320V', 'Raquel', 'Ortiz', 'Carvajal', '1999-03-11');
INSERT INTO alumno VALUES ('76899345F', 'Tatiana', 'Garrido', 'Medina', '1999-10-09');
INSERT INTO alumno VALUES ('76893452G', 'Saul', 'Garcia', 'Cardenas', '1999-09-13');
INSERT INTO alumno VALUES ('76657403J', 'Sergio', 'Soto', 'Carrasco', '1999-01-04');
INSERT INTO alumno VALUES ('34104567J', 'Raul', 'Diaz', 'Silva', '1999-01-09');
INSERT INTO alumno VALUES ('10937582A', 'Eduardo', 'González', 'García', '1998-01-01');

INSERT INTO asignatura VALUES (1, 'Lengua', 1);
INSERT INTO asignatura VALUES (2, 'Lengua', 2);
INSERT INTO asignatura VALUES (5, 'Historia', 1);
INSERT INTO asignatura VALUES (6, 'Historia', 2);
INSERT INTO asignatura VALUES (3, 'Matemáticas', 1);
INSERT INTO asignatura VALUES (4, 'Matemáticas', 2);
INSERT INTO asignatura VALUES (7, 'Inglés', 1);
INSERT INTO asignatura VALUES (8, 'Inglés', 2);
INSERT INTO asignatura VALUES (9, 'Latín', 1);
INSERT INTO asignatura VALUES (10, 'Latín', 2);
INSERT INTO asignatura VALUES (11, 'Física', 1);
INSERT INTO asignatura VALUES (12, 'Física', 2);
INSERT INTO asignatura VALUES (13, 'Informática', 1);
INSERT INTO asignatura VALUES (14, 'Informática', 2);


INSERT INTO ensenya VALUES ('78896563A', 4, '2A');
INSERT INTO ensenya VALUES ('78896563A', 4, '2B');
INSERT INTO ensenya VALUES ('55400892G', 1, '1A');
INSERT INTO ensenya VALUES ('55400892G', 1, '1B');
INSERT INTO ensenya VALUES ('54430287J', 2, '2A');
INSERT INTO ensenya VALUES ('54430287J', 2, '2B');
INSERT INTO ensenya VALUES ('45362734P', 7, '1A');
INSERT INTO ensenya VALUES ('45362734P', 7, '1B');
INSERT INTO ensenya VALUES ('78905435S', 8, '2A');
INSERT INTO ensenya VALUES ('78905435S', 8, '2B');
INSERT INTO ensenya VALUES ('11900567T', 5, '1A');
INSERT INTO ensenya VALUES ('11900567T', 6, '2A');
INSERT INTO ensenya VALUES ('78934567M', 9, '1A');
INSERT INTO ensenya VALUES ('78934567M', 10, '2A');
INSERT INTO ensenya VALUES ('67743002D', 11, '1B');
INSERT INTO ensenya VALUES ('67743002D', 12, '2B');
INSERT INTO ensenya VALUES ('76686546D', 13, '1B');
INSERT INTO ensenya VALUES ('76686546D', 14, '2B');
INSERT INTO ensenya VALUES ('76566708T', 3, '1A');
INSERT INTO ensenya VALUES ('76566708T', 3, '1B');

INSERT INTO imparte VALUES ('Letras', 1, 1);
INSERT INTO imparte VALUES ('Letras', 2, 2);
INSERT INTO imparte VALUES ('Ciencias', 2, 4);
INSERT INTO imparte VALUES ('Letras', 3, 5);
INSERT INTO imparte VALUES ('Letras', 4, 6);
INSERT INTO imparte VALUES ('Letras', 5, 7);
INSERT INTO imparte VALUES ('Letras', 6, 8);
INSERT INTO imparte VALUES ('Letras', 7, 9);
INSERT INTO imparte VALUES ('Letras', 8, 10);
INSERT INTO imparte VALUES ('Ciencias', 3, 11);
INSERT INTO imparte VALUES ('Ciencias', 3, 12);
INSERT INTO imparte VALUES ('Ciencias', 4, 13);
INSERT INTO imparte VALUES ('Ciencias', 4, 14);
INSERT INTO imparte VALUES ('Ciencias', 1, 3);

INSERT INTO matricula VALUES ('78392053A', 1, 7);
INSERT INTO matricula VALUES ('78392053A', 5, 9);
INSERT INTO matricula VALUES ('78392053A', 7, 8);
INSERT INTO matricula VALUES ('78392053A', 9, 6);
INSERT INTO matricula VALUES ('67392863B', 1, 5);
INSERT INTO matricula VALUES ('67392863B', 5, 6);
INSERT INTO matricula VALUES ('67392863B', 7, 4);
INSERT INTO matricula VALUES ('67392863B', 9, 6);
INSERT INTO matricula VALUES ('73902451B', 1, 4);
INSERT INTO matricula VALUES ('73902451B', 5, 5);
INSERT INTO matricula VALUES ('73902451B', 7, 6);
INSERT INTO matricula VALUES ('73902451B', 9, 6);
INSERT INTO matricula VALUES ('45673195B', 1, 9);
INSERT INTO matricula VALUES ('45673195B', 5, 10);
INSERT INTO matricula VALUES ('45673195B', 7, 8);
INSERT INTO matricula VALUES ('45673195B', 9, 9);
INSERT INTO matricula VALUES ('68902134C', 1, 7);
INSERT INTO matricula VALUES ('68902134C', 5, 8);
INSERT INTO matricula VALUES ('68902134C', 7, 6);
INSERT INTO matricula VALUES ('68902134C', 9, 7);
INSERT INTO matricula VALUES ('78563401C', 1, 9);
INSERT INTO matricula VALUES ('78563401C', 5, 8);
INSERT INTO matricula VALUES ('78563401C', 7, 8);
INSERT INTO matricula VALUES ('78563401C', 9, 7);
INSERT INTO matricula VALUES ('54389210D', 1, 10);
INSERT INTO matricula VALUES ('54389210D', 5, 9);
INSERT INTO matricula VALUES ('54389210D', 7, 9);
INSERT INTO matricula VALUES ('54389210D', 9, 8);
INSERT INTO matricula VALUES ('56703214D', 1, 6);
INSERT INTO matricula VALUES ('56703214D', 5, 7);
INSERT INTO matricula VALUES ('56703214D', 7, 8);
INSERT INTO matricula VALUES ('56703214D', 9, 6);
INSERT INTO matricula VALUES ('78932434F', 1, 7);
INSERT INTO matricula VALUES ('78932434F', 5, 8);
INSERT INTO matricula VALUES ('78932434F', 7, 6);
INSERT INTO matricula VALUES ('78932434F', 9, 7);
INSERT INTO matricula VALUES ('90067312F', 2, 7);
INSERT INTO matricula VALUES ('90067312F', 4, 7);
INSERT INTO matricula VALUES ('90067312F', 6, 8);
INSERT INTO matricula VALUES ('90067312F', 8, 6);
INSERT INTO matricula VALUES ('90067312F', 10, 7);
INSERT INTO matricula VALUES ('56323453G', 2, 8);
INSERT INTO matricula VALUES ('56323453G', 4, 9);
INSERT INTO matricula VALUES ('56323453G', 6, 10);
INSERT INTO matricula VALUES ('56323453G', 8, 10);
INSERT INTO matricula VALUES ('56323453G', 10, 9);
INSERT INTO matricula VALUES ('67863211G', 2, 4);
INSERT INTO matricula VALUES ('67863211G', 4, 5);
INSERT INTO matricula VALUES ('67863211G', 6, 6);
INSERT INTO matricula VALUES ('67863211G', 8, 5);
INSERT INTO matricula VALUES ('67863211G', 10, 4);
INSERT INTO matricula VALUES ('67895435H', 2, 3);
INSERT INTO matricula VALUES ('67895435H', 4, 4);
INSERT INTO matricula VALUES ('67895435H', 6, 2);
INSERT INTO matricula VALUES ('67895435H', 8, 3);
INSERT INTO matricula VALUES ('67895435H', 10, 5);
INSERT INTO matricula VALUES ('43214352H', 2, 6);
INSERT INTO matricula VALUES ('43214352H', 4, 7);
INSERT INTO matricula VALUES ('43214352H', 6, 7);
INSERT INTO matricula VALUES ('43214352H', 8, 8);
INSERT INTO matricula VALUES ('43214352H', 10, 7);
INSERT INTO matricula VALUES ('65473823J', 2, 8);
INSERT INTO matricula VALUES ('65473823J', 4, 6);
INSERT INTO matricula VALUES ('65473823J', 6, 7);
INSERT INTO matricula VALUES ('65473823J', 8, 7);
INSERT INTO matricula VALUES ('65473823J', 10, 7);
INSERT INTO matricula VALUES ('56743284K', 2, 9);
INSERT INTO matricula VALUES ('56743284K', 4, 10);
INSERT INTO matricula VALUES ('56743284K', 6, 10);
INSERT INTO matricula VALUES ('56743284K', 8, 10);
INSERT INTO matricula VALUES ('56743284K', 10, 9);
INSERT INTO matricula VALUES ('65473877K', 2, 7);
INSERT INTO matricula VALUES ('65473877K', 4, 8);
INSERT INTO matricula VALUES ('65473877K', 6, 8);
INSERT INTO matricula VALUES ('65473877K', 8, 6);
INSERT INTO matricula VALUES ('65473877K', 10, 8);
INSERT INTO matricula VALUES ('22314780L', 2, 6);
INSERT INTO matricula VALUES ('22314780L', 4, 5);
INSERT INTO matricula VALUES ('22314780L', 6, 6);
INSERT INTO matricula VALUES ('22314780L', 10, 6);
INSERT INTO matricula VALUES ('23145236L', 1, 6);
INSERT INTO matricula VALUES ('23145236L', 7, 7);
INSERT INTO matricula VALUES ('23145236L', 11, 6);
INSERT INTO matricula VALUES ('23145236L', 13, 7);
INSERT INTO matricula VALUES ('76548932M', 1, 10);
INSERT INTO matricula VALUES ('76548932M', 7, 9);
INSERT INTO matricula VALUES ('76548932M', 11, 9);
INSERT INTO matricula VALUES ('76548932M', 13, 8);
INSERT INTO matricula VALUES ('90765402M', 1, 8);
INSERT INTO matricula VALUES ('90765402M', 7, 7);
INSERT INTO matricula VALUES ('90765402M', 11, 6);
INSERT INTO matricula VALUES ('90765402M', 13, 8);
INSERT INTO matricula VALUES ('67908723N', 1, 4);
INSERT INTO matricula VALUES ('67908723N', 7, 3);
INSERT INTO matricula VALUES ('67908723N', 11, 5);
INSERT INTO matricula VALUES ('67908723N', 13, 6);
INSERT INTO matricula VALUES ('56436785N', 1, 3);
INSERT INTO matricula VALUES ('56436785N', 7, 4);
INSERT INTO matricula VALUES ('56436785N', 11, 5);
INSERT INTO matricula VALUES ('56436785N', 13, 5);
INSERT INTO matricula VALUES ('78543289P', 1, 10);
INSERT INTO matricula VALUES ('78543289P', 7, 9);
INSERT INTO matricula VALUES ('78543289P', 11, 10);
INSERT INTO matricula VALUES ('78543289P', 13, 10);
INSERT INTO matricula VALUES ('45326478P', 1, 8);
INSERT INTO matricula VALUES ('45326478P', 7, 7);
INSERT INTO matricula VALUES ('45326478P', 11, 6);
INSERT INTO matricula VALUES ('45326478P', 13, 7);
INSERT INTO matricula VALUES ('56640176R', 1, 8);
INSERT INTO matricula VALUES ('56640176R', 7, 8);
INSERT INTO matricula VALUES ('56640176R', 11, 7);
INSERT INTO matricula VALUES ('56640176R', 13, 9);
INSERT INTO matricula VALUES ('54323465R', 1, 6);
INSERT INTO matricula VALUES ('54323465R', 7, 7);
INSERT INTO matricula VALUES ('54323465R', 11, 8);
INSERT INTO matricula VALUES ('54323465R', 13, 6);
INSERT INTO matricula VALUES ('70119023S', 1, 7);
INSERT INTO matricula VALUES ('70119023S', 7, 6);
INSERT INTO matricula VALUES ('70119023S', 11, 9);
INSERT INTO matricula VALUES ('70119023S', 13, 7);
INSERT INTO matricula VALUES ('80778905S', 2, 7);
INSERT INTO matricula VALUES ('80778905S', 4, 7);
INSERT INTO matricula VALUES ('80778905S', 8, 8);
INSERT INTO matricula VALUES ('80778905S', 12, 6);
INSERT INTO matricula VALUES ('80778905S', 14, 7);
INSERT INTO matricula VALUES ('80987689T', 2, 6);
INSERT INTO matricula VALUES ('80987689T', 4, 5);
INSERT INTO matricula VALUES ('80987689T', 8, 5);
INSERT INTO matricula VALUES ('80987689T', 12, 7);
INSERT INTO matricula VALUES ('80987689T', 14, 6);
INSERT INTO matricula VALUES ('76589023T', 2, 10);
INSERT INTO matricula VALUES ('76589023T', 4, 10);
INSERT INTO matricula VALUES ('76589023T', 8, 9);
INSERT INTO matricula VALUES ('76589023T', 12, 9);
INSERT INTO matricula VALUES ('76589023T', 14, 10);
INSERT INTO matricula VALUES ('54676638V', 2, 8);
INSERT INTO matricula VALUES ('54676638V', 4, 10);
INSERT INTO matricula VALUES ('54676638V', 8, 9);
INSERT INTO matricula VALUES ('54676638V', 12, 10);
INSERT INTO matricula VALUES ('54676638V', 14, 9);
INSERT INTO matricula VALUES ('76899654C', 2, 8);
INSERT INTO matricula VALUES ('76899654C', 4, 8);
INSERT INTO matricula VALUES ('76899654C', 8, 9);
INSERT INTO matricula VALUES ('76899654C', 12, 8);
INSERT INTO matricula VALUES ('76899654C', 14, 7);
INSERT INTO matricula VALUES ('68875034D', 2, 5);
INSERT INTO matricula VALUES ('68875034D', 4, 6);
INSERT INTO matricula VALUES ('68875034D', 8, 4);
INSERT INTO matricula VALUES ('68875034D', 12, 5);
INSERT INTO matricula VALUES ('68875034D', 14, 5);
INSERT INTO matricula VALUES ('67884320V', 2, 3);
INSERT INTO matricula VALUES ('67884320V', 4, 4);
INSERT INTO matricula VALUES ('67884320V', 8, 5);
INSERT INTO matricula VALUES ('67884320V', 12, 3);
INSERT INTO matricula VALUES ('67884320V', 14, 6);
INSERT INTO matricula VALUES ('76899345F', 2, 7);
INSERT INTO matricula VALUES ('76899345F', 4, 5);
INSERT INTO matricula VALUES ('76899345F', 8, 7);
INSERT INTO matricula VALUES ('76899345F', 12, 6);
INSERT INTO matricula VALUES ('76899345F', 14, 8);
INSERT INTO matricula VALUES ('76893452G', 2, 6);
INSERT INTO matricula VALUES ('76893452G', 4, 7);
INSERT INTO matricula VALUES ('76893452G', 8, 7);
INSERT INTO matricula VALUES ('76893452G', 12, 6);
INSERT INTO matricula VALUES ('76893452G', 14, 6);
INSERT INTO matricula VALUES ('76657403J', 2, 8);
INSERT INTO matricula VALUES ('76657403J', 4, 9);
INSERT INTO matricula VALUES ('76657403J', 8, 9);
INSERT INTO matricula VALUES ('76657403J', 12, 10);
INSERT INTO matricula VALUES ('76657403J', 14, 8);
INSERT INTO matricula VALUES ('34104567J', 2, 6);
INSERT INTO matricula VALUES ('34104567J', 4, 5);
INSERT INTO matricula VALUES ('34104567J', 8, 5);
INSERT INTO matricula VALUES ('34104567J', 12, 7);
INSERT INTO matricula VALUES ('34104567J', 14, 5);
INSERT INTO matricula VALUES ('10937582A', 3, 4);
INSERT INTO matricula VALUES ('10937582A', 5, 5);
INSERT INTO matricula VALUES ('10937582A', 7, 5);
INSERT INTO matricula VALUES ('10937582A', 9, 6);
INSERT INTO matricula VALUES ('78392053A', 3, 7);
INSERT INTO matricula VALUES ('67392863B', 3, 7);
INSERT INTO matricula VALUES ('73902451B', 3, 4);
INSERT INTO matricula VALUES ('45673195B', 3, 9);
INSERT INTO matricula VALUES ('68902134C', 3, 7);
INSERT INTO matricula VALUES ('78563401C', 3, 9);
INSERT INTO matricula VALUES ('54389210D', 3, 10);
INSERT INTO matricula VALUES ('56703214D', 3, 7);
INSERT INTO matricula VALUES ('78932434F', 3, 8);
INSERT INTO matricula VALUES ('23145236L', 3, 7);
INSERT INTO matricula VALUES ('76548932M', 3, 10);
INSERT INTO matricula VALUES ('90765402M', 3, 8);
INSERT INTO matricula VALUES ('67908723N', 3, 5);
INSERT INTO matricula VALUES ('56436785N', 3, 4);
INSERT INTO matricula VALUES ('78543289P', 3, 10);
INSERT INTO matricula VALUES ('45326478P', 3, 7);
INSERT INTO matricula VALUES ('56640176R', 3, 9);
INSERT INTO matricula VALUES ('54323465R', 3, 7);
INSERT INTO matricula VALUES ('70119023S', 3, 7);
INSERT INTO matricula VALUES ('10937582A', 1, 3);

INSERT INTO profesor VALUES ('78896563A', 'Simon', 'Lopez', 'Martin', 2013);
INSERT INTO profesor VALUES ('55400892G', 'Tristan', 'Vega', 'Gomez', 2015);
INSERT INTO profesor VALUES ('54430287J', 'Berta', 'Miranda', 'Ortega', 2014);
INSERT INTO profesor VALUES ('45362734P', 'Domingo', 'Gonzalez', 'Suarez', 2014);
INSERT INTO profesor VALUES ('78905435S', 'Francisco', 'Ruiz', 'Mendoza', 2013);
INSERT INTO profesor VALUES ('11900567T', 'Maria', 'Hernandez', 'Rodriguez', 2016);
INSERT INTO profesor VALUES ('78934567M', 'Monica', 'Gutierrez', 'Figueroa', 2016);
INSERT INTO profesor VALUES ('67743002D', 'Maruro', 'Vidal', 'Parra', 2013);
INSERT INTO profesor VALUES ('76686546D', 'Lucrecia', 'Escobar', 'Tabares', 2017);
INSERT INTO profesor VALUES ('76566708T', 'Soledad', 'Fernández', 'Vázquez', 2013);

INSERT INTO reparto VALUES ('78392053A', '1A');
INSERT INTO reparto VALUES ('67392863B', '1A');
INSERT INTO reparto VALUES ('73902451B', '1A');
INSERT INTO reparto VALUES ('45673195B', '1A');
INSERT INTO reparto VALUES ('68902134C', '1A');
INSERT INTO reparto VALUES ('78563401C', '1A');
INSERT INTO reparto VALUES ('54389210D', '1A');
INSERT INTO reparto VALUES ('56703214D', '1A');
INSERT INTO reparto VALUES ('78932434F', '1A');
INSERT INTO reparto VALUES ('90067312F', '2A');
INSERT INTO reparto VALUES ('56323453G', '2A');
INSERT INTO reparto VALUES ('67863211G', '2A');
INSERT INTO reparto VALUES ('67895435H', '2A');
INSERT INTO reparto VALUES ('43214352H', '2A');
INSERT INTO reparto VALUES ('65473823J', '2A');
INSERT INTO reparto VALUES ('56743284K', '2A');
INSERT INTO reparto VALUES ('65473877K', '2A');
INSERT INTO reparto VALUES ('22314780L', '2A');
INSERT INTO reparto VALUES ('23145236L', '1B');
INSERT INTO reparto VALUES ('76548932M', '1B');
INSERT INTO reparto VALUES ('90765402M', '1B');
INSERT INTO reparto VALUES ('67908723N', '1B');
INSERT INTO reparto VALUES ('56436785N', '1B');
INSERT INTO reparto VALUES ('78543289P', '1B');
INSERT INTO reparto VALUES ('45326478P', '1B');
INSERT INTO reparto VALUES ('56640176R', '1B');
INSERT INTO reparto VALUES ('54323465R', '1B');
INSERT INTO reparto VALUES ('70119023S', '1B');
INSERT INTO reparto VALUES ('80778905S', '2B');
INSERT INTO reparto VALUES ('80987689T', '2B');
INSERT INTO reparto VALUES ('76589023T', '2B');
INSERT INTO reparto VALUES ('54676638V', '2B');
INSERT INTO reparto VALUES ('76899654C', '2B');
INSERT INTO reparto VALUES ('68875034D', '2B');
INSERT INTO reparto VALUES ('67884320V', '2B');
INSERT INTO reparto VALUES ('76899345F', '2B');
INSERT INTO reparto VALUES ('76893452G', '2B');
INSERT INTO reparto VALUES ('76657403J', '2B');
INSERT INTO reparto VALUES ('34104567J', '2B');
INSERT INTO reparto VALUES ('10937582A', '1A');


ALTER TABLE alumno
    ADD CONSTRAINT alumno_dni_pk PRIMARY KEY (dni);


ALTER TABLE asignatura
    ADD CONSTRAINT asignatura_codigo_pk PRIMARY KEY (codigo);


ALTER TABLE ensenya
    ADD CONSTRAINT enseña_prof_as_gr_pk PRIMARY KEY (profesor, asignatura, grupo);


ALTER TABLE imparte
    ADD CONSTRAINT imp_ed_cla_asign_pk PRIMARY KEY (edificioaula, claseaula, asignatura);


ALTER TABLE matricula
    ADD CONSTRAINT matricula_alum_asign_pk PRIMARY KEY (alumno, asignatura);


ALTER TABLE profesor
    ADD CONSTRAINT profesor_dni_pk PRIMARY KEY (dni);


ALTER TABLE reparto
    ADD CONSTRAINT reparto_al_grup_pk PRIMARY KEY (alumno, grupo);



ALTER TABLE ensenya
    ADD CONSTRAINT ensenya_asignatura_fk FOREIGN KEY (asignatura) REFERENCES asignatura(codigo) ON UPDATE CASCADE ON DELETE CASCADE;



ALTER TABLE ensenya
    ADD CONSTRAINT ensenya_profesor_fk FOREIGN KEY (profesor) REFERENCES profesor(dni) ON UPDATE CASCADE ON DELETE CASCADE;



ALTER TABLE imparte
    ADD CONSTRAINT imparte_asignatura_fk FOREIGN KEY (asignatura) REFERENCES asignatura(codigo) ON UPDATE CASCADE ON DELETE CASCADE;



ALTER TABLE matricula
    ADD CONSTRAINT matricula_alumno_fk FOREIGN KEY (alumno) REFERENCES alumno(dni) ON UPDATE CASCADE ON DELETE CASCADE;



ALTER TABLE matricula
    ADD CONSTRAINT matricula_asignatura_fk FOREIGN KEY (asignatura) REFERENCES asignatura(codigo) ON UPDATE CASCADE ON DELETE CASCADE;



ALTER TABLE reparto
    ADD CONSTRAINT reparto_alumno_fk FOREIGN KEY (alumno) REFERENCES alumno(dni) ON UPDATE CASCADE ON DELETE CASCADE;


DROP DATABASE IF EXISTS citas;
CREATE DATABASE citas;
use citas;

CREATE TABLE aficion (
    codigo integer PRIMARY KEY AUTO_INCREMENT,
    descripcion character varying(20) NOT NULL
);

CREATE TABLE cita ( 
    id integer PRIMARY KEY AUTO_INCREMENT,
    fecha date,
    lugar character varying(15),
    CONSTRAINT cita_fecha_ck CHECK (fecha >= '2017-01-01')
);

CREATE TABLE encuesta (
    nom_usuario character varying(20) NOT NULL,
    cita integer NOT NULL,
    valoracion character varying(20)
);

CREATE TABLE formacion (
    nom_usuario character varying(20) NOT NULL,
    formacion character varying(30) NOT NULL
);

CREATE TABLE gusta (
    nom_usuario_1 character varying(20) NOT NULL,
    nom_usuario_2 character varying(20) NOT NULL
);

CREATE TABLE perfil (
    nom_usuario character varying(20) NOT NULL,
    email character varying(45) NOT NULL,
    foto character varying(45) DEFAULT 'img/default.jpg',
    fechanac date,
    sexo character(1),
    trabajo character varying(45),
    religion character varying(20)
);

CREATE TABLE practica (
    nom_usuario character varying(20) NOT NULL,
    aficion integer NOT NULL,
    frecuencia character varying(20),
    CONSTRAINT practica_frecuencia_ck CHECK ((frecuencia = 'todos los meses') OR (frecuencia = 'todas las semanas') OR (frecuencia = 'a diario'))
);

CREATE TABLE usuario (
    nom_usuario character varying(20) NOT NULL,
    nif character varying(9),
    pass character varying(10),
    telefono numeric(9,0),
    nombre character varying(45)
);

INSERT INTO aficion VALUES (1, 'lectura');
INSERT INTO aficion VALUES (2, 'baile');
INSERT INTO aficion VALUES (3, 'running');
INSERT INTO aficion VALUES (4, 'natacion');
INSERT INTO aficion VALUES (5, 'pintura');
INSERT INTO aficion VALUES (6, 'musica');
INSERT INTO aficion VALUES (7, 'equitacion');

INSERT INTO cita VALUES (1, '2017-09-03', 'Madrid');
INSERT INTO cita VALUES (2, '2017-10-10', 'Madrid');
INSERT INTO cita VALUES (3, '2017-10-15', 'Valladolid');
INSERT INTO cita VALUES (4, '2017-08-02', 'Madrid');
INSERT INTO cita VALUES (5, '2017-09-24', 'Toledo');
INSERT INTO cita VALUES (6, '2017-07-13', 'Avila');
INSERT INTO cita VALUES (7, '2017-10-08', 'Segovia');
INSERT INTO cita VALUES (8, '2017-04-06', 'Valladolid');
INSERT INTO cita VALUES (9, '2017-05-26', 'Madrid');

INSERT INTO encuesta VALUES ('emgonzalez', 1, 'mal');
INSERT INTO encuesta VALUES ('mrreyes', 1, 'regular');
INSERT INTO encuesta VALUES ('emgonzalez', 2, 'muy bien');
INSERT INTO encuesta VALUES ('sbortega', 2, 'bien');
INSERT INTO encuesta VALUES ('djrodrigo', 3, 'regular');
INSERT INTO encuesta VALUES ('rmsalazar', 3, 'regular');
INSERT INTO encuesta VALUES ('jgbermudez', 4, 'muy bien');
INSERT INTO encuesta VALUES ('stmedina', 4, 'muy bien');
INSERT INTO encuesta VALUES ('rvquiroga', 5, 'mal');
INSERT INTO encuesta VALUES ('esfigueroa', 5, 'mal');
INSERT INTO encuesta VALUES ('apruiz', 6, 'bien');
INSERT INTO encuesta VALUES ('vgmartinez', 6, 'muy bien');
INSERT INTO encuesta VALUES ('apruiz', 7, 'muy bien');
INSERT INTO encuesta VALUES ('vgmartinez', 7, 'muy bien');
INSERT INTO encuesta VALUES ('vprodriguez', 8, 'bien');
INSERT INTO encuesta VALUES ('cgramos', 8, 'bien');
INSERT INTO encuesta VALUES ('vprodriguez', 9, 'bien');
INSERT INTO encuesta VALUES ('cgramos', 9, 'muy bien');

INSERT INTO formacion VALUES ('emgonzalez', 'Magisterio');
INSERT INTO formacion VALUES ('mrreyes', 'Graduado en Medicina');
INSERT INTO formacion VALUES ('djrodrigo', 'Graduado en Historia');
INSERT INTO formacion VALUES ('cgramos', 'Graduado en Filosofia');
INSERT INTO formacion VALUES ('jgbermudez', 'Ingeniero Industrial');
INSERT INTO formacion VALUES ('sbortega', 'Matemáticas');
INSERT INTO formacion VALUES ('rshernandez', 'Graduado en Enfermería');
INSERT INTO formacion VALUES ('esfigueroa', 'FP Sup Administrativo');
INSERT INTO formacion VALUES ('rvquiroga', 'Graduado en Medicina');
INSERT INTO formacion VALUES ('apruiz', 'Bachillerato');
INSERT INTO formacion VALUES ('stmedina', 'Ingeniero Informática');
INSERT INTO formacion VALUES ('avmiranda', 'FP Sup Administrativo');
INSERT INTO formacion VALUES ('sggarcia', 'Bachillerato');
INSERT INTO formacion VALUES ('lpmedina', 'Graduado en Geografia');
INSERT INTO formacion VALUES ('vgmartinez', 'FP Sup Estetica');
INSERT INTO formacion VALUES ('rmsalazar', 'FP Sup Estetica');
INSERT INTO formacion VALUES ('vprodriguez', 'FP Sup Fotografia');

INSERT INTO gusta VALUES ('emgonzalez', 'mrreyes');
INSERT INTO gusta VALUES ('emgonzalez', 'cgramos');
INSERT INTO gusta VALUES ('emgonzalez', 'sbortega');
INSERT INTO gusta VALUES ('djrodrigo', 'avmiranda');
INSERT INTO gusta VALUES ('djrodrigo', 'lpmedina');
INSERT INTO gusta VALUES ('djrodrigo', 'vgmartinez');
INSERT INTO gusta VALUES ('djrodrigo', 'rmsalazar');
INSERT INTO gusta VALUES ('jgbermudez', 'esfigueroa');
INSERT INTO gusta VALUES ('jgbermudez', 'stmedina');
INSERT INTO gusta VALUES ('rvquiroga', 'sbortega');
INSERT INTO gusta VALUES ('rvquiroga', 'rshernandez');
INSERT INTO gusta VALUES ('rvquiroga', 'esfigueroa');
INSERT INTO gusta VALUES ('apruiz', 'lpmedina');
INSERT INTO gusta VALUES ('apruiz', 'vgmartinez');
INSERT INTO gusta VALUES ('sggarcia', 'cgramos');
INSERT INTO gusta VALUES ('vprodriguez', 'mrreyes');
INSERT INTO gusta VALUES ('vprodriguez', 'cgramos');
INSERT INTO gusta VALUES ('vprodriguez', 'vgmartinez');
INSERT INTO gusta VALUES ('vprodriguez', 'rmsalazar');

INSERT INTO perfil VALUES ('emgonzalez', 'emgonzalez@webcitas.com', 'img/M/emgonzalez.jpg', '1990-04-20', 'M', 'Profesor', 'Cristianismo');
INSERT INTO perfil VALUES ('mrreyes', 'mrreyes@webcitas.com', 'img/F/mrreyes.jpg', '1987-11-03', 'F', 'Medico', 'Cristianismo');
INSERT INTO perfil VALUES ('djrodrigo', 'djrodrigo@webcitas.com', 'img/M/djrodrigo.jpg', '1992-02-06', 'M', 'Camarero', 'Ateo');
INSERT INTO perfil VALUES ('cgramos', 'cgramos@webcitas.com', 'img/F/cgramos.jpg', '1989-04-05', 'F', NULL, 'Ateo');
INSERT INTO perfil VALUES ('jgbermudez', 'jgbermudez@webcitas.com', 'img/M/jgbermudez.jpg', '1990-08-24', 'M', 'Ingeniero', 'Ateo');
INSERT INTO perfil VALUES ('sbortega', 'sbortega@webcitas.com', 'img/F/sbortega.jpg', '1990-05-15', 'F', 'Profesor', 'Cristianismo');
INSERT INTO perfil VALUES ('rshernandez', 'rshernandez@webcitas.com', 'img/F/rshernandez.jpg', '1988-06-02', 'F', 'Enfermera', 'Cristianismo');
INSERT INTO perfil VALUES ('esfigueroa', 'esfigueroa@webcitas.com', 'img/F/esfigueroa.jpg', '1990-11-17', 'F', 'Administrativo', 'Islam');
INSERT INTO perfil VALUES ('rvquiroga', 'rvquiroga@webcitas.com', 'img/M/rvquiroga.jpg', '1988-12-28', 'M', 'Medico', 'Islam');
INSERT INTO perfil VALUES ('avmiranda', 'avmiranda@webcitas.com', 'img/F/avmiranda.jpg', '1990-06-14', 'F', 'Administrativo', 'Cristianismo');
INSERT INTO perfil VALUES ('sggarcia', 'sggarcia@webcitas.com', 'img/M/sggarcia.jpg', '1991-06-02', 'M', NULL, 'Ateo');
INSERT INTO perfil VALUES ('lpmedina', 'lpmedina@webcitas.com', 'img/F/lpmedina.jpg', '1986-07-13', 'F', NULL, 'Ateo');
INSERT INTO perfil VALUES ('vgmartinez', 'vgmartinez@webcitas.com', 'img/F/vgmartinez.jpg', '1986-02-24', 'F', 'Peluquera', 'Ateo');
INSERT INTO perfil VALUES ('rmsalazar', 'rmsalazar@webcitas.com', 'img/F/rmsalazar.jpg', '1984-09-25', 'F', 'Peluquera', 'Cristianismo');
INSERT INTO perfil VALUES ('vprodriguez', 'vprodriguez@webcitas.com', 'img/M/vprodriguez.jpg', '1993-11-06', 'M', 'Fotografo', 'Ateo');
INSERT INTO perfil VALUES ('apruiz', 'apruiz@webcitas.com', 'img/M/apruiz.jpg', '1987-05-29', 'M', 'Policía', 'Islam');
INSERT INTO perfil VALUES ('stmedina', 'stmedina@webcitas.com', 'img/F/stmedina.jpg', '1987-01-10', 'F', 'Policía', 'Cristianismo');

INSERT INTO practica VALUES ('emgonzalez', 1, 'todos los meses');
INSERT INTO practica VALUES ('emgonzalez', 2, 'todas las semanas');
INSERT INTO practica VALUES ('emgonzalez', 3, 'a diario');
INSERT INTO practica VALUES ('mrreyes', 3, 'a diario');
INSERT INTO practica VALUES ('djrodrigo', 2, 'todas las semanas');
INSERT INTO practica VALUES ('djrodrigo', 4, 'todos los meses');
INSERT INTO practica VALUES ('cgramos', 4, 'a diario');
INSERT INTO practica VALUES ('jgbermudez', 2, 'a diario');
INSERT INTO practica VALUES ('jgbermudez', 4, 'a diario');
INSERT INTO practica VALUES ('jgbermudez', 1, 'a diario');
INSERT INTO practica VALUES ('sbortega', 3, 'a diario');
INSERT INTO practica VALUES ('rshernandez', 1, 'todas las semanas');
INSERT INTO practica VALUES ('esfigueroa', 1, 'a diario');
INSERT INTO practica VALUES ('esfigueroa', 4, 'a diario');
INSERT INTO practica VALUES ('rvquiroga', 5, 'todos los meses');
INSERT INTO practica VALUES ('rvquiroga', 6, 'todas las semanas');
INSERT INTO practica VALUES ('rvquiroga', 2, 'todas las semanas');
INSERT INTO practica VALUES ('apruiz', 7, 'todos los meses');
INSERT INTO practica VALUES ('stmedina', 7, 'todas las semanas');
INSERT INTO practica VALUES ('avmiranda', 7, 'todas las semanas');
INSERT INTO practica VALUES ('sggarcia', 7, 'a diario');
INSERT INTO practica VALUES ('sggarcia', 2, 'todos los meses');
INSERT INTO practica VALUES ('lpmedina', 3, 'a diario');
INSERT INTO practica VALUES ('lpmedina', 1, 'todas las semanas');
INSERT INTO practica VALUES ('vgmartinez', 5, 'todas las semanas');
INSERT INTO practica VALUES ('rmsalazar', 6, 'todos los meses');
INSERT INTO practica VALUES ('rmsalazar', 2, 'todas las semanas');
INSERT INTO practica VALUES ('rmsalazar', 7, 'todas las semanas');
INSERT INTO practica VALUES ('vprodriguez', 3, 'todas las semanas');

INSERT INTO usuario VALUES ('emgonzalez', '78563401C', 'ggPtcs7I', 675889203, 'Eduardo Martin Gonzalez');
INSERT INTO usuario VALUES ('mrreyes', '54389210D', 'M27GYCVU', 679304123, 'Maria Rodriguez Reyes');
INSERT INTO usuario VALUES ('djrodrigo', '56703214D', 'BD6XJbuf', 630928379, 'David Jimenez Rodrigo');
INSERT INTO usuario VALUES ('cgramos', '78932434F', 'myuDRHBx', 601829464, 'Claudia Garcia Ramos');
INSERT INTO usuario VALUES ('jgbermudez', '90067312F', '7ZLte16L', 650220132, 'Jose Gutierrez Bermudez');
INSERT INTO usuario VALUES ('sbortega', '56323453G', '4YCmJKFZ', 680098033, 'Sandra Blanco Ortega');
INSERT INTO usuario VALUES ('rshernandez', '67863211G', 'hmkghHl7', 665783375, 'Rocio Suarez Hernandez');
INSERT INTO usuario VALUES ('esfigueroa', '67895435H', 'OrRAdwQx', 652939003, 'Elisa Sanchez Figueroa');
INSERT INTO usuario VALUES ('rvquiroga', '43214352H', 'L9HKbr08', 610328956, 'Roberto Vega Quiroga');
INSERT INTO usuario VALUES ('apruiz', '65473823J', '5knUQaSh', 600892163, 'Alberto Parra Ruiz');
INSERT INTO usuario VALUES ('stmedina', '56743284K', 'j6MEus4h', 665110890, 'Sonia Torres Medina');
INSERT INTO usuario VALUES ('avmiranda', '65473877K', 'a7KyiUFF', 613252307, 'Adriana Vazquez Miranda');
INSERT INTO usuario VALUES ('sggarcia', '22314780L', 'yrE7b679', 608700931, 'Saul Gomez Garcia');
INSERT INTO usuario VALUES ('lpmedina', '23145236L', 'GUkuV5rD', 670897834, 'Lucia Perez Medina');
INSERT INTO usuario VALUES ('vgmartinez', '55400892G', 'T6obZiQa', 689932045, 'Veronica Gonzalo Martinez');
INSERT INTO usuario VALUES ('rmsalazar', '54430287J', 'paVuW9lC', 673940331, 'Ruth Morales Salazar');
INSERT INTO usuario VALUES ('vprodriguez', '45362734P', 'eoJTry5f', 659434491, 'Victor Perez Rodriguez');



ALTER TABLE encuesta
    ADD CONSTRAINT encuesta_nom_usuario_cita_pk PRIMARY KEY (nom_usuario, cita);

ALTER TABLE formacion
    ADD CONSTRAINT formacion_nom_usuario_formacion_pk PRIMARY KEY (nom_usuario, formacion);

ALTER TABLE gusta
    ADD CONSTRAINT gusta_nusu1_nusu2_pk PRIMARY KEY (nom_usuario_1, nom_usuario_2);

ALTER TABLE perfil
    ADD CONSTRAINT perfil_email_uk UNIQUE (email);

ALTER TABLE perfil
    ADD CONSTRAINT perfil_nom_usuario_pk PRIMARY KEY (nom_usuario);

ALTER TABLE practica
    ADD CONSTRAINT practica_nom_usuario_aficion_pk PRIMARY KEY (nom_usuario, aficion);

ALTER TABLE usuario
    ADD CONSTRAINT usuario_nif_uk UNIQUE (nif);

ALTER TABLE usuario
    ADD CONSTRAINT usuario_nom_usuario_pk PRIMARY KEY (nom_usuario);

ALTER TABLE formacion
    ADD CONSTRAINT formacion_nom_usuario_fk FOREIGN KEY (nom_usuario) REFERENCES usuario(nom_usuario) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE gusta
    ADD CONSTRAINT gusta_nom_usuario_1_fk FOREIGN KEY (nom_usuario_1) REFERENCES usuario(nom_usuario) ON UPDATE CASCADE ON DELETE CASCADE;



ALTER TABLE gusta
    ADD CONSTRAINT gusta_nom_usuario_2_fk FOREIGN KEY (nom_usuario_2) REFERENCES usuario(nom_usuario) ON UPDATE CASCADE ON DELETE CASCADE;



ALTER TABLE perfil
    ADD CONSTRAINT perfil_nom_usuario_fk FOREIGN KEY (nom_usuario) REFERENCES usuario(nom_usuario) ON UPDATE CASCADE ON DELETE CASCADE;



ALTER TABLE practica
    ADD CONSTRAINT practica_aficion_fk FOREIGN KEY (aficion) REFERENCES aficion(codigo) ON UPDATE CASCADE ON DELETE CASCADE;



ALTER TABLE practica
    ADD CONSTRAINT practica_nom_usuario_fk FOREIGN KEY (nom_usuario) REFERENCES usuario(nom_usuario) ON UPDATE CASCADE ON DELETE CASCADE;



ALTER TABLE encuesta
    ADD CONSTRAINT reunion_cita_fk FOREIGN KEY (cita) REFERENCES cita(id) ON UPDATE CASCADE ON DELETE CASCADE;



ALTER TABLE encuesta
    ADD CONSTRAINT reunion_nom_usuario_fk FOREIGN KEY (nom_usuario) REFERENCES usuario(nom_usuario) ON UPDATE CASCADE ON DELETE CASCADE;


DROP DATABASE IF EXISTS examen_recup_t3;
CREATE DATABASE examen_recup_t3;
USE examen_recup_t3;

CREATE TABLE categoria (
	id INT PRIMARY KEY,
    nombre VARCHAR(255),
    precio_min NUMERIC(10,2),
    precio_max NUMERIC(10,2)
);

CREATE TABLE articulo (
	id INT PRIMARY KEY,
    descripcion VARCHAR(255),
    categoria INT,
    precio NUMERIC (10,2),
    CONSTRAINT FOREIGN KEY (categoria) REFERENCES categoria(id)
);