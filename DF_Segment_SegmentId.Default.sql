USE [ReportServer]
GO
/****** Object:  Default [DF_Segment_SegmentId]    Script Date: 08/11/2020 00:10:30 ******/
ALTER TABLE [dbo].[Segment] ADD  CONSTRAINT [DF_Segment_SegmentId]  DEFAULT (newsequentialid()) FOR [SegmentId]
GO
