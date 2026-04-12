-- usp_Role_GetAll: Retrieves a list of all roles in the system.
CREATE OR ALTER PROCEDURE usp_Role_GetAll
AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		SELECT
			RoleId, 
			RoleName, 
			[Description], 
			IsActive, 
			CreatedAt, 
			CreatedBy, 
			UpdatedAt, 
			UpdatedBy
		FROM dbo.Roles;
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
GO

EXEC usp_Role_GetAll;