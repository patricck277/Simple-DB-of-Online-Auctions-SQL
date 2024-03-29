USE [master]
GO
/****** Object:  Database [AukcjeInternetowe]    Script Date: 09.02.2024 13:48:59 ******/
CREATE DATABASE [AukcjeInternetowe]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AukcjeInternetowe', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\AukcjeInternetowe.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AukcjeInternetowe_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\AukcjeInternetowe_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [AukcjeInternetowe] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AukcjeInternetowe].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AukcjeInternetowe] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AukcjeInternetowe] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AukcjeInternetowe] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AukcjeInternetowe] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AukcjeInternetowe] SET ARITHABORT OFF 
GO
ALTER DATABASE [AukcjeInternetowe] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AukcjeInternetowe] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AukcjeInternetowe] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AukcjeInternetowe] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AukcjeInternetowe] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AukcjeInternetowe] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AukcjeInternetowe] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AukcjeInternetowe] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AukcjeInternetowe] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AukcjeInternetowe] SET  ENABLE_BROKER 
GO
ALTER DATABASE [AukcjeInternetowe] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AukcjeInternetowe] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AukcjeInternetowe] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AukcjeInternetowe] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AukcjeInternetowe] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AukcjeInternetowe] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AukcjeInternetowe] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AukcjeInternetowe] SET RECOVERY FULL 
GO
ALTER DATABASE [AukcjeInternetowe] SET  MULTI_USER 
GO
ALTER DATABASE [AukcjeInternetowe] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AukcjeInternetowe] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AukcjeInternetowe] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AukcjeInternetowe] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AukcjeInternetowe] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AukcjeInternetowe] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'AukcjeInternetowe', N'ON'
GO
ALTER DATABASE [AukcjeInternetowe] SET QUERY_STORE = ON
GO
ALTER DATABASE [AukcjeInternetowe] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [AukcjeInternetowe]
GO
/****** Object:  Table [dbo].[Przedmioty]    Script Date: 09.02.2024 13:48:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Przedmioty](
	[PrzedmiotID] [int] IDENTITY(1,1) NOT NULL,
	[Nazwa] [nvarchar](100) NOT NULL,
	[Opis] [text] NULL,
	[Kategoria] [nvarchar](50) NOT NULL,
	[CenaWywolawcza] [decimal](10, 2) NULL,
	[UserID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PrzedmiotID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Aukcje]    Script Date: 09.02.2024 13:48:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aukcje](
	[AukcjaID] [int] IDENTITY(1,1) NOT NULL,
	[PrzedmiotID] [int] NULL,
	[DataRozpoczecia] [datetime] NOT NULL,
	[DataZakonczenia] [datetime] NOT NULL,
	[CenaKupTeraz] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[AukcjaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Oferty]    Script Date: 09.02.2024 13:48:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Oferty](
	[OfertaID] [int] IDENTITY(1,1) NOT NULL,
	[AukcjaID] [int] NULL,
	[UserID] [int] NULL,
	[Kwota] [decimal](10, 2) NOT NULL,
	[DataOferty] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OfertaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[AktywneAukcje]    Script Date: 09.02.2024 13:48:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* Tworzenie widoku AktywneAukcje*/
CREATE VIEW [dbo].[AktywneAukcje]
AS
SELECT        a.AukcjaID, p.Nazwa, p.CenaWywolawcza, ISNULL(MAX(o.Kwota), p.CenaWywolawcza) AS NajwyzszaOferta
FROM            dbo.Aukcje AS a INNER JOIN
                         dbo.Przedmioty AS p ON a.PrzedmiotID = p.PrzedmiotID LEFT OUTER JOIN
                         dbo.Oferty AS o ON a.AukcjaID = o.AukcjaID
WHERE        (a.DataZakonczenia > GETDATE())
GROUP BY a.AukcjaID, p.Nazwa, p.CenaWywolawcza
GO
/****** Object:  Table [dbo].[Uzytkownicy]    Script Date: 09.02.2024 13:48:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Uzytkownicy](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[NazwaUzytkownika] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[Haslo] [nvarchar](255) NOT NULL,
	[DataRejestracji] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[HistoriaUzytkownika]    Script Date: 09.02.2024 13:48:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* Tworzenie widoku HistoriaUzytkownika*/
CREATE VIEW [dbo].[HistoriaUzytkownika]
AS
SELECT        u.NazwaUzytkownika, p.Nazwa AS NazwaPrzedmiotu, o.Kwota, o.DataOferty
FROM            dbo.Oferty AS o INNER JOIN
                         dbo.Uzytkownicy AS u ON o.UserID = u.UserID INNER JOIN
                         dbo.Aukcje AS a ON o.AukcjaID = a.AukcjaID INNER JOIN
                         dbo.Przedmioty AS p ON a.PrzedmiotID = p.PrzedmiotID
