USE [ReportServer]
GO
/****** Object:  StoredProcedure [dbo].[ObjectExists]    Script Date: 08/11/2020 00:10:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ObjectExists]
@Path nvarchar (425),
@AuthType int
AS
SELECT Type, ItemID, SnapshotLimit, NtSecDescPrimary, ExecutionFlag, Intermediate, [LinkSourceID]
FROM Catalog
LEFT OUTER JOIN SecData
ON Catalog.PolicyID = SecData.PolicyID AND SecData.AuthType = @AuthType
WHERE Path = @Path
GO
