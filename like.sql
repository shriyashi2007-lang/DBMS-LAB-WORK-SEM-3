 CREATE DATABASE SHRIU;

use shri;



create table customer(
    customer_id INT PRIMARY KEY,
    last_name VARCHAR(100) NOT NULL,
    first_name VARCHAR(50),
    favorite_website VARCHAR(1000)
);


INSERT INTO customer VALUES
(4000, 'jackson' , 'joe' , 'technothenet.com'),
(5000 , 'smith', 'jane', 'digminecraft.com'),
(6000, 'ferguson','samantha','bigactivities.com'),
(7000,'reynolds ','allen','checkyourmath.com'),
(8000,'anderson','paige','NULL'),
(9000,'johnson','derek','techonthenet.com');

SELECT * FROM customer;

SELECT last_name FROM customer where last_name LIKE 'j%';

SELECT last_name FROM customer where last_name LIKE '%e%';

SELECT first_name FROM customer where first_name LIKE 's%';

SELECT last_name FROM customer where last_name LIKE '%son%';

