#創建資料庫
CREATE DATABASE school;
USE school;

#建立表格 students(學生)
CREATE TABLE students(
    student_id INT PRIMARY KEY,
    student_name VARCHAR(40) NOT NULL,
    age INT,
    email VARCHAR(100) UNIQUE
);
#建立表格 courses(課程)
CREATE TABLE courses(
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(80) NOT NULL,
    instructor VARCHAR(40),
);
#建立表格 enrollments(選課)
CREATE TABLE enrollments(
    enrollments_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT ,
    course_id INT,
    enrollment_date DATE DEFAULT CURRENT_DATE,
    FOREIGN KEY (student_id) REFERENCES students(student_id) ON DELETE CASECADE, 
    FOREIGN KEY (course_id) REFERENCES courses(course_id) ON DELETE CASECADE,
);

#新增students表格資料
INSERT INTO students (student_name, age, email) VALUES
('Mike', 16, 'mike123@gmail.com'),
('Julia', 18, 'julia456@gmail.com'),
('James', 20, 'james789@yahoo.com'),
('Penny', 17, 'penny000@yahoo.com');
#新增courses表格資料
INSERT INTO courses (course_name, instructor) VALUES
('Machine Learning', 'Dr. Smith'),
('Web Development', 'Dr. Kelly'),
('Finance', 'Prof Lee'),
('Accounting', 'Prof Wilson');
#新增enrollments表格資料
INSERT INTO enrollments (student_id, course_id) VALUES
(1,1), # Mike修Machine Learning
(1,3), # Mike修Finance
(2,1), # Julia修Machine Learning
(2,4), # Julia修Accounting
(3,2), # James修Web Development
(3,3), # James修Finance
(4,1), # Penny修Machine Learning
(4,4); # Penny修Accounting