create database ShopBanAoQuan
go
use ShopBanAoQuan
go

CREATE TABLE Account
(
	ID int identity primary key,
	username nvarchar(50),
	pass nvarchar(50),
	position nvarchar(20)
)
GO

CREATE TABLE DiaChiNhanHang
(
	Madiachi INT primary key,
	TenDiaChi nvarchar(200)
)
GO

CREATE TABLE NguoiDung
(
	ID INT references Account(ID),
	CCCD varchar(20) primary key,
	Hoten nvarchar(50),
	Gioitinh nvarchar(50),
	SDT varchar(12),
	NgaySinh date,
	Madiachi int references DiaChiNhanHang(Madiachi),
	email varchar(50)
)
GO

-- Bảng Danh mục sản phẩm
CREATE TABLE DanhMucSanPham (
    MaDanhMuc INT PRIMARY KEY,
    TenDanhMuc NVARCHAR(255) NOT NULL
);
GO

-- Bảng Sản phẩm
CREATE TABLE SanPham (
    MaSanPham INT PRIMARY KEY,
    TenSanPham NVARCHAR(255) NOT NULL,
    MoTa NVARCHAR(MAX),
	GiaBanDau int NOT NULL,
    GiamGia int,
	SoLuong INT DEFAULT 0,
    MaDanhMuc INT,
    FOREIGN KEY (MaDanhMuc) REFERENCES DanhMucSanPham(MaDanhMuc),	
);
GO
-- Bảng Kích cỡ
CREATE TABLE KichCo (
    MaKichCo INT,
	MaSanPham int REFERENCES SanPham(MaSanPham),
    TenKichCo NVARCHAR(50) NOT NULL,
	PRIMARY KEY (MaKichCo, MaSanPham)
);
GO

-- Bảng Màu sắc
CREATE TABLE MauSac (
    MaMau INT,
	MaSanPham int REFERENCES SanPham(MaSanPham),
    TenMau NVARCHAR(50) NOT NULL
	PRIMARY KEY (MaMau, MaSanPham)
);
GO

-- Bảng Hình ảnh sản phẩm
CREATE TABLE HinhAnhSanPham (
    MaHinhAnh INT PRIMARY KEY,
    MaSanPham INT NOT NULL,
    DuongDanHinh NVARCHAR(255) NOT NULL,
    MoTaHinh NVARCHAR(255),
    FOREIGN KEY (MaSanPham) REFERENCES SanPham(MaSanPham)
);
GO

CREATE TABLE GioHang
(
    IDNguoiMua INT REFERENCES Account(ID),
    MaSanPham INT REFERENCES SanPham(MaSanPham),
    MaKichCo INT,
    MaMau INT,
    SoLuong INT,
    PRIMARY KEY (IDNguoiMua, MaSanPham, MaKichCo, MaMau),
    FOREIGN KEY (MaKichCo, MaSanPham) REFERENCES KichCo(MaKichCo, MaSanPham),
    FOREIGN KEY (MaMau, MaSanPham) REFERENCES MauSac(MaMau, MaSanPham)
);
GO



INSERT INTO Account (username, pass, position) VALUES 
(N'admin', N'123', N'admin'),
(N'duy', N'1', N'user'),
(N'lam', N'1', N'user'),
(N'luan', N'1', N'user');
GO

INSERT INTO DiaChiNhanHang (Madiachi, TenDiaChi)
VALUES 
(1, N'123 Đường Lê Lợi, Quận 1, TP. HCM'),
(2, N'456 Đường Hai Bà Trưng, Quận 3, TP. HCM'),
(3, N'789 Đường Nguyễn Huệ, Quận 1, TP. HCM');
GO

INSERT INTO NguoiDung (ID, CCCD, Hoten, Gioitinh, SDT, NgaySinh, Madiachi, email)
VALUES 
(2, '123456789012', N'Phạm Ngọc Duy', N'Nam', '0794821201', '2004-10-17', 1, 'duy@gmail.com'),
(3, '234567890123', N'Nguyễn Hữu Ngọc Lam', N'Nam', '0912345678', '2004-10-22', 2, 'lam@gmail.com'),
(4, '345678901234', N'Nguyễn Văn Luân', N'Nam', '0923456789', '2004-08-30', 3, 'luan@gmail.com');
GO

