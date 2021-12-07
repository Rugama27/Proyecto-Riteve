-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-12-2021 a las 19:02:05
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dbriteve`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas`
--

CREATE TABLE `citas` (
  `IdCitas` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `Hora` varchar(10) NOT NULL,
  `DatosVehiculo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `citas`
--

INSERT INTO `citas` (`IdCitas`, `Fecha`, `Hora`, `DatosVehiculo`) VALUES
(39, '2021-12-07', '17:00 P.M', 'ABC-123'),
(40, '2021-12-07', '10:00 A.M', 'CCC-001'),
(41, '2021-12-07', '13:00 P.M', 'BRM-085'),
(42, '2021-12-07', '13:00 P.M', 'RTV-012'),
(43, '2021-12-07', '15:00 P.M', 'XZY-321'),
(44, '2021-12-08', '16:00 P.M', 'AFD-892');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `revisiones`
--

CREATE TABLE `revisiones` (
  `IdRevision` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `Hora` varchar(20) NOT NULL,
  `Tecnico` int(9) NOT NULL,
  `TipoRevision` varchar(20) NOT NULL,
  `Observaciones` varchar(300) NOT NULL,
  `Estado` varchar(15) NOT NULL,
  `Cita` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `revisiones`
--

INSERT INTO `revisiones` (`IdRevision`, `Fecha`, `Hora`, `Tecnico`, `TipoRevision`, `Observaciones`, `Estado`, `Cita`) VALUES
(13, '2021-12-07', '10:00 A.M', 503013293, 'Inspección', 'El vehículo no se presentó a la revisión.', 'Reprobado', 40),
(14, '2021-12-07', '13:00 P.M', 503939499, 'Inspección', 'Llantas en mal estado', 'Reprobado', 41);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tecnicos`
--

CREATE TABLE `tecnicos` (
  `Cedula` int(9) NOT NULL,
  `NombreCompleto` varchar(100) NOT NULL,
  `FechaNacimiento` date NOT NULL,
  `Telefono` int(8) NOT NULL,
  `CorreoElectronico` varchar(100) NOT NULL,
  `Salario` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tecnicos`
--

INSERT INTO `tecnicos` (`Cedula`, `NombreCompleto`, `FechaNacimiento`, `Telefono`, `CorreoElectronico`, `Salario`) VALUES
(503013293, 'Luis', '2001-03-02', 87327372, 'Luis@gmail.com', 1000000),
(503939499, 'Erick', '2001-02-03', 86748394, 'Erick@gmail.com', 1300000),
(504943935, 'Fabian', '2000-02-02', 87473743, 'Fabian@gmial.com', 350000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `Cedula` int(9) NOT NULL,
  `NombreCompleto` varchar(100) NOT NULL,
  `FechaNacimiento` date NOT NULL,
  `Telefono` int(8) NOT NULL,
  `CorreoElectronico` varchar(100) NOT NULL,
  `NombreUsuario` varchar(50) NOT NULL,
  `Contraseña` varchar(15) NOT NULL,
  `TipoUsuario` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`Cedula`, `NombreCompleto`, `FechaNacimiento`, `Telefono`, `CorreoElectronico`, `NombreUsuario`, `Contraseña`, `TipoUsuario`) VALUES
(503498374, 'Luis Rugama', '2001-04-03', 84958390, 'Luis@gmail.com', 'Luis', 'LR123', 'Tecnico'),
(504360355, 'Fabian Alvarado', '2000-05-15', 84948373, 'Fabian@gmail.com', 'Fabian', 'FA123', 'Tecnico'),
(504938284, 'Erick Zuñiga', '2001-04-05', 84392493, 'Erick@gmail.com', 'Erick', 'EZ123', 'Tecnico');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculos`
--

CREATE TABLE `vehiculos` (
  `Placa` varchar(50) NOT NULL,
  `Marca` varchar(30) NOT NULL,
  `Modelo` varchar(20) NOT NULL,
  `Año` int(4) NOT NULL,
  `FechaInscripcion` date NOT NULL,
  `CedulaPropietario` int(9) NOT NULL,
  `Propietario` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `vehiculos`
--

INSERT INTO `vehiculos` (`Placa`, `Marca`, `Modelo`, `Año`, `FechaInscripcion`, `CedulaPropietario`, `Propietario`) VALUES
('ABC-123', 'Honda', 'Civic', 1998, '1999-02-04', 504049394, 'Jorge'),
('AFD-892', 'Hyundai', 'Santa Fe', 2018, '2019-02-09', 573737383, 'Lucas'),
('AJD-023', 'Honda', 'Civic', 1998, '1999-02-04', 504049394, 'Jorge'),
('BRM-085', 'Hyundai', 'Tucson', 2018, '2019-03-04', 503039039, 'Jose'),
('CCC-001', 'Audi', 'R8', 2021, '2021-02-03', 503093939, 'Alejandro'),
('fgb-123', 'Honda', 'Civic', 1998, '1999-02-04', 504049394, 'Jorge'),
('RTV-012', 'Ford', 'Mustang ', 2019, '2020-02-03', 203939399, 'Mauricio'),
('XZY-321', 'Toyota', 'RAV4', 2005, '2006-03-04', 592293838, 'Pablo');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`IdCitas`),
  ADD KEY `DatosVehiculo` (`DatosVehiculo`);

--
-- Indices de la tabla `revisiones`
--
ALTER TABLE `revisiones`
  ADD PRIMARY KEY (`IdRevision`),
  ADD UNIQUE KEY `Cita` (`Cita`),
  ADD KEY `Tecnico` (`Tecnico`);

--
-- Indices de la tabla `tecnicos`
--
ALTER TABLE `tecnicos`
  ADD PRIMARY KEY (`Cedula`),
  ADD UNIQUE KEY `CorreoElectronico` (`CorreoElectronico`),
  ADD UNIQUE KEY `Telefono` (`Telefono`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`Cedula`),
  ADD UNIQUE KEY `CorreoElectronico` (`CorreoElectronico`),
  ADD UNIQUE KEY `NombreUsuario` (`NombreUsuario`),
  ADD UNIQUE KEY `Telefono` (`Telefono`);

--
-- Indices de la tabla `vehiculos`
--
ALTER TABLE `vehiculos`
  ADD PRIMARY KEY (`Placa`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `citas`
--
ALTER TABLE `citas`
  MODIFY `IdCitas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT de la tabla `revisiones`
--
ALTER TABLE `revisiones`
  MODIFY `IdRevision` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `citas`
--
ALTER TABLE `citas`
  ADD CONSTRAINT `citas_ibfk_1` FOREIGN KEY (`DatosVehiculo`) REFERENCES `vehiculos` (`Placa`);

--
-- Filtros para la tabla `revisiones`
--
ALTER TABLE `revisiones`
  ADD CONSTRAINT `revisiones_ibfk_1` FOREIGN KEY (`Tecnico`) REFERENCES `tecnicos` (`Cedula`),
  ADD CONSTRAINT `revisiones_ibfk_2` FOREIGN KEY (`Cita`) REFERENCES `citas` (`IdCitas`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
