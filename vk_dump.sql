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
INSERT INTO `communities_users` VALUES (1,1,'1994-06-01 00:00:00'),(1,11,'1981-12-19 00:00:00'),(1,21,'1974-08-18 00:00:00'),(2,2,'2020-08-08 00:00:00'),(2,12,'1980-07-16 00:00:00'),(2,22,'2017-11-02 00:00:00'),(3,3,'2020-08-03 00:00:00'),(3,13,'1980-02-23 00:00:00'),(3,23,'1988-12-11 00:00:00'),(4,4,'1974-10-29 00:00:00'),(4,14,'2005-07-24 00:00:00'),(4,24,'2000-01-04 00:00:00'),(5,5,'1988-01-04 00:00:00'),(5,15,'2000-08-29 00:00:00'),(5,25,'1973-01-17 00:00:00'),(6,6,'1997-07-28 00:00:00'),(6,16,'1977-01-08 00:00:00'),(6,26,'1982-03-13 00:00:00'),(7,7,'2017-06-06 00:00:00'),(7,17,'2007-05-11 00:00:00'),(7,27,'2020-04-26 00:00:00'),(8,8,'2012-10-29 00:00:00'),(8,18,'1984-10-22 00:00:00'),(8,28,'1991-07-08 00:00:00'),(9,9,'2005-11-06 00:00:00'),(9,19,'1976-01-31 00:00:00'),(9,29,'1972-03-03 00:00:00'),(10,10,'2001-01-02 00:00:00'),(10,20,'1974-03-06 00:00:00'),(10,30,'1991-02-04 00:00:00');
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
INSERT INTO `friendship` VALUES (1,1,21,'2016-10-16 21:53:06','2014-01-15 09:03:15','2018-01-10 13:03:09','2012-07-13 23:54:06'),(2,2,22,'2017-06-16 07:22:26','2018-10-21 15:37:11','2013-06-09 16:13:53','2021-01-25 16:26:11'),(3,3,24,'2020-02-09 14:27:16','2019-12-22 04:29:58','2017-05-21 16:31:26','2013-12-01 18:16:07'),(4,4,21,'2015-11-06 04:18:27','2013-02-05 14:18:39','2016-05-15 03:20:54','2012-12-21 04:46:18'),(5,5,22,'2015-05-11 01:57:59','2011-08-08 08:57:26','2020-06-30 15:17:00','2013-11-29 00:38:05'),(6,6,24,'2018-05-30 21:57:42','2016-02-10 08:03:26','2018-01-09 23:33:18','2016-09-19 16:05:05'),(7,7,21,'2020-07-27 11:32:33','2018-12-02 11:53:08','2015-06-19 23:48:14','2017-01-24 10:48:40'),(8,8,22,'2011-06-19 07:04:45','2020-04-17 20:07:11','2012-10-06 03:51:42','2016-11-10 10:21:27'),(9,9,24,'2018-12-24 09:21:24','2011-08-09 07:58:08','2015-04-24 10:47:58','2019-05-29 22:52:46'),(10,10,21,'2019-08-28 02:42:39','2011-10-01 04:12:26','2011-07-18 20:43:23','2015-02-15 00:27:59'),(11,11,22,'2014-08-18 14:08:33','2011-07-30 09:11:03','2018-04-07 16:31:45','2020-02-13 20:08:28'),(12,12,24,'2014-12-15 00:45:38','2018-07-17 00:03:00','2012-10-28 12:51:56','2017-02-10 13:48:51'),(13,13,21,'2018-07-29 03:16:55','2016-01-16 22:08:23','2015-12-14 02:10:04','2012-12-12 18:39:40'),(14,14,22,'2017-08-09 15:26:43','2016-11-12 10:19:42','2012-07-11 18:26:02','2019-04-30 00:37:33'),(15,15,24,'2020-11-16 02:33:44','2012-10-11 09:31:35','2013-03-24 07:33:01','2018-04-03 01:20:04'),(16,16,21,'2012-02-24 08:59:11','2017-04-03 23:01:39','2016-12-15 11:10:55','2013-05-12 18:44:14'),(17,17,22,'2014-09-15 16:41:14','2013-12-21 05:49:02','2015-06-02 14:39:35','2016-06-09 00:29:08'),(18,18,24,'2014-08-12 02:00:01','2015-09-06 07:53:09','2013-11-24 17:40:44','2014-09-10 03:51:09'),(19,19,21,'2021-01-26 20:28:40','2019-09-13 18:09:33','2012-09-05 15:51:52','2016-08-21 15:18:01'),(20,20,22,'2019-12-30 16:30:20','2019-08-30 12:08:18','2011-06-06 13:10:52','2015-06-03 14:43:35'),(21,21,24,'2017-05-26 07:20:31','2014-05-26 15:36:18','2012-10-15 19:01:00','2012-09-26 15:00:05'),(22,22,21,'2013-05-25 07:05:34','2014-03-18 15:18:39','2014-11-18 07:09:28','2012-11-02 17:07:02'),(23,23,22,'2011-06-13 20:47:29','2013-12-08 23:24:26','2011-08-28 22:55:42','2013-05-05 09:50:52'),(24,24,24,'2015-02-22 04:08:39','2014-04-26 08:53:51','2014-07-24 13:10:38','2018-01-06 16:17:47'),(25,25,21,'2015-10-23 22:03:51','2018-10-04 11:24:11','2012-05-29 22:04:25','2016-04-28 07:16:40'),(26,26,22,'2016-12-10 05:13:12','2017-03-07 07:00:48','2016-08-08 02:43:54','2014-08-12 17:42:04'),(27,27,24,'2017-07-16 05:33:59','2020-10-14 11:36:00','2013-11-24 13:48:01','2011-11-19 22:50:06'),(28,28,21,'2018-06-06 16:30:52','2019-03-29 00:24:52','2015-08-11 13:17:02','2015-02-17 01:43:18'),(29,29,22,'2016-08-06 17:10:31','2013-08-15 18:26:58','2014-07-23 16:56:50','2019-12-01 22:05:59'),(30,30,24,'2018-04-14 13:02:09','2015-12-07 07:49:51','2013-06-17 18:50:46','2017-08-09 22:19:49'),(31,31,21,'2019-03-11 00:45:58','2012-05-29 04:29:50','2019-08-10 11:03:08','2019-04-21 23:15:40'),(32,32,22,'2015-06-23 22:25:15','2012-08-17 23:05:39','2013-01-29 18:32:13','2016-11-25 18:23:13'),(33,33,24,'2012-10-07 18:33:47','2018-06-10 01:46:53','2018-12-01 14:46:12','2014-01-11 10:54:20'),(34,34,21,'2020-04-18 14:04:45','2018-04-02 17:04:35','2016-05-20 07:45:59','2019-12-18 23:36:12'),(35,35,22,'2014-05-21 21:41:38','2012-07-30 04:09:20','2013-05-15 13:46:02','2020-03-07 02:00:10'),(36,36,24,'2011-11-16 06:29:41','2020-06-12 06:39:40','2016-06-07 12:08:49','2012-08-16 21:34:38'),(37,37,21,'2017-05-16 21:52:15','2016-11-15 18:45:26','2014-10-07 21:43:37','2014-05-04 07:12:53'),(38,38,22,'2014-07-21 20:39:51','2012-12-18 08:16:55','2011-08-29 16:30:19','2011-07-10 13:26:26'),(39,39,24,'2015-06-15 21:09:34','2017-05-11 19:20:59','2018-12-05 14:17:22','2021-01-10 09:16:00'),(40,40,21,'2016-04-05 10:26:19','2015-10-29 13:13:03','2020-09-13 17:59:56','2012-05-26 06:42:45'),(41,41,22,'2016-03-07 01:44:21','2018-06-23 01:56:43','2016-05-16 03:34:07','2018-02-26 23:41:35'),(42,42,24,'2012-10-26 15:03:00','2015-04-25 09:17:39','2012-11-03 23:47:42','2014-11-20 06:40:00'),(43,43,21,'2017-07-14 03:54:17','2013-05-02 18:45:04','2013-01-26 14:35:45','2013-12-02 21:52:36'),(44,44,22,'2021-02-08 04:03:59','2015-04-05 03:33:27','2011-06-27 16:01:19','2012-03-05 22:01:12'),(45,45,24,'2015-09-13 14:06:53','2013-12-25 05:09:50','2018-07-26 19:17:58','2016-01-21 06:12:21'),(46,46,21,'2017-09-09 14:55:29','2020-02-06 03:35:58','2015-11-18 16:39:55','2017-12-14 11:08:56'),(47,47,22,'2016-12-27 14:33:23','2011-06-29 23:56:46','2014-05-04 10:37:15','2019-07-14 13:35:33'),(48,48,24,'2020-09-15 22:53:09','2014-02-17 18:16:34','2017-10-09 04:33:11','2019-01-09 19:43:19'),(49,49,21,'2016-08-21 16:05:01','2013-05-26 01:19:04','2015-12-05 21:51:41','2013-01-09 19:56:52'),(50,50,22,'2015-02-17 23:05:00','2017-06-12 10:59:53','2016-05-23 14:39:23','2020-11-27 12:18:47');
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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Статусы дружбы';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friendship_statuses`
--

