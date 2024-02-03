USE [ECommerce]
GO
/****** Object:  StoredProcedure [dbo].[Category_Update]    Script Date: 03-02-2024 10:50:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
