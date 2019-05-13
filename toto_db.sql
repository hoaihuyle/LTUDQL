use [toto_db];

CREATE TABLE NhanVien(
	MaNV char(10) NOT NULL PRIMARY KEY,
	TenNV nvarchar(50) NOT NULL, 
	NamSinh smalldatetime,
	GioiTinh bit,
	SoDienThoai nvarchar(10)

);

CREATE TABLE Mon (
    MaMon int IDENTITY(1,1) PRIMARY KEY ,
	TenMon varchar(10),
	Gia float,
    Mota varchar(50) ,
	TinhTrang bit,
);
CREATE TABLE LoaiMon (
    MaLoaiMon int IDENTITY(1,1) PRIMARY KEY ,
	MaMon int NOT NULL,
	TenLoaiMon varchar(10) NOT NULL,
    Mota varchar(50),
	TinhTrang bit,
    CONSTRAINT FK_Mon_LoaiMon FOREIGN KEY (MaMon)
	REFERENCES Mon(MaMon)
);
CREATE TABLE Ban (
    MaBan int IDENTITY(1,1) PRIMARY KEY,
	TinhTrang bit,
	BanGop int
);
CREATE TABLE HoaDon(
	MaHD char(10) NOT NULL PRIMARY KEY,
	MaNV char(10) NOT NULL,
	LapHD smalldatetime NOT NULL DEFAULT GETDATE(),
	ThanhTien float,
	GiamGia float
	CONSTRAINT FK_PDM_NV FOREIGN KEY (MaNV)
	REFERENCES NhanVien(MaNV),
	CONSTRAINT FK_HoaDon_NV FOREIGN KEY (MaNV)
	REFERENCES NhanVien(MaNV)
);



CREATE TABLE TaiKhoan(
	MaTaiKhoan char(10),
	MatKhau nvarchar(100),
	CapDo int,
	MaNV char(10) NOT NULL,
	CONSTRAINT FK_Taikhoan_NV FOREIGN KEY (MaNV)
	REFERENCES NhanVien(MaNV)
)
CREATE TABLE PhieuDatMon (
    MaPDM int NOT NULL PRIMARY KEY ,
	NgayLap smalldatetime NOT NULL DEFAULT GETDATE() ,
	MaBan int NOT NULL,
	MaHD char(10) NULL,
	TinhTrang bit,
	CONSTRAINT FK_PDM_Ban FOREIGN KEY (MaBan)
	REFERENCES Ban(MaBan),
	CONSTRAINT FK_PDM_HoaDon FOREIGN KEY (MaHD)
	REFERENCES HoaDon(MaHD)
);

CREATE TABLE ChiTietPDM (
    MaPDM int NOT NULL ,
	MaMon int NOT NULL,
	Soluong smallint,
    CONSTRAINT FK_Mon_ChiTietPDM FOREIGN KEY (MaMon)
	REFERENCES Mon(MaMon),
	CONSTRAINT FK_PDM FOREIGN KEY (MaPDM)
	REFERENCES PhieuDatMon(MaPDM)
);






