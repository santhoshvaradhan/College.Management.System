
-- Reader: List all courses, optional filter by year

CREATE OR ALTER PROCEDURE dbo.usp_Course_GetAll
(
	@CourseYear INT = NULL
)
AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		SELECT CourseId, CourseName, CourseCode, CourseDescription, CourseYear, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy
		FROM dbo.Course
		WHERE (@CourseYear IS NULL OR CourseYear = @CourseYear)
		ORDER BY CourseName;
	END TRY
	BEGIN CATCH
		THROW;
	END CATCH
END;
GO