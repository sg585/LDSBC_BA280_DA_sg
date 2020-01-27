USE [LDSBC_BA280_DA]
GO

/****** Object:  Table [dbo].[avocado]    Script Date: 1/26/2020 4:56:24 PM ******/
DROP TABLE [dbo].[avocado]
GO

/****** Object:  Table [dbo].[avocado]    Script Date: 1/26/2020 4:56:24 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[avocado](
	[MyIndex] [bigint] NULL,
	[Date] [datetime] NULL,
	[AveragePrice] [numeric](18, 2) NULL,
	[Total Volume] [numeric](18, 2) NULL,
	[4046] [numeric](18, 2) NULL,
	[4225] [numeric](18, 2) NULL,
	[4770] [numeric](18, 2) NULL,
	[Total Bags] [numeric](18, 2) NULL,
	[Small Bags] [numeric](18, 2) NULL,
	[Large Bags] [numeric](18, 2) NULL,
	[XLarge Bags] [numeric](18, 2) NULL,
	[type] [varchar](50) NULL,
	[year] [bigint] NULL,
	[region] [varchar](50) NULL
) ON [PRIMARY]
GO


