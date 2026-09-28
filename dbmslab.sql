-- 1. Create database
CREATE DATABASE college_db;

-- 2. Use database
USE college_db;


-- 3. Create student table
CREATE TABLE student (
    student_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    branch VARCHAR(50),
    study_year INT,
    email VARCHAR(100) UNIQUE
);


-- 4. Create course table
CREATE TABLE course (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL
);


-- 5. Create exam table
CREATE TABLE exam (
    exam_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    marks INT,

    FOREIGN KEY (student_id)
        REFERENCES student(student_id),

    FOREIGN KEY (course_id)
        REFERENCES course(course_id)
);


-- 6. Create faculty table
CREATE TABLE faculty (
    faculty_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    department VARCHAR(50)
);


-- 7. Insert students
INSERT INTO student VALUES
(1, 'Aman', 'CSE', 2, 'aman@gmail.com'),
(2, 'Riya', 'CSE', 2, 'riya@gmail.com'),
(3, 'Karan', 'ECE', 1, 'karan@gmail.com'),
(4, 'Neha', 'ME', 3, 'neha@gmail.com');


-- 8. Insert courses
INSERT INTO course VALUES
(101, 'Database Management System'),
(102, 'Operating Systems'),
(103, 'Computer Networks');


-- 9. Insert exam records
INSERT INTO exam VALUES
(1, 1, 101, 85),
(2, 1, 102, 78),
(3, 2, 101, 92),
(4, 3, 103, 74);


-- 10. Insert faculty
INSERT INTO faculty VALUES
(1, 'Dr Sharma', 'CSE'),
(2, 'Dr Verma', 'CSE'),
(3, 'Dr Gupta', 'ECE'),
(4, 'Dr Mehta', 'CSE'),
(5, 'Dr Singh', 'ECE');


-- Check tables
SELECT * FROM student;

SELECT * FROM course;

SELECT * FROM exam;

SELECT * FROM faculty;


-- =====================================================
-- INNER JOIN
-- Show student name, course name and marks
-- =====================================================

SELECT
    s.name,
    c.course_name,
    e.marks
FROM exam e
INNER JOIN student s
    ON e.student_id = s.student_id
INNER JOIN course c
    ON e.course_id = c.course_id;


-- Sort marks descending
SELECT
    s.name,
    c.course_name,
    e.marks
FROM exam e
INNER JOIN student s
    ON e.student_id = s.student_id
INNER JOIN course c
    ON e.course_id = c.course_id
ORDER BY e.marks DESC;


-- =====================================================
-- LEFT JOIN
-- Show every student, even students with no exam
-- =====================================================

SELECT
    s.student_id,
    s.name,
    e.marks
FROM student s
LEFT JOIN exam e
    ON s.student_id = e.student_id;


-- Count exams taken by each student
SELECT
    s.student_id,
    s.name,
    COUNT(e.exam_id) AS exams_taken
FROM student s
LEFT JOIN exam e
    ON s.student_id = e.student_id
GROUP BY s.student_id, s.name
ORDER BY s.student_id;


-- =====================================================
-- RIGHT JOIN
-- Show all exam rows and matching students
-- =====================================================

SELECT
    s.name,
    e.exam_id,
    e.marks
FROM student s
RIGHT JOIN exam e
    ON s.student_id = e.student_id;


-- =====================================================
-- SELF JOIN
-- Faculty working in the same department
-- =====================================================

SELECT
    f1.name AS faculty1,
    f2.name AS faculty2,
    f1.department
FROM faculty f1
JOIN faculty f2
    ON f1.department = f2.department
    AND f1.faculty_id < f2.faculty_id
ORDER BY f1.department, f1.name;


-- =====================================================
-- JOIN THREE TABLES
-- =====================================================

SELECT
    s.student_id,
    s.name,
    c.course_name,
    e.marks
FROM student s
JOIN exam e
    ON s.student_id = e.student_id
JOIN course c
    ON e.course_id = c.course_id
ORDER BY s.student_id;