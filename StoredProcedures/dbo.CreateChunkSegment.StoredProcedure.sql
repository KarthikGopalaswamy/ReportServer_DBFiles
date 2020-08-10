USE [ReportServer]
GO
/****** Object:  StoredProcedure [dbo].[CreateChunkSegment]    Script Date: 08/11/2020 00:10:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[CreateChunkSegment]
	@SnapshotId			uniqueidentifier,	
	@IsPermanent		bit, 
	@ChunkId			uniqueidentifier,
	@Content			varbinary(max) = 0x0,
	@StartByte			bigint, 
	@Length				int = 0,
	@LogicalByteCount	int = 0,
	@SegmentId			uniqueidentifier out
as begin
	declare @output table (SegmentId uniqueidentifier, ActualByteCount int) ;
	declare @ActualByteCount int ;
	if(@IsPermanent = 1) begin	
		insert Segment(Content) 
		output inserted.SegmentId, datalength(inserted.Content) into @output
		values (substring(@Content, 1, @Length)) ;
		
		select top 1    @SegmentId = SegmentId, 
		                @ActualByteCount = ActualByteCount
		from @output ;
		
		insert ChunkSegmentMapping(ChunkId, SegmentId, StartByte, LogicalByteCount, ActualByteCount)
		values (@ChunkId, @SegmentId, @StartByte, @LogicalByteCount, @ActualByteCount) ;
	end
	else begin
		insert [ReportServerTempDB].dbo.Segment(Content) 
		output inserted.SegmentId, datalength(inserted.Content) into @output
		values (substring(@Content, 1, @Length)) ;
		
		select top 1    @SegmentId = SegmentId, 
		                @ActualByteCount = ActualByteCount
		from @output ;
		
		insert [ReportServerTempDB].dbo.ChunkSegmentMapping(ChunkId, SegmentId, StartByte, LogicalByteCount, ActualByteCount)
		values (@ChunkId, @SegmentId, @StartByte, @LogicalByteCount, @ActualByteCount) ;
	end
end
GO
