--check the MyIndex field for a pattern Q7.3
USE LDSBC_BA280_DA;

SELECT a.[Date]
     , DATEPART(week, a.[Date]) AS WeekNumber
     , a.MyIndex
  FROM dbo.avocado AS a
 GROUP BY a.[Date]
        , a.MyIndex
 ORDER BY 1;

--check the anamoly for the year and date not matching Q7.2

USE LDSBC_BA280_DA;

SELECT a.date
     , a.year
     , DATEPART(year, a.[Date]) AS DerivedYear
     , CASE
           WHEN year = DATEPART(year, a.[Date])
           THEN 1
           ELSE 0
       END AS 'Matched 01'
  FROM dbo.avocado AS a
 GROUP BY a.date
        , a.year;
--HAVING CASE WHEN year=  DATEPART(year, a.[Date]) THEN 1 ELSE 0 END = 0

--check the counts for each value in region Q6.1
USE LDSBC_BA280_DA;

SELECT a.region
     , COUNT(*) AS 'Number of rows'
  FROM dbo.avocado AS a
 GROUP BY a.region
 ORDER BY a.region DESC;