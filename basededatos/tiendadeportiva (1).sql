-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 23-04-2025 a las 16:11:33
-- Versión del servidor: 8.0.30
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tiendadeportiva`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `id_categoria_principal` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias_principales`
--

CREATE TABLE `categorias_principales` (
  `id` int NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `categorias_principales`
--

INSERT INTO `categorias_principales` (`id`, `nombre`) VALUES
(1, 'Mujer'),
(2, 'Hombre'),
(3, 'Niño');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direcciones_envio`
--

CREATE TABLE `direcciones_envio` (
  `id` int NOT NULL,
  `id_usuario` int DEFAULT NULL,
  `direccion` text,
  `ciudad` varchar(100) DEFAULT NULL,
  `departamento` varchar(100) DEFAULT NULL,
  `codigo_postal` varchar(20) DEFAULT NULL,
  `pais` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lista_deseos`
--

CREATE TABLE `lista_deseos` (
  `id` int NOT NULL,
  `id_usuario` int DEFAULT NULL,
  `id_producto` int DEFAULT NULL,
  `fecha_agregado` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metodos_pago`
--

CREATE TABLE `metodos_pago` (
  `id` int NOT NULL,
  `id_usuario` int DEFAULT NULL,
  `tipo_pago` enum('tarjeta_credito','tarjeta_debito','paypal') DEFAULT NULL,
  `titular_nombre` varchar(100) DEFAULT NULL,
  `numero_tarjeta` varchar(20) DEFAULT NULL,
  `fecha_expiracion` date DEFAULT NULL,
  `cvv` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int NOT NULL,
  `id_usuario` int DEFAULT NULL,
  `fecha_pedido` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `estado` enum('pendiente','procesando','enviado','entregado','cancelado') DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `direccion_envio_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preferencias`
--

CREATE TABLE `preferencias` (
  `id` int NOT NULL,
  `usuario_id` int NOT NULL,
  `notificaciones` tinyint(1) DEFAULT '1',
  `idioma` varchar(10) DEFAULT 'es'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recuperacion_contraseña`
--

CREATE TABLE `recuperacion_contraseña` (
  `id` int NOT NULL,
  `usuario_id` int NOT NULL,
  `token` varchar(255) NOT NULL,
  `fecha_expiracion` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro`
--

CREATE TABLE `registro` (
  `Idusuario` int NOT NULL,
  `Nombres` varchar(20) NOT NULL,
  `Edad` varchar(20) NOT NULL,
  `Sexo` varchar(20) NOT NULL,
  `Correo` varchar(20) NOT NULL,
  `Contraseña` varchar(20) NOT NULL,
  `Celular` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `registro`
--

INSERT INTO `registro` (`Idusuario`, `Nombres`, `Edad`, `Sexo`, `Correo`, `Contraseña`, `Celular`) VALUES
(1, 'jhunior franco', '21', 'M', 'jhunior.@gmail.com', '12345678', '121234545');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subcategorias`
--

CREATE TABLE `subcategorias` (
  `id` int NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` text,
  `categoria_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `subcategorias`
--

INSERT INTO `subcategorias` (`id`, `nombre`, `descripcion`, `categoria_id`) VALUES
(1, 'Leggins', 'Pantalones deportivos ajustados para mujer', NULL),
(2, 'Sostenes Deportivos', 'Sujetadores cómodos para entrenamiento', NULL),
(3, 'Tenis para Correr', 'Calzado especializado en running', NULL),
(4, 'Gorras Infantiles', 'Gorras para niños de todas las edades', NULL),
(15, 'Tenis Deportivos Mujer', 'Tenis cómodos para actividades físicas', NULL),
(16, 'Botines', 'Botines de moda y cómodos', NULL),
(17, 'Vestidos', 'Vestidos casuales y deportivos', NULL),
(18, 'Leggins', 'Pantalones ajustados deportivos', NULL),
(19, 'Gorras', 'Gorras para sol o estilo', NULL),
(20, 'Bolsos', 'Bolsos deportivos o casuales', NULL),
(21, 'Maquillaje', 'Cosméticos y kits de belleza', NULL),
(22, 'Cuidado Facial', 'Productos para limpieza e hidratación', NULL),
(23, 'Nike Mujer', 'Productos de la marca Nike', NULL),
(24, 'Adidas Mujer', 'Ropa y calzado Adidas para mujer', NULL),
(25, 'Zapatillas Running', 'Zapatillas para correr', NULL),
(26, 'Zapatos Urbanos', 'Estilo urbano y moderno', NULL),
(27, 'Camisetas', 'Camisetas deportivas o casuales', NULL),
(28, 'Shorts', 'Shorts cómodos para entrenar', NULL),
(29, 'Mochilas', 'Mochilas para gimnasio o diario', NULL),
(30, 'Relojes', 'Relojes deportivos o clásicos', NULL),
(31, 'Afeitadoras', 'Cuidado personal masculino', NULL),
(32, 'Fragancias', 'Perfumes y colonias', NULL),
(33, 'Nike Hombre', 'Colección Nike para hombre', NULL),
(34, 'Puma Hombre', 'Ropa y calzado de Puma', NULL),
(35, 'Zapatillas Infantiles', 'Calzado cómodo y seguro para niños', NULL),
(36, 'Botas para Lluvia', 'Botas impermeables para niños', NULL),
(37, 'Pijamas', 'Pijamas suaves y divertidas', NULL),
(38, 'Conjuntos Deportivos', 'Conjuntos para jugar o entrenar', NULL),
(39, 'Loncheras', 'Loncheras de personajes y coloridas', NULL),
(40, 'Gorras Infantiles', 'Gorras con dibujos o logos', NULL),
(41, 'Shampoo Infantil', 'Fórmulas suaves para niños', NULL),
(42, 'Protector Solar Infantil', 'Cuidado para la piel de los niños', NULL),
(43, 'Marvel Kids', 'Ropa con temática Marvel', NULL),
(44, 'Disney Kids', 'Productos de marcas Disney', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int NOT NULL,
  `nombre_usuario` varchar(50) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `contraseña` varchar(255) NOT NULL,
  `club_exclusivo` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_categoria_principal` (`id_categoria_principal`);

--
-- Indices de la tabla `categorias_principales`
--
ALTER TABLE `categorias_principales`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `preferencias`
--
ALTER TABLE `preferencias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `recuperacion_contraseña`
--
ALTER TABLE `recuperacion_contraseña`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `registro`
--
ALTER TABLE `registro`
  ADD PRIMARY KEY (`Idusuario`);

--
-- Indices de la tabla `subcategorias`
--
ALTER TABLE `subcategorias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoria_id` (`categoria_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre_usuario` (`nombre_usuario`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `categorias_principales`
--
ALTER TABLE `categorias_principales`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `preferencias`
--
ALTER TABLE `preferencias`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `recuperacion_contraseña`
--
ALTER TABLE `recuperacion_contraseña`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `registro`
--
ALTER TABLE `registro`
  MODIFY `Idusuario` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `subcategorias`
--
ALTER TABLE `subcategorias`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD CONSTRAINT `categorias_ibfk_1` FOREIGN KEY (`id_categoria_principal`) REFERENCES `categorias_principales` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `preferencias`
--
ALTER TABLE `preferencias`
  ADD CONSTRAINT `preferencias_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `recuperacion_contraseña`
--
ALTER TABLE `recuperacion_contraseña`
  ADD CONSTRAINT `recuperacion_contraseña_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `subcategorias`
--
ALTER TABLE `subcategorias`
  ADD CONSTRAINT `subcategorias_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
