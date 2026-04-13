-- Created by GitHub Copilot in SSMS - review carefully before executing
-- usp_Course_Delete: Deletes a course. Restricted to Admin users only.

CREATE OR ALTER PROCEDURE dbo.usp_Course_Delete
(
	@CourseId UNIQUEIDENTIFIER,
	@LoggedInUserId UNIQUEIDENTIFIER,
	@DeleteType BIT = 1 -- 1 for hard delete, 0 for soft delete (default is hard delete
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
		RAISERROR('Unauthorized: Only Admin users can delete courses.', 16, 1);
		RETURN;
	END
	BEGIN TRY
	IF @DeleteType = 1
	BEGIN
		DELETE FROM dbo.Course WHERE CourseId = @CourseId;
		SELECT 'Course deleted successfully.' AS Message;
	END 
	ELSE
	BEGIN
		UPDATE dbo.Course
		SET IsActive = 0,
			UpdatedAt = SYSDATETIME(),
			UpdatedBy = @LoggedInUserId
		WHERE CourseId = @CourseId;
		SELECT 'Course deactivated successfully.' AS Message;
	END
	END TRY
	BEGIN CATCH
		THROW;
	END CATCH
END;
GO