USE [ECommerce]
GO
/****** Object:  StoredProcedure [dbo].[SEC_UserDetails_SelectByPK]    Script Date: 22-02-2024 21:19:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SEC_UserDetails_SelectByPK]
@UserID INT
AS
SELECT
[dbo].[SEC_User].[UserID],
[dbo].[SEC_User].[FirstName],
[dbo].[SEC_User].[LastName],
[dbo].[SEC_User].[EmailAddress]
FROM [dbo].[SEC_User]
WHERE [dbo].[SEC_User].[isAdmin] = 0 AND [dbo].[SEC_User].[UserID] = @UserID
GO
