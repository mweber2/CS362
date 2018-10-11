/*************************************************************************************************
* Author:	Mark Weber
*
* Description:	This script is for the week 2 assignment.
* Date:			Author:			Description:
* ----------    ---------- 		--------------------------------------------------
* 10/10/2018	M.weber26			initial version created
*************************************************************************************************
 *==============================================================================================*/
 -- Question 1) Select the top 10 Lakes with the largest area size?
 SELECT TOP(10) [Name]
      ,River      
      ,[Length]
      ,Area     
FROM dbo.River;

-- Question 2) You found an expert prediction that a Sea level will raise six feet at the end of the next five year, calculate the depth of each Sea five years from now?
SELECT SUM(area) total_area, AVG(area) AS avg_area
FROM dbo.Lake
  
 	   
