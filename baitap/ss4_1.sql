create database Cac_ham_thong_dung_CSDL;
-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
 select *
 from `subject` 
 where credit = (select max(sub.credit) from `subject` sub);
-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
 
select sub.id, sub.`name`, max(m.mark)
from `subject` sub
inner join Mark m 
on sub.id = m.sub_id
group by sub.id;

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, 
-- xếp hạng theo thứ tự điểm giảm dần 

select s.id,s.`name`,s.phone,avg(m.mark)
from student s join Mark m
on s.id = m.student_id
group by s.id
order by avg(mark) desc;

insert into Mark(sub_id, student_id, mark, exam_times)
values (3,3,7,1);

select *from `subject`;
select *from Mark;