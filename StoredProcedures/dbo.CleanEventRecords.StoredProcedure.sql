USE [ReportServer]
GO
/****** Object:  StoredProcedure [dbo].[CleanEventRecords]    Script Date: 08/11/2020 00:10:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CleanEventRecords] 
@MaxAgeMinutes int
AS
-- Reset all notifications which have been add over n minutes ago
Update [Event] set [ProcessStart] = NULL, [ProcessHeartbeat] = NULL
where [EventID] in
   ( SELECT [EventID]
     FROM [Event]
     WHERE [ProcessHeartbeat] < DATEADD(minute, -(@MaxAgeMinutes), GETUTCDATE()) )
GO
