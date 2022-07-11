show databases;
create database airline;
use airline;

create table Flight(flno int, f_from varchar(30), f_to varchar(30), distance int, departs time, arrives time, price int, primary key(flno));
create table Aircraft(aid int, aname varchar(30), cruisingrange int, primary key(aid));
create table Employee(eid int, ename varchar(30), salary int, primary key(eid));
create table Certified(eid int, aid int, primary key(eid, aid), foreign key(eid) references Employee(eid), foreign key(aid) references Aircraft(aid));

desc Flight;
desc Aircraft;
desc Employee;
desc Certified;

insert into Flight values(1,'Bangalore','Mangalore',600,'11:00:00','24:00:00',6000);
insert into Flight values(2,'Bangalore','Hyderabad',800,'12:00:00','15:00:00',8000);
insert into Flight values(3,'Mangalore','Delhi',12000,'01:30:00','5:00:00',15000);
insert into Flight values(4,'Delhi','Kerala',15000,'04:50:00','8:30:00',18000);
insert into Flight values(5,'Kolkatta','Delhi',2500,'10:15:00','15:00:00',9000);

insert into Aircraft values(1,'A',01);
insert into Aircraft values(2,'B',02);
insert into Aircraft values(3,'C',03);
insert into Aircraft values(4,'D',04);
insert into Aircraft values(5,'E',05);
insert into Aircraft values(6,'F',1500);
insert into Aircraft values(7,'G',2000);

insert into Employee values(001,'AA',30000);
insert into Employee values(002,'BB',35000);
insert into Employee values(003,'CC',40000);
insert into Employee values(004,'DD',45000);
insert into Employee values(005,'EE',33000);
insert into Employee values(006,'FF',85000);
insert into Employee values(007,'GG',86000);
insert into Employee values(008,'HH',40000);

insert into Certified values(001,2);
insert into Certified values(002,2);
insert into Certified values(003,1);
insert into Certified values(003,5);
insert into Certified values(002,5);
insert into Certified values(006,1);
insert into Certified values(007,5);
insert into Certified values(008,6);
insert into Certified values(003,6);
insert into Certified values(003,7);
insert into Certified values(002,6);

select * from Flight;
select * from Aircraft;
select * from Employee;
select * from Certified;

select a.aname from Aircraft a, Certified c, Employee e where a.aid=c.aid and e.eid=c.eid and e.salary>80000;

select c.eid, max(a.cruisingrange) from Certified c, Aircraft a where c.aid=a.aid group by c.eid having count(c.aid)>3;

select e.ename from Employee e, Certified c where e.eid=c.eid and e.salary  < (select min(price) from Flight where f_from = 'Bengaluru' and f_to = 'Frankfurt');

select a.aname, avg(e.salary) from Aircraft a, Certified c, Employee e where  e.eid=c.eid and a.aid=c.aid and a.cruisingrange>1000 group by a.aid;