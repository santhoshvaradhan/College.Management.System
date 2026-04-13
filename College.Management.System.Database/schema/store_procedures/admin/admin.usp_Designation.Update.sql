
CREATE OR ALTER PROCEDURE dbo.usp_Designation_Update
(
	@DesignationId UNIQUEIDENTIFIER,
	@DesignationName NVARCHAR(255),
	@Description NVARCHAR(MAX),
	@IsActive BIT,
	@LoggedInUserId UNIQUEIDENTIFIER
)
AS
BEGIN
	SET NOCOUNT ON;
	IF NOT EXISTS(SELECT 1 FROM dbo.Designation WHERE DesignationId = @DesignationId)
	BEGIN
		RAISERROR('Designation not found.', 16, 1);
		RETURN;
	END
	IF NOT EXISTS(
		SELECT 1 FROM dbo.Users
		JOIN dbo.User_Role_XRef ON dbo.Users.UserId = dbo.User_Role_XRef.UserId
		JOIN dbo.Roles ON dbo.User_Role_XRef.RoleId = dbo.Roles.RoleId
		WHERE dbo.Roles.RoleName = 'Admin' AND dbo.Users.UserId = @LoggedInUserId
	)
	BEGIN
		RAISERROR('Unauthorized: Only Admin users can update designations.', 16, 1);
		RETURN;
	END
	BEGIN TRY
	UPDATE dbo.Designation
	SET DesignationName = @DesignationName,
		Description = @Description,
		IsActive = @IsActive,
		UpdatedAt = SYSDATETIME(),
		UpdatedBy = @LoggedInUserId
	WHERE DesignationId = @DesignationId;
	SELECT 'Designation updated successfully.' AS Message;
	END TRY
	BEGIN CATCH
		THROW;
	END CATCH
END;
