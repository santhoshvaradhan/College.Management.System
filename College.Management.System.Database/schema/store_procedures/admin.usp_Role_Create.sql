
-- usp_Role_Create: Inserts a new role into the Roles table with the provided details.
CREATE OR ALTER PROCEDURE usp_Role_Create
(
	@RoleName AS NVARCHAR(50),
	@Description AS NVARCHAR(255),
	@IsActive AS BIT,
	@CreatedBy AS UNIQUEIDENTIFIER
)
AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		INSERT INTO dbo.Roles (RoleId, RoleName, Description, IsActive, CreatedAt, CreatedBy)
		VALUES (NEWID(), @RoleName, @Description, @IsActive, SYSDATETIME(), @CreatedBy);
		
		SELECT 'Role created successfully.' AS Message;
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

Exec usp_Role_Create
	@RoleName = 'Test Role',
	@Description = 'This is a test role.',
	@IsActive = 1,
	@CreatedBy = 'B5F42EA0-638A-47F6-8A2D-51380A8AAC9A';
	GO
