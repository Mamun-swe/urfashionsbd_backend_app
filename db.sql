-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 12, 2020 at 12:30 PM
-- Server version: 10.2.34-MariaDB
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `urfashio_urfashion`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `name`, `image`, `created_at`, `updated_at`) VALUES
(6, NULL, 'Men', '1605079439.jpg', '2020-11-10 07:01:20', '2020-11-11 01:23:59'),
(7, 6, 'Shirt', '1605013649.jpg', '2020-11-10 07:07:29', '2020-11-10 07:07:29'),
(9, NULL, 'Women', '1605079426.jpg', '2020-11-10 07:08:26', '2020-11-11 01:23:46'),
(10, 9, 'Sharee', '1605013724.jpg', '2020-11-10 07:08:44', '2020-11-10 07:08:44'),
(11, 6, 'T-shirt', '1605081733.jpeg', '2020-11-11 02:02:13', '2020-11-11 02:02:13');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount_percent` int(11) DEFAULT NULL,
  `discount_amount` double DEFAULT NULL,
  `validation_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `name`, `code`, `type`, `discount_percent`, `discount_amount`, `validation_date`, `created_at`, `updated_at`) VALUES
(1, 'Winter Offer', 'abc1234', 'percent', 50, NULL, '2020-11-26', '2020-11-04 04:35:03', '2020-11-10 07:12:06'),
(2, 'summer collection', 'summ2020', 'fixed', NULL, 50, '2024-11-11', '2020-11-11 06:12:51', '2020-11-11 06:12:51');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(37, '2014_10_12_000000_create_users_table', 1),
(38, '2014_10_12_100000_create_password_resets_table', 1),
(39, '2019_08_19_000000_create_failed_jobs_table', 1),
(40, '2020_10_30_090544_create_categories_table', 1),
(41, '2020_10_30_193800_create_products_table', 1),
(42, '2020_10_30_200513_create_product_images_table', 1),
(43, '2020_11_01_130220_create_sliders_table', 1),
(44, '2020_11_01_130246_create_coupons_table', 1),
(45, '2020_11_02_104344_create_subscribers_table', 1),
(51, '2020_11_06_095131_create_orders_table', 2),
(54, '2020_11_08_173719_create_ordered_products_table', 3),
(57, '2020_11_09_072719_create_reviews_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `ordered_products`
--

CREATE TABLE `ordered_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `size` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ordered_products`
--

INSERT INTO `ordered_products` (`id`, `order_id`, `product_id`, `quantity`, `size`, `color`, `price`, `created_at`, `updated_at`) VALUES
(25, 18, 6, 1, 'S', '#642a3c', 1000, '2020-11-11 00:17:49', '2020-11-11 00:17:49'),
(26, 19, 8, 1, 'XS', '#fff', 1000, '2020-11-11 01:59:09', '2020-11-11 01:59:09'),
(27, 19, 11, 1, 'X', 'black', 1200, '2020-11-11 01:59:09', '2020-11-11 01:59:09'),
(28, 20, 12, 1, 'X', 'black', 1200, '2020-11-11 02:11:07', '2020-11-11 02:11:07'),
(29, 21, 16, 1, 'X', 'green', 850, '2020-11-11 03:16:57', '2020-11-11 03:16:57'),
(30, 21, 7, 1, '100', '#51505b', 1000, '2020-11-11 03:16:57', '2020-11-11 03:16:57'),
(31, 21, 9, 1, '100', '#51505b', 1190, '2020-11-11 03:16:57', '2020-11-11 03:16:57'),
(32, 22, 14, 1, 'X', '#33D4FF', 1200, '2020-11-11 04:24:39', '2020-11-11 04:24:39'),
(33, 23, 14, 1, 'X', '#33D4FF', 1200, '2020-11-11 04:25:38', '2020-11-11 04:25:38'),
(34, 24, 14, 1, 'X', '#33D4FF', 1200, '2020-11-11 04:26:09', '2020-11-11 04:26:09');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_price` double NOT NULL,
  `courier_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `district` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `delivery_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `delivery_charge` double NOT NULL,
  `shipping_area` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `delivery_method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coupon_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_code`, `user_id`, `name`, `phone`, `email`, `total_price`, `courier_name`, `district`, `delivery_address`, `delivery_charge`, `shipping_area`, `delivery_method`, `coupon_code`, `discount`, `status`, `created_at`, `updated_at`) VALUES
(18, 'UR2116', 10, 'Mamun', '01533592619', 'mamun.swe.277@gmail.com', 500, 'janani_courier', 'cvbcvb', 'cvbcvbcvb', 100, 'Outside Dhaka', 'Cash on delivery', 'abc1234', 50, 'courier', '2020-11-11 00:17:49', '2020-11-11 00:56:20'),
(19, 'UR1372', NULL, 'Golam Rabbi', '01762337526', 'golamrabbi5242@gmail.com', 2200, 'sundarban_courier', 'Dhaka', 'Mirpur 10, Dhaka', 100, 'Outside Dhaka', 'Cash on delivery', NULL, NULL, 'pending', '2020-11-11 01:59:09', '2020-11-11 01:59:09'),
(20, 'UR4024', NULL, 'Md. Golam Rabbi', '01762337526', 'golamrabbi5242@gmail.com', 600, 'sundarban_courier', 'Dhaka', 'Mirpur 10, Dhaka', 80, 'Inside Dhaka', 'Cash on delivery', 'abc1234', 50, 'pending', '2020-11-11 02:11:07', '2020-11-11 02:11:07'),
(21, 'UR8712', 11, 'test userX', '012589745125', '12@gmail.com', 3040, 'sundarban_courier', 'natore', 'natore, Rajshahi', 100, 'Outside Dhaka', 'Cash on delivery', NULL, NULL, 'courier', '2020-11-11 03:16:57', '2020-11-11 03:21:25'),
(22, 'UR9697', 11, 'test userX', '012589745125', '12@gmail.com', 1200, 'sundarban_courier', 'Dhaka', 'Mirpur 10, Dhaka', 80, 'Inside Dhaka', 'Cash on delivery', NULL, NULL, 'pending', '2020-11-11 04:24:39', '2020-11-11 04:24:39'),
(23, 'UR6121', 11, 'test userX', '012589745125', '12@gmail.com', 1200, 'sundarban_courier', 'Dhaka', 'Mirpur 10, Dhaka', 80, 'Inside Dhaka', 'Cash on delivery', NULL, NULL, 'pending', '2020-11-11 04:25:37', '2020-11-11 04:25:37'),
(24, 'UR1107', 11, 'test userX', '012589745125', '12@gmail.com', 1200, 'sundarban_courier', 'Dhaka', 'Mirpur 10, Dhaka', 80, 'Inside Dhaka', 'Cash on delivery', NULL, NULL, 'processing', '2020-11-11 04:26:09', '2020-11-11 06:14:32');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `parent_category_id` int(11) NOT NULL,
  `brand` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `tags` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `mrp` double NOT NULL,
  `selling_price` double NOT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `track_inventory` tinyint(1) NOT NULL DEFAULT 0,
  `stock` tinyint(1) NOT NULL DEFAULT 0,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `weight` int(11) DEFAULT NULL,
  `feature` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `category_id`, `parent_category_id`, `brand`, `campaign_id`, `tags`, `mrp`, `selling_price`, `sku`, `track_inventory`, `stock`, `image`, `size`, `color`, `quantity`, `weight`, `feature`, `created_at`, `updated_at`) VALUES
(6, 'Casual Cotton Shirt', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\'s De Finibus Bonorum et Malorum for use in a type specimen book.', 11, 9, 'UR Fashion', NULL, 'shirt, Casual shirt, men shirt', 1250, 1000, 'SH129', 1, 1, '1605013838.jpg', '100', '#642a3c, #e0ddcc', 50, 100, 0, '2020-11-10 07:10:38', '2020-11-11 02:44:38'),
(7, 'Casual Cotton Shirt', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 7, 6, 'UR Fashion', NULL, 'shirt, Casual shirt, men shirt', 1500, 1000, 'SH129', 1, 1, '1605078633.jpg', '100', '#51505b, #a95d6b, #393c45, #7393be', 50, 100, 0, '2020-11-11 01:10:33', '2020-11-11 02:43:51'),
(8, 'Casual Cotton Shirt', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 11, 6, 'UR Fashion', NULL, 'shirt, Casual shirt, men shirt', 1250, 1000, 'SH123', 1, 1, '1605078711.jpg', '100', '#fff, #1b1b25, #607c99, #000', 20, 100, 0, '2020-11-11 01:11:51', '2020-11-11 02:43:05'),
(9, 'Casual Cotton Shirt', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 7, 6, 'UR Fashion', NULL, 'shirt, Casual shirt, men shirt', 1250, 1190, 'SH129', 1, 1, '1605078763.jpg', '100', '#51505b, #a95d6b, #393c45, #7393be', 20, 100, 0, '2020-11-11 01:12:43', '2020-11-11 02:44:27'),
(10, 'Tangail Cotton Saree test name lorem ispum', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 10, 9, 'UR Fashion', NULL, 'shirt, Casual shirt, men shirt', 1590, 1190, 'SH129', 1, 1, '1605079065.jpg', '100', '#51505b, #a95d6b, #393c45, #7393be', 50, 100, 0, '2020-11-11 01:17:45', '2020-11-11 23:09:39'),
(11, 'Shaare', 'What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book it has?', 10, 9, 'URFashions', NULL, 'shaari', 1200, 1200, 'shaari1245', 1, 1, '1605080047.jpg', 'X,XL,XXL', 'black, green, #4d0000, #4000ff', 30, 2, 0, '2020-11-11 01:34:07', '2020-11-11 01:34:07'),
(12, 'Shaari', 'What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book it has?What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book it has?', 10, 9, 'URFashions', NULL, 'Shaari', 1200, 1200, 'shaari1246', 1, 1, '1605080240.jpg', 'X,XL,XXL', 'black, green, #4d0000, #4000ff', 30, 2, 0, '2020-11-11 01:37:20', '2020-11-11 01:37:20'),
(13, 'Shaari', 'What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book it has?What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book it has?', 10, 9, 'URFashions', NULL, 'Shaari,shari,sharee', 1200, 1200, 'shaari1247', 1, 1, '1605081204.jpg', 'X,XL,XXL', '#33D4FF,#1C2C59,#311C59', 30, 2, 0, '2020-11-11 01:53:24', '2020-11-11 01:53:24'),
(14, 'Shaari', 'What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book it has?What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book it has?', 10, 9, 'URFashions', NULL, 'Shaari,shari,sharee', 1200, 600, 'shaari1248', 1, 1, '1605081275.jpg', '2', '#33D4FF,#1C2C59,#311C59', 30, 2, 0, '2020-11-11 01:54:35', '2020-11-11 23:46:04'),
(15, 'Polo Shirt', 'What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book it has?What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book it has?', 11, 6, 'URFashions', NULL, 'polo-shirt,t-shirt', 850, 850, 't-shirt123', 1, 1, '1605085708.jpg', 'X,XL,XXL', 'black, green, #4d0000, #4000ff', 30, 2, 0, '2020-11-11 03:08:28', '2020-11-11 03:08:28'),
(16, 'Polo Shirt', 'What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book it has?What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book it has?', 11, 6, 'URFashions', NULL, 'polo-shirt,t-shirt', 850, 850, 't-shirt124', 1, 1, '1605085780.jpg', 'X,XL,XXL', 'black, green, #4d0000, #4000ff', 30, 2, 0, '2020-11-11 03:09:40', '2020-11-11 03:09:40'),
(17, 'Formal Shirt', 'What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book it has?What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book it has?', 7, 6, 'URFashions', NULL, 'shirt,full-shirt', 1200, 1200, 'shirt113', 1, 1, '1605086019.jpg', 'X,XL,XXL', '#33D4FF,#1C2C59,#311C59', 30, 2, 0, '2020-11-11 03:13:39', '2020-11-11 03:13:39'),
(18, 'Trial Product 1', 'What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book it has?What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book it has?', 11, 6, 'URFashions', NULL, 'shirt,full-shirt', 1200, 900, 'shirt2245', 1, 1, '1605096585.jpg', 'X,XL,XXL', 'black, green, #4d0000, #4000ff', 30, 2, 0, '2020-11-11 06:09:45', '2020-11-11 06:09:45');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `image`, `created_at`, `updated_at`) VALUES
(19, 6, '5faa914e7a348.jpg', '2020-11-10 07:10:38', '2020-11-10 07:10:38'),
(20, 6, '5faa914e7be58.jpg', '2020-11-10 07:10:38', '2020-11-10 07:10:38'),
(22, 6, '5faa91689db2f.jpg', '2020-11-10 07:11:04', '2020-11-10 07:11:04'),
(23, 7, '5fab8e69e801f.jpg', '2020-11-11 01:10:33', '2020-11-11 01:10:33'),
(24, 7, '5fab8e69e9a79.jpg', '2020-11-11 01:10:33', '2020-11-11 01:10:33'),
(25, 7, '5fab8e69eab22.jpg', '2020-11-11 01:10:33', '2020-11-11 01:10:33'),
(26, 7, '5fab8e69ec6a5.jpg', '2020-11-11 01:10:33', '2020-11-11 01:10:33'),
(27, 7, '5fab8e69edb1e.jpg', '2020-11-11 01:10:33', '2020-11-11 01:10:33'),
(28, 8, '5fab8eb7ef385.jpg', '2020-11-11 01:11:51', '2020-11-11 01:11:51'),
(29, 8, '5fab8eb7f0733.jpg', '2020-11-11 01:11:51', '2020-11-11 01:11:51'),
(30, 8, '5fab8eb7f18db.jpg', '2020-11-11 01:11:51', '2020-11-11 01:11:51'),
(31, 8, '5fab8eb7f265e.jpg', '2020-11-11 01:11:51', '2020-11-11 01:11:51'),
(32, 9, '5fab8eeb319be.jpg', '2020-11-11 01:12:43', '2020-11-11 01:12:43'),
(33, 9, '5fab8eeb32b54.jpg', '2020-11-11 01:12:43', '2020-11-11 01:12:43'),
(34, 9, '5fab8eeb33b8b.jpg', '2020-11-11 01:12:43', '2020-11-11 01:12:43'),
(35, 10, '5fab9019cb3ea.jpg', '2020-11-11 01:17:45', '2020-11-11 01:17:45'),
(36, 10, '5fab9019cc887.jpg', '2020-11-11 01:17:45', '2020-11-11 01:17:45'),
(38, 10, '5fab9019ce9f6.jpg', '2020-11-11 01:17:45', '2020-11-11 01:17:45'),
(39, 11, '5fab93ef7d055.jpg', '2020-11-11 01:34:07', '2020-11-11 01:34:07'),
(40, 11, '5fab93ef82d68.jpg', '2020-11-11 01:34:07', '2020-11-11 01:34:07'),
(41, 11, '5fab93ef85baa.jpg', '2020-11-11 01:34:07', '2020-11-11 01:34:07'),
(42, 12, '5fab94b065ca5.jpg', '2020-11-11 01:37:20', '2020-11-11 01:37:20'),
(43, 12, '5fab94b06886d.jpg', '2020-11-11 01:37:20', '2020-11-11 01:37:20'),
(44, 12, '5fab94b0699c8.jpg', '2020-11-11 01:37:20', '2020-11-11 01:37:20'),
(45, 13, '5fab987502de7.jpg', '2020-11-11 01:53:25', '2020-11-11 01:53:25'),
(46, 14, '5fab98bb7966b.jpg', '2020-11-11 01:54:35', '2020-11-11 01:54:35'),
(47, 15, '5fabaa0c32083.jpg', '2020-11-11 03:08:28', '2020-11-11 03:08:28'),
(48, 16, '5fabaa543c925.jpg', '2020-11-11 03:09:40', '2020-11-11 03:09:40'),
(49, 17, '5fabab437424b.jpg', '2020-11-11 03:13:39', '2020-11-11 03:13:39'),
(50, 18, '5fabd4894d6ef.jpg', '2020-11-11 06:09:45', '2020-11-11 06:09:45'),
(51, 18, '5fabd4894ef6a.jpg', '2020-11-11 06:09:45', '2020-11-11 06:09:45');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` double NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `product_id`, `name`, `email`, `rating`, `comment`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Mamun', 'roni@gmail.com', 4, 'nice dress', 'approved', '2020-11-09 01:51:44', '2020-11-09 03:15:44'),
(2, 1, 'Mamun', 'ronia@gmail.com', 3, 'wow', 'approved', '2020-11-09 03:27:24', '2020-11-09 03:27:47'),
(3, 2, 'Mamun', 'roni@gmail.com', 5, 'joss', 'approved', '2020-11-09 03:47:49', '2020-11-10 06:57:37');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `name`, `image`, `created_at`, `updated_at`) VALUES
(3, 'Tangail Cotton Saree', '1605014058.jpg', '2020-11-10 07:14:18', '2020-11-10 07:14:18'),
(4, 'Men', '1605014069.jpg', '2020-11-10 07:14:29', '2020-11-10 07:14:29'),
(5, 'Shirt', '1605014081.jpg', '2020-11-10 07:14:41', '2020-11-10 07:14:41'),
(7, 'Tangail Cotton Saree abc', '1605079306.jpg', '2020-11-11 01:21:46', '2020-11-11 01:21:46');

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscribers`
--

INSERT INTO `subscribers` (`id`, `email`, `created_at`, `updated_at`) VALUES
(1, 'mamun.swe.277@gmail.com', '2020-11-09 00:55:24', '2020-11-09 00:55:24'),
(2, 'roni@gmail.com', '2020-11-09 03:48:42', '2020-11-09 03:48:42'),
(3, 'golamrabbidiu@gmail.com', '2020-11-11 00:02:22', '2020-11-11 00:02:22'),
(4, 'joshuamcgall@hotmail.co.uk', '2020-11-11 06:21:51', '2020-11-11 06:21:51');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` enum('user','admin','editor') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `api_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone_number`, `image`, `role`, `password`, `api_token`, `created_at`, `updated_at`) VALUES
(8, 'admin', 'admin@gmail.com', '01533592610', '1605070571.jpg', 'admin', '$2y$10$0kF5qiJzF3wzChDR7I2uqOXobkEgnNEsHxbbW.YSxsM/QGbZf76O6', 'S3FMUVJhSmNGazk0QjJDSkNBdUg1ZWtWU1RXb2ZnazJXTGlmcGxkYnNDS3RVRmNwaUtTTjZPakZKQkFQ5facc36ea0695', '2020-11-10 22:49:48', '2020-11-11 23:09:02'),
(9, 'Golam Rabby', 'golamrabbidiu@gmail.com', '01533592618', '1605079371.jpg', 'admin', '$2y$10$lH7yCpUn.WpWdmtHoT6g2OyQm7zoJeQRQj5yi.Czkp1pBGXZNflOS', NULL, '2020-11-10 22:56:55', '2020-11-11 05:54:03'),
(10, 'Mamun x', 'mamun.swe.277@gmail.com', '01533592619', '1605077060.jpg', 'user', '$2y$10$gZ4yMo5WEpnG0N3NV1FeSefIBIJKVAQyJlvILlrFfhAU.NqrRpF3q', NULL, '2020-11-10 23:57:08', '2020-11-11 01:06:53'),
(11, 'test userX', '12@gmail.com', '012589745125', NULL, 'user', '$2y$10$OJcgf5KMkPPNZdmek18j/.QRcp8JFGRDQF1WJnKZRBoSdfB/N7ZQS', 'M01vOXZoRHIwNWdlM0tOZ2ExbmdzSHNwS0ZpRmFFY1BSSGdsdU81M29GUGd2NENSNHFlaElaY0xFcWVy5fababcabd8ec', '2020-11-11 03:15:13', '2020-11-11 03:15:54');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_name_unique` (`name`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ordered_products`
--
ALTER TABLE `ordered_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_phone_number_unique` (`phone_number`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `ordered_products`
--
ALTER TABLE `ordered_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
