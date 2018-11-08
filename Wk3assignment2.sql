/*************************************************************************************************
* Author:	Mark Weber
*
* Description:	This script is for the week 3 assignment.
* Date:			Author:			Description:
* ----------    ---------- 		--------------------------------------------------
* 10/18/2018	M.weber26			initial version created
*************************************************************************************************
 *==============================================================================================*/
USE CIA_FACTBOOK_DB;
go


-- Q1) Display Lakes that are present in a country that do not have any rivers. 
-- hint use geo_Lake and geo_River tables
SELECT *	 
FROM dbo.geo_Lake
WHERE NOT EXISTS (
		SELECT Country
		FROM dbo.geo_River
		Where geo_River.River = River.Lake
				);


	

-- Q2) Display cities from English speaking countries that has to top 5 population size
-- hint use City and Language tables, you may use TOP function
Select TOP (5) *
From dbo.City
Where language = 'English';


-- Q3) Display cities in USA that exists in two or more stats. 
-- hint use City table

-- Q4) Display the top 5 Islands in the world that has the largest Area size
-- hint use Island table and make sure to exclude Islands that has NULL area size. Do not use TOP function for this question.

-- Q5) You are working on the next G8-20 summit and tasked to find countries, whose economy is between 8th - 20th largest economy in the world.
-- hint use dbo.Economy Table and a subquery

 