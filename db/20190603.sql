USE [master]
GO
/****** Object:  Database [totodb]    Script Date: 2019-06-03 10:45:44 PM ******/
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
/****** Object:  Sequence [dbo].[HOADON_Seq]    Script Date: 2019-06-03 10:45:44 PM ******/
CREATE SEQUENCE [dbo].[HOADON_Seq] 
 AS [int]
 START WITH 1
 INCREMENT BY 1
 MINVALUE -2147483648
 MAXVALUE 2147483647
 CACHE 
GO
/****** Object:  Table [dbo].[Audit_Ban]    Script Date: 2019-06-03 10:45:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Audit_Ban](
	[MaBan] [int] NOT NULL,
	[TinhTrang] [int] NOT NULL,
	[BanGop] [int] NULL,
	[AUDIT_TYPE] [varchar](50) NULL,
	[AUDIT_TIME] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Audit_ChiTietPDM]    Script Date: 2019-06-03 10:45:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Audit_ChiTietPDM](
	[MaPDM] [char](12) NOT NULL,
	[MaMon] [int] NOT NULL,
	[Soluong] [smallint] NOT NULL,
	[AUDIT_TYPE] [varchar](50) NULL,
	[AUDIT_TIME] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Audit_HoaDon]    Script Date: 2019-06-03 10:45:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Audit_HoaDon](
	[MaHD] [char](12) NOT NULL,
	[MaPDM] [char](12) NOT NULL,
	[LapHD] [smalldatetime] NOT NULL,
	[MaNV] [char](10) NOT NULL,
	[TinhTrang] [bit] NOT NULL,
	[AUDIT_TYPE] [varchar](50) NULL,
	[AUDIT_TIME] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Audit_LoaiMon]    Script Date: 2019-06-03 10:45:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Audit_LoaiMon](
	[MaLoaiMon] [int] NOT NULL,
	[TenLoaiMon] [nvarchar](50) NOT NULL,
	[Mota] [nvarchar](50) NULL,
	[TinhTrang] [bit] NOT NULL,
	[AUDIT_TYPE] [varchar](50) NULL,
	[AUDIT_TIME] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Audit_Mon]    Script Date: 2019-06-03 10:45:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Audit_Mon](
	[MaMon] [int] NOT NULL,
	[MaLoaiMon] [int] NOT NULL,
	[TenMon] [nvarchar](50) NOT NULL,
	[Gia] [float] NULL,
	[Mota] [nvarchar](500) NULL,
	[TinhTrang] [bit] NOT NULL,
	[AUDIT_TYPE] [varchar](50) NULL,
	[AUDIT_TIME] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Audit_NhanVien]    Script Date: 2019-06-03 10:45:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Audit_NhanVien](
	[MaNV] [char](10) NOT NULL,
	[TenNV] [nvarchar](50) NOT NULL,
	[NamSinh] [smalldatetime] NULL,
	[GioiTinh] [bit] NULL,
	[SDT] [nvarchar](10) NOT NULL,
	[NgayLap] [smalldatetime] NOT NULL,
	[AUDIT_TYPE] [varchar](50) NULL,
	[AUDIT_TIME] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Audit_PhieuDatMon]    Script Date: 2019-06-03 10:45:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Audit_PhieuDatMon](
	[MaPDM] [char](12) NOT NULL,
	[NgayLap] [smalldatetime] NOT NULL,
	[MaNV] [char](10) NOT NULL,
	[MaBan] [int] NULL,
	[TinhTrang] [bit] NOT NULL,
	[ThanhTien] [int] NULL,
	[GiamGia] [float] NULL,
	[PhuThu] [float] NULL,
	[MangVe] [bit] NOT NULL,
	[AUDIT_TYPE] [varchar](50) NULL,
	[AUDIT_TIME] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Audit_TaiKhoan]    Script Date: 2019-06-03 10:45:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Audit_TaiKhoan](
	[MaTaiKhoan] [varchar](50) NOT NULL,
	[MatKhau] [nvarchar](100) NOT NULL,
	[CapDo] [int] NOT NULL,
	[MaNV] [char](10) NOT NULL,
	[AUDIT_TYPE] [varchar](50) NULL,
	[AUDIT_TIME] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ban]    Script Date: 2019-06-03 10:45:44 PM ******/
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
/****** Object:  Table [dbo].[ChiTietPDM]    Script Date: 2019-06-03 10:45:44 PM ******/
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
/****** Object:  Table [dbo].[HoaDon]    Script Date: 2019-06-03 10:45:44 PM ******/
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
/****** Object:  Table [dbo].[LoaiMon]    Script Date: 2019-06-03 10:45:44 PM ******/
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
/****** Object:  Table [dbo].[Mon]    Script Date: 2019-06-03 10:45:44 PM ******/
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
/****** Object:  Table [dbo].[NhanVien]    Script Date: 2019-06-03 10:45:44 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhieuDatMon]    Script Date: 2019-06-03 10:45:44 PM ******/
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
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 2019-06-03 10:45:44 PM ******/
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
SET IDENTITY_INSERT [dbo].[Ban] ON 

