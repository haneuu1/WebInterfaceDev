-- MariaDB dump 10.18  Distrib 10.5.8-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: myshop
-- ------------------------------------------------------
-- Server version	10.5.8-MariaDB

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
-- Table structure for table `accounts_profile`
--

DROP TABLE IF EXISTS `accounts_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `accounts_profile_user_id_49a85d32_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_profile`
--

LOCK TABLES `accounts_profile` WRITE;
/*!40000 ALTER TABLE `accounts_profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add product',7,'add_product'),(26,'Can change product',7,'change_product'),(27,'Can delete product',7,'delete_product'),(28,'Can view product',7,'view_product'),(29,'Can add category',8,'add_category'),(30,'Can change category',8,'change_category'),(31,'Can delete category',8,'delete_category'),(32,'Can view category',8,'view_category'),(33,'Can add profile',9,'add_profile'),(34,'Can change profile',9,'change_profile'),(35,'Can delete profile',9,'delete_profile'),(36,'Can view profile',9,'view_profile'),(37,'Can add review',10,'add_review'),(38,'Can change review',10,'change_review'),(39,'Can delete review',10,'delete_review'),(40,'Can view review',10,'view_review'),(41,'Can add order',11,'add_order'),(42,'Can change order',11,'change_order'),(43,'Can delete order',11,'delete_order'),(44,'Can view order',11,'view_order'),(45,'Can add question answer',12,'add_questionanswer'),(46,'Can change question answer',12,'change_questionanswer'),(47,'Can delete question answer',12,'delete_questionanswer'),(48,'Can view question answer',12,'view_questionanswer'),(49,'Can add cart',13,'add_cart'),(50,'Can change cart',13,'change_cart'),(51,'Can delete cart',13,'delete_cart'),(52,'Can view cart',13,'view_cart'),(53,'Can add cart item',14,'add_cartitem'),(54,'Can change cart item',14,'change_cartitem'),(55,'Can delete cart item',14,'delete_cartitem'),(56,'Can view cart item',14,'view_cartitem');
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
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$216000$5nvupoxJRWlC$gpdlS0PNPHKJhdP8D+KI7nGJymFdYWjhPt8mvF/fhCo=','2021-02-08 15:18:11.089809',1,'admin','','','hhhong127@gmail.com',1,1,'2021-02-02 11:49:50.192458'),(3,'pbkdf2_sha256$216000$JSHWx3LdPHxa$uaHv5VFyg4aop3DSMmMOaNVlXQmcVmQoO7pUs4IrnAM=','2021-02-08 15:15:17.206308',0,'user1','','','',0,1,'2021-02-04 14:51:42.000000'),(4,'pbkdf2_sha256$216000$oCT1oXI8WMuf$leRCL/PwlgoGo4ML2qTcaLNhAU1W6l9q0FwcNtvuyBM=','2021-02-08 15:15:25.438339',0,'user2','정연','홍','hongjy127@naver.com',0,1,'2021-02-04 15:05:04.132204'),(5,'pbkdf2_sha256$216000$tKIn8Cwb4nmZ$J41uelsm/1f1x1SBGOsv/6C6HPz2zUhv3nMCvHTLOno=','2021-02-08 15:15:32.755067',0,'user3','bc','a','g@g.com',0,1,'2021-02-04 15:09:57.919464'),(6,'pbkdf2_sha256$216000$P7cKIsT6ggOl$za6DV1VkW8Z66ZxkKd/EoOOluK7olR/LWRC4nP0K/xQ=','2021-02-08 10:22:33.167618',0,'user4','정연','홍','hongjy127@naver.com',0,1,'2021-02-04 15:15:36.446574'),(7,'pbkdf2_sha256$216000$Q0YXlHcXtVr4$JEKXBgCkv+zjFM6ReBxdBjlB4SptHYdmdIIRdGvzZ8E=','2021-02-08 10:00:35.538633',0,'user5','bc','a','a@bc.com',0,1,'2021-02-08 09:58:24.100818'),(8,'pbkdf2_sha256$216000$iFtSHNmZYqFc$sS14BDJGJFXWb//XQczTqIl7B5ZNmvycG0N7ovpPLPU=','2021-02-08 11:49:30.367620',0,'user6','bc','a','a@bc.com',0,1,'2021-02-08 11:49:23.272609'),(9,'pbkdf2_sha256$216000$87xu1b3i2sol$xXGVrLBAZT/XTkts/jKRkoZy5msIrGLM3+34vD4HgfI=','2021-02-08 13:01:38.766074',0,'user7','bc','홍','a@bc.com',0,1,'2021-02-08 12:47:02.253020');
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
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
-- Table structure for table `cart_cart`
--

DROP TABLE IF EXISTS `cart_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_cart_user_id_9b4220b9_fk_auth_user_id` (`user_id`),
  CONSTRAINT `cart_cart_user_id_9b4220b9_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_cart`
--

