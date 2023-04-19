create database sales_manager;
use sales_manager;
create table customer (
	c_id int primary key,
    c_name varchar(50),
    c_age int
);
create table order_primary (
	o_id int primary key,
    o_date date,
    o_total_price int,
    fk_c_id int,
    foreign key (fk_c_id) references customer(c_id)
);
create table product (
	p_id int primary key,
    p_name varchar(50),
    p_price int not null
);
create table order_detail (
	od_qty int,
	fk_o_id int,
    fk_p_id int,
    primary key (fk_o_id, fk_p_id),
    foreign key (fk_o_id) references order_primary(o_id),
    foreign key (fk_p_id) references product(p_id)
);
-- CUSTOMER
insert into customer 
values (1, 'Minh Quan', 10), (2, 'Ngoc Oanh', 20), (3, 'Hoang Ha', 50);
-- ORDER
insert into order_primary
values (1, '2006-3-21', null, 1), (2, '2006-3-23', Null, 2), (3, '2006-3-16', null, 1);

-- PRODUCT
insert into product
values(1, 'May Giat', 3), (2, 'Tu Lanh', 5), (3, 'Dieu Hoa', 7), (4, 'Quat', 1), (5, 'Bep Dien', 2);

-- ORDER DETAIL
insert into order_detail
values(3, 1, 1), (7, 1, 3), (2, 1, 4), (1, 2, 1), (8, 3, 1), (4, 2, 5), (3, 2, 3);

-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select o_id, o_date, o_total_price from order_primary;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách (Thêm o_id, fk_p_id để dễ hiểu hơn)
select c_id, c_name, c_age, p_name, p_price from customer inner join order_primary on customer.c_id = order_primary.fk_c_id inner join order_detail on order_primary.o_id = order_detail.fk_o_id inner join product on order_detail.fk_p_id = product.p_id;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select c_id, c_name, c_age from customer left join order_primary on customer.c_id = order_primary.fk_c_id
where order_primary.fk_c_id is null;

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện 
-- trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)
select o_id, o_date, sum(od_qty * p_price) as payment from order_detail od INNER JOIN order_primary o ON o_id = fk_o_id INNER JOIN product p ON fk_p_id = p_id
group by o_id, o_date;