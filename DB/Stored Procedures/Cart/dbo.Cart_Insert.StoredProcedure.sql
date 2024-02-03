USE [ECommerce]
GO
/****** Object:  StoredProcedure [dbo].[Cart_Insert]    Script Date: 03-02-2024 10:50:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Cart_Insert]
@ProductID		INT,
@UserID			INT,
@Quantity		INT,
@isOrderDone	BIT,
@Created		DATETIME,
@Modified		DATETIME
AS
INSERT INTO [dbo].[Cart]
(
	[ProductID],
	[UserID],
	[Quantity],
	[isOrderDone],
	[Created],
	[Modified]
)
VALUES
(
	@ProductID,
	@UserID,
	ISNULL(@Quantity,1),
	ISNULL(@isOrderDone,0),
	ISNULL(@Created,getdate()),	
	ISNULL(@Modified,getdate())
)
GO
