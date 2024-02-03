USE [ECommerce]
GO
/****** Object:  StoredProcedure [dbo].[SEC_User_SelectALL]    Script Date: 03-02-2024 10:50:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SEC_User_SelectALL]
AS
SELECT
[dbo].[SEC_User].[UserID],
[dbo].[SEC_User].[FirstName],
[dbo].[SEC_User].[LastName],
[dbo].[SEC_User].[EmailAddress],
[dbo].[SEC_User].[isActive],
[dbo].[SEC_User].[Created]
FROM [dbo].[SEC_User]
WHERE [dbo].[SEC_User].[isAdmin] = 0
GO
