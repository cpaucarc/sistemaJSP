-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.6.20


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema basejsp
--

-- CREATE DATABASE IF NOT EXISTS basejsp;
-- USE basejsp;

--
-- Definition of table `comprobanteprv`
--

DROP TABLE IF EXISTS `comprobanteprv`;
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

--
-- Dumping data for table `comprobanteprv`
--

/*!40000 ALTER TABLE `comprobanteprv` DISABLE KEYS */;
/*!40000 ALTER TABLE `comprobanteprv` ENABLE KEYS */;


--
-- Definition of table `detallecomproprove`
--

DROP TABLE IF EXISTS `detallecomproprove`;
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

--
-- Dumping data for table `detallecomproprove`
--

/*!40000 ALTER TABLE `detallecomproprove` DISABLE KEYS */;
/*!40000 ALTER TABLE `detallecomproprove` ENABLE KEYS */;


--
-- Definition of table `marca`
--

DROP TABLE IF EXISTS `marca`;
CREATE TABLE `marca` (
  `idmarca` int(11) NOT NULL AUTO_INCREMENT,
  `nommrc` varchar(60) NOT NULL,
  PRIMARY KEY (`idmarca`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `marca`
--

/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` (`idmarca`,`nommrc`) VALUES 
 (1,'LGs'),
 (3,'Panasonic'),
 (4,'Dell'),
 (5,'Lenovo'),
 (6,'Sansumg'),
 (7,'Epson'),
 (8,'Logitech'),
 (9,'Apple'),
 (10,'Toshiba'),
 (11,'Accer'),
 (12,'HP'),
 (13,'Compaq'),
 (14,'View Sonic'),
 (15,'Asus'),
 (17,'Sonny');
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;


--
-- Definition of table `producto`
--

DROP TABLE IF EXISTS `producto`;
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `producto`
--

/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` (`idproducto`,`nomprod`,`idmarca`,`idtipoproducto`,`prec`,`stkmin`,`stkmax`) VALUES 
 (1,'Lcd con 24\'',6,6,'750.55',1,5),
 (2,'dc ewwekj',14,1,'580.60',1,3),
 (3,'Con Grabador 44X65',1,2,'25.60',3,10),
 (4,'i7 8va Generacion 2.56 ghz, 20 GB de Ram, 3TB Disco',10,8,'5800.96',1,2),
 (5,'2.8 Ghz I7 9va Generación',9,5,'890.33',1,2),
 (6,'2.45 Ghz I9 8va Generacion 8 nucleos.',9,5,'800.00',1,2),
 (7,'con combo',9,2,'212.00',1,3),
 (8,'Arabitos uno',9,1,'580.96',34,55),
 (9,'dedsoids kjj',15,1,'34.00',6,6),
 (10,'Lcd 27\' con 24micrs',17,6,'652.36',1,3);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;


--
-- Definition of table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
CREATE TABLE `proveedor` (
  `idproveedor` int(11) NOT NULL AUTO_INCREMENT,
  `nomprv` varchar(60) NOT NULL,
  `rucprv` varchar(11) NOT NULL,
  `dirprv` varchar(60) NOT NULL,
  `tlfprv` varchar(11) NOT NULL,
  PRIMARY KEY (`idproveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `proveedor`
--

/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` (`idproveedor`,`nomprv`,`rucprv`,`dirprv`,`tlfprv`) VALUES 
 (1,'Representaciones Computer','20114569358','Lima Peru','215556111'),
 (2,'Grupor tecnologies Sac','20587451455','Chiclayo Peru','514851693');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;


--
-- Definition of table `tipoproducto`
--

DROP TABLE IF EXISTS `tipoproducto`;
CREATE TABLE `tipoproducto` (
  `idtipoproducto` int(11) NOT NULL AUTO_INCREMENT,
  `tippro` varchar(50) NOT NULL,
  PRIMARY KEY (`idtipoproducto`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tipoproducto`
--

/*!40000 ALTER TABLE `tipoproducto` DISABLE KEYS */;
INSERT INTO `tipoproducto` (`idtipoproducto`,`tippro`) VALUES 
 (1,'Impresora matricial'),
 (2,'Lectora de cd'),
 (3,'Teclados Multimedia'),
 (4,'Teclado'),
 (5,'Microprocesador'),
 (6,'Monitor'),
 (7,'Placa madre'),
 (8,'Laptop'),
 (9,'Tableta');
/*!40000 ALTER TABLE `tipoproducto` ENABLE KEYS */;


--
-- Definition of table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `usr` varchar(20) NOT NULL,
  `psw` varchar(100) NOT NULL,
  PRIMARY KEY (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usuario`
--

/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`idusuario`,`usr`,`psw`) VALUES 
 (1,'Miguel','123'),
 (2,'Silva','234');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
