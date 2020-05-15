-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: localhost    Database: basejsp
-- ------------------------------------------------------
-- Server version	5.6.26-log

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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ident` varchar(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'12345678901','Unasam'),(2,'74125896301','Comercial Trujillo'),(3,'78878710','Paucar Frank'),(4,'74125874','Castillo Sandra'),(5,'78456531','Martin Viscarra');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comprobante`
--

DROP TABLE IF EXISTS `comprobante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comprobante` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(45) NOT NULL,
  `modalidad` varchar(45) NOT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `idusuario` int(11) DEFAULT NULL,
  `idcliente` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comprobante`
--

LOCK TABLES `comprobante` WRITE;
/*!40000 ALTER TABLE `comprobante` DISABLE KEYS */;
INSERT INTO `comprobante` VALUES (1,'Factura','Credito','2020-05-15','12:48:29',1,1),(2,'Factura','Credito','2020-05-15','12:57:13',1,2),(3,'Factura','Credito','2020-05-15','12:58:34',1,3),(4,'Factura','Credito','2020-05-15','12:59:17',1,4),(5,'Factura','Credito','2020-05-15','13:00:22',1,5),(6,'Factura','Credito','2020-05-15','13:02:11',1,1),(7,'Factura','Credito','2020-05-15','13:02:56',1,2),(8,'Factura','Credito','2020-05-15','13:03:25',1,3),(9,'Factura','Credito','2020-05-15','13:04:59',1,4),(10,'Guia de Remision','Credito','2020-05-15','13:21:03',1,5),(11,'Boleta','Credito','2020-05-15','13:25:17',1,1),(12,'Boleta','Credito','2020-05-15','13:26:54',1,2);
/*!40000 ALTER TABLE `comprobante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comprobanteprv`
--

DROP TABLE IF EXISTS `comprobanteprv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comprobanteprv` (
  `idComprobantePrv` int(11) NOT NULL AUTO_INCREMENT,
  `numcompr` varchar(15) NOT NULL,
  `fecemi` date NOT NULL,
  `tipdoc` varchar(15) NOT NULL,
  `est` varchar(15) NOT NULL,
  `idproveedor` int(11) NOT NULL,
  PRIMARY KEY (`idComprobantePrv`),
  KEY `idproveedor` (`idproveedor`),
  CONSTRAINT `comprobanteprv_ibfk_1` FOREIGN KEY (`idproveedor`) REFERENCES `proveedor` (`idproveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comprobanteprv`
--

LOCK TABLES `comprobanteprv` WRITE;
/*!40000 ALTER TABLE `comprobanteprv` DISABLE KEYS */;
/*!40000 ALTER TABLE `comprobanteprv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detallecomproprove`
--

DROP TABLE IF EXISTS `detallecomproprove`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detallecomproprove` (
  `idDetalleComproProve` int(11) NOT NULL AUTO_INCREMENT,
  `cant` int(11) NOT NULL,
  `cst` decimal(9,2) NOT NULL,
  `idproducto` int(11) NOT NULL,
  `idComprobantePrv` int(11) NOT NULL,
  PRIMARY KEY (`idDetalleComproProve`),
  KEY `idproducto` (`idproducto`),
  KEY `idComprobantePrv` (`idComprobantePrv`),
  CONSTRAINT `detallecomproprove_ibfk_1` FOREIGN KEY (`idproducto`) REFERENCES `producto` (`idproducto`),
  CONSTRAINT `detallecomproprove_ibfk_2` FOREIGN KEY (`idComprobantePrv`) REFERENCES `comprobanteprv` (`idComprobantePrv`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detallecomproprove`
--

LOCK TABLES `detallecomproprove` WRITE;
/*!40000 ALTER TABLE `detallecomproprove` DISABLE KEYS */;
/*!40000 ALTER TABLE `detallecomproprove` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalleventa`
--

DROP TABLE IF EXISTS `detalleventa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalleventa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cant` int(11) DEFAULT '1',
  `precio` decimal(9,2) DEFAULT '1.00',
  `idproducto` int(11) NOT NULL,
  `idcomprobante` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalleventa`
--

LOCK TABLES `detalleventa` WRITE;
/*!40000 ALTER TABLE `detalleventa` DISABLE KEYS */;
INSERT INTO `detalleventa` VALUES (1,1,3.00,1,0),(2,5,2.00,2,0),(3,6,2.00,3,0),(4,6,4.00,4,0),(5,12,2.00,5,0),(6,5,7.00,6,0),(7,5,7.00,7,0),(8,8,7.00,8,0),(9,4,4.00,9,0),(10,5,6.00,10,0),(11,1,4.00,1,9),(12,12,4.00,2,9),(13,5,7.00,3,10),(14,9,7.00,4,10),(15,9,7.00,5,11),(16,6,3.00,6,11),(17,3,9.00,7,11),(18,3,9.00,8,12),(19,9,7.00,9,12),(20,6,3.00,10,12);
/*!40000 ALTER TABLE `detalleventa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marca`
--

DROP TABLE IF EXISTS `marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marca` (
  `idmarca` int(11) NOT NULL AUTO_INCREMENT,
  `nommrc` varchar(60) NOT NULL,
  PRIMARY KEY (`idmarca`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marca`
--

LOCK TABLES `marca` WRITE;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` VALUES (1,'LG'),(4,'Dell'),(6,'Sansumgss'),(7,'Epson'),(8,'Logitech'),(9,'Apple'),(10,'Toshiba'),(11,'Accer'),(12,'HP'),(14,'View Sonic'),(15,'Asus'),(17,'Sonny'),(18,'Marca php'),(19,'Tomato'),(22,'ddjdfk'),(23,'Marca nueva'),(24,'Nueva Epson1'),(25,'una marca ahora');
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producto` (
  `idproducto` int(11) NOT NULL AUTO_INCREMENT,
  `nomprod` varchar(100) NOT NULL,
  `idmarca` int(11) NOT NULL,
  `idtipoproducto` int(11) NOT NULL,
  `prec` decimal(9,2) NOT NULL,
  `stkmin` int(10) unsigned NOT NULL,
  `stkmax` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idproducto`) USING BTREE,
  KEY `idmarca` (`idmarca`),
  KEY `idtipoproducto` (`idtipoproducto`),
  CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`idmarca`) REFERENCES `marca` (`idmarca`),
  CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`idtipoproducto`) REFERENCES `tipoproducto` (`idtipoproducto`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'Lcd con 24\'',6,6,750.55,1,5),(2,'dc ewwekj',14,1,580.60,1,3),(3,'Con Grabador 44X65',1,2,25.60,3,10),(4,'i7 8va Generacion 2.56 ghz, 20 GB de Ram, 3TB Disco',10,8,5800.96,1,2),(5,'2.8 Ghz I7 9va Generación',9,5,890.33,1,2),(6,'2.45 Ghz I9 8va Generacion 8 nucleos.',9,5,800.00,1,2),(7,'con combo',9,2,212.00,1,3),(8,'Arabitos uno',6,1,580.96,34,55),(9,'dedsoids kjj',4,1,34.00,6,6),(10,'Lcd 27\' con 24micrs',17,6,652.36,1,3);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proveedor` (
  `idproveedor` int(11) NOT NULL AUTO_INCREMENT,
  `nomprv` varchar(60) NOT NULL,
  `rucprv` varchar(11) NOT NULL,
  `dirprv` varchar(60) NOT NULL,
  `tlfprv` varchar(11) NOT NULL,
  PRIMARY KEY (`idproveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'Representaciones Computer','20114569358','Lima Peru','215556111'),(2,'Grupor tecnologies Sac','20587451455','Chiclayo Peru','514851693');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoproducto`
--

DROP TABLE IF EXISTS `tipoproducto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipoproducto` (
  `idtipoproducto` int(11) NOT NULL AUTO_INCREMENT,
  `tippro` varchar(50) NOT NULL,
  PRIMARY KEY (`idtipoproducto`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoproducto`
--

LOCK TABLES `tipoproducto` WRITE;
/*!40000 ALTER TABLE `tipoproducto` DISABLE KEYS */;
INSERT INTO `tipoproducto` VALUES (1,'Impresora Matricial 3000'),(2,'Lectora de cd'),(3,'Teclados Multimedia'),(4,'Teclado'),(5,'Microprocesador'),(6,'Monitor'),(7,'Placa madre'),(8,'Laptop'),(9,'Tableta');
/*!40000 ALTER TABLE `tipoproducto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `usr` varchar(20) NOT NULL,
  `psw` varchar(100) NOT NULL,
  PRIMARY KEY (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Miguel','202cb962ac59075b964b07152d234b70'),(2,'Silva','289dff07669d7a23de0ef88d2f7129e7'),(3,'paucar','7570282124413a71358aec61f3a23ead');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'basejsp'
--
/*!50003 DROP FUNCTION IF EXISTS `FncAcceso` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `FncAcceso`(us varchar(20),pw varchar(50)) RETURNS varchar(2) CHARSET latin1
begin
  return (select (if((select count(*) from usuario where md5(usr)=md5(us) and psw=md5(pw))=1,'1','0')));
 end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-15 13:51:06
