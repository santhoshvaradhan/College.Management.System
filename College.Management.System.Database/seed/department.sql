-- Department data seeding

Declare @ProgramId_BE UNIQUEIDENTIFIER = (SELECT ProgramId FROM dbo.Program WHERE ProgramCode = 'B.E'),
		@ProgramId_BTech UNIQUEIDENTIFIER = (SELECT ProgramId FROM dbo.Program WHERE ProgramCode = 'B.Tech');

INSERT INTO dbo.Department (DepartmentId, ProgramId, DepartmentName, DepartmentCode, Description, IsActive, CreatedAt, CreatedBy)
VALUES
(NEWID(),@ProgramId_BE , 'Computer Science and Engineering', 'CSE', 'Department of Computer Science and Engineering', 1, SYSDATETIME(), NULL),
(NEWID(),@ProgramId_BE , 'Electronics and Communication Engineering', 'ECE', 'Department of Electronics and Communication Engineering', 1, SYSDATETIME(), NULL),
(NEWID(), @ProgramId_BE, 'Mechanical Engineering', 'MECH', 'Department of Mechanical Engineering', 1, SYSDATETIME(), NULL),
(NEWID(), @ProgramId_BE, 'Civil Engineering', 'CIVIL', 'Department of Civil Engineering', 1, SYSDATETIME(), NULL),
(NEWID(), @ProgramId_BE, 'Electrical and Electronics Engineering', 'EEE', 'Department of Electrical and Electronics Engineering', 1, SYSDATETIME(), NULL),
(NEWID(),@ProgramId_BTech , 'Information Technology', 'IT', 'Department of Information Technology', 1, SYSDATETIME(), NULL);

SELECT * FROM dbo.Department;


