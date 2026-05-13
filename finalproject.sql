create database universitydb;
use universitydb;

create table Departments (
    Department_id int primary key,
    Department_name varchar(30) not null
);
insert into Departments values
(1, 'computer science'),
(2, 'mathematics'),
(3, 'physics'),
(4, 'chemistry'),
(5, 'biology');
select * from Departments;

insert into Departments values (6, 'electronics');

Update Departments 
set Department_name = 'electrical'
where Department_id = 6;

delete from Departments 
where Department_id = 6;

create table Students (
    Student_id int primary key,
    Firstname varchar(10) not null,
    Lastname varchar(10) not null,
    Email varchar(30) not null unique,
    Birthdate date not null,
    Enrollment_date date not null
);
insert into Students values
(1, 'rahul', 'sharma', 'rahul1@email.com', '2000-01-10', '2020-08-01'),
(2, 'aman', 'verma', 'aman@email.com', '2001-02-11', '2021-08-01'),
(3, 'rohit', 'mehta', 'rohit@email.com', '2000-03-12', '2022-08-01'),
(4, 'neha', 'gupta', 'neha@email.com', '1999-04-13', '2019-08-01'),
(5, 'pooja', 'singh', 'pooja@email.com', '2002-05-14', '2023-08-01'),
(6, 'karan', 'patel', 'karan@email.com', '2001-06-15', '2022-08-01'),
(7, 'simran', 'kaur', 'simran@email.com', '2000-07-16', '2021-08-01'),
(8, 'vikas', 'yadav', 'vikas@email.com', '1998-08-17', '2018-08-01'),
(9, 'anita', 'joshi', 'anita@email.com', '2002-09-18', '2023-08-01'),
(10, 'deepak', 'kumar', 'deepak@email.com', '2001-10-19', '2020-08-01');
select * from Students;


create table Courses (
    Course_id int primary key,
    Course_name varchar(50) not null,
    Department_id int,
    Credits int,
    foreign key (Department_id) references Departments(Department_id)
);
insert into courses values
(101, 'introduction to sql', 1, 3),
(102, 'data structures', 1, 4),
(103, 'calculus', 2, 3),
(104, 'linear algebra', 2, 4),
(105, 'mechanics', 3, 3),
(106, 'thermodynamics', 3, 4),
(107, 'organic chemistry', 4, 3),
(108, 'biochemistry', 5, 4),
(109, 'genetics', 5, 3),
(110, 'database systems', 1, 4);
select * from Courses;


create table Instructors (
    Instructor_id int primary key,
    Firstname varchar(10) not null,
    Lastname varchar(10) not null,
    Email varchar(30) not null unique,
    Department_id int not null,
    Salary decimal(10,2) int,
    foreign key (Department_id) references Departments(Department_id)
);
insert into Instructors values
(1, 'alice', 'johnson', 'alice@univ.com', 1, 60000),
(2, 'bob', 'lee', 'bob@univ.com', 2, 55000),
(3, 'charlie', 'kim', 'charlie@univ.com', 3, 58000),
(4, 'david', 'singh', 'david@univ.com', 4, 52000),
(5, 'emma', 'brown', 'emma@univ.com', 5, 61000);
select * from Instructors;


create table Enrollments (
    Enrollmentid int primary key,
    Student_id int not null,
    Course_id int not null,
    Enrollment_date date not null,
    foreign key (Student_id) references Students(Student_id),
    foreign key (Course_id) references Courses(Course_id)
);
drop table Enrollments;
insert into Enrollments values
(1,1,101,'2020-08-01'),
(2,1,102,'2020-08-02'),
(3,2,101,'2021-08-01'),
(4,2,102,'2021-08-02'),
(5,3,101,'2022-08-01'),
(6,3,103,'2022-08-02'),
(7,4,101,'2019-08-01'),
(8,4,104,'2019-08-02'),
(9,5,101,'2023-08-01'),
(10,5,105,'2023-08-02'),
(11,6,101,'2022-08-01'),
(12,6,106,'2022-08-02'),
(13,7,101,'2021-08-01'),
(14,7,107,'2021-08-02'),
(15,8,101,'2018-08-01'),
(16,8,108,'2018-08-02'),
(17,9,101,'2023-08-01'),
(18,9,109,'2023-08-02'),
(19,10,101,'2020-08-01')
insert into Enrollments values (21,2,101,'2024-01-01');
select * from Enrollments;

