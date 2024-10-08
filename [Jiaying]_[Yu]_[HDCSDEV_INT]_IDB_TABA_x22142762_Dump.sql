-- MySQL dump 10.13  Distrib 8.0.20, for macos10.15 (x86_64)
--
-- Host: localhost    Database: HMS
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `Doctor`
--

DROP TABLE IF EXISTS `Doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Doctor` (
  `D_id` int NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `D_name` varchar(50) DEFAULT NULL,
  `department` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`D_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Doctor`
--

LOCK TABLES `Doctor` WRITE;
/*!40000 ALTER TABLE `Doctor` DISABLE KEYS */;
INSERT INTO `Doctor` VALUES (3,'734-372-3834',119427.64,'7 Rockefeller Point','Ruddy Havik','Industrial'),(4,'446-874-4249',84588.01,'0 Sloan Street','Johny Dudenie','Books'),(5,'140-230-9490',181812.06,'045 Lake View Place','Robert Blackbourn','Jewelry'),(6,'205-441-7469',47733.46,'03 Forest Run Circle','Loreen Loyd','Shoes'),(16,'306-227-2408',1682.73,'81949 Gulseth Park','Aretha Sebrens','Neurology');
/*!40000 ALTER TABLE `Doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Guardian`
--

DROP TABLE IF EXISTS `Guardian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Guardian` (
  `G_name` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(20) DEFAULT NULL,
  `P_id` int DEFAULT NULL,
  KEY `P_id` (`P_id`),
  CONSTRAINT `guardian_ibfk_1` FOREIGN KEY (`P_id`) REFERENCES `Patient` (`P_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Guardian`
--

LOCK TABLES `Guardian` WRITE;
/*!40000 ALTER TABLE `Guardian` DISABLE KEYS */;
/*!40000 ALTER TABLE `Guardian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Patient`
--

DROP TABLE IF EXISTS `Patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Patient` (
  `P_id` int NOT NULL,
  `P_name` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `D_id` int DEFAULT NULL,
  `R_id` int DEFAULT NULL,
  `T_id` int DEFAULT NULL,
  PRIMARY KEY (`P_id`),
  KEY `D_id` (`D_id`),
  KEY `R_id` (`R_id`),
  KEY `T_id` (`T_id`),
  CONSTRAINT `patient_ibfk_1` FOREIGN KEY (`D_id`) REFERENCES `Doctor` (`D_id`),
  CONSTRAINT `patient_ibfk_2` FOREIGN KEY (`R_id`) REFERENCES `Room` (`R_id`),
  CONSTRAINT `patient_ibfk_3` FOREIGN KEY (`T_id`) REFERENCES `Test` (`T_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Patient`
--

LOCK TABLES `Patient` WRITE;
/*!40000 ALTER TABLE `Patient` DISABLE KEYS */;
INSERT INTO `Patient` VALUES (1,'Raeann Bodicum','6 Hanover Center','312-187-0043',76,28,8,28),(2,'Denney Laudham','987 Hermina Pass','722-672-7104',39,16,11,25),(3,'Sharleen Cuxson','1 Lerdahl Alley','734-504-8797',83,22,20,15),(4,'Wilfred Addison','30100 Sloan Circle','584-404-5036',92,3,25,29),(5,'Louis Medcalf','20765 Carey Street','634-755-8252',52,27,24,13),(6,'Sadie Riddoch','53461 8th Lane','497-112-4695',100,12,30,6),(7,'Ardelis Jacobsen','61392 Sutherland Plaza','901-946-5692',7,1,27,17),(8,'Wayne Versey','3690 Declaration Crossing','751-385-8711',99,20,NULL,8),(9,'Dale Edger','398 Pennsylvania Junction','571-789-1099',51,24,NULL,1),(10,'Renee Cossum','15 Briar Crest Plaza','621-219-1012',98,7,4,18),(11,'Estrellita Giral','7460 Randy Avenue','705-683-7021',5,4,7,11),(12,'Archambault Rolfo','54 Walton Road','682-145-8242',23,25,13,21),(13,'Don Nolda','70 Shasta Crossing','712-965-0097',69,6,5,16),(14,'Auberon Ong','69018 Mayfield Street','169-173-4795',31,26,1,10),(15,'Bone Beardmore','637 Graceland Plaza','892-717-0420',19,11,NULL,2),(16,'Willow Treagust','7 Anderson Point','391-963-9247',16,29,3,14),(17,'Scottie Foxhall','9247 Eliot Street','654-688-9230',65,18,2,30),(18,'Rudyard Turfes','64621 Portage Hill','610-322-6447',62,10,9,5),(19,'Yurik Camber','5 Sunnyside Parkway','252-804-5092',11,8,NULL,19),(20,'Hedda Barrack','92 Scoville Drive','817-629-8826',65,13,14,3),(21,'Con Labarre','8016 Rowland Drive','773-562-5158',63,5,10,23),(22,'Benito Barrett','59 American Way','887-920-0754',61,14,6,4),(23,'Jessa Dilliston','25443 Lake View Point','225-186-4698',82,19,16,12),(24,'Averyl Dennerley','176 Hooker Road','751-789-2924',33,21,NULL,22),(25,'Rollin O\'Grady','359 Oak Road','263-118-9215',92,9,NULL,27),(26,'Jay Randales','1 Bonner Hill','393-601-4033',78,17,28,24),(27,'Welby Notley','31 Coolidge Crossing','541-483-2110',69,2,17,7),(28,'Shelley Ilett','341 East Park','940-119-6220',67,30,NULL,9),(29,'Ailene MacKeig','7 Ohio Circle','780-474-7667',32,23,29,20),(30,'Costa Mettericke','74491 Gina Point','283-784-2599',60,15,NULL,26);
/*!40000 ALTER TABLE `Patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Room`
--

DROP TABLE IF EXISTS `Room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Room` (
  `R_id` int NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `price` int DEFAULT NULL,
  PRIMARY KEY (`R_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Room`
--

LOCK TABLES `Room` WRITE;
/*!40000 ALTER TABLE `Room` DISABLE KEYS */;
/*!40000 ALTER TABLE `Room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Test`
--

DROP TABLE IF EXISTS `Test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Test` (
  `T_id` int NOT NULL,
  `T_name` varchar(50) DEFAULT NULL,
  `T_description` varchar(50) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `T_date` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`T_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Test`
--

LOCK TABLES `Test` WRITE;
/*!40000 ALTER TABLE `Test` DISABLE KEYS */;
INSERT INTO `Test` VALUES (1,'Guaifenesin','Lead-induced chronic gout',91.84,'10/4/2022'),(2,'Avobenzone, Octisalate','Poisoning by oth systemic antibiotics',947.13,'10/3/2022'),(3,'Cefdinir','Unspecified open wound of unspecified upper arm',394.86,'12/8/2022');
/*!40000 ALTER TABLE `Test` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-12 18:49:04
