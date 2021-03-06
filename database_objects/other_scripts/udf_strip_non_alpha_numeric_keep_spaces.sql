USE [LDSBC_BA280_DA]
GO

/****** Object:  UserDefinedFunction [dbo].[udf_strip_non_alpha_numeric_keep_spaces]    Script Date: 3/3/2021 8:24:53 PM ******/
DROP FUNCTION [dbo].[udf_strip_non_alpha_numeric_keep_spaces]
GO

/****** Object:  UserDefinedFunction [dbo].[udf_strip_non_alpha_numeric_keep_spaces]    Script Date: 3/3/2021 8:24:53 PM ******/
SET ANSI_NULLS OFF
GO

SET QUOTED_IDENTIFIER OFF
GO

CREATE FUNCTION [dbo].[udf_strip_non_alpha_numeric_keep_spaces]
(
@string VARCHAR(8000)
)
RETURNS VARCHAR(8000) with schemabinding
AS
/*****************************************************************************************************************
NAME:    dbo.udf_strip_non_alpha_numeric_keep_spaces
PURPOSE: Remove all non alpha numberic characters, but keep the spaces
MODIFICATION LOG:
Ver       Date         Author                 Description
-------   ----------   --------------------   ------------------------------------------------------------
1.0       02/20/2019   Jon Jaussi (JJAUSSI)   1. Built this scalar function
RUNTIME: 
Approx. 1 sec
   
NOTES: Derived from dbo.udfStripNonAlphaNumeric
      
******************************************************************************************************************/

BEGIN

DECLARE    @IncorrectCharLoc SMALLINT

SET @IncorrectCharLoc = PATINDEX('%[^ - 0-9A-Za-z]%', @string)

WHILE @IncorrectCharLoc > 0

BEGIN

SET @string = STUFF(@string, @IncorrectCharLoc, 1, '')

SET @IncorrectCharLoc = PATINDEX('%[^ - 0-9A-Za-z]%', @string)

END

SET @string = @string

RETURN @string

END



GO
