-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 02, 2021 at 01:49 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `district` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thana` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sector` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `road` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `house` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `user_id`, `country`, `district`, `city`, `thana`, `post_code`, `sector`, `road`, `house`, `created_at`, `updated_at`) VALUES
(1, 1, 'Bangladesh', 'Dhaka', 'Dhaka', 'Savar', '1340', NULL, NULL, NULL, '2021-10-20 22:28:54', '2021-10-20 22:28:54');

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'color', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(2, 'size', '2021-10-20 22:28:53', '2021-10-20 22:28:53');

-- --------------------------------------------------------

--
-- Table structure for table `attribute_items`
--

CREATE TABLE `attribute_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `attribute_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'as like #000000 or S,M,XL or 32, 34, 36 or 3'' by 5'' etc',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attribute_items`
--

INSERT INTO `attribute_items` (`id`, `attribute_id`, `product_id`, `name`, `image`, `details`, `created_at`, `updated_at`) VALUES
(18, 1, 2, 'Green', NULL, '#00FF00', '2021-10-27 08:55:51', '2021-10-27 08:55:51'),
(19, 1, 2, 'Red', NULL, '#ff0000', '2021-10-27 08:55:51', '2021-10-27 08:55:51'),
(20, 2, 2, 'Small', NULL, '22X12X17CM', '2021-10-27 08:55:51', '2021-10-27 08:55:51'),
(21, 2, 2, 'Medium', NULL, '31X14X26CM', '2021-10-27 08:55:51', '2021-10-27 08:55:51'),
(22, 2, 2, 'Big', NULL, '35X13X29CM', '2021-10-27 08:55:51', '2021-10-27 08:55:51');

-- --------------------------------------------------------

--
-- Table structure for table `attribute_product`
--

CREATE TABLE `attribute_product` (
  `attribute_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attribute_product`
--

INSERT INTO `attribute_product` (`attribute_id`, `product_id`, `created_at`, `updated_at`) VALUES
(2, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 = activate, 0 = deactivate',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_categories`
--

INSERT INTO `blog_categories` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Fashion', 1, '2021-10-20 23:04:40', '2021-10-20 23:04:40'),
(2, ' Food Habit', 1, '2021-10-20 23:04:40', '2021-10-20 23:04:40'),
(3, ' Take Care', 1, '2021-10-20 23:04:40', '2021-10-20 23:04:40');

-- --------------------------------------------------------

--
-- Table structure for table `blog_posts`
--

CREATE TABLE `blog_posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0 = unpublish, 1 = publish',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_post_comment_settings`
--

