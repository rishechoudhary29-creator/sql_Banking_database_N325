create DATABASE Bankingdb;
use Bankingdb;

CREATE TABLE if not exists customers
 (
CUstomerID INT,
FirstName VARCHAR(50),
LastNmae varchar (50),email varchar (100),
phone varchar (20)
);

desc customers;

-- to add new colum 'AcountCreationDate--->DATE--
alter TABLE Customers
add AccountCreationdate date;

insert into Customers
(customerID,firstName,Lastname,email,phone,AccountCreationDate)
value(101,'raj','kurve','raj_g2gmail.com',36225255221,'2025-2-16');

-- to retrieve data from table --
-- syntax: select * from <table_name>; --
select *from customers;

