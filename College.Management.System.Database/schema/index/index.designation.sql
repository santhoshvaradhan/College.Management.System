
CREATE INDEX IX_Designation_DesignationName ON dbo.Designation(DesignationName)
INCLUDE (IsActive,DesignationId);


SELECT * FROM Designation WHERE Designation.DesignationName='Director';

Drop INDEX IX_Designation_DesignationName ON dbo.Designation;

SELECT * FROM Designation;