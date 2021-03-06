USE [master]
GO
/****** Object:  Database [totodb]    Script Date: 31-May-19 6:17:22 PM ******/
CREATE DATABASE [totodb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'totodb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.HOAIHUYLE\MSSQL\DATA\totodb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'totodb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.HOAIHUYLE\MSSQL\DATA\totodb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [totodb] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [totodb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [totodb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [totodb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [totodb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [totodb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [totodb] SET ARITHABORT OFF 
GO
ALTER DATABASE [totodb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [totodb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [totodb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [totodb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [totodb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [totodb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [totodb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [totodb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [totodb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [totodb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [totodb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [totodb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [totodb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [totodb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [totodb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [totodb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [totodb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [totodb] SET RECOVERY FULL 
GO
ALTER DATABASE [totodb] SET  MULTI_USER 
GO
ALTER DATABASE [totodb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [totodb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [totodb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [totodb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [totodb] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'totodb', N'ON'
GO
ALTER DATABASE [totodb] SET QUERY_STORE = OFF
GO
USE [totodb]
GO
USE [totodb]
GO
/****** Object:  Sequence [dbo].[HOADON_Seq]    Script Date: 31-May-19 6:17:23 PM ******/
CREATE SEQUENCE [dbo].[HOADON_Seq] 
 AS [int]
 START WITH 1
 INCREMENT BY 1
 MINVALUE -2147483648
 MAXVALUE 2147483647
 CACHE 
GO
/****** Object:  Table [dbo].[Ban]    Script Date: 31-May-19 6:17:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ban](
	[MaBan] [int] IDENTITY(1,1) NOT NULL,
	[TinhTrang] [int] NOT NULL,
	[BanGop] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaBan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietPDM]    Script Date: 31-May-19 6:17:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietPDM](
	[MaPDM] [char](12) NOT NULL,
	[MaMon] [int] NOT NULL,
	[Soluong] [smallint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 31-May-19 6:17:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHD] [char](12) NOT NULL,
	[MaPDM] [char](12) NOT NULL,
	[LapHD] [smalldatetime] NOT NULL,
	[MaNV] [char](10) NOT NULL,
	[TinhTrang] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiMon]    Script Date: 31-May-19 6:17:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiMon](
	[MaLoaiMon] [int] IDENTITY(1,1) NOT NULL,
	[TenLoaiMon] [nvarchar](50) NOT NULL,
	[Mota] [nvarchar](50) NULL,
	[TinhTrang] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLoaiMon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mon]    Script Date: 31-May-19 6:17:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mon](
	[MaMon] [int] IDENTITY(1,1) NOT NULL,
	[MaLoaiMon] [int] NOT NULL,
	[TenMon] [nvarchar](50) NOT NULL,
	[Gia] [float] NULL,
	[Mota] [nvarchar](500) NULL,
	[TinhTrang] [bit] NOT NULL,
 CONSTRAINT [PK__Mon__3A5B29A8E60E7C15] PRIMARY KEY CLUSTERED 
(
	[MaMon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 31-May-19 6:17:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [char](10) NOT NULL,
	[TenNV] [nvarchar](50) NOT NULL,
	[NamSinh] [smalldatetime] NULL,
	[GioiTinh] [bit] NULL,
	[SDT] [nvarchar](10) NOT NULL,
	[NgayLap] [smalldatetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[SDT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhieuDatMon]    Script Date: 31-May-19 6:17:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuDatMon](
	[MaPDM] [char](12) NOT NULL,
	[NgayLap] [smalldatetime] NOT NULL,
	[MaNV] [char](10) NOT NULL,
	[MaBan] [int] NULL,
	[TinhTrang] [bit] NOT NULL,
	[ThanhTien] [int] NULL,
	[GiamGia] [float] NULL,
	[PhuThu] [float] NULL,
	[MangVe] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPDM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 31-May-19 6:17:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[MaTaiKhoan] [varchar](50) NOT NULL,
	[MatKhau] [nvarchar](100) NOT NULL,
	[CapDo] [int] NOT NULL,
	[MaNV] [char](10) NOT NULL,
 CONSTRAINT [PK_TaiKhoan] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Ban] ADD  DEFAULT ((0)) FOR [TinhTrang]
GO
ALTER TABLE [dbo].[HoaDon] ADD  DEFAULT (getdate()) FOR [LapHD]
GO
ALTER TABLE [dbo].[HoaDon] ADD  CONSTRAINT [DF_HoaDon_TinhTrang]  DEFAULT ((1)) FOR [TinhTrang]
GO
ALTER TABLE [dbo].[LoaiMon] ADD  CONSTRAINT [DF_LoaiMon_TinhTrang]  DEFAULT ((1)) FOR [TinhTrang]
GO
ALTER TABLE [dbo].[Mon] ADD  CONSTRAINT [DF_Mon_Gia]  DEFAULT ((0)) FOR [Gia]
GO
ALTER TABLE [dbo].[Mon] ADD  CONSTRAINT [DF_Mon_TinhTrang]  DEFAULT ((1)) FOR [TinhTrang]
GO
ALTER TABLE [dbo].[NhanVien] ADD  DEFAULT (getdate()) FOR [NgayLap]
GO
ALTER TABLE [dbo].[PhieuDatMon] ADD  CONSTRAINT [DF_PhieuDatMon_NgayLap]  DEFAULT (getdate()) FOR [NgayLap]
GO
ALTER TABLE [dbo].[PhieuDatMon] ADD  CONSTRAINT [DF_PhieuDatMon_TinhTrang]  DEFAULT ((1)) FOR [TinhTrang]
GO
ALTER TABLE [dbo].[PhieuDatMon] ADD  DEFAULT ((1)) FOR [MangVe]
GO
ALTER TABLE [dbo].[TaiKhoan] ADD  DEFAULT ((0)) FOR [CapDo]
GO
ALTER TABLE [dbo].[ChiTietPDM]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietPDM_Mon1] FOREIGN KEY([MaMon])
REFERENCES [dbo].[Mon] ([MaMon])
GO
ALTER TABLE [dbo].[ChiTietPDM] CHECK CONSTRAINT [FK_ChiTietPDM_Mon1]
GO
ALTER TABLE [dbo].[ChiTietPDM]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietPDM_PhieuDatMon] FOREIGN KEY([MaPDM])
REFERENCES [dbo].[PhieuDatMon] ([MaPDM])
GO
ALTER TABLE [dbo].[ChiTietPDM] CHECK CONSTRAINT [FK_ChiTietPDM_PhieuDatMon]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_NhanVien]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_PhieuDatMon] FOREIGN KEY([MaPDM])
REFERENCES [dbo].[PhieuDatMon] ([MaPDM])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_PhieuDatMon]
GO
ALTER TABLE [dbo].[Mon]  WITH CHECK ADD  CONSTRAINT [FK_Mon_LoaiMon1] FOREIGN KEY([MaLoaiMon])
REFERENCES [dbo].[LoaiMon] ([MaLoaiMon])
GO
ALTER TABLE [dbo].[Mon] CHECK CONSTRAINT [FK_Mon_LoaiMon1]
GO
ALTER TABLE [dbo].[PhieuDatMon]  WITH CHECK ADD  CONSTRAINT [FK_BanInPhieuDatMon] FOREIGN KEY([MaBan])
REFERENCES [dbo].[Ban] ([MaBan])
GO
ALTER TABLE [dbo].[PhieuDatMon] CHECK CONSTRAINT [FK_BanInPhieuDatMon]
GO
ALTER TABLE [dbo].[PhieuDatMon]  WITH CHECK ADD  CONSTRAINT [FK_NhanVienOrderPhieuDatMon] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[PhieuDatMon] CHECK CONSTRAINT [FK_NhanVienOrderPhieuDatMon]
GO
ALTER TABLE [dbo].[TaiKhoan]  WITH CHECK ADD  CONSTRAINT [FK_TaiKhoanNhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[TaiKhoan] CHECK CONSTRAINT [FK_TaiKhoanNhanVien]
GO
/****** Object:  StoredProcedure [dbo].[Ban_ChonAll]    Script Date: 31-May-19 6:17:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Ban_ChonAll]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [MaBan]
      ,[TinhTrang]
      ,[BanGop]
  FROM [dbo].[Ban]
END
GO
/****** Object:  StoredProcedure [dbo].[Ban_ChonTai]    Script Date: 31-May-19 6:17:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Ban_ChonTai]
	-- Add the parameters for the stored procedure here
	(@MaBan int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [MaBan]
      ,[TinhTrang]
      ,[BanGop]
  FROM [dbo].[Ban]
  WHERE [MaBan]=@MaBan;
END
GO
/****** Object:  StoredProcedure [dbo].[Ban_Count]    Script Date: 31-May-19 6:17:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Ban_Count]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT        COUNT(MaBan) AS TongBan
FROM            dbo.Ban
END
GO
/****** Object:  StoredProcedure [dbo].[Ban_Sua]    Script Date: 31-May-19 6:17:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Ban_Sua]
	-- Add the parameters for the stored procedure here
	(@MaBan int ,@TinhTrang int, @BanGop int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [dbo].[Ban] SET [TinhTrang] = @TinhTrang,[BanGop] = @BanGop WHERE [MaBan]= @MaBan

END
GO
/****** Object:  StoredProcedure [dbo].[Ban_Them]    Script Date: 31-May-19 6:17:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Ban_Them]
	-- Add the parameters for the stored procedure here
	(@TinhTrang int, @BanGop int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[Ban]
           ([TinhTrang]
           ,[BanGop])
     VALUES
           (@TinhTrang, @BanGop)
END
GO
/****** Object:  StoredProcedure [dbo].[Ban_Xoa]    Script Date: 31-May-19 6:17:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Ban_Xoa]
	-- Add the parameters for the stored procedure here
	(@MaBan int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM [dbo].[Ban]
      WHERE [MaBan]= @MaBan
END
GO
/****** Object:  StoredProcedure [dbo].[ChiTietPDM_ChonAll]    Script Date: 31-May-19 6:17:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ChiTietPDM_ChonAll]
	-- Add the parameters for the stored procedure here
	--(@MaPDM int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [MaPDM]
      ,[MaMon]
      ,[Soluong]
  FROM [dbo].[ChiTietPDM]
  --WHERE [MaPDM] = @MaPDM
END
GO
/****** Object:  StoredProcedure [dbo].[ChiTietPDM_ChonTai]    Script Date: 31-May-19 6:17:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ChiTietPDM_ChonTai]
	-- Add the parameters for the stored procedure here
	(@MaPDM char(12))
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT        TOP (1000) MaMon, Soluong
FROM            dbo.ChiTietPDM
WHERE        (MaPDM = @MaPDM)

END
GO
/****** Object:  StoredProcedure [dbo].[ChiTietPDM_ChonTai_Mon]    Script Date: 31-May-19 6:17:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ChiTietPDM_ChonTai_Mon]
	-- Add the parameters for the stored procedure here
	(@MaMon int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT        TOP (1000) MaMon, Soluong
FROM            dbo.ChiTietPDM
WHERE        (MaMon = @MaMon)

END
GO
/****** Object:  StoredProcedure [dbo].[ChiTietPDM_Sua]    Script Date: 31-May-19 6:17:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ChiTietPDM_Sua]
	-- Add the parameters for the stored procedure here
	(@MaPDM char(12),
           @MaMon int,
           @SL smallint)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [dbo].[ChiTietPDM]
	   SET [Soluong] = @SL
	 WHERE [MaMon]=@MaMon AND [MaPDM]=@MaPDM
END
GO
/****** Object:  StoredProcedure [dbo].[ChiTietPDM_Them]    Script Date: 31-May-19 6:17:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ChiTietPDM_Them]
	-- Add the parameters for the stored procedure here
	(@MaPDM char(12),
           @MaMon int,
		   @SL int
           )
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[ChiTietPDM]
           ([MaPDM]
           ,[MaMon]
		   ,[Soluong]
           )
     VALUES
           (@MaPDM,@MaMon,@SL)
END
GO
/****** Object:  StoredProcedure [dbo].[ChiTietPDM_Xoa]    Script Date: 31-May-19 6:17:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ChiTietPDM_Xoa]
	-- Add the parameters for the stored procedure here
	(@MaPDM char(12))
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM [dbo].[ChiTietPDM]
	WHERE [MaPDM] = @MaPDM
END
GO
/****** Object:  StoredProcedure [dbo].[ChiTietPDM_XoaTai]    Script Date: 31-May-19 6:17:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ChiTietPDM_XoaTai]
	-- Add the parameters for the stored procedure here
	(@MaPDM char(12),@MaMon int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM [dbo].[ChiTietPDM]
	WHERE [MaPDM] = @MaPDM AND [MaMon] = @MaMon
END
GO
/****** Object:  StoredProcedure [dbo].[HoaDon_Them]    Script Date: 31-May-19 6:17:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[HoaDon_Them]
		(@MaPDM char(12) ,@MaNV char(10))
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
		DECLARE @MaID char(12);
		DECLARE @DATE char(6);
		DECLARE @NOW char(6);
		DECLARE @ID int;
		--Lấy thời gian  hiện tại
		SELECT @NOW = (select substring(CONVERT(VARCHAR(10),GETDATE(),103),1,2) + substring(CONVERT(VARCHAR(10),GETDATE(),103),4,2) +
		RIGHT(substring(CONVERT(VARCHAR(10),GETDATE(),103),7,4),2));
		--Lấy thời gian cao nhất trong hệ thống
		SET @DATE= SUBSTRING((SELECT MAX(MaHD) FROM dbo.HoaDon),4,6);
		if(@DATE = @NOW)
		BEGIN
		 SET @MaID=RIGHT((SELECT MAX(MaHD) FROM dbo.HoaDon),2);
		END
		else
		SET @MaID=0;

		SET @ID=CAST(@MaID as int) + 1;
		if(@ID<10)
		SET @MaID='MHD'+@NOW+'00'+Convert(char(2),@ID);
		else
		BEGIN
		IF (@ID<100)
		SET @MaID='MHD'+@NOW+'0'+Convert(char(2),@ID);
		ELSE 
		SET @MaID='MHD'+@NOW+Convert(char(2),@ID);
		END

    -- Insert statements for procedure here
	INSERT INTO [dbo].[HoaDon]
           ([MaHD]
		   ,[MaPDM]
		   ,[MaNV])
     VALUES
           (@MaID,@MaPDM,@MaNV)
END
GO
/****** Object:  StoredProcedure [dbo].[LoaiMon_ChonAll]    Script Date: 31-May-19 6:17:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[LoaiMon_ChonAll]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [MaLoaiMon]
      ,[TenLoaiMon]
      ,[Mota]
      ,[TinhTrang]
  FROM [dbo].[LoaiMon]
  WHERE TinhTrang<>0
END
GO
/****** Object:  StoredProcedure [dbo].[LoaiMon_ChonTai]    Script Date: 31-May-19 6:17:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[LoaiMon_ChonTai]
	-- Add the parameters for the stored procedure here
	(@MaLoaiMon int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [MaLoaiMon]
      ,[TenLoaiMon]
      ,[Mota]
      ,[TinhTrang]
  FROM [totodb].[dbo].[LoaiMon]
  WHERE [MaLoaiMon] = @MaLoaiMon
END
GO
/****** Object:  StoredProcedure [dbo].[LoaiMon_Them]    Script Date: 31-May-19 6:17:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[LoaiMon_Them]
	-- Add the parameters for the stored procedure here
	@TenLoaiMon nvarchar(50)
           ,@Mota nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO [dbo].[LoaiMon]
           ([TenLoaiMon]
           ,[Mota])
          
     VALUES
           (@TenLoaiMon
           ,@Mota)
END
GO
/****** Object:  StoredProcedure [dbo].[LoaiMon_Xoa]    Script Date: 31-May-19 6:17:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[LoaiMon_Xoa]
	-- Add the parameters for the stored procedure here
	(@MaLoaiMon int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	 DELETE FROM [dbo].[LoaiMon]
	 WHERE [MaLoaiMon] = @MaLoaiMon

	 DECLARE @ID int;
	 SET @ID = @MaLoaiMon -1;

	 IF(@ID < (SELECT MAX(MaLoaiMon) FROM [dbo].[LoaiMon])) 
		BEGIN
			--Tạo bang tạm
			CREATE TABLE #TempLoaiMonTable(
			TenLoaiMon nvarchar(50)
			,Mota nvarchar(50)
			,TinhTrang bit);

			INSERT INTO #TempLoaiMonTable (TenLoaiMon, Mota, TinhTrang) 
			SELECT TenLoaiMon, Mota, TinhTrang
			FROM LoaiMon
			WHERE MaLoaiMon>@ID;

			DELETE FROM [dbo].[LoaiMon]
			WHERE [MaLoaiMon] >@ID;

			DBCC CHECKIDENT ('LoaiMon', RESEED, @ID);

			INSERT INTO LoaiMon(TenLoaiMon, Mota, TinhTrang) 
			SELECT TenLoaiMon, Mota, TinhTrang 
			FROM #TempLoaiMonTable;

			DROP TABLE #TempLoaiMonTable;
		END
END
GO
/****** Object:  StoredProcedure [dbo].[Mon_CapNhap]    Script Date: 31-May-19 6:17:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Mon_CapNhap]
	-- Add the parameters for the stored procedure here
(@MaLoaiMon int, @MaMon int, @TenMon nvarchar(50)
           ,@Gia float
           ,@Mota nvarchar(200)
           ,@TinhTrang bit)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [dbo].[Mon]
   SET [MaLoaiMon] = @MaLoaiMon
		,[TenMon] = @TenMon
      ,[Gia] = @Gia
      ,[Mota] = @Mota
      ,[TinhTrang] = @TinhTrang
 WHERE [MaMon]=@MaMon


END
GO
/****** Object:  StoredProcedure [dbo].[Mon_ChonAll]    Script Date: 31-May-19 6:17:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Mon_ChonAll]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [MaMon]
	,[MaLoaiMon]
      ,[TenMon]
      ,[Gia]
      ,[Mota]
      ,[TinhTrang]
  FROM [dbo].[Mon]
  --WHERE [MaMon] = @MaMon
END
GO
/****** Object:  StoredProcedure [dbo].[Mon_ChonAll_where_LoaiMon]    Script Date: 31-May-19 6:17:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Mon_ChonAll_where_LoaiMon]
	-- Add the parameters for the stored procedure here
	(@MaLoaiMon int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT       MaMon , TenMon, Gia
FROM            dbo.Mon
WHERE        (MaLoaiMon = @MaLoaiMon) AND TinhTrang<>0
END
GO
/****** Object:  StoredProcedure [dbo].[Mon_ChonAll_where_LoaiMon_ADMIN]    Script Date: 31-May-19 6:17:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Mon_ChonAll_where_LoaiMon_ADMIN]
	-- Add the parameters for the stored procedure here
	(@MaLoaiMon int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT TOP (1000) [MaMon]
      ,[MaLoaiMon]
      ,[TenMon]
      ,[Gia]
      ,[Mota]
      ,[TinhTrang]
FROM            dbo.Mon
WHERE        (MaLoaiMon = @MaLoaiMon) AND TinhTrang<>0
END
GO
/****** Object:  StoredProcedure [dbo].[Mon_ChonTai]    Script Date: 31-May-19 6:17:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Mon_ChonTai]
	-- Add the parameters for the stored procedure here
	(@MaMon int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [MaMon]
      ,[TenMon]
      ,[Gia]
      ,[Mota]
      ,[TinhTrang]
  FROM [dbo].[Mon]
  WHERE [MaMon] = @MaMon
END
GO
/****** Object:  StoredProcedure [dbo].[Mon_Search]    Script Date: 31-May-19 6:17:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Mon_Search]
	-- Add the parameters for the stored procedure here
	(@Str nvarchar(100))
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT TOP (1000) [MaMon]
      ,[MaLoaiMon]
      ,[TenMon]
      ,[Gia]
      ,[Mota]
      ,[TinhTrang]
FROM            dbo.Mon
WHERE       [TenMon] LIKE N'%'+@Str+N'%'
END
GO
/****** Object:  StoredProcedure [dbo].[Mon_Them]    Script Date: 31-May-19 6:17:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Mon_Them]
	-- Add the parameters for the stored procedure here
	(@MaLoaiMon int
	,@TenMon varchar(10)
           ,@Gia float
           ,@Mota varchar(50))
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[Mon]
           ([MaLoaiMon]
           ,[TenMon]
           ,[Gia]
           ,[Mota]
           )
     VALUES
           (@MaLoaiMon,@TenMon,@Gia,@Mota)
END
GO
/****** Object:  StoredProcedure [dbo].[Mon_Xoa]    Script Date: 31-May-19 6:17:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Mon_Xoa]
	-- Add the parameters for the stored procedure here
	(@MaMon int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM [dbo].[Mon]
	WHERE [MaMon] = @MaMon
	 DECLARE @ID int;
	 SET @ID = @MaMon -1;

	 IF(@ID < (SELECT MAX(@MaMon) FROM [dbo].Mon)) 
		BEGIN
			--Tạo bang tạm
			CREATE TABLE #TempMonTable(
			TenMon nvarchar(50)
			,Gia float
			,Mota nvarchar(50)
			,TinhTrang bit);

			INSERT INTO #TempMonTable (TenMon, Gia, Mota, TinhTrang) 
			SELECT TenMon, Gia, Mota, TinhTrang
			FROM Mon
			WHERE MaMon>@ID;

			DELETE FROM [dbo].[Mon]
			WHERE [MaMon] >@ID;

			DBCC CHECKIDENT ('Mon', RESEED, @ID);

			INSERT INTO Mon(TenMon, Gia,Mota, TinhTrang) 
			SELECT TenMon, Gia, Mota, TinhTrang 
			FROM #TempMonTable;

			DROP TABLE #TempLoaiMonTable;
		END
END
GO
/****** Object:  StoredProcedure [dbo].[NhanVien_ChonAll]    Script Date: 31-May-19 6:17:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NhanVien_ChonAll]
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT        dbo.NhanVien.MaNV, dbo.NhanVien.TenNV, dbo.NhanVien.NamSinh, dbo.NhanVien.GioiTinh, dbo.NhanVien.SDT, dbo.NhanVien.NgayLap, dbo.TaiKhoan.MaTaiKhoan, dbo.TaiKhoan.MatKhau, dbo.TaiKhoan.CapDo
FROM            dbo.NhanVien INNER JOIN
                         dbo.TaiKhoan ON dbo.NhanVien.MaNV = dbo.TaiKhoan.MaNV
  --WHERE [MaMon] = @MaMon
END
GO
/****** Object:  StoredProcedure [dbo].[NhanVien_ChonTai]    Script Date: 31-May-19 6:17:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[NhanVien_ChonTai]
	-- Add the parameters for the stored procedure here
	(@MaNV char(10))
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [MaNV]
      ,[TenNV]
      ,[NamSinh]
      ,[GioiTinh]
      ,[SDT]
	  ,[NgayLap]
  FROM [dbo].[NhanVien]
  WHERE [MaNV] = @MaNV
END
GO
/****** Object:  StoredProcedure [dbo].[NhanVien_DemPDM]    Script Date: 31-May-19 6:17:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[NhanVien_DemPDM]
	-- Add the parameters for the stored procedure here
	(@MaNV char(10))
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT        dbo.NhanVien.MaNV, COUNT(dbo.NhanVien.MaNV) AS SoNhanVien
	FROM            dbo.NhanVien INNER JOIN
							 dbo.PhieuDatMon ON dbo.NhanVien.MaNV = dbo.PhieuDatMon.MaNV
	GROUP BY dbo.NhanVien.MaNV
	HAVING        (dbo.NhanVien.MaNV = @MaNV)
END
GO
/****** Object:  StoredProcedure [dbo].[NhanVien_Sua]    Script Date: 31-May-19 6:17:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[NhanVien_Sua]
	-- Add the parameters for the stored procedure here
	(@MaNV  char(10)
           ,@TenNV nvarchar(50)
           ,@NamSinh smalldatetime
           ,@GioiTinh bit
           ,@SoDienThoai nvarchar(10))
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [dbo].[NhanVien]
   SET [MaNV] = @MaNV
      ,[TenNV] = @TenNV
      ,[NamSinh] = @NamSinh
      ,[GioiTinh] = @GioiTinh
      ,[SDT] = @SoDienThoai
 WHERE [MaNV] = @MaNV
END
GO
/****** Object:  StoredProcedure [dbo].[NhanVien_Sua_TaiKhoan]    Script Date: 31-May-19 6:17:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[NhanVien_Sua_TaiKhoan]
	-- Add the parameters for the stored procedure here
	(@MaNV  char(10)
           ,@TenNV nvarchar(50)
           ,@NamSinh smalldatetime
           ,@GioiTinh bit
           ,@SoDienThoai nvarchar(10)
		   ,@MaTaiKhoan varchar(50)
		   ,@CapDo int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [dbo].[NhanVien]
   SET [MaNV] = @MaNV
      ,[TenNV] = @TenNV
      ,[NamSinh] = @NamSinh
      ,[GioiTinh] = @GioiTinh
      ,[SDT] = @SoDienThoai
 WHERE [MaNV] = @MaNV;
	UPDATE [dbo].[TaiKhoan]
   SET [MaTaiKhoan] = @MaTaiKhoan
      ,[CapDo] = @CapDo
 WHERE [MaNV] = @MaNV;
END
GO
/****** Object:  StoredProcedure [dbo].[NhanVien_Them]    Script Date: 31-May-19 6:17:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[NhanVien_Them]
	-- Add the parameters for the stored procedure here
	(@MaNV  char(10)
           ,@TenNV nvarchar(50)
           ,@NamSinh smalldatetime
           ,@GioiTinh bit
           ,@SoDienThoai nvarchar(10))
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[NhanVien]
           ([MaNV]
           ,[TenNV]
           ,[NamSinh]
           ,[GioiTinh]
           ,[SDT])
     VALUES
           (@MaNV,@TenNV,@NamSinh,@GioiTinh,@SoDienThoai)
END
GO
/****** Object:  StoredProcedure [dbo].[NhanVien_Them_TaiKhoan]    Script Date: 31-May-19 6:17:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[NhanVien_Them_TaiKhoan]
	-- Add the parameters for the stored procedure here
	(@TenNV nvarchar(50)
           ,@NamSinh smalldatetime
           ,@GioiTinh bit
           ,@SoDienThoai nvarchar(10)
		   ,@MaTaiKhoan varchar(50)
		   ,@MatKhau nvarchar(100)
		   ,@CapDo int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @MaID char(12);
	DECLARE @DATE char(6);
	DECLARE @NOW char(6);
	DECLARE @ID int;
	--Lấy thời gian  hiện tại
	SELECT @NOW = (select substring(CONVERT(VARCHAR(10),GETDATE(),103),1,2) + substring(CONVERT(VARCHAR(10),GETDATE(),103),4,2) +
	RIGHT(substring(CONVERT(VARCHAR(10),GETDATE(),103),7,4),2));
	--Lấy thời gian cao nhất trong hệ thống
	SET @DATE= SUBSTRING((SELECT MAX(MaNV) FROM dbo.[NhanVien]),3,6);
	if(@DATE = @NOW)
	BEGIN
		SET @MaID=RIGHT((SELECT MAX(MaNV) FROM dbo.[NhanVien]),2);
	END
	else
	SET @MaID=0;
	SET @ID=CAST(@MaID as int) + 1;
	if(@ID<10)
	SET @MaID='NV'+@NOW+'0'+Convert(char(3),@ID);
	ELSE 
	SET @MaID='NV'+@NOW+Convert(char(3),@ID);

	SELECT @MaID;
    -- Insert statements for procedure here
	INSERT INTO [dbo].[NhanVien]
           ([MaNV]
           ,[TenNV]
           ,[NamSinh]
           ,[GioiTinh]
           ,[SDT])
     VALUES
           (@MaID,@TenNV,@NamSinh,@GioiTinh,@SoDienThoai);

	INSERT INTO [dbo].[TaiKhoan]
           ([MaTaiKhoan]
           ,[MatKhau]
           ,[CapDo]
           ,[MaNV])
     VALUES
           (@MaTaiKhoan,@MatKhau,@CapDo,@MaID)

	

END
GO
/****** Object:  StoredProcedure [dbo].[NhanVien_Xoa]    Script Date: 31-May-19 6:17:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[NhanVien_Xoa]
	-- Add the parameters for the stored procedure here
	(@MaNV char(10))
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM [dbo].[NhanVien]
	WHERE [MaNV] = @MaNV

	DELETE FROM [dbo].[TaiKhoan]
	WHERE [MaNV] = @MaNV
END
GO
/****** Object:  StoredProcedure [dbo].[PhieuDatMon_ChonAll]    Script Date: 31-May-19 6:17:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PhieuDatMon_ChonAll]
	-- Add the parameters for the stored procedure here
	--(@MaPDM int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [MaPDM]
      ,[NgayLap]
	  ,[MaNV]
      ,[MaBan]
	  ,[TinhTrang]
      ,[ThanhTien]
	  ,[GiamGia]
      ,[PhuThu]
  FROM [dbo].[PhieuDatMon]
  --WHERE [MaPDM] = [MaPDM]
END
GO
/****** Object:  StoredProcedure [dbo].[PhieuDatMon_ChonTai]    Script Date: 31-May-19 6:17:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PhieuDatMon_ChonTai]
	-- Add the parameters for the stored procedure here
	(@MaPDM char(12))
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [MaPDM]
      ,[NgayLap]
	  ,[MaNV]
      ,[MaBan]
	  ,[TinhTrang]
      ,[ThanhTien]
	  ,[GiamGia]
      ,[PhuThu]
  FROM [dbo].[PhieuDatMon]
  WHERE [MaPDM] = @MaPDM
END
GO
/****** Object:  StoredProcedure [dbo].[PhieuDatMon_ChonTai_Ban]    Script Date: 31-May-19 6:17:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PhieuDatMon_ChonTai_Ban]
	-- Add the parameters for the stored procedure here
	(@MaBan int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT DISTINCT 
                         dbo.PhieuDatMon.MaPDM, dbo.PhieuDatMon.NgayLap, dbo.PhieuDatMon.MaNV, dbo.PhieuDatMon.MaBan, dbo.PhieuDatMon.TinhTrang, dbo.PhieuDatMon.ThanhTien, dbo.PhieuDatMon.GiamGia, dbo.PhieuDatMon.PhuThu, 
                         dbo.PhieuDatMon.MaPDM AS Expr1, dbo.HoaDon.MaHD
FROM            dbo.PhieuDatMon LEFT OUTER JOIN
                         dbo.HoaDon ON dbo.PhieuDatMon.MaPDM = dbo.HoaDon.MaPDM
  WHERE [MaBan] = @MaBan AND  dbo.HoaDon.MaHD IS NULL
  ORDER BY [MaPDM] DESC
END
GO
/****** Object:  StoredProcedure [dbo].[PhieuDatMon_Sua]    Script Date: 31-May-19 6:17:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PhieuDatMon_Sua]
	-- Add the parameters for the stored procedure here
	(@MaPDM char(12), @MaNV char(10),@MaBan int,@TinhTrang bit ,@ThanhTien int, @GiamGia float, @PhuThu float)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    UPDATE [dbo].[PhieuDatMon]
	   SET 
		  [MaNV] = @MaNV
		  ,[MaBan] = @MaBan
		  ,[TinhTrang] = @TinhTrang
		  ,[ThanhTien] = @ThanhTien
		  ,[GiamGia] = @GiamGia
		  ,[PhuThu] = @PhuThu
	 WHERE [MaPDM] = @MaPDM
END
GO
/****** Object:  StoredProcedure [dbo].[PhieuDatMon_Sua_MaBan]    Script Date: 31-May-19 6:17:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PhieuDatMon_Sua_MaBan] 
	-- Add the parameters for the stored procedure here
	(@MaPDM char(12), @MaBan int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    UPDATE [dbo].[PhieuDatMon]
	   SET 
		[MaBan] = @MaBan
		
	 WHERE [MaPDM] = @MaPDM
END
GO
/****** Object:  StoredProcedure [dbo].[PhieuDatMon_Them]    Script Date: 31-May-19 6:17:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PhieuDatMon_Them]
	-- Add the parameters for the stored procedure here
	(@MaNV char(10),@MaBan int,@ThanhTien int, @GiamGia float, @PhuThu float)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
		DECLARE @MaID char(12);
		DECLARE @DATE char(6);
		DECLARE @NOW char(6);
		DECLARE @ID int;
		--Lấy thời gian  hiện tại
		SELECT @NOW = (select substring(CONVERT(VARCHAR(10),GETDATE(),103),1,2) + substring(CONVERT(VARCHAR(10),GETDATE(),103),4,2) +
		RIGHT(substring(CONVERT(VARCHAR(10),GETDATE(),103),7,4),2));
		--Lấy thời gian cao nhất trong hệ thống
		SET @DATE= SUBSTRING((SELECT MAX(MaPDM) FROM dbo.[PhieuDatMon]),4,6);
		if(@DATE = @NOW)
		BEGIN
		 SET @MaID=RIGHT((SELECT MAX(MaPDM) FROM dbo.[PhieuDatMon]),2);
		END
		else
		SET @MaID=0;

		SET @ID=CAST(@MaID as int) + 1;
		if(@ID<10)
		SET @MaID='PDM'+@NOW+'00'+Convert(char(2),@ID);
		else
		BEGIN
			IF (@ID<100)
			SET @MaID='PDM'+@NOW+'0'+Convert(char(2),@ID);
			ELSE 
			SET @MaID='PDM'+@NOW+Convert(char(2),@ID);
			
		END
		SELECT @MaID;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[PhieuDatMon]
           ([MaPDM]
		   ,[MaNV]
		   ,[MaBan]
		   ,[ThanhTien]
		   ,[GiamGia]
		   ,[PhuThu])
     VALUES
           (@MaID,@MaNV,@MaBan,@ThanhTien,@GiamGia, @PhuThu)
END
GO
/****** Object:  StoredProcedure [dbo].[PhieuDatMon_Xoa]    Script Date: 31-May-19 6:17:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PhieuDatMon_Xoa]
	-- Add the parameters for the stored procedure here
	(@MaPDM char(12))
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM [dbo].[PhieuDatMon]
	WHERE [MaPDM] = @MaPDM
END
GO
/****** Object:  StoredProcedure [dbo].[TaiKhoan_ChonAll]    Script Date: 31-May-19 6:17:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TaiKhoan_ChonAll]
	-- Add the parameters for the stored procedure here
	--(@MaPDM int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [MaTaiKhoan]
      ,[MatKhau]
      ,[CapDo]
      ,[MaNV]
  FROM [dbo].[TaiKhoan]
  --WHERE [MaPDM] = [MaPDM]
END
GO
/****** Object:  StoredProcedure [dbo].[TaiKhoan_ChonTai]    Script Date: 31-May-19 6:17:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[TaiKhoan_ChonTai]
	-- Add the parameters for the stored procedure here
	(@MaTaiKhoan varchar(50))
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [MaTaiKhoan]
      ,[MatKhau]
      ,[CapDo]
      ,[MaNV]
  FROM [dbo].[TaiKhoan]
  WHERE [MaTaiKhoan] = @MaTaiKhoan
END
GO
/****** Object:  StoredProcedure [dbo].[TaiKhoan_Sua]    Script Date: 31-May-19 6:17:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[TaiKhoan_Sua]
	-- Add the parameters for the stored procedure here
	(@MaTaiKhoan varchar(50)
           ,@MatKhau nvarchar(100)
           ,@CapDo int
           ,@MaNV char(10))
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [dbo].[TaiKhoan]
	   SET [MaTaiKhoan] = @MaTaiKhoan
		  ,[MatKhau] = @MatKhau
		  ,[CapDo] = @CapDo
		  ,[MaNV] = @MaNV
	 WHERE [MaTaiKhoan]=@MaTaiKhoan
END
GO
/****** Object:  StoredProcedure [dbo].[TaiKhoan_SuaThongTin]    Script Date: 31-May-19 6:17:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[TaiKhoan_SuaThongTin]
	-- Add the parameters for the stored procedure here
	(@MaTaiKhoan varchar(50)
           ,@CapDo int
           ,@MaNV char(10))
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [dbo].[TaiKhoan]
	   SET [MaTaiKhoan] = @MaTaiKhoan
		  ,[CapDo] = @CapDo
		  ,[MaNV] = @MaNV
	 WHERE [MaTaiKhoan]=@MaTaiKhoan
END
GO
/****** Object:  StoredProcedure [dbo].[TaiKhoan_Them]    Script Date: 31-May-19 6:17:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[TaiKhoan_Them]
	-- Add the parameters for the stored procedure here
	(@MaTaiKhoan varchar(50)
           ,@MatKhau nvarchar(100)
           ,@CapDo int
           ,@MaNV char(10))
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[TaiKhoan]
           ([MaTaiKhoan]
           ,[MatKhau]
           ,[CapDo]
           ,[MaNV])
     VALUES
           (@MaTaiKhoan,@MatKhau,@CapDo,@MaNV)
END
GO
/****** Object:  StoredProcedure [dbo].[TaiKhoan_Xoa]    Script Date: 31-May-19 6:17:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[TaiKhoan_Xoa]
	-- Add the parameters for the stored procedure here
	(@MaTaiKhoan char(10))
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM [dbo].[TaiKhoan]
	WHERE [MaTaiKhoan] = @MaTaiKhoan
END
GO
/****** Object:  StoredProcedure [dbo].[ThonTinPDM_ChonTai]    Script Date: 31-May-19 6:17:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ThonTinPDM_ChonTai]
	-- Add the parameters for the stored procedure here
	(@MaPDM char(12))
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT       DISTINCT dbo.Mon.MaMon, dbo.Mon.TenMon, dbo.ChiTietPDM.Soluong, dbo.Mon.Gia, dbo.HoaDon.MaHD
FROM            dbo.ChiTietPDM LEFT OUTER JOIN
                         dbo.Mon ON dbo.ChiTietPDM.MaMon = dbo.Mon.MaMon LEFT OUTER JOIN
                         dbo.PhieuDatMon ON dbo.ChiTietPDM.MaPDM = dbo.PhieuDatMon.MaPDM LEFT OUTER JOIN
                         dbo.HoaDon ON dbo.PhieuDatMon.MaPDM = dbo.HoaDon.MaPDM
WHERE        (dbo.PhieuDatMon.MaPDM = @MaPDM) AND (dbo.HoaDon.MaHD IS NULL)
ORDER BY dbo.Mon.MaMon


END
GO
EXEC [totodb].sys.sp_addextendedproperty @name=N'Huy', @value=N'' 
GO
USE [master]
GO
ALTER DATABASE [totodb] SET  READ_WRITE 
GO
