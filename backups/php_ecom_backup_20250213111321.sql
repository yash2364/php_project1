-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: 192.168.249.110    Database: php_ecom
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `price` varchar(50) NOT NULL,
  `image` varchar(255) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'laptop','1049','1725374561.jpg','test','test@gmail.com','015484512','test','Delivered'),(2,'Watch','599','1725374663.webp','test','test@gmail.com','015484512','test','Delivered'),(3,'camera','330','1725374772.jpg','test','test@gmail.com','015484512','test','Delivered'),(11,'Makeup ','580','1725375028.jpg','yamin','yamin@gmail.com','234567','dhaka , bangladesh','Delivered'),(12,'camera','330','1725374772.jpg','yamin','yamin@gmail.com','234567','dhaka , bangladesh','Delivered'),(21,'laptop','1049','1725374561.jpg','yamin','yamin@gmail.com','234567','dhaka , bangladesh','In progress'),(22,'laptop','1049','1725374561.jpg','yamin','yamin@gmail.com','234567','dhaka , bangladesh','In progress'),(23,'laptop','1049','1725374561.jpg','test','test@gmail.com','015484512','test','In progress'),(24,'laptop','1049','1725374561.jpg','user','user@gmail.com','12345678','germany','In progress'),(25,'Watch','599','1725374663.webp','user','user@gmail.com','12345678','germany','In progress'),(26,'Makeup ','580','1725375028.jpg','adam','adam@gmail.com','1234567','india','In progress'),(27,'laptop','1049','1725374561.jpg','adam','adam@gmail.com','1234567','india','In progress'),(28,'laptop','1049','1725374561.jpg','adam','adam@gmail.com','1234567','india','In progress'),(29,'camera','330','1725374772.jpg','user','user@gmail.com','12345678','germany','In progress'),(30,'Mobile','499','1725374753.jpeg','user','user@gmail.com','12345678','germany','In progress'),(31,'Black T Shirt','39','1725374617.jpeg','yamin','yamin@gmail.com','234567','dhaka , bangladesh','In progress'),(32,'Watch','599','1725374663.webp','test','test@gmail.com','015484512','test','In progress');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `description` longtext NOT NULL,
  `price` varchar(50) NOT NULL,
  `quantity` varchar(50) NOT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (2,'Makeup ','cosmetics such as lipstick or powder applied to the face, used to enhance or alter the appearance','580','110','1725375028.jpg'),(5,'camera','black camera																										','330','5','1725374772.jpg'),(6,'laptop','Laptops are compact, portable versions of full-fledged Desktop Computers. ','1049','120','1725374561.jpg'),(7,'Black T Shirt','Complete Your Wardrobe with a Black Cotton Combo T-Shirt & Pant for Men - T-Shirt for Men - Very Comfortable and Fashionable','39','500','1725374617.jpeg'),(8,'Watch','Rolex watches are crafted from the finest raw materials and assembled with scrupulous attention to detail. ','599','50','1725374663.webp'),(9,'Mobile','hen something is mobile it can move or be moved easily. If you walk to the end of the block talking on your cell phone, you are a mobile being using a mobile device.','499','120','1725374753.jpeg');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `usertype` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'test','test@gmail.com','12345678','015484512','test','user'),(4,'admin','admin@gmail.com','123456','258520','canda','admin'),(8,'user','user@gmail.com','12345678','12345678','germany','user'),(9,'yamin','yamin@gmail.com','12345678','234567','dhaka , bangladesh','user'),(10,'adam','adam@gmail.com','12345678','1234567','india','user');
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

-- Dump completed on 2025-02-13 11:13:21
