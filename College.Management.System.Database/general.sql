
SELECT * FROM sys.tables ;
-- This query retrieves all the tables in the current database along with their schema names and column details.
-- sys.tables is a system catalog view that contains a row for each table in the database.

SELECT * FROM sys.partitions ;
-- This query retrieves all the partitions in the current database along with their details.
-- sys.partitions is a system catalog view that contains a row for each partition of a table or index in the database.

SELECT * FROM sys.procedures WHERE REGEXP_LIKE(name, '^usp_') ;
--REGEXP_LIKE is a function that checks if the name of the stored procedure starts with 'usp_', which is a common naming convention for user-defined stored procedures. 
--This query will return all stored procedures that follow this naming pattern, along with their schema names and other details.
-- This query retrieves all the stored procedures in the current database along with their schema names and other details.
-- sys.procedures is a system catalog view that contains a row for each stored procedure in the database.

SELECT * FROM sys.views ;
-- This query retrieves all the views in the current database along with their schema names and column details.
-- sys.views is a system catalog view that contains a row for each view in the database.

SELECT t.name,p.rows FROM sys.tables t
JOIN sys.partitions p ON t.object_id = p.object_id
WHERE p.index_id IN (0,1) -- 0 for heap tables and 1 for clustered index tables ; O means table has no clustered index and 1 means table has a clustered index
ORDER BY p.rows DESC; 
-- This query retrieves all the tables in the current database along with their schema names and column details, and also includes the number of rows in each table.
-- The query joins the sys.tables and sys.partitions system catalog views on the object_id column, which is a unique identifier for each table.