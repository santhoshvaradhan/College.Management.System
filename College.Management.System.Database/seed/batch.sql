
DECLARE @Regulation_2017 UNIQUEIDENTIFIER ;
SET @Regulation_2017 = (SELECT RegulationId FROM Regulation WHERE RegulationCode = 'R2017');

DECLARE @Regulation_2021 UNIQUEIDENTIFIER = (SELECT RegulationId FROM Regulation WHERE RegulationCode = 'R2021');

INSERT INTO Batch (BatchId, DepartmentId, RegulationId, BatchName, BatchCode, StartDate, EndDate, IsActive, CreatedAt, CreatedBy)
VALUES
(NEWID(), (SELECT DepartmentId FROM Department WHERE DepartmentCode = 'CSE'), @Regulation_2017, 'CSE Batch 2017', 'CSE17', '2017-08-01', '2021-05-31', 1, SYSDATETIME(), NULL),
(NEWID(), (SELECT DepartmentId FROM Department WHERE DepartmentCode = 'CSE'), @Regulation_2021, 'CSE Batch 2021', 'CSE21', '2021-08-01', '2025-05-31', 1, SYSDATETIME(), NULL),
(NEWID(), (SELECT DepartmentId FROM Department WHERE DepartmentCode = 'ECE'), @Regulation_2017, 'ECE Batch 2017', 'ECE17', '2017-08-01', '2021-05-31', 1, SYSDATETIME(), NULL),
(NEWID(), (SELECT DepartmentId FROM Department WHERE DepartmentCode = 'ECE'), @Regulation_2021, 'ECE Batch 2021', 'ECE21', '2021-08-01', '2025-05-31', 1, SYSDATETIME(), NULL),
(NEWID(), (SELECT DepartmentId FROM Department WHERE DepartmentCode = 'MECH'), @Regulation_2017, 'MECH Batch 2017', 'MECH17', '2017-08-01', '2021-05-31', 1, SYSDATETIME(), NULL),
(NEWID(), (SELECT DepartmentId FROM Department WHERE DepartmentCode = 'MECH'), @Regulation_2021, 'MECH Batch 2021', 'MECH21', '2021-08-01', '2025-05-31', 1, SYSDATETIME(), NULL),
(NEWID(), (SELECT DepartmentId FROM Department WHERE DepartmentCode = 'CIVIL'), @Regulation_2017, 'CIVIL Batch 2017', 'CIVIL17', '2017-08-01', '2021-05-31', 1, SYSDATETIME(), NULL),
(NEWID(), (SELECT DepartmentId FROM Department WHERE DepartmentCode = 'CIVIL'), @Regulation_2021, 'CIVIL Batch 2021', 'CIVIL21', '2021-08-01', '2025-05-31', 1, SYSDATETIME(), NULL),
(NEWID(), (SELECT DepartmentId FROM Department WHERE DepartmentCode = 'EEE'), @Regulation_2017, 'EEE Batch 2017', 'EEE17', '2017-08-01', '2021-05-31', 1, SYSDATETIME(), NULL),
(NEWID(), (SELECT DepartmentId FROM Department WHERE DepartmentCode = 'EEE'), @Regulation_2021, 'EEE Batch 2021', 'EEE21', '2021-08-01', '2025-05-31', 1, SYSDATETIME(), NULL),
(NEWID(), (SELECT DepartmentId FROM Department WHERE DepartmentCode = 'IT'), @Regulation_2017, 'IT Batch 2017', 'IT17', '2017-08-01', '2021-05-31', 1, SYSDATETIME(), NULL),
(NEWID(), (SELECT DepartmentId FROM Department WHERE DepartmentCode = 'IT'), @Regulation_2021, 'IT Batch 2021', 'IT21', '2021-08-01', '2025-05-31', 1, SYSDATETIME(), NULL);

SELECT * FROM Batch;
