use master
go
drop database DBslide
go
create database DBslide
go
use DBslide
CREATE TABLE section (
  section_id int NOT NULL,
  section_name varchar(50),
  delegate_id int NOT NULL
  CONSTRAINT PK_section PRIMARY KEY (section_id)
)

--drop TABLE section



CREATE TABLE professor (
  professor_id int NOT NULL,
  professor_name varchar(30) NOT NULL,
  professor_surname varchar(30) NOT NULL,
  section_id int NOT NULL,
  professor_office int NOT NULL,
  professor_email varchar(30) NOT NULL,
  professor_hire_date datetime NOT NULL,
  professor_wage int NOT NULL,
  CONSTRAINT PK_professor PRIMARY KEY (professor_id),
  constraint FK_professor_section foreign key (section_id) references section (section_id)
)

--drop TABLE professor
CREATE TABLE course (
  course_id varchar(8) NOT NULL ,
  course_name varchar(200) NOT NULL ,
  course_ects decimal(3,1) NOT NULL,
  professor_id int NOT NULL,
  CONSTRAINT PK_course PRIMARY KEY (course_id),
  constraint FK_course_professor foreign key (professor_id) references professor (professor_id)
)

--drop TABLE course 


CREATE TABLE student (
  student_id int NOT NULL identity(1,1), -- incremente d'une unité
  first_name varchar(50),
  last_name varchar(50),
  birth_date datetime,
  login varchar(50),
  section_id int,
  year_result int,
  course_id varchar(6) NOT NULL,
  CONSTRAINT PK_student PRIMARY KEY (student_id),
  constraint FK_student_section foreign key (section_id) references section (section_id)
)


--drop TABLE student
alter table section 
add constraint FK_delegate_id foreign key (delegate_id)
	references student (student_id)

--ALTER TABLE section alter column delegate_id int not null 
--alter table section drop constraint  FK_delegate_id */pour faire drop table student*/

-- alter table student add constraint increment (student_id) identity(1,1) /*( this has been construcetd in table student)*/

--alter table student drop column course_id


CREATE TABLE grade (
  grade char(2) NOT NULL check (grade in ('E','TB','B','S','F','I','IG')),
  lower_bound int NOT NULL,
  upper_bound int NOT NULL,
  CONSTRAINT PK_grade PRIMARY KEY (grade)
)

--drop  TABLE grade
