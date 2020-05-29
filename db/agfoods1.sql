-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 11, 2019 at 07:04 AM
-- Server version: 5.7.23
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `agfoods1`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
CREATE TABLE IF NOT EXISTS `addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(100) NOT NULL,
  `address_type` varchar(100) NOT NULL,
  `flat_no` varchar(100) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `landmark` varchar(200) DEFAULT NULL,
  `phone_no` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `user_id`, `address_type`, `flat_no`, `address`, `landmark`, `phone_no`, `created_at`, `updated_at`) VALUES
(4, '12', 'home', '654', 'dsfgc fdg sdfg dfg', 'rtygh fghj', '541242', '2019-09-10 13:45:31', '2019-09-10 13:45:31'),
(3, '12', 'home', '654', 'dsfgc fdg sdfg dfg', 'rtygh fghj', '541242', '2019-09-06 14:11:00', '2019-09-06 14:11:00'),
(5, '12', 'home', '654', 'dsfgc fdg sdfg dfg', 'rtygh fghj', '541242', '2019-09-11 11:27:22', '2019-09-11 11:27:22'),
(6, '12', 'home', '654', 'dsfgc fdg sdfg dfg', 'rtygh fghj', '541242', '2019-09-11 11:28:39', '2019-09-11 11:28:39'),
(7, '12', 'home', '654', 'dsfgc fdg sdfg dfg', 'rtygh fghj', '541242', '2019-09-11 11:32:39', '2019-09-11 11:32:39'),
(8, '12', 'home', '654', 'dsfgc fdg sdfg dfg', 'rtygh fghj', '541242', '2019-09-11 18:14:36', '2019-09-11 18:14:36'),
(9, '12', 'Home', '27E, Dhawalgiri Apartments', 'New Kondli Road, Sector 11, Noida', 'Nehru International School', '9041411349', '2019-09-11 18:19:38', '2019-09-11 18:19:38'),
(14, '23', 'Work Address', 'Suite No. 106, Bsi Park', '140, H Block, Sector 63, Noida, Uttar Pradesh 201301, India', 'Bsi Business Park', '7766994705', '2019-09-12 11:47:26', '2019-09-12 18:52:08'),
(13, '23', 'Home Address', '2E, Dhawalgiri Apartments', 'New Kondli Road, Sector 11, Noida', 'Nehru International School', '9041411349', '2019-09-12 11:15:56', '2019-09-12 12:08:13'),
(17, '27', 'Home Address', 'b 78', 'E-54, 1st Cross Ave, Block E, Alpha I, Greater Noida, Uttar Pradesh 201308, India', 'fvjjfd', '785026954485', '2019-09-17 12:18:42', '2019-09-17 12:18:42'),
(16, '28', 'Home Address', 'b 23', '1st floor 103 harsha mall,alpha I commercial belt, Greater Noida, Uttar Pradesh, India', 'omichrone', '8090563285', '2019-09-17 12:12:50', '2019-09-17 13:01:23');

-- --------------------------------------------------------

--
-- Table structure for table `address_type`
--

DROP TABLE IF EXISTS `address_type`;
CREATE TABLE IF NOT EXISTS `address_type` (
  `id` int(25) NOT NULL AUTO_INCREMENT,
  `address_type` varchar(300) NOT NULL,
  `address` varchar(600) NOT NULL,
  `landmark` varchar(100) DEFAULT NULL,
  `phone_no` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `banner`
--

DROP TABLE IF EXISTS `banner`;
CREATE TABLE IF NOT EXISTS `banner` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `banner`
--

INSERT INTO `banner` (`id`, `title`, `image`, `created_at`, `updated_at`) VALUES
(2, '1', 'http://agfoods.in/upload/banner/image1568705794.jpeg', '2019-09-17 11:36:34', '2019-09-17 11:36:34'),
(7, 'oiuy', 'upload/banner/image1568800587.jpeg', '2019-09-18 04:26:27', '2019-09-18 04:26:27');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_boy`
--

DROP TABLE IF EXISTS `delivery_boy`;
CREATE TABLE IF NOT EXISTS `delivery_boy` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `userid` int(255) NOT NULL,
  `name` varchar(200) NOT NULL,
  `address` varchar(500) NOT NULL,
  `image` varchar(1000) NOT NULL,
  `city` varchar(100) NOT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `mobileno` varchar(20) NOT NULL,
  `alternate_mobile` varchar(20) NOT NULL,
  `aadhar` varchar(200) DEFAULT NULL,
  `pancard` varchar(200) DEFAULT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(255) NOT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `bank_account_holder` varchar(255) DEFAULT NULL,
  `bank_account_no` varchar(255) DEFAULT NULL,
  `ifsc_code` varchar(255) DEFAULT NULL,
  `check_in` int(11) DEFAULT NULL,
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `updated_at` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `delivery_boy`
--

