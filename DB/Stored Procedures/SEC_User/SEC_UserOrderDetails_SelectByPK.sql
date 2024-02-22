USE [ECommerce]
GO
/****** Object:  StoredProcedure [dbo].[SEC_User_SelectByPK]    Script Date: 03-02-2024 10:50:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SEC_UserOrderDetails_SelectByPK]
@UserID INT
AS
SELECT
[dbo].[Order].[OrderID],
[dbo].[Order].[OrderStatus],
[dbo].[Order].[Created],
[dbo].[MST_Product].[ProductID],
[dbo].[MST_Product].[Price]
FROM [dbo].[SEC_User]
INNER JOIN [dbo].[Order]
ON [dbo].[SEC_User].[UserID] = [dbo].[Order].[UserID]
INNER JOIN [dbo].[MST_Product]
ON [dbo].[MST_Product].[ProductID] = [dbo].[Order].[ProductID]
WHERE [dbo].[SEC_User].[isAdmin] = 0 AND [dbo].[SEC_User].[UserID] = @UserID
ORDER BY [dbo].[Order].[OrderID]
GO
