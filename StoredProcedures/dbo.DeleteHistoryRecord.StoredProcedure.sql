USE [ReportServer]
GO
/****** Object:  StoredProcedure [dbo].[DeleteHistoryRecord]    Script Date: 08/11/2020 00:10:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- delete one historical snapshot
CREATE PROCEDURE [dbo].[DeleteHistoryRecord]
@ReportID uniqueidentifier,
@SnapshotDate DateTime
AS
SET NOCOUNT OFF
DELETE
FROM History
WHERE ReportID = @ReportID AND SnapshotDate = @SnapshotDate
GO
