USE [ReportServer]
GO
/****** Object:  StoredProcedure [dbo].[GetAndHoldLockActiveSubscription]    Script Date: 08/11/2020 00:10:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAndHoldLockActiveSubscription]
@ActiveID uniqueidentifier
AS

select 
    TotalNotifications, 
    TotalSuccesses, 
    TotalFailures 
from 
    ActiveSubscriptions with (XLOCK)
where
    ActiveID = @ActiveID
GO
