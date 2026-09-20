-- SUB QUERY
 
 USE shoppingDB;
 
 create table Users(
 user_id int primary key,
 username varchar (50),
 country varchar(50),
 followers int
 );
  create table posts(
  post_id int primary key,
  user_id int,
  post_text varchar(255),
  Foreign key (user_id) references users(user_id)
  );

INSERT INTO USERS 
(USER_ID,USERNAME,COUNTRY,followers)
values
(1,'rahul','india',800000),(2,'priya','india',600000),(3,'Amit','India',300000),
(4,'Sneha','USA',900000),(5,'John','USA',700000),(6,'Emma','USA',400000),
(7,'Rohan','uk',200000),(8,'Sophia','uk',1000000);

desc users;
select *from users;

  insert Into posts
  (post_id,user_id,post_text)
  values(101,1,'learning SQL'),(102,1,'Learning Python'),(103,2,'data science'),(104,4,'machine learning'),
  (105,4,'AI Tutorial'),(106,5,'power BI'),(107,7,'MY FIRST POST');
  select *from posts;