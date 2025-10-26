CREATE DATABASE UniversityDB;

USE UniversityDB;

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

-- Задания лабораторной

-- 1
SELECT last_name
FROM STUDENTS
WHERE last_name LIKE N'%б%' OR last_name LIKE N'%о%';

-- 2
SELECT *
FROM STUDENTS
WHERE last_name LIKE N'К%' AND middle_name IS NULL;

-- 3
SELECT *
FROM STUDENTS
WHERE LEN(last_name) >= 8;

-- 4
SELECT *
FROM STUDENTS
WHERE LEN(last_name) <> 7 AND last_name LIKE N'%а%';

-- 5
SELECT *
FROM STUDENTS
WHERE faculty = N'ФПМ' AND form = N'очная' AND year IN (1, 2)
ORDER BY middle_name;

-- 6
SELECT *
FROM STUDENTS
WHERE faculty = N'ФПК' AND form = N'заочная' AND exm > 6
ORDER BY exm DESC;

-- 7 
SELECT form, last_name, first_name, middle_name, subj, hours
FROM TEACHERS
WHERE faculty = N'ФПК'
ORDER BY form, last_name;

-- 8
SELECT *
FROM TEACHERS
WHERE faculty = N'ФПМ' AND year = 1 AND hours > 100;

-- 9 
SELECT *
FROM TEACHERS
WHERE middle_name IS NULL AND DATEDIFF(YEAR, start_work_date, GETDATE()) > 3;

-- 10 
SELECT DISTINCT s.*
FROM SUBJECTS s
INNER JOIN PLANS p ON s.subject_id = p.subject_id
INNER JOIN GROUPS g ON p.group_id = g.group_id
WHERE g.course_number = 3;

-- 11 
SELECT year, form, CONCAT(first_name, ' ', last_name) AS full_name, subj, hours
FROM TEACHERS
WHERE faculty = N'ФПК' AND hours > 100;

-- 12
SELECT faculty, year, form, CONCAT(first_name, ' ', last_name) AS full_name, subj
FROM TEACHERS
WHERE middle_name IS NULL;

-- 13
SELECT last_name, first_name, middle_name, birth_date
FROM TEACHERS
WHERE DATEDIFF(YEAR, birth_date, GETDATE()) > 30;

-- 14
SELECT last_name, first_name, middle_name, birth_date
FROM TEACHERS
WHERE DATEDIFF(YEAR, birth_date, GETDATE()) BETWEEN 35 AND 40
ORDER BY last_name;

-- 15
SELECT last_name, first_name, middle_name, birth_date
FROM TEACHERS
WHERE MONTH(birth_date) = 10
ORDER BY birth_date ASC;