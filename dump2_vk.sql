-- MySQL dump 10.13  Distrib 8.0.23, for Linux (x86_64)
--
-- Host: localhost    Database: vk
-- ------------------------------------------------------
-- Server version	8.0.23-0ubuntu0.20.04.1

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
-- Table structure for table `communities`
--

DROP TABLE IF EXISTS `communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `communities` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор сроки',
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Название группы',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Группы';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communities`
--

LOCK TABLES `communities` WRITE;
/*!40000 ALTER TABLE `communities` DISABLE KEYS */;
INSERT INTO `communities` VALUES (1,'recusandae','2016-06-13 09:53:49','2019-07-22 10:15:05'),(2,'sunt','2016-10-02 22:10:26','2012-12-08 23:42:19'),(3,'aut','2011-07-30 10:46:24','2011-04-13 00:10:57'),(4,'consequatur','2020-08-29 12:30:58','2017-01-26 04:32:17'),(5,'ullam','2019-07-14 00:01:58','2016-09-08 19:45:14'),(6,'quia','2017-01-27 01:51:02','2014-09-25 08:03:07'),(7,'unde','2015-02-09 08:12:39','2013-05-05 18:09:13'),(8,'exercitationem','2016-09-04 10:52:43','2019-07-17 00:17:17'),(9,'voluptas','2017-12-20 04:33:41','2013-12-15 20:56:44'),(10,'veritatis','2011-04-28 00:59:51','2020-11-01 04:09:32');
/*!40000 ALTER TABLE `communities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `communities_users`
--

DROP TABLE IF EXISTS `communities_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `communities_users` (
  `community_id` int unsigned NOT NULL COMMENT 'Ссылка на группу',
  `user_id` int unsigned NOT NULL COMMENT 'Ссылка на пользователя',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  PRIMARY KEY (`community_id`,`user_id`) COMMENT 'Составной первичный ключ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Участники групп, связь между пользователями и группами';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communities_users`
--

LOCK TABLES `communities_users` WRITE;
/*!40000 ALTER TABLE `communities_users` DISABLE KEYS */;
INSERT INTO `communities_users` VALUES (1,41,'2016-06-25 00:00:00'),(1,62,'2000-01-04 00:00:00'),(1,84,'2017-10-18 00:00:00'),(2,3,'1984-10-22 00:00:00'),(2,15,'2015-06-19 00:00:00'),(2,25,'2017-06-06 00:00:00'),(2,34,'2001-01-02 00:00:00'),(2,40,'2015-06-19 00:00:00'),(2,44,'2005-11-06 00:00:00'),(2,77,'1994-06-01 00:00:00'),(2,79,'2015-06-18 00:00:00'),(3,53,'2018-09-18 00:00:00'),(3,65,'2000-08-29 00:00:00'),(3,86,'2015-06-19 00:00:00'),(4,9,'2017-11-02 00:00:00'),(4,99,'2015-06-19 00:00:00'),(5,39,'1988-01-04 00:00:00'),(5,51,'1980-07-16 00:00:00'),(6,2,'2015-06-18 00:00:00'),(6,17,'2020-08-08 00:00:00'),(6,18,'1988-12-11 00:00:00'),(6,79,'2017-10-18 00:00:00'),(7,2,'2005-07-24 00:00:00'),(7,12,'2012-10-29 00:00:00'),(7,63,'2007-05-11 00:00:00'),(7,65,'1997-07-28 00:00:00'),(8,92,'2018-09-18 00:00:00'),(9,59,'2020-08-03 00:00:00'),(10,28,'2016-06-25 00:00:00'),(10,32,'2015-06-19 00:00:00');
/*!40000 ALTER TABLE `communities_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friendship`
--

DROP TABLE IF EXISTS `friendship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `friendship` (
  `user_id` int unsigned NOT NULL COMMENT 'Ссылка на инициатора дружеских отношений',
  `friend_id` int unsigned NOT NULL COMMENT 'Ссылка на получателя приглашения дружить',
  `friendship_status_id` int unsigned NOT NULL COMMENT 'Ссылка на статус (текущее состояние) отношений',
  `requested_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время отправления приглашения дружить',
  `confirmed_at` datetime DEFAULT NULL COMMENT 'Время подтверждения приглашения',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`user_id`,`friend_id`) COMMENT 'Составной первичный ключ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Таблица дружбы';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friendship`
--

LOCK TABLES `friendship` WRITE;
/*!40000 ALTER TABLE `friendship` DISABLE KEYS */;
INSERT INTO `friendship` VALUES (3,79,1,'2019-12-30 16:30:20','2021-04-05 17:02:41','2021-04-05 17:02:41','2021-04-05 17:02:44'),(11,60,2,'2015-05-11 01:57:59','2021-04-05 17:02:41','2021-04-05 17:02:41','2021-04-05 17:02:44'),(12,84,1,'2020-11-16 02:33:44','2021-04-05 17:02:41','2021-04-05 17:02:41','2021-04-05 17:02:44'),(13,71,1,'2015-02-17 23:05:00','2017-06-12 10:59:53','2017-06-12 10:59:53','2021-04-05 17:02:44'),(15,1,1,'2014-08-18 14:08:33','2021-04-05 17:02:41','2021-04-05 17:02:41','2021-04-05 17:02:44'),(18,60,1,'2012-10-07 18:33:47','2018-06-10 01:46:53','2018-06-10 01:46:53','2021-04-05 17:02:44'),(19,16,2,'2016-04-05 10:26:19','2021-04-05 17:02:41','2021-04-05 17:02:41','2021-04-05 17:02:44'),(19,48,2,'2015-09-13 14:06:53','2021-04-05 17:02:41','2021-04-05 17:02:41','2021-04-05 17:02:44'),(19,85,3,'2018-06-06 16:30:52','2019-03-29 00:24:52','2019-03-29 00:24:52','2021-04-05 17:02:44'),(20,16,1,'2021-02-08 04:03:59','2021-04-05 17:02:41','2021-04-05 17:02:41','2021-04-05 17:02:44'),(20,19,2,'2016-12-10 05:13:12','2017-03-07 07:00:48','2017-03-07 07:00:48','2021-04-05 17:02:44'),(24,71,3,'2016-03-07 01:44:21','2018-06-23 01:56:43','2018-06-23 01:56:43','2021-04-05 17:02:44'),(25,59,3,'2015-06-15 21:09:34','2017-05-11 19:20:59','2017-05-11 19:20:59','2021-04-05 17:02:44'),(25,67,1,'2018-04-14 13:02:09','2021-04-05 17:02:41','2021-04-05 17:02:41','2021-04-05 17:02:44'),(26,98,1,'2016-08-21 16:05:01','2021-04-05 17:02:41','2021-04-05 17:02:41','2021-04-05 17:02:44'),(30,44,1,'2020-09-15 22:53:09','2021-04-05 17:02:41','2021-04-05 17:02:41','2021-04-05 17:02:44'),(32,3,1,'2017-07-16 05:33:59','2020-10-14 11:36:00','2020-10-14 11:36:00','2021-04-05 17:02:44'),(43,82,1,'2016-10-16 21:53:06','2021-04-05 17:02:41','2021-04-05 17:02:41','2021-04-05 17:02:44'),(45,46,2,'2020-04-18 14:04:45','2021-04-05 17:02:41','2021-04-05 17:02:41','2021-04-05 17:02:44'),(46,80,3,'2018-07-29 03:16:55','2021-04-05 17:02:41','2021-04-05 17:02:41','2021-04-05 17:02:44'),(49,32,3,'2015-11-06 04:18:27','2021-04-05 17:02:41','2021-04-05 17:02:41','2021-04-05 17:02:44'),(52,50,3,'2013-05-25 07:05:34','2014-03-18 15:18:39','2014-03-18 15:18:39','2021-04-05 17:02:44'),(57,4,1,'2020-02-09 14:27:16','2021-04-05 17:02:41','2021-04-05 17:02:41','2021-04-05 17:02:44'),(57,30,1,'2020-07-27 11:32:33','2021-04-05 17:02:41','2021-04-05 17:02:41','2021-04-05 17:02:44'),(57,84,3,'2014-12-15 00:45:38','2018-07-17 00:03:00','2018-07-17 00:03:00','2021-04-05 17:02:44'),(58,90,1,'2019-03-11 00:45:58','2021-04-05 17:02:41','2021-04-05 17:02:41','2021-04-05 17:02:44'),(60,58,1,'2017-08-09 15:26:43','2021-04-05 17:02:41','2021-04-05 17:02:41','2021-04-05 17:02:44'),(64,33,1,'2011-11-16 06:29:41','2020-06-12 06:39:40','2020-06-12 06:39:40','2021-04-05 17:02:44'),(66,51,3,'2018-05-30 21:57:42','2021-04-05 17:02:41','2021-04-05 17:02:41','2021-04-05 17:02:44'),(68,37,3,'2018-12-24 09:21:24','2021-04-05 17:02:41','2021-04-05 17:02:41','2021-04-05 17:02:44'),(68,86,3,'2016-08-06 17:10:31','2021-04-05 17:02:41','2021-04-05 17:02:41','2021-04-05 17:02:44'),(71,57,2,'2017-05-16 21:52:15','2021-04-05 17:02:41','2021-04-05 17:02:41','2021-04-05 17:02:44'),(72,69,1,'2016-12-27 14:33:23','2021-04-05 17:02:41','2021-04-05 17:02:41','2021-04-05 17:02:44'),(72,88,1,'2014-07-21 20:39:51','2021-04-05 17:02:41','2021-04-05 17:02:41','2021-04-05 17:02:44'),(76,9,1,'2015-06-23 22:25:15','2021-04-05 17:02:41','2021-04-05 17:02:41','2021-04-05 17:02:44'),(77,86,1,'2014-09-15 16:41:14','2021-04-05 17:02:41','2021-04-05 17:02:41','2021-04-05 17:02:44'),(78,1,1,'2011-06-19 07:04:45','2020-04-17 20:07:11','2020-04-17 20:07:11','2021-04-05 17:02:44'),(81,60,3,'2017-06-16 07:22:26','2018-10-21 15:37:11','2018-10-21 15:37:11','2021-04-05 17:02:44'),(81,91,3,'2019-08-28 02:42:39','2021-04-05 17:02:41','2021-04-05 17:02:41','2021-04-05 17:02:44'),(82,63,3,'2017-09-09 14:55:29','2020-02-06 03:35:58','2020-02-06 03:35:58','2021-04-05 17:02:44'),(83,94,1,'2017-07-14 03:54:17','2021-04-05 17:02:41','2021-04-05 17:02:41','2021-04-05 17:02:44'),(84,7,1,'2012-10-26 15:03:00','2015-04-25 09:17:39','2015-04-25 09:17:39','2021-04-05 17:02:44'),(84,11,1,'2021-01-26 20:28:40','2021-04-05 17:02:41','2021-04-05 17:02:41','2021-04-05 17:02:44'),(84,66,2,'2012-02-24 08:59:11','2017-04-03 23:01:39','2017-04-03 23:01:39','2021-04-05 17:02:44'),(88,4,1,'2017-05-26 07:20:31','2021-04-05 17:02:41','2021-04-05 17:02:41','2021-04-05 17:02:44'),(93,15,2,'2011-06-13 20:47:29','2013-12-08 23:24:26','2013-12-08 23:24:26','2021-04-05 17:02:44'),(93,29,2,'2014-05-21 21:41:38','2021-04-05 17:02:41','2021-04-05 17:02:41','2021-04-05 17:02:44'),(95,61,1,'2015-10-23 22:03:51','2018-10-04 11:24:11','2018-10-04 11:24:11','2021-04-05 17:02:44'),(97,37,2,'2015-02-22 04:08:39','2021-04-05 17:02:41','2021-04-05 17:02:41','2021-04-05 17:02:44'),(99,36,3,'2014-08-12 02:00:01','2015-09-06 07:53:09','2015-09-06 07:53:09','2021-04-05 17:02:44');
/*!40000 ALTER TABLE `friendship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friendship_statuses`
--

DROP TABLE IF EXISTS `friendship_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `friendship_statuses` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Название статуса',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Статусы дружбы';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friendship_statuses`
--

LOCK TABLES `friendship_statuses` WRITE;
/*!40000 ALTER TABLE `friendship_statuses` DISABLE KEYS */;
INSERT INTO `friendship_statuses` VALUES (1,'Requested','2021-04-05 17:02:12','2021-04-05 17:02:12'),(2,'Confirmed','2021-04-05 17:02:12','2021-04-05 17:02:12'),(3,'Rejected','2021-04-05 17:02:12','2021-04-05 17:02:12');
/*!40000 ALTER TABLE `friendship_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `user_id` int unsigned NOT NULL COMMENT 'Ссылка на пользователя, который загрузил файл',
  `filename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Путь к файлу',
  `size` int NOT NULL COMMENT 'Размер файла',
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT 'Метаданные файла',
  `media_type_id` int unsigned NOT NULL COMMENT 'Ссылка на тип контента',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  CONSTRAINT `media_chk_1` CHECK (json_valid(`metadata`))
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Медиафайлы';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,98,'http://dropbox.com/vk/iste.mp3',47247048,'{\"owner\":\"Magdalen Dickinson\"}',1,'2014-11-19 06:02:05','2021-04-05 17:00:14'),(2,83,'http://dropbox.com/vk/consectetur.mpeg',90231,'{\"owner\":\"Pamela Adams\"}',3,'2016-11-16 09:44:33','2021-04-05 17:00:58'),(3,19,'http://dropbox.com/vk/qui.mp3',30453292,'{\"owner\":\"Alden Heidenreich\"}',1,'2011-04-17 01:48:34','2021-04-05 17:00:58'),(4,45,'http://dropbox.com/vk/consequatur.avi',10515319,'{\"owner\":\"Lindsay Sipes\"}',3,'2015-03-06 18:36:47','2021-04-05 17:00:58'),(5,69,'http://dropbox.com/vk/quisquam.mp3',61206722,'{\"owner\":\"Jocelyn Haag\"}',2,'2017-11-29 15:14:05','2021-04-05 17:00:14'),(6,11,'http://dropbox.com/vk/qui.jpeg',65707,'{\"owner\":\"Tianna Koss\"}',2,'2012-12-28 15:20:33','2021-04-05 17:00:58'),(7,44,'http://dropbox.com/vk/sunt.avi',74477656,'{\"owner\":\"Braulio Bins\"}',2,'2020-09-29 03:10:58','2021-04-05 17:00:58'),(8,90,'http://dropbox.com/vk/consectetur.jpeg',42551,'{\"owner\":\"Amir Crona\"}',3,'2015-08-13 18:32:56','2021-04-05 17:00:58'),(9,14,'http://dropbox.com/vk/rem.mpeg',48968,'{\"owner\":\"Garry Emmerich\"}',2,'2011-08-13 09:41:47','2021-04-05 17:00:58'),(10,3,'http://dropbox.com/vk/eaque.mp3',69666,'{\"owner\":\"Juwan Torphy\"}',1,'2014-07-08 12:31:07','2021-04-05 17:00:14'),(11,70,'http://dropbox.com/vk/ut.avi',92232,'{\"owner\":\"Monica Roob\"}',1,'2013-02-08 02:08:54','2021-04-05 17:00:58'),(12,42,'http://dropbox.com/vk/molestiae.mpeg',88758120,'{\"owner\":\"Genevieve Hauck\"}',2,'2018-01-15 03:53:33','2021-04-05 17:00:58'),(13,99,'http://dropbox.com/vk/nemo.mpeg',20347633,'{\"owner\":\"Modesto Bartoletti\"}',1,'2014-03-10 19:55:15','2021-04-05 17:00:14'),(14,69,'http://dropbox.com/vk/ut.jpeg',35453810,'{\"owner\":\"Jocelyn Haag\"}',3,'2013-11-06 12:44:49','2021-04-05 17:00:58'),(15,45,'http://dropbox.com/vk/quasi.mp3',53829,'{\"owner\":\"Lindsay Sipes\"}',2,'2011-05-20 06:55:46','2021-04-05 17:00:58'),(16,21,'http://dropbox.com/vk/omnis.avi',61662,'{\"owner\":\"Cleo Heidenreich\"}',1,'2019-12-21 15:16:05','2021-04-05 17:00:14'),(17,66,'http://dropbox.com/vk/provident.avi',96194,'{\"owner\":\"Tina Jerde\"}',1,'2014-08-27 00:55:53','2021-04-05 17:00:58'),(18,69,'http://dropbox.com/vk/inventore.jpeg',49647,'{\"owner\":\"Jocelyn Haag\"}',2,'2011-12-03 06:16:06','2021-04-05 17:00:58'),(19,45,'http://dropbox.com/vk/excepturi.jpeg',36961,'{\"owner\":\"Lindsay Sipes\"}',3,'2017-07-20 12:47:02','2021-04-05 17:00:58'),(20,18,'http://dropbox.com/vk/eligendi.mp3',84749,'{\"owner\":\"Chad Gorczany\"}',1,'2013-08-11 12:33:17','2021-04-05 17:00:58'),(21,55,'http://dropbox.com/vk/ut.avi',16216156,'{\"owner\":\"Nick Bogisich\"}',3,'2020-08-09 21:05:40','2021-04-05 17:00:14'),(22,19,'http://dropbox.com/vk/mollitia.avi',74709353,'{\"owner\":\"Alden Heidenreich\"}',1,'2017-05-22 20:27:03','2021-04-05 17:00:14'),(23,32,'http://dropbox.com/vk/ipsa.mpeg',24888302,'{\"owner\":\"Lilyan Stracke\"}',2,'2014-03-29 06:16:06','2021-04-05 17:00:14'),(24,3,'http://dropbox.com/vk/et.jpeg',91662,'{\"owner\":\"Juwan Torphy\"}',1,'2011-12-01 19:28:18','2021-04-05 17:00:58'),(25,16,'http://dropbox.com/vk/velit.avi',47696,'{\"owner\":\"Daniela Murray\"}',3,'2013-01-19 04:43:32','2021-04-05 17:00:58'),(26,72,'http://dropbox.com/vk/aut.jpeg',39072,'{\"owner\":\"Keshawn Gerhold\"}',2,'2017-03-08 02:12:03','2021-04-05 17:00:14'),(27,12,'http://dropbox.com/vk/quo.mpeg',69358,'{\"owner\":\"Abel Rath\"}',1,'2015-11-17 01:45:11','2021-04-05 17:00:58'),(28,44,'http://dropbox.com/vk/ab.mpeg',303454,'{\"owner\":\"Braulio Bins\"}',1,'2012-07-23 03:22:49','2021-04-05 17:00:14'),(29,85,'http://dropbox.com/vk/cumque.mp3',26842366,'{\"owner\":\"Terrill Welch\"}',1,'2014-12-30 10:14:28','2021-04-05 17:00:58'),(30,89,'http://dropbox.com/vk/nisi.mp3',77382,'{\"owner\":\"Bettie Kovacek\"}',2,'2016-07-30 17:36:16','2021-04-05 17:00:58');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_types`
--

DROP TABLE IF EXISTS `media_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Название типа',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Типы медиафайлов';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_types`
--

LOCK TABLES `media_types` WRITE;
/*!40000 ALTER TABLE `media_types` DISABLE KEYS */;
INSERT INTO `media_types` VALUES (1,'photo','2021-04-05 17:00:54','2021-04-05 17:00:54'),(2,'audio','2021-04-05 17:00:54','2021-04-05 17:00:54'),(3,'video','2021-04-05 17:00:54','2021-04-05 17:00:54');
/*!40000 ALTER TABLE `media_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `from_user_id` int unsigned NOT NULL COMMENT 'Ссылка на отправителя сообщения',
  `to_user_id` int unsigned NOT NULL COMMENT 'Ссылка на получателя сообщения',
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Текст сообщения',
  `is_important` tinyint(1) DEFAULT NULL COMMENT 'Признак важности',
  `is_delivered` tinyint(1) DEFAULT NULL COMMENT 'Признак доставки',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Сообщения';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,97,48,'Eius ullam dolor rem velit deserunt. Minima consectetur magnam ea dolore aut sed et. Earum suscipit repellat sed recusandae repellat ut. Harum ipsum cumque ex sunt vitae aspernatur modi.',1,0,'2012-04-12 10:36:36'),(2,49,99,'Voluptas et voluptas qui et nam quibusdam. Eos minima quia molestiae non ut et qui ut. Est accusamus velit et ea officia rerum est. A officia est odio.',0,0,'2018-11-28 16:02:02'),(3,47,39,'Soluta excepturi velit voluptas minima facilis. Et dolor voluptatem vitae officia. Mollitia maxime maiores veniam pariatur doloribus accusamus. Omnis sapiente vel velit et aperiam molestias.',0,0,'2012-04-27 06:27:36'),(4,52,45,'Aut et laudantium numquam non beatae voluptatem sit. Doloremque qui reprehenderit omnis quas ab. Minima est quas consequuntur consequatur quia corrupti. Est eligendi vel voluptatibus voluptatibus nesciunt et fuga repudiandae.',1,0,'2013-12-20 01:44:28'),(5,68,5,'Et odit numquam vitae est. Quisquam repudiandae necessitatibus cumque. Debitis voluptas accusamus quaerat. Dolore perferendis ipsam commodi.',1,0,'2017-10-30 23:53:02'),(6,18,77,'Vel sit dolorem debitis sint in aut est exercitationem. Quaerat dolorum porro quia deserunt eaque omnis dignissimos.',0,0,'2017-12-25 04:20:37'),(7,29,12,'A velit minima iste inventore facere impedit. Reiciendis omnis consequatur sunt maxime. Veniam laborum autem id.',0,1,'2016-07-28 11:04:25'),(8,75,38,'Necessitatibus est non perspiciatis dolorum ullam. Consectetur est deserunt qui ipsa ipsam iusto omnis quibusdam. Nihil doloribus maiores sint aliquid incidunt. Saepe quisquam et possimus quo rerum.',0,0,'2012-07-15 20:55:18'),(9,64,8,'Consequatur optio deserunt dicta eos. Laboriosam nisi hic non doloremque sit. Laborum consequatur est aliquid tempore magni autem. Pariatur sed officia qui voluptas explicabo distinctio et.',0,1,'2018-02-03 18:29:50'),(10,45,1,'Distinctio qui autem qui iusto aspernatur maiores. Quos debitis incidunt provident est repellat. Quia consequatur eaque aut accusantium provident. Incidunt aut tenetur ea dolores. Iure officiis voluptatum aspernatur aut.',0,1,'2020-04-01 17:18:58'),(11,69,42,'Sed quia quae aut voluptas quasi mollitia natus possimus. A explicabo incidunt nam voluptas sunt voluptates. Dolorem sequi quidem et architecto eos voluptas enim. Aspernatur aperiam eum omnis autem quaerat expedita.',1,1,'2018-08-06 05:45:57'),(12,2,85,'Cumque rerum enim autem aut. Nesciunt sit amet eaque sed. Ut qui aut sint voluptatibus non asperiores.',1,1,'2012-07-15 18:34:17'),(13,20,42,'Commodi soluta vel ipsum molestiae molestias laborum non. Dolore dolorum voluptas inventore voluptatum. Perferendis illum sed sit ut.',1,0,'2018-08-14 13:57:17'),(14,50,23,'Non minima voluptatibus quae sint illum. Et rem facere et non. Et et voluptatibus non amet et praesentium voluptas. Sed veniam et et quae et ullam.',1,1,'2019-05-13 18:30:59'),(15,67,63,'Magnam iure dolorum quia molestias. Et accusantium voluptatem provident laborum aut. Tenetur inventore asperiores ipsa cum optio.',0,0,'2017-08-15 08:47:56'),(16,15,86,'Unde sunt vero nesciunt accusantium et. Repellat omnis nostrum temporibus vero labore. Quia ut sed corporis provident odio quas. Unde praesentium recusandae blanditiis voluptatem sit molestiae blanditiis.',1,1,'2018-01-02 18:18:05'),(17,86,69,'Animi odit magnam sed sit sint non consequuntur. Est ducimus quia molestias voluptas. Id culpa non ex quod. Ea voluptatem earum nobis rem.',0,1,'2016-01-01 20:06:27'),(18,87,29,'Quis consectetur doloremque quae ratione. Harum enim vel tenetur dolore a est.',1,1,'2019-07-29 08:32:08'),(19,82,21,'Necessitatibus recusandae recusandae error recusandae. Qui qui impedit omnis aut repudiandae. Dolore et nihil saepe harum debitis.',0,0,'2012-10-04 03:46:40'),(20,60,36,'Et id exercitationem doloremque facilis aut adipisci est aut. Tempora quos non porro aut sunt ab. Delectus et maxime accusamus libero repellendus nam maiores. Quia magnam cum sapiente voluptas illo facilis. Explicabo magnam sint eaque voluptatem id praesentium.',0,0,'2015-03-11 21:11:03');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profiles` (
  `user_id` int unsigned NOT NULL COMMENT 'Ссылка на пользователя',
  `gender` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Пол',
  `birthday` date DEFAULT NULL COMMENT 'Дата рождения',
  `city` varchar(130) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Город проживания',
  `country` varchar(130) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Страна проживания',
  `last_login` datetime DEFAULT NULL COMMENT 'Последний вход в систему',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Профили';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,'M','2018-12-31','Dimitriberg','Cambodia','2016-03-24 00:06:51','2020-10-25 18:02:29','2021-04-05 16:51:37'),(2,'F','1976-07-31','Cruickshankland','Greenland','2012-03-17 04:49:45','2012-11-29 02:18:39','2021-04-05 16:51:37'),(3,'M','1988-04-07','Whiteland','Mali','2021-03-14 12:30:53','2020-01-02 08:33:53','2021-04-05 16:51:37'),(4,'F','1978-12-25','Lake Kaylee','Cocos (Keeling) Islands','2016-01-09 06:45:04','2013-08-06 08:30:37','2021-04-05 16:51:37'),(5,'M','1972-08-09','Oletaborough','Denmark','2014-02-06 19:59:12','2011-09-21 08:55:01','2021-04-05 16:51:37'),(6,'F','2014-06-22','North Myrlborough','Germany','2016-11-18 03:07:15','2020-11-01 18:20:42','2021-04-05 16:51:37'),(7,'M','1973-09-10','North Benny','Bouvet Island (Bouvetoya)','2017-02-18 03:57:46','2012-03-12 08:17:28','2021-04-05 16:51:37'),(8,'F','1995-05-08','Kshlerinville','Saint Vincent and the Grenadines','2019-06-05 02:03:32','2012-03-09 19:10:08','2021-04-05 16:51:37'),(9,'M','1994-12-12','New Lempi','Guinea-Bissau','2017-01-30 19:50:25','2012-12-25 06:21:32','2021-04-05 16:51:37'),(10,'F','2018-11-01','Lake Josephineside','Moldova','2013-12-14 02:37:05','2015-06-26 00:00:55','2021-04-05 16:51:37'),(11,'M','2009-03-26','Port Joshua','Palestinian Territory','2013-04-13 03:34:21','2012-02-22 05:13:42','2021-04-05 16:51:37'),(12,'M','1990-08-10','Wizaside','Malta','2015-12-18 21:15:10','2018-10-19 14:14:15','2021-04-05 16:51:37'),(13,'F','1994-09-11','Isombury','Norfolk Island','2020-08-31 07:36:05','2018-08-20 11:13:43','2021-04-05 16:51:37'),(14,'F','1979-10-13','Port Salliefurt','Equatorial Guinea','2018-11-29 19:08:28','2018-09-10 04:48:04','2021-04-05 16:51:37'),(15,'M','2011-07-31','North Paulaberg','Dominican Republic','2014-05-20 10:22:07','2019-04-22 22:52:51','2021-04-05 16:51:37'),(16,'F','1974-05-16','South Morrisland','Montenegro','2012-10-21 16:49:13','2013-11-06 03:44:08','2021-04-05 16:51:37'),(17,'F','1976-03-21','West Vickie','Greece','2018-04-09 21:20:11','2013-04-08 00:21:37','2021-04-05 16:51:37'),(18,'M','1976-01-27','Mrazville','Saint Kitts and Nevis','2020-08-02 04:18:19','2016-09-04 22:56:19','2021-04-05 16:51:37'),(19,'M','1998-01-03','Vernfort','Monaco','2014-09-25 10:55:51','2018-11-19 17:01:28','2021-04-05 16:51:37'),(20,'F','1998-12-18','Lake Darrel','South Africa','2017-01-13 18:48:09','2018-09-20 01:33:00','2021-04-05 16:51:37'),(21,'F','1999-11-13','North Brown','Niue','2020-06-09 07:42:06','2017-03-06 09:21:12','2021-04-05 16:51:37'),(22,'F','1999-01-10','Gorczanyview','Saint Barthelemy','2016-11-24 15:34:42','2013-01-20 21:07:59','2021-04-05 16:51:37'),(23,'M','1971-07-26','Lake Jaquelin','Fiji','2020-04-16 17:06:34','2016-06-06 07:35:07','2021-04-05 16:51:37'),(24,'F','1984-10-14','East Aliberg','South Georgia and the South Sandwich Islands','2014-08-18 16:34:48','2012-11-17 08:43:44','2021-04-05 16:51:37'),(25,'M','1994-08-17','West Mittie','Guam','2020-04-06 16:17:01','2012-07-06 22:59:35','2021-04-05 16:51:37'),(26,'M','1997-12-20','Raynorland','Saint Pierre and Miquelon','2013-05-23 15:41:32','2015-04-07 22:27:12','2021-04-05 16:51:37'),(27,'M','2020-12-07','Hesselmouth','Tuvalu','2015-10-26 08:42:47','2017-09-27 22:20:03','2021-04-05 16:51:37'),(28,'F','1998-03-20','South Cassidymouth','Bolivia','2011-07-01 20:13:36','2018-11-07 10:27:14','2021-04-05 16:51:37'),(29,'F','2000-07-19','New Celine','Burkina Faso','2014-08-27 20:58:45','2013-09-29 15:32:05','2021-04-05 16:51:37'),(30,'F','1993-01-07','East Gregg','Nauru','2013-10-03 00:49:03','2013-09-16 14:41:25','2021-04-05 16:51:37'),(31,'F','1998-12-21','East Alexandre','Belarus','2019-08-11 23:32:11','2012-09-13 08:43:47','2021-04-05 16:51:37'),(32,'M','2001-08-26','Port Branson','Faroe Islands','2014-12-08 18:10:35','2013-06-11 07:01:46','2021-04-05 16:51:37'),(33,'M','1977-07-07','East Janiya','Afghanistan','2013-03-22 14:44:29','2020-09-10 00:54:30','2021-04-05 16:51:37'),(34,'F','2017-11-21','Karolannmouth','Israel','2012-03-17 18:18:49','2016-03-28 20:19:15','2021-04-05 16:51:37'),(35,'M','1992-06-01','Port Jabari','Liberia','2021-01-10 10:42:08','2015-10-05 13:29:12','2021-04-05 16:51:37'),(36,'M','2002-07-05','Siennabury','Vietnam','2017-11-03 13:21:35','2020-08-21 20:09:09','2021-04-05 16:51:37'),(37,'M','1997-03-31','East Agustina','Cook Islands','2020-12-21 17:19:54','2014-10-19 20:12:37','2021-04-05 16:51:37'),(38,'M','2001-10-13','Johnsside','Montenegro','2014-12-26 14:25:47','2016-08-01 11:12:01','2021-04-05 16:51:37'),(39,'M','2016-01-15','Wintheiserberg','Algeria','2012-01-17 05:19:41','2015-11-23 02:32:48','2021-04-05 16:51:37'),(40,'F','1984-03-30','Granvilleport','South Africa','2017-10-16 23:27:12','2020-10-13 03:41:41','2021-04-05 16:51:37'),(41,'F','2018-06-25','East Lulachester','Cyprus','2012-07-29 10:05:25','2020-01-24 08:48:30','2021-04-05 16:51:37'),(42,'F','1982-03-07','North Zelmaburgh','Norfolk Island','2014-10-05 03:40:12','2019-08-30 14:22:26','2021-04-05 16:51:37'),(43,'M','2009-04-01','Lake Kearaside','Nigeria','2015-05-22 03:34:58','2020-04-21 07:56:10','2021-04-05 16:51:37'),(44,'F','1973-07-18','West Zakarymouth','Maldives','2018-12-18 22:46:57','2020-11-23 09:49:30','2021-04-05 16:51:37'),(45,'F','2013-01-24','Lake Melany','Palestinian Territory','2015-01-04 15:02:51','2018-07-05 13:53:21','2021-04-05 16:51:37'),(46,'M','2017-03-03','West Luisaville','Montenegro','2013-01-20 11:01:04','2019-03-05 02:17:50','2021-04-05 16:51:37'),(47,'M','1974-09-02','South Kenya','Turks and Caicos Islands','2013-09-20 02:10:45','2018-01-07 15:46:19','2021-04-05 16:51:37'),(48,'F','1980-11-02','New Earlfurt','Moldova','2011-11-15 14:11:26','2018-07-24 03:44:52','2021-04-05 16:51:37'),(49,'M','1981-04-09','Langmouth','Oman','2017-10-12 17:04:45','2012-03-30 12:22:22','2021-04-05 16:51:37'),(50,'M','2012-03-08','Niaville','Guatemala','2016-12-20 20:12:58','2015-09-24 06:42:07','2021-04-05 16:51:37'),(51,'M','2018-03-03','Anaton','Uruguay','2017-06-14 08:13:06','2013-07-03 10:52:12','2021-04-05 16:51:37'),(52,'M','1992-03-02','Samstad','Malaysia','2017-03-11 09:31:55','2017-11-06 23:35:01','2021-04-05 16:51:37'),(53,'M','1979-05-28','Priceville','Mayotte','2013-07-08 20:05:45','2012-12-11 19:00:07','2021-04-05 16:51:37'),(54,'M','1997-02-17','Diannaport','Malaysia','2012-05-04 10:28:05','2015-11-28 14:19:12','2021-04-05 16:51:37'),(55,'F','1996-03-13','Magalihaven','Bahrain','2012-10-24 17:38:27','2017-07-25 21:10:10','2021-04-05 16:51:37'),(56,'F','1998-08-17','West Ruthside','Estonia','2013-11-18 17:49:49','2011-11-07 14:46:16','2021-04-05 16:51:37'),(57,'M','1991-08-03','New Flossie','Congo','2011-08-04 15:44:12','2015-02-05 16:27:14','2021-04-05 16:51:37'),(58,'F','1991-06-13','West Hyman','Moldova','2015-03-01 09:03:26','2019-07-31 13:10:35','2021-04-05 16:51:37'),(59,'M','2019-01-07','South Clyde','Azerbaijan','2012-05-24 17:05:30','2015-06-03 08:32:07','2021-04-05 16:51:37'),(60,'M','1992-12-25','North Arne','Heard Island and McDonald Islands','2011-04-10 23:48:01','2015-03-28 04:48:57','2021-04-05 16:51:37'),(61,'F','1995-04-27','North Dereckmouth','Wallis and Futuna','2016-12-16 03:16:43','2012-07-24 14:00:01','2021-04-05 16:51:37'),(62,'M','1998-02-18','South Annetteside','Burkina Faso','2013-08-02 14:31:33','2019-02-17 15:29:16','2021-04-05 16:51:37'),(63,'F','2011-08-05','South Cecilport','New Caledonia','2012-06-18 12:04:28','2012-12-22 01:36:19','2021-04-05 16:51:37'),(64,'M','1979-09-28','Hansenshire','Myanmar','2019-07-13 01:29:36','2017-08-08 18:48:37','2021-04-05 16:51:37'),(65,'F','1971-03-23','Wisozkstad','Uruguay','2012-12-25 17:28:37','2012-06-20 14:03:15','2021-04-05 16:51:37'),(66,'F','1999-08-27','Kovacekhaven','Central African Republic','2019-05-07 19:35:26','2016-12-03 17:41:11','2021-04-05 16:51:37'),(67,'M','1974-12-05','New Wayneside','Mayotte','2013-05-31 13:29:15','2017-02-20 19:10:59','2021-04-05 16:51:37'),(68,'F','1982-09-16','New Lucious','Zambia','2019-09-26 10:10:57','2012-11-29 08:41:21','2021-04-05 16:51:37'),(69,'M','1990-08-31','Susanamouth','Honduras','2021-01-08 03:01:25','2015-01-16 03:22:58','2021-04-05 16:51:37'),(70,'M','2020-07-12','Willmsburgh','New Caledonia','2013-07-13 07:47:37','2016-09-07 23:32:01','2021-04-05 16:51:37'),(71,'M','1975-08-16','East Kirk','Cape Verde','2018-07-24 18:00:57','2017-12-09 03:04:24','2021-04-05 16:51:37'),(72,'M','1986-02-18','Naderburgh','Slovakia (Slovak Republic)','2015-07-20 05:16:55','2016-01-03 13:49:47','2021-04-05 16:51:37'),(73,'F','2000-03-08','Lake Collin','Namibia','2013-11-19 17:37:07','2019-12-15 08:58:50','2021-04-05 16:51:37'),(74,'M','1974-07-14','Runolfsdottirborough','Panama','2012-08-06 19:59:21','2013-07-24 02:10:24','2021-04-05 16:51:37'),(75,'M','1976-11-20','West Milfordville','Martinique','2018-10-23 16:06:16','2012-12-30 12:01:06','2021-04-05 16:51:37'),(76,'M','1989-11-11','East Deron','New Caledonia','2020-06-06 22:15:45','2012-08-26 03:57:12','2021-04-05 16:51:37'),(77,'M','1979-09-21','North Tierra','Romania','2018-02-24 09:18:22','2017-11-20 04:29:03','2021-04-05 16:51:37'),(78,'M','2015-11-28','Port Jarrodberg','Andorra','2012-03-16 04:36:22','2018-01-30 13:23:28','2021-04-05 16:51:37'),(79,'M','2015-11-25','South Doris','Greenland','2015-07-12 04:26:45','2014-10-06 06:35:12','2021-04-05 16:51:37'),(80,'F','1971-02-10','South Eliane','Monaco','2016-07-22 15:10:26','2016-04-25 23:55:40','2021-04-05 16:51:37'),(81,'M','2015-12-25','New Robynland','Malta','2017-07-18 02:59:25','2018-03-03 12:58:07','2021-04-05 16:51:37'),(82,'M','1970-07-24','North Chase','Swaziland','2016-07-22 10:32:28','2011-07-06 14:13:17','2021-04-05 16:51:37'),(83,'M','2014-11-25','West Reba','Puerto Rico','2019-06-24 23:19:12','2018-12-28 16:55:26','2021-04-05 16:51:37'),(84,'M','1998-01-21','Mandyside','Jordan','2014-06-01 10:39:42','2019-10-08 02:24:20','2021-04-05 16:51:37'),(85,'M','1981-08-15','New Polly','El Salvador','2012-04-03 09:17:59','2017-05-24 08:02:29','2021-04-05 16:51:37'),(86,'F','2004-10-01','South Lizaport','Kazakhstan','2020-04-24 10:54:55','2017-05-24 12:19:44','2021-04-05 16:51:37'),(87,'F','1973-01-25','East Gerard','Kenya','2012-03-19 13:27:32','2016-07-25 00:33:06','2021-04-05 16:51:37'),(88,'F','2008-03-03','South Rosaside','Guernsey','2017-02-13 20:43:47','2019-01-06 14:41:44','2021-04-05 16:51:37'),(89,'M','1994-08-10','Leilaniside','Kazakhstan','2019-04-15 19:40:22','2014-12-20 15:30:03','2021-04-05 16:51:37'),(90,'F','1985-07-15','Abdulfurt','Chile','2014-04-06 17:31:44','2015-04-03 17:38:22','2021-04-05 16:51:37'),(91,'M','1988-04-13','Mohammadfort','Liechtenstein','2019-04-18 01:54:01','2017-08-16 21:50:12','2021-04-05 16:51:37'),(92,'F','2007-11-09','Kirstinhaven','Luxembourg','2016-10-21 06:50:08','2017-01-12 16:49:51','2021-04-05 16:51:37'),(93,'M','2006-11-07','New Nashfort','Australia','2018-05-22 03:37:50','2017-03-02 18:55:30','2021-04-05 16:51:37'),(94,'F','2015-03-25','Blandaside','Iraq','2017-11-16 07:56:15','2015-09-28 08:09:27','2021-04-05 16:51:37'),(95,'F','1971-10-13','Stellafort','Macao','2019-02-19 09:15:33','2020-07-30 01:36:09','2021-04-05 16:51:37'),(96,'F','2017-03-19','Gerlachburgh','Cape Verde','2017-03-06 01:00:18','2014-07-25 16:10:18','2021-04-05 16:51:37'),(97,'M','2018-09-21','Lake Haskellview','Nauru','2012-10-28 20:33:25','2015-10-18 13:49:47','2021-04-05 16:51:37'),(98,'F','1974-01-03','Amirafurt','Qatar','2015-05-26 12:23:02','2012-05-14 01:32:54','2021-04-05 16:51:37'),(99,'F','2008-12-20','New Darbyburgh','Dominica','2018-09-01 02:09:51','2015-05-12 22:57:00','2021-04-05 16:51:37'),(100,'F','2007-08-30','Lexiton','Morocco','2011-10-01 19:15:17','2013-11-24 16:13:43','2021-04-05 16:51:37');
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор строки',
  `first_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Имя пользователя',
  `last_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Фамилия пользователя',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Почта',
  `phone` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Телефон',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания строки',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Время обновления строки',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Пользователи';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Bernhard','Boyle','johnson.randy@example.org','1-782-050-3269x00264','2017-08-25 13:12:48','2021-04-05 16:52:15'),(2,'Shad','Tillman','paul.langosh@example.net','+43(1)0761706879','2011-05-10 23:20:54','2014-04-29 14:21:02'),(3,'Juwan','Torphy','dstehr@example.org','969-433-8703','2016-09-12 13:31:35','2017-12-13 12:34:17'),(4,'Major','Schimmel','bernier.arden@example.org','(965)317-7635','2020-12-30 01:50:40','2021-04-05 16:52:15'),(5,'Abagail','Pfannerstill','emmett80@example.net','(514)163-3722x850','2011-08-23 11:43:04','2021-04-05 16:52:15'),(6,'Rahul','Rowe','stanton.rossie@example.com','511.241.1525x01802','2011-09-21 08:17:52','2015-03-31 11:33:38'),(7,'Wilbert','Gerlach','rowe.amina@example.net','474.877.4848','2015-03-02 09:01:44','2018-12-29 07:22:14'),(8,'Sophia','Emmerich','beer.grayce@example.org','121-334-5572x46057','2018-03-09 05:45:15','2021-04-05 16:52:15'),(9,'Sheila','Blanda','quigley.berneice@example.org','478-518-4935x6720','2015-11-18 23:56:24','2017-07-15 16:06:15'),(10,'Joshuah','Daugherty','gbartell@example.org','(270)930-3527x553','2012-10-21 20:15:30','2020-12-23 23:36:28'),(11,'Tianna','Koss','dock.pfannerstill@example.net','135.536.8714','2011-10-24 11:16:38','2016-08-31 04:38:40'),(12,'Abel','Rath','bartoletti.abigayle@example.org','993-238-8404x08542','2020-10-24 08:38:20','2021-04-05 16:52:15'),(13,'Richie','Krajcik','aurore04@example.org','(678)231-6448x48900','2015-02-12 10:49:13','2016-03-03 06:12:03'),(14,'Garry','Emmerich','kutch.jameson@example.org','(244)867-7472x85676','2019-10-11 14:04:21','2021-04-05 16:52:15'),(15,'Isaias','Wiza','ksimonis@example.com','(321)636-9571','2012-03-16 12:58:27','2013-10-13 09:38:02'),(16,'Daniela','Murray','jamil.strosin@example.com','(643)236-3827','2017-05-24 23:15:59','2020-04-18 05:30:00'),(17,'Dean','Abshire','reynolds.raegan@example.org','1-071-188-2774','2018-02-21 16:35:49','2021-04-05 16:52:15'),(18,'Chad','Gorczany','bartoletti.malika@example.org','+99(9)7829682363','2012-06-12 10:06:40','2019-03-14 18:24:18'),(19,'Alden','Heidenreich','rath.clare@example.org','1-742-801-9654x88261','2012-07-26 21:57:49','2012-11-28 11:50:52'),(20,'Lucie','Macejkovic','liza98@example.net','(276)476-8004x4257','2015-04-29 02:02:30','2021-04-05 16:52:15'),(21,'Cleo','Heidenreich','gdubuque@example.net','1-956-665-7516x216','2017-01-04 09:38:06','2017-02-24 09:09:36'),(22,'Cecil','Windler','franecki.jerrell@example.org','1-807-510-5266','2016-02-13 08:30:23','2020-05-13 05:56:58'),(23,'Walter','Hettinger','o\'hara.clemmie@example.org','+54(5)0506656515','2014-08-11 18:49:31','2021-01-15 12:06:57'),(24,'Emie','Gerlach','heber.marquardt@example.com','(608)094-1786','2017-04-18 04:49:07','2020-12-15 08:19:12'),(25,'Kailee','Davis','xtremblay@example.net','(898)530-6687x6258','2012-09-08 08:50:32','2013-02-17 04:40:04'),(26,'Aubrey','Kerluke','aric.mertz@example.org','797-146-0835x8257','2013-06-14 17:17:25','2021-04-05 16:52:15'),(27,'Dejah','Hansen','reed.hoeger@example.com','(987)648-5296','2011-05-14 08:22:53','2016-09-29 06:29:36'),(28,'Lavina','Bosco','flavio77@example.com','1-867-803-3661x836','2016-08-05 18:30:57','2021-04-05 16:52:15'),(29,'Cheyenne','Effertz','raoul00@example.org','(960)968-2151x3981','2020-11-15 10:00:06','2021-04-05 16:52:15'),(30,'Jaquelin','Bartell','lamar.johns@example.com','(458)071-8574x678','2018-12-02 17:51:46','2021-04-05 16:52:15'),(31,'Maudie','Schmitt','zachery42@example.net','241.127.8926x34506','2012-08-18 00:56:45','2015-06-01 19:04:15'),(32,'Lilyan','Stracke','schuster.jaycee@example.org','1-952-198-6797','2011-04-24 01:26:16','2012-02-25 12:36:24'),(33,'Jovani','Volkman','lenore.hayes@example.org','1-656-085-8994','2011-10-21 02:24:29','2012-09-02 23:27:47'),(34,'Flossie','Herzog','raynor.sydney@example.com','460.025.5376x87915','2019-06-15 22:51:40','2021-04-05 16:52:15'),(35,'Dino','Zboncak','leuschke.malcolm@example.org','1-369-303-9422x8987','2011-06-20 01:08:21','2016-01-10 10:18:52'),(36,'Hollis','Kshlerin','maurine08@example.org','395.726.3966','2020-07-26 18:50:45','2021-04-05 16:52:15'),(37,'Webster','Wolf','dtremblay@example.org','04586936755','2014-12-05 16:18:43','2020-07-25 22:46:23'),(38,'Aileen','Cole','fadel.eloy@example.org','+72(9)9774377439','2013-04-13 02:29:13','2021-04-05 16:52:15'),(39,'Dominic','Waelchi','mlind@example.org','432-480-7488','2019-07-30 05:45:39','2021-04-05 16:52:15'),(40,'Eudora','Rau','batz.alexie@example.org','1-844-006-0769','2020-03-05 15:46:51','2021-04-05 16:52:15'),(41,'Kirstin','Hodkiewicz','bartell.kim@example.org','1-658-588-8664x7848','2018-02-10 02:11:55','2021-04-05 16:52:15'),(42,'Genevieve','Hauck','gino.ward@example.org','1-587-950-1682x405','2018-08-12 07:49:30','2020-07-07 14:38:12'),(43,'Adolph','Stiedemann','ziemann.deanna@example.com','+13(4)0115519985','2020-08-20 21:17:58','2021-04-05 16:52:15'),(44,'Braulio','Bins','edison.watsica@example.net','(497)865-9944','2018-01-19 18:15:00','2019-04-01 21:22:44'),(45,'Lindsay','Sipes','gschmidt@example.org','770.567.2662x5758','2020-07-07 11:27:00','2021-04-05 16:52:15'),(46,'Samanta','King','dorian.armstrong@example.org','569-815-0799x8322','2015-05-02 07:52:55','2020-03-28 03:41:28'),(47,'Jimmy','Raynor','vivien29@example.com','978.426.9520x1756','2018-04-09 14:01:15','2021-04-05 16:52:15'),(48,'Dean','Welch','zpadberg@example.net','822-711-2825x5772','2011-07-31 10:16:13','2020-11-18 04:44:15'),(49,'Isadore','Paucek','dock67@example.org','762.831.0313x49417','2017-08-22 05:27:29','2018-11-28 02:16:13'),(50,'Beaulah','Schulist','grady.easter@example.org','1-088-716-6924','2015-06-30 06:37:48','2021-04-05 16:52:15'),(51,'Romaine','Yundt','ottis61@example.net','172.920.5187','2011-06-04 17:52:08','2018-09-16 20:53:55'),(52,'Margarete','Reichel','ethel.hamill@example.com','580.123.8950x74139','2013-06-30 13:03:46','2018-02-19 14:39:31'),(53,'Americo','Walker','nleffler@example.org','1-998-571-1415x2942','2017-09-23 17:12:41','2017-10-27 18:11:26'),(54,'Clotilde','Marquardt','hanna84@example.org','156-967-8187x16941','2015-02-09 09:55:59','2021-03-11 01:21:56'),(55,'Nick','Bogisich','maribel85@example.net','1-965-465-1631','2013-07-10 08:22:47','2013-09-28 12:28:17'),(56,'Samanta','Koelpin','mckenzie.otha@example.net','1-944-910-8850','2012-11-05 09:41:16','2019-03-31 12:53:47'),(57,'Aidan','Kreiger','schroeder.blanche@example.net','365.300.6879x9310','2016-06-11 19:14:04','2021-04-05 16:52:15'),(58,'Rex','Gerhold','aemmerich@example.net','(905)787-2071x364','2014-10-27 02:11:33','2021-04-05 16:52:15'),(59,'Jamey','Hilpert','gideon52@example.org','1-373-059-5277x08515','2020-02-19 05:54:56','2021-04-05 16:52:15'),(60,'Maynard','Koepp','casper.amara@example.org','(143)778-6556','2020-04-07 09:59:10','2020-06-03 20:47:13'),(61,'Justina','Bruen','vivien.koss@example.org','131.192.4276x75308','2011-12-04 17:22:29','2014-01-08 10:43:37'),(62,'Victoria','Miller','viva.hilpert@example.net','159-543-9860','2016-09-12 05:32:26','2021-04-05 16:52:15'),(63,'Velva','Nader','fahey.sam@example.org','09192570857','2013-01-16 09:38:49','2014-05-26 02:33:50'),(64,'Marcos','Gibson','mswift@example.org','993-121-2114','2016-03-28 15:29:05','2021-04-05 16:52:15'),(65,'Clair','Stehr','emile81@example.org','040-572-2064','2018-01-25 00:40:24','2021-04-05 16:52:15'),(66,'Tina','Jerde','jody.mcglynn@example.com','07124530906','2015-07-31 08:01:40','2021-04-05 16:52:15'),(67,'Linda','Wehner','jayme.davis@example.org','1-222-700-7423x803','2011-06-20 06:43:50','2013-07-31 17:08:56'),(68,'Helene','Krajcik','maryam17@example.org','982-169-0872x88671','2013-01-20 05:45:08','2015-07-29 04:34:02'),(69,'Jocelyn','Haag','john.reichert@example.org','(437)206-9095x10873','2020-12-17 07:46:13','2021-04-05 16:52:15'),(70,'Monica','Roob','denesik.wilfred@example.net','(997)435-6753x1638','2012-05-15 05:00:42','2013-04-23 06:43:13'),(71,'Eldon','Ruecker','newell54@example.org','233-216-4610','2020-02-22 21:06:52','2021-04-05 16:52:15'),(72,'Keshawn','Gerhold','ziemann.jaiden@example.net','674-079-7131','2019-10-15 12:51:23','2021-04-05 16:52:15'),(73,'Anika','Eichmann','mwolff@example.org','(105)142-3368x07734','2020-11-20 07:16:16','2021-04-05 16:52:15'),(74,'Autumn','Mills','lulu.wyman@example.com','+32(1)3679788367','2018-02-08 08:52:56','2021-04-05 16:52:15'),(75,'Josefina','Cummings','reynolds.kali@example.com','521.028.5808','2016-05-11 16:42:40','2021-04-05 16:52:15'),(76,'Justyn','Nienow','sonny64@example.net','646.626.7307','2019-02-02 14:28:20','2019-05-03 15:31:13'),(77,'Delia','Sanford','ekutch@example.org','06994484083','2016-07-08 12:13:04','2019-10-08 02:12:30'),(78,'Chaya','Brekke','urobel@example.com','1-910-929-4034','2011-10-27 02:35:32','2016-09-26 21:35:34'),(79,'Theodore','Jacobi','evangeline.satterfield@example.com','148.249.4197','2011-12-17 08:30:01','2015-06-20 15:02:00'),(80,'Icie','Larson','stefanie87@example.org','04082021765','2019-09-02 19:13:35','2019-11-12 06:40:42'),(81,'Sebastian','Gislason','mcormier@example.net','1-474-803-8696','2019-02-28 20:02:18','2021-04-05 16:52:15'),(82,'Ashtyn','Schaden','frederique.ratke@example.net','332.316.8498','2016-08-20 06:19:41','2021-04-05 16:52:15'),(83,'Pamela','Adams','brando34@example.net','089-217-7901x89152','2020-10-18 19:46:56','2021-04-05 16:52:15'),(84,'Carole','Metz','bkuhlman@example.org','(924)801-3897x50190','2021-02-10 09:13:19','2021-04-05 16:52:15'),(85,'Terrill','Welch','junius.lubowitz@example.net','1-481-098-7369','2013-07-03 05:16:09','2021-04-05 16:52:15'),(86,'Magdalena','Bergnaum','laron74@example.org','(403)233-0770x822','2015-09-13 23:15:53','2020-06-06 21:11:49'),(87,'Kane','Mraz','glover.rick@example.com','886-293-2699x3541','2020-02-20 11:17:49','2021-04-05 16:52:15'),(88,'Aric','Okuneva','jo\'reilly@example.com','185-358-7283x45211','2014-01-15 11:27:59','2018-08-22 23:37:23'),(89,'Bettie','Kovacek','mlebsack@example.com','019-007-0810','2019-05-29 17:20:55','2021-04-05 16:52:15'),(90,'Amir','Crona','eulah.littel@example.org','341-344-4415x7165','2013-09-18 09:34:22','2017-12-15 16:19:16'),(91,'Karen','Frami','kuphal.adalberto@example.com','1-337-868-2940x24299','2014-03-19 21:32:13','2014-07-08 03:46:06'),(92,'Hal','Wilkinson','glenda26@example.com','+86(0)2720289532','2019-01-14 01:08:18','2021-04-05 16:52:15'),(93,'Lyda','Reichel','ludwig.lang@example.net','069.387.1979x17029','2019-03-08 15:59:18','2021-04-05 16:52:15'),(94,'Justen','Rosenbaum','cnolan@example.org','(065)182-1654','2020-02-26 00:01:07','2021-04-05 16:52:15'),(95,'Delta','O\'Reilly','eden34@example.net','1-188-258-3059x8652','2015-06-23 06:44:34','2020-07-29 20:05:01'),(96,'Gisselle','Nader','favian58@example.org','1-148-660-3077x1156','2017-01-27 14:00:59','2018-11-11 12:58:47'),(97,'Abel','Runolfsdottir','dauer@example.com','(362)269-1753x27137','2015-01-05 11:23:10','2021-04-05 16:52:15'),(98,'Magdalen','Dickinson','rstracke@example.com','188-823-8192x16609','2012-09-13 21:04:20','2014-07-31 14:28:35'),(99,'Modesto','Bartoletti','rodriguez.isabell@example.com','1-252-880-8346x607','2017-12-22 19:42:26','2021-04-05 16:52:15'),(100,'Angelina','Buckridge','mbauch@example.org','1-070-144-0918x67978','2021-03-05 04:05:39','2021-04-05 16:52:15');
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

-- Dump completed on 2021-04-05 17:38:04
