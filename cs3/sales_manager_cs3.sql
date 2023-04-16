create database sales_manager_cs3;
use sales_manager_cs3;
create table customer (
	c_id int primary key,
    c_name varchar(50),
    c_age int
);
create table order_primary (
	o_id int primary key,
    o_date date,
    o_total_price int not null,
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