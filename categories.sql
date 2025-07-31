-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 31, 2025 at 04:24 AM
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
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `created_at`, `deleted_at`) VALUES
(1, 'お菓子', 'snacks', '2025-07-24 08:10:02', NULL),
(2, 'ラーメン', 'ramen', '2025-07-24 08:10:02', NULL),
(3, '浴衣と着物の', 'clothing', '2025-07-24 08:10:02', NULL),
(4, '電子商品', 'electronics', '2025-07-24 08:10:02', NULL),
(5, 'お土産', 'presents', '2025-07-24 08:10:02', NULL),
(6, '調味料', 'spices', '2025-07-24 08:10:02', NULL),
(7, 'お茶', 'tea', '2025-07-24 08:10:02', NULL),
(8, '美容製品', 'cusmetic', '2025-07-24 08:10:02', NULL),
(9, 'women\'s wear', 'women-wear', '2025-07-24 08:10:02', NULL),
(10, 'Men\'s wear', 'men-wear', '2025-07-24 08:10:02', NULL),
(11, 'Baby Product', 'baby-products', '2025-07-29 07:09:45', NULL),
(12, 'Kitchen Product', 'kitchen-products', '2025-07-31 02:12:03', NULL),
(13, 'Health and Fitness', 'health-fitness', '2025-07-31 02:18:02', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_category_slug` (`slug`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
