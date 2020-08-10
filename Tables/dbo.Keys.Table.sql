USE [ReportServer]
GO
/****** Object:  Table [dbo].[Keys]    Script Date: 08/11/2020 00:10:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Keys](
	[MachineName] [nvarchar](256) NULL,
	[InstallationID] [uniqueidentifier] NOT NULL,
	[InstanceName] [nvarchar](32) NULL,
	[Client] [int] NOT NULL,
	[PublicKey] [image] NULL,
	[SymmetricKey] [image] NULL,
 CONSTRAINT [PK_Keys] PRIMARY KEY CLUSTERED 
(
	[InstallationID] ASC,
	[Client] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Keys] DISABLE CHANGE_TRACKING
GO
