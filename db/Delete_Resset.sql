 DELETE FROM [dbo].[LoaiMon]
 WHERE [MaLoaiMon] = 5
 DECLARE @ID int;
 SET @ID = 5 -1;


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
ELSE
DBCC CHECKIDENT ('LoaiMon'), RESEED, @ID);

