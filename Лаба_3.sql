CREATE DATABASE UniversityDB2

USE UniversityDB2

CREATE TABLE STUDENTS (
    student_id INT IDENTITY(1,1),
    first_name NVARCHAR(25) NOT NULL,
    last_name NVARCHAR(25) NOT NULL,
    middle_name NVARCHAR(25),
    form NVARCHAR(10) NOT NULL DEFAULT N'�����',
    faculty NVARCHAR(10) NOT NULL DEFAULT N'���',
    year INT NOT NULL DEFAULT 1,
    all_h INT DEFAULT NULL,
    inclass_h INT DEFAULT NULL,
    birth_date DATE,
    in_date DATE,   
    exm FLOAT DEFAULT NULL,
    group_id INT NULL,
    CONSTRAINT PK_STUDENTS PRIMARY KEY (student_id)
);

CREATE TABLE GROUPS (
    group_id INT IDENTITY(1,1),
    group_name VARCHAR(50) NOT NULL,
    course_number INT NOT NULL,
    CONSTRAINT PK_GROUPS PRIMARY KEY (group_id)
);

CREATE TABLE SUBJECTS (
    subject_id INT IDENTITY(1,1),
    subject_name VARCHAR(200) NOT NULL,
    hours_count INT NOT NULL,
    CONSTRAINT PK_SUBJECTS PRIMARY KEY (subject_id)
);

CREATE TABLE TEACHERS (
    teacher_id INT IDENTITY(1,1),
    last_name NVARCHAR(25) NOT NULL,
    first_name NVARCHAR(25) NOT NULL,
    middle_name NVARCHAR(25),
    subj NVARCHAR(150),
    form NVARCHAR(10) NOT NULL DEFAULT N'�����',
    faculty NVARCHAR(10) NOT NULL DEFAULT N'���',
    year INT DEFAULT 1 NOT NULL,
    hours INT DEFAULT NULL,
    birth_date DATE,
    start_work_date DATE,
    CONSTRAINT PK_TEACHERS PRIMARY KEY (teacher_id)
);

CREATE TABLE PLANS (
    group_id INT NOT NULL,
    subject_id INT NOT NULL,
    CONSTRAINT PK_PLAN PRIMARY KEY (group_id, subject_id)
);

ALTER TABLE STUDENTS ADD CONSTRAINT FK_STUDENTS_GROUPS FOREIGN KEY (group_id) REFERENCES GROUPS(group_id);
ALTER TABLE PLANS ADD CONSTRAINT FK_PLAN_SUBJECTS FOREIGN KEY (subject_id) REFERENCES SUBJECTS(subject_id);
ALTER TABLE PLANS ADD CONSTRAINT FK_PLAN_GROUPS FOREIGN KEY (group_id) REFERENCES GROUPS(group_id);

INSERT INTO GROUPS(group_name, course_number) 
VALUES (N'��135',1),(N'��235',2),(N'��335',3);

INSERT INTO SUBJECTS(subject_name, hours_count) 
VALUES 
(N'������',200),
(N'����������',120),
(N'������ ��������������',70),
(N'�������������� ��',130),
(N'�������� ����������� ���������������� ',90),
(N'��������-��������������� ����������������',70);

INSERT INTO STUDENTS 
(last_name,first_name,middle_name,form,faculty,year,all_h,inclass_h,birth_date,in_date,exm,group_id) 
VALUES
(N'���������',N'�',NULL,N'�������',N'���',1,300,100,'19831212','20160901',8,1),
(N'�������',N'�',N'�',N'�������',N'���',2,300,100,'19831012','20150901',8.4,2),
(N'�������',N'�',N'�',N'�������',N'���',3,300,100,'19811207','20140901',7,1),
(N'�������',N'�',N'�',N'�������',N'���',3,300,100,'19730215','20160901',8,3),
(N'�����',N'�',N'�',N'��������',N'���',1,500,400,'19931211','2016-09-01',4.5,1),
(N'�������',N'�',N'�',N'��������',N'���',1,500,400,'19831216','20150901',7.7,2),
(N'�����',N'�',N'�',N'��������',N'���',2,450,370,'19870627','20150901',6.7,3),
(N'�����������',N'�',N'�',N'��������',N'���',2,450,370,'19870723','20150901',7.6,1),
(N'������������',N'�',N'�',N'��������',N'���',2,450,370,'19870803','20150901',6.7,3),
(N'�������',N'�',N'�',N'�����',N'���',1,500,450,'19861027','20160901',7.4,3),
(N'���������',N'�',N'�',N'�����',N'���',1,500,450,'19950426','20160901',5.6,2),
(N'�������',N'�',N'�',N'�����',N'���',2,500,450,'19900425','20150901',3.4,2),
(N'��������',N'�',N'�',N'�����',N'���',2,500,450,'19890313','20150901',5.3,3),
(N'��������',N'�',N'�',N'�����',N'���',3,450,400, '19950705','20140901',7.7,2),
(N'���������',N'�',N'�',N'�������',N'���',1,350,100,'19640523','20160901',7.6,1),
(N'����������',N'�',N'�',N'�������',N'���',1,350,100,'19860914','20160901',4.7,2),
(N'�������',N'�',NULL,N'�������',N'���',2,360,120,'19920301', '20150901',7.7,1),
(N'������',N'�',NULL,N'�������',N'���',2,360,120,'19970325', '20150901',8.7,3),
(N'����������',N'�',N'�',N'�������',N'���',3,370,130, '19920525','20140901',7.7,1),
(N'�������',N'�',N'�',N'�������',N'���',3,370,130,'19940725','20140901',5.6,2);

