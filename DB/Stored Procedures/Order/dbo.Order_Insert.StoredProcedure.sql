USE [ECommerce]
GO
/****** Object:  StoredProcedure [dbo].[Order_Insert]    Script Date: 03-02-2024 10:50:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Order_Insert]
    @AddressID      INT,
    @UserID         INT,
    @ProductIDs     VARCHAR(MAX),  -- Comma-separated list of product IDs
    @isCompleted    BIT,
    @OrderStatus    VARCHAR(500),
    @Created        DATETIME,
    @Modified       DATETIME,
    @Completed      DATETIME
AS
BEGIN
    DECLARE @ProductIdTable TABLE (ProductID INT);

    -- Split the comma-separated list of product IDs into a table
    INSERT INTO @ProductIdTable (ProductID)
    SELECT value
    FROM STRING_SPLIT(@ProductIDs, ',');

    -- Insert orders for each product ID
    INSERT INTO [dbo].[Order]
    (
        [AddressID],
        [UserID],
        [ProductID],
        [isCompleted],
        [OrderStatus],
        [Created],
        [Modified],
        [Completed]
    )
    SELECT
        @AddressID,
        @UserID,
        pt.ProductID,
        ISNULL(@isCompleted, 0),
        ISNULL(@OrderStatus, 'Pending'),
        ISNULL(@Created, GETDATE()),
        ISNULL(@Modified, GETDATE()),
        ISNULL(@Completed, GETDATE())
    FROM @ProductIdTable pt;
END
GO
