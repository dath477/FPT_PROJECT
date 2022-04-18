CREATE DATABASE  IF NOT EXISTS `fpt_project` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `fpt_project`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: fpt_project
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$320000$mnP0OPYSD1qp4dBPkWZy5a$i0gK1Sd7RSMnE+SkUKUfLB/Jd/hEKtAiJIxzCvis0CA=',NULL,0,'thuad','','','danhthua97@gmail.com',1,1,'2022-04-12 14:18:10.908507'),(2,'pbkdf2_sha256$320000$I8wCh9B7LffKcKYAqlEvpA$1uPHRPAMQs0FxEW7m3RUorI6pX49Hq5arXaGCM0IWkA=','2022-04-18 06:08:19.659598',1,'danht','','','danhthua97@gmail.com',1,1,'2022-04-13 10:13:12.000000'),(3,'pbkdf2_sha256$320000$OIYzDqkezXMtmr3Ch0CNE9$v0sisB3MkTRD153S9TTPWen93YahNd0SvZ4PTdWZgpo=','2022-04-13 17:10:49.465814',0,'test','','','',1,1,'2022-04-13 15:10:57.000000'),(4,'pbkdf2_sha256$320000$YC0X9GKrPygRxzNlKaRxni$mGb3C+3dKHOlIlSROVfvdpsQRoQMt+9bcg0MiS1Du9g=','2022-04-18 05:34:52.940470',1,'admin','admin','admin','admin@gmail.com',1,1,'2022-04-15 13:55:22.000000'),(5,'pbkdf2_sha256$320000$s6PoQKOvRVcYS6Lm0OnrJY$yLhZvyMmhbzv8Yb7x2pvpFD7GbzWcTlQctYCKh6SRvg=','2022-04-18 04:41:58.830429',0,'abc','thua','d','danhthua99@gmail.com',1,1,'2022-04-16 17:57:49.000000'),(6,'pbkdf2_sha256$320000$v6isc3GmWBfz96CIJkvaNu$9cDCLsM/kTH2HBCEMcHgvjsFIIrHOADPmBUlW0hrCho=',NULL,0,'abcd','','','danhthua99@gmail.com',0,1,'2022-04-17 05:13:51.050130'),(7,'pbkdf2_sha256$320000$7PBOulOW8u0LLbpSJfeI7s$sQ30H1L5udCr3tJ0Uei2qXmlZg+1RT6BhU3wdRDJ0sw=',NULL,0,'abce','','','danhthua99@gmail.com',0,1,'2022-04-17 05:17:52.569640'),(11,'pbkdf2_sha256$320000$ssLH8HmfwtASKm5PlU4H2u$HX9i5BTp7MK1FmJ/V8n5VW+nlCl+BSMG/zNbrNUxogA=',NULL,0,'ddd','','','danhthua99@gmail.com',1,1,'2022-04-17 05:35:52.535315'),(15,'pbkdf2_sha256$320000$4lfjashzCgM7FOK11Sn10J$nzELDoeZd4NN+dCu2SEOqNkE+2vHcwRBxaK1cXtjLUI=',NULL,1,'aaaaa','','','danhthua97@gmail.com',0,0,'2022-04-18 05:37:45.368268');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
INSERT INTO `auth_user_user_permissions` VALUES (116,1,4),(117,1,13),(118,1,14),(119,1,15),(120,1,16),(144,2,13),(145,2,14),(146,2,16),(126,4,4),(127,4,6),(128,4,8),(129,4,14),(130,4,16),(98,5,4),(99,11,5),(100,11,6),(101,11,8),(102,11,13),(103,11,14),(131,15,13),(132,15,14),(133,15,15),(134,15,16);
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_table`
--

DROP TABLE IF EXISTS `chat_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat_table` (
  `idchat_table` int NOT NULL,
  `username` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `chat_content` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `chat_status` varchar(1) COLLATE utf8_unicode_ci DEFAULT '1',
  `chat_time` datetime DEFAULT NULL,
  PRIMARY KEY (`idchat_table`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci COMMENT='table chat';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_table`
