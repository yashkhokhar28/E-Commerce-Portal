USE [ECommerce]
GO
/****** Object:  StoredProcedure [dbo].[Address_SelectAll]    Script Date: 03-02-2024 10:50:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Address_SelectAll]
AS
SELECT 
[dbo].[Address].[AddressID]
FROM [dbo].[Address]
GO