INSERT INTO `delivery_boy` (`id`, `userid`, `name`, `address`, `image`, `city`, `latitude`, `longitude`, `mobileno`, `alternate_mobile`, `aadhar`, `pancard`, `email`, `password`, `bank_name`, `bank_account_holder`, `bank_account_no`, `ifsc_code`, `check_in`, `created_at`, `updated_at`) VALUES
(16, 42, 'RITIK', 'MNB', 'upload/deliveryboy/image1568802243.jpeg', 'KJH', NULL, NULL, '0987654', '98765', '98765', '9876', 'KJHIUIUIU@GMAIL.COM', '$2y$10$7WLbfEvqwdb2FqOxuXs25uOGDxsViDZX7gTHAwJPq/fVIy8OgH9Yy', 'IUY', 'KJHG', '09876', 'JHV', NULL, '2019-09-18 10:24:03.622092', '2019-09-18 04:54:03.000000'),
(15, 41, 'Rakesh', 'noida', 'upload/deliveryboy/image1565164227.png', 'Noida', NULL, NULL, '9074200445', '9340564510', '9876567876', 'jhg5678', 'delivery@gmail.com', '$2y$10$FSL3Fi5w6bdUlzIaPqhS7.qDyfXisIVsBscEfPSbbML9JH4vgvhyK', 'sbi', 'rakesh', '987654', 'kjhg9876', 1, '2019-10-06 15:26:40.064294', '2019-10-05 04:24:49.000000'),
(18, 50, 'oiuylokjhg', 'lkjhg', 'upload/deliveryboy/image1568801483.jpeg', 'Noida', NULL, NULL, '98765', '98765', NULL, '9876', 'iuyt@gmail.com', '$2y$10$M3NxrB5aYoxsE4aF34OYouJusFRiUGCBWCPQMa5bccoPKR61Vp0iS', 'sdfgh', 'kjhg', '87654567', 'hghg', 1, '2019-10-06 17:15:25.534039', '2019-09-18 04:41:24.000000');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
CREATE TABLE IF NOT EXISTS `menu` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `restaurant_id` int(255) NOT NULL,
  `restaurant_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `servetype` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(1500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `categories` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(255) DEFAULT NULL,
  `status` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `restaurant_id`, `restaurant_name`, `name`, `servetype`, `price`, `image`, `categories`, `category_id`, `status`, `created_at`, `updated_at`) VALUES
(15, 40, 'Grill', 'papdi', 'veg', '210', 'https://via.placeholder.com/500', 'south indian', 0, NULL, '2019-08-09 12:47:38', '2019-08-09 12:47:38'),
(17, 40, 'Grill', 'dosa b', 'nonveg', '200', 'https://via.placeholder.com/500', 'south indian', 0, '0', '2019-08-10 04:09:15', '2019-08-10 04:11:00'),
(18, 43, 'Grill', 'lkjhg', 'veg', '0987', 'https://via.placeholder.com/500', 'south indian', 0, NULL, '2019-08-10 04:18:15', '2019-08-10 04:18:15'),
(19, 43, 'Grill', 'jhgfghjkjhg', 'nonveg', '0987', 'https://via.placeholder.com/500', 'chinese', 0, NULL, '2019-08-10 04:20:52', '2019-08-10 04:20:52'),
(20, 40, 'Grill', 'kjhgnb', 'veg', '0987', 'https://via.placeholder.com/500', 'south indian', 0, NULL, '2019-08-10 04:21:15', '2019-08-10 04:21:15'),
(21, 40, 'Grill', 'sdfghjk', 'veg', '9856', 'https://via.placeholder.com/500', 'chinese', 0, NULL, '2019-08-10 04:22:15', '2019-08-10 04:22:15'),
(24, 45, 'Grill', 'RITIK', 'veg', '0987', 'https://via.placeholder.com/500', 'south indian', 0, NULL, '2019-08-10 04:29:25', '2019-08-10 04:29:25'),
(26, 45, 'Grill', 'kjhg', 'veg', '0987', 'https://via.placeholder.com/500', 'chinese', 18, '1', '2019-08-10 04:47:52', '2019-08-10 06:25:35'),
(27, 47, 'Ajay Restaurant', 'Chhole Bhature', 'veg', '65', 'http://agfoods.in/upload/menu/image1568706578.jpeg', 'North Indian', 21, NULL, '2019-09-17 11:49:38', '2019-09-17 11:49:38'),
(28, 47, 'Singh Restaurant', 'Butter Chicken', 'nonveg', '280', 'http://agfoods.in/upload/menu/image1568706579.jpeg', 'North Indian', 21, NULL, '2019-09-17 11:49:38', '2019-09-17 11:49:38'),
(29, 69, 'Hotel', 'pizza', 'veg,nonveg', '200', 'upload/menu/image1568807217.jpeg', 'South Indian', 22, NULL, '2019-09-18 06:16:57', '2019-09-18 06:16:57'),
(30, 45, 'hk', 'pizza', 'veg', '10', 'upload/menu/image1568897097.jpeg', 'indian', NULL, NULL, '2019-09-19 07:14:57', '2019-09-19 07:14:57');

-- --------------------------------------------------------

--
-- Table structure for table `menu_category`
--

DROP TABLE IF EXISTS `menu_category`;
CREATE TABLE IF NOT EXISTS `menu_category` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu_category`
--

