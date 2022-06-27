show databases;
create database student_faculty;
use student_faculty;
create table student(snum int, sname varchar(20), major varchar(20), level varchar(20), age int, primary key(snum));
create table faculty(fid int, fname varchar(20), deptid int, primary key(fid));
create table class(cname varchar(20), meets_at time, room varchar(20), fid int, primary key(cname), foreign key(fid) references faculty(fid)); 
create table enrolled(snum int, cname varchar(20), primary key(snum, cname), foreign key(snum) references student(snum), foreign key(cname) references class(cname));

insert into student values(1, 'A', 'cs', 'jr', 19);
insert into student values(2, 'B', 'cs', 'jr', 20);
insert into student values(3, 'C', 'cv', 'sr', 22);
insert into student values(4, 'D', 'cs', 'sr', 21);
insert into student values(5, 'E', 'cv', 'sr', 19);

select * from student;

insert into faculty values(20, 'Q', 1000);
insert into faculty values(21, 'W', 1001);
insert into faculty values(22, 'E', 1002);
insert into faculty values(23, 'R', 1003);
insert into faculty values(24, 'T', 1004);

select * from faculty;

insert into class values('class1', '08:00:00', 'r1', 20);
insert into class values('class2', '09:00:00', 'r2', 20);
insert into class values('class3', '10:30:00', 'r3', 21);
insert into class values('class4', '11:45:00', 'r4', 22);
insert into class values('class5', '01:40:00', 'r5', 22);

select * from class;

desc enrolled;

insert into enrolled values(1, 'class1');
insert into enrolled values(2, 'class2');
insert into enrolled values(3, 'class3');
insert into enrolled values(4, 'class4');
insert into enrolled values(5, 'class5');

select * from enrolled;

select * from student where 