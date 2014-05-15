-- MySQL dump 10.13  Distrib 5.5.8, for Win32 (x86)
--
-- Host: localhost    Database: db_for_bis_sub
-- ------------------------------------------------------
-- Server version	5.5.8

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alltypes`
--

DROP TABLE IF EXISTS `alltypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alltypes` (
  `type` varchar(20) NOT NULL,
  `kw` float NOT NULL,
  `rdisch` float NOT NULL,
  `rhead` float DEFAULT NULL,
  `oaeff` float DEFAULT NULL,
  `maxcurrent` float DEFAULT NULL,
  `hrangel` float DEFAULT NULL,
  `hrangeh` float DEFAULT NULL,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alltypes`
--

LOCK TABLES `alltypes` WRITE;
/*!40000 ALTER TABLE `alltypes` DISABLE KEYS */;
INSERT INTO `alltypes` VALUES ('ATS0425',0.37,1,12,13,6,10.2,12.6),('ATS0525',0.55,1.4,18,17,8,15,19),('ATS1025',0.75,1.3,22,18,11,18.7,23.1),('ATS1540',1.1,2.5,26,23,14,22.1,27.3),('ATS2050',1.5,5,22,33,19,18.7,23.1);
/*!40000 ALTER TABLE `alltypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_5f412f9a` (`group_id`),
  KEY `auth_group_permissions_83d7f98b` (`permission_id`),
  CONSTRAINT `group_id_refs_id_f4b32aac` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `permission_id_refs_id_6ba0f519` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_37ef4eb4` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_d043b34a` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add site',6,'add_site'),(17,'Can change site',6,'change_site'),(18,'Can delete site',6,'delete_site'),(19,'Can add log entry',7,'add_logentry'),(20,'Can change log entry',7,'change_logentry'),(21,'Can delete log entry',7,'delete_logentry'),(22,'Can add alltypes',8,'add_alltypes'),(23,'Can change alltypes',8,'change_alltypes'),(24,'Can delete alltypes',8,'delete_alltypes'),(25,'Can add production',9,'add_production'),(26,'Can change production',9,'change_production'),(27,'Can delete production',9,'delete_production'),(28,'Can add observed values',10,'add_observedvalues'),(29,'Can change observed values',10,'change_observedvalues'),(30,'Can delete observed values',10,'delete_observedvalues');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$10000$HODnfvNYdird$4Eulfve8ZRWJACs6J56YHTCVUe3R/6/v8x07FRAhm1I=','2014-05-06 10:41:38',1,'bala','','','balasundaram29@rediffmail.com',1,1,'2014-04-01 14:12:10');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_6340c63c` (`user_id`),
  KEY `auth_user_groups_5f412f9a` (`group_id`),
  CONSTRAINT `group_id_refs_id_274b862c` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `user_id_refs_id_40c41112` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_6340c63c` (`user_id`),
  KEY `auth_user_user_permissions_83d7f98b` (`permission_id`),
  CONSTRAINT `permission_id_refs_id_35d9ac25` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `user_id_refs_id_4dc23c39` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_6340c63c` (`user_id`),
  KEY `django_admin_log_37ef4eb4` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_93d2d1f8` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `user_id_refs_id_c0d12874` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2014-04-02 07:05:46',1,9,'18','ATS1025 on 31/01/14',1,''),(2,'2014-04-02 07:07:27',1,9,'18','ATS1025 on 31/01/14',2,'Changed quantity.'),(3,'2014-04-02 07:08:30',1,9,'18','ATS1025 on 31/01/14',2,'Changed quantity.'),(4,'2014-04-02 07:09:45',1,9,'19','ATS1025 on 15/02/14',1,''),(5,'2014-04-02 07:13:48',1,9,'20','ATS1025 on 19/02/14 : 6 Nos',1,''),(6,'2014-04-02 07:14:35',1,9,'21','ATS1025 on 20/02/14 : 5 Nos',1,''),(7,'2014-04-02 07:15:28',1,9,'22','ATS1025 on 20/02/14 : 25 Nos',1,''),(8,'2014-04-02 07:15:36',1,9,'22','ATS1025 on 20/02/14 : 25 Nos',2,'No fields changed.'),(9,'2014-04-02 07:16:12',1,9,'23','ATS1025 on 22/02/14 : 4 Nos',1,''),(10,'2014-04-02 07:17:11',1,9,'24','ATS1025 on 26/03/14 : 10 Nos',1,''),(11,'2014-04-02 07:18:17',1,9,'24','ATS1025 on 26/02/14 : 10 Nos',2,'Changed date.'),(12,'2014-04-02 07:19:31',1,9,'25','ATS1025 on 27/02/14 : 25 Nos',1,''),(13,'2014-04-02 07:20:30',1,9,'26','ATS1025 on 28/02/14 : 25 Nos',1,''),(14,'2014-04-02 07:21:20',1,9,'27','ATS1025 on 03/03/14 : 10 Nos',1,''),(15,'2014-04-02 07:21:42',1,9,'28','ATS1025 on 06/03/14 : 2 Nos',1,''),(16,'2014-04-02 07:22:36',1,9,'29','ATS1025 on 08/03/14 : 23 Nos',1,''),(17,'2014-04-02 07:23:34',1,9,'30','ATS1025 on 12/03/14 : 15 Nos',1,''),(18,'2014-04-02 07:23:50',1,9,'31','ATS1025 on 17/03/14 : 1 Nos',1,''),(19,'2014-04-02 09:20:53',1,9,'21','ATS1025 on 20/02/14 : 5 Nos',3,''),(20,'2014-04-02 09:24:00',1,9,'32','ATS0425 on 15/02/14 : 4 Nos',1,''),(21,'2014-04-02 09:24:28',1,9,'33','ATS0425 on 20/02/14 : 8 Nos',1,''),(22,'2014-04-02 09:25:04',1,9,'33','ATS0425 on 20/02/14 : 9 Nos',2,'Changed quantity.'),(23,'2014-04-02 09:25:24',1,9,'34','ATS0425 on 04/03/14 : 2 Nos',1,''),(24,'2014-04-02 09:26:39',1,9,'3','ATS0425 on 18/01/14 : 8 Nos',2,'Changed date.'),(25,'2014-04-02 09:27:35',1,9,'35','ATS2050 on 01/02/14 : 4 Nos',1,''),(26,'2014-04-02 09:28:00',1,9,'36','ATS2050 on 18/03/14 : 2 Nos',1,''),(27,'2014-04-02 09:30:10',1,9,'37','ATS0525 on 25/01/14 : 3 Nos',1,''),(28,'2014-04-02 09:30:35',1,9,'38','ATS0525 on 05/03/14 : 3 Nos',1,''),(29,'2014-04-02 09:32:01',1,9,'39','ATS1540 on 14/02/14 : 1 Nos',1,''),(30,'2014-04-02 09:32:32',1,9,'40','ATS1540 on 20/02/14 : 9 Nos',1,''),(31,'2014-04-19 11:18:32',1,9,'41','ATS1025 on 25/03/14 : 3 Nos',1,''),(32,'2014-04-19 11:19:04',1,9,'42','ATS1025 on 27/03/14 : 25 Nos',1,''),(33,'2014-04-19 11:22:01',1,9,'43','ATS1025 on 28/03/14 : 25 Nos',1,''),(34,'2014-04-19 11:23:48',1,9,'44','ATS1025 on 07/04/14 : 21 Nos',1,''),(35,'2014-04-19 11:24:25',1,9,'44','ATS1025 on 02/04/14 : 21 Nos',2,'Changed date.'),(36,'2014-04-19 11:25:17',1,9,'45','ATS1025 on 05/04/14 : 5 Nos',1,''),(37,'2014-04-19 11:26:04',1,9,'46','ATS1025 on 07/04/14 : 20 Nos',1,''),(38,'2014-04-19 11:26:28',1,9,'47','ATS1025 on 09/04/14 : 39 Nos',1,''),(39,'2014-04-19 11:26:44',1,9,'48','ATS1025 on 10/04/14 : 1 Nos',1,''),(40,'2014-04-19 11:27:05',1,9,'49','ATS1025 on 16/04/14 : 10 Nos',1,''),(41,'2014-04-19 11:27:26',1,9,'50','ATS1025 on 17/04/14 : 20 Nos',1,''),(42,'2014-04-19 11:31:22',1,9,'51','ATS0425 on 26/03/14 : 10 Nos',1,''),(43,'2014-04-19 11:31:47',1,9,'52','ATS0425 on 12/04/14 : 1 Nos',1,''),(44,'2014-04-19 11:33:01',1,9,'53','ATS0525 on 28/03/14 : 10 Nos',1,''),(45,'2014-04-29 08:59:48',1,9,'54','ATS1025 on 23/04/14 : 30 Nos',1,''),(46,'2014-04-29 09:01:57',1,9,'55','ATS0425 on 28/04/14 : 5 Nos',1,''),(47,'2014-05-06 10:46:10',1,9,'56','ATS1025 on 05/05/14 : 31 Nos',1,'');
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'permission','auth','permission'),(2,'group','auth','group'),(3,'user','auth','user'),(4,'content type','contenttypes','contenttype'),(5,'session','sessions','session'),(6,'site','sites','site'),(7,'log entry','admin','logentry'),(8,'alltypes','prodn','alltypes'),(9,'production','prodn','production'),(10,'observed values','prodn','observedvalues');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_b7b81f0c` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('22s8n60qpv93qkm9c54i4nt7gjla4iuu','ZDkxYzU0YWUyYTdjN2M0OTU1ODg3MDkzMzQ2YjkyZThhOGRhZDI3Yjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-05-13 08:58:02'),('39july3dojf8wboefd587wik6xof2wiz','ZDkxYzU0YWUyYTdjN2M0OTU1ODg3MDkzMzQ2YjkyZThhOGRhZDI3Yjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-05-03 08:52:35'),('3inpsyik78kxxocli0i2lx0flv5m174e','ZDkxYzU0YWUyYTdjN2M0OTU1ODg3MDkzMzQ2YjkyZThhOGRhZDI3Yjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-05-13 06:48:00'),('6hpbb2djjbw1kmhhbolij5dcl3efs8rk','ZDkxYzU0YWUyYTdjN2M0OTU1ODg3MDkzMzQ2YjkyZThhOGRhZDI3Yjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-05-03 06:52:54'),('8vcop8raspxll4wkmjf9crcczl118eic','ZDkxYzU0YWUyYTdjN2M0OTU1ODg3MDkzMzQ2YjkyZThhOGRhZDI3Yjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-04-15 14:12:47'),('d2urm4qq5obzuduu8ei11azdfdm8kpbd','MGJlNmI4YjBlMDdiMDdmZDBmODI3ODdiY2JkYWU0YjkxYjc2NTRhNzp7fQ==','2014-04-17 10:56:18'),('ewbzl5o6hwuwad2jrv7r970nbik9dpn1','ZDkxYzU0YWUyYTdjN2M0OTU1ODg3MDkzMzQ2YjkyZThhOGRhZDI3Yjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-04-21 11:58:43'),('f7xx4numlrjprvirzlui4reau9zdp0ck','ZDkxYzU0YWUyYTdjN2M0OTU1ODg3MDkzMzQ2YjkyZThhOGRhZDI3Yjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-05-03 10:50:46'),('lkk1myixvjtaith4cl5ducs5fnx7hwev','MGJlNmI4YjBlMDdiMDdmZDBmODI3ODdiY2JkYWU0YjkxYjc2NTRhNzp7fQ==','2014-04-16 12:19:33'),('mo6bo7vrb49qs69b51bps8d2s5t6o8lk','ZDkxYzU0YWUyYTdjN2M0OTU1ODg3MDkzMzQ2YjkyZThhOGRhZDI3Yjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-05-03 11:17:44'),('wgw5bth6liaqz5st7s4pc0dq6gaullqw','MGJlNmI4YjBlMDdiMDdmZDBmODI3ODdiY2JkYWU0YjkxYjc2NTRhNzp7fQ==','2014-05-20 10:47:09');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `observed_values`
--

DROP TABLE IF EXISTS `observed_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `observed_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sno` int(11) NOT NULL,
  `date` date NOT NULL,
  `at_type` varchar(20) NOT NULL,
  `rdisch` float NOT NULL,
  `rhead` float NOT NULL,
  `oaeff` float NOT NULL,
  `maxcurrent` float NOT NULL,
  PRIMARY KEY (`sno`,`date`),
  UNIQUE KEY `id` (`id`),
  KEY `at_type` (`at_type`),
  CONSTRAINT `observed_values_ibfk_1` FOREIGN KEY (`at_type`) REFERENCES `alltypes` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `observed_values`
--

LOCK TABLES `observed_values` WRITE;
/*!40000 ALTER TABLE `observed_values` DISABLE KEYS */;
INSERT INTO `observed_values` VALUES (1,6461,'2013-12-13','ATS1025',1.52,25.78,22.98,8.01),(2,6466,'2013-12-17','ATS0525',1.58,20.28,22.24,6.75),(3,6470,'2013-12-17','ATS0425',1.3,15.62,20.28,4.62),(4,6476,'2014-01-06','ATS0525',1.6,20.55,22.35,6.76),(5,6479,'2014-01-07','ATS0425',1.35,16.15,23.42,4.21),(6,6481,'2014-01-08','ATS1025',1.52,25.64,22.63,7.47),(7,6490,'2014-01-08','ATS1540',2.7,28.1,28.18,12.84),(8,6501,'2014-01-09','ATS2050',5.31,23.36,38.03,16.24),(9,6528,'2014-03-18','ATS2050',5.32,23.41,37.78,16.42),(10,6565,'2014-02-20','ATS1025',1.52,25.78,22.71,7.92),(11,6674,'2014-02-28','ATS1025',1.55,26.25,22.7,8.43),(12,6706,'2014-03-04','ATS0425',1.34,16.07,22.34,4.4),(13,6708,'2014-03-05','ATS0525',1.6,20.58,21.86,6.82),(14,6729,'2014-03-08','ATS1025',1.59,26.95,26.17,8),(15,6793,'2014-03-28','ATS1025',1.54,26.13,23.25,8.02),(16,6853,'2014-04-07','ATS1025',1.53,25.97,23.53,8.23),(17,6903,'2014-04-09','ATS1025',1.52,25.8,22.64,7.71),(18,6911,'2014-04-12','ATS0425',1.3,15.64,21,4.43),(19,6956,'2014-04-23','ATS1025',1.51,25.63,22.47,8.03);
/*!40000 ALTER TABLE `observed_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prodn_alltypes`
--

DROP TABLE IF EXISTS `prodn_alltypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prodn_alltypes` (
  `type` varchar(20) NOT NULL,
  `kw` double NOT NULL,
  `rdisch` double NOT NULL,
  `rhead` double DEFAULT NULL,
  `oaeff` double DEFAULT NULL,
  `maxcurrent` double DEFAULT NULL,
  `hrangel` double DEFAULT NULL,
  `hrangeh` double DEFAULT NULL,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prodn_alltypes`
--

LOCK TABLES `prodn_alltypes` WRITE;
/*!40000 ALTER TABLE `prodn_alltypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `prodn_alltypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `production`
--

DROP TABLE IF EXISTS `production`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `production` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `at_type` varchar(20) NOT NULL,
  `date` date NOT NULL,
  `quantity` int(11) NOT NULL,
  `remarks` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `at_type` (`at_type`),
  CONSTRAINT `production_ibfk_1` FOREIGN KEY (`at_type`) REFERENCES `alltypes` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `production`
--

LOCK TABLES `production` WRITE;
/*!40000 ALTER TABLE `production` DISABLE KEYS */;
INSERT INTO `production` VALUES (1,'ATS0425','2013-12-17',2,NULL),(2,'ATS0425','2014-01-07',2,NULL),(3,'ATS0425','2014-01-18',8,''),(4,'ATS0525','2013-12-17',4,NULL),(5,'ATS0525','2014-01-06',2,NULL),(6,'ATS0525','2014-01-08',2,NULL),(7,'ATS0525','2014-01-09',4,NULL),(8,'ATS1025','2013-12-13',5,NULL),(9,'ATS1025','2013-12-27',4,NULL),(10,'ATS1025','2014-01-07',2,NULL),(11,'ATS1025','2014-01-08',12,NULL),(12,'ATS1025','2014-01-10',2,NULL),(13,'ATS1025','2014-01-17',2,NULL),(14,'ATS1025','2014-01-21',2,NULL),(15,'ATS1540','2014-01-08',1,NULL),(17,'ATS2050','2014-01-09',1,NULL),(18,'ATS1025','2014-01-31',5,''),(19,'ATS1025','2014-02-15',4,''),(20,'ATS1025','2014-02-19',6,''),(22,'ATS1025','2014-02-20',25,''),(23,'ATS1025','2014-02-22',4,''),(24,'ATS1025','2014-02-26',10,''),(25,'ATS1025','2014-02-27',25,''),(26,'ATS1025','2014-02-28',25,''),(27,'ATS1025','2014-03-03',10,''),(28,'ATS1025','2014-03-06',2,''),(29,'ATS1025','2014-03-08',23,''),(30,'ATS1025','2014-03-12',15,''),(31,'ATS1025','2014-03-17',1,''),(32,'ATS0425','2014-02-15',4,''),(33,'ATS0425','2014-02-20',9,''),(34,'ATS0425','2014-03-04',2,''),(35,'ATS2050','2014-02-01',4,''),(36,'ATS2050','2014-03-18',2,''),(37,'ATS0525','2014-01-25',3,''),(38,'ATS0525','2014-03-05',3,''),(39,'ATS1540','2014-02-14',1,''),(40,'ATS1540','2014-02-20',9,''),(41,'ATS1025','2014-03-25',3,''),(42,'ATS1025','2014-03-27',25,''),(43,'ATS1025','2014-03-28',25,''),(44,'ATS1025','2014-04-02',21,''),(45,'ATS1025','2014-04-05',5,''),(46,'ATS1025','2014-04-07',20,''),(47,'ATS1025','2014-04-09',39,''),(48,'ATS1025','2014-04-10',1,''),(49,'ATS1025','2014-04-16',10,''),(50,'ATS1025','2014-04-17',20,''),(51,'ATS0425','2014-03-26',10,''),(52,'ATS0425','2014-04-12',1,''),(53,'ATS0525','2014-03-28',10,''),(54,'ATS1025','2014-04-23',30,''),(55,'ATS0425','2014-04-28',5,''),(56,'ATS1025','2014-05-05',31,'');
/*!40000 ALTER TABLE `production` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-05-15 11:46:57
