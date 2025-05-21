-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: aviaodb
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `aeronaves`
--

DROP TABLE IF EXISTS `aeronaves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aeronaves` (
  `id_aeronave` int NOT NULL AUTO_INCREMENT,
  `modelo` varchar(255) DEFAULT NULL,
  `companhia_aerea` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_aeronave`)
) ENGINE=InnoDB AUTO_INCREMENT=210509 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aeronaves`
--

LOCK TABLES `aeronaves` WRITE;
/*!40000 ALTER TABLE `aeronaves` DISABLE KEYS */;
INSERT INTO `aeronaves` VALUES (1705,'Airbus','Azul'),(1911,'ATR-72','Latam'),(4020,'Boeing','Gol'),(5050,'Embraer','Avianca');
/*!40000 ALTER TABLE `aeronaves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamentos`
--

DROP TABLE IF EXISTS `departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamentos` (
  `id_departamento` int NOT NULL AUTO_INCREMENT,
  `nome_departamento` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_departamento`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamentos`
--

LOCK TABLES `departamentos` WRITE;
/*!40000 ALTER TABLE `departamentos` DISABLE KEYS */;
INSERT INTO `departamentos` VALUES (1,'Controle Espaço Aéreo'),(2,'Área de Manobra'),(3,'Torre de Controle');
/*!40000 ALTER TABLE `departamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `problemas_voo`
--

DROP TABLE IF EXISTS `problemas_voo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `problemas_voo` (
  `id_problema` int NOT NULL AUTO_INCREMENT,
  `nome_problema` varchar(50) DEFAULT NULL,
  `descricao_problema` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_problema`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `problemas_voo`
--

LOCK TABLES `problemas_voo` WRITE;
/*!40000 ALTER TABLE `problemas_voo` DISABLE KEYS */;
INSERT INTO `problemas_voo` VALUES (1,'Estol','Avião perdeu a sustentação porque entrou em um ângulo de ataque maior do que\nsua sustentação'),(2,'Over Speed','Falha no turbocompressor por excesso de rotação; falha no sistema de ar pressurizado, velocidade inadequada'),(3,'Windshear','Variação rápida na velocidade ou direção do vento.'),(4,'Engine Fire','Fogo no motor'),(5,'Traffic','Avião próximo de colidir'),(6,'Pull up','Taxa de descida excessiva'),(7,'Bank Angle','Ângulo de inclinação das asas ocasionando curvas excessivas'),(8,'Too Low ','Avião muito próximo do solo');
/*!40000 ALTER TABLE `problemas_voo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registro_problemas_voo`
--

DROP TABLE IF EXISTS `registro_problemas_voo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registro_problemas_voo` (
  `id_registro` int NOT NULL AUTO_INCREMENT,
  `id_voo` int DEFAULT NULL,
  `id_problema` int DEFAULT NULL,
  `id_solucao` int DEFAULT NULL,
  PRIMARY KEY (`id_registro`),
  KEY `id_voo` (`id_voo`),
  KEY `id_problema` (`id_problema`),
  KEY `id_solucao` (`id_solucao`),
  CONSTRAINT `registro_problemas_voo_ibfk_1` FOREIGN KEY (`id_voo`) REFERENCES `tabela_voo` (`id_voo`),
  CONSTRAINT `registro_problemas_voo_ibfk_2` FOREIGN KEY (`id_problema`) REFERENCES `problemas_voo` (`id_problema`),
  CONSTRAINT `registro_problemas_voo_ibfk_3` FOREIGN KEY (`id_solucao`) REFERENCES `solucoes_problemas` (`id_solucao`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registro_problemas_voo`
--

LOCK TABLES `registro_problemas_voo` WRITE;
/*!40000 ALTER TABLE `registro_problemas_voo` DISABLE KEYS */;
INSERT INTO `registro_problemas_voo` VALUES (1,3,5,5),(2,1,4,4),(3,4,2,2),(4,4,2,2),(5,2,3,3),(6,1,5,5),(7,3,6,6),(8,2,7,7);
/*!40000 ALTER TABLE `registro_problemas_voo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solucoes_problemas`
--

DROP TABLE IF EXISTS `solucoes_problemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solucoes_problemas` (
  `id_solucao` int NOT NULL AUTO_INCREMENT,
  `id_problema` int DEFAULT NULL,
  `descricao_solucao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_solucao`),
  KEY `id_problema` (`id_problema`),
  CONSTRAINT `solucoes_problemas_ibfk_1` FOREIGN KEY (`id_problema`) REFERENCES `problemas_voo` (`id_problema`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solucoes_problemas`
--

LOCK TABLES `solucoes_problemas` WRITE;
/*!40000 ALTER TABLE `solucoes_problemas` DISABLE KEYS */;
INSERT INTO `solucoes_problemas` VALUES (1,1,'Coloque o nariz do avião para baixo'),(2,2,'Reduza a velocidade'),(3,3,'Aumentar potência, desconectar piloto automático e minimizar mudanças de configuração'),(4,4,'Posicione o interruptor para disch 1 ou disch 2 e segure a chave por 1 segundo disparando o squib no extintor de incêndio'),(5,5,'Decisão em conjunto do piloto e controle de tráfego'),(6,6,'Puxar o manche para cima para evitar a colisão'),(7,7,'Faça curvas mais leves e volte a posição'),(8,8,'Arremeta a aeronave');
/*!40000 ALTER TABLE `solucoes_problemas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tabela_voo`
--

DROP TABLE IF EXISTS `tabela_voo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabela_voo` (
  `id_voo` int NOT NULL AUTO_INCREMENT,
  `companhia_aerea` varchar(255) DEFAULT NULL,
  `aeroporto_origem` varchar(255) DEFAULT NULL,
  `aeroporto_destino` varchar(255) DEFAULT NULL,
  `id_aeronave` int DEFAULT NULL,
  `localizacao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_voo`),
  KEY `id_aeronave` (`id_aeronave`),
  CONSTRAINT `tabela_voo_ibfk_1` FOREIGN KEY (`id_aeronave`) REFERENCES `aeronaves` (`id_aeronave`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tabela_voo`
--

LOCK TABLES `tabela_voo` WRITE;
/*!40000 ALTER TABLE `tabela_voo` DISABLE KEYS */;
INSERT INTO `tabela_voo` VALUES (1,'Azul','Galeão','Salgado Filho',1705,'RJ'),(2,'Latam','Guarulhos','Navegantes',1911,'SP'),(3,'Gol','Salgado Filho','Galeão',4020,'RS'),(4,'Avianca','Navegantes','Guarulhos',5050,'SC');
/*!40000 ALTER TABLE `tabela_voo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-31 14:28:58