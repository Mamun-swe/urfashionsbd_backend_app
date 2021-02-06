-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 06, 2021 at 05:03 PM
-- Server version: 10.3.27-MariaDB
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
(6, NULL, 'Man', '1611851212.jpg', '2020-11-10 07:01:20', '2021-01-28 10:26:52'),
(7, 6, 'Shirt', '1609584585.jpg', '2020-11-10 07:07:29', '2021-01-02 18:49:45'),
(9, NULL, 'Women', '1611488147.jpg', '2020-11-10 07:08:26', '2021-01-24 19:35:47'),
(10, 9, 'Sharee', '1605013724.jpg', '2020-11-10 07:08:44', '2020-11-10 07:08:44'),
(11, 6, 'T-shirt', '1609584771.jpg', '2020-11-11 02:02:13', '2021-01-02 18:52:51'),
(14, 6, 'sweater', '1605513300.jpg', '2020-11-16 01:55:00', '2020-11-16 01:55:00'),
(16, 9, 'Sweaters and Cardigans', '1609582754.jpg', '2021-01-02 17:52:41', '2021-01-02 18:19:14'),
(17, 6, 'Jeans Pant', '1609581293.jpg', '2021-01-02 17:54:53', '2021-01-02 17:54:53'),
(18, 6, 'Twill Gabardine Pant', '1609581335.jpg', '2021-01-02 17:55:35', '2021-01-02 17:55:35'),
(19, 6, 'Joggers and Cargo Pant', '1609582395.jpg', '2021-01-02 18:13:15', '2021-01-02 18:13:15'),
(20, 9, 'Kurtis and Tops', '1609583741.jpeg', '2021-01-02 18:30:38', '2021-01-02 18:35:41'),
(21, 9, 'Unstitched Fabric', '1609583480.jpeg', '2021-01-02 18:31:20', '2021-01-02 18:31:20'),
(22, 9, 'Borka and Islamic Cloth', '1609583611.jpg', '2021-01-02 18:33:31', '2021-01-02 18:33:31');

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
(41, 28, 29, 1, 'L', 'Multiple Colours', 690, '2020-11-16 03:27:27', '2020-11-16 03:27:27'),
(42, 29, 6, 1, 'XS', '#642a3c', 1000, '2020-11-21 01:33:04', '2020-11-21 01:33:04'),
(43, 29, 14, 1, '2', '#33D4FF', 600, '2020-11-21 01:33:04', '2020-11-21 01:33:04'),
(44, 30, 110, 1, 'M', 'Multi-Colour', 1000, '2020-11-22 00:12:29', '2020-11-22 00:12:29'),
(45, 30, 13, 1, 'X', '#33D4FF', 1200, '2020-11-22 00:12:29', '2020-11-22 00:12:29'),
(46, 31, 28, 1, 'M', 'Multiple Colours', 690, '2020-11-22 04:09:58', '2020-11-22 04:09:58'),
(47, 32, 28, 1, 'M', 'Multiple Colours', 690, '2020-11-22 04:10:10', '2020-11-22 04:10:10'),
(48, 33, 28, 1, 'M', 'Multiple Colours', 690, '2020-11-22 04:10:48', '2020-11-22 04:10:48'),
(49, 34, 28, 1, 'M', 'Multiple Colours', 690, '2020-11-22 04:10:53', '2020-11-22 04:10:53'),
(51, 35, 134, 2, 'XL', '#ffefaa', 1100, '2020-11-22 04:23:20', '2020-11-22 04:23:20'),
(52, 36, 136, 1, 'M', '#c7dbf6', 1100, '2020-11-22 04:26:59', '2020-11-22 04:26:59'),
(53, 37, 136, 1, 'M', '#c7dbf6', 1100, '2020-11-22 04:27:15', '2020-11-22 04:27:15'),
(54, 38, 136, 1, 'M', '#c7dbf6', 1100, '2020-11-22 04:30:05', '2020-11-22 04:30:05'),
(55, 39, 136, 1, 'M', '#c7dbf6', 1100, '2020-11-22 04:31:27', '2020-11-22 04:31:27'),
(56, 40, 136, 1, 'M', '#c7dbf6', 1100, '2020-11-22 04:33:51', '2020-11-22 04:33:51'),
(57, 41, 136, 1, 'M', '#c7dbf6', 1100, '2020-11-22 04:35:07', '2020-11-22 04:35:07'),
(58, 42, 136, 1, 'M', '#c7dbf6', 1100, '2020-11-22 04:35:53', '2020-11-22 04:35:53'),
(59, 43, 26, 1, 'M', 'Multiple Colours', 690, '2020-11-22 04:37:14', '2020-11-22 04:37:14'),
(60, 43, 34, 2, 'M', '#20203a', 690, '2020-11-22 04:37:14', '2020-11-22 04:37:14'),
(61, 44, 136, 1, 'M', '#c7dbf6', 1100, '2020-11-22 04:38:30', '2020-11-22 04:38:30'),
(62, 45, 136, 1, 'M', '#c7dbf6', 1100, '2020-11-22 04:43:00', '2020-11-22 04:43:00'),
(63, 46, 97, 1, 'XS', '#ecd9af', 1000, '2020-11-22 05:47:14', '2020-11-22 05:47:14'),
(64, 47, 17, 1, 'XXL', '#33D4FF', 1200, '2020-11-22 05:59:06', '2020-11-26 00:32:19'),
(65, 48, 59, 1, 'M', '#2b346f', 1000, '2020-11-22 06:02:59', '2020-11-22 06:02:59'),
(66, 49, 135, 1, 'M', '#2b2275', 1100, '2020-11-22 23:21:19', '2020-11-22 23:21:19'),
(67, 50, 60, 1, 'XS', '#242f7e', 1200, '2020-11-25 05:39:04', '2020-11-25 05:39:04'),
(68, 50, 23, 1, '200', '#c9b8ae', 1000, '2020-11-25 05:39:04', '2020-11-25 05:39:04'),
(71, 50, 129, 1, 'M', '#83dae3', 1100, '2020-11-26 00:37:53', '2020-11-26 00:37:53'),
(72, 51, 107, 1, '200', 'Multi-Colour', 1000, '2020-11-26 01:20:13', '2020-11-26 01:20:13'),
(73, 52, 139, 1, 'XS', '#621058', 1100, '2020-11-26 01:47:32', '2020-11-26 01:47:32'),
(74, 52, 138, 1, 'M', '#c8dcf4', 1100, '2020-11-26 01:47:32', '2020-11-26 01:47:32'),
(75, 53, 139, 5, 'XL', '#621058', 1100, '2020-11-26 05:30:59', '2020-11-26 05:30:59'),
(76, 54, 62, 2, 'XS', '#2b2a2f', 1200, '2020-11-26 05:52:16', '2020-11-26 05:52:16'),
(77, 54, 134, 2, 'M', '#ffefaa', 1100, '2020-11-26 05:52:17', '2020-11-26 05:52:17'),
(78, 54, 130, 2, 'M', '#e3e7f2', 1100, '2020-11-26 05:52:17', '2020-11-26 05:52:17'),
(79, 55, 138, 1, 'M', '#c8dcf4', 1100, '2020-11-26 05:56:27', '2020-11-26 05:56:27'),
(80, 56, 33, 1, 'XL', '#750e23', 690, '2020-11-27 02:17:58', '2020-11-27 02:17:58'),
(81, 56, 139, 1, 'M', '#621058', 1100, '2020-11-27 02:21:24', '2020-11-27 02:21:24'),
(82, 57, 35, 1, 'M', 'Multiple Colours', 690, '2020-11-27 02:40:50', '2020-11-27 02:40:50'),
(83, 58, 136, 1, 'M', '#c7dbf6', 1100, '2020-11-27 02:43:33', '2020-11-27 02:43:33'),
(84, 59, 138, 1, 'M', '#c8dcf4', 1100, '2020-11-27 02:54:10', '2020-11-27 02:54:10'),
(85, 60, 137, 1, 'M', '#dbb7f2', 1100, '2020-11-27 06:40:54', '2020-11-27 06:40:54'),
(86, 61, 138, 1, 'M', '#c8dcf4', 1100, '2020-11-27 06:41:38', '2020-11-27 06:41:38'),
(87, 62, 57, 1, 'XS', '#2c2c52', 1200, '2020-11-27 08:09:06', '2020-11-27 08:09:06'),
(88, 63, 138, 1, 'M', '#c8dcf4', 1100, '2020-11-28 00:44:21', '2020-11-28 00:44:21'),
(89, 63, 133, 1, 'M', '#640d1e', 1100, '2020-11-28 00:44:21', '2020-11-28 00:44:21'),
(90, 64, 139, 1, 'M', '#621058', 1100, '2020-11-28 01:45:44', '2020-11-28 01:45:44'),
(91, 65, 21, 4, '200', '#b8c5ef', 1000, '2020-11-30 07:47:55', '2020-11-30 07:47:55'),
(92, 65, 139, 1, 'M', '#621058', 1100, '2020-11-30 07:47:55', '2020-11-30 07:47:55'),
(93, 66, 135, 1, '200', '#2b2275', 1100, '2020-11-30 13:58:12', '2020-11-30 13:58:12'),
(94, 67, 76, 1, 'XXL', '#c0d0ea', 1000, '2020-12-07 04:02:07', '2020-12-07 04:02:07'),
(95, 68, 161, 1, 'M', '#0e0e0e', 750, '2020-12-11 09:42:41', '2020-12-11 09:42:41'),
(96, 68, 155, 1, 'L', 'Multiple Colors', 750, '2020-12-11 09:42:41', '2020-12-11 09:42:41'),
(97, 68, 88, 1, 'L', '#293f6e', 1000, '2020-12-11 09:42:41', '2020-12-11 09:42:41'),
(98, 69, 142, 1, 'L', '#131315', 690, '2020-12-14 12:14:35', '2020-12-14 12:14:35'),
(99, 70, 169, 1, 'M', '#df760d', 650, '2020-12-16 11:54:03', '2020-12-16 11:54:03'),
(100, 70, 170, 1, 'M', '#ded9d5', 700, '2020-12-16 11:54:03', '2020-12-16 11:54:03'),
(101, 71, 48, 1, 'L', '#3f1844', 1000, '2020-12-18 22:47:45', '2020-12-18 22:47:45'),
(102, 72, 48, 1, 'L', '#3f1844', 1000, '2020-12-18 22:48:09', '2020-12-18 22:48:09'),
(103, 73, 85, 1, 'XS', '#0c1127', 1000, '2020-12-20 02:05:51', '2020-12-20 02:05:51'),
(104, 74, 149, 1, 'M', '#306342', 650, '2020-12-21 02:37:37', '2020-12-21 02:37:37'),
(105, 75, 169, 1, 'M', '#df760d', 650, '2020-12-21 02:48:35', '2020-12-21 02:48:35'),
(106, 75, 105, 1, 'XS', '#1b2141', 1000, '2020-12-21 02:48:35', '2020-12-21 02:48:35'),
(107, 76, 149, 1, 'M', '#306342', 650, '2020-12-21 02:56:19', '2020-12-21 02:56:19'),
(108, 76, 171, 1, 'M', '#d29f72', 700, '2020-12-21 02:56:19', '2020-12-21 02:56:19'),
(109, 77, 171, 1, 'M', '#d29f72', 700, '2020-12-21 09:12:31', '2020-12-21 09:12:31'),
(110, 78, 105, 1, 'XS', '#1b2141', 1000, '2020-12-21 09:45:32', '2020-12-21 09:45:32'),
(111, 79, 155, 2, 'M', 'Multiple Colors', 750, '2020-12-21 09:47:59', '2021-01-04 18:02:46'),
(112, 80, 161, 1, 'M', '#0e0e0e', 750, '2020-12-27 01:09:49', '2020-12-27 01:09:49'),
(113, 81, 161, 1, 'M', '#0e0e0e', 750, '2020-12-27 01:10:28', '2020-12-27 01:10:28'),
(114, 82, 157, 1, 'M', 'Multiple Colors', 650, '2021-01-03 19:03:17', '2021-01-03 19:03:17'),
(115, 82, 116, 1, 'M', 'Multiple Colours', 600, '2021-01-03 19:03:17', '2021-01-03 19:03:17'),
(116, 82, 96, 1, '200', '#8fbbf8', 700, '2021-01-03 19:03:17', '2021-01-03 19:03:17'),
(117, 83, 161, 1, 'XL', '#0e0e0e', 750, '2021-01-04 02:11:48', '2021-01-04 02:11:48'),
(118, 84, 178, 1, 'XL', 'Pink', 690, '2021-01-04 12:50:56', '2021-01-04 12:50:56'),
(119, 85, 145, 1, 'M', 'Multiple Colors', 600, '2021-01-04 14:59:06', '2021-01-04 14:59:06'),
(120, 78, 162, 1, 'M', '#fbbc1f', 590, '2021-01-04 18:04:38', '2021-01-04 18:04:38'),
(121, 86, 171, 1, 'XL', '#d29f72', 650, '2021-01-04 18:48:54', '2021-01-04 18:48:54'),
(122, 87, 165, 1, 'XL', '#11143d', 495, '2021-01-04 18:52:53', '2021-01-04 18:52:53'),
(123, 88, 178, 1, 'L', 'Pink', 690, '2021-01-04 22:28:00', '2021-01-04 22:28:00'),
(124, 89, 159, 1, 'XL', '#5b121b', 500, '2021-01-05 19:03:03', '2021-01-05 19:03:03'),
(125, 90, 116, 1, 'M', 'Multiple Colours', 600, '2021-01-06 11:52:46', '2021-01-06 11:52:46'),
(126, 91, 165, 1, 'M', '#ccd7dd', 495, '2021-01-06 12:16:42', '2021-01-06 12:16:42'),
(127, 92, 101, 1, 'XL', '#2f456c', 490, '2021-01-06 22:56:08', '2021-01-06 22:56:08'),
(128, 93, 159, 1, 'L', '#5b121b', 500, '2021-01-06 23:23:13', '2021-01-06 23:23:13'),
(129, 94, 159, 1, 'XL', '#5b121b', 500, '2021-01-07 06:00:52', '2021-01-07 06:00:52'),
(130, 95, 159, 1, 'L', '#5b121b', 500, '2021-01-08 02:48:24', '2021-01-08 02:48:24'),
(131, 96, 164, 2, 'M', 'Multiple Colors', 590, '2021-01-08 03:50:57', '2021-01-08 03:50:57'),
(132, 97, 159, 1, 'L', '#5b121b', 500, '2021-01-08 04:30:14', '2021-01-08 04:30:14'),
(133, 98, 101, 1, 'XL', 'Multiple Colors', 490, '2021-01-08 15:39:31', '2021-01-08 15:39:31'),
(134, 98, 155, 1, 'XL', 'Multiple Colors', 490, '2021-01-08 15:39:31', '2021-01-08 15:39:31'),
(135, 98, 96, 1, '200', '#8fbbf8', 700, '2021-01-08 15:39:31', '2021-01-08 15:39:31'),
(136, 99, 159, 1, 'M', '#5b121b', 500, '2021-01-08 17:40:38', '2021-01-08 17:40:38'),
(137, 100, 88, 1, 'M', '#293f6e', 550, '2021-01-08 18:20:24', '2021-01-08 18:20:24'),
(138, 101, 159, 1, 'L', '#5b121b', 500, '2021-01-08 20:09:12', '2021-01-08 20:09:12'),
(139, 102, 165, 1, 'M', '#11143d', 495, '2021-01-08 23:23:29', '2021-01-08 23:23:29'),
(140, 103, 116, 1, 'L', 'Multiple Colours', 600, '2021-01-08 23:56:39', '2021-01-08 23:56:39'),
(141, 104, 159, 5, 'M', '#5b121b', 500, '2021-01-09 03:01:49', '2021-01-09 03:01:49'),
(142, 105, 159, 1, 'XL', '#5b121b', 500, '2021-01-09 06:27:40', '2021-01-09 06:27:40'),
(143, 106, 171, 1, 'L', '#d29f72', 650, '2021-01-09 08:06:36', '2021-01-09 08:06:36'),
(144, 106, 90, 1, 'L', '#2f2530', 650, '2021-01-09 08:06:36', '2021-01-09 08:06:36'),
(145, 107, 159, 1, 'XL', '#5b121b', 500, '2021-01-09 12:26:42', '2021-01-09 12:26:42'),
(146, 108, 159, 1, 'XL', '#5b121b', 500, '2021-01-09 12:48:28', '2021-01-09 12:48:28'),
(147, 109, 159, 1, 'XL', '#5b121b', 500, '2021-01-09 13:11:46', '2021-01-09 13:11:46'),
(148, 110, 88, 1, 'L', '#293f6e', 550, '2021-01-09 17:11:29', '2021-01-09 17:11:29'),
(149, 111, 165, 1, 'L', '#ccd7dd', 495, '2021-01-09 19:04:20', '2021-01-09 19:04:20'),
(150, 112, 90, 1, 'L', '#2f2530', 650, '2021-01-09 19:47:44', '2021-01-09 19:47:44'),
(151, 113, 159, 1, 'XL', '#5b121b', 500, '2021-01-09 20:19:21', '2021-01-09 20:19:21'),
(152, 114, 88, 1, 'L', '#293f6e', 550, '2021-01-12 13:01:46', '2021-01-12 13:01:46'),
(153, 115, 157, 1, 'M', 'Multiple Colors', 650, '2021-01-12 13:02:06', '2021-01-12 13:02:06'),
(154, 115, 178, 1, 'L', 'Pink', 690, '2021-01-12 13:02:06', '2021-01-12 13:02:06'),
(155, 116, 151, 1, 'XL', '#6d1422', 590, '2021-01-12 13:41:08', '2021-01-12 13:41:08'),
(156, 117, 116, 1, 'M', 'Multiple Colours', 600, '2021-01-12 14:01:21', '2021-01-12 14:01:21'),
(157, 118, 64, 1, 'XL', '#6bbe96', 1000, '2021-01-12 17:01:48', '2021-01-12 17:01:48'),
(158, 119, 64, 1, 'XL', '#6bbe96', 1000, '2021-01-12 18:56:11', '2021-01-12 18:56:11'),
(159, 119, 52, 1, 'XL', '#42843a', 1000, '2021-01-12 18:56:11', '2021-01-12 18:56:11'),
(160, 120, 149, 1, 'M', '#306342', 550, '2021-01-12 19:16:19', '2021-01-12 19:16:19'),
(161, 121, 155, 1, 'XL', 'Multiple Colors', 490, '2021-01-12 22:33:20', '2021-01-12 22:33:20'),
(162, 122, 159, 1, 'L', '#5b121b', 500, '2021-01-12 23:36:47', '2021-01-12 23:36:47'),
(163, 123, 149, 1, 'M', '#306342', 550, '2021-01-12 23:46:32', '2021-01-12 23:46:32'),
(164, 124, 159, 1, 'M', '#5b121b', 500, '2021-01-13 19:45:36', '2021-01-13 19:45:36'),
(165, 125, 169, 2, 'L', '#df760d', 495, '2021-01-13 20:24:45', '2021-01-13 20:24:45'),
(166, 125, 169, 1, 'M', '#df760d', 495, '2021-01-13 20:24:45', '2021-01-13 20:24:45'),
(167, 126, 162, 1, 'M', '#fbbc1f', 590, '2021-01-14 04:40:19', '2021-01-14 04:40:19'),
(168, 127, 157, 1, 'XL', 'Multiple Colors', 650, '2021-01-14 12:21:38', '2021-01-14 12:21:38'),
(169, 128, 88, 1, 'M', '#293f6e', 550, '2021-01-14 13:28:37', '2021-01-14 13:28:37'),
(170, 129, 165, 1, 'M', '#ccd7dd', 495, '2021-01-14 17:01:19', '2021-01-14 17:01:19'),
(171, 130, 132, 1, 'M', '#26254d', 1100, '2021-01-15 14:49:26', '2021-01-15 14:49:26'),
(172, 131, 154, 1, 'M', 'Multiple Colors', 650, '2021-01-15 16:13:26', '2021-01-15 16:13:26'),
(173, 132, 151, 1, 'M', '#6d1422', 590, '2021-01-15 18:38:42', '2021-01-15 18:38:42'),
(174, 133, 159, 1, 'M', '#5b121b', 500, '2021-01-16 15:53:23', '2021-01-16 15:53:23'),
(175, 134, 71, 1, '200', '#8ea7ea', 1000, '2021-01-16 19:08:01', '2021-01-16 19:08:01'),
(176, 135, 162, 2, 'M', '#fbbc1f', 590, '2021-01-16 20:28:28', '2021-01-16 20:28:28'),
(177, 136, 101, 1, 'M', '#2f456c', 490, '2021-01-16 21:07:30', '2021-01-16 21:07:30'),
(178, 137, 150, 1, 'XL', '#0d0d0f', 590, '2021-01-16 23:19:56', '2021-01-16 23:19:56'),
(179, 138, 101, 1, 'M', '#2f456c', 490, '2021-01-17 04:24:15', '2021-01-17 04:24:15'),
(180, 139, 163, 1, 'M', '#0f0d10', 590, '2021-01-17 15:14:35', '2021-01-17 15:14:35'),
(181, 140, 144, 1, 'M', 'Multiple Colors', 445, '2021-01-17 15:45:45', '2021-01-17 15:45:45'),
(182, 140, 142, 1, 'M', '#131315', 590, '2021-01-17 15:45:45', '2021-01-17 15:45:45'),
(183, 141, 165, 1, 'M', '#ccd7dd', 495, '2021-01-17 21:23:54', '2021-01-17 21:23:54'),
(184, 142, 96, 1, '200', '#8fbbf8', 700, '2021-01-17 21:39:15', '2021-01-17 21:39:15'),
(185, 143, 159, 1, 'M', '#5b121b', 500, '2021-01-18 22:02:51', '2021-01-18 22:02:51'),
(186, 144, 171, 1, 'M', '#d29f72', 650, '2021-01-20 16:41:22', '2021-01-20 16:41:22'),
(187, 145, 162, 1, 'XL', '#fbbc1f', 590, '2021-01-20 18:10:00', '2021-01-20 18:10:00'),
(188, 146, 90, 1, 'XL', '#2f2530', 650, '2021-01-20 19:58:15', '2021-01-20 19:58:15'),
(189, 147, 142, 1, 'M', '#131315', 590, '2021-01-20 20:16:08', '2021-01-20 20:16:08'),
(190, 148, 165, 1, 'M', '#ccd7dd', 495, '2021-01-21 18:38:16', '2021-01-21 18:38:16'),
(191, 149, 162, 1, 'M', '#fbbc1f', 590, '2021-01-21 18:41:26', '2021-01-21 18:41:26'),
(192, 150, 159, 1, 'M', '#5b121b', 500, '2021-01-21 23:00:47', '2021-01-21 23:00:47'),
(193, 151, 159, 1, 'XL', '#5b121b', 500, '2021-01-21 23:04:17', '2021-01-21 23:04:17'),
(194, 152, 164, 1, 'M', 'Multiple Colors', 590, '2021-01-23 22:25:23', '2021-01-23 22:25:23'),
(195, 153, 101, 1, 'XL', '#2f456c', 490, '2021-01-24 23:51:19', '2021-01-24 23:51:19'),
(196, 154, 163, 2, 'L', '#0f0d10', 590, '2021-01-25 02:21:30', '2021-01-25 02:21:30'),
(197, 154, 150, 1, 'M', '#0d0d0f', 590, '2021-01-25 02:21:30', '2021-01-25 02:21:30'),
(198, 155, 157, 1, 'M', 'Multiple Colors', 650, '2021-01-27 02:01:36', '2021-01-27 02:01:36'),
(199, 156, 100, 2, 'XXL', '#121117', 1000, '2021-01-29 07:29:27', '2021-01-29 07:29:27'),
(200, 157, 85, 1, 'XXL', '#0c1127', 1000, '2021-01-29 10:53:50', '2021-01-29 10:53:50'),
(201, 158, 37, 1, '200', '#eeeef6', 1000, '2021-01-29 12:24:08', '2021-01-29 12:24:08'),
(202, 158, 21, 1, '200', '#eeeef6', 1000, '2021-01-29 12:24:08', '2021-01-29 12:24:08'),
(203, 158, 21, 1, '200', '#b8c5ef', 1000, '2021-01-29 12:24:08', '2021-01-29 12:24:08'),
(204, 159, 24, 1, 'M', '#0d0d0f', 1000, '2021-01-29 13:02:13', '2021-01-29 13:02:13'),
(205, 160, 24, 1, 'L', '#0d0d0f', 1000, '2021-01-29 13:06:00', '2021-01-29 13:06:00'),
(206, 161, 171, 1, 'L', '#d29f72', 650, '2021-01-29 13:19:52', '2021-01-29 13:19:52'),
(207, 162, 162, 1, 'M', '#fbbc1f', 590, '2021-01-29 20:06:20', '2021-01-29 20:06:20'),
(208, 163, 88, 1, 'M', '#293f6e', 550, '2021-01-30 12:35:06', '2021-01-30 12:35:06'),
(209, 164, 116, 2, 'L', 'Multiple Colours', 600, '2021-01-30 22:44:06', '2021-01-30 22:44:06'),
(210, 165, 159, 1, 'M', '#5b121b', 500, '2021-01-31 01:58:19', '2021-01-31 01:58:19'),
(211, 166, 80, 1, 'L', '#060701', 700, '2021-01-31 12:09:02', '2021-01-31 12:09:02'),
(212, 167, 159, 1, 'M', '#5b121b', 500, '2021-02-01 01:15:17', '2021-02-01 01:15:17'),
(213, 168, 96, 1, '200', '#8fbbf8', 700, '2021-02-01 12:18:34', '2021-02-01 12:18:34'),
(214, 169, 101, 1, 'M', '#2f456c', 490, '2021-02-02 01:36:48', '2021-02-02 01:36:48'),
(215, 170, 118, 1, 'M', '#e98485', 1100, '2021-02-03 22:54:05', '2021-02-03 22:54:05'),
(216, 171, 168, 1, 'M', '#8bc070', 495, '2021-02-04 11:35:54', '2021-02-04 11:35:54'),
(217, 171, 101, 1, 'M', '#2f456c', 490, '2021-02-04 11:35:54', '2021-02-04 11:35:54'),
(218, 171, 177, 7, 's', 'Red', 690, '2021-02-04 11:35:54', '2021-02-04 11:35:54'),
(219, 172, 88, 1, 'M', '#293f6e', 550, '2021-02-04 12:52:32', '2021-02-04 12:52:32');

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
  `partial_payment` double DEFAULT NULL,
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

