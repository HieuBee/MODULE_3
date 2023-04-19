create database view_index_procedure;
use view_index_procedure;
create table products(
	id int primary key,
    productCode varchar(255),
    productName varchar(50),
    productPrice double,
    productAmount int,
    productDescription varchar(255),
    productStatus varchar(50)
);
insert into products
values (1, 'KH001', 'Ao', 20000, 20, 'Ao bun cao cap', '10d'),
(2, 'KH002', 'Quan', 200000, 20, 'Quan jean cao cap', '10d'),
(3, 'KH003', 'Vi da', 1000000, 20, 'Vi da cao cap', '10d'),
(4, 'KH004', 'Giay sandal', 400000, 20, 'Giay sandal cao cap', '10d'),
(5, 'KH005', 'Balo', 20000, 550000, 'Balo tham nuoc cao cap', '10d');

-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
create index inx_productsCode on products(productCode);
create index inx_products on products(productCode, productName, productPrice);
explain select * from products where productCode = 'KH003';

-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
-- Tiến hành sửa đổi view
-- Tiến hành xoá view
create view products_view as select productCode, productName, productPrice, productStatus from products;
create or replace view products_view as select productCode, productName, productPrice, productStatus, productAmount from products;
drop view products_view;

-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
delimiter //
create procedure display()
begin
	select * from products;
end //
delimiter ;
call display();

-- Tạo store procedure thêm một sản phẩm mới
delimiter //
create procedure addProducts(in idAdd int, in productCodeAdd varchar(255),in productNameAdd varchar(50),
in productPriceAdd double, in productAmountAdd int, in productDescriptionAdd varchar(255), in productStatusAdd varchar(50))
begin
	insert into products
    values (idAdd, productCodeAdd, productNameAdd, productPriceAdd, productAmountAdd, productDescriptionAdd, productStatusAdd);
    
    -- select * from products where id = idAdd and productCodeAdd = productCode and productName = productNameAdd
    -- and productPrice = productPriceAdd and productAmount = productAmountAdd and productDescription = productDescriptionAdd
    -- and productStatus = productStatusAdd;
end //
delimiter ;
call addProducts(6, 'KH006', 'That lung', 200000, 300, 'That lung da cao cap', '10d');

-- Tạo store procedure sửa thông tin sản phẩm theo id
delimiter //
create procedure updateProduct(in idUpdate int)
begin
	update products
    set productCode = 'KH007', productName = 'So mi', productPrice = 250000, productAmount = 17, productDescription = 'So mi trang cao cap', 
    productStatus = '10d + 1'
    where id = idUpdate;
end //
delimiter ;

call updateProduct(6);

-- Tạo store procedure xoá sản phẩm theo id
delimiter //
create procedure deleteProduct(in idDelete int)
begin
	delete from products
    where id = idDelete;
end //
delimiter ;
call deleteProduct(6);
select * from products;