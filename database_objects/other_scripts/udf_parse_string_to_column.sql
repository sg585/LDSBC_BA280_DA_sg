USE [LDSBC_BA280_DA]
GO

/****** Object:  UserDefinedFunction [dbo].[udf_parse_string_to_column]    Script LDSBC_BA280_DAte: 3/3/2021 8:21:32 PM ******/
DROP FUNCTION [dbo].[udf_parse_string_to_column]
GO

/****** Object:  UserDefinedFunction [dbo].[udf_parse_string_to_column]    Script LDSBC_BA280_DAte: 3/3/2021 8:21:32 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[udf_parse_string_to_column]
(@v_string    VARCHAR(2000)
, @v_delimiter AS VARCHAR(1)
, @v_idx       NUMERIC
)

/*****************************************************************************************************************
NAME:    dbo.udf_parse_string_to_column
PURPOSE: Create the dbo.udf_parse_string_to_column scalar function
MODIFICATION LOG:
Ver       LDSBC_BA280_DAte         Author                 Description
-------   ----------   --------------------   ------------------------------------------------------------
1.0       02/20/2019   Jon Jaussi (JJAUSSI)   1. Built this scalar function
RUNTIME: 
Approx. 1 sec
NOTES: 
The idea is to take a delimited string as an input and return the user requested element from that string
ALDSBC_BA280_DApted from this post...
https://stackoverflow.com/questions/10581772/how-to-split-a-comma-separated-value-to-columns/55696147#55696147
******************************************************************************************************************/

RETURNS VARCHAR(50)
     BEGIN
         DECLARE @v_delim_pos INT;
         SET @v_delim_pos = CHARINDEX(@v_delimiter, @v_string);
         WHILE 1 = 1
             BEGIN
                 IF @v_delim_pos = 0
                     BEGIN
                         IF @v_idx = 1
                             BEGIN
                                 RETURN @v_string;
                         END;
                             ELSE
                             BEGIN
                                 RETURN '';
                         END;
                 END;

                 IF @v_idx = 1
                     BEGIN
                         DECLARE @word VARCHAR(12);
                         SET @word = LEFT(@v_string, @v_delim_pos - 1);
                         RETURN @word;
                 END;

                 SET @v_string = RIGHT(@v_string, LEN(@v_string) - @v_delim_pos);
                 SET @v_delim_pos = CHARINDEX(@v_delimiter, @v_string);
                 SET @v_idx = @v_idx - 1;

             END;

         RETURN 'not used';

     END;
GO
