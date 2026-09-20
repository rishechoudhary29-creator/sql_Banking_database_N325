create database n325_db;
use n325_db;

 create table customers(
 customer_id INT PRIMARY KEY,
 CUSTOMER_NAME varchar(50),
 city varchar(50)
 );
 alter table customers rename column customers_id to customer_id  ;
alter table customers rename column customers_name to customer_name;

select c.customer_id,c.customer_name,c.city,o.order_id,o.product,o.amount,o.customer_id
from customers as c
inner join orders as o
on c.customer_id =o.customer_id;





 INSERT INTO customers
 VALUES
 (101,'AMIT','NAGPUR'),
 (102,'PRIYA ','PUNE'),
 (103,'RAHUL','MUMBAI'),
 (104,'SNEHA','DELHI'),
 (105,'VIKAS','Nashik');
 
 create table orders(
 order_id INT PRIMARY KEY,
 Customer_id int,
 product varchar(50),
 amount decimal(10,2)
 );
 
 Insert into orders
 values
 (1,101,'laptop',55000),
 (2,102,'mobile',25000),
 (3,102,'mouse',15000),
 (4,104,'keyboard',3000),
 (5,103,'laptop',45000),
 (6,103,'tv',65000),
 (7,107,'laptop',90000);
 drop table orders;
-- -----------------------------------------------------------------@! 
 ## inner joins:
 
 select customers.*,orders.*
 from customers 
 inner join orders 
 on customers.customer_id= orders.customer_id;


 
 select customers.customer_id,customers.customer_name,orders.product,orders.amount
 from customers
 inner join orders
 on customers.customer_id = orders.customer_id;
 
 
 select 
 c.customer_id,
 c.customer_name,
 o.product,
 o.amount
 from customers c
 inner join orders o
 on c.customer_id=o.customer_id;
 
 select *from ORDERS;
-- -----------------------------------------------------------@
 
 ## LEFT JOINS
 select customers.customer_id,customers.customer_name,orders.product,orders.amount
 from customers
 left join orders
 on customers.customer_id=orders.customer_id ;

select c.*,o.*
from customers as c
left join orders as o
on c.customer_id = o.customer_id;

select c.*,o.*
from customers as c
right join orders o
on c.customer_id=o.customer_id;
 
 select 
 c.customer_id,
 c.customer_name,
 o.product,
 o.amount
 from customers c
 LEFT join orders o
 on c.customer_id=o.customer_id;
-- -------------------------------------------------@!
 
 ## right table 
--  RIGHT JOINS 
  select 
 c.customers_id,
 c.customers_name,
 o.product,
 o.amount
 from customers c
 right join orders o
 on c.customers_id=o.customer_id;
 
 
 ## CROSS JOINS/ CARTESION JOIN
 -- CROSS JOINS product the Cartesian product of two tables.
  -- if 
  -- table 
 
 select customers.customer_id,customers.customer_name,orders.product,orders.amount
 from customers
 cross join orders;
 
 select c.customer_id,c.customer_name,o.product,o.amount
 from customers as c
cross join orders as o;
-- -----------------------------------SELF JOIN1 -----------------------------------------------------------------------------------@

## self join;
-- 1) A TABLE JOINS ITSELF
--    IT is usefull when records within the same table have relationship with each other
 
CREATE TABLE Employees(
employee_id INT PRIMARY KEY,
employee_NAME VARCHAR(50),
MANAGER_ID INT
);

INSERT INTO EMPLOYEES
VALUES(1,'AMIT', NULL),
(2,'PRIYA',1),
(3,'Rahul',1),
(4,'Sneha',2),
(5,'Rocky',3);
 
 SELECT 
      e.employee_name AS employee,
      m.employee_name AS manager
from employees e
LEFT JOIN employees m
ON e.manager_id = m. employee_id;  

 CREATE TABLE Employee_new(
emp_id INT PRIMARY KEY,
emp_NAME VARCHAR(50),
department varchar(200)
);

