-- Check Credentials While Login

ALTER PROCEDURE [dbo].[SEC_User_SelectByUserNamePassword]

			@UserName			nvarchar(50),
			@Password			nvarchar(50)
AS 
SELECT

		[dbo].[SEC_User].[UserID]
		,[dbo].[SEC_User].[UserName]
		,[dbo].[SEC_User].[Password]
		,[dbo].[SEC_User].[FirstName]
		,[dbo].[SEC_User].[LastName]
		,[dbo].[SEC_User].[EmailAddress]
		,[dbo].[SEC_User].[isAdmin]
		,[dbo].[SEC_User].[Created]
		,[dbo].[SEC_User].[Modified]
FROM	[dbo].[SEC_User]
WHERE	[dbo].[SEC_User].[UserName] = @UserName
AND		[dbo].[SEC_User].[Password] = @Password

-- Check For Existing User

ALTER PROCEDURE [dbo].[SEC_User_SelectUserName]
@UserName			nvarchar(50)
AS 

SELECT
		[dbo].[SEC_User].[UserName]
FROM	[dbo].[SEC_User]
WHERE	[dbo].[SEC_User].[UserName] = @UserName

-- Insert User

ALTER PROCEDURE [dbo].[SEC_User_Insert]

			 @UserName			nvarchar(50)
			,@Password			nvarchar(50)
			,@FirstName			nvarchar(50)
			,@LastName			nvarchar(50)
			,@EmailAddress		nvarchar(500)
			,@isAdmin			bit
			,@Created			datetime
			,@Modified			datetime

AS 

INSERT INTO [dbo].[SEC_User]
			(
			[UserName]
			,[Password]
			,[FirstName]
			,[LastName]
			,[EmailAddress]
			,[isAdmin]
			,[Created]
			,[Modified]
			)
	VALUES
			(
			 @UserName
			,@Password
			,@FirstName
			,@LastName
			,@EmailAddress
			,ISNULL(@isAdmin,0)
			,ISNULL(@Created,GETDATE())
			,ISNULL(@Modified,GETDATE())
	)








