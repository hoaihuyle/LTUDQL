DECLARE @MaID char(12);
DECLARE @DATE char(6);
DECLARE @NOW char(6);
DECLARE @ID int;
--Lấy thời gian  hiện tại
SELECT @NOW = (select substring(CONVERT(VARCHAR(10),GETDATE(),103),1,2) + substring(CONVERT(VARCHAR(10),GETDATE(),103),4,2) +
RIGHT(substring(CONVERT(VARCHAR(10),GETDATE(),103),7,4),2));
--Lấy thời gian cao nhất trong hệ thống
SET @DATE= SUBSTRING((SELECT MAX(MaPDM) FROM dbo.[PhieuDatMon]),4,6);
if(@DATE = @NOW)
BEGIN
 SET @MaID=RIGHT((SELECT MAX(MaPDM) FROM dbo.[PhieuDatMon]),2);
END
else
SET @MaID=0;

SET @ID=CAST(@MaID as int) + 1;
if(@ID<10)
SET @MaID='PDM'+@NOW+'0'+Convert(char(4),@ID);
else
SET @MaID='PDM'+@NOW+Convert(char(4),@ID);
