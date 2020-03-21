CREATE DATABASE  IF NOT EXISTS `abcbank1` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `abcbank1`;
-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: abcbank
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `account_id` int(50) NOT NULL,
  `account_type` varchar(45) NOT NULL,
  `account_name` varchar(45) NOT NULL,
  `account_address` varchar(100) NOT NULL,
  `account_status` varchar(45) NOT NULL,
  `email_id` varchar(55) NOT NULL,
  `mobile_number` varchar(55) NOT NULL,
  `account_balance` float NOT NULL,
  `date_open` datetime DEFAULT NULL,
  `date_closed` datetime DEFAULT NULL,
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (22,'saving','preethi','ann arbor','good','test123@gmail.com','343242342',10000,'2020-03-05 00:00:00',NULL),(52,'saving','prakash','novi','good','test12345@gmail.com','343242342',10000,'2020-03-05 00:00:00',NULL);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_transaction`
--

DROP TABLE IF EXISTS `account_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_transaction` (
  `account_id` int(50) NOT NULL,
  `transaction_no` varchar(50) NOT NULL,
  `transaction_date` datetime NOT NULL,
  `transaction_amount` float NOT NULL,
  `transaction_type` varchar(45) NOT NULL,
  `loan_id` int(50) NOT NULL,
  `payee_id` int(50) NOT NULL,
  `balance` float NOT NULL,
  PRIMARY KEY (`account_id`),
  KEY `payee_id_idx` (`payee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_transaction`
--

LOCK TABLES `account_transaction` WRITE;
/*!40000 ALTER TABLE `account_transaction` DISABLE KEYS */;
INSERT INTO `account_transaction` VALUES (67,'18787','0202-09-07 00:00:00',500,'cheque',16,686,0),(123,'243','2020-09-08 00:00:00',10000,'cash',123,66,0),(900,'1900','0202-09-07 00:00:00',500,'cheque',100,686,0);
/*!40000 ALTER TABLE `account_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_payee`
--

DROP TABLE IF EXISTS `bill_payee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill_payee` (
  `payee_id` int(50) NOT NULL,
  `account_id` int(50) NOT NULL,
  `payee_account_no` varchar(45) NOT NULL,
  `payee_phone` varchar(45) NOT NULL,
  `payee_address` varchar(100) NOT NULL,
  PRIMARY KEY (`payee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_payee`
--

LOCK TABLES `bill_payee` WRITE;
/*!40000 ALTER TABLE `bill_payee` DISABLE KEYS */;
INSERT INTO `bill_payee` VALUES (23,553,'356624','24823845','novi '),(100,500,'357724','24783845','novi '),(123,343,'34324','2482385945','chicago'),(1000,1001,'10004','2100385945','test1000');
/*!40000 ALTER TABLE `bill_payee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan`
--

DROP TABLE IF EXISTS `loan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loan` (
  `loan_id` int(50) NOT NULL,
  `loan_type` varchar(45) NOT NULL,
  `loan_amount` float NOT NULL,
  `user_id` int(50) NOT NULL,
  `account_id` int(50) NOT NULL,
  `loan_open_date` datetime NOT NULL,
  `loan_status` varchar(45) NOT NULL,
  `loan_term` int(50) NOT NULL,
  PRIMARY KEY (`loan_id`),
  KEY `user_id_idx` (`user_id`),
  KEY `account_id_idx` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan`
--

LOCK TABLES `loan` WRITE;
/*!40000 ALTER TABLE `loan` DISABLE KEYS */;
INSERT INTO `loan` VALUES (12,'auto',500,123,123123,'2020-02-03 01:00:05','good',1),(1201,'auto',500,123,123123,'2020-02-03 01:00:05','good',1),(1202,'auto',500,123,123123,'2020-02-03 01:00:05','good',1),(1204,'auto',500,123,123123,'2020-02-03 01:00:05','good',1),(1211,'home',500,123,123123,'2020-02-03 01:00:05','good',1424);
/*!40000 ALTER TABLE `loan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int(50) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `middle_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `address` varchar(100) NOT NULL,
  `email_id` varchar(100) NOT NULL,
  `mobile_number` varchar(20) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (22,'Vasu prkash','null ','prakash','24561 fountin park','vasukidhanaba234l@gmail.com','248238545','abcdef'),(23,'ram','null ','prashant','24561  park','ram234l@gmail.com','248238535','abcef'),(45,'Vasu','manickam ','prak','novi','vasuki234l@gmail.com','2482385','abcdef'),(343,'User 343','null ','343','24561 fountin park','vasukidhanaba234l@gmail.com','248238545','abcdef'),(3435,'User 343','null ','343','24561 fountin park','vasukidhanaba234l@gmail.com','248238545','abcdef'),(90001,'t900tUser 343','null ','343','9001 testing park','testing9001@gmail.com','900038545','ab9001'),(90002,'testUser ','null ','eight','24561 testing park','testing8000@gmail.com','24800045','ab8000');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_account`
--

DROP TABLE IF EXISTS `user_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_account` (
  `user_id` int(50) NOT NULL,
  `account_id` int(50) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_account`
--

LOCK TABLES `user_account` WRITE;
/*!40000 ALTER TABLE `user_account` DISABLE KEYS */;
INSERT INTO `user_account` VALUES (5,234234),(8,354),(22,242344),(24,44232),(101,44235);
/*!40000 ALTER TABLE `user_account` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-21 12:18:01
