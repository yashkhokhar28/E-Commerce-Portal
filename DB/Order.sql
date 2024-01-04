-- Order Select All
ALTER PROCEDURE [dbo].[Order_SelectAll]
AS
SELECT 
[dbo].[SEC_User].[FirstName],
[dbo].[Order].[OrderID],
[dbo].[Order].[OrderStatus],
[dbo].[Order].[Created],
[dbo].[Order].[Modified],
[dbo].[MST_Product].[Price]
FROM [dbo].[SEC_User]
INNER JOIN 
[dbo].[Address]
ON [dbo].[SEC_User].[UserID] = [dbo].[Address].[UserID]
INNER JOIN [dbo].[Order]
ON [dbo].[SEC_User].[UserID] = [dbo].[Order].[UserID]
INNER JOIN [dbo].[MST_Product]
ON [dbo].[Order].[ProductID] = [dbo].[MST_Product].[ProductID]