
-- usp_Course_Update: Updates all course fields. Restricted to Admin users only.

CREATE OR ALTER PROCEDURE dbo.usp_Course_Update
(
	@CourseId UNIQUEIDENTIFIER,
	@CourseName NVARCHAR(100),
	@CourseCode NVARCHAR(20),
	@CourseDescription NVARCHAR(255),
	@CourseYear INT,
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
		RAISERROR('Unauthorized: Only Admin users can update courses.', 16, 1);
		RETURN;
	END
	BEGIN TRY
		UPDATE dbo.Course
		SET CourseName = @CourseName,
			CourseCode = @CourseCode,
			CourseDescription = @CourseDescription,
			CourseYear = @CourseYear,
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