CREATE DATABASE  IF NOT EXISTS `volonteri` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `volonteri`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: volonteri
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.30-MariaDB

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `email` varchar(45) NOT NULL,
  `lozinka` varchar(45) NOT NULL,
  `imePrezime` varchar(100) NOT NULL,
  `tip` int(11) NOT NULL DEFAULT '3',
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'srki@bla.com','nesto','Srdjan Abadzija',3);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dani`
--

DROP TABLE IF EXISTS `dani`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dani` (
  `iddani` int(11) NOT NULL,
  `dan` varchar(45) NOT NULL,
  PRIMARY KEY (`iddani`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dani`
--

LOCK TABLES `dani` WRITE;
/*!40000 ALTER TABLE `dani` DISABLE KEYS */;
INSERT INTO `dani` VALUES (1,'Ponedeljak'),(2,'Utorak'),(3,'Sreda'),(4,'Cetvrtak'),(5,'Petak'),(6,'Subota'),(7,'Nedelja');
/*!40000 ALTER TABLE `dani` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drzavljanstvo`
--

DROP TABLE IF EXISTS `drzavljanstvo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drzavljanstvo` (
  `iddrz` int(11) NOT NULL AUTO_INCREMENT,
  `drzavljanstvo` varchar(100) NOT NULL,
  PRIMARY KEY (`iddrz`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drzavljanstvo`
--

LOCK TABLES `drzavljanstvo` WRITE;
/*!40000 ALTER TABLE `drzavljanstvo` DISABLE KEYS */;
INSERT INTO `drzavljanstvo` VALUES (1,'Srbija');
/*!40000 ALTER TABLE `drzavljanstvo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oblasti`
--

DROP TABLE IF EXISTS `oblasti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oblasti` (
  `idoblasti` int(11) NOT NULL AUTO_INCREMENT,
  `naziv_oblasti` varchar(100) NOT NULL,
  PRIMARY KEY (`idoblasti`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oblasti`
--

LOCK TABLES `oblasti` WRITE;
/*!40000 ALTER TABLE `oblasti` DISABLE KEYS */;
/*!40000 ALTER TABLE `oblasti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organizacija`
--

DROP TABLE IF EXISTS `organizacija`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organizacija` (
  `idorganizacija` int(11) NOT NULL AUTO_INCREMENT,
  `naziv` varchar(100) NOT NULL,
  `mesto_id` int(11) NOT NULL,
  `pib` int(11) NOT NULL,
  `email` varchar(45) NOT NULL,
  `tekst` longtext NOT NULL,
  `oblast_id` int(11) NOT NULL,
  `web_adresa` varchar(45) NOT NULL,
  `lozinka` varchar(45) NOT NULL,
  `tip` int(11) NOT NULL DEFAULT '2',
  `ulica_broj` varchar(100) NOT NULL,
  `kontakt_tel` varchar(45) NOT NULL,
  PRIMARY KEY (`idorganizacija`),
  KEY `mestoKey_idx` (`mesto_id`),
  KEY `oblastiKey_idx` (`oblast_id`),
  CONSTRAINT `mesto_idKey` FOREIGN KEY (`mesto_id`) REFERENCES `tblgrad` (`Id`),
  CONSTRAINT `oblastiKey` FOREIGN KEY (`oblast_id`) REFERENCES `oblasti` (`idoblasti`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organizacija`
--

LOCK TABLES `organizacija` WRITE;
/*!40000 ALTER TABLE `organizacija` DISABLE KEYS */;
/*!40000 ALTER TABLE `organizacija` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `raspolozivost`
--

DROP TABLE IF EXISTS `raspolozivost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `raspolozivost` (
  `idvolontera` int(11) NOT NULL,
  `iddana` int(11) NOT NULL,
  PRIMARY KEY (`idvolontera`,`iddana`),
  KEY `iddanaKey_idx` (`iddana`),
  CONSTRAINT `iddanaKey` FOREIGN KEY (`iddana`) REFERENCES `dani` (`iddani`) ON UPDATE CASCADE,
  CONSTRAINT `idvolontera` FOREIGN KEY (`idvolontera`) REFERENCES `volonter` (`idvolonter`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `raspolozivost`
--

LOCK TABLES `raspolozivost` WRITE;
/*!40000 ALTER TABLE `raspolozivost` DISABLE KEYS */;
INSERT INTO `raspolozivost` VALUES (6,3);
/*!40000 ALTER TABLE `raspolozivost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skola`
--

DROP TABLE IF EXISTS `skola`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skola` (
  `idvolont` int(11) NOT NULL,
  `idskolaSif` int(11) NOT NULL,
  `nivo` varchar(45) DEFAULT NULL,
  `godina_upisa` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`idvolont`,`idskolaSif`),
  KEY `idvolKey_idx` (`idvolont`),
  KEY `volKey_idx` (`idvolont`),
  KEY `skolaKey_idx` (`idskolaSif`),
  CONSTRAINT `skolaKey` FOREIGN KEY (`idskolaSif`) REFERENCES `skolasif` (`idskolaSif`) ON UPDATE CASCADE,
  CONSTRAINT `volonterKey` FOREIGN KEY (`idvolont`) REFERENCES `volonter` (`idvolonter`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skola`
--

LOCK TABLES `skola` WRITE;
/*!40000 ALTER TABLE `skola` DISABLE KEYS */;
/*!40000 ALTER TABLE `skola` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skolasif`
--

DROP TABLE IF EXISTS `skolasif`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skolasif` (
  `idskolaSif` int(11) NOT NULL AUTO_INCREMENT,
  `nazivSkole` varchar(100) NOT NULL,
  `mesto` varchar(100) NOT NULL,
  PRIMARY KEY (`idskolaSif`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skolasif`
--

LOCK TABLES `skolasif` WRITE;
/*!40000 ALTER TABLE `skolasif` DISABLE KEYS */;
/*!40000 ALTER TABLE `skolasif` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statussif`
--

DROP TABLE IF EXISTS `statussif`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statussif` (
  `idstatusSif` int(11) NOT NULL,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`idstatusSif`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statussif`
--

LOCK TABLES `statussif` WRITE;
/*!40000 ALTER TABLE `statussif` DISABLE KEYS */;
INSERT INTO `statussif` VALUES (1,'Zaposlen'),(2,'Nezaposlen'),(3,'Na skolovanju'),(4,'U penziji');
/*!40000 ALTER TABLE `statussif` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblgrad`
--

DROP TABLE IF EXISTS `tblgrad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblgrad` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Naziv_Mesta` char(23) DEFAULT NULL,
  `Postanski_Broj` int(11) DEFAULT NULL,
  `Okrug` char(24) DEFAULT NULL,
  `Opstina` char(23) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=1130 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblgrad`
--

LOCK TABLES `tblgrad` WRITE;
/*!40000 ALTER TABLE `tblgrad` DISABLE KEYS */;
INSERT INTO `tblgrad` VALUES (1,'Ada',24430,'Severnobanatski okrug','Ada'),(2,'Adaševci',22244,'Sremski okrug','Šid'),(3,'Adorjan',24425,'Severnobanatski okrug','Kanjiža'),(4,'Adrani',36203,'Raški okrug','Kraljevo'),(5,'Azanja',11423,'Podunavski okrug','Smederevska Palanka'),(6,'Aleksa Šantić',25212,'Zapadnobački okrug','Sombor'),(7,'Aleksandrovac',12370,'Braničevski okrug','Žabari'),(8,'Aleksandrovac',37230,'Rasinski okrug','Aleksandrovac'),(9,'Aleksandrovo',23217,'Srednjobanatski okrug','Nova Crnja'),(10,'Aleksinac',18220,'Nišavski okrug','Aleksinac'),(11,'Aleksinački Rudnik',18226,'Nišavski okrug','Aleksinac'),(12,'Alibunar',26310,'Južnobanatski okrug','Alibunar'),(13,'Aljinovići',31307,'Zlatiborski okrug','Prijepolje'),(14,'Apatin',25260,'Zapadnobački okrug','Apatin'),(15,'Aradac',23207,'Srednjobanatski okrug','Zrenjanin'),(16,'Aranđelovac',34300,'Šumadijski okrug','Aranđelovac'),(17,'Arilje',31230,'Zlatiborski okrug','Arilje'),(18,'Ašanja',22418,'Sremski okrug','Pećinci'),(19,'Babušnica',18330,'Pirotski okrug','Babušnica'),(20,'Bavanište',26222,'Južnobanatski okrug','Kovin'),(21,'Bagrdan',35204,'Pomoravski okrug','Jagodina'),(22,'Badnjevac',34226,'Šumadijski okrug','Batočina'),(23,'Badovinci',15358,'Mačvanski okrug','Bogatić'),(24,'Bajina Bašta',31250,'Zlatiborski okrug','Bajina Bašta'),(25,'Bajmok',24210,'Severnobački okrug','Subotica'),(26,'Bajša',24331,'Severnobački okrug','Bačka Topola'),(27,'Balajnac',18257,'Nišavski okrug','Merošina'),(28,'Baljevac',36344,'Raški okrug','Raška'),(29,'Banatska Dubica',23251,'Srednjobanatski okrug','Sečanj'),(30,'Banatska Palanka',26324,'Južnobanatski okrug','Bela Crkva'),(31,'Banatska Subotica',26327,'Južnobanatski okrug','Bela Crkva'),(32,'Banatska Topola',23315,'Severnobanatski okrug','Kikinda'),(33,'Banatski Brestovac',26234,'Južnobanatski okrug','Pančevo'),(34,'Banatski Dvor',23213,'Srednjobanatski okrug','Žitište'),(35,'Banatski Despotovac',23242,'Srednjobanatski okrug','Zrenjanin'),(36,'Banatski Karlovac',26320,'Južnobanatski okrug','Alibunar'),(37,'Banatsko Aranđelovo',23332,'Severnobanatski okrug','Novi Kneževac'),(38,'Banatsko Veliko Selo',23312,'Severnobanatski okrug','Kikinda'),(39,'Banatsko Karađorđevo',23216,'Srednjobanatski okrug','Žitište'),(40,'Banatsko Novo Selo',26314,'Južnobanatski okrug','Pančevo'),(41,'Banovo Polje',15362,'Mačvanski okrug','Bogatić'),(42,'Banovci-Dunav',22303,'Sremski okrug','Stara Pazova'),(43,'Banoštor',21312,'Južnobački okrug','Beočin'),(44,'Banja',34304,'Šumadijski okrug','Aranđelovac'),(45,'Banja (kod Priboja)',31337,'Zlatiborski okrug','Priboj'),(46,'Banja Koviljača',15316,'Mačvanski okrug','Loznica'),(47,'Banjani',14214,'Kolubarski okrug','Ub'),(48,'Banjska',38216,'Kosovskomitrovački okrug','Zvečan'),(49,'Barajevo',11460,'Grad Beograd','Barajevo'),(50,'Baranda',26205,'Južnobanatski okrug','Opovo'),(51,'Barbatovac',18426,'Toplički okrug','Blace'),(52,'Bare',12227,'Braničevski okrug','Požarevac'),(53,'Bare',34205,'Šumadijski okrug','Knić'),(54,'Bare',36315,'Zlatiborski okrug','Sjenica'),(55,'Barice',26367,'Južnobanatski okrug','Plandište'),(56,'Barič',11504,'Grad Beograd','Obrenovac'),(57,'Barlovo',18432,'Toplički okrug','Kuršumlija'),(58,'Baroševac',11565,'Grad Beograd','Lazarevac'),(59,'Batočina',34227,'Šumadijski okrug','Batočina'),(60,'Batrovci',22251,'Sremski okrug','Šid'),(61,'Batuse',38210,'Kosovski okrug','Kosovo Polje'),(62,'Bač',21420,'Južnobački okrug','Bač'),(63,'Bačevci',31258,'Zlatiborski okrug','Bajina Bašta'),(64,'Bačina',37265,'Rasinski okrug','Varvarin'),(65,'Bačinci',22225,'Sremski okrug','Šid'),(66,'Bačka Palanka',21400,'Južnobački okrug','Bačka Palanka'),(67,'Bačka Topola',24300,'Severnobački okrug','Bačka Topola'),(68,'Bački Breg',25275,'Zapadnobački okrug','Sombor'),(69,'Bački Brestovac',25242,'Zapadnobački okrug','Odžaci'),(70,'Bački Vinogradi',24415,'Severnobački okrug','Subotica'),(71,'Bački Gračac',25252,'Zapadnobački okrug','Odžaci'),(72,'Bački Jarak',21234,'Južnobački okrug','Temerin'),(73,'Bački Monoštor',25272,'Zapadnobački okrug','Sombor'),(74,'Bački Petrovac',21470,'Južnobački okrug','Bački Petrovac'),(75,'Bački Sokolac',24343,'Severnobački okrug','Bačka Topola'),(76,'Bačko Gradište',21217,'Južnobački okrug','Bečej'),(77,'Bačko Dobro Polje',21465,'Južnobački okrug','Vrbas'),(78,'Bačko Novo Selo',21429,'Južnobački okrug','Bač'),(79,'Bačko Petrovo Selo',21226,'Južnobački okrug','Bečej'),(80,'Bašaid',23316,'Severnobanatski okrug','Kikinda'),(81,'Begeč',21411,'Južnobački okrug','Novi Sad'),(82,'Bezdan',25270,'Zapadnobački okrug','Sombor'),(83,'Bela Voda',37253,'Rasinski okrug','Grad Kruševac'),(84,'Bela Zemlja',31311,'Zlatiborski okrug','Užice'),(85,'Bela Palanka',18310,'Pirotski okrug','Bela Palanka'),(86,'Bela Crkva',15313,'Mačvanski okrug','Krupanj'),(87,'Bela Crkva',26340,'Južnobanatski okrug','Bela Crkva'),(88,'Belanovica',14246,'Kolubarski okrug','Ljig'),(89,'Bele Vode',32259,'Moravički okrug','Ivanjica'),(90,'Belegiš',22306,'Sremski okrug','Stara Pazova'),(91,'Beli Potok',11223,'Grad Beograd','Voždovac'),(92,'Beli Potok',19366,'Zaječarski okrug','Knjaževac'),(93,'Belo Blato',23205,'Srednjobanatski okrug','Zrenjanin'),(94,'Beloljin',18424,'Toplički okrug','Prokuplje'),(95,'Belosavci',34312,'Šumadijski okrug','Topola'),(96,'Belotinac',18411,'Nišavski okrug','Opština Doljevac'),(97,'Beloševac',34208,'Šumadijski okrug','Pivara'),(98,'Belušić',35263,'Pomoravski okrug','Rekovac'),(99,'Beljina',11461,'Grad Beograd','Barajevo'),(100,'Beograd',11000,'Grad Beograd','Beograd'),(101,'Beočin',21300,'Južnobački okrug','Beočin'),(102,'Berkasovo',22242,'Sremski okrug','Šid'),(103,'Bečej',21220,'Južnobački okrug','Bečej'),(104,'Bešenovo',22212,'Sremski okrug','Sremska Mitrovica'),(105,'Beška',22324,'Sremski okrug','Inđija'),(106,'Bigrenica',35238,'Pomoravski okrug','Đuprija'),(107,'Bikić Do',22254,'Sremski okrug','Šid'),(108,'Bikovo',24206,'Severnobački okrug','Subotica'),(109,'Biljača',17522,'Pčinjski okrug','Bujanovac'),(110,'Bingula',22253,'Sremski okrug','Šid'),(111,'Bioska',31241,'Zlatiborski okrug','Užice'),(112,'Bistar',17546,'Pčinjski okrug','Bosilegrad'),(113,'Bistrica',31325,'Zlatiborski okrug','Nova Varoš'),(114,'Blaževo',37226,'Rasinski okrug','Brus'),(115,'Blace',18420,'Toplički okrug','Blace'),(116,'Bobovo',35217,'Pomoravski okrug','Svilajnac'),(117,'Bogaraš',24408,'Severnobanatski okrug','Senta'),(118,'Bogatić',15350,'Mačvanski okrug','Bogatić'),(119,'Bogovađa',14225,'Kolubarski okrug','Lajkovac'),(120,'Bogovina',19372,'Zaječarski okrug','Boljevac'),(121,'Bogojevo',25245,'Zapadnobački okrug','Odžaci'),(122,'Bogojevce',16254,'Jablanički okrug','Leskovac'),(123,'Bogutovac',36341,'Raški okrug','Kraljevo'),(124,'Bođani',21427,'Južnobački okrug','Bač'),(125,'Boževac',12313,'Braničevski okrug','Malo Crniće'),(126,'Božetići',31322,'Zlatiborski okrug','Nova Varoš'),(127,'Božica',17537,'Pčinjski okrug','Opština Surdulica'),(128,'Bojnik',16205,'Jablanički okrug','Bojnik'),(129,'Boka',23252,'Srednjobanatski okrug','Sečanj'),(130,'Boljevac',19370,'Zaječarski okrug','Boljevac'),(131,'Boljkovci',32312,'Moravički okrug','Gornji Milanovac'),(132,'Bor',19210,'Borski okrug','Bor'),(133,'Borski Brestovac',19229,'Borski okrug','Bor'),(134,'Bosilegrad',17540,'Pčinjski okrug','Opština Bosilegrad'),(135,'Bosut',22217,'Sremski okrug','Sremska Mitrovica'),(136,'Botoš',23243,'Srednjobanatski okrug','Zrenjanin'),(137,'Bočar',23274,'Srednjobanatski okrug','Novi Bečej'),(138,'Bošnjane',37262,'Rasinski okrug','Varvarin'),(139,'Bošnjace',16232,'Jablanički okrug','Lebane'),(140,'Bradarac',12206,'Braničevski okrug','Požarevac'),(141,'Braničevo',12222,'Braničevski okrug','Golubac'),(142,'Brankovina',14201,'Kolubarski okrug','Valjevo'),(143,'Bratljevo',32256,'Moravički okrug','Ivanjica'),(144,'Braćevac',19315,'Borski okrug','Negotin'),(145,'Brvenik',36346,'Raški okrug','Raška'),(146,'Brgule',14212,'Kolubarski okrug','Ub'),(147,'Brđani',32303,'Moravički okrug','Gornji Milanovac'),(148,'Brežđe',14244,'Kolubarski okrug','Mionica'),(149,'Brezjak',15309,'Mačvanski okrug','Loznica'),(150,'Brezna',32307,'Moravički okrug','Gornji Milanovac'),(151,'Brezova',32253,'Moravički okrug','Ivanjica'),(152,'Brezovica',38157,'Kosovski okrug','Štrpce'),(153,'Brekovo',31234,'Zlatiborski okrug','Arilje'),(154,'Bresnica',32213,'Moravički okrug','Čačak'),(155,'Brestovac',16253,'Jablanički okrug','Leskovac'),(156,'Brestovačka Banja',19216,'Borski okrug','Bor'),(157,'Brza Palanka',19323,'Borski okrug','Kladovo'),(158,'Brzi Brod',18116,'Nišavski okrug','Medijana'),(159,'Brzan',34228,'Šumadijski okrug','Batočina'),(160,'Brzeće',37225,'Rasinski okrug','Brus'),(161,'Brodarevo',31305,'Zlatiborski okrug','Prijepolje'),(162,'Brus',37220,'Rasinski okrug','Brus'),(163,'Brusnik',19313,'Zaječarski okrug','Zaječar'),(164,'Budisava',21242,'Južnobački okrug','Novi Sad'),(165,'Buđanovci',22421,'Sremski okrug','Ruma'),(166,'Bujanovac',17520,'Pčinjski okrug','Bujanovac'),(167,'Bukovac',21209,'Južnobački okrug','Petrovaradin'),(168,'Bukovik',34301,'Šumadijski okrug','Aranđelovac'),(169,'Bukovica',32251,'Moravički okrug','Ivanjica'),(170,'Bukorovac',34217,'Šumadijski okrug','Pivara'),(171,'Bunar',35273,'Pomoravski okrug','Jagodina'),(172,'Burdimo',18368,'Nišavski okrug','Svrljig'),(173,'Burovac',12307,'Braničevski okrug','Petrovac na Mlavi'),(174,'Busilovac',35249,'Pomoravski okrug','Paraćin'),(175,'Bučje',19369,'Zaječarski okrug','Knjaževac'),(176,'Vajska',21426,'Južnobački okrug','Bač'),(177,'Valjevo',14000,'Kolubarski okrug','Valjevo'),(178,'Varvarin',37260,'Rasinski okrug','Varvarin'),(179,'Varda',31263,'Zlatiborski okrug','Kosjerić'),(180,'Varna',15232,'Mačvanski okrug','Šabac'),(181,'Varoš',18363,'Nišavski okrug','Svrljig'),(182,'Vasilj',19367,'Zaječarski okrug','Knjaževac'),(183,'Vatin',26337,'Južnobanatski okrug','Vršac'),(184,'Vašica',22241,'Sremski okrug','Šid'),(185,'Velebit',24428,'Severnobanatski okrug','Kanjiža'),(186,'Velesnica',19328,'Borski okrug','Kladovo'),(187,'Velika Vrbnica',37233,'Rasinski okrug','Aleksandrovac'),(188,'Velika Grabovnica',16221,'Jablanički okrug','Leskovac'),(189,'Velika Greda',26366,'Južnobanatski okrug','Plandište'),(190,'Velika Drenova',37245,'Rasinski okrug','Trstenik'),(191,'Velika Ivanča',11414,'Grad Beograd','Mladenovac'),(192,'Velika Jasikova',19235,'Zaječarski okrug','Zaječar'),(193,'Velika Krsna',11408,'Grad Beograd','Mladenovac'),(194,'Velika Lomnica',37209,'Rasinski okrug','Kruševac'),(195,'Velika Moštanica',11262,'Grad Beograd','Čukarica'),(196,'Velika Plana',11320,'Podunavski okrug','Velika Plana'),(197,'Velika Plana',18403,'Toplički okrug','Prokuplje'),(198,'Velika Reka',15322,'Mačvanski okrug','Mali Zvornik'),(199,'Veliki Borak',11462,'Grad Beograd','Barajevo'),(200,'Veliki Gaj',26365,'Južnobanatski okrug','Plandište'),(201,'Veliki Izvor',19206,'Zaječarski okrug','Zaječar'),(202,'Veliki Popović',35223,'Pomoravski okrug','Despotovac'),(203,'Veliki Radinci',22211,'Sremski okrug','Sremska Mitrovica'),(204,'Veliki Trnovac',17528,'Pčinjski okrug','Bujanovac'),(205,'Veliki Crljeni',11563,'Grad Beograd','Lazarevac'),(206,'Veliki Šiljegovac',37204,'Rasinski okrug','Kruševac'),(207,'Veliko Bonjince',18215,'Pirotski okrug','Babušnica'),(208,'Veliko Gradište',12220,'Braničevski okrug','Veliko Gradište'),(209,'Veliko Laole',12306,'Braničevski okrug','Petrovac na Mlavi'),(210,'Veliko Orašje',11323,'Podunavski okrug','Velika Plana'),(211,'Veliko Središte',26334,'Južnobanatski okrug','Vršac'),(212,'Venčane',34306,'Šumadijski okrug','Aranđelovac'),(213,'Veternik',21203,'Južnobački okrug','Novi Sad'),(214,'Vilovo',21246,'Južnobački okrug','Titel'),(215,'Vina',19368,'Zaječarski okrug','Knjaževac'),(216,'Vionica',32254,'Moravički okrug','Ivanjica'),(217,'Visočka Ržana',18306,'Pirotski okrug','Pirot'),(218,'Vitanovac',36206,'Raški okrug','Kraljevo'),(219,'Vitkovac',36207,'Raški okrug','Kraljevo'),(220,'Vitoševac',37213,'Nišavski okrug','Ražanj'),(221,'Viča',32233,'Moravički okrug','Lučani'),(222,'Višnjevac',24222,'Severnobački okrug','Subotica'),(223,'Višnjićevo',22246,'Sremski okrug','Šid'),(224,'Vladimirovac',26315,'Južnobanatski okrug','Alibunar'),(225,'Vladimirci',15225,'Mačvanski okrug','Vladimirci'),(226,'Vladičin Han',17510,'Pčinjski okrug','Vladičin Han'),(227,'Vlajkovac',26332,'Južnobanatski okrug','Vršac'),(228,'Vlase',17507,'Vranje','Pčinjski okrug'),(229,'Vlasotince',16210,'Jablanički okrug','Vlasotince'),(230,'Vlaška',11406,'Grad Beograd','Mladenovac'),(231,'Voganj',22429,'Sremski okrug','Ruma'),(232,'Vodanj',11328,'Podunavski okrug','Smederevo'),(233,'Vojvoda Stepa',23219,'Srednjobanatski okrug','Nova Crnja'),(234,'Vojvodinci',26338,'Južnobanatski okrug','Vršac'),(235,'Vojka',22313,'Sremski okrug','Stara Pazova'),(236,'Vojska',35208,'Pomoravski okrug','Svilajnac'),(237,'Voluja',12256,'Braničevski okrug','Kučevo'),(238,'Vražogrnac',19312,'Zaječarski okrug','Zaječar'),(239,'Vranić',11427,'Grad Beograd','Barajevo'),(240,'Vranovo',11329,'Podunavski okrug','Smederevo'),(241,'Vranje',17501,'Pčinjski okrug','Vranje'),(242,'Vranjska Banja',17541,'Pčinjski okrug','Vranje'),(243,'Vratarnica',19344,'Zaječarski okrug','Zaječar'),(244,'Vraćevšnica',32315,'Moravički okrug','Gornji Milanovac'),(245,'Vračev Gaj',26348,'Južnobanatski okrug','Bela Crkva'),(246,'Vrba',36214,'Raški okrug','Kraljevo'),(247,'Vrbas',21460,'Južnobački okrug','Vrbas'),(248,'Vrbica',23329,'Severnobanatski okrug','Čoka'),(249,'Vrbovac',38263,'Kosovskopomoravski okrug','Vitina'),(250,'Vrdnik',22408,'Sremski okrug','Irig'),(251,'Vreoci',11560,'Grad Beograd','Lazarevac'),(252,'Vrmdža',18236,'Nišavski okrug','Sokobanja'),(253,'Vrnjačka Banja',36210,'Raški okrug','Vrnjačka Banja'),(254,'Vrnjci',36217,'Raški okrug','Vrnjačka Banja'),(255,'Vrćenovica',18221,'Nišavski okrug','Aleksinac'),(256,'Vrhpolje',15324,'Mačvanski okrug','Ljubovija'),(257,'Vršac',26300,'Južnobanatski okrug','Vršac'),(258,'Vukovac',12318,'Braničevski okrug','Žagubica'),(259,'Vučje',16203,'Jablanički okrug','Leskovac'),(260,'Gaj',26223,'Južnobanatski okrug','Kovin'),(261,'Gajdobra',21432,'Južnobački okrug','Bačka Palanka'),(262,'Gakovo',25282,'Zapadnobački okrug','Sombor'),(263,'Gamzigradska Banja',19228,'Zaječarski okrug','Zaječar'),(264,'Gardinovci',21247,'Južnobački okrug','Titel'),(265,'Gadžin Han',18240,'Nišavski okrug','Gadžin Han'),(266,'Gibarac',22258,'Sremski okrug','Šid'),(267,'Glavinci',35261,'Pomoravski okrug','Jagodina'),(268,'Globoder',37251,'Rasinski okrug','Kruševac'),(269,'Glogovac',35222,'Pomoravski okrug','Jagodina'),(270,'Glogonj',26202,'Južnobanatski okrug','Pančevo'),(271,'Gložan',21412,'Južnobački okrug','Bački Petrovac'),(272,'Glušci',15356,'Mačvanski okrug','Bogatić'),(273,'Gnjilan',18309,'Pirotski okrug','Pirot'),(274,'Golobok',11316,'Podunavski okrug','Smederevska Palanka'),(275,'Golubac',12223,'Braničevski okrug','Golubac'),(276,'Golubinci',22308,'Sremski okrug','Stara Pazova'),(277,'Goračići',32232,'Moravički okrug','Lučani'),(278,'Gornja Dobrinja',31214,'Zlatiborski okrug','Požega'),(279,'Gornja Draguša',18425,'Toplički okrug','Blace'),(280,'Gornja Lisina',17538,'Pčinjski okrug','Bosilegrad'),(281,'Gornja Sabanta',34206,'Šumadijski okrug','Pivara'),(282,'Gornja Toplica',14243,'Kolubarski okrug','Mionica'),(283,'Gornja Toponica',18202,'Nišavski okrug','Crveni Krst'),(284,'Gornja Trepča',32215,'Moravički okrug','Čačak'),(285,'Gornja Trnava',34324,'Šumadijski okrug','Topola'),(286,'Gornje Dvorane',37206,'Rasinski okrug','Kruševac'),(287,'Gornji Barbeš',18241,'Nišavski okrug','Gadžin Han'),(288,'Gornji Breg',24406,'Severnobanatski okrug','Senta'),(289,'Gornji Matejevac',18204,'Nišavski okrug','Pantelej'),(290,'Gornji Milanovac',32300,'Moravički okrug','Gornji Milanovac'),(291,'Gornji Stepoš',37221,'Rasinski okrug','Kruševac'),(292,'Gornji Stupanj',37234,'Rasinski okrug','Aleksandrovac'),(293,'Gospođinci',21237,'Južnobački okrug','Žabalj'),(294,'Gostun',31308,'Zlatiborski okrug','Prijepolje'),(295,'Grabovac',11508,'Grad Beograd','Obrenovac'),(296,'Grabovica',19327,'Borski okrug','Kladovo'),(297,'Grabovci',22423,'Sremski okrug','Ruma'),(298,'Gradskovo',19205,'Zaječarski okrug','Zaječar'),(299,'Gračanica',38205,'Kosovski okrug','Priština'),(300,'Grgurevci',22213,'Sremski okrug','Sremska Mitrovica'),(301,'Grdelica',16220,'Jablanički okrug','Leskovac'),(302,'Grebenac',26347,'Južnobanatski okrug','Bela Crkva'),(303,'Grlište',19342,'Zaječarski okrug','Zaječar'),(304,'Grljan',19341,'Zaječarski okrug','Zaječar'),(305,'Grošnica',34202,'Šumadijski okrug','Stanovo'),(306,'Gruža',34230,'Šumadijski okrug','Knić'),(307,'Guberevac',16211,'Jablanički okrug','Leskovac'),(308,'Guberevac',34232,'Šumadijski okrug','Knić'),(309,'Gudurica',26335,'Južnobanatski okrug','Vršac'),(310,'Gunaroš',24312,'Severnobački okrug','Bačka Topola'),(311,'Guča',32230,'Moravički okrug','Lučani'),(312,'Guševac',18208,'Nišavski okrug','Svrljig'),(313,'Darosava',34305,'Šumadijski okrug','Aranđelovac'),(314,'Debeljača',26214,'Južnobanatski okrug','Kovačica'),(315,'Debrc',15214,'Mačvanski okrug','Vladimirci'),(316,'Devojački Bunar',26316,'Južnobanatski okrug','Alibunar'),(317,'Deževa',36305,'Raški okrug','Novi Pazar'),(318,'Deliblato',26225,'Južnobanatski okrug','Kovin'),(319,'Delimeđe',36307,'Raški okrug','Tutin'),(320,'Deronje',25254,'Zapadnobački okrug','Odžaci'),(321,'Desimirovac',34321,'Šumadijski okrug','Aerodrom'),(322,'Despotovac',35213,'Pomoravski okrug','Despotovac'),(323,'Despotovo',21468,'Južnobački okrug','Bačka Palanka'),(324,'Deč',22441,'Sremski okrug','Pećinci'),(325,'Divljaka',31236,'Zlatiborski okrug','Arilje'),(326,'Divostin',34204,'Šumadijski okrug','Stanovo'),(327,'Divoš',22232,'Sremski okrug','Sremska Mitrovica'),(328,'Divci',14222,'Kolubarski okrug','Valjevo'),(329,'Divčibare',14204,'Kolubarski okrug','Valjevo'),(330,'Dimitrovgrad',18320,'Pirotski okrug','Dimitrovgrad'),(331,'Dobra',12224,'Braničevski okrug','Golubac'),(332,'Dobri Do',18408,'Toplički okrug','Kuršumlija'),(333,'Dobrinci',22412,'Sremski okrug','Ruma'),(334,'Dobrić',15235,'Mačvanski okrug','Šabac'),(335,'Dobrica',26354,'Južnobanatski okrug','Alibunar'),(336,'Dolac',18314,'Pirotski okrug','Bela Palanka'),(337,'Dolovo',26227,'Južnobanatski okrug','Pančevo'),(338,'Doljevac',18410,'Nišavski okrug','Doljevac'),(339,'Donja Bela Reka',19213,'Borski okrug','Bor'),(340,'Donja Borina',15317,'Mačvanski okrug','Mali Zvornik'),(341,'Donja Gušterica',38207,'Kosovski okrug','Lipljan'),(342,'Donja Kamenica',19352,'Zaječarski okrug','Knjaževac'),(343,'Donja Ljubata',17544,'Pčinjski okrug','Bosilegrad'),(344,'Donja Mutnica',35255,'Pomoravski okrug','Paraćin'),(345,'Donja Orovica',15323,'Mačvanski okrug','Ljubovija'),(346,'Donja Rečica',18404,'Toplički okrug','Prokuplje'),(347,'Donja Trnava',18421,'Toplički okrug','Prokuplje'),(348,'Donja Šatornja',34314,'Šumadijski okrug','Topola'),(349,'Donje Vidovo',35258,'Pomoravski okrug','Paraćin'),(350,'Donje Zuniče',19345,'Zaječarski okrug','Knjaževac'),(351,'Donje Međurovo',18254,'Nišavski okrug','Palilula (Niš)'),(352,'Donje Crnatovo',18414,'Toplički okrug','Žitorađa'),(353,'Donje Crniljevo',15227,'Mačvanski okrug','Koceljeva'),(354,'Donji Dušnik',18242,'Nišavski okrug','Gadžin Han'),(355,'Donji Krčin',37258,'Rasinski okrug','Varvarin'),(356,'Donji Milanovac',19220,'Borski okrug','Majdanpek'),(357,'Donji Stajevac',17526,'Pčinjski okrug','Trgovište'),(358,'Doroslovo',25243,'Zapadnobački okrug','Sombor'),(359,'Draginac',15311,'Mačvanski okrug','Loznica'),(360,'Draginje',15226,'Mačvanski okrug','Koceljeva'),(361,'Draglica',31317,'Zlatiborski okrug','Nova Varoš'),(362,'Dragobraća',34231,'Šumadijski okrug','Stanovo'),(363,'Dragovo',35265,'Pomoravski okrug','Rekovac'),(364,'Dragolj',32316,'Moravički okrug','Gornji Milanovac'),(365,'Dragocvet',35272,'Pomoravski okrug','Jagodina'),(366,'Dragoševac',35262,'Pomoravski okrug','Jagodina'),(367,'Draževac',11506,'Grad Beograd','Obrenovac'),(368,'Draževac',18223,'Nišavski okrug','Aleksinac'),(369,'Drajkovce',38239,'Kosovski okrug','Štrpce'),(370,'Dračić',14203,'Kolubarski okrug','Valjevo'),(371,'Drenovac',15212,'mačvanski okrug','Šabac'),(372,'Drenovac',35257,'Pomoravski okrug','Paraćin'),(373,'Drugovac',11432,'Podunavski okrug','Smederevo'),(374,'Dublje',15359,'Mačvanski okrug','Bogatić'),(375,'Dubovac',26224,'Južnobanatski okrug','Kovin'),(376,'Dubovo',18406,'Toplički okrug','Žitorađa'),(377,'Duboka',12255,'Braničevski okrug','Kučevo'),(378,'Duboka',35218,'Pomoravski okrug','Jagodina'),(379,'Dubočane',19232,'Zaječarski okrug','Zaječar'),(380,'Dubravica',12207,'Braničevski okrug','Požarevac'),(381,'Duga Poljana',36312,'Zlatiborski okrug','Sjenica'),(382,'Dugo Polje',18237,'Zaječarski okrug','Sokobanja'),(383,'Dudovica',11561,'Grad Beograd','Lazarevac'),(384,'Dupljaja',26328,'Južnobanatski okrug','Bela Crkva'),(385,'Đala',23335,'Severnobanatski okrug','Novi Kneževac'),(386,'Đunis',37202,'Rasinski okrug','Kruševac'),(387,'Đurđevo',21239,'Južnobački okrug','Žabalj'),(388,'Đurđin',24213,'Severnobački okrug','Subotica'),(389,'Elemir',23208,'Srednjobanatski okrug','Zrenjanin'),(390,'Erdevik',22230,'Sremski okrug','Šid'),(391,'Erdeč',34207,'Šumadijski okrug','Stanovo'),(392,'Ečka',23203,'Srednjobanatski okrug','Zrenjanin'),(393,'Žabalj',21230,'Južnobački okrug','Žabalj'),(394,'Žabari',12374,'Braničevski okrug','Žabari'),(395,'Žagubica',12320,'Braničevski okrug','Žagubica'),(396,'Željuše',18325,'Pirotski okrug','Dimitrovgrad'),(397,'Žirovnica',34229,'Šumadijski okrug','Batočina'),(398,'Žitište',23210,'Srednjobanatski okrug','Žitište'),(399,'Žitkovac',18210,'Nišavski okrug','Aleksinac'),(400,'Žitni Potok',18407,'Toplički okrug','Prokuplje'),(401,'Žitorađa',18412,'Toplički okrug','Žitorađa'),(402,'Žiča',36221,'Raški okrug','Kraljevo'),(403,'Žuč',18438,'Toplički okrug','Kuršumlija'),(404,'Zablaće',32223,'Moravički okrug','Čačak'),(405,'Zabojnica',34244,'Šumadijski okrug','Knić'),(406,'Zabrežje',11505,'Grad Beograd','Obrenovac'),(407,'Zavlaka',15312,'Mačvanski okrug','Krupanj'),(408,'Zagajica',26344,'Južnobanatski okrug','Vršac'),(409,'Zajača',15315,'Mačvanski okrug','Loznica'),(410,'Zaječar',19000,'Zaječarski okrug','Zaječar'),(411,'Zaplanjska Toponica',18244,'Nišavski okrug','Gadžin Han'),(412,'Zasavica',22201,'Sremski okrug','Sremska Mitrovica'),(413,'Zvezdan',19227,'Zaječarski okrug','Zaječar'),(414,'Zvečan',38227,'Kosovskomitrovački okrug','Zvečan'),(415,'Zvonce',18333,'Pirotski okrug','Babušnica'),(416,'Zdravinje',37203,'Rasinski okrug','Kruševac'),(417,'Zlatibor',31315,'Zlatiborski okrug','Čajetina'),(418,'Zlatica',23255,'Srednjobanatski okrug','Zrenjanin'),(419,'Zlodol',31253,'Zlatiborski okrug','Bajina Bašta'),(420,'Zlot',19215,'Borski okrug','Bor'),(421,'Zmajevo',21213,'Južnobački okrug','Vrbas'),(422,'Zminjak',15352,'Mačvanski okrug','Šabac'),(423,'Zrenjanin',23101,'Srednjobanatski okrug','Zrenjanin'),(424,'Zubin Potok',38228,'Kosovskomitrovački okrug','Zubin Potok'),(425,'Zuce',11225,'Grad Beograd','Voždovac'),(426,'Ivanovo',26233,'Južnobanatski okrug','Pančevo'),(427,'Ivanjica',32250,'Moravički okrug','Ivanjica'),(428,'Idvor',26207,'Južnobanatski okrug','Kovačica'),(429,'Iđoš',23323,'Severnobanatski okrug','Kikinda'),(430,'Izbište',26343,'Južnobanatski okrug','Vršac'),(431,'Ilandža',26352,'Južnobanatski okrug','Alibunar'),(432,'Ilinci',22250,'Sremski okrug','Šid'),(433,'Ilićevo',34203,'Šumadijski okrug','Pivara'),(434,'Inđija',22320,'Sremski okrug','Inđija'),(435,'Irig',22406,'Sremski okrug','Irig'),(436,'Jabuka',26201,'Južnobanatski okrug','Pančevo'),(437,'Jabuka',31306,'Zlatiborski okrug','Prijepolje'),(438,'Jabukovac',19304,'Borski okrug','Negotin'),(439,'Jabučje',14226,'Kolubarski okrug','Lajkovac'),(440,'Jagnjilo',11412,'Grad Beograd','Mladenovac'),(441,'Jagodina',35000,'Pomoravski okrug','Jagodina'),(442,'Jadranska Lešnica',15308,'Mačvanski okrug','Loznica'),(443,'Jazak',22409,'Sremski okrug','Irig'),(444,'Jazovo',23327,'Severnobanatski okrug','Čoka'),(445,'Jamena',22248,'Sremski okrug','Šid'),(446,'Jankov Most',23201,'Srednjobanatski okrug','Zrenjanin'),(447,'Janošik',26362,'Južnobanatski okrug','Alibunar'),(448,'Jarak',22426,'Sremski okrug','Sremska Mitrovica'),(449,'Jarkovac',23250,'Srednjobanatski okrug','Sečanj'),(450,'Jarmenovci',34318,'Šumadijski okrug','Topola'),(451,'Jasenovo',26346,'Južnobanatski okrug','Bela Crkva'),(452,'Jasenovo',31319,'Zlatiborski okrug','Nova Varoš'),(453,'Jasenovo',35241,'Pomoravski okrug','Despotovac'),(454,'Jasika',37252,'Rasinski okrug','Kruševac'),(455,'Jasikovica',37247,'Rasinski okrug','Trstenik'),(456,'Jasikovo',19256,'Borski okrug','Majdanpek'),(457,'Jaša Tomić',23230,'Srednjobanatski okrug','Sečanj'),(458,'Ježevica',31213,'Zlatiborski okrug','Požega'),(459,'Ježevica',32222,'Moravički okrug','Čačak'),(460,'Jelašnica',17531,'Pčinjski okrug','Surdulica'),(461,'Jelašnica',18206,'Nišavski okrug','Niška Banja'),(462,'Jelen Do',31215,'Zlatiborski okrug','Požega'),(463,'Jelovik',34309,'Šumadijski okrug','Aranđelovac'),(464,'Jermenovci',26363,'Južnobanatski okrug','Plandište'),(465,'Jovanovac',18258,'Toplički okrug','Merošina'),(466,'Jovanovac',34211,'Šumadijski okrug','Aerodrom'),(467,'Jovac',35205,'Pomoravski okrug','Ćuprija'),(468,'Jošanica',18234,'Zaječarski okrug','Sokobanja'),(469,'Jošanička Banja',36345,'Raški okrug','Raška'),(470,'Jugbogdanovac',18253,'Nišavski okrug','Merošina'),(471,'Junkovac',11562,'Grad Beograd','Lazarevac'),(472,'Kalna',19353,'Zaječarski okrug','Knjaževac'),(473,'Kaluđerica',11130,'Grad Beograd','Grocka'),(474,'Kamenica',14252,'Kolubarski okrug','Valjevo'),(475,'Kamenica',15222,'Mačvanski okrug','Koceljeva'),(476,'Kamenica',18324,'Pirotski okrug','Dimitrovgrad'),(477,'Kanjiža',24420,'Severnobanatski okrug','Kanjiža'),(478,'Kaona',32234,'Moravički okrug','Lučani'),(479,'Kaonik',37256,'Rasinski okrug','Kruševac'),(480,'Karavukovo',25255,'Zapadnobački okrug','Odžaci'),(481,'Karađorđevo',21421,'Južnobački okrug','Bačka Palanka'),(482,'Karađorđevo',24308,'Severnobački okrug','Bačka Topola'),(483,'Karan',31204,'Zlatiborski okrug','Užice'),(484,'Karlovčić',22443,'Sremski okrug','Pećinci'),(485,'Katun',18225,'Nišavski okrug','Aleksinac'),(486,'Kać',21241,'Južnobački okrug','Novi Sad'),(487,'Kačarevo',26212,'Južnobanatski okrug','Pančevo'),(488,'Kevi',24407,'Severnobanatski okrug','Senta'),(489,'Kelebija',24104,'Severnobački okrug','Subotica'),(490,'Kelebija gran. prelaz',24205,'Severnobački okrug','Subotica'),(491,'Kikinda',23300,'Severnobanatski okrug','Kikinda'),(492,'Kisač',21211,'Južnobački okrug','Novi Sad'),(493,'Kladovo',19320,'Borski okrug','Kladovo'),(494,'Klek',23211,'Srednjobanatski okrug','Zrenjanin'),(495,'Klenak',22424,'Sremski okrug','Ruma'),(496,'Klenike',17524,'Pčinjski okrug','Bujanovac'),(497,'Klenje',12258,'Braničevski okrug','Golubac'),(498,'Klenje',15357,'Mačvanski okrug','Bogatić'),(499,'Klisura',17535,'Pčinjski okrug','Surdulica'),(500,'Kličevac',12209,'Braničevski okrug','Požarevac'),(501,'Klokočevac',19222,'Borski okrug','Majdanpek'),(502,'Kljajićevo',25221,'Zapadnobački okrug','Sombor'),(503,'Knić',34240,'Šumadijski okrug','Knić'),(504,'Knićanin',23265,'Srednjobanatski okrug','Zrenjanin'),(505,'Knjaževac',19350,'Zaječarski okrug','Knjaževac'),(506,'Kobišnica',19316,'Borski okrug','Negotin'),(507,'Kovačevac',11409,'Grad Beograd','Mladenovac'),(508,'Kovačica',26210,'Južnobanatski okrug','Kovačica'),(509,'Kovilj',21243,'Južnobački okrug','Novi Sad'),(510,'Kovin',26220,'Južnobanatski okrug','Kovin'),(511,'Kokin Brod',31318,'Zlatiborski okrug','Nova Varoš'),(512,'Kolare',35242,'Pomoravski okrug','Jagodina'),(513,'Kolari',11431,'Podunavski okrug','Smederevo'),(514,'Kolut',25274,'Zapadnobački okrug','Sombor'),(515,'Komirić',14254,'Kolubarski okrug','Osečina'),(516,'Konak',23253,'Srednjobanatski okrug','Sečanj'),(517,'Konarevo',36340,'Raški okrug','Kraljevo'),(518,'Končarevo',35219,'Pomoravski okrug','Jagodina'),(519,'Konjuh',37254,'Rasinski okrug','Kruševac'),(520,'Kopaonik',36354,'Raški okrug','Raška'),(521,'Koprivnica',19223,'Zaječarski okrug','Zaječar'),(522,'Koraćica',11415,'Grad Beograd','Mladenovac'),(523,'Korbevac',17545,'Pčinjski okrug','Vranjska Banja'),(524,'Korbovo',19329,'Borski okrug','Kladovo'),(525,'Korenita',15302,'Mačvanski okrug','Loznica'),(526,'Korman',18216,'Nišavski okrug','Aleksinac'),(527,'Korman',34224,'Šumadijski okrug','Pivara'),(528,'Kosančić',16206,'Jablanički okrug','Bojnik'),(529,'Kosjerić',31260,'Zlatiborski okrug','Kosjerić'),(530,'Kosovo Polje',38210,'Kosovski okrug','Kosovo Polje'),(531,'Kosovska Kamenica',38260,'Kosovskopomoravski okrug','Kosovska Kamenica'),(532,'Kosovska Mitrovica',38220,'Kosovskomitrovački okrug','Kosovska Mitrovica'),(533,'Kostojevići',31254,'Zlatiborski okrug','Bajina Bašta'),(534,'Kostolac',12208,'Braničevski okrug','Kostolac'),(535,'Kotraža',32235,'Moravički okrug','Lučani'),(536,'Koceljeva',15220,'Mačvanski okrug','Koceljeva'),(537,'Kragujevac',34000,'Šumadijski okrug','Stari Grad (Kragujevac)'),(538,'Krajišnik',23231,'Srednjobanatski okrug','Sečanj'),(539,'Kraljevo',36000,'Raški okrug','Kraljevo'),(540,'Kraljevci',22411,'Sremski okrug','Ruma'),(541,'Kremna',31242,'Zlatiborski okrug','Užice'),(542,'Krepoljin',12316,'Braničevski okrug','Žagubica'),(543,'Kriva Feja',17543,'Pčinjski okrug','Vranjska Banja'),(544,'Krivaja',24341,'Severnobački okrug','Bačka Topola'),(545,'Krivelj',19219,'Borski okrug','Bor'),(546,'Krivi Vir',19375,'Zaječarski okrug','Boljevac'),(547,'Krnjevo',11319,'Podunavski okrug','Velika Plana'),(548,'Krnješevci',22314,'Sremski okrug','Stara Pazova'),(549,'Krupanj',15314,'Mačvanski okrug','Krupanj'),(550,'Krupac',18307,'Pirotski okrug','Pirot'),(551,'Krušar',35227,'Pomoravski okrug','Ćuprija'),(552,'Kruševac',37000,'Rasinski okrug','Kruševac'),(553,'Kruševica',18409,'Toplički okrug','Prokuplje'),(554,'Krušedol',22328,'Sremski okrug','Irig'),(555,'Kruščić',25225,'Zapadnobački okrug','Kula'),(556,'Krčedin',22325,'Sremski okrug','Inđija'),(557,'Kuzmin',22223,'Sremski okrug','Sremska Mitrovica'),(558,'Kukljin',37255,'Rasinski okrug','Kruševac'),(559,'Kukujevci',22224,'Sremski okrug','Šid'),(560,'Kula',25230,'Zapadnobački okrug','Kula'),(561,'Kulina',18214,'Nišavski okrug','Aleksinac'),(562,'Kulpin',21472,'Južnobački okrug','Bački Petrovac'),(563,'Kumane',23271,'Srednjobanatski okrug','Novi Bečej'),(564,'Kupinik',26368,'Južnobanatski okrug','Plandište'),(565,'Kupinovo',22419,'Sremski okrug','Pećinci'),(566,'Kupusina',25262,'Zapadnobački okrug','Apatin'),(567,'Kupci',37222,'Rasinski okrug','Kruševac'),(568,'Kuršumlija',18430,'Toplički okrug','Kuršumlija'),(569,'Kuršumlijska Banja',18435,'Toplički okrug','Kuršumlija'),(570,'Kusadak',11425,'Podunavski okrug','Smederevska Palanka'),(571,'Kusić',26349,'Južnobanatski okrug','Bela Crkva'),(572,'Kucura',21466,'Južnobački okrug','Vrbas'),(573,'Kučevo',12240,'Braničevski okrug','Kučevo'),(574,'Kušiljevo',35226,'Pomoravski okrug','Svilajnac'),(575,'Kušići',32258,'Moravički okrug','Ivanjica'),(576,'Kuštilj',26336,'Južnobanatski okrug','Vršac'),(577,'Lađevci',36204,'Raški okrug','Kraljevo'),(578,'Lazarevac',11550,'Grad Beograd','Lazarevac'),(579,'Lazarevo',23241,'Srednjobanatski okrug','Zrenjanin'),(580,'Laznica',12321,'Braničevski okrug','Žagubica'),(581,'Lajkovac',14224,'Kolubarski okrug','Lajkovac'),(582,'Lalinac',18256,'Nišavski okrug','Palilula (Niš)'),(583,'Lalinac',18201,'Nišavski okrug','Svrljig'),(584,'Lalić',25234,'Zapadnobački okrug','Odžaci'),(585,'Laplje Selo',38204,'Kosovski okrug','Priština'),(586,'Lapovo',34221,'Šumadijski okrug','Lapovo'),(587,'Lapovo (Varoš)',34220,'Šumadijski okrug','Lapovo'),(588,'Laćarak',22221,'Sremski okrug','Sremska Mitrovica'),(589,'Lebane',16230,'Jablanički okrug','Lebane'),(590,'Ledinci',21207,'Južnobački okrug','Petrovaradin'),(591,'Ležimir',22207,'Sremski okrug','Sremska Mitrovica'),(592,'Lelić',14205,'Kolubarski okrug','Valjevo'),(593,'Lenovac',19343,'Zaječarski okrug','Zaječar'),(594,'Lepenac',37224,'Rasinski okrug','Brus'),(595,'Lepenica',17513,'Pčinjski okrug','Vladičin Han'),(596,'Lepina',38208,'Kosovski okrug','Lipljan'),(597,'Leposavić',38218,'Kosovskomitrovački okrug','Leposavić'),(598,'Leskovac',16000,'Jablanički okrug','Leskovac'),(599,'Lece',16248,'Jablanički okrug','Medveđa'),(600,'Lešak',38219,'Kosovskomitrovački okrug','Leposavić'),(601,'Lešnica',15307,'Mačvanski okrug','Loznica'),(602,'Lipar',25232,'Zapadnobački okrug','Kula'),(603,'Lipe',11310,'Podunavski okrug','Smederevo'),(604,'Lipnički Šor',15341,'Mačvanski okrug','Loznica'),(605,'Lipolist',15305,'Mačvanski okrug','Šabac'),(606,'Lički Hanovi',18245,'Nišavski okrug','Gadžin Han'),(607,'Lovćenac',24322,'Severnobački okrug','Mali Iđoš'),(608,'Loznica',15300,'Mačvanski okrug','Loznica'),(609,'Lozovik',11317,'Podunavski okrug','Velika Plana'),(610,'Lok',21248,'Južnobački okrug','Titel'),(611,'Lokve',26361,'Južnobanatski okrug','Alibunar'),(612,'Loćika',35274,'Pomoravski okrug','Rekovac'),(613,'Lubnica',19208,'Zaječarski okrug','Zaječar'),(614,'Lug',21315,'Južnobački okrug','Beočin'),(615,'Lugavčina',11321,'Podunavski okrug','Smederevo'),(616,'Lužnice',34325,'Šumadijski okrug','Aerodrom'),(617,'Lukare',36306,'Raški okrug','Novi Pazar'),(618,'Lukino Selo',23224,'Srednjobanatski okrug','Zrenjanin'),(619,'Lukićevo',23261,'Srednjobanatski okrug','Zrenjanin'),(620,'Lukovo',19371,'Zaječarski okrug','Boljevac'),(621,'Lukovska Banja',18437,'Toplički okrug','Kuršumlija'),(622,'Lunovo Selo',31203,'Zlatiborski okrug','Užice'),(623,'Lučani',32240,'Moravički okrug','Lučani'),(624,'Ljig',14240,'Kolubarski okrug','Ljig'),(625,'Ljuba',22255,'Sremski okrug','Šid'),(626,'Ljuberađa',18217,'Pirotski okrug','Babušnica'),(627,'Ljubiš',31209,'Zlatiborski okrug','Čajetina'),(628,'Ljubovija',15320,'Mačvanski okrug','Ljubovija'),(629,'Ljukovo',22321,'Sremski okrug','Inđija'),(630,'Ljutovo',24215,'Severnobački okrug','Subotica'),(631,'Maglić',21473,'Južnobački okrug','Bački Petrovac'),(632,'Majdan',23333,'Severnobanatski okrug','Novi Kneževac'),(633,'Majdanpek',19250,'Borski okrug','Majdanpek'),(634,'Majilovac',12221,'Braničevski okrug','Veliko Gradište'),(635,'Majur',15353,'Mačvanski okrug','Šabac'),(636,'Majur',35270,'Pomoravski okrug','Jagodina'),(637,'Mala Bosna',24217,'Severnobački okrug','Subotica'),(638,'Mala Krsna',11313,'Podunavski okrug','Smederevo'),(639,'Mala Moštanica',11261,'Grad Beograd','Obrenovac'),(640,'Mala Plana',18423,'Toplički okrug','Prokuplje'),(641,'Male Pijace',24416,'Severnobanatski okrug','Kanjiža'),(642,'Male Pčelice',34216,'Šumadijski okrug','Stanovo'),(643,'Mali Beograd',24309,'Severnobački okrug','Bačka Topola'),(644,'Mali Zvornik',15318,'Mačvanski okrug','Mali Zvornik'),(645,'Mali Iđoš',24321,'Severnobački okrug','Mali Iđoš'),(646,'Mali Izvor',19347,'Zaječarski okrug','Zaječar'),(647,'Mali Jasenovac',19209,'Zaječarski okrug','Zaječar'),(648,'Mali Požarevac',11235,'Grad Beograd','Sopot'),(649,'Malo Krčmare',34212,'Šumadijski okrug','Rača'),(650,'Malo Crniće',12311,'Braničevski okrug','Malo Crniće'),(651,'Malošište',18415,'Nišavski okrug','Doljevac'),(652,'Malča',18207,'Nišavski okrug','Pantelej'),(653,'Manđelos',22208,'Sremski okrug','Sremska Mitrovica'),(654,'Manojlovce',16201,'Jablanički okrug','Leskovac'),(655,'Maradik',22327,'Sremski okrug','Inđija'),(656,'Margita',26364,'Južnobanatski okrug','Plandište'),(657,'Markovac',11325,'Podunavski okrug','Velika Plana'),(658,'Markovica',32243,'Moravički okrug','Lučani'),(659,'Martinci',22222,'Sremski okrug','Sremska Mitrovica'),(660,'Martonoš',24417,'Severnobanatski okrug','Kanjiža'),(661,'Maršić',34209,'Šumadijski okrug','Pivara'),(662,'Mataruška Banja',36201,'Raški okrug','Kraljevo'),(663,'Mačvanska Mitrovica',22202,'Sremski okrug','Sremska Mitrovica'),(664,'Mačvanski Pričinović',15211,'Mačvanski okrug','Šabac'),(665,'Mačkat',31312,'Zlatiborski okrug','Čajetina'),(666,'Medveđa',16240,'Jablanički okrug','Medveđa'),(667,'Medveđa',35224,'Pomoravski okrug','Despotovac'),(668,'Medveđa',37244,'Rasinski okrug','Trstenik'),(669,'Medoševac',18209,'Nišavski okrug','Crveni Krst'),(670,'Međa',23234,'Srednjobanatski okrug','Žitište'),(671,'Međulužje',11405,'Grad Beograd','Mladenovac'),(672,'Međurečje',32255,'Moravički okrug','Ivanjica'),(673,'Melenci',23270,'Srednjobanatski okrug','Zrenjanin'),(674,'Melenci-Rusanda',23269,'Srednjobanatski okrug','Zrenjanin'),(675,'Meljak',11426,'Grad Beograd','Barajevo'),(676,'Merdare',18445,'Toplički okrug','Kuršumlija'),(677,'Merošina',18252,'Nišavski okrug','Merošina'),(678,'Merćez',18436,'Toplički okrug','Kuršumlija'),(679,'Metlić',15233,'Mačvanski okrug','Šabac'),(680,'Metovnica',19204,'Borski okrug','Bor'),(681,'Mijatovac',35236,'Pomoravski okrug','Ćuprija'),(682,'Milatovac',34222,'Šumadijski okrug','Batočina'),(683,'Milentija',37227,'Rasinski okrug','Brus'),(684,'Miletićevo',26373,'Južnobanatski okrug','Plandište'),(685,'Mileševo',21227,'Južnobački okrug','Bečej'),(686,'Miloševac',11318,'Podunavski okrug','Velika Plana'),(687,'Miloševo',35268,'Pomoravski okrug','Jagodina'),(688,'Milutovac',37246,'Rasinski okrug','Trstenik'),(689,'Minićevo',19340,'Zaječarski okrug','Knjaževac'),(690,'Mionica',14242,'Kolubarski okrug','Mionica'),(691,'Mirosaljci',11567,'Grad Beograd','Lazarevac'),(692,'Miroševce',16204,'Jablanički okrug','Leskovac'),(693,'Mitrovac',31251,'Zlatiborski okrug','Bajina Bašta'),(694,'Mihajlovac',11312,'Podunavski okrug','Smederevo'),(695,'Mihajlovac',19322,'Borski okrug','Negotin'),(696,'Mihajlovo',23202,'Srednjobanatski okrug','Zrenjanin'),(697,'Mišićevo',24211,'Severnobački okrug','Subotica'),(698,'Mladenovac',11400,'Grad Beograd','Mladenovac'),(699,'Mladenovo',21422,'Južnobački okrug','Bačka Palanka'),(700,'Mozgovo',18229,'Nišavski okrug','Aleksinac'),(701,'Mokra Gora',31243,'Zlatiborski okrug','Užice'),(702,'Mokrin',23305,'Severnobanatski okrug','Kikinda'),(703,'Mol',24435,'Severnobanatski okrug','Ada'),(704,'Molovin',22256,'Sremski okrug','Šid'),(705,'Morović',22245,'Sremski okrug','Šid'),(706,'Mošorin',21245,'Južnobački okrug','Titel'),(707,'Mramor',18251,'Nišavski okrug','Palilula'),(708,'Mramorak',26226,'Južnobanatski okrug','Kovin'),(709,'Mrčajevci',32210,'Moravički okrug','Čačak'),(710,'Mršinci',32224,'Moravički okrug','Čačak'),(711,'Mužlja',23206,'Srednjobanatski okrug','Zrenjanin'),(712,'Muhovac',17529,'Pčinjski okrug','Bujanovac'),(713,'Nadalj',21216,'Južnobački okrug','Srbobran'),(714,'Nakovo',23311,'Severnobanatski okrug','Kikinda'),(715,'Natalinci',34313,'Šumadijski okrug','Topola'),(716,'Negotin',19300,'Borski okrug','Negotin'),(717,'Neresnica',12242,'Braničevski okrug','Kučevo'),(718,'Neuzina',23245,'Srednjobanatski okrug','Sečanj'),(719,'Neštin',21314,'Južnobački okrug','Bačka Palanka'),(720,'Nikinci',22422,'Sremski okrug','Ruma'),(721,'Nikolinci',26322,'Južnobanatski okrug','Alibunar'),(722,'Nikoličevo',19311,'Zaječarski okrug','Zaječar'),(723,'Niš',18101,'Nišavski okrug','Medijana'),(724,'Niševac',18366,'Nišavski okrug','Svrljig'),(725,'Niška Banja',18205,'Nišavski okrug','Niška Banja'),(726,'Nova Varoš',31320,'Zlatiborski okrug','Nova Varoš'),(727,'Nova Gajdobra',21431,'Južnobački okrug','Bačka Palanka'),(728,'Nova Pazova',22330,'Sremski okrug','Stara Pazova'),(729,'Nova Crvenka',25224,'Zapadnobački okrug','Kula'),(730,'Nova Crnja',23218,'Srednjobanatski okrug','Nova Crnja'),(731,'Novi Banovci',22304,'Sremski okrug','Stara Pazova'),(732,'Novi Bečej',23272,'Srednjobanatski okrug','Novi Bečej'),(733,'Novi Bračin',37216,'Nišavski okrug','Ražanj'),(734,'Novi Žednik',24223,'Severnobački okrug','Subotica'),(735,'Novi Itebej',23236,'Srednjobanatski okrug','Žitište'),(736,'Novi Karlovci',22322,'Sremski okrug','Inđija'),(737,'Novi Kneževac',23330,'Severnobanatski okrug','Novi Kneževac'),(738,'Novi Kozarci',23313,'Severnobanatski okrug','Kikinda'),(739,'Novi Kozjak',26353,'Južnobanatski okrug','Alibunar'),(740,'Novi Pazar',36300,'Raški okrug','Novi Pazar'),(741,'Novi Sad',21101,'Južnobački okrug','Novi Sad'),(742,'Novi Slankamen',22323,'Sremski okrug','Inđija'),(743,'Novo Miloševo',23273,'Srednjobanatski okrug','Novi Bečej'),(744,'Novo Orahovo',24351,'Severnobački okrug','Bačka Topola'),(745,'Novo Selo',18250,'Nišavski okrug','Palilula'),(746,'Novo Selo',36216,'Raški okrug','Vrnjačka Banja'),(747,'Noćaj',22203,'Sremski okrug','Sremska Mitrovica'),(748,'Obrež',22417,'Sremski okrug','Pećinci'),(749,'Obrež',37266,'Rasinski okrug','Varvarin'),(750,'Obrenovac',11500,'Grad Beograd','Obrenovac'),(751,'Obrovac',21423,'Južnobački okrug','Bačka Palanka'),(752,'Ovčar Banja',32242,'Moravički okrug','Čačak'),(753,'Ogar',22416,'Sremski okrug','Pećinci'),(754,'Omoljica',26230,'Južnobanatski okrug','Pančevo'),(755,'Oparić',35267,'Pomoravski okrug','Rekovac'),(756,'Opovo',26204,'Južnobanatski okrug','Opovo'),(757,'Orane',16233,'Jablanički okrug','Bojnik'),(758,'Orašac',34308,'Šumadijski okrug','Aranđelovac'),(759,'Oreškovica',12308,'Braničevski okrug','Petrovac'),(760,'Orid',15213,'Mačvanski okrug','Šabac'),(761,'Orlovat',23263,'Srednjobanatski okrug','Zrenjanin'),(762,'Orom',24207,'Severnobanatski okrug','Kanjiža'),(763,'Osanica',12317,'Braničevski okrug','Žagubica'),(764,'Osečina',14253,'Kolubarski okrug','Osečina'),(765,'Osipaonica',11314,'poduna','Smederevo'),(766,'Ostojićevo',23326,'Severnobanatski okrug','Čoka'),(767,'Ostrovica',18312,'Nišavski okrug','Niška Banja'),(768,'Ostružnica',11251,'Grad Beograd','Čukarica'),(769,'Odžaci',25250,'Zapadnobački okrug','Odžaci'),(770,'Oštrelj',19226,'Borski okrug','Bor'),(771,'Pavliš',26333,'Južnobanatski okrug','Vršac'),(772,'Padež',37257,'Rasinski okrug','Kruševac'),(773,'Padej',23325,'Severnobanatski okrug','Čoka'),(774,'Padina',26215,'Južnobanatski okrug','Kovačica'),(775,'Palić',24413,'Severnobački okrug','Subotica'),(776,'Pambukovica',14213,'Kolubarski okrug','Ub'),(777,'Panonija',24330,'Severnobački okrug','Bačka Topola'),(778,'Pančevo',26101,'Južnobanatski okrug','Pančevo'),(779,'Parage',21434,'Južnobački okrug','Bačka Palanka'),(780,'Paraćin',35250,'Pomoravski okrug','Paraćin'),(781,'Parteš',38251,'Kosovskopomoravski okrug','Gnjilane'),(782,'Parunovac',37201,'Rasinski okrug','Kruševac'),(783,'Pasjane',38266,'Kosovskopomoravski okrug','Gnjilane'),(784,'Pačir',24342,'Severnobački okrug','Bačka Topola'),(785,'Pejkovac',18413,'Toplički okrug','Žitorađa'),(786,'Pepeljevac',37231,'Rasinski okrug','Kruševac'),(787,'Perlez',23260,'Srednjobanatski okrug','Zrenjanin'),(788,'Perućac',31256,'Zlatiborski okrug','Bajina Bašta'),(789,'Petlovača',15304,'Mačvanski okrug','Šabac'),(790,'Petrovaradin',21131,'Južnobački okrug','Petrovaradin'),(791,'Petrovac',12300,'Braničevski okrug','Petrovac na Mlavi'),(792,'Pećinci',22410,'Sremski okrug','Pećinci'),(793,'Pecka',14207,'Kolubarski okrug','Osečina'),(794,'Pečenjevce',16251,'Jablanički okrug','Leskovac'),(795,'Pivnice',21469,'Južnobački okrug','Bačka Palanka'),(796,'Pinosava',11226,'Grad Beograd','Voždovac'),(797,'Pirot',18300,'Pirotski okrug','Opština Pirot'),(798,'Plavna',19307,'Borski okrug','Negotin'),(799,'Plavna',21428,'Južnobački okrug','Bač'),(800,'Plažane',35212,'Pomoravski okrug','Despotovac'),(801,'Plana',35247,'Pomoravski okrug','Paraćin'),(802,'Plandište',26360,'Južnobanatski okrug','Plandište'),(803,'Platičevo',22420,'Sremski okrug','Ruma'),(804,'Plemetina',38211,'Kosovski okrug','Obilić'),(805,'Pleš',37238,'Rasinski okrug','Aleksandrovac'),(806,'Pločica',26229,'Južnobanatski okrug','Kovin'),(807,'Pobeda',24313,'Severnobački okrug','Bačka Topola'),(808,'Poganovo',18326,'Pirotski okrug','Dimitrovgrad'),(809,'Podvis',19362,'Zaječarski okrug','Knjaževac'),(810,'Podvrška',19321,'Borski okrug','Kladovo'),(811,'Podgorac',19233,'Zaječarski okrug','Boljevac'),(812,'Podunavci',36215,'Raški okrug','Vrnjačka Banja'),(813,'Požarevac',12000,'Braničevski okrug','Požarevac'),(814,'Požega',31210,'Zlatiborski okrug','Požega'),(815,'Pojate',37214,'Rasinski okrug','Ćićevac'),(816,'Poljana',12372,'Braničevski okrug','Požarevac'),(817,'Poljska Ržana',18328,'Pirotski okrug','Pirot'),(818,'Popinci',22428,'Sremski okrug','Pećinci'),(819,'Popovac',35254,'Pomoravski okrug','Paraćin'),(820,'Popučke',14221,'Kolubarski okrug','Valjevo'),(821,'Porodin',12375,'Braničevski okrug','Žabari'),(822,'Potočac',35207,'Pomoravski okrug','Paraćin'),(823,'Poćuta',14206,'Kolubarski okrug','Valjevo'),(824,'Počekovina',37243,'Rasinski okrug','Trstenik'),(825,'Pranjani',32308,'Moravički okrug','Gornji Milanovac'),(826,'Prahovo',19330,'Borski okrug','Negotin'),(827,'Prevešt',35264,'Pomoravski okrug','Rekovac'),(828,'Predejane',16222,'Jablanički okrug','Leskovac'),(829,'Prekonoga',18365,'Nišavski okrug','Svrljig'),(830,'Preljina',32212,'Moravički okrug','Čačak'),(831,'Preševo',17523,'Pčinjski okrug','Preševo'),(832,'Preševo-terminal',17555,'Pčinjski okrug','Preševo'),(833,'Priboj',31330,'Zlatiborski okrug','Priboj'),(834,'Priboj Vranjski',17511,'Pčinjski okrug','Vladičin Han'),(835,'Privina Glava',22257,'Sremski okrug','Šid'),(836,'Prigrevica',25263,'Zapadnobački okrug','Apatin'),(837,'Prijepolje',31300,'Zlatiborski okrug','Prijepolje'),(838,'Prilički Kiseljak',32252,'Moravički okrug','Ivanjica'),(839,'Prilužje',38213,'Kosovski okrug','Vučitrn'),(840,'Pričević',14251,'Kolubarski okrug','Valjevo'),(841,'Prnjavor (Mačvanski)',15306,'Mačvanski okrug','Šabac'),(842,'Provo',15215,'Mačvanski okrug','Vladimirci'),(843,'Prokuplje',18400,'Toplički okrug','Prokuplje'),(844,'Prolom Banja',18433,'Toplički okrug','Kuršumlija'),(845,'Pružatovac',11413,'Grad Beograd','Mladenovac'),(846,'Prhovo',22442,'Sremski okrug','Pećinci'),(847,'Pukovac',18255,'Nišavski okrug','Doljevac'),(848,'Putinci',22404,'Sremski okrug','Ruma'),(849,'Rabrovo',12254,'Braničevski okrug','Kučevo'),(850,'Ravna Dubrava',18246,'Nišavski okrug','Gadžin Han'),(851,'Ravni Topolovac',23212,'Srednjobanatski okrug','Žitište'),(852,'Ravni',31206,'Zlatiborski okrug','Užice'),(853,'Ravno Selo',21471,'Južnobački okrug','Vrbas'),(854,'Ravnje',22205,'Sremski okrug','Sremska Mitrovica'),(855,'Radalj',15321,'Mačvanski okrug','Mali Zvornik'),(856,'Radinac',11311,'Podunavski okrug','Smederevo'),(857,'Radičević',21225,'Južnobački okrug','Bečej'),(858,'Radljevo',14211,'Kolubarski okrug','Ub'),(859,'Radovnica',17561,'Pčinjski okrug','Trgovište'),(860,'Radojevo',23221,'Srednjobanatski okrug','Nova Crnja'),(861,'Radujevac',19334,'Borski okrug','Negotin'),(862,'Ražana',31265,'Zlatiborski okrug','Kosjerić'),(863,'Ražanj',37215,'Nišavski okrug','Ražanj'),(864,'Razbojna',37223,'Rasinski okrug','Brus'),(865,'Razgojna',16252,'Jablanički okrug','Leskovac'),(866,'Rainovača',15342,'Mačvanski okrug','Ljubovija'),(867,'Rajković',14202,'Kolubarski okrug','Mionica'),(868,'Rakovac',21299,'Južnobački okrug','Beočin'),(869,'Ralja',11233,'Grad Beograd','Sopot'),(870,'Ranilović',34302,'Šumadijski okrug','Aranđelovac'),(871,'Ranilug',38267,'Kosovskopomoravski okrug','Kosovska Kamenica'),(872,'Ranovac',12304,'Braničevski okrug','Petrovac'),(873,'Rastina',25283,'Zapadnobački okrug','Sombor'),(874,'Rataje',37236,'Rasinski okrug','Aleksandrovac'),(875,'Ratari',11411,'Podunavski okrug','Smederevska Palanka'),(876,'Ratina',36212,'Raški okrug','Kraljevo'),(877,'Ratkovo',25253,'Zapadnobački okrug','Odžaci'),(878,'Rača Kragujevačka',34210,'Šumadijski okrug','Rača'),(879,'Rača',18440,'Toplički okrug','Kuršumlija'),(880,'Rašanac',12315,'Braničevski okrug','Petrovac na Mlavi'),(881,'Raševica',35206,'Pomoravski okrug','Paraćin'),(882,'Raška',36350,'Raški okrug','Raška'),(883,'Rgotina',19214,'Zaječarski okrug','Zaječar'),(884,'Rekovac',35260,'Pomoravski okrug','Rekovac'),(885,'Resavica',35237,'Pomoravski okrug','Despotovac'),(886,'Resnik',34225,'Šumadijski okrug','Aerodrom'),(887,'Ribare',35220,'Pomoravski okrug','Jagodina'),(888,'Ribari',15310,'Mačvanski okrug','Šabac'),(889,'Ribariće',36309,'Raški okrug','Tutin'),(890,'Ribarska Banja',37205,'Rasinski okrug','Kruševac'),(891,'Riđica',25280,'Zapadnobački okrug','Sombor'),(892,'Ripanj',11232,'Grad Beograd','Voždovac'),(893,'Ristovac',17521,'Pčinjski okrug','Vranje'),(894,'Rogača',11453,'Grad Beograd','Sopot'),(895,'Rogačica',31255,'Zlatiborski okrug','Bajina Bašta'),(896,'Roge',31237,'Zlatiborski okrug','Požega'),(897,'Rogljevo',19318,'Borski okrug','Negotin'),(898,'Rožanstvo',31208,'Zlatiborski okrug','Čajetina'),(899,'Roćevići',36205,'Raški okrug','Kraljevo'),(900,'Rudna Glava',19257,'Borski okrug','Majdanpek'),(901,'Rudnik',32313,'Moravički okrug','Gornji Milanovac'),(902,'Rudnica',36353,'Raška','Raški okrug'),(903,'Rudno',36222,'Raški okrug','Kraljevo'),(904,'Rudovci',11566,'Grad Beograd','Lazarevac'),(905,'Ruma',22400,'Sremski okrug','Ruma'),(906,'Rumenka',21201,'Južnobački okrug','Novi Sad'),(907,'Ruski Krstur',25233,'Zapadnobački okrug','Kula'),(908,'Rusko Selo',23314,'Severnobanatski okrug','Kikinda'),(909,'Rutevac',18224,'Nišavski okrug','Aleksinac'),(910,'Rušanj',11194,'Grad Beograd','Čukarica'),(911,'Savinac',19377,'Zaječarski okrug','Boljevac'),(912,'Savino Selo',21467,'Južnobački okrug','Vrbas'),(913,'Sajan',23324,'Severnobanatski okrug','Kikinda'),(914,'Sakule',26206,'Južnobanatski okrug','Opovo'),(915,'Salaš Noćajski',22204,'Sremski okrug','Sremska Mitrovica'),(916,'Salaš',19224,'Zaječarski okrug','Zaječar'),(917,'Samaila',36202,'Raški okrug','Kraljevo'),(918,'Samoš',26350,'Južnobanatski okrug','Kovačica'),(919,'Sanad',23331,'Severnobanatski okrug','Čoka'),(920,'Saraorci',11315,'Podunavski okrug','Smederevo'),(921,'Sastav Reka',16213,'Jablanički okrug','Crna Trava'),(922,'Sastavci',31335,'Zlatiborski okrug','Priboj'),(923,'Sveti Ilija',17508,'Pčinjski okrug','Vranje'),(924,'Svetozar Miletić',25211,'Zapadnobački okrug','Sombor'),(925,'Svilajnac',35210,'Pomoravski okrug','Svilajnac'),(926,'Svileuva',15221,'Mačvanski okrug','Koceljeva'),(927,'Svilojevo',25265,'Zapadnobački okrug','Apatin'),(928,'Svođe',16212,'Jablanički okrug','Vlasotince'),(929,'Svojnovo',35259,'Pomoravski okrug','Paraćin'),(930,'Svrljig',18360,'Nišavski okrug','Svrljig'),(931,'Sevojno',31205,'Zlatiborski okrug','Užice'),(932,'Sedlare',35211,'Pomoravski okrug','Svilajnac'),(933,'Selevac',11407,'Podunavski okrug','Smederevska Palanka'),(934,'Selenča',21425,'Južnobački okrug','Bač'),(935,'Seleuš',26351,'Južnobanatski okrug','Alibunar'),(936,'Senta',24400,'Severnobanatski okrug','Senta'),(937,'Senje',35233,'Pomoravski okrug','Ćuprija'),(938,'Senjski Rudnik',35234,'Pomoravski okrug','Despotovac'),(939,'Sefkerin',26203,'Južnobanatski okrug','Opovo'),(940,'Seča Reka',31262,'Zlatiborski okrug','Kosjerić'),(941,'Sečanica',18203,'Nišavski okrug','Crveni Krst'),(942,'Sečanj',23240,'Srednjobanatski okrug','Sečanj'),(943,'Sibač',22440,'Sremski okrug','Pećinci'),(944,'Sivac',25223,'Zapadnobački okrug','Kula'),(945,'Sijarinska Banja',16246,'Jablanički okrug','Medveđa'),(946,'Sikirica',35256,'Pomoravski okrug','Paraćin'),(947,'Sikole',19225,'Borski okrug','Negotin'),(948,'Silbaš',21433,'Južnobački okrug','Bačka Palanka'),(949,'Siokovac',35203,'Pomoravski okrug','Jagodina'),(950,'Sip',19326,'Borski okrug','Kladovo'),(951,'Sipić',34213,'Šumadijski okrug','Rača'),(952,'Sirig',21214,'Južnobački okrug','Temerin'),(953,'Sirogojno',31207,'Zlatiborski okrug','Čajetina'),(954,'Sirča',36208,'Raški okrug','Kraljevo'),(955,'Sićevo',18311,'Nišavski okrug','Grad Niš'),(956,'Sjenica',36310,'Zlatiborski okrug','Sjenica'),(957,'Skela',11509,'Grad Beograd','Obrenovac'),(958,'Skobalj',11322,'Podunavski okrug','Smederevo'),(959,'Skorenovac',26228,'Južnobanatski okrug','Kovin'),(960,'Slavkovica',14245,'Kolubarski okrug','Ljig'),(961,'Slatina',19221,'Borski okrug','Bor'),(962,'Slovac',14223,'Kolubarski okrug','Lajkovac'),(963,'Smederevska Palanka',11420,'Podunavski okrug','Smederevska Palanka'),(964,'Smederevo',11300,'Podunavski okrug','Smederevo'),(965,'Smilovci',18323,'Pirotski okrug','Dimitrovgrad'),(966,'Smoljinac',12312,'Braničevski okrug','Malo Crniće'),(967,'Sokobanja',18230,'Zaječarski okrug','Sokobanja'),(968,'Sombor',25101,'Zapadnobački okrug','Sombor'),(969,'Sonta',25264,'Zapadnobački okrug','Apatin'),(970,'Sopot',11450,'Grad Beograd','Sopot'),(971,'Sot',22243,'Sremski okrug','Šid'),(972,'Sočanica',38217,'Kosovskomitrovački okrug','Leposavić'),(973,'Sremska Mitrovica',22000,'Sremski okrug','Sremska Mitrovica'),(974,'Srbobran',21480,'Južnobački okrug','Srbobran'),(975,'Srednjevo',12253,'Braničevski okrug','Veliko Gradište'),(976,'Sremska Kamenica',21202,'Južnobački okrug','Petrovaradin'),(977,'Sremska Rača',22247,'Sremski okrug','Sremska Mitrovica'),(978,'Sremski Karlovci',21205,'Južnobački okrug','Sremski Karlovci'),(979,'Sremski Mihaljevci',22413,'Sremski okrug','Pećinci'),(980,'Sremčica',11253,'Grad Beograd','Čukarica'),(981,'Srpska Crnja',23220,'Srednjobanatski okrug','Nova Crnja'),(982,'Srpski Itebej',23233,'Srednjobanatski okrug','Žitište'),(983,'Srpski Krstur',23334,'Severnobanatski okrug','Novi Kneževac'),(984,'Srpski Miletić',25244,'Zapadnobački okrug','Odžaci'),(985,'Stave',14255,'Kolubarski okrug','Valjevo'),(986,'Stajićevo',23204,'Srednjobanatski okrug','Zrenjanin'),(987,'Stalać',37212,'Rasinski okrug','Ćićevac'),(988,'Stanišić',25284,'Zapadnobački okrug','Sombor'),(989,'Stapar',25240,'Zapadnobački okrug','Sombor'),(990,'Stara Moravica',24340,'Severnobački okrug','Bačka Topola'),(991,'Stara Pazova',22300,'Sremski okrug','Stara Pazova'),(992,'Stari Banovci',22305,'Sremski okrug','Stara Pazova'),(993,'Stari Žednik',24224,'Severnobački okrug','Subotica'),(994,'Stari Lec',26371,'Južnobanatski okrug','Plandište'),(995,'Stari Slankamen',22329,'Sremski okrug','Inđija'),(996,'Staro Selo',11324,'Podunavski okrug','Velika Plana'),(997,'Starčevo',26232,'Južnobanatski okrug','Pančevo'),(998,'Stejanovci',22405,'Sremski okrug','Ruma'),(999,'Stenjevac',35215,'Pomoravski okrug','Despotovac'),(1000,'Stepanovićevo',21212,'Južnobački okrug','Novi Sad'),(1001,'Stepojevac',11564,'Grad Beograd','Lazarevac'),(1002,'Stojnik',34307,'Šumadijski okrug','Aranđelovac'),(1003,'Stopanja',37242,'Rasinski okrug','Trstenik'),(1004,'Stragari',34323,'Šumadijski okrug','Stragari'),(1005,'Straža',26345,'Južnobanatski okrug','Vršac'),(1006,'Strelac',18332,'Pirotski okrug','Babušnica'),(1007,'Stubal',17512,'Pčinjski okrug','Vladičin Han'),(1008,'Stubica',35246,'Pomoravski okrug','Paraćin'),(1009,'Stubline',11507,'Grad Beograd','Obrenovac'),(1010,'Studenica',36343,'Raški okrug','Kraljevo'),(1011,'Subotinac',18227,'Nišavski okrug','Aleksinac'),(1012,'Subotica (kod Svijanca)',35209,'Pomoravski okrug','Svilajnac'),(1013,'Subotica',24000,'Severnobački okrug','Subotica'),(1014,'Subotište',22414,'Sremski okrug','Pećinci'),(1015,'Sukovo',18322,'Pirotski okrug','Pirot'),(1016,'Sumrakovac',19376,'Zaječarski okrug','Boljevac'),(1017,'Supska',35228,'Pomoravski okrug','Ćuprija'),(1018,'Surduk',22307,'Sremski okrug','Stara Pazova'),(1019,'Surdulica',17530,'Pčinjski okrug','Surdulica'),(1020,'Susek',21313,'Južnobački okrug','Beočin'),(1021,'Sutjeska',23244,'Srednjobanatski okrug','Sečanj'),(1022,'Tavankut',24214,'Severnobački okrug','Subotica'),(1023,'Takovo',32304,'Moravički okrug','Gornji Milanovac'),(1024,'Taraš',23209,'Srednjobanatski okrug','Zrenjanin'),(1025,'Tekeriš',15234,'Mačvanski okrug','Loznica'),(1026,'Tekija',19325,'Borski okrug','Kladovo'),(1027,'Telečka',25222,'Zapadnobački okrug','Sombor'),(1028,'Temerin',21235,'Južnobački okrug','Temerin'),(1029,'Temska',18355,'Pirotski okrug','Pirot'),(1030,'Tešica',18212,'Nišavski okrug','Aleksinac'),(1031,'Titel',21240,'Južnobački okrug','Titel'),(1032,'Toba',23222,'Srednjobanatski okrug','Nova Crnja'),(1033,'Tovariševo',21424,'Južnobački okrug','Bačka Palanka'),(1034,'Tomaševac',23262,'Srednjobanatski okrug','Zrenjanin'),(1035,'Tomislavci',24334,'Severnobački okrug','Bačka Topola'),(1036,'Topola',34310,'Šumadijski okrug','Topola'),(1037,'Topolovnik',12226,'Braničevski okrug','Veliko Gradište'),(1038,'Toponica',34243,'Šumadijski okrug','Knić'),(1039,'Torak',23232,'Srednjobanatski okrug','Žitište'),(1040,'Torda',23214,'Srednjobanatski okrug','Žitište'),(1041,'Tornjoš',24352,'Severnobanatski okrug','Senta'),(1042,'Totovo Selo',24427,'Severnobanatski okrug','Kanjiža'),(1043,'Trbušani',32205,'Moravički okrug','Čačak'),(1044,'Trgovište',17525,'Pčinjski okrug','Trgovište'),(1045,'Trešnjevac',24426,'Severnobanatski okrug','Kanjiža'),(1046,'Trešnjevica',35248,'Pomoravski okrug','Paraćin'),(1047,'Trnavci',37235,'Rasinski okrug','Aleksandrovac'),(1048,'Trnjane',18213,'Nišavski okrug','Aleksinac'),(1049,'Trnjane',19306,'Borski okrug','Negotin'),(1050,'Trstenik',37240,'Rasinski okrug','Trstenik'),(1051,'Trupale',18211,'Nišavski okrug','Crveni Krst'),(1052,'Tršić',15303,'Mačvanski okrug','Loznica'),(1053,'Tulare',16247,'Jablanički okrug','Medveđa'),(1054,'Turekovac',16231,'Jablanički okrug','Leskovac'),(1055,'Turija',12257,'Braničevski okrug','Kučevo'),(1056,'Turija',21215,'Južnobački okrug','Srbobran'),(1057,'Tutin',36320,'Raški okrug','Tutin'),(1058,'Ćićevac',37210,'Rasinski okrug','Ćićevac'),(1059,'Ćuprija',35230,'Pomoravski okrug','Ćuprija'),(1060,'Ub',14210,'Kolubarski okrug','Ub'),(1061,'Ugao',36313,'Zlatiborski okrug','Sjenica'),(1062,'Ugrinovci',32314,'Moravički okrug','Gornji Milanovac'),(1063,'Užice',31000,'Zlatiborski okrug','Užice'),(1064,'Uzdin',26216,'Južnobanatski okrug','Kovačica'),(1065,'Uzovnica',15319,'Mačvanski okrug','Ljubovija'),(1066,'Uljma',26330,'Južnobanatski okrug','Vršac'),(1067,'Umka',11260,'Grad Beograd','Čukarica'),(1068,'Urovica',19305,'Borski okrug','Negotin'),(1069,'Utrine',24437,'Severnobanatski okrug','Ada'),(1070,'Ušće',36342,'Raški okrug','Kraljevo'),(1071,'Farkaždin',23264,'Srednjobanatski okrug','Zrenjanin'),(1072,'Feketić',24323,'Severnobački okrug','Mali Iđoš'),(1073,'Futog',21410,'Južnobački okrug','Novi Sad'),(1074,'Hajdukovo',24414,'Severnobački okrug','Subotica'),(1075,'Hajdučica',26370,'Južnobanatski okrug','Plandište'),(1076,'Hetin',23235,'Srednjobanatski okrug','Žitište'),(1077,'Horgoš',24410,'Severnobanatski okrug','Kanjiža'),(1078,'Horgoš granični prelaz',24411,'Severnobanatski okrug','Kanjiža'),(1079,'Hrtkovci',22427,'Sremski okrug','Ruma'),(1080,'Cerovac',15224,'Mačvanski okrug','Šabac'),(1081,'Crvena Reka',18313,'Pirotski okrug','Bela Palanka'),(1082,'Crvena Crkva',26323,'Južnobanatski okrug','Bela Crkva'),(1083,'Crvenka',25220,'Zapadnobački okrug','Kula'),(1084,'Crepaja',26213,'Južnobanatski okrug','Kovačica'),(1085,'Crkvine',36321,'Raški okrug','Tutin'),(1086,'Crna Bara',15355,'Mačvanski okrug','Bogatić'),(1087,'Crna Bara',23328,'Severnobanatski okrug','Čoka'),(1088,'Crna Trava',16215,'Jablanički okrug','Crna Trava'),(1089,'Crnoklište',18304,'Pirotski okrug','Pirot'),(1090,'Čajetina',31310,'Zlatiborski okrug','Čajetina'),(1091,'Čalma',22231,'Sremski okrug','Sremska Mitrovica'),(1092,'Čantavir',24220,'Severnobački okrug','Subotica'),(1093,'Čačak',32101,'Moravički okrug','Čačak'),(1094,'Čelarevo',21413,'Južnobački okrug','Bačka Palanka'),(1095,'Čenej',21233,'Južnobački okrug','Novi Sad'),(1096,'Čenta',23266,'Srednjobanatski okrug','Zrenjanin'),(1097,'Čerević',21311,'Južnobački okrug','Beočin'),(1098,'Čestereg',23215,'Srednjobanatski okrug','Žitište'),(1099,'Čečina',18417,'Nišavski okrug','Doljevac'),(1100,'Čitluk',18232,'Zaječarski okrug','Sokobanja'),(1101,'Čitluk',37208,'Rasinski okrug','Kruševac'),(1102,'Čoka',23320,'Severnobanatski okrug','Čoka'),(1103,'Čonoplja',25210,'Zapadnobački okrug','Sombor'),(1104,'Čortanovci',22326,'Sremski okrug','Inđija'),(1105,'Čukojevac',36220,'Raški okrug','Kraljevo'),(1106,'Čumić',34322,'Šumadijski okrug','Aerodrom'),(1107,'Čurug',21238,'Južnobački okrug','Žabalj'),(1108,'Džep',17514,'Pčinjski okrug','Vladičin Han'),(1109,'Džigolj',18405,'Toplički okrug','Prokuplje'),(1110,'Šabac',15000,'Mačvanski okrug','Šabac'),(1111,'Šajkaš',21244,'Južnobački okrug','Titel'),(1112,'Šarbanovac',19373,'Borski okrug','Bor'),(1113,'Šarbanovac-Timok',19379,'Borski okrug','Bor'),(1114,'Šašinci',22425,'Sremski okrug','Sremska Mitrovica'),(1115,'Šepšin',11433,'Grad Beograd','Mladenovac'),(1116,'Šetonje',12309,'Braničevski okrug','Petrovac'),(1117,'Šid',22239,'Sremski okrug','Šid'),(1118,'Šilovo',38252,'Kosovskopomoravski okrug','Gnjilane'),(1119,'Šimanovci',22310,'Sremski okrug','Pećinci'),(1120,'Šljivovac',34219,'Šumadijski okrug','Aerodrom'),(1121,'Šljivovica',31244,'Zlatiborski okrug','Čajetina'),(1122,'Šljivovo',37239,'Rasinski okrug','Aleksandrovac'),(1123,'Štavalj',36311,'Zlatiborski okrug','Sjenica'),(1124,'Štitar',15354,'Mačvanski okrug','Šabac'),(1125,'Štitare',36314,'Raški okrug','Novi Pazar'),(1126,'Štrpce',38236,'Kosovski okrug','Štrpce'),(1127,'Štubik',19303,'Borski okrug','Negotin'),(1128,'Šupljak',24418,'Severnobački okrug','Subotica'),(1129,'Šurjan',23254,'Srednjobanatski okrug','Sečanj');
/*!40000 ALTER TABLE `tblgrad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vestine`
--

DROP TABLE IF EXISTS `vestine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vestine` (
  `idvolont` int(11) NOT NULL,
  `idvestine` int(11) NOT NULL,
  `iskustva` varchar(100) DEFAULT NULL,
  `diplome` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idvolont`,`idvestine`),
  KEY `vestineSifKey_idx` (`idvestine`),
  CONSTRAINT `vestineSifKey` FOREIGN KEY (`idvestine`) REFERENCES `vestinesif` (`idvestinesif`) ON UPDATE CASCADE,
  CONSTRAINT `volontKey` FOREIGN KEY (`idvolont`) REFERENCES `volonter` (`idvolonter`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vestine`
--

LOCK TABLES `vestine` WRITE;
/*!40000 ALTER TABLE `vestine` DISABLE KEYS */;
/*!40000 ALTER TABLE `vestine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vestinesif`
--

DROP TABLE IF EXISTS `vestinesif`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vestinesif` (
  `idvestinesif` int(11) NOT NULL AUTO_INCREMENT,
  `naziv` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idvestinesif`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vestinesif`
--

LOCK TABLES `vestinesif` WRITE;
/*!40000 ALTER TABLE `vestinesif` DISABLE KEYS */;
/*!40000 ALTER TABLE `vestinesif` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volonter`
--

DROP TABLE IF EXISTS `volonter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volonter` (
  `idvolonter` int(11) NOT NULL AUTO_INCREMENT,
  `ime_prezime` varchar(100) NOT NULL,
  `datum_rodjenja` date NOT NULL,
  `pol` varchar(1) NOT NULL,
  `drzavljanstvo_id` int(11) NOT NULL,
  `telefon` varchar(20) NOT NULL,
  `ulica_broj` varchar(100) NOT NULL,
  `mesto_id` int(11) NOT NULL,
  `slika` varchar(255) NOT NULL,
  `cv` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `lozinka` varchar(20) NOT NULL,
  `JPime` tinyint(4) NOT NULL,
  `JPdatum_rodjenja` tinyint(4) NOT NULL,
  `JPpol` tinyint(4) NOT NULL,
  `JPdrzavljanstvo` tinyint(4) NOT NULL,
  `JPtelefon` tinyint(4) NOT NULL,
  `JPulica_broj` tinyint(4) NOT NULL,
  `JPmesto` tinyint(4) NOT NULL,
  `JPslika` tinyint(4) NOT NULL,
  `JPcv` tinyint(4) NOT NULL,
  `JPstatus` tinyint(4) NOT NULL,
  `Aktivan` tinyint(4) NOT NULL DEFAULT '0',
  `tip` tinyint(4) NOT NULL DEFAULT '1',
  `Zdravstveni_problemi` varchar(200) DEFAULT NULL,
  `skola_id` int(11) DEFAULT NULL,
  `oblastivolontiranjaid` int(11) NOT NULL,
  `zaposlenjeid` int(11) DEFAULT NULL,
  `vestineid` int(11) DEFAULT NULL,
  `oblastiid` int(11) DEFAULT NULL,
  PRIMARY KEY (`idvolonter`),
  UNIQUE KEY `idvolonter_UNIQUE` (`idvolonter`),
  KEY `mestoKey_idx` (`mesto_id`),
  KEY `drzavljanstvoKey_idx` (`drzavljanstvo_id`),
  KEY `statusKey_idx` (`status`),
  CONSTRAINT `drzavljanstvoKey` FOREIGN KEY (`drzavljanstvo_id`) REFERENCES `drzavljanstvo` (`iddrz`),
  CONSTRAINT `mestoKey` FOREIGN KEY (`mesto_id`) REFERENCES `tblgrad` (`Id`),
  CONSTRAINT `statusKey` FOREIGN KEY (`status`) REFERENCES `statussif` (`idstatusSif`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volonter`
--

LOCK TABLES `volonter` WRITE;
/*!40000 ALTER TABLE `volonter` DISABLE KEYS */;
INSERT INTO `volonter` VALUES (1,'Srdjan Abadzija','2008-02-02','M',1,'022/2301-797','Vojvode Misica 23',1,'','',1,'srki@bla.com','nesto',0,0,0,0,0,0,0,0,0,0,1,0,NULL,NULL,0,NULL,NULL,NULL),(6,'gdfg','2018-06-06','M',1,'234324','jhgjhghgj',1,'nhghjhg','jghjgj',3,'hfghf@bla.com','retrret',0,0,0,0,0,0,0,0,0,0,0,2,'',NULL,0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `volonter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zaposlenje`
--

DROP TABLE IF EXISTS `zaposlenje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zaposlenje` (
  `idvolonter` int(11) NOT NULL,
  `idzaposlenje` int(11) NOT NULL,
  `sediste` varchar(100) NOT NULL,
  `pozicija` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idvolonter`,`idzaposlenje`),
  KEY `idvolonterKey_idx` (`idvolonter`),
  KEY `idzaposlenjesif` (`idzaposlenje`),
  CONSTRAINT `idvolonterKey` FOREIGN KEY (`idvolonter`) REFERENCES `volonter` (`idvolonter`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idzaposlenjesif` FOREIGN KEY (`idzaposlenje`) REFERENCES `zaposlenjesif` (`id zaposlenje`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zaposlenje`
--

LOCK TABLES `zaposlenje` WRITE;
/*!40000 ALTER TABLE `zaposlenje` DISABLE KEYS */;
/*!40000 ALTER TABLE `zaposlenje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zaposlenjesif`
--

DROP TABLE IF EXISTS `zaposlenjesif`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zaposlenjesif` (
  `id zaposlenje` int(11) NOT NULL,
  `kompanija` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id zaposlenje`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zaposlenjesif`
--

LOCK TABLES `zaposlenjesif` WRITE;
/*!40000 ALTER TABLE `zaposlenjesif` DISABLE KEYS */;
/*!40000 ALTER TABLE `zaposlenjesif` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-04 11:25:51