INSERT INTO DanhMucSanPham (MaDanhMuc, TenDanhMuc) VALUES 
(1, N'Áo thun'),
(2, N'Áo sơ mi'),
(3, N'Quần jeans'),
(4, N'Quần short'),
(5, N'Đầm'),
(6, N'Váy'),
(7, N'Áo khoác'),
(8, N'Phụ kiện'),
(9, N'Giày dép'),
(10, N'Túi xách');
GO

INSERT INTO SanPham (MaSanPham, TenSanPham, MoTa, GiaBanDau, GiamGia, SoLuong, MaDanhMuc) VALUES 
(1, N'Áo thun nam trắng', N'Áo thun nam chất liệu cotton', 300000, 30, 100, 1),
(2, N'Áo sơ mi nữ caro', N'Áo sơ mi nữ họa tiết caro', 400000, 20, 50, 2),
(3, N'Quần jeans nam đen', N'Quần jeans nam phong cách trẻ trung', 600000, 40, 80, 3),
(4, N'Quần short nữ', N'Quần short nữ mát mẻ cho mùa hè', 500000, 10, 60, 4),
(5, N'Đầm dạ hội', N'Đầm dạ hội thanh lịch', 1000000, 10, 20, 5),
(6, N'Váy xếp ly', N'Váy xếp ly phong cách Hàn Quốc', 700000, 30, 30, 6),
(7, N'Áo khoác hoodie', N'Áo khoác hoodie ấm áp', 600000, 25, 45, 7),
(8, N'Khăn choàng cổ', N'Khăn choàng cổ mùa đông', 300000, 15, 70, 8),
(9, N'Giày sneaker', N'Giày sneaker cho mọi hoạt động', 600000, 50, 40, 9),
(10, N'Túi xách da', N'Túi xách da cao cấp', 1200000, 60, 25, 10);
GO

INSERT INTO KichCo (MaKichCo, MaSanPham, TenKichCo) VALUES 
-- Áo sơ mi nữ caro
(1, 2, N'S'),
(2, 2, N'M'),
(3, 2, N'L'),
(4, 2, N'XL'),

-- Quần jeans nam đen
(1, 3, N'28'),
(2, 3, N'30'),
(3, 3, N'32'),
(4, 3, N'34'),

-- Quần short nữ
(1, 4, N'S'),
(2, 4, N'M'),
(3, 4, N'L'),

-- Đầm dạ hội
(1, 5, N'S'),
(2, 5, N'M'),
(3, 5, N'L'),
(4, 5, N'XL'),

-- Váy xếp ly
(1, 6, N'S'),
(2, 6, N'M'),
(3, 6, N'L'),

-- Áo khoác hoodie
(1, 7, N'S'),
(2, 7, N'M'),
(3, 7, N'L'),
(4, 7, N'XL'),

-- Khăn choàng cổ (Free size)
(1, 8, N'Free Size'),

-- Giày sneaker
(1, 9, N'36'),
(2, 9, N'38'),
(3, 9, N'40'),
(4, 9, N'42'),

-- Túi xách da (Free size)
(1, 10, N'Free Size');
GO

INSERT INTO MauSac (MaMau, MaSanPham, TenMau) VALUES 
-- Áo sơ mi nữ caro
(1, 2, N'Trắng'),
(2, 2, N'Xanh'),
(3, 2, N'Đen'),

-- Quần jeans nam đen
(1, 3, N'Đen'),
(2, 3, N'Xám'),

-- Quần short nữ
(1, 4, N'Xanh'),
(2, 4, N'Đỏ'),
(3, 4, N'Xám'),

-- Đầm dạ hội
(1, 5, N'Đỏ'),
(2, 5, N'Tím'),
(3, 5, N'Hồng'),

-- Váy xếp ly
(1, 6, N'Hồng'),
(2, 6, N'Xanh'),
(3, 6, N'Vàng'),

-- Áo khoác hoodie
(1, 7, N'Xám'),
(2, 7, N'Đen'),
(3, 7, N'Xanh lá'),

-- Khăn choàng cổ
(1, 8, N'Nâu'),
(2, 8, N'Xám'),
(3, 8, N'Xanh lá'),

-- Giày sneaker
(1, 9, N'Trắng'),
(2, 9, N'Xanh'),
(3, 9, N'Đen'),

-- Túi xách da
(1, 10, N'Nâu'),
(2, 10, N'Đen');
GO



