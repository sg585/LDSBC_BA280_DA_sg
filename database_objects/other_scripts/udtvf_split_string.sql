USE [LDSBC_BA280_DA]
GO

/****** Object:  UserDefinedFunction [dbo].[udtvf_split_string]    Script Date: 3/3/2021 8:20:34 PM ******/
DROP FUNCTION [dbo].[udtvf_split_string]
GO

/****** Object:  UserDefinedFunction [dbo].[udtvf_split_string]    Script Date: 3/3/2021 8:20:34 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [dbo].[udtvf_split_string]( @v_string_to_split varchar( max ))
RETURNS @v_return_list TABLE( word nvarchar( max ))
AS
/*****************************************************************************************************************
NAME:    dbo.udtvf_split_string
PURPOSE: Split a string of words into a list of words
SUPPORT: Jaussi Consulting LLC
         www.jaussiconsulting.net
         jon@jaussiconsulting.net
MODIFICATION LOG:
Ver       Date         Author                 Description
-------   ----------   --------------------   ------------------------------------------------------------
1.0       02/20/2019   Jon Jaussi (JJAUSSI)   1. Built this view
RUNTIME: 1 min
NOTES: This table valued function was derrived from...
https://stackoverflow.com/questions/2647/how-do-i-split-a-string-so-i-can-access-item-x
LICENSE: This code is covered by the GNU General Public License which guarantees end users
the freedom to run, study, share, and modify the code. This license grants the recipients
of the code the rights of the Free Software Definition. All derivative work can only be
distributed under the same license terms.
******************************************************************************************************************/

BEGIN

    DECLARE
       @v_word nvarchar( max );
    DECLARE
       @v_position int;

    WHILE CHARINDEX( ' ' , @v_string_to_split )
          > 
          0
        BEGIN
            SELECT @v_position = CHARINDEX( ' ' , @v_string_to_split );
            SELECT @v_word = SUBSTRING( @v_string_to_split , 1 , @v_position - 1 );

            INSERT INTO @v_return_list
            SELECT @v_word;

            SELECT @v_string_to_split = SUBSTRING( @v_string_to_split , @v_position + 1 , LEN( @v_string_to_split ) - @v_position );
        END;

    INSERT INTO @v_return_list
    SELECT @v_string_to_split;

    RETURN;
END;

GO