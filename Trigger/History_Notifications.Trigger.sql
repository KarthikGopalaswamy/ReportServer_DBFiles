USE [ReportServer]
GO
/****** Object:  Trigger [History_Notifications]    Script Date: 08/11/2020 00:10:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[History_Notifications] ON [dbo].[History]  
AFTER INSERT
AS 
   insert
      into [dbo].[Event]
      ([EventID], [EventType], [EventData], [TimeEntered]) 
      select NewID(), 'ReportHistorySnapshotCreated', inserted.[HistoryID], GETUTCDATE()
   from inserted
GO
