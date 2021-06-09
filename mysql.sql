-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: shop
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2021_05_13_222224_create_sessions_table',1),(5,'2021_05_24_184608_create_products_table',2),(6,'2021_05_27_131728_add_brand_colour_column',3),(8,'2021_05_29_155754_create_orders_table',4);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total` decimal(8,2) unsigned NOT NULL,
  `status` enum('Being prepared','Received','Cancelled','On hold') COLLATE utf8mb4_unicode_ci NOT NULL,
  `products` json NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,0,'2021-05-29 19:36:30','2021-05-29 19:36:30',200.25,'Received','{\"products\": [{\"id\": 1, \"price\": 125, \"discount\": 0, \"quantity\": 2}, {\"id\": 2, \"price\": 100, \"discount\": 0, \"quantity\": 1}]}'),(2,0,'2021-05-29 19:36:30','2021-05-29 19:36:30',200.25,'On hold','{\"products\": [{\"id\": 1, \"price\": 125, \"discount\": 0, \"quantity\": 2}, {\"id\": 2, \"price\": 100, \"discount\": 0, \"quantity\": 1}]}'),(3,0,'2021-05-29 19:36:30','2021-05-29 19:36:30',200.25,'Being prepared','{\"products\": [{\"id\": 1, \"price\": 125, \"discount\": 0, \"quantity\": 2}, {\"id\": 2, \"price\": 100, \"discount\": 0, \"quantity\": 1}]}'),(4,0,'2021-05-29 19:36:30','2021-05-29 19:36:30',200.25,'Cancelled','{\"products\": [{\"id\": 1, \"price\": 125, \"discount\": 0, \"quantity\": 2}, {\"id\": 2, \"price\": 100, \"discount\": 0, \"quantity\": 1}]}');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`),
  CONSTRAINT `password_resets_ibfk_1` FOREIGN KEY (`email`) REFERENCES `users` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand` enum('Armani','Versace','Carlo Bruni','Jack Honey') COLLATE utf8mb4_unicode_ci NOT NULL,
  `colors` enum('white','blue','green','Yellow','Red') COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` smallint unsigned NOT NULL,
  `sale` double(8,8) unsigned NOT NULL,
  `gift` bigint unsigned DEFAULT NULL,
  `img1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `gift` (`gift`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`gift`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'White Blouse Armani','Armani','white',250,0.50000000,3,'/img/product2.jpg','/img/product2_2.jpg','2021-05-26 06:56:20','2021-05-26 06:56:20'),(2,'abc','Armani','white',250,0.00000000,1,'/img/product2.jpg','/img/product2_2.jpg','2021-05-26 06:58:27','2021-05-26 06:58:27'),(3,'abc','Armani','white',300,0.60000000,NULL,'/img/product2.jpg','/img/product2_2.jpg','2021-05-26 06:58:56','2021-05-26 06:58:56'),(4,'abc','Armani','white',300,0.60000000,NULL,'/img/product2.jpg','/img/product2_2.jpg','2021-05-26 11:54:05','2021-05-26 11:54:05'),(5,'abc','Armani','white',300,0.60000000,NULL,'/img/product2.jpg','/img/product2_2.jpg','2021-05-26 11:54:07','2021-05-26 11:54:07'),(6,'abc','Armani','white',300,0.60000000,NULL,'/img/product2.jpg','/img/product2_2.jpg','2021-05-26 11:54:08','2021-05-26 11:54:08'),(7,'abc','Armani','white',300,0.60000000,NULL,'/img/product2.jpg','/img/product2_2.jpg','2021-05-26 11:54:09','2021-05-26 11:54:09'),(8,'abc','Armani','white',300,0.60000000,NULL,'/img/product2.jpg','/img/product2_2.jpg','2021-05-26 11:54:09','2021-05-26 11:54:09'),(9,'abc','Armani','white',300,0.60000000,NULL,'/img/product2.jpg','/img/product2_2.jpg','2021-05-26 11:54:10','2021-05-26 11:54:10'),(10,'abc','Armani','white',300,0.60000000,NULL,'/img/product2.jpg','/img/product2_2.jpg','2021-05-26 11:54:11','2021-05-26 11:54:11'),(11,'abc','Armani','white',300,0.60000000,NULL,'/img/product2.jpg','/img/product2_2.jpg','2021-05-26 11:54:11','2021-05-26 11:54:11'),(12,'page 1','Armani','white',300,0.60000000,NULL,'/img/product2.jpg','/img/product2_2.jpg','2021-05-26 11:54:12','2021-05-26 11:54:12'),(13,'page 2','Armani','white',300,0.60000000,NULL,'/img/product2.jpg','/img/product2_2.jpg','2021-05-26 11:54:12','2021-05-26 11:54:12'),(14,'abc','Armani','white',300,0.60000000,NULL,'/img/product2.jpg','/img/product2_2.jpg','2021-05-26 11:54:13','2021-05-26 11:54:13'),(15,'abc','Armani','white',300,0.60000000,NULL,'/img/product2.jpg','/img/product2_2.jpg','2021-05-26 11:54:14','2021-05-26 11:54:14'),(16,'abc','Armani','white',300,0.60000000,NULL,'/img/product2.jpg','/img/product2_2.jpg','2021-05-26 11:54:14','2021-05-26 11:54:14'),(17,'abc','Armani','white',300,0.60000000,NULL,'/img/product2.jpg','/img/product2_2.jpg','2021-05-26 11:54:15','2021-05-26 11:54:15'),(18,'abc','Armani','white',300,0.60000000,NULL,'/img/product2.jpg','/img/product2_2.jpg','2021-05-26 11:54:15','2021-05-26 11:54:15'),(19,'abc','Armani','white',300,0.60000000,NULL,'/img/product2.jpg','/img/product2_2.jpg','2021-05-26 11:54:16','2021-05-26 11:54:16'),(20,'abc','Armani','white',300,0.60000000,NULL,'/img/product2.jpg','/img/product2_2.jpg','2021-05-26 11:54:17','2021-05-26 11:54:17'),(21,'abc','Armani','white',300,0.60000000,NULL,'/img/product2.jpg','/img/product2_2.jpg','2021-05-26 11:54:17','2021-05-26 11:54:17'),(22,'abc','Armani','white',300,0.60000000,NULL,'/img/product2.jpg','/img/product2_2.jpg','2021-05-26 11:54:19','2021-05-26 11:54:19'),(23,'abc','Armani','white',300,0.60000000,NULL,'/img/product2.jpg','/img/product2_2.jpg','2021-05-26 11:54:20','2021-05-26 11:54:20'),(24,'abc','Armani','white',300,0.60000000,NULL,'/img/product2.jpg','/img/product2_2.jpg','2021-05-26 11:54:20','2021-05-26 11:54:20'),(25,'page 3','Armani','white',300,0.60000000,NULL,'/img/product2.jpg','/img/product2_2.jpg','2021-05-26 11:54:21','2021-05-26 11:54:21'),(26,'abc','Armani','white',300,0.60000000,NULL,'/img/product2.jpg','/img/product2_2.jpg','2021-05-26 11:54:22','2021-05-26 11:54:22'),(27,'abc','Armani','white',300,0.60000000,NULL,'/img/product2.jpg','/img/product2_2.jpg','2021-05-26 11:54:22','2021-05-26 11:54:22'),(28,'page 3','Armani','white',300,0.60000000,NULL,'/img/product2.jpg','/img/product2_2.jpg','2021-05-26 12:05:12','2021-05-26 12:05:12'),(29,'page 3','Armani','white',300,0.60000000,NULL,'/img/product2.jpg','/img/product2_2.jpg','2021-05-26 12:05:13','2021-05-26 12:05:13'),(30,'page 3','Armani','white',300,0.60000000,NULL,'/img/product2.jpg','/img/product2_2.jpg','2021-05-26 12:05:13','2021-05-26 12:05:13'),(31,'page 3','Armani','white',300,0.60000000,NULL,'/img/product2.jpg','/img/product2_2.jpg','2021-05-26 12:05:14','2021-05-26 12:05:14'),(32,'page 3','Armani','white',300,0.60000000,NULL,'/img/product2.jpg','/img/product2_2.jpg','2021-05-26 12:05:15','2021-05-26 12:05:15'),(33,'page 3','Armani','white',300,0.60000000,NULL,'/img/product2.jpg','/img/product2_2.jpg','2021-05-26 12:05:15','2021-05-26 12:05:15'),(34,'page 3','Armani','white',300,0.60000000,NULL,'/img/product2.jpg','/img/product2_2.jpg','2021-05-26 12:05:16','2021-05-26 12:05:16'),(35,'page 3','Armani','white',300,0.60000000,NULL,'/img/product2.jpg','/img/product2_2.jpg','2021-05-26 12:05:17','2021-05-26 12:05:17'),(36,'page 3','Armani','white',300,0.60000000,NULL,'/img/product2.jpg','/img/product2_2.jpg','2021-05-26 12:05:18','2021-05-26 12:05:18'),(37,'page 4','Armani','white',300,0.60000000,NULL,'/img/product2.jpg','/img/product2_2.jpg','2021-05-26 12:05:19','2021-05-26 12:05:19'),(38,'Fur coat with very but very very long name','Armani','white',300,0.60000000,NULL,'/img/product1.jpg','/img/product1_2.jpg','2021-05-26 12:08:06','2021-05-26 12:08:06'),(39,'Black Blouse Versace','Armani','white',300,0.60000000,NULL,'/img/product3.jpg','/img/product1_3.jpg','2021-05-26 12:08:47','2021-05-26 12:08:47'),(40,'Black Blouse Versace','Armani','white',300,0.60000000,NULL,'/img/product3.jpg','/img/product1_3.jpg','2021-05-26 12:09:06','2021-05-26 12:09:06'),(41,'Black Blouse Versace','Armani','white',300,0.60000000,NULL,'/img/product3.jpg','/img/product1_3.jpg','2021-05-26 12:09:39','2021-05-26 12:09:39');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`),
  CONSTRAINT `sessions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('aSzZe0CmgC4V5gJ0wT9XcJdhTWql4jzviIjBLt5f',0,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36 Edg/90.0.818.66','YTo1OntzOjY6Il90b2tlbiI7czo0MDoieEZqcUtRcmQ4TlpFcmpiTUh0THI1SUZQdVFxc2UwOVNxRWdZZUNJUCI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MDtzOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czoyOToiaHR0cDovL2xhcmF2ZWwubG9jYWxob3N0L3RleHQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjY6ImJhc2tldCI7YTo0OntzOjg6InByb2R1Y3RzIjthOjI6e2k6MDthOjY6e3M6MjoiaWQiO2k6MTtzOjQ6Im5hbWUiO3M6MTk6IldoaXRlIEJsb3VzZSBBcm1hbmkiO3M6NToicHJpY2UiO2Q6MTIzO3M6ODoiZGlzY291bnQiO2k6MDtzOjg6InF1YW50aXR5IjtpOjI7czo1OiJ0b3RhbCI7ZDoyNDY7fWk6MTthOjY6e3M6MjoiaWQiO2k6MjtzOjQ6Im5hbWUiO3M6MTk6IldoaXRlIEJsb3VzZSBBcm1hbmkiO3M6NToicHJpY2UiO2Q6MTAwO3M6ODoiZGlzY291bnQiO2k6MTA7czo4OiJxdWFudGl0eSI7aToxO3M6NToidG90YWwiO2Q6OTA7fX1zOjM6InRheCI7aToxMDtzOjEzOiJzaGlwQW5kSGFuZGxlIjtpOjUwO3M6NToidG90YWwiO2k6MzM2O319',1622417200),('pdwmZqaEyqAcDdTOGydI8HMZNsl5unNuGnmQAxOH',0,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36 Edg/91.0.864.37','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiTFVZUTE0WnVjVDhoV1h0NlNCd2VCVEI2VWFjS2ZtdUR6clB4Y090ZyI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MDtzOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czozMzoiaHR0cDovL2xhcmF2ZWwubG9jYWxob3N0L2NhdGVnb3J5Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1622460861);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `fname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (0,'Raghed','Kahil','rdkl2000@gmail.com','2021-05-29 21:31:12','$2y$10$QMEcldGwlkeqvaa5908xte2JqdQPmmYTytV.BFgbO3gxPYh72eHwS','iH8oaSwKVFJE4d8VHeFgK6ECPzHbbJmiRmQ0IApkZibKZbsEXwoXR97DOAb2','2021-05-29 16:07:32','2021-05-29 16:07:32');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-31 14:45:45
