USE [LDSBC_BA280_DA]
GO

/****** Object:  UserDefinedFunction [dbo].[udf_strip_non_alpha_numeric]    Script Date: 3/3/2021 8:24:17 PM ******/
DROP FUNCTION [dbo].[udf_strip_non_alpha_numeric]
GO

/****** Object:  UserDefinedFunction [dbo].[udf_strip_non_alpha_numeric]    Script Date: 3/3/2021 8:24:17 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[udf_strip_non_alpha_numeric]( @string varchar( 8000 ))
RETURNS varchar( 8000 )
    WITH SCHEMABINDING
AS
/*****************************************************************************************************************
NAME:    dbo.udf_strip_non_alpha_numeric
PURPOSE: Remove all non alpha numberic characters, but keep the spaces
SUPPORT: Jaussi Consulting LLC
         www.jaussiconsulting.net
         jon@jaussiconsulting.net
MODIFICATION LOG:
Ver       Date         Author                 Description
-------   ----------   --------------------   ------------------------------------------------------------
1.0       02/20/2019   Jon Jaussi (JJAUSSI)   1. Built this view
RUNTIME: 1 min
NOTES: Derived from dbo.udfStripNonAlphaNumeric
This keeps the spaces and keeps the single quote in place
LICENSE: This code is covered by the GNU General Public License which guarantees end users
the freedom to run, study, share, and modify the code. This license grants the recipients
of the code the rights of the Free Software Definition. All derivative work can only be
distributed under the same license terms.
******************************************************************************************************************/

BEGIN

    DECLARE
       @IncorrectCharLoc smallint;

    SET @IncorrectCharLoc = PATINDEX( '%[^''-'' - 0-9A-Za-z]%' , @string );

    WHILE @IncorrectCharLoc
          > 
          0

        BEGIN

            SET @string = STUFF( @string , @IncorrectCharLoc , 1 , '' );

            SET @IncorrectCharLoc = PATINDEX( '%[^''-'' - 0-9A-Za-z]%' , @string );

        END;

    SET @string = @string;

    RETURN @string;

END;

GO