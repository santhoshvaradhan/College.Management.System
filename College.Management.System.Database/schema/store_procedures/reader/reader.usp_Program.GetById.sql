
CREATE OR ALTER PROCEDURE dbo.usp_Program_GetById
(
	@ProgramId AS UNIQUEIDENTIFIER
)
AS
BEGIN
	SET NOCOUNT ON;
	IF NOT EXISTS (SELECT 1 FROM dbo.Program WHERE ProgramId = @ProgramId)
	BEGIN
		PRINT 'Program not found.';
		RAISERROR('Program not found.', 16, 1);
		RETURN;
	END
	BEGIN TRY
		SELECT ProgramId, ProgramName, ProgramCode, ProgramDescription, ProgramDuration, SemesterCount, IsActive, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy
		FROM dbo.Program
		WHERE ProgramId = @ProgramId;
	END TRY
	BEGIN CATCH
		THROW;
	END CATCH
END;

EXEC SP_HELP 'Batch'