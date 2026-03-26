-- Designation table or position like director, cashier,exam officer etc..

CREATE TABLE dbo.Designation
(
	DesingationId UNIQUEIDENTIFIER NOT NULL CONSTRAINT PK_Designation PRIMARY KEY DEFAULT NEWSEQUENTIALID(),
	DesignationName NVARCHAR(255) NOT NULL,
	CreatedAt DATETIME2 NOT NULL DEFAULT SYSDATETIME(),
	CreatedBy UNIQUEIDENTIFIER NULL,
	UpdatedAt DATETIME2 NULL,
	UpdatedBy UNIQUEIDENTIFIER NULL
);