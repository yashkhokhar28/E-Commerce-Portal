-- Insert Address
ALTER PROCEDURE [dbo].[Address_Insert]
@UserID			INT,
@Address		VARCHAR(500),
@Country		VARCHAR(50),
@State			VARCHAR(50),
@City			VARCHAR(50),
@Postal			VARCHAR(50),
@isDefault		BIT,
@Created		DATETIME,
@Modified		DATETIME
AS
INSERT INTO [dbo].[Address]	
(
	[UserID],
	[Address],
	[Country],
	[State],
	[City],
	[Postal],
	[isDefault],
	[Created],
	[Modified]
)
VALUES
(
	@UserID,
	@Address,
	@State,
	@Country,
	@City,
	@Postal,
	ISNULL(@isDefault,1),
	ISNULL(@Created,GETDATE()),
	ISNULL(@Modified,GETDATE())
)

--Address Count
CREATE PROCEDURE [dbo].[Address_SelectAll]
AS
SELECT 
[dbo].[Address].[AddressID]
FROM [dbo].[Address]
