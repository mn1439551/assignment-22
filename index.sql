CREATE TABLE departments(
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL
)

CREATE TABLE courses(
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50) NOT NULL,
    credits INT NOT NULL DEFAULT 3,
    dept_id int,
    FOREIGN KEY(dept_id) REFERENCES departments(dept_id) ON DELETE CASCADE
)

CREATE TABLE students(
    student_id INT PRIMARY KEY
    student_name VARCHAR(50) NOT NULL
)


CREATE TABLE enrollments(
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    FOREIGN KEY(student_id) REFERENCES students(student_id) ON DELETE CASCADE,
    FOREIGN KEY(course_id) REFERENCES courses(course_id) ON DELETE CASCADE
)


CREATE TABLE health_records(
    record_id INT PRIMARY KEY,
    student_id INT,
    blood_group VARCHAR(3),
    FOREIGN KEY(student_id) REFERENCES students(student_id) ON DELETE CASCADE
)

INSERT INTO departments(dept_id, dept_name) VALUES
(1, 'computer science'),
(2, 'mathematics'),
(3, 'physics')


INSERT INTO courses(course_id, course_name, credits, dept_id) VALUES
(1, 'database systems', 4, 1),
(2, 'algorithms', 3, 1),
(3, 'calculus', 4, 2),
(4, 'quantum mechanics', 5, 3)



INSERT INTO students(student_id, student_name) VALUES
(1, 'alice'),
(2, 'bob'),
(3, 'charlie'),
(4, 'samy'),
(5, 'eva')



INSERT INTO enrollments(enrollment_id, student_id, course_id) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 1),
(4, 3, 2),
(5, 3, 3),
(6, 4, 3),
(7, 4, 4);




INSERT INTO health_records(record_id, student_id, blood_group) VALUES
(1, 1, 'A+'),
(2, 2, 'B+'),
(3, 3, 'O-'),
(4, 4, 'AB+'),
(5, 5, 'A-');


SELECT students.student_name, health_records.blood_group
FROM students INNER JOIN health_records
ON students.student_id = health_records.blood_group;


SELECT students.student_name, courses.course_name
FROM students INNER JOIN enrollments
ON students.student_id = enrollments.student_id
INNER JOIN courses
ON enrollments.course_id = courses.course_id



SELECT students.student_name, courses.course_name
FROM students LEFT JOIN enrollments
ON students.student_id = enrollments.student_id
LEFT JOIN courses
ON enrollments.course_id = courses.course_id;



SELECT courses.course_name, students.student_name
FROM courses INNER JOIN enrollments
ON courses.course_id = enrollments.course_id
RIGHT JOIN students
ON enrollments.student_id = students.student_id;

DELETE FROM departments
WHERE dept_id = 3

DELETE FROM students
WHERE student_id = 3;

SELECT COUNT(student_id) AS "Total number of students"
FROM students;


SELECT AVG(credits) AS " Average credits of all courses"
FROM courses;


SELECT MAX(credits) AS "Highest_credit"
FROM courses;


SELECT MIN(credits) AS "Lowest_credit"
FROM courses;


SELECT COUNT(*) AS "Total_number_of_students"
FROM health_records
WHERE blood_group = 'A+';


