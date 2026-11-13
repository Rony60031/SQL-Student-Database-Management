USE student;
GO

-- Q6: Update student name
UPDATE V_Student_Marks
SET Sname = 'Li San'
WHERE Sno = '9521104';

-- Q6: Update course mark
UPDATE V_Student_Marks
SET mark = 95
WHERE Sno = '9521104'
AND Cname = 'Computer literature';
GO

-- Verify Q6
SELECT *
FROM V_Student_Marks
WHERE Sno = '9521104';
GO

-- Q7: Insert new student
INSERT INTO Student (Sno, Sname)
VALUES ('9531103', 'Zhao Ming');

-- Insert new course record
INSERT INTO SC (sno, cno, mark)
VALUES ('9531103', 'c06', 88);
GO

-- Verify Q7
SELECT *
FROM V_Student_Marks
WHERE Sno = '9531103';
GO