USE [master]
GO
/****** Object:  Database [DSI]    Script Date: 11/11/2021 11:23:19 ******/
CREATE DATABASE [DSI]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DSI', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\DSI.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DSI_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\DSI_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DSI] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DSI].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DSI] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DSI] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DSI] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DSI] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DSI] SET ARITHABORT OFF 
GO
ALTER DATABASE [DSI] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DSI] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DSI] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DSI] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DSI] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DSI] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DSI] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DSI] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DSI] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DSI] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DSI] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DSI] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DSI] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DSI] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DSI] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DSI] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DSI] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DSI] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DSI] SET  MULTI_USER 
GO
ALTER DATABASE [DSI] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DSI] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DSI] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DSI] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DSI] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DSI', N'ON'
GO
ALTER DATABASE [DSI] SET QUERY_STORE = OFF
GO
USE [DSI]
GO
/****** Object:  Table [dbo].[AsignacionVisita]    Script Date: 11/11/2021 11:23:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AsignacionVisita](
	[cuitGuiaAsignado] [varchar](50) NOT NULL,
	[fechaHoraInicio] [datetime] NOT NULL,
	[fechaHoraFin] [datetime] NULL,
	[numeroReserva] [int] NOT NULL,
 CONSTRAINT [PK_AsignacionVisita] PRIMARY KEY CLUSTERED 
(
	[cuitGuiaAsignado] ASC,
	[fechaHoraInicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CambioEstado]    Script Date: 11/11/2021 11:23:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CambioEstado](
	[fechaHoraInicio] [datetime] NOT NULL,
	[estado] [int] NOT NULL,
	[fechaHoraFin] [datetime] NULL,
	[id] [int] NOT NULL,
 CONSTRAINT [PK_CambioEstado_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cargo]    Script Date: 11/11/2021 11:23:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cargo](
	[idCargo] [int] NOT NULL,
	[descripcion] [varchar](25) NOT NULL,
	[nombre] [varchar](25) NOT NULL,
 CONSTRAINT [PK_Cargo] PRIMARY KEY CLUSTERED 
(
	[idCargo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleExposicion]    Script Date: 11/11/2021 11:23:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleExposicion](
	[codigoObra] [varchar](25) NOT NULL,
	[lugarAsignado] [int] NOT NULL,
	[idExposicion] [int] NOT NULL,
 CONSTRAINT [PK_DetalleExposicion] PRIMARY KEY CLUSTERED 
(
	[codigoObra] ASC,
	[idExposicion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleReserva]    Script Date: 11/11/2021 11:23:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleReserva](
	[numeroreserva] [int] NOT NULL,
	[idexposicion] [int] NOT NULL,
 CONSTRAINT [PK_DetalleReserva] PRIMARY KEY CLUSTERED 
(
	[numeroreserva] ASC,
	[idexposicion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 11/11/2021 11:23:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado](
	[cuit] [varchar](50) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[domicilio] [varchar](50) NULL,
	[mail] [varchar](50) NULL,
	[codigoValidacion] [int] NULL,
	[fechaNacimiento] [datetime] NULL,
	[sexo] [varchar](50) NULL,
	[telefono] [varchar](50) NULL,
	[fechaIngreso] [datetime] NULL,
	[diaSemana] [varchar](10) NULL,
	[cargo] [int] NOT NULL,
	[idSede] [int] NULL,
 CONSTRAINT [PK_Empleado] PRIMARY KEY CLUSTERED 
(
	[cuit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Escuela]    Script Date: 11/11/2021 11:23:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Escuela](
	[domicilio] [varchar](25) NOT NULL,
	[mail] [varchar](25) NOT NULL,
	[nombre] [varchar](25) NOT NULL,
	[telefonoCelular] [varchar](25) NOT NULL,
	[telefonoFijo] [varchar](25) NOT NULL,
	[idEscuela] [int] NOT NULL,
 CONSTRAINT [PK_Escuela] PRIMARY KEY CLUSTERED 
(
	[idEscuela] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estado]    Script Date: 11/11/2021 11:23:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estado](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ambito] [varchar](100) NOT NULL,
	[nombre] [varchar](25) NOT NULL,
 CONSTRAINT [PK_Estado] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exposicion]    Script Date: 11/11/2021 11:23:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exposicion](
	[fechaFin] [datetime] NOT NULL,
	[fechaFinReplanificada] [datetime] NOT NULL,
	[fechaInicio] [datetime] NOT NULL,
	[fechaInicioReplanificada] [datetime] NOT NULL,
	[horaApertura] [time](0) NOT NULL,
	[horaCierre] [time](0) NOT NULL,
	[nombre] [varchar](20) NOT NULL,
	[idExposicion] [int] IDENTITY(1,1) NOT NULL,
	[idSede] [int] NOT NULL,
	[cuitEmpleado] [varchar](50) NOT NULL,
	[publicoDestino] [int] NOT NULL,
	[tipoExposicion] [int] NOT NULL,
 CONSTRAINT [PK_Exposicion] PRIMARY KEY CLUSTERED 
(
	[idExposicion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HorarioEmpleado]    Script Date: 11/11/2021 11:23:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HorarioEmpleado](
	[cuitEmpleado] [varchar](50) NOT NULL,
	[horaIngreso] [time](0) NOT NULL,
	[horaSalida] [time](0) NOT NULL,
	[diaSemana] [varchar](10) NOT NULL,
 CONSTRAINT [PK_HorarioEmpleado] PRIMARY KEY CLUSTERED 
(
	[cuitEmpleado] ASC,
	[diaSemana] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Obra]    Script Date: 11/11/2021 11:23:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Obra](
	[alto] [float] NOT NULL,
	[ancho] [float] NOT NULL,
	[codigo] [varchar](25) NOT NULL,
	[descripcion] [varchar](25) NOT NULL,
	[fechaCreacion] [datetime] NOT NULL,
	[fechaPrimerIngreso] [datetime] NOT NULL,
	[nombreObra] [varchar](25) NOT NULL,
	[peso] [float] NOT NULL,
	[valuacion] [float] NOT NULL,
	[duracionExtendida] [int] NULL,
	[duracionResumida] [int] NULL,
 CONSTRAINT [PK_Obra] PRIMARY KEY CLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PublicoDestino]    Script Date: 11/11/2021 11:23:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PublicoDestino](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](25) NOT NULL,
	[caracteristicas] [varchar](50) NULL,
 CONSTRAINT [PK_PublicoDestino] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReservaVisita]    Script Date: 11/11/2021 11:23:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReservaVisita](
	[numeroReserva] [int] NOT NULL,
	[escuela] [int] NOT NULL,
	[cantidadAlumnos] [int] NOT NULL,
	[cantidadAlumnosConfirmada] [int] NULL,
	[fechaHoraCreacion] [datetime] NOT NULL,
	[fechaHoraReserva] [datetime] NULL,
	[horaFinReal] [time](0) NULL,
	[horaInicioReal] [time](0) NULL,
	[empleado] [varchar](50) NULL,
	[sede] [int] NULL,
	[cambioEstado] [int] NULL,
	[duracion] [int] NULL,
 CONSTRAINT [PK_ReservaVisita] PRIMARY KEY CLUSTERED 
(
	[numeroReserva] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sede]    Script Date: 11/11/2021 11:23:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sede](
	[cantMaximaVisitante] [int] NOT NULL,
	[cantMaximaPorGuia] [int] NOT NULL,
	[nombre] [varchar](20) NOT NULL,
	[idSede] [int] IDENTITY(1,1) NOT NULL,
	[duracionEstimada] [time](0) NOT NULL,
 CONSTRAINT [PK_Sede] PRIMARY KEY CLUSTERED 
(
	[idSede] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sesion]    Script Date: 11/11/2021 11:23:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sesion](
	[fechaInicio] [datetime] NOT NULL,
	[fechaFin] [datetime] NOT NULL,
	[horaInicio] [time](0) NOT NULL,
	[horaFin] [time](0) NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
	[usuario] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Sesion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoExposicion]    Script Date: 11/11/2021 11:23:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoExposicion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](25) NOT NULL,
	[descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_TipoExposicion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoVisita]    Script Date: 11/11/2021 11:23:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoVisita](
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TipoVisita] PRIMARY KEY CLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 11/11/2021 11:23:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[nombre] [varchar](50) NOT NULL,
	[caducidad] [datetime] NOT NULL,
	[contraseña] [varchar](50) NOT NULL,
	[cuitEmpleado] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AsignacionVisita] ([cuitGuiaAsignado], [fechaHoraInicio], [fechaHoraFin], [numeroReserva]) VALUES (N'20-37193463-5', CAST(N'2021-02-07T17:23:00.000' AS DateTime), CAST(N'2021-08-05T12:30:00.000' AS DateTime), 6)
INSERT [dbo].[AsignacionVisita] ([cuitGuiaAsignado], [fechaHoraInicio], [fechaHoraFin], [numeroReserva]) VALUES (N'20-37193463-5', CAST(N'2021-02-07T17:25:00.000' AS DateTime), CAST(N'2021-08-05T12:30:00.000' AS DateTime), 45)
INSERT [dbo].[AsignacionVisita] ([cuitGuiaAsignado], [fechaHoraInicio], [fechaHoraFin], [numeroReserva]) VALUES (N'20-37193463-5', CAST(N'2021-02-07T17:27:47.000' AS DateTime), CAST(N'2021-08-05T12:30:00.000' AS DateTime), 46)
INSERT [dbo].[AsignacionVisita] ([cuitGuiaAsignado], [fechaHoraInicio], [fechaHoraFin], [numeroReserva]) VALUES (N'20-37193463-5', CAST(N'2021-02-07T17:28:43.000' AS DateTime), CAST(N'2021-08-05T12:30:00.000' AS DateTime), 47)
INSERT [dbo].[AsignacionVisita] ([cuitGuiaAsignado], [fechaHoraInicio], [fechaHoraFin], [numeroReserva]) VALUES (N'20-37193463-5', CAST(N'2021-07-02T13:30:00.000' AS DateTime), CAST(N'2021-08-05T12:30:00.000' AS DateTime), 2)
INSERT [dbo].[AsignacionVisita] ([cuitGuiaAsignado], [fechaHoraInicio], [fechaHoraFin], [numeroReserva]) VALUES (N'20-40547937-3', CAST(N'2021-02-07T17:27:47.000' AS DateTime), CAST(N'2021-08-05T12:30:00.000' AS DateTime), 46)
INSERT [dbo].[AsignacionVisita] ([cuitGuiaAsignado], [fechaHoraInicio], [fechaHoraFin], [numeroReserva]) VALUES (N'20-40547937-3', CAST(N'2021-02-07T17:28:43.000' AS DateTime), CAST(N'2021-08-05T12:30:00.000' AS DateTime), 47)
INSERT [dbo].[AsignacionVisita] ([cuitGuiaAsignado], [fechaHoraInicio], [fechaHoraFin], [numeroReserva]) VALUES (N'20-40547937-3', CAST(N'2021-02-07T18:22:56.000' AS DateTime), CAST(N'2021-08-05T12:30:00.000' AS DateTime), 48)
INSERT [dbo].[AsignacionVisita] ([cuitGuiaAsignado], [fechaHoraInicio], [fechaHoraFin], [numeroReserva]) VALUES (N'20-40547937-3', CAST(N'2021-07-01T10:00:00.000' AS DateTime), CAST(N'2021-07-01T12:00:00.000' AS DateTime), 3)
INSERT [dbo].[AsignacionVisita] ([cuitGuiaAsignado], [fechaHoraInicio], [fechaHoraFin], [numeroReserva]) VALUES (N'27-42385822-8', CAST(N'2021-07-04T12:00:00.000' AS DateTime), CAST(N'2021-07-04T15:00:00.000' AS DateTime), 1)
INSERT [dbo].[AsignacionVisita] ([cuitGuiaAsignado], [fechaHoraInicio], [fechaHoraFin], [numeroReserva]) VALUES (N'27-42385822-8', CAST(N'2021-08-08T13:30:00.000' AS DateTime), CAST(N'2021-08-08T14:00:00.000' AS DateTime), 49)
INSERT [dbo].[AsignacionVisita] ([cuitGuiaAsignado], [fechaHoraInicio], [fechaHoraFin], [numeroReserva]) VALUES (N'27-42385822-8', CAST(N'2021-08-08T14:00:00.000' AS DateTime), CAST(N'2021-08-08T14:10:00.000' AS DateTime), 52)
GO
INSERT [dbo].[CambioEstado] ([fechaHoraInicio], [estado], [fechaHoraFin], [id]) VALUES (CAST(N'2020-06-12T00:00:00.000' AS DateTime), 1, CAST(N'2020-07-20T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[CambioEstado] ([fechaHoraInicio], [estado], [fechaHoraFin], [id]) VALUES (CAST(N'2021-11-10T00:00:00.000' AS DateTime), 2, CAST(N'2021-12-02T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[CambioEstado] ([fechaHoraInicio], [estado], [fechaHoraFin], [id]) VALUES (CAST(N'2021-09-21T00:00:00.000' AS DateTime), 3, CAST(N'2021-11-02T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[CambioEstado] ([fechaHoraInicio], [estado], [fechaHoraFin], [id]) VALUES (CAST(N'2021-04-28T00:00:00.000' AS DateTime), 4, CAST(N'2021-12-30T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[CambioEstado] ([fechaHoraInicio], [estado], [fechaHoraFin], [id]) VALUES (CAST(N'2021-02-13T00:00:00.000' AS DateTime), 4, CAST(N'2022-07-21T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[CambioEstado] ([fechaHoraInicio], [estado], [fechaHoraFin], [id]) VALUES (CAST(N'2021-11-11T00:37:59.917' AS DateTime), 4, NULL, 6)
INSERT [dbo].[CambioEstado] ([fechaHoraInicio], [estado], [fechaHoraFin], [id]) VALUES (CAST(N'2021-11-11T00:41:05.377' AS DateTime), 4, NULL, 7)
GO
INSERT [dbo].[Cargo] ([idCargo], [descripcion], [nombre]) VALUES (1, N'Recorrido de visitas', N'Guia')
INSERT [dbo].[Cargo] ([idCargo], [descripcion], [nombre]) VALUES (2, N'Reponer obras', N'Repositor')
INSERT [dbo].[Cargo] ([idCargo], [descripcion], [nombre]) VALUES (3, N'Registro de visitas', N'Recepcionista')
GO
INSERT [dbo].[DetalleExposicion] ([codigoObra], [lugarAsignado], [idExposicion]) VALUES (N'089', 15, 1)
INSERT [dbo].[DetalleExposicion] ([codigoObra], [lugarAsignado], [idExposicion]) VALUES (N'101', 16, 2)
INSERT [dbo].[DetalleExposicion] ([codigoObra], [lugarAsignado], [idExposicion]) VALUES (N'106', 4, 3)
GO
INSERT [dbo].[DetalleReserva] ([numeroreserva], [idexposicion]) VALUES (1, 1)
INSERT [dbo].[DetalleReserva] ([numeroreserva], [idexposicion]) VALUES (1, 2)
INSERT [dbo].[DetalleReserva] ([numeroreserva], [idexposicion]) VALUES (2, 1)
INSERT [dbo].[DetalleReserva] ([numeroreserva], [idexposicion]) VALUES (6, 1)
INSERT [dbo].[DetalleReserva] ([numeroreserva], [idexposicion]) VALUES (45, 1)
INSERT [dbo].[DetalleReserva] ([numeroreserva], [idexposicion]) VALUES (45, 3)
INSERT [dbo].[DetalleReserva] ([numeroreserva], [idexposicion]) VALUES (46, 1)
INSERT [dbo].[DetalleReserva] ([numeroreserva], [idexposicion]) VALUES (47, 1)
INSERT [dbo].[DetalleReserva] ([numeroreserva], [idexposicion]) VALUES (47, 3)
INSERT [dbo].[DetalleReserva] ([numeroreserva], [idexposicion]) VALUES (48, 1)
INSERT [dbo].[DetalleReserva] ([numeroreserva], [idexposicion]) VALUES (48, 3)
INSERT [dbo].[DetalleReserva] ([numeroreserva], [idexposicion]) VALUES (49, 1)
INSERT [dbo].[DetalleReserva] ([numeroreserva], [idexposicion]) VALUES (52, 1)
GO
INSERT [dbo].[Empleado] ([cuit], [nombre], [apellido], [domicilio], [mail], [codigoValidacion], [fechaNacimiento], [sexo], [telefono], [fechaIngreso], [diaSemana], [cargo], [idSede]) VALUES (N'20-36987230-4', N'Luis', N'Alvarez', N'Chaco 9803', N'luis.alv@gmail.com', 29, CAST(N'1997-08-21T00:00:00.000' AS DateTime), N'Masculino', N'351998345', CAST(N'2006-10-12T00:00:00.000' AS DateTime), NULL, 1, 1)
INSERT [dbo].[Empleado] ([cuit], [nombre], [apellido], [domicilio], [mail], [codigoValidacion], [fechaNacimiento], [sexo], [telefono], [fechaIngreso], [diaSemana], [cargo], [idSede]) VALUES (N'20-37193463-5', N'Juan', N'Perez', N'Maldonado 4307', N'juanperez@gmail.com', 18, CAST(N'1993-06-07T00:00:00.000' AS DateTime), N'Masculino', N'3513487591', CAST(N'2005-04-18T00:00:00.000' AS DateTime), NULL, 1, 2)
INSERT [dbo].[Empleado] ([cuit], [nombre], [apellido], [domicilio], [mail], [codigoValidacion], [fechaNacimiento], [sexo], [telefono], [fechaIngreso], [diaSemana], [cargo], [idSede]) VALUES (N'20-40547937-3', N'Jose', N'Juarez', N'Tejeda 2450', N'josejuarez@gmail.com', 4, CAST(N'1996-05-30T00:00:00.000' AS DateTime), N'Masculino', N'3510868930', CAST(N'2009-11-25T00:00:00.000' AS DateTime), NULL, 1, 2)
INSERT [dbo].[Empleado] ([cuit], [nombre], [apellido], [domicilio], [mail], [codigoValidacion], [fechaNacimiento], [sexo], [telefono], [fechaIngreso], [diaSemana], [cargo], [idSede]) VALUES (N'27-35986572-1', N'Laura', N'Sallito', N'La paz 0824', N'lausallito@gmail.com', 20, CAST(N'1997-08-04T00:00:00.000' AS DateTime), N'Femenino', N'3518645230', CAST(N'2015-10-02T00:00:00.000' AS DateTime), NULL, 1, 2)
INSERT [dbo].[Empleado] ([cuit], [nombre], [apellido], [domicilio], [mail], [codigoValidacion], [fechaNacimiento], [sexo], [telefono], [fechaIngreso], [diaSemana], [cargo], [idSede]) VALUES (N'27-39657992-9', N'Carla', N'Ruiz', N'Laplace 4355', N'carla98@gmail.com', 27, CAST(N'1999-11-07T00:00:00.000' AS DateTime), N'Femenino', N'3517845588', CAST(N'2016-02-17T00:00:00.000' AS DateTime), NULL, 1, 3)
INSERT [dbo].[Empleado] ([cuit], [nombre], [apellido], [domicilio], [mail], [codigoValidacion], [fechaNacimiento], [sexo], [telefono], [fechaIngreso], [diaSemana], [cargo], [idSede]) VALUES (N'27-39754779-8', N'Emilia', N'Carranza', N'Castro Barros', N'emicarranza@gmail.com', 39, CAST(N'1997-07-22T00:00:00.000' AS DateTime), N'Femenino', N'3516302691', CAST(N'2009-11-19T00:00:00.000' AS DateTime), NULL, 2, 1)
INSERT [dbo].[Empleado] ([cuit], [nombre], [apellido], [domicilio], [mail], [codigoValidacion], [fechaNacimiento], [sexo], [telefono], [fechaIngreso], [diaSemana], [cargo], [idSede]) VALUES (N'27-42385822-8', N'Maria', N'Lopez', N'Nuñez 4652', N'marialopez@gmail.com', 12, CAST(N'1996-09-23T00:00:00.000' AS DateTime), N'Femenino', N'3519746529', CAST(N'2008-02-07T00:00:00.000' AS DateTime), NULL, 1, 1)
INSERT [dbo].[Empleado] ([cuit], [nombre], [apellido], [domicilio], [mail], [codigoValidacion], [fechaNacimiento], [sexo], [telefono], [fechaIngreso], [diaSemana], [cargo], [idSede]) VALUES (N'27-43337940-9', N'Valentino', N'Giardino', N'Los arces', N'valen@gadsgf', 12, CAST(N'2001-04-14T00:00:00.000' AS DateTime), N'Masculino', N'3241324', CAST(N'2021-03-12T00:00:00.000' AS DateTime), NULL, 1, 1)
GO
INSERT [dbo].[Escuela] ([domicilio], [mail], [nombre], [telefonoCelular], [telefonoFijo], [idEscuela]) VALUES (N'Rivadavia 2458', N'lasalle@gmail.com', N'La Salle', N'35125678930', N'0354321465789', 1)
INSERT [dbo].[Escuela] ([domicilio], [mail], [nombre], [telefonoCelular], [telefonoFijo], [idEscuela]) VALUES (N'Tucuman 3008', N'manuelbelgrano@gmail.com', N'Manuel Belgrano', N'35120975387', N'03549008738', 2)
INSERT [dbo].[Escuela] ([domicilio], [mail], [nombre], [telefonoCelular], [telefonoFijo], [idEscuela]) VALUES (N'Gauss 5578', N'monserrat@gmail.com', N'Monserrat', N'3519800354', N'0354998356', 3)
GO
SET IDENTITY_INSERT [dbo].[Estado] ON 

INSERT [dbo].[Estado] ([id], [ambito], [nombre]) VALUES (1, N'Obra', N'En exposición')
INSERT [dbo].[Estado] ([id], [ambito], [nombre]) VALUES (2, N'Obra', N'En deposito')
INSERT [dbo].[Estado] ([id], [ambito], [nombre]) VALUES (3, N'Obra', N'En reparación')
INSERT [dbo].[Estado] ([id], [ambito], [nombre]) VALUES (4, N'Reserva', N'Pendiente de confirmación')
INSERT [dbo].[Estado] ([id], [ambito], [nombre]) VALUES (5, N'Reserva', N'Confirmado')
SET IDENTITY_INSERT [dbo].[Estado] OFF
GO
SET IDENTITY_INSERT [dbo].[Exposicion] ON 

INSERT [dbo].[Exposicion] ([fechaFin], [fechaFinReplanificada], [fechaInicio], [fechaInicioReplanificada], [horaApertura], [horaCierre], [nombre], [idExposicion], [idSede], [cuitEmpleado], [publicoDestino], [tipoExposicion]) VALUES (CAST(N'2021-11-29T00:00:00.000' AS DateTime), CAST(N'2021-01-21T00:00:00.000' AS DateTime), CAST(N'2019-01-22T00:00:00.000' AS DateTime), CAST(N'2019-01-22T00:00:00.000' AS DateTime), CAST(N'13:32:00' AS Time), CAST(N'15:00:00' AS Time), N'Expresionismo', 1, 1, N'20-37193463-5', 1, 2)
INSERT [dbo].[Exposicion] ([fechaFin], [fechaFinReplanificada], [fechaInicio], [fechaInicioReplanificada], [horaApertura], [horaCierre], [nombre], [idExposicion], [idSede], [cuitEmpleado], [publicoDestino], [tipoExposicion]) VALUES (CAST(N'2011-12-05T00:00:00.000' AS DateTime), CAST(N'2021-08-20T00:00:00.000' AS DateTime), CAST(N'2019-08-12T00:00:00.000' AS DateTime), CAST(N'2019-09-12T00:00:00.000' AS DateTime), CAST(N'09:30:00' AS Time), CAST(N'12:30:00' AS Time), N'Postmodernismo', 2, 2, N'27-42385822-8', 3, 2)
INSERT [dbo].[Exposicion] ([fechaFin], [fechaFinReplanificada], [fechaInicio], [fechaInicioReplanificada], [horaApertura], [horaCierre], [nombre], [idExposicion], [idSede], [cuitEmpleado], [publicoDestino], [tipoExposicion]) VALUES (CAST(N'2021-08-30T00:00:00.000' AS DateTime), CAST(N'2021-08-30T00:00:00.000' AS DateTime), CAST(N'2020-04-28T00:00:00.000' AS DateTime), CAST(N'2020-04-30T00:00:00.000' AS DateTime), CAST(N'12:00:00' AS Time), CAST(N'16:00:00' AS Time), N'Naturaleza muerta', 3, 1, N'20-37193463-5', 1, 3)
INSERT [dbo].[Exposicion] ([fechaFin], [fechaFinReplanificada], [fechaInicio], [fechaInicioReplanificada], [horaApertura], [horaCierre], [nombre], [idExposicion], [idSede], [cuitEmpleado], [publicoDestino], [tipoExposicion]) VALUES (CAST(N'2021-09-01T00:00:00.000' AS DateTime), CAST(N'2022-09-05T00:00:00.000' AS DateTime), CAST(N'2021-06-28T00:00:00.000' AS DateTime), CAST(N'2021-06-29T00:00:00.000' AS DateTime), CAST(N'15:45:00' AS Time), CAST(N'17:30:00' AS Time), N'Sociales', 4, 2, N'20-37193463-5', 1, 3)
INSERT [dbo].[Exposicion] ([fechaFin], [fechaFinReplanificada], [fechaInicio], [fechaInicioReplanificada], [horaApertura], [horaCierre], [nombre], [idExposicion], [idSede], [cuitEmpleado], [publicoDestino], [tipoExposicion]) VALUES (CAST(N'2022-01-03T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime), CAST(N'2021-07-01T00:00:00.000' AS DateTime), CAST(N'2021-07-02T00:00:00.000' AS DateTime), CAST(N'11:30:00' AS Time), CAST(N'14:00:00' AS Time), N'Sol', 5, 3, N'27-39754779-8', 2, 1)
INSERT [dbo].[Exposicion] ([fechaFin], [fechaFinReplanificada], [fechaInicio], [fechaInicioReplanificada], [horaApertura], [horaCierre], [nombre], [idExposicion], [idSede], [cuitEmpleado], [publicoDestino], [tipoExposicion]) VALUES (CAST(N'2021-08-03T00:00:00.000' AS DateTime), CAST(N'2021-08-03T00:00:00.000' AS DateTime), CAST(N'2021-07-01T00:00:00.000' AS DateTime), CAST(N'2021-07-01T00:00:00.000' AS DateTime), CAST(N'12:00:00' AS Time), CAST(N'18:00:00' AS Time), N'JUANCARLO', 6, 3, N'27-39754779-8', 2, 2)
SET IDENTITY_INSERT [dbo].[Exposicion] OFF
GO
INSERT [dbo].[HorarioEmpleado] ([cuitEmpleado], [horaIngreso], [horaSalida], [diaSemana]) VALUES (N'20-37193463-5', CAST(N'08:30:00' AS Time), CAST(N'12:30:00' AS Time), N'Lunes')
INSERT [dbo].[HorarioEmpleado] ([cuitEmpleado], [horaIngreso], [horaSalida], [diaSemana]) VALUES (N'20-40547937-3', CAST(N'10:30:00' AS Time), CAST(N'14:30:00' AS Time), N'Martes')
INSERT [dbo].[HorarioEmpleado] ([cuitEmpleado], [horaIngreso], [horaSalida], [diaSemana]) VALUES (N'27-42385822-8', CAST(N'13:30:00' AS Time), CAST(N'16:00:00' AS Time), N'Jueves')
INSERT [dbo].[HorarioEmpleado] ([cuitEmpleado], [horaIngreso], [horaSalida], [diaSemana]) VALUES (N'27-43337940-9', CAST(N'13:00:00' AS Time), CAST(N'15:00:00' AS Time), N'Jueves')
GO
INSERT [dbo].[Obra] ([alto], [ancho], [codigo], [descripcion], [fechaCreacion], [fechaPrimerIngreso], [nombreObra], [peso], [valuacion], [duracionExtendida], [duracionResumida]) VALUES (1, 30, N'089', N'Obra antigua', CAST(N'2013-06-26T00:00:00.000' AS DateTime), CAST(N'2015-09-20T00:00:00.000' AS DateTime), N'La Mona Lisa', 0.8, 89767.2, 30, 10)
INSERT [dbo].[Obra] ([alto], [ancho], [codigo], [descripcion], [fechaCreacion], [fechaPrimerIngreso], [nombreObra], [peso], [valuacion], [duracionExtendida], [duracionResumida]) VALUES (2, 120, N'101', N'Obra abstracta', CAST(N'2018-01-09T00:00:00.000' AS DateTime), CAST(N'2019-01-10T00:00:00.000' AS DateTime), N'Arte Loco', 0.9, 89.87, 40, 20)
INSERT [dbo].[Obra] ([alto], [ancho], [codigo], [descripcion], [fechaCreacion], [fechaPrimerIngreso], [nombreObra], [peso], [valuacion], [duracionExtendida], [duracionResumida]) VALUES (3, 40, N'106', N'Obra moderna', CAST(N'2018-03-07T00:00:00.000' AS DateTime), CAST(N'2018-12-21T00:00:00.000' AS DateTime), N'Locura', 0.8, 891.87, 80, 15)
GO
SET IDENTITY_INSERT [dbo].[PublicoDestino] ON 

INSERT [dbo].[PublicoDestino] ([id], [nombre], [caracteristicas]) VALUES (1, N'Todo publico', N'Explicacion general')
INSERT [dbo].[PublicoDestino] ([id], [nombre], [caracteristicas]) VALUES (2, N'Artistas', N'Explicacion avanzada')
INSERT [dbo].[PublicoDestino] ([id], [nombre], [caracteristicas]) VALUES (3, N'Niños', N'Explicacion basica')
SET IDENTITY_INSERT [dbo].[PublicoDestino] OFF
GO


INSERT [dbo].[ReservaVisita] ([numeroReserva], [escuela], [cantidadAlumnos], [cantidadAlumnosConfirmada], [fechaHoraCreacion], [fechaHoraReserva], [horaFinReal], [horaInicioReal], [empleado], [sede], [cambioEstado], [duracion]) VALUES (1, 3, 60, 34, CAST(N'2021-06-24T17:08:16.000' AS DateTime), CAST(N'2021-07-04T12:00:00.000' AS DateTime), CAST(N'14:30:00' AS Time), CAST(N'12:40:00' AS Time), N'27-42385822-8', 1, 1, 30)
INSERT [dbo].[ReservaVisita] ([numeroReserva], [escuela], [cantidadAlumnos], [cantidadAlumnosConfirmada], [fechaHoraCreacion], [fechaHoraReserva], [horaFinReal], [horaInicioReal], [empleado], [sede], [cambioEstado], [duracion]) VALUES (2, 2, 200, 20, CAST(N'2021-07-01T13:00:00.000' AS DateTime), CAST(N'2021-07-01T13:30:00.000' AS DateTime), CAST(N'16:00:00' AS Time), CAST(N'14:00:00' AS Time),NULL, 2, 3, 40)
INSERT [dbo].[ReservaVisita] ([numeroReserva], [escuela], [cantidadAlumnos], [cantidadAlumnosConfirmada], [fechaHoraCreacion], [fechaHoraReserva], [horaFinReal], [horaInicioReal], [empleado], [sede], [cambioEstado], [duracion]) VALUES (3, 1, 105, 78, CAST(N'2021-06-24T17:08:16.000' AS DateTime), CAST(N'2021-07-01T10:00:00.000' AS DateTime), CAST(N'10:20:00' AS Time), CAST(N'14:00:00' AS Time), N'20-40547937-3', 3, 2, 50)
INSERT [dbo].[ReservaVisita] ([numeroReserva], [escuela], [cantidadAlumnos], [cantidadAlumnosConfirmada], [fechaHoraCreacion], [fechaHoraReserva], [horaFinReal], [horaInicioReal], [empleado], [sede], [cambioEstado], [duracion]) VALUES (5, 1, 20, 0, CAST(N'2021-06-24T17:08:16.000' AS DateTime), CAST(N'2021-07-01T10:00:00.000' AS DateTime), NULL, NULL, N'27-42385822-8', 1, 1, 60)
INSERT [dbo].[ReservaVisita] ([numeroReserva], [escuela], [cantidadAlumnos], [cantidadAlumnosConfirmada], [fechaHoraCreacion], [fechaHoraReserva], [horaFinReal], [horaInicioReal], [empleado], [sede], [cambioEstado], [duracion]) VALUES (44, 1, 20, 0, CAST(N'2021-02-07T17:23:00.000' AS DateTime), CAST(N'2021-07-01T10:00:00.000' AS DateTime), NULL, NULL, N'27-42385822-8', 1, 4, 20)
INSERT [dbo].[ReservaVisita] ([numeroReserva], [escuela], [cantidadAlumnos], [cantidadAlumnosConfirmada], [fechaHoraCreacion], [fechaHoraReserva], [horaFinReal], [horaInicioReal], [empleado], [sede], [cambioEstado], [duracion]) VALUES (45, 1, 20, 0, CAST(N'2021-02-07T17:25:00.000' AS DateTime), CAST(N'2021-07-01T10:00:00.000' AS DateTime), NULL, NULL, N'27-42385822-8', 1, 4, 10)
INSERT [dbo].[ReservaVisita] ([numeroReserva], [escuela], [cantidadAlumnos], [cantidadAlumnosConfirmada], [fechaHoraCreacion], [fechaHoraReserva], [horaFinReal], [horaInicioReal], [empleado], [sede], [cambioEstado], [duracion]) VALUES (46, 2, 20, 0, CAST(N'2021-02-07T17:27:47.000' AS DateTime), CAST(N'2021-07-01T10:00:00.000' AS DateTime), NULL, NULL, N'27-42385822-8', 1, 4, 15)
INSERT [dbo].[ReservaVisita] ([numeroReserva], [escuela], [cantidadAlumnos], [cantidadAlumnosConfirmada], [fechaHoraCreacion], [fechaHoraReserva], [horaFinReal], [horaInicioReal], [empleado], [sede], [cambioEstado], [duracion]) VALUES (47, 1, 23, 0, CAST(N'2021-02-07T17:28:43.000' AS DateTime), CAST(N'2021-08-05T13:00:00.000' AS DateTime), NULL, NULL, N'27-42385822-8', 1, 4, 120)
INSERT [dbo].[ReservaVisita] ([numeroReserva], [escuela], [cantidadAlumnos], [cantidadAlumnosConfirmada], [fechaHoraCreacion], [fechaHoraReserva], [horaFinReal], [horaInicioReal], [empleado], [sede], [cambioEstado], [duracion]) VALUES (48, 1, 45, 0, CAST(N'2021-02-07T18:22:56.000' AS DateTime), CAST(N'2021-01-07T13:00:00.000' AS DateTime), NULL, NULL, N'27-42385822-8', 1, 4, 90)
INSERT [dbo].[ReservaVisita] ([numeroReserva], [escuela], [cantidadAlumnos], [cantidadAlumnosConfirmada], [fechaHoraCreacion], [fechaHoraReserva], [horaFinReal], [horaInicioReal], [empleado], [sede], [cambioEstado], [duracion]) VALUES (51, 1, 20, 0, CAST(N'2021-11-11T00:37:59.917' AS DateTime), CAST(N'2021-08-08T13:30:00.000' AS DateTime), NULL, NULL, N'27-43337940-9', 1, 6, 30)
INSERT [dbo].[ReservaVisita] ([numeroReserva], [escuela], [cantidadAlumnos], [cantidadAlumnosConfirmada], [fechaHoraCreacion], [fechaHoraReserva], [horaFinReal], [horaInicioReal], [empleado], [sede], [cambioEstado], [duracion]) VALUES (52, 1, 20, 0, CAST(N'2021-11-11T00:41:05.377' AS DateTime), CAST(N'2021-08-08T14:00:00.000' AS DateTime), NULL, NULL, N'27-43337940-9', 1, 7, 10)

GO
SET IDENTITY_INSERT [dbo].[Sede] ON 

INSERT [dbo].[Sede] ([cantMaximaVisitante], [cantMaximaPorGuia], [nombre], [idSede], [duracionEstimada]) VALUES (350, 50, N'Sede1', 1, CAST(N'01:00:00' AS Time))
INSERT [dbo].[Sede] ([cantMaximaVisitante], [cantMaximaPorGuia], [nombre], [idSede], [duracionEstimada]) VALUES (800, 60, N'Sede2', 2, CAST(N'01:30:00' AS Time))
INSERT [dbo].[Sede] ([cantMaximaVisitante], [cantMaximaPorGuia], [nombre], [idSede], [duracionEstimada]) VALUES (500, 50, N'Sede3', 3, CAST(N'02:00:00' AS Time))
SET IDENTITY_INSERT [dbo].[Sede] OFF
GO
SET IDENTITY_INSERT [dbo].[Sesion] ON 

INSERT [dbo].[Sesion] ([fechaInicio], [fechaFin], [horaInicio], [horaFin], [id], [usuario]) VALUES (CAST(N'2021-04-09T00:00:00.000' AS DateTime), CAST(N'2021-04-11T00:00:00.000' AS DateTime), CAST(N'09:00:00' AS Time), CAST(N'12:30:00' AS Time), 1, N'Juli123')
INSERT [dbo].[Sesion] ([fechaInicio], [fechaFin], [horaInicio], [horaFin], [id], [usuario]) VALUES (CAST(N'2021-05-12T00:00:00.000' AS DateTime), CAST(N'2021-05-18T00:00:00.000' AS DateTime), CAST(N'09:40:00' AS Time), CAST(N'12:30:00' AS Time), 2, N'MariaL')
INSERT [dbo].[Sesion] ([fechaInicio], [fechaFin], [horaInicio], [horaFin], [id], [usuario]) VALUES (CAST(N'2021-02-21T00:00:00.000' AS DateTime), CAST(N'2021-02-28T00:00:00.000' AS DateTime), CAST(N'08:20:00' AS Time), CAST(N'10:45:00' AS Time), 3, N'ClaudiaAguirre')
SET IDENTITY_INSERT [dbo].[Sesion] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoExposicion] ON 

INSERT [dbo].[TipoExposicion] ([id], [nombre], [descripcion]) VALUES (1, N'Temporal', N'modernismo')
INSERT [dbo].[TipoExposicion] ([id], [nombre], [descripcion]) VALUES (2, N'Temporal', N'arte renacentista')
INSERT [dbo].[TipoExposicion] ([id], [nombre], [descripcion]) VALUES (3, N'Temporal', N'abstracto')
SET IDENTITY_INSERT [dbo].[TipoExposicion] OFF
GO
INSERT [dbo].[TipoVisita] ([nombre]) VALUES (N'Completa')
INSERT [dbo].[TipoVisita] ([nombre]) VALUES (N'Por Exposicion')
GO
INSERT [dbo].[Usuario] ([nombre], [caducidad], [contraseña], [cuitEmpleado]) VALUES (N'ClaudiaAguirre', CAST(N'2024-02-28T00:00:00.000' AS DateTime), N'lg456K', N'27-42385822-8')
INSERT [dbo].[Usuario] ([nombre], [caducidad], [contraseña], [cuitEmpleado]) VALUES (N'Juli123', CAST(N'2024-02-28T00:00:00.000' AS DateTime), N'fd345K', N'20-37193463-5')
INSERT [dbo].[Usuario] ([nombre], [caducidad], [contraseña], [cuitEmpleado]) VALUES (N'MariaL', CAST(N'2024-02-28T00:00:00.000' AS DateTime), N'mariamaria', N'20-37193463-5')
GO
ALTER TABLE [dbo].[DetalleExposicion]  WITH CHECK ADD  CONSTRAINT [FK_DetalleExposicion_Exposicion] FOREIGN KEY([idExposicion])
REFERENCES [dbo].[Exposicion] ([idExposicion])
GO
ALTER TABLE [dbo].[DetalleExposicion] CHECK CONSTRAINT [FK_DetalleExposicion_Exposicion]
GO
ALTER TABLE [dbo].[DetalleExposicion]  WITH CHECK ADD  CONSTRAINT [FK_DetalleExposicion_Obra] FOREIGN KEY([codigoObra])
REFERENCES [dbo].[Obra] ([codigo])
GO
ALTER TABLE [dbo].[DetalleExposicion] CHECK CONSTRAINT [FK_DetalleExposicion_Obra]
GO
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [FK_Empleado_Cargo] FOREIGN KEY([cargo])
REFERENCES [dbo].[Cargo] ([idCargo])
GO
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [FK_Empleado_Cargo]
GO
ALTER TABLE [dbo].[Exposicion]  WITH CHECK ADD  CONSTRAINT [FK_Exposicion_Empleado] FOREIGN KEY([cuitEmpleado])
REFERENCES [dbo].[Empleado] ([cuit])
GO
ALTER TABLE [dbo].[Exposicion] CHECK CONSTRAINT [FK_Exposicion_Empleado]
GO
ALTER TABLE [dbo].[Exposicion]  WITH CHECK ADD  CONSTRAINT [FK_Exposicion_Exposicion] FOREIGN KEY([idExposicion])
REFERENCES [dbo].[Exposicion] ([idExposicion])
GO
ALTER TABLE [dbo].[Exposicion] CHECK CONSTRAINT [FK_Exposicion_Exposicion]
GO
ALTER TABLE [dbo].[Exposicion]  WITH CHECK ADD  CONSTRAINT [FK_Exposicion_Exposicion1] FOREIGN KEY([idExposicion])
REFERENCES [dbo].[Exposicion] ([idExposicion])
GO
ALTER TABLE [dbo].[Exposicion] CHECK CONSTRAINT [FK_Exposicion_Exposicion1]
GO
ALTER TABLE [dbo].[Exposicion]  WITH CHECK ADD  CONSTRAINT [FK_Exposicion_PublicoDestino] FOREIGN KEY([publicoDestino])
REFERENCES [dbo].[PublicoDestino] ([id])
GO
ALTER TABLE [dbo].[Exposicion] CHECK CONSTRAINT [FK_Exposicion_PublicoDestino]
GO
ALTER TABLE [dbo].[Exposicion]  WITH CHECK ADD  CONSTRAINT [FK_Exposicion_TipoExposicion] FOREIGN KEY([tipoExposicion])
REFERENCES [dbo].[TipoExposicion] ([id])
GO
ALTER TABLE [dbo].[Exposicion] CHECK CONSTRAINT [FK_Exposicion_TipoExposicion]
GO
ALTER TABLE [dbo].[Sesion]  WITH CHECK ADD  CONSTRAINT [FK_Sesion_Usuario] FOREIGN KEY([usuario])
REFERENCES [dbo].[Usuario] ([nombre])
GO
ALTER TABLE [dbo].[Sesion] CHECK CONSTRAINT [FK_Sesion_Usuario]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Empleado] FOREIGN KEY([cuitEmpleado])
REFERENCES [dbo].[Empleado] ([cuit])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Empleado]
GO
USE [master]
GO
ALTER DATABASE [DSI] SET  READ_WRITE 
GO
