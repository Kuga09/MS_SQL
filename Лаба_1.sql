create database MasterDB

use MasterDB

CREATE TABLE STUDENTS (
    student_id INT IDENTITY(1,1),
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    middle_name VARCHAR(100),
    birth_date DATE NOT NULL,
    group_id INT NOT NULL
    CONSTRAINT PK_STUDENTS PRIMARY KEY(student_id)
)

CREATE TABLE GROUPS (
    group_id INT NOT NULL,
    group_name VARCHAR(100) NOT NULL,
    course_number INT NOT NULL,
    CONSTRAINT PK_GROUPS PRIMARY KEY (group_id)
)

CREATE TABLE PLANS (
    group_id INT NOT NULL,
    subject_id INT NOT NULL,
    CONSTRAINT PK_PLAN PRIMARY KEY (group_id, subject_id)
)

CREATE TABLE SUBJECTS (
    subject_id INT NOT NULL,
    subject_name VARCHAR(200) NOT NULL,
    hours_count INT NOT NULL,
    CONSTRAINT PK_SUBJECTS PRIMARY KEY (subject_id)
)

ALTER TABLE STUDENTS ADD CONSTRAINT FK_STUDENTS_GROUPS FOREIGN KEY (group_id) REFERENCES GROUPS(group_id)
ALTER TABLE PLANS ADD CONSTRAINT FK_PLAN_SUBJECTS FOREIGN KEY (subject_id) REFERENCES SUBJECTS(subject_id)
ALTER TABLE PLANS ADD CONSTRAINT FK_PLAN_GROUPS FOREIGN KEY (group_id) REFERENCES GROUPS(group_id)

INSERT INTO SUBJECTS (subject_id, subject_name, hours_count) VALUES
(1, '������', 200),
(2, '����������', 120),
(3, '������ ��������������', 70),
(4, '�������������� ��', 130),
(5, '�������� ����������� ����������������', 90),
(6, '��������-��������������� ����������������', 70)

INSERT INTO GROUPS(group_id, group_name, course_number) VALUES
(1,'��135',1),
(2,'��235',2),
(3,'��335',3)

INSERT INTO PLANS (group_id,subject_id) VALUES
(1,1),
(1,2),
(2,3),
(2,4),
(3,5),
(3,6)

INSERT INTO STUDENTS (first_name, last_name, middle_name, birth_date, group_id) VALUES
('�����', '���������', '���������', '1997-12-25', 1),
('����', '������', NULL, '1985-12-25', 1),
('�������', '���������', NULL, '1987-09-22', 2),
('������', '���������', '����������', '1992-06-17', 2),
('�������', '�������', '���������', '1992-05-13', 3),
('�������', '������', NULL, '1992-08-14', 3)

UPDATE GROUPS SET group_name = '134' WHERE group_id = 1

UPDATE SUBJECTS SET hours_count = hours_count + 30 WHERE subject_name IN ('�������� ����������� ����������������', '��������-��������������� ����������������')

ALTER TABLE SUBJECTS ADD control_form VARCHAR(50)

UPDATE SUBJECTS SET control_form = '�������'

UPDATE SUBJECTS SET control_form = '�����' WHERE subject_name = '������ ��������������'

ALTER TABLE STUDENTS DROP COLUMN middle_name