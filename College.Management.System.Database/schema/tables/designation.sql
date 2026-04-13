-- Designation table or position like director, cashier,exam officer etc..

CREATE TABLE dbo.Designation
(
	DesignationId UNIQUEIDENTIFIER NOT NULL CONSTRAINT PK_Designation PRIMARY KEY DEFAULT NEWSEQUENTIALID(),
	DesignationName NVARCHAR(255) NOT NULL,
	IsActive BIT NOT NULL DEFAULT 1,
	[Description] NVARCHAR(MAX) NULL,
	CreatedAt DATETIME2 NOT NULL DEFAULT SYSDATETIME(),
	CreatedBy UNIQUEIDENTIFIER NULL,
	UpdatedAt DATETIME2 NULL,
	UpdatedBy UNIQUEIDENTIFIER NULL
); 


EXEC sp_rename 'dbo.Designation.DesingationId', 'DesignationId', 'COLUMN';

EXEC sp_help 'dbo.Designation';

ALTER TABLE dbo.Designation ADD
Description NVarchar(Max);