-- SQL is case-insensitive

/*
We will follow:
UPPERCSE: Keywords
lowercase: Non-keywords
*/ 

 USE exercise_hr;

SHOW TABLES;

USE store;

SELECT *
FROM customers;

SELECT *
FROM customers
ORDER BY first_name ASC;

ORDER BY <column_name>DESC FOR descending order

SELECT *
FROM customers
ORDER BY last_name DESC;


USE exercise_hr;
SELECT *
FROM employees
ORDER BY first_name DESC;

SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME,SALARY 
FROM employees 
ORDER BY SALARY;

USE store;
SELECT *
FROM customers
ORDER BY last_name DESC, birth_date DESC;

SELECT 1, 2;

SELECT 1 + 1;

SELECT 5 * 100 - 100;

SELECT 100 - 50 / 2;

SELECT 100 - 50 / 2 AS value;

SELECT*
FROM customers;

SELECT first_name
FROM customers;

SELECT first_name, last_name, points
FROM customers;

/*
SELECT <column_1>, <column_2>....<column_n>
FROM <table_name>;

SELECT*  --Foe all columns.
FROM  <table_name>;
*/

SELECT first_name, last_name, points, points * 1.1 AS 'discount_factor'
FROM customers; 

SELECT birth_date
FROM customers; 

/*
DATA types;
Strings, numbers, datas
*/

SELECT birth_date , date_format(FROM_DAYS(DATEDIFF(NOW(), birth_date)), '%Y') + 0 AS age FROM customers;

SELECT  TIMESTAMPDIFF(YEAR, birth_date, CURDATE()) AS age
FROM customers;

SELECT*
FROM customers;

SELECT DISTINCT state
FROM customers;

SELECT  171*214+625;

/* display the names (first_name, last_name) using alias name “First Name", "Last Name" from employee table.*/



-- Write a query to get the names (first_name, last_name), salary, PF of all the employees (PF is calculated as 15% of salary).
USE exercise_hr ;
SELECT first_name,last_name,salary, salary*.15 AS PF
FROM employees;


USE store;

SELECT *
FROM customers
WHERE state = 'FL';


-- Comparison operators:
-- >
-- >=
-- <
-- <=
-- =
-- ! = or <>

SELECT *
FROM customers
WHERE points > 3000;

SELECT *
FROM customers
WHERE points > '3000';

SELECT *
FROM customers
WHERE birth_date >= '1990-01-01';

SELECT *
FROM customers
WHERE points <= '1000';

SELECT *
FROM customers
WHERE state != 'FL';

SELECT *
FROM customers
WHERE state = 'FL' AND birth_date > '1990-01-01';

SELECT *
FROM customers
WHERE points > '3000'  AND  birth_date > '1990-01-01';

SELECT *
FROM customers
WHERE points > '3000' OR birth_date >= '1990-01-01';


SELECT *
FROM customers
WHERE  birth_date > '1989-01-01'  OR  points > '3000' AND state = 'VA';

SELECT *
FROM customers
WHERE  birth_date > '1989-01-01'  OR  points < '4000' AND state = 'VA';

SELECT *
FROM customers
WHERE points < '4000'  OR birth_date > '1989-01-01'  AND state = 'VA';

SELECT *
FROM customers
WHERE (points < '4000'  AND  birth_date > '1989-01-01')  OR state = 'VA';

-- ORDER BY logical operators 
-- 1. AND
-- 2. OR

SELECT *
FROM customers
WHERE NOT (state ='FL');

-- Write a query to display the name (first_name, last_name) and department ID of all employees in departments 30 or 100 in ascending order.
use exercise_hr;

SELECT first_name, last_name, department_ID 
FROM employees
WHERE department_ID = 30 OR department_ID = 100
ORDER BY department_ID ASC;

USE store;
SELECT *
FROM customers
WHERE state ='FL' OR state = 'VA' OR state = 'GA';

SELECT *
FROM customers
WHERE state IN ('FL','VA','GA');

