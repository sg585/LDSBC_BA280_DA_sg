USE [LDSBC_BA280_DA]
GO

/****** Object:  UserDefinedFunction [dbo].[udf_strip_non_alpha]    Script Date: 3/3/2021 8:23:45 PM ******/
DROP FUNCTION [dbo].[udf_strip_non_alpha]
GO

/****** Object:  UserDefinedFunction [dbo].[udf_strip_non_alpha]    Script Date: 3/3/2021 8:23:45 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[udf_strip_non_alpha]
(@Temp VARCHAR(1000)
)
RETURNS VARCHAR(1000)
WITH SCHEMABINDING
AS

/*****************************************************************************************************************
NAME:    dbo.udf_strip_non_alpha
PURPOSE: Remove non alpha characters from a string
MODIFICATION LOG:
Ver       Date         Author                 Description
-------   ----------   --------------------   ------------------------------------------------------------
1.0       02/20/2019   Jon Jaussi (JJAUSSI)   1. Built this scalar function
RUNTIME: 
Approx. 1 sec
NOTES:  This function is based on RemoveNonAlphaCharacters authored here...
   http://stackoverflow.com/questions/1007697/how-to-strip-all-non-alphabetic-characters-from-string-in-sql-server
      
******************************************************************************************************************/
 
     BEGIN

         WHILE PATINDEX('%[^a-z]%', @Temp) > 0

             SET @Temp = STUFF(@Temp, PatIndex('%[^a-z]%', @Temp), 1, '');

         RETURN @Temp;

     END; 

GO
