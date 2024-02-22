USE [ECommerce]
GO
/****** Object:  StoredProcedure [dbo].[Product_DeleteMultiple]    Script Date: 22-02-2024 21:19:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Product_DeleteMultiple]
    @ProductIDs VARCHAR(MAX)
AS
    DECLARE @ProductIdTable TABLE (ProductID INT);

    INSERT INTO @ProductIdTable (ProductID)
    SELECT value
    FROM STRING_SPLIT(@ProductIDs, ',');

	UPDATE [dbo].[MST_Product]

	SET [isActive] = 0	
	
WHERE [dbo].[MST_Product].[ProductID] IN (SELECT ProductID FROM @ProductIdTable);
GO
