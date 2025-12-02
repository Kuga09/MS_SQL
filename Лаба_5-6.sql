CREATE DATABASE UniversityDB3

USE UniversityDB3

CREATE TABLE STUDENTS (
    student_id INT IDENTITY(1,1),
    first_name NVARCHAR(25) NOT NULL,
    last_name NVARCHAR(25) NOT NULL,
    middle_name NVARCHAR(25),
    form NVARCHAR(10) NOT NULL DEFAULT N'очная',
    faculty NVARCHAR(10) NOT NULL DEFAULT N'ФПМ',
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
    form NVARCHAR(10) NOT NULL DEFAULT N'очная',
    faculty NVARCHAR(10) NOT NULL DEFAULT N'фпм',
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
VALUES (N'ПО135',1),(N'ПО235',2),(N'ПО335',3);

INSERT INTO SUBJECTS(subject_name, hours_count) 
VALUES 
(N'Физика',200),
(N'Математика',120),
(N'Основы алгоритмизации',70),
(N'Проектирование БД',130),
(N'Средства визуального программирования ',90),
(N'Объектно-ориентированное программирование',70);

INSERT INTO STUDENTS 
(last_name,first_name,middle_name,form,faculty,year,all_h,inclass_h,birth_date,in_date,exm,group_id) 
VALUES
(N'Стрынгель',N'К',NULL,N'заочная',N'ФПК',1,300,100,'19831212','20160901',8,1),
(N'Козлова',N'Д',N'Е',N'заочная',N'ФПК',2,300,100,'19831012','20150901',8.4,2),
(N'Федоров',N'Н',N'Н',N'заочная',N'ФПК',3,300,100,'19811207','20140901',7,1),
(N'Рингель',N'П',N'О',N'заочная',N'ФПК',3,300,100,'19730215','20160901',8,3),
(N'Бежик',N'Н',N'Н',N'вечерняя',N'ФПК',1,500,400,'19931211','2016-09-01',4.5,1),
(N'Осипчик',N'Н',N'Н',N'вечерняя',N'ФПК',1,500,400,'19831216','20150901',7.7,2),
(N'Белый',N'С',N'С',N'вечерняя',N'ФПК',2,450,370,'19870627','20150901',6.7,3),
(N'Ботяновский',N'А',N'С',N'вечерняя',N'ФПК',2,450,370,'19870723','20150901',7.6,1),
(N'Слободницкий',N'С',N'А',N'вечерняя',N'ФПК',2,450,370,'19870803','20150901',6.7,3),
(N'Рогатка',N'П',N'Р',N'очная',N'ФПМ',1,500,450,'19861027','20160901',7.4,3),
(N'Федоренко',N'П',N'Р',N'очная',N'ФПМ',1,500,450,'19950426','20160901',5.6,2),
(N'Зингель',N'П',N'В',N'очная',N'ФПМ',2,500,450,'19900425','20150901',3.4,2),
(N'Михеенок',N'Л',N'Н',N'очная',N'ФПМ',2,500,450,'19890313','20150901',5.3,3),
(N'Савицкая',N'Л',N'Н',N'очная',N'ФПМ',3,450,400, '19950705','20140901',7.7,2),
(N'Ковальчук',N'О',N'Е',N'заочная',N'ФПМ',1,350,100,'19640523','20160901',7.6,1),
(N'Заболотная',N'Л',N'И',N'заочная',N'ФПМ',1,350,100,'19860914','20160901',4.7,2),
(N'Ковриго',N'И',NULL,N'заочная',N'ФПМ',2,360,120,'19920301', '20150901',7.7,1),
(N'Шарапо',N'М',NULL,N'заочная',N'ФПМ',2,360,120,'19970325', '20150901',8.7,3),
(N'Сафроненко',N'Н',N'Л',N'заочная',N'ФПМ',3,370,130, '19920525','20140901',7.7,1),
(N'Зайцева',N'Т',N'Я',N'заочная',N'ФПМ',3,370,130,'19940725','20140901',5.6,2);

INSERT INTO TEACHERS 
(last_name, first_name, middle_name, subj, form, faculty, year, hours, birth_date, start_work_date) 
VALUES
(N'Скворцов',N'К',NULL,N'Дифференциальные исчисления',N'очная',N'ФПМ',1,150,'19831212','20160901'),
(N'Скворцов',N'К',NULL,N'Геометрия и алгебра',N'очная',N'ФПМ',1,200,'19831212','20160901'),
(N'Сидоренко',N'Л',N'К',N'Теория вероятности',N'очная',N'ФПМ',1,100,'19831212','20160901'),
(N'Скворцов',N'К',NULL,N'Дифференциальные исчисления',N'заочная',N'ФПМ',1,34,'19831212','20160901'),
(N'Сидоренко',N'Л',N'К',N'Геометрия и алгебра',N'заочная',N'ФПМ',1,50,'19831212','20160901'),
(N'Сидоренко',N'Л',N'К',N'Теория вероятности',N'заочная',N'ФПМ',1,16,'19831212','20160901'),
(N'Круглов',N'К',N'Д',N'Теория множеств',N'очная',N'ФПМ',2,150,'19860825','20140901'),
(N'Круглов',N'К',N'Д',N'Методы численного анализа',N'очная',N'ФПМ',2,150,'19860825','20140901'),
(N'Загорова',N'К',N'Д',N'Прикладная статистика',N'очная',N'ФПМ',2,150,'19791005','20100901'),
(N'Круглов',N'К',N'Д',N'Теория множеств',N'заочная',N'ФПМ',2,40,'19860825','20140901'),
(N'Круглов',N'К',N'Д',N'Методы численного анализа',N'заочная',N'ФПМ',2,40,'19860825','20140901'),
(N'Загорова',N'К',N'Д',N'Прикладная статистика',N'заочная',N'ФПМ',2,40,'19791005','20100901'),
(N'Зуров',N'П',NULL,N'Философия',N'очная',N'ФПМ',3,50,'19780712','20160901'),
(N'Зуров',N'П',NULL,N'Социология',N'очная',N'ФПМ',3,50,'19780712','20160901'),
(N'Сидоренко',N'Л',N'К',N'Методы машинного обучения',N'очная',N'ФПМ',3,150,'19831212','20160901');

INSERT INTO PLANS (group_id, subject_id) 
VALUES (1, 1),(1, 2),(2, 3),(2, 4),(3, 5),(3, 6);

UPDATE GROUPS SET group_name=N'ПО134' WHERE group_id=1;

DELETE FROM GROUPS WHERE group_name=N'ПО135';

UPDATE SUBJECTS SET hours_count=hours_count+30 WHERE subject_id IN (5,6);

ALTER TABLE SUBJECTS ADD control_form VARCHAR(50);

UPDATE SUBJECTS SET control_form = N'зачет' WHERE subject_name = N'Основы алгоритмизации';

UPDATE SUBJECTS SET control_form = N'экзамен' WHERE subject_name <> N'Основы алгоритмизации';


-- Задания лабораторной часть 1

--1
CREATE FUNCTION GetStudentStatus (@middle_name NVARCHAR(25))
RETURNS NVARCHAR(20)
AS
BEGIN
    DECLARE @status NVARCHAR(20);
    
    IF @middle_name IS NULL OR @middle_name = ''
        SET @status = N'иностранец';
    ELSE
        SET @status = N'гражданин';
    
    RETURN @status;
END;

SELECT 
    last_name,
    first_name,
    middle_name,
    dbo.GetStudentStatus(middle_name) AS citizenship
FROM STUDENTS;

--2
CREATE FUNCTION GetTeacherHours (@last_name NVARCHAR(25))
RETURNS INT
AS
BEGIN
    DECLARE @total_hours INT;
    
    SELECT @total_hours = SUM(hours)
    FROM TEACHERS
    WHERE last_name = @last_name;
    
    RETURN ISNULL(@total_hours, 0);
END;

SELECT dbo.GetTeacherHours(N'Скворцов') AS teacher_hours;


-- Задания лабораторной часть 2

--1
CREATE TRIGGER StudentExamUpdate
ON STUDENTS
AFTER UPDATE
AS
BEGIN
    IF UPDATE(exm)
    BEGIN
        DECLARE @faculty NVARCHAR(10);
        DECLARE @old_avg FLOAT;
        DECLARE @new_avg FLOAT;
        DECLARE @old_exm FLOAT;
        DECLARE @new_exm FLOAT;
        
        SELECT @faculty = faculty, @new_exm = exm FROM inserted;
        SELECT @old_exm = exm FROM deleted;
        
        SELECT @old_avg = (SUM(exm) - @new_exm + @old_exm) / COUNT(*)
        FROM STUDENTS
        WHERE faculty = @faculty AND exm IS NOT NULL;
        
        SELECT @new_avg = AVG(exm)
        FROM STUDENTS
        WHERE faculty = @faculty AND exm IS NOT NULL;
        
        IF @new_avg > @old_avg
            PRINT N'Средний балл повысился';
        ELSE IF @new_avg < @old_avg
            PRINT N'Средний балл понизился';
        ELSE
            PRINT N'Средний балл не изменился';
    END
END;

UPDATE STUDENTS SET exm = 9.0 WHERE student_id = 10;

--2
CREATE TABLE COUNTS (
    Count_form INT DEFAULT 0,
    Count_stud INT DEFAULT 0);

INSERT INTO COUNTS (Count_form, Count_stud) 
VALUES ((SELECT COUNT(DISTINCT form) FROM STUDENTS),
        (SELECT COUNT(*) FROM STUDENTS));

SELECT * FROM COUNTS;
SELECT DISTINCT form FROM STUDENTS;

--2.1
CREATE TRIGGER StudentInsert
ON STUDENTS
AFTER INSERT
AS
BEGIN
    DECLARE @new_form NVARCHAR(10);
    SELECT @new_form = form FROM inserted;
    
    UPDATE COUNTS SET Count_stud = Count_stud + 1;
    
    IF (SELECT COUNT(*) FROM STUDENTS WHERE form = @new_form) = 1
    BEGIN
        UPDATE COUNTS SET Count_form = Count_form + 1;
        PRINT N'Добавлена новая форма обучения.';
    END
END;

INSERT INTO STUDENTS (last_name, first_name, form, faculty, year, group_id)
VALUES (N'Иванов', N'И', N'дистанционная', N'ФПМ', 1, 1);
SELECT * FROM COUNTS;

--2.2
CREATE TRIGGER StudentFormUpdate
ON STUDENTS
AFTER UPDATE
AS
BEGIN
    IF UPDATE(form)
    BEGIN
        DECLARE @old_form NVARCHAR(10);
        DECLARE @new_form NVARCHAR(10);
        
        SELECT @old_form = form FROM deleted;
        SELECT @new_form = form FROM inserted;
        
        IF NOT EXISTS (SELECT 1 FROM STUDENTS WHERE form = @old_form)
        BEGIN
            UPDATE COUNTS SET Count_form = Count_form - 1;
            PRINT N'Форма ' + @old_form + N' больше не используется.';
        END
        
        IF (SELECT COUNT(*) FROM STUDENTS WHERE form = @new_form) = 1
        BEGIN
            UPDATE COUNTS SET Count_form = Count_form + 1;
            PRINT N'Добавлена новая форма ' + @new_form;
        END
    END
END;

INSERT INTO STUDENTS (last_name, first_name, form, faculty, year, group_id)
VALUES (N'Петров', N'П', N'очная', N'ФПМ', 1, 1);
SELECT * FROM COUNTS;

--2.3
CREATE TRIGGER StudentDelete
ON STUDENTS
AFTER DELETE
AS
BEGIN
    DECLARE @deleted_form NVARCHAR(10);
    SELECT @deleted_form = form FROM deleted;
    
    UPDATE COUNTS SET Count_stud = Count_stud - 1;
    
    IF NOT EXISTS (SELECT 1 FROM STUDENTS WHERE form = @deleted_form)
    BEGIN
        UPDATE COUNTS SET Count_form = Count_form - 1;
        PRINT N'Форма ' + @deleted_form + N' больше не используется.';
    END
END;

DELETE FROM STUDENTS WHERE last_name = N'Петров';
SELECT * FROM COUNTS;

DELETE FROM STUDENTS WHERE last_name = N'Иванов';
SELECT * FROM COUNTS;

SELECT * FROM COUNTS;
SELECT DISTINCT form FROM STUDENTS;


-- Задания лабораторной часть 3

--1.1
CREATE VIEW View_Students_FPK
AS
SELECT 
    last_name AS Фамилия,
    first_name AS Имя,
    middle_name AS Отчество,
    year AS Курс,
    form AS Форма
FROM STUDENTS
WHERE faculty = N'ФПК';

SELECT * FROM View_Students_FPK;

--1.2
CREATE VIEW View_Hours_Zaochnaya
AS
SELECT 
    faculty AS Факультет,
    year AS Курс,
    SUM(all_h) AS Часы
FROM STUDENTS
WHERE form = N'заочная'
GROUP BY faculty, year;

SELECT * FROM View_Hours_Zaochnaya;

--1.3
CREATE VIEW View_Otlichniki
AS
SELECT 
    faculty AS Факультет,
    year AS Курс,
    form AS Форма,
    COUNT(*) AS Количество_отличников
FROM STUDENTS
WHERE exm > 8
GROUP BY faculty, year, form;

SELECT * FROM View_Otlichniki;

--1.4
CREATE VIEW View_Looser_Students
AS
SELECT 
    last_name AS Фамилия,
    first_name AS Имя,
    middle_name AS Отчество,
    faculty AS Факультет,
    year AS Курс,
    form AS Форма,
    exm AS Оценка,
    (SELECT AVG(exm) FROM STUDENTS WHERE exm < 6) AS Средний_балл_слабоуспевающих
FROM STUDENTS
WHERE exm < 6;

SELECT * FROM View_Looser_Students;

--2
--Все представления предназначены только для чтения, т.к. нарушают критерии модифицируемости.