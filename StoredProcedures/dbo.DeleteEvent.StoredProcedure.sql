USE [ReportServer]
GO
/****** Object:  StoredProcedure [dbo].[DeleteEvent]    Script Date: 08/11/2020 00:10:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteEvent] 
@ID uniqueidentifier
AS
delete from [Event] where [EventID] = @ID
GO
