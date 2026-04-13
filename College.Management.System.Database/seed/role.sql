
INSERT INTO dbo.Roles (RoleId, RoleName, Description, IsActive, CreatedAt, CreatedBy, UpdatedAt, UpdatedBy)
VALUES
(NEWID(), 'Admin', 'Administrator with full access to the system', 1, SYSDATETIME(), NULL, NULL, NULL),
(NEWID(), 'Student', 'Students with limited access to the system', 1, SYSDATETIME(), NULL, NULL, NULL),
(NEWID(), 'Staff', 'College employee with partial access to the system', 1, SYSDATETIME(), NULL, NULL, NULL);

SELECT * FROM dbo.Roles;