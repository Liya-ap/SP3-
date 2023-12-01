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
-- Table structure for table `series`
--

DROP TABLE IF EXISTS `series`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `series` (
  `serieID` int NOT NULL AUTO_INCREMENT,
  `title` varchar(75) NOT NULL,
  `year` varchar(20) NOT NULL,
  `categories` varchar(200) NOT NULL,
  `rating` double NOT NULL,
  `seasonsandepisodes` varchar(160) NOT NULL,
  PRIMARY KEY (`serieID`),
  UNIQUE KEY `title_UNIQUE` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `series`
--

LOCK TABLES `series` WRITE;
/*!40000 ALTER TABLE `series` DISABLE KEYS */;
INSERT INTO `series` VALUES (1,'The Sopranos',' 1999-2007',' Crime. Drama',9.2,' 1-13. 2-13. 3-13. 4-13. 5-13. 6-21'),(2,'Game Of Thrones',' 2011-',' Action. Adventure. Drama',9.5,' 1-10. 2-10. 3-10. 4-10. 5-10. 6-10. 7-7'),(3,'Breaking Bad',' 2008-2013',' Crime. Drama. Thriller',9.5,' 1-7. 2-13. 3-13. 4-13. 5-16'),(4,'The Larry Sanders Show',' 1992-1998',' Comedy',8.3,' 1-13. 2-18. 3-17. 4-17. 5-13. 6-12'),(5,'Curb Your Enthusiasm',' 2000-',' Comedy',8.7,' 1-10. 2-10. 3-10. 4-10. 5-10. 6-10. 7-10. 8-10. 9-10'),(6,'Lost',' 2004-2010',' Adventure. Drama. Fantasy',8.4,' 1-25. 2-24. 3-23. 4-14. 5-17. 6-18'),(7,'Louie',' 2010-2015',' Comedy. Drama',8.6,' 1-13. 2-13. 3-13. 4-14. 5-8'),(8,'Cheers',' 1982-1993',' Comedy. Drama',7.8,' 1-22. 2-22. 3-25. 4-26. 5-26. 6-25. 7-22. 8-26. 9-27. 10-26. 11-28'),(9,'Scener ur ett äktenskap',' 1973',' Drama',8.5,' 1-6'),(10,'Buffy The Vampire Slayer',' 1996-2003',' Action. Drama. Fantasy',8.2,' 1-12. 2-22. 3-22. 4-22. 5-22. 6-22. 7-22'),(11,'The Shield',' 2002-2008',' Crime. Drama. Thriller',8.7,' 1-13. 2-13. 3-15. 4-13. 5-11. 6-10. 7-13'),(12,'Deadwood',' 2004-2006',' Crime. Drama. History',8.7,' 1-12. 2-12. 3-12'),(13,'The Marvelous Mrs Maisel',' 2017- ',' Comedy. Drama',8.7,' 1-8'),(14,'Horace and Pete\'s',' 2016',' Comedy. Drama',8.6,' 1-10'),(15,'Top Of The Lake',' 2013- ',' Crime. Drama. Mystery',7.5,' 1-7. 2-6'),(16,'The Walking Dead',' 2010- ',' Drama. Horror. Sci-fi',8.4,' 1-6. 2-13. 3-16. 4-16. 5-16. 6-16. 7-16. 8-16. 9-16'),(17,'The Wire',' 2001-2008',' Crime. Drama. Thriller',9.3,' 1-13. 2-12. 3-12. 4-13. 5-10'),(18,'Welt Am Draht',' 1973 ',' Crime. Mystery. Sci-fi',7.9,' 1-2'),(19,'House Of Cards',' 2013-2018',' Drama',8.9,' 1-13. 2-13. 3-13. 4-13. 5-13. 6-8'),(20,'Fargo',' 2014- ',' Crime. Drama. Thriller',9,' 1-10'),(21,'Angel',' 1999-2004',' Action. Drama. Fantasy',8,' 1-22. 2-22. 3-22. 4-22. 5-22'),(22,'V',' 1984-1985',' Action. Adventure. Sci-fi',7.3,' 1-13'),(23,'Jessica Jones',' 2015- ',' Action. Crime. Drama',8.1,' 1-13. 2-13'),(24,'Daredevil',' 2015- ',' Action. Crime. Drama',8.7,' 1-13. 2-13. 3-13'),(25,'Seinfeld',' 1989-1998',' Comedy',8.9,' 1-5. 2-12. 3-23. 4-24. 5-22. 6-24. 7-24. 8-22. 9-24'),(26,'Slings And Arrows',' 2003-2006',' Comedy',8.5,' 1-6. 2-6. 3-6'),(27,'I Claudius',' 1976','  Biography. Drama. History',8.9,' 1-12'),(28,'Rome',' 2005-2007',' Action. Drama. History',8.8,' 1-12. 2-10'),(29,'Ray Donovan',' 2013- ',' Crime. Drama',8.3,' 1-12. 2-12. 3-12. 4-12. 5-12. 6-12'),(30,'Better Call Saul',' 2015- ',' Crime. Drama',8.7,' 1-10. 2-10. 3-10. 4-10'),(31,'The Honeymooners',' 1955-1956',' Comedy. Family',8.7,' 1-39'),(32,'Spaced',' 1999-2001',' Action. Comedy',8.6,' 1-7. 2-7'),(33,'The Twilight Zone',' 1959-1964',' Fantasy. Horror. Mystery',9,' 1-36. 2-29. 3-37. 4-18. 5-36'),(34,'Fraiser',' 1993-2004',' Comedy',8.1,' 1-24. 2-24. 3-24. 4-24. 5-24. 6-24. 7-24. 8-24. 9-24. 10-24. 11-24'),(35,'Alfred Hitchcock Presents',' 1955-1962',' Crime. Drama. Mystery',8.6,' 1-39. 2-39. 3-39. 4-36. 5-38. 6-38. 7-38'),(36,'I Love Lucy',' 1951-1957',' Comedy. Family',8.3,' 1-35. 2-31. 3-31. 4-30. 5-26. 6-27'),(37,'24',' 2001-2010',' Action. Crime. Drama',8.4,' 1-24. 2-24. 3-24. 4-24. 5-24. 6-24.7-24. 8-24'),(38,'The Americans',' 2013-2018',' Crime. Drama. Mystery',8.4,' 1-13. 2-13. 3-13. 4-13. 5-13. 6-10'),(39,'Girls',' 2012-2017',' Comedy. Drama',7.3,' 1-10. 2-10. 3-12. 4-10. 5-10'),(40,'Mad Men',' 2007-2015',' Drama',8.6,' 1-13. 2-13. 3-13. 4-13. 5-13. 6-13. 7-14'),(41,'Northern Exposure',' 1990-1995',' Comedy. Drama. Fantasy',8.3,' 1-8. 2-7. 3-23. 4-25. 5-24. 6-23'),(42,'Star Trek',' 1966-1969',' Action. Adventure. Sci-fi',8.3,' 1-29. 2-26. 3-24'),(43,'Big Little Lies',' 2017 ',' Crime. Drama. Mystery',8.6,' 1-7'),(44,'Firefly',' 2002-2003',' Adventure. Drama. Sci-fi',9,' 1-14'),(45,'Spartacus',' 2010-2013',' Action. Adventure. Biography',8.5,' 1-13. 2-10. 3-10'),(46,'Mr Show With Bob And David',' 1995-1998',' Comedy',8.3,' 1-4. 2-6. 3-10. 4-10'),(47,'Homeland',' 2011-',' Crime. Drama. Mystery',8.3,' 1-12. 2-12. 3-12. 4-12. 5-12. 6-12. 7-12'),(48,'Show Me A Hero',' 2015',' Drama. History',8.1,' 1-6'),(49,'Crisis In Six Scenes',' 2016',' Comedy',6.6,' 1-6'),(50,'Batman',' 1966-1968',' Action. Adventure. Comedy',7.5,' 1-34. 2-60. 3-26'),(51,'Luke Cage',' 2016-2018',' Action. Crime. Drama',7.5,' 1-13. 2-13'),(52,'South Park',' 1997-',' Animation. Comedy',8.7,' 1-13. 2-18. 3-17. 4-17. 5-14. 6-17. 7-15. 8-14. 9-14. 10-14. 11-14. 12-14. 13-14. 14-14. 15-14. 16-14. 17-10. 18-10. 19-10. 20-10. 21-10. 22-10'),(53,'Band Of Brothers',' 2001',' Action. Drama. History',9.5,' 1-10'),(54,'Married With Children',' 1986-1997',' Comedy',8.1,' 1-13. 2-22. 3-22. 4-23. 5-25. 6-26. 7-26. 8-26. 9-26. 10-26. 11-24'),(55,'Family Ties',' 1982-1989',' Comedy. Family',7.2,' 1-21. 2-22. 3-22. 4-22. 5-24. 6-24. 7-20'),(56,'Lonesome Dove',' 1989',' Adventure. Drama. Western',8.7,' 1-4'),(57,'Pride And Prejudice',' 1995',' Drama. Romance',8.9,' 1-6'),(58,'Flying Blind',' 1992-1993',' Comedy',8,' 1-22'),(59,'Battlestar Galactica',' 2004-2009',' Action. Adventure. Drama',8.7,' 1-13. 2-20. 3-20. 4-20'),(60,'Lucky Louie',' 2006-2007',' Comedy',8,' 1-13'),(61,'Dekalog',' 1989-1990',' Drama',9.1,' 1-10'),(62,'It\'s Garry Shandling\'s Show',' 1986-1990',' Comedy',7.6,' 1-16. 2-17. 3-20. 4-19'),(63,'On The Air',' 1992',' Comedy',7.4,' 1-7'),(64,'All In The Family',' 1971-1979',' Comedy. Drama',7.4,' 1-13. 2-24. 3-24. 4-24. 5-23. 6-24. 7-25. 8-24. 9-24'),(65,'Entourage',' 2004-2011',' Comedy. Drama',8.5,' 1-8. 2-14. 3-20. 4-12. 5-12. 6-12. 7-10. 8-8'),(66,'Ally McBeal',' 1997-2002',' Comedy. Drama. Fantasy',6.8,' 1-23. 2-23. 3-21. 4-23. 5-22'),(67,'The Strain',' 2014-2017',' Drama. Horror. Thriller',7.4,' 1-13. 2-13. 3-10. 4-10'),(68,'The Man In The High Castle',' 2015- ',' Drama. Sci-fi. Thriller',8.1,' 1-10. 2-10. 3-10'),(69,'Sons Of Anarchy',' 2008-2014',' Crime. Drama. Thriller',8.6,' 1-13. 2-13. 3-13. 4-14. 5-13. 6-13. 7-13'),(70,'The Punisher',' 2017 ',' Action. Adventure. Crime',8.6,' 1-13'),(71,'Boardwalk Empire',' 2010-2014',' Crime. Drama. History',8.6,' 1-12. 2-12. 3-12. 4-12. 5-8'),(72,'Damages',' 2007-2012',' Crime. Drama. Mystery',8.1,' 1-13. 2-13. 3-13. 4-10. 5-10'),(73,'Banshee',' 2013-2016',' Action. Crime. Drama',8.4,' 1-10. 2-10. 3-10. 4-8'),(74,'Planet Earth',' 2006',' Documentary',9.4,' 1-11'),(75,'Freaks And Geeks',' 1999-2000',' Comedy. Drama',8.8,' 1-18'),(76,'The Way We Live Now',' 2001',' Drama. Romance',7.7,' 1-4'),(77,'Justified',' 2010-2015',' Action. Crime. Drama',8.6,' 1-13. 2-13. 3-13. 4-13. 5-13. 6-13'),(78,'Arrested Development',' 2003- ',' Comedy',8.9,' 1-22. 2-18. 3-13. 4-22. 5-16'),(79,'Stranger Things',' 2016- ',' Drama. Fantasy. Horror',8.9,' 1-8. 2-9'),(80,'Night Court',' 1984-1992',' Comedy',7.7,' 1-13. 2-22. 3-22. 4-22. 5-22. 6-22. 7-24. 8-24. 9-22'),(81,'Revenge',' 2011-2015',' Drama. Mystery. Thriller',7.9,' 1-22. 2-22. 3-22. 4-23'),(82,'Da Ali G Show',' 2003-2004',' Comedy. Talk-show',8,' 1-6. 2-6. 3-6'),(83,'Sex & The City',' 1998-2004',' Comedy. Drama. Romance',7.1,' 1-12. 2-18. 3-18. 4-18. 5-8. 6-20'),(84,'Tyrant',' 2014-2016',' Action. Drama. Thriller',7.8,' 1-10. 2-12. 3-10'),(85,'Billions',' 2016- ',' Drama',8.4,' 1-12. 2-12. 3-12'),(86,'Shameless',' 2011- ',' Comedy. Drama',8.7,' 1-12. 2-12. 3-12. 4-12. 5-12. 6-12. 7-12. 8-12. 9-7'),(87,'Smallville',' 2001-2011',' Adventure. Drama. Romance',7.5,' 1-21. 2-23. 3-22. 4-22. 5-22. 6-22. 7-20. 8-22. 9-21. 19-22'),(88,'The Defenders',' 2017 ',' Action. Adventure. Crime',7.5,' 1-8'),(89,'House',' 2004-2012',' Drama. Mystery',8.8,'  1-22. 2-24. 3-24. 4-16. 5-24. 6-21. 7-23. 8-22'),(90,'Fear The Walking Dead',' 2015-',' Drama. Horror. Sci-fi',7,' 1-6. 2-15. 3-16. 4-16'),(91,'True Blood',' 2008-2014',' Drama. Fantasy. Mystery',7.9,' 1-12. 2-12. 3-12. 4-12. 5-12. 6-10. 7-10'),(92,'GLOW',' 2017- ',' Comedy. Drama. Sport',8.2,' 1-10. 2-10'),(93,'Doctor Thorne',' 2016 ',' Drama',7.3,' 1-3'),(94,'The Civil War',' 1990',' Documentary. History. War',9.1,' 1-9'),(95,'Person Of Interest',' 2011-2016',' Action. Crime. Drama',8.4,' 1-23. 2-22. 3-23. 4-22. 5-13'),(96,'Californication',' 2007-2014',' Comedy. Drama',8.3,' 1-12. 2-12. 3-12. 4-12. 5-12. 6-12. 7-12'),(97,'Three\'s Company',' 1976-1984',' Comedy',7.6,' 1-6. 2-25. 3-22. 4-25. 5-22. 6-28. 7-22. 8-22'),(98,'Dexter',' 2006-2013',' Crime. Drama. Mystery',8.7,' 1-12. 2-12. 3-12. 4-12. 5-12. 6-12. 7-12.8-12');
/*!40000 ALTER TABLE `series` ENABLE KEYS */;
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
