USE [ReportServer]
GO
/****** Object:  StoredProcedure [dbo].[CreateNewSnapshotVersion]    Script Date: 08/11/2020 00:10:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateNewSnapshotVersion]
	@OldSnapshotId UNIQUEIDENTIFIER, 
	@NewSnapshotId UNIQUEIDENTIFIER,
	@IsPermanentSnapshot BIT, 
	@Machine NVARCHAR(512)
AS
BEGIN
	IF(@IsPermanentSnapshot = 1) BEGIN	
		INSERT [dbo].[SnapshotData] (
			SnapshotDataId, 
			CreatedDate, 
			ParamsHash, 
			QueryParams, 
			EffectiveParams, 
			Description, 
			DependsOnUser, 
			PermanentRefCount, 
			TransientRefCount, 
			ExpirationDate, 
			PageCount, 
			HasDocMap, 
			PaginationMode, 
			ProcessingFlags
			)
		SELECT 
			@NewSnapshotId,
			[sn].CreatedDate, 
			[sn].ParamsHash,
			[sn].QueryParams, 
			[sn].EffectiveParams, 
			[sn].Description, 
			[sn].DependsOnUser, 	
			0,
			1,		-- always create with transient refcount of 1
			[sn].ExpirationDate,
			[sn].PageCount, 
			[sn].HasDocMap, 
			[sn].PaginationMode,
			[sn].ProcessingFlags
		FROM [dbo].[SnapshotData] [sn] 
		WHERE [sn].SnapshotDataId = @OldSnapshotId
	END
	ELSE BEGIN	
		INSERT [ReportServerTempDB].dbo.[SnapshotData] (
			SnapshotDataId, 
			CreatedDate, 
			ParamsHash, 
			QueryParams, 
			EffectiveParams, 
			Description, 
			DependsOnUser, 
			PermanentRefCount, 
			TransientRefCount, 
			ExpirationDate, 
			PageCount, 
			HasDocMap, 
			PaginationMode, 
			ProcessingFlags,
			Machine,
			IsCached
			)
		SELECT 
			@NewSnapshotId,
			[sn].CreatedDate, 
			[sn].ParamsHash,
			[sn].QueryParams, 
			[sn].EffectiveParams, 
			[sn].Description, 
			[sn].DependsOnUser, 	
			0,
			1,		-- always create with transient refcount of 1
			[sn].ExpirationDate,
			[sn].PageCount, 
			[sn].HasDocMap, 
			[sn].PaginationMode, 
			[sn].ProcessingFlags,
			@Machine,
			[sn].IsCached
		FROM [ReportServerTempDB].dbo.[SnapshotData] [sn] 
		WHERE [sn].SnapshotDataId = @OldSnapshotId
	END
	
	EXEC [dbo].[CopyChunks] 
		@OldSnapshotId = @OldSnapshotId, 
		@NewSnapshotId = @NewSnapshotId, 
		@IsPermanentSnapshot = @IsPermanentSnapshot
END
GO
