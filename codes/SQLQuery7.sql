USE student;
GO

ALTER VIEW V_Student_Total_Credits AS
SELECT
    s.Sno,
    ISNULL(SUM(
        CASE
            WHEN sc.mark >= 60 THEN c.Ccredit
            ELSE 0
        END
    ), 0) AS TotalCredits,
    COUNT(sc.cno) AS TotalCourses
FROM Student s
LEFT JOIN SC sc ON s.Sno = sc.sno
LEFT JOIN Course c ON sc.cno = c.Cno
GROUP BY s.Sno;
GO

-- Final Result
SELECT
    Sno,
    TotalCredits,
    TotalCourses
FROM V_Student_Total_Credits
ORDER BY Sno;
GO