USE [ReportServer]
GO
/****** Object:  StoredProcedure [dbo].[DeleteExpiredPersistedStreams]    Script Date: 08/11/2020 00:10:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteExpiredPersistedStreams]
AS
SET NOCOUNT OFF
SET DEADLOCK_PRIORITY LOW
DELETE
    [ReportServerTempDB].dbo.PersistedStream
FROM 
    (SELECT TOP 1 * FROM [ReportServerTempDB].dbo.PersistedStream PS2 WHERE PS2.RefCount = 0 AND GETDATE() > PS2.ExpirationDate) AS e1
WHERE 
    e1.SessionID = [ReportServerTempDB].dbo.PersistedStream.[SessionID] AND
    e1.[Index] = [ReportServerTempDB].dbo.PersistedStream.[Index]
GO
