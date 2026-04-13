
CREATE OR ALTER PROCEDURE dbo.usp_Designation_Delete
(
	@DesignationId UNIQUEIDENTIFIER,
	@DeleteType INT,
	@LoggedInUserId UNIQUEIDENTIFIER
)
AS
BEGIN
	SET NOCOUNT ON;
	IF NOT EXISTS(
		SELECT 1 FROM dbo.Users
		JOIN dbo.User_Role_XRef ON dbo.Users.UserId = dbo.User_Role_XRef.UserId
		JOIN dbo.Roles ON dbo.User_Role_XRef.RoleId = dbo.Roles.RoleId
		WHERE dbo.Roles.RoleName = 'Admin' AND dbo.Users.UserId = @LoggedInUserId
	)
	BEGIN
		PRINT N'Unauthorized: Only Admin users can delete designations.';
		RAISERROR('Unauthorized: Only Admin users can delete designations.', 16, 1);
		RETURN;
	END
	IF @DeleteType = 1
	BEGIN
		DELETE FROM dbo.Designation
		WHERE DesignationId = @DesignationId;
		PRINT N'Designation deleted successfully.';
	END
	ELSE
	BEGIN
		UPDATE dbo.Designation
		SET IsActive = 0,
			UpdatedAt = SYSDATETIME(),
			UpdatedBy = @LoggedInUserId
		WHERE DesignationId = @DesignationId;

		PRINT N'Designation deactivated successfully.';
	END
END