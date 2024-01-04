-- Product SelectAll
ALTER PROCEDURE [dbo].[Product_SelectAll]
AS

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

Where [dbo].[MST_Product].[isActive] = 1

ORDER BY [dbo].[MST_Product].[ProductName]

--Product Select By ID

CREATE PROCEDURE [dbo].[Product_SelectByID]
@ProductID int
AS

SELECT	[dbo].[MST_Product].[ProductID], 
		[dbo].[MST_Product].[ProductName], 
		[dbo].[MST_Product].[Discription], 
		[dbo].[MST_Product].[Price],
		[dbo].[MST_Product].[Code],
		[dbo].[MST_Product].[DisplayImage],
		[dbo].[MST_Product].[CategoryID],
		[dbo].[MST_Product].[isActive],
		[dbo].[MST_Product].[Discount],
		[dbo].[MST_Product].[Rating],
		[dbo].[MST_Product].[Created],
		[dbo].[MST_Product].[Modified]

FROM [dbo].[MST_Product]

Where [dbo].[MST_Product].[ProductID] = @ProductID

--Insert Product
ALTER PROCEDURE [dbo].[Product_Insert]
	@ProductID		int, 
	@ProductName	varchar(100),
	@Discription	varchar(500),
	@Price			decimal(12,2),
	@Code			varchar(100),
	@DisplayImage	varchar(500),
	@CategoryID		int,
	@isActive		bit,
	@Discount		int,
	@Rating			int, 
	@Created		datetime,
	@Modified		datetime
AS

INSERT INTO [dbo].[MST_Product]
(
	[ProductID], 
	[ProductName], 
	[Discription], 
	[Price],
	[Code],
	[DisplayImage],
	[CategoryID],
	[isActive],
	[Discount],
	[Rating],
	[Created],
	[Modified]
)
VALUES
(
		@ProductID,		
		@ProductName,	
		@Discription,	
		@Price,			
		@Code,			
		@DisplayImage,	
		@CategoryID,		
		ISNULL(@isActive,1),		
		@Discount,
		@Rating,
		ISNULL(@Created,getdate()),	
		ISNULL(@Modified,getdate())	
)

--Product Update
ALTER PROCEDURE [dbo].[Product_Update]
@ProductID		int, 
@ProductName	varchar(100),
@Discription	varchar(500),
@Price			decimal(12,2),
@Code			varchar(100),
@DisplayImage	varchar(500),
@CategoryID		int,
@Discount		int, 
@Modified		datetime,
@Rating			int

AS
UPDATE [dbo].[MST_Product]

SET [ProductName]	=  @ProductName,	
	[Discription]	=  @Discription,	
	[Price]			=  @Price,			
	[Code]			=  @Code,			
	[DisplayImage]	=  @DisplayImage,	
	[CategoryID]	=  @CategoryID,				
	[Discount]		=  @Discount,	
	[Rating]		=  @Rating,	
	[Modified]		=  ISNULL(@Modified,getdate())	
	
WHERE [dbo].[MST_Product].[ProductID] = @ProductID 

--Product Delete
CREATE PROCEDURE [dbo].[Product_Delete]
@ProductID	int

AS
UPDATE [dbo].[MST_Product]

SET [isActive] = 0	
	
WHERE [dbo].[MST_Product].[ProductID] = @ProductID