INSERT INTO HinhAnhSanPham (MaHinhAnh, MaSanPham, DuongDanHinh, MoTaHinh) VALUES 
(1, 1, N'https://dbros.vn/wp-content/uploads/2023/08/ao-thun-trang-nam-T102.jpg', N'Hình 1 của Áo thun nam trắng'),
(2, 1, N'https://cdn0375.cdn4s.com/media/ad1-t222n/z3247472567912_31a535fcadd237b49941a4610368c329.jpg', N'Hình 2 của Áo thun nam trắng'),
(3, 2, N'https://cdn.kkfashion.vn/28393-large_default/ao-kieu-nu-co-so-mi-hoa-tiet-caro-asm16-18.jpg', N'Hình 1 của Áo sơ mi nữ caro'),
(4, 3, N'https://quanjeandep.com/images/thumbs/quan-jean-nam-dang-slim-fit-mau-den-tuyen-10930.jpeg', N'Hình 1 của Quần jeans nam đen'),
(5, 4, N'https://namandco.com/wp-content/uploads/2022/06/1-2-scaled.jpg', N'Hình 1 của Quần short nữ'),
(6, 5, N'https://maxi.vn/wp-content/uploads/2022/08/z3630250901829_582cbfc8a4ea5ddbb063bd8b2ec6903e-scaled.jpg', N'Hình 1 của Đầm dạ hội'),
(7, 6, N'https://cdn.becungshop.vn/images/500x500/chan-vay-xep-ly-nang-dong-cho-be-gai-p25311db1d3782-500x500.jpg', N'Hình 1 của Váy xếp ly'),
(8, 7, N'https://product.hstatic.net/1000184601/product/men_den__15__669f0dc4501c4dc7ae42d74af851ca44_master.jpg', N'Hình 1 của Áo khoác hoodie'),
(9, 8, N'https://zerdio.com.vn/wp-content/uploads/2023/10/Khan-Quang-Choang-Co-Nu-Woodonble-KN012.jpg', N'Hình 1 của Khăn choàng cổ'),
(10, 9, N'https://cdn.vortexs.io/api/images/57594672-cf3f-4d37-8678-4cd0ceefb19d/1920/w/giay-mlb-chunky-liner-basic-la-white-navy-3asxclb3n-07nyd.jpeg', N'Hình 1 của Giày sneaker'),
(11, 10, N'https://product.hstatic.net/1000397717/product/o1cn01cink2i2563qi0gpbo___2214434137476-0-cib_0007fb5a30ce416ca110bbf8c95fd828_master.jpg', N'Hình 1 túi xách da');
GO


-- PROCEDURE GioHang
CREATE PROCEDURE proc_ThemGioHang @ID int, @MaSP int, @MaKichCo int, @MaMau int, @SoLuong int
AS
BEGIN
	INSERT INTO GioHang(IDNguoiMua, MaSanPham, MaKichCo, MaMau, SoLuong)
    VALUES (@ID, @MaSP, @MaKichCo, @MaMau, @SoLuong);
END;
GO

CREATE PROCEDURE proc_CapNhatGioHang @ID int, @MaSP int, @MaKichCo int, @MaMau int, @SoLuong int
AS
BEGIN	
    UPDATE GioHang
    SET SoLuong = SoLuong + @SoLuong
    WHERE IDNguoiMua = @ID 
        AND MaSanPham = @MaSP 
        AND MaKichCo = @MaKichCo 
        AND MaMau = @MaMau;
END;
GO

CREATE PROCEDURE proc_XoaGioHang @MaSP int, @MaKichCo int, @MaMau int
AS
BEGIN
	DELETE GioHang WHERE MaSanPham = @MaSP and MaKichCo = @MaKichCo and MaMau = @MaMau;
END;
GO

CREATE PROCEDURE proc_DanhSachGioHang @IDNguoiMua int
AS
BEGIN
	select Q.*, TenMau, TenKichCo
	from
		(select SanPham.MaSanPham as maSP, TenSanPham, SanPham.SoLuong as SoLuongSP, GioHang.SoLuong as SoLuongGH, GiaBanDau, GiaBanDau - GiaBanDau*(GiamGia/100.0) as GiaHienTai, DuongDanHinh, MaKichCo, MaMau, IDNguoiMua
		from SanPham, HinhAnhSanPham, GioHang
		where SanPham.MaSanPham = HinhAnhSanPham.MaSanPham and SanPham.MaSanPham = GioHang.MaSanPham and GioHang.IDNguoiMua = @IDNguoiMua) Q,
		MauSac, 
		KichCo
	where Q.maSP = MauSac.MaSanPham and MauSac.MaSanPham = KichCo.MaSanPham and Q.MaKichCo = KichCo.MaKichCo and Q.MaMau = MauSac.MaMau
END;
GO
