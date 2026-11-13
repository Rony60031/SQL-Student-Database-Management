USE master;
GO

IF DB_ID('student') IS NOT NULL
BEGIN
    ALTER DATABASE student SET SINGLE_USER
    WITH ROLLBACK IMMEDIATE;

    DROP DATABASE student;
END
GO

CREATE DATABASE student;
GO

USE student;
GO

-- 1. Student Table
CREATE TABLE Student (
    Sno CHAR(10) PRIMARY KEY,
    Sname CHAR(20) NOT NULL,
    Ssex CHAR(10),
    Sage TINYINT,
    Sdept CHAR(20)
);
GO

-- 2. Course Table
CREATE TABLE Course (
    Cno CHAR(10) PRIMARY KEY,
    Cname CHAR(20) NOT NULL,
    Ccredit TINYINT,
    Semester TINYINT
);
GO

-- 3. SC Table
CREATE TABLE SC (
    sno CHAR(10) NOT NULL,
    cno CHAR(10) NOT NULL,
    mark SMALLINT,
    c_type CHAR(10),
    PRIMARY KEY (sno, cno),
    CHECK (mark >= 0 AND mark <= 100)
);
GO

-- 4. Student Records
INSERT INTO Student VALUES
('9512101','Li Yong','male',19,'CS'),
('9512102','Liu Chen','male',20,'CS'),
('9512103','Wang Min','female',20,'CS'),
('9521101','Zhang Li','male',22,'IS'),
('9521102','Wu Bin','female',21,'IS'),
('9521103','Zhang Hai','male',20,'IS'),
('9521104','Li Shan','female',19,'IS'),
('9531101','Qian Xiaoping','female',18,'MA'),
('9531102','Wang Dali','male',19,'MA');
GO

-- 5. Course Records
INSERT INTO Course VALUES
('c01','Computer literature',3,1),
('c02','VB',2,3),
('c03','Computer network',4,7),
('c04','Database',6,6),
('c05','Higher math',8,2),
('c06','Data structure',5,4);
GO

-- 6. SC Records
INSERT INTO SC VALUES
('9512101','c01',90,'compulsory'),
('9512101','c02',86,'optional'),
('9512101','c06',NULL,'compulsory'),
('9512102','c02',78,'optional'),
('9512102','c04',66,'compulsory'),
('9521102','c01',82,'optional'),
('9521102','c02',75,'optional'),
('9521102','c04',92,'compulsory'),
('9521102','c05',50,'compulsory'),
('9521103','c02',68,'optional'),
('9521103','c06',NULL,'compulsory'),
('9521104','c01',90,'compulsory'),
('9531101','c01',80,'optional'),
('9531101','c05',95,'compulsory'),
('9531102','c05',85,'compulsory');
GO

-- 7. Course Volume Table
CREATE TABLE c_volumn (
    cno CHAR(10) PRIMARY KEY,
    cname CHAR(20),
    currentStrength INT
);
GO

INSERT INTO c_volumn VALUES
('c01','Computer literature',4),
('c02','VB',4),
('c03','Java',0),
('c04','Database',2),
('c05','Higher math',3),
('c06','Data structure',2);
GO

-- 8. Verify All Tables
SELECT * FROM Student;
SELECT * FROM Course;
SELECT * FROM SC;
SELECT * FROM c_volumn;
GO