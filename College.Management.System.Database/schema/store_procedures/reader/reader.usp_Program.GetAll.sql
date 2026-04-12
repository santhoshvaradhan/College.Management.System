
CREATE OR ALTER PROCEDURE dbo.usp_Program_GetAll
AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		SELECT ProgramId, ProgramName, ProgramCode, ProgramDescription, ProgramDuration, SemesterCount, IsActive, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy
		FROM dbo.Program
		ORDER BY ProgramName;
	END TRY
	BEGIN CATCH
		THROW;
	END CATCH
END;