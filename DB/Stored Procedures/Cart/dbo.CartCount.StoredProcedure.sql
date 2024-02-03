USE [ECommerce]
GO
/****** Object:  StoredProcedure [dbo].[CartCount]    Script Date: 03-02-2024 10:50:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CartCount]
@UserID		INT
AS
SELECT
COUNT([dbo].[Cart].[CartID]) AS TotalCartItems
FROM [dbo].[Cart]
WHERE [dbo].[Cart].[UserID] = @UserID AND [dbo].[Cart].[isOrderDone] = 0
GO
