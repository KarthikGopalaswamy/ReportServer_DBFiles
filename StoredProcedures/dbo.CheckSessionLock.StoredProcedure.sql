USE [ReportServer]
GO
/****** Object:  StoredProcedure [dbo].[CheckSessionLock]    Script Date: 08/11/2020 00:10:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CheckSessionLock]
@SessionID as varchar(32)
AS
DECLARE @Selected nvarchar(32)
SELECT @Selected=SessionID FROM [ReportServerTempDB].dbo.SessionLock WITH (ROWLOCK) WHERE SessionID = @SessionID
GO
