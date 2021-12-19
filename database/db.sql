-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 19, 2021 at 11:14 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.26

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
-- Table structure for table `accepted_by_admins`
--

CREATE TABLE `accepted_by_admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `permission` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `advertisements`
--

CREATE TABLE `advertisements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `line1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `line2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `line3` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `btn_text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `btn_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `advertisements`
--

INSERT INTO `advertisements` (`id`, `title`, `line1`, `line2`, `line3`, `btn_text`, `btn_url`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'ACTION CAMERAS', 'Starting From', '$399', NULL, 'SHOP NOW', 'javascript:void(0)', '/upload/advertises/1636188985ubymivDAC.jpg', 1, '2021-11-04 23:50:42', '2021-11-06 02:56:25'),
(2, 'FOR ALL STYLES', 'Starting From', '$199', NULL, 'SHOP NOW', 'javascript:void(0)', '/upload/advertises/1636189240g10f9pDAC.jpg', 1, '2021-11-04 23:50:42', '2021-11-06 03:00:40'),
(3, 'DRONE PRO 4', 'START THE REVOLUTION', '$499', NULL, 'SHOP NOW', 'javascript:void(0)', '/upload/advertises/1636189353sp7axcDAC.jpg', 1, '2021-11-04 23:50:42', '2021-11-06 03:03:01'),
(6, NULL, NULL, NULL, NULL, NULL, NULL, '/upload/advertises/1636193414gmk65fDAC.jpg', 1, '2021-11-06 03:56:04', '2021-11-06 04:10:24');

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
(48, 1, 2, 'Green', NULL, '#00FF00', '2021-11-08 03:17:21', '2021-11-08 03:17:21'),
(49, 1, 2, 'Red', NULL, '#ff0000', '2021-11-08 03:17:21', '2021-11-08 03:17:21'),
(50, 2, 2, 'Small', NULL, '22X12X17CM', '2021-11-08 03:17:21', '2021-11-08 03:17:21'),
(51, 2, 2, 'Medium', NULL, '31X14X26CM', '2021-11-08 03:17:21', '2021-11-08 03:17:21'),
(52, 2, 2, 'Big', NULL, '35X13X29CM', '2021-11-08 03:17:21', '2021-11-08 03:17:21');

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

--
-- Dumping data for table `blog_posts`
--

INSERT INTO `blog_posts` (`id`, `category_id`, `user_id`, `title`, `thumbnail`, `body`, `tags`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Jun Post Format - Image Gallery', '/upload/bolg-post/1636452630mj1slyDAC.jpg', '<p style=\"color:rgb(118,127,132);font-family:\'Open Sans\', sans-serif;font-size:13px;\">Euismod atras vulputate iltricies etri elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nulla nunc dui, tristique in semper vel, congue sed ligula.</p><p style=\"color:rgb(118,127,132);font-family:\'Open Sans\', sans-serif;font-size:13px;\">Nam dolor ligula, faucibus id sodales in, auctor fringilla libero. Pellentesque pellentesque tempor tellus eget hendrerit. Morbi id aliquam ligula. Aliquam id dui sem. Proin rhoncus consequat nisl, eu ornare mauris tincidunt vitae. Nulla aliquet turpis eget sodales scelerisque. Ut accumsan rhoncus sapien a dignissim. Sed vel ipsum nunc. Aliquam erat volutpat. Donec et dignissim elit. Etiam condimentum, ante sed rutrum auctor, quam arcu consequat massa, at gravida enim velit id nisl.</p><p style=\"color:rgb(118,127,132);font-family:\'Open Sans\', sans-serif;font-size:13px;\">Nullam non felis odio. Praesent aliquam magna est, nec volutpat quam aliquet non. Cras ut lobortis massa, a fringilla dolor. Quisque ornare est at felis consectetur mollis. Aliquam vitae metus et enim posuere ornare. Praesent sapien erat, pellentesque quis sollicitudin eget, imperdiet bibendum magna. Aenean sit amet odio est.</p><p style=\"color:rgb(118,127,132);font-family:\'Open Sans\', sans-serif;font-size:13px;\">Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Mauris quis est lobortis odio dignissim rutrum. Pellentesque blandit lacinia diam, a tincidunt felis tempus eget.</p><p style=\"color:rgb(118,127,132);font-family:\'Open Sans\', sans-serif;font-size:13px;\">Donec egestas metus non vehicula accumsan. Pellentesque sit amet tempor nibh. Mauris in risus lorem. Cras malesuada gravida massa eget viverra. Suspendisse vitae dolor erat. Morbi id rhoncus enim. In hac habitasse platea dictumst. Aenean lorem diam, venenatis nec venenatis id, adipiscing ac massa. Nam vel dui eget justo dictum pretium a rhoncus ipsum. Donec venenatis erat tincidunt nunc suscipit, sit amet bibendum lacus posuere. Sed scelerisque, dolor a pharetra sodales, mi augue consequat sapien, et interdum tellus leo et nunc. Nunc imperdiet eu libero ut imperdiet.</p><p style=\"color:rgb(118,127,132);font-family:\'Open Sans\', sans-serif;font-size:13px;\">Nunc varius ornare tortor. In dignissim quam eget quam sodales egestas. Nullam imperdiet velit feugiat, egestas risus nec, rhoncus felis. Suspendisse sagittis enim aliquet augue consequat facilisis. Nunc sit amet eleifend tellus. Etiam rhoncus turpis quam. Vestibulum eu lacus mattis, dignissim justo vel, fermentum nulla. Donec pharetra augue eget diam dictum, eu ullamcorper arcu feugiat.</p><p style=\"color:rgb(118,127,132);font-family:\'Open Sans\', sans-serif;font-size:13px;\">Proin ut ante vitae magna cursus porta. Aenean rutrum faucibus augue eu convallis. Phasellus condimentum elit id cursus sodales. Vivamus nec est consectetur, tincidunt augue at, tempor libero.</p>', 'test, post, blog', 'jun-post-format---image-gallery-1636452630', 1, '2021-11-09 04:10:30', '2021-11-09 04:10:30'),
(2, 1, 1, 'Jun Post Format - Image Gallery', '/upload/bolg-post/16364527635dcvq7DAC.jpg', '<p style=\"color:rgb(118,127,132);font-family:\'Open Sans\', sans-serif;font-size:13px;\">Euismod atras vulputate iltricies etri elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nulla nunc dui, tristique in semper vel, congue sed ligula.</p><p style=\"color:rgb(118,127,132);font-family:\'Open Sans\', sans-serif;font-size:13px;\">Nam dolor ligula, faucibus id sodales in, auctor fringilla libero. Pellentesque pellentesque tempor tellus eget hendrerit. Morbi id aliquam ligula. Aliquam id dui sem. Proin rhoncus consequat nisl, eu ornare mauris tincidunt vitae. Nulla aliquet turpis eget sodales scelerisque. Ut accumsan rhoncus sapien a dignissim. Sed vel ipsum nunc. Aliquam erat volutpat. Donec et dignissim elit. Etiam condimentum, ante sed rutrum auctor, quam arcu consequat massa, at gravida enim velit id nisl.</p><p style=\"color:rgb(118,127,132);font-family:\'Open Sans\', sans-serif;font-size:13px;\">Nullam non felis odio. Praesent aliquam magna est, nec volutpat quam aliquet non. Cras ut lobortis massa, a fringilla dolor. Quisque ornare est at felis consectetur mollis. Aliquam vitae metus et enim posuere ornare. Praesent sapien erat, pellentesque quis sollicitudin eget, imperdiet bibendum magna. Aenean sit amet odio est.</p><p style=\"color:rgb(118,127,132);font-family:\'Open Sans\', sans-serif;font-size:13px;\">Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Mauris quis est lobortis odio dignissim rutrum. Pellentesque blandit lacinia diam, a tincidunt felis tempus eget.</p><p style=\"color:rgb(118,127,132);font-family:\'Open Sans\', sans-serif;font-size:13px;\">Donec egestas metus non vehicula accumsan. Pellentesque sit amet tempor nibh. Mauris in risus lorem. Cras malesuada gravida massa eget viverra. Suspendisse vitae dolor erat. Morbi id rhoncus enim. In hac habitasse platea dictumst. Aenean lorem diam, venenatis nec venenatis id, adipiscing ac massa. Nam vel dui eget justo dictum pretium a rhoncus ipsum. Donec venenatis erat tincidunt nunc suscipit, sit amet bibendum lacus posuere. Sed scelerisque, dolor a pharetra sodales, mi augue consequat sapien, et interdum tellus leo et nunc. Nunc imperdiet eu libero ut imperdiet.</p><p style=\"color:rgb(118,127,132);font-family:\'Open Sans\', sans-serif;font-size:13px;\">Nunc varius ornare tortor. In dignissim quam eget quam sodales egestas. Nullam imperdiet velit feugiat, egestas risus nec, rhoncus felis. Suspendisse sagittis enim aliquet augue consequat facilisis. Nunc sit amet eleifend tellus. Etiam rhoncus turpis quam. Vestibulum eu lacus mattis, dignissim justo vel, fermentum nulla. Donec pharetra augue eget diam dictum, eu ullamcorper arcu feugiat.</p><p style=\"color:rgb(118,127,132);font-family:\'Open Sans\', sans-serif;font-size:13px;\">Proin ut ante vitae magna cursus porta. Aenean rutrum faucibus augue eu convallis. Phasellus condimentum elit id cursus sodales. Vivamus nec est consectetur, tincidunt augue at, tempor libero.</p>', 'test, post, blog', 'jun-post-format---image-gallery-1636452664', 1, '2021-11-09 04:11:04', '2021-11-09 04:12:43');

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

--
-- Dumping data for table `blog_post_comment_settings`
--

INSERT INTO `blog_post_comment_settings` (`id`, `code`, `created_at`, `updated_at`) VALUES
(1, '<div id=\"fb-root\"></div>\r\n<script async defer crossorigin=\"anonymous\" src=\"https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v12.0&appId=2097414370290215&autoLogAppEvents=1\" nonce=\"RV8U7nH9\"></script>\r\n<div class=\"fb-comments\" data-href=\"https://b.jadurhari.com/\" data-width=\"\"\r\n                                 data-numposts=\"5\"></div>', '2021-11-18 22:33:24', '2021-11-18 22:33:41');

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
(7, NULL, 'Mobiles', '/upload/categories/1634792981y4i7pjDAC.png', 'mobiles_1634792981', 1, '2021-10-20 23:09:41', '2021-10-20 23:09:41'),
(8, NULL, 'Electronics', '/upload/categories/16347929970irjq6DAC.png', 'electronics_1634792997', 1, '2021-10-20 23:09:57', '2021-10-20 23:09:57'),
(9, NULL, 'Food &amp; Beverage', '/upload/categories/1634793016vhai60DAC.png', 'food_&amp;_beverage_1634793016', 1, '2021-10-20 23:10:16', '2021-10-20 23:10:16'),
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
(24, 5, 'Shoes', '/upload/categories/1634793480hetkwlDAC.png', 'shoes_1634793480', 1, '2021-10-20 23:18:00', '2021-10-20 23:18:00');

-- --------------------------------------------------------

--
-- Table structure for table `cetegory_sections`
--

CREATE TABLE `cetegory_sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `show` tinyint(1) NOT NULL DEFAULT 1,
  `number_of_content` int(11) NOT NULL DEFAULT 6,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cetegory_sections`
--

INSERT INTO `cetegory_sections` (`id`, `show`, `number_of_content`, `created_at`, `updated_at`) VALUES
(1, 1, 6, '2021-11-02 21:04:37', '2021-11-02 21:05:11');

-- --------------------------------------------------------

--
-- Table structure for table `client_orders`
--

CREATE TABLE `client_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `invoice` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT 'No discount added...',
  `weight` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT 'Only show KG',
  `shipping` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT 'No shipping added...',
  `shipping_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'Client payed = 1, Company payed = 0.',
  `payment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Cash on delivery',
  `payment_trx` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Payment transaction number',
  `order_status` int(11) NOT NULL DEFAULT 1 COMMENT 'Canceled = 0, Pending = 1, Approved = 2, Process to delivery = 3, Delivered = 4.',
  `accepted_by` int(11) DEFAULT NULL COMMENT 'Who process this order.',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `client_orders`
--

INSERT INTO `client_orders` (`id`, `user_id`, `invoice`, `price`, `discount`, `weight`, `shipping`, `shipping_status`, `payment`, `payment_trx`, `order_status`, `accepted_by`, `created_at`, `updated_at`) VALUES
(1, 2, 'a0a3bf7b-8302-4ee1db1a7623', '4,640.00', '0', '1482', '0', 1, 'Cash on delivery', NULL, 0, 5, '2021-12-14 03:59:52', '2021-12-16 02:23:17'),
(2, 2, '58c8fed6-9aa9-fa8130609a38', '2,320.00', '0', '534643', '0', 1, 'Cash on delivery', NULL, 3, 1, '2021-12-14 05:06:56', '2021-12-16 02:19:23'),
(3, 2, '39dee519-327e-19d66a42d1bf', '2,000.00', '0', '534534', '0', 1, 'Cash on delivery', NULL, 2, 5, '2021-12-14 05:10:36', '2021-12-16 02:23:38'),
(4, 2, 'b785bbfb-7843-4be5056f63dd', '800.00', '0', '1232', '0', 1, 'Cash on delivery', NULL, 4, 5, '2021-12-14 05:12:36', '2021-12-16 02:23:49'),
(5, 2, '100005', '800.00', '0', '1232', '0', 1, 'Cash on delivery', NULL, 1, NULL, '2021-12-16 02:22:00', '2021-12-16 02:22:00'),
(6, 2, '100006', '1,620.00', '0', '120', '0', 1, 'Cash on delivery', NULL, 0, 1, '2021-12-17 09:28:21', '2021-12-17 09:31:36'),
(7, 2, '10007', '1,620.00', '0', '120', '0', 1, 'Cash on delivery', NULL, 1, NULL, '2021-12-18 01:39:36', '2021-12-18 01:39:36'),
(8, 2, '10008', '800.00', '0', '1232', '0', 1, 'Cash on delivery', NULL, 1, NULL, '2021-12-18 01:41:18', '2021-12-18 01:41:18'),
(9, 2, '10009', '2,000.00', '0', '534534', '0', 1, 'Cash on delivery', NULL, 1, NULL, '2021-12-18 01:45:00', '2021-12-18 01:45:00'),
(10, 2, '10010', '800.00', '0', '23523', '0', 1, 'Cash on delivery', NULL, 1, NULL, '2021-12-18 01:48:00', '2021-12-18 01:48:00'),
(11, 2, '10011', '1,600.00', '0', '423423', '0', 1, 'Cash on delivery', NULL, 1, NULL, '2021-12-18 01:50:27', '2021-12-18 01:50:27'),
(12, 2, '10012', '800.00', '0', '23523', '0', 1, 'Cash on delivery', NULL, 1, NULL, '2021-12-18 01:52:30', '2021-12-18 01:52:30'),
(13, 2, '10013', '1,600.00', '0', '423423', '0', 1, 'Cash on delivery', NULL, 1, NULL, '2021-12-18 01:53:43', '2021-12-18 01:53:43'),
(14, 2, '10014', '700.00', '0', '534523', '0', 1, 'Cash on delivery', NULL, 1, NULL, '2021-12-18 01:54:56', '2021-12-18 01:54:56'),
(15, 2, '10015', '600.00', '0', '10', '0', 1, 'Cash on delivery', NULL, 1, NULL, '2021-12-18 01:56:12', '2021-12-18 01:56:12'),
(16, 2, '10016', '2,000.00', '0', '534534', '0', 1, 'Cash on delivery', NULL, 1, NULL, '2021-12-18 01:57:26', '2021-12-18 01:57:26'),
(17, 2, '10017', '800.00', '0', '1232', '0', 1, 'Cash on delivery', NULL, 1, NULL, '2021-12-18 01:58:25', '2021-12-18 01:58:25'),
(18, 2, '10018', '700.00', '0', '534523', '0', 1, 'Cash on delivery', NULL, 1, NULL, '2021-12-18 02:02:20', '2021-12-18 02:02:20'),
(19, 2, '10019', '800.00', '0', '23523', '0', 1, 'Cash on delivery', NULL, 1, NULL, '2021-12-18 02:03:15', '2021-12-18 02:03:15'),
(20, 2, '10020', '800.00', '0', '23523', '0', 1, 'Cash on delivery', NULL, 1, NULL, '2021-12-19 00:23:38', '2021-12-19 00:23:38'),
(21, 2, '10021', '800.00', '0', '23523', '0', 1, 'Cash on delivery', NULL, 1, NULL, '2021-12-19 00:26:44', '2021-12-19 00:26:44'),
(22, 2, '10022', '800.00', '0', '23523', '0', 1, 'Cash on delivery', NULL, 1, NULL, '2021-12-19 00:27:34', '2021-12-19 00:27:34'),
(23, 2, '10023', '800.00', '0', '1232', '0', 1, 'Cash on delivery', NULL, 1, NULL, '2021-12-19 00:28:50', '2021-12-19 00:28:50'),
(24, 2, '10024', '600.00', '0', '10', '0', 1, 'Cash on delivery', NULL, 1, NULL, '2021-12-19 00:31:05', '2021-12-19 00:31:05'),
(25, 2, '10025', '800.00', '0', '1232', '0', 1, 'Cash on delivery', NULL, 1, NULL, '2021-12-19 00:36:23', '2021-12-19 00:36:23'),
(26, 2, '10026', '2,000.00', '0', '534534', '0', 1, 'Cash on delivery', NULL, 1, NULL, '2021-12-19 00:39:55', '2021-12-19 00:39:55'),
(27, 2, '10027', '600.00', '0', '10', '0', 1, 'bKash', 'bKash', 1, NULL, '2021-12-19 03:13:32', '2021-12-19 03:13:32'),
(28, 2, '10028', '1,620.00', '0', '120', '0', 1, 'bKash', 'asdfghjklqwertyuio12345678', 1, NULL, '2021-12-19 03:19:37', '2021-12-19 03:19:37'),
(29, 2, '10029', '800.00', '0', '23523', '0', 1, 'Cash on delivery', NULL, 1, NULL, '2021-12-19 03:30:32', '2021-12-19 03:30:32'),
(30, 2, '10030', '2,220.00', '0', '130', '0', 1, 'bKash', 'aqwsderfghjkasdxfcgvhbnjklwsdfghj', 1, NULL, '2021-12-19 04:14:12', '2021-12-19 04:14:12');

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '+88 0191 xxx xxxx',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'exxxxx@xxx.xxx',
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'example len street, example-xxx',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `phone`, `email`, `address`, `created_at`, `updated_at`) VALUES
(1, '+88 0191 xxx xxxx', 'exxxxx@xxx.xxx', 'xample len street, example-xxx', '2021-11-18 04:33:56', '2021-11-18 04:34:22');

-- --------------------------------------------------------

--
-- Table structure for table `company_infos`
--

CREATE TABLE `company_infos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `licence` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `company_infos`
--

INSERT INTO `company_infos` (`id`, `licence`, `date`, `status`, `created_at`, `updated_at`) VALUES
(1, 'ecommereadmin-1637229462-DAC', '2021-11-18', 1, '2021-11-18 03:57:42', '2021-11-18 03:57:42');

-- --------------------------------------------------------

--
-- Table structure for table `contact_messages`
--

CREATE TABLE `contact_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `contact-name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact-email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact-phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact-message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contact_messages`
--

INSERT INTO `contact_messages` (`id`, `contact-name`, `contact-email`, `contact-phone`, `contact-message`, `created_at`, `updated_at`) VALUES
(1, 'zakir Hossain', 'zakir7dipu@gmail.com', '01764470022', 'This is a testing mail', '2021-11-18 21:55:13', '2021-11-18 21:55:13'),
(2, 'zakir Hossain', 'zakir7dipu@gmail.com', '01764470022', 'test', '2021-12-15 23:22:57', '2021-12-15 23:22:57');

-- --------------------------------------------------------

--
-- Table structure for table `country_lists`
--

CREATE TABLE `country_lists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `country_lists`
--

INSERT INTO `country_lists` (`id`, `name`, `code`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Afghanistan', 'AF', 0, NULL, '2021-12-08 22:39:58'),
(2, 'Åland Islands', 'AX', 0, NULL, '2021-12-08 22:39:58'),
(3, 'Albania', 'AL', 0, NULL, '2021-12-08 22:39:58'),
(4, 'Algeria', 'DZ', 0, NULL, '2021-12-08 22:39:58'),
(5, 'American Samoa', 'AS', 0, NULL, '2021-12-08 22:39:58'),
(6, 'Andorra', 'AD', 0, NULL, '2021-12-08 22:39:58'),
(7, 'Angola', 'AO', 0, NULL, '2021-12-08 22:39:58'),
(8, 'Anguilla', 'AI', 0, NULL, '2021-12-08 22:39:58'),
(9, 'Antarctica', 'AQ', 0, NULL, '2021-12-08 22:39:58'),
(10, 'Antigua and Barbuda', 'AG', 0, NULL, '2021-12-08 22:39:58'),
(11, 'Argentina', 'AR', 0, NULL, '2021-12-08 22:39:58'),
(12, 'Armenia', 'AM', 0, NULL, '2021-12-08 22:39:58'),
(13, 'Aruba', 'AW', 0, NULL, '2021-12-08 22:39:58'),
(14, 'Australia', 'AU', 0, NULL, '2021-12-08 22:39:58'),
(15, 'Austria', 'AT', 0, NULL, '2021-12-08 22:39:58'),
(16, 'Azerbaijan', 'AZ', 0, NULL, '2021-12-08 22:39:58'),
(17, 'Bahamas', 'BS', 0, NULL, '2021-12-08 22:39:58'),
(18, 'Bahrain', 'BH', 0, NULL, '2021-12-08 22:39:58'),
(19, 'Bangladesh', 'BD', 1, NULL, '2021-12-08 22:39:58'),
(20, 'Barbados', 'BB', 0, NULL, '2021-12-08 22:39:58'),
(21, 'Belarus', 'BY', 0, NULL, '2021-12-08 22:39:58'),
(22, 'Belgium', 'BE', 0, NULL, '2021-12-08 22:39:58'),
(23, 'Belize', 'BZ', 0, NULL, '2021-12-08 22:39:58'),
(24, 'Benin', 'BJ', 0, NULL, '2021-12-08 22:39:58'),
(25, 'Bermuda', 'BM', 0, NULL, '2021-12-08 22:39:58'),
(26, 'Bhutan', 'BT', 0, NULL, '2021-12-08 22:39:58'),
(27, 'Bolivia, Plurinational State of', 'BO', 0, NULL, '2021-12-08 22:39:58'),
(28, 'Bonaire, Sint Eustatius and Saba', 'BQ', 0, NULL, '2021-12-08 22:39:58'),
(29, 'Bosnia and Herzegovina', 'BA', 0, NULL, '2021-12-08 22:39:58'),
(30, 'Botswana', 'BW', 0, NULL, '2021-12-08 22:39:58'),
(31, 'Bouvet Island', 'BV', 0, NULL, '2021-12-08 22:39:58'),
(32, 'Brazil', 'BR', 0, NULL, '2021-12-08 22:39:58'),
(33, 'British Indian Ocean Territory', 'IO', 0, NULL, '2021-12-08 22:39:58'),
(34, 'Brunei Darussalam', 'BN', 0, NULL, '2021-12-08 22:39:59'),
(35, 'Bulgaria', 'BG', 0, NULL, '2021-12-08 22:39:59'),
(36, 'Burkina Faso', 'BF', 0, NULL, '2021-12-08 22:39:59'),
(37, 'Burundi', 'BI', 0, NULL, '2021-12-08 22:39:59'),
(38, 'Cambodia', 'KH', 0, NULL, '2021-12-08 22:39:59'),
(39, 'Cameroon', 'CM', 0, NULL, '2021-12-08 22:39:59'),
(40, 'Canada', 'CA', 0, NULL, '2021-12-08 22:39:59'),
(41, 'Cape Verde', 'CV', 0, NULL, '2021-12-08 22:39:59'),
(42, 'Cayman Islands', 'KY', 0, NULL, '2021-12-08 22:39:59'),
(43, 'Central African Republic', 'CF', 0, NULL, '2021-12-08 22:39:59'),
(44, 'Chad', 'TD', 0, NULL, '2021-12-08 22:39:59'),
(45, 'Chile', 'CL', 0, NULL, '2021-12-08 22:39:59'),
(46, 'China', 'CN', 0, NULL, '2021-12-08 22:39:59'),
(47, 'Christmas Island', 'CX', 0, NULL, '2021-12-08 22:39:59'),
(48, 'Cocos (Keeling) Islands', 'CC', 0, NULL, '2021-12-08 22:39:59'),
(49, 'Colombia', 'CO', 0, NULL, '2021-12-08 22:39:59'),
(50, 'Comoros', 'KM', 0, NULL, '2021-12-08 22:39:59'),
(51, 'Congo', 'CG', 0, NULL, '2021-12-08 22:39:59'),
(52, 'Congo, the Democratic Republic of the', 'CD', 0, NULL, '2021-12-08 22:39:59'),
(53, 'Cook Islands', 'CK', 0, NULL, '2021-12-08 22:39:59'),
(54, 'Costa Rica', 'CR', 0, NULL, '2021-12-08 22:39:59'),
(55, 'Côte d\'Ivoire', 'CI', 0, NULL, '2021-12-08 22:39:59'),
(56, 'Croatia', 'HR', 0, NULL, '2021-12-08 22:39:59'),
(57, 'Cuba', 'CU', 0, NULL, '2021-12-08 22:39:59'),
(58, 'Curaçao', 'CW', 0, NULL, '2021-12-08 22:39:59'),
(59, 'Cyprus', 'CY', 0, NULL, '2021-12-08 22:39:59'),
(60, 'Czech Republic', 'CZ', 0, NULL, '2021-12-08 22:39:59'),
(61, 'Denmark', 'DK', 0, NULL, '2021-12-08 22:39:59'),
(62, 'Djibouti', 'DJ', 0, NULL, '2021-12-08 22:39:59'),
(63, 'Dominica', 'DM', 0, NULL, '2021-12-08 22:39:59'),
(64, 'Dominican Republic', 'DO', 0, NULL, '2021-12-08 22:39:59'),
(65, 'Ecuador', 'EC', 0, NULL, '2021-12-08 22:39:59'),
(66, 'Egypt', 'EG', 0, NULL, '2021-12-08 22:39:59'),
(67, 'El Salvador', 'SV', 0, NULL, '2021-12-08 22:39:59'),
(68, 'Equatorial Guinea', 'GQ', 0, NULL, '2021-12-08 22:39:59'),
(69, 'Eritrea', 'ER', 0, NULL, '2021-12-08 22:39:59'),
(70, 'Estonia', 'EE', 0, NULL, '2021-12-08 22:39:59'),
(71, 'Ethiopia', 'ET', 0, NULL, '2021-12-08 22:39:59'),
(72, 'Falkland Islands (Malvinas)', 'FK', 0, NULL, '2021-12-08 22:39:59'),
(73, 'Faroe Islands', 'FO', 0, NULL, '2021-12-08 22:39:59'),
(74, 'Fiji', 'FJ', 0, NULL, '2021-12-08 22:39:59'),
(75, 'Finland', 'FI', 0, NULL, '2021-12-08 22:39:59'),
(76, 'France', 'FR', 0, NULL, '2021-12-08 22:39:59'),
(77, 'French Guiana', 'GF', 0, NULL, '2021-12-08 22:39:59'),
(78, 'French Polynesia', 'PF', 0, NULL, '2021-12-08 22:39:59'),
(79, 'French Southern Territories', 'TF', 0, NULL, '2021-12-08 22:39:59'),
(80, 'Gabon', 'GA', 0, NULL, '2021-12-08 22:39:59'),
(81, 'Gambia', 'GM', 0, NULL, '2021-12-08 22:39:59'),
(82, 'Georgia', 'GE', 0, NULL, '2021-12-08 22:39:59'),
(83, 'Germany', 'DE', 0, NULL, '2021-12-08 22:39:59'),
(84, 'Ghana', 'GH', 0, NULL, '2021-12-08 22:39:59'),
(85, 'Gibraltar', 'GI', 0, NULL, '2021-12-08 22:39:59'),
(86, 'Greece', 'GR', 0, NULL, '2021-12-08 22:39:59'),
(87, 'Greenland', 'GL', 0, NULL, '2021-12-08 22:39:59'),
(88, 'Grenada', 'GD', 0, NULL, '2021-12-08 22:39:59'),
(89, 'Guadeloupe', 'GP', 0, NULL, '2021-12-08 22:39:59'),
(90, 'Guam', 'GU', 0, NULL, '2021-12-08 22:39:59'),
(91, 'Guatemala', 'GT', 0, NULL, '2021-12-08 22:39:59'),
(92, 'Guernsey', 'GG', 0, NULL, '2021-12-08 22:39:59'),
(93, 'Guinea', 'GN', 0, NULL, '2021-12-08 22:39:59'),
(94, 'Guinea-Bissau', 'GW', 0, NULL, '2021-12-08 22:39:59'),
(95, 'Guyana', 'GY', 0, NULL, '2021-12-08 22:39:59'),
(96, 'Haiti', 'HT', 0, NULL, '2021-12-08 22:40:00'),
(97, 'Heard Island and McDonald Mcdonald Islands', 'HM', 0, NULL, '2021-12-08 22:40:00'),
(98, 'Holy See (Vatican City State)', 'VA', 0, NULL, '2021-12-08 22:40:00'),
(99, 'Honduras', 'HN', 0, NULL, '2021-12-08 22:40:00'),
(100, 'Hong Kong', 'HK', 0, NULL, '2021-12-08 22:40:00'),
(101, 'Hungary', 'HU', 0, NULL, '2021-12-08 22:40:00'),
(102, 'Iceland', 'IS', 0, NULL, '2021-12-08 22:40:00'),
(103, 'India', 'IN', 0, NULL, '2021-12-08 22:40:00'),
(104, 'Indonesia', 'ID', 0, NULL, '2021-12-08 22:40:00'),
(105, 'Iran, Islamic Republic of', 'IR', 0, NULL, '2021-12-08 22:40:00'),
(106, 'Iraq', 'IQ', 0, NULL, '2021-12-08 22:40:00'),
(107, 'Ireland', 'IE', 0, NULL, '2021-12-08 22:40:00'),
(108, 'Isle of Man', 'IM', 0, NULL, '2021-12-08 22:40:00'),
(109, 'Israel', 'IL', 0, NULL, '2021-12-08 22:40:00'),
(110, 'Italy', 'IT', 0, NULL, '2021-12-08 22:40:00'),
(111, 'Jamaica', 'JM', 0, NULL, '2021-12-08 22:40:01'),
(112, 'Japan', 'JP', 0, NULL, '2021-12-08 22:40:01'),
(113, 'Jersey', 'JE', 0, NULL, '2021-12-08 22:40:01'),
(114, 'Jordan', 'JO', 0, NULL, '2021-12-08 22:40:01'),
(115, 'Kazakhstan', 'KZ', 0, NULL, '2021-12-08 22:40:01'),
(116, 'Kenya', 'KE', 0, NULL, '2021-12-08 22:40:01'),
(117, 'Kiribati', 'KI', 0, NULL, '2021-12-08 22:40:01'),
(118, 'Korea, Democratic People\'s Republic of', 'KP', 0, NULL, '2021-12-08 22:40:01'),
(119, 'Korea, Republic of', 'KR', 0, NULL, '2021-12-08 22:40:01'),
(120, 'Kuwait', 'KW', 0, NULL, '2021-12-08 22:40:01'),
(121, 'Kyrgyzstan', 'KG', 0, NULL, '2021-12-08 22:40:01'),
(122, 'Lao People\'s Democratic Republic', 'LA', 0, NULL, '2021-12-08 22:40:01'),
(123, 'Latvia', 'LV', 0, NULL, '2021-12-08 22:40:01'),
(124, 'Lebanon', 'LB', 0, NULL, '2021-12-08 22:40:01'),
(125, 'Lesotho', 'LS', 0, NULL, '2021-12-08 22:40:01'),
(126, 'Liberia', 'LR', 0, NULL, '2021-12-08 22:40:02'),
(127, 'Libya', 'LY', 0, NULL, '2021-12-08 22:40:02'),
(128, 'Liechtenstein', 'LI', 0, NULL, '2021-12-08 22:40:02'),
(129, 'Lithuania', 'LT', 0, NULL, '2021-12-08 22:40:02'),
(130, 'Luxembourg', 'LU', 0, NULL, '2021-12-08 22:40:02'),
(131, 'Macao', 'MO', 0, NULL, '2021-12-08 22:40:02'),
(132, 'Macedonia, the Former Yugoslav Republic of', 'MK', 0, NULL, '2021-12-08 22:40:02'),
(133, 'Madagascar', 'MG', 0, NULL, '2021-12-08 22:40:02'),
(134, 'Malawi', 'MW', 0, NULL, '2021-12-08 22:40:02'),
(135, 'Malaysia', 'MY', 0, NULL, '2021-12-08 22:40:02'),
(136, 'Maldives', 'MV', 0, NULL, '2021-12-08 22:40:02'),
(137, 'Mali', 'ML', 0, NULL, '2021-12-08 22:40:02'),
(138, 'Malta', 'MT', 0, NULL, '2021-12-08 22:40:02'),
(139, 'Marshall Islands', 'MH', 0, NULL, '2021-12-08 22:40:02'),
(140, 'Martinique', 'MQ', 0, NULL, '2021-12-08 22:40:02'),
(141, 'Mauritania', 'MR', 0, NULL, '2021-12-08 22:40:02'),
(142, 'Mauritius', 'MU', 0, NULL, '2021-12-08 22:40:02'),
(143, 'Mayotte', 'YT', 0, NULL, '2021-12-08 22:40:02'),
(144, 'Mexico', 'MX', 0, NULL, '2021-12-08 22:40:02'),
(145, 'Micronesia, Federated States of', 'FM', 0, NULL, '2021-12-08 22:40:02'),
(146, 'Moldova, Republic of', 'MD', 0, NULL, '2021-12-08 22:40:02'),
(147, 'Monaco', 'MC', 0, NULL, '2021-12-08 22:40:02'),
(148, 'Mongolia', 'MN', 0, NULL, '2021-12-08 22:40:02'),
(149, 'Montenegro', 'ME', 0, NULL, '2021-12-08 22:40:02'),
(150, 'Montserrat', 'MS', 0, NULL, '2021-12-08 22:40:02'),
(151, 'Morocco', 'MA', 0, NULL, '2021-12-08 22:40:02'),
(152, 'Mozambique', 'MZ', 0, NULL, '2021-12-08 22:40:02'),
(153, 'Myanmar', 'MM', 0, NULL, '2021-12-08 22:40:02'),
(154, 'Namibia', 'NA', 0, NULL, '2021-12-08 22:40:02'),
(155, 'Nauru', 'NR', 0, NULL, '2021-12-08 22:40:02'),
(156, 'Nepal', 'NP', 0, NULL, '2021-12-08 22:40:02'),
(157, 'Netherlands', 'NL', 0, NULL, '2021-12-08 22:40:02'),
(158, 'New Caledonia', 'NC', 0, NULL, '2021-12-08 22:40:02'),
(159, 'New Zealand', 'NZ', 0, NULL, '2021-12-08 22:40:02'),
(160, 'Nicaragua', 'NI', 0, NULL, '2021-12-08 22:40:02'),
(161, 'Niger', 'NE', 0, NULL, '2021-12-08 22:40:02'),
(162, 'Nigeria', 'NG', 0, NULL, '2021-12-08 22:40:02'),
(163, 'Niue', 'NU', 0, NULL, '2021-12-08 22:40:02'),
(164, 'Norfolk Island', 'NF', 0, NULL, '2021-12-08 22:40:02'),
(165, 'Northern Mariana Islands', 'MP', 0, NULL, '2021-12-08 22:40:02'),
(166, 'Norway', 'NO', 0, NULL, '2021-12-08 22:40:02'),
(167, 'Oman', 'OM', 0, NULL, '2021-12-08 22:40:02'),
(168, 'Pakistan', 'PK', 0, NULL, '2021-12-08 22:40:02'),
(169, 'Palau', 'PW', 0, NULL, '2021-12-08 22:40:02'),
(170, 'Palestine, State of', 'PS', 0, NULL, '2021-12-08 22:40:02'),
(171, 'Panama', 'PA', 0, NULL, '2021-12-08 22:40:02'),
(172, 'Papua New Guinea', 'PG', 0, NULL, '2021-12-08 22:40:02'),
(173, 'Paraguay', 'PY', 0, NULL, '2021-12-08 22:40:02'),
(174, 'Peru', 'PE', 0, NULL, '2021-12-08 22:40:02'),
(175, 'Philippines', 'PH', 0, NULL, '2021-12-08 22:40:02'),
(176, 'Pitcairn', 'PN', 0, NULL, '2021-12-08 22:40:02'),
(177, 'Poland', 'PL', 0, NULL, '2021-12-08 22:40:02'),
(178, 'Portugal', 'PT', 0, NULL, '2021-12-08 22:40:02'),
(179, 'Puerto Rico', 'PR', 0, NULL, '2021-12-08 22:40:02'),
(180, 'Qatar', 'QA', 0, NULL, '2021-12-08 22:40:02'),
(181, 'Réunion', 'RE', 0, NULL, '2021-12-08 22:40:02'),
(182, 'Romania', 'RO', 0, NULL, '2021-12-08 22:40:02'),
(183, 'Russian Federation', 'RU', 0, NULL, '2021-12-08 22:40:02'),
(184, 'Rwanda', 'RW', 0, NULL, '2021-12-08 22:40:02'),
(185, 'Saint Barthélemy', 'BL', 0, NULL, '2021-12-08 22:40:02'),
(186, 'Saint Helena, Ascension and Tristan da Cunha', 'SH', 0, NULL, '2021-12-08 22:40:02'),
(187, 'Saint Kitts and Nevis', 'KN', 0, NULL, '2021-12-08 22:40:02'),
(188, 'Saint Lucia', 'LC', 0, NULL, '2021-12-08 22:40:02'),
(189, 'Saint Martin (French part)', 'MF', 0, NULL, '2021-12-08 22:40:02'),
(190, 'Saint Pierre and Miquelon', 'PM', 0, NULL, '2021-12-08 22:40:02'),
(191, 'Saint Vincent and the Grenadines', 'VC', 0, NULL, '2021-12-08 22:40:03'),
(192, 'Samoa', 'WS', 0, NULL, '2021-12-08 22:40:03'),
(193, 'San Marino', 'SM', 0, NULL, '2021-12-08 22:40:03'),
(194, 'Sao Tome and Principe', 'ST', 0, NULL, '2021-12-08 22:40:03'),
(195, 'Saudi Arabia', 'SA', 0, NULL, '2021-12-08 22:40:03'),
(196, 'Senegal', 'SN', 0, NULL, '2021-12-08 22:40:03'),
(197, 'Serbia', 'RS', 0, NULL, '2021-12-08 22:40:03'),
(198, 'Seychelles', 'SC', 0, NULL, '2021-12-08 22:40:03'),
(199, 'Sierra Leone', 'SL', 0, NULL, '2021-12-08 22:40:03'),
(200, 'Singapore', 'SG', 0, NULL, '2021-12-08 22:40:03'),
(201, 'Sint Maarten (Dutch part)', 'SX', 0, NULL, '2021-12-08 22:40:03'),
(202, 'Slovakia', 'SK', 0, NULL, '2021-12-08 22:40:03'),
(203, 'Slovenia', 'SI', 0, NULL, '2021-12-08 22:40:03'),
(204, 'Solomon Islands', 'SB', 0, NULL, '2021-12-08 22:40:03'),
(205, 'Somalia', 'SO', 0, NULL, '2021-12-08 22:40:03'),
(206, 'South Africa', 'ZA', 0, NULL, '2021-12-08 22:40:03'),
(207, 'South Georgia and the South Sandwich Islands', 'GS', 0, NULL, '2021-12-08 22:40:03'),
(208, 'South Sudan', 'SS', 0, NULL, '2021-12-08 22:40:03'),
(209, 'Spain', 'ES', 0, NULL, '2021-12-08 22:40:03'),
(210, 'Sri Lanka', 'LK', 0, NULL, '2021-12-08 22:40:03'),
(211, 'Sudan', 'SD', 0, NULL, '2021-12-08 22:40:03'),
(212, 'Suriname', 'SR', 0, NULL, '2021-12-08 22:40:03'),
(213, 'Svalbard and Jan Mayen', 'SJ', 0, NULL, '2021-12-08 22:40:03'),
(214, 'Swaziland', 'SZ', 0, NULL, '2021-12-08 22:40:03'),
(215, 'Sweden', 'SE', 0, NULL, '2021-12-08 22:40:03'),
(216, 'Switzerland', 'CH', 0, NULL, '2021-12-08 22:40:03'),
(217, 'Syrian Arab Republic', 'SY', 0, NULL, '2021-12-08 22:40:03'),
(218, 'Taiwan', 'TW', 0, NULL, '2021-12-08 22:40:03'),
(219, 'Tajikistan', 'TJ', 0, NULL, '2021-12-08 22:40:03'),
(220, 'Tanzania, United Republic of', 'TZ', 0, NULL, '2021-12-08 22:40:03'),
(221, 'Thailand', 'TH', 0, NULL, '2021-12-08 22:40:03'),
(222, 'Timor-Leste', 'TL', 0, NULL, '2021-12-08 22:40:03'),
(223, 'Togo', 'TG', 0, NULL, '2021-12-08 22:40:03'),
(224, 'Tokelau', 'TK', 0, NULL, '2021-12-08 22:40:03'),
(225, 'Tonga', 'TO', 0, NULL, '2021-12-08 22:40:03'),
(226, 'Trinidad and Tobago', 'TT', 0, NULL, '2021-12-08 22:40:04'),
(227, 'Tunisia', 'TN', 0, NULL, '2021-12-08 22:40:04'),
(228, 'Turkey', 'TR', 0, NULL, '2021-12-08 22:40:04'),
(229, 'Turkmenistan', 'TM', 0, NULL, '2021-12-08 22:40:04'),
(230, 'Turks and Caicos Islands', 'TC', 0, NULL, '2021-12-08 22:40:04'),
(231, 'Tuvalu', 'TV', 0, NULL, '2021-12-08 22:40:04'),
(232, 'Uganda', 'UG', 0, NULL, '2021-12-08 22:40:04'),
(233, 'Ukraine', 'UA', 0, NULL, '2021-12-08 22:40:04'),
(234, 'United Arab Emirates', 'AE', 0, NULL, '2021-12-08 22:40:04'),
(235, 'United Kingdom', 'GB', 0, NULL, '2021-12-08 22:40:04'),
(236, 'United States', 'US', 0, NULL, '2021-12-08 22:40:04'),
(237, 'United States Minor Outlying Islands', 'UM', 0, NULL, '2021-12-08 22:40:04'),
(238, 'Uruguay', 'UY', 0, NULL, '2021-12-08 22:40:04'),
(239, 'Uzbekistan', 'UZ', 0, NULL, '2021-12-08 22:40:04'),
(240, 'Vanuatu', 'VU', 0, NULL, '2021-12-08 22:40:04'),
(241, 'Venezuela, Bolivarian Republic of', 'VE', 0, NULL, '2021-12-08 22:40:04'),
(242, 'Viet Nam', 'VN', 0, NULL, '2021-12-08 22:40:04'),
(243, 'Virgin Islands, British', 'VG', 0, NULL, '2021-12-08 22:40:04'),
(244, 'Virgin Islands, U.S.', 'VI', 0, NULL, '2021-12-08 22:40:04'),
(245, 'Wallis and Futuna', 'WF', 0, NULL, '2021-12-08 22:40:04'),
(246, 'Western Sahara', 'EH', 0, NULL, '2021-12-08 22:40:04'),
(247, 'Yemen', 'YE', 0, NULL, '2021-12-08 22:40:04'),
(248, 'Zambia', 'ZM', 0, NULL, '2021-12-08 22:40:04'),
(249, 'Zimbabwe', 'ZW', 0, NULL, '2021-12-08 22:40:04');

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
  `country_list_id` bigint(20) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `district_lists`
--

INSERT INTO `district_lists` (`id`, `country_list_id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 19, 'Barguna', 1, '2021-12-08 22:35:38', '2021-12-08 22:40:04'),
(2, 19, 'Barisal', 1, '2021-12-08 22:35:39', '2021-12-08 22:40:04'),
(3, 19, 'Bhola', 1, '2021-12-08 22:35:41', '2021-12-08 22:40:04'),
(4, 19, 'Jhalokati', 1, '2021-12-08 22:35:42', '2021-12-08 22:40:04'),
(5, 19, 'Patuakhali', 1, '2021-12-08 22:35:43', '2021-12-08 22:40:04'),
(6, 19, 'Pirojpur', 1, '2021-12-08 22:35:44', '2021-12-08 22:40:04'),
(7, 19, 'Bandarbant', 1, '2021-12-08 22:35:44', '2021-12-08 22:40:04'),
(8, 19, 'Brahmanbaria', 1, '2021-12-08 22:35:45', '2021-12-08 22:40:04'),
(9, 19, 'Chandpur', 1, '2021-12-08 22:35:46', '2021-12-08 22:40:04'),
(10, 19, 'Chattogram', 1, '2021-12-08 22:35:47', '2021-12-08 22:40:04'),
(11, 19, 'Comilla', 1, '2021-12-08 22:35:49', '2021-12-08 22:40:04'),
(12, 19, 'Cox\'sBazar', 1, '2021-12-08 22:35:51', '2021-12-08 22:40:04'),
(13, 19, 'Feni', 1, '2021-12-08 22:35:51', '2021-12-08 22:40:04'),
(14, 19, 'Khagrachhari', 1, '2021-12-08 22:35:52', '2021-12-08 22:40:04'),
(15, 19, 'Lakshmipur', 1, '2021-12-08 22:35:52', '2021-12-08 22:40:04'),
(16, 19, 'Noakhali', 1, '2021-12-08 22:35:53', '2021-12-08 22:40:04'),
(17, 19, 'Rangamati', 1, '2021-12-08 22:35:54', '2021-12-08 22:40:04'),
(18, 19, 'Dhaka', 1, '2021-12-08 22:35:55', '2021-12-08 22:40:04'),
(19, 19, 'Faridpur', 1, '2021-12-08 22:35:57', '2021-12-08 22:40:05'),
(20, 19, 'Gazipur', 1, '2021-12-08 22:35:58', '2021-12-08 22:40:05'),
(21, 19, 'Gopalganj', 1, '2021-12-08 22:35:58', '2021-12-08 22:40:05'),
(22, 19, 'Kishoreganj', 1, '2021-12-08 22:35:59', '2021-12-08 22:40:05'),
(23, 19, 'Madaripur', 1, '2021-12-08 22:36:01', '2021-12-08 22:40:05'),
(24, 19, 'Manikganj', 1, '2021-12-08 22:36:01', '2021-12-08 22:40:05'),
(25, 19, 'Kishoreganj', 1, '2021-12-08 22:36:02', '2021-12-08 22:40:05'),
(26, 19, 'Narayanganj', 1, '2021-12-08 22:36:03', '2021-12-08 22:40:05'),
(27, 19, 'Narsingdi', 1, '2021-12-08 22:36:03', '2021-12-08 22:40:05'),
(28, 19, 'Rajbari', 1, '2021-12-08 22:36:05', '2021-12-08 22:40:05'),
(29, 19, 'Shariatpur', 1, '2021-12-08 22:36:05', '2021-12-08 22:40:05'),
(30, 19, 'Tangail', 1, '2021-12-08 22:36:05', '2021-12-08 22:40:05'),
(31, 19, 'Bagerhat', 1, '2021-12-08 22:36:07', '2021-12-08 22:40:05'),
(32, 19, 'Chuadanga', 1, '2021-12-08 22:36:07', '2021-12-08 22:40:05'),
(33, 19, 'Jessore', 1, '2021-12-08 22:36:08', '2021-12-08 22:40:05'),
(34, 19, 'Jhenaidah', 1, '2021-12-08 22:36:09', '2021-12-08 22:40:05'),
(35, 19, 'Khulna', 1, '2021-12-08 22:36:09', '2021-12-08 22:40:05'),
(36, 19, 'Kushtia', 1, '2021-12-08 22:36:10', '2021-12-08 22:40:05'),
(37, 19, 'Magura', 1, '2021-12-08 22:36:11', '2021-12-08 22:40:05'),
(38, 19, 'Meherpur', 1, '2021-12-08 22:36:12', '2021-12-08 22:40:05'),
(39, 19, 'Narail', 1, '2021-12-08 22:36:12', '2021-12-08 22:40:05'),
(40, 19, 'Satkhira', 1, '2021-12-08 22:36:12', '2021-12-08 22:40:05'),
(41, 19, 'Jamalpur', 1, '2021-12-08 22:36:13', '2021-12-08 22:40:05'),
(42, 19, 'Mymensingh', 1, '2021-12-08 22:36:13', '2021-12-08 22:40:05'),
(43, 19, 'Netrokona', 1, '2021-12-08 22:36:15', '2021-12-08 22:40:05'),
(44, 19, 'Sherpur', 1, '2021-12-08 22:36:17', '2021-12-08 22:40:05'),
(45, 19, 'Bogura', 1, '2021-12-08 22:36:17', '2021-12-08 22:40:05'),
(46, 19, 'Joypurhat', 1, '2021-12-08 22:36:17', '2021-12-08 22:40:05'),
(47, 19, 'Naogaon', 1, '2021-12-08 22:36:19', '2021-12-08 22:40:05'),
(48, 19, 'Natore', 1, '2021-12-08 22:36:19', '2021-12-08 22:40:05'),
(49, 19, 'Chapainawabganj', 1, '2021-12-08 22:36:19', '2021-12-08 22:40:05'),
(50, 19, 'Pabna', 1, '2021-12-08 22:36:20', '2021-12-08 22:40:05'),
(51, 19, 'Rajshahi', 1, '2021-12-08 22:36:21', '2021-12-08 22:40:05'),
(52, 19, 'Sirajganj', 1, '2021-12-08 22:36:22', '2021-12-08 22:40:05'),
(53, 19, 'Dinajpur', 1, '2021-12-08 22:36:22', '2021-12-08 22:40:05'),
(54, 19, 'Gaibandha', 1, '2021-12-08 22:36:24', '2021-12-08 22:40:05'),
(55, 19, 'Kurigram', 1, '2021-12-08 22:36:24', '2021-12-08 22:40:05'),
(56, 19, 'Lalmonirhat', 1, '2021-12-08 22:36:25', '2021-12-08 22:40:05'),
(57, 19, 'Nilphamari', 1, '2021-12-08 22:36:26', '2021-12-08 22:40:05'),
(58, 19, 'Panchagarh', 1, '2021-12-08 22:36:26', '2021-12-08 22:40:05'),
(59, 19, 'Rangpur', 1, '2021-12-08 22:36:26', '2021-12-08 22:40:05'),
(60, 19, 'Thakurgaon', 1, '2021-12-08 22:36:26', '2021-12-08 22:40:05'),
(61, 19, 'Habiganj', 1, '2021-12-08 22:36:27', '2021-12-08 22:40:05'),
(62, 19, 'Moulvibazar', 1, '2021-12-08 22:36:28', '2021-12-08 22:40:05'),
(63, 19, 'Sunamganj', 1, '2021-12-08 22:36:29', '2021-12-08 22:40:05'),
(64, 19, 'Sylhet', 1, '2021-12-08 22:36:30', '2021-12-08 22:40:05');

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
-- Table structure for table `feature_products`
--

CREATE TABLE `feature_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `show` tinyint(1) NOT NULL DEFAULT 1,
  `number_of_content` int(11) NOT NULL DEFAULT 6,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `feature_products`
--

INSERT INTO `feature_products` (`id`, `title`, `show`, `number_of_content`, `created_at`, `updated_at`) VALUES
(1, 'Featured Products', 1, 6, '2021-11-02 10:24:12', '2021-11-28 07:59:57');

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
  `info_section_show` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `general_settings`
--

INSERT INTO `general_settings` (`id`, `site_name`, `meta_keyword`, `meta_description`, `location_map`, `logo`, `favicon`, `site_tag_image`, `info_section_show`, `created_at`, `updated_at`) VALUES
(1, 'JS Accessories', 'online shopping', 'This is a online e-commerce site....', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3648.8895533356776!2d90.2446309147299!3d23.858055384536428!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3755ebdf5e37cba3%3A0x3989ef1f96f1d277!2sBadda%20Government%20Primary%20School!5e0!3m2!1sen!2sbd!4v1629040760976!5m2!1sen!2sbd', '/upload/settings/1639040287nsz846DAC.png', '/upload/settings/1639039409bgzj63DAC.png', '/upload/settings/1639039409omfycpDAC.png', 1, '2021-10-20 22:41:24', '2021-12-09 02:58:07');

-- --------------------------------------------------------

--
-- Table structure for table `info_sections`
--

CREATE TABLE `info_sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `info_sections`
--

INSERT INTO `info_sections` (`id`, `title`, `sub_title`, `description`, `icon`, `created_at`, `updated_at`) VALUES
(1, 'FREE SHIPPING & RETURNS', 'All Orders Over $99', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis nec vestibulum magna, et dapibus.', '/upload/settings/1636082075iaj7xrDAC.png', '2021-11-03 01:19:53', '2021-11-04 21:14:35'),
(2, 'MONEY BACK GUARANTEE', 'Safe & Fast', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis nec vestibulum magna, et dapibus.', '/upload/settings/163608209472w1t6DAC.png', '2021-11-03 01:19:53', '2021-11-04 21:14:54'),
(3, 'ONLINE SUPPORT', 'Need Assistence?', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis nec vestibulum magna, et dapibus.', '/upload/settings/1636082108iq16u7DAC.png', '2021-11-03 01:19:53', '2021-11-04 21:15:08');

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
(30, '2021_10_31_094142_create_sliders_table', 2),
(31, '2021_11_02_154151_create_feature_products_table', 3),
(32, '2021_11_03_025010_create_cetegory_sections_table', 4),
(33, '2021_11_03_031733_create_new_arrival_products_sections_table', 5),
(34, '2021_11_03_055759_create_product_filter_gallery_sections_table', 6),
(35, '2021_11_03_065932_create_info_sections_table', 7),
(36, '2021_11_05_053413_create_advertisements_table', 8),
(37, '2021_11_13_032615_create_pages_table', 9),
(38, '2021_11_13_034315_create_page_sections_table', 10),
(40, '2021_11_18_083940_create_company_infos_table', 11),
(43, '2021_11_18_100534_create_companies_table', 12),
(44, '2021_11_19_033426_create_contact_messages_table', 13),
(45, '2021_12_04_030336_create_permission_tables', 14),
(46, '2021_12_07_051921_create_country_lists_table', 14),
(48, '2021_12_13_032251_create_payment_methods_table', 15),
(53, '2021_12_14_033620_create_client_orders_table', 16),
(54, '2021_12_14_033829_create_ordered_products_table', 16),
(55, '2021_12_14_034953_create_accepted_by_admins_table', 16),
(56, '2021_12_14_035955_create_order_shipping_addresses_table', 16),
(57, '2021_12_18_080831_create_subscribtions_table', 17);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 5),
(3, 'App\\Models\\User', 2);

-- --------------------------------------------------------

--
-- Table structure for table `new_arrival_products_sections`
--

CREATE TABLE `new_arrival_products_sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `show` tinyint(1) NOT NULL DEFAULT 1,
  `number_of_content` int(11) NOT NULL DEFAULT 6,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `new_arrival_products_sections`
--

INSERT INTO `new_arrival_products_sections` (`id`, `title`, `show`, `number_of_content`, `created_at`, `updated_at`) VALUES
(1, 'New Arrivals', 1, 6, '2021-11-02 21:34:40', '2021-11-02 23:55:30');

-- --------------------------------------------------------

--
-- Table structure for table `ordered_products`
--

CREATE TABLE `ordered_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `specification` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int(11) NOT NULL,
  `price_qty` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ordered_products`
--

INSERT INTO `ordered_products` (`id`, `product_id`, `order_id`, `specification`, `qty`, `price_qty`, `discount`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 'Size: Small Color: Green', 2, '3,240.00', '360', '2021-12-14 03:59:53', '2021-12-14 03:59:53'),
(2, 3, 1, ' ', 1, '600.00', '0', '2021-12-14 03:59:53', '2021-12-14 03:59:53'),
(3, 4, 1, ' ', 1, '800.00', '0', '2021-12-14 03:59:53', '2021-12-14 03:59:53'),
(4, 2, 2, 'Size: Small Color: Green', 1, '1,620.00', '180', '2021-12-14 05:06:56', '2021-12-14 05:06:56'),
(5, 5, 2, ' ', 1, '700.00', '0', '2021-12-14 05:06:56', '2021-12-14 05:06:56'),
(6, 7, 3, ' ', 1, '2,000.00', '0', '2021-12-14 05:10:36', '2021-12-14 05:10:36'),
(7, 4, 4, ' ', 1, '800.00', '0', '2021-12-14 05:12:37', '2021-12-14 05:12:37'),
(8, 4, 5, ' ', 1, '800.00', '0', '2021-12-16 02:22:01', '2021-12-16 02:22:01'),
(9, 2, 6, 'Size: Small Color: Green', 1, '1,620.00', '180', '2021-12-17 09:28:21', '2021-12-17 09:28:21'),
(10, 2, 7, 'Size: Small Color: Green', 1, '1,620.00', '180', '2021-12-18 01:39:37', '2021-12-18 01:39:37'),
(11, 4, 8, ' ', 1, '800.00', '0', '2021-12-18 01:41:18', '2021-12-18 01:41:18'),
(12, 7, 9, ' ', 1, '2,000.00', '0', '2021-12-18 01:45:00', '2021-12-18 01:45:00'),
(13, 9, 10, ' ', 1, '800.00', '0', '2021-12-18 01:48:00', '2021-12-18 01:48:00'),
(14, 8, 11, ' ', 1, '1,600.00', '0', '2021-12-18 01:50:27', '2021-12-18 01:50:27'),
(15, 9, 12, ' ', 1, '800.00', '0', '2021-12-18 01:52:30', '2021-12-18 01:52:30'),
(16, 8, 13, ' ', 1, '1,600.00', '0', '2021-12-18 01:53:43', '2021-12-18 01:53:43'),
(17, 5, 14, ' ', 1, '700.00', '0', '2021-12-18 01:54:56', '2021-12-18 01:54:56'),
(18, 3, 15, ' ', 1, '600.00', '0', '2021-12-18 01:56:12', '2021-12-18 01:56:12'),
(19, 7, 16, ' ', 1, '2,000.00', '0', '2021-12-18 01:57:26', '2021-12-18 01:57:26'),
(20, 4, 17, ' ', 1, '800.00', '0', '2021-12-18 01:58:26', '2021-12-18 01:58:26'),
(21, 5, 18, ' ', 1, '700.00', '0', '2021-12-18 02:02:21', '2021-12-18 02:02:21'),
(22, 9, 19, ' ', 1, '800.00', '0', '2021-12-18 02:03:15', '2021-12-18 02:03:15'),
(23, 9, 20, ' ', 1, '800.00', '0', '2021-12-19 00:23:38', '2021-12-19 00:23:38'),
(24, 9, 21, ' ', 1, '800.00', '0', '2021-12-19 00:26:45', '2021-12-19 00:26:45'),
(25, 9, 22, ' ', 1, '800.00', '0', '2021-12-19 00:27:35', '2021-12-19 00:27:35'),
(26, 4, 23, ' ', 1, '800.00', '0', '2021-12-19 00:28:50', '2021-12-19 00:28:50'),
(27, 3, 24, ' ', 1, '600.00', '0', '2021-12-19 00:31:06', '2021-12-19 00:31:06'),
(28, 4, 25, ' ', 1, '800.00', '0', '2021-12-19 00:36:23', '2021-12-19 00:36:23'),
(29, 7, 26, ' ', 1, '2,000.00', '0', '2021-12-19 00:39:56', '2021-12-19 00:39:56'),
(30, 3, 27, ' ', 1, '600.00', '0', '2021-12-19 03:13:32', '2021-12-19 03:13:32'),
(31, 2, 28, 'Size: Small Color: Green', 1, '1,620.00', '180', '2021-12-19 03:19:37', '2021-12-19 03:19:37'),
(32, 9, 29, ' ', 1, '800.00', '0', '2021-12-19 03:30:32', '2021-12-19 03:30:32'),
(33, 2, 30, 'Size: Small Color: Green', 1, '1,620.00', '180', '2021-12-19 04:14:13', '2021-12-19 04:14:13'),
(34, 3, 30, ' ', 1, '600.00', '0', '2021-12-19 04:14:13', '2021-12-19 04:14:13');

-- --------------------------------------------------------

--
-- Table structure for table `order_shipping_addresses`
--

CREATE TABLE `order_shipping_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street_address` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `police_station` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_shipping_addresses`
--

INSERT INTO `order_shipping_addresses` (`id`, `order_id`, `name`, `company`, `street_address`, `police_station`, `state`, `postal_code`, `country`, `phone`, `created_at`, `updated_at`) VALUES
(1, 1, 'zakir Hossain', NULL, '58/6, Dogormura', 'Savar', 'Dhaka', '1340', 'Bangladesh', '01764470022', '2021-12-14 03:59:53', '2021-12-14 03:59:53'),
(2, 2, 'zakir Hossain', NULL, '58/6, Dogormura', 'Savar', 'Dhaka', '1340', 'Bangladesh', '01764470022', '2021-12-14 05:06:56', '2021-12-14 05:06:56'),
(3, 3, 'zakir Hossain', NULL, '58/6, Dogormura', 'Savar', 'Dhaka', '1340', 'Bangladesh', '01764470022', '2021-12-14 05:10:36', '2021-12-14 05:10:36'),
(4, 4, 'zakir Hossain', NULL, '58/6, Dogormura', 'Savar', 'Dhaka', '1340', 'Bangladesh', '01764470022', '2021-12-14 05:12:37', '2021-12-14 05:12:37'),
(5, 5, 'zakir Hossain', NULL, '58/6, Dogormura', 'Savar', 'Dhaka', '1340', 'Bangladesh', '01764470022', '2021-12-16 02:22:01', '2021-12-16 02:22:01'),
(6, 6, 'Z', NULL, '58/6, Dogormura', 'Bamna', 'Dhaka', '1340', 'Bangladesh', '01764470022', '2021-12-17 09:28:21', '2021-12-17 09:28:21'),
(7, 7, 'zakir Hossain', NULL, '58/6, Dogormura', 'Savar', 'Dhaka', '1340', 'Bangladesh', '01764470022', '2021-12-18 01:39:37', '2021-12-18 01:39:37'),
(8, 8, 'zakir Hossain', NULL, '58/6, Dogormura', 'Savar', 'Dhaka', '1340', 'Bangladesh', '01764470022', '2021-12-18 01:41:18', '2021-12-18 01:41:18'),
(9, 9, 'zakir Hossain', NULL, '58/6, Dogormura', 'Savar', 'Dhaka', '1340', 'Bangladesh', '01764470022', '2021-12-18 01:45:00', '2021-12-18 01:45:00'),
(10, 10, 'zakir Hossain', NULL, '58/6, Dogormura', 'Savar', 'Dhaka', '1340', 'Bangladesh', '01764470022', '2021-12-18 01:48:00', '2021-12-18 01:48:00'),
(11, 11, 'zakir Hossain', NULL, '58/6, Dogormura', 'Savar', 'Dhaka', '1340', 'Bangladesh', '01764470022', '2021-12-18 01:50:27', '2021-12-18 01:50:27'),
(12, 12, 'zakir Hossain', NULL, '58/6, Dogormura', 'Savar', 'Dhaka', '1340', 'Bangladesh', '01764470022', '2021-12-18 01:52:30', '2021-12-18 01:52:30'),
(13, 13, 'zakir Hossain', NULL, '58/6, Dogormura', 'Savar', 'Dhaka', '1340', 'Bangladesh', '01764470022', '2021-12-18 01:53:43', '2021-12-18 01:53:43'),
(14, 14, 'zakir Hossain', NULL, '58/6, Dogormura', 'Savar', 'Dhaka', '1340', 'Bangladesh', '01764470022', '2021-12-18 01:54:56', '2021-12-18 01:54:56'),
(15, 15, 'zakir Hossain', NULL, '58/6, Dogormura', 'Savar', 'Dhaka', '1340', 'Bangladesh', '01764470022', '2021-12-18 01:56:12', '2021-12-18 01:56:12'),
(16, 16, 'zakir Hossain', NULL, '58/6, Dogormura', 'Savar', 'Dhaka', '1340', 'Bangladesh', '01764470022', '2021-12-18 01:57:26', '2021-12-18 01:57:26'),
(17, 17, 'zakir Hossain', NULL, '58/6, Dogormura', 'Savar', 'Dhaka', '1340', 'Bangladesh', '01764470022', '2021-12-18 01:58:26', '2021-12-18 01:58:26'),
(18, 18, 'zakir Hossain', NULL, '58/6, Dogormura', 'Savar', 'Dhaka', '1340', 'Bangladesh', '01764470022', '2021-12-18 02:02:21', '2021-12-18 02:02:21'),
(19, 19, 'zakir Hossain', NULL, '58/6, Dogormura', 'Savar', 'Dhaka', '1340', 'Bangladesh', '01764470022', '2021-12-18 02:03:15', '2021-12-18 02:03:15'),
(20, 20, 'zakir Hossain', NULL, '58/6, Dogormura', 'Amtali', 'Dhaka', '1340', 'Bangladesh', '01764470022', '2021-12-19 00:23:38', '2021-12-19 00:23:38'),
(21, 21, 'zakir Hossain', NULL, '58/6, Dogormura', 'Savar', 'Dhaka', '1340', 'Bangladesh', '01764470022', '2021-12-19 00:26:44', '2021-12-19 00:26:44'),
(22, 22, 'zakir Hossain', NULL, '58/6, Dogormura', 'Savar', 'Dhaka', '1340', 'Bangladesh', '01764470022', '2021-12-19 00:27:35', '2021-12-19 00:27:35'),
(23, 23, 'zakir Hossain', NULL, '58/6, Dogormura', 'Savar', 'Dhaka', '1340', 'Bangladesh', '01764470022', '2021-12-19 00:28:50', '2021-12-19 00:28:50'),
(24, 24, 'zakir Hossain', NULL, '58/6, Dogormura', 'Savar', 'Dhaka', '1340', 'Bangladesh', '01764470022', '2021-12-19 00:31:06', '2021-12-19 00:31:06'),
(25, 25, 'zakir Hossain', NULL, '58/6, Dogormura', 'Savar', 'Dhaka', '1340', 'Bangladesh', '01764470022', '2021-12-19 00:36:23', '2021-12-19 00:36:23'),
(26, 26, 'zakir Hossain', NULL, '58/6, Dogormura', 'Savar', 'Dhaka', '1340', 'Bangladesh', '01764470022', '2021-12-19 00:39:56', '2021-12-19 00:39:56'),
(27, 27, 'zakir Hossain', NULL, '58/6, Dogormura', 'Savar', 'Dhaka', '1340', 'Bangladesh', '01764470022', '2021-12-19 03:13:32', '2021-12-19 03:13:32'),
(28, 28, 'zakir Hossain', NULL, '58/6, Dogormura', 'Savar', 'Dhaka', '1340', 'Bangladesh', '01764470022', '2021-12-19 03:19:37', '2021-12-19 03:19:37'),
(29, 29, 'zakir Hossain', NULL, '58/6, Dogormura', 'Savar', 'Dhaka', '1340', 'Bangladesh', '01764470022', '2021-12-19 03:30:32', '2021-12-19 03:30:32'),
(30, 30, 'zakir Hossain', NULL, '58/6, Dogormura', 'Amtali', 'Dhaka', '1340', 'Bangladesh', '01764470022', '2021-12-19 04:14:12', '2021-12-19 04:14:12');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'about', 1, '2021-11-12 21:50:08', '2021-11-12 21:50:08'),
(2, 'contact', 1, '2021-11-12 21:50:08', '2021-11-12 21:50:08'),
(3, 'privacy_policy', 1, '2021-11-12 21:50:08', '2021-11-12 21:50:08'),
(4, 'terms&condition', 1, '2021-11-12 21:50:08', '2021-11-12 21:50:08'),
(5, 'faq', 0, '2021-11-12 21:50:08', '2021-11-12 21:50:08');

-- --------------------------------------------------------

--
-- Table structure for table `page_sections`
--

CREATE TABLE `page_sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `page_id` bigint(20) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `page_sections`
--

INSERT INTO `page_sections` (`id`, `page_id`, `name`, `title`, `content`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'overview', 'Company Overview', '<p><b><span style=\"font-size:14px;\">Lorem </span></b><span style=\"font-size:14px;font-family:Roboto;\">ipsum dolor sit amet, consectetur adipiscing elit. Cras dapibus a eros in venenatis. Cras mauris arcu, suscipit id lacinia sed, pulvinar in urna. Donec urna nisi, efficitur fermentum ullamcorper non, mattis et est. Nullam malesuada leo leo, non tempus turpis accumsan a. Sed tincidunt feugiat purus, sed lobortis justo consequat in. Phasellus lectus magna, accumsan eget felis in, hendrerit malesuada lectus. Duis orci nunc, vulputate vel sapien nec, sodales sollicitudin ligula.ipsum dolor sit amet, consectetur adipiscing elit. Cras dapibus a eros in venenatis. Cras mauris arcu, suscipit id lacinia sed, pulvinar in urna. Donec urna nisi, efficitur fermentum ullamcorper non, mattis et est. Nullam malesuada leo leo, non tempus turpis accumsan a. Sed tincidunt feugiat purus, sed lobortis justo consequat in. Phasellus lectus magna, accumsan eget felis in, hendrerit malesuada lectus. Duis orci nunc, vulputate vel sapien nec, sodales sollicitudin ligula.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras dapibus a eros in venenatis. Cras mauris arcu, suscipit id lacinia sed, pulvinar in urna. Donec urna nisi, efficitur fermentum ullamcorper non, mattis et est. Nullam malesuada leo leo, non tempus turpis accumsan a. Sed tincidunt feugiat purus, sed lobortis justo consequat in. Phasellus lectus magna, accumsan eget felis in, hendrerit malesuada lectus. Duis orci nunc, vulputate vel sapien nec, sodales sollicitudin ligula.</span></p><p><b><span style=\"font-size:14px;font-family:Roboto;\">Lorem </span></b><span style=\"font-size:14px;font-family:Roboto;\">ipsum dolor sit amet, consectetur adipiscing elit. Cras dapibus a eros in venenatis. Cras mauris arcu, suscipit id lacinia sed, pulvinar in urna. Donec urna nisi, efficitur fermentum ullamcorper non, mattis et est. Nullam malesuada leo leo, non tempus turpis accumsan a. Sed tincidunt feugiat purus, sed lobortis justo consequat in. Phasellus lectus magna, accumsan eget felis in, hendrerit malesuada lectus. Duis orci nunc, vulputate vel sapien nec, sodales sollicitudin ligula.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras dapibus a eros in venenatis. Cras mauris arcu, suscipit id lacinia sed, pulvinar in urna. Donec urna nisi, efficitur fermentum ullamcorper non, mattis et est. Nullam malesuada leo leo, non tempus turpis accumsan a. Sed tincidunt feugiat purus, sed lobortis justo consequat in. Phasellus lectus magna, accumsan eget felis in, hendrerit malesuada lectus. Duis orci nunc, vulputate vel sapien nec, sodales sollicitudin ligula.</span></p><p><b><span style=\"font-size:14px;font-family:Roboto;\">Lorem </span></b><span style=\"font-size:14px;font-family:Roboto;\">ipsum dolor sit amet, consectetur adipiscing elit. Cras dapibus a eros in venenatis. Cras mauris arcu, suscipit id lacinia sed, pulvinar in urna. Donec urna nisi, efficitur fermentum ullamcorper non, mattis et est. Nullam malesuada leo leo, non tempus turpis accumsan a. Sed tincidunt feugiat purus, sed lobortis justo consequat in. Phasellus lectus magna, accumsan eget felis in, hendrerit malesuada lectus. Duis orci nunc, vulputate vel sapien nec, sodales sollicitudin ligula.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras dapibus a eros in venenatis. Cras mauris arcu, suscipit id lacinia sed, pulvinar in urna. Donec urna nisi, efficitur fermentum ullamcorper non, mattis et est. Nullam malesuada leo leo, non tempus turpis accumsan a. Sed tincidunt feugiat purus, sed lobortis justo consequat in. Phasellus lectus magna, accumsan eget felis in, hendrerit malesuada lectus. Duis orci nunc, vulputate vel sapien nec, sodales sollicitudin ligula.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras dapibus a eros in venenatis. Cras mauris arcu, suscipit id lacinia sed, pulvinar in urna. Donec urna nisi, efficitur fermentum ullamcorper non, mattis et est. Nullam malesuada leo leo, non tempus turpis accumsan a. Sed tincidunt feugiat purus, sed lobortis justo consequat in. Phasellus lectus magna, accumsan eget felis in, hendrerit malesuada lectus. Duis orci nunc, vulputate vel sapien nec, sodales sollicitudin ligula.</span><br></p>', 1, '2021-11-15 00:24:05', '2021-11-15 02:00:02'),
(2, 1, 'mission', 'Mission', '<p style=\"text-align:justify;\"><span style=\"font-weight:bolder;\"><span style=\"font-size:14px;font-family:Roboto;\">Lorem </span></span><span style=\"font-size:14px;font-family:Roboto;\">ipsum dolor sit amet, consectetur adipiscing elit. Cras dapibus a eros in venenatis. Cras mauris arcu, suscipit id lacinia sed, pulvinar in urna. Donec urna nisi, efficitur fermentum ullamcorper non, mattis et est. Nullam malesuada leo leo, non tempus turpis accumsan a. Sed tincidunt feugiat purus, sed lobortis justo consequat in. Phasellus lectus magna, accumsan eget felis in, hendrerit malesuada lectus. Duis orci nunc, vulputate vel sapien nec, sodales sollicitudin ligula.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras dapibus a eros in venenatis. Cras mauris arcu, suscipit id lacinia sed, pulvinar in urna. Donec urna nisi, efficitur fermentum ullamcorper non, mattis et est. Nullam malesuada leo leo, non tempus turpis accumsan a. Sed tincidunt feugiat purus, sed lobortis justo consequat in. Phasellus lectus magna, accumsan eget felis in, hendrerit malesuada lectus. Duis orci nunc, vulputate vel sapien nec, sodales sollicitudin ligula.</span><br></p>', 1, '2021-11-15 00:38:08', '2021-11-15 02:06:41'),
(3, 1, 'vision', 'Vision', '<div><span style=\"font-weight:bolder;\"><span style=\"font-size:14px;font-family:Roboto;\">Lorem </span></span><span style=\"font-size:14px;font-family:Roboto;\">ipsum dolor sit amet, consectetur adipiscing elit. Cras dapibus a eros in venenatis. Cras mauris arcu, suscipit id lacinia sed, pulvinar in urna. Donec urna nisi, efficitur fermentum ullamcorper non, mattis et est. Nullam malesuada leo leo, non tempus turpis accumsan a. Sed tincidunt feugiat purus, sed lobortis justo consequat in. Phasellus lectus magna, accumsan eget felis in, hendrerit malesuada lectus. Duis orci nunc, vulputate vel sapien nec, sodales sollicitudin ligula.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras dapibus a eros in venenatis. Cras mauris arcu, suscipit id lacinia sed, pulvinar in urna. Donec urna nisi, efficitur fermentum ullamcorper non, mattis et est. Nullam malesuada leo leo, non tempus turpis accumsan a. Sed tincidunt feugiat purus, sed lobortis justo consequat in. Phasellus lectus magna, accumsan eget felis in, hendrerit malesuada lectus. Duis orci nunc, vulputate vel sapien nec, sodales sollicitudin ligula.</span></div>', 1, '2021-11-15 00:38:26', '2021-11-15 02:06:41'),
(4, 1, 'about_img', 'about page img', '/upload/settings/16369627879pb5ioDAC.jpg', 1, '2021-11-15 01:53:08', '2021-11-15 02:06:34'),
(5, 2, 'map', 'Contact us', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d233667.8223964362!2d90.27923941726908!3d23.780887453986505!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3755b8b087026b81%3A0x8fa563bbdd5904c2!2sDhaka!5e0!3m2!1sen!2sbd!4v1637289553352!5m2!1sen!2sbd', 1, '2021-11-18 20:48:40', '2021-11-18 20:54:52');

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
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'insert your payment account number or phone number',
  `content` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'insert your payment qr code',
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `icon`, `name`, `number`, `content`, `status`, `created_at`, `updated_at`) VALUES
(1, '/upload/payment-icons/cash-on-delivery.png', 'cash_on_delivery', NULL, NULL, 1, '2021-12-12 22:15:39', '2021-12-19 03:27:36'),
(2, '/upload/payment-icons/bKash.jpg', 'bKash', NULL, '/upload/payment-qrcode/1639387419_bKash.jfif', 1, '2021-12-12 22:15:39', '2021-12-19 00:49:26'),
(3, '/upload/payment-icons/nagad.jpg', 'nagad', '01764470022', NULL, 1, '2021-12-12 22:15:39', '2021-12-19 00:55:29'),
(4, '/upload/payment-icons/rocate.jpg', 'rocate', '017644700222', NULL, 0, '2021-12-12 22:15:39', '2021-12-13 06:49:52'),
(5, '/upload/payment-icons/money-transfer.png', 'money_transfer', NULL, NULL, 0, '2021-12-12 22:15:39', '2021-12-12 22:15:39');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'settings', 'web', '2021-12-15 03:56:36', '2021-12-15 03:56:36'),
(2, 'pages', 'web', '2021-12-15 03:56:36', '2021-12-15 03:56:36'),
(3, 'suppliers', 'web', '2021-12-15 03:56:37', '2021-12-15 03:56:37'),
(4, 'customers', 'web', '2021-12-15 03:56:37', '2021-12-15 03:56:37'),
(5, 'widget', 'web', '2021-12-15 03:56:37', '2021-12-15 03:56:37'),
(6, 'advertisement', 'web', '2021-12-15 03:56:37', '2021-12-15 03:56:37'),
(7, 'blog', 'web', '2021-12-15 03:56:37', '2021-12-15 03:56:37'),
(8, 'ecommerce', 'web', '2021-12-15 03:56:37', '2021-12-15 03:56:37');

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
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_office_lists`
--

INSERT INTO `post_office_lists` (`id`, `district_list_id`, `name`, `post_code`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Amtali', '8710', 0, '2021-12-08 22:35:38', '2021-12-08 22:35:38'),
(2, 1, 'Bamna', '8730', 0, '2021-12-08 22:35:38', '2021-12-08 22:35:38'),
(3, 1, 'Barguna Sadar', '8700', 0, '2021-12-08 22:35:38', '2021-12-08 22:35:38'),
(4, 1, 'Nali Bandar', '8701', 0, '2021-12-08 22:35:38', '2021-12-08 22:35:38'),
(5, 1, 'Betagi', '8740', 0, '2021-12-08 22:35:38', '2021-12-08 22:35:38'),
(6, 1, 'Darul Ulam', '8741', 0, '2021-12-08 22:35:38', '2021-12-08 22:35:38'),
(7, 1, 'Kakchira', '8721', 0, '2021-12-08 22:35:38', '2021-12-08 22:35:38'),
(8, 1, 'Patharghata', '8720', 0, '2021-12-08 22:35:39', '2021-12-08 22:35:39'),
(9, 2, 'Agailzhara', '8240', 0, '2021-12-08 22:35:39', '2021-12-08 22:35:39'),
(10, 2, 'Gaila', '8241', 0, '2021-12-08 22:35:39', '2021-12-08 22:35:39'),
(11, 2, 'Paisarhat', '8242', 0, '2021-12-08 22:35:39', '2021-12-08 22:35:39'),
(12, 2, 'Babuganj', '8210', 0, '2021-12-08 22:35:39', '2021-12-08 22:35:39'),
(13, 2, 'Barishal Cadet', '8216', 0, '2021-12-08 22:35:39', '2021-12-08 22:35:39'),
(14, 2, 'Chandpasha', '8212', 0, '2021-12-08 22:35:39', '2021-12-08 22:35:39'),
(15, 2, 'Madhabpasha', '8213', 0, '2021-12-08 22:35:39', '2021-12-08 22:35:39'),
(16, 2, 'Nizamuddin College', '8215', 0, '2021-12-08 22:35:39', '2021-12-08 22:35:39'),
(17, 2, 'Rahamatpur', '8211', 0, '2021-12-08 22:35:39', '2021-12-08 22:35:39'),
(18, 2, 'Thakur Mallik', '8214', 0, '2021-12-08 22:35:39', '2021-12-08 22:35:39'),
(19, 2, 'Barajalia', '8260', 0, '2021-12-08 22:35:39', '2021-12-08 22:35:39'),
(20, 2, 'Osman Manjil', '8261', 0, '2021-12-08 22:35:39', '2021-12-08 22:35:39'),
(21, 2, 'Barishal Sadar', '8200', 0, '2021-12-08 22:35:39', '2021-12-08 22:35:39'),
(22, 2, 'Bukhainagar', '8201', 0, '2021-12-08 22:35:40', '2021-12-08 22:35:40'),
(23, 2, 'Jaguarhat', '8206', 0, '2021-12-08 22:35:40', '2021-12-08 22:35:40'),
(24, 2, 'Kashipur', '8205', 0, '2021-12-08 22:35:40', '2021-12-08 22:35:40'),
(25, 2, 'Patang', '8204', 0, '2021-12-08 22:35:40', '2021-12-08 22:35:40'),
(26, 2, 'Saheberhat', '8202', 0, '2021-12-08 22:35:40', '2021-12-08 22:35:40'),
(27, 2, 'Sugandia', '8203', 0, '2021-12-08 22:35:40', '2021-12-08 22:35:40'),
(28, 2, 'Batajor', '8233', 0, '2021-12-08 22:35:40', '2021-12-08 22:35:40'),
(29, 2, 'Gouranadi', '8230', 0, '2021-12-08 22:35:40', '2021-12-08 22:35:40'),
(30, 2, 'Kashemabad', '8232', 0, '2021-12-08 22:35:40', '2021-12-08 22:35:40'),
(31, 2, 'Tarki Bandar', '8231', 0, '2021-12-08 22:35:40', '2021-12-08 22:35:40'),
(32, 2, 'Langutia', '8274', 0, '2021-12-08 22:35:40', '2021-12-08 22:35:40'),
(33, 2, 'Laskarpur', '8271', 0, '2021-12-08 22:35:40', '2021-12-08 22:35:40'),
(34, 2, 'Mahendiganj', '8270', 0, '2021-12-08 22:35:40', '2021-12-08 22:35:40'),
(35, 2, 'Nalgora', '8273', 0, '2021-12-08 22:35:40', '2021-12-08 22:35:40'),
(36, 2, 'Ulania', '8272', 0, '2021-12-08 22:35:40', '2021-12-08 22:35:40'),
(37, 2, 'Charkalekhan', '8252', 0, '2021-12-08 22:35:40', '2021-12-08 22:35:40'),
(38, 2, 'Kazirchar', '8251', 0, '2021-12-08 22:35:40', '2021-12-08 22:35:40'),
(39, 2, 'Muladi', '8250', 0, '2021-12-08 22:35:40', '2021-12-08 22:35:40'),
(40, 2, 'Charamandi', '8281', 0, '2021-12-08 22:35:40', '2021-12-08 22:35:40'),
(41, 2, 'kalaskati', '8284', 0, '2021-12-08 22:35:40', '2021-12-08 22:35:40'),
(42, 2, 'Padri Shibpur', '8282', 0, '2021-12-08 22:35:40', '2021-12-08 22:35:40'),
(43, 2, 'Sahebganj', '8280', 0, '2021-12-08 22:35:41', '2021-12-08 22:35:41'),
(44, 2, 'Shialguni', '8283', 0, '2021-12-08 22:35:41', '2021-12-08 22:35:41'),
(45, 2, 'Dakuarhat', '8223', 0, '2021-12-08 22:35:41', '2021-12-08 22:35:41'),
(46, 2, 'Dhamura', '8221', 0, '2021-12-08 22:35:41', '2021-12-08 22:35:41'),
(47, 2, 'Jugirkanda', '8222', 0, '2021-12-08 22:35:41', '2021-12-08 22:35:41'),
(48, 2, 'Shikarpur', '8224', 0, '2021-12-08 22:35:41', '2021-12-08 22:35:41'),
(49, 2, 'Uzirpur', '8220', 0, '2021-12-08 22:35:41', '2021-12-08 22:35:41'),
(50, 3, 'Bhola Sadar', '8300', 0, '2021-12-08 22:35:41', '2021-12-08 22:35:41'),
(51, 3, 'Joynagar', '8301', 0, '2021-12-08 22:35:41', '2021-12-08 22:35:41'),
(52, 3, 'Borhanuddin UPO', '8320', 0, '2021-12-08 22:35:41', '2021-12-08 22:35:41'),
(53, 3, 'Mirzakalu', '8321', 0, '2021-12-08 22:35:41', '2021-12-08 22:35:41'),
(54, 3, 'Charfashion', '8340', 0, '2021-12-08 22:35:41', '2021-12-08 22:35:41'),
(55, 3, 'Dularhat', '8341', 0, '2021-12-08 22:35:41', '2021-12-08 22:35:41'),
(56, 3, 'Keramatganj', '8342', 0, '2021-12-08 22:35:42', '2021-12-08 22:35:42'),
(57, 3, 'Doulatkhan', '8310', 0, '2021-12-08 22:35:42', '2021-12-08 22:35:42'),
(58, 3, 'Hajipur', '8311', 0, '2021-12-08 22:35:42', '2021-12-08 22:35:42'),
(59, 3, 'Hajirhat', '8360', 0, '2021-12-08 22:35:42', '2021-12-08 22:35:42'),
(60, 3, 'Hatshoshiganj', '8350', 0, '2021-12-08 22:35:42', '2021-12-08 22:35:42'),
(61, 3, 'Daurihat', '8331', 0, '2021-12-08 22:35:42', '2021-12-08 22:35:42'),
(62, 3, 'Gazaria', '8332', 0, '2021-12-08 22:35:42', '2021-12-08 22:35:42'),
(63, 3, 'Lalmohan UPO', '8330', 0, '2021-12-08 22:35:42', '2021-12-08 22:35:42'),
(64, 4, 'Baukathi', '8402', 0, '2021-12-08 22:35:42', '2021-12-08 22:35:42'),
(65, 4, 'Gabha', '8403', 0, '2021-12-08 22:35:42', '2021-12-08 22:35:42'),
(66, 4, 'Jhalokathi Sadar', '8400', 0, '2021-12-08 22:35:42', '2021-12-08 22:35:42'),
(67, 4, 'Nabagram', '8401', 0, '2021-12-08 22:35:42', '2021-12-08 22:35:42'),
(68, 4, 'Shekherhat', '8404', 0, '2021-12-08 22:35:43', '2021-12-08 22:35:43'),
(69, 4, 'Amua', '8431', 0, '2021-12-08 22:35:43', '2021-12-08 22:35:43'),
(70, 4, 'Kathalia', '8430', 0, '2021-12-08 22:35:43', '2021-12-08 22:35:43'),
(71, 4, 'Niamatee', '8432', 0, '2021-12-08 22:35:43', '2021-12-08 22:35:43'),
(72, 4, 'Shoulajalia', '8433', 0, '2021-12-08 22:35:43', '2021-12-08 22:35:43'),
(73, 4, 'Beerkathi', '8421', 0, '2021-12-08 22:35:43', '2021-12-08 22:35:43'),
(74, 4, 'Nalchhiti', '8420', 0, '2021-12-08 22:35:43', '2021-12-08 22:35:43'),
(75, 4, 'Rajapur', '8410', 0, '2021-12-08 22:35:43', '2021-12-08 22:35:43'),
(76, 5, 'Bagabandar', '8621', 0, '2021-12-08 22:35:44', '2021-12-08 22:35:44'),
(77, 5, 'Bauphal', '8620', 0, '2021-12-08 22:35:44', '2021-12-08 22:35:44'),
(78, 5, 'Birpasha', '8622', 0, '2021-12-08 22:35:44', '2021-12-08 22:35:44'),
(79, 5, 'Kalaia', '8624', 0, '2021-12-08 22:35:44', '2021-12-08 22:35:44'),
(80, 5, 'Kalishari', '8623', 0, '2021-12-08 22:35:44', '2021-12-08 22:35:44'),
(81, 5, 'Dashmina', '8630', 0, '2021-12-08 22:35:44', '2021-12-08 22:35:44'),
(82, 5, 'Galachipa', '8640', 0, '2021-12-08 22:35:44', '2021-12-08 22:35:44'),
(83, 5, 'Gazipur Bandar', '8641', 0, '2021-12-08 22:35:44', '2021-12-08 22:35:44'),
(84, 5, 'Khepupara', '8650', 0, '2021-12-08 22:35:44', '2021-12-08 22:35:44'),
(85, 5, 'Mahipur', '8651', 0, '2021-12-08 22:35:44', '2021-12-08 22:35:44'),
(86, 5, 'Dumkee', '8602', 0, '2021-12-08 22:35:44', '2021-12-08 22:35:44'),
(87, 5, 'Moukaran', '8601', 0, '2021-12-08 22:35:44', '2021-12-08 22:35:44'),
(88, 5, 'Patuakhali Sadar', '8600', 0, '2021-12-08 22:35:44', '2021-12-08 22:35:44'),
(89, 5, 'Rahimabad', '8603', 0, '2021-12-08 22:35:44', '2021-12-08 22:35:44'),
(90, 5, 'Subidkhali', '8610', 0, '2021-12-08 22:35:44', '2021-12-08 22:35:44'),
(91, 6, 'Banaripara', '8530', 0, '2021-12-08 22:35:44', '2021-12-08 22:35:44'),
(92, 6, 'Chakhar', '8531', 0, '2021-12-08 22:35:44', '2021-12-08 22:35:44'),
(93, 6, 'Bhandaria', '8550', 0, '2021-12-08 22:35:44', '2021-12-08 22:35:44'),
(94, 6, 'Dhaoa', '8552', 0, '2021-12-08 22:35:44', '2021-12-08 22:35:44'),
(95, 6, 'Kanudashkathi', '8551', 0, '2021-12-08 22:35:44', '2021-12-08 22:35:44'),
(96, 6, 'Jolagati', '8513', 0, '2021-12-08 22:35:44', '2021-12-08 22:35:44'),
(97, 6, 'Joykul', '8512', 0, '2021-12-08 22:35:44', '2021-12-08 22:35:44'),
(98, 6, 'Kaukhali', '8510', 0, '2021-12-08 22:35:44', '2021-12-08 22:35:44'),
(99, 6, 'Keundia', '8511', 0, '2021-12-08 22:35:44', '2021-12-08 22:35:44'),
(100, 6, 'Betmor Natun Hat', '8565', 0, '2021-12-08 22:35:44', '2021-12-08 22:35:44'),
(101, 6, 'Gulishakhali', '8563', 0, '2021-12-08 22:35:44', '2021-12-08 22:35:44'),
(102, 6, 'Halta', '8562', 0, '2021-12-08 22:35:44', '2021-12-08 22:35:44'),
(103, 6, 'Mathbaria', '8560', 0, '2021-12-08 22:35:44', '2021-12-08 22:35:44'),
(104, 6, 'Shilarganj', '8566', 0, '2021-12-08 22:35:44', '2021-12-08 22:35:44'),
(105, 6, 'Tiarkhali', '8564', 0, '2021-12-08 22:35:44', '2021-12-08 22:35:44'),
(106, 6, 'Tushkhali', '8561', 0, '2021-12-08 22:35:44', '2021-12-08 22:35:44'),
(107, 6, 'Nazirpur', '8540', 0, '2021-12-08 22:35:44', '2021-12-08 22:35:44'),
(108, 6, 'Sriramkathi', '8541', 0, '2021-12-08 22:35:44', '2021-12-08 22:35:44'),
(109, 6, 'Hularhat', '8501', 0, '2021-12-08 22:35:44', '2021-12-08 22:35:44'),
(110, 6, 'Parerhat', '8502', 0, '2021-12-08 22:35:44', '2021-12-08 22:35:44'),
(111, 6, 'Pirojpur Sadar', '8500', 0, '2021-12-08 22:35:44', '2021-12-08 22:35:44'),
(112, 6, 'Darus Sunnat', '8521', 0, '2021-12-08 22:35:44', '2021-12-08 22:35:44'),
(113, 6, 'Jalabari', '8523', 0, '2021-12-08 22:35:44', '2021-12-08 22:35:44'),
(114, 6, 'Kaurikhara', '8522', 0, '2021-12-08 22:35:44', '2021-12-08 22:35:44'),
(115, 6, 'Swarupkathi', '8520', 0, '2021-12-08 22:35:44', '2021-12-08 22:35:44'),
(116, 7, 'Alikadam', '4650', 0, '2021-12-08 22:35:44', '2021-12-08 22:35:44'),
(117, 7, 'Bandarban Sadar', '4600', 0, '2021-12-08 22:35:44', '2021-12-08 22:35:44'),
(118, 7, 'Naikhong', '4660', 0, '2021-12-08 22:35:44', '2021-12-08 22:35:44'),
(119, 7, 'Roanchhari', '4610', 0, '2021-12-08 22:35:44', '2021-12-08 22:35:44'),
(120, 7, 'Ruma', '4620', 0, '2021-12-08 22:35:44', '2021-12-08 22:35:44'),
(121, 7, 'Lama', '4641', 0, '2021-12-08 22:35:44', '2021-12-08 22:35:44'),
(122, 7, 'Thanchi', '4630', 0, '2021-12-08 22:35:44', '2021-12-08 22:35:44'),
(123, 8, 'Akhaura', '3450', 0, '2021-12-08 22:35:45', '2021-12-08 22:35:45'),
(124, 8, 'Azampur', '3451', 0, '2021-12-08 22:35:45', '2021-12-08 22:35:45'),
(125, 8, 'Gangasagar', '3452', 0, '2021-12-08 22:35:45', '2021-12-08 22:35:45'),
(126, 8, 'Banchharampur', '3420', 0, '2021-12-08 22:35:45', '2021-12-08 22:35:45'),
(127, 8, 'Brahamanbaria Sadar', '3400', 0, '2021-12-08 22:35:45', '2021-12-08 22:35:45'),
(128, 8, 'Talshahar', '3401', 0, '2021-12-08 22:35:45', '2021-12-08 22:35:45'),
(129, 8, 'Ashuganj', '3402', 0, '2021-12-08 22:35:45', '2021-12-08 22:35:45'),
(130, 8, 'Ashuganj Share', '3403', 0, '2021-12-08 22:35:45', '2021-12-08 22:35:45'),
(131, 8, 'Poun', '3404', 0, '2021-12-08 22:35:45', '2021-12-08 22:35:45'),
(132, 8, 'Kasba', '3460', 0, '2021-12-08 22:35:46', '2021-12-08 22:35:46'),
(133, 8, 'Kuti', '3461', 0, '2021-12-08 22:35:46', '2021-12-08 22:35:46'),
(134, 8, 'Chandidar', '3462', 0, '2021-12-08 22:35:46', '2021-12-08 22:35:46'),
(135, 8, 'Chargachh', '3463', 0, '2021-12-08 22:35:46', '2021-12-08 22:35:46'),
(136, 8, 'Gopinathpur', '3464', 0, '2021-12-08 22:35:46', '2021-12-08 22:35:46'),
(137, 8, 'Nabinagar', '3410', 0, '2021-12-08 22:35:46', '2021-12-08 22:35:46'),
(138, 8, 'Laubfatehpur', '3411', 0, '2021-12-08 22:35:46', '2021-12-08 22:35:46'),
(139, 8, 'Rasullabad', '3412', 0, '2021-12-08 22:35:46', '2021-12-08 22:35:46'),
(140, 8, 'Shamgram', '3413', 0, '2021-12-08 22:35:46', '2021-12-08 22:35:46'),
(141, 8, 'Ratanpur', '3414', 0, '2021-12-08 22:35:46', '2021-12-08 22:35:46'),
(142, 8, 'Shahapur', '3415', 0, '2021-12-08 22:35:46', '2021-12-08 22:35:46'),
(143, 8, 'Kaitala', '3417', 0, '2021-12-08 22:35:46', '2021-12-08 22:35:46'),
(144, 8, 'Salimganj', '3418', 0, '2021-12-08 22:35:46', '2021-12-08 22:35:46'),
(145, 8, 'Jibanganj', '3419', 0, '2021-12-08 22:35:46', '2021-12-08 22:35:46'),
(146, 8, 'Nasirnagar', '3440', 0, '2021-12-08 22:35:46', '2021-12-08 22:35:46'),
(147, 8, 'Fandauk', '3441', 0, '2021-12-08 22:35:46', '2021-12-08 22:35:46'),
(148, 8, 'Sarail', '3430', 0, '2021-12-08 22:35:46', '2021-12-08 22:35:46'),
(149, 8, 'Shahbajpur', '3431', 0, '2021-12-08 22:35:46', '2021-12-08 22:35:46'),
(150, 8, 'Chandura', '3432', 0, '2021-12-08 22:35:46', '2021-12-08 22:35:46'),
(151, 9, 'Baburhat', '3602', 0, '2021-12-08 22:35:46', '2021-12-08 22:35:46'),
(152, 9, 'Chandpur Sadar', '3600', 0, '2021-12-08 22:35:46', '2021-12-08 22:35:46'),
(153, 9, 'Puranbazar', '3601', 0, '2021-12-08 22:35:46', '2021-12-08 22:35:46'),
(154, 9, 'Sahatali', '3603', 0, '2021-12-08 22:35:46', '2021-12-08 22:35:46'),
(155, 9, 'Chandra', '3651', 0, '2021-12-08 22:35:46', '2021-12-08 22:35:46'),
(156, 9, 'Faridganj', '3650', 0, '2021-12-08 22:35:46', '2021-12-08 22:35:46'),
(157, 9, 'Gridkaliandia', '3653', 0, '2021-12-08 22:35:46', '2021-12-08 22:35:46'),
(158, 9, 'Islampur Shah Isain', '3655', 0, '2021-12-08 22:35:46', '2021-12-08 22:35:46'),
(159, 9, 'Rampurbazar', '3654', 0, '2021-12-08 22:35:46', '2021-12-08 22:35:46'),
(160, 9, 'Rupsha', '3652', 0, '2021-12-08 22:35:46', '2021-12-08 22:35:46'),
(161, 9, 'Bolakhal', '3611', 0, '2021-12-08 22:35:46', '2021-12-08 22:35:46'),
(162, 9, 'Hajiganj', '3610', 0, '2021-12-08 22:35:46', '2021-12-08 22:35:46'),
(163, 9, 'Gandamara', '3661', 0, '2021-12-08 22:35:46', '2021-12-08 22:35:46'),
(164, 9, 'Hayemchar', '3660', 0, '2021-12-08 22:35:46', '2021-12-08 22:35:46'),
(165, 9, 'Kachua', '3630', 0, '2021-12-08 22:35:46', '2021-12-08 22:35:46'),
(166, 9, 'Pak Shrirampur', '3631', 0, '2021-12-08 22:35:46', '2021-12-08 22:35:46'),
(167, 9, 'Rahima Nagar', '3632', 0, '2021-12-08 22:35:46', '2021-12-08 22:35:46'),
(168, 9, 'Shachar', '3633', 0, '2021-12-08 22:35:46', '2021-12-08 22:35:46'),
(169, 9, 'Kalipur', '3642', 0, '2021-12-08 22:35:46', '2021-12-08 22:35:46'),
(170, 9, 'Matlobganj', '3640', 0, '2021-12-08 22:35:46', '2021-12-08 22:35:46'),
(171, 9, 'Mohanpur', '3641', 0, '2021-12-08 22:35:46', '2021-12-08 22:35:46'),
(172, 9, 'Chotoshi', '3623', 0, '2021-12-08 22:35:47', '2021-12-08 22:35:47'),
(173, 9, 'Islamia Madrasha', '3624', 0, '2021-12-08 22:35:47', '2021-12-08 22:35:47'),
(174, 9, 'Khilabazar', '3621', 0, '2021-12-08 22:35:47', '2021-12-08 22:35:47'),
(175, 9, 'Pashchim Kherihar Al', '3622', 0, '2021-12-08 22:35:47', '2021-12-08 22:35:47'),
(176, 9, 'Shahrasti', '3620', 0, '2021-12-08 22:35:47', '2021-12-08 22:35:47'),
(177, 10, 'Anowara', '4376', 0, '2021-12-08 22:35:47', '2021-12-08 22:35:47'),
(178, 10, 'Battali', '4378', 0, '2021-12-08 22:35:47', '2021-12-08 22:35:47'),
(179, 10, 'Paroikora', '4377', 0, '2021-12-08 22:35:47', '2021-12-08 22:35:47'),
(180, 10, 'Boalkhali', '4366', 0, '2021-12-08 22:35:47', '2021-12-08 22:35:47'),
(181, 10, 'Charandwip', '4369', 0, '2021-12-08 22:35:47', '2021-12-08 22:35:47'),
(182, 10, 'Iqbal Park', '4365', 0, '2021-12-08 22:35:47', '2021-12-08 22:35:47'),
(183, 10, 'Kadurkhal', '4368', 0, '2021-12-08 22:35:47', '2021-12-08 22:35:47'),
(184, 10, 'Kanungopara', '4363', 0, '2021-12-08 22:35:47', '2021-12-08 22:35:47'),
(185, 10, 'Sakpura', '4367', 0, '2021-12-08 22:35:47', '2021-12-08 22:35:47'),
(186, 10, 'Saroatoli', '4364', 0, '2021-12-08 22:35:47', '2021-12-08 22:35:47'),
(187, 10, 'Al- Amin Baria Madra', '4221', 0, '2021-12-08 22:35:47', '2021-12-08 22:35:47'),
(188, 10, 'Amin Jute Mills', '4211', 0, '2021-12-08 22:35:47', '2021-12-08 22:35:47'),
(189, 10, 'Anandabazar', '4215', 0, '2021-12-08 22:35:47', '2021-12-08 22:35:47'),
(190, 10, 'Bayezid Bostami', '4210', 0, '2021-12-08 22:35:47', '2021-12-08 22:35:47'),
(191, 10, 'Chandgaon', '4212', 0, '2021-12-08 22:35:47', '2021-12-08 22:35:47'),
(192, 10, 'Chawkbazar', '4203', 0, '2021-12-08 22:35:47', '2021-12-08 22:35:47'),
(193, 10, 'Chitt. Cantonment', '4220', 0, '2021-12-08 22:35:47', '2021-12-08 22:35:47'),
(194, 10, 'Chitt. Customs Acca', '4219', 0, '2021-12-08 22:35:47', '2021-12-08 22:35:47'),
(195, 10, 'Chitt. Politechnic In', '4209', 0, '2021-12-08 22:35:47', '2021-12-08 22:35:47'),
(196, 10, 'Chitt. Sailers Colon', '4218', 0, '2021-12-08 22:35:47', '2021-12-08 22:35:47'),
(197, 10, 'Chittagong Airport', '4205', 0, '2021-12-08 22:35:47', '2021-12-08 22:35:47'),
(198, 10, 'Chittagong Bandar', '4100', 0, '2021-12-08 22:35:47', '2021-12-08 22:35:47'),
(199, 10, 'Chittagong GPO', '4000', 0, '2021-12-08 22:35:47', '2021-12-08 22:35:47'),
(200, 10, 'Export Processing', '4223', 0, '2021-12-08 22:35:47', '2021-12-08 22:35:47'),
(201, 10, 'Firozshah', '4207', 0, '2021-12-08 22:35:47', '2021-12-08 22:35:47'),
(202, 10, 'Halishahar', '4216', 0, '2021-12-08 22:35:47', '2021-12-08 22:35:47'),
(203, 10, 'Halishshar', '4225', 0, '2021-12-08 22:35:47', '2021-12-08 22:35:47'),
(204, 10, 'Jalalabad', '4214', 0, '2021-12-08 22:35:47', '2021-12-08 22:35:47'),
(205, 10, 'Jaldia Merine Accade', '4206', 0, '2021-12-08 22:35:47', '2021-12-08 22:35:47'),
(206, 10, 'Middle Patenga', '4222', 0, '2021-12-08 22:35:47', '2021-12-08 22:35:47'),
(207, 10, 'Mohard', '4208', 0, '2021-12-08 22:35:47', '2021-12-08 22:35:47'),
(208, 10, 'North Halishahar', '4226', 0, '2021-12-08 22:35:47', '2021-12-08 22:35:47'),
(209, 10, 'North Katuli', '4217', 0, '2021-12-08 22:35:47', '2021-12-08 22:35:47'),
(210, 10, 'Pahartoli', '4202', 0, '2021-12-08 22:35:47', '2021-12-08 22:35:47'),
(211, 10, 'Patenga', '4204', 0, '2021-12-08 22:35:47', '2021-12-08 22:35:47'),
(212, 10, 'Rampura TSO', '4224', 0, '2021-12-08 22:35:47', '2021-12-08 22:35:47'),
(213, 10, 'Wazedia', '4213', 0, '2021-12-08 22:35:47', '2021-12-08 22:35:47'),
(214, 10, 'Barma', '4383', 0, '2021-12-08 22:35:47', '2021-12-08 22:35:47'),
(215, 10, 'Dohazari', '4382', 0, '2021-12-08 22:35:47', '2021-12-08 22:35:47'),
(216, 10, 'East Joara', '4380', 0, '2021-12-08 22:35:47', '2021-12-08 22:35:47'),
(217, 10, 'Gachbaria', '4381', 0, '2021-12-08 22:35:47', '2021-12-08 22:35:47'),
(218, 10, 'Bhandar Sharif', '4352', 0, '2021-12-08 22:35:47', '2021-12-08 22:35:47'),
(219, 10, 'Fatikchhari', '4350', 0, '2021-12-08 22:35:47', '2021-12-08 22:35:47'),
(220, 10, 'Harualchhari', '4354', 0, '2021-12-08 22:35:48', '2021-12-08 22:35:48'),
(221, 10, 'Najirhat', '4353', 0, '2021-12-08 22:35:48', '2021-12-08 22:35:48'),
(222, 10, 'Nanupur', '4351', 0, '2021-12-08 22:35:48', '2021-12-08 22:35:48'),
(223, 10, 'Narayanhat', '4355', 0, '2021-12-08 22:35:48', '2021-12-08 22:35:48'),
(224, 10, 'Chitt.University', '4331', 0, '2021-12-08 22:35:48', '2021-12-08 22:35:48'),
(225, 10, 'Fatahabad', '4335', 0, '2021-12-08 22:35:48', '2021-12-08 22:35:48'),
(226, 10, 'Gorduara', '4332', 0, '2021-12-08 22:35:48', '2021-12-08 22:35:48'),
(227, 10, 'Hathazari', '4330', 0, '2021-12-08 22:35:48', '2021-12-08 22:35:48'),
(228, 10, 'Katirhat', '4333', 0, '2021-12-08 22:35:48', '2021-12-08 22:35:48'),
(229, 10, 'Madrasa', '4339', 0, '2021-12-08 22:35:49', '2021-12-08 22:35:49'),
(230, 10, 'Mirzapur', '4334', 0, '2021-12-08 22:35:49', '2021-12-08 22:35:49'),
(231, 10, 'Nuralibari', '4337', 0, '2021-12-08 22:35:49', '2021-12-08 22:35:49'),
(232, 10, 'Yunus Nagar', '4338', 0, '2021-12-08 22:35:49', '2021-12-08 22:35:49'),
(233, 10, 'Banigram', '4393', 0, '2021-12-08 22:35:49', '2021-12-08 22:35:49'),
(234, 10, 'Gunagari', '4392', 0, '2021-12-08 22:35:49', '2021-12-08 22:35:49'),
(235, 10, 'Jaldi', '4390', 0, '2021-12-08 22:35:49', '2021-12-08 22:35:49'),
(236, 10, 'Khan Bahadur', '4391', 0, '2021-12-08 22:35:49', '2021-12-08 22:35:49'),
(237, 10, 'Chunti', '4398', 0, '2021-12-08 22:35:49', '2021-12-08 22:35:49'),
(238, 10, 'Lohagara', '4396', 0, '2021-12-08 22:35:49', '2021-12-08 22:35:49'),
(239, 10, 'Padua', '4397', 0, '2021-12-08 22:35:49', '2021-12-08 22:35:49'),
(240, 10, 'Abutorab', '4321', 0, '2021-12-08 22:35:49', '2021-12-08 22:35:49'),
(241, 10, 'Azampur', '4325', 0, '2021-12-08 22:35:49', '2021-12-08 22:35:49'),
(242, 10, 'Bharawazhat', '4323', 0, '2021-12-08 22:35:49', '2021-12-08 22:35:49'),
(243, 10, 'Darrogahat', '4322', 0, '2021-12-08 22:35:49', '2021-12-08 22:35:49'),
(244, 10, 'Joarganj', '4324', 0, '2021-12-08 22:35:49', '2021-12-08 22:35:49'),
(245, 10, 'Korerhat', '4327', 0, '2021-12-08 22:35:49', '2021-12-08 22:35:49'),
(246, 10, 'Mirsharai', '4320', 0, '2021-12-08 22:35:49', '2021-12-08 22:35:49'),
(247, 10, 'Mohazanhat', '4328', 0, '2021-12-08 22:35:49', '2021-12-08 22:35:49'),
(248, 10, 'Budhpara', '4371', 0, '2021-12-08 22:35:49', '2021-12-08 22:35:49'),
(249, 10, 'Patia Head Office', '4370', 0, '2021-12-08 22:35:49', '2021-12-08 22:35:49'),
(250, 10, 'Dhamair', '4361', 0, '2021-12-08 22:35:49', '2021-12-08 22:35:49'),
(251, 10, 'Rangunia', '4360', 0, '2021-12-08 22:35:49', '2021-12-08 22:35:49'),
(252, 10, 'B.I.T Post Office', '4349', 0, '2021-12-08 22:35:49', '2021-12-08 22:35:49'),
(253, 10, 'Beenajuri', '4341', 0, '2021-12-08 22:35:49', '2021-12-08 22:35:49'),
(254, 10, 'Dewanpur', '4347', 0, '2021-12-08 22:35:49', '2021-12-08 22:35:49'),
(255, 10, 'Fatepur', '4345', 0, '2021-12-08 22:35:49', '2021-12-08 22:35:49'),
(256, 10, 'Gahira', '4343', 0, '2021-12-08 22:35:49', '2021-12-08 22:35:49'),
(257, 10, 'Guzra Noapara', '4346', 0, '2021-12-08 22:35:49', '2021-12-08 22:35:49'),
(258, 10, 'jagannath Hat', '4344', 0, '2021-12-08 22:35:49', '2021-12-08 22:35:49'),
(259, 10, 'Kundeshwari', '4342', 0, '2021-12-08 22:35:49', '2021-12-08 22:35:49'),
(260, 10, 'Mohamuni', '4348', 0, '2021-12-08 22:35:49', '2021-12-08 22:35:49'),
(261, 10, 'Rouzan', '4340', 0, '2021-12-08 22:35:49', '2021-12-08 22:35:49'),
(262, 10, 'Sandwip', '4300', 0, '2021-12-08 22:35:49', '2021-12-08 22:35:49'),
(263, 10, 'Shiberhat', '4301', 0, '2021-12-08 22:35:49', '2021-12-08 22:35:49'),
(264, 10, 'Urirchar', '4302', 0, '2021-12-08 22:35:49', '2021-12-08 22:35:49'),
(265, 10, 'Baitul Ijjat', '4387', 0, '2021-12-08 22:35:49', '2021-12-08 22:35:49'),
(266, 10, 'Bazalia', '4388', 0, '2021-12-08 22:35:49', '2021-12-08 22:35:49'),
(267, 10, 'Satkania', '4386', 0, '2021-12-08 22:35:49', '2021-12-08 22:35:49'),
(268, 10, 'Barabkunda', '4312', 0, '2021-12-08 22:35:49', '2021-12-08 22:35:49'),
(269, 10, 'Baroidhala', '4311', 0, '2021-12-08 22:35:49', '2021-12-08 22:35:49'),
(270, 10, 'Bawashbaria', '4313', 0, '2021-12-08 22:35:49', '2021-12-08 22:35:49'),
(271, 10, 'Bhatiari', '4315', 0, '2021-12-08 22:35:49', '2021-12-08 22:35:49'),
(272, 10, 'Fouzdarhat', '4316', 0, '2021-12-08 22:35:49', '2021-12-08 22:35:49'),
(273, 10, 'Jafrabad', '4317', 0, '2021-12-08 22:35:49', '2021-12-08 22:35:49'),
(274, 10, 'Kumira', '4314', 0, '2021-12-08 22:35:49', '2021-12-08 22:35:49'),
(275, 10, 'Sitakunda', '4310', 0, '2021-12-08 22:35:49', '2021-12-08 22:35:49'),
(276, 11, 'Barura', '3560', 0, '2021-12-08 22:35:50', '2021-12-08 22:35:50'),
(277, 11, 'Murdafarganj', '3562', 0, '2021-12-08 22:35:50', '2021-12-08 22:35:50'),
(278, 11, 'Poyalgachha', '3561', 0, '2021-12-08 22:35:50', '2021-12-08 22:35:50'),
(279, 11, 'Brahmanpara', '3526', 0, '2021-12-08 22:35:50', '2021-12-08 22:35:50'),
(280, 11, 'Burichang', '3520', 0, '2021-12-08 22:35:50', '2021-12-08 22:35:50'),
(281, 11, 'Maynamoti bazar', '3521', 0, '2021-12-08 22:35:50', '2021-12-08 22:35:50'),
(282, 11, 'Chandia', '3510', 0, '2021-12-08 22:35:50', '2021-12-08 22:35:50'),
(283, 11, 'Madhaiabazar', '3511', 0, '2021-12-08 22:35:50', '2021-12-08 22:35:50'),
(284, 11, 'Batisa', '3551', 0, '2021-12-08 22:35:50', '2021-12-08 22:35:50'),
(285, 11, 'Chiora', '3552', 0, '2021-12-08 22:35:50', '2021-12-08 22:35:50'),
(286, 11, 'Chouddagram', '3550', 0, '2021-12-08 22:35:50', '2021-12-08 22:35:50'),
(287, 11, 'Comilla Contoment', '3501', 0, '2021-12-08 22:35:51', '2021-12-08 22:35:51'),
(288, 11, 'Comilla Sadar', '3500', 0, '2021-12-08 22:35:51', '2021-12-08 22:35:51'),
(289, 11, 'Courtbari', '3503', 0, '2021-12-08 22:35:51', '2021-12-08 22:35:51'),
(290, 11, 'Halimanagar', '3502', 0, '2021-12-08 22:35:51', '2021-12-08 22:35:51'),
(291, 11, 'Suaganj', '3504', 0, '2021-12-08 22:35:51', '2021-12-08 22:35:51'),
(292, 11, 'Dashpara', '3518', 0, '2021-12-08 22:35:51', '2021-12-08 22:35:51'),
(293, 11, 'Daudkandi', '3516', 0, '2021-12-08 22:35:51', '2021-12-08 22:35:51'),
(294, 11, 'Eliotganj', '3519', 0, '2021-12-08 22:35:51', '2021-12-08 22:35:51'),
(295, 11, 'Gouripur', '3517', 0, '2021-12-08 22:35:51', '2021-12-08 22:35:51'),
(296, 11, 'Barashalghar', '3532', 0, '2021-12-08 22:35:51', '2021-12-08 22:35:51'),
(297, 11, 'Davidhar', '3530', 0, '2021-12-08 22:35:51', '2021-12-08 22:35:51'),
(298, 11, 'Dhamtee', '3533', 0, '2021-12-08 22:35:51', '2021-12-08 22:35:51'),
(299, 11, 'Gangamandal', '3531', 0, '2021-12-08 22:35:51', '2021-12-08 22:35:51'),
(300, 11, 'Homna', '3546', 0, '2021-12-08 22:35:51', '2021-12-08 22:35:51'),
(301, 11, 'Bipulasar', '3572', 0, '2021-12-08 22:35:51', '2021-12-08 22:35:51'),
(302, 11, 'Laksam', '3570', 0, '2021-12-08 22:35:51', '2021-12-08 22:35:51'),
(303, 11, 'Lakshamanpur', '3571', 0, '2021-12-08 22:35:51', '2021-12-08 22:35:51'),
(304, 11, 'Chhariabazar', '3582', 0, '2021-12-08 22:35:51', '2021-12-08 22:35:51'),
(305, 11, 'Dhalua', '3581', 0, '2021-12-08 22:35:51', '2021-12-08 22:35:51'),
(306, 11, 'Gunabati', '3583', 0, '2021-12-08 22:35:51', '2021-12-08 22:35:51'),
(307, 11, 'Langalkot', '3580', 0, '2021-12-08 22:35:51', '2021-12-08 22:35:51'),
(308, 11, 'Bangra', '3543', 0, '2021-12-08 22:35:51', '2021-12-08 22:35:51'),
(309, 11, 'Companyganj', '3542', 0, '2021-12-08 22:35:51', '2021-12-08 22:35:51'),
(310, 11, 'Muradnagar', '3540', 0, '2021-12-08 22:35:51', '2021-12-08 22:35:51'),
(311, 11, 'Pantibazar', '3545', 0, '2021-12-08 22:35:51', '2021-12-08 22:35:51'),
(312, 11, 'Ramchandarpur', '3541', 0, '2021-12-08 22:35:51', '2021-12-08 22:35:51'),
(313, 11, 'Sonakanda', '3544', 0, '2021-12-08 22:35:51', '2021-12-08 22:35:51'),
(314, 12, 'Badarkali', '4742', 0, '2021-12-08 22:35:51', '2021-12-08 22:35:51'),
(315, 12, 'Chiringga', '4740', 0, '2021-12-08 22:35:51', '2021-12-08 22:35:51'),
(316, 12, 'Chiringga S.O', '4741', 0, '2021-12-08 22:35:51', '2021-12-08 22:35:51'),
(317, 12, 'Malumghat', '4743', 0, '2021-12-08 22:35:51', '2021-12-08 22:35:51'),
(318, 12, 'Coxs Bazar Sadar', '4700', 0, '2021-12-08 22:35:51', '2021-12-08 22:35:51'),
(319, 12, 'Eidga', '4702', 0, '2021-12-08 22:35:51', '2021-12-08 22:35:51'),
(320, 12, 'Zhilanja', '4701', 0, '2021-12-08 22:35:51', '2021-12-08 22:35:51'),
(321, 12, 'Gorakghat', '4710', 0, '2021-12-08 22:35:51', '2021-12-08 22:35:51'),
(322, 12, 'Kutubdia', '4720', 0, '2021-12-08 22:35:51', '2021-12-08 22:35:51'),
(323, 12, 'Ramu', '4730', 0, '2021-12-08 22:35:51', '2021-12-08 22:35:51'),
(324, 12, 'Hnila', '4761', 0, '2021-12-08 22:35:51', '2021-12-08 22:35:51'),
(325, 12, 'St.Martin', '4762', 0, '2021-12-08 22:35:51', '2021-12-08 22:35:51'),
(326, 12, 'Teknaf', '4760', 0, '2021-12-08 22:35:51', '2021-12-08 22:35:51'),
(327, 12, 'Ukhia', '4750', 0, '2021-12-08 22:35:51', '2021-12-08 22:35:51'),
(328, 13, 'Chhagalnaia', '3910', 0, '2021-12-08 22:35:51', '2021-12-08 22:35:51'),
(329, 13, 'Daraga Hat', '3912', 0, '2021-12-08 22:35:51', '2021-12-08 22:35:51'),
(330, 13, 'Maharajganj', '3911', 0, '2021-12-08 22:35:51', '2021-12-08 22:35:51'),
(331, 13, 'Puabashimulia', '3913', 0, '2021-12-08 22:35:51', '2021-12-08 22:35:51'),
(332, 13, 'Chhilonia', '3922', 0, '2021-12-08 22:35:51', '2021-12-08 22:35:51'),
(333, 13, 'Dagondhuia', '3920', 0, '2021-12-08 22:35:51', '2021-12-08 22:35:51'),
(334, 13, 'Dudmukha', '3921', 0, '2021-12-08 22:35:51', '2021-12-08 22:35:51'),
(335, 13, 'Rajapur', '3923', 0, '2021-12-08 22:35:51', '2021-12-08 22:35:51'),
(336, 13, 'Fazilpur', '3901', 0, '2021-12-08 22:35:51', '2021-12-08 22:35:51'),
(337, 13, 'Feni Sadar', '3900', 0, '2021-12-08 22:35:51', '2021-12-08 22:35:51'),
(338, 13, 'Laskarhat', '3903', 0, '2021-12-08 22:35:51', '2021-12-08 22:35:51'),
(339, 13, 'Sharshadie', '3902', 0, '2021-12-08 22:35:51', '2021-12-08 22:35:51'),
(340, 13, 'Fulgazi', '3942', 0, '2021-12-08 22:35:51', '2021-12-08 22:35:51'),
(341, 13, 'Munshirhat', '3943', 0, '2021-12-08 22:35:51', '2021-12-08 22:35:51'),
(342, 13, 'Pashurampur', '3940', 0, '2021-12-08 22:35:51', '2021-12-08 22:35:51'),
(343, 13, 'Shuarbazar', '3941', 0, '2021-12-08 22:35:51', '2021-12-08 22:35:51'),
(344, 13, 'Ahmadpur', '3932', 0, '2021-12-08 22:35:52', '2021-12-08 22:35:52'),
(345, 13, 'Kazirhat', '3933', 0, '2021-12-08 22:35:52', '2021-12-08 22:35:52'),
(346, 13, 'Motiganj', '3931', 0, '2021-12-08 22:35:52', '2021-12-08 22:35:52'),
(347, 13, 'Sonagazi', '3930', 0, '2021-12-08 22:35:52', '2021-12-08 22:35:52'),
(348, 14, 'Diginala', '4420', 0, '2021-12-08 22:35:52', '2021-12-08 22:35:52'),
(349, 14, 'Khagrachhari Sadar', '4400', 0, '2021-12-08 22:35:52', '2021-12-08 22:35:52'),
(350, 14, 'Laxmichhari', '4470', 0, '2021-12-08 22:35:52', '2021-12-08 22:35:52'),
(351, 14, 'Mahalchhari', '4430', 0, '2021-12-08 22:35:52', '2021-12-08 22:35:52'),
(352, 14, 'Manikchhari', '4460', 0, '2021-12-08 22:35:52', '2021-12-08 22:35:52'),
(353, 14, 'Matiranga', '4450', 0, '2021-12-08 22:35:52', '2021-12-08 22:35:52'),
(354, 14, 'Panchhari', '4410', 0, '2021-12-08 22:35:52', '2021-12-08 22:35:52'),
(355, 14, 'Ramghar Head Office', '4440', 0, '2021-12-08 22:35:52', '2021-12-08 22:35:52'),
(356, 15, 'Char Alexgander', '3730', 0, '2021-12-08 22:35:52', '2021-12-08 22:35:52'),
(357, 15, 'Hajirghat', '3731', 0, '2021-12-08 22:35:53', '2021-12-08 22:35:53'),
(358, 15, 'Ramgatirhat', '3732', 0, '2021-12-08 22:35:53', '2021-12-08 22:35:53'),
(359, 15, 'Amani Lakshimpur', '3709', 0, '2021-12-08 22:35:53', '2021-12-08 22:35:53'),
(360, 15, 'Bhabaniganj', '3702', 0, '2021-12-08 22:35:53', '2021-12-08 22:35:53'),
(361, 15, 'Chandraganj', '3708', 0, '2021-12-08 22:35:53', '2021-12-08 22:35:53'),
(362, 15, 'Choupalli', '3707', 0, '2021-12-08 22:35:53', '2021-12-08 22:35:53'),
(363, 15, 'Dalal Bazar', '3701', 0, '2021-12-08 22:35:53', '2021-12-08 22:35:53'),
(364, 15, 'Duttapara', '3706', 0, '2021-12-08 22:35:53', '2021-12-08 22:35:53'),
(365, 15, 'Keramatganj', '3704', 0, '2021-12-08 22:35:53', '2021-12-08 22:35:53'),
(366, 15, 'Lakshimpur Sadar', '3700', 0, '2021-12-08 22:35:53', '2021-12-08 22:35:53'),
(367, 15, 'Mandari', '3703', 0, '2021-12-08 22:35:53', '2021-12-08 22:35:53'),
(368, 15, 'Rupchara', '3705', 0, '2021-12-08 22:35:53', '2021-12-08 22:35:53'),
(369, 15, 'Alipur', '3721', 0, '2021-12-08 22:35:53', '2021-12-08 22:35:53'),
(370, 15, 'Dolta', '3725', 0, '2021-12-08 22:35:53', '2021-12-08 22:35:53'),
(371, 15, 'Kanchanpur', '3723', 0, '2021-12-08 22:35:53', '2021-12-08 22:35:53'),
(372, 15, 'Naagmud', '3724', 0, '2021-12-08 22:35:53', '2021-12-08 22:35:53'),
(373, 15, 'Panpara', '3722', 0, '2021-12-08 22:35:53', '2021-12-08 22:35:53'),
(374, 15, 'Ramganj', '3720', 0, '2021-12-08 22:35:53', '2021-12-08 22:35:53'),
(375, 15, 'Bhuabari', '3714', 0, '2021-12-08 22:35:53', '2021-12-08 22:35:53'),
(376, 15, 'Haydarganj', '3713', 0, '2021-12-08 22:35:53', '2021-12-08 22:35:53'),
(377, 15, 'Nagerdighirpar', '3712', 0, '2021-12-08 22:35:53', '2021-12-08 22:35:53'),
(378, 15, 'Rakhallia', '3711', 0, '2021-12-08 22:35:53', '2021-12-08 22:35:53'),
(379, 15, 'Raypur', '3710', 0, '2021-12-08 22:35:53', '2021-12-08 22:35:53'),
(380, 16, 'Basur Hat', '3850', 0, '2021-12-08 22:35:53', '2021-12-08 22:35:53'),
(381, 16, 'Charhajari', '3851', 0, '2021-12-08 22:35:53', '2021-12-08 22:35:53'),
(382, 16, 'Alaiarpur', '3831', 0, '2021-12-08 22:35:53', '2021-12-08 22:35:53'),
(383, 16, 'Amisha Para', '3847', 0, '2021-12-08 22:35:53', '2021-12-08 22:35:53'),
(384, 16, 'Banglabazar', '3822', 0, '2021-12-08 22:35:53', '2021-12-08 22:35:53'),
(385, 16, 'Bazra', '3824', 0, '2021-12-08 22:35:53', '2021-12-08 22:35:53'),
(386, 16, 'Begumganj', '3820', 0, '2021-12-08 22:35:53', '2021-12-08 22:35:53'),
(387, 16, 'Bhabani Jibanpur', '3837', 0, '2021-12-08 22:35:53', '2021-12-08 22:35:53'),
(388, 16, 'Choumohani', '3821', 0, '2021-12-08 22:35:53', '2021-12-08 22:35:53'),
(389, 16, 'Dauti', '3843', 0, '2021-12-08 22:35:53', '2021-12-08 22:35:53'),
(390, 16, 'Durgapur', '3848', 0, '2021-12-08 22:35:53', '2021-12-08 22:35:53'),
(391, 16, 'Gopalpur', '3828', 0, '2021-12-08 22:35:53', '2021-12-08 22:35:53'),
(392, 16, 'Jamidar Hat', '3825', 0, '2021-12-08 22:35:53', '2021-12-08 22:35:53'),
(393, 16, 'Joyag', '3844', 0, '2021-12-08 22:35:53', '2021-12-08 22:35:53'),
(394, 16, 'Joynarayanpur', '3829', 0, '2021-12-08 22:35:53', '2021-12-08 22:35:53'),
(395, 16, 'Khalafat Bazar', '3833', 0, '2021-12-08 22:35:53', '2021-12-08 22:35:53'),
(396, 16, 'Khalishpur', '3842', 0, '2021-12-08 22:35:53', '2021-12-08 22:35:53'),
(397, 16, 'Maheshganj', '3838', 0, '2021-12-08 22:35:53', '2021-12-08 22:35:53'),
(398, 16, 'Mir Owarishpur', '3823', 0, '2021-12-08 22:35:53', '2021-12-08 22:35:53'),
(399, 16, 'Nadona', '3839', 0, '2021-12-08 22:35:53', '2021-12-08 22:35:53'),
(400, 16, 'Nandiapara', '3841', 0, '2021-12-08 22:35:54', '2021-12-08 22:35:54'),
(401, 16, 'Oachhekpur', '3835', 0, '2021-12-08 22:35:54', '2021-12-08 22:35:54'),
(402, 16, 'Rajganj', '3834', 0, '2021-12-08 22:35:54', '2021-12-08 22:35:54'),
(403, 16, 'Sonaimuri', '3827', 0, '2021-12-08 22:35:54', '2021-12-08 22:35:54'),
(404, 16, 'Tangirpar', '3832', 0, '2021-12-08 22:35:54', '2021-12-08 22:35:54'),
(405, 16, 'Thanar Hat', '3845', 0, '2021-12-08 22:35:54', '2021-12-08 22:35:54'),
(406, 16, 'Bansa Bazar', '3879', 0, '2021-12-08 22:35:54', '2021-12-08 22:35:54'),
(407, 16, 'Bodalcourt', '3873', 0, '2021-12-08 22:35:54', '2021-12-08 22:35:54'),
(408, 16, 'Chatkhil', '3870', 0, '2021-12-08 22:35:54', '2021-12-08 22:35:54'),
(409, 16, 'Dosh Gharia', '3878', 0, '2021-12-08 22:35:54', '2021-12-08 22:35:54'),
(410, 16, 'Karihati', '3877', 0, '2021-12-08 22:35:54', '2021-12-08 22:35:54'),
(411, 16, 'Khilpara', '3872', 0, '2021-12-08 22:35:54', '2021-12-08 22:35:54'),
(412, 16, 'Palla', '3871', 0, '2021-12-08 22:35:54', '2021-12-08 22:35:54'),
(413, 16, 'Rezzakpur', '3874', 0, '2021-12-08 22:35:54', '2021-12-08 22:35:54'),
(414, 16, 'Sahapur', '3881', 0, '2021-12-08 22:35:54', '2021-12-08 22:35:54'),
(415, 16, 'Sampara', '3882', 0, '2021-12-08 22:35:54', '2021-12-08 22:35:54'),
(416, 16, 'Shingbahura', '3883', 0, '2021-12-08 22:35:54', '2021-12-08 22:35:54'),
(417, 16, 'Solla', '3875', 0, '2021-12-08 22:35:54', '2021-12-08 22:35:54'),
(418, 16, 'Afazia', '3891', 0, '2021-12-08 22:35:54', '2021-12-08 22:35:54'),
(419, 16, 'Hatiya', '3890', 0, '2021-12-08 22:35:54', '2021-12-08 22:35:54'),
(420, 16, 'Tamoraddi', '3892', 0, '2021-12-08 22:35:54', '2021-12-08 22:35:54'),
(421, 16, 'Chaprashir Hat', '3811', 0, '2021-12-08 22:35:54', '2021-12-08 22:35:54'),
(422, 16, 'Char Jabbar', '3812', 0, '2021-12-08 22:35:54', '2021-12-08 22:35:54'),
(423, 16, 'Charam Tua', '3809', 0, '2021-12-08 22:35:54', '2021-12-08 22:35:54'),
(424, 16, 'Din Monir Hat', '3803', 0, '2021-12-08 22:35:54', '2021-12-08 22:35:54'),
(425, 16, 'Kabirhat', '3807', 0, '2021-12-08 22:35:54', '2021-12-08 22:35:54'),
(426, 16, 'Khalifar Hat', '3808', 0, '2021-12-08 22:35:54', '2021-12-08 22:35:54'),
(427, 16, 'Mriddarhat', '3806', 0, '2021-12-08 22:35:54', '2021-12-08 22:35:54'),
(428, 16, 'Noakhali College', '3801', 0, '2021-12-08 22:35:54', '2021-12-08 22:35:54'),
(429, 16, 'Noakhali Sadar', '3800', 0, '2021-12-08 22:35:54', '2021-12-08 22:35:54'),
(430, 16, 'Pak Kishoreganj', '3804', 0, '2021-12-08 22:35:54', '2021-12-08 22:35:54'),
(431, 16, 'Sonapur', '3802', 0, '2021-12-08 22:35:54', '2021-12-08 22:35:54'),
(432, 16, 'Beezbag', '3862', 0, '2021-12-08 22:35:54', '2021-12-08 22:35:54'),
(433, 16, 'Chatarpaia', '3864', 0, '2021-12-08 22:35:54', '2021-12-08 22:35:54'),
(434, 16, 'Kallyandi', '3861', 0, '2021-12-08 22:35:54', '2021-12-08 22:35:54'),
(435, 16, 'Kankirhat', '3863', 0, '2021-12-08 22:35:54', '2021-12-08 22:35:54'),
(436, 16, 'Senbag', '3860', 0, '2021-12-08 22:35:54', '2021-12-08 22:35:54'),
(437, 16, 'T.P. Lamua', '3865', 0, '2021-12-08 22:35:54', '2021-12-08 22:35:54'),
(438, 17, 'Barakal', '4570', 0, '2021-12-08 22:35:54', '2021-12-08 22:35:54'),
(439, 17, 'Bilaichhari', '4550', 0, '2021-12-08 22:35:54', '2021-12-08 22:35:54'),
(440, 17, 'Jarachhari', '4560', 0, '2021-12-08 22:35:54', '2021-12-08 22:35:54'),
(441, 17, 'Betbunia', '4511', 0, '2021-12-08 22:35:55', '2021-12-08 22:35:55'),
(442, 17, 'Kalampati', '4510', 0, '2021-12-08 22:35:55', '2021-12-08 22:35:55'),
(443, 17, 'Chandraghona', '4531', 0, '2021-12-08 22:35:55', '2021-12-08 22:35:55'),
(444, 17, 'Kaptai', '4530', 0, '2021-12-08 22:35:55', '2021-12-08 22:35:55'),
(445, 17, 'Kaptai Nuton Bazar', '4533', 0, '2021-12-08 22:35:55', '2021-12-08 22:35:55'),
(446, 17, 'Kaptai Project', '4532', 0, '2021-12-08 22:35:55', '2021-12-08 22:35:55'),
(447, 17, 'Longachh', '4580', 0, '2021-12-08 22:35:55', '2021-12-08 22:35:55'),
(448, 17, 'Marishya', '4590', 0, '2021-12-08 22:35:55', '2021-12-08 22:35:55'),
(449, 17, 'Nanichhar', '4520', 0, '2021-12-08 22:35:55', '2021-12-08 22:35:55'),
(450, 17, 'Rajsthali', '4540', 0, '2021-12-08 22:35:55', '2021-12-08 22:35:55'),
(451, 17, 'Rangamati Sadar', '4500', 0, '2021-12-08 22:35:55', '2021-12-08 22:35:55'),
(452, 18, 'Demra', '1360', 0, '2021-12-08 22:35:56', '2021-12-08 22:35:56'),
(453, 18, 'Matuail', '1362', 0, '2021-12-08 22:35:56', '2021-12-08 22:35:56'),
(454, 18, 'Sarulia', '1361', 0, '2021-12-08 22:35:56', '2021-12-08 22:35:56'),
(455, 18, 'Dhaka CantonmentTSO', '1206', 0, '2021-12-08 22:35:56', '2021-12-08 22:35:56'),
(456, 18, 'Dhamrai', '1350', 0, '2021-12-08 22:35:56', '2021-12-08 22:35:56'),
(457, 18, 'Kamalpur', '1351', 0, '2021-12-08 22:35:56', '2021-12-08 22:35:56'),
(458, 18, 'Jigatala TSO', '1209', 0, '2021-12-08 22:35:56', '2021-12-08 22:35:56'),
(459, 18, 'Banani TSO', '1213', 0, '2021-12-08 22:35:56', '2021-12-08 22:35:56'),
(460, 18, 'Gulshan Model Town', '1212', 0, '2021-12-08 22:35:56', '2021-12-08 22:35:56'),
(461, 18, 'Dhania TSO', '1232', 0, '2021-12-08 22:35:56', '2021-12-08 22:35:56'),
(462, 18, 'Joypara', '1330', 0, '2021-12-08 22:35:56', '2021-12-08 22:35:56'),
(463, 18, 'Narisha', '1332', 0, '2021-12-08 22:35:56', '2021-12-08 22:35:56'),
(464, 18, 'Palamganj', '1331', 0, '2021-12-08 22:35:56', '2021-12-08 22:35:56'),
(465, 18, 'Ati', '1312', 0, '2021-12-08 22:35:56', '2021-12-08 22:35:56'),
(466, 18, 'Dhaka Jute Mills', '1311', 0, '2021-12-08 22:35:56', '2021-12-08 22:35:56'),
(467, 18, 'Kalatia', '1313', 0, '2021-12-08 22:35:56', '2021-12-08 22:35:56'),
(468, 18, 'Keraniganj', '1310', 0, '2021-12-08 22:35:56', '2021-12-08 22:35:56'),
(469, 18, 'KhilgaonTSO', '1219', 0, '2021-12-08 22:35:56', '2021-12-08 22:35:56'),
(470, 18, 'KhilkhetTSO', '1229', 0, '2021-12-08 22:35:56', '2021-12-08 22:35:56'),
(471, 18, 'Posta TSO', '1211', 0, '2021-12-08 22:35:56', '2021-12-08 22:35:56'),
(472, 18, 'Mirpur TSO', '1216', 0, '2021-12-08 22:35:56', '2021-12-08 22:35:56'),
(473, 18, 'Mohammadpur Housing', '1207', 0, '2021-12-08 22:35:56', '2021-12-08 22:35:56'),
(474, 18, 'Sangsad BhabanTSO', '1225', 0, '2021-12-08 22:35:56', '2021-12-08 22:35:56'),
(475, 18, 'BangabhabanTSO', '1222', 0, '2021-12-08 22:35:56', '2021-12-08 22:35:56'),
(476, 18, 'DilkushaTSO', '1223', 0, '2021-12-08 22:35:56', '2021-12-08 22:35:56'),
(477, 18, 'Agla', '1323', 0, '2021-12-08 22:35:56', '2021-12-08 22:35:56'),
(478, 18, 'Churain', '1325', 0, '2021-12-08 22:35:56', '2021-12-08 22:35:56'),
(479, 18, 'Daudpur', '1322', 0, '2021-12-08 22:35:56', '2021-12-08 22:35:56'),
(480, 18, 'Hasnabad', '1321', 0, '2021-12-08 22:35:56', '2021-12-08 22:35:56'),
(481, 18, 'Khalpar', '1324', 0, '2021-12-08 22:35:56', '2021-12-08 22:35:56'),
(482, 18, 'Nawabganj', '1320', 0, '2021-12-08 22:35:56', '2021-12-08 22:35:56'),
(483, 18, 'New Market TSO', '1205', 0, '2021-12-08 22:35:56', '2021-12-08 22:35:56'),
(484, 18, 'Dhaka GPO', '1000', 0, '2021-12-08 22:35:56', '2021-12-08 22:35:56'),
(485, 18, 'Shantinagr TSO', '1217', 0, '2021-12-08 22:35:56', '2021-12-08 22:35:56'),
(486, 18, 'Basabo TSO', '1214', 0, '2021-12-08 22:35:56', '2021-12-08 22:35:56'),
(487, 18, 'Amin Bazar', '1348', 0, '2021-12-08 22:35:56', '2021-12-08 22:35:56'),
(488, 18, 'Dairy Farm', '1341', 0, '2021-12-08 22:35:56', '2021-12-08 22:35:56'),
(489, 18, 'EPZ', '1349', 0, '2021-12-08 22:35:56', '2021-12-08 22:35:56'),
(490, 18, 'Jahangirnagar Univer', '1342', 0, '2021-12-08 22:35:57', '2021-12-08 22:35:57'),
(491, 18, 'Kashem Cotton Mills', '1346', 0, '2021-12-08 22:35:57', '2021-12-08 22:35:57'),
(492, 18, 'Rajfhulbaria', '1347', 0, '2021-12-08 22:35:57', '2021-12-08 22:35:57'),
(493, 18, 'Savar', '1340', 0, '2021-12-08 22:35:57', '2021-12-08 22:35:57'),
(494, 18, 'Savar Canttonment', '1344', 0, '2021-12-08 22:35:57', '2021-12-08 22:35:57'),
(495, 18, 'Saver P.A.T.C', '1343', 0, '2021-12-08 22:35:57', '2021-12-08 22:35:57'),
(496, 18, 'Shimulia', '1345', 0, '2021-12-08 22:35:57', '2021-12-08 22:35:57'),
(497, 18, 'Dhaka Sadar HO', '1100', 0, '2021-12-08 22:35:57', '2021-12-08 22:35:57'),
(498, 18, 'Gendaria TSO', '1204', 0, '2021-12-08 22:35:57', '2021-12-08 22:35:57'),
(499, 18, 'Wari TSO', '1203', 0, '2021-12-08 22:35:57', '2021-12-08 22:35:57'),
(500, 18, 'Tejgaon TSO', '1215', 0, '2021-12-08 22:35:57', '2021-12-08 22:35:57'),
(501, 18, 'Dhaka Politechnic', '1208', 0, '2021-12-08 22:35:57', '2021-12-08 22:35:57'),
(502, 18, 'Uttara Model TwonTSO', '1230', 0, '2021-12-08 22:35:57', '2021-12-08 22:35:57'),
(503, 19, 'Alfadanga', '7870', 0, '2021-12-08 22:35:58', '2021-12-08 22:35:58'),
(504, 19, 'Bhanga', '7830', 0, '2021-12-08 22:35:58', '2021-12-08 22:35:58'),
(505, 19, 'Boalmari', '7860', 0, '2021-12-08 22:35:58', '2021-12-08 22:35:58'),
(506, 19, 'Rupatpat', '7861', 0, '2021-12-08 22:35:58', '2021-12-08 22:35:58'),
(507, 19, 'Charbadrashan', '7810', 0, '2021-12-08 22:35:58', '2021-12-08 22:35:58'),
(508, 19, 'Ambikapur', '7802', 0, '2021-12-08 22:35:58', '2021-12-08 22:35:58'),
(509, 19, 'Baitulaman Politecni', '7803', 0, '2021-12-08 22:35:58', '2021-12-08 22:35:58'),
(510, 19, 'Faridpur Sadar', '7800', 0, '2021-12-08 22:35:58', '2021-12-08 22:35:58'),
(511, 19, 'Kanaipur', '7801', 0, '2021-12-08 22:35:58', '2021-12-08 22:35:58'),
(512, 19, 'Kamarkali', '7851', 0, '2021-12-08 22:35:58', '2021-12-08 22:35:58'),
(513, 19, 'Madukhali', '7850', 0, '2021-12-08 22:35:58', '2021-12-08 22:35:58'),
(514, 19, 'Nagarkanda', '7840', 0, '2021-12-08 22:35:58', '2021-12-08 22:35:58'),
(515, 19, 'Talma', '7841', 0, '2021-12-08 22:35:58', '2021-12-08 22:35:58'),
(516, 19, 'Bishwa jaker Manjil', '7822', 0, '2021-12-08 22:35:58', '2021-12-08 22:35:58'),
(517, 19, 'Hat Krishapur', '7821', 0, '2021-12-08 22:35:58', '2021-12-08 22:35:58'),
(518, 19, 'Sadarpur', '7820', 0, '2021-12-08 22:35:58', '2021-12-08 22:35:58'),
(519, 19, 'Shriangan', '7804', 0, '2021-12-08 22:35:58', '2021-12-08 22:35:58'),
(520, 20, 'B.O.F', '1703', 0, '2021-12-08 22:35:58', '2021-12-08 22:35:58'),
(521, 20, 'B.R.R', '1701', 0, '2021-12-08 22:35:58', '2021-12-08 22:35:58'),
(522, 20, 'Chandna', '1702', 0, '2021-12-08 22:35:58', '2021-12-08 22:35:58'),
(523, 20, 'Gazipur Sadar', '1700', 0, '2021-12-08 22:35:58', '2021-12-08 22:35:58'),
(524, 20, 'National University', '1704', 0, '2021-12-08 22:35:58', '2021-12-08 22:35:58'),
(525, 20, 'Kaliakaar', '1750', 0, '2021-12-08 22:35:58', '2021-12-08 22:35:58'),
(526, 20, 'Safipur', '1751', 0, '2021-12-08 22:35:58', '2021-12-08 22:35:58'),
(527, 20, 'Kaliganj', '1720', 0, '2021-12-08 22:35:58', '2021-12-08 22:35:58'),
(528, 20, 'Pubail', '1721', 0, '2021-12-08 22:35:58', '2021-12-08 22:35:58'),
(529, 20, 'Santanpara', '1722', 0, '2021-12-08 22:35:58', '2021-12-08 22:35:58'),
(530, 20, 'Vaoal Jamalpur', '1723', 0, '2021-12-08 22:35:58', '2021-12-08 22:35:58'),
(531, 20, 'kapashia', '1730', 0, '2021-12-08 22:35:58', '2021-12-08 22:35:58'),
(532, 20, 'Ershad Nagar', '1712', 0, '2021-12-08 22:35:58', '2021-12-08 22:35:58'),
(533, 20, 'Monnunagar', '1710', 0, '2021-12-08 22:35:58', '2021-12-08 22:35:58'),
(534, 20, 'Nishat Nagar', '1711', 0, '2021-12-08 22:35:58', '2021-12-08 22:35:58'),
(535, 20, 'Barmi', '1743', 0, '2021-12-08 22:35:58', '2021-12-08 22:35:58'),
(536, 20, 'Bashamur', '1747', 0, '2021-12-08 22:35:58', '2021-12-08 22:35:58'),
(537, 20, 'Boubi', '1748', 0, '2021-12-08 22:35:58', '2021-12-08 22:35:58'),
(538, 20, 'Kawraid', '1745', 0, '2021-12-08 22:35:58', '2021-12-08 22:35:58'),
(539, 20, 'Satkhamair', '1744', 0, '2021-12-08 22:35:58', '2021-12-08 22:35:58'),
(540, 20, 'Sreepur', '1740', 0, '2021-12-08 22:35:58', '2021-12-08 22:35:58'),
(541, 20, 'Rajendrapur', '1741', 0, '2021-12-08 22:35:58', '2021-12-08 22:35:58'),
(542, 20, 'Rajendrapur Canttome', '1742', 0, '2021-12-08 22:35:58', '2021-12-08 22:35:58'),
(543, 21, 'Barfa', '8102', 0, '2021-12-08 22:35:58', '2021-12-08 22:35:58'),
(544, 21, 'Chandradighalia', '8013', 0, '2021-12-08 22:35:58', '2021-12-08 22:35:58'),
(545, 21, 'Gopalganj Sadar', '8100', 0, '2021-12-08 22:35:58', '2021-12-08 22:35:58'),
(546, 21, 'Ulpur', '8101', 0, '2021-12-08 22:35:58', '2021-12-08 22:35:58'),
(547, 21, 'Jonapur', '8133', 0, '2021-12-08 22:35:58', '2021-12-08 22:35:58'),
(548, 21, 'Kashiani', '8130', 0, '2021-12-08 22:35:58', '2021-12-08 22:35:58'),
(549, 21, 'Ramdia College', '8131', 0, '2021-12-08 22:35:58', '2021-12-08 22:35:58'),
(550, 21, 'Ratoil', '8132', 0, '2021-12-08 22:35:58', '2021-12-08 22:35:58'),
(551, 21, 'Kotalipara', '8110', 0, '2021-12-08 22:35:58', '2021-12-08 22:35:58'),
(552, 21, 'Batkiamari', '8141', 0, '2021-12-08 22:35:59', '2021-12-08 22:35:59'),
(553, 21, 'Khandarpara', '8142', 0, '2021-12-08 22:35:59', '2021-12-08 22:35:59'),
(554, 21, 'Maksudpur', '8140', 0, '2021-12-08 22:35:59', '2021-12-08 22:35:59'),
(555, 21, 'Patgati', '8121', 0, '2021-12-08 22:35:59', '2021-12-08 22:35:59'),
(556, 21, 'Tungipara', '8120', 0, '2021-12-08 22:35:59', '2021-12-08 22:35:59'),
(557, 22, 'Bajitpur', '2336', 0, '2021-12-08 22:36:00', '2021-12-08 22:36:00'),
(558, 22, 'Laksmipur', '2338', 0, '2021-12-08 22:36:00', '2021-12-08 22:36:00'),
(559, 22, 'Sararchar', '2337', 0, '2021-12-08 22:36:00', '2021-12-08 22:36:00'),
(560, 22, 'Bhairab', '2350', 0, '2021-12-08 22:36:00', '2021-12-08 22:36:00'),
(561, 22, 'Hossenpur', '2320', 0, '2021-12-08 22:36:00', '2021-12-08 22:36:00'),
(562, 22, 'Itna', '2390', 0, '2021-12-08 22:36:00', '2021-12-08 22:36:00'),
(563, 22, 'Karimganj', '2310', 0, '2021-12-08 22:36:00', '2021-12-08 22:36:00'),
(564, 22, 'Gochhihata', '2331', 0, '2021-12-08 22:36:00', '2021-12-08 22:36:00'),
(565, 22, 'Katiadi', '2330', 0, '2021-12-08 22:36:00', '2021-12-08 22:36:00'),
(566, 22, 'Kishoreganj S.Mills', '2301', 0, '2021-12-08 22:36:00', '2021-12-08 22:36:00'),
(567, 22, 'Kishoreganj Sadar', '2300', 0, '2021-12-08 22:36:00', '2021-12-08 22:36:00'),
(568, 22, 'Maizhati', '2302', 0, '2021-12-08 22:36:00', '2021-12-08 22:36:00'),
(569, 22, 'Nilganj', '2303', 0, '2021-12-08 22:36:00', '2021-12-08 22:36:00'),
(570, 22, 'Chhoysuti', '2341', 0, '2021-12-08 22:36:00', '2021-12-08 22:36:00'),
(571, 22, 'Kuliarchar', '2340', 0, '2021-12-08 22:36:00', '2021-12-08 22:36:00'),
(572, 22, 'Abdullahpur', '2371', 0, '2021-12-08 22:36:00', '2021-12-08 22:36:00'),
(573, 22, 'MIthamoin', '2370', 0, '2021-12-08 22:36:00', '2021-12-08 22:36:00'),
(574, 22, 'Nikli', '2360', 0, '2021-12-08 22:36:00', '2021-12-08 22:36:00'),
(575, 22, 'Ostagram', '2380', 0, '2021-12-08 22:36:00', '2021-12-08 22:36:00'),
(576, 22, 'Pakundia', '2326', 0, '2021-12-08 22:36:01', '2021-12-08 22:36:01'),
(577, 22, 'Tarial', '2316', 0, '2021-12-08 22:36:01', '2021-12-08 22:36:01'),
(578, 23, 'Bahadurpur', '7932', 0, '2021-12-08 22:36:01', '2021-12-08 22:36:01'),
(579, 23, 'Barhamganj', '7930', 0, '2021-12-08 22:36:01', '2021-12-08 22:36:01'),
(580, 23, 'Nilaksmibandar', '7931', 0, '2021-12-08 22:36:01', '2021-12-08 22:36:01'),
(581, 23, 'Umedpur', '7933', 0, '2021-12-08 22:36:01', '2021-12-08 22:36:01'),
(582, 23, 'Kalkini', '7920', 0, '2021-12-08 22:36:01', '2021-12-08 22:36:01'),
(583, 23, 'Sahabrampur', '7921', 0, '2021-12-08 22:36:01', '2021-12-08 22:36:01'),
(584, 23, 'Charmugria', '7901', 0, '2021-12-08 22:36:01', '2021-12-08 22:36:01'),
(585, 23, 'Habiganj', '7903', 0, '2021-12-08 22:36:01', '2021-12-08 22:36:01'),
(586, 23, 'Kulpaddi', '7902', 0, '2021-12-08 22:36:01', '2021-12-08 22:36:01'),
(587, 23, 'Madaripur Sadar', '7900', 0, '2021-12-08 22:36:01', '2021-12-08 22:36:01'),
(588, 23, 'Mustafapur', '7904', 0, '2021-12-08 22:36:01', '2021-12-08 22:36:01'),
(589, 23, 'Khalia', '7911', 0, '2021-12-08 22:36:01', '2021-12-08 22:36:01'),
(590, 23, 'Rajoir', '7910', 0, '2021-12-08 22:36:01', '2021-12-08 22:36:01'),
(591, 24, 'Doulatpur', '1860', 0, '2021-12-08 22:36:01', '2021-12-08 22:36:01'),
(592, 24, 'Gheor', '1840', 0, '2021-12-08 22:36:01', '2021-12-08 22:36:01'),
(593, 24, 'Jhitka', '1831', 0, '2021-12-08 22:36:01', '2021-12-08 22:36:01'),
(594, 24, 'Lechhraganj', '1830', 0, '2021-12-08 22:36:01', '2021-12-08 22:36:01'),
(595, 24, 'Barangail', '1804', 0, '2021-12-08 22:36:01', '2021-12-08 22:36:01'),
(596, 24, 'Gorpara', '1802', 0, '2021-12-08 22:36:01', '2021-12-08 22:36:01'),
(597, 24, 'Mahadebpur', '1803', 0, '2021-12-08 22:36:01', '2021-12-08 22:36:01'),
(598, 24, 'Manikganj Bazar', '1801', 0, '2021-12-08 22:36:01', '2021-12-08 22:36:01'),
(599, 24, 'Manikganj Sadar', '1800', 0, '2021-12-08 22:36:01', '2021-12-08 22:36:01'),
(600, 24, 'Baliati', '1811', 0, '2021-12-08 22:36:01', '2021-12-08 22:36:01'),
(601, 24, 'Saturia', '1810', 0, '2021-12-08 22:36:01', '2021-12-08 22:36:01'),
(602, 24, 'Aricha', '1851', 0, '2021-12-08 22:36:01', '2021-12-08 22:36:01'),
(603, 24, 'Shibaloy', '1850', 0, '2021-12-08 22:36:01', '2021-12-08 22:36:01'),
(604, 24, 'Tewta', '1852', 0, '2021-12-08 22:36:01', '2021-12-08 22:36:01'),
(605, 24, 'Uthli', '1853', 0, '2021-12-08 22:36:01', '2021-12-08 22:36:01'),
(606, 24, 'Baira', '1821', 0, '2021-12-08 22:36:01', '2021-12-08 22:36:01'),
(607, 24, 'joymantop', '1822', 0, '2021-12-08 22:36:01', '2021-12-08 22:36:01'),
(608, 24, 'Singair', '1820', 0, '2021-12-08 22:36:01', '2021-12-08 22:36:01'),
(609, 25, 'Gajaria', '1510', 0, '2021-12-08 22:36:02', '2021-12-08 22:36:02'),
(610, 25, 'Hossendi', '1511', 0, '2021-12-08 22:36:02', '2021-12-08 22:36:02'),
(611, 25, 'Rasulpur', '1512', 0, '2021-12-08 22:36:02', '2021-12-08 22:36:02'),
(612, 25, 'Gouragonj', '1334', 0, '2021-12-08 22:36:02', '2021-12-08 22:36:02'),
(613, 25, 'Gouragonj', '1534', 0, '2021-12-08 22:36:02', '2021-12-08 22:36:02'),
(614, 25, 'Haldia SO', '1532', 0, '2021-12-08 22:36:02', '2021-12-08 22:36:02'),
(615, 25, 'Haridia', '1333', 0, '2021-12-08 22:36:02', '2021-12-08 22:36:02'),
(616, 25, 'Haridia DESO', '1533', 0, '2021-12-08 22:36:03', '2021-12-08 22:36:03'),
(617, 25, 'Korhati', '1531', 0, '2021-12-08 22:36:03', '2021-12-08 22:36:03'),
(618, 25, 'Lohajang', '1530', 0, '2021-12-08 22:36:03', '2021-12-08 22:36:03'),
(619, 25, 'Madini Mandal', '1335', 0, '2021-12-08 22:36:03', '2021-12-08 22:36:03'),
(620, 25, 'Medini Mandal EDSO', '1535', 0, '2021-12-08 22:36:03', '2021-12-08 22:36:03'),
(621, 25, 'Kathakhali', '1503', 0, '2021-12-08 22:36:03', '2021-12-08 22:36:03'),
(622, 25, 'Mirkadim', '1502', 0, '2021-12-08 22:36:03', '2021-12-08 22:36:03'),
(623, 25, 'Munshiganj Sadar', '1500', 0, '2021-12-08 22:36:03', '2021-12-08 22:36:03'),
(624, 25, 'Rikabibazar', '1501', 0, '2021-12-08 22:36:03', '2021-12-08 22:36:03'),
(625, 25, 'Ichapur', '1542', 0, '2021-12-08 22:36:03', '2021-12-08 22:36:03'),
(626, 25, 'Kola', '1541', 0, '2021-12-08 22:36:03', '2021-12-08 22:36:03'),
(627, 25, 'Malkha Nagar', '1543', 0, '2021-12-08 22:36:03', '2021-12-08 22:36:03'),
(628, 25, 'Shekher Nagar', '1544', 0, '2021-12-08 22:36:03', '2021-12-08 22:36:03'),
(629, 25, 'Sirajdikhan', '1540', 0, '2021-12-08 22:36:03', '2021-12-08 22:36:03');
INSERT INTO `post_office_lists` (`id`, `district_list_id`, `name`, `post_code`, `status`, `created_at`, `updated_at`) VALUES
(630, 25, 'Baghra', '1557', 0, '2021-12-08 22:36:03', '2021-12-08 22:36:03'),
(631, 25, 'Barikhal', '1551', 0, '2021-12-08 22:36:03', '2021-12-08 22:36:03'),
(632, 25, 'Bhaggyakul', '1558', 0, '2021-12-08 22:36:03', '2021-12-08 22:36:03'),
(633, 25, 'Hashara', '1553', 0, '2021-12-08 22:36:03', '2021-12-08 22:36:03'),
(634, 25, 'Kolapara', '1554', 0, '2021-12-08 22:36:03', '2021-12-08 22:36:03'),
(635, 25, 'Kumarbhog', '1555', 0, '2021-12-08 22:36:03', '2021-12-08 22:36:03'),
(636, 25, 'Mazpara', '1552', 0, '2021-12-08 22:36:03', '2021-12-08 22:36:03'),
(637, 25, 'Srinagar', '1550', 0, '2021-12-08 22:36:03', '2021-12-08 22:36:03'),
(638, 25, 'Vaggyakul SO', '1556', 0, '2021-12-08 22:36:03', '2021-12-08 22:36:03'),
(639, 25, 'Bajrajugini', '1523', 0, '2021-12-08 22:36:03', '2021-12-08 22:36:03'),
(640, 25, 'Baligao', '1522', 0, '2021-12-08 22:36:03', '2021-12-08 22:36:03'),
(641, 25, 'Betkahat', '1521', 0, '2021-12-08 22:36:03', '2021-12-08 22:36:03'),
(642, 25, 'Dighirpar', '1525', 0, '2021-12-08 22:36:03', '2021-12-08 22:36:03'),
(643, 25, 'Hasail', '1524', 0, '2021-12-08 22:36:03', '2021-12-08 22:36:03'),
(644, 25, 'Pura', '1527', 0, '2021-12-08 22:36:03', '2021-12-08 22:36:03'),
(645, 25, 'Pura EDSO', '1526', 0, '2021-12-08 22:36:03', '2021-12-08 22:36:03'),
(646, 25, 'Tangibari', '1520', 0, '2021-12-08 22:36:03', '2021-12-08 22:36:03'),
(647, 26, 'Araihazar', '1450', 0, '2021-12-08 22:36:03', '2021-12-08 22:36:03'),
(648, 26, 'Gopaldi', '1451', 0, '2021-12-08 22:36:03', '2021-12-08 22:36:03'),
(649, 26, 'Baidder Bazar', '1440', 0, '2021-12-08 22:36:03', '2021-12-08 22:36:03'),
(650, 26, 'Bara Nagar', '1441', 0, '2021-12-08 22:36:03', '2021-12-08 22:36:03'),
(651, 26, 'Barodi', '1442', 0, '2021-12-08 22:36:03', '2021-12-08 22:36:03'),
(652, 26, 'Bandar', '1410', 0, '2021-12-08 22:36:03', '2021-12-08 22:36:03'),
(653, 26, 'BIDS', '1413', 0, '2021-12-08 22:36:03', '2021-12-08 22:36:03'),
(654, 26, 'D.C Mills', '1411', 0, '2021-12-08 22:36:03', '2021-12-08 22:36:03'),
(655, 26, 'Madanganj', '1414', 0, '2021-12-08 22:36:03', '2021-12-08 22:36:03'),
(656, 26, 'Nabiganj', '1412', 0, '2021-12-08 22:36:03', '2021-12-08 22:36:03'),
(657, 26, 'Fatulla Bazar', '1421', 0, '2021-12-08 22:36:03', '2021-12-08 22:36:03'),
(658, 26, 'Fatullah', '1420', 0, '2021-12-08 22:36:03', '2021-12-08 22:36:03'),
(659, 26, 'Narayanganj Sadar', '1400', 0, '2021-12-08 22:36:03', '2021-12-08 22:36:03'),
(660, 26, 'Bhulta', '1462', 0, '2021-12-08 22:36:03', '2021-12-08 22:36:03'),
(661, 26, 'Kanchan', '1461', 0, '2021-12-08 22:36:03', '2021-12-08 22:36:03'),
(662, 26, 'Murapara', '1464', 0, '2021-12-08 22:36:03', '2021-12-08 22:36:03'),
(663, 26, 'Nagri', '1463', 0, '2021-12-08 22:36:03', '2021-12-08 22:36:03'),
(664, 26, 'Rupganj', '1460', 0, '2021-12-08 22:36:03', '2021-12-08 22:36:03'),
(665, 26, 'Adamjeenagar', '1431', 0, '2021-12-08 22:36:03', '2021-12-08 22:36:03'),
(666, 26, 'LN Mills', '1432', 0, '2021-12-08 22:36:03', '2021-12-08 22:36:03'),
(667, 26, 'Siddirganj', '1430', 0, '2021-12-08 22:36:03', '2021-12-08 22:36:03'),
(668, 27, 'Belabo', '1640', 0, '2021-12-08 22:36:04', '2021-12-08 22:36:04'),
(669, 27, 'Hatirdia', '1651', 0, '2021-12-08 22:36:04', '2021-12-08 22:36:04'),
(670, 27, 'Katabaria', '1652', 0, '2021-12-08 22:36:04', '2021-12-08 22:36:04'),
(671, 27, 'Monohordi', '1650', 0, '2021-12-08 22:36:04', '2021-12-08 22:36:04'),
(672, 27, 'Karimpur', '1605', 0, '2021-12-08 22:36:04', '2021-12-08 22:36:04'),
(673, 27, 'Madhabdi', '1604', 0, '2021-12-08 22:36:04', '2021-12-08 22:36:04'),
(674, 27, 'Narsingdi College', '1602', 0, '2021-12-08 22:36:04', '2021-12-08 22:36:04'),
(675, 27, 'Narsingdi Sadar', '1600', 0, '2021-12-08 22:36:04', '2021-12-08 22:36:04'),
(676, 27, 'Panchdona', '1603', 0, '2021-12-08 22:36:04', '2021-12-08 22:36:04'),
(677, 27, 'UMC Jute Mills', '1601', 0, '2021-12-08 22:36:04', '2021-12-08 22:36:04'),
(678, 27, 'Char Sindhur', '1612', 0, '2021-12-08 22:36:04', '2021-12-08 22:36:04'),
(679, 27, 'Ghorashal', '1613', 0, '2021-12-08 22:36:04', '2021-12-08 22:36:04'),
(680, 27, 'Ghorashal Urea Facto', '1611', 0, '2021-12-08 22:36:04', '2021-12-08 22:36:04'),
(681, 27, 'Palash', '1610', 0, '2021-12-08 22:36:04', '2021-12-08 22:36:04'),
(682, 27, 'Bazar Hasnabad', '1631', 0, '2021-12-08 22:36:05', '2021-12-08 22:36:05'),
(683, 27, 'Radhaganj bazar', '1632', 0, '2021-12-08 22:36:05', '2021-12-08 22:36:05'),
(684, 27, 'Raypura', '1630', 0, '2021-12-08 22:36:05', '2021-12-08 22:36:05'),
(685, 27, 'Shibpur', '1620', 0, '2021-12-08 22:36:05', '2021-12-08 22:36:05'),
(686, 28, 'Baliakandi', '7730', 0, '2021-12-08 22:36:05', '2021-12-08 22:36:05'),
(687, 28, 'Nalia', '7731', 0, '2021-12-08 22:36:05', '2021-12-08 22:36:05'),
(688, 28, 'Mrigibazar', '7723', 0, '2021-12-08 22:36:05', '2021-12-08 22:36:05'),
(689, 28, 'Pangsha', '7720', 0, '2021-12-08 22:36:05', '2021-12-08 22:36:05'),
(690, 28, 'Ramkol', '7721', 0, '2021-12-08 22:36:05', '2021-12-08 22:36:05'),
(691, 28, 'Ratandia', '7722', 0, '2021-12-08 22:36:05', '2021-12-08 22:36:05'),
(692, 28, 'Goalanda', '7710', 0, '2021-12-08 22:36:05', '2021-12-08 22:36:05'),
(693, 28, 'Khankhanapur', '7711', 0, '2021-12-08 22:36:05', '2021-12-08 22:36:05'),
(694, 28, 'Rajbari Sadar', '7700', 0, '2021-12-08 22:36:05', '2021-12-08 22:36:05'),
(695, 29, 'Bhedorganj', '8030', 0, '2021-12-08 22:36:05', '2021-12-08 22:36:05'),
(696, 29, 'Damudhya', '8040', 0, '2021-12-08 22:36:05', '2021-12-08 22:36:05'),
(697, 29, 'Gosairhat', '8050', 0, '2021-12-08 22:36:05', '2021-12-08 22:36:05'),
(698, 29, 'Jajira', '8010', 0, '2021-12-08 22:36:05', '2021-12-08 22:36:05'),
(699, 29, 'Bhozeshwar', '8021', 0, '2021-12-08 22:36:05', '2021-12-08 22:36:05'),
(700, 29, 'Gharisar', '8022', 0, '2021-12-08 22:36:05', '2021-12-08 22:36:05'),
(701, 29, 'Kartikpur', '8024', 0, '2021-12-08 22:36:05', '2021-12-08 22:36:05'),
(702, 29, 'Naria', '8020', 0, '2021-12-08 22:36:05', '2021-12-08 22:36:05'),
(703, 29, 'Upshi', '8023', 0, '2021-12-08 22:36:05', '2021-12-08 22:36:05'),
(704, 29, 'Angaria', '8001', 0, '2021-12-08 22:36:05', '2021-12-08 22:36:05'),
(705, 29, 'Chikandi', '8002', 0, '2021-12-08 22:36:05', '2021-12-08 22:36:05'),
(706, 29, 'Shariatpur Sadar', '8000', 0, '2021-12-08 22:36:05', '2021-12-08 22:36:05'),
(707, 30, 'Basail', '1920', 0, '2021-12-08 22:36:06', '2021-12-08 22:36:06'),
(708, 30, 'Bhuapur', '1960', 0, '2021-12-08 22:36:06', '2021-12-08 22:36:06'),
(709, 30, 'Delduar', '1910', 0, '2021-12-08 22:36:06', '2021-12-08 22:36:06'),
(710, 30, 'Elasin', '1913', 0, '2021-12-08 22:36:06', '2021-12-08 22:36:06'),
(711, 30, 'Hinga Nagar', '1914', 0, '2021-12-08 22:36:06', '2021-12-08 22:36:06'),
(712, 30, 'Jangalia', '1911', 0, '2021-12-08 22:36:06', '2021-12-08 22:36:06'),
(713, 30, 'Lowhati', '1915', 0, '2021-12-08 22:36:06', '2021-12-08 22:36:06'),
(714, 30, 'Patharail', '1912', 0, '2021-12-08 22:36:06', '2021-12-08 22:36:06'),
(715, 30, 'D. Pakutia', '1982', 0, '2021-12-08 22:36:06', '2021-12-08 22:36:06'),
(716, 30, 'Dhalapara', '1983', 0, '2021-12-08 22:36:06', '2021-12-08 22:36:06'),
(717, 30, 'Ghatial', '1980', 0, '2021-12-08 22:36:06', '2021-12-08 22:36:06'),
(718, 30, 'Lohani', '1984', 0, '2021-12-08 22:36:06', '2021-12-08 22:36:06'),
(719, 30, 'Zahidganj', '1981', 0, '2021-12-08 22:36:06', '2021-12-08 22:36:06'),
(720, 30, 'Gopalpur', '1990', 0, '2021-12-08 22:36:06', '2021-12-08 22:36:06'),
(721, 30, 'Hemnagar', '1992', 0, '2021-12-08 22:36:06', '2021-12-08 22:36:06'),
(722, 30, 'Jhowail', '1991', 0, '2021-12-08 22:36:06', '2021-12-08 22:36:06'),
(723, 30, 'Ballabazar', '1973', 0, '2021-12-08 22:36:06', '2021-12-08 22:36:06'),
(724, 30, 'Elinga', '1974', 0, '2021-12-08 22:36:06', '2021-12-08 22:36:06'),
(725, 30, 'Kalihati', '1970', 0, '2021-12-08 22:36:06', '2021-12-08 22:36:06'),
(726, 30, 'Nagarbari', '1977', 0, '2021-12-08 22:36:06', '2021-12-08 22:36:06'),
(727, 30, 'Nagarbari SO', '1976', 0, '2021-12-08 22:36:06', '2021-12-08 22:36:06'),
(728, 30, 'Nagbari', '1972', 0, '2021-12-08 22:36:07', '2021-12-08 22:36:07'),
(729, 30, 'Palisha', '1975', 0, '2021-12-08 22:36:07', '2021-12-08 22:36:07'),
(730, 30, 'Rajafair', '1971', 0, '2021-12-08 22:36:07', '2021-12-08 22:36:07'),
(731, 30, 'Kashkawlia', '1930', 0, '2021-12-08 22:36:07', '2021-12-08 22:36:07'),
(732, 30, 'Dhobari', '1997', 0, '2021-12-08 22:36:07', '2021-12-08 22:36:07'),
(733, 30, 'Madhupur', '1996', 0, '2021-12-08 22:36:07', '2021-12-08 22:36:07'),
(734, 30, 'Gorai', '1941', 0, '2021-12-08 22:36:07', '2021-12-08 22:36:07'),
(735, 30, 'Jarmuki', '1944', 0, '2021-12-08 22:36:07', '2021-12-08 22:36:07'),
(736, 30, 'M.C. College', '1942', 0, '2021-12-08 22:36:07', '2021-12-08 22:36:07'),
(737, 30, 'Mirzapur', '1940', 0, '2021-12-08 22:36:07', '2021-12-08 22:36:07'),
(738, 30, 'Mohera', '1945', 0, '2021-12-08 22:36:07', '2021-12-08 22:36:07'),
(739, 30, 'Warri paikpara', '1943', 0, '2021-12-08 22:36:07', '2021-12-08 22:36:07'),
(740, 30, 'Dhuburia', '1937', 0, '2021-12-08 22:36:07', '2021-12-08 22:36:07'),
(741, 30, 'Nagarpur', '1936', 0, '2021-12-08 22:36:07', '2021-12-08 22:36:07'),
(742, 30, 'Salimabad', '1938', 0, '2021-12-08 22:36:07', '2021-12-08 22:36:07'),
(743, 30, 'Kochua', '1951', 0, '2021-12-08 22:36:07', '2021-12-08 22:36:07'),
(744, 30, 'Sakhipur', '1950', 0, '2021-12-08 22:36:07', '2021-12-08 22:36:07'),
(745, 30, 'Kagmari', '1901', 0, '2021-12-08 22:36:07', '2021-12-08 22:36:07'),
(746, 30, 'Korotia', '1903', 0, '2021-12-08 22:36:07', '2021-12-08 22:36:07'),
(747, 30, 'Purabari', '1904', 0, '2021-12-08 22:36:07', '2021-12-08 22:36:07'),
(748, 30, 'Santosh', '1902', 0, '2021-12-08 22:36:07', '2021-12-08 22:36:07'),
(749, 30, 'Tangail Sadar', '1900', 0, '2021-12-08 22:36:07', '2021-12-08 22:36:07'),
(750, 31, 'Bagerhat Sadar', '9300', 0, '2021-12-08 22:36:07', '2021-12-08 22:36:07'),
(751, 31, 'P.C College', '9301', 0, '2021-12-08 22:36:07', '2021-12-08 22:36:07'),
(752, 31, 'Rangdia', '9302', 0, '2021-12-08 22:36:07', '2021-12-08 22:36:07'),
(753, 31, 'Chalna Ankorage', '9350', 0, '2021-12-08 22:36:07', '2021-12-08 22:36:07'),
(754, 31, 'Mongla Port', '9351', 0, '2021-12-08 22:36:07', '2021-12-08 22:36:07'),
(755, 31, 'Barabaria', '9361', 0, '2021-12-08 22:36:07', '2021-12-08 22:36:07'),
(756, 31, 'Chitalmari', '9360', 0, '2021-12-08 22:36:07', '2021-12-08 22:36:07'),
(757, 31, 'Bhanganpar Bazar', '9372', 0, '2021-12-08 22:36:07', '2021-12-08 22:36:07'),
(758, 31, 'Fakirhat', '9370', 0, '2021-12-08 22:36:07', '2021-12-08 22:36:07'),
(759, 31, 'Mansa', '9371', 0, '2021-12-08 22:36:07', '2021-12-08 22:36:07'),
(760, 31, 'Kachua', '9310', 0, '2021-12-08 22:36:07', '2021-12-08 22:36:07'),
(761, 31, 'Sonarkola', '9311', 0, '2021-12-08 22:36:07', '2021-12-08 22:36:07'),
(762, 31, 'Charkulia', '9383', 0, '2021-12-08 22:36:07', '2021-12-08 22:36:07'),
(763, 31, 'Dariala', '9382', 0, '2021-12-08 22:36:07', '2021-12-08 22:36:07'),
(764, 31, 'Kahalpur', '9381', 0, '2021-12-08 22:36:07', '2021-12-08 22:36:07'),
(765, 31, 'Mollahat', '9380', 0, '2021-12-08 22:36:07', '2021-12-08 22:36:07'),
(766, 31, 'Nagarkandi', '9384', 0, '2021-12-08 22:36:07', '2021-12-08 22:36:07'),
(767, 31, 'Pak Gangni', '9385', 0, '2021-12-08 22:36:07', '2021-12-08 22:36:07'),
(768, 31, 'Morelganj', '9320', 0, '2021-12-08 22:36:07', '2021-12-08 22:36:07'),
(769, 31, 'Sannasi Bazar', '9321', 0, '2021-12-08 22:36:07', '2021-12-08 22:36:07'),
(770, 31, 'Telisatee', '9322', 0, '2021-12-08 22:36:07', '2021-12-08 22:36:07'),
(771, 31, 'Foylahat', '9341', 0, '2021-12-08 22:36:07', '2021-12-08 22:36:07'),
(772, 31, 'Gourambha', '9343', 0, '2021-12-08 22:36:07', '2021-12-08 22:36:07'),
(773, 31, 'Rampal', '9340', 0, '2021-12-08 22:36:07', '2021-12-08 22:36:07'),
(774, 31, 'Sonatunia', '9342', 0, '2021-12-08 22:36:07', '2021-12-08 22:36:07'),
(775, 31, 'Rayenda', '9330', 0, '2021-12-08 22:36:07', '2021-12-08 22:36:07'),
(776, 32, 'Alamdanga', '7210', 0, '2021-12-08 22:36:08', '2021-12-08 22:36:08'),
(777, 32, 'Hardi', '7211', 0, '2021-12-08 22:36:08', '2021-12-08 22:36:08'),
(778, 32, 'Chuadanga Sadar', '7200', 0, '2021-12-08 22:36:08', '2021-12-08 22:36:08'),
(779, 32, 'Munshiganj', '7201', 0, '2021-12-08 22:36:08', '2021-12-08 22:36:08'),
(780, 32, 'Andulbaria', '7222', 0, '2021-12-08 22:36:08', '2021-12-08 22:36:08'),
(781, 32, 'Damurhuda', '7220', 0, '2021-12-08 22:36:08', '2021-12-08 22:36:08'),
(782, 32, 'Darshana', '7221', 0, '2021-12-08 22:36:08', '2021-12-08 22:36:08'),
(783, 32, 'Doulatganj', '7230', 0, '2021-12-08 22:36:08', '2021-12-08 22:36:08'),
(784, 33, 'Bagharpara', '7470', 0, '2021-12-08 22:36:08', '2021-12-08 22:36:08'),
(785, 33, 'Gouranagar', '7471', 0, '2021-12-08 22:36:08', '2021-12-08 22:36:08'),
(786, 33, 'Chougachha', '7410', 0, '2021-12-08 22:36:08', '2021-12-08 22:36:08'),
(787, 33, 'Basundia', '7406', 0, '2021-12-08 22:36:08', '2021-12-08 22:36:08'),
(788, 33, 'Chanchra', '7402', 0, '2021-12-08 22:36:08', '2021-12-08 22:36:08'),
(789, 33, 'Churamankathi', '7407', 0, '2021-12-08 22:36:08', '2021-12-08 22:36:08'),
(790, 33, 'Jessore Airbach', '7404', 0, '2021-12-08 22:36:08', '2021-12-08 22:36:08'),
(791, 33, 'Jessore canttonment', '7403', 0, '2021-12-08 22:36:08', '2021-12-08 22:36:08'),
(792, 33, 'Jessore Sadar', '7400', 0, '2021-12-08 22:36:08', '2021-12-08 22:36:08'),
(793, 33, 'Jessore Upa-Shahar', '7401', 0, '2021-12-08 22:36:08', '2021-12-08 22:36:08'),
(794, 33, 'Rupdia', '7405', 0, '2021-12-08 22:36:08', '2021-12-08 22:36:08'),
(795, 33, 'Jhikargachha', '7420', 0, '2021-12-08 22:36:08', '2021-12-08 22:36:08'),
(796, 33, 'Keshobpur', '7450', 0, '2021-12-08 22:36:08', '2021-12-08 22:36:08'),
(797, 33, 'Monirampur', '7440', 0, '2021-12-08 22:36:08', '2021-12-08 22:36:08'),
(798, 33, 'Bhugilhat', '7462', 0, '2021-12-08 22:36:08', '2021-12-08 22:36:08'),
(799, 33, 'Noapara', '7460', 0, '2021-12-08 22:36:08', '2021-12-08 22:36:08'),
(800, 33, 'Rajghat', '7461', 0, '2021-12-08 22:36:08', '2021-12-08 22:36:08'),
(801, 33, 'Bag Achra', '7433', 0, '2021-12-08 22:36:09', '2021-12-08 22:36:09'),
(802, 33, 'Benapole', '7431', 0, '2021-12-08 22:36:09', '2021-12-08 22:36:09'),
(803, 33, 'Jadabpur', '7432', 0, '2021-12-08 22:36:09', '2021-12-08 22:36:09'),
(804, 33, 'Sarsa', '7430', 0, '2021-12-08 22:36:09', '2021-12-08 22:36:09'),
(805, 34, 'Harinakundu', '7310', 0, '2021-12-08 22:36:09', '2021-12-08 22:36:09'),
(806, 34, 'Jhenaidah Cadet College', '7301', 0, '2021-12-08 22:36:09', '2021-12-08 22:36:09'),
(807, 34, 'Jhenaidah Sadar', '7300', 0, '2021-12-08 22:36:09', '2021-12-08 22:36:09'),
(808, 34, 'Kotchandpur', '7330', 0, '2021-12-08 22:36:09', '2021-12-08 22:36:09'),
(809, 34, 'Maheshpur', '7340', 0, '2021-12-08 22:36:09', '2021-12-08 22:36:09'),
(810, 34, 'Hatbar Bazar', '7351', 0, '2021-12-08 22:36:09', '2021-12-08 22:36:09'),
(811, 34, 'Naldanga', '7350', 0, '2021-12-08 22:36:09', '2021-12-08 22:36:09'),
(812, 34, 'Kumiradaha', '7321', 0, '2021-12-08 22:36:09', '2021-12-08 22:36:09'),
(813, 34, 'Shailakupa', '7320', 0, '2021-12-08 22:36:09', '2021-12-08 22:36:09'),
(814, 35, 'Alaipur', '9240', 0, '2021-12-08 22:36:09', '2021-12-08 22:36:09'),
(815, 35, 'Belphulia', '9242', 0, '2021-12-08 22:36:09', '2021-12-08 22:36:09'),
(816, 35, 'Rupsha', '9241', 0, '2021-12-08 22:36:09', '2021-12-08 22:36:09'),
(817, 35, 'Batiaghat', '9260', 0, '2021-12-08 22:36:09', '2021-12-08 22:36:09'),
(818, 35, 'Surkalee', '9261', 0, '2021-12-08 22:36:09', '2021-12-08 22:36:09'),
(819, 35, 'Bajua', '9272', 0, '2021-12-08 22:36:09', '2021-12-08 22:36:09'),
(820, 35, 'Chalna Bazar', '9270', 0, '2021-12-08 22:36:09', '2021-12-08 22:36:09'),
(821, 35, 'Dakup', '9271', 0, '2021-12-08 22:36:09', '2021-12-08 22:36:09'),
(822, 35, 'Nalian', '9273', 0, '2021-12-08 22:36:09', '2021-12-08 22:36:09'),
(823, 35, 'Chandni Mahal', '9221', 0, '2021-12-08 22:36:10', '2021-12-08 22:36:10'),
(824, 35, 'Digalia', '9220', 0, '2021-12-08 22:36:10', '2021-12-08 22:36:10'),
(825, 35, 'Gazirhat', '9224', 0, '2021-12-08 22:36:10', '2021-12-08 22:36:10'),
(826, 35, 'Ghoshghati', '9223', 0, '2021-12-08 22:36:10', '2021-12-08 22:36:10'),
(827, 35, 'Senhati', '9222', 0, '2021-12-08 22:36:10', '2021-12-08 22:36:10'),
(828, 35, 'Atra Shilpa Area', '9207', 0, '2021-12-08 22:36:10', '2021-12-08 22:36:10'),
(829, 35, 'BIT Khulna', '9203', 0, '2021-12-08 22:36:10', '2021-12-08 22:36:10'),
(830, 35, 'Doulatpur', '9202', 0, '2021-12-08 22:36:10', '2021-12-08 22:36:10'),
(831, 35, 'Jahanabad Canttonmen', '9205', 0, '2021-12-08 22:36:10', '2021-12-08 22:36:10'),
(832, 35, 'Khula Sadar', '9100', 0, '2021-12-08 22:36:10', '2021-12-08 22:36:10'),
(833, 35, 'Khulna G.P.O', '9000', 0, '2021-12-08 22:36:10', '2021-12-08 22:36:10'),
(834, 35, 'Khulna Shipyard', '9201', 0, '2021-12-08 22:36:10', '2021-12-08 22:36:10'),
(835, 35, 'Khulna University', '9208', 0, '2021-12-08 22:36:10', '2021-12-08 22:36:10'),
(836, 35, 'Siramani', '9204', 0, '2021-12-08 22:36:10', '2021-12-08 22:36:10'),
(837, 35, 'Sonali Jute Mills', '9206', 0, '2021-12-08 22:36:10', '2021-12-08 22:36:10'),
(838, 35, 'Amadee', '9291', 0, '2021-12-08 22:36:10', '2021-12-08 22:36:10'),
(839, 35, 'Madinabad', '9290', 0, '2021-12-08 22:36:10', '2021-12-08 22:36:10'),
(840, 35, 'Chandkhali', '9284', 0, '2021-12-08 22:36:10', '2021-12-08 22:36:10'),
(841, 35, 'Garaikhali', '9285', 0, '2021-12-08 22:36:10', '2021-12-08 22:36:10'),
(842, 35, 'Godaipur', '9281', 0, '2021-12-08 22:36:10', '2021-12-08 22:36:10'),
(843, 35, 'Kapilmoni', '9282', 0, '2021-12-08 22:36:10', '2021-12-08 22:36:10'),
(844, 35, 'Katipara', '9283', 0, '2021-12-08 22:36:10', '2021-12-08 22:36:10'),
(845, 35, 'Paikgachha', '9280', 0, '2021-12-08 22:36:10', '2021-12-08 22:36:10'),
(846, 35, 'Phultala', '9210', 0, '2021-12-08 22:36:10', '2021-12-08 22:36:10'),
(847, 35, 'Chuknagar', '9252', 0, '2021-12-08 22:36:10', '2021-12-08 22:36:10'),
(848, 35, 'Ghonabanda', '9251', 0, '2021-12-08 22:36:10', '2021-12-08 22:36:10'),
(849, 35, 'Sajiara', '9250', 0, '2021-12-08 22:36:10', '2021-12-08 22:36:10'),
(850, 35, 'Shahapur', '9253', 0, '2021-12-08 22:36:10', '2021-12-08 22:36:10'),
(851, 35, 'Pak Barasat', '9231', 0, '2021-12-08 22:36:10', '2021-12-08 22:36:10'),
(852, 35, 'Terakhada', '9230', 0, '2021-12-08 22:36:10', '2021-12-08 22:36:10'),
(853, 36, 'Allardarga', '7042', 0, '2021-12-08 22:36:10', '2021-12-08 22:36:10'),
(854, 36, 'Bheramara', '7040', 0, '2021-12-08 22:36:10', '2021-12-08 22:36:10'),
(855, 36, 'Ganges Bheramara', '7041', 0, '2021-12-08 22:36:10', '2021-12-08 22:36:10'),
(856, 36, 'Janipur', '7020', 0, '2021-12-08 22:36:10', '2021-12-08 22:36:10'),
(857, 36, 'Khoksa', '7021', 0, '2021-12-08 22:36:10', '2021-12-08 22:36:10'),
(858, 36, 'Kumarkhali', '7010', 0, '2021-12-08 22:36:10', '2021-12-08 22:36:10'),
(859, 36, 'Panti', '7011', 0, '2021-12-08 22:36:10', '2021-12-08 22:36:10'),
(860, 36, 'Islami University', '7003', 0, '2021-12-08 22:36:10', '2021-12-08 22:36:10'),
(861, 36, 'Jagati', '7002', 0, '2021-12-08 22:36:10', '2021-12-08 22:36:10'),
(862, 36, 'Kushtia Mohini', '7001', 0, '2021-12-08 22:36:10', '2021-12-08 22:36:10'),
(863, 36, 'Kushtia Sadar', '7000', 0, '2021-12-08 22:36:10', '2021-12-08 22:36:10'),
(864, 36, 'Amla Sadarpur', '7032', 0, '2021-12-08 22:36:10', '2021-12-08 22:36:10'),
(865, 36, 'Mirpur', '7030', 0, '2021-12-08 22:36:10', '2021-12-08 22:36:10'),
(866, 36, 'Poradaha', '7031', 0, '2021-12-08 22:36:10', '2021-12-08 22:36:10'),
(867, 36, 'Khasmathurapur', '7052', 0, '2021-12-08 22:36:11', '2021-12-08 22:36:11'),
(868, 36, 'Rafayetpur', '7050', 0, '2021-12-08 22:36:11', '2021-12-08 22:36:11'),
(869, 36, 'Taragunia', '7051', 0, '2021-12-08 22:36:11', '2021-12-08 22:36:11'),
(870, 37, 'Arpara', '7620', 0, '2021-12-08 22:36:11', '2021-12-08 22:36:11'),
(871, 37, 'Magura Sadar', '7600', 0, '2021-12-08 22:36:11', '2021-12-08 22:36:11'),
(872, 37, 'Binodpur', '7631', 0, '2021-12-08 22:36:11', '2021-12-08 22:36:11'),
(873, 37, 'Mohammadpur', '7630', 0, '2021-12-08 22:36:11', '2021-12-08 22:36:11'),
(874, 37, 'Nahata', '7632', 0, '2021-12-08 22:36:11', '2021-12-08 22:36:11'),
(875, 37, 'Langalbadh', '7611', 0, '2021-12-08 22:36:11', '2021-12-08 22:36:11'),
(876, 37, 'Nachol', '7612', 0, '2021-12-08 22:36:11', '2021-12-08 22:36:11'),
(877, 37, 'Shripur', '7610', 0, '2021-12-08 22:36:11', '2021-12-08 22:36:11'),
(878, 38, 'Gangni', '7110', 0, '2021-12-08 22:36:12', '2021-12-08 22:36:12'),
(879, 38, 'Amjhupi', '7101', 0, '2021-12-08 22:36:12', '2021-12-08 22:36:12'),
(880, 38, 'Amjhupi', '7152', 0, '2021-12-08 22:36:12', '2021-12-08 22:36:12'),
(881, 38, 'Meherpur Sadar', '7100', 0, '2021-12-08 22:36:12', '2021-12-08 22:36:12'),
(882, 38, 'Mujib Nagar Complex', '7102', 0, '2021-12-08 22:36:12', '2021-12-08 22:36:12'),
(883, 39, 'Kalia', '7520', 0, '2021-12-08 22:36:12', '2021-12-08 22:36:12'),
(884, 39, 'Baradia', '7514', 0, '2021-12-08 22:36:12', '2021-12-08 22:36:12'),
(885, 39, 'Itna', '7512', 0, '2021-12-08 22:36:12', '2021-12-08 22:36:12'),
(886, 39, 'Laxmipasha', '7510', 0, '2021-12-08 22:36:12', '2021-12-08 22:36:12'),
(887, 39, 'Lohagora', '7511', 0, '2021-12-08 22:36:12', '2021-12-08 22:36:12'),
(888, 39, 'Naldi', '7513', 0, '2021-12-08 22:36:12', '2021-12-08 22:36:12'),
(889, 39, 'Mohajan', '7521', 0, '2021-12-08 22:36:12', '2021-12-08 22:36:12'),
(890, 39, 'Narail Sadar', '7500', 0, '2021-12-08 22:36:12', '2021-12-08 22:36:12'),
(891, 39, 'Ratanganj', '7501', 0, '2021-12-08 22:36:12', '2021-12-08 22:36:12'),
(892, 40, 'Ashashuni', '9460', 0, '2021-12-08 22:36:12', '2021-12-08 22:36:12'),
(893, 40, 'Baradal', '9461', 0, '2021-12-08 22:36:12', '2021-12-08 22:36:12'),
(894, 40, 'Debbhata', '9430', 0, '2021-12-08 22:36:12', '2021-12-08 22:36:12'),
(895, 40, 'Gurugram', '9431', 0, '2021-12-08 22:36:12', '2021-12-08 22:36:12'),
(896, 40, 'Chandanpur', '9415', 0, '2021-12-08 22:36:12', '2021-12-08 22:36:12'),
(897, 40, 'Hamidpur', '9413', 0, '2021-12-08 22:36:12', '2021-12-08 22:36:12'),
(898, 40, 'Jhaudanga', '9412', 0, '2021-12-08 22:36:12', '2021-12-08 22:36:12'),
(899, 40, 'kalaroa', '9410', 0, '2021-12-08 22:36:12', '2021-12-08 22:36:12'),
(900, 40, 'Khordo', '9414', 0, '2021-12-08 22:36:12', '2021-12-08 22:36:12'),
(901, 40, 'Murarikati', '9411', 0, '2021-12-08 22:36:12', '2021-12-08 22:36:12'),
(902, 40, 'Kaliganj UPO', '9440', 0, '2021-12-08 22:36:12', '2021-12-08 22:36:12'),
(903, 40, 'Nalta Mubaroknagar', '9441', 0, '2021-12-08 22:36:12', '2021-12-08 22:36:12'),
(904, 40, 'Ratanpur', '9442', 0, '2021-12-08 22:36:12', '2021-12-08 22:36:12'),
(905, 40, 'Buri Goalini', '9453', 0, '2021-12-08 22:36:12', '2021-12-08 22:36:12'),
(906, 40, 'Gabura', '9454', 0, '2021-12-08 22:36:12', '2021-12-08 22:36:12'),
(907, 40, 'Habinagar', '9455', 0, '2021-12-08 22:36:12', '2021-12-08 22:36:12'),
(908, 40, 'Nakipur', '9450', 0, '2021-12-08 22:36:12', '2021-12-08 22:36:12'),
(909, 40, 'Naobeki', '9452', 0, '2021-12-08 22:36:12', '2021-12-08 22:36:12'),
(910, 40, 'Noornagar', '9451', 0, '2021-12-08 22:36:12', '2021-12-08 22:36:12'),
(911, 40, 'Budhhat', '9403', 0, '2021-12-08 22:36:12', '2021-12-08 22:36:12'),
(912, 40, 'Gunakar kati', '9402', 0, '2021-12-08 22:36:12', '2021-12-08 22:36:12'),
(913, 40, 'Satkhira Islamia Acc', '9401', 0, '2021-12-08 22:36:12', '2021-12-08 22:36:12'),
(914, 40, 'Satkhira Sadar', '9400', 0, '2021-12-08 22:36:13', '2021-12-08 22:36:13'),
(915, 40, 'Patkelghata', '9421', 0, '2021-12-08 22:36:13', '2021-12-08 22:36:13'),
(916, 40, 'Taala', '9420', 0, '2021-12-08 22:36:13', '2021-12-08 22:36:13'),
(917, 41, 'Dewangonj', '2030', 0, '2021-12-08 22:36:13', '2021-12-08 22:36:13'),
(918, 41, 'Dewangonj S. Mills', '2031', 0, '2021-12-08 22:36:13', '2021-12-08 22:36:13'),
(919, 41, 'Durmoot', '2021', 0, '2021-12-08 22:36:13', '2021-12-08 22:36:13'),
(920, 41, 'Gilabari', '2022', 0, '2021-12-08 22:36:13', '2021-12-08 22:36:13'),
(921, 41, 'Islampur', '2020', 0, '2021-12-08 22:36:13', '2021-12-08 22:36:13'),
(922, 41, 'Jamalpur', '2000', 0, '2021-12-08 22:36:13', '2021-12-08 22:36:13'),
(923, 41, 'Nandina', '2001', 0, '2021-12-08 22:36:13', '2021-12-08 22:36:13'),
(924, 41, 'Narundi', '2002', 0, '2021-12-08 22:36:13', '2021-12-08 22:36:13'),
(925, 41, 'Jamalpur', '2011', 0, '2021-12-08 22:36:13', '2021-12-08 22:36:13'),
(926, 41, 'Mahmoodpur', '2013', 0, '2021-12-08 22:36:13', '2021-12-08 22:36:13'),
(927, 41, 'Malancha', '2012', 0, '2021-12-08 22:36:13', '2021-12-08 22:36:13'),
(928, 41, 'Malandah', '2010', 0, '2021-12-08 22:36:13', '2021-12-08 22:36:13'),
(929, 41, 'Balijhuri', '2041', 0, '2021-12-08 22:36:13', '2021-12-08 22:36:13'),
(930, 41, 'Mathargonj', '2040', 0, '2021-12-08 22:36:13', '2021-12-08 22:36:13'),
(931, 41, 'Bausee', '2052', 0, '2021-12-08 22:36:13', '2021-12-08 22:36:13'),
(932, 41, 'Gunerbari', '2051', 0, '2021-12-08 22:36:13', '2021-12-08 22:36:13'),
(933, 41, 'Jagannath Ghat', '2053', 0, '2021-12-08 22:36:13', '2021-12-08 22:36:13'),
(934, 41, 'Jamuna Sar Karkhana', '2055', 0, '2021-12-08 22:36:13', '2021-12-08 22:36:13'),
(935, 41, 'Pingna', '2054', 0, '2021-12-08 22:36:13', '2021-12-08 22:36:13'),
(936, 41, 'Shorishabari', '2050', 0, '2021-12-08 22:36:13', '2021-12-08 22:36:13'),
(937, 42, 'Bhaluka', '2240', 0, '2021-12-08 22:36:14', '2021-12-08 22:36:14'),
(938, 42, 'Fulbaria', '2216', 0, '2021-12-08 22:36:14', '2021-12-08 22:36:14'),
(939, 42, 'Duttarbazar', '2234', 0, '2021-12-08 22:36:14', '2021-12-08 22:36:14'),
(940, 42, 'Gaforgaon', '2230', 0, '2021-12-08 22:36:14', '2021-12-08 22:36:14'),
(941, 42, 'Kandipara', '2233', 0, '2021-12-08 22:36:14', '2021-12-08 22:36:14'),
(942, 42, 'Shibganj', '2231', 0, '2021-12-08 22:36:14', '2021-12-08 22:36:14'),
(943, 42, 'Usti', '2232', 0, '2021-12-08 22:36:14', '2021-12-08 22:36:14'),
(944, 42, 'Gouripur', '2270', 0, '2021-12-08 22:36:14', '2021-12-08 22:36:14'),
(945, 42, 'Ramgopalpur', '2271', 0, '2021-12-08 22:36:14', '2021-12-08 22:36:14'),
(946, 42, 'Dhara', '2261', 0, '2021-12-08 22:36:14', '2021-12-08 22:36:14'),
(947, 42, 'Haluaghat', '2260', 0, '2021-12-08 22:36:14', '2021-12-08 22:36:14'),
(948, 42, 'Munshirhat', '2262', 0, '2021-12-08 22:36:14', '2021-12-08 22:36:14'),
(949, 42, 'Atharabari', '2282', 0, '2021-12-08 22:36:14', '2021-12-08 22:36:14'),
(950, 42, 'Isshwargonj', '2280', 0, '2021-12-08 22:36:14', '2021-12-08 22:36:14'),
(951, 42, 'Sohagi', '2281', 0, '2021-12-08 22:36:14', '2021-12-08 22:36:14'),
(952, 42, 'Muktagachha', '2210', 0, '2021-12-08 22:36:15', '2021-12-08 22:36:15'),
(953, 42, 'Agriculture University', '2202', 0, '2021-12-08 22:36:15', '2021-12-08 22:36:15'),
(954, 42, 'Biddyaganj', '2204', 0, '2021-12-08 22:36:15', '2021-12-08 22:36:15'),
(955, 42, 'Kawatkhali', '2201', 0, '2021-12-08 22:36:15', '2021-12-08 22:36:15'),
(956, 42, 'Mymensingh Sadar', '2200', 0, '2021-12-08 22:36:15', '2021-12-08 22:36:15'),
(957, 42, 'Pearpur', '2205', 0, '2021-12-08 22:36:15', '2021-12-08 22:36:15'),
(958, 42, 'Shombhuganj', '2203', 0, '2021-12-08 22:36:15', '2021-12-08 22:36:15'),
(959, 42, 'Gangail', '2291', 0, '2021-12-08 22:36:15', '2021-12-08 22:36:15'),
(960, 42, 'Nandail', '2290', 0, '2021-12-08 22:36:15', '2021-12-08 22:36:15'),
(961, 42, 'Beltia', '2251', 0, '2021-12-08 22:36:15', '2021-12-08 22:36:15'),
(962, 42, 'Phulpur', '2250', 0, '2021-12-08 22:36:15', '2021-12-08 22:36:15'),
(963, 42, 'Tarakanda', '2252', 0, '2021-12-08 22:36:15', '2021-12-08 22:36:15'),
(964, 42, 'Ahmadbad', '2221', 0, '2021-12-08 22:36:15', '2021-12-08 22:36:15'),
(965, 42, 'Dhala', '2223', 0, '2021-12-08 22:36:15', '2021-12-08 22:36:15'),
(966, 42, 'Ram Amritaganj', '2222', 0, '2021-12-08 22:36:15', '2021-12-08 22:36:15'),
(967, 42, 'Trishal', '2220', 0, '2021-12-08 22:36:15', '2021-12-08 22:36:15'),
(968, 43, 'Susnng Durgapur', '2420', 0, '2021-12-08 22:36:15', '2021-12-08 22:36:15'),
(969, 43, 'Atpara', '2470', 0, '2021-12-08 22:36:15', '2021-12-08 22:36:15'),
(970, 43, 'Barhatta', '2440', 0, '2021-12-08 22:36:15', '2021-12-08 22:36:15'),
(971, 43, 'Dharampasha', '2450', 0, '2021-12-08 22:36:15', '2021-12-08 22:36:15'),
(972, 43, 'Dhobaura', '2416', 0, '2021-12-08 22:36:15', '2021-12-08 22:36:15'),
(973, 43, 'Sakoai', '2417', 0, '2021-12-08 22:36:15', '2021-12-08 22:36:15'),
(974, 43, 'Kalmakanda', '2430', 0, '2021-12-08 22:36:15', '2021-12-08 22:36:15'),
(975, 43, 'Kendua', '2480', 0, '2021-12-08 22:36:15', '2021-12-08 22:36:15'),
(976, 43, 'Khaliajhri', '2460', 0, '2021-12-08 22:36:15', '2021-12-08 22:36:15'),
(977, 43, 'Shaldigha', '2462', 0, '2021-12-08 22:36:16', '2021-12-08 22:36:16'),
(978, 43, 'Madan', '2490', 0, '2021-12-08 22:36:16', '2021-12-08 22:36:16'),
(979, 43, 'Moddoynagar', '2456', 0, '2021-12-08 22:36:16', '2021-12-08 22:36:16'),
(980, 43, 'Mohanganj', '2446', 0, '2021-12-08 22:36:16', '2021-12-08 22:36:16'),
(981, 43, 'Baikherhati', '2401', 0, '2021-12-08 22:36:16', '2021-12-08 22:36:16'),
(982, 43, 'Netrokona Sadar', '2400', 0, '2021-12-08 22:36:16', '2021-12-08 22:36:16'),
(983, 43, 'Jaria Jhanjhail', '2412', 0, '2021-12-08 22:36:16', '2021-12-08 22:36:16'),
(984, 43, 'Purbadhola', '2410', 0, '2021-12-08 22:36:16', '2021-12-08 22:36:16'),
(985, 43, 'Shamgonj', '2411', 0, '2021-12-08 22:36:16', '2021-12-08 22:36:16'),
(986, 43, 'Susnng Durgapur', '2420', 0, '2021-12-08 22:36:16', '2021-12-08 22:36:16'),
(987, 43, 'Atpara', '2470', 0, '2021-12-08 22:36:16', '2021-12-08 22:36:16'),
(988, 43, 'Barhatta', '2440', 0, '2021-12-08 22:36:16', '2021-12-08 22:36:16'),
(989, 43, 'Dharampasha', '2450', 0, '2021-12-08 22:36:16', '2021-12-08 22:36:16'),
(990, 43, 'Dhobaura', '2416', 0, '2021-12-08 22:36:16', '2021-12-08 22:36:16'),
(991, 43, 'Sakoai', '2417', 0, '2021-12-08 22:36:16', '2021-12-08 22:36:16'),
(992, 43, 'Kalmakanda', '2430', 0, '2021-12-08 22:36:16', '2021-12-08 22:36:16'),
(993, 43, 'Kendua', '2480', 0, '2021-12-08 22:36:17', '2021-12-08 22:36:17'),
(994, 43, 'Khaliajhri', '2460', 0, '2021-12-08 22:36:17', '2021-12-08 22:36:17'),
(995, 43, 'Shaldigha', '2462', 0, '2021-12-08 22:36:17', '2021-12-08 22:36:17'),
(996, 43, 'Madan', '2490', 0, '2021-12-08 22:36:17', '2021-12-08 22:36:17'),
(997, 43, 'Moddoynagar', '2456', 0, '2021-12-08 22:36:17', '2021-12-08 22:36:17'),
(998, 43, 'Mohanganj', '2446', 0, '2021-12-08 22:36:17', '2021-12-08 22:36:17'),
(999, 43, 'Baikherhati', '2401', 0, '2021-12-08 22:36:17', '2021-12-08 22:36:17'),
(1000, 43, 'Netrokona Sadar', '2400', 0, '2021-12-08 22:36:17', '2021-12-08 22:36:17'),
(1001, 44, 'Bakshigonj', '2140', 0, '2021-12-08 22:36:17', '2021-12-08 22:36:17'),
(1002, 44, 'Jhinaigati', '2120', 0, '2021-12-08 22:36:17', '2021-12-08 22:36:17'),
(1003, 44, 'Gonopaddi', '2151', 0, '2021-12-08 22:36:17', '2021-12-08 22:36:17'),
(1004, 44, 'Nakla', '2150', 0, '2021-12-08 22:36:17', '2021-12-08 22:36:17'),
(1005, 44, 'Hatibandha', '2111', 0, '2021-12-08 22:36:17', '2021-12-08 22:36:17'),
(1006, 44, 'Nalitabari', '2110', 0, '2021-12-08 22:36:17', '2021-12-08 22:36:17'),
(1007, 44, 'Sherpur Shadar', '2100', 0, '2021-12-08 22:36:17', '2021-12-08 22:36:17'),
(1008, 44, 'Shribardi', '2130', 0, '2021-12-08 22:36:17', '2021-12-08 22:36:17'),
(1009, 45, 'Adamdighi', '5890', 0, '2021-12-08 22:36:17', '2021-12-08 22:36:17'),
(1010, 45, 'Nasharatpur', '5892', 0, '2021-12-08 22:36:17', '2021-12-08 22:36:17'),
(1011, 45, 'Santahar', '5891', 0, '2021-12-08 22:36:17', '2021-12-08 22:36:17'),
(1012, 45, 'Bogra Canttonment', '5801', 0, '2021-12-08 22:36:17', '2021-12-08 22:36:17'),
(1013, 45, 'Bogra Sadar', '5800', 0, '2021-12-08 22:36:17', '2021-12-08 22:36:17'),
(1014, 45, 'Dhunat', '5850', 0, '2021-12-08 22:36:17', '2021-12-08 22:36:17'),
(1015, 45, 'Gosaibari', '5851', 0, '2021-12-08 22:36:17', '2021-12-08 22:36:17'),
(1016, 45, 'Dupchachia', '5880', 0, '2021-12-08 22:36:17', '2021-12-08 22:36:17'),
(1017, 45, 'Talora', '5881', 0, '2021-12-08 22:36:17', '2021-12-08 22:36:17'),
(1018, 45, 'Gabtoli', '5820', 0, '2021-12-08 22:36:17', '2021-12-08 22:36:17'),
(1019, 45, 'Sukhanpukur', '5821', 0, '2021-12-08 22:36:17', '2021-12-08 22:36:17'),
(1020, 45, 'Kahalu', '5870', 0, '2021-12-08 22:36:17', '2021-12-08 22:36:17'),
(1021, 45, 'Nandigram', '5860', 0, '2021-12-08 22:36:17', '2021-12-08 22:36:17'),
(1022, 45, 'Chandan Baisha', '5831', 0, '2021-12-08 22:36:17', '2021-12-08 22:36:17'),
(1023, 45, 'Sariakandi', '5830', 0, '2021-12-08 22:36:17', '2021-12-08 22:36:17'),
(1024, 45, 'Chandaikona', '5841', 0, '2021-12-08 22:36:17', '2021-12-08 22:36:17'),
(1025, 45, 'Palli Unnyan Accadem', '5842', 0, '2021-12-08 22:36:17', '2021-12-08 22:36:17'),
(1026, 45, 'Sherpur', '5840', 0, '2021-12-08 22:36:17', '2021-12-08 22:36:17'),
(1027, 45, 'Shibganj', '5810', 0, '2021-12-08 22:36:17', '2021-12-08 22:36:17'),
(1028, 45, 'Sonatola', '5826', 0, '2021-12-08 22:36:17', '2021-12-08 22:36:17'),
(1029, 46, 'Akklepur', '5940', 0, '2021-12-08 22:36:18', '2021-12-08 22:36:18'),
(1030, 46, 'jamalganj', '5941', 0, '2021-12-08 22:36:18', '2021-12-08 22:36:18'),
(1031, 46, 'Tilakpur', '5942', 0, '2021-12-08 22:36:18', '2021-12-08 22:36:18'),
(1032, 46, 'Joypurhat Sadar', '5900', 0, '2021-12-08 22:36:18', '2021-12-08 22:36:18'),
(1033, 46, 'kalai', '5930', 0, '2021-12-08 22:36:18', '2021-12-08 22:36:18'),
(1034, 46, 'Khetlal', '5920', 0, '2021-12-08 22:36:18', '2021-12-08 22:36:18'),
(1035, 46, 'Panchbibi', '5910', 0, '2021-12-08 22:36:18', '2021-12-08 22:36:18'),
(1036, 47, 'Ahsanganj', '6596', 0, '2021-12-08 22:36:19', '2021-12-08 22:36:19'),
(1037, 47, 'Bandai', '6597', 0, '2021-12-08 22:36:19', '2021-12-08 22:36:19'),
(1038, 47, 'Badalgachhi', '6570', 0, '2021-12-08 22:36:19', '2021-12-08 22:36:19'),
(1039, 47, 'Dhamuirhat', '6580', 0, '2021-12-08 22:36:19', '2021-12-08 22:36:19'),
(1040, 47, 'Mahadebpur', '6530', 0, '2021-12-08 22:36:19', '2021-12-08 22:36:19'),
(1041, 47, 'Naogaon Sadar', '6500', 0, '2021-12-08 22:36:19', '2021-12-08 22:36:19'),
(1042, 47, 'Niamatpur', '6520', 0, '2021-12-08 22:36:19', '2021-12-08 22:36:19'),
(1043, 47, 'Nitpur', '6550', 0, '2021-12-08 22:36:19', '2021-12-08 22:36:19'),
(1044, 47, 'Panguria', '6552', 0, '2021-12-08 22:36:19', '2021-12-08 22:36:19'),
(1045, 47, 'Porsa', '6551', 0, '2021-12-08 22:36:19', '2021-12-08 22:36:19'),
(1046, 47, 'Patnitala', '6540', 0, '2021-12-08 22:36:19', '2021-12-08 22:36:19'),
(1047, 47, 'Balihar', '6512', 0, '2021-12-08 22:36:19', '2021-12-08 22:36:19'),
(1048, 47, 'Manda', '6511', 0, '2021-12-08 22:36:19', '2021-12-08 22:36:19'),
(1049, 47, 'Prasadpur', '6510', 0, '2021-12-08 22:36:19', '2021-12-08 22:36:19'),
(1050, 47, 'Kashimpur', '6591', 0, '2021-12-08 22:36:19', '2021-12-08 22:36:19'),
(1051, 47, 'Raninagar', '6590', 0, '2021-12-08 22:36:19', '2021-12-08 22:36:19'),
(1052, 47, 'Moduhil', '6561', 0, '2021-12-08 22:36:19', '2021-12-08 22:36:19'),
(1053, 47, 'Sapahar', '6560', 0, '2021-12-08 22:36:19', '2021-12-08 22:36:19'),
(1054, 48, 'Abdulpur', '6422', 0, '2021-12-08 22:36:19', '2021-12-08 22:36:19'),
(1055, 48, 'Gopalpur U.P.O', '6420', 0, '2021-12-08 22:36:19', '2021-12-08 22:36:19'),
(1056, 48, 'Lalpur S.O', '6421', 0, '2021-12-08 22:36:19', '2021-12-08 22:36:19'),
(1057, 48, 'Baraigram', '6432', 0, '2021-12-08 22:36:19', '2021-12-08 22:36:19'),
(1058, 48, 'Dayarampur', '6431', 0, '2021-12-08 22:36:19', '2021-12-08 22:36:19'),
(1059, 48, 'Harua', '6430', 0, '2021-12-08 22:36:19', '2021-12-08 22:36:19'),
(1060, 48, 'Hatgurudaspur', '6440', 0, '2021-12-08 22:36:19', '2021-12-08 22:36:19'),
(1061, 48, 'Laxman', '6410', 0, '2021-12-08 22:36:19', '2021-12-08 22:36:19'),
(1062, 48, 'Baiddyabal Gharia', '6402', 0, '2021-12-08 22:36:19', '2021-12-08 22:36:19'),
(1063, 48, 'Digapatia', '6401', 0, '2021-12-08 22:36:19', '2021-12-08 22:36:19'),
(1064, 48, 'Madhnagar', '6403', 0, '2021-12-08 22:36:19', '2021-12-08 22:36:19'),
(1065, 48, 'Natore Sadar', '6400', 0, '2021-12-08 22:36:19', '2021-12-08 22:36:19'),
(1066, 48, 'Singra', '6450', 0, '2021-12-08 22:36:19', '2021-12-08 22:36:19'),
(1067, 49, 'Bholahat', '6330', 0, '2021-12-08 22:36:20', '2021-12-08 22:36:20'),
(1068, 49, 'Amnura', '6303', 0, '2021-12-08 22:36:20', '2021-12-08 22:36:20'),
(1069, 49, 'Chapinawbganj Sadar', '6300', 0, '2021-12-08 22:36:20', '2021-12-08 22:36:20'),
(1070, 49, 'Rajarampur', '6301', 0, '2021-12-08 22:36:20', '2021-12-08 22:36:20'),
(1071, 49, 'Ramchandrapur', '6302', 0, '2021-12-08 22:36:20', '2021-12-08 22:36:20'),
(1072, 49, 'Mandumala', '6311', 0, '2021-12-08 22:36:20', '2021-12-08 22:36:20'),
(1073, 49, 'Nachol', '6310', 0, '2021-12-08 22:36:20', '2021-12-08 22:36:20'),
(1074, 49, 'Gomashtapur', '6321', 0, '2021-12-08 22:36:20', '2021-12-08 22:36:20'),
(1075, 49, 'Rohanpur', '6320', 0, '2021-12-08 22:36:20', '2021-12-08 22:36:20'),
(1076, 49, 'Kansart', '6341', 0, '2021-12-08 22:36:20', '2021-12-08 22:36:20'),
(1077, 49, 'Manaksha', '6342', 0, '2021-12-08 22:36:20', '2021-12-08 22:36:20'),
(1078, 49, 'Shibganj U.P.O', '6340', 0, '2021-12-08 22:36:20', '2021-12-08 22:36:20'),
(1079, 50, 'Banwarinagar', '6650', 0, '2021-12-08 22:36:20', '2021-12-08 22:36:20'),
(1080, 50, 'Bera', '6680', 0, '2021-12-08 22:36:20', '2021-12-08 22:36:20'),
(1081, 50, 'Kashinathpur', '6682', 0, '2021-12-08 22:36:21', '2021-12-08 22:36:21'),
(1082, 50, 'Nakalia', '6681', 0, '2021-12-08 22:36:21', '2021-12-08 22:36:21'),
(1083, 50, 'Puran Bharenga', '6683', 0, '2021-12-08 22:36:21', '2021-12-08 22:36:21'),
(1084, 50, 'Bhangura', '6640', 0, '2021-12-08 22:36:21', '2021-12-08 22:36:21'),
(1085, 50, 'Chatmohar', '6630', 0, '2021-12-08 22:36:21', '2021-12-08 22:36:21'),
(1086, 50, 'Debottar', '6610', 0, '2021-12-08 22:36:21', '2021-12-08 22:36:21'),
(1087, 50, 'Dhapari', '6621', 0, '2021-12-08 22:36:21', '2021-12-08 22:36:21'),
(1088, 50, 'Ishwardi', '6620', 0, '2021-12-08 22:36:21', '2021-12-08 22:36:21'),
(1089, 50, 'Pakshi', '6622', 0, '2021-12-08 22:36:21', '2021-12-08 22:36:21'),
(1090, 50, 'Rajapur', '6623', 0, '2021-12-08 22:36:21', '2021-12-08 22:36:21'),
(1091, 50, 'Hamayetpur', '6602', 0, '2021-12-08 22:36:21', '2021-12-08 22:36:21'),
(1092, 50, 'Kaliko Cotton Mills', '6601', 0, '2021-12-08 22:36:21', '2021-12-08 22:36:21'),
(1093, 50, 'Pabna Sadar', '6600', 0, '2021-12-08 22:36:21', '2021-12-08 22:36:21'),
(1094, 50, 'Sathia', '6670', 0, '2021-12-08 22:36:21', '2021-12-08 22:36:21'),
(1095, 50, 'Sagarkandi', '6661', 0, '2021-12-08 22:36:21', '2021-12-08 22:36:21'),
(1096, 50, 'Sujanagar', '6660', 0, '2021-12-08 22:36:21', '2021-12-08 22:36:21'),
(1097, 51, 'Arani', '6281', 0, '2021-12-08 22:36:22', '2021-12-08 22:36:22'),
(1098, 51, 'Bagha', '6280', 0, '2021-12-08 22:36:22', '2021-12-08 22:36:22'),
(1099, 51, 'Bhabaniganj', '6250', 0, '2021-12-08 22:36:22', '2021-12-08 22:36:22'),
(1100, 51, 'Taharpur', '6251', 0, '2021-12-08 22:36:22', '2021-12-08 22:36:22'),
(1101, 51, 'Charghat', '6270', 0, '2021-12-08 22:36:22', '2021-12-08 22:36:22'),
(1102, 51, 'Sarda', '6271', 0, '2021-12-08 22:36:22', '2021-12-08 22:36:22'),
(1103, 51, 'Durgapur', '6240', 0, '2021-12-08 22:36:22', '2021-12-08 22:36:22'),
(1104, 51, 'Godagari', '6290', 0, '2021-12-08 22:36:22', '2021-12-08 22:36:22'),
(1105, 51, 'Premtoli', '6291', 0, '2021-12-08 22:36:22', '2021-12-08 22:36:22'),
(1106, 51, 'Khodmohanpur', '6220', 0, '2021-12-08 22:36:22', '2021-12-08 22:36:22'),
(1107, 51, 'Lalitganj', '6210', 0, '2021-12-08 22:36:22', '2021-12-08 22:36:22'),
(1108, 51, 'Rajshahi Sugar Mills', '6211', 0, '2021-12-08 22:36:22', '2021-12-08 22:36:22'),
(1109, 51, 'Shyampur', '6212', 0, '2021-12-08 22:36:22', '2021-12-08 22:36:22'),
(1110, 51, 'Putia', '6260', 0, '2021-12-08 22:36:22', '2021-12-08 22:36:22'),
(1111, 51, 'Binodpur Bazar', '6206', 0, '2021-12-08 22:36:22', '2021-12-08 22:36:22'),
(1112, 51, 'Ghuramara', '6100', 0, '2021-12-08 22:36:22', '2021-12-08 22:36:22'),
(1113, 51, 'Kazla', '6204', 0, '2021-12-08 22:36:22', '2021-12-08 22:36:22'),
(1114, 51, 'Rajshahi Canttonment', '6202', 0, '2021-12-08 22:36:22', '2021-12-08 22:36:22'),
(1115, 51, 'Rajshahi Court', '6201', 0, '2021-12-08 22:36:22', '2021-12-08 22:36:22'),
(1116, 51, 'Rajshahi Sadar', '6000', 0, '2021-12-08 22:36:22', '2021-12-08 22:36:22'),
(1117, 51, 'Rajshahi University', '6205', 0, '2021-12-08 22:36:22', '2021-12-08 22:36:22'),
(1118, 51, 'Sapura', '6203', 0, '2021-12-08 22:36:22', '2021-12-08 22:36:22'),
(1119, 51, 'Tanor', '6230', 0, '2021-12-08 22:36:22', '2021-12-08 22:36:22'),
(1120, 52, 'Baiddya Jam Toil', '6730', 0, '2021-12-08 22:36:22', '2021-12-08 22:36:22'),
(1121, 52, 'Belkuchi', '6740', 0, '2021-12-08 22:36:22', '2021-12-08 22:36:22'),
(1122, 52, 'Enayetpur', '6751', 0, '2021-12-08 22:36:22', '2021-12-08 22:36:22'),
(1123, 52, 'Rajapur', '6742', 0, '2021-12-08 22:36:22', '2021-12-08 22:36:22'),
(1124, 52, 'Sohagpur', '6741', 0, '2021-12-08 22:36:22', '2021-12-08 22:36:22'),
(1125, 52, 'Sthal', '6752', 0, '2021-12-08 22:36:22', '2021-12-08 22:36:22'),
(1126, 52, 'Dhangora', '6720', 0, '2021-12-08 22:36:22', '2021-12-08 22:36:22'),
(1127, 52, 'Malonga', '6721', 0, '2021-12-08 22:36:22', '2021-12-08 22:36:22'),
(1128, 52, 'Gandail', '6712', 0, '2021-12-08 22:36:22', '2021-12-08 22:36:22'),
(1129, 52, 'Kazipur', '6710', 0, '2021-12-08 22:36:22', '2021-12-08 22:36:22'),
(1130, 52, 'Shuvgachha', '6711', 0, '2021-12-08 22:36:22', '2021-12-08 22:36:22'),
(1131, 52, 'Jamirta', '6772', 0, '2021-12-08 22:36:22', '2021-12-08 22:36:22'),
(1132, 52, 'Kaijuri', '6773', 0, '2021-12-08 22:36:22', '2021-12-08 22:36:22'),
(1133, 52, 'Porjana', '6771', 0, '2021-12-08 22:36:22', '2021-12-08 22:36:22'),
(1134, 52, 'Shahjadpur', '6770', 0, '2021-12-08 22:36:22', '2021-12-08 22:36:22'),
(1135, 52, 'Raipur', '6701', 0, '2021-12-08 22:36:22', '2021-12-08 22:36:22'),
(1136, 52, 'Rashidabad', '6702', 0, '2021-12-08 22:36:22', '2021-12-08 22:36:22'),
(1137, 52, 'Sirajganj Sadar', '6700', 0, '2021-12-08 22:36:22', '2021-12-08 22:36:22'),
(1138, 52, 'Tarash', '6780', 0, '2021-12-08 22:36:22', '2021-12-08 22:36:22'),
(1139, 52, 'Lahiri Mohanpur', '6762', 0, '2021-12-08 22:36:22', '2021-12-08 22:36:22'),
(1140, 52, 'Salap', '6763', 0, '2021-12-08 22:36:22', '2021-12-08 22:36:22'),
(1141, 52, 'Ullapara', '6760', 0, '2021-12-08 22:36:22', '2021-12-08 22:36:22'),
(1142, 52, 'Ullapara R.S', '6761', 0, '2021-12-08 22:36:22', '2021-12-08 22:36:22'),
(1143, 53, 'Bangla Hili', '5270', 0, '2021-12-08 22:36:24', '2021-12-08 22:36:24'),
(1144, 53, 'Biral', '5210', 0, '2021-12-08 22:36:24', '2021-12-08 22:36:24'),
(1145, 53, 'Birampur', '5266', 0, '2021-12-08 22:36:24', '2021-12-08 22:36:24'),
(1146, 53, 'Birganj', '5220', 0, '2021-12-08 22:36:24', '2021-12-08 22:36:24'),
(1147, 53, 'Chrirbandar', '5240', 0, '2021-12-08 22:36:24', '2021-12-08 22:36:24'),
(1148, 53, 'Ranirbandar', '5241', 0, '2021-12-08 22:36:24', '2021-12-08 22:36:24'),
(1149, 53, 'Dinajpur Rajbari', '5201', 0, '2021-12-08 22:36:24', '2021-12-08 22:36:24'),
(1150, 53, 'Dinajpur Sadar', '5200', 0, '2021-12-08 22:36:24', '2021-12-08 22:36:24'),
(1151, 53, 'Khansama', '5230', 0, '2021-12-08 22:36:24', '2021-12-08 22:36:24'),
(1152, 53, 'Pakarhat', '5231', 0, '2021-12-08 22:36:24', '2021-12-08 22:36:24'),
(1153, 53, 'Maharajganj', '5226', 0, '2021-12-08 22:36:24', '2021-12-08 22:36:24'),
(1154, 53, 'Daudpur', '5281', 0, '2021-12-08 22:36:24', '2021-12-08 22:36:24'),
(1155, 53, 'Gopalpur', '5282', 0, '2021-12-08 22:36:24', '2021-12-08 22:36:24'),
(1156, 53, 'Nababganj', '5280', 0, '2021-12-08 22:36:24', '2021-12-08 22:36:24'),
(1157, 53, 'Ghoraghat', '5291', 0, '2021-12-08 22:36:24', '2021-12-08 22:36:24'),
(1158, 53, 'Osmanpur', '5290', 0, '2021-12-08 22:36:24', '2021-12-08 22:36:24'),
(1159, 53, 'Parbatipur', '5250', 0, '2021-12-08 22:36:24', '2021-12-08 22:36:24'),
(1160, 53, 'Phulbari', '5260', 0, '2021-12-08 22:36:24', '2021-12-08 22:36:24'),
(1161, 53, 'Setabganj', '5216', 0, '2021-12-08 22:36:24', '2021-12-08 22:36:24'),
(1162, 54, 'Bonarpara', '5750', 0, '2021-12-08 22:36:24', '2021-12-08 22:36:24'),
(1163, 54, 'saghata', '5751', 0, '2021-12-08 22:36:24', '2021-12-08 22:36:24'),
(1164, 54, 'Gaibandha Sadar', '5700', 0, '2021-12-08 22:36:24', '2021-12-08 22:36:24'),
(1165, 54, 'Gobindhaganj', '5740', 0, '2021-12-08 22:36:24', '2021-12-08 22:36:24'),
(1166, 54, 'Mahimaganj', '5741', 0, '2021-12-08 22:36:24', '2021-12-08 22:36:24'),
(1167, 54, 'Palashbari', '5730', 0, '2021-12-08 22:36:24', '2021-12-08 22:36:24'),
(1168, 54, 'Bharatkhali', '5761', 0, '2021-12-08 22:36:24', '2021-12-08 22:36:24'),
(1169, 54, 'Phulchhari', '5760', 0, '2021-12-08 22:36:24', '2021-12-08 22:36:24'),
(1170, 54, 'Naldanga', '5711', 0, '2021-12-08 22:36:24', '2021-12-08 22:36:24'),
(1171, 54, 'Saadullapur', '5710', 0, '2021-12-08 22:36:24', '2021-12-08 22:36:24'),
(1172, 54, 'Bamandanga', '5721', 0, '2021-12-08 22:36:24', '2021-12-08 22:36:24'),
(1173, 54, 'Sundarganj', '5720', 0, '2021-12-08 22:36:24', '2021-12-08 22:36:24'),
(1174, 55, 'Bhurungamari', '5670', 0, '2021-12-08 22:36:24', '2021-12-08 22:36:24'),
(1175, 55, 'Chilmari', '5630', 0, '2021-12-08 22:36:24', '2021-12-08 22:36:24'),
(1176, 55, 'Jorgachh', '5631', 0, '2021-12-08 22:36:24', '2021-12-08 22:36:24'),
(1177, 55, 'Kurigram Sadar', '5600', 0, '2021-12-08 22:36:24', '2021-12-08 22:36:24'),
(1178, 55, 'Pandul', '5601', 0, '2021-12-08 22:36:24', '2021-12-08 22:36:24'),
(1179, 55, 'Phulbari', '5680', 0, '2021-12-08 22:36:24', '2021-12-08 22:36:24'),
(1180, 55, 'Nageshwar', '5660', 0, '2021-12-08 22:36:24', '2021-12-08 22:36:24'),
(1181, 55, 'Nazimkhan', '5611', 0, '2021-12-08 22:36:24', '2021-12-08 22:36:24'),
(1182, 55, 'Rajarhat', '5610', 0, '2021-12-08 22:36:24', '2021-12-08 22:36:24'),
(1183, 55, 'Rajibpur', '5650', 0, '2021-12-08 22:36:25', '2021-12-08 22:36:25'),
(1184, 55, 'Roumari', '5640', 0, '2021-12-08 22:36:25', '2021-12-08 22:36:25'),
(1185, 55, 'Bazarhat', '5621', 0, '2021-12-08 22:36:25', '2021-12-08 22:36:25'),
(1186, 55, 'Ulipur', '5620', 0, '2021-12-08 22:36:25', '2021-12-08 22:36:25'),
(1187, 56, 'Aditmari', '5510', 0, '2021-12-08 22:36:25', '2021-12-08 22:36:25'),
(1188, 56, 'Hatibandha', '5530', 0, '2021-12-08 22:36:25', '2021-12-08 22:36:25'),
(1189, 56, 'Kulaghat SO', '5502', 0, '2021-12-08 22:36:25', '2021-12-08 22:36:25'),
(1190, 56, 'Lalmonirhat Sadar', '5500', 0, '2021-12-08 22:36:25', '2021-12-08 22:36:25'),
(1191, 56, 'Moghalhat', '5501', 0, '2021-12-08 22:36:25', '2021-12-08 22:36:25'),
(1192, 56, 'Baura', '5541', 0, '2021-12-08 22:36:26', '2021-12-08 22:36:26'),
(1193, 56, 'Burimari', '5542', 0, '2021-12-08 22:36:26', '2021-12-08 22:36:26'),
(1194, 56, 'Patgram', '5540', 0, '2021-12-08 22:36:26', '2021-12-08 22:36:26'),
(1195, 56, 'Tushbhandar', '5520', 0, '2021-12-08 22:36:26', '2021-12-08 22:36:26'),
(1196, 57, 'Dimla', '5350', 0, '2021-12-08 22:36:26', '2021-12-08 22:36:26'),
(1197, 57, 'Ghaga Kharibari', '5351', 0, '2021-12-08 22:36:26', '2021-12-08 22:36:26'),
(1198, 57, 'Chilahati', '5341', 0, '2021-12-08 22:36:26', '2021-12-08 22:36:26'),
(1199, 57, 'Domar', '5340', 0, '2021-12-08 22:36:26', '2021-12-08 22:36:26'),
(1200, 57, 'Jaldhaka', '5330', 0, '2021-12-08 22:36:26', '2021-12-08 22:36:26'),
(1201, 57, 'Kishoriganj', '5320', 0, '2021-12-08 22:36:26', '2021-12-08 22:36:26'),
(1202, 57, 'Nilphamari Sadar', '5300', 0, '2021-12-08 22:36:26', '2021-12-08 22:36:26'),
(1203, 57, 'Nilphamari Sugar Mil', '5301', 0, '2021-12-08 22:36:26', '2021-12-08 22:36:26'),
(1204, 57, 'Syedpur', '5310', 0, '2021-12-08 22:36:26', '2021-12-08 22:36:26'),
(1205, 57, 'Syedpur Upashahar', '5311', 0, '2021-12-08 22:36:26', '2021-12-08 22:36:26'),
(1206, 58, 'Boda', '5010', 0, '2021-12-08 22:36:26', '2021-12-08 22:36:26'),
(1207, 58, 'Chotto Dab', '5040', 0, '2021-12-08 22:36:26', '2021-12-08 22:36:26'),
(1208, 58, 'Mirjapur', '5041', 0, '2021-12-08 22:36:26', '2021-12-08 22:36:26'),
(1209, 58, 'Dabiganj', '5020', 0, '2021-12-08 22:36:26', '2021-12-08 22:36:26'),
(1210, 58, 'Panchagar Sadar', '5000', 0, '2021-12-08 22:36:26', '2021-12-08 22:36:26'),
(1211, 58, 'Tetulia', '5030', 0, '2021-12-08 22:36:26', '2021-12-08 22:36:26'),
(1212, 59, 'Badarganj', '5430', 0, '2021-12-08 22:36:26', '2021-12-08 22:36:26'),
(1213, 59, 'Shyampur', '5431', 0, '2021-12-08 22:36:26', '2021-12-08 22:36:26'),
(1214, 59, 'Gangachara', '5410', 0, '2021-12-08 22:36:26', '2021-12-08 22:36:26'),
(1215, 59, 'Haragachh', '5441', 0, '2021-12-08 22:36:26', '2021-12-08 22:36:26'),
(1216, 59, 'Kaunia', '5440', 0, '2021-12-08 22:36:26', '2021-12-08 22:36:26'),
(1217, 59, 'Mithapukur', '5460', 0, '2021-12-08 22:36:26', '2021-12-08 22:36:26'),
(1218, 59, 'Pirgachha', '5450', 0, '2021-12-08 22:36:26', '2021-12-08 22:36:26'),
(1219, 59, 'Alamnagar', '5402', 0, '2021-12-08 22:36:26', '2021-12-08 22:36:26'),
(1220, 59, 'Mahiganj', '5403', 0, '2021-12-08 22:36:26', '2021-12-08 22:36:26'),
(1221, 59, 'Rangpur Cadet Colleg', '5404', 0, '2021-12-08 22:36:26', '2021-12-08 22:36:26'),
(1222, 59, 'Rangpur Carmiecal Col', '5405', 0, '2021-12-08 22:36:26', '2021-12-08 22:36:26'),
(1223, 59, 'Rangpur Sadar', '5400', 0, '2021-12-08 22:36:26', '2021-12-08 22:36:26'),
(1224, 59, 'Rangpur Upa-Shahar', '5401', 0, '2021-12-08 22:36:26', '2021-12-08 22:36:26'),
(1225, 59, 'Taraganj', '5420', 0, '2021-12-08 22:36:26', '2021-12-08 22:36:26'),
(1226, 60, 'Baliadangi', '5140', 0, '2021-12-08 22:36:26', '2021-12-08 22:36:26'),
(1227, 60, 'Lahiri', '5141', 0, '2021-12-08 22:36:26', '2021-12-08 22:36:26'),
(1228, 60, 'Jibanpur', '5130', 0, '2021-12-08 22:36:26', '2021-12-08 22:36:26'),
(1229, 60, 'Pirganj', '5110', 0, '2021-12-08 22:36:27', '2021-12-08 22:36:27'),
(1230, 60, 'Pirganj', '5470', 0, '2021-12-08 22:36:27', '2021-12-08 22:36:27'),
(1231, 60, 'Nekmarad', '5121', 0, '2021-12-08 22:36:27', '2021-12-08 22:36:27'),
(1232, 60, 'Rani Sankail', '5120', 0, '2021-12-08 22:36:27', '2021-12-08 22:36:27'),
(1233, 60, 'Ruhia', '5103', 0, '2021-12-08 22:36:27', '2021-12-08 22:36:27'),
(1234, 60, 'Shibganj', '5102', 0, '2021-12-08 22:36:27', '2021-12-08 22:36:27'),
(1235, 60, 'Thakurgaon Road', '5101', 0, '2021-12-08 22:36:27', '2021-12-08 22:36:27'),
(1236, 60, 'Thakurgaon Sadar', '5100', 0, '2021-12-08 22:36:27', '2021-12-08 22:36:27'),
(1237, 61, 'Azmireeganj', '3360', 0, '2021-12-08 22:36:27', '2021-12-08 22:36:27'),
(1238, 61, 'Bahubal', '3310', 0, '2021-12-08 22:36:27', '2021-12-08 22:36:27'),
(1239, 61, 'Baniachang', '3350', 0, '2021-12-08 22:36:28', '2021-12-08 22:36:28'),
(1240, 61, 'Jatrapasha', '3351', 0, '2021-12-08 22:36:28', '2021-12-08 22:36:28'),
(1241, 61, 'Kadirganj', '3352', 0, '2021-12-08 22:36:28', '2021-12-08 22:36:28'),
(1242, 61, 'Chandpurbagan', '3321', 0, '2021-12-08 22:36:28', '2021-12-08 22:36:28'),
(1243, 61, 'Chunarughat', '3320', 0, '2021-12-08 22:36:28', '2021-12-08 22:36:28'),
(1244, 61, 'Narapati', '3322', 0, '2021-12-08 22:36:28', '2021-12-08 22:36:28'),
(1245, 61, 'Gopaya', '3302', 0, '2021-12-08 22:36:28', '2021-12-08 22:36:28'),
(1246, 61, 'Habiganj Sadar', '3300', 0, '2021-12-08 22:36:28', '2021-12-08 22:36:28'),
(1247, 61, 'Shaestaganj', '3301', 0, '2021-12-08 22:36:28', '2021-12-08 22:36:28'),
(1248, 61, 'Kalauk', '3340', 0, '2021-12-08 22:36:28', '2021-12-08 22:36:28'),
(1249, 61, 'Lakhai', '3341', 0, '2021-12-08 22:36:28', '2021-12-08 22:36:28'),
(1250, 61, 'Itakhola', '3331', 0, '2021-12-08 22:36:28', '2021-12-08 22:36:28'),
(1251, 61, 'Madhabpur', '3330', 0, '2021-12-08 22:36:28', '2021-12-08 22:36:28'),
(1252, 61, 'Saihamnagar', '3333', 0, '2021-12-08 22:36:28', '2021-12-08 22:36:28'),
(1253, 61, 'Shahajibazar', '3332', 0, '2021-12-08 22:36:28', '2021-12-08 22:36:28'),
(1254, 61, 'Digalbak', '3373', 0, '2021-12-08 22:36:28', '2021-12-08 22:36:28');
INSERT INTO `post_office_lists` (`id`, `district_list_id`, `name`, `post_code`, `status`, `created_at`, `updated_at`) VALUES
(1255, 61, 'Golduba', '3372', 0, '2021-12-08 22:36:28', '2021-12-08 22:36:28'),
(1256, 61, 'Goplarbazar', '3371', 0, '2021-12-08 22:36:28', '2021-12-08 22:36:28'),
(1257, 61, 'Inathganj', '3374', 0, '2021-12-08 22:36:28', '2021-12-08 22:36:28'),
(1258, 61, 'Nabiganj', '3370', 0, '2021-12-08 22:36:28', '2021-12-08 22:36:28'),
(1259, 62, 'Baralekha', '3250', 0, '2021-12-08 22:36:28', '2021-12-08 22:36:28'),
(1260, 62, 'Dhakkhinbag', '3252', 0, '2021-12-08 22:36:28', '2021-12-08 22:36:28'),
(1261, 62, 'Juri', '3251', 0, '2021-12-08 22:36:28', '2021-12-08 22:36:28'),
(1262, 62, 'Purbashahabajpur', '3253', 0, '2021-12-08 22:36:28', '2021-12-08 22:36:28'),
(1263, 62, 'Kamalganj', '3220', 0, '2021-12-08 22:36:28', '2021-12-08 22:36:28'),
(1264, 62, 'Keramatnaga', '3221', 0, '2021-12-08 22:36:28', '2021-12-08 22:36:28'),
(1265, 62, 'Munshibazar', '3224', 0, '2021-12-08 22:36:28', '2021-12-08 22:36:28'),
(1266, 62, 'Patrakhola', '3222', 0, '2021-12-08 22:36:28', '2021-12-08 22:36:28'),
(1267, 62, 'Shamsher Nagar', '3223', 0, '2021-12-08 22:36:28', '2021-12-08 22:36:28'),
(1268, 62, 'Baramchal', '3237', 0, '2021-12-08 22:36:28', '2021-12-08 22:36:28'),
(1269, 62, 'Kajaldhara', '3234', 0, '2021-12-08 22:36:28', '2021-12-08 22:36:28'),
(1270, 62, 'Karimpur', '3235', 0, '2021-12-08 22:36:28', '2021-12-08 22:36:28'),
(1271, 62, 'Kulaura', '3230', 0, '2021-12-08 22:36:28', '2021-12-08 22:36:28'),
(1272, 62, 'Langla', '3232', 0, '2021-12-08 22:36:28', '2021-12-08 22:36:28'),
(1273, 62, 'Prithimpasha', '3233', 0, '2021-12-08 22:36:29', '2021-12-08 22:36:29'),
(1274, 62, 'Tillagaon', '3231', 0, '2021-12-08 22:36:29', '2021-12-08 22:36:29'),
(1275, 62, 'Afrozganj', '3203', 0, '2021-12-08 22:36:29', '2021-12-08 22:36:29'),
(1276, 62, 'Barakapan', '3201', 0, '2021-12-08 22:36:29', '2021-12-08 22:36:29'),
(1277, 62, 'Monumukh', '3202', 0, '2021-12-08 22:36:29', '2021-12-08 22:36:29'),
(1278, 62, 'Maulvi Bazar Sadar', '3200', 0, '2021-12-08 22:36:29', '2021-12-08 22:36:29'),
(1279, 62, 'Rajnagar', '3240', 0, '2021-12-08 22:36:29', '2021-12-08 22:36:29'),
(1280, 62, 'Kalighat', '3212', 0, '2021-12-08 22:36:29', '2021-12-08 22:36:29'),
(1281, 62, 'Khejurichhara', '3213', 0, '2021-12-08 22:36:29', '2021-12-08 22:36:29'),
(1282, 62, 'Narain Chora', '3211', 0, '2021-12-08 22:36:29', '2021-12-08 22:36:29'),
(1283, 62, 'Satgaon', '3214', 0, '2021-12-08 22:36:29', '2021-12-08 22:36:29'),
(1284, 62, 'Srimangal', '3210', 0, '2021-12-08 22:36:29', '2021-12-08 22:36:29'),
(1285, 63, 'Bishamsapur', '3010', 0, '2021-12-08 22:36:29', '2021-12-08 22:36:29'),
(1286, 63, 'Chhatak', '3080', 0, '2021-12-08 22:36:29', '2021-12-08 22:36:29'),
(1287, 63, 'Chhatak Cement Facto', '3081', 0, '2021-12-08 22:36:29', '2021-12-08 22:36:29'),
(1288, 63, 'Chhatak Paper Mills', '3082', 0, '2021-12-08 22:36:29', '2021-12-08 22:36:29'),
(1289, 63, 'Chourangi Bazar', '3893', 0, '2021-12-08 22:36:29', '2021-12-08 22:36:29'),
(1290, 63, 'Gabindaganj', '3083', 0, '2021-12-08 22:36:29', '2021-12-08 22:36:29'),
(1291, 63, 'Gabindaganj Natun Ba', '3084', 0, '2021-12-08 22:36:29', '2021-12-08 22:36:29'),
(1292, 63, 'Islamabad', '3088', 0, '2021-12-08 22:36:29', '2021-12-08 22:36:29'),
(1293, 63, 'jahidpur', '3087', 0, '2021-12-08 22:36:29', '2021-12-08 22:36:29'),
(1294, 63, 'Khurma', '3085', 0, '2021-12-08 22:36:29', '2021-12-08 22:36:29'),
(1295, 63, 'Moinpur', '3086', 0, '2021-12-08 22:36:29', '2021-12-08 22:36:29'),
(1296, 63, 'Dhirai Chandpur', '3040', 0, '2021-12-08 22:36:29', '2021-12-08 22:36:29'),
(1297, 63, 'Jagdal', '3041', 0, '2021-12-08 22:36:29', '2021-12-08 22:36:29'),
(1298, 63, 'Duara bazar', '3070', 0, '2021-12-08 22:36:29', '2021-12-08 22:36:29'),
(1299, 63, 'Ghungiar', '3050', 0, '2021-12-08 22:36:29', '2021-12-08 22:36:29'),
(1300, 63, 'Atuajan', '3062', 0, '2021-12-08 22:36:29', '2021-12-08 22:36:29'),
(1301, 63, 'Hasan Fatemapur', '3063', 0, '2021-12-08 22:36:30', '2021-12-08 22:36:30'),
(1302, 63, 'Jagnnathpur', '3060', 0, '2021-12-08 22:36:30', '2021-12-08 22:36:30'),
(1303, 63, 'Rasulganj', '3064', 0, '2021-12-08 22:36:30', '2021-12-08 22:36:30'),
(1304, 63, 'Shiramsi', '3065', 0, '2021-12-08 22:36:30', '2021-12-08 22:36:30'),
(1305, 63, 'Syedpur', '3061', 0, '2021-12-08 22:36:30', '2021-12-08 22:36:30'),
(1306, 63, 'Sachna', '3020', 0, '2021-12-08 22:36:30', '2021-12-08 22:36:30'),
(1307, 63, 'Pagla', '3001', 0, '2021-12-08 22:36:30', '2021-12-08 22:36:30'),
(1308, 63, 'Patharia', '3002', 0, '2021-12-08 22:36:30', '2021-12-08 22:36:30'),
(1309, 63, 'Sunamganj Sadar', '3000', 0, '2021-12-08 22:36:30', '2021-12-08 22:36:30'),
(1310, 63, 'Tahirpur', '3030', 0, '2021-12-08 22:36:30', '2021-12-08 22:36:30'),
(1311, 64, 'Balaganj', '3120', 0, '2021-12-08 22:36:31', '2021-12-08 22:36:31'),
(1312, 64, 'Begumpur', '3125', 0, '2021-12-08 22:36:31', '2021-12-08 22:36:31'),
(1313, 64, 'Brahman Shashon', '3122', 0, '2021-12-08 22:36:31', '2021-12-08 22:36:31'),
(1314, 64, 'Gaharpur', '3128', 0, '2021-12-08 22:36:31', '2021-12-08 22:36:31'),
(1315, 64, 'Goala Bazar', '3124', 0, '2021-12-08 22:36:31', '2021-12-08 22:36:31'),
(1316, 64, 'Karua', '3121', 0, '2021-12-08 22:36:31', '2021-12-08 22:36:31'),
(1317, 64, 'Kathal Khair', '3127', 0, '2021-12-08 22:36:31', '2021-12-08 22:36:31'),
(1318, 64, 'Natun Bazar', '3129', 0, '2021-12-08 22:36:31', '2021-12-08 22:36:31'),
(1319, 64, 'Omarpur', '3126', 0, '2021-12-08 22:36:31', '2021-12-08 22:36:31'),
(1320, 64, 'Tajpur', '3123', 0, '2021-12-08 22:36:31', '2021-12-08 22:36:31'),
(1321, 64, 'Bianibazar', '3170', 0, '2021-12-08 22:36:31', '2021-12-08 22:36:31'),
(1322, 64, 'Churkai', '3175', 0, '2021-12-08 22:36:31', '2021-12-08 22:36:31'),
(1323, 64, 'jaldup', '3171', 0, '2021-12-08 22:36:31', '2021-12-08 22:36:31'),
(1324, 64, 'Kurar bazar', '3173', 0, '2021-12-08 22:36:31', '2021-12-08 22:36:31'),
(1325, 64, 'Mathiura', '3172', 0, '2021-12-08 22:36:31', '2021-12-08 22:36:31'),
(1326, 64, 'Salia bazar', '3174', 0, '2021-12-08 22:36:31', '2021-12-08 22:36:31'),
(1327, 64, 'Bishwanath', '3130', 0, '2021-12-08 22:36:31', '2021-12-08 22:36:31'),
(1328, 64, 'Dashghar', '3131', 0, '2021-12-08 22:36:31', '2021-12-08 22:36:31'),
(1329, 64, 'Deokalas', '3133', 0, '2021-12-08 22:36:31', '2021-12-08 22:36:31'),
(1330, 64, 'Doulathpur', '3132', 0, '2021-12-08 22:36:31', '2021-12-08 22:36:31'),
(1331, 64, 'Singer kanch', '3134', 0, '2021-12-08 22:36:31', '2021-12-08 22:36:31'),
(1332, 64, 'Fenchuganj', '3116', 0, '2021-12-08 22:36:31', '2021-12-08 22:36:31'),
(1333, 64, 'Fenchuganj SareKarkh', '3117', 0, '2021-12-08 22:36:31', '2021-12-08 22:36:31'),
(1334, 64, 'Chiknagul', '3152', 0, '2021-12-08 22:36:31', '2021-12-08 22:36:31'),
(1335, 64, 'Goainhat', '3150', 0, '2021-12-08 22:36:31', '2021-12-08 22:36:31'),
(1336, 64, 'Jaflong', '3151', 0, '2021-12-08 22:36:31', '2021-12-08 22:36:31'),
(1337, 64, 'banigram', '3164', 0, '2021-12-08 22:36:31', '2021-12-08 22:36:31'),
(1338, 64, 'Chandanpur', '3165', 0, '2021-12-08 22:36:31', '2021-12-08 22:36:31'),
(1339, 64, 'Dakkhin Bhadashore', '3162', 0, '2021-12-08 22:36:31', '2021-12-08 22:36:31'),
(1340, 64, 'Dhaka Dakkhin', '3161', 0, '2021-12-08 22:36:31', '2021-12-08 22:36:31'),
(1341, 64, 'Gopalgannj', '3160', 0, '2021-12-08 22:36:31', '2021-12-08 22:36:31'),
(1342, 64, 'Ranaping', '3163', 0, '2021-12-08 22:36:31', '2021-12-08 22:36:31'),
(1343, 64, 'Jainthapur', '3156', 0, '2021-12-08 22:36:31', '2021-12-08 22:36:31'),
(1344, 64, 'Ichhamati', '3191', 0, '2021-12-08 22:36:31', '2021-12-08 22:36:31'),
(1345, 64, 'Jakiganj', '3190', 0, '2021-12-08 22:36:31', '2021-12-08 22:36:31'),
(1346, 64, 'Chatulbazar', '3181', 0, '2021-12-08 22:36:31', '2021-12-08 22:36:31'),
(1347, 64, 'Gachbari', '3183', 0, '2021-12-08 22:36:31', '2021-12-08 22:36:31'),
(1348, 64, 'Kanaighat', '3180', 0, '2021-12-08 22:36:31', '2021-12-08 22:36:31'),
(1349, 64, 'Manikganj', '3182', 0, '2021-12-08 22:36:31', '2021-12-08 22:36:31'),
(1350, 64, 'Kompanyganj', '3140', 0, '2021-12-08 22:36:31', '2021-12-08 22:36:31'),
(1351, 64, 'Birahimpur', '3106', 0, '2021-12-08 22:36:31', '2021-12-08 22:36:31'),
(1352, 64, 'Jalalabad', '3107', 0, '2021-12-08 22:36:31', '2021-12-08 22:36:31'),
(1353, 64, 'Jalalabad Cantoment', '3104', 0, '2021-12-08 22:36:31', '2021-12-08 22:36:31'),
(1354, 64, 'Kadamtali', '3111', 0, '2021-12-08 22:36:31', '2021-12-08 22:36:31'),
(1355, 64, 'Kamalbazer', '3112', 0, '2021-12-08 22:36:31', '2021-12-08 22:36:31'),
(1356, 64, 'Khadimnagar', '3103', 0, '2021-12-08 22:36:31', '2021-12-08 22:36:31'),
(1357, 64, 'Lalbazar', '3113', 0, '2021-12-08 22:36:31', '2021-12-08 22:36:31'),
(1358, 64, 'Mogla', '3108', 0, '2021-12-08 22:36:31', '2021-12-08 22:36:31'),
(1359, 64, 'Ranga Hajiganj', '3109', 0, '2021-12-08 22:36:31', '2021-12-08 22:36:31'),
(1360, 64, 'Shahajalal Science &', '3114', 0, '2021-12-08 22:36:31', '2021-12-08 22:36:31'),
(1361, 64, 'Silam', '3105', 0, '2021-12-08 22:36:31', '2021-12-08 22:36:31'),
(1362, 64, 'Sylhe Sadar', '3100', 0, '2021-12-08 22:36:32', '2021-12-08 22:36:32'),
(1363, 64, 'Sylhet Biman Bondar', '3102', 0, '2021-12-08 22:36:32', '2021-12-08 22:36:32'),
(1364, 64, 'Sylhet Cadet Col', '3101', 0, '2021-12-08 22:36:32', '2021-12-08 22:36:32');

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
(2, 23, 'New Luminous bao reflective geometric bags for women.', '<p><img src=\"data:image/jpeg;base64,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pGw09KGxENIGQ/wzw/8AMg9FReeat1Bc4NQXilhuDKCO220VdO1wH5+Qk+ln0m8MYCnL9dKsdHFVeYy6kqxbzUAgDzHbN370HToue0TFcpLVDcLldDXGsgilaAwNawlgJxj1rh6q9aghuFXJFqFro2X2K3RRPY0tayQgEuxjJGeCD1lFynR1cquuhvFNWVgq5Lfc5qVsnDcWNxjdjt4rmqzVtZFra309Nc5KqCe6GglZ1bWRAFucN4lznDtKD08kDmcLFVVMFNC+aomjijZjc97trRxxxJXHdJzag1mnhFdZ7dE+u2SyskDRxHDJPis3SdN5H0f1MwmbIInQ5fJtc14MrAc54Hmg7AOBGQQQqrmtd3eqsuiqu52yNsk0TGmM4y1oJA3EdwBytbSdxrDqS42aW4NuVPBDHLHUcC4FwGWkt4eIQdci8x1Td73T6i1LHSX0U8FsooKqKJzWnznF2QSfi4b969Etc5qrbTVTsbpoWSHHLi0H+KDaREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBCMhEQRsVis8NaK6K20kdUCSJmxAOBPM5WW42u33FjWXCjgqmsOWiVgdj61uogweSwCl8mbEwQ7dojDcN24xjHco6DTligEDYbVSxina5kW2MDYHekB3ZUwiDTt9tobfRCioaaKnpxnETG4bx58FpwaZsMXUdXaqRnUOc6ENjA2Od6RHdlTCINW3W+it1N5PQUsVNDuLtkbdoyeaxwWm2U9Y6tgt9LHUu9KZsTQ8+3C3kQadzttBc4Ww3Ckhqo2OD2tlYHAOHIqlrtlBbIHwW+khpYnuL3MiaGgk8zgLdRBp2620NtbK2gpoqcTPMjwxuNzjzJ8VbT2q3QXCa4Q0MEVXMMSTNYN7vWVvIg5+mslQ/UpvVyq46kxNLKKNsQb1Id6RzzJIwF0CIg07pbqC5wshuFJDVRseJGtlaHAOHI4PaEuNuoblTeS19LFUQZB6t7cjI5LcRBo0dpt1HVz1dLSRQz1GOukY3DpMcsntV1NbKCnr56+ClijqajAmlDfOfjvK3EQR9ws9suErJK6gpql0Ywx0sYcWj2rYq6Smq6R9JUwxy08g2vjc3LXDuWwiDDSU0FJTMp6aJsULBtYxowGjuUc/Tdjc1wda6U7puvdlg4yfL+l4qXRBpW620NBJPJR0sMD6h++Ysbgvd3laz9O2N1YKt1qojUCTrRIIRu3/Kz3qWRBq3G30dxp/J66lhqYs52SsDm5HbgqyttdBW273vq6OGakwB1LmAs4cuC3UQYH0tO+lNK+GN0O3YWOblu3GMYWK222gtsbo7fRwUrHHLmxMDQT44W4iCJq9P2WqmqJqi10sslUzZO97Ad4HY7vUlTxRwQsiiYGMY0Na0cgAsiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiK1jg7OOwoLkREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBFjkfsIwM+1U609wV1RlRYutPcE609wTVGVFi609wTrT3BNUZUWLrT3BOtPcE1RlRQtLdpJdSV1rMLRHTU8MrXh3FxkLgR7No+tSnWnuCaGZFh609wTrT3BNUZkWHrT3BOtPcE1RmRYetPcE609wTVGZFh609wTrT3BNUZkWHrT3BOtPcE1RmRYetPcE609wTVGZFh609wTrT3BNUZkWHrT3BOtPcE1RmRYetPcE609wTVGZFh609wTrT3BNUZkWHrT3BOtPcE1RmRYetPcE609wTVGZFh609wTrT3BNUZkWHrT3BOtPcE1RmRYetPcE609wTVGZFh609wTrT3BNUZkWHrT3BOtPcE1RmRYetPcE609wTVGZFh609wTrT3BNUZkWHrT3BOtPcE1RmRYetPcE609wTVGZFh609wTrT3BNUZkWHrT3BOtPcE1RmRYetPcE609wTVGZFh609wTrT3BNUZkWHrT3BOtPcE1RmRYetPcE609wTVGZFh609wTrT3BNUZkWHrT3BE1RmVkXxvpK9WRfG+koL0REBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREGCf0h6lYVfP6Q9SsK6YrDKZVEWtKrlMqiJoEREEVS1VTJqi40kkbW00NNC+N5ZgkuLtwLu3GBw7FLZUXSPuLtSXBkzXi3tp4TTnaNped2/B7fi5UoVEMplURXSq5TKoiaBERBci8ov/AExsHScej3RumZ9V3inidJcDFVtp4aLBAxI9zSM8cHuJA7Vq626YNQaFpoKzV/RtVUVFUPEMNRSXSOqZ1527I34aNm7JIcfkrO0ewZTKfgmFVMplMJhAyqqmFZO90cL3tY57mtJawc3EDO0etKMiLx/oU6bY+knWV60tLpKu0/XWeAyVLamobI5rg8MLCA0YIJWPpg6cx0ca/tGmK3RtdWwXXqhTXFlQ1kbnOcGuaAWnJbuGePxlNj2JEPMhFoEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERBtqyL430lerIvjfSXFleiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgwT+kPUrCr5/SHqVhXTFYoiItKIiICIiCLpIrgzVFwnle7yCSmhbAN/DeN2/Dezm1SiiqSllj1Vcax00bopaeFjYw7LmlpdkkdmchSxUgoiIqCIiAqg4OVRZI2ZAdnHsUo+FOm+29JfQ7093XpLslPPJbLjUvqjUQMc+nfC5wDoZ8DhxLRx7eIXpekfdAdGPTBaYtH9ItuNnq6mWLY2Uk07pg8lro5BxjI4cXY9Lmu46NOk+03HXuv9DasvNCya1XmU0YrZ2ASUxcAGNa4BuGHA5k+cvnz3Y+itC23UOl6zo2NuF0utRLFUQW6dsjS9pYWP2NLsOJecnwC5svePdYdKuqeiixW6usdFbKiK5b6Zk1Q5xlgnDSWvDR5r2Adh7V5lrTpY6c9N9FWlekyovmnX2y6iBhoIqPMkzi1zi57i3DdwaQQ08OxW+7tiuFF0O9H9rv9yirL7Tyjy14kBdK8QYfIBwOC7tx2qD6b6uhl9xJ0awQ1tO+cTQDq2yNLhtil38AfikjPdnimx2fSd0udK8XRjbel3TFxstp0xWmKKO2SU3XVJkLnNe573NwAXNIGD6OO1ejUnTY6t9zi7pYpNM1VTOyJwfb4juDZGv2Ofnn1Qd52eYavB9dV1A//APp+aVpW1tM+cVzG9W2RpcXCaYubjOSQCCR6l0PRjriv0N7hcagsD6Ce40dY+N8NQ0SsAlqtpa9gI5tdyKbHSXfpC6S6roNHTJYtUQU9NE5k9TY6u0NbG2PcGujjlI3uGXDD+0Z4r2zol1hFr7o/s2roKN1GLjEXOgc7OxzXFrgD2jLTjwXx1e710fX33Pt6vGodaO1F0h1tDC+One2Vrbc1sjQIYmMHVta0OOXHmvoT3ImoLFB7n7TtLNdaaOWgo5Z6zdIA2BhnkwXu5N5cicpKPPfctjPurOlv6VR//NBYvd08ekLorHH/AG5/3TQrV9yPerTcvdO9JlfQ18E1NcRPJRPa/HXs8oDgWg4J83isHu3r7ZqrpV6PbXTXKnkq7ZWb62MPGacOlhLd55NyAT7FYPsOQeefWrVayWOdjZYntkje0Oa5pyHA8QQRwwVctzw0IiKgiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIg21ZF8b6SvVkXxvpLiyvREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQYJ/SHqVhV8/pD1KwrpisUREWlEREBERKIejpoGasuVY2sidLLSwRuhB89gaXkOPgcnHqUwoijiohqu5TMqi6rfTwCaHbwY1pfsdntzx+pS6kBERUEREBbMX82FhiALuK2AMBc87vhK5+u0Xo+vq5Kuv0rYquolduklmt0T3vd3uJaST61Wg0Xo+31cVZb9K2OkqYjujmp7fFG9h7w5rQQp9FlETeNNaevUzJ7xYrXcpWN2sfV0kcrmjngFwOB2rVk0VpCSmip36WsT4YS4xRut8RZGXHzi1pbgZwM47l0CIOfOi9IGlbSnStiNOx5kbEbdFsa48C4N24BIABPbhZIdJ6Wit09ti05ZmUVQ4Pmp2UMQjlcOTnN24cR3kKcRBz9No3SNPHPHTaXscDKiPq5mx0ETRKzIO1wDfObkDgeHBbNLpvT9JbJ7XS2O2QW+pJM9LHSsbFLnGdzANp5DmOxS6IOdt+k9LWytZW23TVloqqMHZPT0Mcb2554c0AjgsdZo/SVdVy1ddpax1NTMd0s01vie9573OLSSfWulLW9yxzNG3lhalGtBBFTQsggjZFDG0MYxjdrWAcA0AcAAOxXqpCotzhoREVBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERBtqyL430lerIvjfSXFleiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgwT+kPUrCr5/SHqVhXTFYoiItKIiICIiURFGKD4WXIRdd5cKWDrs+hsy/Zt8eeVLqJo56N2q7jAymc2rZSwGabPB7XF+1uPDj9alyFIKIiKgiIgyQems6wU/prOuWXlKIiKIIiICIiAiIgKyX0FesdT/Np7jAiIuzQiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiINtWRfG+kr1ZF8b6S4sr0REBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREGCf0h6lYVfP6Q9SsK6YrFERFpRERARESiIoqmJ+rbnRiliZJDTQPMwHnPDi/DT4DHD1qYJUPR1k8mqbhQvgjbDFTQyMk28XlxdnLu3GFLqQERFQREQXREB4ytgEEZHJawWWJzWsAJ5LGU90rKit6xnenWM71jVRcit6xnenWM705FyK3rGd6dYzvTkXIresZ3p1jO9OQ6xnescr2uG0HisZQldJiulERFpRERAREQEREBERARFrXOupLbQT3CvqYqWkp2GSaaVwayNo4lxJ5AIjZReP3XpH1hqKrNH0f6ccIC4AV1azziCPSbFkbG8sOe7P6OFrw6L6aKx0VbV9IbKSdpDxFG1pYD3FoYGn1HIVNvaEXnNDeukPTLD8MbXS3y3MHnXG0NImjA+NJCeLvEs+yu8tFzoLvQR11tqoqqmlGWSROyD2H1EKXgbSIiKIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIg21ZF8b6SvVkXxvpLiyvREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQYJ/SHqVhV8/pD1KwrpisUREWlEREBERKIykluLtS3CGRjm29lPEYHFmGl5Lt+HdvYpNRdLHcfhLcHyGQ0DqeEQAu83rAXb8Ds+KpUlSCiIioIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiKoCDFUTRwROllkbGxjS5znHAAAySV5hBR1vSneGXOpqJKfRNDOTQ07csdc5GHhUOPDEQdnYO3bu7lC9MOqKvUd0t2g7FUSRe+9V5G+doP82MGV4+izdwXstqoaa2W6nt9HGI6emibFE3JO1jQABk8+ATxGfJb6Ckt1K2loaeOnhYMBrBgHh295WyUKopFkF5jr+yV+lK+XXWj97ACX3m2RM3RVbOG6ZrBx3jGTt4uHHnnd6cOKqWgjBGR2hWlm0Fo3U1Bqa2iropG9axretiDgduRlrgfjNcOLXDgRxU4vCL/FWdH2uZG2cFoDXVlrhdktqKdz/wA/RHj8WRwdGfil4HLK9m05eKPUFkpbvb3mSlqYw9hc0gg8i0g4wQQQQVPBEiiIqoiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiINtWQ/G9avVGtAz4lcWVUREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREGCf0h6lYVnfGHHJTqm95WplIMGEws/VN7ynVN7yr3xdsGEws/VN7ynVN7ynfDbBhMLP1Te8p1Te8p3Q2gaSkqY9T3GrfO0wS08DI2dZxa5u7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QEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERB//2Q==\" style=\"width: 791.688px;\" data-filename=\"2.jpg\"><br></p>', 1, 1800, 'new Luminous bao bag reflective geometric bags for women 2020 Quilted Shoulder Bags Plain Folding female Handbags bolsa feminina', '10', '1636363041', 'ZEES28082020', 'pcs', '120', 'woman\'s bag', 1, 1, 1, 1, 1, 1, '2021-10-27 08:41:35', '2021-11-09 14:48:56');
INSERT INTO `products` (`id`, `category_id`, `name`, `description`, `currency_id`, `price`, `short_description`, `discount`, `slug`, `sku`, `unit_name`, `gross_weight`, `tags`, `status`, `featured`, `new_arrival`, `popular`, `bestseller`, `trending`, `created_at`, `updated_at`) VALUES
(3, 3, 'Gins pant', '<p>Pant</p>', 1, 600, '<p><br></p>', NULL, '1636469138', '5366', 'Pic', '10', '', 1, 1, 1, 1, 1, 1, '2021-11-09 14:45:38', '2021-11-20 03:08:47'),
(4, 23, 'Bag pac', '<p>Ladis Bag</p>', 1, 800, '<p><br></p>', NULL, '1636890634', '4343', 'Ladis Bag', '1232', '', 1, 1, 1, 0, 1, 1, '2021-11-14 11:50:34', '2021-12-12 02:59:56'),
(6, 20, 'Iphone', '<p>Iphone<br></p>', 1, 80000, '<p><br></p>', NULL, '1636890832', '523523', 'Iphone', '432423', '', 1, 0, 1, 1, 0, 0, '2021-11-14 11:53:52', '2021-11-20 03:11:28'),
(7, 15, 'spicker', '<p>spicker<br></p>', 1, 2000, '<p><br></p>', NULL, '1636890953', '523532', 'spicker', '534534', '', 1, 1, 1, 1, 1, 1, '2021-11-14 11:55:53', '2021-11-20 03:09:41'),
(8, 13, 'head phone', '<p>head phone<br></p>', 1, 1600, '<p><br></p>', NULL, '1636891018', '42423', 'head phone', '423423', '', 1, 1, 1, 1, 0, 1, '2021-11-14 11:56:58', '2021-11-20 03:09:51'),
(9, 17, 'baverage', '<p>baverage<br></p>', 1, 800, '<p><br></p>', NULL, '1636891060', '52323', 'baverage', '23523', '', 1, 1, 1, 1, 1, 1, '2021-11-14 11:57:40', '2021-11-20 03:10:04'),
(10, 24, 'shose', '<p>shose<br></p>', 1, 1500, '<p><br></p>', NULL, '1636891105', '4242423', 'shose', '4234234', '', 1, 1, 1, 1, 1, 1, '2021-11-14 11:58:25', '2021-11-20 03:10:16'),
(11, 15, 'watch', '<p>watch<br></p>', 1, 1200, '<p><br></p>', NULL, '1636891193', '423423', 'watch', '423423', '', 1, 1, 1, 1, 1, 1, '2021-11-14 11:59:53', '2021-11-20 03:10:26'),
(12, 13, 'camera', '<p>camera<br></p>', 1, 40000, '<p><br></p>', NULL, '1636891238', '4234234', 'camera', '423423', '', 1, 1, 1, 1, 1, 1, '2021-11-14 12:00:38', '2021-11-20 03:10:37');

-- --------------------------------------------------------

--
-- Table structure for table `product_filter_gallery_sections`
--

CREATE TABLE `product_filter_gallery_sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `show` tinyint(1) NOT NULL DEFAULT 1,
  `number_of_content` int(11) NOT NULL DEFAULT 6,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_filter_gallery_sections`
--

INSERT INTO `product_filter_gallery_sections` (`id`, `title`, `show`, `number_of_content`, `created_at`, `updated_at`) VALUES
(1, 'Special Product', 1, 6, '2021-11-03 00:19:46', '2021-11-03 00:22:10');

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
(11, 2, '7.jpg', '/upload/products/16353456966ywlhgDAC.jpg', '2021-10-27 08:41:36', '2021-10-27 08:41:36'),
(12, 3, 'images (1).jpeg', '/upload/products/1636469259mnpt7cDAC.jpeg', '2021-11-09 14:47:39', '2021-11-09 14:47:39'),
(13, 4, 'F_Purse1_drop.jpg', '/upload/products/1636890634q652nvDAC.jpg', '2021-11-14 11:50:34', '2021-11-14 11:50:34'),
(15, 6, 'iPhone+13+HP+Preview.png', '/upload/products/1636890832jdriysDAC.png', '2021-11-14 11:53:53', '2021-11-14 11:53:53'),
(16, 7, 'ecommerce-product-photography-amazon-Tri-Product-Photo-06849.jpg', '/upload/products/1636890953gwv7btDAC.jpg', '2021-11-14 11:55:53', '2021-11-14 11:55:53'),
(17, 8, 'photo-1505740420928-5e560c06d30e.jpg', '/upload/products/1636891018lmfycaDAC.jpg', '2021-11-14 11:56:58', '2021-11-14 11:56:58'),
(18, 9, 'product2.jpg', '/upload/products/1636891060ly8wpkDAC.jpg', '2021-11-14 11:57:40', '2021-11-14 11:57:40'),
(19, 10, 'product1.jpeg', '/upload/products/16368911054knw1zDAC.jpeg', '2021-11-14 11:58:25', '2021-11-14 11:58:25'),
(20, 11, 'photo-1523275335684-37898b6baf30.jpg', '/upload/products/16368911930ba3rfDAC.jpg', '2021-11-14 11:59:53', '2021-11-14 11:59:53'),
(21, 12, 'pexels-photo-90946.jpeg', '/upload/products/1636891238bh7vsfDAC.jpeg', '2021-11-14 12:00:38', '2021-11-14 12:00:38');

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
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'supper_admin', 'web', '2021-12-08 22:36:32', '2021-12-08 22:36:32'),
(2, 'admin', 'web', '2021-12-08 22:36:32', '2021-12-08 22:36:32'),
(3, 'customer', 'web', '2021-12-08 22:36:32', '2021-12-08 22:36:32');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(3, 2),
(4, 1),
(4, 2),
(5, 1),
(6, 1),
(6, 2),
(7, 1),
(7, 2),
(8, 1),
(8, 2);

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
('RHJfreSm49E8KoSTHD2vQRkmLFPMbUcxQpZvvvxk', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibVNXY2c5Rm52THhyZDlQUlVXenFJckFObWtsS2JhVkFHcVdtdlVPbyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fX0=', 1639908869),
('TuUOhAtjSWwkd8sGxvBRr1MGkcSNhx7S0HiH0Nlo', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', 'YTo4OntzOjY6Il90b2tlbiI7czo0MDoiU3drSVJWNWYwUlo3T1lZU0JzS2thZ01KWDFvMVRQSUR6eVA0REVRMiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9pbnZvaWNlLzI5Ijt9czo0OiJjYXJ0IjthOjE6e3M6MTM6InNob3BwaW5nX2NhcnQiO086Mjk6IklsbHVtaW5hdGVcU3VwcG9ydFxDb2xsZWN0aW9uIjoxOntzOjg6IgAqAGl0ZW1zIjthOjA6e319fXM6MzoidXJsIjthOjA6e31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToyO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjYwOiIkMnkkMTAkSVNqMi5DUWtGT0FvbjdnTGh0Mnc0Lm1heHhoSlVBeFFsSk1nakp3Z1JSWHZTdGRrV2pVbGEiO3M6MjE6InBhc3N3b3JkX2hhc2hfc2FuY3R1bSI7czo2MDoiJDJ5JDEwJElTajIuQ1FrRk9Bb243Z0xodDJ3NC5tYXh4aEpVQXhRbEpNZ2pKd2dSUlh2U3Rka1dqVWxhIjt9', 1639907272);

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

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `name`, `line1`, `line2`, `line3`, `btn_text`, `btn_url`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Demo 1', 'This is a demo image', 'Demo 1', 'from <span>$499</span>', 'BUY NOW', 'javascript:void(0)', 'upload/widgets/sliders/1639026216b2sui5DAC.jpg', 1, '2021-11-02 09:21:24', '2021-12-08 23:03:36'),
(2, 'Demo 2', 'This a demo image', 'Demo 2', 'from <span>$199</span>', 'BUY NOW', 'javascript:void(0)', 'upload/widgets/sliders/1639026202vo67ysDAC.png', 1, '2021-11-02 09:22:33', '2021-12-08 23:03:23'),
(3, 'Demo 3', 'This is a demo image', 'Demo 3', 'from <span>$19</span>', 'BUY NOW', 'javascript:void(0)', 'upload/widgets/sliders/1639026187pa9ujeDAC.jpg', 1, '2021-11-02 09:26:45', '2021-12-08 23:03:08');

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
(1, 'facebook', 'https://www.facebook.com', '2021-10-20 22:58:16', '2021-12-18 21:58:04'),
(2, 'twitter', 'https://twitter.com/', '2021-10-20 22:58:16', '2021-12-18 21:58:04'),
(3, 'linkedin', 'https://www.linkedin.com', '2021-10-20 22:58:16', '2021-12-18 21:58:04'),
(4, 'pinterest', 'https://www.pinterest.com', '2021-10-20 22:58:16', '2021-12-18 21:58:04'),
(5, 'youtube', NULL, '2021-10-20 22:58:16', '2021-12-18 21:58:04'),
(6, 'instagram', NULL, '2021-10-20 22:58:16', '2021-12-18 21:58:04'),
(7, 'tumblr', NULL, '2021-10-20 22:58:16', '2021-12-18 21:58:04'),
(8, 'snapchat', NULL, '2021-10-20 22:58:16', '2021-12-18 21:58:04'),
(9, 'whatsapp', NULL, '2021-10-20 22:58:16', '2021-12-18 21:58:04'),
(10, 'quora', NULL, '2021-10-20 22:58:16', '2021-12-18 21:58:04'),
(11, 'delicious', NULL, '2021-10-20 22:58:16', '2021-12-18 21:58:04'),
(12, 'digg', NULL, '2021-10-20 22:58:16', '2021-12-18 21:58:04');

-- --------------------------------------------------------

--
-- Table structure for table `subscribtions`
--

CREATE TABLE `subscribtions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscribtions`
--

INSERT INTO `subscribtions` (`id`, `email`, `created_at`, `updated_at`) VALUES
(1, 'asd@asd.asd', '2021-12-18 02:42:04', '2021-12-18 02:42:04'),
(2, 'asdf@asd.asd', '2021-12-18 02:53:41', '2021-12-18 02:53:41');

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

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `user_id`, `name`, `personal_team`, `created_at`, `updated_at`) VALUES
(1, 2, 'Faidul\'s Team', 1, '2021-12-08 22:41:20', '2021-12-08 22:41:20');

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
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `thana_lists`
--

INSERT INTO `thana_lists` (`id`, `district_list_id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Amtali', 1, '2021-12-08 22:35:38', '2021-12-08 22:40:05'),
(2, 1, 'Bamna', 1, '2021-12-08 22:35:38', '2021-12-08 22:40:05'),
(3, 1, 'Barguna Sadar', 1, '2021-12-08 22:35:38', '2021-12-08 22:40:05'),
(4, 1, 'Betagi', 1, '2021-12-08 22:35:38', '2021-12-08 22:40:05'),
(5, 1, 'Patharghata', 1, '2021-12-08 22:35:38', '2021-12-08 22:40:05'),
(6, 1, 'Taltali', 1, '2021-12-08 22:35:38', '2021-12-08 22:40:05'),
(7, 2, 'Agailzhara', 1, '2021-12-08 22:35:39', '2021-12-08 22:40:05'),
(8, 2, 'Agailzhara', 1, '2021-12-08 22:35:39', '2021-12-08 22:40:05'),
(9, 2, 'Babuganj', 1, '2021-12-08 22:35:39', '2021-12-08 22:40:05'),
(10, 2, 'Barajalia', 1, '2021-12-08 22:35:39', '2021-12-08 22:40:05'),
(11, 2, 'Barishal Sadar', 1, '2021-12-08 22:35:39', '2021-12-08 22:40:06'),
(12, 2, 'Gouranadi', 1, '2021-12-08 22:35:39', '2021-12-08 22:40:06'),
(13, 2, 'Mahendiganj', 1, '2021-12-08 22:35:39', '2021-12-08 22:40:06'),
(14, 2, 'Muladi', 1, '2021-12-08 22:35:39', '2021-12-08 22:40:06'),
(15, 2, 'Sahebganj', 1, '2021-12-08 22:35:39', '2021-12-08 22:40:06'),
(16, 2, 'Uzirpur', 1, '2021-12-08 22:35:39', '2021-12-08 22:40:06'),
(17, 3, 'Bhola Sadar', 1, '2021-12-08 22:35:41', '2021-12-08 22:40:06'),
(18, 3, 'Borhanuddin UPO', 1, '2021-12-08 22:35:41', '2021-12-08 22:40:06'),
(19, 3, 'Charfashion', 1, '2021-12-08 22:35:41', '2021-12-08 22:40:06'),
(20, 3, 'Doulatkhan', 1, '2021-12-08 22:35:41', '2021-12-08 22:40:06'),
(21, 3, 'Doulatkhan', 1, '2021-12-08 22:35:41', '2021-12-08 22:40:06'),
(22, 3, 'Hajirhat', 1, '2021-12-08 22:35:41', '2021-12-08 22:40:06'),
(23, 3, 'Hatshoshiganj', 1, '2021-12-08 22:35:41', '2021-12-08 22:40:06'),
(24, 3, 'Lalmohan UPO', 1, '2021-12-08 22:35:41', '2021-12-08 22:40:06'),
(25, 4, 'Jhalokathi Sadar', 1, '2021-12-08 22:35:42', '2021-12-08 22:40:06'),
(26, 4, 'Kathalia', 1, '2021-12-08 22:35:42', '2021-12-08 22:40:06'),
(27, 4, 'Nalchhiti', 1, '2021-12-08 22:35:42', '2021-12-08 22:40:06'),
(28, 4, 'Rajapur', 1, '2021-12-08 22:35:42', '2021-12-08 22:40:06'),
(29, 5, 'Bauphal', 1, '2021-12-08 22:35:43', '2021-12-08 22:40:06'),
(30, 5, 'Dashmina', 1, '2021-12-08 22:35:43', '2021-12-08 22:40:06'),
(31, 5, 'Galachipa', 1, '2021-12-08 22:35:43', '2021-12-08 22:40:06'),
(32, 5, 'Khepupara', 1, '2021-12-08 22:35:43', '2021-12-08 22:40:06'),
(33, 5, 'Patuakhali Sadar', 1, '2021-12-08 22:35:43', '2021-12-08 22:40:06'),
(34, 5, 'Subidkhali', 1, '2021-12-08 22:35:43', '2021-12-08 22:40:06'),
(35, 6, 'Banaripara', 1, '2021-12-08 22:35:44', '2021-12-08 22:40:06'),
(36, 6, 'kaukhali', 1, '2021-12-08 22:35:44', '2021-12-08 22:40:06'),
(37, 6, 'Mathbaria', 1, '2021-12-08 22:35:44', '2021-12-08 22:40:06'),
(38, 6, 'Nazirpur', 1, '2021-12-08 22:35:44', '2021-12-08 22:40:06'),
(39, 6, 'Pirojpur', 1, '2021-12-08 22:35:44', '2021-12-08 22:40:06'),
(40, 6, 'Sadar', 1, '2021-12-08 22:35:44', '2021-12-08 22:40:06'),
(41, 6, 'Swarupkathi', 1, '2021-12-08 22:35:44', '2021-12-08 22:40:06'),
(42, 7, 'Alikadam', 1, '2021-12-08 22:35:44', '2021-12-08 22:40:07'),
(43, 7, 'Bandarban Sadar', 1, '2021-12-08 22:35:44', '2021-12-08 22:40:07'),
(44, 7, 'Naikhong', 1, '2021-12-08 22:35:44', '2021-12-08 22:40:07'),
(45, 7, 'Roanchhari', 1, '2021-12-08 22:35:44', '2021-12-08 22:40:07'),
(46, 7, 'Ruma', 1, '2021-12-08 22:35:44', '2021-12-08 22:40:07'),
(47, 7, 'Thanchi', 1, '2021-12-08 22:35:44', '2021-12-08 22:40:07'),
(48, 7, 'Thanchi', 1, '2021-12-08 22:35:44', '2021-12-08 22:40:07'),
(49, 8, 'Akhaura', 1, '2021-12-08 22:35:45', '2021-12-08 22:40:07'),
(50, 8, 'Akhaura', 1, '2021-12-08 22:35:45', '2021-12-08 22:40:07'),
(51, 8, 'Banchharampur', 1, '2021-12-08 22:35:45', '2021-12-08 22:40:07'),
(52, 8, 'Brahamanbaria Sadar', 1, '2021-12-08 22:35:45', '2021-12-08 22:40:07'),
(53, 8, 'Kasba', 1, '2021-12-08 22:35:45', '2021-12-08 22:40:07'),
(54, 8, 'Nabinagar', 1, '2021-12-08 22:35:45', '2021-12-08 22:40:07'),
(55, 8, 'Nasirnagar', 1, '2021-12-08 22:35:45', '2021-12-08 22:40:07'),
(56, 8, 'Sarail', 1, '2021-12-08 22:35:45', '2021-12-08 22:40:07'),
(57, 9, 'Chandpur Sadar', 1, '2021-12-08 22:35:46', '2021-12-08 22:40:07'),
(58, 9, 'Faridganj', 1, '2021-12-08 22:35:46', '2021-12-08 22:40:07'),
(59, 9, 'Hajiganj', 1, '2021-12-08 22:35:46', '2021-12-08 22:40:07'),
(60, 9, 'Hayemchar', 1, '2021-12-08 22:35:46', '2021-12-08 22:40:07'),
(61, 9, 'Kachua', 1, '2021-12-08 22:35:46', '2021-12-08 22:40:07'),
(62, 9, 'Matlobganj', 1, '2021-12-08 22:35:46', '2021-12-08 22:40:07'),
(63, 9, 'Shahrasti', 1, '2021-12-08 22:35:46', '2021-12-08 22:40:07'),
(64, 10, 'Anawara', 1, '2021-12-08 22:35:47', '2021-12-08 22:40:07'),
(65, 10, 'Boalkhali', 1, '2021-12-08 22:35:47', '2021-12-08 22:40:07'),
(66, 10, 'Chittagong Sadar', 1, '2021-12-08 22:35:47', '2021-12-08 22:40:07'),
(67, 10, 'East Joara', 1, '2021-12-08 22:35:47', '2021-12-08 22:40:07'),
(68, 10, 'Fatikchhari', 1, '2021-12-08 22:35:47', '2021-12-08 22:40:07'),
(69, 10, 'Hathazari', 1, '2021-12-08 22:35:47', '2021-12-08 22:40:07'),
(70, 10, 'Jaldi', 1, '2021-12-08 22:35:47', '2021-12-08 22:40:07'),
(71, 10, 'Lohagara', 1, '2021-12-08 22:35:47', '2021-12-08 22:40:07'),
(72, 10, 'Mirsharai', 1, '2021-12-08 22:35:47', '2021-12-08 22:40:07'),
(73, 10, 'Patia Head Office', 1, '2021-12-08 22:35:47', '2021-12-08 22:40:07'),
(74, 10, 'Rangunia', 1, '2021-12-08 22:35:47', '2021-12-08 22:40:07'),
(75, 10, 'Rouzan', 1, '2021-12-08 22:35:47', '2021-12-08 22:40:07'),
(76, 10, 'Sandwip', 1, '2021-12-08 22:35:47', '2021-12-08 22:40:07'),
(77, 10, 'Satkania', 1, '2021-12-08 22:35:47', '2021-12-08 22:40:07'),
(78, 10, 'Sitakunda', 1, '2021-12-08 22:35:47', '2021-12-08 22:40:07'),
(79, 11, 'Barura', 1, '2021-12-08 22:35:49', '2021-12-08 22:40:07'),
(80, 11, 'Brahmanpara', 1, '2021-12-08 22:35:49', '2021-12-08 22:40:07'),
(81, 11, 'Burichang', 1, '2021-12-08 22:35:49', '2021-12-08 22:40:07'),
(82, 11, 'Chandina', 1, '2021-12-08 22:35:49', '2021-12-08 22:40:07'),
(83, 11, 'Chouddagram', 1, '2021-12-08 22:35:49', '2021-12-08 22:40:07'),
(84, 11, 'Comilla Sadar', 1, '2021-12-08 22:35:49', '2021-12-08 22:40:07'),
(85, 11, 'Daudkandi', 1, '2021-12-08 22:35:50', '2021-12-08 22:40:07'),
(86, 11, 'Davidhar', 1, '2021-12-08 22:35:50', '2021-12-08 22:40:07'),
(87, 11, 'Homna', 1, '2021-12-08 22:35:50', '2021-12-08 22:40:07'),
(88, 11, 'Laksam', 1, '2021-12-08 22:35:50', '2021-12-08 22:40:07'),
(89, 11, 'Langalkot', 1, '2021-12-08 22:35:50', '2021-12-08 22:40:07'),
(90, 11, 'Muradnagar', 1, '2021-12-08 22:35:50', '2021-12-08 22:40:07'),
(91, 12, 'Chiringga', 1, '2021-12-08 22:35:51', '2021-12-08 22:40:07'),
(92, 12, 'Cox\'s Bazar Sadar', 1, '2021-12-08 22:35:51', '2021-12-08 22:40:07'),
(93, 12, 'Gorakghat', 1, '2021-12-08 22:35:51', '2021-12-08 22:40:08'),
(94, 12, 'Kutubdia', 1, '2021-12-08 22:35:51', '2021-12-08 22:40:08'),
(95, 12, 'Ramu', 1, '2021-12-08 22:35:51', '2021-12-08 22:40:08'),
(96, 12, 'Teknaf', 1, '2021-12-08 22:35:51', '2021-12-08 22:40:08'),
(97, 12, 'Ukhia', 1, '2021-12-08 22:35:51', '2021-12-08 22:40:08'),
(98, 13, 'Chhagalnaia', 1, '2021-12-08 22:35:51', '2021-12-08 22:40:08'),
(99, 13, 'Dagonbhuia', 1, '2021-12-08 22:35:51', '2021-12-08 22:40:08'),
(100, 13, 'Feni Sadar', 1, '2021-12-08 22:35:51', '2021-12-08 22:40:08'),
(101, 13, 'Pashurampur', 1, '2021-12-08 22:35:51', '2021-12-08 22:40:08'),
(102, 13, 'Sonagazi', 1, '2021-12-08 22:35:51', '2021-12-08 22:40:08'),
(103, 14, 'Diginala', 1, '2021-12-08 22:35:52', '2021-12-08 22:40:08'),
(104, 14, 'Khagrachhari Sadar', 1, '2021-12-08 22:35:52', '2021-12-08 22:40:08'),
(105, 14, 'Laxmichhari', 1, '2021-12-08 22:35:52', '2021-12-08 22:40:08'),
(106, 14, 'Mahalchhari', 1, '2021-12-08 22:35:52', '2021-12-08 22:40:08'),
(107, 14, 'Manikchhari', 1, '2021-12-08 22:35:52', '2021-12-08 22:40:08'),
(108, 14, 'Matiranga', 1, '2021-12-08 22:35:52', '2021-12-08 22:40:08'),
(109, 14, 'Panchhari', 1, '2021-12-08 22:35:52', '2021-12-08 22:40:08'),
(110, 14, 'Ramghar Head Office', 1, '2021-12-08 22:35:52', '2021-12-08 22:40:08'),
(111, 15, 'Char Alexgander', 1, '2021-12-08 22:35:52', '2021-12-08 22:40:08'),
(112, 15, 'Lakshimpur Sadar', 1, '2021-12-08 22:35:52', '2021-12-08 22:40:08'),
(113, 15, 'Ramganj', 1, '2021-12-08 22:35:52', '2021-12-08 22:40:08'),
(114, 15, 'Raypur', 1, '2021-12-08 22:35:52', '2021-12-08 22:40:08'),
(115, 16, 'Basurhat', 1, '2021-12-08 22:35:53', '2021-12-08 22:40:08'),
(116, 16, 'Begumganj', 1, '2021-12-08 22:35:53', '2021-12-08 22:40:08'),
(117, 16, 'Chatkhil', 1, '2021-12-08 22:35:53', '2021-12-08 22:40:08'),
(118, 16, 'Hatiya', 1, '2021-12-08 22:35:53', '2021-12-08 22:40:08'),
(119, 16, 'Noakhali Sadar', 1, '2021-12-08 22:35:53', '2021-12-08 22:40:08'),
(120, 16, 'Senbag', 1, '2021-12-08 22:35:53', '2021-12-08 22:40:08'),
(121, 17, 'Barakal', 1, '2021-12-08 22:35:54', '2021-12-08 22:40:08'),
(122, 17, 'Bilaichhari', 1, '2021-12-08 22:35:54', '2021-12-08 22:40:08'),
(123, 17, 'Jarachhari', 1, '2021-12-08 22:35:54', '2021-12-08 22:40:08'),
(124, 17, 'Kalampati', 1, '2021-12-08 22:35:54', '2021-12-08 22:40:08'),
(125, 17, 'kaptai', 1, '2021-12-08 22:35:54', '2021-12-08 22:40:08'),
(126, 17, 'Longachh', 1, '2021-12-08 22:35:54', '2021-12-08 22:40:09'),
(127, 17, 'Marishya', 1, '2021-12-08 22:35:54', '2021-12-08 22:40:09'),
(128, 17, 'Naniachhar', 1, '2021-12-08 22:35:54', '2021-12-08 22:40:09'),
(129, 17, 'Rajsthali', 1, '2021-12-08 22:35:54', '2021-12-08 22:40:09'),
(130, 17, 'Rangamati Sadar', 1, '2021-12-08 22:35:54', '2021-12-08 22:40:09'),
(131, 18, 'Demra', 1, '2021-12-08 22:35:55', '2021-12-08 22:40:09'),
(132, 18, 'Dhaka Cantt.', 1, '2021-12-08 22:35:56', '2021-12-08 22:40:09'),
(133, 18, 'Dhamrai', 1, '2021-12-08 22:35:56', '2021-12-08 22:40:09'),
(134, 18, 'Dhanmondi', 1, '2021-12-08 22:35:56', '2021-12-08 22:40:09'),
(135, 18, 'Gulshan', 1, '2021-12-08 22:35:56', '2021-12-08 22:40:09'),
(136, 18, 'Jatrabari', 1, '2021-12-08 22:35:56', '2021-12-08 22:40:09'),
(137, 18, 'Joypara', 1, '2021-12-08 22:35:56', '2021-12-08 22:40:09'),
(138, 18, 'Keraniganj', 1, '2021-12-08 22:35:56', '2021-12-08 22:40:09'),
(139, 18, 'Khilgaon', 1, '2021-12-08 22:35:56', '2021-12-08 22:40:09'),
(140, 18, 'Khilkhet', 1, '2021-12-08 22:35:56', '2021-12-08 22:40:09'),
(141, 18, 'Lalbag', 1, '2021-12-08 22:35:56', '2021-12-08 22:40:09'),
(142, 18, 'Mirpur', 1, '2021-12-08 22:35:56', '2021-12-08 22:40:09'),
(143, 18, 'Mohammadpur', 1, '2021-12-08 22:35:56', '2021-12-08 22:40:09'),
(144, 18, 'Motijheel', 1, '2021-12-08 22:35:56', '2021-12-08 22:40:09'),
(145, 18, 'Nawabganj', 1, '2021-12-08 22:35:56', '2021-12-08 22:40:09'),
(146, 18, 'New market', 1, '2021-12-08 22:35:56', '2021-12-08 22:40:09'),
(147, 18, 'Palton', 1, '2021-12-08 22:35:56', '2021-12-08 22:40:09'),
(148, 18, 'Ramna', 1, '2021-12-08 22:35:56', '2021-12-08 22:40:09'),
(149, 18, 'Sabujbag', 1, '2021-12-08 22:35:56', '2021-12-08 22:40:09'),
(150, 18, 'Savar', 1, '2021-12-08 22:35:56', '2021-12-08 22:40:09'),
(151, 18, 'Sutrapur', 1, '2021-12-08 22:35:56', '2021-12-08 22:40:09'),
(152, 18, 'Tejgaon', 1, '2021-12-08 22:35:56', '2021-12-08 22:40:09'),
(153, 18, 'Tejgaon Industrial Area', 1, '2021-12-08 22:35:56', '2021-12-08 22:40:09'),
(154, 18, 'Uttara', 1, '2021-12-08 22:35:56', '2021-12-08 22:40:09'),
(155, 19, 'Alfadanga', 1, '2021-12-08 22:35:57', '2021-12-08 22:40:09'),
(156, 19, 'Bhanga', 1, '2021-12-08 22:35:57', '2021-12-08 22:40:09'),
(157, 19, 'Boalmari', 1, '2021-12-08 22:35:58', '2021-12-08 22:40:09'),
(158, 19, 'Charbhadrasan', 1, '2021-12-08 22:35:58', '2021-12-08 22:40:09'),
(159, 19, 'Faridpur Sadar', 1, '2021-12-08 22:35:58', '2021-12-08 22:40:09'),
(160, 19, 'Madukhali', 1, '2021-12-08 22:35:58', '2021-12-08 22:40:09'),
(161, 19, 'Nagarkanda', 1, '2021-12-08 22:35:58', '2021-12-08 22:40:09'),
(162, 19, 'Sadarpur', 1, '2021-12-08 22:35:58', '2021-12-08 22:40:09'),
(163, 19, 'Shriangan', 1, '2021-12-08 22:35:58', '2021-12-08 22:40:09'),
(164, 20, 'Gazipur Sadar', 1, '2021-12-08 22:35:58', '2021-12-08 22:40:09'),
(165, 20, 'Kaliakaar', 1, '2021-12-08 22:35:58', '2021-12-08 22:40:09'),
(166, 20, 'Kaliganj', 1, '2021-12-08 22:35:58', '2021-12-08 22:40:09'),
(167, 20, 'Kapashia', 1, '2021-12-08 22:35:58', '2021-12-08 22:40:09'),
(168, 20, 'Monnunagar', 1, '2021-12-08 22:35:58', '2021-12-08 22:40:09'),
(169, 20, 'Sreepur', 1, '2021-12-08 22:35:58', '2021-12-08 22:40:09'),
(170, 20, 'Sripur', 1, '2021-12-08 22:35:58', '2021-12-08 22:40:09'),
(171, 21, 'Gopalganj Sadar', 1, '2021-12-08 22:35:58', '2021-12-08 22:40:09'),
(172, 21, 'Kashiani', 1, '2021-12-08 22:35:58', '2021-12-08 22:40:09'),
(173, 21, 'Kotalipara', 1, '2021-12-08 22:35:58', '2021-12-08 22:40:09'),
(174, 21, 'Maksudpur', 1, '2021-12-08 22:35:58', '2021-12-08 22:40:09'),
(175, 21, 'Tungipara', 1, '2021-12-08 22:35:58', '2021-12-08 22:40:10'),
(176, 22, 'Bajitpur', 1, '2021-12-08 22:35:59', '2021-12-08 22:40:10'),
(177, 22, 'Bhairob', 1, '2021-12-08 22:35:59', '2021-12-08 22:40:10'),
(178, 22, 'Hossenpur', 1, '2021-12-08 22:35:59', '2021-12-08 22:40:10'),
(179, 22, 'Itna', 1, '2021-12-08 22:35:59', '2021-12-08 22:40:10'),
(180, 22, 'Karimganj', 1, '2021-12-08 22:35:59', '2021-12-08 22:40:10'),
(181, 22, 'Katiadi', 1, '2021-12-08 22:35:59', '2021-12-08 22:40:10'),
(182, 22, 'Kishoreganj Sadar', 1, '2021-12-08 22:35:59', '2021-12-08 22:40:10'),
(183, 22, 'Kuliarchar', 1, '2021-12-08 22:35:59', '2021-12-08 22:40:10'),
(184, 22, 'Mithamoin', 1, '2021-12-08 22:35:59', '2021-12-08 22:40:10'),
(185, 22, 'Nikli', 1, '2021-12-08 22:35:59', '2021-12-08 22:40:10'),
(186, 22, 'Ostagram', 1, '2021-12-08 22:35:59', '2021-12-08 22:40:10'),
(187, 22, 'Pakundia', 1, '2021-12-08 22:36:00', '2021-12-08 22:40:10'),
(188, 22, 'Tarial', 1, '2021-12-08 22:36:00', '2021-12-08 22:40:10'),
(189, 23, 'Barhamganj', 1, '2021-12-08 22:36:01', '2021-12-08 22:40:10'),
(190, 23, 'kalkini', 1, '2021-12-08 22:36:01', '2021-12-08 22:40:10'),
(191, 23, 'Madaripur Sadar', 1, '2021-12-08 22:36:01', '2021-12-08 22:40:10'),
(192, 23, 'Rajoir', 1, '2021-12-08 22:36:01', '2021-12-08 22:40:10'),
(193, 24, 'Doulatpur', 1, '2021-12-08 22:36:01', '2021-12-08 22:40:10'),
(194, 24, 'Gheor', 1, '2021-12-08 22:36:01', '2021-12-08 22:40:10'),
(195, 24, 'Lechhraganj', 1, '2021-12-08 22:36:01', '2021-12-08 22:40:10'),
(196, 24, 'Manikganj Sadar', 1, '2021-12-08 22:36:01', '2021-12-08 22:40:10'),
(197, 24, 'Saturia', 1, '2021-12-08 22:36:01', '2021-12-08 22:40:10'),
(198, 24, 'Shibloya', 1, '2021-12-08 22:36:01', '2021-12-08 22:40:10'),
(199, 24, 'Singari', 1, '2021-12-08 22:36:01', '2021-12-08 22:40:10'),
(200, 25, 'Gajaria', 1, '2021-12-08 22:36:02', '2021-12-08 22:40:10'),
(201, 25, 'Lohajong', 1, '2021-12-08 22:36:02', '2021-12-08 22:40:10'),
(202, 25, 'Munshiganj Sadar', 1, '2021-12-08 22:36:02', '2021-12-08 22:40:10'),
(203, 25, 'Sirajdikhan', 1, '2021-12-08 22:36:02', '2021-12-08 22:40:10'),
(204, 25, 'Srinagar', 1, '2021-12-08 22:36:02', '2021-12-08 22:40:10'),
(205, 25, 'Tangibari', 1, '2021-12-08 22:36:02', '2021-12-08 22:40:10'),
(206, 26, 'Araihazar', 1, '2021-12-08 22:36:03', '2021-12-08 22:40:10'),
(207, 26, 'Baidder Bazar', 1, '2021-12-08 22:36:03', '2021-12-08 22:40:10'),
(208, 26, 'Bandar', 1, '2021-12-08 22:36:03', '2021-12-08 22:40:10'),
(209, 26, 'Fatullah', 1, '2021-12-08 22:36:03', '2021-12-08 22:40:10'),
(210, 26, 'Narayanganj Sadar', 1, '2021-12-08 22:36:03', '2021-12-08 22:40:10'),
(211, 26, 'Rupganj', 1, '2021-12-08 22:36:03', '2021-12-08 22:40:10'),
(212, 26, 'Siddirganj', 1, '2021-12-08 22:36:03', '2021-12-08 22:40:10'),
(213, 27, 'Belabo', 1, '2021-12-08 22:36:04', '2021-12-08 22:40:10'),
(214, 27, 'Monohordi', 1, '2021-12-08 22:36:04', '2021-12-08 22:40:10'),
(215, 27, 'Narsingdi Sadar', 1, '2021-12-08 22:36:04', '2021-12-08 22:40:10'),
(216, 27, 'Palash', 1, '2021-12-08 22:36:04', '2021-12-08 22:40:10'),
(217, 27, 'Raypura', 1, '2021-12-08 22:36:04', '2021-12-08 22:40:10'),
(218, 27, 'Shibpur', 1, '2021-12-08 22:36:04', '2021-12-08 22:40:10'),
(219, 28, 'Baliakandi', 1, '2021-12-08 22:36:05', '2021-12-08 22:40:10'),
(220, 28, 'Pangsha', 1, '2021-12-08 22:36:05', '2021-12-08 22:40:11'),
(221, 28, 'Rajbari Sadar', 1, '2021-12-08 22:36:05', '2021-12-08 22:40:11'),
(222, 29, 'Bhedorganj', 1, '2021-12-08 22:36:05', '2021-12-08 22:40:11'),
(223, 29, 'Damudhya', 1, '2021-12-08 22:36:05', '2021-12-08 22:40:11'),
(224, 29, 'Gosairhat', 1, '2021-12-08 22:36:05', '2021-12-08 22:40:11'),
(225, 29, 'Jajira', 1, '2021-12-08 22:36:05', '2021-12-08 22:40:11'),
(226, 29, 'Naria', 1, '2021-12-08 22:36:05', '2021-12-08 22:40:11'),
(227, 29, 'Shariatpur Sadar', 1, '2021-12-08 22:36:05', '2021-12-08 22:40:11'),
(228, 30, 'Basail', 1, '2021-12-08 22:36:05', '2021-12-08 22:40:11'),
(229, 30, 'Bhuapur', 1, '2021-12-08 22:36:05', '2021-12-08 22:40:11'),
(230, 30, 'Delduar', 1, '2021-12-08 22:36:05', '2021-12-08 22:40:11'),
(231, 30, 'Ghatail', 1, '2021-12-08 22:36:05', '2021-12-08 22:40:11'),
(232, 30, 'Gopalpur', 1, '2021-12-08 22:36:05', '2021-12-08 22:40:11'),
(233, 30, 'Kashkaolia', 1, '2021-12-08 22:36:06', '2021-12-08 22:40:11'),
(234, 30, 'Madhupur', 1, '2021-12-08 22:36:06', '2021-12-08 22:40:11'),
(235, 30, 'Mirzapur', 1, '2021-12-08 22:36:06', '2021-12-08 22:40:12'),
(236, 30, 'Nagarpur', 1, '2021-12-08 22:36:06', '2021-12-08 22:40:12'),
(237, 30, 'Sakhipur', 1, '2021-12-08 22:36:06', '2021-12-08 22:40:12'),
(238, 30, 'Tangail Sadar', 1, '2021-12-08 22:36:06', '2021-12-08 22:40:12'),
(239, 31, 'Bagerhat Sadar', 1, '2021-12-08 22:36:07', '2021-12-08 22:40:12'),
(240, 31, 'Chalna Ankorage', 1, '2021-12-08 22:36:07', '2021-12-08 22:40:12'),
(241, 31, 'Chitalmari', 1, '2021-12-08 22:36:07', '2021-12-08 22:40:12'),
(242, 31, 'Fakirhat', 1, '2021-12-08 22:36:07', '2021-12-08 22:40:12'),
(243, 31, 'Kachua UPO', 1, '2021-12-08 22:36:07', '2021-12-08 22:40:12'),
(244, 31, 'Mollahat', 1, '2021-12-08 22:36:07', '2021-12-08 22:40:12'),
(245, 31, 'Morelganj', 1, '2021-12-08 22:36:07', '2021-12-08 22:40:12'),
(246, 31, 'Rampal', 1, '2021-12-08 22:36:07', '2021-12-08 22:40:12'),
(247, 31, 'Rayenda', 1, '2021-12-08 22:36:07', '2021-12-08 22:40:12'),
(248, 32, 'Alamdanga', 1, '2021-12-08 22:36:07', '2021-12-08 22:40:12'),
(249, 32, 'Chuadanga Sadar', 1, '2021-12-08 22:36:07', '2021-12-08 22:40:12'),
(250, 32, 'Damurhuda', 1, '2021-12-08 22:36:07', '2021-12-08 22:40:12'),
(251, 32, 'Doulatganj', 1, '2021-12-08 22:36:07', '2021-12-08 22:40:12'),
(252, 33, 'Bagharpara', 1, '2021-12-08 22:36:08', '2021-12-08 22:40:12'),
(253, 33, 'Chaugachha', 1, '2021-12-08 22:36:08', '2021-12-08 22:40:12'),
(254, 33, 'Jessore Sadar', 1, '2021-12-08 22:36:08', '2021-12-08 22:40:12'),
(255, 33, 'Jhikargachha', 1, '2021-12-08 22:36:08', '2021-12-08 22:40:12'),
(256, 33, 'Keshabpur', 1, '2021-12-08 22:36:08', '2021-12-08 22:40:12'),
(257, 33, 'Monirampur', 1, '2021-12-08 22:36:08', '2021-12-08 22:40:12'),
(258, 33, 'Noapara', 1, '2021-12-08 22:36:08', '2021-12-08 22:40:12'),
(259, 33, 'Sarsa', 1, '2021-12-08 22:36:08', '2021-12-08 22:40:12'),
(260, 34, 'Harinakundu', 1, '2021-12-08 22:36:09', '2021-12-08 22:40:12'),
(261, 34, 'Jhenaidah Sadar', 1, '2021-12-08 22:36:09', '2021-12-08 22:40:12'),
(262, 34, 'Kotchandpur', 1, '2021-12-08 22:36:09', '2021-12-08 22:40:12'),
(263, 34, 'Maheshpur', 1, '2021-12-08 22:36:09', '2021-12-08 22:40:12'),
(264, 34, 'Naldanga', 1, '2021-12-08 22:36:09', '2021-12-08 22:40:12'),
(265, 34, 'Shailakupa', 1, '2021-12-08 22:36:09', '2021-12-08 22:40:12'),
(266, 35, 'Alaipur', 1, '2021-12-08 22:36:09', '2021-12-08 22:40:12'),
(267, 35, 'Batiaghat', 1, '2021-12-08 22:36:09', '2021-12-08 22:40:12'),
(268, 35, 'Chalna Bazar', 1, '2021-12-08 22:36:09', '2021-12-08 22:40:12'),
(269, 35, 'Digalia', 1, '2021-12-08 22:36:09', '2021-12-08 22:40:12'),
(270, 35, 'Khulna Sadar', 1, '2021-12-08 22:36:09', '2021-12-08 22:40:12'),
(271, 35, 'Madinabad', 1, '2021-12-08 22:36:09', '2021-12-08 22:40:12'),
(272, 35, 'Paikgachha', 1, '2021-12-08 22:36:09', '2021-12-08 22:40:12'),
(273, 35, 'Phultala', 1, '2021-12-08 22:36:09', '2021-12-08 22:40:12'),
(274, 35, 'Sajiara', 1, '2021-12-08 22:36:09', '2021-12-08 22:40:12'),
(275, 35, 'Terakhada', 1, '2021-12-08 22:36:09', '2021-12-08 22:40:12'),
(276, 36, 'Bheramara', 1, '2021-12-08 22:36:10', '2021-12-08 22:40:12'),
(277, 36, 'Janipur', 1, '2021-12-08 22:36:10', '2021-12-08 22:40:12'),
(278, 36, 'Kumarkhali', 1, '2021-12-08 22:36:10', '2021-12-08 22:40:12'),
(279, 36, 'Kushtia Sadar', 1, '2021-12-08 22:36:10', '2021-12-08 22:40:12'),
(280, 36, 'Mirpur', 1, '2021-12-08 22:36:10', '2021-12-08 22:40:12'),
(281, 36, 'Rafayetpur', 1, '2021-12-08 22:36:10', '2021-12-08 22:40:12'),
(282, 37, 'Arpara', 1, '2021-12-08 22:36:11', '2021-12-08 22:40:12'),
(283, 37, 'Magura Sadar', 1, '2021-12-08 22:36:11', '2021-12-08 22:40:12'),
(284, 37, 'Mohammadpur', 1, '2021-12-08 22:36:11', '2021-12-08 22:40:12'),
(285, 37, 'Shripur', 1, '2021-12-08 22:36:11', '2021-12-08 22:40:12'),
(286, 38, 'Gangni', 1, '2021-12-08 22:36:12', '2021-12-08 22:40:12'),
(287, 38, 'Meherpur Sadar', 1, '2021-12-08 22:36:12', '2021-12-08 22:40:12'),
(288, 39, 'Kalia', 1, '2021-12-08 22:36:12', '2021-12-08 22:40:12'),
(289, 39, 'Laxmipasha', 1, '2021-12-08 22:36:12', '2021-12-08 22:40:12'),
(290, 39, 'Mohajan', 1, '2021-12-08 22:36:12', '2021-12-08 22:40:12'),
(291, 39, 'Narail Sadar', 1, '2021-12-08 22:36:12', '2021-12-08 22:40:12'),
(292, 40, 'Ashashuni', 1, '2021-12-08 22:36:12', '2021-12-08 22:40:12'),
(293, 40, 'Debbhata', 1, '2021-12-08 22:36:12', '2021-12-08 22:40:12'),
(294, 40, 'Kalaroa', 1, '2021-12-08 22:36:12', '2021-12-08 22:40:12'),
(295, 40, 'Kaliganj UPO', 1, '2021-12-08 22:36:12', '2021-12-08 22:40:12'),
(296, 40, 'Nakipur', 1, '2021-12-08 22:36:12', '2021-12-08 22:40:12'),
(297, 40, 'Satkhira Sadar', 1, '2021-12-08 22:36:12', '2021-12-08 22:40:12'),
(298, 40, 'Taala', 1, '2021-12-08 22:36:12', '2021-12-08 22:40:12'),
(299, 41, 'Dewangonj', 1, '2021-12-08 22:36:13', '2021-12-08 22:40:12'),
(300, 41, 'Islampur', 1, '2021-12-08 22:36:13', '2021-12-08 22:40:12'),
(301, 41, 'Jamalpur', 1, '2021-12-08 22:36:13', '2021-12-08 22:40:12'),
(302, 41, 'Malandah', 1, '2021-12-08 22:36:13', '2021-12-08 22:40:12'),
(303, 41, 'Mathargonj', 1, '2021-12-08 22:36:13', '2021-12-08 22:40:12'),
(304, 41, 'Shorishabari', 1, '2021-12-08 22:36:13', '2021-12-08 22:40:13'),
(305, 42, 'Bhaluka', 1, '2021-12-08 22:36:13', '2021-12-08 22:40:13'),
(306, 42, 'Fulbaria', 1, '2021-12-08 22:36:13', '2021-12-08 22:40:13'),
(307, 42, 'Gaforgaon', 1, '2021-12-08 22:36:13', '2021-12-08 22:40:13'),
(308, 42, 'Gouripur', 1, '2021-12-08 22:36:13', '2021-12-08 22:40:13'),
(309, 42, 'Haluaghat', 1, '2021-12-08 22:36:13', '2021-12-08 22:40:13'),
(310, 42, 'Isshwargonj', 1, '2021-12-08 22:36:13', '2021-12-08 22:40:13'),
(311, 42, 'Muktagachh', 1, '2021-12-08 22:36:13', '2021-12-08 22:40:13'),
(312, 42, 'Mymensingh Sadar', 1, '2021-12-08 22:36:14', '2021-12-08 22:40:13'),
(313, 42, 'Nandail', 1, '2021-12-08 22:36:14', '2021-12-08 22:40:13'),
(314, 42, 'Phulpur', 1, '2021-12-08 22:36:14', '2021-12-08 22:40:13'),
(315, 42, 'Trishal', 1, '2021-12-08 22:36:14', '2021-12-08 22:40:13'),
(316, 43, 'Susung Durgapur', 1, '2021-12-08 22:36:15', '2021-12-08 22:40:13'),
(317, 43, 'Atpara', 1, '2021-12-08 22:36:15', '2021-12-08 22:40:13'),
(318, 43, 'Barhatta', 1, '2021-12-08 22:36:15', '2021-12-08 22:40:13'),
(319, 43, 'Dharmapasha', 1, '2021-12-08 22:36:15', '2021-12-08 22:40:13'),
(320, 43, 'Dhobaura', 1, '2021-12-08 22:36:15', '2021-12-08 22:40:13'),
(321, 43, 'Kalmakanda', 1, '2021-12-08 22:36:15', '2021-12-08 22:40:13'),
(322, 43, 'Kendua', 1, '2021-12-08 22:36:15', '2021-12-08 22:40:14'),
(323, 43, 'Khaliajuri', 1, '2021-12-08 22:36:15', '2021-12-08 22:40:14'),
(324, 43, 'Madan', 1, '2021-12-08 22:36:15', '2021-12-08 22:40:14'),
(325, 43, 'Moddhynagar', 1, '2021-12-08 22:36:15', '2021-12-08 22:40:14'),
(326, 43, 'Mohanganj', 1, '2021-12-08 22:36:15', '2021-12-08 22:40:14'),
(327, 43, 'Netrokona Sadar', 1, '2021-12-08 22:36:15', '2021-12-08 22:40:14'),
(328, 43, 'Purbadhola', 1, '2021-12-08 22:36:15', '2021-12-08 22:40:14'),
(329, 43, 'Susung Durgapur', 1, '2021-12-08 22:36:15', '2021-12-08 22:40:14'),
(330, 43, 'Atpara', 1, '2021-12-08 22:36:15', '2021-12-08 22:40:14'),
(331, 43, 'Barhatta', 1, '2021-12-08 22:36:15', '2021-12-08 22:40:14'),
(332, 43, 'Dharmapasha', 1, '2021-12-08 22:36:15', '2021-12-08 22:40:14'),
(333, 43, 'Dhobaura', 1, '2021-12-08 22:36:15', '2021-12-08 22:40:14'),
(334, 43, 'Kalmakanda', 1, '2021-12-08 22:36:15', '2021-12-08 22:40:14'),
(335, 43, 'Kendua', 1, '2021-12-08 22:36:15', '2021-12-08 22:40:14'),
(336, 43, 'Khaliajuri', 1, '2021-12-08 22:36:15', '2021-12-08 22:40:14'),
(337, 43, 'Madan', 1, '2021-12-08 22:36:15', '2021-12-08 22:40:14'),
(338, 43, 'Moddhynagar', 1, '2021-12-08 22:36:15', '2021-12-08 22:40:14'),
(339, 43, 'Mohanganj', 1, '2021-12-08 22:36:15', '2021-12-08 22:40:14'),
(340, 43, 'Netrokona Sadar', 1, '2021-12-08 22:36:15', '2021-12-08 22:40:14'),
(341, 44, 'Bakshigonj', 1, '2021-12-08 22:36:17', '2021-12-08 22:40:14'),
(342, 44, 'Jhinaigati', 1, '2021-12-08 22:36:17', '2021-12-08 22:40:14'),
(343, 44, 'Nakla', 1, '2021-12-08 22:36:17', '2021-12-08 22:40:14'),
(344, 44, 'Nalitabari', 1, '2021-12-08 22:36:17', '2021-12-08 22:40:14'),
(345, 44, 'Sherpur Shadar', 1, '2021-12-08 22:36:17', '2021-12-08 22:40:14'),
(346, 44, 'Shribardi', 1, '2021-12-08 22:36:17', '2021-12-08 22:40:14'),
(347, 45, 'Alamdighi', 1, '2021-12-08 22:36:17', '2021-12-08 22:40:14'),
(348, 45, 'Bogra Sadar', 1, '2021-12-08 22:36:17', '2021-12-08 22:40:14'),
(349, 45, 'Dhunat', 1, '2021-12-08 22:36:17', '2021-12-08 22:40:14'),
(350, 45, 'Dupchachia', 1, '2021-12-08 22:36:17', '2021-12-08 22:40:14'),
(351, 45, 'Gabtoli', 1, '2021-12-08 22:36:17', '2021-12-08 22:40:14'),
(352, 45, 'Kahalu', 1, '2021-12-08 22:36:17', '2021-12-08 22:40:14'),
(353, 45, 'Nandigram', 1, '2021-12-08 22:36:17', '2021-12-08 22:40:14'),
(354, 45, 'Sariakandi', 1, '2021-12-08 22:36:17', '2021-12-08 22:40:14'),
(355, 45, 'Sherpur', 1, '2021-12-08 22:36:17', '2021-12-08 22:40:14'),
(356, 45, 'Shibganj', 1, '2021-12-08 22:36:17', '2021-12-08 22:40:14'),
(357, 45, 'Sonatola', 1, '2021-12-08 22:36:17', '2021-12-08 22:40:14'),
(358, 46, 'Akkelpur', 1, '2021-12-08 22:36:18', '2021-12-08 22:40:14'),
(359, 46, 'Joypurhat Sadar', 1, '2021-12-08 22:36:18', '2021-12-08 22:40:14'),
(360, 46, 'kalai', 1, '2021-12-08 22:36:18', '2021-12-08 22:40:14'),
(361, 46, 'Khetlal', 1, '2021-12-08 22:36:18', '2021-12-08 22:40:14'),
(362, 46, 'panchbibi', 1, '2021-12-08 22:36:18', '2021-12-08 22:40:14'),
(363, 47, 'Ahsanganj', 1, '2021-12-08 22:36:19', '2021-12-08 22:40:14'),
(364, 47, 'Badalgachhi', 1, '2021-12-08 22:36:19', '2021-12-08 22:40:14'),
(365, 47, 'Dhamuirhat', 1, '2021-12-08 22:36:19', '2021-12-08 22:40:14'),
(366, 47, 'Mahadebpur', 1, '2021-12-08 22:36:19', '2021-12-08 22:40:14'),
(367, 47, 'Naogaon Sadar', 1, '2021-12-08 22:36:19', '2021-12-08 22:40:14'),
(368, 47, 'Niamatpur', 1, '2021-12-08 22:36:19', '2021-12-08 22:40:14'),
(369, 47, 'Nitpur', 1, '2021-12-08 22:36:19', '2021-12-08 22:40:14'),
(370, 47, 'Patnitala', 1, '2021-12-08 22:36:19', '2021-12-08 22:40:14'),
(371, 47, 'Prasadpur', 1, '2021-12-08 22:36:19', '2021-12-08 22:40:14'),
(372, 47, 'Raninagar', 1, '2021-12-08 22:36:19', '2021-12-08 22:40:14'),
(373, 47, 'Sapahar', 1, '2021-12-08 22:36:19', '2021-12-08 22:40:14'),
(374, 48, 'Gopalpur UPO', 1, '2021-12-08 22:36:19', '2021-12-08 22:40:14'),
(375, 48, 'Harua', 1, '2021-12-08 22:36:19', '2021-12-08 22:40:14'),
(376, 48, 'Hatgurudaspur', 1, '2021-12-08 22:36:19', '2021-12-08 22:40:14'),
(377, 48, 'Laxman', 1, '2021-12-08 22:36:19', '2021-12-08 22:40:15'),
(378, 48, 'Natore Sadar', 1, '2021-12-08 22:36:19', '2021-12-08 22:40:15'),
(379, 48, 'Singra', 1, '2021-12-08 22:36:19', '2021-12-08 22:40:15'),
(380, 49, 'Bholahat', 1, '2021-12-08 22:36:19', '2021-12-08 22:40:15'),
(381, 49, 'Chapinawabganj Sadar', 1, '2021-12-08 22:36:20', '2021-12-08 22:40:15'),
(382, 49, 'Nachol', 1, '2021-12-08 22:36:20', '2021-12-08 22:40:15'),
(383, 49, 'Rohanpur', 1, '2021-12-08 22:36:20', '2021-12-08 22:40:15'),
(384, 49, 'Shibganj U.P.O', 1, '2021-12-08 22:36:20', '2021-12-08 22:40:15'),
(385, 50, 'Banwarinagar', 1, '2021-12-08 22:36:20', '2021-12-08 22:40:15'),
(386, 50, 'Bera', 1, '2021-12-08 22:36:20', '2021-12-08 22:40:15'),
(387, 50, 'Bhangura', 1, '2021-12-08 22:36:20', '2021-12-08 22:40:15'),
(388, 50, 'Chatmohar', 1, '2021-12-08 22:36:20', '2021-12-08 22:40:15'),
(389, 50, 'Debottar', 1, '2021-12-08 22:36:20', '2021-12-08 22:40:15'),
(390, 50, 'Ishwardi', 1, '2021-12-08 22:36:20', '2021-12-08 22:40:15'),
(391, 50, 'Pabna Sadar', 1, '2021-12-08 22:36:20', '2021-12-08 22:40:15'),
(392, 50, 'Sathia', 1, '2021-12-08 22:36:20', '2021-12-08 22:40:15'),
(393, 50, 'Sujanagar', 1, '2021-12-08 22:36:20', '2021-12-08 22:40:15'),
(394, 51, 'Bagha', 1, '2021-12-08 22:36:21', '2021-12-08 22:40:15'),
(395, 51, 'Bhabaniganj', 1, '2021-12-08 22:36:22', '2021-12-08 22:40:15'),
(396, 51, 'Charghat', 1, '2021-12-08 22:36:22', '2021-12-08 22:40:15'),
(397, 51, 'Durgapur', 1, '2021-12-08 22:36:22', '2021-12-08 22:40:15'),
(398, 51, 'Godagari', 1, '2021-12-08 22:36:22', '2021-12-08 22:40:15'),
(399, 51, 'Khod Mohanpur', 1, '2021-12-08 22:36:22', '2021-12-08 22:40:15'),
(400, 51, 'Lalitganj', 1, '2021-12-08 22:36:22', '2021-12-08 22:40:15'),
(401, 51, 'Putia', 1, '2021-12-08 22:36:22', '2021-12-08 22:40:15'),
(402, 51, 'Rajshahi Sadar', 1, '2021-12-08 22:36:22', '2021-12-08 22:40:15'),
(403, 51, 'Tanor', 1, '2021-12-08 22:36:22', '2021-12-08 22:40:15'),
(404, 52, 'Baiddya Jam Toil', 1, '2021-12-08 22:36:22', '2021-12-08 22:40:15'),
(405, 52, 'Belkuchi', 1, '2021-12-08 22:36:22', '2021-12-08 22:40:15'),
(406, 52, 'Dhangora', 1, '2021-12-08 22:36:22', '2021-12-08 22:40:15'),
(407, 52, 'Kazipur', 1, '2021-12-08 22:36:22', '2021-12-08 22:40:15'),
(408, 52, 'Shahjadpur', 1, '2021-12-08 22:36:22', '2021-12-08 22:40:15'),
(409, 52, 'Sirajganj Sadar', 1, '2021-12-08 22:36:22', '2021-12-08 22:40:15'),
(410, 52, 'Tarash', 1, '2021-12-08 22:36:22', '2021-12-08 22:40:15'),
(411, 52, 'Ullapara', 1, '2021-12-08 22:36:22', '2021-12-08 22:40:15'),
(412, 53, 'Bangla Hili', 1, '2021-12-08 22:36:22', '2021-12-08 22:40:15'),
(413, 53, 'Biral', 1, '2021-12-08 22:36:23', '2021-12-08 22:40:15'),
(414, 53, 'Birampur', 1, '2021-12-08 22:36:23', '2021-12-08 22:40:15'),
(415, 53, 'Birganj', 1, '2021-12-08 22:36:23', '2021-12-08 22:40:15'),
(416, 53, 'Chrirbandar', 1, '2021-12-08 22:36:23', '2021-12-08 22:40:16'),
(417, 53, 'Dinajpur Sadar', 1, '2021-12-08 22:36:23', '2021-12-08 22:40:16'),
(418, 53, 'Khansama', 1, '2021-12-08 22:36:23', '2021-12-08 22:40:16'),
(419, 53, 'Maharajganj', 1, '2021-12-08 22:36:23', '2021-12-08 22:40:16'),
(420, 53, 'Nababganj', 1, '2021-12-08 22:36:23', '2021-12-08 22:40:16'),
(421, 53, 'Osmanpur', 1, '2021-12-08 22:36:23', '2021-12-08 22:40:16'),
(422, 53, 'Parbatipur', 1, '2021-12-08 22:36:23', '2021-12-08 22:40:16'),
(423, 53, 'Phulbari', 1, '2021-12-08 22:36:24', '2021-12-08 22:40:16'),
(424, 53, 'Setabganj', 1, '2021-12-08 22:36:24', '2021-12-08 22:40:16'),
(425, 54, 'Bonarpara', 1, '2021-12-08 22:36:24', '2021-12-08 22:40:16'),
(426, 54, 'Gaibandha Sadar', 1, '2021-12-08 22:36:24', '2021-12-08 22:40:16'),
(427, 54, 'Gobindaganj', 1, '2021-12-08 22:36:24', '2021-12-08 22:40:16'),
(428, 54, 'Palashbari', 1, '2021-12-08 22:36:24', '2021-12-08 22:40:16'),
(429, 54, 'Phulchhari', 1, '2021-12-08 22:36:24', '2021-12-08 22:40:16'),
(430, 54, 'Saadullapur', 1, '2021-12-08 22:36:24', '2021-12-08 22:40:16'),
(431, 54, 'Sundarganj', 1, '2021-12-08 22:36:24', '2021-12-08 22:40:16'),
(432, 55, 'Bhurungamari', 1, '2021-12-08 22:36:24', '2021-12-08 22:40:16'),
(433, 55, 'Chilmari', 1, '2021-12-08 22:36:24', '2021-12-08 22:40:16'),
(434, 55, 'Kurigram Sadar', 1, '2021-12-08 22:36:24', '2021-12-08 22:40:16'),
(435, 55, 'Nageshwar', 1, '2021-12-08 22:36:24', '2021-12-08 22:40:16'),
(436, 55, 'Rajarhat', 1, '2021-12-08 22:36:24', '2021-12-08 22:40:16'),
(437, 55, 'Rajibpur', 1, '2021-12-08 22:36:24', '2021-12-08 22:40:16'),
(438, 55, 'Roumari', 1, '2021-12-08 22:36:24', '2021-12-08 22:40:16'),
(439, 55, 'Ulipur', 1, '2021-12-08 22:36:24', '2021-12-08 22:40:16'),
(440, 56, 'Aditmari', 1, '2021-12-08 22:36:25', '2021-12-08 22:40:16'),
(441, 56, 'Hatibandha', 1, '2021-12-08 22:36:25', '2021-12-08 22:40:16'),
(442, 56, 'Lalmonirhat Sadar', 1, '2021-12-08 22:36:25', '2021-12-08 22:40:16'),
(443, 56, 'Patgram', 1, '2021-12-08 22:36:25', '2021-12-08 22:40:16'),
(444, 56, 'Tushbhandar', 1, '2021-12-08 22:36:25', '2021-12-08 22:40:16'),
(445, 57, 'Dimla', 1, '2021-12-08 22:36:26', '2021-12-08 22:40:16'),
(446, 57, 'Domar', 1, '2021-12-08 22:36:26', '2021-12-08 22:40:16'),
(447, 57, 'Jaldhaka', 1, '2021-12-08 22:36:26', '2021-12-08 22:40:17'),
(448, 57, 'Kishoriganj', 1, '2021-12-08 22:36:26', '2021-12-08 22:40:17'),
(449, 57, 'Nilphamari Sadar', 1, '2021-12-08 22:36:26', '2021-12-08 22:40:17'),
(450, 57, 'Syedpur', 1, '2021-12-08 22:36:26', '2021-12-08 22:40:17'),
(451, 58, 'Boda', 1, '2021-12-08 22:36:26', '2021-12-08 22:40:17'),
(452, 58, 'Chotto Dab', 1, '2021-12-08 22:36:26', '2021-12-08 22:40:17'),
(453, 58, 'Dabiganj', 1, '2021-12-08 22:36:26', '2021-12-08 22:40:17'),
(454, 58, 'Panchagra Sadar', 1, '2021-12-08 22:36:26', '2021-12-08 22:40:17'),
(455, 58, 'Tetulia', 1, '2021-12-08 22:36:26', '2021-12-08 22:40:17'),
(456, 59, 'Badarganj', 1, '2021-12-08 22:36:26', '2021-12-08 22:40:17'),
(457, 59, 'Gangachara', 1, '2021-12-08 22:36:26', '2021-12-08 22:40:17'),
(458, 59, 'Kaunia', 1, '2021-12-08 22:36:26', '2021-12-08 22:40:17'),
(459, 59, 'Mithapukur', 1, '2021-12-08 22:36:26', '2021-12-08 22:40:17'),
(460, 59, 'Pirgachha', 1, '2021-12-08 22:36:26', '2021-12-08 22:40:17'),
(461, 59, 'Rangpur Sadar', 1, '2021-12-08 22:36:26', '2021-12-08 22:40:17'),
(462, 59, 'Taraganj', 1, '2021-12-08 22:36:26', '2021-12-08 22:40:17'),
(463, 60, 'Baliadangi', 1, '2021-12-08 22:36:26', '2021-12-08 22:40:17'),
(464, 60, 'Jibanpur', 1, '2021-12-08 22:36:26', '2021-12-08 22:40:17'),
(465, 60, 'Pirganj', 1, '2021-12-08 22:36:26', '2021-12-08 22:40:17'),
(466, 60, 'Rani Sankail', 1, '2021-12-08 22:36:26', '2021-12-08 22:40:17'),
(467, 60, 'Thakurgaon Sadar', 1, '2021-12-08 22:36:26', '2021-12-08 22:40:17'),
(468, 61, 'Azmireeganj', 1, '2021-12-08 22:36:27', '2021-12-08 22:40:17'),
(469, 61, 'Bahubal', 1, '2021-12-08 22:36:27', '2021-12-08 22:40:17'),
(470, 61, 'Baniachang', 1, '2021-12-08 22:36:27', '2021-12-08 22:40:17'),
(471, 61, 'Chunarughat', 1, '2021-12-08 22:36:27', '2021-12-08 22:40:17'),
(472, 61, 'Habiganj Sadar', 1, '2021-12-08 22:36:27', '2021-12-08 22:40:17'),
(473, 61, 'Kalauk', 1, '2021-12-08 22:36:27', '2021-12-08 22:40:17'),
(474, 61, 'Madhabpur', 1, '2021-12-08 22:36:27', '2021-12-08 22:40:17'),
(475, 61, 'Nabiganj', 1, '2021-12-08 22:36:27', '2021-12-08 22:40:17'),
(476, 62, 'Baralekha', 1, '2021-12-08 22:36:28', '2021-12-08 22:40:17'),
(477, 62, 'Kamalganj', 1, '2021-12-08 22:36:28', '2021-12-08 22:40:17'),
(478, 62, 'Kulaura', 1, '2021-12-08 22:36:28', '2021-12-08 22:40:17'),
(479, 62, 'Maulvi Bazar Sadar', 1, '2021-12-08 22:36:28', '2021-12-08 22:40:17'),
(480, 62, 'Rajnagar', 1, '2021-12-08 22:36:28', '2021-12-08 22:40:17'),
(481, 62, 'Srimangal', 1, '2021-12-08 22:36:28', '2021-12-08 22:40:17'),
(482, 63, 'Bishamsarpur', 1, '2021-12-08 22:36:29', '2021-12-08 22:40:17'),
(483, 63, 'Chhatak', 1, '2021-12-08 22:36:29', '2021-12-08 22:40:17'),
(484, 63, 'Dhirai Chandpur', 1, '2021-12-08 22:36:29', '2021-12-08 22:40:17'),
(485, 63, 'Duara bazar', 1, '2021-12-08 22:36:29', '2021-12-08 22:40:17'),
(486, 63, 'Ghungiar', 1, '2021-12-08 22:36:29', '2021-12-08 22:40:17'),
(487, 63, 'Jagnnathpur', 1, '2021-12-08 22:36:29', '2021-12-08 22:40:17'),
(488, 63, 'Sachna', 1, '2021-12-08 22:36:29', '2021-12-08 22:40:17'),
(489, 63, 'Sunamganj Sadar', 1, '2021-12-08 22:36:29', '2021-12-08 22:40:17'),
(490, 63, 'Tahirpur', 1, '2021-12-08 22:36:29', '2021-12-08 22:40:17'),
(491, 64, 'Balaganj', 1, '2021-12-08 22:36:31', '2021-12-08 22:40:17'),
(492, 64, 'Bianibazar', 1, '2021-12-08 22:36:31', '2021-12-08 22:40:17'),
(493, 64, 'Bishwanath', 1, '2021-12-08 22:36:31', '2021-12-08 22:40:17'),
(494, 64, 'Fenchuganj', 1, '2021-12-08 22:36:31', '2021-12-08 22:40:17'),
(495, 64, 'Goainhat', 1, '2021-12-08 22:36:31', '2021-12-08 22:40:17'),
(496, 64, 'Gopalganj', 1, '2021-12-08 22:36:31', '2021-12-08 22:40:17'),
(497, 64, 'Jaintapur', 1, '2021-12-08 22:36:31', '2021-12-08 22:40:17'),
(498, 64, 'Jakiganj', 1, '2021-12-08 22:36:31', '2021-12-08 22:40:17'),
(499, 64, 'Kanaighat', 1, '2021-12-08 22:36:31', '2021-12-08 22:40:17'),
(500, 64, 'Kompanyganj', 1, '2021-12-08 22:36:31', '2021-12-08 22:40:17'),
(501, 64, 'Sylhet Sadar', 1, '2021-12-08 22:36:31', '2021-12-08 22:40:17');

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
(1, 1, 'Zakir Hossain', 'zakir7dipu@gmail.com', NULL, '$2y$10$aJbWYgZGlz533z4HbbriF.hzd5SFEbqxBJTHZok/UFS.D3Iuytv8G', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-10-20 22:28:53', '2021-10-20 22:28:53'),
(2, 3, 'Faidul', 'faidul@mail.com', NULL, '$2y$10$ISj2.CQkFOAon7gLht2w4.maxxhJUAxQlJMgjJwgRRXvStdkWjUla', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-08 22:41:20', '2021-12-08 22:41:20'),
(5, 2, 'Nokib Mahamud', 'nokib@mail.com', NULL, '$2y$10$NlT/dOcMzBN6aXHrP4MBlOcGVVlI8nbqHYnGjH7jMDHGZWtzhtYHG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-12-15 23:36:36', '2021-12-15 23:36:36');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accepted_by_admins`
--
ALTER TABLE `accepted_by_admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `advertisements`
--
ALTER TABLE `advertisements`
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
-- Indexes for table `cetegory_sections`
--
ALTER TABLE `cetegory_sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client_orders`
--
ALTER TABLE `client_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `company_infos`
--
ALTER TABLE `company_infos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_messages`
--
ALTER TABLE `contact_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `country_lists`
--
ALTER TABLE `country_lists`
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
-- Indexes for table `feature_products`
--
ALTER TABLE `feature_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `general_settings`
--
ALTER TABLE `general_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `info_sections`
--
ALTER TABLE `info_sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `new_arrival_products_sections`
--
ALTER TABLE `new_arrival_products_sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ordered_products`
--
ALTER TABLE `ordered_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_shipping_addresses`
--
ALTER TABLE `order_shipping_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page_sections`
--
ALTER TABLE `page_sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

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
-- Indexes for table `product_filter_gallery_sections`
--
ALTER TABLE `product_filter_gallery_sections`
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
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

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
-- Indexes for table `subscribtions`
--
ALTER TABLE `subscribtions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscribtions_email_unique` (`email`);

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
-- AUTO_INCREMENT for table `accepted_by_admins`
--
ALTER TABLE `accepted_by_admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `advertisements`
--
ALTER TABLE `advertisements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `attribute_items`
--
ALTER TABLE `attribute_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `blog_posts`
--
ALTER TABLE `blog_posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `blog_post_comment_settings`
--
ALTER TABLE `blog_post_comment_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `cetegory_sections`
--
ALTER TABLE `cetegory_sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `client_orders`
--
ALTER TABLE `client_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `company_infos`
--
ALTER TABLE `company_infos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `contact_messages`
--
ALTER TABLE `contact_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `country_lists`
--
ALTER TABLE `country_lists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=250;

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
-- AUTO_INCREMENT for table `feature_products`
--
ALTER TABLE `feature_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `general_settings`
--
ALTER TABLE `general_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `info_sections`
--
ALTER TABLE `info_sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `new_arrival_products_sections`
--
ALTER TABLE `new_arrival_products_sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ordered_products`
--
ALTER TABLE `ordered_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `order_shipping_addresses`
--
ALTER TABLE `order_shipping_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `page_sections`
--
ALTER TABLE `page_sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `product_filter_gallery_sections`
--
ALTER TABLE `product_filter_gallery_sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `profiles`
--
ALTER TABLE `profiles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `social_media_links`
--
ALTER TABLE `social_media_links`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `subscribtions`
--
ALTER TABLE `subscribtions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `team_invitations`
--
ALTER TABLE `team_invitations`
  ADD CONSTRAINT `team_invitations_team_id_foreign` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
