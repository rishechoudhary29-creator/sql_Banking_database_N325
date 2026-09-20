-- in this table --
-- Primary key , forenig key ,alter, update , update in where --

Create database bankingDB;
use bankingdb;
CREATE TABLE Customers
(
    CustomerID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15)
);

describe Customers;

CREATE TABLE Accounts (
    AccountID INT,
    AccountType VARCHAR(20),
    Balance DECIMAL(10,2)
);



CREATE TABLE Transactions (
    TransactionID INT,
    TransactionDate DATE,
    Amount DECIMAL(10,2),
    TransactionType VARCHAR(20)
);

CREATE TABLE Branches (
    BranchID INT,
    BranchName VARCHAR(100),
    BranchAddress VARCHAR(200),
    BranchPhone VARCHAR(15)
);

CREATE TABLE AccountBranches ( 
		AssignmentDate DATE
);


CREATE TABLE Loans (
    LoanID INT,
    LoanAmount DECIMAL(10,2),
    InterestRate DECIMAL(5,2),
    StartDate DATE,
    EndDate DATE
);

drop table Transactions;

-- alter table --
Alter table customers
add dateofbBirth DATE;
 
 desc customers;
 
 alter table customers
 modify phone varchar(20);
  
alter table Accounts
Add constraint check (balance>= 10000);

alter table customers add  primary key (customerid);
alter table Accounts add customerid int;

alter table accounts 
add foreign key (customerid) 
references customers(customerid);

desc accounts;
alter table customers modify column firstname varchar (200) not null;

alter table customers add unique(email);
desc customers;

-- New Tables --
CREATE table Persons (
ID int NOT null,
LastName varchar(255) Not null,
FirstName varchar(255) not null,
Age int
);

alter table persons modify column age int not null;

insert into persons values(1,'pandey','hitesh',33);
select * from persons;
select FirstName,LastName,concat(FirstName,"_",LastName) as 'EmployeeName' from Persons; -- dono yek hi hai bas alag likha hai --
select firstName,LastName,concat(firstName,"_",lastName) from persons;

alter table persons add column email varchar(200) ;
alter table persons modify column email varchar(200) unique;

insert into persons values
(2,'saxsena','Rajeev',23,'rajeev_saxsena@gmail.com'),
(3,'Kapoor','jay',26,'kapoor_jay12@gmail.com'),
(4,'ganatra','bhavin',23,'ganatra_bhavin@gmail.com');

select *from persons;

-- Making Primary key--
alter table persons modify column id int primary key;

-- Check Constraint on 'age' Column --

alter table persons add constraint check(age>18);
desc persons;

insert into persons values(5,'Gandhi','rahul',25,'rahul_gandhi@gmail.com');
insert into persons values (6,'gandhi','rajeev',19,'gandhi_rajeev@gmail.com'),(7,'gandhi','sanjay',29,'gandhi_sanjay@gmail.com');

create table Employees (
EmployeeID int primary key,
EmployeeName varchar(100) not null,
Department varchar(100),
Salary decimal(10,2),
JoiningDate DATE DEFAULT (CURRENT_DATE),
City varchar(50)
);

insert into Employees values (1,'rahul Sharma','it',50000,'2026-09-01','mumbai');

alter table employees modify column salary int default 20000;

insert into Employees (employeeid, employeename,department,joiningdate,city) values (2,'chandrakant','it','2026-09-01','nagpur');

select*from employees;

insert into Employees (employeeid, employeename,department,Salary,city) 
values
(3,'Priya patil','HR',45000,'pune'),
(4,'Amit Kumar','finance',60000,'Delhi'),
(5,'Snehal Joshi','IT',55000,'nagpur'),
(6,'Rohan Verma','Marketing',48000,'Mumbai');

select * from Employees;

alter table Employees alter city set default 'nagpur';
alter table Employees alter city set default 'nagpur';

desc employees;

insert into employees (employeeid, employeename,department,Salary,JoiningDate) 
values
(7,'Gautam','HR',85000,'1997-01-16');

select * from employees;

## foreign key ------------------


create table Department (
DepartmentID int primary key,
DepartmentName varchar(50)
);
insert into Department values (101,'IT'),(102,'HR'),(103,'Finance');


create table Manager ( 
ManagerID INT primary key,
ManagerName varchar(100) not null
);


Create table EmployeeChild (
EmployeeID int primary key,
EmployeeName Varchar(100),
Departmentid int,

foreign key (departmentid)
references department(departmentid),

foreign key (employeeid)
references  Manager(ManagerID )
);

desc employeechild;

--  -------- lab2 --------- ---


use bankingdb;
create table AccountBranches(
Assignmentdate date
);


alter table customers add DateOfBirth date;

INSERT INTO Customers
(CustomerID, FirstName, LastName, Email, Phone, DateOfBirth)
VALUES
(101,'Rahul','Sharma','rahul@gmail.com','9876543210','1998-04-15');

INSERT INTO Customers
(CustomerID, FirstName, LastName, Email, Phone, DateOfBirth)
VALUES
(102,'Kunal','Modi','Kunal@gmail.com','8989425438','1997-06-20');

select * from customers;

INSERT INTO Accounts
(AccountID, CustomerID, AccountType, Balance)
VALUES
(201,101,'Savings',25000);

select * from accounts;

UPDATE customers
SET PHONE='9689425438'
WHERE CUSTOMERID = 101;

SELECT * FROM Customers
WHERE CustomerID = 101;

UPDATE Customers
SET Email='rahul.sharma@gmail.com'
WHERE CustomerID=101;

SELECT * FROM Customers
WHERE CustomerID = 101;

SET SQL_SAFE_UPDATES = 0;
UPDATE ACCOUNTS
SET BALANCE = 30000
WHERE ACCOUNTID = 201;

SELECT * FROM transactions;
DESC ACCOUNTS;

















