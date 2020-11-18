-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 18, 2020 at 04:43 PM
-- Server version: 10.2.36-MariaDB
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
(11, 6, 'T-shirt', '1605081733.jpeg', '2020-11-11 02:02:13', '2020-11-11 02:02:13'),
(12, NULL, 'Kids', '1605507619.jpg', '2020-11-16 00:20:19', '2020-11-16 00:20:19'),
(14, 6, 'sweater', '1605513300.jpg', '2020-11-16 01:55:00', '2020-11-16 01:55:00');

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
(34, 24, 14, 1, 'X', '#33D4FF', 1200, '2020-11-11 04:26:09', '2020-11-11 04:26:09'),
(35, 25, 14, 1, 'X', '#33D4FF', 1200, '2020-11-16 00:33:01', '2020-11-16 00:33:01'),
(36, 25, 19, 1, 'X', 'three color', 1200, '2020-11-16 00:33:01', '2020-11-16 00:33:01'),
(37, 26, 47, 1, '29', '#e0ddcc', 1190, '2020-11-16 02:03:46', '2020-11-16 02:03:46'),
(38, 26, 48, 1, '28', '#642a3c', 1190, '2020-11-16 02:03:46', '2020-11-16 02:03:46'),
(39, 26, 20, 1, '200', '#3a467a', 1000, '2020-11-16 02:03:46', '2020-11-16 02:03:46'),
(40, 27, 12, 1, 'X', 'black', 1200, '2020-11-16 02:45:16', '2020-11-16 02:45:16'),
(41, 28, 29, 1, 'L', 'Multiple Colours', 690, '2020-11-16 03:27:27', '2020-11-16 03:27:27');

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
(28, 'UR5198', NULL, 'Md. Golam Rabbi', '01762337526', 'golamrabbi5242@gmail.com', 690, 'sundarban_courier', 'Dhaka', 'Mirpur 10, Dhaka', 80, 'Inside Dhaka', 'Cash on delivery', NULL, NULL, 'pending', '2020-11-16 03:27:25', '2020-11-17 22:21:41');

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
(10, 'Tangail Cotton Saree', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 10, 9, 'UR Fashion', NULL, 'shirt, Casual shirt, men shirt', 1590, 1190, 'SH129', 1, 1, '1605079065.jpg', '100', '#51505b, #a95d6b, #393c45, #7393be', 50, 100, 0, '2020-11-11 01:17:45', '2020-11-13 23:08:00'),
(11, 'Shaare', 'What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book it has?', 10, 9, 'URFashions', NULL, 'shaari', 1200, 1200, 'shaari1245', 1, 1, '1605080047.jpg', 'X,XL,XXL', 'black, green, #4d0000, #4000ff', 30, 2, 0, '2020-11-11 01:34:07', '2020-11-11 01:34:07'),
(12, 'Shaari', 'What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book it has?What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book it has?', 10, 9, 'URFashions', NULL, 'Shaari', 1200, 1200, 'shaari1246', 1, 1, '1605080240.jpg', 'X,XL,XXL', 'black, green, #4d0000, #4000ff', 30, 2, 0, '2020-11-11 01:37:20', '2020-11-11 01:37:20'),
(13, 'Shaari', 'What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book it has?What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book it has?', 10, 9, 'URFashions', NULL, 'Shaari,shari,sharee', 1200, 1200, 'shaari1247', 1, 1, '1605081204.jpg', 'X,XL,XXL', '#33D4FF,#1C2C59,#311C59', 30, 2, 0, '2020-11-11 01:53:24', '2020-11-11 01:53:24'),
(14, 'Shaari', 'What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book it has?What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book it has?', 10, 9, 'URFashions', NULL, 'Shaari,shari,sharee', 1200, 600, 'shaari1248', 1, 1, '1605081275.jpg', '2', '#33D4FF,#1C2C59,#311C59', 30, 2, 0, '2020-11-11 01:54:35', '2020-11-11 23:46:04'),
(15, 'Polo Shirt', 'What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book it has?What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book it has?', 11, 6, 'URFashions', NULL, 'polo-shirt,t-shirt', 850, 850, 't-shirt123', 1, 1, '1605085708.jpg', 'X,XL,XXL', 'black, green, #4d0000, #4000ff', 30, 2, 0, '2020-11-11 03:08:28', '2020-11-11 03:08:28'),
(16, 'Polo Shirt', 'What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book it has?What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book it has?', 11, 6, 'URFashions', NULL, 'polo-shirt,t-shirt', 850, 850, 't-shirt124', 1, 1, '1605085780.jpg', 'X,XL,XXL', 'black, green, #4d0000, #4000ff', 30, 2, 0, '2020-11-11 03:09:40', '2020-11-11 03:09:40'),
(17, 'Formal Shirt', 'What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book it has?What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book it has?', 7, 6, 'URFashions', NULL, 'shirt,full-shirt', 1200, 1200, 'shirt113', 1, 1, '1605086019.jpg', 'X,XL,XXL', '#33D4FF,#1C2C59,#311C59', 30, 2, 0, '2020-11-11 03:13:39', '2020-11-11 03:13:39'),
(18, 'Trial Product 1', 'What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book it has?What is Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book it has?', 11, 6, 'URFashions', NULL, 'shirt,full-shirt', 1200, 900, 'shirt2245', 1, 1, '1605096585.jpg', 'X,XL,XXL', 'black, green, #4d0000, #4000ff', 30, 2, 0, '2020-11-11 06:09:45', '2020-11-11 06:09:45'),
(20, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1250, 1000, 'BS1909', 1, 1, '1605512499.jpg', '200', '#3a467a', 500, 200, 0, '2020-11-16 01:41:39', '2020-11-16 01:45:05'),
(21, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1250, 1000, 'BS1910', 1, 1, '1605513948.jpg', '200', '#b8c5ef', 500, 200, 0, '2020-11-16 02:05:48', '2020-11-16 02:18:59'),
(22, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1250, 1000, 'BS1911', 1, 1, '1605514228.jpg', '200', '#eeeef6', 500, 200, 0, '2020-11-16 02:10:28', '2020-11-16 02:19:46'),
(23, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1250, 1000, 'BS1912', 1, 1, '1605514402.jpg', '200', '#c9b8ae', 500, 200, 0, '2020-11-16 02:13:22', '2020-11-16 02:23:55'),
(24, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1250, 1000, 'BS1913', 1, 1, '1605514622.jpg', 'M, L, XL', '#0d0d0f', 500, 200, 0, '2020-11-16 02:17:02', '2020-11-16 02:17:02'),
(25, 'China Biscose Cotton Sweater', '* Pure cotton shirt\r\n\r\n·         Asian measurement,  \r\n\r\nBrand Product Size- Measurement\r\n\r\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\r\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\r\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'', 14, 6, 'UR Fashions', NULL, 'Sweater, Cotton Sweater', 900, 690, 'URS 190', 1, 1, '1605515001.jpg', 'M, L, XL', 'Multiple Colours', 50, 200, 0, '2020-11-16 02:23:21', '2020-11-16 02:23:21'),
(26, 'China Biscose Cotton Sweater', '* Pure cotton shirt\r\n\r\n·         Asian measurement,  \r\n\r\nBrand Product Size- Measurement\r\n\r\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\r\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\r\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'', 14, 6, 'UR Fashions', NULL, 'Sweater, Cotton Sweater', 900, 690, 'URS 191', 1, 1, '1605515216.jpg', 'M, L, XL', 'Multiple Colours', 50, 200, 0, '2020-11-16 02:26:56', '2020-11-16 02:26:56'),
(27, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 14, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1250, 1000, 'BS1914', 1, 1, '1605518350.jpg', '200', '#ffffff', 500, 200, 0, '2020-11-16 03:19:10', '2020-11-16 03:20:08'),
(28, 'China Biscose Cotton Sweater', '* Pure cotton shirt\r\n\r\n·         Asian measurement,  \r\n\r\nBrand Product Size- Measurement\r\n\r\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\r\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\r\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'', 14, 6, 'UR Fashions', NULL, 'Sweater, Cotton Sweater', 900, 690, 'URS 196', 1, 1, '1605518357.jpg', 'M, L, XL', 'Multiple Colours', 50, 200, 0, '2020-11-16 03:19:17', '2020-11-16 03:19:17'),
(29, 'China Biscose Cotton Sweater', '* Pure cotton shirt\r\n\r\n·         Asian measurement,  \r\n\r\nBrand Product Size- Measurement\r\n\r\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\r\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\r\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'', 14, 6, 'UR Fashions', NULL, 'Sweater, Cotton Sweater', 900, 690, 'URS 197', 1, 1, '1605518504.jpg', 'M, L, XL', 'Multiple Colours', 50, 200, 0, '2020-11-16 03:21:44', '2020-11-16 03:21:44'),
(30, 'China Biscose Cotton Sweater', '* Pure cotton shirt\r\n\r\n·         Asian measurement,  \r\n\r\nBrand Product Size- Measurement\r\n\r\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\r\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\r\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'', 14, 6, 'UR Fashions', NULL, 'Sweater, Cotton Sweater', 900, 690, 'URS 198', 1, 1, '1605518610.jpg', 'M, L, XL', 'Multiple Colours', 50, 200, 0, '2020-11-16 03:23:30', '2020-11-16 03:23:30'),
(31, 'China Biscose Cotton Sweater', '* Pure cotton shirt\r\n\r\n·         Asian measurement,  \r\n\r\nBrand Product Size- Measurement\r\n\r\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\r\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\r\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'', 14, 6, 'UR Fashions', NULL, 'Sweater, Cotton Sweater', 900, 690, 'URS 199', 1, 1, '1605519317.jpg', 'M, L, XL', '#4e5529', 50, 200, 0, '2020-11-16 03:35:17', '2020-11-16 03:35:17'),
(32, 'China Biscose Cotton Sweater', '* Pure cotton shirt\r\n\r\n·         Asian measurement,  \r\n\r\nBrand Product Size- Measurement\r\n\r\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\r\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\r\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'', 14, 6, 'UR Fashions', NULL, 'Sweater, Cotton Sweater', 900, 690, 'URS 200', 1, 1, '1605519468.jpg', 'M, L, XL', '#1a1a1c', 50, 200, 0, '2020-11-16 03:37:48', '2020-11-16 03:37:48'),
(33, 'China Biscose Cotton Sweater', '* Pure cotton shirt\r\n\r\n·         Asian measurement,  \r\n\r\nBrand Product Size- Measurement\r\n\r\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\r\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\r\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'', 14, 6, 'UR Fashions', NULL, 'Sweater, Cotton Sweater', 900, 690, 'URS 201', 1, 1, '1605519614.jpg', 'M, L, XL', '#750e23', 50, 200, 0, '2020-11-16 03:40:14', '2020-11-16 03:40:14'),
(34, 'China Biscose Cotton Sweater', '* Pure cotton shirt\r\n\r\n·         Asian measurement,  \r\n\r\nBrand Product Size- Measurement\r\n\r\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\r\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\r\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'', 14, 6, 'UR Fashions', NULL, 'Sweater, Cotton Sweater', 900, 690, 'URS 202', 1, 1, '1605519758.jpg', 'M, L, XL', '#20203a', 50, 200, 0, '2020-11-16 03:42:38', '2020-11-16 03:42:38'),
(35, 'China Biscose Cotton Sweater', '* Pure cotton shirt\r\n\r\n·         Asian measurement,  \r\n\r\nBrand Product Size- Measurement\r\n\r\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\r\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\r\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'', 14, 6, 'UR Fashions', NULL, 'Sweater, Cotton Sweater', 900, 690, 'URS 206', 1, 1, '1605519900.jpg', 'M, L, XL', 'Multiple Colours', 50, 200, 0, '2020-11-16 03:45:00', '2020-11-16 03:45:00'),
(36, 'China Biscose Cotton Sweater', '* Pure cotton shirt\r\n\r\n·         Asian measurement,  \r\n\r\nBrand Product Size- Measurement\r\n\r\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\r\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\r\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'', 14, 6, 'UR Fashions', NULL, 'Sweater, Cotton Sweater', 900, 690, 'URS 207', 1, 1, '1605520001.jpg', 'M, L, XL', 'Multiple Colours', 50, 200, 0, '2020-11-16 03:46:41', '2020-11-16 03:46:41'),
(37, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1250, 1000, 'BS1915', 1, 1, '1605520016.jpg', '200', '#beaba1', 500, 200, 0, '2020-11-16 03:46:56', '2020-11-16 03:48:22'),
(38, 'China Biscose Cotton Sweater', '* Pure cotton shirt\r\n\r\n·         Asian measurement,  \r\n\r\nBrand Product Size- Measurement\r\n\r\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\r\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\r\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'', 14, 6, 'UR Fashions', NULL, 'Sweater, Cotton Sweater', 900, 690, 'URS 210', 1, 1, '1605520107.jpg', 'M, L, XL', 'Multiple Colours', 50, 200, 0, '2020-11-16 03:48:27', '2020-11-16 03:48:27'),
(39, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1250, 1000, 'BS1916', 1, 1, '1605520349.jpg', 'M, L, XL', '#242541', 500, 200, 0, '2020-11-16 03:52:29', '2020-11-16 03:52:29'),
(40, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1250, 1000, 'BS2401', 1, 1, '1605520603.jpg', 'M, L, XL', '#f892a7', 500, 200, 0, '2020-11-16 03:56:43', '2020-11-16 03:56:43'),
(41, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\r\n\r\n·         Asian measurement,  \r\n\r\nBrand Product Size- Measurement\r\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\r\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\r\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\r\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\r\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\r\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashions', NULL, 'shirt, cotton shirt', 1500, 1200, 'BS 2524', 1, 1, '1605520687.jpg', 'XS, S, M, L, XL, XLL', '#c5d4f3', 100, 200, 0, '2020-11-16 03:58:07', '2020-11-16 03:58:07'),
(42, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1250, 1000, 'BS2403', 1, 1, '1605520776.jpg', 'M, L, XL', '#66b695', 500, 200, 0, '2020-11-16 03:59:36', '2020-11-16 03:59:36'),
(43, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\r\n\r\n·         Asian measurement,  \r\n\r\nBrand Product Size- Measurement\r\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\r\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\r\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\r\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\r\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\r\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashions', NULL, 'shirt, cotton shirt', 1500, 1200, 'BS 1928', 1, 1, '1605520914.jpg', 'XS, S, M, L, XL, XLL', '#1c1b19', 100, 150, 0, '2020-11-16 04:01:54', '2020-11-16 04:01:54'),
(44, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\r\n\r\n·         Asian measurement,  \r\n\r\nBrand Product Size- Measurement\r\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\r\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\r\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\r\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\r\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\r\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashions', NULL, 'shirt, cotton shirt', 1500, 1200, 'BS 1930', 1, 1, '1605521123.jpg', 'XS, S, M, L, XL, XLL', '#e4223a', 100, 200, 0, '2020-11-16 04:05:23', '2020-11-16 04:05:23'),
(45, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\r\n\r\n·         Asian measurement,  \r\n\r\nBrand Product Size- Measurement\r\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\r\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\r\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\r\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\r\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\r\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashions', NULL, 'shirt, cotton shirt', 1500, 1200, 'BS 1931', 1, 1, '1605521265.jpg', 'XS, S, M, L, XL, XLL', '#fddc6b', 100, 150, 0, '2020-11-16 04:07:45', '2020-11-16 04:07:45'),
(46, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\r\n\r\n·         Asian measurement,  \r\n\r\nBrand Product Size- Measurement\r\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\r\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\r\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\r\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\r\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\r\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashions', NULL, 'shirt, cotton shirt', 1500, 1200, 'BS 1932', 1, 1, '1605521458.jpg', 'XS, S, M, L, XL, XXL', '#eae6f4', 100, 200, 0, '2020-11-16 04:10:58', '2020-11-16 04:10:58'),
(47, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1250, 1000, 'BS2404', 1, 1, '1605521482.jpg', 'M, L, XL', '#f5e97c', 500, 200, 0, '2020-11-16 04:11:22', '2020-11-16 04:11:22'),
(48, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1250, 1000, 'BS2407', 1, 1, '1605521683.jpg', 'M, L, XL', '#3f1844', 500, 200, 0, '2020-11-16 04:14:43', '2020-11-16 04:14:43'),
(49, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\r\n\r\n·         Asian measurement,  \r\n\r\nBrand Product Size- Measurement\r\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\r\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\r\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\r\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\r\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\r\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashions', NULL, 'shirt, cotton shirt', 1500, 1200, 'BS 1933', 1, 1, '1605521718.jpg', 'XS, S, M, L, XL, XXL', '#36bef8', 100, 200, 0, '2020-11-16 04:15:18', '2020-11-16 04:15:18'),
(50, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\r\n\r\n·         Asian measurement,  \r\n\r\nBrand Product Size- Measurement\r\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\r\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\r\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\r\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\r\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\r\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashions', NULL, 'shirt, cotton shirt', 1500, 1200, 'BS 1934', 1, 1, '1605521968.jpg', 'XS, S, M, L, XL, XXL', '#1c4064', 100, 200, 0, '2020-11-16 04:19:28', '2020-11-16 04:19:28'),
(51, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\r\n\r\n·         Asian measurement,  \r\n\r\nBrand Product Size- Measurement\r\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\r\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\r\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\r\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\r\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\r\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashions', NULL, 'shirt, cotton shirt', 1500, 1200, 'BS 1936', 1, 1, '1605522118.jpg', 'XS, S, M, L, XL, XXL', '#9ddf85', 100, 150, 0, '2020-11-16 04:21:58', '2020-11-16 04:21:58'),
(52, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1250, 1000, 'BS2408', 1, 1, '1605522162.jpg', 'M, L, XL', '#42843a', 500, 200, 0, '2020-11-16 04:22:42', '2020-11-16 04:22:42'),
(53, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\r\n\r\n·         Asian measurement,  \r\n\r\nBrand Product Size- Measurement\r\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\r\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\r\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\r\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\r\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\r\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashions', NULL, 'shirt, cotton shirt', 1500, 1200, 'BS 2076', 1, 1, '1605522271.jpg', 'XS, S, M, L, XL, XXL', '#edd24f', 100, 200, 0, '2020-11-16 04:24:31', '2020-11-16 04:24:31'),
(54, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1250, 1000, 'BS2409', 1, 1, '1605522407.jpg', 'M, L, XL', '#900b1c', 500, 200, 0, '2020-11-16 04:26:47', '2020-11-16 04:26:47'),
(55, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\r\n\r\n·         Asian measurement,  \r\n\r\nBrand Product Size- Measurement\r\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\r\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\r\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\r\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\r\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\r\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashions', NULL, 'shirt, cotton shirt', 1500, 1200, 'BS 2077', 1, 1, '1605522435.jpg', 'XS, S, M, L, XL, XXL', '#232227', 100, 200, 0, '2020-11-16 04:27:15', '2020-11-16 04:27:15'),
(56, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1250, 1000, 'BS2410', 1, 1, '1605522614.jpg', 'M, L, XL', '#0058d0', 500, 200, 0, '2020-11-16 04:30:14', '2020-11-16 04:30:14'),
(57, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\r\n\r\n·         Asian measurement,  \r\n\r\nBrand Product Size- Measurement\r\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\r\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\r\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\r\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\r\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\r\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashions', NULL, 'shirt, cotton shirt', 1500, 1200, 'BS 2078', 1, 1, '1605522618.jpg', 'XS, S, M, L, XL, XXL', '#2c2c52', 100, 200, 0, '2020-11-16 04:30:18', '2020-11-16 04:30:18'),
(58, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\r\n\r\n·         Asian measurement,  \r\n\r\nBrand Product Size- Measurement\r\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\r\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\r\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\r\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\r\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\r\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashions', NULL, 'shirt, cotton shirt', 1500, 1200, 'BS 2079', 1, 1, '1605522767.jpg', 'XS, S, M, L, XL, XXL', '#006d82', 100, 200, 0, '2020-11-16 04:32:47', '2020-11-16 04:32:47'),
(59, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1250, 1000, 'BS2411', 1, 1, '1605522795.jpg', 'M, L, XL', '#2b346f', 500, 200, 0, '2020-11-16 04:33:15', '2020-11-16 04:33:15'),
(60, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\r\n\r\n·         Asian measurement,  \r\n\r\nBrand Product Size- Measurement\r\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\r\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\r\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\r\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\r\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\r\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashions', NULL, 'shirt, cotton shirt', 1500, 1200, 'BS 2519', 1, 1, '1605522916.jpg', 'XS, S, M, L, XL, XXL', '#242f7e', 100, 200, 0, '2020-11-16 04:35:16', '2020-11-16 04:35:16'),
(61, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1250, 1000, 'BS2430', 1, 1, '1605523059.jpg', 'M, L, XL', '#e0c1ac', 500, 200, 0, '2020-11-16 04:37:39', '2020-11-16 04:37:39'),
(62, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\r\n\r\n·         Asian measurement,  \r\n\r\nBrand Product Size- Measurement\r\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\r\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\r\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\r\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\r\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\r\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashions', NULL, 'shirt, cotton shirt', 1500, 1200, 'BS 2520', 1, 1, '1605523088.jpg', 'XS, S, M, L, XL, XXL', '#2b2a2f', 100, 200, 0, '2020-11-16 04:38:08', '2020-11-16 04:38:08'),
(63, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\r\n\r\n·         Asian measurement,  \r\n\r\nBrand Product Size- Measurement\r\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\r\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\r\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\r\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\r\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\r\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashions', NULL, 'shirt, cotton shirt', 1500, 1200, 'BS 2521', 1, 1, '1605523235.jpg', 'XS, S, M, L, XL, XXL', '#fcd9ef', 100, 200, 0, '2020-11-16 04:40:35', '2020-11-16 04:40:35'),
(64, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1250, 1000, 'BS2431', 1, 1, '1605523243.jpg', 'M, L, XL', '#6bbe96', 500, 200, 0, '2020-11-16 04:40:43', '2020-11-16 04:40:43'),
(65, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\r\n\r\n·         Asian measurement,  \r\n\r\nBrand Product Size- Measurement\r\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\r\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\r\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\r\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\r\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\r\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashions', NULL, 'shirt, cotton shirt', 1500, 1200, 'BS 2522', 1, 1, '1605523428.jpg', 'XS, S, M, L, XL, XXL', '#7f2549', 100, 200, 0, '2020-11-16 04:43:48', '2020-11-16 04:43:48'),
(66, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\r\n\r\n·         Asian measurement,  \r\n\r\nBrand Product Size- Measurement\r\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\r\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\r\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\r\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\r\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\r\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashions', NULL, 'shirt, cotton shirt', 1500, 1200, 'BS 2523', 1, 1, '1605523592.jpg', 'XS, S, M, L, XL, XXL', '#eeedf3', 100, 200, 0, '2020-11-16 04:46:32', '2020-11-16 04:46:32'),
(67, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1250, 1000, 'BS2435', 1, 1, '1605523644.jpg', 'M, L, XL', '#8ca4e4', 500, 200, 0, '2020-11-16 04:47:24', '2020-11-16 04:47:24'),
(68, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1250, 1000, 'BS2494', 1, 1, '1605523913.jpg', 'M, L, XL', '#fccef6', 500, 200, 0, '2020-11-16 04:51:53', '2020-11-16 04:51:53'),
(69, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\r\n\r\n·         Asian measurement,  \r\n\r\nBrand Product Size- Measurement\r\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\r\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\r\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\r\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\r\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\r\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashions', NULL, 'shirt, cotton shirt', 1350, 1000, 'BS 1825', 1, 1, '1605524098.jpg', 'XS, S, M, L, XL, XXL', '#f5f6fb', 100, 200, 0, '2020-11-16 04:54:58', '2020-11-16 04:54:58'),
(70, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\r\n\r\n·         Asian measurement,  \r\n\r\nBrand Product Size- Measurement\r\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\r\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\r\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\r\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\r\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\r\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashions', NULL, 'shirt, cotton shirt', 1350, 1000, 'BS1826', 1, 1, '1605524229.jpg', 'XS, S, M, L, XL, XXL', '#d7eafb', 100, 200, 0, '2020-11-16 04:57:09', '2020-11-16 04:57:09'),
(71, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1250, 1000, 'BS2495', 1, 1, '1605524272.jpg', '200', '#8ea7ea', 500, 200, 0, '2020-11-16 04:57:52', '2020-11-16 05:01:03'),
(72, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\r\n\r\n·         Asian measurement,  \r\n\r\nBrand Product Size- Measurement\r\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\r\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\r\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\r\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\r\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\r\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashions', NULL, 'shirt, cotton shirt', 1350, 1000, 'BS 1827', 1, 1, '1605524359.jpg', 'XS, S, M, L, XL, XXL', '#f9dcf0', 100, 200, 0, '2020-11-16 04:59:19', '2020-11-16 04:59:19'),
(73, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\r\n\r\n·         Asian measurement,  \r\n\r\nBrand Product Size- Measurement\r\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\r\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\r\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\r\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\r\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\r\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashions', NULL, 'shirt, cotton shirt', 1350, 1000, 'BS 1828', 1, 1, '1605524500.jpg', 'XS, S, M, L, XL, XXL', '#283653', 100, 200, 0, '2020-11-16 05:01:40', '2020-11-16 05:01:40'),
(74, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\r\n\r\n·         Asian measurement,  \r\n\r\nBrand Product Size- Measurement\r\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\r\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\r\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\r\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\r\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\r\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashions', NULL, 'shirt, cotton shirt', 1350, 1000, 'BS 1829', 1, 1, '1605524632.jpg', 'XS, S, M, L, XL, XXL', '#78222b', 100, 200, 0, '2020-11-16 05:03:52', '2020-11-16 05:03:52'),
(75, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1250, 1000, 'BS2551', 1, 1, '1605524705.jpg', 'M, L, XL', '#b6cbe8', 500, 200, 0, '2020-11-16 05:05:05', '2020-11-16 05:05:05'),
(76, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\r\n\r\n·         Asian measurement,  \r\n\r\nBrand Product Size- Measurement\r\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\r\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\r\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\r\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\r\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\r\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashions', NULL, 'shirt, cotton shirt', 1350, 1000, 'BS 2015', 1, 1, '1605524820.jpg', 'XS, S, M, L, XL, XXL', '#c0d0ea', 100, 200, 0, '2020-11-16 05:07:00', '2020-11-16 05:07:00'),
(77, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1250, 1000, 'BS2552', 1, 1, '1605524918.jpg', 'M, L, XL', '#f6f7f1', 500, 200, 0, '2020-11-16 05:08:38', '2020-11-16 05:08:38'),
(78, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\r\n\r\n·         Asian measurement,  \r\n\r\nBrand Product Size- Measurement\r\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\r\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\r\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\r\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\r\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\r\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashions', NULL, 'shirt, cotton shirt', 1350, 1000, 'BS 2016', 1, 1, '1605524972.jpg', 'XS, S, M, L, XL, XXL', '#e5e5ef', 100, 200, 0, '2020-11-16 05:09:32', '2020-11-16 05:09:32'),
(79, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\r\n\r\n·         Asian measurement,  \r\n\r\nBrand Product Size- Measurement\r\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\r\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\r\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\r\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\r\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\r\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashions', NULL, 'shirt, cotton shirt', 1350, 1000, 'BS 2017', 1, 1, '1605525127.jpg', 'XS, S, M, L, XL, XXL', '#720336', 100, 200, 0, '2020-11-16 05:12:07', '2020-11-16 05:12:07'),
(80, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1250, 1000, 'BS2556', 1, 1, '1605525189.jpg', 'M, L, XL', '#060701', 500, 200, 0, '2020-11-16 05:13:09', '2020-11-16 05:13:09'),
(81, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\r\n\r\n·         Asian measurement,  \r\n\r\nBrand Product Size- Measurement\r\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\r\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\r\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\r\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\r\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\r\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashions', NULL, 'shirt, cotton shirt', 1350, 1000, 'BS 2019', 1, 1, '1605525357.jpg', 'XS, S, M, L, XL, XXL', '#17161c', 100, 200, 0, '2020-11-16 05:15:57', '2020-11-16 05:15:57'),
(82, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\r\n\r\n·         Asian measurement,  \r\n\r\nBrand Product Size- Measurement\r\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\r\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\r\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\r\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\r\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\r\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashions', NULL, 'shirt, cotton shirt', 1350, 1000, 'BS 2125', 1, 1, '1605525529.jpg', 'XS, S, M, L, XL, XXL', '#a0b7e9', 100, 200, 0, '2020-11-16 05:18:49', '2020-11-16 05:18:49'),
(83, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\r\n\r\n·         Asian measurement,  \r\n\r\nBrand Product Size- Measurement\r\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\r\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\r\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\r\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\r\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\r\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashions', NULL, 'shirt, cotton shirt', 1350, 1000, 'BS 2129', 1, 1, '1605525684.jpg', 'XS, S, M, L, XL, XXL', '#f8f7fd', 100, 200, 0, '2020-11-16 05:21:24', '2020-11-16 05:21:24'),
(84, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1250, 1000, 'BS2557', 1, 1, '1605525712.jpg', 'M, L, XL', '#222439', 500, 200, 0, '2020-11-16 05:21:52', '2020-11-16 05:21:52'),
(85, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\r\n\r\n·         Asian measurement,  \r\n\r\nBrand Product Size- Measurement\r\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\r\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\r\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\r\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\r\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\r\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashions', NULL, 'shirt, cotton shirt', 1350, 1000, 'BS 2131', 1, 1, '1605525848.jpg', 'XS, S, M, L, XL, XXL', '#0c1127', 100, 200, 0, '2020-11-16 05:24:08', '2020-11-16 05:24:08'),
(86, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1250, 1000, 'BS2558', 1, 1, '1605525895.jpg', 'M, L, XL', '#46141f', 500, 200, 0, '2020-11-16 05:24:55', '2020-11-16 05:24:55'),
(87, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\r\n\r\n·         Asian measurement,  \r\n\r\nBrand Product Size- Measurement\r\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\r\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\r\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\r\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\r\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\r\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashions', NULL, 'shirt, cotton shirt', 1350, 1000, 'BS 2133', 1, 1, '1605525999.jpg', 'XS, S, M, L, XL, XXL', '#c56e81', 100, 200, 0, '2020-11-16 05:26:39', '2020-11-16 05:26:39');
INSERT INTO `products` (`id`, `name`, `description`, `category_id`, `parent_category_id`, `brand`, `campaign_id`, `tags`, `mrp`, `selling_price`, `sku`, `track_inventory`, `stock`, `image`, `size`, `color`, `quantity`, `weight`, `feature`, `created_at`, `updated_at`) VALUES
(88, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1250, 1000, 'BS2577', 1, 1, '1605526136.jpg', 'M, L, XL', '#293f6e', 500, 200, 0, '2020-11-16 05:28:56', '2020-11-16 05:28:56'),
(89, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\r\n\r\n·         Asian measurement,  \r\n\r\nBrand Product Size- Measurement\r\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\r\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\r\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\r\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\r\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\r\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashions', NULL, 'shirt, cotton shirt', 1350, 1000, 'BS 2134', 1, 1, '1605526164.jpg', 'XS, S, M, L, XL, XXL', '#edd4e7', 100, 200, 0, '2020-11-16 05:29:24', '2020-11-16 05:29:24'),
(90, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1250, 1000, 'BS2578', 1, 1, '1605526341.jpg', 'M, L, XL', '#2f2530', 500, 200, 0, '2020-11-16 05:32:21', '2020-11-16 05:32:21'),
(91, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\r\n\r\n·         Asian measurement,  \r\n\r\nBrand Product Size- Measurement\r\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\r\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\r\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\r\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\r\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\r\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashions', NULL, 'shirt, cotton shirt', 1350, 1000, 'BS 2425', 1, 1, '1605526354.jpg', 'XS, S, M, L, XL, XXL', '#82cfbf', 100, 200, 0, '2020-11-16 05:32:34', '2020-11-16 05:32:34'),
(92, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\r\n\r\n·         Asian measurement,  \r\n\r\nBrand Product Size- Measurement\r\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\r\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\r\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\r\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\r\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\r\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashions', NULL, 'shirt, cotton shirt', 1350, 1000, 'BS 2472', 1, 1, '1605526602.jpg', 'XS, S, M, L, XL, XXL', '#015e49', 100, 200, 0, '2020-11-16 05:36:42', '2020-11-16 05:36:42'),
(93, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\r\n\r\n·         Asian measurement,  \r\n\r\nBrand Product Size- Measurement\r\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\r\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\r\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\r\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\r\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\r\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashions', NULL, 'shirt, cotton shirt', 1350, 1000, 'BS 2445', 1, 1, '1605526775.jpg', 'XS, S, M, L, XL, XXL', 'Multiple Colours', 100, 200, 0, '2020-11-16 05:39:35', '2020-11-16 05:39:35'),
(94, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1250, 1000, 'BS2579', 1, 1, '1605526817.jpg', 'M, L, XL', '#2c4e95', 500, 200, 0, '2020-11-16 05:40:17', '2020-11-16 05:40:17'),
(95, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\r\n\r\n·         Asian measurement,  \r\n\r\nBrand Product Size- Measurement\r\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\r\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\r\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\r\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\r\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\r\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashions', NULL, 'shirt, cotton shirt', 1350, 1000, 'BS 2461', 1, 1, '1605526898.jpg', 'XS, S, M, L, XL, XXL', 'Multiple Colours', 100, 200, 0, '2020-11-16 05:41:38', '2020-11-16 05:41:38'),
(96, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1250, 1000, 'BS2580', 0, 1, '1605526983.jpg', '200', '#8fbbf8', 500, 200, 0, '2020-11-16 05:43:03', '2020-11-16 06:10:00'),
(97, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\r\n\r\n·         Asian measurement,  \r\n\r\nBrand Product Size- Measurement\r\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\r\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\r\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\r\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\r\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\r\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashions', NULL, 'shirt, cotton shirt', 1350, 1000, 'BS 2507', 1, 1, '1605527070.jpg', 'XS, S, M, L, XL, XXL', '#ecd9af', 100, 200, 0, '2020-11-16 05:44:30', '2020-11-16 05:44:30'),
(98, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\r\n\r\n·         Asian measurement,  \r\n\r\nBrand Product Size- Measurement\r\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\r\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\r\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\r\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\r\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\r\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashions', NULL, 'shirt, cotton shirt', 1500, 1000, 'BS 2590', 1, 1, '1605527371.jpg', 'XS, S, M, L, XL, XXL', '#f0eefc', 100, 200, 0, '2020-11-16 05:49:31', '2020-11-16 05:49:31'),
(99, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\r\n\r\n·         Asian measurement,  \r\n\r\nBrand Product Size- Measurement\r\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\r\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\r\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\r\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\r\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\r\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashions', NULL, 'shirt, cotton shirt', 1350, 1000, 'BS 2591', 1, 1, '1605527511.jpg', 'XS, S, M, L, XL, XXL', '#121936', 100, 200, 0, '2020-11-16 05:51:51', '2020-11-16 05:51:51'),
(100, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\r\n\r\n·         Asian measurement,  \r\n\r\nBrand Product Size- Measurement\r\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\r\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\r\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\r\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\r\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\r\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashions', NULL, 'shirt, cotton shirt', 1350, 1000, 'BS 2592', 1, 1, '1605527658.jpg', 'XS, S, M, L, XL, XXL', '#121117', 100, 200, 0, '2020-11-16 05:54:18', '2020-11-16 05:54:18'),
(101, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1250, 1000, 'BS2583', 0, 1, '1605527686.jpg', '200', '#2f456c', 500, 200, 0, '2020-11-16 05:54:46', '2020-11-16 06:09:27'),
(102, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\r\n\r\n·         Asian measurement,  \r\n\r\nBrand Product Size- Measurement\r\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\r\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\r\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\r\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\r\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\r\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashions', NULL, 'shirt, cotton shirt', 1350, 1000, 'BS 2593', 1, 1, '1605527787.jpg', 'XS, S, M, L, XL, XXL', '#e7f2d2', 100, 200, 0, '2020-11-16 05:56:27', '2020-11-16 05:56:27'),
(103, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\r\n\r\n·         Asian measurement,  \r\n\r\nBrand Product Size- Measurement\r\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\r\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\r\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\r\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\r\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\r\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashions', NULL, 'shirt, cotton shirt', 1350, 1000, 'BS 2594', 1, 1, '1605527969.jpg', 'XS, S, M, L, XL, XXL', '#8acbeb', 100, 200, 0, '2020-11-16 05:59:29', '2020-11-16 05:59:29'),
(104, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1250, 1000, 'BS2585', 0, 1, '1605528085.jpg', '200', '#678cda', 500, 200, 0, '2020-11-16 06:01:25', '2020-11-16 06:09:06'),
(105, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\r\n\r\n·         Asian measurement,  \r\n\r\nBrand Product Size- Measurement\r\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\r\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\r\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\r\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\r\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\r\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashions', NULL, 'shirt, cotton shirt', 1350, 1000, 'BS 2595', 1, 1, '1605528118.jpg', 'XS, S, M, L, XL, XXL', '#1b2141', 100, 200, 0, '2020-11-16 06:01:58', '2020-11-16 06:01:58'),
(106, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1250, 1000, 'BS2586', 0, 1, '1605528304.jpg', '200', '#21305b', 500, 200, 0, '2020-11-16 06:05:04', '2020-11-16 06:08:28'),
(107, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1250, 1000, 'BS2603', 1, 1, '1605528760.jpg', '200', 'Multi-Colour', 500, 200, 0, '2020-11-16 06:12:40', '2020-11-16 06:16:27'),
(108, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1250, 1000, 'BS 2604', 1, 1, '1605528931.jpg', '200', 'Multi-Colour', 500, 200, 0, '2020-11-16 06:15:31', '2020-11-16 06:16:14'),
(109, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1250, 1000, 'BS2605', 1, 1, '1605529124.jpg', 'M, L, XL', 'Multi-Colour', 500, 200, 0, '2020-11-16 06:18:44', '2020-11-16 06:18:44'),
(110, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1250, 1000, 'BS2606', 1, 1, '1605529280.jpg', 'M, L, XL', 'Multi-Colour', 500, 200, 0, '2020-11-16 06:21:20', '2020-11-16 06:21:20'),
(111, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1250, 1000, 'BS2607', 1, 1, '1605529412.jpg', 'M, L, XL', 'Multi-Colour', 500, 200, 0, '2020-11-16 06:23:32', '2020-11-16 06:23:32'),
(112, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1250, 1000, 'BS2610', 1, 1, '1605529556.jpg', 'M, L, XL', 'Multi-Colour', 500, 200, 0, '2020-11-16 06:25:56', '2020-11-16 06:25:56'),
(113, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1250, 1000, 'BS 2611', 1, 1, '1605529670.jpg', 'M, L, XL', 'Multi-Colour', 500, 200, 0, '2020-11-16 06:27:50', '2020-11-16 06:27:50'),
(114, 'China Biscose Cotton Sweater', '* Pure cotton shirt\r\n\r\n·         Asian measurement,  \r\n\r\nBrand Product Size- Measurement\r\n\r\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\r\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\r\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'', 14, 6, 'UR Fashions', NULL, 'Sweater, Cotton Sweater', 900, 650, 'URS 152', 1, 1, '1605595672.jpg', 'M, L, XL', 'Multiple Colours', 100, 200, 0, '2020-11-17 00:47:52', '2020-11-17 00:47:52'),
(115, 'China Biscose Cotton Sweater', '* Pure cotton shirt\r\n\r\n·         Asian measurement,  \r\n\r\nBrand Product Size- Measurement\r\n\r\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\r\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\r\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'', 14, 6, 'UR Fashions', NULL, 'Sweater, Cotton Sweater', 900, 650, 'URS 153', 1, 1, '1605595808.jpg', 'M, L, XL', 'Multiple Colours', 100, 200, 0, '2020-11-17 00:50:08', '2020-11-17 00:50:08'),
(116, 'China Biscose Cotton Sweater', '* Pure cotton shirt\r\n\r\n·         Asian measurement,  \r\n\r\nBrand Product Size- Measurement\r\n\r\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\r\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\r\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'', 14, 6, 'UR Fashions', NULL, 'Sweater, Cotton Sweater', 900, 650, 'URS 192', 1, 1, '1605595901.jpg', 'M, L, XL', 'Multiple Colours', 100, 200, 0, '2020-11-17 00:51:41', '2020-11-17 00:51:41'),
(117, 'China Biscose Cotton Sweater', '* Pure cotton shirt\r\n\r\n·         Asian measurement,  \r\n\r\nBrand Product Size- Measurement\r\n\r\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\r\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\r\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'', 14, 6, 'UR Fashions', NULL, 'Sweater, Cotton Sweater', 900, 650, 'URS 193', 1, 1, '1605596032.jpg', 'M, L, XL', 'Multiple Colours', 100, 200, 0, '2020-11-17 00:53:52', '2020-11-17 00:53:52'),
(118, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1400, 1100, 'BS1570', 1, 1, '1605596114.jpg', 'M, L, XL', '#e98485', 500, 200, 0, '2020-11-17 00:55:14', '2020-11-17 00:55:14'),
(119, 'China Biscose Cotton Sweater', '* Pure cotton shirt\r\n\r\n·         Asian measurement,  \r\n\r\nBrand Product Size- Measurement\r\n\r\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\r\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\r\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'', 14, 6, 'UR Fashions', NULL, 'Sweater, Cotton Sweater', 900, 650, 'URS 195', 1, 1, '1605596150.jpg', 'M, L, XL', 'Multiple Colours', 100, 200, 0, '2020-11-17 00:55:50', '2020-11-17 00:55:50'),
(120, 'China Biscose Cotton Sweater', '* Pure cotton shirt\r\n\r\n·         Asian measurement,  \r\n\r\nBrand Product Size- Measurement\r\n\r\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\r\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\r\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'', 14, 6, 'UR Fashions', NULL, 'Sweater, Cotton Sweater', 900, 650, 'UrS 208', 1, 1, '1605596246.jpg', 'M, L, XL', 'Multiple Colours', 100, 200, 0, '2020-11-17 00:57:26', '2020-11-17 00:57:26'),
(121, 'China Biscose Cotton Sweater', '* Pure cotton shirt\r\n\r\n·         Asian measurement,  \r\n\r\nBrand Product Size- Measurement\r\n\r\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\r\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\r\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'', 14, 6, 'UR Fashions', NULL, 'Sweater, Cotton Sweater', 900, 650, 'UrS 209', 1, 1, '1605596362.jpg', 'M, L, XL', 'Multiple Colours', 100, 200, 0, '2020-11-17 00:59:22', '2020-11-17 00:59:22'),
(122, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1400, 1100, 'BS1574', 1, 1, '1605596375.jpg', 'M, L, XL', '#838793', 500, 200, 0, '2020-11-17 00:59:35', '2020-11-17 00:59:35'),
(123, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1400, 1100, 'BS1578', 1, 1, '1605596569.jpg', 'M, L, XL', '#7dcde8', 500, 200, 0, '2020-11-17 01:02:49', '2020-11-17 01:02:49'),
(124, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1400, 1100, 'BS2036', 1, 1, '1605596697.jpg', 'M, L, XL', '#21242d', 500, 200, 0, '2020-11-17 01:04:57', '2020-11-17 01:04:57'),
(125, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1400, 1100, 'BS2037', 1, 1, '1605596845.jpg', 'M, L, XL', '#782431', 500, 200, 0, '2020-11-17 01:07:25', '2020-11-17 01:07:25'),
(126, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1400, 1100, 'BS2114', 1, 1, '1605597055.jpg', 'M, L, XL', '#2e3152', 500, 200, 0, '2020-11-17 01:10:55', '2020-11-17 01:10:55'),
(127, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1400, 1100, 'BS2115', 1, 1, '1605597385.jpg', 'M, L, XL', '#1d181f', 500, 200, 0, '2020-11-17 01:16:25', '2020-11-17 01:16:25'),
(128, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1400, 1100, 'BS2178', 1, 1, '1605597752.jpg', 'M, L, XL', '#bad4ef', 500, 200, 0, '2020-11-17 01:22:32', '2020-11-17 01:22:32'),
(129, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1400, 1100, 'BS2179', 1, 1, '1605598175.jpg', 'M, L, XL', '#83dae3', 500, 200, 0, '2020-11-17 01:29:35', '2020-11-17 01:29:35'),
(130, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1400, 1100, 'BS2278', 1, 1, '1605598311.jpg', 'M, L, XL', '#e3e7f2', 500, 200, 0, '2020-11-17 01:31:51', '2020-11-17 01:31:51'),
(131, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1400, 1100, 'BS2279', 1, 1, '1605598456.jpg', 'M, L, XL', '#2e2e3a', 500, 200, 0, '2020-11-17 01:34:16', '2020-11-17 01:34:16'),
(132, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1400, 1100, 'BS2280', 1, 1, '1605598673.jpg', 'M, L, XL', '#26254d', 500, 200, 0, '2020-11-17 01:37:53', '2020-11-17 01:37:53'),
(133, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1400, 1100, 'BS2281', 1, 1, '1605598785.jpg', 'M, L, XL', '#640d1e', 500, 200, 0, '2020-11-17 01:39:45', '2020-11-17 01:39:45'),
(134, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1400, 1100, 'BS2426', 1, 1, '1605599033.jpg', 'M, L, XL', '#ffefaa', 500, 200, 0, '2020-11-17 01:43:53', '2020-11-17 01:43:53'),
(135, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1400, 1100, 'BS2441', 1, 1, '1605601823.jpg', 'M, L, XL', '#2b2275', 500, 200, 0, '2020-11-17 02:30:23', '2020-11-17 02:30:23'),
(136, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1400, 1100, 'BS2549', 1, 1, '1605602044.jpg', 'M, L, XL', '#c7dbf6', 500, 200, 0, '2020-11-17 02:34:04', '2020-11-17 02:34:04'),
(137, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1400, 1100, 'BS2550', 1, 1, '1605602192.jpg', 'M, L, XL', '#dbb7f2', 500, 200, 0, '2020-11-17 02:36:32', '2020-11-17 02:36:32'),
(138, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1400, 1100, 'BS2601', 1, 1, '1605602317.jpg', 'M, L, XL', '#c8dcf4', 500, 200, 0, '2020-11-17 02:38:37', '2020-11-17 02:38:37'),
(139, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1400, 1100, 'BS2602', 1, 1, '1605602444.jpg', 'M, L, XL', '#621058', 500, 200, 0, '2020-11-17 02:40:44', '2020-11-17 02:40:44');

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
(51, 18, '5fabd4894ef6a.jpg', '2020-11-11 06:09:45', '2020-11-11 06:09:45'),
(53, 20, '5fb22d33ddeb2.jpg', '2020-11-16 01:41:39', '2020-11-16 01:41:39'),
(54, 21, '5fb232dc515dd.jpg', '2020-11-16 02:05:48', '2020-11-16 02:05:48'),
(55, 22, '5fb233f503599.jpg', '2020-11-16 02:10:29', '2020-11-16 02:10:29'),
(56, 23, '5fb234a2cce84.jpg', '2020-11-16 02:13:22', '2020-11-16 02:13:22'),
(57, 24, '5fb2357e0fabd.jpg', '2020-11-16 02:17:02', '2020-11-16 02:17:02'),
(58, 25, '5fb236f99fa82.jpg', '2020-11-16 02:23:21', '2020-11-16 02:23:21'),
(59, 26, '5fb237d12e7fd.jpg', '2020-11-16 02:26:57', '2020-11-16 02:26:57'),
(60, 27, '5fb2440e89912.jpg', '2020-11-16 03:19:10', '2020-11-16 03:19:10'),
(61, 28, '5fb24415e7a11.jpg', '2020-11-16 03:19:17', '2020-11-16 03:19:17'),
(62, 29, '5fb244a8d17e9.jpg', '2020-11-16 03:21:44', '2020-11-16 03:21:44'),
(63, 30, '5fb2451333d58.jpg', '2020-11-16 03:23:31', '2020-11-16 03:23:31'),
(64, 31, '5fb247d5619ab.jpg', '2020-11-16 03:35:17', '2020-11-16 03:35:17'),
(65, 32, '5fb2486c3a517.jpg', '2020-11-16 03:37:48', '2020-11-16 03:37:48'),
(66, 33, '5fb248ff31ede.jpg', '2020-11-16 03:40:15', '2020-11-16 03:40:15'),
(67, 34, '5fb2498ee1ca9.jpg', '2020-11-16 03:42:38', '2020-11-16 03:42:38'),
(68, 35, '5fb24a1cc1c99.jpg', '2020-11-16 03:45:00', '2020-11-16 03:45:00'),
(69, 36, '5fb24a81aa1b6.jpg', '2020-11-16 03:46:41', '2020-11-16 03:46:41'),
(70, 37, '5fb24a901ea0e.jpg', '2020-11-16 03:46:56', '2020-11-16 03:46:56'),
(71, 38, '5fb24aec02d1f.jpg', '2020-11-16 03:48:28', '2020-11-16 03:48:28'),
(72, 39, '5fb24bdd41688.jpg', '2020-11-16 03:52:29', '2020-11-16 03:52:29'),
(73, 40, '5fb24cdb294e3.jpg', '2020-11-16 03:56:43', '2020-11-16 03:56:43'),
(74, 41, '5fb24d2fac02e.jpg', '2020-11-16 03:58:07', '2020-11-16 03:58:07'),
(75, 42, '5fb24d88a974d.jpg', '2020-11-16 03:59:36', '2020-11-16 03:59:36'),
(76, 43, '5fb24e1245a85.jpg', '2020-11-16 04:01:54', '2020-11-16 04:01:54'),
(77, 44, '5fb24ee3a47b9.jpg', '2020-11-16 04:05:23', '2020-11-16 04:05:23'),
(78, 45, '5fb24f71dee78.jpg', '2020-11-16 04:07:45', '2020-11-16 04:07:45'),
(79, 46, '5fb250330dd7d.jpg', '2020-11-16 04:10:59', '2020-11-16 04:10:59'),
(80, 47, '5fb2504ae126f.jpg', '2020-11-16 04:11:22', '2020-11-16 04:11:22'),
(81, 48, '5fb25113d73cc.jpg', '2020-11-16 04:14:43', '2020-11-16 04:14:43'),
(82, 49, '5fb251361fad7.jpg', '2020-11-16 04:15:18', '2020-11-16 04:15:18'),
(83, 50, '5fb25230a03f4.jpg', '2020-11-16 04:19:28', '2020-11-16 04:19:28'),
(84, 51, '5fb252c66018c.jpg', '2020-11-16 04:21:58', '2020-11-16 04:21:58'),
(85, 52, '5fb252f21ed8a.jpg', '2020-11-16 04:22:42', '2020-11-16 04:22:42'),
(86, 53, '5fb2535fd7903.jpg', '2020-11-16 04:24:31', '2020-11-16 04:24:31'),
(87, 54, '5fb253e78f419.jpg', '2020-11-16 04:26:47', '2020-11-16 04:26:47'),
(88, 55, '5fb25403556ad.jpg', '2020-11-16 04:27:15', '2020-11-16 04:27:15'),
(89, 56, '5fb254b6e4023.jpg', '2020-11-16 04:30:14', '2020-11-16 04:30:14'),
(90, 57, '5fb254babc239.jpg', '2020-11-16 04:30:18', '2020-11-16 04:30:18'),
(91, 58, '5fb2554fc801b.jpg', '2020-11-16 04:32:47', '2020-11-16 04:32:47'),
(92, 59, '5fb2556c27ad3.jpg', '2020-11-16 04:33:16', '2020-11-16 04:33:16'),
(93, 60, '5fb255e4b4044.jpg', '2020-11-16 04:35:16', '2020-11-16 04:35:16'),
(94, 61, '5fb25673b4158.jpg', '2020-11-16 04:37:39', '2020-11-16 04:37:39'),
(95, 62, '5fb2569062dc8.jpg', '2020-11-16 04:38:08', '2020-11-16 04:38:08'),
(96, 63, '5fb257235677d.jpg', '2020-11-16 04:40:35', '2020-11-16 04:40:35'),
(97, 64, '5fb2572d017b0.jpg', '2020-11-16 04:40:45', '2020-11-16 04:40:45'),
(98, 65, '5fb257e4a9bca.jpg', '2020-11-16 04:43:48', '2020-11-16 04:43:48'),
(99, 66, '5fb25888e33b8.jpg', '2020-11-16 04:46:32', '2020-11-16 04:46:32'),
(100, 67, '5fb258bc6791c.jpg', '2020-11-16 04:47:24', '2020-11-16 04:47:24'),
(101, 68, '5fb259c967ddd.jpg', '2020-11-16 04:51:53', '2020-11-16 04:51:53'),
(102, 69, '5fb25a826000e.jpg', '2020-11-16 04:54:58', '2020-11-16 04:54:58'),
(103, 70, '5fb25b0581bdb.jpg', '2020-11-16 04:57:09', '2020-11-16 04:57:09'),
(104, 71, '5fb25b30bb4c2.jpg', '2020-11-16 04:57:52', '2020-11-16 04:57:52'),
(105, 72, '5fb25b87ee978.jpg', '2020-11-16 04:59:19', '2020-11-16 04:59:19'),
(106, 73, '5fb25c142e9d3.jpg', '2020-11-16 05:01:40', '2020-11-16 05:01:40'),
(107, 74, '5fb25c989869a.jpg', '2020-11-16 05:03:52', '2020-11-16 05:03:52'),
(108, 75, '5fb25ce1bdc34.jpg', '2020-11-16 05:05:05', '2020-11-16 05:05:05'),
(109, 76, '5fb25d552f8b3.jpg', '2020-11-16 05:07:01', '2020-11-16 05:07:01'),
(110, 77, '5fb25db6cbc05.jpg', '2020-11-16 05:08:38', '2020-11-16 05:08:38'),
(111, 78, '5fb25decccacc.jpg', '2020-11-16 05:09:32', '2020-11-16 05:09:32'),
(112, 79, '5fb25e8776c6e.jpg', '2020-11-16 05:12:07', '2020-11-16 05:12:07'),
(113, 80, '5fb25ec56342b.jpg', '2020-11-16 05:13:09', '2020-11-16 05:13:09'),
(114, 81, '5fb25f6dc37b4.jpg', '2020-11-16 05:15:57', '2020-11-16 05:15:57'),
(115, 82, '5fb260198d521.jpg', '2020-11-16 05:18:49', '2020-11-16 05:18:49'),
(116, 83, '5fb260b47b1a4.jpg', '2020-11-16 05:21:24', '2020-11-16 05:21:24'),
(117, 84, '5fb260d0d62df.jpg', '2020-11-16 05:21:52', '2020-11-16 05:21:52'),
(118, 85, '5fb2615931f2e.jpg', '2020-11-16 05:24:09', '2020-11-16 05:24:09'),
(119, 86, '5fb26187aabad.jpg', '2020-11-16 05:24:55', '2020-11-16 05:24:55'),
(120, 87, '5fb261efebc61.jpg', '2020-11-16 05:26:39', '2020-11-16 05:26:39'),
(121, 88, '5fb26278497ee.jpg', '2020-11-16 05:28:56', '2020-11-16 05:28:56'),
(122, 89, '5fb26294992b8.jpg', '2020-11-16 05:29:24', '2020-11-16 05:29:24'),
(123, 90, '5fb26345c115c.jpg', '2020-11-16 05:32:21', '2020-11-16 05:32:21'),
(124, 91, '5fb2635264221.jpg', '2020-11-16 05:32:34', '2020-11-16 05:32:34'),
(125, 92, '5fb2644a4587a.jpg', '2020-11-16 05:36:42', '2020-11-16 05:36:42'),
(126, 93, '5fb264f79f1dd.jpg', '2020-11-16 05:39:35', '2020-11-16 05:39:35'),
(127, 94, '5fb265212f4c6.jpg', '2020-11-16 05:40:17', '2020-11-16 05:40:17'),
(128, 95, '5fb26572132c4.jpg', '2020-11-16 05:41:38', '2020-11-16 05:41:38'),
(129, 96, '5fb265c76a036.jpg', '2020-11-16 05:43:03', '2020-11-16 05:43:03'),
(130, 97, '5fb2662024574.jpg', '2020-11-16 05:44:32', '2020-11-16 05:44:32'),
(131, 98, '5fb2674b68042.jpg', '2020-11-16 05:49:31', '2020-11-16 05:49:31'),
(132, 99, '5fb267da524b2.jpg', '2020-11-16 05:51:54', '2020-11-16 05:51:54'),
(133, 100, '5fb2686a562f1.jpg', '2020-11-16 05:54:18', '2020-11-16 05:54:18'),
(134, 101, '5fb2688698ca1.jpg', '2020-11-16 05:54:46', '2020-11-16 05:54:46'),
(135, 102, '5fb268ebd973d.jpg', '2020-11-16 05:56:27', '2020-11-16 05:56:27'),
(136, 103, '5fb269a13fde6.jpg', '2020-11-16 05:59:29', '2020-11-16 05:59:29'),
(137, 104, '5fb26a15217a1.jpg', '2020-11-16 06:01:25', '2020-11-16 06:01:25'),
(138, 105, '5fb26a364dbcc.jpg', '2020-11-16 06:01:58', '2020-11-16 06:01:58'),
(139, 106, '5fb26af05f2b6.jpg', '2020-11-16 06:05:04', '2020-11-16 06:05:04'),
(140, 107, '5fb26cb81171e.jpg', '2020-11-16 06:12:40', '2020-11-16 06:12:40'),
(141, 108, '5fb26d63a0d07.jpg', '2020-11-16 06:15:31', '2020-11-16 06:15:31'),
(142, 109, '5fb26e24f372c.jpg', '2020-11-16 06:18:44', '2020-11-16 06:18:44'),
(143, 110, '5fb26ec033d46.jpg', '2020-11-16 06:21:20', '2020-11-16 06:21:20'),
(144, 111, '5fb26f4425b5a.jpg', '2020-11-16 06:23:32', '2020-11-16 06:23:32'),
(145, 112, '5fb26fd4dbbe9.jpg', '2020-11-16 06:25:56', '2020-11-16 06:25:56'),
(146, 113, '5fb27046580da.jpg', '2020-11-16 06:27:50', '2020-11-16 06:27:50'),
(147, 114, '5fb3721853a92.jpg', '2020-11-17 00:47:52', '2020-11-17 00:47:52'),
(148, 115, '5fb372a099cf7.jpg', '2020-11-17 00:50:08', '2020-11-17 00:50:08'),
(149, 116, '5fb372fd83171.jpg', '2020-11-17 00:51:41', '2020-11-17 00:51:41'),
(150, 117, '5fb373809dce0.jpg', '2020-11-17 00:53:52', '2020-11-17 00:53:52'),
(151, 118, '5fb373d28cbe7.jpg', '2020-11-17 00:55:14', '2020-11-17 00:55:14'),
(152, 119, '5fb373f6cec22.jpg', '2020-11-17 00:55:50', '2020-11-17 00:55:50'),
(153, 120, '5fb3745648b4c.jpg', '2020-11-17 00:57:26', '2020-11-17 00:57:26'),
(154, 121, '5fb374cac1d5d.jpg', '2020-11-17 00:59:22', '2020-11-17 00:59:22'),
(155, 122, '5fb374d72d041.jpg', '2020-11-17 00:59:35', '2020-11-17 00:59:35'),
(156, 123, '5fb3759988ae6.jpg', '2020-11-17 01:02:49', '2020-11-17 01:02:49'),
(157, 124, '5fb3761994e7c.jpg', '2020-11-17 01:04:57', '2020-11-17 01:04:57'),
(158, 125, '5fb376ad47177.jpg', '2020-11-17 01:07:25', '2020-11-17 01:07:25'),
(159, 126, '5fb3777fbad39.jpg', '2020-11-17 01:10:55', '2020-11-17 01:10:55'),
(160, 127, '5fb378c990442.jpg', '2020-11-17 01:16:25', '2020-11-17 01:16:25'),
(161, 128, '5fb37a38c2a1a.jpg', '2020-11-17 01:22:32', '2020-11-17 01:22:32'),
(162, 129, '5fb37bdf918c1.jpg', '2020-11-17 01:29:35', '2020-11-17 01:29:35'),
(163, 130, '5fb37c67beb4d.jpg', '2020-11-17 01:31:51', '2020-11-17 01:31:51'),
(164, 131, '5fb37cf8afe92.jpg', '2020-11-17 01:34:16', '2020-11-17 01:34:16'),
(165, 132, '5fb37dd2b37d7.jpg', '2020-11-17 01:37:54', '2020-11-17 01:37:54'),
(166, 133, '5fb37e416d7d2.jpg', '2020-11-17 01:39:45', '2020-11-17 01:39:45'),
(167, 134, '5fb37f39923e9.jpg', '2020-11-17 01:43:53', '2020-11-17 01:43:53'),
(168, 135, '5fb38a1f39bc7.jpg', '2020-11-17 02:30:23', '2020-11-17 02:30:23'),
(169, 136, '5fb38afc90230.jpg', '2020-11-17 02:34:04', '2020-11-17 02:34:04'),
(170, 137, '5fb38b903d604.jpg', '2020-11-17 02:36:32', '2020-11-17 02:36:32'),
(171, 138, '5fb38c0e3a5b2.jpg', '2020-11-17 02:38:38', '2020-11-17 02:38:38'),
(172, 139, '5fb38c8cea675.jpg', '2020-11-17 02:40:44', '2020-11-17 02:40:44');

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
(9, 'mobile', '1605510428.jpg', '2020-11-16 01:07:08', '2020-11-16 01:07:08'),
(10, 'Galaxy', '1605511781.jpg', '2020-11-16 01:29:41', '2020-11-16 01:29:41'),
(11, 'Samsung', '1605511794.jpg', '2020-11-16 01:29:54', '2020-11-16 01:29:54');

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
(4, 'joshuamcgall@hotmail.co.uk', '2020-11-11 06:21:51', '2020-11-11 06:21:51'),
(5, 'stephaniehunihan@gmail.com', '2020-11-15 02:39:46', '2020-11-15 02:39:46'),
(6, 'interac226@protonmail.com', '2020-11-15 05:47:16', '2020-11-15 05:47:16');

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
(8, 'admin', 'admin@gmail.com', '01533592610', '1605070571.jpg', 'admin', '$2y$10$0kF5qiJzF3wzChDR7I2uqOXobkEgnNEsHxbbW.YSxsM/QGbZf76O6', NULL, '2020-11-10 22:49:48', '2020-11-17 04:57:19'),
(9, 'Golam Rabby', 'golamrabbidiu@gmail.com', '01533592618', '1605079371.jpg', 'admin', '$2y$10$lH7yCpUn.WpWdmtHoT6g2OyQm7zoJeQRQj5yi.Czkp1pBGXZNflOS', 'VkhZNWlBWFQ2Ym5BTDVPWU5uaVN1cXhxT0tCSTFwaDQ4Q3o3YUVSdVRBQ1hYZkZ5bU5rR0lNTlJmY3NG5fb4a13488d28', '2020-11-10 22:56:55', '2020-11-17 22:21:08'),
(10, 'Mamun x', 'mamun.swe.277@gmail.com', '01533592619', '1605077060.jpg', 'user', '$2y$10$gZ4yMo5WEpnG0N3NV1FeSefIBIJKVAQyJlvILlrFfhAU.NqrRpF3q', 'U1dPWW01dURRcDA4aEJ1VmpnTFIxUVAweHEwMDBNendma1o1aWxsY1daRW1yb05Pb2FSYkZnR0s0TE1Q5faedf3921ffc', '2020-11-10 23:57:08', '2020-11-13 13:32:09'),
(11, 'test userX', '12@gmail.com', '012589745125', NULL, 'user', '$2y$10$OJcgf5KMkPPNZdmek18j/.QRcp8JFGRDQF1WJnKZRBoSdfB/N7ZQS', NULL, '2020-11-11 03:15:13', '2020-11-16 03:23:45'),
(13, 'Jebin Jaman', 'jabinnessa2@gmail.com', '01941071044', '1605510942.jpg', 'admin', '$2y$10$NVzUs9cEKJm8GpCO.ZCo1uCF.CxHm5vAB0wxZUB/O1YeCDi0Jjcpa', NULL, '2020-11-16 01:15:42', '2020-11-17 02:48:59'),
(14, 'Shahina Easmin Pia', 'shahinaeasminpia860703@gmail.com', '01744860703', '1605511134.jpg', 'admin', '$2y$10$0/oXFfYwnhggbucQCmlJZeeY1dOLJbVZlGX7jnolRo4yqYUiZ9CmS', NULL, '2020-11-16 01:18:54', '2020-11-16 01:18:54');

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=140;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=173;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
