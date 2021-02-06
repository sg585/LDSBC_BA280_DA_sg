USE [LDSBC_BA280_DA]
GO

/****** Object:  Table [dbo].[ZipLatLong]    Script Date: 1/31/2020 4:12:08 PM ******/
DROP TABLE [dbo].[ZipLatLong]
GO

/****** Object:  Table [dbo].[ZipLatLong]    Script Date: 1/31/2020 4:12:08 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ZipLatLong](
	[Zip] [varchar](50) NOT NULL,
	[city] [varchar](50) NULL,
	[state] [varchar](50) NULL,
	[latitude] [numeric](18, 10) NOT NULL,
	[longitude] [numeric](18, 10) NOT NULL,
	[timezone] [varchar](50) NULL,
	[dst] [varchar](50) NULL,
 CONSTRAINT [PK_ZipLatLong] PRIMARY KEY CLUSTERED 
([Zip] ASC)) 
GO

