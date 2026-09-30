-- =========================================
-- 1. CREATE DATABASE
-- =========================================

CREATE DATABASE university_db;

USE university_db;


-- =========================================
-- 2. CREATE STUDENT TABLE
-- =========================================

CREATE TABLE student (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    branch VARCHAR(50),
    city VARCHAR(50)
);


-- =========================================
-- 3. CREATE COURSE TABLE
-- =========================================

CREATE TABLE course (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    credits INT
);


-- =========================================
-- 4. CREATE ENROLLMENT TABLE
-- =========================================

CREATE TABLE enrollment (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    marks INT,

    FOREIGN KEY (student_id)
        REFERENCES student(student_id),

    FOREIGN KEY (course_id)
        REFERENCES course(course_id)
);


-- =========================================
-- 5. CREATE FACULTY TABLE
-- =========================================

CREATE TABLE faculty (
    faculty_id INT PRIMARY KEY,
    faculty_name VARCHAR(100),
    department VARCHAR(50)
);


-- =========================================
-- 6. INSERT STUDENT DATA
-- =========================================

INSERT INTO student VALUES
(1, 'Aman', 'CSE', 'Delhi'),
(2, 'Riya', 'CSE', 'Gurgaon'),
(3, 'Karan', 'ECE', 'Delhi'),
(4, 'Neha', 'ME', 'Jaipur'),
(5, 'Arjun', 'ECE', 'Gurgaon');


-- =========================================
-- 7. INSERT COURSE DATA
-- =========================================

INSERT INTO course VALUES
(101, 'DBMS', 4),
(102, 'Operating Systems', 4),
(103, 'Computer Networks', 3),
(104, 'Data Structures', 4);


-- =========================================
-- 8. INSERT ENROLLMENT DATA
-- =========================================

INSERT INTO enrollment VALUES
(1, 1, 101, 85),
(2, 1, 102, 78),
(3, 2, 101, 92),
(4, 2, 104, 88),
(5, 3, 103, 74),
(6, 5, 101, 69);


-- =========================================
-- 9. INSERT FACULTY DATA
-- =========================================

INSERT INTO faculty VALUES
(1, 'Dr Sharma', 'CSE'),
(2, 'Dr Verma', 'CSE'),
(3, 'Dr Gupta', 'ECE'),
(4, 'Dr Mehta', 'ME'),
(5, 'Dr Singh', 'ECE');


-- =========================================
-- 10. SHOW ALL DATA
-- =========================================

SELECT * FROM student;

SELECT * FROM course;

SELECT * FROM enrollment;

SELECT * FROM faculty;


-- =========================================
-- 11. INNER JOIN
-- Only matching rows
-- =========================================

SELECT
    s.student_id,
    s.student_name,
    c.course_name,
    e.marks
FROM student s
INNER JOIN enrollment e
    ON s.student_id = e.student_id
INNER JOIN course c
    ON e.course_id = c.course_id;


-- =========================================
-- 12. INNER JOIN WITH CONDITION
-- =========================================

SELECT
    s.student_name,
    c.course_name,
    e.marks
FROM student s
JOIN enrollment e
    ON s.student_id = e.student_id
JOIN course c
    ON e.course_id = c.course_id
WHERE e.marks > 80;


-- =========================================
-- 13. LEFT JOIN
-- Shows all students
-- =========================================

SELECT
    s.student_id,
    s.student_name,
    e.course_id,
    e.marks
FROM student s
LEFT JOIN enrollment e
    ON s.student_id = e.student_id;


-- =========================================
-- 14. LEFT JOIN WITH COURSE
-- =========================================

SELECT
    s.student_name,
    c.course_name,
    e.marks
FROM student s
LEFT JOIN enrollment e
    ON s.student_id = e.student_id
LEFT JOIN course c
    ON e.course_id = c.course_id;


-- =========================================
-- 15. RIGHT JOIN
-- Shows all enrollment rows
-- =========================================

SELECT
    s.student_name,
    e.enrollment_id,
    e.marks
FROM student s
RIGHT JOIN enrollment e
    ON s.student_id = e.student_id;


-- =========================================
-- 16. RIGHT JOIN WITH COURSE
-- =========================================

SELECT
    s.student_name,
    c.course_name,
    e.marks
FROM student s
RIGHT JOIN enrollment e
    ON s.student_id = e.student_id
RIGHT JOIN course c
    ON e.course_id = c.course_id;


-- =========================================
-- 17. SELF JOIN
-- Faculty in same department
-- =========================================

