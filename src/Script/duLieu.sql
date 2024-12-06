INSERT INTO DanhMucSanPham (MaDanhMuc, TenDanhMuc) VALUES 
(1, N'Áo thun'),
(2, N'Áo sơ mi'),
(3, N'Quần jeans'),
(4, N'Quần short'),
(5, N'Đầm'),
(6, N'Váy'),
(7, N'Áo khoác'),
(8, N'Áo len'),
(9, N'Áo sweater'),
(10, N'Quần tây'),
(11, N'Áo vest'),
(12, N'Áo hoodie'),
(13, N'Quần jogger'),
(14, N'Bộ đồ ngủ'),
(15, N'Áo polo');
GO

INSERT INTO SanPham (MaSanPham, TenSanPham, MoTa, GiaBanDau, GiamGia, SoLuong, MaDanhMuc, NgayTao, XuatXu, ChatLieu)
VALUES 
--dm1

(1, N'Áo thun nam trắng', N'Áo thun nam chất liệu cotton', 300000, 20, 100, 1, '2024-12-07', N'Việt Nam', N'Cotton'),
(2, N'Áo Thun Unisex', N'Áo thun nam chất liệu cotton 250gsm chính hãng', 350000, 30, 100, 1, '2024-12-07', N'Việt Nam', N'Cotton'),
(3, N'Áo thun cổ tròn', N'Áo thun nam nữ oversize hình in sắc nét chất liệu cotton 250gsm chính hãng', 200000, 25, 100, 1, '2024-12-07', N'Việt Nam', N'Cotton'),
(4, N'Áo Thun Local Brand', N'Cotton 95%, Spandex 5% nên vải giữ được đặc tính tự nhiên, mềm mại, thoáng mát', 250000, 25, 100, 1, '2024-12-07', N'Việt Nam', N'Cotton'),
--dm2

(5, N'Áo sơ mi đũi nam cổ trụ', N'Áo thuộc dạng form rộng, unisex, mặc thoải mái rồi nên khi đặt không cần nhích size', 200000, 30, 100, 2, '2024-12-07', N'Việt Nam', N'Oxford'),
(6, N'Áo sơ mi nam tay ngắn', N'Áo thuộc dạng form rộng, unisex, mặc thoải mái rồi nên khi đặt không cần nhích size', 200000, 30, 100, 2, '2024-12-07', N'Việt Nam', N'Oxford'),
(7, N'Áo sơ mi trắng nam dài tay', N'Áo thuộc dạng form rộng, unisex, mặc thoải mái rồi nên khi đặt không cần nhích size', 350000, 30, 100, 2, '2024-12-07', N'Việt Nam', N'Cotton'),
(8, N'Áo Sơ Mi Nam tay ngắn', N'Tất cả các sản phẩm chúng tôi bán đều được kiểm tra chất lượng nghiêm ngặt trước khi rời khỏi nhà máy.', 140000, 10, 100, 2, '2024-12-07', N'Trung Quốc', N'Khác'),
(9, N'Áo sơ mi nam nữ dài tay', N'Áo sơ mi nam nữ dài tay DWIN trơn basic chất nhung chéo Hàn cao cấp chống nhăn.', 200000, 50, 100, 2, '2024-12-07', N'Việt Nam', N'Chéo Hàn'),
--dm3
(10, N'Quần jeans nam đen', N'Quần jeans nam phong cách trẻ trung', 600000, 40, 100, 3, '2024-12-07', N'Mỹ', N'Denim'),
(11, N'Quần jean nam ROWAY', N'Shop có bảng size mẫu. Bạn NÊN INBOX, cung cấp chiều cao, cân nặng để SHOP TƯ VẤN SIZE.', 300000, 10, 100, 3, '2024-12-07', N'Việt Nam', N'Denim'),
(12, N'Quần Jean PEALO Unisex', N'Từng sởi vải được kiểm tra và sản xuất qua nhiều khâu chọn lọc. Đảm bảo chất lượng', 350000, 30, 100, 3, '2024-12-07', N'Việt Nam', N'Denim'),
(13, N'Quần jean nam ống rộng', N'Một chiếc quần jean ống rộng phải đặt tiêu chí Thoải Mái lên hàng đầu', 220000, 20, 100, 3, '2024-12-07', N'Việt Nam', N'Denim'),
--dm4

(14, N'Quần short nữ', N'Quần short nữ mát mẻ cho mùa hè', 200000, 10, 100, 4, '2024-12-07', N'Trung Quốc', N'Vải thun'),
(15, N'Quần Short Baggy Jean Túi', N'Quần short nam túi hộp jean cao cấp ống rộng bigsize M Fashion đi chơi mặc nhà', 210000, 10, 100, 4, '2024-12-07', N'Việt Nam', N'Denim'),
(16, N'Quần jeans short bò ống rộng', N'Quần đùi nam, hàng cao cấp giá hợp lý', 150000, 0, 100, 4, '2024-12-07', N'Việt Nam', N'Denim'),
(17, N'Quần short nữ jean cạp cao', N'Quần đùi nữ chất liệu dù co dãn mặc tạo cảm giác thoải mái mát mẻ', 175000, 30, 100, 4, '2024-12-07', N'Mỹ', N'95%Polyester+5%Spandex'),
(18, N'Quần RUZI Baggy Jeans Short', N'Quần đùi nam nữ chất liệu dù co dãn mặc tạo cảm giác thoải mái mát mẻ', 160000, 35, 100, 4, '2024-12-07', N'Việt Nam', N'Denim'),
--dm5

(19, N'Váy Gân Hàn Quốc', N'Đầm dạ hội thanh lịch', 200000, 10, 100, 5, '2024-12-07', N'Pháp', N'Lụa'),
(20, N'Váy Gân Hàn Quốc', N'Thiết kế này được yêu thích bởi sự duyên dáng, dịu dàng được nhiều chị em yêu thích', 200000, 30, 100, 5, '2024-12-07', N'Hàn Quốc', N'Lanh'),
(21, N'Đầm midi sơ mi thanh lịch', N'Đầm midi sơ mi thanh lịch thô 2 da dáng dài phối cúc gỗ HAVANA DA82', 165000, 25, 100, 5, '2024-12-07', N'Việt Nam', N'Lanh'),
(22, N'Đầm váy maxi nữ cổ yếm', N'Đầm váy maxi nữ cổ yếm mocking dáng dài kèm khoác ngoài màu xanh và hồng pastel đi biển siêu xinh', 150000, 20, 100, 5, '2024-12-07', N'Việt Nam', N'Đũi'),
--dm6
(23, N'Váy Kaki Trắng 2 Dây', N'Váy kaki chéo mềm chun lưng dễ mặc . Hàng dày dặn .Dáng xoè váy siêu hack tuổi cưng yêu cho các nàng nhà e ạ', 165000, 25, 100, 6, '2024-12-07', N'Việt Nam', N'Kaki'),
(24, N'Váy xếp ly', N'Váy xếp ly phong cách Hàn Quốc', 500000, 40, 100, 6, '2024-12-07', N'Hàn Quốc', N'Polyester'),
(25, N'Váy Hai Dây Hoa Nhí', N'Chất liệu đũi lạnh: mát, thấm hút mồ hôi nhưng dày dặn không bị xuyên thấu, dáng váy chảy và bay nhẹ nhàng', 250000, 40, 100, 6, '2024-12-07', N'Việt Nam', N'Đũi lạnh'),
(26, N'Váy sơ mi kẻ dáng ngắn', N'Váy Sơ Mi Dáng Ngắn Kèm Nơ Kẻ Sọc Và Quần Bảo Hộ, Váy Dáng Ngắn Có Nơ Mix Quần Đùi Trong, Thời Trang Mùa Hè Cho Nữ', 300000, 30, 100, 6, '2024-12-07', N'Việt Nam', N'Vải'),
(27, N'Váy sơ mi dáng dài', N'Váy sơ mi dáng dài kẻ công sở đi biển Maruko chan store (Kẻ xanh)', 300000, 20, 100, 6, '2024-12-07', N'Việt Nam', N'Thô'),

