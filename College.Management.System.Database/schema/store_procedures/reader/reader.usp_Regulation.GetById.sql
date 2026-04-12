
CREATE OR ALTER PROCEDURE dbo.usp_Regulation_GetById
(
  @RegulationId AS UNIQUEIDENTIFIER
)
AS
BEGIN
  SET NOCOUNT ON;
  BEGIN TRY
	SELECT RegulationId, RegulationName, RegulationCode, Description, IsActive, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy
	FROM dbo.Regulation
	WHERE RegulationId = @RegulationId;
  END TRY
  BEGIN CATCH
	SELECT 
	  ERROR_NUMBER() AS ErrorNumber,
	  ERROR_SEVERITY() AS ErrorSeverity,
	  ERROR_STATE() AS ErrorState,
	  ERROR_PROCEDURE() AS ErrorProcedure,
	  ERROR_LINE() AS ErrorLine,
	  ERROR_MESSAGE() AS ErrorMessage;
  END CATCH
END;