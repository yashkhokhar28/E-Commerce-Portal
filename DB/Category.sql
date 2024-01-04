-- Category SelectAll
CREATE PROCEDURE [dbo].[Category_SelectAll]
AS

SELECT	[dbo].[Category].[CategoryID], 
		[dbo].[Category].[CategoryName], 
		[dbo].[Category].[Discription], 
		[dbo].[Category].[Created],
		[dbo].[Category].[Modified]

FROM [dbo].[Category]

ORDER BY [dbo].[Category].[CategoryName]

--Category Select By ID

CREATE PROCEDURE [dbo].[Category_SelectByID]
@CategoryID int
AS

SELECT	[dbo].[Category].[CategoryID], 
		[dbo].[Category].[CategoryName], 
		[dbo].[Category].[Discription], 
		[dbo].[Category].[Created],
		[dbo].[Category].[Modified]

FROM [dbo].[Category]

Where [dbo].[Category].[CategoryID] = @CategoryID

--Insert Category
CREATE PROCEDURE [dbo].[Category_Insert]
	@CategoryName	varchar(100),
	@Discription	varchar(500),
	@Created		datetime,
	@Modified		datetime
AS

INSERT INTO [dbo].[Category]
(
	[CategoryName], 
	[Discription], 
	[Created],
	[Modified]
)
VALUES
(		
		@CategoryName,	
		@Discription,					
		ISNULL(@Created,getdate()),	
		ISNULL(@Modified,getdate())	
)

--Category Update
CREATE PROCEDURE [dbo].[Category_Update]
@CategoryID		int, 
@CategoryName	varchar(100),
@Discription	varchar(500),
@Modified		datetime

AS
UPDATE [dbo].[Category]

SET [CategoryName]	=  @CategoryName,	
	[Discription]	=  @Discription,						
	[Modified]		=  ISNULL(@Modified,getdate())	
	
WHERE [dbo].[Category].[CategoryID] = @CategoryID 

--Category Delete
CREATE PROCEDURE [dbo].[Category_Delete]
@CategoryID	int

AS
DELETE FROM [dbo].[Category]
	
WHERE [dbo].[Category].[CategoryID] = @CategoryID

--Category Dropdown
CREATE PROCEDURE [dbo].[Category_DropDown]

AS
Select	[dbo].[Category].[CategoryID],
		[dbo].[Category].[CategoryName]

FROM [dbo].[Category]


