USE Bankingdb;

create table Accounts(
Account INT,
Accounttype VARCHAR(20),
Banlance DECIMAL(10,2)
);

CREATE TABLE Transactions(
TrasactionID INT,
TransactionDate DATE,
Amount DECIMAL(10,2),
TransactionType VARCHAR(20)
);

CREATE TABLE Branches(
BranchID INT, BranchName varchar(100),
BranchAddress varchar (200), Branchphone varchar(15)
);

CREATE TABLE AccountBranches(
AssigmentDate date
);
CREATE TABLE loans(
LoanID INT, Loanamount decimal(10,2),IntrestRate decimal(5,2), StarDate date , enddate date
);
-- structure of table --
desc Account;
desc Transaction;

show tables;

# modify the table structure by using ALTER command
/*
1) Add new colums
2) modify Existing columns
3) Rename colums
4) add Constrains 
5) Remove Constraints
*/
alter table customers modify Phone float;


desc customers;

show tables;

-- change datatype of existing column --
alter table customer modify phone bigint;

desc customers;


alter table customers add column Balance bigint;
-- add minimum Balance costrains  --

ALTER table customers
add constraint chk_MinBalance
check(Balance>=5000);

-- Drop 'accountbranches' table --
-- syntax: Drop TABLE <TABLE_NAME>; --
DROP TABLE AccountBranches;

-- ADD PRIMARY Key constrain to 'customerID' in customers table --
alter table customers
add primary key(CustomerID);

-- add unique constraints to 'phone' of 'customer' table --
alter table customers
add unique(phone);
show tables;







