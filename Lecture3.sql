/*************************************************************************************************
* Author:	Biz Nigatu
*
* Description:	This script is created to teach students Structure Query Language for Data Management.
*
* Notes: Lecture 3: WHERE
**************************************************************************************************
* Change History
**************************************************************************************************
* Date:			Author:			Description:
* ----------    ---------- 		--------------------------------------------------
* 09/07/2018	BNigatu			initial version created
*************************************************************************************************
* Usage:
*************************************************************************************************
Execute each batch of the script sequentially
*************************************************************************************************/

/*==============================================================================================
 * 1) Using basic WHERE clause
 *==============================================================================================*/


USE CIA_FACTBOOK_DB;
go

-- Basic WHERE clause
-- Using Number, String, and Date literal
SELECT [Name]
      ,Country
      ,City      
      ,Elevation     
FROM dbo.Airport
WHERE Elevation = 1656;

-- Using a string literal
SELECT [Name]
      ,Country
      ,City      
      ,Elevation     
FROM dbo.Airport
WHERE City = 'Colorado Springs';

-- Using a date literal
SELECT Country
      ,Independence
      ,WasDependent     
      ,Government
FROM dbo.Politics
WHERE Independence = '1776-07-04';


/*==============================================================================================
 * 2) Different conditions in WHERE clause
 *==============================================================================================*/

-- Different comparison operators >, >=, =, <=, <, <> 
-- <>, != is to operator used for different or not equal to
SELECT [Name]
      ,Mountains
      ,Elevation     
      ,Coordinates
FROM dbo.Mountain
WHERE Elevation  >= 8800; 

/*==============================================================================================
 * 3) Using Boolean operators AND, OR, NOT
 *==============================================================================================*/

-- Some cities such as Aurora are shared by more than one city in multiple states
SELECT [Name]
      ,Country
      ,Province      
      ,Elevation
FROM dbo.City
WHERE [Name] = 'Aurora' AND Province='Colorado';


-- Select Aurora Colorado or Denver.
SELECT [Name]
      ,Country
      ,Province      
      ,Elevation
FROM dbo.City
WHERE ([Name] = 'Aurora' AND Province='Colorado') OR [Name] = 'Denver';


-- Select Aurora that is not in Colorado using "NOT" operator.
SELECT [Name]
      ,Country
      ,Province      
      ,Elevation
FROM dbo.City
WHERE ([Name] = 'Aurora' AND NOT Province='Colorado');


/*==============================================================================================
 * 4) Filter rows that contain a value in string
 *==============================================================================================*/

-- Use "LIKE" operator to filter using part of the string
SELECT [Name]
      ,Mountains
      ,Elevation     
      ,Coordinates
FROM dbo.Mountain
WHERE Mountains LIKE 'Rocky%';   -- "%" means any character. You can also use "_" (underscore) to represent a single character

-- Use can also use "NOT LIKE" to filter records that doesn't match any part
SELECT [Name]
      ,Mountains
      ,Elevation     
      ,Coordinates
FROM dbo.Mountain
WHERE Mountains NOT LIKE '%Mountains%';




/*==============================================================================================
 * 5) Using IN operator in WHERE clause
 *==============================================================================================*/

-- Use "IN" operator to filter rows that are in the list of string, number, or date literals
-- Find deserts in the USA and Mexico
SELECT Desert
      ,Country
      ,Province
FROM dbo.geo_Desert
WHERE Country IN ('MEX','USA');

-- Find rivers that have a length of 1400,1500, and 1600
SELECT [Name]
      ,River      
      ,[Length]     
      ,SourceElevation      
FROM dbo.River
WHERE [Length] IN (1400,1500, 1600);


-- Using "IN" from Subquery
-- List of countries and their capital cities that do have a major Desert in the country
SELECT [Name],
	   Capital
FROM dbo.Country
WHERE Code IN (SELECT Country  
			   FROM dbo.geo_Desert);


/*==============================================================================================
 * 6) Using EXISTS operator in WHERE clause
 *==============================================================================================*/

