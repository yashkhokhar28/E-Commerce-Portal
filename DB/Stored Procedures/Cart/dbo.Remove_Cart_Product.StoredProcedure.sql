USE [ECommerce]
GO
/****** Object:  StoredProcedure [dbo].[Remove_Cart_Product]    Script Date: 03-02-2024 10:50:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Remove_Cart_Product]
@ProductID	INT
AS
DELETE FROM [dbo].[Cart]
WHERE [dbo].[Cart].[ProductID] = @ProductID
GO
