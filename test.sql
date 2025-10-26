create database TEST  -- создали БД

use TEST -- переключились на ее использование

create table Mil_Rank  -- созданем вспомогательную таблицу
(
ID int primary key not null identity(1,1), -- PRIMARY KEY важно
mil_rank_name varchar(30)
)

create table Main  -- создаем главную таблицу
(
ID int primary key not null identity(1000,1), -- PRIMARY KEY важно
surname varchar(30) not null,
name varchar(20) not null,
last_name varchar(20),
category int

constraint fk_Mil_Rank_to_Main foreign key (category) references Mil_Rank (ID) -- создаем связь между таблицами К ПОЛЮ ГЛАВНОЙ ТАБЛИЦЫ PRIMARY KEY ВСПОМОГАТЕЛЬНОЙ ТАБЛИЦЫ
)


-- наполняем вспомогательную таблицу
insert into Mil_Rank (mil_rank_name) values ('private')
insert into Mil_Rank (mil_rank_name) values ('major')
insert into Mil_Rank (mil_rank_name) values ('colonel')
insert into Mil_Rank (mil_rank_name) values ('sergeant')
insert into Mil_Rank (mil_rank_name) values ('marshall')

-- смотрим, что вышло
select * from Mil_Rank

-- наполняем главную таблицу
insert into Main (surname, name, last_name, category) values ('Ivanov', 'Ivan', 'Ivanovich', 5)
insert into Main (surname, name, last_name, category) values ('Ivanov', 'Ivan', 'Ivanovich', 10) -- здесь будет ошибка, т.к. во вспомогательной таблице нет ID=10

-- смотрим, что есть в главной таблице
select * from Main -- поле category не нравится

-- делаем так, чтобы было красиво
select Main.ID, surname, name, last_name, Mil_Rank.mil_rank_name from Main
    join Mil_Rank on Mil_Rank.ID = Main.category