-- EXISTS operator checks the existence of any record in a subquery.
-- The EXISTS operator returns true if the subquery returns one or more records.

-- If a subquery returns 0 records then the parent query will always return 0 records.
SELECT [Name],
	   Capital
FROM dbo.Country
WHERE EXISTS (SELECT 1 as col1
			  WHERE 1 = 0);


-- This will return all countries even if the subquery returns only 'USA'
SELECT [Name],
	   Capital
FROM dbo.Country
WHERE EXISTS (SELECT Country  
			  FROM dbo.geo_Desert
			  WHERE Country ='USA');

-- Comparing IN and EXISTS operators 
-- using the previous example from IN operator
SELECT [Name],
	   Capital
FROM dbo.Country
WHERE EXISTS (SELECT Country  
			  FROM dbo.geo_Desert
			  WHERE Country.Code = geo_Desert.Country);


-- There is a difference between EXISTS and IN operators in the handling of NULL.
-- Will return 0 reocrds
SELECT [Name],
	   Capital
FROM dbo.Country
WHERE [NAME] IN (SELECT NULL as col1);

-- Will record all records of the parent
SELECT [Name],
	   Capital
FROM dbo.Country
WHERE EXISTS (SELECT NULL as col1);

-- EXISTS can be combined with a NOT operator to make sure values do not exist in a set
-- List of Cities from countries that do not have any major river.
SELECT [Name]
	  ,Country
	  ,Province	 
FROM dbo.City
WHERE NOT EXISTS (
		SELECT Country
		FROM dbo.geo_River
		WHERE geo_River.Country = City.Country
		);



/*==============================================================================================
 * 7) Using BETWEEN in WHERE clause
 *==============================================================================================*/

-- To compare if a column value is in between to values use "BETWEEN" operator
-- Find Countries that gained their independence between 1900 and 1970.
SELECT C.[Name] AS Country
      ,Independence
      ,WasDependent
      ,[Dependent]
      ,Government
FROM dbo.Politics P
JOIN dbo.Country C ON C.Code = P.Country
WHERE Independence BETWEEN '1900-01-01' AND '1970-12-31'

-- Find mountains its elevation between 7,000 and 9,000 feet
SELECT [Name] AS Mountain    
      ,Elevation
FROM dbo.Mountain
WHERE Elevation BETWEEN 7000 AND 9000;



/*==============================================================================================
 * 8) NULL in WHERE clause
 *==============================================================================================*/

-- You cannot compare NULL columns using regular comparison operators
-- Instead use "IS NULL" or "IS NOT NULL"

-- Display cities that has null elevation
SELECT [Name]
      ,Country
      ,Province      
      ,Elevation
FROM dbo.City
WHERE Elevation IS NULL;

-- Display cities that have some value for their elevation
SELECT [Name]
      ,Country
      ,Province      
      ,Elevation
FROM dbo.City
WHERE Elevation IS NOT NULL;


 /*==============================================================================================
 * Exercise Questions
 *==============================================================================================*/

/*
  1) Select all cities in state of 'New York'?
  2) Find countries that have some part of their region on different continents?
 	   -- hint refer to Encompasses table
  3) Display an Airport in 'USA' that has an elevation of 313?
  4) Select Islands that has an Elevation between 3000 and 4000 feet?
  5) Display all top 5 Lakes in the world that has the largest Area?

*/

/*===============================================================================================
*Mark Weber 10/17/2018 Week 3 Assignment
*================================================================================================*/



-- Q1) Display Lakes that are present in a country that do not have any rivers. 
-- hint use geo_Lake and geo_River tables

-- Q2) Display cities from English speaking countries that has to top 5 population size
-- hint use City and Language tables, you may use TOP function

-- Q3) Display cities in USA that exists in two or more stats. 
-- hint use City table

-- Q4) Display the top 5 Islands in the world that has the largest Area size
-- hint use Island table and make sure to exclude Islands that has NULL area size. Do not use TOP function for this question.

-- Q5) You are working on the next G8-20 summit and tasked to find countries, whose economy is between 8th - 20th largest economy in the world.
-- hint use dbo.Economy Table and a subquery

 