USE [ECommerce]
GO
/****** Object:  StoredProcedure [dbo].[Pending_Order_SelectAll]    Script Date: 22-02-2024 21:19:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[Pending_Order_SelectAll]
AS
SELECT 
[dbo].[SEC_User].[FirstName],
[dbo].[Order].[OrderID],
[dbo].[Order].[OrderStatus],
[dbo].[Order].[Created],
[dbo].[Order].[Modified],
[dbo].[MST_Product].[Price]*[dbo].[Order].[Quantity] AS Price
FROM [dbo].[SEC_User]
INNER JOIN [dbo].[Order]
ON [dbo].[SEC_User].[UserID] = [dbo].[Order].[UserID]
INNER JOIN [dbo].[MST_Product]
ON [dbo].[Order].[ProductID] = [dbo].[MST_Product].[ProductID]
--INNER JOIN [dbo].[Cart]
--ON [dbo].[Order].[ProductID] = [dbo].[Cart].[ProductID]
WHERE [dbo].[Order].[isCompleted] = 0
GO