LOCK TABLES `friendship_statuses` WRITE;
/*!40000 ALTER TABLE `friendship_statuses` DISABLE KEYS */;
INSERT INTO `friendship_statuses` VALUES (21,'wait','2019-12-18 10:34:32','2015-10-31 16:54:20'),(22,'yes','2014-04-03 01:07:47','2020-08-01 10:14:08'),(24,'no','2016-08-01 02:14:12','2020-12-16 11:02:44');
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
INSERT INTO `media` VALUES (1,1,'iste',33609,NULL,1,'2014-11-19 06:02:05','2012-01-09 16:02:01'),(2,2,'consectetur',90231,NULL,2,'2016-11-16 09:44:33','2011-10-20 19:36:14'),(3,3,'qui',11864,NULL,3,'2011-04-17 01:48:34','2015-09-06 23:19:48'),(4,4,'consequatur',17035,NULL,1,'2015-03-06 18:36:47','2017-09-09 19:04:10'),(5,5,'quisquam',35600,NULL,2,'2017-11-29 15:14:05','2011-08-12 23:28:15'),(6,6,'qui',65707,NULL,3,'2012-12-28 15:20:33','2016-09-21 21:44:38'),(7,7,'sunt',20253,NULL,1,'2020-09-29 03:10:58','2015-01-15 12:01:33'),(8,8,'consectetur',42551,NULL,2,'2015-08-13 18:32:56','2013-11-25 02:34:42'),(9,9,'rem',48968,NULL,3,'2011-08-13 09:41:47','2014-09-08 04:06:20'),(10,10,'eaque',69666,NULL,1,'2014-07-08 12:31:07','2012-11-17 06:28:37'),(11,11,'ut',92232,NULL,2,'2013-02-08 02:08:54','2014-11-14 23:04:07'),(12,12,'molestiae',16404,NULL,3,'2018-01-15 03:53:33','2020-08-03 01:27:26'),(13,13,'nemo',18595,NULL,1,'2014-03-10 19:55:15','2016-09-06 11:12:32'),(14,14,'ut',31859,NULL,2,'2013-11-06 12:44:49','2015-04-06 02:39:50'),(15,15,'quasi',53829,NULL,3,'2011-05-20 06:55:46','2012-09-20 04:20:59'),(16,16,'omnis',61662,NULL,1,'2019-12-21 15:16:05','2018-02-14 19:14:01'),(17,17,'provident',96194,NULL,2,'2014-08-27 00:55:53','2015-11-30 22:14:13'),(18,18,'inventore',49647,NULL,3,'2011-12-03 06:16:06','2017-01-11 04:18:54'),(19,19,'excepturi',36961,NULL,1,'2017-07-20 12:47:02','2016-11-13 17:43:25'),(20,20,'eligendi',84749,NULL,2,'2013-08-11 12:33:17','2011-12-29 15:26:57'),(21,21,'ut',1967,NULL,3,'2020-08-09 21:05:40','2017-07-03 01:42:18'),(22,22,'mollitia',29980,NULL,1,'2017-05-22 20:27:03','2016-04-12 15:07:10'),(23,23,'ipsa',34553,NULL,2,'2014-03-29 06:16:06','2020-06-15 16:40:26'),(24,24,'et',91662,NULL,3,'2011-12-01 19:28:18','2012-02-10 09:51:30'),(25,25,'velit',47696,NULL,1,'2013-01-19 04:43:32','2014-05-03 16:16:19'),(26,26,'aut',39072,NULL,2,'2017-03-08 02:12:03','2013-12-10 23:07:46'),(27,27,'quo',69358,NULL,3,'2015-11-17 01:45:11','2017-07-07 01:33:21'),(28,28,'ab',1702,NULL,1,'2012-07-23 03:22:49','2018-01-12 19:26:18'),(29,29,'cumque',12856,NULL,2,'2014-12-30 10:14:28','2014-07-08 07:47:34'),(30,30,'nisi',77382,NULL,3,'2016-07-30 17:36:16','2011-07-17 21:16:59');
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
INSERT INTO `media_types` VALUES (1,'jpeg','2012-01-25 14:18:42','2013-05-03 20:45:56'),(2,'mp3','2020-07-15 16:36:31','2014-01-14 23:27:29'),(3,'avi','2017-10-28 03:08:31','2020-05-01 20:55:29');
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
INSERT INTO `messages` VALUES (1,1,1,'Eius ullam dolor rem velit deserunt. Minima consectetur magnam ea dolore aut sed et. Earum suscipit repellat sed recusandae repellat ut. Harum ipsum cumque ex sunt vitae aspernatur modi.',1,0,'2012-04-12 10:36:36'),(2,2,2,'Voluptas et voluptas qui et nam quibusdam. Eos minima quia molestiae non ut et qui ut. Est accusamus velit et ea officia rerum est. A officia est odio.',0,0,'2018-11-28 16:02:02'),(3,3,3,'Soluta excepturi velit voluptas minima facilis. Et dolor voluptatem vitae officia. Mollitia maxime maiores veniam pariatur doloribus accusamus. Omnis sapiente vel velit et aperiam molestias.',0,0,'2012-04-27 06:27:36'),(4,4,4,'Aut et laudantium numquam non beatae voluptatem sit. Doloremque qui reprehenderit omnis quas ab. Minima est quas consequuntur consequatur quia corrupti. Est eligendi vel voluptatibus voluptatibus nesciunt et fuga repudiandae.',1,0,'2013-12-20 01:44:28'),(5,5,5,'Et odit numquam vitae est. Quisquam repudiandae necessitatibus cumque. Debitis voluptas accusamus quaerat. Dolore perferendis ipsam commodi.',1,0,'2017-10-30 23:53:02'),(6,6,6,'Vel sit dolorem debitis sint in aut est exercitationem. Quaerat dolorum porro quia deserunt eaque omnis dignissimos.',0,0,'2017-12-25 04:20:37'),(7,7,7,'A velit minima iste inventore facere impedit. Reiciendis omnis consequatur sunt maxime. Veniam laborum autem id.',0,1,'2016-07-28 11:04:25'),(8,8,8,'Necessitatibus est non perspiciatis dolorum ullam. Consectetur est deserunt qui ipsa ipsam iusto omnis quibusdam. Nihil doloribus maiores sint aliquid incidunt. Saepe quisquam et possimus quo rerum.',0,0,'2012-07-15 20:55:18'),(9,9,9,'Consequatur optio deserunt dicta eos. Laboriosam nisi hic non doloremque sit. Laborum consequatur est aliquid tempore magni autem. Pariatur sed officia qui voluptas explicabo distinctio et.',0,1,'2018-02-03 18:29:50'),(10,10,10,'Distinctio qui autem qui iusto aspernatur maiores. Quos debitis incidunt provident est repellat. Quia consequatur eaque aut accusantium provident. Incidunt aut tenetur ea dolores. Iure officiis voluptatum aspernatur aut.',0,1,'2020-04-01 17:18:58'),(11,11,11,'Sed quia quae aut voluptas quasi mollitia natus possimus. A explicabo incidunt nam voluptas sunt voluptates. Dolorem sequi quidem et architecto eos voluptas enim. Aspernatur aperiam eum omnis autem quaerat expedita.',1,1,'2018-08-06 05:45:57'),(12,12,12,'Cumque rerum enim autem aut. Nesciunt sit amet eaque sed. Ut qui aut sint voluptatibus non asperiores.',1,1,'2012-07-15 18:34:17'),(13,13,13,'Commodi soluta vel ipsum molestiae molestias laborum non. Dolore dolorum voluptas inventore voluptatum. Perferendis illum sed sit ut.',1,0,'2018-08-14 13:57:17'),(14,14,14,'Non minima voluptatibus quae sint illum. Et rem facere et non. Et et voluptatibus non amet et praesentium voluptas. Sed veniam et et quae et ullam.',1,1,'2019-05-13 18:30:59'),(15,15,15,'Magnam iure dolorum quia molestias. Et accusantium voluptatem provident laborum aut. Tenetur inventore asperiores ipsa cum optio.',0,0,'2017-08-15 08:47:56'),(16,16,16,'Unde sunt vero nesciunt accusantium et. Repellat omnis nostrum temporibus vero labore. Quia ut sed corporis provident odio quas. Unde praesentium recusandae blanditiis voluptatem sit molestiae blanditiis.',1,1,'2018-01-02 18:18:05'),(17,17,17,'Animi odit magnam sed sit sint non consequuntur. Est ducimus quia molestias voluptas. Id culpa non ex quod. Ea voluptatem earum nobis rem.',0,1,'2016-01-01 20:06:27'),(18,18,18,'Quis consectetur doloremque quae ratione. Harum enim vel tenetur dolore a est.',1,1,'2019-07-29 08:32:08'),(19,19,19,'Necessitatibus recusandae recusandae error recusandae. Qui qui impedit omnis aut repudiandae. Dolore et nihil saepe harum debitis.',0,0,'2012-10-04 03:46:40'),(20,20,20,'Et id exercitationem doloremque facilis aut adipisci est aut. Tempora quos non porro aut sunt ab. Delectus et maxime accusamus libero repellendus nam maiores. Quia magnam cum sapiente voluptas illo facilis. Explicabo magnam sint eaque voluptatem id praesentium.',0,0,'2015-03-11 21:11:03');
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
INSERT INTO `profiles` VALUES (1,'m','2018-12-31','Dimitriberg','Cambodia','2016-03-24 00:06:51','2020-10-25 18:02:29','2012-10-21 14:01:43'),(2,'f','1976-07-31','Cruickshankland','Greenland','2012-03-17 04:49:45','2012-11-29 02:18:39','2011-08-09 12:33:26'),(3,'f','1988-04-07','Whiteland','Mali','2021-03-14 12:30:53','2020-01-02 08:33:53','2018-04-12 06:23:17'),(4,'f','1978-12-25','Lake Kaylee','Cocos (Keeling) Islands','2016-01-09 06:45:04','2013-08-06 08:30:37','2018-09-02 01:53:45'),(5,'f','1972-08-09','Oletaborough','Denmark','2014-02-06 19:59:12','2011-09-21 08:55:01','2011-08-10 19:06:49'),(6,'f','2014-06-22','North Myrlborough','Germany','2016-11-18 03:07:15','2020-11-01 18:20:42','2019-08-18 06:09:05'),(7,'f','1973-09-10','North Benny','Bouvet Island (Bouvetoya)','2017-02-18 03:57:46','2012-03-12 08:17:28','2021-01-07 13:55:07'),(8,'f','1995-05-08','Kshlerinville','Saint Vincent and the Grenadines','2019-06-05 02:03:32','2012-03-09 19:10:08','2012-03-20 10:47:14'),(9,'m','1994-12-12','New Lempi','Guinea-Bissau','2017-01-30 19:50:25','2012-12-25 06:21:32','2016-12-18 09:32:54'),(10,'m','2018-11-01','Lake Josephineside','Moldova','2013-12-14 02:37:05','2015-06-26 00:00:55','2020-01-01 23:12:10'),(11,'f','2009-03-26','Port Joshua','Palestinian Territory','2013-04-13 03:34:21','2012-02-22 05:13:42','2015-09-24 04:42:24'),(12,'f','1990-08-10','Wizaside','Malta','2015-12-18 21:15:10','2018-10-19 14:14:15','2017-06-25 02:58:39'),(13,'f','1994-09-11','Isombury','Norfolk Island','2020-08-31 07:36:05','2018-08-20 11:13:43','2011-12-28 06:51:14'),(14,'f','1979-10-13','Port Salliefurt','Equatorial Guinea','2018-11-29 19:08:28','2018-09-10 04:48:04','2020-01-04 09:24:05'),(15,'m','2011-07-31','North Paulaberg','Dominican Republic','2014-05-20 10:22:07','2019-04-22 22:52:51','2014-12-01 05:39:27'),(16,'f','1974-05-16','South Morrisland','Montenegro','2012-10-21 16:49:13','2013-11-06 03:44:08','2011-05-25 07:49:19'),(17,'m','1976-03-21','West Vickie','Greece','2018-04-09 21:20:11','2013-04-08 00:21:37','2016-04-05 11:14:05'),(18,'f','1976-01-27','Mrazville','Saint Kitts and Nevis','2020-08-02 04:18:19','2016-09-04 22:56:19','2018-08-11 14:28:07'),(19,'f','1998-01-03','Vernfort','Monaco','2014-09-25 10:55:51','2018-11-19 17:01:28','2014-10-05 03:41:18'),(20,'f','1998-12-18','Lake Darrel','South Africa','2017-01-13 18:48:09','2018-09-20 01:33:00','2020-08-01 23:02:22'),(21,'m','1999-11-13','North Brown','Niue','2020-06-09 07:42:06','2017-03-06 09:21:12','2012-01-18 23:09:39'),(22,'f','1999-01-10','Gorczanyview','Saint Barthelemy','2016-11-24 15:34:42','2013-01-20 21:07:59','2015-09-05 22:45:29'),(23,'f','1971-07-26','Lake Jaquelin','Fiji','2020-04-16 17:06:34','2016-06-06 07:35:07','2014-03-18 07:12:41'),(24,'f','1984-10-14','East Aliberg','South Georgia and the South Sandwich Islands','2014-08-18 16:34:48','2012-11-17 08:43:44','2016-10-21 23:27:50'),(25,'f','1994-08-17','West Mittie','Guam','2020-04-06 16:17:01','2012-07-06 22:59:35','2019-08-20 08:16:01'),(26,'m','1997-12-20','Raynorland','Saint Pierre and Miquelon','2013-05-23 15:41:32','2015-04-07 22:27:12','2015-12-09 03:16:13'),(27,'m','2020-12-07','Hesselmouth','Tuvalu','2015-10-26 08:42:47','2017-09-27 22:20:03','2012-05-15 14:52:15'),(28,'m','1998-03-20','South Cassidymouth','Bolivia','2011-07-01 20:13:36','2018-11-07 10:27:14','2016-04-06 12:31:42'),(29,'f','2000-07-19','New Celine','Burkina Faso','2014-08-27 20:58:45','2013-09-29 15:32:05','2014-12-07 17:05:45'),(30,'m','1993-01-07','East Gregg','Nauru','2013-10-03 00:49:03','2013-09-16 14:41:25','2019-02-22 23:54:28'),(31,'m','1998-12-21','East Alexandre','Belarus','2019-08-11 23:32:11','2012-09-13 08:43:47','2016-10-24 14:36:29'),(32,'f','2001-08-26','Port Branson','Faroe Islands','2014-12-08 18:10:35','2013-06-11 07:01:46','2018-08-13 23:53:34'),(33,'m','1977-07-07','East Janiya','Afghanistan','2013-03-22 14:44:29','2020-09-10 00:54:30','2020-10-12 09:21:50'),(34,'f','2017-11-21','Karolannmouth','Israel','2012-03-17 18:18:49','2016-03-28 20:19:15','2020-07-18 20:29:56'),(35,'m','1992-06-01','Port Jabari','Liberia','2021-01-10 10:42:08','2015-10-05 13:29:12','2015-03-23 19:19:24'),(36,'m','2002-07-05','Siennabury','Vietnam','2017-11-03 13:21:35','2020-08-21 20:09:09','2016-02-25 21:25:38'),(37,'f','1997-03-31','East Agustina','Cook Islands','2020-12-21 17:19:54','2014-10-19 20:12:37','2016-08-31 11:08:16'),(38,'m','2001-10-13','Johnsside','Montenegro','2014-12-26 14:25:47','2016-08-01 11:12:01','2019-06-14 11:54:44'),(39,'f','2016-01-15','Wintheiserberg','Algeria','2012-01-17 05:19:41','2015-11-23 02:32:48','2017-03-16 06:13:08'),(40,'f','1984-03-30','Granvilleport','South Africa','2017-10-16 23:27:12','2020-10-13 03:41:41','2015-11-18 03:51:54'),(41,'f','2018-06-25','East Lulachester','Cyprus','2012-07-29 10:05:25','2020-01-24 08:48:30','2013-04-17 21:46:09'),(42,'m','1982-03-07','North Zelmaburgh','Norfolk Island','2014-10-05 03:40:12','2019-08-30 14:22:26','2016-12-18 07:15:05'),(43,'f','2009-04-01','Lake Kearaside','Nigeria','2015-05-22 03:34:58','2020-04-21 07:56:10','2016-08-14 19:53:40'),(44,'f','1973-07-18','West Zakarymouth','Maldives','2018-12-18 22:46:57','2020-11-23 09:49:30','2013-02-26 20:21:59'),(45,'m','2013-01-24','Lake Melany','Palestinian Territory','2015-01-04 15:02:51','2018-07-05 13:53:21','2016-04-26 21:18:58'),(46,'f','2017-03-03','West Luisaville','Montenegro','2013-01-20 11:01:04','2019-03-05 02:17:50','2016-08-05 01:04:35'),(47,'m','1974-09-02','South Kenya','Turks and Caicos Islands','2013-09-20 02:10:45','2018-01-07 15:46:19','2012-12-29 20:06:38'),(48,'f','1980-11-02','New Earlfurt','Moldova','2011-11-15 14:11:26','2018-07-24 03:44:52','2012-06-30 07:39:36'),(49,'f','1981-04-09','Langmouth','Oman','2017-10-12 17:04:45','2012-03-30 12:22:22','2020-07-29 12:52:06'),(50,'m','2012-03-08','Niaville','Guatemala','2016-12-20 20:12:58','2015-09-24 06:42:07','2013-02-22 23:32:59'),(51,'m','2018-03-03','Anaton','Uruguay','2017-06-14 08:13:06','2013-07-03 10:52:12','2018-07-31 12:11:31'),(52,'f','1992-03-02','Samstad','Malaysia','2017-03-11 09:31:55','2017-11-06 23:35:01','2013-09-12 04:16:24'),(53,'m','1979-05-28','Priceville','Mayotte','2013-07-08 20:05:45','2012-12-11 19:00:07','2018-04-11 09:18:48'),(54,'f','1997-02-17','Diannaport','Malaysia','2012-05-04 10:28:05','2015-11-28 14:19:12','2020-02-05 21:38:22'),(55,'f','1996-03-13','Magalihaven','Bahrain','2012-10-24 17:38:27','2017-07-25 21:10:10','2012-04-25 06:09:04'),(56,'m','1998-08-17','West Ruthside','Estonia','2013-11-18 17:49:49','2011-11-07 14:46:16','2012-11-02 02:41:19'),(57,'m','1991-08-03','New Flossie','Congo','2011-08-04 15:44:12','2015-02-05 16:27:14','2016-11-24 21:25:22'),(58,'f','1991-06-13','West Hyman','Moldova','2015-03-01 09:03:26','2019-07-31 13:10:35','2017-03-26 19:51:17'),(59,'m','2019-01-07','South Clyde','Azerbaijan','2012-05-24 17:05:30','2015-06-03 08:32:07','2015-10-20 22:07:17'),(60,'m','1992-12-25','North Arne','Heard Island and McDonald Islands','2011-04-10 23:48:01','2015-03-28 04:48:57','2011-10-02 01:22:48'),(61,'f','1995-04-27','North Dereckmouth','Wallis and Futuna','2016-12-16 03:16:43','2012-07-24 14:00:01','2013-04-21 08:48:02'),(62,'m','1998-02-18','South Annetteside','Burkina Faso','2013-08-02 14:31:33','2019-02-17 15:29:16','2021-01-11 19:22:55'),(63,'m','2011-08-05','South Cecilport','New Caledonia','2012-06-18 12:04:28','2012-12-22 01:36:19','2011-10-20 01:15:48'),(64,'f','1979-09-28','Hansenshire','Myanmar','2019-07-13 01:29:36','2017-08-08 18:48:37','2019-08-05 09:37:26'),(65,'f','1971-03-23','Wisozkstad','Uruguay','2012-12-25 17:28:37','2012-06-20 14:03:15','2016-02-05 11:45:08'),(66,'m','1999-08-27','Kovacekhaven','Central African Republic','2019-05-07 19:35:26','2016-12-03 17:41:11','2018-01-27 12:15:52'),(67,'m','1974-12-05','New Wayneside','Mayotte','2013-05-31 13:29:15','2017-02-20 19:10:59','2018-10-05 08:35:53'),(68,'f','1982-09-16','New Lucious','Zambia','2019-09-26 10:10:57','2012-11-29 08:41:21','2013-09-20 03:53:03'),(69,'f','1990-08-31','Susanamouth','Honduras','2021-01-08 03:01:25','2015-01-16 03:22:58','2012-09-23 09:07:25'),(70,'f','2020-07-12','Willmsburgh','New Caledonia','2013-07-13 07:47:37','2016-09-07 23:32:01','2011-05-24 21:25:11'),(71,'m','1975-08-16','East Kirk','Cape Verde','2018-07-24 18:00:57','2017-12-09 03:04:24','2016-10-01 10:32:38'),(72,'f','1986-02-18','Naderburgh','Slovakia (Slovak Republic)','2015-07-20 05:16:55','2016-01-03 13:49:47','2013-11-21 09:33:16'),(73,'f','2000-03-08','Lake Collin','Namibia','2013-11-19 17:37:07','2019-12-15 08:58:50','2014-09-02 20:01:36'),(74,'f','1974-07-14','Runolfsdottirborough','Panama','2012-08-06 19:59:21','2013-07-24 02:10:24','2020-03-31 18:53:06'),(75,'m','1976-11-20','West Milfordville','Martinique','2018-10-23 16:06:16','2012-12-30 12:01:06','2013-12-12 21:13:23'),(76,'m','1989-11-11','East Deron','New Caledonia','2020-06-06 22:15:45','2012-08-26 03:57:12','2018-12-10 11:11:39'),(77,'m','1979-09-21','North Tierra','Romania','2018-02-24 09:18:22','2017-11-20 04:29:03','2011-06-05 02:47:09'),(78,'f','2015-11-28','Port Jarrodberg','Andorra','2012-03-16 04:36:22','2018-01-30 13:23:28','2012-07-16 11:06:44'),(79,'f','2015-11-25','South Doris','Greenland','2015-07-12 04:26:45','2014-10-06 06:35:12','2013-09-24 01:39:37'),(80,'f','1971-02-10','South Eliane','Monaco','2016-07-22 15:10:26','2016-04-25 23:55:40','2019-01-13 19:27:34'),(81,'m','2015-12-25','New Robynland','Malta','2017-07-18 02:59:25','2018-03-03 12:58:07','2020-08-27 16:19:24'),(82,'m','1970-07-24','North Chase','Swaziland','2016-07-22 10:32:28','2011-07-06 14:13:17','2017-10-15 13:15:40'),(83,'m','2014-11-25','West Reba','Puerto Rico','2019-06-24 23:19:12','2018-12-28 16:55:26','2013-11-14 15:04:12'),(84,'m','1998-01-21','Mandyside','Jordan','2014-06-01 10:39:42','2019-10-08 02:24:20','2021-03-05 13:45:41'),(85,'m','1981-08-15','New Polly','El Salvador','2012-04-03 09:17:59','2017-05-24 08:02:29','2014-03-20 11:49:18'),(86,'m','2004-10-01','South Lizaport','Kazakhstan','2020-04-24 10:54:55','2017-05-24 12:19:44','2021-02-02 06:55:18'),(87,'f','1973-01-25','East Gerard','Kenya','2012-03-19 13:27:32','2016-07-25 00:33:06','2014-04-25 13:18:04'),(88,'f','2008-03-03','South Rosaside','Guernsey','2017-02-13 20:43:47','2019-01-06 14:41:44','2020-03-25 12:21:00'),(89,'f','1994-08-10','Leilaniside','Kazakhstan','2019-04-15 19:40:22','2014-12-20 15:30:03','2012-01-17 13:00:37'),(90,'f','1985-07-15','Abdulfurt','Chile','2014-04-06 17:31:44','2015-04-03 17:38:22','2012-03-28 17:09:05'),(91,'m','1988-04-13','Mohammadfort','Liechtenstein','2019-04-18 01:54:01','2017-08-16 21:50:12','2017-11-18 03:14:58'),(92,'f','2007-11-09','Kirstinhaven','Luxembourg','2016-10-21 06:50:08','2017-01-12 16:49:51','2019-03-31 18:30:31'),(93,'m','2006-11-07','New Nashfort','Australia','2018-05-22 03:37:50','2017-03-02 18:55:30','2018-08-22 04:23:02'),(94,'m','2015-03-25','Blandaside','Iraq','2017-11-16 07:56:15','2015-09-28 08:09:27','2011-08-11 07:07:37'),(95,'m','1971-10-13','Stellafort','Macao','2019-02-19 09:15:33','2020-07-30 01:36:09','2018-07-11 20:16:18'),(96,'f','2017-03-19','Gerlachburgh','Cape Verde','2017-03-06 01:00:18','2014-07-25 16:10:18','2020-11-24 16:10:24'),(97,'m','2018-09-21','Lake Haskellview','Nauru','2012-10-28 20:33:25','2015-10-18 13:49:47','2012-09-22 12:52:02'),(98,'f','1974-01-03','Amirafurt','Qatar','2015-05-26 12:23:02','2012-05-14 01:32:54','2018-07-15 00:42:33'),(99,'m','2008-12-20','New Darbyburgh','Dominica','2018-09-01 02:09:51','2015-05-12 22:57:00','2015-02-20 14:41:39'),(100,'m','2007-08-30','Lexiton','Morocco','2011-10-01 19:15:17','2013-11-24 16:13:43','2016-03-17 10:09:57');
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
INSERT INTO `users` VALUES (1,'Bernhard','Boyle','johnson.randy@example.org','1-782-050-3269x00264','2017-08-25 13:12:48','2016-09-03 04:47:58'),(2,'Shad','Tillman','paul.langosh@example.net','+43(1)0761706879','2011-05-10 23:20:54','2014-04-29 14:21:02'),(3,'Juwan','Torphy','dstehr@example.org','969-433-8703','2016-09-12 13:31:35','2017-12-13 12:34:17'),(4,'Major','Schimmel','bernier.arden@example.org','(965)317-7635','2020-12-30 01:50:40','2019-02-11 11:57:36'),(5,'Abagail','Pfannerstill','emmett80@example.net','(514)163-3722x850','2011-08-23 11:43:04','2011-07-29 12:06:36'),(6,'Rahul','Rowe','stanton.rossie@example.com','511.241.1525x01802','2011-09-21 08:17:52','2015-03-31 11:33:38'),(7,'Wilbert','Gerlach','rowe.amina@example.net','474.877.4848','2015-03-02 09:01:44','2018-12-29 07:22:14'),(8,'Sophia','Emmerich','beer.grayce@example.org','121-334-5572x46057','2018-03-09 05:45:15','2013-06-29 00:08:35'),(9,'Sheila','Blanda','quigley.berneice@example.org','478-518-4935x6720','2015-11-18 23:56:24','2017-07-15 16:06:15'),(10,'Joshuah','Daugherty','gbartell@example.org','(270)930-3527x553','2012-10-21 20:15:30','2020-12-23 23:36:28'),(11,'Tianna','Koss','dock.pfannerstill@example.net','135.536.8714','2011-10-24 11:16:38','2016-08-31 04:38:40'),(12,'Abel','Rath','bartoletti.abigayle@example.org','993-238-8404x08542','2020-10-24 08:38:20','2019-09-29 21:41:33'),(13,'Richie','Krajcik','aurore04@example.org','(678)231-6448x48900','2015-02-12 10:49:13','2016-03-03 06:12:03'),(14,'Garry','Emmerich','kutch.jameson@example.org','(244)867-7472x85676','2019-10-11 14:04:21','2018-12-11 05:33:05'),(15,'Isaias','Wiza','ksimonis@example.com','(321)636-9571','2012-03-16 12:58:27','2013-10-13 09:38:02'),(16,'Daniela','Murray','jamil.strosin@example.com','(643)236-3827','2017-05-24 23:15:59','2020-04-18 05:30:00'),(17,'Dean','Abshire','reynolds.raegan@example.org','1-071-188-2774','2018-02-21 16:35:49','2013-06-09 01:18:35'),(18,'Chad','Gorczany','bartoletti.malika@example.org','+99(9)7829682363','2012-06-12 10:06:40','2019-03-14 18:24:18'),(19,'Alden','Heidenreich','rath.clare@example.org','1-742-801-9654x88261','2012-07-26 21:57:49','2012-11-28 11:50:52'),(20,'Lucie','Macejkovic','liza98@example.net','(276)476-8004x4257','2015-04-29 02:02:30','2015-01-16 10:15:51'),(21,'Cleo','Heidenreich','gdubuque@example.net','1-956-665-7516x216','2017-01-04 09:38:06','2017-02-24 09:09:36'),(22,'Cecil','Windler','franecki.jerrell@example.org','1-807-510-5266','2016-02-13 08:30:23','2020-05-13 05:56:58'),(23,'Walter','Hettinger','o\'hara.clemmie@example.org','+54(5)0506656515','2014-08-11 18:49:31','2021-01-15 12:06:57'),(24,'Emie','Gerlach','heber.marquardt@example.com','(608)094-1786','2017-04-18 04:49:07','2020-12-15 08:19:12'),(25,'Kailee','Davis','xtremblay@example.net','(898)530-6687x6258','2012-09-08 08:50:32','2013-02-17 04:40:04'),(26,'Aubrey','Kerluke','aric.mertz@example.org','797-146-0835x8257','2013-06-14 17:17:25','2013-04-24 02:05:52'),(27,'Dejah','Hansen','reed.hoeger@example.com','(987)648-5296','2011-05-14 08:22:53','2016-09-29 06:29:36'),(28,'Lavina','Bosco','flavio77@example.com','1-867-803-3661x836','2016-08-05 18:30:57','2013-01-05 02:41:02'),(29,'Cheyenne','Effertz','raoul00@example.org','(960)968-2151x3981','2020-11-15 10:00:06','2017-01-24 08:23:03'),(30,'Jaquelin','Bartell','lamar.johns@example.com','(458)071-8574x678','2018-12-02 17:51:46','2015-03-09 02:46:01'),(31,'Maudie','Schmitt','zachery42@example.net','241.127.8926x34506','2012-08-18 00:56:45','2015-06-01 19:04:15'),(32,'Lilyan','Stracke','schuster.jaycee@example.org','1-952-198-6797','2011-04-24 01:26:16','2012-02-25 12:36:24'),(33,'Jovani','Volkman','lenore.hayes@example.org','1-656-085-8994','2011-10-21 02:24:29','2012-09-02 23:27:47'),(34,'Flossie','Herzog','raynor.sydney@example.com','460.025.5376x87915','2019-06-15 22:51:40','2017-04-30 12:34:03'),(35,'Dino','Zboncak','leuschke.malcolm@example.org','1-369-303-9422x8987','2011-06-20 01:08:21','2016-01-10 10:18:52'),(36,'Hollis','Kshlerin','maurine08@example.org','395.726.3966','2020-07-26 18:50:45','2016-10-02 08:58:39'),(37,'Webster','Wolf','dtremblay@example.org','04586936755','2014-12-05 16:18:43','2020-07-25 22:46:23'),(38,'Aileen','Cole','fadel.eloy@example.org','+72(9)9774377439','2013-04-13 02:29:13','2012-01-05 05:20:00'),(39,'Dominic','Waelchi','mlind@example.org','432-480-7488','2019-07-30 05:45:39','2011-10-07 13:07:53'),(40,'Eudora','Rau','batz.alexie@example.org','1-844-006-0769','2020-03-05 15:46:51','2017-05-03 23:35:15'),(41,'Kirstin','Hodkiewicz','bartell.kim@example.org','1-658-588-8664x7848','2018-02-10 02:11:55','2014-11-04 18:12:34'),(42,'Genevieve','Hauck','gino.ward@example.org','1-587-950-1682x405','2018-08-12 07:49:30','2020-07-07 14:38:12'),(43,'Adolph','Stiedemann','ziemann.deanna@example.com','+13(4)0115519985','2020-08-20 21:17:58','2016-07-24 09:05:09'),(44,'Braulio','Bins','edison.watsica@example.net','(497)865-9944','2018-01-19 18:15:00','2019-04-01 21:22:44'),(45,'Lindsay','Sipes','gschmidt@example.org','770.567.2662x5758','2020-07-07 11:27:00','2018-07-20 23:18:34'),(46,'Samanta','King','dorian.armstrong@example.org','569-815-0799x8322','2015-05-02 07:52:55','2020-03-28 03:41:28'),(47,'Jimmy','Raynor','vivien29@example.com','978.426.9520x1756','2018-04-09 14:01:15','2015-06-07 07:44:03'),(48,'Dean','Welch','zpadberg@example.net','822-711-2825x5772','2011-07-31 10:16:13','2020-11-18 04:44:15'),(49,'Isadore','Paucek','dock67@example.org','762.831.0313x49417','2017-08-22 05:27:29','2018-11-28 02:16:13'),(50,'Beaulah','Schulist','grady.easter@example.org','1-088-716-6924','2015-06-30 06:37:48','2012-06-21 06:12:57'),(51,'Romaine','Yundt','ottis61@example.net','172.920.5187','2011-06-04 17:52:08','2018-09-16 20:53:55'),(52,'Margarete','Reichel','ethel.hamill@example.com','580.123.8950x74139','2013-06-30 13:03:46','2018-02-19 14:39:31'),(53,'Americo','Walker','nleffler@example.org','1-998-571-1415x2942','2017-09-23 17:12:41','2017-10-27 18:11:26'),(54,'Clotilde','Marquardt','hanna84@example.org','156-967-8187x16941','2015-02-09 09:55:59','2021-03-11 01:21:56'),(55,'Nick','Bogisich','maribel85@example.net','1-965-465-1631','2013-07-10 08:22:47','2013-09-28 12:28:17'),(56,'Samanta','Koelpin','mckenzie.otha@example.net','1-944-910-8850','2012-11-05 09:41:16','2019-03-31 12:53:47'),(57,'Aidan','Kreiger','schroeder.blanche@example.net','365.300.6879x9310','2016-06-11 19:14:04','2016-02-08 21:59:13'),(58,'Rex','Gerhold','aemmerich@example.net','(905)787-2071x364','2014-10-27 02:11:33','2014-03-06 16:07:46'),(59,'Jamey','Hilpert','gideon52@example.org','1-373-059-5277x08515','2020-02-19 05:54:56','2011-12-07 19:24:59'),(60,'Maynard','Koepp','casper.amara@example.org','(143)778-6556','2020-04-07 09:59:10','2020-06-03 20:47:13'),(61,'Justina','Bruen','vivien.koss@example.org','131.192.4276x75308','2011-12-04 17:22:29','2014-01-08 10:43:37'),(62,'Victoria','Miller','viva.hilpert@example.net','159-543-9860','2016-09-12 05:32:26','2013-02-27 19:33:30'),(63,'Velva','Nader','fahey.sam@example.org','09192570857','2013-01-16 09:38:49','2014-05-26 02:33:50'),(64,'Marcos','Gibson','mswift@example.org','993-121-2114','2016-03-28 15:29:05','2013-01-15 15:47:51'),(65,'Clair','Stehr','emile81@example.org','040-572-2064','2018-01-25 00:40:24','2011-11-16 04:49:51'),(66,'Tina','Jerde','jody.mcglynn@example.com','07124530906','2015-07-31 08:01:40','2014-05-25 01:06:40'),(67,'Linda','Wehner','jayme.davis@example.org','1-222-700-7423x803','2011-06-20 06:43:50','2013-07-31 17:08:56'),(68,'Helene','Krajcik','maryam17@example.org','982-169-0872x88671','2013-01-20 05:45:08','2015-07-29 04:34:02'),(69,'Jocelyn','Haag','john.reichert@example.org','(437)206-9095x10873','2020-12-17 07:46:13','2016-12-23 17:25:54'),(70,'Monica','Roob','denesik.wilfred@example.net','(997)435-6753x1638','2012-05-15 05:00:42','2013-04-23 06:43:13'),(71,'Eldon','Ruecker','newell54@example.org','233-216-4610','2020-02-22 21:06:52','2016-02-14 20:35:54'),(72,'Keshawn','Gerhold','ziemann.jaiden@example.net','674-079-7131','2019-10-15 12:51:23','2014-01-14 20:31:37'),(73,'Anika','Eichmann','mwolff@example.org','(105)142-3368x07734','2020-11-20 07:16:16','2012-06-30 09:36:14'),(74,'Autumn','Mills','lulu.wyman@example.com','+32(1)3679788367','2018-02-08 08:52:56','2013-01-29 15:37:08'),(75,'Josefina','Cummings','reynolds.kali@example.com','521.028.5808','2016-05-11 16:42:40','2012-07-11 07:53:06'),(76,'Justyn','Nienow','sonny64@example.net','646.626.7307','2019-02-02 14:28:20','2019-05-03 15:31:13'),(77,'Delia','Sanford','ekutch@example.org','06994484083','2016-07-08 12:13:04','2019-10-08 02:12:30'),(78,'Chaya','Brekke','urobel@example.com','1-910-929-4034','2011-10-27 02:35:32','2016-09-26 21:35:34'),(79,'Theodore','Jacobi','evangeline.satterfield@example.com','148.249.4197','2011-12-17 08:30:01','2015-06-20 15:02:00'),(80,'Icie','Larson','stefanie87@example.org','04082021765','2019-09-02 19:13:35','2019-11-12 06:40:42'),(81,'Sebastian','Gislason','mcormier@example.net','1-474-803-8696','2019-02-28 20:02:18','2012-09-09 11:47:00'),(82,'Ashtyn','Schaden','frederique.ratke@example.net','332.316.8498','2016-08-20 06:19:41','2013-09-30 15:23:59'),(83,'Pamela','Adams','brando34@example.net','089-217-7901x89152','2020-10-18 19:46:56','2016-11-26 14:55:54'),(84,'Carole','Metz','bkuhlman@example.org','(924)801-3897x50190','2021-02-10 09:13:19','2015-04-17 12:18:47'),(85,'Terrill','Welch','junius.lubowitz@example.net','1-481-098-7369','2013-07-03 05:16:09','2012-08-17 16:37:30'),(86,'Magdalena','Bergnaum','laron74@example.org','(403)233-0770x822','2015-09-13 23:15:53','2020-06-06 21:11:49'),(87,'Kane','Mraz','glover.rick@example.com','886-293-2699x3541','2020-02-20 11:17:49','2012-10-29 07:49:58'),(88,'Aric','Okuneva','jo\'reilly@example.com','185-358-7283x45211','2014-01-15 11:27:59','2018-08-22 23:37:23'),(89,'Bettie','Kovacek','mlebsack@example.com','019-007-0810','2019-05-29 17:20:55','2012-05-02 22:46:09'),(90,'Amir','Crona','eulah.littel@example.org','341-344-4415x7165','2013-09-18 09:34:22','2017-12-15 16:19:16'),(91,'Karen','Frami','kuphal.adalberto@example.com','1-337-868-2940x24299','2014-03-19 21:32:13','2014-07-08 03:46:06'),(92,'Hal','Wilkinson','glenda26@example.com','+86(0)2720289532','2019-01-14 01:08:18','2018-08-19 05:08:02'),(93,'Lyda','Reichel','ludwig.lang@example.net','069.387.1979x17029','2019-03-08 15:59:18','2019-01-28 08:02:35'),(94,'Justen','Rosenbaum','cnolan@example.org','(065)182-1654','2020-02-26 00:01:07','2018-10-04 04:18:21'),(95,'Delta','O\'Reilly','eden34@example.net','1-188-258-3059x8652','2015-06-23 06:44:34','2020-07-29 20:05:01'),(96,'Gisselle','Nader','favian58@example.org','1-148-660-3077x1156','2017-01-27 14:00:59','2018-11-11 12:58:47'),(97,'Abel','Runolfsdottir','dauer@example.com','(362)269-1753x27137','2015-01-05 11:23:10','2013-06-30 22:28:49'),(98,'Magdalen','Dickinson','rstracke@example.com','188-823-8192x16609','2012-09-13 21:04:20','2014-07-31 14:28:35'),(99,'Modesto','Bartoletti','rodriguez.isabell@example.com','1-252-880-8346x607','2017-12-22 19:42:26','2014-04-20 01:41:08'),(100,'Angelina','Buckridge','mbauch@example.org','1-070-144-0918x67978','2021-03-05 04:05:39','2019-08-24 15:03:38');
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

-- Dump completed on 2021-03-28 21:22:32
