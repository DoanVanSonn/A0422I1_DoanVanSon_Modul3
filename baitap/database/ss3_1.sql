CREATE DATABASE IF NOT EXISTS student_manager2;

use student_manager2;

CREATE TABLE  class (
	id INT PRIMARY KEY,
	`name` VARCHAR(50) NOT NULL,
	start_date DATETIME NOT NULL,
	`status` BIT
);

insert into class
VALUES (1, 'A1', '2008-12-20', 1);
INSERT INTO Class
VALUES (2, 'A2', '2008-12-22', 1);
INSERT INTO Class
VALUES (3, 'B3', current_date, 0);



CREATE TABLE student (
	id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
	`name` varchar(30) NOT NULL,
	address varchar(50),
	phone varchar(20),
	`status` bit,
	class_id int NOT NULL,
	FOREIGN KEY (class_id) REFERENCES class (id)
);

INSERT INTO student (`name`, address , phone, `status`, class_id )
VALUES ('Hung', 'Ha Noi', '09121131137', 1, 1);
INSERT INTO student (`name`, address , phone, `status`, class_id )
VALUES ('Hoa', 'Hai phong','01233', 1, 1);
INSERT INTO student (`name`, address , phone, `status`, class_id )
VALUES ('Manh', 'HCM', '0123123123', 0, 2);


CREATE TABLE IF NOT EXISTS `subject` (
	id int PRIMARY KEY AUTO_INCREMENT,
	`name` VARCHAR(30) NOT NULL,
	credit tinyint NOT NULL DEFAULT 1,
	`status` bit DEFAULT 1,
	CHECK (Credit >= 1)
);
insert into `subject`
VALUES (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);

CREATE TABLE IF NOT EXISTS mark (
	id int PRIMARY KEY AUTO_INCREMENT,
	sub_id int NOT NULL,
	student_id int NOT NULL,
	mark float DEFAULT 0,
	exam_times tinyint DEFAULT 1,
	UNIQUE (sub_id, student_id),
CHECK (mark BETWEEN 0 AND 100),
FOREIGN KEY (sub_id) REFERENCES `subject` (id),
FOREIGN KEY (student_id) REFERENCES student (id)
);

insert into mark (sub_id, student_id, mark, exam_times)
values  (1, 1, 8, 1),
			(1, 2, 10, 2),
			(2, 1, 12, 1);
       
-- 1 Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
select * from student where `name` like 'h%';

-- 2 Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
select *from class
where month(start_date) = 12;
-- 3 Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
select *from `subject`
where credit between 3 and 5;
-- 4 Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
update student
set class_id = 2
where `name` = 'Hung';
select *from student;
-- 5 Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
select s.name, su.name, m.mark from student s
join mark m on s.id = m.student_id
join subject su on m.sub_id = su.id
order by m.mark desc, s.name;