--Danh Mục 7
(31, N'Áo Khoác jean nam nữ Unisex', N'Áo Khoác jean nam nữ Unisex, áo khoác bò form rộng size - Avocado', 290000, 50, 100, 7, '2024-01-01', N'Việt Nam', N'Jean'),
(32, N'Áo khoác gió nam-nữ 2 lớp có túi trong', N'Áo khoác dù, áo khoác gió Unisex - CHẤT DÙ SIÊU ĐẸP - 2 LỚP CHỐNG MƯA NẮNG ĐƯỢC HẾT', 310000, 55, 80, 7, '2024-01-05', N'Trung Quốc', N'Vải Gió cao cấp'),
(33, N'Áo khoác gió nam cổ đứng Ecollect', N'Sản phẩm: Áo khoác gió nam cổ đứng Ecollect #G08 vải dù tráng bạc chống nước chóng gió kiểu dáng trẻ trung hợp thời trang nam', 260000, 31, 70, 7, '2024-01-10', N'Việt Nam', N'Nylon'),
(34, N'Áo khoác unisex lót lông cừu', N'áo bên mình form khá chuẩn và áo to nên các bạn lấy đúng size nha, đừng lấy lên size sẽ bị rộng đó ạ', 450000, 20, 50, 7, '2024-01-15', N'Việt Nam', N'Lông cừu, Chất gió xuất dư'),
(35, N'Áo khoác dù nam nữ form rộng có lót lụa', N'Sản phẩm áo Khoác nam chất dù xuất dư xịn đét, form rộng giống mô tả 100%', 440000, 35, 60, 7, '2024-01-20', N'Việt Nam', N'Nỉ, Nylon'),
--Danh mục 8
(36, N'Áo len nam cổ tròn kiểu dáng hàn quốc', N'Sản phẩm 100% giống mô tả. Kiểu dáng hoàn toàn giống ảnh mẫu', 240000, 15, 100, 8, '2024-01-01', N'Việt Nam', N'Cotton'),
(37, N'RANMO áo len áo cardigan khoác tingoan', N'Chất lượng và giá cả như thế này không thể tìm thấy ở bất kỳ nơi nào khác, rất đáng đồng tiền.', 230000, 38, 80, 8, '2024-01-05', N'Hàn Quốc', N'Cotton'),
(38, N'Áo len đỏ giáng sinh tết thu đông dệt kim nữ', N'Chất vải đẹp, dày dặn. Sờ thích tay, mềm. Sản phẩm được cắt chỉ sạch', 395000, 30, 70, 8, '2024-01-10', N'Việt Nam', N'Len'),
(39, N'Áo sweater sát nách cổ V', N'Áo len mùa thu áo len nam phong cách đại học Anh áo len cổ chữ V áo len thanh niên xu hướng áo vest FARU180', 290000, 15, 50, 8, '2024-01-15', N'Trung Quốc', N'Đan'),
(40, N'Áo Len Cổ V Dáng Dài From Rộng Phong Cách Hàn', N'Áo Len Cổ V Dáng Dài From Rộng Phong Cách Hàn Quốc 5 Màu Dễ Mặc Thời Trang Nữ Hàng Qccc Shopquacam', 295000, 5, 60, 8, '2024-01-20', N'Trung Quốc', N'Len'),
--Danh mục 9
(41, N'Áo Sweater Unisex MÈO KUTE', N'Áo Sweater Unisex MÈO KUTE Áo Sweater Nam Nữ Form Rộng Chất Cotton Nỉ Ngoại Hàng Xuất Cao Cấp Trơn Cổ Tròn Dài Tay', 355000, 25, 100, 9, '2024-02-01', N'Trung Quốc', N'Len'),
(42, N'Áo sweater nỉ hàn cổ tròn mềm mịn', N'Toàn bộ ảnh sản phẩm là do Miho tự chụp, màu ảnh có thể chênh lệch đậm nhạt một chút do ánh sáng và góc chụp ạ', 149000, 31, 80, 9, '2024-02-05', N'Việt Nam', N'Nỉ'),
(43, N'Áo Sweater LaBuBu', N'Áo Sweater LaBuBu Moto Nam Nữ By JOLI Unisex Chất Nỉ Lót Bông Mũ 2 Lớp Form Rộng', 395000, 20, 70, 9, '2024-02-10', N'Hàn Quốc', N'Nỉ'),
(44, N'Áo Sweater layer dáng Unisex chất liệu nỉ bông trẻ trung', N'Độ bền màu cao, giúp form áo luôn ổn định. (không như các áo thun chợ, chỉ giặt vài lần là bị chảy xệ, vặn vẹo, biến dạng)', 265000, 15, 60, 9, '2024-02-15', N'Việt Nam', N'Nỉ'),
(45, N'Áo Sweater Dài Tay Unisex TEEDARK', N'Áo Sweater Dài Tay Unisex TEEDARK Chất Nỉ Mịn Dày Dặn, Phong Cách Năng Động', 135000, 5, 50, 9, '2024-02-20', N'Việt Nam', N'Nỉ'),
--Dm10
(46, N'Quần Tây Nam Cao Cấp ORICANO', N'Quần âu nam ống rộng ORICANO, quần nam ống suông phong cách hàn quốc trẻ trung năng động.', 400000, 25, 100, 10, '2024-02-01', N'Việt Nam', N'Vải vinteck Cao Cấp'),
(47, N'Quần Kaki Nam Nữ Ống Suông', N'Quần Kaki Nam Nữ Ống Suông Basic Unisex - Kiểu quần baggy nam ống rộng xắn gấu trẻ trung', 335000, 20, 80, 10, '2024-02-05', N'Việt Nam', N'Kaki'),
(48, N'Quần tây nam hàn quốc JBagy', N'Chắc chắn việc mặc 1 chiếc quần Tây Nam dáng Baggy ống rộng thời trang, năng động sẽ mang lại cho bạn sự tự tin trong ánh mắt những người xung quanh', 490000, 15, 70, 10, '2024-02-10', N'Việt Nam', N'Vải'),
(49, N'Quần tây nam, Quần âu nam hàn quốc', N'Do màn hình và điều kiện ánh sáng khác nhau, màu sắc thực tế của sản phẩm có thể chênh lệch khoảng 3-5%', 355000, 15, 60, 10, '2024-02-15', N'Việt Nam', N'Cotton Hàn'),
(50, N'Quần Dài Nam Vải Chống Nhăn', N'Quần âu nam được thiết kế phom dáng ôm vừa phải, phù hợp để đi học, đi làm trong các môi trường công sở sang trọng, đi chơi.', 380000, 15, 50, 10, '2024-02-20', N'Việt Nam', N'Cotton'),
--dm11
(51, N'Áo Blazer Nam Dài Form Rộng', N'Áo siêu đẹp nha mọi người mk m7 mặc L đẹp mê luôn lần sau cần mua sẽ ghé shop ủng hộ shipper thì nhiệt tình 10 điểm luôn rất hài lòng ý', 520000, 35, 100, 11, '2024-02-21', N'Việt Nam', N'Cotton'),
(52, N'ÁO KHOÁC NAM VEST NAM CAO CẤP', N'Quần áo shop win được chọn lọc kỹ chất lượng tốt giá tốt, quý khách yên tâm không sợ mua lầm, mua lần đầu sẽ còn quay lại mua lần sau. Bảo Hành đổi size đổi mẫu nhanh lẹ nhiệt tình', 480000, 25, 90, 11, '2024-02-22', N'Việt Nam', N'Lông'),
(53, N'Áo Vest blazer dáng suông', N'Hàng đẹp, màu như mẫu nhưng mình chụp hình trong phòng nên màu nó ra trắng trắng vậy thôi. Vải mềm.', 580000, 55, 80, 11, '2024-02-23', N'Việt Nam', N'Cotton'),
(54, N'Áo khoác dài cổ Vest, form rộng', N'Chất Liệu Vải : Flannel xuất Hàn cao cấp 100%, co giãn 4 chiều, vải mềm, mịn, thoáng mát, không xù lông', 580000, 45, 70, 11, '2024-02-24', N'Trung Quốc', N'Flannel'),
(55, N'Áo blazer nữ tay dài KAMONG', N'Áo blazer nữ KAMONG tay ngắn dáng áo khoác Vest công sở cơ bản', 480000, 25, 60, 11, '2024-02-25', N'Việt Nam', N'Tuyết mưa (Loại 1)'),
--dm12
(56, N'Áo Hoodie thêu chữ basic nam nữ', N'Sản phẩm Áo Hoodie thêu chữ basic nam nữ Form rộng cao cấp giống mô tả 100%', 380000, 45, 100, 12, '2024-02-01', N'Trung Quốc', N'Cotton, Nỉ'),
(57, N'Áo hoodie unisex form rộng WIND CAPYBARA', N'Chất Liệu: Nỉ Ngoại (Nỉ Bông là sự kết hợp của 2 chất liệu là vải và len). được đánh giá cao về độ mềm mại, không bị xù lông, độ co giãn vừa phải và đa dạng về màu sắc', 360000, 35, 100, 12, '2024-02-05', N'Việt Nam', N'Nỉ'),
(58, N'Áo Hoodie Nam Nữ From Rộng APT Unisex', N'Nỉ bông 100% cotton cao cấp, dòng vải nỉ rất phù hợp vs mùa thu đông vải mềm, vải mịn, thoáng mát, không xù lông, vải co giãn 2 chiều giữ form.', 285000, 25, 100, 12, '2024-02-10', N'Trung Quốc', N'Nỉ'),
(59, N'Áo hoodie nam nữ ANYOUNG', N'Áo hoodie nam nữ ANYOUNG áo hoodie cổ cao dáng rộng phối khóa kéo thời trang kiểu Ninja, áo nỉ hoodie khóa zip AN 656', 440000, 35, 100, 12, '2024-02-15', N'Việt Nam', N'Nỉ'),
(60, N'Áo Hoodie nam nữ - Áo Khoác nỉ Ninja', N'Áo khoác nỉ nam nữ - Áo Hoodie Ninja form rộng có mũ kèm khăn che mặt phong cách Ninja chất liệu nỉ bông dày dặn siêu ấm', 320000, 45, 100, 12, '2024-02-20', N'Trung Quốc', N'Cotton, Nỉ'),
--dm 13

