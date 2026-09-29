-- =========================================
-- CREATE A DIFFERENT DATABASE
-- =========================================

CREATE DATABASE company_db;

USE company_db;


-- =========================================
-- CREATE A DIFFERENT TABLE
-- =========================================

CREATE TABLE employee (
    emp_id INT,
    emp_name VARCHAR(50),
    salary INT
);


-- Check table structure
DESC employee;


-- =========================================
-- 1. ADD A NEW COLUMN
-- =========================================

ALTER TABLE employee
ADD department VARCHAR(50);


-- =========================================
-- 2. ADD MULTIPLE COLUMNS
-- =========================================

ALTER TABLE employee
ADD email VARCHAR(100),
ADD city VARCHAR(50);


-- =========================================
-- 3. ADD COLUMN AT FIRST POSITION
-- =========================================

ALTER TABLE employee
ADD phone VARCHAR(15) FIRST;


-- =========================================
-- 4. ADD COLUMN AFTER ANOTHER COLUMN
-- =========================================

ALTER TABLE employee
ADD age INT AFTER emp_name;


-- =========================================
-- 5. MODIFY DATATYPE
-- =========================================

ALTER TABLE employee
MODIFY emp_name VARCHAR(100);


ALTER TABLE employee
MODIFY salary DECIMAL(10,2);


-- =========================================
-- 6. ADD NOT NULL
-- =========================================

ALTER TABLE employee
MODIFY emp_name VARCHAR(100) NOT NULL;


-- =========================================
-- 7. REMOVE NOT NULL
-- =========================================

ALTER TABLE employee
MODIFY emp_name VARCHAR(100) NULL;


-- =========================================
-- 8. CHANGE COLUMN NAME + DATATYPE
-- =========================================

ALTER TABLE employee
CHANGE emp_name employee_name VARCHAR(100);


-- =========================================
-- 9. RENAME COLUMN
-- MySQL 8+
-- =========================================

ALTER TABLE employee
RENAME COLUMN employee_name TO emp_name;


-- =========================================
-- 10. ADD DEFAULT VALUE
-- =========================================

ALTER TABLE employee
ALTER city SET DEFAULT 'Delhi';


-- =========================================
-- 11. DROP DEFAULT VALUE
-- =========================================

ALTER TABLE employee
ALTER city DROP DEFAULT;


-- =========================================
-- 12. ADD PRIMARY KEY
-- =========================================

ALTER TABLE employee
ADD PRIMARY KEY (emp_id);


-- =========================================
-- 13. DROP PRIMARY KEY
-- =========================================

ALTER TABLE employee
DROP PRIMARY KEY;


-- =========================================
-- 14. ADD PRIMARY KEY WITH CONSTRAINT NAME
-- =========================================

ALTER TABLE employee
ADD CONSTRAINT pk_employee
PRIMARY KEY (emp_id);


-- =========================================
-- 15. ADD UNIQUE CONSTRAINT
-- =========================================

ALTER TABLE employee
ADD CONSTRAINT unique_email
UNIQUE (email);


-- =========================================
-- 16. DROP UNIQUE CONSTRAINT
-- In MySQL UNIQUE is an index
-- =========================================

ALTER TABLE employee
DROP INDEX unique_email;


-- =========================================
-- 17. ADD CHECK CONSTRAINT
-- =========================================

ALTER TABLE employee
ADD CONSTRAINT chk_salary
CHECK (salary >= 0);


-- =========================================
-- 18. DROP CHECK CONSTRAINT
-- MySQL 8+
-- =========================================

ALTER TABLE employee
DROP CHECK chk_salary;


-- =========================================
-- CREATE ANOTHER TABLE FOR FOREIGN KEY
-- =========================================

CREATE TABLE department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);


-- Add dept_id in employee
ALTER TABLE employee
ADD dept_id INT;


-- =========================================
-- 19. ADD FOREIGN KEY
-- =========================================

ALTER TABLE employee
ADD CONSTRAINT fk_department
FOREIGN KEY (dept_id)
REFERENCES department(dept_id);


-- =========================================
-- 20. DROP FOREIGN KEY
-- =========================================

ALTER TABLE employee
DROP FOREIGN KEY fk_department;


-- =========================================
-- 21. ADD INDEX
-- =========================================

ALTER TABLE employee
ADD INDEX idx_emp_name (emp_name);


-- =========================================
-- 22. DROP INDEX
-- =========================================

ALTER TABLE employee
DROP INDEX idx_emp_name;


-- =========================================
-- 23. ADD AUTO_INCREMENT
-- emp_id must normally be indexed/key
-- =========================================

ALTER TABLE employee
MODIFY emp_id INT AUTO_INCREMENT;


-- =========================================
-- 24. REMOVE AUTO_INCREMENT
-- =========================================

ALTER TABLE employee
MODIFY emp_id INT;


-- =========================================
-- 25. DROP A COLUMN
-- =========================================

ALTER TABLE employee
DROP COLUMN phone;


-- =========================================
-- 26. DROP MULTIPLE COLUMNS
-- =========================================

ALTER TABLE employee
DROP COLUMN age,
DROP COLUMN city;


-- =========================================
-- 27. RENAME TABLE
-- =========================================

ALTER TABLE employee
RENAME TO employees;


-- Rename it back
ALTER TABLE employees
RENAME TO employee;


-- =========================================
-- 28. CHANGE TABLE ENGINE
-- =========================================

ALTER TABLE employee
ENGINE = InnoDB;


-- =========================================
-- 29. CHANGE TABLE CHARACTER SET
-- =========================================

ALTER TABLE employee
CONVERT TO CHARACTER SET utf8mb4;


-- =========================================
-- 30. CHANGE AUTO_INCREMENT START VALUE
-- =========================================

ALTER TABLE employee
AUTO_INCREMENT = 100;


-- =========================================
-- FINAL TABLE STRUCTURE
-- =========================================

DESC employee;