INSERT [dbo].[Ban] ([MaBan], [TinhTrang], [BanGop]) VALUES (1, 0, 0)
INSERT [dbo].[Ban] ([MaBan], [TinhTrang], [BanGop]) VALUES (2, 1, 0)
INSERT [dbo].[Ban] ([MaBan], [TinhTrang], [BanGop]) VALUES (3, 0, 0)
INSERT [dbo].[Ban] ([MaBan], [TinhTrang], [BanGop]) VALUES (4, 0, 0)
INSERT [dbo].[Ban] ([MaBan], [TinhTrang], [BanGop]) VALUES (5, 0, 0)
INSERT [dbo].[Ban] ([MaBan], [TinhTrang], [BanGop]) VALUES (6, 0, 0)
INSERT [dbo].[Ban] ([MaBan], [TinhTrang], [BanGop]) VALUES (7, 2, 0)
INSERT [dbo].[Ban] ([MaBan], [TinhTrang], [BanGop]) VALUES (8, 0, 0)
INSERT [dbo].[Ban] ([MaBan], [TinhTrang], [BanGop]) VALUES (9, 0, 0)
INSERT [dbo].[Ban] ([MaBan], [TinhTrang], [BanGop]) VALUES (10, 0, NULL)
INSERT [dbo].[Ban] ([MaBan], [TinhTrang], [BanGop]) VALUES (11, 0, 0)
INSERT [dbo].[Ban] ([MaBan], [TinhTrang], [BanGop]) VALUES (12, 0, 0)
INSERT [dbo].[Ban] ([MaBan], [TinhTrang], [BanGop]) VALUES (13, 0, 0)
INSERT [dbo].[Ban] ([MaBan], [TinhTrang], [BanGop]) VALUES (14, 0, NULL)
INSERT [dbo].[Ban] ([MaBan], [TinhTrang], [BanGop]) VALUES (15, 0, NULL)
INSERT [dbo].[Ban] ([MaBan], [TinhTrang], [BanGop]) VALUES (16, 0, 0)
INSERT [dbo].[Ban] ([MaBan], [TinhTrang], [BanGop]) VALUES (17, 0, 0)
INSERT [dbo].[Ban] ([MaBan], [TinhTrang], [BanGop]) VALUES (18, 0, 0)
INSERT [dbo].[Ban] ([MaBan], [TinhTrang], [BanGop]) VALUES (19, 0, NULL)
INSERT [dbo].[Ban] ([MaBan], [TinhTrang], [BanGop]) VALUES (20, 0, NULL)
INSERT [dbo].[Ban] ([MaBan], [TinhTrang], [BanGop]) VALUES (21, 0, NULL)
INSERT [dbo].[Ban] ([MaBan], [TinhTrang], [BanGop]) VALUES (22, 0, NULL)
INSERT [dbo].[Ban] ([MaBan], [TinhTrang], [BanGop]) VALUES (23, 0, NULL)
INSERT [dbo].[Ban] ([MaBan], [TinhTrang], [BanGop]) VALUES (24, 0, NULL)
INSERT [dbo].[Ban] ([MaBan], [TinhTrang], [BanGop]) VALUES (25, 0, NULL)
INSERT [dbo].[Ban] ([MaBan], [TinhTrang], [BanGop]) VALUES (26, 0, 0)
INSERT [dbo].[Ban] ([MaBan], [TinhTrang], [BanGop]) VALUES (27, 0, NULL)
INSERT [dbo].[Ban] ([MaBan], [TinhTrang], [BanGop]) VALUES (28, 0, NULL)
INSERT [dbo].[Ban] ([MaBan], [TinhTrang], [BanGop]) VALUES (29, 0, NULL)
INSERT [dbo].[Ban] ([MaBan], [TinhTrang], [BanGop]) VALUES (30, 0, NULL)
INSERT [dbo].[Ban] ([MaBan], [TinhTrang], [BanGop]) VALUES (31, 0, NULL)
INSERT [dbo].[Ban] ([MaBan], [TinhTrang], [BanGop]) VALUES (32, 0, NULL)
INSERT [dbo].[Ban] ([MaBan], [TinhTrang], [BanGop]) VALUES (33, 0, NULL)
INSERT [dbo].[Ban] ([MaBan], [TinhTrang], [BanGop]) VALUES (34, 0, NULL)
INSERT [dbo].[Ban] ([MaBan], [TinhTrang], [BanGop]) VALUES (35, 0, NULL)
INSERT [dbo].[Ban] ([MaBan], [TinhTrang], [BanGop]) VALUES (36, 0, NULL)
INSERT [dbo].[Ban] ([MaBan], [TinhTrang], [BanGop]) VALUES (37, 0, NULL)
INSERT [dbo].[Ban] ([MaBan], [TinhTrang], [BanGop]) VALUES (38, 0, NULL)
INSERT [dbo].[Ban] ([MaBan], [TinhTrang], [BanGop]) VALUES (39, 0, NULL)
INSERT [dbo].[Ban] ([MaBan], [TinhTrang], [BanGop]) VALUES (40, 0, NULL)
INSERT [dbo].[Ban] ([MaBan], [TinhTrang], [BanGop]) VALUES (41, 0, 0)
INSERT [dbo].[Ban] ([MaBan], [TinhTrang], [BanGop]) VALUES (42, 0, NULL)
SET IDENTITY_INSERT [dbo].[Ban] OFF
INSERT [dbo].[ChiTietPDM] ([MaPDM], [MaMon], [Soluong]) VALUES (N'PDM190602001', 2, 3)
INSERT [dbo].[ChiTietPDM] ([MaPDM], [MaMon], [Soluong]) VALUES (N'PDM190602001', 9, 4)
INSERT [dbo].[ChiTietPDM] ([MaPDM], [MaMon], [Soluong]) VALUES (N'PDM190602002', 2, 2)
INSERT [dbo].[ChiTietPDM] ([MaPDM], [MaMon], [Soluong]) VALUES (N'PDM190602003', 3, 7)
INSERT [dbo].[ChiTietPDM] ([MaPDM], [MaMon], [Soluong]) VALUES (N'PDM190602004', 3, 2)
INSERT [dbo].[ChiTietPDM] ([MaPDM], [MaMon], [Soluong]) VALUES (N'PDM190602005', 1, 4)
INSERT [dbo].[ChiTietPDM] ([MaPDM], [MaMon], [Soluong]) VALUES (N'PDM190602006', 2, 2)
INSERT [dbo].[ChiTietPDM] ([MaPDM], [MaMon], [Soluong]) VALUES (N'PDM190603001', 5, 1)
INSERT [dbo].[ChiTietPDM] ([MaPDM], [MaMon], [Soluong]) VALUES (N'PDM190603003', 2, 3)
INSERT [dbo].[ChiTietPDM] ([MaPDM], [MaMon], [Soluong]) VALUES (N'PDM190603002', 2, 3)
INSERT [dbo].[ChiTietPDM] ([MaPDM], [MaMon], [Soluong]) VALUES (N'PDM190603002', 4, 2)
INSERT [dbo].[ChiTietPDM] ([MaPDM], [MaMon], [Soluong]) VALUES (N'PDM190603004', 2, 2)
INSERT [dbo].[ChiTietPDM] ([MaPDM], [MaMon], [Soluong]) VALUES (N'PDM190603004', 3, 3)
INSERT [dbo].[ChiTietPDM] ([MaPDM], [MaMon], [Soluong]) VALUES (N'PDM190603005', 1, 2)
INSERT [dbo].[ChiTietPDM] ([MaPDM], [MaMon], [Soluong]) VALUES (N'PDM190603007', 1, 2)
INSERT [dbo].[ChiTietPDM] ([MaPDM], [MaMon], [Soluong]) VALUES (N'PDM190603007', 3, 5)
INSERT [dbo].[ChiTietPDM] ([MaPDM], [MaMon], [Soluong]) VALUES (N'PDM190603008', 1, 4)
INSERT [dbo].[ChiTietPDM] ([MaPDM], [MaMon], [Soluong]) VALUES (N'PDM190603008', 9, 2)
INSERT [dbo].[ChiTietPDM] ([MaPDM], [MaMon], [Soluong]) VALUES (N'PDM190603003', 8, 3)
INSERT [dbo].[ChiTietPDM] ([MaPDM], [MaMon], [Soluong]) VALUES (N'PDM190603006', 1, 2)
INSERT [dbo].[ChiTietPDM] ([MaPDM], [MaMon], [Soluong]) VALUES (N'PDM190603010', 2, 3)
INSERT [dbo].[ChiTietPDM] ([MaPDM], [MaMon], [Soluong]) VALUES (N'PDM190603005', 2, 2)
INSERT [dbo].[ChiTietPDM] ([MaPDM], [MaMon], [Soluong]) VALUES (N'PDM190603006', 2, 4)
INSERT [dbo].[ChiTietPDM] ([MaPDM], [MaMon], [Soluong]) VALUES (N'PDM190602002', 3, 5)
INSERT [dbo].[ChiTietPDM] ([MaPDM], [MaMon], [Soluong]) VALUES (N'PDM190602007', 3, 1)
INSERT [dbo].[ChiTietPDM] ([MaPDM], [MaMon], [Soluong]) VALUES (N'PDM190603003', 3, 2)
INSERT [dbo].[ChiTietPDM] ([MaPDM], [MaMon], [Soluong]) VALUES (N'PDM190603002', 3, 1)
INSERT [dbo].[ChiTietPDM] ([MaPDM], [MaMon], [Soluong]) VALUES (N'PDM190603007', 2, 2)
INSERT [dbo].[ChiTietPDM] ([MaPDM], [MaMon], [Soluong]) VALUES (N'PDM190603009', 2, 3)
INSERT [dbo].[ChiTietPDM] ([MaPDM], [MaMon], [Soluong]) VALUES (N'PDM190602005', 3, 4)
INSERT [dbo].[ChiTietPDM] ([MaPDM], [MaMon], [Soluong]) VALUES (N'PDM190603002', 1, 1)
INSERT [dbo].[ChiTietPDM] ([MaPDM], [MaMon], [Soluong]) VALUES (N'PDM190603005', 3, 3)
INSERT [dbo].[ChiTietPDM] ([MaPDM], [MaMon], [Soluong]) VALUES (N'PDM190603006', 3, 5)
INSERT [dbo].[ChiTietPDM] ([MaPDM], [MaMon], [Soluong]) VALUES (N'PDM190603008', 8, 3)
INSERT [dbo].[ChiTietPDM] ([MaPDM], [MaMon], [Soluong]) VALUES (N'PDM190603008', 2, 2)
INSERT [dbo].[ChiTietPDM] ([MaPDM], [MaMon], [Soluong]) VALUES (N'PDM190603003', 1, 3)
INSERT [dbo].[ChiTietPDM] ([MaPDM], [MaMon], [Soluong]) VALUES (N'PDM190602003', 2, 3)
INSERT [dbo].[ChiTietPDM] ([MaPDM], [MaMon], [Soluong]) VALUES (N'PDM190602007', 2, 4)
INSERT [dbo].[ChiTietPDM] ([MaPDM], [MaMon], [Soluong]) VALUES (N'PDM190602004', 2, 5)
INSERT [dbo].[ChiTietPDM] ([MaPDM], [MaMon], [Soluong]) VALUES (N'PDM190603001', 4, 3)
INSERT [dbo].[ChiTietPDM] ([MaPDM], [MaMon], [Soluong]) VALUES (N'PDM190603004', 1, 3)
INSERT [dbo].[HoaDon] ([MaHD], [MaPDM], [LapHD], [MaNV], [TinhTrang]) VALUES (N'MHD190602001', N'PDM190602002', CAST(N'2019-06-02T13:09:00' AS SmallDateTime), N'NV23051901', 1)
INSERT [dbo].[HoaDon] ([MaHD], [MaPDM], [LapHD], [MaNV], [TinhTrang]) VALUES (N'MHD190602002', N'PDM190602001', CAST(N'2019-06-02T13:09:00' AS SmallDateTime), N'NV23051901', 1)
INSERT [dbo].[HoaDon] ([MaHD], [MaPDM], [LapHD], [MaNV], [TinhTrang]) VALUES (N'MHD190602003', N'PDM190602003', CAST(N'2019-06-02T13:09:00' AS SmallDateTime), N'NV23051901', 1)
INSERT [dbo].[HoaDon] ([MaHD], [MaPDM], [LapHD], [MaNV], [TinhTrang]) VALUES (N'MHD190602004', N'PDM190602006', CAST(N'2019-06-02T13:10:00' AS SmallDateTime), N'NV23051901', 1)
INSERT [dbo].[HoaDon] ([MaHD], [MaPDM], [LapHD], [MaNV], [TinhTrang]) VALUES (N'MHD190603001', N'PDM190603001', CAST(N'2019-06-03T15:45:00' AS SmallDateTime), N'NV23051901', 1)
INSERT [dbo].[HoaDon] ([MaHD], [MaPDM], [LapHD], [MaNV], [TinhTrang]) VALUES (N'MHD190603002', N'PDM190602004', CAST(N'2019-06-03T21:35:00' AS SmallDateTime), N'NV23051901', 1)
INSERT [dbo].[HoaDon] ([MaHD], [MaPDM], [LapHD], [MaNV], [TinhTrang]) VALUES (N'MHD190603003', N'PDM190602007', CAST(N'2019-06-03T21:38:00' AS SmallDateTime), N'NV23051901', 1)
INSERT [dbo].[HoaDon] ([MaHD], [MaPDM], [LapHD], [MaNV], [TinhTrang]) VALUES (N'MHD190603004', N'PDM190603003', CAST(N'2019-06-03T21:39:00' AS SmallDateTime), N'NV23051901', 1)
INSERT [dbo].[HoaDon] ([MaHD], [MaPDM], [LapHD], [MaNV], [TinhTrang]) VALUES (N'MHD190603005', N'PDM190602005', CAST(N'2019-06-03T21:40:00' AS SmallDateTime), N'NV23051901', 1)
INSERT [dbo].[HoaDon] ([MaHD], [MaPDM], [LapHD], [MaNV], [TinhTrang]) VALUES (N'MHD190603006', N'PDM190603004', CAST(N'2019-06-03T21:41:00' AS SmallDateTime), N'NV23051901', 1)
INSERT [dbo].[HoaDon] ([MaHD], [MaPDM], [LapHD], [MaNV], [TinhTrang]) VALUES (N'MHD190603007', N'PDM190603002', CAST(N'2019-06-03T21:41:00' AS SmallDateTime), N'NV23051901', 1)
INSERT [dbo].[HoaDon] ([MaHD], [MaPDM], [LapHD], [MaNV], [TinhTrang]) VALUES (N'MHD190603008', N'PDM190603005', CAST(N'2019-06-03T21:42:00' AS SmallDateTime), N'NV23051901', 1)
INSERT [dbo].[HoaDon] ([MaHD], [MaPDM], [LapHD], [MaNV], [TinhTrang]) VALUES (N'MHD190603009', N'PDM190603006', CAST(N'2019-06-03T21:42:00' AS SmallDateTime), N'NV23051901', 1)
INSERT [dbo].[HoaDon] ([MaHD], [MaPDM], [LapHD], [MaNV], [TinhTrang]) VALUES (N'MHD190603010', N'PDM190603007', CAST(N'2019-06-03T21:43:00' AS SmallDateTime), N'NV23051901', 1)
INSERT [dbo].[HoaDon] ([MaHD], [MaPDM], [LapHD], [MaNV], [TinhTrang]) VALUES (N'MHD190603011', N'PDM190603008', CAST(N'2019-06-03T21:44:00' AS SmallDateTime), N'NV23051901', 1)
SET IDENTITY_INSERT [dbo].[LoaiMon] ON 