(61, N'Quần Jogger Nam Nữ Trơn Basic', N'Quần jogger được thiết kế từ ý tưởng những chiếc quần thể thao truyền thống và được cải tiến cho gọn gàng, hợp thời trang hơn.', 220000, 45, 100, 13, '2024-03-01', N'Trung Quốc', N'Thun poly 2 da'),
(62, N'Quần Nỉ Tăm Jogger Nam Nữ', N'Form dáng: Baggy suông tạo cảm giác thoải mái khi sử dụng', 325000, 65, 100, 13, '2024-03-05', N'Việt Nam', N'Nỉ'),
(63, N'Quần Túi Hộp Nam Thời Trang Hiphop', N'Đảm Bảo Chất Lượng 100%', 280000, 35, 100, 13, '2024-03-10', N'Trung Quốc', N'Cotton'),
(64, N'Quần Ống Rộng Dáng Suông Unisex Quần Jogger Thể Thao', N'Quần Ống Rộng Dáng Suông Unisex Quần Jogger Thể Thao Nam Nữ FABULOUE Vải Nỉ Cotton dày phong cách Hàn Quốc', 335000, 25, 100, 13, '2024-03-15', N'Hàn Quốc', N'Cotton, Nỉ'),
(65, N'Quần suông dài (pants) nam nữ unisex basic', N'Chất vải quần là chất cotton da cá cao cấp dày dặn, dễ phối hợp đồ, nam nữ mặc đều đẹp ạ', 360000, 65, 100, 13, '2024-03-20', N'Trung Quốc', N'Cotton'),
--dm14
 
(66, N'Bộ đồ ngủ nữ pijama dài tay', N'Bộ đồ ngủ nữ pijama dài tay, đồ bộ mặc nhà thu đông chất liệu cotton thun mềm mại thoáng mát QA03', 160000, 25, 100, 14, '2024-03-01', N'Việt Nam', N'Cotton'),
(67, N'Bộ Ngủ Cotton Gân Pijama Siêu Mát', N'Bộ ngủ cotton cao cấp giống 100% trong hình, ảnh cho thể bị chênh lệch 3-5% do ánh sáng chụp', 220000, 45, 100, 14, '2024-03-05', N'Trung Quốc', N'Cotton'),
(68, N'YAMI bộ đồ ngủ Tay áo dài cotton pijama đồ mặc nhà nữ', N'Sản phẩm bị phai màu sau khi giặt là điều bình thường. vui lòng giặt riêng', 160000, 25, 100, 14, '2024-03-10', N'Trung Quốc', N'Cotton'),
(69, N'Bộ Đồ Ngủ Caro BY CHANN', N'Đồ đẹp lắm luôn màu cũng ưng nữa nói chung là xứng đáng đồng tiền nên mua nha m.n', 160000, 65, 100, 14, '2024-03-15', N'Việt Nam', N'cotton xốp'),
(70, N'Bộ đồ Lông Cừu Ngủ Lông Trắng Kem Tiểu Thư', N'Bộ Lông Cừu Ngủ Lông Trắng Kem Tiểu Thư Phối Nơ Đen AN NHIẾN SHOP, Bộ Ủ Kem Mùa Đông Lông Nhân Tạo', 460000, 45, 100, 14, '2024-03-20', N'Việt Nam', N'Lông cừu'),
--dm15

(71, N'Áo Polo Phối cổ SPION', N'Chất vải áo là chất cotton mặc thoáng mát thấm hút mồ hôi', 260000, 35, 100, 15, '2024-03-01', N'Việt Nam', N'Cotton'),
(72, N'Áo polo kéo khoá cổ nam nữ', N'Áo Polo Cổ Khóa Tay Lỡ Form Rộng Màu Đen Chất Thun Cotton Co Giãn Thoáng Mát', 160000, 45, 100, 15, '2024-03-05', N'Việt Nam', N'COTTON TỔ ONG'),
(73, N'Áo thun nam cổ bẻ phối màu', N'Giặt máy thoải mái không lo ảnh hưởng đến độ bền áo', 260000, 60, 100, 15, '2024-03-10', N'Trung Quốc', N'Cotton'),
(74, N'Áo Polo Nam Cooling 5S FASHION', N'Chất vải mát, đường may ok không có chỉ thừa, đáng tiền khi săn mã giảm giá', 320000, 65, 100, 15, '2024-03-15', N'Việt Nam', N'Sợi tổng hợp'),
(75, N'Áo polo nữ TOLI', N'Chất vải cotton cao cấp dày dặn, dễ phối hợp đồ, nam nữ mặc đều đẹp', 150000, 15, 100, 15, '2024-03-20', N'Việt Nam', N'Cotton');


