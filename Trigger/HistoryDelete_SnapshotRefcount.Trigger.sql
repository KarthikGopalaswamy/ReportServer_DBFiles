USE [ReportServer]
GO
/****** Object:  Trigger [HistoryDelete_SnapshotRefcount]    Script Date: 08/11/2020 00:10:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[HistoryDelete_SnapshotRefcount] ON [dbo].[History] 
AFTER DELETE
AS
   UPDATE [dbo].[SnapshotData]
   SET [PermanentRefcount] = [PermanentRefcount] - 1
   FROM [SnapshotData] SD INNER JOIN deleted D on SD.[SnapshotDataID] = D.[SnapshotDataID]
GO