--

LOCK TABLES `chat_table` WRITE;
/*!40000 ALTER TABLE `chat_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `chat_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (9,'2022-04-17 11:20:54.272720','14','aabb',1,'Add user',4,4),(10,'2022-04-17 13:48:56.088947','4','admin',2,'[{\"changed\": {\"fields\": [\"User permissions\"]}}]',4,4),(11,'2022-04-17 16:48:27.369843','4','admin',2,'Edit user',4,4),(12,'2022-04-17 16:48:37.732498','4','admin',2,'Edit user',4,4),(13,'2022-04-17 16:48:42.960606','4','admin',2,'Edit user',4,4),(14,'2022-04-17 16:50:32.714128','4','admin',2,'Edit user',4,4),(15,'2022-04-17 16:50:43.364889','4','admin',2,'Edit user',4,4),(16,'2022-04-17 16:51:06.667596','4','admin',2,'Edit user',4,4),(17,'2022-04-17 16:51:54.442945','4','admin',2,'Edit user',4,4),(18,'2022-04-17 16:53:48.400293','4','admin',2,'Edit user',4,4),(19,'2022-04-17 16:54:26.067957','4','admin',2,'Edit user',4,4),(20,'2022-04-17 16:54:56.759685','4','admin',2,'Edit user',4,4),(21,'2022-04-17 16:55:29.343850','4','admin',2,'Edit user',4,4),(22,'2022-04-17 16:55:42.854876','4','admin',2,'Edit user',4,4),(23,'2022-04-17 16:59:18.367891','4','admin',2,'Edit user',4,4),(24,'2022-04-17 16:59:24.509639','4','admin',2,'Edit user',4,4),(25,'2022-04-17 16:59:30.711203','4','admin',2,'Edit user',4,4),(26,'2022-04-17 17:01:19.815767','4','admin',2,'Edit user',4,4),(27,'2022-04-17 17:01:35.629106','4','admin',2,'Edit user',4,4),(28,'2022-04-17 17:06:37.014957','4','admin',2,'Edit user',4,4),(29,'2022-04-17 17:07:02.259778','4','admin',2,'Edit user',4,4),(30,'2022-04-17 17:07:13.110870','4','admin',2,'Edit user',4,4),(31,'2022-04-17 17:07:32.772547','4','admin',2,'Edit user',4,4),(32,'2022-04-17 17:08:14.584313','4','admin',2,'Edit user',4,4),(33,'2022-04-17 17:08:22.683131','4','admin',2,'Edit user',4,4),(34,'2022-04-17 17:08:31.592270','4','admin',2,'Edit user',4,4),(35,'2022-04-17 17:09:45.499196','4','admin',2,'Edit user',4,4),(36,'2022-04-17 17:09:53.248446','4','admin',2,'Edit user',4,4),(37,'2022-04-17 17:12:38.484932','4','admin',2,'Edit user',4,4),(38,'2022-04-17 17:12:43.128404','4','admin',2,'Edit user',4,4),(39,'2022-04-17 17:12:52.232826','4','admin',2,'Edit user',4,4),(40,'2022-04-17 17:13:41.776846','4','admin',2,'Edit user',4,4),(41,'2022-04-17 17:23:14.234897','4','admin',2,'Edit user',4,4),(42,'2022-04-17 17:23:19.330691','4','admin',2,'Edit user',4,4),(43,'2022-04-17 17:23:26.689425','4','admin',2,'Edit user',4,4),(44,'2022-04-17 17:49:59.595732','None','aabb',3,'Delete user',4,4),(45,'2022-04-17 18:06:21.614314','None','eee',3,'Delete user',4,4),(46,'2022-04-17 18:06:25.320189','None','ssss',3,'Delete user',4,4),(47,'2022-04-17 18:59:46.761169','3','test',2,'Edit user',4,4),(48,'2022-04-17 18:59:58.050997','4','admin',2,'Edit user',4,4),(49,'2022-04-17 19:03:17.824130','4','admin',2,'Edit user',4,2),(50,'2022-04-17 19:07:45.769523','4','admin',2,'Edit user',4,2),(51,'2022-04-17 19:07:51.325052','4','admin',2,'Edit user',4,2),(52,'2022-04-17 19:08:16.851640','4','admin',2,'Edit user',4,2),(53,'2022-04-17 19:12:16.763325','4','admin',2,'Edit user',4,2),(54,'2022-04-17 19:12:24.860567','4','admin',2,'Edit user',4,2),(55,'2022-04-17 19:12:36.007332','5','abc',2,'Edit user',4,2),(56,'2022-04-17 19:13:32.861301','2','danht',2,'Edit user',4,2),(57,'2022-04-17 19:15:09.642258','2','danht',2,'Edit user',4,2),(58,'2022-04-17 19:15:18.194121','2','danht',2,'Edit user',4,2),(59,'2022-04-18 02:03:56.453778','4','admin',2,'Edit user',4,2),(60,'2022-04-18 02:04:20.587793','4','admin',2,'Edit user',4,2),(61,'2022-04-18 02:21:01.312492','4','admin',2,'Edit user',4,2),(62,'2022-04-18 02:46:22.663260','4','admin',2,'Edit user',4,2),(63,'2022-04-18 02:58:10.037946','2','danht',2,'Edit user',4,2),(64,'2022-04-18 03:09:56.233420','4','admin',2,'Edit user',4,2),(65,'2022-04-18 03:15:20.518575','4','admin',2,'Edit user',4,2),(66,'2022-04-18 03:16:30.593389','11','ddd',2,'Edit user',4,2),(67,'2022-04-18 03:18:51.439955','11','ddd',2,'Edit user',4,2),(68,'2022-04-18 03:19:42.541165','11','ddd',2,'Edit user',4,2),(69,'2022-04-18 03:20:07.718637','11','ddd',2,'Edit user',4,2),(70,'2022-04-18 04:36:41.408979','11','ddd',2,'Edit user',4,2),(71,'2022-04-18 04:36:47.630117','4','admin',2,'Edit user',4,2),(72,'2022-04-18 04:37:00.971592','4','admin',2,'Edit user',4,2),(73,'2022-04-18 04:38:46.832290','4','admin',2,'Edit user',4,2),(74,'2022-04-18 04:41:40.192069','5','abc',2,'Edit user',4,2),(75,'2022-04-18 04:41:50.506047','11','ddd',2,'Edit user',4,2),(76,'2022-04-18 04:52:47.792658','4','admin',2,'Edit user',4,2),(77,'2022-04-18 05:27:48.499435','2','danht',2,'Edit user',4,2),(78,'2022-04-18 05:34:09.148979','2','danht',2,'Edit user',4,2),(79,'2022-04-18 05:35:37.580826','2','danht',2,'Edit user',4,4),(80,'2022-04-18 05:36:14.965379','2','danht',2,'Edit user',4,4),(81,'2022-04-18 05:37:45.570558','15','aaaaa',1,'Add user',4,2),(82,'2022-04-18 05:39:28.104666','2','danht',2,'Edit user',4,4),(83,'2022-04-18 05:42:34.030201','2','danht',2,'Edit user',4,4),(84,'2022-04-18 05:44:29.316574','3','test',2,'Edit user',4,2),(85,'2022-04-18 05:56:22.323155','1','thuad',2,'Edit user',4,4),(86,'2022-04-18 05:56:29.278501','4','admin',2,'Edit user',4,4),(87,'2022-04-18 06:06:27.427037','4','admin',2,'Edit user',4,4),(88,'2022-04-18 06:07:41.568378','15','aaaaa',2,'Edit user',4,4),(89,'2022-04-18 06:07:59.882873','2','danht',2,'Edit user',4,4),(90,'2022-04-18 06:08:16.480161','2','danht',2,'Edit user',4,4),(91,'2022-04-18 06:08:52.039230','2','danht',2,'Edit user',4,4),(92,'2022-04-18 06:09:17.019691','2','danht',2,'Edit user',4,4);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-04-12 14:17:01.929471'),(2,'auth','0001_initial','2022-04-12 14:17:03.098861'),(3,'admin','0001_initial','2022-04-12 14:17:03.326576'),(4,'admin','0002_logentry_remove_auto_add','2022-04-12 14:17:03.338295'),(5,'admin','0003_logentry_add_action_flag_choices','2022-04-12 14:17:03.350377'),(6,'contenttypes','0002_remove_content_type_name','2022-04-12 14:17:03.501147'),(7,'auth','0002_alter_permission_name_max_length','2022-04-12 14:17:03.600361'),(8,'auth','0003_alter_user_email_max_length','2022-04-12 14:17:03.700514'),(9,'auth','0004_alter_user_username_opts','2022-04-12 14:17:03.712382'),(10,'auth','0005_alter_user_last_login_null','2022-04-12 14:17:03.820003'),(11,'auth','0006_require_contenttypes_0002','2022-04-12 14:17:03.827869'),(12,'auth','0007_alter_validators_add_error_messages','2022-04-12 14:17:03.841211'),(13,'auth','0008_alter_user_username_max_length','2022-04-12 14:17:04.153483'),(14,'auth','0009_alter_user_last_name_max_length','2022-04-12 14:17:04.298124'),(15,'auth','0010_alter_group_name_max_length','2022-04-12 14:17:04.404586'),(16,'auth','0011_update_proxy_permissions','2022-04-12 14:17:04.418391'),(17,'auth','0012_alter_user_first_name_max_length','2022-04-12 14:17:04.538725'),(18,'sessions','0001_initial','2022-04-12 14:17:04.723567');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('o49skeqdvx2sn390zwh6k18jw7ybfn0c','.eJxVjMsOwiAQRf-FtSFAGQZcuvcbCMNDqgaS0q6M_65NutDtPefcF_NhW6vfRl78nNiZKXb63SjER247SPfQbp3H3tZlJr4r_KCDX3vKz8vh_h3UMOq3pmRBWkCnweUiaFIlYTQTAhrQoMChVrmgo6SMyyhJChDOBEtFaKPY-wO9ajan:1ngKYd:UdZgivVPIqYLsS-B7Rkvroc6KWmPYkTaHNBmAKAnOFA','2022-05-02 06:08:19.666132'),('xe0ybp6s9v2o5kimkch5k9wwrrv5yqql','.eJxVjMsOwiAQRf-FtSG8YVy69xsIw4BUDU1KuzL-uzbpQrf3nHNfLKZtbXEbZYkTsTMz7PS7YcqP0ndA99RvM89zX5cJ-a7wgw5-nak8L4f7d9DSaN-6GidddqZKkb1yQWWPmiyAcErJAKiRfAENZAhVsRaELUaDBx2oYmbvD8DWNzU:1ngK2G:_VgAyjCnArL4bk-0uMwTMnbc1HmocAUSfvdhq0BQ3ao','2022-05-02 05:34:52.946833');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_table`
--

DROP TABLE IF EXISTS `system_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_table` (
  `idsystem_table` int NOT NULL,
  `system_language` varchar(2) COLLATE utf8_unicode_ci DEFAULT 'VN',
  PRIMARY KEY (`idsystem_table`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci COMMENT='to config';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_table`
--

LOCK TABLES `system_table` WRITE;
/*!40000 ALTER TABLE `system_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_table`
--

DROP TABLE IF EXISTS `user_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_table` (
  `iduser_table` int NOT NULL,
  `user_name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `user_fullname` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_birthday` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_address` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_password` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `user_permission` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_status` varchar(1) COLLATE utf8_unicode_ci DEFAULT '1',
  PRIMARY KEY (`iduser_table`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci COMMENT='table users';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_table`
--

LOCK TABLES `user_table` WRITE;
/*!40000 ALTER TABLE `user_table` DISABLE KEYS */;
INSERT INTO `user_table` VALUES (1,'admin','Administrator',' ',' ','123123','1','1');
/*!40000 ALTER TABLE `user_table` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-18 13:28:56
