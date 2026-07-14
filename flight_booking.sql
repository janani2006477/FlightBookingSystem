-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: flight_booking
-- ------------------------------------------------------
-- Server version       8.0.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `admin_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`admin_id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'admin','admin123','admin@skybook.com','System Administrator','2026-04-15 05:40:30');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `booking_id` int NOT NULL AUTO_INCREMENT,
  `booking_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(20) DEFAULT NULL,
  `passenger_id` int DEFAULT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`booking_id`),
  KEY `passenger_id` (`passenger_id`),
  CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`passenger_id`) REFERENCES `passenger` (`passenger_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (1,'2026-04-08 17:59:25','Confirmed',1,5000.00),(2,'2026-04-08 17:59:25','Pending',2,2500.00),(3,'2026-04-08 17:59:25','Cancelled',3,3000.00),(4,'2026-04-13 10:02:29','Confirmed',1,NULL),(5,'2026-04-13 10:19:08','Confirmed',6,NULL),(6,'2026-04-13 10:21:39','Confirmed',6,NULL),(7,'2026-04-13 10:24:54','Confirmed',6,NULL),(8,'2026-04-13 10:25:19','Confirmed',7,NULL),(9,'2026-04-13 10:48:21','Confirmed',8,NULL),(10,'2026-04-13 10:50:10','Confirmed',8,NULL),(11,'2026-04-13 10:52:29','Confirmed',8,NULL),(12,'2026-04-13 10:52:38','Confirmed',8,NULL),(13,'2026-04-14 16:21:57','Confirmed',6,NULL),(14,'2026-04-14 19:04:43','Confirmed',9,6000.00),(15,'2026-04-14 19:16:00','Confirmed',10,3000.00),(16,'2026-04-15 04:08:46','Cancelled',12,6000.00),(17,'2026-04-15 05:06:28','Confirmed',12,3000.00),(18,'2026-04-15 10:26:49','Confirmed',10,3000.00),(19,'2026-04-22 09:15:05','Confirmed',16,3000.00),(20,'2026-04-22 11:32:11','Confirmed',17,6000.00),(21,'2026-04-27 03:48:20','Confirmed',4,3000.00),(22,'2026-04-27 04:42:56','Confirmed',4,6000.00),(23,'2026-04-27 04:50:24','Confirmed',4,3000.00);
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flight`
--

DROP TABLE IF EXISTS `flight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flight` (
  `flight_id` int NOT NULL AUTO_INCREMENT,
  `airline_name` varchar(100) DEFAULT NULL,
  `source` varchar(100) DEFAULT NULL,
  `destination` varchar(100) DEFAULT NULL,
  `departure_time` timestamp NULL DEFAULT NULL,
  `arrival_time` timestamp NULL DEFAULT NULL,
  `total_seats` int DEFAULT NULL,
  PRIMARY KEY (`flight_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight`
--

LOCK TABLES `flight` WRITE;
/*!40000 ALTER TABLE `flight` DISABLE KEYS */;
INSERT INTO `flight` VALUES (1,'Air India','Delhi','Mumbai','2026-04-10 02:30:00','2026-04-10 04:30:00',150),(2,'IndiGo','Bangalore','Chennai','2026-04-11 04:00:00','2026-04-11 05:30:00',120),(3,'SpiceJet','Kolkata','Hyderabad','2026-04-12 01:15:00','2026-04-12 03:45:00',100),(4,'IndiGo','Delhi','Chennai','2026-05-01 00:00:00','2026-05-01 02:30:00',180),(5,'SpiceJet','Delhi','Bangalore','2026-05-01 02:30:00','2026-05-01 05:15:00',160),(6,'Vistara','Delhi','Hyderabad','2026-05-01 05:30:00','2026-05-01 07:45:00',150),(7,'Air India','Delhi','Kolkata','2026-05-01 08:30:00','2026-05-01 11:00:00',170),(8,'Go First','Delhi','Pune','2026-05-01 11:30:00','2026-05-01 13:30:00',140),(9,'Akasa Air','Mumbai','Kolkata','2026-05-02 00:30:00','2026-05-02 03:15:00',165),(10,'AirAsia','Mumbai','Chennai','2026-05-02 04:00:00','2026-05-02 06:00:00',155),(11,'IndiGo','Mumbai','Bangalore','2026-05-02 07:30:00','2026-05-02 09:15:00',175),(12,'SpiceJet','Mumbai','Hyderabad','2026-05-02 10:30:00','2026-05-02 12:00:00',145),(13,'Vistara','Mumbai','Goa','2026-05-02 13:30:00','2026-05-02 15:00:00',135),(14,'Air India','Bangalore','Delhi','2026-05-03 01:00:00','2026-05-03 03:45:00',185),(15,'Go First','Bangalore','Mumbai','2026-05-03 04:30:00','2026-05-03 06:15:00',155),(16,'Akasa Air','Bangalore','Kolkata','2026-05-03 08:00:00','2026-05-03 10:30:00',140),(17,'AirAsia','Chennai','Delhi','2026-05-03 11:30:00','2026-05-03 14:15:00',160),(18,'IndiGo','Chennai','Mumbai','2026-05-03 15:00:00','2026-05-03 16:45:00',150),(19,'Vistara','Delhi','Jaipur','2026-05-04 02:30:00','2026-05-04 03:30:00',120),(20,'SpiceJet','Mumbai','Ahmedabad','2026-05-04 04:30:00','2026-05-04 05:45:00',130),(21,'Air India','Bangalore','Coimbatore','2026-05-04 06:30:00','2026-05-04 07:30:00',110),(22,'IndiGo','Kolkata','Guwahati','2026-05-04 08:30:00','2026-05-04 10:00:00',125),(23,'Go First','Hyderabad','Visakhapatnam','2026-05-04 10:30:00','2026-05-04 11:45:00',115),(25,'range','coimbatore','chennai','2026-04-24 11:29:00','2026-04-30 11:29:00',67);
/*!40000 ALTER TABLE `flight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passenger`
--

DROP TABLE IF EXISTS `passenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passenger` (
  `passenger_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `role` varchar(20) DEFAULT 'user',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`passenger_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passenger`