insert into employee_new
values(1,'rahul','it'),(2,'priya','hr'),(3,'amit','it'),(4,'gaurav','hr'),(5,'Amit','finance');

select e.employee_name as manager,a.employee_name as worker
from employees e
join employees a
on e.employee_name= a.employee_name; 


select *from employee_new;

select e_n1.emp_name,e_n2.emp_name,e_n1.department 
from employee_new e_n1
join employee_new e_n2
on e_n1.department = e_n2.department;

select n1.emp_name,n2.emp_name,n2.department
from employee_new n1
join employee_new n2
on n1.department=n2.department;



select e_n1.emp_name,e_n2.emp_name,e_n1.department ,e_n2.department
from employee_new e_n1
join employee_new e_n2
on e_n1.department = e_n2.department;

-- -------------------------------------------------------------------------------@
## full outer joins


select 
c.customer_id,
c.customer_name,
o.order_id,
o.product
from customers c
left join orders o
on c.customer_id= o.customer_id
union
select 
c.customer_id,
c.customer_name,
o.order_id,
o.product
from customers c
right join orders o
on c.customer_id= o.customer_id;

## join with where caluse
# where is  ued to fileter the record  
# having clause is used filter the group

select c.*,o.*
from customers c
join orders o
on  c.customer_id = o.customer_id
where o. amount>25000;

select * from customers;

select c.*,o.*
from customers c
join orders o
on  c.customer_id = o.customer_id
where o. product in('laptop','monitor') and c.city = 'nagpur';

select c.*,sum(o.amount),o.product
from customers c
join orders o
on  c.customer_id = o.customer_id
group by o.customer_id,o.product;


select c.*,sum(o.amount),o.product
from customers c
join orders o
on  c.customer_id = o.customer_id
group by o.customer_id,o.product
having c.city = 'nagpur';


select c.customer_name,c.city,
sum(o.amount) as 'total_amount_spent'
from customers c
join orders o
on  c.customer_id = o.customer_id
group by o.customer_id,c.customer_name 
order by total_amount_spent desc;

select c.customer_name,c.city,
sum(o.amount) as 'total_amount_spent'
from customers c
join orders o
on  c.customer_id = o.customer_id
group by o.customer_id,c.customer_name
having city in ('nagpur','pune') 
order by total_amount_spent desc;


select c.customer_name,c.city,
sum(o.amount) as 'total_amount_spent'
from customers c
join orders o
on  c.customer_id = o.customer_id
group by o.customer_id,c.customer_name
having city in ('nagpur','pune','mumbai') 
order by city desc;

select c.customer_name,c.city,
sum(o.amount) as 'total_amount_spent'
from customers c
join orders o
on  c.customer_id = o.customer_id
group by o.customer_id,c.customer_name
having city in ('nagpur','pune','mumbai') 
order by c.city desc limit 1 offset 1;

select c.customer_name,c.city,
sum(o.amount) as 'total_amount_spent'
from customers c
join orders o
on  c.customer_id = o.customer_id
group by o.customer_id,c.customer_name
having sum(o.amount)> 30000;

-- ---------------------------------------------------------------------------

select c.*,o.*
from customers c
join orders o
on  c.customer_id = o.customer_id;

create table products(
prod_id varchar(200) primary key,
prod_name varchar(200),
manufactured_at varchar(200)
);
Insert into products 
values(101,'laptop','USA'),(502,'Mobile','south korea'),
       (503,'keyboard','china'),(504,'monitor','tivan');

###########################################################################
create database SHOPPINGDB;
use shoppingDB;

CREATE TABLE CUSTOMERS(
        CUSTOMER_ID INT PRIMARY KEY,
        CUSTOMER_Name varchar(50),
        city varchar(50)
        );


Create table products(
product_id INT primary key,
Product_name varchar(50),
category varchar(50),
price DECIMAL(10,2)
);


