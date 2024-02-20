CREATE PROCEDURE [dbo].[ProductFilter]
@CategoryID	INT = NULL,
@ProductName VARCHAR(100) = NULL

As
SELECT	[dbo].[MST_Product].[ProductID], 
		[dbo].[MST_Product].[ProductName], 
		[dbo].[MST_Product].[Discription], 
		[dbo].[MST_Product].[Price],
		[dbo].[MST_Product].[Code],
		[dbo].[MST_Product].[DisplayImage],
		[dbo].[MST_Product].[isActive],
		[dbo].[MST_Product].[Discount],
		[dbo].[MST_Product].[Rating],
		[dbo].[MST_Product].[Created],
		[dbo].[MST_Product].[Modified],
		[dbo].[Category].[CategoryID],
		[dbo].[Category].[CategoryName]

FROM [dbo].[MST_Product] 
INNER JOIN [dbo].[Category]
ON [dbo].[MST_Product].[CategoryID] = [dbo].[Category].[CategoryID]

Where [dbo].[MST_Product].[isActive] = 1 AND
(@CategoryID IS NULL OR [dbo].[Category].[CategoryID] = @CategoryID) AND
(@ProductName IS NULL OR [ProductName] LIKE CONCAT('%',@ProductName,'%')) 

ORDER BY [dbo].[MST_Product].[ProductName]


