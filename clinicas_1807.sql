USE [master]
GO
/****** Object:  Database [BD_CLINICA]    Script Date: 19/07/2017 9:35:40 a. m. ******/
CREATE DATABASE [BD_CLINICA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BD_CLINICA', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\BD_CLINICA.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BD_CLINICA_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\BD_CLINICA_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BD_CLINICA] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BD_CLINICA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BD_CLINICA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BD_CLINICA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BD_CLINICA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BD_CLINICA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BD_CLINICA] SET ARITHABORT OFF 
GO
ALTER DATABASE [BD_CLINICA] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BD_CLINICA] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [BD_CLINICA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BD_CLINICA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BD_CLINICA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BD_CLINICA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BD_CLINICA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BD_CLINICA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BD_CLINICA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BD_CLINICA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BD_CLINICA] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BD_CLINICA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BD_CLINICA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BD_CLINICA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BD_CLINICA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BD_CLINICA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BD_CLINICA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BD_CLINICA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BD_CLINICA] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BD_CLINICA] SET  MULTI_USER 
GO
ALTER DATABASE [BD_CLINICA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BD_CLINICA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BD_CLINICA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BD_CLINICA] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [BD_CLINICA]
GO
/****** Object:  StoredProcedure [dbo].[uspActualizarDetalleOrdenAbastecimiento]    Script Date: 19/07/2017 9:35:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspActualizarDetalleOrdenAbastecimiento]
	-- Add the parameters for the stored procedure here
	@Id int,
	@Cantidad int,
	@Monto decimal(18, 0)	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE detalle_orden_abastecimiento SET cantidad = (cantidad - @Cantidad),
	monto = @Monto
	WHERE id = @Id;
END

GO
/****** Object:  StoredProcedure [dbo].[uspActualizarDetalleOrdenVenta]    Script Date: 19/07/2017 9:35:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspActualizarDetalleOrdenVenta]
	-- Add the parameters for the stored procedure here
	@Id int,
	@Cantidad int,
	@Monto decimal(18, 0)	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE detalle_orden_venta SET cantidad = (cantidad - @Cantidad),
	monto_vendido = @Monto
	WHERE id = @Id;
END

GO
/****** Object:  StoredProcedure [dbo].[uspActualizarStockPreparado]    Script Date: 19/07/2017 9:35:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspActualizarStockPreparado]
	-- Add the parameters for the stored procedure here
	@Id int,
	@Cantidad int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE preparados SET stock = (stock + @Cantidad)
	WHERE id = @Id;
END

GO
/****** Object:  StoredProcedure [dbo].[uspActualizarStockProducto]    Script Date: 19/07/2017 9:35:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspActualizarStockProducto]
	-- Add the parameters for the stored procedure here
	@Id int,
	@Cantidad int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE productos SET stock = (stock + @Cantidad)
	WHERE id = @Id;
END

GO
/****** Object:  StoredProcedure [dbo].[uspBuscarOrdenAbastecimiento]    Script Date: 19/07/2017 9:35:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspBuscarOrdenAbastecimiento] 
	-- Add the parameters for the stored procedure here
	@Area Varchar(500) = NULL,
	@Responsable Varchar(500) = NULL,
	@Fecha DateTime = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select a.* from orden_abastecimiento a
join empleados b on a.id_responsable = b.id
join areas c on a.id_area = c.id
WHERE (@Area is null or c.descripcion like '%' + REPLACE(@Area, ' ', '%') + '%') and
 (@Responsable is null or CONCAT(b.nombre, ' ', b.apellidos) like '%' + REPLACE(@Responsable, ' ', '%')  + '%') and
 (@Fecha is null or a.fecha = @Fecha);
END

GO
/****** Object:  StoredProcedure [dbo].[uspBuscarOrdenVenta]    Script Date: 19/07/2017 9:35:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspBuscarOrdenVenta] 
	-- Add the parameters for the stored procedure here
	@Num_doc Varchar(50) = NULL,
	@Nombre Varchar(500) = NULL,
	@Fecha DateTime = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select a.*from orden_venta a
join clientes b on a.id_cliente = b.id
WHERE (@Num_doc is null or b.num_documento like '%' + @Num_doc + '%') and
 (@Nombre is null or CONCAT(b.nombres, ' ', b.apellidos) like '%' + REPLACE(@Nombre, ' ', '%')  + '%') and
 (@Fecha is null or a.fecha = @Fecha);
END

GO
/****** Object:  StoredProcedure [dbo].[uspCrearDetalleOrdenDevolucion]    Script Date: 19/07/2017 9:35:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspCrearDetalleOrdenDevolucion]
	-- Add the parameters for the stored procedure here
	@IdOrdenDevolucion int = NULL,
	@IdProducto int = NULL,
	@IdPreparado int = NULL,
	@Codigo Varchar(50) = NULL,
	@Cantidad int = NULL,
	@MontoDevuelto decimal(18,0) = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO detalle_orden_devolucion (id_orden_devolucion, id_producto, id_preparado,
	codigo, cantidad, monto_devuelto)
	VALUES (@IdOrdenDevolucion, @IdProducto, @IdPreparado, @Codigo, @Cantidad, @MontoDevuelto);
END

GO
/****** Object:  StoredProcedure [dbo].[uspCrearOrdenDevolucion]    Script Date: 19/07/2017 9:35:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspCrearOrdenDevolucion] 
	-- Add the parameters for the stored procedure here
	@Codigo Varchar(50)=NULL,
	@Fecha DateTime = NULL,
	@Estado Varchar(150) = NULL, 
	@Motivo Varchar(500) = NULL, 
	@Id_empleado Int = NULL, 
	@Id_aprobador Int = NULL,
	@Tipo_devolucion Int = NULL,
	@Id_orden_venta Int = NULL, 
	@Id_orden_abastecimiento Int = NULL, 
	@Id_cliente Int = NULL,
	@IdNew int = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @table table (id int)
	
	INSERT INTO orden_devolucion(codigo, fecha, estado, motivo, id_empleado, 
	id_aprobador, tipo_devolucion, id_orden_venta, id_orden_abastecimiento, id_cliente) 
	OUTPUT inserted.id into @table
	VALUES 
	(@Codigo, @Fecha, @Estado, @Motivo, @Id_empleado, @Id_aprobador,@Tipo_devolucion,
	@Id_orden_venta, @Id_orden_abastecimiento, @Id_cliente);

	SET @IdNew = (SELECT id from @table);
	Return @IdNew;
END

GO
/****** Object:  StoredProcedure [dbo].[uspGetAreaxId]    Script Date: 19/07/2017 9:35:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspGetAreaxId]
	-- Add the parameters for the stored procedure here
	@Id int = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM areas WHERE ID = @Id;
END

GO
/****** Object:  StoredProcedure [dbo].[uspGetClientexId]    Script Date: 19/07/2017 9:35:40 a. m. ******/
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
/****** Object:  StoredProcedure [dbo].[uspGetDetalleOrdenAbastxOrdenId]    Script Date: 19/07/2017 9:35:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspGetDetalleOrdenAbastxOrdenId]
	@OrdenId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM detalle_orden_abastecimiento WHERE id_orden_abastecimiento = @OrdenId;
END

GO
/****** Object:  StoredProcedure [dbo].[uspGetDetalleOrdenVentaxOrdenId]    Script Date: 19/07/2017 9:35:40 a. m. ******/
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
/****** Object:  StoredProcedure [dbo].[uspGetEmpleadoxId]    Script Date: 19/07/2017 9:35:40 a. m. ******/
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
/****** Object:  StoredProcedure [dbo].[uspGetListJefeFarmacia]    Script Date: 19/07/2017 9:35:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspGetListJefeFarmacia]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM empleados WHERE rol = 'Jefe de Farmacia';
END

GO
/****** Object:  StoredProcedure [dbo].[uspGetOrdenAbastxCod]    Script Date: 19/07/2017 9:35:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspGetOrdenAbastxCod] 
	
	@Codigo Varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Id, codigo, fecha, estado, id_responsable, id_empleado, id_area FROM orden_abastecimiento WHERE codigo like '%'+@Codigo+'%';
END

GO
/****** Object:  StoredProcedure [dbo].[uspGetOrdenVentaxCod]    Script Date: 19/07/2017 9:35:40 a. m. ******/
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
/****** Object:  StoredProcedure [dbo].[uspGetPreparadoxId]    Script Date: 19/07/2017 9:35:40 a. m. ******/
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
/****** Object:  StoredProcedure [dbo].[uspGetProductoxId]    Script Date: 19/07/2017 9:35:40 a. m. ******/
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
/****** Object:  StoredProcedure [dbo].[uspUpdateOrdenDevolucion]    Script Date: 19/07/2017 9:35:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[uspUpdateOrdenDevolucion] 
	-- Add the parameters for the stored procedure here
	@Codigo Varchar(50) = NULL,
	@Id Int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE orden_devolucion SET codigo = @Codigo WHERE id = @Id;
END

GO
/****** Object:  Table [dbo].[areas]    Script Date: 19/07/2017 9:35:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[areas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [varchar](50) NULL,
	[descripcion] [varchar](150) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[clientes]    Script Date: 19/07/2017 9:35:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[detalle_orden_abastecimiento]    Script Date: 19/07/2017 9:35:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[detalle_orden_devolucion]    Script Date: 19/07/2017 9:35:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[detalle_orden_venta]    Script Date: 19/07/2017 9:35:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[detalle_preparado]    Script Date: 19/07/2017 9:35:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[detalle_receta]    Script Date: 19/07/2017 9:35:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[empleados]    Script Date: 19/07/2017 9:35:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[empleados](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [varchar](50) NULL,
	[apellidos] [varchar](150) NULL,
	[nombre] [varchar](150) NULL,
	[tipo_documento] [varchar](150) NULL,
	[nro_documento] [varchar](15) NULL,
	[rol] [varchar](150) NULL,
	[email] [varchar](200) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[orden_abastecimiento]    Script Date: 19/07/2017 9:35:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[orden_abastecimiento](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [varchar](50) NULL,
	[fecha] [datetime] NULL,
	[estado] [varchar](150) NULL,
	[id_responsable] [int] NULL,
	[id_empleado] [int] NULL,
	[id_area] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[orden_devolucion]    Script Date: 19/07/2017 9:35:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orden_devolucion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [nchar](10) NULL,
	[fecha] [nchar](10) NULL,
	[estado] [nchar](10) NULL,
	[motivo] [nchar](10) NULL,
	[id_empleado] [nchar](10) NULL,
	[id_aprobador] [nchar](10) NULL,
	[tipo_devolucion] [nchar](10) NULL,
	[id_orden_venta] [nchar](10) NULL,
	[id_orden_abastecimiento] [nchar](10) NULL,
	[id_cliente] [nchar](10) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[orden_venta]    Script Date: 19/07/2017 9:35:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[pacientes]    Script Date: 19/07/2017 9:35:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[pacientes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_cliente] [int] NULL,
	[nro_historia_clinica] [varchar](150) NULL,
	[dolencia] [varchar](1000) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[preparados]    Script Date: 19/07/2017 9:35:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[preparados](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [varchar](50) NULL,
	[nombre] [varchar](500) NULL,
	[instrucciones] [varchar](1000) NULL,
	[id_empleado] [int] NULL,
	[stock] [int] NULL,
	[precio] [decimal](18, 0) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[productos]    Script Date: 19/07/2017 9:35:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[recetas]    Script Date: 19/07/2017 9:35:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[recetas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [varchar](50) NULL,
	[fecha] [datetime] NULL,
	[vigente] [bit] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[solicitud_preparacion]    Script Date: 19/07/2017 9:35:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[solicitud_preparacion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [varchar](50) NULL,
	[fecha] [datetime] NULL,
	[composicion] [varchar](1000) NULL,
	[id_empleado] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[areas] ON 

INSERT [dbo].[areas] ([id], [codigo], [descripcion]) VALUES (1, N'AR-001', N'Traumatología')
SET IDENTITY_INSERT [dbo].[areas] OFF
SET IDENTITY_INSERT [dbo].[clientes] ON 

INSERT [dbo].[clientes] ([id], [codigo], [nombres], [apellidos], [fecha_nacimiento], [tipo_documento], [num_documento]) VALUES (1, N'CL-001', N'Marco Antonio', N'Vergaray Guerra', CAST(0x7D1A0B00 AS Date), N'DNI', N'47704728')
SET IDENTITY_INSERT [dbo].[clientes] OFF
SET IDENTITY_INSERT [dbo].[detalle_orden_abastecimiento] ON 

INSERT [dbo].[detalle_orden_abastecimiento] ([id], [id_orden_abastecimiento], [id_producto], [id_preparado], [codigo], [cantidad], [monto]) VALUES (1, 1, 1, NULL, N'DOA-001', 1, CAST(15 AS Decimal(18, 0)))
INSERT [dbo].[detalle_orden_abastecimiento] ([id], [id_orden_abastecimiento], [id_producto], [id_preparado], [codigo], [cantidad], [monto]) VALUES (2, 2, NULL, 1, N'DOA-002', 1, CAST(10 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[detalle_orden_abastecimiento] OFF
SET IDENTITY_INSERT [dbo].[detalle_orden_devolucion] ON 

INSERT [dbo].[detalle_orden_devolucion] ([id], [id_orden_devolucion], [id_producto], [id_preparado], [codigo], [cantidad], [monto_devuelto]) VALUES (35, 11, 1, NULL, N'DOD-00011-001', 1, CAST(15 AS Decimal(18, 0)))
INSERT [dbo].[detalle_orden_devolucion] ([id], [id_orden_devolucion], [id_producto], [id_preparado], [codigo], [cantidad], [monto_devuelto]) VALUES (36, 11, NULL, 1, N'DOD-00011-002', 1, CAST(12 AS Decimal(18, 0)))
INSERT [dbo].[detalle_orden_devolucion] ([id], [id_orden_devolucion], [id_producto], [id_preparado], [codigo], [cantidad], [monto_devuelto]) VALUES (38, 13, 1, NULL, N'DOD-00013-001', 1, CAST(15 AS Decimal(18, 0)))
INSERT [dbo].[detalle_orden_devolucion] ([id], [id_orden_devolucion], [id_producto], [id_preparado], [codigo], [cantidad], [monto_devuelto]) VALUES (42, 17, NULL, 1, N'DOD-00017-001', 1, CAST(12 AS Decimal(18, 0)))
INSERT [dbo].[detalle_orden_devolucion] ([id], [id_orden_devolucion], [id_producto], [id_preparado], [codigo], [cantidad], [monto_devuelto]) VALUES (33, 10, 1, NULL, N'DOD-00010-001', 1, CAST(15 AS Decimal(18, 0)))
INSERT [dbo].[detalle_orden_devolucion] ([id], [id_orden_devolucion], [id_producto], [id_preparado], [codigo], [cantidad], [monto_devuelto]) VALUES (34, 10, NULL, 1, N'DOD-00010-002', 2, CAST(24 AS Decimal(18, 0)))
INSERT [dbo].[detalle_orden_devolucion] ([id], [id_orden_devolucion], [id_producto], [id_preparado], [codigo], [cantidad], [monto_devuelto]) VALUES (37, 12, NULL, 1, N'DOD-00012-001', 1, CAST(12 AS Decimal(18, 0)))
INSERT [dbo].[detalle_orden_devolucion] ([id], [id_orden_devolucion], [id_producto], [id_preparado], [codigo], [cantidad], [monto_devuelto]) VALUES (39, 14, 1, NULL, N'DOD-00014-001', 1, CAST(15 AS Decimal(18, 0)))
INSERT [dbo].[detalle_orden_devolucion] ([id], [id_orden_devolucion], [id_producto], [id_preparado], [codigo], [cantidad], [monto_devuelto]) VALUES (40, 15, NULL, 1, N'DOD-00015-001', 1, CAST(12 AS Decimal(18, 0)))
INSERT [dbo].[detalle_orden_devolucion] ([id], [id_orden_devolucion], [id_producto], [id_preparado], [codigo], [cantidad], [monto_devuelto]) VALUES (41, 16, 1, NULL, N'DOD-00016-001', 1, CAST(15 AS Decimal(18, 0)))
INSERT [dbo].[detalle_orden_devolucion] ([id], [id_orden_devolucion], [id_producto], [id_preparado], [codigo], [cantidad], [monto_devuelto]) VALUES (43, 18, NULL, 1, N'DOD-00018-001', 1, CAST(10 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[detalle_orden_devolucion] OFF
SET IDENTITY_INSERT [dbo].[detalle_orden_venta] ON 

INSERT [dbo].[detalle_orden_venta] ([id], [id_orden_venta], [id_producto], [id_preparado], [codigo], [cantidad], [monto_vendido]) VALUES (1, 1, 1, NULL, N'DOV-001', 1, CAST(15 AS Decimal(18, 0)))
INSERT [dbo].[detalle_orden_venta] ([id], [id_orden_venta], [id_producto], [id_preparado], [codigo], [cantidad], [monto_vendido]) VALUES (2, 1, NULL, 1, N'DOV-002', 1, CAST(12 AS Decimal(18, 0)))
INSERT [dbo].[detalle_orden_venta] ([id], [id_orden_venta], [id_producto], [id_preparado], [codigo], [cantidad], [monto_vendido]) VALUES (3, 3, 1, NULL, N'DOV-00003001', 7, CAST(105 AS Decimal(18, 0)))
INSERT [dbo].[detalle_orden_venta] ([id], [id_orden_venta], [id_producto], [id_preparado], [codigo], [cantidad], [monto_vendido]) VALUES (4, 3, NULL, 1, N'DOV-00003002', 13, CAST(156 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[detalle_orden_venta] OFF
SET IDENTITY_INSERT [dbo].[detalle_preparado] ON 

INSERT [dbo].[detalle_preparado] ([id], [id_preparado], [id_producto], [codigo], [cantidad], [composicion]) VALUES (1, 1, 1, N'DPR-001', 1, N'Composicion quimica a ser usada en el preparado.')
SET IDENTITY_INSERT [dbo].[detalle_preparado] OFF
SET IDENTITY_INSERT [dbo].[empleados] ON 

INSERT [dbo].[empleados] ([id], [codigo], [apellidos], [nombre], [tipo_documento], [nro_documento], [rol], [email]) VALUES (1, N'JF-001', N'Valdivia Ponce', N'Patricia', N'DNI', N'47704725', N'Jefe de Farmacia', N'tp2mvergaray@gmail.com')
INSERT [dbo].[empleados] ([id], [codigo], [apellidos], [nombre], [tipo_documento], [nro_documento], [rol], [email]) VALUES (2, N'TF-002', N'Vergaray Guerra', N'Marco', N'DNI', N'47704726', N'Técnico Farmacéutico', N'macoii25a@gmail.com')
INSERT [dbo].[empleados] ([id], [codigo], [apellidos], [nombre], [tipo_documento], [nro_documento], [rol], [email]) VALUES (3, N'TR-003', N'Guerra Garcia', N'Carlos', N'DNI', N'47704727', N'Técnico Traumatologo', N'tp2mvergaray@gmail.com')
SET IDENTITY_INSERT [dbo].[empleados] OFF
SET IDENTITY_INSERT [dbo].[orden_abastecimiento] ON 

INSERT [dbo].[orden_abastecimiento] ([id], [codigo], [fecha], [estado], [id_responsable], [id_empleado], [id_area]) VALUES (1, N'OA-001', CAST(0x0000A7AD00000000 AS DateTime), N'Entregado', 3, 1, 1)
INSERT [dbo].[orden_abastecimiento] ([id], [codigo], [fecha], [estado], [id_responsable], [id_empleado], [id_area]) VALUES (2, N'OA-002', CAST(0x0000A7AD00000000 AS DateTime), N'Entregado', 3, 1, 1)
SET IDENTITY_INSERT [dbo].[orden_abastecimiento] OFF
SET IDENTITY_INSERT [dbo].[orden_devolucion] ON 

INSERT [dbo].[orden_devolucion] ([id], [codigo], [fecha], [estado], [motivo], [id_empleado], [id_aprobador], [tipo_devolucion], [id_orden_venta], [id_orden_abastecimiento], [id_cliente]) VALUES (10, N'OD-00010  ', N'Jul 18 201', N'Generado  ', N'Motivo    ', N'2         ', N'0         ', N'1         ', N'3         ', N'0         ', NULL)
INSERT [dbo].[orden_devolucion] ([id], [codigo], [fecha], [estado], [motivo], [id_empleado], [id_aprobador], [tipo_devolucion], [id_orden_venta], [id_orden_abastecimiento], [id_cliente]) VALUES (12, N'OD-00012  ', N'Jul 18 201', N'Generado  ', N'motivo    ', N'2         ', N'0         ', N'1         ', N'3         ', N'0         ', NULL)
INSERT [dbo].[orden_devolucion] ([id], [codigo], [fecha], [estado], [motivo], [id_empleado], [id_aprobador], [tipo_devolucion], [id_orden_venta], [id_orden_abastecimiento], [id_cliente]) VALUES (14, N'OD-00014  ', N'Jul 18 201', N'Pendiente ', N'motivo    ', N'2         ', N'1         ', N'1         ', N'1         ', N'0         ', NULL)
INSERT [dbo].[orden_devolucion] ([id], [codigo], [fecha], [estado], [motivo], [id_empleado], [id_aprobador], [tipo_devolucion], [id_orden_venta], [id_orden_abastecimiento], [id_cliente]) VALUES (15, N'OD-00015  ', N'Jul 18 201', N'Generado  ', N'Motivo    ', N'2         ', N'0         ', N'1         ', N'3         ', N'0         ', NULL)
INSERT [dbo].[orden_devolucion] ([id], [codigo], [fecha], [estado], [motivo], [id_empleado], [id_aprobador], [tipo_devolucion], [id_orden_venta], [id_orden_abastecimiento], [id_cliente]) VALUES (16, N'OD-00016  ', N'Jul 18 201', N'Pendiente ', N'as        ', N'2         ', N'1         ', N'2         ', N'0         ', N'1         ', NULL)
INSERT [dbo].[orden_devolucion] ([id], [codigo], [fecha], [estado], [motivo], [id_empleado], [id_aprobador], [tipo_devolucion], [id_orden_venta], [id_orden_abastecimiento], [id_cliente]) VALUES (18, N'OD-00018  ', N'Jul 19 201', N'Pendiente ', N'Motivo    ', N'2         ', N'1         ', N'2         ', N'0         ', N'2         ', NULL)
INSERT [dbo].[orden_devolucion] ([id], [codigo], [fecha], [estado], [motivo], [id_empleado], [id_aprobador], [tipo_devolucion], [id_orden_venta], [id_orden_abastecimiento], [id_cliente]) VALUES (11, N'OD-00011  ', N'Jul 18 201', N'Generado  ', N'motivo    ', N'2         ', N'0         ', N'1         ', N'3         ', N'0         ', NULL)
INSERT [dbo].[orden_devolucion] ([id], [codigo], [fecha], [estado], [motivo], [id_empleado], [id_aprobador], [tipo_devolucion], [id_orden_venta], [id_orden_abastecimiento], [id_cliente]) VALUES (13, N'OD-00013  ', N'Jul 18 201', N'Pendiente ', N'Motivo    ', N'2         ', N'1         ', N'1         ', N'1         ', N'0         ', NULL)
INSERT [dbo].[orden_devolucion] ([id], [codigo], [fecha], [estado], [motivo], [id_empleado], [id_aprobador], [tipo_devolucion], [id_orden_venta], [id_orden_abastecimiento], [id_cliente]) VALUES (17, N'OD-00017  ', N'Jul 19 201', N'Generado  ', N'motivo    ', N'2         ', N'0         ', N'1         ', N'3         ', N'0         ', NULL)
SET IDENTITY_INSERT [dbo].[orden_devolucion] OFF
SET IDENTITY_INSERT [dbo].[orden_venta] ON 

INSERT [dbo].[orden_venta] ([id], [codigo], [fecha], [estado], [id_empleado], [id_receta], [id_cliente], [creado_por], [creado_en], [ultima_actualizacion_por], [ultima_actualizacion_en]) VALUES (1, N'OV-001', CAST(0x0000A7AE00110AE4 AS DateTime), N'Entregado', 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[orden_venta] ([id], [codigo], [fecha], [estado], [id_empleado], [id_receta], [id_cliente], [creado_por], [creado_en], [ultima_actualizacion_por], [ultima_actualizacion_en]) VALUES (2, N'OV-002', CAST(0x0000A7B000000000 AS DateTime), N'Pendiente', 1, NULL, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[orden_venta] ([id], [codigo], [fecha], [estado], [id_empleado], [id_receta], [id_cliente], [creado_por], [creado_en], [ultima_actualizacion_por], [ultima_actualizacion_en]) VALUES (3, N'OV-003', CAST(0x0000A7B400000000 AS DateTime), N'Entregado', 1, NULL, 1, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[orden_venta] OFF
SET IDENTITY_INSERT [dbo].[preparados] ON 

INSERT [dbo].[preparados] ([id], [codigo], [nombre], [instrucciones], [id_empleado], [stock], [precio]) VALUES (1, N'PRE-001', N'Preparado 1', N'Instrucciones para el preparado.', 1, 19, NULL)
SET IDENTITY_INSERT [dbo].[preparados] OFF
SET IDENTITY_INSERT [dbo].[productos] ON 

INSERT [dbo].[productos] ([id], [codigo], [descripcion], [marca], [laboratorio], [precio], [dosis], [stock], [unidad_medida], [venta_publico]) VALUES (1, N'PRO-001', N'Producto 1', N'Marca 1', N'Laboratorio 1', CAST(15 AS Decimal(18, 0)), 1, 106, N'mg', 1)
INSERT [dbo].[productos] ([id], [codigo], [descripcion], [marca], [laboratorio], [precio], [dosis], [stock], [unidad_medida], [venta_publico]) VALUES (2, N'PRO-003', N'Producto2', N'Marca 1', N'Laboratorio 1', CAST(11 AS Decimal(18, 0)), 1, 10, N'mg', 1)
INSERT [dbo].[productos] ([id], [codigo], [descripcion], [marca], [laboratorio], [precio], [dosis], [stock], [unidad_medida], [venta_publico]) VALUES (3, N'PRO-004', N'Producto3', N'Marca 1', N'Laboratorio q', CAST(5 AS Decimal(18, 0)), 1, 110, N'mg', 1)
SET IDENTITY_INSERT [dbo].[productos] OFF
USE [master]
GO
ALTER DATABASE [BD_CLINICA] SET  READ_WRITE 
GO
