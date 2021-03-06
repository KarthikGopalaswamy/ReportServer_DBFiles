USE [ReportServer]
GO
/****** Object:  StoredProcedure [dbo].[ReadLockSnapshot]    Script Date: 08/11/2020 00:10:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ReadLockSnapshot]
@SnapshotDataID as uniqueidentifier
AS
SELECT SnapshotDataID
FROM
   SnapshotData WITH (REPEATABLEREAD, ROWLOCK)
WHERE
   SnapshotDataID = @SnapshotDataID
GO
