-- Program Store Procedure for creating a new program

CREATE OR ALTER PROCEDURE dbo.usp_Program_Create
(
	@ProgramName AS NVARCHAR(100),
	@ProgramCode AS NVARCHAR(20),
	@ProgramDescription AS NVARCHAR(255),
	@ProgramDuration AS INT,
	@SemesterCount AS INT,
	@IsActive AS BIT,
	@CreatedBy AS UNIQUEIDENTIFIER,
	@LoggedInUserId AS UNIQUEIDENTIFIER
)
AS
BEGIN
	SET NOCOUNT ON;
	IF EXISTS (SELECT 1 FROM dbo.Program WHERE ProgramCode = @ProgramCode)
	BEGIN
		PRINT 'A program with the same code already exists.';
		RAISERROR('A program with the same code already exists.', 16, 1);
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
		PRINT 'Unauthorized: Only Admin users can create programs.';
		RAISERROR('Unauthorized: Only Admin users can create programs.', 16, 1);
		RETURN;
	END
	BEGIN TRY
		INSERT INTO dbo.Program (ProgramId, ProgramName, ProgramCode, ProgramDescription, ProgramDuration, SemesterCount, IsActive, CreatedAt, CreatedBy)
		VALUES (NEWID(), @ProgramName, @ProgramCode, @ProgramDescription, @ProgramDuration, @SemesterCount, @IsActive, SYSDATETIME(), @CreatedBy);
		
		PRINT 'Program created successfully.';
		SELECT 'Program created successfully.' AS Message;
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