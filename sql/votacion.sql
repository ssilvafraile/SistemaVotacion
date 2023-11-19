-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-11-2023 a las 20:51:12
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

CREATE DATABASE IF NOT EXISTS votacion;

-- Seleccionar la base de datos recién creada
USE votacion;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `votacion`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_candidatos`
--

CREATE TABLE `tb_candidatos` (
  `id_candidato` int(11) NOT NULL,
  `nombre_candidato` varchar(100) DEFAULT NULL,
  `id_sexo` int(11) DEFAULT NULL,
  `id_partido` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tb_candidatos`
--

INSERT INTO `tb_candidatos` (`id_candidato`, `nombre_candidato`, `id_sexo`, `id_partido`) VALUES
(1, 'Seleccione', 3, 9),
(2, 'Evelyn Matthei', 2, 2),
(3, 'Rodolfo Carter', 1, 1),
(4, 'José Antonio Kast', 1, 1),
(5, 'Sebastián Piñera', 1, 4),
(6, 'Michelle Bachelet', 2, 5),
(7, 'Daniel Jadue', 1, 6),
(8, 'Carolina Tohá', 2, 3),
(9, 'Franco Parisi', 1, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_comuna`
--

CREATE TABLE `tb_comuna` (
  `id_comuna` int(11) NOT NULL,
  `nombre_comuna` varchar(50) DEFAULT NULL,
  `id_region` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tb_comuna`
--

INSERT INTO `tb_comuna` (`id_comuna`, `nombre_comuna`, `id_region`) VALUES
(1, 'Seleccione', 1),
(2, 'Arica', 2),
(3, 'Camarones', 2),
(4, 'General Lagos', 2),
(5, 'Putre', 2),
(6, 'Alto Hospicio', 3),
(7, 'Iquique', 3),
(8, 'Camiña', 3),
(9, 'Colchane', 3),
(10, 'Huara', 3),
(11, 'Pica', 3),
(12, 'Pozo Almonte', 3),
(13, 'Antofagasta', 4),
(14, 'Mejillones', 4),
(15, 'Sierra Gorda', 4),
(16, 'Taltal', 4),
(17, 'Calama', 4),
(18, 'Ollague', 4),
(19, 'San Pedro de Atacama', 4),
(20, 'María Elena', 4),
(21, 'Tocopilla', 4),
(22, 'Chañaral', 5),
(23, 'Tierra Amarilla', 5),
(24, 'Alto del Carmen', 5),
(25, 'Freirina', 5),
(26, 'Huasco', 5),
(27, 'Vallenar', 5),
(28, 'Canela', 6),
(29, 'Illapel', 6),
(30, 'Los Vilos', 6),
(31, 'Salamanca', 6),
(32, 'Andacollo', 6),
(33, 'Coquimbo', 6),
(34, 'La Higuera', 6),
(35, 'La Serena', 6),
(36, 'Paihuaco', 6),
(37, 'Vicuña', 6),
(38, 'Combarbalá', 6),
(39, 'Monte Patria', 6),
(40, 'Ovalle', 6),
(41, 'Punitaqui', 6),
(42, 'Río Hurtado', 6),
(43, 'Isla de Pascua', 7),
(44, 'Calle Larga', 7),
(45, 'Los Andes', 7),
(46, 'Rinconada', 7),
(47, 'San Esteban', 7),
(48, 'La Ligua', 7),
(49, 'Papudo', 7),
(50, 'Petorca', 7),
(51, 'Zapallar', 7),
(52, 'Hijuelas', 7),
(53, 'La Calera', 7),
(54, 'La Cruz', 7),
(55, 'Limache', 7),
(56, 'Nogales', 7),
(57, 'Olmué', 7),
(58, 'Quillota', 7),
(59, 'Algarrobo', 7),
(60, 'Cartagena', 7),
(61, 'El Quisco', 7),
(62, 'El Tabo', 7),
(63, 'San Antonio', 7),
(64, 'Santo Domingo', 7),
(65, 'Catemu', 7),
(66, 'Llaillay', 7),
(67, 'Panquehue', 7),
(68, 'Putaendo', 7),
(69, 'San Felipe', 7),
(70, 'Santa María', 7),
(71, 'Casablanca', 7),
(72, 'Concón', 7),
(73, 'Juan Fernández', 7),
(74, 'Puchuncaví', 7),
(75, 'Quilpué', 7),
(76, 'Quintero', 7),
(77, 'Valparaíso', 7),
(78, 'Villa Alemana', 7),
(79, 'Viña del Mar', 7),
(80, 'Colina', 8),
(81, 'Lampa', 8),
(82, 'Tiltil', 8),
(83, 'Pirque', 8),
(84, 'Puente Alto', 8),
(85, 'San José de Maipo', 8),
(86, 'Buin', 8),
(87, 'Calera de Tango', 8),
(88, 'Paine', 8),
(89, 'San Bernardo', 8),
(90, 'Alhué', 8),
(91, 'Curacaví', 8),
(92, 'María Pinto', 8),
(93, 'Melipilla', 8),
(94, 'San Pedro', 8),
(95, 'Cerrillos', 8),
(96, 'Cerro Navia', 8),
(97, 'Conchalí', 8),
(98, 'El Bosque', 8),
(99, 'Estación Central', 8),
(100, 'Huechuraba', 8),
(101, 'Independencia', 8),
(102, 'La Cisterna', 8),
(103, 'La Granja', 8),
(104, 'La Florida', 8),
(105, 'La Pintana', 8),
(106, 'La Reina', 8),
(107, 'Las Condes', 8),
(108, 'Lo Barnechea', 8),
(109, 'Lo Espejo', 8),
(110, 'Lo Prado', 8),
(111, 'Macul', 8),
(112, 'Maipú', 8),
(113, 'Ñuñoa', 8),
(114, 'Pedro Aguirre Cerda', 8),
(115, 'Peñalolén', 8),
(116, 'Providencia', 8),
(117, 'Pudahuel', 8),
(118, 'Quilicura', 8),
(119, 'Quinta Normal', 8),
(120, 'Recoleta', 8),
(121, 'Renca', 8),
(122, 'San Miguel', 8),
(123, 'San Joaquín', 8),
(124, 'San Ramón', 8),
(125, 'Santiago', 8),
(126, 'Vitacura', 8),
(127, 'El Monte', 8),
(128, 'Isla de Maipo', 8),
(129, 'Padre Hurtado', 8),
(130, 'Peñaflor', 8),
(131, 'Talagante', 8),
(132, 'Codegua', 9),
(133, 'Coínco', 9),
(134, 'Coltauco', 9),
(135, 'Doñihue', 9),
(136, 'Graneros', 9),
(137, 'Las Cabras', 9),
(138, 'Machalí', 9),
(139, 'Malloa', 9),
(140, 'Mostazal', 9),
(141, 'Olivar', 9),
(142, 'Peumo', 9),
(143, 'Pichidegua', 9),
(144, 'Quinta de Tilcoco', 9),
(145, 'Rancagua', 9),
(146, 'Rengo', 9),
(147, 'Requínoa', 9),
(148, 'San Vicente de Tagua Tagua', 9),
(149, 'La Estrella', 9),
(150, 'Litueche', 9),
(151, 'Marchihue', 9),
(152, 'Navidad', 9),
(153, 'Peredones', 9),
(154, 'Pichilemu', 9),
(155, 'Chépica', 9),
(156, 'Chimbarongo', 9),
(157, 'Lolol', 9),
(158, 'Nancagua', 9),
(159, 'Palmilla', 9),
(160, 'Peralillo', 9),
(161, 'Placilla', 9),
(162, 'Pumanque', 9),
(163, 'San Fernando', 9),
(164, 'Santa Cruz', 9),
(165, 'Cauquenes', 10),
(166, 'Chanco', 10),
(167, 'Pelluhue', 10),
(168, 'Curicó', 10),
(169, 'Hualañé', 10),
(170, 'Licantén', 10),
(171, 'Molina', 10),
(172, 'Rauco', 10),
(173, 'Romeral', 10),
(174, 'Sagrada Familia', 10),
(175, 'Teno', 10),
(176, 'Vichuquén', 10),
(177, 'Colbún', 10),
(178, 'Linares', 10),
(179, 'Longaví', 10),
(180, 'Parral', 10),
(181, 'Retiro', 10),
(182, 'San Javier', 10),
(183, 'Villa Alegre', 10),
(184, 'Yerbas Buenas', 10),
(185, 'Constitución', 10),
(186, 'Curepto', 10),
(187, 'Empedrado', 10),
(188, 'Maule', 10),
(189, 'Pelarco', 10),
(190, 'Pencahue', 10),
(191, 'Río Claro', 10),
(192, 'San Clemente', 10),
(193, 'San Rafael', 10),
(194, 'Talca', 10),
(195, 'Bulnes', 11),
(196, 'Chillán', 11),
(197, 'Chillán Viejo', 11),
(198, 'Cobquecura', 11),
(199, 'Coelemu', 11),
(200, 'Coihueco', 11),
(201, 'El Carmen', 11),
(202, 'Ninhue', 11),
(203, 'Ñiquen', 11),
(204, 'Pemuco', 11),
(205, 'Pinto', 11),
(206, 'Portezuelo', 11),
(207, 'Quirihue', 11),
(208, 'Ránquil', 11),
(209, 'Treguaco', 11),
(210, 'Quillón', 11),
(211, 'San Carlos', 11),
(212, 'San Fabián', 11),
(213, 'San Ignacio', 11),
(214, 'San Nicolás', 11),
(215, 'Yungay', 11),
(216, 'Arauco', 12),
(217, 'Cañete', 12),
(218, 'Contulmo', 12),
(219, 'Curanilahue', 12),
(220, 'Lebu', 12),
(221, 'Los Álamos', 12),
(222, 'Tirúa', 12),
(223, 'Alto Biobío', 12),
(224, 'Antuco', 12),
(225, 'Cabrero', 12),
(226, 'Laja', 12),
(227, 'Los Ángeles', 12),
(228, 'Mulchén', 12),
(229, 'Nacimiento', 12),
(230, 'Negrete', 12),
(231, 'Quilaco', 12),
(232, 'Quilleco', 12),
(233, 'San Rosendo', 12),
(234, 'Santa Bárbara', 12),
(235, 'Tucapel', 12),
(236, 'Yumbel', 12),
(237, 'Chiguayante', 12),
(238, 'Concepción', 12),
(239, 'Coronel', 12),
(240, 'Florida', 12),
(241, 'Hualpén', 12),
(242, 'Hualqui', 12),
(243, 'Lota', 12),
(244, 'Penco', 12),
(245, 'San Pedro de La Paz', 12),
(246, 'Santa Juana', 12),
(247, 'Talcahuano', 12),
(248, 'Tomé', 12),
(249, 'Carahue', 13),
(250, 'Cholchol', 13),
(251, 'Cunco', 13),
(252, 'Curarrehue', 13),
(253, 'Freire', 13),
(254, 'Galvarino', 13),
(255, 'Gorbea', 13),
(256, 'Lautaro', 13),
(257, 'Loncoche', 13),
(258, 'Melipeuco', 13),
(259, 'Nueva Imperial', 13),
(260, 'Padre Las Casas', 13),
(261, 'Perquenco', 13),
(262, 'Pitrufquén', 13),
(263, 'Pucón', 13),
(264, 'Saavedra', 13),
(265, 'Teodoro Schmidt', 13),
(266, 'Toltén', 13),
(267, 'Vilcún', 13),
(268, 'Villarrica', 13),
(269, 'Angol', 13),
(270, 'Collipulli', 13),
(271, 'Curacautín', 13),
(272, 'Ercilla', 13),
(273, 'Lonquimay', 13),
(274, 'Los Sauces', 13),
(275, 'Lumaco', 13),
(276, 'Purén', 13),
(277, 'Renaico', 13),
(278, 'Traiguén', 13),
(279, 'Victoria', 13),
(280, 'Corral', 14),
(281, 'Lanco', 14),
(282, 'Los Lagos', 14),
(283, 'Máfil', 14),
(284, 'Mariquina', 14),
(285, 'Paillaco', 14),
(286, 'Panguipulli', 14),
(287, 'Valdivia', 14),
(288, 'Futrono', 14),
(289, 'La Unión', 14),
(290, 'Lago Ranco', 14),
(291, 'Río Bueno', 14),
(292, 'Ancud', 15),
(293, 'Castro', 15),
(294, 'Chonchi', 15),
(295, 'Curaco de Vélez', 15),
(296, 'Dalcahue', 15),
(297, 'Puqueldón', 15),
(298, 'Queilén', 15),
(299, 'Quemchi', 15),
(300, 'Quellón', 15),
(301, 'Quinchao', 15),
(302, 'Calbuco', 15),
(303, 'Cochamó', 15),
(304, 'Fresia', 15),
(305, 'Frutillar', 15),
(306, 'Llanquihue', 15),
(307, 'Los Muermos', 15),
(308, 'Maullín', 15),
(309, 'Puerto Montt', 15),
(310, 'Puerto Varas', 15),
(311, 'Osorno', 15),
(312, 'Puero Octay', 15),
(313, 'Purranque', 15),
(314, 'Puyehue', 15),
(315, 'Río Negro', 15),
(316, 'San Juan de la Costa', 15),
(317, 'San Pablo', 15),
(318, 'Chaitén', 15),
(319, 'Futaleufú', 15),
(320, 'Hualaihué', 15),
(321, 'Palena', 15),
(322, 'Aisén', 16),
(323, 'Cisnes', 16),
(324, 'Guaitecas', 16),
(325, 'Cochrane', 16),
(326, 'O-higgins', 16),
(327, 'Tortel', 16),
(328, 'Coihaique', 16),
(329, 'Lago Verde', 16),
(330, 'Chile Chico', 16),
(331, 'Río Ibáñez', 16),
(332, 'Antártica', 17),
(333, 'Cabo de Hornos', 17),
(334, 'Laguna Blanca', 17),
(335, 'Punta Arenas', 17),
(336, 'Río Verde', 17),
(337, 'San Gregorio', 17),
(338, 'Porvenir', 17),
(339, 'Primavera', 17),
(340, 'Timaukel', 17),
(341, 'Natales', 17),
(342, 'Torres del Paine', 17),
(343, 'Cabildo', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_partidopolitico`
--

CREATE TABLE `tb_partidopolitico` (
  `id_partido` int(11) NOT NULL,
  `nombre_partido` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tb_partidopolitico`
--

INSERT INTO `tb_partidopolitico` (`id_partido`, `nombre_partido`) VALUES
(1, 'Partido Republicano'),
(2, 'Unión Demócrata Independiente UDI'),
(3, 'Partido por la Demócracia PPD'),
(4, 'Partido Demócrata Cristiano'),
(5, 'Partido Socialista'),
(6, 'Partido Comunista'),
(7, 'Partido Progresista'),
(8, 'Partido de la Gente'),
(9, 'Otro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_region`
--

CREATE TABLE `tb_region` (
  `id_region` int(11) NOT NULL,
  `nombre_region` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tb_region`
--

INSERT INTO `tb_region` (`id_region`, `nombre_region`) VALUES
(1, 'Seleccione'),
(2, 'Arica y Parinacota'),
(3, 'Tarapacá'),
(4, 'Antofagasta'),
(5, 'Atacama'),
(6, 'Coquimbo'),
(7, 'Valparaiso'),
(8, 'Metropolitana de Santiago'),
(9, 'Libertador General Bernardo O\'Higgins'),
(10, 'Maule'),
(11, 'Ñuble'),
(12, 'Biobío'),
(13, 'La Araucanía'),
(14, 'Los Ríos'),
(15, 'Los Lagos'),
(16, 'Aisén del General Carlos Ibáñez del Campo'),
(17, 'Magallanes y de la Antártica Chilena');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_sexo`
--

CREATE TABLE `tb_sexo` (
  `id_sexo` int(11) NOT NULL,
  `descripcion_sexo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tb_sexo`
--

INSERT INTO `tb_sexo` (`id_sexo`, `descripcion_sexo`) VALUES
(1, 'Masculino'),
(2, 'Femenino'),
(3, 'Otro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_votos`
--

CREATE TABLE `tb_votos` (
  `id_voto` int(11) NOT NULL,
  `nombreApellido` varchar(200) DEFAULT NULL,
  `alias` varchar(50) DEFAULT NULL,
  `rut` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `id_region` int(11) DEFAULT NULL,
  `id_comuna` int(11) DEFAULT NULL,
  `id_candidato` int(11) DEFAULT NULL,
  `web` varchar(10) DEFAULT NULL,
  `tv` varchar(10) DEFAULT NULL,
  `rrss` varchar(10) DEFAULT NULL,
  `amigo` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tb_votos`
--

INSERT INTO `tb_votos` (`id_voto`, `nombreApellido`, `alias`, `rut`, `email`, `id_region`, `id_comuna`, `id_candidato`, `web`, `tv`, `rrss`, `amigo`) VALUES
(10, 'Sebastian Silva', 'SS1992', '18294075-5', 'ssilvafraile@gmail.com', 8, 84, 4, 'true', 'true', 'true', 'false'),
(11, 'Doris Fraile', 'Agustina1962', '9991035-6', 'doris.fraile@gmail.com', 12, 247, 2, 'true', 'true', 'true', 'true');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tb_candidatos`
--
ALTER TABLE `tb_candidatos`
  ADD PRIMARY KEY (`id_candidato`),
  ADD KEY `id_sexo` (`id_sexo`),
  ADD KEY `id_partido` (`id_partido`);

--
-- Indices de la tabla `tb_comuna`
--
ALTER TABLE `tb_comuna`
  ADD PRIMARY KEY (`id_comuna`),
  ADD KEY `id_region` (`id_region`);

--
-- Indices de la tabla `tb_partidopolitico`
--
ALTER TABLE `tb_partidopolitico`
  ADD PRIMARY KEY (`id_partido`);

--
-- Indices de la tabla `tb_region`
--
ALTER TABLE `tb_region`
  ADD PRIMARY KEY (`id_region`);

--
-- Indices de la tabla `tb_sexo`
--
ALTER TABLE `tb_sexo`
  ADD PRIMARY KEY (`id_sexo`);

--
-- Indices de la tabla `tb_votos`
--
ALTER TABLE `tb_votos`
  ADD PRIMARY KEY (`id_voto`),
  ADD KEY `id_region` (`id_region`),
  ADD KEY `id_comuna` (`id_comuna`),
  ADD KEY `id_candidato` (`id_candidato`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tb_candidatos`
--
ALTER TABLE `tb_candidatos`
  MODIFY `id_candidato` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=194;

--
-- AUTO_INCREMENT de la tabla `tb_comuna`
--
ALTER TABLE `tb_comuna`
  MODIFY `id_comuna` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=344;

--
-- AUTO_INCREMENT de la tabla `tb_partidopolitico`
--
ALTER TABLE `tb_partidopolitico`
  MODIFY `id_partido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `tb_region`
--
ALTER TABLE `tb_region`
  MODIFY `id_region` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `tb_sexo`
--
ALTER TABLE `tb_sexo`
  MODIFY `id_sexo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tb_votos`
--
ALTER TABLE `tb_votos`
  MODIFY `id_voto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tb_candidatos`
--
ALTER TABLE `tb_candidatos`
  ADD CONSTRAINT `tb_candidatos_ibfk_1` FOREIGN KEY (`id_sexo`) REFERENCES `tb_sexo` (`id_sexo`),
  ADD CONSTRAINT `tb_candidatos_ibfk_2` FOREIGN KEY (`id_partido`) REFERENCES `tb_partidopolitico` (`id_partido`);

--
-- Filtros para la tabla `tb_comuna`
--
ALTER TABLE `tb_comuna`
  ADD CONSTRAINT `tb_comuna_ibfk_1` FOREIGN KEY (`id_region`) REFERENCES `tb_region` (`id_region`);

--
-- Filtros para la tabla `tb_votos`
--
ALTER TABLE `tb_votos`
  ADD CONSTRAINT `tb_votos_ibfk_1` FOREIGN KEY (`id_region`) REFERENCES `tb_region` (`id_region`),
  ADD CONSTRAINT `tb_votos_ibfk_2` FOREIGN KEY (`id_comuna`) REFERENCES `tb_comuna` (`id_comuna`),
  ADD CONSTRAINT `tb_votos_ibfk_3` FOREIGN KEY (`id_candidato`) REFERENCES `tb_candidatos` (`id_candidato`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