INSERT INTO TEACHERS 
(last_name, first_name, middle_name, subj, form, faculty, year, hours, birth_date, start_work_date) 
VALUES
(N'��������',N'�',NULL,N'���������������� ����������',N'�����',N'���',1,150,'19831212','20160901'),
(N'��������',N'�',NULL,N'��������� � �������',N'�����',N'���',1,200,'19831212','20160901'),
(N'���������',N'�',N'�',N'������ �����������',N'�����',N'���',1,100,'19831212','20160901'),
(N'��������',N'�',NULL,N'���������������� ����������',N'�������',N'���',1,34,'19831212','20160901'),
(N'���������',N'�',N'�',N'��������� � �������',N'�������',N'���',1,50,'19831212','20160901'),
(N'���������',N'�',N'�',N'������ �����������',N'�������',N'���',1,16,'19831212','20160901'),
(N'�������',N'�',N'�',N'������ ��������',N'�����',N'���',2,150,'19860825','20140901'),
(N'�������',N'�',N'�',N'������ ���������� �������',N'�����',N'���',2,150,'19860825','20140901'),
(N'��������',N'�',N'�',N'���������� ����������',N'�����',N'���',2,150,'19791005','20100901'),
(N'�������',N'�',N'�',N'������ ��������',N'�������',N'���',2,40,'19860825','20140901'),
(N'�������',N'�',N'�',N'������ ���������� �������',N'�������',N'���',2,40,'19860825','20140901'),
(N'��������',N'�',N'�',N'���������� ����������',N'�������',N'���',2,40,'19791005','20100901'),
(N'�����',N'�',NULL,N'���������',N'�����',N'���',3,50,'19780712','20160901'),
(N'�����',N'�',NULL,N'����������',N'�����',N'���',3,50,'19780712','20160901'),
(N'���������',N'�',N'�',N'������ ��������� ��������',N'�����',N'���',3,150,'19831212','20160901');

INSERT INTO PLANS (group_id, subject_id) 
VALUES (1, 1),(1, 2),(2, 3),(2, 4),(3, 5),(3, 6);

UPDATE GROUPS SET group_name=N'��134' WHERE group_id=1;

DELETE FROM GROUPS WHERE group_name=N'��135';

UPDATE SUBJECTS SET hours_count=hours_count+30 WHERE subject_id IN (5,6);

ALTER TABLE SUBJECTS ADD control_form VARCHAR(50);

UPDATE SUBJECTS SET control_form = N'�����' WHERE subject_name = N'������ ��������������';

UPDATE SUBJECTS SET control_form = N'�������' WHERE subject_name <> N'������ ��������������';


-- ������� ������������ ����� 1

-- 1
SELECT last_name, first_name, middle_name, faculty, year
FROM STUDENTS
WHERE form = N'�������'AND DATEDIFF(YEAR, birth_date, GETDATE()) < 37;

-- 2
SELECT faculty, COUNT(*) AS student_count
FROM STUDENTS
GROUP BY faculty;

-- 3
SELECT form, COUNT(*) AS student_count
FROM STUDENTS
GROUP BY form;

-- 4
SELECT faculty, AVG(DATEDIFF(YEAR, birth_date, '2025-12-31')) AS avg_age
FROM STUDENTS
GROUP BY faculty;

-- 5
SELECT last_name, first_name, in_date, faculty, year, form
FROM STUDENTS
WHERE middle_name IS NULL;

-- 6
SELECT TOP 1 faculty, COUNT(*) AS student_count
FROM STUDENTS
WHERE YEAR(in_date) = 2015
GROUP BY faculty
ORDER BY student_count DESC;

-- 7 
SELECT faculty, form, COUNT(*) AS student_count
FROM STUDENTS
WHERE YEAR(in_date) = 2014
GROUP BY faculty, form;

-- 8
SELECT DISTINCT faculty
FROM STUDENTS
WHERE form = N'�������';

-- 9 
SELECT faculty, form, year
FROM STUDENTS
GROUP BY faculty, form, year
ORDER BY faculty, form, year;

-- 10 
SELECT faculty, form, COUNT(*) AS student_count
FROM STUDENTS
GROUP BY faculty, form;

-- 11 
SELECT faculty, form, year, COUNT(*) AS student_count
FROM STUDENTS
WHERE year IN (1, 3)
GROUP BY faculty, form, year;

-- 12
SELECT faculty, year, COUNT(*) AS foreign_students
FROM STUDENTS
WHERE middle_name IS NULL
GROUP BY faculty, year;