INSERT INTO `menu_category` (`id`, `category_name`, `category_image`, `created_at`, `updated_at`) VALUES
(22, 'South Indian', 'http://agfoods.in/public/upload/categoryimage/category_image1568788959.png', '2019-09-18 01:12:39', '2019-09-18 01:12:39'),
(25, 'continential', 'http://agfoods.in/public/upload/categoryimage/category_image1568789771.jpeg', '2019-09-18 01:26:11', '2019-09-18 01:26:11'),
(30, 'Panjabi', 'upload/categoryimage/category_image1568897246.jpeg', '2019-09-19 07:17:26', '2019-09-19 07:17:26'),
(31, 'Punjabain', 'http://agfoods.in/upload/categoryimage/category_image1568960213.jpeg', '2019-09-20 00:46:53', '2019-09-20 00:46:53');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `restaurant_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `delivery_boy_id` int(255) DEFAULT NULL,
  `user_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ordered_products` text,
  `ordered_products_count` varchar(255) DEFAULT NULL,
  `order_amount` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `delivery_charge` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `restaurant_charge` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `delivery_address` text,
  `payment_type` varchar(255) DEFAULT NULL,
  `payment_status` varchar(255) DEFAULT NULL,
  `payment_request_id` varchar(255) DEFAULT NULL,
  `payment_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `restaurant_id`, `delivery_boy_id`, `user_id`, `ordered_products`, `ordered_products_count`, `order_amount`, `delivery_charge`, `restaurant_charge`, `order_status`, `delivery_address`, `payment_type`, `payment_status`, `payment_request_id`, `payment_id`, `created_at`, `updated_at`) VALUES