INSERT INTO `orders` (`id`, `order_code`, `user_id`, `name`, `phone`, `email`, `total_price`, `partial_payment`, `courier_name`, `district`, `delivery_address`, `delivery_charge`, `shipping_area`, `delivery_method`, `coupon_code`, `discount`, `status`, `created_at`, `updated_at`) VALUES
(28, 'UR5198', NULL, 'Md. Golam Rabbi', '01762337526', 'golamrabbi5242@gmail.com', 690, NULL, 'sundarban_courier', 'Dhaka', 'Mirpur 10, Dhaka', 80, 'Inside Dhaka', 'Cash on delivery', NULL, NULL, 'cancelled', '2020-11-16 03:27:25', '2021-01-02 23:36:40'),
(29, 'UR9649', 10, 'Mamun x', '01533592619', 'mamun.swe.277@gmail.com', 1600, NULL, 'sundarban_courier', 'Nature', 'cvbcvbcvb', 80, 'Inside Dhaka', 'Cash on delivery', NULL, NULL, 'cancelled', '2020-11-21 01:33:04', '2021-01-02 23:35:40'),
(30, 'UR2921', NULL, 'Md. Golam Rabbi', '01762337526', 'golamrabbi5242@gmail.com', 2200, NULL, 'dhaka_home_delivery', 'Dhaka', 'Mirpur 10, Dhaka', 80, 'Inside Dhaka', 'Cash on delivery', NULL, NULL, 'cancelled', '2020-11-22 00:12:29', '2021-01-02 23:35:44'),
(31, 'UR158', 16, 'Shahin Test', '01925618270', 'rock.star.shahin@gmail.com', 690, NULL, 'sundarban_courier', 'kst', 'kumarkhali', 80, 'Inside Dhaka', 'Cash on delivery', NULL, NULL, 'cancelled', '2020-11-22 04:09:56', '2021-01-02 23:35:49'),
(32, 'UR8014', 16, 'Shahin Test', '01925618270', 'rock.star.shahin@gmail.com', 690, NULL, 'sundarban_courier', 'kst', 'kumarkhali', 80, 'Inside Dhaka', 'Cash on delivery', NULL, NULL, 'cancelled', '2020-11-22 04:10:07', '2021-01-02 23:36:07'),
(33, 'UR9257', 16, 'Md Shahinur Islam', '01925618270', 'rock.star.shahin@gmail.com', 690, NULL, 'sundarban_courier', 'kst', 'Mirpur11', 80, 'Inside Dhaka', 'Cash on delivery', NULL, NULL, 'cancelled', '2020-11-22 04:10:48', '2020-11-29 00:37:27'),
(34, 'UR3306', 16, 'Md Shahinur Islam', '01925618270', 'rock.star.shahin@gmail.com', 690, NULL, 'sundarban_courier', 'kst', 'Mirpur11', 100, 'Outside Dhaka', 'Cash on delivery', NULL, NULL, 'cancelled', '2020-11-22 04:10:53', '2020-11-29 00:37:34'),
(35, 'UR2403', NULL, 'Shahinwwww', '01798582610123', 'jobayerx079@gmail.commmm', 1100, 90, 'kartua_courier', 'ksterErwwwww', 'Dewangongwqa', 100, 'Outside Dhaka', 'Cash on delivery', 'abc1234', 50, 'cancelled', '2020-11-22 04:12:16', '2020-11-29 00:37:42'),
(36, 'UR3430', NULL, 'Md. Golam Rabbi', '01762337526', 'golamrabbi5242@gmail.com', 2300, NULL, 'dhaka_home_delivery', 'Dhaka', 'Mirpur 10, Dhaka', 60, 'Inside Dhaka', 'Cash on delivery', NULL, NULL, 'cancelled', '2020-11-22 04:26:59', '2020-11-29 00:37:47'),
(37, 'UR8481', NULL, 'Md. Golam Rabbi', '01762337526', 'golamrabbi5242@gmail.com', 2300, NULL, 'dhaka_home_delivery', 'Dhaka', 'Mirpur 10, Dhaka', 60, 'Inside Dhaka', 'Cash on delivery', NULL, NULL, 'cancelled', '2020-11-22 04:27:15', '2020-11-29 00:37:53'),
(38, 'UR8849', NULL, 'Md. Golam Rabbi', '01762337526', 'golamrabbi5242@gmail.com', 2300, NULL, 'dhaka_home_delivery', 'Dhaka', 'Mirpur 10, Dhaka', 60, 'Inside Dhaka', 'Cash on delivery', NULL, NULL, 'cancelled', '2020-11-22 04:30:04', '2020-11-29 00:37:59'),
(39, 'UR145', NULL, 'Md. Golam Rabbi', '01762337526', 'golamrabbi5242@gmail.com', 2300, NULL, 'dhaka_home_delivery', 'Dhaka', 'Mirpur 10, Dhaka', 60, 'Inside Dhaka', 'Cash on delivery', NULL, NULL, 'cancelled', '2020-11-22 04:31:27', '2020-11-29 00:38:03'),
(40, 'UR8200', NULL, 'Md. Golam Rabbi', '01762337526', 'golamrabbi5242@gmail.com', 2300, NULL, 'dhaka_home_delivery', 'Dhaka', 'Mirpur 10, Dhaka', 60, 'Inside Dhaka', 'Cash on delivery', NULL, NULL, 'cancelled', '2020-11-22 04:33:51', '2020-11-29 00:38:07'),
(41, 'UR3527', NULL, 'Md. Golam Rabbi', '01762337526', 'golamrabbi5242@gmail.com', 2300, NULL, 'dhaka_home_delivery', 'Dhaka', 'Mirpur 10, Dhaka', 60, 'Inside Dhaka', 'Cash on delivery', NULL, NULL, 'cancelled', '2020-11-22 04:35:07', '2020-11-29 00:38:11'),
(42, 'UR8234', NULL, 'Md. Golam Rabbi', '01762337526', 'golamrabbi5242@gmail.com', 2300, NULL, 'dhaka_home_delivery', 'Dhaka', 'Mirpur 10, Dhaka', 60, 'Inside Dhaka', 'Cash on delivery', NULL, NULL, 'cancelled', '2020-11-22 04:35:53', '2020-11-29 00:38:16'),
(43, 'UR7908', NULL, 'Md Shahinur Islam', '01798582610', 'jobayerx079@gmail.com', 2190, NULL, 'janani_courier', 'kstqqq', 'Mirpur11', 120, 'Outside Dhaka', 'Cash on delivery', NULL, NULL, 'cancelled', '2020-11-22 04:37:14', '2020-11-29 00:38:21'),
(44, 'UR1603', NULL, 'Md. Golam Rabbi', '01762337526', 'golamrabbi5242@gmail.com', 2300, NULL, 'dhaka_home_delivery', 'Dhaka', 'Mirpur 10, Dhaka', 60, 'Inside Dhaka', 'Cash on delivery', NULL, NULL, 'cancelled', '2020-11-22 04:38:30', '2020-11-29 00:38:27'),
(45, 'UR8638', NULL, 'Md. Golam Rabbi', '01762337526', 'golamrabbi5242@gmail.com', 2300, NULL, 'dhaka_home_delivery', 'natore', 'Mirpur 10, Dhaka', 120, 'Outside Dhaka', 'Cash on delivery', NULL, NULL, 'cancelled', '2020-11-22 04:43:00', '2020-11-29 00:38:34'),
(46, 'UR2664', 10, 'Mamun x', '01533592619', 'mamun.swe.277@gmail.com', 2000, NULL, 'dhaka_home_delivery', 'Nature', 'Dhaka', 60, 'Inside Dhaka', 'Cash on delivery', NULL, NULL, 'cancelled', '2020-11-22 05:47:14', '2020-11-29 00:38:40'),
(47, 'UR6611', NULL, 'Md. Golam Rabbi', '01762337526', 'golamrabbi5242@gmail.com', 600, NULL, 'sundarban_courier', 'Dhaka', 'Mirpur 10, Dhaka', 60, 'Inside Dhaka', 'Cash on delivery', 'abc1234', 50, 'cancelled', '2020-11-22 05:59:06', '2020-11-29 00:38:45'),
(48, 'UR6611', NULL, 'Md. Golam Rabbi', '01762337526', 'golamrabbi5242@gmail.com', 1000, NULL, 'sundarban_courier', 'natore', 'Mirpur 10, Dhaka', 60, 'Inside Dhaka', 'Cash on delivery', NULL, NULL, 'cancelled', '2020-11-22 06:02:59', '2020-11-29 00:38:51'),
(49, 'UR9375', 15, 'golam rabbi 23', '01762337526', 'golamrabbi5242@gmail.com', 1100, NULL, 'dhaka_home_delivery', 'Dhaka', 'Mirpur 10, Dhaka', 60, 'Inside Dhaka', 'Cash on delivery', NULL, NULL, 'cancelled', '2020-11-22 23:21:19', '2020-11-29 00:38:56'),
(50, 'UR1425', 15, 'golam rabbi 23', '01762337526', 'golamrabbi5242@gmail.com', 3300, 110, 'dhaka_home_delivery', 'Dhaka', 'Mirpur 10, Dhaka', 60, 'Inside Dhaka', 'Cash on delivery', NULL, NULL, 'cancelled', '2020-11-25 05:39:04', '2020-11-29 00:39:01'),
(51, 'UR7814', 10, 'Mamun x', '01533592619', 'mamun.swe.277@gmail.com', 1060, NULL, 'sundarban_courier', 'Nature', 'Dhaka', 60, 'Inside Dhaka', 'Cash on delivery', NULL, NULL, 'cancelled', '2020-11-26 01:20:13', '2020-11-29 00:39:04'),
(52, 'UR9562', NULL, 'Shahin Najafi', '01925618270', 'shahin@colourbangla.com', 2260, NULL, 'dhaka_home_delivery', 'Dhaka', 'Mirpur 11, Dhaka', 60, 'Inside Dhaka', 'Cash on delivery', NULL, NULL, 'cancelled', '2020-11-26 01:47:32', '2020-11-26 03:50:33'),
(53, 'UR6855', 15, 'golam rabbi 23', '01762337526', 'golamrabbi5242@gmail.com', 5500, NULL, 'dhaka_home_delivery', 'Dhaka', 'Mirpur 11, Dhaka', 60, 'Inside Dhaka', 'Cash on delivery', NULL, NULL, 'cancelled', '2020-11-26 05:30:59', '2020-11-29 00:39:08'),
(54, 'UR5316', NULL, 'Shahin Test Nov 26', '01925618270', 'rockstar.shahin@gmail.com', 6920, NULL, 'sundarban_courier', 'kst', 'kiop', 120, 'Outside Dhaka', 'Cash on delivery', NULL, NULL, 'cancelled', '2020-11-26 05:52:16', '2020-11-29 00:39:13'),
(55, 'UR1176', 21, 'Shahin Test User', '01925618272', 'rockstarshahi.n@gmail.com', 550, 100, 'dhaka_home_delivery', 'Re', 'qa', 60, 'Inside Dhaka', 'Cash on delivery', 'abc1234', 50, 'cancelled', '2020-11-26 05:56:27', '2020-11-29 00:39:18'),
(56, 'UR7111', NULL, 'Nahid', '01684100451', 'urfashionbd@gmail.com', 1790, 200, 'dhaka_home_delivery', 'Dhaka', '35/A noya polton', 60, 'Inside Dhaka', 'Cash on delivery', NULL, NULL, 'cancelled', '2020-11-27 02:17:57', '2021-01-08 21:49:04'),
(57, 'UR1456', NULL, 'Nahid', '01925618270', 'brbazarbd07@gmail.com', 810, NULL, 'sundarban_courier', 'Dhaka', '35/A noya polton', 120, 'Outside Dhaka', 'Cash on delivery', NULL, NULL, 'cancelled', '2020-11-27 02:40:50', '2021-01-07 21:50:49'),
(58, 'UR3956', NULL, 'Nahid', '01997310000', 'urfashionbd@gmail.com', 1220, NULL, 'sundarban_courier', 'Dhaka', '35/A noya polton', 120, 'Outside Dhaka', 'Cash on delivery', NULL, NULL, 'cancelled', '2020-11-27 02:43:33', '2021-01-07 21:50:53'),
(59, 'UR6883', NULL, 'Nahid', '01730221293', 'brbazarbd07@gmail.com', 1160, NULL, 'sundarban_courier', 'Dhaka', '35/A noya polton', 60, 'Inside Dhaka', 'Cash on delivery', NULL, NULL, 'cancelled', '2020-11-27 02:54:10', '2021-01-07 19:58:28'),
(60, 'UR2004', NULL, 'Md Shahinur Islam', '01925618270', 'jobayerx079@gmail.com', 1220, NULL, 'sundarban_courier', 'kst', 'Mirpur11', 120, 'Outside Dhaka', 'Cash on delivery', NULL, NULL, 'cancelled', '2020-11-27 06:40:54', '2020-11-29 00:39:34'),
(61, 'UR3959', NULL, 'Md Shahinur Islam', '01715654343', NULL, 1160, NULL, 'sundarban_courier', 'ksterErwwwww', 'Mirpur11', 60, 'Inside Dhaka', 'Cash on delivery', NULL, NULL, 'cancelled', '2020-11-27 06:41:38', '2020-11-29 00:39:40'),
(62, 'UR1931', 22, 'শেখ মামুন-উর রশিদ', '01750933359', 'mamunshake95@gmail.com', 1200, NULL, 'sundarban_courier', 'গাইবান্ধা', 'সুন্দরগঞ্জ উপজেলা, গাইবান্ধা।', 120, 'Outside Dhaka', 'Cash on delivery', NULL, NULL, 'cancelled', '2020-11-27 08:09:06', '2021-01-07 21:50:56'),
(63, 'UR6110', 23, 'Shahin Test Nov 28', '01925618270', 'shahin792.9@gmail.com', 2200, NULL, 'sundarban_courier', 'Hytrqa', 'Trasc', 120, 'Outside Dhaka', 'Cash on delivery', NULL, NULL, 'cancelled', '2020-11-28 00:44:21', '2020-11-29 00:39:50'),
(64, 'UR7269', 10, 'Mamun x', '01533592619', 'mamun.swe.277@gmail.com', 1100, NULL, 'sundarban_courier', 'Nature', 'Dhaka', 60, 'Inside Dhaka', 'Cash on delivery', NULL, NULL, 'cancelled', '2020-11-28 01:45:44', '2020-11-29 00:39:57'),
(65, 'UR2926', 24, 'Abdullah Al Mamun', '01407002858', 'mhmamun166009@gmail.com', 5160, NULL, 'sundarban_courier', 'Mymensingh', 'Dhaka', 60, 'Inside Dhaka', 'Cash on delivery', NULL, NULL, 'cancelled', '2020-11-30 07:47:55', '2021-01-07 21:50:59'),
(66, 'UR8425', NULL, 'noman', '01688126772', 'rayankhanshibly2@gmail.com', 1160, NULL, 'dhaka_home_delivery', 'tangail', 'dhaka', 60, 'Inside Dhaka', 'Cash on delivery', NULL, NULL, 'cancelled', '2020-11-30 13:58:11', '2021-01-07 21:51:02'),
(67, 'UR570', 25, 'Md Yeasin Ahmed', '01913539172', 'mdzunaidtwl@gmail.com', 1060, NULL, 'dhaka_home_delivery', 'Dhaka', 'Dhaka Trade Center, 99, kazi nazrul islam avenue, kawran bazar, dhaka', 60, 'Inside Dhaka', 'Cash on delivery', NULL, NULL, 'cancelled', '2020-12-07 04:02:07', '2021-01-07 21:51:05'),
(68, 'UR2898', NULL, 'Zahida Rimi', '01714867457', 'zahidarimi98@gmail.com', 2500, NULL, 's_a_paribahan', 'Chittagong', 'SA Poriboho, Nasirabad branch,Chittagong', 120, 'Outside Dhaka', 'Cash on delivery', NULL, NULL, 'cancelled', '2020-12-11 09:42:41', '2021-01-07 21:51:08'),
(69, 'UR3812', NULL, 'Rifat Ahamed', '01955502572', 'emon.nmt@gmail.com', 750, NULL, 'sundarban_courier', 'Mohammadpur, Dhaka.', '3/11, Solimullah raod, Dhaka', 60, 'Inside Dhaka', 'Cash on delivery', NULL, NULL, 'cancelled', '2020-12-14 12:14:35', '2021-01-07 21:51:11'),
(70, 'UR3702', NULL, 'Dkdkkd', '01711154442', NULL, 1350, NULL, 'dhaka_home_delivery', 'Chandpur', 'Shahrasti', 60, 'Inside Dhaka', 'Cash on delivery', NULL, NULL, 'cancelled', '2020-12-16 11:54:02', '2021-01-07 21:51:14'),
(71, 'UR6156', NULL, 'KAZI KAUSAR UDDIN', '01757994442', 'kazikausar9@gmail.com', 1120, NULL, 'sundarban_courier', 'FARIDPUR', 'FARIDPUR SADOR,', 120, 'Outside Dhaka', 'Cash on delivery', NULL, NULL, 'cancelled', '2020-12-18 22:47:45', '2021-01-07 21:51:17'),
(72, 'UR6069', NULL, 'KAZI KAUSAR UDDIN', '01757994442', 'kazikausar9@gmail.com', 1120, NULL, 'sundarban_courier', 'FARIDPUR', 'FARIDPUR SADOR,', 120, 'Outside Dhaka', 'Cash on delivery', NULL, NULL, 'cancelled', '2020-12-18 22:48:09', '2021-01-07 21:51:20'),
(73, 'UR2997', NULL, 'Nahid', '01684100451', 'brbazarbd87@gmail.com', 1000, NULL, 'dhaka_home_delivery', 'Dhaka', '35/A noya polton', 60, 'Inside Dhaka', 'Cash on delivery', NULL, NULL, 'cancelled', '2020-12-20 02:05:51', '2021-01-07 21:51:23'),
(74, 'UR1689', NULL, 'Shahin Test Order', '01925618270', 'rockstar.shahin@gmail.com', 650, NULL, 'kartua_courier', 'KST', 'Kum', 60, 'Inside Dhaka', 'Cash on delivery', NULL, NULL, 'cancelled', '2020-12-21 02:37:37', '2021-01-13 17:46:44'),
(75, 'UR5475', NULL, 'Md. Golam Rabbi', '01762337526', 'golamrabbi5242@gmail.com', 1770, NULL, 'sundarban_courier', 'Dhaka', 'natore, Rajshahi', 120, 'Outside Dhaka', 'Cash on delivery', NULL, NULL, 'cancelled', '2020-12-21 02:48:35', '2021-01-07 21:50:02'),
(76, 'UR6019', NULL, 'Md. Golam Rabbi', '01762337526', 'golamrabbi5242@gmail.com', 1350, NULL, 'sundarban_courier', 'Dhaka', 'Mirpur 10, Dhaka', 120, 'Outside Dhaka', 'Cash on delivery', NULL, NULL, 'cancelled', '2020-12-21 02:56:19', '2021-01-07 21:49:59'),
(77, 'UR6101', 24, 'Abdullah Al Mamun', '01407002858', 'mhmamun166009@gmail.com', 760, NULL, 'sundarban_courier', 'Mymensingh', 'Dhaka', 60, 'Inside Dhaka', 'Cash on delivery', NULL, NULL, 'cancelled', '2020-12-21 09:12:30', '2021-01-07 21:45:32'),
(78, 'UR6332', 24, 'Abdullah Al Mamun', '01407002858', 'mhmamun166009@gmail.com', 1590, NULL, 'sundarban_courier', 'Mymensingh', 'Dhaka', 60, 'Inside Dhaka', 'Cash on delivery', NULL, NULL, 'cancelled', '2020-12-21 09:45:32', '2021-01-07 20:44:20'),
(79, 'UR1292', 24, 'Abdullah Al Mamun', '01407002858', 'mhmamun166009@gmail.com', 1500, NULL, 'sundarban_courier', 'Mymensingh', 'Dhaka', 60, 'Inside Dhaka', 'Cash on delivery', NULL, NULL, 'cancelled', '2020-12-21 09:47:59', '2021-01-07 20:44:18'),
(80, 'UR2409', NULL, 'Subroto Adhikary', '01913809085', 'mr.subrotoadhikary@gmail.com', 750, NULL, 'sundarban_courier', 'Magura', 'Magura Sadar', 120, 'Outside Dhaka', 'Cash on delivery', NULL, NULL, 'cancelled', '2020-12-27 01:09:49', '2021-01-07 20:44:14'),
(81, 'UR8493', NULL, 'Subroto Adhikary', '01913809085', 'mr.subrotoadhikary@gmail.com', 750, NULL, 'sundarban_courier', 'Magura', 'Magura Sadar', 120, 'Outside Dhaka', 'Cash on delivery', NULL, NULL, 'cancelled', '2020-12-27 01:10:28', '2021-01-07 20:44:12'),
(82, 'UR6411', NULL, 'Md. Rafiul Islam', '01913751998', 'rafiul09@gmail.com', 1950, NULL, 'sundarban_courier', 'Kishoreganj', 'Upazila Agriculture Office, Mithamoin, Kishoreganj', 120, 'Outside Dhaka', 'Cash on delivery', NULL, NULL, 'courier', '2021-01-03 19:03:17', '2021-01-03 22:32:19'),
(83, 'UR1741', NULL, 'Shamim', '01933502379', 'shamimkhan6996@gmail.com', 750, NULL, 'sundarban_courier', 'Netakona', 'Kalmaknda/gutura bazar', 120, 'Outside Dhaka', 'Cash on delivery', NULL, NULL, 'cancelled', '2021-01-04 02:11:48', '2021-01-04 21:35:39'),
(84, 'UR2911', NULL, 'mrs. Lovly Akter', '01747782284', 'davidlohan05@gmail.com', 690, NULL, 'sundarban_courier', 'Dhaka', 'six tala bustand, Jamgora, ashulia, dhaka', 120, 'Outside Dhaka', 'Cash on delivery', NULL, NULL, 'courier', '2021-01-04 12:50:56', '2021-01-04 13:34:00'),
(85, 'UR5186', NULL, 'Sumon', '01718327171', 'Sumonhossin229@gmail.com', 600, NULL, 'sundarban_courier', 'munshiganj', 'nowpara Bajar lohajung', 120, 'Outside Dhaka', 'Cash on delivery', NULL, NULL, 'courier', '2021-01-04 14:59:06', '2021-01-04 15:15:59'),
(86, 'UR6640', NULL, 'Masud', '01317005341', 'noushinnawal666@gmail.com', 650, NULL, 'sundarban_courier', 'Tongi', 'Tongi, College gate, Dattapara Alam market,', 60, 'Inside Dhaka', 'Cash on delivery', NULL, NULL, 'courier', '2021-01-04 18:48:54', '2021-01-04 21:35:07'),
(87, 'UR2881', 33, 'Md. Firoz Al Mamun', '01729070752', 'firoz.mamun@brac.net', 495, NULL, 'sundarban_courier', 'Jashore', 'HRD, BRAC Learning Center, Kholadanga, Dhormotola,Jashore', 120, 'Outside Dhaka', 'Cash on delivery', NULL, NULL, 'courier', '2021-01-04 18:52:53', '2021-01-04 21:31:25'),
(88, 'UR9085', NULL, 'Mousumee Kamal', '01511231131', 'mousumeemou.9009@gmail.com', 690, NULL, 'sundarban_courier', 'Rajshahi', 'Rajshahi city', 120, 'Outside Dhaka', 'Cash on delivery', NULL, NULL, 'courier', '2021-01-04 22:28:00', '2021-01-05 17:18:29'),
(89, 'UR854', NULL, 'Chandra Shakhor', '01782911865', 'c.bhatt52@gmail.com', 500, NULL, 'kartua_courier', 'Bogura', 'B Block, Shajahnpur,Bogura', 120, 'Outside Dhaka', 'Cash on delivery', NULL, NULL, 'completed', '2021-01-05 19:03:03', '2021-01-13 17:46:29'),
(90, 'UR1844', NULL, 'সুরাইয়া আক্তার', '01310162182', 'bithi3213@gmail.com', 600, NULL, 'sundarban_courier', 'গাইবান্ধা', 'খানকাহ শরিফ, গাইবান্ধা', 120, 'Outside Dhaka', 'Cash on delivery', NULL, NULL, 'completed', '2021-01-06 11:52:46', '2021-01-13 17:46:23'),
(91, 'UR7966', NULL, 'মোঃ কাউছার', '01815323270', 'Mdfardin1@gmail.com', 495, NULL, 'sundarban_courier', 'নারায়ণগঞ্জ', 'নারায়ণগঞ্জ', 120, 'Outside Dhaka', 'Cash on delivery', NULL, NULL, 'courier', '2021-01-06 12:16:42', '2021-01-06 12:27:01'),
(92, 'UR9176', NULL, 'Md Amjad Hossain', '01302721417', 'amjadhossain9512@gmail.com', 490, NULL, 'dhaka_home_delivery', 'Dhaka', 'Floor #06 front side,House#208A(Sayed Dental Care yer paser Building),Road#03,Mohammodia Housing Society.', 60, 'Inside Dhaka', 'Cash on delivery', NULL, NULL, 'courier', '2021-01-06 22:56:08', '2021-01-07 01:33:06'),
(93, 'UR6584', NULL, 'Hasnat ahmed', '01572795166', 'Ahmedhasnat736@gmail.com', 500, NULL, 'sundarban_courier', 'Sylhet', 'Fenchuganj palbari', 120, 'Outside Dhaka', 'Cash on delivery', NULL, NULL, 'cancelled', '2021-01-06 23:23:13', '2021-01-07 21:51:37'),
(94, 'UR8535', NULL, 'Jahid Bathen', '01721807170', 'jahid.bathen@yahoo.com', 500, NULL, 'sundarban_courier', 'Dhaka', 'Mirpur-2,60 fit road,amtola', 60, 'Inside Dhaka', 'Cash on delivery', NULL, NULL, 'courier', '2021-01-07 06:00:52', '2021-01-07 19:55:26'),
(95, 'UR9274', NULL, 'Mosharraf Hossen', '01756699812', 'm.hossen.bd1@gmail.com', 500, NULL, 'sundarban_courier', 'Dhaka', 'Shahbag', 60, 'Inside Dhaka', 'Cash on delivery', NULL, NULL, 'courier', '2021-01-08 02:48:24', '2021-01-08 13:29:01'),
(96, 'UR899', NULL, 'Shadin ahammed', '01881379417', 'Shadinahammed.130@.gemill.com', 1180, NULL, 'sundarban_courier', 'Gazepur', 'Kaleaykor', 120, 'Outside Dhaka', 'Cash on delivery', NULL, NULL, 'cancelled', '2021-01-08 03:50:57', '2021-01-08 16:42:23'),
(97, 'UR2347', NULL, 'shamim ahmed', '01825222195', 'mehedishamim289@gmail.com', 500, NULL, 'sundarban_courier', '😡😡😡', 'newmarked', 60, 'Inside Dhaka', 'Cash on delivery', NULL, NULL, 'courier', '2021-01-08 04:30:14', '2021-01-08 13:29:06'),
(98, 'UR5521', 33, 'Md. Firoz Al Mamun', '01729070752', 'firoz.mamun@brac.net', 1680, NULL, 's_a_paribahan', 'Jashore', 'BRAC Learning Center Jashore, Kholadanga, Dhormotola, Jashore Dadar, Jashore', 120, 'Outside Dhaka', 'Cash on delivery', NULL, NULL, 'courier', '2021-01-08 15:39:31', '2021-01-08 16:47:17'),
(99, 'UR5391', NULL, 'sajjad hossain', '01572426550', NULL, 500, NULL, 'dhaka_home_delivery', 'Dhaka', 'pargendaria,south keranigonj-1311.', 120, 'Outside Dhaka', 'Cash on delivery', NULL, NULL, 'courier', '2021-01-08 17:40:38', '2021-01-08 20:37:22'),
(100, 'UR3990', NULL, 'MD Abu Bakar', '01627617057', 'abubakar35864@gmail.com', 550, NULL, 'sundarban_courier', 'Comilla', 'Cumilla sasongasa', 120, 'Outside Dhaka', 'Cash on delivery', NULL, NULL, 'cancelled', '2021-01-08 18:20:24', '2021-01-09 00:38:25'),
(101, 'UR5256', NULL, 'Md Mostaye Ahmed Farhad', '01733606133', 'mostayeahmed123@gmail.com', 500, NULL, 'sundarban_courier', 'District', 'Debiganj, Panchagarh', 120, 'Outside Dhaka', 'Cash on delivery', NULL, NULL, 'courier', '2021-01-08 20:09:12', '2021-01-08 20:40:32'),
(102, 'UR7806', NULL, 'jahid', '01301775210', NULL, 495, NULL, 'sundarban_courier', 'lakshmipur', 'দক্ষিন বনশ্রী,তিতাস রোড। বল্ক এ', 60, 'Inside Dhaka', 'Cash on delivery', NULL, NULL, 'cancelled', '2021-01-08 23:23:29', '2021-01-09 16:59:14'),
(103, 'UR1971', NULL, 'Jahed', '01814498294', 'jaheds3@gmail.com', 600, NULL, 's_a_paribahan', 'Chittagong', '2no.gate Branch', 120, 'Outside Dhaka', 'Cash on delivery', NULL, NULL, 'courier', '2021-01-08 23:56:39', '2021-01-09 00:08:30'),
(104, 'UR2197', NULL, 'Sajib kunar Das', '01612966776', 'kumarmriduldas1991@gmail.com', 2500, NULL, 'sundarban_courier', 'Gazipur', 'khartoil hindupara, sataish road,, tongi, gazipur.', 120, 'Outside Dhaka', 'Cash on delivery', NULL, NULL, 'cancelled', '2021-01-09 03:01:49', '2021-01-09 16:46:32'),
(105, 'UR9155', NULL, 'Ashik Bashar', '01718985266', 'ashikbashareee@gmail.com', 500, NULL, 'sundarban_courier', 'Gazipur', 'Mir ceramic, North Mawna, Sreepur, Gazipur.', 120, 'Outside Dhaka', 'Cash on delivery', NULL, NULL, 'courier', '2021-01-09 06:27:40', '2021-01-09 16:50:50'),
(106, 'UR3323', NULL, 'Roni', '01706998715', 'nerobrahat123@gmail.com', 1300, NULL, 'sundarban_courier', 'comilla', 'pirkashimpur', 120, 'Outside Dhaka', 'Cash on delivery', NULL, NULL, 'cancelled', '2021-01-09 08:06:36', '2021-01-10 19:22:54'),
(107, 'UR2617', NULL, 'fahim', '01632375303', 'Masterclam006@gmail.com', 500, NULL, 'dhaka_home_delivery', 'Dhaka', 'Dhaka sobujbag, bashabo,boddhomondir, kalibari,dokkhin gaw kather pul', 60, 'Inside Dhaka', 'Cash on delivery', NULL, NULL, 'courier', '2021-01-09 12:26:42', '2021-01-09 16:59:00'),
(108, 'UR4513', NULL, 'Jibon Sarker', '01740745508', NULL, 500, NULL, 'dhaka_home_delivery', 'Dhaka', 'tejgoan nabisco', 60, 'Inside Dhaka', 'Cash on delivery', NULL, NULL, 'courier', '2021-01-09 12:48:28', '2021-01-09 16:56:03'),
(109, 'UR7156', NULL, 'Shipon bhuiyan', '01840905482', 'sbhuiyan160@gmail.com', 500, NULL, 'sundarban_courier', 'Narayangonj', 'Volta,Gawsiya,Rupgonj,Narayangonj', 60, 'Inside Dhaka', 'Cash on delivery', NULL, NULL, 'courier', '2021-01-09 13:11:46', '2021-01-09 16:54:32'),
(110, 'UR9621', 39, 'Abu musa', '01725220185', 'abumusasajon@gmail.com', 550, NULL, 'sundarban_courier', 'Kushtia', 'R a khan chowdhori road,mazompur,kushtia', 120, 'Outside Dhaka', 'Cash on delivery', NULL, NULL, 'courier', '2021-01-09 17:11:29', '2021-01-09 17:40:18'),
(111, 'UR7557', NULL, 'MD.Imran Uddin', '01813539965', 'imranuddintanvir@gmail.com', 495, NULL, 'sundarban_courier', 'Chittagong', '486, Sufi Bari,Shulokbohar. Panchlish.', 120, 'Outside Dhaka', 'Cash on delivery', NULL, NULL, 'courier', '2021-01-09 19:04:20', '2021-01-09 19:12:41'),
(112, 'UR9422', NULL, 'Safwanul Islam', '01610932125', 'safwanul2020@gmail.com', 650, NULL, 'sundarban_courier', 'Dhaka', 'Notun bazar vatara thana dhaka', 60, 'Inside Dhaka', 'Cash on delivery', NULL, NULL, 'courier', '2021-01-09 19:47:44', '2021-01-09 20:00:00'),
(113, 'UR5104', NULL, 'Md Khane Imran Khan', '01718564433', 'Ki.khan564433@gmail.com', 500, NULL, 'dhaka_home_delivery', 'Dhaka', '397/3,Modhubhagh, Hazi tower, Maghbazar, Dhaka', 60, 'Inside Dhaka', 'Cash on delivery', NULL, NULL, 'courier', '2021-01-09 20:19:21', '2021-01-09 21:02:09'),
(114, 'UR9216', 38, 'Faysal Miah', '01790527589', 'faysalsinobanglamis@gmail.com', 550, NULL, 'sundarban_courier', 'Munshiganj,Gazaria', 'Mugrapara, Gazaria, Munhiganj', 120, 'Outside Dhaka', 'Cash on delivery', NULL, NULL, 'cancelled', '2021-01-12 13:01:46', '2021-01-12 13:21:11'),
(115, 'UR9897', NULL, 'Paresh', '01620005600', 'pokhagrachari@gmail.com', 1340, NULL, 's_a_paribahan', 'Khagrachari', 'CS,office, Khagrachhari', 120, 'Outside Dhaka', 'Cash on delivery', NULL, NULL, 'courier', '2021-01-12 13:02:06', '2021-01-12 13:24:23'),
(116, 'UR7064', NULL, 'Md Liton', '01779535042', 'Mdliton34234483@gmail.com', 590, NULL, 'sundarban_courier', 'Sherpur', 'Jhogdar char bazar', 120, 'Outside Dhaka', 'Cash on delivery', NULL, NULL, 'cancelled', '2021-01-12 13:41:08', '2021-01-12 14:27:50'),
(117, 'UR9538', NULL, 'S M Rafiquzzaman', '01754041311', 'bokul44@yahoo.com', 600, NULL, 'sundarban_courier', 'Gqzipur', 'Bangabandhu Sheikh Mujibur Rahmam Agricultural University, Salna, Gazipur 1706', 120, 'Outside Dhaka', 'Cash on delivery', NULL, NULL, 'courier', '2021-01-12 14:01:21', '2021-01-12 14:30:48'),
(118, 'UR6297', NULL, 'Md. Sabbir Rahman', '01912049820', 'proyash@gmail.com', 1000, NULL, 's_a_paribahan', 'Rajshahi', 'Upashahar, B-536', 120, 'Outside Dhaka', 'Cash on delivery', NULL, NULL, 'cancelled', '2021-01-12 17:01:48', '2021-01-12 17:22:24'),
(119, 'UR3161', NULL, 'Md. Sabbir Rahman', '01912049820', 'proyash@gmail.com', 2000, NULL, 's_a_paribahan', 'Rajshahi', 'Upashahar, B-536', 120, 'Outside Dhaka', 'Cash on delivery', NULL, NULL, 'cancelled', '2021-01-12 18:56:11', '2021-01-12 19:30:00'),
(120, 'UR3294', NULL, 'Shaheen', '01917666078', NULL, 550, NULL, 'sundarban_courier', 'Dhaka', '252/8A Mohammadiea Housing Ltd 6', 60, 'Inside Dhaka', 'Cash on delivery', NULL, NULL, 'courier', '2021-01-12 19:16:19', '2021-01-12 19:27:48'),
(121, 'UR7849', NULL, 'SOWRAB HOSSAIN', '01725700240', NULL, 490, NULL, 's_a_paribahan', 'Chuadanga', 'CHUADANGA LGED XEN OFFICE CHUADANGA', 120, 'Outside Dhaka', 'Cash on delivery', NULL, NULL, 'completed', '2021-01-12 22:33:20', '2021-01-13 17:43:43'),
(122, 'UR6994', NULL, 'Najmul Rishan', '01704771589', 'najmulrishan9@gmail.com', 500, NULL, 's_a_paribahan', 'Dhaka', 'Kakrail', 60, 'Inside Dhaka', 'Cash on delivery', NULL, NULL, 'completed', '2021-01-12 23:36:47', '2021-01-28 07:54:14'),
(123, 'UR8047', NULL, 'Najmul Rishan', '01704771589', 'najmulrishan9@gmail.com', 550, NULL, 's_a_paribahan', 'Dhaka', 'Kakrail', 60, 'Inside Dhaka', 'Cash on delivery', NULL, NULL, 'completed', '2021-01-12 23:46:32', '2021-01-28 07:54:18'),
(124, 'UR5150', NULL, 'Prince Riyan', '01956964365', 'princeriyan111@gmail.com', 500, NULL, 'sundarban_courier', 'Dhaka', 'Monsurabad 8 namber road 105 namber house', 60, 'Inside Dhaka', 'Cash on delivery', NULL, NULL, 'courier', '2021-01-13 19:45:36', '2021-01-13 23:02:00'),
(125, 'UR539', NULL, 'Md:Ibrahim', '01719212989', 'ibrahim875537@gmail.com', 1485, NULL, 'sundarban_courier', 'ব্রাহ্মণবাড়ীয়া', 'নবীনগর, ব্রাহ্মণবাড়ীয়া।', 120, 'Outside Dhaka', 'Cash on delivery', NULL, NULL, 'courier', '2021-01-13 20:24:45', '2021-01-13 23:49:31'),
(126, 'UR9332', NULL, 'Mustafizur Rahman', '01789161273', 'mustafizurrahman3399@gmail.com', 590, NULL, 'sundarban_courier', 'ctg', 'বহদ্দারহাট, পুকুরপাড়', 120, 'Outside Dhaka', 'Cash on delivery', NULL, NULL, 'cancelled', '2021-01-14 04:40:19', '2021-01-14 12:12:59'),
(127, 'UR5229', NULL, 'Shahajan Ahmed Saju', '01819592619', 'sajushahajan@gmail.com', 650, NULL, 'sundarban_courier', 'Sylhet', 'Beanibazar Sylhet', 120, 'Outside Dhaka', 'Cash on delivery', NULL, NULL, 'courier', '2021-01-14 12:21:38', '2021-01-14 12:28:28'),
(128, 'UR6297', NULL, 'Arman ali', '01773397306', 'karismaarman86@gamil.com', 550, NULL, 'sundarban_courier', 'thakurgaon', 'thakurgaon', 120, 'Outside Dhaka', 'Cash on delivery', NULL, NULL, 'courier', '2021-01-14 13:28:37', '2021-01-14 14:01:16'),
(129, 'UR295', NULL, 'Abul Hussain Shumel', '01788525251', NULL, 495, NULL, 's_a_paribahan', 'Sylhet', 'Beanibazar', 120, 'Outside Dhaka', 'Cash on delivery', NULL, NULL, 'courier', '2021-01-14 17:01:19', '2021-01-14 17:22:45'),
(130, 'UR2253', NULL, 'alihossain', '01914177282', 'alihossai.bd777@gmail.com', 1100, NULL, 'sundarban_courier', 'Gazipur', 'Gazipur bord bazer', 120, 'Outside Dhaka', 'Cash on delivery', NULL, NULL, 'cancelled', '2021-01-15 14:49:26', '2021-01-15 18:02:40'),
(131, 'UR3935', NULL, 'দেবেশ দেববর্মা', '01716118156', 'debeshdev231@gmail.com', 650, NULL, 'sundarban_courier', 'Moulvibazar', 'Sreemangal', 120, 'Outside Dhaka', 'Cash on delivery', NULL, NULL, 'cancelled', '2021-01-15 16:13:26', '2021-01-15 17:16:35'),
(132, 'UR3608', NULL, 'Azad Tonoy', '01768117762', NULL, 590, NULL, 'sundarban_courier', 'Dhaka', '212/5 East kazipara mirpur', 60, 'Inside Dhaka', 'Cash on delivery', NULL, NULL, 'completed', '2021-01-15 18:38:42', '2021-01-24 00:22:27'),
(133, 'UR2920', NULL, 'Mokhlesur Rahman', '01712614195', 'titudr11@gmail.com', 500, NULL, 'dhaka_home_delivery', 'Dhaka', 'House no. 3, Road No. 14/C, Sector. 4,Uttara, Dhaka', 60, 'Inside Dhaka', 'Cash on delivery', NULL, NULL, 'courier', '2021-01-16 15:53:23', '2021-01-16 22:39:43'),
(134, 'UR4889', NULL, 'Md.Ashikur Rahman', '01645272937', NULL, 1000, NULL, 'dhaka_home_delivery', 'Dhaka', 'Gazirghat,Bot tola, savar Cantonmen.', 60, 'Inside Dhaka', 'Cash on delivery', NULL, NULL, 'courier', '2021-01-16 19:08:01', '2021-01-16 22:32:27'),
(135, 'UR1526', NULL, 'Md.Shihab uddin', '01648779943', 'sujon8872@gmail.com', 1180, NULL, 'sundarban_courier', 'jamalpur', 'Sarishabari, jamalpur', 60, 'Inside Dhaka', 'Cash on delivery', NULL, NULL, 'cancelled', '2021-01-16 20:28:28', '2021-01-16 22:35:16'),
(136, 'UR9139', NULL, 'Taposh', '01788439963', 'taposhchandradas114@gmail.com', 490, NULL, 'sundarban_courier', 'Rangpur', 'সাধনা ঔষধালয় লি ঢাকা,রংপুর শাখা, পায়রা চও্বর,রংপুর', 120, 'Outside Dhaka', 'Cash on delivery', NULL, NULL, 'completed', '2021-01-16 21:07:30', '2021-01-25 14:55:06'),
(137, 'UR4740', NULL, 'Sheraj', '01619227333', 'SamratSheraj@gmail.com', 590, NULL, 'sundarban_courier', 'Noakhali', 'Basurhat company jonj', 120, 'Outside Dhaka', 'Cash on delivery', NULL, NULL, 'cancelled', '2021-01-16 23:19:56', '2021-01-16 23:48:31'),
(138, 'UR9807', NULL, 'Engr.Subrata Das', '8801819377626', 'suvro_engr@yahoo.com', 490, NULL, 'sundarban_courier', 'Chittagong', 'Mishu Bhaban (3rd floor),3/1  O.R Nizam Road,Shahid Abdul Halim R /A,. GEC circle,Chittagong', 120, 'Outside Dhaka', 'Cash on delivery', NULL, NULL, 'completed', '2021-01-17 04:24:15', '2021-01-24 00:22:07'),
(139, 'UR3204', NULL, 'Soyeb Rahman', '01844400000', 'soyeb.mnf@gmail.com', 590, NULL, 'sundarban_courier', 'dhaka', 'Lane#01, Baridhara DOHS', 60, 'Inside Dhaka', 'Cash on delivery', NULL, NULL, 'courier', '2021-01-17 15:14:35', '2021-01-17 16:27:27'),
(140, 'UR5076', NULL, 'mamun', '01787950164', 'mamun420kgc@gmail.com', 1035, NULL, 's_a_paribahan', 'kurigram', 'kurigram s.a poribhn', 120, 'Outside Dhaka', 'Cash on delivery', NULL, NULL, 'courier', '2021-01-17 15:45:45', '2021-01-17 16:30:12'),
(141, 'UR4592', NULL, 'Ratno', '01763660408', NULL, 495, NULL, 'dhaka_home_delivery', 'Dhaka', '1013,east shawrapara,dhaka(health lab hospital road)', 60, 'Inside Dhaka', 'Cash on delivery', NULL, NULL, 'courier', '2021-01-17 21:23:54', '2021-01-17 21:28:51'),
(142, 'UR3880', NULL, 'Farhan', '01637594819', NULL, 700, NULL, 's_a_paribahan', 'Chittagong', 'Kerani hat Branch', 120, 'Outside Dhaka', 'Cash on delivery', NULL, NULL, 'cancelled', '2021-01-17 21:39:15', '2021-01-24 00:21:50'),
(143, 'UR7065', NULL, 'MD.RAKIB HOSEN', '01630738009', 'rakibhosen288@gmail.com', 500, NULL, 'sundarban_courier', 'Chittagong', 'Katgore,Potenga,Chittagong', 120, 'Outside Dhaka', 'Cash on delivery', NULL, NULL, 'completed', '2021-01-18 22:02:51', '2021-01-24 00:21:37'),
(144, 'UR5992', NULL, 'মোহাম্মদ আকিব', '01891638908', 'Akibctgsatkania@gmail.com', 650, NULL, 'sundarban_courier', 'চট্টগ্রাম', 'দোহাজারী,চন্দনাইশ,চট্টগ্রাম', 120, 'Outside Dhaka', 'Cash on delivery', NULL, NULL, 'cancelled', '2021-01-20 16:41:22', '2021-01-20 17:05:19'),
(145, 'UR6003', NULL, 'Md Shohan', '01776829330', NULL, 590, NULL, 's_a_paribahan', 'Bogura', 'Bogura sodor', 120, 'Outside Dhaka', 'Cash on delivery', NULL, NULL, 'completed', '2021-01-20 18:10:00', '2021-02-05 22:20:48'),
(146, 'UR3560', NULL, 'sheikh Mohammad Momen', '01770093371', 'sheikhmohammadmomen@gmail.com', 650, NULL, 'sundarban_courier', 'Mymensingh', '03 No Word College Road, Bhaluka Pourosoba', 120, 'Outside Dhaka', 'Cash on delivery', NULL, NULL, 'completed', '2021-01-20 19:58:15', '2021-01-25 13:20:57'),
(147, 'UR5170', NULL, 'Mobaydulislam', '01781360282', 'Mobaydulisla@gmail.com', 590, NULL, 'sundarban_courier', 'Tangail', 'Gharendha ral stetion', 120, 'Outside Dhaka', 'Cash on delivery', NULL, NULL, 'cancelled', '2021-01-20 20:16:08', '2021-01-21 23:23:02'),
(148, 'UR4602', NULL, 'shuvasish roy', '8801745476210', NULL, 495, NULL, 'sundarban_courier', 'Rangpur', 'Rangpur', 120, 'Outside Dhaka', 'Cash on delivery', NULL, NULL, 'courier', '2021-01-21 18:38:16', '2021-01-21 20:58:49'),
(149, 'UR1375', NULL, 'shuvasish roy', '8801745476210', NULL, 590, NULL, 's_a_paribahan', 'Rangpur', 'Rangpur', 120, 'Outside Dhaka', 'Cash on delivery', NULL, NULL, 'courier', '2021-01-21 18:41:26', '2021-01-21 20:55:45'),
(150, 'UR3975', NULL, 'Titu', '01911857961', NULL, 500, NULL, 'sundarban_courier', 'Netrakona', 'Ukilpara,Netrakona.', 120, 'Outside Dhaka', 'Cash on delivery', NULL, NULL, 'cancelled', '2021-01-21 23:00:47', '2021-01-21 23:22:44'),
(151, 'UR3890', NULL, 'Titu', '01611857961', NULL, 500, NULL, 'sundarban_courier', 'Netrakona', 'Ukilpara,Netrakona.', 120, 'Outside Dhaka', 'Cash on delivery', NULL, NULL, 'completed', '2021-01-21 23:04:17', '2021-01-25 14:54:17'),
(152, 'UR5263', NULL, 'Kamran Chowdhury', 'chowdhurykamran009@gmail.com 01715437421', 'chowdhurykamran009@gmail.com', 590, NULL, 'sundarban_courier', 'Bagerhat', 'Dhaka, poscim nakal para, shin bage,holding no 653.', 60, 'Inside Dhaka', 'Cash on delivery', NULL, NULL, 'completed', '2021-01-23 22:25:23', '2021-02-05 22:20:27'),
(153, 'UR9842', NULL, 'Nishan Ahmed', '01763661518', 'nishanahmed808@gmail.com', 490, NULL, 's_a_paribahan', 'Kushtia', 'kushtia', 120, 'Outside Dhaka', 'Cash on delivery', NULL, NULL, 'completed', '2021-01-24 23:51:19', '2021-01-27 09:15:23'),
(154, 'UR7453', NULL, 'ebrahim khan', '+8801911397219', 'hefashion35@gmail.com', 1770, NULL, 'sundarban_courier', 'Daka', 'Daka uttara', 60, 'Inside Dhaka', 'Cash on delivery', NULL, NULL, 'courier', '2021-01-25 02:21:30', '2021-01-25 13:23:57'),
(155, 'UR7211', NULL, 'Md.Tofazzal Hossain', '01715993037', 'Tofazzalhossain32091@gmail.com', 650, NULL, 'sundarban_courier', 'Manikganj', 'Badiya khola,Jhitka,Harirampur', 120, 'Outside Dhaka', 'Cash on delivery', NULL, NULL, 'courier', '2021-01-27 02:01:36', '2021-01-27 12:59:04'),
(156, 'UR5630', 52, 'Abdur Noor', '01623738824', 'abdurnoor043@gmail.com', 2000, NULL, 'sundarban_courier', 'Dhaka', '20 east tejturi bazar,Tejgaon,dhaka', 60, 'Inside Dhaka', 'Cash on delivery', NULL, NULL, 'cancelled', '2021-01-29 07:29:27', '2021-01-29 09:48:56'),
(157, 'UR7154', 52, 'Abdur Noor', '01623738824', 'abdurnoor043@gmail.com', 1000, NULL, 'sundarban_courier', 'Dhaka', '20 east tejturi bazar,Tejgaon,dhaka', 60, 'Inside Dhaka', 'Cash on delivery', NULL, NULL, 'courier', '2021-01-29 10:53:50', '2021-01-29 12:20:46'),
(158, 'UR3411', NULL, 'Shafiq', '01838738080', 'shafiq.bdt@gmail.com', 3000, NULL, 'sundarban_courier', 'Dhaka', 'House#16,Road#2 Dhanmondi', 60, 'Inside Dhaka', 'Cash on delivery', NULL, NULL, 'cancelled', '2021-01-29 12:24:08', '2021-01-30 08:04:52'),
(159, 'UR5904', 53, 'Modud ahmed', '01310595299', 'Modudahmed698@gmail.com', 1000, NULL, 'sundarban_courier', 'Sylhet', 'Sunasar,zakigonj', 120, 'Outside Dhaka', 'Cash on delivery', NULL, NULL, 'cancelled', '2021-01-29 13:02:13', '2021-01-29 23:30:25'),
(160, 'UR1716', 53, 'Modud ahmed', '01310595299', 'Modudahmed698@gmail.com', 1000, NULL, 'sundarban_courier', 'Sylhet', 'Sylhet,zakigonj,sunasar', 120, 'Outside Dhaka', 'Cash on delivery', NULL, NULL, 'cancelled', '2021-01-29 13:06:00', '2021-01-30 08:04:56'),
(161, 'UR4323', NULL, 'Mamun Or Roshid', '01920705420', NULL, 650, NULL, 'dhaka_home_delivery', 'Dhaka', 'Rode :17, Housd : 5 Mirpur 10 Benaroshipolli Baidul salad jame Mosjid near', 60, 'Inside Dhaka', 'Cash on delivery', NULL, NULL, 'cancelled', '2021-01-29 13:19:52', '2021-01-29 23:30:37'),
(162, 'UR5366', NULL, 'Asad', '01828605106', 'Asadmilon1987@gmail.com', 590, NULL, 's_a_paribahan', 'CHITTAGONG', 'Baryerhat,Mirsharai, Chittagong', 120, 'Outside Dhaka', 'Cash on delivery', NULL, NULL, 'courier', '2021-01-29 20:06:20', '2021-01-29 23:35:03'),
(163, 'UR4839', NULL, 'Md shohag', '01983899695', NULL, 550, NULL, 'sundarban_courier', 'Narayangonj', 'Kanchpur basic...balurmath', 60, 'Inside Dhaka', 'Cash on delivery', NULL, NULL, 'cancelled', '2021-01-30 12:35:06', '2021-01-31 22:30:50'),
(164, 'UR5416', NULL, 'Md.Delwar Hossain', '01838444067', 'moabudget@yahoo.com', 1200, NULL, 'sundarban_courier', 'Dhaka', 'Bangaladeah secretariat gate no-5', 60, 'Inside Dhaka', 'Cash on delivery', NULL, NULL, 'cancelled', '2021-01-30 22:44:06', '2021-01-30 22:54:01'),
(165, 'UR5353', NULL, 'Shanto sarker', '01717349403', 'sarkershanto76@gmail.com', 500, NULL, 'kartua_courier', 'bogra', 'Dhunat..bogra', 120, 'Outside Dhaka', 'Cash on delivery', NULL, NULL, 'cancelled', '2021-01-31 01:58:19', '2021-02-03 01:00:09'),
(166, 'UR4515', NULL, 'Md. Masood Sarwar', '01920447602', 'masoodsarwar376@gmail.com', 700, NULL, 'sundarban_courier', 'Shariatpur', 'Sarwar Medical Stores. Gharisar Bazar, Naria, Shariatpur.', 120, 'Outside Dhaka', 'Cash on delivery', NULL, NULL, 'courier', '2021-01-31 12:09:02', '2021-01-31 22:27:34'),
(167, 'UR4614', 55, 'Md. Iftekhar Russel', '+8801708519917', 'iftekharc@outlook.com', 500, NULL, 'dhaka_home_delivery', 'Dhaka', '146, New Bailyroad, Eastern Baily Apartment, (Baily Society, Behind Shiddeshori Girls College Beside Jatiyo Mohila Shongshtha)', 60, 'Inside Dhaka', 'Cash on delivery', NULL, NULL, 'courier', '2021-02-01 01:15:17', '2021-02-01 01:22:36'),
(168, 'UR2471', NULL, 'Naeem', '01710628360', 'naeemfuzayel9@gmail.com', 700, NULL, 'sundarban_courier', 'Thakurgaon', 'Thakurgaon.Baliadangi Thana.', 120, 'Outside Dhaka', 'Cash on delivery', NULL, NULL, 'courier', '2021-02-01 12:18:34', '2021-02-01 23:06:38'),
(169, 'UR2769', NULL, 'Hanif', '01827867196', 'shh0848@gmail.com', 490, NULL, 'sundarban_courier', 'Dhaka', 'Uttara.  Sector 14. Road. Gausolazam Avenue', 60, 'Inside Dhaka', 'Cash on delivery', NULL, NULL, 'courier', '2021-02-02 01:36:48', '2021-02-02 02:53:39'),
(170, 'UR3268', NULL, 'Test - Shahin Test', '01925618270', NULL, 1100, NULL, 'sundarban_courier', 'kst', 'kum', 60, 'Inside Dhaka', 'Cash on delivery', NULL, NULL, 'cancelled', '2021-02-03 22:54:05', '2021-02-03 22:56:39'),
(171, 'UR5364', NULL, 'Ismail', '01642259188', NULL, 5815, NULL, 'sundarban_courier', 'Narsingdi', 'Rampura', 120, 'Outside Dhaka', 'Cash on delivery', NULL, NULL, 'cancelled', '2021-02-04 11:35:54', '2021-02-05 00:03:01'),
(172, 'UR6689', NULL, 'Rajib Khan', '01815709383', 'Rajibkhan80r@gmail.com', 550, NULL, 's_a_paribahan', 'Natore', 'Gawpara Dhalan', 120, 'Outside Dhaka', 'Cash on delivery', NULL, NULL, 'courier', '2021-02-04 12:52:32', '2021-02-05 00:07:40');

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
(20, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1250, 1000, 'BS1909', 1, 1, '1607585341.jpg', '200', '#3a467a', 500, 200, 0, '2020-11-16 01:41:39', '2020-12-10 01:29:01'),
(21, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1250, 1000, 'BS1910', 1, 1, '1605513948.jpg', '200', '#b8c5ef', 500, 200, 0, '2020-11-16 02:05:48', '2020-11-16 02:18:59'),
(22, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1250, 1000, 'BS1911', 1, 1, '1605514228.jpg', '200', '#eeeef6', 500, 200, 0, '2020-11-16 02:10:28', '2020-11-16 02:19:46'),
(23, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1250, 1000, 'BS1912', 1, 1, '1605514402.jpg', '200', '#c9b8ae', 500, 200, 0, '2020-11-16 02:13:22', '2020-11-16 02:23:55'),
(24, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1250, 1000, 'BS1913', 1, 1, '1605514622.jpg', 'M, L, XL', '#0d0d0f', 500, 200, 0, '2020-11-16 02:17:02', '2020-11-16 02:17:02'),
(27, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1250, 1000, 'BS1914', 1, 1, '1605518350.jpg', '200', '#ffffff', 500, 200, 0, '2020-11-16 03:19:10', '2020-11-28 01:14:21'),
(37, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1250, 1000, 'BS1915', 1, 1, '1605520016.jpg', '200', '#beaba1', 500, 200, 0, '2020-11-16 03:46:56', '2020-11-16 03:48:22'),
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
(67, 'China Viscose Cotton Sweater', '<p>Details</p><p>Brand: UR Fashion</p><p>Fabrics: China Viscose Cotton Sweater</p><p>GSM – 280&nbsp;</p><p>Weight: 0.4kg+</p><p>Color: As seen as image</p><p>Size:&nbsp;</p><p>M- Chest = 38-40 &nbsp;Inch, Length = 27 Inch &nbsp;</p><p>L= Chest = 40-42 &nbsp;Inch, Length = 28 Inch &nbsp;</p><p><strong>XL=&nbsp;</strong>Chest= 42-45 &nbsp;Inch, Length= 28 Inch &nbsp;</p>', 14, 6, 'UR Fashion', NULL, 'sweater,cardigants', 990, 495, 'BS266', 1, 1, '1609590656.jpg', 'M, L, XL', '#8ca4e4', 100, 450, 0, '2020-11-16 04:47:24', '2021-01-02 20:31:15'),
(68, 'China Viscose Cotton Sweater', '<p>Details</p><p>Brand: UR Fashion</p><p>Fabrics: China Viscose Cotton Sweater</p><p>GSM – 280&nbsp;</p><p>Weight: 0.4kg+</p><p>Color: As seen as image</p><p>Size:&nbsp;</p><p>M- Chest = 38-40 &nbsp;Inch, Length = 27 Inch &nbsp;</p><p>L= Chest = 40-42 &nbsp;Inch, Length = 28 Inch &nbsp;</p><p><strong>XL=&nbsp;</strong>Chest= 42-45 &nbsp;Inch, Length= 28 Inch &nbsp;</p>', 14, 6, 'UR Fashion', NULL, 'sweater,cardigants', 990, 495, 'URS 267', 1, 1, '1609590763.jpg', 'M, L, XL', '#fccef6', 100, 450, 1, '2020-11-16 04:51:53', '2021-01-02 20:33:01'),
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
(80, 'Short Zipper Sweater', '<p>Details</p><p>Brand: UR Fashion</p><p>Fabrics: China Viscose Cotton Sweater</p><p>GSM – 280&nbsp;</p><p>Weight: 0.4kg+</p><p>Color: As seen as image</p><p>Size:&nbsp;</p><p>M- Chest = 38-40 &nbsp;Inch, Length = 27 Inch &nbsp;</p><p>L= Chest = 40-42 &nbsp;Inch, Length = 28 Inch &nbsp;</p><p><strong>XL=&nbsp;</strong>Chest= 42-45 &nbsp;Inch, Length= 28 Inch &nbsp;</p>', 14, 6, 'UR Fashion', NULL, 'sweater,cardigants', 1100, 700, 'URS 260', 1, 1, '1609590102.jpg', 'M, L, XL', '#060701', 200, 500, 0, '2020-11-16 05:13:09', '2021-01-02 20:22:03'),
(81, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\r\n\r\n·         Asian measurement,  \r\n\r\nBrand Product Size- Measurement\r\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\r\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\r\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\r\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\r\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\r\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashions', NULL, 'shirt, cotton shirt', 1350, 1000, 'BS 2019', 1, 1, '1605525357.jpg', 'XS, S, M, L, XL, XXL', '#17161c', 100, 200, 0, '2020-11-16 05:15:57', '2020-11-16 05:15:57'),
(82, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\r\n\r\n·         Asian measurement,  \r\n\r\nBrand Product Size- Measurement\r\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\r\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\r\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\r\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\r\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\r\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashions', NULL, 'shirt, cotton shirt', 1350, 1000, 'BS 2125', 1, 1, '1605525529.jpg', 'XS, S, M, L, XL, XXL', '#a0b7e9', 100, 200, 0, '2020-11-16 05:18:49', '2020-11-16 05:18:49'),
(83, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\r\n\r\n·         Asian measurement,  \r\n\r\nBrand Product Size- Measurement\r\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\r\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\r\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\r\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\r\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\r\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashions', NULL, 'shirt, cotton shirt', 1350, 1000, 'BS 2129', 1, 1, '1605525684.jpg', 'XS, S, M, L, XL, XXL', '#f8f7fd', 100, 200, 0, '2020-11-16 05:21:24', '2020-11-16 05:21:24'),
(84, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1250, 1000, 'BS2557', 1, 1, '1605525712.jpg', 'M, L, XL', '#222439', 500, 200, 0, '2020-11-16 05:21:52', '2020-11-16 05:21:52'),
(85, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\r\n\r\n·         Asian measurement,  \r\n\r\nBrand Product Size- Measurement\r\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\r\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\r\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\r\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\r\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\r\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashions', NULL, 'shirt, cotton shirt', 1350, 1000, 'BS 2131', 1, 1, '1605525848.jpg', 'XS, S, M, L, XL, XXL', '#0c1127', 100, 200, 0, '2020-11-16 05:24:08', '2020-11-16 05:24:08'),
(86, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1250, 1000, 'BS2558', 1, 1, '1605525895.jpg', 'M, L, XL', '#46141f', 500, 200, 0, '2020-11-16 05:24:55', '2020-11-16 05:24:55'),
(87, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\r\n\r\n·         Asian measurement,  \r\n\r\nBrand Product Size- Measurement\r\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\r\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\r\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\r\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\r\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\r\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashions', NULL, 'shirt, cotton shirt', 1350, 1000, 'BS 2133', 1, 1, '1605525999.jpg', 'XS, S, M, L, XL, XXL', '#c56e81', 100, 200, 0, '2020-11-16 05:26:39', '2020-11-16 05:26:39'),
(88, 'Full Zipper Sweater', '<p>Details</p><p>Brand: UR Fashion</p><p>Fabrics: China Viscose Cotton Sweater</p><p>GSM – 280&nbsp;</p><p>Weight: 0.4kg+</p><p>Color: As seen as image</p><p>Size:&nbsp;</p><p>M- Chest = 38-40 &nbsp;Inch, Length = 27 Inch &nbsp;</p><p>L= Chest = 40-42 &nbsp;Inch, Length = 28 Inch &nbsp;</p><p><strong>XL=&nbsp;</strong>Chest= 42-45 &nbsp;Inch, Length= 28 Inch &nbsp;</p>', 14, 6, 'UR Fashion', NULL, 'sweater,cardigants', 1100, 550, 'URS 271', 1, 1, '1609589967.jpg', 'M, L, XL', '#293f6e', 200, 400, 1, '2020-11-16 05:28:56', '2021-01-02 20:19:48'),
(89, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\r\n\r\n·         Asian measurement,  \r\n\r\nBrand Product Size- Measurement\r\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\r\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\r\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\r\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\r\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\r\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashions', NULL, 'shirt, cotton shirt', 1350, 1000, 'BS 2134', 1, 1, '1605526164.jpg', 'XS, S, M, L, XL, XXL', '#edd4e7', 100, 200, 0, '2020-11-16 05:29:24', '2020-11-16 05:29:24'),
(90, 'China Viscose Cotton Sweater', '<p>Details</p><p>Brand: UR Fashion</p><p>Fabrics: China Viscose Cotton Sweater</p><p>GSM – 280&nbsp;</p><p>Weight: 0.4kg+</p><p>Color: As seen as image</p><p>Size:&nbsp;</p><p>M- Chest = 38-40 &nbsp;Inch, Length = 27 Inch &nbsp;</p><p>L= Chest = 40-42 &nbsp;Inch, Length = 28 Inch &nbsp;</p><p><strong>XL=&nbsp;</strong>Chest= 42-45 &nbsp;Inch, Length= 28 Inch &nbsp;</p>', 14, 6, 'UR Fashion', NULL, 'sweater,cardigants', 990, 650, 'URS 255', 1, 1, '1609589848.jpg', 'M, L, XL', '#2f2530', 50, 450, 0, '2020-11-16 05:32:21', '2021-01-02 20:17:54'),
(91, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\r\n\r\n·         Asian measurement,  \r\n\r\nBrand Product Size- Measurement\r\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\r\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\r\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\r\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\r\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\r\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashions', NULL, 'shirt, cotton shirt', 1350, 1000, 'BS 2425', 1, 1, '1605526354.jpg', 'XS, S, M, L, XL, XXL', '#82cfbf', 100, 200, 0, '2020-11-16 05:32:34', '2020-11-16 05:32:34'),
(92, 'China Viscose Cotton Sweater Combo 2 pcs', '<p>Details</p><p>Brand: UR Fashion</p><p>Fabrics: China Viscose Cotton Sweater</p><p>GSM – 280&nbsp;</p><p>Weight: 0.4kg+</p><p>Color: As seen as image</p><p>Size:&nbsp;</p><p>M- Chest = 38-40 &nbsp;Inch, Length = 27 Inch &nbsp;</p><p>L= Chest = 40-42 &nbsp;Inch, Length = 28 Inch &nbsp;</p><p><strong>XL=&nbsp;</strong>Chest= 42-45 &nbsp;Inch, Length= 28 Inch &nbsp;</p>', 14, 6, 'UR Fashions', NULL, 'sweater,cardigants', 2000, 800, 'URS 270', 1, 1, '1609596748.jpg', 'M, L, XL,', '#015e49', 200, 450, 1, '2020-11-16 05:36:42', '2021-01-02 22:12:28'),
(93, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\r\n\r\n·         Asian measurement,  \r\n\r\nBrand Product Size- Measurement\r\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\r\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\r\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\r\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\r\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\r\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashions', NULL, 'shirt, cotton shirt', 1350, 1000, 'BS 2445', 1, 1, '1605526775.jpg', 'XS, S, M, L, XL, XXL', 'Multiple Colours', 100, 200, 0, '2020-11-16 05:39:35', '2020-11-16 05:39:35'),
(94, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1250, 1000, 'BS2579', 1, 1, '1605526817.jpg', 'M, L, XL', '#2c4e95', 500, 200, 0, '2020-11-16 05:40:17', '2020-11-16 05:40:17'),
(95, 'Short Zipper Sweater', '<p>Details</p><p>Brand: UR Fashion</p><p>Fabrics: China Viscose Cotton Sweater</p><p>GSM – 280&nbsp;</p><p>Weight: 0.4kg+</p><p>Color: As seen as image</p><p>Size:&nbsp;</p><p>M- Chest = 38-40 &nbsp;Inch, Length = 27 Inch &nbsp;</p><p>L= Chest = 40-42 &nbsp;Inch, Length = 28 Inch &nbsp;</p><p><strong>XL=&nbsp;</strong>Chest= 42-45 &nbsp;Inch, Length= 28 Inch &nbsp;</p>', 14, 6, 'UR Fashions', NULL, 'sweater,cardigants', 1100, 700, 'URS 262', 1, 1, '1609590213.jpg', 'M, L, XL,', 'Multiple Colours', 100, 550, 0, '2020-11-16 05:41:38', '2021-01-02 20:24:08'),
(96, 'Short Zipper Sweater', '<p>Details</p><p>Brand: UR Fashion</p><p>Fabrics: China Viscose Cotton Sweater</p><p>GSM – 280&nbsp;</p><p>Weight: 0.4kg+</p><p>Color: As seen as image</p><p>Size:&nbsp;</p><p>M- Chest = 38-40 &nbsp;Inch, Length = 27 Inch &nbsp;</p><p>L= Chest = 40-42 &nbsp;Inch, Length = 28 Inch &nbsp;</p><p><strong>XL=&nbsp;</strong>Chest= 42-45 &nbsp;Inch, Length= 28 Inch &nbsp;</p>', 14, 6, 'UR Fashion', NULL, 'sweater,cardigants', 1100, 700, 'URS261', 0, 1, '1609590305.jpg', '200', '#8fbbf8', 200, 500, 0, '2020-11-16 05:43:03', '2021-01-02 20:25:26'),
(97, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\r\n\r\n·         Asian measurement,  \r\n\r\nBrand Product Size- Measurement\r\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\r\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\r\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\r\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\r\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\r\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashions', NULL, 'shirt, cotton shirt', 1350, 1000, 'BS 2507', 1, 1, '1605527070.jpg', 'XS, S, M, L, XL, XXL', '#ecd9af', 100, 200, 0, '2020-11-16 05:44:30', '2020-11-16 05:44:30'),
(98, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\r\n\r\n·         Asian measurement,  \r\n\r\nBrand Product Size- Measurement\r\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\r\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\r\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\r\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\r\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\r\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashions', NULL, 'shirt, cotton shirt', 1500, 1000, 'BS 2590', 1, 1, '1605527371.jpg', 'XS, S, M, L, XL, XXL', '#f0eefc', 100, 200, 0, '2020-11-16 05:49:31', '2020-11-16 05:49:31'),
(99, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\r\n\r\n·         Asian measurement,  \r\n\r\nBrand Product Size- Measurement\r\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\r\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\r\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\r\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\r\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\r\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashions', NULL, 'shirt, cotton shirt', 1350, 1000, 'BS 2591', 1, 1, '1605527511.jpg', 'XS, S, M, L, XL, XXL', '#121936', 100, 200, 0, '2020-11-16 05:51:51', '2020-11-16 05:51:51'),
(100, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\r\n\r\n·         Asian measurement,  \r\n\r\nBrand Product Size- Measurement\r\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\r\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\r\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\r\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\r\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\r\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashions', NULL, 'shirt, cotton shirt', 1350, 1000, 'BS 2592', 1, 1, '1605527658.jpg', 'XS, S, M, L, XL, XXL', '#121117', 100, 200, 0, '2020-11-16 05:54:18', '2020-11-16 05:54:18'),
(101, 'China Viscose Cotton Sweater', '<p>Details</p><p>Brand: UR Fashion</p><p>Fabrics: China Viscose Cotton Sweater</p><p>GSM – 280&nbsp;</p><p>Weight: 0.4kg+</p><p>Color: As seen as image</p><p>Size:&nbsp;</p><p>M- Chest = 38-40 &nbsp;Inch, Length = 27 Inch &nbsp;</p><p>L= Chest = 40-42 &nbsp;Inch, Length = 28 Inch &nbsp;</p><p><strong>XL=&nbsp;</strong>Chest= 42-45 &nbsp;Inch, Length= 28 Inch &nbsp;</p>', 14, 6, 'UR Fashion', NULL, 'sweater,cardigants', 990, 490, 'URS254', 0, 1, '1609589704.jpg', 'M,L,XL', '#2f456c', 200, 450, 1, '2020-11-16 05:54:46', '2021-01-02 20:15:54'),
(102, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\r\n\r\n·         Asian measurement,  \r\n\r\nBrand Product Size- Measurement\r\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\r\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\r\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\r\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\r\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\r\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashions', NULL, 'shirt, cotton shirt', 1350, 1000, 'BS 2593', 1, 1, '1605527787.jpg', 'XS, S, M, L, XL, XXL', '#e7f2d2', 100, 200, 0, '2020-11-16 05:56:27', '2020-11-16 05:56:27'),
(103, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\r\n\r\n·         Asian measurement,  \r\n\r\nBrand Product Size- Measurement\r\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\r\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\r\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\r\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\r\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\r\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashions', NULL, 'shirt, cotton shirt', 1350, 1000, 'BS 2594', 1, 1, '1605527969.jpg', 'XS, S, M, L, XL, XXL', '#8acbeb', 100, 200, 0, '2020-11-16 05:59:29', '2020-11-16 05:59:29'),
(104, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1250, 1000, 'BS2585', 0, 1, '1605528085.jpg', '200', '#678cda', 500, 200, 0, '2020-11-16 06:01:25', '2020-11-16 06:09:06'),
(105, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashions', NULL, 'shirt, cotton shirt', 1350, 1000, 'BS 2595', 1, 1, '1605528118.jpg', 'XS, S, M, L, XL, XXL', '#1b2141', 100, 200, 1, '2020-11-16 06:01:58', '2020-12-12 00:09:11'),
(106, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1250, 1000, 'BS2586', 0, 1, '1605528304.jpg', '200', '#21305b', 500, 200, 0, '2020-11-16 06:05:04', '2020-11-16 06:08:28'),
(107, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1250, 1000, 'BS2603', 1, 1, '1605528760.jpg', '200', 'Multi-Colour', 500, 200, 0, '2020-11-16 06:12:40', '2020-11-16 06:16:27'),
(108, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1250, 1000, 'BS 2604', 1, 1, '1605528931.jpg', '200', 'Multi-Colour', 500, 200, 0, '2020-11-16 06:15:31', '2020-11-16 06:16:14'),
(109, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1250, 1000, 'BS2605', 1, 1, '1605529124.jpg', 'M, L, XL', 'Multi-Colour', 500, 200, 1, '2020-11-16 06:18:44', '2020-12-12 00:09:02'),
(110, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1250, 1000, 'BS2606', 1, 1, '1605529280.jpg', 'M, L, XL', 'Multi-Colour', 500, 200, 0, '2020-11-16 06:21:20', '2020-11-16 06:21:20');
INSERT INTO `products` (`id`, `name`, `description`, `category_id`, `parent_category_id`, `brand`, `campaign_id`, `tags`, `mrp`, `selling_price`, `sku`, `track_inventory`, `stock`, `image`, `size`, `color`, `quantity`, `weight`, `feature`, `created_at`, `updated_at`) VALUES
(111, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1250, 1000, 'BS2607', 1, 1, '1605529412.jpg', 'M, L, XL', 'Multi-Colour', 500, 200, 1, '2020-11-16 06:23:32', '2020-12-12 00:08:51'),
(112, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1250, 1000, 'BS2610', 1, 1, '1605529556.jpg', 'M, L, XL', 'Multi-Colour', 500, 200, 0, '2020-11-16 06:25:56', '2020-11-16 06:25:56'),
(113, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1250, 1000, 'BS 2611', 1, 1, '1605529670.jpg', 'M, L, XL', 'Multi-Colour', 500, 200, 1, '2020-11-16 06:27:50', '2020-12-12 00:08:43'),
(116, 'Full Zipper China Biscose Cotton Sweater', '<p>Details</p><p>Brand: UR Fashion</p><p>Fabrics: China Viscose Cotton Sweater</p><p>GSM – 280&nbsp;</p><p>Weight: 0.4kg+</p><p>Color: As seen as image</p><p>Size:&nbsp;</p><p>M- Chest = 38-40 &nbsp;Inch, Length = 27 Inch &nbsp;</p><p>L= Chest = 40-42 &nbsp;Inch, Length = 28 Inch &nbsp;</p><p><strong>XL=&nbsp;</strong>Chest= 42-45 &nbsp;Inch, Length= 28 Inch &nbsp;</p>', 14, 6, 'UR Fashions', NULL, 'Sweater, Cotton Sweater', 1000, 600, 'URS 264', 1, 1, '1609590530.jpg', 'M, L, XL', 'Multiple Colours', 100, 400, 0, '2020-11-17 00:51:41', '2021-01-02 20:29:09'),
(118, 'Comfortable Cotton Shirt For Men', '<p>Details</p><p>Brand: UR Fashion</p><p>Fabrics: China Viscose Cotton Sweater</p><p>GSM – 280&nbsp;</p><p>Weight: 0.4kg+</p><p>Color: As seen as image</p><p>Size:&nbsp;</p><p>M- Chest = 38-40 &nbsp;Inch, Length = 27 Inch &nbsp;</p><p>L= Chest = 40-42 &nbsp;Inch, Length = 28 Inch &nbsp;</p><p><strong>XL=&nbsp;</strong>Chest= 42-45 &nbsp;Inch, Length= 28 Inch &nbsp;</p>', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1400, 1100, 'BS1570', 1, 1, '1607588319.png', 'M, L, XL', '#e98485', 500, 200, 0, '2020-11-17 00:55:14', '2021-01-02 20:04:25'),
(120, 'China Biscose Cotton Sweater', '<p>Details</p><p>Brand: UR Fashion</p><p>Fabrics: China Viscose Cotton Sweater</p><p>GSM – 280&nbsp;</p><p>Weight: 0.4kg+</p><p>Color: As seen as image</p><p>Size:&nbsp;</p><p>M- Chest = 38-40 &nbsp;Inch, Length = 27 Inch &nbsp;</p><p>L= Chest = 40-42 &nbsp;Inch, Length = 28 Inch &nbsp;</p><p><strong>XL=&nbsp;</strong>Chest= 42-45 &nbsp;Inch, Length= 28 Inch &nbsp;</p>', 14, 6, 'UR Fashions', NULL, 'Sweater, Cotton Sweater', 990, 450, 'UrS 208', 1, 1, '1607588237.png', 'M, L, XL', 'Multiple Colours', 100, 400, 0, '2020-11-17 00:57:26', '2021-01-02 19:52:40'),
(121, 'China Biscose Cotton Sweater', '<p>Details</p><p>Brand: UR Fashion</p><p>Fabrics: China Viscose Cotton Sweater</p><p>GSM – 280&nbsp;</p><p>Weight: 0.4kg+</p><p>Color: As seen as image</p><p>Size:&nbsp;</p><p>M- Chest = 38-40 &nbsp;Inch, Length = 27 Inch &nbsp;</p><p>L= Chest = 40-42 &nbsp;Inch, Length = 28 Inch &nbsp;</p><p><strong>XL=&nbsp;</strong>Chest= 42-45 &nbsp;Inch, Length= 28 Inch &nbsp;</p>', 14, 6, 'UR Fashions', NULL, 'Sweater, Cotton Sweater', 990, 450, 'UrS 209', 1, 1, '1607588198.png', 'M, L, XL', 'Multiple Colours', 100, 400, 0, '2020-11-17 00:59:22', '2021-01-02 19:52:00'),
(122, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1400, 1100, 'BS1574', 1, 1, '1607588162.png', 'M, L, XL', '#838793', 500, 200, 0, '2020-11-17 00:59:35', '2020-12-12 00:07:18'),
(123, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1400, 1100, 'BS1578', 1, 1, '1607588077.png', 'M, L, XL', '#7dcde8', 500, 200, 0, '2020-11-17 01:02:49', '2020-12-10 02:14:37'),
(124, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1400, 1100, 'BS2036', 1, 1, '1607588041.png', 'M, L, XL', '#21242d', 500, 200, 0, '2020-11-17 01:04:57', '2020-12-10 02:14:01'),
(125, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1400, 1100, 'BS2037', 1, 1, '1607587990.png', 'M, L, XL', '#782431', 500, 200, 0, '2020-11-17 01:07:25', '2020-12-10 02:13:10'),
(126, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1400, 1100, 'BS2114', 1, 1, '1607587921.png', 'M, L, XL', '#2e3152', 500, 200, 0, '2020-11-17 01:10:55', '2020-12-10 02:12:01'),
(127, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1400, 1100, 'BS2115', 1, 1, '1607587861.png', 'M, L, XL', '#1d181f', 500, 200, 0, '2020-11-17 01:16:25', '2020-12-10 02:11:01'),
(128, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1400, 1100, 'BS2178', 1, 1, '1607586469.png', 'M, L, XL', '#bad4ef', 500, 200, 0, '2020-11-17 01:22:32', '2020-12-10 01:47:49'),
(129, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1400, 1100, 'BS2179', 1, 1, '1607586422.png', 'M, L, XL', '#83dae3', 500, 200, 0, '2020-11-17 01:29:35', '2020-12-10 01:47:02'),
(130, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1400, 1100, 'BS2278', 1, 1, '1607586381.png', 'M, L, XL', '#e3e7f2', 500, 200, 0, '2020-11-17 01:31:51', '2020-12-10 01:46:21'),
(131, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1400, 1100, 'BS2279', 1, 1, '1607586320.png', 'M, L, XL', '#2e2e3a', 500, 200, 0, '2020-11-17 01:34:16', '2020-12-10 01:45:20'),
(132, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1400, 1100, 'BS2280', 1, 1, '1607586271.png', 'M, L, XL', '#26254d', 500, 200, 0, '2020-11-17 01:37:53', '2020-12-10 01:44:31'),
(133, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1400, 1100, 'BS2281', 1, 1, '1607586175.png', 'M, L, XL', '#640d1e', 500, 200, 0, '2020-11-17 01:39:45', '2020-12-10 01:42:55'),
(134, 'Short Zipper Sweater', '<p>Details</p><p>Brand: UR Fashion</p><p>Fabrics: China Viscose Cotton Sweater</p><p>GSM – 280&nbsp;</p><p>Weight: 0.4kg+</p><p>Color: As seen as image</p><p>Size:&nbsp;</p><p>M- Chest = 38-40 &nbsp;Inch, Length = 27 Inch &nbsp;</p><p>L= Chest = 40-42 &nbsp;Inch, Length = 28 Inch &nbsp;</p><p><strong>XL=&nbsp;</strong>Chest= 42-45 &nbsp;Inch, Length= 28 Inch &nbsp;</p>', 14, 6, 'UR Fashion', NULL, 'sweater,cardigants', 1100, 700, 'URS 263', 1, 1, '1609590414.jpg', 'M, L, XL', '#ffefaa', 150, 500, 0, '2020-11-17 01:43:53', '2021-01-02 20:27:13'),
(135, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1400, 1100, 'BS2441', 1, 1, '1607586016.png', '200', '#2b2275', 500, 200, 0, '2020-11-17 02:30:23', '2020-12-12 00:07:09'),
(136, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1400, 1100, 'BS2549', 1, 1, '1607585946.png', 'M,L,XL', '#c7dbf6', 500, 200, 0, '2020-11-17 02:34:04', '2020-12-10 01:39:06'),
(137, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1400, 1100, 'BS2550', 1, 1, '1607585871.png', 'M,L,XL', '#dbb7f2', 500, 200, 0, '2020-11-17 02:36:32', '2020-12-12 00:07:00'),
(138, 'Comfortable Cotton Shirt For Men', '* Pure cotton shirt\n\n·         Asian measurement,  \n\nBrand Product Size- Measurement\nXS Collar=14.5\'\', Body=35-36\'\', Length=28\'\'\nS, Collar=15\'\', Body=38-39\'\', Length=28.5\'\'\nM, Collar=15.5\'\', Body=40-42\'\', Length=29.5\'\'\nL Collar=16\'\', Body=42-44\'\', Length=30\'\'\nXL Collar=16.5\'\', Body=45-46\'\', Length=31\'\'\nXXL Collar=17\'\', Body=47-48\'\', Length=31.5\'\'', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1400, 1100, 'BS2601', 1, 1, '1607585574.png', 'M,L,XL', '#c8dcf4', 500, 200, 0, '2020-11-17 02:38:37', '2020-12-12 00:06:51'),
(139, 'Comfortable Cotton Shirt For Men', '<p>Details</p><p>Brand: UR Fashion</p><p>Fabrics: China Viscose Cotton Sweater</p><p>GSM – 280&nbsp;</p><p>Weight: 0.4kg+</p><p>Color: As seen as image</p><p>Size:&nbsp;</p><p>M- Chest = 38-40 &nbsp;Inch, Length = 27 Inch &nbsp;</p><p>L= Chest = 40-42 &nbsp;Inch, Length = 28 Inch &nbsp;</p><p><strong>XL=&nbsp;</strong>Chest= 42-45 &nbsp;Inch, Length= 28 Inch &nbsp;</p>', 7, 6, 'UR Fashion', NULL, 'shirt, cotton shirt', 1400, 1000, 'BS2602', 1, 1, '1607584931.jpg', 'S, M, L, XL,XXL', '#621058', 500, 200, 0, '2020-11-17 02:40:44', '2021-01-02 20:03:58'),
(142, 'China Viscose Cotton Sweater', '<p>Details</p><p>Brand: UR Fashion</p><p>Fabrics: China Viscose Cotton Sweater</p><p>GSM – 280&nbsp;</p><p>Weight: 0.4kg+</p><p>Color: As seen as image</p><p>Size:&nbsp;</p><p>M- Chest = 38-40 &nbsp;Inch, Length = 27 Inch &nbsp;</p><p>L= Chest = 40-42 &nbsp;Inch, Length = 28 Inch &nbsp;</p><p><strong>XL=&nbsp;</strong>Chest= 42-45 &nbsp;Inch, Length= 28 Inch &nbsp;</p>', 14, 6, 'UR Fashions', NULL, 'Sweater', 990, 590, 'URS190', 0, 1, '1607679914.jpg', 'M, L, XL', '#131315', 50, 450, 0, '2020-12-11 03:45:14', '2021-01-02 19:51:06'),
(143, 'China Viscose Cotton Sweater', '<p>Details</p><p>Brand: UR Fashion</p><p>Fabrics: China Viscose Cotton Sweater</p><p>GSM – 280&nbsp;</p><p>Weight: 0.4kg+</p><p>Color: As seen as image</p><p>Size:&nbsp;</p><p>M- Chest = 38-40 &nbsp;Inch, Length = 27 Inch &nbsp;</p><p>L= Chest = 40-42 &nbsp;Inch, Length = 28 Inch &nbsp;</p><p><strong>XL=&nbsp;</strong>Chest= 42-45 &nbsp;Inch, Length= 28 Inch &nbsp;</p>', 14, 6, 'UR Fashions', NULL, 'Sweater', 990, 650, 'URS191', 0, 1, '1607680342.jpg', 'M, L, XL', '#f4104c', 20, 450, 0, '2020-12-11 03:52:22', '2021-01-02 19:50:34'),
(144, 'China Viscose Cotton Sweater', '<p>Details</p><p>Brand: UR Fashion</p><p>Fabrics: China Viscose Cotton Sweater</p><p>GSM – 280&nbsp;</p><p>Weight: 0.4kg+</p><p>Color: As seen as image</p><p>Size:&nbsp;</p><p>M- Chest = 38-40 &nbsp;Inch, Length = 27 Inch &nbsp;</p><p>L= Chest = 40-42 &nbsp;Inch, Length = 28 Inch &nbsp;</p><p><strong>XL=&nbsp;</strong>Chest= 42-45 &nbsp;Inch, Length= 28 Inch &nbsp;</p>', 14, 6, 'UR Fashions', NULL, 'Sweater', 900, 445, 'URS193', 0, 1, '1607680604.jpg', 'M, L, XL', 'Multiple Colors', 150, 400, 1, '2020-12-11 03:56:44', '2021-01-02 19:50:02'),
(145, 'China Viscose Cotton Sweater', '<p>Details</p><p>Brand: UR Fashion</p><p>Fabrics: China Viscose Cotton Sweater</p><p>GSM – 280&nbsp;</p><p>Weight: 0.4kg+</p><p>Color: As seen as image</p><p>Size:&nbsp;</p><p>M- Chest = 38-40 &nbsp;Inch, Length = 27 Inch &nbsp;</p><p>L= Chest = 40-42 &nbsp;Inch, Length = 28 Inch &nbsp;</p><p><strong>XL=&nbsp;</strong>Chest= 42-45 &nbsp;Inch, Length= 28 Inch &nbsp;</p>', 14, 6, 'UR Fashions', NULL, 'Sweater', 990, 600, 'URS196', 0, 1, '1607680966.jpg', 'M, L, XL', 'Multiple Colors', 59, 450, 0, '2020-12-11 04:02:46', '2021-01-02 19:48:37'),
(146, 'China Viscose Cotton Sweater', '<p>Details</p><p>Brand: UR Fashion</p><p>Fabrics: China Viscose Cotton Sweater</p><p>GSM – 280&nbsp;</p><p>Weight: 0.4kg+</p><p>Color: As seen as image</p><p>Size:&nbsp;</p><p>M- Chest = 38-40 &nbsp;Inch, Length = 27 Inch &nbsp;</p><p>L= Chest = 40-42 &nbsp;Inch, Length = 28 Inch &nbsp;</p><p><strong>XL=&nbsp;</strong>Chest= 42-45 &nbsp;Inch, Length= 28 Inch &nbsp;</p>', 14, 6, 'UR Fashions', NULL, 'Sweater', 990, 495, 'URS197', 0, 1, '1607681057.jpg', 'M, L, XL', 'Multiple Colors', 100, 450, 0, '2020-12-11 04:04:17', '2021-01-02 19:47:43'),
(147, 'China Viscose Cotton Sweater', '<p>Details</p><p>Brand: UR Fashion</p><p>Fabrics: China Viscose Cotton Sweater</p><p>GSM – 280&nbsp;</p><p>Weight: 0.4kg+</p><p>Color: As seen as image</p><p>Size:&nbsp;</p><p>M- Chest = 38-40 &nbsp;Inch, Length = 27 Inch &nbsp;</p><p>L= Chest = 40-42 &nbsp;Inch, Length = 28 Inch &nbsp;</p><p><strong>XL=&nbsp;</strong>Chest= 42-45 &nbsp;Inch, Length= 28 Inch &nbsp;</p>', 14, 6, 'UR Fashions', NULL, 'Sweater', 990, 590, 'URS198', 0, 1, '1607681182.jpg', 'M, L, XL', 'Multiple Colors', 50, 450, 0, '2020-12-11 04:06:22', '2021-01-02 19:47:02'),
(149, 'China Viscose Cotton Sweater', '<p>Details</p><p>Brand: UR Fashion</p><p>Fabrics: China Viscose Cotton Sweater</p><p>GSM – 280&nbsp;</p><p>Weight: 0.4kg+</p><p>Color: As seen as image</p><p>Size:&nbsp;</p><p>M- Chest = 38-40 &nbsp;Inch, Length = 27 Inch &nbsp;</p><p>L= Chest = 40-42 &nbsp;Inch, Length = 28 Inch &nbsp;</p><p><strong>XL=&nbsp;</strong>Chest= 42-45 &nbsp;Inch, Length= 28 Inch &nbsp;</p>', 14, 6, 'UR Fashions', NULL, 'Sweater', 900, 550, 'URS199', 0, 1, '1607682015.jpg', 'M, L, XL', '#306342', 30, 450, 0, '2020-12-11 04:20:15', '2021-01-02 19:46:12'),
(150, 'China Viscose Cotton Sweater', '<p>Details</p><p>Brand: UR Fashion</p><p>Fabrics: China Viscose Cotton Sweater</p><p>GSM – 280&nbsp;</p><p>Weight: 0.4kg+</p><p>Color: As seen as image</p><p>Size:&nbsp;</p><p>M- Chest = 38-40 &nbsp;Inch, Length = 27 Inch &nbsp;</p><p>L= Chest = 40-42 &nbsp;Inch, Length = 28 Inch &nbsp;</p><p><strong>XL=&nbsp;</strong>Chest= 42-45 &nbsp;Inch, Length= 28 Inch &nbsp;</p>', 14, 6, 'UR Fashions', NULL, 'Sweater', 900, 590, 'URS200', 0, 1, '1607682143.jpg', 'M, L, XL', '#0d0d0f', 50, 450, 0, '2020-12-11 04:22:23', '2021-01-02 19:45:34'),
(151, 'China Viscose Cotton Sweater', '<p>Details</p><p>Brand: UR Fashion</p><p>Fabrics: China Viscose Cotton Sweater</p><p>GSM – 280&nbsp;</p><p>Weight: 0.4kg+</p><p>Color: As seen as image</p><p>Size:&nbsp;</p><p>M- Chest = 38-40 &nbsp;Inch, Length = 27 Inch &nbsp;</p><p>L= Chest = 40-42 &nbsp;Inch, Length = 28 Inch &nbsp;</p><p><strong>XL=&nbsp;</strong>Chest= 42-45 &nbsp;Inch, Length= 28 Inch &nbsp;</p>', 14, 6, 'UR Fashions', NULL, 'Sweater', 990, 590, 'URS201', 0, 1, '1607682332.jpg', 'M, L, XL', '#6d1422', 50, 450, 0, '2020-12-11 04:25:32', '2021-01-02 19:45:00'),
(152, 'China Viscose Cotton Sweater', '<p>Details</p><p>Brand: UR Fashion</p><p>Fabrics: China Viscose Cotton Sweater</p><p>GSM – 280&nbsp;</p><p>Weight: 0.4kg+</p><p>Color: As seen as image</p><p>Size:&nbsp;</p><p>M- Chest = 38-40 &nbsp;Inch, Length = 27 Inch &nbsp;</p><p>L= Chest = 40-42 &nbsp;Inch, Length = 28 Inch &nbsp;</p><p><strong>XL=&nbsp;</strong>Chest= 42-45 &nbsp;Inch, Length= 28 Inch &nbsp;</p>', 14, 6, 'UR Fashions', NULL, 'Sweater', 990, 650, 'URS202', 0, 1, '1607682432.jpg', 'M, L, XL', '#1b1d2c', 5, 450, 0, '2020-12-11 04:27:12', '2021-01-02 19:44:29'),
(154, 'China Viscose Cotton Sweater', '<p>Details</p><p>Brand: UR Fashion</p><p>Fabrics: China Viscose Cotton Sweater</p><p>GSM – 280&nbsp;</p><p>Weight: 0.4kg+</p><p>Color: As seen as image</p><p>Size:&nbsp;</p><p>M- Chest = 38-40 &nbsp;Inch, Length = 27 Inch &nbsp;</p><p>L= Chest = 40-42 &nbsp;Inch, Length = 28 Inch &nbsp;</p><p><strong>XL=&nbsp;</strong>Chest= 42-45 &nbsp;Inch, Length= 28 Inch &nbsp;</p>', 14, 6, 'UR Fashions', NULL, 'Sweater', 990, 650, 'URS206', 1, 1, '1607682715.jpg', 'M, L, XL', 'Multiple Colors', 100, 450, 0, '2020-12-11 04:31:55', '2021-01-02 19:43:51'),
(155, 'China Viscose Cotton Sweater', '<p>Details</p><p>Brand: UR Fashion</p><p>Fabrics: China Viscose Cotton Sweater</p><p>GSM – 280&nbsp;</p><p>Weight: 0.4kg+</p><p>Color: As seen as image</p><p>Size:&nbsp;</p><p>M- Chest = 38-40 &nbsp;Inch, Length = 27 Inch &nbsp;</p><p>L= Chest = 40-42 &nbsp;Inch, Length = 28 Inch &nbsp;</p><p><strong>XL=&nbsp;</strong>Chest= 42-45 &nbsp;Inch, Length= 28 Inch &nbsp;</p>', 14, 6, 'UR Fashions', NULL, 'Sweater', 990, 490, 'URS207', 1, 1, '1607682789.jpg', 'M, L, XL', 'Multiple Colors', 200, 450, 0, '2020-12-11 04:33:09', '2021-01-02 19:43:06'),
(156, 'China Viscose Cotton Sweater', '<p>Details</p><p>Brand: UR Fashion</p><p>Fabrics: China Viscose Cotton Sweater</p><p>GSM – 280&nbsp;</p><p>Weight: 0.4kg+</p><p>Color: As seen as image</p><p>Size:&nbsp;</p><p>M- Chest = 38-40 &nbsp;Inch, Length = 27 Inch &nbsp;</p><p>L= Chest = 40-42 &nbsp;Inch, Length = 28 Inch &nbsp;</p><p><strong>XL=&nbsp;</strong>Chest= 42-45 &nbsp;Inch, Length= 28 Inch &nbsp;</p>', 14, 6, 'UR Fashions', NULL, 'Sweater', 900, 690, 'URS210', 1, 1, '1607682899.jpg', 'M, L, XL', 'Multiple Colors', 100, 450, 0, '2020-12-11 04:34:59', '2021-01-02 19:42:15'),
(157, 'China Viscose Cotton Sweater', '<p>Details</p><p>Brand: UR Fashion</p><p>Fabrics: China Viscose Cotton Sweater</p><p>GSM – 280&nbsp;</p><p>Weight: 0.4kg+</p><p>Color: As seen as image</p><p>Size:&nbsp;</p><p>M- Chest = 38-40 &nbsp;Inch, Length = 27 Inch &nbsp;</p><p>L= Chest = 40-42 &nbsp;Inch, Length = 28 Inch &nbsp;</p><p><strong>XL=&nbsp;</strong>Chest= 42-45 &nbsp;Inch, Length= 28 Inch &nbsp;</p>', 14, 6, 'UR Fashions', NULL, 'Sweater', 990, 650, 'URS211', 1, 1, '1609587660.jpg', 'M, L, XL', 'Multiple Colors', 100, 450, 0, '2020-12-11 04:36:37', '2021-01-02 19:41:17'),
(159, 'China Viscose Cotton Sweater', '<p>Details</p><p>Brand: UR Fashion</p><p>Fabrics: China Viscose Cotton Sweater</p><p>GSM – 280&nbsp;</p><p>Weight: 0.4kg+</p><p>Color: As seen as image</p><p>Size:&nbsp;</p><p>M- Chest = 38-40 &nbsp;Inch, Length = 27 Inch &nbsp;</p><p>L= Chest = 40-42 &nbsp;Inch, Length = 28 Inch &nbsp;</p><p><strong>XL=&nbsp;</strong>Chest= 42-45 &nbsp;Inch, Length= 28 Inch &nbsp;</p>', 14, 6, 'UR Fashions', NULL, 'Sweater', 1000, 500, 'URS221', 0, 1, '1609587330.jpg', 'M, L, XL', '#5b121b', 200, 450, 0, '2020-12-11 04:40:41', '2021-01-02 19:35:36'),
(161, 'China Viscose Cotton Sweater', '<p>Details</p><p>Brand: UR Fashion</p><p>Fabrics: China Viscose Cotton Sweater</p><p>GSM – 280&nbsp;</p><p>Weight: 0.4kg+</p><p>Color: As seen as image</p><p>Size:&nbsp;</p><p>M- Chest = 38-40 &nbsp;Inch, Length = 27 Inch &nbsp;</p><p>L= Chest = 40-42 &nbsp;Inch, Length = 28 Inch &nbsp;</p><p><strong>XL=&nbsp;</strong>Chest= 42-45 &nbsp;Inch, Length= 28 Inch &nbsp;</p>', 14, 6, 'UR Fashions', NULL, 'Sweater', 1000, 750, 'URS222', 0, 1, '1609587006.jpg', 'M, L, XL', '#0e0e0e', 20, 450, 0, '2020-12-11 04:43:27', '2021-01-02 19:30:28'),
(162, 'China Viscose Cotton Sweater', '<p>Details</p><p>Brand: UR Fashion</p><p>Fabrics: China Viscose Cotton Sweater</p><p>GSM – 280&nbsp;</p><p>Weight: 0.4kg+</p><p>Color: As seen as image</p><p>Size:&nbsp;</p><p>M- Chest = 38-40 &nbsp;Inch, Length = 27 Inch &nbsp;</p><p>L= Chest = 40-42 &nbsp;Inch, Length = 28 Inch &nbsp;</p><p><strong>XL=&nbsp;</strong>Chest= 42-45 &nbsp;Inch, Length= 28 Inch &nbsp;</p>', 14, 6, 'UR Fashion', NULL, 'Sweater', 990, 590, 'URS234', 1, 1, '1609586713.jpg', 'M, L, XL', '#fbbc1f, #11143d', 300, 450, 1, '2020-12-11 04:47:00', '2021-01-02 19:25:22'),
(163, 'China Viscose Cotton Sweater', '<p>Details</p><p>Brand: UR Fashion</p><p>Fabrics: China Viscose Cotton Sweater</p><p>GSM – 280&nbsp;</p><p>Weight: 0.4kg+</p><p>Color: As seen as image</p><p>Size:&nbsp;</p><p>M- Chest = 38-40 &nbsp;Inch, Length = 27 Inch &nbsp;</p><p>L= Chest = 40-42 &nbsp;Inch, Length = 28 Inch &nbsp;</p><p><strong>XL=&nbsp;</strong>Chest= 42-45 &nbsp;Inch, Length= 28 Inch &nbsp;</p>', 14, 6, 'UR Fashions', NULL, 'Sweater', 990, 590, 'URS249', 0, 1, '1609586647.jpg', 'M, L, XL', '#0f0d10', 200, 200, 0, '2020-12-11 04:47:14', '2021-01-02 19:24:14'),
(164, 'China Viscose Cotton Sweater', '<p>Details</p><p>Brand: UR Fashion</p><p>Fabrics: China Viscose Cotton Sweater</p><p>GSM – 280&nbsp;</p><p>Weight: 0.4kg+</p><p>Color: As seen as image</p><p>Size:&nbsp;</p><p>M- Chest = 38-40 &nbsp;Inch, Length = 27 Inch &nbsp;</p><p>L= Chest = 40-42 &nbsp;Inch, Length = 28 Inch &nbsp;</p><p><strong>XL=&nbsp;</strong>Chest= 42-45 &nbsp;Inch, Length= 28 Inch &nbsp;</p>', 14, 6, 'UR Fashions', NULL, 'Sweater', 990, 590, 'URS250', 0, 1, '1609586574.jpg', 'M, L, XL', 'Multiple Colors', 200, 450, 0, '2020-12-11 04:50:45', '2021-01-02 19:23:11'),
(165, 'China Viscose Cotton Sweater', '<p>Details</p><p>Brand: UR Fashion</p><p>Fabrics: China Viscose Cotton Sweater</p><p>GSM – 280&nbsp;</p><p>Weight: 0.4kg+</p><p>Color: As seen as image</p><p>Size:&nbsp;</p><p>M- Chest = 38-40 &nbsp;Inch, Length = 27 Inch &nbsp;</p><p>L= Chest = 40-42 &nbsp;Inch, Length = 28 Inch &nbsp;</p><p><strong>XL=&nbsp;</strong>Chest= 42-45 &nbsp;Inch, Length= 28 Inch &nbsp;</p>', 14, 6, 'UR Fashion', NULL, 'Sweater', 990, 495, 'URS235', 1, 1, '1609586007.jpg', 'M, L, XL', '#ccd7dd, #11143d', 200, 450, 0, '2020-12-11 04:52:10', '2021-01-02 19:13:36'),
(168, 'China Viscose Cotton Sweater', '<p>Details</p><p>Brand: UR Fashion</p><p>Fabrics: China Viscose Cotton Sweater</p><p>GSM – 280&nbsp;</p><p>Weight: 0.4kg+</p><p>Color: As seen as image</p><p>Size:&nbsp;</p><p>M- Chest = 38-40 &nbsp;Inch, Length = 27 Inch &nbsp;</p><p>L= Chest = 40-42 &nbsp;Inch, Length = 28 Inch &nbsp;</p><p><strong>XL=&nbsp;</strong>Chest= 42-45 &nbsp;Inch, Length= 28 Inch &nbsp;</p>', 14, 6, 'UR Fashion', NULL, 'Sweater', 990, 495, 'URS246', 1, 1, '1609585899.jpg', 'M, L, XL', '#8bc070', 200, 450, 1, '2020-12-11 05:09:03', '2021-01-02 19:12:00'),
(169, 'China Viscose Cotton Sweater', '<p>Details</p><p>Brand: UR Fashion</p><p>Fabrics: China Viscose Cotton Sweater</p><p>GSM – 280&nbsp;</p><p>Weight: 0.4kg+</p><p>Color: As seen as image</p><p>Size:&nbsp;</p><p>M- Chest = 38-40 &nbsp;Inch, Length = 27 Inch &nbsp;</p><p>L= Chest = 40-42 &nbsp;Inch, Length = 28 Inch &nbsp;</p><p><strong>XL=&nbsp;</strong>Chest= 42-45 &nbsp;Inch, Length= 28 Inch &nbsp;</p>', 14, 6, 'UR Fashion', NULL, 'Sweater', 990, 495, 'URS247', 1, 1, '1609585837.jpg', 'M, L, XL', '#df760d', 200, 450, 1, '2020-12-11 05:11:33', '2021-01-02 19:10:45'),
(170, 'China Viscose Cotton Sweater', '<p>Details</p><p>Brand: UR Fashion</p><p>Fabrics: China Viscose Cotton Sweater</p><p>GSM – 280&nbsp;</p><p>Weight: 0.4kg+</p><p>Color: As seen as image</p><p>Size:&nbsp;</p><p>M- Chest = 38-40 &nbsp;Inch, Length = 27 Inch &nbsp;</p><p>L= Chest = 40-42 &nbsp;Inch, Length = 28 Inch &nbsp;</p><p><strong>XL=&nbsp;</strong>Chest= 42-45 &nbsp;Inch, Length= 28 Inch &nbsp;</p>', 14, 6, 'UR Fashion', NULL, 'Sweater', 1000, 490, 'URS251', 1, 1, '1607685389.jpg', 'M, L, XL', '#ded9d5', 200, 450, 1, '2020-12-11 05:16:29', '2021-01-02 19:08:34'),
(177, 'Ladies Stylish Long Sweater', '<p>Details</p><p>Brand: UR Fashion</p><p>Fabrics: Acrylic Cotton Sweater</p><p>12 gez cotton</p><p>Weight: 0.3kg+</p><p>Color: As seen as image</p><p>Size:&nbsp;</p><p>M- Chest = 38 &nbsp;Inch, Length = 34 Inch &nbsp;</p><p>L= Chest = 40 &nbsp;Inch, Length = 34 Inch &nbsp;</p><p><strong>XL=&nbsp;</strong>Chest= 42 &nbsp;Inch, Length= 35 Inch &nbsp;</p>', 16, 9, 'UR Fashion', NULL, 'sweater,cardigants', 1000, 690, 'NRS01', 1, 1, '1609591741.jpg', 's,m,xl', 'Red', 100, 100, 0, '2020-12-29 19:38:45', '2021-01-02 20:52:22'),
(179, 'Ladies Sweater', '<p>Details</p><p>Brand: UR Fashion</p><p>Fabrics: Acrylic Cotton Sweater</p><p>12 gez cotton</p><p>Weight: 0.3kg+</p><p>Color: As seen as image</p><p>Size:&nbsp;</p><p>M- Chest = 38 &nbsp;Inch, Length = 34 Inch &nbsp;</p><p>L= Chest = 40 &nbsp;Inch, Length = 34 Inch &nbsp;</p><p><strong>XL=&nbsp;</strong>Chest= 42 &nbsp;Inch, Length= 35 Inch &nbsp;</p>', 16, 9, 'UR Fashion', NULL, 'sweater,cardigants', 1000, 690, 'NRS03', 1, 1, '1609592246.jpg', 'M, L, XL', 'Blue', 200, 300, 0, '2021-01-02 20:57:26', '2021-01-02 20:57:26'),
(180, 'Ladies Sweater', '<p>Details</p><p>Brand: UR Fashion</p><p>Fabrics: Acrylic Cotton Sweater</p><p>12 gez cotton</p><p>Weight: 0.3kg+</p><p>Color: As seen as image</p><p>Size:&nbsp;</p><p>M- Chest = 38 &nbsp;Inch, Length = 34 Inch &nbsp;</p><p>L= Chest = 40 &nbsp;Inch, Length = 34 Inch &nbsp;</p><p><strong>XL=&nbsp;</strong>Chest= 42 &nbsp;Inch, Length= 35 Inch &nbsp;</p>', 16, 9, 'UR Fashion', NULL, 'sweater,cardigants', 1000, 690, 'NRS04', 1, 1, '1609592436.jpg', 'M, L, XL', 'Black', 200, 300, 0, '2021-01-02 21:00:36', '2021-01-02 21:00:36'),
(190, 'Cotton Comfortable Shirt', '<p>cotton</p>', 7, 6, 'UR Fashion', NULL, 'Shirt, Casual Shirt,', 1250, 1000, 'BS1803', 1, 1, '1612415131.jpg', 'M,L,XL', 'Black', 100, 300, 0, '2021-02-03 23:05:31', '2021-02-03 23:05:31');

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
(54, 21, '5fb232dc515dd.jpg', '2020-11-16 02:05:48', '2020-11-16 02:05:48'),
(55, 22, '5fb233f503599.jpg', '2020-11-16 02:10:29', '2020-11-16 02:10:29'),
(56, 23, '5fb234a2cce84.jpg', '2020-11-16 02:13:22', '2020-11-16 02:13:22'),
(57, 24, '5fb2357e0fabd.jpg', '2020-11-16 02:17:02', '2020-11-16 02:17:02'),
(60, 27, '5fb2440e89912.jpg', '2020-11-16 03:19:10', '2020-11-16 03:19:10'),
(70, 37, '5fb24a901ea0e.jpg', '2020-11-16 03:46:56', '2020-11-16 03:46:56'),
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
(178, 139, '5fd1cc9c470d1.jpg', '2020-12-10 01:22:04', '2020-12-10 01:22:04'),
(179, 20, '5fd1ce47baa30.jpg', '2020-12-10 01:29:11', '2020-12-10 01:29:11'),
(180, 138, '5fd1cf21bf259.png', '2020-12-10 01:32:49', '2020-12-10 01:32:49'),
(182, 137, '5fd1d05690246.png', '2020-12-10 01:37:58', '2020-12-10 01:37:58'),
(183, 136, '5fd1d0a15ac41.png', '2020-12-10 01:39:13', '2020-12-10 01:39:13'),
(184, 135, '5fd1d0e7d4a2a.png', '2020-12-10 01:40:23', '2020-12-10 01:40:23'),
(185, 134, '5fd1d1387715e.png', '2020-12-10 01:41:44', '2020-12-10 01:41:44'),
(186, 133, '5fd1d1860d54b.png', '2020-12-10 01:43:02', '2020-12-10 01:43:02'),
(187, 132, '5fd1d1e69b6f6.png', '2020-12-10 01:44:38', '2020-12-10 01:44:38'),
(188, 131, '5fd1d216a38d1.png', '2020-12-10 01:45:26', '2020-12-10 01:45:26'),
(189, 130, '5fd1d2535cace.png', '2020-12-10 01:46:27', '2020-12-10 01:46:27'),
(190, 129, '5fd1d27c8ea5e.png', '2020-12-10 01:47:08', '2020-12-10 01:47:08'),
(191, 128, '5fd1d2b228882.png', '2020-12-10 01:48:02', '2020-12-10 01:48:02'),
(192, 127, '5fd1d81c62eb8.png', '2020-12-10 02:11:08', '2020-12-10 02:11:08'),
(193, 126, '5fd1d85b91675.png', '2020-12-10 02:12:11', '2020-12-10 02:12:11'),
(194, 125, '5fd1d89d3a2e1.png', '2020-12-10 02:13:17', '2020-12-10 02:13:17'),
(195, 124, '5fd1d8d02d4a9.png', '2020-12-10 02:14:08', '2020-12-10 02:14:08'),
(196, 123, '5fd1d8f34aac1.png', '2020-12-10 02:14:43', '2020-12-10 02:14:43'),
(197, 122, '5fd1d94b199f6.png', '2020-12-10 02:16:11', '2020-12-10 02:16:11'),
(198, 121, '5fd1d96cd8a9e.png', '2020-12-10 02:16:44', '2020-12-10 02:16:44'),
(199, 120, '5fd1d994085cb.png', '2020-12-10 02:17:24', '2020-12-10 02:17:24'),
(201, 118, '5fd1d9e4e1313.png', '2020-12-10 02:18:44', '2020-12-10 02:18:44'),
(203, 116, '5fd1da2c8152f.png', '2020-12-10 02:19:56', '2020-12-10 02:19:56'),
(206, 142, '5fd33fab0e10e.jpg', '2020-12-11 03:45:15', '2020-12-11 03:45:15'),
(207, 143, '5fd341568a53b.jpg', '2020-12-11 03:52:22', '2020-12-11 03:52:22'),
(208, 144, '5fd3425ca29b7.jpg', '2020-12-11 03:56:44', '2020-12-11 03:56:44'),
(209, 145, '5fd343c6ee2b4.jpg', '2020-12-11 04:02:46', '2020-12-11 04:02:46'),
(210, 146, '5fd3442215600.jpg', '2020-12-11 04:04:18', '2020-12-11 04:04:18'),
(211, 147, '5fd3449eccfe1.jpg', '2020-12-11 04:06:22', '2020-12-11 04:06:22'),
(213, 149, '5fd347e00fc61.jpg', '2020-12-11 04:20:16', '2020-12-11 04:20:16'),
(214, 150, '5fd3485f8314b.jpg', '2020-12-11 04:22:23', '2020-12-11 04:22:23'),
(215, 151, '5fd3491ce68d9.jpg', '2020-12-11 04:25:32', '2020-12-11 04:25:32'),
(216, 152, '5fd349804f65c.jpg', '2020-12-11 04:27:12', '2020-12-11 04:27:12'),
(218, 154, '5fd34a9b3d827.jpg', '2020-12-11 04:31:55', '2020-12-11 04:31:55'),
(219, 155, '5fd34ae5e1e6d.jpg', '2020-12-11 04:33:09', '2020-12-11 04:33:09'),
(220, 156, '5fd34b5364659.jpg', '2020-12-11 04:34:59', '2020-12-11 04:34:59'),
(223, 159, '5fd34ca9c0cdd.jpg', '2020-12-11 04:40:41', '2020-12-11 04:40:41'),
(225, 161, '5fd34d4f7565a.jpg', '2020-12-11 04:43:27', '2020-12-11 04:43:27'),
(226, 162, '5fd34e24ce0c8.jpg', '2020-12-11 04:47:00', '2020-12-11 04:47:00'),
(227, 163, '5fd34e3344acd.jpg', '2020-12-11 04:47:15', '2020-12-11 04:47:15'),
(228, 164, '5fd34f056a017.jpg', '2020-12-11 04:50:45', '2020-12-11 04:50:45'),
(229, 165, '5fd34f5ab9971.jpg', '2020-12-11 04:52:10', '2020-12-11 04:52:10'),
(233, 169, '5fd353e57b031.jpg', '2020-12-11 05:11:33', '2020-12-11 05:11:33'),
(234, 170, '5fd3550dd358e.jpg', '2020-12-11 05:16:29', '2020-12-11 05:16:29'),
(242, 101, '5ff063d3e3d45.jpg', '2021-01-02 20:15:15', '2021-01-02 20:15:15'),
(243, 90, '5ff064612eca4.jpg', '2021-01-02 20:17:37', '2021-01-02 20:17:37'),
(244, 88, '5ff064d8d8354.jpg', '2021-01-02 20:19:36', '2021-01-02 20:19:36'),
(245, 80, '5ff065609192a.jpg', '2021-01-02 20:21:52', '2021-01-02 20:21:52'),
(246, 95, '5ff065d11fb10.jpg', '2021-01-02 20:23:45', '2021-01-02 20:23:45'),
(247, 96, '5ff0662aba0b8.jpg', '2021-01-02 20:25:14', '2021-01-02 20:25:14'),
(248, 134, '5ff066991bf21.jpg', '2021-01-02 20:27:05', '2021-01-02 20:27:05'),
(249, 116, '5ff0670be41f0.jpg', '2021-01-02 20:28:59', '2021-01-02 20:28:59'),
(250, 67, '5ff0678948dfc.jpg', '2021-01-02 20:31:05', '2021-01-02 20:31:05'),
(251, 68, '5ff067f45d717.jpg', '2021-01-02 20:32:52', '2021-01-02 20:32:52'),
(252, 177, '5ff06bcdde48c.jpg', '2021-01-02 20:49:17', '2021-01-02 20:49:17'),
(254, 179, '5ff06db636db1.jpg', '2021-01-02 20:57:26', '2021-01-02 20:57:26'),
(255, 180, '5ff06e7500503.jpg', '2021-01-02 21:00:37', '2021-01-02 21:00:37'),
(256, 92, '5ff07e17210e1.jpg', '2021-01-02 22:07:19', '2021-01-02 22:07:19'),
(257, 92, '5ff07f5a86cec.jpg', '2021-01-02 22:12:42', '2021-01-02 22:12:42'),
(267, 190, '601b809bb42dd.jpg', '2021-02-03 23:05:31', '2021-02-03 23:05:31');

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
(4, 135, 'Mamun', 'mamun.swe.277@gmail.com', 5, 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\'s De Finibus Bonorum et Malorum for use in a type specimen book.', 'pending', '2020-11-24 06:03:43', '2021-01-09 15:27:21'),
(6, 57, 'শেখ মামুন-উর রশিদ', 'mamunshake95@gmail.com', 5, 'excellent', 'pending', '2020-11-27 08:04:43', '2020-11-27 08:04:43');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `category_id`, `name`, `image`, `created_at`, `updated_at`) VALUES
(18, 7, 'Shirt', '1606373911.png', '2020-11-26 00:58:31', '2020-11-26 00:58:31'),
(19, 11, 'T-shirt', '1606374043.png', '2020-11-26 01:00:43', '2020-11-26 01:00:43'),
(20, 14, 'Winter Collection', '1606374099.png', '2020-11-26 01:01:39', '2020-11-26 01:01:39');

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
(6, 'interac226@protonmail.com', '2020-11-15 05:47:16', '2020-11-15 05:47:16'),
(7, 'golamabbas@nadir.com', '2020-11-21 08:58:11', '2020-11-21 08:58:11'),
(8, 'wenger5@telus.net', '2020-11-21 22:35:35', '2020-11-21 22:35:35'),
(9, 'goosewee1122@gmail.com', '2020-11-24 06:53:48', '2020-11-24 06:53:48'),
(10, 'alim.eu.bd@gmail.com', '2020-11-26 01:51:17', '2020-11-26 01:51:17'),
(11, 'Louvenia_Smitham61@gmail.com', '2020-11-26 08:54:37', '2020-11-26 08:54:37'),
(12, 'homescoutjason@gmail.com', '2020-12-01 22:23:44', '2020-12-01 22:23:44'),
(13, 'janetefield2004@yahoo.com', '2020-12-04 23:17:36', '2020-12-04 23:17:36'),
(14, 'ott_werner@web.de', '2020-12-08 20:53:56', '2020-12-08 20:53:56'),
(15, 'meredithlynnadams@gmail.com', '2020-12-10 08:13:28', '2020-12-10 08:13:28'),
(16, 'salahuddinbks9@gmail.com', '2020-12-10 21:42:48', '2020-12-10 21:42:48'),
(17, 'chillicus101@outlook.com', '2020-12-12 11:32:02', '2020-12-12 11:32:02'),
(18, 'info@predator-rc.info', '2020-12-13 17:56:44', '2020-12-13 17:56:44'),
(19, 'teresa@snapcm.com', '2020-12-14 20:40:50', '2020-12-14 20:40:50'),
(20, 'markkettering@cox.net', '2020-12-27 13:27:10', '2020-12-27 13:27:10'),
(21, 'edgubbels@aol.com', '2020-12-30 09:33:19', '2020-12-30 09:33:19'),
(22, 'atiqsws@gmail.com', '2021-01-04 13:36:08', '2021-01-04 13:36:08'),
(23, 'tuhintahsan800@gmail.com', '2021-01-04 16:56:48', '2021-01-04 16:56:48'),
(24, 'jesminakter3101@gmail.com', '2021-01-04 18:02:43', '2021-01-04 18:02:43'),
(25, 'rofikulia40@email.com', '2021-01-04 21:19:41', '2021-01-04 21:19:41'),
(26, 'mousumeemou.9009@gmail.com', '2021-01-04 22:25:29', '2021-01-04 22:25:29'),
(27, 'shockleypenny@yahoo.com', '2021-01-05 02:18:48', '2021-01-05 02:18:48'),
(28, 'miaemran95@gmail.com', '2021-01-06 21:05:47', '2021-01-06 21:05:47'),
(29, 'ridoydas072@gmail.com', '2021-01-08 01:47:04', '2021-01-08 01:47:04'),
(30, 'mdmuzammelhaquer@gamil.com', '2021-01-08 03:27:53', '2021-01-08 03:27:53'),
(31, 'mo01824520@gmail.com', '2021-01-12 12:31:43', '2021-01-12 12:31:43'),
(32, 'amssajib@gmail.com', '2021-01-12 13:28:59', '2021-01-12 13:28:59'),
(33, 'alimsazzad@gmail.com', '2021-01-12 14:17:04', '2021-01-12 14:17:04'),
(34, 'robin249278@gmail.com', '2021-01-12 14:47:15', '2021-01-12 14:47:15'),
(35, 'mi6202331@gmail.com', '2021-01-12 15:54:04', '2021-01-12 15:54:04'),
(36, 'mobassirmiah902@gmail.com', '2021-01-12 16:35:48', '2021-01-12 16:35:48'),
(37, 'ka8004846@gmail.com', '2021-01-12 16:41:40', '2021-01-12 16:41:40'),
(38, 'khansayed715@gmail.com', '2021-01-12 18:59:24', '2021-01-12 18:59:24'),
(39, 'zahiduli413@gmail.com', '2021-01-12 19:55:53', '2021-01-12 19:55:53'),
(40, 'mdmurad5261@gmail.com', '2021-01-14 02:33:58', '2021-01-14 02:33:58'),
(41, 's01712920418@gmail.com', '2021-01-14 05:30:28', '2021-01-14 05:30:28'),
(42, 'rohmanoliur97@gmail.com', '2021-01-14 18:23:03', '2021-01-14 18:23:03'),
(43, 'jasmoythangbawm@gmail.com', '2021-01-14 20:17:10', '2021-01-14 20:17:10'),
(44, 'Sheikhshihab585@gmail.com', '2021-01-18 20:31:20', '2021-01-18 20:31:20'),
(45, 'mrshahin768534@gmail.com', '2021-01-19 15:18:37', '2021-01-19 15:18:37'),
(46, 'Shariarchy779@gmail.com', '2021-01-19 22:31:23', '2021-01-19 22:31:23'),
(47, 'abrahamaljubair@gmail.com', '2021-01-20 13:57:06', '2021-01-20 13:57:06'),
(48, 'nijamuddinn367@gmail.com', '2021-01-24 10:40:37', '2021-01-24 10:40:37'),
(49, 'Shamim0171289@gmail.com', '2021-01-27 18:12:37', '2021-01-27 18:12:37'),
(50, 'moakano@yahoo.com', '2021-01-28 00:50:16', '2021-01-28 00:50:16'),
(51, 'sheikhlatif970@gmail.com', '2021-01-28 03:08:25', '2021-01-28 03:08:25'),
(52, 'zamranahmed418@gmail.com', '2021-01-28 06:05:57', '2021-01-28 06:05:57'),
(53, 'akteroishe301@gmail.com', '2021-01-31 19:25:49', '2021-01-31 19:25:49'),
(54, 'greg@hensongroup.com', '2021-02-01 10:24:17', '2021-02-01 10:24:17'),
(55, 'vicyru@ivyandmarj.com', '2021-02-02 06:32:55', '2021-02-02 06:32:55'),
(56, 'zubomd356@gmail.com', '2021-02-03 19:50:19', '2021-02-03 19:50:19');

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
(9, 'Golam Rabby', 'golamrabbidiu@gmail.com', '01533592618', '1605079371.jpg', 'admin', '$2y$10$2vTQCv9rcVyAY9ctknlx2O.c.VBsBDp/BM5I3Wkyj8/RmvUQDDpNS', 'dnZkbkQwcUg5MVhlb3BoVGc5VFh4WTFYYkJGNWFKWFdyVlNMM2VaTVJKVlM2SUpjQ1VpREV1NHJzSG1F601e2647035f4', '2020-11-10 22:56:55', '2021-02-05 23:17:23'),
(10, 'Mamun', 'mamun.swe.277@gmail.com', '01533592619', '1605077060.jpg', 'admin', '$2y$10$gZ4yMo5WEpnG0N3NV1FeSefIBIJKVAQyJlvILlrFfhAU.NqrRpF3q', 'bWpTaUs2OGt4eDJKTlVnR0Ryak9mMHVFODdXbXZsd2w5ZjJQMXRZRThGd0R5cG9aYThaRDZRaVVBT3Vq601e3fa449adc', '2020-11-10 23:57:08', '2021-02-06 01:05:08'),
(20, 'UR Fashions', 'urfashionbd@gmail.com', '01684100451', NULL, 'admin', '$2y$10$ieeIjx/Azl3zoP2dsjom0uRMkiiYDJus13CJRS4dyJhr1Y5W64dCy', 'elpRQlhWVDlPczltaWZaSUgwNFRJVnJCa0UzMmJEbW9jRHh5Q2Y0Q2M3VU91M29IU0dvNFRSMm14Znd4601e49333b215', '2020-11-26 05:45:57', '2021-02-06 01:45:55'),
(22, 'শেখ মামুন-উর রশিদ', 'mamunshake95@gmail.com', '01750933359', NULL, 'user', '$2y$10$TZHwFPKIiW8pefZkgaTmMOHn9O.MxS/5hgjMBfxkseQf.ggYvgDR6', 'bGlrSjh0ajRvRXVYRDdSaEJ6cFVBUmZOYzJraktoYVlVWXhWWmxHNHBVc0JyUThTV1V5anNlMEdyVU9k5fc1065b92bc6', '2020-11-27 07:59:03', '2020-11-27 07:59:55'),
(24, 'Abdullah Al Mamun', 'mhmamun166009@gmail.com', '01407002858', '1610604921.jpg', 'user', '$2y$10$KaUpnmT5z33bR3t/Cy2.m.ZYvPG/QxxlZAJnVBTg8GP3W6q9OP8Xu', 'bkRJZDZtM2QyZ3lYRmlTSllYbUFjNkZwUGtrUllYVnRyUkp0OXlUblkwMER3YlVJdEh5am5mZW1aT1oy601ce9420658f', '2020-11-30 07:46:16', '2021-02-05 00:44:18'),
(25, 'Md Yeasin Ahmed', 'mdzunaidtwl@gmail.com', '01913539172', NULL, 'user', '$2y$10$q9teLADtd136V97546qai.OYS3ljvMUQ1dXIVvf8owczWsV8nKd12', 'OWMwSFpmejNqb1VTNDlueWhSbmxBQU4xeUIxN09tV1FqYWNnNG5qbEgxRU1JSU9RZmZaWTJLZkpMZlFJ5fcdfbec0aa37', '2020-12-07 03:54:37', '2020-12-07 03:54:52'),
(26, 'Abdul Alim', 'alim.eu.bd@gmail.com', '01997310000', NULL, 'admin', '$2y$10$qzS8Z25BcRIc.0RbISMIS.7s2kICekDFZj1sufOHbSDyZ17NuRGb2', 'Y0s3eE0yNkVSN3lObjlRQmNrUzY0U1RTajZOSVhISkJZZmNkaUx2aDRhSU8xaDF1aE9VVkJhZ3dOZlN05fd32c76a836e', '2020-12-11 02:18:57', '2020-12-11 02:23:18'),
(27, 'Shahina Easmin Pia', 'shahinaeasminpia860703@gmail.com', '01744860703', NULL, 'admin', '$2y$10$INgz5gztGD99tDWMu1j3aOgqOCZMYmGmjBLo7jMSgMab8AMCf5Fy6', 'VXh0aTBiQXlQTk5tN0xQUUw2VGdyZkRSQ1NSc2d5bWFuSVQ3NkFGWHVoRnJrbHk2QWoxTnJwazFhTTNS5fd37cf6578ee', '2020-12-11 02:27:20', '2020-12-11 08:06:46'),
(28, 'Jebin Jaman', 'jabinnessa2@gmail.com', '01799786355', NULL, 'admin', '$2y$10$Zjr143Sc6j1IsXILSo767.xGLdbUbAPr829kefVc5c.HRmv8ihQS2', 'Q1ZsVGFPNGhadzZURFIzUVc3Z0NreGU3bEFZSHZvT20zNWpZWU1nWlBoWFBsVUhDaXUzSEttY0xDTVU55fd342a04df55', '2020-12-11 03:21:16', '2020-12-11 03:57:52'),
(29, 'Zahida Rimi', 'zahidarimi98@gmail.com', '01714867457', NULL, 'user', '$2y$10$ISFlXiE5XsNA9NKTwsOJf.supiFEVY/qHgeYAslHD768tnUZI/E/e', 'WXcyNDZXV1ZMbElLQmlZUUNYZ3ZwNk9vQVpMTUdOY3J6UHQ5WUxvSTVRa0VsN3VCT2RqaUhLQm5LN1ZW5fd74d9a06441', '2020-12-11 09:45:46', '2020-12-14 05:33:46'),
(30, 'Saleh al nayem', 'salehalnayem@gmail.com', '01710880424', NULL, 'user', '$2y$10$NljYkpH6lDbJKDyZMrTkCunMYNnOY1qhkHl0orVcD7bfBa.yrDl/q', 'R1Z4blFEMFlxMVdJUVUyNzVtcVBVUzlvOE0yVXduMW53QjJqS0ZZQkNBMHpOVkxFMWRBZTJoRURlWkxR5fda135a76880', '2020-12-16 08:01:44', '2020-12-16 08:02:02'),
(31, 'Juel Rana', 'meherpurjtl@gmail.com', '+8801792358080', NULL, 'user', '$2y$10$MMXEhr2vmhG9xnedUq7hlO1vFps2/R..6Ga8onFa2D4nC8SefZ96O', 'QnVta2ZINkRxS05uRVdHMVdSSVFybFJWTkdEWE54emhuVUJwYVZJSG94b0NVNWxuMHNGa2xpVnZlZUhQ5fda5d3a494bf', '2020-12-16 13:16:43', '2020-12-16 13:17:14'),
(32, 'Ahmed Nishan', 'piyasahmed256@gmail.com', '01890410468', NULL, 'user', '$2y$10$BkkX0SP0VYqUyDxjrEe80ufN8OFSI5Kgiw51v1X3a5l6x0NJ0sX7K', 'a2xMcjBQNTFXcVI2QjZzNVlVQUhtTnU4SnQwV1V5a292clE5aG43d1ZSRFhxUTFQU1pMZ3JMM1ROWHI05ff2de542ae58', '2021-01-04 17:22:06', '2021-01-04 17:22:28'),
(33, 'Md. Firoz Al Mamun', 'firoz.mamun@brac.net', '01729070752', NULL, 'user', '$2y$10$hm9ljbMpT/BMIGFAvB6lYOOziiiBHKtI3arXEXMI3WIS0eQmM31Xy', 'cHZYUFoxeG9SSXNhS1I0ZENPV3pVd1VsY0d4dlRqRDVCa2VxaHgwWXlJdVFvMGR6NEMwTllyOWpUVm5w5ff8020c2b9a1', '2021-01-04 18:43:43', '2021-01-08 14:56:12'),
(34, 'Rofikl islam', 'rofikulia40@email.com', '01786703526', NULL, 'user', '$2y$10$b47GgqpdDjrVzhV5eyIYBuq5TuFvBlbzAlOBlD4K1m6VfTjx/2Vdq', NULL, '2021-01-04 21:18:43', '2021-01-04 21:18:43'),
(35, 'Sonia Akter', 'soniaakter35986@gmail.com', '01986332465', NULL, 'user', '$2y$10$gKL/0nP0KFr95gIepu8FGet/f5e0cTcPkQzHYuDeTdlKP/GknhKlC', 'cGRZUDF0amRrOFVRVFQ0S3BWQXQ5cmkwZUt3dnMwZk1TNTkxRTNqMXh0d2RNSnRGUWF1NUlrZWVKOFNJ5ff55c0d9dfb6', '2021-01-06 14:43:03', '2021-01-06 14:43:25'),
(36, 'Md Rahadul Islam', 'rahadul86@gmail.com', '01796504910', NULL, 'user', '$2y$10$VuFUGZkVukKrzrcV0UcmpehfDP79sqeUtWNHBdfnHpgNpceJN4fi.', 'Unh6d1hHY0ZkRTNjc2VZU1hQZlVzUGZ2cFZZdEZON0E0YUg0czNLSVVWUUMxcGNGekk2MFF0WnFrV3c15ff5c7d5785e0', '2021-01-06 22:22:58', '2021-01-06 22:23:17'),
(37, 'Saddam Tanjil', 'saadtanjil@gmail.com', '01821458366', NULL, 'user', '$2y$10$6xKpfLvDEacuxCByQOlyFecAVtG9cNBGSYdoVeCD6C0KmJ9PR5WiC', 'UzFsQTE3STVrSG9tcDVOcGdweG5teEdSdTR4T05iQjB6SVpyaVB4R3J0N1VQMWhLOTdjVmFsSXdaWFF65ff8b38072559', '2021-01-09 03:32:59', '2021-01-09 03:33:20'),
(38, 'Faysal Miah', 'faysalsinobanglamis@gmail.com', '01790527589', '1610183025.jpg', 'user', '$2y$10$lNkDCdRAeZ9z1VXkuyfFBuIv7iKxfr1I.bXVNlnQAYn5o676Xt9ju', 'Y1dXTkRoTFVYdDg0NUVRM2JxNzVUdXN6RUpIUkxBaDRNWXpvcm9tZmN3WUFnNlpXdzg5V0VONk5VdmQy5ff96e8ea0fcf', '2021-01-09 16:51:14', '2021-01-09 17:03:45'),
(39, 'Abu musa', 'abumusasajon@gmail.com', '01725220185', NULL, 'user', '$2y$10$iDVvYpxXojxC0xMceYVCJeOrs5sLjhq2kjtTotalpykJHPiqQ9ZHK', NULL, '2021-01-09 17:08:48', '2021-01-09 17:11:47'),
(40, 'Md Shamim', 'mdshamimkhandkar@gmail.com', '01742594425', NULL, 'user', '$2y$10$cIikv9s2ATfysOjnssCuN.750TdoOq9K27zBkdOcsnceDLYTw9n.q', 'c3pZM0s0R0d1RmZwOUx5S3h4SXJKb3F0VFk2cWd6S2laQlBERHBtZzNXa0dsNkdsRWdpdUxXczRVQ0pl5ff9732174dc8', '2021-01-09 17:10:28', '2021-01-09 17:10:57'),
(41, 'Hriday Ahammed', 'ahammedriday@gmail.com', '01714422688', '1610191181.jpg', 'user', '$2y$10$mMIVtp0W38x3UeoC3YFpd.hWyBgdhidWrlQL.fUK9S2boBFz2CNt6', 'cWljYTJFbTBac001QUNBdktLcDd4clN1YUNxekk5c2xHSE1idmIzWk5YTmVOOTFyNEd1cWdDQUExWXpR5ff990dc88037', '2021-01-09 19:17:31', '2021-01-09 19:19:41'),
(42, 'Abirhasan', 'Aabiirhasan@gmail.com', '01648558212', NULL, 'user', '$2y$10$U0WlSrvD5PLRHR7jOG4.cO2GF8q22TXHInSlnk0Sn8POtM8OCB2Yy', 'NHZ0SVRPejZGcXRXamJnWWliZHdTOGg4RjNVaVdXQUVJcENWRkRQZ1hyMUp2TE5WZGZLVmRyRDlrOTN35ffb627bd0515', '2021-01-11 04:24:11', '2021-01-11 04:24:27'),
(43, 'Zakaria hossain zaakkiirr', 'Zhossain.premier@gmail.com', '01730353036', NULL, 'user', '$2y$10$e9VnwGbqSz1eT.NHeDD7yurUdqDnKIqY2Op.Ftod0HTvMKuYde/C.', 'TVNxSWhFZE0yRXRzUmVaV2lkTnZTMldOZXNUc1VoN1FGZWFHcllNcXZLQnRZdHdSNTRxZDVmMjZNc0NF5ffd3af6c6993', '2021-01-12 13:59:50', '2021-01-12 14:00:22'),
(44, 'S M Nuhash', 'nush14@gmail.com', '01628121696', NULL, 'user', '$2y$10$R7ksznW6TbxOld4Inzh0qO.CBVunV0cmPLEnGXOhRx3d3Q/SNTdbK', 'NmR4WUlSVGtFSU9uYndJbmJXRXl4bERTb1FmeE5sUzE2ejRmbjRPakxoNkZreUh2WTlLRUtmSHFMQkJB5ffd70a401bc1', '2021-01-12 17:48:59', '2021-01-12 17:49:24'),
(45, 'Abul Bashar Md.Murad', 'mdmurad5261@gmail.com', '01982249299', NULL, 'user', '$2y$10$WyNtrNidexQZ7xhoYWRu9OUGq6o7R68pxJj5INUQOS2H0B7pBH.6i', NULL, '2021-01-14 02:35:51', '2021-01-14 02:37:06'),
(46, 'Shahajan Ahmed Saju', 'sajushahajan@gmail.com', '01819592619', NULL, 'user', '$2y$10$WnnS0eCgSRLtB5xLYlu54uW5Jh20DUOHJz9GFOXmwotPfY8SKAWPq', 'a0FoMGZhR0I4YWI2YzZ0aVBQYlg2U3dqdzdZcHhQVHllQjVMUE1aZmFxMzk4S01mYmxHNWNyUTc2Y0ZW60002a43288bf', '2021-01-14 19:24:27', '2021-01-14 19:25:55'),
(47, 'dddddddd', 'a@gmail.om', '01777777777', NULL, 'user', '$2y$10$rUZdR4PtG2X7I.X8MP8s2OfjIk4scCBv1.a8JV3NYLx4aVxArcCTu', NULL, '2021-01-16 16:08:04', '2021-01-16 16:08:04'),
(48, 'Md. Saif Uddin Chowdhury', 'saifytc@gmail.com', '01815349655', NULL, 'user', '$2y$10$DzrhzQ60TmDlg9R72LyWPe1byvavoKQ4fVmcuR6ut/03SE07jlV8.', 'MWE2cExNWm12S29Ham9mdzRlM096MWt5OGFvUHhDekIwQnBVU1QzTzh5cG5MbFJ5RnJYZnJZbmZYcW4x600453d1a94e9', '2021-01-17 23:11:32', '2021-01-17 23:12:17'),
(49, 'Md jumman', 'mdjumman290@gmail.com', '01916014468', NULL, 'user', '$2y$10$I4hjXLIDtkH.nxIvoApIpOFINDGTlVVfkbVtCnUGy/nJ7VwS5T/jC', 'ZHFJYmEzczlOQ1Nac1FJck52MW5YU0VvNFZDUnNFcnNRcjk5SXZ0RjhRWEtHa1hYcTNzTXZ2TWQ3QzZs6006e96c07ca7', '2021-01-19 22:14:49', '2021-01-19 22:15:08'),
(50, 'ᴍᴜꜱᴛᴀꜰᴀ ᴊᴀᴍᴀɴ', 'mustafa.jaman74@gmail.com', '01712878466', NULL, 'user', '$2y$10$BHMbUaBZRPM8oXivuwVnZe1sYh1stUFLGl4E/QFOVZimcaZxXUw6m', 'U1ZuRlhOOEpuWFhsVVFBRFNYV2VVZTdzMWVEMHpUUVVNQnR5VlU3YXprUWpHMmtRQWFyVGRNM25ha1FJ6008326393469', '2021-01-20 21:38:05', '2021-01-20 21:38:43'),
(51, 'Kp Sharma', 'kpsharma828@gmail.com', '01517999198', NULL, 'user', '$2y$10$kK7WtsnKL9ftGrn3.XyKDep12BaAXsZAlwJ7uGZpDDdww1YEevdpe', NULL, '2021-01-27 12:28:31', '2021-01-27 12:30:11'),
(52, 'Abdur Noor', 'abdurnoor043@gmail.com', '01623738824', NULL, 'user', '$2y$10$Vf473.8KOWQ10ILOHWkVyeTfRJyIa9pEqDrK.5O.pHv6J9.nzERRC', 'VUZQU1pWdmJVVlBsNllWOVY0TU82azJLbFhINURabzdaTEd3NmRhNW5rNVZ1UTVJWG01M295OEJQamFX6016561f462ae', '2021-01-29 07:27:29', '2021-01-31 01:02:55'),
(53, 'Modud ahmed', 'Modudahmed698@gmail.com', '01310595299', NULL, 'user', '$2y$10$UTlJoWxWfqUkY6lCSaDhBu/pQ9d81txZAjw8sfVzk3tIXnyDaJGDO', 'NENxZnpjRU11SmZnWDhpY04zSHNzMFNDQURIMFJuaUM4TEQ4R21VSk1YREY2NVRaTGRTZHc1cTZaSFhT6014592b16695', '2021-01-29 12:50:58', '2021-01-29 12:51:23'),
(54, 'Bitop panday', 'Www.bitop.panday55@gmail.com', '01906312494', NULL, 'user', '$2y$10$Vl1Md0fAy0lbfV0snxjIeO6woCMLCw1mqJxGtPFrskHDHEKluU5wW', 'a2R3cnZwd1F6Z2p1WWQ2N3k1clJZM3VWeUFjYWZSN1hzc1pnb3VIYXVxQkJIbkRyN1phcDNXWnI4WG1w6015fd6d7f62e', '2021-01-30 18:43:42', '2021-01-30 18:44:29'),
(55, 'Md. Iftekhar Russel', 'iftekharc@outlook.com', '+8801708519917', NULL, 'user', '$2y$10$fp0ykgiRoEtTZOEZXYG9vOWttci47POT3AguDHEmc1ExkZiSK5Ri6', NULL, '2021-02-01 01:13:39', '2021-02-02 01:26:28');

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=220;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=173;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=192;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=271;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
