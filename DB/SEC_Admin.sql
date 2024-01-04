CREATE PROCEDURE [dbo].[SEC_Admin_Dashboard]
AS
DECLARE @ProductCount int
SELECT @ProductCount = COUNT([dbo].[MST_Product].[ProductID]) FROM [dbo].[MST_Product]

DECLARE @ActiveUserCount int
SELECT @ActiveUserCount = COUNT([dbo].[SEC_User].[UserID]) FROM [dbo].[SEC_User] WHERE [dbo].[SEC_User].[isActive]=1 AND [dbo].[SEC_User].[isAdmin]=0

DECLARE @CategoryCount int
SELECT @CategoryCount = COUNT([dbo].[Category].[CategoryID]) FROM [dbo].[Category]

DECLARE @OrderCount int
SELECT @OrderCount = COUNT([dbo].[Order].[OrderID]) FROM [dbo].[Order]

SELECT	@ProductCount as ProductCount,
		@ActiveUserCount as UserCount,
		@CategoryCount as CategoryCount,
		@OrderCount as OrderCount


