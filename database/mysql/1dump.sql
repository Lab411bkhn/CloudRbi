-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: anhvu2611$default
-- ------------------------------------------------------
-- Server version	5.7.17-log

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
-- Table structure for table `api_component_type`
--

DROP TABLE IF EXISTS `api_component_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_component_type` (
  `APIComponentTypeID` bigint(20) NOT NULL,
  `APIComponentTypeName` varchar(50) DEFAULT NULL,
  `GFFSmall` double DEFAULT NULL,
  `GFFMedium` double DEFAULT NULL,
  `GFFLarge` double DEFAULT NULL,
  `GFFRupture` double DEFAULT NULL,
  `GFFTotal` double DEFAULT NULL,
  `HoleCostSmall` double DEFAULT NULL,
  `HoleCostMedium` double DEFAULT NULL,
  `HoleCostLarge` double DEFAULT NULL,
  `HoleCostRupture` double DEFAULT NULL,
  `OutageSmall` double DEFAULT NULL,
  `OutageMedium` double DEFAULT NULL,
  `OutageLarge` double DEFAULT NULL,
  `OutageRupture` double DEFAULT NULL,
  PRIMARY KEY (`APIComponentTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_component_type`
--

LOCK TABLES `api_component_type` WRITE;
/*!40000 ALTER TABLE `api_component_type` DISABLE KEYS */;
INSERT INTO `api_component_type` VALUES (1,'COLBTM',0.000008,0.00002,0.000002,0.0000006,0.0000306,10000,25000,50000,100000,2,4,5,21),(2,'COLMID',0.000008,0.00002,0.000002,0.0000006,0.0000306,10000,25000,50000,100000,2,4,5,21),(3,'COLTOP',0.000008,0.00002,0.000002,0.0000006,0.0000306,10000,25000,50000,100000,2,4,5,21),(4,'COMPC',0.000008,0.00002,0.000002,0,0.00003,10000,20000,100000,300000,2,3,7,14),(5,'COMPR',0.000008,0.00002,0.000002,0.0000006,0.0000306,5000,10000,50000,100000,2,3,7,14),(6,'COURSE-1',0.00007,0.000025,0.000005,0.0000001,0.0001,5000,12000,20000,40000,2,3,3,7),(7,'COURSE-10',0.00007,0.000025,0.000005,0.0000001,0.0001,5000,12000,20000,40000,2,3,3,7),(8,'COURSE-2',0.00007,0.000025,0.000005,0.0000001,0.0001,5000,12000,20000,40000,2,3,3,7),(9,'COURSE-3',0.00007,0.000025,0.000005,0.0000001,0.0001,5000,12000,20000,40000,2,3,3,7),(10,'COURSE-4',0.00007,0.000025,0.000005,0.0000001,0.0001,5000,12000,20000,40000,2,3,3,7),(11,'COURSE-5',0.00007,0.000025,0.000005,0.0000001,0.0001,5000,12000,20000,40000,2,3,3,7),(12,'COURSE-6',0.00007,0.000025,0.000005,0.0000001,0.0001,5000,12000,20000,40000,2,3,3,7),(13,'COURSE-7',0.00007,0.000025,0.000005,0.0000001,0.0001,5000,12000,20000,40000,2,3,3,7),(14,'COURSE-8',0.00007,0.000025,0.000005,0.0000001,0.0001,5000,12000,20000,40000,2,3,3,7),(15,'COURSE-9',0.00007,0.000025,0.000005,0.0000001,0.0001,5000,12000,20000,40000,2,3,3,7),(16,'DRUM',0.000008,0.00002,0.000002,0.0000006,0.0000306,5000,12000,20000,40000,2,3,3,7),(17,'FILTER',0.000008,0.00002,0.000002,0.0000006,0.0000306,1000,2000,4000,10000,0,1,1,1),(18,'FINFAN',0.000008,0.00002,0.000002,0.0000006,0.0000306,1000,2000,20000,60000,0,0,0,0),(19,'HEXSS',0.000008,0.00002,0.000002,0.0000006,0.0000306,1000,2000,20000,60000,0,0,0,0),(20,'HEXTS',0.000008,0.00002,0.000002,0.0000006,0.0000306,1000,2000,20000,60000,0,0,0,0),(21,'HEXTUBE',0.000008,0.00002,0.000002,0.0000006,0.0000306,1000,2000,20000,60000,0,0,0,0),(22,'KODRUM',0.000008,0.00002,0.000002,0.0000006,0.0000306,5000,12000,20000,40000,2,3,3,7),(23,'PIPE-1',0.000028,0,0,0.0000026,0.0000306,5,0,0,20,0,0,0,1),(24,'PIPE-10',0.000008,0.00002,0.000002,0.0000006,0.0000306,5,40,80,240,0,2,3,4),(25,'PIPE-12',0.000008,0.00002,0.000002,0.0000006,0.0000306,5,60,120,360,0,3,4,4),(26,'PIPE-16',0.000008,0.00002,0.000002,0.0000006,0.0000306,5,80,160,500,0,3,4,5),(27,'PIPE-2',0.000028,0,0,0.0000026,0.0000306,5,0,0,40,0,0,0,1),(28,'PIPE-4',0.000008,0.00002,0,0.0000026,0.0000306,5,10,0,60,0,1,0,2),(29,'PIPE-6',0.000008,0.00002,0,0.0000026,0.0000306,5,20,0,120,0,1,2,3),(30,'PIPE-8',0.000008,0.00002,0.000002,0.0000006,0.0000306,5,30,60,180,0,2,3,3),(31,'PIPEGT16',0.000008,0.00002,0.000002,0.0000006,0.0000306,10,120,240,700,1,4,5,7),(32,'PUMP1S',0.000008,0.00002,0.000002,0.0000006,0.0000306,1000,2500,5000,5000,0,0,0,0),(33,'PUMP2S',0.000008,0.00002,0.000002,0.0000006,0.0000306,1000,2500,5000,5000,0,0,0,0),(34,'PUMPR',0.000008,0.00002,0.000002,0.0000006,0.0000306,1000,2500,5000,10000,0,0,0,0),(35,'REACTOR',0.000008,0.00002,0.000002,0.0000006,0.0000306,10000,24000,40000,80000,4,6,6,14),(36,'TANKBOTTOM',0.00072,0,0,0.000002,0.000722,5000,0,0,120000,5,0,0,50),(37,'OTHER',0.000008,0.00002,0.000002,0.0000006,0.0000306,10000,25000,50000,100000,2,4,5,21),(38,'TANKROOFFIXED',0.00007,0.000025,0.000005,0.0000001,0.0001,5000,12000,20000,40000,2,3,3,7),(39,'TANKROOFFLOAT',0.00072,0,0,0.000002,0.000722,5000,0,0,120000,5,0,0,50);
/*!40000 ALTER TABLE `api_component_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` bigint(20) NOT NULL,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `id` bigint(20) NOT NULL,
  `group_id` bigint(20) DEFAULT NULL,
  `permission_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `auth_group_permissions_auth_group_permissio_permission_id_84c5c` (`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm_auth_g` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `content_type_id` bigint(20) DEFAULT NULL,
  `codename` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` bigint(20) NOT NULL,
  `password` varchar(128) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` bigint(20) DEFAULT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(150) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `is_staff` bigint(20) DEFAULT NULL,
  `is_active` bigint(20) DEFAULT NULL,
  `date_joined` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$100000$gqKSpQPaMBAx$gUdV6YCJbGb6MusnlDYOTav6TppevDxEf0Puyw1VHGw=','2018-01-24 10:47:58',1,'vuna','','','anhvu01011994@gmail.com',1,1,'2017-12-19 08:50:49');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `group_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id_auth_user_g` (`group_id`),
  KEY `auth_user_groups_auth_user_groups_group_id_97559544_fk_auth_gro` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `permission_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `auth_user_user_permissions_auth_user_user_permi_permission_id_1` (`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm_auth_u` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `component_master`
--

DROP TABLE IF EXISTS `component_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `component_master` (
  `ComponentID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ComponentNumber` varchar(100) DEFAULT NULL,
  `EquipmentID` bigint(20) DEFAULT NULL,
  `ComponentTypeID` bigint(20) DEFAULT NULL,
  `ComponentName` varchar(150) DEFAULT NULL,
  `ComponentDesc` varchar(250) DEFAULT NULL,
  `IsEquipmentLinked` bigint(20) DEFAULT NULL,
  `APIComponentTypeID` bigint(20) DEFAULT NULL,
  `Create` datetime DEFAULT NULL,
  PRIMARY KEY (`ComponentID`),
  KEY `component_master_component_equipment` (`EquipmentID`),
  KEY `component_apicomponent_component_master` (`ComponentTypeID`),
  KEY `component_master_component_APIcomponent` (`ComponentTypeID`),
  KEY `component_equipment_component_master` (`EquipmentID`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `component_master`
--

LOCK TABLES `component_master` WRITE;
/*!40000 ALTER TABLE `component_master` DISABLE KEYS */;
INSERT INTO `component_master` VALUES (1,'N01',1,1,'vuna','1',1,1,'2018-03-15 14:11:39'),(2,'Component 2',2,4,'component vuna','hello this is test',0,2,'2018-03-15 14:11:39'),(3,'vuna',1,1,'VUNA','cdvfdvf',1,1,'2018-03-15 14:11:39'),(4,'vuna2',1,1,'222','1111',1,7,'2018-03-15 14:11:39'),(6,'vuna test 3',8,15,'vuna component name','aaaa',0,38,'2018-03-15 14:11:39'),(7,'vuna261',1,1,'vu test','fffff',1,16,'2018-03-15 14:11:39'),(8,'BTM_DEMO1',2,12,'tank bottom demo','demo tank proposal',1,36,'2018-03-15 14:11:39'),(9,'SHELL_DM1',2,8,'demo shell','this is data for shell demo',1,6,'2018-03-15 14:11:39'),(11,'COMPONENT_POSTGRES',10,12,'POSTGRES_COMPONENT_1','this is component demo postgres\r\n',0,36,'2018-03-15 14:11:39'),(13,'SHELL_DM2',10,8,'DEMO SHELL POSTGRESQL','',0,6,'2018-03-15 14:11:39'),(14,'COMPONENT_POSGRES_2',11,8,'DEMO SHELL POSGRES 2','this component demo postgres 2',0,6,'2018-03-15 14:11:39'),(18,'VUNA_DEMO_COMPONENT',7,8,'vuna demo','abcd',1,12,'2018-04-03 15:32:24'),(43,'COM_EXCEL_1',24,3,'Component Hoang','No Desc',0,3,'2018-05-03 11:44:23'),(44,'COM_EXCEL_2',25,3,'Component Hoang','No Desc',0,3,'2018-05-03 11:44:23'),(45,'EXCEL_COM_TANK_1',26,8,'Oppo','N/A',1,6,'2018-05-03 11:44:23'),(46,'EXCEL_COM_TANK_2',27,12,'Apple','N/A',1,36,'2018-05-03 11:44:23'),(47,'EXCEL_COM_TANK_3',28,12,'Apple','N/A',1,36,'2018-05-03 11:44:23');
/*!40000 ALTER TABLE `component_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `component_type`
--

DROP TABLE IF EXISTS `component_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `component_type` (
  `ComponentTypeID` bigint(20) NOT NULL,
  `ComponentTypeName` varchar(50) DEFAULT NULL,
  `ComponentTypeCode` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ComponentTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `component_type`
--

LOCK TABLES `component_type` WRITE;
/*!40000 ALTER TABLE `component_type` DISABLE KEYS */;
INSERT INTO `component_type` VALUES (1,'Cylindrical Section','CylindricalSection'),(3,'Elliptical Head','EllipticalHead'),(4,'Torispherical Head','TorisphericalHead'),(6,'Bend / Elbow','Elbow'),(7,'Cylindrical Shell','CylindricalShell'),(8,'Shell','Shell'),(9,'Spherical Shell','SphericalShell'),(10,'Hemispherical Head','HemisphericalHead'),(11,'Reducer','Reducer'),(12,'Tank Bottom','TankBottom'),(13,'Nozzle','Nozzle'),(14,'Fixed Roof','TANKROOFFIXED'),(15,'Floating Roof','TANKROOFFLOAT');
/*!40000 ALTER TABLE `component_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `design_code`
--

DROP TABLE IF EXISTS `design_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `design_code` (
  `DesignCodeID` bigint(20) NOT NULL AUTO_INCREMENT,
  `DesignCode` varchar(100) DEFAULT NULL,
  `DesignCodeApp` varchar(100) DEFAULT NULL,
  `SiteID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`DesignCodeID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `design_code`
--

LOCK TABLES `design_code` WRITE;
/*!40000 ALTER TABLE `design_code` DISABLE KEYS */;
INSERT INTO `design_code` VALUES (1,'XO07','123',4),(2,'XO08','vuna',4),(4,'POSTGRESQL_DEMO','PG_DEMO',4),(8,'Lab 411 Code','None',3),(9,'Div II','None',3);
/*!40000 ALTER TABLE `design_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` bigint(20) NOT NULL,
  `action_time` datetime DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) DEFAULT NULL,
  `action_flag` bigint(20) DEFAULT NULL,
  `change_message` longtext,
  `content_type_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co_django_a` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_django_admin_log` (`user_id`),
  KEY `django_admin_log_django_admin_log_content_type_id_c4bce8eb_fk_d` (`content_type_id`),
  KEY `django_admin_log_django_admin_log_user_id_c564eba6_fk` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2017-12-25 09:11:27','36','TANKBOTTOM',2,'[{\"changed\": {\"fields\": [\"outagemedium\"]}}]',7,1),(2,'2017-12-25 09:11:58','36','TANKBOTTOM',2,'[{\"changed\": {\"fields\": [\"outagemedium\"]}}]',7,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` bigint(20) NOT NULL,
  `app_label` varchar(100) DEFAULT NULL,
  `model` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(2,'auth','permission'),(3,'auth','group'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(7,'polls','apicomponenttype'),(8,'polls','equipmenttype'),(9,'polls','dmitems'),(10,'polls','dmcategory'),(11,'polls','tbl52capropertieslevel1'),(12,'polls','tbl74sccdmpwht'),(13,'polls','tbl204dmhtha'),(14,'polls','tbl511dfbthin');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `applied` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2017-12-19 08:47:53'),(2,'auth','0001_initial','2017-12-19 08:47:54'),(3,'admin','0001_initial','2017-12-19 08:47:55'),(4,'admin','0002_logentry_remove_auto_add','2017-12-19 08:47:55'),(5,'contenttypes','0002_remove_content_type_name','2017-12-19 08:47:55'),(6,'auth','0002_alter_permission_name_max_length','2017-12-19 08:47:55'),(7,'auth','0003_alter_user_email_max_length','2017-12-19 08:47:55'),(8,'auth','0004_alter_user_username_opts','2017-12-19 08:47:55'),(9,'auth','0005_alter_user_last_login_null','2017-12-19 08:47:55'),(10,'auth','0006_require_contenttypes_0002','2017-12-19 08:47:55'),(11,'auth','0007_alter_validators_add_error_messages','2017-12-19 08:47:55'),(12,'auth','0008_alter_user_username_max_length','2017-12-19 08:47:56'),(13,'auth','0009_alter_user_last_name_max_length','2017-12-19 08:47:56'),(14,'sessions','0001_initial','2017-12-19 08:47:56');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext,
  `expire_date` datetime DEFAULT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_django_session_expire_date_a5c62663` (`expire_date`),
  KEY `django_session_expire_date_a5c62663_django_session` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('2e234civ2obb95x25wgjbg4e5u7ascj8','NDVlYTNkODQ5MzFhY2E3ODcyM2U1ZjNmOGJkMDRkY2I3MDFiMGFhYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhZjI4NDhlODgwYjFkMGJlZTczM2JhMzgxMmYwOWU2Y2EyYzczN2VkIn0=','2018-01-22 04:36:16'),('3dfx2qtjccg4hi1mxay0joe9mwnb296v','NDVlYTNkODQ5MzFhY2E3ODcyM2U1ZjNmOGJkMDRkY2I3MDFiMGFhYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhZjI4NDhlODgwYjFkMGJlZTczM2JhMzgxMmYwOWU2Y2EyYzczN2VkIn0=','2018-02-07 10:47:58'),('c8k4fqqgw6jyaeulsompvbpfu2fsfph3','NDVlYTNkODQ5MzFhY2E3ODcyM2U1ZjNmOGJkMDRkY2I3MDFiMGFhYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhZjI4NDhlODgwYjFkMGJlZTczM2JhMzgxMmYwOWU2Y2EyYzczN2VkIn0=','2018-01-26 07:18:45'),('lntnsawuubgu5w0xtbeeekctmywwszjo','NDVlYTNkODQ5MzFhY2E3ODcyM2U1ZjNmOGJkMDRkY2I3MDFiMGFhYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhZjI4NDhlODgwYjFkMGJlZTczM2JhMzgxMmYwOWU2Y2EyYzczN2VkIn0=','2018-01-31 06:14:00'),('miqq0bto3tirlk8olfns4oukmzj0uz1q','NDVlYTNkODQ5MzFhY2E3ODcyM2U1ZjNmOGJkMDRkY2I3MDFiMGFhYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhZjI4NDhlODgwYjFkMGJlZTczM2JhMzgxMmYwOWU2Y2EyYzczN2VkIn0=','2018-01-23 04:56:44'),('rln4md0ps6et5bxvrqjer862emo185k0','ZjJlNmUyOTk4MjcxODk3MTU2NzMwMTdhMmZmMzBiNzRkZDc1NDI1Mzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3NDE1MjRkNDY4ZmRkMjg3ZWExODYxZGRjOTkwN2ExYWEyMTg1ZDJlIn0=','2018-01-08 08:45:09'),('uom6l3fpxwmfzw3vyh8dkmh0q6rlksmw','ZjJlNmUyOTk4MjcxODk3MTU2NzMwMTdhMmZmMzBiNzRkZDc1NDI1Mzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3NDE1MjRkNDY4ZmRkMjg3ZWExODYxZGRjOTkwN2ExYWEyMTg1ZDJlIn0=','2018-01-02 08:51:38');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_category`
--

DROP TABLE IF EXISTS `dm_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_category` (
  `DMCategoryID` bigint(20) NOT NULL,
  `DMCategoryName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`DMCategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_category`
--

LOCK TABLES `dm_category` WRITE;
/*!40000 ALTER TABLE `dm_category` DISABLE KEYS */;
INSERT INTO `dm_category` VALUES (1,'1. Mechanical and Metallurgical Mechanisms'),(2,'2. Uniform or Localized Metal Loss'),(3,'3. High Temperature Corrosion'),(4,'4. Environmental-Assisted Mechanisms'),(5,'5. Others');
/*!40000 ALTER TABLE `dm_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_items`
--

DROP TABLE IF EXISTS `dm_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_items` (
  `DMItemID` bigint(20) NOT NULL,
  `DMDescription` varchar(100) DEFAULT NULL,
  `DMSeq` bigint(20) DEFAULT NULL,
  `DMCategoryID` bigint(20) DEFAULT NULL,
  `DMCode` varchar(50) DEFAULT NULL,
  `HasDF` bigint(20) DEFAULT NULL,
  `FailureMode` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`DMItemID`),
  KEY `dm_items_DMCategoryID` (`DMCategoryID`),
  KEY `dmcategoryid_dm_items` (`DMCategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_items`
--

LOCK TABLES `dm_items` WRITE;
/*!40000 ALTER TABLE `dm_items` DISABLE KEYS */;
INSERT INTO `dm_items` VALUES (1,'885F Embrittlement',1,1,'dm885F',1,'Rupture'),(2,'Brittle Fracture',2,1,'dmBrittleFracture',1,'Rupture'),(3,'Cavitation',3,1,'dmCavitation',0,'Leakage'),(4,'Creep Rupture',4,1,'dmCreepRupture',0,'Rupture'),(5,'Dissimilar Metal Weld Cracking',5,1,'dmDissimilarMetalWeldCracking',0,'Rupture'),(6,'Erosion/Erosion-Corrosion',6,1,'dmErosionCorrosion',0,'Leakage'),(7,'Graphitisation',7,1,'dmGraphitisation',0,'Mixed'),(8,'Internal Thinning',1,2,'dmInternalThinning',1,'Mixed'),(9,'Internal Lining Degradation',2,2,'dmInternalLiningDegradation',1,'Mixed'),(10,'Vibration-Induced Mechanical Fatigue',10,1,'dmPipingMechanicalFatigue',1,'Mixed'),(11,'Refractory Degradation',11,1,'dmRefractoryDegradation',0,'Mixed'),(12,'Reheat Cracking',12,1,'dmReheatCracking',0,'Rupture'),(13,'Short Term Overheating',13,1,'dmShortTermOverheating',0,'Rupture'),(14,'Sigma Phase Embrittlement',14,1,'dmSigmaPhaseEmbrittlement',1,'Rupture'),(15,'Spheroidisation (Softening)',15,1,'dmSpheroidisation',0,'Leakage'),(16,'Steam Blanketing',16,1,'dmSteamBlanketing',0,'Leakage'),(17,'Strain Aging',17,1,'dmStrainAging',0,'Rupture'),(18,'Temper Embrittlement',18,1,'dmTemperEmbrittlement',1,'Rupture'),(19,'Thermal Fatigue',19,1,'dmThermalFatigue',0,'Rupture'),(20,'Thermal Shock',20,1,'dmThermalShock',0,'Rupture'),(22,'Other Mechanical or Metallurgical',22,1,'dmMechanicalMetallurgical',0,'Rupture'),(23,'Amine Corrosion',23,2,'dmAmineCorrosion',0,'Mixed'),(24,'Ammonium Bisulphide Corrosion',24,2,'dmAmmoniumBisulphideCorrosion',0,'Mixed'),(25,'Ammonium Chloride Corrosion',25,2,'dmAmmoniumChlorideCorrosion',0,'Mixed'),(26,'Atmospheric Corrosion',26,2,'dmAtmosphericCorrosion',0,'Mixed'),(27,'Boiler Water Condensate Corrosion',27,2,'dmBoilerWaterCondensateCorrosion',0,'Leakage'),(28,'Caustic Corrosion',28,2,'dmCausticCorrosion',0,'Leakage'),(29,'Chloride Stress Corrosion Under Insulation',29,2,'dmChlorideStressCorrosionUnderInsulation',0,'Mixed'),(30,'CO2 Corrosion',30,2,'dmCO2Corrosion',0,'Mixed'),(31,'Cooling Water Corrosion',31,2,'dmCoolingWaterCorrosion',0,'Leakage'),(32,'Corrosion Under Insulation',32,2,'dmCorrosionUnderInsulation',1,'Leakage'),(33,'Dealloying',33,2,'dmDealloying',0,'Leakage'),(34,'External Corrosion',34,2,'dmExternalDamageFerriticComponent',1,'Mixed'),(35,'Flue Gas Dew Point Corrosion',35,2,'dmFlueGasDewPointCorrosion',0,'Mixed'),(36,'Galvanic Corrosion',36,2,'dmGalvanicCorrosion',0,'Leakage'),(37,'Graphite Corrosion',37,2,'dmGraphiteCorrosion',0,'Mixed'),(38,'High Temperature H2/H2S Corrosion',38,2,'dmHighTemperatureH2_H2SCorrosion',0,'Mixed'),(39,'Hydrochloric Acid Corrosion',39,2,'dmHydrochloricAcidCorrosion',0,'Mixed'),(40,'Hydrofluoric Acid Corrosion',40,2,'dmHydrofluoricAcidCorrosion',0,'Mixed'),(41,'Microbiologically-Induced Corrosion',41,2,'dmMicrobiologicallyInducedCorrosion',0,'Mixed'),(42,'Naphthenic Acid Corrosion',42,2,'dmNaphthenicAcidCorrosion',0,'Leakage'),(43,'Phenol (Carbonic Acid) Corrosion',43,2,'dmPhenolCarbonicAcidCorrosion',0,'Mixed'),(44,'Soil Corrosion',44,2,'dmSoilCorrosion',0,'Mixed'),(45,'Sour Water Corrosion',45,2,'dmSourWaterCorrosion',0,'Mixed'),(46,'Sulphuric Acid Corrosion',46,2,'dmSulphuricAcidCorrosion',0,'Mixed'),(47,'Titanium Hydriding',47,2,'dmTitaniumHydriding',0,'Rupture'),(48,'Other, Metal Loss',48,2,'dmOtherMetalLoss',0,'Rupture'),(49,'Carburisation',49,3,'dmCarburisation',0,'Rupture'),(50,'Decarburisation',50,3,'dmDecarburisation',0,'Leakage'),(51,'Fuel Ash Corrosion',51,3,'dmFuelAshCorrosion',0,'Leakage'),(52,'Metal Dusting',52,3,'dmMetalDusting',0,'Leakage'),(53,'Nitriding',53,3,'dmNitriding',0,'Rupture'),(54,'Oxidation',54,3,'dmOxidation',0,'Leakage'),(55,'Sulphidation',55,3,'dmSulphidation',0,'Leakage'),(56,'Other High Temperature Corrosion',56,3,'dmOtherHighTemperatureCorrosion',0,'Rupture'),(57,'Amine Stress Corrosion Cracking',57,4,'dmAmineStressCorrosionCracking',1,'Leakage'),(58,'Ammonia Stress Corrosion Cracking',58,4,'dmAmmoniaStressCorrosionCracking',0,'Leakage'),(59,'Blistering',59,4,'dmBlistering',0,'Rupture'),(60,'Carbonate Stress Corrosion Cracking',60,4,'dmCarbonateStressCorrosionCracking',1,'Leakage'),(61,'Caustic Stress Corrosion Cracking',61,4,'dmCausticStressCorrosionCracking',1,'Leakage'),(62,'Chloride Stress Corrosion Cracking',62,4,'dmChlorideStressCorrosionCracking',1,'Leakage'),(63,'Chloride Stress Corrosion Cracking Under Insulation',63,4,'dmChlorideStressCorrosionCrackingUnderInsulation',1,'Leakage'),(64,'Corrosion Fatigue',64,4,'dmCorrosionFatigue',0,'Rupture'),(65,'Deaerator Cracking',65,4,'dmDeaeratorCracking',0,'Rupture'),(66,'External Chloride Stress Corrosion Cracking',66,4,'dmExternalChlorideStressCorrosionCracking',1,'Leakage'),(67,'HF Produced HIC/SOHIC',67,4,'dmHFProducedHIC_SOHIC',1,'Leakage'),(68,'High Temperature Hydrogen Attack',68,4,'dmHighTemperatureHydrogenAttack',1,'Rupture'),(69,'HIC/SOHIC-H2S',70,4,'dmHIC_SOHIC_H2S',1,'Rupture'),(70,'Hydrogen Stress Cracking (HF)',71,4,'dmHydrogenStressCrackingHSCHF',1,'Rupture'),(71,'Liquid Metal Embrittlement',72,4,'dmLiquidMetalEmbrittlement',0,'Rupture'),(72,'Polythionic Acid Stress Corrosion Cracking',73,4,'dmPolythionicAcidStressCorrosionCracking',1,'Leakage'),(73,'Sulphide Stress Corrosion Cracking (H2S)',74,4,'dmSulphideStressCorrosionCrackingH2S',1,'Rupture'),(74,'Other Environment-Assisted',75,4,'dmOtherEnvironmentAssisted',0,'Rupture'),(75,'Aluminium Chloride (General + Localised Corrosion)',76,5,'dmAluminiumChloride',0,'Mixed'),(76,'Ammonia (General + Localised Corrosion)',77,5,'dmAmmonia',0,'Mixed'),(77,'Cladding Disbondment',78,5,'dmCladdingDisbondment',0,'Mixed'),(78,'Cyanides (General + Localised Corrosion)',79,5,'dmCyanides',0,'Mixed'),(79,'Formic Acid (General + Localised Corrosion)',80,5,'dmFormicAcid',0,'Mixed'),(80,'Hydrogen Sulphide (General + Localised Corrosion)',81,5,'dmHydrogenSulphide',0,'Mixed'),(81,'Localised Corrosion of Stainless Steel',82,5,'dmLocalisedCorrosionStainlessSteel',0,'Leakage'),(82,'Oxygen (General + Localised Corrosion)',83,5,'dmOxygen',0,'Mixed'),(83,'Polythionic Acid (General + Localised Corrosion)',84,5,'dmPolythionicAcid',0,'Mixed'),(84,'Under Deposit Attack (Metal Thinning)',85,5,'dmUnderDepositAttackMetalThinning',0,'Mixed'),(85,'Water (General + Localised Corrosion)',86,5,'dmWater',0,'Mixed'),(86,'Hydrogen Embrittlement',69,3,'dmHydrogenEmbrittlement',0,'Rupture');
/*!40000 ALTER TABLE `dm_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipment_master`
--

DROP TABLE IF EXISTS `equipment_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipment_master` (
  `EquipmentID` bigint(20) NOT NULL AUTO_INCREMENT,
  `EquipmentNumber` varchar(100) DEFAULT NULL,
  `EquipmentTypeID` bigint(20) DEFAULT NULL,
  `EquipmentName` varchar(150) DEFAULT NULL,
  `CommissionDate` datetime DEFAULT NULL,
  `DesignCodeID` bigint(20) DEFAULT NULL,
  `SiteID` bigint(20) DEFAULT NULL,
  `FacilityID` bigint(20) DEFAULT NULL,
  `ManufacturerID` bigint(20) DEFAULT NULL,
  `PFDNo` varchar(100) DEFAULT NULL,
  `ProcessDescription` varchar(250) DEFAULT NULL,
  `EquipmentDesc` varchar(250) DEFAULT NULL,
  `Create` datetime DEFAULT NULL,
  PRIMARY KEY (`EquipmentID`),
  KEY `equipment_master_equipment_designcode` (`DesignCodeID`),
  KEY `equipment_master_equipment_equipmentType` (`EquipmentTypeID`),
  KEY `equipment_facility_equipment_master` (`FacilityID`),
  KEY `equipment_master_equipment_facility` (`FacilityID`),
  KEY `equipment_designcode_equipment_master` (`DesignCodeID`),
  KEY `equipment_master_equipment_sites` (`SiteID`),
  KEY `equipment_master_equipment_manufacturer` (`ManufacturerID`),
  KEY `equipment_manufacturer_equipment_master` (`ManufacturerID`),
  KEY `equipment_equipmenttype_equipment_master` (`EquipmentTypeID`),
  KEY `equipment_sites_equipment_master` (`SiteID`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipment_master`
--

LOCK TABLES `equipment_master` WRITE;
/*!40000 ALTER TABLE `equipment_master` DISABLE KEYS */;
INSERT INTO `equipment_master` VALUES (1,'EQ01',1,'Vuna Eq Demo','1990-01-04 16:25:33',1,3,1,1,'1','abc','abc','2018-03-15 14:10:35'),(2,'EQ02',2,'Demo 2','2000-05-04 16:26:56',1,4,2,1,'','','','2018-03-15 14:10:35'),(3,'EQ03',1,'vunatest','2017-12-31 00:00:00',1,4,2,1,'1','1','1','2018-03-15 14:10:35'),(4,'EQ261',15,'1','2017-11-26 00:00:00',2,4,3,1,'1','q','q','2018-03-15 14:10:35'),(7,'EQ2611',11,'vunatest','2017-10-01 00:00:00',2,4,3,1,'N01','abc','abc','2018-03-15 14:10:35'),(8,'EQ05',11,'vunatest','2018-01-02 00:00:00',2,8,9,5,'NO1','aaaaa','aaaaa','2018-03-15 14:10:35'),(10,'POSTGRESQL_DEMO1',3,'postgresql demo','2017-10-01 00:00:00',2,11,11,2,'NO:01','postgres demo 1','postgres demo 1\r\n','2018-03-15 14:10:35'),(11,'POSTGRESQL_DEMO2',11,'postgresql demo 2','2010-02-25 00:00:00',1,11,11,1,'NO_02','this is equipment test for postgres database','demo for postgres database using model','2018-03-15 14:10:35'),(24,'EQ_EXCEL_1',1,'Pressure Machine','1995-12-12 00:00:00',8,3,1,9,'No','No','No','2018-05-03 11:44:23'),(25,'EQ_EXCEL_2',2,'Oil Tube','1995-12-12 00:00:00',8,3,1,10,'No','No','No','2018-05-03 11:44:23'),(26,'EXCEL_TANK_DEMO_1',11,'NewTank','1995-09-09 00:00:00',9,3,1,11,'N/A','N/A','N/A','2018-05-03 11:44:23'),(27,'EXCEL_TANK_DEMO_2',11,'Tank Bottom','1995-09-09 00:00:00',9,3,1,11,'N/A','N/A','N/A','2018-05-03 11:44:23'),(28,'EXCEL_TANK_DEMO_3',11,'Shell','1995-09-09 00:00:00',9,3,1,11,'N/A','N/A','N/A','2018-05-03 11:44:23');
/*!40000 ALTER TABLE `equipment_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipment_type`
--

DROP TABLE IF EXISTS `equipment_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipment_type` (
  `EquipmentTypeID` bigint(20) NOT NULL,
  `EquipmentTypeCode` varchar(50) DEFAULT NULL,
  `EquipmentTypeName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`EquipmentTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipment_type`
--

LOCK TABLES `equipment_type` WRITE;
/*!40000 ALTER TABLE `equipment_type` DISABLE KEYS */;
INSERT INTO `equipment_type` VALUES (1,'ACCUM','Accumulator'),(2,'AIRCO','Air Cooler'),(3,'COLUM','Column'),(4,'VEVES','Vertical Vessel'),(5,'SPVES','Spherical Vessel'),(6,'FIHEA','Fired Heater'),(7,'PIPIN','Piping'),(8,'PUMP','Pump'),(9,'PLEXC','Plate Exchanger'),(10,'STEXC','Shell and Tube Exchanger'),(11,'TANK','Tank'),(12,'HOVES','Horizontal Vessel'),(13,'REVAL','Relief Valve'),(14,'TOWER','Tower'),(15,'FILTE','Filter');
/*!40000 ALTER TABLE `equipment_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facility`
--

DROP TABLE IF EXISTS `facility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facility` (
  `FacilityID` bigint(20) NOT NULL AUTO_INCREMENT,
  `SiteID` bigint(20) DEFAULT NULL,
  `FacilityName` varchar(100) DEFAULT NULL,
  `ManagementFactor` double DEFAULT NULL,
  `Create` datetime DEFAULT NULL,
  PRIMARY KEY (`FacilityID`),
  KEY `sites_facility` (`SiteID`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facility`
--

LOCK TABLES `facility` WRITE;
/*!40000 ALTER TABLE `facility` DISABLE KEYS */;
INSERT INTO `facility` VALUES (1,3,'VuNA Facility',0.21,'2018-03-15 11:57:05'),(2,4,'CORTEK Facility Demo',0.1,'2018-03-15 11:57:05'),(3,4,'vunafacility',0.1,'2018-03-15 11:57:05'),(8,8,'facility test',0.26,'2018-03-15 11:57:05'),(9,8,'facility test 1',0.38,'2018-03-15 11:57:05'),(11,11,'Postgres demo',0.1,'2018-03-15 11:57:05'),(23,4,'vunafacility2',0.1,'2018-04-02 15:24:37');
/*!40000 ALTER TABLE `facility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facility_risk_target`
--

DROP TABLE IF EXISTS `facility_risk_target`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facility_risk_target` (
  `FacilityID` bigint(20) NOT NULL,
  `RiskTarget_FC` double DEFAULT NULL,
  `RiskTarget_AC` double DEFAULT NULL,
  PRIMARY KEY (`FacilityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facility_risk_target`
--

LOCK TABLES `facility_risk_target` WRITE;
/*!40000 ALTER TABLE `facility_risk_target` DISABLE KEYS */;
INSERT INTO `facility_risk_target` VALUES (1,30000,10002),(2,1000000,10000),(3,100000,100),(8,1000000000,20000),(9,1000000,100),(11,120000,1000),(23,1000000,10000);
/*!40000 ALTER TABLE `facility_risk_target` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufacturer`
--

DROP TABLE IF EXISTS `manufacturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manufacturer` (
  `ManufacturerID` int(11) NOT NULL AUTO_INCREMENT,
  `ManufacturerName` varchar(100) NOT NULL,
  `SiteID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ManufacturerID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacturer`
--

LOCK TABLES `manufacturer` WRITE;
/*!40000 ALTER TABLE `manufacturer` DISABLE KEYS */;
INSERT INTO `manufacturer` VALUES (1,'Vuna Manu 1',4),(2,'manu test1',4),(3,'manufacture test2',3),(5,'manufacture test4',4),(9,'Vung Tau',3),(10,'Viet Nam',3),(11,'Lab411',3);
/*!40000 ALTER TABLE `manufacturer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rw_assessment`
--

DROP TABLE IF EXISTS `rw_assessment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rw_assessment` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EquipmentID` int(11) NOT NULL,
  `ComponentID` int(11) NOT NULL,
  `AssessmentDate` datetime DEFAULT NULL,
  `RiskAnalysisPeriod` int(11) NOT NULL,
  `IsEquipmentLinked` smallint(6) NOT NULL,
  `ProposalName` varchar(100) DEFAULT NULL,
  `Create` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `rw_assessment_assesment_component` (`ComponentID`),
  KEY `rw_assessment_assesment_equipment` (`EquipmentID`)
) ENGINE=InnoDB AUTO_INCREMENT=351 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rw_assessment`
--

LOCK TABLES `rw_assessment` WRITE;
/*!40000 ALTER TABLE `rw_assessment` DISABLE KEYS */;
INSERT INTO `rw_assessment` VALUES (68,1,1,'2017-12-31 00:00:00',36,1,'vunaproposal','2018-03-15 11:50:49'),(76,1,1,'2017-12-31 00:00:00',36,1,'vunatest1','2018-03-15 11:50:49'),(80,1,1,'2017-12-31 00:00:00',36,1,'vunatest1','2018-03-15 11:50:49'),(99,1,1,'2017-12-31 00:00:00',36,1,'vunatest1','2018-03-15 11:50:49'),(123,2,2,'2017-12-31 00:00:00',36,0,'VuNA','2018-03-15 11:50:49'),(124,1,7,'2017-12-31 00:00:00',36,1,'vu test','2018-03-15 11:50:49'),(142,1,4,'2018-01-28 00:00:00',36,1,'vunaproposal','2018-03-15 11:50:49'),(146,1,4,'2018-02-11 00:00:00',36,1,'vunaproposal','2018-03-15 11:50:49'),(148,1,4,'2018-02-11 00:00:00',36,1,'vunaproposal','2018-03-15 11:50:49'),(149,1,4,'2018-02-11 00:00:00',36,1,'vunaproposal','2018-03-15 11:50:49'),(157,1,7,'2017-12-31 00:00:00',36,1,'vuna demo data','2018-03-15 11:50:49'),(158,1,7,'2017-12-31 00:00:00',36,1,'vuna demo data','2018-03-15 11:50:49'),(177,2,8,'2017-08-01 00:00:00',36,1,'vuna tank bottom demo 1','2018-03-15 11:50:49'),(181,2,2,'2010-08-27 00:00:00',36,0,'vuna demo data','2018-03-15 11:50:49'),(220,1,7,'2018-03-02 00:00:00',36,1,'postgresql demo 2','2018-03-15 11:50:49'),(222,10,11,'2018-02-25 00:00:00',36,0,'demo postgres','2018-03-15 11:50:49'),(225,10,11,'2018-02-25 00:00:00',36,0,'demo postgres','2018-03-15 11:50:49'),(228,10,11,'2018-02-26 00:00:00',36,0,'vuna tank bottom demo 1','2018-03-15 11:50:49'),(231,11,14,'2018-03-08 00:00:00',36,0,'shell demo postgres','2018-03-15 11:50:49'),(247,10,11,'2018-03-22 00:00:00',36,0,'demo','2018-03-22 14:50:49'),(261,1,1,'2018-04-06 00:00:00',36,1,'demo','2018-04-06 16:04:54'),(291,11,14,'2018-04-09 00:00:00',36,0,'demo_newvsersion','2018-04-09 16:11:40'),(298,1,1,'2018-04-10 00:00:00',36,1,'1','2018-04-10 12:52:11'),(306,2,9,'2018-04-12 00:00:00',36,1,'a','2018-04-12 15:48:14'),(312,1,1,'2018-04-19 00:00:00',36,1,'lab411','2018-04-18 10:52:15'),(346,24,43,'2018-04-24 00:00:00',36,0,'New Excel Proposal 05-03-18','2018-05-03 11:44:23'),(347,25,44,'2018-04-24 00:00:00',36,0,'New Excel Proposal 05-03-18','2018-05-03 11:44:23'),(348,26,45,'1999-09-09 00:00:00',36,1,'New Excel Proposal 05-03-18','2018-05-03 11:44:23'),(349,27,46,'1999-09-09 00:00:00',36,1,'New Excel Proposal 05-03-18','2018-05-03 11:44:23'),(350,28,47,'1999-09-09 00:00:00',36,1,'New Excel Proposal 05-03-18','2018-05-03 11:44:23');
/*!40000 ALTER TABLE `rw_assessment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rw_ca_level1`
--

DROP TABLE IF EXISTS `rw_ca_level1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rw_ca_level1` (
  `ID` int(11) NOT NULL,
  `Release_Phase` varchar(50) DEFAULT NULL,
  `fact_di` double DEFAULT NULL,
  `fact_mit` double DEFAULT NULL,
  `fact_ait` double DEFAULT NULL,
  `CA_cmd` double DEFAULT NULL,
  `CA_inj_flame` double DEFAULT NULL,
  `CA_inj_toxic` double DEFAULT NULL,
  `CA_inj_ntnf` double DEFAULT NULL,
  `FC_cmd` double DEFAULT NULL,
  `FC_affa` double DEFAULT NULL,
  `FC_prod` double DEFAULT NULL,
  `FC_inj` double DEFAULT NULL,
  `FC_envi` double DEFAULT NULL,
  `FC_total` double DEFAULT NULL,
  `FCOF_Category` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rw_ca_level1`
--

LOCK TABLES `rw_ca_level1` WRITE;
/*!40000 ALTER TABLE `rw_ca_level1` DISABLE KEYS */;
INSERT INTO `rw_ca_level1` VALUES (68,'Gas',0,0.2,0,2723.41429464866,52.9352378197442,0,0,24183.0065359477,5446828.58929732,2546748.30007799,1323380.94549361,0,9341140.84140486,'D'),(76,'Gas',0,0.25,0,2555.46970883798,25.5133918605998,0,0,24183.0065359477,12777348.5441899,4068488.66852196,1275669.59302999,0,18145689.8122778,'E'),(80,'Gas',0,0.25,0,2555.46970883798,25.5133918605998,0,0,24183.0065359477,5110939.41767596,2460746.02667537,1275669.59302999,0,8871538.04391726,'D'),(99,'Gas',0,0.25,0,2555.46970883798,25.5133918605998,0,0,24183.0065359477,5110939.41767596,2460746.02667537,25513.3918605998,0,7621381.84274788,'D'),(123,'Gas',0,0.05,0.839728217426059,0,0,0,3083.71516774003,29019.6078431373,0,243790.849673203,154185758.387002,0,154458568.844518,'E'),(124,'Powder',0,0.2,0,0,0,0,0,13490.1960784314,0,190849.673202614,0,0,204339.869281046,'C'),(142,'Liquid',0.25,0.2,0.659872102318145,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,100000000,'E'),(146,'Liquid',0.25,0.2,0.659872102318145,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,100000000,'E'),(148,'Liquid',0.25,0.2,0.659872102318145,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,100000000,'E'),(149,'Liquid',0.25,0.15,1,0,0,0,0.000000453812643262802,11310,0,661400,0.000226906321631401,0,672710.000226906,'C'),(157,'Liquid',0.25,0.2,0.659872102318145,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,100000000,'E'),(158,'Liquid',0.25,0.2,0.659872102318145,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,100000000,'E'),(181,'Gas',0.25,0.2,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,100000000,'E'),(220,'Liquid',0.25,0.2,0.659872102318145,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,100000000,'E'),(261,'Gas',0,0.15,0,611.111787282893,57.9002129121442,0,0,24183.0065359477,916667.680924339,1023381.7454878,579.002129121442,0,1964811.43507721,'D'),(298,'Liquid',0,0.15,0.659872102318145,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,100000000,'E'),(312,'Gas',0,0.25,0,2555.46970883798,25.5133918605998,0,0,24183.0065359477,5110939.41767596,2460746.02667537,25513.3918605998,0,7621381.84274788,'D'),(346,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,100000000,'E'),(347,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,100000000,'E');
/*!40000 ALTER TABLE `rw_ca_level1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rw_ca_tank`
--

DROP TABLE IF EXISTS `rw_ca_tank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rw_ca_tank` (
  `ID` int(11) NOT NULL,
  `Hydraulic_Water` double DEFAULT NULL,
  `Hydraulic_Fluid` double DEFAULT NULL,
  `Seepage_Velocity` double DEFAULT NULL,
  `Flow_Rate_D1` double DEFAULT NULL,
  `Flow_Rate_D2` double DEFAULT NULL,
  `Flow_Rate_D3` double DEFAULT NULL,
  `Flow_Rate_D4` double DEFAULT NULL,
  `Leak_Duration_D1` double DEFAULT NULL,
  `Leak_Duration_D2` double DEFAULT NULL,
  `Leak_Duration_D3` double DEFAULT NULL,
  `Leak_Duration_D4` double DEFAULT NULL,
  `Release_Volume_Leak_D1` double DEFAULT NULL,
  `Release_Volume_Leak_D2` double DEFAULT NULL,
  `Release_Volume_Leak_D3` double DEFAULT NULL,
  `Release_Volume_Leak_D4` double DEFAULT NULL,
  `Release_Volume_Rupture` double DEFAULT NULL,
  `Liquid_Height` double DEFAULT NULL,
  `Volume_Fluid` double DEFAULT NULL,
  `Time_Leak_Ground` double DEFAULT NULL,
  `Volume_SubSoil_Leak_D1` double DEFAULT NULL,
  `Volume_SubSoil_Leak_D4` double DEFAULT NULL,
  `Volume_Ground_Water_Leak_D1` double DEFAULT NULL,
  `Volume_Ground_Water_Leak_D4` double DEFAULT NULL,
  `Barrel_Dike_Leak` double DEFAULT NULL,
  `Barrel_Dike_Rupture` double DEFAULT NULL,
  `Barrel_Onsite_Leak` double DEFAULT NULL,
  `Barrel_Onsite_Rupture` double DEFAULT NULL,
  `Barrel_Offsite_Leak` double DEFAULT NULL,
  `Barrel_Offsite_Rupture` double DEFAULT NULL,
  `Barrel_Water_Leak` double DEFAULT NULL,
  `Barrel_Water_Rupture` double DEFAULT NULL,
  `FC_Environ_Leak` double DEFAULT NULL,
  `FC_Environ_Rupture` double DEFAULT NULL,
  `FC_Environ` double DEFAULT NULL,
  `Material_Factor` double DEFAULT NULL,
  `Component_Damage_Cost` double DEFAULT NULL,
  `Business_Cost` double DEFAULT NULL,
  `Consequence` double DEFAULT NULL,
  `ConsequenceCategory` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rw_ca_tank`
--

LOCK TABLES `rw_ca_tank` WRITE;
/*!40000 ALTER TABLE `rw_ca_tank` DISABLE KEYS */;
INSERT INTO `rw_ca_tank` VALUES (177,47.52,33.5386564615385,101.632292307692,135.541871278541,NULL,NULL,0,1.58922493667436,NULL,NULL,360,215.406521799364,NULL,NULL,0,0.0000000861626087197457,12,215.406521799364,0,215.406521799364,0,0,0,NULL,0.0000000758230956733763,NULL,0.00000000103395130463695,NULL,0.000000000186111234834651,NULL,0.00000000911945050689789,0.0155092695695542,0.00000538826489889802,0.0155146578344531,1,25690173.3888888,51246.5373961219,25741419.9417996,'E'),(222,47.52,8.1058691670823,24.5632399002494,0,NULL,NULL,0,360,NULL,NULL,360,0,NULL,NULL,0,0,0,0,0,0,0,0,0,NULL,0,NULL,0,NULL,0,NULL,0,0,0,0,0,0,0,100000000,'E'),(225,47.52,8.1058691670823,24.5632399002494,0,NULL,NULL,0,360,NULL,NULL,360,0,NULL,NULL,0,0,0,0,0,0,0,0,0,NULL,0,NULL,0,NULL,0,NULL,0,0,0,0,0,0,0,100000000,'E'),(228,47.52,8.1058691670823,24.5632399002494,0,NULL,NULL,0,360,NULL,NULL,360,0,NULL,NULL,0,0,0,0,0,0,0,0,0,NULL,0,NULL,0,NULL,0,NULL,0,0,0,0,0,0,0,100000000,'E'),(231,NULL,NULL,NULL,0,0,0,0,1,1,1,1,0,20.4082653576791,40.8165307153583,61.2247960730374,0.0612247960730374,0,0,1,7.1428928751877,0.0612247960730374,0,0,7.1428928751877,0.0612247960730374,0,0,0,0,0,0,71.428928751877,0.612247960730374,72.0411767126074,0,0,0,72.0411767126074,'A'),(247,47.52,8.1058691670823,24.5632399002494,0,NULL,NULL,0,360,NULL,NULL,360,0,NULL,NULL,0,0,0,0,0,0,0,0,0,NULL,0,NULL,0,NULL,0,NULL,0,0,0,0,0,0,0,100000000,'E'),(291,NULL,NULL,NULL,12.8473224981821,51.3892899927283,3288.91455953461,780684529.758091,1,1,1,1,12.8473224981821,51.3892899927283,3288.91455953461,10279.9005016614,10.2799005016614,12,14685.5721452306,1,186.28617622364,10.2799005016614,5.36727730935553,0.296184493253868,180.697590936931,9.9715034866116,0.111771705734184,0.00616794030099687,0.109536271619501,0.00604458149497693,5.36727730935553,0.296184493253868,28703.7191772434,1583.968188898,30287.6873661414,1.2,9048,46140,85475.6873661414,'B'),(306,NULL,NULL,NULL,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,100000000,'E'),(348,NULL,NULL,NULL,24.8787330394075,99.51493215763,6368.95565808832,61699381.3364933,1,1,1,1,24.8787330394075,99.51493215763,1048.86241216829,449.51246235784,0.44951246235784,45,2247.5623117892,1,94.7369667754074,0.44951246235784,5.30527013942282,0.025172697892039,85.2632700978667,0.404561216122056,1.89473933550815,0.0089902492471568,2.27368720260978,0.0107882990965882,5.30527013942282,0.025172697892039,28610.563966173,135.752763632068,28746.3167298051,NULL,90480,0,119226.316729805,'C'),(349,47.52,33.5386564615385,101.632292307692,337.512311940497,NULL,NULL,1471.41396922459,6.65920096030583,NULL,NULL,1.52748469077919,2247.5623117892,NULL,NULL,2247.5623117892,0.00000089902492471568,45,2247.5623117892,0.049196961777291,2247.5623117892,2247.5623117892,0,0,NULL,0.000000809122432244112,NULL,0.0000000179804984943136,NULL,0.0000000215765981931763,NULL,0.0000000503453957840781,0.970946918692935,0.000271505527264135,0.971218424220199,12,857661482.29596,0,857661483.267179,'E'),(350,47.52,33.5386564615385,101.632292307692,337.512311940497,NULL,NULL,1471.41396922459,6.65920096030583,NULL,NULL,1.52748469077919,2247.5623117892,NULL,NULL,2247.5623117892,0.00000089902492471568,45,2247.5623117892,0.049196961777291,2247.5623117892,2247.5623117892,0,0,NULL,0.000000809122432244112,NULL,0.0000000179804984943136,NULL,0.0000000215765981931763,NULL,0.0000000503453957840781,0.970946918692935,0.000271505527264135,0.971218424220199,12,857661482.29596,0,857661483.267179,'E');
/*!40000 ALTER TABLE `rw_ca_tank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rw_coating`
--

DROP TABLE IF EXISTS `rw_coating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rw_coating` (
  `ID` int(11) NOT NULL,
  `ExternalCoating` smallint(6) DEFAULT NULL,
  `ExternalInsulation` smallint(6) DEFAULT NULL,
  `InternalCladding` smallint(6) DEFAULT NULL,
  `InternalCoating` smallint(6) DEFAULT NULL,
  `InternalLining` smallint(6) DEFAULT NULL,
  `ExternalCoatingDate` datetime DEFAULT NULL,
  `ExternalCoatingQuality` varchar(50) DEFAULT NULL,
  `ExternalInsulationType` varchar(50) DEFAULT NULL,
  `InsulationCondition` varchar(50) DEFAULT NULL,
  `InsulationContainsChloride` smallint(6) DEFAULT NULL,
  `InternalLinerCondition` varchar(50) DEFAULT NULL,
  `InternalLinerType` varchar(50) DEFAULT NULL,
  `CladdingCorrosionRate` double DEFAULT NULL,
  `SupportConfigNotAllowCoatingMaint` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rw_coating`
--

LOCK TABLES `rw_coating` WRITE;
/*!40000 ALTER TABLE `rw_coating` DISABLE KEYS */;
INSERT INTO `rw_coating` VALUES (68,0,1,1,1,1,NULL,NULL,'Asbestos','Above average',1,'Poor','Acid Brick',0.29,1),(76,1,1,0,1,1,'2013-04-01 00:00:00','Medium coating quality','Pearlite','Average',1,'Poor','Organic',0.1,1),(80,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,NULL,0.1,0),(99,0,0,1,0,0,NULL,NULL,NULL,NULL,0,NULL,NULL,0.1,0),(123,0,1,1,1,1,NULL,NULL,'Calcium Silicate','Average',1,'Good','Castable refractory',0.3,1),(124,0,0,1,1,0,NULL,NULL,'Asbestos','Above average',0,'Average','Acid Brick',0.1,1),(142,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,NULL,0,0),(146,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,NULL,0,0),(148,1,0,0,0,0,'2001-02-08 00:00:00','Medium coating quality',NULL,NULL,0,NULL,NULL,0,1),(149,1,1,1,0,1,'2001-02-08 00:00:00','Medium coating quality','Pearlite','Below average',1,'Poor','Acid Brick',0.2,1),(157,1,0,0,0,0,'2017-07-30 00:00:00','High coating quality','Asbestos','Above average',0,'Average','Acid Brick',0,0),(158,0,0,0,0,0,NULL,NULL,'Asbestos','Above average',0,'Average','Acid Brick',0,0),(177,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,NULL,0,0),(181,0,0,0,0,0,NULL,NULL,'Asbestos','Above average',0,'Average','Acid Brick',0,0),(220,0,0,0,0,0,NULL,NULL,'Asbestos','Above average',0,'Average','Acid Brick',0,0),(222,1,0,0,0,0,'2017-06-25 00:00:00',NULL,'Asbestos','Above average',0,'Average','Acid Brick',0,0),(225,0,0,0,0,0,'2018-03-05 00:00:00',NULL,'Asbestos','Above average',0,'Average','Acid Brick',0,0),(228,0,0,0,0,0,'2018-03-05 00:00:00',NULL,'Asbestos','Above average',0,'Average','Acid Brick',0,0),(231,0,0,0,0,0,NULL,NULL,'Asbestos','Above average',0,'Average','Acid Brick',0,0),(247,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,NULL,0,0),(261,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,NULL,0,0),(291,1,1,1,1,1,'2018-04-12 00:00:00','No coating or poor quality','Asbestos','Above average',1,'Good','Castable refractory severe condition',0.2,1),(298,1,1,0,0,1,'2010-04-10 00:00:00','Medium coating quality','Fibreglass','Below average',1,'Average','Glass lined',0,0),(306,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,NULL,0,0),(312,0,0,1,0,0,NULL,NULL,NULL,NULL,0,NULL,NULL,0.1,0),(346,0,1,0,0,1,'2017-10-20 00:00:00','No coating or poor quality','Asbestos','Below average',0,'Good','Acid Brick',15,1),(347,0,1,0,0,1,'2017-10-20 00:00:00','Medium coating quality','Foam Glass','Above average',0,'Poor','Glass lined',15,1),(348,1,1,1,1,1,'2000-01-11 00:00:00','Medium coating quality','Calcium Silicate','Above average',1,'Average','Castable refractory',23,1),(349,1,1,1,1,1,'2000-01-11 00:00:00','Medium coating quality','Calcium Silicate','Above average',1,'Average','Castable refractory',23,1),(350,1,1,1,1,1,'2000-01-11 00:00:00','Medium coating quality','Calcium Silicate','Above average',1,'Average','Castable refractory',23,1);
/*!40000 ALTER TABLE `rw_coating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rw_component`
--

DROP TABLE IF EXISTS `rw_component`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rw_component` (
  `ID` int(11) NOT NULL,
  `NominalDiameter` double DEFAULT NULL,
  `NominalThickness` double DEFAULT NULL,
  `CurrentThickness` double DEFAULT NULL,
  `MinReqThickness` double DEFAULT NULL,
  `CurrentCorrosionRate` double DEFAULT NULL,
  `BranchDiameter` varchar(50) DEFAULT NULL,
  `BranchJointType` varchar(50) DEFAULT NULL,
  `BrinnelHardness` varchar(50) DEFAULT NULL,
  `ChemicalInjection` smallint(6) DEFAULT NULL,
  `HighlyInjectionInsp` smallint(6) DEFAULT NULL,
  `ComplexityProtrusion` varchar(50) DEFAULT NULL,
  `CorrectiveAction` varchar(50) DEFAULT NULL,
  `CracksPresent` smallint(6) DEFAULT NULL,
  `CyclicLoadingWitin15_25m` varchar(50) DEFAULT NULL,
  `DamageFoundInspection` smallint(6) DEFAULT NULL,
  `DeltaFATT` double DEFAULT NULL,
  `NumberPipeFittings` varchar(50) DEFAULT NULL,
  `PipeCondition` varchar(50) DEFAULT NULL,
  `PreviousFailures` varchar(50) DEFAULT NULL,
  `ShakingAmount` varchar(50) DEFAULT NULL,
  `ShakingDetected` smallint(6) DEFAULT NULL,
  `ShakingTime` varchar(50) DEFAULT NULL,
  `TrampElements` smallint(6) DEFAULT NULL,
  `ShellHeight` double DEFAULT NULL,
  `ReleasePreventionBarrier` smallint(6) DEFAULT NULL,
  `ConcreteFoundation` smallint(6) DEFAULT NULL,
  `SeverityOfVibration` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rw_component`
--

LOCK TABLES `rw_component` WRITE;
/*!40000 ALTER TABLE `rw_component` DISABLE KEYS */;
INSERT INTO `rw_component` VALUES (68,97.62,19.05,19.05,16.68,0.29,'Any branch less than or equal to 2\" Nominal OD','None','Below 200',0,0,'Above average','None',0,'Valve with high pressure drop',0,0.5,'More than 10','Broken gussets or gussets welded directly to pipe','Greater than one','Moderate',1,'13 to 52 weeks',0,NULL,NULL,NULL,NULL),(76,99,19.05,18.5,17.68,0.3,'Any branch less than or equal to 2\" Nominal OD','Piping tee weldolets','Between 200 and 237',0,0,'Average','None',0,'PRV chatter',1,0.2,'6 to 10','Broken gussets or gussets welded directly to pipe','None','Minor',0,'Less than 2 weeks',0,NULL,NULL,NULL,NULL),(80,99,19.05,19,17.68,0.29,'Any branch less than or equal to 2\" Nominal OD','Piping tee weldolets','Between 200 and 237',0,0,'Average','Experience',0,'PRV chatter',0,0.2,'6 to 10','Broken gussets or gussets welded directly to pipe','None','Moderate',0,'2 to 13 weeks',0,NULL,NULL,NULL,NULL),(99,99,19.05,18,17.68,0.25,'Any branch less than or equal to 2\" Nominal OD','Saddle in fittings','Between 200 and 237',0,0,'Average','Experience',0,'PRV chatter',0,0.2,'6 to 10','Broken gussets or gussets welded directly to pipe','None','Moderate',0,'Less than 2 weeks',0,NULL,NULL,NULL,NULL),(123,98,19.05,19.05,17.68,0.29,'All branches greater than 2\" Nominal OD','Piping tee weldolets','Greater than 237',1,1,'Average','Experience',1,'PRV chatter',1,2.7,'6 to 10','Good condition','None','Moderate',1,'2 to 13 weeks',1,NULL,NULL,NULL,NULL),(124,99,19.05,17,17,0.3,'All branches greater than 2\" Nominal OD','Piping tee weldolets','Greater than 237',1,1,'Average','Engineering Analysis',1,'PRV chatter',1,2.7,'6 to 10','Broken gussets or gussets welded directly to pipe','None','Minor',1,'13 to 52 weeks',1,NULL,0,0,NULL),(142,0,0,0,0,0,'Any branch less than or equal to 2\" Nominal OD','None','Below 200',0,0,'Above average','Engineering Analysis',0,'None',0,0,'More than 10','Broken gussets or gussets welded directly to pipe','Greater than one','Minor',0,'13 to 52 weeks',0,NULL,0,0,NULL),(146,0,0,0,0,0,'Any branch less than or equal to 2\" Nominal OD','None','Below 200',0,0,'Above average','Engineering Analysis',0,'None',0,0,'More than 10','Broken gussets or gussets welded directly to pipe','Greater than one','Minor',0,'13 to 52 weeks',0,NULL,0,0,NULL),(148,0,0,0,0,0,'Any branch less than or equal to 2\" Nominal OD','None','Below 200',0,0,'Above average','Engineering Analysis',0,'None',0,0,'More than 10','Broken gussets or gussets welded directly to pipe','Greater than one','Minor',0,'13 to 52 weeks',0,NULL,0,0,NULL),(149,70,20,18.09,17,0.3,'Any branch less than or equal to 2\" Nominal OD','Sweepolets','Below 200',0,0,'Average','Engineering Analysis',0,'PRV chatter',1,2.7,'Up to 5','Missing or damage supports, improper support','None','Minor',1,'13 to 52 weeks',0,NULL,0,0,NULL),(157,0,0,0,0,0,'Any branch less than or equal to 2\" Nominal OD','None','Below 200',0,0,'Above average','Engineering Analysis',0,'None',0,0,'More than 10','Broken gussets or gussets welded directly to pipe','Greater than one','Minor',0,'13 to 52 weeks',0,NULL,0,0,NULL),(158,0,0,0,0,0,'Any branch less than or equal to 2\" Nominal OD','None','Below 200',0,0,'Above average','Engineering Analysis',0,'None',0,0,'More than 10','Broken gussets or gussets welded directly to pipe','Greater than one','Minor',0,'13 to 52 weeks',0,NULL,0,0,NULL),(177,11.99,0,0,0,0,NULL,NULL,'Below 200',0,0,'Above average',NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0,0,'None'),(181,0,0,0,0,0,'Any branch less than or equal to 2\" Nominal OD','None','Below 200',0,0,'Above average','Engineering Analysis',0,'None',0,0,'More than 10','Broken gussets or gussets welded directly to pipe','Greater than one','Minor',0,'13 to 52 weeks',0,NULL,0,0,NULL),(220,0,0,0,0,0,'Any branch less than or equal to 2\" Nominal OD','None','Below 200',0,0,'Above average','Engineering Analysis',0,'None',0,0,'More than 10','Broken gussets or gussets welded directly to pipe','Greater than one','Minor',0,'13 to 52 weeks',0,NULL,0,0,NULL),(222,99,0,0,0,0,NULL,NULL,'Below 200',0,0,'Above average',NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,0,0,0,'None'),(225,0,0,0,0,0,NULL,NULL,'Below 200',0,0,'Above average',NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,0,0,0,'None'),(228,0,0,0,0,0,NULL,NULL,'Below 200',0,0,'Above average',NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,0,0,0,'None'),(231,9.04,0,0,0,0,NULL,NULL,'Below 200',0,0,'Above average',NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,2,0,0,'None'),(247,7,11,13,0,0.29,NULL,NULL,'Below 200',0,0,'Above average',NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0,0,'None'),(261,19,19.09,17.07,16,0.29,'Any branch less than or equal to 2\" Nominal OD',NULL,NULL,0,0,NULL,NULL,0,NULL,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0,0,NULL),(291,99,17.08,16,14,0.3,NULL,NULL,'Below 200',0,0,'Below average',NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,1.2,0,0,'None'),(298,0,0,0,0,0,'Any branch less than or equal to 2\" Nominal OD',NULL,NULL,0,0,NULL,NULL,0,NULL,0,0,NULL,NULL,NULL,NULL,0,NULL,0,NULL,0,0,NULL),(306,0,0,0,0,0,NULL,NULL,NULL,0,0,NULL,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,0,0,0,NULL),(312,99,19.5,18,17.68,0.25,'Any branch less than or equal to 2\" Nominal OD','Saddle in fittings','Between 200 and 237',0,0,'Average','Experience',0,'None',0,0.2,'6 to 10','Broken gussets or gussets welded directly to pipe','None','Moderate',0,'Less than 2 weeks',0,NULL,0,0,NULL),(346,5,29,29,20,0.5,'All branches greater than 2\" Nominal OD','None','Below 200',0,0,'Below average','Engineering Analysis',0,'None',1,0.5,'More than 10','Good condition','None','Moderate',0,'Less than 2 weeks',1,NULL,0,0,NULL),(347,5,29,29,28,0.5,'All branches greater than 2\" Nominal OD','Saddle in fittings','Between 200 and 237',0,0,'Above average','Engineering Analysis',0,'None',1,0.5,'More than 10','Broken gussets or gussets welded directly to pipe','Greater than one','Moderate',0,'13 to 52 weeks',1,NULL,0,0,NULL),(348,20,18,17,16,200,NULL,NULL,'Between 200 and 237',0,0,'Above average',NULL,1,NULL,1,3,NULL,NULL,NULL,NULL,0,NULL,1,12,1,1,'Low'),(349,20,18,17,16,200,NULL,NULL,'Between 200 and 237',0,0,'Above average',NULL,1,NULL,1,3,NULL,NULL,NULL,NULL,0,NULL,1,12,1,1,'Low'),(350,20,18,17,16,200,NULL,NULL,'Between 200 and 237',0,0,'Above average',NULL,1,NULL,1,3,NULL,NULL,NULL,NULL,0,NULL,1,12,1,1,'Low');
/*!40000 ALTER TABLE `rw_component` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rw_damage_mechanism`
--

DROP TABLE IF EXISTS `rw_damage_mechanism`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rw_damage_mechanism` (
  `ID_DM` int(11) NOT NULL,
  `DMItemID` int(11) NOT NULL,
  `IsActive` smallint(6) DEFAULT NULL,
  `Notes` varchar(255) DEFAULT NULL,
  `ExpectedTypeID` int(11) DEFAULT NULL,
  `IsEL` smallint(6) DEFAULT NULL,
  `ELValue` double DEFAULT NULL,
  `IsDF` smallint(6) DEFAULT NULL,
  `IsUserDisabled` smallint(6) DEFAULT NULL,
  `DF1` double DEFAULT NULL,
  `DF2` double DEFAULT NULL,
  `DF3` double DEFAULT NULL,
  `DFBase` double DEFAULT NULL,
  `RLI` double DEFAULT NULL,
  `HighestInspectionEffectiveness` varchar(50) DEFAULT NULL,
  `SecondInspectionEffectiveness` varchar(50) DEFAULT NULL,
  `NumberOfInspections` int(11) DEFAULT NULL,
  `LastInspDate` datetime DEFAULT NULL,
  `InspDueDate` datetime DEFAULT NULL,
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=448 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rw_damage_mechanism`
--

LOCK TABLES `rw_damage_mechanism` WRITE;
/*!40000 ALTER TABLE `rw_damage_mechanism` DISABLE KEYS */;
INSERT INTO `rw_damage_mechanism` VALUES (181,8,1,NULL,0,0,0,1,0,1900,1900,1900,NULL,0,'E','E',0,'2000-05-04 00:00:00','2025-01-27 00:00:00',9),(181,32,1,NULL,0,0,0,1,0,1900,1900,1900,NULL,0,'E','E',0,'2000-05-04 00:00:00','2025-01-27 00:00:00',10),(222,8,1,NULL,0,0,0,1,0,1390,1390,1390,0,0,'E','E',0,'2018-03-05 00:00:00','2019-03-05 00:00:00',16),(222,32,1,NULL,0,0,0,1,0,1390,1390,1390,0,0,'E','E',0,'2018-03-05 00:00:00','2019-03-05 00:00:00',17),(225,8,1,NULL,0,0,0,1,0,1390,1390,1390,0,0,'E','E',0,'2018-03-05 00:00:00','2019-03-05 00:00:00',18),(225,32,1,NULL,0,0,0,1,0,1390,1390,1390,0,0,'E','E',0,'2018-03-05 00:00:00','2019-03-05 00:00:00',19),(228,8,1,NULL,0,0,0,1,0,1390,1390,1390,0,0,'E','E',0,'2018-03-05 00:00:00','2019-03-05 00:00:00',21),(228,32,1,NULL,0,0,0,1,0,1390,1390,1390,0,0,'E','E',0,'2018-03-05 00:00:00','2019-03-05 00:00:00',22),(231,8,1,NULL,0,0,0,1,0,1900,1900,1900,0,0,'E','E',0,'2018-03-08 00:00:00','2019-03-08 00:00:00',23),(231,32,1,NULL,0,0,0,1,0,1900,1900,1900,0,0,'E','E',0,'2018-03-08 00:00:00','2019-03-08 00:00:00',24),(247,8,1,NULL,0,0,0,1,0,4,4,4,0,0,'E','E',0,'2018-03-22 00:00:00','2033-03-22 00:00:00',27),(247,32,1,NULL,0,0,0,1,0,4,4,4,0,0,'E','E',0,'2018-03-22 00:00:00','2033-03-22 00:00:00',28),(291,8,1,NULL,0,0,0,1,0,4.5,4.5,4.5,0,0,'E','E',0,'2018-04-12 00:00:00','2033-04-12 00:00:00',90),(291,9,1,NULL,0,0,0,1,0,9,146,1978,0,0,'E','E',0,'2018-04-12 00:00:00','2033-04-12 00:00:00',91),(306,8,1,NULL,0,0,0,1,0,5700,5700,5700,0,0,'E','E',0,'2018-04-12 00:00:00','2019-04-12 00:00:00',92),(306,32,1,NULL,0,0,0,1,0,1900,1900,1900,0,0,'E','E',0,'2018-04-12 00:00:00','2019-04-12 00:00:00',93),(142,8,1,NULL,0,0,0,1,0,1900,1900,1900,0,0,'E','E',0,'1990-01-04 00:00:00','2019-01-28 00:00:00',169),(142,32,1,NULL,0,0,0,1,0,1900,1900,1900,0,0,'E','E',0,'1990-01-04 00:00:00','2019-01-28 00:00:00',170),(146,8,1,NULL,0,0,0,1,0,1900,1900,1900,0,0,'E','E',0,'1990-01-04 00:00:00','2019-01-11 00:00:00',171),(146,32,1,NULL,0,0,0,1,0,1900,1900,1900,0,0,'E','E',0,'1990-01-04 00:00:00','2019-01-11 00:00:00',172),(148,8,1,NULL,0,0,0,1,0,1900,1900,1900,0,0,'E','E',0,'1990-01-04 00:00:00','2019-01-11 00:00:00',173),(148,32,1,NULL,0,0,0,1,0,1900,1900,1900,0,0,'E','E',0,'1990-01-04 00:00:00','2019-01-11 00:00:00',174),(149,8,1,NULL,0,0,0,1,0,135,157.5,180,0,0,'E','E',0,'1990-01-04 00:00:00','2019-01-11 00:00:00',187),(149,9,1,NULL,0,0,0,1,0,1190,1190,1190,0,0,'E','E',0,'1990-01-04 00:00:00','2019-01-11 00:00:00',188),(149,72,1,NULL,0,0,0,1,0,39.1341414315929,43.7636850417776,48.4382569368922,0,0,'E','E',0,'1990-01-04 00:00:00','2019-01-11 00:00:00',189),(149,68,1,NULL,0,0,0,1,0,2000,2000,2000,0,0,'E','E',0,'1990-01-04 00:00:00','2019-01-11 00:00:00',190),(80,8,1,NULL,0,0,0,1,0,315,360,405,0,0,'E','E',0,'1990-01-04 00:00:00','2029-01-31 00:00:00',201),(99,8,1,NULL,0,0,0,1,0,525,525,600,0,0,'E','E',0,'1990-01-04 00:00:00','2021-01-31 00:00:00',205),(99,72,1,NULL,0,0,0,1,0,37.678179044907,42.2926021085486,46.9533349052238,0,0,'E','E',0,'1990-01-04 00:00:00','2021-01-31 00:00:00',206),(99,32,1,NULL,0,0,0,1,0,20,20,20,0,0,'E','E',0,'1990-01-04 00:00:00','2021-01-31 00:00:00',207),(298,8,1,NULL,0,0,0,1,0,1900,1900,1900,0,0,'E','E',0,'1990-01-04 00:00:00','2019-01-10 00:00:00',210),(298,9,1,NULL,0,0,0,1,0,612,612,612,0,0,'E','E',0,'1990-01-04 00:00:00','2019-01-10 00:00:00',211),(298,72,1,NULL,0,0,0,1,0,39.1341414315929,43.7636850417776,48.4382569368922,0,0,'E','E',0,'1990-01-04 00:00:00','2019-01-10 00:00:00',212),(298,32,1,NULL,0,0,0,1,0,1900,1900,1900,0,0,'E','E',0,'1990-01-04 00:00:00','2019-01-10 00:00:00',213),(312,8,1,NULL,0,0,0,1,0,525,525,600,0,0,'E','E',0,'1990-01-04 00:00:00','2022-01-19 00:00:00',228),(312,72,1,NULL,0,0,0,1,0,39.1648469169466,43.7947041166165,48.4695634278636,0,0,'E','E',0,'1990-01-04 00:00:00','2022-01-19 00:00:00',229),(312,32,1,NULL,0,0,0,1,0,20,20,20,0,0,'E','E',0,'1990-01-04 00:00:00','2022-01-19 00:00:00',230),(76,8,1,NULL,0,0,0,1,0,180,202.5,225,0,0,'E','E',0,'1990-01-04 00:00:00','2025-12-31 00:00:00',308),(76,9,1,NULL,0,0,0,1,0,30000,30000,30000,0,0,'E','E',0,'1990-01-04 00:00:00','2025-12-31 00:00:00',309),(76,32,1,NULL,0,0,0,1,0,6,6,6,0,0,'E','E',0,'1990-01-04 00:00:00','2025-12-31 00:00:00',310),(177,8,1,NULL,0,0,0,1,0,1390,1390,1390,0,0,'E','E',0,'2018-05-03 00:00:00','2019-05-03 00:00:00',355),(177,32,1,NULL,0,0,0,1,0,1390,1390,1390,0,0,'E','E',0,'2018-05-03 00:00:00','2019-05-03 00:00:00',356),(348,8,1,NULL,0,0,0,1,0,750,1900,1900,0,0,'E','E',0,'2018-05-03 00:00:00','2020-05-03 00:00:00',396),(347,8,1,NULL,0,0,0,1,0,607.5,675,675,0,0,'E','E',0,'1995-12-12 00:00:00','2019-04-24 00:00:00',406),(347,9,1,NULL,0,0,0,1,0,1990,3060,3060,0,0,'E','E',0,'1995-12-12 00:00:00','2019-04-24 00:00:00',407),(347,61,1,NULL,0,0,0,1,0,152691.933588444,175352.024315698,198282.156938613,0,0,'E','E',0,'1995-12-12 00:00:00','2019-04-24 00:00:00',408),(347,57,1,NULL,0,0,0,1,0,30.5383867176887,35.0704048631396,39.6564313877226,0,0,'E','E',0,'1995-12-12 00:00:00','2019-04-24 00:00:00',409),(347,60,1,NULL,0,0,0,1,0,3053.83867176887,3507.04048631396,3965.64313877226,0,0,'E','E',0,'1995-12-12 00:00:00','2019-04-24 00:00:00',410),(347,72,1,NULL,0,0,0,1,0,30.5383867176887,35.0704048631396,39.6564313877226,0,0,'E','E',0,'1995-12-12 00:00:00','2019-04-24 00:00:00',411),(347,70,1,NULL,0,0,0,1,0,30.5383867176887,35.0704048631396,39.6564313877226,0,0,'E','E',0,'1995-12-12 00:00:00','2019-04-24 00:00:00',412),(347,67,1,NULL,0,0,0,1,0,30.5383867176887,35.0704048631396,39.6564313877226,0,0,'E','E',0,'1995-12-12 00:00:00','2019-04-24 00:00:00',413),(347,34,1,NULL,0,0,0,1,0,520,520,520,0,0,'E','E',0,'1995-12-12 00:00:00','2019-04-24 00:00:00',414),(347,32,1,NULL,0,0,0,1,0,650,650,650,0,0,'E','E',0,'1995-12-12 00:00:00','2019-04-24 00:00:00',415),(346,8,1,NULL,0,0,0,1,0,472.5,540,607.5,0,0,'E','E',0,'1995-12-12 00:00:00','2019-04-24 00:00:00',416),(346,9,1,NULL,0,0,0,1,0,63,119,119,0,0,'E','E',0,'1995-12-12 00:00:00','2019-04-24 00:00:00',417),(124,8,1,NULL,0,0,0,1,0,5400,6075,6750,0,0,'E','E',0,'1990-01-04 00:00:00','2018-12-31 00:00:00',418),(124,61,1,NULL,0,0,0,1,0,195440.436551656,218585.800886165,241956.503247512,0,0,'E','E',0,'1990-01-04 00:00:00','2018-12-31 00:00:00',419),(124,57,1,NULL,0,0,0,1,0,39088.0873103312,43717.160177233,48391.3006495024,0,0,'E','E',0,'1990-01-04 00:00:00','2018-12-31 00:00:00',420),(124,72,1,NULL,0,0,0,1,0,195440.436551656,218585.800886165,241956.503247512,0,0,'E','E',0,'1990-01-04 00:00:00','2018-12-31 00:00:00',421),(124,34,1,NULL,0,0,0,1,0,1200,1200,1200,0,0,'E','E',0,'1990-01-04 00:00:00','2018-12-31 00:00:00',422),(124,32,1,NULL,0,0,0,1,0,1900,1900,1900,0,0,'E','E',0,'1990-01-04 00:00:00','2018-12-31 00:00:00',423),(124,66,1,NULL,0,0,0,1,0,1954.26768295416,1954.26768295416,1954.26768295416,0,0,'E','E',0,'1990-01-04 00:00:00','2018-12-31 00:00:00',424),(157,8,1,NULL,0,0,0,1,0,1900,1900,1900,0,0,'E','E',0,'1990-01-04 00:00:00','2018-12-31 00:00:00',425),(157,32,1,NULL,0,0,0,1,0,1900,1900,1900,0,0,'E','E',0,'1990-01-04 00:00:00','2018-12-31 00:00:00',426),(158,8,1,NULL,0,0,0,1,0,1900,1900,1900,0,0,'E','E',0,'1990-01-04 00:00:00','2018-12-31 00:00:00',427),(158,32,1,NULL,0,0,0,1,0,1900,1900,1900,0,0,'E','E',0,'1990-01-04 00:00:00','2018-12-31 00:00:00',428),(220,8,1,NULL,0,0,0,1,0,1900,1900,1900,0,0,'E','E',0,'1990-01-04 00:00:00','2019-03-02 00:00:00',429),(220,34,1,NULL,0,0,0,1,0,1900,1900,1900,0,0,'E','E',0,'1990-01-04 00:00:00','2019-03-02 00:00:00',430),(220,32,1,NULL,0,0,0,1,0,1900,1900,1900,0,0,'E','E',0,'1990-01-04 00:00:00','2019-03-02 00:00:00',431),(349,8,1,NULL,0,0,0,1,0,4,1390,1390,0,0,'E','E',0,'2018-05-10 00:00:00','2019-05-10 00:00:00',432),(349,34,1,NULL,0,0,0,1,0,4,4,4,0,0,'E','E',0,'2018-05-10 00:00:00','2019-05-10 00:00:00',433),(349,32,1,NULL,0,0,0,1,0,4,4,4,0,0,'E','E',0,'2018-05-10 00:00:00','2019-05-10 00:00:00',434),(349,66,1,NULL,0,0,0,1,0,863.844026224423,863.844026224423,863.844026224423,0,0,'E','E',0,'2018-05-10 00:00:00','2019-05-10 00:00:00',435),(349,18,1,NULL,0,0,0,1,0,1.1,1.1,1.1,0,0,'E','E',0,'2018-05-10 00:00:00','2019-05-10 00:00:00',436),(349,1,1,NULL,0,0,0,1,0,1022,1022,1022,0,0,'E','E',0,'2018-05-10 00:00:00','2019-05-10 00:00:00',437),(68,8,1,NULL,0,0,0,1,0,315,360,405,0,0,'E','E',0,'1990-01-04 00:00:00','2026-12-31 00:00:00',438),(68,9,1,NULL,0,0,0,1,0,1190,1190,1190,0,0,'E','E',0,'1990-01-04 00:00:00','2026-12-31 00:00:00',439),(68,72,1,NULL,0,0,0,1,0,39.0880873103312,43.717160177233,48.3913006495024,0,0,'E','E',0,'1990-01-04 00:00:00','2026-12-31 00:00:00',440),(68,32,1,NULL,0,0,0,1,0,90,90,90,0,0,'E','E',0,'1990-01-04 00:00:00','2026-12-31 00:00:00',441),(350,8,1,NULL,0,0,0,1,0,4,1390,1390,0,0,'E','E',0,'2018-05-16 00:00:00','2019-05-16 00:00:00',442),(350,34,1,NULL,0,0,0,1,0,4,4,4,0,0,'E','E',0,'2018-05-16 00:00:00','2019-05-16 00:00:00',443),(350,32,1,NULL,0,0,0,1,0,4,4,4,0,0,'E','E',0,'2018-05-16 00:00:00','2019-05-16 00:00:00',444),(350,66,1,NULL,0,0,0,1,0,865.015532670584,865.015532670584,865.015532670584,0,0,'E','E',0,'2018-05-16 00:00:00','2019-05-16 00:00:00',445),(350,18,1,NULL,0,0,0,1,0,1.1,1.1,1.1,0,0,'E','E',0,'2018-05-16 00:00:00','2019-05-16 00:00:00',446),(350,1,1,NULL,0,0,0,1,0,1022,1022,1022,0,0,'E','E',0,'2018-05-16 00:00:00','2019-05-16 00:00:00',447);
/*!40000 ALTER TABLE `rw_damage_mechanism` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rw_data_chart`
--

DROP TABLE IF EXISTS `rw_data_chart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rw_data_chart` (
  `ID` bigint(20) NOT NULL,
  `risk_target` double DEFAULT NULL,
  `risk_age_1` double DEFAULT NULL,
  `risk_age_2` double DEFAULT NULL,
  `risk_age_3` double DEFAULT NULL,
  `risk_age_4` double DEFAULT NULL,
  `risk_age_5` double DEFAULT NULL,
  `risk_age_6` double DEFAULT NULL,
  `risk_age_7` double DEFAULT NULL,
  `risk_age_8` double DEFAULT NULL,
  `risk_age_9` double DEFAULT NULL,
  `risk_age_10` double DEFAULT NULL,
  `risk_age_11` double DEFAULT NULL,
  `risk_age_12` double DEFAULT NULL,
  `risk_age_13` double DEFAULT NULL,
  `risk_age_14` double DEFAULT NULL,
  `risk_age_15` double DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rw_data_chart`
--

LOCK TABLES `rw_data_chart` WRITE;
/*!40000 ALTER TABLE `rw_data_chart` DISABLE KEYS */;
INSERT INTO `rw_data_chart` VALUES (68,30000,21406.8845021341,24200.6872325681,24293.6214824011,24386.8559567232,24480.3821983589,27275.3699349957,27369.4562490707,27463.8117234005,30259.6073168473,30354.4812434713,30449.6051286981,30544.9731970497,37843.7204733713,37939.5606608782,38035.6292772521),(76,30000,23612.3510535737,23612.3510535737,23612.3510535737,23612.3510535737,26235.9456150819,26235.9456150819,26235.9456150819,33232.1977791037,33232.1977791037,33232.1977791037,33232.1977791037,33232.1977791037,33232.1977791037,33232.1977791037,33232.1977791037),(80,30000,20523.0612492764,20523.0612492764,20523.0612492764,20523.0612492764,23088.443905436,23088.443905436,23088.443905436,25653.8265615956,25653.8265615956,25653.8265615956,25653.8265615956,32494.846978021,32494.846978021,32494.846978021,32494.846978021),(99,30000,27632.2291232983,27707.5623466297,27783.155030274,31532.124376988,31608.2131284518,31684.5393968054,31761.0967101584,35511.0039371349,35588.0053404967,35665.2204251299,35742.6439977204,39493.3961035524,39571.2220907749,39649.2424676707,39727.4529704571),(124,30000,204339.869281046,204339.869281046,204339.869281046,204339.869281046,204339.869281046,204339.869281046,204339.869281046,204339.869281046,204339.869281046,204339.869281046,204339.869281046,204339.869281046,204339.869281046,204339.869281046,204339.869281046),(142,10000,3990000,3990000,3990000,3990000,3990000,3990000,3990000,3990000,3990000,3990000,3990000,3990000,3990000,3990000,3990000),(146,10000,3990000,3990000,3990000,3990000,3990000,3990000,3990000,3990000,3990000,3990000,3990000,3990000,3990000,3990000,3990000),(148,10000,3990000,3990000,3990000,3990000,3990000,3990000,3990000,3990000,3990000,3990000,3990000,3990000,3990000,3990000,3990000),(149,10000,30735.5235286689,31075.1801358663,31097.0539753426,31118.9984099218,31458.866927948,31480.9467069229,31503.0914543756,31843.1549738577,31865.4247318804,31887.7547016325,32227.9989314459,32250.445113882,33120.5620316148,33143.1192512933,33165.7301962224),(157,30000,1220940,1220940,1220940,1220940,1220940,1220940,1220940,1220940,1220940,1220940,1220940,1220940,1220940,1220940,1220940),(158,30000,1220940,1220940,1220940,1220940,1220940,1220940,1220940,1220940,1220940,1220940,1220940,1220940,1220940,1220940,1220940),(177,1000000,2583357.42251913,2583357.42251913,2583357.42251913,2583357.42251913,2583357.42251913,2583357.42251913,2583357.42251913,2583357.42251913,2583357.42251913,2583357.42251913,2583357.42251913,2583357.42251913,2583357.42251913,2583357.42251913,2583357.42251913),(220,30000,1220940,1220940,1220940,1220940,1220940,1220940,1220940,1220940,1220940,1220940,1220940,1220940,1220940,1220940,1220940),(261,30000,12.6258782818062,12.6258782818062,12.6258782818062,12.6258782818062,12.6258782818062,12.6258782818062,12.6258782818062,12.6258782818062,12.6258782818062,12.6258782818062,12.6258782818062,12.6258782818062,12.6258782818062,18.9388174227092,37.8776348454185),(291,120000,431.224842762184,919.952140042267,1434.86733821889,1967.56203532603,2513.88044477495,3071.30692505066,3638.14369620132,4213.16300503714,4795.43328109223,5384.22215172193,5978.93790137133,6579.09196947097,7203.50580775207,7867.21489998708,8750.69800893423),(298,30000,1247718.47199541,1248710.1543574,1249705.14400785,1250703.34486393,1251704.66655246,1252709.02390765,1253716.33652649,1254726.52837386,1255739.52743031,1256755.2653771,1257773.67731356,1258794.70150275,1259818.27914192,1260844.35415482,1261872.87300336),(306,1000000,5700000,5700000,5700000,5700000,5700000,5700000,5700000,5700000,5700000,5700000,5700000,5700000,5700000,5700000,5700000),(312,30000,27705.2985346559,27780.8835501339,27856.7204757007,31605.9269767409,31682.2462156406,31758.7966882795,31835.5722737802,35585.6921627006,35662.9009138066,35740.3183047924,35817.9393943358,35895.7594818665,39646.8990692202,39725.1039283931,39803.4949618854),(346,30000,50122.8,62332.2,76469.4,76469.4,76469.4,76469.4,76469.4,76469.4,76469.4,76469.4,76469.4,76469.4,76469.4,76469.4,76469.4),(347,30000,100000000,100000000,100000000,100000000,100000000,100000000,100000000,100000000,100000000,100000000,100000000,100000000,100000000,100000000,100000000),(348,30000,17330.9758524779,31646.7690803083,46729.6579387535,62333.3436337991,78336.094922205,94664.2236675309,111267.998522925,119226.316729805,119226.316729805,119226.316729805,119226.316729805,119226.316729805,119226.316729805,119226.316729805,119226.316729805),(349,30000,857661483.267179,857661483.267179,857661483.267179,857661483.267179,857661483.267179,857661483.267179,857661483.267179,857661483.267179,857661483.267179,857661483.267179,857661483.267179,857661483.267179,857661483.267179,857661483.267179,857661483.267179),(350,30000,857661483.267179,857661483.267179,857661483.267179,857661483.267179,857661483.267179,857661483.267179,857661483.267179,857661483.267179,857661483.267179,857661483.267179,857661483.267179,857661483.267179,857661483.267179,857661483.267179,857661483.267179);
/*!40000 ALTER TABLE `rw_data_chart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rw_equipment`
--

DROP TABLE IF EXISTS `rw_equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rw_equipment` (
  `ID` int(11) NOT NULL,
  `CommissionDate` datetime NOT NULL,
  `AdminUpsetManagement` smallint(6) NOT NULL,
  `ContainsDeadlegs` smallint(6) DEFAULT NULL,
  `CyclicOperation` smallint(6) DEFAULT NULL,
  `HighlyDeadlegInsp` smallint(6) DEFAULT NULL,
  `DowntimeProtectionUsed` smallint(6) DEFAULT NULL,
  `ExternalEnvironment` varchar(50) DEFAULT NULL,
  `HeatTraced` smallint(6) DEFAULT NULL,
  `InterfaceSoilWater` smallint(6) DEFAULT NULL,
  `LinerOnlineMonitoring` smallint(6) DEFAULT NULL,
  `MaterialExposedToClExt` smallint(6) DEFAULT NULL,
  `MinReqTemperaturePressurisation` double DEFAULT NULL,
  `OnlineMonitoring` varchar(100) DEFAULT NULL,
  `PresenceSulphidesO2` smallint(6) DEFAULT NULL,
  `PresenceSulphidesO2Shutdown` smallint(6) DEFAULT NULL,
  `PressurisationControlled` smallint(6) DEFAULT NULL,
  `PWHT` smallint(6) DEFAULT NULL,
  `SteamOutWaterFlush` smallint(6) DEFAULT NULL,
  `ManagementFactor` double DEFAULT NULL,
  `ThermalHistory` varchar(50) DEFAULT NULL,
  `YearLowestExpTemp` smallint(6) DEFAULT NULL,
  `Volume` double DEFAULT NULL,
  `TypeOfSoil` varchar(50) DEFAULT NULL,
  `EnvironmentSensitivity` varchar(50) DEFAULT NULL,
  `DistanceToGroundWater` double DEFAULT NULL,
  `AdjustmentSettle` varchar(100) DEFAULT NULL,
  `ComponentIsWelded` smallint(6) DEFAULT NULL,
  `TankIsMaintained` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rw_equipment`
--

LOCK TABLES `rw_equipment` WRITE;
/*!40000 ALTER TABLE `rw_equipment` DISABLE KEYS */;
INSERT INTO `rw_equipment` VALUES (68,'2017-12-31 00:00:00',1,0,1,1,0,'Arid/dry',0,0,0,0,45,'Sour water low velocity corrosion - Electrical resistance probes',0,0,0,0,0,0.21,'Solution Annealed',0,100,NULL,NULL,NULL,NULL,NULL,NULL),(76,'2017-12-31 00:00:00',1,0,1,1,0,'Arid/dry',0,0,0,0,30,'Amine low velocity corrosion - Key process variable',0,0,0,0,0,0.21,'None',0,100,NULL,NULL,NULL,NULL,NULL,NULL),(80,'2017-12-31 00:00:00',1,0,1,1,0,'None',0,0,0,0,30,'Sour water high velocity corrosion - Key process variable',0,0,0,0,0,0.21,NULL,0,100,NULL,NULL,NULL,NULL,NULL,NULL),(99,'2017-12-31 00:00:00',0,0,1,0,0,'None',0,0,0,0,30,'Amine low velocity corrosion - Corrosion coupons',0,0,0,0,0,0.21,NULL,0,100,NULL,NULL,NULL,NULL,NULL,NULL),(123,'2017-12-31 00:00:00',1,1,1,1,1,'Temperate',1,1,1,1,90,'HCL corrosion - Corrosion coupons',1,1,1,1,1,0.1,'Solution Annealed',1,100,NULL,NULL,NULL,NULL,NULL,NULL),(124,'1990-01-04 00:00:00',1,1,1,1,1,'Marine',1,1,0,1,80,'HCL corrosion - Corrosion coupons',0,0,0,1,1,0.21,'Solution Annealed',1,1000,NULL,NULL,NULL,NULL,0,0),(142,'1990-01-04 00:00:00',0,0,0,0,0,'None',0,0,0,0,0,'Amine high velocity corrosion - Corrosion coupons',0,0,0,0,0,0.21,NULL,0,0,NULL,NULL,NULL,NULL,0,0),(146,'1990-01-04 00:00:00',0,0,0,0,0,'None',0,0,0,0,0,'Amine high velocity corrosion - Corrosion coupons',0,0,0,0,0,0.21,NULL,0,0,NULL,NULL,NULL,NULL,0,0),(148,'1990-01-04 00:00:00',0,0,0,0,0,'None',0,0,0,0,0,'Amine high velocity corrosion - Corrosion coupons',0,0,0,0,0,0.21,NULL,0,0,NULL,NULL,NULL,NULL,0,0),(149,'1990-01-04 00:00:00',1,0,0,1,1,'None',0,0,0,0,80,'Amine low velocity corrosion - Key process variable',0,0,0,0,1,0.21,NULL,0,1000,NULL,NULL,NULL,NULL,0,0),(157,'1990-01-04 00:00:00',0,0,0,0,0,'Arid/dry',0,0,0,0,0,'Amine high velocity corrosion - Corrosion coupons',0,0,0,0,0,0.21,'None',0,0,NULL,NULL,NULL,NULL,0,0),(158,'1990-01-04 00:00:00',0,0,0,0,0,'Arid/dry',0,0,0,0,0,'Amine high velocity corrosion - Corrosion coupons',0,0,0,0,0,0.21,'None',0,0,NULL,NULL,NULL,NULL,0,0),(177,'2000-05-04 00:00:00',0,0,0,0,0,'Arid/dry',0,0,0,0,0,'Amine high velocity corrosion - Corrosion coupons',0,0,0,0,0,0.1,'None',0,0,'Coarse Sand','Low',0,'Recorded settlement exceeds API 653 criteria',0,0),(181,'2000-05-04 00:00:00',0,0,0,0,0,'Arid/dry',0,0,0,0,0,'Amine high velocity corrosion - Corrosion coupons',0,0,0,0,0,0.1,'None',0,0,NULL,NULL,NULL,NULL,0,0),(220,'1990-01-04 00:00:00',0,0,1,0,0,'Arid/dry',0,0,0,1,0.03,'Amine high velocity corrosion - Corrosion coupons',0,0,0,0,0,0.21,'None',0,0,NULL,NULL,NULL,NULL,0,0),(222,'2017-10-01 00:00:00',0,0,0,0,0,'Arid/dry',0,0,0,0,0,'Amine high velocity corrosion - Corrosion coupons',0,0,0,0,0,0.1,'None',0,0,'Coarse Sand','High',0,'Recorded settlement exceeds API 653 criteria',0,0),(225,'2017-10-01 00:00:00',0,0,0,0,0,'Arid/dry',0,0,0,0,0,'Amine high velocity corrosion - Corrosion coupons',0,0,0,0,0,0.1,'None',0,0,'Coarse Sand','High',0,'Recorded settlement exceeds API 653 criteria',0,0),(228,'2017-10-01 00:00:00',0,0,0,0,0,'Arid/dry',0,0,0,0,0,'Amine high velocity corrosion - Corrosion coupons',0,0,0,0,0,0.1,'None',0,0,'Coarse Sand','High',0,'Recorded settlement exceeds API 653 criteria',0,0),(231,'2010-02-25 00:00:00',0,0,0,0,0,'Arid/dry',0,0,0,0,0,'Amine high velocity corrosion - Corrosion coupons',0,0,0,0,0,0.1,'None',0,0,'Coarse Sand','High',0,'Recorded settlement exceeds API 653 criteria',0,0),(247,'2017-10-01 00:00:00',0,0,0,0,0,'Arid/dry',0,0,0,0,0,'Amine high velocity corrosion - Corrosion coupons',0,0,0,0,0,0.1,'None',0,0,'Coarse Sand','High',0,'Recorded settlement exceeds API 653 criteria',0,0),(261,'1990-01-04 16:25:33',1,0,1,1,0,'None',0,0,0,0,12,'Amine low velocity corrosion - Key process variable',0,0,0,0,0,0.21,NULL,0,1000,NULL,NULL,NULL,NULL,0,0),(291,'2010-02-25 00:00:00',1,0,1,1,1,'Arid/dry',1,1,0,1,1,NULL,1,0,0,1,1,0.1,'None',0,1000,'Clay','High',NULL,'Settlement never evaluated',1,1),(298,'1990-01-04 16:25:33',0,0,0,0,0,NULL,0,0,0,0,0,NULL,0,0,0,0,0,0.21,NULL,0,0,NULL,NULL,NULL,NULL,0,0),(306,'2000-05-04 16:26:56',1,0,1,1,0,NULL,0,0,0,0,0,NULL,0,0,0,0,0,0.1,NULL,0,0,'Coarse Sand',NULL,NULL,NULL,0,0),(312,'1990-01-04 16:25:33',0,0,1,0,0,'None',0,0,0,0,30,'Amine low velocity corrosion - Corrosion coupons',0,0,0,0,0,0.21,NULL,0,100,NULL,NULL,NULL,NULL,0,0),(346,'1995-12-12 00:00:00',0,1,1,1,1,'Arid/dry',1,0,0,1,18,'Amine low velocity corrosion - Key process variable',1,1,0,1,0,0.21,'None',0,2000,NULL,NULL,NULL,NULL,0,0),(347,'1995-12-12 00:00:00',0,1,1,1,1,'Marine',1,0,0,1,18,'Amine low velocity corrosion - Key process variable',1,1,0,1,0,0.21,'Solution Annealed',0,2000,NULL,NULL,NULL,NULL,0,0),(348,'1995-09-09 00:00:00',1,0,1,0,1,'Arid/dry',1,1,1,1,340,'HCI corrosion - Corrosion coupons',1,1,1,1,1,0.21,'Solution Annealed',1,800,'Coarse Sand','High',5,'Recorded settlement meets API 653 criteria',1,1),(349,'1995-09-09 00:00:00',1,0,1,0,1,'Arid/dry',1,1,1,1,340,'HCI corrosion - Corrosion coupons',1,1,1,1,1,0.21,'Solution Annealed',1,800,'Coarse Sand','High',5,'Recorded settlement meets API 653 criteria',1,1),(350,'1995-09-09 00:00:00',1,0,1,0,1,'Arid/dry',1,1,1,1,340,'HCI corrosion - Corrosion coupons',1,1,1,1,1,0.21,'Solution Annealed',1,800,'Coarse Sand','High',5,'Recorded settlement meets API 653 criteria',1,1);
/*!40000 ALTER TABLE `rw_equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rw_extcor_temperature`
--

DROP TABLE IF EXISTS `rw_extcor_temperature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rw_extcor_temperature` (
  `ID` int(11) NOT NULL,
  `Minus12ToMinus8` double DEFAULT NULL,
  `Minus8ToPlus6` double DEFAULT NULL,
  `Plus6ToPlus32` double DEFAULT NULL,
  `Plus32ToPlus71` double DEFAULT NULL,
  `Plus71ToPlus107` double DEFAULT NULL,
  `Plus107ToPlus121` double DEFAULT NULL,
  `Plus121ToPlus135` double DEFAULT NULL,
  `Plus135ToPlus162` double DEFAULT NULL,
  `Plus162ToPlus176` double DEFAULT NULL,
  `MoreThanPlus176` double DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rw_extcor_temperature`
--

LOCK TABLES `rw_extcor_temperature` WRITE;
/*!40000 ALTER TABLE `rw_extcor_temperature` DISABLE KEYS */;
INSERT INTO `rw_extcor_temperature` VALUES (68,0,0,0,0,0,0,100,0,0,0),(76,2,2,2,2,90,12,12,12,12,2),(80,2,2,2,2,90,12,12,12,12,2),(99,2,2,2,2,90,12,12,12,12,2),(123,0,0,0,0,0,0,0,80,9,8.98),(124,0,0,0,0,100,0,0,0,0,0),(142,0,0,0,0,0,0,0,0,0,0),(146,0,0,0,0,0,0,0,0,0,0),(148,0,0,0,0,0,0,0,0,0,0),(149,0,0,0,0,100,0,0,0,0,0),(157,0,0,0,0,0,0,0,0,0,0),(158,0,0,0,0,0,0,0,0,0,0),(177,0,0,0,0,0,0,0,0,0,0),(181,0,0,0,0,0,0,0,0,0,0),(220,0,0,0,0,0,0,0,0,0,0),(222,0,0,0,0,0,0,0,0,0,0),(225,0,0,0,0,0,0,0,0,0,0),(228,0,0,0,0,0,0,0,0,0,0),(231,0,0,0,0,0,0,0,0,0,0),(247,0,0,0,0,0,0,0,0,0,0),(261,0,0,0,0,100,0,0,0,0,0),(291,0,0,0,0,100,0,0,0,0,0),(298,0,0,0,0,0,0,0,0,0,0),(306,0,0,0,0,0,0,0,0,0,0),(312,2,2,0,0,90,0,0,0,0,0),(346,10,30,40,50,60,10,80,90,20,10),(347,10,30,40,50,60,10,80,90,20,10),(348,10,23,5,14,12,5,4,4,9,14),(349,10,23,5,14,12,5,4,4,9,14),(350,10,23,5,14,12,5,4,4,9,14);
/*!40000 ALTER TABLE `rw_extcor_temperature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rw_full_fcof`
--

DROP TABLE IF EXISTS `rw_full_fcof`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rw_full_fcof` (
  `ID` int(11) NOT NULL,
  `FCoFValue` double DEFAULT NULL,
  `FCoFCategory` varchar(50) DEFAULT NULL,
  `AIL` smallint(6) DEFAULT NULL,
  `envcost` double DEFAULT NULL,
  `equipcost` double DEFAULT NULL,
  `prodcost` double DEFAULT NULL,
  `popdens` double DEFAULT NULL,
  `injcost` double DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rw_full_fcof`
--

LOCK TABLES `rw_full_fcof` WRITE;
/*!40000 ALTER TABLE `rw_full_fcof` DISABLE KEYS */;
INSERT INTO `rw_full_fcof` VALUES (68,9341140.84140486,'D',NULL,0,2000,50000,0.005,5000000),(76,18145689.8122778,'E',NULL,0,5000,50000,0.01,5000000),(80,8871538.04391726,'D',NULL,0,2000,50000,0.01,5000000),(99,7621381.84274788,'D',NULL,0,2000,50000,0.002,500000),(123,154458568.844518,'E',NULL,0,1200,50000,0.01,5000000),(124,204339.869281046,'C',NULL,0,0,50000,0.001,5000000),(142,100000000,'E',NULL,0,0,0,0,0),(146,100000000,'E',NULL,0,0,0,0,0),(148,100000000,'E',NULL,0,0,0,0,0),(149,672710.000226906,'C',NULL,0,10000,200000,0.001,500000),(157,100000000,'E',NULL,0,0,0,0,0),(158,100000000,'E',NULL,0,0,0,0,0),(177,25741419.9417996,'E',NULL,NULL,NULL,10000,NULL,NULL),(181,100000000,'E',NULL,0,0,0,0,0),(220,100000000,'E',NULL,0,0,0,0,0),(222,100000000,'E',NULL,NULL,NULL,0,NULL,NULL),(225,100000000,'E',NULL,NULL,NULL,0,NULL,NULL),(228,100000000,'E',NULL,NULL,NULL,0,NULL,NULL),(231,72.0411767126074,'A',NULL,NULL,NULL,0,NULL,NULL),(247,100000000,'E',NULL,NULL,NULL,0,NULL,NULL),(261,1964811.43507721,'D',NULL,0,1500,50000,0.0001,100000),(291,85475.6873661414,'B',NULL,NULL,NULL,20000,NULL,NULL),(298,100000000,'E',NULL,0,0,0,0,0),(306,100000000,'E',NULL,NULL,NULL,0,NULL,NULL),(312,7621381.84274788,'D',NULL,0,2000,50000,0.002,500000),(346,100000000,'E',NULL,NULL,NULL,NULL,NULL,NULL),(347,100000000,'E',NULL,NULL,NULL,NULL,NULL,NULL),(348,119226.316729805,'C',NULL,NULL,NULL,NULL,NULL,NULL),(349,857661483.267179,'E',NULL,NULL,NULL,NULL,NULL,NULL),(350,857661483.267179,'E',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `rw_full_fcof` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rw_full_pof`
--

DROP TABLE IF EXISTS `rw_full_pof`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rw_full_pof` (
  `ID` int(11) NOT NULL,
  `ThinningAP1` double DEFAULT NULL,
  `ThinningAP2` double DEFAULT NULL,
  `ThinningAP3` double DEFAULT NULL,
  `SCCAP1` double DEFAULT NULL,
  `SCCAP2` double DEFAULT NULL,
  `SCCAP3` double DEFAULT NULL,
  `ExternalAP1` double DEFAULT NULL,
  `ExternalAP2` double DEFAULT NULL,
  `ExternalAP3` double DEFAULT NULL,
  `BrittleAP1` double DEFAULT NULL,
  `BrittleAP2` double DEFAULT NULL,
  `BrittleAP3` double DEFAULT NULL,
  `HTHA_AP1` double DEFAULT NULL,
  `HTHA_AP2` double DEFAULT NULL,
  `HTHA_AP3` double DEFAULT NULL,
  `FatigueAP1` double DEFAULT NULL,
  `FatigueAP2` double DEFAULT NULL,
  `FatigueAP3` double DEFAULT NULL,
  `FMS` double DEFAULT NULL,
  `ThinningType` varchar(7) DEFAULT NULL,
  `GFFTotal` double DEFAULT NULL,
  `ThinningLocalAP1` double DEFAULT NULL,
  `ThinningLocalAP2` double DEFAULT NULL,
  `ThinningLocalAP3` double DEFAULT NULL,
  `ThinningGeneralAP1` double DEFAULT NULL,
  `ThinningGeneralAP2` double DEFAULT NULL,
  `ThinningGeneralAP3` double DEFAULT NULL,
  `TotalDFAP1` double DEFAULT NULL,
  `TotalDFAP2` double DEFAULT NULL,
  `TotalDFAP3` double DEFAULT NULL,
  `PoFAP1` double DEFAULT NULL,
  `PoFAP2` double DEFAULT NULL,
  `PoFAP3` double DEFAULT NULL,
  `PoFAP1Category` varchar(50) DEFAULT NULL,
  `PoFAP2Category` varchar(50) DEFAULT NULL,
  `PoFAP3Category` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rw_full_pof`
--

LOCK TABLES `rw_full_pof` WRITE;
/*!40000 ALTER TABLE `rw_full_pof` DISABLE KEYS */;
INSERT INTO `rw_full_pof` VALUES (68,315,360,405,39.0880873103312,43.717160177233,48.3913006495024,90,90,90,0,0,0,1,1,1,0,0,0,0.21,'Local',0.0000306,315,360,405,405,450,495,355.088087310331,404.717160177233,454.391300649502,0.00228179604905619,0.0026007124712989,0.0029199184979737,'4','4','4'),(76,180,202.5,225,0,0,0,6,6,6,0,0,0,0,0,0,0,0,0,0.21,'Local',0.0000306,180,202.5,225,186,208.5,231,180,202.5,225,0.00115668,0.001301265,0.00144585,'4','4','4'),(80,315,360,405,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0.21,'Local',0.0000306,315,360,405,316,361,406,315,360,405,0.00202419,0.00231336,0.00260253,'4','4','4'),(99,525,525,600,37.678179044907,42.2926021085486,46.9533349052238,20,20,20,0,0,0,0,0,0,0,0,0,0.21,'Local',0.0000306,525,525,600,545,545,620,562.678179044907,567.292602108549,646.953334905224,0.00361576997854257,0.00364542226114953,0.00415732213010097,'4','4','4'),(123,0.9,5.3,23,29882.7174083357,49787.7501187215,70463.4236621468,NULL,NULL,NULL,0,0,0,2000,2000,2000,0,0,0,0.1,'Local',0.0000306,1,5.3,23,1.9,6.3,24,31883.7174083357,51793.0501187215,72486.4236621468,0.0975641752695073,0.158486733363288,0.221808456406169,'5','5','5'),(124,5400,6075,6750,195440.436551656,218585.800886165,241956.503247512,1954.26768295416,1954.26768295416,1954.26768295416,0,0,0,1,1,1,0,0,0,0.21,'Local',0.0000306,5400,6075,6750,7354.26768295416,8029.26768295416,8704.26768295416,200841.436551656,224661.800886165,248707.503247512,1,1,1,'5','5','5'),(142,1900,1900,1900,0,0,0,1900,1900,1900,0,0,0,0,0,0,0,0,0,0.21,'Local',0.0001,1900,1900,1900,3800,3800,3800,1900,1900,1900,0.0399,0.0399,0.0399,'5','5','5'),(146,1900,1900,1900,0,0,0,1900,1900,1900,0,0,0,0,0,0,0,0,0,0.21,'Local',0.0001,1900,1900,1900,3800,3800,3800,1900,1900,1900,0.0399,0.0399,0.0399,'5','5','5'),(148,1900,1900,1900,0,0,0,1900,1900,1900,0,0,0,0,0,0,0,0,0,0.21,'Local',0.0001,1900,1900,1900,3800,3800,3800,1900,1900,1900,0.0399,0.0399,0.0399,'5','5','5'),(149,135,157.5,180,39.1341414315929,43.7636850417776,48.4382569368922,1,1,1,0,0,0,2000,2000,2000,0,0,0,0.21,'Local',0.0001,135,157.5,180,136,158.5,181,2174.13414143159,2201.26368504178,2228.43825693689,0.0456568169700634,0.0462265373858773,0.0467972033956747,'5','5','5'),(157,1900,1900,1900,0,0,0,1900,1900,1900,0,0,0,0,0,0,0,0,0,0.21,'Local',0.0000306,1900,1900,1900,3800,3800,3800,1900,1900,1900,0.0122094,0.0122094,0.0122094,'5','5','5'),(158,1900,1900,1900,0,0,0,1900,1900,1900,0,0,0,0,0,0,0,0,0,0.21,'Local',0.0000306,1900,1900,1900,3800,3800,3800,1900,1900,1900,0.0122094,0.0122094,0.0122094,'5','5','5'),(177,1390,1390,1390,0,0,0,1390,1390,1390,0,0,0,0,0,0,0,0,0,0.1,'Local',0.000722,1390,1390,1390,2780,2780,2780,1390,1390,1390,0.100358,0.100358,0.100358,'5','5','5'),(181,1900,1900,1900,0,0,0,1900,1900,1900,0,0,0,0,0,0,0,0,0,0.1,'Local',0.0000306,1900,1900,1900,3800,3800,3800,1900,1900,1900,0.005814,0.005814,0.005814,'5','5','5'),(220,1900,1900,1900,0,0,0,1900,1900,1900,0,0,0,0,0,0,0,0,0,0.21,'Local',0.0000306,1900,1900,1900,3800,3800,3800,1900,1900,1900,0.0122094,0.0122094,0.0122094,'5','5','5'),(222,1390,1390,1390,0,0,0,1390,1390,1390,0,0,0,0,0,0,0,0,0,0.1,'Local',0.000722,1390,1390,1390,2780,2780,2780,1390,1390,1390,0.100358,0.100358,0.100358,'5','5','5'),(225,1390,1390,1390,0,0,0,1390,1390,1390,0,0,0,0,0,0,0,0,0,0.1,'Local',0.000722,1390,1390,1390,2780,2780,2780,1390,1390,1390,0.100358,0.100358,0.100358,'5','5','5'),(228,1390,1390,1390,0,0,0,1390,1390,1390,0,0,0,0,0,0,0,0,0,0.1,'Local',0.000722,1390,1390,1390,2780,2780,2780,1390,1390,1390,0.100358,0.100358,0.100358,'5','5','5'),(231,1900,1900,1900,0,0,0,1900,1900,1900,0,0,0,0,0,0,0,0,0,0.1,'Local',0.0001,1900,1900,1900,3800,3800,3800,1900,1900,1900,0.019,0.019,0.019,'5','5','5'),(247,4,4,4,0,0,0,4,4,4,0,0,0,0,0,0,0,0,0,0.1,'Local',0.000722,4,4,4,8,8,8,4,4,4,0.0002888,0.0002888,0.0002888,'2','2','2'),(261,0.15,0.15,0.15,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0.21,'Local',0.0000306,1,1,1,1.15,1.15,1.15,1,1,1,0.000006426,0.000006426,0.000006426,'1','1','1'),(291,4.5,4.5,4.5,0,1674.18476105086,3588.69359655395,1,1,1,0,0,0,0,0,0,0,0,0,0.1,'Local',0.0001,4.5,4.5,4.5,5.5,5.5,5.5,4.5,1678.68476105086,3593.19359655395,0.000045,0.0167868476105086,0.0359319359655395,'2','5','5'),(298,612,612,612,39.1341414315929,43.7636850417776,48.4382569368922,1900,1900,1900,0,0,0,1,1,1,0,0,0,0.21,'Local',0.0000306,1900,1900,1900,2512,2512,2512,1940.13414143159,1944.76368504178,1949.43825693689,0.0124673019928394,0.0124970514400785,0.0125270902390765,'5','5','5'),(306,5700,5700,5700,0,0,0,1900,1900,1900,0,0,0,0,0,0,0,0,0,0.1,'Local',0.0001,5700,5700,5700,7600,7600,7600,5700,5700,5700,0.057,0.057,0.057,'5','5','5'),(312,525,525,600,39.1648469169466,43.7947041166165,48.4695634278636,20,20,20,0,0,0,0,0,0,0,0,0,0.21,'Local',0.0000306,525,525,600,545,545,620,564.164846916947,568.794704116616,648.469563427864,0.0036253233062883,0.00365507476865338,0.00416706541458745,'4','4','4'),(346,63,119,119,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0.21,'Local',0.0000306,63,119,119,64,120,120,63,119,119,0.000404838,0.000764694,0.000764694,'3','4','4'),(347,607.5,675,675,152691.933588444,175352.024315698,198282.156938613,650,650,650,0,0,0,0,0,0,0,0,0,0.21,'Local',0.0000306,650,675,675,1257.5,1325,1325,153341.933588444,176027.024315698,198957.156938613,0.985375265239339,1,1,'5','5','5'),(348,0.1,0.4,3.2,0,16741.8476105086,35886.9359655395,900,900,900,1022,1022,1022,0,0,0,0,0,0,0.21,'Local',0.0001,900,900,900,900.1,900.4,903.2,1922,18663.8476105086,37808.9359655395,0.040362,0.39194079982068,0.793987655276329,'5','5','5'),(349,0.1,0.4,3.2,0,16741.8476105086,35886.9359655395,863.844026224423,863.844026224423,863.844026224423,1022,1022,1022,0,0,0,0,0,0,0.21,'Local',0.000722,863.844026224423,863.844026224423,863.844026224423,863.944026224423,864.244026224423,867.044026224423,1885.84402622442,18627.691636733,37772.7799917639,0.285931671256147,1,1,'5','5','5'),(350,0.1,0.4,3.2,0,16741.8476105086,35886.9359655395,865.015532670584,865.015532670584,865.015532670584,1022,1022,1022,0,0,0,0,0,0,0.21,'Local',0.000722,865.015532670584,865.015532670584,865.015532670584,865.115532670584,865.415532670584,868.215532670584,1887.01553267058,18628.8631431792,37773.9514982101,0.286109295063514,1,1,'5','5','5');
/*!40000 ALTER TABLE `rw_full_pof` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rw_input_ca_level1`
--

DROP TABLE IF EXISTS `rw_input_ca_level1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rw_input_ca_level1` (
  `ID` int(11) NOT NULL,
  `API_FLUID` varchar(50) DEFAULT NULL,
  `SYSTEM` varchar(50) DEFAULT NULL,
  `Release_Duration` varchar(50) DEFAULT NULL,
  `Detection_Type` varchar(50) DEFAULT NULL,
  `Isulation_Type` varchar(50) DEFAULT NULL,
  `Mitigation_System` varchar(150) DEFAULT NULL,
  `Equipment_Cost` double DEFAULT NULL,
  `Injure_Cost` double DEFAULT NULL,
  `Evironment_Cost` double DEFAULT NULL,
  `Toxic_Percent` double DEFAULT NULL,
  `Personal_Density` double DEFAULT NULL,
  `Material_Cost` double DEFAULT NULL,
  `Production_Cost` double DEFAULT NULL,
  `Mass_Inventory` double DEFAULT NULL,
  `Mass_Component` double DEFAULT NULL,
  `Stored_Pressure` double DEFAULT NULL,
  `Stored_Temp` double DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rw_input_ca_level1`
--

LOCK TABLES `rw_input_ca_level1` WRITE;
/*!40000 ALTER TABLE `rw_input_ca_level1` DISABLE KEYS */;
INSERT INTO `rw_input_ca_level1` VALUES (68,'C1-C2','Vapor',NULL,'C','C','Fire water deluge system and monitors',2000,5000000,0,0,0.005,1,50000,12400,24000,1379,20),(76,'C1-C2','Vapor',NULL,'C','C','Inventory blowdown, couple with isolation system classification B or higher',5000,5000000,0,0,0.01,1,50000,12468,24154,1379,27),(80,'C1-C2','Vapor',NULL,'C','C','Inventory blowdown, couple with isolation system classification B or higher',2000,5000000,0,0,0.01,1,50000,12468,24154,1379,27),(99,'C1-C2','Vapor',NULL,'C','C','Inventory blowdown, couple with isolation system classification B or higher',2000,500000,0,0,0.002,1,50000,12468,24154,1379,27),(123,'Steam','Vapor',NULL,'C','C','Fire water monitors only',0,5000000,0,0,0.01,1.2,50000,12135,24123,2758,20),(124,'AlCl3','Liquid','All','C','C','Fire water deluge system and monitors',0,5000000,0,10,0.001,1.2,50000,12458,24121,303.38,27),(142,'Acid','Liquid',NULL,'A','A','Fire water deluge system and monitors',0,0,0,0,0,0,0,0,0,0,0),(146,'Acid','Liquid',NULL,'A','A','Fire water deluge system and monitors',0,0,0,0,0,0,0,0,0,0,0),(148,'Acid','Liquid',NULL,'A','A','Fire water deluge system and monitors',0,0,0,0,0,0,0,0,0,0,0),(149,'Acid','Liquid',NULL,'A','A','Foam spray system',10000,500000,0,0,0.001,1.5,200000,1200,1500,1379,40),(157,'Acid','Liquid',NULL,'A','A','Fire water deluge system and monitors',0,0,0,0,0,0,0,0,0,0,0),(158,'Acid','Liquid',NULL,'A','A','Fire water deluge system and monitors',0,0,0,0,0,0,0,0,0,0,0),(181,'C1-C2','Vapor',NULL,'A','A','Fire water deluge system and monitors',0,0,0,0,0,0,0,0,0,0,0),(220,'Acid','Liquid',NULL,'A','A','Fire water deluge system and monitors',0,0,0,0,0,0,0,0,0,0,0),(261,'C1-C2','Vapor',NULL,'C','C','Foam spray system',1500,100000,0,0,0.0001,1,50000,1200,2000,1379,20),(298,'Acid','Liquid',NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,0,0,0,0),(312,'C1-C2','Vapor',NULL,'C','C','Inventory blowdown, couple with isolation system classification B or higher',2000,500000,0,0,0.002,1,50000,12468,24154,1379,27),(346,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(347,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `rw_input_ca_level1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rw_input_ca_tank`
--

DROP TABLE IF EXISTS `rw_input_ca_tank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rw_input_ca_tank` (
  `ID` int(11) NOT NULL,
  `FLUID_HEIGHT` double DEFAULT NULL,
  `SHELL_COURSE_HEIGHT` double DEFAULT NULL,
  `TANK_DIAMETTER` double DEFAULT NULL,
  `Prevention_Barrier` smallint(6) DEFAULT NULL,
  `Environ_Sensitivity` varchar(50) DEFAULT NULL,
  `P_lvdike` double DEFAULT NULL,
  `P_onsite` double DEFAULT NULL,
  `P_offsite` double DEFAULT NULL,
  `Soil_Type` varchar(150) DEFAULT NULL,
  `TANK_FLUID` varchar(150) DEFAULT NULL,
  `API_FLUID` varchar(50) DEFAULT NULL,
  `SW` double DEFAULT NULL,
  `ProductionCost` double DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rw_input_ca_tank`
--

LOCK TABLES `rw_input_ca_tank` WRITE;
/*!40000 ALTER TABLE `rw_input_ca_tank` DISABLE KEYS */;
INSERT INTO `rw_input_ca_tank` VALUES (177,12,NULL,11.99,0,'Low',12,10,2,'Coarse Sand','Light Diesel Oil','C9-C12',0,10000),(222,0,0,99,0,'High',0,0,0,'Coarse Sand','Gasoline','C6-C8',0,0),(225,0,0,0,0,'High',0,0,0,'Coarse Sand','Gasoline','C6-C8',0,0),(228,0,0,0,0,'High',0,0,0,'Coarse Sand','Gasoline','C6-C8',0,0),(231,0,2,9.04,0,'High',0,0,0,'Coarse Sand','Gasoline','C6-C8',0,0),(247,0,NULL,7,0,'High',0,0,0,'Coarse Sand','Gasoline','C6-C8',0,0),(291,12,1.2,99,0,'High',3,2,2,'Clay','Gasoline','C6-C8',NULL,20000),(306,0,0,0,0,NULL,0,0,0,'Coarse Sand',NULL,'C25+',NULL,0),(348,45,12,20,1,'High',10,20,30,'Coarse Sand','Light Diesel Oil','C9-C12',5,NULL),(349,45,12,20,1,'High',10,20,30,'Coarse Sand','Light Diesel Oil','C9-C12',5,NULL),(350,45,12,20,1,'High',10,20,30,'Coarse Sand','Light Diesel Oil','C9-C12',5,NULL);
/*!40000 ALTER TABLE `rw_input_ca_tank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rw_inspection_history`
--

DROP TABLE IF EXISTS `rw_inspection_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rw_inspection_history` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `InspectionPlanName` varchar(100) DEFAULT NULL,
  `InspectionCoverageName` varchar(100) DEFAULT NULL,
  `EquipmentNumber` varchar(50) DEFAULT NULL,
  `ComponentNumber` varchar(50) DEFAULT NULL,
  `DM` varchar(150) DEFAULT NULL,
  `InspectionType` varchar(250) DEFAULT NULL,
  `InspectionDate` datetime DEFAULT NULL,
  `InspectionEffective` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rw_inspection_history`
--

LOCK TABLES `rw_inspection_history` WRITE;
/*!40000 ALTER TABLE `rw_inspection_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `rw_inspection_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rw_material`
--

DROP TABLE IF EXISTS `rw_material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rw_material` (
  `ID` int(11) NOT NULL,
  `MaterialName` varchar(100) DEFAULT NULL,
  `DesignPressure` double DEFAULT NULL,
  `DesignTemperature` double DEFAULT NULL,
  `MinDesignTemperature` double DEFAULT NULL,
  `BrittleFractureThickness` double DEFAULT NULL,
  `CorrosionAllowance` double DEFAULT NULL,
  `SigmaPhase` double DEFAULT NULL,
  `SulfurContent` varchar(50) DEFAULT NULL,
  `HeatTreatment` varchar(50) DEFAULT NULL,
  `ReferenceTemperature` double DEFAULT NULL,
  `PTAMaterialCode` varchar(70) DEFAULT NULL,
  `HTHAMaterialCode` varchar(50) DEFAULT NULL,
  `IsPTA` smallint(6) DEFAULT NULL,
  `IsHTHA` smallint(6) DEFAULT NULL,
  `Austenitic` smallint(6) DEFAULT NULL,
  `Temper` smallint(6) DEFAULT NULL,
  `CarbonLowAlloy` smallint(6) DEFAULT NULL,
  `NickelBased` smallint(6) DEFAULT NULL,
  `ChromeMoreEqual12` smallint(6) DEFAULT NULL,
  `AllowableStress` double DEFAULT NULL,
  `CostFactor` double DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rw_material`
--

LOCK TABLES `rw_material` WRITE;
/*!40000 ALTER TABLE `rw_material` DISABLE KEYS */;
INSERT INTO `rw_material` VALUES (68,'adsad',12000,1000,17,1,3.17,1,'High > 0.01%','Normalised Temper',21,'321 Stainless Stee','1Cr-0.5Mo',1,1,0,0,0,0,0,240,1),(76,'vuna material',1300,120,-1,2.3,3.17,10,'High > 0.01%','None',2,NULL,NULL,0,0,0,0,0,0,0,600,1),(80,'vuna material',1300,120,-1,2.3,3.17,10,'Low 0.002 - 0.01%','None',2,NULL,NULL,0,0,0,0,0,0,0,600,1),(99,'vuna material',1300,120,-1,2.3,3.17,10,'Low 0.002 - 0.01%','None',2,NULL,NULL,0,0,0,0,0,1,0,600,1),(123,'vuna material',1500,140,-28,2,2.7,10,'Low 0.002 - 0.01%','None',2.5,'347 Stainless Steel, Alloy 20, Alloy 625, All austenitic weld overlay','1Cr-0.5Mo',1,1,1,1,1,1,1,1200,1.2),(124,'vuna material',200,200,0,0.3,2.9,1,'Low 0.002 - 0.01%','Normalised Temper',2.7,'321 Stainless Stee','1.25Cr-0.5Mo',1,1,1,1,1,1,1,132,1.2),(142,'adsad',0,0,0,0,0,0,'High > 0.01%','Annealed',0,NULL,NULL,0,0,0,0,0,0,0,0,0),(146,'adsad',0,0,0,0,0,0,'High > 0.01%','Annealed',0,NULL,NULL,0,0,0,0,0,0,0,0,0),(148,'adsad',0,0,0,0,0,0,'Ultra Low < 0.002%','Annealed',0,NULL,NULL,0,0,0,0,0,0,0,0,0),(149,'adsad',2000,1000,-20,3.5,0.17,10,'Low 0.002 - 0.01%','None',2.7,'321 Stainless Stee','1Cr-0.5Mo',1,1,1,0,0,0,1,400,1.5),(157,'material demo',0,0,0,0,0,0,'High > 0.01%','Annealed',0,'321 Stainless Stee','1.25Cr-0.5Mo',0,0,0,0,0,0,0,0,0),(158,'material demo',0,0,0,0,0,0,'High > 0.01%','Annealed',0,'321 Stainless Stee','1.25Cr-0.5Mo',0,0,0,0,0,0,0,0,0),(177,'abc',0,0,0,0,0,NULL,'High > 0.01%','Annealed',0,NULL,NULL,0,0,0,0,0,0,0,0,1),(181,'vuna material',0,0,0,0,0,0,'High > 0.01%','Annealed',0,'321 Stainless Stee','1.25Cr-0.5Mo',0,0,0,0,0,0,0,0,0),(220,'material demo',0,0,0,0,0,0,'High > 0.01%','Annealed',0,'321 Stainless Stee','1.25Cr-0.5Mo',0,0,0,0,0,0,0,0,0),(222,'vuna shell material',0,0,0,0,0,NULL,'High > 0.01%','Annealed',0,'321 Stainless Stee',NULL,0,0,0,0,0,0,0,0,0),(225,'vuna shell material',0,0,0,0,0,NULL,'High > 0.01%','Annealed',0,'321 Stainless Stee',NULL,0,0,0,0,0,0,0,0,0),(228,'vuna shell material',0,0,0,0,0,NULL,'High > 0.01%','Annealed',0,'321 Stainless Stee',NULL,0,0,0,0,0,0,0,0,0),(231,'vuna shell material',0,0,0,0,0,NULL,'High > 0.01%','Annealed',0,'321 Stainless Stee',NULL,0,0,0,0,0,0,0,0,0),(247,'demo',0,0,0,0,0,NULL,'High > 0.01%','Annealed',0,NULL,NULL,0,0,0,0,0,0,0,0,0),(261,'MTA',0,0,0,0,0,0,NULL,NULL,0,NULL,NULL,0,0,0,0,0,0,0,0,1),(291,'VuNA material',1000,350,-20,1.7,0,NULL,'Ultra Low < 0.002%','None',2.7,NULL,NULL,1,0,1,0,1,0,0,1.7,1.2),(298,'1',0,0,0,0,0,0,NULL,NULL,0,'347 Stainless Steel, Alloy 20, Alloy 625, All austenitic weld overlay','1Cr-0.5Mo',1,1,0,0,0,0,0,0,0),(306,'aaa',0,0,0,0,0,NULL,NULL,NULL,0,NULL,NULL,0,0,0,0,0,0,0,0,0),(312,'hoang',1300,120,-1,2.3,3.17,10,'Low 0.002 - 0.01%','None',2,NULL,NULL,0,0,0,0,0,1,0,600,1),(346,'Inox',100.9,400.2,100.5,30.2,11.6,2.1,'Ultra Low < 0.002%','None',160.2,'Not Applicable','1.25Cr-0.5Mo',0,0,0,0,0,0,1,300.5,2.2),(347,'Inox',100,200,100,60,11,60,'Ultra Low < 0.002%','Sub Critical PWHT',160,'L Grade 300 series Stainless Steels','C-0.5Mo (Annealed)',0,0,0,0,1,1,1,500,1),(348,'silver',23,1120,5,11,12,NULL,'Low 0.002 - 0.01%','Normalised Temper',53,'Regular 300 series Stainless Steels and Alloys 600 and 800',NULL,1,0,1,0,1,1,1,500,12),(349,'silver',23,1120,5,11,12,NULL,'Low 0.002 - 0.01%','Normalised Temper',53,'Regular 300 series Stainless Steels and Alloys 600 and 800',NULL,1,0,1,0,1,1,1,500,12),(350,'silver',23,1120,5,11,12,NULL,'Low 0.002 - 0.01%','Normalised Temper',53,'Regular 300 series Stainless Steels and Alloys 600 and 800',NULL,1,0,1,0,1,1,1,500,12);
/*!40000 ALTER TABLE `rw_material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rw_stream`
--

DROP TABLE IF EXISTS `rw_stream`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rw_stream` (
  `ID` int(11) NOT NULL,
  `AmineSolution` varchar(50) DEFAULT NULL,
  `AqueousOperation` smallint(6) DEFAULT NULL,
  `AqueousShutdown` smallint(6) DEFAULT NULL,
  `ToxicConstituent` smallint(6) DEFAULT NULL,
  `Caustic` smallint(6) DEFAULT NULL,
  `Chloride` double DEFAULT NULL,
  `CO3Concentration` double DEFAULT NULL,
  `Cyanide` smallint(6) DEFAULT NULL,
  `ExposedToGasAmine` smallint(6) DEFAULT NULL,
  `ExposedToSulphur` smallint(6) DEFAULT NULL,
  `ExposureToAmine` varchar(50) DEFAULT NULL,
  `H2S` smallint(6) DEFAULT NULL,
  `H2SInWater` double DEFAULT NULL,
  `Hydrogen` smallint(6) DEFAULT NULL,
  `H2SPartialPressure` double DEFAULT NULL,
  `Hydrofluoric` smallint(6) DEFAULT NULL,
  `MaterialExposedToClInt` smallint(6) DEFAULT NULL,
  `MaxOperatingPressure` double DEFAULT NULL,
  `MaxOperatingTemperature` double DEFAULT NULL,
  `MinOperatingPressure` double DEFAULT NULL,
  `MinOperatingTemperature` double DEFAULT NULL,
  `CriticalExposureTemperature` double DEFAULT NULL,
  `NaOHConcentration` double DEFAULT NULL,
  `ReleaseFluidPercentToxic` double DEFAULT NULL,
  `WaterpH` double DEFAULT NULL,
  `TankFluidName` varchar(50) DEFAULT NULL,
  `FluidHeight` double DEFAULT NULL,
  `FluidLeaveDikePercent` double DEFAULT NULL,
  `FluidLeaveDikeRemainOnSitePercent` double DEFAULT NULL,
  `FluidGoOffSitePercent` double DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rw_stream`
--

LOCK TABLES `rw_stream` WRITE;
/*!40000 ALTER TABLE `rw_stream` DISABLE KEYS */;
INSERT INTO `rw_stream` VALUES (68,'Diglycolamine DGA',0,0,1,0,1000,0,0,0,0,'Low Lean Amine',0,1000,0,10000,0,0,1000,100,200,20,80,12,1,5,NULL,NULL,NULL,NULL,NULL),(76,'Diglycolamine DGA',0,0,1,0,1000,0,0,0,0,'Low Lean Amine',1,100,0,1000,0,1,500,100,200,27,800,2,10,5,NULL,NULL,NULL,NULL,NULL),(80,'Diglycolamine DGA',0,0,1,0,1000,0,0,0,0,'Low Lean Amine',0,100,0,1000,0,0,500,100,200,27,800,2,10,5,NULL,NULL,NULL,NULL,NULL),(99,'Diglycolamine DGA',1,1,1,1,1000,0,0,1,1,'Low Lean Amine',1,100,1,1000,1,1,500,100,200,27,800,2,10,5,NULL,NULL,NULL,NULL,NULL),(123,'Diglycolamine DGA',1,1,1,1,0,0,1,1,1,'Low Lean Amine',1,0,1,1200,1,1,1000,127,400,20,135,10,1,9,NULL,NULL,NULL,NULL,NULL),(124,'Diethanolamine DEA',0,0,0,0,0,0,0,0,0,'High Rich Amine',0,0,0,0,0,0,102,120,44,27,150,0,0,7,NULL,NULL,NULL,NULL,NULL),(142,'Diethanolamine DEA',0,0,0,0,0,0,0,0,0,'High Rich Amine',0,0,0,0,0,0,0,0,0,0,0,0,0,7,NULL,NULL,NULL,NULL,NULL),(146,'Diethanolamine DEA',0,0,0,0,0,0,0,0,0,'High Rich Amine',0,0,0,0,0,0,0,0,0,0,0,0,0,7,NULL,NULL,NULL,NULL,NULL),(148,'Diethanolamine DEA',0,0,0,0,0,0,0,0,0,'High Rich Amine',0,0,0,0,0,0,0,0,0,0,0,0,0,7,NULL,NULL,NULL,NULL,NULL),(149,'Sulfinol',1,1,0,0,0,0,0,1,0,'None',0,0,1,500,1,0,600,70,200,40,120,0,0,7,NULL,NULL,NULL,NULL,NULL),(157,'Diethanolamine DEA',0,0,0,0,0,0,0,0,0,'High Rich Amine',0,0,0,0,0,0,0,0,0,0,0,0,0,7,NULL,NULL,NULL,NULL,NULL),(158,'Diethanolamine DEA',0,0,0,0,0,0,0,0,0,'High Rich Amine',0,0,0,0,0,0,0,0,0,0,0,0,0,7,NULL,NULL,NULL,NULL,NULL),(177,'Diethanolamine DEA',0,0,0,0,0,0,0,0,0,'High Rich Amine',0,0,0,12,0,0,0,0,0,0,0,0,0,7,'Light Diesel Oil',12,12,10,2),(181,'Diethanolamine DEA',0,0,0,0,0,0,0,0,0,'High Rich Amine',0,0,0,0,0,0,0,0,0,0,0,0,0,7,NULL,NULL,NULL,NULL,NULL),(220,'Diethanolamine DEA',0,0,0,0,0,0,0,0,0,'High Rich Amine',0,0,0,0,0,0,0,0,0,0,0,0,0,7,NULL,NULL,NULL,NULL,NULL),(222,'Diethanolamine DEA',0,0,0,0,0,0,0,0,0,'High Rich Amine',0,0,0,0,0,0,0,0,0,0,0,0,0,7,'Gasoline',0,0,0,0),(225,'Diethanolamine DEA',0,0,0,0,0,0,0,0,0,'High Rich Amine',0,0,0,0,0,0,0,0,0,0,0,0,0,7,'Gasoline',0,0,0,0),(228,'Diethanolamine DEA',0,0,0,0,0,0,0,0,0,'High Rich Amine',0,0,0,0,0,0,0,0,0,0,0,0,0,7,'Gasoline',0,0,0,0),(231,'Diethanolamine DEA',0,0,0,0,0,0,0,0,0,'High Rich Amine',0,0,0,0,0,0,0,0,0,0,0,0,0,7,'Gasoline',0,0,0,0),(247,'Diethanolamine DEA',0,0,0,0,0,0,0,0,0,'High Rich Amine',0,0,0,0,0,0,0,0,0,0,0,0,0,7,'Gasoline',0,0,0,0),(261,'Sulfinol',0,0,0,0,0,0,0,0,0,'None',0,0,0,1100,0,0,500,80,200,20,70,10,0,9,NULL,NULL,NULL,NULL,NULL),(291,'Monoethanolamine MEA',0,0,0,0,0,0,0,1,0,'Low Lean Amine',0,0,0,500,0,0,600,120,200,20,200,0,0,7,'Gasoline',12,3,2,2),(298,NULL,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,7,NULL,NULL,NULL,NULL,NULL),(306,NULL,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,7,NULL,0,0,0,0),(312,'Diglycolamine DGA',1,1,1,1,1000,0,0,1,1,'Low Lean Amine',1,100,1,1000,1,1,500,100,200,27,800,2,10,5,NULL,NULL,NULL,NULL,NULL),(346,'Diethanolamine DEA',0,0,1,0,100,300,0,0,0,'None',0,400,0,300,1,0,500,200,200,-2,100,10,20,10,NULL,NULL,NULL,NULL,NULL),(347,'Sulfinol',1,1,1,1,100,300,0,0,1,'Low Lean Amine',0,400,0,2000,1,1,900,150,200,-2,100,10,20,10,NULL,NULL,NULL,NULL,NULL),(348,'Diglycolamine DGA',1,1,1,1,200,300,1,1,1,'Low Lean Amine',1,112,1,1000,1,1,900,500,40,10,565,45,12,9,'Light Diesel Oil',45,10,20,30),(349,'Diglycolamine DGA',1,1,1,1,200,300,1,1,1,'Low Lean Amine',1,112,1,1000,1,1,900,500,40,10,565,45,12,9,'Light Diesel Oil',45,10,20,30),(350,'Diglycolamine DGA',1,1,1,1,200,300,1,1,1,'Low Lean Amine',1,112,1,1000,1,1,900,500,40,10,565,45,12,9,'Light Diesel Oil',45,10,20,30);
/*!40000 ALTER TABLE `rw_stream` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sites` (
  `SiteID` int(11) NOT NULL AUTO_INCREMENT,
  `SiteName` varchar(100) DEFAULT NULL,
  `Create` datetime DEFAULT NULL,
  PRIMARY KEY (`SiteID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
INSERT INTO `sites` VALUES (3,'SITE','2018-03-15 11:54:10'),(4,'VUNA2','2018-03-15 11:54:10'),(8,'SITE1','2018-03-15 11:54:10'),(9,'VUNATEST','2018-03-15 11:54:10'),(11,'POSTGRES demo','2018-03-15 11:54:10');
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_204_dm_htha`
--

DROP TABLE IF EXISTS `tbl_204_dm_htha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_204_dm_htha` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Susceptibility` longtext,
  `No Inspection` int(11) DEFAULT NULL,
  `1D` int(11) DEFAULT NULL,
  `1C` int(11) DEFAULT NULL,
  `1B` int(11) DEFAULT NULL,
  `2D` int(11) DEFAULT NULL,
  `2C` int(11) DEFAULT NULL,
  `2B` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_204_dm_htha`
--

LOCK TABLES `tbl_204_dm_htha` WRITE;
/*!40000 ALTER TABLE `tbl_204_dm_htha` DISABLE KEYS */;
INSERT INTO `tbl_204_dm_htha` VALUES (1,'Damage',0,2000,2000,2000,2000,2000,2000),(2,'High',2000,1800,1200,800,1600,800,400),(3,'Low',20,18,12,8,16,8,4),(4,'Medium',200,180,120,80,160,80,40),(5,'Not',1,1,1,1,1,1,1);
/*!40000 ALTER TABLE `tbl_204_dm_htha` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_213_dm_impact_exemption`
--

DROP TABLE IF EXISTS `tbl_213_dm_impact_exemption`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_213_dm_impact_exemption` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ComponentThickness` double DEFAULT NULL,
  `CurveA` double DEFAULT NULL,
  `CurveB` double DEFAULT NULL,
  `CurveC` double DEFAULT NULL,
  `CurveD` double DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_213_dm_impact_exemption`
--

LOCK TABLES `tbl_213_dm_impact_exemption` WRITE;
/*!40000 ALTER TABLE `tbl_213_dm_impact_exemption` DISABLE KEYS */;
INSERT INTO `tbl_213_dm_impact_exemption` VALUES (1,0.25,18,-20,-55,-55),(2,0.3125,18,-20,-55,-55),(3,0.375,18,-20,-55,-55),(4,0.4375,24.2,-14,-40.5,-55),(5,0.5,31.6,-6.9,-32.2,-55),(6,0.5625,38.2,-0.6,-27.2,-51),(7,0.625,44,5.2,-22.8,-47.5),(8,0.6875,49.2,10.4,-18.7,-44.2),(9,0.75,53.9,15.1,-15,-41.1),(10,0.8125,58.2,19.5,-11.6,-38.1),(11,0.875,62.1,23.5,-8.6,-35.3),(12,0.9375,65.6,27.2,-5.7,-32.7),(13,1,68.9,30.6,-3.1,-30.1),(14,1.0625,71.9,33.8,-0.7,-27.8),(15,1.125,74.6,36.7,1.6,-25.5),(16,1.1875,77.2,39.4,3.7,-23.4),(17,1.25,79.6,42,5.8,-21.4),(18,1.3125,81.8,44.4,7.7,-19.5),(19,1.375,83.8,46.6,9.6,-17.6),(20,1.4375,85.8,48.7,11.4,-15.9),(21,1.5,87.6,50.7,13.1,-14.3),(22,1.5625,89.2,52.5,14.8,-12.7),(23,1.625,90.8,54.3,16.4,-11.2),(24,1.6875,92.3,55.9,17.9,-9.8),(25,1.75,93.7,57.5,19.4,-8.5),(26,1.8125,95.1,58.9,20.9,-7.2),(27,1.875,96.3,60.3,22.3,-5.9),(28,1.9375,97.5,61.7,23.7,-4.7),(29,2,98.6,63,25,-3.6),(30,2.0625,99.7,64.2,26.3,-2.5),(31,2.125,100.7,65.3,27.5,-1.4),(32,2.1875,101.7,66.4,28.7,-0.4),(33,2.25,102.6,67.5,29.9,0.6),(34,2.3125,103.5,68.5,31,1.6),(35,2.375,104.3,69.5,32.1,2.5),(36,2.4375,105.1,70.5,33.2,3.4),(37,2.5,105.8,71.4,34.3,4.3),(38,2.5625,106.5,72.3,35.3,5.2),(39,2.625,107.2,73.2,36.3,6),(40,2.6875,107.9,74,37.2,6.9),(41,2.75,108.5,74.8,38.2,7.7),(42,2.8125,109.1,75.6,39.1,8.5),(43,2.875,109.7,76.4,39.9,9.3),(44,2.9375,110.2,77.2,40.8,10.1),(45,3,110.8,77.9,41.7,10.9),(46,3.0625,111.3,78.7,42.5,11.7),(47,3.125,111.7,79.4,43.3,12.4),(48,3.1875,112.2,80.1,44,13.2),(49,3.25,112.6,80.8,44.8,13.9),(50,3.3125,113.1,81.5,45.5,14.7);
/*!40000 ALTER TABLE `tbl_213_dm_impact_exemption` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_214_dm_not_pwht`
--

DROP TABLE IF EXISTS `tbl_214_dm_not_pwht`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_214_dm_not_pwht` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Tmin-Tref` int(11) DEFAULT NULL,
  `6.4` double DEFAULT NULL,
  `12.7` double DEFAULT NULL,
  `25.4` double DEFAULT NULL,
  `38.1` double DEFAULT NULL,
  `50.8` double DEFAULT NULL,
  `63.5` double DEFAULT NULL,
  `76.2` double DEFAULT NULL,
  `88.9` double DEFAULT NULL,
  `101.6` double DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_214_dm_not_pwht`
--

LOCK TABLES `tbl_214_dm_not_pwht` WRITE;
/*!40000 ALTER TABLE `tbl_214_dm_not_pwht` DISABLE KEYS */;
INSERT INTO `tbl_214_dm_not_pwht` VALUES (1,-73,4,61,579,1436,2336,3160,3883,4509,5000),(2,-62,3,46,474,1239,2080,2873,3581,4203,4746),(3,-51,2,30,350,988,1740,2479,3160,3769,4310),(4,-40,2,16,220,697,1317,1969,2596,3176,3703),(5,-29,1.2,7,109,405,850,1366,1897,2415,2903),(6,-18,0.9,3,39,175,424,759,1142,1545,1950),(7,-7,0.1,1.3,10,49,143,296,500,741,1008),(8,4,0,0.7,2,9,29,69,133,224,338),(9,16,0,0,1,2,4,9,19,36,60),(10,27,0,0,0,0.8,1.1,2,2,4,6),(11,38,0,0,0,0,0,0,0.9,1.1,1.2);
/*!40000 ALTER TABLE `tbl_214_dm_not_pwht` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_215_dm_pwht`
--

DROP TABLE IF EXISTS `tbl_215_dm_pwht`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_215_dm_pwht` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Tmin-Tref` int(11) DEFAULT NULL,
  `6.4` double DEFAULT NULL,
  `12.7` double DEFAULT NULL,
  `25.4` double DEFAULT NULL,
  `38.1` double DEFAULT NULL,
  `50.8` double DEFAULT NULL,
  `63.5` double DEFAULT NULL,
  `76.2` double DEFAULT NULL,
  `88.9` double DEFAULT NULL,
  `101.6` double DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_215_dm_pwht`
--

LOCK TABLES `tbl_215_dm_pwht` WRITE;
/*!40000 ALTER TABLE `tbl_215_dm_pwht` DISABLE KEYS */;
INSERT INTO `tbl_215_dm_pwht` VALUES (1,-73,0,1.3,9,46,133,277,472,704,962),(2,-62,0,1.2,7,34,102,219,382,582,810),(3,-51,0,1.1,5,22,68,153,277,436,623),(4,-40,0,0.9,3,12,38,90,171,281,416),(5,-29,0,0.4,2,5,17,41,83,144,224),(6,-18,0,0,1.1,2,6,14,29,53,88),(7,-7,0,0,0.6,1.2,2,4,7,13,23),(8,4,0,0,0,0.5,1.1,1.3,2,3,4),(9,16,0,0,0,0,0,0.5,0.9,1.1,1.3),(10,27,0,0,0,0,0,0,0,0,0.2),(11,38,0,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `tbl_215_dm_pwht` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_3b21_si_conversion`
--

DROP TABLE IF EXISTS `tbl_3b21_si_conversion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_3b21_si_conversion` (
  `conversionFactory` int(11) NOT NULL AUTO_INCREMENT,
  `SIUnits` double DEFAULT NULL,
  `USUnits` double DEFAULT NULL,
  PRIMARY KEY (`conversionFactory`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_3b21_si_conversion`
--

LOCK TABLES `tbl_3b21_si_conversion` WRITE;
/*!40000 ALTER TABLE `tbl_3b21_si_conversion` DISABLE KEYS */;
INSERT INTO `tbl_3b21_si_conversion` VALUES (1,31623,12),(2,1000,1),(3,4536,10000),(4,2.205,1),(5,25.2,55.6),(6,55.6,100),(7,1,10.763),(8,0.0929,1),(9,0.123,0.6),(10,9.744,63.32),(11,0.145,1),(12,1.8,1),(13,6.29,0.178),(14,1,3600),(15,4.685,1),(16,30.89,70),(17,0.001481,0.00723),(18,0.005,0.0164),(19,1.085,1.015),(20,1.013,0.147),(21,5328,9590),(22,5.8,14.62),(23,0.45,0.346),(24,2.6,2.279),(25,0.0296,0.0438),(26,100,14.5),(27,1,0.3967),(28,1000,6895),(29,0.00043,0.000185),(30,0.0000000976,0.000000643),(31,864,7200),(32,0.543,107),(33,0.0815,16.03),(34,86.4,183000),(35,2.382,0.0259),(36,30.5,100);
/*!40000 ALTER TABLE `tbl_3b21_si_conversion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_511_dfb_thin`
--

DROP TABLE IF EXISTS `tbl_511_dfb_thin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_511_dfb_thin` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `art` double DEFAULT NULL,
  `E` int(11) DEFAULT NULL,
  `insp` int(11) DEFAULT NULL,
  `D` int(11) DEFAULT NULL,
  `C` int(11) DEFAULT NULL,
  `B` int(11) DEFAULT NULL,
  `A` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_511_dfb_thin`
--

LOCK TABLES `tbl_511_dfb_thin` WRITE;
/*!40000 ALTER TABLE `tbl_511_dfb_thin` DISABLE KEYS */;
INSERT INTO `tbl_511_dfb_thin` VALUES (1,0.02,1,1,1,1,1,1),(2,0.02,1,2,1,1,1,1),(3,0.02,1,3,1,1,1,1),(4,0.02,1,4,1,1,1,1),(5,0.02,1,5,1,1,1,1),(6,0.02,1,6,1,1,1,1),(7,0.04,1,1,1,1,1,1),(8,0.04,1,2,1,1,1,1),(9,0.04,1,3,1,1,1,1),(10,0.04,1,4,1,1,1,1),(11,0.04,1,5,1,1,1,1),(12,0.04,1,6,1,1,1,1),(13,0.06,1,1,1,1,1,1),(14,0.06,1,2,1,1,1,1),(15,0.06,1,3,1,1,1,1),(16,0.06,1,4,1,1,1,1),(17,0.06,1,5,1,1,1,1),(18,0.06,1,6,1,1,1,1),(19,0.08,1,1,1,1,1,1),(20,0.08,1,2,1,1,1,1),(21,0.08,1,3,1,1,1,1),(22,0.08,1,4,1,1,1,1),(23,0.08,1,5,1,1,1,1),(24,0.08,1,6,1,1,1,1),(25,0.1,2,1,2,1,1,1),(26,0.1,2,2,1,1,1,1),(27,0.1,2,3,1,1,1,1),(28,0.1,2,4,1,1,1,1),(29,0.1,2,5,1,1,1,1),(30,0.1,2,6,1,1,1,1),(31,0.12,6,1,5,3,2,1),(32,0.12,6,2,4,2,1,1),(33,0.12,6,3,3,1,1,1),(34,0.12,6,4,2,1,1,1),(35,0.12,6,5,2,1,1,1),(36,0.12,6,6,1,1,1,1),(37,0.14,20,1,17,10,6,1),(38,0.14,20,2,13,6,1,1),(39,0.14,20,3,10,3,1,1),(40,0.14,20,4,7,2,1,1),(41,0.14,20,5,5,1,1,1),(42,0.14,20,6,4,1,1,1),(43,0.16,90,1,70,50,20,3),(44,0.16,90,2,50,20,4,1),(45,0.16,90,3,40,10,1,1),(46,0.16,90,4,30,5,1,1),(47,0.16,90,5,20,2,1,1),(48,0.16,90,6,14,1,1,1),(49,0.18,250,1,200,130,70,7),(50,0.18,250,2,170,70,10,1),(51,0.18,250,3,130,35,3,1),(52,0.18,250,4,100,15,1,1),(53,0.18,250,5,70,7,1,1),(54,0.18,250,6,50,3,1,1),(55,0.2,400,1,300,210,110,15),(56,0.2,400,2,290,120,20,1),(57,0.2,400,3,260,60,5,1),(58,0.2,400,4,180,20,2,1),(59,0.2,400,5,120,10,1,1),(60,0.2,400,6,100,6,1,1),(61,0.25,520,1,450,290,150,20),(62,0.25,520,2,350,170,30,2),(63,0.25,520,3,240,80,6,1),(64,0.25,520,4,200,30,2,1),(65,0.25,520,5,150,15,2,1),(66,0.25,520,6,120,7,1,1),(67,0.3,650,1,550,400,200,30),(68,0.3,650,2,400,200,40,4),(69,0.3,650,3,320,110,9,2),(70,0.3,650,4,240,50,4,2),(71,0.3,650,5,180,25,3,2),(72,0.3,650,6,150,10,2,2),(73,0.35,750,1,650,550,300,80),(74,0.35,750,2,600,300,80,10),(75,0.35,750,3,540,150,20,5),(76,0.35,750,4,440,90,10,4),(77,0.35,750,5,350,70,6,4),(78,0.35,750,6,280,40,5,4),(79,0.4,900,1,800,700,400,130),(80,0.4,900,2,700,400,120,30),(81,0.4,900,3,600,200,50,10),(82,0.4,900,4,500,140,20,8),(83,0.4,900,5,400,110,10,8),(84,0.4,900,6,350,90,9,8),(85,0.45,1050,1,900,810,500,200),(86,0.45,1050,2,800,500,160,40),(87,0.45,1050,3,700,270,60,20),(88,0.45,1050,4,600,200,30,15),(89,0.45,1050,5,500,160,20,15),(90,0.45,1050,6,400,130,20,15),(91,0.5,1200,1,1100,970,600,270),(92,0.5,1200,2,1000,600,200,60),(93,0.5,1200,3,900,380,80,40),(94,0.5,1200,4,800,270,50,40),(95,0.5,1200,5,700,210,40,40),(96,0.5,1200,6,600,180,40,40),(97,0.55,1350,1,1200,1130,700,350),(98,0.55,1350,2,1100,750,300,100),(99,0.55,1350,3,1000,500,130,90),(100,0.55,1350,4,900,350,100,90),(101,0.55,1350,5,800,260,90,90),(102,0.55,1350,6,700,240,90,90),(103,0.6,1500,1,1400,1250,850,500),(104,0.6,1500,2,1300,900,400,230),(105,0.6,1500,3,1200,620,250,210),(106,0.6,1500,4,1000,450,220,210),(107,0.6,1500,5,900,360,210,210),(108,0.6,1500,6,800,300,210,210),(109,0.65,1900,1,1700,1400,1000,700),(110,0.65,1900,2,1600,1105,670,530),(111,0.65,1900,3,1300,880,550,500),(112,0.65,1900,4,1200,700,530,500),(113,0.65,1900,5,1100,840,500,500),(114,0.65,1900,6,1000,600,500,500);
/*!40000 ALTER TABLE `tbl_511_dfb_thin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_512_dfb_thin_tank_bottom`
--

DROP TABLE IF EXISTS `tbl_512_dfb_thin_tank_bottom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_512_dfb_thin_tank_bottom` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `art` double DEFAULT NULL,
  `E` int(11) DEFAULT NULL,
  `insp` int(11) DEFAULT NULL,
  `D` int(11) DEFAULT NULL,
  `C` int(11) DEFAULT NULL,
  `B` int(11) DEFAULT NULL,
  `A` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_512_dfb_thin_tank_bottom`
--

LOCK TABLES `tbl_512_dfb_thin_tank_bottom` WRITE;
/*!40000 ALTER TABLE `tbl_512_dfb_thin_tank_bottom` DISABLE KEYS */;
INSERT INTO `tbl_512_dfb_thin_tank_bottom` VALUES (1,0.05,4,1,1,1,1,1),(2,0.1,14,1,3,1,1,1),(3,0.15,32,1,8,2,1,1),(4,0.2,56,1,18,6,2,1),(5,0.25,87,1,32,11,4,3),(6,0.3,125,1,53,21,9,6),(7,0.35,170,1,80,36,16,12),(8,0.4,222,1,115,57,29,21),(9,0.45,281,1,158,86,47,36),(10,0.5,347,1,211,124,73,58),(11,0.55,420,1,273,173,109,89),(12,0.6,500,1,346,234,158,133),(13,0.65,587,1,430,309,222,192),(14,0.7,681,1,527,401,305,270),(15,0.75,782,1,635,510,409,370),(16,0.8,890,1,757,638,538,498),(17,0.85,1005,1,893,789,696,658),(18,0.9,1126,1,1044,963,888,856),(19,0.95,1255,1,1209,1163,1118,1098),(20,1,1390,1,1390,1390,1390,1390);
/*!40000 ALTER TABLE `tbl_512_dfb_thin_tank_bottom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_52_ca_properties_level_1`
--

DROP TABLE IF EXISTS `tbl_52_ca_properties_level_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_52_ca_properties_level_1` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Fluid` longtext,
  `MW` double DEFAULT NULL,
  `Density` double DEFAULT NULL,
  `NBP` double DEFAULT NULL,
  `Ambient` longtext,
  `ideal` int(11) DEFAULT NULL,
  `A` double DEFAULT NULL,
  `B` double DEFAULT NULL,
  `C` double DEFAULT NULL,
  `D` double DEFAULT NULL,
  `E` double DEFAULT NULL,
  `Auto` double DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_52_ca_properties_level_1`
--

LOCK TABLES `tbl_52_ca_properties_level_1` WRITE;
/*!40000 ALTER TABLE `tbl_52_ca_properties_level_1` DISABLE KEYS */;
INSERT INTO `tbl_52_ca_properties_level_1` VALUES (1,'Acid',18,62.3,212,'Liquid',3,276000,-2090,8.125,-0.0141,0.00000937,0),(2,'AlCl3',133.5,152,382,'Powder',1,43400,39700,417,24000,0,1036),(3,'C1-C2',23,15.639,-193,'Gas',1,12.3,0.115,-0.0000287,-0.0000000013,0,1036),(4,'C13-C16',205,47.728,502,'Liquid',1,-11.7,1.39,-0.000772,0.000000167,0,396),(5,'C17-C25',280,48.383,651,'Liquid',1,-22.4,1.94,-0.00112,-0.000000253,0,396),(6,'C25+',422,56.187,981,'Liquid',1,-22.4,1.94,-0.00112,-0.000000253,0,396),(7,'C3-C4',51,33.61,-6.3,'Gas',1,2.632,0.3188,-13470,0.00000001466,0,696),(8,'C5',72,39.03,97,'Liquid',1,-3.626,0.4873,-0.00026,0.000000053,0,544),(9,'C6-C8',100,42.702,210,'Liquid',1,-5.146,0.6762,-0.000365,0.00000007658,0,433),(10,'C9-C12',149,45.823,364,'Liquid',1,-8.5,1.01,-0.000556,0.000000118,0,406),(11,'CO',28,50,-312,'Gas',2,29100,8770,3090,8460,1540,1128),(12,'DEE',74,45,95,'Liquid',2,86200,255000,1540,144000,-689,320),(13,'EE',90,58,275,'Liquid',2,32500,300000,1170,208000,473,455),(14,'EEA',132,61,313,'Liquid',2,106000,240000,659,150000,1970,715),(15,'EG',62,69,387,'Liquid',2,63000,146000,1670,97300,774,745),(16,'EO',44,55,51,'Gas',2,33500,121000,1610,82400,737,804),(17,'H2',2,4.433,-423,'Gas',1,27.1,0.00927,-0.0000138,0.00000000765,0,752),(18,'H2S',34,61.993,-75,'Gas',1,31.9,0.00144,0.0000243,-0.0000000118,0,500),(19,'HCl',36,74,-121,'Gas',0,0,0,0,0,0,0),(20,'HF',20,60.37,68,'Gas',1,29.1,0.000661,-0.00000203,0.0000000025,0,32000),(21,'Methanol',32,50,149,'Liquid',2,39300,87900,1920,53700,897,867),(22,'Nitric Acid',63,95,250,'Liquid',0,0,0,0,0,0,0),(23,'NO2',90,58,275,'Liquid',0,0,0,0,0,0,0),(24,'Phosgene',99,86,181,'Liquid',0,0,0,0,0,0,0),(25,'PO',58,52,93,'Liquid',2,49500,174000,1560,115000,702,840),(26,'Pyrophoric',149,45.823,364,'Liquid',1,-8.5,1.01,-0.000556,0.000000118,0,0),(27,'Steam',18,62.3,212,'Gas',3,33400,26800,2610,8900,1170,0),(28,'Styrene',104,42.7,293,'Liquid',2,89300,215000,772,99900,2440,914),(29,'TDI',174,76,484,'Liquid',0,0,0,0,0,0,1148),(30,'Water',18,62.3,212,'Liquid',3,276000,-2090,8.125,-0.0141,0.00000937,0);
/*!40000 ALTER TABLE `tbl_52_ca_properties_level_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_58_ca_component_dm`
--

DROP TABLE IF EXISTS `tbl_58_ca_component_dm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_58_ca_component_dm` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Fluid` longtext,
  `CAINL_gas_a` double DEFAULT NULL,
  `CAINL_gas_b` double DEFAULT NULL,
  `CAINL_liquid_a` double DEFAULT NULL,
  `CAINL_liquid_b` double DEFAULT NULL,
  `CAIL_gas_a` double DEFAULT NULL,
  `CAIL_gas_b` double DEFAULT NULL,
  `CAIL_liquid_a` double DEFAULT NULL,
  `CAIL_liquid_b` double DEFAULT NULL,
  `IAINL_gas_a` double DEFAULT NULL,
  `IAINL_gas_b` double DEFAULT NULL,
  `IAINL_liquid_a` double DEFAULT NULL,
  `IAINL_liquid_b` double DEFAULT NULL,
  `IAIL_gas_a` double DEFAULT NULL,
  `IAIL_gas_b` double DEFAULT NULL,
  `IAIL_liquid_a` double DEFAULT NULL,
  `IAIL_liquid_b` double DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_58_ca_component_dm`
--

LOCK TABLES `tbl_58_ca_component_dm` WRITE;
/*!40000 ALTER TABLE `tbl_58_ca_component_dm` DISABLE KEYS */;
INSERT INTO `tbl_58_ca_component_dm` VALUES (1,'Aromatics',64.14,0.963,353.5,0.883,1344,0.937,487.7,0.268,18.08,0.686,0.14,0.935,512.6,0.713,1.404,0.935),(2,'C1-C2',8.669,0.98,0,0,55.13,0.95,0,0,6.469,0.67,0,0,163.7,0.62,0,0),(3,'C13-C16',0,0,12.11,0.9,0,0,196.7,0.92,0,0,0.086,0.88,0,0,1.714,0.88),(4,'C17-C25',0,0,3.785,0.9,0,0,165.5,0.92,0,0,0.021,0.91,0,0,1.068,0.91),(5,'C25+',0,0,2.098,0.91,0,0,103,0.9,0,0,0.006,0.99,0,0,0.284,0.99),(6,'C3-C4',10.13,1,0,0,64.23,1,0,0,4.59,0.72,0,0,79.94,0.63,0,0),(7,'C5',5.115,0.99,100.6,0.89,62.41,1,0,0,2.214,0.73,0.271,0.85,41.38,0.61,0,0),(8,'C6-C8',5.846,0.98,34.17,0.89,63.98,1,103.4,0.95,2.188,0.66,0.749,0.78,41.49,0.61,8.18,0.55),(9,'C9-C12',2.419,0.98,24.6,0.9,76.98,0.95,110.3,0.95,1.111,0.66,0.559,0.76,42.28,0.61,0.848,0.53),(10,'CO',0.04,1.752,0,0,0,0,0,0,10.97,0.667,0,0,0,0,0,0),(11,'DEE',9.072,1.134,164.2,1.106,67.42,1.033,976,0.649,24.51,0.667,0.981,0.919,0,0,1.09,0.919),(12,'EE',2.595,1.005,35.45,1,0,0,0,0,6.119,0.667,14.79,1,0,0,0,0),(13,'EEA',0,1.035,23.96,1,0,0,0,0,1.261,0.667,14.13,1,0,0,0,0),(14,'EG',1.548,0.973,22.12,1,0,0,0,0,1.027,0.667,14.13,1,0,0,0,0),(15,'EO',6.712,1.069,0,0,0,0,0,0,21.46,0.667,0,0,0,0,0,0),(16,'H2',13.13,0.992,0,0,86.02,1,0,0,9.605,0.657,0,0,216.5,0.618,0,0),(17,'H2S',6.554,1,0,0,38.11,0.89,0,0,22.63,0.63,0,0,53.72,0.61,0,0),(18,'HF',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(19,'Methanol',0.005,0.909,340.4,0.934,0,0,0,0,4.425,0.667,0.363,0.9,0,0,0,0),(20,'PO',3.277,1.114,257,0.96,0,0,0,0,10.32,0.667,0.629,0.869,0,0,0,0),(21,'Pyrophoric',2.419,0.98,24.6,0.9,76.98,0.95,110.3,0.95,1.111,0.66,0.559,0.76,42.28,0.61,0.848,0.53),(22,'Styrene',3.952,1.097,21.1,1,80.11,1.055,0,0,1.804,0.667,14.36,1,83.68,0.713,143.6,1);
/*!40000 ALTER TABLE `tbl_58_ca_component_dm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_59_component_damage_person`
--

DROP TABLE IF EXISTS `tbl_59_component_damage_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_59_component_damage_person` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Fluid` longtext,
  `CAINL_gas_a` double DEFAULT NULL,
  `CAINL_gas_b` double DEFAULT NULL,
  `CAINL_liquid_a` double DEFAULT NULL,
  `CAINL_liquid_b` double DEFAULT NULL,
  `CALL_gas_a` double DEFAULT NULL,
  `CALL_gas_b` double DEFAULT NULL,
  `CALL_liquid_a` double DEFAULT NULL,
  `CALL_liquid_b` double DEFAULT NULL,
  `IAINL_gas_a` double DEFAULT NULL,
  `IAINL_gas_b` double DEFAULT NULL,
  `IAINL_liquid_a` double DEFAULT NULL,
  `IAINL_liquid_b` double DEFAULT NULL,
  `IAIL_gas_a` double DEFAULT NULL,
  `IAIL_gas_b` double DEFAULT NULL,
  `IAIL_liquid_a` double DEFAULT NULL,
  `IAIL_liquid_b` double DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_59_component_damage_person`
--

LOCK TABLES `tbl_59_component_damage_person` WRITE;
/*!40000 ALTER TABLE `tbl_59_component_damage_person` DISABLE KEYS */;
INSERT INTO `tbl_59_component_damage_person` VALUES (1,'Aromatics',12.76,0.963,66.01,0.883,261.9,0.937,56,0.268,2.889,0.686,0.027,0.935,83.68,0.713,0.273,0.935),(2,'C1-C2',21.83,0.96,0,0,143.2,0.92,0,0,12.46,0.67,0,0,473.9,0.63,0,0),(3,'C13-C16',0,0,34.36,0.89,0,0,539.4,0.9,0,0,0.242,0.88,0,0,4.843,0.88),(4,'C17-C25',0,0,10.7,0.89,0,0,458,0.9,0,0,0.061,0.91,0,0,3.052,0.9),(5,'C25+',0,0,6.196,0.89,0,0,303.6,0.9,0,0,0.016,0.99,0,0,0.833,0.99),(6,'C3-C4',25.64,1,0,0,171.4,1,0,0,9.702,0.75,0,0,270.4,0.63,0,0),(7,'C5',12.71,1,290.1,0.89,166.1,1,0,0,4.82,0.76,0.79,0.85,146.7,0.63,0,0),(8,'C6-C8',3.49,0.96,96.88,0.89,169.7,1,252.8,0.92,4.216,0.67,2.186,0.78,147.2,0.63,31.89,0.54),(9,'C9-C12',5.755,0.96,70.03,0.89,188.6,0.92,269.4,0.92,2.035,0.66,1.609,0.76,151,0.63,2.847,0.54),(10,'CO  ',5.491,0.991,0,0,0,0,0,0,16.91,0.692,0,0,0,0,0,0),(11,'DEE',26.76,1.025,236.7,1.219,241.5,0.997,488.9,0.864,31.71,0.682,8.333,0.814,128.3,0.657,9.258,0.814),(12,'EE',7.107,0.969,8.142,0.8,0,0,0,0,25.36,0.66,0.029,0.927,0,0,0,0),(13,'EEA',0,0.946,79.66,0.835,0,0,0,0,1.825,0.687,0.03,0.924,0,0,0,0),(14,'EG',5.042,0.947,59.96,0.869,0,0,0,0,1.435,0.687,0.027,0.922,0,0,0,0),(15,'EO',11,1.105,0,0,0,0,0,0,34.7,0.665,0,0,0,0,0,0),(16,'H2',32.05,0.933,0,0,228.8,1,0,0,18.43,0.652,0,0,636.5,0.621,0,0),(17,'H2S',10.65,1,0,0,73.25,0.94,0,0,41.43,0.63,0,0,191.5,0.63,0,0),(18,'HF',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(19,'Methanol',0,1.008,849.9,0.902,0,0,0,0,6.035,6.88,1.157,0.871,0,0,0,0),(20,'PO',8.239,1.047,352.8,0.84,0,0,0,0,13.33,0.682,2.732,0.83,0,0,0,0),(21,'Pyrophoric',5.755,0.96,70.03,0.89,188.6,0.92,269.4,0.92,2.035,0.66,1.609,0.76,151,0.63,2.847,0.54),(22,'Styrene',12.76,0.963,66.01,0.883,261.9,0.937,56,0.268,2.889,0.686,0.027,0.935,83.68,0.713,0.273,0.935);
/*!40000 ALTER TABLE `tbl_59_component_damage_person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_64_dm_linning_inorganic`
--

DROP TABLE IF EXISTS `tbl_64_dm_linning_inorganic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_64_dm_linning_inorganic` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `YearsSinceLastInspection` int(11) DEFAULT NULL,
  `Strip lined alloy` double DEFAULT NULL,
  `Castable refractory` double DEFAULT NULL,
  `Castable refractory severe condition` int(11) DEFAULT NULL,
  `Glass lined` int(11) DEFAULT NULL,
  `Acid Brick` int(11) DEFAULT NULL,
  `Fibreglass` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_64_dm_linning_inorganic`
--

LOCK TABLES `tbl_64_dm_linning_inorganic` WRITE;
/*!40000 ALTER TABLE `tbl_64_dm_linning_inorganic` DISABLE KEYS */;
INSERT INTO `tbl_64_dm_linning_inorganic` VALUES (1,1,0.3,0.5,9,3,0,1),(2,2,0.5,1,40,4,0,1),(3,3,0.7,2,146,6,0,1),(4,4,1,4,428,7,0,1),(5,5,1,9,1017,9,1,1),(6,6,2,16,1978,11,1,1),(7,7,3,30,3000,13,1,2),(8,8,4,53,3000,16,1,3),(9,9,6,89,3000,20,2,7),(10,10,9,146,3000,25,3,13),(11,11,12,230,3000,30,4,26),(12,12,16,351,3000,36,5,47),(13,13,22,518,3000,44,7,82),(14,14,30,738,3000,53,9,139),(15,15,40,1017,3000,63,11,228),(16,16,53,1358,3000,75,15,359),(17,17,69,1758,3000,89,19,548),(18,18,89,2209,3000,105,25,808),(19,19,115,2697,3000,124,31,1151),(20,20,146,3000,3000,146,40,1587),(21,21,184,3000,3000,170,50,2119),(22,22,230,3000,3000,199,63,2743),(23,23,286,3000,3000,230,78,3000),(24,24,351,3000,3000,266,97,3000),(25,25,428,3000,3000,306,119,3000);
/*!40000 ALTER TABLE `tbl_64_dm_linning_inorganic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_65_dm_linning_organic`
--

DROP TABLE IF EXISTS `tbl_65_dm_linning_organic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_65_dm_linning_organic` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `YearInService` int(11) DEFAULT NULL,
  `MoreThan6Years` int(11) DEFAULT NULL,
  `WithinLast6Years` int(11) DEFAULT NULL,
  `WithinLast3Years` double DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_65_dm_linning_organic`
--

LOCK TABLES `tbl_65_dm_linning_organic` WRITE;
/*!40000 ALTER TABLE `tbl_65_dm_linning_organic` DISABLE KEYS */;
INSERT INTO `tbl_65_dm_linning_organic` VALUES (1,1,30,1,0),(2,2,89,4,0),(3,3,230,16,0),(4,4,518,53,0),(5,5,1017,146,0.2),(6,6,1758,351,1),(7,7,2697,738,4),(8,8,3000,1358,16),(9,9,3000,2209,53),(10,10,3000,3000,146),(11,11,3000,3000,351),(12,12,3000,3000,738),(13,13,3000,3000,1358),(14,14,3000,3000,2209),(15,15,3000,3000,3000),(16,16,3000,3000,3000),(17,17,3000,3000,3000),(18,18,3000,3000,3000),(19,19,3000,3000,3000),(20,20,3000,3000,3000),(21,21,3000,3000,3000),(22,22,3000,3000,3000),(23,23,3000,3000,3000),(24,24,3000,3000,3000),(25,25,3000,3000,3000);
/*!40000 ALTER TABLE `tbl_65_dm_linning_organic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_71_properties_storage_tank`
--

DROP TABLE IF EXISTS `tbl_71_properties_storage_tank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_71_properties_storage_tank` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Fluid` longtext,
  `Level 1 Consequence Analysis Representative Fluid` longtext,
  `Molecular Weight` int(11) DEFAULT NULL,
  `Liquid Density` double DEFAULT NULL,
  `Liquid Density Viscosity` double DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_71_properties_storage_tank`
--

LOCK TABLES `tbl_71_properties_storage_tank` WRITE;
/*!40000 ALTER TABLE `tbl_71_properties_storage_tank` DISABLE KEYS */;
INSERT INTO `tbl_71_properties_storage_tank` VALUES (1,'Crude Oil','C17-C25',280,775.019,0.0369),(2,'Fuel Oil','C17-C25',280,775.019,0.0369),(3,'Gasonline','C6-C8',100,684.018,0.00401),(4,'Heavy Crude Oil','C25+',422,900.026,0.046),(5,'Heavy Diesel Oil','C13-C16',205,764.527,0.00246),(6,'Heavy Fuel Oil','C25+',422,900.026,0.046),(7,'Light Diesel Oil','C9-C12',149,734.011,0.00104);
/*!40000 ALTER TABLE `tbl_71_properties_storage_tank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_74_scc_dm_pwht`
--

DROP TABLE IF EXISTS `tbl_74_scc_dm_pwht`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_74_scc_dm_pwht` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SVI` int(11) DEFAULT NULL,
  `E` int(11) DEFAULT NULL,
  `1D` int(11) DEFAULT NULL,
  `1C` int(11) DEFAULT NULL,
  `1B` int(11) DEFAULT NULL,
  `1A` int(11) DEFAULT NULL,
  `2D` int(11) DEFAULT NULL,
  `2C` int(11) DEFAULT NULL,
  `2B` int(11) DEFAULT NULL,
  `2A` int(11) DEFAULT NULL,
  `3D` int(11) DEFAULT NULL,
  `3C` int(11) DEFAULT NULL,
  `3B` int(11) DEFAULT NULL,
  `3A` int(11) DEFAULT NULL,
  `4D` int(11) DEFAULT NULL,
  `4C` int(11) DEFAULT NULL,
  `4B` int(11) DEFAULT NULL,
  `4A` int(11) DEFAULT NULL,
  `5D` int(11) DEFAULT NULL,
  `5C` int(11) DEFAULT NULL,
  `5B` int(11) DEFAULT NULL,
  `5A` int(11) DEFAULT NULL,
  `6D` int(11) DEFAULT NULL,
  `6C` int(11) DEFAULT NULL,
  `6B` int(11) DEFAULT NULL,
  `6A` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_74_scc_dm_pwht`
--

LOCK TABLES `tbl_74_scc_dm_pwht` WRITE;
/*!40000 ALTER TABLE `tbl_74_scc_dm_pwht` DISABLE KEYS */;
INSERT INTO `tbl_74_scc_dm_pwht` VALUES (1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),(2,10,10,8,3,1,1,6,2,1,1,4,1,1,1,2,1,1,1,1,1,1,1,1,1,1,1),(3,50,50,40,17,5,3,30,10,2,1,20,5,1,1,10,2,1,1,5,1,1,1,1,1,1,1),(4,100,100,80,33,10,5,60,20,4,1,40,10,2,1,20,5,1,1,10,2,1,1,5,1,1,1),(5,500,500,400,170,50,25,300,100,20,5,200,50,8,1,100,25,2,1,50,10,1,1,25,5,1,1),(6,1000,1000,800,330,100,50,600,200,40,10,400,100,16,2,200,50,5,1,100,25,2,1,50,10,1,1),(7,5000,5000,4000,1670,250,250,3000,1000,250,50,2000,500,80,10,1000,250,25,2,500,125,5,1,250,50,2,1);
/*!40000 ALTER TABLE `tbl_74_scc_dm_pwht` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-16 22:49:41