-- Queries to Perfrom-- 

#Q1 Perfroming CRUD (Create,Read,Update,Delete) Operations on all tables?
#Department table.
-- create (insert)--
insert into Departments values (6, 'electronics');
-- read(select)--
select * from Departments;
-- update--
Update Departments 
set Department_name = 'electrical'
where Department_id = 6;
-- Delete--
delete from Departments 
where Department_id = 6;

#Students table.
-- create(Insert)--
insert into Students values (11, 'Prince', 'mali', 'princemali@email.com', '2000-01-01', '2024-01-01');
-- read(select)--
select * from Students;
-- update--
Update Students 
set Email = 'maliprince@email.com'
where student_id = 11;
-- delete--
delete from Students 
where student_id = 11;

#Course table.
-- create(Insert)--
insert into courses values (111, 'python basics', 1, 3);
-- read(select)--
select * from Courses;
-- update--
Update courses 
set credits = 4
where course_id = 111;
-- delete--
delete from courses 
where course_id = 111;

#Instructors table.
-- create(Insert)--
insert into Instructors values (6, 'Asvin', 'kumar', 'asvin@univ.com', 1, 50000);
-- read(select)--
select * from Instructors;
-- update --
Update Instructors 
set salary = 55000
where Instructor_id = 6;
-- delete--
delete from Instructors 
where Instructor_id = 6;

#Enrollment table.
-- create(Insert)--
insert into Enrollments values (11, 1, 101, '2024-01-01');
-- read(select)--
select * from Enrollments;
-- update--
Update Enrollments 
set course_id = 102
where Enrollmentid = 11;
-- delete
delete from Enrollments 
where Enrollmentid = 11;

#Q2 Retrieve srudents who enrolled after 2022?
select * from Students 
where Enrollment_date > '2022-12-31';

#Q3 Retrieve courses offerd by the mathematis department with a limit of 5 courses?
select * 
from courses
where Department_id = 2
limit 5;

#Q4 Find the total number of students enrolled in each course, only showing courses with more than 1 student?
select course_id, count(student_id) as totalstudents
from Enrollments
group by course_id
having count(student_id) >= 1;

#Q5 Find students who are enrolled in both courses introduction to sql and data structures?
select s.student_id, s.firstname from Students s
join Enrollments e on s.student_id = e.student_id
where e.course_id in (101,102)
group by s.student_id, s.firstname
having count(distinct e.course_id) = 2;

#Q6 Find students who are either enrolled in  introduction to sql or data structures?
select distinct s.student_name
from students s
join Enrollments e on s.student_id = e.student_id
join courses c on e.course_id = c.course_id
where c.course_name in ('Introduction to SQL', 'Data Structures');

#Q7 Calculate the average number of credits for all courses?
select avg(credits) as average_credits from courses;

#Q8 Find the maximum salary of instructors in the Computer Science department?
select max(i.salary)
from Instructors i
join Departments d 
on i.Department_id = d.Department_id
where d.Department_name = 'computer science';

#Q9 Count the number of students enrolled in each department?
select c.Department_id, count(e.student_id)
from courses c
join Enrollments e on c.course_id=e.course_id
group by c.Department_id;

#Q10 Inner Join Retrieve students and their corresponding courses?
select s.firstname, c.course_name
from students s
join Enrollments e on s.student_id=e.student_id
join courses c on e.course_id=c.course_id;

#Q11 Left Join retrieve all students and their corresponding courses if any?
select s.firstname, c.course_name
from students s
left join Enrollments e on s.student_id=e.student_id
left join courses c on e.course_id=c.course_id;

#Q12 Subquery find students Enrolled in courses that have more than 10 students?
select * from students 
where student_id in (select student_id from Enrollments 
where course_id in (select course_id from Enrollments 
group by course_id 
having count(student_id) > 10)
);

#Q13 Extract the year from the EnrollmentDate of students?
select student_id, year(Enrollment_date)
from Students;

#Q14 Concatenate the instructor's first and last name?
select concat(firstname,' ',lastname)
from Instructors;

#Q15 Calculate the running total of students enrolled in courses?
select count(student_id) from Enrollments;

#Q16 Label students as Senior' or Junior based on their year of enrollment If the enrollment date is more than 4 years from the current date put the label Senior otherwise Junior?
select student_id, firstname,
case
    when Enrollment_date <= date_sub(curdate(), interval 4 year) then 'senior'
    else 'junior'
end as status
from students;