INSERT INTO KichCo (MaKichCo, MaSanPham, TenKichCo)
VALUES
--dm1
-- Áo thun nam trắng
(1, 1, N'S'), (2, 1, N'M'), (3, 1, N'L'), (4, 1, N'XL'),
-- Áo Thun Unisex
(1, 2, N'S'), (2, 2, N'M'), (3, 2, N'L'), (4, 2, N'XL'),
-- Áo thun cổ tròn
(1, 3, N'M'), (2, 3, N'L'), (3, 3, N'XL'),
-- Áo Thun Local Brand
(1, 4, N'S'), (2, 4, N'M'), (3, 4, N'L'), (4, 4, N'XL'),
--dm2
-- Áo sơ mi đũi nam cổ trụ
(1, 5, N'M'), (2, 5, N'L'), (3, 5, N'XL'), (4, 5, N'XXL'),
-- Áo sơ mi nam tay ngắn
(1, 6, N'M'), (2, 6, N'L'), (3, 6, N'XL'),
-- Áo sơ mi trắng nam dài tay
(1, 7, N'S'), (2, 7, N'M'), (3, 7, N'L'), (4, 7, N'XL'),
-- Áo Sơ Mi Nam tay ngắn
(1, 8, N'S'), (2, 8, N'M'), (3, 8, N'L'), (4, 8, N'XL'),
-- Áo sơ mi nam nữ dài tay
(1, 9, N'M'), (2, 9, N'L'), (3, 9, N'XL'),
--dm3
-- Quần jeans nam đen
(1, 10, N'28'), (2, 10, N'30'), (3, 10, N'32'), (4, 10, N'34'),
-- Quần jean nam ROWAY
(1, 11, N'28'), (2, 11, N'29'), (3, 11, N'30'), (4, 11, N'31'),
-- Quần Jean PEALO Unisex
(1, 12, N'S'), (2, 12, N'M'), (3, 12, N'L'), (4, 12, N'XL'),
-- Quần jean nam ống rộng
(1, 13, N'28'), (2, 13, N'29'), (4, 13, N'30'),
--dm4

-- Quần short nữ
(1, 14, N'S'), (2, 14, N'M'), (3, 14, N'L'),
-- Quần Short Baggy Jean Túi
(1, 15, N'S'), (2, 15, N'M'), (3, 15, N'L'), (4, 15, N'XL'),
-- Quần jeans short bò ống rộng
(1, 16, N'S'), (2, 16, N'M'), (3, 16, N'L'), (4, 16, N'XL'),
-- Quần short nữ jean cạp cao
(1, 17, N'S'), (2, 17, N'M'), (3, 17, N'L'), (4, 17, N'XL'),
-- Quần RUZI Baggy Jeans Short
(1, 18, N'S'), (2, 18, N'M'), (3, 18, N'L'), (4, 18, N'XL'),
--dm5

-- Váy Gân Hàn Quốc (Lụa)
(1, 19, N'S'), (2, 19, N'M'), (3, 19, N'L'), (4, 19, N'XL'),
-- Váy Gân Hàn Quốc (Lanh)
(1, 20, N'S'), (2, 20, N'M'), (3, 20, N'L'), (4, 20, N'XL'),
-- Đầm midi sơ mi thanh lịch
(1, 21, N'Freesize'),
-- Đầm váy maxi nữ cổ yếm
(1, 22, N'S'), (2, 22, N'M'), (3, 22, N'L'),
--dm6

-- Váy Kaki Trắng 2 Dây
(1, 23, N'S'), (2, 23, N'M'), (3, 23, N'L'),
-- Váy xếp ly
(1, 24, N'S'), (2, 24, N'M'), (3, 24, N'L'),
-- Váy Hai Dây Hoa Nhí
(1, 25, N'S'), (2, 25, N'M'), (3, 25, N'L'),
-- Váy sơ mi kẻ dáng ngắn
(1, 26, N'S'), (2, 26, N'M'), (3, 26, N'L'),
-- Váy sơ mi dáng dài
(1, 27, N'S'), (2, 27, N'M'), (3, 27, N'L'), (4, 27, N'XL'),

--Danh mục 7
-- Áo khoác jean nam nữ Unisex
(1, 31, N'S'), (2, 31, N'M'), (3, 31, N'L'), (4, 31, N'XL'), (5, 31, N'XXL'),
-- Áo khoác gió nam-nữ 2 lớp
(1, 32, N'S'), (2, 32, N'M'), (3, 32, N'L'),
-- Áo khoác gió nam cổ đứng
(1, 33, N'M'), (2, 33, N'L'), (3, 33, N'XL'), (4, 33, N'XXL'),
-- Áo khoác unisex lót lông cừu
(1, 34, N'L'), (2, 34, N'XL'), (3, 34, N'XXL'),
-- Áo khoác dù form rộng
(1, 35, N'M'), (2, 35, N'L'), (3, 35, N'XL'), (4, 35, N'XXL'),

