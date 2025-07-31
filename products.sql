-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 31, 2025 at 04:23 AM
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
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `price` decimal(38,2) DEFAULT NULL,
  `discount_price` decimal(38,2) DEFAULT NULL,
  `stock_quantity` int(11) NOT NULL,
  `category_id` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `discount_price`, `stock_quantity`, `category_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '抹茶クッキー', '京都産の抹茶を使用したクッキー', 540.00, 480.00, 100, 1, '2025-07-24 07:09:29', '2025-07-24 07:09:29', NULL),
(2, 'じゃかりご', 'カルビー じゃがりこサラダ 57g×12個', 2096.00, 1899.00, 200, 1, '2025-07-24 07:09:29', '2025-07-28 00:47:00', NULL),
(3, '日本刀レプリカ', '観賞用の模造刀', 12000.00, 9800.00, 10, 5, '2025-07-24 07:09:29', '2025-07-28 04:58:14', NULL),
(4, '桜柄の浴衣', '女性用の可愛いデザイン', 3980.00, 3500.00, 50, 3, '2025-07-24 07:09:29', '2025-07-28 04:58:32', NULL),
(5, '和風ノート', '和紙を使ったノート', 680.00, NULL, 80, 5, '2025-07-24 07:09:29', '2025-07-24 07:09:29', NULL),
(6, 'カップヌードル', '独特のつるみのある麺に、おなじみのオリジナルスープ。具材は謎肉 (味付豚ミンチ)、ミンチポーク (味付豚肉)、エビ、スクランブルエッグ、ネギ。', 250.00, 198.00, 300, 2, '2025-07-24 07:09:29', '2025-07-25 08:50:55', NULL),
(7, 'USB加湿器', 'デスク用の小型加湿器', 1980.00, 1750.00, 40, 4, '2025-07-24 07:09:29', '2025-07-28 04:59:02', NULL),
(8, '風鈴', 'ガラス製の風鈴', 1280.00, 1100.00, 30, 5, '2025-07-24 07:09:29', '2025-07-28 08:40:37', NULL),
(9, '味噌汁パック', 'インスタント味噌汁10食分', 500.00, 450.00, 120, 6, '2025-07-24 07:09:29', '2025-07-28 05:02:35', NULL),
(10, '将棋セット', '木製将棋盤と駒', 2980.00, NULL, 25, 5, '2025-07-24 07:09:29', '2025-07-28 05:04:27', NULL),
(11, '陶器の湯のみ', '手作りの和風湯のみ', 950.00, NULL, 70, 5, '2025-07-24 07:09:29', '2025-07-28 05:04:46', NULL),
(12, '折り紙セット', '100枚入りのカラフルな折り紙', 300.00, 250.00, 150, 5, '2025-07-24 07:09:29', '2025-07-24 07:09:29', NULL),
(13, '日本茶ティーバッグ', '煎茶20パック', 620.00, 550.00, 90, 7, '2025-07-24 07:09:29', '2025-07-28 05:05:02', NULL),
(14, 'ふりかけ詰め合わせ', '5種類のふりかけセット', 430.00, NULL, 130, 6, '2025-07-24 07:09:29', '2025-07-28 05:05:23', NULL),
(15, 'アニメフィギュア', '人気キャラの限定モデル', 4200.00, 3800.00, 20, 5, '2025-07-24 07:09:29', '2025-07-28 05:05:39', NULL),
(16, '和風扇子', '竹製の装飾扇子', 880.00, NULL, 60, 5, '2025-07-24 07:09:29', '2025-07-24 07:09:29', NULL),
(17, 'ゆず風呂入浴剤', 'ゆずの香りのバスソルト', 560.00, 500.00, 75, 7, '2025-07-24 07:09:29', '2025-07-28 05:05:57', NULL),
(18, 'Itoen Oi Ocha', 'Instant Japanese Green Tea with Matcha Powder 80g by Japanese Taste', 980.00, NULL, 35, 7, '2025-07-24 07:09:29', '2025-07-28 05:06:06', NULL),
(19, '伝統柄ハンカチ', '日本の伝統模様が入った布', 400.00, 350.00, 100, 5, '2025-07-24 07:09:29', '2025-07-28 05:06:13', NULL),
(20, '招き猫', '金運を招く置物', 1500.00, 1200.00, 45, 5, '2025-07-24 07:09:29', '2025-07-28 05:06:21', NULL),
(21, 'Kit Kat Matcha Green Tea', 'Matcha green tea flavored Kit Kat', 350.00, NULL, 100, 1, '2025-07-28 06:51:17', '2025-07-28 06:51:17', NULL),
(22, 'Pocky Chocolate', 'Classic chocolate coated biscuit sticks', 200.00, 180.00, 150, 1, '2025-07-28 06:51:17', '2025-07-28 06:51:17', NULL),
(23, 'Tokyo Banana', 'Soft banana-shaped cakes with custard cream', 1200.00, 1100.00, 50, 1, '2025-07-28 06:51:17', '2025-07-28 06:51:17', NULL),
(24, 'Meltykiss Chocolate', 'Premium melt-in-your-mouth chocolate cubes', 450.00, NULL, 80, 1, '2025-07-28 06:51:17', '2025-07-28 06:51:17', NULL),
(25, 'Jagariko Potato Snacks', 'Crunchy potato sticks with original flavor', 150.00, NULL, 200, 1, '2025-07-28 06:51:17', '2025-07-28 06:51:17', NULL),
(26, 'Hi-Chew Assorted', 'Chewy fruit candies in assorted flavors', 300.00, 250.00, 120, 1, '2025-07-28 06:51:17', '2025-07-28 06:51:17', NULL),
(27, 'Umaibo Corn Puff', 'Popular cylindrical corn puff snack', 20.00, NULL, 500, 1, '2025-07-28 06:51:17', '2025-07-28 06:51:17', NULL),
(28, 'Black Thunder Chocolate', 'Crunchy chocolate cookie bar', 100.00, NULL, 300, 1, '2025-07-28 06:51:17', '2025-07-28 06:51:17', NULL),
(29, 'Yoku Moku Cigarette Cookies', 'Butter cookies in cigarette shapes', 800.00, 750.00, 60, 1, '2025-07-28 06:51:17', '2025-07-28 06:51:17', NULL),
(30, 'Calbee Jagariko Salad', 'Potato sticks with salad flavor', 150.00, NULL, 180, 1, '2025-07-28 06:51:17', '2025-07-28 06:51:17', NULL),
(31, 'Nissin Raoh Soy Sauce Ramen', 'Premium instant ramen with rich soy sauce broth', 450.00, NULL, 80, 2, '2025-07-28 07:30:44', '2025-07-28 07:30:44', NULL),
(32, 'Sapporo Ichiban Original', 'Classic Japanese-style instant noodles', 250.00, 200.00, 120, 2, '2025-07-28 07:30:44', '2025-07-28 07:30:44', NULL),
(33, 'Maruchan Seimen Tonkotsu', 'Authentic tonkotsu (pork bone) flavored ramen', 380.00, NULL, 90, 2, '2025-07-28 07:30:44', '2025-07-28 07:30:44', NULL),
(34, 'Acecook Miso Ramen', 'Hokkaido-style miso flavored instant ramen', 320.00, NULL, 70, 2, '2025-07-28 07:30:44', '2025-07-28 07:30:44', NULL),
(35, 'Nissin Cup Noodle Original', 'The original cup ramen with assorted toppings', 180.00, NULL, 200, 2, '2025-07-28 07:30:44', '2025-07-28 07:30:44', NULL),
(36, 'Nissin UFO Yakisoba', 'Popular stir-fried style cup noodles', 220.00, NULL, 150, 2, '2025-07-28 07:30:44', '2025-07-28 07:30:44', NULL),
(37, 'Ippudo Akamaru Instant Ramen', 'Restaurant-quality instant ramen from famous chain', 680.00, 600.00, 40, 2, '2025-07-28 07:30:44', '2025-07-28 07:30:44', NULL),
(38, 'Tsuta Ajitama Instant Ramen', 'Michelin-starred ramen in instant form', 980.00, NULL, 30, 2, '2025-07-28 07:30:44', '2025-07-28 07:30:44', NULL),
(39, 'Hakata Ikkousha Tonkotsu', 'Famous Hakata-style tonkotsu ramen', 580.00, NULL, 50, 2, '2025-07-28 07:30:44', '2025-07-28 07:30:44', NULL),
(40, 'Sanyo Tokyo Shoyu Ramen', 'Tokyo-style soy sauce flavored ramen', 420.00, NULL, 60, 2, '2025-07-28 07:30:44', '2025-07-28 07:30:44', NULL),
(41, 'Traditional Cotton Yukata (Blue)', 'Summer cotton yukata with obi belt included', 8900.00, 8500.00, 25, 3, '2025-07-28 07:51:18', '2025-07-28 07:51:18', NULL),
(42, 'Floral Pattern Yukata (Pink)', 'Elegant pink yukata with flower designs', 9500.00, NULL, 20, 3, '2025-07-28 07:51:18', '2025-07-28 07:51:18', NULL),
(43, 'Men\'s Striped Yukata (Navy)', 'Classic navy blue striped yukata for men', 9200.00, 8800.00, 15, 3, '2025-07-28 07:51:18', '2025-07-28 07:51:18', NULL),
(44, 'Children\'s Yukata Set (Red)', 'Complete yukata set for kids with accessories', 6500.00, NULL, 30, 3, '2025-07-28 07:51:18', '2025-07-28 07:51:18', NULL),
(45, 'Silk Formal Kimono (Black)', 'High-quality black silk kimono for formal occasions', 45000.00, 42000.00, 8, 3, '2025-07-28 07:51:18', '2025-07-28 07:51:18', NULL),
(46, 'Cherry Blossom Kimono (Pink)', 'Spring-themed kimono with sakura patterns', 38000.00, NULL, 10, 3, '2025-07-28 07:51:18', '2025-07-28 07:51:18', NULL),
(47, 'Men\'s Haori and Hakama Set', 'Traditional men\'s formal wear set', 55000.00, NULL, 5, 3, '2025-07-28 07:51:18', '2025-07-28 07:51:18', NULL),
(48, 'Furisode Kimono (Red)', 'Long-sleeved furisode for young women', 68000.00, 65000.00, 6, 3, '2025-07-28 07:51:18', '2025-07-28 07:51:18', NULL),
(49, 'Obi Belt (Gold Embroidery)', 'Formal obi belt with intricate gold designs', 12000.00, NULL, 40, 3, '2025-07-28 07:51:18', '2025-07-28 07:51:18', NULL),
(50, 'Zori Sandals (Black)', 'Traditional zori footwear for kimono', 8500.00, 8000.00, 50, 3, '2025-07-28 07:51:18', '2025-07-28 07:51:18', NULL),
(51, 'Sony WH-1000XM5 Wireless Headphones', 'Industry-leading noise canceling headphones', 39800.00, 37800.00, 15, 4, '2025-07-28 08:19:22', '2025-07-28 08:19:22', NULL),
(52, 'Panasonic Nanoe Hair Dryer EH-NA0J', 'Advanced hair care technology with nanoe ions', 24800.00, NULL, 20, 4, '2025-07-28 08:19:22', '2025-07-28 08:19:22', NULL),
(53, 'Sharp Healsio AX-XW300 Steam Oven', '4-in-1 microwave with steam cooking', 65800.00, 62800.00, 8, 4, '2025-07-28 08:19:22', '2025-07-28 08:19:22', NULL),
(54, 'Tiger Electric Rice Cooker JKJ-A550', '5.5 cup capacity with advanced fuzzy logic', 29800.00, NULL, 12, 4, '2025-07-28 08:19:22', '2025-07-28 08:19:22', NULL),
(55, 'Zojirushi Stainless Steel Water Boiler CD-JSQ50', '4L capacity with temperature control', 18500.00, 16800.00, 25, 4, '2025-07-28 08:19:22', '2025-07-28 08:19:22', NULL),
(56, 'Hitachi CM-N4000 Facial Cleansing Brush', '3-in-1 skincare device with warm function', 32800.00, NULL, 18, 4, '2025-07-28 08:19:22', '2025-07-28 08:19:22', NULL),
(57, 'Yamaha YAS-209 Sound Bar', 'Bluetooth soundbar with wireless subwoofer', 42800.00, 39800.00, 10, 4, '2025-07-28 08:19:22', '2025-07-28 08:19:22', NULL),
(58, 'Casio G-Shock GWG-2000 Mudmaster', 'Premium shock-resistant smartwatch', 74800.00, NULL, 5, 4, '2025-07-28 08:19:22', '2025-07-28 08:19:22', NULL),
(59, 'Fujitsu ScanSnap iX1500 Document Scanner', 'High-speed wireless document scanner', 59800.00, 55800.00, 7, 4, '2025-07-28 08:19:22', '2025-07-28 08:19:22', NULL),
(60, 'Razer Huntsman Mini Gaming Keyboard', '60% compact mechanical gaming keyboard', 14800.00, NULL, 30, 4, '2025-07-28 08:19:22', '2025-07-28 08:19:22', NULL),
(61, 'Kikkoman Soy Sauce (1L)', 'Authentic Japanese brewed soy sauce', 580.00, NULL, 100, 6, '2025-07-29 00:17:53', '2025-07-29 00:21:13', NULL),
(62, 'Yamaki Mentsuyu', 'Katsuobushi-ya no Dashi, 500ml x 1 bottle, Mentsuyu, Noodle soup, 2x concentrated, Diluted, Popular, Ranking, Saturday Plus', 1400.00, 1240.00, 80, 6, '2025-07-29 00:17:53', '2025-07-29 00:35:45', NULL),
(63, 'Mizkan Rice Vinegar (500ml)', 'Pure rice vinegar for sushi and dressings', 350.00, NULL, 120, 6, '2025-07-29 00:17:53', '2025-07-29 00:22:36', NULL),
(64, 'S&B Togarashi Chili Pepper (45g)', 'Japanese seven-spice chili blend', 420.00, 380.00, 90, 6, '2025-07-29 00:17:53', '2025-07-29 00:22:43', NULL),
(65, 'Marukin Bonito Flakes (30g)', 'Premium katsuobushi for dashi stock', 480.00, NULL, 70, 6, '2025-07-29 00:17:53', '2025-07-29 00:23:42', NULL),
(66, 'Ajinomoto Hondashi (100g)', 'Instant dashi soup stock granules', 320.00, NULL, 150, 6, '2025-07-29 00:17:53', '2025-07-29 00:23:37', NULL),
(67, 'Mitsukan Mirin (500ml)', 'Authentic sweet cooking sake', 450.00, 420.00, 85, 6, '2025-07-29 00:17:53', '2025-07-29 00:22:07', NULL),
(68, 'Shimaya Kombu Seaweed (50g)', 'Dried kelp for making dashi broth', 780.00, NULL, 60, 6, '2025-07-29 00:17:53', '2025-07-29 00:20:59', NULL),
(69, 'Kagome Ponzu Sauce (300ml)', 'Citrus-seasoned soy sauce', 520.00, NULL, 75, 6, '2025-07-29 00:17:53', '2025-07-29 00:20:52', NULL),
(70, 'House Foods Okonomiyaki Sauce (500g)', 'Special sauce for Japanese savory pancakes', 480.00, 450.00, 65, 6, '2025-07-29 00:17:53', '2025-07-29 00:20:45', NULL),
(71, 'Kyobancha Uji Gold (100g)', 'Rare roasted winter tea leaves from Kyoto', 4200.00, NULL, 50, 7, '2025-07-29 00:57:26', '2025-07-29 01:05:14', NULL),
(72, 'Marukyu Koyamaen Matcha (40g)', 'Ceremonial grade Uji matcha powder', 2500.00, 2300.00, 30, 7, '2025-07-29 00:57:26', '2025-07-29 00:57:26', NULL),
(73, 'Yamamotoyama Genmaicha (200g)', 'Green tea with roasted brown rice', 680.00, NULL, 80, 7, '2025-07-29 00:57:26', '2025-07-29 00:57:26', NULL),
(74, 'Lupicia Momiji Tea (10 bags)', 'Seasonal maple-flavored green tea', 580.00, NULL, 60, 7, '2025-07-29 00:57:26', '2025-07-29 00:57:26', NULL),
(75, 'Ippodo Hojicha (150g)', 'Roasted green tea with nutty flavor', 1200.00, 1100.00, 45, 7, '2025-07-29 00:57:26', '2025-07-29 00:57:26', NULL),
(76, 'Yame Gyokuro (50g)', 'Premium shade-grown green tea', 3500.00, NULL, 25, 7, '2025-07-29 00:57:26', '2025-07-29 00:57:26', NULL),
(77, 'Sakura Green Tea (20 bags)', 'Cherry blossom flavored green tea', 750.00, NULL, 70, 7, '2025-07-29 00:57:26', '2025-07-29 00:57:26', NULL),
(78, 'Ito En - Barley Mineral Tea', 'Sarasara Instant Mugicha - 100 sticks', 2400.00, NULL, 100, 7, '2025-07-29 00:57:26', '2025-07-29 01:25:28', NULL),
(79, 'Obubu Tea Farm Kabusecha (100g)', 'Partially shaded Kyoto green tea', 1800.00, NULL, 35, 7, '2025-07-29 00:57:26', '2025-07-29 00:57:26', NULL),
(80, 'Nishio Aiya Matcha Latte (10 sticks)', 'Instant matcha latte mix', 850.00, 780.00, 90, 7, '2025-07-29 00:57:26', '2025-07-29 00:57:26', NULL),
(81, 'Shiseido Anessa Perfect UV Sunscreen (60ml)', 'Oil-based waterproof sunscreen SPF50+ PA++++', 3800.00, 3500.00, 45, 8, '2025-07-29 01:40:03', '2025-07-29 01:40:03', NULL),
(82, 'SK-II Facial Treatment Essence (230ml)', 'Iconic Pitera essence for radiant skin', 25000.00, NULL, 20, 8, '2025-07-29 01:40:03', '2025-07-29 01:40:03', NULL),
(83, 'Hada Labo Gokujyun Premium Lotion (170ml)', '5-type hyaluronic acid hydrating toner', 1200.00, NULL, 80, 8, '2025-07-29 01:40:03', '2025-07-29 01:40:03', NULL),
(84, 'DHC Deep Cleansing Oil (200ml)', 'Best-selling olive oil-based makeup remover', 1800.00, 1600.00, 65, 8, '2025-07-29 01:40:03', '2025-07-29 01:40:03', NULL),
(85, 'Kao Biore UV Aqua Rich Watery Essence (50g)', 'Lightweight sunscreen with hyaluronic acid', 950.00, NULL, 100, 8, '2025-07-29 01:40:03', '2025-07-29 01:40:03', NULL),
(86, 'Shu Uemura Anti/Oil+ Cleansing Oil (450ml)', 'Premium oil cleanser for all skin types', 8500.00, 8000.00, 30, 8, '2025-07-29 01:40:03', '2025-07-29 01:40:03', NULL),
(87, 'Canmake Mermaid Skin Gel UV (40g)', 'Clear sunscreen gel with moisturizing effect', 880.00, NULL, 75, 8, '2025-07-29 01:40:03', '2025-07-29 01:40:03', NULL),
(88, 'Tsubaki Premium Repair Hair Mask (180g)', 'Camellia oil-infused deep conditioner', 1200.00, NULL, 60, 8, '2025-07-29 01:40:03', '2025-07-29 01:40:03', NULL),
(89, 'Kose Softymo Speedy Cleansing Oil (230ml)', 'Fast-absorbing cleansing oil', 650.00, 580.00, 90, 8, '2025-07-29 01:40:03', '2025-07-29 01:40:03', NULL),
(90, 'Cure Natural Aqua Gel (250g)', 'Gentle exfoliating gel for sensitive skin', 2800.00, NULL, 40, 8, '2025-07-29 01:40:03', '2025-07-29 01:40:03', NULL),
(101, 'Theory-inspired Blazer (Gray)', 'Tailored slim-fit blazer for work', 25000.00, 23000.00, 10, 9, '2025-07-29 02:52:26', '2025-07-29 02:52:26', NULL),
(102, 'Oggi Pleated Midi Skirt (Navy)', 'Elegant wrinkle-resistant skirt', 8900.00, NULL, 18, 9, '2025-07-29 02:52:26', '2025-07-29 02:52:26', NULL),
(103, '23区 Silk Blouse (Ivory)', 'Premium work blouse with hidden buttons', 15000.00, NULL, 15, 9, '2025-07-29 02:52:26', '2025-07-29 02:52:26', NULL),
(104, 'Untitled Wide-leg Trousers', 'High-waisted professional pants', 12000.00, 11000.00, 20, 9, '2025-07-29 02:52:26', '2025-07-29 02:52:26', NULL),
(105, 'Nano Universe Knit Vest', 'Cashmere-blend layered vest', 18000.00, NULL, 12, 9, '2025-07-29 02:52:26', '2025-07-29 02:52:26', NULL),
(106, 'Comme des Garçons PLAY T-Shirt', 'Iconic heart logo cotton tee', 12000.00, NULL, 25, 9, '2025-07-29 02:52:26', '2025-07-29 02:52:26', NULL),
(107, 'A Bathing Ape Hoodie (Pink)', 'Signature zip-up hoodie with ape head logo', 24000.00, 22000.00, 8, 9, '2025-07-29 02:52:26', '2025-07-29 02:52:26', NULL),
(108, 'Undercover Denim Jacket', 'Distressed denim jacket with embroidery', 32000.00, NULL, 6, 9, '2025-07-29 02:52:26', '2025-07-29 02:52:26', NULL),
(109, 'Human Made Graphic Tee', 'Vintage-inspired cotton t-shirt', 9500.00, NULL, 30, 9, '2025-07-29 02:52:26', '2025-07-29 02:52:26', NULL),
(110, 'Ambush Logo Sweatshirt', 'Oversized streetwear sweatshirt', 28000.00, NULL, 10, 9, '2025-07-29 02:52:26', '2025-07-29 02:52:26', NULL),
(111, 'GU Jersey Wide Pants (Black)', 'Comfortable stretchy pants', 2900.00, NULL, 30, 9, '2025-07-29 02:52:26', '2025-07-29 02:52:26', NULL),
(112, 'Uniqlo AIRISM Cotton T-Shirt', 'Breathable basic tee with Japanese fit', 1500.00, 1200.00, 50, 9, '2025-07-29 02:52:26', '2025-07-29 02:52:26', NULL),
(113, 'Muji Linen Overshirt (Beige)', 'Natural linen shirt for layering', 6900.00, NULL, 20, 9, '2025-07-29 02:52:26', '2025-07-29 02:52:26', NULL),
(114, 'United Arrows Cardigan', 'Lightweight open-front knit', 14000.00, NULL, 15, 9, '2025-07-29 02:52:26', '2025-07-29 02:52:26', NULL),
(115, 'Beams Boy Cropped Sweater', 'Colorblock wool-blend sweater', 16000.00, 14500.00, 18, 9, '2025-07-29 02:52:26', '2025-07-29 02:52:26', NULL),
(116, 'Gelato Pique Pajama Set', 'Ultra-soft cloud-like sleepwear', 8500.00, 7800.00, 35, 9, '2025-07-29 02:52:26', '2025-07-29 02:52:26', NULL),
(117, 'Ungrid Lounge Cardigan', 'Oversized knit cardigan', 12000.00, NULL, 28, 9, '2025-07-29 02:52:26', '2025-07-29 02:52:26', NULL),
(118, 'Plage Wool Coat (Camel)', 'Winter wool blend coat with belt', 35000.00, 32000.00, 10, 9, '2025-07-29 02:52:26', '2025-07-29 02:52:26', NULL),
(119, 'Nice Claup Lace Dress', 'Spring floral dress with layered skirt', 15000.00, NULL, 15, 9, '2025-07-29 02:52:26', '2025-07-29 02:52:26', NULL),
(120, 'Samantha Thavasa Handbag', 'Luxury leather crossbody bag', 45000.00, NULL, 5, 9, '2025-07-29 02:52:26', '2025-07-29 02:52:26', NULL),
(121, 'The North Face Purple Label Parka', 'Waterproof winter parka with Japanese sizing', 45000.00, 42000.00, 8, 10, '2025-07-29 04:33:23', '2025-07-29 04:33:23', NULL),
(122, 'Beams Plus Wool Peacoat', 'Tailored navy wool coat for business casual', 38000.00, NULL, 6, 10, '2025-07-29 04:33:23', '2025-07-29 04:33:23', NULL),
(123, 'Uniqlo Blocktech Jacket', 'Lightweight waterproof urban jacket', 12900.00, 11900.00, 15, 10, '2025-07-29 04:33:23', '2025-07-29 04:33:23', NULL),
(124, 'United Arrows Oxford Shirt', 'Classic slim-fit button-down', 15000.00, NULL, 20, 10, '2025-07-29 04:33:23', '2025-07-29 04:33:23', NULL),
(125, 'Kapital Denim Western Shirt', 'Indigo-dyed shirt with signature details', 28000.00, NULL, 12, 10, '2025-07-29 04:33:23', '2025-07-29 04:33:23', NULL),
(126, 'Visvim Linen Camp Shirt', 'Breathable summer shirt with hidden placket', 32000.00, 30000.00, 10, 10, '2025-07-29 04:33:23', '2025-07-29 04:33:23', NULL),
(127, 'Ships Striped T-Shirt', 'Premium cotton crewneck with side gussets', 8500.00, NULL, 25, 10, '2025-07-29 04:33:23', '2025-07-29 04:33:23', NULL),
(128, 'Orslow 105 Jeans', 'Vintage-inspired slim straight selvage', 25000.00, NULL, 14, 10, '2025-07-29 04:33:23', '2025-07-29 04:33:23', NULL),
(129, 'Nanamica Gurkha Shorts', 'Technical fabric military-style shorts', 18000.00, NULL, 18, 10, '2025-07-29 04:33:23', '2025-07-29 04:33:23', NULL),
(130, 'Uniqlo U Wide-fit Trousers', 'Contemporary work pants with stretch', 7900.00, NULL, 30, 10, '2025-07-29 04:33:23', '2025-07-29 04:33:23', NULL),
(131, 'Nonnative Cargo Pants', 'Utility pants with articulated knees', 22000.00, NULL, 12, 10, '2025-07-29 04:33:23', '2025-07-29 04:33:23', NULL),
(132, 'John Smedley Merino Crewneck', 'Ultra-fine British wool with Japanese cut', 35000.00, NULL, 8, 10, '2025-07-29 04:33:23', '2025-07-29 04:33:23', NULL),
(133, 'Snow Peak Cardigan', 'Outdoor-inspired knit with toggle buttons', 24000.00, NULL, 10, 10, '2025-07-29 04:33:23', '2025-07-29 04:33:23', NULL),
(134, 'Engineered Garments Shawl Collar Sweater', 'Textured wool blend with unique construction', 28000.00, 26000.00, 7, 10, '2025-07-29 04:33:23', '2025-07-29 04:33:23', NULL),
(135, 'Hender Scheme MIP-10 Sneakers', 'Handcrafted leather low-tops', 55000.00, NULL, 5, 10, '2025-07-29 04:33:23', '2025-07-29 04:33:23', NULL),
(136, 'Asics x Kiko Kostadinov Gel-Burz', 'Designer running shoe collaboration', 32000.00, NULL, 12, 10, '2025-07-29 04:33:23', '2025-07-29 04:33:23', NULL),
(137, 'Suicoke Sandal-Cab', 'Premium vibration-absorbing sandals', 18000.00, 16000.00, 15, 10, '2025-07-29 04:33:23', '2025-07-29 04:33:23', NULL),
(138, 'Master-Piece Rucksack', 'Waterproof nylon backpack with leather details', 42000.00, NULL, 9, 10, '2025-07-29 04:33:23', '2025-07-29 04:33:23', NULL),
(139, 'Yuketen Leather Belt', 'Hand-stitched reversible belt', 15000.00, NULL, 20, 10, '2025-07-29 04:33:23', '2025-07-29 04:33:23', NULL),
(140, 'White Mountaineering Beanie', 'Acrylic/wool blend winter hat', 6800.00, NULL, 35, 10, '2025-07-29 04:33:23', '2025-07-29 04:33:23', NULL),
(141, 'Mikihouse Newborn Gift Set', '5-piece cotton set with hats and mittens', 8500.00, 7800.00, 25, 11, '2025-07-29 07:07:50', '2025-07-29 07:07:50', NULL),
(142, 'Uniqlo Baby Romper 3-Pack', 'Breathable stretchy onesies (0-3M)', 3900.00, NULL, 40, 11, '2025-07-29 07:07:50', '2025-07-29 07:07:50', NULL),
(143, 'Nishimatsuya Layette Set', 'Organic cotton kimono-style tops and pants', 6500.00, NULL, 30, 11, '2025-07-29 07:07:50', '2025-07-29 07:07:50', NULL),
(144, 'Combi Baby Snowsuit', 'Waterproof winter suit with foldover mittens', 12000.00, 11000.00, 15, 11, '2025-07-29 07:07:50', '2025-07-29 07:07:50', NULL),
(145, 'Akachan Honpo Sun Hat', 'UPF50+ sun protection hat with neck flap', 2800.00, NULL, 50, 11, '2025-07-29 07:07:50', '2025-07-29 07:07:50', NULL),
(146, 'Shirataka Cardigan', 'Knit cotton cardigan with wooden buttons', 4500.00, NULL, 35, 11, '2025-07-29 07:07:50', '2025-07-29 07:07:50', NULL),
(147, 'Muji Organic Cotton Bodysuit', 'Snap-crotch onesie in neutral colors', 1900.00, NULL, 60, 11, '2025-07-29 07:07:50', '2025-07-29 07:07:50', NULL),
(148, 'Happy Oni Pajama Set', '100% cotton pajamas with cute oni print', 3200.00, NULL, 45, 11, '2025-07-29 07:07:50', '2025-07-29 07:07:50', NULL),
(149, 'Wakodo Crossover Tops', 'Traditional side-snap baby shirts (5-pack)', 4800.00, NULL, 30, 11, '2025-07-29 07:07:50', '2025-07-29 07:07:50', NULL),
(150, 'Pigeon Terry Coveralls', 'Absorbent all-in-one for playtime', 3800.00, NULL, 40, 11, '2025-07-29 07:07:50', '2025-07-29 07:07:50', NULL),
(151, '10mois Organic Dress', 'French-inspired smock dress with lace', 5500.00, NULL, 20, 11, '2025-07-29 07:07:50', '2025-07-29 07:07:50', NULL),
(152, 'Bebe Jardin Striped Set', 'Boatneck top and shorts combo', 4200.00, 3800.00, 25, 11, '2025-07-29 07:07:50', '2025-07-29 07:07:50', NULL),
(153, 'Familiar Christening Gown', 'Hand-smocked cotton baptism outfit', 18000.00, NULL, 12, 11, '2025-07-29 07:07:50', '2025-07-29 07:07:50', NULL),
(154, 'Kimono Style Party Dress', 'Silk-satin dress with obi belt', 9500.00, NULL, 15, 11, '2025-07-29 07:07:50', '2025-07-29 07:07:50', NULL),
(155, 'Petit Main Suit Set', 'Wool blend vest and pants for boys', 12000.00, NULL, 10, 11, '2025-07-29 07:07:50', '2025-07-29 07:07:50', NULL),
(156, 'Akachan Honpo Bib 5-Pack', 'Absorbent feeding bibs with snaps', 2500.00, NULL, 80, 11, '2025-07-29 07:07:50', '2025-07-29 07:07:50', NULL),
(157, 'Piyo Piyo Booties', 'Anti-slip first walker shoes', 3200.00, NULL, 40, 11, '2025-07-29 07:07:50', '2025-07-29 07:07:50', NULL),
(158, 'Kaneson Nursing Cover', 'Multipurpose cotton gauze blanket', 3500.00, NULL, 50, 11, '2025-07-29 07:07:50', '2025-07-29 07:07:50', NULL),
(159, 'Gelato Pique Baby Swaddle', 'Ultra-soft stretchy wrap', 5800.00, NULL, 30, 11, '2025-07-29 07:07:50', '2025-07-29 07:07:50', NULL),
(160, 'Hoppetta 6-Layer Kimono', 'Breathable layered sleep gown', 7500.00, 6900.00, 20, 11, '2025-07-29 07:07:50', '2025-07-29 07:07:50', NULL),
(161, 'Galaxy S23', 'Flagship smartphone with 200MP camera', 999.99, 899.99, 150, 1, '2025-07-30 04:39:29', '2025-07-30 04:39:29', NULL),
(162, 'プレミアムランニングシューズ', 'クッション技術を搭載した高性能ランニングシューズ', 12999.00, 10999.00, 150, 10, '2025-07-30 06:58:10', '2025-07-31 02:08:02', NULL),
(163, 'ワイヤレスBluetoothヘッドホン', 'ノイズキャンセリング機能付き、30時間駆動', 19999.00, 17999.00, 80, 4, '2025-07-30 06:58:10', '2025-07-31 02:08:19', NULL),
(164, 'オーガニックコットンTシャツ', '100%オーガニックコットンのクルーネックTシャツ', 2999.00, NULL, 200, 10, '2025-07-30 06:58:10', '2025-07-31 02:08:52', NULL),
(165, 'ステンレススチール水筒', '24時間保冷可能な断仕切32ozボトル', 3999.00, 3499.00, 120, 12, '2025-07-30 06:58:10', '2025-07-31 02:14:04', NULL),
(166, 'スマートフィットネスウォッチ', '心拍数、歩数、睡眠パターンをトラッキング', 15999.00, NULL, 90, 4, '2025-07-30 06:58:10', '2025-07-31 02:10:01', NULL),
(167, 'レザー財布', 'RFID保護機能付き本革二つ折り財布', 4999.00, 4499.00, 180, 10, '2025-07-30 06:58:10', '2025-07-31 02:10:12', NULL),
(168, 'セラミックコーヒーマグ', '人間工学に基づいたハンドルの16ozセラミックマグ', 1999.00, NULL, 250, 12, '2025-07-30 06:58:10', '2025-07-31 02:14:14', NULL),
(169, 'ヨガマット', '滑り止め6mm厚ヨガマット（ストラップ付属）', 5999.00, 4999.00, 70, 13, '2025-07-30 06:58:10', '2025-07-31 02:18:37', NULL),
(170, 'ワイヤレス充電器', 'Qi対応デバイス用10W急速充電パッド', 3499.00, NULL, 160, 4, '2025-07-30 06:58:10', '2025-07-31 02:18:59', NULL),
(171, 'バックパック', 'ノートPC収納可能な防水バックパック', 7999.00, 6999.00, 110, 4, '2025-07-30 06:58:10', '2025-07-31 02:19:15', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=172;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
