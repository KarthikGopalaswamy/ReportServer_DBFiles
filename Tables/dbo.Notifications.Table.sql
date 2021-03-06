USE [ReportServer]
GO
/****** Object:  Table [dbo].[Notifications]    Script Date: 08/11/2020 00:10:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notifications](
	[NotificationID] [uniqueidentifier] NOT NULL,
	[SubscriptionID] [uniqueidentifier] NOT NULL,
	[ActivationID] [uniqueidentifier] NULL,
	[ReportID] [uniqueidentifier] NOT NULL,
	[SnapShotDate] [datetime] NULL,
	[ExtensionSettings] [ntext] NOT NULL,
	[Locale] [nvarchar](128) NOT NULL,
	[Parameters] [ntext] NULL,
	[ProcessStart] [datetime] NULL,
	[NotificationEntered] [datetime] NOT NULL,
	[ProcessAfter] [datetime] NULL,
	[Attempt] [int] NULL,
	[SubscriptionLastRunTime] [datetime] NOT NULL,
	[DeliveryExtension] [nvarchar](260) NOT NULL,
	[SubscriptionOwnerID] [uniqueidentifier] NOT NULL,
	[IsDataDriven] [bit] NOT NULL,
	[BatchID] [uniqueidentifier] NULL,
	[ProcessHeartbeat] [datetime] NULL,
	[Version] [int] NOT NULL,
 CONSTRAINT [PK_Notifications] PRIMARY KEY CLUSTERED 
(
	[NotificationID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Notifications] DISABLE CHANGE_TRACKING
GO
ALTER TABLE [dbo].[Notifications]  WITH NOCHECK ADD  CONSTRAINT [FK_Notifications_Subscriptions] FOREIGN KEY([SubscriptionID])
REFERENCES [dbo].[Subscriptions] ([SubscriptionID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Notifications] CHECK CONSTRAINT [FK_Notifications_Subscriptions]
GO
