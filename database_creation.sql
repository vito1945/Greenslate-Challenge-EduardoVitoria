USE [master]
GO
/****** Object:  Database [greenslate_challenge]    Script Date: 1/3/2020 8:22:42 PM ******/
CREATE DATABASE [greenslate_challenge]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'greenslate_challenge', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\greenslate_challenge.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'greenslate_challenge_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\greenslate_challenge_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [greenslate_challenge] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [greenslate_challenge].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [greenslate_challenge] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [greenslate_challenge] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [greenslate_challenge] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [greenslate_challenge] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [greenslate_challenge] SET ARITHABORT OFF 
GO
ALTER DATABASE [greenslate_challenge] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [greenslate_challenge] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [greenslate_challenge] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [greenslate_challenge] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [greenslate_challenge] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [greenslate_challenge] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [greenslate_challenge] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [greenslate_challenge] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [greenslate_challenge] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [greenslate_challenge] SET  DISABLE_BROKER 
GO
ALTER DATABASE [greenslate_challenge] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [greenslate_challenge] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [greenslate_challenge] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [greenslate_challenge] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [greenslate_challenge] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [greenslate_challenge] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [greenslate_challenge] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [greenslate_challenge] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [greenslate_challenge] SET  MULTI_USER 
GO
ALTER DATABASE [greenslate_challenge] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [greenslate_challenge] SET DB_CHAINING OFF 
GO
ALTER DATABASE [greenslate_challenge] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [greenslate_challenge] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [greenslate_challenge] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [greenslate_challenge] SET QUERY_STORE = OFF
GO
USE [greenslate_challenge]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 1/3/2020 8:22:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Project]    Script Date: 1/3/2020 8:22:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Project](
	[Id] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[Credits] [int] NOT NULL,
 CONSTRAINT [PK_Project] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 1/3/2020 8:22:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserProject]    Script Date: 1/3/2020 8:22:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserProject](
	[UserId] [int] NOT NULL,
	[ProjectId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[AssignedDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20191229214711_InitialSync', N'3.1.0')
INSERT [dbo].[Project] ([Id], [StartDate], [EndDate], [Credits]) VALUES (1, CAST(N'2020-01-05T00:00:00.000' AS DateTime), CAST(N'2020-09-30T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Project] ([Id], [StartDate], [EndDate], [Credits]) VALUES (2, CAST(N'2020-01-02T00:00:00.000' AS DateTime), CAST(N'2020-02-10T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[Project] ([Id], [StartDate], [EndDate], [Credits]) VALUES (3, CAST(N'2020-01-15T00:00:00.000' AS DateTime), CAST(N'2020-02-20T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Project] ([Id], [StartDate], [EndDate], [Credits]) VALUES (4, CAST(N'2020-01-03T00:00:00.000' AS DateTime), CAST(N'2020-03-10T00:00:00.000' AS DateTime), 6)
INSERT [dbo].[Project] ([Id], [StartDate], [EndDate], [Credits]) VALUES (5, CAST(N'2020-01-01T00:00:00.000' AS DateTime), CAST(N'2020-04-15T00:00:00.000' AS DateTime), 7)
INSERT [dbo].[Project] ([Id], [StartDate], [EndDate], [Credits]) VALUES (6, CAST(N'2020-01-20T00:00:00.000' AS DateTime), CAST(N'2020-02-15T00:00:00.000' AS DateTime), 10)
INSERT [dbo].[Project] ([Id], [StartDate], [EndDate], [Credits]) VALUES (7, CAST(N'2020-08-01T00:00:00.000' AS DateTime), CAST(N'2020-01-16T00:00:00.000' AS DateTime), 20)
INSERT [dbo].[Project] ([Id], [StartDate], [EndDate], [Credits]) VALUES (8, CAST(N'2020-01-01T00:00:00.000' AS DateTime), CAST(N'2020-12-17T00:00:00.000' AS DateTime), 30)
INSERT [dbo].[Project] ([Id], [StartDate], [EndDate], [Credits]) VALUES (9, CAST(N'2020-01-01T00:00:00.000' AS DateTime), CAST(N'2020-01-18T00:00:00.000' AS DateTime), 40)
INSERT [dbo].[Project] ([Id], [StartDate], [EndDate], [Credits]) VALUES (10, CAST(N'2020-01-01T00:00:00.000' AS DateTime), CAST(N'2020-09-19T00:00:00.000' AS DateTime), 50)
INSERT [dbo].[Project] ([Id], [StartDate], [EndDate], [Credits]) VALUES (11, CAST(N'2020-01-01T00:00:00.000' AS DateTime), CAST(N'2020-05-20T00:00:00.000' AS DateTime), 60)
INSERT [dbo].[Project] ([Id], [StartDate], [EndDate], [Credits]) VALUES (12, CAST(N'2020-01-01T00:00:00.000' AS DateTime), CAST(N'2020-06-21T00:00:00.000' AS DateTime), 70)
INSERT [dbo].[Project] ([Id], [StartDate], [EndDate], [Credits]) VALUES (13, CAST(N'2020-02-02T00:00:00.000' AS DateTime), CAST(N'2020-07-22T00:00:00.000' AS DateTime), 80)
INSERT [dbo].[Project] ([Id], [StartDate], [EndDate], [Credits]) VALUES (14, CAST(N'2020-02-01T00:00:00.000' AS DateTime), CAST(N'2020-01-23T00:00:00.000' AS DateTime), 90)
INSERT [dbo].[Project] ([Id], [StartDate], [EndDate], [Credits]) VALUES (15, CAST(N'2020-01-01T00:00:00.000' AS DateTime), CAST(N'2020-01-24T00:00:00.000' AS DateTime), 100)
INSERT [dbo].[User] ([Id], [FirstName], [LastName]) VALUES (1, N'Eduardo', N'Vitoria')
INSERT [dbo].[User] ([Id], [FirstName], [LastName]) VALUES (2, N'Juan', N'Perez')
INSERT [dbo].[User] ([Id], [FirstName], [LastName]) VALUES (3, N'Maria', N'Lopez')
INSERT [dbo].[UserProject] ([UserId], [ProjectId], [IsActive], [AssignedDate]) VALUES (1, 1, 1, CAST(N'2020-01-04T00:00:00.000' AS DateTime))
INSERT [dbo].[UserProject] ([UserId], [ProjectId], [IsActive], [AssignedDate]) VALUES (1, 2, 1, CAST(N'2020-01-06T00:00:00.000' AS DateTime))
INSERT [dbo].[UserProject] ([UserId], [ProjectId], [IsActive], [AssignedDate]) VALUES (1, 3, 0, CAST(N'2020-01-10T00:00:00.000' AS DateTime))
INSERT [dbo].[UserProject] ([UserId], [ProjectId], [IsActive], [AssignedDate]) VALUES (1, 4, 1, CAST(N'2020-01-08T00:00:00.000' AS DateTime))
INSERT [dbo].[UserProject] ([UserId], [ProjectId], [IsActive], [AssignedDate]) VALUES (1, 5, 1, CAST(N'2020-01-15T00:00:00.000' AS DateTime))
INSERT [dbo].[UserProject] ([UserId], [ProjectId], [IsActive], [AssignedDate]) VALUES (2, 6, 0, CAST(N'2020-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[UserProject] ([UserId], [ProjectId], [IsActive], [AssignedDate]) VALUES (2, 7, 1, CAST(N'2020-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[UserProject] ([UserId], [ProjectId], [IsActive], [AssignedDate]) VALUES (2, 8, 0, CAST(N'2020-08-05T00:00:00.000' AS DateTime))
INSERT [dbo].[UserProject] ([UserId], [ProjectId], [IsActive], [AssignedDate]) VALUES (2, 9, 1, CAST(N'2020-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[UserProject] ([UserId], [ProjectId], [IsActive], [AssignedDate]) VALUES (2, 10, 1, CAST(N'2020-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[UserProject] ([UserId], [ProjectId], [IsActive], [AssignedDate]) VALUES (3, 11, 0, CAST(N'2020-03-20T00:00:00.000' AS DateTime))
INSERT [dbo].[UserProject] ([UserId], [ProjectId], [IsActive], [AssignedDate]) VALUES (3, 12, 0, CAST(N'2020-02-15T00:00:00.000' AS DateTime))
INSERT [dbo].[UserProject] ([UserId], [ProjectId], [IsActive], [AssignedDate]) VALUES (3, 13, 0, CAST(N'2020-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[UserProject] ([UserId], [ProjectId], [IsActive], [AssignedDate]) VALUES (3, 14, 0, CAST(N'2020-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[UserProject] ([UserId], [ProjectId], [IsActive], [AssignedDate]) VALUES (3, 15, 0, CAST(N'2020-01-01T00:00:00.000' AS DateTime))
ALTER TABLE [dbo].[UserProject]  WITH CHECK ADD  CONSTRAINT [FK_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Project] ([Id])
GO
ALTER TABLE [dbo].[UserProject] CHECK CONSTRAINT [FK_Project]
GO
ALTER TABLE [dbo].[UserProject]  WITH CHECK ADD  CONSTRAINT [FK_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[UserProject] CHECK CONSTRAINT [FK_User]
GO
USE [master]
GO
ALTER DATABASE [greenslate_challenge] SET  READ_WRITE 
GO