LOCK TABLES `cart_cart` WRITE;
/*!40000 ALTER TABLE `cart_cart` DISABLE KEYS */;
INSERT INTO `cart_cart` VALUES (4,1),(6,3),(7,4),(8,5),(9,6),(1,7),(2,8),(3,9);
/*!40000 ALTER TABLE `cart_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_cartitem`
--

DROP TABLE IF EXISTS `cart_cartitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_cartitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `cart_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_cartitem_cart_id_370ad265_fk_cart_cart_id` (`cart_id`),
  KEY `cart_cartitem_product_id_b24e265a_fk_shopwindow_product_id` (`product_id`),
  CONSTRAINT `cart_cartitem_cart_id_370ad265_fk_cart_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `cart_cart` (`id`),
  CONSTRAINT `cart_cartitem_product_id_b24e265a_fk_shopwindow_product_id` FOREIGN KEY (`product_id`) REFERENCES `shopwindow_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_cartitem`
--

LOCK TABLES `cart_cartitem` WRITE;
/*!40000 ALTER TABLE `cart_cartitem` DISABLE KEYS */;
INSERT INTO `cart_cartitem` VALUES (2,1,1,2,3),(3,5,1,3,2),(4,1,1,4,2),(5,2,1,3,1);
/*!40000 ALTER TABLE `cart_cartitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2021-02-03 15:01:04.335334','1','상품1',1,'[{\"added\": {}}]',7,1),(2,'2021-02-03 15:01:26.358137','2','상품2',1,'[{\"added\": {}}]',7,1),(3,'2021-02-03 15:01:58.213949','3','상품2사3',1,'[{\"added\": {}}]',7,1),(4,'2021-02-03 15:02:06.555683','2','상품2',2,'[{\"changed\": {\"fields\": [\"IMAGE\"]}}]',7,1),(5,'2021-02-03 15:02:14.275077','3','상품3',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',7,1),(6,'2021-02-03 15:02:36.409460','3','상품3',2,'[{\"changed\": {\"fields\": [\"IMAGE\"]}}]',7,1),(7,'2021-02-03 15:02:43.766439','3','상품3',2,'[{\"changed\": {\"fields\": [\"IMAGE\"]}}]',7,1),(8,'2021-02-03 15:03:05.876427','4','상품2사4',1,'[{\"added\": {}}]',7,1),(9,'2021-02-03 15:03:15.840600','4','상품4',2,'[{\"changed\": {\"fields\": [\"Name\", \"IMAGE\"]}}]',7,1),(10,'2021-02-03 15:03:22.531877','4','상품4',2,'[{\"changed\": {\"fields\": [\"IMAGE\"]}}]',7,1),(11,'2021-02-03 15:22:42.247195','5','상품5',1,'[{\"added\": {}}]',7,1),(12,'2021-02-03 15:23:07.075827','6','상품6',1,'[{\"added\": {}}]',7,1),(13,'2021-02-03 15:23:35.293198','7','상품7',1,'[{\"added\": {}}]',7,1),(14,'2021-02-08 14:13:20.365085','1','와플',2,'[{\"changed\": {\"fields\": [\"Name\", \"Price\", \"IMAGE\"]}}]',7,1),(15,'2021-02-08 14:13:32.519921','1','와플',2,'[{\"changed\": {\"fields\": [\"IMAGE\"]}}]',7,1),(16,'2021-02-08 14:14:07.954181','1','와플',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',7,1),(17,'2021-02-08 14:14:39.758279','2','사과',2,'[{\"changed\": {\"fields\": [\"Name\", \"Price\", \"Description\", \"IMAGE\"]}}]',7,1),(18,'2021-02-08 14:14:48.316422','2','사과',2,'[{\"changed\": {\"fields\": [\"IMAGE\", \"Quantity\"]}}]',7,1),(19,'2021-02-08 14:16:17.218964','3','프라이팬',2,'[{\"changed\": {\"fields\": [\"Name\", \"Price\", \"Description\", \"IMAGE\", \"Quantity\"]}}]',7,1),(20,'2021-02-08 14:16:23.366160','3','프라이팬',2,'[{\"changed\": {\"fields\": [\"IMAGE\"]}}]',7,1),(21,'2021-02-08 14:17:08.172261','4','에어프라이어',2,'[{\"changed\": {\"fields\": [\"Name\", \"Price\", \"Description\", \"IMAGE\", \"Quantity\"]}}]',7,1),(22,'2021-02-08 14:17:20.519102','4','에어프라이어',2,'[{\"changed\": {\"fields\": [\"IMAGE\"]}}]',7,1),(23,'2021-02-08 14:18:34.404126','5','냉장고',2,'[{\"changed\": {\"fields\": [\"Name\", \"Price\", \"Description\", \"IMAGE\"]}}]',7,1),(24,'2021-02-08 14:18:41.672428','5','냉장고',2,'[{\"changed\": {\"fields\": [\"IMAGE\"]}}]',7,1),(25,'2021-02-08 14:19:40.907603','6','각티슈',2,'[{\"changed\": {\"fields\": [\"Name\", \"Price\", \"Description\", \"IMAGE\", \"Quantity\"]}}]',7,1),(26,'2021-02-08 14:19:46.158985','6','각티슈',2,'[{\"changed\": {\"fields\": [\"IMAGE\"]}}]',7,1),(27,'2021-02-08 14:19:46.314406','6','각티슈',2,'[{\"changed\": {\"fields\": [\"IMAGE\"]}}]',7,1),(28,'2021-02-08 14:20:50.600695','7','달러구트 꿈 백화점:주문하신 꿈은 매진입니다',2,'[{\"changed\": {\"fields\": [\"Name\", \"Price\", \"Description\", \"IMAGE\", \"Quantity\"]}}]',7,1),(29,'2021-02-08 14:21:27.207926','7','달러구트 꿈 백화점',2,'[{\"changed\": {\"fields\": [\"Name\", \"IMAGE\"]}}]',7,1),(30,'2021-02-08 14:23:13.924380','8','아몬드',1,'[{\"added\": {}}]',7,1),(31,'2021-02-08 14:24:10.263854','9','마음챙김의 시',1,'[{\"added\": {}}]',7,1),(32,'2021-02-08 14:24:58.847538','10','나미야 잡화점의 기적',1,'[{\"added\": {}}]',7,1),(33,'2021-02-08 14:25:48.985759','11','일인칭 단수',1,'[{\"added\": {}}]',7,1),(34,'2021-02-08 14:27:06.174797','12','코스모스',1,'[{\"added\": {}}]',7,1),(35,'2021-02-08 14:32:04.934455','13','이기적유전자',1,'[{\"added\": {}}]',7,1),(36,'2021-02-08 14:33:03.228937','14','괜찮지 않은데 괜찮은 척했다',1,'[{\"added\": {}}]',7,1),(37,'2021-02-08 14:35:28.847978','15','하고 싶은 대로 살아도 괜찮아',1,'[{\"added\": {}}]',7,1),(38,'2021-02-08 14:36:52.439390','16','동물 농장 사운드북',1,'[{\"added\": {}}]',7,1),(39,'2021-02-08 14:37:55.424426','17','주식투자 일주일 만에 뽀개기',1,'[{\"added\": {}}]',7,1),(40,'2021-02-08 14:38:47.167061','18','나는 퇴근 후 사장이 된다',1,'[{\"added\": {}}]',7,1),(41,'2021-02-08 14:40:13.143826','19','피아노로 연주하는 디즈니 OST 베스트',1,'[{\"added\": {}}]',7,1),(42,'2021-02-08 14:42:23.596892','20','비요뜨',1,'[{\"added\": {}}]',7,1),(43,'2021-02-08 14:42:48.657916','20','비요뜨',2,'[{\"changed\": {\"fields\": [\"IMAGE\"]}}]',7,1),(44,'2021-02-08 14:43:37.579230','21','우유',1,'[{\"added\": {}}]',7,1),(45,'2021-02-08 14:44:24.059890','22','바나나맛우유',1,'[{\"added\": {}}]',7,1),(46,'2021-02-08 14:45:58.521105','23','간고등어살',1,'[{\"added\": {}}]',7,1),(47,'2021-02-08 14:46:48.715762','24','숙성 연어회',1,'[{\"added\": {}}]',7,1),(48,'2021-02-08 14:47:32.522858','25','김',1,'[{\"added\": {}}]',7,1),(49,'2021-02-08 14:49:08.576921','26','수세미',1,'[{\"added\": {}}]',7,1),(50,'2021-02-08 14:50:25.024626','27','식기세트',1,'[{\"added\": {}}]',7,1),(51,'2021-02-08 14:51:27.206699','28','접시세트',1,'[{\"added\": {}}]',7,1),(52,'2021-02-08 14:53:00.343910','29','식탁보',1,'[{\"added\": {}}]',7,1),(53,'2021-02-08 14:53:26.954130','30','데스크매트',1,'[{\"added\": {}}]',7,1),(54,'2021-02-08 14:54:33.541930','31','주방칼 가위 세트',1,'[{\"added\": {}}]',7,1),(55,'2021-02-08 14:56:29.167639','32','섬유유연제',1,'[{\"added\": {}}]',7,1),(56,'2021-02-08 14:57:33.401787','33','샴푸',1,'[{\"added\": {}}]',7,1),(57,'2021-02-08 14:58:33.609106','34','치약',1,'[{\"added\": {}}]',7,1),(58,'2021-02-08 14:59:45.036551','35','칫솔 치약 케이스',1,'[{\"added\": {}}]',7,1),(59,'2021-02-08 15:01:06.074792','36','마스크',1,'[{\"added\": {}}]',7,1),(60,'2021-02-08 15:02:14.027479','37','섬유탈취제',1,'[{\"added\": {}}]',7,1),(61,'2021-02-08 15:02:51.014274','38','디퓨저',1,'[{\"added\": {}}]',7,1),(62,'2021-02-08 15:04:30.941194','39','선반',1,'[{\"added\": {}}]',7,1),(63,'2021-02-08 15:04:55.301142','40','치약칫솔걸이',1,'[{\"added\": {}}]',7,1),(64,'2021-02-08 15:05:19.577063','41','행거',1,'[{\"added\": {}}]',7,1),(65,'2021-02-08 15:06:35.435449','42','핫팩',1,'[{\"added\": {}}]',7,1),(66,'2021-02-08 15:07:02.031515','43','난방텐트',1,'[{\"added\": {}}]',7,1),(67,'2021-02-08 15:07:30.536350','44','에어캡',1,'[{\"added\": {}}]',7,1),(68,'2021-02-08 15:09:05.983304','45','빔프로젝터',1,'[{\"added\": {}}]',7,1),(69,'2021-02-08 15:09:33.973718','46','tv stick',1,'[{\"added\": {}}]',7,1),(70,'2021-02-08 15:10:06.624372','47','TV',1,'[{\"added\": {}}]',7,1),(71,'2021-02-08 15:11:15.746019','48','HP 화이트 노트북 15s-fq1007TU',1,'[{\"added\": {}}]',7,1),(72,'2021-02-08 15:12:15.936446','49','니콘 D850 DSLR BODY',1,'[{\"added\": {}}]',7,1),(73,'2021-02-08 15:12:38.676593','50','촬영 조명',1,'[{\"added\": {}}]',7,1),(74,'2021-02-08 15:14:25.218186','3','user1',2,'[{\"changed\": {\"fields\": [\"Username\"]}}]',4,1),(75,'2021-02-08 15:14:45.295206','2','홍정연',3,'',4,1),(76,'2021-02-08 15:17:48.270240','1','와플 후기',2,'[{\"changed\": {\"fields\": [\"TITLE\", \"CONTENT\", \"OWNER\", \"Product\"]}}]',10,1),(77,'2021-02-08 15:21:00.246776','2','맛있다',2,'[{\"changed\": {\"fields\": [\"TITLE\", \"CONTENT\", \"OWNER\", \"Product\"]}}]',10,1),(78,'2021-02-08 15:21:16.389494','3','후기',2,'[{\"changed\": {\"fields\": [\"TITLE\", \"CONTENT\", \"OWNER\"]}}]',10,1),(79,'2021-02-08 15:21:37.175226','8','title',2,'[{\"changed\": {\"fields\": [\"CONTENT\", \"OWNER\"]}}]',10,1),(80,'2021-02-08 15:21:46.827234','9','title',2,'[{\"changed\": {\"fields\": [\"CONTENT\", \"OWNER\"]}}]',10,1),(81,'2021-02-08 15:21:56.230476','10','title',2,'[{\"changed\": {\"fields\": [\"CONTENT\", \"OWNER\"]}}]',10,1),(82,'2021-02-08 15:29:41.055352','3','후기',2,'[{\"changed\": {\"fields\": [\"Product\"]}}]',10,1);
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
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (9,'accounts','profile'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(13,'cart','cart'),(14,'cart','cartitem'),(5,'contenttypes','contenttype'),(11,'order','order'),(6,'sessions','session'),(8,'shopwindow','category'),(7,'shopwindow','product'),(12,'shopwindow','questionanswer'),(10,'shopwindow','review');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2021-02-02 11:42:54.931298'),(2,'auth','0001_initial','2021-02-02 11:42:55.295020'),(3,'admin','0001_initial','2021-02-02 11:42:56.440597'),(4,'admin','0002_logentry_remove_auto_add','2021-02-02 11:42:56.691456'),(5,'admin','0003_logentry_add_action_flag_choices','2021-02-02 11:42:56.715930'),(6,'contenttypes','0002_remove_content_type_name','2021-02-02 11:42:56.876110'),(7,'auth','0002_alter_permission_name_max_length','2021-02-02 11:42:57.023051'),(8,'auth','0003_alter_user_email_max_length','2021-02-02 11:42:57.158828'),(9,'auth','0004_alter_user_username_opts','2021-02-02 11:42:57.180453'),(10,'auth','0005_alter_user_last_login_null','2021-02-02 11:42:57.295300'),(11,'auth','0006_require_contenttypes_0002','2021-02-02 11:42:57.309516'),(12,'auth','0007_alter_validators_add_error_messages','2021-02-02 11:42:57.349488'),(13,'auth','0008_alter_user_username_max_length','2021-02-02 11:42:57.404463'),(14,'auth','0009_alter_user_last_name_max_length','2021-02-02 11:42:57.474631'),(15,'auth','0010_alter_group_name_max_length','2021-02-02 11:42:57.628729'),(16,'auth','0011_update_proxy_permissions','2021-02-02 11:42:57.650404'),(17,'auth','0012_alter_user_first_name_max_length','2021-02-02 11:42:57.703201'),(18,'sessions','0001_initial','2021-02-02 11:42:57.766161'),(19,'shopwindow','0001_initial','2021-02-02 11:42:57.877049'),(20,'shopwindow','0002_product_image','2021-02-03 14:12:40.320417'),(21,'shopwindow','0003_auto_20210203_1336','2021-02-03 14:12:40.471326'),(22,'accounts','0001_initial','2021-02-04 11:51:28.174281'),(23,'shopwindow','0004_review','2021-02-05 10:14:38.067015'),(24,'shopwindow','0005_review_product','2021-02-05 11:07:39.044373'),(25,'shopwindow','0006_auto_20210205_1117','2021-02-05 11:17:18.941811'),(26,'shopwindow','0007_auto_20210205_1327','2021-02-05 13:28:01.420436'),(27,'order','0001_initial','2021-02-05 15:32:17.941624'),(28,'order','0002_auto_20210205_1404','2021-02-05 15:32:18.324312'),(29,'order','0003_auto_20210205_1405','2021-02-05 15:32:18.476883'),(30,'shopwindow','0008_auto_20210207_2344','2021-02-07 23:44:25.790270'),(31,'cart','0001_initial','2021-02-08 09:51:58.141015'),(32,'cart','0002_auto_20210204_1733','2021-02-08 09:51:58.584462'),(33,'order','0004_auto_20210206_1749','2021-02-08 09:51:58.693260'),(34,'order','0005_auto_20210206_1800','2021-02-08 09:51:58.803602'),(35,'order','0006_auto_20210206_1803','2021-02-08 09:51:58.862800'),(36,'order','0007_auto_20210208_0951','2021-02-08 09:51:58.902345');
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
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('ehen8fse6cqueg1afn5irj977kn59ilv','.eJxVjMsOwiAQRf-FtSEw5VFcuvcbyMAMUjU0Ke3K-O_apAvd3nPOfYmI21rj1nmJE4mz0OL0uyXMD247oDu22yzz3NZlSnJX5EG7vM7Ez8vh_h1U7PVbg3EmK6uAkJNnOwZPJTOT1oAE3mm0IYEmHLL2oxmIAkApjtlmq1C8P-vfOFU:1l7ASP:LnsEGarnqCBeuU_WhjW4paQ20zHS4nntOV1PQu3UiNQ','2021-02-17 14:12:01.237245'),('nmouglla45193aowun5h2x9jej9a7ra3','.eJxVjMsOwiAQRf-FtSEw5VFcuvcbyMAMUjU0Ke3K-O_apAvd3nPOfYmI21rj1nmJE4mz0OL0uyXMD247oDu22yzz3NZlSnJX5EG7vM7Ez8vh_h1U7PVbg3EmK6uAkJNnOwZPJTOT1oAE3mm0IYEmHLL2oxmIAkApjtlmq1C8P-vfOFU:1l7WKb:uOo1ZV0U2VhoABr-3LBxi32idm686PavWC54v4-tFps','2021-02-18 13:33:25.938321'),('okn2zy7deqtx9w3gwycvu5ofdurrx1zs','.eJxVjMsOwiAQRf-FtSEw5VFcuvcbyMAMUjU0Ke3K-O_apAvd3nPOfYmI21rj1nmJE4mz0OL0uyXMD247oDu22yzz3NZlSnJX5EG7vM7Ez8vh_h1U7PVbg3EmK6uAkJNnOwZPJTOT1oAE3mm0IYEmHLL2oxmIAkApjtlmq1C8P-vfOFU:1l8zsB:V21EwcVDGD3wSlsyiG5DUURqg5a9HwD1cbyIzyd1168','2021-02-22 15:18:11.094811'),('p3eihy7lu2xe2la5uxkcuy6noz0wr1gb','.eJxVjEEOgjAQRe_StWmGgdri0r1naGY6HUFNSSisjHcXEha6_e-9_zaR1mWIa81zHMVcjDOn340pPXPZgTyo3CebprLMI9tdsQet9jZJfl0P9-9goDpstXabC6jYeWZoARuvTB5VzpkIRFVTcMQQRH1icKA99whJmtBiRvP5AhSFOQQ:1l7okJ:1rTiETQ42Iue8vc0A5rUNuI7mTmIOs7cbBGCNqGs0q8','2021-02-19 09:13:11.172622'),('y3ei5ab4drsuw2elq2czup4pjgnhffdx','.eJxVjMsOwiAQRf-FtSEw5VFcuvcbyMAMUjU0Ke3K-O_apAvd3nPOfYmI21rj1nmJE4mz0OL0uyXMD247oDu22yzz3NZlSnJX5EG7vM7Ez8vh_h1U7PVbg3EmK6uAkJNnOwZPJTOT1oAE3mm0IYEmHLL2oxmIAkApjtlmq1C8P-vfOFU:1l6lmO:PtcygWRzGHhLmwzeWWGrUyP9W4nQ_-ofyYt1iTCPo38','2021-02-16 11:51:00.237320');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_order`
--

DROP TABLE IF EXISTS `order_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `order_date` datetime(6) NOT NULL,
  `order_status` varchar(50) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `modify_dt` datetime(6) NOT NULL,
  `order_set` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_order_owner_id_012017d7_fk_auth_user_id` (`owner_id`),
  KEY `order_order_product_id_fb1319ca_fk_shopwindow_product_id` (`product_id`),
  CONSTRAINT `order_order_owner_id_012017d7_fk_auth_user_id` FOREIGN KEY (`owner_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `order_order_product_id_fb1319ca_fk_shopwindow_product_id` FOREIGN KEY (`product_id`) REFERENCES `shopwindow_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_order`
--

LOCK TABLES `order_order` WRITE;
/*!40000 ALTER TABLE `order_order` DISABLE KEYS */;
INSERT INTO `order_order` VALUES (1,1,10000,'2021-02-05 15:34:28.756796','Ordered',1,2,'2021-02-08 09:51:58.637441',0),(2,1,1000,'2021-02-05 15:34:28.783698','Ordered',1,1,'2021-02-08 09:51:58.637441',0),(3,1,10000,'2021-02-05 15:35:09.443132','Ordered',1,2,'2021-02-08 09:51:58.637441',0),(4,1,1000,'2021-02-05 15:35:09.450755','Ordered',1,1,'2021-02-08 09:51:58.637441',0),(5,3,30000,'2021-02-08 09:52:15.465679','Ordered',5,2,'2021-02-08 09:52:15.479674',5),(6,3,3000,'2021-02-08 09:52:15.488724','Ordered',5,1,'2021-02-08 09:52:15.492548',5),(7,1,10000,'2021-02-08 10:03:27.199931','Ordered',7,2,'2021-02-08 10:03:27.210576',7),(8,1,1000,'2021-02-08 10:03:27.218459','Ordered',7,1,'2021-02-08 10:03:27.221748',7),(9,1,10000,'2021-02-08 10:16:34.972043','Canceled',6,2,'2021-02-08 10:53:29.514809',9),(10,1,1000,'2021-02-08 10:16:34.987217','Canceled',6,1,'2021-02-08 10:29:25.392114',9),(11,4,40000,'2021-02-08 10:30:09.955515','Canceled',6,2,'2021-02-08 10:53:27.676824',11),(12,4,4000,'2021-02-08 10:30:09.988244','Canceled',6,1,'2021-02-08 10:53:25.560481',11),(13,1,10000,'2021-02-08 10:55:01.205686','Ordered',6,2,'2021-02-08 10:55:01.209683',13),(14,1,1000,'2021-02-08 10:55:01.218681','Ordered',6,1,'2021-02-08 10:55:01.230285',13),(15,1,10000,'2021-02-08 11:05:42.422871','Ordered',6,2,'2021-02-08 11:05:42.429868',15),(16,1,1000,'2021-02-08 11:05:42.444697','Ordered',6,1,'2021-02-08 11:05:42.447823',15),(17,1,123,'2021-02-08 11:07:46.365143','Ordered',6,6,'2021-02-08 11:07:46.371140',17),(18,1,1000,'2021-02-08 11:07:46.385219','Ordered',6,1,'2021-02-08 11:07:46.389235',17),(19,1,123,'2021-02-08 11:07:53.911344','Ordered',6,6,'2021-02-08 11:07:53.917342',19),(20,1,1000,'2021-02-08 11:07:53.933454','Ordered',6,1,'2021-02-08 11:07:53.942539',19),(21,3,30000,'2021-02-08 11:20:16.793506','Ordered',6,2,'2021-02-08 11:20:16.800503',21),(22,3,3000,'2021-02-08 11:20:16.807886','Ordered',6,1,'2021-02-08 11:20:16.811912',21),(23,1,10000,'2021-02-08 11:20:27.308376','Ordered',6,2,'2021-02-08 11:20:27.313283',23),(24,1,1000,'2021-02-08 11:20:27.331952','Ordered',6,1,'2021-02-08 11:20:27.335948',23),(25,1,10000,'2021-02-08 11:40:27.625215','Ordered',6,2,'2021-02-08 11:40:27.634211',25),(26,1,1000,'2021-02-08 11:40:27.643205','Ordered',6,1,'2021-02-08 11:40:27.646205',25),(27,11,110000,'2021-02-08 13:02:26.872740','Ordered',9,2,'2021-02-08 13:02:26.884735',27),(28,1,1000,'2021-02-08 13:02:26.891552','Ordered',9,1,'2021-02-08 13:02:26.895546',27);
/*!40000 ALTER TABLE `order_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopwindow_category`
--

DROP TABLE IF EXISTS `shopwindow_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shopwindow_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shopwindow_category_name_ede33ab4` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopwindow_category`
--

LOCK TABLES `shopwindow_category` WRITE;
/*!40000 ALTER TABLE `shopwindow_category` DISABLE KEYS */;
INSERT INTO `shopwindow_category` VALUES (4,'가전'),(5,'도서'),(3,'생활용품'),(1,'식품'),(2,'주방용품');
/*!40000 ALTER TABLE `shopwindow_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopwindow_product`
--

DROP TABLE IF EXISTS `shopwindow_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shopwindow_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  `description` varchar(5000) NOT NULL,
  `quantity` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `category` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopwindow_product`
--

LOCK TABLES `shopwindow_product` WRITE;
/*!40000 ALTER TABLE `shopwindow_product` DISABLE KEYS */;
INSERT INTO `shopwindow_product` VALUES (1,'와플',5000,'맛있는 와플',100,'photo/user_와플/img1.jpg','식품'),(2,'사과',12000,'맛있는 사과 1박스',50,'photo/user_사과/img2.jpg','식품'),(3,'프라이팬',20000,'튼튼해',1000,'photo/user_프라이팬/img3.jpg','주방용품'),(4,'에어프라이어',129000,'6L',100,'photo/user_에어프라이어/img4.jpg','가전'),(5,'냉장고',1110000,'LG 냉장고',1000,'photo/user_냉장고/img5.jpg','가전'),(6,'각티슈',8600,'부드러운 티슈, 6개입',500,'photo/user_각티슈/img6_yrT1i9T.jpg','생활용품'),(7,'달러구트 꿈 백화점',12500,'베스트셀러',4000,'photo/user_달러구트 꿈 백화점/img7.jpg','도서'),(8,'아몬드',400,'베스트셀러, 손원평 장편소설',10000,'photo/user_아몬드/img8.jpg','도서'),(9,'마음챙김의 시',10800,'베스트셀러',998,'photo/user_마음챙김의 시/img9.jpg','도서'),(10,'나미야 잡화점의 기적',11100,'베스트셀러, 현대문학',999,'photo/user_나미야 잡화점의 기적/img10.jpg','도서'),(11,'일인칭 단수',13000,'베스트셀러',500,'photo/user_일인칭 단수/img11.jpg','도서'),(12,'코스모스',16650,'과학/공학',555,'photo/user_코스모스/img12.jpg','도서'),(13,'이기적유전자',18000,'과학/공학',777,'photo/user_이기적유전자/img13.jpg','도서'),(14,'괜찮지 않은데 괜찮은 척했다',12150,'소설/에세이',800,'photo/user_괜찮지 않은데 괜찮은 척했다/img14.jpg','도서'),(15,'하고 싶은 대로 살아도 괜찮아',11700,'소설/에세이',800,'photo/user_하고 싶은 대로 살아도 괜찮아/img15.jpg','도서'),(16,'동물 농장 사운드북',14400,'유아/어린이',10,'photo/user_동물 농장 사운드북/img16.jpg','도서'),(17,'주식투자 일주일 만에 뽀개기',19800,'경제/경영',90,'photo/user_주식투자 일주일 만에 뽀개기/img17.jpg','도서'),(18,'나는 퇴근 후 사장이 된다',11700,'경제/경영',900,'photo/user_나는 퇴근 후 사장이 된다/img18.jpg','도서'),(19,'피아노로 연주하는 디즈니 OST 베스트',13500,'예술',100,'photo/user_피아노로 연주하는 디즈니 OST 베스트/img19.jpg','도서'),(20,'비요뜨',12000,'서울우유 비요뜨 초코링, 12개',88,'photo/user_비요뜨/img20.jpg','식품'),(21,'우유',4600,'맛있는 우유, 2개',90,'photo/user_우유/img21.jpg','식품'),(22,'바나나맛우유',8900,'빙그레 바나나맛우유, 8개',100000,'photo/user_바나나맛우유/img22.jpg','식품'),(23,'간고등어살',11990,'gomgom 곰곰 노르웨이 간고등어살 1kg',78,'photo/user_간고등어살/img23.jpg','식품'),(24,'숙성 연어회',10200,'숙성 연어회, 150g',999,'photo/user_숙성 연어회/img24.jpg','식품'),(25,'김',7800,'곰곰 광천 도시락김, 32개입',10000,'photo/user_김/img25.jpg','식품'),(26,'수세미',6000,'수세미, 5개입',600,'photo/user_수세미/img26.jpg','주방용품'),(27,'식기세트',14100,'2인 식기세트 14p',100,'photo/user_식기세트/img27.jpg','주방용품'),(28,'접시세트',25000,'접시세트 4p',15,'photo/user_접시세트/img28.jpg','주방용품'),(29,'식탁보',8100,'앤티스 태슬 코튼린넨 식탁보',100,'photo/user_식탁보/img29.jpg','주방용품'),(30,'데스크매트',14450,'쾌청 투명 데스크매트 일반형 두께 2mm',100,'photo/user_데스크매트/img30.jpg','주방용품'),(31,'주방칼 가위 세트',18570,'스위스밀리터리 주방칼 가위 3종 세트',1857,'photo/user_주방칼 가위 세트/img31.jpg','주방용품'),(32,'섬유유연제',19400,'2020 다우니 엑스퍼트 실내건조 초고농축 섬유유연제 본품',555,'photo/user_섬유유연제/img32.jpg','생활용품'),(33,'샴푸',21900,'닥터방기원 댄드러프 비듬케어 탈모샴푸',100,'photo/user_샴푸/img33.jpg','생활용품'),(34,'치약',35580,'마비스 치약 3종 세트',99,'photo/user_치약/img34.jpg','생활용품'),(35,'칫솔 치약 케이스',4180,'라이프토템 칫솔 치약 케이스',56,'photo/user_칫솔 치약 케이스/img35.jpg','생활용품'),(36,'마스크',11000,'한스웰 한마음 일회용 황사 마스크 대형 KF94',9090,'photo/user_마스크/img36.jpg','생활용품'),(37,'섬유탈취제',12960,'페브리즈 항균플러스 섬유탈취제 깨끗한향 본품',234,'photo/user_섬유탈취제/img37.jpg','생활용품'),(38,'디퓨저',12900,'부케가르니 디퓨저 200ml x 2p',234,'photo/user_디퓨저/img38.jpg','생활용품'),(39,'선반',9240,'코멧 3단 이동식 틈새 선반',345,'photo/user_선반/img39.jpg','생활용품'),(40,'치약칫솔걸이',8160,'뉴엔에스 다기능 치약칫솔걸이 2구',456,'photo/user_치약칫솔걸이/img40.jpg','생활용품'),(41,'행거',8440,'코멧 홈 우드볼 도어행거',567,'photo/user_행거/img41.jpg',''),(42,'핫팩',18090,'탐사 포켓용 대용량 핫팩 140g',123,'photo/user_핫팩/img42.jpg','생활용품'),(43,'난방텐트',23200,'핫방 NEW 야옹이 프리미엄 원터치 난방텐트',363465,'photo/user_난방텐트/img43.jpg','생활용품'),(44,'에어캡',8490,'탐사 3중 단열 뽁뽁이 에어캡',2345,'photo/user_에어캡/img44.jpg','생활용품'),(45,'빔프로젝터',109000,'씨앤케이 미니 빔프로젝터',234234,'photo/user_빔프로젝터/img45.jpg','가전'),(46,'tv stick',37000,'샤오미 미 티비 스틱 mi tv stick',53434,'photo/user_tv stick/img46.png','가전'),(47,'TV',225000,'프리즘 Full HD 101.6cm TV PT400FD',234,'photo/user_TV/img47.jpg','가전'),(48,'HP 화이트 노트북 15s-fq1007TU',599000,'HP 화이트 노트북 15s-fq1007TU (i5-1035G1 39.6cm )',123,'photo/user_HP 화이트 노트북 15s-fq1007TU/img47.jpg','가전'),(49,'니콘 D850 DSLR BODY',2696000,'니콘 D850 DSLR BODY',234,'photo/user_니콘 D850 DSLR BODY/img48.jpg','가전'),(50,'촬영 조명',77000,'유미상점 18인치 LED 링라이트 방송 촬영 조명 DSLR',234,'photo/user_촬영 조명/img49.jpg','가전');
/*!40000 ALTER TABLE `shopwindow_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopwindow_questionanswer`
--

DROP TABLE IF EXISTS `shopwindow_questionanswer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shopwindow_questionanswer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `content` longtext NOT NULL,
  `create_dt` datetime(6) NOT NULL,
  `modify_dt` datetime(6) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shopwindow_questionanswer_owner_id_6bbfa675_fk_auth_user_id` (`owner_id`),
  KEY `shopwindow_questiona_product_id_6c140bba_fk_shopwindo` (`product_id`),
  CONSTRAINT `shopwindow_questiona_product_id_6c140bba_fk_shopwindo` FOREIGN KEY (`product_id`) REFERENCES `shopwindow_product` (`id`),
  CONSTRAINT `shopwindow_questionanswer_owner_id_6bbfa675_fk_auth_user_id` FOREIGN KEY (`owner_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopwindow_questionanswer`
--

LOCK TABLES `shopwindow_questionanswer` WRITE;
/*!40000 ALTER TABLE `shopwindow_questionanswer` DISABLE KEYS */;
INSERT INTO `shopwindow_questionanswer` VALUES (1,'상품문의','문의문의문의문의문의문의문의문의문의문의문의문의문의문의문의문의문의문의문의문의문의문의문의문의문의문의문의문의문의문의문의문의','2021-02-07 23:44:55.022380','2021-02-07 23:44:55.022380',3,1),(2,'배송문의','질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문','2021-02-07 23:47:45.845937','2021-02-07 23:47:45.845937',4,3),(3,'문의','질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문질문','2021-02-08 13:01:58.765555','2021-02-08 13:01:58.765555',5,2);
/*!40000 ALTER TABLE `shopwindow_questionanswer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopwindow_review`
--

DROP TABLE IF EXISTS `shopwindow_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shopwindow_review` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `content` longtext NOT NULL,
  `create_dt` datetime(6) NOT NULL,
  `modify_dt` datetime(6) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shopwindow_review_owner_id_be74593b_fk_auth_user_id` (`owner_id`),
  KEY `shopwindow_review_product_id_ff84dbc5_fk_shopwindow_product_id` (`product_id`),
  CONSTRAINT `shopwindow_review_owner_id_be74593b_fk_auth_user_id` FOREIGN KEY (`owner_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `shopwindow_review_product_id_ff84dbc5_fk_shopwindow_product_id` FOREIGN KEY (`product_id`) REFERENCES `shopwindow_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopwindow_review`
--

LOCK TABLES `shopwindow_review` WRITE;
/*!40000 ALTER TABLE `shopwindow_review` DISABLE KEYS */;
INSERT INTO `shopwindow_review` VALUES (1,'와플 후기','<p>맛있다 맛있다맛있다</p>\r\n<p>맛있다맛있다맛있다 맛있다맛있다</p>\r\n<p>맛있다맛있다</p>\r\n<p>맛있다맛있다맛있다맛있다맛있다</p>','2021-02-05 10:17:57.717545','2021-02-08 15:17:48.267243',3,1),(2,'맛있다','<p>맛있다</p>\r\n<p>맛있다</p>\r\n<p>맛있다</p>\r\n<p>맛있다</p>','2021-02-05 10:18:26.333056','2021-02-08 15:21:00.243774',4,2),(3,'후기','<p>첫번째 후기 블라블라</p>','2021-02-05 10:23:54.988880','2021-02-08 15:29:41.053353',5,3),(4,'title','content','2021-02-05 10:42:48.206578','2021-02-05 10:42:48.206578',4,3),(5,'title','content','2021-02-05 10:44:38.667002','2021-02-05 10:44:38.667002',5,1),(6,'title','content','2021-02-05 10:57:25.794688','2021-02-05 10:57:25.794688',6,6),(8,'title','<p>content</p>','2021-02-05 11:10:28.002954','2021-02-08 15:21:37.173207',5,4),(9,'title','<p>content</p>','2021-02-05 11:11:07.781138','2021-02-08 15:21:46.825234',7,4),(10,'title','<p>content</p>','2021-02-05 11:11:24.607463','2021-02-08 15:21:56.227473',8,6),(11,'title','content','2021-02-05 11:12:03.030224','2021-02-05 11:12:03.030224',9,3),(12,'title','content','2021-02-05 11:15:57.254437','2021-02-05 11:15:57.254437',8,2),(13,'ㅁㄴㅇㄹ','ㅁㄴㅇㄻㄴㅇ','2021-02-05 13:27:31.010077','2021-02-05 13:27:31.010077',4,1),(16,'후기','asdfafdasdf','2021-02-05 13:45:40.138414','2021-02-05 13:45:40.138414',3,2),(17,'후기','asdfafdasdf','2021-02-05 13:50:20.225462','2021-02-05 13:50:20.225462',4,2),(18,'후기','asdfafdasdf\r\nasdfafdasdfasdfafdasdfasdfafdasdf\r\nasdfafdasdfasdfafdasdf\r\nasdfafdasdfasdfafdasdf\r\nasdfafdasdfasdfafdasdfasdfafdasdfasdfafdasdf\r\nasdfafdasdfasdfafdasdfasdfafdasdf','2021-02-05 13:50:43.467220','2021-02-07 16:53:13.073948',5,1),(20,'후기','asdfasdf','2021-02-05 14:00:17.070027','2021-02-05 14:00:17.070027',3,4),(21,'후기','asdfasdf','2021-02-05 14:01:59.302125','2021-02-05 14:01:59.302125',9,4),(22,'제목asdfasdf','asdfasdfasdf\r\nasdfasdfasdf\r\nasdfasdfasdf\r\nasdfasdfasdfasdfasdfasdfasdfasdfasdf\r\nasdfasdfasdfasdfasdfasdf','2021-02-05 14:02:09.491518','2021-02-07 22:33:58.998671',4,1),(23,'후기','후기후기후기후기내용내용내용내용\r\n후기후기후기후기내용내용내용내용\r\n후기후기후기후기내용내용내용내용\r\n후기후기후기후기내용내용내용내용\r\n후기후기후기후기내용내용내용내용후기후기후기후기내용내용내용내용\r\n후기후기후기후기내용내용내용내용\r\n후기후기후기후기내용내용내용내용후기후기후기후기내용내용내용내용후기후기후기후기내용내용내용내용후기후기후기후기내용내용내용내용후기후기후기후기내용내용내용내용','2021-02-05 14:02:45.306589','2021-02-07 17:02:38.636175',5,6),(26,'후기','aasdfasdf','2021-02-05 14:54:15.128050','2021-02-05 14:54:15.128050',6,6),(28,'후기후기후기후기후기','후기후기후기후기후기\r\n후기후기후기후기후기\r\n후기후기후기후기후기\r\n후기후기후기후기후기\r\n후기후기후기후기후기\r\n후기후기후기후기후기후기후기후기후기후기','2021-02-07 16:38:48.146192','2021-02-07 16:38:48.146192',5,1),(29,'후기','후기입니다후기입니다후기입니다후기입니다후기입니다후기입니다후기입니다후기입니다후기입니다후기입니다후기입니다후기입니다후기입니다후기입니다후기입니다후기입니다후기입니다후기입니다후기입니다후기입니다후기입니다후기입니다후기입니다후기입니다후기입니다후기입니다후기입니다후기입니다후기입니다후기입니다후기입니다','2021-02-07 20:55:29.987080','2021-02-07 20:55:29.987080',6,4),(31,'후후후후기기기기','<p>어쩌구</p>\r\n<p>&nbsp;</p>','2021-02-07 22:46:12.635763','2021-02-07 22:54:03.261044',7,1),(32,'후기','<p>오예오예오예오예오예오예오예오예오예오예오예오예오예오예오예오예오예오예오예오예오예오예오예오예오예오예오예오예오예오예오예오예오예오예오예오예오예오예오예오예오예오예오예오예오예오예오예오예오예</p>','2021-02-07 22:56:42.735541','2021-02-07 22:57:46.679000',7,7),(33,'후기','<p>아에이오우아에이오우아에이오우아에이오우아에이오우아에이오우아에이오우아에이오우아에이오우아에이오우아에이오우아에이오우아에이오우아에이오우아에이오우아에이오우아에이오우아에이오우아에이오우아에이오우아에이오우아에이오우아에이오우아에이오우아에이오우아에이오우아에이오우아에이오우아에이오우아에이오우아에이오우아에이오우아에이오우아에이오우아에이오우</p>','2021-02-07 22:58:05.051062','2021-02-07 22:58:05.051062',7,7);
/*!40000 ALTER TABLE `shopwindow_review` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-08 15:40:55
