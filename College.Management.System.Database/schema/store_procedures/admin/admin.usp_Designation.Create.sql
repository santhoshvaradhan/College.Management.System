-- designation stored procedure for creating a new designation

CREATE PROCEDURE dbo.usp_Designation_Create
(
	@DesignationName NVARCHAR(255),
	@Description NVARCHAR(MAX),
	@IsActive BIT,
	@CreatedBy UNIQUEIDENTIFIER
)
AS
BEGIN
	SET NOCOUNT ON;
	IF NOT EXISTS(
		SELECT 1 FROM dbo.Users
		JOIN dbo.User_Role_XRef ON dbo.Users.UserId = dbo.User_Role_XRef.UserId
		JOIN dbo.Roles ON dbo.User_Role_XRef.RoleId = dbo.Roles.RoleId
		WHERE dbo.Roles.RoleName = 'Admin' AND dbo.Users.UserId = @CreatedBy
	)
	BEGIN
		RAISERROR('Unauthorized: Only Admin users can create designations.', 16, 1);
		RETURN;
	END
	BEGIN TRY
	INSERT INTO dbo.Designation (DesignationName, Description, IsActive, CreatedBy)
	VALUES (@DesignationName, @Description, @IsActive, @CreatedBy);
	SELECT 'Designation created successfully.' AS Message;
	END TRY
	BEGIN CATCH
		THROW;
	END CATCH
END;