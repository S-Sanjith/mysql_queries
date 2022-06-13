show databases;
create database banking;
use banking;
create table branch(branchName varchar(20), branchCity varchar(20), assets double precision, primary key(branchName));
create table account_table(accNo int, branchName varchar(20), balance double precision, primary key(accNo), foreign key(branchName) references branch(branchName) on delete cascade);
create table depositor(customerName varchar(20), accNo int, primary key(customerName, accNo), foreign key(accNo) references account_table(accNo) on delete cascade);
create table customer(customerName varchar(20), customerStreet varchar(50), city varchar(20), primary key(customerName), foreign key(customerName) references depositor(customerName) on delete cascade);
create table loan(loanNumber int, branchName varchar(20), amount double precision, primary key(loanNumber), foreign key(branchName) references branch(branchName) on delete cascade);
create table borrower(customerName varchar(20), loanNumber int, primary key(customerName, loanNumber), foreign key(customerName) references customer(customerName) on delete cascade, foreign key(loanNumber) references loan(loanNumber) on delete cascade);

desc branch;
desc account_table;
desc depositor;
desc customer;
desc loan;
desc borrower;

insert into branch values('Basavanagudi', 'Bengaluru', 10000.50);
insert into branch values('MG Road', 'Bengaluru', 128579.50);
insert into branch values('Kanakpura Road', 'Bengaluru', 183729.50);
insert into branch values('Bommananahalli', 'Mysuru', 471967.78);
insert into branch values('KR street', 'Dharawad', 836489.50);

select * from branch;

insert into account_table values(100, 'Basavanagudi', 1000.00);
insert into account_table values(101, 'MG Road', 7269.00);
insert into account_table values(102, 'Basavanagudi', 82947.00);
insert into account_table values(103, 'Bommananahalli', 83749.00);
insert into account_table values(104, 'KR street', 8398.00);

select * from account_table;

insert into depositor values('Rahul', 100);
insert into depositor values('Ganesh', 101);
insert into depositor values('Rohit', 102);
insert into depositor values('Swastik', 103);
insert into depositor values('Satwik', 104);

select * from depositor;

insert into customer values('Rahul', 'NR Colony', 'Bengaluru');
insert into customer values('Ganesh', 'Arekere', 'Bengaluru');
insert into customer values('Rohit', 'Mico Layout', 'Bengaluru');
insert into customer values('Swastik', 'SBI Bank Colony', 'Mysuru');
insert into customer values('Satwik', 'Yelachenahalli', 'Bengaluru');

select * from customer;

insert into loan values(1000, 'Basavanagudi', 10000.728);
insert into loan values(1001, 'MG Road', 100354.728);
insert into loan values(1002, 'Basavanagudi', 776747.728);
insert into loan values(1003, 'Bommananahalli', 8488.728);
insert into loan values(1004, 'KR street', 954004.728);
 
 select * from loan;
 
 insert into borrower values('Rahul', 1000);
 insert into borrower values('Ganesh', 1001);
 insert into borrower values('Rohit', 1002);
 insert into borrower values('Swastik', 1003);
 insert into borrower values('Satwik', 1004);
 
 select * from borrower;
 
