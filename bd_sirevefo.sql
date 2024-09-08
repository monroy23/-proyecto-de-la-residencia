-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-05-2023 a las 20:36:24
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_sirevefo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_conciliacion`
--

CREATE TABLE `tbl_conciliacion` (
  `id` int(4) NOT NULL,
  `hora` date NOT NULL,
  `fecha` date NOT NULL,
  `domicilio` varchar(100) NOT NULL,
  `calle` varchar(100) NOT NULL,
  `numero` varchar(100) NOT NULL,
  `colonia` varchar(100) NOT NULL,
  `inspector` varchar(50) NOT NULL,
  `afectado1` varchar(50) NOT NULL,
  `afectado2` varchar(50) NOT NULL,
  `expediente` int(11) NOT NULL,
  `acuerdo` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_csv`
--

CREATE TABLE `tbl_csv` (
  `fecha` varchar(12) NOT NULL,
  `hora` varchar(12) NOT NULL,
  `latitud` varchar(15) NOT NULL,
  `longitud` varchar(15) NOT NULL,
  `acimut` varchar(20) NOT NULL,
  `distancia` varchar(10) NOT NULL,
  `especie` varchar(20) NOT NULL,
  `Folio` varchar(150) NOT NULL,
  `diametro` varchar(20) NOT NULL,
  `altura` varchar(20) NOT NULL,
  `ang_superior` varchar(20) NOT NULL,
  `ang_inferior` varchar(20) NOT NULL,
  `aci_superior` varchar(20) NOT NULL,
  `aci_inferior` varchar(20) NOT NULL,
  `laminacion` varchar(20) NOT NULL,
  `tronco` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_csv`
--

INSERT INTO `tbl_csv` (`fecha`, `hora`, `latitud`, `longitud`, `acimut`, `distancia`, `especie`, `Folio`, `diametro`, `altura`, `ang_superior`, `ang_inferior`, `aci_superior`, `aci_inferior`, `laminacion`, `tronco`) VALUES
('07/01/2023', '18:39:57', '18.120774', '-92.863602', '16.5', '1', 'guayacan', '223', '13', '15', '-6.9', '-49.8', '18.3', '16.5', '2.4', '1\r\n'),
('07/01/2023', '18:39:57', '18.120774', '-92.863602', '16.5', '1', 'Nombre del árbol', '224', '14', '16', '-6.9', '-49.8', '18.3', '16.5', '2.4', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_denuncia`
--

CREATE TABLE `tbl_denuncia` (
  `id` int(11) NOT NULL,
  `origen` varchar(100) NOT NULL,
  `folio` int(11) NOT NULL,
  `expediente` int(11) NOT NULL,
  `fecha` varchar(15) NOT NULL,
  `solicitante` varchar(100) NOT NULL,
  `calle` varchar(255) NOT NULL,
  `colonia` varchar(255) NOT NULL,
  `telefono` bigint(11) NOT NULL,
  `ubicacion` varchar(255) NOT NULL,
  `especie` varchar(100) NOT NULL,
  `cant_arboles` int(11) NOT NULL,
  `accion` varchar(100) NOT NULL,
  `lugar_arbol` varchar(100) NOT NULL,
  `motivo` varchar(255) NOT NULL,
  `referencia` varchar(225) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tbl_denuncia`
--

INSERT INTO `tbl_denuncia` (`id`, `origen`, `folio`, `expediente`, `fecha`, `solicitante`, `calle`, `colonia`, `telefono`, `ubicacion`, `especie`, `cant_arboles`, `accion`, `lugar_arbol`, `motivo`, `referencia`) VALUES
(6, 'Atención ciudadana', 225, 1, '2022-11-18', 'victor', 'luis', 'victor', 2147483647, 'luis', 'Macuilís', 9, 'Poda', 'En la vía pública', 'ejemplo', ''),
(15, 'personal', 224, 2, '2023-03-31', 'juan antonio', 'carretera principal sin numero ', 'miguel hidalgo', 9931207975, 'a 100 metros de mi casa enfrente de la tienda de la esquina elex', 'Pino', 2, 'Poda', 'En la vía pública', 'a veces el vecino espía, cuando se baña mi tia ', 'amuasdy'),
(16, 'personal', 223, 3, '2023-05-02', 'wilber', 'carretera principal', 'miguel hidalgo', 9933862050, 'a 100 metros de mi casa enfrente de la tienda de la esquina elex', 'Guayacán', 3, 'Derribo', 'En la vía pública', 'peligroso, caida a casa a cables de tencion', '10metros de mi casa');

--
-- Disparadores `tbl_denuncia`
--
DELIMITER $$
CREATE TRIGGER `agrega_folio` AFTER INSERT ON `tbl_denuncia` FOR EACH ROW update tbl_parametros_22 set fl_denuncia = fl_denuncia + 1
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `agregar_exped` AFTER INSERT ON `tbl_denuncia` FOR EACH ROW update tbl_parametros_22 set fl_expediente = fl_expediente + 1
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_especies`
--

CREATE TABLE `tbl_especies` (
  `esp_cve` int(11) NOT NULL,
  `esp_cve_gen` int(11) NOT NULL,
  `esp_nom` varchar(150) NOT NULL,
  `esp_co1` varchar(150) NOT NULL,
  `esp_co2` varchar(150) NOT NULL,
  `status_esp` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tbl_especies`
--

INSERT INTO `tbl_especies` (`esp_cve`, `esp_cve_gen`, `esp_nom`, `esp_co1`, `esp_co2`, `status_esp`) VALUES
(1, 1, 'Anacardium occidentale', 'Marañón', '', 1),
(2, 2, 'Mangifera indica ', 'Mango', '', 1),
(3, 3, 'Thevethia thevetioides ', 'Zebrito', 'Codo de fraile', 1),
(4, 4, 'Adonidia merrillii ', 'Palma de navidad', '', 1),
(5, 5, 'Caryota mitis ', 'Cola de pescado', '', 1),
(6, 6, 'Cocos nucifera ', 'Coco', '', 1),
(7, 7, 'Roystonea dunlapiana ', 'Palma real', '', 1),
(8, 8, 'Sabal mexicana ', 'Guano redondo', '', 1),
(9, 9, 'Crescentia cujete ', 'Jícara', '', 1),
(10, 10, 'Handroanthus chrysanthus', 'Guayacán', '', 1),
(11, 11, 'Spathodea campanulata ', 'Tulipan africano', 'Tulipán de la India', 1),
(12, 12, 'Tabebuia rosea ', 'Macuilís', '', 1),
(13, 13, 'Tecoma stans ', 'Escandor', 'Candor', 1),
(14, 14, 'Cochlospermum vitifolium ', 'Pochote', '', 1),
(15, 15, 'Bursera simaruba ', 'Palo mulato', '', 1),
(16, 16, 'Casuarina equisetifolia ', 'Pino', 'Casuarina', 1),
(17, 17, 'Terminalia buceras ', 'Pucté', 'Olivo negro', 1),
(18, 17, 'Terminalia catappa ', 'Almendra', '', 1),
(19, 18, 'Cupressus sempervirens ', 'Cipres', '', 1),
(20, 19, 'Albizia lebbeck ', 'Acasia amarilla', '', 1),
(21, 20, 'Andira galeottiana ', 'Macayo', '', 1),
(22, 21, 'Bauhinia monandra ', 'Pata de vaca', '', 1),
(23, 22, 'Cassia fistula ', 'Lluvia de oro', '', 1),
(24, 22, 'Cassia javanica ', 'Acasia rosada', '', 1),
(25, 23, 'Delonix regia ', 'Framboyán', '', 1),
(26, 24, 'Enterolobium cyclocarpum ', 'Guanacaste', 'Pich', 1),
(27, 25, 'Gliricidia sepium ', 'Cocoite', '', 1),
(28, 26, 'Haematoxylum campechianum ', 'Palo de tinto', '', 1),
(29, 27, 'Leucaena leucocephala ', 'Guaje blanco', '', 1),
(30, 28, 'Ormosia macrocalyx ', 'Caracolillo', '', 1),
(31, 29, 'Pithecellobium dulce ', 'Guamúchil', '', 1),
(32, 30, 'Samanea saman ', 'Saman', '', 1),
(33, 31, 'Tamarindus indica ', 'Tamarindo', '', 1),
(34, 32, 'Gmelina arborea', 'Melina', '', 1),
(35, 33, 'Persea americana ', 'Aguacate', '', 1),
(36, 34, 'Byrsonima crassifolia ', 'Nance', '', 1),
(37, 35, 'Ceiba pentandra ', 'Ceiba', '', 1),
(38, 36, 'Guazuma ulmifolia ', 'Guacimo', '', 1),
(39, 37, 'Sterculia apetala ', 'Bellota', '', 1),
(40, 38, 'Azadirachta indica ', 'Neem', '', 1),
(41, 39, 'Cedrela odorata ', 'Cedro', '', 1),
(42, 40, 'Swietenia macrophylla ', 'Caoba', '', 1),
(43, 41, 'Ficus aurea', 'Ficus', '', 1),
(44, 41, 'Ficus benjamina ', 'Ficus', 'Laurel de la india', 1),
(45, 41, 'Ficus cotinifolia ', 'Amate negro', '', 1),
(46, 41, 'Ficus elastica ', 'Hule', 'Amate', 1),
(47, 41, 'Ficus microcarpa ', 'Ficus', 'Laurel de la india', 1),
(48, 41, 'Ficus rubiginosa ', 'Ficus', '', 1),
(49, 42, 'Muntingia calabura ', 'Capulín', '', 1),
(50, 43, 'Eucalyptus camaldulensis ', 'Eucalipto', '', 1),
(51, 44, 'Pimenta dioica ', 'Pimienta', '', 1),
(52, 45, 'Psidium guajava ', 'Guayaba', '', 1),
(53, 46, 'Syzygium jambos ', 'Pomarrosa', '', 1),
(54, 47, 'Morinda citrifolia ', 'Noni', '', 1),
(55, 48, 'Citrus ? limon ', 'Limon', '', 1),
(56, 48, 'Citrus x sinensis ', 'Naranja', '', 1),
(57, 49, 'Salix humboldtiana', 'Sauce', '', 1),
(58, 50, 'Melicoccus bijugatus ', 'Guaya', '', 1),
(59, 51, 'Chrysophyllum cainito ', 'Caimito', '', 1),
(60, 52, 'Cecropia obtusifolia ', 'Guarumo', '', 1),
(72, 53, 'Tectona grandis ', 'Teca', '', 0),
(74, 68, 'Annona squamosa', 'Anona', '', 0),
(75, 68, 'Annona muricata', 'Guanábana', '', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_familias`
--

CREATE TABLE `tbl_familias` (
  `fam_cve` int(11) NOT NULL,
  `fam_nom` varchar(150) NOT NULL,
  `status_fam` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tbl_familias`
--

INSERT INTO `tbl_familias` (`fam_cve`, `fam_nom`, `status_fam`) VALUES
(1, 'Anacardiaceae', 1),
(2, 'Apocynaceae', 1),
(3, 'Arecaceae', 1),
(4, 'Bignoniaceae', 1),
(5, 'Bixaceae', 1),
(6, 'Burseraceae', 1),
(7, 'Casuarinaceae', 1),
(8, 'Combretaceae', 1),
(9, 'Cupressaceae', 1),
(10, 'Fabaceae', 1),
(11, 'Lamiaceae', 1),
(12, 'Lauraceae', 1),
(13, 'Malpighiaceae', 1),
(14, 'Malvaceae', 1),
(15, 'Meliaceae', 1),
(16, 'Moraceae', 1),
(17, 'Muntingiaceae', 1),
(18, 'Myrtacae', 1),
(19, 'Rubiaceae', 1),
(20, 'Rutaceae', 1),
(21, 'Salicaceae', 1),
(22, 'Sapindaceae', 1),
(23, 'Sapotaceae', 1),
(24, 'Urticaceae', 1),
(25, 'Verbenaceae', 1),
(40, 'Annonaceae', 0),
(41, 'Araucariaceae', 0),
(42, 'Oxalidaceae', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_generos`
--

CREATE TABLE `tbl_generos` (
  `gen_cve` int(11) NOT NULL,
  `fam_cve_gen` int(11) NOT NULL,
  `gen_nom` varchar(150) NOT NULL,
  `status_gen` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tbl_generos`
--

INSERT INTO `tbl_generos` (`gen_cve`, `fam_cve_gen`, `gen_nom`, `status_gen`) VALUES
(1, 1, 'Anacardium', 1),
(2, 1, 'Mangifera', 1),
(3, 2, 'Thevethia', 1),
(4, 3, 'Adonidia', 1),
(5, 3, 'Caryota', 1),
(6, 3, 'Cocos', 1),
(7, 3, 'Roystonea', 1),
(8, 3, 'Sabal', 1),
(9, 4, 'Crescentia', 1),
(10, 4, 'Handroanthus', 1),
(11, 4, 'Spathodea', 1),
(12, 4, 'Tabebuia', 1),
(13, 4, 'Tecoma', 1),
(14, 5, 'Cochlospermum', 1),
(15, 6, 'Bursera', 1),
(16, 7, 'Casuarina', 1),
(17, 8, 'Terminalia', 1),
(18, 9, 'Cupressus', 1),
(19, 10, 'Albizia', 1),
(20, 10, 'Andira', 1),
(21, 10, 'Bauhinia', 1),
(22, 10, 'Cassia', 1),
(23, 10, 'Delonix', 1),
(24, 10, 'Enterolobium', 1),
(25, 10, 'Gliricidia', 1),
(26, 10, 'Haematoxylum', 1),
(27, 10, 'Leucaena', 1),
(28, 10, 'Ormosia', 1),
(29, 10, 'Pithecellobium', 1),
(30, 10, 'Samanea', 1),
(31, 10, 'Tamarindus', 1),
(32, 11, 'Gmelina', 1),
(33, 12, 'Persea', 1),
(34, 13, 'Byrsonima', 1),
(35, 14, 'Ceiba', 1),
(36, 14, 'Guazuma', 1),
(37, 14, 'Sterculia', 1),
(38, 15, 'Azadirachta', 1),
(39, 15, 'Cedrela', 1),
(40, 15, 'Swietenia', 1),
(41, 16, 'Ficus', 1),
(42, 17, 'Muntingia', 1),
(43, 18, 'Eucalyptus', 1),
(44, 18, 'Pimenta', 1),
(45, 18, 'Psidium', 1),
(46, 18, 'Syzygium', 1),
(47, 19, 'Morinda', 1),
(48, 20, 'Citrus', 1),
(49, 21, 'Salix', 1),
(50, 22, 'Melicoccus', 1),
(51, 23, 'Chrysophyllum', 1),
(52, 24, 'Cecropia', 1),
(53, 25, 'Tectona', 0),
(68, 40, 'Annona', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_parametros_22`
--

CREATE TABLE `tbl_parametros_22` (
  `fl_denuncia` int(11) NOT NULL,
  `fl_verificacion` int(11) NOT NULL,
  `fl_predictamen` int(11) NOT NULL,
  `fl_dictamen` int(11) NOT NULL,
  `fl_seguimiento` int(11) NOT NULL,
  `fl_expediente` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tbl_parametros_22`
--

INSERT INTO `tbl_parametros_22` (`fl_denuncia`, `fl_verificacion`, `fl_predictamen`, `fl_dictamen`, `fl_seguimiento`, `fl_expediente`) VALUES
(233, 180, 160, 140, 120, 186),
(233, 180, 160, 140, 120, 186);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_predictamen`
--

CREATE TABLE `tbl_predictamen` (
  `id` int(11) NOT NULL,
  `expediente` int(4) NOT NULL,
  `accion` text NOT NULL,
  `opcion1` text NOT NULL,
  `opcion2` text NOT NULL,
  `opcion3` text NOT NULL,
  `opcion4` text NOT NULL,
  `opcion5` text NOT NULL,
  `opcion6` text NOT NULL,
  `opcion7` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_predictamen`
--

INSERT INTO `tbl_predictamen` (`id`, `expediente`, `accion`, `opcion1`, `opcion2`, `opcion3`, `opcion4`, `opcion5`, `opcion6`, `opcion7`) VALUES
(5, 1, 'DERRIBO', '', '', '', '', 'Obstrucción de la iluminación', '', ''),
(6, 3, 'PODA', 'Por seguridad (impostergable por los altos riesgos)', '', '', '', '', '', ''),
(8, 2, 'DERRIBO', 'Peligro para casa, edificio, obras públicas, monumentos y la vialidad', 'Dañan obras de servicio público, fachadas de edificios o monumentos históricos', 'Construcción o ampliación de calles, avenidas u otras obras de infraestructura vial', '', '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_usuario`
--

CREATE TABLE `tbl_usuario` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `correo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `telefono` bigint(12) NOT NULL,
  `contrasena` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tbl_usuario`
--

INSERT INTO `tbl_usuario` (`id`, `nombre`, `correo`, `telefono`, `contrasena`) VALUES
(9, 'Luis Avalos', 'luis@gmail.com', 2147483647, '123'),
(10, 'Victor Almeida', 'victor@gmail.com', 2147483647, 'abc'),
(11, 'niko', 'antonio@gmail.com', 2147483647, '1234'),
(12, 'wilbert', 'antonio@gmail.com', 2147483647, 'Antonio'),
(14, 'juan ', 'juan@gmail.com', 2147483647, '1234'),
(15, 'nando', 'fer@gmail.com', 9931207975, '2580');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_verificacion`
--

CREATE TABLE `tbl_verificacion` (
  `id` int(11) NOT NULL,
  `expediente` int(4) NOT NULL,
  `motivo` varchar(200) NOT NULL,
  `solicitante` varchar(60) NOT NULL,
  `folio` int(4) NOT NULL,
  `f_solic` varchar(12) NOT NULL,
  `h_veri` varchar(12) NOT NULL,
  `f_veri` varchar(12) NOT NULL,
  `dom_solic` varchar(80) NOT NULL,
  `nom_inspec` varchar(60) NOT NULL,
  `cant_arboles` varchar(3) NOT NULL,
  `especie_arbol` varchar(20) NOT NULL,
  `tipo_arbol` varchar(20) NOT NULL,
  `altura` varchar(3) NOT NULL,
  `alt_pecho` varchar(3) NOT NULL,
  `follaje` varchar(10) NOT NULL,
  `fuste_enfer` varchar(10) NOT NULL,
  `fuste_vandal` varchar(10) NOT NULL,
  `inclinacion` varchar(10) NOT NULL,
  `ramas_elec` varchar(10) NOT NULL,
  `raices_simiento` varchar(10) NOT NULL,
  `raices_hidraulica` varchar(10) NOT NULL,
  `raices_hidraulica2` varchar(10) NOT NULL,
  `ramas_exten` varchar(10) NOT NULL,
  `arbol_desplomarse` varchar(10) NOT NULL,
  `rama_peatonal` varchar(10) NOT NULL,
  `ramas_desga` varchar(10) NOT NULL,
  `predio` varchar(60) NOT NULL,
  `localizacion` varchar(10) NOT NULL,
  `obs_inspec` varchar(100) NOT NULL,
  `vista_atendio` varchar(60) NOT NULL,
  `dom_visita` varchar(100) NOT NULL,
  `declaracion` varchar(150) NOT NULL,
  `h_conclusion` varchar(12) NOT NULL,
  `f_conclusion` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_verificacion`
--

INSERT INTO `tbl_verificacion` (`id`, `expediente`, `motivo`, `solicitante`, `folio`, `f_solic`, `h_veri`, `f_veri`, `dom_solic`, `nom_inspec`, `cant_arboles`, `especie_arbol`, `tipo_arbol`, `altura`, `alt_pecho`, `follaje`, `fuste_enfer`, `fuste_vandal`, `inclinacion`, `ramas_elec`, `raices_simiento`, `raices_hidraulica`, `raices_hidraulica2`, `ramas_exten`, `arbol_desplomarse`, `rama_peatonal`, `ramas_desga`, `predio`, `localizacion`, `obs_inspec`, `vista_atendio`, `dom_visita`, `declaracion`, `h_conclusion`, `f_conclusion`) VALUES
(1, 1, 'Molesta porque se va luz por las ramas', 'Enrique Avalos Pérez', 225, '2023-01-11', '', '', 'El Espino', 'Victor Almeida', '2', 'Teca', 'Maderable', '11', '15', 'SI', 'Regular', 'Regular', 'Medio', 'Si', 'Poco', 'Regular', 'No', 'Si', 'Si', 'Si', 'Si', 'No', 'Parque, ár', 'Pues el arbol se va a derribar', 'Luis Avalos', '0', 'Que ojalá si lo derriben', '02:19', '2023-01-19'),
(2, 2, 'Cuando hay tormentas, las ramas del árbol interfieren con el cableado eléctrico. Pudiendo provocar más adelante la caída de dichos cables y causar daños', 'Luis Enrique Avalos Ramón', 224, '2022-11-29', '00:19', '2023-01-12', 'Carretera Villahermosa a Frontera km.32 Ranchería El Espino', 'Victor Almeida', '1', 'Guaya', 'Frutal', '16', '14', 'SI', 'Regular', 'Mucho', 'Medio', 'No', 'Mucho', 'Regular', 'No', 'Si', 'No', 'Si', 'No', 'Si', 'Propiedad ', 'Si se puede', 'Luis Avalos', '0', 'Lo que sea', '01:22', '2023-01-21'),
(7, 3, 'a veces el vecino espía, cuando se baña mi tia ', 'juan antonio', 223, '2023-03-31', '14:54', '2023-05-19', 'miguel hidalgo', 'niko', '2', 'Pino', 'Frutal', '15', '13', 'No', 'Regular', 'Regular', 'De 30° a 6', 'No', 'Regular', 'Poco', '', 'Si', 'Si', 'No', 'Si', 'Si', 'Vía públic', 'taehbstb', 'victor', 'nikolas', 'srtghdrt', '13:53', '2023-05-26');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbl_conciliacion`
--
ALTER TABLE `tbl_conciliacion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_csv`
--
ALTER TABLE `tbl_csv`
  ADD PRIMARY KEY (`Folio`);

--
-- Indices de la tabla `tbl_denuncia`
--
ALTER TABLE `tbl_denuncia`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_especies`
--
ALTER TABLE `tbl_especies`
  ADD PRIMARY KEY (`esp_cve`),
  ADD KEY `esp_cve_gen` (`esp_cve_gen`);

--
-- Indices de la tabla `tbl_familias`
--
ALTER TABLE `tbl_familias`
  ADD PRIMARY KEY (`fam_cve`);

--
-- Indices de la tabla `tbl_generos`
--
ALTER TABLE `tbl_generos`
  ADD PRIMARY KEY (`gen_cve`),
  ADD KEY `fam_cve_gen` (`fam_cve_gen`);

--
-- Indices de la tabla `tbl_predictamen`
--
ALTER TABLE `tbl_predictamen`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_usuario`
--
ALTER TABLE `tbl_usuario`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_verificacion`
--
ALTER TABLE `tbl_verificacion`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbl_conciliacion`
--
ALTER TABLE `tbl_conciliacion`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_denuncia`
--
ALTER TABLE `tbl_denuncia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `tbl_especies`
--
ALTER TABLE `tbl_especies`
  MODIFY `esp_cve` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT de la tabla `tbl_familias`
--
ALTER TABLE `tbl_familias`
  MODIFY `fam_cve` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT de la tabla `tbl_generos`
--
ALTER TABLE `tbl_generos`
  MODIFY `gen_cve` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT de la tabla `tbl_predictamen`
--
ALTER TABLE `tbl_predictamen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `tbl_usuario`
--
ALTER TABLE `tbl_usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `tbl_verificacion`
--
ALTER TABLE `tbl_verificacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