--

LOCK TABLES `passenger` WRITE;
/*!40000 ALTER TABLE `passenger` DISABLE KEYS */;
INSERT INTO `passenger` VALUES (1,'Janani G.S','janani@example.com','9876543210','pass123','user','2026-04-15 06:40:53'),(2,'Arun Kumar','arun@example.com','9876501234','arun456','user','2026-04-15 06:40:53'),(3,'Sneha R','sneha@example.com','9876549876','sneha789','user','2026-04-15 06:40:53'),(4,'JANANI GS','janani@gmail.com','9876543210','1234','user','2026-04-15 06:40:53'),(5,'BAVI','bavi@gmail.com','8903282306','4567','user','2026-04-15 06:40:53'),(6,'gayathiri','gayathiri@gmail.com','6381941358','12345','user','2026-04-15 06:40:53'),(7,'rani','rani@gmail.com','1234567890','rani','user','2026-04-15 06:40:53'),(8,'RAJA','raja@gmail.com','4561237890','raja','user','2026-04-15 06:40:53'),(9,'YAMINI','yamini@gmail.com','98765 44678','yamini@123','user','2026-04-15 06:40:53'),(10,'nila','nila@gmail.com','1234567890','nila@123','user','2026-04-15 06:40:53'),(12,'hema','hema@gmail.com','1234567890','hema@123','user','2026-04-15 06:40:53'),(13,'chandru','chandru@gmail.com','1234567890','chandru@123','user','2026-04-15 06:40:53'),(14,'System Admin','admin@skybook.com','9999999999','admin123','admin','2026-04-15 06:40:53'),(16,'manju','manju@gmail.com','123456789','manju@gmail.com','user','2026-04-22 09:12:27'),(17,'kavya','kavya@gmail.com','123456789','kavya@123','user','2026-04-22 11:30:59');
/*!40000 ALTER TABLE `passenger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `amount` decimal(10,2) DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `payment_status` varchar(20) DEFAULT NULL,
  `booking_id` int DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  UNIQUE KEY `booking_id` (`booking_id`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`booking_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,5000.00,'Credit Card','Paid',1),(2,2500.00,'UPI','Pending',2),(3,3000.00,'Debit Card','Paid',6),(4,3000.00,'Credit Card','Paid',7),(5,3000.00,'Debit Card','Paid',8),(6,3000.00,'UPI','Paid',9),(7,6000.00,'Debit Card','Paid',10),(8,3000.00,'Debit Card','Paid',11),(9,3000.00,'Debit Card','Paid',12),(10,6000.00,'Debit Card','Paid',13),(11,6000.00,'Credit Card','Paid',14),(12,3000.00,'Credit Card','Paid',15),(13,6000.00,'Credit Card','Refunded',16),(14,3000.00,'UPI','Paid',17),(15,3000.00,'Credit Card','Paid',18),(16,3000.00,'Credit Card','Paid',19),(17,6000.00,'Credit Card','Paid',20),(18,3000.00,'Credit Card','Paid',21),(19,6000.00,'Credit Card','Paid',22),(20,3000.00,'Credit Card','Paid',23);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `ticket_id` int NOT NULL AUTO_INCREMENT,
  `seat_number` varchar(10) DEFAULT NULL,
  `class` varchar(20) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `booking_id` int DEFAULT NULL,
  `flight_id` int DEFAULT NULL,
  PRIMARY KEY (`ticket_id`),
  KEY `booking_id` (`booking_id`),
  KEY `flight_id` (`flight_id`),
  CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`booking_id`),
  CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`flight_id`) REFERENCES `flight` (`flight_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (1,'1A','Business',5000.00,1,1),(2,'12B','Economy',2500.00,2,2),(3,'5C','Economy',3000.00,3,3),(4,'A21','Economy',3000.00,5,2),(5,'A15','Economy',3000.00,6,2),(6,'A5','Economy',3000.00,7,3),(7,'A3','Economy',3000.00,8,3),(8,'A1','Economy',3000.00,9,1),(9,'A16','Business',6000.00,10,1),(10,'A22','Economy',3000.00,11,1),(11,'A2','Economy',3000.00,12,3),(12,'A3','Business',6000.00,13,1),(13,'A10','Business',6000.00,14,1),(14,'F5','Economy',3000.00,15,2),(15,'F7','Business',6000.00,16,4),(16,'E1','Economy',3000.00,17,20),(17,'A10','Economy',3000.00,18,2),(18,'F9','Economy',3000.00,19,1),(19,'C10','Business',6000.00,20,25),(20,'C6','Economy',3000.00,21,1),(21,'D4','Business',6000.00,22,1),(22,'B9','Economy',3000.00,23,1);
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-07-15  0:56:27