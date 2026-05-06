
CREATE OR ALTER PROCEDURE usp_Designation_GetAll
AS
BEGIN
	SET NOCOUNT ON; 
	BEGIN TRY
		SELECT *  FROM  Designation NOLOCK
		ORDER BY DesignationName;
	END TRY
	
	BEGIN CATCH
	     THROW;
	END CATCH
		
END

EXEC usp_Designation_GetAll;

EXEC xp_fixeddrives;