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
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `User_id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) DEFAULT NULL,
  `Password` varchar(50) DEFAULT NULL,
  `Email_id` varchar(40) DEFAULT NULL,
  `Phone_No` varchar(10) DEFAULT NULL,
  `Exam_ids` json DEFAULT NULL,
  `pwd_Salt` varchar(100) NOT NULL,
  `pwd_hash` varchar(100) NOT NULL,
  `registered_test` json DEFAULT NULL,
  UNIQUE KEY `User_id` (`User_id`),
  UNIQUE KEY `Email_id` (`Email_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Raj Kumar',NULL,'raj@gmai.com','1234567899',NULL,'9TDbSWjrQ3','fe2db4dd31f69f2ad1218eb8c9622fd975819b903f8d069bf9862d3ec0d3727a','[3, 4, 1, 5]'),(2,'Riyaz',NULL,'monu@gmail.com','1234567895',NULL,'81VPjpd4h0','474cc99cbc90af67d5bb53a9356d112e9b503f518fcb4878aefaa46403768165','[]'),(3,'Anmol',NULL,'anmol@gmail.com','1234567898',NULL,'fPiudH7DjA','8e4d9498c27a720d8951878593dfe92753a8e4fddbc401a5d7ecc3e6b17c71f4','[7, 2, 1, 4, 5, 8, 9]'),(5,'Siddharth',NULL,'s@gmail.com','8765432121',NULL,'5lHxzR4doR','76d57266215fddafc4aff907633e3e7fba5265d1bd64910e5b621bae35804be0','[9, 8, 1]');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-15 15:04:07
