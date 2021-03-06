USE [ReportServer]
GO
/****** Object:  Table [dbo].[ActiveSubscriptions]    Script Date: 08/11/2020 00:10:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActiveSubscriptions](
	[ActiveID] [uniqueidentifier] NOT NULL,
	[SubscriptionID] [uniqueidentifier] NOT NULL,
	[TotalNotifications] [int] NULL,
	[TotalSuccesses] [int] NOT NULL,
	[TotalFailures] [int] NOT NULL,
 CONSTRAINT [PK_ActiveSubscriptions] PRIMARY KEY CLUSTERED 
(
	[ActiveID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ActiveSubscriptions] DISABLE CHANGE_TRACKING
GO
ALTER TABLE [dbo].[ActiveSubscriptions]  WITH NOCHECK ADD  CONSTRAINT [FK_ActiveSubscriptions_Subscriptions] FOREIGN KEY([SubscriptionID])
REFERENCES [dbo].[Subscriptions] ([SubscriptionID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ActiveSubscriptions] CHECK CONSTRAINT [FK_ActiveSubscriptions_Subscriptions]
GO
