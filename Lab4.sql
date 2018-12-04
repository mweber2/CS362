/*************************************************************************************************
* Author:	Mark Weber
*
* Description:	This script is for the Lab 4.
* Date:			Author:			Description:
* ----------    ---------- 		--------------------------------------------------
* 12/3/2018	M.weber26			Initial version created
*************************************************************************************************
 *==============================================================================================*/
 Use SalesDatabase;
 go

-- 1) Download the class Roster as CSV and create a new table to import the CSV to a new table Roster?

--BULK INSERT FifthDatabase.dbo.CSV_Student 
  -- FROM 'c:\m.weber26/CS362/Roster' 
   --WITH   
     -- (  
       --  FIELDTERMINATOR =',',  
        -- ROWTERMINATOR ='\n'
      -- );   


-- 2) Update sales to the same Sales agent to USASales table if the same agent has sales on both USA and Canada?

        -- Configure the Excercise database first to answer this question.

        -- hint FROM, and JOIN are allowed in DELETE AND UPDATE queries.



update u set u.amount += c.amount
from USASales as u
join CanadaSales as c on u.AgentID = c.AgentID



delete c
from USASales as u
join CanadaSales as c on u.AgentID = c.AgentID





select * from USASales
select * from CanadaSales
-- 3) After completing Question 2, Delete all sales from SalesCanada if the sales agent in CanadaSales has any sales in USASales?

-- 4) Create a SQL script that insert a new sales agent ('20','YourName','YourLastName','123 Some Address','100','CASH') to USASales?
Insert into USASales( AgentID, FirstName, LastName, Address, Amount, Payment_Method )
Values ('20', 'Mark', 'Weber', '123 Some Address', '100', 'CASH') 

SELECT *
FROM USASales

-- 5) We can be able to undo deleted records in SQL Server. (Ture/False)? Explain your why.

 /*True. By adding "Begin Tran;" before a select statement you mark a starting point of a local transaction 
 and to keep the transaction you would type "commit tran;" 
 after you type your statement but to undo the changes (maybe just to test your results) 
 you have to type "rollback tran;", this will undo a delete.
 */
-- Example

Insert into CanadaSales( AgentID, FirstName, LastName, Address, Amount, Payment_Method )
Values ('11', 'James', 'Smith', '388 Beechwood Dr. New Milford. CT 06776', '11', 'CASH') -- creates the new row in the CanadaSales DB

select * from CanadaSales -- see the row is added

Begin tran; -- begins the transaction

delete c
from USASales as u
join CanadaSales as c on u.AgentID = c.AgentID -- deletes the new added row

select * from CanadaSales -- see the row is now deleted

rollback tran; -- undos the delete

select * from CanadaSales -- see the row is added back
 



 
