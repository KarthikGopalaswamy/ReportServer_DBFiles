USE [ReportServer]
GO
/****** Object:  Trigger [ReportSchedule_Schedule]    Script Date: 08/11/2020 00:10:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[ReportSchedule_Schedule] ON [dbo].[ReportSchedule]
AFTER DELETE
AS

-- if the deleted row is the last connection between a schedule and a report delete the schedule
-- as long as the schedule is not a shared schedule (type == 0)
delete [Schedule] from 
    [Schedule] S inner join deleted D on S.[ScheduleID] = D.[ScheduleID] 
where
    S.[Type] != 0 and
    not exists (select * from [ReportSchedule] R where S.[ScheduleID] = R.[ScheduleID])
GO
