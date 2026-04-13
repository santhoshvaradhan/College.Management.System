
-- PROCEDURE: usp_Designation_GetById 
-- DESCRIPTION: Retrieves a designation by its unique identifier.

CREATE OR ALTER PROCEDURE usp_Designation_GetById
(
	@DesignationId AS UNIQUEIDENTIFIER
)
AS
BEGIN
	IF NOT EXISTS (SELECT * FROM Designation NOLOCK)
		PRINT N'Designation not found';
		RAISERROR ('Designation is not found',1,16)
		RETURN;
	BEGIN TRY
		SELECT  * FROM Designation NOLOCK
		WHERE DesignationId = @DesignationId;
	END TRY
	BEGIN CATCH
		THROW;
	END CATCH
END