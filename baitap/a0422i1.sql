create database if not exists a0422i1;
use a0422i1;

create table class(
id int auto_increment,
primary key(id),
`name` varchar(20)
);
create table room(
id int primary key auto_increment,
`name` varchar(20),
class_id int,
foreign key(class_id) references class(id)
);
create table jame(
`account` varchar(50) primary key,
`password` varchar(50)
);

create table student(
id int primary key auto_increment,
`name` varchar(50),
birthday date,
gender boolean,
`email` varchar(50),
`point` float,
`account` varchar(50) unique,
class_id int,
foreign key(`account`) references jame(`account`),
foreign key(class_id) references class(id)
);
create table instructor(
id int primary key auto_increment,
`name` varchar(50),
brithday date,
salary float
);

create table instructor_class(
class_id int,
instructor_id int,
primary key(class_id,instructor_id),
foreign key(class_id) references class(id),
foreign key(instructor_id) references instructor(id)
);

insert into class (name) values ('c1121g1'), ('c1221g1'),('a0821i1'),('a0921i1');
insert into room(name,class_id) values ('Ken',1), ('Jame',1),('Ada',2),('Andy',2);

insert into jame(`account`,`password`)
 values('cunn','12345'),('chunglh','12345'),('hoanhh','12345'),('dungd','12345'),('huynhtd','12345'),
 ('hainm','12345'),('namtv','12345'),('hieuvm','12345'),('kynx','12345'),('vulm','12345');

insert into jame(`account`,`password`)
 values('anv','12345'),('bnv','12345');

 
insert into instructor(`name`,brithday, salary)
 values('tran van chanh','1985-02-03',100),('tran minh chien','1985-02-03',200),('vu thanh tien','1985-02-03',300);
insert into instructor(`name`,brithday, salary)
 values('tran van nam','1989-12-12',100);

 
 insert into student(`name`,birthday, gender,`point`, class_id,`account`) 
 values ('nguyen ngoc cu','1981-12-12',1,8,1,'cunn'),('le hai chung','1981-12-12',1,5,1,'chunglh'),
 ('hoang huu hoan','1990-12-12',1,6,2,'hoanhh'),('dau dung','1987-12-12',1,8,1,'dungd'),
 ('ta dinh huynh','1981-12-12',1,7,2,'huynhtd'),('nguyen minh hai','1987-12-12',1,9,1,'hainm'),
 ('tran van nam','1989-12-12',1,4,2,'namtv'),('vo minh hieu','1981-12-12',1,3,1,'hieuvm'),
 ('le xuan ky','1981-12-12',1,7,2,'kynx'),('le minh vu','1981-12-12',1,7,1,'vulm');

 insert into student(`name`,birthday, gender,`point`, class_id,`account`) 
 values ('nguyen van a','1981-12-12',1,8,null,'anv'),('tran van b','1981-12-12',1,5,null,'bnv');

 insert into instructor_class(class_id,instructor_id) values (1,1),(1,2),(2,1),(2,2),(3,1),(3,2);

select * from room;
select* from class;
select* from student;
select* from jame;
select* from instructor;
select * from instructor_class;

-- ss3 thao t??c v???i csdl

-- 1. L???y ra th??ng tin c??c h???c vi??n, v?? cho bi???t c??c h???c vi??n ??ang theo h???c l???p n??o.
 select s.id,s.name, c.name as class_name 
 from student s 
 inner join class c on s.class_id=c.id;

-- 2. L???y ra th??ng tin c??c h???c vi??n, v?? cho bi???t c??c h???c vi??n ??ang theo h???c l???p n??o 
-- v?? c??? c??c b???n ???? ????ng k?? nh??ng ch??a c?? l???p h???c.
 select s.id,s.name, ifnull(c.name,'ch??a c?? l???p') as class_name 
 from student s 
 left join class c on s.class_id=c.id;
 
 select s.id,s.name, ifnull(c.name,'ch??a c?? l???p') as class_name 
 from student s 
 right join class c on s.class_id=c.id;
-- join 3 b???ng l???y th??m th??ng tin ph??ng h???c
select* from student;
-- 3. L???y th??ng tin c???a c??c h???c vi??n t??n 'nguyen minh hai'.
select * from student where name ='nguyen minh hai';
-- 4. L???y ra h???c vi??n c?? h??? l?? ???nguyen???
select * from student where name like 'nguyen %';
-- 5. L???y th??ng tin c???a c??c h???c vi??n t??n 'hai' ho???c 'huynh???.
select * from student where name like '% hai' or name like '% huynh';

-- l???y c??c h???c vi??n c?? t??n b???t ?????u b???ng ch??? h => regexp
select * from student where name  regexp '(^[a-zA-Z\\s]+\\sh[a-z]+$)';

-- 6. L???y ra c??c h???c vi??n c?? ??i???m l???n h??n 5 .
select * from student where point >5;
-- 7. l???y ra th??ng tin c??c h???c vi??n c?? ??i???m 4,6,8
select * from student where point in (4,6,8);

-- 8. Th??ng k??? s??? l?????ng h???c sinh theo t???ng lo???i ??i???m.
select s.point, count(point) as so_luong from student s
group by point;

-- 9 . Th??ng k??? s??? l?????ng h???c sinh theo ??i???m v?? ??i???m ph???i l???n h??n = 5
select s.point, count(point) as so_luong from student s
where s.point>=5
group by point;

-- 10. Th??ng k??? s??? l?????ng h???c sinh theo ??i???m l???n h??n 5 v?? ch??? hi???n th??? v???i s??? l?????ng>=2
select s.point, count(point) as so_luong from student s
where s.point>=5
group by point having so_luong >=2 ;

