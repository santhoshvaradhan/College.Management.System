
CREATE OR ALTER PROCEDURE usp_Regulation_Create
(
  @RegulationName AS NVARCHAR(255) NOT NULL,
  @RegulationCode AS NVARCHAR(255) NOT NULL,
  @Description AS NVARCHAR(MAX) NULL,
  @LoggedInUserId AS UNIQUEIDENTIFIER
)
AS
BEGIN
  SET NOCOUNT ON;
  IF NOT EXISTS 
  (
	SELECT 1 FROM dbo.Users
	JOIN dbo.User_Role_XRef ON dbo.Users.UserId = dbo.User_Role_XRef.UserId
	JOIN dbo.Roles ON dbo.User_Role_XRef.RoleId = dbo.Roles.RoleId
	WHERE dbo.Roles.RoleName = 'Admin' AND dbo.Users.UserId = @LoggedInUserId
  ) 
  BEGIN
	PRINT 'Unauthorized access: Only Admin users can create regulations.';
	RAISERROR('Unauthorized: Only Admin users can create regulations.', 16, 1);
  END;
  BEGIN TRY
	INSERT INTO dbo.Regulation (RegulationId, RegulationName, RegulationCode, Description, IsActive, CreatedAt)
	VALUES (NEWID(), @RegulationName, @RegulationCode, @Description, 1, SYSDATETIME());
	
	SELECT 'Regulation created successfully.' AS Message;
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
	