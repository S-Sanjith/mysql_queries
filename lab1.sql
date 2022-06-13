show databases;
create database insurance;
show databases;
use insurance;
create table person(driver_id varchar(20), p_name varchar(20), address varchar(30), primary key(driver_id));
create table car(reg_no varchar(30), model varchar(30), p_year int, primary key(reg_no));
create table accident(report_no int, acc_date date, location varchar(30), primary key(report_no));
create table owns(driver_id varchar(30), reg_no varchar(30), primary key(driver_id, reg_no), foreign key(driver_id) references person(driver_id), foreign key(reg_no) references car(reg_no));
create table participated(driver_id varchar(30), reg_no varchar(30), report_no int, damage_amount int, foreign key(driver_id) references owns(driver_id), foreign key(reg_no) references owns(reg_no), foreign key(report_no) references accident(report_no));
desc person;
desc car;
desc accident;
desc owns;
desc participated;
insert into person values('A01', 'Richard', 'Srinivas Nagar');
insert into person values('A02', 'Pradeep', 'Rajajinagar');
insert into person values('A03', 'Smith', 'Ashoknagar');
insert into person values('A04', 'Venu', 'N.R. Colony');
insert into person values('A05', 'John', 'Hanumanth Nagar');

select * from person;

insert into car values('KA052250', 'Indica', 1990);
insert into car values('KA031181', 'Lancer', 1957);
insert into car values('KA095477', 'Toyota', 1998);
insert into car values('KA053408', 'Honda', 2008);
insert into car values('KA057306', 'Audi', 2005);

select * from car; 