--Danh mục 8
-- Áo len nam cổ tròn
(1, 36, N'M'), (2, 36, N'L'), (3, 36, N'XL'), (4, 36, N'XXL'), (5, 36, N'XXXL'),
-- RANMO áo len
(1, 37, N'S'), (2, 37, N'M'), (3, 37, N'L'),
-- Áo len đỏ giáng sinh
(1, 38, N'S'), (2, 38, N'M'), (3, 38, N'L'), (4, 38, N'XL'), (5, 38, N'XXL'),
-- Áo sweater sát nách cổ V
(1, 39, N'M'), (2, 39, N'L'), (3, 39, N'XL'), (4, 39, N'XXL'),
-- Áo Len Cổ V Dáng Dài (FreeSize)
(1, 40, N'FreeSize'),
--dm9
-- Áo Sweater Unisex MÈO KUTE
(1, 41, N'M'), (2, 41, N'L'), (3, 41, N'XL'),
-- Áo sweater nỉ hàn cổ tròn mềm mịn
(1, 42, N'FreeSize'),
-- Áo Sweater LaBuBu
(1, 43, N'M'), (2, 43, N'L'), (3, 43, N'XL'), (4, 43, N'XXL'),
-- Áo Sweater layer dáng Unisex
(1, 44, N'M'), (2, 44, N'L'), (3, 44, N'XL'),
-- Áo Sweater Dài Tay Unisex TEEDARK
(1, 45, N'M'), (2, 45, N'L'), (3, 45, N'XL'), (4, 45, N'XXL'),
--dm10
-- Quần Tây Nam Cao Cấp ORICANO
(1, 46, N'M'), (2, 46, N'L'), (3, 46, N'XL'), (4, 46, N'XXL'),
-- Quần Kaki Nam Nữ Ống Suông
(1, 47, N'L'), (2, 47, N'XL'), (3, 47, N'XXL'),
-- Quần tây nam hàn quốc JBagy
(1, 48, N'30'), (2, 48, N'31'), (3, 48, N'32'), (4, 48, N'33'),
-- Quần tây nam, Quần âu nam hàn quốc
(1, 49, N'28'), (2, 49, N'29'), (3, 49, N'30'), (4, 49, N'31'),
-- Quần Dài Nam Vải Chống Nhăn
(1, 50, N'29'), (2, 50, N'30'), (3, 50, N'31'), (4, 50, N'32'), (5, 50, N'33'),
--dm11
-- Áo Blazer Nam Dài Form Rộng
(1, 51, N'L'), (2, 51, N'XL'),
-- ÁO KHOÁC NAM VEST NAM CAO CẤP
(1, 52, N'M'), (2, 52, N'L'), (3, 52, N'XL'), (4, 52, N'XXL'),
-- Áo Vest blazer dáng suông
(1, 53, N'M'), (2, 53, N'L'),
-- Áo khoác dài cổ Vest, form rộng
(1, 54, N'M'), (2, 54, N'L'), (3, 54, N'XL'),
-- Áo blazer nữ tay dài KAMONG
(1, 55, N'S'), (2, 55, N'M'),
--dm12
-- Áo Hoodie thêu chữ basic nam nữ
(1, 56, N'M'), (2, 56, N'L'), (3, 56, N'XL'),
-- Áo hoodie unisex form rộng WIND CAPYBARA
(1, 57, N'M'), (2, 57, N'L'), (3, 57, N'XL'),
-- Áo Hoodie Nam Nữ From Rộng APT Unisex
(1, 58, N'M'), (2, 58, N'L'), (3, 58, N'XL'), (4, 58, N'XXL'),
-- Áo hoodie nam nữ ANYOUNG
(1, 59, N'M'), (2, 59, N'L'), (3, 59, N'XL'), (4, 59, N'XXL'),
-- Áo Hoodie nam nữ - Áo Khoác nỉ Ninja
(1, 60, N'M'), (2, 60, N'L'), (3, 60, N'XL'), (4, 60, N'XXL'),
--dm13
-- Quần Jogger Nam Nữ Trơn Basic
(1, 61, N'M'), (2, 61, N'L'), (3, 61, N'XL'), (4, 61, N'XXL'),
-- Quần Nỉ Tăm Jogger Nam Nữ
(1, 62, N'M'), (2, 62, N'L'), (3, 62, N'XL'), (4, 62, N'XXL'),
-- Quần Túi Hộp Nam Thời Trang Hiphop
(1, 63, N'M'), (2, 63, N'L'), (3, 63, N'XL'), (4, 63, N'XXL'),
-- Quần Ống Rộng Dáng Suông Unisex Quần Jogger Thể Thao
(1, 64, N'M'), (2, 64, N'L'), (3, 64, N'XL'), (4, 64, N'XXL'),
-- Quần suông dài (pants) nam nữ unisex basic
(1, 65, N'M'), (2, 65, N'L'), (3, 65, N'XL'),
--dm14
-- Bộ đồ ngủ nữ pijama dài tay
(1, 66, N'M'), (2, 66, N'L'), (3, 66, N'XL'),
-- Bộ Ngủ Cotton Gân Pijama Siêu Mát
(1, 67, N'M'), (2, 67, N'L'),
-- YAMI bộ đồ ngủ Tay áo dài cotton pijama đồ mặc nhà nữ
(1, 68, N'S'), (2, 68, N'M'), (3, 68, N'L'), (4, 68, N'XL'),
-- Bộ Đồ Ngủ Caro BY CHANN
(1, 69, N'S'), (2, 69, N'M'), (3, 69, N'L'), (4, 69, N'XL'),
-- Bộ đồ Lông Cừu Ngủ Lông Trắng Kem Tiểu Thư
(1, 70, N'FreeSize'),
--dm15
-- Áo Polo Phối cổ SPION
(1, 71, N'M'), (2, 71, N'L'), (3, 71, N'XL'),
-- Áo polo kéo khoá cổ nam nữ
(1, 72, N'S'), (2, 72, N'M'), (3, 72, N'L'), (4, 72, N'XL'),
-- Áo thun nam cổ bẻ phối màu
(1, 73, N'M'), (2, 73, N'L'), (3, 73, N'XL'), (4, 73, N'XXL'),
-- Áo Polo Nam Cooling 5S FASHION
(1, 74, N'S'), (2, 74, N'M'), (3, 74, N'L'), (4, 74, N'XL'),
-- Áo polo nữ TOLI
(1, 75, N'S'), (2, 75, N'M'), (3, 75, N'L'), (4, 75, N'XL');



--danh muc 1
INSERT INTO MauSac (MaMau, MaSanPham, TenMau, MaMauDangHex)
VALUES
-- Áo thun nam trắng
(1, 1, N'Trắng', '#FFFFFF'),
-- Áo Thun Unisex
(1, 2, N'Trắng', '#FFFFFF'), (2, 2, N'Đen', '#000000'),
-- Áo thun cổ tròn
(1, 3, N'Đen', '#000000'),
-- Áo Thun Local Brand
(1, 4, N'Đen', '#000000'), (2, 4, N'Trắng', '#FFFFFF'), (3, 4, N'Be', '#F5F5DC'), (4, 4, N'Xám', '#808080'),
--dm2
-- Áo sơ mi đũi nam cổ trụ
(1, 5, N'Xám', '#808080'), (2, 5, N'Vàng', '#FFFF00'),
-- Áo sơ mi nam tay ngắn
(1, 6, N'Xám', '#808080'), (2, 6, N'Vàng', '#FFFF00'),
-- Áo sơ mi trắng nam dài tay
(1, 7, N'Trắng', '#FFFFFF'), (2, 7, N'Đen', '#000000'),
-- Áo Sơ Mi Nam tay ngắn
(1, 8, N'Trắng', '#FFFFFF'),
-- Áo sơ mi nam nữ dài tay
(1, 9, N'Trắng', '#FFFFFF'), (2, 9, N'Đỏ', '#FF0000'),
--dm3

-- Quần jeans nam đen
(1, 10, N'Xám', '#808080'), (2, 10, N'Đen', '#000000'),
-- Quần jean nam ROWAY
(1, 11, N'Xanh', '#0000FF'), (2, 11, N'Đen', '#000000'),
-- Quần Jean PEALO Unisex
(1, 12, N'Xanh', '#0000FF'), (2, 12, N'Đen', '#000000'),
-- Quần jean nam ống rộng
(1, 13, N'Xanh', '#0000FF'), (2, 13, N'Đen', '#000000'), (3, 13, N'Trắng', '#FFFFFF'),
--dm4

-- Quần short nữ
(1, 14, N'Xanh', '#0000FF'), (2, 14, N'Vàng', '#FFFF00'), (3, 14, N'Xám', '#808080'),
-- Quần Short Baggy Jean Túi
(1, 15, N'Xanh', '#0000FF'), (2, 15, N'Đen', '#000000'),
-- Quần jeans short bò ống rộng
(1, 16, N'Đen', '#000000'),
-- Quần short nữ jean cạp cao
(1, 17, N'Xanh', '#0000FF'), (2, 17, N'Đen', '#000000'),
-- Quần RUZI Baggy Jeans Short
(1, 18, N'Xanh', '#0000FF'), (2, 18, N'Đen', '#000000'), (3, 18, N'Xám', '#808080'),
--dm5

-- Váy Gân Hàn Quốc (Lụa)
(1, 19, N'Đỏ', '#FF0000'), (2, 19, N'Tím', '#800080'), (3, 19, N'Hồng', '#FFC0CB'),
-- Váy Gân Hàn Quốc (Lanh)
(1, 20, N'Xanh', '#0000FF'), (2, 20, N'Hồng', '#FFC0CB'),
-- Đầm midi sơ mi thanh lịch
(1, 21, N'Xanh', '#0000FF'), (2, 21, N'Đen', '#000000'), (3, 21, N'Be', '#F5F5DC'), (4, 21, N'Nâu', '#A52A2A'),
-- Đầm váy maxi nữ cổ yếm
(1, 22, N'Xanh', '#0000FF'), (2, 22, N'Hồng', '#FFC0CB'),
--dm6

