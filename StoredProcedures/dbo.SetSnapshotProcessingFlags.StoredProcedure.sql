USE [ReportServer]
GO
/****** Object:  StoredProcedure [dbo].[SetSnapshotProcessingFlags]    Script Date: 08/11/2020 00:10:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SetSnapshotProcessingFlags]
@SnapshotDataID as uniqueidentifier, 
@IsPermanentSnapshot as bit, 
@ProcessingFlags int
AS

if @IsPermanentSnapshot = 1 
BEGIN
	UPDATE SnapshotData
	SET ProcessingFlags = @ProcessingFlags
	WHERE SnapshotDataID = @SnapshotDataID
END ELSE BEGIN
	UPDATE [ReportServerTempDB].dbo.SnapshotData
	SET ProcessingFlags = @ProcessingFlags
	WHERE SnapshotDataID = @SnapshotDataID
END
GO
