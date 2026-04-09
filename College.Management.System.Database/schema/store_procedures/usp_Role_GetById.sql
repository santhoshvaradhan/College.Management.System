
-- usp_Role_GetById: Retrieves role details based on the provided RoleId.

CREATE OR ALTER PROCEDURE usp_Role_GetById
(
	@UserId AS UNIQUEIDENTIFIER
)
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
		FROM dbo.Roles
		WHERE RoleId = @UserId;
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




-- Store procedure testing
EXEC usp_Role_GetById '04BF1E43-C287-4739-8DAB-49D988B3C56F';
GO







	
