-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 14, 2023 at 11:12 AM
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
-- Database: `shop_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `password`) VALUES
(1, 'admin', '111'),
(7, 'ahmad', '111');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(100) NOT NULL,
  `pid` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(10) NOT NULL,
  `quantity` int(10) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `image_01` varchar(255) NOT NULL,
  `category_name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `image_01`, `category_name`) VALUES
(7, 'ca r.png', 'RINGS'),
(8, 'ca n.png', 'NECKLACES'),
(9, 'ca e.png', 'EARRINGS'),
(10, 'ca b.png', 'BRACELETS');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `total_price` int(100) NOT NULL,
  `location` varchar(255) NOT NULL,
  `order_time` datetime DEFAULT NULL,
  `total_quantity` int(100) NOT NULL,
  `number` int(14) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `total_price`, `location`, `order_time`, `total_quantity`, `number`, `email`) VALUES
(29, 8, 80, 'flat no. 10, alfarabi, aqaba, jordan', '2023-01-14 12:56:01', 1, 796781246, 'ahmad@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `NameProduct` varchar(255) NOT NULL,
  `NameUser` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`order_id`, `product_id`, `quantity`, `price`, `NameProduct`, `NameUser`) VALUES
(29, 14, 1, '80', 'Dextera bangle', 'ahmad');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(100) NOT NULL,
  `category_id` int(100) NOT NULL,
  `image` varchar(255) NOT NULL,
  `name` text NOT NULL,
  `price` double NOT NULL,
  `price_discount` double NOT NULL DEFAULT 0,
  `is_sale` int(1) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `details` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `category_id`, `image`, `name`, `price`, `price_discount`, `is_sale`, `created_at`, `updated_at`, `details`) VALUES
(14, 10, 'B3-2.webp', 'Dextera bangle', 80, 0, 0, '2023-01-01 13:33:58', NULL, 'Octagon shape, White, Gold-tone plated'),
(15, 10, 'B4-2.webp', 'Teddy bracelet', 60, 0, 0, '2023-01-01 13:35:10', NULL, 'Bear, Pink, Rose gold-tone plated'),
(16, 10, 'b5-2.webp', 'Volta bracelet', 70, 0, 0, '2023-01-01 13:36:09', NULL, 'Bow, White, Rhodium plated'),
(17, 9, 'E 1-2.webp', 'Solitaire stud earrings', 50, 0, 0, '2023-01-01 13:42:36', NULL, 'Round cut, White, Rhodium plated'),
(18, 9, 'E2-2.webp', 'Louison stud earrings', 55, 0, 0, '2023-01-01 13:43:46', NULL, 'Leaf, White, Rhodium plated'),
(19, 9, 'E3-2.webp', 'Millenia drop earrings', 50, 0, 0, '2023-01-01 13:45:06', NULL, 'Octagon cut, Pink, Rose gold-tone plated'),
(20, 9, 'E4-2.webp', 'Millemia drop earrings', 50, 0, 0, '2023-01-01 13:47:00', NULL, 'Square cut, Blue, Rhodium plated'),
(21, 9, 'E5-2.webp', 'Attract Trilogy drop earrings', 50, 0, 0, '2023-01-01 13:47:59', NULL, 'Round cut, Blue, Rhodium plated'),
(22, 9, 'E7-2.webp', 'Una stud earrings', 50, 0, 0, '2023-01-01 13:49:55', NULL, 'Heart, Medium, White, Rhodium plated'),
(23, 8, 'N 6-3.webp', 'Lovely necklace', 80, 0, 0, '2023-01-01 13:53:02', NULL, 'Heart, White, Rhodium plated'),
(24, 7, 'N1-2.webp', 'Attract Soul necklace', 80, 72, 1, '2023-01-01 13:54:32', NULL, 'Octagon ,White, Rhodium plated'),
(25, 8, 'N5-2.webp', 'Sparkling Dance necklace', 80, 0, 0, '2023-01-01 13:55:21', NULL, 'Round cut, White, Rhodium plated'),
(26, 8, 'N3-2.jpeg', 'Stone necklace', 80, 0, 0, '2023-01-01 13:57:29', NULL, 'Intertwined circles, White, Rose gold-tone plated'),
(27, 8, 'N4-2.webp', 'Infinity necklace', 80, 0, 0, '2023-01-01 13:58:47', NULL, 'Infinity necklace'),
(28, 8, 'N7-2.webp', 'Dextera necklace', 90, 0, 0, '2023-01-01 13:59:57', NULL, 'Mixed links, White, Rhodium plated'),
(29, 7, 'R 1-2.webp', 'Constella cocktail ring', 50, 45, 1, '2023-01-01 14:01:00', NULL, 'Princess cut, Pavé, White, Rhodium plated'),
(30, 7, 'R 2-3.webp', 'Angelic ring', 50, 45, 1, '2023-01-01 14:02:23', NULL, 'Round cut, White, Rhodium plated'),
(31, 7, 'R 2-4.webp', 'Stone ring', 50, 45, 1, '2023-01-01 14:03:23', NULL, 'White, Rhodium plated'),
(32, 7, 'R 3-2.webp', 'Vittore ring', 50, 45, 1, '2023-01-01 14:04:12', NULL, 'Rectangular cut, White, Rhodium plated'),
(33, 7, 'R2-2.webp', 'Constella ring', 50, 45, 1, '2023-01-01 14:05:26', NULL, 'Set (2), Princess cut, White, Rhodium plated'),
(34, 7, 'R5-2.webp', 'Swarovski Symbolic ring', 50, 45, 1, '2023-01-01 14:07:22', NULL, 'Evil eye, Blue, Rose gold-tone plated'),
(35, 7, 'R7-2.webp', 'Twist Wrap ring', 60, 54, 1, '2023-01-01 14:08:45', NULL, 'Mixed cuts, White, Rhodium plated'),
(36, 7, 'R6-3.webp', ' cocktail ring', 50, 45, 1, '2023-01-01 14:10:19', NULL, 'Princess cut, White, Rhodium plated');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `review_id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `product_id` int(100) NOT NULL,
  `review_text` text NOT NULL,
  `review_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`review_id`, `user_id`, `product_id`, `review_text`, `review_date`) VALUES
(57, 6, 25, 'good product ', '2023-01-03'),
(58, 6, 13, 'good product ', '2023-01-03'),
(59, 8, 15, 'ahmad ', '2023-01-04'),
(60, 8, 15, 'aaaaa ', '2023-01-04'),
(61, 8, 16, 'adad ', '2023-01-07'),
(62, 8, 16, 'ahmad ', '2023-01-11'),
(63, 9, 16, 'goooood ', '2023-01-11'),
(64, 8, 22, 'zzzzz ', '2023-01-11'),
(65, 8, 16, 'ggggggg ', '2023-01-11');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(100) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `email`, `password`) VALUES
(8, 'ahmad', 'ahmad@gmail.com', 'ahmad'),
(9, 'abd', 'abdalmajed@gmail.com', 'abd');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`review_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `review_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
