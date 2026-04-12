-- Program table seeding script

INSERT INTO dbo.Program (ProgramName, ProgramCode, ProgramDescription, ProgramDuration, SemesterCount, CreatedBy)
VALUES 
('Bachelor of Science in Computer Science', 'B.Sc', 'Undergraduate program focused on computer science fundamentals and applications.', 4, 8, NULL),
('Bachelor of Arts', 'BA', 'Bachelor of Arts (BA) offers a wide range of specializations across humanities, social sciences, and languages, typically completed in three years over six semesters', 3, 6, NULL),
('Master of Business Administration', 'MBA', 'Graduate program designed to develop leadership and management skills for business professionals.', 2, 4, NULL),
('Bachelor of Engineering','B.E','Undergraduate program focused on engineering principles and practices.',4,8,NULL);

SELECT * FROM dbo.Program;

UPDATE dbo.Program SET SemesterCount = 6 , ProgramName = 'Bachelor of Science' WHERE ProgramId = 'D89C928F-D035-F111-97E5-F7682F9CBEC5';

INSERT INTO dbo.Program (ProgramName, ProgramCode, ProgramDescription, ProgramDuration, SemesterCount, CreatedBy)
VALUES 
('Bachelor of Technology', 'B.Tech', 'Undergraduate program focused on technology and applied sciences.', 4, 8, NULL);
