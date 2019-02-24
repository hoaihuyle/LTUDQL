USE [master]
GO
/****** Object:  Database [QLCH]    Script Date: 22/02/2019 11:28:43 PM ******/
CREATE DATABASE [QLCH]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'quản lý bán hàng', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\quản lý bán hàng.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'quản lý bán hàng_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\quản lý bán hàng_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [QLCH] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLCH].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLCH] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLCH] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLCH] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLCH] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLCH] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLCH] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLCH] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLCH] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLCH] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLCH] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLCH] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLCH] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLCH] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLCH] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLCH] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QLCH] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLCH] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLCH] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLCH] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLCH] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLCH] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLCH] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLCH] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QLCH] SET  MULTI_USER 
GO
ALTER DATABASE [QLCH] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLCH] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLCH] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLCH] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QLCH] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QLCH] SET QUERY_STORE = OFF
GO
USE [QLCH]
GO
/****** Object:  Table [dbo].[CTHD]    Script Date: 22/02/2019 11:28:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTHD](
	[MaHangHoa] [nchar](10) NOT NULL,
	[MaHD] [nchar](10) NOT NULL,
	[SL] [int] NULL,
 CONSTRAINT [PK_CTHD] PRIMARY KEY CLUSTERED 
(
	[MaHangHoa] ASC,
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HANGHOA]    Script Date: 22/02/2019 11:28:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HANGHOA](
	[MaHang] [nchar](10) NOT NULL,
	[TenHang] [nvarchar](50) NULL,
	[DVT] [nvarchar](20) NULL,
	[DonGia] [float] NULL,
	[SLcon] [int] NULL,
	[MaLoaiHang] [nchar](10) NULL,
 CONSTRAINT [PK_HANGHOA] PRIMARY KEY CLUSTERED 
(
	[MaHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HOADON]    Script Date: 22/02/2019 11:28:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HOADON](
	[MaHD] [nchar](10) NOT NULL,
	[NgayHD] [datetime] NULL,
	[MaKH] [nchar](10) NULL,
	[MaNV] [nchar](10) NULL,
 CONSTRAINT [PK_HOADON] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KHACHHANG]    Script Date: 22/02/2019 11:28:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHACHHANG](
	[MaKH] [nchar](10) NOT NULL,
	[TenKH] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[SDT] [nchar](10) NULL,
	[STK] [nchar](20) NULL,
	[MST] [nchar](20) NULL,
 CONSTRAINT [PK_KHACHHANG] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOAIHANG]    Script Date: 22/02/2019 11:28:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOAIHANG](
	[MaLoaiHang] [nchar](10) NOT NULL,
	[TenLoaiHang] [nvarchar](50) NULL,
	[GhiChu] [nchar](200) NULL,
 CONSTRAINT [PK_LOAIHANG] PRIMARY KEY CLUSTERED 
(
	[MaLoaiHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NHANVIEN]    Script Date: 22/02/2019 11:28:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHANVIEN](
	[MaNV] [nchar](10) NOT NULL,
	[TenNV] [nvarchar](50) NULL,
	[NgaySinh] [datetime] NULL,
	[GioiTinh] [bit] NULL,
	[SDT] [nchar](10) NULL,
 CONSTRAINT [PK_NHANVIEN] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CTHD]  WITH CHECK ADD  CONSTRAINT [FK_CTHD_HANGHOA] FOREIGN KEY([MaHangHoa])
REFERENCES [dbo].[HANGHOA] ([MaHang])
GO
ALTER TABLE [dbo].[CTHD] CHECK CONSTRAINT [FK_CTHD_HANGHOA]
GO
ALTER TABLE [dbo].[CTHD]  WITH CHECK ADD  CONSTRAINT [FK_CTHD_HOADON] FOREIGN KEY([MaHD])
REFERENCES [dbo].[HOADON] ([MaHD])
GO
ALTER TABLE [dbo].[CTHD] CHECK CONSTRAINT [FK_CTHD_HOADON]
GO
ALTER TABLE [dbo].[HANGHOA]  WITH CHECK ADD  CONSTRAINT [FK_HANGHOA_LOAIHANG] FOREIGN KEY([MaLoaiHang])
REFERENCES [dbo].[LOAIHANG] ([MaLoaiHang])
GO
ALTER TABLE [dbo].[HANGHOA] CHECK CONSTRAINT [FK_HANGHOA_LOAIHANG]
GO
ALTER TABLE [dbo].[HOADON]  WITH CHECK ADD  CONSTRAINT [FK_HOADON_KHACHHANG] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KHACHHANG] ([MaKH])
GO
ALTER TABLE [dbo].[HOADON] CHECK CONSTRAINT [FK_HOADON_KHACHHANG]
GO
ALTER TABLE [dbo].[HOADON]  WITH CHECK ADD  CONSTRAINT [FK_HOADON_NHANVIEN] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NHANVIEN] ([MaNV])
GO
ALTER TABLE [dbo].[HOADON] CHECK CONSTRAINT [FK_HOADON_NHANVIEN]
GO
/****** Object:  StoredProcedure [dbo].[sp_themCTHD]    Script Date: 22/02/2019 11:28:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_themCTHD]
	-- Add the parameters for the stored procedure here
	@MaHangHoa nchar(10),
    @MaHD nchar(10),
    @SL int
AS
BEGIN
	INSERT INTO [dbo].[CTHD]
           ([MaHangHoa]
           ,[MaHD]
           ,[SL])
     VALUES
           (@MaHangHoa,@MaHD,@SL)
END

GO
/****** Object:  StoredProcedure [dbo].[sp_themmmoihoadon]    Script Date: 22/02/2019 11:28:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_themmmoihoadon]
	-- Add the parameters for the stored procedure here
	@MaHD nchar(10),
    @NgayHD datetime,
    @MaKH nchar(10),
    @MaNV nchar(10)
AS
BEGIN
	INSERT INTO [dbo].[HOADON]
           ([MaHD]
           ,[NgayHD]
           ,[MaKH]
           ,[MaNV])
     VALUES
           (@MaHD,@NgayHD,@MaKH,@MaNV)
END

GO
/****** Object:  StoredProcedure [dbo].[SP_tHEMMOIHANGHOA]    Script Date: 22/02/2019 11:28:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_tHEMMOIHANGHOA] 
	-- Add the parameters for the stored procedure here
	@MaHang nchar(10),
    @TenHang nvarchar(50),
    @DVT nvarchar(20),
    @DonGia float,
    @SLcon int,
    @MaLoaiHang nchar(10)
AS
BEGIN
	INSERT INTO [dbo].[HANGHOA]
           ([MaHang]
           ,[TenHang]
           ,[DVT]
           ,[DonGia]
           ,[SLcon]
           ,[MaLoaiHang])
     VALUES
           (@MaHang,@TenHang,@DVT,@DonGia,@SLcon,@MaLoaiHang)
END

GO
/****** Object:  StoredProcedure [dbo].[sp_themmoikhachhang]    Script Date: 22/02/2019 11:28:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_themmoikhachhang]
	-- Add the parameters for the stored procedure here
	@MaKH nchar(10),
    @TenKH nvarchar(50),
    @DiaChi nvarchar(50),
    @SDT nchar(10),
    @STK nchar(20),
    @MST nchar(20)
AS
BEGIN
	INSERT INTO [dbo].[KHACHHANG]
           ([MaKH]
           ,[TenKH]
           ,[DiaChi]
           ,[SDT]
           ,[STK]
           ,[MST])
     VALUES
           (@MaKH,@TenKH,@DiaChi,@SDT, @STK, @MST)
END

GO
/****** Object:  StoredProcedure [dbo].[SP_THEMMOINV]    Script Date: 22/02/2019 11:28:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_THEMMOINV]
	-- Add the parameters for the stored procedure here
	@MaNV nchar(10),
     @TenNV nvarchar(50),
      @NgaySinh datetime,
      @GioiTinh bit,
      @SDT nchar(10)
AS
BEGIN
	INSERT INTO [dbo].[NHANVIEN]
           ([MaNV]
           ,[TenNV]
           ,[NgaySinh]
           ,[GioiTinh]
           ,[SDT])
     VALUES
           (@MaNV,@TenNV, @NgaySinh,@GioiTinh,@SDT)
END

GO
/****** Object:  StoredProcedure [dbo].[SP_tHEMMOOILOAIHANG]    Script Date: 22/02/2019 11:28:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_tHEMMOOILOAIHANG] 
	-- Add the parameters for the stored procedure here
	@MaLoaiHang nchar(10),
    @TenLoaiHang nvarchar(50),
    @GhiChu nchar(200)
AS
BEGIN
	INSERT INTO [dbo].[LOAIHANG]
           ([MaLoaiHang]
           ,[TenLoaiHang]
           ,[GhiChu])
     VALUES
           (@MaLoaiHang,@TenLoaiHang,@GhiChu)
END

GO
USE [master]
GO
ALTER DATABASE [QLCH] SET  READ_WRITE 
GO
