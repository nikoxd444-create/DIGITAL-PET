-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-03-2026 a las 13:13:13
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
-- Estructura de tabla para la tabla `consultas`
--

CREATE TABLE `consultas` (
  `ID_CONSULTAS` int(11) NOT NULL,
  `ID_CITAS` int(11) NOT NULL,
  `ID_USUARIOS` int(11) NOT NULL,
  `ID_HISTORIAL_CLINICO` int(11) DEFAULT NULL,
  `CON_Fecha` datetime NOT NULL,
  `CON_Motivo` varchar(500) NOT NULL,
  `CON_Diagnosticos` text DEFAULT NULL,
  `CON_Tratamientos` text DEFAULT NULL,
  `CON_Observaciones` text DEFAULT NULL,
  `CON_Temperatura` decimal(4,1) DEFAULT NULL,
  `CON_Proxima_visita` datetime DEFAULT NULL,
  `CON_Peso_Actual` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_factura`
--

CREATE TABLE `detalles_factura` (
  `ID_DETALLES_FACTURAS` int(11) NOT NULL,
  `ID_FACTURAS` int(11) NOT NULL,
  `ID_SERVICIOS` int(11) DEFAULT NULL,
  `ID_PRODUCTOS` int(11) DEFAULT NULL,
  `DET_Total` decimal(10,2) DEFAULT NULL,
  `DET_Descuentos` decimal(10,2) NOT NULL,
  `DET_Subtotal` decimal(10,2) DEFAULT NULL,
  `DET_Precio_Unitario` decimal(10,2) DEFAULT NULL,
  `DET_Cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `devolucion`
--

CREATE TABLE `devolucion` (
  `ID_DEVOLUCION` int(11) NOT NULL,
  `ID_FACTURAS` int(11) NOT NULL,
  `ID_USUARIOS` int(11) NOT NULL,
  `ID_PRODUCTOS` int(11) NOT NULL,
  `DEV_MOTIVO` varchar(100) NOT NULL,
  `DEV_TOTAL` decimal(12,8) NOT NULL,
  `ID_ESTADO` int(11) NOT NULL,
  `DEV_OBSERVACIONES` varchar(150) DEFAULT NULL,
  `DEV_MONTO` decimal(12,8) NOT NULL,
  `DEV_CANTIDAD` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidades`
--

CREATE TABLE `especialidades` (
  `ID_ESPECIALIDADES` int(11) NOT NULL,
  `ESP_Nombre` varchar(100) NOT NULL,
  `ESP_Descripcion` varchar(300) DEFAULT NULL,
  `ID_ESTADO` int(11) NOT NULL,
  `ID_ROLES` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

CREATE TABLE `estados` (
  `ID_ESTADOS` int(11) NOT NULL,
  `ID_TIPO_ESTADO` int(11) NOT NULL,
  `EST_FECHA_CREACION` datetime NOT NULL,
  `EST_FECHA_MODIFICACION` datetime DEFAULT NULL,
  `EST_NOMBRE` varchar(50) NOT NULL,
  `EST_DESCRIPCION` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `ID_FACTURAS` int(11) NOT NULL,
  `ID_USUARIOS` int(11) NOT NULL,
  `ID_ESTADO` int(11) NOT NULL,
  `FAC_Metodo_Pago` varchar(50) NOT NULL,
  `FAC_Fecha` date NOT NULL,
  `FAC_Subtotal` decimal(10,2) NOT NULL,
  `FAC_Monto` decimal(10,2) NOT NULL,
  `FAC_Impuesto` decimal(10,2) NOT NULL,
  `FAC_Observaciones` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mascotas`
--

CREATE TABLE `mascotas` (
  `ID_MASCOTAS` int(11) NOT NULL,
  `ID_USUARIOS` int(11) NOT NULL,
  `ID_ESTADO` int(11) NOT NULL,
  `MAS_PESO` decimal(5,2) DEFAULT NULL,
  `MAS_RAZA` varchar(100) DEFAULT NULL,
  `MAS_NOMBRE` varchar(100) NOT NULL,
  `MAS_GENERO` varchar(50) DEFAULT NULL,
  `MAS_FECHA_NACIMIENTO` date DEFAULT NULL,
  `MAS_ESPECIE` varchar(50) NOT NULL,
  `MAS_COLOR` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientos`
--

CREATE TABLE `movimientos` (
  `ID_MOVIMIENTOS` int(11) NOT NULL,
  `ID_USUARIOS` int(11) NOT NULL,
  `ID_FACTURAS` int(11) DEFAULT NULL,
  `ID_DEVOLUCION` int(11) DEFAULT NULL,
  `ID_PRODUCTOS` int(11) NOT NULL,
  `ID_ESTADO` int(11) NOT NULL,
  `MOV_Cantidad` int(11) NOT NULL,
  `MOV_Hora` time NOT NULL,
  `MOV_Motivo` varchar(100) NOT NULL,
  `MOV_Observaciones` varchar(300) DEFAULT NULL,
  `MOV_Tipo` varchar(50) NOT NULL,
  `MOV_Fecha` date NOT NULL,
  `MOV_Valor_total` decimal(10,2) NOT NULL,
  `MOV_Stock_Unitario` decimal(10,2) NOT NULL,
  `MOV_Stock_Nuevo` int(11) NOT NULL,
  `MOV_Stock_Anterior` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `ID_PRODUCTOS` int(11) NOT NULL,
  `PRO_Marca` varchar(60) DEFAULT NULL,
  `PRO_Lote` varchar(50) DEFAULT NULL,
  `PRO_Descripcion` varchar(300) DEFAULT NULL,
  `PRO_Stock_anual` int(11) NOT NULL,
  `PRO_Stock_minimo` int(11) NOT NULL,
  `PRO_Unidad_medida` varchar(20) NOT NULL,
  `PRO_Categoria` varchar(100) DEFAULT NULL,
  `PRO_Nombre` varchar(100) NOT NULL,
  `PRO_Precio_compra` decimal(10,2) NOT NULL,
  `PRO_Precio_venta` decimal(10,2) NOT NULL,
  `PRO_Fecha_vencimiento` date DEFAULT NULL,
  `ID_PROVEEDORES` int(11) NOT NULL,
  `ID_ESTADO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `ID_PROVEEDOR` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `ID_USUARIOS` int(11) NOT NULL,
  `PROV_Nit` varchar(20) NOT NULL,
  `PROV_Direccion` varchar(150) NOT NULL,
  `ID_ESTADO` int(11) NOT NULL,
  `PROV_Correo` varchar(100) NOT NULL,
  `PROV_Telefono` varchar(20) DEFAULT NULL,
  `PROV_Ciudad` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `ID_ROLES` int(11) NOT NULL,
  `ROL_NOMBRE` varchar(60) NOT NULL,
  `ROL_DESCRIPCION` varchar(200) DEFAULT NULL,
  `ID_ESTADO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE `servicio` (
  `ID_SERVICIO` int(11) NOT NULL,
  `SER_Nombre` varchar(100) NOT NULL,
  `SER_Duracion` int(3) NOT NULL,
  `SER_Precio` decimal(12,8) NOT NULL,
  `SER_Descripcion` varchar(300) NOT NULL,
  `ID_ESTADO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_citas`
--

CREATE TABLE `tbl_citas` (
  `ID_CITAS` int(11) NOT NULL,
  `ID_SERVICIOS` int(11) NOT NULL,
  `ID_USUARIOS` int(11) NOT NULL,
  `ID_ESTADO` int(11) NOT NULL,
  `ID_MASCOTAS` int(11) NOT NULL,
  `CIT_HORA` time NOT NULL,
  `CIT_OBSERVACION` varchar(200) DEFAULT NULL,
  `CIT_FECHA` date NOT NULL,
  `CIT_TIPO` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_historial_clinico`
--

CREATE TABLE `tbl_historial_clinico` (
  `ID_HISTORIAL_CLINICO` int(11) NOT NULL,
  `ID_MASCOTAS` int(11) NOT NULL,
  `ID_ESTADO` int(11) NOT NULL,
  `ID_CONSULTAS` int(11) DEFAULT NULL,
  `HIS_FECHA_APERTURA` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipodemovimientoinventario`
--

CREATE TABLE `tipodemovimientoinventario` (
  `ID_TIPO_MOVIMIENTO` int(11) NOT NULL,
  `ID_DEVOLUCION` int(11) DEFAULT NULL,
  `ID_USUARIOS` int(11) NOT NULL,
  `TIPMOVI_Entrada` tinyint(1) NOT NULL,
  `TIPMOVI_Salida` tinyint(1) NOT NULL,
  `TIPMOVI_Fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_de_estado`
--

CREATE TABLE `tipos_de_estado` (
  `ID_TIPO_ESTADO` int(11) NOT NULL,
  `TIE_NOMBRE` varchar(50) NOT NULL,
  `TIE_DESCRIPCION` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `ID_USUARIOS` int(11) NOT NULL,
  `ID_ROLES` int(11) NOT NULL,
  `ID_ESTADO` int(11) NOT NULL,
  `USU_CORREO` varchar(100) NOT NULL,
  `USU_FECHA_REGISTRO` datetime NOT NULL,
  `USU_NOMBRE` varchar(50) NOT NULL,
  `USU_CONTRASENA` varchar(255) NOT NULL,
  `USU_APELLIDO` varchar(50) NOT NULL,
  `USU_TELEFONO` varchar(15) DEFAULT NULL,
  `USU_CEDULA` varchar(20) NOT NULL,
  `USU_DIRECCION` varchar(150) DEFAULT NULL,
  `USU_TARJETA_PROFESIONAL` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `consultas`
--
ALTER TABLE `consultas`
  ADD PRIMARY KEY (`ID_CONSULTAS`),
  ADD KEY `ID_CITAS` (`ID_CITAS`),
  ADD KEY `ID_USUARIOS` (`ID_USUARIOS`),
  ADD KEY `ID_HISTORIAL_CLINICO` (`ID_HISTORIAL_CLINICO`);

--
-- Indices de la tabla `detalles_factura`
--
ALTER TABLE `detalles_factura`
  ADD PRIMARY KEY (`ID_DETALLES_FACTURAS`),
  ADD KEY `ID_FACTURAS` (`ID_FACTURAS`),
  ADD KEY `ID_SERVICIOS` (`ID_SERVICIOS`),
  ADD KEY `ID_PRODUCTOS` (`ID_PRODUCTOS`);

--
-- Indices de la tabla `devolucion`
--
ALTER TABLE `devolucion`
  ADD PRIMARY KEY (`ID_DEVOLUCION`),
  ADD KEY `ID_FACTURAS` (`ID_FACTURAS`),
  ADD KEY `ID_USUARIOS` (`ID_USUARIOS`),
  ADD KEY `ID_PRODUCTOS` (`ID_PRODUCTOS`),
  ADD KEY `ID_ESTADO` (`ID_ESTADO`);

--
-- Indices de la tabla `especialidades`
--
ALTER TABLE `especialidades`
  ADD PRIMARY KEY (`ID_ESPECIALIDADES`),
  ADD KEY `ID_ESTADO` (`ID_ESTADO`),
  ADD KEY `ID_ROLES` (`ID_ROLES`);

--
-- Indices de la tabla `estados`
--
ALTER TABLE `estados`
  ADD PRIMARY KEY (`ID_ESTADOS`),
  ADD KEY `ID_TIPO_ESTADO` (`ID_TIPO_ESTADO`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`ID_FACTURAS`),
  ADD KEY `ID_USUARIOS` (`ID_USUARIOS`),
  ADD KEY `ID_ESTADO` (`ID_ESTADO`);

--
-- Indices de la tabla `mascotas`
--
ALTER TABLE `mascotas`
  ADD PRIMARY KEY (`ID_MASCOTAS`),
  ADD KEY `ID_USUARIOS` (`ID_USUARIOS`),
  ADD KEY `ID_ESTADO` (`ID_ESTADO`);

--
-- Indices de la tabla `movimientos`
--
ALTER TABLE `movimientos`
  ADD PRIMARY KEY (`ID_MOVIMIENTOS`),
  ADD KEY `ID_USUARIOS` (`ID_USUARIOS`),
  ADD KEY `ID_FACTURAS` (`ID_FACTURAS`),
  ADD KEY `ID_DEVOLUCION` (`ID_DEVOLUCION`),
  ADD KEY `ID_PRODUCTOS` (`ID_PRODUCTOS`),
  ADD KEY `ID_ESTADO` (`ID_ESTADO`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`ID_PRODUCTOS`),
  ADD KEY `ID_PROVEEDORES` (`ID_PROVEEDORES`),
  ADD KEY `ID_ESTADO` (`ID_ESTADO`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`ID_PROVEEDOR`),
  ADD KEY `ID_USUARIOS` (`ID_USUARIOS`),
  ADD KEY `ID_ESTADO` (`ID_ESTADO`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`ID_ROLES`),
  ADD KEY `ID_ESTADO` (`ID_ESTADO`);

--
-- Indices de la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`ID_SERVICIO`),
  ADD KEY `ID_ESTADO` (`ID_ESTADO`);

--
-- Indices de la tabla `tbl_citas`
--
ALTER TABLE `tbl_citas`
  ADD PRIMARY KEY (`ID_CITAS`),
  ADD KEY `ID_SERVICIOS` (`ID_SERVICIOS`),
  ADD KEY `ID_USUARIOS` (`ID_USUARIOS`),
  ADD KEY `ID_ESTADO` (`ID_ESTADO`),
  ADD KEY `ID_MASCOTAS` (`ID_MASCOTAS`);

--
-- Indices de la tabla `tbl_historial_clinico`
--
ALTER TABLE `tbl_historial_clinico`
  ADD PRIMARY KEY (`ID_HISTORIAL_CLINICO`),
  ADD KEY `ID_MASCOTAS` (`ID_MASCOTAS`),
  ADD KEY `ID_ESTADO` (`ID_ESTADO`);

--
-- Indices de la tabla `tipodemovimientoinventario`
--
ALTER TABLE `tipodemovimientoinventario`
  ADD PRIMARY KEY (`ID_TIPO_MOVIMIENTO`),
  ADD KEY `ID_DEVOLUCION` (`ID_DEVOLUCION`),
  ADD KEY `ID_USUARIOS` (`ID_USUARIOS`);

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
  ADD KEY `ID_ESTADO` (`ID_ESTADO`);

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
-- AUTO_INCREMENT de la tabla `consultas`
--
ALTER TABLE `consultas`
  MODIFY `ID_CONSULTAS` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalles_factura`
--
ALTER TABLE `detalles_factura`
  MODIFY `ID_DETALLES_FACTURAS` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `devolucion`
--
ALTER TABLE `devolucion`
  MODIFY `ID_DEVOLUCION` int(11) NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `ID_FACTURAS` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mascotas`
--
ALTER TABLE `mascotas`
  MODIFY `ID_MASCOTAS` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `movimientos`
--
ALTER TABLE `movimientos`
  MODIFY `ID_MOVIMIENTOS` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `ID_PRODUCTOS` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `ID_PROVEEDOR` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `ID_ROLES` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `servicio`
--
ALTER TABLE `servicio`
  MODIFY `ID_SERVICIO` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_citas`
--
ALTER TABLE `tbl_citas`
  MODIFY `ID_CITAS` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_historial_clinico`
--
ALTER TABLE `tbl_historial_clinico`
  MODIFY `ID_HISTORIAL_CLINICO` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipodemovimientoinventario`
--
ALTER TABLE `tipodemovimientoinventario`
  MODIFY `ID_TIPO_MOVIMIENTO` int(11) NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT de la tabla `veterinario`
--
ALTER TABLE `veterinario`
  MODIFY `ID_VETERINARIO` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `consultas`
--
ALTER TABLE `consultas`
  ADD CONSTRAINT `consultas_ibfk_1` FOREIGN KEY (`ID_CITAS`) REFERENCES `tbl_citas` (`ID_CITAS`),
  ADD CONSTRAINT `consultas_ibfk_2` FOREIGN KEY (`ID_USUARIOS`) REFERENCES `usuarios` (`ID_USUARIOS`),
  ADD CONSTRAINT `consultas_ibfk_3` FOREIGN KEY (`ID_HISTORIAL_CLINICO`) REFERENCES `tbl_historial_clinico` (`ID_HISTORIAL_CLINICO`);

--
-- Filtros para la tabla `detalles_factura`
--
ALTER TABLE `detalles_factura`
  ADD CONSTRAINT `detalles_factura_ibfk_1` FOREIGN KEY (`ID_FACTURAS`) REFERENCES `factura` (`ID_FACTURAS`),
  ADD CONSTRAINT `detalles_factura_ibfk_2` FOREIGN KEY (`ID_SERVICIOS`) REFERENCES `servicio` (`ID_SERVICIO`),
  ADD CONSTRAINT `detalles_factura_ibfk_3` FOREIGN KEY (`ID_PRODUCTOS`) REFERENCES `productos` (`ID_PRODUCTOS`);

--
-- Filtros para la tabla `devolucion`
--
ALTER TABLE `devolucion`
  ADD CONSTRAINT `devolucion_ibfk_1` FOREIGN KEY (`ID_FACTURAS`) REFERENCES `factura` (`ID_FACTURAS`),
  ADD CONSTRAINT `devolucion_ibfk_2` FOREIGN KEY (`ID_USUARIOS`) REFERENCES `usuarios` (`ID_USUARIOS`),
  ADD CONSTRAINT `devolucion_ibfk_3` FOREIGN KEY (`ID_PRODUCTOS`) REFERENCES `productos` (`ID_PRODUCTOS`),
  ADD CONSTRAINT `devolucion_ibfk_4` FOREIGN KEY (`ID_ESTADO`) REFERENCES `estados` (`ID_ESTADOS`);

--
-- Filtros para la tabla `especialidades`
--
ALTER TABLE `especialidades`
  ADD CONSTRAINT `especialidades_ibfk_1` FOREIGN KEY (`ID_ESTADO`) REFERENCES `estados` (`ID_ESTADOS`),
  ADD CONSTRAINT `especialidades_ibfk_2` FOREIGN KEY (`ID_ROLES`) REFERENCES `roles` (`ID_ROLES`);

--
-- Filtros para la tabla `estados`
--
ALTER TABLE `estados`
  ADD CONSTRAINT `estados_ibfk_1` FOREIGN KEY (`ID_TIPO_ESTADO`) REFERENCES `tipos_de_estado` (`ID_TIPO_ESTADO`);

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`ID_USUARIOS`) REFERENCES `usuarios` (`ID_USUARIOS`),
  ADD CONSTRAINT `factura_ibfk_2` FOREIGN KEY (`ID_ESTADO`) REFERENCES `estados` (`ID_ESTADOS`);

--
-- Filtros para la tabla `mascotas`
--
ALTER TABLE `mascotas`
  ADD CONSTRAINT `mascotas_ibfk_1` FOREIGN KEY (`ID_USUARIOS`) REFERENCES `usuarios` (`ID_USUARIOS`),
  ADD CONSTRAINT `mascotas_ibfk_2` FOREIGN KEY (`ID_ESTADO`) REFERENCES `estados` (`ID_ESTADOS`);

--
-- Filtros para la tabla `movimientos`
--
ALTER TABLE `movimientos`
  ADD CONSTRAINT `movimientos_ibfk_1` FOREIGN KEY (`ID_USUARIOS`) REFERENCES `usuarios` (`ID_USUARIOS`),
  ADD CONSTRAINT `movimientos_ibfk_2` FOREIGN KEY (`ID_FACTURAS`) REFERENCES `factura` (`ID_FACTURAS`),
  ADD CONSTRAINT `movimientos_ibfk_3` FOREIGN KEY (`ID_DEVOLUCION`) REFERENCES `devolucion` (`ID_DEVOLUCION`),
  ADD CONSTRAINT `movimientos_ibfk_4` FOREIGN KEY (`ID_PRODUCTOS`) REFERENCES `productos` (`ID_PRODUCTOS`),
  ADD CONSTRAINT `movimientos_ibfk_5` FOREIGN KEY (`ID_ESTADO`) REFERENCES `estados` (`ID_ESTADOS`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`ID_PROVEEDORES`) REFERENCES `proveedores` (`ID_PROVEEDOR`),
  ADD CONSTRAINT `productos_ibfk_2` FOREIGN KEY (`ID_ESTADO`) REFERENCES `estados` (`ID_ESTADOS`);

--
-- Filtros para la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD CONSTRAINT `proveedores_ibfk_1` FOREIGN KEY (`ID_USUARIOS`) REFERENCES `usuarios` (`ID_USUARIOS`),
  ADD CONSTRAINT `proveedores_ibfk_2` FOREIGN KEY (`ID_ESTADO`) REFERENCES `estados` (`ID_ESTADOS`);

--
-- Filtros para la tabla `roles`
--
ALTER TABLE `roles`
  ADD CONSTRAINT `roles_ibfk_1` FOREIGN KEY (`ID_ESTADO`) REFERENCES `estados` (`ID_ESTADOS`);

--
-- Filtros para la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD CONSTRAINT `servicio_ibfk_1` FOREIGN KEY (`ID_ESTADO`) REFERENCES `estados` (`ID_ESTADOS`);

--
-- Filtros para la tabla `tbl_citas`
--
ALTER TABLE `tbl_citas`
  ADD CONSTRAINT `tbl_citas_ibfk_1` FOREIGN KEY (`ID_SERVICIOS`) REFERENCES `servicio` (`ID_SERVICIO`),
  ADD CONSTRAINT `tbl_citas_ibfk_2` FOREIGN KEY (`ID_USUARIOS`) REFERENCES `usuarios` (`ID_USUARIOS`),
  ADD CONSTRAINT `tbl_citas_ibfk_3` FOREIGN KEY (`ID_ESTADO`) REFERENCES `estados` (`ID_ESTADOS`),
  ADD CONSTRAINT `tbl_citas_ibfk_4` FOREIGN KEY (`ID_MASCOTAS`) REFERENCES `mascotas` (`ID_MASCOTAS`);

--
-- Filtros para la tabla `tbl_historial_clinico`
--
ALTER TABLE `tbl_historial_clinico`
  ADD CONSTRAINT `tbl_historial_clinico_ibfk_1` FOREIGN KEY (`ID_MASCOTAS`) REFERENCES `mascotas` (`ID_MASCOTAS`),
  ADD CONSTRAINT `tbl_historial_clinico_ibfk_2` FOREIGN KEY (`ID_ESTADO`) REFERENCES `estados` (`ID_ESTADOS`);

--
-- Filtros para la tabla `tipodemovimientoinventario`
--
ALTER TABLE `tipodemovimientoinventario`
  ADD CONSTRAINT `tipodemovimientoinventario_ibfk_1` FOREIGN KEY (`ID_DEVOLUCION`) REFERENCES `devolucion` (`ID_DEVOLUCION`),
  ADD CONSTRAINT `tipodemovimientoinventario_ibfk_2` FOREIGN KEY (`ID_USUARIOS`) REFERENCES `usuarios` (`ID_USUARIOS`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`ID_ROLES`) REFERENCES `roles` (`ID_ROLES`),
  ADD CONSTRAINT `usuarios_ibfk_2` FOREIGN KEY (`ID_ESTADO`) REFERENCES `estados` (`ID_ESTADOS`);

--
-- Filtros para la tabla `veterinario`
--
ALTER TABLE `veterinario`
  ADD CONSTRAINT `veterinario_ibfk_1` FOREIGN KEY (`ID_USUARIOS`) REFERENCES `usuarios` (`ID_USUARIOS`),
  ADD CONSTRAINT `veterinario_ibfk_2` FOREIGN KEY (`ID_ESPECIALIDADES`) REFERENCES `especialidades` (`ID_ESPECIALIDADES`),
  ADD CONSTRAINT `veterinario_ibfk_3` FOREIGN KEY (`ID_ESTADO`) REFERENCES `estados` (`ID_ESTADOS`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
