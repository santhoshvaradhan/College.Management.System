-- Created by GitHub Copilot in SSMS - review carefully before executing
-- Instructor: Update only course description

CREATE OR ALTER PROCEDURE dbo.usp_Course_InstructorUpdate
(
	@CourseId UNIQUEIDENTIFIER,
	@CourseDescription NVARCHAR(255),
	@LoggedInUserId UNIQUEIDENTIFIER
)
AS
BEGIN
	SET NOCOUNT ON;
	IF NOT EXISTS(
		SELECT 1 FROM dbo.Users
		JOIN dbo.User_Role_XRef ON dbo.Users.UserId = dbo.User_Role_XRef.UserId
		JOIN dbo.Roles ON dbo.User_Role_XRef.RoleId = dbo.Roles.RoleId
		WHERE dbo.Roles.RoleName IN ('Instructor', 'Admin') AND dbo.Users.UserId = @LoggedInUserId
	)
	BEGIN
		RAISERROR('Unauthorized: Only Instructor and Admin users can update courses.', 16, 1);
		RETURN;
	END
	BEGIN TRY
		UPDATE dbo.Course
		SET CourseDescription = @CourseDescription,
			UpdatedBy = @LoggedInUserId,
			UpdatedAt = SYSDATETIME()
		WHERE CourseId = @CourseId;
		SELECT 'Course updated successfully.' AS Message;
	END TRY
	BEGIN CATCH
		THROW;
	END CATCH
END;
GO