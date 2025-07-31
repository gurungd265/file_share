-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 31, 2025 at 06:31 AM
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
-- Database: `test4`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` bigint(20) NOT NULL,
  `address_type` enum('HOME','WORK') DEFAULT NULL,
  `city` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `is_default` bit(1) NOT NULL,
  `postal_code` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `street` varchar(255) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `address_type`, `city`, `country`, `created_at`, `deleted_at`, `is_default`, `postal_code`, `state`, `street`, `updated_at`, `user_id`) VALUES
(1, NULL, '千代田区', '日本', '2025-07-31 11:36:13.000000', NULL, b'1', '101-0021', '東京都', '外神田', '2025-07-31 11:36:13.000000', 1);

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `session_id` varchar(255) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `created_at`, `deleted_at`, `session_id`, `updated_at`, `user_id`) VALUES
(1, '2025-07-31 11:35:46.000000', NULL, NULL, '2025-07-31 11:35:46.000000', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `id` bigint(20) NOT NULL,
  `added_at` datetime(6) NOT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `price_at_addition` decimal(38,2) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `cart_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart_items`
--

INSERT INTO `cart_items` (`id`, `added_at`, `deleted_at`, `price_at_addition`, `quantity`, `cart_id`, `product_id`) VALUES
(1, '2025-07-31 11:35:46.000000', NULL, NULL, 1, 1, 30);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `created_at`, `deleted_at`, `name`, `slug`) VALUES
(1, '2025-07-24 08:10:02.000000', NULL, 'お菓子', 'snacks'),
(2, '2025-07-24 08:10:02.000000', NULL, 'ラーメン', 'ramen'),
(3, '2025-07-24 08:10:02.000000', NULL, '浴衣と着物の', 'clothing'),
(4, '2025-07-24 08:10:02.000000', NULL, '電子商品', 'electronics'),
(5, '2025-07-24 08:10:02.000000', NULL, 'お土産', 'presents'),
(6, '2025-07-24 08:10:02.000000', NULL, '調味料', 'spices'),
(7, '2025-07-24 08:10:02.000000', NULL, 'お茶', 'tea'),
(8, '2025-07-24 08:10:02.000000', NULL, '美容製品', 'cusmetic'),
(9, '2025-07-24 08:10:02.000000', NULL, 'women\'s wear', 'women-wear'),
(10, '2025-07-24 08:10:02.000000', NULL, 'Men\'s wear', 'men-wear'),
(11, '2025-07-29 07:09:45.000000', NULL, 'Baby Product', 'baby-products'),
(12, '2025-07-31 02:12:03.000000', NULL, 'Kitchen Product', 'kitchen-products'),
(13, '2025-07-31 02:18:02.000000', NULL, 'Health and Fitness', 'health-fitness');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `order_number` varchar(255) NOT NULL,
  `shipping_fee` decimal(38,2) NOT NULL,
  `status` enum('CANCELLED','COMPLETED','PARTIALLY_REFUNDED','PAYMENT_FAILED','PENDING','REFUNDED','SHIPPED') DEFAULT NULL,
  `subtotal` decimal(38,2) NOT NULL,
  `tax` decimal(38,2) NOT NULL,
  `total_amount` decimal(38,2) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `billing_address_id` bigint(20) DEFAULT NULL,
  `shipping_address_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) NOT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_price` decimal(38,2) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `subtotal` decimal(38,2) DEFAULT NULL,
  `order_id` bigint(20) NOT NULL,
  `product_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) NOT NULL,
  `amount` decimal(38,2) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `payment_method` enum('BANK_TRANSFER','COD','CREDIT_CARD','KONBINI') DEFAULT NULL,
  `refund_amount` decimal(38,2) DEFAULT NULL,
  `status` enum('CANCELED','CHARGEBACK','COMPLETED','EXPIRED','FAILED','INITIATED','PARTIALLY_REFUNDED','PENDING','REFUNDED') DEFAULT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `order_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `discount_price` decimal(38,2) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(38,2) DEFAULT NULL,
  `stock_quantity` int(11) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `created_at`, `deleted_at`, `description`, `discount_price`, `name`, `price`, `stock_quantity`, `updated_at`, `category_id`) VALUES
(1, '2025-07-24 07:09:29.000000', NULL, '京都産の抹茶を使用したクッキー', 480.00, '抹茶クッキー', 540.00, 100, '2025-07-24 07:09:29.000000', 1),
(2, '2025-07-24 07:09:29.000000', NULL, 'カルビー じゃがりこサラダ 57g×12個', 1899.00, 'じゃかりご', 2096.00, 200, '2025-07-28 00:47:00.000000', 1),
(3, '2025-07-24 07:09:29.000000', NULL, '観賞用の模造刀', 9800.00, '日本刀レプリカ', 12000.00, 10, '2025-07-28 04:58:14.000000', 5),
(4, '2025-07-24 07:09:29.000000', NULL, '女性用の可愛いデザイン', 3500.00, '桜柄の浴衣', 3980.00, 50, '2025-07-28 04:58:32.000000', 3),
(5, '2025-07-24 07:09:29.000000', NULL, '和紙を使ったノート', NULL, '和風ノート', 680.00, 80, '2025-07-24 07:09:29.000000', 5),
(6, '2025-07-24 07:09:29.000000', NULL, '独特のつるみのある麺に、おなじみのオリジナルスープ。具材は謎肉 (味付豚ミンチ)、ミンチポーク (味付豚肉)、エビ、スクランブルエッグ、ネギ。', 198.00, 'カップヌードル', 250.00, 300, '2025-07-25 08:50:55.000000', 2),
(7, '2025-07-24 07:09:29.000000', NULL, 'デスク用の小型加湿器', 1750.00, 'USB加湿器', 1980.00, 40, '2025-07-28 04:59:02.000000', 4),
(8, '2025-07-24 07:09:29.000000', NULL, 'ガラス製の風鈴', 1100.00, '風鈴', 1280.00, 30, '2025-07-28 08:40:37.000000', 5),
(9, '2025-07-24 07:09:29.000000', NULL, 'インスタント味噌汁10食分', 450.00, '味噌汁パック', 500.00, 120, '2025-07-28 05:02:35.000000', 6),
(10, '2025-07-24 07:09:29.000000', NULL, '木製将棋盤と駒', NULL, '将棋セット', 2980.00, 25, '2025-07-28 05:04:27.000000', 5),
(11, '2025-07-24 07:09:29.000000', NULL, '手作りの和風湯のみ', NULL, '陶器の湯のみ', 950.00, 70, '2025-07-28 05:04:46.000000', 5),
(12, '2025-07-24 07:09:29.000000', NULL, '100枚入りのカラフルな折り紙', 250.00, '折り紙セット', 300.00, 150, '2025-07-24 07:09:29.000000', 5),
(13, '2025-07-24 07:09:29.000000', NULL, '煎茶20パック', 550.00, '日本茶ティーバッグ', 620.00, 90, '2025-07-28 05:05:02.000000', 7),
(14, '2025-07-24 07:09:29.000000', NULL, '5種類のふりかけセット', NULL, 'ふりかけ詰め合わせ', 430.00, 130, '2025-07-28 05:05:23.000000', 6),
(15, '2025-07-24 07:09:29.000000', NULL, '人気キャラの限定モデル', 3800.00, 'アニメフィギュア', 4200.00, 20, '2025-07-28 05:05:39.000000', 5),
(16, '2025-07-24 07:09:29.000000', NULL, '竹製の装飾扇子', NULL, '和風扇子', 880.00, 60, '2025-07-24 07:09:29.000000', 5),
(17, '2025-07-24 07:09:29.000000', NULL, 'ゆずの香りのバスソルト', 500.00, 'ゆず風呂入浴剤', 560.00, 75, '2025-07-28 05:05:57.000000', 7),
(18, '2025-07-24 07:09:29.000000', NULL, 'Instant Japanese Green Tea with Matcha Powder 80g by Japanese Taste', NULL, 'Itoen Oi Ocha', 980.00, 35, '2025-07-28 05:06:06.000000', 7),
(19, '2025-07-24 07:09:29.000000', NULL, '日本の伝統模様が入った布', 350.00, '伝統柄ハンカチ', 400.00, 100, '2025-07-28 05:06:13.000000', 5),
(20, '2025-07-24 07:09:29.000000', NULL, '金運を招く置物', 1200.00, '招き猫', 1500.00, 45, '2025-07-28 05:06:21.000000', 5),
(21, '2025-07-28 06:51:17.000000', NULL, 'Matcha green tea flavored Kit Kat', NULL, 'Kit Kat Matcha Green Tea', 350.00, 100, '2025-07-28 06:51:17.000000', 1),
(22, '2025-07-28 06:51:17.000000', NULL, 'Classic chocolate coated biscuit sticks', 180.00, 'Pocky Chocolate', 200.00, 150, '2025-07-28 06:51:17.000000', 1),
(23, '2025-07-28 06:51:17.000000', NULL, 'Soft banana-shaped cakes with custard cream', 1100.00, 'Tokyo Banana', 1200.00, 50, '2025-07-28 06:51:17.000000', 1),
(24, '2025-07-28 06:51:17.000000', NULL, 'Premium melt-in-your-mouth chocolate cubes', NULL, 'Meltykiss Chocolate', 450.00, 80, '2025-07-28 06:51:17.000000', 1),
(25, '2025-07-28 06:51:17.000000', NULL, 'Crunchy potato sticks with original flavor', NULL, 'Jagariko Potato Snacks', 150.00, 200, '2025-07-28 06:51:17.000000', 1),
(26, '2025-07-28 06:51:17.000000', NULL, 'Chewy fruit candies in assorted flavors', 250.00, 'Hi-Chew Assorted', 300.00, 120, '2025-07-28 06:51:17.000000', 1),
(27, '2025-07-28 06:51:17.000000', NULL, 'Popular cylindrical corn puff snack', NULL, 'Umaibo Corn Puff', 20.00, 500, '2025-07-28 06:51:17.000000', 1),
(28, '2025-07-28 06:51:17.000000', NULL, 'Crunchy chocolate cookie bar', NULL, 'Black Thunder Chocolate', 100.00, 300, '2025-07-28 06:51:17.000000', 1),
(29, '2025-07-28 06:51:17.000000', NULL, 'Butter cookies in cigarette shapes', 750.00, 'Yoku Moku Cigarette Cookies', 800.00, 60, '2025-07-28 06:51:17.000000', 1),
(30, '2025-07-28 06:51:17.000000', NULL, 'Potato sticks with salad flavor', NULL, 'Calbee Jagariko Salad', 150.00, 180, '2025-07-28 06:51:17.000000', 1),
(31, '2025-07-28 07:30:44.000000', NULL, 'Premium instant ramen with rich soy sauce broth', NULL, 'Nissin Raoh Soy Sauce Ramen', 450.00, 80, '2025-07-28 07:30:44.000000', 2),
(32, '2025-07-28 07:30:44.000000', NULL, 'Classic Japanese-style instant noodles', 200.00, 'Sapporo Ichiban Original', 250.00, 120, '2025-07-28 07:30:44.000000', 2),
(33, '2025-07-28 07:30:44.000000', NULL, 'Authentic tonkotsu (pork bone) flavored ramen', NULL, 'Maruchan Seimen Tonkotsu', 380.00, 90, '2025-07-28 07:30:44.000000', 2),
(34, '2025-07-28 07:30:44.000000', NULL, 'Hokkaido-style miso flavored instant ramen', NULL, 'Acecook Miso Ramen', 320.00, 70, '2025-07-28 07:30:44.000000', 2),
(35, '2025-07-28 07:30:44.000000', NULL, 'The original cup ramen with assorted toppings', NULL, 'Nissin Cup Noodle Original', 180.00, 200, '2025-07-28 07:30:44.000000', 2),
(36, '2025-07-28 07:30:44.000000', NULL, 'Popular stir-fried style cup noodles', NULL, 'Nissin UFO Yakisoba', 220.00, 150, '2025-07-28 07:30:44.000000', 2),
(37, '2025-07-28 07:30:44.000000', NULL, 'Restaurant-quality instant ramen from famous chain', 600.00, 'Ippudo Akamaru Instant Ramen', 680.00, 40, '2025-07-28 07:30:44.000000', 2),
(38, '2025-07-28 07:30:44.000000', NULL, 'Michelin-starred ramen in instant form', NULL, 'Tsuta Ajitama Instant Ramen', 980.00, 30, '2025-07-28 07:30:44.000000', 2),
(39, '2025-07-28 07:30:44.000000', NULL, 'Famous Hakata-style tonkotsu ramen', NULL, 'Hakata Ikkousha Tonkotsu', 580.00, 50, '2025-07-28 07:30:44.000000', 2),
(40, '2025-07-28 07:30:44.000000', NULL, 'Tokyo-style soy sauce flavored ramen', NULL, 'Sanyo Tokyo Shoyu Ramen', 420.00, 60, '2025-07-28 07:30:44.000000', 2),
(41, '2025-07-28 07:51:18.000000', NULL, 'Summer cotton yukata with obi belt included', 8500.00, 'Traditional Cotton Yukata (Blue)', 8900.00, 25, '2025-07-28 07:51:18.000000', 3),
(42, '2025-07-28 07:51:18.000000', NULL, 'Elegant pink yukata with flower designs', NULL, 'Floral Pattern Yukata (Pink)', 9500.00, 20, '2025-07-28 07:51:18.000000', 3),
(43, '2025-07-28 07:51:18.000000', NULL, 'Classic navy blue striped yukata for men', 8800.00, 'Men\'s Striped Yukata (Navy)', 9200.00, 15, '2025-07-28 07:51:18.000000', 3),
(44, '2025-07-28 07:51:18.000000', NULL, 'Complete yukata set for kids with accessories', NULL, 'Children\'s Yukata Set (Red)', 6500.00, 30, '2025-07-28 07:51:18.000000', 3),
(45, '2025-07-28 07:51:18.000000', NULL, 'High-quality black silk kimono for formal occasions', 42000.00, 'Silk Formal Kimono (Black)', 45000.00, 8, '2025-07-28 07:51:18.000000', 3),
(46, '2025-07-28 07:51:18.000000', NULL, 'Spring-themed kimono with sakura patterns', NULL, 'Cherry Blossom Kimono (Pink)', 38000.00, 10, '2025-07-28 07:51:18.000000', 3),
(47, '2025-07-28 07:51:18.000000', NULL, 'Traditional men\'s formal wear set', NULL, 'Men\'s Haori and Hakama Set', 55000.00, 5, '2025-07-28 07:51:18.000000', 3),
(48, '2025-07-28 07:51:18.000000', NULL, 'Long-sleeved furisode for young women', 65000.00, 'Furisode Kimono (Red)', 68000.00, 6, '2025-07-28 07:51:18.000000', 3),
(49, '2025-07-28 07:51:18.000000', NULL, 'Formal obi belt with intricate gold designs', NULL, 'Obi Belt (Gold Embroidery)', 12000.00, 40, '2025-07-28 07:51:18.000000', 3),
(50, '2025-07-28 07:51:18.000000', NULL, 'Traditional zori footwear for kimono', 8000.00, 'Zori Sandals (Black)', 8500.00, 50, '2025-07-28 07:51:18.000000', 3),
(51, '2025-07-28 08:19:22.000000', NULL, 'Industry-leading noise canceling headphones', 37800.00, 'Sony WH-1000XM5 Wireless Headphones', 39800.00, 15, '2025-07-28 08:19:22.000000', 4),
(52, '2025-07-28 08:19:22.000000', NULL, 'Advanced hair care technology with nanoe ions', NULL, 'Panasonic Nanoe Hair Dryer EH-NA0J', 24800.00, 20, '2025-07-28 08:19:22.000000', 4),
(53, '2025-07-28 08:19:22.000000', NULL, '4-in-1 microwave with steam cooking', 62800.00, 'Sharp Healsio AX-XW300 Steam Oven', 65800.00, 8, '2025-07-28 08:19:22.000000', 4),
(54, '2025-07-28 08:19:22.000000', NULL, '5.5 cup capacity with advanced fuzzy logic', NULL, 'Tiger Electric Rice Cooker JKJ-A550', 29800.00, 12, '2025-07-28 08:19:22.000000', 4),
(55, '2025-07-28 08:19:22.000000', NULL, '4L capacity with temperature control', 16800.00, 'Zojirushi Stainless Steel Water Boiler CD-JSQ50', 18500.00, 25, '2025-07-28 08:19:22.000000', 4),
(56, '2025-07-28 08:19:22.000000', NULL, '3-in-1 skincare device with warm function', NULL, 'Hitachi CM-N4000 Facial Cleansing Brush', 32800.00, 18, '2025-07-28 08:19:22.000000', 4),
(57, '2025-07-28 08:19:22.000000', NULL, 'Bluetooth soundbar with wireless subwoofer', 39800.00, 'Yamaha YAS-209 Sound Bar', 42800.00, 10, '2025-07-28 08:19:22.000000', 4),
(58, '2025-07-28 08:19:22.000000', NULL, 'Premium shock-resistant smartwatch', NULL, 'Casio G-Shock GWG-2000 Mudmaster', 74800.00, 5, '2025-07-28 08:19:22.000000', 4),
(59, '2025-07-28 08:19:22.000000', NULL, 'High-speed wireless document scanner', 55800.00, 'Fujitsu ScanSnap iX1500 Document Scanner', 59800.00, 7, '2025-07-28 08:19:22.000000', 4),
(60, '2025-07-28 08:19:22.000000', NULL, '60% compact mechanical gaming keyboard', NULL, 'Razer Huntsman Mini Gaming Keyboard', 14800.00, 30, '2025-07-28 08:19:22.000000', 4),
(61, '2025-07-29 00:17:53.000000', NULL, 'Authentic Japanese brewed soy sauce', NULL, 'Kikkoman Soy Sauce (1L)', 580.00, 100, '2025-07-29 00:21:13.000000', 6),
(62, '2025-07-29 00:17:53.000000', NULL, 'Katsuobushi-ya no Dashi, 500ml x 1 bottle, Mentsuyu, Noodle soup, 2x concentrated, Diluted, Popular, Ranking, Saturday Plus', 1240.00, 'Yamaki Mentsuyu', 1400.00, 80, '2025-07-29 00:35:45.000000', 6),
(63, '2025-07-29 00:17:53.000000', NULL, 'Pure rice vinegar for sushi and dressings', NULL, 'Mizkan Rice Vinegar (500ml)', 350.00, 120, '2025-07-29 00:22:36.000000', 6),
(64, '2025-07-29 00:17:53.000000', NULL, 'Japanese seven-spice chili blend', 380.00, 'S&B Togarashi Chili Pepper (45g)', 420.00, 90, '2025-07-29 00:22:43.000000', 6),
(65, '2025-07-29 00:17:53.000000', NULL, 'Premium katsuobushi for dashi stock', NULL, 'Marukin Bonito Flakes (30g)', 480.00, 70, '2025-07-29 00:23:42.000000', 6),
(66, '2025-07-29 00:17:53.000000', NULL, 'Instant dashi soup stock granules', NULL, 'Ajinomoto Hondashi (100g)', 320.00, 150, '2025-07-29 00:23:37.000000', 6),
(67, '2025-07-29 00:17:53.000000', NULL, 'Authentic sweet cooking sake', 420.00, 'Mitsukan Mirin (500ml)', 450.00, 85, '2025-07-29 00:22:07.000000', 6),
(68, '2025-07-29 00:17:53.000000', NULL, 'Dried kelp for making dashi broth', NULL, 'Shimaya Kombu Seaweed (50g)', 780.00, 60, '2025-07-29 00:20:59.000000', 6),
(69, '2025-07-29 00:17:53.000000', NULL, 'Citrus-seasoned soy sauce', NULL, 'Kagome Ponzu Sauce (300ml)', 520.00, 75, '2025-07-29 00:20:52.000000', 6),
(70, '2025-07-29 00:17:53.000000', NULL, 'Special sauce for Japanese savory pancakes', 450.00, 'House Foods Okonomiyaki Sauce (500g)', 480.00, 65, '2025-07-29 00:20:45.000000', 6),
(71, '2025-07-29 00:57:26.000000', NULL, 'Rare roasted winter tea leaves from Kyoto', NULL, 'Kyobancha Uji Gold (100g)', 4200.00, 50, '2025-07-29 01:05:14.000000', 7),
(72, '2025-07-29 00:57:26.000000', NULL, 'Ceremonial grade Uji matcha powder', 2300.00, 'Marukyu Koyamaen Matcha (40g)', 2500.00, 30, '2025-07-29 00:57:26.000000', 7),
(73, '2025-07-29 00:57:26.000000', NULL, 'Green tea with roasted brown rice', NULL, 'Yamamotoyama Genmaicha (200g)', 680.00, 80, '2025-07-29 00:57:26.000000', 7),
(74, '2025-07-29 00:57:26.000000', NULL, 'Seasonal maple-flavored green tea', NULL, 'Lupicia Momiji Tea (10 bags)', 580.00, 60, '2025-07-29 00:57:26.000000', 7),
(75, '2025-07-29 00:57:26.000000', NULL, 'Roasted green tea with nutty flavor', 1100.00, 'Ippodo Hojicha (150g)', 1200.00, 45, '2025-07-29 00:57:26.000000', 7),
(76, '2025-07-29 00:57:26.000000', NULL, 'Premium shade-grown green tea', NULL, 'Yame Gyokuro (50g)', 3500.00, 25, '2025-07-29 00:57:26.000000', 7),
(77, '2025-07-29 00:57:26.000000', NULL, 'Cherry blossom flavored green tea', NULL, 'Sakura Green Tea (20 bags)', 750.00, 70, '2025-07-29 00:57:26.000000', 7),
(78, '2025-07-29 00:57:26.000000', NULL, 'Sarasara Instant Mugicha - 100 sticks', NULL, 'Ito En - Barley Mineral Tea', 2400.00, 100, '2025-07-29 01:25:28.000000', 7),
(79, '2025-07-29 00:57:26.000000', NULL, 'Partially shaded Kyoto green tea', NULL, 'Obubu Tea Farm Kabusecha (100g)', 1800.00, 35, '2025-07-29 00:57:26.000000', 7),
(80, '2025-07-29 00:57:26.000000', NULL, 'Instant matcha latte mix', 780.00, 'Nishio Aiya Matcha Latte (10 sticks)', 850.00, 90, '2025-07-29 00:57:26.000000', 7),
(81, '2025-07-29 01:40:03.000000', NULL, 'Oil-based waterproof sunscreen SPF50+ PA++++', 3500.00, 'Shiseido Anessa Perfect UV Sunscreen (60ml)', 3800.00, 45, '2025-07-29 01:40:03.000000', 8),
(82, '2025-07-29 01:40:03.000000', NULL, 'Iconic Pitera essence for radiant skin', NULL, 'SK-II Facial Treatment Essence (230ml)', 25000.00, 20, '2025-07-29 01:40:03.000000', 8),
(83, '2025-07-29 01:40:03.000000', NULL, '5-type hyaluronic acid hydrating toner', NULL, 'Hada Labo Gokujyun Premium Lotion (170ml)', 1200.00, 80, '2025-07-29 01:40:03.000000', 8),
(84, '2025-07-29 01:40:03.000000', NULL, 'Best-selling olive oil-based makeup remover', 1600.00, 'DHC Deep Cleansing Oil (200ml)', 1800.00, 65, '2025-07-29 01:40:03.000000', 8),
(85, '2025-07-29 01:40:03.000000', NULL, 'Lightweight sunscreen with hyaluronic acid', NULL, 'Kao Biore UV Aqua Rich Watery Essence (50g)', 950.00, 100, '2025-07-29 01:40:03.000000', 8),
(86, '2025-07-29 01:40:03.000000', NULL, 'Premium oil cleanser for all skin types', 8000.00, 'Shu Uemura Anti/Oil+ Cleansing Oil (450ml)', 8500.00, 30, '2025-07-29 01:40:03.000000', 8),
(87, '2025-07-29 01:40:03.000000', NULL, 'Clear sunscreen gel with moisturizing effect', NULL, 'Canmake Mermaid Skin Gel UV (40g)', 880.00, 75, '2025-07-29 01:40:03.000000', 8),
(88, '2025-07-29 01:40:03.000000', NULL, 'Camellia oil-infused deep conditioner', NULL, 'Tsubaki Premium Repair Hair Mask (180g)', 1200.00, 60, '2025-07-29 01:40:03.000000', 8),
(89, '2025-07-29 01:40:03.000000', NULL, 'Fast-absorbing cleansing oil', 580.00, 'Kose Softymo Speedy Cleansing Oil (230ml)', 650.00, 90, '2025-07-29 01:40:03.000000', 8),
(90, '2025-07-29 01:40:03.000000', NULL, 'Gentle exfoliating gel for sensitive skin', NULL, 'Cure Natural Aqua Gel (250g)', 2800.00, 40, '2025-07-29 01:40:03.000000', 8),
(101, '2025-07-29 02:52:26.000000', NULL, 'Tailored slim-fit blazer for work', 23000.00, 'Theory-inspired Blazer (Gray)', 25000.00, 10, '2025-07-29 02:52:26.000000', 9),
(102, '2025-07-29 02:52:26.000000', NULL, 'Elegant wrinkle-resistant skirt', NULL, 'Oggi Pleated Midi Skirt (Navy)', 8900.00, 18, '2025-07-29 02:52:26.000000', 9),
(103, '2025-07-29 02:52:26.000000', NULL, 'Premium work blouse with hidden buttons', NULL, '23区 Silk Blouse (Ivory)', 15000.00, 15, '2025-07-29 02:52:26.000000', 9),
(104, '2025-07-29 02:52:26.000000', NULL, 'High-waisted professional pants', 11000.00, 'Untitled Wide-leg Trousers', 12000.00, 20, '2025-07-29 02:52:26.000000', 9),
(105, '2025-07-29 02:52:26.000000', NULL, 'Cashmere-blend layered vest', NULL, 'Nano Universe Knit Vest', 18000.00, 12, '2025-07-29 02:52:26.000000', 9),
(106, '2025-07-29 02:52:26.000000', NULL, 'Iconic heart logo cotton tee', NULL, 'Comme des Garçons PLAY T-Shirt', 12000.00, 25, '2025-07-29 02:52:26.000000', 9),
(107, '2025-07-29 02:52:26.000000', NULL, 'Signature zip-up hoodie with ape head logo', 22000.00, 'A Bathing Ape Hoodie (Pink)', 24000.00, 8, '2025-07-29 02:52:26.000000', 9),
(108, '2025-07-29 02:52:26.000000', NULL, 'Distressed denim jacket with embroidery', NULL, 'Undercover Denim Jacket', 32000.00, 6, '2025-07-29 02:52:26.000000', 9),
(109, '2025-07-29 02:52:26.000000', NULL, 'Vintage-inspired cotton t-shirt', NULL, 'Human Made Graphic Tee', 9500.00, 30, '2025-07-29 02:52:26.000000', 9),
(110, '2025-07-29 02:52:26.000000', NULL, 'Oversized streetwear sweatshirt', NULL, 'Ambush Logo Sweatshirt', 28000.00, 10, '2025-07-29 02:52:26.000000', 9),
(111, '2025-07-29 02:52:26.000000', NULL, 'Comfortable stretchy pants', NULL, 'GU Jersey Wide Pants (Black)', 2900.00, 30, '2025-07-29 02:52:26.000000', 9),
(112, '2025-07-29 02:52:26.000000', NULL, 'Breathable basic tee with Japanese fit', 1200.00, 'Uniqlo AIRISM Cotton T-Shirt', 1500.00, 50, '2025-07-29 02:52:26.000000', 9),
(113, '2025-07-29 02:52:26.000000', NULL, 'Natural linen shirt for layering', NULL, 'Muji Linen Overshirt (Beige)', 6900.00, 20, '2025-07-29 02:52:26.000000', 9),
(114, '2025-07-29 02:52:26.000000', NULL, 'Lightweight open-front knit', NULL, 'United Arrows Cardigan', 14000.00, 15, '2025-07-29 02:52:26.000000', 9),
(115, '2025-07-29 02:52:26.000000', NULL, 'Colorblock wool-blend sweater', 14500.00, 'Beams Boy Cropped Sweater', 16000.00, 18, '2025-07-29 02:52:26.000000', 9),
(116, '2025-07-29 02:52:26.000000', NULL, 'Ultra-soft cloud-like sleepwear', 7800.00, 'Gelato Pique Pajama Set', 8500.00, 35, '2025-07-29 02:52:26.000000', 9),
(117, '2025-07-29 02:52:26.000000', NULL, 'Oversized knit cardigan', NULL, 'Ungrid Lounge Cardigan', 12000.00, 28, '2025-07-29 02:52:26.000000', 9),
(118, '2025-07-29 02:52:26.000000', NULL, 'Winter wool blend coat with belt', 32000.00, 'Plage Wool Coat (Camel)', 35000.00, 10, '2025-07-29 02:52:26.000000', 9),
(119, '2025-07-29 02:52:26.000000', NULL, 'Spring floral dress with layered skirt', NULL, 'Nice Claup Lace Dress', 15000.00, 15, '2025-07-29 02:52:26.000000', 9),
(120, '2025-07-29 02:52:26.000000', NULL, 'Luxury leather crossbody bag', NULL, 'Samantha Thavasa Handbag', 45000.00, 5, '2025-07-29 02:52:26.000000', 9),
(121, '2025-07-29 04:33:23.000000', NULL, 'Waterproof winter parka with Japanese sizing', 42000.00, 'The North Face Purple Label Parka', 45000.00, 8, '2025-07-29 04:33:23.000000', 10),
(122, '2025-07-29 04:33:23.000000', NULL, 'Tailored navy wool coat for business casual', NULL, 'Beams Plus Wool Peacoat', 38000.00, 6, '2025-07-29 04:33:23.000000', 10),
(123, '2025-07-29 04:33:23.000000', NULL, 'Lightweight waterproof urban jacket', 11900.00, 'Uniqlo Blocktech Jacket', 12900.00, 15, '2025-07-29 04:33:23.000000', 10),
(124, '2025-07-29 04:33:23.000000', NULL, 'Classic slim-fit button-down', NULL, 'United Arrows Oxford Shirt', 15000.00, 20, '2025-07-29 04:33:23.000000', 10),
(125, '2025-07-29 04:33:23.000000', NULL, 'Indigo-dyed shirt with signature details', NULL, 'Kapital Denim Western Shirt', 28000.00, 12, '2025-07-29 04:33:23.000000', 10),
(126, '2025-07-29 04:33:23.000000', NULL, 'Breathable summer shirt with hidden placket', 30000.00, 'Visvim Linen Camp Shirt', 32000.00, 10, '2025-07-29 04:33:23.000000', 10),
(127, '2025-07-29 04:33:23.000000', NULL, 'Premium cotton crewneck with side gussets', NULL, 'Ships Striped T-Shirt', 8500.00, 25, '2025-07-29 04:33:23.000000', 10),
(128, '2025-07-29 04:33:23.000000', NULL, 'Vintage-inspired slim straight selvage', NULL, 'Orslow 105 Jeans', 25000.00, 14, '2025-07-29 04:33:23.000000', 10),
(129, '2025-07-29 04:33:23.000000', NULL, 'Technical fabric military-style shorts', NULL, 'Nanamica Gurkha Shorts', 18000.00, 18, '2025-07-29 04:33:23.000000', 10),
(130, '2025-07-29 04:33:23.000000', NULL, 'Contemporary work pants with stretch', NULL, 'Uniqlo U Wide-fit Trousers', 7900.00, 30, '2025-07-29 04:33:23.000000', 10),
(131, '2025-07-29 04:33:23.000000', NULL, 'Utility pants with articulated knees', NULL, 'Nonnative Cargo Pants', 22000.00, 12, '2025-07-29 04:33:23.000000', 10),
(132, '2025-07-29 04:33:23.000000', NULL, 'Ultra-fine British wool with Japanese cut', NULL, 'John Smedley Merino Crewneck', 35000.00, 8, '2025-07-29 04:33:23.000000', 10),
(133, '2025-07-29 04:33:23.000000', NULL, 'Outdoor-inspired knit with toggle buttons', NULL, 'Snow Peak Cardigan', 24000.00, 10, '2025-07-29 04:33:23.000000', 10),
(134, '2025-07-29 04:33:23.000000', NULL, 'Textured wool blend with unique construction', 26000.00, 'Engineered Garments Shawl Collar Sweater', 28000.00, 7, '2025-07-29 04:33:23.000000', 10),
(135, '2025-07-29 04:33:23.000000', NULL, 'Handcrafted leather low-tops', NULL, 'Hender Scheme MIP-10 Sneakers', 55000.00, 5, '2025-07-29 04:33:23.000000', 10),
(136, '2025-07-29 04:33:23.000000', NULL, 'Designer running shoe collaboration', NULL, 'Asics x Kiko Kostadinov Gel-Burz', 32000.00, 12, '2025-07-29 04:33:23.000000', 10),
(137, '2025-07-29 04:33:23.000000', NULL, 'Premium vibration-absorbing sandals', 16000.00, 'Suicoke Sandal-Cab', 18000.00, 15, '2025-07-29 04:33:23.000000', 10),
(138, '2025-07-29 04:33:23.000000', NULL, 'Waterproof nylon backpack with leather details', NULL, 'Master-Piece Rucksack', 42000.00, 9, '2025-07-29 04:33:23.000000', 10),
(139, '2025-07-29 04:33:23.000000', NULL, 'Hand-stitched reversible belt', NULL, 'Yuketen Leather Belt', 15000.00, 20, '2025-07-29 04:33:23.000000', 10),
(140, '2025-07-29 04:33:23.000000', NULL, 'Acrylic/wool blend winter hat', NULL, 'White Mountaineering Beanie', 6800.00, 35, '2025-07-29 04:33:23.000000', 10),
(141, '2025-07-29 07:07:50.000000', NULL, '5-piece cotton set with hats and mittens', 7800.00, 'Mikihouse Newborn Gift Set', 8500.00, 25, '2025-07-29 07:07:50.000000', 11),
(142, '2025-07-29 07:07:50.000000', NULL, 'Breathable stretchy onesies (0-3M)', NULL, 'Uniqlo Baby Romper 3-Pack', 3900.00, 40, '2025-07-29 07:07:50.000000', 11),
(143, '2025-07-29 07:07:50.000000', NULL, 'Organic cotton kimono-style tops and pants', NULL, 'Nishimatsuya Layette Set', 6500.00, 30, '2025-07-29 07:07:50.000000', 11),
(144, '2025-07-29 07:07:50.000000', NULL, 'Waterproof winter suit with foldover mittens', 11000.00, 'Combi Baby Snowsuit', 12000.00, 15, '2025-07-29 07:07:50.000000', 11),
(145, '2025-07-29 07:07:50.000000', NULL, 'UPF50+ sun protection hat with neck flap', NULL, 'Akachan Honpo Sun Hat', 2800.00, 50, '2025-07-29 07:07:50.000000', 11),
(146, '2025-07-29 07:07:50.000000', NULL, 'Knit cotton cardigan with wooden buttons', NULL, 'Shirataka Cardigan', 4500.00, 35, '2025-07-29 07:07:50.000000', 11),
(147, '2025-07-29 07:07:50.000000', NULL, 'Snap-crotch onesie in neutral colors', NULL, 'Muji Organic Cotton Bodysuit', 1900.00, 60, '2025-07-29 07:07:50.000000', 11),
(148, '2025-07-29 07:07:50.000000', NULL, '100% cotton pajamas with cute oni print', NULL, 'Happy Oni Pajama Set', 3200.00, 45, '2025-07-29 07:07:50.000000', 11),
(149, '2025-07-29 07:07:50.000000', NULL, 'Traditional side-snap baby shirts (5-pack)', NULL, 'Wakodo Crossover Tops', 4800.00, 30, '2025-07-29 07:07:50.000000', 11),
(150, '2025-07-29 07:07:50.000000', NULL, 'Absorbent all-in-one for playtime', NULL, 'Pigeon Terry Coveralls', 3800.00, 40, '2025-07-29 07:07:50.000000', 11),
(151, '2025-07-29 07:07:50.000000', NULL, 'French-inspired smock dress with lace', NULL, '10mois Organic Dress', 5500.00, 20, '2025-07-29 07:07:50.000000', 11),
(152, '2025-07-29 07:07:50.000000', NULL, 'Boatneck top and shorts combo', 3800.00, 'Bebe Jardin Striped Set', 4200.00, 25, '2025-07-29 07:07:50.000000', 11),
(153, '2025-07-29 07:07:50.000000', NULL, 'Hand-smocked cotton baptism outfit', NULL, 'Familiar Christening Gown', 18000.00, 12, '2025-07-29 07:07:50.000000', 11),
(154, '2025-07-29 07:07:50.000000', NULL, 'Silk-satin dress with obi belt', NULL, 'Kimono Style Party Dress', 9500.00, 15, '2025-07-29 07:07:50.000000', 11),
(155, '2025-07-29 07:07:50.000000', NULL, 'Wool blend vest and pants for boys', NULL, 'Petit Main Suit Set', 12000.00, 10, '2025-07-29 07:07:50.000000', 11),
(156, '2025-07-29 07:07:50.000000', NULL, 'Absorbent feeding bibs with snaps', NULL, 'Akachan Honpo Bib 5-Pack', 2500.00, 80, '2025-07-29 07:07:50.000000', 11),
(157, '2025-07-29 07:07:50.000000', NULL, 'Anti-slip first walker shoes', NULL, 'Piyo Piyo Booties', 3200.00, 40, '2025-07-29 07:07:50.000000', 11),
(158, '2025-07-29 07:07:50.000000', NULL, 'Multipurpose cotton gauze blanket', NULL, 'Kaneson Nursing Cover', 3500.00, 50, '2025-07-29 07:07:50.000000', 11),
(159, '2025-07-29 07:07:50.000000', NULL, 'Ultra-soft stretchy wrap', NULL, 'Gelato Pique Baby Swaddle', 5800.00, 30, '2025-07-29 07:07:50.000000', 11),
(160, '2025-07-29 07:07:50.000000', NULL, 'Breathable layered sleep gown', 6900.00, 'Hoppetta 6-Layer Kimono', 7500.00, 20, '2025-07-29 07:07:50.000000', 11),
(161, '2025-07-30 04:39:29.000000', NULL, 'Flagship smartphone with 200MP camera', 899.99, 'Galaxy S23', 999.99, 150, '2025-07-30 04:39:29.000000', 1),
(162, '2025-07-30 06:58:10.000000', NULL, 'クッション技術を搭載した高性能ランニングシューズ', 10999.00, 'プレミアムランニングシューズ', 12999.00, 150, '2025-07-31 02:08:02.000000', 10),
(163, '2025-07-30 06:58:10.000000', NULL, 'ノイズキャンセリング機能付き、30時間駆動', 17999.00, 'ワイヤレスBluetoothヘッドホン', 19999.00, 80, '2025-07-31 02:08:19.000000', 4),
(164, '2025-07-30 06:58:10.000000', NULL, '100%オーガニックコットンのクルーネックTシャツ', NULL, 'オーガニックコットンTシャツ', 2999.00, 200, '2025-07-31 02:08:52.000000', 10),
(165, '2025-07-30 06:58:10.000000', NULL, '24時間保冷可能な断仕切32ozボトル', 3499.00, 'ステンレススチール水筒', 3999.00, 120, '2025-07-31 02:14:04.000000', 12),
(166, '2025-07-30 06:58:10.000000', NULL, '心拍数、歩数、睡眠パターンをトラッキング', NULL, 'スマートフィットネスウォッチ', 15999.00, 90, '2025-07-31 02:10:01.000000', 4),
(167, '2025-07-30 06:58:10.000000', NULL, 'RFID保護機能付き本革二つ折り財布', 4499.00, 'レザー財布', 4999.00, 180, '2025-07-31 02:10:12.000000', 10),
(168, '2025-07-30 06:58:10.000000', NULL, '人間工学に基づいたハンドルの16ozセラミックマグ', NULL, 'セラミックコーヒーマグ', 1999.00, 250, '2025-07-31 02:14:14.000000', 12),
(169, '2025-07-30 06:58:10.000000', NULL, '滑り止め6mm厚ヨガマット（ストラップ付属）', 4999.00, 'ヨガマット', 5999.00, 70, '2025-07-31 02:18:37.000000', 13),
(170, '2025-07-30 06:58:10.000000', NULL, 'Qi対応デバイス用10W急速充電パッド', NULL, 'ワイヤレス充電器', 3499.00, 160, '2025-07-31 02:18:59.000000', 4),
(171, '2025-07-30 06:58:10.000000', NULL, 'ノートPC収納可能な防水バックパック', 6999.00, 'バックパック', 7999.00, 110, '2025-07-31 02:19:15.000000', 4);

-- --------------------------------------------------------

--
-- Table structure for table `product_characteristics`
--

CREATE TABLE `product_characteristics` (
  `id` bigint(20) NOT NULL,
  `characteristic_name` varchar(255) DEFAULT NULL,
  `characteristic_value` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_characteristics`
