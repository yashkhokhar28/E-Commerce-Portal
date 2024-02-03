USE [ECommerce]
GO
/****** Object:  Table [dbo].[ProductGallary]    Script Date: 03-02-2024 10:50:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductGallary](
	[GallaryID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[ImageURL] [varchar](100) NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
 CONSTRAINT [PK_ProductGallary] PRIMARY KEY CLUSTERED 
(
	[GallaryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProductGallary] ADD  CONSTRAINT [DF_ProductGallary_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[ProductGallary] ADD  CONSTRAINT [DF_ProductGallary_Modified]  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [dbo].[ProductGallary]  WITH CHECK ADD  CONSTRAINT [FK_ProductGallary_MST_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[MST_Product] ([ProductID])
GO
ALTER TABLE [dbo].[ProductGallary] CHECK CONSTRAINT [FK_ProductGallary_MST_Product]
GO
