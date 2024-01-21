--Pending Order Select All
CREATE PROCEDURE [dbo].[Pending_Order_SelectAll]
AS
SELECT 
[dbo].[SEC_User].[FirstName],
[dbo].[Order].[OrderID],
[dbo].[Order].[OrderStatus],
[dbo].[Order].[Created],
[dbo].[Order].[Modified],
[dbo].[MST_Product].[Price]
FROM [dbo].[SEC_User]
INNER JOIN [dbo].[Order]
ON [dbo].[SEC_User].[UserID] = [dbo].[Order].[UserID]
INNER JOIN [dbo].[MST_Product]
ON [dbo].[Order].[ProductID] = [dbo].[MST_Product].[ProductID]
WHERE [dbo].[Order].[isCompleted] = 0

--Completed Order Select All
ALTER PROCEDURE [dbo].[Completed_Order_SelectAll]
AS
SELECT 
[dbo].[SEC_User].[FirstName],
[dbo].[Order].[OrderID],
[dbo].[Order].[OrderStatus],
[dbo].[Order].[Created],
[dbo].[Order].[Completed],
[dbo].[MST_Product].[Price]
FROM [dbo].[SEC_User]
INNER JOIN [dbo].[Order]
ON [dbo].[SEC_User].[UserID] = [dbo].[Order].[UserID]
INNER JOIN [dbo].[MST_Product]
ON [dbo].[Order].[ProductID] = [dbo].[MST_Product].[ProductID]
WHERE [dbo].[Order].[isCompleted] = 1

-- OrdeySelectByPK
CREATE PROCEDURE [dbo].[Order_SelectAllByPK]
@OrderID INT
AS
SELECT 
[dbo].[SEC_User].[FirstName],
[dbo].[SEC_User].[EmailAddress],
[dbo].[Order].[OrderID],
[dbo].[Order].[OrderStatus],
[dbo].[Order].[Created],
[dbo].[Order].[Modified],
[dbo].[Address].[Address],
[dbo].[MST_Product].[DisplayImage],
[dbo].[MST_Product].[ProductName],
[dbo].[MST_Product].[Price],
[dbo].[Category].[CategoryName]
FROM [dbo].[SEC_User]
INNER JOIN [dbo].[Address]
ON [dbo].[SEC_User].[UserID] = [dbo].[Address].[UserID]
INNER JOIN [dbo].[Order]
ON [dbo].[SEC_User].[UserID] = [dbo].[Order].[UserID]
INNER JOIN [dbo].[MST_Product]
ON [dbo].[Order].[ProductID] = [dbo].[MST_Product].[ProductID]
INNER JOIN [dbo].[Category]
ON [dbo].[MST_Product].[CategoryID] = [dbo].[Category].[CategoryID]
WHERE [dbo].[Order].[OrderID] = @OrderID

-- Complete Order
ALTER PROCEDURE [dbo].[Complete_Order]
@OrderID	int

AS
UPDATE [dbo].[Order]

SET [isCompleted] = 1,
	[OrderStatus] = 'Completed'
	
WHERE [dbo].[Order].[OrderID] = @OrderID