USE [ECommerce]
GO
/****** Object:  StoredProcedure [dbo].[Cart_SelectCartID]    Script Date: 22-02-2024 21:19:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Cart_SelectCartID]
@ProductID			INT
AS 

SELECT
		[dbo].[Cart].[ProductID]
FROM	[dbo].[Cart]
WHERE	[dbo].[Cart].[ProductID] = @ProductID AND [dbo].[Cart].[isOrderDone] = 0
GO