(7, '40', 15, '5', 'papdi,chhole', '1,1', '200', '20', '20', 'InProcess', 'Noida', 'online', 'success', NULL, NULL, '2019-08-06 18:30:00', '2019-08-06 18:30:00'),
(8, '40', 15, '5', 'pizza', '3', '250', '200', '20', 'Delivered', 'Delhi', 'cod', 'pending', NULL, NULL, '2019-08-08 18:30:00', '2019-09-16 11:46:39'),
(11, '43', 46, '5', 'burger,french fries', '3,1', '297', '0', '0', 'Delivered', 'Delhi', 'cod', 'Pending', NULL, NULL, '2019-08-26 22:08:32', '2019-09-16 11:45:08'),
(12, '43', NULL, '5', 'burger,french fries', '3,1', '297', '0', '0', 'Pending', 'Delhi', 'cod', 'Pending', NULL, NULL, '2019-08-26 22:11:17', '2019-08-26 22:11:17'),
(13, '43', NULL, '5', 'burger,french fries', '3,1', '297', '0', '0', 'Pending', 'Delhi', 'online', 'Pending', NULL, NULL, '2019-08-26 22:11:42', '2019-08-26 22:11:42'),
(14, '43', NULL, '12', 'rasgulla', '2', '100', '0', '0', 'Pending', 'Alpha1', 'cod', 'Pending', NULL, NULL, '2019-09-05 07:05:20', '2019-09-05 07:05:20'),
(15, '43', 46, '12', 'rasgulla', '2', '100', '0', '0', 'Delivered', 'Alpha1', 'sbi', 'Pending', NULL, NULL, '2019-09-05 07:05:42', '2019-09-17 10:44:00'),
(16, '45', NULL, '12', 'rasgulla', '2', '100', '0', '0', 'Delivered', 'Alpha1', 'sbi', 'Pending', NULL, NULL, '2019-09-05 07:11:19', '2019-09-16 11:45:26'),
(17, '45', NULL, '12', 'rasgulla', '2', '100', '0', '0', 'Pending', 'Alpha1', 'sbi', 'Pending', NULL, NULL, '2019-09-06 14:07:19', '2019-09-06 14:07:19'),
(18, '45', NULL, '12', 'rasgulla', '2', '100', '0', '0', 'Pending', 'Alpha1', 'sbi', 'Pending', NULL, NULL, '2019-09-10 13:31:03', '2019-09-10 13:31:03'),
(19, '45', NULL, '12', 'rasgulla', '2', '100', '0', '0', 'Pending', 'Alpha1', 'sbi', 'Pending', NULL, NULL, '2019-09-10 13:38:00', '2019-09-10 13:38:00'),
(20, '43', NULL, '23', 'xyz,abc', '1,2', '200', '0', '0', 'Pending', '14', 'online', 'Pending', 'order_DI34zsGpeDZ0RE', NULL, '2019-09-14 14:38:15', '2019-09-14 14:38:15'),
(21, '43', NULL, '23', 'xyz,abc', '1,2', '200', '0', '0', 'Pending', '14', 'online', 'Pending', 'order_DI35xNdUaUuVI7', NULL, '2019-09-14 14:39:10', '2019-09-14 14:39:10'),
(22, '43', NULL, '23', 'xyz,abc', '1,2', '200', '0', '0', 'Pending', '14', 'online', 'success', 'order_DI36Paya3hg2Zf', 'pay_DI36Paya3hg2Zf', '2019-09-14 14:39:36', '2019-09-14 14:49:21'),
(23, '43', NULL, '23', 'xyz,abc', '1,2', '200', '0', '0', 'Pending', '14', 'online', 'Pending', 'order_DI3FdQs44tKoTC', NULL, '2019-09-14 14:48:20', '2019-09-14 14:48:20'),
(24, '43', NULL, '23', 'xyz,abc', '1,2', '200', '0', '0', 'Pending', '14', 'online', 'Pending', 'order_DIkW1NoJKgR0hO', NULL, '2019-09-16 09:07:40', '2019-09-16 09:07:40'),
(25, '43', NULL, '23', 'lkjhg,jhgfghjkjhg', '1,1', '2092.7', '0', '0', 'Pending', '13', 'cod', 'Pending', NULL, NULL, '2019-09-16 14:18:18', '2019-09-16 14:18:18'),
(26, '43', NULL, '23', 'lkjhg,jhgfghjkjhg', '1,1', '2092.7', '0', '0', 'Pending', '13', 'online', 'Pending', 'order_DIpwLY7UXfNIag', NULL, '2019-09-16 14:26:03', '2019-09-16 14:26:03'),
(27, '43', NULL, '23', 'lkjhg,jhgfghjkjhg', '1,1', '2092.7', '0', '0', 'Pending', '13', 'cod', 'Pending', NULL, NULL, '2019-09-16 18:52:54', '2019-09-16 18:52:54'),
(28, '43', NULL, '23', 'lkjhg,jhgfghjkjhg', '1,1', '2092.7', '0', '0', 'Pending', '13', 'online', 'Pending', 'order_DIuUQcvaAgnDdz', NULL, '2019-09-16 18:53:05', '2019-09-16 18:53:05'),
(29, '45', NULL, '23', 'kjhg,RITIK', '1,1', '2092.7', '0', '0', 'Pending', '14', 'online', 'Pending', 'order_DIuy5zllDULXYz', NULL, '2019-09-16 19:21:11', '2019-09-16 19:21:11'),
(30, '45', NULL, '23', 'kjhg,RITIK', '1,1', '2092.7', '0', '0', 'Pending', '14', 'online', 'Pending', 'order_DIuyDNnzZ3YgmH', NULL, '2019-09-16 19:21:17', '2019-09-16 19:21:17'),
(31, '45', NULL, '23', 'kjhg,RITIK', '1,1', '2092.7', '0', '0', 'Pending', '14', 'online', 'Pending', 'order_DIuyZtTqfMxIer', NULL, '2019-09-16 19:21:38', '2019-09-16 19:21:38'),
(32, '45', NULL, '23', 'kjhg,RITIK', '1,1', '2092.7', '0', '0', 'Pending', '14', 'online', 'Pending', 'order_DIuywv20i3Smpu', NULL, '2019-09-16 19:21:59', '2019-09-16 19:21:59'),
(33, '45', NULL, '23', 'kjhg,RITIK', '1,1', '2092.7', '0', '0', 'Pending', '14', 'online', 'Pending', 'order_DIv12A74mOR1o6', NULL, '2019-09-16 19:23:57', '2019-09-16 19:23:57'),
(34, '45', NULL, '23', 'kjhg,RITIK', '1,1', '2092.7', '0', '0', 'Pending', '14', 'online', 'Pending', 'order_DIv2uj5pUB9ifa', NULL, '2019-09-16 19:25:44', '2019-09-16 19:25:44'),
(35, '45', NULL, '23', 'kjhg,RITIK', '1,1', '2092.7', '0', '0', 'Pending', '14', 'online', 'Pending', 'order_DIv3ExuIjMK4rn', NULL, '2019-09-16 19:26:03', '2019-09-16 19:26:03'),
(36, '45', NULL, '23', 'kjhg,RITIK', '1,1', '2092.7', '0', '0', 'Pending', '14', 'online', 'Pending', 'order_DIv52LF4sdm9hd', NULL, '2019-09-16 19:27:45', '2019-09-16 19:27:45'),
(37, '45', NULL, '23', 'kjhg,RITIK', '1,1', '2092.7', '0', '0', 'Pending', '14', 'online', 'Pending', 'order_DIv5INiQXmhCq0', NULL, '2019-09-16 19:27:59', '2019-09-16 19:27:59'),
(38, '45', NULL, '23', 'kjhg,RITIK', '1,1', '2092.7', '0', '0', 'Pending', '14', 'online', 'Pending', 'order_DIv5RaVcFUOjwc', NULL, '2019-09-16 19:28:08', '2019-09-16 19:28:08'),
(39, '45', NULL, '23', 'kjhg,RITIK', '1,1', '2092.7', '0', '0', 'Pending', '14', 'online', 'Pending', 'order_DIv9eebKiUyn3W', NULL, '2019-09-16 19:32:07', '2019-09-16 19:32:07'),
(40, '45', NULL, '23', 'kjhg,RITIK', '1,1', '2092.7', '0', '0', 'Pending', '14', 'cod', 'Pending', NULL, NULL, '2019-09-16 19:32:54', '2019-09-16 19:32:54'),
(41, '43', NULL, '23', 'lkjhg,jhgfghjkjhg', '1,1', '2092.7', '0', '0', 'Pending', '14', 'online', 'Pending', 'order_DIvKk2kSFrrTwV', NULL, '2019-09-16 19:42:37', '2019-09-16 19:42:37'),
(42, '43', NULL, '23', 'jhgfghjkjhg,lkjhg', '2,2', '4165.4', '0', '0', 'Pending', '14', 'online', 'failure', 'order_DIw91gGPak8wfv', 'Payment Cancelled', '2019-09-16 20:30:13', '2019-09-16 20:31:09'),
(43, '43', NULL, '23', 'jhgfghjkjhg,lkjhg', '2,2', '4165.4', '0', '0', 'Pending', '14', 'online', 'Pending', 'order_DIwA1E5zyyPcH0', NULL, '2019-09-16 20:31:09', '2019-09-16 20:31:09'),
(44, '43', NULL, '23', 'jhgfghjkjhg', '5', '5201.75', '0', '0', 'Pending', '14', 'online', 'failure', 'order_DIwy3euVqP08CI', 'Payment Cancelled', '2019-09-16 21:18:32', '2019-09-16 21:18:58'),
(45, '47', NULL, '28', 'Chhole Bhature', '1', '88.25', '0', '0', 'Pending', '15', 'online', 'failure', 'order_DJC1pXQLXz7f5z', 'Payment Cancelled', '2019-09-17 12:02:30', '2019-09-17 12:02:48'),
(46, '47', NULL, '28', 'Chhole Bhature', '1', '88.25', '0', '0', 'Pending', '15', 'cod', 'Pending', NULL, NULL, '2019-09-17 12:04:32', '2019-09-17 12:04:32'),
(47, '40', NULL, '28', 'dosa b', '1', '230', '0', '0', 'Pending', '15', 'cod', 'Pending', NULL, NULL, '2019-09-17 12:05:42', '2019-09-17 12:05:42'),
(48, '40', NULL, '28', 'papdi', '1', '240.5', '0', '0', 'Pending', '15', 'cod', 'Pending', NULL, NULL, '2019-09-17 12:06:52', '2019-09-17 12:06:52'),
(49, '47', NULL, '28', 'Chhole Bhature', '1', '88.25', '0', '0', 'Pending', '16', 'cod', 'Pending', NULL, NULL, '2019-09-17 12:13:25', '2019-09-17 12:13:25'),
(50, '47', 41, '27', 'Chhole Bhature', '1', '88.25', '0', '0', '3', '17', 'cod', 'Pending', NULL, NULL, '2019-09-17 12:18:48', '2019-09-17 12:20:03'),
(51, '43', 41, '23', 'xyz,abc', '1,2', '200', '0', '0', 'Pending', '14', 'online', 'Pending', NULL, NULL, '2019-10-06 12:01:10', '2019-10-06 12:01:10'),
(52, '43', 41, '23', 'xyz,abc', '1,2', '200', '0', '0', 'Pending', '14', 'online', 'Pending', 'order_DRAlpcf8KWKnp5', NULL, '2019-10-07 06:30:37', '2019-10-07 06:30:41');

