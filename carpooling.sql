-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 13-05-2019 a las 03:25:58
-- Versión del servidor: 5.7.24
-- Versión de PHP: 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `carpooling`
--

DELIMITER $$
--
-- Funciones
--
DROP FUNCTION IF EXISTS `CheckPassword`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `CheckPassword` (`username` BIGINT(50), `password_p` VARCHAR(30)) RETURNS TINYINT(1) READS SQL DATA
BEGIN
    RETURN EXISTS (SELECT * FROM `usuario` WHERE Codigo = username AND Contraseña = password_p);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rutas`
--

DROP TABLE IF EXISTS `rutas`;
CREATE TABLE IF NOT EXISTS `rutas` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `Celular` bigint(50) NOT NULL,
  `Origen` varchar(30) NOT NULL,
  `Destino` varchar(30) NOT NULL,
  `Cupo` int(1) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Codigo` (`Celular`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `rutas`
--

INSERT INTO `rutas` (`Id`, `Celular`, `Origen`, `Destino`, `Cupo`) VALUES
(5, 30000001245, 'USB', 'santa fe', 1),
(4, 30000045789, 'cc santafe', 'USB', 2),
(7, 3182623371, 'Carrera 1a este #312 sur', 'USB', 2),
(8, 3182623371, 'carrera 1 a este', 'USB', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `Codigo` bigint(50) NOT NULL,
  `Celular` bigint(50) NOT NULL,
  `Nombre` varchar(30) NOT NULL,
  `Apellido` varchar(30) NOT NULL,
  `Cargo` varchar(30) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `Discapacidad` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`Codigo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`Codigo`, `Celular`, `Nombre`, `Apellido`, `Cargo`, `Password`, `Discapacidad`) VALUES
(30000040780, 3112124070, 'Juian', 'Castellanos', 'Estudiante', 'JULIAN123', '0'),
(30000040789, 3112124074, 'Pedro', 'Navajas', 'hth', '1234', '2'),
(30000030138, 3132746228, 'Leo', 'Riaño', 'Student', '0000', '0'),
(10000045789, 3107924587, 'Tatiana', 'Saenz', 'admin', 'f57d4e027a08f40b9bb69689acdac880cf912d3c', '0'),
(30000040770, 318384039, 'Arturo', 'Moreno', 'Estudiante', 'ca8032a4ce311bf7f776f1e97ae3bb06bf3fc461', '0'),
(30000022708, 31826223371, 'Andres', 'Castellanos', 'Estudiante', 'andres123', 'Niguna');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
