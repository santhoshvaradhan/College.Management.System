
-- usp_Course_Create: Creates a new course. Restricted to Admin users only.

CREATE OR ALTER PROCEDURE dbo.usp_Course_Create
(
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
		RAISERROR('Unauthorized: Only Admin users can create courses.', 16, 1);
		RETURN;
	END
	BEGIN TRY
		INSERT INTO dbo.Course (CourseName, CourseCode, CourseDescription, CourseYear, CreatedBy, CreatedAt)
		VALUES (@CourseName, @CourseCode, @CourseDescription, @CourseYear, @LoggedInUserId, SYSDATETIME());
		SELECT 'Course created successfully.' AS Message;
	END TRY
	BEGIN CATCH
		THROW;
	END CATCH
END;
GO