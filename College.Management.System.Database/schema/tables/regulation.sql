--Master table for regulations, which can be linked to various entities such as Batch, others tables;

CREATE TABLE dbo.Regulation
(

	RegulationId UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
	RegulationCode NVARCHAR(255) NOT NULL,
	[Description] NVARCHAR(MAX) NULL,
	IsActive BIT NOT NULL DEFAULT 1,
	CreatedAt DATETIME2 NOT NULL DEFAULT SYSDATETIME(),
	CreatedBy UNIQUEIDENTIFIER NULL,
	UpdatedAt DATETIME2 NULL,
	UpdatedBy UNIQUEIDENTIFIER NULL

	  
);

