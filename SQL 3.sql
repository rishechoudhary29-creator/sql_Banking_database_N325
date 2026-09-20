use accountingdb;


CREATE TABLE Persons (
ID int NOT NULL,
lastName varchar (255) NOT NULL,
FristName varchar (255) NOT NULL,
Age int
);
desc persons;

-- add null constraints 
ALTER table Persons modify column age int not null;

insert into persons values(1,'pandey','hitesh','26');
select * from persons
;
select FristName,lastName,concat(fristName,"_",LastName) as 'employee name' from persons;
Alter table Persons add column Email varchar(100);

-- unique --

ALTER table Persons modify column Email varchar(200) unique;

insert into persons values(2,'bihari','babu','26','bihari_babu@gmai.com'),(3,'kapoor', 'jay', '56', 'wwe@gmail.com');

select *from persons;

ALTER table Persons modify column ID int  primary key;

 desc Persons; 
 
 -- check () constraint on 'age' column --
 alter table persons add constraint chk_age check (age>18);
 
 
 
 select *from persons;
 
 insert into persons values ('88','rahul', 'gandhi',19, 'nem@GMAIL.COM');
 
 # Error Code: 1062. Duplicate entry 'netm@GMAIL.COM' for key 'persons.Email'	0.016 sec( ERROR YASA AYEGA) --
 
 insert into persons values ('7','rahul', 'gandhi',14, 'em@GMAIL.COM');
 
 -- DEFAULT -- tHE DEFAULT consr defination ---


create table employee(
 employeeID INT PRIMARY KEY,
 EmployeeName VARCHAR (50) not null,
 Department VARCHAR (50),
 Salary DECIMAL (10,2),
 joiningDate DATE DEFAULT 'CURRENT_DATE',
 CITY VARCHAR (50)
 );
 alter table employee modify column joiningDate DATE DEFAULT 'CURRENT_DATE';

 Desc employee;

 INSERT into employee
 (employeeID,EmployeeName,Department,Salary,CITY )
 values(101,'AA','HR',45000,'NAGPUR');
 DESC EMPLOYEE;
Alter table employee modify column joiningdate date default '2026-09-01';
ALTER TABLE EMPLOYEE MODIFY COLUMN JoiningDate DATE DEFAULT (2026-09-01); 
DESC EMPLOYEE;
INSERT INTO EMPLOYEE
(employeeID ,EmployeeName,Department,Salary,CITY )
 values(103,'AA','IT',55000,'NAGPUR');

select *from employee;

-- Alter salary into Defalt ---

alter table employee modify column salary decimal default 450000;

desc employee;

insert into  employee (employeeID,EmployeeName,Department,city) values(105,'rrr','hr','napur');

--- Alter CITY into default ---

alter table employee Modify column City VARCHAR (50) Default 'MUMBAI';

INSERT into employee (employeeID,EmployeeName,Department) value (106,'eee', 'sales');

desc employee;
select *from employee;


-- foreign key -- 
 
 #1) parent table
 CREATE TABLE Department(
 DepartmentID INT PRIMARY KEY,
 DepartmentName VARCHAR (50)
 );
 
 INSERT into Department (DepartmentID ,DepartmentName)
 VALUES 
 (101,'it'),
 (102,'hr'),
 (103,'finance');
 
 
 CREATE TABLE Employee_Child(
 EmployeeID INT PRIMARY KEY,
 EmployeeName VARCHAR (100),
 DepartmentID INT,
 
 FOREIGN KEY (DepartmentID)
 REFERENCES Department(DepartmentID)
 );
 DROP TABLE Employee_Child;
 
 
  CREATE TABLE manager(
  ManagerID VARCHAR (20) PRIMARY KEY,
  ManagerName VARCHAR (200) NOT NULL
  );
  
  
 
  CREATE TABLE Employee_Child(
 EmployeeID INT PRIMARY KEY,
 EmployeeName VARCHAR (100),
 DepartmentID INT,
 managerID varchar(100),
 
 FOREIGN KEY (DepartmentID)
 REFERENCES Department(DepartmentID),
 
 FOREIGN KEY (managerID)
 REFERENCES Manager(ManagerID)
 );
 
 desc employee_child;
  

 
 
 
 
 
 



