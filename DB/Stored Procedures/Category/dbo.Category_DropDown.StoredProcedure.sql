USE [ECommerce]
GO
/****** Object:  StoredProcedure [dbo].[Category_DropDown]    Script Date: 03-02-2024 10:50:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Category_DropDown]

AS
Select	[dbo].[Category].[CategoryID],
		[dbo].[Category].[CategoryName]

FROM [dbo].[Category]
GO
