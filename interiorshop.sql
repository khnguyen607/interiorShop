-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3306
-- Thời gian đã tạo: Th7 17, 2024 lúc 07:35 AM
-- Phiên bản máy phục vụ: 8.0.30
-- Phiên bản PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `interiorshop`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `ID` int NOT NULL,
  `Name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`ID`, `Name`) VALUES
(1, 'Ghế'),
(2, 'Bàn'),
(3, 'Tủ'),
(4, 'Kệ'),
(5, 'Giường');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orderdetail`
--

CREATE TABLE `orderdetail` (
  `ID` int NOT NULL,
  `orderID` int NOT NULL,
  `productID` int NOT NULL,
  `Quantity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orderdetail`
--

INSERT INTO `orderdetail` (`ID`, `orderID`, `productID`, `Quantity`) VALUES
(1, 1, 3, 2),
(2, 1, 6, 1),
(3, 2, 3, 2),
(4, 2, 6, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `ID` int NOT NULL,
  `TotalPrice` int NOT NULL,
  `Status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Chờ duyệt',
  `Date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `GuestName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `GuestEmail` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `GuestPhone` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `GuestAddress` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`ID`, `TotalPrice`, `Status`, `Date`, `GuestName`, `GuestEmail`, `GuestPhone`, `GuestAddress`) VALUES
(1, 1600, 'Đang giao hàng', '2024-07-17 13:51:58', '1', '1', '1', '1'),
(2, 1600, 'Đơn bị hủy', '2024-07-17 13:53:34', '123', '12321321', '123123', '213');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `ID` int NOT NULL,
  `Name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Price` int NOT NULL,
  `Description` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Img` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `View` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`ID`, `Name`, `Price`, `Description`, `Img`, `View`) VALUES
(1, 'Ghế Sofa Hiện Đại', 500, 'Ghế sofa hiện đại, thoải mái với chất liệu da cao cấp, kích thước rộng rãi phù hợp cho phòng khách.', 'products/product-1.jpg', 0),
(2, 'Bàn Ăn Gỗ Sồi', 350, 'Bàn ăn làm từ gỗ sồi tự nhiên, bền chắc, mang lại không gian ấm cúng cho gia đình.', 'products/product-2.jpg', 0),
(3, 'Giường Ngủ Hộp', 600, 'Giường ngủ hộp tiện dụng với ngăn kéo rộng, tiết kiệm không gian lưu trữ cho phòng ngủ.', 'products/product-3.jpg', 0),
(4, 'Kệ Tivi Đa Năng', 200, 'Kệ tivi đa năng với thiết kế hiện đại, có nhiều ngăn để lưu trữ đồ đạc gọn gàng.', 'products/product-4.jpg', 0),
(5, 'Tủ Quần Áo 4 Cánh', 750, 'Tủ quần áo 4 cánh với không gian lưu trữ rộng rãi, chất liệu gỗ công nghiệp chống ẩm tốt.', 'products/product-5.jpg', 0),
(6, 'Bàn Trang Điểm Gương Lớn', 400, 'Bàn trang điểm với gương lớn, thiết kế sang trọng, có nhiều ngăn kéo tiện lợi.', 'products/product-6.jpg', 0),
(7, 'Ghế Thư Giãn Da', 300, 'Ghế thư giãn bằng da, khung gỗ chắc chắn, tạo cảm giác thoải mái khi nghỉ ngơi.', 'products/product-1.jpg', 0),
(8, 'Tủ Giày Thông Minh', 180, 'Tủ giày thông minh với thiết kế nhỏ gọn, nhiều ngăn để giày dép, tiết kiệm không gian.', 'products/product-2.jpg', 0),
(9, 'Bàn Làm Việc Gỗ Công Nghiệp', 220, 'Bàn làm việc từ gỗ công nghiệp chất lượng cao, thiết kế đơn giản nhưng hiện đại.', 'products/product-3.jpg', 0),
(10, 'Kệ Sách Treo Tường', 130, 'Kệ sách treo tường, tiết kiệm không gian, phù hợp để trưng bày sách và vật dụng trang trí.', 'products/product-4.jpg', 0),
(11, 'Bàn Console Lối Vào', 270, 'Bàn console lối vào với thiết kế tinh tế, tạo điểm nhấn cho không gian nội thất.', 'products/product-5.jpg', 0),
(12, 'Ghế Bar Gỗ Sồi', 120, 'Ghế bar làm từ gỗ sồi chắc chắn, thiết kế cao cấp, phù hợp cho không gian bếp.', 'products/product-6.jpg', 0),
(13, 'Tủ Rượu Đẹp', 450, 'Tủ rượu với thiết kế sang trọng, nhiều ngăn để lưu trữ và trưng bày rượu vang.', 'products/product-1.jpg', 0),
(14, 'Bàn Cafe Tròn', 140, 'Bàn cafe tròn, kích thước nhỏ gọn, phù hợp cho không gian ngoài trời hoặc trong nhà.', 'products/product-2.jpg', 0),
(15, 'Ghế Bành Thư Giãn', 290, 'Ghế bành thư giãn với đệm dày êm ái, thiết kế hiện đại, phù hợp cho phòng khách.', 'products/product-3.jpg', 0),
(16, 'Kệ Đựng Đồ Đa Năng', 160, 'Kệ đựng đồ đa năng, có thể dùng để lưu trữ sách, đồ trang trí, hoặc các vật dụng cá nhân.', 'products/product-4.jpg', 0),
(17, 'Tủ Đầu Giường', 110, 'Tủ đầu giường nhỏ gọn, có ngăn kéo tiện lợi, phù hợp cho phòng ngủ.', 'products/product-5.jpg', 0),
(18, 'Bàn Học Sinh', 250, 'Bàn học sinh làm từ gỗ công nghiệp, thiết kế bền chắc, có nhiều ngăn để sách và dụng cụ học tập.', 'products/product-6.jpg', 0),
(19, 'Ghế Văn Phòng Ergonomic', 320, 'Ghế văn phòng ergonomic với thiết kế công thái học, hỗ trợ tốt cho lưng và cổ.', 'products/product-1.jpg', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `syn_products_categories`
--

CREATE TABLE `syn_products_categories` (
  `ID` int NOT NULL,
  `productID` int NOT NULL,
  `categoryID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ordersdetail_oders` (`orderID`),
  ADD KEY `ordersdetail_products` (`productID`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `syn_products_categories`
--
ALTER TABLE `syn_products_categories`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `syn_products_categories_categories` (`categoryID`),
  ADD KEY `syn_products_categories_products` (`productID`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `orderdetail`
--
ALTER TABLE `orderdetail`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `syn_products_categories`
--
ALTER TABLE `syn_products_categories`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD CONSTRAINT `ordersdetail_oders` FOREIGN KEY (`orderID`) REFERENCES `orders` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `ordersdetail_products` FOREIGN KEY (`productID`) REFERENCES `products` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Các ràng buộc cho bảng `syn_products_categories`
--
ALTER TABLE `syn_products_categories`
  ADD CONSTRAINT `syn_products_categories_categories` FOREIGN KEY (`categoryID`) REFERENCES `categories` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `syn_products_categories_products` FOREIGN KEY (`productID`) REFERENCES `products` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
