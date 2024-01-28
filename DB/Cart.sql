-- INSERT CART
ALTER PROCEDURE [Cart_Insert]
@ProductID		INT,
@UserID			INT,
@Quantity		INT,
@Created		DATETIME,
@Modified		DATETIME
AS
INSERT INTO [dbo].[Cart]
(
	[ProductID],
	[UserID],
	[Quantity],
	[Created],
	[Modified]
)
VALUES
(
	@ProductID,
	@UserID,
	ISNULL(@Quantity,1),	
	ISNULL(@Created,getdate()),	
	ISNULL(@Modified,getdate())
)

-- Increment Quantity

exec Increment_Quantity 18

ALTER PROCEDURE [Increment_Quantity]
@ProductID		INT
AS
UPDATE [dbo].[Cart]
SET [Quantity] = [Quantity] + 1
WHERE [dbo].[Cart].[ProductID] = @ProductID

-- Decrement Quantity
ALTER PROCEDURE [Decrement_Quantity]
@ProductID		INT
AS
UPDATE [dbo].[Cart]
SET [Quantity] = [Quantity] - 1
WHERE [dbo].[Cart].[ProductID] = @ProductID

--Cart Select All
ALTER PROCEDURE [Cart_SelectAll]
AS
DECLARE @CartTotal int
SELECT @CartTotal = SUM([dbo].[MST_Product].[Price] * [dbo].[Cart].[Quantity])
FROM [dbo].[MST_Product]
INNER JOIN [dbo].[Cart] ON [dbo].[Cart].[ProductID] = [dbo].[MST_Product].[ProductID];

SELECT
@CartTotal as CartTotal,
[dbo].[Cart].[CartID],
[dbo].[MST_Product].[ProductID],
[dbo].[MST_Product].[DisplayImage],
[dbo].[MST_Product].[ProductName],
[dbo].[MST_Product].[Price],
[dbo].[Cart].[Quantity]
FROM [dbo].[Cart]
INNER JOIN [dbo].[MST_Product]
ON [dbo].[MST_Product].[ProductID] = [dbo].[Cart].[ProductID]

-- Remove Cart Product
ALTER PROCEDURE [Remove_Cart_Product]
@ProductID	INT
AS
DELETE FROM [dbo].[Cart]
WHERE [dbo].[Cart].[ProductID] = @ProductID

--Cart Count
ALTER PROCEDURE [CartCount]
@UserID		INT
AS
SELECT
COUNT([dbo].[Cart].[CartID]) AS TotalCartItems
FROM [dbo].[Cart]
WHERE [dbo].[Cart].[UserID] = @UserID

SELECT  

SELECT * FROM Cart

SELECT * FROM MST_Product