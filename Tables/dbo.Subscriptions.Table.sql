USE [ReportServer]
GO
/****** Object:  Table [dbo].[Subscriptions]    Script Date: 08/11/2020 00:10:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subscriptions](
	[SubscriptionID] [uniqueidentifier] NOT NULL,
	[OwnerID] [uniqueidentifier] NOT NULL,
	[Report_OID] [uniqueidentifier] NOT NULL,
	[Locale] [nvarchar](128) NOT NULL,
	[InactiveFlags] [int] NOT NULL,
	[ExtensionSettings] [ntext] NULL,
	[ModifiedByID] [uniqueidentifier] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[Description] [nvarchar](512) NULL,
	[LastStatus] [nvarchar](260) NULL,
	[EventType] [nvarchar](260) NOT NULL,
	[MatchData] [ntext] NULL,
	[LastRunTime] [datetime] NULL,
	[Parameters] [ntext] NULL,
	[DataSettings] [ntext] NULL,
	[DeliveryExtension] [nvarchar](260) NULL,
	[Version] [int] NOT NULL,
 CONSTRAINT [PK_Subscriptions] PRIMARY KEY CLUSTERED 
(
	[SubscriptionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Subscriptions] DISABLE CHANGE_TRACKING
GO
ALTER TABLE [dbo].[Subscriptions]  WITH NOCHECK ADD  CONSTRAINT [FK_Subscriptions_Catalog] FOREIGN KEY([Report_OID])
REFERENCES [dbo].[Catalog] ([ItemID])
ON DELETE CASCADE
NOT FOR REPLICATION
GO
ALTER TABLE [dbo].[Subscriptions] CHECK CONSTRAINT [FK_Subscriptions_Catalog]
GO
ALTER TABLE [dbo].[Subscriptions]  WITH NOCHECK ADD  CONSTRAINT [FK_Subscriptions_ModifiedBy] FOREIGN KEY([ModifiedByID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Subscriptions] CHECK CONSTRAINT [FK_Subscriptions_ModifiedBy]
GO
ALTER TABLE [dbo].[Subscriptions]  WITH NOCHECK ADD  CONSTRAINT [FK_Subscriptions_Owner] FOREIGN KEY([OwnerID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Subscriptions] CHECK CONSTRAINT [FK_Subscriptions_Owner]
GO
