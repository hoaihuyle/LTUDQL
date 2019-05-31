--trigger
--LoaiHang
create trigger trg_Insert_LoaiHang
on LoaiHang
for Insert 
as
insert into Audit_LoaiHang select *,'I',GETDATE() from inserted
GO

create trigger trg_Update_LoaiHang
on LoaiHang
for Update
as
insert into Audit_LoaiHang select *,'U',GETDATE() from deleted
GO

create trigger trg_Delete_LoaiHang
on LoaiHang
for Update
as
insert into Audit_LoaiHang select *,'D',GETDATE() from deleted
GO
--Khach Hang	
create trigger trg_Insert_KhachHang
on KhachHang	
for Insert 
as
insert into Audit_KhachHang select *,'I',GETDATE() from inserted
GO

create trigger trg_Update_KhachHang
on KhachHang
for Update
as
insert into Audit_KhachHang select *,'U',GETDATE() from deleted
GO

create trigger trg_Delete_KhachHang
on KhachHang
for Update
as
insert into Audit_KhachHang select *,'D',GETDATE() from deleted
GO
--Nhan Vien
create trigger trg_Insert_NhanVien
on NhanVien			
for Insert 
as
insert into Audit_NhanVien select *,'I',GETDATE() from inserted
GO

create trigger trg_Update_NhanVien
on NhanVien
for Update
as
insert into Audit_NhanVien select *,'U',GETDATE() from deleted
GO

create trigger trg_Delete_NhanVien
on NhanVien
for Update
as
insert into Audit_NhanVien select *,'D',GETDATE() from deleted
GO
--Hoa Don
create trigger trg_Insert_HoaDon
on HoaDon	
for Insert 
as
insert into Audit_HoaDon select *,'I',GETDATE() from inserted
GO

create trigger trg_Update_HoaDon
on HoaDon
for Update
as
insert into Audit_HoaDon select *,'U',GETDATE() from deleted
GO

create trigger trg_Delete_HoaDon
on HoaDon
for Update
as
insert into Audit_HoaDon select *,'D',GETDATE() from deleted
GO
--CTHD
create trigger trg_Insert_CTHD
on CTHD	
for Insert 
as
insert into Audit_CTHD select *,'I',GETDATE() from inserted
GO

create trigger trg_Update_CTHD
on CTHD
for Update
as
insert into Audit_CTHD select *,'U',GETDATE() from deleted
GO

create trigger trg_Delete_CTHD
on CTHD
for Update
as
insert into Audit_CTHD select *,'D',GETDATE() from deleted
GO

--Hang Hoa
create trigger trg_Insert_HangHoa
on HangHoa
for Insert 
as
insert into Audit_HangHoa select *,'I',GETDATE() from inserted
GO

create trigger trg_Update_HangHoa
on HangHoa
for Update
as
insert into Audit_HangHoa select *,'U',GETDATE() from deleted
GO

create trigger trg_Delete_HangHoa
on HangHoa
for Delete
as
insert into Audit_HangHoa select *,'D',GETDATE() from deleted
GO