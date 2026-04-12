-- Program Store Procedure for creating a new program

CREATE OR ALTER PROCEDURE dbo.usp_Program_Update
(
	@ProgramId AS UNIQUEIDENTIFIER,
	@ProgramName AS NVARCHAR(100),
	@ProgramCode AS NVARCHAR(20),
	@ProgramDescription AS NVARCHAR(255),
	@ProgramDuration AS INT,
	@SemesterCount AS INT,
	@IsActive AS BIT,
	@UpdateBy AS UNIQUEIDENTIFIER,
	@LoggedInUserId AS UNIQUEIDENTIFIER
)
AS
BEGIN
	SET NOCOUNT ON;
	IF NOT EXISTS (SELECT 1 FROM dbo.Program WHERE ProgramId = @ProgramId)
	BEGIN
		PRINT 'Program not found.';
		RAISERROR('Program not found.', 16, 1);
		RETURN;
	END
	IF @ProgramDuration <= 0
	BEGIN
		PRINT 'Program duration must be a positive integer.';
		RAISERROR('Program duration must be a positive integer.', 16, 1);
		RETURN;
	END
	IF @SemesterCount <= 0
	BEGIN
		PRINT 'Semester count must be a positive integer.';
		RAISERROR('Semester count must be a positive integer.', 16, 1);
		RETURN;
	END
	IF NOT EXISTS 
	(
		SELECT 1 FROM dbo.Users
		JOIN dbo.User_Role_XRef ON dbo.Users.UserId = dbo.User_Role_XRef.UserId
		JOIN dbo.Roles ON dbo.User_Role_XRef.RoleId = dbo.Roles.RoleId
		WHERE dbo.Roles.RoleName = 'Admin' AND dbo.Users.UserId = @LoggedInUserId
	)
	BEGIN
		PRINT 'Unauthorized: Only Admin users can update programs.';
		RAISERROR('Unauthorized: Only Admin users can update programs.', 16, 1);
		RETURN;
	END
	BEGIN TRY
		UPDATE dbo.Program
		SET ProgramName = @ProgramName,
			ProgramCode = @ProgramCode,
			ProgramDescription = @ProgramDescription,
			ProgramDuration = @ProgramDuration,
			SemesterCount = @SemesterCount,
			IsActive = @IsActive,
			UpdatedAt = SYSDATETIME(),
			UpdatedBy = @UpdateBy
		WHERE ProgramId = @ProgramId;
		
		PRINT 'Program updated successfully.';
		SELECT 'Program updated successfully.' AS Message;
	END TRY
	BEGIN CATCH
		SELECT 
			ERROR_NUMBER() AS ErrorNumber,
			ERROR_SEVERITY() AS ErrorSeverity,
			ERROR_STATE() AS ErrorState,
			ERROR_PROCEDURE() AS ErrorProcedure,
			ERROR_LINE() AS ErrorLine,
			ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
END;
GO


Exec dbo.usp_Program_Update
	@ProgramId = 'D89C928F-D035-F111-97E5-F7682F9CBEC5',
	@ProgramName = 'Bachelor of Science in Computer Science',
	@ProgramCode = 'B.Sc',
	@ProgramDescription = 'Undergraduate program focused on computer science fundamentals and applications.',
	@ProgramDuration = 4,
	@SemesterCount = 8,
	@IsActive = 1,
	@UpdateBy = 'B5F42EA0-638A-47F6-8A2D-51380A8AAC9A',
	@LoggedInUserId = 'B5F42EA0-638A-47F6-8A2D-51380A8AAC9A';