CREATE DATABASE  IF NOT EXISTS `ucp-psg` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ucp-psg`;
-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ucp-psg
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `arma`
--

DROP TABLE IF EXISTS `arma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `arma` (
  `idArma` int NOT NULL AUTO_INCREMENT,
  `tipoArma` varchar(45) NOT NULL,
  `nombreArma` varchar(45) NOT NULL,
  PRIMARY KEY (`idArma`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arma`
--

LOCK TABLES `arma` WRITE;
/*!40000 ALTER TABLE `arma` DISABLE KEYS */;
INSERT INTO `arma` VALUES (90,'Utilidad','Porra'),(91,'Utilidad','Linterna'),(92,'Utilidad','Taser'),(93,'Utilidad','Gas'),(94,'Pistola','Combate'),(95,'Pistola','.50'),(96,'Pistola','ApPistol'),(97,'Pistola','Revolver'),(98,'Pistola','MK2'),(99,'Subfusil','SMG'),(100,'Subfusil','SMG de asalto'),(101,'Subfusil','MicroSMG'),(102,'Subfusil','SMG MK2'),(103,'Subfusil','Tec 9'),(104,'Escopeta','Bullpup'),(105,'Escopeta','Escopeta'),(106,'Escopeta','Recortada'),(107,'Rifle','AK-47'),(108,'Rifle','AK-47 MK2'),(109,'Rifle','Carabina'),(110,'Rifle','Carabina MK2'),(111,'Rifle','Carabina especial '),(112,'Rifle','Carabina especial MK2'),(113,'Rifle','Compacto'),(114,'Rifle','Militar'),(115,'Rifle','Bullpup'),(116,'Rifle','Francotirador'),(117,'Escopeta','Asalto'),(118,'Escopeta','Pesada'),(119,'Escopeta','Escopeta MK2');
/*!40000 ALTER TABLE `arma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hora`
--

DROP TABLE IF EXISTS `hora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hora` (
  `idIntegrante` int NOT NULL,
  `fecha` date NOT NULL,
  `horaInicio` time NOT NULL,
  `horaFin` time DEFAULT NULL,
  PRIMARY KEY (`idIntegrante`,`fecha`,`horaInicio`),
  CONSTRAINT `id_Integ` FOREIGN KEY (`idIntegrante`) REFERENCES `integrante` (`idIntegrante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hora`
--

LOCK TABLES `hora` WRITE;
/*!40000 ALTER TABLE `hora` DISABLE KEYS */;
/*!40000 ALTER TABLE `hora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `integrante`
--

DROP TABLE IF EXISTS `integrante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `integrante` (
  `idIntegrante` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `discordId` varchar(45) NOT NULL,
  `steamHex` varchar(45) NOT NULL,
  `usuario` varchar(45) NOT NULL,
  `pw` varchar(45) NOT NULL,
  `idRol` int NOT NULL,
  PRIMARY KEY (`idIntegrante`),
  KEY `id_Rol_idx` (`idRol`),
  CONSTRAINT `id_Rol` FOREIGN KEY (`idRol`) REFERENCES `rol` (`idRol`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `integrante`
--

LOCK TABLES `integrante` WRITE;
/*!40000 ALTER TABLE `integrante` DISABLE KEYS */;
INSERT INTO `integrante` VALUES (1,'Luciano','Ragusa','328247693724090369','steam:123','lragusa','lr123',1),(2,'Camilo','Pereyra','404471332991008768','steam:123','cpereyra','cp123',1),(3,'Juan Ignacio','Pucheta','558091838259724309','steam:123','jipucheta','jip123',1);
/*!40000 ALTER TABLE `integrante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lugarrobo`
--

DROP TABLE IF EXISTS `lugarrobo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lugarrobo` (
  `idLugarRobo` int NOT NULL AUTO_INCREMENT,
  `lugarRobo` varchar(105) NOT NULL,
  `tipoRobo` varchar(45) NOT NULL,
  `maxIntegrantes` int NOT NULL,
  `minIntegrantes` int NOT NULL,
  PRIMARY KEY (`idLugarRobo`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lugarrobo`
--

LOCK TABLES `lugarrobo` WRITE;
/*!40000 ALTER TABLE `lugarrobo` DISABLE KEYS */;
INSERT INTO `lugarrobo` VALUES (1,'Banco Mini-Paleto','High',7,5),(2,'Banco Fleeca','High',7,5),(3,'Rancho','High',8,6),(4,'Fuente Blanca','High',7,5),(5,'Laboratorio Humane','Head',10,8),(6,'Chicken','Head',10,8),(7,'Cerveceria Sandy','Low',4,2),(8,'Yallow Jack','Low',4,2),(9,'Tienda','Low',4,2),(10,'Tienda','Low',4,2),(11,'Tienda','Low',4,2),(12,'Tienda','Low',4,2),(13,'Tienda','Low',4,2);
/*!40000 ALTER TABLE `lugarrobo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `med_integrante`
--

DROP TABLE IF EXISTS `med_integrante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `med_integrante` (
  `idIntegrante` int NOT NULL,
  `idMedalla` int NOT NULL,
  `fecha_recompensa` date NOT NULL,
  `recompensa` varchar(45) NOT NULL,
  PRIMARY KEY (`idIntegrante`,`idMedalla`,`fecha_recompensa`),
  KEY `id_M_idx` (`idMedalla`),
  CONSTRAINT `id_In` FOREIGN KEY (`idIntegrante`) REFERENCES `integrante` (`idIntegrante`),
  CONSTRAINT `id_M` FOREIGN KEY (`idMedalla`) REFERENCES `medalla` (`idMedalla`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `med_integrante`
--

LOCK TABLES `med_integrante` WRITE;
/*!40000 ALTER TABLE `med_integrante` DISABLE KEYS */;
/*!40000 ALTER TABLE `med_integrante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medalla`
--

DROP TABLE IF EXISTS `medalla`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medalla` (
  `idMedalla` int NOT NULL,
  `nomMedalla` varchar(45) NOT NULL,
  `tipoMedalla` varchar(45) NOT NULL,
  PRIMARY KEY (`idMedalla`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medalla`
--

LOCK TABLES `medalla` WRITE;
/*!40000 ALTER TABLE `medalla` DISABLE KEYS */;
/*!40000 ALTER TABLE `medalla` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ran_integrante`
--

DROP TABLE IF EXISTS `ran_integrante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ran_integrante` (
  `idIntegrante` int NOT NULL,
  `idRango` int NOT NULL,
  `fechaDesde` date NOT NULL,
  PRIMARY KEY (`fechaDesde`,`idIntegrante`,`idRango`),
  KEY `id_Integrante_idx` (`idIntegrante`),
  KEY `id_Ran_idx` (`idRango`),
  CONSTRAINT `id_Inte` FOREIGN KEY (`idIntegrante`) REFERENCES `integrante` (`idIntegrante`),
  CONSTRAINT `id_Ran` FOREIGN KEY (`idRango`) REFERENCES `rango` (`idRango`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ran_integrante`
--

LOCK TABLES `ran_integrante` WRITE;
/*!40000 ALTER TABLE `ran_integrante` DISABLE KEYS */;
INSERT INTO `ran_integrante` VALUES (1,14,'2021-10-12'),(2,14,'2021-10-12'),(3,14,'2021-10-12');
/*!40000 ALTER TABLE `ran_integrante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ran_subdivision`
--

DROP TABLE IF EXISTS `ran_subdivision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ran_subdivision` (
  `idRanSub` int NOT NULL AUTO_INCREMENT,
  `idSub` int NOT NULL,
  `nombreRangoSub` varchar(45) NOT NULL,
  PRIMARY KEY (`idRanSub`,`idSub`),
  KEY `id_s_idx` (`idSub`),
  CONSTRAINT `id_s` FOREIGN KEY (`idSub`) REFERENCES `subdivision` (`idSub`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ran_subdivision`
--

LOCK TABLES `ran_subdivision` WRITE;
/*!40000 ALTER TABLE `ran_subdivision` DISABLE KEYS */;
INSERT INTO `ran_subdivision` VALUES (1,1,'Cadete'),(2,1,'Recluta'),(3,1,'Sargento'),(4,1,'Infante Supreme'),(5,1,'Supervisor'),(6,1,'Encargado de Infante'),(7,2,'Recluta'),(8,2,'Guardia'),(9,2,'Teniente'),(10,2,'Sub-Capitan'),(11,2,'Capitan de la Brigada'),(12,2,'Encargado de URA'),(13,3,'Piloto Novato'),(14,3,'Piloto Avanzado'),(15,3,'Piloto Experto'),(16,3,'Piloto Instructor'),(17,3,'Encargado de Aerea');
/*!40000 ALTER TABLE `ran_subdivision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rango`
--

DROP TABLE IF EXISTS `rango`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rango` (
  `idRango` int NOT NULL AUTO_INCREMENT,
  `nombRango` varchar(45) NOT NULL,
  PRIMARY KEY (`idRango`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rango`
--

LOCK TABLES `rango` WRITE;
/*!40000 ALTER TABLE `rango` DISABLE KEYS */;
INSERT INTO `rango` VALUES (1,'Aspirante'),(2,'Aprendiz'),(3,'Empleado'),(4,'Experimentado'),(5,'Agente'),(6,'Supervisor'),(7,'Auxiliar del Cuerpo'),(8,'Seguridad del Cuerpo'),(9,'Sub-Encargado del Cuerpo'),(10,'Encargado del Cuerpo'),(11,'Maestro del Cuerpo'),(12,'Instructor del Cuerpo'),(13,'Especialista del Cuerpo'),(14,'Sub-Jefe del Cuerpo'),(15,'Jefe del Cuerpo'),(16,'Gerente'),(17,'Interventor');
/*!40000 ALTER TABLE `rango` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ransub_integrante`
--

DROP TABLE IF EXISTS `ransub_integrante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ransub_integrante` (
  `idIntegrante` int NOT NULL,
  `idRanSub` int NOT NULL,
  `fechaDesde` date NOT NULL,
  `idSub` int NOT NULL,
  PRIMARY KEY (`idIntegrante`,`idRanSub`,`fechaDesde`),
  KEY `id_Su_idx` (`idSub`),
  KEY `id_rs_idx` (`idRanSub`),
  CONSTRAINT `id_integr` FOREIGN KEY (`idIntegrante`) REFERENCES `integrante` (`idIntegrante`),
  CONSTRAINT `id_rs` FOREIGN KEY (`idRanSub`) REFERENCES `ran_subdivision` (`idRanSub`),
  CONSTRAINT `id_Su` FOREIGN KEY (`idSub`) REFERENCES `ran_subdivision` (`idSub`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ransub_integrante`
--

LOCK TABLES `ransub_integrante` WRITE;
/*!40000 ALTER TABLE `ransub_integrante` DISABLE KEYS */;
INSERT INTO `ransub_integrante` VALUES (1,1,'2021-10-12',1),(2,2,'2021-10-12',2),(3,3,'2021-10-12',3);
/*!40000 ALTER TABLE `ransub_integrante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `robo`
--

DROP TABLE IF EXISTS `robo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `robo` (
  `nroRobo` int NOT NULL,
  `idIntegrante` int NOT NULL,
  `resultado` varchar(45) NOT NULL,
  `hora_robo` time NOT NULL,
  `fecha_robo` date NOT NULL,
  `idLugarRobo` int NOT NULL,
  PRIMARY KEY (`nroRobo`,`idIntegrante`),
  KEY `id_i_idx` (`idIntegrante`),
  KEY `id_lr_idx` (`idLugarRobo`),
  CONSTRAINT `id_i` FOREIGN KEY (`idIntegrante`) REFERENCES `integrante` (`idIntegrante`),
  CONSTRAINT `id_lr` FOREIGN KEY (`idLugarRobo`) REFERENCES `lugarrobo` (`idLugarRobo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `robo`
--

LOCK TABLES `robo` WRITE;
/*!40000 ALTER TABLE `robo` DISABLE KEYS */;
/*!40000 ALTER TABLE `robo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `idRol` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`idRol`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'Admin'),(2,'User');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sancion`
--

DROP TABLE IF EXISTS `sancion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sancion` (
  `tipoSansion` varchar(45) NOT NULL,
  `motivo` varchar(45) NOT NULL,
  `idIntegrante` int NOT NULL,
  PRIMARY KEY (`motivo`,`idIntegrante`),
  KEY `id_Integrante_idx` (`idIntegrante`),
  CONSTRAINT `id_Integrante` FOREIGN KEY (`idIntegrante`) REFERENCES `integrante` (`idIntegrante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sancion`
--

LOCK TABLES `sancion` WRITE;
/*!40000 ALTER TABLE `sancion` DISABLE KEYS */;
/*!40000 ALTER TABLE `sancion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stockarma`
--

DROP TABLE IF EXISTS `stockarma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stockarma` (
  `idArma` int NOT NULL,
  `fecha` date NOT NULL,
  `cantidad` int NOT NULL,
  PRIMARY KEY (`idArma`,`fecha`),
  CONSTRAINT `id_Arma` FOREIGN KEY (`idArma`) REFERENCES `arma` (`idArma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stockarma`
--

LOCK TABLES `stockarma` WRITE;
/*!40000 ALTER TABLE `stockarma` DISABLE KEYS */;
/*!40000 ALTER TABLE `stockarma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subdivision`
--

DROP TABLE IF EXISTS `subdivision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subdivision` (
  `idSub` int NOT NULL AUTO_INCREMENT,
  `nomSubdivision` varchar(45) NOT NULL,
  `descripción` varchar(45) NOT NULL,
  PRIMARY KEY (`idSub`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subdivision`
--

LOCK TABLES `subdivision` WRITE;
/*!40000 ALTER TABLE `subdivision` DISABLE KEYS */;
INSERT INTO `subdivision` VALUES (1,'Infanteria','Unidad de Infanteria'),(2,'Rapida Accion','Unidad de Rapida Accion'),(3,'Aerea','Unidad Aerea'),(4,'Brigada','Brigada Delta');
/*!40000 ALTER TABLE `subdivision` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-12 19:17:22
