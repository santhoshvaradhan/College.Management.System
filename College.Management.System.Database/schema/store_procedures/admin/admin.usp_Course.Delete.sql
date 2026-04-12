-- Created by GitHub Copilot in SSMS - review carefully before executing
-- usp_Course_Delete: Deletes a course. Restricted to Admin users only.

CREATE OR ALTER PROCEDURE dbo.usp_Course_Delete
(
	@CourseId UNIQUEIDENTIFIER,
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
		RAISERROR('Unauthorized: Only Admin users can delete courses.', 16, 1);
		RETURN;
	END
	BEGIN TRY
		DELETE FROM dbo.Course WHERE CourseId = @CourseId;
		SELECT 'Course deleted successfully.' AS Message;
	END TRY
	BEGIN CATCH
		THROW;
	END CATCH
END;
GO