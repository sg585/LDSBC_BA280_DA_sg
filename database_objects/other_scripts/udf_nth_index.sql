USE [LDSBC_BA280_DA]
GO

/****** Object:  UserDefinedFunction [dbo].[udf_nth_index]    Script Date: 3/3/2021 8:22:16 PM ******/
DROP FUNCTION [dbo].[udf_nth_index]
GO

/****** Object:  UserDefinedFunction [dbo].[udf_nth_index]    Script Date: 3/3/2021 8:22:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[udf_nth_index] 
               (@Input     VARCHAR(8000), 
                @Delimiter CHAR(1), 
                @Ordinal   INT) 

RETURNS INT 
AS 
/*****************************************************************************************************************
 NAME:       dbo.udf_nth_index
 PURPOSE:    Find the Nth occurence of a string within a string
MODIFICATION LOG:
Ver       Date         Author                 Description
-------   ----------   --------------------   ------------------------------------------------------------
1.0       02/20/2019   Jon Jaussi (JJAUSSI)   1. Built this scalar function
RUNTIME: 
Approx. 1 sec
NOTES: 
Adapted from fnNthIndex
http://www.sqlusa.com/bestpractices2005/nthindex/
 
PARAMETERS:    
    Input = The character expression to be searched
Delimiter = The character expression that contains the sequence to be found
  Ordinal = find the Nth occurence of the Delimeter  
      
******************************************************************************************************************/

  BEGIN 

    DECLARE  @Pointer INT, 
             @Last    INT, 
             @Count   INT 

    SET @Pointer = 1 
    SET @Last = 0 
    SET @Count = 1 

    WHILE (2 > 1) 
      BEGIN 
        SET @Pointer = CHARINDEX(@Delimiter,@Input,@Pointer) 
        IF @Pointer = 0 
          BREAK 
        IF @Count = @Ordinal 

          BEGIN 
            SET @Last = @Pointer 
            BREAK 
          END 
        SET @Count = @Count + 1 
        SET @Pointer = @Pointer + 1 

      END 

    RETURN @Last 

  END

GO