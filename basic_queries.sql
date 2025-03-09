#顯示資料結構
DESC school;

#刪除資料庫
DROP DATABASE school;
#刪除表格
DROP TABLE students;
#刪除屬性
ALTER TABLE students DROP COLUMN email;
#增加屬性
ALTER TABLE student ADD gpa DECIMAL (3,2);

#列出students表格資料
SELECT * FROM students;
#列出courses中的course_name資料
SELECT course_name FROM courses;

#修改資料(Penny的 Accounting改 Web Development)
UPDATE enrollments
SET course_id = (SELECT course_id FROM courses WHERE course_name = 'Web Developmentg')
WHERE student_id = (SELECT student_id FROM students WHERE student_name = 'Penny') 
AND course_id = (SELECT course_id FROM courses WHERE course_name = 'Accounting');

#查詢Penny的選課紀錄
SELECT student.student_name, courses.course_name, enrollments.enrollment_date
FROM enrollments
JOIN students ON enrollments.student_id = students.student_id
JOIN courses ON enrollments.course_id = courses.course_id
WHERE students.student_name = 'Penny';

#查詢有修 Machine Learning 的學生
SELECT courses.course_name, student.student_name
FROM enrollments
JOIN students ON enrollments.student_id = students.student_id
JOIN courses ON enrollments.course_id = courses.course_id
WHERE courses.course_name = 'Machine Learning' ;

#計算每門課程的修課人數
SELECT courses.course_name, COUNT(enrollments.student_id) AS student_count
FROM courses
LEFT JOIN enrollments ON courses.course_id = enrollments.course_id
GROUP BY courses.course_name

#刪除課程Web Development
DELETE FROM courses WHERE course_name = "Web Development"



