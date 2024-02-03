USE [ECommerce]
GO
/****** Object:  Table [dbo].[MST_Product]    Script Date: 03-02-2024 10:50:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MST_Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [varchar](100) NOT NULL,
	[Discription] [varchar](500) NOT NULL,
	[Price] [decimal](12, 2) NOT NULL,
	[Code] [varchar](100) NOT NULL,
	[DisplayImage] [varchar](100) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[isActive] [bit] NOT NULL,
	[Discount] [int] NULL,
	[Rating] [int] NULL,
	[Created] [datetime] NULL,
	[Modified] [datetime] NULL,
 CONSTRAINT [PK_MST_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MST_Product] ADD  CONSTRAINT [DF_MST_Product_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[MST_Product] ADD  CONSTRAINT [DF_MST_Product_Modified]  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [dbo].[MST_Product]  WITH CHECK ADD  CONSTRAINT [FK_MST_Product_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[MST_Product] CHECK CONSTRAINT [FK_MST_Product_Category]
GO
