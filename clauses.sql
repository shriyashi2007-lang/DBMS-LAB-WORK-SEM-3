-- =========================================
-- 1. CREATE DATABASE
-- =========================================

CREATE DATABASE college_dbms;

USE college_dbms;


-- =========================================
-- 2. CREATE TABLE
-- =========================================

CREATE TABLE student (
    student_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT,
    branch VARCHAR(50),
    marks INT,
    city VARCHAR(50),
    email VARCHAR(100) UNIQUE
);


-- =========================================
-- 3. INSERT DATA
-- =========================================

INSERT INTO student
(student_id, name, age, branch, marks, city, email)
VALUES
(1, 'Aman', 20, 'CSE', 85, 'Delhi', 'aman@gmail.com'),
(2, 'Riya', 21, 'CSE', 92, 'Gurgaon', 'riya@gmail.com'),
(3, 'Karan', 19, 'ECE', 74, 'Delhi', 'karan@gmail.com'),
(4, 'Neha', 22, 'ME', 81, 'Jaipur', 'neha@gmail.com'),
(5, 'Arjun', 20, 'ECE', 67, 'Gurgaon', 'arjun@gmail.com'),
(6, 'Priya', 21, 'CSE', 88, 'Delhi', 'priya@gmail.com');


-- =========================================
-- 4. SELECT
-- =========================================

SELECT * FROM student;

SELECT name, branch, marks
FROM student;


-- =========================================
-- 5. WHERE
-- =========================================

SELECT *
FROM student
WHERE branch = 'CSE';


SELECT *
FROM student
WHERE marks > 80;


SELECT *
FROM student
WHERE age = 20;


-- Multiple conditions

SELECT *
FROM student
WHERE branch = 'CSE'
AND marks > 85;


SELECT *
FROM student
WHERE city = 'Delhi'
OR city = 'Gurgaon';


-- NOT

SELECT *
FROM student
WHERE NOT branch = 'CSE';


-- =========================================
-- 6. DISTINCT
-- =========================================

SELECT DISTINCT branch
FROM student;


SELECT DISTINCT city
FROM student;


SELECT DISTINCT branch, city
FROM student;


-- =========================================
-- 7. ORDER BY
-- =========================================

-- Ascending
SELECT *
FROM student
ORDER BY marks ASC;


-- Descending
SELECT *
FROM student
ORDER BY marks DESC;


-- Multiple columns
SELECT *
FROM student
ORDER BY branch ASC, marks DESC;


-- =========================================
-- 8. BETWEEN
-- =========================================

SELECT *
FROM student
WHERE marks BETWEEN 70 AND 90;


SELECT *
FROM student
WHERE age BETWEEN 19 AND 21;


-- NOT BETWEEN

SELECT *
FROM student
WHERE marks NOT BETWEEN 70 AND 90;


-- =========================================
-- 9. IN
-- =========================================

SELECT *
FROM student
WHERE branch IN ('CSE', 'ECE');


-- NOT IN

SELECT *
FROM student
WHERE city NOT IN ('Delhi', 'Jaipur');


-- =========================================
-- 10. LIKE
-- =========================================

-- Names starting with A
SELECT *
FROM student
WHERE name LIKE 'A%';


-- Names ending with a
SELECT *
FROM student
WHERE name LIKE '%a';


-- Names containing 'ri'
SELECT *
FROM student
WHERE name LIKE '%ri%';


-- One-character wildcard

SELECT *
FROM student
WHERE name LIKE '_iya';


-- =========================================
-- 11. IS NULL
-- =========================================

SELECT *
FROM student
WHERE email IS NULL;


-- =========================================
-- 12. IS NOT NULL
-- =========================================

SELECT *
FROM student
WHERE email IS NOT NULL;


-- =========================================
-- 13. LIMIT
-- =========================================

SELECT *
FROM student
LIMIT 3;


-- Top 3 marks

SELECT *
FROM student
ORDER BY marks DESC
LIMIT 3;


-- =========================================
-- 14. UPDATE
-- =========================================

UPDATE student
SET marks = 90
WHERE student_id = 1;


-- Update multiple columns

UPDATE student
SET marks = 95,
    city = 'Noida'
WHERE student_id = 2;