INSERT [dbo].[LoaiMon] ([MaLoaiMon], [TenLoaiMon], [Mota], [TinhTrang]) VALUES (1, N'Trà sữa', NULL, 1)
INSERT [dbo].[LoaiMon] ([MaLoaiMon], [TenLoaiMon], [Mota], [TinhTrang]) VALUES (2, N'Cafe', NULL, 1)
INSERT [dbo].[LoaiMon] ([MaLoaiMon], [TenLoaiMon], [Mota], [TinhTrang]) VALUES (3, N'Món chính', NULL, 1)
INSERT [dbo].[LoaiMon] ([MaLoaiMon], [TenLoaiMon], [Mota], [TinhTrang]) VALUES (4, N'Đồ ăn kèm', NULL, 1)
INSERT [dbo].[LoaiMon] ([MaLoaiMon], [TenLoaiMon], [Mota], [TinhTrang]) VALUES (5, N'Nước có cồn', NULL, 1)
INSERT [dbo].[LoaiMon] ([MaLoaiMon], [TenLoaiMon], [Mota], [TinhTrang]) VALUES (6, N'Nước ngọt', N'', 1)
SET IDENTITY_INSERT [dbo].[LoaiMon] OFF
SET IDENTITY_INSERT [dbo].[Mon] ON 

