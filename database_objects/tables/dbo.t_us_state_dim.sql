USE [LDSBC_BA280_DA]
GO

/****** Object:  Table [dbo].[t_us_state_dim]    Script Date: 1/31/2020 4:23:57 PM ******/
DROP TABLE [dbo].[t_us_state_dim]
GO

/****** Object:  Table [dbo].[t_us_state_dim]    Script Date: 1/31/2020 4:23:57 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[t_us_state_dim](
	[Key] varchar(50) NULL,
	[State Name] [varchar](50) NOT NULL,
	[ISO] [varchar](50) NULL,
	[ANSI] [varchar](50) NULL,
	[ANSI2] [varchar](50) NULL,
	[USPS] [varchar](50) NOT NULL,
	[USCG] [varchar](50) NULL,
	[GPO] [varchar](50) NULL,
	[AP] [varchar](50) NULL,
 CONSTRAINT [PK_t_us_state_dim] PRIMARY KEY CLUSTERED 
([USPS] ASC)
)
GO


