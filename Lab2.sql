/*************************************************************************************************
* Author:	Mark Weber
*
* Description:	This script is for the Lab 2.
* Date:			Author:			Description:
* ----------    ---------- 		--------------------------------------------------
* 11/1/2018	M.weber26			initial version created
*************************************************************************************************
 *==============================================================================================*/
 Use cia_factbook_db
 go
-- 1) Select a country that has the smallest GDP in the world?
SELECT TOP (1) 
[country],[gdp]
FROM dbo.Economy
where GDP < 100 ;

-- 2) Find the population growth rate for each city?
-- hint refer to Citypops table and https://pages.uoregon.edu/rgp/PPPM613/class8a.htm for population growth rate

-- 3) Display the most widely spoken language for each country, using a subquery?
Select *
From dbo.LANGUAGE
where (Select name AS SpokenLang
       from Country);
       

-- 4) Display the most widely spoken language in the continent Europe?
-- hint refer to Encompasses table
select Name AS SpokenLang,
Country, Percentage 
from dbo.LANGUAGE
where (select spokenlang
from encompasses

-- 5) Display all top 5 Countries that have the largest area of Lakes combined?