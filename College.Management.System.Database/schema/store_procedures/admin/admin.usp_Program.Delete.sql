-- Program Delete Operation Store Procedure
 
CREATE or ALTER PROCEDURE usp_Program_Delete
(
	@ProgramId AS UNIQUEIDENTIFIER,
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
	IF NOT EXISTS 
	(
		SELECT 1 FROM dbo.Users
		JOIN dbo.User_Role_XRef ON dbo.Users.UserId = dbo.User_Role_XRef.UserId
		JOIN dbo.Roles ON dbo.User_Role_XRef.RoleId = dbo.Roles.RoleId
		WHERE dbo.Roles.RoleName = 'Admin' AND dbo.Users.UserId = @LoggedInUserId
	)
	BEGIN
		PRINT 'Unauthorized: Only Admin users can delete programs.';
		RAISERROR('Unauthorized: Only Admin users can delete programs.', 16, 1);
		RETURN;
	END
	BEGIN TRY
		DELETE FROM dbo.Program WHERE ProgramId = @ProgramId;
		PRINT 'Program deleted successfully.';
		SELECT 'Program deleted successfully.' AS Message;
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