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
-- Table structure for table `mcqquestions`
--

DROP TABLE IF EXISTS `mcqquestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mcqquestions` (
  `question_id` int NOT NULL AUTO_INCREMENT,
  `question_title` varchar(255) NOT NULL,
  `options` json NOT NULL,
  `correct_answers` json NOT NULL,
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mcqquestions`
--

LOCK TABLES `mcqquestions` WRITE;
/*!40000 ALTER TABLE `mcqquestions` DISABLE KEYS */;
INSERT INTO `mcqquestions` VALUES (1,'Which of the following is not a java features','[\"Dynamic\", \"Architecture Neutral\", \"Use of pointers\", \"object oriented \", \"Scripting\"]','[3, 5]'),(2,'How many oops pillars are in java','[\"1\", \"2\", \"3\", \"4\", \"5\", \"6\"]','[4]'),(3,'What is use to print in new line','[\"System.out.println();\", \"System.out();\", \"System.out.print();\", \"System.out.println(\\\\n);\"]','[1, 4]'),(4,'which is correct way of declaring variable','[\"let a = 10;\", \"int a = 10;\", \"const a = 10;\", \"var a = 10;\", \"final int a = 10;\"]','[2, 5]'),(5,'Which keyword is used to declare constant in java','[\"var\", \"int\", \"const\", \"final\", \"let\", \"None of above\"]','[4]'),(6,'2+2*0+2 = ?','[\"0\", \"1\", \"2\", \"3\", \"4\", \"5\"]','[5]'),(7,'what is 2*radius of circle','[\"Diameter\", \"Radian\"]','[1]'),(8,'what is 7 multiply 5 nine times ','[\"52521875\", \"23456\", \"4567\", \"34567\", \"345678\", \"8765\"]','[1]'),(9,'2+2=?','[\"4\", \"22\", \"32\", \"42\", \"21\", \"2\"]','[1, 2]'),(10,'+ is used for','[\"Sum\", \"Addition\", \"Concatination\", \"Substraction\"]','[1, 2]'),(11,'What is 5*2 =?','[\"10\", \"12\", \"15\"]','[1]'),(12,'Pie =?','[\"22/7\", \"3.14\", \"22.8\"]','[1, 2]'),(13,'Formula of area of circle','[\"(22/7)*radius*radius\", \"(22/7)*radius\"]','[1]'),(14,'Area of rectangle','[\"L+B\", \"L/B\", \"L*B\"]','[3]'),(15,'Which figure has all sides equal','[\"Square\", \"Rectangle\", \"Circle\", \"Cuboid\", \"Cube\"]','[1, 5]'),(16,'what is full form of oops','[\"object oriented programming\", \"object of programming\"]','[1]'),(17,'what we use to store integer value','[\"int\", \"long\", \"var\", \"boolean\"]','[1]'),(18,'what is size of int in bytes','[\"2\", \"1\", \"4\", \"8\"]','[3]'),(19,'6/0','[\"0\", \"Undefined\", \"1\", \"6\"]','[1, 2]'),(20,'how to declare a variable','[\"a =10;\", \"int a=7;\", \"let a =9;\"]','[1]'),(21,'how to print in python','[\"print\", \"System.out.print();\"]','[1]'),(22,'Question 1','[\"1\", \"2\", \"3\", \"4\", \"5\", \"6\"]','[1]'),(23,'Question 2','[\"6\", \"5\", \"4\", \"3\", \"2\", \"1\"]','[1]'),(24,'question 3','[\"1\", \"2\"]','[1]'),(25,'What is Rust?','[\"Game\", \"  Programming Language\"]','[2]'),(26,'How many pillars of oops are their','[\"1\", \"2\", \"3\", \"4\"]','[4]'),(27,'Why we use final','[\"To create constant \", \"To declare variable\"]','[1]'),(28,'why we int','[\"to declare a integer variable\", \"to store float value\", \"to store boolean value\"]','[1]'),(29,'what we use to print in new line','[\"System.out.println();\", \"System.out.print();\", \"print\", \"console.log\"]','[1]');
/*!40000 ALTER TABLE `mcqquestions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-15 15:04:04
