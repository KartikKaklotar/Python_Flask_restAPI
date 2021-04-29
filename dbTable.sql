-- MySQL dump 10.13  Distrib 5.7.33, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: games_portal
-- ------------------------------------------------------
-- Server version	5.7.33-0ubuntu0.18.04.1

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
-- Table structure for table `games`
--

DROP TABLE IF EXISTS `games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `games` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(1000) NOT NULL,
  `platform` varchar(1000) NOT NULL,
  `score` float NOT NULL,
  `genre` varchar(1000) NOT NULL,
  `editors_choice` enum('Y','N') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_games_platform` (`platform`),
  KEY `ix_games_genre` (`genre`),
  KEY `ix_games_editors_choice` (`editors_choice`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `games`
--

LOCK TABLES `games` WRITE;
/*!40000 ALTER TABLE `games` DISABLE KEYS */;
INSERT INTO `games` VALUES (1,'LittleBigPlanet PS Vita','PlayStation Vita',9,'Platformer','Y'),(2,'LittleBigPlanet PS Vita -- Marvel Super Hero Edition','PlayStation Vita',9,'Platformer','Y'),(3,'Splice: Tree of Life','iPad',8.5,'Puzzle','N'),(4,'NHL 13','Xbox 360',8.5,'Sports','N'),(5,'NHL 13','PlayStation 3',8.5,'Sports','N'),(6,'Total War Battles: Shogun','Macintosh',7,'Strategy','N'),(7,'Double Dragon: Neon','Xbox 360',3,'Fighting','N'),(8,'Guild Wars 2','PC',9,'RPG','Y'),(9,'Double Dragon: Neon','PlayStation 3',3,'Fighting','N'),(10,'Total War Battles: Shogun','PC',7,'Strategy','N'),(11,'Tekken Tag Tournament 2','PlayStation 3',7.5,'Fighting','N'),(12,'Tekken Tag Tournament 2','Xbox 360',7.5,'Fighting','N'),(13,'Wild Blood','iPhone',7,'Action','N'),(14,'Mark of the Ninja','Xbox 360',9,'Action','Y'),(15,'Mark of the Ninja','PC',9,'Action','Y'),(16,'Home: A Unique Horror Adventure','Macintosh',6.5,'Adventure','N'),(17,'Home: A Unique Horror Adventure','PC',6.5,'Adventure','N'),(18,'Avengers Initiative','iPhone',8,'Action','N'),(19,'Way of the Samurai 4','PlayStation 3',5.5,'Action','N'),(20,'JoJo\'\'s Bizarre Adventure HD','Xbox 360',7,'Fighting','N'),(21,'JoJo\'\'s Bizarre Adventure HD','PlayStation 3',7,'Fighting','N'),(22,'Mass Effect 3: Leviathan','Xbox 360',7.5,'RPG','N'),(23,'Mass Effect 3: Leviathan','PlayStation 3',7.5,'RPG','N'),(24,'Mass Effect 3: Leviathan','PC',7.5,'RPG','N'),(25,'Dark Souls (Prepare to Die Edition)','PC',9,'Action','Y'),(26,'Symphony','PC',7,'Shooter','N'),(27,'Bastion','iPad',9,'Action','Y'),(28,'Tom Clancy\'\'s Ghost Recon Phantoms','PC',7.5,'Shooter','N'),(29,'Thirty Flights of Loving','PC',8,'Adventure','N'),(30,'Legasista','PlayStation 3',6.5,'Action','N'),(31,'The Walking Dead: The Game -- Episode 3: Long Road Ahead','Macintosh',9,'Adventure','Y'),(32,'World of Warcraft: Mists of Pandaria','PC',8.7,'RPG','Y'),(33,'Hell Yeah! Wrath of the Dead Rabbit','PlayStation 3',4.9,'Platformer','N'),(34,'Pokemon White Version 2','Nintendo DS',9.6,'RPG','Y'),(35,'War of the Roses','PC',7.3,'Action','N'),(36,'Pokemon Black Version 2','Nintendo DS',9.6,'RPG','Y'),(37,'Drakerider','iPhone',6.5,'RPG','N'),(38,'The Walking Dead: The Game -- Episode 3: Long Road Ahead','Xbox 360',9,'Adventure','Y'),(39,'The Walking Dead: The Game -- Episode 3: Long Road Ahead','PC',9,'Adventure','Y'),(40,'The Walking Dead: The Game -- Episode 3: Long Road Ahead','PlayStation 3',9,'Adventure','Y'),(41,'Rock Band Blitz','Xbox 360',8.5,'Music','Y'),(42,'Counter-Strike: Global Offensive','Macintosh',8,'Shooter','N'),(43,'Worms Revolution','PlayStation 3',8.5,'Strategy','N'),(44,'Worms Revolution','PC',8.5,'Strategy','N'),(45,'Worms Revolution','Xbox 360',8.5,'Strategy','N'),(46,'Bad Piggies','iPhone',9.2,'Action','Y'),(47,'Resident Evil 6','PlayStation 3',7.9,'Action','N'),(48,'Resident Evil 6','Xbox 360',7.9,'Action','N'),(49,'Shad\'\'O','PC',7,'Adventure','N'),(50,'Demon\'\'s Score','iPhone',6.9,'Action','N'),(51,'NBA 2K13','Xbox 360',9.1,'Sports','Y'),(52,'Counter-Strike: Global Offensive','PC',8,'Shooter','N'),(53,'The World Ends with You: Solo Remix','iPad',9.5,'RPG','Y'),(54,'Counter-Strike: Global Offensive','PlayStation 3',8,'Shooter','N'),(55,'The World Ends with You: Solo Remix','iPhone',9.5,'RPG','Y'),(56,'Counter-Strike: Global Offensive','Xbox 360',8,'Shooter','N'),(57,'Madden NFL 13','PlayStation Vita',6,'Sports','N'),(58,'Madden NFL 13','PlayStation 3',9,'Sports','Y'),(59,'Madden NFL 13','Xbox 360',9,'Sports','Y'),(60,'Hoodwink','PC',2.5,'Adventure','N'),(61,'NBA 2K13','PlayStation 3',9.1,'Sports','Y'),(62,'NBA 2K13','PC',9.1,'Sports','Y'),(63,'Lili: Child of Geos','iPhone',7,'Adventure','N'),(64,'Marvel vs. Capcom Origins','Xbox 360',8.2,'Fighting','N'),(65,'Marvel vs. Capcom Origins','PlayStation 3',8.2,'Fighting','N'),(66,'Dead or Alive 5','PlayStation 3',8.8,'Fighting','N'),(67,'Dead or Alive 5','Xbox 360',8.8,'Fighting','N'),(68,'Medal of Honor Warfighter','PC',4,'Shooter','N'),(69,'Professor Layton and the Miracle Mask','Nintendo 3DS',8.7,'Adventure','Y'),(70,'Hotline Miami','PC',8.8,'Action','Y'),(71,'Edna & Harvey: Harvey\'\'s New Eyes','PC',6,'Adventure','N'),(72,'Medal of Honor Warfighter','PlayStation 3',4,'Shooter','N'),(73,'Medal of Honor Warfighter','Xbox 360',4,'Shooter','N'),(74,'Transformers: Fall of Cybertron','Xbox 360',8.5,'Shooter','N'),(75,'Transformers: Fall of Cybertron','PlayStation 3',8.5,'Shooter','N'),(76,'Hero Academy','PC',9,'Board','Y'),(77,'Hero Academy','iPhone',9,'Strategy','Y'),(78,'Puzzle Craft','iPhone',9,'Puzzle','Y'),(79,'Realms Of Ancient War','Xbox 360',5.5,'Action','N'),(80,'Realms Of Ancient War','PlayStation 3',5.5,'Action','N'),(81,'Anomaly: Warzone Earth','PlayStation 3',8.2,'Action','N'),(82,'Darksiders II','PC',7.5,'Action','N'),(83,'Left 4 Dead 2: Cold Stream','Macintosh',7,'Shooter','N'),(84,'Left 4 Dead 2: Cold Stream','PC',7,'Shooter','N'),(85,'Puzzle Craft','Android',9,'Puzzle','Y'),(86,'Left 4 Dead 2: Cold Stream','Xbox 360',7,'Shooter','N'),(87,'Horn','iPhone',9,'Action','Y'),(88,'Forza Horizon','Xbox 360',9,'Racing','Y'),(89,'FIFA Soccer 13','PlayStation Vita',4,'Sports','N'),(90,'Mugen Souls','PlayStation 3',3.9,'Strategy','N'),(91,'Crazy Taxi','iPhone',7.1,'Racing','N'),(92,'New Little King\'\'s Story','PlayStation Vita',5.8,'RPG','N'),(93,'Fable: The Journey','Xbox 360',7.2,'Action','N'),(94,'The Lord of the Rings Online: Riders of Rohan','PC',8.3,'RPG','N'),(95,'Doom 3: BFG Edition','Xbox 360',7.6,'RPG','N'),(96,'Rugby League Live 2','Xbox 360',6,'Sports','N'),(97,'Rugby League Live 2','PlayStation 3',6,'Sports','N'),(98,'Doom 3: BFG Edition','PlayStation 3',7.6,'RPG','N'),(99,'Punch Quest','iPhone',9.3,'Action','Y'),(100,'NewTest','IOS',8.5,'Action','Y'),(101,'NewTest','IOS',8.5,'Action','Y');
/*!40000 ALTER TABLE `games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(1000) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `password` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ix_user_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (2,'testName','test@gmail.com','sha256$1v67qA7D$b852214c2d6413e82b3b0dd4fbb90cea8fcd7b43239f2c65cd7fe03d6cfe72a0');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-29  9:22:52
