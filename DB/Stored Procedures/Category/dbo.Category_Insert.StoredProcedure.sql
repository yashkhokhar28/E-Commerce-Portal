USE [ECommerce]
GO
/****** Object:  StoredProcedure [dbo].[Category_Insert]    Script Date: 03-02-2024 10:50:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Category_Insert]
	@CategoryName	varchar(100),
	@Discription	varchar(500),
	@Created		datetime,
	@Modified		datetime
AS

INSERT INTO [dbo].[Category]
(
	[CategoryName], 
	[Discription], 
	[Created],
	[Modified]
)
VALUES
(		
		@CategoryName,	
		@Discription,					
		ISNULL(@Created,getdate()),	
		ISNULL(@Modified,getdate())	
)
GO
