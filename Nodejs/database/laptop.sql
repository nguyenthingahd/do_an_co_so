-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 04, 2022 at 03:21 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fullface_shop`
--
CREATE DATABASE IF NOT EXISTS `laptop_shop` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `laptop_shop`;

-- --------------------------------------------------------

--
-- Table structure for table `catalog`
--

CREATE TABLE `catalog` (
  `idCat` int(11) NOT NULL,
  `nameCat` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `catalog`
--

INSERT INTO `catalog` (`idCat`, `nameCat`) VALUES
(1, 'Apple'),
(2, 'HP'),
(3, 'Dell'),
(4, 'ASUS'),
(5, 'Lenovo'),
(6, 'MSI'),
(7, 'Microsoft'),
(8, 'Acer');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `idComment` int(11) NOT NULL,
  `content` varchar(255) NOT NULL,
  `ten` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `date` datetime NOT NULL,
  `rating` int(11) NOT NULL,
  `idProduct` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`idComment`, `content`, `ten`, `email`, `date`, `rating`, `idProduct`) VALUES
(1, 'Thiết kế sang trọng, gọn nhẹ tuy nhiên giá cao', 'Hoàng Minh Thu', 'minhthu@gmail.com', '2022-12-04 20:06:37', 5, 1),
(2, 'Thiết kế cứng cáp, mức giá khá tốt, rất phù hợp với học sinh – sinh viên', 'Nguyễn Nga', 'nguyennga0302002@gmail.com', '2022-12-01 23:03:11', 5, 5),
(3, 'asd', 'asd', 'kenbi.njr@gmail.cm', '2021-03-01 22:32:55', 5, 4);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

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

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`idProduct`, `nameProduct`, `amountProduct`, `S`, `M`, `L`, `imgProduct`, `priceProduct`, `dateUpdate`, `desProduct`, `idCat`, `showHide`, `views`) VALUES
(1, 'Macbook Pro 16 M1 Max 10 CPU - 32 GPU 32GB 1TB 202', 10, 1, 1, 1, 'img/agv1.jpg', 76990000, '2022-12-04 12:52:40', 'Macbook Pro 16 M1 Max – Thiết kế sang trọng, hiệu năng vượt trội\r\nKhông chỉ là điểm nhận biết trên các thiết bị smartphone, hiện nay tai thỏ đã xuất hiện trên thế hệ Macbook mới nhất. Macbook Pro 16 M1 Max với thiết kế độc đáo, màn hình chất lượng mang lại trải nghiệm vượt  trội. Máy tính Macbook Pro 16 inch 2021 được trang bị cấu hình cực khủng với chip Apple M1 Max với 10CPU, 32GPU đi kèm dung lượng lên đến RAM 32GB và bộ nhớ SSD 1TB mang lại hiệu suất vượt trội.\r\n\r\nMàn hình tai thỏ, màn hình rõ nét\r\nMacbook Pro 16 M1 Max 10 CPU 2021 khiến ai nấy đều bất ngờ với màn hình không viền ấn tượng, nhưng để đặt cụm camera, Apple buộc phải đặt một cụm tai thỏ cho sản phẩm.\r\n\r\nVề cấu hình trên màn hình, chúng ta có những thông số siêu khủng. Với độ phân cao cùng tấm nền Liquid Retina, có khả năng hiển thị màu sắc rực rỡ nhưng tiết kiệm được năng lượng.', 1, 1, 100),
(2, 'Laptop HP 15 DY2089MS', 10, 1, 1, 1, 'img/shoei1.jpg', 18990000, '2022-12-04 13:40:21', 'Laptop HP 15-DY2089MS – Thiết kế sang trọng, hiệu năng mạnh mẽ\r\nThiết kế gọn nhẹ, chắc chắn\r\nChip Intel thế hệ thứ 11 cùng RAM 12 GB mạnh mẽ', 2, 1, 5),
(3, 'Laptop Dell Inspiron 15 3515 G6GR72', 10, 1, 1, 1, 'img/arai1.jpg', 12490000, '2022-12-04 13:22:00', 'AMD Ryzen 5-3450U - AMD Radeon Graphics: Giải trí tuyệt vời với các tựa game nhẹ nhàng hay lướt web xem phim\r\nRam 8GB, SSD 256GB - Khởi động ứng dụng nhanh chóng, đa nhiệm mượt mà.\r\nKhả năng hiển thị rực rỡ - màn hình chuẩn 15.6 inch, độ phân giải HD.\r\nĐa dạng các cổng kết nối: cổng HDMI 1.4, cổng USB C,...dễ truyền hoặc xuất dữ liệu với nhiều thiết bị khác nhau.\r\nNăng lượng bất tận cả ngày với viên pin 3-cell, 41Wh.\r\nThiết kế mỏng nhẹ - chỉ 1,69 kg, đồng hành cùng bạn khắp mọi nơi.\r\nMáy đi kèm Windows 11 bản quyền.', 3, 1, 50),
(4, ' Laptop ASUS VivoBook X1502ZA-BQ127', 5, 1, 1, 1, 'img/torc1.jpg', 17190000, '2022-12-04 13:42:35', 'Chip intel core i5 thế hệ 12 - Xử lý tốt mọi tác vụ từ làm việc đến giải trí\r\n8GB ram, 512GB SSD - Khởi động ứng dụng nhanh chóng, đa nhiệm tốt\r\nHệ thống tản nhiệt 2 ống đồng - mát mẻ khi xử lý mọi tác vụ\r\nMàn hình NanoEdge viền mỏng - giảm ánh sáng xanh, bảo vệ mắt tốt hơn', 4, 1, 0),
(5, ' Laptop Lenovo ThinkBook15p IMH', 2, 1, 1, 1, 'img/yohe1.jpg', 15990000, '2022-12-04 13:52:48', 'Laptop Lenovo Thinkbook 15p IMH - Laptop đa năng với khung hình bắt mắt\r\nKhả năng hoạt động bền bỉ với bộ cấu hình ấn tượng\r\nKhung hình rộng với hình ảnh bắt mắt, rực rỡ', 5, 1, 0),
(6, 'Laptop MSI Modern A5M 239VN', 3, 1, 1, 1, 'img/kyt1.jpg', 15790000, '2022-12-04 13:55:23', 'Chip R7-5700U cùng card AMD Radeon Graphics - Hiệu năng hàng đầu, chiến tốt cả các tựa game Esport như LOL, Fifa\r\nRam 8GB + 1 khe trống cho phép nâng cấp tối đa đến 64GB, ổ cứng SSD 512GB - Thoả sức đa nhiệm\r\nMàn hình 15.6 inch độ phân giải Full HD mang lại chất lượng hiển thị sắc nét.\r\nSiêu bền bỉ - Độ bền chuẩn quân đội MIL-STD-810G.\r\nTrọng lượng 1.6 kg thuận tiện di chuyển, mang theo.\r\nMáy đi kèm Windows 11 bản quyền.', 6, 1, 0),
(7, 'Surface Pro 8 Core i5 / 8GB / 128GB', 5, 1, 1, 1, 'img/royal1.jpg', 24490000, '2022-12-04 13:57:58', 'Microsoft Surface Pro 8 – Thương hiệu laptop chất lượng\r\nĐược mệnh danh là \"chiếc Surface Pro mạnh nhất đến nay\", Microsoft Surface Pro 8 kết hợp giữa sức mạnh của một chiếc laptop và tính linh hoạt của một chiếc máy tính bảng để cho ra thiết bị công nghệ dẫn đầu xu hướng, giúp phục vụ tất cả công việc của bạn một cách hiệu quả.', 7, 1, 0),
(8, 'Laptop Acer Aspire A515 57 52Y2', 6, 1, 1, 1, 'img/ls21.jpg', 17490000, '2022-12-04 13:59:28', 'Laptop Acer Aspire 5 A515-57-52Y2 - Hiệu năng hấp dẫn, sử dụng tiện lợi\r\nĐược chế tác cho nhu cầu làm việc từ xa cũng như giải trí tiện lợi, laptop Acer Aspire 5 A515-57-52Y2 tích hợp vi xử lý Intel Gen 12 cùng bộ nhớ lưu trữ cao bên trong thân máy gọn nhẹ giúp làm nên chiếc laptop văn phòng kiêm laptop sinh viên tuyệt vời trong tầm giá.', 8, 1, 0),
(17, ' Apple MacBook Pro 13 Touch Bar M1 256GB 2020', 10, 0, 1, 1, 'img/agv2.jpg', 27590000, '2022-12-04 13:11:48', 'Xử lý đồ hoạ mượt mà - Chip M1 cho phép thao tác trên các phần mềm AI, Photoshop, Render Video, phát trực tiếp ở độ phân giải 4K\r\nChất lượng hiển thị sắc nét - Độ phân giải retina màu sắc rực rỡ, tấm nền IPS cho góc nhìn 178 độ\r\nBảo mật cao - Trang bị cảm biến vân tay cho phép mở máy chỉ với 1 chạm\r\nMỏng nhẹ cao cấp - Mỏng chỉ 15.6mm, trọng lượng chỉ 1.4kg đồng hành cùng bạn mọi lúc mọi nơi\r\nCảm giác gõ thoải mái - Bàn phím magic khắc phục hầu hết các nhược điểm củ thế hệ trước', 1, 1, 7),
(19, 'Apple Macbook Pro 13 M2 2022 8GB 256GB ', 4, 0, 1, 1, 'img/agv3.jpg', 30590000, '2022-12-04 13:13:26', 'Macbook Pro M2 2022 là phiên bản nâng cấp mạnh mẽ của Macbook Pro M1 với nhiều cải tiến vô cùng ấn tượng. Đây sẽ là chiếc laptop mang đến cho người dùng trải nghiệm cực tốt. Từ đó giúp mọi hoạt động giải trí cũng như các công việc nặng như đồ họa, thiết kế đều được xử lý một cách mượt mà và nhanh chóng hơn.', 1, 1, 2),
(21, 'Apple MacBook Air M1 256GB 2020 ', 3, 1, 1, 0, 'img/agv4.jpg', 22690000, '2022-12-04 13:16:01', 'Phù hợp cho lập trình viên, thiết kế đồ họa 2D, dân văn phòng\r\nHiệu năng vượt trội - Cân mọi tác vụ từ word, exel đến chỉnh sửa ảnh trên các phần mềm như AI, PTS\r\nĐa nhiệm mượt mà - Ram 8GB cho phép vừa mở trình duyệt để tra cứu thông tin, vừa làm việc trên phần mềm\r\nTrang bị SSD 256GB - Cho thời gian khởi động nhanh chóng, tối ưu hoá thời gian load ứng dụng\r\nChất lượng hình ảnh sắc nét - Màn hình Retina cao cấp cùng công nghệ TrueTone cân bằng màu sắc\r\nThiết kế sang trọng - Nặng chỉ 1.29KG, độ dày 16.1mm. Tiện lợi mang theo mọi nơi\r\n', 1, 1, 8),
(23, 'Apple MacBook Air 13 512GB 2020', 4, 0, 1, 0, 'img/agv5.jpg', 26690000, '2022-12-04 13:19:13', 'Phù hợp cho lập trình viên, thiết kế đồ họa 2D, dân văn phòng\r\nHiệu năng vượt trội - Cân mọi tác vụ từ word, exel đến chỉnh sửa ảnh trên các phần mềm như AI, PTS\r\nĐa nhiệm mượt mà - Ram 8GB cho phép vừa mở trình duyệt để tra cứu thông tin, vừa làm việc trên phần mềm\r\nTrang bị SSD 256GB - Cho thời gian khởi động nhanh chóng, tối ưu hoá thời gian load ứng dụng\r\nChất lượng hình ảnh sắc nét - Màn hình Retina cao cấp cùng công nghệ TrueTone cân bằng màu sắc\r\nThiết kế sang trọng - Nặng chỉ 1.29KG, độ dày 16.1mm. Tiện lợi mang theo mọi nơi', 1, 1, 2),
(25, 'Laptop Dell Inspiron 7506-5903SLV', 3, 1, 1, 1, 'img/arai2.jpg', 18990000, '2022-12-04 13:24:28', 'Màn hình 15.6 inch cho góc nhìn rộng hơn cùng công nghệ Anti Glare hạn chế tình trạng chói, lóa.\r\nCPU Intel Core i5-1135G7 cho khả năng xử lý nhanh gọn, hiệu quả các tác vụ văn phòng.\r\nCard đồ họa Intel Iris Xe graphics đáp ứng đầy đủ nhu cầu lướt web, xem phim, thiết kế cơ bản trên Photoshop, Canva,...\r\nLaptop RAM 8 GB cho phép mở hàng loạt cửa sổ trình duyệt cùng lúc.\r\nMáy được trang bị đầy đủ cổng kết nối phổ biến như: USB Type-A, USB Type-C, HDMI,... giúp chia sẻ thông tin hay truyền tải dữ liệu nhanh chóng.\r\nHỗ trợ kết nối không dây Bluetooth và Wi-Fi 6 802.11AX, 802.11AC mang đến tốc độ truyền tải cao, đảm bảo đường truyền ổn định.', 3, 1, 22),
(26, 'Laptop Dell Inspiron 3501 70253897', 7, 0, 0, 1, 'img/arai3.jpg', 20590000, '2022-12-04 13:38:20', 'Chip Core i5-1135G7 tiết kiệm pin, hiệu năng ổn định thích hợp làm văn phòng.\r\nỔ cứng Ram 8GB ,SSD 512GB - Không lo tràn ram hay khởi động máy chậm khi sử dụng\r\nMàn hình với độ phân giải cao cùng lớp phủ chống chói - Hiển thị tốt trong nhiều điều kiện ánh sáng khác nhau.\r\nTích hợp webcam HD cho phép đàm thoại thông qua video thoải mái.\r\nNăng lượng bất tận cả ngày với viên pin 3Cell 42WHrs.\r\nThiết kế mỏng nhẹ - chỉ 1.96 kg, đồng hành cùng bạn khắp mọi nơi.\r\nMáy đi kèm Windows 10 bản quyền.', 3, 1, 100),
(27, ' Laptop ASUS ZenBook UM5302TA-LX087W', 100, 1, 1, 1, 'img/torc2.jpg', 26990000, '2022-12-04 13:46:55', 'Thiết kế sang trọng với vỏ nhôm, nặng chỉ 1.1kg\r\nMở khoá chỉ với 1 chạm, trang bị bảo mật vân tay\r\n8GB Ram onboard, hoạt động mượt mà, xử lý tốt các tác vụ văn phòng\r\n512GB SSD - khởi động máy, mở ứng dụng nhanh chóng\r\n\r\nSSD 512 GB - Tăng tốc toàn diện và khởi động trong tích tắt\r\n\r\nMàn hình 14.2 inch Liquid Retina XDR (3024 x 1964) chất lượng hiển thị vô cùng sắc nét', 4, 1, 300),
(28, 'Laptop ASUS ZenBook UX371EA-HL725WS', 3, 0, 1, 1, 'img/torc3.jpg', 34990000, '2022-12-04 13:50:09', 'Chip Core i7-1165G7 - Đáp ứng tốt mọi tác vụ văn phòng đến những tựa game nhẹ nhàng sau giờ làm\r\nDung lượng lớn 16GB, ổ cứng 1TB - Tốc độ truy suất dữ liệu cực nhanh, không gian lưu trữ lớn\r\nKhả năng hiển thị rực rỡ - màn hình 13.3 inch, 4K (Ultra HD)\r\nTích hợp webcam HD 720p cho phép đàm thoại thông qua video thoải mái.\r\nNăng lượng bất tận cả ngày với viên pin 4 Cell, 67WH.\r\nThiết kế mỏng nhẹ, sang trọng thuận tiện di chuyển, mang theo - Nặng 1.2 kg\r\nMáy đi kèm Windows 11 bản quyền.', 4, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

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

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`idUser`, `ho`, `ten`, `email`, `username`, `password`, `phone`, `address`) VALUES
(1, 'Trần', 'Quốc Huy', 'kenbi.njr@gmail.cm', 'admin', '123', 932393401, ''),
(5, 'Trần', 'Quốc', 'kenbi.njr@gmail.cm', 'huy', '$2b$10$CGHZhN5XMekIKk14pFqwjuJ1apYUHmn6v7qbPBisr3v4CzQoci9US', 333964846, 'Vietnam'),
(6, 'Trần', 'Quốc Huy', 'asd@gmail.com', 'superman', '$2b$10$2g4kPt1ok.F0XlHOm9cGLe6YI3c9EjIXTqouZu9ilXwBptDSDwB.q', 333964846, ''),
(7, 'Trần', 'Quốc Huy', 'kenbi.njr@gmail.cm', 'huy123', '$2b$10$CGHZhN5XMekIKk14pFqwjuJ1apYUHmn6v7qbPBisr3v4CzQoci9US', 932393401, 'Tây Ninh');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `catalog`
--
ALTER TABLE `catalog`
  ADD PRIMARY KEY (`idCat`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`idComment`),
  ADD KEY `idProduct` (`idProduct`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`idProduct`),
  ADD KEY `idCat` (`idCat`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`idUser`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `catalog`
--
ALTER TABLE `catalog`
  MODIFY `idCat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `idComment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `idProduct` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`idProduct`) REFERENCES `product` (`idProduct`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`idCat`) REFERENCES `catalog` (`idCat`);
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2019-10-21 13:37:09', '{\"Console\\/Mode\":\"collapse\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `id` int(20) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(200) NOT NULL,
  `phone` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`id`, `username`, `password`, `email`, `phone`) VALUES
(1, 'nhung19', '123456', 'nhung@gmail.com', '0123456789'),
(2, 'thu', '123456', 'minzjulion@gmail.com', '0967563276');

-- --------------------------------------------------------

--
-- Table structure for table `test_db`
--

CREATE TABLE `test_db` (
  `id` int(11) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `test_db`
--

INSERT INTO `test_db` (`id`, `user_name`, `password`) VALUES
(1, 'nhung', '123456');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `test_db`
--
ALTER TABLE `test_db`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `test_db`
--
ALTER TABLE `test_db`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Database: `web_travel`
--
CREATE DATABASE IF NOT EXISTS `web_travel` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `web_travel`;

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `username` varchar(255) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`username`, `password`) VALUES
('Hoangminhthu', '01082002'),
('admin', '123');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
