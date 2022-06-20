show databases;
create database supplier;
use supplier;
show tables;

create table suppliers(sid int, sname varchar(30), address varchar(30), primary key(sid));
create table parts(pid int, pname varchar(30), color varchar(15), primary key(pid));
create table catalog(sid int, pid int, cost double precision, primary key(sid, pid), foreign key(sid) references suppliers(sid) on delete cascade on update cascade, foreign key(pid) references parts(pid) on delete cascade on update cascade);

desc suppliers;
desc parts;
desc catalog;

insert into suppliers values(1000, 'Reliance', 'Bengaluru');
insert into suppliers values(1001, 'Classmate', 'Mysuru');
insert into suppliers values(1002, 'Sony', 'Mumbai');
insert into suppliers values(1003, 'Dell', 'Bengaluru');
insert into suppliers values(1004, 'HP', 'Mumbai');

select * from suppliers;

insert into parts values(2000, 'Pencil', 'Black');
insert into parts values(2001, 'Keyboard', 'Black');
insert into parts values(2002, 'Mouse', 'Pink');
insert into parts values(2003, 'Paper', 'White');
insert into parts values(2004, 'Pen', 'Blue');
insert into parts values(2005, 'Ink', 'Red');

select * from parts;

insert into catalog values(1000, 2000, 10.0);
insert into catalog values(1001, 2003, 5.0);
insert into catalog values(1003, 2000, 10.0);
insert into catalog values(1001, 2001, 100.0);
insert into catalog values(1004, 2002, 200.0);
insert into catalog values(1001, 2000, 10.0);
insert into catalog values(1001, 2002, 200.0);
insert into catalog values(1001, 2004, 10.0);
insert into catalog values(1001, 2005, 20.0);
insert into catalog values(1003, 2001, 200.0);

select * from catalog;

select distinct p.pname from parts p, catalog c where p.pid=c.pid;

select s.sname from catalog c, suppliers s where s.sid=c.sid group by c.sid having count(c.sid)=(select count(*) from parts);  

select s.sname from suppliers s, parts p, catalog c where c.sid=s.sid and c.pid=p.pid and p.color='Red';

select sid, pid, avg(cost) from catalog group by pid having avg(cost) < cost;