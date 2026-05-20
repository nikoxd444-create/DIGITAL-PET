-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 20-05-2026 a las 16:51:16
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
-- Estructura de tabla para la tabla `archivos_clinicos`
--

CREATE TABLE `archivos_clinicos` (
  `ID_ARCHIVO` int(11) NOT NULL,
  `ID_CONSULTAS` int(11) NOT NULL,
  `ARC_NOMBRE` varchar(100) DEFAULT NULL,
  `ARC_URL` varchar(255) DEFAULT NULL,
  `ARC_TIPO` varchar(50) DEFAULT NULL,
  `ARC_FECHA` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auditoria`
--

CREATE TABLE `auditoria` (
  `ID_AUDITORIA` int(11) NOT NULL,
  `ID_USUARIOS` int(11) DEFAULT NULL,
  `ACCION` varchar(100) DEFAULT NULL,
  `TABLA_AFECTADA` varchar(100) DEFAULT NULL,
  `FECHA_ACCION` datetime NOT NULL,
  `DETALLE` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas`
--

CREATE TABLE `citas` (
  `ID_CITAS` int(11) NOT NULL,
  `ID_SERVICIO` int(11) NOT NULL,
  `ID_USUARIOS` int(11) NOT NULL,
  `ID_MASCOTAS` int(11) NOT NULL,
  `ID_VETERINARIO` int(11) NOT NULL,
  `ID_CONSULTORIO` int(11) DEFAULT NULL,
  `ID_ESTADO` int(11) NOT NULL,
  `CIT_FECHA` date NOT NULL,
  `CIT_HORA` time NOT NULL,
  `CIT_OBSERVACION` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `ID_COMPRA` int(11) NOT NULL,
  `ID_PROVEEDOR` int(11) NOT NULL,
  `FECHA_COMPRA` date NOT NULL,
  `TOTAL_COMPRA` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consultas`
--

CREATE TABLE `consultas` (
  `ID_CONSULTAS` int(11) NOT NULL,
  `ID_CITAS` int(11) NOT NULL,
  `ID_VETERINARIO` int(11) NOT NULL,
  `ID_HISTORIAL_CLINICO` int(11) NOT NULL,
  `CON_FECHA` datetime NOT NULL,
  `CON_MOTIVO` varchar(500) DEFAULT NULL,
  `CON_DIAGNOSTICOS` text DEFAULT NULL,
  `CON_TRATAMIENTOS` text DEFAULT NULL,
  `CON_OBSERVACIONES` text DEFAULT NULL,
  `CON_TEMPERATURA` decimal(4,1) DEFAULT NULL,
  `CON_PESO_ACTUAL` decimal(5,2) DEFAULT NULL,
  `CON_PROXIMA_VISITA` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consultorios`
--

CREATE TABLE `consultorios` (
  `ID_CONSULTORIO` int(11) NOT NULL,
  `CON_NOMBRE` varchar(50) NOT NULL,
  `CON_UBICACION` varchar(100) DEFAULT NULL,
  `ID_ESTADO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_factura`
--

CREATE TABLE `detalles_factura` (
  `ID_DETALLES_FACTURAS` int(11) NOT NULL,
  `ID_FACTURAS` int(11) NOT NULL,
  `ID_SERVICIO` int(11) DEFAULT NULL,
  `ID_PRODUCTOS` int(11) DEFAULT NULL,
  `DET_CANTIDAD` int(11) DEFAULT NULL,
  `DET_PRECIO_UNITARIO` decimal(10,2) DEFAULT NULL,
  `DET_SUBTOTAL` decimal(10,2) DEFAULT NULL,
  `DET_DESCUENTOS` decimal(10,2) DEFAULT NULL,
  `DET_TOTAL` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidades`
--

CREATE TABLE `especialidades` (
  `ID_ESPECIALIDADES` int(11) NOT NULL,
  `ESP_NOMBRE` varchar(100) NOT NULL,
  `ESP_DESCRIPCION` varchar(300) DEFAULT NULL,
  `ID_ESTADO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

CREATE TABLE `estados` (
  `ID_ESTADOS` int(11) NOT NULL,
  `ID_TIPO_ESTADO` int(11) NOT NULL,
  `EST_NOMBRE` varchar(50) NOT NULL,
  `EST_DESCRIPCION` varchar(100) DEFAULT NULL,
  `EST_FECHA_CREACION` datetime NOT NULL,
  `EST_FECHA_MODIFICACION` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

CREATE TABLE `facturas` (
  `ID_FACTURAS` int(11) NOT NULL,
  `ID_USUARIOS` int(11) NOT NULL,
  `ID_ESTADO` int(11) NOT NULL,
  `FAC_METODO_PAGO` varchar(50) DEFAULT NULL,
  `FAC_FECHA` date NOT NULL,
  `FAC_SUBTOTAL` decimal(10,2) DEFAULT NULL,
  `FAC_IMPUESTO` decimal(10,2) DEFAULT NULL,
  `FAC_DESCUENTO` decimal(10,2) DEFAULT NULL,
  `FAC_MONTO` decimal(10,2) DEFAULT NULL,
  `FAC_OBSERVACIONES` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_clinico`
--

CREATE TABLE `historial_clinico` (
  `ID_HISTORIAL_CLINICO` int(11) NOT NULL,
  `ID_MASCOTAS` int(11) NOT NULL,
  `HIS_FECHA_APERTURA` datetime NOT NULL,
  `ID_ESTADO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mascotas`
--

CREATE TABLE `mascotas` (
  `ID_MASCOTAS` int(11) NOT NULL,
  `ID_USUARIOS` int(11) NOT NULL,
  `ID_ESTADO` int(11) NOT NULL,
  `MAS_NOMBRE` varchar(100) NOT NULL,
  `MAS_ESPECIE` varchar(50) NOT NULL,
  `MAS_RAZA` varchar(100) DEFAULT NULL,
  `MAS_COLOR` varchar(50) DEFAULT NULL,
  `MAS_GENERO` varchar(20) DEFAULT NULL,
  `MAS_FECHA_NACIMIENTO` date DEFAULT NULL,
  `MAS_PESO` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mascota_vacunas`
--

CREATE TABLE `mascota_vacunas` (
  `ID_MASCOTA_VACUNA` int(11) NOT NULL,
  `ID_MASCOTAS` int(11) NOT NULL,
  `ID_VACUNA` int(11) NOT NULL,
  `FECHA_APLICACION` date NOT NULL,
  `PROXIMA_DOSIS` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientos`
--

CREATE TABLE `movimientos` (
  `ID_MOVIMIENTOS` int(11) NOT NULL,
  `ID_USUARIOS` int(11) NOT NULL,
  `ID_PRODUCTOS` int(11) NOT NULL,
  `ID_FACTURAS` int(11) DEFAULT NULL,
  `ID_ESTADO` int(11) NOT NULL,
  `MOV_TIPO` enum('ENTRADA','SALIDA') NOT NULL,
  `MOV_CANTIDAD` int(11) NOT NULL,
  `MOV_FECHA` date NOT NULL,
  `MOV_HORA` time NOT NULL,
  `MOV_MOTIVO` varchar(100) DEFAULT NULL,
  `MOV_OBSERVACIONES` varchar(300) DEFAULT NULL,
  `MOV_VALOR_TOTAL` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `ID_PRODUCTOS` int(11) NOT NULL,
  `ID_PROVEEDOR` int(11) NOT NULL,
  `ID_ESTADO` int(11) NOT NULL,
  `PRO_NOMBRE` varchar(100) NOT NULL,
  `PRO_DESCRIPCION` varchar(300) DEFAULT NULL,
  `PRO_MARCA` varchar(50) DEFAULT NULL,
  `PRO_LOTE` varchar(50) DEFAULT NULL,
  `PRO_CATEGORIA` varchar(100) DEFAULT NULL,
  `PRO_UNIDAD_MEDIDA` varchar(20) DEFAULT NULL,
  `PRO_STOCK_ACTUAL` int(11) NOT NULL,
  `PRO_STOCK_MINIMO` int(11) NOT NULL,
  `PRO_PRECIO_COMPRA` decimal(10,2) DEFAULT NULL,
  `PRO_PRECIO_VENTA` decimal(10,2) DEFAULT NULL,
  `PRO_FECHA_VENCIMIENTO` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `ID_PROVEEDOR` int(11) NOT NULL,
  `PROV_NOMBRE` varchar(100) NOT NULL,
  `PROV_NIT` varchar(20) DEFAULT NULL,
  `PROV_DIRECCION` varchar(150) DEFAULT NULL,
  `PROV_CORREO` varchar(100) DEFAULT NULL,
  `PROV_TELEFONO` varchar(20) DEFAULT NULL,
  `PROV_CIUDAD` varchar(50) DEFAULT NULL,
  `ID_ESTADO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `ID_ROLES` int(11) NOT NULL,
  `ROL_NOMBRE` varchar(50) NOT NULL,
  `ROL_DESCRIPCION` varchar(150) DEFAULT NULL,
  `ID_ESTADO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `ID_SERVICIO` int(11) NOT NULL,
  `SER_NOMBRE` varchar(100) NOT NULL,
  `SER_DESCRIPCION` varchar(300) DEFAULT NULL,
  `SER_DURACION_MIN` int(11) NOT NULL,
  `SER_PRECIO` decimal(10,2) NOT NULL,
  `ID_ESTADO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_de_estado`
--

CREATE TABLE `tipos_de_estado` (
  `ID_TIPO_ESTADO` int(11) NOT NULL,
  `TIE_NOMBRE` varchar(50) NOT NULL,
  `TIE_DESCRIPCION` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `ID_USUARIOS` int(11) NOT NULL,
  `ID_ROLES` int(11) NOT NULL,
  `ID_ESTADO` int(11) NOT NULL,
  `USU_CORREO` varchar(100) NOT NULL,
  `USU_CONTRASENA` varchar(255) NOT NULL,
  `USU_NOMBRE` varchar(50) NOT NULL,
  `USU_APELLIDO` varchar(50) NOT NULL,
  `USU_TELEFONO` varchar(20) DEFAULT NULL,
  `USU_CEDULA` varchar(20) DEFAULT NULL,
  `USU_DIRECCION` varchar(150) DEFAULT NULL,
  `USU_FECHA_REGISTRO` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vacunas`
--

CREATE TABLE `vacunas` (
  `ID_VACUNA` int(11) NOT NULL,
  `VAC_NOMBRE` varchar(100) NOT NULL,
  `VAC_DESCRIPCION` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `vacunas`
--

INSERT INTO `vacunas` (`ID_VACUNA`, `VAC_NOMBRE`, `VAC_DESCRIPCION`) VALUES
(1, 'Rabia', 'Vacuna antirrábica'),
(2, 'Triple Felina', 'Vacuna para gatos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `veterinarios`
--

CREATE TABLE `veterinarios` (
  `ID_VETERINARIO` int(11) NOT NULL,
  `ID_USUARIOS` int(11) NOT NULL,
  `TARJETA_PROFESIONAL` varchar(50) DEFAULT NULL,
  `ANOS_EXPERIENCIA` int(11) DEFAULT NULL,
  `ID_ESTADO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `veterinario_especialidad`
--

CREATE TABLE `veterinario_especialidad` (
  `ID_VETERINARIO_ESPECIALIDAD` int(11) NOT NULL,
  `ID_VETERINARIO` int(11) NOT NULL,
  `ID_ESPECIALIDADES` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `archivos_clinicos`
--
ALTER TABLE `archivos_clinicos`
  ADD PRIMARY KEY (`ID_ARCHIVO`),
  ADD KEY `ID_CONSULTAS` (`ID_CONSULTAS`);

--
-- Indices de la tabla `auditoria`
--
ALTER TABLE `auditoria`
  ADD PRIMARY KEY (`ID_AUDITORIA`),
  ADD KEY `ID_USUARIOS` (`ID_USUARIOS`);

--
-- Indices de la tabla `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`ID_CITAS`),
  ADD KEY `ID_SERVICIO` (`ID_SERVICIO`),
  ADD KEY `ID_USUARIOS` (`ID_USUARIOS`),
  ADD KEY `ID_MASCOTAS` (`ID_MASCOTAS`),
  ADD KEY `ID_VETERINARIO` (`ID_VETERINARIO`),
  ADD KEY `ID_CONSULTORIO` (`ID_CONSULTORIO`),
  ADD KEY `ID_ESTADO` (`ID_ESTADO`),
  ADD KEY `IDX_CITAS_FECHA` (`CIT_FECHA`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`ID_COMPRA`),
  ADD KEY `ID_PROVEEDOR` (`ID_PROVEEDOR`);

--
-- Indices de la tabla `consultas`
--
ALTER TABLE `consultas`
  ADD PRIMARY KEY (`ID_CONSULTAS`),
  ADD KEY `ID_CITAS` (`ID_CITAS`),
  ADD KEY `ID_VETERINARIO` (`ID_VETERINARIO`),
  ADD KEY `IDX_CONSULTAS_HISTORIAL` (`ID_HISTORIAL_CLINICO`);

--
-- Indices de la tabla `consultorios`
--
ALTER TABLE `consultorios`
  ADD PRIMARY KEY (`ID_CONSULTORIO`),
  ADD KEY `ID_ESTADO` (`ID_ESTADO`);

--
-- Indices de la tabla `detalles_factura`
--
ALTER TABLE `detalles_factura`
  ADD PRIMARY KEY (`ID_DETALLES_FACTURAS`),
  ADD KEY `ID_FACTURAS` (`ID_FACTURAS`),
  ADD KEY `ID_SERVICIO` (`ID_SERVICIO`),
  ADD KEY `ID_PRODUCTOS` (`ID_PRODUCTOS`);

--
-- Indices de la tabla `especialidades`
--
ALTER TABLE `especialidades`
  ADD PRIMARY KEY (`ID_ESPECIALIDADES`),
  ADD KEY `ID_ESTADO` (`ID_ESTADO`);

--
-- Indices de la tabla `estados`
--
ALTER TABLE `estados`
  ADD PRIMARY KEY (`ID_ESTADOS`),
  ADD KEY `ID_TIPO_ESTADO` (`ID_TIPO_ESTADO`);

--
-- Indices de la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD PRIMARY KEY (`ID_FACTURAS`),
  ADD KEY `ID_USUARIOS` (`ID_USUARIOS`),
  ADD KEY `ID_ESTADO` (`ID_ESTADO`);

--
-- Indices de la tabla `historial_clinico`
--
ALTER TABLE `historial_clinico`
  ADD PRIMARY KEY (`ID_HISTORIAL_CLINICO`),
  ADD UNIQUE KEY `ID_MASCOTAS` (`ID_MASCOTAS`),
  ADD KEY `ID_ESTADO` (`ID_ESTADO`);

--
-- Indices de la tabla `mascotas`
--
ALTER TABLE `mascotas`
  ADD PRIMARY KEY (`ID_MASCOTAS`),
  ADD KEY `ID_USUARIOS` (`ID_USUARIOS`),
  ADD KEY `ID_ESTADO` (`ID_ESTADO`);

--
-- Indices de la tabla `mascota_vacunas`
--
ALTER TABLE `mascota_vacunas`
  ADD PRIMARY KEY (`ID_MASCOTA_VACUNA`),
  ADD KEY `ID_MASCOTAS` (`ID_MASCOTAS`),
  ADD KEY `ID_VACUNA` (`ID_VACUNA`);

--
-- Indices de la tabla `movimientos`
--
ALTER TABLE `movimientos`
  ADD PRIMARY KEY (`ID_MOVIMIENTOS`),
  ADD KEY `ID_USUARIOS` (`ID_USUARIOS`),
  ADD KEY `ID_PRODUCTOS` (`ID_PRODUCTOS`),
  ADD KEY `ID_FACTURAS` (`ID_FACTURAS`),
  ADD KEY `ID_ESTADO` (`ID_ESTADO`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`ID_PRODUCTOS`),
  ADD KEY `ID_PROVEEDOR` (`ID_PROVEEDOR`),
  ADD KEY `ID_ESTADO` (`ID_ESTADO`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`ID_PROVEEDOR`),
  ADD UNIQUE KEY `PROV_NIT` (`PROV_NIT`),
  ADD KEY `ID_ESTADO` (`ID_ESTADO`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`ID_ROLES`),
  ADD KEY `ID_ESTADO` (`ID_ESTADO`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`ID_SERVICIO`),
  ADD KEY `ID_ESTADO` (`ID_ESTADO`);

--
-- Indices de la tabla `tipos_de_estado`
--
ALTER TABLE `tipos_de_estado`
  ADD PRIMARY KEY (`ID_TIPO_ESTADO`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`ID_USUARIOS`),
  ADD UNIQUE KEY `USU_CORREO` (`USU_CORREO`),
  ADD UNIQUE KEY `USU_CEDULA` (`USU_CEDULA`),
  ADD KEY `ID_ROLES` (`ID_ROLES`),
  ADD KEY `ID_ESTADO` (`ID_ESTADO`),
  ADD KEY `IDX_USU_CORREO` (`USU_CORREO`);

--
-- Indices de la tabla `vacunas`
--
ALTER TABLE `vacunas`
  ADD PRIMARY KEY (`ID_VACUNA`);

--
-- Indices de la tabla `veterinarios`
--
ALTER TABLE `veterinarios`
  ADD PRIMARY KEY (`ID_VETERINARIO`),
  ADD UNIQUE KEY `ID_USUARIOS` (`ID_USUARIOS`),
  ADD KEY `ID_ESTADO` (`ID_ESTADO`);

--
-- Indices de la tabla `veterinario_especialidad`
--
ALTER TABLE `veterinario_especialidad`
  ADD PRIMARY KEY (`ID_VETERINARIO_ESPECIALIDAD`),
  ADD KEY `ID_VETERINARIO` (`ID_VETERINARIO`),
  ADD KEY `ID_ESPECIALIDADES` (`ID_ESPECIALIDADES`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `archivos_clinicos`
--
ALTER TABLE `archivos_clinicos`
  MODIFY `ID_ARCHIVO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `auditoria`
--
ALTER TABLE `auditoria`
  MODIFY `ID_AUDITORIA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `citas`
--
ALTER TABLE `citas`
  MODIFY `ID_CITAS` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `ID_COMPRA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `consultas`
--
ALTER TABLE `consultas`
  MODIFY `ID_CONSULTAS` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `consultorios`
--
ALTER TABLE `consultorios`
  MODIFY `ID_CONSULTORIO` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalles_factura`
--
ALTER TABLE `detalles_factura`
  MODIFY `ID_DETALLES_FACTURAS` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `especialidades`
--
ALTER TABLE `especialidades`
  MODIFY `ID_ESPECIALIDADES` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estados`
--
ALTER TABLE `estados`
  MODIFY `ID_ESTADOS` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `facturas`
--
ALTER TABLE `facturas`
  MODIFY `ID_FACTURAS` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `historial_clinico`
--
ALTER TABLE `historial_clinico`
  MODIFY `ID_HISTORIAL_CLINICO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `mascotas`
--
ALTER TABLE `mascotas`
  MODIFY `ID_MASCOTAS` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mascota_vacunas`
--
ALTER TABLE `mascota_vacunas`
  MODIFY `ID_MASCOTA_VACUNA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `movimientos`
--
ALTER TABLE `movimientos`
  MODIFY `ID_MOVIMIENTOS` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `ID_PRODUCTOS` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `ID_PROVEEDOR` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `ID_ROLES` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `ID_SERVICIO` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipos_de_estado`
--
ALTER TABLE `tipos_de_estado`
  MODIFY `ID_TIPO_ESTADO` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `ID_USUARIOS` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `vacunas`
--
ALTER TABLE `vacunas`
  MODIFY `ID_VACUNA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `veterinarios`
--
ALTER TABLE `veterinarios`
  MODIFY `ID_VETERINARIO` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `veterinario_especialidad`
--
ALTER TABLE `veterinario_especialidad`
  MODIFY `ID_VETERINARIO_ESPECIALIDAD` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `archivos_clinicos`
--
ALTER TABLE `archivos_clinicos`
  ADD CONSTRAINT `archivos_clinicos_ibfk_1` FOREIGN KEY (`ID_CONSULTAS`) REFERENCES `consultas` (`ID_CONSULTAS`);

--
-- Filtros para la tabla `auditoria`
--
ALTER TABLE `auditoria`
  ADD CONSTRAINT `auditoria_ibfk_1` FOREIGN KEY (`ID_USUARIOS`) REFERENCES `usuarios` (`ID_USUARIOS`);

--
-- Filtros para la tabla `citas`
--
ALTER TABLE `citas`
  ADD CONSTRAINT `citas_ibfk_1` FOREIGN KEY (`ID_SERVICIO`) REFERENCES `servicios` (`ID_SERVICIO`),
  ADD CONSTRAINT `citas_ibfk_2` FOREIGN KEY (`ID_USUARIOS`) REFERENCES `usuarios` (`ID_USUARIOS`),
  ADD CONSTRAINT `citas_ibfk_3` FOREIGN KEY (`ID_MASCOTAS`) REFERENCES `mascotas` (`ID_MASCOTAS`),
  ADD CONSTRAINT `citas_ibfk_4` FOREIGN KEY (`ID_VETERINARIO`) REFERENCES `veterinarios` (`ID_VETERINARIO`),
  ADD CONSTRAINT `citas_ibfk_5` FOREIGN KEY (`ID_CONSULTORIO`) REFERENCES `consultorios` (`ID_CONSULTORIO`),
  ADD CONSTRAINT `citas_ibfk_6` FOREIGN KEY (`ID_ESTADO`) REFERENCES `estados` (`ID_ESTADOS`);

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`ID_PROVEEDOR`) REFERENCES `proveedores` (`ID_PROVEEDOR`);

--
-- Filtros para la tabla `consultas`
--
ALTER TABLE `consultas`
  ADD CONSTRAINT `consultas_ibfk_1` FOREIGN KEY (`ID_CITAS`) REFERENCES `citas` (`ID_CITAS`),
  ADD CONSTRAINT `consultas_ibfk_2` FOREIGN KEY (`ID_VETERINARIO`) REFERENCES `veterinarios` (`ID_VETERINARIO`),
  ADD CONSTRAINT `consultas_ibfk_3` FOREIGN KEY (`ID_HISTORIAL_CLINICO`) REFERENCES `historial_clinico` (`ID_HISTORIAL_CLINICO`);

--
-- Filtros para la tabla `consultorios`
--
ALTER TABLE `consultorios`
  ADD CONSTRAINT `consultorios_ibfk_1` FOREIGN KEY (`ID_ESTADO`) REFERENCES `estados` (`ID_ESTADOS`);

--
-- Filtros para la tabla `detalles_factura`
--
ALTER TABLE `detalles_factura`
  ADD CONSTRAINT `detalles_factura_ibfk_1` FOREIGN KEY (`ID_FACTURAS`) REFERENCES `facturas` (`ID_FACTURAS`),
  ADD CONSTRAINT `detalles_factura_ibfk_2` FOREIGN KEY (`ID_SERVICIO`) REFERENCES `servicios` (`ID_SERVICIO`),
  ADD CONSTRAINT `detalles_factura_ibfk_3` FOREIGN KEY (`ID_PRODUCTOS`) REFERENCES `productos` (`ID_PRODUCTOS`);

--
-- Filtros para la tabla `especialidades`
--
ALTER TABLE `especialidades`
  ADD CONSTRAINT `especialidades_ibfk_1` FOREIGN KEY (`ID_ESTADO`) REFERENCES `estados` (`ID_ESTADOS`);

--
-- Filtros para la tabla `estados`
--
ALTER TABLE `estados`
  ADD CONSTRAINT `estados_ibfk_1` FOREIGN KEY (`ID_TIPO_ESTADO`) REFERENCES `tipos_de_estado` (`ID_TIPO_ESTADO`);

--
-- Filtros para la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD CONSTRAINT `facturas_ibfk_1` FOREIGN KEY (`ID_USUARIOS`) REFERENCES `usuarios` (`ID_USUARIOS`),
  ADD CONSTRAINT `facturas_ibfk_2` FOREIGN KEY (`ID_ESTADO`) REFERENCES `estados` (`ID_ESTADOS`);

--
-- Filtros para la tabla `historial_clinico`
--
ALTER TABLE `historial_clinico`
  ADD CONSTRAINT `historial_clinico_ibfk_1` FOREIGN KEY (`ID_MASCOTAS`) REFERENCES `mascotas` (`ID_MASCOTAS`),
  ADD CONSTRAINT `historial_clinico_ibfk_2` FOREIGN KEY (`ID_ESTADO`) REFERENCES `estados` (`ID_ESTADOS`);

--
-- Filtros para la tabla `mascotas`
--
ALTER TABLE `mascotas`
  ADD CONSTRAINT `mascotas_ibfk_1` FOREIGN KEY (`ID_USUARIOS`) REFERENCES `usuarios` (`ID_USUARIOS`),
  ADD CONSTRAINT `mascotas_ibfk_2` FOREIGN KEY (`ID_ESTADO`) REFERENCES `estados` (`ID_ESTADOS`);

--
-- Filtros para la tabla `mascota_vacunas`
--
ALTER TABLE `mascota_vacunas`
  ADD CONSTRAINT `mascota_vacunas_ibfk_1` FOREIGN KEY (`ID_MASCOTAS`) REFERENCES `mascotas` (`ID_MASCOTAS`),
  ADD CONSTRAINT `mascota_vacunas_ibfk_2` FOREIGN KEY (`ID_VACUNA`) REFERENCES `vacunas` (`ID_VACUNA`);

--
-- Filtros para la tabla `movimientos`
--
ALTER TABLE `movimientos`
  ADD CONSTRAINT `movimientos_ibfk_1` FOREIGN KEY (`ID_USUARIOS`) REFERENCES `usuarios` (`ID_USUARIOS`),
  ADD CONSTRAINT `movimientos_ibfk_2` FOREIGN KEY (`ID_PRODUCTOS`) REFERENCES `productos` (`ID_PRODUCTOS`),
  ADD CONSTRAINT `movimientos_ibfk_3` FOREIGN KEY (`ID_FACTURAS`) REFERENCES `facturas` (`ID_FACTURAS`),
  ADD CONSTRAINT `movimientos_ibfk_4` FOREIGN KEY (`ID_ESTADO`) REFERENCES `estados` (`ID_ESTADOS`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`ID_PROVEEDOR`) REFERENCES `proveedores` (`ID_PROVEEDOR`),
  ADD CONSTRAINT `productos_ibfk_2` FOREIGN KEY (`ID_ESTADO`) REFERENCES `estados` (`ID_ESTADOS`);

--
-- Filtros para la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD CONSTRAINT `proveedores_ibfk_1` FOREIGN KEY (`ID_ESTADO`) REFERENCES `estados` (`ID_ESTADOS`);

--
-- Filtros para la tabla `roles`
--
ALTER TABLE `roles`
  ADD CONSTRAINT `roles_ibfk_1` FOREIGN KEY (`ID_ESTADO`) REFERENCES `estados` (`ID_ESTADOS`);

--
-- Filtros para la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD CONSTRAINT `servicios_ibfk_1` FOREIGN KEY (`ID_ESTADO`) REFERENCES `estados` (`ID_ESTADOS`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`ID_ROLES`) REFERENCES `roles` (`ID_ROLES`),
  ADD CONSTRAINT `usuarios_ibfk_2` FOREIGN KEY (`ID_ESTADO`) REFERENCES `estados` (`ID_ESTADOS`);

--
-- Filtros para la tabla `veterinarios`
--
ALTER TABLE `veterinarios`
  ADD CONSTRAINT `veterinarios_ibfk_1` FOREIGN KEY (`ID_USUARIOS`) REFERENCES `usuarios` (`ID_USUARIOS`),
  ADD CONSTRAINT `veterinarios_ibfk_2` FOREIGN KEY (`ID_ESTADO`) REFERENCES `estados` (`ID_ESTADOS`);

--
-- Filtros para la tabla `veterinario_especialidad`
--
ALTER TABLE `veterinario_especialidad`
  ADD CONSTRAINT `veterinario_especialidad_ibfk_1` FOREIGN KEY (`ID_VETERINARIO`) REFERENCES `veterinarios` (`ID_VETERINARIO`),
  ADD CONSTRAINT `veterinario_especialidad_ibfk_2` FOREIGN KEY (`ID_ESPECIALIDADES`) REFERENCES `especialidades` (`ID_ESPECIALIDADES`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
