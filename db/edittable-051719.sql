/****** Object:  Table [dbo].[ChiTietPDM]    Script Date: 5/16/2019 10:49:32 AM ******/
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
/****** Object:  Table [dbo].[HoaDon]    Script Date: 5/16/2019 10:49:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHD] [char](11) NOT NULL,
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


/****** Object:  Table [dbo].[NhanVien]    Script Date: 5/16/2019 10:49:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [char](10) NOT NULL,
	[TenNV] [nvarchar](50) NOT NULL,
	[NamSinh] [smalldatetime] NULL,
	[GioiTinh] [bit] NULL,
	[SDT] [nvarchar](20) NOT NULL,
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
/****** Object:  Table [dbo].[PhieuDatMon]    Script Date: 5/16/2019 10:49:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuDatMon](
	[MaPDM] [char](12) NOT NULL,
	[NgayLap] [smalldatetime] NOT NULL,
	[MaNV] [char](10) NOT NULL,
	[MaBan] [int] NOT NULL,
	[TinhTrang] [bit] NOT NULL,
	[ThanhTien] [int] NULL,
	[GiamGia] [float] NULL,
	[PhuThu] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPDM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 5/16/2019 10:49:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[MaTaiKhoan] [char](10) NOT NULL,
	[MatKhau] [nvarchar](100) NOT NULL,
	[CapDo] [int] NOT NULL,
	[MaNV] [char](10) NOT NULL,
	--QL/NV + ddmmyy01
PRIMARY KEY CLUSTERED 
(
	[MaTaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[HoaDon] ADD  DEFAULT (getdate()) FOR [LapHD]
GO
ALTER TABLE [dbo].[HoaDon] ADD  CONSTRAINT [DF_HoaDon_TinhTrang]  DEFAULT ((0)) FOR [TinhTrang]
GO
GO
ALTER TABLE [dbo].[NhanVien] ADD  DEFAULT (getdate()) FOR [NgayLap]
GO
ALTER TABLE [dbo].[TaiKhoan] ADD  DEFAULT ((0)) FOR [CapDo]
GO
ALTER TABLE [dbo].[ChiTietPDM]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietPDM_PhieuDatMon] FOREIGN KEY([MaPDM])
REFERENCES [dbo].[PhieuDatMon] ([MaPDM])
GO
ALTER TABLE [dbo].[ChiTietPDM] CHECK CONSTRAINT [FK_ChiTietPDM_PhieuDatMon]
GO
ALTER TABLE [dbo].[ChiTietPDM]  WITH CHECK ADD  CONSTRAINT [FK_MonInChiTietPDM] FOREIGN KEY([MaMon])
REFERENCES [dbo].[Mon] ([MaMon])
GO
ALTER TABLE [dbo].[ChiTietPDM] CHECK CONSTRAINT [FK_MonInChiTietPDM]
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
USE [master]
GO
ALTER DATABASE [totodb] SET  READ_WRITE 
GO