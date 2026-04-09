
-- usp_Role_Delete: Deletes a role based on the provided RoleId.

CREATE OR ALTER PROCEDURE usp_Role_Delete
(
	@RoleId AS UNIQUEIDENTIFIER,
	@LoggedInUserId AS UNIQUEIDENTIFIER
)
AS
BEGIN
	SET NOCOUNT ON;
	IF NOT EXISTS( 
	SELECT 1 FROM Users 
	JOIN User_Role_XRef ON Users.UserId = User_Role_XRef.UserId 
	JOIN Roles ON User_Role_XRef.RoleId = Roles.RoleId 
	WHERE Roles.RoleName = 'Admin' AND Users.UserId = @LoggedInUserId
	)
	BEGIN
			PRINT N'Unauthorized: Only Admin users can delete roles';
			RAISERROR('Unauthorized: Only Admin users can delete roles.', 16, 1);
		RETURN;
	END
	BEGIN TRY
		DELETE FROM dbo.Roles
		WHERE RoleId = @RoleId;
		PRINT N'Role deleted successfully.'
		SELECT 'Role deleted successfully.' AS Message;
	END TRY
	BEGIN CATCH
			PRINT N'Error occurred while deleting the role.';
			THROW;
	END CATCH
END;
GO

EXEC usp_Role_Delete
@RoleId = '5C47B258-BDBF-48B9-94E4-3015E280C901',
@LoggedInUserId='B5F42EA0-638A-47F6-8A2D-51380A8AAC9A';


EXEC usp_Role_Delete '04BF1E43-C287-4739-8DAB-49D988B3C56F','B5F42EA0-638A-47F6-8A2D-51380A8AAC9A'