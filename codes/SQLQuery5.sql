USE student;
GO

-- Q1. Students with course score >= 90
SELECT Sname, Cname, mark
FROM V_Student_Marks
WHERE mark >= 90;
GO

-- Q2. Students taking more than 3 courses
SELECT Sno, CourseCount
FROM V_Student_Course_Count
WHERE CourseCount > 3;
GO

-- Q3. CS students taking more than 3 courses
SELECT s.Sname, v.CourseCount
FROM V_Student_Course_Count v
JOIN Student s ON v.Sno = s.Sno
WHERE v.CourseCount > 3
AND s.Sdept = 'CS';
GO

-- Q4. Students with total credits > 10
SELECT s.Sno, s.Sname, s.Sdept, v.TotalCredits
FROM V_Student_Total_Credits v
JOIN Student s ON v.Sno = s.Sno
WHERE v.TotalCredits > 10;
GO

-- Q5. Students older than 20
-- and total credits greater than 10
SELECT s.Sname, s.Sage, s.Sdept, v.TotalCredits
FROM V_Student_Total_Credits v
JOIN Student s ON v.Sno = s.Sno
WHERE s.Sage > 20
AND v.TotalCredits > 10;
GO