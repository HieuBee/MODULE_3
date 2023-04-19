create database cs_sql;
create table vi_tri(
	ma_vi_tri int primary key auto_increment,
    ten_vi_tri varchar(45)
);
create table trinh_do(
	ma_trinh_do int primary key auto_increment,
    ten_trinh_do varchar(45)
);
create table loai_khach(
	ma_loai_khach int primary key auto_increment,
    ten_loai_khach varchar(45)
);
create table bo_phan(
	ma_bo_phan int primary key auto_increment,
    ten_bo_phan varchar(45)
);
create table dich_vu_di_kem(
	ma_dich_vu_di_kem int primary key auto_increment,
    ten_dich_vu_di_kem varchar(45),
    gia double,
    don_vi varchar(45),
    trang_thai varchar(45)
);
create table kieu_thue(
	ma_kieu_thue int primary key auto_increment,
    ten_kieu_thue varchar(45)
);
create table loai_dich_vu(
	ma_loai_dich_vu int primary key auto_increment,
    ten_loai_dich_vu varchar(45)
);
alter table dich_vu_di_kem 
modify don_vi varchar(10);

create table nhan_vien (
	ma_nhan_vien int primary key auto_increment,
    ho_ten varchar(45),
    ngay_sinh date,
    so_cmnd varchar(45),
    luong double,
    so_dien_thoai varchar(45),
    email varchar(45),
    dia_chi varchar(45),
    ma_vi_tri int,
    ma_trinh_do int,
    ma_bo_phan int,
	foreign key (ma_vi_tri) references vi_tri(ma_vi_tri),
    foreign key (ma_trinh_do) references trinh_do(ma_trinh_do),
    foreign key (ma_bo_phan) references bo_phan(ma_bo_phan)
);
create table khach_hang(
	ma_khach_hang int primary key auto_increment,
    ma_loai_khach int,
    ho_ten varchar(45),
    ngay_sinh date,
    goi_tinh bit(1),
    so_cmnd varchar(45),
    so_dien_thoai varchar(45),
    email varchar(45),
    dia_chi varchar(45),
    foreign key (ma_loai_khach) references loai_khach(ma_loai_khach)
);
create table hop_dong(
	ma_hop_dong int primary key auto_increment,
    ngay_lam_hop_dong datetime,
    ngay_ket_thuc datetime,
    tien_dat_coc double,
    ma_nhan_vien int,
    ma_khach_hang int,
    ma_dich_vu int,
    foreign key (ma_nhan_vien) references nhan_vien(ma_nhan_vien),
    foreign key (ma_khach_hang) references khach_hang(ma_khach_hang),
    foreign key (ma_dich_vu) references dich_vu(ma_dich_vu)
);
create table dich_vu(
	ma_dich_vu int primary key auto_increment,
    ten_dich_vu varchar(45),
    dien_tich int,
    chi_phi_thue double,
    so_nguoi_toi_da int,
    tieu_chuan_phong varchar(45),
    mo_ta_tien_nghi_khac varchar(45),
    dien_tich_ho_boi double,
    so_tang int,
    ma_kieu_thue int,
    ma_loai_dich_vu int,
    foreign key (ma_kieu_thue) references kieu_thue(ma_kieu_thue),
    foreign key (ma_loai_dich_vu) references loai_dich_vu(ma_loai_dich_vu)
);
create table hop_dong_chi_tiet(
	ma_hop_dong_chi_tiet int primary key auto_increment,
    so_luong int,
    ma_hop_dong int,
	ma_dich_vu_di_kem int,
    foreign key (ma_hop_dong) references hop_dong(ma_hop_dong),
    foreign key (ma_dich_vu_dikhach_hangkhach_hang_kem) references dich_vu_di_kem(ma_dich_vu_di_kem)
);

-- Thêm mới thông tin cho tất cả các bảng có trong CSDL để có thể thoả mãn các yêu cầu bên dưới.
insert into kieu_thue
values (1, 'Nam'), (2, 'Thang'), (3, 'Ngay'), (4, 'Gio');

insert into trinh_do
values (1, 'Trung cap'), (2, 'Cao dang'), (3, 'Dai hoc'), (4, 'Sau dai hoc');

insert into vi_tri 
values (1, 'Le tan'), (2, 'Phuc vu'), (3, 'Chuyen vien'), (4, 'Giam sat'), (5, 'Quan ly'), (6, 'Giam doc');

insert into bo_phan 
values (1, 'Sale - Marketing'), (2, 'Hanh chinh'), (3, 'Phuc vu'), (4, 'Quan ly');

insert into loai_khach 
values (1, 'Diamond'), (2, 'Platinium'), (3, 'Gold'), (4, 'Silver'), (5, 'Member');

insert into dich_vu_di_kem
values (1, 'Massage', 500, 'Cham soc', 'On'), (2, 'Karaoke', 200, 'Giai tri', 'On'), (3, 'Thuc an', 300, 'Cham soc', 'On'), 
(4, 'Thuc uong', 100, 'Cham soc', 'On'), (5, 'Xe di chuyen', 600, 'Tham quan', 'On');

insert into loai_dich_vu 
values (1, 'Nha hang - Khach san'), (2, 'Du lich'), (3, 'Giao thong cong cong'), (4, 'Bat dong san'), (5, 'Tai chinh - Ngang hang'), (6, 'Bao hiem'), (7, 'Giao duc');

