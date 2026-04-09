CREATE TABLE dbo.Staff_Subject_XRef
(
	StaffSubjectXRefId UNIQUEIDENTIFIER CONSTRAINT PK_Staff_Subject_XRef PRIMARY KEY DEFAULT NEWSEQUENTIALID(),
	StaffId UNIQUEIDENTIFIER NOT NULL,
	SubjectId UNIQUEIDENTIFIER NOT NULL,
	SemesterId UNIQUEIDENTIFIER NOT NULL,
	DepartmentId UNIQUEIDENTIFIER NULL,
	BatchId UNIQUEIDENTIFIER NULL,

	Constraint FK_Staff_Subject_XRef_Staff FOREIGN KEY (StaffId) REFERENCES dbo.Staff(StaffId) ON DELETE CASCADE,
	Constraint FK_Staff_Subject_XRef_Subject FOREIGN KEY (SubjectId) REFERENCES dbo.[Subject](SubjectId) ON DELETE CASCADE,
	Constraint FK_Staff_Subject_XRef_Semester FOREIGN KEY (SemesterId) REFERENCES dbo.Semester(SemesterId) ON DELETE CASCADE,
	Constraint FK_Staff_Subject_XRef_Department FOREIGN KEY (DepartmentId) REFERENCES dbo.Department(DepartmentId) ON DELETE CASCADE,
	Constraint FK_Staff_Subject_XRef_Batch FOREIGN KEY (BatchId) REFERENCES dbo.Batch(BatchId) ON DELETE NO ACTION

	);
	