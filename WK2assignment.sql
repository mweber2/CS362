/*************************************************************************************************
* Author:	Mark Weber
*
* Description:	This script is for the week 2 assignment.
* Date:			Author:			Description:
* ----------    ---------- 		--------------------------------------------------
* 10/10/2018	M.weber26			initial version created
*************************************************************************************************
 *==============================================================================================*/
 Use cia_factbook_db
 go
 -- Question 1) Select the top 10 Lakes with the largest area size?
 SELECT TOP(10) [Name]
      ,River      
      ,[Length]
      ,Area     
FROM dbo.River;

-- Question 2) You found an expert prediction that a Sea level will raise six feet at the end of the next five year, calculate the depth of each Sea five years from now?
SELECT SUM(area) total_area, AVG(area) AS avg_area
FROM dbo.Lake
  
-- 3) Display unique Rivers for your report?
SELECT Distinct River
From dbo.River

-- 4) Calculate the result of the sum of 4 and 5, multiplied by 6 using SQL?
SELECT (4 + 5 * 6) 

-- 5) Display all columns from Airport table, in a descending order of Airport name by state?
 	   
SELECT *
FROM dbo.Airport
ORDER BY Province DESC;