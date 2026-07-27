-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: cybercrimedb
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `cases`
--

DROP TABLE IF EXISTS `cases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cases` (
  `CaseID` int NOT NULL AUTO_INCREMENT,
  `CaseTitle` varchar(150) NOT NULL,
  `CrimeType` varchar(50) NOT NULL,
  `Status` varchar(30) NOT NULL,
  `Priority` varchar(20) NOT NULL,
  `DateOpened` date NOT NULL,
  `DateClosed` date DEFAULT NULL,
  `LeadOfficerID` int DEFAULT NULL,
  PRIMARY KEY (`CaseID`),
  KEY `LeadOfficerID` (`LeadOfficerID`),
  CONSTRAINT `cases_ibfk_1` FOREIGN KEY (`LeadOfficerID`) REFERENCES `officers` (`OfficerID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cases`
--

LOCK TABLES `cases` WRITE;
/*!40000 ALTER TABLE `cases` DISABLE KEYS */;
INSERT INTO `cases` VALUES (1,'National Bank Phishing Scam','Phishing','Open','High','2026-01-10',NULL,1),(2,'Hospital Ransomware Attack','Ransomware','Open','Critical','2026-02-05',NULL,4),(3,'Credit Card Fraud Network','Financial Fraud','Closed','Medium','2026-01-15','2026-03-20',2),(4,'Social Media Identity Theft','Identity Theft','Open','High','2026-03-01',NULL,3),(5,'Cryptocurrency Investment Scam','Crypto Scam','Under Investigation','High','2026-03-12',NULL,5),(6,'Corporate Data Breach','Data Breach','Open','Critical','2026-04-02',NULL,7),(7,'Online Shopping Fraud','E-commerce Fraud','Closed','Medium','2026-02-18','2026-04-01',6),(8,'Government Email Compromise','Email Compromise','Open','Critical','2026-04-15',NULL,8),(9,'Fake Loan Application Portal','Web Fraud','Under Investigation','Medium','2026-05-08',NULL,9),(10,'Dark Web Drug Marketplace','Dark Web Crime','Open','Critical','2026-05-20',NULL,10);
/*!40000 ALTER TABLE `cases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chainofcustody`
--

DROP TABLE IF EXISTS `chainofcustody`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chainofcustody` (
  `CustodyID` int NOT NULL AUTO_INCREMENT,
  `EvidenceID` int NOT NULL,
  `OfficerID` int NOT NULL,
  `TransferDate` datetime NOT NULL,
  `ReceivedDate` datetime DEFAULT NULL,
  `Purpose` varchar(200) NOT NULL,
  PRIMARY KEY (`CustodyID`),
  KEY `EvidenceID` (`EvidenceID`),
  KEY `OfficerID` (`OfficerID`),
  CONSTRAINT `chainofcustody_ibfk_1` FOREIGN KEY (`EvidenceID`) REFERENCES `digitalevidence` (`EvidenceID`),
  CONSTRAINT `chainofcustody_ibfk_2` FOREIGN KEY (`OfficerID`) REFERENCES `officers` (`OfficerID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chainofcustody`
--

LOCK TABLES `chainofcustody` WRITE;
/*!40000 ALTER TABLE `chainofcustody` DISABLE KEYS */;
INSERT INTO `chainofcustody` VALUES (1,1,1,'2026-01-12 09:30:00','2026-01-12 09:35:00','Initial Collection'),(2,1,3,'2026-01-13 10:00:00','2026-01-13 10:05:00','Forensic Analysis'),(3,2,2,'2026-01-12 11:00:00','2026-01-12 11:10:00','Initial Collection'),(4,3,4,'2026-02-07 14:00:00','2026-02-07 14:15:00','Malware Analysis'),(5,4,2,'2026-01-17 09:00:00','2026-01-17 09:10:00','Financial Investigation'),(6,5,3,'2026-03-03 13:30:00','2026-03-03 13:40:00','Browser Analysis'),(7,6,5,'2026-03-14 10:20:00','2026-03-14 10:30:00','Crypto Wallet Analysis'),(8,7,7,'2026-04-04 15:00:00','2026-04-04 15:05:00','Database Investigation'),(9,8,6,'2026-02-20 11:45:00','2026-02-20 11:50:00','Email Examination'),(10,9,8,'2026-04-17 16:00:00','2026-04-17 16:10:00','Document Verification'),(11,10,9,'2026-05-10 12:00:00','2026-05-10 12:05:00','Log Analysis'),(12,11,10,'2026-05-22 09:15:00','2026-05-22 09:20:00','Password Recovery'),(13,12,10,'2026-05-22 15:00:00','2026-05-22 15:10:00','Video Examination');
/*!40000 ALTER TABLE `chainofcustody` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devices`
--

DROP TABLE IF EXISTS `devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `devices` (
  `DeviceID` int NOT NULL AUTO_INCREMENT,
  `CaseID` int NOT NULL,
  `SuspectID` int NOT NULL,
  `DeviceType` varchar(30) NOT NULL,
  `Brand` varchar(50) DEFAULT NULL,
  `Model` varchar(50) DEFAULT NULL,
  `SerialNumber` varchar(100) DEFAULT NULL,
  `DateSeized` date NOT NULL,
  PRIMARY KEY (`DeviceID`),
  UNIQUE KEY `SerialNumber` (`SerialNumber`),
  KEY `CaseID` (`CaseID`),
  KEY `SuspectID` (`SuspectID`),
  CONSTRAINT `devices_ibfk_1` FOREIGN KEY (`CaseID`) REFERENCES `cases` (`CaseID`),
  CONSTRAINT `devices_ibfk_2` FOREIGN KEY (`SuspectID`) REFERENCES `suspects` (`SuspectID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devices`
--

LOCK TABLES `devices` WRITE;
/*!40000 ALTER TABLE `devices` DISABLE KEYS */;
INSERT INTO `devices` VALUES (1,1,1,'Laptop','Dell','Latitude 7420','DL7420001','2026-01-11'),(2,1,2,'Mobile','Samsung','Galaxy S24','SM240001','2026-01-11'),(3,2,3,'Desktop','HP','EliteDesk 800','HP800001','2026-02-06'),(4,3,4,'USB Drive','SanDisk','Ultra 64GB','SD640001','2026-01-16'),(5,4,5,'Laptop','Apple','MacBook Pro M3','MBP30001','2026-03-02'),(6,5,6,'Mobile','Google','Pixel 9','PX900001','2026-03-13'),(7,6,7,'External HDD','Seagate','Backup Plus','SG100001','2026-04-03'),(8,7,8,'Laptop','Lenovo','ThinkPad X1','LNX10001','2026-02-19'),(9,8,9,'Tablet','Apple','iPad Pro','IPD10001','2026-04-16'),(10,9,10,'Desktop','Dell','OptiPlex 7010','OP701001','2026-05-09'),(11,10,11,'Mobile','OnePlus','12','OP120001','2026-05-21'),(12,10,12,'Laptop','Asus','ROG Zephyrus','ASR001','2026-05-21');
/*!40000 ALTER TABLE `devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `digitalevidence`
--

DROP TABLE IF EXISTS `digitalevidence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `digitalevidence` (
  `EvidenceID` int NOT NULL AUTO_INCREMENT,
  `DeviceID` int NOT NULL,
  `CaseID` int NOT NULL,
  `EvidenceType` varchar(50) NOT NULL,
  `FileName` varchar(150) NOT NULL,
  `FileSizeMB` decimal(10,2) DEFAULT NULL,
  `HashValue` varchar(255) DEFAULT NULL,
  `DateCollected` date NOT NULL,
  `CollectedBy` int NOT NULL,
  `CurrentStatus` varchar(30) DEFAULT 'Collected',
  PRIMARY KEY (`EvidenceID`),
  UNIQUE KEY `HashValue` (`HashValue`),
  KEY `DeviceID` (`DeviceID`),
  KEY `CaseID` (`CaseID`),
  KEY `CollectedBy` (`CollectedBy`),
  CONSTRAINT `digitalevidence_ibfk_1` FOREIGN KEY (`DeviceID`) REFERENCES `devices` (`DeviceID`),
  CONSTRAINT `digitalevidence_ibfk_2` FOREIGN KEY (`CaseID`) REFERENCES `cases` (`CaseID`),
  CONSTRAINT `digitalevidence_ibfk_3` FOREIGN KEY (`CollectedBy`) REFERENCES `officers` (`OfficerID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `digitalevidence`
--

LOCK TABLES `digitalevidence` WRITE;
/*!40000 ALTER TABLE `digitalevidence` DISABLE KEYS */;
INSERT INTO `digitalevidence` VALUES (1,1,1,'Chat Logs','whatsapp_backup.zip',125.40,'SHA256_A1B2C3D4E5F6','2026-01-12',1,'Collected'),(2,2,1,'Images','gallery_dump.zip',450.75,'SHA256_B2C3D4E5F6G7','2026-01-12',2,'Collected'),(3,3,2,'Ransomware Sample','locker.exe',18.90,'SHA256_C3D4E5F6G7H8','2026-02-07',4,'Under Analysis'),(4,4,3,'Financial Records','transactions.xlsx',8.25,'SHA256_D4E5F6G7H8I9','2026-01-17',2,'Verified'),(5,5,4,'Browser History','history.db',12.80,'SHA256_E5F6G7H8I9J0','2026-03-03',3,'Collected'),(6,6,5,'Crypto Wallet','wallet.dat',3.10,'SHA256_F6G7H8I9J0K1','2026-03-14',5,'Under Analysis'),(7,7,6,'Database Backup','customers.sql',780.50,'SHA256_G7H8I9J0K1L2','2026-04-04',7,'Collected'),(8,8,7,'Email Archive','emails.pst',230.00,'SHA256_H8I9J0K1L2M3','2026-02-20',6,'Verified'),(9,9,8,'PDF Documents','classified_docs.pdf',16.40,'SHA256_I9J0K1L2M3N4','2026-04-17',8,'Collected'),(10,10,9,'Website Logs','server_logs.txt',95.60,'SHA256_J0K1L2M3N4O5','2026-05-10',9,'Collected'),(11,11,10,'Password Database','passwords.kdbx',4.30,'SHA256_K1L2M3N4O5P6','2026-05-22',10,'Verified'),(12,12,10,'Video Recording','cctv_clip.mp4',1024.75,'SHA256_L2M3N4O5P6Q7','2026-05-22',10,'Collected');
/*!40000 ALTER TABLE `digitalevidence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evidencelogs`
--

DROP TABLE IF EXISTS `evidencelogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evidencelogs` (
  `LogID` int NOT NULL AUTO_INCREMENT,
  `EvidenceID` int NOT NULL,
  `Action` varchar(100) NOT NULL,
  `ActionDate` datetime NOT NULL,
  `PerformedBy` int NOT NULL,
  `Remarks` text,
  PRIMARY KEY (`LogID`),
  KEY `EvidenceID` (`EvidenceID`),
  KEY `PerformedBy` (`PerformedBy`),
  CONSTRAINT `evidencelogs_ibfk_1` FOREIGN KEY (`EvidenceID`) REFERENCES `digitalevidence` (`EvidenceID`),
  CONSTRAINT `evidencelogs_ibfk_2` FOREIGN KEY (`PerformedBy`) REFERENCES `officers` (`OfficerID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evidencelogs`
--

LOCK TABLES `evidencelogs` WRITE;
/*!40000 ALTER TABLE `evidencelogs` DISABLE KEYS */;
INSERT INTO `evidencelogs` VALUES (1,1,'Evidence Collected','2026-01-12 09:30:00',1,'Collected from suspect laptop'),(2,1,'Transferred for Analysis','2026-01-13 10:00:00',3,'Transferred to Digital Forensics'),(3,2,'Image Archive Created','2026-01-12 11:15:00',2,'Mobile gallery extracted'),(4,3,'Malware Signature Verified','2026-02-07 15:30:00',4,'Hash verified successfully'),(5,4,'Financial Records Reviewed','2026-01-17 10:45:00',2,'Suspicious transactions identified'),(6,5,'Browser History Extracted','2026-03-03 14:00:00',3,'History database recovered'),(7,6,'Wallet Decrypted','2026-03-14 11:20:00',5,'Private wallet data recovered'),(8,7,'Database Backup Analysed','2026-04-04 16:00:00',7,'Customer records inspected'),(9,8,'Email Archive Processed','2026-02-20 12:15:00',6,'Inbox and sent items exported'),(10,9,'Document Metadata Verified','2026-04-17 16:45:00',8,'Metadata matched case details'),(11,10,'Server Logs Parsed','2026-05-10 13:00:00',9,'Suspicious login attempts found'),(12,11,'Password Database Opened','2026-05-22 10:00:00',10,'Credential database examined'),(13,12,'Video Footage Reviewed','2026-05-22 16:00:00',10,'Relevant timestamps marked');
/*!40000 ALTER TABLE `evidencelogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `officers`
--

DROP TABLE IF EXISTS `officers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `officers` (
  `OfficerID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `OfficerRank` varchar(30) NOT NULL,
  `Department` varchar(100) NOT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `Email` varchar(100) NOT NULL,
  PRIMARY KEY (`OfficerID`),
  UNIQUE KEY `Email` (`Email`),
  UNIQUE KEY `Phone` (`Phone`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `officers`
--

LOCK TABLES `officers` WRITE;
/*!40000 ALTER TABLE `officers` DISABLE KEYS */;
INSERT INTO `officers` VALUES (1,'Sarah','Johnson','Inspector','Cyber Crime Unit','9876543210','sarah.johnson@cyber.gov'),(2,'Ahmed','Khan','Sub Inspector','Digital Forensics','9876543211','ahmed.khan@cyber.gov'),(3,'David','Miller','Inspector','Cyber Crime Unit','9876543212','david.miller@cyber.gov'),(4,'Priya','Sharma','ACP','Financial Cyber Cell','9876543213','priya.sharma@cyber.gov'),(5,'Rohan','Patil','Inspector','Malware Investigation','9876543214','rohan.patil@cyber.gov'),(6,'Emily','Brown','Sub Inspector','Cyber Crime Unit','9876543215','emily.brown@cyber.gov'),(7,'Arjun','Mehta','Inspector','Digital Forensics','9876543216','arjun.mehta@cyber.gov'),(8,'Fatima','Ali','ACP','Cyber Intelligence','9876543217','fatima.ali@cyber.gov'),(9,'Michael','Scott','Inspector','Cyber Crime Unit','9876543218','michael.scott@cyber.gov'),(10,'Sneha','Kulkarni','Sub Inspector','Evidence Management','9876543219','sneha.kulkarni@cyber.gov');
/*!40000 ALTER TABLE `officers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `opencases`
--

DROP TABLE IF EXISTS `opencases`;
/*!50001 DROP VIEW IF EXISTS `opencases`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `opencases` AS SELECT 
 1 AS `CaseID`,
 1 AS `CaseTitle`,
 1 AS `CrimeType`,
 1 AS `Priority`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `suspects`
--

DROP TABLE IF EXISTS `suspects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suspects` (
  `SuspectID` int NOT NULL AUTO_INCREMENT,
  `CaseID` int NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Age` int DEFAULT NULL,
  `Nationality` varchar(50) DEFAULT NULL,
  `Status` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`SuspectID`),
  KEY `CaseID` (`CaseID`),
  CONSTRAINT `suspects_ibfk_1` FOREIGN KEY (`CaseID`) REFERENCES `cases` (`CaseID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suspects`
--

LOCK TABLES `suspects` WRITE;
/*!40000 ALTER TABLE `suspects` DISABLE KEYS */;
INSERT INTO `suspects` VALUES (1,1,'Rahul','Sharma',28,'Indian','Under Investigation'),(2,1,'Ayesha','Khan',25,'Indian','Arrested'),(3,2,'John','Peterson',41,'American','Under Investigation'),(4,3,'Vikram','Patel',35,'Indian','Released'),(5,4,'Maria','Lopez',30,'Spanish','Arrested'),(6,5,'Kevin','White',38,'Canadian','Under Investigation'),(7,6,'Anjali','Deshmukh',29,'Indian','Arrested'),(8,7,'Ali','Hassan',32,'UAE','Released'),(9,8,'Rohan','Gupta',27,'Indian','Under Investigation'),(10,9,'Emma','Wilson',34,'British','Arrested'),(11,10,'Noah','Taylor',31,'Australian','Under Investigation'),(12,10,'Sophia','Brown',26,'American','Arrested');
/*!40000 ALTER TABLE `suspects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `opencases`
--

/*!50001 DROP VIEW IF EXISTS `opencases`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `opencases` AS select `cases`.`CaseID` AS `CaseID`,`cases`.`CaseTitle` AS `CaseTitle`,`cases`.`CrimeType` AS `CrimeType`,`cases`.`Priority` AS `Priority` from `cases` where (`cases`.`Status` = 'Open') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-07-27 14:47:00
