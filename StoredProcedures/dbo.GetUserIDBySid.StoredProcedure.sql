USE [ReportServer]
GO
/****** Object:  StoredProcedure [dbo].[GetUserIDBySid]    Script Date: 08/11/2020 00:10:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- looks up any user name by its SID, if not it creates a regular user
CREATE PROCEDURE [dbo].[GetUserIDBySid]
@UserSid varbinary(85),
@UserName nvarchar(260),
@AuthType int,
@UserID uniqueidentifier OUTPUT
AS
SELECT @UserID = (SELECT UserID FROM Users WHERE Sid = @UserSid AND AuthType = @AuthType)
IF @UserID IS NULL
   BEGIN
      SET @UserID = newid()
      INSERT INTO Users
      (UserID, Sid, UserType, AuthType, UserName)
      VALUES 
      (@UserID, @UserSid, 0, @AuthType, @UserName)
   END
GO
