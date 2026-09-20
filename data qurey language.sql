-- date 07/009/2026

use bankingdb;


--  DATA  DROP ,RENAME COLUMN , DOB se date hange , A% -- 


create table student(
stud_id varchar(50), 
stud_name vARCHAR(50),
address varchar (100),
city varchar (50),
DOB  DATE 
); 

insert into student value (1,'shashank','RJPM','LUCKNOW');

Alter table student modify column stud_name varchar (100);

-- drop colum

alter table student drop column city;

create table if not exists teacher (
teacher_id int ,
teacher_name varchar(100),
hiring_date date ,
age int ,
salary int 
);
insert into teacher values (1,'vishvas','2020-08-09','28','50000'),
(2,'reshms','2020-08-10','29','600000'),
(3,'rishi','2020-06-06','25','100000');

desc teacher;

alter table student add constraint pk_stud_id primary key (stud_id);

-- raname colum
-- syntax alter table <table_name > rename column <old column_name> to <new column_name>
alter table student change column stud_name  name varchar(100);
desc student;
desc employee;

desc student;

insert into student values ('s01','gavrav','Dharmpeth','2025-05-10'),
('s02','lammpu','Resambag','2000-01-05'),('s03','champu','nagpur','2005-02-03'),
('s04','vikash','pipla','2000-04-12'),('s05','reshma','sausar','2001-05-02'),
('s06','dhakad','savner','2004-06-03'),('s07','sdfggh','pandurna','2002-06-05'),
('s08','dfghj','asdfgh','2003-03-09');

select*from student;

-- how to count total record of table 
-- ALIAS declaration --
select count(*) as 'number of students'from student;


select month (DOB), monthname(DOB) FROM student;

select month (DOB), monthname(DOB), dayname(dob) , dayofweek(DOB), curdate() as 'today date',  datediff(curdate(),DOB) as'number of days till today ',
 year(datediff(curdate(),DOB)) AS 'YEAR'
 from student;
 
 select month (dob)
 from student;
 
 
 select *from employee;
 
 -- using banking  agregation --
 
 select city, count(*) as 'number of employee'
 from employees
 group by city
 order by city desc; 
 
 -- having --
 
 select department, count(*) as 'number of empolyee'
 from employees
 group by department 
 having count(employeeid)=1
 order by department asc;
 
 
 
 -- s limit
 select department,sum(salary)
 from employees
 group by department 
 order by sum(salary)desc
 limit 3;
 
 
 -- simple me hai group pe nhi 
 select *
 from employees
 order by (salary)asc
 limit 10;
 
 -- group pe karte hai 
 
 select city, department,
 sum(salary)
 from employees
 group by  city ,department
 order by sum(salary) desc
 limit 3 ;

 
 select *from employees;
 
 
 select employeeID,
 min(salary) as'min'
 from employees
 group by employeeID
 order by min desc;
 
 SELECT * FROM Employees;
 
 SELECT Department FROM Employees;
 
 -- aggregation function in sql -07 sep2026
 -- 1) totyal no of employye 
 select count(*)'total empolyees' from employees;
 
 
 -- 2) total salary 
 select sum(salary) as 'tatal salary' from employees;
 
 -- 3) toatal salary dept wise 
 select department ,sum(salary) as 'total salary' from employees group by Department;
 
 select employeeName,sum(salary) from employees group by employeename;
  
 -- 4 avg salry dept wise 
 select department ,avg(salary)as 'total salary' from employees group by department;
 
select  

 select department ,avg(salary) as 'total salary' from employees group by department;
 
 -- aggregation function on salary department wise --
 
 select department,
 concat ("₹", round(sum(salary),0)) as 'total salary',
  concat ("₹", round(max(salary),0)) as 'maximum salary',
   concat ("₹", round(min(salary),0)) as 'minimum salary',
  count(*) as 'number of employee'
 from employees
 group by department 
 order by avg (salary);
 select
 concat (₹, round(sum(salary),0)) from employees
 group by department 
 order by avg(salary);
 
 
 -- pattern matching
 -- find employee whoose name startswith 'R' --
 select *from employees
 where employeename like '_____R%';
 
 select *from employees
 where employeename like 'R%';
 
 
 -- find employe whoose name endwith 'a'--
select *from employees
 where employeename like '%a';
 
select department from employees 
where employeename like '%a' ;
 
-- empl whosse name contains A
select *from employees
 where employeename like '%a%';
 
 -- find empl name whoose second character is 'a'
 select *from employees
 where employeename like '_a%';

select  city from employees
 where city like '______';
 
 -- find the city which startswitch M
 select *from employees
 where city like 'm%';
 
 select *from employees
 where city like '%s%';
 
 
 
 




