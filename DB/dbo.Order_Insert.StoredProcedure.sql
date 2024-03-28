USE [ECommerce]
GO
/****** Object:  StoredProcedure [dbo].[Order_Insert]    Script Date: 22-02-2024 21:19:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[Order_Insert]
    @AddressID      INT,
    @UserID         INT,
    @ProductIDs     VARCHAR(MAX),  -- Comma-separated list of product IDs
    @isCompleted    BIT,
    @OrderStatus    VARCHAR(500),
	@Quantities     VARCHAR(MAX),
    @Created        DATETIME,
    @Modified       DATETIME,
    @Completed      DATETIME
AS
BEGIN
    DECLARE @ProductIdTable TABLE (ProductID INT);
    DECLARE @QuantityTable TABLE (Quantity INT);

    -- Split the comma-separated lists of product IDs and quantities into tables
    INSERT INTO @ProductIdTable (ProductID)
    SELECT value
    FROM STRING_SPLIT(@ProductIDs, ',');

    INSERT INTO @QuantityTable (Quantity)
    SELECT value
    FROM STRING_SPLIT(@Quantities, ',');

    -- Get the total number of records
    DECLARE @TotalRows INT;
    SET @TotalRows = (SELECT COUNT(*) FROM @ProductIdTable);

    -- Insert orders for each product ID
    DECLARE @Counter INT;
    SET @Counter = 1;

    WHILE @Counter <= @TotalRows
    BEGIN
        DECLARE @ProductID INT;
        DECLARE @Quantity INT;

        -- Retrieve ProductID and Quantity for the current iteration
        SELECT @ProductID = ProductID FROM (SELECT ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS RowNum, ProductID FROM @ProductIdTable) AS P WHERE RowNum = @Counter;
        SELECT @Quantity = Quantity FROM (SELECT ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS RowNum, Quantity FROM @QuantityTable) AS Q WHERE RowNum = @Counter;

        -- Insert order for the current product ID and quantity
        INSERT INTO [dbo].[Order]
        (
            [AddressID],
            [UserID],
            [ProductID],
            [isCompleted],
            [OrderStatus],
		    [Quantity],
            [Created],
            [Modified],
            [Completed]
        )
        VALUES
        (
            @AddressID,
            @UserID,
            @ProductID,
            ISNULL(@isCompleted, 0),
            ISNULL(@OrderStatus, 'Pending'),
            @Quantity,
            ISNULL(@Created, GETDATE()),
            ISNULL(@Modified, GETDATE()),
            ISNULL(@Completed, GETDATE())
        );

        SET @Counter = @Counter + 1;
    END;
END;
GO
