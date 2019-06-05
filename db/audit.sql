
CREATE TABLE [dbo].[Audit_Ban](
	[MaBan] [int]  NOT NULL,
	[TinhTrang] [int] NOT NULL,
	[BanGop] [int] NULL,
	[AUDIT_TYPE] [varchar](50),
	[AUDIT_TIME] [Datetime]  DEFAULT (getdate()),
)
GO
CREATE TABLE [dbo].[Audit_ChiTietPDM](
	[MaPDM] [char](12) NOT NULL,
	[MaMon] [int] NOT NULL,
	[Soluong] [smallint] NOT NULL,
		[AUDIT_TYPE] [varchar](50),
	[AUDIT_TIME] [Datetime]  DEFAULT (getdate()),
)
GO
CREATE TABLE [dbo].[Audit_HoaDon](
	[MaHD] [char](12) NOT NULL,
	[MaPDM] [char](12) NOT NULL,
	[LapHD] [smalldatetime] NOT NULL,
	[MaNV] [char](10) NOT NULL,
	[TinhTrang] [bit] NOT NULL,
		[AUDIT_TYPE] [varchar](50),
	[AUDIT_TIME] [Datetime]  DEFAULT (getdate()),
)
GO
CREATE TABLE [dbo].[Audit_LoaiMon](
	[MaLoaiMon] [int]  NOT NULL,
	[TenLoaiMon] [nvarchar](50) NOT NULL,
	[Mota] [nvarchar](50) NULL,
	[TinhTrang] [bit] NOT NULL,
		[AUDIT_TYPE] [varchar](50),
	[AUDIT_TIME] [Datetime]  DEFAULT (getdate()),
)
GO
CREATE TABLE [dbo].[Audit_Mon](
	[MaMon] [int] NOT NULL,
	[MaLoaiMon] [int] NOT NULL,
	[TenMon] [nvarchar](50) NOT NULL,
	[Gia] [float] NULL,
	[Mota] [nvarchar](500) NULL,
	[TinhTrang] [bit] NOT NULL,
	[AUDIT_TYPE] [varchar](50),
	[AUDIT_TIME] [Datetime]  DEFAULT (getdate()),
)
GO
CREATE TABLE [dbo].[Audit_NhanVien](
	[MaNV] [char](10) NOT NULL,
	[TenNV] [nvarchar](50) NOT NULL,
	[NamSinh] [smalldatetime] NULL,
	[GioiTinh] [bit] NULL,
	[SDT] [nvarchar](10) NOT NULL,
	[NgayLap] [smalldatetime] NOT NULL,
	[AUDIT_TYPE] [varchar](50),
	[AUDIT_TIME] [Datetime]  DEFAULT (getdate()),
)
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
		[AUDIT_TYPE] [varchar](50),
	[AUDIT_TIME] [Datetime]  DEFAULT (getdate()),
)
CREATE TABLE [dbo].[Audit_TaiKhoan](
	[MaTaiKhoan] [varchar](50) NOT NULL,
	[MatKhau] [nvarchar](100) NOT NULL,
	[CapDo] [int] NOT NULL,
	[MaNV] [char](10) NOT NULL,
		[AUDIT_TYPE] [varchar](50),
	[AUDIT_TIME] [Datetime]  DEFAULT (getdate()),
)