SELECT*
FROM products
WHERE quantity_in_stock in (49, 38, 72);

 SELECT *
 FROM customers
 WHERE birth_date > '1990-01-01'  AND  birth_date < '2000-01-01';
 
  SELECT *
 FROM customers
 WHERE birth_date BETWEEN'1990-01-01' AND  '2000-01-01';


SELECT *
FROM customers
WHERE points >= 3000 and points <= 10000;

SELECT *
FROM customers
WHERE points BETWEEN 3000 and  10000;

use exercise_hr;

select*
from employees;

select first_name, last_name,salary
from employees
where salary between 10000 and 15000;

-- last name contains  'age'
use store;
select*
from customers;

select*
from customers
where last_name like 'age';

-- last name ending in y 
select*
from customers
where last_name like '%y';

select*
from customers
where last_name like '%age%';

select*
from customers
where first_name like 'b%';

USE store;

select*
from customers;

select*
from customers
where last_name LIKE '_y';

SELECT*
FROM customers
WHERE last_name LIKE '_____y';

-- all customers living in a state ending in alter
USE store;

SELECT *
FROM customers
WHERE state LIKE '%A';

SELECT *
FROM customers
WHERE state LIKE '_A';

-- last name has 6 letters starts with b ends with y

SELECT *
FROM customers
WHERE last_name LIKE 'b____Y';

SELECT *
FROM customers
WHERE last_name LIKE 'b%' AND last_name LIKE '%y';

SELECT *
FROM customers
WHERE last_name LIKE 'b%y';

SELECT *
FROM customers
WHERE last_name REGEXP 'field' ;

SELECT *
FROM customers
WHERE last_name REGEXP 'age' ;

SELECT *
FROM customers
WHERE last_name REGEXP '^Mac' ;


SELECT *
FROM customers
WHERE last_name REGEXP 'field$' ;


SELECT *
FROM customers
WHERE last_name REGEXP 'field$|^Mac' ;

SELECT *
FROM customers
WHERE last_name REGEXP 'field$|^Mac|rose' ;

-- Return product with
-- 1.quantity in stock equal to  49, 38, 72.
-- 2. no product with quantity_in_stock = 72.
SELECT *
FROM products
WHERE quantity_in_stock  In  (49, 38, 72);


 -- Get the customers whose
-- 1. first names are ELKA or AMBUR
-- 2. last names end with EY or ON
-- 3. last names start with MY or contains SE
-- 4. last names contains B followed by R or U
SELECT first_name, last_name
FROM customers
WHERE last_name LIKE "%EY" OR last_name LIKE "%ON" AND first_name = "ELKA" OR first_name = "AMBUR" AND
last_name LIKE "MY%" OR last_name LIKE "%SE%" AND last_name LIKE "%B_R" OR last_name LIKE "%B_U";


 -- Get the customers whose
-- 1. addresses contain TRAIL or AVENUE
-- 2. phone numbers end with 9
-- 3. phone numbers do not end with 9
USE store;

SELECT *
FROM customers
WHERE address LIKE '%TRAIL%' OR address LIKE '%AVENUE%' AND phone LIKE '%9';

SELECT *
FROM customers
WHERE phone NOT LIKE '%9';


--  Return customers born between 1/1/1990 and 1/1/2000
SELECT *
FROM customers
WHERE birth_date BETWEEN '1990-01-01' AND '2000-01-01';

-- last name contains 'age'
USE store;

select*
from customers
where last_name like '%age%';

select*
from customers
where last_name regexp 'age';

/*
^ (caert) - starts with 
$ - ends with
| (piep) - logical OR
[.] - set
*/

-- last name contains ae,be,ce,de,ee,fe,ge,he
USE STORE;

select *
from customers
where last_name regexp 'ae|be|ce|de|ee|fe|ge|he';

select *
from customers
where last_name regexp '[abcdefgh]e';

select *
from customers
where last_name regexp '[a-h]e';


-- we want to have customers who have 'ge','ie' or 'me' in their last_names
select*
from customers
where  last_name regexp '[gim]e';

-- we want to find last_name with 6 characters
select*
from customers
where  last_name regexp'^[a-z]{6}$';

select*
from customers
where  last_name regexp'^.{6}$';

