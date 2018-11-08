/*************************************************************************************************
* Author:	Mark Weber
*
* Description:	This script is for the Lab 1.
* Date:			Author:			Description:
* ----------    ---------- 		--------------------------------------------------
* 10/24/2018	M.weber26			initial version created
*************************************************************************************************
 *==============================================================================================*/
 Use cia_factbook_db
 go

-- 1) Select all cities in state of 'New York'?
SELECT [Name]
FROM dbo.City
WHERE Province='New York';

-- 2) Find countries that have some part of their region on different continents?
-- hint refer to Encompasses table
Select *
From dbo.encompasses
Where Percentage < 100;

-- 3) Display an Airport in 'USA' that has an elevation of 313?
Select *
From dbo.Airport
Where Elevation = '313' and Country = 'USA';

-- 4) Select Islands that has an Elevation between 3000 and 4000 feet?
Select *
From dbo.Island
Where Elevation Between 3000 and 4000;

-- 5) Display all top 5 Lakes in the world that has the largest Area? (Use subquery to make this a bit difficult. Hint, don't use TOP function)
SELECT *
FROM dbo.Lake as l1
WHERE (SELECT lake as l2 (count) 
           from lake as l2
		   Where l1.area and l2.area between 0 and 4 
			   FROM dbo.Country);
