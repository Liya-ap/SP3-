-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: chill
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS `movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie` (
  `movieID` int NOT NULL AUTO_INCREMENT,
  `title` varchar(75) NOT NULL,
  `categories` varchar(200) NOT NULL,
  `year` varchar(45) NOT NULL,
  `rating` double NOT NULL,
  PRIMARY KEY (`movieID`),
  UNIQUE KEY `title_UNIQUE` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
INSERT INTO `movie` VALUES (1,'The Shawshank Redemption',' Drama','1994',9.3),(2,'Schindler\'s List',' Biography. Drama. History','1993',8.9),(3,'Raging Bull',' Biography. Drama. Sport','1980',8.2),(4,'Casablanca',' Drama. Romance. War','1942',8.5),(5,'Citizen Kane',' Drama. Mystery','1941',8.4),(6,'Gone With The Wind',' Drama. History. Romance','1939',8.2),(7,'The Wizard Of Oz',' Adventure. Family. Fantasy','1939',8),(8,'One Flew Over The Cuckoo\'s Nest',' Drama','1975',8.7),(9,'Lawrence Of Arabia',' Adventure. Biography. Drama','1962',8.3),(10,'Vertigo',' Mystery. Romance. Thriller','1958',8.3),(11,'Psycho',' Horror. Mystery. Thriller','1960',8.5),(12,'The Godfather part II',' Crime. Drama','1974',9),(13,'On The Waterfront',' Crime. Drama. Thriller','1954',8.2),(14,'Sunset Boulevard',' Drama. Film-Noir','1950',8.4),(15,'Forrest Gump',' Drama. Romance','1994',8.8),(16,'The Sound Of Music',' Biography. Drama. Family. Musical','1965',8),(17,'12 Angry Men',' Crime. Drama','1957',8.9),(18,'West Side Story',' Crime. Drama','1961',7.6),(19,'Star Wars',' Action. Adventure. Family','1977',8.6),(20,'2001 A Space Odyssey',' Adventure. Sci-fi','1968',8.3),(21,'ET',' Family. Sci-fi','1982',7.9),(22,'The Silence Of The Lambs','Crime. Drama. Thriller','1991',8.6),(23,'Chinatown',' Drama. Mystery. Thriller','1974',8.2),(24,'The Bridge Over The River Kwai',' Adventure. Drama. War','1957',8.2),(25,'Singin\' In The Rain',' Comedy. Musical. Romance','1952',8.3),(26,'It\'s A Wonderful Life',' Drama. Family. Fantasy','1946',8.6),(27,'Dr. Strangelove Or How I Learned To Stop Worrying And Love The Bomb',' Comedy. War','1964',8.4),(28,'Some Like It Hot',' Comedy. Romance','1959',8.2),(29,'Ben Hur',' Adventure. Drama. History','1959',8.1),(30,'Apocalypse Now',' Drama. War','1979',8.5),(31,'Amadeus',' Biography. Drama. History','1984',8.3),(32,'Lord Of The Rings - The Return Of The King',' Action. Adventure. Drama','2003',8.9),(33,'Gladiator',' Action. Adventure. Drama','2000',8.5),(34,'Titanic',' Drama. Romance','1997',7.8),(35,'From Here To Eternity',' Drama. Romance. War','1953',7.7),(36,'Saving Private Ryan',' Drama. War','1998',8.6),(37,'Unforgiven',' Drama. Western','1992',8.2),(38,'Raiders Of The Lost Ark',' Action. Adventure','1981',8.5),(39,'Rocky',' Drama. Sport','1976',8.1),(40,'A Streetcar Named Desire',' Drama','1951',8),(41,'A Philadelphia Story',' Comedy. Romance','1940',8),(42,'To Kill A Mockingbird',' Crime. Drama','1962',8.3),(43,'An American In Paris',' Drama. Musical. Romance','1951',7.2),(44,'The Best Years Of Our Lives',' Drama. Romance. War','1946',8.1),(45,'My Fair Lady',' Drama. Family. Musical','1964',7.9),(46,'A Clockwork Orange',' Crime. Drama. Sci-fi','1971',8.3),(47,'Doctor Zhivago',' Drama. Romance. War','1965',8),(48,'The Searchers',' Adventure. Drama. Western','1956',8),(49,'Jaws',' Adventure. Drama. Thriller','1975',8),(50,'Patton',' Biography. Drama. War','1970',8),(51,'Butch Cassidy And The Sundance Kid',' Biography. Crime. Drama','1969',8.1),(52,'The Treasure Of The Sierra Madre',' Adventure. Drama. Western','1948',8.3),(53,'The Good. The Bad And The Ugly',' Western','1966',8.9),(54,'The Apartment',' Comedy. Drama. Romance','1960',8.3),(55,'Platoon',' Drama. War','1986',8.1),(56,'High Noon',' Action. Drama. Thriller','1952',8),(57,'Braveheart',' Biography. Drama. History','1995',8.4),(58,'Dances With Wolves',' Adventure. Drama. Western','1990',8),(59,'Jurassic Park',' Adventure. Sci-fi. Thriller','1993',8.1),(60,'The Exorcist',' Horror','1973',8),(61,'The Pianist',' Biography. Drama. Music','2002',8.5),(62,'Goodfellas',' Crime. Drama','1990',8.7),(63,'The Deer Hunter',' Drama. War','1978',8.1),(64,'All Quiet On The Western Front',' Drama. War','1930',8.1),(65,'Bonny And Clyde',' Action. Biography. Crime','1967',7.9),(66,'The French Connection',' Action. Crime. Drama','1971',7.8),(67,'City Lights',' Comedy. Drama. Romance','1931',8.5),(68,'It Happened One Night',' Comedy. Romance','1934',8.1),(69,'A Place In The Sun',' Drama. Romance','1951',7.8),(70,'Midnight Cowboy',' Drama','1969',7.9),(71,'Mr Smith Goes To Washington',' Comedy. Drama','1939',8.2),(72,'Rain Man',' Drama','1988',8),(73,'Annie Hall',' Comedy. Romance','1977',8),(74,'Fargo',' Crime. Drama. Thriller','1996',8.1),(75,'Giant',' Drama. Western','1956',7.7),(76,'Shane',' Drama. Western','1953',7.7),(77,'Grapes Of Wrath',' Drama. History','1940',8.1),(78,'The Green Mile',' Crime. Drama. Fantasy','1999',8.5),(79,'Close Encounters',' Drama. Sci-fi','1977',7.7),(80,'Nashville',' Comedy. Drama. Music','1975',7.8),(81,'Network',' Drama','1976',8.1),(82,'The Graduate',' Comedy. Drama. Romance','1967',8),(83,'American Graffiti',' Comedy. Drama','1973',7.5),(84,'Pulp Fiction',' Crime. Drama','1994',8.9),(85,'Terms of Endearment',' Comedy. Drama','1983',7.4),(86,'Good Will Hunting',' Drama. Romance','1997',8.3),(87,'The African Queen',' Adventure. Drama. Romance','1951',7.9),(88,'Stagecoach',' Adventure. Western','1939',7.9),(89,'Mutiny On The Bounty',' Adventure. Biography. Drama','1935',7.8),(90,'The Great Dictator',' Comedy. Drama. War','1940',8.5),(91,'Double Indemnity',' Crime. Drama. Film-Noir','1944',8.3),(92,'The Maltese Falcon',' Film-Noir. Mystery','1941',8.1),(93,'Wuthering Heights',' Drama. Romance','1939',7.7),(94,'Taxi Driver',' Crime. Drama','1976',8.3),(95,'Rear Window',' Mystery. Thriller','1954',8.5),(96,'The Third Man',' Film-Noir. Mystery. Thriller','1949',8.2),(97,'Rebel Without A Cause',' Drama','1955',7.8),(98,'North By Northwest',' Adventure. Mystery. Thriller','1959',8.3),(99,'Yankee Doodle Dandy',' Biography. Drama. Musical','1942',7.7);
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-29 18:52:12