-- Increase marks

UPDATE student
SET marks = marks + 5
WHERE branch = 'ECE';


-- IMPORTANT:
-- Without WHERE, all rows are updated

-- UPDATE student
-- SET city = 'Delhi';


-- =========================================
-- 15. DELETE
-- =========================================

DELETE FROM student
WHERE student_id = 6;


-- Delete using condition

DELETE FROM student
WHERE marks < 40;


-- Delete all records but keep table

DELETE FROM student;


-- =========================================
-- 16. TRUNCATE
-- =========================================

-- Removes all rows quickly
-- Table structure remains

TRUNCATE TABLE student;


-- =========================================
-- 17. DROP
-- =========================================

-- Delete complete table

DROP TABLE student;


-- Delete database

DROP DATABASE college_db;


-- =========================================
-- ALTER TABLE
-- =========================================

-- Recreate database/table for ALTER examples

CREATE DATABASE college_db;

USE college_db;

CREATE TABLE student (
    student_id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    branch VARCHAR(50),
    marks INT
);


-- =========================================
-- 18. ALTER - ADD COLUMN
-- =========================================

ALTER TABLE student
ADD email VARCHAR(100);


-- Add another column

ALTER TABLE student
ADD city VARCHAR(50);


-- =========================================
-- 19. ALTER - ADD COLUMN WITH DEFAULT
-- =========================================

ALTER TABLE student
ADD country VARCHAR(50) DEFAULT 'India';


-- =========================================
-- 20. ALTER - MODIFY COLUMN
-- MySQL syntax
-- =========================================

ALTER TABLE student
MODIFY name VARCHAR(150);


ALTER TABLE student
MODIFY marks DECIMAL(5,2);


-- =========================================
-- 21. ALTER - CHANGE COLUMN
-- Changes column name and datatype
-- =========================================

ALTER TABLE student
CHANGE name student_name VARCHAR(150);


-- =========================================
-- 22. ALTER - RENAME COLUMN
-- MySQL 8+
-- =========================================

ALTER TABLE student
RENAME COLUMN student_name TO name;


-- =========================================
-- 23. ALTER - DROP COLUMN
-- =========================================

ALTER TABLE student
DROP COLUMN country;


-- =========================================
-- 24. ALTER - RENAME TABLE
-- =========================================

ALTER TABLE student
RENAME TO students;


-- Or

RENAME TABLE students TO student;


-- =========================================
-- 25. ALTER - ADD PRIMARY KEY
-- =========================================

CREATE TABLE course (
    course_id INT,
    course_name VARCHAR(100)
);


ALTER TABLE course
ADD PRIMARY KEY (course_id);


-- =========================================
-- 26. ALTER - DROP PRIMARY KEY
-- =========================================

ALTER TABLE course
DROP PRIMARY KEY;


-- =========================================
-- 27. ALTER - ADD UNIQUE
-- =========================================

ALTER TABLE student
ADD CONSTRAINT unique_email
UNIQUE (email);


-- =========================================
-- 28. ALTER - DROP UNIQUE
-- =========================================

-- In MySQL UNIQUE is usually implemented as an index

ALTER TABLE student
DROP INDEX unique_email;


-- =========================================
-- 29. ALTER - ADD FOREIGN KEY
-- =========================================

CREATE TABLE course (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100)
);


CREATE TABLE enrollment (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT
);


ALTER TABLE enrollment
ADD CONSTRAINT fk_student
FOREIGN KEY (student_id)
REFERENCES student(student_id);


ALTER TABLE enrollment
ADD CONSTRAINT fk_course
FOREIGN KEY (course_id)
REFERENCES course(course_id);


-- =========================================
-- 30. ALTER - DROP FOREIGN KEY
-- =========================================

ALTER TABLE enrollment
DROP FOREIGN KEY fk_student;


ALTER TABLE enrollment
DROP FOREIGN KEY fk_course;


-- =========================================
-- 31. ALTER - ADD NOT NULL
-- =========================================

ALTER TABLE student
MODIFY name VARCHAR(100) NOT NULL;


-- =========================================
-- 32. ALTER - REMOVE NOT NULL
-- =========================================

ALTER TABLE student
MODIFY name VARCHAR(100) NULL;


