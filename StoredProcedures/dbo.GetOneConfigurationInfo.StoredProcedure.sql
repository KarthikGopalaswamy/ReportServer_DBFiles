USE [ReportServer]
GO
/****** Object:  StoredProcedure [dbo].[GetOneConfigurationInfo]    Script Date: 08/11/2020 00:10:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetOneConfigurationInfo]
@Name nvarchar (260)
AS
SELECT [Value]
FROM [ConfigurationInfo]
WHERE [Name] = @Name
GO
