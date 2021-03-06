/****** Object:  Database [Pokedex]    Script Date: 2017-12-19 21:18:51 ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'Pokedex')
BEGIN
CREATE DATABASE [Pokedex]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'D71Pokedex', FILENAME = N'D:\GIT\TP2D71\TP2D71\App_Data\Pokedex.mdf' , SIZE = 3712KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'D71Pokedex_log', FILENAME = N'D:\GIT\TP2D71\TP2D71\App_Data\Pokedex_log.ldf' , SIZE = 504KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
END
GO
ALTER DATABASE [Pokedex] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Pokedex].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Pokedex] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Pokedex] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Pokedex] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Pokedex] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Pokedex] SET ARITHABORT OFF 
GO
ALTER DATABASE [Pokedex] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Pokedex] SET AUTO_SHRINK ON 
GO
ALTER DATABASE [Pokedex] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Pokedex] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Pokedex] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Pokedex] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Pokedex] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Pokedex] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Pokedex] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Pokedex] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Pokedex] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Pokedex] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Pokedex] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Pokedex] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Pokedex] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Pokedex] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Pokedex] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Pokedex] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Pokedex] SET  MULTI_USER 
GO
ALTER DATABASE [Pokedex] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Pokedex] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Pokedex] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Pokedex] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Pokedex] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Pokedex] SET QUERY_STORE = OFF
GO
USE [Pokedex]
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
/****** Object:  Table [Favorites]    Script Date: 2017-12-19 21:18:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Favorites]') AND type in (N'U'))
BEGIN
CREATE TABLE [Favorites](
	[FKPokemonID] [int] NOT NULL,
	[FKUtilisateurID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[FKPokemonID] ASC,
	[FKUtilisateurID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [Habitat]    Script Date: 2017-12-19 21:18:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Habitat]') AND type in (N'U'))
BEGIN
CREATE TABLE [Habitat](
	[HabitatID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_Habitat_Name_Unique] PRIMARY KEY CLUSTERED 
(
	[HabitatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [Pokemon]    Script Date: 2017-12-19 21:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Pokemon]') AND type in (N'U'))
BEGIN
CREATE TABLE [Pokemon](
	[PokemonID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](15) NOT NULL,
	[HP] [tinyint] NOT NULL,
	[Attack] [tinyint] NOT NULL,
	[Defense] [tinyint] NOT NULL,
	[SpecialAttack] [tinyint] NOT NULL,
	[SpecialDefense] [tinyint] NOT NULL,
	[Speed] [tinyint] NOT NULL,
	[Height] [decimal](5, 2) NOT NULL,
	[Weight] [decimal](5, 2) NOT NULL,
	[Color] [int] NOT NULL,
	[FKPoketypeID01] [int] NOT NULL,
	[FKPoketypeID02] [int] NULL,
	[FKHabitatID] [int] NOT NULL,
	[FKSpeciesID] [int] NOT NULL,
	[EvolvesInto] [int] NULL,
 CONSTRAINT [PK_Pokemon] PRIMARY KEY CLUSTERED 
(
	[PokemonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [PokeType]    Script Date: 2017-12-19 21:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[PokeType]') AND type in (N'U'))
BEGIN
CREATE TABLE [PokeType](
	[PoketypeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_PokeType] PRIMARY KEY CLUSTERED 
(
	[PoketypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [Species]    Script Date: 2017-12-19 21:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Species]') AND type in (N'U'))
BEGIN
CREATE TABLE [Species](
	[SpeciesID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_Species] PRIMARY KEY CLUSTERED 
(
	[SpeciesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [Utilisateur]    Script Date: 2017-12-19 21:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Utilisateur]') AND type in (N'U'))
BEGIN
CREATE TABLE [Utilisateur](
	[UtilisateurID] [int] IDENTITY(1,1) NOT NULL,
	[NomUtilisateur] [nvarchar](12) NOT NULL,
	[HashMotDePasse] [nvarchar](200) NOT NULL,
	[Courriel] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UtilisateurID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [Habitat] ON 

INSERT [Habitat] ([HabitatID], [Name]) VALUES (2, N'Cave')
INSERT [Habitat] ([HabitatID], [Name]) VALUES (3, N'Forest')
INSERT [Habitat] ([HabitatID], [Name]) VALUES (4, N'Grassland')
INSERT [Habitat] ([HabitatID], [Name]) VALUES (5, N'Mountain')
INSERT [Habitat] ([HabitatID], [Name]) VALUES (7, N'Rough terrain')
INSERT [Habitat] ([HabitatID], [Name]) VALUES (8, N'Sea')
INSERT [Habitat] ([HabitatID], [Name]) VALUES (9, N'Urban')
INSERT [Habitat] ([HabitatID], [Name]) VALUES (10, N'Water''s edge')
SET IDENTITY_INSERT [Habitat] OFF
SET IDENTITY_INSERT [Pokemon] ON 

INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (1, N'Bulbasaur3', 44, 49, 49, 65, 65, 45, CAST(1.00 AS Decimal(5, 2)), CAST(2.00 AS Decimal(5, 2)), 32768, 7, NULL, 4, 207, 2)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (2, N'Ivysaur', 60, 62, 63, 80, 80, 60, CAST(1.00 AS Decimal(5, 2)), CAST(13.00 AS Decimal(5, 2)), 32768, 8, 12, 4, 207, 3)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (3, N'Venusaur', 80, 82, 83, 100, 100, 80, CAST(2.00 AS Decimal(5, 2)), CAST(100.00 AS Decimal(5, 2)), 32768, 8, 12, 4, 207, NULL)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (4, N'Charmander', 39, 52, 43, 60, 50, 65, CAST(0.60 AS Decimal(5, 2)), CAST(8.50 AS Decimal(5, 2)), 16711680, 6, NULL, 5, 135, 5)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (5, N'Charmeleon', 58, 64, 58, 80, 65, 80, CAST(1.10 AS Decimal(5, 2)), CAST(19.00 AS Decimal(5, 2)), 16711680, 6, NULL, 5, 83, 6)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (6, N'Charizard', 78, 84, 78, 109, 85, 100, CAST(1.70 AS Decimal(5, 2)), CAST(90.50 AS Decimal(5, 2)), 16711680, 6, 19, 5, 83, NULL)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (7, N'Squirtle', 44, 48, 65, 50, 64, 43, CAST(0.50 AS Decimal(5, 2)), CAST(9.00 AS Decimal(5, 2)), 255, 16, NULL, 10, 241, 8)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (8, N'Wartortle', 59, 63, 80, 65, 80, 58, CAST(1.00 AS Decimal(5, 2)), CAST(22.50 AS Decimal(5, 2)), 255, 16, NULL, 10, 248, 9)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (9, N'Blastoise', 79, 83, 100, 85, 105, 78, CAST(1.60 AS Decimal(5, 2)), CAST(85.50 AS Decimal(5, 2)), 255, 16, NULL, 10, 211, NULL)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (10, N'Caterpie', 45, 30, 35, 20, 20, 45, CAST(0.30 AS Decimal(5, 2)), CAST(2.90 AS Decimal(5, 2)), 32768, 1, NULL, 3, 269, 11)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (11, N'Metapod', 50, 20, 55, 25, 25, 30, CAST(0.70 AS Decimal(5, 2)), CAST(9.90 AS Decimal(5, 2)), 32768, 1, NULL, 3, 46, 12)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (12, N'Butterfree', 60, 45, 50, 80, 80, 70, CAST(1.10 AS Decimal(5, 2)), CAST(32.00 AS Decimal(5, 2)), 16119285, 1, 19, 3, 33, NULL)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (13, N'Weedle', 40, 35, 30, 20, 20, 50, CAST(0.30 AS Decimal(5, 2)), CAST(3.20 AS Decimal(5, 2)), 13468991, 1, 12, 3, 98, 14)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (14, N'Kakuna', 45, 25, 50, 25, 25, 35, CAST(0.60 AS Decimal(5, 2)), CAST(10.00 AS Decimal(5, 2)), 16776960, 1, 12, 3, 46, 15)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (15, N'Beedrill', 65, 80, 40, 45, 80, 75, CAST(1.00 AS Decimal(5, 2)), CAST(29.50 AS Decimal(5, 2)), 16776960, 1, 12, 3, 173, NULL)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (16, N'Pidgey', 40, 45, 40, 35, 35, 56, CAST(0.30 AS Decimal(5, 2)), CAST(1.80 AS Decimal(5, 2)), 13468991, 11, 19, 3, 239, 17)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (17, N'Pidgeotto', 63, 60, 55, 50, 50, 71, CAST(1.10 AS Decimal(5, 2)), CAST(30.00 AS Decimal(5, 2)), 13468991, 11, 19, 3, 24, 18)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (18, N'Pidgeot', 83, 80, 75, 70, 70, 91, CAST(1.50 AS Decimal(5, 2)), CAST(39.50 AS Decimal(5, 2)), 13468991, 11, 19, 3, 24, NULL)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (19, N'Rattata', 30, 56, 35, 25, 35, 72, CAST(0.30 AS Decimal(5, 2)), CAST(3.50 AS Decimal(5, 2)), 8388736, 11, NULL, 4, 155, 20)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (20, N'Raticate', 55, 81, 60, 50, 70, 97, CAST(0.70 AS Decimal(5, 2)), CAST(18.50 AS Decimal(5, 2)), 13468991, 11, NULL, 4, 155, NULL)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (21, N'Spearow', 40, 60, 30, 31, 31, 70, CAST(0.30 AS Decimal(5, 2)), CAST(2.00 AS Decimal(5, 2)), 13468991, 11, 19, 7, 239, 22)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (22, N'Fearow', 65, 90, 65, 61, 61, 100, CAST(1.20 AS Decimal(5, 2)), CAST(38.00 AS Decimal(5, 2)), 13468991, 11, 19, 7, 19, NULL)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (23, N'Ekans', 35, 60, 44, 40, 54, 55, CAST(2.00 AS Decimal(5, 2)), CAST(6.90 AS Decimal(5, 2)), 8388736, 12, NULL, 4, 217, 24)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (24, N'Arbok', 60, 85, 69, 65, 79, 80, CAST(3.50 AS Decimal(5, 2)), CAST(65.00 AS Decimal(5, 2)), 8388736, 12, NULL, 4, 44, NULL)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (25, N'Pikachu', 35, 55, 30, 50, 40, 90, CAST(0.40 AS Decimal(5, 2)), CAST(6.00 AS Decimal(5, 2)), 16776960, 4, NULL, 3, 155, 26)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (26, N'Raichu', 60, 90, 55, 90, 80, 100, CAST(0.80 AS Decimal(5, 2)), CAST(30.00 AS Decimal(5, 2)), 16776960, 4, NULL, 3, 155, NULL)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (27, N'Sandshrew', 50, 75, 85, 20, 30, 40, CAST(0.60 AS Decimal(5, 2)), CAST(12.00 AS Decimal(5, 2)), 16776960, 9, NULL, 7, 155, 28)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (28, N'Sandslash', 75, 100, 110, 45, 55, 65, CAST(1.00 AS Decimal(5, 2)), CAST(29.50 AS Decimal(5, 2)), 16776960, 9, NULL, 7, 155, NULL)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (29, N'Nidoran F', 55, 47, 52, 40, 40, 41, CAST(0.40 AS Decimal(5, 2)), CAST(7.00 AS Decimal(5, 2)), 255, 12, NULL, 4, 176, 30)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (30, N'Nidorina', 70, 62, 67, 55, 55, 56, CAST(0.80 AS Decimal(5, 2)), CAST(20.00 AS Decimal(5, 2)), 255, 12, NULL, 4, 176, 31)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (31, N'Nidoqueen', 90, 82, 87, 75, 85, 76, CAST(1.30 AS Decimal(5, 2)), CAST(60.00 AS Decimal(5, 2)), 255, 12, 9, 4, 63, NULL)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (32, N'Nidoran M', 46, 57, 40, 40, 40, 50, CAST(0.50 AS Decimal(5, 2)), CAST(9.00 AS Decimal(5, 2)), 8388736, 12, NULL, 4, 176, 33)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (33, N'Nidorino', 61, 72, 57, 55, 55, 65, CAST(0.90 AS Decimal(5, 2)), CAST(19.50 AS Decimal(5, 2)), 8388736, 12, NULL, 4, 176, 34)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (34, N'Nidoking', 81, 92, 77, 85, 75, 85, CAST(1.40 AS Decimal(5, 2)), CAST(62.00 AS Decimal(5, 2)), 8388736, 12, 9, 4, 63, NULL)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (35, N'Clefairy', 70, 45, 48, 60, 65, 35, CAST(0.60 AS Decimal(5, 2)), CAST(7.50 AS Decimal(5, 2)), 16761035, 11, NULL, 5, 75, 36)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (36, N'Clefable', 95, 70, 73, 85, 90, 60, CAST(1.30 AS Decimal(5, 2)), CAST(40.00 AS Decimal(5, 2)), 16761035, 11, NULL, 5, 75, NULL)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (37, N'Vulpix', 38, 41, 40, 50, 65, 65, CAST(0.60 AS Decimal(5, 2)), CAST(9.90 AS Decimal(5, 2)), 13468991, 6, NULL, 4, 90, 38)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (38, N'Ninetales', 73, 76, 75, 81, 100, 100, CAST(1.10 AS Decimal(5, 2)), CAST(19.90 AS Decimal(5, 2)), 16776960, 6, NULL, 4, 90, NULL)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (39, N'Jigglypuff', 115, 45, 20, 45, 25, 20, CAST(0.50 AS Decimal(5, 2)), CAST(5.50 AS Decimal(5, 2)), 16761035, 11, NULL, 4, 15, 40)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (40, N'Wigglytuff', 140, 70, 45, 75, 50, 45, CAST(1.00 AS Decimal(5, 2)), CAST(12.00 AS Decimal(5, 2)), 16761035, 11, NULL, 4, 15, NULL)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (41, N'Zubat', 40, 45, 35, 30, 40, 55, CAST(0.80 AS Decimal(5, 2)), CAST(7.50 AS Decimal(5, 2)), 8388736, 12, 19, 2, 18, 42)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (42, N'Golbat', 75, 80, 70, 65, 75, 90, CAST(1.60 AS Decimal(5, 2)), CAST(55.00 AS Decimal(5, 2)), 8388736, 12, 19, 2, 18, NULL)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (43, N'Oddish', 45, 50, 55, 75, 65, 30, CAST(0.50 AS Decimal(5, 2)), CAST(5.40 AS Decimal(5, 2)), 255, 8, 12, 4, 258, 44)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (44, N'Gloom', 60, 65, 70, 85, 75, 40, CAST(0.80 AS Decimal(5, 2)), CAST(8.60 AS Decimal(5, 2)), 255, 8, 12, 4, 258, 45)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (45, N'Vileplume', 75, 80, 85, 100, 90, 50, CAST(1.20 AS Decimal(5, 2)), CAST(18.60 AS Decimal(5, 2)), 16711680, 8, 12, 4, 85, NULL)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (46, N'Paras', 35, 70, 55, 45, 55, 25, CAST(0.30 AS Decimal(5, 2)), CAST(5.40 AS Decimal(5, 2)), 16711680, 1, 8, 3, 157, 47)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (47, N'Parasect', 60, 95, 80, 60, 80, 30, CAST(1.00 AS Decimal(5, 2)), CAST(29.50 AS Decimal(5, 2)), 16711680, 1, 8, 3, 157, NULL)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (48, N'Venonat', 60, 55, 50, 40, 55, 45, CAST(1.00 AS Decimal(5, 2)), CAST(30.00 AS Decimal(5, 2)), 8388736, 1, 12, 3, 111, 49)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (49, N'Venomoth', 70, 65, 60, 90, 75, 90, CAST(1.50 AS Decimal(5, 2)), CAST(12.50 AS Decimal(5, 2)), 8388736, 1, 12, 3, 175, NULL)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (50, N'Diglett', 10, 55, 25, 35, 45, 95, CAST(0.20 AS Decimal(5, 2)), CAST(0.80 AS Decimal(5, 2)), 13468991, 9, NULL, 2, 153, 51)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (51, N'Dugtrio', 35, 80, 50, 50, 70, 120, CAST(0.70 AS Decimal(5, 2)), CAST(33.30 AS Decimal(5, 2)), 13468991, 9, NULL, 2, 153, NULL)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (52, N'Meowth', 40, 45, 35, 40, 40, 90, CAST(0.40 AS Decimal(5, 2)), CAST(4.20 AS Decimal(5, 2)), 16776960, 11, NULL, 9, 200, 53)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (53, N'Persian', 65, 70, 60, 65, 65, 115, CAST(1.00 AS Decimal(5, 2)), CAST(32.00 AS Decimal(5, 2)), 16776960, 11, NULL, 9, 40, NULL)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (54, N'Psyduck', 50, 52, 48, 65, 50, 55, CAST(0.80 AS Decimal(5, 2)), CAST(19.60 AS Decimal(5, 2)), 16776960, 16, NULL, 10, 64, 55)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (55, N'Golduck', 80, 82, 78, 95, 80, 85, CAST(1.70 AS Decimal(5, 2)), CAST(76.60 AS Decimal(5, 2)), 255, 16, NULL, 10, 64, NULL)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (56, N'Mankey', 40, 80, 35, 35, 45, 70, CAST(0.50 AS Decimal(5, 2)), CAST(28.00 AS Decimal(5, 2)), 13468991, 5, NULL, 5, 169, 57)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (57, N'Primeape', 65, 105, 60, 60, 70, 95, CAST(1.00 AS Decimal(5, 2)), CAST(32.00 AS Decimal(5, 2)), 13468991, 5, NULL, 5, 169, NULL)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (58, N'Growlithe', 55, 70, 45, 70, 50, 60, CAST(0.70 AS Decimal(5, 2)), CAST(19.00 AS Decimal(5, 2)), 13468991, 6, NULL, 4, 183, 59)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (59, N'Arcanine', 90, 110, 80, 100, 80, 95, CAST(1.90 AS Decimal(5, 2)), CAST(155.00 AS Decimal(5, 2)), 13468991, 6, NULL, 4, 129, NULL)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (60, N'Poliwag', 40, 50, 40, 40, 40, 90, CAST(0.60 AS Decimal(5, 2)), CAST(12.40 AS Decimal(5, 2)), 255, 16, NULL, 10, 234, 61)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (61, N'Poliwhirl', 65, 65, 65, 50, 50, 90, CAST(1.00 AS Decimal(5, 2)), CAST(20.00 AS Decimal(5, 2)), 255, 16, NULL, 10, 234, 62)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (62, N'Poliwrath', 90, 85, 95, 70, 90, 70, CAST(1.30 AS Decimal(5, 2)), CAST(54.00 AS Decimal(5, 2)), 255, 16, 5, 10, 234, NULL)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (63, N'Abra', 25, 20, 15, 105, 55, 90, CAST(0.90 AS Decimal(5, 2)), CAST(19.50 AS Decimal(5, 2)), 13468991, 13, NULL, 9, 180, 64)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (64, N'Kadabra', 40, 35, 30, 120, 70, 105, CAST(1.30 AS Decimal(5, 2)), CAST(56.50 AS Decimal(5, 2)), 13468991, 13, NULL, 9, 180, 65)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (65, N'Alakazam', 55, 50, 45, 135, 85, 120, CAST(1.50 AS Decimal(5, 2)), CAST(48.00 AS Decimal(5, 2)), 13468991, 13, NULL, 9, 180, NULL)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (66, N'Machop', 70, 80, 50, 35, 35, 35, CAST(0.80 AS Decimal(5, 2)), CAST(19.50 AS Decimal(5, 2)), 8421504, 5, NULL, 5, 230, 67)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (67, N'Machoke', 80, 100, 70, 50, 60, 45, CAST(1.50 AS Decimal(5, 2)), CAST(70.50 AS Decimal(5, 2)), 8421504, 5, NULL, 5, 230, 68)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (68, N'Machamp', 90, 130, 80, 65, 85, 55, CAST(1.60 AS Decimal(5, 2)), CAST(130.00 AS Decimal(5, 2)), 8421504, 5, NULL, 5, 230, NULL)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (69, N'Bellsprout', 50, 75, 35, 70, 30, 40, CAST(0.70 AS Decimal(5, 2)), CAST(4.00 AS Decimal(5, 2)), 32768, 8, 12, 3, 85, 70)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (70, N'Weepinbell', 65, 90, 50, 85, 45, 55, CAST(1.00 AS Decimal(5, 2)), CAST(6.40 AS Decimal(5, 2)), 32768, 8, 12, 3, 86, 71)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (71, N'Victreebel', 80, 105, 65, 100, 60, 70, CAST(1.70 AS Decimal(5, 2)), CAST(15.50 AS Decimal(5, 2)), 32768, 8, 12, 3, 86, NULL)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (72, N'Tentacool', 40, 40, 35, 50, 100, 70, CAST(0.90 AS Decimal(5, 2)), CAST(45.50 AS Decimal(5, 2)), 255, 16, 12, 8, 118, 73)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (73, N'Tentacruel', 80, 70, 65, 80, 120, 100, CAST(1.60 AS Decimal(5, 2)), CAST(55.00 AS Decimal(5, 2)), 255, 16, 12, 8, 118, NULL)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (74, N'Geodude', 40, 80, 100, 30, 30, 20, CAST(0.40 AS Decimal(5, 2)), CAST(20.00 AS Decimal(5, 2)), 13468991, 14, 9, 5, 188, 75)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (75, N'Graveler', 55, 95, 115, 45, 45, 35, CAST(1.00 AS Decimal(5, 2)), CAST(105.00 AS Decimal(5, 2)), 13468991, 14, 9, 5, 188, 76)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (76, N'Golem', 80, 110, 130, 55, 65, 45, CAST(1.40 AS Decimal(5, 2)), CAST(300.00 AS Decimal(5, 2)), 13468991, 14, 9, 5, 149, NULL)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (77, N'Ponyta', 50, 85, 55, 65, 65, 90, CAST(1.00 AS Decimal(5, 2)), CAST(30.00 AS Decimal(5, 2)), 16776960, 6, NULL, 4, 78, 78)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (78, N'Rapidash', 65, 100, 70, 80, 80, 105, CAST(1.70 AS Decimal(5, 2)), CAST(95.00 AS Decimal(5, 2)), 16776960, 6, NULL, 4, 78, NULL)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (79, N'Slowpoke', 90, 65, 65, 40, 40, 15, CAST(1.20 AS Decimal(5, 2)), CAST(36.00 AS Decimal(5, 2)), 16761035, 16, 13, 10, 61, 80)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (80, N'Slowbro', 95, 75, 110, 100, 80, 30, CAST(1.60 AS Decimal(5, 2)), CAST(78.50 AS Decimal(5, 2)), 16761035, 16, 13, 10, 103, NULL)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (81, N'Magnemite', 25, 35, 70, 95, 55, 45, CAST(0.30 AS Decimal(5, 2)), CAST(6.00 AS Decimal(5, 2)), 8421504, 4, 15, 7, 144, 82)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (82, N'Magneton', 50, 60, 95, 120, 70, 70, CAST(1.00 AS Decimal(5, 2)), CAST(60.00 AS Decimal(5, 2)), 8421504, 4, 15, 7, 144, NULL)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (83, N'Farfetch''d', 52, 65, 55, 58, 62, 60, CAST(0.80 AS Decimal(5, 2)), CAST(15.00 AS Decimal(5, 2)), 13468991, 11, 19, 4, 263, NULL)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (84, N'Doduo', 35, 85, 45, 35, 35, 75, CAST(1.40 AS Decimal(5, 2)), CAST(39.20 AS Decimal(5, 2)), 13468991, 11, 19, 4, 249, 85)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (85, N'Dodrio', 60, 110, 70, 60, 60, 100, CAST(1.80 AS Decimal(5, 2)), CAST(85.20 AS Decimal(5, 2)), 13468991, 11, 19, 4, 247, NULL)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (86, N'Seel', 65, 45, 55, 45, 70, 45, CAST(1.10 AS Decimal(5, 2)), CAST(90.00 AS Decimal(5, 2)), 16119285, 16, NULL, 8, 205, 87)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (87, N'Dewgong', 90, 70, 80, 70, 95, 70, CAST(1.70 AS Decimal(5, 2)), CAST(120.00 AS Decimal(5, 2)), 16119285, 16, 10, 8, 205, NULL)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (88, N'Grimer', 80, 80, 50, 40, 50, 25, CAST(0.90 AS Decimal(5, 2)), CAST(30.00 AS Decimal(5, 2)), 8388736, 12, NULL, 9, 216, 89)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (89, N'Muk', 105, 105, 75, 65, 100, 50, CAST(1.20 AS Decimal(5, 2)), CAST(30.00 AS Decimal(5, 2)), 8388736, 12, NULL, 9, 216, NULL)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (90, N'Shellder', 30, 65, 100, 45, 25, 40, CAST(0.30 AS Decimal(5, 2)), CAST(4.00 AS Decimal(5, 2)), 8388736, 16, NULL, 8, 26, 91)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (91, N'Cloyster', 50, 95, 180, 85, 45, 70, CAST(1.50 AS Decimal(5, 2)), CAST(132.50 AS Decimal(5, 2)), 8388736, 16, 10, 8, 26, NULL)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (92, N'Gastly', 30, 35, 30, 100, 35, 80, CAST(1.30 AS Decimal(5, 2)), CAST(0.10 AS Decimal(5, 2)), 8388736, 7, 12, 2, 94, 93)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (93, N'Haunter', 45, 50, 45, 115, 55, 95, CAST(1.60 AS Decimal(5, 2)), CAST(0.10 AS Decimal(5, 2)), 8388736, 7, 12, 2, 94, 94)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (94, N'Gengar', 60, 65, 60, 130, 75, 110, CAST(1.50 AS Decimal(5, 2)), CAST(40.50 AS Decimal(5, 2)), 8388736, 7, 12, 2, 208, NULL)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (95, N'Onix', 35, 45, 160, 30, 45, 70, CAST(8.80 AS Decimal(5, 2)), CAST(210.00 AS Decimal(5, 2)), 8421504, 14, 9, 2, 192, NULL)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (96, N'Drowzee', 60, 48, 45, 43, 90, 42, CAST(1.00 AS Decimal(5, 2)), CAST(32.40 AS Decimal(5, 2)), 16776960, 13, NULL, 4, 107, 97)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (97, N'Hypno', 85, 73, 70, 73, 115, 67, CAST(1.60 AS Decimal(5, 2)), CAST(75.60 AS Decimal(5, 2)), 16776960, 13, NULL, 4, 107, NULL)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (98, N'Krabby', 30, 105, 90, 25, 25, 50, CAST(0.40 AS Decimal(5, 2)), CAST(6.50 AS Decimal(5, 2)), 16711680, 16, NULL, 10, 187, 99)
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (99, N'Kingler', 55, 130, 115, 50, 50, 75, CAST(1.30 AS Decimal(5, 2)), CAST(60.00 AS Decimal(5, 2)), 16711680, 16, NULL, 10, 170, NULL)
GO
INSERT [Pokemon] ([PokemonID], [Name], [HP], [Attack], [Defense], [SpecialAttack], [SpecialDefense], [Speed], [Height], [Weight], [Color], [FKPoketypeID01], [FKPoketypeID02], [FKHabitatID], [FKSpeciesID], [EvolvesInto]) VALUES (100, N'Voltorb', 40, 30, 50, 55, 55, 100, CAST(0.50 AS Decimal(5, 2)), CAST(10.40 AS Decimal(5, 2)), 16711680, 4, NULL, 9, 12, NULL)
SET IDENTITY_INSERT [Pokemon] OFF
SET IDENTITY_INSERT [PokeType] ON 

INSERT [PokeType] ([PoketypeID], [Name]) VALUES (1, N'Bug')
INSERT [PokeType] ([PoketypeID], [Name]) VALUES (2, N'Dark')
INSERT [PokeType] ([PoketypeID], [Name]) VALUES (3, N'Dragon')
INSERT [PokeType] ([PoketypeID], [Name]) VALUES (4, N'Electric')
INSERT [PokeType] ([PoketypeID], [Name]) VALUES (5, N'Fighting')
INSERT [PokeType] ([PoketypeID], [Name]) VALUES (6, N'Fire')
INSERT [PokeType] ([PoketypeID], [Name]) VALUES (19, N'Flying')
INSERT [PokeType] ([PoketypeID], [Name]) VALUES (7, N'Ghost')
INSERT [PokeType] ([PoketypeID], [Name]) VALUES (8, N'Grass')
INSERT [PokeType] ([PoketypeID], [Name]) VALUES (9, N'Ground')
INSERT [PokeType] ([PoketypeID], [Name]) VALUES (10, N'Ice')
INSERT [PokeType] ([PoketypeID], [Name]) VALUES (11, N'Normal')
INSERT [PokeType] ([PoketypeID], [Name]) VALUES (12, N'Poison')
INSERT [PokeType] ([PoketypeID], [Name]) VALUES (13, N'Psychic')
INSERT [PokeType] ([PoketypeID], [Name]) VALUES (14, N'Rock')
INSERT [PokeType] ([PoketypeID], [Name]) VALUES (15, N'Steel')
INSERT [PokeType] ([PoketypeID], [Name]) VALUES (16, N'Water')
SET IDENTITY_INSERT [PokeType] OFF
SET IDENTITY_INSERT [Species] ON 

INSERT [Species] ([SpeciesID], [Name]) VALUES (12, N'Ball')
INSERT [Species] ([SpeciesID], [Name]) VALUES (15, N'Balloon')
INSERT [Species] ([SpeciesID], [Name]) VALUES (18, N'Bat')
INSERT [Species] ([SpeciesID], [Name]) VALUES (19, N'Beak')
INSERT [Species] ([SpeciesID], [Name]) VALUES (24, N'Bird')
INSERT [Species] ([SpeciesID], [Name]) VALUES (26, N'Bivalve')
INSERT [Species] ([SpeciesID], [Name]) VALUES (33, N'Butterfly')
INSERT [Species] ([SpeciesID], [Name]) VALUES (40, N'Classy Cat')
INSERT [Species] ([SpeciesID], [Name]) VALUES (44, N'Cobra')
INSERT [Species] ([SpeciesID], [Name]) VALUES (46, N'Cocoon')
INSERT [Species] ([SpeciesID], [Name]) VALUES (61, N'Dopey')
INSERT [Species] ([SpeciesID], [Name]) VALUES (63, N'Drill')
INSERT [Species] ([SpeciesID], [Name]) VALUES (64, N'Duck')
INSERT [Species] ([SpeciesID], [Name]) VALUES (75, N'Fairy')
INSERT [Species] ([SpeciesID], [Name]) VALUES (78, N'Fire Horse')
INSERT [Species] ([SpeciesID], [Name]) VALUES (83, N'Flame')
INSERT [Species] ([SpeciesID], [Name]) VALUES (85, N'Flower')
INSERT [Species] ([SpeciesID], [Name]) VALUES (86, N'Flycatcher')
INSERT [Species] ([SpeciesID], [Name]) VALUES (90, N'Fox')
INSERT [Species] ([SpeciesID], [Name]) VALUES (94, N'Gas')
INSERT [Species] ([SpeciesID], [Name]) VALUES (98, N'Hairy Bug')
INSERT [Species] ([SpeciesID], [Name]) VALUES (103, N'Hermit Crab')
INSERT [Species] ([SpeciesID], [Name]) VALUES (107, N'Hypnosis')
INSERT [Species] ([SpeciesID], [Name]) VALUES (111, N'Insect')
INSERT [Species] ([SpeciesID], [Name]) VALUES (118, N'Jellyfish')
INSERT [Species] ([SpeciesID], [Name]) VALUES (129, N'Legendary')
INSERT [Species] ([SpeciesID], [Name]) VALUES (135, N'Lizard')
INSERT [Species] ([SpeciesID], [Name]) VALUES (144, N'Magnet')
INSERT [Species] ([SpeciesID], [Name]) VALUES (149, N'Megaton')
INSERT [Species] ([SpeciesID], [Name]) VALUES (153, N'Mole')
INSERT [Species] ([SpeciesID], [Name]) VALUES (155, N'Mouse')
INSERT [Species] ([SpeciesID], [Name]) VALUES (157, N'Mushroom')
INSERT [Species] ([SpeciesID], [Name]) VALUES (169, N'Pig Monkey')
INSERT [Species] ([SpeciesID], [Name]) VALUES (170, N'Pincer')
INSERT [Species] ([SpeciesID], [Name]) VALUES (173, N'Poison Bee')
INSERT [Species] ([SpeciesID], [Name]) VALUES (175, N'Poison Moth')
INSERT [Species] ([SpeciesID], [Name]) VALUES (176, N'Poison Pin')
INSERT [Species] ([SpeciesID], [Name]) VALUES (180, N'Psi')
INSERT [Species] ([SpeciesID], [Name]) VALUES (183, N'Puppy')
INSERT [Species] ([SpeciesID], [Name]) VALUES (187, N'River Crab')
INSERT [Species] ([SpeciesID], [Name]) VALUES (188, N'Rock')
INSERT [Species] ([SpeciesID], [Name]) VALUES (192, N'Rock Snake')
INSERT [Species] ([SpeciesID], [Name]) VALUES (200, N'Scratch Cat')
INSERT [Species] ([SpeciesID], [Name]) VALUES (205, N'Sea Lion')
INSERT [Species] ([SpeciesID], [Name]) VALUES (207, N'Seed')
INSERT [Species] ([SpeciesID], [Name]) VALUES (208, N'Shadow')
INSERT [Species] ([SpeciesID], [Name]) VALUES (211, N'Shellfish')
INSERT [Species] ([SpeciesID], [Name]) VALUES (216, N'Sludge')
INSERT [Species] ([SpeciesID], [Name]) VALUES (217, N'Snake')
INSERT [Species] ([SpeciesID], [Name]) VALUES (230, N'Superpower')
INSERT [Species] ([SpeciesID], [Name]) VALUES (234, N'Tadpole')
INSERT [Species] ([SpeciesID], [Name]) VALUES (239, N'Tiny Bird')
INSERT [Species] ([SpeciesID], [Name]) VALUES (241, N'Tiny Turtle')
INSERT [Species] ([SpeciesID], [Name]) VALUES (247, N'Triple Bird')
INSERT [Species] ([SpeciesID], [Name]) VALUES (248, N'Turtle')
INSERT [Species] ([SpeciesID], [Name]) VALUES (249, N'Twin Bird')
INSERT [Species] ([SpeciesID], [Name]) VALUES (258, N'Weed')
INSERT [Species] ([SpeciesID], [Name]) VALUES (263, N'Wild Duck')
INSERT [Species] ([SpeciesID], [Name]) VALUES (269, N'Worm')
SET IDENTITY_INSERT [Species] OFF
SET IDENTITY_INSERT [Utilisateur] ON 

INSERT [Utilisateur] ([UtilisateurID], [NomUtilisateur], [HashMotDePasse], [Courriel]) VALUES (42, N'11', N'1', N'1')
SET IDENTITY_INSERT [Utilisateur] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Habitat_Name_Unique]    Script Date: 2017-12-19 21:18:53 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[Habitat]') AND name = N'IX_Habitat_Name_Unique')
CREATE UNIQUE NONCLUSTERED INDEX [IX_Habitat_Name_Unique] ON [Habitat]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_uneseuleevolution]    Script Date: 2017-12-19 21:18:53 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[Pokemon]') AND name = N'idx_uneseuleevolution')
CREATE UNIQUE NONCLUSTERED INDEX [idx_uneseuleevolution] ON [Pokemon]
(
	[EvolvesInto] ASC
)
WHERE ([EvolvesInto] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Pokemon_Name_Unique]    Script Date: 2017-12-19 21:18:53 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[Pokemon]') AND name = N'IX_Pokemon_Name_Unique')
CREATE UNIQUE NONCLUSTERED INDEX [IX_Pokemon_Name_Unique] ON [Pokemon]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_PokeType_Name_Unique]    Script Date: 2017-12-19 21:18:53 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[PokeType]') AND name = N'IX_PokeType_Name_Unique')
CREATE UNIQUE NONCLUSTERED INDEX [IX_PokeType_Name_Unique] ON [PokeType]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Species_Name_Unique]    Script Date: 2017-12-19 21:18:53 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[Species]') AND name = N'IX_Species_Name_Unique')
CREATE UNIQUE NONCLUSTERED INDEX [IX_Species_Name_Unique] ON [Species]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [CourrielUnique]    Script Date: 2017-12-19 21:18:53 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[Utilisateur]') AND name = N'CourrielUnique')
CREATE UNIQUE NONCLUSTERED INDEX [CourrielUnique] ON [Utilisateur]
(
	[Courriel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [NomUtilisateurUnique]    Script Date: 2017-12-19 21:18:53 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[Utilisateur]') AND name = N'NomUtilisateurUnique')
CREATE UNIQUE NONCLUSTERED INDEX [NomUtilisateurUnique] ON [Utilisateur]
(
	[NomUtilisateur] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[FK__Favorites__FKPok__1AD3FDA4]') AND parent_object_id = OBJECT_ID(N'[Favorites]'))
ALTER TABLE [Favorites]  WITH CHECK ADD FOREIGN KEY([FKPokemonID])
REFERENCES [Pokemon] ([PokemonID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[FK__Favorites__FKUti__1BC821DD]') AND parent_object_id = OBJECT_ID(N'[Favorites]'))
ALTER TABLE [Favorites]  WITH CHECK ADD FOREIGN KEY([FKUtilisateurID])
REFERENCES [Utilisateur] ([UtilisateurID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[FK_Pokemon_Habitat]') AND parent_object_id = OBJECT_ID(N'[Pokemon]'))
ALTER TABLE [Pokemon]  WITH CHECK ADD  CONSTRAINT [FK_Pokemon_Habitat] FOREIGN KEY([FKHabitatID])
REFERENCES [Habitat] ([HabitatID])
ON UPDATE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[FK_Pokemon_Habitat]') AND parent_object_id = OBJECT_ID(N'[Pokemon]'))
ALTER TABLE [Pokemon] CHECK CONSTRAINT [FK_Pokemon_Habitat]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[FK_Pokemon_Pokemon]') AND parent_object_id = OBJECT_ID(N'[Pokemon]'))
ALTER TABLE [Pokemon]  WITH CHECK ADD  CONSTRAINT [FK_Pokemon_Pokemon] FOREIGN KEY([EvolvesInto])
REFERENCES [Pokemon] ([PokemonID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[FK_Pokemon_Pokemon]') AND parent_object_id = OBJECT_ID(N'[Pokemon]'))
ALTER TABLE [Pokemon] CHECK CONSTRAINT [FK_Pokemon_Pokemon]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[FK_Pokemon_PokeType01]') AND parent_object_id = OBJECT_ID(N'[Pokemon]'))
ALTER TABLE [Pokemon]  WITH CHECK ADD  CONSTRAINT [FK_Pokemon_PokeType01] FOREIGN KEY([FKPoketypeID01])
REFERENCES [PokeType] ([PoketypeID])
ON UPDATE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[FK_Pokemon_PokeType01]') AND parent_object_id = OBJECT_ID(N'[Pokemon]'))
ALTER TABLE [Pokemon] CHECK CONSTRAINT [FK_Pokemon_PokeType01]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[FK_Pokemon_PokeType02]') AND parent_object_id = OBJECT_ID(N'[Pokemon]'))
ALTER TABLE [Pokemon]  WITH CHECK ADD  CONSTRAINT [FK_Pokemon_PokeType02] FOREIGN KEY([FKPoketypeID02])
REFERENCES [PokeType] ([PoketypeID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[FK_Pokemon_PokeType02]') AND parent_object_id = OBJECT_ID(N'[Pokemon]'))
ALTER TABLE [Pokemon] CHECK CONSTRAINT [FK_Pokemon_PokeType02]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[FK_Pokemon_Species]') AND parent_object_id = OBJECT_ID(N'[Pokemon]'))
ALTER TABLE [Pokemon]  WITH CHECK ADD  CONSTRAINT [FK_Pokemon_Species] FOREIGN KEY([FKSpeciesID])
REFERENCES [Species] ([SpeciesID])
ON UPDATE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[FK_Pokemon_Species]') AND parent_object_id = OBJECT_ID(N'[Pokemon]'))
ALTER TABLE [Pokemon] CHECK CONSTRAINT [FK_Pokemon_Species]
GO
ALTER DATABASE [Pokedex] SET  READ_WRITE 
GO

SET IDENTITY_INSERT Habitat ON
INSERT INTO Habitat (HabitatID, Name) VALUES (2, N'Cave')
INSERT INTO Habitat (HabitatID, Name) VALUES (3, N'Forest')
INSERT INTO Habitat (HabitatID, Name) VALUES (4, N'Grassland')
INSERT INTO Habitat (HabitatID, Name) VALUES (5, N'Mountain')
INSERT INTO Habitat (HabitatID, Name) VALUES (7, N'Rough terrain')
INSERT INTO Habitat (HabitatID, Name) VALUES (8, N'Sea')
INSERT INTO Habitat (HabitatID, Name) VALUES (9, N'Urban')
INSERT INTO Habitat (HabitatID, Name) VALUES (10, N'Water''s edge')
SET IDENTITY_INSERT Habitat OFF

SET IDENTITY_INSERT PokeType ON
INSERT INTO PokeType (PoketypeID, Name) VALUES (1, N'Bug')
INSERT INTO PokeType (PoketypeID, Name) VALUES (2, N'Dark')
INSERT INTO PokeType (PoketypeID, Name) VALUES (3, N'Dragon')
INSERT INTO PokeType (PoketypeID, Name) VALUES (4, N'Electric')
INSERT INTO PokeType (PoketypeID, Name) VALUES (5, N'Fighting')
INSERT INTO PokeType (PoketypeID, Name) VALUES (6, N'Fire')
INSERT INTO PokeType (PoketypeID, Name) VALUES (19, N'Flying')
INSERT INTO PokeType (PoketypeID, Name) VALUES (7, N'Ghost')
INSERT INTO PokeType (PoketypeID, Name) VALUES (8, N'Grass')
INSERT INTO PokeType (PoketypeID, Name) VALUES (9, N'Ground')
INSERT INTO PokeType (PoketypeID, Name) VALUES (10, N'Ice')
INSERT INTO PokeType (PoketypeID, Name) VALUES (11, N'Normal')
INSERT INTO PokeType (PoketypeID, Name) VALUES (12, N'Poison')
INSERT INTO PokeType (PoketypeID, Name) VALUES (13, N'Psychic')
INSERT INTO PokeType (PoketypeID, Name) VALUES (14, N'Rock')
INSERT INTO PokeType (PoketypeID, Name) VALUES (15, N'Steel')
INSERT INTO PokeType (PoketypeID, Name) VALUES (16, N'Water')
SET IDENTITY_INSERT PokeType OFF

SET IDENTITY_INSERT Species ON
INSERT INTO Species (SpeciesID, Name) VALUES (12, N'Ball')
INSERT INTO Species (SpeciesID, Name) VALUES (15, N'Balloon')
INSERT INTO Species (SpeciesID, Name) VALUES (18, N'Bat')
INSERT INTO Species (SpeciesID, Name) VALUES (19, N'Beak')
INSERT INTO Species (SpeciesID, Name) VALUES (24, N'Bird')
INSERT INTO Species (SpeciesID, Name) VALUES (26, N'Bivalve')
INSERT INTO Species (SpeciesID, Name) VALUES (33, N'Butterfly')
INSERT INTO Species (SpeciesID, Name) VALUES (40, N'Classy Cat')
INSERT INTO Species (SpeciesID, Name) VALUES (44, N'Cobra')
INSERT INTO Species (SpeciesID, Name) VALUES (46, N'Cocoon')
INSERT INTO Species (SpeciesID, Name) VALUES (61, N'Dopey')
INSERT INTO Species (SpeciesID, Name) VALUES (63, N'Drill')
INSERT INTO Species (SpeciesID, Name) VALUES (64, N'Duck')
INSERT INTO Species (SpeciesID, Name) VALUES (75, N'Fairy')
INSERT INTO Species (SpeciesID, Name) VALUES (78, N'Fire Horse')
INSERT INTO Species (SpeciesID, Name) VALUES (83, N'Flame')
INSERT INTO Species (SpeciesID, Name) VALUES (85, N'Flower')
INSERT INTO Species (SpeciesID, Name) VALUES (86, N'Flycatcher')
INSERT INTO Species (SpeciesID, Name) VALUES (90, N'Fox')
INSERT INTO Species (SpeciesID, Name) VALUES (94, N'Gas')
INSERT INTO Species (SpeciesID, Name) VALUES (98, N'Hairy Bug')
INSERT INTO Species (SpeciesID, Name) VALUES (103, N'Hermit Crab')
INSERT INTO Species (SpeciesID, Name) VALUES (107, N'Hypnosis')
INSERT INTO Species (SpeciesID, Name) VALUES (111, N'Insect')
INSERT INTO Species (SpeciesID, Name) VALUES (118, N'Jellyfish')
INSERT INTO Species (SpeciesID, Name) VALUES (129, N'Legendary')
INSERT INTO Species (SpeciesID, Name) VALUES (135, N'Lizard')
INSERT INTO Species (SpeciesID, Name) VALUES (144, N'Magnet')
INSERT INTO Species (SpeciesID, Name) VALUES (149, N'Megaton')
INSERT INTO Species (SpeciesID, Name) VALUES (153, N'Mole')
INSERT INTO Species (SpeciesID, Name) VALUES (155, N'Mouse')
INSERT INTO Species (SpeciesID, Name) VALUES (157, N'Mushroom')
INSERT INTO Species (SpeciesID, Name) VALUES (169, N'Pig Monkey')
INSERT INTO Species (SpeciesID, Name) VALUES (170, N'Pincer')
INSERT INTO Species (SpeciesID, Name) VALUES (173, N'Poison Bee')
INSERT INTO Species (SpeciesID, Name) VALUES (175, N'Poison Moth')
INSERT INTO Species (SpeciesID, Name) VALUES (176, N'Poison Pin')
INSERT INTO Species (SpeciesID, Name) VALUES (180, N'Psi')
INSERT INTO Species (SpeciesID, Name) VALUES (183, N'Puppy')
INSERT INTO Species (SpeciesID, Name) VALUES (187, N'River Crab')
INSERT INTO Species (SpeciesID, Name) VALUES (188, N'Rock')
INSERT INTO Species (SpeciesID, Name) VALUES (192, N'Rock Snake')
INSERT INTO Species (SpeciesID, Name) VALUES (200, N'Scratch Cat')
INSERT INTO Species (SpeciesID, Name) VALUES (205, N'Sea Lion')
INSERT INTO Species (SpeciesID, Name) VALUES (207, N'Seed')
INSERT INTO Species (SpeciesID, Name) VALUES (208, N'Shadow')
INSERT INTO Species (SpeciesID, Name) VALUES (211, N'Shellfish')
INSERT INTO Species (SpeciesID, Name) VALUES (216, N'Sludge')
INSERT INTO Species (SpeciesID, Name) VALUES (217, N'Snake')
INSERT INTO Species (SpeciesID, Name) VALUES (230, N'Superpower')
INSERT INTO Species (SpeciesID, Name) VALUES (234, N'Tadpole')
INSERT INTO Species (SpeciesID, Name) VALUES (239, N'Tiny Bird')
INSERT INTO Species (SpeciesID, Name) VALUES (241, N'Tiny Turtle')
INSERT INTO Species (SpeciesID, Name) VALUES (247, N'Triple Bird')
INSERT INTO Species (SpeciesID, Name) VALUES (248, N'Turtle')
INSERT INTO Species (SpeciesID, Name) VALUES (249, N'Twin Bird')
INSERT INTO Species (SpeciesID, Name) VALUES (258, N'Weed')
INSERT INTO Species (SpeciesID, Name) VALUES (263, N'Wild Duck')
INSERT INTO Species (SpeciesID, Name) VALUES (269, N'Worm')
SET IDENTITY_INSERT Species OFF

SET IDENTITY_INSERT Pokemon ON
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (1, N'Bulbasaur3', 44, 49, 49, 65, 65, 45, CAST(1.00 AS Decimal(5, 2)), CAST(2.00 AS Decimal(5, 2)), 32768, 7, NULL, 4, 207, 2)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (2, N'Ivysaur', 60, 62, 63, 80, 80, 60, CAST(1.00 AS Decimal(5, 2)), CAST(13.00 AS Decimal(5, 2)), 32768, 8, 12, 4, 207, 3)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (3, N'Venusaur', 80, 82, 83, 100, 100, 80, CAST(2.00 AS Decimal(5, 2)), CAST(100.00 AS Decimal(5, 2)), 32768, 8, 12, 4, 207, NULL)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (4, N'Charmander', 39, 52, 43, 60, 50, 65, CAST(0.60 AS Decimal(5, 2)), CAST(8.50 AS Decimal(5, 2)), 16711680, 6, NULL, 5, 135, 5)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (5, N'Charmeleon', 58, 64, 58, 80, 65, 80, CAST(1.10 AS Decimal(5, 2)), CAST(19.00 AS Decimal(5, 2)), 16711680, 6, NULL, 5, 83, 6)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (6, N'Charizard', 78, 84, 78, 109, 85, 100, CAST(1.70 AS Decimal(5, 2)), CAST(90.50 AS Decimal(5, 2)), 16711680, 6, 19, 5, 83, NULL)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (7, N'Squirtle', 44, 48, 65, 50, 64, 43, CAST(0.50 AS Decimal(5, 2)), CAST(9.00 AS Decimal(5, 2)), 255, 16, NULL, 10, 241, 8)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (8, N'Wartortle', 59, 63, 80, 65, 80, 58, CAST(1.00 AS Decimal(5, 2)), CAST(22.50 AS Decimal(5, 2)), 255, 16, NULL, 10, 248, 9)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (9, N'Blastoise', 79, 83, 100, 85, 105, 78, CAST(1.60 AS Decimal(5, 2)), CAST(85.50 AS Decimal(5, 2)), 255, 16, NULL, 10, 211, NULL)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (10, N'Caterpie', 45, 30, 35, 20, 20, 45, CAST(0.30 AS Decimal(5, 2)), CAST(2.90 AS Decimal(5, 2)), 32768, 1, NULL, 3, 269, 11)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (11, N'Metapod', 50, 20, 55, 25, 25, 30, CAST(0.70 AS Decimal(5, 2)), CAST(9.90 AS Decimal(5, 2)), 32768, 1, NULL, 3, 46, 12)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (12, N'Butterfree', 60, 45, 50, 80, 80, 70, CAST(1.10 AS Decimal(5, 2)), CAST(32.00 AS Decimal(5, 2)), 16119285, 1, 19, 3, 33, NULL)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (13, N'Weedle', 40, 35, 30, 20, 20, 50, CAST(0.30 AS Decimal(5, 2)), CAST(3.20 AS Decimal(5, 2)), 13468991, 1, 12, 3, 98, 14)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (14, N'Kakuna', 45, 25, 50, 25, 25, 35, CAST(0.60 AS Decimal(5, 2)), CAST(10.00 AS Decimal(5, 2)), 16776960, 1, 12, 3, 46, 15)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (15, N'Beedrill', 65, 80, 40, 45, 80, 75, CAST(1.00 AS Decimal(5, 2)), CAST(29.50 AS Decimal(5, 2)), 16776960, 1, 12, 3, 173, NULL)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (16, N'Pidgey', 40, 45, 40, 35, 35, 56, CAST(0.30 AS Decimal(5, 2)), CAST(1.80 AS Decimal(5, 2)), 13468991, 11, 19, 3, 239, 17)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (17, N'Pidgeotto', 63, 60, 55, 50, 50, 71, CAST(1.10 AS Decimal(5, 2)), CAST(30.00 AS Decimal(5, 2)), 13468991, 11, 19, 3, 24, 18)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (18, N'Pidgeot', 83, 80, 75, 70, 70, 91, CAST(1.50 AS Decimal(5, 2)), CAST(39.50 AS Decimal(5, 2)), 13468991, 11, 19, 3, 24, NULL)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (19, N'Rattata', 30, 56, 35, 25, 35, 72, CAST(0.30 AS Decimal(5, 2)), CAST(3.50 AS Decimal(5, 2)), 8388736, 11, NULL, 4, 155, 20)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (20, N'Raticate', 55, 81, 60, 50, 70, 97, CAST(0.70 AS Decimal(5, 2)), CAST(18.50 AS Decimal(5, 2)), 13468991, 11, NULL, 4, 155, NULL)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (21, N'Spearow', 40, 60, 30, 31, 31, 70, CAST(0.30 AS Decimal(5, 2)), CAST(2.00 AS Decimal(5, 2)), 13468991, 11, 19, 7, 239, 22)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (22, N'Fearow', 65, 90, 65, 61, 61, 100, CAST(1.20 AS Decimal(5, 2)), CAST(38.00 AS Decimal(5, 2)), 13468991, 11, 19, 7, 19, NULL)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (23, N'Ekans', 35, 60, 44, 40, 54, 55, CAST(2.00 AS Decimal(5, 2)), CAST(6.90 AS Decimal(5, 2)), 8388736, 12, NULL, 4, 217, 24)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (24, N'Arbok', 60, 85, 69, 65, 79, 80, CAST(3.50 AS Decimal(5, 2)), CAST(65.00 AS Decimal(5, 2)), 8388736, 12, NULL, 4, 44, NULL)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (25, N'Pikachu', 35, 55, 30, 50, 40, 90, CAST(0.40 AS Decimal(5, 2)), CAST(6.00 AS Decimal(5, 2)), 16776960, 4, NULL, 3, 155, 26)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (26, N'Raichu', 60, 90, 55, 90, 80, 100, CAST(0.80 AS Decimal(5, 2)), CAST(30.00 AS Decimal(5, 2)), 16776960, 4, NULL, 3, 155, NULL)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (27, N'Sandshrew', 50, 75, 85, 20, 30, 40, CAST(0.60 AS Decimal(5, 2)), CAST(12.00 AS Decimal(5, 2)), 16776960, 9, NULL, 7, 155, 28)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (28, N'Sandslash', 75, 100, 110, 45, 55, 65, CAST(1.00 AS Decimal(5, 2)), CAST(29.50 AS Decimal(5, 2)), 16776960, 9, NULL, 7, 155, NULL)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (29, N'Nidoran F', 55, 47, 52, 40, 40, 41, CAST(0.40 AS Decimal(5, 2)), CAST(7.00 AS Decimal(5, 2)), 255, 12, NULL, 4, 176, 30)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (30, N'Nidorina', 70, 62, 67, 55, 55, 56, CAST(0.80 AS Decimal(5, 2)), CAST(20.00 AS Decimal(5, 2)), 255, 12, NULL, 4, 176, 31)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (31, N'Nidoqueen', 90, 82, 87, 75, 85, 76, CAST(1.30 AS Decimal(5, 2)), CAST(60.00 AS Decimal(5, 2)), 255, 12, 9, 4, 63, NULL)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (32, N'Nidoran M', 46, 57, 40, 40, 40, 50, CAST(0.50 AS Decimal(5, 2)), CAST(9.00 AS Decimal(5, 2)), 8388736, 12, NULL, 4, 176, 33)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (33, N'Nidorino', 61, 72, 57, 55, 55, 65, CAST(0.90 AS Decimal(5, 2)), CAST(19.50 AS Decimal(5, 2)), 8388736, 12, NULL, 4, 176, 34)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (34, N'Nidoking', 81, 92, 77, 85, 75, 85, CAST(1.40 AS Decimal(5, 2)), CAST(62.00 AS Decimal(5, 2)), 8388736, 12, 9, 4, 63, NULL)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (35, N'Clefairy', 70, 45, 48, 60, 65, 35, CAST(0.60 AS Decimal(5, 2)), CAST(7.50 AS Decimal(5, 2)), 16761035, 11, NULL, 5, 75, 36)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (36, N'Clefable', 95, 70, 73, 85, 90, 60, CAST(1.30 AS Decimal(5, 2)), CAST(40.00 AS Decimal(5, 2)), 16761035, 11, NULL, 5, 75, NULL)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (37, N'Vulpix', 38, 41, 40, 50, 65, 65, CAST(0.60 AS Decimal(5, 2)), CAST(9.90 AS Decimal(5, 2)), 13468991, 6, NULL, 4, 90, 38)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (38, N'Ninetales', 73, 76, 75, 81, 100, 100, CAST(1.10 AS Decimal(5, 2)), CAST(19.90 AS Decimal(5, 2)), 16776960, 6, NULL, 4, 90, NULL)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (39, N'Jigglypuff', 115, 45, 20, 45, 25, 20, CAST(0.50 AS Decimal(5, 2)), CAST(5.50 AS Decimal(5, 2)), 16761035, 11, NULL, 4, 15, 40)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (40, N'Wigglytuff', 140, 70, 45, 75, 50, 45, CAST(1.00 AS Decimal(5, 2)), CAST(12.00 AS Decimal(5, 2)), 16761035, 11, NULL, 4, 15, NULL)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (41, N'Zubat', 40, 45, 35, 30, 40, 55, CAST(0.80 AS Decimal(5, 2)), CAST(7.50 AS Decimal(5, 2)), 8388736, 12, 19, 2, 18, 42)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (42, N'Golbat', 75, 80, 70, 65, 75, 90, CAST(1.60 AS Decimal(5, 2)), CAST(55.00 AS Decimal(5, 2)), 8388736, 12, 19, 2, 18, NULL)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (43, N'Oddish', 45, 50, 55, 75, 65, 30, CAST(0.50 AS Decimal(5, 2)), CAST(5.40 AS Decimal(5, 2)), 255, 8, 12, 4, 258, 44)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (44, N'Gloom', 60, 65, 70, 85, 75, 40, CAST(0.80 AS Decimal(5, 2)), CAST(8.60 AS Decimal(5, 2)), 255, 8, 12, 4, 258, 45)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (45, N'Vileplume', 75, 80, 85, 100, 90, 50, CAST(1.20 AS Decimal(5, 2)), CAST(18.60 AS Decimal(5, 2)), 16711680, 8, 12, 4, 85, NULL)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (46, N'Paras', 35, 70, 55, 45, 55, 25, CAST(0.30 AS Decimal(5, 2)), CAST(5.40 AS Decimal(5, 2)), 16711680, 1, 8, 3, 157, 47)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (47, N'Parasect', 60, 95, 80, 60, 80, 30, CAST(1.00 AS Decimal(5, 2)), CAST(29.50 AS Decimal(5, 2)), 16711680, 1, 8, 3, 157, NULL)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (48, N'Venonat', 60, 55, 50, 40, 55, 45, CAST(1.00 AS Decimal(5, 2)), CAST(30.00 AS Decimal(5, 2)), 8388736, 1, 12, 3, 111, 49)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (49, N'Venomoth', 70, 65, 60, 90, 75, 90, CAST(1.50 AS Decimal(5, 2)), CAST(12.50 AS Decimal(5, 2)), 8388736, 1, 12, 3, 175, NULL)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (50, N'Diglett', 10, 55, 25, 35, 45, 95, CAST(0.20 AS Decimal(5, 2)), CAST(0.80 AS Decimal(5, 2)), 13468991, 9, NULL, 2, 153, 51)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (51, N'Dugtrio', 35, 80, 50, 50, 70, 120, CAST(0.70 AS Decimal(5, 2)), CAST(33.30 AS Decimal(5, 2)), 13468991, 9, NULL, 2, 153, NULL)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (52, N'Meowth', 40, 45, 35, 40, 40, 90, CAST(0.40 AS Decimal(5, 2)), CAST(4.20 AS Decimal(5, 2)), 16776960, 11, NULL, 9, 200, 53)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (53, N'Persian', 65, 70, 60, 65, 65, 115, CAST(1.00 AS Decimal(5, 2)), CAST(32.00 AS Decimal(5, 2)), 16776960, 11, NULL, 9, 40, NULL)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (54, N'Psyduck', 50, 52, 48, 65, 50, 55, CAST(0.80 AS Decimal(5, 2)), CAST(19.60 AS Decimal(5, 2)), 16776960, 16, NULL, 10, 64, 55)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (55, N'Golduck', 80, 82, 78, 95, 80, 85, CAST(1.70 AS Decimal(5, 2)), CAST(76.60 AS Decimal(5, 2)), 255, 16, NULL, 10, 64, NULL)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (56, N'Mankey', 40, 80, 35, 35, 45, 70, CAST(0.50 AS Decimal(5, 2)), CAST(28.00 AS Decimal(5, 2)), 13468991, 5, NULL, 5, 169, 57)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (57, N'Primeape', 65, 105, 60, 60, 70, 95, CAST(1.00 AS Decimal(5, 2)), CAST(32.00 AS Decimal(5, 2)), 13468991, 5, NULL, 5, 169, NULL)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (58, N'Growlithe', 55, 70, 45, 70, 50, 60, CAST(0.70 AS Decimal(5, 2)), CAST(19.00 AS Decimal(5, 2)), 13468991, 6, NULL, 4, 183, 59)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (59, N'Arcanine', 90, 110, 80, 100, 80, 95, CAST(1.90 AS Decimal(5, 2)), CAST(155.00 AS Decimal(5, 2)), 13468991, 6, NULL, 4, 129, NULL)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (60, N'Poliwag', 40, 50, 40, 40, 40, 90, CAST(0.60 AS Decimal(5, 2)), CAST(12.40 AS Decimal(5, 2)), 255, 16, NULL, 10, 234, 61)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (61, N'Poliwhirl', 65, 65, 65, 50, 50, 90, CAST(1.00 AS Decimal(5, 2)), CAST(20.00 AS Decimal(5, 2)), 255, 16, NULL, 10, 234, 62)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (62, N'Poliwrath', 90, 85, 95, 70, 90, 70, CAST(1.30 AS Decimal(5, 2)), CAST(54.00 AS Decimal(5, 2)), 255, 16, 5, 10, 234, NULL)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (63, N'Abra', 25, 20, 15, 105, 55, 90, CAST(0.90 AS Decimal(5, 2)), CAST(19.50 AS Decimal(5, 2)), 13468991, 13, NULL, 9, 180, 64)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (64, N'Kadabra', 40, 35, 30, 120, 70, 105, CAST(1.30 AS Decimal(5, 2)), CAST(56.50 AS Decimal(5, 2)), 13468991, 13, NULL, 9, 180, 65)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (65, N'Alakazam', 55, 50, 45, 135, 85, 120, CAST(1.50 AS Decimal(5, 2)), CAST(48.00 AS Decimal(5, 2)), 13468991, 13, NULL, 9, 180, NULL)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (66, N'Machop', 70, 80, 50, 35, 35, 35, CAST(0.80 AS Decimal(5, 2)), CAST(19.50 AS Decimal(5, 2)), 8421504, 5, NULL, 5, 230, 67)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (67, N'Machoke', 80, 100, 70, 50, 60, 45, CAST(1.50 AS Decimal(5, 2)), CAST(70.50 AS Decimal(5, 2)), 8421504, 5, NULL, 5, 230, 68)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (68, N'Machamp', 90, 130, 80, 65, 85, 55, CAST(1.60 AS Decimal(5, 2)), CAST(130.00 AS Decimal(5, 2)), 8421504, 5, NULL, 5, 230, NULL)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (69, N'Bellsprout', 50, 75, 35, 70, 30, 40, CAST(0.70 AS Decimal(5, 2)), CAST(4.00 AS Decimal(5, 2)), 32768, 8, 12, 3, 85, 70)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (70, N'Weepinbell', 65, 90, 50, 85, 45, 55, CAST(1.00 AS Decimal(5, 2)), CAST(6.40 AS Decimal(5, 2)), 32768, 8, 12, 3, 86, 71)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (71, N'Victreebel', 80, 105, 65, 100, 60, 70, CAST(1.70 AS Decimal(5, 2)), CAST(15.50 AS Decimal(5, 2)), 32768, 8, 12, 3, 86, NULL)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (72, N'Tentacool', 40, 40, 35, 50, 100, 70, CAST(0.90 AS Decimal(5, 2)), CAST(45.50 AS Decimal(5, 2)), 255, 16, 12, 8, 118, 73)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (73, N'Tentacruel', 80, 70, 65, 80, 120, 100, CAST(1.60 AS Decimal(5, 2)), CAST(55.00 AS Decimal(5, 2)), 255, 16, 12, 8, 118, NULL)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (74, N'Geodude', 40, 80, 100, 30, 30, 20, CAST(0.40 AS Decimal(5, 2)), CAST(20.00 AS Decimal(5, 2)), 13468991, 14, 9, 5, 188, 75)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (75, N'Graveler', 55, 95, 115, 45, 45, 35, CAST(1.00 AS Decimal(5, 2)), CAST(105.00 AS Decimal(5, 2)), 13468991, 14, 9, 5, 188, 76)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (76, N'Golem', 80, 110, 130, 55, 65, 45, CAST(1.40 AS Decimal(5, 2)), CAST(300.00 AS Decimal(5, 2)), 13468991, 14, 9, 5, 149, NULL)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (77, N'Ponyta', 50, 85, 55, 65, 65, 90, CAST(1.00 AS Decimal(5, 2)), CAST(30.00 AS Decimal(5, 2)), 16776960, 6, NULL, 4, 78, 78)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (78, N'Rapidash', 65, 100, 70, 80, 80, 105, CAST(1.70 AS Decimal(5, 2)), CAST(95.00 AS Decimal(5, 2)), 16776960, 6, NULL, 4, 78, NULL)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (79, N'Slowpoke', 90, 65, 65, 40, 40, 15, CAST(1.20 AS Decimal(5, 2)), CAST(36.00 AS Decimal(5, 2)), 16761035, 16, 13, 10, 61, 80)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (80, N'Slowbro', 95, 75, 110, 100, 80, 30, CAST(1.60 AS Decimal(5, 2)), CAST(78.50 AS Decimal(5, 2)), 16761035, 16, 13, 10, 103, NULL)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (81, N'Magnemite', 25, 35, 70, 95, 55, 45, CAST(0.30 AS Decimal(5, 2)), CAST(6.00 AS Decimal(5, 2)), 8421504, 4, 15, 7, 144, 82)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (82, N'Magneton', 50, 60, 95, 120, 70, 70, CAST(1.00 AS Decimal(5, 2)), CAST(60.00 AS Decimal(5, 2)), 8421504, 4, 15, 7, 144, NULL)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (83, N'Farfetch''d', 52, 65, 55, 58, 62, 60, CAST(0.80 AS Decimal(5, 2)), CAST(15.00 AS Decimal(5, 2)), 13468991, 11, 19, 4, 263, NULL)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (84, N'Doduo', 35, 85, 45, 35, 35, 75, CAST(1.40 AS Decimal(5, 2)), CAST(39.20 AS Decimal(5, 2)), 13468991, 11, 19, 4, 249, 85)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (85, N'Dodrio', 60, 110, 70, 60, 60, 100, CAST(1.80 AS Decimal(5, 2)), CAST(85.20 AS Decimal(5, 2)), 13468991, 11, 19, 4, 247, NULL)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (86, N'Seel', 65, 45, 55, 45, 70, 45, CAST(1.10 AS Decimal(5, 2)), CAST(90.00 AS Decimal(5, 2)), 16119285, 16, NULL, 8, 205, 87)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (87, N'Dewgong', 90, 70, 80, 70, 95, 70, CAST(1.70 AS Decimal(5, 2)), CAST(120.00 AS Decimal(5, 2)), 16119285, 16, 10, 8, 205, NULL)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (88, N'Grimer', 80, 80, 50, 40, 50, 25, CAST(0.90 AS Decimal(5, 2)), CAST(30.00 AS Decimal(5, 2)), 8388736, 12, NULL, 9, 216, 89)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (89, N'Muk', 105, 105, 75, 65, 100, 50, CAST(1.20 AS Decimal(5, 2)), CAST(30.00 AS Decimal(5, 2)), 8388736, 12, NULL, 9, 216, NULL)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (90, N'Shellder', 30, 65, 100, 45, 25, 40, CAST(0.30 AS Decimal(5, 2)), CAST(4.00 AS Decimal(5, 2)), 8388736, 16, NULL, 8, 26, 91)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (91, N'Cloyster', 50, 95, 180, 85, 45, 70, CAST(1.50 AS Decimal(5, 2)), CAST(132.50 AS Decimal(5, 2)), 8388736, 16, 10, 8, 26, NULL)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (92, N'Gastly', 30, 35, 30, 100, 35, 80, CAST(1.30 AS Decimal(5, 2)), CAST(0.10 AS Decimal(5, 2)), 8388736, 7, 12, 2, 94, 93)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (93, N'Haunter', 45, 50, 45, 115, 55, 95, CAST(1.60 AS Decimal(5, 2)), CAST(0.10 AS Decimal(5, 2)), 8388736, 7, 12, 2, 94, 94)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (94, N'Gengar', 60, 65, 60, 130, 75, 110, CAST(1.50 AS Decimal(5, 2)), CAST(40.50 AS Decimal(5, 2)), 8388736, 7, 12, 2, 208, NULL)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (95, N'Onix', 35, 45, 160, 30, 45, 70, CAST(8.80 AS Decimal(5, 2)), CAST(210.00 AS Decimal(5, 2)), 8421504, 14, 9, 2, 192, NULL)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (96, N'Drowzee', 60, 48, 45, 43, 90, 42, CAST(1.00 AS Decimal(5, 2)), CAST(32.40 AS Decimal(5, 2)), 16776960, 13, NULL, 4, 107, 97)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (97, N'Hypno', 85, 73, 70, 73, 115, 67, CAST(1.60 AS Decimal(5, 2)), CAST(75.60 AS Decimal(5, 2)), 16776960, 13, NULL, 4, 107, NULL)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (98, N'Krabby', 30, 105, 90, 25, 25, 50, CAST(0.40 AS Decimal(5, 2)), CAST(6.50 AS Decimal(5, 2)), 16711680, 16, NULL, 10, 187, 99)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (99, N'Kingler', 55, 130, 115, 50, 50, 75, CAST(1.30 AS Decimal(5, 2)), CAST(60.00 AS Decimal(5, 2)), 16711680, 16, NULL, 10, 170, NULL)
INSERT INTO Pokemon (PokemonID, Name, HP, Attack, Defense, SpecialAttack, SpecialDefense, Speed, Height, Weight, Color, FKPoketypeID01, FKPoketypeID02, FKHabitatID, FKSpeciesID, EvolvesInto) VALUES (100, N'Voltorb', 40, 30, 50, 55, 55, 100, CAST(0.50 AS Decimal(5, 2)), CAST(10.40 AS Decimal(5, 2)), 16711680, 4, NULL, 9, 12, NULL)
SET IDENTITY_INSERT Pokemon OFF
