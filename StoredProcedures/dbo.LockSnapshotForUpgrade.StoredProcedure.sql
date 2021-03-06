USE [ReportServer]
GO
/****** Object:  StoredProcedure [dbo].[LockSnapshotForUpgrade]    Script Date: 08/11/2020 00:10:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LockSnapshotForUpgrade]
@SnapshotDataID as uniqueidentifier,
@IsPermanentSnapshot as bit
AS
if @IsPermanentSnapshot = 1
BEGIN
   SELECT ChunkName from ChunkData with (XLOCK)
   WHERE SnapshotDataID = @SnapshotDataID
END ELSE BEGIN
   SELECT ChunkName from [ReportServerTempDB].dbo.ChunkData with (XLOCK)
   WHERE SnapshotDataID = @SnapshotDataID
END
GO
