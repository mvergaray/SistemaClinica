USE [master]
GO
/****** Object:  Database [clinica]    Script Date: 13/07/2017 10:03:19 a. m. ******/
CREATE DATABASE [clinica]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'clinica', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\clinica.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'clinica_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\clinica_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [clinica] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [clinica].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [clinica] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [clinica] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [clinica] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [clinica] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [clinica] SET ARITHABORT OFF 
GO
ALTER DATABASE [clinica] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [clinica] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [clinica] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [clinica] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [clinica] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [clinica] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [clinica] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [clinica] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [clinica] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [clinica] SET  DISABLE_BROKER 
GO
ALTER DATABASE [clinica] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [clinica] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [clinica] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [clinica] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [clinica] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [clinica] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [clinica] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [clinica] SET RECOVERY FULL 
GO
ALTER DATABASE [clinica] SET  MULTI_USER 
GO
ALTER DATABASE [clinica] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [clinica] SET DB_CHAINING OFF 
GO
ALTER DATABASE [clinica] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [clinica] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [clinica] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'clinica', N'ON'
GO
ALTER DATABASE [clinica] SET QUERY_STORE = OFF
GO
USE [clinica]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [clinica]
GO
/****** Object:  Table [dbo].[areas]    Script Date: 13/07/2017 10:03:19 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[areas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [varchar](50) NULL,
	[descripcion] [varchar](150) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[clientes]    Script Date: 13/07/2017 10:03:19 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clientes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [varchar](50) NULL,
	[nombres] [varchar](150) NULL,
	[apellidos] [varchar](500) NULL,
	[fecha_nacimiento] [date] NULL,
	[tipo_documento] [varchar](150) NULL,
	[num_documento] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detalle_orden_abastecimiento]    Script Date: 13/07/2017 10:03:19 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalle_orden_abastecimiento](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_orden_abastecimiento] [int] NOT NULL,
	[id_producto] [int] NULL,
	[id_preparado] [int] NULL,
	[codigo] [varchar](50) NULL,
	[cantidad] [int] NULL,
	[monto] [decimal](18, 0) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detalle_orden_devolucion]    Script Date: 13/07/2017 10:03:19 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalle_orden_devolucion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_orden_devolucion] [int] NOT NULL,
	[id_producto] [int] NULL,
	[id_preparado] [int] NULL,
	[codigo] [varchar](50) NULL,
	[cantidad] [int] NULL,
	[monto_devuelto] [decimal](18, 0) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detalle_orden_venta]    Script Date: 13/07/2017 10:03:19 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalle_orden_venta](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_orden_venta] [int] NOT NULL,
	[id_producto] [int] NULL,
	[id_preparado] [int] NULL,
	[codigo] [varchar](50) NULL,
	[cantidad] [int] NULL,
	[monto_vendido] [decimal](18, 0) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detalle_preparado]    Script Date: 13/07/2017 10:03:19 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalle_preparado](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_preparado] [int] NULL,
	[id_producto] [int] NULL,
	[codigo] [varchar](50) NULL,
	[cantidad] [int] NULL,
	[composicion] [varchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detalle_receta]    Script Date: 13/07/2017 10:03:19 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalle_receta](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_receta] [int] NULL,
	[id_producto] [int] NULL,
	[id_preparado] [int] NULL,
	[codigo] [varchar](50) NULL,
	[cantidad] [int] NULL,
	[modo_uso] [varchar](1000) NULL,
	[frecuencia_uso] [varchar](500) NULL,
	[dosis_usar] [int] NULL,
	[estado] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[empleados]    Script Date: 13/07/2017 10:03:19 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[empleados](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [varchar](50) NULL,
	[apellidos] [varchar](150) NULL,
	[nombre] [varchar](150) NULL,
	[tipo_documento] [varchar](150) NULL,
	[nro_documento] [varchar](15) NULL,
	[rol] [varchar](150) NULL,
	[creado_por] [int] NULL,
	[creado_en] [datetime] NULL,
	[ultima_actualizacion_por] [int] NULL,
	[ultima_actualizacion_en] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orden_abastecimiento]    Script Date: 13/07/2017 10:03:19 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orden_abastecimiento](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [varchar](50) NULL,
	[fecha] [datetime] NULL,
	[estado] [varchar](150) NULL,
	[id_empleado] [int] NOT NULL,
	[id_area] [int] NOT NULL,
	[creado_por] [int] NULL,
	[creado_en] [datetime] NULL,
	[ultima_actualizacion_por] [int] NULL,
	[ultima_actualizacion_en] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orden_devolucion]    Script Date: 13/07/2017 10:03:19 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orden_devolucion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [varchar](50) NULL,
	[fecha] [datetime] NULL,
	[estado] [varchar](150) NULL,
	[motivo] [varchar](500) NULL,
	[id_empleado] [int] NULL,
	[tipo_devolucion] [int] NULL,
	[id_orden_venta] [int] NULL,
	[id_orden_abastecimiento] [int] NULL,
	[id_cliente] [int] NULL,
	[creado_por] [int] NULL,
	[creado_en] [datetime] NULL,
	[ultima_actualizacion_por] [int] NULL,
	[ultima_actualizacion_en] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orden_venta]    Script Date: 13/07/2017 10:03:19 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orden_venta](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [varchar](50) NULL,
	[fecha] [datetime] NULL,
	[estado] [varchar](150) NULL,
	[id_empleado] [int] NULL,
	[id_receta] [int] NULL,
	[id_cliente] [int] NULL,
	[creado_por] [int] NULL,
	[creado_en] [datetime] NULL,
	[ultima_actualizacion_por] [int] NULL,
	[ultima_actualizacion_en] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pacientes]    Script Date: 13/07/2017 10:03:19 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pacientes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_cliente] [int] NULL,
	[nro_historia_clinica] [varchar](150) NULL,
	[dolencia] [varchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[preparados]    Script Date: 13/07/2017 10:03:19 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[preparados](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [varchar](50) NULL,
	[nombre] [varchar](500) NULL,
	[instrucciones] [varchar](1000) NULL,
	[id_empleado] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productos]    Script Date: 13/07/2017 10:03:19 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [varchar](50) NULL,
	[descripcion] [varchar](500) NULL,
	[marca] [varchar](500) NULL,
	[laboratorio] [varchar](500) NULL,
	[precio] [decimal](18, 0) NULL,
	[dosis] [int] NULL,
	[stock] [int] NULL,
	[unidad_medida] [varchar](150) NULL,
	[venta_publico] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[recetas]    Script Date: 13/07/2017 10:03:19 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[recetas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [varchar](50) NULL,
	[fecha] [datetime] NULL,
	[vigente] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[solicitud_preparacion]    Script Date: 13/07/2017 10:03:19 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[solicitud_preparacion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [varchar](50) NULL,
	[fecha] [datetime] NULL,
	[composicion] [varchar](1000) NULL,
	[id_empleado] [int] NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[areas] ON 

INSERT [dbo].[areas] ([id], [codigo], [descripcion]) VALUES (1, N'AR-001', N'Traumatología')
SET IDENTITY_INSERT [dbo].[areas] OFF
SET IDENTITY_INSERT [dbo].[clientes] ON 

INSERT [dbo].[clientes] ([id], [codigo], [nombres], [apellidos], [fecha_nacimiento], [tipo_documento], [num_documento]) VALUES (1, N'CL-001', N'Marco Antonio', N'Vergaray Guerra', CAST(N'1993-04-25' AS Date), N'DNI', N'47704728')
SET IDENTITY_INSERT [dbo].[clientes] OFF
SET IDENTITY_INSERT [dbo].[detalle_orden_abastecimiento] ON 

INSERT [dbo].[detalle_orden_abastecimiento] ([id], [id_orden_abastecimiento], [id_producto], [id_preparado], [codigo], [cantidad], [monto]) VALUES (1, 1, 1, NULL, N'DOA-001', 1, CAST(15 AS Decimal(18, 0)))
INSERT [dbo].[detalle_orden_abastecimiento] ([id], [id_orden_abastecimiento], [id_producto], [id_preparado], [codigo], [cantidad], [monto]) VALUES (2, 2, NULL, 1, N'DOA-002', 1, CAST(10 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[detalle_orden_abastecimiento] OFF
SET IDENTITY_INSERT [dbo].[detalle_orden_devolucion] ON 

INSERT [dbo].[detalle_orden_devolucion] ([id], [id_orden_devolucion], [id_producto], [id_preparado], [codigo], [cantidad], [monto_devuelto]) VALUES (1, 1, 1, NULL, N'DOD-001', 1, CAST(14 AS Decimal(18, 0)))
INSERT [dbo].[detalle_orden_devolucion] ([id], [id_orden_devolucion], [id_producto], [id_preparado], [codigo], [cantidad], [monto_devuelto]) VALUES (2, 1, NULL, 1, N'DOD-002', 1, CAST(12 AS Decimal(18, 0)))
INSERT [dbo].[detalle_orden_devolucion] ([id], [id_orden_devolucion], [id_producto], [id_preparado], [codigo], [cantidad], [monto_devuelto]) VALUES (3, 2, NULL, 1, N'DOD-003', 1, CAST(12 AS Decimal(18, 0)))
INSERT [dbo].[detalle_orden_devolucion] ([id], [id_orden_devolucion], [id_producto], [id_preparado], [codigo], [cantidad], [monto_devuelto]) VALUES (4, 2, 1, NULL, N'DOD-004', 1, CAST(14 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[detalle_orden_devolucion] OFF
SET IDENTITY_INSERT [dbo].[detalle_orden_venta] ON 

INSERT [dbo].[detalle_orden_venta] ([id], [id_orden_venta], [id_producto], [id_preparado], [codigo], [cantidad], [monto_vendido]) VALUES (1, 1, 1, NULL, N'DOV-001', 1, CAST(14 AS Decimal(18, 0)))
INSERT [dbo].[detalle_orden_venta] ([id], [id_orden_venta], [id_producto], [id_preparado], [codigo], [cantidad], [monto_vendido]) VALUES (2, 1, NULL, 1, N'DOV-002', 1, CAST(12 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[detalle_orden_venta] OFF
SET IDENTITY_INSERT [dbo].[detalle_preparado] ON 

INSERT [dbo].[detalle_preparado] ([id], [id_preparado], [id_producto], [codigo], [cantidad], [composicion]) VALUES (1, 1, 1, N'DPR-001', 1, N'Composicion quimica a ser usada en el preparado.')
SET IDENTITY_INSERT [dbo].[detalle_preparado] OFF
SET IDENTITY_INSERT [dbo].[empleados] ON 

INSERT [dbo].[empleados] ([id], [codigo], [apellidos], [nombre], [tipo_documento], [nro_documento], [rol], [creado_por], [creado_en], [ultima_actualizacion_por], [ultima_actualizacion_en]) VALUES (1, N'TF-001', N'Valdivia Romero', N'Patricia', N'DNI', N'47588896', N'Tecnico Farmaceutico', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[empleados] OFF
SET IDENTITY_INSERT [dbo].[orden_abastecimiento] ON 

INSERT [dbo].[orden_abastecimiento] ([id], [codigo], [fecha], [estado], [id_empleado], [id_area], [creado_por], [creado_en], [ultima_actualizacion_por], [ultima_actualizacion_en]) VALUES (1, N'OA-001', CAST(N'2017-07-11T00:00:00.000' AS DateTime), N'Despachado', 1, 1, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[orden_abastecimiento] OFF
SET IDENTITY_INSERT [dbo].[orden_devolucion] ON 

INSERT [dbo].[orden_devolucion] ([id], [codigo], [fecha], [estado], [motivo], [id_empleado], [tipo_devolucion], [id_orden_venta], [id_orden_abastecimiento], [id_cliente], [creado_por], [creado_en], [ultima_actualizacion_por], [ultima_actualizacion_en]) VALUES (1, N'OD-001', CAST(N'2017-07-11T00:00:00.000' AS DateTime), N'Generado', N'Producto en mal estado', 1, 1, 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[orden_devolucion] ([id], [codigo], [fecha], [estado], [motivo], [id_empleado], [tipo_devolucion], [id_orden_venta], [id_orden_abastecimiento], [id_cliente], [creado_por], [creado_en], [ultima_actualizacion_por], [ultima_actualizacion_en]) VALUES (2, N'OD-002', CAST(N'2017-07-11T00:00:00.000' AS DateTime), N'Generado', N'Preparado incorrecto', 1, 2, NULL, 1, 1, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[orden_devolucion] OFF
SET IDENTITY_INSERT [dbo].[orden_venta] ON 

INSERT [dbo].[orden_venta] ([id], [codigo], [fecha], [estado], [id_empleado], [id_receta], [id_cliente], [creado_por], [creado_en], [ultima_actualizacion_por], [ultima_actualizacion_en]) VALUES (1, N'OV-001', CAST(N'2017-07-11T01:02:03.000' AS DateTime), N'Despachado', 1, NULL, 1, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[orden_venta] OFF
SET IDENTITY_INSERT [dbo].[preparados] ON 

INSERT [dbo].[preparados] ([id], [codigo], [nombre], [instrucciones], [id_empleado]) VALUES (1, N'PRE-001', N'Preparado 1', N'Instrucciones para el preparado.', 1)
SET IDENTITY_INSERT [dbo].[preparados] OFF
SET IDENTITY_INSERT [dbo].[productos] ON 

INSERT [dbo].[productos] ([id], [codigo], [descripcion], [marca], [laboratorio], [precio], [dosis], [stock], [unidad_medida], [venta_publico]) VALUES (1, N'PRO-001', N'Producto 1', N'Marca 1', N'Laboratorio 1', CAST(15 AS Decimal(18, 0)), 1, 100, N'mg', 1)
SET IDENTITY_INSERT [dbo].[productos] OFF
/****** Object:  StoredProcedure [dbo].[uspGetClientexId]    Script Date: 13/07/2017 10:03:19 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspGetClientexId]
	@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM clientes WHERE id = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[uspGetDetalleOrdenVentaxOrdenId]    Script Date: 13/07/2017 10:03:19 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspGetDetalleOrdenVentaxOrdenId]
	@OrdenId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM detalle_orden_venta WHERE id_orden_venta = @OrdenId;
END
GO
/****** Object:  StoredProcedure [dbo].[uspGetEmpleadoxId]    Script Date: 13/07/2017 10:03:19 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspGetEmpleadoxId]
	@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM empleados WHERE id = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[uspGetOrdenVentaxCod]    Script Date: 13/07/2017 10:03:19 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspGetOrdenVentaxCod] 
	
	@Codigo Varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Id, codigo, fecha, estado, id_empleado, id_receta, id_cliente FROM orden_venta WHERE codigo like '%'+@Codigo+'%';
END
GO
/****** Object:  StoredProcedure [dbo].[uspGetPreparadoxId]    Script Date: 13/07/2017 10:03:19 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspGetPreparadoxId]
	@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM preparados WHERE id = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[uspGetProductoxId]    Script Date: 13/07/2017 10:03:19 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[uspGetProductoxId] @Id int
AS
SELECT * 
FROM productos
WHERE id = @Id
GO
USE [master]
GO
ALTER DATABASE [clinica] SET  READ_WRITE 
GO
