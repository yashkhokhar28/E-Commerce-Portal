USE [ECommerce]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 03-02-2024 10:50:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[AddressID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[isCompleted] [bit] NOT NULL,
	[OrderStatus] [nvarchar](100) NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[Completed] [datetime] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_isCompleted]  DEFAULT ((0)) FOR [isCompleted]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_OrderStatus]  DEFAULT (N'Pending') FOR [OrderStatus]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_Modified]  DEFAULT (getdate()) FOR [Modified]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_Completed]  DEFAULT (getdate()) FOR [Completed]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Address] FOREIGN KEY([AddressID])
REFERENCES [dbo].[Address] ([AddressID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Address]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_MST_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[MST_Product] ([ProductID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_MST_Product]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[SEC_User] ([UserID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
