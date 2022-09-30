CREATE DATABASE CSDL_product_management;

use CSDL_product_management;

CREATE TABLE customer (
	id int PRIMARY KEY AUTO_INCREMENT,
	`name` VARCHAR(50),
	age int
);
insert into customer(`name`,age)
values('Minh Quan',10),
			('Ngoc Oanh',20),
            ('Hong Ha',50);


CREATE TABLE`order` (
	id int PRIMARY KEY AUTO_INCREMENT,
	customer_id int,
	orderDate datetime,
	total_price double,
	FOREIGN KEY (customer_id) REFERENCES customer (id)
);

insert into `order`(customer_id,orderDate,total_price)
values (1,'2006-03-21',null),
			(2,'2006-03-23',null),
			(1,'2006-03-16',null);

CREATE TABLE product (
	id int PRIMARY KEY AUTO_INCREMENT,
	`name` VARCHAR(50),
	price double
);
insert into product(`name`,price)
values('May Giat',3),
			('Tu Lanh',5),
            ('Dieu Hoa',7),
            ('Quat',1),
            ('Bep Dien',2);

CREATE TABLE order_detail (
	order_id int,
	product_id int,
	quantity SMALLINT,
	PRIMARY KEY (order_id, product_id),
	FOREIGN KEY (order_id) REFERENCES `order` (id),
	FOREIGN KEY (product_id) REFERENCES `product` (id)
);
INSERT INTO order_detail (order_id, product_id, quantity) VALUE(1,1,3);
INSERT INTO order_detail (order_id, product_id, quantity) VALUE(1,3,7);
INSERT INTO order_detail (order_id, product_id, quantity) VALUE(1,4,2);
INSERT INTO order_detail (order_id, product_id, quantity) VALUE(3,1,8);
INSERT INTO order_detail (order_id, product_id, quantity) VALUE(2,5,4);
INSERT INTO order_detail (order_id, product_id, quantity) VALUE(2,3,3);
        -- 1 Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
        select *from  `order`;
        -- 2 Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
     select  c.`name`,o.orderDate,p.`name`
     from customer c
     join `order` o
     on c.id = o.customer_id 
      join order_detail od 
      on c.id = od.order_id
      join product p on od.product_id = p.id;
    -- 3 Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select * from customer c where not exists (select 1 from `order` o where o.customer_id = c.id);

select * from customer WHERE id not in (SELECT customer_id FROM `order`);

select * from customer c
left join `order` o on o.customer_id= c.id
where o.id is null;
-- 4 Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)
SELECT o.id as `code`, o.orderDate as `date`, sum(p.price* d.quantity) as total from `order` o
INNER JOIN order_detail d on d.order_id= o.id
INNER JOIN product p on p.id= d.product_id
GROUP BY o.idproducts