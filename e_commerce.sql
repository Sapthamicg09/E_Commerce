CREATE DATABASE  IF NOT EXISTS `e_commerce` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `e_commerce`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: e_commerce
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
-- Table structure for table `cart_items`
--

DROP TABLE IF EXISTS `cart_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `cart_items_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `cart_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_items`
--

LOCK TABLES `cart_items` WRITE;
/*!40000 ALTER TABLE `cart_items` DISABLE KEYS */;
INSERT INTO `cart_items` VALUES (3,4,3,3);
/*!40000 ALTER TABLE `cart_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) NOT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_name` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Shirts');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jwt_tokens`
--

DROP TABLE IF EXISTS `jwt_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jwt_tokens` (
  `token_id` int NOT NULL AUTO_INCREMENT,
  `expires_at` datetime(6) NOT NULL,
  `token` varchar(255) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`token_id`),
  KEY `FKhy6n4wirmw0ryw2wdmy9cx2mn` (`user_id`),
  CONSTRAINT `FKhy6n4wirmw0ryw2wdmy9cx2mn` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jwt_tokens`
--

LOCK TABLES `jwt_tokens` WRITE;
/*!40000 ALTER TABLE `jwt_tokens` DISABLE KEYS */;
INSERT INTO `jwt_tokens` VALUES (1,'2025-01-15 12:17:36.171379','eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJkaXNoYSIsInJvbGUiOiJDVVNUT01FUiIsImlhdCI6MTczNjkyMDA1NiwiZXhwIjoxNzM2OTIzNjU2fQ.bfKPDcVyx6frUTTPSdLKAF19aH20cqvThsIgsxf-bc1asMZYkr8iLy-JZYk2xgNFbowdnk7awiND1vO3DYWfEQ',4),(2,'2025-01-15 12:29:25.559867','eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJzYXB0aGFtaSIsInJvbGUiOiJBRE1JTiIsImlhdCI6MTczNjkyMDc2NSwiZXhwIjoxNzM2OTI0MzY1fQ.W_Kke1U3P_crya7RckzgWzNn-VN9T9OcNZRHMj7KBnbEsHN5rDiowde4Huq85vp-B6Dh5-O6v3wFD2c17gJS4A',3),(3,'2025-01-15 12:58:08.649230','eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJkaXNoYSIsInJvbGUiOiJDVVNUT01FUiIsImlhdCI6MTczNjkyMjQ4OCwiZXhwIjoxNzM2OTI2MDg4fQ.bttdR3UFsRruRSyWwCsrUqbQKVTC9v_kTWD__FYW0lR9cTCSs8E6f3yvmc5K4grdBkxuJh4fEyQxFS1F0KZ2BQ',4),(4,'2025-01-15 13:03:10.916113','eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJkaXNoYSIsInJvbGUiOiJDVVNUT01FUiIsImlhdCI6MTczNjkyMjc5MCwiZXhwIjoxNzM2OTI2MzkwfQ.GZkZnHMkTPg9T3qPUqwRfhQpoZckclTnV5sUT7_mudY-WK-IgmVqgLGk3MHPmfo0JXwYuDO9JaYNLBiUn7lgZQ',4),(5,'2025-01-15 13:08:54.111581','eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJkaXNoYSIsInJvbGUiOiJDVVNUT01FUiIsImlhdCI6MTczNjkyMzEzNCwiZXhwIjoxNzM2OTI2NzM0fQ.mFHeRyNsajo8B2OdFI0_kxw_vK8LnbV1-SCQNbawozNXUJD4QTP2EfPEId6erSdiyQj4fhM4FyGm3XTEuSD7Iw',4),(6,'2025-01-15 13:43:55.163327','eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJkaXNoYSIsInJvbGUiOiJDVVNUT01FUiIsImlhdCI6MTczNjkyNTIzNSwiZXhwIjoxNzM2OTI4ODM1fQ.YPO4FKl9jR2FdTFZQT5nRwl-wYaPsVLQg4tjd8xrGUfemGHwtIf7jftIi5AX6h7u0QGjCaTvTMAh5HtNxGMsGw',4),(7,'2025-01-15 20:51:36.126304','eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJzYXB0aGFtaSIsInJvbGUiOiJBRE1JTiIsImlhdCI6MTczNjk1MDg5NiwiZXhwIjoxNzM2OTU0NDk2fQ.XKffBZCvCHOLawbWJiVwfKR2YyI2ea5SMOY4GQU21CPA21Jat8tUfFPOgxaovjWfGoBFGgtIo1PIuW42z8uQbg',3),(8,'2025-01-15 20:51:58.732659','eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJuZXd1c2VyIiwicm9sZSI6IkNVU1RPTUVSIiwiaWF0IjoxNzM2OTUwOTE4LCJleHAiOjE3MzY5NTQ1MTh9.hrPYCizvSgsVe9jwzFPDybYzaPPBMuhnLj_mdo3p34Ef6SDVB1v9w1n75Mw7_dejsby720U4FBU30WNb7dlNhw',1),(9,'2025-01-15 20:59:51.759533','eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJzYXB0aGFtaSIsInJvbGUiOiJBRE1JTiIsImlhdCI6MTczNjk1MTM5MSwiZXhwIjoxNzM2OTU0OTkxfQ.wdJ1waV-jOjWzq-mH3HriT3BOLnNcDnb4SLbPOlMDq5rlSw6JEJJ_enoTWrDg_m-WexqQcDbjdtF2lumKS7XIg',3),(10,'2025-01-15 21:05:01.805359','eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJzYXB0aGFtaSIsInJvbGUiOiJBRE1JTiIsImlhdCI6MTczNjk1MTcwMSwiZXhwIjoxNzM2OTU1MzAxfQ.3F3ixQfThkcj1r5cKL8imj6lXBw47-n7t_diADVfQYECnYKs_ig0psk_3zQ6YTog4YDCuoOlR5AM0NV6qFAt5g',3),(11,'2025-01-15 21:05:42.063097','eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJzYXB0aGFtaSIsInJvbGUiOiJBRE1JTiIsImlhdCI6MTczNjk1MTc0MiwiZXhwIjoxNzM2OTU1MzQyfQ.5bAwyD_gH2L5a6srtz4IU7NhEfkUhvvYJd2j_pzrjPrMK8ZynPMLR0QGDikEE3hBg6gh6McwSHEJS0koAIiMNQ',3),(12,'2025-01-15 21:11:22.272465','eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJzYXB0aGFtaSIsInJvbGUiOiJBRE1JTiIsImlhdCI6MTczNjk1MjA4MiwiZXhwIjoxNzM2OTU1NjgyfQ.JqBuomv0C1fhkgcP0wRsPuNWqW2iz-Z9yUnwdZQ4HV6-JAR6Xpl66IgmabEJERKl9WySaKJp4GB0W-jV2Y0v4A',3),(13,'2025-01-16 17:41:16.377740','eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJzYXB0aGFtaSIsInJvbGUiOiJBRE1JTiIsImlhdCI6MTczNzAyNTg3NiwiZXhwIjoxNzM3MDI5NDc2fQ.AFVV75S53yJ6wvYz9Wzh03TfQSxFTx78XSe70RghpIskNdyYqbY9aCd2-qrRXuVzBvsW61IJ1FNcnXL817olLw',3),(14,'2025-01-16 18:11:53.324033','eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJuZXd1c2VyIiwicm9sZSI6IkNVU1RPTUVSIiwiaWF0IjoxNzM3MDI3NzEyLCJleHAiOjE3MzcwMzEzMTJ9.jBvAolCUB3d7WljHSXPkZfBzSUW6YgNI2v6vfz-biaLUq-rt9g4W9BB6kDGSZreaUvKn9bQSD9IVsPaLMlKvog',1),(15,'2025-01-16 18:13:44.614657','eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJuZXd1c2VyIiwicm9sZSI6IkNVU1RPTUVSIiwiaWF0IjoxNzM3MDI3ODI0LCJleHAiOjE3MzcwMzE0MjR9.66GYeLlzPK6VgJO_Cm-AQs38PHj62R1LbnRiNHix9qpAbKkAuAJNnGRwjjzQwBN-TZfkVMCdJG9FCz0GQ8VrTw',1),(16,'2025-01-16 18:37:01.229982','eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJuZXd1c2VyIiwicm9sZSI6IkNVU1RPTUVSIiwiaWF0IjoxNzM3MDI5MjIxLCJleHAiOjE3MzcwMzI4MjF9.MHRPR6IERoROMOQbu4gaQlt5v6EkdUhgdF-lz3yvuwMcp6HN4AkfVIaJypmReO0vFpWqLQHsbBt2vhEYrbeqcw',1),(17,'2025-01-16 18:38:29.364420','eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJuZXd1c2VyIiwicm9sZSI6IkNVU1RPTUVSIiwiaWF0IjoxNzM3MDI5MzA5LCJleHAiOjE3MzcwMzI5MDl9.RLISnoABifE7GYI-1f6n-RxaZw2vq8vThBXWmM5BqMMSb2axTnG5RSQLyiuyQlqgRrPPjRbiXVNg61fU3Xu9vA',1),(18,'2025-01-16 18:53:19.568275','eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJuZXd1c2VyIiwicm9sZSI6IkNVU1RPTUVSIiwiaWF0IjoxNzM3MDMwMTk5LCJleHAiOjE3MzcwMzM3OTl9.HRDePlqt2gTTLYNfPOvIaAAFHtJUDhSwYAYcW_ex_qQ0rlz9U24VQhbdyx6HS3d_k1LHban9nmFWvWF_xv46jQ',1),(19,'2025-01-16 19:05:38.570781','eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJuZXd1c2VyIiwicm9sZSI6IkNVU1RPTUVSIiwiaWF0IjoxNzM3MDMwOTM4LCJleHAiOjE3MzcwMzQ1Mzh9.HMFIK2D7_I-bw7F6R53f-zuKHl8gqYwXry6mrLEIHhMjYmEcvJm_MisOEkqq1jqCzrWI12kS6XH37vnSqmfNXw',1),(20,'2025-01-16 19:14:48.805621','eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJzYXB0aGFtaSIsInJvbGUiOiJBRE1JTiIsImlhdCI6MTczNzAzMTQ4OCwiZXhwIjoxNzM3MDM1MDg4fQ.mDSXh2-FSv15FNy9b38IqS15NjLCofxdyS3J9z-Fkfz5c_avtgddKtHGk3uJhW1mRG_LAbaekqZYx8ha06OsKQ',3),(21,'2025-01-16 19:15:00.753329','eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJkaXNoYSIsInJvbGUiOiJDVVNUT01FUiIsImlhdCI6MTczNzAzMTUwMCwiZXhwIjoxNzM3MDM1MTAwfQ.vf9E8aZwa1KqQM-kqACoMWXbp3ZvU9agndEmbn3lGTOQv4ZISZAhaV5uvLIUpWQzJn2OkwbBdUsF0KPSCttVLg',4),(22,'2025-01-16 19:23:49.989596','eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJkaXNoYSIsInJvbGUiOiJDVVNUT01FUiIsImlhdCI6MTczNzAzMjAyOSwiZXhwIjoxNzM3MDM1NjI5fQ._i2nUf-CYY6a51seQpSz9Jr4WR7qRLqdUdQEPkg6ztfCP5IIweRPpuSwTyTWbIgjb2X2TA22vqbIKFPQP-1xyQ',4),(23,'2025-01-16 19:28:02.921351','eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJkaXNoYSIsInJvbGUiOiJDVVNUT01FUiIsImlhdCI6MTczNzAzMjI4MiwiZXhwIjoxNzM3MDM1ODgyfQ.71k_gcl4zrA9iqaZNoYK_qsBon4fddaxeBIevKElgVyhOXeVTxDNkiKmdeQQWiv-q_Ym8AGtbPw2d-WTTamWGg',4),(24,'2025-01-16 19:33:45.529998','eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJkaXNoYSIsInJvbGUiOiJDVVNUT01FUiIsImlhdCI6MTczNzAzMjYyNSwiZXhwIjoxNzM3MDM2MjI1fQ.QR-9tgAq6RBuGzF8Ucuqas8laVlAanSgQ9g5IR8qNBz6eF50SOuQuPO0Czt5wYXSAi9Zn4plswMymiiZY537Ag',4),(25,'2025-01-16 19:40:46.478825','eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJkaXNoYSIsInJvbGUiOiJDVVNUT01FUiIsImlhdCI6MTczNzAzMzA0NiwiZXhwIjoxNzM3MDM2NjQ2fQ.eUd94T3n-FzObNudDQXuAsgMldHGMUvNeF3rYcQp0Pp6lkfh-9sKn_P8HV3RrOYpeuBfJic6R8_VjnX-3bi-kQ',4),(26,'2025-01-16 19:51:16.986971','eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJkaXNoYSIsInJvbGUiOiJDVVNUT01FUiIsImlhdCI6MTczNzAzMzY3NiwiZXhwIjoxNzM3MDM3Mjc2fQ.Z37w9WRBUQQSDYnkjzmmm_l5EdqhxuZaj_cLMj3Wv0-_Ij7o9bGAWUeoljeiI6D2IbuOIxzUswQUyE0__O9ARA',4),(27,'2025-01-16 19:53:12.401186','eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJkaXNoYSIsInJvbGUiOiJDVVNUT01FUiIsImlhdCI6MTczNzAzMzc5MiwiZXhwIjoxNzM3MDM3MzkyfQ.BKoW5k2a_JAZ9NMFyCpBppw3TnK2_rE3ym0AOIx4bNIeC7cVByBse-BrmDQE0w7M-TmpWpwVaM5-0XY__FT0aA',4),(28,'2025-01-16 20:11:58.248081','eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJkaXNoYSIsInJvbGUiOiJDVVNUT01FUiIsImlhdCI6MTczNzAzNDkxOCwiZXhwIjoxNzM3MDM4NTE4fQ.FNAJfFUnoz6nB-duK8h5ims4ztUNs7tiGyRdoe2xS9ZsrQfbrlfhY4EHDmwLVbIjS-cyAbahgf8FKhETyFQb-A',4);
/*!40000 ALTER TABLE `jwt_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` varchar(255) NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `price_per_unit` decimal(10,2) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` varchar(255) NOT NULL,
  `user_id` int NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `status` enum('PENDING','SUCCESS','FAILED') DEFAULT 'PENDING',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productimages`
--

DROP TABLE IF EXISTS `productimages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productimages` (
  `image_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `image_url` text NOT NULL,
  PRIMARY KEY (`image_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `productimages_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productimages`
--

LOCK TABLES `productimages` WRITE;
/*!40000 ALTER TABLE `productimages` DISABLE KEYS */;
INSERT INTO `productimages` VALUES (1,1,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/shirt1.png'),(2,2,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/shirt2.png'),(3,3,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/shirt3.png'),(4,4,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/shirt4.png'),(5,5,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/shirt5.png'),(6,6,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/shirt6.png'),(7,7,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/shirt7.png'),(8,8,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/shirt8.png'),(9,9,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/shirt9.png'),(10,10,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/shirt10.png'),(11,11,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/shirt11.png'),(12,12,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/shirt12.png'),(13,13,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/shirt13.png'),(14,14,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/shirt14.png'),(15,15,'https://kodnest-docs.b-cdn.net/salessavvy/COSTOMER%20IMAGES/shirt15.png');
/*!40000 ALTER TABLE `productimages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  `price` decimal(10,2) NOT NULL,
  `stock` int NOT NULL,
  `category_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Shirt1','Stylish Shirt1',499.99,100,1,'2025-01-15 06:02:45','2025-01-15 06:02:45'),(2,'Shirt2','Stylish Shirt2',599.99,100,1,'2025-01-15 06:02:45','2025-01-15 06:02:45'),(3,'Shirt3','Stylish Shirt3',699.99,100,1,'2025-01-15 06:02:45','2025-01-15 06:02:45'),(4,'Shirt4','Stylish Shirt4',799.99,100,1,'2025-01-15 06:02:45','2025-01-15 06:02:45'),(5,'Shirt5','Stylish Shirt5',899.99,100,1,'2025-01-15 06:02:45','2025-01-15 06:02:45'),(6,'Shirt6','Stylish Shirt6',999.99,100,1,'2025-01-15 06:02:45','2025-01-15 06:02:45'),(7,'Shirt7','Stylish Shirt7',1099.99,100,1,'2025-01-15 06:02:45','2025-01-15 06:02:45'),(8,'Shirt8','Stylish Shirt8',1199.99,100,1,'2025-01-15 06:02:45','2025-01-15 06:02:45'),(9,'Shirt9','Stylish Shirt9',1299.99,100,1,'2025-01-15 06:02:45','2025-01-15 06:02:45'),(10,'Shirt10','Stylish Shirt10',1399.99,100,1,'2025-01-15 06:02:45','2025-01-15 06:02:45'),(11,'Shirt11','Stylish Shirt11',1499.99,100,1,'2025-01-15 06:02:45','2025-01-15 06:02:45'),(12,'Shirt12','Stylish Shirt12',1599.99,100,1,'2025-01-15 06:02:45','2025-01-15 06:02:45'),(13,'Shirt13','Stylish Shirt13',1699.99,100,1,'2025-01-15 06:02:45','2025-01-15 06:02:45'),(14,'Shirt14','Stylish Shirt14',1799.99,100,1,'2025-01-15 06:02:45','2025-01-15 06:02:45'),(15,'Shirt15','Stylish Shirt15',1899.99,100,1,'2025-01-15 06:02:45','2025-01-15 06:02:45');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('ADMIN','CUSTOMER') NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_at` datetime(6) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'newuser','user@gmail.com','$2a$10$WeSE9Ip8PpENBKeA6AzLoOU4Q1gPlP4ypyucV6pgzRJZ5p.j45inK','CUSTOMER','2025-01-14 06:19:05','2025-01-14 06:19:05','2025-01-14 11:49:05.074218'),(2,'sapth','sapth@gmail.com','$2a$10$0wV0pnjGRv/1WxaNfcuhyunFF7JZ11l7wa9m02rHiOM9pQO0I7Mp6','ADMIN','2025-01-14 12:54:18','2025-01-14 12:54:18','2025-01-14 18:24:17.951959'),(3,'sapthami','sapthami@gmail.com','$2a$10$NKytwM5y0uDGfNeQnPOmmOx6USHBcSogmtE55T7/jj7zcLht4hoWW','ADMIN','2025-01-15 05:28:38','2025-01-15 05:28:38','2025-01-15 10:58:38.368620'),(4,'disha','disha@gmail.com','$2a$10$tB053Egp8QdpIYWQMNRwYeztQPjQ/RANQXKUnNhfWfzBAvbNY3WU2','CUSTOMER','2025-01-15 05:47:27','2025-01-15 05:47:27','2025-01-15 11:17:26.681299');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'e_commerce'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-17 11:08:58
