-- Created by GitHub Copilot in SSMS - review carefully before executing
-- Reader: Get course by ID

CREATE OR ALTER PROCEDURE dbo.usp_Course_GetById
(
	@CourseId UNIQUEIDENTIFIER
)
AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		SELECT CourseId, CourseName, CourseCode, CourseDescription, CourseYear, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy
		FROM dbo.Course
		WHERE CourseId = @CourseId;
	END TRY
	BEGIN CATCH
		THROW;
	END CATCH
END;
GO