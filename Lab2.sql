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

-- 3) Display the most widely spoken language for each country, using a subquery?
select Country
, max(Percentage) as Percentage
, (select top 1 Name from Language where Country = l.Country) as Spoken_Language
from dbo.Language l
group by Country
order by Percentage desc
go 

-- 4) Display the most widely spoken language in the continent Europe?
-- hint refer to Encompasses table
select top 1 e.Continent,l.Name, sum(l.Percentage/100 * c.Population) as number_of_speaker
from dbo.Encompasses as e
join dbo.Country as c on c.Code = e.Country
join dbo.language as l on l.Country = e.Country
where e.Continent = 'Europe'
group by e.Continent,l.Name
order by number_of_speaker desc
go


-- 5) Display all top 5 Countries that have the largest area of Lakes combined?
select top 5 c.name as Country, sum(la2.area) as Largest_Area
from dbo.geo_Lake la
join dbo.Country as c on c.code = la.country
join dbo.Lake as la2 on la2.name = la.lake
group by c.name 
order by Largest_Area desc
go



