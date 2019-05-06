USE [master]
GO
/****** Object:  Database [toto_db]    Script Date: 06/05/2019 7:50:00 CH ******/
CREATE DATABASE [toto_db]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'toto_db', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\toto_db.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'toto_db_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\toto_db_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [toto_db] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [toto_db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [toto_db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [toto_db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [toto_db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [toto_db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [toto_db] SET ARITHABORT OFF 
GO
ALTER DATABASE [toto_db] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [toto_db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [toto_db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [toto_db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [toto_db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [toto_db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [toto_db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [toto_db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [toto_db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [toto_db] SET  DISABLE_BROKER 
GO
ALTER DATABASE [toto_db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [toto_db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [toto_db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [toto_db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [toto_db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [toto_db] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [toto_db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [toto_db] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [toto_db] SET  MULTI_USER 
GO
ALTER DATABASE [toto_db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [toto_db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [toto_db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [toto_db] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [toto_db] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [toto_db] SET QUERY_STORE = OFF
GO
USE [toto_db]
GO
/****** Object:  Table [dbo].[Ban]    Script Date: 06/05/2019 7:50:01 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ban](
	[MaBan] [int] IDENTITY(1,1) NOT NULL,
	[TinhTrang] [bit] NOT NULL,
	[BanGop] [int] NULL,
 CONSTRAINT [PK__Ban__3520ED6C4C14B390] PRIMARY KEY CLUSTERED 
(
	[MaBan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietPDM]    Script Date: 06/05/2019 7:50:02 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietPDM](
	[MaPDM] [int] NOT NULL,
	[MaMon] [int] NOT NULL,
	[Soluong] [smallint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 06/05/2019 7:50:02 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHD] [char](10) NOT NULL,
	[MaPDM] [int] NOT NULL,
	[MaNV] [char](10) NOT NULL,
	[LapHD] [smalldatetime] NOT NULL,
 CONSTRAINT [PK__HoaDon__2725A6E0F37FBCB7] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiMon]    Script Date: 06/05/2019 7:50:02 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiMon](
	[MaLoaiMon] [int] IDENTITY(1,1) NOT NULL,
	[TenLoaiMon] [nvarchar](50) NOT NULL,
	[Mota] [nvarchar](50) NULL,
	[TinhTrang] [bit] NOT NULL,
 CONSTRAINT [PK__LoaiMon__612C5AE4DEB9F0E2] PRIMARY KEY CLUSTERED 
(
	[MaLoaiMon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mon]    Script Date: 06/05/2019 7:50:02 CH ******/
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
 CONSTRAINT [PK__Mon__3A5B29A884BA1770] PRIMARY KEY CLUSTERED 
(
	[MaMon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 06/05/2019 7:50:02 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [char](10) NOT NULL,
	[TenNV] [nvarchar](50) NOT NULL,
	[NamSinh] [smalldatetime] NULL,
	[GioiTinh] [bit] NULL,
	[SoDienThoai] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhieuDatMon]    Script Date: 06/05/2019 7:50:02 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuDatMon](
	[MaPDM] [int] IDENTITY(1,1) NOT NULL,
	[NgayLap] [smalldatetime] NOT NULL,
	[MaBan] [int] NOT NULL,
	[TinhTrang] [bit] NOT NULL,
	[GiamGia] [float] NULL,
	[PhuThu] [int] NULL,
	[TongTien] [int] NULL,
 CONSTRAINT [PK__PhieuDat__3AE048C047803483] PRIMARY KEY CLUSTERED 
(
	[MaPDM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 06/05/2019 7:50:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[MaTaiKhoan] [char](10) NULL,
	[MatKhau] [nvarchar](100) NULL,
	[CapDo] [int] NULL,
	[MaNV] [char](10) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Ban] ADD  CONSTRAINT [DF_Ban_TinhTrang]  DEFAULT ((1)) FOR [TinhTrang]
GO
ALTER TABLE [dbo].[ChiTietPDM] ADD  CONSTRAINT [DF_ChiTietPDM_Soluong]  DEFAULT ((1)) FOR [Soluong]
GO
ALTER TABLE [dbo].[HoaDon] ADD  CONSTRAINT [DF__HoaDon__LapHD__52593CB8]  DEFAULT (getdate()) FOR [LapHD]
GO
ALTER TABLE [dbo].[LoaiMon] ADD  CONSTRAINT [DF_LoaiMon_TinhTrang]  DEFAULT ((1)) FOR [TinhTrang]
GO
ALTER TABLE [dbo].[Mon] ADD  CONSTRAINT [DF_Mon_TinhTrang]  DEFAULT ((1)) FOR [TinhTrang]
GO
ALTER TABLE [dbo].[PhieuDatMon] ADD  CONSTRAINT [DF__PhieuDatM__NgayL__59063A47]  DEFAULT (getdate()) FOR [NgayLap]
GO
ALTER TABLE [dbo].[PhieuDatMon] ADD  CONSTRAINT [DF_PhieuDatMon_TinhTrang]  DEFAULT ((1)) FOR [TinhTrang]
GO
ALTER TABLE [dbo].[ChiTietPDM]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietPDM_Mon] FOREIGN KEY([MaMon])
REFERENCES [dbo].[Mon] ([MaMon])
GO
ALTER TABLE [dbo].[ChiTietPDM] CHECK CONSTRAINT [FK_ChiTietPDM_Mon]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_NV] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_NV]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_PhieuDatMon] FOREIGN KEY([MaPDM])
REFERENCES [dbo].[PhieuDatMon] ([MaPDM])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_PhieuDatMon]
GO
ALTER TABLE [dbo].[Mon]  WITH CHECK ADD  CONSTRAINT [FK_Mon_LoaiMon] FOREIGN KEY([MaLoaiMon])
REFERENCES [dbo].[LoaiMon] ([MaLoaiMon])
GO
ALTER TABLE [dbo].[Mon] CHECK CONSTRAINT [FK_Mon_LoaiMon]
GO
ALTER TABLE [dbo].[PhieuDatMon]  WITH CHECK ADD  CONSTRAINT [FK_PDM_Ban] FOREIGN KEY([MaBan])
REFERENCES [dbo].[Ban] ([MaBan])
GO
ALTER TABLE [dbo].[PhieuDatMon] CHECK CONSTRAINT [FK_PDM_Ban]
GO
ALTER TABLE [dbo].[TaiKhoan]  WITH CHECK ADD  CONSTRAINT [FK_Taikhoan_NV] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[TaiKhoan] CHECK CONSTRAINT [FK_Taikhoan_NV]
GO
/****** Object:  StoredProcedure [dbo].[Ban_CapNhap]    Script Date: 06/05/2019 7:50:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Ban_CapNhap]
	-- Add the parameters for the stored procedure here
	(@MaBan int ,@TinhTrang bit, @BanGop int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [dbo].[Ban] SET [TinhTrang] = @TinhTrang,[BanGop] = @BanGop WHERE [MaBan]= @MaBan

END
GO
/****** Object:  StoredProcedure [dbo].[Ban_ChonAll]    Script Date: 06/05/2019 7:50:03 CH ******/
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
/****** Object:  StoredProcedure [dbo].[Ban_ChonTai]    Script Date: 06/05/2019 7:50:03 CH ******/
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
/****** Object:  StoredProcedure [dbo].[Ban_Them]    Script Date: 06/05/2019 7:50:03 CH ******/
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
	(@TinhTrang bit, @BanGop int)
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
/****** Object:  StoredProcedure [dbo].[Ban_Xoa]    Script Date: 06/05/2019 7:50:03 CH ******/
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
	(@MaBan int ,@TinhTrang bit, @BanGop int)
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
/****** Object:  StoredProcedure [dbo].[ChiTietPDM_ChonAll]    Script Date: 06/05/2019 7:50:03 CH ******/
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
/****** Object:  StoredProcedure [dbo].[ChiTietPDM_ChonTai]    Script Date: 06/05/2019 7:50:03 CH ******/
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
	(@MaPDM int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [MaMon]
      ,[Soluong]
  FROM [dbo].[ChiTietPDM]
  WHERE [MaPDM] = @MaPDM
END
GO
/****** Object:  StoredProcedure [dbo].[ChiTietPDM_Sua]    Script Date: 06/05/2019 7:50:03 CH ******/
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
	(@MaPDM int,
           @MaMon int,
           @Soluong smallint)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [dbo].[ChiTietPDM]
	   SET [MaPDM] =@MaPDM
		  ,[MaMon] = @MaMon
		  ,[Soluong] = @Soluong
	 WHERE [MaMon]=@MaMon
END
GO
/****** Object:  StoredProcedure [dbo].[ChiTietPDM_Them]    Script Date: 06/05/2019 7:50:03 CH ******/
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
	(@MaPDM int,
           @MaMon int
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
           )
     VALUES
           (@MaPDM,@MaMon)
END
GO
/****** Object:  StoredProcedure [dbo].[ChiTietPDM_Xoa]    Script Date: 06/05/2019 7:50:03 CH ******/
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
	(@MaPDM int)
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
/****** Object:  StoredProcedure [dbo].[HoaDon_ChonAll]    Script Date: 06/05/2019 7:50:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[HoaDon_ChonAll]
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [MaHD]
      ,[MaNV]
      ,[LapHD]
      ,[ThanhTien]
      ,[GiamGia]
  FROM [dbo].[HoaDon]

END
GO
/****** Object:  StoredProcedure [dbo].[HoaDon_ChonTai]    Script Date: 06/05/2019 7:50:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[HoaDon_ChonTai]
	-- Add the parameters for the stored procedure here
	(@MaHoaDon varchar(10))
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [MaHD]
      ,[MaNV]
      ,[LapHD]
      ,[ThanhTien]
      ,[GiamGia]
  FROM [dbo].[HoaDon]
  WHERE @MaHoaDon=MaHD
END
GO
/****** Object:  StoredProcedure [dbo].[HoaDon_Sua]    Script Date: 06/05/2019 7:50:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[HoaDon_Sua]
	-- Add the parameters for the stored procedure here
	(@MaHD char(10)
           ,@MaNV char(10)
           ,@LapHD smalldatetime
           ,@ThanhTien float
           ,@GiamGia float)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    
UPDATE [dbo].[HoaDon]
   SET [MaHD] = @MaHD
      ,[MaNV] = @MaNV
      ,[LapHD] = @LapHD
      ,[ThanhTien] = @ThanhTien
      ,[GiamGia] = @GiamGia
 WHERE [MaHD]=@MaHD
END
GO
/****** Object:  StoredProcedure [dbo].[HoaDon_Them]    Script Date: 06/05/2019 7:50:03 CH ******/
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
	-- Add the parameters for the stored procedure here
	(@MaHD char(10)
           ,@MaNV char(10)
           ,@LapHD smalldatetime
           ,@ThanhTien float
           ,@GiamGia float)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    
INSERT INTO [dbo].[HoaDon]
           ([MaHD]
           ,[MaNV]
           ,[LapHD]
           ,[ThanhTien]
           ,[GiamGia])
     VALUES
           (@MaHD,@MaNV,@LapHD,@ThanhTien,@GiamGia)
END
GO
/****** Object:  StoredProcedure [dbo].[HoaDon_Xoa]    Script Date: 06/05/2019 7:50:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[HoaDon_Xoa]
	-- Add the parameters for the stored procedure here
	(@MaHoaDon char(10))
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM [dbo].[HoaDon]
	WHERE [MaHD] = @MaHoaDon
END
GO
/****** Object:  StoredProcedure [dbo].[LoaiMon_CapNhap]    Script Date: 06/05/2019 7:50:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[LoaiMon_CapNhap]
	-- Add the parameters for the stored procedure here
(@MaLoaiMon int,@MaMon int,@TenLoaiMon varchar(10),@Mota varchar(50),@TinhTrang bit)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [dbo].[LoaiMon]
   SET [MaMon] =@MaMon
      ,[TenLoaiMon] = @TenLoaiMon
      ,[Mota] = @Mota
      ,[TinhTrang] = @TinhTrang
 WHERE [MaLoaiMon]=@MaLoaiMon

END
GO
/****** Object:  StoredProcedure [dbo].[LoaiMon_ChonAll]    Script Date: 06/05/2019 7:50:03 CH ******/
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
/****** Object:  StoredProcedure [dbo].[LoaiMon_ChonTai]    Script Date: 06/05/2019 7:50:03 CH ******/
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
  FROM [toto_db].[dbo].[LoaiMon]
  WHERE [MaLoaiMon] = @MaLoaiMon
END
GO
/****** Object:  StoredProcedure [dbo].[LoaiMon_Them]    Script Date: 06/05/2019 7:50:03 CH ******/
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
	(@MaMon int,@TenLoaiMon varchar(10),@Mota varchar(50),@TinhTrang bit)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[LoaiMon]
           ([MaMon]
           ,[TenLoaiMon]
           ,[Mota]
           ,[TinhTrang])
     VALUES
           (@MaMon,@TenLoaiMon,@Mota,@TinhTrang);
END
GO
/****** Object:  StoredProcedure [dbo].[LoaiMon_Xoa]    Script Date: 06/05/2019 7:50:03 CH ******/
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
END
GO
/****** Object:  StoredProcedure [dbo].[Mon_CapNhap]    Script Date: 06/05/2019 7:50:03 CH ******/
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
/****** Object:  StoredProcedure [dbo].[Mon_ChonAll]    Script Date: 06/05/2019 7:50:03 CH ******/
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
  --WHERE [MaMon] = @MaMon
END
GO
/****** Object:  StoredProcedure [dbo].[Mon_ChonAll_where_LoaiMon]    Script Date: 06/05/2019 7:50:03 CH ******/
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
/****** Object:  StoredProcedure [dbo].[Mon_ChonTai]    Script Date: 06/05/2019 7:50:03 CH ******/
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
/****** Object:  StoredProcedure [dbo].[Mon_Them]    Script Date: 06/05/2019 7:50:03 CH ******/
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
/****** Object:  StoredProcedure [dbo].[Mon_Xoa]    Script Date: 06/05/2019 7:50:03 CH ******/
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
END
GO
/****** Object:  StoredProcedure [dbo].[NhanVien_ChonAll]    Script Date: 06/05/2019 7:50:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[NhanVien_ChonAll]
	-- Add the parameters for the stored procedure here

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
      ,[SoDienThoai]
  FROM [dbo].[NhanVien]
  --WHERE [MaMon] = @MaMon
END
GO
/****** Object:  StoredProcedure [dbo].[NhanVien_ChonTai]    Script Date: 06/05/2019 7:50:03 CH ******/
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
      ,[SoDienThoai]
  FROM [dbo].[NhanVien]
  WHERE [MaNV] = @MaNV
END
GO
/****** Object:  StoredProcedure [dbo].[NhanVien_Sua]    Script Date: 06/05/2019 7:50:03 CH ******/
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
      ,[SoDienThoai] = @SoDienThoai
 WHERE [MaNV] = @MaNV
END
GO
/****** Object:  StoredProcedure [dbo].[NhanVien_Them]    Script Date: 06/05/2019 7:50:03 CH ******/
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
           ,[SoDienThoai])
     VALUES
           (@MaNV,@TenNV,@NamSinh,@GioiTinh,@SoDienThoai)
END
GO
/****** Object:  StoredProcedure [dbo].[NhanVien_Xoa]    Script Date: 06/05/2019 7:50:03 CH ******/
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
END
GO
/****** Object:  StoredProcedure [dbo].[PhieuDatMon_ChonAll]    Script Date: 06/05/2019 7:50:03 CH ******/
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
      ,[MaBan]
      ,[MaHD]
      ,[TinhTrang]
  FROM [dbo].[PhieuDatMon]
  --WHERE [MaPDM] = [MaPDM]
END
GO
/****** Object:  StoredProcedure [dbo].[PhieuDatMon_ChonTai]    Script Date: 06/05/2019 7:50:03 CH ******/
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
	(@MaPDM int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [MaPDM]
      ,[NgayLap]
      ,[MaBan]
      ,[MaHD]
      ,[TinhTrang]
  FROM [dbo].[PhieuDatMon]
  WHERE [MaPDM] = @MaPDM
END
GO
/****** Object:  StoredProcedure [dbo].[PhieuDatMon_ChonTai_Ban]    Script Date: 06/05/2019 7:50:03 CH ******/
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
	SELECT [MaPDM]
      ,[NgayLap]
      ,[MaBan]
      ,[MaHD]
      ,[TinhTrang]
  FROM [dbo].[PhieuDatMon]
  WHERE [MaBan] = @MaBan
  ORDER BY [MaPDM] DESC
END
GO
/****** Object:  StoredProcedure [dbo].[PhieuDatMon_Sua]    Script Date: 06/05/2019 7:50:03 CH ******/
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
	(@MaPDM int
           ,@NgayLap smalldatetime
           ,@MaBan int
           ,@MaHD char(10)
           ,@TinhTrang bit)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [dbo].[PhieuDatMon]
	   SET[NgayLap] = @NgayLap
		  ,[MaBan] = @MaBan
		  ,[MaHD] = @MaHD
		  ,[TinhTrang] = @TinhTrang
	 WHERE [MaPDM] =@MaPDM
END
GO
/****** Object:  StoredProcedure [dbo].[PhieuDatMon_Them]    Script Date: 06/05/2019 7:50:03 CH ******/
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
	(@MaBan int
           ,@TinhTrang bit)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
    -- Insert statements for procedure here
	INSERT INTO [dbo].[PhieuDatMon]
           ([MaBan]
           ,[TinhTrang])
     VALUES
           (@MaBan,@TinhTrang)
END
GO
/****** Object:  StoredProcedure [dbo].[PhieuDatMon_Xoa]    Script Date: 06/05/2019 7:50:03 CH ******/
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
	(@MaPDM int)
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
/****** Object:  StoredProcedure [dbo].[TaiKhoan_ChonAll]    Script Date: 06/05/2019 7:50:03 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
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
/****** Object:  StoredProcedure [dbo].[TaiKhoan_ChonTai]    Script Date: 06/05/2019 7:50:03 CH ******/
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
	(@MaTaiKhoan char(10))
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
/****** Object:  StoredProcedure [dbo].[TaiKhoan_Sua]    Script Date: 06/05/2019 7:50:03 CH ******/
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
	(@MaTaiKhoan char(10)
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
/****** Object:  StoredProcedure [dbo].[TaiKhoan_Them]    Script Date: 06/05/2019 7:50:03 CH ******/
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
	(@MaTaiKhoan char(10)
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
/****** Object:  StoredProcedure [dbo].[TaiKhoan_Xoa]    Script Date: 06/05/2019 7:50:03 CH ******/
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
/****** Object:  StoredProcedure [dbo].[ThonTinPDM_ChonTai]    Script Date: 06/05/2019 7:50:03 CH ******/
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
	(@MaPDM int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT        dbo.Mon.MaMon, dbo.Mon.TenMon, dbo.ChiTietPDM.Soluong, dbo.Mon.Gia
	FROM          dbo.ChiTietPDM INNER JOIN
							 dbo.Mon ON dbo.ChiTietPDM.MaMon = dbo.Mon.MaMon INNER JOIN
							 dbo.PhieuDatMon ON dbo.ChiTietPDM.MaPDM = dbo.PhieuDatMon.MaPDM
	WHERE  dbo.PhieuDatMon.[MaPDM] = @MaPDM
END
GO
EXEC [toto_db].sys.sp_addextendedproperty @name=N'Huy', @value=N'' 
GO
USE [master]
GO
ALTER DATABASE [toto_db] SET  READ_WRITE 
GO
