-- seeding designation data

INSERT INTO dbo.Designation (DesignationId, DesignationName, [Description], IsActive, CreatedAt, CreatedBy)
VALUES
(NEWID(), 'Director', 'Director of the institution', 1, SYSDATETIME(), NULL),
(NEWID(), 'Principal', 'Principal of the institution', 1, SYSDATETIME(), NULL),
(NEWID(), 'Head of Department', 'Head of the department', 1, SYSDATETIME(), NULL),
(NEWID(), 'Professor', 'Professor in the department', 1, SYSDATETIME(), NULL),
(NEWID(), 'Associate Professor', 'Associate Professor in the department', 1, SYSDATETIME(), NULL),
(NEWID(), 'Assistant Professor', 'Assistant Professor in the department', 1, SYSDATETIME(), NULL),
(NEWID(), 'Lecturer', 'Lecturer in the department', 1, SYSDATETIME(), NULL),
(NEWID(), 'Lab Assistant', 'Lab Assistant in the department', 1, SYSDATETIME(), NULL),
(NEWID(), 'Clerk', 'Clerk in the department', 1, SYSDATETIME(), NULL),
(NEWID(), 'Accountant', 'Accountant in the department', 1, SYSDATETIME(), NULL),
(NEWID(), 'Librarian', 'Librarian in the department', 1, SYSDATETIME(), NULL),
(NEWID(), 'Exam Officer', 'Exam Officer in the department', 1, SYSDATETIME(), NULL);

SELECT * FROM dbo.Designation;

UPDATE dbo.Designation SET [Description] = 'Librarian of the institution' WHERE DesignationName = 'Librarian';