create table orders(
ORDER_id INT PRIMARY KEY,
customer_id INT,
Product_id INT,
Quantity INT , 
Order_date DATE,
Foreign key(customer_id) REFERENCES customers(customer_id),
Foreign key(product_id) REFERENCES Products(product_id)
);



insert into customers values
(101,'rahul sahrma','nagpur'),(102,'priya varma','Pune'),
(103,'amit patil','mumbai'),(104,'sneha joshi','Nashik');


insert into products values
(201,'laptop','Electronics',55000),(202,'keyboard','accessories',1500),
(203,'hesdphone','Accessories',2500),(204,'Monitor','Electronics',12000);

insert into orders values
(1001,101,201,1,'2026-09-01'),(1002,102,203,2,'2026-09-03'),
(1003,103,204,1,'2026-09-05'),(1004,101,202,2,'2026-09-07'),
(1005,104,203,1,'2026-09-10');
select *from orders;


-- Three table joins --
select C.*,O.*,P.*
from customers c
inner join orderS o
ON c.customer_id = o.customer_id
inner join products p 
ON P .PRODUCT_ID = O.PRODUCT_ID;


-- Three table joins --
-- total purchase citywise 

select c.customer_name,c.customer_id,o.order_id,p.category,o.product_id,o.order_date,o.quantity
from customers c
Inner join orders o
On c.customer_id = o.customer_id
Inner join products p
on p.product_id=o.product_id;


select c.city, sum(p.price) as 'total amount' 
from customers c
Inner join orders o
On c.customer_id = o.customer_id
Inner join products p
on p.product_id=o.product_id
group by c.city 
order by sum(p.price) desc;

-- top 2 purchase wise --


select c.city, sum(p.price) as 'total amount' 
from customers c
Inner join orders o
On c.customer_id = o.customer_id
Inner join products p
on p.product_id=o.product_id
group by c.city 
order by sum(p.price) desc limit 2;

-- offset Limit = uper ki value skip ho jati hai

select c.city, sum(p.price) as 'total amount' 
from customers c
Inner join orders o
On c.customer_id = o.customer_id
Inner join products p
on p.product_id=o.product_id
group by c.city 
order by sum(p.price) desc
limit 2 offset 1 ;


select c.city, sum(p.price) as 'total amount' 
from customers c
Inner join orders o
On c.customer_id = o.customer_id
Inner join products p
on p.product_id=o.product_id
group by c.city 
order by sum(p.price) asc
limit 2;

select dayname(o.order_date),c.city,sum(p.price)
from customers c
inner join orders o
on c.customer_id = o.customer_id
inner join products p
on o.product_id= p.product_id
group by c.city,dayname(o.order_date)
order by sum(p.price) desc limit 2;


select year(o.order_date),monthname(o.order_date),c.city,sum(p.price)
from customers c
inner join orders o
on c.customer_id = o.customer_id
inner join products p
on o.product_id= p.product_id
group by c.city,year(o.order_date),monthname(order_date)
order by sum(p.price) desc limit 2;

-- No of orders
select c.customer_id, count(o.order_id),c.city 'no of orders'
from customers c
inner join orders o
on c.customer_id=o.customer_id
inner join products p
on p.product_id=o.product_id
group by c.customer_id;

-- There is more one order 
select c.customer_id, count(o.order_id),c.city,sum(p.price) 'no of orders'
from customers c
inner join orders o
on c.customer_id=o.customer_id
inner join products p
on p.product_id=o.product_id
group by c.customer_id
having count(o.order_id)>1;

# --find the product_name using the customer_id

select c.customer_id,p.product_name
from customers c
inner join orders o
on c.customer_id=o.customer_id
inner join products p
on p.product_id=o.product_id
group by c.customer_id,p.product_name
order by product_name; -- order by nhi lagaya to chalta hai

















   
      
 

 
 
 