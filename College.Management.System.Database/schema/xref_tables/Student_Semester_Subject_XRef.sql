CREATE TABLE dbo.Student_Semester_Subject_XRef
(
	StudentSemesterSubjectXRefId UNIQUEIDENTIFIER CONSTRAINT PK_Student_Semester_Subject_XRef PRIMARY KEY DEFAULT NEWSEQUENTIALID(),
	StudentId UNIQUEIDENTIFIER NOT NULL,
    SemesterId UNIQUEIDENTIFIER NOT NULL,
	SubjectId UNIQUEIDENTIFIER NOT NULL,
	CreatedAt DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME(),
	CreatedBy UNIQUEIDENTIFIER NOT NULL,
	UpdatedAt DATETIME2 NULL,
	UpdatedBy UNIQUEIDENTIFIER NULL
    
	CONSTRAINT FK_Student_Semester_Subject_XRef_Student FOREIGN KEY (StudentId) REFERENCES dbo.Student(StudentId),
	CONSTRAINT FK_Student_Semester_Subject_XRef_Semester FOREIGN KEY (SemesterId) REFERENCES dbo.Semester(SemesterId) ,
	CONSTRAINT FK_Student_Semester_Subject_XRef_Subject FOREIGN KEY (SubjectId) REFERENCES dbo.Subject(SubjectId) 
);