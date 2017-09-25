-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-09-2017 a las 05:24:54
-- Versión del servidor: 10.1.21-MariaDB
-- Versión de PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `metlab`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `add_delete_record`
--

CREATE TABLE `add_delete_record` (
  `id` int(11) NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `box_pin`
--

CREATE TABLE `box_pin` (
  `id` int(11) NOT NULL,
  `box_pin` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `box_pin`
--

INSERT INTO `box_pin` (`id`, `box_pin`) VALUES
(1, 'Box'),
(2, 'Pin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cutlog_junta`
--

CREATE TABLE `cutlog_junta` (
  `id` bigint(20) NOT NULL,
  `id_log` bigint(20) NOT NULL,
  `id_comentarios` int(11) NOT NULL,
  `id_operador` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cutlog_soldadura`
--

CREATE TABLE `cutlog_soldadura` (
  `id` bigint(20) NOT NULL,
  `id_counter` bigint(20) NOT NULL,
  `id_comentarios` int(11) NOT NULL,
  `id_operador` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `delivery_junta`
--

CREATE TABLE `delivery_junta` (
  `id` bigint(11) NOT NULL,
  `id_counter_log` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `delivery_soldadura`
--

CREATE TABLE `delivery_soldadura` (
  `id` bigint(20) NOT NULL,
  `id_counter_log` bigint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `import_phoenix`
--

CREATE TABLE `import_phoenix` (
  `id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `line_soldaduras`
--

CREATE TABLE `line_soldaduras` (
  `id` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `line_soldaduras`
--

INSERT INTO `line_soldaduras` (`id`, `nombre`) VALUES
(1, 'W1'),
(2, 'W2'),
(3, 'W3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nace`
--

CREATE TABLE `nace` (
  `id` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `nace`
--

INSERT INTO `nace` (`id`, `nombre`) VALUES
(3, '1/100'),
(4, '1/200'),
(2, 'NO'),
(1, 'SI');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `operadores`
--

CREATE TABLE `operadores` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `operadores`
--

INSERT INTO `operadores` (`id`, `nombre`) VALUES
(1, 'CESAR ARTURO OLEA RASCON'),
(2, 'ANTONIO HERNANDEZ VALDEZ'),
(3, 'FELIPE CAMPOS LOPEZ'),
(4, 'IVAN CABEZA DE VACA'),
(5, 'JUAN CARLOS ROMERO'),
(6, 'JESUS ALFREDO MEZA BAUTISTA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_junta`
--

CREATE TABLE `producto_junta` (
  `id` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `producto_junta`
--

INSERT INTO `producto_junta` (`id`, `nombre`) VALUES
(1, 'TOOL JOINT');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_soldadura`
--

CREATE TABLE `producto_soldadura` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `producto_soldadura`
--

INSERT INTO `producto_soldadura` (`id`, `nombre`) VALUES
(1, 'DRILL PIPE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prueba_junta`
--

CREATE TABLE `prueba_junta` (
  `id` bigint(20) NOT NULL,
  `id_job` bigint(20) NOT NULL,
  `id_line` varchar(50) NOT NULL,
  `operacion` int(11) NOT NULL,
  `tj_serial` int(11) NOT NULL,
  `heat_code` varchar(20) NOT NULL,
  `probeta` int(11) NOT NULL,
  `id_box_pin` int(11) NOT NULL,
  `lot_number` int(11) NOT NULL,
  `ncr` int(11) NOT NULL,
  `hardness_from` int(11) NOT NULL,
  `hardness_to` int(11) NOT NULL,
  `id_turno` int(11) NOT NULL,
  `id_supervisor` int(11) NOT NULL,
  `fecha_recepcion` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `prueba_junta`
--

INSERT INTO `prueba_junta` (`id`, `id_job`, `id_line`, `operacion`, `tj_serial`, `heat_code`, `probeta`, `id_box_pin`, `lot_number`, `ncr`, `hardness_from`, `hardness_to`, `id_turno`, `id_supervisor`, `fecha_recepcion`) VALUES
(18, 51, 'HI-TECH I', 600, 1, 'KOG', 1, 1, 2, 1, 20, 30, 1, 3, '2017-09-11 16:50:22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prueba_soldadura`
--

CREATE TABLE `prueba_soldadura` (
  `id` bigint(20) NOT NULL,
  `id_job` bigint(20) NOT NULL,
  `id_line_soldadura` int(11) NOT NULL,
  `operacion` int(11) NOT NULL,
  `pipe_heat` varchar(50) NOT NULL,
  `weld_probeta` int(11) NOT NULL,
  `tool_joint_heat_code` varchar(50) NOT NULL,
  `ncr` int(11) NOT NULL,
  `welder` int(11) NOT NULL,
  `id_operador` int(11) NOT NULL,
  `austenitize_station` varchar(50) NOT NULL,
  `id_turno` int(11) NOT NULL,
  `temper_station` varchar(50) NOT NULL,
  `qualify_from` int(11) NOT NULL,
  `qualify_to` int(11) NOT NULL,
  `id_razon` int(11) NOT NULL,
  `id_supervisor` int(11) NOT NULL,
  `fecha_recepcion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `prueba_soldadura`
--

INSERT INTO `prueba_soldadura` (`id`, `id_job`, `id_line_soldadura`, `operacion`, `pipe_heat`, `weld_probeta`, `tool_joint_heat_code`, `ncr`, `welder`, `id_operador`, `austenitize_station`, `id_turno`, `temper_station`, `qualify_from`, `qualify_to`, `id_razon`, `id_supervisor`, `fecha_recepcion`) VALUES
(12, 16, 1, 131, '13H', 12, 'FGD', 12, 12, 1, 'F3', 2, 'V3', 23, 23, 3, 3, '2017-09-11 16:53:02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `requerimientos_junta`
--

CREATE TABLE `requerimientos_junta` (
  `id` bigint(20) NOT NULL,
  `job` bigint(20) NOT NULL,
  `item` varchar(50) NOT NULL,
  `sales_order` int(11) NOT NULL,
  `so_line` double NOT NULL,
  `id_cliente` varchar(50) NOT NULL,
  `terceros` tinyint(1) NOT NULL,
  `box_od` int(11) NOT NULL,
  `finish_id` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `instruccion_especial` varchar(250) NOT NULL,
  `id_nace` int(11) NOT NULL,
  `grain_size` tinyint(1) NOT NULL,
  `id_tamano` int(11) NOT NULL,
  `max_temperature` int(11) NOT NULL,
  `min_temperature` int(11) NOT NULL,
  `id_orientacion` int(11) NOT NULL,
  `charpy_min_avg` int(11) NOT NULL,
  `charpy_max_avg` int(11) NOT NULL,
  `charpy_min_single` int(11) NOT NULL,
  `id_hard_freq` int(11) NOT NULL,
  `id_unit` int(11) NOT NULL,
  `hardness_min` int(11) NOT NULL,
  `hardness_max` int(11) NOT NULL,
  `id_variacion` int(11) NOT NULL,
  `yield_min` int(11) NOT NULL,
  `yield_max` int(11) NOT NULL,
  `min_tensile` int(11) NOT NULL,
  `max_tensile` int(11) DEFAULT NULL,
  `elong` int(11) NOT NULL,
  `ra` int(11) NOT NULL,
  `test_depth` int(11) DEFAULT NULL,
  `id_supervisor` int(11) DEFAULT NULL,
  `fecha_requisito` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `requerimientos_junta`
--

INSERT INTO `requerimientos_junta` (`id`, `job`, `item`, `sales_order`, `so_line`, `id_cliente`, `terceros`, `box_od`, `finish_id`, `id_producto`, `instruccion_especial`, `id_nace`, `grain_size`, `id_tamano`, `max_temperature`, `min_temperature`, `id_orientacion`, `charpy_min_avg`, `charpy_max_avg`, `charpy_min_single`, `id_hard_freq`, `id_unit`, `hardness_min`, `hardness_max`, `id_variacion`, `yield_min`, `yield_max`, `min_tensile`, `max_tensile`, `elong`, `ra`, `test_depth`, `id_supervisor`, `fecha_requisito`) VALUES
(51, 12345, '123*456', 20, 2.1, 'ARCHER', 0, 2, 1, 1, 'registro', 3, 0, 3, 4, 2, 1, 20, 22, 23, 1, 2, 20, 220, 1, 2, 2, 2, 2, 2, 2, 2, 2, '2017-09-11 16:48:56');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `requerimientos_soldadura`
--

CREATE TABLE `requerimientos_soldadura` (
  `id` bigint(20) NOT NULL,
  `job` bigint(20) NOT NULL,
  `item` varchar(50) NOT NULL,
  `sales_order` int(11) NOT NULL,
  `so_line` double NOT NULL,
  `id_cliente` varchar(50) NOT NULL,
  `terceros` tinyint(1) NOT NULL,
  `instruccion_especial` varchar(250) NOT NULL,
  `grain_size` tinyint(1) NOT NULL,
  `id_nace` int(11) NOT NULL,
  `id_tamano` int(11) NOT NULL,
  `min_temperature` int(11) NOT NULL,
  `max_temperature` int(11) NOT NULL,
  `id_orientacion` int(11) NOT NULL,
  `charpy_min_avg` int(11) NOT NULL,
  `charpy_max_avg` int(11) NOT NULL,
  `charpy_min_single` int(11) NOT NULL,
  `yield_min` int(11) NOT NULL,
  `yield_max` int(11) NOT NULL,
  `elong` int(11) NOT NULL,
  `ra` int(11) NOT NULL,
  `id_hard_freq` int(11) NOT NULL,
  `id_unit` int(11) NOT NULL,
  `hardness_sin` int(11) NOT NULL,
  `hardness_avg` int(11) NOT NULL,
  `id_supervisor` int(11) NOT NULL,
  `fecha_requisito` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `requerimientos_soldadura`
--

INSERT INTO `requerimientos_soldadura` (`id`, `job`, `item`, `sales_order`, `so_line`, `id_cliente`, `terceros`, `instruccion_especial`, `grain_size`, `id_nace`, `id_tamano`, `min_temperature`, `max_temperature`, `id_orientacion`, `charpy_min_avg`, `charpy_max_avg`, `charpy_min_single`, `yield_min`, `yield_max`, `elong`, `ra`, `id_hard_freq`, `id_unit`, `hardness_sin`, `hardness_avg`, `id_supervisor`, `fecha_requisito`) VALUES
(16, 12345, '1234*5689', 200, 2.22, 'ARCHER', 0, '1', 0, 3, 3, 20, 20, 1, 20, 20, 20, 20, 20, 20, 20, 1, 2, 20, 20, 2, '2017-09-11 16:49:39');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resultados_junta`
--

CREATE TABLE `resultados_junta` (
  `id` bigint(11) NOT NULL,
  `id_metlab_log` bigint(11) NOT NULL,
  `sn` int(11) NOT NULL,
  `shear` int(11) NOT NULL,
  `qualify_from` int(11) NOT NULL,
  `qualify_to` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resultados_soldadura`
--

CREATE TABLE `resultados_soldadura` (
  `id` bigint(11) NOT NULL,
  `id_metlab_log` bigint(11) NOT NULL,
  `tube_heat` int(11) NOT NULL,
  `shear` int(11) NOT NULL,
  `id_status` int(11) NOT NULL,
  `left_angle` int(11) NOT NULL,
  `left_thickness` double NOT NULL,
  `right_angle` int(11) NOT NULL,
  `right_thickness` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `status`
--

CREATE TABLE `status` (
  `id` int(11) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `status`
--

INSERT INTO `status` (`id`, `status`) VALUES
(2, 'FAIL'),
(1, 'PASS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `supervisores`
--

CREATE TABLE `supervisores` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `supervisores`
--

INSERT INTO `supervisores` (`id`, `nombre`) VALUES
(2, 'CIRILO BELTRAN LARA'),
(3, 'DANIEL UTRERA CELAYA'),
(1, 'JULIO ANTONIO TEJEDA HERNANDEZ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `test_frequency_junta`
--

CREATE TABLE `test_frequency_junta` (
  `id` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `test_frequency_junta`
--

INSERT INTO `test_frequency_junta` (`id`, `nombre`) VALUES
(1, '1/100'),
(3, '1/200'),
(4, '1/HEAT'),
(5, '5/HEAT');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `test_frequency_soldadura`
--

CREATE TABLE `test_frequency_soldadura` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `test_frequency_soldadura`
--

INSERT INTO `test_frequency_soldadura` (`id`, `nombre`) VALUES
(1, '1/400'),
(3, '1/100 WELDS/WELDER'),
(4, 'OTHER TEST');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_razones`
--

CREATE TABLE `tipos_razones` (
  `id` int(11) NOT NULL,
  `razon` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipos_razones`
--

INSERT INTO `tipos_razones` (`id`, `razon`) VALUES
(3, 'Cycle Fault'),
(1, 'Normal Test'),
(2, 'Previous Failing Test');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_tamanos`
--

CREATE TABLE `tipos_tamanos` (
  `id` int(11) NOT NULL,
  `tamano` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipos_tamanos`
--

INSERT INTO `tipos_tamanos` (`id`, `tamano`) VALUES
(3, '3/4 SIZE'),
(1, 'FULL SIZE'),
(2, 'HALF SIZE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_orientacion`
--

CREATE TABLE `tipo_orientacion` (
  `id` int(11) NOT NULL,
  `orientacion` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo_orientacion`
--

INSERT INTO `tipo_orientacion` (`id`, `orientacion`) VALUES
(1, 'LONGITUDINAL'),
(2, 'TRANSVERSAL');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_prueba`
--

CREATE TABLE `tipo_prueba` (
  `id` int(11) NOT NULL,
  `tipo` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo_prueba`
--

INSERT INTO `tipo_prueba` (`id`, `tipo`) VALUES
(1, 'TOOL JOIN'),
(2, 'WELD TEST');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_turno`
--

CREATE TABLE `tipo_turno` (
  `id` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo_turno`
--

INSERT INTO `tipo_turno` (`id`, `nombre`) VALUES
(1, 'PRIMER TURNO'),
(2, 'SEGUNDO TURNO'),
(3, 'TERCER TURNO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidades_medida`
--

CREATE TABLE `unidades_medida` (
  `id` int(11) NOT NULL,
  `nombre_unidad` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `unidades_medida`
--

INSERT INTO `unidades_medida` (`id`, `nombre_unidad`) VALUES
(2, 'HBW'),
(9, 'HRB'),
(1, 'HRC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(80) DEFAULT NULL,
  `logo_picture` text,
  `empresa` text CHARACTER SET utf8 COLLATE utf8_spanish_ci,
  `slogan` text,
  `domicilio` text,
  `telefono` varchar(10) DEFAULT NULL,
  `celular` varchar(10) DEFAULT NULL,
  `email` text,
  `rfc` varchar(18) DEFAULT NULL,
  `nota` text,
  `clave` varchar(8) DEFAULT NULL COMMENT 'Password',
  `fec_alta` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tipo` varchar(3) DEFAULT NULL,
  `cve_tipo` int(11) DEFAULT NULL,
  `matricula` varchar(20) DEFAULT NULL,
  `sistema` varchar(3) DEFAULT NULL,
  `menu` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `logo_picture`, `empresa`, `slogan`, `domicilio`, `telefono`, `celular`, `email`, `rfc`, `nota`, `clave`, `fec_alta`, `tipo`, `cve_tipo`, `matricula`, `sistema`, `menu`) VALUES
(1, 'MARTÍN ROMERO', '../fotos/LogoNOV.png', 'PRODUCCIÓN', 'NOV Grant Prideco', 'ORIZABA 324 - 13', '', '2292653448', 'martin.romero@nov.com', 'RODR631118N97', '', 'Ol162022', '2017-08-14 15:35:34', 'adm', 1, '155638', NULL, 1),
(43, 'GUILLERMO JIMENEZ GARCIA', '../fotos/LogoNOV.png', 'Desarrollador', 'NOV Grant Prideco', 'ORIZABA 324 - 13', '', '2292653448', 'jiga_1up@hotmail.com', 'RODR631118N97', '', '12345678', '2017-09-01 19:57:00', 'adm', 1, '155638', NULL, 1),
(44, 'MANUEL ZARATE', '../fotos/LogoNOV.png', 'PRODUCCIÓN', 'NOV Grant Prideco', 'ORIZABA 324 - 13', '', '2292653448', 'manuel.zarate@nov.com', 'RODR631118N97', '', 'zarate', '2017-09-05 20:36:44', 'adm', 1, '155638', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `variacion`
--

CREATE TABLE `variacion` (
  `id` int(11) NOT NULL,
  `variacion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `variacion`
--

INSERT INTO `variacion` (`id`, `variacion`) VALUES
(1, '6 HRC MAX VARIATION');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `verificacion_dureza`
--

CREATE TABLE `verificacion_dureza` (
  `id` int(11) NOT NULL,
  `id_supervisor` int(11) NOT NULL,
  `block_sn` varchar(50) NOT NULL,
  `rango` varchar(50) NOT NULL,
  `diametro` int(11) NOT NULL,
  `test` double NOT NULL,
  `fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `verificacion_dureza`
--

INSERT INTO `verificacion_dureza` (`id`, `id_supervisor`, `block_sn`, `rango`, `diametro`, `test`, `fecha`) VALUES
(1, 3, '3715391', '35.8', 321, 35.5, '2017-08-31 17:02:00'),
(2, 3, '5000934', '34.37', 313, 34.4, '2017-08-31 17:03:00'),
(3, 3, '76457282', '3.30-3.40', 345, 3.35, '2017-08-31 17:05:00');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `add_delete_record`
--
ALTER TABLE `add_delete_record`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `box_pin`
--
ALTER TABLE `box_pin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `box_pin` (`box_pin`),
  ADD UNIQUE KEY `box_pin_2` (`box_pin`);

--
-- Indices de la tabla `cutlog_junta`
--
ALTER TABLE `cutlog_junta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_log` (`id_log`,`id_comentarios`,`id_operador`),
  ADD KEY `id_comentarios` (`id_comentarios`),
  ADD KEY `id_operador` (`id_operador`);

--
-- Indices de la tabla `cutlog_soldadura`
--
ALTER TABLE `cutlog_soldadura`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_counter` (`id_counter`,`id_comentarios`,`id_operador`),
  ADD KEY `id_comentarios` (`id_comentarios`);

--
-- Indices de la tabla `delivery_junta`
--
ALTER TABLE `delivery_junta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_counter_log` (`id_counter_log`);

--
-- Indices de la tabla `delivery_soldadura`
--
ALTER TABLE `delivery_soldadura`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_counter_log` (`id_counter_log`);

--
-- Indices de la tabla `import_phoenix`
--
ALTER TABLE `import_phoenix`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `line_soldaduras`
--
ALTER TABLE `line_soldaduras`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `nace`
--
ALTER TABLE `nace`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `operadores`
--
ALTER TABLE `operadores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indices de la tabla `producto_junta`
--
ALTER TABLE `producto_junta`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `producto_soldadura`
--
ALTER TABLE `producto_soldadura`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `prueba_junta`
--
ALTER TABLE `prueba_junta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_job` (`id_job`,`id_box_pin`),
  ADD KEY `id_turno` (`id_turno`),
  ADD KEY `id_box_pin` (`id_box_pin`),
  ADD KEY `id_supervisor` (`id_supervisor`);

--
-- Indices de la tabla `prueba_soldadura`
--
ALTER TABLE `prueba_soldadura`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_line_soldadura` (`id_line_soldadura`,`id_job`,`id_operador`,`id_turno`,`id_razon`),
  ADD KEY `id_turno` (`id_turno`),
  ADD KEY `id_operador` (`id_operador`),
  ADD KEY `id_razon` (`id_razon`),
  ADD KEY `id_job` (`id_job`),
  ADD KEY `id_supervisor` (`id_supervisor`);

--
-- Indices de la tabla `requerimientos_junta`
--
ALTER TABLE `requerimientos_junta`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `job` (`job`),
  ADD UNIQUE KEY `item` (`item`),
  ADD KEY `id_producto` (`id_producto`),
  ADD KEY `id_nace` (`id_nace`),
  ADD KEY `id_tamano` (`id_tamano`),
  ADD KEY `id_orientacion` (`id_orientacion`),
  ADD KEY `id_unit` (`id_unit`),
  ADD KEY `id_supervisor` (`id_supervisor`),
  ADD KEY `id_hard_freq` (`id_hard_freq`),
  ADD KEY `id_variacion` (`id_variacion`);

--
-- Indices de la tabla `requerimientos_soldadura`
--
ALTER TABLE `requerimientos_soldadura`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `job` (`job`,`item`),
  ADD KEY `id_nace` (`id_nace`,`id_tamano`,`id_orientacion`,`id_hard_freq`,`id_unit`,`id_supervisor`),
  ADD KEY `id_tamano` (`id_tamano`),
  ADD KEY `id_orientacion` (`id_orientacion`),
  ADD KEY `id_unit` (`id_unit`),
  ADD KEY `id_supervisor` (`id_supervisor`),
  ADD KEY `id_hard_freq` (`id_hard_freq`);

--
-- Indices de la tabla `resultados_junta`
--
ALTER TABLE `resultados_junta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_metlab_log` (`id_metlab_log`,`qualify_from`,`qualify_to`);

--
-- Indices de la tabla `resultados_soldadura`
--
ALTER TABLE `resultados_soldadura`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_metlab_log` (`id_metlab_log`,`shear`),
  ADD KEY `id_status` (`id_status`);

--
-- Indices de la tabla `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `status` (`status`);

--
-- Indices de la tabla `supervisores`
--
ALTER TABLE `supervisores`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `test_frequency_junta`
--
ALTER TABLE `test_frequency_junta`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `test_frequency_soldadura`
--
ALTER TABLE `test_frequency_soldadura`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipos_razones`
--
ALTER TABLE `tipos_razones`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `razon` (`razon`);

--
-- Indices de la tabla `tipos_tamanos`
--
ALTER TABLE `tipos_tamanos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tamano` (`tamano`);

--
-- Indices de la tabla `tipo_orientacion`
--
ALTER TABLE `tipo_orientacion`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orientacion` (`orientacion`);

--
-- Indices de la tabla `tipo_prueba`
--
ALTER TABLE `tipo_prueba`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tipo` (`tipo`);

--
-- Indices de la tabla `tipo_turno`
--
ALTER TABLE `tipo_turno`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `unidades_medida`
--
ALTER TABLE `unidades_medida`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre_unidad` (`nombre_unidad`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indices de la tabla `variacion`
--
ALTER TABLE `variacion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `verificacion_dureza`
--
ALTER TABLE `verificacion_dureza`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_supervisor` (`id_supervisor`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `add_delete_record`
--
ALTER TABLE `add_delete_record`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `box_pin`
--
ALTER TABLE `box_pin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `cutlog_junta`
--
ALTER TABLE `cutlog_junta`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `cutlog_soldadura`
--
ALTER TABLE `cutlog_soldadura`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `delivery_junta`
--
ALTER TABLE `delivery_junta`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `delivery_soldadura`
--
ALTER TABLE `delivery_soldadura`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `import_phoenix`
--
ALTER TABLE `import_phoenix`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `line_soldaduras`
--
ALTER TABLE `line_soldaduras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `nace`
--
ALTER TABLE `nace`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `operadores`
--
ALTER TABLE `operadores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `producto_junta`
--
ALTER TABLE `producto_junta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `producto_soldadura`
--
ALTER TABLE `producto_soldadura`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `prueba_junta`
--
ALTER TABLE `prueba_junta`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT de la tabla `prueba_soldadura`
--
ALTER TABLE `prueba_soldadura`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT de la tabla `requerimientos_junta`
--
ALTER TABLE `requerimientos_junta`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;
--
-- AUTO_INCREMENT de la tabla `requerimientos_soldadura`
--
ALTER TABLE `requerimientos_soldadura`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT de la tabla `resultados_junta`
--
ALTER TABLE `resultados_junta`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `resultados_soldadura`
--
ALTER TABLE `resultados_soldadura`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `status`
--
ALTER TABLE `status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `supervisores`
--
ALTER TABLE `supervisores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `test_frequency_junta`
--
ALTER TABLE `test_frequency_junta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `test_frequency_soldadura`
--
ALTER TABLE `test_frequency_soldadura`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `tipos_razones`
--
ALTER TABLE `tipos_razones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `tipos_tamanos`
--
ALTER TABLE `tipos_tamanos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `tipo_orientacion`
--
ALTER TABLE `tipo_orientacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `tipo_prueba`
--
ALTER TABLE `tipo_prueba`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `tipo_turno`
--
ALTER TABLE `tipo_turno`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `unidades_medida`
--
ALTER TABLE `unidades_medida`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
--
-- AUTO_INCREMENT de la tabla `variacion`
--
ALTER TABLE `variacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `verificacion_dureza`
--
ALTER TABLE `verificacion_dureza`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cutlog_junta`
--
ALTER TABLE `cutlog_junta`
  ADD CONSTRAINT `cutlog_junta_ibfk_1` FOREIGN KEY (`id_log`) REFERENCES `prueba_junta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `cutlog_junta_ibfk_2` FOREIGN KEY (`id_comentarios`) REFERENCES `tipo_prueba` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `cutlog_junta_ibfk_3` FOREIGN KEY (`id_operador`) REFERENCES `operadores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `cutlog_soldadura`
--
ALTER TABLE `cutlog_soldadura`
  ADD CONSTRAINT `cutlog_soldadura_ibfk_1` FOREIGN KEY (`id_counter`) REFERENCES `prueba_soldadura` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `cutlog_soldadura_ibfk_2` FOREIGN KEY (`id_comentarios`) REFERENCES `tipo_prueba` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `delivery_junta`
--
ALTER TABLE `delivery_junta`
  ADD CONSTRAINT `delivery_junta_ibfk_1` FOREIGN KEY (`id_counter_log`) REFERENCES `cutlog_junta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `delivery_soldadura`
--
ALTER TABLE `delivery_soldadura`
  ADD CONSTRAINT `delivery_soldadura_ibfk_1` FOREIGN KEY (`id_counter_log`) REFERENCES `cutlog_soldadura` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `prueba_junta`
--
ALTER TABLE `prueba_junta`
  ADD CONSTRAINT `prueba_junta_ibfk_1` FOREIGN KEY (`id_turno`) REFERENCES `tipo_turno` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `prueba_junta_ibfk_2` FOREIGN KEY (`id_box_pin`) REFERENCES `box_pin` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `prueba_junta_ibfk_3` FOREIGN KEY (`id_job`) REFERENCES `requerimientos_junta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `prueba_junta_ibfk_4` FOREIGN KEY (`id_supervisor`) REFERENCES `supervisores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `prueba_soldadura`
--
ALTER TABLE `prueba_soldadura`
  ADD CONSTRAINT `prueba_soldadura_ibfk_1` FOREIGN KEY (`id_turno`) REFERENCES `tipo_turno` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `prueba_soldadura_ibfk_2` FOREIGN KEY (`id_line_soldadura`) REFERENCES `line_soldaduras` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `prueba_soldadura_ibfk_3` FOREIGN KEY (`id_operador`) REFERENCES `operadores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `prueba_soldadura_ibfk_4` FOREIGN KEY (`id_razon`) REFERENCES `tipos_razones` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `prueba_soldadura_ibfk_5` FOREIGN KEY (`id_job`) REFERENCES `requerimientos_soldadura` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `prueba_soldadura_ibfk_6` FOREIGN KEY (`id_supervisor`) REFERENCES `supervisores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `requerimientos_junta`
--
ALTER TABLE `requerimientos_junta`
  ADD CONSTRAINT `requerimientos_junta_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `producto_junta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `requerimientos_junta_ibfk_2` FOREIGN KEY (`id_nace`) REFERENCES `nace` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `requerimientos_junta_ibfk_3` FOREIGN KEY (`id_tamano`) REFERENCES `tipos_tamanos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `requerimientos_junta_ibfk_4` FOREIGN KEY (`id_orientacion`) REFERENCES `tipo_orientacion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `requerimientos_junta_ibfk_5` FOREIGN KEY (`id_unit`) REFERENCES `unidades_medida` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `requerimientos_junta_ibfk_7` FOREIGN KEY (`id_supervisor`) REFERENCES `supervisores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `requerimientos_junta_ibfk_8` FOREIGN KEY (`id_hard_freq`) REFERENCES `test_frequency_junta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `requerimientos_junta_ibfk_9` FOREIGN KEY (`id_variacion`) REFERENCES `variacion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `requerimientos_soldadura`
--
ALTER TABLE `requerimientos_soldadura`
  ADD CONSTRAINT `requerimientos_soldadura_ibfk_1` FOREIGN KEY (`id_nace`) REFERENCES `nace` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `requerimientos_soldadura_ibfk_2` FOREIGN KEY (`id_tamano`) REFERENCES `tipos_tamanos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `requerimientos_soldadura_ibfk_3` FOREIGN KEY (`id_orientacion`) REFERENCES `tipo_orientacion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `requerimientos_soldadura_ibfk_5` FOREIGN KEY (`id_unit`) REFERENCES `unidades_medida` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `requerimientos_soldadura_ibfk_6` FOREIGN KEY (`id_supervisor`) REFERENCES `supervisores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `requerimientos_soldadura_ibfk_7` FOREIGN KEY (`id_hard_freq`) REFERENCES `test_frequency_soldadura` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `resultados_junta`
--
ALTER TABLE `resultados_junta`
  ADD CONSTRAINT `resultados_junta_ibfk_1` FOREIGN KEY (`id_metlab_log`) REFERENCES `delivery_junta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `resultados_soldadura`
--
ALTER TABLE `resultados_soldadura`
  ADD CONSTRAINT `resultados_soldadura_ibfk_1` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `resultados_soldadura_ibfk_2` FOREIGN KEY (`id_metlab_log`) REFERENCES `delivery_soldadura` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `verificacion_dureza`
--
ALTER TABLE `verificacion_dureza`
  ADD CONSTRAINT `verificacion_dureza_ibfk_1` FOREIGN KEY (`id_supervisor`) REFERENCES `supervisores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
