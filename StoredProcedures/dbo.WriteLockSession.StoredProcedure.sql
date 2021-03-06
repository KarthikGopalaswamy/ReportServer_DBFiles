USE [ReportServer]
GO
/****** Object:  StoredProcedure [dbo].[WriteLockSession]    Script Date: 08/11/2020 00:10:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WriteLockSession]
@SessionID as varchar(32),
@Persisted bit
AS
	SET NOCOUNT OFF ; 
	IF @Persisted = 1
	BEGIN
		UPDATE [ReportServerTempDB].dbo.SessionLock WITH (ROWLOCK)
		SET SessionID = SessionID
		WHERE SessionID = @SessionID ;
	END
	ELSE
	BEGIN
		INSERT INTO [ReportServerTempDB].dbo.SessionLock WITH (ROWLOCK) (SessionID) VALUES (@SessionID)
	END
GO
