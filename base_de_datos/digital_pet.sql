-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-04-2026 a las 01:41:22
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `digital_pet`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas`
--

CREATE TABLE `citas` (
  `id_citas` int(11) NOT NULL,
  `id_servicios` int(11) DEFAULT NULL,
  `id_usuarios` int(11) DEFAULT NULL,
  `id_estado` int(11) DEFAULT NULL,
  `id_mascotas` int(11) DEFAULT NULL,
  `cit_hora` time DEFAULT NULL,
  `cit_observacion` varchar(100) DEFAULT NULL,
  `cit_fecha` date DEFAULT NULL,
  `cit_tipo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `citas`
--

INSERT INTO `citas` (`id_citas`, `id_servicios`, `id_usuarios`, `id_estado`, `id_mascotas`, `cit_hora`, `cit_observacion`, `cit_fecha`, `cit_tipo`) VALUES
(1, 1, 3, 1, 1, '10:00:00', 'Control', '2026-04-01', 'Consulta'),
(2, 2, 4, 1, 2, '11:00:00', 'Vacuna', '2026-04-02', 'Vacunación'),
(3, 3, 3, 1, 3, '12:00:00', 'Baño', '2026-04-03', 'Estética'),
(4, 1, 4, 1, 4, '13:00:00', 'Revisión', '2026-04-04', 'Consulta'),
(5, 5, 3, 1, 5, '14:00:00', 'Check', '2026-04-05', 'Control');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consultas`
--

CREATE TABLE `consultas` (
  `id_consultas` int(11) NOT NULL,
  `id_citas` int(11) DEFAULT NULL,
  `id_usuarios` int(11) DEFAULT NULL,
  `id_historial_clinico` int(11) DEFAULT NULL,
  `con_fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `con_motivo` varchar(100) DEFAULT NULL,
  `con_diagnosticos` varchar(100) DEFAULT NULL,
  `con_tratamientos` varchar(100) DEFAULT NULL,
  `con_observaciones` varchar(100) DEFAULT NULL,
  `con_temperatura` decimal(4,2) DEFAULT NULL,
  `con_proxima_visita` date DEFAULT NULL,
  `con_peso_actual` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `consultas`
--

