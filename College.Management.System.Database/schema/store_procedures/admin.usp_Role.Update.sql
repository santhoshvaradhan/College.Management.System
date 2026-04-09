-- usp_Role_Update: Updates an existing role's details based on the provided RoleId.

CREATE OR ALTER PROCEDURE usp_Role_Update
(
	@RoleId AS UNIQUEIDENTIFIER,
	@RoleName AS NVARCHAR(50),
	@Description AS NVARCHAR(255),
	@IsActive AS BIT,
	@UpdatedBy AS UNIQUEIDENTIFIER
)
AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		UPDATE dbo.Roles
		SET 
			RoleName = @RoleName,
			Description = @Description,
			IsActive = @IsActive,
			UpdatedAt = SYSDATETIME(),
			UpdatedBy = @UpdatedBy
		WHERE RoleId = @RoleId;
		
		SELECT 'Role updated successfully.' AS Message;
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