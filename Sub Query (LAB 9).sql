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
(1,'rahul','india',800000),(2,'priya','india',600000),
(3,'Amit','India',300000),(4,'Sneha','USA',900000),
(5,'John','USA',700000),(6,'Emma','USA',400000),
(7,'Rohan','uk',200000),(8,'Sophia','uk',1000000);

desc users;
select *from users;

  insert Into posts
  (post_id,user_id,post_text)
  values(101,1,'learning SQL'),(102,1,'Learning Python'),(103,2,'data science'),(104,4,'machine learning'),
  (105,4,'AI Tutorial'),(106,5,'power BI'),(107,7,'MY FIRST POST');
  select *from posts;
  
  -- Type -1
  ## Scalar subquery : A sacalry SQ returns one row and one column , i.e. a single  value .
  ## a single - row  subquery returns only one row/ value .
  
  -- 1) find average follower
  
  select AVG(FOLLOWERS) AS 'average followers'
  FROM USERS;
  select round(AVG(Followers),2) from users;
  
  -- 2> find the user name hows follerwes are >= 
  select username, followers
  from users
  WHERE FOLLOWERS <= 
  ( select AVG(FOLLOWERS) AS 'average followers'
  FROM USERS);
  
  select username, followers
  from users
  where followers >(
  select AVG(FOLLOWERS) AS 'average followers'
  FROM USERS);
  
  -- 3) find max Followers
  select username, followers, country
  from users
  where followers = (
  select MAX(followers)
  from users
  );
  select username,followers,country
  from users
  where followers = (
  select max(followers)
  from users
  );
                    
-- 4) Find min Followers
  select username, followers, country
  from users
  where followers = (
  select min(followers)
  from users
); 
                    
                    
select username, followers, country
from users
where followers > 500000;

select users name ,followers ,country 
from users
where 
  
 -- 5> Find users above 500000 followers  
 
select username, followers, country
from users
where followers > (
select 500000
);
                    
 -- 6> find users below 500000 followers
 select username,Followers,country
 from users
 where followers <(
 select 500000
 );
 
  -- TYPE 2
  ## MULTIPLE - ROW SubQuery
  /*
   A multiple- row  subquery return multiple rows and column . 
   */
   
   ## In with subquery 
   select country, avg(followers)
   FROM users
   group by country
   having avg(followers) > 500000;
              
  select username,country,followers
  from users
  where country in (
  SELECT COUNTRY,avg(followers)
  FROM users
  GROUP BY country
  HAVING AVG(followers) > 500000
);


   
select followers from users where followers > 5000000;
   -- sab ayse he                       
select username,country,followers
from users
where country = ( select followers from users where followers > 5000000);        
  
  -- not IN
  
select username,country,followers
from users
where country not IN (
SELECT COUNTRY
FROM users
GROUP BY country
HAVING AVG(followers) > 5000000
);
               
 -- ANY
 
   select username,country,followers
  from users
  where country >= ANY (
               SELECT COUNTRY
               FROM users
               WHERE COUNTRY = 'UK'
               );
               
   ## 4) ALL WITH SQ 
   -- all require the comnasrion to be true for every value returned by the subquery
   
   
   select username,country,followers
  from users
  where country > all (
               SELECT COUNTRY
               FROM users
               WHERE COUNTRY = 'UK'
               );
   
	## 
    
    select username,USER_ID
  from users u
  where EXISTS (
               SELECT 1
               FROM POSTS P
               WHERE P.USER_ID = U.USER_ID
               );
   -- NOT EXITS --
    select username,USER_ID
  from users u
  where NOT EXISTS (
               SELECT 1
               FROM POSTS P
               WHERE P.USER_ID = U.USER_ID
               );
              
    select username,USER_ID
  from users u
  where EXISTS (
               SELECT p.*,u.*
               FROM POSTS P
               WHERE P.USER_ID = U.USER_ID
               );           
## TYPE 3
## correlated SQ : A correlated SQ refrance  a column from the outer query and 
## is evaluated for each outer row .
-- Ques - find user whose  follower are greater than their country's average 

select *from users;

select country ,avg(followers)
from users
group by country order by avg(followers) desc;


select 
u1.username,
u1. country,              
u1. followers  
from users u1
where u1.followers >( 
select avg (u2.followers)
from users u2
where u2.country=u1.country
);

## less value belwo avg followers 

select
u1.username,
u1. country,              
u1. followers  
from users u1
where u1.followers <( 
select avg (u2.followers)
from users u2
where u2.country=u1.country
);

## SQ in from
/*
A SQ inside from is called a
1) derived table 2)table SQ 3) Inline view

It behave like a tmepary table and must have an alias in mysql
*/
# inner query
select 
country,avg(followers) as avg_followers
from users
group by country;

select
 country_data.country,
 country_data.avg_followers
 from(
 select 
 country,
 AVG(followers) AS avg_followers
 from users
 group by country
 ) AS country_data
 where country_data.avg_followers>500000;
 
 select *
 from (
 select country,
 count(user_id) as total_users,
 AVG(followers) as avg_followers
 from users
 group by country
 ) as country_summary
; 
-- DERIVED
select *
 from (
 select country,
 count(user_id) as total_users,
 AVG(followers) as avg_followers
 from users
 group by country
 ) as country_summary where country in('uk','india');
 
 select *
 from (
 select country,
 AVG(followers) as avg_followers
 from users
 group by country
 ) as countrY_DATA  where AVG_FOLLOWERS> 500000;
 
 -- ------
--  posts
 
 SELECT USER_ID,USERNAME
 from users
 where user_id in(
 select distinct user_id from posts);
 
 ## without post
 
  SELECT USER_ID,USERNAME
 from users
 where user_id not in(
 select distinct user_id from posts); 
 
 -- nested sub query
 -- nested subquery : A subquery that contain subquery
 
 
 
 
 
 
 
 
 
 -- ---------------------------------------------
 select avg(followers)
   from users
   where followers>(
		select avg(followers)
        from users
        where country =(
        select country
        from users
        where username = 'rahul'
        )
  );      
 
 


