--DROP database IF Exists ShopBanAoQuan
--GO

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

CREATE TABLE NguoiDung
(
	ID INT references Account(ID),
	CCCD varchar(20) primary key,
	Hoten nvarchar(50),
	Gioitinh nvarchar(50),
	SDT varchar(12),
	NgaySinh date,
--	Madiachi int references DiaChiNhanHang(Madiachi),
	email varchar(50)
)
GO

CREATE TABLE DiaChiNhanHang
(
	Madiachi INT,
	IDNguoiDung INT references Account(ID),
	TenDiaChi nvarchar(200),
	primary key(Madiachi, IDNguoiDung)
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
	NgayTao date,
	XuatXu nvarchar(50) NULL,
	ChatLieu nvarchar(50) NULL,
	DaBan INT DEFAULT 0,
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
    TenMau NVARCHAR(50) NOT NULL,
	MaMauDangHex VARCHAR(20) NULL 
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

CREATE TABLE HoaDon
(
	MaHoaDon INT PRIMARY KEY IDENTITY,
    IDNguoiMua INT REFERENCES Account(ID),
    NgayTao DATE DEFAULT GETDATE(),
    TongTien INT,
	diachi NVARCHAR(255),
    TrangThai NVARCHAR(50) DEFAULT N'Chờ xác nhận'
)
GO

CREATE TABLE ChiTietHoaDon
(
	MaChiTiet INT PRIMARY KEY IDENTITY,
    MaHoaDon INT REFERENCES HoaDon(MaHoaDon),
    MaSanPham INT REFERENCES SanPham(MaSanPham),
    MaKichCo INT,
    MaMau INT,
    SoLuong INT,
    GiaBan INT,
    FOREIGN KEY (MaKichCo, MaSanPham) REFERENCES KichCo(MaKichCo, MaSanPham),
    FOREIGN KEY (MaMau, MaSanPham) REFERENCES MauSac(MaMau, MaSanPham)
)
GO

-- Bảng đánh giá
CREATE TABLE DanhGia
(
	IDNguoiMua INT REFERENCES Account(ID),
    MaSanPham INT REFERENCES SanPham(MaSanPham),
	MaChiTiet INT REFERENCES ChiTietHoaDon(MaChiTiet),
	BinhLuan nvarchar(max) NULL,
	SoSao int NULL,
	ngayDanhGia DATE,
	TrangThaiDanhGia NVARCHAR(50) DEFAULT N'Chưa đánh giá'
	PRIMARY KEY (IDNguoiMua, MaSanPham, MaChiTiet)
)
GO

INSERT INTO Account (username, pass, position) VALUES 
(N'admin', N'123', N'admin'),
(N'duy', N'1', N'user'),
(N'lam', N'1', N'user'),
(N'luan', N'1', N'user');
GO

INSERT INTO DiaChiNhanHang (Madiachi, IDNguoiDung, TenDiaChi)
VALUES 
(1, 2, N'123 Đường Lê Lợi, Quận 1, TP. HCM'),
(2, 2, N'456 Đường Hai Bà Trưng, Quận 3, TP. HCM'),
(3, 2, N'789 Đường Nguyễn Huệ, Quận 1, TP. HCM'),
(4, 3, N'Đường Thống Nhất, Quận 1, TP. HCM'),
(5, 4, N'Đường Phạm Văn Đồng, Quận Thủ Đức, TP. HCM');
GO

INSERT INTO NguoiDung (ID, CCCD, Hoten, Gioitinh, SDT, NgaySinh, email)
VALUES 
(2, '123456789012', N'Phạm Ngọc Duy', N'Nam', '0794821201', '2004-10-17', 'duy@gmail.com'),
(3, '234567890123', N'Nguyễn Hữu Ngọc Lam', N'Nam', '0912345678', '2004-10-22', 'lam@gmail.com'),
(4, '345678901234', N'Nguyễn Văn Luân', N'Nam', '0923456789', '2004-08-30', 'luan@gmail.com');
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

/*INSERT INTO SanPham (MaSanPham, TenSanPham, MoTa, GiaBanDau, GiamGia, SoLuong, MaDanhMuc) VALUES 
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
GO*/

INSERT INTO SanPham (MaSanPham, TenSanPham, MoTa, GiaBanDau, GiamGia, SoLuong, MaDanhMuc, NgayTao, XuatXu, ChatLieu) 
VALUES 
(1, N'Áo thun nam trắng', N'Áo thun nam chất liệu cotton', 300000, 30, 100, 1, '2024-01-01', N'Việt Nam', N'Cotton'),
(2, N'Áo sơ mi nữ caro', N'Áo sơ mi nữ họa tiết caro', 400000, 20, 50, 2, '2024-01-05', N'Việt Nam', N'Polyester'),
(3, N'Quần jeans nam đen', N'Quần jeans nam phong cách trẻ trung', 600000, 40, 80, 3, '2024-01-10', N'Mỹ', N'Denim'),
(4, N'Quần short nữ', N'Quần short nữ mát mẻ cho mùa hè', 500000, 10, 60, 4, '2024-01-15', N'Trung Quốc', N'Vải thun'),
(5, N'Đầm dạ hội', N'Đầm dạ hội thanh lịch', 1000000, 10, 20, 5, '2024-01-20', N'Pháp', N'Lụa'),
(6, N'Váy xếp ly', N'Váy xếp ly phong cách Hàn Quốc', 700000, 30, 30, 6, '2024-01-25', N'Hàn Quốc', N'Polyester'),
(7, N'Áo khoác hoodie', N'Áo khoác hoodie ấm áp', 600000, 25, 45, 7, '2024-01-30', N'Việt Nam', N'Vải nỉ'),
(8, N'Khăn choàng cổ', N'Khăn choàng cổ mùa đông', 300000, 15, 70, 8, '2024-02-01', N'Ấn Độ', N'Len'),
(9, N'Giày sneaker', N'Giày sneaker cho mọi hoạt động', 600000, 50, 40, 9, '2024-02-05', N'Italia', N'Da'),
(10, N'Túi xách da', N'Túi xách da cao cấp', 1200000, 60, 25, 10, '2024-02-10', N'Pháp', N'Da thật');
GO

INSERT INTO KichCo (MaKichCo, MaSanPham, TenKichCo) VALUES 
(1, 1, N'S'),
(2, 1, N'M'),
(3, 1, N'L'),
(4, 1, N'XL'),
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

INSERT INTO MauSac (MaMau, MaSanPham, TenMau, MaMauDangHex) VALUES 
-- Áo thun trắng
(1, 1, N'Trắng', '#FFFFFF'),

-- Áo sơ mi nữ caro
(1, 2, N'Trắng', '#FFFFFF'),
(2, 2, N'Xanh', '#0000FF'),
(3, 2, N'Đen', '#000000'),

-- Quần jeans nam đen
(1, 3, N'Đen', '#000000'),
(2, 3, N'Xám', '#808080'),

-- Quần short nữ
(1, 4, N'Xanh', '#0000FF'),
(2, 4, N'Đỏ', '#FF0000'),
(3, 4, N'Xám', '#808080'),

-- Đầm dạ hội
(1, 5, N'Đỏ', '#FF0000'),
(2, 5, N'Tím', '#800080'),
(3, 5, N'Hồng', '#FFC0CB'),

-- Váy xếp ly
(1, 6, N'Hồng', '#FFC0CB'),
(2, 6, N'Xanh', '#0000FF'),
(3, 6, N'Vàng', '#FFFF00'),

-- Áo khoác hoodie
(1, 7, N'Xám', '#808080'),
(2, 7, N'Đen', '#000000'),
(3, 7, N'Xanh lá', '#008000'),

-- Khăn choàng cổ
(1, 8, N'Nâu', '#A52A2A'),
(2, 8, N'Xám', '#808080'),
(3, 8, N'Xanh lá', '#008000'),

-- Giày sneaker
(1, 9, N'Trắng', '#FFFFFF'),
(2, 9, N'Xanh', '#0000FF'),
(3, 9, N'Đen', '#000000'),

-- Túi xách da
(1, 10, N'Nâu', '#A52A2A'),
(2, 10, N'Đen', '#000000');
GO



INSERT INTO HinhAnhSanPham (MaHinhAnh, MaSanPham, DuongDanHinh, MoTaHinh) VALUES 
(1, 1, N'https://cdn0375.cdn4s.com/media/ad1-t222n/z3247472567912_31a535fcadd237b49941a4610368c329.jpg', N'Hình 1 của Áo thun nam trắng'),
(2, 2, N'https://cdn.kkfashion.vn/28393-large_default/ao-kieu-nu-co-so-mi-hoa-tiet-caro-asm16-18.jpg', N'Hình 1 của Áo sơ mi nữ caro'),
(3, 3, N'https://quanjeandep.com/images/thumbs/quan-jean-nam-dang-slim-fit-mau-den-tuyen-10930.jpeg', N'Hình 1 của Quần jeans nam đen'),
(4, 4, N'https://namandco.com/wp-content/uploads/2022/06/1-2-scaled.jpg', N'Hình 1 của Quần short nữ'),
(5, 5, N'https://maxi.vn/wp-content/uploads/2022/08/z3630250901829_582cbfc8a4ea5ddbb063bd8b2ec6903e-scaled.jpg', N'Hình 1 của Đầm dạ hội'),
(6, 6, N'https://cdn.becungshop.vn/images/500x500/chan-vay-xep-ly-nang-dong-cho-be-gai-p25311db1d3782-500x500.jpg', N'Hình 1 của Váy xếp ly'),
(7, 7, N'https://product.hstatic.net/1000184601/product/men_den__15__669f0dc4501c4dc7ae42d74af851ca44_master.jpg', N'Hình 1 của Áo khoác hoodie'),
(8, 8, N'https://zerdio.com.vn/wp-content/uploads/2023/10/Khan-Quang-Choang-Co-Nu-Woodonble-KN012.jpg', N'Hình 1 của Khăn choàng cổ'),
(9, 9, N'https://cdn.vortexs.io/api/images/57594672-cf3f-4d37-8678-4cd0ceefb19d/1920/w/giay-mlb-chunky-liner-basic-la-white-navy-3asxclb3n-07nyd.jpeg', N'Hình 1 của Giày sneaker'),
(10, 10, N'https://product.hstatic.net/1000397717/product/o1cn01cink2i2563qi0gpbo___2214434137476-0-cib_0007fb5a30ce416ca110bbf8c95fd828_master.jpg', N'Hình 1 túi xách da');
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

CREATE PROCEDURE proc_DanhSachGioHang 
    @IDNguoiMua INT,
    @MaSP INT,
    @MaKichCo INT,
    @MaMau INT
AS
BEGIN
    SELECT Q.*, TenMau, TenKichCo
    FROM
        (
            SELECT 
                SanPham.MaSanPham AS maSP, 
                TenSanPham, 
                SanPham.SoLuong AS SoLuongSP, 
                GioHang.SoLuong AS SoLuongGH, 
                GiaBanDau, 
                GiaBanDau - GiaBanDau * (GiamGia / 100.0) AS GiaHienTai, 
                DuongDanHinh, 
                MaKichCo, 
                MaMau, 
                IDNguoiMua
            FROM 
                SanPham
            INNER JOIN 
                HinhAnhSanPham ON SanPham.MaSanPham = HinhAnhSanPham.MaSanPham
            INNER JOIN 
                GioHang ON SanPham.MaSanPham = GioHang.MaSanPham
            WHERE 
                GioHang.IDNguoiMua = @IDNguoiMua
        ) Q
    INNER JOIN 
        MauSac ON Q.maSP = MauSac.MaSanPham AND Q.MaMau = MauSac.MaMau
    INNER JOIN 
        KichCo ON MauSac.MaSanPham = KichCo.MaSanPham AND Q.MaKichCo = KichCo.MaKichCo
    WHERE 
        (@MaSP=0 OR Q.maSP = @MaSP) AND (@MaSP=0 OR Q.MaMau = @MaMau) AND (@MaSP=0 OR Q.MaKichCo = @MaKichCo);
END;
GO

CREATE PROCEDURE proc_layThongTinSPThanhToan @maSP int, @maKichCo int, @maMau int
AS
BEGIN
	select SanPham.MaSanPham as maSP, TenSanPham, GiaBanDau, SoLuong, GiaBanDau - GiaBanDau*(GiamGia/100.0) as GiaHienTai, MaHinhAnh, DuongDanHinh, MaKichCo, TenKichCo, MaMau, TenMau
	from SanPham, HinhAnhSanPham, KichCo, MauSac
	where SanPham.MaSanPham = HinhAnhSanPham.MaSanPham and KichCo.MaSanPham = SanPham.MaSanPham and MauSac.MaSanPham = SanPham.MaSanPham and KichCo.MaKichCo = @maKichCo and MauSac.MaMau = @maMau and SanPham.MaSanPham = @maSP
END;
GO
-- Đặt hàng

CREATE PROCEDURE proc_ThemHoaDon @IDNguoiMua INT, @TongTienHoaDon int, @diachi NVARCHAR(255), @MaHoaDon INT OUTPUT
AS
BEGIN
	INSERT INTO HoaDon(IDNguoiMua, TongTien, diachi)
	VALUES (@IDNguoiMua, @TongTienHoaDon, @diachi);

	SET @MaHoaDon = SCOPE_IDENTITY();
END;
GO

CREATE PROCEDURE proc_ThemChiTietHoaDon  @ID INT, @MaHoaDon INT, @TongTiennTungSP int, @SoLuongSPMua int, @MaSanPham INT, @MaKichCo INT, @MaMau INT
AS
BEGIN
	INSERT INTO ChiTietHoaDon (MaHoaDon, MaSanPham, MaKichCo, MaMau, SoLuong, GiaBan)
	VALUES (@MaHoaDon, @MaSanPham, @MaKichCo, @MaMau, @SoLuongSPMua, @TongTiennTungSP);

	-- Cập nhật lại số lượng sản phẩm trong kho
	UPDATE SanPham
	SET SoLuong = SoLuong - @SoLuongSPMua
	WHERE MaSanPham = @MaSanPham;

	-- Nếu cần có xử lý khi số lượng kho không đủ
	IF (SELECT SoLuong FROM SanPham WHERE MaSanPham = @MaSanPham) < 0
	BEGIN
		RAISERROR('Số lượng sản phẩm trong kho không đủ!', 16, 1);
		ROLLBACK TRANSACTION;
	END
		-- Xóa sản phẩm đã thanh toán khỏi giỏ hàng
    DELETE FROM GioHang
    WHERE MaSanPham = @MaSanPham 
        AND MaKichCo = @MaKichCo 
        AND MaMau = @MaMau and IDNguoiMua = @ID;
END;
GO

create view V_thongTinSP
as
	select sp.MaSanPham as maSP, TenSanPham, MoTa, GiaBanDau, GiamGia, SoLuong, NgayTao, XuatXu, ChatLieu, DaBan, sp.MaDanhMuc as maDanhMuc, TenDanhMuc, MaHinhAnh, DuongDanHinh
	from SanPham as sp, HinhAnhSanPham as img, DanhMucSanPham
	where sp.MaSanPham = img.MaSanPham and sp.MaDanhMuc = DanhMucSanPham.MaDanhMuc
GO

CREATE FUNCTION fn_TimKiemSP (@SearchText NVARCHAR(100))
RETURNS TABLE
AS
RETURN
(
    select *
	from V_thongTinSP 
	where CAST(maSP AS NVARCHAR(100)) LIKE '%' + @SearchText + '%' OR TenSanPham LIKE '%' + @SearchText + '%'
);
GO

-- sửa thêm mã chi tiết để làm đánh giá
CREATE PROCEDURE proc_LoadThongTinDonHang (@IDNguoiMua INT, @TrangThai NVARCHAR(50))
AS
BEGIN
	select Q.*, TenKichCo, TenMau
	from KichCo, MauSac,
	(select ChiTietHoaDon.MaChiTiet as maChiTiet, HoaDon.MaHoaDon as maHoaDon, HoaDon.NgayTao as ngayDat, TongTien, diachi, ChiTietHoaDon.SoLuong as SoLuongDaMua, TrangThai, ChiTietHoaDon.MaSanPham as maSP, TenSanPham, GiaBanDau, SanPham.SoLuong as SoLuongSP, GiaBanDau - GiaBanDau*(GiamGia/100.0) as DonGia, GiaBan, MaHinhAnh, DuongDanHinh, MaMau, MaKichCo
	from HoaDon inner join ChiTietHoaDon on HoaDon.MaHoaDon = ChiTietHoaDon.MaHoaDon, SanPham, HinhAnhSanPham
	where SanPham.MaSanPham = ChiTietHoaDon.MaSanPham and ChiTietHoaDon.MaSanPham = HinhAnhSanPham.MaSanPham and IDNguoiMua = @IDNguoiMua
	) Q
	where Q.MaKichCo = KichCo.MaKichCo and Q.MaMau = MauSac.MaMau and KichCo.MaSanPham = Q.maSP and MauSac.MaSanPham = Q.maSP and TrangThai = @TrangThai
	ORDER BY Q.ngayDat DESC
END;
GO

CREATE procedure proc_ThongTinNguoiDung_HoaDon (@ID INT, @maHD INT)
AS
BEGIN

    select HoTen, SDT, email, DiaChi
	from NguoiDung, HoaDon
	where NguoiDung.ID = HoaDon.IDNguoiMua and HoaDon.IDNguoiMua = @ID and MaHoaDon = @maHD
END;
GO

-- sửa thêm mã chi tiết để làm đánh giá
CREATE PROCEDURE proc_LoadThongTinMotDonHang (@IDNguoiMua INT, @maHD INT)
AS
BEGIN
	select Q.*, TenKichCo, TenMau
	from KichCo, MauSac,
	(select ChiTietHoaDon.MaChiTiet as maChiTiet, HoaDon.MaHoaDon as maHoaDon, HoaDon.NgayTao as ngayDat, TongTien, diachi, ChiTietHoaDon.SoLuong as SoLuongDaMua, TrangThai, ChiTietHoaDon.MaSanPham as maSP, TenSanPham, GiaBanDau, SanPham.SoLuong as SoLuongSP, GiaBanDau - GiaBanDau*(GiamGia/100.0) as DonGia, GiaBan, MaHinhAnh, DuongDanHinh, MaMau, MaKichCo
	from HoaDon inner join ChiTietHoaDon on HoaDon.MaHoaDon = ChiTietHoaDon.MaHoaDon, SanPham, HinhAnhSanPham
	where SanPham.MaSanPham = ChiTietHoaDon.MaSanPham and ChiTietHoaDon.MaSanPham = HinhAnhSanPham.MaSanPham and IDNguoiMua = @IDNguoiMua
	) Q
	where Q.MaKichCo = KichCo.MaKichCo and Q.MaMau = MauSac.MaMau and KichCo.MaSanPham = Q.maSP and MauSac.MaSanPham = Q.maSP and maHoaDon = @maHD
END;
GO

CREATE PROCEDURE proc_suaThongTin
	@username nvarchar(50),
    @pass nvarchar(50),
    @Hoten nvarchar(50),
    @NgaySinh date,
    @Gioitinh nvarchar(50),
    @SDT varchar(12),
    @email varchar(50),
	@IDNguoiDung INT
AS
BEGIN
    UPDATE NguoiDung
	SET Hoten = @Hoten, GioiTinh = @GioiTinh, NgaySinh = @NgaySinh,
		SDT = @SDT, email = @Email
	WHERE ID = @IDNguoiDung;

	UPDATE Account
	SET pass = @pass
	where ID = @IDNguoiDung;
END;
GO

-- Lam
CREATE FUNCTION fn_ThongKeSanPham()
RETURNS TABLE
AS
RETURN
(
    SELECT 
        SUM(DaBan) AS TongSanPhamDaBan,
        SUM(SoLuong - DaBan) AS TongSanPhamTonKho
    FROM SanPham
);
GO

CREATE FUNCTION fn_LietKeSanPhamBanChay
(
    @year INT
)
RETURNS TABLE
AS
RETURN
(
    SELECT TOP 5
        SP.MaSanPham,
        SP.TenSanPham,
        SUM(CT.SoLuong) AS TongSoLuongBan
    FROM
        HoaDon HD
    JOIN
        ChiTietHoaDon CT ON HD.MaHoaDon = CT.MaHoaDon
    JOIN
        SanPham SP ON CT.MaSanPham = SP.MaSanPham
    WHERE
        YEAR(HD.NgayTao) = @year
        AND HD.TrangThai = N'Đã giao'
    GROUP BY
        SP.MaSanPham, SP.TenSanPham
    ORDER BY
        TongSoLuongBan DESC
)
GO


CREATE FUNCTION fn_ThongKeTongSoLuongSanPhamTheoThang
(
    @year INT
)
RETURNS TABLE
AS
RETURN
(
    WITH Months AS (
        SELECT 1 AS Thang
        UNION ALL SELECT 2
        UNION ALL SELECT 3
        UNION ALL SELECT 4
        UNION ALL SELECT 5
        UNION ALL SELECT 6
        UNION ALL SELECT 7
        UNION ALL SELECT 8
        UNION ALL SELECT 9
        UNION ALL SELECT 10
        UNION ALL SELECT 11
        UNION ALL SELECT 12
    )
    SELECT
        M.Thang,
        COALESCE(SUM(CT.SoLuong), 0) AS TongSoLuongBan
    FROM
        Months M
    LEFT JOIN
        HoaDon H ON YEAR(H.NgayTao) = @year AND MONTH(H.NgayTao) = M.Thang AND H.TrangThai = N'Đã giao'
    LEFT JOIN
        ChiTietHoaDon CT ON H.MaHoaDon = CT.MaHoaDon
    GROUP BY
        M.Thang
)
GO

CREATE FUNCTION fn_danhSachKhachHang
(
    @thang INT,
    @nam INT
)
RETURNS TABLE
AS
RETURN
(
    SELECT 
		ND.ID,
        ND.Hoten AS TenKhachHang,
		ND.Gioitinh,
        ND.email,
        ND.SDT,
        COALESCE(SUM(CT.SoLuong), 0) AS SoSanPhamMua,
        COALESCE(SUM(HD.TongTien), 0) AS TongSoTien
    FROM 
        NguoiDung ND
    LEFT JOIN 
        HoaDon HD ON ND.ID = HD.IDNguoiMua 
                 AND HD.TrangThai = N'Đã giao'
                 AND (@nam = 0 OR YEAR(HD.NgayTao) = @nam)
                 AND (@thang = 0 OR MONTH(HD.NgayTao) = @thang)
    LEFT JOIN 
        ChiTietHoaDon CT ON HD.MaHoaDon = CT.MaHoaDon
    GROUP BY 
        ND.ID, ND.Hoten, ND.email, ND.SDT,ND.Gioitinh
)
GO

CREATE FUNCTION fn_ThongKeSoNguoiMuaTheoThang
(
    @year INT
)
RETURNS TABLE
AS
RETURN
(
    WITH Months AS (
        SELECT 1 AS Thang
        UNION ALL SELECT 2
        UNION ALL SELECT 3
        UNION ALL SELECT 4
        UNION ALL SELECT 5
        UNION ALL SELECT 6
        UNION ALL SELECT 7
        UNION ALL SELECT 8
        UNION ALL SELECT 9
        UNION ALL SELECT 10
        UNION ALL SELECT 11
        UNION ALL SELECT 12
    )
    SELECT
        M.Thang,
        COALESCE(COUNT(DISTINCT H.IDNguoiMua), 0) AS SoNguoiMua
    FROM
        Months M
    LEFT JOIN
        HoaDon H ON YEAR(H.NgayTao) = @year AND MONTH(H.NgayTao) = M.Thang AND H.TrangThai = N'Đã giao'
    GROUP BY
        M.Thang
)
GO

CREATE OR ALTER FUNCTION fn_GetMaChiTiet
(
    @IDNguoiMua INT,
    @maHoaDon INT 
)
RETURNS TABLE
AS
RETURN
(
    SELECT 
        MaChiTiet
    FROM 
        HoaDon H
    JOIN 
        ChiTietHoaDon CT ON H.MaHoaDon = CT.MaHoaDon
    WHERE 
        H.IDNguoiMua = @IDNguoiMua
        AND H.MaHoaDon = @maHoaDon 
)
GO

-- procedure cập nhật đã bán
CREATE OR ALTER PROCEDURE proc_capNhatSoLuongDaBan
    @IDNguoiMua INT,
    @maHoaDon INT
AS
BEGIN
    -- Cập nhật số lượng đã bán
    UPDATE SanPham
    SET DaBan = DaBan + ChiTietHoaDon.SoLuong
    FROM SanPham
    JOIN ChiTietHoaDon ON SanPham.MaSanPham = ChiTietHoaDon.MaSanPham
    WHERE ChiTietHoaDon.MaHoaDon = @maHoaDon;

    -- Thêm đánh giá cho từng sản phẩm trong hóa đơn nếu trạng thái là "Đã giao"
   
    INSERT INTO DanhGia (IDNguoiMua, MaSanPham, MaChiTiet, BinhLuan, SoSao, ngayDanhGia)
    SELECT 
        @IDNguoiMua, 
        CT.MaSanPham, 
        CT.MaChiTiet, 
        NULL AS BinhLuan, -- Để trống ban đầu, có thể cập nhật sau
        NULL AS SoSao,     -- Để trống ban đầu, có thể cập nhật sau
		GETDATE()
    FROM 
        ChiTietHoaDon CT
    JOIN 
        fn_GetMaChiTiet(@IDNguoiMua, @maHoaDon) fnCT ON CT.MaChiTiet = fnCT.MaChiTiet;
END;
GO

CREATE FUNCTION dbo.TongDoanhThu()
RETURNS INT
AS
BEGIN
    -- Biến để lưu kết quả
    DECLARE @TongDoanhThu INT;

    -- Tính tổng doanh thu
    SELECT @TongDoanhThu = SUM(TongTien)
    FROM HoaDon
    WHERE TrangThai = N'Đã giao';

    -- Trả về kết quả
    RETURN ISNULL(@TongDoanhThu, 0);
END;
GO

CREATE FUNCTION dbo.SoDonHangTheoTrangThai()
RETURNS TABLE
AS
RETURN
(
    SELECT
        DaGiao = SUM(CASE WHEN TrangThai = N'Đã giao' THEN 1 ELSE 0 END),
        DangGiao = SUM(CASE WHEN TrangThai = N'Đang giao' THEN 1 ELSE 0 END),
        TongDonHang = COUNT(*)
    FROM HoaDon
);
GO

-- đánh giá sản phẩm
CREATE OR ALTER PROCEDURE proc_ThemDanhGia
    @IDNguoiMua INT,
    @MaSanPham INT,
    @MaChiTiet INT,
    @BinhLuan NVARCHAR(MAX),
    @SoSao INT,
	@ngayDanhGia DATE
AS
BEGIN
    -- Kiểm tra xem bản ghi đánh giá đã tồn tại chưa
    IF EXISTS (SELECT 1 FROM DanhGia WHERE IDNguoiMua = @IDNguoiMua AND MaSanPham = @MaSanPham AND MaChiTiet = @MaChiTiet)
    BEGIN
        -- Nếu đã tồn tại, cập nhật đánh giá và bình luận
        UPDATE DanhGia
        SET BinhLuan = @BinhLuan,
            SoSao = @SoSao,
			ngayDanhGia = @ngayDanhGia,
			TrangThaiDanhGia = N'Đã đánh giá'
        WHERE IDNguoiMua = @IDNguoiMua AND MaSanPham = @MaSanPham AND MaChiTiet = @MaChiTiet;
    END
    ELSE
    BEGIN
        -- Nếu chưa tồn tại, thêm đánh giá mới
        INSERT INTO DanhGia (IDNguoiMua, MaSanPham, MaChiTiet, BinhLuan, SoSao, ngayDanhGia)
        VALUES (@IDNguoiMua, @MaSanPham, @MaChiTiet, @BinhLuan, @SoSao, GETDATE());
    END
END;
GO

-- Load thogn tin đã đánh giá
CREATE OR ALTER PROCEDURE proc_LoadThongTinDanhGia (@IDNguoiMua INT, @TrangThai NVARCHAR(50))
AS
BEGIN
	select Q.*, TenKichCo, TenMau
	from KichCo, MauSac,
	(select ChiTietHoaDon.MaChiTiet as maChiTiet, BinhLuan, SoSao, TrangThaiDanhGia, ngayDanhGia, HoTen, ChiTietHoaDon.MaSanPham as maSP, TenSanPham, MaHinhAnh, DuongDanHinh, MaMau, MaKichCo
	from DanhGia inner join ChiTietHoaDon on DanhGia.MaChiTiet = ChiTietHoaDon.MaChiTiet, SanPham, HinhAnhSanPham, NguoiDung
	where SanPham.MaSanPham = ChiTietHoaDon.MaSanPham and ChiTietHoaDon.MaSanPham = HinhAnhSanPham.MaSanPham and DanhGia.IDNguoiMua = NguoiDung.ID and IDNguoiMua = @IDNguoiMua
	) Q
	where Q.MaKichCo = KichCo.MaKichCo and Q.MaMau = MauSac.MaMau and KichCo.MaSanPham = Q.maSP and MauSac.MaSanPham = Q.maSP and TrangThaiDanhGia = @TrangThai
	ORDER BY ngayDanhGia DESC
END;
GO

-- Load Thông tin đã đánh giá của một sản phẩm
CREATE OR ALTER PROCEDURE proc_LoadThongTinDanhGiaMotSP
AS
BEGIN
	select Q.*, TenKichCo, TenMau
	from KichCo, MauSac,
	(select ChiTietHoaDon.MaChiTiet as maChiTiet, BinhLuan, SoSao, TrangThaiDanhGia, ngayDanhGia, HoTen, ChiTietHoaDon.MaSanPham as maSP, TenSanPham, MaHinhAnh, DuongDanHinh, MaMau, MaKichCo
	from DanhGia inner join ChiTietHoaDon on DanhGia.MaChiTiet = ChiTietHoaDon.MaChiTiet, SanPham, HinhAnhSanPham, NguoiDung
	where SanPham.MaSanPham = ChiTietHoaDon.MaSanPham and ChiTietHoaDon.MaSanPham = HinhAnhSanPham.MaSanPham and DanhGia.IDNguoiMua = NguoiDung.ID 
	) Q
	where Q.MaKichCo = KichCo.MaKichCo and Q.MaMau = MauSac.MaMau and KichCo.MaSanPham = Q.maSP and MauSac.MaSanPham = Q.maSP
	ORDER BY ngayDanhGia DESC
END;
GO

CREATE OR ALTER FUNCTION fn_GetHoaDonChiTiet
(
    @IDNguoiMua INT,
    @Thang INT,
    @Nam INT
)
RETURNS TABLE
AS
RETURN
(
    SELECT 
        H.MaHoaDon,
        H.IDNguoiMua,
        H.NgayTao,
        H.TongTien,
        H.diachi AS DiaChiGiaoHang,
        H.TrangThai,
        CT.MaChiTiet,
        CT.MaSanPham,
        SP.TenSanPham,
        CT.MaKichCo,
        KC.TenKichCo AS KichCo,
        CT.MaMau,
        MS.TenMau AS Mau,
        CT.SoLuong,
        CT.GiaBan,
        HA.DuongDanHinh AS HinhAnh,
        COALESCE(DG.BinhLuan, '') AS BinhLuan,
        COALESCE(DG.SoSao, 0) AS SoSao,
        DG.ngayDanhGia,
        DG.TrangThaiDanhGia
    FROM 
        HoaDon H
    JOIN 
        ChiTietHoaDon CT ON H.MaHoaDon = CT.MaHoaDon
    JOIN 
        SanPham SP ON CT.MaSanPham = SP.MaSanPham
    LEFT JOIN 
        KichCo KC ON CT.MaKichCo = KC.MaKichCo AND CT.MaSanPham = KC.MaSanPham
    LEFT JOIN 
        MauSac MS ON CT.MaMau = MS.MaMau AND CT.MaSanPham = MS.MaSanPham
    LEFT JOIN 
        HinhAnhSanPham HA ON SP.MaSanPham = HA.MaSanPham
    LEFT JOIN 
        DanhGia DG ON DG.MaChiTiet = CT.MaChiTiet AND DG.IDNguoiMua = H.IDNguoiMua
    WHERE 
        H.IDNguoiMua = @IDNguoiMua
        AND (@Thang = 0 OR MONTH(H.NgayTao) = @Thang)
        AND (@Nam = 0 OR YEAR(H.NgayTao) = @Nam)
)
GO

CREATE PROCEDURE proc_ThemDiaChiNhanHang @IDNguoiMua INT, @diachi NVARCHAR(255)
AS
BEGIN
    DECLARE @newMaDiaChi INT;
	SELECT @newMaDiaChi = ISNULL(MAX(MaDiaChi), 0) + 1 FROM DiaChiNhanHang;

	INSERT INTO DiaChiNhanHang (Madiachi, IDNguoiDung, TenDiaChi)
	VALUES (@newMaDiaChi, @IDNguoiMua, @diachi);
END;
GO

CREATE OR ALTER PROCEDURE proc_themTaiKhoan
    @username NVARCHAR(50),
    @pass NVARCHAR(50),
    @Hoten NVARCHAR(50),
    @NgaySinh DATE,
    @Gioitinh NVARCHAR(50),
    @SDT VARCHAR(12),
    @email VARCHAR(50),
    @cccd VARCHAR(20),
	@diachi NVARCHAR(255)
AS
BEGIN
    BEGIN TRANSACTION;

    BEGIN TRY
        -- Thêm tài khoản vào bảng Account
        INSERT INTO Account (username, pass, position)
        VALUES (@username, @pass, 'user'); -- Gán mặc định position là 'user'

        -- Lấy ID tự động tạo từ bảng Account
        DECLARE @newID INT = SCOPE_IDENTITY();

        -- Thêm thông tin người dùng vào bảng NguoiDung
        INSERT INTO NguoiDung (ID, CCCD, Hoten, Gioitinh, SDT, NgaySinh, email)
        VALUES (@newID, @cccd, @Hoten, @Gioitinh, @SDT, @NgaySinh, @email);

		-- Gọi thủ tục proc_ThemDiaChiNhanHang để thêm địa chỉ
        EXEC proc_ThemDiaChiNhanHang @IDNguoiMua = @newID, @diachi = @diachi;

        -- Hoàn tất giao dịch
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        -- Nếu có lỗi, hủy giao dịch
        ROLLBACK TRANSACTION;

        -- Hiển thị thông báo lỗi
        THROW;
    END CATCH
END;
GO

CREATE FUNCTION fn_ThongKeDoanhThuTheoThang
(
    @year INT
)
RETURNS TABLE
AS
RETURN
(
    WITH Months AS (
        SELECT 1 AS Thang
        UNION ALL SELECT 2
        UNION ALL SELECT 3
        UNION ALL SELECT 4
        UNION ALL SELECT 5
        UNION ALL SELECT 6
        UNION ALL SELECT 7
        UNION ALL SELECT 8
        UNION ALL SELECT 9
        UNION ALL SELECT 10
        UNION ALL SELECT 11
        UNION ALL SELECT 12
    )
    SELECT
        M.Thang,
        COALESCE(SUM(H.TongTien), 0) AS TongTien
    FROM
        Months M
    LEFT JOIN
        HoaDon H ON YEAR(H.NgayTao) = @year AND MONTH(H.NgayTao) = M.Thang AND H.TrangThai = N'Đã giao'
    GROUP BY
        M.Thang
)
GO