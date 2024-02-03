USE [ECommerce]
GO
/****** Object:  StoredProcedure [dbo].[Complete_Order]    Script Date: 03-02-2024 10:50:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Complete_Order]
@OrderID	int

AS
UPDATE [dbo].[Order]

SET [isCompleted] = 1,
	[OrderStatus] = 'Completed',
	[Completed] = GETDATE()
	
WHERE [dbo].[Order].[OrderID] = @OrderID
GO