-- Váy Kaki Trắng 2 Dây
(1, 23, N'Trắng', '#FFFFFF'),
-- Váy xếp ly
(1, 24, N'Hồng', '#FF69B4'), (2, 24, N'Xanh', '#0000FF'), (3, 24, N'Vàng', '#FFFF00'),
-- Váy Hai Dây Hoa Nhí
(1, 25, N'Trắng', '#FFFFFF'), (2, 25, N'Be', '#F5F5DC'),
-- Váy sơ mi kẻ dáng ngắn
(1, 26, N'Xanh', '#0000FF'),
-- Váy sơ mi dáng dài
(1, 27, N'Xanh', '#0000FF'),

-- Danh mục 7

-- Áo khoác jean nam nữ Unisex
(1, 31, N'Đen', '#000000'), (2, 31, N'Xanh', '#0000FF'),
-- Áo khoác gió nam-nữ 2 lớp
(1, 32, N'Đen', '#000000'), (2, 32, N'Xanh', '#0000FF'),
-- Áo khoác gió nam cổ đứng
(1, 33, N'Đen', '#000000'), (2, 33, N'Xám', '#808080'),
-- Áo khoác unisex lót lông cừu
(1, 34, N'Đen', '#000000'), (2, 34, N'Trắng', '#FFFFFF'),
-- Áo khoác dù form rộng
(1, 35, N'Đen', '#000000'), (2, 35, N'Xanh rêu', '#556B2F'),
--Danh mục 8
-- Áo len nam cổ tròn
(1, 36, N'Nâu', '#A52A2A'), (2, 36, N'Xanh', '#0000FF'), (3, 36, N'Đen', '#000000'),
-- RANMO áo len
(1, 37, N'Trắng', '#FFFFFF'), (2, 37, N'Đỏ', '#FF0000'), (3, 37, N'Hồng', '#FFC0CB'),
-- Áo len đỏ giáng sinh
(1, 38, N'Đỏ', '#FF0000'),
-- Áo sweater sát nách cổ V
(1, 39, N'Đen', '#000000'), (2, 39, N'Trắng', '#FFFFFF'), (3, 39, N'Xám', '#808080'),
-- Áo Len Cổ V Dáng Dài
(1, 40, N'Hồng', '#FFC0CB'), (2, 40, N'Đỏ', '#FF0000'), (3, 40, N'Xanh', '#0000FF'),
--dm 9

-- Áo Sweater Unisex MÈO KUTE
(1, 41, N'Trắng', '#FFFFFF'), (2, 41, N'Đen', '#000000'), (3, 41, N'Be', '#F5F5DC'),
-- Áo sweater nỉ hàn cổ tròn mềm mịn
(1, 42, N'Be', '#F5F5DC'), (2, 42, N'Trắng', '#FFFFFF'), (3, 42, N'Xanh', '#0000FF'),
-- Áo Sweater LaBuBu
(1, 43, N'Trắng', '#FFFFFF'), (2, 43, N'Xám', '#808080'), (3, 43, N'Be', '#F5F5DC'),
-- Áo Sweater layer dáng Unisex
(1, 44, N'Trắng', '#FFFFFF'), (2, 44, N'Đen', '#000000'), (3, 44, N'Xanh', '#0000FF'),
-- Áo Sweater Dài Tay Unisex TEEDARK
(1, 45, N'Hồng', '#FFC0CB'), (2, 45, N'Đỏ', '#FF0000'), (3, 45, N'Xanh', '#0000FF'), (4, 45, N'Tím', '#800080'),
--dm 10

-- Quần Tây Nam Cao Cấp ORICANO
(1, 46, N'Trắng', '#FFFFFF'), (2, 46, N'Đen', '#000000'),
-- Quần Kaki Nam Nữ Ống Suông
(1, 47, N'Be', '#F5F5DC'), (2, 47, N'Đen', '#000000'), (3, 47, N'Trắng', '#FFFFFF'),
-- Quần tây nam hàn quốc JBagy
(1, 48, N'Trắng', '#FFFFFF'), (2, 48, N'Đen', '#000000'),
-- Quần tây nam, Quần âu nam hàn quốc
(1, 49, N'Đen', '#000000'), (2, 49, N'Xanh', '#0000FF'), (3, 49, N'Be', '#F5F5DC'),
-- Quần Dài Nam Vải Chống Nhăn
(1, 50, N'Đen', '#000000'), (2, 50, N'Xám', '#808080'),
--dm11

-- Áo Blazer Nam Dài Form Rộng
(1, 51, N'Đen', '#000000'), (2, 51, N'Xám', '#808080'),
-- ÁO KHOÁC NAM VEST NAM CAO CẤP
(1, 52, N'Đen', '#000000'), (2, 52, N'Xám', '#808080'),
-- Áo Vest blazer dáng suông
(1, 53, N'Đen', '#000000'), (2, 53, N'Xám', '#808080'), (3, 53, N'Nâu', '#8B4513'),
-- Áo khoác dài cổ Vest, form rộng
(1, 54, N'Đen', '#000000'), (2, 54, N'Xám', '#808080'),
-- Áo blazer nữ tay dài KAMONG
(1, 55, N'Đen', '#000000'), (2, 55, N'Xám', '#808080'), (3, 55, N'Nâu', '#8B4513'),
--dm12

-- Áo Hoodie thêu chữ basic nam nữ
(1, 56, N'Đen', '#000000'), (2, 56, N'Xám', '#808080'), (3, 56, N'Xanh', '#0000FF'),
-- Áo hoodie unisex form rộng WIND CAPYBARA
(1, 57, N'Đen', '#000000'), (2, 57, N'Xám', '#808080'), (3, 57, N'Trắng', '#FFFFFF'),
-- Áo Hoodie Nam Nữ From Rộng APT Unisex
(1, 58, N'Đen', '#000000'), (2, 58, N'Xám', '#808080'), (3, 58, N'Trắng', '#FFFFFF'),
-- Áo hoodie nam nữ ANYOUNG
(1, 59, N'Xám', '#808080'), (2, 59, N'Trắng', '#FFFFFF'),
-- Áo Hoodie nam nữ - Áo Khoác nỉ Ninja
(1, 60, N'Đen', '#000000'), (2, 60, N'Xám', '#808080'),
--dm13

