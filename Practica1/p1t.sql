USE [master]
GO
/****** Object:  Database [CONSULTORIO]    Script Date: 22/05/2020 7:34:41 ******/
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
ALTER DATABASE [CONSULTORIO] SET  READ_WRITE 
GO
