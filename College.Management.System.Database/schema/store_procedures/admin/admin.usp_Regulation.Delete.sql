
CREATE OR ALTER PROCEDURE dbo.usp_Regulation_Delete
(
  @RegulationId AS UNIQUEIDENTIFIER,
  @LoggedInUserId AS UNIQUEIDENTIFIER
)
AS
BEGIN
  SET NOCOUNT ON;
  IF NOT EXISTS (SELECT 1 FROM dbo.Regulation WHERE RegulationId = @RegulationId)
  BEGIN
	PRINT 'Regulation not found.';
	RAISERROR('Regulation not found.', 16, 1);
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
	PRINT 'Unauthorized access: Only Admin users can delete regulations.';
	RAISERROR('Unauthorized: Only Admin users can delete regulations.', 16, 1);
	RETURN;
  END
  BEGIN TRY
	DELETE FROM dbo.Regulation WHERE RegulationId = @RegulationId;
	PRINT 'Regulation deleted successfully.';
	SELECT 'Regulation deleted successfully.' AS Message;
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