SELECT
    f1.faculty_name AS faculty1,
    f2.faculty_name AS faculty2,
    f1.department
FROM faculty f1
JOIN faculty f2
    ON f1.department = f2.department
    AND f1.faculty_id < f2.faculty_id;


-- =========================================
-- 18. CROSS JOIN
-- Every student with every course
-- =========================================

SELECT
    s.student_name,
    c.course_name
FROM student s
CROSS JOIN course c;


-- =========================================
-- 19. JOIN THREE TABLES
-- =========================================

SELECT
    s.student_name,
    s.branch,
    c.course_name,
    c.credits,
    e.marks
FROM student s
JOIN enrollment e
    ON s.student_id = e.student_id
JOIN course c
    ON e.course_id = c.course_id;


-- =========================================
-- 20. JOIN + ORDER BY
-- =========================================

SELECT
    s.student_name,
    c.course_name,
    e.marks
FROM student s
JOIN enrollment e
    ON s.student_id = e.student_id
JOIN course c
    ON e.course_id = c.course_id
ORDER BY e.marks DESC;


-- =========================================
-- 21. JOIN + GROUP BY
-- =========================================

SELECT
    s.student_name,
    COUNT(e.course_id) AS total_courses
FROM student s
LEFT JOIN enrollment e
    ON s.student_id = e.student_id
GROUP BY s.student_id, s.student_name;


-- =========================================
-- 22. JOIN + AVG
-- =========================================

SELECT
    s.student_name,
    AVG(e.marks) AS average_marks
FROM student s
JOIN enrollment e
    ON s.student_id = e.student_id
GROUP BY s.student_id, s.student_name;


-- =========================================
-- 23. FULL OUTER JOIN
-- MySQL does not support FULL OUTER JOIN directly
-- Simulate using LEFT JOIN + RIGHT JOIN + UNION
-- =========================================

SELECT
    s.student_id,
    s.student_name,
    e.enrollment_id,
    e.marks
FROM student s
LEFT JOIN enrollment e
    ON s.student_id = e.student_id

UNION

SELECT
    s.student_id,
    s.student_name,
    e.enrollment_id,
    e.marks
FROM student s
RIGHT JOIN enrollment e
    ON s.student_id = e.student_id;


-- =========================================
-- 24. UNION
-- Removes duplicate rows
-- =========================================

SELECT student_name AS name
FROM student

UNION

SELECT faculty_name AS name
FROM faculty;


-- =========================================
-- 25. UNION ALL
-- Keeps duplicate rows
-- =========================================

SELECT student_name AS name
FROM student

UNION ALL

SELECT faculty_name AS name
FROM faculty;


-- =========================================
-- 26. UNION WITH CITY / DEPARTMENT
-- Same number of columns required
-- =========================================

SELECT
    student_name AS person_name,
    branch AS department
FROM student

UNION

SELECT
    faculty_name AS person_name,
    department
FROM faculty;


-- =========================================
-- 27. UNION ALL WITH CITY / DEPARTMENT
-- =========================================

SELECT
    student_name AS person_name,
    branch AS department
FROM student

UNION ALL

SELECT
    faculty_name AS person_name,
    department
FROM faculty;


-- =========================================
-- 28. UNION WITH WHERE
-- =========================================

SELECT student_name AS name
FROM student
WHERE branch = 'CSE'

UNION

SELECT faculty_name AS name
FROM faculty
WHERE department = 'CSE';


-- =========================================
-- 29. UNION ALL WITH WHERE
-- =========================================

SELECT student_name AS name
FROM student
WHERE branch = 'ECE'

UNION ALL

SELECT faculty_name AS name
FROM faculty
WHERE department = 'ECE';


-- =========================================
-- 30. UNION + ORDER BY
-- ORDER BY comes at the very end
-- =========================================

SELECT student_name AS name
FROM student

UNION

SELECT faculty_name AS name
FROM faculty

ORDER BY name;


-- =========================================
-- 31. UNION ALL + ORDER BY
-- =========================================

SELECT student_name AS name
FROM student

UNION ALL

SELECT faculty_name AS name
FROM faculty

ORDER BY name;


-- =========================================
-- 32. DIFFERENCE BETWEEN UNION AND UNION ALL
-- =========================================

-- UNION:
-- removes duplicate rows

SELECT branch
FROM student

UNION

SELECT department
FROM faculty;


-- UNION ALL:
-- keeps duplicate rows

SELECT branch
FROM student

UNION ALL

SELECT department
FROM faculty;