-- Quần Jogger Nam Nữ Trơn Basic
(1, 61, N'Đen', '#000000'), (2, 61, N'Xám', '#808080'),
-- Quần Nỉ Tăm Jogger Nam Nữ
(1, 62, N'Đen', '#000000'), (2, 62, N'Xám', '#808080'),
-- Quần Túi Hộp Nam Thời Trang Hiphop
(1, 63, N'Đen', '#000000'), (2, 63, N'Trắng', '#FFFFFF'),
-- Quần Ống Rộng Dáng Suông Unisex Quần Jogger Thể Thao
(1, 64, N'Đen', '#000000'), (2, 64, N'Xám', '#808080'), (3, 64, N'Trắng', '#FFFFFF'),
-- Quần suông dài (pants) nam nữ unisex basic
(1, 65, N'Đen', '#000000'), (2, 65, N'Xám', '#808080'), (3, 65, N'Trắng', '#FFFFFF'),
--dm14
-- Bộ đồ ngủ nữ pijama dài tay
(1, 66, N'Đen', '#000000'), (2, 66, N'Xám', '#808080'), (3, 66, N'Trắng', '#FFFFFF'), (4, 66, N'Be', '#F5F5DC'),
-- Bộ Ngủ Cotton Gân Pijama Siêu Mát
(1, 67, N'Đen', '#000000'), (2, 67, N'Trắng', '#FFFFFF'),
-- YAMI bộ đồ ngủ Tay áo dài cotton pijama đồ mặc nhà nữ
(1, 68, N'Trắng', '#FFFFFF'), (2, 68, N'Hồng', '#FFC0CB'),
-- Bộ Đồ Ngủ Caro BY CHANN
(1, 69, N'Xanh', '#0000FF'), (2, 69, N'Hồng', '#FFC0CB'),
-- Bộ đồ Lông Cừu Ngủ Lông Trắng Kem Tiểu Thư
(1, 70, N'Trắng', '#FFFFFF'),
--dm15
-- Áo Polo Phối cổ SPION
(1, 71, N'Trắng', '#FFFFFF'),
-- Áo polo kéo khoá cổ nam nữ
(1, 72, N'Trắng', '#FFFFFF'), (2, 72, N'Đen', '#000000'),
-- Áo thun nam cổ bẻ phối màu
(1, 73, N'Đen', '#000000'), (2, 73, N'Trắng', '#FFFFFF'),
-- Áo Polo Nam Cooling 5S FASHION
(1, 74, N'Xanh', '#0000FF'), (2, 74, N'Trắng', '#FFFFFF'),
-- Áo polo nữ TOLI
(1, 75, N'Hồng', '#FFC0CB'), (2, 75, N'Xám', '#808080'), (3, 75, N'Trắng', '#FFFFFF');


