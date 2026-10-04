create database questions;

use questions;

create table employees(
    employee_id int(6),employee_name varchar(20),department varchar(50),salary int(50)
);

insert into employees values 
(101, "aarav", "engineering",95000),
(102,"meera","engineering",72000),
(103, "kabir","sales",65000),
(104,"isha","sales",92000),
(105,"rohan","engineering",90000),
(106,"neha","sales",80000);



select department, count(*) AS employee_count
from employees
group by department;