-- --------------------------------------------------------

--
-- Table structure for table `order_delivery_boy`
--

DROP TABLE IF EXISTS `order_delivery_boy`;
CREATE TABLE IF NOT EXISTS `order_delivery_boy` (
  `id` int(20) NOT NULL,
  `delivery_boy_id` varchar(50) NOT NULL,
  `order_id` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `order_item`
--

DROP TABLE IF EXISTS `order_item`;
CREATE TABLE IF NOT EXISTS `order_item` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `restaurant_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_quantity` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_price` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_item_price` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_item`
--

INSERT INTO `order_item` (`id`, `order_id`, `user_id`, `restaurant_id`, `item_name`, `item_quantity`, `item_price`, `total_item_price`, `created_at`, `updated_at`) VALUES
(6, '8', '5', '20', 'papdi,chole', '2', '200', '400', '2019-08-09 18:30:00', '2019-08-09 18:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset`
--

DROP TABLE IF EXISTS `password_reset`;
CREATE TABLE IF NOT EXISTS `password_reset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `validator` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payout`
--

DROP TABLE IF EXISTS `payout`;
CREATE TABLE IF NOT EXISTS `payout` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `restaurant_id` int(20) NOT NULL,
  `restaurant_name` varchar(200) NOT NULL,
  `amount` varchar(100) NOT NULL,
  `method` varchar(100) NOT NULL,
  `remark` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
CREATE TABLE IF NOT EXISTS `profiles` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobileno` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied_refer_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `refer_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otp` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `profiles_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `profiles`
--

INSERT INTO `profiles` (`id`, `name`, `email`, `mobileno`, `password`, `applied_refer_code`, `refer_code`, `otp`, `created_at`, `updated_at`) VALUES
(1, 'ritik', 'ritikb001@gmail.com', '9340564510', '$2y$10$5Mq0BLcz1H72rBjjE8pUyek8Hlf/LiCBXC4aqoFPg4JoXbLeDnrQG', '0', '123456', '867277', '2019-07-21 13:27:28', '2019-07-21 13:27:28'),
(2, 'rahul', 'ritikb002@gmail.com', '9340564510', '$2y$10$C0vX4GYtuxoRWLd.nMIIPe5PgpbOLGwWC9wZp01ZYDfJ8ZNpWH0V6', '0', '123456', '385634', '2019-07-21 13:31:25', '2019-07-21 13:31:25'),
(3, 'Farhad', 'farhad@test.com', '9953457769', '$2y$10$bumhWnVtd2/Fo7lyvRMIPewv1aijAwrthzuUyTLD/6pvWtizL6YhC', '0', NULL, '993540', '2019-08-26 21:03:07', '2019-08-26 21:03:07'),
(4, 'rishu', 'hk@gmail.com', '84512', '$2y$10$xcDMtPwZUIUD4C.AUZaWHOk9D0h6zcvyHzSNzbUbvlRuSM8C0K5RC', 'ffgh5', NULL, '769207', '2019-09-04 07:03:17', '2019-09-04 07:03:17'),
(5, 'rishu', 'hkk@gmail.com', '845152', '$2y$10$/klWYElMPeDcC5SxVmeOGedUUxAbV4g5tNNuyWOspJYcJ7WBmHA1a', 'ffgh5', NULL, '420598', '2019-09-04 07:04:23', '2019-09-04 07:04:23'),
(6, 'abhishek', 'ak@gmail.com', '85412', '$2y$10$Z5f5.MBMTXiunadMpFMgMuOkhz1SX5WgJ4MuGy4KsIsA0CWk0bl/2', '7410', NULL, '375352', '2019-09-04 07:22:25', '2019-09-04 07:22:25'),
(7, 'abhishek ku', 'akk@gmail.com', '854124', '$2y$10$8MalnMNg3hGo1ToiLNksZOUv4EPyHvnwMSzs52YQnVxIgtBOh/YKq', '74101', 'abh07', '563025', '2019-09-04 07:30:10', '2019-09-04 07:30:10'),
(8, 'dfghjku', 'adfgkk@gmail.com', '9074200445', '$2y$10$vyl/BdvbWV37KFtVG9xa3eafjD9W2WiAOiO1yf6UD45yaxPVh/32u', '74101k', 'dfg08', '275996', '2019-09-05 04:02:37', '2019-09-05 04:02:37'),
(9, 'wrt', 'dfgh@gmail.com', '9074200445', '$2y$10$l2MN42NkICCtWabv5hoNl.bPndhR4aAPaPsF917z4gHb/WAQH1YHm', '74101k', 'wrt09', '933515', '2019-09-05 04:06:35', '2019-09-05 04:06:35'),
(10, 'werty', 'xcvb@gmail.com', '9074200445', '$2y$10$mdgNdEAuB/OzR2X8ABH/XeTq6WeAcg5glI6f2KXLPZ0UGHQE9V2Ka', '74101k', 'wer10', '249391', '2019-09-05 04:10:33', '2019-09-05 04:10:33'),
(11, 'bnm', 'erty@gmail.com', '9074200445', '$2y$10$x1NgWK/lkviol/2E0wM3.uwN.FbeUvlkfDMLXtp6sX6Bog3YxgkKe', '74101k', 'bnm11', '752082', '2019-09-05 04:11:17', '2019-09-05 04:11:17'),
(15, 'Farhad Khan', 'farhadkhan8264@gmail.com', '9953457769', '$2y$10$m9D00QPp2nerPQKF4W7RYOCdx9FMB/jppbIjpr3X1zMF97vCw2ewu', NULL, 'Far15', '511191', '2019-09-06 08:09:32', '2019-09-06 08:09:32'),
(16, 'abhishek kus', 'aakk@gmail.com', '9074200445', '$2y$10$JvWZWG6ytRnvKOyIgkJZM.oR8RfNncUKs/N2o3/bwU4OF8OZqCsy2', '7410132', 'abh16', '560197', '2019-09-06 13:58:37', '2019-09-06 13:58:37'),
(17, 'Ashwini Kumar', 'ashwinikmr048@gmail.com', '7903773014', '$2y$10$ODSdtoSbwV1HQMYHU.4MEuyCMq2WY7NW6pH3A6q60tzec2FaemTLe', NULL, 'Ash17', '683929', '2019-09-07 12:02:43', '2019-09-07 12:02:43'),
(18, 'Indranil', 'ndrnlchatterjee@gmail.com', '8130728411', '$2y$10$YgEVOfKy9u1Rz/nQ5Iy8.OX0VCCmBJA0k2twMM5oRQnaUhKurDk8y', NULL, 'Ind18', '903653', '2019-09-07 12:06:39', '2019-09-07 12:06:39'),
(19, 'Indranil', 'ndrnlchatterje@gmail.com', '8130728411', '$2y$10$RW8HU1AGetyVMLBg3vn5wOjQhIrW5wTwxwal8eNP5RBLZGyhATIMu', NULL, 'Ind19', '657750', '2019-09-07 16:57:13', '2019-09-07 16:57:13'),
(20, 'Ashwini Kumar', 'ashwinikmr1992@gmail.com', '7766994705', '$2y$10$vmu0gwMvzkLmEKAYpzrJjegdfX0/sHb.VdkC0/AiiLvPwC3ZdeKwi', NULL, 'Ash20', '121229', '2019-09-07 19:10:11', '2019-09-07 19:10:11'),
(21, 'Indranil', 'ndrnlchatterjee1@gmail.com', '8130728411', '$2y$10$5Ht3Ox9rYdbnUQw.qyqsluDaFVJTliv1tJhl.L75MzEhnJ5oeiM3S', NULL, 'Ind21', '298515', '2019-09-07 19:32:12', '2019-09-07 19:32:12'),
(22, 'Ashwini', 'ashwinikmr@gmail.com', '7766994705', '$2y$10$i8HHq4VCmKSXR2MFCJ8e/OsX0kw4F1n.kXcT/qWjXk74fIENGIQba', NULL, 'Ash22', '723112', '2019-09-07 19:39:16', '2019-09-07 19:39:16'),
(23, 'Ashwini', 'ashwini@gmail.com', '7766994705', '$2y$10$PhC68Xp2BzBPk/uL1oh7hOZenOhEwJb5BG3.g1cvJQAMrZdVFzigi', NULL, 'Ash23', '978978', '2019-09-07 19:43:26', '2019-09-07 19:43:26'),
(24, 'abhishek kus', 'aakk1324@gmail.com', '9074200445', '$2y$10$GNibBHB65MPnZObVz9u2i.gyKZVUmyrZ8eeTg44i8q2LTW.Ej1FJK', '7410132', 'abh24', '836263', '2019-09-10 12:49:03', '2019-09-10 12:49:03'),
(25, 'abhishek kus', 'aakk132455@gmail.com', '9953457769', '$2y$10$ZYaX.IerKIPzT/Px4yVfg.yg18EUYWfxTKyZqP/hSxBishV9ZwNVy', '7410132', 'abh25', '841082', '2019-09-10 12:49:44', '2019-09-10 12:49:44'),
(26, 'Indranil', 'indranil@gmail.com', '8130728411', '$2y$10$tZqRrK6MjXBXzWnqjEGlEe28Fu76I/27puXRSGFrq9gxAx3WkFMi6', NULL, 'Ind26', '367175', '2019-09-16 20:31:50', '2019-09-16 20:31:50'),
(27, 'Ajay', 'ajaychaudhary173314@gmail.com', '9971128612', '$2y$10$pVkS.y0lVoBDjSzLQ8tSIuaS1LX20DJIEI/CAhtH8LOCmioYoccMC', NULL, 'Aja27', '463672', '2019-09-16 22:49:45', '2019-09-16 22:49:45'),
(28, 'Sharad', 'shradbca15@gmail.com', '7011637007', '$2y$10$M.4kYF34z/KMlNxn07SZaexr6CR/QSobBRR67qa7rAmTM4JpACX5S', NULL, 'Sha28', '800455', '2019-09-17 10:28:43', '2019-09-17 10:28:43');

-- --------------------------------------------------------

--
-- Table structure for table `restaurant`
--

DROP TABLE IF EXISTS `restaurant`;
CREATE TABLE IF NOT EXISTS `restaurant` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `userid` int(20) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(200) NOT NULL,
  `email` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobileno` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `servetype` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `categories` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `offer` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `delivery_time` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `open_time` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `close_time` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `working_days` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cost_for_two` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `outstanding_balance` bigint(20) NOT NULL DEFAULT '0',
  `bank_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_account_holder` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_account_no` varchar(22) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ifsc_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `keywords` text,
  `has_menu` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `restaurant`
--

INSERT INTO `restaurant` (`id`, `userid`, `name`, `address`, `city`, `email`, `mobileno`, `servetype`, `categories`, `image`, `offer`, `delivery_time`, `open_time`, `close_time`, `working_days`, `cost_for_two`, `outstanding_balance`, `bank_name`, `bank_account_holder`, `bank_account_no`, `ifsc_code`, `keywords`, `has_menu`, `created_at`, `updated_at`) VALUES
(20, 40, 'Grill', 'noida', 'Greater Noida', 'grill@agfoods.org', '9752409869', 'veg', 'indian,Punjabian,South Indian,continential', 'https://via.placeholder.com/500', '10', '15', '12:30:00', '23:30:00', 'monday', '280', 0, 'SBI', 'Navdeep', '234567898767', 'mnb67hg7', '[Grill][veg]', 1, '2019-08-07 02:01:54', '2019-09-18 04:01:29'),
(22, 43, 'Restaurant', 'Noida', 'Noida', 'restaurant@test.com', '8745321011', 'veg,nonveg', 'South Indian', 'https://via.placeholder.com/500', '10', '40', '15:30:30', '12:00:00', 'monday,tuesday,wednesday,thursday,friday,saturday,sunday', '250', 0, 'Bank', 'Restaurant', '147832501235478', 'Bank123457', NULL, 0, '2019-08-23 02:45:08', '2019-09-18 01:13:22'),
(25, 62, 'Ajay Restaurant', 'Jagat Farm, Greater Noida', 'Greater Noida', 'ajayres@gmail.com', '9874563210', 'veg,nonveg', NULL, 'http://agfoods.in/upload/restaurant/image1568704561.jpeg', '0', '40', '08:00 :00', '23:00:00', 'monday,tuesday,wednesday,thursday,friday,saturday,sunday', '350', 0, 'ABC', 'Ajay', '96325874123654789', 'ABC123654D', NULL, 0, '2019-09-17 11:16:01', '2019-09-17 11:34:54'),
(24, 45, 'ghjkl', 'datia', 'Noida', 'hk@gmail.com', '8451211', 'veg', 'Punjabain,South Indian,Panjabi', 'http://agfoods.in/upload/restaurant/image1568965606.jpeg', '5', '20', '17:30:00', '06:00:00', 'monday,tuesday', '52', 0, 'zxcvbnm', 'wertyui', '98765403', 'dfgh874512', 'Punjabain,South Indian,Panjabi,Panjabi,pizza,', 1, '2019-09-05 01:30:17', '2019-09-20 02:16:46'),
(26, 47, 'Singh Restaurant', 'Beta 2, Greater Noida', 'Greater Noida', 'singhres@gmail.com', '9874568210', 'veg,nonveg', NULL, 'http://agfoods.in/upload/restaurant/image1568704562.jpeg', '0', '40', '08:00 :00', '23:00:00', 'monday,tuesday,wednesday,thursday,friday,saturday,sunday', '350', 0, 'ABC', 'ASingh', '96325874123654789', 'ABC123654D', NULL, 0, '2019-09-17 11:16:01', '2019-09-17 11:34:54');

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_category`
--

DROP TABLE IF EXISTS `restaurant_category`;
CREATE TABLE IF NOT EXISTS `restaurant_category` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

DROP TABLE IF EXISTS `setting`;
CREATE TABLE IF NOT EXISTS `setting` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `restaurantid` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `offer` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `delivery_time` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `open_time` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `close_time` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `working_days` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cost_for_two` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `title`
--

DROP TABLE IF EXISTS `title`;
CREATE TABLE IF NOT EXISTS `title` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `title`
--

INSERT INTO `title` (`id`, `title`, `content`, `created_at`, `updated_at`) VALUES
(1, '	\r\nPrivacy Policy', '<p>Privacy &amp; Policy</p>', '2019-07-20 18:30:00', '2019-07-22 23:44:47'),
(2, 'Terms & Conditions', '<p>Terms &amp; Conditions</p>', '2019-07-20 18:30:00', '2019-07-22 23:44:21'),
(3, 'Contact Info', '<p>Contact Infokjhg</p>\r\n\r\n<p>&nbsp;</p>', '2019-07-20 18:30:00', '2019-07-25 01:06:41');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `usertype` int(10) NOT NULL DEFAULT '4',
  `is_active` int(10) NOT NULL DEFAULT '2',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=71 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `usertype`, `is_active`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(42, 'ritikbansal', 'ritikbansal12@gmail.com', 2, 3, NULL, '$2y$10$aKfo568engN6/3pdHkzx4e9pGMdOH7qmLh9FQJIbBlY2PWk9Un2kq', NULL, '2019-08-07 07:26:00', '2019-08-07 07:27:42'),
(40, 'Grill', 'grill@agfoods.org', 1, 1, NULL, '$2y$10$LFMoTRidglni/LQcBiN1Pedqac4WW12W2L3eTDUXssTMwyArON71y', 'I2q9KtWfnv8OUkGph97Q8dss2P5gp4MgCa1l085hz7Jid9IuaG6eOY8E4Y7t', '2019-08-07 02:01:54', '2019-08-07 02:01:54'),
(41, 'Rakesh', 'delivery@gmail.com', 1, 2, NULL, '$2y$10$RmSPMZ8zM0uWj/2dcDKfpOYfr2AbBZyVjV.4wghiE4XoFTctQf.WS', NULL, '2019-08-07 02:20:27', '2019-08-07 02:20:27'),
(39, 'admin', 'admin@agfoods.in', 0, 1, NULL, '$2y$10$nnVq9BE4MzL7szt.8dOF7undZdn3w6FxKXYMJtbAtb0F0t/6yctx.', 'g34C7q6tJivam9vM3QhjH6PpR7IsmJS1Ea9kDt88jezzMjvvN0jZBiTXjMzA', '2019-08-07 01:54:13', '2019-08-07 01:54:13'),
(43, 'Restaurant', 'restaurant@test.com', 1, 1, NULL, '$2y$10$VU6fS3DUL7CYBDQ5O8aYPeJDe3wevGbS09HI/0rCjA8JagV/k/O0u', 'idcnOQ05VCl9LQlslHOO6Fd20xdUZr6rjikp9ouWquz29Cz6vDGUKy90H60e', '2019-08-23 02:42:22', '2019-09-18 01:09:34'),
(44, 'Admin', 'admin@test.com', 1, 2, NULL, '$2y$10$ZAZTcCLpOly2qvdM1j7cm.hzq0gPyb0b2D14wrZtl.9XW81JdlBry', NULL, '2019-08-23 02:47:40', '2019-08-23 02:47:40'),
(45, 'hk', 'hk@gmail.com', 1, 1, NULL, '$2y$10$LFMoTRidglni/LQcBiN1Pedqac4WW12W2L3eTDUXssTMwyArON71y', 'R0LzzjpEFxOWo0ZgAhgnPdsmZmUSp4Be2hJezFrECi6P4txTQ00rPeOqkPkz', '2019-09-04 23:57:31', '2019-09-18 01:09:38'),
(46, 'Saurav', 'sauravmishrastp1@gmail.com', 2, 2, NULL, '$2y$10$LHHzVIKvAmaezQ/rMngdZupHU5mgvu/BAMxzI8VfQyt4romqPY5sq', NULL, '2019-09-08 14:07:42', '2019-09-08 14:07:47');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