INSERT [dbo].[Mon] ([MaMon], [MaLoaiMon], [TenMon], [Gia], [Mota], [TinhTrang]) VALUES (1, 1, N'Trà sữa bạc hà', 15000, NULL, 1)
INSERT [dbo].[Mon] ([MaMon], [MaLoaiMon], [TenMon], [Gia], [Mota], [TinhTrang]) VALUES (2, 1, N'Trà sữa ô long', 20000, NULL, 1)
INSERT [dbo].[Mon] ([MaMon], [MaLoaiMon], [TenMon], [Gia], [Mota], [TinhTrang]) VALUES (3, 1, N'Trà sữa socola', 17000, NULL, 1)
INSERT [dbo].[Mon] ([MaMon], [MaLoaiMon], [TenMon], [Gia], [Mota], [TinhTrang]) VALUES (4, 2, N'Cafe sài gòn', 20000, NULL, 1)
INSERT [dbo].[Mon] ([MaMon], [MaLoaiMon], [TenMon], [Gia], [Mota], [TinhTrang]) VALUES (5, 2, N'Cafe rang xay', 12000, NULL, 1)
INSERT [dbo].[Mon] ([MaMon], [MaLoaiMon], [TenMon], [Gia], [Mota], [TinhTrang]) VALUES (6, 2, N'Cafe sữa rang xay', 15000, NULL, 1)
INSERT [dbo].[Mon] ([MaMon], [MaLoaiMon], [TenMon], [Gia], [Mota], [TinhTrang]) VALUES (7, 2, N'Cafe sữa sài gòn', 25000, NULL, 1)
INSERT [dbo].[Mon] ([MaMon], [MaLoaiMon], [TenMon], [Gia], [Mota], [TinhTrang]) VALUES (8, 3, N'Xôi ếch', 40000, NULL, 1)
INSERT [dbo].[Mon] ([MaMon], [MaLoaiMon], [TenMon], [Gia], [Mota], [TinhTrang]) VALUES (9, 3, N'Thịt nướng nguyên tảng', 140000, NULL, 1)
INSERT [dbo].[Mon] ([MaMon], [MaLoaiMon], [TenMon], [Gia], [Mota], [TinhTrang]) VALUES (10, 3, N'Thịt bò Cobe', 220000, NULL, 1)
SET IDENTITY_INSERT [dbo].[Mon] OFF
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [NamSinh], [GioiTinh], [SDT], [NgayLap]) VALUES (N'NV23051901', N'Lê Nguyễn Hoài Huy', CAST(N'1998-08-04T00:00:00' AS SmallDateTime), 1, N'0788362644', CAST(N'2019-05-23T14:56:00' AS SmallDateTime))
INSERT [dbo].[PhieuDatMon] ([MaPDM], [NgayLap], [MaNV], [MaBan], [TinhTrang], [ThanhTien], [GiamGia], [PhuThu], [MangVe]) VALUES (N'PDM190602001', CAST(N'2019-06-02T13:09:00' AS SmallDateTime), N'NV23051901', 1, 1, 620000, 0, 0, 1)
INSERT [dbo].[PhieuDatMon] ([MaPDM], [NgayLap], [MaNV], [MaBan], [TinhTrang], [ThanhTien], [GiamGia], [PhuThu], [MangVe]) VALUES (N'PDM190602002', CAST(N'2019-06-02T13:09:00' AS SmallDateTime), N'NV23051901', 2, 1, 125000, 0, 0, 1)
INSERT [dbo].[PhieuDatMon] ([MaPDM], [NgayLap], [MaNV], [MaBan], [TinhTrang], [ThanhTien], [GiamGia], [PhuThu], [MangVe]) VALUES (N'PDM190602003', CAST(N'2019-06-02T13:09:00' AS SmallDateTime), N'NV23051901', 6, 1, 179000, 0, 0, 1)
INSERT [dbo].[PhieuDatMon] ([MaPDM], [NgayLap], [MaNV], [MaBan], [TinhTrang], [ThanhTien], [GiamGia], [PhuThu], [MangVe]) VALUES (N'PDM190602004', CAST(N'2019-06-02T13:09:00' AS SmallDateTime), N'NV23051901', 7, 0, 134000, 0, 0, 1)
INSERT [dbo].[PhieuDatMon] ([MaPDM], [NgayLap], [MaNV], [MaBan], [TinhTrang], [ThanhTien], [GiamGia], [PhuThu], [MangVe]) VALUES (N'PDM190602005', CAST(N'2019-06-02T13:09:00' AS SmallDateTime), N'NV23051901', 8, 1, 128000, 0, 0, 1)
INSERT [dbo].[PhieuDatMon] ([MaPDM], [NgayLap], [MaNV], [MaBan], [TinhTrang], [ThanhTien], [GiamGia], [PhuThu], [MangVe]) VALUES (N'PDM190602006', CAST(N'2019-06-02T13:09:00' AS SmallDateTime), N'NV23051901', 16, 1, 40000, 0, 0, 1)
INSERT [dbo].[PhieuDatMon] ([MaPDM], [NgayLap], [MaNV], [MaBan], [TinhTrang], [ThanhTien], [GiamGia], [PhuThu], [MangVe]) VALUES (N'PDM190602007', CAST(N'2019-06-02T13:10:00' AS SmallDateTime), N'NV23051901', 1, 1, 97000, 0, 0, 1)
INSERT [dbo].[PhieuDatMon] ([MaPDM], [NgayLap], [MaNV], [MaBan], [TinhTrang], [ThanhTien], [GiamGia], [PhuThu], [MangVe]) VALUES (N'PDM190603001', CAST(N'2019-06-03T15:45:00' AS SmallDateTime), N'NV23051901', 2, 1, 72000, 0, 0, 1)
INSERT [dbo].[PhieuDatMon] ([MaPDM], [NgayLap], [MaNV], [MaBan], [TinhTrang], [ThanhTien], [GiamGia], [PhuThu], [MangVe]) VALUES (N'PDM190603002', CAST(N'2019-06-03T15:45:00' AS SmallDateTime), N'NV23051901', 2, 0, 37000, 0, 0, 1)
INSERT [dbo].[PhieuDatMon] ([MaPDM], [NgayLap], [MaNV], [MaBan], [TinhTrang], [ThanhTien], [GiamGia], [PhuThu], [MangVe]) VALUES (N'PDM190603003', CAST(N'2019-06-03T21:39:00' AS SmallDateTime), N'NV23051901', 1, 1, 259000, 0, 0, 1)
INSERT [dbo].[PhieuDatMon] ([MaPDM], [NgayLap], [MaNV], [MaBan], [TinhTrang], [ThanhTien], [GiamGia], [PhuThu], [MangVe]) VALUES (N'PDM190603004', CAST(N'2019-06-03T21:41:00' AS SmallDateTime), N'NV23051901', 7, 1, 136000, 0, 0, 1)
INSERT [dbo].[PhieuDatMon] ([MaPDM], [NgayLap], [MaNV], [MaBan], [TinhTrang], [ThanhTien], [GiamGia], [PhuThu], [MangVe]) VALUES (N'PDM190603005', CAST(N'2019-06-03T21:42:00' AS SmallDateTime), N'NV23051901', 1, 1, 121000, 0, 0, 1)
INSERT [dbo].[PhieuDatMon] ([MaPDM], [NgayLap], [MaNV], [MaBan], [TinhTrang], [ThanhTien], [GiamGia], [PhuThu], [MangVe]) VALUES (N'PDM190603006', CAST(N'2019-06-03T21:42:00' AS SmallDateTime), N'NV23051901', 1, 0, 195000, 0, 0, 1)
INSERT [dbo].[PhieuDatMon] ([MaPDM], [NgayLap], [MaNV], [MaBan], [TinhTrang], [ThanhTien], [GiamGia], [PhuThu], [MangVe]) VALUES (N'PDM190603007', CAST(N'2019-06-03T21:43:00' AS SmallDateTime), N'NV23051901', 1, 1, 155000, 0, 0, 1)
INSERT [dbo].[PhieuDatMon] ([MaPDM], [NgayLap], [MaNV], [MaBan], [TinhTrang], [ThanhTien], [GiamGia], [PhuThu], [MangVe]) VALUES (N'PDM190603008', CAST(N'2019-06-03T21:44:00' AS SmallDateTime), N'NV23051901', 18, 1, 500000, 0, 0, 1)
INSERT [dbo].[PhieuDatMon] ([MaPDM], [NgayLap], [MaNV], [MaBan], [TinhTrang], [ThanhTien], [GiamGia], [PhuThu], [MangVe]) VALUES (N'PDM190603009', CAST(N'2019-06-03T21:46:00' AS SmallDateTime), N'NV23051901', 2, 1, 60000, 0, 0, 1)
INSERT [dbo].[PhieuDatMon] ([MaPDM], [NgayLap], [MaNV], [MaBan], [TinhTrang], [ThanhTien], [GiamGia], [PhuThu], [MangVe]) VALUES (N'PDM190603010', CAST(N'2019-06-03T21:46:00' AS SmallDateTime), N'NV23051901', 7, 0, 60000, 0, 0, 1)
INSERT [dbo].[TaiKhoan] ([MaTaiKhoan], [MatKhau], [CapDo], [MaNV]) VALUES (N'admin', N'admin', 0, N'NV23051901')
ALTER TABLE [dbo].[Audit_Ban] ADD  DEFAULT (getdate()) FOR [AUDIT_TIME]
GO
ALTER TABLE [dbo].[Audit_ChiTietPDM] ADD  DEFAULT (getdate()) FOR [AUDIT_TIME]
GO
ALTER TABLE [dbo].[Audit_HoaDon] ADD  DEFAULT (getdate()) FOR [AUDIT_TIME]
GO
ALTER TABLE [dbo].[Audit_LoaiMon] ADD  DEFAULT (getdate()) FOR [AUDIT_TIME]
GO
ALTER TABLE [dbo].[Audit_Mon] ADD  DEFAULT (getdate()) FOR [AUDIT_TIME]
GO
ALTER TABLE [dbo].[Audit_NhanVien] ADD  DEFAULT (getdate()) FOR [AUDIT_TIME]
GO
ALTER TABLE [dbo].[Audit_PhieuDatMon] ADD  DEFAULT (getdate()) FOR [AUDIT_TIME]
GO
ALTER TABLE [dbo].[Audit_TaiKhoan] ADD  DEFAULT (getdate()) FOR [AUDIT_TIME]
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
/****** Object:  StoredProcedure [dbo].[Ban_ChonAll]    Script Date: 2019-06-03 10:45:44 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Ban_ChonTai]    Script Date: 2019-06-03 10:45:44 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Ban_Count]    Script Date: 2019-06-03 10:45:44 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Ban_Sua]    Script Date: 2019-06-03 10:45:44 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Ban_Them]    Script Date: 2019-06-03 10:45:44 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Ban_Xoa]    Script Date: 2019-06-03 10:45:44 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ChiTietPDM_ChonAll]    Script Date: 2019-06-03 10:45:44 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ChiTietPDM_ChonTai]    Script Date: 2019-06-03 10:45:44 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ChiTietPDM_ChonTai_Mon]    Script Date: 2019-06-03 10:45:44 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ChiTietPDM_Sua]    Script Date: 2019-06-03 10:45:44 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ChiTietPDM_Them]    Script Date: 2019-06-03 10:45:44 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ChiTietPDM_Xoa]    Script Date: 2019-06-03 10:45:44 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ChiTietPDM_XoaTai]    Script Date: 2019-06-03 10:45:44 PM ******/
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
/****** Object:  StoredProcedure [dbo].[HoaDon_ChonAll]    Script Date: 2019-06-03 10:45:44 PM ******/
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
	--@MaHD char(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT        dbo.HoaDon.MaHD, dbo.HoaDon.MaPDM ,dbo.HoaDon.LapHD, dbo.HoaDon.MaNV, dbo.PhieuDatMon.MaBan, dbo.PhieuDatMon.ThanhTien - dbo.PhieuDatMon.GiamGia * dbo.PhieuDatMon.ThanhTien + dbo.PhieuDatMon.PhuThu AS TongTien
FROM            dbo.HoaDon INNER JOIN
                         dbo.PhieuDatMon ON dbo.HoaDon.MaPDM = dbo.PhieuDatMon.MaPDM
					ORDER BY dbo.HoaDon.MaHD DESC
--WHERE @MaHD = MaHD;
END
GO
/****** Object:  StoredProcedure [dbo].[HoaDon_Them]    Script Date: 2019-06-03 10:45:44 PM ******/
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
		SELECT @NOW = (select RIGHT(substring(CONVERT(VARCHAR(10),GETDATE(),103),7,4),2) 
		 + substring(CONVERT(VARCHAR(10),GETDATE(),103),4,2) 
		 + substring(CONVERT(VARCHAR(10),GETDATE(),103),1,2)
		);
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
		SELECT @DATE;
		SELECT @NOW;
    -- Insert statements for procedure here
	INSERT INTO [dbo].[HoaDon]
           ([MaHD]
		   ,[MaPDM]
		   ,[MaNV])
     VALUES
           (@MaID,@MaPDM,@MaNV)
END
GO
/****** Object:  StoredProcedure [dbo].[InHoaDonTai]    Script Date: 2019-06-03 10:45:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InHoaDonTai]
	-- Add the parameters for the stored procedure here
	(@MaHD char(12))
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT        dbo.HoaDon.MaHD, dbo.HoaDon.LapHD, dbo.HoaDon.MaNV, dbo.PhieuDatMon.MaBan, dbo.ChiTietPDM.MaMon, dbo.ChiTietPDM.Soluong, dbo.Mon.Gia, dbo.ChiTietPDM.Soluong * dbo.Mon.Gia AS Tien, 
                         dbo.PhieuDatMon.ThanhTien, dbo.PhieuDatMon.GiamGia, dbo.PhieuDatMon.PhuThu, dbo.PhieuDatMon.ThanhTien - dbo.PhieuDatMon.GiamGia * dbo.PhieuDatMon.ThanhTien + dbo.PhieuDatMon.PhuThu AS [Tổng Tiền]
	FROM            dbo.HoaDon INNER JOIN
							 dbo.PhieuDatMon ON dbo.HoaDon.MaPDM = dbo.PhieuDatMon.MaPDM INNER JOIN
							 dbo.ChiTietPDM ON dbo.PhieuDatMon.MaPDM = dbo.ChiTietPDM.MaPDM INNER JOIN
							 dbo.Mon ON dbo.ChiTietPDM.MaMon = dbo.Mon.MaMon
	WHERE MaHD=@MaHD
	GROUP BY dbo.HoaDon.MaHD, dbo.HoaDon.LapHD, dbo.HoaDon.MaNV, dbo.ChiTietPDM.MaPDM, dbo.ChiTietPDM.MaMon, dbo.ChiTietPDM.Soluong, dbo.ChiTietPDM.Soluong * dbo.Mon.Gia, dbo.Mon.Gia, dbo.PhieuDatMon.ThanhTien, 
							 dbo.PhieuDatMon.GiamGia, dbo.PhieuDatMon.PhuThu, dbo.PhieuDatMon.ThanhTien - dbo.PhieuDatMon.GiamGia * dbo.PhieuDatMon.ThanhTien + dbo.PhieuDatMon.PhuThu, dbo.PhieuDatMon.MaBan
	ORDER BY  dbo.HoaDon.MaHD DESC
	END
GO
/****** Object:  StoredProcedure [dbo].[LoaiMon_ChonAll]    Script Date: 2019-06-03 10:45:44 PM ******/
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
/****** Object:  StoredProcedure [dbo].[LoaiMon_ChonTai]    Script Date: 2019-06-03 10:45:44 PM ******/
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
/****** Object:  StoredProcedure [dbo].[LoaiMon_Them]    Script Date: 2019-06-03 10:45:44 PM ******/
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
/****** Object:  StoredProcedure [dbo].[LoaiMon_Xoa]    Script Date: 2019-06-03 10:45:44 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Mon_CapNhap]    Script Date: 2019-06-03 10:45:44 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Mon_ChonAll]    Script Date: 2019-06-03 10:45:44 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Mon_ChonAll_where_LoaiMon]    Script Date: 2019-06-03 10:45:44 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Mon_ChonAll_where_LoaiMon_ADMIN]    Script Date: 2019-06-03 10:45:44 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Mon_ChonTai]    Script Date: 2019-06-03 10:45:44 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Mon_Search]    Script Date: 2019-06-03 10:45:44 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Mon_Them]    Script Date: 2019-06-03 10:45:44 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Mon_Xoa]    Script Date: 2019-06-03 10:45:44 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NhanVien_ChonAll]    Script Date: 2019-06-03 10:45:44 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NhanVien_ChonTai]    Script Date: 2019-06-03 10:45:44 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NhanVien_DemPDM]    Script Date: 2019-06-03 10:45:44 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NhanVien_Sua]    Script Date: 2019-06-03 10:45:44 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NhanVien_Sua_TaiKhoan]    Script Date: 2019-06-03 10:45:44 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NhanVien_Them]    Script Date: 2019-06-03 10:45:44 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NhanVien_Them_TaiKhoan]    Script Date: 2019-06-03 10:45:44 PM ******/
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
	SELECT @NOW = (select RIGHT(substring(CONVERT(VARCHAR(10),GETDATE(),103),7,4),2) 
		 + substring(CONVERT(VARCHAR(10),GETDATE(),103),4,2) 
		 + substring(CONVERT(VARCHAR(10),GETDATE(),103),1,2)
		);
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
/****** Object:  StoredProcedure [dbo].[NhanVien_Xoa]    Script Date: 2019-06-03 10:45:44 PM ******/
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
	DELETE FROM [dbo].[TaiKhoan]
	WHERE [MaNV] = @MaNV
	DELETE FROM [dbo].[NhanVien]
	WHERE [MaNV] = @MaNV

	
END
GO
/****** Object:  StoredProcedure [dbo].[PhieuDatMon_ChonAll]    Script Date: 2019-06-03 10:45:44 PM ******/
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
/****** Object:  StoredProcedure [dbo].[PhieuDatMon_ChonTai]    Script Date: 2019-06-03 10:45:44 PM ******/
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
/****** Object:  StoredProcedure [dbo].[PhieuDatMon_ChonTai_Ban]    Script Date: 2019-06-03 10:45:44 PM ******/
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
/****** Object:  StoredProcedure [dbo].[PhieuDatMon_Sua]    Script Date: 2019-06-03 10:45:44 PM ******/
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
/****** Object:  StoredProcedure [dbo].[PhieuDatMon_Sua_MaBan]    Script Date: 2019-06-03 10:45:44 PM ******/
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
/****** Object:  StoredProcedure [dbo].[PhieuDatMon_Them]    Script Date: 2019-06-03 10:45:44 PM ******/
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
		SELECT @NOW = (select RIGHT(substring(CONVERT(VARCHAR(10),GETDATE(),103),7,4),2) 
		 + substring(CONVERT(VARCHAR(10),GETDATE(),103),4,2) 
		 + substring(CONVERT(VARCHAR(10),GETDATE(),103),1,2)
		);
		--Lấy thời gian cao nhất trong hệ thống
		SET @DATE= SUBSTRING((SELECT MAX(MaPDM) FROM dbo.[PhieuDatMon]),4,6);
		if(@DATE = @NOW)
			SET @MaID=RIGHT((SELECT MAX(MaPDM) FROM dbo.[PhieuDatMon]),2);
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
/****** Object:  StoredProcedure [dbo].[PhieuDatMon_Xoa]    Script Date: 2019-06-03 10:45:44 PM ******/
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
/****** Object:  StoredProcedure [dbo].[TaiKhoan_ChonAll]    Script Date: 2019-06-03 10:45:44 PM ******/
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
/****** Object:  StoredProcedure [dbo].[TaiKhoan_ChonTai]    Script Date: 2019-06-03 10:45:44 PM ******/
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
/****** Object:  StoredProcedure [dbo].[TaiKhoan_Sua]    Script Date: 2019-06-03 10:45:44 PM ******/
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
		  ,[MaNV] = @MaNV
	 WHERE [MaTaiKhoan]=@MaTaiKhoan
END
GO
/****** Object:  StoredProcedure [dbo].[TaiKhoan_SuaThongTin]    Script Date: 2019-06-03 10:45:44 PM ******/
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
/****** Object:  StoredProcedure [dbo].[TaiKhoan_Them]    Script Date: 2019-06-03 10:45:44 PM ******/
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
/****** Object:  StoredProcedure [dbo].[TaiKhoan_Xoa]    Script Date: 2019-06-03 10:45:44 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ThonTinPDM_ChonTai]    Script Date: 2019-06-03 10:45:44 PM ******/
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
