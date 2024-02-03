USE [ECommerce]
GO
/****** Object:  StoredProcedure [dbo].[Category_Delete]    Script Date: 03-02-2024 10:50:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Category_Delete]
@CategoryID	int

AS
DELETE FROM [dbo].[Category]
	
WHERE [dbo].[Category].[CategoryID] = @CategoryID
GO
