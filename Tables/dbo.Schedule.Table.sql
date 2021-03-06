USE [ReportServer]
GO
/****** Object:  Table [dbo].[Schedule]    Script Date: 08/11/2020 00:10:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedule](
	[ScheduleID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](260) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[Flags] [int] NOT NULL,
	[NextRunTime] [datetime] NULL,
	[LastRunTime] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[RecurrenceType] [int] NULL,
	[MinutesInterval] [int] NULL,
	[DaysInterval] [int] NULL,
	[WeeksInterval] [int] NULL,
	[DaysOfWeek] [int] NULL,
	[DaysOfMonth] [int] NULL,
	[Month] [int] NULL,
	[MonthlyWeek] [int] NULL,
	[State] [int] NULL,
	[LastRunStatus] [nvarchar](260) NULL,
	[ScheduledRunTimeout] [int] NULL,
	[CreatedById] [uniqueidentifier] NOT NULL,
	[EventType] [nvarchar](260) NOT NULL,
	[EventData] [nvarchar](260) NULL,
	[Type] [int] NOT NULL,
	[ConsistancyCheck] [datetime] NULL,
	[Path] [nvarchar](260) NULL,
 CONSTRAINT [PK_ScheduleID] PRIMARY KEY CLUSTERED 
(
	[ScheduleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_Schedule] UNIQUE NONCLUSTERED 
(
	[Name] ASC,
	[Path] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Schedule] DISABLE CHANGE_TRACKING
GO
ALTER TABLE [dbo].[Schedule]  WITH NOCHECK ADD  CONSTRAINT [FK_Schedule_Users] FOREIGN KEY([CreatedById])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Schedule_Users]
GO
