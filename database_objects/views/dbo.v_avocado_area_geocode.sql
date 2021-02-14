USE [LDSBC_BA280_DA];
GO

/****** Object:  View [dbo].[HassbyRegion]    Script Date: 2/13/2021 5:58:36 PM ******/

SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO


CREATE VIEW dbo.HassbyRegion
AS
     WITH avo
          AS (SELECT a.region
                   , a.type
                   , a.year
                   , SUM(a.[Total Volume]) AS regionvolume
                   , lr.Related_State
                FROM dbo.avocado AS a
                     JOIN
                     dbo.Loc_Reference AS lr ON a.region = lr.region
               WHERE a.region IN
                                (
                                 'California'
                               , 'GreatLakes'
                               , 'Midsouth'
                               , 'Northeast'
                               , 'Plains'
                               , 'SouthCentral'
                               , 'Southeast'
                               , 'West'
                                )
               GROUP BY a.region
                      , a.type
                      , a.year
                      , lr.Related_State),
          states
          AS (SELECT tusd.[State Name]
                   , tusd.ANSI AS Abbrev
                   , ISNULL(lr.Area_Type, 'No Sales') AS [Area Type]
                   , lsr.region AS region2
                FROM dbo.t_us_state_dim AS tusd
                     LEFT JOIN
                     dbo.Loc_State_Region AS lsr ON tusd.ANSI = lsr.StateAbbrev2
                     LEFT JOIN
                     dbo.Loc_Reference AS lr ON lsr.region = lr.region)
          SELECT *
            FROM states AS s
                 FULL OUTER JOIN
                 avo AS a ON s.[State Name] = a.Related_State;
GO