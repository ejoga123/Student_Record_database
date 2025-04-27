CREATE DATABASE student_record;

USE student_record;

-- create table for students
CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    date_of_birth DATE,
    gender ENUM('Male', 'Female', 'Other'),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20) UNIQUE,
    address TEXT,
    status ENUM('Active', 'Graduated', 'Suspended') DEFAULT 'Active'
);


-- crate table for departments
CREATE TABLE departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) UNIQUE,
    description TEXT
);


-- crate table for courses 
CREATE TABLE courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    department_id INT,
    course_code VARCHAR(20) UNIQUE,
    course_name VARCHAR(100),
    description TEXT,
    credit_hours INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);



-- create table for Teachers 
CREATE TABLE teachers (
    teacher_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100) NULL UNIQUE,
    phone VARCHAR(20) NULL UNIQUE,
    department_id INT,
    hire_date DATE,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);


-- create table for enrollments
CREATE TABLE enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    semester VARCHAR(20),
    year INT,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);


-- create table for grades 
CREATE TABLE grades (
    grade_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    semester VARCHAR(20),
    year INT,
    grade VARCHAR(2),
    remarks TEXT,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);


-- create table for attendance
CREATE TABLE attendance (
    attendance_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    date DATE,
    status ENUM('Present', 'Absent', 'Late'),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);


-- create table for fees
CREATE TABLE fees (
    fee_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    amount DECIMAL(10, 2),
    payment_date DATE,
    status ENUM('Paid', 'Pending', 'Failed'),
    payment_method VARCHAR(50),
    transaction_reference VARCHAR(100),
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);


-- create table for users
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE,
    password_hash VARCHAR(255),
    email VARCHAR(100) UNIQUE,
    role ENUM('Admin', 'Teacher'),
    teacher_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (teacher_id) REFERENCES teachers(teacher_id)
);

-- data insertion for departments
INSERT INTO departments (description) 
VALUES
('Department of Computer Science'),
('Department of Mathematics'),
('Department of Physics'),
('Department of Mechanical Engineering'),
('Department of Electrical Engineering'),
('Department of Civil Engineering'),
('Department of Business Administration'),
('Department of Economics'),
('Department of Law'),
('Department of Medicine'),
('Department of Pharmacy'),
('Department of Political Science'),
('Department of Mass Communication'),
('Department of Psychology'),
('Department of Sociology'),
('Department of Chemistry'),
('Department of Biology'),
('Department of Architecture'),
('Department of Fine Arts');


-- data insertion for teachers
INSERT INTO teachers (first_name, last_name, email, phone, department_id, hire_date)
VALUES 
('Thresa', 'Omaga', 'thresaomaga@school.edu', '0700000007', 1, '2023-09-01'),
('jame', 'Idoko', 'jamesidoko@school.edu', '0700000008', 3, '2023-06-15'),
('James', 'Agbo', 'jamesagbo@school.edu', '070000003', 3, '2021-09-01'),
('Mary', 'Odeh', 'maryodeh@school.edu', '0700000004', 4, '2025-01-15');


-- data insertion for courses
INSERT INTO courses (department_id, course_code, course_name, description, credit_hours) VALUES
(1, 'CSC101', 'Intro to Programming', 'Basics of Python', 3),
(2, 'MAT101', 'Calculus I', 'Differential Calculus', 4),
(3, 'PHY101', 'General Physics', 'Mechanics and Thermodynamics', 4);


-- data insertion for students
INSERT INTO students (first_name, last_name, date_of_birth, gender, email, phone, address) VALUES
('Alice', 'Johnson', '2003-05-12', 'Female', 'alice@example.com', '0701234567', 'Lagos'),
('Mercy', 'Adikwu', '2002-09-23', 'Male', 'mercy@example.com', '0709876543', 'Benue'),
('Mary', 'Adikwu', '2002-03-22', 'Male', 'mary@example.com', '0709876553', 'Yobe'),
('Blessing', 'Agbo', '2001-09-23', 'Female', 'blessing@example.com', '0709875543', 'Nassrawa'),
('Victoria', 'Odeh', '2006-09-23', 'Male', 'victor@example.com', '0709976543', 'Dlta'),
('Agnes', 'Ejoga', '2004-09-23', 'Female', 'agnes@example.com', '0709878543', 'Eke'),
('Easter', 'Sunday', '2002-09-13', 'Female', 'easter@example.com', '0709876541', 'Adoka'),
('Emmanuel', 'Sunday', '2001-09-23', 'Male', 'emmanuel@example.com', '0709876943', 'Ajide'),
('Frankly', 'Ejeh', '2002-09-24', 'Male', 'Frankly@example.com', '0809876540', 'apakli'),
('Philp', 'Ohene', '2005-09-23', 'Male', 'philip@example.com', '0709876548', 'Aokpasu');


-- data insertion for enrollments
INSERT INTO enrollments (student_id, course_id, semester, year)
VALUES
(11, 1, 'Fall', 2024),
(12, 2, 'Fall', 2024),
(13, 1, 'Fall', 2024),
(14, 3, 'Fall', 2024);

-- data insertion for grades
INSERT INTO grades (student_id, course_id, semester, year, grade, remarks) 
VALUES
(11, 1, 'Fall', 2024, 'A', 'Excellent'),
(12, 2, 'Fall', 2024, 'B+', 'Good'),
(13, 1, 'Fall', 2024, 'B', 'Good'),
(14, 3, 'Fall', 2024, 'C+', 'Average');

--  data insertion for fees
INSERT INTO fees (student_id, amount, payment_date, status, payment_method, transaction_reference)
VALUES
(11, 500.00, '2024-09-15', 'Paid', 'Card', 'TRX10001'),
(12, 500.00, '2024-09-20', 'Paid', 'Mobile Money', 'TRX10002');