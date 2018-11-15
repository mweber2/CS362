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
SELECT TOP 1 Country, min(GDP) as lowgdp
FROM dbo.Economy
join dbo.Country on country.code = economy.country
where GDP is Not Null
group by Country
order by lowgdp
go

-- 2) Find the population growth rate for each city?
-- hint refer to Citypops table and https://pages.uoregon.edu/rgp/PPPM613/class8a.htm for population growth rate
select *
from dbo.Citypops

-- 3) Display the most widely spoken language for each country, using a subquery?
Select country,
name as language,
percentage
From dbo.LANGUAGE
where exist (
go
       

-- 4) Display the most widely spoken language in the continent Europe?
-- hint refer to Encompasses table
select *
from dbo.encompasses
go



-- 5) Display all top 5 Countries that have the largest area of Lakes combined?
select * 
from dbo.Lake, dbo.geo_Lake


go