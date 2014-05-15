-- MySQL dump 10.13  Distrib 5.5.8, for Win32 (x86)
--
-- Host: localhost    Database: db_for_bis_mb
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
INSERT INTO `alltypes` VALUES ('AE100',0.75,1.4,23,27,6.2,18.4,24.2),('AE130',1.1,1.2,32,20,8.6,25.6,33.6),('AE50',0.37,1,13,16,3.7,10.4,14.3);
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
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add site',6,'add_site'),(17,'Can change site',6,'change_site'),(18,'Can delete site',6,'delete_site'),(19,'Can add log entry',7,'add_logentry'),(20,'Can change log entry',7,'change_logentry'),(21,'Can delete log entry',7,'delete_logentry'),(22,'Can add alltypes',8,'add_alltypes'),(23,'Can change alltypes',8,'change_alltypes'),(24,'Can delete alltypes',8,'delete_alltypes'),(25,'Can add observed values',9,'add_observedvalues'),(26,'Can change observed values',9,'change_observedvalues'),(27,'Can delete observed values',9,'delete_observedvalues'),(28,'Can add production',10,'add_production'),(29,'Can change production',10,'change_production'),(30,'Can delete production',10,'delete_production');
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
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$10000$52HMm4xta8zZ$3IyHSNYSt2Hsw4P0Fs2e9wkbtdPHGUlJ7dNwE8MZjVY=','2014-04-29 09:08:32',1,'bala','','','balasundaram29@rediffmail.com',1,1,'2014-04-03 11:51:48');
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2014-04-07 11:40:41',1,9,'3','AE50 on 13/12/13',2,'No fields changed.'),(2,'2014-04-07 11:50:09',1,9,'18','AE130 on 07/04/14',1,''),(3,'2014-04-07 11:52:41',1,9,'18','AE130 on 07/04/14',3,''),(4,'2014-04-19 09:42:34',1,10,'52','Production object',1,''),(5,'2014-04-19 10:09:36',1,10,'53','AE50 on 01/04/14',1,''),(6,'2014-04-19 10:11:41',1,10,'53','AE50 on 01/04/145',2,'Changed quantity.'),(7,'2014-04-19 10:13:25',1,10,'54','AE50 on 07/04/14 : 20  Nos',1,''),(8,'2014-04-19 10:14:01',1,10,'55','AE50 on 17/04/14 : 4  Nos',1,''),(9,'2014-04-29 09:09:51',1,10,'56','AE100 on 01/04/14 : 8  Nos',1,''),(10,'2014-04-29 09:10:09',1,10,'57','AE100 on 17/04/14 : 4  Nos',1,''),(11,'2014-04-29 09:10:37',1,10,'58','AE100 on 23/04/14 : 7  Nos',1,''),(12,'2014-04-29 09:11:35',1,10,'59','AE50 on 23/04/14 : 6  Nos',1,'');
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
INSERT INTO `django_content_type` VALUES (1,'permission','auth','permission'),(2,'group','auth','group'),(3,'user','auth','user'),(4,'content type','contenttypes','contenttype'),(5,'session','sessions','session'),(6,'site','sites','site'),(7,'log entry','admin','logentry'),(8,'alltypes','prodn','alltypes'),(9,'observed values','prodn','observedvalues'),(10,'production','prodn','production');
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
INSERT INTO `django_session` VALUES ('8hrg4ud707xe0hu1lxorqgfttolujkpc','NzJiNWJlM2QxYmNmMzQ4MzVlNWY0ZGI4NDljMmVhZTdhZGQxZDAwYTp7InRlc3Rjb29raWUiOiJ3b3JrZWQifQ==','2014-04-17 12:06:08'),('frcowm80sesdnc0qcn0pdh0op5z61o9b','ZTQwODFjNmQxZTU4OThlM2M3Yjk3MjVmODlmZmMzOGRmMTUxM2M5ZTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-05-13 07:13:41'),('h287gkwz93qn5mrqxg52oqv9bwmegyxm','ZTQwODFjNmQxZTU4OThlM2M3Yjk3MjVmODlmZmMzOGRmMTUxM2M5ZTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-05-03 09:41:18'),('idrreu9546thzxdrj7f7g7r9stkgox45','ZTQwODFjNmQxZTU4OThlM2M3Yjk3MjVmODlmZmMzOGRmMTUxM2M5ZTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-05-03 10:08:34'),('r82jk9nxa8ki4sdy212hq5ejukk6ruih','ZTQwODFjNmQxZTU4OThlM2M3Yjk3MjVmODlmZmMzOGRmMTUxM2M5ZTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-04-21 11:32:58'),('s1nyn0a2x0t8wld54hf2ho7j3hqwjldc','ZTQwODFjNmQxZTU4OThlM2M3Yjk3MjVmODlmZmMzOGRmMTUxM2M5ZTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2014-05-03 06:48:17'),('zo1p1u0oegtufoyk7ve0bzh9g3q7p58e','YTdkM2YxYzMxOTZiNTYzY2Y4YjhiNzkzOGRiYzFkZDM1ZWMyZTE4MTp7fQ==','2014-05-13 09:13:38');
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
INSERT INTO `observed_values` VALUES (1,3065,'2013-12-13','AE50',1.2,15.58,30.35,2.75),(2,3071,'2013-12-13','AE100',1.54,25.34,28.45,5.6),(3,3090,'2013-12-13','AE50',1.19,15.43,28.94,2.72),(4,3105,'2014-01-06','AE130',1.32,35.28,24.86,7.4),(5,3129,'2014-01-08','AE50',1.17,15.21,30.29,2.68),(6,3139,'2014-01-10','AE100',1.57,25.77,30.8,5.89),(7,3151,'2014-01-17','AE50',1.15,14.93,27.37,2.58),(8,3171,'2014-01-25','AE50',1.19,15.48,27.59,2.7),(9,3187,'2014-02-01','AE130',1.37,36.47,27.42,7.66),(10,3192,'2014-02-15','AE50',1.19,15.5,30.05,2.72),(11,3195,'2014-01-31','AE100',1.56,25.59,30.34,5.9),(12,3212,'2014-02-20','AE50',1.2,15.62,28.94,2.79),(13,3247,'2014-02-28','AE50',1.2,15.65,29.64,2.7),(14,3269,'2014-03-08','AE50',1.2,15.63,31.02,2.71),(15,3289,'2014-03-12','AE50',1.2,15.56,27.48,2.71),(16,3303,'2014-03-15','AE100',1.54,25.24,29.23,5.8),(17,3313,'2014-03-20','AE50',1.19,15.48,30.39,2.6),(18,3341,'2014-04-07','AE50',1.2,15.55,32.93,2.71),(19,3365,'2014-04-23','AE50',1.2,15.57,30.82,2.7);
/*!40000 ALTER TABLE `observed_values` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `production`
--

LOCK TABLES `production` WRITE;
/*!40000 ALTER TABLE `production` DISABLE KEYS */;
INSERT INTO `production` VALUES (1,'AE100','2013-12-13',5,NULL),(2,'AE130','2014-01-06',1,NULL),(3,'AE130','2014-01-07',2,NULL),(4,'AE130','2014-01-08',1,NULL),(5,'AE100','2014-01-06',5,NULL),(6,'AE100','2014-01-07',4,NULL),(7,'AE100','2014-01-08',6,NULL),(8,'AE100','2014-01-10',2,NULL),(9,'AE50','2013-12-13',5,NULL),(10,'AE50','2013-12-17',5,NULL),(11,'AE50','2013-12-24',2,NULL),(12,'AE50','2013-12-27',12,NULL),(15,'AE50','2014-01-06',4,NULL),(16,'AE50','2014-01-07',4,NULL),(22,'AE100','2014-01-25',3,NULL),(23,'AE100','2014-01-27',7,NULL),(24,'AE100','2014-01-31',10,NULL),(25,'AE50','2014-01-04',2,NULL),(28,'AE50','2014-01-08',14,NULL),(29,'AE50','2014-01-10',2,NULL),(30,'AE50','2014-01-17',12,NULL),(31,'AE50','2014-01-21',14,NULL),(32,'AE50','2014-01-25',10,NULL),(33,'AE50','2014-02-01',10,NULL),(34,'AE50','2014-02-15',5,NULL),(35,'AE50','2014-02-18',2,NULL),(36,'AE50','2014-02-19',10,NULL),(37,'AE50','2014-02-20',10,NULL),(38,'AE50','2014-02-22',4,NULL),(39,'AE50','2014-02-24',4,NULL),(40,'AE50','2014-02-28',10,NULL),(41,'AE50','2014-03-03',11,NULL),(42,'AE50','2014-03-04',2,NULL),(43,'AE50','2014-03-07',6,NULL),(44,'AE50','2014-03-08',12,NULL),(45,'AE50','2014-03-12',15,NULL),(46,'AE50','2014-03-15',6,NULL),(47,'AE50','2014-03-20',12,NULL),(48,'AE100','2014-02-20',15,NULL),(49,'AE100','2014-02-28',2,NULL),(50,'AE100','2014-03-15',4,NULL),(51,'AE130','2014-02-01',1,NULL),(52,'AE50','2014-03-28',5,''),(53,'AE50','2014-04-01',5,''),(54,'AE50','2014-04-07',20,''),(55,'AE50','2014-04-17',4,''),(56,'AE100','2014-04-01',8,''),(57,'AE100','2014-04-17',4,''),(58,'AE100','2014-04-23',7,''),(59,'AE50','2014-04-23',6,'');
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

-- Dump completed on 2014-05-15 11:46:33
