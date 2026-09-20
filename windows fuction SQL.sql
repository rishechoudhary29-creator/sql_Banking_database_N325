## WINDOWS FUNCTION 
-- syntax:
/*
SELECT column_name1,
window_function(column_name2)
OVER



*/

use bankingdb;

-- ROW_NUMBER ()
select 
salary,
row_number() over(order by salary desc ) 
as 'higest ranking'
FROM employees;
 
 -- 08/09/2026--
 
-- rank with respect to salary
select 
salary,
rank() over(order by salary  )
FROM employees; 

create table sales (
sale_id int primary key,
employee_name varchar (200),
department varchar(200),
sale_date date,
amount decimal (10,2)
);

desc sales;

insert into sales
(sale_id ,employee_name ,department ,sale_date ,amount ) 
values
(1,'amit','electronics','2026-01-06,',50000),
(2,'priya ','electronics','2026-01-10',75000),
(3,'Rahul','electronics','2026-01-15',75000),
(4,'Raj','electronics','2026-01-20',90000),
(5,'Rani','clothing','2026-01-05',40000),
(6,'neha','clothing','2026-01-15',60000),
(7,'pooja','clothing','2026-02-04',60000),
(8,'karan','clothing','2026-02-06',85000),
(9,'Raju','Furniture','2026-01-05',30000),
(10,'vishal','Furniture','2026-01-11',55000)
;

select *from sales;
# windows function 

-- 1) assign row number

select 
*,
row_number() over( order by amount desc) 
as 'row number',
RANK() over( ORDER BY AMOUNT DESC) AS 'RANK'
From sales;


select 
*,
row_number() over( order by amount desc)
as 'row number',
RANK() over( ORDER BY AMOUNT DESC) AS 'RANK'
From sales;

-- RANK

select department,amount, 
rank()over(partition by department order by  department desc) as 'department rank'
from sales;

-- RANK + DENSE RANK + sum  ,department ,amount --


select department,amount, 
        rank()
        over(partition by department order by  amount desc) as 'department rank',
        dense_rank()
        over(partition by department order by  amount desc)  as 'department dense rank',
        sum(amount)
        over(partition by department order by amount desc) as 'Runing total department_wise'
        from sales;
        

-- 3) percentage_wise contibution of each department

select 
    employee_name,department,amount,
    round(amount/sum(amount) over(partition by department)*100,2) as 'department_swise_contribution'
    from sales;
    
    
  -- lag()-->compare value with the previous value --
  -- lead(): compare current value with the next value --


select
employee_name,department,amount,
round(amount/sum(amount) over(partition by department)*100,2) as 'sales_wise_contribution'
from sales;

select 
employee_name,department,amount,
round(amount/sum(amount) over()*100,2) from sales;

select 
sale_id, department,amount,sale_date,
lag(amount) over( order by sale_date)
from sales;

select
sale_id,department,amount,sale_date,
lead(amount) over(order by sale_date)
from sales;

-- LEAD() COMPARE CURRENT VALUES WITH THE NEXT VALUE 
SELECT sale_id,department,amount,sale_date,
LEAD(AMOUNT) OVER(Partition by department Order by sale_id) as 'runing Total'
from sales;

SELECT sale_id,department,amount,sale_date,
sum(AMOUNT) OVER(Partition by department Order by sale_id) as 'runing Total'
from sales;

-- average sales department Wise --
SELECT sale_id,department,amount,sale_date,
concat ('₹',round(avg(amount) over(partition by department order by sale_date ))) as 'Average sale'
from sales;

-- First_value()  AND Last_value --

SELECT sale_id,department,amount,sale_date,
first_value(amount) OVER(Partition by department Order by amount desc) as 'first_value'
from sales ;


SELECT sale_id,department,amount,sale_date,
last_value(amount) OVER(Partition by department Order by amount desc rows between UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as 'last_value'
from sales ;

-- NTILE()

SELECT department,amount,ntile(6) over(order by amount desc) as amount_6_quartile
from sales;

# calculate total sales across all rows 

# calulate average sales

# count total numbern of sales



 