-- =========================================
-- 33. ALTER - ADD DEFAULT
-- =========================================

ALTER TABLE student
ALTER city SET DEFAULT 'Delhi';


-- =========================================
-- 34. ALTER - DROP DEFAULT
-- =========================================

ALTER TABLE student
ALTER city DROP DEFAULT;


-- =========================================
-- 35. ADD AUTO_INCREMENT
-- =========================================

CREATE TABLE faculty (
    faculty_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100)
);


INSERT INTO faculty (name)
VALUES ('Dr Sharma');


INSERT INTO faculty (name)
VALUES ('Dr Verma');


SELECT * FROM faculty;


-- =========================================
-- 36. COMPARISON OPERATORS
-- =========================================

SELECT *
FROM student
WHERE marks = 80;


SELECT *
FROM student
WHERE marks != 80;


SELECT *
FROM student
WHERE marks <> 80;


SELECT *
FROM student
WHERE marks > 80;


SELECT *
FROM student
WHERE marks < 80;


SELECT *
FROM student
WHERE marks >= 80;


SELECT *
FROM student
WHERE marks <= 80;


-- =========================================
-- 37. AND
-- =========================================

SELECT *
FROM student
WHERE branch = 'CSE'
AND marks > 80;


-- =========================================
-- 38. OR
-- =========================================

SELECT *
FROM student
WHERE branch = 'CSE'
OR branch = 'ECE';


-- =========================================
-- 39. NOT
-- =========================================

SELECT *
FROM student
WHERE NOT branch = 'CSE';


-- =========================================
-- 40. ALIAS
-- =========================================

SELECT
    name AS student_name,
    marks AS student_marks
FROM student;


-- =========================================
-- 41. COUNT
-- =========================================

SELECT COUNT(*)
FROM student;


SELECT COUNT(*) AS total_students
FROM student;


-- =========================================
-- 42. SUM
-- =========================================

SELECT SUM(marks) AS total_marks
FROM student;


-- =========================================
-- 43. AVG
-- =========================================

SELECT AVG(marks) AS average_marks
FROM student;


-- =========================================
-- 44. MAX
-- =========================================

SELECT MAX(marks) AS highest_marks
FROM student;


-- =========================================
-- 45. MIN
-- =========================================

SELECT MIN(marks) AS lowest_marks
FROM student;


-- =========================================
-- 46. GROUP BY
-- =========================================

SELECT
    branch,
    COUNT(*) AS total_students
FROM student
GROUP BY branch;


-- Average marks by branch

SELECT
    branch,
    AVG(marks) AS average_marks
FROM student
GROUP BY branch;


-- =========================================
-- 47. HAVING
-- =========================================

SELECT
    branch,
    AVG(marks) AS average_marks
FROM student
GROUP BY branch
HAVING AVG(marks) > 80;


-- =========================================
-- 48. GROUP BY + HAVING + ORDER BY
-- =========================================

SELECT
    branch,
    COUNT(*) AS total_students,
    AVG(marks) AS average_marks
FROM student
GROUP BY branch
HAVING COUNT(*) >= 2
ORDER BY average_marks DESC;


-- =========================================
-- 49. CONCAT
-- =========================================

SELECT CONCAT(name, ' - ', branch) AS student_details
FROM student;


-- =========================================
-- 50. CREATE TABLE AS SELECT
-- =========================================

CREATE TABLE cse_students AS
SELECT *
FROM student
WHERE branch = 'CSE';


-- =========================================
-- 51. INSERT INTO SELECT
-- =========================================

CREATE TABLE student_backup (
    student_id INT,
    name VARCHAR(100),
    age INT,
    branch VARCHAR(50),
    marks INT,
    city VARCHAR(50),
    email VARCHAR(100)
);


INSERT INTO student_backup
SELECT *
FROM student;


-- =========================================
-- 52. DELETE vs TRUNCATE vs DROP
-- =========================================

-- DELETE
-- Removes selected rows
-- Can use WHERE
DELETE FROM student
WHERE student_id = 1;


-- TRUNCATE
-- Removes all rows
-- Keeps table structure
TRUNCATE TABLE student;


-- DROP
-- Removes table completely
DROP TABLE student;