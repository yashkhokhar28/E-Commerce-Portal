USE [ECommerce]
GO
/****** Object:  StoredProcedure [dbo].[Product_Delete]    Script Date: 03-02-2024 10:50:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Product_Delete]
@ProductID	int

AS
UPDATE [dbo].[MST_Product]

SET [isActive] = 0	
	
WHERE [dbo].[MST_Product].[ProductID] = @ProductID
GO
