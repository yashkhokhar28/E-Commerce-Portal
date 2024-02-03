USE [ECommerce]
GO
/****** Object:  StoredProcedure [dbo].[Increment_Quantity]    Script Date: 03-02-2024 10:50:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Increment_Quantity]
@ProductID		INT
AS
UPDATE [dbo].[Cart]
SET [Quantity] = [Quantity] + 1
WHERE [dbo].[Cart].[ProductID] = @ProductID
GO
