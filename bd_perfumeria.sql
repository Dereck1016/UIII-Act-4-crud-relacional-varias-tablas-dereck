-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-11-2023 a las 20:52:29
-- Versión del servidor: 10.1.28-MariaDB
-- Versión de PHP: 5.6.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_perfumeria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_productos`
--

CREATE TABLE `tbl_productos` (
  `idProducto` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `marca` varchar(50) NOT NULL,
  `Categoria` varchar(50) NOT NULL,
  `origen` varchar(50) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `cantidadstock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_productos`
--

INSERT INTO `tbl_productos` (`idProducto`, `nombre`, `precio`, `marca`, `Categoria`, `origen`, `descripcion`, `cantidadstock`) VALUES
(14, 'afnan 9pm', '1200.00', 'afnan', 'hombre', 'china', 'perfume para hombre de invierno', 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_productos_vendidos`
--

CREATE TABLE `tbl_productos_vendidos` (
  `id_producto_vendido` bigint(20) UNSIGNED NOT NULL,
  `id_producto` bigint(20) UNSIGNED NOT NULL,
  `NoProductos` bigint(20) UNSIGNED NOT NULL,
  `id_venta` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_productos_vendidos`
--

INSERT INTO `tbl_productos_vendidos` (`id_producto_vendido`, `id_producto`, `NoProductos`, `id_venta`) VALUES
(32, 14, 1, 27);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_ventas`
--

CREATE TABLE `tbl_ventas` (
  `id_venta` bigint(20) UNSIGNED NOT NULL,
  `fecha` datetime NOT NULL,
  `total` decimal(7,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_ventas`
--

INSERT INTO `tbl_ventas` (`id_venta`, `fecha`, `total`) VALUES
(24, '2023-11-17 03:49:37', '50000.00'),
(26, '2023-11-17 20:34:31', '0.00'),
(27, '2023-11-17 20:35:56', '1200.00');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbl_productos`
--
ALTER TABLE `tbl_productos`
  ADD PRIMARY KEY (`idProducto`);

--
-- Indices de la tabla `tbl_productos_vendidos`
--
ALTER TABLE `tbl_productos_vendidos`
  ADD PRIMARY KEY (`id_producto_vendido`),
  ADD KEY `id_producto` (`id_producto`),
  ADD KEY `id_venta` (`id_venta`);

--
-- Indices de la tabla `tbl_ventas`
--
ALTER TABLE `tbl_ventas`
  ADD PRIMARY KEY (`id_venta`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbl_productos`
--
ALTER TABLE `tbl_productos`
  MODIFY `idProducto` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `tbl_productos_vendidos`
--
ALTER TABLE `tbl_productos_vendidos`
  MODIFY `id_producto_vendido` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `tbl_ventas`
--
ALTER TABLE `tbl_ventas`
  MODIFY `id_venta` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbl_productos_vendidos`
--
ALTER TABLE `tbl_productos_vendidos`
  ADD CONSTRAINT `tbl_productos_vendidos_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `tbl_productos` (`idProducto`) ON DELETE CASCADE,
  ADD CONSTRAINT `tbl_productos_vendidos_ibfk_2` FOREIGN KEY (`id_venta`) REFERENCES `tbl_ventas` (`id_venta`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
