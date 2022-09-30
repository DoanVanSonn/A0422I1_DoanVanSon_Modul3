CREATE DATABASE student;
USE student;
DROP TABLE class;
DROP TABLE teacher;
-- tạo bảng class
CREATE TABLE class(
-- id tự tăng
id int auto_increment primary key,
`name` varchar(50)
);
-- tạo bảng teacher
CREATE TABLE teacher(
id int auto_increment primary key,
name varchar(50),
age int,
country varchar(50)
);
-- Thêm tên vào trong class
INSERT INTO class(name)
VALUES
('Sơn'),('Đoàn');
INSERT INTO teacher(name,age,country)
VALUES
('Nguyễn Văn ',28,'Đà Nẵng'),('Nguyễn Văn B',29,'Đà Nẵng');
-- xóa

-- in bản class
SELECT * FROM `class`;
-- in bản teacher
SELECT * FROM `teacher`;

gggg