INSERT INTO HinhAnhSanPham (MaHinhAnh, MaSanPham, DuongDanHinh, MoTaHinh)
VALUES
--dm1
(1, 1, N'https://cdn0375.cdn4s.com/media/ad1-t222n/z3247472567912_31a535fcadd237b49941a4610368c329.jpg', N'Hình ảnh Áo thun nam trắng'),
(2, 2, N'https://raw.githubusercontent.com/Cyberproton/tmdt-frontend/refs/heads/master/src/assets/item-big-1.png', N'Hình ảnh Áo Thun Unisex'),
(3, 3, N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lqyiaxx5cuys08.webp', N'Hình ảnh Áo thun cổ tròn'),
(4, 4, N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lyxeqjjw1fm5a1', N'Hình ảnh Áo Thun Local Brand'),
--dm2
(5, 5, N'https://down-vn.img.susercontent.com/file/vn-11134207-7qukw-lk0q6n7nifn886', N'Hình ảnh Áo sơ mi đũi nam cổ trụ'),
(6, 6, N'https://down-vn.img.susercontent.com/file/vn-11134207-7ras8-m31nv7ix7t9sf2', N'Hình ảnh Áo sơ mi nam tay ngắn'),
(7, 7, N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lt3dim7jdm6x41', N'Hình ảnh Áo sơ mi trắng nam dài tay'),
(8, 8, N'https://down-vn.img.susercontent.com/file/cn-11134207-7r98o-lwzdkkdo1vt14f', N'Hình ảnh Áo Sơ Mi Nam tay ngắn'),
(9, 9, N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lq0fjis4q8mvd2', N'Hình ảnh Áo sơ mi nam nữ dài tay'),
--dm3

(10, 10, N'https://quanjeandep.com/images/thumbs/quan-jean-nam-dang-slim-fit-mau-den-tuyen-10930.jpeg', N'Hình ảnh Quần jeans nam đen'),
(11, 11, N'https://down-vn.img.susercontent.com/file/vn-11134207-7ras8-m1349gam0pzzc3', N'Hình ảnh Quần jean nam ROWAY'),
(12, 12, N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lq4lafsypmmq99', N'Hình ảnh Quần Jean PEALO Unisex'),
(13, 13, N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lxax5je98cezc9', N'Hình ảnh Quần jean nam ống rộng'),
--dm4

(14, 14, N'https://namandco.com/wp-content/uploads/2022/06/1-2-scaled.jpg', N'Hình ảnh Quần short nữ'),
(15, 15, N'https://down-vn.img.susercontent.com/file/vn-11134207-7ras8-m2m1ump4lwoqe8', N'Hình ảnh Quần Short Baggy Jean Túi'),
(16, 16, N'https://down-vn.img.susercontent.com/file/vn-11134207-7ras8-m13xjr3brpfe74', N'Hình ảnh Quần jeans short bò ống rộng'),
(17, 17, N'https://down-vn.img.susercontent.com/file/sg-11134201-7renx-m1s5a5st012u6d', N'Hình ảnh Quần short nữ jean cạp cao'),
(18, 18, N'https://down-vn.img.susercontent.com/file/sg-11134201-7rd6l-luindd4uyfo603', N'Hình ảnh Quần RUZI Baggy Jeans Short'),
--dm5

(19, 19, N'https://maxi.vn/wp-content/uploads/2022/08/z3630250901829_582cbfc8a4ea5ddbb063bd8b2ec6903e-scaled.jpg', N'Hình ảnh Váy Gân Hàn Quốc (Lụa)'),
(20, 20, N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-m02gryraalm55c', N'Hình ảnh Váy Gân Hàn Quốc (Lanh)'),
(21, 21, N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lu3cipyg5r8131', N'Hình ảnh Đầm midi sơ mi thanh lịch'),
(22, 22, N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lsjq3mocw8ucd5', N'Hình ảnh Đầm váy maxi nữ cổ yếm'),
--dm6

(23, 23, N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lv1pq9yz1mnt2d', N'Hình ảnh Váy Kaki Trắng 2 Dây'),
(24, 24, N'https://cdn.becungshop.vn/images/500x500/chan-vay-xep-ly-nang-dong-cho-be-gai-p25311db1d3782-500x500.jpg', N'Hình ảnh Váy xếp ly'),
(25, 25, N'https://down-vn.img.susercontent.com/file/ec1ed3bc99885e70161863c0cfe620df', N'Hình ảnh Váy Hai Dây Hoa Nhí'),
(26, 26, N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lsrtna53vnpg04', N'Hình ảnh Váy sơ mi kẻ dáng ngắn'),
(27, 27, N'https://down-vn.img.susercontent.com/file/vn-11134207-7qukw-li7348nzdpzm32', N'Hình ảnh Váy sơ mi dáng dài'),

-- Danh mục 7
(31, 31, N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lyrq471t7znx6b.webp', N'Hình ảnh Áo Khoác jean nam nữ Unisex'),
(32, 32, N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lnstrs6kidtm32.webp', N'Hình ảnh Áo khoác gió nam-nữ 2 lớp'),
(33, 33, N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lo2zlqcmsy9m39.webp', N'Hình ảnh Áo khoác gió nam cổ đứng Ecollect'),
(34, 34, N'https://down-vn.img.susercontent.com/file/a2ebfb09d71edcaa3fa85bd4c38244a0.webp', N'Hình ảnh Áo khoác unisex lót lông cừu'),
(35, 35, N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-ly1r5qe4gd7d43.webp', N'Hình ảnh Áo khoác dù nam nữ form rộng có lót lụa'),
--DM8
(36,36, N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-loh5si76c4hj29.webp', N'Hình ảnh Áo len nam cổ tròn kiểu dáng hàn quốc'),
(37, 37, N'https://down-vn.img.susercontent.com/file/sg-11134201-7rdyx-lxhxb0o8p33d6a.webp', N'Hình ảnh RANMO áo len áo cardigan khoác tingoan'),
(38, 38, N'https://down-vn.img.susercontent.com/file/sg-11134201-7rdvp-m12hznawfuuh77.webp', N'Hình ảnh Áo len đỏ giáng sinh tết thu đông dệt kim nữ'),
(39, 39, N'https://down-vn.img.susercontent.com/file/cn-11134207-7r98o-lsm4mq1i5igd47.webp', N'Hình ảnh Áo sweater sát nách cổ V'),
(40, 40, N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-ll3viisc42q0be.webp', N'Hình ảnh Áo Len Cổ V Dáng Dài From Rộng Phong Cách Hàn'),
--dm 9

(41, 41, N'https://down-vn.img.susercontent.com/file/vn-11134207-7ras8-m0l2l9pkaopb17.webp', N'Hình ảnh Áo Sweater Unisex MÈO KUTE'),
(42, 42, N'https://down-vn.img.susercontent.com/file/vn-11134207-7qukw-lkc6cklmlqjs96.webp', N'Hình ảnh Áo sweater nỉ hàn cổ tròn mềm mịn'),
(43, 43, N'https://down-vn.img.susercontent.com/file/vn-11134207-7ras8-m0l09rkf15zjf8.webp', N'Hình ảnh Áo Sweater LaBuBu'),
(44, 44, N'https://down-vn.img.susercontent.com/file/34ba40b96f378878a895c7c02ad074e7.webp', N'Hình ảnh Áo Sweater layer dáng Unisex chất liệu nỉ bông trẻ trung'),
(45, 45, N'https://down-vn.img.susercontent.com/file/vn-11134207-7ras8-m0e72of0hey5e0.webp', N'Hình ảnh Áo Sweater Dài Tay Unisex TEEDARK'),
--dm 10

(46, 46, N'https://down-vn.img.susercontent.com/file/vn-11134207-7ras8-m3abtfcey7l861.webp', N'Hình ảnh Quần Tây Nam Cao Cấp ORICANO'),
(47, 47, N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lkunwaygkfcwce.webp', N'Hình ảnh Quần Kaki Nam Nữ Ống Suông'),
(48, 48, N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lqyje5agauft09.webp', N'Hình ảnh Quần tây nam hàn quốc JBagy'),
(49, 49, N'https://down-vn.img.susercontent.com/file/vn-11134207-7ras8-m1pelx9unyhf96.webp', N'Hình ảnh Quần tây nam, Quần âu nam hàn quốc'),
(50, 50, N'https://down-vn.img.susercontent.com/file/39b4eadf5daded054aa8d675df58febe.webp', N'Hình ảnh Quần Dài Nam Vải Chống Nhăn'),
--dm 11
(51, 51, N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lu1hmuef1qfzf7.webp', N'Hình ảnh Áo Blazer Nam Dài Form Rộng'),
(52, 52, N'https://down-vn.img.susercontent.com/file/vn-11134207-7ras8-m39gjo5pqhnwa3.webp', N'Hình ảnh ÁO KHOÁC NAM VEST NAM CAO CẤP'),
(53, 53, N'https://down-vn.img.susercontent.com/file/vn-11134207-7qukw-lk69a4cejc3ma4.webp', N'Hình ảnh Áo Vest blazer dáng suông'),
(54, 54, N'https://down-vn.img.susercontent.com/file/35928e0f7df9dc9e6c4845af701b8b64.webp', N'Hình ảnh Áo khoác dài cổ Vest, form rộng'),
(55, 55, N'https://down-vn.img.susercontent.com/file/51d5d3c1176f7f6553064ad7cce6f597.webp', N'Hình ảnh Áo blazer nữ tay dài KAMONG'),
--dm12

(56, 56, N'https://down-vn.img.susercontent.com/file/f80d32165e4212e25193757f6cde3048.webp', N'Hình ảnh Áo Hoodie thêu chữ basic nam nữ'),
(57, 57, N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lzgesngg5z650e.webp', N'Hình ảnh Áo hoodie unisex form rộng WIND CAPYBARA'),
(58, 58, N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lkjq3ktvqlt6e9.webp', N'Hình ảnh Áo Hoodie Nam Nữ From Rộng APT Unisex'),
(59, 59, N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lo58759d487f8b.webp', N'Hình ảnh Áo hoodie nam nữ ANYOUNG'),
(60, 60, N'https://down-vn.img.susercontent.com/file/vn-11134211-7r98o-lp2pr7vvwy8r17.webp', N'Hình ảnh Áo Hoodie nam nữ - Áo Khoác nỉ Ninja'),
--dm13

(61, 61, N'https://down-vn.img.susercontent.com/file/vn-11134207-7ras8-m34oarednf6j08.webp', N'Hình ảnh Quần Jogger Nam Nữ Trơn Basic'),
(62, 62, N'https://down-vn.img.susercontent.com/file/vn-11134207-7ras8-m0ikrys1n9ppf3.webp', N'Hình ảnh Quần Nỉ Tăm Jogger Nam Nữ'),
(63, 63, N'https://down-vn.img.susercontent.com/file/cn-11134207-7r98o-ly3662qmp4pv87.webp', N'Hình ảnh Quần Túi Hộp Nam Thời Trang Hiphop'),
(64, 64, N'https://down-vn.img.susercontent.com/file/vn-11134258-7ras8-m36qiu2gehnwd2.webp', N'Hình ảnh Quần Ống Rộng Dáng Suông Unisex Quần Jogger Thể Thao'),
(65, 65, N'https://down-vn.img.susercontent.com/file/fa4514a0f8f5d4893bdf39b840aee965.webp', N'Hình ảnh Quần suông dài (pants) nam nữ unisex basic'),
--dm14

(66, 66, N'https://down-vn.img.susercontent.com/file/sg-11134201-23020-cge78wzh45mv0a.webp', N'Hình ảnh Bộ đồ ngủ nữ pijama dài tay'),
(67, 67, N'https://down-vn.img.susercontent.com/file/sg-11134201-22100-qnkgmmztsajv79.webp', N'Hình ảnh Bộ Ngủ Cotton Gân Pijama Siêu Mát'),
(68, 68, N'https://down-vn.img.susercontent.com/file/cn-11134207-7ras8-m0igsidn2y13ea.webp', N'Hình ảnh YAMI bộ đồ ngủ Tay áo dài cotton pijama đồ mặc nhà nữ'),
(69, 69, N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-m01h8s65r2q7e7.webp', N'Hình ảnh Bộ Đồ Ngủ Caro BY CHANN'),
(70, 70, N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lzyjmegs9idp78.webp', N'Hình ảnh Bộ đồ Lông Cừu Ngủ Lông Trắng Kem Tiểu Thư'),
--dm15

(71, 71, N'https://down-vn.img.susercontent.com/file/vn-11134207-7qukw-lk3sucbx6yt0cb@resize_w450_nl.webp', N'Hình ảnh Áo Polo Phối cổ SPION'),
(72, 72, N'https://down-vn.img.susercontent.com/file/vn-11134207-7qukw-lh07bate0cfnb6.webp', N'Hình ảnh Áo polo kéo khoá cổ nam nữ'),
(73, 73, N'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lp7kk95uk76621.webp', N'Hình ảnh Áo thun nam cổ bẻ phối màu'),
(74, 74, N'https://down-vn.img.susercontent.com/file/vn-11134207-7ras8-m3a0hq5h7cpt2d.webp', N'Hình ảnh Áo Polo Nam Cooling 5S FASHION'),
(75, 75, N'https://down-vn.img.susercontent.com/file/vn-11134207-7ras8-m2hlqs8xi302f1.webp', N'Hình ảnh Áo polo nữ TOLI');
