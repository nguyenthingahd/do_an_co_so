SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


CREATE DATABASE IF NOT EXISTS `laptop_shop` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `laptop_shop`;


CREATE TABLE `catalog` (
  `idCat` int(11) NOT NULL,
  `nameCat` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `catalog` (`idCat`, `nameCat`) VALUES
(1, 'Apple'),
(2, 'HP'),
(3, 'Dell'),
(4, 'ASUS'),
(5, 'Lenovo'),
(6, 'MSI'),
(7, 'Microsoft'),
(8, 'Acer');


CREATE TABLE `product` (
  `idProduct` int(11) NOT NULL,
  `nameProduct` varchar(50) DEFAULT NULL,
  `amountProduct` int(11) DEFAULT NULL,
  `S` tinyint(1) DEFAULT 1,
  `M` tinyint(1) DEFAULT 1,
  `L` tinyint(1) DEFAULT 1,
  `imgProduct` varchar(250) DEFAULT NULL,
  `priceProduct` double DEFAULT NULL,
  `dateUpdate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `desProduct` varchar(4000) DEFAULT NULL,
  `idCat` int(11) DEFAULT NULL,
  `showHide` tinyint(1) DEFAULT NULL,
  `views` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `product` (`idProduct`, `nameProduct`, `amountProduct`, `S`, `M`, `L`, `imgProduct`, `priceProduct`, `dateUpdate`, `desProduct`, `idCat`, `showHide`, `views`) VALUES
(1, 'Macbook Pro 16 M1 Max 10 CPU - 32 GPU 32GB 1TB 202', 10, 1, 1, 1, 'img/agv1.jpg', 76990000, '2022-12-04 12:52:40', 'Macbook Pro 16 M1 Max – Thiết kế sang trọng, hiệu năng vượt trội\r\nKhông chỉ là điểm nhận biết trên các thiết bị smartphone, hiện nay tai thỏ đã xuất hiện trên thế hệ Macbook mới nhất. Macbook Pro 16 M1 Max với thiết kế độc đáo, màn hình chất lượng mang lại trải nghiệm vượt  trội. Máy tính Macbook Pro 16 inch 2021 được trang bị cấu hình cực khủng với chip Apple M1 Max với 10CPU, 32GPU đi kèm dung lượng lên đến RAM 32GB và bộ nhớ SSD 1TB mang lại hiệu suất vượt trội.\r\n\r\nMàn hình tai thỏ, màn hình rõ nét\r\nMacbook Pro 16 M1 Max 10 CPU 2021 khiến ai nấy đều bất ngờ với màn hình không viền ấn tượng, nhưng để đặt cụm camera, Apple buộc phải đặt một cụm tai thỏ cho sản phẩm.\r\n\r\nVề cấu hình trên màn hình, chúng ta có những thông số siêu khủng. Với độ phân cao cùng tấm nền Liquid Retina, có khả năng hiển thị màu sắc rực rỡ nhưng tiết kiệm được năng lượng.', 1, 1, 100),
(2, 'Laptop HP 15 DY2089MS', 10, 1, 1, 1, 'img/shoei1.jpg', 18990000, '2022-12-04 13:40:21', 'Laptop HP 15-DY2089MS – Thiết kế sang trọng, hiệu năng mạnh mẽ\r\nThiết kế gọn nhẹ, chắc chắn\r\nChip Intel thế hệ thứ 11 cùng RAM 12 GB mạnh mẽ', 2, 1, 5),
(3, 'Laptop Dell Inspiron 15 3515 G6GR72', 10, 1, 1, 1, 'img/arai1.jpg', 12490000, '2022-12-04 13:22:00', 'AMD Ryzen 5-3450U - AMD Radeon Graphics: Giải trí tuyệt vời với các tựa game nhẹ nhàng hay lướt web xem phim\r\nRam 8GB, SSD 256GB - Khởi động ứng dụng nhanh chóng, đa nhiệm mượt mà.\r\nKhả năng hiển thị rực rỡ - màn hình chuẩn 15.6 inch, độ phân giải HD.\r\nĐa dạng các cổng kết nối: cổng HDMI 1.4, cổng USB C,...dễ truyền hoặc xuất dữ liệu với nhiều thiết bị khác nhau.\r\nNăng lượng bất tận cả ngày với viên pin 3-cell, 41Wh.\r\nThiết kế mỏng nhẹ - chỉ 1,69 kg, đồng hành cùng bạn khắp mọi nơi.\r\nMáy đi kèm Windows 11 bản quyền.', 3, 1, 50),
(4, ' Laptop ASUS VivoBook X1502ZA-BQ127', 5, 1, 1, 1, 'img/torc1.jpg', 17190000, '2022-12-04 13:42:35', 'Chip intel core i5 thế hệ 12 - Xử lý tốt mọi tác vụ từ làm việc đến giải trí\r\n8GB ram, 512GB SSD - Khởi động ứng dụng nhanh chóng, đa nhiệm tốt\r\nHệ thống tản nhiệt 2 ống đồng - mát mẻ khi xử lý mọi tác vụ\r\nMàn hình NanoEdge viền mỏng - giảm ánh sáng xanh, bảo vệ mắt tốt hơn', 4, 1, 0),
(5, ' Laptop Lenovo ThinkBook15p IMH', 2, 1, 1, 1, 'img/yohe1.jpg', 15990000, '2022-12-04 13:52:48', 'Laptop Lenovo Thinkbook 15p IMH - Laptop đa năng với khung hình bắt mắt\r\nKhả năng hoạt động bền bỉ với bộ cấu hình ấn tượng\r\nKhung hình rộng với hình ảnh bắt mắt, rực rỡ', 5, 1, 0),
(6, 'Laptop MSI Modern A5M 239VN', 3, 1, 1, 1, 'img/kyt1.jpg', 15790000, '2022-12-04 13:55:23', 'Chip R7-5700U cùng card AMD Radeon Graphics - Hiệu năng hàng đầu, chiến tốt cả các tựa game Esport như LOL, Fifa\r\nRam 8GB + 1 khe trống cho phép nâng cấp tối đa đến 64GB, ổ cứng SSD 512GB - Thoả sức đa nhiệm\r\nMàn hình 15.6 inch độ phân giải Full HD mang lại chất lượng hiển thị sắc nét.\r\nSiêu bền bỉ - Độ bền chuẩn quân đội MIL-STD-810G.\r\nTrọng lượng 1.6 kg thuận tiện di chuyển, mang theo.\r\nMáy đi kèm Windows 11 bản quyền.', 6, 1, 0),
(7, 'Surface Pro 8 Core i5 / 8GB / 128GB', 5, 1, 1, 1, 'img/royal1.jpg', 24490000, '2022-12-04 13:57:58', 'Microsoft Surface Pro 8 – Thương hiệu laptop chất lượng\r\nĐược mệnh danh là \"chiếc Surface Pro mạnh nhất đến nay\", Microsoft Surface Pro 8 kết hợp giữa sức mạnh của một chiếc laptop và tính linh hoạt của một chiếc máy tính bảng để cho ra thiết bị công nghệ dẫn đầu xu hướng, giúp phục vụ tất cả công việc của bạn một cách hiệu quả.', 7, 1, 0),
(8, 'Laptop Acer Aspire A515 57 52Y2', 6, 1, 1, 1, 'img/ls21.jpg', 17490000, '2022-12-04 13:59:28', 'Laptop Acer Aspire 5 A515-57-52Y2 - Hiệu năng hấp dẫn, sử dụng tiện lợi\r\nĐược chế tác cho nhu cầu làm việc từ xa cũng như giải trí tiện lợi, laptop Acer Aspire 5 A515-57-52Y2 tích hợp vi xử lý Intel Gen 12 cùng bộ nhớ lưu trữ cao bên trong thân máy gọn nhẹ giúp làm nên chiếc laptop văn phòng kiêm laptop sinh viên tuyệt vời trong tầm giá.', 8, 1, 0),
(9, ' Apple MacBook Pro 13 Touch Bar M1 256GB 2020', 10, 0, 1, 1, 'img/agv2.jpg', 27590000, '2022-12-04 13:11:48', 'Xử lý đồ hoạ mượt mà - Chip M1 cho phép thao tác trên các phần mềm AI, Photoshop, Render Video, phát trực tiếp ở độ phân giải 4K\r\nChất lượng hiển thị sắc nét - Độ phân giải retina màu sắc rực rỡ, tấm nền IPS cho góc nhìn 178 độ\r\nBảo mật cao - Trang bị cảm biến vân tay cho phép mở máy chỉ với 1 chạm\r\nMỏng nhẹ cao cấp - Mỏng chỉ 15.6mm, trọng lượng chỉ 1.4kg đồng hành cùng bạn mọi lúc mọi nơi\r\nCảm giác gõ thoải mái - Bàn phím magic khắc phục hầu hết các nhược điểm củ thế hệ trước', 1, 1, 7),
(10, 'Apple Macbook Pro 13 M2 2022 8GB 256GB ', 4, 0, 1, 1, 'img/agv3.jpg', 30590000, '2022-12-04 13:13:26', 'Macbook Pro M2 2022 là phiên bản nâng cấp mạnh mẽ của Macbook Pro M1 với nhiều cải tiến vô cùng ấn tượng. Đây sẽ là chiếc laptop mang đến cho người dùng trải nghiệm cực tốt. Từ đó giúp mọi hoạt động giải trí cũng như các công việc nặng như đồ họa, thiết kế đều được xử lý một cách mượt mà và nhanh chóng hơn.', 1, 1, 2),
(11, 'Apple MacBook Air M1 256GB 2020 ', 3, 1, 1, 0, 'img/agv4.jpg', 22690000, '2022-12-04 13:16:01', 'Phù hợp cho lập trình viên, thiết kế đồ họa 2D, dân văn phòng\r\nHiệu năng vượt trội - Cân mọi tác vụ từ word, exel đến chỉnh sửa ảnh trên các phần mềm như AI, PTS\r\nĐa nhiệm mượt mà - Ram 8GB cho phép vừa mở trình duyệt để tra cứu thông tin, vừa làm việc trên phần mềm\r\nTrang bị SSD 256GB - Cho thời gian khởi động nhanh chóng, tối ưu hoá thời gian load ứng dụng\r\nChất lượng hình ảnh sắc nét - Màn hình Retina cao cấp cùng công nghệ TrueTone cân bằng màu sắc\r\nThiết kế sang trọng - Nặng chỉ 1.29KG, độ dày 16.1mm. Tiện lợi mang theo mọi nơi\r\n', 1, 1, 8),
(12, 'Apple MacBook Air 13 512GB 2020', 4, 0, 1, 0, 'img/agv5.jpg', 26690000, '2022-12-04 13:19:13', 'Phù hợp cho lập trình viên, thiết kế đồ họa 2D, dân văn phòng\r\nHiệu năng vượt trội - Cân mọi tác vụ từ word, exel đến chỉnh sửa ảnh trên các phần mềm như AI, PTS\r\nĐa nhiệm mượt mà - Ram 8GB cho phép vừa mở trình duyệt để tra cứu thông tin, vừa làm việc trên phần mềm\r\nTrang bị SSD 256GB - Cho thời gian khởi động nhanh chóng, tối ưu hoá thời gian load ứng dụng\r\nChất lượng hình ảnh sắc nét - Màn hình Retina cao cấp cùng công nghệ TrueTone cân bằng màu sắc\r\nThiết kế sang trọng - Nặng chỉ 1.29KG, độ dày 16.1mm. Tiện lợi mang theo mọi nơi', 1, 1, 2),
(13, 'Laptop Dell Inspiron 7506-5903SLV', 3, 1, 1, 1, 'img/arai2.jpg', 18990000, '2022-12-04 13:24:28', 'Màn hình 15.6 inch cho góc nhìn rộng hơn cùng công nghệ Anti Glare hạn chế tình trạng chói, lóa.\r\nCPU Intel Core i5-1135G7 cho khả năng xử lý nhanh gọn, hiệu quả các tác vụ văn phòng.\r\nCard đồ họa Intel Iris Xe graphics đáp ứng đầy đủ nhu cầu lướt web, xem phim, thiết kế cơ bản trên Photoshop, Canva,...\r\nLaptop RAM 8 GB cho phép mở hàng loạt cửa sổ trình duyệt cùng lúc.\r\nMáy được trang bị đầy đủ cổng kết nối phổ biến như: USB Type-A, USB Type-C, HDMI,... giúp chia sẻ thông tin hay truyền tải dữ liệu nhanh chóng.\r\nHỗ trợ kết nối không dây Bluetooth và Wi-Fi 6 802.11AX, 802.11AC mang đến tốc độ truyền tải cao, đảm bảo đường truyền ổn định.', 3, 1, 22),
(14, 'Laptop Dell Inspiron 3501 70253897', 7, 0, 0, 1, 'img/arai3.jpg', 20590000, '2022-12-04 13:38:20', 'Chip Core i5-1135G7 tiết kiệm pin, hiệu năng ổn định thích hợp làm văn phòng.\r\nỔ cứng Ram 8GB ,SSD 512GB - Không lo tràn ram hay khởi động máy chậm khi sử dụng\r\nMàn hình với độ phân giải cao cùng lớp phủ chống chói - Hiển thị tốt trong nhiều điều kiện ánh sáng khác nhau.\r\nTích hợp webcam HD cho phép đàm thoại thông qua video thoải mái.\r\nNăng lượng bất tận cả ngày với viên pin 3Cell 42WHrs.\r\nThiết kế mỏng nhẹ - chỉ 1.96 kg, đồng hành cùng bạn khắp mọi nơi.\r\nMáy đi kèm Windows 10 bản quyền.', 3, 1, 100),
(15, ' Laptop ASUS ZenBook UM5302TA-LX087W', 100, 1, 1, 1, 'img/torc2.jpg', 26990000, '2022-12-04 13:46:55', 'Thiết kế sang trọng với vỏ nhôm, nặng chỉ 1.1kg\r\nMở khoá chỉ với 1 chạm, trang bị bảo mật vân tay\r\n8GB Ram onboard, hoạt động mượt mà, xử lý tốt các tác vụ văn phòng\r\n512GB SSD - khởi động máy, mở ứng dụng nhanh chóng\r\n\r\nSSD 512 GB - Tăng tốc toàn diện và khởi động trong tích tắt\r\n\r\nMàn hình 14.2 inch Liquid Retina XDR (3024 x 1964) chất lượng hiển thị vô cùng sắc nét', 4, 1, 300);



CREATE TABLE `user` (
  `idUser` int(11) NOT NULL,
  `ho` varchar(50) NOT NULL,
  `ten` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` double DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


ALTER TABLE `catalog`
  ADD PRIMARY KEY (`idCat`);


ALTER TABLE `product`
  ADD PRIMARY KEY (`idProduct`),
  ADD KEY `idCat` (`idCat`);

ALTER TABLE `user`
  ADD PRIMARY KEY (`idUser`);

ALTER TABLE `catalog`
  MODIFY `idCat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;


ALTER TABLE `product`
  MODIFY `idProduct` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

ALTER TABLE `user`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;


ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`idCat`) REFERENCES `catalog` (`idCat`);