insert into dich_vu
values (1, 'Villa', 1000, 7000, 17, 'Phong khach, phong ngu, san vuong, ho boi', '10d', 20, 3, 3, 1), 
(2, 'House', 500, 5000, 7, 'Phong khach, nhieu phong ngu, san vuong', '8d', null, 2, 3, 1), 
(3, 'Room', 50, 1000, 4, 'Phong ngu', '7d', null, 1, 3, 1);

insert into nhan_vien
values (1, 'Dinh Bao Dieu Khue', '2000-12-17', 0345675935, 12000, 0345675935, 'khuehaydoi@gmail.com', '54 Ton That Thiep', 5, 4, 4), 
(2, 'Phan Van Minh Hieu', '2002-12-31', 0934756548, 17000, 0934756548, 'hieuhaydo@gmail.com', '54 Ton That Thiep', 6, 4, 4);
insert into nhan_vien
values (3, 'Dinh Hoang Khai', '2003-2-21', 0917832315, 5000, 0917832315, 'khai@gmail,com', 'Da Nang', 2, 2, 3);

insert into khach_hang
values (1, 3, 'Nguyen Van A', '2021-11-17', 1, 0864297531, 0864297531, 'a@gmail.com', '000 Biet'),
(2, 4, 'Dinh Dieu B', '2000-11-17', 0, 0382612881, 0382612881, 'b@gmail.com', '000 Biet1'),
(3, 2, 'Phan Minh C', '2002-1-17', 1, 0292717274, 0292717274, 'c@gmail.com', '000 Biet2');
insert into khach_hang
values (4, 1, 'Dinh Hoang T', '1999-12-12', 1, 0982716384, 0982716384, 't@gmail.com', 'Da Nang'), 
(5, 1, 'Truong Cong C', '2003-5-3', 1, 0927561837, 0927561837, 'ccc@gmail.com', 'Da Nang');


insert into hop_dong
values (1, '2023-4-14', '2023-4-15', 500, 1, 1, 1), (2, '2023-4-14', '2023-4-15', 200, 1, 2, 3),
(3, '2023-4-14', '2023-4-15', 400, 1, 3, 2);
insert into hop_dong
values (4, '2023-4-16', '2023-4-17', 350, 1, 2, 2), (5, '2023-4-16', '2023-4-17', 350, 1, 5, 2), (6, '2023-4-16', '2023-4-17', 700, 1, 5, 1);

insert into hop_dong_chi_tiet
values (1, 1, 1, 1), (2, 1, 2, 4), (3, 1, 3, 2);
insert into hop_dong_chi_tiet
values (4, 2, 4, 4), (5, 2, 5, 2), (6, 3, 6, 1);

-- Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là 
-- một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.
select * from nhan_vien
where (ho_ten like "D%" or ho_ten like "H%" or ho_ten like "T%" or ho_ten like "K%") and length(ho_ten) <= 15;

-- Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và
-- có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
select * from khach_hang 
where (2023 - year(ngay_sinh) >= 18 or 2023 - year(ngay_sinh) <= 50) and (dia_chi = 'Da Nang' or 'Quang Tri');

-- Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu
-- lần. Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của
-- khách hàng. Chỉ đếm những khách hàng nào có Tên loại khách hàng là
-- “Diamond”.
select hd.ma_khach_hang, kh.ho_ten, count(hd.ma_khach_hang) as order_time from khach_hang as kh right join hop_dong as hd
on kh.ma_khach_hang = hd.ma_khach_hang
where kh.ma_loai_khach = 1
group by hd.ma_khach_hang
order by order_time desc;

-- Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong,
-- ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien (Với
-- tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng *
-- Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem,
-- hop_dong_chi_tiet) cho tất cả các khách hàng đã từng đặt phòng. (những
-- khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
delimiter //
create function money_total(chi_phi_thue int, so_luong int, gia double)
returns int
READS SQL DATA
DETERMINISTIC
begin
	DECLARE money_total INT DEFAULT 0;
    select chi_phi_thue + so_luong * gia into money_total;
    return money_total;
end //
delimiter ;

select kh.ma_khach_hang, kh.ho_ten, lk.ten_loai_khach, hd.ma_hop_dong, dv.ten_dich_vu, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, 
money_total(dv.chi_phi_thue, hdct.so_luong, dvdk.gia) as money_total from khach_hang as kh 
inner join loai_khach as lk on kh.ma_loai_khach = lk.ma_loai_khach 
left join hop_dong as hd on kh.ma_khach_hang = hd.ma_khach_hang
left join dich_vu as dv on dv.ma_dich_vu = hd.ma_dich_vu
left join hop_dong_chi_tiet as hdct on hdct.ma_hop_dong = hd.ma_hop_dong
left join dich_vu_di_kem as dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem;

-- Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue,
-- ten_loai_dich_vu của tất cả các loại dịch vụ chưa từng được khách hàng
-- thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).
select dv.ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu, hd.ngay_lam_hop_dong from dich_vu as dv 
left join loai_dich_vu as ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu 
left join hop_dong as hd on hd.ma_dich_vu = dv.ma_dich_vu
where dv.ma_dich_vu is null 
and month(ngay_lam_hop_dong) = 4;