--

INSERT INTO `product_characteristics` (`id`, `characteristic_name`, `characteristic_value`, `created_at`, `deleted_at`, `product_id`) VALUES
(1, 'Color', 'Phantom Black', '2025-07-30 04:39:29.000000', NULL, 161),
(2, 'Storage', '256GB', '2025-07-30 04:39:29.000000', NULL, 161),
(3, 'RAM', '8GB', '2025-07-30 04:39:29.000000', NULL, 161),
(4, 'Battery', '3900mAh', '2025-07-30 04:39:29.000000', NULL, 161),
(5, 'color', 'ブラック', '2025-07-30 06:58:10.000000', NULL, 162),
(6, 'color', 'ホワイト', '2025-07-30 06:58:10.000000', NULL, 162),
(7, 'color', 'ブルー', '2025-07-30 06:58:10.000000', NULL, 162),
(8, 'size', '日本サイズ 25cm', '2025-07-30 06:58:10.000000', NULL, 162),
(9, 'size', '日本サイズ 26cm', '2025-07-30 06:58:10.000000', NULL, 162),
(10, 'size', '日本サイズ 27cm', '2025-07-30 06:58:10.000000', NULL, 162),
(11, 'size', '日本サイズ 28cm', '2025-07-30 06:58:10.000000', NULL, 162),
(12, 'color', 'ブラック', '2025-07-30 06:58:10.000000', NULL, 163),
(13, 'color', 'シルバー', '2025-07-30 06:58:10.000000', NULL, 163),
(14, 'color', 'レッド', '2025-07-30 06:58:10.000000', NULL, 163),
(15, 'size', 'フリーサイズ', '2025-07-30 06:58:10.000000', NULL, 163),
(16, 'color', 'ホワイト', '2025-07-30 06:58:10.000000', NULL, 164),
(17, 'color', 'ブラック', '2025-07-30 06:58:10.000000', NULL, 164),
(18, 'color', 'ネイビー', '2025-07-30 06:58:10.000000', NULL, 164),
(19, 'size', 'Sサイズ', '2025-07-30 06:58:10.000000', NULL, 164),
(20, 'size', 'Mサイズ', '2025-07-30 06:58:10.000000', NULL, 164),
(21, 'size', 'Lサイズ', '2025-07-30 06:58:10.000000', NULL, 164),
(22, 'size', 'XLサイズ', '2025-07-30 06:58:10.000000', NULL, 164),
(23, 'color', 'ステンレス', '2025-07-30 06:58:10.000000', NULL, 165),
(24, 'color', 'ブラック', '2025-07-30 06:58:10.000000', NULL, 165),
(25, 'color', 'ブルー', '2025-07-30 06:58:10.000000', NULL, 165),
(26, 'size', '32オンス', '2025-07-30 06:58:10.000000', NULL, 165),
(27, 'color', 'ブラック', '2025-07-30 06:58:10.000000', NULL, 166),
(28, 'color', 'ローズゴールド', '2025-07-30 06:58:10.000000', NULL, 166),
(29, 'color', 'シルバー', '2025-07-30 06:58:10.000000', NULL, 166),
(30, 'size', 'レギュラーサイズ', '2025-07-30 06:58:10.000000', NULL, 166),
(31, 'color', 'ブラウン', '2025-07-30 06:58:10.000000', NULL, 167),
(32, 'color', 'ブラック', '2025-07-30 06:58:10.000000', NULL, 167),
(33, 'color', 'タン', '2025-07-30 06:58:10.000000', NULL, 167),
(34, 'size', 'スタンダード', '2025-07-30 06:58:10.000000', NULL, 167),
(35, 'color', 'ホワイト', '2025-07-30 06:58:10.000000', NULL, 168),
(36, 'color', 'ブラック', '2025-07-30 06:58:10.000000', NULL, 168),
(37, 'color', 'ブルー', '2025-07-30 06:58:10.000000', NULL, 168),
(38, 'size', '16オンス', '2025-07-30 06:58:10.000000', NULL, 168),
(39, 'color', 'パープル', '2025-07-30 06:58:10.000000', NULL, 169),
(40, 'color', 'ブルー', '2025-07-30 06:58:10.000000', NULL, 169),
(41, 'color', 'ブラック', '2025-07-30 06:58:10.000000', NULL, 169),
(42, 'size', '173cm × 61cm', '2025-07-30 06:58:10.000000', NULL, 169),
(43, 'color', 'ホワイト', '2025-07-30 06:58:10.000000', NULL, 170),
(44, 'color', 'ブラック', '2025-07-30 06:58:10.000000', NULL, 170),
(45, 'color', 'ピンク', '2025-07-30 06:58:10.000000', NULL, 170),
(46, 'size', 'スタンダード', '2025-07-30 06:58:10.000000', NULL, 170),
(47, 'color', 'ブラック', '2025-07-30 06:58:10.000000', NULL, 171),
(48, 'color', 'グレー', '2025-07-30 06:58:10.000000', NULL, 171),
(49, 'color', 'ブルー', '2025-07-30 06:58:10.000000', NULL, 171),
(50, 'size', '20リットル', '2025-07-30 06:58:10.000000', NULL, 171);

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `display_order` int(11) DEFAULT NULL,
  `image_url` text NOT NULL,
  `product_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `created_at`, `deleted_at`, `display_order`, `image_url`, `product_id`) VALUES
(1, '2025-07-23 22:10:00.000000', NULL, 1, 'https://matchalab.co.jp/admin/wp-content/uploads/2022/12/1-scaled.jpg', 1),
(2, '2025-07-23 22:10:00.000000', NULL, 2, 'https://static-cache.camp-fire.jp/uploads/project_version/image/997498/6f866458-9a61-4f5b-8826-316190c69c68.jpeg?fit=max', 1),
(3, '2025-07-23 22:10:00.000000', NULL, 3, 'https://www.atpress.ne.jp/releases/323612/img_323612_4.jpg', 1),
(4, '2025-07-23 22:10:00.000000', NULL, 1, 'https://m.media-amazon.com/images/I/817VcW+hzHL._UF1000,1000_QL80_.jpg', 2),
(5, '2025-07-23 22:10:00.000000', NULL, 2, 'https://ec.jal.co.jp/img/0170/goods/L/4901330575786.jpg', 2),
(6, '2025-07-23 22:10:00.000000', NULL, 1, 'https://m.media-amazon.com/images/I/61vrlAcT+jL._UF894,1000_QL80_.jpg', 3),
(7, '2025-07-23 22:10:00.000000', NULL, 2, 'https://m.media-amazon.com/images/I/41T48A2L7qS._UF894,1000_QL80_.jpg', 3),
(8, '2025-07-23 22:10:00.000000', NULL, 3, 'https://m.media-amazon.com/images/I/51IMvjNIpRL._UF894,1000_QL80_.jpg', 3),
(9, '2025-07-23 22:10:00.000000', NULL, 1, 'https://www.sugar-net.com/phone/data/sugar/product/y-9222-kj-b-f-25tc_1_1.jpg', 4),
(10, '2025-07-23 22:10:00.000000', NULL, 2, 'https://cdn.shop-list.com/res/up/shoplist/shp/__thum370__/eclair/image/gds23s108-a01.jpg', 4),
(11, '2025-07-23 22:10:00.000000', NULL, 3, 'https://item-shopping.c.yimg.jp/i/l/narumiyaonline_6042607', 4),
(12, '2025-07-23 22:10:00.000000', NULL, 1, 'https://www.tokyokitsch.com/images/items/ON/oishii//main.jpg', 5),
(13, '2025-07-23 22:10:00.000000', NULL, 2, 'https://online.aniplex.co.jp/on/demandware.static/-/Sites-all-master-catalog/ja_JP/dw95fac81a/items/title-T/twisted-wonderland/GDS/ny2022/itemYTyDIYdt_001.png', 5),
(14, '2025-07-23 22:10:00.000000', NULL, 1, 'https://www.cupnoodle.jp/assets2023/img/common/package_chilitomato.png', 6),
(15, '2025-07-23 22:10:00.000000', NULL, 2, 'https://www.cupnoodle.jp/assets2023/img/common/package_cn.png', 6),
(16, '2025-07-23 22:10:00.000000', NULL, 1, 'https://mco.jp/mco_cms/wp-content/uploads/USS-12_WH_04-1000.jpg', 7),
(17, '2025-07-23 22:10:00.000000', NULL, 2, 'https://item-shopping.c.yimg.jp/i/n/dukkore_jsqmax_1', 7),
(18, '2025-07-23 22:10:00.000000', NULL, 1, 'https://www.543life.com/content/wp-content/uploads/2021/07/img1_210710-800x500.webp', 8),
(19, '2025-07-23 22:10:00.000000', NULL, 2, 'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcRwpW7R23Gboya4d1ff67CCaHnT7CnkGlWF7DCtvRRCGWb1Mdt39TTHwWlV-d6VOCYChbQ0PJe1V_L1qZ3gswd16RzdMzuA8JwOaI_aqxqeC5ly-d3vkT4ypw', 8),
(20, '2025-07-23 22:10:00.000000', NULL, 1, 'https://www.marukome.co.jp/files/product/25/66a1dbbc-fcd4-43d9-921f-4ac73f8c2c34.png?tm=1727738644', 9),
(21, '2025-07-23 22:10:00.000000', NULL, 2, 'https://www.marukome.co.jp/files/product/353/639fd339-7510-464c-a5b0-58220a0001f7.png?tm=1702176578', 9),
(22, '2025-07-23 22:10:00.000000', NULL, 1, 'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcR8epIxSWOGsfgN3Pv0t2UFGSIPx1W86AeRgeciydMnYpwy-NkGt4vm_cBjxarRFN4hRt75PcaZ0HOwe5fucGsrNXlogfKUP2YaCNm2hg3SZQTfL70_JEOOqZY', 10),
(23, '2025-07-23 22:10:00.000000', NULL, 2, 'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcS3jC9JsfFAfFE3_goOmcyf1E8o3yjt-Eay_UY4NIqgrxtSlOfXdGRMRUfTSLl-GTcqaoQFPrp0KxK-Y-qgI9Z1uSpOzRO7e0eYwp7HX-Js6KSEQ6mjJcw', 10),
(24, '2025-07-23 22:10:00.000000', NULL, 1, 'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQn4JUCsm6SfMQ2euFAbzuJbG91le1XvKafxvoUlWXBkgkgTRriSL58xUXhFb3os5ZbD3ODG4-DiFm5iG3RwFz4KDY0l9t-0LeMYw7OSzrXc1BjivQvAcvD', 11),
(25, '2025-07-23 22:10:00.000000', NULL, 2, 'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQXz6xKa6f9UBDQN_b3uY-WKKDtoloIdnreB28emOdC8mVfqNhapkpiOcjsph3MMUw_VE4YK3lp08A4UfGj0zIvSrwo6u_5UgarbZiPyQNjXMXfXor1eC2UuzQ', 11),
(26, '2025-07-23 22:10:00.000000', NULL, 1, 'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcTtKt_bDIaYYxtpj9qAwjyfEBOtUNvpOJSatblADTv0MVTyrlaiqdqsq9pNlRblL-Ysp0EZhK_Bf8Og_isG-xaCb_3w2iaA', 12),
(27, '2025-07-23 22:10:00.000000', NULL, 2, 'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcS1xOlhHGa9dQbNKjt5bZqohWQnTAycSeXWkX8EvN8tK_mhrEuwVMC4DRjVzG3wYKaDxbQtDfmBfQXIeRXiFkMx80bSQYiU5T0acf_R9gC1', 12),
(28, '2025-07-23 22:10:00.000000', NULL, 1, 'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcRRQBIJnr_77xrxna4fXF0YXmoZ9FKDZxNF-mBrQnvlqJycFnyHJGR-qpW52nULSeEcr55P0nc3af8oAhPd7_1YpsuKYNGZAbRbtZvrxWUaGgXCVmoXIYW4Ig', 13),
(29, '2025-07-23 22:10:00.000000', NULL, 2, 'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcSeFjKue4BMWQpHTVMDT46cwRuW3gppREONR_rxKVuU3r_MGLzOI3jIwmRU-fDLbVP5WuVUAne385DmGYnjYFDQRh92i1YH3AdzjNz1YaQ8', 13),
(30, '2025-07-23 22:10:00.000000', NULL, 1, 'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcT6oWeV83-iZgj8Ie1uQuVoMOl6EOF_0H4B8UZghOzn2LBhosbhXEkUzVBwHUh-EDjHczR5d19hlguHP3L8nkTpVpUWhPcrCR5kZWgAQ6SfWYuWfwGr6BoeXA', 14),
(31, '2025-07-23 22:10:00.000000', NULL, 2, 'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQ7UpG0SKFtbhH4dJo4ssKBH5U0kTeHkQvMC6mFG2Un9vNqHJxS1tOyMTrnj5Zw6-yutOMDMxYtSabKClAXAewxfrlkByTcxja_YGoVkHehTGRi9ae5qE3T', 14),
(32, '2025-07-23 22:10:00.000000', NULL, 1, 'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQrOzoDUTaM6p-ohbctX-TdySTT1qtMEP236B4cyomGQeSNbJ30Qa7zea18-Y4bjzsObN13np-hzRMWuYyMbWjPrPhMGAxdKtVZLaCsTAOZsYISr6yAC22gew', 15),
(33, '2025-07-23 22:10:00.000000', NULL, 2, 'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQN1NerGAOzLbopZXx_CwJSCQPl161un6vhnKt8LHhETBstf8xRRRI6dtTGjVDLMssH6vbv68-1_QKU7Uy-JhTkutZwaBZri_bkMsb-yQiCFsEPZxkC9vZ6Ig', 15),
(34, '2025-07-23 22:10:00.000000', NULL, 3, 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcRJtaSaR-bXdhNfTR2Wmbd_pusXmkdeehOubSaI1WxRlQKrgKktPRUKM8WmPrbkGmUScl2pcS_v16DPbFWM5W5AWWc5E8MqpAix6EjVPUI11bkFp551evRGuQ', 15),
(35, '2025-07-23 22:10:00.000000', NULL, 1, 'https://m.media-amazon.com/images/I/51eTLi8Tx3L._UF894,1000_QL80_.jpg', 16),
(36, '2025-07-23 22:10:00.000000', NULL, 2, 'https://m.media-amazon.com/images/I/61EpHmkTwZS.jpg', 16),
(37, '2025-07-23 22:10:00.000000', NULL, 1, 'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcR1yt2-JJ2q6D-bOxfG3CfP2mYqm0RdKskwFey1cl68AYqW16_JdDzFKEARHUvjtUjvdWj9x63CgbFubco7OTHlNDT-_w-E4U24ykbuFvAMQ7KWKLY2GfhT', 17),
(38, '2025-07-23 22:10:00.000000', NULL, 2, 'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQY_ZQWpv0nwVjtaBydX-ncgK0gTF7I0KEM425icwvjcaBHgoOKY_tEhrv--nex9iZqvfV4Hm8CrQ6YnASNo57UykyfYv2qf_Xbp6-8JcyraWG-MTJto7af', 17),
(39, '2025-07-23 22:10:00.000000', NULL, 1, 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcRKbLQkT6H50vjeu5kRoqIu9bU7RIq9Vx1W9mJ5EPqW28dRG-ediktrCps5UFLYnl4Op-kubHfTnq2o538hgW9oojeo_hWMwgmj8YT5MGU36d4QKnDZE2Xg', 18),
(40, '2025-07-23 22:10:00.000000', NULL, 2, 'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcTgRnnvIxiLOKrmFZUUbPM6Bws_I2TgPuMJsoW2KCLnpOo3mrtqf2VSZ_qAC4aFu52PkovWlo7hbxpWGt1JipL9FAjrHTALSKN4b3E1LWhdInBiQoAvYP7y2Q', 18),
(41, '2025-07-23 22:10:00.000000', NULL, 1, 'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcSl-doRkzKW_TrnOy89Zvwa7l4tmLsFkEB_W99SSIVBB_J15MzrYUtqsVBYZ6aK34xrY4rd5vAyivAzHitfJZEXaqOEhYtcEBhDjeHcPRdhn-tH8xZXzwAm', 19),
(42, '2025-07-23 22:10:00.000000', NULL, 2, 'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcSC-xb_AlTakL1o5eOIIRix56sPMtQ_CqqAQ_dCT5-GaGAQ_LyKsDKYuIUU99tzC1h-f_bar-k32d5cVzwmYD154tnINwE4', 19),
(43, '2025-07-23 22:10:00.000000', NULL, 1, 'https://m.media-amazon.com/images/I/61fTaQ-6+qL.jpg', 20),
(44, '2025-07-23 22:10:00.000000', NULL, 2, 'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcRho_HqGrInwSBedzVuvTYnb6dkpE5YYjgoF5D2ZKbXvxm2YyCx_Jtd8Wd9tVeCw-DUiAf3aYdMM4-mkZmw2tMBSbUqtpvhC_bgV1onmW0YlRn1Mnrh2WlIfw', 20),
(45, '2025-07-23 22:10:00.000000', NULL, 3, 'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcRho_HqGrInwSBedzVuvTYnb6dkpE5YYjgoF5D2ZKbXvxm2YyCx_Jtd8Wd9tVeCw-DUiAf3aYdMM4-mkZmw2tMBSbUqtpvhC_bgV1onmW0YlRn1Mnrh2WlIfw', 20),
(46, '2025-07-28 07:00:13.000000', NULL, 1, 'https://www.tofucute.com/images/1201_kitkat_matcha_greentea_large.jpg', 21),
(47, '2025-07-28 07:00:13.000000', NULL, 2, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTlzxzhfuFTQjn21BcoVYbHo-pwgmI7-cH2ZdaoTa-AKXDe0SOR30hz3p7WEXDj0kCcFw&usqp=CAU', 21),
(48, '2025-07-28 07:00:13.000000', NULL, 1, 'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcSNY-ImMG7re8sgAeFLg8ob8u6B86j_S412Rs3ruP-wcFaD8s5SwXX11oVjfQJFNCiRSnNTe6QRVlQVmw0LM11KcP0UVSaDYGJfBUgxQA3l8lr85pvuu6Ex', 22),
(49, '2025-07-28 07:00:13.000000', NULL, 1, 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcRKjgkslrCCNb0RIA_FbFSRYCLdIsxgFcDPnHwp71OcOVWrCm4Lsz7xMmmTgcRcJE1TudY5ChBkoo4Ey5J2OKbbhWyiQm6FMDupFEJT7VjWwA99ZNPvilzypg', 23),
(50, '2025-07-28 07:00:13.000000', NULL, 2, 'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcSs48Ei0CtbaxosYZ93RmB0m6Rvpf2tqzHeH83ZS09svZIZmwu9wsbflvvLPLgWNTZ6RariSZ5pSsl41eV2Y1SsYu8BqWF0', 23),
(51, '2025-07-28 07:00:13.000000', NULL, 1, 'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcS2XT4geEzSjZO_MoYLPsONLdtNRV9B-hb6kC-kzWpXW6ZfbVRJssn5BI-3qnUbB-Bbyw-4oiNgR786eDdq-GqjCO9CHgeZh5xOBVbhkhJ4Ob_0XcumUM-H', 24),
(52, '2025-07-28 07:00:13.000000', NULL, 2, 'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcRsp-XPK-gsA6n-SApYlJ3dFFzdyzteIzwn3HMf0ccFv7kfeaKfSYLzMBH48YNIGVKWxwH7YJNknSlwtzBFL3xHEy5uTAMuDqGH_KdgLeg', 24),
(53, '2025-07-28 07:00:13.000000', NULL, 1, 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcT8Ive9J7MVF69KDBdSSEYZYcZsVYSXPd1FScCmL85SkbnOIHmRkNhUr7UsIQ9Wefd4CvEL-5jNvAIZAce2QNvhkdbF4Efa6yndCaUbXqVdiWmeNmNwItj7OQ', 25),
(54, '2025-07-28 07:00:13.000000', NULL, 1, 'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcRqFnzGmFEURN-WX93mps-ydglWqjYkZQEEHu0mA0eydTAAnYJBOLQzBBzr5N1PDSYPZ5r3GIEwMA8PSSMxpeTTaiJEn1pL_47P8JS1gRkivhPcrBf2mwOltg', 26),
(55, '2025-07-28 07:00:13.000000', NULL, 1, 'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcSXw-V6eAQkdx8cfmLXOZQ6RDs5NQkueqZZmGFNC04sAsDR2CBwDS6xcVJBABVTkpoNs3VtwL-1uUzbF5i0J0-w2BuTqVonCbwkw75dgdg3H3i9qRezeRL3', 27),
(56, '2025-07-28 07:00:13.000000', NULL, 2, 'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcSsmILyeDpdWG9l5ArMqKBVY9rWDjHvXG5o2RIfnRN1p_Utxn8LUCFht1VQg7EkYel9vQMAVQPukjWNBCgBbJ63aTLirvgVKi6qZmBhP5DKJd8uNKPC93cj', 27),
(57, '2025-07-28 07:00:13.000000', NULL, 1, 'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcTLF9_u3CN7-NQz1g8Dsm3oxVKNclObPTd75n_lh9fWw_b2r7_UqJjt3GoG-eQbbGqIc7YCJrC6ZdFTNpTI5J8wZN8moK-JfJhslb8Cb045JiQ_YTI10iRGsQ', 28),
(58, '2025-07-28 07:00:13.000000', NULL, 1, 'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQM_vR6m-S4aolj5pdl0FtS3qWrmR6AYMaXUCqr3thfHa0UOmL60mQHGqxXc3zF9dEU4Qr8mrLUeXZwq5-HpQhUbL6VM0O27QenydDczRc', 29),
(59, '2025-07-28 07:00:13.000000', NULL, 2, 'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcTMR3UlCVbe7LWCiwXwRWesq_lXQVedYdlkhfu_k4InlK3wIXhJu6aO_Oxr8KlLPTdgv_Mv7BGPwk6qnVY8OA08Up07g0_xmegJU4XDueTR', 29),
(60, '2025-07-28 07:00:13.000000', NULL, 1, 'https://int.japanesetaste.com/cdn/shop/files/P-1-CALB-JKOTAR-1_6-Calbee_Jagarico_Tarako_Butter_Potato_Sticks_Pack_of_6.jpg?v=1743417520&width=600', 30),
(61, '2025-07-28 07:00:13.000000', NULL, 2, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSV4WSOjiqbXiisiacSBkxMv4FBXy7VHZqYexEePgHp_niHZb_n2WJKnQj69pf7EITnq3s&usqp=CAU', 30),
(62, '2025-07-28 07:31:04.000000', NULL, 1, 'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcSUtV60tHnEiUZ9Le_IbYx8lQiOjYcpV4dXZCuSs0whUqfZfBaK8QSRVGzccln4H-2zfwZ671DIVr0Wvs8rdZ9JyMzFVZMjGJcaiUyZmYkG', 31),
(63, '2025-07-28 07:31:04.000000', NULL, 2, 'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcSGmWlQCKH3fb0a25hhi9UNuradsGkpopuEx2k29Kbq77EqjZHbXkFzCtnMaN5Bd86pxdekv-JT2Ti3A13MBfFTH11GRPUQpDDNpzfibKZiy9h6AugWUEExjQ', 31),
(64, '2025-07-28 07:31:04.000000', NULL, 1, 'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcRUgmlpxzlbC5UlbAOQAntFmis3Nv25Nm6Fr2vFkKnHnl7ZgPzyUOCAdk9aFKyoNIlw5k2qqZ0FWWHNPM6vWVchUE996QkVXifwP_oHtI8E', 32),
(65, '2025-07-28 07:31:04.000000', NULL, 1, 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcSb9lVscUwAmOQ6K2GPhOIzix8yU9ygtaToawIZUX5IluSXQqvFl1TfHfdtTO7VxtLbJgpuxt3Yj9yTBy5L4mtboI-RwqEw', 33),
(66, '2025-07-28 07:31:04.000000', NULL, 2, 'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcSAixoXYWJi3_M-RX0haesVT0eUMiNcLzAJ-wKDHoOTK7-j3HTGh82XESDSh8MF_ddJyv5XEA_gR3yJm8V8QgIx1cpGxWvSINI6_Mi9rq8R2FxJL94kD5dIeQ', 33),
(67, '2025-07-28 07:31:04.000000', NULL, 1, 'https://m.media-amazon.com/images/I/81dsUFoLSZL._UF894,1000_QL80_.jpg', 34),
(68, '2025-07-28 07:31:04.000000', NULL, 1, 'https://www.j-grab.com/cdn/shop/files/49698626.jpg?v=1711357143', 35),
(69, '2025-07-28 07:31:04.000000', NULL, 2, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8nerPAjfhLYySp6jGduKwLsS1wl6zkvyNHueMqp44fU9RB8Gl2xtlg97lItzSoAS8F1U&usqp=CAU', 35),
(70, '2025-07-28 07:31:04.000000', NULL, 1, 'https://m.media-amazon.com/images/I/81DqbbvEF4L._UF1000,1000_QL80_.jpg', 36),
(71, '2025-07-28 07:31:04.000000', NULL, 1, 'https://m.media-amazon.com/images/I/517XsB1KnIL._UF894,1000_QL80_.jpg', 37),
(72, '2025-07-28 07:31:04.000000', NULL, 2, 'https://i.ebayimg.com/00/s/OTA5WDE2MDA=/z/hdEAAOSw~BNjjdl4/$_57.JPG?set_id=8800005007', 37),
(73, '2025-07-28 07:31:04.000000', NULL, 1, 'https://static.wixstatic.com/media/61514a_58cefc00187c4463942d8b6e77133f7a~mv2.png/v1/fill/w_980,h_551,al_c,q_90,usm_0.66_1.00_0.01,enc_avif,quality_auto/61514a_58cefc00187c4463942d8b6e77133f7a~mv2.png', 38),
(74, '2025-07-28 07:31:04.000000', NULL, 1, 'https://tokyofreshdirect.com/cdn/shop/files/instant-bowl-noodles-ikkousha-tonkotsu-flavor-611005_600x600_crop_center.jpg?v=1737064699', 39),
(75, '2025-07-28 07:31:04.000000', NULL, 2, 'https://tokyofreshdirect.com/cdn/shop/files/instant-bowl-noodles-ikkousha-tonkotsu-flavor-611005_600x600_crop_center.jpg?v=1737064699', 39),
(76, '2025-07-28 07:31:04.000000', NULL, 1, 'https://japanese-snacks-republic.com/media/binary/000/042/224/42224.jpg', 40),
(77, '2025-07-28 07:51:37.000000', NULL, 1, 'https://i.pinimg.com/564x/c0/b6/eb/c0b6eba846f0326614021d227ab49a21.jpg', 41),
(78, '2025-07-28 07:51:37.000000', NULL, 2, 'https://www.kimono-yukata-market.com/cdn/shop/products/06301609_5774c5a2dc69b_f3acd6e2-1096-4409-911d-a1b6b94b015a.jpg?v=1571374793', 41),
(79, '2025-07-28 07:51:37.000000', NULL, 1, 'https://rond100.com/wp-content/uploads/2023/07/bc76c548bcf06b053ce638db982e3269.jpg', 42),
(80, '2025-07-28 07:51:37.000000', NULL, 1, 'https://m.media-amazon.com/images/I/51JzpuF3CxL._UY1000_.jpg', 43),
(81, '2025-07-28 07:51:37.000000', NULL, 2, 'https://japan-clothing.com/cdn/shop/products/Yukata-Homme-Japonais--Kurayoshi--Japanstreet-1646497806.jpg?v=1650305015', 43),
(82, '2025-07-28 07:51:37.000000', NULL, 1, 'https://m.media-amazon.com/images/I/51nQ9wEY9pL._SY1000_.jpg', 44),
(83, '2025-07-28 07:51:37.000000', NULL, 1, 'https://japaneseonimasks.com/cdn/shop/products/japanese-style-men-kimono-traditional-ro_description-12.jpg?v=1639993507&width=533', 45),
(84, '2025-07-28 07:51:37.000000', NULL, 2, 'https://i.shgcdn.com/c28eba27-7fd3-4e0f-b6d7-49623b0e1bd7/-/format/auto/-/preview/3000x3000/-/quality/lighter/', 45),
(85, '2025-07-28 07:51:37.000000', NULL, 1, 'https://kimono-ren.com/sakura/img/intro001.jpg', 46),
(86, '2025-07-28 07:51:37.000000', NULL, 2, 'https://i0.wp.com/tokyotreatblog.wpcomstaging.com/wp-content/uploads/2024/03/hanami-fashion-thumbnail.webp?fit=1024%2C683&ssl=1', 46),
(87, '2025-07-28 07:51:37.000000', NULL, 1, 'https://images-cdn.ubuy.co.in/661c1da2a5029264137c1750-japanese-men-039-s-kimono-samurai.jpg', 47),
(88, '2025-07-28 07:51:37.000000', NULL, 1, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_2QoHYr8uXNf35LF01LGun0udlMvioWtY4w&s', 48),
(89, '2025-07-28 07:51:37.000000', NULL, 2, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuQZMOioskar7p1gN78j7AfZl5tTF8yTDN_CCjUG-x2VJHCK1xK3dLAyMyxVPAXlotLzA&usqp=CAU', 48),
(90, '2025-07-28 07:51:37.000000', NULL, 1, 'https://i.ebayimg.com/images/g/8NIAAOSwyVNmFNNr/s-l1000.jpg', 49),
(91, '2025-07-28 07:51:37.000000', NULL, 1, 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcSYzQFewUfzg2SfY0dFUrnD4-Zw5gEPXCZX7t9X3OF5kTKuxrAWiOkWDr9_fISy5vXUDQXclzRZkbN0x0LGAj5_pqOkuXLeAoxN5JXTwP21SeZduwc2yBV59fA', 50),
(92, '2025-07-28 07:51:37.000000', NULL, 2, 'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcRc9BuwfSSo66VUazmewNOBp4u4K6mtBkohxmZxCPC5L8IEPtEhViVYzRvwUb4hSET7ZHkvBVLOOIY9ZDvWa4yRvvnTabYErGzF0hxphNQRd_e4Ux05KJFmDw', 50),
(93, '2025-07-28 08:19:33.000000', NULL, 1, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTu7SaTKAku8-4xJUKi5lCYfxPXnKhizFhQFDNvXtYMym4vvPuYkQ_4wrkRVArHim7JQFA&usqp=CAU', 51),
(94, '2025-07-28 08:19:33.000000', NULL, 2, 'https://cdn.mos.cms.futurecdn.net/qvKb7uEBtv8UZxYDSkiQji.jpg', 51),
(95, '2025-07-28 08:19:33.000000', NULL, 3, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSofqlw9pgBSAz1o0NPPeTUU1kiGWDIS38ohg&s', 51),
(96, '2025-07-28 08:19:33.000000', NULL, 1, 'https://m.media-amazon.com/images/I/61gZclAwcrL.jpg', 52),
(97, '2025-07-28 08:19:33.000000', NULL, 2, 'https://img.shopping.friday.tw/images/product/281/8456908/8456908_3_1.webp?946898', 52),
(98, '2025-07-28 08:19:33.000000', NULL, 1, 'https://m.media-amazon.com/images/I/61SoeS58bQL._UF894,1000_QL80_.jpg', 53),
(99, '2025-07-28 08:19:33.000000', NULL, 2, 'https://m.media-amazon.com/images/I/61c3YAiOFyL._UF894,1000_QL80_.jpg', 53),
(100, '2025-07-28 08:19:33.000000', NULL, 1, 'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQsM8fp_KiArKQk0yxD9DwhajVYAbQICmfgvB7UdV4mrPRjZWb2kz9HL145OP3lb5lqlZ7CY2E4fbYXEdgzCmKCLcVguxvw2FdUHzZqH2KQO-1616oloKutEg', 54),
(101, '2025-07-28 08:19:33.000000', NULL, 2, 'https://m.media-amazon.com/images/I/61c3YAiOFyL._UF894,1000_QL80_.jpg', 54),
(102, '2025-07-28 08:19:33.000000', NULL, 1, 'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcRX_H8uGG_wl3OF-ze25nLkwXRe_3p-HUd0gbku0qN8-Xf4P9oHt6ynfccbvsC3Ge8aXvEZAvVKN7uFAxWOHqfsmMvLWdw43o_RB3DxdoQHlnrSxb6uhA2f', 55),
(103, '2025-07-28 08:19:33.000000', NULL, 1, 'https://fitter.cosme.net/media/product/10107/229626_xl.jpg?target=360x360&size=trimIfLarge', 56),
(104, '2025-07-28 08:19:33.000000', NULL, 2, 'https://www.yohohongkong.com/_next/image?url=https%3A%2F%2Fwww1.yohohongkong.com%2Fimages%2F201907%2Fgoods_img%2F5422_P_1563744188820.png&w=960&q=100', 56),
(105, '2025-07-28 08:19:33.000000', NULL, 1, 'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcSoJSGZmSBJ4OHNSxTZrGf-t7YS2I7I-Xhpa3e_KCkTHAfpyoY98zslnO0-O36RQE5Z_PsW89mRwnhfl632JI16oAxME0hNsxPg_fDZAE-A7xUPdcLyiasSMA', 57),
(106, '2025-07-28 08:19:33.000000', NULL, 2, 'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcSpBfRolhjsPQNGHisDFI1pp-hqJjJnM2ECBhv20wtSo1ZYSFkBQ_VsUfn2vVXuzx3b9fxeSJjzL0CVv-hoDNyXL0DC-cUq83rXHw8FyPInrOdepMOw95hh', 57),
(107, '2025-07-28 08:19:33.000000', NULL, 1, 'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcTRozB5UfdL9TPOWJH-Vl8vu-n3wqaO3kw-GNRg2MM1yRHvt-HLn541iPi3K3308vLMz_7gi0W4qkTSRoOdGyM9b0ZmH1SYTX0y8Y0uo6PWjqpVBgX-KBey8g', 58),
(108, '2025-07-28 08:19:33.000000', NULL, 2, 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcSa8CGuony7ip1pa13KVZ7AzpQXilUhmaypDPPbmlSfEpiMqoPgD7d-iysUsNBTR17KWrErTqTedJqHfjyqvJ31F2lecJATqOTAFcAMXtQsC1tLhXQg1A1ynbI', 58),
(109, '2025-07-28 08:19:33.000000', NULL, 1, 'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcR1dl1bP172KKAxnwjw1wH5u_t9k4ZSfsQ4ENEd7orvANgfp2fQ5zJsmF-2RqeVTvakNCm1taUhmb8crmoTNck0Hg7ZAJnJJP-UJzCOCspAuP6hgSb6nZOcoQ', 59),
(110, '2025-07-28 08:19:33.000000', NULL, 2, 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcT9O94S4HNqogsxw63LB3k3hNyk__7-FYamkF1o6wnAbBcliNxSC5p6yeLgpc8LoYZrZj843QI9qfha89EhfrVb2dBohcZYtdLiDdhEAInKSiYXGRULXihI', 59),
(111, '2025-07-28 08:19:33.000000', NULL, 1, 'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcTAykmWzjz1eETtXIhFSemfEr7d6Nyvncjj7uvnpVLRJm12QD532lfAQqGLLrL-fE7NCfCSruTw8Gx5EVH53h1H3fvpZ8uSGWN6jDxFKRSFtIxBYZbIMl5pqQ', 60),
(112, '2025-07-28 08:19:33.000000', NULL, 2, 'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcRDn7cU55jgIf4iv8ziQ_7BqZ3q5rkx5AwLqH7R2oW-SGHiwz_uRbdQu0-DzjiOoeOOzNwqS0bfCqkd8pqsNIKWiODO0scV1jmoH0u-8fhbzQeS84x-oIAmVw', 60),
(113, '2025-07-29 00:18:12.000000', NULL, 1, 'https://m.media-amazon.com/images/I/71-WQ5ThQXL.jpg', 61),
(114, '2025-07-29 00:18:12.000000', NULL, 2, 'https://www.asiamarket.ie/media/catalog/product/cache/1ae38c744b0a21fab02034b60751c21a/k/i/kikkoman-soy-sauce-1l.jpg', 61),
(115, '2025-07-29 00:18:12.000000', NULL, 1, 'https://m.media-amazon.com/images/I/51749xPvYSL._AC_.jpg', 62),
(116, '2025-07-29 00:18:12.000000', NULL, 1, 'https://www.myconbini.com/cdn/shop/products/mizkan_kome_su_rice_vinegar_2.jpg?v=1621342480', 63),
(117, '2025-07-29 00:18:12.000000', NULL, 2, 'https://cdn11.bigcommerce.com/s-ji18vmeuwa/products/483/images/741/3041-1-Mizkan-Rice-%252526-Grain-Vinegar%25253Fw%25253D1200%252526h%25253D1200%252526sm%25253Dc%252526fmt%25253Dauto__00264.1753496184.1280.1280.jpg?c=1', 63),
(118, '2025-07-29 00:18:12.000000', NULL, 1, 'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcRLE6AmvsJFaKvVZE2IMd9RmG3LziJILNSDcnx2FT_tCvGobRMtyRigf3vR7G5qAUIqyclILkLP527EIoJbjVHc94-jRfPmvU-GGa8sEJlpTou88QFPT2xvtLo', 64),
(119, '2025-07-29 00:18:12.000000', NULL, 1, 'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcRrufBe-I_7t1s7uWZGxyFAFWyKrki_c6E_BTeB9rjypGmvGabfbsyV__HKhbjg_Ft76EKNDlLoFGyq-T5fAoZM9u7MfUgnzZ8JQtygQiVlMFP-Hd7DfmLJ', 65),
(120, '2025-07-29 00:18:12.000000', NULL, 2, 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcRASxxz9T4aOBl647dBk8T9iF8MsOAIiFvKzNJOp-mVPY6K6iY01VdSJUFuSzucedXBCacBKJQyadGvpceHzVe-NaiwFHi0x1y-v2-rwQ5_oAjxUZfvHfUuCw', 65),
(121, '2025-07-29 00:18:12.000000', NULL, 1, 'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQTRR9Co9rPH41o_-oobFziicqITEMDtvH3SSga0uM-FP5R2Oy-8OI3hML2HoYDP3MA5zUTIZAdRVA-QQ7hqF5hof_UksGcidpRMV23QPsE9Sai8Hg4gRXOLEo', 66),
(122, '2025-07-29 00:18:12.000000', NULL, 1, 'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcTcX26qvgl9UN5e44RR5d9ZLyyQSPkwmx9-fxXOb0IMKjQwCo99LP1WH7i6yBc8h7hc6kdbBYx_qlwu7jgnvsQPEbg9UD_huBRk3xxJPOSSq2j3dYZba5qHmfE', 67),
(123, '2025-07-29 00:18:12.000000', NULL, 1, 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcRs4WNnqL0bxY_FZNi6L4z6kmH6givWirXEK7rbYCnbKCww7OGLsb_CoW2e78HbKJhNc2H_0V3iboACB6brkOqguNbIHMXWON1x-sbLb2GPOXx63MX_zS_61A', 68),
(124, '2025-07-29 00:18:12.000000', NULL, 2, 'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQDzytvFs_PATXemwvkJLMVVjGM0MYI5SlphceudzTLioIJvGSPvsFtKOJYd_lI6mYBs4Q1UcERiDXKwf0T-97LwoW6cIfe6Qr0iVycq1yv-LOjVGSlVDWfTA', 68),
(125, '2025-07-29 00:18:12.000000', NULL, 1, 'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcR-NJIduQALv-rWSXibS30Ca6LiWm1KEtmWmN7aJIkVVCgLjBGyOLBwmvGJ21H9XtHr-BKhGY_fyvIrCZVkmHY02Fu-XoBmfR01nBAIbtjYW043ht1ea2CCbQA3', 69),
(126, '2025-07-29 00:18:12.000000', NULL, 1, 'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcRe3rnxIroov2kqqpGMT75BEC9Q9MQgJ3LoAdcGES74n1M0JD_P_DMrOr57WcRAYuizK8i4zkkRD2lMGDd6lP01PAzAohnN9Kdl8aRpbpnuuLA0q2YmgP_pxQ', 70),
(127, '2025-07-29 00:18:12.000000', NULL, 2, 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcSWF-1dn_mX_XqVzNhes9mRKRrD5OMX08t4h8Cma_QZYFUfP8wmb8HCJ_9VVjJ0RkfqVXXBqkobz0cEnRQiYMFY9y8gLWRNodKXQhAjgg8X8RCYz2bqltNN', 70),
(128, '2025-07-29 00:57:40.000000', NULL, 1, 'https://cdn.yamibuy.net/item/9c241a9777c90669fcea8843a617921b_750x750.webp', 71),
(129, '2025-07-29 00:57:40.000000', NULL, 2, 'https://www.katagiri.com/cdn/shop/products/YamashiroUjiMatchaGreenTeaPowder_400x.png?v=1664177004', 71),
(130, '2025-07-29 00:57:40.000000', NULL, 1, 'https://www.marukyu-koyamaen.co.jp/english/shop/wp-content/uploads/2020/11/01-01-tenju-40g-7382.jpg', 72),
(131, '2025-07-29 00:57:40.000000', NULL, 2, 'https://m.media-amazon.com/images/I/51jnj77uwcL._UF1000,1000_QL80_.jpg', 72),
(132, '2025-07-29 00:57:40.000000', NULL, 1, 'https://cdn11.bigcommerce.com/s-ji18vmeuwa/products/2052/images/2273/15792-1-Yamamotoyama-Genmaicha-Loose-Roasted-Brown-Rice-with-Green-Tea%25253Fw%25253D1200%252526h%25253D1200%252526sm%25253Dc%252526fmt%25253Dauto__94011.1686745607.1280.1280.jpg?c=1', 73),
(133, '2025-07-29 00:57:40.000000', NULL, 1, 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcRyBcZeDMGImrMLKSJhKghZMvp8rKCFY9yzGj41GcRkLeCq9dqFOVW4cBxGNiVZ0iDNDcyb1PfKWbYI7CG3qvNGzMWfD8Rsojywj_IRv4X9cPfwb4rxy6UlVQ', 74),
(134, '2025-07-29 00:57:40.000000', NULL, 2, 'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQ3JT5Ih9gZK3dRJ_SN6H9uDFPGJXDEamd9tn8EmylDxOD_FAf9QMt0Oqo---IAc5ocfLJRjJCcHWGe1ng_0wKkNMIOFa5-vhaVzwiD8H8WMQc5nvtKym8r', 74),
(135, '2025-07-29 00:57:40.000000', NULL, 1, 'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcRZWpjFxytiT-6N9OwdEQHhvRPX7C7ebUJoXhi8QFsqGCzVkhUwt4vHYEf_VzQGnjHalB4xRyesoXcGOwPxYqWzxkFy8yJA0wECDu1xwHvQHCzIf4lw5Pvu5A', 75),
(136, '2025-07-29 00:57:40.000000', NULL, 1, 'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcScsJTs0_qsZ-Hm0Bgt4AXTEyXPf6FX_IuKKJf2YfgWZOI3tUQkWKSWU2kdJiNLVI7NiuQrKFPI_dwPJFvYmDoMws1oNVDoY6Cf2Ls8TC4FirLW9064qyZkMg', 76),
(137, '2025-07-29 00:57:40.000000', NULL, 2, 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQJjcdK-fF-pDVymrAWHzXBOj-crfDMaKfsfKApwpFRAnZ8h_xyq47mYreoHv5c22vNfCOQSwiK0AgjAMo9Hc9G3Z7IBzfjIG08N12yCnJeVgs_r8pL59TPAw', 76),
(138, '2025-07-29 00:57:40.000000', NULL, 1, 'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcRw5eoXHLWGEx8Vlhr0vhwTaZZ8CbK3r-VjSVoK4pwvnvcFMWXz1EFewMmhF4HFMSQDCNcPY--_7O_hJaaTEQBuHhmPVgK3PMcButAjdLfk', 77),
(139, '2025-07-29 00:57:40.000000', NULL, 1, 'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcTTRrkZOYYqL97PEkdriyxo3-Ptdsp6y8pLbbaDTBNVE8gUP4rQJ33dY2V57-O-67bMDdMPDy-pFT0BJXoGa0KilLOQfAXUB1EOZMlJuIf7DiUkUDcRgTuy', 78),
(140, '2025-07-29 00:57:40.000000', NULL, 2, 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcSIEb6R45Mwak4gie_mxnvW3JQVUDEfzwCbm_QxRDi6HwmW62UyvQUvvSv26347pwlS78UZmzJKoS6YvKHdyC0_kXs_eNsUxqQ58WltglAMdDq7PjeUXckd', 78),
(141, '2025-07-29 00:57:40.000000', NULL, 1, 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcT4N5v_ZHj0UuSe9S5-TP-07YyPdAnPXfqe6k2ai9mUiGSn6bwQKwd7Cwu4nLlU6m-PyX2vajagK0moT0It8QgbfWbO_Apkn9WDmc2-kjr4WRQDSWjNl91J0Q', 79),
(142, '2025-07-29 00:57:40.000000', NULL, 1, 'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcTbt5kTXtjf00M1OA4KWgnEa1APGLnztReul0KmSshp486wrsNzOIiPiK3nCSksLwu572iWGfFtNrGUjpkY1u-nSfTHDuSNcMXKVCWciEPFMK4wzcyBJYaupNQ1', 80),
(143, '2025-07-29 00:57:40.000000', NULL, 2, 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcSXj5GraPDwXgUYCNVmcGN2vx5-kmXuMz7AdWg1rBAmacbophPFePG6vI3-xx9YwwqCl9RgK2AQ3asZhGJ1oYtYq4M1m7gY8IQNJPJflka5TXeviYQhrf9trj8', 80),
(160, '2025-07-29 01:40:09.000000', NULL, 1, 'https://m.media-amazon.com/images/I/51v8K2bhfbL._UF894,1000_QL80_.jpg', 82),
(161, '2025-07-29 01:40:09.000000', NULL, 2, 'https://www.novela.com.sg/asset/ZVkwRjFpRHJzbEhSNEFPRWxCaVZsRldRK1FnQTQ3OTU1VjdEbCtvSFFLV1MrNDJtVFBnQnZWYXg1THBjWE5GcHpDMktxSmlXMlZubXRYb2xhL3U2TERKNi9hRjAwd002V0Y2d0NZYTdEWVpxQTZQNFFXWWFDTUUxU1JZWlFkRmY', 82),
(162, '2025-07-29 01:40:09.000000', NULL, 1, 'https://m.media-amazon.com/images/I/713bdJGFbjL._UF894,1000_QL80_.jpg', 83),
(163, '2025-07-29 01:40:09.000000', NULL, 2, 'https://cdn.shopify.com/s/files/1/0695/5712/5440/files/Rohto-Hada-Labo-Gokujyun-Premium-Lotion-170ml-2-2024-04-09T01_39_51.235Z.jpg?v=1746161217', 83),
(164, '2025-07-29 01:40:09.000000', NULL, 1, 'https://www.takaski.com/wp-content/uploads/2016/01/DHC-Deep-Cleansing-Oil-Small-Size-200ml.jpg', 84),
(165, '2025-07-29 01:40:09.000000', NULL, 1, 'https://kao-h.assetsadobe3.com/is/image/content/dam/sites/kao/www-kao-com/my/en/products/biore/bio_aquarich_uv_00.jpg', 85),
(166, '2025-07-29 01:40:09.000000', NULL, 2, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQB37glLXpi6nQv_DioeEQ_xKz__uzPff_EA&s', 85),
(167, '2025-07-29 01:40:09.000000', NULL, 1, 'https://edge.dis.commercecloud.salesforce.com/dw/image/v2/BKBN_PRD/on/demandware.static/-/Sites-catalog_master_sfcc_krs/default/dw94876f09/images/large/3405009973_3.jpg?sw=768&sh=768&sm=fit', 86),
(168, '2025-07-29 01:40:09.000000', NULL, 1, 'https://images-fe.ssl-images-amazon.com/images/I/510cAw1ef1L._AC_UL210_SR210,210_.jpg', 87),
(169, '2025-07-29 01:40:09.000000', NULL, 2, 'https://m.media-amazon.com/images/I/71kGjoTIfyL._UF894,1000_QL80_.jpg', 87),
(170, '2025-07-29 01:40:09.000000', NULL, 1, 'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQO0bFWFf5aEFKckEz-PFVxsbaMDerXrL8ZXQK8ZTNuhcMhrXluxIrItmjTFDtsI1u1x4VFC0vKJ3MsFHbXcj6HT0unr5rK1KkAFmWHBAqnMmazdgfVxGxm', 88),
(171, '2025-07-29 01:40:09.000000', NULL, 1, 'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcSqAtFCs7bTx0Z-OJankTc7WXCmAD1R6dzYLqrsQoSBLqlqqvUHbqZ290NZT1b8J3l7FQwW1BLqk9EZFQ2tb8Quq2Tz-TmjkaUZAi1rLnwk6XjYEVzmX_gKrTU', 89),
(172, '2025-07-29 01:40:09.000000', NULL, 2, 'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcTVLflQNiELa3Yty5XUQlwliq2qmuxHv6DzE7ourSD4S3yg8rWGU6URPDqh64Lfoak8uuK8iGMnTc2TJFRdbhliZ9Gg_mPdRsSj8TXDSzRSRenbHab1GLIPG_w', 89),
(173, '2025-07-29 01:40:09.000000', NULL, 1, 'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQgWPQlevCUbexE_ndWGeYc2lnf4dxcZrdhGmQNrv3Z3AlTldB29k832tPxPt_z2oXIrnk9QdcKGa0gH1N0-0TRZKLPWvcm-tJhkhABx5pWw_KyNz8cYRB9BA', 90),
(174, '2025-07-29 01:40:09.000000', NULL, 1, 'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcR8zLqcQTNEVWZVZQxgHcYLbIu3dviDnW9pikcszzjvvYrUHHXhKau7qDMWULUZOTbaaKSkhLjK04o8D4vASQ13LDvOH4NvGZHc1X0RzS6Hsly-_p0XHi8uMuA', 91),
(175, '2025-07-29 01:40:09.000000', NULL, 2, 'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcTRSieOEQFubKwyI3aGrAAzoXerZqoLqiEgstnUaIfRSyPdj6C5ExymAD5Sx_zjDVnfDpqNfpLMJSuAdjokXIP0ucSVh0gjGBYG4xnRwRrBnHtahCvpMP_o8Q', 91),
(176, '2025-07-29 01:48:23.000000', NULL, 1, 'https://japanesetaste.com/cdn/shop/files/Shiseido-Anessa-Perfect-UV-Sunscreen-Skincare-Milk-SPF50_-60ml--1-2024-06-14T02_08_59.526Z.webp?v=1743425185&width=600', 81),
(177, '2025-07-29 01:48:23.000000', NULL, 2, 'https://static.wixstatic.com/media/c31f29_2cbb4849035742b0aae1c393bc4bf7ba~mv2.jpg/v1/fill/w_560,h_595,al_c,q_80,usm_0.66_1.00_0.01,enc_avif,quality_auto/c31f29_2cbb4849035742b0aae1c393bc4bf7ba~mv2.jpg', 81),
(178, '2025-07-29 02:08:39.000000', NULL, 1, 'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcRx8lMbuvr0BSzGs57ZUZsxbHIFq6OfYYN4dNIbD0trj-sWECq8wO1iArlfTsm_reW2ENcE2_NxMUp-TQmYWVceP0DMc4Ad17V00GAxvXU', 92),
(179, '2025-07-29 02:08:39.000000', NULL, 2, 'https://example.com/japanese/ceramic-bowls-closeup.jpg', 92),
(180, '2025-07-29 02:08:39.000000', NULL, 3, 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQvQoQKY8h-59K3B2WEZNWtQ7Zbr2G9jZEJY5byiACVvvMmnlJdR_Z-rbAqGpgE1Y0V6XPjXY8TYMRkPd0FDGBI_zs0lB8EgH_KWYFyY-6RgiWffSVx89MpfA', 92),
(181, '2025-07-29 02:08:39.000000', NULL, 1, 'https://example.com/japanese/tatami-coasters.jpg', 93),
(182, '2025-07-29 02:08:39.000000', NULL, 2, 'https://example.com/japanese/tatami-coasters-use.jpg', 93),
(183, '2025-07-29 02:08:39.000000', NULL, 1, 'https://example.com/japanese/wagashi-box.jpg', 94),
(184, '2025-07-29 02:08:39.000000', NULL, 2, 'https://example.com/japanese/wagashi-open.jpg', 94),
(185, '2025-07-29 02:08:39.000000', NULL, 3, 'https://example.com/japanese/wagashi-detail.jpg', 94),
(186, '2025-07-29 02:08:39.000000', NULL, 1, 'https://example.com/japanese/bamboo-sushi-mat.jpg', 95),
(187, '2025-07-29 02:08:39.000000', NULL, 2, 'https://example.com/japanese/sushi-mat-rolled.jpg', 95),
(188, '2025-07-29 02:08:39.000000', NULL, 1, 'https://example.com/japanese/incense-set.jpg', 96),
(189, '2025-07-29 02:08:39.000000', NULL, 2, 'https://example.com/japanese/incense-burning.jpg', 96),
(190, '2025-07-29 02:08:39.000000', NULL, 1, 'https://example.com/japanese/daruma-doll.jpg', 97),
(191, '2025-07-29 02:08:39.000000', NULL, 2, 'https://example.com/japanese/daruma-detail.jpg', 97),
(192, '2025-07-29 02:08:39.000000', NULL, 3, 'https://example.com/japanese/daruma-size.jpg', 97),
(193, '2025-07-29 02:08:39.000000', NULL, 1, 'https://example.com/japanese/bento-box.jpg', 98),
(194, '2025-07-29 02:08:39.000000', NULL, 2, 'https://example.com/japanese/bento-box-open.jpg', 98),
(195, '2025-07-29 02:08:39.000000', NULL, 3, 'https://example.com/japanese/bento-box-compartment.jpg', 98),
(196, '2025-07-29 02:08:39.000000', NULL, 1, 'https://example.com/japanese/furoshiki-cloth.jpg', 99),
(197, '2025-07-29 02:08:39.000000', NULL, 2, 'https://example.com/japanese/furoshiki-wrapped.jpg', 99),
(198, '2025-07-29 02:08:39.000000', NULL, 3, 'https://example.com/japanese/furoshiki-pattern.jpg', 99),
(199, '2025-07-29 02:08:39.000000', NULL, 1, 'https://example.com/japanese/tea-set-complete.jpg', 100),
(200, '2025-07-29 02:08:39.000000', NULL, 2, 'https://example.com/japanese/tea-set-pieces.jpg', 100),
(201, '2025-07-29 02:08:39.000000', NULL, 3, 'https://example.com/japanese/tea-set-box.jpg', 100),
(202, '2025-07-29 02:52:26.000000', NULL, 1, 'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcTKf-EobTWtNSyrwy5Ifi5Ff6iprALbghnZh4VJjRxRTwOaP2CNCNhKmInlDZAnSLQDHcVDbkej8e19RW0UOt2p8_fviPje6AEiPb6qF4fWftiX1_S59Nrz', 101),
(203, '2025-07-29 02:52:26.000000', NULL, 2, 'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQUBXd1_2dIsdGqHuUppAmmf_iVlzjNBcDHQsLyIBprbEicZTkCjx8QET2_ilIeq4bxMM8TuZVoLH2xX0stSYZ1IK1Dc8F5Ap00NTFeG_w', 101),
(204, '2025-07-29 02:52:26.000000', NULL, 1, 'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcTadxGrfZrTcSlClRn-jBBBGBpRkv26zZ9SwqUFt4cSEkkGJlveVaMN7CPYKHFdi1ao6oS8As6woCqqx4Pwtw9jxcGTAZib', 102),
(205, '2025-07-29 02:52:26.000000', NULL, 1, 'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcS-atZ3mSauujN05r6KXlMyDonUhFArQTPotymYPIjnZW18C1uxFXoe0GQLlcDUZyORnQjqhr4NMjDBPqHGlmBcjvkJygyA5oYRspYkkk7H56Rqas-AxHBw', 103),
(206, '2025-07-29 02:52:26.000000', NULL, 2, 'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcR5K9xgyCXrBWmeevjO1OXPIGsOtvTrmEnU_eTPgNF49UgA8j--E2Ndt9TqLByi-cl4cCjjpMv_hF6_YXsrRTn9b-21yRSbEwkdQpXOveGaxgcGWN6BCstY', 103),
(207, '2025-07-29 02:52:26.000000', NULL, 1, 'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcSUGFLxrq5rxDegYGYcdl8JRasnb4DamZoPLuaOexMST8estK1F2W3opRDVZHba2Kxiar-TnE5no8Z9YYBdqyMmswEIzTygqYENOQb8BXY92hzXJhZjRtlyQA', 104),
(208, '2025-07-29 02:52:26.000000', NULL, 1, 'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcTn59lFyLPlQUmq8vm5rCDYcODFkpDx4orXifUeYQ4QkbcEYVolTv3D-9vL-8tSI7pCpIAp7l2xzXd7ajw4rXfZDlBVMFKgm7MPDFAdoxI', 105),
(209, '2025-07-29 02:52:26.000000', NULL, 1, 'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcTMj2eQZfUjqnhlLfMCyfG2M3kBvDfD_X8Y-VKWVkWEWtvHvhMdurU0pg8Z27096rHQx9F2xIZkHsTKXVg-RSXYZ-CaptL4y0DvEuY4P1g3-JiNtPyNutys', 106),
(210, '2025-07-29 02:52:26.000000', NULL, 1, 'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcTQj2MtQtWyz6nyNByBAlOo_61bwf5S0zvErVccmzcexLy0JrQjgVESa3GoL_fAfu6TR8Z21a25PjDnLZVg2DtyJbxIkLV9FctgnUVQ_76SftBTmiQbJChhXQ', 107),
(211, '2025-07-29 02:52:26.000000', NULL, 2, 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcSAR89MLFC2oUMix55XYGcnlFKoZnAJ5m-JLgyZwjv7BG-Sbg4w7DMjERsjosMsFSBZcOKAKG--j5pGDZT4XPMyRPOxz1CX5Ro7LwknzTHw9xMOr2yt9GrH1i0', 107),
(212, '2025-07-29 02:52:26.000000', NULL, 1, 'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcSp4KJn2KA173jokxCm89d0QmZqqIqMk3Bx0H5KjjCz9zsBeu1w45BHbB8K8cwqV1Hq40pKEk0fbLiw4YZGuu_E3WlUj1fSYQ', 108),
(213, '2025-07-29 02:52:26.000000', NULL, 1, 'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcTX6ntTIpZiLzRgBDZBc-O0dIoxV0ecLl571APsirv8zmwCCZkRSjYfpaFx1td_yK4Z6QTWSMMF8RXUaOIWaSaXqjH45alvZC9X3z3-FkFK8pCIq_Al_6ICEws', 109),
(214, '2025-07-29 02:52:26.000000', NULL, 1, 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQfoRsczQ93CL8gP748QAW2BP6E1q3KwPJ7ua4QaDeZbZ2yqiwHgtcqzjAW10-5HqLxMNPZJ11Vl51a7X9yrsml-6Pd3D6SNqoF598cba3aJ8NWfy0ZVKzSqz4', 110),
(215, '2025-07-29 02:52:26.000000', NULL, 1, 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcSqe6zk04L7jnoMJaEvCYrmcVrWKBpMr44mIapUeQnUXGv3SsPcZT___yvrk8Z_7dgaqEjENQXAFoqjk_Qyx1hR3_d11RdH', 111),
(216, '2025-07-29 02:52:26.000000', NULL, 1, 'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQCIWb34zP-ER1nrAuLVhmtXhVTJa5hzehyWi4ynBq9qaMFPzOL0yuZRli1WePuZHMvSCAGhsZds53tZgV8xtSNBRPj4Tbs', 112),
(217, '2025-07-29 02:52:26.000000', NULL, 1, 'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQXP7xPCgCSEQWr5HdXZuDqERIPfMU2MS66vOo3eAK_ppWKG5LfXbahbSgMTlzxAzdjme2Kv8JdxHjphcz1z55oKWKcJtmXgGDVCmhYIuXEPvpOU2QOS4dpvQ', 113),
(218, '2025-07-29 02:52:26.000000', NULL, 1, 'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQj0_a4BiVVFroNGsT2vRyQBKOYVz8bywJR0DMKCTp8m7fblprofvIuvstG5QwchmMXRz_uM_hD6ZpKNqXogN1i0RSlynbQhQ', 114),
(219, '2025-07-29 02:52:26.000000', NULL, 1, 'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcSf8QaaLyFKMGTJUSrwIDdYUlBsMCZ3OWpecBrWQHYY-LtUhZKWaTd3orQj4bvCvTYlTKFDwaCVt0sDtecFMUl7UEyUh0hAxg', 115),
(220, '2025-07-29 02:52:26.000000', NULL, 1, 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQWCkDQkCxHOyGKbSiZIE1A5fN37Cd0mu1bfrzChiSDtP0EsqYiyL_UH64Umlxi2dwXf83VTJ-8p8EvUGCMs90kg4Ms2mN838uOmBcq9fWX5NmnBiiiGMS7eIHs', 116),
(221, '2025-07-29 02:52:26.000000', NULL, 1, 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQ28eYS9nqCuFWXkCCvwdQ7hLkhb3ciwYntvU4DSJNqXnvTDNrvTTwRAuILypzGYMQUzyIXo2pb6ZffP3cPsBdbHeIGXR_ZkA', 117),
(222, '2025-07-29 02:52:26.000000', NULL, 1, 'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQE7o9TYoG9bLxBvn0sgGdfgF_8Qd7DyUK1hxjdQBwtIrO9_zxFBOBiv0UTxIYnl6wt0pbqfxSocE97NF88RtMGbhHfRhyOTEZqEQX9g4Xp', 118),
(223, '2025-07-29 02:52:26.000000', NULL, 1, 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQ7TjZsHBjIMgdCnm0XXkKt0r2q0SH97YpUanori7W--QXSXg2fli6bzVUxHx3PGZra6FeqyDWb4cJ6KhoseXtCECo_sDUQr9T2yeIVqF4VT8LvWjCattN2JQ', 119),
(224, '2025-07-29 02:52:26.000000', NULL, 1, 'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcTxzNNCl2bkhnmWz1NVRdSVMm46rbYz86HBVXwdBgMU6tALcqh-uVFR6eP9v1kANhpVsULdV7ngsVE9BuZNnlwnriPNEx2CD0-CzkDOLI69', 120),
(225, '2025-07-29 02:52:26.000000', NULL, 2, 'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcToMfpuUYEM9QyWHAV6yw8wKaUGRYgM4Mi2u8EFq-52m5SG3lF8CmdFsEDXN8KjOt91sxRJ-FXGQLMVG5jDYmjVeto0FS7Rb_RVjGMa6OJKWiuvy1LY_Zx7', 120),
(226, '2025-07-29 04:33:23.000000', NULL, 1, 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcTLtGMViwkEy0KftTJwfbgOXp_IHvRDpoYVcSMHuuEyeZZcihBsdRjy70OydT_Ue2m3IWNrntpbQeBaZiF8w51PEqmwzcOB', 121),
(227, '2025-07-29 04:33:23.000000', NULL, 2, 'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcRhCjnRTyoZrD0qbNmBdy1o9LmGITSsmELG3akCjPf3bsIzFCWZcUCGsP0_52-6jfvIeC1-ZNW25jwxi_seZ6ufHlHbSxZHpNtGgqqmkXw', 121),
(228, '2025-07-29 04:33:23.000000', NULL, 1, 'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcR1qr1EL-AwX4v5TIOl_1iIy8fgIAUcnNqIQWvkmZMnbH2dd4nHNqWVm-5QE87djdTuOmdFXWORfr2Eol8gmTfFlEZg7xQcIyLD2QJAuy2840s6CFx0SFQXLg', 122),
(229, '2025-07-29 04:33:23.000000', NULL, 1, 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcTWn3-Pff53MJKgPpWc0pdTKkAiUmdx-hqMZh13zC7UA4f3e8pTPay77pnZkYea6RmToYb1hPM1kBnjlktAEk1aMQOwQoRfeRU_KtJGG9Rx8xXUzextdZp-', 123),
(230, '2025-07-29 04:33:23.000000', NULL, 1, 'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQBT86tES1tY5-kt6HX3YqShHyXE0-hxzq3nmCLFBaf9Y8yS0eJ2JjQjiY4h2IabymFnwjzGHY9O01_ESmylm_mDs3_hm28kh-M4wVR4ZilxPOCfMb7BBScCw', 124),
(231, '2025-07-29 04:33:23.000000', NULL, 1, 'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcSRSynh4cwLL8lYw0FYpob2uSvOQBVwvIa4L7n8Kfo_Za0sp3ZUV0yAuwGA2UkdA_quhTAfemyqWpJ-mXYdCtL3NADb5g1mVPJQdBoBqLzdVEBa66RmgisH', 125),
(232, '2025-07-29 04:33:23.000000', NULL, 2, 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcRRVZEopNhCHg0yX3oo0Pt8LWVJGtKx9CV-I8W0JiupUagXlFdXfxJs0qwth0Xw1SKPea9FGn15mgAm_qCSQUCDGmbWuz9FuSZRG5Tnmgw', 125),
(233, '2025-07-29 04:33:23.000000', NULL, 1, 'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcTadZS2Kj1_0IaRPjRmwvcgxnncXwVRXTdteqp9OV5cvtNsqJOBVwNaxGQS3cwZTBU0XGa8ddExUSX6mxPj5oLY69L92KsHPM9B2yO20ErmZBvaWfIo4lGFAAQ', 126),
(234, '2025-07-29 04:33:23.000000', NULL, 1, 'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQ1g9a1UxC2_trpXfG_Pv_287S0GMa5c99YIuu5caeAq9P2DFlEelVjpMmgiqYFZ7ebE4vwyZyWdE9eWwVP5vLXixpXfJT8uJXNOw5azgUTmj5sza9EZ_O6eps', 127),
(235, '2025-07-29 04:33:23.000000', NULL, 1, 'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQsBFOtYfgde71ibvcuO9Gxap1frpu1ECG7nlook854JD2OU1YdPLzWe-Ch7u5aiaom1ZpmH7wipJC9zzR05j9LEhTXRm5xzg', 128),
(236, '2025-07-29 04:33:23.000000', NULL, 1, 'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcRGOBjC9FAkM1vwEzqrbObsmIi9RodcQO0awdtsQbK-NurUjiJsUyGT-jVEr3rJ0Os6hp8olwHPZTJ1FFRSPQK0rKuYCoByIeP24LrwHwyURmLVkTMQhNT3', 129),
(237, '2025-07-29 04:33:23.000000', NULL, 1, 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQNCD5YuWdz5JEPgZmP3jwf7v779LCcGU4JgmC_Ph3p2zXhbhLx-Q8klI9N7gM7YPT1OozaV757r07IVh5-_2UjcAoyvI5K8OSnexJXaGe_GQQ2QU4qXWYC8A', 130),
(238, '2025-07-29 04:33:23.000000', NULL, 1, 'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQFueKSWtEVjDoJrE33bzMGYhtyfTzBEYNcMjitqXTSbsRAlczp1wDYI4KxYm8kpfRg6tTadNYG3L5frApk9ZT_VSVGPkhpDKd0Ls1a32t1hpuW3MIx1Y7BNQ', 131),
(239, '2025-07-29 04:33:23.000000', NULL, 1, 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcRzWTDMlqbNu3c6ZEdLTV_C_CLMzgXq1RYH7bY__oKnFf399qTvc1mw8I7fhQW_D5F7TQoa9zZ9E4BvAe_F7DwXRoo_Hzuv3v72cMMUbglP', 132),
(240, '2025-07-29 04:33:23.000000', NULL, 1, 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcRIv-sC-7JmA1rpe6MZLAbh5h9EdK5aXwXqWYPPCK5LbL3sa6t_gThZjDwsnztQYRon2_5HPEAyfNx7_YPUdt3OiHN8LR4JlA', 133),
(241, '2025-07-29 04:33:23.000000', NULL, 1, 'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQNcPcp0-OUppp5AL_B10lTiXt4_ENLzUUZjy7GXsZiN3O0gPk0dY8SxivLPGW7Cs1O8PBFXKmJAkH8I6IibQ34m-6nBAaEQx0PS6w7dIo', 134),
(242, '2025-07-29 04:33:23.000000', NULL, 1, 'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcRmy4wgTtgou3ZmLeuzZvWqEiQO6zEt0kZLOOhxGqH_olmZI-OQD6xoO8Ou7f_g9SyV2R-2Qg7TTxR7DMjBLPThSm2Et086wucSu5-6D9R9edofpdW3WPMeLkk', 135),
(243, '2025-07-29 04:33:23.000000', NULL, 2, 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcTMXj5cdFDtf3yUVq26Xa_4ZkY308X4iUMqOkFauPIx73PAkR0rQ9DVM6-F-Y2jVkUS6fBcWv8dvHvYoLHLjTZFQ3sy_Q9XkC6nvzaEBkPH4btmL7g_N_7fHw', 135),
(244, '2025-07-29 04:33:23.000000', NULL, 1, 'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcTNDY0hWZzeBUCZ_Kxu7wLcRJKfrh0AwerqoaXOC0NB25tzJwoamcowqoEYjANdxCbZxsYeK7Lvo1APu4j4iuAfffmpKfjK', 136),
(245, '2025-07-29 04:33:23.000000', NULL, 1, 'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcRU-ud7Bnzgv84y1bX_zmjM79g3cgUXUZHVWoltaoPtrXQcfQzIhHyJJIvw2fhPgMN4Sdzsj7rxvaFvsZ1Ozqd5UwzuEVp8tR9vsxSwfz0Pz9T7IJxXob8Gw30', 137),
(246, '2025-07-29 04:33:23.000000', NULL, 1, 'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcS8ybJGbeFgO2n-4OzSL1rYsEbOBJwWxkPcC1W2keKd-bmy-RNZFu9QFwkJS4ANs4mzAELzfZWNAQ81s7gW2UZtFGYR6XrXlL-J9ZMp3aNpyoBhzAQ8CeATVeg', 138),
(247, '2025-07-29 04:33:23.000000', NULL, 1, 'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcS9ysMo3RXO3jW6w2kKuDjyReVrO_WB6AqzPCDYtfupJw0H-4LwGKf1ZOgZzGh-oIzAn-b7rYmvuIfIzAF6F9vH3UfPJPYr7w-0g_1lWduBgnntdfyChLWx2Nw', 139),
(248, '2025-07-29 04:33:23.000000', NULL, 1, 'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcS_oeQ8VlXwD9GtCk5Vv9-UymtIX5BXK2mk6ZCbrYTa7U3715Rwxl6Jl8oXKAs8_-THL_d6xLevPtebzyC3UIzc27UFMrec3I91gbtcsI47VaCjoK9TsZjU', 140),
(249, '2025-07-29 07:07:50.000000', NULL, 1, 'https://mikihouse-usa.com/cdn/shop/files/44-1040-683-15.jpg?v=1730864251', 141),
(250, '2025-07-29 07:07:50.000000', NULL, 2, 'https://mikihouse-usa.com/cdn/shop/files/44-1039-682-15.jpg?v=1730864136', 141),
(251, '2025-07-29 07:07:50.000000', NULL, 1, 'https://nautinati.com/cdn/shop/files/NNIGCS010013_2.jpg?v=1751870001', 142),
(252, '2025-07-29 07:07:50.000000', NULL, 1, 'https://d2ncjxd2rk2vpl.cloudfront.net/histravelmalaysia/product/6476a682ee63940007f15b90/300x300/85/outside/7a5bf134-536c-42c3-de12-c2414500b60b', 143),
(253, '2025-07-29 07:07:50.000000', NULL, 1, 'https://smilebaby.info/cdn/shop/products/f56190-kk.jpg?v=1668041431', 144),
(254, '2025-07-29 07:07:50.000000', NULL, 1, 'https://shop.akachan.jp/img/goods/D1/240575501_7242b75737414f448d051247e9e892e9.jpg', 145),
(255, '2025-07-29 07:07:50.000000', NULL, 1, 'https://xcdn.next.co.uk/common/items/default/default/itemimages/3_4Ratio/product/lge/F14583s.jpg?im=Resize,width=750', 146),
(256, '2025-07-29 07:07:50.000000', NULL, 1, 'https://cdn11.bigcommerce.com/s-4b0oh2xvlj/images/stencil/1280x1280/products/4318/1050826/4550182762839_01_1260__35794.1730286247.jpg?c=1', 147),
(257, '2025-07-29 07:07:50.000000', NULL, 1, 'https://akemibaby.co/cdn/shop/files/classicakatsukizippy01.jpg?v=1715263868', 148),
(258, '2025-07-29 07:07:50.000000', NULL, 1, 'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQZxWk4Hh0kMPbk54cfzNXN1mkKnPxP3Zwe7IjcDlWDq2UxwjSFgzAnsZ2J_uKIm-WRX-nXsB1CLJ9zb2YBKlT1NCAilo1RBzXvdk0AP2gwQ_CSQjiWpojC', 149),
(259, '2025-07-29 07:07:50.000000', NULL, 1, 'https://www.naturalbabyshower.co.uk/cdn/shop/files/pigeon-organics-jumpsuit-muslin-turquoise-2021-lifestyle_8e28c44c-2eb2-4cf7-b175-e44b5536ac9c.jpg?v=1699438340&width=1080', 150),
(260, '2025-07-29 07:07:50.000000', NULL, 1, 'https://10mois.com/cdn/shop/files/2_3785dbd4-dca0-41f5-a5b1-c5d3c026bd4c.jpg?v=1737712910', 151),
(261, '2025-07-29 07:07:50.000000', NULL, 2, 'https://10mois.com/cdn/shop/files/DSC02549_533x.jpg?v=1738220905', 151),
(262, '2025-07-29 07:07:50.000000', NULL, 1, 'https://www.tartine-et-chocolat.com/cdn/shop/files/CB37011_55_1_packshot_67cd669a-1cde-4ce8-9ec3-f55b31b690fc.jpg?v=1749743754&width=480', 152),
(263, '2025-07-29 07:07:50.000000', NULL, 1, 'https://familiar.co.jp/cdn/shop/products/150809_01.jpg?v=1667021865', 153),
(264, '2025-07-29 07:07:50.000000', NULL, 1, 'https://m.media-amazon.com/images/I/61er7IwTF9L.jpg', 154),
(265, '2025-07-29 07:07:50.000000', NULL, 1, 'https://thumbnail.image.rakuten.co.jp/@0_mall/stylife/cabinet/item/153/mn2153-01_1.jpg', 155),
(266, '2025-07-29 07:07:50.000000', NULL, 1, 'https://cdn-thumbnail.mamilove.com.tw/MygfiHdekCaT2dRkfx3_p0hSVuo=/0x0/https://cdn-images.mamilove.com.tw/origin/itemIntro/479622/479622-9848730750-1648605694.png', 156),
(267, '2025-07-29 07:07:50.000000', NULL, 1, 'https://assets.ajio.com/medias/sys_master/root/20240926/vNyb/66f5900a260f9c41e82e8ba2/-473Wx593H-700483674-multi-MODEL.jpg', 157),
(268, '2025-07-29 07:07:50.000000', NULL, 1, 'https://konssy.com/cdn/shop/files/1060d552994f682feeeedb0118e5f06f_71v1eqf4PcL._SL1500_5e7c0413-88ba-4ac9-878a-7d71b92903c5.jpg?v=1723706026&width=1080', 158),
(269, '2025-07-29 07:07:50.000000', NULL, 1, 'https://m.media-amazon.com/images/I/81Bkp1uQaHL._UY1000_.jpg', 159),
(270, '2025-07-29 07:07:50.000000', NULL, 1, 'https://www.yobabyshop.com/cdn/shop/products/YoBabyShop-Hoppetta-Vest.jpg?v=1731534684&width=1080', 160),
(271, '2025-07-29 07:07:50.000000', NULL, 2, 'https://cuddlebabyhk.com/cdn/shop/products/ka-50969_4.jpg?v=1654912392&width=1445', 160),
(272, '2025-07-30 04:39:29.000000', NULL, 1, 'https://dakar.express/wp-content/uploads/2025/03/samsung-galaxy-s23-prix-et-fiche-technique_dakar_senegal.jpg', 161),
(273, '2025-07-30 04:39:29.000000', NULL, 2, 'https://media.wired.com/photos/63ee8e4fcde6e0e4f71293ef/master/pass/Samsung-Galaxy-S23-SOURCE-Samsung.jpg', 161),
(274, '2025-07-30 04:39:29.000000', NULL, 3, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSve9Wo4riHpw5TPyZT6Jky-SetskKf9CNehB5SKrKiv23myqHnaHdGocO3BkPWLdY3xLQ&usqp=CAU', 161),
(275, '2025-07-30 06:58:10.000000', NULL, 1, 'https://m.media-amazon.com/images/I/61Bv7L7GkmL._AC_SX395_.jpg', 162),
(276, '2025-07-30 06:58:10.000000', NULL, 2, 'https://m.media-amazon.com/images/I/613FG021XhL._AC_SY395_.jpg', 162),
(277, '2025-07-30 06:58:10.000000', NULL, 3, 'https://m.media-amazon.com/images/I/61BSwyub7vL._AC_SY395_.jpg', 162),
(278, '2025-07-30 06:58:10.000000', NULL, 4, 'https://m.media-amazon.com/images/I/31elklyv9UL._AC_SY395_.jpg', 162),
(279, '2025-07-30 06:58:10.000000', NULL, 5, 'https://m.media-amazon.com/images/I/61vP3vr6MfL._AC_SY395_.jpg', 162),
(280, '2025-07-30 06:58:10.000000', NULL, 6, 'https://m.media-amazon.com/images/I/61GGB4Ac3RL._AC_SY395_.jpg', 162),
(281, '2025-07-30 06:58:10.000000', NULL, 7, 'https://m.media-amazon.com/images/I/71Z6WMPPguL._AC_SY395_.jpg', 162),
(282, '2025-07-30 06:58:10.000000', NULL, 8, 'https://example.jp/images/running_shoes_8.jpg', 162),
(283, '2025-07-30 06:58:10.000000', NULL, 9, 'https://example.jp/images/running_shoes_9.jpg', 162),
(284, '2025-07-30 06:58:10.000000', NULL, 10, 'https://example.jp/images/running_shoes_10.jpg', 162),
(285, '2025-07-30 06:58:10.000000', NULL, 1, 'https://m.media-amazon.com/images/I/51P0uB1z6rL._AC_SX425_.jpg', 163),
(286, '2025-07-30 06:58:10.000000', NULL, 2, 'https://m.media-amazon.com/images/I/61ju20xpARL._AC_SY606_.jpg', 163),
(287, '2025-07-30 06:58:10.000000', NULL, 3, 'https://m.media-amazon.com/images/I/61HEQGsmeUL._AC_SY606_.jpg', 163),
(288, '2025-07-30 06:58:10.000000', NULL, 4, 'https://m.media-amazon.com/images/I/61UUSUHiRIL._AC_SY606_.jpg', 163),
(289, '2025-07-30 06:58:10.000000', NULL, 5, 'https://m.media-amazon.com/images/I/61D4K-1vqtL._AC_SY606_.jpg', 163),
(290, '2025-07-30 06:58:10.000000', NULL, 6, 'https://m.media-amazon.com/images/I/614mQ5gvnmL._AC_SY606_.jpg', 163),
(291, '2025-07-30 06:58:10.000000', NULL, 7, 'https://m.media-amazon.com/images/I/61UfKZBhEFL._AC_SY606_.jpg', 163),
(292, '2025-07-30 06:58:10.000000', NULL, 8, 'https://example.jp/images/headphones_8.jpg', 163),
(293, '2025-07-30 06:58:10.000000', NULL, 9, 'https://example.jp/images/headphones_9.jpg', 163),
(294, '2025-07-30 06:58:10.000000', NULL, 10, 'https://example.jp/images/headphones_10.jpg', 163),
(295, '2025-07-30 06:58:10.000000', NULL, 1, 'https://m.media-amazon.com/images/I/51dqkF5-uZL._AC_SX679_.jpg', 164),
(296, '2025-07-30 06:58:10.000000', NULL, 2, 'https://m.media-amazon.com/images/I/515kiF6t3UL._AC_SX679_.jpg', 164),
(297, '2025-07-30 06:58:10.000000', NULL, 3, 'https://m.media-amazon.com/images/I/81Z0qBItvyL._AC_SX679_.jpg', 164),
(298, '2025-07-30 06:58:10.000000', NULL, 4, 'https://m.media-amazon.com/images/I/712VoP9Vh6L._AC_SX679_.jpg', 164),
(299, '2025-07-30 06:58:10.000000', NULL, 5, 'https://m.media-amazon.com/images/I/81r6jTjJEBL._AC_SX679_.jpg', 164),
(300, '2025-07-30 06:58:10.000000', NULL, 6, 'https://m.media-amazon.com/images/I/51JePtn0ftL._AC_SX679_.jpg', 164),
(301, '2025-07-30 06:58:10.000000', NULL, 7, 'https://example.jp/images/tshirt_7.jpg', 164),
(302, '2025-07-30 06:58:10.000000', NULL, 8, 'https://example.jp/images/tshirt_8.jpg', 164);
INSERT INTO `product_images` (`id`, `created_at`, `deleted_at`, `display_order`, `image_url`, `product_id`) VALUES
(303, '2025-07-30 06:58:10.000000', NULL, 9, 'https://example.jp/images/tshirt_9.jpg', 164),
(304, '2025-07-30 06:58:10.000000', NULL, 10, 'https://example.jp/images/tshirt_10.jpg', 164),
(305, '2025-07-30 06:58:10.000000', NULL, 1, 'https://m.media-amazon.com/images/I/61aH5SWMwIL._AC_SX425_.jpg', 165),
(306, '2025-07-30 06:58:10.000000', NULL, 2, 'https://m.media-amazon.com/images/I/71AtdGoB3kL._AC_SX425_.jpg', 165),
(307, '2025-07-30 06:58:10.000000', NULL, 3, 'https://m.media-amazon.com/images/I/61xZ2bCZoOL._AC_SX425_.jpg', 165),
(308, '2025-07-30 06:58:10.000000', NULL, 4, 'https://m.media-amazon.com/images/I/61bXL9FkzkL._AC_SX425_.jpg', 165),
(309, '2025-07-30 06:58:10.000000', NULL, 5, 'https://m.media-amazon.com/images/I/61y9kzzv1QL._AC_SX425_.jpg', 165),
(310, '2025-07-30 06:58:10.000000', NULL, 6, 'https://m.media-amazon.com/images/I/71Vo9wvGhvL._AC_SX425_.jpg', 165),
(311, '2025-07-30 06:58:10.000000', NULL, 7, 'https://m.media-amazon.com/images/I/61-hLFRPMUL._AC_SL1500_.jpg', 165),
(312, '2025-07-30 06:58:10.000000', NULL, 8, 'https://m.media-amazon.com/images/I/71Vo9wvGhvL._AC_SL1500_.jpg', 165),
(313, '2025-07-30 06:58:10.000000', NULL, 9, 'https://m.media-amazon.com/images/I/61aEwHB-DyL._AC_SL1500_.jpg', 165),
(314, '2025-07-30 06:58:10.000000', NULL, 10, 'https://m.media-amazon.com/images/I/61RH+Hfe1cL._AC_SL1500_.jpg', 165),
(315, '2025-07-30 06:58:10.000000', NULL, 1, 'https://m.media-amazon.com/images/I/71FqfxM3BeL._AC_SX425_.jpg', 166),
(316, '2025-07-30 06:58:10.000000', NULL, 2, 'https://m.media-amazon.com/images/I/61bRTvzX9ML._AC_SX425_.jpg', 166),
(317, '2025-07-30 06:58:10.000000', NULL, 3, 'https://m.media-amazon.com/images/I/71BML1NVMWL._AC_SX425_.jpg', 166),
(318, '2025-07-30 06:58:10.000000', NULL, 4, 'https://m.media-amazon.com/images/I/719Z3cwmMXL._AC_SX425_.jpg', 166),
(319, '2025-07-30 06:58:10.000000', NULL, 5, 'https://m.media-amazon.com/images/I/61dd8IaqG9L._AC_SX425_.jpg', 166),
(320, '2025-07-30 06:58:10.000000', NULL, 6, 'https://m.media-amazon.com/images/I/61RVsiFt1pL._AC_SX425_.jpg', 166),
(321, '2025-07-30 06:58:10.000000', NULL, 7, 'https://m.media-amazon.com/images/I/71tHm8yT1FL._AC_SL1500_.jpg', 166),
(322, '2025-07-30 06:58:10.000000', NULL, 8, 'https://m.media-amazon.com/images/I/71DVdAl9W5L._AC_SL1500_.jpg', 166),
(323, '2025-07-30 06:58:10.000000', NULL, 9, 'https://m.media-amazon.com/images/I/51iRy5i3p3L._AC_SL1500_.jpg', 166),
(324, '2025-07-30 06:58:10.000000', NULL, 10, 'https://m.media-amazon.com/images/I/71339XHbgvL._AC_SL1500_.jpg', 166),
(325, '2025-07-30 06:58:10.000000', NULL, 1, 'https://m.media-amazon.com/images/I/81vsF359xzL._AC_SY355_.jpg', 167),
(326, '2025-07-30 06:58:10.000000', NULL, 2, 'https://m.media-amazon.com/images/I/91UrLHVnCUL._AC_SY355_.jpg', 167),
(327, '2025-07-30 06:58:10.000000', NULL, 3, 'https://m.media-amazon.com/images/I/81SB3R5gijL._AC_SY355_.jpg', 167),
(328, '2025-07-30 06:58:10.000000', NULL, 4, 'https://m.media-amazon.com/images/I/51l1SlqeT-L._AC_US40_.jpg', 167),
(329, '2025-07-30 06:58:10.000000', NULL, 5, 'https://m.media-amazon.com/images/I/41QQHPFuPEL._AC_US40_.jpg', 167),
(330, '2025-07-30 06:58:10.000000', NULL, 6, 'https://m.media-amazon.com/images/I/51cN7OR9RPL._AC_US40_.jpg', 167),
(331, '2025-07-30 06:58:10.000000', NULL, 7, 'https://m.media-amazon.com/images/I/81c85vjzJcL._AC_SL1500_.jpg', 167),
(332, '2025-07-30 06:58:10.000000', NULL, 8, 'https://m.media-amazon.com/images/I/7154H8QibwL._AC_SL1500_.jpg', 167),
(333, '2025-07-30 06:58:10.000000', NULL, 9, 'https://example.jp/images/wallet_9.jpg', 167),
(334, '2025-07-30 06:58:10.000000', NULL, 10, 'https://example.jp/images/wallet_10.jpg', 167),
(335, '2025-07-30 06:58:10.000000', NULL, 1, 'https://m.media-amazon.com/images/I/61kucl749HL._AC_SY450_.jpg', 168),
(336, '2025-07-30 06:58:10.000000', NULL, 2, 'https://m.media-amazon.com/images/I/71f-QxOx2nL._AC_SY450_.jpg', 168),
(337, '2025-07-30 06:58:10.000000', NULL, 3, 'https://m.media-amazon.com/images/I/211IO+7jsnL._AC_.jpg', 168),
(338, '2025-07-30 06:58:10.000000', NULL, 4, 'https://m.media-amazon.com/images/I/71Eo44p2kzL._AC_SY450_.jpg', 168),
(339, '2025-07-30 06:58:10.000000', NULL, 5, 'https://m.media-amazon.com/images/I/61D1il3Ii3L._AC_SY450_.jpg', 168),
(340, '2025-07-30 06:58:10.000000', NULL, 6, 'https://m.media-amazon.com/images/I/61JeQm52epL._AC_SY450_.jpg', 168),
(341, '2025-07-30 06:58:10.000000', NULL, 7, 'https://m.media-amazon.com/images/I/61KiNdLKhIL._AC_SY450_.jpg', 168),
(342, '2025-07-30 06:58:10.000000', NULL, 8, 'https://example.jp/images/mug_8.jpg', 168),
(343, '2025-07-30 06:58:10.000000', NULL, 9, 'https://example.jp/images/mug_9.jpg', 168),
(344, '2025-07-30 06:58:10.000000', NULL, 10, 'https://example.jp/images/mug_10.jpg', 168),
(345, '2025-07-30 06:58:10.000000', NULL, 1, 'https://m.media-amazon.com/images/I/71rFR0pztRL.__AC_SX300_SY300_QL70_ML2_.jpg', 169),
(346, '2025-07-30 06:58:10.000000', NULL, 2, 'https://m.media-amazon.com/images/I/71fFxVktaOL._AC_SX425_.jpg', 169),
(347, '2025-07-30 06:58:10.000000', NULL, 3, 'https://m.media-amazon.com/images/I/71tIO4bObOL._AC_SX425_.jpg', 169),
(348, '2025-07-30 06:58:10.000000', NULL, 4, 'https://m.media-amazon.com/images/I/71rEyYn5DZL._AC_SX425_.jpg', 169),
(349, '2025-07-30 06:58:10.000000', NULL, 5, 'https://m.media-amazon.com/images/I/71G1SEnKhvL._AC_SX425_.jpg', 169),
(350, '2025-07-30 06:58:10.000000', NULL, 6, 'https://m.media-amazon.com/images/I/711Pumw3SqL._AC_SL1500_.jpg', 169),
(351, '2025-07-30 06:58:10.000000', NULL, 7, 'https://m.media-amazon.com/images/I/71iYhNp8o3L._AC_SL1500_.jpg', 169),
(352, '2025-07-30 06:58:10.000000', NULL, 8, 'https://m.media-amazon.com/images/I/71gccEpj83L._AC_SL1500_.jpg', 169),
(353, '2025-07-30 06:58:10.000000', NULL, 9, 'https://m.media-amazon.com/images/I/81mdRSg5kAL._AC_SL1500_.jpg', 169),
(354, '2025-07-30 06:58:10.000000', NULL, 10, 'https://example.jp/images/yogamat_10.jpg', 169),
(355, '2025-07-30 06:58:10.000000', NULL, 1, 'https://m.media-amazon.com/images/I/61N2ouVtLgL._AC_SX425_.jpg', 170),
(356, '2025-07-30 06:58:10.000000', NULL, 2, 'https://m.media-amazon.com/images/I/712ZX0Tkb3L._AC_SX425_.jpg', 170),
(357, '2025-07-30 06:58:10.000000', NULL, 3, 'https://m.media-amazon.com/images/I/71fDvblFRDL._AC_SX425_.jpg', 170),
(358, '2025-07-30 06:58:10.000000', NULL, 4, 'https://m.media-amazon.com/images/I/71W2V7NyCZL._AC_SX425_.jpg', 170),
(359, '2025-07-30 06:58:10.000000', NULL, 5, 'https://m.media-amazon.com/images/I/61MECdm1b7L._AC_SX425_.jpg', 170),
(360, '2025-07-30 06:58:10.000000', NULL, 6, 'https://m.media-amazon.com/images/I/71gtlVH-y5L._AC_SX425_.jpg', 170),
(361, '2025-07-30 06:58:10.000000', NULL, 7, 'https://m.media-amazon.com/images/I/517ZxhGyzyL._AC_SX425_.jpg', 170),
(362, '2025-07-30 06:58:10.000000', NULL, 8, 'https://example.jp/images/charger_8.jpg', 170),
(363, '2025-07-30 06:58:10.000000', NULL, 9, 'https://example.jp/images/charger_9.jpg', 170),
(364, '2025-07-30 06:58:10.000000', NULL, 10, 'https://example.jp/images/charger_10.jpg', 170),
(365, '2025-07-30 06:58:10.000000', NULL, 1, 'https://m.media-amazon.com/images/I/61bcXjAV9RL._AC_SY500_.jpg', 171),
(366, '2025-07-30 06:58:10.000000', NULL, 2, 'https://m.media-amazon.com/images/I/61hhB5aP5PL._AC_SY500_.jpg', 171),
(367, '2025-07-30 06:58:10.000000', NULL, 3, 'https://m.media-amazon.com/images/I/61y3AT00HkL._AC_SY500_.jpg', 171),
(368, '2025-07-30 06:58:10.000000', NULL, 4, 'https://m.media-amazon.com/images/I/61XF9F55BIL._AC_SY500_.jpg', 171),
(369, '2025-07-30 06:58:10.000000', NULL, 5, 'https://m.media-amazon.com/images/I/61UwbY+cYgL._AC_SY500_.jpg', 171),
(370, '2025-07-30 06:58:10.000000', NULL, 6, 'https://m.media-amazon.com/images/I/61Olh2drqlL._AC_SY500_.jpg', 171),
(371, '2025-07-30 06:58:10.000000', NULL, 7, 'https://m.media-amazon.com/images/I/61kNKjIG0WL._AC_SY500_.jpg', 171),
(372, '2025-07-30 06:58:10.000000', NULL, 8, 'https://example.jp/images/backpack_8.jpg', 171),
(373, '2025-07-30 06:58:10.000000', NULL, 9, 'https://example.jp/images/backpack_9.jpg', 171),
(374, '2025-07-30 06:58:10.000000', NULL, 10, 'https://example.jp/images/backpack_10.jpg', 171);

-- --------------------------------------------------------

--
-- Table structure for table `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `is_approved` bit(1) DEFAULT NULL,
  `rating` tinyint(4) DEFAULT NULL,
  `review_text` text DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` bigint(20) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `gender` enum('FEMALE','MALE','OTHER') DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `password_hash` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `user_type` enum('ADMIN','USER') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `created_at`, `deleted_at`, `email`, `first_name`, `gender`, `last_name`, `password_hash`, `phone`, `updated_at`, `user_type`) VALUES
(1, '2025-07-31 11:35:02.000000', NULL, 'abc@mail.com', 'DEVENDRA', NULL, 'GURUNG', '$2a$10$iduvvIgwCatCl2f07vUFHOfWV8qYl4O3c4iv9zVyCycvEwtfCksDy', '44455833121', '2025-07-31 11:35:02.000000', 'USER');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_id` (`user_id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_session_id` (`session_id`),
  ADD KEY `FKb5o626f86h46m4s7ms6ginnop` (`user_id`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKpcttvuq4mxppo8sxggjtn5i2c` (`cart_id`),
  ADD KEY `FK1re40cjegsfvw58xrkdp6bac6` (`product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_category_slug` (`slug`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_order_order_number` (`order_number`),
  ADD KEY `FK66jolu65brloux12yi37qy3ky` (`billing_address_id`),
  ADD KEY `FKmk6q95x8ffidq82wlqjaq7sqc` (`shipping_address_id`),
  ADD KEY `FK32ql8ubntj5uh44ph9659tiih` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKbioxgbv59vetrxe0ejfubep1w` (`order_id`),
  ADD KEY `FKocimc7dtr037rh4ls4l95nlfi` (`product_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_payment_transaction_id` (`transaction_id`),
  ADD KEY `FK81gagumt0r8y3rmudcgpbk42l` (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKog2rp4qthbtt2lfyhfo32lsw9` (`category_id`);

--
-- Indexes for table `product_characteristics`
--
ALTER TABLE `product_characteristics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKlwuvy71q239qxmgor4u6ni4ej` (`product_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKqnq71xsohugpqwf3c9gxmsuy` (`product_id`);

--
-- Indexes for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK35kxxqe2g9r4mww80w9e3tnw9` (`product_id`),
  ADD KEY `FK58i39bhws2hss3tbcvdmrm60f` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `UK6dotkott2kjsp8vw4d0m25fb7` (`email`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKl7ao98u2bm8nijc1rv4jobcrx` (`product_id`),
  ADD KEY `FK330pyw2el06fn5g28ypyljt16` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=172;

--
-- AUTO_INCREMENT for table `product_characteristics`
--
ALTER TABLE `product_characteristics`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=375;

--
-- AUTO_INCREMENT for table `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `FK1fa36y2oqhao3wgg2rw1pi459` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `FKb5o626f86h46m4s7ms6ginnop` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `FK1re40cjegsfvw58xrkdp6bac6` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `FKpcttvuq4mxppo8sxggjtn5i2c` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `FK32ql8ubntj5uh44ph9659tiih` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `FK66jolu65brloux12yi37qy3ky` FOREIGN KEY (`billing_address_id`) REFERENCES `addresses` (`id`),
  ADD CONSTRAINT `FKmk6q95x8ffidq82wlqjaq7sqc` FOREIGN KEY (`shipping_address_id`) REFERENCES `addresses` (`id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `FKbioxgbv59vetrxe0ejfubep1w` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `FKocimc7dtr037rh4ls4l95nlfi` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `FK81gagumt0r8y3rmudcgpbk42l` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `FKog2rp4qthbtt2lfyhfo32lsw9` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `product_characteristics`
--
ALTER TABLE `product_characteristics`
  ADD CONSTRAINT `FKlwuvy71q239qxmgor4u6ni4ej` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `FKqnq71xsohugpqwf3c9gxmsuy` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD CONSTRAINT `FK35kxxqe2g9r4mww80w9e3tnw9` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `FK58i39bhws2hss3tbcvdmrm60f` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `FK330pyw2el06fn5g28ypyljt16` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `FKl7ao98u2bm8nijc1rv4jobcrx` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
