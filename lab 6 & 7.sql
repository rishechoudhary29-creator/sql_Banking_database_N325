USE bankingdb;

create table company(
emp_id int primary key,
emp_name varchar(100),
department varchar(100),
job_role varchar(200),
salary decimal (10,2) default 20000,
hire_date DATE ,
city VARCHAR(50)
);
INSERT INTO company
(EMP_ID,emp_name,department,job_role,salary,hire_date,city)
values
(101,'rahulsharma','it','developer',65000,'2021-01-15','nagpur'),
(102,'priya sharma','hr','hr mager',75000,'2022-02-15','delhi');
INSERT INTO company
(EMP_ID,emp_name,department,job_role,salary,hire_date,city)
values
(103,'Nahul varma','SALES','developer',85000,'2021-01-25','nagri'),
(104,'anshul sharma','it','developer',60000,'2021-02-15','kangpur'),
(105,'prit thakre','market','ground helper',95000,'2021-01-30','dhespur'),
(106,'namrat sharma','maneger','mange role',80000,'2022-01-15','pipla'),
(107,'rahulsharma','it','developer',65000,'2021-01-15','savner');
select*from company;
##########################################################################################################################

## STRING FUNCTIONS
-- LENGTH() -- ISME GAP KO BHI COUNT KARTE HAI --
select emp_name,length(emp_name) as 'no of characters' from company;

-- ---------------------------------------------------------------------------------------------------
-- concat -- join karte hai (-) ko
select concat(emp_name,' - ',department) from company;
select emp_name, concat(emp_name,' - ',salary) from company;
-- ----------------------------------------------------------------------------------------------------

-- substring or substr(String,start_position,length) --
select emp_name ,substr(emp_name,1,4) from company;
select emp_name, substr(emp_name,2,6) from company;
 select emp_name, substring(emp_name,1,5),substr(emp_name,-1,6) from company;
 select department ,substring(department,3,7) from company;
select emp_name,substr('rahulsharma',3,7) from company;

 -- substr(string , satrt_position, length)
 select city,substr(city,1,3) from company;
-- #--------------------------------------------------------------------------------------------------- 
 -- Trim() : Remove uneecessary sapace --
 Select emp_name,TRIM('emp_name') as cleaned_name from company;
 Select emp_name,length('  anshul sharma  '),length(trim('  Anshul sharma  ')) from company;
-- #------------------------------------------------------------------------------------------------------

-- Replace(old_string,new_string)--
select emp_name from company;

SELECT emp_name,
 Replace(emp_name,'rahul','Rohan') from company;
 
 SELECT CITY,
 Replace(city,'nagri','Nagri') from company;
 ###############################################################################################################################
 
 ## Mathematical functions
 -- 1) Round()
 
select round(salary/12,1) from company;
select round(5416.71,0) as 'ROUND OF' from company;

SELECT EMP_NAME,SALARY,SALARY/12,
ROUND(Salary/12,3) as 'month salary',
ROUND(SALARY) as 'yearly salary 2' from company;
--   #-------------------------------------------#

-- 2) floor() --( floor( 4.9)  result -- (4) )
select floor(salary) from company;

select emp_name,salary,
floor(salary/100) ,
floor(salary/1000) as 'rounded down salary'
from company;

select emp_name,salary,
floor(salary/12) as 'Rounded down salary'
from company;

-- round + floor --
select emp_name,salary,
round(salary/12,3) as 'Round of',
floor(salary/12) as 'Rounded down salary'
from company;
#-------------------------------------------#

-- Ceil --(ceil(4.77 RESULT TO 5) -- 
select emp_name,salary,
CEIL(salary/12) as 'Rounded down salary'
from company;

-- Round + floor + Ceil --
select emp_name,salary,
round(salary/12,3) as 'Round of',
floor(salary/12) as 'Rounded down salary',
CEIL(Salary/12) as 'Rounded up salary'
from company;
-- #---------------------------------------------------@

-- 3 ABS() -- ABSOLUTE value (abs return vale allways positive value) ex - (Abs(10-50 ) result = (40) ) --
select ABS(10-40) FROM DUAL; -- ( DUAL SECONDAY COLUMN HAI JO PHALE SE SQL me hota hai )--

select 
emp_name,job_role,salary,salary-60000,
ABS(salary-60000) as 'salary difference with ABS'
from company;
-- ----------------------------------------------------@
-- 4) MOD()= (Modulo operation returns the reminder) ex (10/3 reminder=1 so result is (1))

select emp_id,
MOD(EMP_ID,2) 
FROM COMPANY;

SELECT SALARY,
MOD(salary,545) as reminder
from company;
-- ------------------------------------@

-- 5) POWER() POWER VALUE 
 SELECT Salary,
 power(salary,2) as 'sqaure of salary'
 from company;

SELECT Salary,
 power(salary,3) as 'cube of salary'
 from company;
 
#######################################################################################################################################################################

-- @@ COMPARISION OPERATORS --
-- sanytax (Select [column name] FROM [table name] where [compersion >,<,=,etc]; --
# TYPE-1
select emp_name,salary
from company 
where salary>70000;

# TYPE-2
select emp_name,salary,salary*0.25'salary increased by 25%'
from company;
select emp_name,salary,salary*1.25 as 'salary increased by 125%',salary*0.25 as 'salary increased by 25%' 
from company ;

select emp_name,salary,salary*1.25 as 'salary increased by 125%',salary*0.25 as 'salary increased by 25%' 
from company 
where city ='nagpur';

select emp_name,salary,salary*(1-0.1) AS 'SALARY REDUCE BY 10%' 
from company ;

select emp_name,salary,salary*(1-0.25) AS 'SALARY REDUCE BY 25%', SALARY* 0.9 as  'salary reduced by 10%'
from company ;
 
## type-3 [Not Equal to !=]

select * from company where salary != 65000;
-- ------------------------------------------------------@

## Comparision based on classification
 -- SYNTEX SELECT [CASE] (WHEN)1 xyz (When) xyz ELSE  ENDN AS XYZ FROM [table name];
 
 Select *,
 Case 
 when salary >= 55000 THEN 'High salary'
 when salary >= 45000 THEN 'medium salary'
 ELSE 'LOW salary'
 end as Salary_category
 from employees;
 #######################################################################################################################
 
 ## DISTINCT() --> ITS Returns unique value of columns-- 
-- syntax => select Count(DISTINCT [COLUMN_NAME]) FROM [TABLE_NAME];
select 
count(DISTINCT City) as 'Unique City',
count(city) 
from employees;

###########################################################################################################################

## Aggregate function in sql
-- Aggregation function performs calculation on multiple rows

select count(emp_id) as 'total emp in comapy'
from company;

select department,
sum(salary)as total_employees
from company
group by department 
order by sum(salary) ; -- order by ka sort karna hota ASE YA DESC ME 

select SALARY,
AVG(salary)as AVG_salary
from company
group by salary 
order by AVG(salary);

select SALARY,
min(salary)as min_salary
from company
group by salary
order by min(salary);





 
 
 
 

 
 