-- 11. L???y ra danh s??ch h???c vi??n c???a l???p c1121g1 v?? s???p x???p  h???c vi??n theo point,
-- n???u point b???ng nhau th?? s???p x???p theo t??n.

select s.id, s.name, s.point, c.name as class_name
from student s join class c on s.class_id=c.id
where c.name ='c1121g1' order by s.point desc, s.name asc ;

-- b??i 4: s??? d???ng c??c h??m th??ng d???ng
select * from student;
-- 0. ?????m s??? l?????ng h???c vi??n to??n trung t??m
select count(id) as so_luong from student ;
-- 1.1	Hi???n th??? danh s??ch c??c l???p v?? s??? l?????ng h???c vi??n c???a m???i l???p
select c.name as class_name, count(s.id) as so_luong from
student s 
right join class c on s.class_id=c.id
group by c.name;

-- 1.2.	 T??nh ??i???m l???n nh???t c???a m???i l???p
select c.name as class_name, ifnull(max(s.point),'ch??a c?? hv') as max_point from
student s 
right join class c on s.class_id=c.id
group by c.name ;

-- 1.3	 T??nh ??i???m trung b??nh  c???a m???i  l???p
select c.name as class_name, ifnull(avg(s.point),'ch??a c?? hv') as max_point from
student s 
right join class c on s.class_id=c.id
group by c.name;

 -- 2 L???y ra to??n b??? t??n v?? ng??y sinh c??c instructor v?? student ??? CodeGym.
select s.name, s.birthday from student s
union 
select i.name, i.brithday from instructor i;

  -- 4 L???y ra top 3 h???c vi??n c?? ??i???m cao nh???t c???a trung t??m.
select * from student order by point desc limit 0,3;
 -- d??ng subquery
 -- 5. L???y ra c??c h???c vi??n c?? ??i???m s??? l?? cao nh???t c???a trung t??m.
 select * from student where point =(select max(point) from student);
select max(point) from student;

-- 6 t??m  nh???ng gi???n vi??n ch??a t???ng tham gia gi???ng d???y;
-- d??ng join
select *
 from instructor i 
 left join instructor_class ic on i.id=ic.instructor_id
 where ic.instructor_id is null;
-- d??ng truy v???n con v???i in
select * from instructor where id not in(select distinct ic.instructor_id from instructor_class ic);

select * from student where point >= all (select s.point from student s where class_id =1);


-- ss5: index, view, sp, function, trigger
-- 1. index
select * from customers;
select count(*) from customers where city ='lyon';
explain select * from customers where city ='lyon';
create index i_city on customers(city);
drop index i_city on customers;
alter table customers add index i_city(city);
alter table customers drop index i_city;


 -- 2.view (t???o view l???y th??ng tin c???a h???c vi??n)
create view w_student as
 select s.id, s.name as name_student, c.id as id_class, c.name as class_name
 from student s 
 inner join class c on s. class_id=c.id;

 -- s??? d???ng view
select * from w_student;
select * from student;
drop view w_student;
update w_student set name_student ='cu'
where id =1;

-- 3.1  t???o m???t sp kh??ng tham s???  ????? l???y danh s??ch student


delimiter //
create procedure get_all_student()
begin 
select * from student;
end //
delimiter ;

-- goi sp
call get_all_student();
-- 3.2 sp c?? tham s??? in ????? l???y ra h???c vi??n c?? tham s??? id
delimiter $$
create procedure find_student_by_id(in p_id int)
begin 
select * from student where id =p_id;
end $$
delimiter ;
call find_student_by_id(1);
call find_student_by_id(10);
-- 3.3 sp ?????m s??? l?????ng h???c vi??n c???a trung t??m s??? d???ng OUT param
delimiter $$
create procedure count_student(out so_luong int)
begin 
select count(*) into so_luong from student;
end $$
delimiter ;
call count_student(@sl);
select @sl;
drop procedure count_studnt;
-- 4 vi??t 1 function x???p lo???i h???c l??c theo point
delimiter //
create function f_xep_loai(p_point int)
returns varchar(50)
deterministic 
begin
declare loai varchar(50);
if p_point>=8 then
set loai='gi???i';
elseif p_point>=7 then
set loai='kh??';
else 
set loai ='trung binh';
end if;
return loai;
end //
delimiter ;
select f_xep_loai(4);
select id, name , point, f_xep_loai(point) as x??p_lo???i from student;
-- 5 t???o trigger t??? ?????ng t???o t??i kho???n jame tr?????c khi th??m m???i m???t h???c vi??n
 select * from student;
 select * from jame;

insert into student(`name`,birthday, email, gender,`point`, class_id,`account`) 
 values ('chanhtran','1990-12-12','chanhtv@gmail.com',1,8,1,'chanhtv@gmail.com')

DELIMITER //
CREATE TRIGGER tr_auto_create_jame 
BEFORE INSERT ON student
FOR EACH ROW
BEGIN
insert into jame(`account`, `password`) values ( new.email, '123');
END //
DELIMITER ;


-- t???o trigger ????? ghi l???i lich s??? th??y ?????i th??ng tin b???ng student
DELIMITER //
CREATE TRIGGER tr_history 
AFTER UPDATE ON student
FOR EACH ROW
BEGIN
insert into `history`(`name`, old_point, new_point, update_day) 
values ( old.`name`, old.`point`,new.`point`,now());
END //
DELIMITER ;

select * from history;
select * from student;

-- t???o b???ng ????? ghi log
create table `history`(
id int auto_increment primary key,
name varchar(50),
old_point int,
new_point int,
update_day date
);





























