USE [ECommerce]
GO
/****** Object:  StoredProcedure [dbo].[Category_SelectAll]    Script Date: 03-02-2024 10:50:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Category_SelectAll]
AS

SELECT	[dbo].[Category].[CategoryID], 
		[dbo].[Category].[CategoryName], 
		[dbo].[Category].[Discription], 
		[dbo].[Category].[Created],
		[dbo].[Category].[Modified]

FROM [dbo].[Category]

ORDER BY [dbo].[Category].[CategoryName]
GO
