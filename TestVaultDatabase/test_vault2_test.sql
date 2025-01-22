-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: test_vault2
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test` (
  `Catalog_ID` int DEFAULT NULL,
  `Test_id` int NOT NULL AUTO_INCREMENT,
  `Number_of_Questions` int DEFAULT NULL,
  `Admin_ID` int DEFAULT NULL,
  `Start_Time` date DEFAULT NULL,
  `End_Time` date DEFAULT NULL,
  `test_name` varchar(255) DEFAULT NULL,
  `Status` tinyint(1) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `list_of_questions` json DEFAULT NULL,
  `level` int DEFAULT NULL,
  `type` int DEFAULT NULL,
  `total_time` int DEFAULT NULL,
  PRIMARY KEY (`Test_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` VALUES (1,1,6,2,'2024-12-14','2024-12-25','This is test 1',1,'2024-12-14','[5, 4, 3, 2, 1, 19]',2,1,5),(3,2,10,2,'2024-12-14','2024-12-13','Math test ',0,'2024-12-14','[15, 14, 13, 12, 11, 10, 9, 8, 7, 6]',3,1,10),(2,3,5,2,'2024-12-14','2024-12-31','This is edited test',0,'2024-12-14','[5, 4, 3, 2, 1]',1,2,8),(2,4,3,2,'2024-12-14','2024-12-28','This is demo test 1',1,'2024-12-14','[18, 17, 16]',1,1,5),(2,5,2,2,'2024-12-14','2024-12-28','Testing',1,'2024-12-14','[21, 20]',3,1,5),(5,6,3,4,'2024-12-16','2024-12-28','edited',1,'2024-12-14','[23, 22, 24]',2,1,5),(4,7,1,4,'2024-12-14','2024-12-20','Coding',1,'2024-12-14','[6]',1,2,1),(1,8,3,4,'2024-12-14','2024-12-17','hello',1,'2024-12-14','[9, 8, 7]',1,2,16),(2,9,1,4,'2024-12-15','2024-12-25','Demo',1,'2024-12-15','[10]',1,2,2),(12,10,5,5,'2024-12-16','2024-12-27','Rust',1,'2024-12-15','[29, 28, 27, 26, 25]',1,1,5);
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-15 15:04:10
