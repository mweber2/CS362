/*************************************************************************************************
* Author:	Mark Weber
*
* Description:	This script is for the Lab 3.
* Date:			Author:			Description:
* ----------    ---------- 		--------------------------------------------------
* 11/18/2018	M.weber26			Initial version created
*************************************************************************************************
 *==============================================================================================*/
 Use cia_factbook_db
 go

-- 1) Find all cities that exist in the continent of Africa?
select e.Continent, c1.name as City
from dbo.encompasses as e
join dbo.City as c1 on e.Country = c1.country
where continent = 'Africa';
go

-- 2) You are an analyst for Census Bureau and tasked to find US cities, that are losing their population year after year, for example, Akron Ohio?
      -- hint use Citypops tables and make sure the cities are in the USA.
with cte as ( 
select *, row_number() over (partition by city,province order by [Year]) as Row_Number
from dbo.citypops
where country = 'USA'
)
select a.city, a.province, max(a.Row_Number) as max_row, count(b.Row_Number) as Count
from cte as a
left join cte as b on a.city = b.city and a.province = b.province and a.Row_Number+1 = b.Row_Number and a.[Population] > b.[Population]
group by a.city,a.province
having max(a.Row_Number)-1 = count(b.Row_Number);
go


--select c1.country, c1. Province, c1.city, c1.Year, sum(c1.Population) as Population
--from dbo.Citypops as c1
--where c1.country = 'USA'
--group by c1.country, c1.City, c1.Province, c1.Year



-- 3) You are working as a database consultant to one of the major political party in the next national election. Your party asked you to provide the top 3, most populated cities in the Swing States to run TV ads?

      -- hint Use City table. Find the Swing States from https://en.wikipedia.org/wiki/Swing_state
select *
from(
select c1.Name, c1.Province, c1.Population, row_number() over(partition by province order by [population] desc) as row_num
from dbo.City as c1
where c1.province in ('colorado', 'florida', 'Iowa', 'Michigan', 
'Minnesota', 'Ohio', 'Nevada', 'New Hampshire', 'North Carolina', 'Pennsylvania', 'Virginia','Wisconsin')  
) as a
where row_num < 4;
go



-- 4) You are working for FEMA, and due to its relations to hurricane you are requested to find rivers that have "estuary elevation" more than 100 feet in the USA?

      -- hint Make sure the estuary is in the USA.
	  select *
	  from(
	  select r1.Name, r1.River, r1.EstuaryElevation as Feet, e1.Country, row_number() over(partition by r1.River order by [EstuaryElevation] asc) as row_num
	  from dbo.River as r1
	  join dbo.geo_Estuary as e1 on e1.River = r1.River
	  where e1.Country = 'USA') as a
	  where Feet > 100;
	  go

	  --select name, river, EstuaryElevation from dbo.River where EstuaryElevation > 100

-- 5) Create a report that has the name of State and all water body sorted by State and Water body in ascending order?

      -- hint vertically combine [State, Lake] and [State, River]

	  select name from Province
	  union 
	  select name from Lake
	  order by name asc;
	  go
	  
	   select name from Province
	  union 
	  select name from River
	  order by name asc;
	  go
	  
	 

	 