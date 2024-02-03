USE [ECommerce]
GO
/****** Object:  Table [dbo].[SEC_User]    Script Date: 03-02-2024 10:50:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SEC_User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[EmailAddress] [nvarchar](500) NOT NULL,
	[isAdmin] [bit] NOT NULL,
	[isActive] [bit] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SEC_User] ADD  CONSTRAINT [DF_SEC_User_isAdmin]  DEFAULT ((0)) FOR [isAdmin]
GO
ALTER TABLE [dbo].[SEC_User] ADD  CONSTRAINT [DF_SEC_User_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[SEC_User] ADD  CONSTRAINT [DF_User_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[SEC_User] ADD  CONSTRAINT [DF_User_Modified]  DEFAULT (getdate()) FOR [Modified]
GO
