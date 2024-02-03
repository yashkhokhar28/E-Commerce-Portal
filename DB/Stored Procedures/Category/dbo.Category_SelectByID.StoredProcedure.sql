USE [ECommerce]
GO
/****** Object:  StoredProcedure [dbo].[Category_SelectByID]    Script Date: 03-02-2024 10:50:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
