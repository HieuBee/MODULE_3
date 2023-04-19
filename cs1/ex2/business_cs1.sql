create database business;
use business;
CREATE TABLE vat_tu
	(
		MaVT INT PRIMARY KEY AUTO_INCREMENT,
        TenVT VARCHAR(50)
	);
    
CREATE TABLE phieu_xuat
	(
		SoPX INT PRIMARY KEY AUTO_INCREMENT,
        NgayXuat DATE
    );
    
CREATE TABLE phieu_nhap
	(
		SoPN INT PRIMARY KEY AUTO_INCREMENT,
        NgayNhap DATE
    );
    
CREATE TABLE chi_tiet_phieu_xuat
	(
		SoPX INT,
        MaVT INT,
		FOREIGN KEY (SoPX) REFERENCES phieu_xuat(SoPX),
        FOREIGN KEY (MaVT) REFERENCES vat_tu(MaVT),
        CONSTRAINT PRIMARY KEY(SoPX, MaVT),
        DGXuat INT,
        SLXuat INT
    );
    
CREATE TABLE chi_tiet_phieu_nhap
	(
		SoPN INT,
        MaVT INT,
		FOREIGN KEY (SoPN) REFERENCES phieu_nhap(SoPN),
        FOREIGN KEY (MaVT) REFERENCES vat_tu(MaVT),
        CONSTRAINT PRIMARY KEY(SoPN, MaVT),
        DGNhap INT,
        SLNhap INT
    );
    
CREATE TABLE nha_cung_cap
	(
		MaNCC INT PRIMARY KEY AUTO_INCREMENT,
        TenNCC VARCHAR(50),
        DiaChi TEXT
    );
    
CREATE TABLE so_dien_thoai
	(
		SDT VARCHAR(12) PRIMARY KEY,
        MaNCC INT,
        FOREIGN KEY (MaNCC) REFERENCES nha_cung_cap(MaNCC)
    );
    
CREATE TABLE don_dat_hang
		(
			SoDH INT PRIMARY KEY AUTO_INCREMENT,
            MaNCC INT,
            FOREIGN KEY (MaNCC) REFERENCES nha_cung_cap(MaNCC),
            NgayDH DATE
        );
    
CREATE TABLE chi_tiet_don_dat_hang
	(
		MaVT INT,
        SoDH INT,
        FOREIGN KEY (MaVT) REFERENCES vat_tu(MaVT),
        FOREIGN KEY (SoDH) REFERENCES don_dat_hang(SoDH),
        CONSTRAINT PRIMARY KEY(MaVT, SoDH)
    );