INSERT INTO `consultas` (`id_consultas`, `id_citas`, `id_usuarios`, `id_historial_clinico`, `con_fecha`, `con_motivo`, `con_diagnosticos`, `con_tratamientos`, `con_observaciones`, `con_temperatura`, `con_proxima_visita`, `con_peso_actual`) VALUES
(1, 1, 2, 1, '2026-04-07 20:57:25', 'Fiebre', 'Gripe', 'Medicamento', 'Ninguna', 38.50, '2026-04-10', 20.00),
(2, 2, 2, 2, '2026-04-02 16:00:00', 'Vacuna', 'Sano', 'Vacunar', 'OK', 37.50, '2026-05-01', 8.00),
(3, 3, 2, 3, '2026-04-03 17:00:00', 'Baño', 'Sucio', 'Limpieza', 'OK', 37.00, NULL, 5.00),
(4, 4, 2, 4, '2026-04-04 18:00:00', 'Control', 'Normal', 'Revisión', 'OK', 37.20, '2026-04-20', 6.00),
(5, 5, 2, 5, '2026-04-05 19:00:00', 'Parásitos', 'Lombrices', 'Pastillas', 'OK', 38.00, '2026-04-15', 15.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_factura`
--

CREATE TABLE `detalle_factura` (
  `id_detalles_facturas` int(11) NOT NULL,
  `id_facturas` int(11) DEFAULT NULL,
  `id_servicios` int(11) DEFAULT NULL,
  `id_productos` int(11) DEFAULT NULL,
  `det_total` decimal(10,2) DEFAULT NULL,
  `det_descuentos` decimal(10,2) DEFAULT NULL,
  `det_subtotal` decimal(10,2) DEFAULT NULL,
  `det_precio_unitario` decimal(10,2) DEFAULT NULL,
  `det_cantidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_factura`
--

INSERT INTO `detalle_factura` (`id_detalles_facturas`, `id_facturas`, `id_servicios`, `id_productos`, `det_total`, `det_descuentos`, `det_subtotal`, `det_precio_unitario`, `det_cantidad`) VALUES
(1, 1, 1, NULL, 50000.00, 0.00, 50000.00, 50000.00, 1),
(2, 2, 2, NULL, 30000.00, 0.00, 30000.00, 30000.00, 1),
(3, 3, 3, NULL, 20000.00, 0.00, 20000.00, 20000.00, 1),
(4, 4, 4, NULL, 100000.00, 0.00, 100000.00, 100000.00, 1),
(5, 5, 5, NULL, 25000.00, 0.00, 25000.00, 25000.00, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `devoluciones`
--

CREATE TABLE `devoluciones` (
  `id_devolucion` int(11) NOT NULL,
  `id_facturas` int(11) DEFAULT NULL,
  `id_usuarios` int(11) DEFAULT NULL,
  `id_productos` int(11) DEFAULT NULL,
  `dev_motivo` varchar(100) DEFAULT NULL,
  `dev_total` decimal(10,2) DEFAULT NULL,
  `id_estado` int(11) DEFAULT NULL,
  `dev_observaciones` varchar(100) DEFAULT NULL,
  `dev_monto` decimal(10,2) DEFAULT NULL,
  `dev_cantidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `devoluciones`
--

INSERT INTO `devoluciones` (`id_devolucion`, `id_facturas`, `id_usuarios`, `id_productos`, `dev_motivo`, `dev_total`, `id_estado`, `dev_observaciones`, `dev_monto`, `dev_cantidad`) VALUES
(1, 1, 3, 1, 'Dañado', 20000.00, 1, 'Producto roto', 20000.00, 1),
(2, 2, 4, 2, 'Vencido', 15000.00, 1, 'Fecha mala', 15000.00, 1),
(3, 3, 3, 3, 'Error', 12000.00, 1, 'Equivocado', 12000.00, 1),
(4, 4, 4, 4, 'Falla', 7000.00, 1, 'Defecto', 7000.00, 1),
(5, 5, 3, 5, 'No sirve', 8000.00, 1, 'Malo', 8000.00, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidades`
--

CREATE TABLE `especialidades` (
  `id_especialidades` int(11) NOT NULL,
  `esp_nombre` varchar(50) DEFAULT NULL,
  `esp_descripcion` varchar(100) DEFAULT NULL,
  `id_estado` int(11) DEFAULT NULL,
  `id_roles` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `especialidades`
--

INSERT INTO `especialidades` (`id_especialidades`, `esp_nombre`, `esp_descripcion`, `id_estado`, `id_roles`) VALUES
(1, 'Cirugía', 'Operaciones', 1, 2),
(2, 'Dermatología', 'Piel', 1, 2),
(3, 'General', 'Básico', 1, 2),
(4, 'Odontología', 'Dientes', 1, 2),
(5, 'Urgencias', 'Emergencias', 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

CREATE TABLE `estados` (
  `id_estados` int(11) NOT NULL,
  `id_tipo_estado` int(11) DEFAULT NULL,
  `est_fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `est_fecha_modificacion` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `est_nombre` varchar(50) DEFAULT NULL,
  `est_descripcion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estados`
--

INSERT INTO `estados` (`id_estados`, `id_tipo_estado`, `est_fecha_creacion`, `est_fecha_modificacion`, `est_nombre`, `est_descripcion`) VALUES
(1, 1, '2026-01-01 15:00:00', NULL, 'Activo', 'Disponible'),
(2, 2, '2026-01-02 16:00:00', NULL, 'Inactivo', 'No disponible'),
(3, 3, '2026-01-03 17:00:00', NULL, 'Pendiente', 'En espera'),
(4, 1, '2026-01-04 18:00:00', NULL, 'Activo', 'Habilitado'),
(5, 2, '2026-01-05 19:00:00', NULL, 'Inactivo', 'Deshabilitado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `id_facturas` int(11) NOT NULL,
  `id_usuarios` int(11) DEFAULT NULL,
  `id_estado` int(11) DEFAULT NULL,
  `fac_metodo_pago` varchar(50) DEFAULT NULL,
  `fac_fecha` date DEFAULT NULL,
  `fac_subtotal` decimal(10,2) DEFAULT NULL,
  `fac_monto` decimal(10,2) DEFAULT NULL,
  `fac_impuesto` decimal(10,2) DEFAULT NULL,
  `fac_observaciones` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`id_facturas`, `id_usuarios`, `id_estado`, `fac_metodo_pago`, `fac_fecha`, `fac_subtotal`, `fac_monto`, `fac_impuesto`, `fac_observaciones`) VALUES
(1, 3, 1, 'Efectivo', '2026-04-01', 50000.00, 59500.00, 9500.00, NULL),
(2, 4, 1, 'Tarjeta', '2026-04-02', 30000.00, 35700.00, 5700.00, NULL),
(3, 3, 1, 'Efectivo', '2026-04-03', 20000.00, 23800.00, 3800.00, NULL),
(4, 4, 1, 'Transferencia', '2026-04-04', 100000.00, 119000.00, 19000.00, NULL),
(5, 3, 1, 'Efectivo', '2026-04-05', 25000.00, 29750.00, 4750.00, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_clinico`
--

CREATE TABLE `historial_clinico` (
  `id_historial_clinico` int(11) NOT NULL,
  `id_mascotas` int(11) DEFAULT NULL,
  `id_estado` int(11) DEFAULT NULL,
  `his_fecha_apertura` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `historial_clinico`
--

INSERT INTO `historial_clinico` (`id_historial_clinico`, `id_mascotas`, `id_estado`, `his_fecha_apertura`) VALUES
(1, 1, 1, '2026-01-01 15:00:00'),
(2, 2, 1, '2026-01-02 16:00:00'),
(3, 3, 1, '2026-01-03 17:00:00'),
(4, 4, 1, '2026-01-04 18:00:00'),
(5, 5, 1, '2026-01-05 19:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mascotas`
--

CREATE TABLE `mascotas` (
  `id_mascotas` int(11) NOT NULL,
  `id_usuarios` int(11) DEFAULT NULL,
  `id_estado` int(11) DEFAULT NULL,
  `mas_peso` decimal(5,2) DEFAULT NULL,
  `mas_raza` varchar(50) DEFAULT NULL,
  `mas_nombre` varchar(50) DEFAULT NULL,
  `mas_genero` varchar(20) DEFAULT NULL,
  `mas_fecha_nacimiento` date DEFAULT NULL,
  `mas_especie` varchar(50) DEFAULT NULL,
  `mas_color` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `mascotas`
--

INSERT INTO `mascotas` (`id_mascotas`, `id_usuarios`, `id_estado`, `mas_peso`, `mas_raza`, `mas_nombre`, `mas_genero`, `mas_fecha_nacimiento`, `mas_especie`, `mas_color`) VALUES
(1, 3, 1, 20.00, 'Labrador', 'Max', 'Macho', '2020-01-01', 'Perro', 'Negro'),
(2, 4, 1, 8.00, 'Persa', 'Luna', 'Hembra', '2021-02-01', 'Gato', 'Blanco'),
(3, 3, 1, 5.00, 'Pincher', 'Rex', 'Macho', '2022-03-01', 'Perro', 'Marrón'),
(4, 4, 1, 6.00, 'Siamés', 'Misu', 'Hembra', '2021-04-01', 'Gato', 'Gris'),
(5, 3, 1, 15.00, 'Bulldog', 'Toby', 'Macho', '2019-05-01', 'Perro', 'Blanco');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientos`
--

CREATE TABLE `movimientos` (
  `id_movimientos` int(11) NOT NULL,
  `id_usuarios` int(11) DEFAULT NULL,
  `id_facturas` int(11) DEFAULT NULL,
  `id_devolucion` int(11) DEFAULT NULL,
  `id_productos` int(11) DEFAULT NULL,
  `id_estado` int(11) DEFAULT NULL,
  `mov_cantidad` int(11) DEFAULT NULL,
  `mov_hora` time DEFAULT NULL,
  `mov_motivo` varchar(50) DEFAULT NULL,
  `mov_observaciones` varchar(100) DEFAULT NULL,
  `mov_tipo` varchar(20) DEFAULT NULL,
  `mov_fecha` date DEFAULT NULL,
  `mov_valor_total` decimal(10,2) DEFAULT NULL,
  `mov_stock_unitario` int(11) DEFAULT NULL,
  `mov_stock_nuevo` int(11) DEFAULT NULL,
  `mov_stock_anterior` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `movimientos`
--

INSERT INTO `movimientos` (`id_movimientos`, `id_usuarios`, `id_facturas`, `id_devolucion`, `id_productos`, `id_estado`, `mov_cantidad`, `mov_hora`, `mov_motivo`, `mov_observaciones`, `mov_tipo`, `mov_fecha`, `mov_valor_total`, `mov_stock_unitario`, `mov_stock_nuevo`, `mov_stock_anterior`) VALUES
(1, 1, 1, NULL, 1, 1, 1, '10:00:00', 'Venta', 'OK', 'Salida', '2026-04-01', 20000.00, 20, 80, 100),
(2, 1, 2, NULL, 2, 1, 1, '11:00:00', 'Venta', 'OK', 'Salida', '2026-04-02', 15000.00, 15, 65, 80),
(3, 1, NULL, 1, 3, 1, 1, '12:00:00', 'Devolución', 'OK', 'Entrada', '2026-04-03', 12000.00, 12, 72, 60),
(4, 1, 3, NULL, 4, 1, 1, '13:00:00', 'Venta', 'OK', 'Salida', '2026-04-04', 7000.00, 7, 193, 200),
(5, 1, 4, NULL, 5, 1, 1, '14:00:00', 'Venta', 'OK', 'Salida', '2026-04-05', 8000.00, 8, 142, 150);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_productos` int(11) NOT NULL,
  `pro_marca` varchar(50) DEFAULT NULL,
  `pro_lote` varchar(50) DEFAULT NULL,
  `pro_descripcion` varchar(100) DEFAULT NULL,
  `pro_stock_anual` int(11) DEFAULT NULL,
  `pro_stock_minimo` int(11) DEFAULT NULL,
  `pro_unidad_medida` varchar(20) DEFAULT NULL,
  `pro_categoria` varchar(50) DEFAULT NULL,
  `pro_nombre` varchar(50) DEFAULT NULL,
  `pro_precio_compra` decimal(10,2) DEFAULT NULL,
  `pro_precio_venta` decimal(10,2) DEFAULT NULL,
  `pro_fecha_vencimiento` date DEFAULT NULL,
  `id_proveedores` int(11) DEFAULT NULL,
  `id_estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_productos`, `pro_marca`, `pro_lote`, `pro_descripcion`, `pro_stock_anual`, `pro_stock_minimo`, `pro_unidad_medida`, `pro_categoria`, `pro_nombre`, `pro_precio_compra`, `pro_precio_venta`, `pro_fecha_vencimiento`, `id_proveedores`, `id_estado`) VALUES
(1, 'Pfizer', 'L1', 'Vacuna', 100, 10, 'Unidad', 'Salud', 'Rabia', 10000.00, 20000.00, '2027-01-01', 1, 1),
(2, 'Bayer', 'L2', 'Pulgas', 80, 10, 'Unidad', 'Salud', 'Pulgas', 8000.00, 15000.00, '2026-12-01', 1, 1),
(3, 'Genfar', 'L3', 'Parásitos', 60, 5, 'Unidad', 'Salud', 'Desparasite', 5000.00, 12000.00, '2026-11-01', 2, 1),
(4, 'ProPlan', 'L4', 'Comida', 200, 20, 'Kg', 'Alimento', 'Perro', 4000.00, 7000.00, '2026-10-01', 3, 1),
(5, 'Royal', 'L5', 'Gato', 150, 15, 'Kg', 'Alimento', 'Gato', 5000.00, 8000.00, '2026-09-01', 4, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id_proveedor` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `id_usuarios` int(11) DEFAULT NULL,
  `prov_nit` varchar(20) DEFAULT NULL,
  `prov_direccion` varchar(100) DEFAULT NULL,
  `id_estado` int(11) DEFAULT NULL,
  `prov_correo` varchar(100) DEFAULT NULL,
  `prov_telefono` varchar(20) DEFAULT NULL,
  `prov_ciudad` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`id_proveedor`, `nombre`, `id_usuarios`, `prov_nit`, `prov_direccion`, `id_estado`, `prov_correo`, `prov_telefono`, `prov_ciudad`) VALUES
(1, 'Prov1', 1, '9001', 'Calle1', 1, 'p1@mail.com', '3001', 'Bogotá'),
(2, 'Prov2', 1, '9002', 'Calle2', 1, 'p2@mail.com', '3002', 'Cali'),
(3, 'Prov3', 1, '9003', 'Calle3', 1, 'p3@mail.com', '3003', 'Medellín'),
(4, 'Prov4', 1, '9004', 'Calle4', 1, 'p4@mail.com', '3004', 'Barranquilla'),
(5, 'Prov5', 1, '9005', 'Calle5', 1, 'p5@mail.com', '3005', 'Cartagena');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_roles` int(11) NOT NULL,
  `rol_nombre` varchar(50) DEFAULT NULL,
  `rol_descripcion` varchar(100) DEFAULT NULL,
  `id_estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_roles`, `rol_nombre`, `rol_descripcion`, `id_estado`) VALUES
(1, 'Admin', 'Administrador', 1),
(2, 'Veterinario', 'Médico', 1),
(3, 'Cliente', 'Dueño', 1),
(4, 'Recepcionista', 'Citas', 1),
(5, 'Invitado', 'Limitado', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE `servicio` (
  `id_servicio` int(11) NOT NULL,
  `ser_nombre` varchar(50) DEFAULT NULL,
  `ser_duracion` int(11) DEFAULT NULL,
  `ser_precio` decimal(10,2) DEFAULT NULL,
  `ser_descripcion` varchar(100) DEFAULT NULL,
  `id_estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `servicio`
--

INSERT INTO `servicio` (`id_servicio`, `ser_nombre`, `ser_duracion`, `ser_precio`, `ser_descripcion`, `id_estado`) VALUES
(1, 'Consulta', 30, 50000.00, 'General', 1),
(2, 'Vacuna', 15, 30000.00, 'Rabia', 1),
(3, 'Baño', 40, 20000.00, 'Limpieza', 1),
(4, 'Cirugía', 120, 200000.00, 'Operación', 1),
(5, 'Control', 20, 25000.00, 'Revisión', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_estado`
--

CREATE TABLE `tipo_estado` (
  `id_tipo_estado` int(11) NOT NULL,
  `tie_nombre` varchar(50) DEFAULT NULL,
  `tie_descripcion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_estado`
--

INSERT INTO `tipo_estado` (`id_tipo_estado`, `tie_nombre`, `tie_descripcion`) VALUES
(1, 'Activo', 'Registro activo'),
(2, 'Inactivo', 'Registro inactivo'),
(3, 'Pendiente', 'En proceso'),
(4, 'Bloqueado', 'Acceso restringido'),
(5, 'Eliminado', 'Registro eliminado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_movimiento`
--

CREATE TABLE `tipo_movimiento` (
  `id_tipo_movimiento` int(11) NOT NULL,
  `id_devolucion` int(11) DEFAULT NULL,
  `id_usuarios` int(11) DEFAULT NULL,
  `tipmovi_entrada` int(11) DEFAULT NULL,
  `tipmovi_salida` int(11) DEFAULT NULL,
  `tipmovi_fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_movimiento`
--

INSERT INTO `tipo_movimiento` (`id_tipo_movimiento`, `id_devolucion`, `id_usuarios`, `tipmovi_entrada`, `tipmovi_salida`, `tipmovi_fecha`) VALUES
(1, 1, 1, 1, 0, '2026-04-01 15:00:00'),
(2, NULL, 1, 0, 1, '2026-04-02 16:00:00'),
(3, 2, 1, 1, 0, '2026-04-03 17:00:00'),
(4, NULL, 1, 0, 1, '2026-04-04 18:00:00'),
(5, 3, 1, 1, 0, '2026-04-05 19:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuarios` int(11) NOT NULL,
  `id_roles` int(11) DEFAULT NULL,
  `id_estado` int(11) DEFAULT NULL,
  `usu_correo` varchar(100) DEFAULT NULL,
  `usu_fecha_registro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `usu_nombre` varchar(50) DEFAULT NULL,
  `usu_contrasena` varchar(50) DEFAULT NULL,
  `usu_apellido` varchar(50) DEFAULT NULL,
  `usu_telefono` varchar(20) DEFAULT NULL,
  `usu_cedula` varchar(20) DEFAULT NULL,
  `usu_direccion` varchar(100) DEFAULT NULL,
  `usu_tarjeta_profesional` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuarios`, `id_roles`, `id_estado`, `usu_correo`, `usu_fecha_registro`, `usu_nombre`, `usu_contrasena`, `usu_apellido`, `usu_telefono`, `usu_cedula`, `usu_direccion`, `usu_tarjeta_profesional`) VALUES
(1, 1, 1, 'admin@pet.com', '2026-01-01 15:00:00', 'Carlos', '123456', 'Lopez', '3001111111', '1001', 'Calle 1', NULL),
(2, 2, 1, 'vet1@pet.com', '2026-01-02 16:00:00', 'Ana', '123456', 'Martinez', '3002222222', '1002', 'Calle 2', 'TP001'),
(3, 3, 1, 'cliente1@pet.com', '2026-01-03 17:00:00', 'Luis', '123456', 'Perez', '3003333333', '1003', 'Calle 3', NULL),
(4, 3, 1, 'cliente2@pet.com', '2026-01-04 18:00:00', 'Maria', '123456', 'Gomez', '3004444444', '1004', 'Calle 4', NULL),
(5, 4, 1, 'recep@pet.com', '2026-01-05 19:00:00', 'Jorge', '123456', 'Ruiz', '3005555555', '1005', 'Calle 5', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `veterinario`
--

CREATE TABLE `veterinario` (
  `ID_VETERINARIO` int(11) NOT NULL,
  `ID_USUARIOS` int(11) NOT NULL,
  `ID_ESPECIALIDADES` int(11) NOT NULL,
  `ID_ESTADO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `veterinario`
--

INSERT INTO `veterinario` (`ID_VETERINARIO`, `ID_USUARIOS`, `ID_ESPECIALIDADES`, `ID_ESTADO`) VALUES
(1, 2, 1, 1),
(2, 2, 2, 1),
(3, 2, 3, 1),
(4, 2, 4, 1),
(5, 2, 5, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`id_citas`),
  ADD KEY `id_servicios` (`id_servicios`),
  ADD KEY `id_usuarios` (`id_usuarios`),
  ADD KEY `id_estado` (`id_estado`),
  ADD KEY `id_mascotas` (`id_mascotas`);

--
-- Indices de la tabla `consultas`
--
ALTER TABLE `consultas`
  ADD PRIMARY KEY (`id_consultas`),
  ADD KEY `id_citas` (`id_citas`),
  ADD KEY `id_usuarios` (`id_usuarios`),
  ADD KEY `id_historial_clinico` (`id_historial_clinico`);

--
-- Indices de la tabla `detalle_factura`
--
ALTER TABLE `detalle_factura`
  ADD PRIMARY KEY (`id_detalles_facturas`),
  ADD KEY `id_facturas` (`id_facturas`),
  ADD KEY `id_servicios` (`id_servicios`),
  ADD KEY `id_productos` (`id_productos`);

--
-- Indices de la tabla `devoluciones`
--
ALTER TABLE `devoluciones`
  ADD PRIMARY KEY (`id_devolucion`),
  ADD KEY `id_facturas` (`id_facturas`),
  ADD KEY `id_usuarios` (`id_usuarios`),
  ADD KEY `id_productos` (`id_productos`),
  ADD KEY `id_estado` (`id_estado`);

--
-- Indices de la tabla `especialidades`
--
ALTER TABLE `especialidades`
  ADD PRIMARY KEY (`id_especialidades`),
  ADD KEY `id_estado` (`id_estado`),
  ADD KEY `id_roles` (`id_roles`);

--
-- Indices de la tabla `estados`
--
ALTER TABLE `estados`
  ADD PRIMARY KEY (`id_estados`),
  ADD KEY `id_tipo_estado` (`id_tipo_estado`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`id_facturas`),
  ADD KEY `id_usuarios` (`id_usuarios`),
  ADD KEY `id_estado` (`id_estado`);

--
-- Indices de la tabla `historial_clinico`
--
ALTER TABLE `historial_clinico`
  ADD PRIMARY KEY (`id_historial_clinico`),
  ADD KEY `id_mascotas` (`id_mascotas`),
  ADD KEY `id_estado` (`id_estado`);

--
-- Indices de la tabla `mascotas`
--
ALTER TABLE `mascotas`
  ADD PRIMARY KEY (`id_mascotas`),
  ADD KEY `id_usuarios` (`id_usuarios`),
  ADD KEY `id_estado` (`id_estado`);

--
-- Indices de la tabla `movimientos`
--
ALTER TABLE `movimientos`
  ADD PRIMARY KEY (`id_movimientos`),
  ADD KEY `id_usuarios` (`id_usuarios`),
  ADD KEY `id_facturas` (`id_facturas`),
  ADD KEY `id_devolucion` (`id_devolucion`),
  ADD KEY `id_productos` (`id_productos`),
  ADD KEY `id_estado` (`id_estado`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_productos`),
  ADD KEY `id_proveedores` (`id_proveedores`),
  ADD KEY `id_estado` (`id_estado`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id_proveedor`),
  ADD KEY `id_usuarios` (`id_usuarios`),
  ADD KEY `id_estado` (`id_estado`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_roles`),
  ADD KEY `id_estado` (`id_estado`);

--
-- Indices de la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`id_servicio`),
  ADD KEY `id_estado` (`id_estado`);

--
-- Indices de la tabla `tipo_estado`
--
ALTER TABLE `tipo_estado`
  ADD PRIMARY KEY (`id_tipo_estado`);

--
-- Indices de la tabla `tipo_movimiento`
--
ALTER TABLE `tipo_movimiento`
  ADD PRIMARY KEY (`id_tipo_movimiento`),
  ADD KEY `id_devolucion` (`id_devolucion`),
  ADD KEY `id_usuarios` (`id_usuarios`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuarios`),
  ADD KEY `id_roles` (`id_roles`),
  ADD KEY `id_estado` (`id_estado`);

--
-- Indices de la tabla `veterinario`
--
ALTER TABLE `veterinario`
  ADD PRIMARY KEY (`ID_VETERINARIO`),
  ADD KEY `ID_USUARIOS` (`ID_USUARIOS`),
  ADD KEY `ID_ESPECIALIDADES` (`ID_ESPECIALIDADES`),
  ADD KEY `ID_ESTADO` (`ID_ESTADO`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `mascotas`
--
ALTER TABLE `mascotas`
  MODIFY `id_mascotas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `veterinario`
--
ALTER TABLE `veterinario`
  MODIFY `ID_VETERINARIO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `citas`
--
ALTER TABLE `citas`
  ADD CONSTRAINT `citas_ibfk_1` FOREIGN KEY (`id_servicios`) REFERENCES `servicio` (`id_servicio`),
  ADD CONSTRAINT `citas_ibfk_2` FOREIGN KEY (`id_usuarios`) REFERENCES `usuarios` (`id_usuarios`),
  ADD CONSTRAINT `citas_ibfk_3` FOREIGN KEY (`id_estado`) REFERENCES `estados` (`id_estados`),
  ADD CONSTRAINT `citas_ibfk_4` FOREIGN KEY (`id_mascotas`) REFERENCES `mascotas` (`id_mascotas`);

--
-- Filtros para la tabla `consultas`
--
ALTER TABLE `consultas`
  ADD CONSTRAINT `consultas_ibfk_1` FOREIGN KEY (`id_citas`) REFERENCES `citas` (`id_citas`),
  ADD CONSTRAINT `consultas_ibfk_2` FOREIGN KEY (`id_usuarios`) REFERENCES `usuarios` (`id_usuarios`),
  ADD CONSTRAINT `consultas_ibfk_3` FOREIGN KEY (`id_historial_clinico`) REFERENCES `historial_clinico` (`id_historial_clinico`);

--
-- Filtros para la tabla `detalle_factura`
--
ALTER TABLE `detalle_factura`
  ADD CONSTRAINT `detalle_factura_ibfk_1` FOREIGN KEY (`id_facturas`) REFERENCES `factura` (`id_facturas`),
  ADD CONSTRAINT `detalle_factura_ibfk_2` FOREIGN KEY (`id_servicios`) REFERENCES `servicio` (`id_servicio`),
  ADD CONSTRAINT `detalle_factura_ibfk_3` FOREIGN KEY (`id_productos`) REFERENCES `productos` (`id_productos`);

--
-- Filtros para la tabla `devoluciones`
--
ALTER TABLE `devoluciones`
  ADD CONSTRAINT `devoluciones_ibfk_1` FOREIGN KEY (`id_facturas`) REFERENCES `factura` (`id_facturas`),
  ADD CONSTRAINT `devoluciones_ibfk_2` FOREIGN KEY (`id_usuarios`) REFERENCES `usuarios` (`id_usuarios`),
  ADD CONSTRAINT `devoluciones_ibfk_3` FOREIGN KEY (`id_productos`) REFERENCES `productos` (`id_productos`),
  ADD CONSTRAINT `devoluciones_ibfk_4` FOREIGN KEY (`id_estado`) REFERENCES `estados` (`id_estados`);

--
-- Filtros para la tabla `especialidades`
--
ALTER TABLE `especialidades`
  ADD CONSTRAINT `especialidades_ibfk_1` FOREIGN KEY (`id_estado`) REFERENCES `estados` (`id_estados`),
  ADD CONSTRAINT `especialidades_ibfk_2` FOREIGN KEY (`id_roles`) REFERENCES `roles` (`id_roles`);

--
-- Filtros para la tabla `estados`
--
ALTER TABLE `estados`
  ADD CONSTRAINT `estados_ibfk_1` FOREIGN KEY (`id_tipo_estado`) REFERENCES `tipo_estado` (`id_tipo_estado`);

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`id_usuarios`) REFERENCES `usuarios` (`id_usuarios`),
  ADD CONSTRAINT `factura_ibfk_2` FOREIGN KEY (`id_estado`) REFERENCES `estados` (`id_estados`);

--
-- Filtros para la tabla `historial_clinico`
--
ALTER TABLE `historial_clinico`
  ADD CONSTRAINT `historial_clinico_ibfk_1` FOREIGN KEY (`id_mascotas`) REFERENCES `mascotas` (`id_mascotas`),
  ADD CONSTRAINT `historial_clinico_ibfk_2` FOREIGN KEY (`id_estado`) REFERENCES `estados` (`id_estados`);

--
-- Filtros para la tabla `mascotas`
--
ALTER TABLE `mascotas`
  ADD CONSTRAINT `mascotas_ibfk_1` FOREIGN KEY (`id_usuarios`) REFERENCES `usuarios` (`id_usuarios`),
  ADD CONSTRAINT `mascotas_ibfk_2` FOREIGN KEY (`id_estado`) REFERENCES `estados` (`id_estados`);

--
-- Filtros para la tabla `movimientos`
--
ALTER TABLE `movimientos`
  ADD CONSTRAINT `movimientos_ibfk_1` FOREIGN KEY (`id_usuarios`) REFERENCES `usuarios` (`id_usuarios`),
  ADD CONSTRAINT `movimientos_ibfk_2` FOREIGN KEY (`id_facturas`) REFERENCES `factura` (`id_facturas`),
  ADD CONSTRAINT `movimientos_ibfk_3` FOREIGN KEY (`id_devolucion`) REFERENCES `devoluciones` (`id_devolucion`),
  ADD CONSTRAINT `movimientos_ibfk_4` FOREIGN KEY (`id_productos`) REFERENCES `productos` (`id_productos`),
  ADD CONSTRAINT `movimientos_ibfk_5` FOREIGN KEY (`id_estado`) REFERENCES `estados` (`id_estados`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_proveedores`) REFERENCES `proveedores` (`id_proveedor`),
  ADD CONSTRAINT `productos_ibfk_2` FOREIGN KEY (`id_estado`) REFERENCES `estados` (`id_estados`);

--
-- Filtros para la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD CONSTRAINT `proveedores_ibfk_1` FOREIGN KEY (`id_usuarios`) REFERENCES `usuarios` (`id_usuarios`),
  ADD CONSTRAINT `proveedores_ibfk_2` FOREIGN KEY (`id_estado`) REFERENCES `estados` (`id_estados`);

--
-- Filtros para la tabla `roles`
--
ALTER TABLE `roles`
  ADD CONSTRAINT `roles_ibfk_1` FOREIGN KEY (`id_estado`) REFERENCES `estados` (`id_estados`);

--
-- Filtros para la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD CONSTRAINT `servicio_ibfk_1` FOREIGN KEY (`id_estado`) REFERENCES `estados` (`id_estados`);

--
-- Filtros para la tabla `tipo_movimiento`
--
ALTER TABLE `tipo_movimiento`
  ADD CONSTRAINT `tipo_movimiento_ibfk_1` FOREIGN KEY (`id_devolucion`) REFERENCES `devoluciones` (`id_devolucion`),
  ADD CONSTRAINT `tipo_movimiento_ibfk_2` FOREIGN KEY (`id_usuarios`) REFERENCES `usuarios` (`id_usuarios`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_roles`) REFERENCES `roles` (`id_roles`),
  ADD CONSTRAINT `usuarios_ibfk_2` FOREIGN KEY (`id_estado`) REFERENCES `estados` (`id_estados`);

--
-- Filtros para la tabla `veterinario`
--
ALTER TABLE `veterinario`
  ADD CONSTRAINT `veterinario_ibfk_1` FOREIGN KEY (`ID_USUARIOS`) REFERENCES `usuarios` (`id_usuarios`),
  ADD CONSTRAINT `veterinario_ibfk_2` FOREIGN KEY (`ID_ESPECIALIDADES`) REFERENCES `especialidades` (`id_especialidades`),
  ADD CONSTRAINT `veterinario_ibfk_3` FOREIGN KEY (`ID_ESTADO`) REFERENCES `estados` (`id_estados`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
