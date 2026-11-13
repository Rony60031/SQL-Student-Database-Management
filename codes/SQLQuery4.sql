USE student;
GO

-- View 1: Students in IS Department
CREATE VIEW V_IS_Students AS
SELECT *
FROM Student
WHERE Sdept = 'IS';
GO

-- View 2: Female Students
CREATE VIEW V_Female_Students AS
SELECT *
FROM Student
WHERE Ssex = 'female';
GO

-- View 3: Student and Course Information
CREATE VIEW V_Student_Course_Info AS
SELECT
    s.Sno, s.Sname, s.Sdept,
    c.Cno, c.Cname, c.Ccredit
FROM Student s
JOIN SC sc ON s.Sno = sc.sno
JOIN Course c ON sc.cno = c.Cno;
GO

-- View 4: Student Course Marks
CREATE VIEW V_Student_Marks AS
SELECT
    s.Sno, s.Sname, c.Cname, sc.mark
FROM Student s
JOIN SC sc ON s.Sno = sc.sno
JOIN Course c ON sc.cno = c.Cno;
GO

-- View 5: Number of Courses per Student
CREATE VIEW V_Student_Course_Count AS
SELECT
    sno,
    COUNT(*) AS CourseCount
FROM SC
GROUP BY sno;
GO

-- View 6: Total Obtained Credits
CREATE VIEW V_Student_Total_Credits AS
SELECT
    s.Sno,
    SUM(CASE WHEN sc.mark >= 60 THEN c.Ccredit ELSE 0 END)
    AS TotalCredits
FROM Student s
JOIN SC sc ON s.Sno = sc.sno
JOIN Course c ON sc.cno = c.Cno
GROUP BY s.Sno;
GO

-- View 7: Courses with Credits >= 3
CREATE VIEW V_Courses_Credit_3 AS
SELECT *
FROM Course
WHERE Ccredit >= 3;
GO

-- Check all views
SELECT name
FROM sys.views
WHERE name LIKE 'V_%';
GO