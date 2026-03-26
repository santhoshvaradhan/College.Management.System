USE CollegeManagement_Dev;

GO

-- Rename the 'Courses' table to 'Course' Using sp_rename stored procedure is in built one in SQL Server to rename database objects like tables, columns, indexes, etc. 
--The syntax for renaming a table is as follows:

EXEC sp_rename 'Courses', 'Course';