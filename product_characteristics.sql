-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 31, 2025 at 04:55 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ec_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `product_characteristics`
--

CREATE TABLE `product_characteristics` (
  `id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `characteristic_name` varchar(255) DEFAULT NULL,
  `characteristic_value` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_characteristics`
--

INSERT INTO `product_characteristics` (`id`, `product_id`, `characteristic_name`, `characteristic_value`, `created_at`, `deleted_at`) VALUES
(1, 161, 'Color', 'Phantom Black', '2025-07-30 04:39:29', NULL),
(2, 161, 'Storage', '256GB', '2025-07-30 04:39:29', NULL),
(3, 161, 'RAM', '8GB', '2025-07-30 04:39:29', NULL),
(4, 161, 'Battery', '3900mAh', '2025-07-30 04:39:29', NULL),
(5, 162, 'color', 'ブラック', '2025-07-30 06:58:10', NULL),
(6, 162, 'color', 'ホワイト', '2025-07-30 06:58:10', NULL),
(7, 162, 'color', 'ブルー', '2025-07-30 06:58:10', NULL),
(8, 162, 'size', '日本サイズ 25cm', '2025-07-30 06:58:10', NULL),
(9, 162, 'size', '日本サイズ 26cm', '2025-07-30 06:58:10', NULL),
(10, 162, 'size', '日本サイズ 27cm', '2025-07-30 06:58:10', NULL),
(11, 162, 'size', '日本サイズ 28cm', '2025-07-30 06:58:10', NULL),
(12, 163, 'color', 'ブラック', '2025-07-30 06:58:10', NULL),
(13, 163, 'color', 'シルバー', '2025-07-30 06:58:10', NULL),
(14, 163, 'color', 'レッド', '2025-07-30 06:58:10', NULL),
(15, 163, 'size', 'フリーサイズ', '2025-07-30 06:58:10', NULL),
(16, 164, 'color', 'ホワイト', '2025-07-30 06:58:10', NULL),
(17, 164, 'color', 'ブラック', '2025-07-30 06:58:10', NULL),
(18, 164, 'color', 'ネイビー', '2025-07-30 06:58:10', NULL),
(19, 164, 'size', 'Sサイズ', '2025-07-30 06:58:10', NULL),
(20, 164, 'size', 'Mサイズ', '2025-07-30 06:58:10', NULL),
(21, 164, 'size', 'Lサイズ', '2025-07-30 06:58:10', NULL),
(22, 164, 'size', 'XLサイズ', '2025-07-30 06:58:10', NULL),
(23, 165, 'color', 'ステンレス', '2025-07-30 06:58:10', NULL),
(24, 165, 'color', 'ブラック', '2025-07-30 06:58:10', NULL),
(25, 165, 'color', 'ブルー', '2025-07-30 06:58:10', NULL),
(26, 165, 'size', '32オンス', '2025-07-30 06:58:10', NULL),
(27, 166, 'color', 'ブラック', '2025-07-30 06:58:10', NULL),
(28, 166, 'color', 'ローズゴールド', '2025-07-30 06:58:10', NULL),
(29, 166, 'color', 'シルバー', '2025-07-30 06:58:10', NULL),
(30, 166, 'size', 'レギュラーサイズ', '2025-07-30 06:58:10', NULL),
(31, 167, 'color', 'ブラウン', '2025-07-30 06:58:10', NULL),
(32, 167, 'color', 'ブラック', '2025-07-30 06:58:10', NULL),
(33, 167, 'color', 'タン', '2025-07-30 06:58:10', NULL),
(34, 167, 'size', 'スタンダード', '2025-07-30 06:58:10', NULL),
(35, 168, 'color', 'ホワイト', '2025-07-30 06:58:10', NULL),
(36, 168, 'color', 'ブラック', '2025-07-30 06:58:10', NULL),
(37, 168, 'color', 'ブルー', '2025-07-30 06:58:10', NULL),
(38, 168, 'size', '16オンス', '2025-07-30 06:58:10', NULL),
(39, 169, 'color', 'パープル', '2025-07-30 06:58:10', NULL),
(40, 169, 'color', 'ブルー', '2025-07-30 06:58:10', NULL),
(41, 169, 'color', 'ブラック', '2025-07-30 06:58:10', NULL),
(42, 169, 'size', '173cm × 61cm', '2025-07-30 06:58:10', NULL),
(43, 170, 'color', 'ホワイト', '2025-07-30 06:58:10', NULL),
(44, 170, 'color', 'ブラック', '2025-07-30 06:58:10', NULL),
(45, 170, 'color', 'ピンク', '2025-07-30 06:58:10', NULL),
(46, 170, 'size', 'スタンダード', '2025-07-30 06:58:10', NULL),
(47, 171, 'color', 'ブラック', '2025-07-30 06:58:10', NULL),
(48, 171, 'color', 'グレー', '2025-07-30 06:58:10', NULL),
(49, 171, 'color', 'ブルー', '2025-07-30 06:58:10', NULL),
(50, 171, 'size', '20リットル', '2025-07-30 06:58:10', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `product_characteristics`
--
ALTER TABLE `product_characteristics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `product_characteristics`
--
ALTER TABLE `product_characteristics`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `product_characteristics`
--
ALTER TABLE `product_characteristics`
  ADD CONSTRAINT `product_characteristics_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
