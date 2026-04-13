
-- seeding Course

DECLARE @ProgramId_BE UNIQUEIDENTIFIER = (SELECT ProgramId FROM dbo.Program WHERE ProgramCode = 'B.E'),
		@ProgramId_BTech UNIQUEIDENTIFIER = (SELECT ProgramId FROM dbo.Program WHERE ProgramCode = 'B.Tech') ;

PRINT @ProgramId_BE;

INSERT INTO dbo.Course (CourseName, CourseCode, CourseDescription, CourseYear, CreatedBy, ProgramId)
VALUES
('COMPUTER SCIENCE AND ENGINEERING', 'CSE101', 'Introduction to Computer Science and Engineering', 1, NULL, @ProgramId_BE),
('ELECTRONICS AND COMMUNICATION ENGINEERING', 'ECE101', 'Introduction to Electronics and Communication Engineering', 1, NULL,@ProgramId_BE),
('MECHANICAL ENGINEERING', 'ME101', 'Introduction to Mechanical Engineering', 1, NULL, @ProgramId_BE),
('CIVIL ENGINEERING', 'CE101', 'Introduction to Civil Engineering', 1, NULL, @ProgramId_BE),
('ELECTRONIC AND ELECTRICAL ENGINEERING', 'EEE101', 'Introduction to Electronic and Electrical Engineering', 1, NULL, @ProgramId_BE),
('INFORMATION TECHNOLOGY', 'IT101', 'Introduction to Information Technology', 1, NULL,@ProgramId_BTech);

select * from Course;

DELETE  FROM dbo.Course;