-- 13
SELECT faculty, year, COUNT(*) AS high_marks_students
FROM STUDENTS
WHERE exm > 7.5
GROUP BY faculty, year;

-- 14
SELECT faculty, form, COUNT(*) AS older_students
FROM STUDENTS
WHERE DATEDIFF(YEAR, birth_date, GETDATE()) > 45
GROUP BY faculty, form;

-- 15
SELECT faculty, form, year, COUNT(*) AS young_students
FROM STUDENTS
WHERE DATEDIFF(YEAR, birth_date, GETDATE()) < 27
GROUP BY faculty, form, year;

-- 16
SELECT faculty, COUNT(*) AS surname_C_students
FROM STUDENTS
WHERE last_name LIKE N'�%'
GROUP BY faculty;

-- ������� � JOIN���
INSERT INTO STUDENTS 
(last_name,first_name,middle_name,form,faculty,year,all_h,inclass_h,birth_date,in_date,exm,group_id) 
VALUES
(N'��������',N'�',NULL,N'�������',N'���',1,300,100,'19831212','20160901',8,1),
(N'�����',N'�',N'�',N'�������',N'���',2,300,100,'19831012','20150901',8.4,2);

SELECT DISTINCT
    TEACHERS.last_name,
    TEACHERS.first_name,
    TEACHERS.middle_name
FROM TEACHERS
LEFT JOIN STUDENTS ON TEACHERS.last_name = STUDENTS.last_name
WHERE STUDENTS.last_name IS NOT NULL
ORDER BY TEACHERS.last_name, TEACHERS.first_name;

SELECT DISTINCT 
    STUDENTS.last_name,
    STUDENTS.first_name,
    STUDENTS.middle_name
FROM TEACHERS
RIGHT JOIN STUDENTS ON TEACHERS.last_name = STUDENTS.last_name
WHERE TEACHERS.last_name IS NULL
ORDER BY STUDENTS.last_name, STUDENTS.first_name;

SELECT  
    TEACHERS.last_name AS teacher_last_name,
    TEACHERS.first_name AS teacher_first_name,
    TEACHERS.middle_name AS teacher_middle_name,
    TEACHERS.form,
    STUDENTS.last_name AS student_last_name,
    STUDENTS.first_name AS student_first_name,
    STUDENTS.middle_name AS student_middle_name
FROM TEACHERS
JOIN STUDENTS ON TEACHERS.form = STUDENTS.form
ORDER BY TEACHERS.last_name, TEACHERS.first_name, STUDENTS.last_name, STUDENTS.first_name;


-- ������� ������������ ����� 2

-- 1
CREATE PROCEDURE CountStudentsByFacultyAndForm
    @Faculty NVARCHAR(10),
    @Form NVARCHAR(10)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT @Faculty AS faculty,
           @Form AS form,
           COUNT(*) AS student_count
    FROM STUDENTS
    WHERE faculty = @Faculty AND form = @Form;
END;

EXEC CountStudentsByFacultyAndForm @Faculty = N'���', @Form = N'�������';

-- 2
CREATE PROCEDURE CountSubjectsByFaculty
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @FPM INT, @FPK INT, @Total INT, @Common INT;

    SELECT @FPM = COUNT(DISTINCT subj) FROM TEACHERS WHERE faculty = N'���';
    SELECT @FPK = COUNT(DISTINCT subj) FROM TEACHERS WHERE faculty = N'���';
    SELECT @Total = COUNT(DISTINCT subj) FROM TEACHERS;
    
    SELECT @Common = COUNT(DISTINCT subj)
    FROM TEACHERS 
    WHERE faculty = N'���' AND subj IN (
        SELECT subj FROM TEACHERS WHERE faculty = N'���'
    );

    PRINT CONCAT('��� ��� ��������� ', @FPK, ' ���������,');
    PRINT CONCAT('��� ��� ��������� ', @FPM, ' ���������,');
    PRINT CONCAT('����� ', @Total, ' ��������� (', @Common, ' �� ������� �����).');
END;

EXEC CountSubjectsByFaculty;

-- 3
CREATE PROCEDURE AddStudentToFacultyForm
    @LastName NVARCHAR(25),
    @FirstName NVARCHAR(25),
    @MiddleName NVARCHAR(25) = NULL,
    @Faculty NVARCHAR(10),
    @Form NVARCHAR(10),
    @BirthDate DATE,
    @InDate DATE
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO STUDENTS (
        last_name, first_name, middle_name,
        faculty, form, year,
        birth_date, in_date
    )
    VALUES (
        @LastName, @FirstName, @MiddleName,
        @Faculty, @Form, 1,
        @BirthDate, @InDate
    );

    PRINT CONCAT('��������: ', @LastName, ' ', @FirstName, ' (', @Faculty, ', ', @Form, ')');
END;

EXEC AddStudentToFacultyForm
    @LastName = N'������',
    @FirstName = N'����',
    @MiddleName = N'���������',
    @Faculty = N'���',
    @Form = N'�����',
    @BirthDate = '2000-05-15',
    @InDate = '2025-09-01';