GO
/****** Object:  UserDefinedFunction [dbo].[WyszukajAukcjePoKategorii]    Script Date: 09.02.2024 13:48:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   FUNCTION [dbo].[WyszukajAukcjePoKategorii] (@Kategoria NVARCHAR(50))
RETURNS TABLE
AS
RETURN
(
    SELECT a.AukcjaID, p.Nazwa, p.Opis, a.DataRozpoczecia, a.DataZakonczenia
    FROM Aukcje a
    INNER JOIN Przedmioty p ON a.PrzedmiotID = p.PrzedmiotID
    WHERE p.Kategoria = @Kategoria AND a.DataZakonczenia > GETDATE()
);
GO
ALTER TABLE [dbo].[Aukcje]  WITH CHECK ADD  CONSTRAINT [FK_PrzedmiotID] FOREIGN KEY([PrzedmiotID])
REFERENCES [dbo].[Przedmioty] ([PrzedmiotID])
GO
ALTER TABLE [dbo].[Aukcje] CHECK CONSTRAINT [FK_PrzedmiotID]
GO
ALTER TABLE [dbo].[Oferty]  WITH CHECK ADD  CONSTRAINT [FK_Oferty_AukcjaID] FOREIGN KEY([AukcjaID])
REFERENCES [dbo].[Aukcje] ([AukcjaID])
GO
ALTER TABLE [dbo].[Oferty] CHECK CONSTRAINT [FK_Oferty_AukcjaID]
GO
ALTER TABLE [dbo].[Oferty]  WITH CHECK ADD  CONSTRAINT [FK_Oferty_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[Uzytkownicy] ([UserID])
GO
ALTER TABLE [dbo].[Oferty] CHECK CONSTRAINT [FK_Oferty_UserID]
GO
ALTER TABLE [dbo].[Przedmioty]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Uzytkownicy] ([UserID])
GO
ALTER TABLE [dbo].[Aukcje]  WITH CHECK ADD  CONSTRAINT [CHK_Aukcje_Data] CHECK  (([DataZakonczenia]>[DataRozpoczecia]))
GO
ALTER TABLE [dbo].[Aukcje] CHECK CONSTRAINT [CHK_Aukcje_Data]
GO
ALTER TABLE [dbo].[Przedmioty]  WITH CHECK ADD CHECK  (([CenaWywolawcza]>(0)))
GO
/****** Object:  StoredProcedure [dbo].[ZlozOferte]    Script Date: 09.02.2024 13:48:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[ZlozOferte]
    @AukcjaID INT,
    @UserID INT,
    @Kwota DECIMAL(10,2)
AS
BEGIN
    DECLARE @AktualnaNajwyzszaOferta DECIMAL(10,2);
    SELECT @AktualnaNajwyzszaOferta = MAX(Kwota) FROM Oferty WHERE AukcjaID = @AukcjaID;

    IF @Kwota > ISNULL(@AktualnaNajwyzszaOferta, 0)
    BEGIN
        INSERT INTO Oferty (AukcjaID, UserID, Kwota, DataOferty)
        VALUES (@AukcjaID, @UserID, @Kwota, GETDATE());
    END
    ELSE
    BEGIN
        RAISERROR ('Twoja oferta musi być wyższa niż aktualna najwyższa oferta.', 16, 1);
    END
END;
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "a"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 181
               Right = 230
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "p"
            Begin Extent = 
               Top = 201
               Left = 266
               Bottom = 375
               Right = 479
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "o"
            Begin Extent = 
               Top = 0
               Left = 417
               Bottom = 157
               Right = 608
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'AktywneAukcje'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'AktywneAukcje'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "o"
            Begin Extent = 
               Top = 36
               Left = 255
               Bottom = 166
               Right = 425
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "u"
            Begin Extent = 
               Top = 72
               Left = 569
               Bottom = 202
               Right = 760
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "a"
            Begin Extent = 
               Top = 220
               Left = 47
               Bottom = 350
               Right = 226
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "p"
            Begin Extent = 
               Top = 229
               Left = 394
               Bottom = 359
               Right = 578
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'HistoriaUzytkownika'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'HistoriaUzytkownika'
GO
USE [master]
GO
ALTER DATABASE [AukcjeInternetowe] SET  READ_WRITE 
GO
