USE [LDSBC_BA280_DA]
GO

/****** Object:  UserDefinedFunction [dbo].[udf_proper_case]    Script Date: 3/3/2021 8:22:57 PM ******/
DROP FUNCTION [dbo].[udf_proper_case]
GO

/****** Object:  UserDefinedFunction [dbo].[udf_proper_case]    Script Date: 3/3/2021 8:22:57 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[udf_proper_case]( @Text AS varchar( 8000 ))
RETURNS varchar( 8000 )
AS
/*****************************************************************************************************************
NAME:    dbo.udf_proper_case
PURPOSE: Reformat a string with Proper Case
SUPPORT: Jaussi Consulting LLC
         www.jaussiconsulting.net
         jon@jaussiconsulting.net
MODIFICATION LOG:
Ver       Date         Author                 Description
-------   ----------   --------------------   ------------------------------------------------------------
1.0       02/20/2019   Jon Jaussi (JJAUSSI)   1. Built this view
RUNTIME: 1 min
NOTES: Adapted from ProperCase
http://weblogs.sqlteam.com/jeffs/archive/2007/03/09/60131.aspx
LICENSE: This code is covered by the GNU General Public License which guarantees end users
the freedom to run, study, share, and modify the code. This license grants the recipients
of the code the rights of the Free Software Definition. All derivative work can only be
distributed under the same license terms.
******************************************************************************************************************/
BEGIN
    DECLARE
       @Reset bit;
    DECLARE
       @Ret varchar( 8000 );
    DECLARE
       @i int;
    DECLARE
       @c char( 1 );

    SELECT @Reset = 1
         , @i = 1
         , @Ret = '';
    WHILE @i <= LEN( @Text )
        SELECT @c = SUBSTRING( @Text , @i , 1 )
             , @Ret = @Ret + CASE
                             WHEN @Reset = 1 THEN UPPER( @c )
                                 ELSE LOWER( @c )
                             END
             , @Reset = CASE
                        WHEN @c LIKE '[a-zA-Z]' THEN 0
                            ELSE 1
                        END
             , @i = @i + 1;
    RETURN @Ret;
END;

GO