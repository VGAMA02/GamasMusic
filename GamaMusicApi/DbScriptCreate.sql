USE [master]
GO
/****** Object:  Database [gamaMusic]    Script Date: 26/04/2023 05:58:34 p. m. ******/
CREATE DATABASE [gamaMusic]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'gamaMusic', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER0\MSSQL\DATA\gamaMusic.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'gamaMusic_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER0\MSSQL\DATA\gamaMusic_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [gamaMusic] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [gamaMusic].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [gamaMusic] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [gamaMusic] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [gamaMusic] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [gamaMusic] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [gamaMusic] SET ARITHABORT OFF 
GO
ALTER DATABASE [gamaMusic] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [gamaMusic] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [gamaMusic] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [gamaMusic] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [gamaMusic] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [gamaMusic] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [gamaMusic] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [gamaMusic] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [gamaMusic] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [gamaMusic] SET  DISABLE_BROKER 
GO
ALTER DATABASE [gamaMusic] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [gamaMusic] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [gamaMusic] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [gamaMusic] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [gamaMusic] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [gamaMusic] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [gamaMusic] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [gamaMusic] SET RECOVERY FULL 
GO
ALTER DATABASE [gamaMusic] SET  MULTI_USER 
GO
ALTER DATABASE [gamaMusic] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [gamaMusic] SET DB_CHAINING OFF 
GO
ALTER DATABASE [gamaMusic] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [gamaMusic] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [gamaMusic] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'gamaMusic', N'ON'
GO
ALTER DATABASE [gamaMusic] SET QUERY_STORE = OFF
GO
USE [gamaMusic]
GO
/****** Object:  Table [dbo].[CT_Album]    Script Date: 26/04/2023 05:58:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_Album](
	[PKAlbum] [int] IDENTITY(1,1) NOT NULL,
	[FKArtist] [int] NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[year] [int] NOT NULL,
	[LastUpdate] [datetime] NOT NULL,
	[Available] [bit] NOT NULL,
 CONSTRAINT [PK_CT_Album] PRIMARY KEY CLUSTERED 
(
	[PKAlbum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CT_Artist]    Script Date: 26/04/2023 05:58:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_Artist](
	[PKArtist] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Nationality] [varchar](100) NOT NULL,
	[year] [int] NOT NULL,
	[LastUpdate] [datetime] NOT NULL,
	[Available] [bit] NOT NULL,
 CONSTRAINT [PK_CT_Artist] PRIMARY KEY CLUSTERED 
(
	[PKArtist] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CT_Song]    Script Date: 26/04/2023 05:58:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_Song](
	[PKSong] [int] IDENTITY(1,1) NOT NULL,
	[FKAlbum] [int] NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[year] [int] NOT NULL,
	[Gender] [varchar](100) NOT NULL,
	[Length] [varchar](10) NOT NULL,
	[LastUpdate] [datetime] NOT NULL,
	[Available] [bit] NOT NULL,
 CONSTRAINT [PK_CT_Song] PRIMARY KEY CLUSTERED 
(
	[PKSong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CT_Album] ON 
GO
INSERT [dbo].[CT_Album] ([PKAlbum], [FKArtist], [Name], [year], [LastUpdate], [Available]) VALUES (1, 1, N'MyFoot', 2000, CAST(N'2023-04-26T12:18:47.630' AS DateTime), 1)
GO
INSERT [dbo].[CT_Album] ([PKAlbum], [FKArtist], [Name], [year], [LastUpdate], [Available]) VALUES (2, 1, N'ThankYouMyTwilight', 2002, CAST(N'2023-04-26T13:17:12.283' AS DateTime), 1)
GO
INSERT [dbo].[CT_Album] ([PKAlbum], [FKArtist], [Name], [year], [LastUpdate], [Available]) VALUES (3, 4, N'Vaquero', 2002, CAST(N'2023-04-26T13:19:08.367' AS DateTime), 1)
GO
INSERT [dbo].[CT_Album] ([PKAlbum], [FKArtist], [Name], [year], [LastUpdate], [Available]) VALUES (4, 2, N'Ship', 2010, CAST(N'2023-04-26T14:22:11.150' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[CT_Album] OFF
GO
SET IDENTITY_INSERT [dbo].[CT_Artist] ON 
GO
INSERT [dbo].[CT_Artist] ([PKArtist], [Name], [Nationality], [year], [LastUpdate], [Available]) VALUES (1, N'ThePillows', N'Japon', 1986, CAST(N'2023-04-25T19:53:24.553' AS DateTime), 1)
GO
INSERT [dbo].[CT_Artist] ([PKArtist], [Name], [Nationality], [year], [LastUpdate], [Available]) VALUES (2, N'Motorama', N'USA', 2000, CAST(N'2023-04-25T20:41:23.320' AS DateTime), 1)
GO
INSERT [dbo].[CT_Artist] ([PKArtist], [Name], [Nationality], [year], [LastUpdate], [Available]) VALUES (4, N'VaqueroKamikaze', N'Mexico', 2012, CAST(N'2023-04-25T20:50:05.693' AS DateTime), 1)
GO
INSERT [dbo].[CT_Artist] ([PKArtist], [Name], [Nationality], [year], [LastUpdate], [Available]) VALUES (5, N'Lyin', N'Japan', 2008, CAST(N'2023-04-25T22:41:49.950' AS DateTime), 1)
GO
INSERT [dbo].[CT_Artist] ([PKArtist], [Name], [Nationality], [year], [LastUpdate], [Available]) VALUES (6, N'Heroes del silencio', N'España', 1984, CAST(N'2023-04-25T23:28:29.650' AS DateTime), 1)
GO
INSERT [dbo].[CT_Artist] ([PKArtist], [Name], [Nationality], [year], [LastUpdate], [Available]) VALUES (7, N'Piotr Musial', N'Polonia', 1983, CAST(N'2023-04-25T23:41:42.557' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[CT_Artist] OFF
GO
SET IDENTITY_INSERT [dbo].[CT_Song] ON 
GO
INSERT [dbo].[CT_Song] ([PKSong], [FKAlbum], [Name], [year], [Gender], [Length], [LastUpdate], [Available]) VALUES (1, 1, N'OneLife', 2000, N'Rock', N'4:00', CAST(N'2023-04-26T15:14:43.640' AS DateTime), 1)
GO
INSERT [dbo].[CT_Song] ([PKSong], [FKAlbum], [Name], [year], [Gender], [Length], [LastUpdate], [Available]) VALUES (2, 1, N'winona', 2005, N'rock', N'2:10', CAST(N'2023-04-26T15:54:39.343' AS DateTime), 1)
GO
INSERT [dbo].[CT_Song] ([PKSong], [FKAlbum], [Name], [year], [Gender], [Length], [LastUpdate], [Available]) VALUES (3, 1, N'Updates', 2008, N'Alternative', N'1:58', CAST(N'2023-04-26T17:54:45.090' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[CT_Song] OFF
GO
ALTER TABLE [dbo].[CT_Album] ADD  CONSTRAINT [DF_CT_Album_LastUpdate]  DEFAULT (getdate()) FOR [LastUpdate]
GO
ALTER TABLE [dbo].[CT_Album] ADD  CONSTRAINT [DF_CT_Album_Available]  DEFAULT ((1)) FOR [Available]
GO
ALTER TABLE [dbo].[CT_Artist] ADD  CONSTRAINT [DF_CT_Artist_LastUpdate]  DEFAULT (getdate()) FOR [LastUpdate]
GO
ALTER TABLE [dbo].[CT_Artist] ADD  CONSTRAINT [DF_CT_Artist_Available]  DEFAULT ((1)) FOR [Available]
GO
ALTER TABLE [dbo].[CT_Song] ADD  CONSTRAINT [DF_CT_Song_LastUpdate]  DEFAULT (getdate()) FOR [LastUpdate]
GO
ALTER TABLE [dbo].[CT_Song] ADD  CONSTRAINT [DF_CT_Song_Available]  DEFAULT ((1)) FOR [Available]
GO
ALTER TABLE [dbo].[CT_Album]  WITH CHECK ADD  CONSTRAINT [FK_CT_Album_CT_Artist] FOREIGN KEY([FKArtist])
REFERENCES [dbo].[CT_Artist] ([PKArtist])
GO
ALTER TABLE [dbo].[CT_Album] CHECK CONSTRAINT [FK_CT_Album_CT_Artist]
GO
ALTER TABLE [dbo].[CT_Song]  WITH CHECK ADD  CONSTRAINT [FK_CT_Song_CT_Album] FOREIGN KEY([FKAlbum])
REFERENCES [dbo].[CT_Album] ([PKAlbum])
GO
ALTER TABLE [dbo].[CT_Song] CHECK CONSTRAINT [FK_CT_Song_CT_Album]
GO
/****** Object:  StoredProcedure [dbo].[Up_AddAlbum]    Script Date: 26/04/2023 05:58:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Up_AddAlbum]
	@Name varchar(100),
	@FK_Artist varchar(100),
	@year int,
	@FK_Id int = 0
AS
BEGIN
	
	SELECT @FK_Id = PKArtist FROM CT_Artist WITH(NOLOCK) WHERE [Name] = @FK_Artist AND Available = 1; --Obtener llave de CT_Artist
	IF (@FK_Id != 0)
	BEGIN
		IF NOT EXISTS (SELECT CT_Album.PKAlbum FROM CT_Album WITH(NOLOCK) WHERE CT_Album.[Name] = @Name AND CT_Album.FKArtist = @FK_Id AND CT_Album.[year]  = @year AND Available = 1) --Comprobar si ya existe el album
			BEGIN
				INSERT INTO CT_Album ([Name],FKArtist,[year]) VALUES(@Name,@FK_Id,@year)
				SELECT 'OK' as resultado
			END
		ELSE
			BEGIN
				SELECT 'El Album ya existe' as resultado
			END
	END
	ELSE
		BEGIN
		  SELECT 'No se encontro artista' as resultado
		END
END
GO
/****** Object:  StoredProcedure [dbo].[Up_AddArtist]    Script Date: 26/04/2023 05:58:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>

-- EXEC dbo.Up_AddArtist Motorama, USA, 2000


-- =============================================




CREATE PROCEDURE [dbo].[Up_AddArtist]
	@Name varchar(100),
	@Nationality varchar(100),
	@year int

AS
BEGIN
	if NOT exists(SELECT 
		[PKArtist],
		[Name],
		[Nationality],
		[year],
		[LastUpdate],
		[Available] FROM CT_Artist A WITH(NOLOCK) WHERE A.[Name] = @Name AND A.Nationality = @Nationality AND A.[year] = @year)

	BEGIN
		INSERT INTO CT_Artist ([Name],Nationality,[year]) VALUES(@Name,@Nationality,@year)
		SELECT 
		[PKArtist],
		[Name],
		[Nationality],
		[year],
		[LastUpdate],
		[Available] FROM CT_Artist A WITH(NOLOCK) WHERE A.[Name] = @Name AND A.Nationality = @Nationality AND A.[year] = @year
	END
	ELSE
	BEGIN
		SELECT -1 as resultado
	END
END
GO
/****** Object:  StoredProcedure [dbo].[Up_AddSong]    Script Date: 26/04/2023 05:58:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Up_AddSong]
	@Name varchar(100),
	@FK_Album varchar(100),
	@year int,
	@Gender varchar(100),
	@Length varchar(100),

	@FK_Id int = 0
AS
BEGIN
	SELECT @FK_Id = PKAlbum FROM CT_Album WITH(NOLOCK) WHERE [Name] = @FK_Album AND Available = 1; --Obtener llave de CT_Album
	IF (@FK_Id != 0)
	BEGIN
		IF NOT EXISTS (SELECT CT_Song.PKSong FROM CT_Song WITH(NOLOCK) WHERE CT_Song.[Name] = @Name AND CT_Song.FKAlbum = @FK_Id AND CT_Song.Gender = @Gender AND CT_Song.[year] = @year AND Available = 1) --Comprobar si ya existe la cancion
			BEGIN
				INSERT INTO CT_Song ([Name],FKAlbum,[year],Gender,[Length]) VALUES(@Name,@FK_Id,@year,@Gender,@Length)
				SELECT 'OK' as resultado
			END
		ELSE
			BEGIN
				SELECT 'La cancion ya existe' as resultado
			END
	END
	ELSE
		BEGIN
		  SELECT 'No se encontro album' as resultado
		END
END
GO
/****** Object:  StoredProcedure [dbo].[Up_DelAlbum]    Script Date: 26/04/2023 05:58:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Up_DelAlbum]
	@Name varchar(100),
	@FK_Artist varchar(100),
	@year int,
	@FK_Id int = 0
AS
BEGIN
	SELECT @FK_Id = PKArtist FROM CT_Artist WITH(NOLOCK) WHERE [Name] = @FK_Artist  AND Available = 1; --Obtener llave de CT_Artist
	IF (@FK_Id != 0)
	BEGIN
		IF EXISTS (SELECT CT_Album.PKAlbum FROM CT_Album WITH(NOLOCK) WHERE CT_Album.[Name] = @Name AND CT_Album.FKArtist = @FK_Id AND CT_Album.[year]  = @year AND Available = 1) --Comprobar si ya existe el album
			BEGIN
				UPDATE CT_Album SET Available = 0, LastUpdate = GETDATE() WHERE CT_Album.[Name] = @Name AND CT_Album.FKArtist = @FK_Id AND CT_Album.[year]  = @year
				SELECT 'OK' as resultado
			END
		ELSE
			BEGIN
				SELECT 'El Album no existe' as resultado
			END
	END
	ELSE
		BEGIN
		  SELECT 'No se encontro artista' as resultado
		END
END
GO
/****** Object:  StoredProcedure [dbo].[Up_DelArtist]    Script Date: 26/04/2023 05:58:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Up_DelArtist]
	@Name varchar(100),
	@Nationality varchar(100),
	@year int
AS
BEGIN
    if exists(SELECT 
		[PKArtist],
		[Name],
		[Nationality],
		[year],
		[LastUpdate],
		[Available] FROM CT_Artist A WITH(NOLOCK) WHERE A.[Name] = @Name AND A.Nationality = @Nationality AND A.[year] = @year AND Available = 1)

	BEGIN
		UPDATE  CT_Artist SET Available = 0, LastUpdate = GETDATE() WHERE [Name] = @Name AND Nationality = @Nationality AND [year] =  @year
		SELECT 
		[PKArtist],
		[Name],
		[Nationality],
		[year],
		[LastUpdate],
		[Available] FROM CT_Artist A WITH(NOLOCK) WHERE A.[Name] = @Name AND A.Nationality = @Nationality AND A.[year] = @year AND Available = 0
	END
	ELSE
	BEGIN
		SELECT -1 as resultado
	END


END
GO
/****** Object:  StoredProcedure [dbo].[Up_DelSong]    Script Date: 26/04/2023 05:58:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Up_DelSong]
	@Name varchar(100),
	@FK_Album varchar(100),
	@year int,
	@Gender varchar(100),
	@FK_Id int = 0

AS
BEGIN
	SELECT @FK_Id = PKAlbum FROM CT_Album WITH(NOLOCK) WHERE [Name] = @FK_Album AND Available = 1; --Obtener llave de CT_Album
	IF (@FK_Id != 0)
	BEGIN
		IF EXISTS (SELECT CT_Song.PKSong FROM CT_Song WITH(NOLOCK) WHERE CT_Song.[Name] = @Name AND CT_Song.FKAlbum = @FK_Id AND CT_Song.Gender = @Gender AND CT_Song.[year] = @year AND Available = 1) --Comprobar si ya existe la cancion
			BEGIN
				UPDATE CT_Song SET Available = 0, LastUpdate = GETDATE() WHERE  CT_Song.[Name] = @Name AND CT_Song.FKAlbum = @FK_Id AND CT_Song.Gender = @Gender AND CT_Song.[year] = @year AND Available = 1 --Comprobar si ya existe la cancion
				SELECT 'OK' as resultado
			END
		ELSE
			BEGIN
				SELECT 'La Cancion no existe' as resultado
			END
	END
	ELSE
		BEGIN
		  SELECT 'El Album no existe' as resultado
		END
END
GO
/****** Object:  StoredProcedure [dbo].[Up_GetALLAlbums]    Script Date: 26/04/2023 05:58:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Up_GetALLAlbums]

AS
BEGIN
	SELECT  CT_Album.[Name], CT_Artist.[Name],CT_Album.[year],CT_Album.[LastUpdate],CT_Album.[Available]  FROM CT_Album WITH(NOLOCK)
	INNER JOIN CT_Artist
	ON CT_Album.FKArtist = CT_Artist.PKArtist;
END
GO
/****** Object:  StoredProcedure [dbo].[Up_GetAllAvailableAlbum]    Script Date: 26/04/2023 05:58:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Up_GetAllAvailableAlbum]

AS
BEGIN
	SELECT  CT_Album.[Name], CT_Artist.[Name],CT_Album.[year],CT_Album.[LastUpdate],CT_Album.[Available]  FROM CT_Album WITH(NOLOCK)
	INNER JOIN CT_Artist
	ON CT_Album.FKArtist = CT_Artist.PKArtist
	WHERE CT_album.Available = 1;
END
GO
/****** Object:  StoredProcedure [dbo].[Up_GetAllAvailableArtist]    Script Date: 26/04/2023 05:58:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Up_GetAllAvailableArtist]
AS
BEGIN
	SELECT 
		[PKArtist],
		[Name],
		[Nationality],
		[year],
		[LastUpdate],
		[Available] FROM CT_Artist WITH(NOLOCK) WHERE Available = 1
END
GO
/****** Object:  StoredProcedure [dbo].[Up_GetAllAvailableSongs]    Script Date: 26/04/2023 05:58:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE[dbo].[Up_GetAllAvailableSongs]

AS
BEGIN
	 SELECT CT_Song.[PKSong]
      ,CT_Song.[FKAlbum]
      ,CT_Song.[Name]
      ,CT_Song.[year]
      ,CT_Song.[Gender]
      ,CT_Song.[Length]
      ,CT_Song.[LastUpdate]
      ,CT_Song.[Available]  FROM CT_Song WITH(NOLOCK) 
	  INNER JOIN CT_Album
	  ON CT_Song.FKAlbum = CT_Album.PKAlbum WHERE CT_Song.Available = 1;
END
GO
/****** Object:  StoredProcedure [dbo].[Up_GetAllSongs]    Script Date: 26/04/2023 05:58:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Up_GetAllSongs]

AS
BEGIN
	  SELECT CT_Song.[PKSong]
      ,CT_Song.[FKAlbum]
      ,CT_Song.[Name]
      ,CT_Song.[year]
      ,CT_Song.[Gender]
      ,CT_Song.[Length]
      ,CT_Song.[LastUpdate]
      ,CT_Song.[Available]  FROM CT_Song WITH(NOLOCK)
	INNER JOIN CT_Album
	ON CT_Song.FKAlbum = CT_Album.PKAlbum;
END
GO
/****** Object:  StoredProcedure [dbo].[Up_UpdAlbum]    Script Date: 26/04/2023 05:58:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Up_UpdAlbum]
	@Name varchar(100),
	@FK_Artist varchar(100),
	@year int,
	
	
	-- Before Variables
	@BfName varchar(100),
	@BfFK_Artist varchar(100),
	@Bfyear int,

	@FK_Id int = 0,
	@BfFK_Id int = 0

AS
BEGIN
	SELECT @BfFK_Id = PKArtist FROM CT_Artist WITH(NOLOCK) WHERE [Name] = @BfFK_Artist AND Available = 1; --Obtener llave de CT_Artist antiguo
	SELECT @FK_Id = PKArtist FROM CT_Artist WITH(NOLOCK) WHERE [Name] = @FK_Artist AND Available = 1; --Obtener llave de CT_Artist nuevo

	IF (@FK_Id != 0 AND @BfFK_Id != 0)
	BEGIN
		IF NOT EXISTS (SELECT CT_Album.PKAlbum FROM CT_Album WITH(NOLOCK) WHERE CT_Album.[Name] = @Name AND CT_Album.FKArtist = @FK_Id AND CT_Album.[year]  = @year AND Available = 1) --Comprobar si ya existe el album
			BEGIN
				UPDATE CT_Album SET CT_Album.[Name] = @Name, CT_Album.FKArtist = @FK_Id, CT_Album.[year] = @year, LastUpdate = GETDATE() WHERE CT_Album.[Name] = @BfName AND CT_Album.FKArtist = @BfFK_Id AND CT_Album.[year]  = @Bfyear
				SELECT 'OK' as resultado
			END
		ELSE
			BEGIN
				SELECT 'El Album ya existe' as resultado
			END
	END
	ELSE
		BEGIN
		  SELECT 'No se encontro artista nuevo o antiguo' as resultado
		END

END
GO
/****** Object:  StoredProcedure [dbo].[Up_UpdArtist]    Script Date: 26/04/2023 05:58:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Up_UpdArtist]

	@BfName varchar(100),
	@BfNationality varchar(100),
	@Bfyear int,

	@Name varchar(100),
	@Nationality varchar(100),
	@year int




AS
BEGIN

	if exists(SELECT 
		[PKArtist],
		[Name],
		[Nationality],
		[year],
		[LastUpdate],
		[Available] FROM CT_Artist A WITH(NOLOCK) WHERE A.[Name] = @BfName AND A.Nationality = @BfNationality AND A.[year] = @Bfyear AND Available = 1)
	BEGIN
		if NOT exists(SELECT 
			[PKArtist],
			[Name],
			[Nationality],
			[year],
			[LastUpdate],
			[Available] FROM CT_Artist A WITH(NOLOCK) WHERE A.[Name] = @Name AND A.Nationality = @Nationality AND A.[year] = @year AND Available = 1)
		BEGIN
				UPDATE  CT_Artist SET [Name] = @Name, Nationality = @Nationality, [year] =  @year, LastUpdate = GETDATE() WHERE [Name] = @BfName AND Nationality =  @BfNationality AND [year] =  @Bfyear

				SELECT 
				[PKArtist],
				[Name],
				[Nationality],
				[year],
				[LastUpdate],
				[Available] FROM CT_Artist A WITH(NOLOCK) WHERE A.[Name] = @Name AND A.Nationality = @Nationality AND A.[year] = @year AND Available = 1
		END
		ELSE
		BEGIN
				SELECT 'Los Datos a Actualizar ya existen' as resultado
		END


	END
	ELSE
	BEGIN
		SELECT 'No se encontro el Artista' as resultado
	END
END
GO
/****** Object:  StoredProcedure [dbo].[Up_UpdSong]    Script Date: 26/04/2023 05:58:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Up_UpdSong]
	@Name varchar(100),
	@FK_Album varchar(100),
	@year int,
	@Gender varchar(100),
	@Length varchar(100),

	@BfName varchar(100),
	@BfFK_Album varchar(100),
	@Bfyear int,
	@BfGender varchar(100),
	@BfLength varchar(100),

	@FK_Id int = 0,
	@BfFK_Id int = 0

AS
BEGIN

	SELECT @BfFK_Id = PKAlbum FROM CT_Album WITH(NOLOCK) WHERE [Name] = @BfFK_Album AND Available = 1; --Obtener llave de CT_Album antiguo
	SELECT @FK_Id = PKAlbum FROM CT_Album WITH(NOLOCK) WHERE [Name] = @FK_Album AND Available = 1; --Obtener llave de CT_Album antiguo

	IF (@FK_Id != 0 AND @BfFK_Id != 0)
	BEGIN
		IF NOT EXISTS (SELECT CT_Song.PKSong FROM CT_Song WITH(NOLOCK) WHERE CT_Song.[Name] = @Name AND CT_Song.FKAlbum = @FK_Id AND CT_Song.[year]  = @year AND CT_Song.[Gender] = @Gender AND  Available = 1) --Comprobar si ya existe el album
			BEGIN
				UPDATE CT_Song SET CT_Song.[Name] = @Name, CT_Song.FKAlbum = @FK_Id, CT_Song.[year] = @year, CT_Song.Gender = @Gender, CT_Song.[Length] = @Length,  LastUpdate = GETDATE() WHERE CT_Song.[Name] = @BfName AND CT_Song.FKAlbum = @BfFK_Id AND CT_Song.[year]  = @Bfyear AND CT_Song.Gender = @BfGender AND CT_Song.[Length] = @BfLength AND CT_Song.Available = 1
				SELECT 'Ok' as resultado
			END
		ELSE
			BEGIN
				SELECT 'La cancion ya existe' as resultado
			END
	END
	ELSE
		BEGIN
		  SELECT 'No se encontro Album nuevo o antiguo' as resultado
		END


END
GO
USE [master]
GO
ALTER DATABASE [gamaMusic] SET  READ_WRITE 
GO
