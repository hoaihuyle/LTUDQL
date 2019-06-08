use [totodb];
Go
create trigger trg_Insert_TaiKhoan
on TaiKhoan
for Insert 
as
insert into Audit_TaiKhoan select *,'I',GETDATE() from inserted
GO

create trigger trg_Update_TaiKhoan
on TaiKhoan
for Update
as
insert into Audit_TaiKhoan select *,'U',GETDATE() from deleted
GO

create trigger trg_Delete_TaiKhoan
on TaiKhoan
for Delete
as
insert into Audit_TaiKhoan select *,'D',GETDATE() from deleted
GO