-- REGEXP equivalent to % used in the LIKE query
-- .*-%

-- 2. last names ends with EY or ON 
select*
from customers
where  last_name regexp 'EY' or 'ON';

-- 3. last_name start with MY or contains SE



-- 4. last_name contains B followed by R or U
use exercise_hr;

select*
from employees
where  last_name regexp'B[RU]';

select *
FROM employees
WHERE last_name regexp ('b.*[ru]');

select *
FROM employees
WHERE last_name like '%b%r%' or last_name like '%b%u%';


-- NULL operatores
USE store;

-- select customers where phone is null
select*
from customers
-- where phone= null (NULL = NULL) is not correct NULL
where phone is null;

-- select customers where phone is not null
select*
from customers
where phone is not null;

-- Exercise: Get the orders that are not shipped

-- multiple column sorting
USE exercise_hr;

-- Sort employees based according to their departments and by their first names within the departments.

-- get top 3 customers
select*
from customers
LIMIT 3;

-- get top 3 loyal customers(order by points)
select*
from customers
order by points desc
LIMIT 3;

-- get customers on page 2 
select*
from customers
LIMIT 3,3;

-- the limit clause should always come at the end.
-- the order of the clauses matter. SELECT-> FROM -> optionally WHERE -> optionaly ORDER BY -> LIMIT
-- Not following order gives error.

use store;

select*
from customers;

explain
select*
from customers;

use exercise_hr;

select*
from employees
where first_name = 'Lex';

explain
select*
from employees
where first_name = 'Lex';

select*
from employees
where employee_id = 102 ;

select*
from employees
where last_name = 'De Haan' ;

select*
from employees
order by last_name;

select count(*) as 'number of employees'
from employees;

create database if not exists Kaithari_project;
use Kaithari_projects;


/*Sytax for creating table:
CREATE TABLE tablename (
column1 COULUMN1_DATATYPE(size) CONSTRAINTS,
column2 COULUMN2_DATATYPE(size) CONSTRAINTS,
);
*?

-- Create Database if not exists minimal;
USE minimal;
/*Syntax for creating table:
CREATE TABLE  tablename
column1 COLUMN1-DATATYPE(size) CONSTRAINTS,
column2 COLUMN2-DATATYPE(size) CONSTRAINTS,
);
*/
create database meena;
use meena;

describe USER;

-- delete table
-- drop table tablename
drop table user;

describe USER;

CREATE TABLE IF NOT EXISTS user(
username VARCHAR(50) PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
email VARCHAR(100),
password VARCHAR(50),
dob DATE,
phone VARCHAR(20)
);

DESCRIBE USER;

ALTER TABLE user
ADD whatsapp_no int;

DESCRIBE USER;

ALTER TABLE user
MODIFY whatsapp_no varchar(20);

DESCRIBE USER;
 
ALTER TABLE user
drop whatsapp_no;

DESCRIBE USER;

/*
add new colimn;
alter table table_name
add column_name datatype(size);

Modify data tyoe of an existing column;
alter table table_name
modify column_name datatype(size);

drop an existing column:
alter table table_name
drop column_name ;

rename column:
alter table table_name
rename column old_name to new_name;
*/

alter table user
RENAME COLUMN dob to data_of_birth;

describe user; 
rename meena to kaithari;

drop database meena;

DESCRIBE user;

-- read the table
select*
from user;

-- Insert datas in the table\

INSERT INTO user (username, first_name, last_name, email, password, dob, phone)
VALUES ("Meenu", "Meena", "Subramanian", "meena@gmail.com", "Meena@1212", "2004-08-17", "7904911208");

INSERT INTO user (username, first_name, last_name, email, password, dob, phone)
VALUES ("uthra", "Uthra", "Boopathy", "uthra@gmail.com", "uthra@1212", "2004-10-12", "7904911208");

select*
from user;

-- UPDATE the values in the user table --

UPDATE user
SET first_name = 'aneem'
WHERE username = 'Meenu';

SELECT *
FROM user;

-- DELETE datas from the table -- 

DELETE FROM user
WHERE username = 'uthra';