USE [master]
GO
/****** Object:  Database [CONSULTORIO]    Script Date: 24/05/2020 12:38:01 ******/
CREATE DATABASE [CONSULTORIO]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CONSULTORIO', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\CONSULTORIO.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CONSULTORIO_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\CONSULTORIO_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [CONSULTORIO] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CONSULTORIO].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CONSULTORIO] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CONSULTORIO] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CONSULTORIO] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CONSULTORIO] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CONSULTORIO] SET ARITHABORT OFF 
GO
ALTER DATABASE [CONSULTORIO] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CONSULTORIO] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CONSULTORIO] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CONSULTORIO] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CONSULTORIO] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CONSULTORIO] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CONSULTORIO] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CONSULTORIO] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CONSULTORIO] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CONSULTORIO] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CONSULTORIO] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CONSULTORIO] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CONSULTORIO] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CONSULTORIO] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CONSULTORIO] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CONSULTORIO] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CONSULTORIO] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CONSULTORIO] SET RECOVERY FULL 
GO
ALTER DATABASE [CONSULTORIO] SET  MULTI_USER 
GO
ALTER DATABASE [CONSULTORIO] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CONSULTORIO] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CONSULTORIO] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CONSULTORIO] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CONSULTORIO] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'CONSULTORIO', N'ON'
GO
ALTER DATABASE [CONSULTORIO] SET QUERY_STORE = OFF
GO
USE [CONSULTORIO]
GO
/****** Object:  Table [dbo].[ANTECEDENTES]    Script Date: 24/05/2020 12:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ANTECEDENTES](
	[IDANT] [int] NOT NULL,
	[PESO] [decimal](18, 0) NOT NULL,
	[ALTURA] [decimal](18, 0) NOT NULL,
	[PRESION] [decimal](18, 0) NOT NULL,
	[GLUCOSA] [decimal](18, 0) NOT NULL,
	[TEMPERATURA] [decimal](18, 0) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDANT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DOCTORES]    Script Date: 24/05/2020 12:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DOCTORES](
	[NUMEMPLEADO] [int] NOT NULL,
	[NOMBRE] [varchar](1) NOT NULL,
	[APPAT] [varchar](1) NOT NULL,
	[APMAT] [varchar](1) NOT NULL,
	[FECHANAC] [datetime] NOT NULL,
	[EDAD]  AS (datediff(day,[FECHANAC],getdate())),
	[SEXO] [char](1) NOT NULL,
	[SUELDO]  AS ((170)*(8)),
	[ESPECIAL] [varchar](1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[NUMEMPLEADO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MEDICAMENTO]    Script Date: 24/05/2020 12:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MEDICAMENTO](
	[IDMEDI] [int] NOT NULL,
	[NOMBRE] [varchar](1) NOT NULL,
	[TIPOVEN] [varchar](1) NOT NULL,
	[FECHACAD] [datetime] NOT NULL,
	[DIASLIM]  AS (datediff(day,[FECHACAD],getdate())),
	[PRECIOVEN] [decimal](18, 0) NOT NULL,
	[PRECIOCOM] [decimal](18, 0) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDMEDI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PACIENTES]    Script Date: 24/05/2020 12:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PACIENTES](
	[IDPACI] [int] NOT NULL,
	[NOMBRE] [varchar](1) NOT NULL,
	[APPAT] [varchar](1) NOT NULL,
	[APMAT] [varchar](1) NOT NULL,
	[FECHANAC] [datetime] NOT NULL,
	[EDAD]  AS (datediff(day,[FECHANAC],getdate())),
	[SEXO] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDPACI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RECETA]    Script Date: 24/05/2020 12:38:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RECETA](
	[IDREC] [int] NOT NULL,
	[IDPACI] [int] NOT NULL,
	[IDANT] [int] NOT NULL,
	[IDMEDI] [int] NOT NULL,
	[INDICACION] [varchar](1) NULL,
	[FECHACONS]  AS (getdate()),
	[NUMEMPLEADO] [int] NOT NULL,
	[TOTALCONS] [decimal](18, 0) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDREC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IDANT]    Script Date: 24/05/2020 12:38:03 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDANT] ON [dbo].[ANTECEDENTES]
(
	[IDANT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [PESO]    Script Date: 24/05/2020 12:38:03 ******/
CREATE NONCLUSTERED INDEX [PESO] ON [dbo].[ANTECEDENTES]
(
	[PESO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [NOMBRE]    Script Date: 24/05/2020 12:38:03 ******/
CREATE NONCLUSTERED INDEX [NOMBRE] ON [dbo].[DOCTORES]
(
	[NOMBRE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NUMEPLEADO]    Script Date: 24/05/2020 12:38:03 ******/
CREATE UNIQUE NONCLUSTERED INDEX [NUMEPLEADO] ON [dbo].[DOCTORES]
(
	[NUMEMPLEADO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDMEDI]    Script Date: 24/05/2020 12:38:03 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDMEDI] ON [dbo].[MEDICAMENTO]
(
	[IDMEDI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [NOMBRE]    Script Date: 24/05/2020 12:38:03 ******/
CREATE NONCLUSTERED INDEX [NOMBRE] ON [dbo].[MEDICAMENTO]
(
	[NOMBRE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDPACI]    Script Date: 24/05/2020 12:38:03 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDPACI] ON [dbo].[PACIENTES]
(
	[IDPACI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [NOMBRE]    Script Date: 24/05/2020 12:38:03 ******/
CREATE NONCLUSTERED INDEX [NOMBRE] ON [dbo].[PACIENTES]
(
	[NOMBRE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDPACI]    Script Date: 24/05/2020 12:38:03 ******/
CREATE NONCLUSTERED INDEX [IDPACI] ON [dbo].[RECETA]
(
	[IDPACI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDREC]    Script Date: 24/05/2020 12:38:03 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDREC] ON [dbo].[RECETA]
(
	[IDREC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [CONSULTORIO] SET  READ_WRITE 
GO
