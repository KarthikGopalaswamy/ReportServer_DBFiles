USE [ReportServer]
GO
/****** Object:  StoredProcedure [dbo].[GetNextPortionPersistedStream]    Script Date: 08/11/2020 00:10:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetNextPortionPersistedStream]
@DataPointer binary(16),
@DataIndex int,
@Length int
AS

READTEXT [ReportServerTempDB].dbo.PersistedStream.Content @DataPointer @DataIndex @Length
GO