CREATE TABLE `blog_post_comment_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL COMMENT 'if this column is null means this row is a main category, and not null mean sub-category of pro category',
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 = activated and 0 = deactivated',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `name`, `icon`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Men\'s Fashion', '/upload/categories/16347928561tj7z2DAC.png', 'men\'s_fashion_1634792856', 1, '2021-10-20 23:07:36', '2021-10-20 23:07:36'),
(2, 1, 'Shirts', '/upload/categories/1634792883nizc6dDAC.png', 'shirts_1634792883', 1, '2021-10-20 23:08:03', '2021-10-20 23:08:03'),
(3, 1, 'Pants', '/upload/categories/1634792902yw6odqDAC.png', 'pants_1634792902', 1, '2021-10-20 23:08:22', '2021-10-20 23:08:22'),
(4, 1, 'Shoes', '/upload/categories/1634792924k2m8pgDAC.png', 'shoes_1634792924', 1, '2021-10-20 23:08:44', '2021-10-20 23:08:44'),
(5, NULL, 'Women\'s Fashion', '/upload/categories/1634792943vbaeh0DAC.png', 'women\'s_fashion_1634792943', 1, '2021-10-20 23:09:03', '2021-10-20 23:09:03'),
(6, NULL, 'Crockeries', '/upload/categories/1634792961xvmdfqDAC.png', 'crockeries_1634792961', 1, '2021-10-20 23:09:21', '2021-10-20 23:09:21'),
(7, NULL, 'Mobiles', '/upload/categories/1634792981y4i7pjDAC.png', 'mobiles_1634792981', 1, '2021-10-20 23:09:41', '2021-10-20 23:09:41'),
(8, NULL, 'Electronics', '/upload/categories/16347929970irjq6DAC.png', 'electronics_1634792997', 1, '2021-10-20 23:09:57', '2021-10-20 23:09:57'),
(9, NULL, 'Food &amp; Beverage', '/upload/categories/1634793016vhai60DAC.png', 'food_&amp;_beverage_1634793016', 1, '2021-10-20 23:10:16', '2021-10-20 23:10:16'),
(10, 6, 'Ceramics Item', '/upload/categories/1634793092wc24gkDAC.png', 'ceramics_item_1634793092', 1, '2021-10-20 23:11:32', '2021-10-20 23:11:32'),
(11, 6, 'Melamine Item', '/upload/categories/1634793143k4jvi0DAC.png', 'melamine_item_1634793171', 1, '2021-10-20 23:12:23', '2021-10-20 23:12:51'),
(12, 6, 'Drinking Glass', '/upload/categories/1634793156o52lskDAC.png', 'drinking_glass_1634793186', 1, '2021-10-20 23:12:36', '2021-10-20 23:13:06'),
(13, 8, 'Home Electronics', '/upload/categories/16347932442emwloDAC.png', 'home_electronics_1634793244', 1, '2021-10-20 23:14:04', '2021-10-20 23:14:04'),
(14, 8, 'Kitchen Electronics', '/upload/categories/1634793264ea36zlDAC.png', 'kitchen_electronics_1634793264', 1, '2021-10-20 23:14:24', '2021-10-20 23:14:24'),
(15, 8, 'Commercial Electronics', '/upload/categories/1634793282ydlvswDAC.png', 'commercial_electronics_1634793282', 1, '2021-10-20 23:14:42', '2021-10-20 23:14:42'),
(16, 9, 'First Food', '/upload/categories/16347933292cn0tyDAC.png', 'first_food_1634793329', 1, '2021-10-20 23:15:29', '2021-10-20 23:15:29'),
(17, 9, 'Beverage', '/upload/categories/1634793352tna29gDAC.png', 'beverage_1634793352', 1, '2021-10-20 23:15:52', '2021-10-20 23:15:52'),
(18, 9, 'Traditional Food', '/upload/categories/1634793375gjo7fzDAC.png', 'traditional_food_1634793375', 1, '2021-10-20 23:16:15', '2021-10-20 23:16:15'),
(19, 7, 'Android Phones', '/upload/categories/1634793400un9gdhDAC.png', 'android_phones_1634793400', 1, '2021-10-20 23:16:40', '2021-10-20 23:16:40'),
(20, 7, 'iphone', '/upload/categories/16347934147yakb3DAC.png', 'iphone_1634793414', 1, '2021-10-20 23:16:54', '2021-10-20 23:16:54'),
(21, 7, 'Others', '/upload/categories/1634793431osv7xwDAC.png', 'others_1634793431', 1, '2021-10-20 23:17:11', '2021-10-20 23:17:11'),
(22, 5, 'Tops', '/upload/categories/1634793447n7sxyaDAC.png', 'tops_1634793447', 1, '2021-10-20 23:17:27', '2021-10-20 23:17:27'),
(23, 5, 'Bags', '/upload/categories/1634793462qvyh6wDAC.png', 'bags_1634793462', 1, '2021-10-20 23:17:42', '2021-10-20 23:17:42'),
(24, 5, 'Shoes', '/upload/categories/1634793480hetkwlDAC.png', 'shoes_1634793480', 1, '2021-10-20 23:18:00', '2021-10-20 23:18:00'),
(25, 12, 'Wine Glass', NULL, 'wine_glass_1635343431', 1, '2021-10-27 08:03:51', '2021-10-27 08:03:51');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `digital_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `currency`, `digital_code`, `symbol`, `created_at`, `updated_at`) VALUES
(1, 'Taka', 'BDT', '050', '৳', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(2, 'Indian Rupee', 'INR', '356', '₹', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(3, 'Pakistan Rupee', 'PKR', '586', '₨', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(4, 'Euro', 'EUR', '840', '€', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(5, 'US Dollar', 'USD', '978', '$', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(6, 'Yuan', 'CNY', '156', '¥', '2021-10-20 22:28:53', '2021-10-20 22:28:53');

-- --------------------------------------------------------

--
-- Table structure for table `district_lists`
--

CREATE TABLE `district_lists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `district_lists`
--

INSERT INTO `district_lists` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Barguna', '2021-10-20 22:28:48', '2021-10-20 22:28:48'),
(2, 'Barisal', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(3, 'Bhola', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(4, 'Jhalokati', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(5, 'Patuakhali', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(6, 'Pirojpur', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(7, 'Bandarbant', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(8, 'Brahmanbaria', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(9, 'Chandpur', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(10, 'Chattogram', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(11, 'Comilla', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(12, 'Cox\'sBazar', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(13, 'Feni', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(14, 'Khagrachhari', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(15, 'Lakshmipur', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(16, 'Noakhali', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(17, 'Rangamati', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(18, 'Dhaka', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(19, 'Faridpur', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(20, 'Gazipur', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(21, 'Gopalganj', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(22, 'Kishoreganj', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(23, 'Madaripur', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(24, 'Manikganj', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(25, 'Kishoreganj', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(26, 'Narayanganj', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(27, 'Narsingdi', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(28, 'Rajbari', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(29, 'Shariatpur', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(30, 'Tangail', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(31, 'Bagerhat', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(32, 'Chuadanga', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(33, 'Jessore', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(34, 'Jhenaidah', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(35, 'Khulna', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(36, 'Kushtia', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(37, 'Magura', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(38, 'Meherpur', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(39, 'Narail', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(40, 'Satkhira', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(41, 'Jamalpur', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(42, 'Mymensingh', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(43, 'Netrokona', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(44, 'Sherpur', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(45, 'Bogura', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(46, 'Joypurhat', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(47, 'Naogaon', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(48, 'Natore', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(49, 'Chapainawabganj', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(50, 'Pabna', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(51, 'Rajshahi', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(52, 'Sirajganj', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(53, 'Dinajpur', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(54, 'Gaibandha', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(55, 'Kurigram', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(56, 'Lalmonirhat', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(57, 'Nilphamari', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(58, 'Panchagarh', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(59, 'Rangpur', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(60, 'Thakurgaon', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(61, 'Habiganj', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(62, 'Moulvibazar', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(63, 'Sunamganj', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(64, 'Sylhet', '2021-10-20 22:28:53', '2021-10-20 22:28:53');

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
-- Table structure for table `general_settings`
--

CREATE TABLE `general_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `site_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_keyword` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_map` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `favicon` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `site_tag_image` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `general_settings`
--

INSERT INTO `general_settings` (`id`, `site_name`, `meta_keyword`, `meta_description`, `location_map`, `logo`, `favicon`, `site_tag_image`, `created_at`, `updated_at`) VALUES
(1, 'E Commerce Admin', 'online shopping', 'This is a online e-commerce site....', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3648.8895533356776!2d90.2446309147299!3d23.858055384536428!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3755ebdf5e37cba3%3A0x3989ef1f96f1d277!2sBadda%20Government%20Primary%20School!5e0!3m2!1sen!2sbd!4v1629040760976!5m2!1sen!2sbd', '/upload/settings/1634792112o69lu5DAC.png', '/upload/settings/1634792161te3y91DAC.png', '/upload/settings/163560706736hxn4DAC.png', '2021-10-20 22:41:24', '2021-10-30 09:17:47');

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2020_05_21_100000_create_teams_table', 1),
(7, '2020_05_21_200000_create_team_user_table', 1),
(8, '2020_05_21_300000_create_team_invitations_table', 1),
(9, '2021_06_24_052433_create_district_lists_table', 1),
(10, '2021_06_24_052606_create_thana_lists_table', 1),
(11, '2021_06_24_052646_create_post_office_lists_table', 1),
(12, '2021_10_05_235130_create_sessions_table', 1),
(13, '2021_10_06_003109_create_profiles_table', 1),
(14, '2021_10_06_003316_create_addresses_table', 1),
(15, '2021_10_07_020246_create_general_settings_table', 1),
(16, '2021_10_08_050942_create_suppliers_table', 1),
(17, '2021_10_10_004654_create_blog_categories_table', 1),
(18, '2021_10_10_235317_create_social_media_links_table', 1),
(19, '2021_10_11_002824_create_blog_posts_table', 1),
(20, '2021_10_11_044526_create_blog_post_comment_settings_table', 1),
(21, '2021_10_13_005204_create_categories_table', 1),
(22, '2021_10_17_042150_create_products_table', 1),
(23, '2021_10_17_042355_create_attributes_table', 1),
(24, '2021_10_17_042444_create_attribute_items_table', 1),
(25, '2021_10_17_043257_create_product_images_table', 1),
(26, '2021_10_17_044750_creat_product_supplier_table', 1),
(27, '2021_10_17_045832_creat__attribute_product_table', 1),
(28, '2021_10_17_053403_create_currencies_table', 1),
(30, '2021_10_31_094142_create_sliders_table', 2);

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
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_office_lists`
--

CREATE TABLE `post_office_lists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `district_list_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_office_lists`
--

INSERT INTO `post_office_lists` (`id`, `district_list_id`, `name`, `post_code`, `created_at`, `updated_at`) VALUES
(1, 1, 'Amtali', '8710', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(2, 1, 'Bamna', '8730', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(3, 1, 'Barguna Sadar', '8700', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(4, 1, 'Nali Bandar', '8701', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(5, 1, 'Betagi', '8740', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(6, 1, 'Darul Ulam', '8741', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(7, 1, 'Kakchira', '8721', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(8, 1, 'Patharghata', '8720', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(9, 2, 'Agailzhara', '8240', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(10, 2, 'Gaila', '8241', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(11, 2, 'Paisarhat', '8242', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(12, 2, 'Babuganj', '8210', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(13, 2, 'Barishal Cadet', '8216', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(14, 2, 'Chandpasha', '8212', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(15, 2, 'Madhabpasha', '8213', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(16, 2, 'Nizamuddin College', '8215', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(17, 2, 'Rahamatpur', '8211', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(18, 2, 'Thakur Mallik', '8214', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(19, 2, 'Barajalia', '8260', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(20, 2, 'Osman Manjil', '8261', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(21, 2, 'Barishal Sadar', '8200', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(22, 2, 'Bukhainagar', '8201', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(23, 2, 'Jaguarhat', '8206', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(24, 2, 'Kashipur', '8205', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(25, 2, 'Patang', '8204', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(26, 2, 'Saheberhat', '8202', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(27, 2, 'Sugandia', '8203', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(28, 2, 'Batajor', '8233', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(29, 2, 'Gouranadi', '8230', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(30, 2, 'Kashemabad', '8232', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(31, 2, 'Tarki Bandar', '8231', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(32, 2, 'Langutia', '8274', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(33, 2, 'Laskarpur', '8271', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(34, 2, 'Mahendiganj', '8270', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(35, 2, 'Nalgora', '8273', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(36, 2, 'Ulania', '8272', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(37, 2, 'Charkalekhan', '8252', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(38, 2, 'Kazirchar', '8251', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(39, 2, 'Muladi', '8250', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(40, 2, 'Charamandi', '8281', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(41, 2, 'kalaskati', '8284', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(42, 2, 'Padri Shibpur', '8282', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(43, 2, 'Sahebganj', '8280', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(44, 2, 'Shialguni', '8283', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(45, 2, 'Dakuarhat', '8223', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(46, 2, 'Dhamura', '8221', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(47, 2, 'Jugirkanda', '8222', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(48, 2, 'Shikarpur', '8224', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(49, 2, 'Uzirpur', '8220', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(50, 3, 'Bhola Sadar', '8300', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(51, 3, 'Joynagar', '8301', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(52, 3, 'Borhanuddin UPO', '8320', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(53, 3, 'Mirzakalu', '8321', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(54, 3, 'Charfashion', '8340', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(55, 3, 'Dularhat', '8341', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(56, 3, 'Keramatganj', '8342', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(57, 3, 'Doulatkhan', '8310', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(58, 3, 'Hajipur', '8311', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(59, 3, 'Hajirhat', '8360', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(60, 3, 'Hatshoshiganj', '8350', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(61, 3, 'Daurihat', '8331', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(62, 3, 'Gazaria', '8332', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(63, 3, 'Lalmohan UPO', '8330', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(64, 4, 'Baukathi', '8402', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(65, 4, 'Gabha', '8403', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(66, 4, 'Jhalokathi Sadar', '8400', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(67, 4, 'Nabagram', '8401', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(68, 4, 'Shekherhat', '8404', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(69, 4, 'Amua', '8431', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(70, 4, 'Kathalia', '8430', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(71, 4, 'Niamatee', '8432', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(72, 4, 'Shoulajalia', '8433', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(73, 4, 'Beerkathi', '8421', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(74, 4, 'Nalchhiti', '8420', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(75, 4, 'Rajapur', '8410', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(76, 5, 'Bagabandar', '8621', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(77, 5, 'Bauphal', '8620', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(78, 5, 'Birpasha', '8622', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(79, 5, 'Kalaia', '8624', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(80, 5, 'Kalishari', '8623', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(81, 5, 'Dashmina', '8630', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(82, 5, 'Galachipa', '8640', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(83, 5, 'Gazipur Bandar', '8641', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(84, 5, 'Khepupara', '8650', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(85, 5, 'Mahipur', '8651', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(86, 5, 'Dumkee', '8602', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(87, 5, 'Moukaran', '8601', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(88, 5, 'Patuakhali Sadar', '8600', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(89, 5, 'Rahimabad', '8603', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(90, 5, 'Subidkhali', '8610', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(91, 6, 'Banaripara', '8530', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(92, 6, 'Chakhar', '8531', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(93, 6, 'Bhandaria', '8550', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(94, 6, 'Dhaoa', '8552', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(95, 6, 'Kanudashkathi', '8551', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(96, 6, 'Jolagati', '8513', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(97, 6, 'Joykul', '8512', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(98, 6, 'Kaukhali', '8510', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(99, 6, 'Keundia', '8511', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(100, 6, 'Betmor Natun Hat', '8565', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(101, 6, 'Gulishakhali', '8563', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(102, 6, 'Halta', '8562', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(103, 6, 'Mathbaria', '8560', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(104, 6, 'Shilarganj', '8566', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(105, 6, 'Tiarkhali', '8564', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(106, 6, 'Tushkhali', '8561', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(107, 6, 'Nazirpur', '8540', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(108, 6, 'Sriramkathi', '8541', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(109, 6, 'Hularhat', '8501', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(110, 6, 'Parerhat', '8502', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(111, 6, 'Pirojpur Sadar', '8500', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(112, 6, 'Darus Sunnat', '8521', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(113, 6, 'Jalabari', '8523', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(114, 6, 'Kaurikhara', '8522', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(115, 6, 'Swarupkathi', '8520', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(116, 7, 'Alikadam', '4650', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(117, 7, 'Bandarban Sadar', '4600', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(118, 7, 'Naikhong', '4660', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(119, 7, 'Roanchhari', '4610', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(120, 7, 'Ruma', '4620', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(121, 7, 'Lama', '4641', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(122, 7, 'Thanchi', '4630', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(123, 8, 'Akhaura', '3450', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(124, 8, 'Azampur', '3451', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(125, 8, 'Gangasagar', '3452', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(126, 8, 'Banchharampur', '3420', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(127, 8, 'Brahamanbaria Sadar', '3400', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(128, 8, 'Talshahar', '3401', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(129, 8, 'Ashuganj', '3402', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(130, 8, 'Ashuganj Share', '3403', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(131, 8, 'Poun', '3404', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(132, 8, 'Kasba', '3460', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(133, 8, 'Kuti', '3461', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(134, 8, 'Chandidar', '3462', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(135, 8, 'Chargachh', '3463', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(136, 8, 'Gopinathpur', '3464', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(137, 8, 'Nabinagar', '3410', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(138, 8, 'Laubfatehpur', '3411', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(139, 8, 'Rasullabad', '3412', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(140, 8, 'Shamgram', '3413', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(141, 8, 'Ratanpur', '3414', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(142, 8, 'Shahapur', '3415', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(143, 8, 'Kaitala', '3417', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(144, 8, 'Salimganj', '3418', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(145, 8, 'Jibanganj', '3419', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(146, 8, 'Nasirnagar', '3440', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(147, 8, 'Fandauk', '3441', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(148, 8, 'Sarail', '3430', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(149, 8, 'Shahbajpur', '3431', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(150, 8, 'Chandura', '3432', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(151, 9, 'Baburhat', '3602', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(152, 9, 'Chandpur Sadar', '3600', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(153, 9, 'Puranbazar', '3601', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(154, 9, 'Sahatali', '3603', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(155, 9, 'Chandra', '3651', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(156, 9, 'Faridganj', '3650', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(157, 9, 'Gridkaliandia', '3653', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(158, 9, 'Islampur Shah Isain', '3655', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(159, 9, 'Rampurbazar', '3654', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(160, 9, 'Rupsha', '3652', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(161, 9, 'Bolakhal', '3611', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(162, 9, 'Hajiganj', '3610', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(163, 9, 'Gandamara', '3661', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(164, 9, 'Hayemchar', '3660', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(165, 9, 'Kachua', '3630', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(166, 9, 'Pak Shrirampur', '3631', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(167, 9, 'Rahima Nagar', '3632', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(168, 9, 'Shachar', '3633', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(169, 9, 'Kalipur', '3642', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(170, 9, 'Matlobganj', '3640', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(171, 9, 'Mohanpur', '3641', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(172, 9, 'Chotoshi', '3623', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(173, 9, 'Islamia Madrasha', '3624', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(174, 9, 'Khilabazar', '3621', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(175, 9, 'Pashchim Kherihar Al', '3622', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(176, 9, 'Shahrasti', '3620', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(177, 10, 'Anowara', '4376', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(178, 10, 'Battali', '4378', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(179, 10, 'Paroikora', '4377', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(180, 10, 'Boalkhali', '4366', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(181, 10, 'Charandwip', '4369', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(182, 10, 'Iqbal Park', '4365', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(183, 10, 'Kadurkhal', '4368', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(184, 10, 'Kanungopara', '4363', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(185, 10, 'Sakpura', '4367', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(186, 10, 'Saroatoli', '4364', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(187, 10, 'Al- Amin Baria Madra', '4221', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(188, 10, 'Amin Jute Mills', '4211', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(189, 10, 'Anandabazar', '4215', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(190, 10, 'Bayezid Bostami', '4210', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(191, 10, 'Chandgaon', '4212', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(192, 10, 'Chawkbazar', '4203', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(193, 10, 'Chitt. Cantonment', '4220', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(194, 10, 'Chitt. Customs Acca', '4219', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(195, 10, 'Chitt. Politechnic In', '4209', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(196, 10, 'Chitt. Sailers Colon', '4218', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(197, 10, 'Chittagong Airport', '4205', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(198, 10, 'Chittagong Bandar', '4100', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(199, 10, 'Chittagong GPO', '4000', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(200, 10, 'Export Processing', '4223', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(201, 10, 'Firozshah', '4207', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(202, 10, 'Halishahar', '4216', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(203, 10, 'Halishshar', '4225', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(204, 10, 'Jalalabad', '4214', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(205, 10, 'Jaldia Merine Accade', '4206', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(206, 10, 'Middle Patenga', '4222', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(207, 10, 'Mohard', '4208', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(208, 10, 'North Halishahar', '4226', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(209, 10, 'North Katuli', '4217', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(210, 10, 'Pahartoli', '4202', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(211, 10, 'Patenga', '4204', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(212, 10, 'Rampura TSO', '4224', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(213, 10, 'Wazedia', '4213', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(214, 10, 'Barma', '4383', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(215, 10, 'Dohazari', '4382', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(216, 10, 'East Joara', '4380', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(217, 10, 'Gachbaria', '4381', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(218, 10, 'Bhandar Sharif', '4352', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(219, 10, 'Fatikchhari', '4350', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(220, 10, 'Harualchhari', '4354', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(221, 10, 'Najirhat', '4353', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(222, 10, 'Nanupur', '4351', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(223, 10, 'Narayanhat', '4355', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(224, 10, 'Chitt.University', '4331', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(225, 10, 'Fatahabad', '4335', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(226, 10, 'Gorduara', '4332', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(227, 10, 'Hathazari', '4330', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(228, 10, 'Katirhat', '4333', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(229, 10, 'Madrasa', '4339', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(230, 10, 'Mirzapur', '4334', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(231, 10, 'Nuralibari', '4337', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(232, 10, 'Yunus Nagar', '4338', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(233, 10, 'Banigram', '4393', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(234, 10, 'Gunagari', '4392', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(235, 10, 'Jaldi', '4390', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(236, 10, 'Khan Bahadur', '4391', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(237, 10, 'Chunti', '4398', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(238, 10, 'Lohagara', '4396', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(239, 10, 'Padua', '4397', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(240, 10, 'Abutorab', '4321', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(241, 10, 'Azampur', '4325', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(242, 10, 'Bharawazhat', '4323', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(243, 10, 'Darrogahat', '4322', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(244, 10, 'Joarganj', '4324', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(245, 10, 'Korerhat', '4327', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(246, 10, 'Mirsharai', '4320', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(247, 10, 'Mohazanhat', '4328', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(248, 10, 'Budhpara', '4371', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(249, 10, 'Patia Head Office', '4370', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(250, 10, 'Dhamair', '4361', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(251, 10, 'Rangunia', '4360', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(252, 10, 'B.I.T Post Office', '4349', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(253, 10, 'Beenajuri', '4341', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(254, 10, 'Dewanpur', '4347', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(255, 10, 'Fatepur', '4345', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(256, 10, 'Gahira', '4343', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(257, 10, 'Guzra Noapara', '4346', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(258, 10, 'jagannath Hat', '4344', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(259, 10, 'Kundeshwari', '4342', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(260, 10, 'Mohamuni', '4348', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(261, 10, 'Rouzan', '4340', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(262, 10, 'Sandwip', '4300', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(263, 10, 'Shiberhat', '4301', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(264, 10, 'Urirchar', '4302', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(265, 10, 'Baitul Ijjat', '4387', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(266, 10, 'Bazalia', '4388', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(267, 10, 'Satkania', '4386', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(268, 10, 'Barabkunda', '4312', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(269, 10, 'Baroidhala', '4311', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(270, 10, 'Bawashbaria', '4313', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(271, 10, 'Bhatiari', '4315', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(272, 10, 'Fouzdarhat', '4316', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(273, 10, 'Jafrabad', '4317', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(274, 10, 'Kumira', '4314', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(275, 10, 'Sitakunda', '4310', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(276, 11, 'Barura', '3560', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(277, 11, 'Murdafarganj', '3562', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(278, 11, 'Poyalgachha', '3561', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(279, 11, 'Brahmanpara', '3526', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(280, 11, 'Burichang', '3520', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(281, 11, 'Maynamoti bazar', '3521', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(282, 11, 'Chandia', '3510', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(283, 11, 'Madhaiabazar', '3511', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(284, 11, 'Batisa', '3551', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(285, 11, 'Chiora', '3552', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(286, 11, 'Chouddagram', '3550', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(287, 11, 'Comilla Contoment', '3501', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(288, 11, 'Comilla Sadar', '3500', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(289, 11, 'Courtbari', '3503', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(290, 11, 'Halimanagar', '3502', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(291, 11, 'Suaganj', '3504', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(292, 11, 'Dashpara', '3518', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(293, 11, 'Daudkandi', '3516', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(294, 11, 'Eliotganj', '3519', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(295, 11, 'Gouripur', '3517', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(296, 11, 'Barashalghar', '3532', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(297, 11, 'Davidhar', '3530', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(298, 11, 'Dhamtee', '3533', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(299, 11, 'Gangamandal', '3531', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(300, 11, 'Homna', '3546', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(301, 11, 'Bipulasar', '3572', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(302, 11, 'Laksam', '3570', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(303, 11, 'Lakshamanpur', '3571', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(304, 11, 'Chhariabazar', '3582', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(305, 11, 'Dhalua', '3581', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(306, 11, 'Gunabati', '3583', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(307, 11, 'Langalkot', '3580', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(308, 11, 'Bangra', '3543', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(309, 11, 'Companyganj', '3542', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(310, 11, 'Muradnagar', '3540', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(311, 11, 'Pantibazar', '3545', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(312, 11, 'Ramchandarpur', '3541', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(313, 11, 'Sonakanda', '3544', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(314, 12, 'Badarkali', '4742', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(315, 12, 'Chiringga', '4740', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(316, 12, 'Chiringga S.O', '4741', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(317, 12, 'Malumghat', '4743', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(318, 12, 'Coxs Bazar Sadar', '4700', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(319, 12, 'Eidga', '4702', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(320, 12, 'Zhilanja', '4701', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(321, 12, 'Gorakghat', '4710', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(322, 12, 'Kutubdia', '4720', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(323, 12, 'Ramu', '4730', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(324, 12, 'Hnila', '4761', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(325, 12, 'St.Martin', '4762', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(326, 12, 'Teknaf', '4760', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(327, 12, 'Ukhia', '4750', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(328, 13, 'Chhagalnaia', '3910', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(329, 13, 'Daraga Hat', '3912', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(330, 13, 'Maharajganj', '3911', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(331, 13, 'Puabashimulia', '3913', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(332, 13, 'Chhilonia', '3922', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(333, 13, 'Dagondhuia', '3920', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(334, 13, 'Dudmukha', '3921', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(335, 13, 'Rajapur', '3923', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(336, 13, 'Fazilpur', '3901', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(337, 13, 'Feni Sadar', '3900', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(338, 13, 'Laskarhat', '3903', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(339, 13, 'Sharshadie', '3902', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(340, 13, 'Fulgazi', '3942', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(341, 13, 'Munshirhat', '3943', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(342, 13, 'Pashurampur', '3940', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(343, 13, 'Shuarbazar', '3941', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(344, 13, 'Ahmadpur', '3932', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(345, 13, 'Kazirhat', '3933', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(346, 13, 'Motiganj', '3931', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(347, 13, 'Sonagazi', '3930', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(348, 14, 'Diginala', '4420', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(349, 14, 'Khagrachhari Sadar', '4400', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(350, 14, 'Laxmichhari', '4470', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(351, 14, 'Mahalchhari', '4430', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(352, 14, 'Manikchhari', '4460', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(353, 14, 'Matiranga', '4450', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(354, 14, 'Panchhari', '4410', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(355, 14, 'Ramghar Head Office', '4440', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(356, 15, 'Char Alexgander', '3730', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(357, 15, 'Hajirghat', '3731', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(358, 15, 'Ramgatirhat', '3732', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(359, 15, 'Amani Lakshimpur', '3709', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(360, 15, 'Bhabaniganj', '3702', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(361, 15, 'Chandraganj', '3708', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(362, 15, 'Choupalli', '3707', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(363, 15, 'Dalal Bazar', '3701', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(364, 15, 'Duttapara', '3706', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(365, 15, 'Keramatganj', '3704', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(366, 15, 'Lakshimpur Sadar', '3700', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(367, 15, 'Mandari', '3703', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(368, 15, 'Rupchara', '3705', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(369, 15, 'Alipur', '3721', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(370, 15, 'Dolta', '3725', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(371, 15, 'Kanchanpur', '3723', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(372, 15, 'Naagmud', '3724', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(373, 15, 'Panpara', '3722', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(374, 15, 'Ramganj', '3720', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(375, 15, 'Bhuabari', '3714', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(376, 15, 'Haydarganj', '3713', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(377, 15, 'Nagerdighirpar', '3712', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(378, 15, 'Rakhallia', '3711', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(379, 15, 'Raypur', '3710', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(380, 16, 'Basur Hat', '3850', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(381, 16, 'Charhajari', '3851', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(382, 16, 'Alaiarpur', '3831', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(383, 16, 'Amisha Para', '3847', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(384, 16, 'Banglabazar', '3822', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(385, 16, 'Bazra', '3824', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(386, 16, 'Begumganj', '3820', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(387, 16, 'Bhabani Jibanpur', '3837', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(388, 16, 'Choumohani', '3821', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(389, 16, 'Dauti', '3843', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(390, 16, 'Durgapur', '3848', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(391, 16, 'Gopalpur', '3828', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(392, 16, 'Jamidar Hat', '3825', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(393, 16, 'Joyag', '3844', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(394, 16, 'Joynarayanpur', '3829', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(395, 16, 'Khalafat Bazar', '3833', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(396, 16, 'Khalishpur', '3842', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(397, 16, 'Maheshganj', '3838', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(398, 16, 'Mir Owarishpur', '3823', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(399, 16, 'Nadona', '3839', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(400, 16, 'Nandiapara', '3841', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(401, 16, 'Oachhekpur', '3835', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(402, 16, 'Rajganj', '3834', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(403, 16, 'Sonaimuri', '3827', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(404, 16, 'Tangirpar', '3832', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(405, 16, 'Thanar Hat', '3845', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(406, 16, 'Bansa Bazar', '3879', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(407, 16, 'Bodalcourt', '3873', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(408, 16, 'Chatkhil', '3870', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(409, 16, 'Dosh Gharia', '3878', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(410, 16, 'Karihati', '3877', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(411, 16, 'Khilpara', '3872', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(412, 16, 'Palla', '3871', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(413, 16, 'Rezzakpur', '3874', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(414, 16, 'Sahapur', '3881', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(415, 16, 'Sampara', '3882', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(416, 16, 'Shingbahura', '3883', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(417, 16, 'Solla', '3875', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(418, 16, 'Afazia', '3891', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(419, 16, 'Hatiya', '3890', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(420, 16, 'Tamoraddi', '3892', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(421, 16, 'Chaprashir Hat', '3811', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(422, 16, 'Char Jabbar', '3812', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(423, 16, 'Charam Tua', '3809', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(424, 16, 'Din Monir Hat', '3803', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(425, 16, 'Kabirhat', '3807', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(426, 16, 'Khalifar Hat', '3808', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(427, 16, 'Mriddarhat', '3806', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(428, 16, 'Noakhali College', '3801', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(429, 16, 'Noakhali Sadar', '3800', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(430, 16, 'Pak Kishoreganj', '3804', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(431, 16, 'Sonapur', '3802', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(432, 16, 'Beezbag', '3862', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(433, 16, 'Chatarpaia', '3864', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(434, 16, 'Kallyandi', '3861', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(435, 16, 'Kankirhat', '3863', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(436, 16, 'Senbag', '3860', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(437, 16, 'T.P. Lamua', '3865', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(438, 17, 'Barakal', '4570', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(439, 17, 'Bilaichhari', '4550', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(440, 17, 'Jarachhari', '4560', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(441, 17, 'Betbunia', '4511', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(442, 17, 'Kalampati', '4510', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(443, 17, 'Chandraghona', '4531', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(444, 17, 'Kaptai', '4530', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(445, 17, 'Kaptai Nuton Bazar', '4533', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(446, 17, 'Kaptai Project', '4532', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(447, 17, 'Longachh', '4580', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(448, 17, 'Marishya', '4590', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(449, 17, 'Nanichhar', '4520', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(450, 17, 'Rajsthali', '4540', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(451, 17, 'Rangamati Sadar', '4500', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(452, 18, 'Demra', '1360', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(453, 18, 'Matuail', '1362', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(454, 18, 'Sarulia', '1361', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(455, 18, 'Dhaka CantonmentTSO', '1206', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(456, 18, 'Dhamrai', '1350', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(457, 18, 'Kamalpur', '1351', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(458, 18, 'Jigatala TSO', '1209', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(459, 18, 'Banani TSO', '1213', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(460, 18, 'Gulshan Model Town', '1212', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(461, 18, 'Dhania TSO', '1232', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(462, 18, 'Joypara', '1330', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(463, 18, 'Narisha', '1332', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(464, 18, 'Palamganj', '1331', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(465, 18, 'Ati', '1312', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(466, 18, 'Dhaka Jute Mills', '1311', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(467, 18, 'Kalatia', '1313', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(468, 18, 'Keraniganj', '1310', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(469, 18, 'KhilgaonTSO', '1219', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(470, 18, 'KhilkhetTSO', '1229', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(471, 18, 'Posta TSO', '1211', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(472, 18, 'Mirpur TSO', '1216', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(473, 18, 'Mohammadpur Housing', '1207', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(474, 18, 'Sangsad BhabanTSO', '1225', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(475, 18, 'BangabhabanTSO', '1222', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(476, 18, 'DilkushaTSO', '1223', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(477, 18, 'Agla', '1323', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(478, 18, 'Churain', '1325', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(479, 18, 'Daudpur', '1322', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(480, 18, 'Hasnabad', '1321', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(481, 18, 'Khalpar', '1324', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(482, 18, 'Nawabganj', '1320', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(483, 18, 'New Market TSO', '1205', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(484, 18, 'Dhaka GPO', '1000', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(485, 18, 'Shantinagr TSO', '1217', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(486, 18, 'Basabo TSO', '1214', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(487, 18, 'Amin Bazar', '1348', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(488, 18, 'Dairy Farm', '1341', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(489, 18, 'EPZ', '1349', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(490, 18, 'Jahangirnagar Univer', '1342', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(491, 18, 'Kashem Cotton Mills', '1346', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(492, 18, 'Rajfhulbaria', '1347', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(493, 18, 'Savar', '1340', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(494, 18, 'Savar Canttonment', '1344', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(495, 18, 'Saver P.A.T.C', '1343', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(496, 18, 'Shimulia', '1345', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(497, 18, 'Dhaka Sadar HO', '1100', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(498, 18, 'Gendaria TSO', '1204', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(499, 18, 'Wari TSO', '1203', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(500, 18, 'Tejgaon TSO', '1215', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(501, 18, 'Dhaka Politechnic', '1208', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(502, 18, 'Uttara Model TwonTSO', '1230', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(503, 19, 'Alfadanga', '7870', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(504, 19, 'Bhanga', '7830', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(505, 19, 'Boalmari', '7860', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(506, 19, 'Rupatpat', '7861', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(507, 19, 'Charbadrashan', '7810', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(508, 19, 'Ambikapur', '7802', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(509, 19, 'Baitulaman Politecni', '7803', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(510, 19, 'Faridpur Sadar', '7800', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(511, 19, 'Kanaipur', '7801', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(512, 19, 'Kamarkali', '7851', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(513, 19, 'Madukhali', '7850', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(514, 19, 'Nagarkanda', '7840', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(515, 19, 'Talma', '7841', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(516, 19, 'Bishwa jaker Manjil', '7822', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(517, 19, 'Hat Krishapur', '7821', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(518, 19, 'Sadarpur', '7820', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(519, 19, 'Shriangan', '7804', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(520, 20, 'B.O.F', '1703', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(521, 20, 'B.R.R', '1701', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(522, 20, 'Chandna', '1702', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(523, 20, 'Gazipur Sadar', '1700', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(524, 20, 'National University', '1704', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(525, 20, 'Kaliakaar', '1750', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(526, 20, 'Safipur', '1751', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(527, 20, 'Kaliganj', '1720', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(528, 20, 'Pubail', '1721', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(529, 20, 'Santanpara', '1722', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(530, 20, 'Vaoal Jamalpur', '1723', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(531, 20, 'kapashia', '1730', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(532, 20, 'Ershad Nagar', '1712', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(533, 20, 'Monnunagar', '1710', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(534, 20, 'Nishat Nagar', '1711', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(535, 20, 'Barmi', '1743', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(536, 20, 'Bashamur', '1747', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(537, 20, 'Boubi', '1748', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(538, 20, 'Kawraid', '1745', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(539, 20, 'Satkhamair', '1744', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(540, 20, 'Sreepur', '1740', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(541, 20, 'Rajendrapur', '1741', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(542, 20, 'Rajendrapur Canttome', '1742', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(543, 21, 'Barfa', '8102', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(544, 21, 'Chandradighalia', '8013', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(545, 21, 'Gopalganj Sadar', '8100', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(546, 21, 'Ulpur', '8101', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(547, 21, 'Jonapur', '8133', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(548, 21, 'Kashiani', '8130', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(549, 21, 'Ramdia College', '8131', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(550, 21, 'Ratoil', '8132', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(551, 21, 'Kotalipara', '8110', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(552, 21, 'Batkiamari', '8141', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(553, 21, 'Khandarpara', '8142', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(554, 21, 'Maksudpur', '8140', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(555, 21, 'Patgati', '8121', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(556, 21, 'Tungipara', '8120', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(557, 22, 'Bajitpur', '2336', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(558, 22, 'Laksmipur', '2338', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(559, 22, 'Sararchar', '2337', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(560, 22, 'Bhairab', '2350', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(561, 22, 'Hossenpur', '2320', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(562, 22, 'Itna', '2390', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(563, 22, 'Karimganj', '2310', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(564, 22, 'Gochhihata', '2331', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(565, 22, 'Katiadi', '2330', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(566, 22, 'Kishoreganj S.Mills', '2301', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(567, 22, 'Kishoreganj Sadar', '2300', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(568, 22, 'Maizhati', '2302', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(569, 22, 'Nilganj', '2303', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(570, 22, 'Chhoysuti', '2341', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(571, 22, 'Kuliarchar', '2340', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(572, 22, 'Abdullahpur', '2371', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(573, 22, 'MIthamoin', '2370', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(574, 22, 'Nikli', '2360', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(575, 22, 'Ostagram', '2380', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(576, 22, 'Pakundia', '2326', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(577, 22, 'Tarial', '2316', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(578, 23, 'Bahadurpur', '7932', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(579, 23, 'Barhamganj', '7930', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(580, 23, 'Nilaksmibandar', '7931', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(581, 23, 'Umedpur', '7933', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(582, 23, 'Kalkini', '7920', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(583, 23, 'Sahabrampur', '7921', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(584, 23, 'Charmugria', '7901', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(585, 23, 'Habiganj', '7903', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(586, 23, 'Kulpaddi', '7902', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(587, 23, 'Madaripur Sadar', '7900', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(588, 23, 'Mustafapur', '7904', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(589, 23, 'Khalia', '7911', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(590, 23, 'Rajoir', '7910', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(591, 24, 'Doulatpur', '1860', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(592, 24, 'Gheor', '1840', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(593, 24, 'Jhitka', '1831', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(594, 24, 'Lechhraganj', '1830', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(595, 24, 'Barangail', '1804', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(596, 24, 'Gorpara', '1802', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(597, 24, 'Mahadebpur', '1803', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(598, 24, 'Manikganj Bazar', '1801', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(599, 24, 'Manikganj Sadar', '1800', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(600, 24, 'Baliati', '1811', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(601, 24, 'Saturia', '1810', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(602, 24, 'Aricha', '1851', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(603, 24, 'Shibaloy', '1850', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(604, 24, 'Tewta', '1852', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(605, 24, 'Uthli', '1853', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(606, 24, 'Baira', '1821', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(607, 24, 'joymantop', '1822', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(608, 24, 'Singair', '1820', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(609, 25, 'Gajaria', '1510', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(610, 25, 'Hossendi', '1511', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(611, 25, 'Rasulpur', '1512', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(612, 25, 'Gouragonj', '1334', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(613, 25, 'Gouragonj', '1534', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(614, 25, 'Haldia SO', '1532', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(615, 25, 'Haridia', '1333', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(616, 25, 'Haridia DESO', '1533', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(617, 25, 'Korhati', '1531', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(618, 25, 'Lohajang', '1530', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(619, 25, 'Madini Mandal', '1335', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(620, 25, 'Medini Mandal EDSO', '1535', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(621, 25, 'Kathakhali', '1503', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(622, 25, 'Mirkadim', '1502', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(623, 25, 'Munshiganj Sadar', '1500', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(624, 25, 'Rikabibazar', '1501', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(625, 25, 'Ichapur', '1542', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(626, 25, 'Kola', '1541', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(627, 25, 'Malkha Nagar', '1543', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(628, 25, 'Shekher Nagar', '1544', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(629, 25, 'Sirajdikhan', '1540', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(630, 25, 'Baghra', '1557', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(631, 25, 'Barikhal', '1551', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(632, 25, 'Bhaggyakul', '1558', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(633, 25, 'Hashara', '1553', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(634, 25, 'Kolapara', '1554', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(635, 25, 'Kumarbhog', '1555', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(636, 25, 'Mazpara', '1552', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(637, 25, 'Srinagar', '1550', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(638, 25, 'Vaggyakul SO', '1556', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(639, 25, 'Bajrajugini', '1523', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(640, 25, 'Baligao', '1522', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(641, 25, 'Betkahat', '1521', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(642, 25, 'Dighirpar', '1525', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(643, 25, 'Hasail', '1524', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(644, 25, 'Pura', '1527', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(645, 25, 'Pura EDSO', '1526', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(646, 25, 'Tangibari', '1520', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(647, 26, 'Araihazar', '1450', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(648, 26, 'Gopaldi', '1451', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(649, 26, 'Baidder Bazar', '1440', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(650, 26, 'Bara Nagar', '1441', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(651, 26, 'Barodi', '1442', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(652, 26, 'Bandar', '1410', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(653, 26, 'BIDS', '1413', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(654, 26, 'D.C Mills', '1411', '2021-10-20 22:28:51', '2021-10-20 22:28:51');
INSERT INTO `post_office_lists` (`id`, `district_list_id`, `name`, `post_code`, `created_at`, `updated_at`) VALUES
(655, 26, 'Madanganj', '1414', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(656, 26, 'Nabiganj', '1412', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(657, 26, 'Fatulla Bazar', '1421', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(658, 26, 'Fatullah', '1420', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(659, 26, 'Narayanganj Sadar', '1400', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(660, 26, 'Bhulta', '1462', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(661, 26, 'Kanchan', '1461', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(662, 26, 'Murapara', '1464', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(663, 26, 'Nagri', '1463', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(664, 26, 'Rupganj', '1460', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(665, 26, 'Adamjeenagar', '1431', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(666, 26, 'LN Mills', '1432', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(667, 26, 'Siddirganj', '1430', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(668, 27, 'Belabo', '1640', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(669, 27, 'Hatirdia', '1651', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(670, 27, 'Katabaria', '1652', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(671, 27, 'Monohordi', '1650', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(672, 27, 'Karimpur', '1605', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(673, 27, 'Madhabdi', '1604', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(674, 27, 'Narsingdi College', '1602', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(675, 27, 'Narsingdi Sadar', '1600', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(676, 27, 'Panchdona', '1603', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(677, 27, 'UMC Jute Mills', '1601', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(678, 27, 'Char Sindhur', '1612', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(679, 27, 'Ghorashal', '1613', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(680, 27, 'Ghorashal Urea Facto', '1611', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(681, 27, 'Palash', '1610', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(682, 27, 'Bazar Hasnabad', '1631', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(683, 27, 'Radhaganj bazar', '1632', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(684, 27, 'Raypura', '1630', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(685, 27, 'Shibpur', '1620', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(686, 28, 'Baliakandi', '7730', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(687, 28, 'Nalia', '7731', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(688, 28, 'Mrigibazar', '7723', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(689, 28, 'Pangsha', '7720', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(690, 28, 'Ramkol', '7721', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(691, 28, 'Ratandia', '7722', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(692, 28, 'Goalanda', '7710', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(693, 28, 'Khankhanapur', '7711', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(694, 28, 'Rajbari Sadar', '7700', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(695, 29, 'Bhedorganj', '8030', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(696, 29, 'Damudhya', '8040', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(697, 29, 'Gosairhat', '8050', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(698, 29, 'Jajira', '8010', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(699, 29, 'Bhozeshwar', '8021', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(700, 29, 'Gharisar', '8022', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(701, 29, 'Kartikpur', '8024', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(702, 29, 'Naria', '8020', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(703, 29, 'Upshi', '8023', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(704, 29, 'Angaria', '8001', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(705, 29, 'Chikandi', '8002', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(706, 29, 'Shariatpur Sadar', '8000', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(707, 30, 'Basail', '1920', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(708, 30, 'Bhuapur', '1960', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(709, 30, 'Delduar', '1910', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(710, 30, 'Elasin', '1913', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(711, 30, 'Hinga Nagar', '1914', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(712, 30, 'Jangalia', '1911', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(713, 30, 'Lowhati', '1915', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(714, 30, 'Patharail', '1912', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(715, 30, 'D. Pakutia', '1982', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(716, 30, 'Dhalapara', '1983', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(717, 30, 'Ghatial', '1980', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(718, 30, 'Lohani', '1984', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(719, 30, 'Zahidganj', '1981', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(720, 30, 'Gopalpur', '1990', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(721, 30, 'Hemnagar', '1992', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(722, 30, 'Jhowail', '1991', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(723, 30, 'Ballabazar', '1973', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(724, 30, 'Elinga', '1974', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(725, 30, 'Kalihati', '1970', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(726, 30, 'Nagarbari', '1977', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(727, 30, 'Nagarbari SO', '1976', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(728, 30, 'Nagbari', '1972', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(729, 30, 'Palisha', '1975', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(730, 30, 'Rajafair', '1971', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(731, 30, 'Kashkawlia', '1930', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(732, 30, 'Dhobari', '1997', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(733, 30, 'Madhupur', '1996', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(734, 30, 'Gorai', '1941', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(735, 30, 'Jarmuki', '1944', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(736, 30, 'M.C. College', '1942', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(737, 30, 'Mirzapur', '1940', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(738, 30, 'Mohera', '1945', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(739, 30, 'Warri paikpara', '1943', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(740, 30, 'Dhuburia', '1937', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(741, 30, 'Nagarpur', '1936', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(742, 30, 'Salimabad', '1938', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(743, 30, 'Kochua', '1951', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(744, 30, 'Sakhipur', '1950', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(745, 30, 'Kagmari', '1901', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(746, 30, 'Korotia', '1903', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(747, 30, 'Purabari', '1904', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(748, 30, 'Santosh', '1902', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(749, 30, 'Tangail Sadar', '1900', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(750, 31, 'Bagerhat Sadar', '9300', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(751, 31, 'P.C College', '9301', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(752, 31, 'Rangdia', '9302', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(753, 31, 'Chalna Ankorage', '9350', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(754, 31, 'Mongla Port', '9351', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(755, 31, 'Barabaria', '9361', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(756, 31, 'Chitalmari', '9360', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(757, 31, 'Bhanganpar Bazar', '9372', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(758, 31, 'Fakirhat', '9370', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(759, 31, 'Mansa', '9371', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(760, 31, 'Kachua', '9310', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(761, 31, 'Sonarkola', '9311', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(762, 31, 'Charkulia', '9383', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(763, 31, 'Dariala', '9382', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(764, 31, 'Kahalpur', '9381', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(765, 31, 'Mollahat', '9380', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(766, 31, 'Nagarkandi', '9384', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(767, 31, 'Pak Gangni', '9385', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(768, 31, 'Morelganj', '9320', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(769, 31, 'Sannasi Bazar', '9321', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(770, 31, 'Telisatee', '9322', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(771, 31, 'Foylahat', '9341', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(772, 31, 'Gourambha', '9343', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(773, 31, 'Rampal', '9340', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(774, 31, 'Sonatunia', '9342', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(775, 31, 'Rayenda', '9330', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(776, 32, 'Alamdanga', '7210', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(777, 32, 'Hardi', '7211', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(778, 32, 'Chuadanga Sadar', '7200', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(779, 32, 'Munshiganj', '7201', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(780, 32, 'Andulbaria', '7222', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(781, 32, 'Damurhuda', '7220', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(782, 32, 'Darshana', '7221', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(783, 32, 'Doulatganj', '7230', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(784, 33, 'Bagharpara', '7470', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(785, 33, 'Gouranagar', '7471', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(786, 33, 'Chougachha', '7410', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(787, 33, 'Basundia', '7406', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(788, 33, 'Chanchra', '7402', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(789, 33, 'Churamankathi', '7407', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(790, 33, 'Jessore Airbach', '7404', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(791, 33, 'Jessore canttonment', '7403', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(792, 33, 'Jessore Sadar', '7400', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(793, 33, 'Jessore Upa-Shahar', '7401', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(794, 33, 'Rupdia', '7405', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(795, 33, 'Jhikargachha', '7420', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(796, 33, 'Keshobpur', '7450', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(797, 33, 'Monirampur', '7440', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(798, 33, 'Bhugilhat', '7462', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(799, 33, 'Noapara', '7460', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(800, 33, 'Rajghat', '7461', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(801, 33, 'Bag Achra', '7433', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(802, 33, 'Benapole', '7431', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(803, 33, 'Jadabpur', '7432', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(804, 33, 'Sarsa', '7430', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(805, 34, 'Harinakundu', '7310', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(806, 34, 'Jhenaidah Cadet College', '7301', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(807, 34, 'Jhenaidah Sadar', '7300', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(808, 34, 'Kotchandpur', '7330', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(809, 34, 'Maheshpur', '7340', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(810, 34, 'Hatbar Bazar', '7351', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(811, 34, 'Naldanga', '7350', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(812, 34, 'Kumiradaha', '7321', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(813, 34, 'Shailakupa', '7320', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(814, 35, 'Alaipur', '9240', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(815, 35, 'Belphulia', '9242', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(816, 35, 'Rupsha', '9241', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(817, 35, 'Batiaghat', '9260', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(818, 35, 'Surkalee', '9261', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(819, 35, 'Bajua', '9272', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(820, 35, 'Chalna Bazar', '9270', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(821, 35, 'Dakup', '9271', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(822, 35, 'Nalian', '9273', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(823, 35, 'Chandni Mahal', '9221', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(824, 35, 'Digalia', '9220', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(825, 35, 'Gazirhat', '9224', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(826, 35, 'Ghoshghati', '9223', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(827, 35, 'Senhati', '9222', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(828, 35, 'Atra Shilpa Area', '9207', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(829, 35, 'BIT Khulna', '9203', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(830, 35, 'Doulatpur', '9202', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(831, 35, 'Jahanabad Canttonmen', '9205', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(832, 35, 'Khula Sadar', '9100', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(833, 35, 'Khulna G.P.O', '9000', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(834, 35, 'Khulna Shipyard', '9201', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(835, 35, 'Khulna University', '9208', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(836, 35, 'Siramani', '9204', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(837, 35, 'Sonali Jute Mills', '9206', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(838, 35, 'Amadee', '9291', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(839, 35, 'Madinabad', '9290', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(840, 35, 'Chandkhali', '9284', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(841, 35, 'Garaikhali', '9285', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(842, 35, 'Godaipur', '9281', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(843, 35, 'Kapilmoni', '9282', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(844, 35, 'Katipara', '9283', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(845, 35, 'Paikgachha', '9280', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(846, 35, 'Phultala', '9210', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(847, 35, 'Chuknagar', '9252', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(848, 35, 'Ghonabanda', '9251', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(849, 35, 'Sajiara', '9250', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(850, 35, 'Shahapur', '9253', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(851, 35, 'Pak Barasat', '9231', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(852, 35, 'Terakhada', '9230', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(853, 36, 'Allardarga', '7042', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(854, 36, 'Bheramara', '7040', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(855, 36, 'Ganges Bheramara', '7041', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(856, 36, 'Janipur', '7020', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(857, 36, 'Khoksa', '7021', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(858, 36, 'Kumarkhali', '7010', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(859, 36, 'Panti', '7011', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(860, 36, 'Islami University', '7003', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(861, 36, 'Jagati', '7002', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(862, 36, 'Kushtia Mohini', '7001', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(863, 36, 'Kushtia Sadar', '7000', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(864, 36, 'Amla Sadarpur', '7032', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(865, 36, 'Mirpur', '7030', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(866, 36, 'Poradaha', '7031', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(867, 36, 'Khasmathurapur', '7052', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(868, 36, 'Rafayetpur', '7050', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(869, 36, 'Taragunia', '7051', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(870, 37, 'Arpara', '7620', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(871, 37, 'Magura Sadar', '7600', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(872, 37, 'Binodpur', '7631', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(873, 37, 'Mohammadpur', '7630', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(874, 37, 'Nahata', '7632', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(875, 37, 'Langalbadh', '7611', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(876, 37, 'Nachol', '7612', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(877, 37, 'Shripur', '7610', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(878, 38, 'Gangni', '7110', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(879, 38, 'Amjhupi', '7101', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(880, 38, 'Amjhupi', '7152', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(881, 38, 'Meherpur Sadar', '7100', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(882, 38, 'Mujib Nagar Complex', '7102', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(883, 39, 'Kalia', '7520', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(884, 39, 'Baradia', '7514', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(885, 39, 'Itna', '7512', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(886, 39, 'Laxmipasha', '7510', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(887, 39, 'Lohagora', '7511', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(888, 39, 'Naldi', '7513', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(889, 39, 'Mohajan', '7521', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(890, 39, 'Narail Sadar', '7500', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(891, 39, 'Ratanganj', '7501', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(892, 40, 'Ashashuni', '9460', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(893, 40, 'Baradal', '9461', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(894, 40, 'Debbhata', '9430', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(895, 40, 'Gurugram', '9431', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(896, 40, 'Chandanpur', '9415', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(897, 40, 'Hamidpur', '9413', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(898, 40, 'Jhaudanga', '9412', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(899, 40, 'kalaroa', '9410', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(900, 40, 'Khordo', '9414', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(901, 40, 'Murarikati', '9411', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(902, 40, 'Kaliganj UPO', '9440', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(903, 40, 'Nalta Mubaroknagar', '9441', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(904, 40, 'Ratanpur', '9442', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(905, 40, 'Buri Goalini', '9453', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(906, 40, 'Gabura', '9454', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(907, 40, 'Habinagar', '9455', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(908, 40, 'Nakipur', '9450', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(909, 40, 'Naobeki', '9452', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(910, 40, 'Noornagar', '9451', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(911, 40, 'Budhhat', '9403', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(912, 40, 'Gunakar kati', '9402', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(913, 40, 'Satkhira Islamia Acc', '9401', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(914, 40, 'Satkhira Sadar', '9400', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(915, 40, 'Patkelghata', '9421', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(916, 40, 'Taala', '9420', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(917, 41, 'Dewangonj', '2030', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(918, 41, 'Dewangonj S. Mills', '2031', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(919, 41, 'Durmoot', '2021', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(920, 41, 'Gilabari', '2022', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(921, 41, 'Islampur', '2020', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(922, 41, 'Jamalpur', '2000', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(923, 41, 'Nandina', '2001', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(924, 41, 'Narundi', '2002', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(925, 41, 'Jamalpur', '2011', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(926, 41, 'Mahmoodpur', '2013', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(927, 41, 'Malancha', '2012', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(928, 41, 'Malandah', '2010', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(929, 41, 'Balijhuri', '2041', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(930, 41, 'Mathargonj', '2040', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(931, 41, 'Bausee', '2052', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(932, 41, 'Gunerbari', '2051', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(933, 41, 'Jagannath Ghat', '2053', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(934, 41, 'Jamuna Sar Karkhana', '2055', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(935, 41, 'Pingna', '2054', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(936, 41, 'Shorishabari', '2050', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(937, 42, 'Bhaluka', '2240', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(938, 42, 'Fulbaria', '2216', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(939, 42, 'Duttarbazar', '2234', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(940, 42, 'Gaforgaon', '2230', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(941, 42, 'Kandipara', '2233', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(942, 42, 'Shibganj', '2231', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(943, 42, 'Usti', '2232', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(944, 42, 'Gouripur', '2270', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(945, 42, 'Ramgopalpur', '2271', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(946, 42, 'Dhara', '2261', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(947, 42, 'Haluaghat', '2260', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(948, 42, 'Munshirhat', '2262', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(949, 42, 'Atharabari', '2282', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(950, 42, 'Isshwargonj', '2280', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(951, 42, 'Sohagi', '2281', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(952, 42, 'Muktagachha', '2210', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(953, 42, 'Agriculture University', '2202', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(954, 42, 'Biddyaganj', '2204', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(955, 42, 'Kawatkhali', '2201', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(956, 42, 'Mymensingh Sadar', '2200', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(957, 42, 'Pearpur', '2205', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(958, 42, 'Shombhuganj', '2203', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(959, 42, 'Gangail', '2291', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(960, 42, 'Nandail', '2290', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(961, 42, 'Beltia', '2251', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(962, 42, 'Phulpur', '2250', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(963, 42, 'Tarakanda', '2252', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(964, 42, 'Ahmadbad', '2221', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(965, 42, 'Dhala', '2223', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(966, 42, 'Ram Amritaganj', '2222', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(967, 42, 'Trishal', '2220', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(968, 43, 'Susnng Durgapur', '2420', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(969, 43, 'Atpara', '2470', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(970, 43, 'Barhatta', '2440', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(971, 43, 'Dharampasha', '2450', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(972, 43, 'Dhobaura', '2416', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(973, 43, 'Sakoai', '2417', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(974, 43, 'Kalmakanda', '2430', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(975, 43, 'Kendua', '2480', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(976, 43, 'Khaliajhri', '2460', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(977, 43, 'Shaldigha', '2462', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(978, 43, 'Madan', '2490', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(979, 43, 'Moddoynagar', '2456', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(980, 43, 'Mohanganj', '2446', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(981, 43, 'Baikherhati', '2401', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(982, 43, 'Netrokona Sadar', '2400', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(983, 43, 'Jaria Jhanjhail', '2412', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(984, 43, 'Purbadhola', '2410', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(985, 43, 'Shamgonj', '2411', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(986, 43, 'Susnng Durgapur', '2420', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(987, 43, 'Atpara', '2470', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(988, 43, 'Barhatta', '2440', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(989, 43, 'Dharampasha', '2450', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(990, 43, 'Dhobaura', '2416', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(991, 43, 'Sakoai', '2417', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(992, 43, 'Kalmakanda', '2430', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(993, 43, 'Kendua', '2480', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(994, 43, 'Khaliajhri', '2460', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(995, 43, 'Shaldigha', '2462', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(996, 43, 'Madan', '2490', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(997, 43, 'Moddoynagar', '2456', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(998, 43, 'Mohanganj', '2446', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(999, 43, 'Baikherhati', '2401', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1000, 43, 'Netrokona Sadar', '2400', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1001, 44, 'Bakshigonj', '2140', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1002, 44, 'Jhinaigati', '2120', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1003, 44, 'Gonopaddi', '2151', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1004, 44, 'Nakla', '2150', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1005, 44, 'Hatibandha', '2111', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1006, 44, 'Nalitabari', '2110', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1007, 44, 'Sherpur Shadar', '2100', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1008, 44, 'Shribardi', '2130', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1009, 45, 'Adamdighi', '5890', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1010, 45, 'Nasharatpur', '5892', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1011, 45, 'Santahar', '5891', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1012, 45, 'Bogra Canttonment', '5801', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1013, 45, 'Bogra Sadar', '5800', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1014, 45, 'Dhunat', '5850', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1015, 45, 'Gosaibari', '5851', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1016, 45, 'Dupchachia', '5880', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1017, 45, 'Talora', '5881', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1018, 45, 'Gabtoli', '5820', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1019, 45, 'Sukhanpukur', '5821', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1020, 45, 'Kahalu', '5870', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1021, 45, 'Nandigram', '5860', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1022, 45, 'Chandan Baisha', '5831', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1023, 45, 'Sariakandi', '5830', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1024, 45, 'Chandaikona', '5841', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1025, 45, 'Palli Unnyan Accadem', '5842', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1026, 45, 'Sherpur', '5840', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1027, 45, 'Shibganj', '5810', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1028, 45, 'Sonatola', '5826', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1029, 46, 'Akklepur', '5940', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1030, 46, 'jamalganj', '5941', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1031, 46, 'Tilakpur', '5942', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1032, 46, 'Joypurhat Sadar', '5900', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1033, 46, 'kalai', '5930', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1034, 46, 'Khetlal', '5920', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1035, 46, 'Panchbibi', '5910', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1036, 47, 'Ahsanganj', '6596', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1037, 47, 'Bandai', '6597', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1038, 47, 'Badalgachhi', '6570', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1039, 47, 'Dhamuirhat', '6580', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1040, 47, 'Mahadebpur', '6530', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1041, 47, 'Naogaon Sadar', '6500', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1042, 47, 'Niamatpur', '6520', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1043, 47, 'Nitpur', '6550', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1044, 47, 'Panguria', '6552', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1045, 47, 'Porsa', '6551', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1046, 47, 'Patnitala', '6540', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1047, 47, 'Balihar', '6512', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1048, 47, 'Manda', '6511', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1049, 47, 'Prasadpur', '6510', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1050, 47, 'Kashimpur', '6591', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1051, 47, 'Raninagar', '6590', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1052, 47, 'Moduhil', '6561', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1053, 47, 'Sapahar', '6560', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1054, 48, 'Abdulpur', '6422', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1055, 48, 'Gopalpur U.P.O', '6420', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1056, 48, 'Lalpur S.O', '6421', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1057, 48, 'Baraigram', '6432', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1058, 48, 'Dayarampur', '6431', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1059, 48, 'Harua', '6430', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1060, 48, 'Hatgurudaspur', '6440', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1061, 48, 'Laxman', '6410', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1062, 48, 'Baiddyabal Gharia', '6402', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1063, 48, 'Digapatia', '6401', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1064, 48, 'Madhnagar', '6403', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1065, 48, 'Natore Sadar', '6400', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1066, 48, 'Singra', '6450', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1067, 49, 'Bholahat', '6330', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1068, 49, 'Amnura', '6303', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1069, 49, 'Chapinawbganj Sadar', '6300', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1070, 49, 'Rajarampur', '6301', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1071, 49, 'Ramchandrapur', '6302', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1072, 49, 'Mandumala', '6311', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1073, 49, 'Nachol', '6310', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1074, 49, 'Gomashtapur', '6321', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1075, 49, 'Rohanpur', '6320', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1076, 49, 'Kansart', '6341', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1077, 49, 'Manaksha', '6342', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1078, 49, 'Shibganj U.P.O', '6340', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1079, 50, 'Banwarinagar', '6650', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1080, 50, 'Bera', '6680', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1081, 50, 'Kashinathpur', '6682', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1082, 50, 'Nakalia', '6681', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1083, 50, 'Puran Bharenga', '6683', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1084, 50, 'Bhangura', '6640', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1085, 50, 'Chatmohar', '6630', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1086, 50, 'Debottar', '6610', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1087, 50, 'Dhapari', '6621', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1088, 50, 'Ishwardi', '6620', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1089, 50, 'Pakshi', '6622', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1090, 50, 'Rajapur', '6623', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1091, 50, 'Hamayetpur', '6602', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1092, 50, 'Kaliko Cotton Mills', '6601', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1093, 50, 'Pabna Sadar', '6600', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1094, 50, 'Sathia', '6670', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1095, 50, 'Sagarkandi', '6661', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1096, 50, 'Sujanagar', '6660', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1097, 51, 'Arani', '6281', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1098, 51, 'Bagha', '6280', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1099, 51, 'Bhabaniganj', '6250', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1100, 51, 'Taharpur', '6251', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1101, 51, 'Charghat', '6270', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1102, 51, 'Sarda', '6271', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1103, 51, 'Durgapur', '6240', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1104, 51, 'Godagari', '6290', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1105, 51, 'Premtoli', '6291', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1106, 51, 'Khodmohanpur', '6220', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1107, 51, 'Lalitganj', '6210', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1108, 51, 'Rajshahi Sugar Mills', '6211', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1109, 51, 'Shyampur', '6212', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1110, 51, 'Putia', '6260', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1111, 51, 'Binodpur Bazar', '6206', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1112, 51, 'Ghuramara', '6100', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1113, 51, 'Kazla', '6204', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1114, 51, 'Rajshahi Canttonment', '6202', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1115, 51, 'Rajshahi Court', '6201', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1116, 51, 'Rajshahi Sadar', '6000', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1117, 51, 'Rajshahi University', '6205', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1118, 51, 'Sapura', '6203', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1119, 51, 'Tanor', '6230', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1120, 52, 'Baiddya Jam Toil', '6730', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1121, 52, 'Belkuchi', '6740', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1122, 52, 'Enayetpur', '6751', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1123, 52, 'Rajapur', '6742', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1124, 52, 'Sohagpur', '6741', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1125, 52, 'Sthal', '6752', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1126, 52, 'Dhangora', '6720', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1127, 52, 'Malonga', '6721', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1128, 52, 'Gandail', '6712', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1129, 52, 'Kazipur', '6710', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1130, 52, 'Shuvgachha', '6711', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1131, 52, 'Jamirta', '6772', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1132, 52, 'Kaijuri', '6773', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1133, 52, 'Porjana', '6771', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1134, 52, 'Shahjadpur', '6770', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1135, 52, 'Raipur', '6701', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1136, 52, 'Rashidabad', '6702', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1137, 52, 'Sirajganj Sadar', '6700', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1138, 52, 'Tarash', '6780', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1139, 52, 'Lahiri Mohanpur', '6762', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1140, 52, 'Salap', '6763', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1141, 52, 'Ullapara', '6760', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1142, 52, 'Ullapara R.S', '6761', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1143, 53, 'Bangla Hili', '5270', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1144, 53, 'Biral', '5210', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1145, 53, 'Birampur', '5266', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1146, 53, 'Birganj', '5220', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1147, 53, 'Chrirbandar', '5240', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1148, 53, 'Ranirbandar', '5241', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1149, 53, 'Dinajpur Rajbari', '5201', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1150, 53, 'Dinajpur Sadar', '5200', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1151, 53, 'Khansama', '5230', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1152, 53, 'Pakarhat', '5231', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1153, 53, 'Maharajganj', '5226', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1154, 53, 'Daudpur', '5281', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1155, 53, 'Gopalpur', '5282', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1156, 53, 'Nababganj', '5280', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1157, 53, 'Ghoraghat', '5291', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1158, 53, 'Osmanpur', '5290', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1159, 53, 'Parbatipur', '5250', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1160, 53, 'Phulbari', '5260', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1161, 53, 'Setabganj', '5216', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1162, 54, 'Bonarpara', '5750', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1163, 54, 'saghata', '5751', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1164, 54, 'Gaibandha Sadar', '5700', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1165, 54, 'Gobindhaganj', '5740', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1166, 54, 'Mahimaganj', '5741', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1167, 54, 'Palashbari', '5730', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1168, 54, 'Bharatkhali', '5761', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1169, 54, 'Phulchhari', '5760', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1170, 54, 'Naldanga', '5711', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1171, 54, 'Saadullapur', '5710', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1172, 54, 'Bamandanga', '5721', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1173, 54, 'Sundarganj', '5720', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1174, 55, 'Bhurungamari', '5670', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1175, 55, 'Chilmari', '5630', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1176, 55, 'Jorgachh', '5631', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1177, 55, 'Kurigram Sadar', '5600', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1178, 55, 'Pandul', '5601', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1179, 55, 'Phulbari', '5680', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1180, 55, 'Nageshwar', '5660', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1181, 55, 'Nazimkhan', '5611', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1182, 55, 'Rajarhat', '5610', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1183, 55, 'Rajibpur', '5650', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1184, 55, 'Roumari', '5640', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1185, 55, 'Bazarhat', '5621', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1186, 55, 'Ulipur', '5620', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1187, 56, 'Aditmari', '5510', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1188, 56, 'Hatibandha', '5530', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1189, 56, 'Kulaghat SO', '5502', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1190, 56, 'Lalmonirhat Sadar', '5500', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1191, 56, 'Moghalhat', '5501', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1192, 56, 'Baura', '5541', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1193, 56, 'Burimari', '5542', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1194, 56, 'Patgram', '5540', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1195, 56, 'Tushbhandar', '5520', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1196, 57, 'Dimla', '5350', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1197, 57, 'Ghaga Kharibari', '5351', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1198, 57, 'Chilahati', '5341', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1199, 57, 'Domar', '5340', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1200, 57, 'Jaldhaka', '5330', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1201, 57, 'Kishoriganj', '5320', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1202, 57, 'Nilphamari Sadar', '5300', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1203, 57, 'Nilphamari Sugar Mil', '5301', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1204, 57, 'Syedpur', '5310', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1205, 57, 'Syedpur Upashahar', '5311', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1206, 58, 'Boda', '5010', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1207, 58, 'Chotto Dab', '5040', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1208, 58, 'Mirjapur', '5041', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1209, 58, 'Dabiganj', '5020', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1210, 58, 'Panchagar Sadar', '5000', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1211, 58, 'Tetulia', '5030', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1212, 59, 'Badarganj', '5430', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1213, 59, 'Shyampur', '5431', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1214, 59, 'Gangachara', '5410', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1215, 59, 'Haragachh', '5441', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1216, 59, 'Kaunia', '5440', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1217, 59, 'Mithapukur', '5460', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1218, 59, 'Pirgachha', '5450', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1219, 59, 'Alamnagar', '5402', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1220, 59, 'Mahiganj', '5403', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1221, 59, 'Rangpur Cadet Colleg', '5404', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1222, 59, 'Rangpur Carmiecal Col', '5405', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1223, 59, 'Rangpur Sadar', '5400', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1224, 59, 'Rangpur Upa-Shahar', '5401', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1225, 59, 'Taraganj', '5420', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1226, 60, 'Baliadangi', '5140', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1227, 60, 'Lahiri', '5141', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1228, 60, 'Jibanpur', '5130', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1229, 60, 'Pirganj', '5110', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1230, 60, 'Pirganj', '5470', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1231, 60, 'Nekmarad', '5121', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1232, 60, 'Rani Sankail', '5120', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1233, 60, 'Ruhia', '5103', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1234, 60, 'Shibganj', '5102', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1235, 60, 'Thakurgaon Road', '5101', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1236, 60, 'Thakurgaon Sadar', '5100', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1237, 61, 'Azmireeganj', '3360', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(1238, 61, 'Bahubal', '3310', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1239, 61, 'Baniachang', '3350', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1240, 61, 'Jatrapasha', '3351', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1241, 61, 'Kadirganj', '3352', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1242, 61, 'Chandpurbagan', '3321', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1243, 61, 'Chunarughat', '3320', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1244, 61, 'Narapati', '3322', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1245, 61, 'Gopaya', '3302', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1246, 61, 'Habiganj Sadar', '3300', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1247, 61, 'Shaestaganj', '3301', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1248, 61, 'Kalauk', '3340', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1249, 61, 'Lakhai', '3341', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1250, 61, 'Itakhola', '3331', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1251, 61, 'Madhabpur', '3330', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1252, 61, 'Saihamnagar', '3333', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1253, 61, 'Shahajibazar', '3332', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1254, 61, 'Digalbak', '3373', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1255, 61, 'Golduba', '3372', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1256, 61, 'Goplarbazar', '3371', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1257, 61, 'Inathganj', '3374', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1258, 61, 'Nabiganj', '3370', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1259, 62, 'Baralekha', '3250', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1260, 62, 'Dhakkhinbag', '3252', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1261, 62, 'Juri', '3251', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1262, 62, 'Purbashahabajpur', '3253', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1263, 62, 'Kamalganj', '3220', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1264, 62, 'Keramatnaga', '3221', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1265, 62, 'Munshibazar', '3224', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1266, 62, 'Patrakhola', '3222', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1267, 62, 'Shamsher Nagar', '3223', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1268, 62, 'Baramchal', '3237', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1269, 62, 'Kajaldhara', '3234', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1270, 62, 'Karimpur', '3235', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1271, 62, 'Kulaura', '3230', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1272, 62, 'Langla', '3232', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1273, 62, 'Prithimpasha', '3233', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1274, 62, 'Tillagaon', '3231', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1275, 62, 'Afrozganj', '3203', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1276, 62, 'Barakapan', '3201', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1277, 62, 'Monumukh', '3202', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1278, 62, 'Maulvi Bazar Sadar', '3200', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1279, 62, 'Rajnagar', '3240', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1280, 62, 'Kalighat', '3212', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1281, 62, 'Khejurichhara', '3213', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1282, 62, 'Narain Chora', '3211', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1283, 62, 'Satgaon', '3214', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1284, 62, 'Srimangal', '3210', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1285, 63, 'Bishamsapur', '3010', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1286, 63, 'Chhatak', '3080', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1287, 63, 'Chhatak Cement Facto', '3081', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1288, 63, 'Chhatak Paper Mills', '3082', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1289, 63, 'Chourangi Bazar', '3893', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1290, 63, 'Gabindaganj', '3083', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1291, 63, 'Gabindaganj Natun Ba', '3084', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1292, 63, 'Islamabad', '3088', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1293, 63, 'jahidpur', '3087', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1294, 63, 'Khurma', '3085', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1295, 63, 'Moinpur', '3086', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1296, 63, 'Dhirai Chandpur', '3040', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1297, 63, 'Jagdal', '3041', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1298, 63, 'Duara bazar', '3070', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1299, 63, 'Ghungiar', '3050', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1300, 63, 'Atuajan', '3062', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1301, 63, 'Hasan Fatemapur', '3063', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1302, 63, 'Jagnnathpur', '3060', '2021-10-20 22:28:53', '2021-10-20 22:28:53');
INSERT INTO `post_office_lists` (`id`, `district_list_id`, `name`, `post_code`, `created_at`, `updated_at`) VALUES
(1303, 63, 'Rasulganj', '3064', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1304, 63, 'Shiramsi', '3065', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1305, 63, 'Syedpur', '3061', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1306, 63, 'Sachna', '3020', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1307, 63, 'Pagla', '3001', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1308, 63, 'Patharia', '3002', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1309, 63, 'Sunamganj Sadar', '3000', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1310, 63, 'Tahirpur', '3030', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1311, 64, 'Balaganj', '3120', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1312, 64, 'Begumpur', '3125', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1313, 64, 'Brahman Shashon', '3122', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1314, 64, 'Gaharpur', '3128', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1315, 64, 'Goala Bazar', '3124', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1316, 64, 'Karua', '3121', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1317, 64, 'Kathal Khair', '3127', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1318, 64, 'Natun Bazar', '3129', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1319, 64, 'Omarpur', '3126', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1320, 64, 'Tajpur', '3123', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1321, 64, 'Bianibazar', '3170', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1322, 64, 'Churkai', '3175', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1323, 64, 'jaldup', '3171', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1324, 64, 'Kurar bazar', '3173', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1325, 64, 'Mathiura', '3172', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1326, 64, 'Salia bazar', '3174', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1327, 64, 'Bishwanath', '3130', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1328, 64, 'Dashghar', '3131', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1329, 64, 'Deokalas', '3133', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1330, 64, 'Doulathpur', '3132', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1331, 64, 'Singer kanch', '3134', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1332, 64, 'Fenchuganj', '3116', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1333, 64, 'Fenchuganj SareKarkh', '3117', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1334, 64, 'Chiknagul', '3152', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1335, 64, 'Goainhat', '3150', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1336, 64, 'Jaflong', '3151', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1337, 64, 'banigram', '3164', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1338, 64, 'Chandanpur', '3165', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1339, 64, 'Dakkhin Bhadashore', '3162', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1340, 64, 'Dhaka Dakkhin', '3161', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1341, 64, 'Gopalgannj', '3160', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1342, 64, 'Ranaping', '3163', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1343, 64, 'Jainthapur', '3156', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1344, 64, 'Ichhamati', '3191', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1345, 64, 'Jakiganj', '3190', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1346, 64, 'Chatulbazar', '3181', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1347, 64, 'Gachbari', '3183', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1348, 64, 'Kanaighat', '3180', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1349, 64, 'Manikganj', '3182', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1350, 64, 'Kompanyganj', '3140', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1351, 64, 'Birahimpur', '3106', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1352, 64, 'Jalalabad', '3107', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1353, 64, 'Jalalabad Cantoment', '3104', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1354, 64, 'Kadamtali', '3111', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1355, 64, 'Kamalbazer', '3112', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1356, 64, 'Khadimnagar', '3103', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1357, 64, 'Lalbazar', '3113', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1358, 64, 'Mogla', '3108', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1359, 64, 'Ranga Hajiganj', '3109', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1360, 64, 'Shahajalal Science &', '3114', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1361, 64, 'Silam', '3105', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1362, 64, 'Sylhe Sadar', '3100', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1363, 64, 'Sylhet Biman Bondar', '3102', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(1364, 64, 'Sylhet Cadet Col', '3101', '2021-10-20 22:28:53', '2021-10-20 22:28:53');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_id` int(11) NOT NULL,
  `price` double NOT NULL,
  `short_description` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'at %',
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pcs',
  `gross_weight` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0 = deactivated, 1 = activated',
  `featured` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0 = deactivated, 1 = activated',
  `new_arrival` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0 = deactivated, 1 = activated',
  `popular` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0 = deactivated, 1 = activated',
  `bestseller` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0 = deactivated, 1 = activated',
  `trending` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0 = deactivated, 1 = activated',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `description`, `currency_id`, `price`, `short_description`, `discount`, `slug`, `sku`, `unit_name`, `gross_weight`, `tags`, `status`, `featured`, `new_arrival`, `popular`, `bestseller`, `trending`, `created_at`, `updated_at`) VALUES
(2, 23, 'New Luminous bao reflective geometric bags for women.', '<p><img src=\"data:image/jpeg;base64,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st9e+F81JQ3GGoq42MLz1YJAfjvDHlkh8AzPcsqQgH3IMIF/dLrW2wW3UtHdKKukkbLSQiN5p2thc4O42HO7mgb/AGlmwKtaW3UNLI6Slo6eB7h2nRRNaT78DdXTRgYQcoiICwHpOl6rU2kn/TMFmPrFSBVTNY5o/Qns4ecb8vFZ8qFXSUtWwMq6eKdoOQJGBwB+KC109O2otUT23aG7EDhfVRcHC9w57MyAfcpFUKWmgpIuqpoYoY854Y2Boz7gq6AiIgIiICIiAiIUHmmmbTdr5bJ6SprqGCytu8sxjhicZpgyYuDHknhaC7BJaM9nzK9LXSONkbeFjQ0c8DZd0BERAWIdKNXUmxRWOgh9Yrr1O2iZCJuqLoiC6ch+DwEQtkId9rhWXro+NjnNcWtLm8iRyQYJouqr7frW7Wi42ptriubBcaGIVYmBewNjqGtwAGtH6Fwb3l7zss+VMxtc9r3NaXNzwkjcKogIiICwl1dR2fpHuM96mipI66ih9RqpnBkeGFwki43fWy4O4fDdZsrerpKWrj6uqp4qiPnwSsDxn3EIKVtrqO403rNDUx1MOS0SRniaSNjgjY+8K9VKCGKGJsUTGMjYMNa1oAaFVQEREHWT2T7ivMOjZ7LRJSSXZzZfpfMdvr3DAjw4/wAUzjs5IL2/bPF3gL1AhUTTw8AZ1bOFrg4N4RgOByCPPO6CuOSIiAiIgwTpPqqupns+nbbQGvnrKptTUwiURt9XhIeeJ59nL+ADbfdcdGlTWUN0vWm7lQi3yRzmvo6cVDZcU8ziTw8IAa1sge0DCzjqmdZ1nA3i4eHixvhOqj63reBvWcPDxcO+OeM+CCoiIgIiIPP6Oq+itTatpbrd4bVVXCqiqbdWTMYG+riCNgY1z8B5bIyVxb3dYPFTuhbhVXGzzTVNZHXdXVywx1LGBjZmNdhrwGkt38RsVN1dJS1bWtqqaGdrTlokjDgD4jIVSGGOGNscTGsY0Ya1owAPggqIiICIiDx7okqhDeNSNdq2mpWfwuuQNrc2LjkJlI5k8e57X+hewqxNqtxqfWfUKXr+LjMvUt4+LxzjOVfICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiD//2Q==\" style=\"width: 791.688px;\" data-filename=\"1.jpg\"><img src=\"data:image/jpeg;base64,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pGw09KGxENIGQ/wzw/8AMg9FReeat1Bc4NQXilhuDKCO220VdO1wH5+Qk+ln0m8MYCnL9dKsdHFVeYy6kqxbzUAgDzHbN370HToue0TFcpLVDcLldDXGsgilaAwNawlgJxj1rh6q9aghuFXJFqFro2X2K3RRPY0tayQgEuxjJGeCD1lFynR1cquuhvFNWVgq5Lfc5qVsnDcWNxjdjt4rmqzVtZFra309Nc5KqCe6GglZ1bWRAFucN4lznDtKD08kDmcLFVVMFNC+aomjijZjc97trRxxxJXHdJzag1mnhFdZ7dE+u2SyskDRxHDJPis3SdN5H0f1MwmbIInQ5fJtc14MrAc54Hmg7AOBGQQQqrmtd3eqsuiqu52yNsk0TGmM4y1oJA3EdwBytbSdxrDqS42aW4NuVPBDHLHUcC4FwGWkt4eIQdci8x1Td73T6i1LHSX0U8FsooKqKJzWnznF2QSfi4b969Etc5qrbTVTsbpoWSHHLi0H+KDaREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBCMhEQRsVis8NaK6K20kdUCSJmxAOBPM5WW42u33FjWXCjgqmsOWiVgdj61uogweSwCl8mbEwQ7dojDcN24xjHco6DTligEDYbVSxina5kW2MDYHekB3ZUwiDTt9tobfRCioaaKnpxnETG4bx58FpwaZsMXUdXaqRnUOc6ENjA2Od6RHdlTCINW3W+it1N5PQUsVNDuLtkbdoyeaxwWm2U9Y6tgt9LHUu9KZsTQ8+3C3kQadzttBc4Ww3Ckhqo2OD2tlYHAOHIqlrtlBbIHwW+khpYnuL3MiaGgk8zgLdRBp2620NtbK2gpoqcTPMjwxuNzjzJ8VbT2q3QXCa4Q0MEVXMMSTNYN7vWVvIg5+mslQ/UpvVyq46kxNLKKNsQb1Id6RzzJIwF0CIg07pbqC5wshuFJDVRseJGtlaHAOHI4PaEuNuoblTeS19LFUQZB6t7cjI5LcRBo0dpt1HVz1dLSRQz1GOukY3DpMcsntV1NbKCnr56+ClijqajAmlDfOfjvK3EQR9ws9suErJK6gpql0Ywx0sYcWj2rYq6Smq6R9JUwxy08g2vjc3LXDuWwiDDSU0FJTMp6aJsULBtYxowGjuUc/Tdjc1wda6U7puvdlg4yfL+l4qXRBpW620NBJPJR0sMD6h++Ysbgvd3laz9O2N1YKt1qojUCTrRIIRu3/Kz3qWRBq3G30dxp/J66lhqYs52SsDm5HbgqyttdBW273vq6OGakwB1LmAs4cuC3UQYH0tO+lNK+GN0O3YWOblu3GMYWK222gtsbo7fRwUrHHLmxMDQT44W4iCJq9P2WqmqJqi10sslUzZO97Ad4HY7vUlTxRwQsiiYGMY0Na0cgAsiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiK1jg7OOwoLkREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBFjkfsIwM+1U609wV1RlRYutPcE609wTVGVFi609wTrT3BNUZUWLrT3BOtPcE1RlRQtLdpJdSV1rMLRHTU8MrXh3FxkLgR7No+tSnWnuCaGZFh609wTrT3BNUZkWHrT3BOtPcE1RmRYetPcE609wTVGZFh609wTrT3BNUZkWHrT3BOtPcE1RmRYetPcE609wTVGZFh609wTrT3BNUZkWHrT3BOtPcE1RmRYetPcE609wTVGZFh609wTrT3BNUZkWHrT3BOtPcE1RmRYetPcE609wTVGZFh609wTrT3BNUZkWHrT3BOtPcE1RmRYetPcE609wTVGZFh609wTrT3BNUZkWHrT3BOtPcE1RmRYetPcE609wTVGZFh609wTrT3BNUZkWHrT3BOtPcE1RmRYetPcE609wTVGZFh609wTrT3BNUZkWHrT3BOtPcE1RmRYetPcE609wTVGZFh609wTrT3BNUZkWHrT3BOtPcE1RmRYetPcE609wTVGZFh609wTrT3BNUZkWHrT3BE1RmVkXxvpK9WRfG+koL0REBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREGCf0h6lYVfP6Q9SsK6YrDKZVEWtKrlMqiJoEREEVS1VTJqi40kkbW00NNC+N5ZgkuLtwLu3GBw7FLZUXSPuLtSXBkzXi3tp4TTnaNped2/B7fi5UoVEMplURXSq5TKoiaBERBci8ov/AExsHScej3RumZ9V3inidJcDFVtp4aLBAxI9zSM8cHuJA7Vq626YNQaFpoKzV/RtVUVFUPEMNRSXSOqZ1527I34aNm7JIcfkrO0ewZTKfgmFVMplMJhAyqqmFZO90cL3tY57mtJawc3EDO0etKMiLx/oU6bY+knWV60tLpKu0/XWeAyVLamobI5rg8MLCA0YIJWPpg6cx0ca/tGmK3RtdWwXXqhTXFlQ1kbnOcGuaAWnJbuGePxlNj2JEPMhFoEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERBtqyL430lerIvjfSXFleiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgwT+kPUrCr5/SHqVhXTFYoiItKIiICIiCLpIrgzVFwnle7yCSmhbAN/DeN2/Dezm1SiiqSllj1Vcax00bopaeFjYw7LmlpdkkdmchSxUgoiIqCIiAqg4OVRZI2ZAdnHsUo+FOm+29JfQ7093XpLslPPJbLjUvqjUQMc+nfC5wDoZ8DhxLRx7eIXpekfdAdGPTBaYtH9ItuNnq6mWLY2Uk07pg8lro5BxjI4cXY9Lmu46NOk+03HXuv9DasvNCya1XmU0YrZ2ASUxcAGNa4BuGHA5k+cvnz3Y+itC23UOl6zo2NuF0utRLFUQW6dsjS9pYWP2NLsOJecnwC5svePdYdKuqeiixW6usdFbKiK5b6Zk1Q5xlgnDSWvDR5r2Adh7V5lrTpY6c9N9FWlekyovmnX2y6iBhoIqPMkzi1zi57i3DdwaQQ08OxW+7tiuFF0O9H9rv9yirL7Tyjy14kBdK8QYfIBwOC7tx2qD6b6uhl9xJ0awQ1tO+cTQDq2yNLhtil38AfikjPdnimx2fSd0udK8XRjbel3TFxstp0xWmKKO2SU3XVJkLnNe573NwAXNIGD6OO1ejUnTY6t9zi7pYpNM1VTOyJwfb4juDZGv2Ofnn1Qd52eYavB9dV1A//APp+aVpW1tM+cVzG9W2RpcXCaYubjOSQCCR6l0PRjriv0N7hcagsD6Ce40dY+N8NQ0SsAlqtpa9gI5tdyKbHSXfpC6S6roNHTJYtUQU9NE5k9TY6u0NbG2PcGujjlI3uGXDD+0Z4r2zol1hFr7o/s2roKN1GLjEXOgc7OxzXFrgD2jLTjwXx1e710fX33Pt6vGodaO1F0h1tDC+One2Vrbc1sjQIYmMHVta0OOXHmvoT3ImoLFB7n7TtLNdaaOWgo5Z6zdIA2BhnkwXu5N5cicpKPPfctjPurOlv6VR//NBYvd08ekLorHH/AG5/3TQrV9yPerTcvdO9JlfQ18E1NcRPJRPa/HXs8oDgWg4J83isHu3r7ZqrpV6PbXTXKnkq7ZWb62MPGacOlhLd55NyAT7FYPsOQeefWrVayWOdjZYntkje0Oa5pyHA8QQRwwVctzw0IiKgiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIg21ZF8b6SvVkXxvpLiyvREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQYJ/SHqVhV8/pD1KwrpisUREWlEREBERKIejpoGasuVY2sidLLSwRuhB89gaXkOPgcnHqUwoijiohqu5TMqi6rfTwCaHbwY1pfsdntzx+pS6kBERUEREBbMX82FhiALuK2AMBc87vhK5+u0Xo+vq5Kuv0rYquolduklmt0T3vd3uJaST61Wg0Xo+31cVZb9K2OkqYjujmp7fFG9h7w5rQQp9FlETeNNaevUzJ7xYrXcpWN2sfV0kcrmjngFwOB2rVk0VpCSmip36WsT4YS4xRut8RZGXHzi1pbgZwM47l0CIOfOi9IGlbSnStiNOx5kbEbdFsa48C4N24BIABPbhZIdJ6Wit09ti05ZmUVQ4Pmp2UMQjlcOTnN24cR3kKcRBz9No3SNPHPHTaXscDKiPq5mx0ETRKzIO1wDfObkDgeHBbNLpvT9JbJ7XS2O2QW+pJM9LHSsbFLnGdzANp5DmOxS6IOdt+k9LWytZW23TVloqqMHZPT0Mcb2554c0AjgsdZo/SVdVy1ddpax1NTMd0s01vie9573OLSSfWulLW9yxzNG3lhalGtBBFTQsggjZFDG0MYxjdrWAcA0AcAAOxXqpCotzhoREVBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERBtqyL430lerIvjfSXFleiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgwT+kPUrCr5/SHqVhXTFYoiItKIiICIiURFGKD4WXIRdd5cKWDrs+hsy/Zt8eeVLqJo56N2q7jAymc2rZSwGabPB7XF+1uPDj9alyFIKIiKgiIgyQems6wU/prOuWXlKIiKIIiICIiAiIgKyX0FesdT/Np7jAiIuzQiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiINtWRfG+kr1ZF8b6S4sr0REBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREGCf0h6lYVfP6Q9SsK6YrFERFpRERARESiIoqmJ+rbnRiliZJDTQPMwHnPDi/DT4DHD1qYJUPR1k8mqbhQvgjbDFTQyMk28XlxdnLu3GFLqQERFQREQXREB4ytgEEZHJawWWJzWsAJ5LGU90rKit6xnenWM71jVRcit6xnenWM705FyK3rGd6dYzvTkXIresZ3p1jO9OQ6xnescr2uG0HisZQldJiulERFpRERAREQEREBERARFrXOupLbQT3CvqYqWkp2GSaaVwayNo4lxJ5AIjZReP3XpH1hqKrNH0f6ccIC4AV1azziCPSbFkbG8sOe7P6OFrw6L6aKx0VbV9IbKSdpDxFG1pYD3FoYGn1HIVNvaEXnNDeukPTLD8MbXS3y3MHnXG0NImjA+NJCeLvEs+yu8tFzoLvQR11tqoqqmlGWSROyD2H1EKXgbSIiKIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIg21ZF8b6SvVkXxvpLiyvREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQYJ/SHqVhV8/pD1KwrpisUREWlEREBERKIykluLtS3CGRjm29lPEYHFmGl5Lt+HdvYpNRdLHcfhLcHyGQ0DqeEQAu83rAXb8Ds+KpUlSCiIioIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiKoCDFUTRwROllkbGxjS5znHAAAySV5hBR1vSneGXOpqJKfRNDOTQ07csdc5GHhUOPDEQdnYO3bu7lC9MOqKvUd0t2g7FUSRe+9V5G+doP82MGV4+izdwXstqoaa2W6nt9HGI6emibFE3JO1jQABk8+ATxGfJb6Ckt1K2loaeOnhYMBrBgHh295WyUKopFkF5jr+yV+lK+XXWj97ACX3m2RM3RVbOG6ZrBx3jGTt4uHHnnd6cOKqWgjBGR2hWlm0Fo3U1Bqa2iropG9axretiDgduRlrgfjNcOLXDgRxU4vCL/FWdH2uZG2cFoDXVlrhdktqKdz/wA/RHj8WRwdGfil4HLK9m05eKPUFkpbvb3mSlqYw9hc0gg8i0g4wQQQQVPBEiiIqoiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiINtWQ/G9avVGtAz4lcWVUREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREGCf0h6lYVnfGHHJTqm95WplIMGEws/VN7ynVN7yr3xdsGEws/VN7ynVN7ynfDbBhMLP1Te8p1Te8p3Q2gaSkqY9T3GrfO0wS08DI2dZxa5u7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QEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERB//2Q==\" style=\"width: 791.688px;\" data-filename=\"2.jpg\"><br></p>', 1, 1800, 'new Luminous bao bag reflective geometric bags for women 2020 Quilted Shoulder Bags Plain Folding female Handbags bolsa feminina', '', '', 'ZEES28082020', 'pcs', '120', 'woman\'s bag', 1, 1, 1, 1, 1, 1, '2021-10-27 08:41:35', '2021-10-27 08:55:51');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `name` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `name`, `image`, `created_at`, `updated_at`) VALUES
(8, 2, 'ezgif.com-gif-maker.jpg', '/upload/products/1635345695oyzrnaDAC.jpg', '2021-10-27 08:41:35', '2021-10-27 08:41:35'),
(9, 2, 'ezgif.com-gif-maker (2).jpg', '/upload/products/1635345695kw857gDAC.jpg', '2021-10-27 08:41:36', '2021-10-27 08:41:36'),
(10, 2, 'ezgif.com-gif-maker (1).jpg', '/upload/products/1635345696smf9auDAC.jpg', '2021-10-27 08:41:36', '2021-10-27 08:41:36'),
(11, 2, '7.jpg', '/upload/products/16353456966ywlhgDAC.jpg', '2021-10-27 08:41:36', '2021-10-27 08:41:36');

-- --------------------------------------------------------

--
-- Table structure for table `product_supplier`
--

CREATE TABLE `product_supplier` (
  `supplier_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

CREATE TABLE `profiles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `designation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `profiles`
--

INSERT INTO `profiles` (`id`, `user_id`, `company_name`, `phone`, `designation`, `created_at`, `updated_at`) VALUES
(1, 1, 'Ecommere Admin', '01764470022', 'Owner', '2021-10-20 22:28:53', '2021-10-20 22:28:53');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('rq9qL6UXbxq3LoeV3OdqHPZFXcpsLHqIaOHGbsJC', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoieU9xbGVmSlBReEk4UkUzQTRKalRLVGxJSncwbTN4aTRodFZCWW5YUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9zbGlkZXIiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjYwOiIkMnkkMTAkYUpiV1lnWkdsejUzM3o0SGJicmlGLmh6ZDVTRkVicXhCSlRIWm9rL1VGUy5EM0l1eXR2OEciO3M6MjE6InBhc3N3b3JkX2hhc2hfc2FuY3R1bSI7czo2MDoiJDJ5JDEwJGFKYldZZ1pHbHo1MzN6NEhiYnJpRi5oemQ1U0ZFYnF4QkpUSFpvay9VRlMuRDNJdXl0djhHIjt9', 1635814166);

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `line1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `line2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `line3` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `btn_text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `btn_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `social_media_links`
--

CREATE TABLE `social_media_links` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'if null = deactivate, else !null = activate',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `social_media_links`
--

INSERT INTO `social_media_links` (`id`, `name`, `url`, `created_at`, `updated_at`) VALUES
(1, 'facebook', NULL, '2021-10-20 22:58:16', '2021-10-20 22:58:16'),
(2, 'twitter', NULL, '2021-10-20 22:58:16', '2021-10-20 22:58:16'),
(3, 'linkedin', NULL, '2021-10-20 22:58:16', '2021-10-20 22:58:16'),
(4, 'pinterest', NULL, '2021-10-20 22:58:16', '2021-10-20 22:58:16'),
(5, 'youtube', NULL, '2021-10-20 22:58:16', '2021-10-20 22:58:16'),
(6, 'instagram', NULL, '2021-10-20 22:58:16', '2021-10-20 22:58:16'),
(7, 'tumblr', NULL, '2021-10-20 22:58:16', '2021-10-20 22:58:16'),
(8, 'snapchat', NULL, '2021-10-20 22:58:16', '2021-10-20 22:58:16'),
(9, 'whatsapp', NULL, '2021-10-20 22:58:16', '2021-10-20 22:58:16'),
(10, 'quora', NULL, '2021-10-20 22:58:16', '2021-10-20 22:58:16'),
(11, 'delicious', NULL, '2021-10-20 22:58:16', '2021-10-20 22:58:16'),
(12, 'digg', NULL, '2021-10-20 22:58:16', '2021-10-20 22:58:16');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_team` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `team_invitations`
--

CREATE TABLE `team_invitations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `team_id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `team_user`
--

CREATE TABLE `team_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `team_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `thana_lists`
--

CREATE TABLE `thana_lists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `district_list_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `thana_lists`
--

INSERT INTO `thana_lists` (`id`, `district_list_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 'Amtali', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(2, 1, 'Bamna', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(3, 1, 'Barguna Sadar', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(4, 1, 'Betagi', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(5, 1, 'Patharghata', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(6, 1, 'Taltali', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(7, 2, 'Agailzhara', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(8, 2, 'Agailzhara', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(9, 2, 'Babuganj', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(10, 2, 'Barajalia', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(11, 2, 'Barishal Sadar', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(12, 2, 'Gouranadi', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(13, 2, 'Mahendiganj', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(14, 2, 'Muladi', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(15, 2, 'Sahebganj', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(16, 2, 'Uzirpur', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(17, 3, 'Bhola Sadar', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(18, 3, 'Borhanuddin UPO', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(19, 3, 'Charfashion', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(20, 3, 'Doulatkhan', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(21, 3, 'Doulatkhan', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(22, 3, 'Hajirhat', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(23, 3, 'Hatshoshiganj', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(24, 3, 'Lalmohan UPO', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(25, 4, 'Jhalokathi Sadar', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(26, 4, 'Kathalia', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(27, 4, 'Nalchhiti', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(28, 4, 'Rajapur', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(29, 5, 'Bauphal', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(30, 5, 'Dashmina', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(31, 5, 'Galachipa', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(32, 5, 'Khepupara', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(33, 5, 'Patuakhali Sadar', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(34, 5, 'Subidkhali', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(35, 6, 'Banaripara', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(36, 6, 'kaukhali', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(37, 6, 'Mathbaria', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(38, 6, 'Nazirpur', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(39, 6, 'Pirojpur', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(40, 6, 'Sadar', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(41, 6, 'Swarupkathi', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(42, 7, 'Alikadam', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(43, 7, 'Bandarban Sadar', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(44, 7, 'Naikhong', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(45, 7, 'Roanchhari', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(46, 7, 'Ruma', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(47, 7, 'Thanchi', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(48, 7, 'Thanchi', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(49, 8, 'Akhaura', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(50, 8, 'Akhaura', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(51, 8, 'Banchharampur', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(52, 8, 'Brahamanbaria Sadar', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(53, 8, 'Kasba', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(54, 8, 'Nabinagar', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(55, 8, 'Nasirnagar', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(56, 8, 'Sarail', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(57, 9, 'Chandpur Sadar', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(58, 9, 'Faridganj', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(59, 9, 'Hajiganj', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(60, 9, 'Hayemchar', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(61, 9, 'Kachua', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(62, 9, 'Matlobganj', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(63, 9, 'Shahrasti', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(64, 10, 'Anawara', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(65, 10, 'Boalkhali', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(66, 10, 'Chittagong Sadar', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(67, 10, 'East Joara', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(68, 10, 'Fatikchhari', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(69, 10, 'Hathazari', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(70, 10, 'Jaldi', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(71, 10, 'Lohagara', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(72, 10, 'Mirsharai', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(73, 10, 'Patia Head Office', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(74, 10, 'Rangunia', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(75, 10, 'Rouzan', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(76, 10, 'Sandwip', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(77, 10, 'Satkania', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(78, 10, 'Sitakunda', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(79, 11, 'Barura', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(80, 11, 'Brahmanpara', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(81, 11, 'Burichang', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(82, 11, 'Chandina', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(83, 11, 'Chouddagram', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(84, 11, 'Comilla Sadar', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(85, 11, 'Daudkandi', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(86, 11, 'Davidhar', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(87, 11, 'Homna', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(88, 11, 'Laksam', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(89, 11, 'Langalkot', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(90, 11, 'Muradnagar', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(91, 12, 'Chiringga', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(92, 12, 'Cox\'s Bazar Sadar', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(93, 12, 'Gorakghat', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(94, 12, 'Kutubdia', '2021-10-20 22:28:49', '2021-10-20 22:28:49'),
(95, 12, 'Ramu', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(96, 12, 'Teknaf', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(97, 12, 'Ukhia', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(98, 13, 'Chhagalnaia', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(99, 13, 'Dagonbhuia', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(100, 13, 'Feni Sadar', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(101, 13, 'Pashurampur', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(102, 13, 'Sonagazi', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(103, 14, 'Diginala', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(104, 14, 'Khagrachhari Sadar', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(105, 14, 'Laxmichhari', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(106, 14, 'Mahalchhari', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(107, 14, 'Manikchhari', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(108, 14, 'Matiranga', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(109, 14, 'Panchhari', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(110, 14, 'Ramghar Head Office', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(111, 15, 'Char Alexgander', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(112, 15, 'Lakshimpur Sadar', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(113, 15, 'Ramganj', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(114, 15, 'Raypur', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(115, 16, 'Basurhat', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(116, 16, 'Begumganj', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(117, 16, 'Chatkhil', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(118, 16, 'Hatiya', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(119, 16, 'Noakhali Sadar', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(120, 16, 'Senbag', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(121, 17, 'Barakal', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(122, 17, 'Bilaichhari', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(123, 17, 'Jarachhari', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(124, 17, 'Kalampati', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(125, 17, 'kaptai', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(126, 17, 'Longachh', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(127, 17, 'Marishya', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(128, 17, 'Naniachhar', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(129, 17, 'Rajsthali', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(130, 17, 'Rangamati Sadar', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(131, 18, 'Demra', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(132, 18, 'Dhaka Cantt.', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(133, 18, 'Dhamrai', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(134, 18, 'Dhanmondi', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(135, 18, 'Gulshan', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(136, 18, 'Jatrabari', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(137, 18, 'Joypara', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(138, 18, 'Keraniganj', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(139, 18, 'Khilgaon', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(140, 18, 'Khilkhet', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(141, 18, 'Lalbag', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(142, 18, 'Mirpur', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(143, 18, 'Mohammadpur', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(144, 18, 'Motijheel', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(145, 18, 'Nawabganj', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(146, 18, 'New market', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(147, 18, 'Palton', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(148, 18, 'Ramna', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(149, 18, 'Sabujbag', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(150, 18, 'Savar', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(151, 18, 'Sutrapur', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(152, 18, 'Tejgaon', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(153, 18, 'Tejgaon Industrial Area', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(154, 18, 'Uttara', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(155, 19, 'Alfadanga', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(156, 19, 'Bhanga', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(157, 19, 'Boalmari', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(158, 19, 'Charbhadrasan', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(159, 19, 'Faridpur Sadar', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(160, 19, 'Madukhali', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(161, 19, 'Nagarkanda', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(162, 19, 'Sadarpur', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(163, 19, 'Shriangan', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(164, 20, 'Gazipur Sadar', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(165, 20, 'Kaliakaar', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(166, 20, 'Kaliganj', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(167, 20, 'Kapashia', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(168, 20, 'Monnunagar', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(169, 20, 'Sreepur', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(170, 20, 'Sripur', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(171, 21, 'Gopalganj Sadar', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(172, 21, 'Kashiani', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(173, 21, 'Kotalipara', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(174, 21, 'Maksudpur', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(175, 21, 'Tungipara', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(176, 22, 'Bajitpur', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(177, 22, 'Bhairob', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(178, 22, 'Hossenpur', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(179, 22, 'Itna', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(180, 22, 'Karimganj', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(181, 22, 'Katiadi', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(182, 22, 'Kishoreganj Sadar', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(183, 22, 'Kuliarchar', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(184, 22, 'Mithamoin', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(185, 22, 'Nikli', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(186, 22, 'Ostagram', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(187, 22, 'Pakundia', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(188, 22, 'Tarial', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(189, 23, 'Barhamganj', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(190, 23, 'kalkini', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(191, 23, 'Madaripur Sadar', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(192, 23, 'Rajoir', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(193, 24, 'Doulatpur', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(194, 24, 'Gheor', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(195, 24, 'Lechhraganj', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(196, 24, 'Manikganj Sadar', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(197, 24, 'Saturia', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(198, 24, 'Shibloya', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(199, 24, 'Singari', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(200, 25, 'Gajaria', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(201, 25, 'Lohajong', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(202, 25, 'Munshiganj Sadar', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(203, 25, 'Sirajdikhan', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(204, 25, 'Srinagar', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(205, 25, 'Tangibari', '2021-10-20 22:28:50', '2021-10-20 22:28:50'),
(206, 26, 'Araihazar', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(207, 26, 'Baidder Bazar', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(208, 26, 'Bandar', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(209, 26, 'Fatullah', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(210, 26, 'Narayanganj Sadar', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(211, 26, 'Rupganj', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(212, 26, 'Siddirganj', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(213, 27, 'Belabo', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(214, 27, 'Monohordi', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(215, 27, 'Narsingdi Sadar', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(216, 27, 'Palash', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(217, 27, 'Raypura', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(218, 27, 'Shibpur', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(219, 28, 'Baliakandi', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(220, 28, 'Pangsha', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(221, 28, 'Rajbari Sadar', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(222, 29, 'Bhedorganj', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(223, 29, 'Damudhya', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(224, 29, 'Gosairhat', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(225, 29, 'Jajira', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(226, 29, 'Naria', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(227, 29, 'Shariatpur Sadar', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(228, 30, 'Basail', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(229, 30, 'Bhuapur', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(230, 30, 'Delduar', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(231, 30, 'Ghatail', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(232, 30, 'Gopalpur', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(233, 30, 'Kashkaolia', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(234, 30, 'Madhupur', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(235, 30, 'Mirzapur', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(236, 30, 'Nagarpur', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(237, 30, 'Sakhipur', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(238, 30, 'Tangail Sadar', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(239, 31, 'Bagerhat Sadar', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(240, 31, 'Chalna Ankorage', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(241, 31, 'Chitalmari', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(242, 31, 'Fakirhat', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(243, 31, 'Kachua UPO', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(244, 31, 'Mollahat', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(245, 31, 'Morelganj', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(246, 31, 'Rampal', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(247, 31, 'Rayenda', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(248, 32, 'Alamdanga', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(249, 32, 'Chuadanga Sadar', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(250, 32, 'Damurhuda', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(251, 32, 'Doulatganj', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(252, 33, 'Bagharpara', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(253, 33, 'Chaugachha', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(254, 33, 'Jessore Sadar', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(255, 33, 'Jhikargachha', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(256, 33, 'Keshabpur', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(257, 33, 'Monirampur', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(258, 33, 'Noapara', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(259, 33, 'Sarsa', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(260, 34, 'Harinakundu', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(261, 34, 'Jhenaidah Sadar', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(262, 34, 'Kotchandpur', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(263, 34, 'Maheshpur', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(264, 34, 'Naldanga', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(265, 34, 'Shailakupa', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(266, 35, 'Alaipur', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(267, 35, 'Batiaghat', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(268, 35, 'Chalna Bazar', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(269, 35, 'Digalia', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(270, 35, 'Khulna Sadar', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(271, 35, 'Madinabad', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(272, 35, 'Paikgachha', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(273, 35, 'Phultala', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(274, 35, 'Sajiara', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(275, 35, 'Terakhada', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(276, 36, 'Bheramara', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(277, 36, 'Janipur', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(278, 36, 'Kumarkhali', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(279, 36, 'Kushtia Sadar', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(280, 36, 'Mirpur', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(281, 36, 'Rafayetpur', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(282, 37, 'Arpara', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(283, 37, 'Magura Sadar', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(284, 37, 'Mohammadpur', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(285, 37, 'Shripur', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(286, 38, 'Gangni', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(287, 38, 'Meherpur Sadar', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(288, 39, 'Kalia', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(289, 39, 'Laxmipasha', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(290, 39, 'Mohajan', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(291, 39, 'Narail Sadar', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(292, 40, 'Ashashuni', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(293, 40, 'Debbhata', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(294, 40, 'Kalaroa', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(295, 40, 'Kaliganj UPO', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(296, 40, 'Nakipur', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(297, 40, 'Satkhira Sadar', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(298, 40, 'Taala', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(299, 41, 'Dewangonj', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(300, 41, 'Islampur', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(301, 41, 'Jamalpur', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(302, 41, 'Malandah', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(303, 41, 'Mathargonj', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(304, 41, 'Shorishabari', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(305, 42, 'Bhaluka', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(306, 42, 'Fulbaria', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(307, 42, 'Gaforgaon', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(308, 42, 'Gouripur', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(309, 42, 'Haluaghat', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(310, 42, 'Isshwargonj', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(311, 42, 'Muktagachh', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(312, 42, 'Mymensingh Sadar', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(313, 42, 'Nandail', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(314, 42, 'Phulpur', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(315, 42, 'Trishal', '2021-10-20 22:28:51', '2021-10-20 22:28:51'),
(316, 43, 'Susung Durgapur', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(317, 43, 'Atpara', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(318, 43, 'Barhatta', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(319, 43, 'Dharmapasha', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(320, 43, 'Dhobaura', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(321, 43, 'Kalmakanda', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(322, 43, 'Kendua', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(323, 43, 'Khaliajuri', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(324, 43, 'Madan', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(325, 43, 'Moddhynagar', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(326, 43, 'Mohanganj', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(327, 43, 'Netrokona Sadar', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(328, 43, 'Purbadhola', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(329, 43, 'Susung Durgapur', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(330, 43, 'Atpara', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(331, 43, 'Barhatta', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(332, 43, 'Dharmapasha', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(333, 43, 'Dhobaura', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(334, 43, 'Kalmakanda', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(335, 43, 'Kendua', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(336, 43, 'Khaliajuri', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(337, 43, 'Madan', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(338, 43, 'Moddhynagar', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(339, 43, 'Mohanganj', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(340, 43, 'Netrokona Sadar', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(341, 44, 'Bakshigonj', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(342, 44, 'Jhinaigati', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(343, 44, 'Nakla', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(344, 44, 'Nalitabari', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(345, 44, 'Sherpur Shadar', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(346, 44, 'Shribardi', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(347, 45, 'Alamdighi', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(348, 45, 'Bogra Sadar', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(349, 45, 'Dhunat', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(350, 45, 'Dupchachia', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(351, 45, 'Gabtoli', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(352, 45, 'Kahalu', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(353, 45, 'Nandigram', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(354, 45, 'Sariakandi', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(355, 45, 'Sherpur', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(356, 45, 'Shibganj', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(357, 45, 'Sonatola', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(358, 46, 'Akkelpur', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(359, 46, 'Joypurhat Sadar', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(360, 46, 'kalai', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(361, 46, 'Khetlal', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(362, 46, 'panchbibi', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(363, 47, 'Ahsanganj', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(364, 47, 'Badalgachhi', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(365, 47, 'Dhamuirhat', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(366, 47, 'Mahadebpur', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(367, 47, 'Naogaon Sadar', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(368, 47, 'Niamatpur', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(369, 47, 'Nitpur', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(370, 47, 'Patnitala', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(371, 47, 'Prasadpur', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(372, 47, 'Raninagar', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(373, 47, 'Sapahar', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(374, 48, 'Gopalpur UPO', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(375, 48, 'Harua', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(376, 48, 'Hatgurudaspur', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(377, 48, 'Laxman', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(378, 48, 'Natore Sadar', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(379, 48, 'Singra', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(380, 49, 'Bholahat', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(381, 49, 'Chapinawabganj Sadar', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(382, 49, 'Nachol', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(383, 49, 'Rohanpur', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(384, 49, 'Shibganj U.P.O', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(385, 50, 'Banwarinagar', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(386, 50, 'Bera', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(387, 50, 'Bhangura', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(388, 50, 'Chatmohar', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(389, 50, 'Debottar', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(390, 50, 'Ishwardi', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(391, 50, 'Pabna Sadar', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(392, 50, 'Sathia', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(393, 50, 'Sujanagar', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(394, 51, 'Bagha', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(395, 51, 'Bhabaniganj', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(396, 51, 'Charghat', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(397, 51, 'Durgapur', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(398, 51, 'Godagari', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(399, 51, 'Khod Mohanpur', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(400, 51, 'Lalitganj', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(401, 51, 'Putia', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(402, 51, 'Rajshahi Sadar', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(403, 51, 'Tanor', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(404, 52, 'Baiddya Jam Toil', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(405, 52, 'Belkuchi', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(406, 52, 'Dhangora', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(407, 52, 'Kazipur', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(408, 52, 'Shahjadpur', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(409, 52, 'Sirajganj Sadar', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(410, 52, 'Tarash', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(411, 52, 'Ullapara', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(412, 53, 'Bangla Hili', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(413, 53, 'Biral', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(414, 53, 'Birampur', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(415, 53, 'Birganj', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(416, 53, 'Chrirbandar', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(417, 53, 'Dinajpur Sadar', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(418, 53, 'Khansama', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(419, 53, 'Maharajganj', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(420, 53, 'Nababganj', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(421, 53, 'Osmanpur', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(422, 53, 'Parbatipur', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(423, 53, 'Phulbari', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(424, 53, 'Setabganj', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(425, 54, 'Bonarpara', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(426, 54, 'Gaibandha Sadar', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(427, 54, 'Gobindaganj', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(428, 54, 'Palashbari', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(429, 54, 'Phulchhari', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(430, 54, 'Saadullapur', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(431, 54, 'Sundarganj', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(432, 55, 'Bhurungamari', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(433, 55, 'Chilmari', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(434, 55, 'Kurigram Sadar', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(435, 55, 'Nageshwar', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(436, 55, 'Rajarhat', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(437, 55, 'Rajibpur', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(438, 55, 'Roumari', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(439, 55, 'Ulipur', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(440, 56, 'Aditmari', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(441, 56, 'Hatibandha', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(442, 56, 'Lalmonirhat Sadar', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(443, 56, 'Patgram', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(444, 56, 'Tushbhandar', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(445, 57, 'Dimla', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(446, 57, 'Domar', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(447, 57, 'Jaldhaka', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(448, 57, 'Kishoriganj', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(449, 57, 'Nilphamari Sadar', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(450, 57, 'Syedpur', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(451, 58, 'Boda', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(452, 58, 'Chotto Dab', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(453, 58, 'Dabiganj', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(454, 58, 'Panchagra Sadar', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(455, 58, 'Tetulia', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(456, 59, 'Badarganj', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(457, 59, 'Gangachara', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(458, 59, 'Kaunia', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(459, 59, 'Mithapukur', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(460, 59, 'Pirgachha', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(461, 59, 'Rangpur Sadar', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(462, 59, 'Taraganj', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(463, 60, 'Baliadangi', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(464, 60, 'Jibanpur', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(465, 60, 'Pirganj', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(466, 60, 'Rani Sankail', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(467, 60, 'Thakurgaon Sadar', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(468, 61, 'Azmireeganj', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(469, 61, 'Bahubal', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(470, 61, 'Baniachang', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(471, 61, 'Chunarughat', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(472, 61, 'Habiganj Sadar', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(473, 61, 'Kalauk', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(474, 61, 'Madhabpur', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(475, 61, 'Nabiganj', '2021-10-20 22:28:52', '2021-10-20 22:28:52'),
(476, 62, 'Baralekha', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(477, 62, 'Kamalganj', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(478, 62, 'Kulaura', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(479, 62, 'Maulvi Bazar Sadar', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(480, 62, 'Rajnagar', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(481, 62, 'Srimangal', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(482, 63, 'Bishamsarpur', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(483, 63, 'Chhatak', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(484, 63, 'Dhirai Chandpur', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(485, 63, 'Duara bazar', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(486, 63, 'Ghungiar', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(487, 63, 'Jagnnathpur', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(488, 63, 'Sachna', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(489, 63, 'Sunamganj Sadar', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(490, 63, 'Tahirpur', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(491, 64, 'Balaganj', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(492, 64, 'Bianibazar', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(493, 64, 'Bishwanath', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(494, 64, 'Fenchuganj', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(495, 64, 'Goainhat', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(496, 64, 'Gopalganj', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(497, 64, 'Jaintapur', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(498, 64, 'Jakiganj', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(499, 64, 'Kanaighat', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(500, 64, 'Kompanyganj', '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(501, 64, 'Sylhet Sadar', '2021-10-20 22:28:53', '2021-10-20 22:28:53');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_type` tinyint(4) NOT NULL DEFAULT 3 COMMENT 'type 1 = supper admin, type 2 = admin, type 3 = customer',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'otp if used',
  `provider_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'ex-google, facebook',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_type`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `remember_token`, `current_team_id`, `profile_photo_path`, `otp`, `provider_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'Zakir Hossain', 'zakir7dipu@gmail.com', NULL, '$2y$10$aJbWYgZGlz533z4HbbriF.hzd5SFEbqxBJTHZok/UFS.D3Iuytv8G', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-20 22:28:53', '2021-10-20 22:28:53');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attribute_items`
--
ALTER TABLE `attribute_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_posts`
--
ALTER TABLE `blog_posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_post_comment_settings`
--
ALTER TABLE `blog_post_comment_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `district_lists`
--
ALTER TABLE `district_lists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `general_settings`
--
ALTER TABLE `general_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `post_office_lists`
--
ALTER TABLE `post_office_lists`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_media_links`
--
ALTER TABLE `social_media_links`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teams_user_id_index` (`user_id`);

--
-- Indexes for table `team_invitations`
--
ALTER TABLE `team_invitations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `team_invitations_team_id_email_unique` (`team_id`,`email`);

--
-- Indexes for table `team_user`
--
ALTER TABLE `team_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `team_user_team_id_user_id_unique` (`team_id`,`user_id`);

--
-- Indexes for table `thana_lists`
--
ALTER TABLE `thana_lists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `attribute_items`
--
ALTER TABLE `attribute_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `blog_posts`
--
ALTER TABLE `blog_posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_post_comment_settings`
--
ALTER TABLE `blog_post_comment_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `district_lists`
--
ALTER TABLE `district_lists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `general_settings`
--
ALTER TABLE `general_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post_office_lists`
--
ALTER TABLE `post_office_lists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1365;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `profiles`
--
ALTER TABLE `profiles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `social_media_links`
--
ALTER TABLE `social_media_links`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `team_invitations`
--
ALTER TABLE `team_invitations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `team_user`
--
ALTER TABLE `team_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `thana_lists`
--
ALTER TABLE `thana_lists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=502;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `team_invitations`
--
ALTER TABLE `team_invitations`
  ADD CONSTRAINT `team_invitations_team_id_foreign` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
