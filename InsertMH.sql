-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE InsertMatHang
	-- Add the parameters for the stored procedure here
	(@Ma_MH char(4), 
	@Ten_MH varchar(20), 
	@Loai_MH varchar(5),
	@Tluong_MH smallint,
	@Mau_MH nvarchar(50),
	@Ton_Kho_MH smallint,
	@Gia_Mua_MH smallint,
    @Gia_Ban_MH smallint,
    @Ma_NCC char(4))
AS
BEGIN
	BEGIN TRANSACTION
		 DECLARE @MaID char(4);
		 DECLARE @ID int;
		 SELECT @MaID =(SELECT MAX(Ma_MH) FROM dbo.MAT_HANG);
		 SELECT @MaID= RIGHT(@MaID,3);
		 SELECT @ID=CAST(@MaID as int) + 1;
		 SELECT @MaID='MH'+Convert(char(4),@ID);
	COMMIT    
    -- Insert statements for procedure here
	INSERT INTO [dbo].[MAT_HANG] ( Ma_MH, Ten_MH, Loai_MH, Tluong_MH, Mau_MH, Ton_Kho_MH, Gia_Mua_MH, Gia_Ban_MH, Ma_NCC )
    VALUES (@MaID, @Ten_MH, @Loai_MH, @Tluong_MH, @Mau_MH, @Ton_Kho_MH, @Gia_Mua_MH, @Gia_Ban_MH, @Ma_NCC)
END
GO
