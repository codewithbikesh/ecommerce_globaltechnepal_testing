-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 16, 2024 at 12:20 PM
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
-- Database: `ecom`
--

-- --------------------------------------------------------

--
-- Table structure for table `api`
--

CREATE TABLE `api` (
  `id` bigint(20) NOT NULL,
  `api_name` varchar(255) NOT NULL,
  `api_value` varchar(255) NOT NULL,
  `api_username` varchar(255) DEFAULT NULL,
  `api_password` varchar(255) DEFAULT NULL,
  `api_granttype` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `api`
--

INSERT INTO `api` (`id`, `api_name`, `api_value`, `api_username`, `api_password`, `api_granttype`, `remarks`, `created_at`, `updated_at`) VALUES
(2, 'P', 'http://omstofm.globaltech.com.np/api/v1/full-reset?Storecode=FOODOMS101', NULL, NULL, NULL, 'Fetching products', '2024-09-05 23:21:55', '2024-09-15 22:48:58'),
(5, 'T', 'http://omstofm.globaltech.com.np/token', '9851255000', '9851255000', 'password', 'For generating token', '2024-09-15 06:34:55', '2024-09-15 22:49:10');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `carousel_images`
--

CREATE TABLE `carousel_images` (
  `id` bigint(20) NOT NULL,
  `image_1` varchar(255) DEFAULT NULL,
  `image_2` varchar(255) DEFAULT NULL,
  `image_3` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carousel_images`
--

INSERT INTO `carousel_images` (`id`, `image_1`, `image_2`, `image_3`, `created_at`, `updated_at`) VALUES
(1, '1726120075_image1.jpg', '1726120075_image2.jpg', '1726120075_image3.jpg', NULL, '2024-09-12 00:02:55');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` bigint(20) NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `province_id` bigint(20) DEFAULT NULL,
  `city_id` bigint(20) DEFAULT NULL,
  `session_id` varchar(255) DEFAULT NULL,
  `tax` decimal(10,2) DEFAULT NULL,
  `shipping_cost` decimal(10,2) DEFAULT NULL,
  `shipping_cost_total` decimal(10,2) NOT NULL DEFAULT 0.00,
  `subtotal` decimal(10,2) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `customer_id`, `province_id`, `city_id`, `session_id`, `tax`, `shipping_cost`, `shipping_cost_total`, `subtotal`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 3, 3, NULL, 0.00, 140.00, 280.00, 3080.00, NULL, '2024-09-15 23:11:32', '2024-09-15 23:14:02');

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `id` bigint(20) NOT NULL,
  `cart_id` bigint(20) NOT NULL,
  `product_code` varchar(255) NOT NULL,
  `quantity` bigint(20) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cart_items`
--

INSERT INTO `cart_items` (`id`, `cart_id`, `product_code`, `quantity`, `price`, `created_at`, `updated_at`) VALUES
(1, 1, 'FMD174425', 1, 2490.00, '2024-09-15 23:11:32', '2024-09-15 23:11:32'),
(2, 1, 'FMD195308', 1, 590.00, '2024-09-15 23:14:02', '2024-09-15 23:14:02');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `full_name`, `email`, `password`, `phone`, `created_at`, `updated_at`) VALUES
(2, 'Janam pandey', 'milan@gmail.com', '$2y$12$3AZKRtdvygy/96SQronDA./9wC27yCUapNm6GbnqFTMeN4wDoUoW.', '9866077949', '2024-09-07 23:34:34', '2024-09-13 05:21:07'),
(3, 'Dipak Nyaupane', 'dipak@gmail.com', '$2y$12$zYFm77InBevzDOH4flq3aOocCimWWRueYqikDTZYKMbPdlNVgw0uK', '78326478126', '2024-09-11 08:24:50', '2024-09-11 08:24:50'),
(4, 'Test', 'test@gmail.com', '$2y$12$HXmpb33v3EQchQUYohCdH.zWrPUIHvwtCw.AhlzpXBo3ireLUHH4e', '92871312621', '2024-09-12 23:12:53', '2024-09-12 23:12:53');

-- --------------------------------------------------------

--
-- Table structure for table `customer_address_book`
--

CREATE TABLE `customer_address_book` (
  `id` bigint(20) NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `province_id` bigint(20) NOT NULL,
  `city_id` bigint(20) NOT NULL,
  `address` varchar(255) NOT NULL,
  `landmark` varchar(255) DEFAULT NULL,
  `address_type` varchar(255) DEFAULT NULL,
  `default_shipping` varchar(255) DEFAULT NULL,
  `default_billing` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_address_book`
--

INSERT INTO `customer_address_book` (`id`, `customer_id`, `full_name`, `phone`, `province_id`, `city_id`, `address`, `landmark`, `address_type`, `default_shipping`, `default_billing`, `created_at`, `updated_at`) VALUES
(1, 2, 'Janam pandey', '9813074888', 6, 4, 'wedwedx', 'Durbar square', 'H', NULL, NULL, '2024-09-15 05:45:10', '2024-09-15 05:49:49'),
(2, 2, 'Test', '87126327165', 3, 3, 'Lokanthali', 'Durbar square', 'O', 'Y', 'Y', '2024-09-15 05:49:24', '2024-09-15 05:49:49');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_information`
--

CREATE TABLE `delivery_information` (
  `id` bigint(20) NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `order_id` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `invoice_email` varchar(255) DEFAULT NULL,
  `province_id` bigint(20) NOT NULL,
  `city_id` bigint(20) NOT NULL,
  `address` varchar(255) NOT NULL,
  `landmark` varchar(255) DEFAULT NULL,
  `address_type` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `delivery_information`
--

INSERT INTO `delivery_information` (`id`, `customer_id`, `order_id`, `full_name`, `phone`, `invoice_email`, `province_id`, `city_id`, `address`, `landmark`, `address_type`, `type`, `created_at`, `updated_at`) VALUES
(1, 2, '#ORD-20240915-0001', 'Dipak Nyaupane', '9866077948', 'milan@gmail.com', 6, 4, 'seshmati pul', NULL, 'O', '', '2024-09-15 01:24:40', '2024-09-15 01:24:40'),
(2, 2, '#ORD-20240915-0001', 'Dipak Nyaupane', '9866077948', 'milan@gmail.com', 6, 4, 'seshmati pul', NULL, 'O', '', '2024-09-15 01:24:40', '2024-09-15 01:24:40'),
(3, NULL, NULL, 'Janam pandey', '9813074888', 'hello@gmail.com', 6, 4, 'Ilam Tea Garden', NULL, NULL, 'shipping', '2024-09-15 02:15:30', '2024-09-15 02:15:30'),
(4, NULL, NULL, 'Janam pandey', '9813074888', 'hello@gmail.com', 6, 4, 'Ilam Tea Garden', 'Tea Garden', NULL, 'shipping', '2024-09-15 02:15:51', '2024-09-15 02:30:36');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inquiries`
--

CREATE TABLE `inquiries` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `inquiries`
--

INSERT INTO `inquiries` (`id`, `name`, `email`, `subject`, `message`, `created_at`, `updated_at`) VALUES
(1, 'Janam Pandey', 'janampandey2@gmail.com', 'Hello test', 'This is a message.', '2024-09-08 01:00:09', '2024-09-08 01:00:09');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(9, '0001_01_01_000001_create_cache_table', 1),
(10, '0001_01_01_000002_create_jobs_table', 1),
(11, '2024_05_28_034358_create_contact_table', 1),
(12, '2024_05_28_051054_create_personal_access_tokens_table', 1),
(13, '2024_05_29_165117_create_users_table', 1),
(14, '2024_06_01_163152_create_website_data_table', 1),
(15, '2024_09_03_081643_create_products_table', 1),
(16, '2024_09_03_113655_create_customers_table', 1),
(17, '2024_09_05_044616_create_cart_table', 2),
(19, '2024_09_05_045401_create_cart_items_table', 3),
(20, '2024_09_05_050349_create_orders_table', 4),
(21, '2024_09_05_053424_create_order_items_table', 5),
(22, '2024_09_05_075519_create_carousel_images_table', 6),
(23, '2024_09_05_094014_create_inquiries_table', 7),
(24, '2024_09_05_095429_create_newsletter_subscribers_list_table', 8),
(25, '2024_09_06_043556_create_api_table', 9),
(26, '2024_09_09_050631_create_set_shipping_table', 10),
(27, '2024_09_11_092834_create_delivery_information_table', 11),
(28, '2024_09_12_081841_create_provinces_table', 12),
(29, '2024_09_13_044221_create_customer_address_book_table', 13),
(30, '2024_09_16_054240_create_product_images_table', 14);

-- --------------------------------------------------------

--
-- Table structure for table `newsletter_subscribers_list`
--

CREATE TABLE `newsletter_subscribers_list` (
  `id` bigint(20) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `newsletter_subscribers_list`
--

INSERT INTO `newsletter_subscribers_list` (`id`, `gender`, `email`, `created_at`, `updated_at`) VALUES
(1, 'M', 'test@gmail.com', '2024-09-07 23:50:01', '2024-09-07 23:50:01'),
(2, 'M', 'hello@gmail.com', '2024-09-08 03:08:12', '2024-09-08 03:08:12');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL,
  `order_id` varchar(255) NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `shipping_delivery_information_id` bigint(20) NOT NULL,
  `billing_delivery_information_id` bigint(20) NOT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `shipping_method` varchar(255) DEFAULT NULL,
  `subtotal` decimal(10,2) NOT NULL DEFAULT 0.00,
  `tax` decimal(10,2) NOT NULL DEFAULT 0.00,
  `shipping_cost` decimal(10,2) NOT NULL DEFAULT 0.00,
  `discount` decimal(10,2) DEFAULT 0.00,
  `total_amount` decimal(10,2) DEFAULT 0.00,
  `order_status` varchar(255) NOT NULL DEFAULT 'Pending',
  `payment_status` varchar(255) NOT NULL DEFAULT 'Pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) NOT NULL,
  `order_id` varchar(255) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `quantity` bigint(20) NOT NULL DEFAULT 0,
  `price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `subtotal` decimal(10,2) DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) NOT NULL,
  `product_code` varchar(255) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_description` varchar(512) DEFAULT NULL,
  `category_id` varchar(255) DEFAULT NULL,
  `category_name` varchar(255) DEFAULT NULL,
  `subcategory_id` varchar(255) DEFAULT NULL,
  `subcategory_name` varchar(255) DEFAULT NULL,
  `delivery_target_days` varchar(255) DEFAULT NULL,
  `discount` decimal(10,2) DEFAULT NULL,
  `actual_price` decimal(8,2) NOT NULL,
  `sell_price` decimal(8,2) NOT NULL,
  `available_quantity` decimal(10,2) DEFAULT NULL,
  `stock_quantity` decimal(8,2) DEFAULT NULL,
  `brand_id` varchar(255) DEFAULT NULL,
  `brand_name` varchar(255) DEFAULT NULL,
  `primary_image` blob DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_code`, `product_name`, `product_description`, `category_id`, `category_name`, `subcategory_id`, `subcategory_name`, `delivery_target_days`, `discount`, `actual_price`, `sell_price`, `available_quantity`, `stock_quantity`, `brand_id`, `brand_name`, `primary_image`, `created_at`, `updated_at`) VALUES
(1, 'FMD177357', 'Pampers Pants 42s (Large)', 'Basic description of Baby Care 1', '1', 'Baby Care', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 1109.00, 10.00, 10.00, ' Pa00001', 'Pamper', NULL, '2024-09-15 22:50:39', '2024-09-15 23:39:03'),
(2, 'FMD230989', 'Pampers Diapers 34s (XL)', 'Basic description of Baby Care 11', '1', 'Baby Care', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 1268.00, 10.00, 10.00, ' Pa00001', 'Pamper', NULL, '2024-09-15 22:50:39', '2024-09-15 23:39:03'),
(3, 'FMD174425', 'Lamjung (Washed) Filter Grind 1000 gm', 'Basic description of Beverages 24', '4', 'Beverages', '4', 'Coffee', '0', 0.00, 0.00, 2490.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:39', '2024-09-15 23:39:03'),
(4, 'FMD195308', 'Chicken Wings (800 gm)', 'Basic description of Meat, Fish & Seafood 112', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 590.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:39', '2024-09-15 23:39:03'),
(5, 'FMD194679', 'Chicken Drumstick (575 gm)', 'Basic description of Meat, Fish & Seafood 113', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 363.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:39', '2024-09-15 23:39:03'),
(6, 'FMD194680', 'Chicken Wings (1.66 kg)', 'Basic description of Meat, Fish & Seafood 114', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 1235.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:39', '2024-09-15 23:39:03'),
(7, 'FMD197054', 'N & H Chicken Wings (950 gm)', 'Basic description of Meat, Fish & Seafood 115', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 703.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:39', '2024-09-15 23:39:03'),
(8, 'FMD197055', 'Chicken Wings (436 gm)', 'Basic description of Meat, Fish & Seafood 116', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 208.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:39', '2024-09-15 23:39:03'),
(9, 'FMD197056', 'Chicken Whole Leg  (625 gm)', 'Basic description of Meat, Fish & Seafood 117', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 396.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:39', '2024-09-15 23:39:03'),
(10, 'FMD317313', 'N&H Chicken Drumstick (1600 kg)', 'Basic description of Meat, Fish & Seafood 118', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 1270.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:39', '2024-09-15 23:39:03'),
(11, 'FMD317314', 'N&H Chicken Legs  (1 kg )', 'Basic description of Meat, Fish & Seafood 119', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 890.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:39', '2024-09-15 23:39:03'),
(12, 'FMD319021', 'N&H Chicken Legs (900 gm)', 'Basic description of Meat, Fish & Seafood 120', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 710.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:39', '2024-09-15 23:39:03'),
(13, 'FMD319022', 'N&H Chicken Drumsticks (500 gm)', 'Basic description of Meat, Fish & Seafood 121', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 440.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:39', '2024-09-15 23:39:03'),
(14, 'FMD174426', 'Lamjung (Washed) Beans 250 gm', 'Basic description of Beverages 25', '4', 'Beverages', '4', 'Coffee', '0', 0.00, 0.00, 780.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:39', '2024-09-15 23:39:03'),
(15, 'FMD319023', 'N&H Chicken Wings (930 gm)', 'Basic description of Meat, Fish & Seafood 122', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 827.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:39', '2024-09-15 23:39:03'),
(16, 'FMD323193', 'N&H Chicken Drumsticks (530 gm)', 'Basic description of Meat, Fish & Seafood 123', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 414.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:39', '2024-09-15 23:39:03'),
(17, 'FMD324325', 'N&H Chicken Drumsticks (510 gm)', 'Basic description of Meat, Fish & Seafood 124', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 449.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:39', '2024-09-15 23:39:03'),
(18, 'FMD324326', 'N&H Chicken Legs (430 gm)', 'Basic description of Meat, Fish & Seafood 125', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 334.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:39', '2024-09-15 23:39:03'),
(19, 'FMD324327', 'N&H Chicken Legs (500 gm)', 'Basic description of Meat, Fish & Seafood 126', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 440.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:39', '2024-09-15 23:39:03'),
(20, 'FMD324695', 'N&H Chicken Drumsticks (1 kg)', 'Basic description of Meat, Fish & Seafood 127', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 890.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:40', '2024-09-15 23:39:03'),
(21, 'FMD325649', 'N&H Chicken Drumsticks (430 gm)', 'Basic description of Meat, Fish & Seafood 128', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 423.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:40', '2024-09-15 23:39:03'),
(22, 'FMD325651', 'N&H Chicken Drumsticks (520 gm)', 'Basic description of Meat, Fish & Seafood 130', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 458.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:40', '2024-09-15 23:39:03'),
(23, 'FMD325705', 'N&H Tenderloin Mince (500 gm)', 'Basic description of Meat, Fish & Seafood 131', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 490.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:40', '2024-09-15 23:39:03'),
(24, 'FMD325850', 'N&H Chicken Legs (0.560 kg)', 'Basic description of Meat, Fish & Seafood 132', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 494.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:40', '2024-09-15 23:39:03'),
(25, 'FMD174427', 'Lamjung (Washed) Filter Grind 500 gm', 'Basic description of Beverages 26', '4', 'Beverages', '4', 'Coffee', '0', 0.00, 0.00, 1240.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:40', '2024-09-15 23:39:03'),
(26, 'FMD310839', 'N&H Whole Chicken (1 kg)', 'Basic description of Meat, Fish & Seafood 133', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 590.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:40', '2024-09-15 23:39:03'),
(27, 'FMD310840', 'N&H Chicken Drumstick (1 kg)', 'Basic description of Meat, Fish & Seafood 134', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 890.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:40', '2024-09-15 23:39:03'),
(28, 'FMD310841', 'N&H Boneless Chicken Breast (500 gm)', 'Basic description of Meat, Fish & Seafood 135', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 590.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:40', '2024-09-15 23:39:03'),
(29, 'FMD310842', 'N&H Boneless Chicken Cubes (500 gm)', 'Basic description of Meat, Fish & Seafood 136', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 515.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:40', '2024-09-15 23:39:03'),
(30, 'FMD308525', 'N&H Chicken Leg (320  gm)', 'Basic description of Meat, Fish & Seafood 137', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 246.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:40', '2024-09-15 23:39:03'),
(31, 'FMD308526', 'N&H Chicken Leg (380 gm)', 'Basic description of Meat, Fish & Seafood 138', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 294.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:40', '2024-09-15 23:39:03'),
(32, 'FMD308527', 'N&H Chicken Leg (390 gm)', 'Basic description of Meat, Fish & Seafood 139', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 302.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:40', '2024-09-15 23:39:03'),
(33, 'FMD315083', 'N&H Chicken Wings  (790 gm)', 'Basic description of Meat, Fish & Seafood 140', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 701.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:40', '2024-09-15 23:39:04'),
(34, 'FMD326083', 'N&H Chicken Drumstick (570 gm)', 'Basic description of Meat, Fish & Seafood 141', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 503.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:40', '2024-09-15 23:39:04'),
(35, 'FMD326084', 'N&H Chicken Drumstick (500 gm)', 'Basic description of Meat, Fish & Seafood 142', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 440.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:40', '2024-09-15 23:39:04'),
(36, 'FMD174428', 'Nuwakot (Washed) Beans 1000 gm', 'Basic description of Beverages 27', '4', 'Beverages', '4', 'Coffee', '0', 0.00, 0.00, 2490.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:40', '2024-09-15 23:39:04'),
(37, 'FMD326085', 'N&H Chicken Legs (380 gm)', 'Basic description of Meat, Fish & Seafood 143', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 294.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:40', '2024-09-15 23:39:04'),
(38, 'FMD326086', 'N&H Chicken Legs (520 gm)', 'Basic description of Meat, Fish & Seafood 144', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 458.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:40', '2024-09-15 23:39:04'),
(39, 'FMD326087', 'N&H Chicken Wings (940 gm)', 'Basic description of Meat, Fish & Seafood 145', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 948.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:40', '2024-09-15 23:39:04'),
(40, 'FMD329577', 'N&H Chicken Drumstick (510 gm)', 'Basic description of Meat, Fish & Seafood 146', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 449.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:40', '2024-09-15 23:39:04'),
(41, 'FMD331214', 'N&H Chicken Drumstick (470 gm)', 'Basic description of Meat, Fish & Seafood 147', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 413.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:40', '2024-09-15 23:39:04'),
(42, 'FMD331215', 'N&H Chicken Drumstick (480 gm)', 'Basic description of Meat, Fish & Seafood 148', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 422.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:40', '2024-09-15 23:39:04'),
(43, 'FMD331216', 'N&H Chicken Drumstick (670 gm)', 'Basic description of Meat, Fish & Seafood 149', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 593.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:40', '2024-09-15 23:39:04'),
(44, 'FMD331217', 'N&H Chicken Leg (450 gm)', 'Basic description of Meat, Fish & Seafood 150', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 395.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:40', '2024-09-15 23:39:04'),
(45, 'FMD331218', 'N&H Chicken Leg (490 gm)', 'Basic description of Meat, Fish & Seafood 151', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 431.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:40', '2024-09-15 23:39:04'),
(46, 'FMD326694', 'N&H Chicken Drumstick (550 gm)', 'Basic description of Meat, Fish & Seafood 152', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 485.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:40', '2024-09-15 23:39:04'),
(47, 'FMD174429', 'Nuwakot (Washed) Beans 250 gm', 'Basic description of Beverages 28', '4', 'Beverages', '4', 'Coffee', '0', 0.00, 0.00, 780.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:40', '2024-09-15 23:39:04'),
(48, 'FMD334068', 'N&H Chicken Drumstick (460 gm)', 'Basic description of Meat, Fish & Seafood 153', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 404.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:40', '2024-09-15 23:39:04'),
(49, 'FMD334070', 'N&H Chicken Leg (460 gm)', 'Basic description of Meat, Fish & Seafood 155', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 404.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:40', '2024-09-15 23:39:04'),
(50, 'FMD334071', 'N&H Chicken Leg (540 gm)', 'Basic description of Meat, Fish & Seafood 156', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 476.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:40', '2024-09-15 23:39:04'),
(51, 'FMD338488', 'N&H Chicken Drumstick (490 gm)', 'Basic description of Meat, Fish & Seafood 159', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 431.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:40', '2024-09-15 23:39:04'),
(52, 'FMD338489', 'N&H Chicken Drumsticks(610 GM)', 'Basic description of Meat, Fish & Seafood 160', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 539.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:40', '2024-09-15 23:39:04'),
(53, 'FMD338490', 'N&H Chicken Leg (480 GM)', 'Basic description of Meat, Fish & Seafood 161', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 422.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:40', '2024-09-15 23:39:04'),
(54, 'FMD342126', 'N&H Chicken Drumstick (440 gm)', 'Basic description of Meat, Fish & Seafood 163', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 386.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:40', '2024-09-15 23:39:04'),
(55, 'FMD346158', 'N & H Chicken Drumstick (1.08 kg)', 'Basic description of Meat, Fish & Seafood 164', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 962.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:04'),
(56, 'FMD343616', 'N &H Chicken Drumstick (890 gm)', 'Basic description of Meat, Fish & Seafood 165', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 791.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:04'),
(57, 'FMD343617', 'N&H Chicken Leg (980 gm)', 'Basic description of Meat, Fish & Seafood 166', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 872.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:04'),
(58, 'FMD174430', 'Nuwakot (Washed) Beans 500 gm', 'Basic description of Beverages 29', '4', 'Beverages', '4', 'Coffee', '0', 0.00, 0.00, 1240.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:04'),
(59, 'FMD346425', 'N&H Whole Chicken (1580 gm)', 'Basic description of Meat, Fish & Seafood 167', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 1096.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:04'),
(60, 'FMD348119', 'N&H Whole Chicken (1.730 gm)', 'Basic description of Meat, Fish & Seafood 168', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 1201.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:04'),
(61, 'FMD350564', 'N & H Chicken Leg (0.910 gm)', 'Basic description of Meat, Fish & Seafood 169', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 809.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:04'),
(62, 'FMD350610', 'N & H Chicken Drumstick (1.130 gm)', 'Basic description of Meat, Fish & Seafood 170', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 1007.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:04'),
(63, 'FMD353208', 'N&H Whole Chicken 1710g', 'Basic description of Meat, Fish & Seafood 171', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 1187.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:04'),
(64, 'FMD353371', 'N&H Chicken Drumstick (1.260 Kg)', 'Basic description of Meat, Fish & Seafood 172', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 1124.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:04'),
(65, 'FMD353372', 'N&H Chicken Leg 900 gm', 'Basic description of Meat, Fish & Seafood 173', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 800.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:05'),
(66, 'FMD364167', 'N&H Whole Chicken (1480g)', 'Basic description of Meat, Fish & Seafood 174', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 1026.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:05'),
(67, 'FMD364341', 'N&H Chicken Drumsticks (950 gm)', 'Basic description of Meat, Fish & Seafood 175', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 845.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:05'),
(68, 'FMD366365', 'N&H Chicken Legs (1140 gm)', 'Basic description of Meat, Fish & Seafood 176', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 1016.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:05'),
(69, 'FMD174431', 'Nuwakot (Washed) Filter Grind 1000 gm', 'Basic description of Beverages 30', '4', 'Beverages', '4', 'Coffee', '0', 0.00, 0.00, 2490.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:05'),
(70, 'FMD353616', 'N&H Chicken Drumstick 1050 gm', 'Basic description of Meat, Fish & Seafood 177', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 935.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:05'),
(71, 'FMD353617', 'N&H Chicken Wings 1060 gm', 'Basic description of Meat, Fish & Seafood 178', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 1071.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:05'),
(72, 'FMD354799', 'Whole Chicken (1.8 kg)', 'Basic description of Meat, Fish & Seafood 179', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 1250.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:05'),
(73, 'FMD355791', 'Chi. Drumstick', 'Basic description of Meat, Fish & Seafood 180', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 899.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:05'),
(74, 'FMD355792', 'N&H Chicken Leg (550 gm)', 'Basic description of Meat, Fish & Seafood 181', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 485.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:05'),
(75, 'FMD363091', 'N&H Chicken Leg (530 gm)', 'Basic description of Meat, Fish & Seafood 182', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 467.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:05'),
(76, 'FMD363092', 'N&H Chicken Drumsticks (1.060 gm)', 'Basic description of Meat, Fish & Seafood 183', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 944.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:05'),
(77, 'FMD404099', 'N&H Pork Belly - 1 Kg', 'Basic description of Meat, Fish & Seafood 184', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 1440.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:05'),
(78, 'FMD404100', 'N&H Pork Chop - 1 Kg', 'Basic description of Meat, Fish & Seafood 185', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 1640.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:05'),
(79, 'FMD404101', 'N&H Smoked Chicken Breast- 1 Kg', 'Basic description of Meat, Fish & Seafood 186', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 1740.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:05'),
(80, 'FMD174432', 'Lamjung (Washed) Filter Grind 250 gm', 'Basic description of Beverages 31', '4', 'Beverages', '4', 'Coffee', '0', 0.00, 0.00, 780.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:05'),
(81, 'FMD404102', 'N&H Trout Fish - 1 Kg', 'Basic description of Meat, Fish & Seafood 187', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 1890.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:05'),
(82, 'FMD385516', 'Betagro Chicken Nuggets 500Gm', 'Basic description of Meat, Fish & Seafood 189', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 1790.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:05'),
(83, 'FMD398241', 'Chicken Drumstick (1.07 gm)', 'Basic description of Meat, Fish & Seafood 190', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 953.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:05'),
(84, 'FMD384998', 'N&H Smokey Cheese Sausage Chicken 500Gm', 'Basic description of Meat, Fish & Seafood 191', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 690.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:05'),
(85, 'FMD385242', 'Hungritos Fries (2.5 kg)', 'Basic description of Meat, Fish & Seafood 192', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 1040.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:05'),
(86, 'FMD277775', 'AMP Chicken Whole Leg (1405 gm)', 'Basic description of Meat, Fish & Seafood 194', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 936.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:05'),
(87, 'FMD281001', 'N&H Chicken Drumstick (1130 gm)', 'Basic description of Meat, Fish & Seafood 195', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 814.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:05'),
(88, 'FMD281002', 'N&H Chicken Legs (490 gm)', 'Basic description of Meat, Fish & Seafood 196', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 382.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:05'),
(89, 'FMD281003', 'N&H Chicken Legs (440 gm)', 'Basic description of Meat, Fish & Seafood 197', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 342.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:05'),
(90, 'FMD278483', 'AMP Chicken Whole Leg (660  gm)', 'Basic description of Meat, Fish & Seafood 198', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 452.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:05'),
(91, 'FMD174433', 'Nuwakot (Washed) Filter Grind 500 gm', 'Basic description of Beverages 32', '4', 'Beverages', '4', 'Coffee', '0', 0.00, 0.00, 1240.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:05'),
(92, 'FMD281008', 'N&H Chicken Legs (560 gm)', 'Basic description of Meat, Fish & Seafood 199', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 438.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:05'),
(93, 'FMD253884', 'N&H Chicken Wings (830 g)', 'Basic description of Meat, Fish & Seafood 200', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 654.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:05'),
(94, 'FMD254322', 'Broiler Cobb 500 Curry Cut (1 kg)', 'Basic description of Meat, Fish & Seafood 201', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 440.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:05'),
(95, 'FMD232584', 'AMP Chicken Lolly (790 gm)', 'Basic description of Meat, Fish & Seafood 203', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 479.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:05'),
(96, 'FMD246503', 'N&H Chicken Drumstick (790 gm)', 'Basic description of Meat, Fish & Seafood 205', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 890.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:05'),
(97, 'FMD249382', 'N&H Chicken Boneless Leg (500 gm)', 'Basic description of Meat, Fish & Seafood 206', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 465.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:05'),
(98, 'FMD251325', 'N&H Chicken Gizzard (400 gm)', 'Basic description of Meat, Fish & Seafood 207', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 390.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:05'),
(99, 'FMD251326', 'N&H Chicken Wings (770 gm)', 'Basic description of Meat, Fish & Seafood 208', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 606.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:05'),
(100, 'FMD226169', 'AMP Chicken Whole Leg (1.4 kg)', 'Basic description of Meat, Fish & Seafood 209', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 965.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:05'),
(101, 'FMD230902', 'N&H Boneless Chicken Leg (500 gm)', 'Basic description of Meat, Fish & Seafood 210', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 465.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:05'),
(102, 'FMD174434', 'Palpa (Natural) Beans 1000 gm', 'Basic description of Beverages 33', '4', 'Beverages', '4', 'Coffee', '0', 0.00, 0.00, 2490.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:05'),
(103, 'FMD229746', 'VCS Chicken Nuggets (500 gm)', 'Basic description of Meat, Fish & Seafood 211', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 305.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:05'),
(104, 'FMD302513', 'N&H Chicken Wings (750 gm)', 'Basic description of Meat, Fish & Seafood 212', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 590.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:05'),
(105, 'FMD302515', 'N&H Chicken Wings (800 gm)', 'Basic description of Meat, Fish & Seafood 214', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 710.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:05'),
(106, 'FMD302516', 'N&H Chicken Wings (840 gm)', 'Basic description of Meat, Fish & Seafood 215', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 662.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:06'),
(107, 'FMD302517', 'N&H Chicken Wings (780 gm)', 'Basic description of Meat, Fish & Seafood 216', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 614.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:06'),
(108, 'FMD302518', 'N&H Chicken Wings (890 gm)', 'Basic description of Meat, Fish & Seafood 217', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 702.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:06'),
(109, 'FMD293169', 'VCS Chicken Leg Whole (815 gm)', 'Basic description of Meat, Fish & Seafood 222', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 560.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:06'),
(110, 'FMD298275', 'N&H Chicken Legs (550 gm)', 'Basic description of Meat, Fish & Seafood 223', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 430.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:06'),
(111, 'FMD298276', 'N&H Chicken Legs (580 gm)', 'Basic description of Meat, Fish & Seafood 224', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 454.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:06'),
(112, 'FMD298278', 'N&H Chicken Legs (590 gm)', 'Basic description of Meat, Fish & Seafood 226', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 462.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:06'),
(113, 'FMD230990', 'Pampers Diapers 34s (XL) [Pack of 3]', 'Basic description of Baby Care 12', '1', 'Baby Care', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 3824.00, 10.00, 10.00, ' Pa00001', 'Pamper', NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:06'),
(114, 'FMD174435', 'Palpa (Natural) Beans 250 gm', 'Basic description of Beverages 34', '4', 'Beverages', '4', 'Coffee', '0', 0.00, 0.00, 780.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:06'),
(115, 'FMD285776', 'N&H Chicken Wings (810 gm)', 'Basic description of Meat, Fish & Seafood 227', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 638.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:06'),
(116, 'FMD286835', 'N&H Chicken Wings (910 gm)', 'Basic description of Meat, Fish & Seafood 228', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 718.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:06'),
(117, 'FMD174117', 'Prawn Loose 21/25 (1 kg)', 'Basic description of Meat, Fish & Seafood 229', '13', 'Meat, Fish & Seafood', '23', 'Seafood', '0', 0.00, 0.00, 1940.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:06'),
(118, 'FMD174106', 'Basa Steak - (1 Kg)', 'Basic description of Meat, Fish & Seafood 230', '13', 'Meat, Fish & Seafood', '23', 'Seafood', '0', 0.00, 0.00, 585.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:06'),
(119, 'FMD174100', 'Norwegian Salmon Portions - (150 gm)', 'Basic description of Meat, Fish & Seafood 231', '13', 'Meat, Fish & Seafood', '23', 'Seafood', '0', 0.00, 0.00, 920.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:06'),
(120, 'FMD174092', 'Medium Prawn (500 gm)', 'Basic description of Meat, Fish & Seafood 232', '13', 'Meat, Fish & Seafood', '23', 'Seafood', '0', 0.00, 0.00, 990.00, 10.00, 10.00, ' Ni00001', 'Nina &amp; Hager', NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:06'),
(121, 'FMD174093', 'N&H Shrimp - (500 gm)', 'Basic description of Meat, Fish & Seafood 233', '13', 'Meat, Fish & Seafood', '23', 'Seafood', '0', 0.00, 0.00, 790.00, 10.00, 10.00, ' Ni00001', 'Nina &amp; Hager', NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:06'),
(122, 'FMD174090', 'Jumbo Prawn - (500 gm)', 'Basic description of Meat, Fish & Seafood 234', '13', 'Meat, Fish & Seafood', '23', 'Seafood', '0', 0.00, 0.00, 1190.00, 10.00, 10.00, ' Ni00001', 'Nina &amp; Hager', NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:06'),
(123, 'FMD230017', 'N&H Smoked Salmon (Norway) 200gm', 'Basic description of Meat, Fish & Seafood 235', '13', 'Meat, Fish & Seafood', '23', 'Seafood', '0', 0.00, 0.00, 1690.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:06'),
(124, 'FMD181552', 'N&H Basa Fish Fillet (1.05 kg)', 'Basic description of Meat, Fish & Seafood 236', '13', 'Meat, Fish & Seafood', '24', 'Fish', '0', 0.00, 0.00, 620.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:06'),
(125, 'FMD174436', 'Palpa (Natural) Beans 500 gm', 'Basic description of Beverages 35', '4', 'Beverages', '4', 'Coffee', '0', 0.00, 0.00, 1240.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:06'),
(126, 'FMD181556', 'N&H Trout Fish  (1.73 kg)', 'Basic description of Meat, Fish & Seafood 237', '13', 'Meat, Fish & Seafood', '24', 'Fish', '0', 0.00, 0.00, 2412.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:06'),
(127, 'FMD182923', 'Trout Fish (0.72  kg)', 'Basic description of Meat, Fish & Seafood 238', '13', 'Meat, Fish & Seafood', '24', 'Fish', '0', 0.00, 0.00, 1106.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:06'),
(128, 'FMD177806', 'N&H Trout Fish (1.3 kg)', 'Basic description of Meat, Fish & Seafood 239', '13', 'Meat, Fish & Seafood', '24', 'Fish', '0', 0.00, 0.00, 1810.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:06'),
(129, 'FMD214622', 'Pangash Fish Fillet - (500 gm, Boneless)', 'Basic description of Meat, Fish & Seafood 240', '13', 'Meat, Fish & Seafood', '24', 'Fish', '0', 0.00, 0.00, 1090.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:06'),
(130, 'FMD215076', 'N & H Trout Fish (690 gm)', 'Basic description of Meat, Fish & Seafood 241', '13', 'Meat, Fish & Seafood', '24', 'Fish', '0', 0.00, 0.00, 1059.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:06'),
(131, 'FMD215621', 'N&H Trout Fish (1470 gm)', 'Basic description of Meat, Fish & Seafood 242', '13', 'Meat, Fish & Seafood', '24', 'Fish', '0', 0.00, 0.00, 2268.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:06'),
(132, 'FMD204154', 'N&H Trout Fish (800 gm)', 'Basic description of Meat, Fish & Seafood 243', '13', 'Meat, Fish & Seafood', '24', 'Fish', '0', 0.00, 0.00, 1110.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:06'),
(133, 'FMD205762', 'VCS Basa Fish Steak (1 kg)', 'Basic description of Meat, Fish & Seafood 244', '13', 'Meat, Fish & Seafood', '24', 'Fish', '0', 0.00, 0.00, 590.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:06'),
(134, 'FMD194648', 'N&H Frozen Pangasius Fish Ball 500Gm', 'Basic description of Meat, Fish & Seafood 245', '13', 'Meat, Fish & Seafood', '24', 'Fish', '0', 0.00, 0.00, 1090.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:06'),
(135, 'FMD194664', 'Basa Fish Fillet -  (1090 gm)', 'Basic description of Meat, Fish & Seafood 246', '13', 'Meat, Fish & Seafood', '24', 'Fish', '0', 0.00, 0.00, 644.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:06'),
(136, 'FMD174437', 'Palpa (Natural) Filter Grind 1000 gm', 'Basic description of Beverages 36', '4', 'Beverages', '4', 'Coffee', '0', 0.00, 0.00, 2490.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:06'),
(137, 'FMD197264', 'VCS Basa Steak(1 kg)', 'Basic description of Meat, Fish & Seafood 247', '13', 'Meat, Fish & Seafood', '24', 'Fish', '0', 0.00, 0.00, 590.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:06'),
(138, 'FMD199017', 'N&H Trout Fish (720 gm)', 'Basic description of Meat, Fish & Seafood 248', '13', 'Meat, Fish & Seafood', '24', 'Fish', '0', 0.00, 0.00, 998.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:06'),
(139, 'FMD174118', 'GFM Trout (1 kg)', 'Basic description of Meat, Fish & Seafood 249', '13', 'Meat, Fish & Seafood', '24', 'Fish', '0', 0.00, 0.00, 1540.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:06'),
(140, 'FMD174115', 'GFM Fish Basa Steak (1 kg)', 'Basic description of Meat, Fish & Seafood 250', '13', 'Meat, Fish & Seafood', '24', 'Fish', '0', 0.00, 0.00, 585.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:06'),
(141, 'FMD174107', 'VCS Fish Ball - (1 Kg)', 'Basic description of Meat, Fish & Seafood 251', '13', 'Meat, Fish & Seafood', '24', 'Fish', '0', 0.00, 0.00, 890.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:06'),
(142, 'FMD174113', 'GFM Fish Basa Fillet (1 kg)', 'Basic description of Meat, Fish & Seafood 252', '13', 'Meat, Fish & Seafood', '24', 'Fish', '0', 0.00, 0.00, 540.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:06'),
(143, 'FMD174087', 'Basa Fish Fillet (1 kg) - NH', 'Basic description of Meat, Fish & Seafood 253', '13', 'Meat, Fish & Seafood', '24', 'Fish', '0', 0.00, 0.00, 590.00, 10.00, 10.00, ' Ni00001', 'Nina &amp; Hager', NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:06'),
(144, 'FMD174088', 'N&H Trout Fish (1 kg)', 'Basic description of Meat, Fish & Seafood 254', '13', 'Meat, Fish & Seafood', '24', 'Fish', '0', 0.00, 0.00, 1890.00, 10.00, 10.00, ' Ni00001', 'Nina &amp; Hager', NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:06'),
(145, 'FMD174103', 'VCS Basa Breaded Fillet - (1 kg)', 'Basic description of Meat, Fish & Seafood 255', '13', 'Meat, Fish & Seafood', '24', 'Fish', '0', 0.00, 0.00, 490.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:06'),
(146, 'FMD174104', 'VCS Basa Fish R Vietnam ( Fillet ) - (1 kg)', 'Basic description of Meat, Fish & Seafood 256', '13', 'Meat, Fish & Seafood', '24', 'Fish', '0', 0.00, 0.00, 440.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:06'),
(147, 'FMD174438', 'Palpa (Natural) Filter Grind 250 gm', 'Basic description of Beverages 37', '4', 'Beverages', '4', 'Coffee', '0', 0.00, 0.00, 780.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:06'),
(148, 'FMD174076', 'Pangash Fish (Steak) - (800 gm)', 'Basic description of Meat, Fish & Seafood 257', '13', 'Meat, Fish & Seafood', '24', 'Fish', '0', 0.00, 0.00, 585.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:06'),
(149, 'FMD174077', 'Salmon Steak Portion (Norway) 150Gm', 'Basic description of Meat, Fish & Seafood 258', '13', 'Meat, Fish & Seafood', '24', 'Fish', '0', 0.00, 0.00, 585.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:06'),
(150, 'FMD174078', 'Sicilian Fresh Raw Italian Sausage 400Gm N&H', 'Basic description of Meat, Fish & Seafood 259', '13', 'Meat, Fish & Seafood', '24', 'Fish', '0', 0.00, 0.00, 740.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:06'),
(151, 'FMD174081', 'Salmon fillet (Norway) (1 kg) - NH', 'Basic description of Meat, Fish & Seafood 260', '13', 'Meat, Fish & Seafood', '24', 'Fish', '0', 0.00, 0.00, 6190.00, 10.00, 10.00, ' Ni00001', 'Nina &amp; Hager', NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:06'),
(152, 'FMD174082', 'Rainbow Trout - (1 kg)', 'Basic description of Meat, Fish & Seafood 261', '13', 'Meat, Fish & Seafood', '24', 'Fish', '0', 0.00, 0.00, 1940.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:07'),
(153, 'FMD177346', 'N&H Trout Fish (0.740 kg)', 'Basic description of Meat, Fish & Seafood 262', '13', 'Meat, Fish & Seafood', '24', 'Fish', '0', 0.00, 0.00, 1026.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:07'),
(154, 'FMD177347', 'N&H Salmon Fillet  - (1.68 kg)', 'Basic description of Meat, Fish & Seafood 263', '13', 'Meat, Fish & Seafood', '24', 'Fish', '0', 0.00, 0.00, 10406.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:07'),
(155, 'FMD174442', 'N&H Basa Fish Fillet (2.06 kg)', 'Basic description of Meat, Fish & Seafood 264', '13', 'Meat, Fish & Seafood', '24', 'Fish', '0', 0.00, 0.00, 1226.00, 10.00, 10.00, ' Ni00001', 'Nina &amp; Hager', NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:07'),
(156, 'FMD313980', 'N&H Trout Fish (730 gm)', 'Basic description of Meat, Fish & Seafood 265', '13', 'Meat, Fish & Seafood', '24', 'Fish', '0', 0.00, 0.00, 1121.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:07'),
(157, 'FMD321070', 'Frozen Pangasius Steak 500Gm', 'Basic description of Meat, Fish & Seafood 266', '13', 'Meat, Fish & Seafood', '24', 'Fish', '0', 0.00, 0.00, 290.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:07'),
(158, 'FMD174439', 'Palpa (Natural) Filter Grind 500 gm', 'Basic description of Beverages 38', '4', 'Beverages', '4', 'Coffee', '0', 0.00, 0.00, 1240.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:07'),
(159, 'FMD318301', 'N&H Dry Shrimp 250Gm', 'Basic description of Meat, Fish & Seafood 267', '13', 'Meat, Fish & Seafood', '24', 'Fish', '0', 0.00, 0.00, 2790.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:07'),
(160, 'FMD316021', 'N&H Trout Fish (740 gm)', 'Basic description of Meat, Fish & Seafood 268', '13', 'Meat, Fish & Seafood', '24', 'Fish', '0', 0.00, 0.00, 1137.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:07'),
(161, 'FMD319293', 'Frozen Pangasius Fillet 1Kg', 'Basic description of Meat, Fish & Seafood 269', '13', 'Meat, Fish & Seafood', '24', 'Fish', '0', 0.00, 0.00, 890.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:07'),
(162, 'FMD342391', 'Carp Fish (800 gm)', 'Basic description of Meat, Fish & Seafood 270', '13', 'Meat, Fish & Seafood', '24', 'Fish', '0', 0.00, 0.00, 640.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:07'),
(163, 'FMD347958', 'N&H Dry Anchovy 500Gm', 'Basic description of Meat, Fish & Seafood 271', '13', 'Meat, Fish & Seafood', '24', 'Fish', '0', 0.00, 0.00, 1090.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:07'),
(164, 'FMD343966', 'N&H Pangas Filet (1 kg)', 'Basic description of Meat, Fish & Seafood 272', '13', 'Meat, Fish & Seafood', '24', 'Fish', '0', 0.00, 0.00, 890.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:07'),
(165, 'FMD336454', 'Pangash Fillet', 'Basic description of Meat, Fish & Seafood 273', '13', 'Meat, Fish & Seafood', '24', 'Fish', '0', 0.00, 0.00, 740.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:07'),
(166, 'FMD407117', 'Trout Fish', 'Basic description of Meat, Fish & Seafood 274', '13', 'Meat, Fish & Seafood', '24', 'Fish', '0', 0.00, 0.00, 3448.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:07'),
(167, 'FMD233976', 'N&H Shrimp 500Gm', 'Basic description of Meat, Fish & Seafood 275', '13', 'Meat, Fish & Seafood', '24', 'Fish', '0', 0.00, 0.00, 790.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:07'),
(168, 'FMD226753', 'Smoked Salmon (Norway) 200Gm', 'Basic description of Meat, Fish & Seafood 276', '13', 'Meat, Fish & Seafood', '24', 'Fish', '0', 0.00, 0.00, 1890.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:07'),
(169, 'FMD215887', 'Nescafe All in One 16 gm', 'Basic description of Beverages 39', '4', 'Beverages', '4', 'Coffee', '0', 0.00, 0.00, 6.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:07'),
(170, 'FMD256943', 'N&H Trout Fish (1.05 kg)', 'Basic description of Meat, Fish & Seafood 278', '13', 'Meat, Fish & Seafood', '24', 'Fish', '0', 0.00, 0.00, 1617.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:07'),
(171, 'FMD254320', 'Pangash Fish Cut (800 gm)', 'Basic description of Meat, Fish & Seafood 279', '13', 'Meat, Fish & Seafood', '24', 'Fish', '0', 0.00, 0.00, 585.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:07'),
(172, 'FMD254321', 'N&H Large Prawn 500Gm', 'Basic description of Meat, Fish & Seafood 280', '13', 'Meat, Fish & Seafood', '24', 'Fish', '0', 0.00, 0.00, 1065.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:07'),
(173, 'FMD254315', 'N&H Fish Sausage (500 gm)', 'Basic description of Meat, Fish & Seafood 281', '13', 'Meat, Fish & Seafood', '24', 'Fish', '0', 0.00, 0.00, 590.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:07'),
(174, 'FMD254316', 'N&H Medium Prawn 500Gm', 'Basic description of Meat, Fish & Seafood 282', '13', 'Meat, Fish & Seafood', '24', 'Fish', '0', 0.00, 0.00, 990.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:41', '2024-09-15 23:39:07'),
(175, 'FMD270569', 'N&H Basa Fish Fillet', 'Basic description of Meat, Fish & Seafood 284', '13', 'Meat, Fish & Seafood', '24', 'Fish', '0', 0.00, 0.00, 940.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:07'),
(176, 'FMD291048', 'N&H Trout Fish (780 gm)', 'Basic description of Meat, Fish & Seafood 285', '13', 'Meat, Fish & Seafood', '24', 'Fish', '0', 0.00, 0.00, 1199.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:07'),
(177, 'FMD291049', 'N&H Trout Fish (710 gm)', 'Basic description of Meat, Fish & Seafood 286', '13', 'Meat, Fish & Seafood', '24', 'Fish', '0', 0.00, 0.00, 1090.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:07'),
(178, 'FMD254314', 'N&H German White Wurst (Pork) 400Gm', 'Basic description of Meat, Fish & Seafood 287', '13', 'Meat, Fish & Seafood', '25', 'Pork', '0', 0.00, 0.00, 470.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:07'),
(179, 'FMD229745', 'N&H Pork Chop Thai (900 gm)', 'Basic description of Meat, Fish & Seafood 288', '13', 'Meat, Fish & Seafood', '25', 'Pork', '0', 0.00, 0.00, 1205.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:07'),
(180, 'FMD215888', 'Nescafe Classic 25 gm', 'Basic description of Beverages 40', '4', 'Beverages', '4', 'Coffee', '0', 0.00, 0.00, 115.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:07'),
(181, 'FMD404107', 'N&H Hot Dog Pork Sausage 400Gm', 'Basic description of Meat, Fish & Seafood 289', '13', 'Meat, Fish & Seafood', '25', 'Pork', '0', 0.00, 0.00, 450.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:07'),
(182, 'FMD404108', 'Toast Ham 250Gm', 'Basic description of Meat, Fish & Seafood 290', '13', 'Meat, Fish & Seafood', '25', 'Pork', '0', 0.00, 0.00, 890.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:07'),
(183, 'FMD404109', 'Vitali Coppa Ham 100Gm', 'Basic description of Meat, Fish & Seafood 291', '13', 'Meat, Fish & Seafood', '25', 'Pork', '0', 0.00, 0.00, 540.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:07'),
(184, 'FMD404111', 'Vitali Prosciutto Crudo Stagionato (Ham)100Gm', 'Basic description of Meat, Fish & Seafood 292', '13', 'Meat, Fish & Seafood', '25', 'Pork', '0', 0.00, 0.00, 720.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:07'),
(185, 'FMD404112', 'Vitali Salame Milano 100Gm', 'Basic description of Meat, Fish & Seafood 293', '13', 'Meat, Fish & Seafood', '25', 'Pork', '0', 0.00, 0.00, 620.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:07'),
(186, 'FMD404113', 'Vitali Spinata Piccante (Chilli Salami)-100Gm', 'Basic description of Meat, Fish & Seafood 294', '13', 'Meat, Fish & Seafood', '25', 'Pork', '0', 0.00, 0.00, 575.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:07'),
(187, 'FMD337861', 'N&H Pork Belly (930 gm)', 'Basic description of Meat, Fish & Seafood 295', '13', 'Meat, Fish & Seafood', '25', 'Pork', '0', 0.00, 0.00, 1245.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:07'),
(188, 'FMD333965', 'N&H Bacon  (500 gm)', 'Basic description of Meat, Fish & Seafood 296', '13', 'Meat, Fish & Seafood', '25', 'Pork', '0', 0.00, 0.00, 790.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:07'),
(189, 'FMD325646', 'N&H Pork Belly (1 kg)', 'Basic description of Meat, Fish & Seafood 297', '13', 'Meat, Fish & Seafood', '25', 'Pork', '0', 0.00, 0.00, 1440.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:07'),
(190, 'FMD175805', 'N&H Pork Ribs (1.73 kg)', 'Basic description of Meat, Fish & Seafood 298', '13', 'Meat, Fish & Seafood', '25', 'Pork', '0', 0.00, 0.00, 2585.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:07'),
(191, 'FMD215889', 'Nescafe Classic 50 gm', 'Basic description of Beverages 41', '4', 'Beverages', '4', 'Coffee', '0', 0.00, 0.00, 250.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:07'),
(192, 'FMD174086', 'B/L Pork Cubes (500 gms) - NH', 'Basic description of Meat, Fish & Seafood 299', '13', 'Meat, Fish & Seafood', '25', 'Pork', '0', 0.00, 0.00, 690.00, 10.00, 10.00, ' Ni00001', 'Nina &amp; Hager', NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:07'),
(193, 'FMD174075', 'N&H Pork Chop (Thai ) (1 kg)', 'Basic description of Meat, Fish & Seafood 300', '13', 'Meat, Fish & Seafood', '25', 'Pork', '0', 0.00, 0.00, 1340.00, 10.00, 10.00, ' Ni00001', 'Nina &amp; Hager', NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:07'),
(194, 'FMD174102', 'N&H B/F Pork Sausage 500Gm', 'Basic description of Meat, Fish & Seafood 301', '13', 'Meat, Fish & Seafood', '25', 'Pork', '0', 0.00, 0.00, 590.00, 10.00, 10.00, ' Ni00001', 'Nina &amp; Hager', NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:07'),
(195, 'FMD174096', 'English Sausage (Pork) (400 gms) - NH', 'Basic description of Meat, Fish & Seafood 302', '13', 'Meat, Fish & Seafood', '25', 'Pork', '0', 0.00, 0.00, 470.00, 10.00, 10.00, ' Ni00001', 'Nina &amp; Hager', NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:07'),
(196, 'FMD174097', 'German Bratwurst (BBQ Pork Sausage) (400 gms) - NH', 'Basic description of Meat, Fish & Seafood 303', '13', 'Meat, Fish & Seafood', '25', 'Pork', '0', 0.00, 0.00, 470.00, 10.00, 10.00, ' Ni00001', 'Nina &amp; Hager', NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:07'),
(197, 'FMD174109', 'N&H Green Peppercorn Lyoner Pork 250Gm', 'Basic description of Meat, Fish & Seafood 304', '13', 'Meat, Fish & Seafood', '25', 'Pork', '0', 0.00, 0.00, 840.00, 10.00, 10.00, ' Ni00001', 'Nina &amp; Hager', NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:07'),
(198, 'FMD174110', 'Pork Mince (500 gms) - NH', 'Basic description of Meat, Fish & Seafood 305', '13', 'Meat, Fish & Seafood', '25', 'Pork', '0', 0.00, 0.00, 590.00, 10.00, 10.00, ' Ni00001', 'Nina &amp; Hager', NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:07'),
(199, 'FMD174111', 'Prime Bacon Slice 250Gm-Thai', 'Basic description of Meat, Fish & Seafood 306', '13', 'Meat, Fish & Seafood', '25', 'Pork', '0', 0.00, 0.00, 890.00, 10.00, 10.00, ' Vi00001', 'Vitali', NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:07'),
(200, 'FMD174112', 'Prime Bacon Slice 500Gm', 'Basic description of Meat, Fish & Seafood 307', '13', 'Meat, Fish & Seafood', '25', 'Pork', '0', 0.00, 0.00, 890.00, 10.00, 10.00, ' Vi00001', 'Vitali', NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:07'),
(201, 'FMD174170', 'Pork Belly Boneless without Skin (1 kg)', 'Basic description of Meat, Fish & Seafood 308', '13', 'Meat, Fish & Seafood', '25', 'Pork', '0', 0.00, 0.00, 1370.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:07');
INSERT INTO `products` (`id`, `product_code`, `product_name`, `product_description`, `category_id`, `category_name`, `subcategory_id`, `subcategory_name`, `delivery_target_days`, `discount`, `actual_price`, `sell_price`, `available_quantity`, `stock_quantity`, `brand_id`, `brand_name`, `primary_image`, `created_at`, `updated_at`) VALUES
(202, 'FMD205057', 'Red Cup (380 gm)', 'Basic description of Beverages 42', '4', 'Beverages', '4', 'Coffee', '0', 0.00, 0.00, 1140.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:07'),
(203, 'FMD195198', 'N&H Pork Sausage (Red Chilli) 500Gm', 'Basic description of Meat, Fish & Seafood 309', '13', 'Meat, Fish & Seafood', '25', 'Pork', '0', 0.00, 0.00, 590.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:07'),
(204, 'FMD181674', 'Sicilian Sausage 400 gms) - NH', 'Basic description of Meat, Fish & Seafood 311', '13', 'Meat, Fish & Seafood', '25', 'Pork', '0', 0.00, 0.00, 532.40, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:07'),
(205, 'FMD178114', 'Buff Mince (500 gms) - NH', 'Basic description of Meat, Fish & Seafood 312', '13', 'Meat, Fish & Seafood', '26', 'Buff', '0', 0.00, 0.00, 390.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:07'),
(206, 'FMD199960', 'Buff Mince (500 gm)', 'Basic description of Meat, Fish & Seafood 313', '13', 'Meat, Fish & Seafood', '26', 'Buff', '0', 0.00, 0.00, 390.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:08'),
(207, 'FMD174122', 'VCSB Buff Mince (500 gm)', 'Basic description of Meat, Fish & Seafood 314', '13', 'Meat, Fish & Seafood', '26', 'Buff', '0', 0.00, 0.00, 305.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:08'),
(208, 'FMD174123', 'Buff Salami (500 gm)', 'Basic description of Meat, Fish & Seafood 315', '13', 'Meat, Fish & Seafood', '26', 'Buff', '0', 0.00, 0.00, 400.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:08'),
(209, 'FMD174098', 'Hot Dog Buff Sausage (400 gms) - NH', 'Basic description of Meat, Fish & Seafood 316', '13', 'Meat, Fish & Seafood', '26', 'Buff', '0', 0.00, 0.00, 370.00, 10.00, 10.00, ' Ni00001', 'Nina &amp; Hager', NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:08'),
(210, 'FMD174147', 'Buff Keema (1 kg)', 'Basic description of Meat, Fish & Seafood 317', '13', 'Meat, Fish & Seafood', '26', 'Buff', '0', 0.00, 0.00, 630.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:08'),
(211, 'FMD174148', 'Buff Sausage (400 gm)', 'Basic description of Meat, Fish & Seafood 318', '13', 'Meat, Fish & Seafood', '26', 'Buff', '0', 0.00, 0.00, 415.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:08'),
(212, 'FMD174149', 'Buff Tender Cut pieces (1 kg)', 'Basic description of Meat, Fish & Seafood 319', '13', 'Meat, Fish & Seafood', '26', 'Buff', '0', 0.00, 0.00, 765.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:08'),
(213, 'FMD406967', 'Cranberry Juice (1 ltr) - Real', 'Basic description of Beverages 43', '4', 'Beverages', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 290.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:08'),
(214, 'FMD174140', 'VCSB Sausage Regular Buff', 'Basic description of Meat, Fish & Seafood 320', '13', 'Meat, Fish & Seafood', '26', 'Buff', '0', 0.00, 0.00, 390.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:08'),
(215, 'FMD174083', 'Buff Sausage (500 gms) - NH', 'Basic description of Meat, Fish & Seafood 321', '13', 'Meat, Fish & Seafood', '26', 'Buff', '0', 0.00, 0.00, 465.00, 10.00, 10.00, ' Ni00001', 'Nina &amp; Hager', NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:08'),
(216, 'FMD176608', 'Buff Salami (200 gm)', 'Basic description of Meat, Fish & Seafood 323', '13', 'Meat, Fish & Seafood', '26', 'Buff', '0', 0.00, 0.00, 790.00, 10.00, 10.00, ' Ad00001', 'Adhunik', NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:08'),
(217, 'FMD176609', 'Buff Sausage (500 gm)', 'Basic description of Meat, Fish & Seafood 324', '13', 'Meat, Fish & Seafood', '26', 'Buff', '0', 0.00, 0.00, 465.00, 10.00, 10.00, ' Ad00001', 'Adhunik', NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:08'),
(218, 'FMD176610', 'Buff Sausage SPCL (500 gm)', 'Basic description of Meat, Fish & Seafood 325', '13', 'Meat, Fish & Seafood', '26', 'Buff', '0', 0.00, 0.00, 340.00, 10.00, 10.00, ' Ad00001', 'Adhunik', NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:08'),
(219, 'FMD176611', 'Whole Buff', 'Basic description of Meat, Fish & Seafood 326', '13', 'Meat, Fish & Seafood', '26', 'Buff', '0', 0.00, 0.00, 515.00, 10.00, 10.00, ' Ad00001', 'Adhunik', NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:08'),
(220, 'FMD174105', 'Mutton Mince (500 gm)', 'Basic description of Meat, Fish & Seafood 327', '13', 'Meat, Fish & Seafood', '27', 'Mutton', '0', 0.00, 0.00, 840.00, 10.00, 10.00, ' Ni00001', 'Nina &amp; Hager', NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:08'),
(221, 'FMD298147', 'Saffola Gold Jar (5 Ltr)', 'Basic description of Oil, Spice & Condiments 1', '14', 'Oil, Spice & Condiments', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 2189.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:08'),
(222, 'FMD298148', 'Sunflow Sunflower Oil (1 Ltr)', 'Basic description of Oil, Spice & Condiments 2', '14', 'Oil, Spice & Condiments', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 255.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:08'),
(223, 'FMD284281', 'Dhara Mustard Oil (1 ltr)', 'Basic description of Oil, Spice & Condiments 3', '14', 'Oil, Spice & Condiments', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 370.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:08'),
(224, 'FMD230991', 'Pampers Diapers 42s (LG) [Pack of 3]', 'Basic description of Baby Care 13', '1', 'Baby Care', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 3824.00, 10.00, 10.00, ' Pa00001', 'Pamper', NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:08'),
(225, 'FMD406968', 'Mango Juice (1 ltr) - Real', 'Basic description of Beverages 44', '4', 'Beverages', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 280.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:08'),
(226, 'FMD254324', 'Raw Mustard Oil (500 ml)', 'Basic description of Oil, Spice & Condiments 4', '14', 'Oil, Spice & Condiments', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 290.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:08'),
(227, 'FMD247720', 'Dhara Sunflower Oil (1 ltr)', 'Basic description of Oil, Spice & Condiments 5', '14', 'Oil, Spice & Condiments', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 360.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:08'),
(228, 'FMD228417', 'Byanjan Sunflower Oil (1 ltr)', 'Basic description of Oil, Spice & Condiments 6', '14', 'Oil, Spice & Condiments', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 240.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:08'),
(229, 'FMD342458', 'Brown Sugar Powder (500 gm)', 'Basic description of Oil, Spice & Condiments 7', '14', 'Oil, Spice & Condiments', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 190.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:08'),
(230, 'FMD342459', 'Jaggery Powder (Pkt)', 'Basic description of Oil, Spice & Condiments 8', '14', 'Oil, Spice & Condiments', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 190.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:08'),
(231, 'FMD342460', 'Raw Sugar Powder (Pkt- 250gm)', 'Basic description of Oil, Spice & Condiments 9', '14', 'Oil, Spice & Condiments', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 110.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:08'),
(232, 'FMD369517', 'Sunflower Oil Sunflow', 'Basic description of Oil, Spice & Condiments 10', '14', 'Oil, Spice & Condiments', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 205.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:08'),
(233, 'FMD191073', 'BMC  Curry Powder (50 gm)', 'Basic description of Oil, Spice & Condiments 11', '14', 'Oil, Spice & Condiments', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 50.00, 10.00, 10.00, ' BM00001', 'BMC', NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:08'),
(234, 'FMD191074', 'BMC Chicken Masala (50 gm)', 'Basic description of Oil, Spice & Condiments 12', '14', 'Oil, Spice & Condiments', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 50.00, 10.00, 10.00, ' BM00001', 'BMC', NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:08'),
(235, 'FMD191075', 'BMC Garam Masala (50 gm)', 'Basic description of Oil, Spice & Condiments 13', '14', 'Oil, Spice & Condiments', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 60.00, 10.00, 10.00, ' BM00001', 'BMC', NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:08'),
(236, 'FMD406969', 'Orange Juice (1 ltr) - Real', 'Basic description of Beverages 45', '4', 'Beverages', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 280.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:08'),
(237, 'FMD191076', 'BMC Momo Masala (50 gm)', 'Basic description of Oil, Spice & Condiments 14', '14', 'Oil, Spice & Condiments', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 50.00, 10.00, 10.00, ' BM00001', 'BMC', NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:08'),
(238, 'FMD191056', 'Snapin Basil (35 gm)', 'Basic description of Oil, Spice & Condiments 15', '14', 'Oil, Spice & Condiments', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 240.00, 10.00, 10.00, ' Sn00001', 'Snapin', NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:08'),
(239, 'FMD191057', 'Snapin Cheesy Garlic Bread Mix (50 gm)', 'Basic description of Oil, Spice & Condiments 16', '14', 'Oil, Spice & Condiments', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 240.00, 10.00, 10.00, ' Sn00001', 'Snapin', NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:08'),
(240, 'FMD191058', 'Snapin Chilli Flakes (35 gm)', 'Basic description of Oil, Spice & Condiments 17', '14', 'Oil, Spice & Condiments', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 240.00, 10.00, 10.00, ' Sn00001', 'Snapin', NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:08'),
(241, 'FMD191059', 'Snapin Cinnamon Powder (45 gm)', 'Basic description of Oil, Spice & Condiments 18', '14', 'Oil, Spice & Condiments', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 240.00, 10.00, 10.00, ' Sn00001', 'Snapin', NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:08'),
(242, 'FMD191060', 'Snapin Crunchy Garlic (45 gm)', 'Basic description of Oil, Spice & Condiments 19', '14', 'Oil, Spice & Condiments', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 185.00, 10.00, 10.00, ' Sn00001', 'Snapin', NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:08'),
(243, 'FMD191061', 'Snapin Ginger Garlic (35 gm)', 'Basic description of Oil, Spice & Condiments 20', '14', 'Oil, Spice & Condiments', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 185.00, 10.00, 10.00, ' Sn00001', 'Snapin', NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:08'),
(244, 'FMD191062', 'Snapin Ginger Powder (45 gm)', 'Basic description of Oil, Spice & Condiments 21', '14', 'Oil, Spice & Condiments', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 185.00, 10.00, 10.00, ' Sn00001', 'Snapin', NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:08'),
(245, 'FMD191063', 'Snapin Kashmiri Chilli Paprika  (40 gm)', 'Basic description of Oil, Spice & Condiments 22', '14', 'Oil, Spice & Condiments', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 185.00, 10.00, 10.00, ' Sn00001', 'Snapin', NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:08'),
(246, 'FMD191064', 'Snapin Mixed Herbs (20 gm)', 'Basic description of Oil, Spice & Condiments 23', '14', 'Oil, Spice & Condiments', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 185.00, 10.00, 10.00, ' Sn00001', 'Snapin', NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:08'),
(247, 'FMD189356', 'Gaia Green Tea Cardamom 25s', 'Basic description of Beverages 46', '4', 'Beverages', '5', 'Tea', '0', 0.00, 0.00, 294.00, 10.00, 10.00, ' GA00001', 'GAIA', NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:08'),
(248, 'FMD191065', 'Snapin Nutmeg Powder (50 gm)', 'Basic description of Oil, Spice & Condiments 24', '14', 'Oil, Spice & Condiments', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 185.00, 10.00, 10.00, ' Sn00001', 'Snapin', NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:08'),
(249, 'FMD191066', 'Snapin Oregano (20 gm)', 'Basic description of Oil, Spice & Condiments 25', '14', 'Oil, Spice & Condiments', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 185.00, 10.00, 10.00, ' Sn00001', 'Snapin', NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:08'),
(250, 'FMD191067', 'Snapin Pasta Mix (25 gm)', 'Basic description of Oil, Spice & Condiments 26', '14', 'Oil, Spice & Condiments', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 185.00, 10.00, 10.00, ' Sn00001', 'Snapin', NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:08'),
(251, 'FMD191068', 'Snapin Piri Piri Mix (50 gm)', 'Basic description of Oil, Spice & Condiments 27', '14', 'Oil, Spice & Condiments', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 185.00, 10.00, 10.00, ' Sn00001', 'Snapin', NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:08'),
(252, 'FMD191069', 'Snapin Pizza Mix (45 gm)', 'Basic description of Oil, Spice & Condiments 28', '14', 'Oil, Spice & Condiments', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 185.00, 10.00, 10.00, ' Sn00001', 'Snapin', NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:08'),
(253, 'FMD191070', 'Snapin Rosemary  (25 gm)', 'Basic description of Oil, Spice & Condiments 29', '14', 'Oil, Spice & Condiments', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 240.00, 10.00, 10.00, ' Sn00001', 'Snapin', NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:08'),
(254, 'FMD191071', 'Snapin Thyme  (6 gm)', 'Basic description of Oil, Spice & Condiments 30', '14', 'Oil, Spice & Condiments', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 240.00, 10.00, 10.00, ' Sn00001', 'Snapin', NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:08'),
(255, 'FMD192286', 'Bread Crumbs (500 gm)', 'Basic description of Oil, Spice & Condiments 31', '14', 'Oil, Spice & Condiments', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 310.00, 10.00, 10.00, ' Un00001', 'Uncle Barns', NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:08'),
(256, 'FMD192287', 'Cheesy Seasoning Powder (500 gm)', 'Basic description of Oil, Spice & Condiments 32', '14', 'Oil, Spice & Condiments', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 630.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:08'),
(257, 'FMD192288', 'Hot & Spicy Tempura Flour (500 gm)', 'Basic description of Oil, Spice & Condiments 33', '14', 'Oil, Spice & Condiments', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 420.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:08'),
(258, 'FMD189357', 'Gaia Green Tea Ginger 25s', 'Basic description of Beverages 47', '4', 'Beverages', '5', 'Tea', '0', 0.00, 0.00, 294.00, 10.00, 10.00, ' GA00001', 'GAIA', NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:08'),
(259, 'FMD192289', 'Paprika Seasoning Powder (500 gm)', 'Basic description of Oil, Spice & Condiments 34', '14', 'Oil, Spice & Condiments', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 630.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:09'),
(260, 'FMD192291', 'Pepper & Garlic Tempura Flour (500 gm)', 'Basic description of Oil, Spice & Condiments 36', '14', 'Oil, Spice & Condiments', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 310.00, 10.00, 10.00, ' Un00001', 'Uncle Barns', NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:09'),
(261, 'FMD192292', 'Tempura Flour (150 gm)', 'Basic description of Oil, Spice & Condiments 37', '14', 'Oil, Spice & Condiments', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 100.00, 10.00, 10.00, ' Un00001', 'Uncle Barns', NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:09'),
(262, 'FMD215987', 'Byanjan Mustard Oil (5 ltrs)', 'Basic description of Oil, Spice & Condiments 38', '14', 'Oil, Spice & Condiments', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 1775.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:09'),
(263, 'FMD215989', 'Byanjan Sunflower Oil (2 ltrs)', 'Basic description of Oil, Spice & Condiments 39', '14', 'Oil, Spice & Condiments', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 640.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:09'),
(264, 'FMD215990', 'Byanjan Sunflower Oil (5 ltrs)', 'Basic description of Oil, Spice & Condiments 40', '14', 'Oil, Spice & Condiments', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 2090.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:09'),
(265, 'FMD174275', 'Fragata Pomace Olive Oil (1 ltr)', 'Basic description of Oil, Spice & Condiments 41', '14', 'Oil, Spice & Condiments', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 1040.00, 10.00, 10.00, ' Fr00001', 'Fragata', NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:09'),
(266, 'FMD174334', 'Saffola Gold (5 Litre)', 'Basic description of Oil, Spice & Condiments 42', '14', 'Oil, Spice & Condiments', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 2590.00, 10.00, 10.00, ' Sa00001', 'Saffola', NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:09'),
(267, 'FMD174335', 'Borges Extra Virgin Olive (Oil 500 ml)', 'Basic description of Oil, Spice & Condiments 43', '14', 'Oil, Spice & Condiments', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 980.00, 10.00, 10.00, ' Bo00001', 'Borges', NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:09'),
(268, 'FMD174336', 'Borges Pomace Olive Oil (1 ltr)', 'Basic description of Oil, Spice & Condiments 44', '14', 'Oil, Spice & Condiments', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 890.00, 10.00, 10.00, ' Bo00001', 'Borges', NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:09'),
(269, 'FMD189358', 'Gaia Green Tea Honey Lime 25s', 'Basic description of Beverages 48', '4', 'Beverages', '5', 'Tea', '0', 0.00, 0.00, 294.00, 10.00, 10.00, ' GA00001', 'GAIA', NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:09'),
(270, 'FMD174196', 'Turmeric Powder (500 gm)', 'Basic description of Oil, Spice & Condiments 45', '14', 'Oil, Spice & Condiments', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 440.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:09'),
(271, 'FMD174440', 'Meizan 5 ltrs', 'Basic description of Oil, Spice & Condiments 46', '14', 'Oil, Spice & Condiments', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 1990.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:09'),
(272, 'FMD174441', 'Meizan 2 ltrs', 'Basic description of Oil, Spice & Condiments 47', '14', 'Oil, Spice & Condiments', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 1040.00, 10.00, 10.00, ' Me00001', 'Meizan', NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:09'),
(273, 'FMD174383', 'Bajra Besan (500 gm)', 'Basic description of Oil, Spice & Condiments 48', '14', 'Oil, Spice & Condiments', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 215.00, 10.00, 10.00, ' Ba00001', 'Bajra', NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:09'),
(274, 'FMD174384', 'Bajra Corriander Powder (500 gm)', 'Basic description of Oil, Spice & Condiments 49', '14', 'Oil, Spice & Condiments', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 190.00, 10.00, 10.00, ' Ba00001', 'Bajra', NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:09'),
(275, 'FMD174375', 'Methi (500gm)', 'Basic description of Oil, Spice & Condiments 50', '14', 'Oil, Spice & Condiments', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 85.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:09'),
(276, 'FMD174376', 'Jeera Seeds (500gm)', 'Basic description of Oil, Spice & Condiments 51', '14', 'Oil, Spice & Condiments', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 640.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:09'),
(277, 'FMD174377', 'Dhaniya Seeds (500 gm)', 'Basic description of Oil, Spice & Condiments 52', '14', 'Oil, Spice & Condiments', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 165.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:09'),
(278, 'FMD174378', 'Jwano (500gm)', 'Basic description of Oil, Spice & Condiments 53', '14', 'Oil, Spice & Condiments', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 215.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:09'),
(279, 'FMD174379', 'Timmur (500 gm)', 'Basic description of Oil, Spice & Condiments 54', '14', 'Oil, Spice & Condiments', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 890.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:09'),
(280, 'FMD189359', 'Gaia Green Tea Lemon 25s', 'Basic description of Beverages 49', '4', 'Beverages', '5', 'Tea', '0', 0.00, 0.00, 294.00, 10.00, 10.00, ' GA00001', 'GAIA', NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:09'),
(281, 'FMD174387', 'Bajra Cumin Powder (500 gm)', 'Basic description of Oil, Spice & Condiments 55', '14', 'Oil, Spice & Condiments', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 675.00, 10.00, 10.00, ' Ba00001', 'Bajra', NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:09'),
(282, 'FMD174388', 'Bajra Maize Powder (1 kg)', 'Basic description of Oil, Spice & Condiments 56', '14', 'Oil, Spice & Condiments', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 70.00, 10.00, 10.00, ' Ba00001', 'Bajra', NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:09'),
(283, 'FMD174389', 'Bajra Taichin Rice Powder (500 gm)', 'Basic description of Oil, Spice & Condiments 57', '14', 'Oil, Spice & Condiments', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 55.00, 10.00, 10.00, ' Ba00001', 'Bajra', NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:09'),
(284, 'FMD174390', 'Bajra Turmeric Powder (500 gm)', 'Basic description of Oil, Spice & Condiments 58', '14', 'Oil, Spice & Condiments', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 190.00, 10.00, 10.00, ' Ba00001', 'Bajra', NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:09'),
(285, 'FMD177350', 'Bajra Taichin Rice Powder (1 kg)', 'Basic description of Oil, Spice & Condiments 59', '14', 'Oil, Spice & Condiments', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 120.00, 10.00, 10.00, ' Ba00001', 'Bajra', NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:09'),
(286, 'FMD379767', 'Roza Tuna', 'Basic description of Packaged & Canned Foods 1', '15', 'Packaged & Canned Foods', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 190.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:09'),
(287, 'FMD322874', 'Sardine in Tomato Sauce (185 Gms) - Roza', 'Basic description of Packaged & Canned Foods 2', '15', 'Packaged & Canned Foods', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 185.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:09'),
(288, 'FMD215869', 'Moby Tuna (170 gm)', 'Basic description of Packaged & Canned Foods 3', '15', 'Packaged & Canned Foods', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 190.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:09'),
(289, 'FMD284088', 'Current Chicken Hot & Spicy Noodles 100g', 'Basic description of Pasta & Noodles 1', '16', 'Pasta & Noodles', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 240.00, 10.00, 10.00, ' Te00001', 'Test Brand 1', NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:09'),
(290, 'FMD284089', 'Current Veg Hot & Spicy Noodles 100g', 'Basic description of Pasta & Noodles 2', '16', 'Pasta & Noodles', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 240.00, 10.00, 10.00, ' Te00001', 'Test Brand 1', NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:09'),
(291, 'FMD174355', 'NESTEA Iced Tea Lemon (Sipper Free) - 400 gm', 'Basic description of Beverages 50', '4', 'Beverages', '5', 'Tea', '0', 0.00, 0.00, 254.00, 10.00, 10.00, ' Ne00002', 'Nestea', NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:09'),
(292, 'FMD232563', 'Divella Pasta Penne (1 kg)', 'Basic description of Pasta & Noodles 3', '16', 'Pasta & Noodles', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 360.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:09'),
(293, 'FMD251000', 'Pasta Sauce Divella (680 gm)', 'Basic description of Pasta & Noodles 4', '16', 'Pasta & Noodles', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 400.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:09'),
(294, 'FMD364096', 'Macaroni (350 gms) - Mums', 'Basic description of Pasta & Noodles 5', '16', 'Pasta & Noodles', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 80.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:09'),
(295, 'FMD364097', 'Penne Fusilli (350 gms) - Mums', 'Basic description of Pasta & Noodles 6', '16', 'Pasta & Noodles', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 80.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:09'),
(296, 'FMD364098', 'Penne Pasta (350 gms) - Mums', 'Basic description of Pasta & Noodles 7', '16', 'Pasta & Noodles', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 80.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:09'),
(297, 'FMD319024', 'Mazza Spaghetti (500 gm)', 'Basic description of Pasta & Noodles 8', '16', 'Pasta & Noodles', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 275.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:09'),
(298, 'FMD318766', 'Mazza  Penne pasta (500 gm)', 'Basic description of Pasta & Noodles 9', '16', 'Pasta & Noodles', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 275.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:09'),
(299, 'FMD188345', 'Divella Pasta Fusilli 40 (1 kg)', 'Basic description of Pasta & Noodles 10', '16', 'Pasta & Noodles', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 350.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:09'),
(300, 'FMD189363', 'Nong Shim Kimchi Ramyun (Pack of 5)', 'Basic description of Pasta & Noodles 11', '16', 'Pasta & Noodles', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 740.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:09'),
(301, 'FMD189364', 'Nong Shim Shin Ramyun (Pack of 5)', 'Basic description of Pasta & Noodles 12', '16', 'Pasta & Noodles', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 590.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:09'),
(302, 'FMD179946', 'Green Tea', 'Basic description of Beverages 51', '4', 'Beverages', '5', 'Tea', '0', 0.00, 0.00, 350.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:09'),
(303, 'FMD189365', 'Nong Shim Veggie Soon Ramyun (Pack of 5)', 'Basic description of Pasta & Noodles 13', '16', 'Pasta & Noodles', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 740.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:09'),
(304, 'FMD215896', 'Maggi Chicken Noodles (284 gms)', 'Basic description of Pasta & Noodles 14', '16', 'Pasta & Noodles', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 140.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:10'),
(305, 'FMD215861', 'Agnesi Spaghetti (500 gm)', 'Basic description of Pasta & Noodles 15', '16', 'Pasta & Noodles', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 215.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:10'),
(306, 'FMD214258', 'Nong Shim Shin Ramyun', 'Basic description of Pasta & Noodles 16', '16', 'Pasta & Noodles', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 740.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:10'),
(307, 'FMD174456', 'Maggi 2 minutes Masala 280 gms', 'Basic description of Pasta & Noodles 17', '16', 'Pasta & Noodles', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 110.00, 10.00, 10.00, ' Ma00001', 'Maggi', NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:10'),
(308, 'FMD174457', 'Maggi Nutrilicious Atta Masala 290 gms', 'Basic description of Pasta & Noodles 18', '16', 'Pasta & Noodles', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 230.00, 10.00, 10.00, ' Ma00001', 'Maggi', NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:10'),
(309, 'FMD174458', 'Maggi Nutrilicious Oats Masala 290 gms', 'Basic description of Pasta & Noodles 19', '16', 'Pasta & Noodles', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 225.00, 10.00, 10.00, ' Ma00001', 'Maggi', NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:10'),
(310, 'FMD174731', 'Divella Pasta Penne Ziti Rigate 27 (1 kg)', 'Basic description of Pasta & Noodles 20', '16', 'Pasta & Noodles', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 340.00, 10.00, 10.00, ' Di00001', 'Divella', NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:10'),
(311, 'FMD174413', 'Samyang  3x Spicy (700 gm)', 'Basic description of Pasta & Noodles 21', '16', 'Pasta & Noodles', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 890.00, 10.00, 10.00, ' Sa00002', 'Samyang', NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:10'),
(312, 'FMD174414', 'Samyang Hot Chicken Spicy (700 gm)', 'Basic description of Pasta & Noodles 22', '16', 'Pasta & Noodles', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 890.00, 10.00, 10.00, ' Sa00002', 'Samyang', NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:10'),
(313, 'FMD179947', 'Orthodox Black Tea', 'Basic description of Beverages 52', '4', 'Beverages', '5', 'Tea', '0', 0.00, 0.00, 300.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:10'),
(314, 'FMD174260', 'Divella Pasta Fusilli 40 (500 gm)', 'Basic description of Pasta & Noodles 23', '16', 'Pasta & Noodles', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 180.00, 10.00, 10.00, ' Di00001', 'Divella', NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:10'),
(315, 'FMD174261', 'Divella Pasta  Penne Ziti Rigate 27 (500 gm)', 'Basic description of Pasta & Noodles 24', '16', 'Pasta & Noodles', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 180.00, 10.00, 10.00, ' Di00001', 'Divella', NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:10'),
(316, 'FMD174262', 'Divella Spaghettini (1000 gm)', 'Basic description of Pasta & Noodles 25', '16', 'Pasta & Noodles', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 360.00, 10.00, 10.00, ' Di00001', 'Divella', NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:10'),
(317, 'FMD174265', 'Divella Spaghettini 9(500 gm)', 'Basic description of Pasta & Noodles 26', '16', 'Pasta & Noodles', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 180.00, 10.00, 10.00, ' Di00001', 'Divella', NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:10'),
(318, 'FMD174278', 'How How Rice Stick (500 gm)', 'Basic description of Pasta & Noodles 27', '16', 'Pasta & Noodles', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 350.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:10'),
(319, 'FMD174778', 'Vaseline Dry Skin Repair 400 ml', 'Basic description of Personal Care 1', '17', 'Personal Care', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 365.00, 10.00, 10.00, ' Va00001', 'Vaseline', NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:10'),
(320, 'FMD174774', 'Pond\'s Light Moisture 75 ml', 'Basic description of Personal Care 2', '17', 'Personal Care', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 189.00, 10.00, 10.00, ' Po00001', 'Ponds', NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:10'),
(321, 'FMD174763', 'Hair Fall Rescue 330 ml', 'Basic description of Personal Care 3', '17', 'Personal Care', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 365.00, 10.00, 10.00, ' Do00001', 'Dove', NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:10'),
(322, 'FMD174764', 'Intensive Cream 150 ml', 'Basic description of Personal Care 4', '17', 'Personal Care', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 289.00, 10.00, 10.00, ' Do00001', 'Dove', NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:10'),
(323, 'FMD174765', 'Intensive Repair Conditioner 330 ml', 'Basic description of Personal Care 5', '17', 'Personal Care', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 365.00, 10.00, 10.00, ' Do00001', 'Dove', NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:10'),
(324, 'FMD217016', 'Gaia Green Tea + Jasmine 25\'s', 'Basic description of Beverages 53', '4', 'Beverages', '5', 'Tea', '0', 0.00, 0.00, 310.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:10'),
(325, 'FMD174766', 'Nourishing Oil Conditioner 330 ml', 'Basic description of Personal Care 6', '17', 'Personal Care', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 365.00, 10.00, 10.00, ' Do00001', 'Dove', NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:10'),
(326, 'FMD177342', 'H & S Shampoo Cool Menthol (650 ml)', 'Basic description of Personal Care 7', '17', 'Personal Care', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 710.00, 10.00, 10.00, ' H 00001', 'H &amp; S', NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:10'),
(327, 'FMD177343', 'H & S Shampoo Silky Smooth (650 ml)', 'Basic description of Personal Care 8', '17', 'Personal Care', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 710.00, 10.00, 10.00, ' H 00001', 'H &amp; S', NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:11'),
(328, 'FMD177344', 'Olay Natural N.W Night Cream', 'Basic description of Personal Care 9', '17', 'Personal Care', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 420.00, 10.00, 10.00, ' H 00001', 'H &amp; S', NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:11'),
(329, 'FMD177345', 'Olay Natural White Day Cream', 'Basic description of Personal Care 10', '17', 'Personal Care', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 420.00, 10.00, 10.00, ' Ol00001', 'Olay', NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:11'),
(330, 'FMD177351', 'Olay Regenerist MSC Day (50 gm)', 'Basic description of Personal Care 11', '17', 'Personal Care', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 1989.00, 10.00, 10.00, ' Ol00001', 'Olay', NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:11'),
(331, 'FMD177352', 'Olay TE Normal UV Cream Thai (50 gm)', 'Basic description of Personal Care 12', '17', 'Personal Care', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 1089.00, 10.00, 10.00, ' Ol00001', 'Olay', NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:11'),
(332, 'FMD177353', 'Olay TE Touch of Foundation Cream Thai (50 gm)', 'Basic description of Personal Care 13', '17', 'Personal Care', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 1089.00, 10.00, 10.00, ' Ol00001', 'Olay', NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:11'),
(333, 'FMD177354', 'Pantene  SS (650 ml)', 'Basic description of Personal Care 14', '17', 'Personal Care', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 555.00, 10.00, 10.00, ' Pa00002', 'Pantene', NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:11'),
(334, 'FMD177355', 'Pantene Hair Fall (650 ml)', 'Basic description of Personal Care 15', '17', 'Personal Care', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 555.00, 10.00, 10.00, ' Pa00002', 'Pantene', NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:11'),
(335, 'FMD230992', 'Pampers Diapers 64s (LG)', 'Basic description of Baby Care 14', '1', 'Baby Care', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 1908.00, 10.00, 10.00, ' Pa00001', 'Pamper', NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:11'),
(336, 'FMD217017', 'Gaia Green Tea + Mint 25\'s', 'Basic description of Beverages 54', '4', 'Beverages', '5', 'Tea', '0', 0.00, 0.00, 294.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:11'),
(337, 'FMD215622', 'Whisper Ultra Clean XL+ 30\'S', 'Basic description of Personal Care 16', '17', 'Personal Care', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 550.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:11'),
(338, 'FMD215623', 'Whisper Ultra Soft XL 30\'S', 'Basic description of Personal Care 17', '17', 'Personal Care', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 406.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:11'),
(339, 'FMD221834', 'Dove Beauty Bar Original White 100g', 'Basic description of Personal Care 18', '17', 'Personal Care', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 89.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:11'),
(340, 'FMD221835', 'Dove Beauty Bar Shea Butter 100g', 'Basic description of Personal Care 19', '17', 'Personal Care', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 89.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:11'),
(341, 'FMD221836', 'Dove Deeply Nourishing Body Wash 450ml', 'Basic description of Personal Care 20', '17', 'Personal Care', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 440.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:11'),
(342, 'FMD221837', 'Dove Reviving Body wash 450 ml', 'Basic description of Personal Care 21', '17', 'Personal Care', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 440.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:11'),
(343, 'FMD221838', 'Heat Protection Spray 180ml', 'Basic description of Personal Care 22', '17', 'Personal Care', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 1189.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:11'),
(344, 'FMD221839', 'Dove Nourishing Silk Body Wash 450ml', 'Basic description of Personal Care 23', '17', 'Personal Care', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 440.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:11'),
(345, 'FMD221840', 'Ponds Superlight Gel Oil free Moisturizer 73g', 'Basic description of Personal Care 24', '17', 'Personal Care', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 230.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:42', '2024-09-15 23:39:11'),
(346, 'FMD221841', 'Vaseline Petrolleum Jelly 100ml', 'Basic description of Personal Care 25', '17', 'Personal Care', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 115.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:43', '2024-09-15 23:39:11'),
(347, 'FMD217018', 'Gaia Green Tea + Tulsi 25\'s', 'Basic description of Beverages 55', '4', 'Beverages', '5', 'Tea', '0', 0.00, 0.00, 295.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:43', '2024-09-15 23:39:11'),
(348, 'FMD221842', 'Vaseline Petrolleum Jelly 200ml', 'Basic description of Personal Care 26', '17', 'Personal Care', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 240.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:43', '2024-09-15 23:39:11'),
(349, 'FMD221857', 'Cetaphil Gentle Skin cleanser 591 ml', 'Basic description of Personal Care 27', '17', 'Personal Care', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 2650.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:43', '2024-09-15 23:39:11'),
(350, 'FMD221858', 'Cetaphil Moisturizing Cream 250g', 'Basic description of Personal Care 28', '17', 'Personal Care', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 2240.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:43', '2024-09-15 23:39:11'),
(351, 'FMD221859', 'Cetaphil Moisturizing Lotion 591 ml', 'Basic description of Personal Care 29', '17', 'Personal Care', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 2650.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:43', '2024-09-15 23:39:11'),
(352, 'FMD221860', 'The Ordinary Niacinamide 10% + Zinc 1% 30ml', 'Basic description of Personal Care 30', '17', 'Personal Care', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 1790.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:43', '2024-09-15 23:39:11'),
(353, 'FMD221813', 'Closeup Mouthwash Nature Boost 250 ml', 'Basic description of Personal Care 31', '17', 'Personal Care', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 190.00, 10.00, 10.00, ' Co00002', 'Complan', NULL, '2024-09-15 22:50:43', '2024-09-15 23:39:11'),
(354, 'FMD221814', 'Closeup Mouthwash Nature Boost 500 ml', 'Basic description of Personal Care 32', '17', 'Personal Care', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 358.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:43', '2024-09-15 23:39:11'),
(355, 'FMD221815', 'Closeup Mouthwash Red Hot 250 ml', 'Basic description of Personal Care 33', '17', 'Personal Care', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 190.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:43', '2024-09-15 23:39:12'),
(356, 'FMD221816', 'Closeup Mouthwash Red Hot 500 ml', 'Basic description of Personal Care 34', '17', 'Personal Care', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 358.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:43', '2024-09-15 23:39:12'),
(357, 'FMD221817', 'Comfort Fabric Conditioner  Blue 220 ml', 'Basic description of Personal Care 35', '17', 'Personal Care', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 83.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:43', '2024-09-15 23:39:12'),
(358, 'FMD217019', 'Gaia Infusion Camomile+ 25\'s', 'Basic description of Beverages 56', '4', 'Beverages', '5', 'Tea', '0', 0.00, 0.00, 350.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:43', '2024-09-15 23:39:12'),
(359, 'FMD221818', 'Comfort Fabric Conditioner Pink 220 ml', 'Basic description of Personal Care 36', '17', 'Personal Care', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 83.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:43', '2024-09-15 23:39:12'),
(360, 'FMD180344', 'Dettol Liquid Soap (200 ml +175 ml)', 'Basic description of Personal Care 37', '17', 'Personal Care', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 134.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:43', '2024-09-15 23:39:12'),
(361, 'FMD180345', 'Dettol Sanitizer (200 ml)', 'Basic description of Personal Care 38', '17', 'Personal Care', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 150.00, 10.00, 10.00, ' De00001', 'Dettol', NULL, '2024-09-15 22:50:43', '2024-09-15 23:39:12'),
(362, 'FMD180346', 'Dettol Sanitizer (500 ml)', 'Basic description of Personal Care 39', '17', 'Personal Care', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 390.00, 10.00, 10.00, ' De00001', 'Dettol', NULL, '2024-09-15 22:50:43', '2024-09-15 23:39:12'),
(363, 'FMD180347', 'Dettol Soap Org (75g - 3+1)', 'Basic description of Personal Care 40', '17', 'Personal Care', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 158.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:43', '2024-09-15 23:39:12'),
(364, 'FMD180348', 'Whisper Ultra Night (XL 30)', 'Basic description of Personal Care 41', '17', 'Personal Care', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 628.00, 10.00, 10.00, ' Wh00001', 'Whisper', NULL, '2024-09-15 22:50:43', '2024-09-15 23:39:12'),
(365, 'FMD180349', 'Whisper Ultra Soft (XL+ 30s)', 'Basic description of Personal Care 42', '17', 'Personal Care', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 406.00, 10.00, 10.00, ' Wh00001', 'Whisper', NULL, '2024-09-15 22:50:43', '2024-09-15 23:39:12'),
(366, 'FMD180350', 'Whisper Ultra Clean (XL+ 30)', 'Basic description of Personal Care 43', '17', 'Personal Care', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 486.00, 10.00, 10.00, ' Wh00001', 'Whisper', NULL, '2024-09-15 22:50:43', '2024-09-15 23:39:12'),
(367, 'FMD303818', 'Bindazz XL + 27', 'Basic description of Personal Care 44', '17', 'Personal Care', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 550.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:43', '2024-09-15 23:39:12'),
(368, 'FMD331020', 'Whisper Choice Extra Long Sanitary Pads 6\'s Count', 'Basic description of Personal Care 45', '17', 'Personal Care', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 48.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:43', '2024-09-15 23:39:12'),
(369, 'FMD217022', 'Coast Milk Powder (900 gms)', 'Basic description of Beverages 57', '4', 'Beverages', '5', 'Tea', '0', 0.00, 0.00, 1790.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:43', '2024-09-15 23:39:12'),
(370, 'FMD331021', 'Whisper Choice Ultra, XL, 6 pads', 'Basic description of Personal Care 46', '17', 'Personal Care', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 65.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:44', '2024-09-15 23:39:12'),
(371, 'FMD331022', 'Whisper Ultra Clean XL+ 44\'P', 'Basic description of Personal Care 47', '17', 'Personal Care', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 949.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:44', '2024-09-15 23:39:12'),
(372, 'FMD331023', 'Whisper Ultra Clean XL+ 15 Pads', 'Basic description of Personal Care 48', '17', 'Personal Care', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 295.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:44', '2024-09-15 23:39:12'),
(373, 'FMD331024', 'Whisper Ultra Soft Sanitary Pads XL+ 15 Pads', 'Basic description of Personal Care 49', '17', 'Personal Care', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 295.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:44', '2024-09-15 23:39:12'),
(374, 'FMD252278', 'Whisper Bindazz Night (XL 15)', 'Basic description of Personal Care 50', '17', 'Personal Care', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 326.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:44', '2024-09-15 23:39:12'),
(375, 'FMD189022', '??? (Jumla Mugu,Dolpa) (1 kg)', 'Basic description of Pure Organic Items 1', '18', 'Pure Organic Items', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 1290.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:44', '2024-09-15 23:39:12'),
(376, 'FMD189023', '?????? (Mugu) ( 100 gm)', 'Basic description of Pure Organic Items 2', '18', 'Pure Organic Items', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 240.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:44', '2024-09-15 23:39:12'),
(377, 'FMD189024', '???? ???? (Jumla ) (1 kg)', 'Basic description of Pure Organic Items 3', '18', 'Pure Organic Items', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 220.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:44', '2024-09-15 23:39:12'),
(378, 'FMD189025', '??? ???????? (Jumla) (1 kg)', 'Basic description of Pure Organic Items 4', '18', 'Pure Organic Items', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 140.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:44', '2024-09-15 23:39:12'),
(379, 'FMD189026', '???? ???? (Mugu Nuwakot) (1 kg)', 'Basic description of Pure Organic Items 5', '18', 'Pure Organic Items', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 270.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:44', '2024-09-15 23:39:12'),
(380, 'FMD198985', 'Tokla Asli Masla Tea (1 Kg)', 'Basic description of Beverages 58', '4', 'Beverages', '5', 'Tea', '0', 0.00, 0.00, 675.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:44', '2024-09-15 23:39:12'),
(381, 'FMD189027', 'Chamal Ko Pitho (1 kg)', 'Basic description of Pure Organic Items 6', '18', 'Pure Organic Items', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 150.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:44', '2024-09-15 23:39:12'),
(382, 'FMD189028', 'Kodo Ko Pitho (1 kg)', 'Basic description of Pure Organic Items 7', '18', 'Pure Organic Items', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 140.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:44', '2024-09-15 23:39:12'),
(383, 'FMD189029', '??????? ???? ( Bazura ) (Per Poka) (50 gm, around)', 'Basic description of Pure Organic Items 8', '18', 'Pure Organic Items', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 240.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:44', '2024-09-15 23:39:12'),
(384, 'FMD189030', '??? ?? ???? (Jumla) (1 kg)', 'Basic description of Pure Organic Items 9', '18', 'Pure Organic Items', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 130.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:44', '2024-09-15 23:39:12'),
(385, 'FMD189031', '?????? ????? (Jumla) 250 gm', 'Basic description of Pure Organic Items 10', '18', 'Pure Organic Items', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 160.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:44', '2024-09-15 23:39:12'),
(386, 'FMD189032', 'Bire Nun (Salt ) (200 gm)', 'Basic description of Pure Organic Items 11', '18', 'Pure Organic Items', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 150.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:44', '2024-09-15 23:39:12'),
(387, 'FMD189033', 'Masyaura (200 gm)', 'Basic description of Pure Organic Items 12', '18', 'Pure Organic Items', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 390.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:44', '2024-09-15 23:39:12'),
(388, 'FMD189034', 'Mix Pitho (1 kg)', 'Basic description of Pure Organic Items 13', '18', 'Pure Organic Items', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 140.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:44', '2024-09-15 23:39:12'),
(389, 'FMD189035', 'Side Nun (Salt) (500 gm)', 'Basic description of Pure Organic Items 14', '18', 'Pure Organic Items', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 230.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:44', '2024-09-15 23:39:12'),
(390, 'FMD189036', 'Timur Ko Dhulo (50 gm)', 'Basic description of Pure Organic Items 15', '18', 'Pure Organic Items', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 90.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:44', '2024-09-15 23:39:12');
INSERT INTO `products` (`id`, `product_code`, `product_name`, `product_description`, `category_id`, `category_name`, `subcategory_id`, `subcategory_name`, `delivery_target_days`, `discount`, `actual_price`, `sell_price`, `available_quantity`, `stock_quantity`, `brand_id`, `brand_name`, `primary_image`, `created_at`, `updated_at`) VALUES
(391, 'FMD174172', 'Kombucha (Green) (300 ml)', 'Basic description of Beverages 59', '4', 'Beverages', '5', 'Tea', '0', 0.00, 0.00, 140.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:44', '2024-09-15 23:39:12'),
(392, 'FMD189037', 'Chana Ko Saatu (1 kg)', 'Basic description of Pure Organic Items 16', '18', 'Pure Organic Items', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 270.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:44', '2024-09-15 23:39:13'),
(393, 'FMD189038', 'Chiya Seed (200 gm)', 'Basic description of Pure Organic Items 17', '18', 'Pure Organic Items', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 340.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:44', '2024-09-15 23:39:13'),
(394, 'FMD189039', 'Farsiko Biya  (200 gm)', 'Basic description of Pure Organic Items 18', '18', 'Pure Organic Items', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 250.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:44', '2024-09-15 23:39:13'),
(395, 'FMD189040', 'Gahu Ko Pitho (1 kg)', 'Basic description of Pure Organic Items 19', '18', 'Pure Organic Items', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 80.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:44', '2024-09-15 23:39:13'),
(396, 'FMD189041', 'Jau Ko Saatu (1 kg)', 'Basic description of Pure Organic Items 20', '18', 'Pure Organic Items', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 260.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:44', '2024-09-15 23:39:13'),
(397, 'FMD189042', 'Makai Ko Chiura  1 packet', 'Basic description of Pure Organic Items 21', '18', 'Pure Organic Items', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 200.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:44', '2024-09-15 23:39:13'),
(398, 'FMD189043', 'Makai Ko Pitho (1 kg)', 'Basic description of Pure Organic Items 22', '18', 'Pure Organic Items', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 170.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:44', '2024-09-15 23:39:13'),
(399, 'FMD189044', 'Mix Saatu (1 kg)', 'Basic description of Pure Organic Items 23', '18', 'Pure Organic Items', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 270.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:44', '2024-09-15 23:39:13'),
(400, 'FMD189045', 'Sadeko Chiura (500 gm)', 'Basic description of Pure Organic Items 24', '18', 'Pure Organic Items', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 140.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:44', '2024-09-15 23:39:13'),
(401, 'FMD190565', 'Mums Chiya Seed (150 gm)', 'Basic description of Pure Organic Items 25', '18', 'Pure Organic Items', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 250.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:44', '2024-09-15 23:39:13'),
(402, 'FMD174419', 'Tokla Gold Tea (500 gm)', 'Basic description of Beverages 60', '4', 'Beverages', '5', 'Tea', '0', 0.00, 0.00, 320.00, 10.00, 10.00, ' To00001', 'Tokla', NULL, '2024-09-15 22:50:44', '2024-09-15 23:39:13'),
(403, 'FMD202214', '??? ?? ????  (Jumla)  (500 gm)', 'Basic description of Pure Organic Items 26', '18', 'Pure Organic Items', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 60.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:44', '2024-09-15 23:39:13'),
(404, 'FMD241235', 'Seasoned Potato Wedges (2.5 kg)', 'Basic description of Ready to Cook 1', '19', 'Ready to Cook', '28', 'Veg Items', '0', 0.00, 0.00, 990.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:44', '2024-09-15 23:39:13'),
(405, 'FMD242005', 'Hyfun French Fries (1 kg)', 'Basic description of Ready to Cook 2', '19', 'Ready to Cook', '28', 'Veg Items', '0', 0.00, 0.00, 290.00, 10.00, 10.00, ' Hy00001', 'Hyfun', NULL, '2024-09-15 22:50:45', '2024-09-15 23:39:13'),
(406, 'FMD256157', 'GAIA Tortilla Bread (Pkt)', 'Basic description of Ready to Cook 3', '19', 'Ready to Cook', '28', 'Veg Items', '0', 0.00, 0.00, 490.00, 10.00, 10.00, ' GA00001', 'GAIA', NULL, '2024-09-15 22:50:45', '2024-09-15 23:39:13'),
(407, 'FMD258146', 'Lambweston Potato Chips  (2 kg)', 'Basic description of Ready to Cook 5', '19', 'Ready to Cook', '28', 'Veg Items', '0', 0.00, 0.00, 1065.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:45', '2024-09-15 23:39:13'),
(408, 'FMD258147', 'Lambweston Seasoned Potato Wedges with Skin (2.5 kg)', 'Basic description of Ready to Cook 6', '19', 'Ready to Cook', '28', 'Veg Items', '0', 0.00, 0.00, 1065.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:45', '2024-09-15 23:39:13'),
(409, 'FMD260585', 'Plain Tortila Bread 8\" Fresh 2 Go', 'Basic description of Ready to Cook 7', '19', 'Ready to Cook', '28', 'Veg Items', '0', 0.00, 0.00, 490.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:45', '2024-09-15 23:39:13'),
(410, 'FMD376665', 'N&H Sweet Corn', 'Basic description of Ready to Cook 8', '19', 'Ready to Cook', '28', 'Veg Items', '0', 0.00, 0.00, 260.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:45', '2024-09-15 23:39:13'),
(411, 'FMD358292', 'Botle gaurd', 'Basic description of Ready to Cook 9', '19', 'Ready to Cook', '28', 'Veg Items', '0', 0.00, 0.00, 215.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:45', '2024-09-15 23:39:13'),
(412, 'FMD199589', 'N&H Fresh Corn (1 kg)', 'Basic description of Ready to Cook 10', '19', 'Ready to Cook', '28', 'Veg Items', '0', 0.00, 0.00, 362.90, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:45', '2024-09-15 23:39:13'),
(413, 'FMD174420', 'Tokla Masala Tea (1 kg)', 'Basic description of Beverages 61', '4', 'Beverages', '5', 'Tea', '0', 0.00, 0.00, 617.00, 10.00, 10.00, ' To00001', 'Tokla', NULL, '2024-09-15 22:50:45', '2024-09-15 23:39:13'),
(414, 'FMD198791', 'Mccain French Fries 2.5Kg', 'Basic description of Ready to Cook 11', '19', 'Ready to Cook', '28', 'Veg Items', '0', 0.00, 0.00, 1040.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:45', '2024-09-15 23:39:13'),
(415, 'FMD217291', 'Cornitos Tortila Wrap (Corn & Wheat Flour)', 'Basic description of Ready to Cook 12', '19', 'Ready to Cook', '28', 'Veg Items', '0', 0.00, 0.00, 490.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:45', '2024-09-15 23:39:13'),
(416, 'FMD214637', 'HS Sweet Corn (1 kg)', 'Basic description of Ready to Cook 13', '19', 'Ready to Cook', '28', 'Veg Items', '0', 0.00, 0.00, 365.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:45', '2024-09-15 23:39:13'),
(417, 'FMD214840', 'Sweet Corn HS', 'Basic description of Ready to Cook 14', '19', 'Ready to Cook', '28', 'Veg Items', '0', 0.00, 0.00, 260.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:45', '2024-09-15 23:39:13'),
(418, 'FMD214392', 'Green Peas Frozen HS', 'Basic description of Ready to Cook 15', '19', 'Ready to Cook', '28', 'Veg Items', '0', 0.00, 0.00, 340.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:45', '2024-09-15 23:39:13'),
(419, 'FMD174182', 'N&H Green Peas (1 KG)', 'Basic description of Ready to Cook 16', '19', 'Ready to Cook', '28', 'Veg Items', '0', 0.00, 0.00, 260.00, 10.00, 10.00, ' Ni00001', 'Nina &amp; Hager', NULL, '2024-09-15 22:50:45', '2024-09-15 23:39:13'),
(420, 'FMD174173', 'Green Peas (1 kg)', 'Basic description of Ready to Cook 17', '19', 'Ready to Cook', '28', 'Veg Items', '0', 0.00, 0.00, 340.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:45', '2024-09-15 23:39:13'),
(421, 'FMD174176', 'Sweet Corn 1Kg-Yogo Fresh-N&H', 'Basic description of Ready to Cook 20', '19', 'Ready to Cook', '28', 'Veg Items', '0', 0.00, 0.00, 260.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:45', '2024-09-15 23:39:13'),
(422, 'FMD174177', 'VCS French fry (1 kg)', 'Basic description of Ready to Cook 21', '19', 'Ready to Cook', '28', 'Veg Items', '0', 0.00, 0.00, 290.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:45', '2024-09-15 23:39:13'),
(423, 'FMD174178', 'VCS Sweetcorn (1 kg) smr', 'Basic description of Ready to Cook 22', '19', 'Ready to Cook', '28', 'Veg Items', '0', 0.00, 0.00, 265.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:45', '2024-09-15 23:39:13'),
(424, 'FMD241231', 'Real Juice Pineapple (1 ltr)', 'Basic description of Beverages 62', '4', 'Beverages', '6', 'Ready to Drink', '0', 0.00, 0.00, 245.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:45', '2024-09-15 23:39:13'),
(425, 'FMD174179', 'Veg Patty (450 gm)', 'Basic description of Ready to Cook 23', '19', 'Ready to Cook', '28', 'Veg Items', '0', 0.00, 0.00, 490.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:45', '2024-09-15 23:39:13'),
(426, 'FMD174180', 'French Fries (420 gm)', 'Basic description of Ready to Cook 24', '19', 'Ready to Cook', '28', 'Veg Items', '0', 0.00, 0.00, 295.00, 10.00, 10.00, ' Hy00001', 'Hyfun', NULL, '2024-09-15 22:50:45', '2024-09-15 23:39:13'),
(427, 'FMD174181', 'GFM Chicken Momo (40 pcs)', 'Basic description of Ready to Cook 26', '19', 'Ready to Cook', '29', 'Momo', '0', 0.00, 0.00, 485.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:45', '2024-09-15 23:39:13'),
(428, 'FMD174183', 'VCS Chicken Momo (20 pcs)', 'Basic description of Ready to Cook 27', '19', 'Ready to Cook', '29', 'Momo', '0', 0.00, 0.00, 160.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:45', '2024-09-15 23:39:13'),
(429, 'FMD174184', 'VCS Chicken Momo  (50 pcs)', 'Basic description of Ready to Cook 28', '19', 'Ready to Cook', '29', 'Momo', '0', 0.00, 0.00, 390.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:45', '2024-09-15 23:39:13'),
(430, 'FMD174185', 'VCS Veg Momo (HM) (20 pcs)', 'Basic description of Ready to Cook 29', '19', 'Ready to Cook', '29', 'Momo', '0', 0.00, 0.00, 160.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:45', '2024-09-15 23:39:13'),
(431, 'FMD174186', 'VCS Buff Momo Frozen (20 pcs)', 'Basic description of Ready to Cook 30', '19', 'Ready to Cook', '29', 'Momo', '0', 0.00, 0.00, 160.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:45', '2024-09-15 23:39:14'),
(432, 'FMD176612', 'ADH Buff Mo:Mo (20 pcs)', 'Basic description of Ready to Cook 31', '19', 'Ready to Cook', '29', 'Momo', '0', 0.00, 0.00, 160.00, 10.00, 10.00, ' Ad00001', 'Adhunik', NULL, '2024-09-15 22:50:45', '2024-09-15 23:39:14'),
(433, 'FMD176613', 'ADH Buff Mo:Mo (50 pcs)', 'Basic description of Ready to Cook 32', '19', 'Ready to Cook', '29', 'Momo', '0', 0.00, 0.00, 365.00, 10.00, 10.00, ' Ad00001', 'Adhunik', NULL, '2024-09-15 22:50:45', '2024-09-15 23:39:14'),
(434, 'FMD176614', 'ADH Mo:Mo (20 pcs)', 'Basic description of Ready to Cook 33', '19', 'Ready to Cook', '29', 'Momo', '0', 0.00, 0.00, 160.00, 10.00, 10.00, ' Ad00001', 'Adhunik', NULL, '2024-09-15 22:50:45', '2024-09-15 23:39:14'),
(435, 'FMD284282', 'Elaitea 300 ml', 'Basic description of Beverages 63', '4', 'Beverages', '6', 'Ready to Drink', '0', 0.00, 0.00, 70.00, 10.00, 10.00, ' Te00001', 'Test Brand 1', NULL, '2024-09-15 22:50:45', '2024-09-15 23:39:14'),
(436, 'FMD176615', 'ADH Chicken Mo:Mo (50 pcs)', 'Basic description of Ready to Cook 34', '19', 'Ready to Cook', '29', 'Momo', '0', 0.00, 0.00, 365.00, 10.00, 10.00, ' Ad00001', 'Adhunik', NULL, '2024-09-15 22:50:45', '2024-09-15 23:39:14'),
(437, 'FMD176616', 'ADH Veg Mo:Mo (20 pcs)', 'Basic description of Ready to Cook 35', '19', 'Ready to Cook', '29', 'Momo', '0', 0.00, 0.00, 160.00, 10.00, 10.00, ' Ad00001', 'Adhunik', NULL, '2024-09-15 22:50:45', '2024-09-15 23:39:14'),
(438, 'FMD205067', 'VCS Buff Momo (50 pcs)', 'Basic description of Ready to Cook 36', '19', 'Ready to Cook', '29', 'Momo', '0', 0.00, 0.00, 390.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:45', '2024-09-15 23:39:14'),
(439, 'FMD192044', 'GFM Chicken Momo (20 pcs)', 'Basic description of Ready to Cook 37', '19', 'Ready to Cook', '29', 'Momo', '0', 0.00, 0.00, 255.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:46', '2024-09-15 23:39:14'),
(440, 'FMD192045', 'GFM Buff Momo (20 pcs)', 'Basic description of Ready to Cook 38', '19', 'Ready to Cook', '29', 'Momo', '0', 0.00, 0.00, 275.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:46', '2024-09-15 23:39:14'),
(441, 'FMD192046', 'GFM Buff Momo (40 pcs)', 'Basic description of Ready to Cook 39', '19', 'Ready to Cook', '29', 'Momo', '0', 0.00, 0.00, 525.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:46', '2024-09-15 23:39:14'),
(442, 'FMD192056', 'GFM Veg Momo (20 pcs)', 'Basic description of Ready to Cook 40', '19', 'Ready to Cook', '29', 'Momo', '0', 0.00, 0.00, 190.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:46', '2024-09-15 23:39:14'),
(443, 'FMD239401', 'HS Chicken Mo:Mo (50 pcs)', 'Basic description of Ready to Cook 41', '19', 'Ready to Cook', '29', 'Momo', '0', 0.00, 0.00, 390.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:46', '2024-09-15 23:39:14'),
(444, 'FMD192047', 'Chicken Spring Roll (6 pcs)', 'Basic description of Ready to Cook 42', '19', 'Ready to Cook', '30', 'More on Ready to Cook', '0', 0.00, 0.00, 445.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:46', '2024-09-15 23:39:14'),
(445, 'FMD192048', 'Veg Spring Roll (6 pcs)', 'Basic description of Ready to Cook 43', '19', 'Ready to Cook', '30', 'More on Ready to Cook', '0', 0.00, 0.00, 340.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:46', '2024-09-15 23:39:14'),
(446, 'FMD230993', 'Pampers Diapers 66s (XL)', 'Basic description of Baby Care 15', '1', 'Baby Care', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 2468.00, 10.00, 10.00, ' Pa00001', 'Pamper', NULL, '2024-09-15 22:50:46', '2024-09-15 23:39:14'),
(447, 'FMD291770', 'Appy (125ml) Juice - Parle Agro (Pack of 5)', 'Basic description of Beverages 64', '4', 'Beverages', '6', 'Ready to Drink', '0', 0.00, 0.00, 90.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:46', '2024-09-15 23:39:14'),
(448, 'FMD174171', 'Szechuan Chicken Wings (6 pcs/ 500 gm)', 'Basic description of Ready to Cook 44', '19', 'Ready to Cook', '30', 'More on Ready to Cook', '0', 0.00, 0.00, 485.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:46', '2024-09-15 23:39:14'),
(449, 'FMD174169', 'Chicken Patty (500 gm)', 'Basic description of Ready to Cook 45', '19', 'Ready to Cook', '30', 'More on Ready to Cook', '0', 0.00, 0.00, 565.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:46', '2024-09-15 23:39:14'),
(450, 'FMD174167', 'Chicken Buffalo wings (400 gm)', 'Basic description of Ready to Cook 46', '19', 'Ready to Cook', '30', 'More on Ready to Cook', '0', 0.00, 0.00, 485.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:46', '2024-09-15 23:39:14'),
(451, 'FMD174134', 'VCS Chicken Patty (500 gm)', 'Basic description of Ready to Cook 47', '19', 'Ready to Cook', '30', 'More on Ready to Cook', '0', 0.00, 0.00, 230.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:46', '2024-09-15 23:39:14'),
(452, 'FMD174165', 'Buff Patty (500 gm)', 'Basic description of Ready to Cook 48', '19', 'Ready to Cook', '30', 'More on Ready to Cook', '0', 0.00, 0.00, 540.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:46', '2024-09-15 23:39:14'),
(453, 'FMD290118', 'Pintola Wholegrain Brown Rice Cakes (Lightly Salted) 125 gm', 'Basic description of Ready To Eat 1', '20', 'Ready To Eat', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 245.00, 10.00, 10.00, ' Pi00001', 'Pintola', NULL, '2024-09-15 22:50:46', '2024-09-15 23:39:14'),
(454, 'FMD183342', 'Suji Toast (235 gm)', 'Basic description of Ready To Eat 3', '20', 'Ready To Eat', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 90.00, 10.00, 10.00, ' Br00001', 'Britannia', NULL, '2024-09-15 22:50:46', '2024-09-15 23:39:14'),
(455, 'FMD192227', 'Noga Baked Beans in Tomato Sauce (480 gm)', 'Basic description of Ready To Eat 4', '20', 'Ready To Eat', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 130.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:46', '2024-09-15 23:39:14'),
(456, 'FMD189402', 'Roza Sardine In Tomato Sauce (185 gm)', 'Basic description of Ready To Eat 5', '20', 'Ready To Eat', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 140.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:46', '2024-09-15 23:39:14'),
(457, 'FMD189352', 'Cornitos Party Mix (200 gm)', 'Basic description of Ready To Eat 6', '20', 'Ready To Eat', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 285.00, 10.00, 10.00, ' Co00001', 'Cornitos', NULL, '2024-09-15 22:50:46', '2024-09-15 23:39:14'),
(458, 'FMD291771', 'Appy (200 ml) Juice - Parle Agro (Pack of 5)', 'Basic description of Beverages 65', '4', 'Beverages', '6', 'Ready to Drink', '0', 0.00, 0.00, 140.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:46', '2024-09-15 23:39:14'),
(459, 'FMD189346', 'Coated Green Peas Wasabi (150 gm)- Cornitos', 'Basic description of Ready To Eat 7', '20', 'Ready To Eat', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 250.00, 10.00, 10.00, ' Co00001', 'Cornitos', NULL, '2024-09-15 22:50:46', '2024-09-15 23:39:14'),
(460, 'FMD189349', 'Lightly Salted Roasted Cashews (25 gm)- Cornitos', 'Basic description of Ready To Eat 8', '20', 'Ready To Eat', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 150.00, 10.00, 10.00, ' Co00001', 'Cornitos', NULL, '2024-09-15 22:50:46', '2024-09-15 23:39:14'),
(461, 'FMD220352', 'Pintola Wholegrain Brown Rice Cakes (All Natural, Multigrain) 125g', 'Basic description of Ready To Eat 9', '20', 'Ready To Eat', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 245.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:46', '2024-09-15 23:39:14'),
(462, 'FMD220353', 'Pintola Wholegrain Brown Rice Cakes (All Natural, Salted) 125g', 'Basic description of Ready To Eat 10', '20', 'Ready To Eat', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 245.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:46', '2024-09-15 23:39:14'),
(463, 'FMD220354', 'Pintola Wholegrain Brown Rice Cakes (All Natural, Unsalted) 125g', 'Basic description of Ready To Eat 11', '20', 'Ready To Eat', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 245.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:46', '2024-09-15 23:39:14'),
(464, 'FMD217304', 'Coated Green Peas Pop & Crunch(150 gm)- Cornitos', 'Basic description of Ready To Eat 12', '20', 'Ready To Eat', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 215.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:46', '2024-09-15 23:39:14'),
(465, 'FMD206692', 'Roza Tuna Flakes in Brine', 'Basic description of Ready To Eat 13', '20', 'Ready To Eat', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 190.00, 10.00, 10.00, ' Re00001', 'Red Cow', NULL, '2024-09-15 22:50:46', '2024-09-15 23:39:14'),
(466, 'FMD176561', 'Foochka Pani Puri (1 kg)', 'Basic description of Ready To Eat 14', '20', 'Ready To Eat', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 240.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:46', '2024-09-15 23:39:14'),
(467, 'FMD176562', 'Roza Fried Mackerel with Chilli Sauce', 'Basic description of Ready To Eat 15', '20', 'Ready To Eat', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 140.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:46', '2024-09-15 23:39:14'),
(468, 'FMD176563', 'Roza Mackerel in Tomato Sauce (185 gm)', 'Basic description of Ready To Eat 16', '20', 'Ready To Eat', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 140.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:46', '2024-09-15 23:39:14'),
(469, 'FMD291772', 'Appy Fizz (160 ml) - Parle Agro (Pack of 5)', 'Basic description of Beverages 66', '4', 'Beverages', '6', 'Ready to Drink', '0', 0.00, 0.00, 140.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:46', '2024-09-15 23:39:14'),
(470, 'FMD179599', 'India Gate 100% Quinoa 500g', 'Basic description of Rice & Pulses 1', '21', 'Rice & Pulses', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 350.00, 10.00, 10.00, ' In00001', 'India Gate', NULL, '2024-09-15 22:50:46', '2024-09-15 23:39:14'),
(471, 'FMD179600', 'India Gate Basmati Rice Classic 1kg', 'Basic description of Rice & Pulses 2', '21', 'Rice & Pulses', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 335.00, 10.00, 10.00, ' In00001', 'India Gate', NULL, '2024-09-15 22:50:46', '2024-09-15 23:39:14'),
(472, 'FMD179601', 'India Gate Basmati Rice Classic 5kg', 'Basic description of Rice & Pulses 3', '21', 'Rice & Pulses', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 1710.00, 10.00, 10.00, ' In00001', 'India Gate', NULL, '2024-09-15 22:50:46', '2024-09-15 23:39:14'),
(473, 'FMD179602', 'India Gate Basmati Rice Dubar 1kg', 'Basic description of Rice & Pulses 4', '21', 'Rice & Pulses', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 190.00, 10.00, 10.00, ' In00001', 'India Gate', NULL, '2024-09-15 22:50:46', '2024-09-15 23:39:14'),
(474, 'FMD179603', 'India Gate Basmati Rice Dubar 5kg', 'Basic description of Rice & Pulses 5', '21', 'Rice & Pulses', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 982.00, 10.00, 10.00, ' In00001', 'India Gate', NULL, '2024-09-15 22:50:46', '2024-09-15 23:39:14'),
(475, 'FMD179604', 'India Gate Basmati Rice Super Rozzana 1kg', 'Basic description of Rice & Pulses 6', '21', 'Rice & Pulses', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 168.00, 10.00, 10.00, ' In00001', 'India Gate', NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:14'),
(476, 'FMD179605', 'India Gate Basmati Rice Super Rozzana 5kg', 'Basic description of Rice & Pulses 7', '21', 'Rice & Pulses', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 870.00, 10.00, 10.00, ' In00001', 'India Gate', NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:14'),
(477, 'FMD179606', 'India Gate Brown Basmati Rice Active Health Jar 1kg', 'Basic description of Rice & Pulses 8', '21', 'Rice & Pulses', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 340.00, 10.00, 10.00, ' In00001', 'India Gate', NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:14'),
(478, 'FMD179607', 'India Gate Brown Basmati Rice Weight Watchers 1kg', 'Basic description of Rice & Pulses 9', '21', 'Rice & Pulses', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 206.00, 10.00, 10.00, ' In00001', 'India Gate', NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:14'),
(479, 'FMD183153', 'Thakali Shahi Basmati Rice (1 kg)', 'Basic description of Rice & Pulses 10', '21', 'Rice & Pulses', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 135.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(480, 'FMD291773', 'Frooti Mango Drink(125 ml) - Parle Agro (Pack of 5)', 'Basic description of Beverages 67', '4', 'Beverages', '6', 'Ready to Drink', '0', 0.00, 0.00, 90.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(481, 'FMD188994', 'Local Jeera Masino (1 kg)', 'Basic description of Rice & Pulses 12', '21', 'Rice & Pulses', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 190.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(482, 'FMD188995', 'Local Jeera Masino (5 kg)', 'Basic description of Rice & Pulses 13', '21', 'Rice & Pulses', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 980.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(483, 'FMD188996', 'Nuwakote Pokhareli Rice (1 kg)', 'Basic description of Rice & Pulses 14', '21', 'Rice & Pulses', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 200.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(484, 'FMD188997', 'Nuwakote Pokhareli Rice (5 kg)', 'Basic description of Rice & Pulses 15', '21', 'Rice & Pulses', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 1030.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(485, 'FMD188998', '??????? ????  (Jumla)', 'Basic description of Rice & Pulses 16', '21', 'Rice & Pulses', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 420.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(486, 'FMD188999', '???? ????(Jumla) ????', 'Basic description of Rice & Pulses 17', '21', 'Rice & Pulses', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 280.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(487, 'FMD189000', '???? ???(Jumla)  ????', 'Basic description of Rice & Pulses 18', '21', 'Rice & Pulses', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 330.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(488, 'FMD189001', '???? ???(Jumla) ????', 'Basic description of Rice & Pulses 19', '21', 'Rice & Pulses', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 280.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(489, 'FMD189002', '??????  ( Chitwan)', 'Basic description of Rice & Pulses 20', '21', 'Rice & Pulses', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 250.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(490, 'FMD189003', '?????  ??? (Dang,Banke)', 'Basic description of Rice & Pulses 21', '21', 'Rice & Pulses', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 280.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(491, 'FMD291774', 'Frooti Mango Drink(200ml) - Parle Agro (Pack of 5)', 'Basic description of Beverages 68', '4', 'Beverages', '6', 'Ready to Drink', '0', 0.00, 0.00, 140.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(492, 'FMD189004', '?????  ???( Chitwan)', 'Basic description of Rice & Pulses 22', '21', 'Rice & Pulses', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 250.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(493, 'FMD189005', '????? ( Chitwan)', 'Basic description of Rice & Pulses 23', '21', 'Rice & Pulses', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 280.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(494, 'FMD189006', '???? ?????, ( Chitwan)', 'Basic description of Rice & Pulses 24', '21', 'Rice & Pulses', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 220.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(495, 'FMD189007', '???? ???? ????, (Chitwan)', 'Basic description of Rice & Pulses 25', '21', 'Rice & Pulses', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 270.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(496, 'FMD189008', 'Bodi Dana', 'Basic description of Rice & Pulses 26', '21', 'Rice & Pulses', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 260.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(497, 'FMD189009', 'Chana Ko Daal', 'Basic description of Rice & Pulses 27', '21', 'Rice & Pulses', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 190.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(498, 'FMD189010', 'Mung Ko Daal', 'Basic description of Rice & Pulses 28', '21', 'Rice & Pulses', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 340.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(499, 'FMD189011', 'Rahar Ko Daal', 'Basic description of Rice & Pulses 29', '21', 'Rice & Pulses', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 250.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(500, 'FMD189012', '???(Pyuthan, Kalikot)', 'Basic description of Rice & Pulses 30', '21', 'Rice & Pulses', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 340.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(501, 'FMD189013', '??? ??? (Dang ,Banke)', 'Basic description of Rice & Pulses 31', '21', 'Rice & Pulses', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 290.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(502, 'FMD356204', 'Kombucha (1 Ltr)', 'Basic description of Beverages 69', '4', 'Beverages', '6', 'Ready to Drink', '0', 0.00, 0.00, 290.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(503, 'FMD189014', 'Bhatamas Dana', 'Basic description of Rice & Pulses 32', '21', 'Rice & Pulses', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 240.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(504, 'FMD189015', 'Sabjiland Chana (1 kg)', 'Basic description of Rice & Pulses 33', '21', 'Rice & Pulses', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 250.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(505, 'FMD189016', 'Kalo Simi ( Chitwan)', 'Basic description of Rice & Pulses 34', '21', 'Rice & Pulses', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 350.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(506, 'FMD189017', 'Sano Kerau', 'Basic description of Rice & Pulses 35', '21', 'Rice & Pulses', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 160.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(507, 'FMD189018', 'Thulo Kerau', 'Basic description of Rice & Pulses 36', '21', 'Rice & Pulses', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 140.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(508, 'FMD191081', 'Musuro ko Daal (1 kg)', 'Basic description of Rice & Pulses 37', '21', 'Rice & Pulses', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 240.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(509, 'FMD188318', 'Basmati Local Rice (1 kg)', 'Basic description of Rice & Pulses 38', '21', 'Rice & Pulses', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 210.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(510, 'FMD188319', 'Black Rice (500 gm)', 'Basic description of Rice & Pulses 39', '21', 'Rice & Pulses', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 240.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(511, 'FMD188320', 'Jeera Masino Local Rice (1 kg)', 'Basic description of Rice & Pulses 40', '21', 'Rice & Pulses', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 190.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(512, 'FMD202217', 'Long Grain Rice Best (1 kg)', 'Basic description of Rice & Pulses 41', '21', 'Rice & Pulses', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 150.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(513, 'FMD314894', 'Appy Fizz 250ML', 'Basic description of Beverages 70', '4', 'Beverages', '6', 'Ready to Drink', '0', 0.00, 0.00, 40.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(514, 'FMD202815', 'Rajma', 'Basic description of Rice & Pulses 42', '21', 'Rice & Pulses', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 280.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(515, 'FMD198793', 'India Gate Brown Basmati Rice Active Health Pack 1 kg', 'Basic description of Rice & Pulses 43', '21', 'Rice & Pulses', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 220.00, 10.00, 10.00, ' In00001', 'India Gate', NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(516, 'FMD211307', 'Rahar Dal (2 kg)', 'Basic description of Rice & Pulses 44', '21', 'Rice & Pulses', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 490.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(517, 'FMD217288', 'HS Chana (1 kg)', 'Basic description of Rice & Pulses 45', '21', 'Rice & Pulses', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 250.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(518, 'FMD215988', 'Byanjan Musuro Daal (1 kg)', 'Basic description of Rice & Pulses 46', '21', 'Rice & Pulses', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 180.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(519, 'FMD215985', 'Byanjan Chana Daal (1 kg)', 'Basic description of Rice & Pulses 47', '21', 'Rice & Pulses', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 180.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(520, 'FMD215986', 'Byanjan Maas Daal (1 kg)', 'Basic description of Rice & Pulses 48', '21', 'Rice & Pulses', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 190.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(521, 'FMD315082', 'India Gate Rice Dubar  (2 pcs)', 'Basic description of Rice & Pulses 49', '21', 'Rice & Pulses', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 190.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(522, 'FMD379797', 'India Gate (5 kg)', 'Basic description of Rice & Pulses 50', '21', 'Rice & Pulses', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 1390.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(523, 'FMD303006', 'India Gate Classic (1 kg)', 'Basic description of Rice & Pulses 51', '21', 'Rice & Pulses', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 326.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(524, 'FMD314895', 'Appy Fizz 500ML', 'Basic description of Beverages 71', '4', 'Beverages', '6', 'Ready to Drink', '0', 0.00, 0.00, 70.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(525, 'FMD305540', 'India Gate Basmati Rice (1 kg)', 'Basic description of Rice & Pulses 52', '21', 'Rice & Pulses', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 270.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(526, 'FMD286836', 'India Gate Rice Dubar  (1 kg)', 'Basic description of Rice & Pulses 53', '21', 'Rice & Pulses', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 240.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(527, 'FMD283413', 'India Gate Active Health Brown Basmati Rice 1 kg', 'Basic description of Rice & Pulses 54', '21', 'Rice & Pulses', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 220.00, 10.00, 10.00, ' In00001', 'India Gate', NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(528, 'FMD230640', '?????', 'Basic description of Rice & Pulses 56', '21', 'Rice & Pulses', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 280.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(529, 'FMD246433', 'Terai Taichin Chiura (Beaten Rice) (1 Kg)', 'Basic description of Rice & Pulses 58', '21', 'Rice & Pulses', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 85.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(530, 'FMD247575', 'India Gate Basmati Rice Super Rozzana (1 kg)', 'Basic description of Rice & Pulses 60', '21', 'Rice & Pulses', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 200.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(531, 'FMD247576', 'India Gate Brown Basmati Rice Weight Watchers (1 kg)', 'Basic description of Rice & Pulses 61', '21', 'Rice & Pulses', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 206.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(532, 'FMD247577', '?????? ( Chitwan)', 'Basic description of Rice & Pulses 62', '21', 'Rice & Pulses', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 250.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(533, 'FMD213280', 'Salted Roasted Peanuts (650 gm)', 'Basic description of Snacks & Dry Fruits 1', '22', 'Snacks & Dry Fruits', '31', 'Namkeen', '0', 0.00, 0.00, 285.00, 10.00, 10.00, ' Ad00002', 'Adity', NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(534, 'FMD212060', 'Salted Peanuts (360 gm)', 'Basic description of Snacks & Dry Fruits 2', '22', 'Snacks & Dry Fruits', '31', 'Namkeen', '0', 0.00, 0.00, 187.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(535, 'FMD314896', 'Frooti Mango Drinks 150ML PET', 'Basic description of Beverages 72', '4', 'Beverages', '6', 'Ready to Drink', '0', 0.00, 0.00, 20.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(536, 'FMD198421', 'Bhujiya', 'Basic description of Snacks & Dry Fruits 3', '22', 'Snacks & Dry Fruits', '31', 'Namkeen', '0', 0.00, 0.00, 170.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(537, 'FMD189231', 'Haldiram\'s Kashmiri Mixture (400 gm)', 'Basic description of Snacks & Dry Fruits 4', '22', 'Snacks & Dry Fruits', '31', 'Namkeen', '0', 0.00, 0.00, 410.00, 10.00, 10.00, ' Ha00001', 'Haldirams', NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(538, 'FMD189232', 'Haldiram\'s Nut Cracker (400 gm)', 'Basic description of Snacks & Dry Fruits 5', '22', 'Snacks & Dry Fruits', '31', 'Namkeen', '0', 0.00, 0.00, 316.00, 10.00, 10.00, ' Ha00001', 'Haldirams', NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(539, 'FMD189237', 'Haldiram\'s Nut Cracker (200 gm)', 'Basic description of Snacks & Dry Fruits 6', '22', 'Snacks & Dry Fruits', '31', 'Namkeen', '0', 0.00, 0.00, 127.00, 10.00, 10.00, ' Ha00001', 'Haldirams', NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(540, 'FMD189238', 'Haldiram\'s All In One Big (360 gm)', 'Basic description of Snacks & Dry Fruits 7', '22', 'Snacks & Dry Fruits', '31', 'Namkeen', '0', 0.00, 0.00, 255.00, 10.00, 10.00, ' Ha00001', 'Haldirams', NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(541, 'FMD189239', 'Haldiram\'s Aloo Bhujiya (400 gm)', 'Basic description of Snacks & Dry Fruits 8', '22', 'Snacks & Dry Fruits', '31', 'Namkeen', '0', 0.00, 0.00, 227.00, 10.00, 10.00, ' Ha00001', 'Haldirams', NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(542, 'FMD189240', 'Haldiram\'s Kaju Mixture (200 gm)', 'Basic description of Snacks & Dry Fruits 9', '22', 'Snacks & Dry Fruits', '31', 'Namkeen', '0', 0.00, 0.00, 216.00, 10.00, 10.00, ' Ha00001', 'Haldirams', NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(543, 'FMD189241', 'Haldiram\'s Kashmiri Mixture (200 gm)', 'Basic description of Snacks & Dry Fruits 10', '22', 'Snacks & Dry Fruits', '31', 'Namkeen', '0', 0.00, 0.00, 216.00, 10.00, 10.00, ' Ha00001', 'Haldirams', NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(544, 'FMD189242', 'Haldiram\'s Khatta Meetha (360 gm)', 'Basic description of Snacks & Dry Fruits 11', '22', 'Snacks & Dry Fruits', '31', 'Namkeen', '0', 0.00, 0.00, 216.00, 10.00, 10.00, ' Ha00001', 'Haldirams', NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(545, 'FMD189243', 'Haldiram\'s Roasted Chana Cracker (200 gm)', 'Basic description of Snacks & Dry Fruits 12', '22', 'Snacks & Dry Fruits', '31', 'Namkeen', '0', 0.00, 0.00, 123.00, 10.00, 10.00, ' Ha00001', 'Haldirams', NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(546, 'FMD314897', 'Frooti Mango Drinks 250ML PET', 'Basic description of Beverages 73', '4', 'Beverages', '6', 'Ready to Drink', '0', 0.00, 0.00, 40.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(547, 'FMD189244', 'Haldiram\'s Salted  Peanuts (180 gm)', 'Basic description of Snacks & Dry Fruits 13', '22', 'Snacks & Dry Fruits', '31', 'Namkeen', '0', 0.00, 0.00, 121.00, 10.00, 10.00, ' Ha00001', 'Haldirams', NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(548, 'FMD189245', 'Haldirams Gupshup Peanuts (200 gm)', 'Basic description of Snacks & Dry Fruits 14', '22', 'Snacks & Dry Fruits', '31', 'Namkeen', '0', 0.00, 0.00, 112.00, 10.00, 10.00, ' Ha00001', 'Haldirams', NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(549, 'FMD179141', 'Raj Peanuts (350 gms)', 'Basic description of Snacks & Dry Fruits 15', '22', 'Snacks & Dry Fruits', '31', 'Namkeen', '0', 0.00, 0.00, 140.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(550, 'FMD180705', 'Junge Lakhamari (250 gm)', 'Basic description of Snacks & Dry Fruits 16', '22', 'Snacks & Dry Fruits', '31', 'Namkeen', '0', 0.00, 0.00, 105.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(551, 'FMD180706', 'Junge Nimki (300 gm)', 'Basic description of Snacks & Dry Fruits 17', '22', 'Snacks & Dry Fruits', '31', 'Namkeen', '0', 0.00, 0.00, 110.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(552, 'FMD174188', 'Dalmot (350 gm)', 'Basic description of Snacks & Dry Fruits 18', '22', 'Snacks & Dry Fruits', '31', 'Namkeen', '0', 0.00, 0.00, 55.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(553, 'FMD174212', 'Chatpat Peanuts (360 gms) - Adity', 'Basic description of Snacks & Dry Fruits 19', '22', 'Snacks & Dry Fruits', '31', 'Namkeen', '0', 0.00, 0.00, 220.00, 10.00, 10.00, ' Ad00002', 'Adity', NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(554, 'FMD174213', 'Salted Roasted Peanuts (360 gms)', 'Basic description of Snacks & Dry Fruits 20', '22', 'Snacks & Dry Fruits', '31', 'Namkeen', '0', 0.00, 0.00, 185.00, 10.00, 10.00, ' Ad00002', 'Adity', NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(555, 'FMD174263', 'Haldiram\'s All In One Big (180 gm)', 'Basic description of Snacks & Dry Fruits 21', '22', 'Snacks & Dry Fruits', '31', 'Namkeen', '0', 0.00, 0.00, 115.00, 10.00, 10.00, ' Ha00001', 'Haldirams', NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(556, 'FMD174264', 'Haldiram\'s Aloo Bhujia (200 gm)', 'Basic description of Snacks & Dry Fruits 22', '22', 'Snacks & Dry Fruits', '31', 'Namkeen', '0', 0.00, 0.00, 112.00, 10.00, 10.00, ' Ha00001', 'Haldirams', NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(557, 'FMD230994', 'Pampers Diapers 86s (XS)', 'Basic description of Baby Care 16', '1', 'Baby Care', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 1828.00, 10.00, 10.00, ' Pa00001', 'Pamper', NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(558, 'FMD314898', 'Frooti Mango Drinks 500Ml', 'Basic description of Beverages 74', '4', 'Beverages', '6', 'Ready to Drink', '0', 0.00, 0.00, 80.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(559, 'FMD174266', 'Haldiram\'s Bhujia Masala (180 gm)', 'Basic description of Snacks & Dry Fruits 23', '22', 'Snacks & Dry Fruits', '31', 'Namkeen', '0', 0.00, 0.00, 117.00, 10.00, 10.00, ' Ha00001', 'Haldirams', NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(560, 'FMD174267', 'Haldiram\'s Bhujia Masala (360 gm)', 'Basic description of Snacks & Dry Fruits 24', '22', 'Snacks & Dry Fruits', '31', 'Namkeen', '0', 0.00, 0.00, 234.00, 10.00, 10.00, ' Ha00001', 'Haldirams', NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(561, 'FMD174268', 'Haldiram\'s Khatta Meetha (180 gm)', 'Basic description of Snacks & Dry Fruits 25', '22', 'Snacks & Dry Fruits', '31', 'Namkeen', '0', 0.00, 0.00, 107.00, 10.00, 10.00, ' Ha00001', 'Haldirams', NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(562, 'FMD174269', 'Haldiram\'s Moong Dal (1 kg)', 'Basic description of Snacks & Dry Fruits 26', '22', 'Snacks & Dry Fruits', '31', 'Namkeen', '0', 0.00, 0.00, 652.00, 10.00, 10.00, ' Ha00001', 'Haldirams', NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(563, 'FMD174271', 'Haldiram\'s Moong Dal (360 gm)', 'Basic description of Snacks & Dry Fruits 27', '22', 'Snacks & Dry Fruits', '31', 'Namkeen', '0', 0.00, 0.00, 244.00, 10.00, 10.00, ' Ha00001', 'Haldirams', NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(564, 'FMD174272', 'Haldiram\'s Navrattan (180 gm)', 'Basic description of Snacks & Dry Fruits 28', '22', 'Snacks & Dry Fruits', '31', 'Namkeen', '0', 0.00, 0.00, 107.00, 10.00, 10.00, ' Ha00001', 'Haldirams', NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(565, 'FMD174274', 'Haldiram\'s Panchrattan (200 gm)', 'Basic description of Snacks & Dry Fruits 29', '22', 'Snacks & Dry Fruits', '31', 'Namkeen', '0', 0.00, 0.00, 247.00, 10.00, 10.00, ' Ha00001', 'Haldirams', NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:15'),
(566, 'FMD238063', 'Khatta Meeta Haldirams (180 gm)', 'Basic description of Snacks & Dry Fruits 30', '22', 'Snacks & Dry Fruits', '31', 'Namkeen', '0', 0.00, 0.00, 98.00, 10.00, 10.00, ' Ha00001', 'Haldirams', NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:16'),
(567, 'FMD269607', 'Aloo Bhujiya (400)', 'Basic description of Snacks & Dry Fruits 31', '22', 'Snacks & Dry Fruits', '31', 'Namkeen', '0', 0.00, 0.00, 227.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:16'),
(568, 'FMD253690', 'Haldirams Pancharattan (190 gm)', 'Basic description of Snacks & Dry Fruits 32', '22', 'Snacks & Dry Fruits', '31', 'Namkeen', '0', 0.00, 0.00, 205.00, 10.00, 10.00, ' Ha00001', 'Haldirams', NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:16'),
(569, 'FMD325068', 'B Fizz 160ml', 'Basic description of Beverages 75', '4', 'Beverages', '6', 'Ready to Drink', '0', 0.00, 0.00, 20.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:16'),
(570, 'FMD288678', 'Panchrattan (200 gm)', 'Basic description of Snacks & Dry Fruits 33', '22', 'Snacks & Dry Fruits', '31', 'Namkeen', '0', 0.00, 0.00, 248.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:16'),
(571, 'FMD288679', 'Punjabi Tadka (200 gm)', 'Basic description of Snacks & Dry Fruits 34', '22', 'Snacks & Dry Fruits', '31', 'Namkeen', '0', 0.00, 0.00, 140.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:16'),
(572, 'FMD290117', 'Raj Peanuts (1 Kg)', 'Basic description of Snacks & Dry Fruits 35', '22', 'Snacks & Dry Fruits', '31', 'Namkeen', '0', 0.00, 0.00, 415.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:16'),
(573, 'FMD292115', 'Cornflakes Mixture (200 gm)', 'Basic description of Snacks & Dry Fruits 36', '22', 'Snacks & Dry Fruits', '31', 'Namkeen', '0', 0.00, 0.00, 210.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:16'),
(574, 'FMD177749', 'Cornitos Nacho Crisps Cheese & Herbs (60 gm) Pack of 2', 'Basic description of Snacks & Dry Fruits 37', '22', 'Snacks & Dry Fruits', '32', 'Chips & Popcorn', '0', 0.00, 0.00, 235.00, 10.00, 10.00, ' Co00001', 'Cornitos', NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:16'),
(575, 'FMD174380', 'Pringles Cheesy Cheese (147 gm)', 'Basic description of Snacks & Dry Fruits 38', '22', 'Snacks & Dry Fruits', '32', 'Chips & Popcorn', '0', 0.00, 0.00, 289.00, 10.00, 10.00, ' Pr00002', 'Pringles', NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:16'),
(576, 'FMD174381', 'Pringles Original (147 gm)', 'Basic description of Snacks & Dry Fruits 39', '22', 'Snacks & Dry Fruits', '32', 'Chips & Popcorn', '0', 0.00, 0.00, 315.00, 10.00, 10.00, ' Pr00002', 'Pringles', NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:16'),
(577, 'FMD174382', 'Pringles Pizza (107 gm)', 'Basic description of Snacks & Dry Fruits 40', '22', 'Snacks & Dry Fruits', '32', 'Chips & Popcorn', '0', 0.00, 0.00, 239.00, 10.00, 10.00, ' Pr00002', 'Pringles', NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:16'),
(578, 'FMD174385', 'Pringles Salt & Seaweed (110 gm)', 'Basic description of Snacks & Dry Fruits 41', '22', 'Snacks & Dry Fruits', '32', 'Chips & Popcorn', '0', 0.00, 0.00, 200.00, 10.00, 10.00, ' Pr00002', 'Pringles', NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:16'),
(579, 'FMD174386', 'Pringles Sour Cream & Onion (147 gm)', 'Basic description of Snacks & Dry Fruits 42', '22', 'Snacks & Dry Fruits', '32', 'Chips & Popcorn', '0', 0.00, 0.00, 240.00, 10.00, 10.00, ' Pr00002', 'Pringles', NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:16'),
(580, 'FMD325069', 'B Fizz 250ml', 'Basic description of Beverages 76', '4', 'Beverages', '6', 'Ready to Drink', '0', 0.00, 0.00, 40.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:16'),
(581, 'FMD174207', 'Cornitos Nacho Crisps Peri Peri (140 gm)', 'Basic description of Snacks & Dry Fruits 43', '22', 'Snacks & Dry Fruits', '32', 'Chips & Popcorn', '0', 0.00, 0.00, 235.00, 10.00, 10.00, ' Co00001', 'Cornitos', NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:16'),
(582, 'FMD174208', 'Cornitos Nacho Crisps Sea Salt (140 gm)', 'Basic description of Snacks & Dry Fruits 44', '22', 'Snacks & Dry Fruits', '32', 'Chips & Popcorn', '0', 0.00, 0.00, 235.00, 10.00, 10.00, ' Co00001', 'Cornitos', NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:16'),
(583, 'FMD174209', 'Cornitos Nacho Crisps Thai Sweet Chilli (140 gm)', 'Basic description of Snacks & Dry Fruits 45', '22', 'Snacks & Dry Fruits', '32', 'Chips & Popcorn', '0', 0.00, 0.00, 235.00, 10.00, 10.00, ' Co00001', 'Cornitos', NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:16'),
(584, 'FMD174210', 'Cornitos Nacho Crisps Tikka Masala (140 gm)', 'Basic description of Snacks & Dry Fruits 46', '22', 'Snacks & Dry Fruits', '32', 'Chips & Popcorn', '0', 0.00, 0.00, 235.00, 10.00, 10.00, ' Co00001', 'Cornitos', NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:16'),
(585, 'FMD174211', 'Cornitos Nacho Crisps Tomato Mexicana (140 gm)', 'Basic description of Snacks & Dry Fruits 47', '22', 'Snacks & Dry Fruits', '32', 'Chips & Popcorn', '0', 0.00, 0.00, 235.00, 10.00, 10.00, ' Co00001', 'Cornitos', NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:16'),
(586, 'FMD174247', 'Microwave Popcorn, Butter (273 gm)- American Garden', 'Basic description of Snacks & Dry Fruits 48', '22', 'Snacks & Dry Fruits', '32', 'Chips & Popcorn', '0', 0.00, 0.00, 405.00, 10.00, 10.00, ' Am00001', 'American Garden', NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:16'),
(587, 'FMD174248', 'Microwave Popcorn, Natural Light (240 gm)- American Garden', 'Basic description of Snacks & Dry Fruits 49', '22', 'Snacks & Dry Fruits', '32', 'Chips & Popcorn', '0', 0.00, 0.00, 405.00, 10.00, 10.00, ' Am00001', 'American Garden', NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:16'),
(588, 'FMD216621', 'WOW Pop Corn Cheese', 'Basic description of Snacks & Dry Fruits 50', '22', 'Snacks & Dry Fruits', '32', 'Chips & Popcorn', '0', 0.00, 0.00, 10.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:16');
INSERT INTO `products` (`id`, `product_code`, `product_name`, `product_description`, `category_id`, `category_name`, `subcategory_id`, `subcategory_name`, `delivery_target_days`, `discount`, `actual_price`, `sell_price`, `available_quantity`, `stock_quantity`, `brand_id`, `brand_name`, `primary_image`, `created_at`, `updated_at`) VALUES
(589, 'FMD219796', 'WOW Popcorn Family Pack Butterscotch Flavor', 'Basic description of Snacks & Dry Fruits 51', '22', 'Snacks & Dry Fruits', '32', 'Chips & Popcorn', '0', 0.00, 0.00, 270.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:16'),
(590, 'FMD219797', 'WOW Popcorn Family Pack Caramel Flavor', 'Basic description of Snacks & Dry Fruits 52', '22', 'Snacks & Dry Fruits', '32', 'Chips & Popcorn', '0', 0.00, 0.00, 270.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:16'),
(591, 'FMD325070', 'B Fizz 500ml', 'Basic description of Beverages 77', '4', 'Beverages', '6', 'Ready to Drink', '0', 0.00, 0.00, 70.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:16'),
(592, 'FMD219798', 'WOW Popcorn Family Pack Cheese & Caramel Flavor', 'Basic description of Snacks & Dry Fruits 53', '22', 'Snacks & Dry Fruits', '32', 'Chips & Popcorn', '0', 0.00, 0.00, 270.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:16'),
(593, 'FMD219799', 'WOW Popcorn Family Pack Cheese Flavor', 'Basic description of Snacks & Dry Fruits 54', '22', 'Snacks & Dry Fruits', '32', 'Chips & Popcorn', '0', 0.00, 0.00, 190.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:16'),
(594, 'FMD219800', 'WOW Popcorn Family Pack Piro Piro Flavor', 'Basic description of Snacks & Dry Fruits 55', '22', 'Snacks & Dry Fruits', '32', 'Chips & Popcorn', '0', 0.00, 0.00, 190.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:16'),
(595, 'FMD217020', 'Cornitos Nacho Cheese & Herbs (140 gm)', 'Basic description of Snacks & Dry Fruits 56', '22', 'Snacks & Dry Fruits', '32', 'Chips & Popcorn', '0', 0.00, 0.00, 235.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:16'),
(596, 'FMD217021', 'Cornitos Nacho Wasabi (140 gm)', 'Basic description of Snacks & Dry Fruits 57', '22', 'Snacks & Dry Fruits', '32', 'Chips & Popcorn', '0', 0.00, 0.00, 235.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:16'),
(597, 'FMD215881', 'WOW Pop Corn Family Pack (Cheese Flavor)', 'Basic description of Snacks & Dry Fruits 58', '22', 'Snacks & Dry Fruits', '32', 'Chips & Popcorn', '0', 0.00, 0.00, 240.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:16'),
(598, 'FMD215882', 'WOW Pop Corn Family Pack (Piro Piro Flavor)', 'Basic description of Snacks & Dry Fruits 59', '22', 'Snacks & Dry Fruits', '32', 'Chips & Popcorn', '0', 0.00, 0.00, 240.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:16'),
(599, 'FMD215883', 'WOW Pop Corn Family Pack (Cheese Caramel Flavor)', 'Basic description of Snacks & Dry Fruits 60', '22', 'Snacks & Dry Fruits', '32', 'Chips & Popcorn', '0', 0.00, 0.00, 270.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:16'),
(600, 'FMD215884', 'WOW Pop Corn Family Pack (Caramel Flavor)', 'Basic description of Snacks & Dry Fruits 61', '22', 'Snacks & Dry Fruits', '32', 'Chips & Popcorn', '0', 0.00, 0.00, 340.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:16'),
(601, 'FMD215885', 'WOW Pop Corn Family Pack (Butter Scotch Flavor)', 'Basic description of Snacks & Dry Fruits 62', '22', 'Snacks & Dry Fruits', '32', 'Chips & Popcorn', '0', 0.00, 0.00, 340.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:16'),
(602, 'FMD342456', 'Apple Juice Marpha ( Bottle)', 'Basic description of Beverages 78', '4', 'Beverages', '6', 'Ready to Drink', '0', 0.00, 0.00, 140.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:16'),
(603, 'FMD215857', 'WOW Aalu Chips', 'Basic description of Snacks & Dry Fruits 63', '22', 'Snacks & Dry Fruits', '32', 'Chips & Popcorn', '0', 0.00, 0.00, 30.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:16'),
(604, 'FMD215858', 'WOW Tomato & Peri Peri Twist', 'Basic description of Snacks & Dry Fruits 64', '22', 'Snacks & Dry Fruits', '32', 'Chips & Popcorn', '0', 0.00, 0.00, 10.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:16'),
(605, 'FMD212059', 'Pringles Original  (107 gm)', 'Basic description of Snacks & Dry Fruits 65', '22', 'Snacks & Dry Fruits', '32', 'Chips & Popcorn', '0', 0.00, 0.00, 215.00, 10.00, 10.00, ' Pr00002', 'Pringles', NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:16'),
(606, 'FMD192569', 'Pringles BBQ (107 gm)', 'Basic description of Snacks & Dry Fruits 67', '22', 'Snacks & Dry Fruits', '32', 'Chips & Popcorn', '0', 0.00, 0.00, 265.00, 10.00, 10.00, ' Pr00002', 'Pringles', NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:16'),
(607, 'FMD192293', 'WOW Cheese Rings', 'Basic description of Snacks & Dry Fruits 68', '22', 'Snacks & Dry Fruits', '32', 'Chips & Popcorn', '0', 0.00, 0.00, 10.00, 10.00, 10.00, ' WO00001', 'WOW', NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:16'),
(608, 'FMD192294', 'WOW Piro Piro Rings', 'Basic description of Snacks & Dry Fruits 69', '22', 'Snacks & Dry Fruits', '32', 'Chips & Popcorn', '0', 0.00, 0.00, 10.00, 10.00, 10.00, ' WO00001', 'WOW', NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:16'),
(609, 'FMD192295', 'WOW Pop Corn Caramel', 'Basic description of Snacks & Dry Fruits 70', '22', 'Snacks & Dry Fruits', '32', 'Chips & Popcorn', '0', 0.00, 0.00, 40.00, 10.00, 10.00, ' WO00001', 'WOW', NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:16'),
(610, 'FMD192297', 'WOW Pop Corn Masala', 'Basic description of Snacks & Dry Fruits 72', '22', 'Snacks & Dry Fruits', '32', 'Chips & Popcorn', '0', 0.00, 0.00, 10.00, 10.00, 10.00, ' WO00001', 'WOW', NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:16'),
(611, 'FMD192298', 'WOW Popcorn Buttersalt', 'Basic description of Snacks & Dry Fruits 73', '22', 'Snacks & Dry Fruits', '32', 'Chips & Popcorn', '0', 0.00, 0.00, 10.00, 10.00, 10.00, ' WO00001', 'WOW', NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:16'),
(612, 'FMD189250', 'Cornitos Nacho crisps Sour cream & Onion (140 gm)', 'Basic description of Snacks & Dry Fruits 75', '22', 'Snacks & Dry Fruits', '32', 'Chips & Popcorn', '0', 0.00, 0.00, 235.00, 10.00, 10.00, ' Co00001', 'Cornitos', NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:16'),
(613, 'FMD342457', 'Apricot Juice Marpha ( Bottle)', 'Basic description of Beverages 79', '4', 'Beverages', '6', 'Ready to Drink', '0', 0.00, 0.00, 140.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:16'),
(614, 'FMD189350', 'Nacho Jalapano With Salsa Dip Tray Pack (70 gm)-Cornitos', 'Basic description of Snacks & Dry Fruits 76', '22', 'Snacks & Dry Fruits', '32', 'Chips & Popcorn', '0', 0.00, 0.00, 160.00, 10.00, 10.00, ' Co00001', 'Cornitos', NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:16'),
(615, 'FMD189351', 'Nacho Peri Peri With Salsa Dip Tray Pack (70 gm)- Cornitos', 'Basic description of Snacks & Dry Fruits 77', '22', 'Snacks & Dry Fruits', '32', 'Chips & Popcorn', '0', 0.00, 0.00, 160.00, 10.00, 10.00, ' Co00001', 'Cornitos', NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:17'),
(616, 'FMD183154', 'Cornitos Nacho Crisps Jalapeno (140 gm)', 'Basic description of Snacks & Dry Fruits 78', '22', 'Snacks & Dry Fruits', '32', 'Chips & Popcorn', '0', 0.00, 0.00, 235.00, 10.00, 10.00, ' Co00001', 'Cornitos', NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:17'),
(617, 'FMD369522', 'Pringles Cheese', 'Basic description of Snacks & Dry Fruits 79', '22', 'Snacks & Dry Fruits', '32', 'Chips & Popcorn', '0', 0.00, 0.00, 265.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:47', '2024-09-15 23:39:17'),
(618, 'FMD374452', 'Pringles Hot and Spicy', 'Basic description of Snacks & Dry Fruits 80', '22', 'Snacks & Dry Fruits', '32', 'Chips & Popcorn', '0', 0.00, 0.00, 265.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:17'),
(619, 'FMD374453', 'Pringles Sour Cream', 'Basic description of Snacks & Dry Fruits 81', '22', 'Snacks & Dry Fruits', '32', 'Chips & Popcorn', '0', 0.00, 0.00, 265.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:17'),
(620, 'FMD342094', 'Pringles Saucy BBQ', 'Basic description of Snacks & Dry Fruits 82', '22', 'Snacks & Dry Fruits', '32', 'Chips & Popcorn', '0', 0.00, 0.00, 265.00, 10.00, 10.00, ' Pr00002', 'Pringles', NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:17'),
(621, 'FMD323681', 'Original Pringles (102 gm)', 'Basic description of Snacks & Dry Fruits 84', '22', 'Snacks & Dry Fruits', '32', 'Chips & Popcorn', '0', 0.00, 0.00, 265.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:17'),
(622, 'FMD314842', 'Beyond  Snacks Banana Chips Hot & Sweet Chilli 25g (Pack of 3)', 'Basic description of Snacks & Dry Fruits 85', '22', 'Snacks & Dry Fruits', '32', 'Chips & Popcorn', '0', 0.00, 0.00, 185.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:17'),
(623, 'FMD315208', 'Banana Chips 50 gm Desi Masala', 'Basic description of Snacks & Dry Fruits 86', '22', 'Snacks & Dry Fruits', '32', 'Chips & Popcorn', '0', 0.00, 0.00, 115.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:17'),
(624, 'FMD189246', 'Nestle Milo (180 ml)', 'Basic description of Beverages 80', '4', 'Beverages', '6', 'Ready to Drink', '0', 0.00, 0.00, 80.00, 10.00, 10.00, ' Ne00003', 'Nestle', NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:17'),
(625, 'FMD315209', 'Banana Chips 50 gm Original', 'Basic description of Snacks & Dry Fruits 87', '22', 'Snacks & Dry Fruits', '32', 'Chips & Popcorn', '0', 0.00, 0.00, 115.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:17'),
(626, 'FMD316945', 'Banana Chips - Hot & Chilly (50 gms) - Beyond Snack', 'Basic description of Snacks & Dry Fruits 88', '22', 'Snacks & Dry Fruits', '32', 'Chips & Popcorn', '0', 0.00, 0.00, 115.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:17'),
(627, 'FMD316946', 'Banana Chips - Peri Peri (50 gms) - Beyond Snack', 'Basic description of Snacks & Dry Fruits 89', '22', 'Snacks & Dry Fruits', '32', 'Chips & Popcorn', '0', 0.00, 0.00, 115.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:17'),
(628, 'FMD316947', 'Banana Chips - Salt & Black Pepper (50 gms) - Beyond Snack', 'Basic description of Snacks & Dry Fruits 90', '22', 'Snacks & Dry Fruits', '32', 'Chips & Popcorn', '0', 0.00, 0.00, 115.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:17'),
(629, 'FMD316948', 'Banana Chips - Sour Cream Onion & Parsley (50 gms) - Beyond Snack', 'Basic description of Snacks & Dry Fruits 91', '22', 'Snacks & Dry Fruits', '32', 'Chips & Popcorn', '0', 0.00, 0.00, 115.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:17'),
(630, 'FMD229456', 'Cornitos Nacho Crisps Tomato Mexicana (65 gm)', 'Basic description of Snacks & Dry Fruits 92', '22', 'Snacks & Dry Fruits', '32', 'Chips & Popcorn', '0', 0.00, 0.00, 120.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:17'),
(631, 'FMD226176', 'Cheetos Cheese 27g', 'Basic description of Snacks & Dry Fruits 93', '22', 'Snacks & Dry Fruits', '32', 'Chips & Popcorn', '0', 0.00, 0.00, 67.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:17'),
(632, 'FMD226177', 'Cheetos Crunchy Flamin Hot 205g', 'Basic description of Snacks & Dry Fruits 94', '22', 'Snacks & Dry Fruits', '32', 'Chips & Popcorn', '0', 0.00, 0.00, 1270.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:17'),
(633, 'FMD226178', 'Cheetos Crunchy Flamin Hot 90g', 'Basic description of Snacks & Dry Fruits 95', '22', 'Snacks & Dry Fruits', '32', 'Chips & Popcorn', '0', 0.00, 0.00, 340.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:17'),
(634, 'FMD226179', 'Cheetos Crunchy Flamin Hot Lime 200g', 'Basic description of Snacks & Dry Fruits 96', '22', 'Snacks & Dry Fruits', '32', 'Chips & Popcorn', '0', 0.00, 0.00, 1270.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:17'),
(635, 'FMD174346', 'NESCAFE Chilled Latte Cold Coffee, (180 ml) Tetra Pack', 'Basic description of Beverages 81', '4', 'Beverages', '6', 'Ready to Drink', '0', 0.00, 0.00, 80.00, 10.00, 10.00, ' Ne00001', 'Nescafe', NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:17'),
(636, 'FMD226180', 'Cheetos Twisted 160g', 'Basic description of Snacks & Dry Fruits 97', '22', 'Snacks & Dry Fruits', '32', 'Chips & Popcorn', '0', 0.00, 0.00, 850.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:17'),
(637, 'FMD226181', 'Doritos Flamin Hot 175g', 'Basic description of Snacks & Dry Fruits 98', '22', 'Snacks & Dry Fruits', '32', 'Chips & Popcorn', '0', 0.00, 0.00, 640.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:17'),
(638, 'FMD226182', 'Doritos Flamin Hot Lime 175g', 'Basic description of Snacks & Dry Fruits 99', '22', 'Snacks & Dry Fruits', '32', 'Chips & Popcorn', '0', 0.00, 0.00, 640.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:17'),
(639, 'FMD226183', 'Doritos Nacho Cheese 180g', 'Basic description of Snacks & Dry Fruits 100', '22', 'Snacks & Dry Fruits', '32', 'Chips & Popcorn', '0', 0.00, 0.00, 590.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:17'),
(640, 'FMD226184', 'Doritos sweet chilli pepper 180g', 'Basic description of Snacks & Dry Fruits 101', '22', 'Snacks & Dry Fruits', '32', 'Chips & Popcorn', '0', 0.00, 0.00, 889.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:17'),
(641, 'FMD230996', 'WOW Butterscotch Pop Corn (Family Pack)', 'Basic description of Snacks & Dry Fruits 102', '22', 'Snacks & Dry Fruits', '32', 'Chips & Popcorn', '0', 0.00, 0.00, 340.00, 10.00, 10.00, ' WO00001', 'WOW', NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:17'),
(642, 'FMD230997', 'WOW Caramel Pop Corn (Family Pack)', 'Basic description of Snacks & Dry Fruits 103', '22', 'Snacks & Dry Fruits', '32', 'Chips & Popcorn', '0', 0.00, 0.00, 340.00, 10.00, 10.00, ' WO00001', 'WOW', NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:17'),
(643, 'FMD230998', 'WOW Cheese Caramel Pop Corn (Family Pack)', 'Basic description of Snacks & Dry Fruits 104', '22', 'Snacks & Dry Fruits', '32', 'Chips & Popcorn', '0', 0.00, 0.00, 340.00, 10.00, 10.00, ' WO00001', 'WOW', NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:17'),
(644, 'FMD230999', 'WOW Cheese Pop Corn (Family Pack)', 'Basic description of Snacks & Dry Fruits 105', '22', 'Snacks & Dry Fruits', '32', 'Chips & Popcorn', '0', 0.00, 0.00, 240.00, 10.00, 10.00, ' WO00001', 'WOW', NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:17'),
(645, 'FMD231000', 'WOW Peri Peri Pop Corn (Family Pack)', 'Basic description of Snacks & Dry Fruits 106', '22', 'Snacks & Dry Fruits', '32', 'Chips & Popcorn', '0', 0.00, 0.00, 240.00, 10.00, 10.00, ' WO00001', 'WOW', NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:17'),
(646, 'FMD174347', 'NESCAFE Hazelnut Coffee Cold Coffee, (180 ml) Tetra Pack', 'Basic description of Beverages 82', '4', 'Beverages', '6', 'Ready to Drink', '0', 0.00, 0.00, 80.00, 10.00, 10.00, ' Ne00001', 'Nescafe', NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:17'),
(647, 'FMD252386', 'Pringles Hot & Spicy (147 gm)', 'Basic description of Snacks & Dry Fruits 107', '22', 'Snacks & Dry Fruits', '32', 'Chips & Popcorn', '0', 0.00, 0.00, 240.00, 10.00, 10.00, ' Pr00002', 'Pringles', NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:17'),
(648, 'FMD283213', 'Cornitos Nacho crisps Sour cream & Onion (60 gm)', 'Basic description of Snacks & Dry Fruits 108', '22', 'Snacks & Dry Fruits', '32', 'Chips & Popcorn', '0', 0.00, 0.00, 120.00, 10.00, 10.00, ' Co00001', 'Cornitos', NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:17'),
(649, 'FMD283268', 'Cornitos Nacho Crisps Barbeque 60g', 'Basic description of Snacks & Dry Fruits 109', '22', 'Snacks & Dry Fruits', '32', 'Chips & Popcorn', '0', 0.00, 0.00, 120.00, 10.00, 10.00, ' Co00001', 'Cornitos', NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:17'),
(650, 'FMD306494', 'WOW Popcorn Family Pack Cheese', 'Basic description of Snacks & Dry Fruits 110', '22', 'Snacks & Dry Fruits', '32', 'Chips & Popcorn', '0', 0.00, 0.00, 270.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:17'),
(651, 'FMD307633', 'Beyond Snacks Banana Chips Peri Peri Flaveor 25g(Pack of 3)', 'Basic description of Snacks & Dry Fruits 111', '22', 'Snacks & Dry Fruits', '32', 'Chips & Popcorn', '0', 0.00, 0.00, 185.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:18'),
(652, 'FMD310677', 'Beyond Snacks Banana Chips Desi Masala 25g (Pack of 3)', 'Basic description of Snacks & Dry Fruits 112', '22', 'Snacks & Dry Fruits', '32', 'Chips & Popcorn', '0', 0.00, 0.00, 185.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:18'),
(653, 'FMD310678', 'Beyond Snacks Banana Chips Original Style 25g (Pack of 3)', 'Basic description of Snacks & Dry Fruits 113', '22', 'Snacks & Dry Fruits', '32', 'Chips & Popcorn', '0', 0.00, 0.00, 185.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:18'),
(654, 'FMD310679', 'Beyond Snacks Banana Chips Sour Cream Onion & Parsley 25g (Pack of 3)', 'Basic description of Snacks & Dry Fruits 114', '22', 'Snacks & Dry Fruits', '32', 'Chips & Popcorn', '0', 0.00, 0.00, 185.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:18'),
(655, 'FMD310680', 'Tong Garden Wasabi Green Peas 90gm', 'Basic description of Snacks & Dry Fruits 115', '22', 'Snacks & Dry Fruits', '32', 'Chips & Popcorn', '0', 0.00, 0.00, 115.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:18'),
(656, 'FMD310681', 'Tong Garden Bbq Board Beans 500Gms', 'Basic description of Snacks & Dry Fruits 116', '22', 'Snacks & Dry Fruits', '32', 'Chips & Popcorn', '0', 0.00, 0.00, 515.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:18'),
(657, 'FMD174348', 'NESCAFE Intense Café Cold Coffee, (180 ml) Tetra Pack', 'Basic description of Beverages 83', '4', 'Beverages', '6', 'Ready to Drink', '0', 0.00, 0.00, 80.00, 10.00, 10.00, ' Ne00001', 'Nescafe', NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:18'),
(658, 'FMD310682', 'Tong Garden Party Snacks 40Gms', 'Basic description of Snacks & Dry Fruits 117', '22', 'Snacks & Dry Fruits', '32', 'Chips & Popcorn', '0', 0.00, 0.00, 50.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:18'),
(659, 'FMD310683', 'Tong Garden Salted Penuts 160Gms Pouch', 'Basic description of Snacks & Dry Fruits 118', '22', 'Snacks & Dry Fruits', '32', 'Chips & Popcorn', '0', 0.00, 0.00, 215.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:18'),
(660, 'FMD174415', 'Almonds (500g)', 'Basic description of Snacks & Dry Fruits 119', '22', 'Snacks & Dry Fruits', '33', 'Dry Fruits', '0', 0.00, 0.00, 690.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:18'),
(661, 'FMD174416', 'Cashew (500g)', 'Basic description of Snacks & Dry Fruits 120', '22', 'Snacks & Dry Fruits', '33', 'Dry Fruits', '0', 0.00, 0.00, 845.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:18'),
(662, 'FMD174417', 'Raisins (500g)', 'Basic description of Snacks & Dry Fruits 121', '22', 'Snacks & Dry Fruits', '33', 'Dry Fruits', '0', 0.00, 0.00, 265.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:18'),
(663, 'FMD174418', 'Walnuts (500g)', 'Basic description of Snacks & Dry Fruits 122', '22', 'Snacks & Dry Fruits', '33', 'Dry Fruits', '0', 0.00, 0.00, 765.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:18'),
(664, 'FMD177551', 'Mum\'s Hot & Sweet Ketchup (1 kg)', 'Basic description of Soup, Sauce & Seasonings 1', '23', 'Soup, Sauce & Seasonings', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 230.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:18'),
(665, 'FMD177552', 'Mum\'s Mustard Sauce (200 gm)', 'Basic description of Soup, Sauce & Seasonings 2', '23', 'Soup, Sauce & Seasonings', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 54.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:18'),
(666, 'FMD177553', 'Mum\'s Tomato Ketchup (1 kg)', 'Basic description of Soup, Sauce & Seasonings 3', '23', 'Soup, Sauce & Seasonings', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 230.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:18'),
(667, 'FMD178058', 'Pasta Sauce, Traditional (397 gm)', 'Basic description of Soup, Sauce & Seasonings 4', '23', 'Soup, Sauce & Seasonings', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 260.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:18'),
(668, 'FMD230995', 'Pampers Diapers 98s (MD)', 'Basic description of Baby Care 17', '1', 'Baby Care', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 2468.00, 10.00, 10.00, ' Pa00001', 'Pamper', NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:18'),
(669, 'FMD174399', 'Amul Kool - Kesar (180 ml)', 'Basic description of Beverages 84', '4', 'Beverages', '6', 'Ready to Drink', '0', 0.00, 0.00, 80.00, 10.00, 10.00, ' Am00002', 'Amul', NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:18'),
(670, 'FMD174443', 'Hong Kong Manchow Noodle Soup', 'Basic description of Soup, Sauce & Seasonings 5', '23', 'Soup, Sauce & Seasonings', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 94.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:18'),
(671, 'FMD174444', 'Hot & Sour Vegetable Soup', 'Basic description of Soup, Sauce & Seasonings 6', '23', 'Soup, Sauce & Seasonings', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 78.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:18'),
(672, 'FMD174445', 'Italian Mushroom Soup', 'Basic description of Soup, Sauce & Seasonings 7', '23', 'Soup, Sauce & Seasonings', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 94.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:18'),
(673, 'FMD174446', 'Mexican Corn Tomato Soup', 'Basic description of Soup, Sauce & Seasonings 8', '23', 'Soup, Sauce & Seasonings', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 94.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:18'),
(674, 'FMD174447', 'Thai Vegetable Soup', 'Basic description of Soup, Sauce & Seasonings 9', '23', 'Soup, Sauce & Seasonings', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 94.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:18'),
(675, 'FMD174659', 'Kissan Fresh Tomato (500 gm)', 'Basic description of Soup, Sauce & Seasonings 10', '23', 'Soup, Sauce & Seasonings', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 150.00, 10.00, 10.00, ' Ki00001', 'Kissan', NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:18'),
(676, 'FMD174459', 'Maggi Hot & Sweet Ketchup 1 kg', 'Basic description of Soup, Sauce & Seasonings 11', '23', 'Soup, Sauce & Seasonings', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 135.00, 10.00, 10.00, ' Ma00001', 'Maggi', NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:18'),
(677, 'FMD174460', 'Maggi Hot & Sweet Ketchup (500 gm)', 'Basic description of Soup, Sauce & Seasonings 12', '23', 'Soup, Sauce & Seasonings', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 205.00, 10.00, 10.00, ' Ma00001', 'Maggi', NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:18'),
(678, 'FMD174461', 'Maggi Tomato Ketchup 1 kg', 'Basic description of Soup, Sauce & Seasonings 13', '23', 'Soup, Sauce & Seasonings', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 340.00, 10.00, 10.00, ' Ma00001', 'Maggi', NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:18'),
(679, 'FMD174462', 'Maggi Tomato Ketchup 500 gms', 'Basic description of Soup, Sauce & Seasonings 14', '23', 'Soup, Sauce & Seasonings', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 205.00, 10.00, 10.00, ' Ma00001', 'Maggi', NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:18'),
(680, 'FMD176382', 'Chabaa Mango Juice (230 ml)', 'Basic description of Beverages 85', '4', 'Beverages', '6', 'Ready to Drink', '0', 0.00, 0.00, 70.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:18'),
(681, 'FMD174191', 'Homemade Tomato Ketchup (200 gm)', 'Basic description of Soup, Sauce & Seasonings 15', '23', 'Soup, Sauce & Seasonings', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 115.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:18'),
(682, 'FMD174239', 'Pasta Sauce, Traditional (397 gm)- American Garden', 'Basic description of Soup, Sauce & Seasonings 16', '23', 'Soup, Sauce & Seasonings', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 315.00, 10.00, 10.00, ' Am00001', 'American Garden', NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:18'),
(683, 'FMD174240', 'Pasta Sauce, Traditional (680gm)- American Garden', 'Basic description of Soup, Sauce & Seasonings 17', '23', 'Soup, Sauce & Seasonings', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 390.00, 10.00, 10.00, ' Am00001', 'American Garden', NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:18'),
(684, 'FMD174236', 'Mustard Deli Style (397 gm)- American Garden', 'Basic description of Soup, Sauce & Seasonings 18', '23', 'Soup, Sauce & Seasonings', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 415.00, 10.00, 10.00, ' Am00001', 'American Garden', NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:18'),
(685, 'FMD174195', 'Roasted Flax Seed Powder (100 gm)', 'Basic description of Soup, Sauce & Seasonings 19', '23', 'Soup, Sauce & Seasonings', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 65.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:18'),
(686, 'FMD174317', 'Knorr Mushroom (48 gm)', 'Basic description of Soup, Sauce & Seasonings 20', '23', 'Soup, Sauce & Seasonings', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 38.00, 10.00, 10.00, ' Kn00001', 'Knorr', NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:18'),
(687, 'FMD174318', 'Sweet & Spicy (1 kg)', 'Basic description of Soup, Sauce & Seasonings 21', '23', 'Soup, Sauce & Seasonings', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 246.00, 10.00, 10.00, ' Ki00001', 'Kissan', NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:19'),
(688, 'FMD174319', 'Knorr  Sweet Corn Chicken (45 gm)', 'Basic description of Soup, Sauce & Seasonings 22', '23', 'Soup, Sauce & Seasonings', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 38.00, 10.00, 10.00, ' Kn00001', 'Knorr', NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:19'),
(689, 'FMD174320', 'Knorr Sweet Corn Veg (45 gm)', 'Basic description of Soup, Sauce & Seasonings 23', '23', 'Soup, Sauce & Seasonings', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 38.00, 10.00, 10.00, ' Kn00001', 'Knorr', NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:19'),
(690, 'FMD174321', 'Sweet & Spicy (500 gm)', 'Basic description of Soup, Sauce & Seasonings 24', '23', 'Soup, Sauce & Seasonings', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 158.00, 10.00, 10.00, ' Ki00001', 'Kissan', NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:19'),
(691, 'FMD176387', 'Chabaa Orange Juice (230 ml)', 'Basic description of Beverages 86', '4', 'Beverages', '6', 'Ready to Drink', '0', 0.00, 0.00, 70.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:19'),
(692, 'FMD174322', 'Chilli Tomato (500 gm)', 'Basic description of Soup, Sauce & Seasonings 25', '23', 'Soup, Sauce & Seasonings', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 158.00, 10.00, 10.00, ' Ki00001', 'Kissan', NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:19'),
(693, 'FMD174323', 'Fresh Tomato (1 kg)', 'Basic description of Soup, Sauce & Seasonings 26', '23', 'Soup, Sauce & Seasonings', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 214.00, 10.00, 10.00, ' Ki00001', 'Kissan', NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:19'),
(694, 'FMD174324', 'Knorr Hot & Sour (44 gm)', 'Basic description of Soup, Sauce & Seasonings 27', '23', 'Soup, Sauce & Seasonings', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 38.00, 10.00, 10.00, ' Kn00001', 'Knorr', NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:19'),
(695, 'FMD174325', 'Knorr Mexican (52 gm)', 'Basic description of Soup, Sauce & Seasonings 28', '23', 'Soup, Sauce & Seasonings', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 38.00, 10.00, 10.00, ' Kn00001', 'Knorr', NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:19'),
(696, 'FMD174327', 'Knorr Mushroom Soup (48 gm)', 'Basic description of Soup, Sauce & Seasonings 29', '23', 'Soup, Sauce & Seasonings', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 38.00, 10.00, 10.00, ' Kn00001', 'Knorr', NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:19'),
(697, 'FMD174328', 'Knorr Sweet Corn Chicken (45 gm)', 'Basic description of Soup, Sauce & Seasonings 30', '23', 'Soup, Sauce & Seasonings', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 38.00, 10.00, 10.00, ' Kn00001', 'Knorr', NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:19'),
(698, 'FMD174330', 'Kissan Chilli Tomato (500 gm)', 'Basic description of Soup, Sauce & Seasonings 32', '23', 'Soup, Sauce & Seasonings', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 158.00, 10.00, 10.00, ' Ki00001', 'Kissan', NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:19'),
(699, 'FMD174331', 'Kissan Fresh Tomato (1 kg)', 'Basic description of Soup, Sauce & Seasonings 33', '23', 'Soup, Sauce & Seasonings', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 214.00, 10.00, 10.00, ' Ki00001', 'Kissan', NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:19'),
(700, 'FMD174332', 'Kissan Sweet & Spicy (500 gm)', 'Basic description of Soup, Sauce & Seasonings 34', '23', 'Soup, Sauce & Seasonings', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 158.00, 10.00, 10.00, ' Ki00001', 'Kissan', NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:19'),
(701, 'FMD174333', 'Kissan Sweet & Spicy (1 kg)', 'Basic description of Soup, Sauce & Seasonings 35', '23', 'Soup, Sauce & Seasonings', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 246.00, 10.00, 10.00, ' Ki00001', 'Kissan', NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:19'),
(702, 'FMD176388', 'Chabaa Pomegranate Juice  (230 ml)', 'Basic description of Beverages 87', '4', 'Beverages', '6', 'Ready to Drink', '0', 0.00, 0.00, 70.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:19'),
(703, 'FMD174284', 'Tabasco Sauce (60 ml)', 'Basic description of Soup, Sauce & Seasonings 36', '23', 'Soup, Sauce & Seasonings', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 290.00, 10.00, 10.00, ' Ta00001', 'Tabasco', NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:19'),
(704, 'FMD174285', 'Thai Oyster Sauce  (600 ml)', 'Basic description of Soup, Sauce & Seasonings 37', '23', 'Soup, Sauce & Seasonings', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 640.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:19'),
(705, 'FMD174286', 'Woh Hup Premium Light Soy Sauce (640 ml)', 'Basic description of Soup, Sauce & Seasonings 38', '23', 'Soup, Sauce & Seasonings', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 365.00, 10.00, 10.00, ' WO00002', 'Woh Hup', NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:19'),
(706, 'FMD174280', 'Kikkoman Soy Sauce (1 ltr)', 'Basic description of Soup, Sauce & Seasonings 39', '23', 'Soup, Sauce & Seasonings', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 820.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:19'),
(707, 'FMD174281', 'Safa Tomato Paste (70 gm)', 'Basic description of Soup, Sauce & Seasonings 40', '23', 'Soup, Sauce & Seasonings', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 60.00, 10.00, 10.00, ' Sa00003', 'Safa', NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:19'),
(708, 'FMD174270', 'Fragata Nacho Sliced Jalapenos Hot Pepper (350 gm)', 'Basic description of Soup, Sauce & Seasonings 42', '23', 'Soup, Sauce & Seasonings', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 350.00, 10.00, 10.00, ' Fr00001', 'Fragata', NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:19'),
(709, 'FMD202476', 'American Garden Garlic & Herbs Pasta Sauce (397 gms)', 'Basic description of Soup, Sauce & Seasonings 43', '23', 'Soup, Sauce & Seasonings', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 315.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:19'),
(710, 'FMD197265', 'American Garden U.S Mustard (397 gm)', 'Basic description of Soup, Sauce & Seasonings 44', '23', 'Soup, Sauce & Seasonings', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 415.00, 10.00, 10.00, ' Am00001', 'American Garden', NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:19'),
(711, 'FMD202098', 'Maggi Ketchup (1 kg)', 'Basic description of Soup, Sauce & Seasonings 45', '23', 'Soup, Sauce & Seasonings', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 420.00, 10.00, 10.00, ' Ma00001', 'Maggi', NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:19'),
(712, 'FMD215897', 'Maggi Hot & Sweet Ketchup (200 gms)', 'Basic description of Soup, Sauce & Seasonings 46', '23', 'Soup, Sauce & Seasonings', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 125.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:19'),
(713, 'FMD174214', 'Krugers Lemon Ice Tea (400 gms)', 'Basic description of Beverages 88', '4', 'Beverages', '6', 'Ready to Drink', '0', 0.00, 0.00, 540.00, 10.00, 10.00, ' Kr00001', 'Kruger', NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:19'),
(714, 'FMD215898', 'Maggi Rich Tomato Ketchup (200 gms)', 'Basic description of Soup, Sauce & Seasonings 47', '23', 'Soup, Sauce & Seasonings', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 120.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:19'),
(715, 'FMD216968', 'American Garden Arrabiata Pasta Sauce (397 gms)', 'Basic description of Soup, Sauce & Seasonings 48', '23', 'Soup, Sauce & Seasonings', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 315.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:19'),
(716, 'FMD221846', 'Knorr Chicken Delite 42g', 'Basic description of Soup, Sauce & Seasonings 49', '23', 'Soup, Sauce & Seasonings', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 78.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:19'),
(717, 'FMD221847', 'Knorr Chinese Chilli Gravy Mix 51g', 'Basic description of Soup, Sauce & Seasonings 50', '23', 'Soup, Sauce & Seasonings', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 70.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:19'),
(718, 'FMD221848', 'Knorr Chinese Manchurian Gravy Mix 55g', 'Basic description of Soup, Sauce & Seasonings 51', '23', 'Soup, Sauce & Seasonings', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 70.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:19'),
(719, 'FMD221849', 'Knorr Italian Mushroom Premium 48g', 'Basic description of Soup, Sauce & Seasonings 52', '23', 'Soup, Sauce & Seasonings', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 95.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:19'),
(720, 'FMD221850', 'Knorr Mix Veg Soup 45g', 'Basic description of Soup, Sauce & Seasonings 53', '23', 'Soup, Sauce & Seasonings', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 80.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:19'),
(721, 'FMD221851', 'Knorr Shanghai Hot & Sour Chicken Soup 38g', 'Basic description of Soup, Sauce & Seasonings 54', '23', 'Soup, Sauce & Seasonings', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 102.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:19'),
(722, 'FMD221852', 'Knorr Sweet Corn Chicken Soup 42g', 'Basic description of Soup, Sauce & Seasonings 55', '23', 'Soup, Sauce & Seasonings', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 78.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:19'),
(723, 'FMD221853', 'Knorr Thick Tomato Soup 53g', 'Basic description of Soup, Sauce & Seasonings 56', '23', 'Soup, Sauce & Seasonings', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 80.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:19'),
(724, 'FMD174215', 'Krugers Peach Ice Tea (400 gms)', 'Basic description of Beverages 89', '4', 'Beverages', '6', 'Ready to Drink', '0', 0.00, 0.00, 540.00, 10.00, 10.00, ' Kr00001', 'Kruger', NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:19'),
(725, 'FMD177419', 'Flax Seed (500 gm)', 'Basic description of Soup, Sauce & Seasonings 57', '23', 'Soup, Sauce & Seasonings', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 265.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:20'),
(726, 'FMD189342', 'Cheesy Dip Jalapeno (100gm)- Cornitos', 'Basic description of Soup, Sauce & Seasonings 58', '23', 'Soup, Sauce & Seasonings', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 190.00, 10.00, 10.00, ' Co00001', 'Cornitos', NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:20'),
(727, 'FMD189343', 'Chunky Salsa Dip Hot (330 gm)- Cornitos', 'Basic description of Soup, Sauce & Seasonings 59', '23', 'Soup, Sauce & Seasonings', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 432.00, 10.00, 10.00, ' Co00001', 'Cornitos', NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:20'),
(728, 'FMD189345', 'Chunky Salsa Dip Mild (330 gm)- Cornitos', 'Basic description of Soup, Sauce & Seasonings 60', '23', 'Soup, Sauce & Seasonings', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 432.00, 10.00, 10.00, ' Co00001', 'Cornitos', NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:20'),
(729, 'FMD188323', 'Pumpkin Seeds (500 gm)', 'Basic description of Soup, Sauce & Seasonings 61', '23', 'Soup, Sauce & Seasonings', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 715.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:20'),
(730, 'FMD191077', 'Fragata Capers (99 gm)', 'Basic description of Soup, Sauce & Seasonings 62', '23', 'Soup, Sauce & Seasonings', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 240.00, 10.00, 10.00, ' Fr00001', 'Fragata', NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:20'),
(731, 'FMD189353', 'Figaro Black Olives (340 gm)', 'Basic description of Soup, Sauce & Seasonings 63', '23', 'Soup, Sauce & Seasonings', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 270.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:20'),
(732, 'FMD189354', 'Figaro Green Olives (340 gm)', 'Basic description of Soup, Sauce & Seasonings 64', '23', 'Soup, Sauce & Seasonings', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 270.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:20'),
(733, 'FMD383705', 'Dragon Soy Sauce (750 ml)', 'Basic description of Soup, Sauce & Seasonings 65', '23', 'Soup, Sauce & Seasonings', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 100.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:20'),
(734, 'FMD317080', 'Roza Sweet Chilli Sauce (320 gm)', 'Basic description of Soup, Sauce & Seasonings 66', '23', 'Soup, Sauce & Seasonings', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 255.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:20'),
(735, 'FMD174313', 'Rasna Fruit Plus- Mango (1 kg)', 'Basic description of Beverages 90', '4', 'Beverages', '7', 'Juice Powder', '0', 0.00, 0.00, 460.00, 10.00, 10.00, ' Ra00001', 'Rasna', NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:20'),
(736, 'FMD349795', 'Dragon Mayonnaise (900 gm)', 'Basic description of Soup, Sauce & Seasonings 67', '23', 'Soup, Sauce & Seasonings', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 440.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:20'),
(737, 'FMD227715', 'American Garden Three Cheese Pasta Sauce (397 gms)', 'Basic description of Soup, Sauce & Seasonings 68', '23', 'Soup, Sauce & Seasonings', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 315.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:20'),
(738, 'FMD246209', 'Maggi Tomato Ketchup (200 gm)', 'Basic description of Soup, Sauce & Seasonings 69', '23', 'Soup, Sauce & Seasonings', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 120.00, 10.00, 10.00, ' Ma00001', 'Maggi', NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:20'),
(739, 'FMD283471', 'Roza Sweet Chilli Sauce 320gm', 'Basic description of Soup, Sauce & Seasonings 70', '23', 'Soup, Sauce & Seasonings', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 180.00, 10.00, 10.00, ' Te00001', 'Test Brand 1', NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:20'),
(740, 'FMD283486', 'American Garden Msutard Paste 227 gms', 'Basic description of Soup, Sauce & Seasonings 71', '23', 'Soup, Sauce & Seasonings', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 265.00, 10.00, 10.00, ' Am00001', 'American Garden', NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:20'),
(741, 'FMD248126', 'Safa Tomato Paste (400 gm)', 'Basic description of Soup, Sauce & Seasonings 72', '23', 'Soup, Sauce & Seasonings', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 360.00, 10.00, 10.00, ' Sa00003', 'Safa', NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:20'),
(742, 'FMD253841', 'American Garden Mushroom Pasta Sauce (397 gms)', 'Basic description of Soup, Sauce & Seasonings 73', '23', 'Soup, Sauce & Seasonings', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 315.00, 10.00, 10.00, ' Am00001', 'American Garden', NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:20'),
(743, 'FMD302491', 'Arrabiata Pasta Sauce', 'Basic description of Soup, Sauce & Seasonings 74', '23', 'Soup, Sauce & Seasonings', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 315.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:20'),
(744, 'FMD300119', 'Roza Sweet Chilli Sauce (730 gm)', 'Basic description of Soup, Sauce & Seasonings 75', '23', 'Soup, Sauce & Seasonings', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 445.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:20'),
(745, 'FMD174448', 'Nestle Kitkat 38.5 gm 6pcs', 'Basic description of Sweets & Confectionery 1', '24', 'Sweets & Confectionery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 50.00, 10.00, 10.00, ' Ne00003', 'Nestle', NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:20'),
(746, 'FMD174314', 'Rasna Fruit Plus- Orange  (400 gm)', 'Basic description of Beverages 91', '4', 'Beverages', '7', 'Juice Powder', '0', 0.00, 0.00, 170.00, 10.00, 10.00, ' Ra00001', 'Rasna', NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:20'),
(747, 'FMD174449', 'Nestle Kitkat Dessert Brownie Kube 50 gms', 'Basic description of Sweets & Confectionery 2', '24', 'Sweets & Confectionery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 110.00, 10.00, 10.00, ' Ne00003', 'Nestle', NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:20'),
(748, 'FMD174450', 'Nestle Kitkat Dessert Chocolate Pudding 50 gms', 'Basic description of Sweets & Confectionery 3', '24', 'Sweets & Confectionery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 100.00, 10.00, 10.00, ' Ne00003', 'Nestle', NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:20'),
(749, 'FMD174451', 'Nestle Kitkat Dessert Delight 50 gms', 'Basic description of Sweets & Confectionery 4', '24', 'Sweets & Confectionery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 110.00, 10.00, 10.00, ' Ne00003', 'Nestle', NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:20'),
(750, 'FMD174452', 'Nestle Kitkat Dessert Rich Choc Fdg 150 gms', 'Basic description of Sweets & Confectionery 5', '24', 'Sweets & Confectionery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 310.00, 10.00, 10.00, ' Ne00003', 'Nestle', NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:20'),
(751, 'FMD174453', 'Nestle Kitkat Family Pack 72 gms', 'Basic description of Sweets & Confectionery 6', '24', 'Sweets & Confectionery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 110.00, 10.00, 10.00, ' Ne00003', 'Nestle', NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:20'),
(752, 'FMD174454', 'Munch Nuts 32 gms', 'Basic description of Sweets & Confectionery 7', '24', 'Sweets & Confectionery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 30.00, 10.00, 10.00, ' Ne00003', 'Nestle', NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:20'),
(753, 'FMD174455', 'Nestle Classic 34 gms', 'Basic description of Sweets & Confectionery 8', '24', 'Sweets & Confectionery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 30.00, 10.00, 10.00, ' Ne00003', 'Nestle', NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:20'),
(754, 'FMD205066', 'Limedo Compound Chocolate (400 gms)', 'Basic description of Sweets & Confectionery 9', '24', 'Sweets & Confectionery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 390.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:20'),
(755, 'FMD192285', 'Tafero Derby (55 pcs)', 'Basic description of Sweets & Confectionery 10', '24', 'Sweets & Confectionery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 540.00, 10.00, 10.00, ' De00002', 'Derby', NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:20'),
(756, 'FMD193705', 'Choco Pie (Pack of 6)', 'Basic description of Sweets & Confectionery 11', '24', 'Sweets & Confectionery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 185.00, 10.00, 10.00, ' Or00001', 'Orion', NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:20'),
(757, 'FMD174315', 'Rasna Fruit Plus- Orange (1 kg)', 'Basic description of Beverages 92', '4', 'Beverages', '7', 'Juice Powder', '0', 0.00, 0.00, 460.00, 10.00, 10.00, ' Ra00001', 'Rasna', NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:20'),
(758, 'FMD193706', 'Choco Pie Dark (Pack of 6)', 'Basic description of Sweets & Confectionery 12', '24', 'Sweets & Confectionery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 215.00, 10.00, 10.00, ' Or00001', 'Orion', NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:20'),
(759, 'FMD193707', 'Custard Soft Cake (Pack of 6)', 'Basic description of Sweets & Confectionery 13', '24', 'Sweets & Confectionery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 265.00, 10.00, 10.00, ' Or00001', 'Orion', NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:20'),
(760, 'FMD215870', 'Orion Custard Cake', 'Basic description of Sweets & Confectionery 15', '24', 'Sweets & Confectionery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 265.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:20'),
(761, 'FMD214605', 'Dairy Milk (130 gms)', 'Basic description of Sweets & Confectionery 16', '24', 'Sweets & Confectionery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 150.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:20'),
(762, 'FMD215863', 'Cadbury 5 Star (40 gm)', 'Basic description of Sweets & Confectionery 17', '24', 'Sweets & Confectionery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 102.00, 10.00, 10.00, ' Ne00003', 'Nestle', NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:21'),
(763, 'FMD215864', 'Dairy Milk Family Pack (130 gm)', 'Basic description of Sweets & Confectionery 18', '24', 'Sweets & Confectionery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 150.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:21'),
(764, 'FMD215865', 'Dairy Milk Silk Fruit & Nut (55 gm)', 'Basic description of Sweets & Confectionery 19', '24', 'Sweets & Confectionery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 102.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:21'),
(765, 'FMD215866', 'Dairy Milk Silk Roast Almond (55 gm)', 'Basic description of Sweets & Confectionery 20', '24', 'Sweets & Confectionery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 118.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:21'),
(766, 'FMD215867', 'Dairy Milk Chocolate (55 gm)', 'Basic description of Sweets & Confectionery 21', '24', 'Sweets & Confectionery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 60.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:21'),
(767, 'FMD215868', 'Dairy Milk Silk Chocolate (55 gm)', 'Basic description of Sweets & Confectionery 22', '24', 'Sweets & Confectionery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 102.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:21'),
(768, 'FMD174316', 'Rasna Fruit Plus- Pineapple (400 gm)', 'Basic description of Beverages 93', '4', 'Beverages', '7', 'Juice Powder', '0', 0.00, 0.00, 170.00, 10.00, 10.00, ' Ra00001', 'Rasna', NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:21'),
(769, 'FMD215890', 'Nestle Bar One (38 gms)', 'Basic description of Sweets & Confectionery 23', '24', 'Sweets & Confectionery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 30.00, 10.00, 10.00, ' Ne00003', 'Nestle', NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:21'),
(770, 'FMD215891', 'Nestle KitKat 40% Extra (18 gms)', 'Basic description of Sweets & Confectionery 24', '24', 'Sweets & Confectionery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 10.00, 10.00, 10.00, ' Ne00003', 'Nestle', NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:21'),
(771, 'FMD215892', 'Nestle KitKat Dessert Delight Tempting Truffle (50 gms)', 'Basic description of Sweets & Confectionery 25', '24', 'Sweets & Confectionery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 110.00, 10.00, 10.00, ' Ne00003', 'Nestle', NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:21');
INSERT INTO `products` (`id`, `product_code`, `product_name`, `product_description`, `category_id`, `category_name`, `subcategory_id`, `subcategory_name`, `delivery_target_days`, `discount`, `actual_price`, `sell_price`, `available_quantity`, `stock_quantity`, `brand_id`, `brand_name`, `primary_image`, `created_at`, `updated_at`) VALUES
(772, 'FMD215893', 'Nestle KitKat Share & Snap (55 gms)', 'Basic description of Sweets & Confectionery 26', '24', 'Sweets & Confectionery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 70.00, 10.00, 10.00, ' Ne00003', 'Nestle', NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:21'),
(773, 'FMD215894', 'Nestle Milky Bar 42 gms', 'Basic description of Sweets & Confectionery 27', '24', 'Sweets & Confectionery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 70.00, 10.00, 10.00, ' Ne00003', 'Nestle', NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:21'),
(774, 'FMD180707', 'Junge Pustakari (200 gm)', 'Basic description of Sweets & Confectionery 28', '24', 'Sweets & Confectionery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 120.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:21'),
(775, 'FMD356400', 'Lindt Excellence Sea Salt (100 gm)', 'Basic description of Sweets & Confectionery 29', '24', 'Sweets & Confectionery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 630.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:21'),
(776, 'FMD364073', 'Lindt Excellence 99%  Dark Chocolate Bar 100g', 'Basic description of Sweets & Confectionery 30', '24', 'Sweets & Confectionery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 630.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:21'),
(777, 'FMD364074', 'EXC Sea Salt (100 Gms) - Lindt', 'Basic description of Sweets & Confectionery 31', '24', 'Sweets & Confectionery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 630.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:21'),
(778, 'FMD364075', 'Excellence Dark Orange Almond (100 gms) - Lindt', 'Basic description of Sweets & Confectionery 32', '24', 'Sweets & Confectionery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 630.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:21'),
(779, 'FMD199193', 'Almond Cookies', 'Bakery products are made from flour, offering carbohydrates, flavor, and energy 1', '2', 'Bakery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 150.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:21'),
(780, 'FMD187492', 'Rasna Fruit Plus- Mango Flavor (400 gm)', 'Basic description of Beverages 94', '4', 'Beverages', '7', 'Juice Powder', '0', 0.00, 0.00, 170.00, 10.00, 10.00, ' Ra00001', 'Rasna', NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:21'),
(781, 'FMD364076', 'Les Grandes Milk Hazelnut (150 gms) - Lindt', 'Basic description of Sweets & Confectionery 33', '24', 'Sweets & Confectionery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 970.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:21'),
(782, 'FMD364081', 'Excellence Milk (100 gms) - Lindt', 'Basic description of Sweets & Confectionery 34', '24', 'Sweets & Confectionery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 630.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:21'),
(783, 'FMD364082', 'Excellence Dark Chilli (100 gms) - Lindt', 'Basic description of Sweets & Confectionery 35', '24', 'Sweets & Confectionery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 630.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:21'),
(784, 'FMD364087', 'Lindor Cornet - Assorted (200 gms) - Lindt', 'Basic description of Sweets & Confectionery 36', '24', 'Sweets & Confectionery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 630.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:21'),
(785, 'FMD253693', 'Desert Delight Brownie Cubes', 'Basic description of Sweets & Confectionery 37', '24', 'Sweets & Confectionery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 110.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:21'),
(786, 'FMD281816', 'Nestle Classic Chocolate (34 gm)', 'Basic description of Sweets & Confectionery 38', '24', 'Sweets & Confectionery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 30.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:21'),
(787, 'FMD293817', 'Kitkat Milk Cocoa', 'Basic description of Sweets & Confectionery 39', '24', 'Sweets & Confectionery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 50.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:21'),
(788, 'FMD284464', 'Hershey\'s Baking Milk Chocolate Chips 200 g', 'Basic description of Sweets & Confectionery 40', '24', 'Sweets & Confectionery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 780.00, 10.00, 10.00, ' He00001', 'Hersheys', NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:21'),
(789, 'FMD284465', 'Hershey\'s Cookies n Creme Chocolate Bar 40 g', 'Basic description of Sweets & Confectionery 41', '24', 'Sweets & Confectionery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 140.00, 10.00, 10.00, ' He00001', 'Hersheys', NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:21'),
(790, 'FMD284466', 'Hershey\'s Kisses Cookies n Creme Chocolate 100 g', 'Basic description of Sweets & Confectionery 42', '24', 'Sweets & Confectionery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 515.00, 10.00, 10.00, ' He00001', 'Hersheys', NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:21'),
(791, 'FMD183483', 'Dabur Glucose (1.1 kg)', 'Basic description of Beverages 95', '4', 'Beverages', '7', 'Juice Powder', '0', 0.00, 0.00, 290.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:21'),
(792, 'FMD284467', 'Hershey\'s Kisses Cookies n\' Creme, 146g', 'Basic description of Sweets & Confectionery 43', '24', 'Sweets & Confectionery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 689.00, 10.00, 10.00, ' He00001', 'Hersheys', NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:21'),
(793, 'FMD284468', 'Hershey\'s Kisses Creamy Milk Chocolate, 146g', 'Basic description of Sweets & Confectionery 44', '24', 'Sweets & Confectionery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 689.00, 10.00, 10.00, ' He00001', 'Hersheys', NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:21'),
(794, 'FMD284469', 'Hersheys Kisses Milk Chocolate 100 g', 'Basic description of Sweets & Confectionery 45', '24', 'Sweets & Confectionery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 515.00, 10.00, 10.00, ' He00001', 'Hersheys', NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:21'),
(795, 'FMD284470', 'Hershey\'s Milk Chocolate Extra Creamy, 50g', 'Basic description of Sweets & Confectionery 46', '24', 'Sweets & Confectionery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 590.00, 10.00, 10.00, ' He00001', 'Hersheys', NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:21'),
(796, 'FMD290308', 'Lindt Gold Milk Hazelnut Bar 300g', 'Basic description of Sweets & Confectionery 47', '24', 'Sweets & Confectionery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 1190.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:48', '2024-09-15 23:39:21'),
(797, 'FMD290309', 'Lindt Lindor Irresistibly Smooth White Chocolate, 100g', 'Basic description of Sweets & Confectionery 48', '24', 'Sweets & Confectionery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 585.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:21'),
(798, 'FMD290310', 'Lindt Lindor Milk Cornet 200 gms', 'Basic description of Sweets & Confectionery 49', '24', 'Sweets & Confectionery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 1440.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:21'),
(799, 'FMD290311', 'Lindt Lindor Singles Bar Extra Dark 100G', 'Basic description of Sweets & Confectionery 50', '24', 'Sweets & Confectionery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 585.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:21'),
(800, 'FMD290312', 'Lindt Lindor Singles Hazelnut 100 gms', 'Basic description of Sweets & Confectionery 51', '24', 'Sweets & Confectionery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 585.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:21'),
(801, 'FMD290313', 'Lindt Lindor Singles Milk Chocolate 100 gms', 'Basic description of Sweets & Confectionery 52', '24', 'Sweets & Confectionery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 515.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:21'),
(802, 'FMD183484', 'Dabur Glucose (500 gm)', 'Basic description of Beverages 96', '4', 'Beverages', '7', 'Juice Powder', '0', 0.00, 0.00, 165.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:21'),
(803, 'FMD290314', 'Lindt Lindor Stick Milk Chocolate 38 gms', 'Basic description of Sweets & Confectionery 53', '24', 'Sweets & Confectionery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 240.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:22'),
(804, 'FMD290315', 'Lindt Teddy Milk Chocolate 100g', 'Basic description of Sweets & Confectionery 54', '24', 'Sweets & Confectionery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 690.00, 10.00, 10.00, ' Te00001', 'Test Brand 1', NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:22'),
(805, 'FMD290316', 'Lindt Assorted Napolitains Carry Box 350gms', 'Basic description of Sweets & Confectionery 55', '24', 'Sweets & Confectionery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 2290.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:22'),
(806, 'FMD290317', 'Lindt Excellence 70% Mild Dark Chocolate Bar 100g', 'Basic description of Sweets & Confectionery 56', '24', 'Sweets & Confectionery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 530.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:22'),
(807, 'FMD290318', 'Lindt Les Grandes Dark Hazelnut 150gms', 'Basic description of Sweets & Confectionery 57', '24', 'Sweets & Confectionery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 840.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:22'),
(808, 'FMD290319', 'Lindt Les Grandes Milk Hazelnut 150 gms', 'Basic description of Sweets & Confectionery 58', '24', 'Sweets & Confectionery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 840.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:22'),
(809, 'FMD290320', 'Lindt les Grandes White almond 150gms', 'Basic description of Sweets & Confectionery 59', '24', 'Sweets & Confectionery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 840.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:22'),
(810, 'FMD290321', 'Lindt Lindor Cornet Milk 200gm', 'Basic description of Sweets & Confectionery 60', '24', 'Sweets & Confectionery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 1315.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:22'),
(811, 'FMD290322', 'Lindt Swiss Luxury Selection Box 145g', 'Basic description of Sweets & Confectionery 61', '24', 'Sweets & Confectionery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 1990.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:22'),
(812, 'FMD290411', 'Twix Caramel Cookie Bars 50gms (Pack of 2)', 'Basic description of Sweets & Confectionery 62', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 240.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:22'),
(813, 'FMD189247', 'Nestle Nido (900 gms)', 'Basic description of Beverages 97', '4', 'Beverages', '8', 'Milk Powder', '0', 0.00, 0.00, 1865.00, 10.00, 10.00, ' Ne00003', 'Nestle', NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:22'),
(814, 'FMD290442', 'Nestle Kitkat (38 gm)', 'Basic description of Sweets & Confectionery 63', '24', 'Sweets & Confectionery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 40.00, 10.00, 10.00, ' Ne00003', 'Nestle', NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:22'),
(815, 'FMD307777', 'Lindt Excellence 78% Intense Dark Chocolate Bar 100g', 'Basic description of Sweets & Confectionery 64', '24', 'Sweets & Confectionery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 630.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:22'),
(816, 'FMD307841', 'Lindt Excellence 70%  Dark Chocolate Bar 100g', 'Basic description of Sweets & Confectionery 65', '24', 'Sweets & Confectionery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 630.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:22'),
(817, 'FMD298461', 'Nestle Kitkat (38.5gm)', 'Basic description of Sweets & Confectionery 66', '24', 'Sweets & Confectionery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 50.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:22'),
(818, 'FMD298462', 'Nestle Kitkat Dessert Divine Choco (50 gm)', 'Basic description of Sweets & Confectionery 67', '24', 'Sweets & Confectionery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 110.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:22'),
(819, 'FMD192186', 'Horlicks Chocolate (500gm)', 'Basic description of Beverages 98', '4', 'Beverages', '8', 'Milk Powder', '0', 0.00, 0.00, 358.00, 10.00, 10.00, ' Ho00001', 'Horlicks', NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:22'),
(820, 'FMD192205', 'Horlicks Classic Malt (1 kg) Jar with FREE Knorr Tomato Soup', 'Basic description of Beverages 99', '4', 'Beverages', '8', 'Milk Powder', '0', 0.00, 0.00, 742.00, 10.00, 10.00, ' Ho00001', 'Horlicks', NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:22'),
(821, 'FMD192206', 'Horlicks Classic Malt (2 kgs) Jar with 2 FREE Knorr Tomato Soup', 'Basic description of Beverages 100', '4', 'Beverages', '8', 'Milk Powder', '0', 0.00, 0.00, 1338.00, 10.00, 10.00, ' Ho00001', 'Horlicks', NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:22'),
(822, 'FMD192207', 'Horlicks Classic Malt (500gm)', 'Basic description of Beverages 101', '4', 'Beverages', '8', 'Milk Powder', '0', 0.00, 0.00, 390.00, 10.00, 10.00, ' Ho00001', 'Horlicks', NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:22'),
(823, 'FMD192208', 'Junior Horlicks Vanilla Flavor (500g) with Pears Soap FREE', 'Basic description of Beverages 102', '4', 'Beverages', '8', 'Milk Powder', '0', 0.00, 0.00, 479.00, 10.00, 10.00, ' Ho00001', 'Horlicks', NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:22'),
(824, 'FMD192209', 'Mother Horlicks Vanilla (500g) with Dove Baby Soap FREE', 'Basic description of Beverages 103', '4', 'Beverages', '8', 'Milk Powder', '0', 0.00, 0.00, 887.00, 10.00, 10.00, ' Ho00001', 'Horlicks', NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:22'),
(825, 'FMD199194', 'Banana Cake', 'Bakery products are made from flour, offering carbohydrates, flavor, and energy 2', '2', 'Bakery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 250.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:22'),
(826, 'FMD192210', 'Women\'s Plus Horlicks Caramel (400g)', 'Basic description of Beverages 104', '4', 'Beverages', '8', 'Milk Powder', '0', 0.00, 0.00, 518.00, 10.00, 10.00, ' Ho00001', 'Horlicks', NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:22'),
(827, 'FMD174337', 'Nestle Everyday Dairy Whitener (400 gm)', 'Basic description of Beverages 105', '4', 'Beverages', '8', 'Milk Powder', '0', 0.00, 0.00, 409.00, 10.00, 10.00, ' Ne00003', 'Nestle', NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:22'),
(828, 'FMD174338', 'Nestle Everyday Dairy Whitener (800 gm)', 'Basic description of Beverages 106', '4', 'Beverages', '8', 'Milk Powder', '0', 0.00, 0.00, 940.00, 10.00, 10.00, ' Ne00003', 'Nestle', NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:22'),
(829, 'FMD174312', 'Red Cow Full Cream Milk Powder (1 kg)', 'Basic description of Beverages 107', '4', 'Beverages', '8', 'Milk Powder', '0', 0.00, 0.00, 2115.00, 10.00, 10.00, ' Re00001', 'Red Cow', NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:22'),
(830, 'FMD298146', 'All Natural Crunchy (1 kg) (Peanut Butter)', 'Basic description of Breakfast 1', '5', 'Breakfast', '9', 'Spreads', '0', 0.00, 0.00, 750.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:22'),
(831, 'FMD289884', 'Pintola Choco Crunchy Peanut Butter (350 gm)', 'Basic description of Breakfast 2', '5', 'Breakfast', '9', 'Spreads', '0', 0.00, 0.00, 315.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:22'),
(832, 'FMD283436', 'Druk Mixed Fruit Jam', 'Basic description of Breakfast 3', '5', 'Breakfast', '9', 'Spreads', '0', 0.00, 0.00, 185.00, 10.00, 10.00, ' Te00001', 'Test Brand 1', NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:22'),
(833, 'FMD249501', 'Mayonnaise Real (887 ml)', 'Basic description of Breakfast 4', '5', 'Breakfast', '9', 'Spreads', '0', 0.00, 0.00, 950.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:22'),
(834, 'FMD238064', 'Druk Mixed Fruit Jam (500 gm)', 'Basic description of Breakfast 5', '5', 'Breakfast', '9', 'Spreads', '0', 0.00, 0.00, 197.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:22'),
(835, 'FMD309499', 'Orient Garden (1 kg) Mayonnaise', 'Basic description of Breakfast 6', '5', 'Breakfast', '9', 'Spreads', '0', 0.00, 0.00, 470.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:22'),
(836, 'FMD199195', 'Butter Cookies', 'Bakery products are made from flour, offering carbohydrates, flavor, and energy 3', '2', 'Bakery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 150.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:22'),
(837, 'FMD189339', 'Hot Sauce (355 ml)- American Garden', 'Basic description of Breakfast 7', '5', 'Breakfast', '9', 'Spreads', '0', 0.00, 0.00, 270.00, 10.00, 10.00, ' Am00001', 'American Garden', NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:22'),
(838, 'FMD189340', 'Worcestershire Sauce (200 ml)- American Garden', 'Basic description of Breakfast 8', '5', 'Breakfast', '9', 'Spreads', '0', 0.00, 0.00, 245.00, 10.00, 10.00, ' Am00001', 'American Garden', NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:22'),
(839, 'FMD189233', 'Amul Butter (200 gm)', 'Basic description of Breakfast 9', '5', 'Breakfast', '9', 'Spreads', '0', 0.00, 0.00, 265.00, 10.00, 10.00, ' Am00002', 'Amul', NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:22'),
(840, 'FMD192229', 'Chabaa Pineapple Fruit Jam (240 gm)', 'Basic description of Breakfast 10', '5', 'Breakfast', '9', 'Spreads', '0', 0.00, 0.00, 190.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:22'),
(841, 'FMD192230', 'Chabaa Mixed Berry Fruit Jam (240 gm)', 'Basic description of Breakfast 11', '5', 'Breakfast', '9', 'Spreads', '0', 0.00, 0.00, 190.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:23'),
(842, 'FMD192231', 'Chabaa Strawberry Jam (240 gm)', 'Basic description of Breakfast 12', '5', 'Breakfast', '9', 'Spreads', '0', 0.00, 0.00, 190.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:23'),
(843, 'FMD202095', 'Amul Butter  (100 gm)', 'Basic description of Breakfast 13', '5', 'Breakfast', '9', 'Spreads', '0', 0.00, 0.00, 150.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:23'),
(844, 'FMD215637', 'Pintola All Natural Honey Creamy Peanut Butter 1Kg', 'Basic description of Breakfast 14', '5', 'Breakfast', '9', 'Spreads', '0', 0.00, 0.00, 650.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:23'),
(845, 'FMD215638', 'Pintola All Natural Honey Crunchy Peanut Butter 1Kg', 'Basic description of Breakfast 15', '5', 'Breakfast', '9', 'Spreads', '0', 0.00, 0.00, 650.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:23'),
(846, 'FMD215652', 'Pintola Choco Creamy Peanut Butter 1Kg', 'Basic description of Breakfast 16', '5', 'Breakfast', '9', 'Spreads', '0', 0.00, 0.00, 650.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:23'),
(847, 'FMD177364', 'Pampers Pants XXL 28s', 'Basic description of Baby Care 2', '1', 'Baby Care', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 1109.00, 10.00, 10.00, ' Pa00001', 'Pamper', NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:23'),
(848, 'FMD199196', 'Carrot Cake', 'Bakery products are made from flour, offering carbohydrates, flavor, and energy 4', '2', 'Bakery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 250.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:23'),
(849, 'FMD215653', 'Pintola Choco Crunchy Peanut Butter 1kg', 'Basic description of Breakfast 17', '5', 'Breakfast', '9', 'Spreads', '0', 0.00, 0.00, 650.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:23'),
(850, 'FMD215654', 'Pintola Classic Creamy Peanut Butter 1Kg', 'Basic description of Breakfast 18', '5', 'Breakfast', '9', 'Spreads', '0', 0.00, 0.00, 565.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:23'),
(851, 'FMD215655', 'Pintola Classic Crunchy Peanut Butter 1Kg', 'Basic description of Breakfast 19', '5', 'Breakfast', '9', 'Spreads', '0', 0.00, 0.00, 565.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:23'),
(852, 'FMD218621', 'White Wouee Butter (100 gm)', 'Basic description of Breakfast 20', '5', 'Breakfast', '9', 'Spreads', '0', 0.00, 0.00, 130.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:23'),
(853, 'FMD174244', 'Syrup Chocolate (680 gm)- American Garden', 'Basic description of Breakfast 21', '5', 'Breakfast', '9', 'Spreads', '0', 0.00, 0.00, 720.00, 10.00, 10.00, ' Am00001', 'American Garden', NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:23'),
(854, 'FMD174276', 'Hersey\'s Syrup (623 gm)', 'Basic description of Breakfast 22', '5', 'Breakfast', '9', 'Spreads', '0', 0.00, 0.00, 450.00, 10.00, 10.00, ' He00001', 'Hersheys', NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:23'),
(855, 'FMD174326', 'Kissan Mixed Fruit Jam (500 gm)', 'Basic description of Breakfast 23', '5', 'Breakfast', '9', 'Spreads', '0', 0.00, 0.00, 230.00, 10.00, 10.00, ' Ki00001', 'Kissan', NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:23'),
(856, 'FMD174237', 'Sandwich Spread US Style (237 ml)- American Garden', 'Basic description of Breakfast 24', '5', 'Breakfast', '9', 'Spreads', '0', 0.00, 0.00, 440.00, 10.00, 10.00, ' Am00001', 'American Garden', NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:23'),
(857, 'FMD174234', 'Mayonnaise Real (473 ml)- American Garden', 'Basic description of Breakfast 25', '5', 'Breakfast', '9', 'Spreads', '0', 0.00, 0.00, 500.00, 10.00, 10.00, ' Am00001', 'American Garden', NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:23'),
(858, 'FMD174235', 'Mayonnaise Real (887 ml)- American Garden', 'Basic description of Breakfast 26', '5', 'Breakfast', '9', 'Spreads', '0', 0.00, 0.00, 950.00, 10.00, 10.00, ' Am00001', 'American Garden', NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:23'),
(859, 'FMD199197', 'Cashewnut Macoroni', 'Bakery products are made from flour, offering carbohydrates, flavor, and energy 5', '2', 'Bakery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 150.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:23'),
(860, 'FMD174241', 'Syrup Pancake , 2% Maple (710 ml)- American Garden', 'Basic description of Breakfast 27', '5', 'Breakfast', '9', 'Spreads', '0', 0.00, 0.00, 720.00, 10.00, 10.00, ' Am00001', 'American Garden', NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:23'),
(861, 'FMD174396', 'Amul Plain Cheese Spread', 'Basic description of Breakfast 28', '5', 'Breakfast', '9', 'Spreads', '0', 0.00, 0.00, 170.00, 10.00, 10.00, ' Am00002', 'Amul', NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:23'),
(862, 'FMD174397', 'Bhanbhori Peanut Butter Creamy (340 gm)', 'Basic description of Breakfast 29', '5', 'Breakfast', '9', 'Spreads', '0', 0.00, 0.00, 182.00, 10.00, 10.00, ' Bh00001', 'Bhanbhori', NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:23'),
(863, 'FMD174398', 'Bhanbhori Peanut Butter Crunchy (340 gm)', 'Basic description of Breakfast 30', '5', 'Breakfast', '9', 'Spreads', '0', 0.00, 0.00, 182.00, 10.00, 10.00, ' Bh00001', 'Bhanbhori', NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:23'),
(864, 'FMD176491', 'Chabaa Mixed Fruit Jam (240 gms)', 'Basic description of Breakfast 31', '5', 'Breakfast', '9', 'Spreads', '0', 0.00, 0.00, 190.00, 10.00, 10.00, ' Co00001', 'Cornitos', NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:23'),
(865, 'FMD176492', 'Pintola All Natural Peanut Butter Creamy (1 kg)', 'Basic description of Breakfast 32', '5', 'Breakfast', '9', 'Spreads', '0', 0.00, 0.00, 685.00, 10.00, 10.00, ' Pi00001', 'Pintola', NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:23'),
(866, 'FMD176493', 'Pintola All Natural Peanut Butter Creamy (350 gm)', 'Basic description of Breakfast 33', '5', 'Breakfast', '9', 'Spreads', '0', 0.00, 0.00, 270.00, 10.00, 10.00, ' Pi00001', 'Pintola', NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:23'),
(867, 'FMD176494', 'Pintola All Natural Peanut Butter Crunchy (1 kg)', 'Basic description of Breakfast 34', '5', 'Breakfast', '9', 'Spreads', '0', 0.00, 0.00, 685.00, 10.00, 10.00, ' Pi00001', 'Pintola', NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:23'),
(868, 'FMD176495', 'Pintola All Natural Peanut Butter Crunchy (350 gm)', 'Basic description of Breakfast 35', '5', 'Breakfast', '9', 'Spreads', '0', 0.00, 0.00, 270.00, 10.00, 10.00, ' Pi00001', 'Pintola', NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:23'),
(869, 'FMD176496', 'Pintola Peanut Butter Classic Creamy (350 gm)', 'Basic description of Breakfast 36', '5', 'Breakfast', '9', 'Spreads', '0', 0.00, 0.00, 200.00, 10.00, 10.00, ' Pi00001', 'Pintola', NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:23'),
(870, 'FMD199198', 'Cheese Stick', 'Bakery products are made from flour, offering carbohydrates, flavor, and energy 6', '2', 'Bakery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 140.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:23'),
(871, 'FMD176497', 'Pintola Peanut Butter Classic Crunchy (350 gm)', 'Basic description of Breakfast 37', '5', 'Breakfast', '9', 'Spreads', '0', 0.00, 0.00, 200.00, 10.00, 10.00, ' Pi00001', 'Pintola', NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:23'),
(872, 'FMD176498', 'Pintola Peanut Butter Dark Chocolate Creamy (350 gm)', 'Basic description of Breakfast 38', '5', 'Breakfast', '9', 'Spreads', '0', 0.00, 0.00, 275.00, 10.00, 10.00, ' Pi00001', 'Pintola', NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:23'),
(873, 'FMD176499', 'Pintola Peanut Butter Dark Chocolate Crunchy (350 gm)', 'Basic description of Breakfast 39', '5', 'Breakfast', '9', 'Spreads', '0', 0.00, 0.00, 275.00, 10.00, 10.00, ' Pi00001', 'Pintola', NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:23'),
(874, 'FMD174221', 'Gaia Crunchy Muesli Nutty Delight (400 gm)', 'Basic description of Breakfast 40', '5', 'Breakfast', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 185.00, 10.00, 10.00, ' GA00001', 'GAIA', NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:23'),
(875, 'FMD174222', 'Gaia Crunchy Muesli Real Fruit (400 gm)', 'Basic description of Breakfast 41', '5', 'Breakfast', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 185.00, 10.00, 10.00, ' GA00001', 'GAIA', NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:23'),
(876, 'FMD174223', 'Gaia Oats Multi Grains(500 gm)', 'Basic description of Breakfast 42', '5', 'Breakfast', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 215.00, 10.00, 10.00, ' GA00001', 'GAIA', NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:23'),
(877, 'FMD174224', 'Gaia Oats Original (500 gm)', 'Basic description of Breakfast 43', '5', 'Breakfast', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 165.00, 10.00, 10.00, ' GA00001', 'GAIA', NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:23'),
(878, 'FMD174352', 'Nestlé CERELAC Stage 2, Wheat Apple Cherry (From 8 Months) (300gm)', 'Basic description of Breakfast 44', '5', 'Breakfast', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 406.00, 10.00, 10.00, ' Ne00003', 'Nestle', NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:23'),
(879, 'FMD174353', 'Nestlé CERELAC Stage 1, Wheat Apple (From 6 Months) (300 gm)', 'Basic description of Breakfast 45', '5', 'Breakfast', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 383.00, 10.00, 10.00, ' Ne00003', 'Nestle', NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:23'),
(880, 'FMD174354', 'Nestlé CERELAC Stage 1, Wheat (From 6 Months) (300 gm)', 'Basic description of Breakfast 46', '5', 'Breakfast', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 362.00, 10.00, 10.00, ' Ne00003', 'Nestle', NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:23'),
(881, 'FMD199199', 'Choco Chips Cookies', 'Bakery products are made from flour, offering carbohydrates, flavor, and energy 7', '2', 'Bakery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 160.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:23'),
(882, 'FMD174349', 'Nestlé CERELAC Stage 4, Multigrain & Fruits (From 12 Months) (300gm)', 'Basic description of Breakfast 47', '5', 'Breakfast', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 490.00, 10.00, 10.00, ' Ne00003', 'Nestle', NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:23'),
(883, 'FMD174350', 'Nestlé CERELAC Stage 3, Wheat-Rice Mixed Fruit (From 10 Months) (300gm)', 'Basic description of Breakfast 48', '5', 'Breakfast', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 422.00, 10.00, 10.00, ' Ne00003', 'Nestle', NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:24'),
(884, 'FMD174344', 'Nestlé CEREGROW Fortified Multigrain Cereal with Milk and Fruits (From 2 to 5 Years) (300 gm)', 'Basic description of Breakfast 49', '5', 'Breakfast', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 532.00, 10.00, 10.00, ' Ne00003', 'Nestle', NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:24'),
(885, 'FMD174345', 'Nestlé CERELAC Stage 5, 5Grains and Fruits (From 18 Months) (300 gm)', 'Basic description of Breakfast 50', '5', 'Breakfast', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 474.00, 10.00, 10.00, ' Ne00003', 'Nestle', NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:24'),
(886, 'FMD215625', 'Kellogg\'s All Bran Wheat Flakes 425 gm', 'Basic description of Breakfast 51', '5', 'Breakfast', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 350.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:24'),
(887, 'FMD215626', 'Kellogg\'s Cornflakes 475gm', 'Basic description of Breakfast 52', '5', 'Breakfast', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 340.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:24'),
(888, 'FMD215627', 'Kellogg\'s Extra Muesli Fruit & Nut 500 gm', 'Basic description of Breakfast 53', '5', 'Breakfast', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 520.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:24'),
(889, 'FMD215628', 'Kellogg\'s Extra Muesli Fruit Magic 500 gm', 'Basic description of Breakfast 54', '5', 'Breakfast', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 520.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:24'),
(890, 'FMD215629', 'Kellogg\'s Extra Muesli Nut Delight 750 gm', 'Basic description of Breakfast 55', '5', 'Breakfast', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 740.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:24'),
(891, 'FMD215630', 'Kellogg\'s Muesli No Added Sugar 1kg', 'Basic description of Breakfast 56', '5', 'Breakfast', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 1060.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:24'),
(892, 'FMD199200', 'Chocolate Cake (Medium)', 'Bakery products are made from flour, offering carbohydrates, flavor, and energy 8', '2', 'Bakery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 250.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:24'),
(893, 'FMD215631', 'Kellogg\'s Muesli No Added Sugar 500gm', 'Basic description of Breakfast 57', '5', 'Breakfast', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 520.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:24'),
(894, 'FMD215632', 'Britannia Good Day Butter 1000 gm', 'Basic description of Breakfast 58', '5', 'Breakfast', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 350.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:24'),
(895, 'FMD215633', 'Britannia Milk Rusk 620 gm', 'Basic description of Breakfast 59', '5', 'Breakfast', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 360.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:24'),
(896, 'FMD215634', 'Kellogg\'s Chocos 1.2 kg', 'Basic description of Breakfast 60', '5', 'Breakfast', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 845.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:24'),
(897, 'FMD215635', 'Kellogg\'s Chocos 715 gms', 'Basic description of Breakfast 61', '5', 'Breakfast', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 560.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:24'),
(898, 'FMD215636', 'Kellogg\'s Oats Refill 900 gms', 'Basic description of Breakfast 62', '5', 'Breakfast', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 440.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:24'),
(899, 'FMD216620', 'Kellogg\'s Cornflakes Honey and Almond (300 gm)', 'Basic description of Breakfast 63', '5', 'Breakfast', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 330.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:24'),
(900, 'FMD320787', 'Gaia Muesli Diet 1 kg (Bye one Get One Free)', 'Basic description of Breakfast 64', '5', 'Breakfast', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 950.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:24'),
(901, 'FMD320788', 'Gaia Muesli Diet 400 gm (Bye one Get One Free)', 'Basic description of Breakfast 65', '5', 'Breakfast', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 480.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:24'),
(902, 'FMD320789', 'Gaia Muesli Real Fruits 400 gm (Bye one Get one Free)', 'Basic description of Breakfast 66', '5', 'Breakfast', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 480.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:24'),
(903, 'FMD199201', 'Chocolate Cookies (Pkt)', 'Bakery products are made from flour, offering carbohydrates, flavor, and energy 9', '2', 'Bakery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 150.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:24'),
(904, 'FMD311472', 'Weetabix Bran flakes 500g', 'Basic description of Breakfast 67', '5', 'Breakfast', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 590.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:24'),
(905, 'FMD311473', 'Weetabix Oatibix wholegrain oat cereal 600g', 'Basic description of Breakfast 68', '5', 'Breakfast', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 790.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:24'),
(906, 'FMD311474', 'Weetabix original 215 Gms', 'Basic description of Breakfast 69', '5', 'Breakfast', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 365.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:24'),
(907, 'FMD311475', 'Weetabix Original 430g', 'Basic description of Breakfast 70', '5', 'Breakfast', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 765.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:24'),
(908, 'FMD364099', 'Chocos Crunch (375 gms) - Lawrence', 'Basic description of Breakfast 71', '5', 'Breakfast', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 285.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:24'),
(909, 'FMD364100', 'Oats (1 kg - Refill) - Bagrrys', 'Basic description of Breakfast 72', '5', 'Breakfast', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 440.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:24'),
(910, 'FMD359605', 'Kellogs Corn Flakes Original (475 gm)', 'Basic description of Breakfast 73', '5', 'Breakfast', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 415.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:24'),
(911, 'FMD369523', 'Suji Rusk (170 gm)', 'Basic description of Breakfast 74', '5', 'Breakfast', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 90.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:24'),
(912, 'FMD225701', 'Kellogg\'s Extra Muesli Fruit & Nut 750 gm', 'Basic description of Breakfast 75', '5', 'Breakfast', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 740.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:24'),
(913, 'FMD283403', 'Gaia Muesli Diet 400gm', 'Basic description of Breakfast 76', '5', 'Breakfast', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 450.00, 10.00, 10.00, ' GA00001', 'GAIA', NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:24'),
(914, 'FMD199202', 'Chocolate Prawling', 'Bakery products are made from flour, offering carbohydrates, flavor, and energy 10', '2', 'Bakery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 180.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:24'),
(915, 'FMD283404', 'Gaia Muesli Fruit & Nuts 400gm', 'Basic description of Breakfast 77', '5', 'Breakfast', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 470.00, 10.00, 10.00, ' GA00001', 'GAIA', NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:24'),
(916, 'FMD283405', 'Gaia Muesli Nutty Deligt 400gm', 'Basic description of Breakfast 78', '5', 'Breakfast', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 450.00, 10.00, 10.00, ' GA00001', 'GAIA', NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:24'),
(917, 'FMD283406', 'Gaia Muesli Real Fruit 400gm', 'Basic description of Breakfast 79', '5', 'Breakfast', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 485.00, 10.00, 10.00, ' GA00001', 'GAIA', NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:25'),
(918, 'FMD254103', 'Kellogg\'s Oats Refill (400 gm)', 'Basic description of Breakfast 80', '5', 'Breakfast', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 165.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:25'),
(919, 'FMD277776', 'Kellogg\'s Extra Muesli Fruit & Nut (1 Kg Jar)', 'Basic description of Breakfast 81', '5', 'Breakfast', '10', 'Cereals', '0', 0.00, 0.00, 1189.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:25'),
(920, 'FMD278217', 'Gaia Oats Multigrain (500gm)', 'Basic description of Breakfast 82', '5', 'Breakfast', '10', 'Cereals', '0', 0.00, 0.00, 240.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:25'),
(921, 'FMD282338', 'Kellogg\'s Muesli Nut Delight (750 gm)', 'Basic description of Breakfast 83', '5', 'Breakfast', '10', 'Cereals', '0', 0.00, 0.00, 765.00, 10.00, 10.00, ' Ke00001', 'Kelloggs', NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:25'),
(922, 'FMD278534', 'Kellogg\'s Oats (400 gm)', 'Basic description of Breakfast 84', '5', 'Breakfast', '10', 'Cereals', '0', 0.00, 0.00, 215.00, 10.00, 10.00, ' Ke00001', 'Kelloggs', NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:25'),
(923, 'FMD279678', 'Kellogg\'s Fruits and Nuts Seed Muesli', 'Basic description of Breakfast 85', '5', 'Breakfast', '10', 'Cereals', '0', 0.00, 0.00, 1189.00, 10.00, 10.00, ' Ke00001', 'Kelloggs', NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:25'),
(924, 'FMD281004', 'Gaia Muesli Diet (400 gm)', 'Basic description of Breakfast 86', '5', 'Breakfast', '10', 'Cereals', '0', 0.00, 0.00, 450.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:25'),
(925, 'FMD199203', 'Chocolate Swiss Roll (Large)', 'Bakery products are made from flour, offering carbohydrates, flavor, and energy 11', '2', 'Bakery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 190.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:25'),
(926, 'FMD281005', 'Kelloggs 0% Sugar Muesli (500 gm)', 'Basic description of Breakfast 87', '5', 'Breakfast', '10', 'Cereals', '0', 0.00, 0.00, 540.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:25'),
(927, 'FMD281006', 'Kelloggs Fruit and Nut  (1 kg ) Jar', 'Basic description of Breakfast 88', '5', 'Breakfast', '10', 'Cereals', '0', 0.00, 0.00, 1189.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:25'),
(928, 'FMD281007', 'Kellogg\'s Muesli No Added Sugar (500 gm)', 'Basic description of Breakfast 89', '5', 'Breakfast', '10', 'Cereals', '0', 0.00, 0.00, 540.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:25'),
(929, 'FMD283487', 'Nestle Gold Crunchy Flakes 250 gms', 'Basic description of Breakfast 90', '5', 'Breakfast', '10', 'Cereals', '0', 0.00, 0.00, 155.00, 10.00, 10.00, ' Ne00003', 'Nestle', NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:25'),
(930, 'FMD283488', 'Nestle Gold Crunchy Flakes 475 gms', 'Basic description of Breakfast 91', '5', 'Breakfast', '10', 'Cereals', '0', 0.00, 0.00, 320.00, 10.00, 10.00, ' Ne00003', 'Nestle', NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:25'),
(931, 'FMD253692', 'Kellogs Almond & Honey (300 gm)', 'Basic description of Breakfast 93', '5', 'Breakfast', '10', 'Cereals', '0', 0.00, 0.00, 355.00, 10.00, 10.00, ' Ke00001', 'Kelloggs', NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:25'),
(932, 'FMD272144', 'Kellogg\'s Oats (900 gm)', 'Basic description of Breakfast 94', '5', 'Breakfast', '10', 'Cereals', '0', 0.00, 0.00, 350.00, 10.00, 10.00, ' Ke00001', 'Kelloggs', NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:25'),
(933, 'FMD264567', 'Kellogg\'s  Corn Flakes with Real Honey (300 gm)', 'Basic description of Breakfast 95', '5', 'Breakfast', '10', 'Cereals', '0', 0.00, 0.00, 295.00, 10.00, 10.00, ' Ke00001', 'Kelloggs', NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:25'),
(934, 'FMD226516', 'Nestle Koko Krunch Breakfast Cereal - Chocolate Flavour (350 gm)', 'Basic description of Breakfast 96', '5', 'Breakfast', '10', 'Cereals', '0', 0.00, 0.00, 300.00, 10.00, 10.00, ' Ne00003', 'Nestle', NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:25'),
(935, 'FMD306575', 'Kellogg\'s  Chocos (715 gm)', 'Basic description of Breakfast 97', '5', 'Breakfast', '10', 'Cereals', '0', 0.00, 0.00, 580.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:25'),
(936, 'FMD199204', 'Chocolate Wheel Cookies', 'Bakery products are made from flour, offering carbohydrates, flavor, and energy 12', '2', 'Bakery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 150.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:25'),
(937, 'FMD300120', 'Kellogg\'s  Corn Flakes Original (475gm)', 'Basic description of Breakfast 98', '5', 'Breakfast', '10', 'Cereals', '0', 0.00, 0.00, 415.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:25'),
(938, 'FMD302610', 'Oateo Instant Oats (1 Kg)', 'Basic description of Breakfast 99', '5', 'Breakfast', '10', 'Cereals', '0', 0.00, 0.00, 435.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:25'),
(939, 'FMD341691', 'Kellogg\'s Corn Flakes Almond', 'Basic description of Breakfast 100', '5', 'Breakfast', '10', 'Cereals', '0', 0.00, 0.00, 355.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:25'),
(940, 'FMD333072', 'Kelloggs Cornflakes Strawberry 300gm', 'Basic description of Breakfast 101', '5', 'Breakfast', '10', 'Cereals', '0', 0.00, 0.00, 295.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:25'),
(941, 'FMD321753', 'Kellogs Real Almond Honey', 'Basic description of Breakfast 102', '5', 'Breakfast', '10', 'Cereals', '0', 0.00, 0.00, 355.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:25'),
(942, 'FMD315907', 'Moon & Stars Chocos (375 gm)', 'Basic description of Breakfast 103', '5', 'Breakfast', '10', 'Cereals', '0', 0.00, 0.00, 345.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:25'),
(943, 'FMD314231', 'Kellogg\'s  Oats (900 gm)', 'Basic description of Breakfast 104', '5', 'Breakfast', '10', 'Cereals', '0', 0.00, 0.00, 350.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:25'),
(944, 'FMD374440', 'Kelloggs Honey Crunch', 'Basic description of Breakfast 105', '5', 'Breakfast', '10', 'Cereals', '0', 0.00, 0.00, 340.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:25'),
(945, 'FMD178060', 'Nestle Koko Krunch  Chocolate Flavour Chocos (350 gm)', 'Basic description of Breakfast 106', '5', 'Breakfast', '10', 'Cereals', '0', 0.00, 0.00, 246.00, 10.00, 10.00, ' Ne00003', 'Nestle', NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:25'),
(946, 'FMD174370', 'Gaia Muesli Nutty Delight (400 gm)', 'Basic description of Breakfast 107', '5', 'Breakfast', '10', 'Cereals', '0', 0.00, 0.00, 450.00, 10.00, 10.00, ' GA00001', 'GAIA', NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:25'),
(947, 'FMD199205', 'D/W Chocolate Prawling', 'Bakery products are made from flour, offering carbohydrates, flavor, and energy 13', '2', 'Bakery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 180.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:25'),
(948, 'FMD174371', 'Gaia Muesli Real Fruit (400 gm)', 'Basic description of Breakfast 108', '5', 'Breakfast', '10', 'Cereals', '0', 0.00, 0.00, 480.00, 10.00, 10.00, ' GA00001', 'GAIA', NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:25'),
(949, 'FMD174373', 'Gaia Oats With Multigrains (500 gm)', 'Basic description of Breakfast 110', '5', 'Breakfast', '10', 'Cereals', '0', 0.00, 0.00, 215.00, 10.00, 10.00, ' GA00001', 'GAIA', NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:25'),
(950, 'FMD176404', 'Baggry Oats (1 kg)', 'Basic description of Breakfast 112', '5', 'Breakfast', '10', 'Cereals', '0', 0.00, 0.00, 360.00, 10.00, 10.00, ' Bo00001', 'Borges', NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:25'),
(951, 'FMD176405', 'Baggry Oats (500 gm)', 'Basic description of Breakfast 113', '5', 'Breakfast', '10', 'Cereals', '0', 0.00, 0.00, 190.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:25'),
(952, 'FMD176406', 'Lawrence Mills Choco Crunch (375 gm)', 'Basic description of Breakfast 114', '5', 'Breakfast', '10', 'Cereals', '0', 0.00, 0.00, 240.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:25'),
(953, 'FMD174401', 'Kellogg\'s  Chocos (385 gm)', 'Basic description of Breakfast 115', '5', 'Breakfast', '10', 'Cereals', '0', 0.00, 0.00, 300.00, 10.00, 10.00, ' Ke00001', 'Kelloggs', NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:25'),
(954, 'FMD174402', 'Kellogg\'s  Corn Flakes - Honey (300 gm)', 'Basic description of Breakfast 116', '5', 'Breakfast', '10', 'Cereals', '0', 0.00, 0.00, 340.00, 10.00, 10.00, ' Ke00001', 'Kelloggs', NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:25'),
(955, 'FMD174403', 'Kellogg\'s  Corn Flakes - Original Super Saver Pack (875 gm)', 'Basic description of Breakfast 117', '5', 'Breakfast', '10', 'Cereals', '0', 0.00, 0.00, 689.00, 10.00, 10.00, ' Ke00001', 'Kelloggs', NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:25'),
(956, 'FMD174404', 'Kellogg\'s Oats Refill (1 kg)', 'Basic description of Breakfast 118', '5', 'Breakfast', '10', 'Cereals', '0', 0.00, 0.00, 390.00, 10.00, 10.00, ' Ke00001', 'Kelloggs', NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:25'),
(957, 'FMD174405', 'Kellogg\'s  Corn Flakes with Real Almonds (300 gm)', 'Basic description of Breakfast 119', '5', 'Breakfast', '10', 'Cereals', '0', 0.00, 0.00, 340.00, 10.00, 10.00, ' Ke00001', 'Kelloggs', NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:25'),
(958, 'FMD177365', 'Pampers Pants 50s Medium', 'Basic description of Baby Care 3', '1', 'Baby Care', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 1109.00, 10.00, 10.00, ' Pa00001', 'Pamper', NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:25'),
(959, 'FMD199206', 'French Heart', 'Bakery products are made from flour, offering carbohydrates, flavor, and energy 14', '2', 'Bakery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 140.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:25'),
(960, 'FMD174339', 'Nestlé KOKO KRUNCH Maxx Choc (500 gm)', 'Basic description of Breakfast 120', '5', 'Breakfast', '10', 'Cereals', '0', 0.00, 0.00, 589.99, 10.00, 10.00, ' Ne00003', 'Nestle', NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:25'),
(961, 'FMD174340', 'Nestlé KOKO KRUNCH Maxx Strawberry (250 gm)', 'Basic description of Breakfast 121', '5', 'Breakfast', '10', 'Cereals', '0', 0.00, 0.00, 370.00, 10.00, 10.00, ' Ne00003', 'Nestle', NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:25'),
(962, 'FMD174341', 'Nestlé NesPlus Breakfast Cereal - Crunchy Flakes with Corn & Oats (250 gm)', 'Basic description of Breakfast 122', '5', 'Breakfast', '10', 'Cereals', '0', 0.00, 0.00, 166.00, 10.00, 10.00, ' Ne00003', 'Nestle', NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:25'),
(963, 'FMD189613', 'Kellogg\'s Oats (450 gm) * 2 (With Jar Free)', 'Basic description of Breakfast 123', '5', 'Breakfast', '10', 'Cereals', '0', 0.00, 0.00, 440.00, 10.00, 10.00, ' Ke00001', 'Kelloggs', NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:25');
INSERT INTO `products` (`id`, `product_code`, `product_name`, `product_description`, `category_id`, `category_name`, `subcategory_id`, `subcategory_name`, `delivery_target_days`, `discount`, `actual_price`, `sell_price`, `available_quantity`, `stock_quantity`, `brand_id`, `brand_name`, `primary_image`, `created_at`, `updated_at`) VALUES
(964, 'FMD189236', 'Gaia Muesli Fruit & Nuts (400 gm)', 'Basic description of Breakfast 124', '5', 'Breakfast', '10', 'Cereals', '0', 0.00, 0.00, 450.00, 10.00, 10.00, ' GA00001', 'GAIA', NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:25'),
(965, 'FMD189360', 'Gaia Muesli Fruit & Nuts (1 kg)', 'Basic description of Breakfast 125', '5', 'Breakfast', '10', 'Cereals', '0', 0.00, 0.00, 950.00, 10.00, 10.00, ' GA00001', 'GAIA', NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:25'),
(966, 'FMD189361', 'Gaia Muesli Nutty Delight (1 kg)', 'Basic description of Breakfast 126', '5', 'Breakfast', '10', 'Cereals', '0', 0.00, 0.00, 950.00, 10.00, 10.00, ' GA00001', 'GAIA', NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:26'),
(967, 'FMD184768', 'Baggery\'s Oats (450 gm)', 'Basic description of Breakfast 127', '5', 'Breakfast', '10', 'Cereals', '0', 0.00, 0.00, 220.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:26'),
(968, 'FMD178481', 'Almond Corn Flakes (1 pcs)', 'Basic description of Breakfast 129', '5', 'Breakfast', '10', 'Cereals', '0', 0.00, 0.00, 330.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:26'),
(969, 'FMD178482', 'Honey Corn Flakes (1 pcs)', 'Basic description of Breakfast 130', '5', 'Breakfast', '10', 'Cereals', '0', 0.00, 0.00, 260.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:26'),
(970, 'FMD199207', 'Fruit Cake (Medium)', 'Bakery products are made from flour, offering carbohydrates, flavor, and energy 15', '2', 'Bakery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 250.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:49', '2024-09-15 23:39:26'),
(971, 'FMD203269', 'Multigrain Oats (1 kgs) - GAIA', 'Basic description of Breakfast 131', '5', 'Breakfast', '10', 'Cereals', '0', 0.00, 0.00, 424.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:50', '2024-09-15 23:39:26'),
(972, 'FMD203263', 'Muesli Strawberry (400 gms) - GAIA', 'Basic description of Breakfast 132', '5', 'Breakfast', '10', 'Cereals', '0', 0.00, 0.00, 510.00, 10.00, 10.00, ' GA00001', 'GAIA', NULL, '2024-09-15 22:50:50', '2024-09-15 23:39:26'),
(973, 'FMD203264', 'Muesli Amaranth (400 gms) - GAIA', 'Basic description of Breakfast 133', '5', 'Breakfast', '10', 'Cereals', '0', 0.00, 0.00, 555.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:50', '2024-09-15 23:39:26'),
(974, 'FMD203265', 'Muesli Diet (1 kgs) - GAIA', 'Basic description of Breakfast 134', '5', 'Breakfast', '10', 'Cereals', '0', 0.00, 0.00, 1075.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:50', '2024-09-15 23:39:26'),
(975, 'FMD203266', 'Muesli Real Fruit (1 kgs) - GAIA', 'Basic description of Breakfast 135', '5', 'Breakfast', '10', 'Cereals', '0', 0.00, 0.00, 1115.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:50', '2024-09-15 23:39:26'),
(976, 'FMD203267', 'Muesli Strawberry (1 kgs) - GAIA', 'Basic description of Breakfast 136', '5', 'Breakfast', '10', 'Cereals', '0', 0.00, 0.00, 1075.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:50', '2024-09-15 23:39:26'),
(977, 'FMD290116', 'Britannia Tiger Crunch (27 gm)', 'Basic description of Cookies & Biscuits 1', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 0.00, 10.00, 10.00, ' Br00001', 'Britannia', NULL, '2024-09-15 22:50:50', '2024-09-15 23:39:26'),
(978, 'FMD293419', 'NC Digestive (250 gm)', 'Basic description of Cookies & Biscuits 2', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 120.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:50', '2024-09-15 23:39:26'),
(979, 'FMD306140', 'Mcvities Hobnobs (300 gm) 2 pcs', 'Basic description of Cookies & Biscuits 3', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 290.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:50', '2024-09-15 23:39:26'),
(980, 'FMD253691', 'Butter Bites (160 gm)', 'Basic description of Cookies & Biscuits 4', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 45.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:50', '2024-09-15 23:39:26'),
(981, 'FMD199208', 'Jeera Cookies', 'Bakery products are made from flour, offering carbohydrates, flavor, and energy 16', '2', 'Bakery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 150.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:50', '2024-09-15 23:39:26'),
(982, 'FMD274751', 'Britannia Butter Cookies', 'Basic description of Cookies & Biscuits 5', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 80.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:50', '2024-09-15 23:39:26'),
(983, 'FMD233183', 'Mcvities Digestive Biscuit (500 gm) (India)', 'Basic description of Cookies & Biscuits 6', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 185.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:50', '2024-09-15 23:39:26'),
(984, 'FMD240865', 'Priyagold Marie Gold (300 gm)', 'Basic description of Cookies & Biscuits 7', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 70.00, 10.00, 10.00, ' Pr00001', 'Priyagold', NULL, '2024-09-15 22:50:50', '2024-09-15 23:39:26'),
(985, 'FMD250701', 'UK Digestive Milk Chocolate', 'Basic description of Cookies & Biscuits 8', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 230.00, 10.00, 10.00, ' Mc00001', 'Mcvities (India)', NULL, '2024-09-15 22:50:50', '2024-09-15 23:39:26'),
(986, 'FMD241439', 'Britannia Digestive Sugar Free (250 gm)', 'Basic description of Cookies & Biscuits 9', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 150.00, 10.00, 10.00, ' Br00001', 'Britannia', NULL, '2024-09-15 22:50:50', '2024-09-15 23:39:26'),
(987, 'FMD321071', 'Suji Rusk (305gm)', 'Basic description of Cookies & Biscuits 10', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 170.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:50', '2024-09-15 23:39:26'),
(988, 'FMD316951', 'Fresh 2 Go Plain Tortilla Bread 8\"12Nx45G-540Gm', 'Basic description of Cookies & Biscuits 11', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 485.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:50', '2024-09-15 23:39:26'),
(989, 'FMD316952', 'Good Day Butter (250 Gms) - Britannia', 'Basic description of Cookies & Biscuits 12', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 85.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:50', '2024-09-15 23:39:26'),
(990, 'FMD316953', 'Good Day Nuts Cookie  (200 gms) - Britannia', 'Basic description of Cookies & Biscuits 13', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 90.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:50', '2024-09-15 23:39:26'),
(991, 'FMD316954', 'Marie Gold (1 kg) - Britanni', 'Basic description of Cookies & Biscuits 14', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 290.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:50', '2024-09-15 23:39:26'),
(992, 'FMD199209', 'Macaron', 'Bakery products are made from flour, offering carbohydrates, flavor, and energy 17', '2', 'Bakery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 50.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:50', '2024-09-15 23:39:26'),
(993, 'FMD316955', 'NC Digestive (1 Kg) - Britannia', 'Basic description of Cookies & Biscuits 15', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 490.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:50', '2024-09-15 23:39:26'),
(994, 'FMD314843', 'UK Digestive (500 gm)', 'Basic description of Cookies & Biscuits 16', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 240.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:50', '2024-09-15 23:39:26'),
(995, 'FMD314847', 'Digestive (250 gm)', 'Basic description of Cookies & Biscuits 17', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 110.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:50', '2024-09-15 23:39:26'),
(996, 'FMD315080', 'UK Digestive (400 gm)', 'Basic description of Cookies & Biscuits 18', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 310.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:50', '2024-09-15 23:39:26'),
(997, 'FMD307193', 'Mcvities Milk Hobnobs', 'Basic description of Cookies & Biscuits 19', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 300.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:50', '2024-09-15 23:39:26'),
(998, 'FMD346424', 'Britannia Marie Gold 1 kg', 'Basic description of Cookies & Biscuits 20', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 290.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:50', '2024-09-15 23:39:26'),
(999, 'FMD335905', 'Marie gold (250 gm) - MCV', 'Basic description of Cookies & Biscuits 21', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 70.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:50', '2024-09-15 23:39:26'),
(1000, 'FMD331219', 'Britannia Digestive (250 gm)', 'Basic description of Cookies & Biscuits 22', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 120.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:50', '2024-09-15 23:39:27'),
(1001, 'FMD356064', 'Marie Gold (250 gm)', 'Basic description of Cookies & Biscuits 23', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 70.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:50', '2024-09-15 23:39:27'),
(1002, 'FMD174277', 'Priyagold Butter Delight (160 gm)', 'Basic description of Cookies & Biscuits 24', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 45.00, 10.00, 10.00, ' Pr00001', 'Priyagold', NULL, '2024-09-15 22:50:50', '2024-09-15 23:39:27'),
(1003, 'FMD199210', 'Macoroni Cookies', 'Bakery products are made from flour, offering carbohydrates, flavor, and energy 18', '2', 'Bakery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 150.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:50', '2024-09-15 23:39:27'),
(1004, 'FMD174279', 'Priyagold Cheese Cracker (160 gm)', 'Basic description of Cookies & Biscuits 25', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 45.00, 10.00, 10.00, ' Pr00001', 'Priyagold', NULL, '2024-09-15 22:50:50', '2024-09-15 23:39:27'),
(1005, 'FMD174282', 'Priyagold Marie Lite (300 gm)', 'Basic description of Cookies & Biscuits 26', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 60.00, 10.00, 10.00, ' Pr00001', 'Priyagold', NULL, '2024-09-15 22:50:50', '2024-09-15 23:39:27'),
(1006, 'FMD174283', 'Priyagold Snack ZigZag (200 gm)', 'Basic description of Cookies & Biscuits 27', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 45.00, 10.00, 10.00, ' Pr00001', 'Priyagold', NULL, '2024-09-15 22:50:50', '2024-09-15 23:39:27'),
(1007, 'FMD174242', 'Mcvities (UK) Digestive (250 gm)', 'Basic description of Cookies & Biscuits 28', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 200.00, 10.00, 10.00, ' Mc00002', 'Mcvities (UK)', NULL, '2024-09-15 22:50:50', '2024-09-15 23:39:27'),
(1008, 'FMD174243', 'Mcvities (UK) Wholesense (400 gm)', 'Basic description of Cookies & Biscuits 29', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 340.00, 10.00, 10.00, ' Mc00002', 'Mcvities (UK)', NULL, '2024-09-15 22:50:50', '2024-09-15 23:39:27'),
(1009, 'FMD174245', 'Mcvities (UK) Digestive Dark Chocolate (300 gm)', 'Basic description of Cookies & Biscuits 30', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 260.00, 10.00, 10.00, ' Mc00002', 'Mcvities (UK)', NULL, '2024-09-15 22:50:50', '2024-09-15 23:39:27'),
(1010, 'FMD174246', 'Mcvities (UK) Digestive Milk Chocolate (300 gm)', 'Basic description of Cookies & Biscuits 31', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 270.00, 10.00, 10.00, ' Mc00002', 'Mcvities (UK)', NULL, '2024-09-15 22:50:50', '2024-09-15 23:39:27'),
(1011, 'FMD174249', 'Mcvities (UK) Digestive Dark Chocolate (200 gm)', 'Basic description of Cookies & Biscuits 32', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 185.00, 10.00, 10.00, ' Mc00002', 'Mcvities (UK)', NULL, '2024-09-15 22:50:51', '2024-09-15 23:39:27'),
(1012, 'FMD174250', 'Mcvities (UK) Hobnobs (300 gm)', 'Basic description of Cookies & Biscuits 33', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 260.00, 10.00, 10.00, ' Mc00002', 'Mcvities (UK)', NULL, '2024-09-15 22:50:51', '2024-09-15 23:39:27'),
(1013, 'FMD174251', 'Mcvities (UK) Hobnobs Milk Chocolate (300 gm)', 'Basic description of Cookies & Biscuits 34', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 290.00, 10.00, 10.00, ' Mc00002', 'Mcvities (UK)', NULL, '2024-09-15 22:50:51', '2024-09-15 23:39:27'),
(1014, 'FMD199211', 'Marble Cake (Medium)', 'Bakery products are made from flour, offering carbohydrates, flavor, and energy 19', '2', 'Bakery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 150.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:51', '2024-09-15 23:39:27'),
(1015, 'FMD174307', 'Oxford Cheese Puff Sandwich', 'Basic description of Cookies & Biscuits 35', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 265.00, 10.00, 10.00, ' Ox00001', 'Oxford', NULL, '2024-09-15 22:50:51', '2024-09-15 23:39:27'),
(1016, 'FMD174308', 'Oxford Chocolate Puff Sandwich', 'Basic description of Cookies & Biscuits 36', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 265.00, 10.00, 10.00, ' Ox00001', 'Oxford', NULL, '2024-09-15 22:50:51', '2024-09-15 23:39:27'),
(1017, 'FMD174309', 'Oxford Corn Crackers (350 gm)', 'Basic description of Cookies & Biscuits 37', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 265.00, 10.00, 10.00, ' Ox00001', 'Oxford', NULL, '2024-09-15 22:50:51', '2024-09-15 23:39:27'),
(1018, 'FMD174310', 'Oxford Lemon Puff Sandwich', 'Basic description of Cookies & Biscuits 38', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 265.00, 10.00, 10.00, ' Ox00001', 'Oxford', NULL, '2024-09-15 22:50:51', '2024-09-15 23:39:27'),
(1019, 'FMD174311', 'Oxford Special Crackers (350 gm)', 'Basic description of Cookies & Biscuits 39', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 265.00, 10.00, 10.00, ' Ox00001', 'Oxford', NULL, '2024-09-15 22:50:51', '2024-09-15 23:39:27'),
(1020, 'FMD174238', 'Mcvities (UK) Digestive (500 gm)', 'Basic description of Cookies & Biscuits 40', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 215.00, 10.00, 10.00, ' Mc00002', 'Mcvities (UK)', NULL, '2024-09-15 22:50:51', '2024-09-15 23:39:27'),
(1021, 'FMD174197', 'Mcvities (India) 5 Grain (150 gm)', 'Basic description of Cookies & Biscuits 41', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 40.00, 10.00, 10.00, ' Mc00001', 'Mcvities (India)', NULL, '2024-09-15 22:50:51', '2024-09-15 23:39:27'),
(1022, 'FMD174198', 'Mcvities (India) Butter Cookies (200 gm)', 'Basic description of Cookies & Biscuits 42', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 65.00, 10.00, 10.00, ' Mc00001', 'Mcvities (India)', NULL, '2024-09-15 22:50:51', '2024-09-15 23:39:27'),
(1023, 'FMD174199', 'Mcvities (India) Cheese Cracker (120 gm)', 'Basic description of Cookies & Biscuits 43', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 40.00, 10.00, 10.00, ' Mc00001', 'Mcvities (India)', NULL, '2024-09-15 22:50:51', '2024-09-15 23:39:27'),
(1024, 'FMD174200', 'Mcvities (India) Dark Cookies (120 gm)', 'Basic description of Cookies & Biscuits 44', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 50.00, 10.00, 10.00, ' Mc00001', 'Mcvities (India)', NULL, '2024-09-15 22:50:51', '2024-09-15 23:39:27'),
(1025, 'FMD199212', 'Mocha Swiss Roll (Large)', 'Bakery products are made from flour, offering carbohydrates, flavor, and energy 20', '2', 'Bakery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 200.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:51', '2024-09-15 23:39:27'),
(1026, 'FMD174201', 'Digestive (960 gms) - Mcvities (India)', 'Basic description of Cookies & Biscuits 45', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 440.00, 10.00, 10.00, ' Mc00001', 'Mcvities (India)', NULL, '2024-09-15 22:50:51', '2024-09-15 23:39:27'),
(1027, 'FMD174202', 'Mcvities (India) Digestive (75 gm)', 'Basic description of Cookies & Biscuits 46', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 20.00, 10.00, 10.00, ' Mc00001', 'Mcvities (India)', NULL, '2024-09-15 22:50:51', '2024-09-15 23:39:27'),
(1028, 'FMD174203', 'Digestive (500 gm) - Mcvities (India)', 'Basic description of Cookies & Biscuits 47', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 230.00, 10.00, 10.00, ' Mc00001', 'Mcvities (India)', NULL, '2024-09-15 22:50:51', '2024-09-15 23:39:27'),
(1029, 'FMD174204', 'Mcvities (India) Digestive Sugar Free (75 gm)', 'Basic description of Cookies & Biscuits 48', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 40.00, 10.00, 10.00, ' Mc00001', 'Mcvities (India)', NULL, '2024-09-15 22:50:51', '2024-09-15 23:39:27'),
(1030, 'FMD174205', 'Mcvities (India)Digestive Sugar Free (300 gm)', 'Basic description of Cookies & Biscuits 49', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 240.00, 10.00, 10.00, ' Mc00001', 'Mcvities (India)', NULL, '2024-09-15 22:50:51', '2024-09-15 23:39:27'),
(1031, 'FMD174206', 'Mcvities (India) Digestive (250 gm)', 'Basic description of Cookies & Biscuits 50', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 110.00, 10.00, 10.00, ' Mc00001', 'Mcvities (India)', NULL, '2024-09-15 22:50:51', '2024-09-15 23:39:27'),
(1032, 'FMD177548', 'Meidan Soda Crackers (450 gm)', 'Basic description of Cookies & Biscuits 51', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 240.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:51', '2024-09-15 23:39:27'),
(1033, 'FMD177549', 'Meidan Sugar Free Crackers (450 gm)', 'Basic description of Cookies & Biscuits 52', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 240.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:51', '2024-09-15 23:39:27'),
(1034, 'FMD176402', 'Mcvities Rich Tea (300 gm)', 'Basic description of Cookies & Biscuits 53', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 200.00, 10.00, 10.00, ' Mc00001', 'Mcvities (India)', NULL, '2024-09-15 22:50:51', '2024-09-15 23:39:27'),
(1035, 'FMD176403', 'Munchys Veg Crackers (390 gm)', 'Basic description of Cookies & Biscuits 54', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 265.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:51', '2024-09-15 23:39:27'),
(1036, 'FMD199213', 'Nutty Chocolate Prawling', 'Bakery products are made from flour, offering carbohydrates, flavor, and energy 21', '2', 'Bakery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 180.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:51', '2024-09-15 23:39:27'),
(1037, 'FMD174463', 'Mcvities (UK) Digestive (400 gm)', 'Basic description of Cookies & Biscuits 55', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 300.00, 10.00, 10.00, ' Mc00002', 'Mcvities (UK)', NULL, '2024-09-15 22:50:51', '2024-09-15 23:39:27'),
(1038, 'FMD174406', 'Britannia Digestive (250g)', 'Basic description of Cookies & Biscuits 56', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 120.00, 10.00, 10.00, ' Br00001', 'Britannia', NULL, '2024-09-15 22:50:51', '2024-09-15 23:39:27'),
(1039, 'FMD174407', 'Britannia Digestive (500g)', 'Basic description of Cookies & Biscuits 57', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 240.00, 10.00, 10.00, ' Br00001', 'Britannia', NULL, '2024-09-15 22:50:51', '2024-09-15 23:39:27'),
(1040, 'FMD174408', 'Britannia Good Day Butter (250g)', 'Basic description of Cookies & Biscuits 58', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 85.00, 10.00, 10.00, ' Br00001', 'Britannia', NULL, '2024-09-15 22:50:51', '2024-09-15 23:39:28'),
(1041, 'FMD174409', 'Britannia Good Day Cashew (250 g)', 'Basic description of Cookies & Biscuits 59', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 90.00, 10.00, 10.00, ' Br00001', 'Britannia', NULL, '2024-09-15 22:50:51', '2024-09-15 23:39:28'),
(1042, 'FMD174410', 'Britannia Marie (45g) (Pack of 12)', 'Basic description of Cookies & Biscuits 60', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 110.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:51', '2024-09-15 23:39:28'),
(1043, 'FMD174411', 'Britannia Wheat Rusk (170g)', 'Basic description of Cookies & Biscuits 61', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 90.00, 10.00, 10.00, ' Br00001', 'Britannia', NULL, '2024-09-15 22:50:51', '2024-09-15 23:39:28'),
(1044, 'FMD174412', 'Britannia Vita  Marigold (300g)', 'Basic description of Cookies & Biscuits 62', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 140.00, 10.00, 10.00, ' Br00001', 'Britannia', NULL, '2024-09-15 22:50:51', '2024-09-15 23:39:28'),
(1045, 'FMD177804', 'Hobnob Regular', 'Basic description of Cookies & Biscuits 63', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 220.00, 10.00, 10.00, ' Mc00001', 'Mcvities (India)', NULL, '2024-09-15 22:50:51', '2024-09-15 23:39:28'),
(1046, 'FMD189355', 'Gaia Dark Choco Chips Cookies', 'Basic description of Cookies & Biscuits 64', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 190.00, 10.00, 10.00, ' GA00001', 'GAIA', NULL, '2024-09-15 22:50:51', '2024-09-15 23:39:28'),
(1047, 'FMD199214', 'Peanut Butter Cookies', 'Bakery products are made from flour, offering carbohydrates, flavor, and energy 22', '2', 'Bakery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 150.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:28'),
(1048, 'FMD189362', 'Gaia Oatmeals Cookies (200 gm)', 'Basic description of Cookies & Biscuits 65', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 110.00, 10.00, 10.00, ' GA00001', 'GAIA', NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:28'),
(1049, 'FMD185019', 'Britannia Suji Toast(235 gms)', 'Basic description of Cookies & Biscuits 66', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 90.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:28'),
(1050, 'FMD198792', 'Royal Danish Luxury Cookies (454 gm)', 'Basic description of Cookies & Biscuits 67', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 685.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:28'),
(1051, 'FMD203268', 'Coconut Sugar Free Cookies (200 gms) - GAIA', 'Basic description of Cookies & Biscuits 68', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 205.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:28'),
(1052, 'FMD199591', 'Gaia Digestive Cookies (200 gm)', 'Basic description of Cookies & Biscuits 69', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 110.00, 10.00, 10.00, ' GA00001', 'GAIA', NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:28'),
(1053, 'FMD198820', 'Britannia Vita Marigold (300 gm)', 'Basic description of Cookies & Biscuits 70', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 140.00, 10.00, 10.00, ' Br00001', 'Britannia', NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:28'),
(1054, 'FMD195090', 'Britannia Sugar Free Biscuits (200 gm)', 'Basic description of Cookies & Biscuits 71', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 140.00, 10.00, 10.00, ' Br00001', 'Britannia', NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:28'),
(1055, 'FMD194637', 'Britannia Toastea Milk Rusk  (310 gm)', 'Basic description of Cookies & Biscuits 72', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 180.00, 10.00, 10.00, ' Br00001', 'Britannia', NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:28'),
(1056, 'FMD193709', 'First Choice Danish Luxury Cookies (454 gm)', 'Basic description of Cookies & Biscuits 73', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 685.00, 10.00, 10.00, ' Fi00001', 'First Choice', NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:28'),
(1057, 'FMD193710', 'Britannia Little Hearts Biscuits (75 gm)', 'Basic description of Cookies & Biscuits 74', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 65.00, 10.00, 10.00, ' Br00001', 'Britannia', NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:28'),
(1058, 'FMD199215', 'Plain Cake', 'Bakery products are made from flour, offering carbohydrates, flavor, and energy 23', '2', 'Bakery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 150.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:28'),
(1059, 'FMD193711', 'Britannia Nutri Choice 5 Grain (300 gm)', 'Basic description of Cookies & Biscuits 75', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 240.00, 10.00, 10.00, ' Br00001', 'Britannia', NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:28'),
(1060, 'FMD193712', 'Britannia Tiger Crunch (25+7gm)(Pack of 12)', 'Basic description of Cookies & Biscuits 76', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 110.00, 10.00, 10.00, ' Br00001', 'Britannia', NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:28'),
(1061, 'FMD193713', 'Britannia Toastea Milk Rusk (610 gm)', 'Basic description of Cookies & Biscuits 77', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 360.00, 10.00, 10.00, ' Br00001', 'Britannia', NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:28'),
(1062, 'FMD193714', 'Munchy\'s Lexus Cheese Cream Cracker Biscuit (190 gm)', 'Basic description of Cookies & Biscuits 78', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 285.00, 10.00, 10.00, ' Mu00001', 'Munchys', NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:28'),
(1063, 'FMD214621', 'Mcvities (UK) Digestive (1 Kg)', 'Basic description of Cookies & Biscuits 79', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 350.00, 10.00, 10.00, ' Mc00002', 'Mcvities (UK)', NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:28'),
(1064, 'FMD213311', 'Suji Rusk (205 gm)', 'Basic description of Cookies & Biscuits 80', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 120.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:28'),
(1065, 'FMD212438', 'Suji Rusk 170 gm', 'Basic description of Cookies & Biscuits 81', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 90.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:28'),
(1066, 'FMD212718', 'Cream Cracker Shoon Fatt', 'Basic description of Cookies & Biscuits 82', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 265.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:28'),
(1067, 'FMD209877', 'Suji Rusk (305 gm)', 'Basic description of Cookies & Biscuits 83', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 170.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:28'),
(1068, 'FMD215862', 'Royal Danish Style Cookies', 'Basic description of Cookies & Biscuits 84', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 270.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:28'),
(1069, 'FMD177366', 'Pampers Pants SM 56s', 'Basic description of Baby Care 4', '1', 'Baby Care', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 1109.00, 10.00, 10.00, ' Pa00001', 'Pamper', NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:28'),
(1070, 'FMD199216', 'Plain Puff', 'Bakery products are made from flour, offering carbohydrates, flavor, and energy 24', '2', 'Bakery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 120.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:28'),
(1071, 'FMD216594', 'Protein Cookies (200 gms) - GAIA', 'Basic description of Cookies & Biscuits 85', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 215.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:28'),
(1072, 'FMD217296', 'Gaia Sugar Free Ragi  Crisps & Crunchy Cookies', 'Basic description of Cookies & Biscuits 86', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 270.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:28'),
(1073, 'FMD217297', 'Toi Moi Chocolate Cream Water Biscuit', 'Basic description of Cookies & Biscuits 87', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 80.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:28'),
(1074, 'FMD217298', 'Toi Moi Strawberry Cream Water Biscuit', 'Basic description of Cookies & Biscuits 88', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 80.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:28'),
(1075, 'FMD217299', 'Toi Moi Vanilla Cream Water Biscuit', 'Basic description of Cookies & Biscuits 89', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 80.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:28'),
(1076, 'FMD218955', 'Britannia Mariegold (300 gm)', 'Basic description of Cookies & Biscuits 90', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 90.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:28'),
(1077, 'FMD220203', 'Ragi Sugar Free Cookies (200 gm)', 'Basic description of Cookies & Biscuits 91', '6', 'Cookies & Biscuits', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 270.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:28'),
(1078, 'FMD298296', 'Local Egg by Wellness (10 pcs)', 'Egg and dairy provide protein, calcium, and essential nutrients for health 1', '7', 'Egg & Dairy', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 350.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:28'),
(1079, 'FMD254319', 'Quail Egg (12 pcs) Pkt', 'Egg and dairy provide protein, calcium, and essential nutrients for health 2', '7', 'Egg & Dairy', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 110.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:28'),
(1080, 'FMD283446', 'Blue Cow Condensed Milk 390 gms', 'Egg and dairy provide protein, calcium, and essential nutrients for health 3', '7', 'Egg & Dairy', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 185.00, 10.00, 10.00, ' Te00001', 'Test Brand 1', NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:28'),
(1081, 'FMD199217', 'Puff Biscuit', 'Bakery products are made from flour, offering carbohydrates, flavor, and energy 25', '2', 'Bakery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 140.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:28'),
(1082, 'FMD342389', 'Unsalted Raw Butter (1 kg)', 'Egg and dairy provide protein, calcium, and essential nutrients for health 4', '7', 'Egg & Dairy', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 1280.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:29'),
(1083, 'FMD342390', 'Cow Cheese (200 gm) Pkt', 'Egg and dairy provide protein, calcium, and essential nutrients for health 5', '7', 'Egg & Dairy', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 320.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:29'),
(1084, 'FMD404103', 'Ambrosi Parmigiano Reggiano 200Gm', 'Egg and dairy provide protein, calcium, and essential nutrients for health 6', '7', 'Egg & Dairy', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 1440.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:29'),
(1085, 'FMD404104', 'Australian Gold Creamy Brie 115Gm', 'Egg and dairy provide protein, calcium, and essential nutrients for health 7', '7', 'Egg & Dairy', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 1190.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:29'),
(1086, 'FMD404105', 'Australian Gold Creamy Camembert 115Gm', 'Egg and dairy provide protein, calcium, and essential nutrients for health 8', '7', 'Egg & Dairy', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 1190.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:29'),
(1087, 'FMD205798', 'Local Eggs (1 Crate)', 'Egg and dairy provide protein, calcium, and essential nutrients for health 9', '7', 'Egg & Dairy', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 490.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:29'),
(1088, 'FMD214647', 'Cow Ghee (200 gm) Glass Jar', 'Egg and dairy provide protein, calcium, and essential nutrients for health 10', '7', 'Egg & Dairy', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 365.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:29'),
(1089, 'FMD218369', 'Sunaulo Anda (Egg) (12 pcs)', 'Egg and dairy provide protein, calcium, and essential nutrients for health 11', '7', 'Egg & Dairy', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 245.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:29'),
(1090, 'FMD179953', 'Ghee', 'Egg and dairy provide protein, calcium, and essential nutrients for health 12', '7', 'Egg & Dairy', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 575.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:29'),
(1091, 'FMD174048', 'Quail Egg- (30 pc - Crate)', 'Egg and dairy provide protein, calcium, and essential nutrients for health 13', '7', 'Egg & Dairy', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 230.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:29'),
(1092, 'FMD199218', 'Semolina Cookies', 'Bakery products are made from flour, offering carbohydrates, flavor, and energy 26', '2', 'Bakery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 150.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:29'),
(1093, 'FMD174049', 'Quail Egg (per pc)', 'Egg and dairy provide protein, calcium, and essential nutrients for health 14', '7', 'Egg & Dairy', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, -2.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:29'),
(1094, 'FMD174050', 'Paneer (200 gm)', 'Egg and dairy provide protein, calcium, and essential nutrients for health 15', '7', 'Egg & Dairy', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 170.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:29'),
(1095, 'FMD174051', 'Paneer (200gm)', 'Egg and dairy provide protein, calcium, and essential nutrients for health 16', '7', 'Egg & Dairy', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 190.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:29'),
(1096, 'FMD174052', 'Cow Cheese (200 gm)', 'Egg and dairy provide protein, calcium, and essential nutrients for health 17', '7', 'Egg & Dairy', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 240.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:29'),
(1097, 'FMD174053', 'Yak Cheese (200 gm)', 'Egg and dairy provide protein, calcium, and essential nutrients for health 18', '7', 'Egg & Dairy', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 470.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:29'),
(1098, 'FMD174054', 'Sunaulo Anda (Egg) (15 pcs)', 'Egg and dairy provide protein, calcium, and essential nutrients for health 19', '7', 'Egg & Dairy', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 255.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:29'),
(1099, 'FMD174055', 'Sunaulo Anda (Egg) (30  pcs)', 'Egg and dairy provide protein, calcium, and essential nutrients for health 20', '7', 'Egg & Dairy', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 430.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:29'),
(1100, 'FMD174056', 'Cow Ghee (500 ml) Bottle', 'Egg and dairy provide protein, calcium, and essential nutrients for health 21', '7', 'Egg & Dairy', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 765.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:29'),
(1101, 'FMD174057', 'Nauni Ghee (1 kg)', 'Egg and dairy provide protein, calcium, and essential nutrients for health 22', '7', 'Egg & Dairy', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 940.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:29'),
(1102, 'FMD174058', 'Pasteurized Milk (300 ml) (Glass Jar)', 'Egg and dairy provide protein, calcium, and essential nutrients for health 23', '7', 'Egg & Dairy', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 80.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:29'),
(1103, 'FMD199219', 'Swiss Roll', 'Bakery products are made from flour, offering carbohydrates, flavor, and energy 27', '2', 'Bakery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 90.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:29'),
(1104, 'FMD174059', 'Sweet Yogurt (1 Ltr)', 'Egg and dairy provide protein, calcium, and essential nutrients for health 24', '7', 'Egg & Dairy', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 210.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:29'),
(1105, 'FMD174089', 'Ambrosi Parmiagiano Reggiano (200 gm)', 'Egg and dairy provide protein, calcium, and essential nutrients for health 25', '7', 'Egg & Dairy', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 1340.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:29'),
(1106, 'FMD174293', 'Paneer (Cow) 300 gm', 'Egg and dairy provide protein, calcium, and essential nutrients for health 26', '7', 'Egg & Dairy', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 380.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:29'),
(1107, 'FMD174342', 'Nestle a+ Nourish Toned Milk (1 Litre) Tetra Pack', 'Egg and dairy provide protein, calcium, and essential nutrients for health 27', '7', 'Egg & Dairy', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 205.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:29'),
(1108, 'FMD177410', 'Milk (1 Ltr)', 'Egg and dairy provide protein, calcium, and essential nutrients for health 29', '7', 'Egg & Dairy', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 95.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:29'),
(1109, 'FMD177411', 'Plain Yogurt (1 Ltr)', 'Egg and dairy provide protein, calcium, and essential nutrients for health 30', '7', 'Egg & Dairy', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 150.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:29'),
(1110, 'FMD177560', 'Local Chicken Egg (12pcs) Box', 'Egg and dairy provide protein, calcium, and essential nutrients for health 31', '7', 'Egg & Dairy', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 422.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:29'),
(1111, 'FMD177562', 'Golden Eggs (12 pcs)', 'Egg and dairy provide protein, calcium, and essential nutrients for health 32', '7', 'Egg & Dairy', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 245.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:29'),
(1112, 'FMD177563', 'Golden Eggs (30 pcs)', 'Egg and dairy provide protein, calcium, and essential nutrients for health 33', '7', 'Egg & Dairy', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 615.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:29'),
(1113, 'FMD177564', 'Golden Eggs (6 pcs)', 'Egg and dairy provide protein, calcium, and essential nutrients for health 34', '7', 'Egg & Dairy', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 120.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:29'),
(1114, 'FMD199220', 'Vanilla Swiss Roll (Large)', 'Bakery products are made from flour, offering carbohydrates, flavor, and energy 28', '2', 'Bakery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 190.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:29'),
(1115, 'FMD174400', 'Amul Sliced Cheese (200 gm)', 'Egg and dairy provide protein, calcium, and essential nutrients for health 37', '7', 'Egg & Dairy', '11', 'Cheese', '0', 0.00, 0.00, 235.00, 10.00, 10.00, ' Am00002', 'Amul', NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:29'),
(1116, 'FMD174287', 'Tomme (Cow) 200 gm', 'Egg and dairy provide protein, calcium, and essential nutrients for health 38', '7', 'Egg & Dairy', '11', 'Cheese', '0', 0.00, 0.00, 430.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:29'),
(1117, 'FMD174288', 'Tomme (Yak) 200 gm', 'Egg and dairy provide protein, calcium, and essential nutrients for health 39', '7', 'Egg & Dairy', '11', 'Cheese', '0', 0.00, 0.00, 550.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:30'),
(1118, 'FMD174289', 'Gaurishankar (Yak) 200 gm', 'Egg and dairy provide protein, calcium, and essential nutrients for health 40', '7', 'Egg & Dairy', '11', 'Cheese', '0', 0.00, 0.00, 430.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:30'),
(1119, 'FMD174290', 'Belkot (Cow) 200 gm', 'Egg and dairy provide protein, calcium, and essential nutrients for health 41', '7', 'Egg & Dairy', '11', 'Cheese', '0', 0.00, 0.00, 470.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:30'),
(1120, 'FMD174291', 'Camembert (Cow) 300 gm', 'Egg and dairy provide protein, calcium, and essential nutrients for health 42', '7', 'Egg & Dairy', '11', 'Cheese', '0', 0.00, 0.00, 590.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:30'),
(1121, 'FMD174292', 'Feta Cheese - 200 gm', 'Egg and dairy provide protein, calcium, and essential nutrients for health 43', '7', 'Egg & Dairy', '11', 'Cheese', '0', 0.00, 0.00, 330.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:30'),
(1122, 'FMD174216', 'Arla Burger Slices (200 gm)', 'Egg and dairy provide protein, calcium, and essential nutrients for health 44', '7', 'Egg & Dairy', '11', 'Cheese', '0', 0.00, 0.00, 315.00, 10.00, 10.00, ' Ar00001', 'Arla', NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:30'),
(1123, 'FMD174217', 'Arla Cheddar Slices (150 gm)', 'Egg and dairy provide protein, calcium, and essential nutrients for health 45', '7', 'Egg & Dairy', '11', 'Cheese', '0', 0.00, 0.00, 640.00, 10.00, 10.00, ' Ar00001', 'Arla', NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:30'),
(1124, 'FMD174218', 'Arla Cheese Spread Puck (140 gm)', 'Egg and dairy provide protein, calcium, and essential nutrients for health 46', '7', 'Egg & Dairy', '11', 'Cheese', '0', 0.00, 0.00, 354.00, 10.00, 10.00, ' Ar00001', 'Arla', NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:30'),
(1125, 'FMD176507', 'Pintola Wholegrain Rice Cakes', 'Bakery products are made from flour, offering carbohydrates, flavor, and energy 29', '2', 'Bakery', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 240.00, 10.00, 10.00, ' Pi00001', 'Pintola', NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:30'),
(1126, 'FMD174219', 'Arla Cheese Triangles (140 gm)', 'Egg and dairy provide protein, calcium, and essential nutrients for health 47', '7', 'Egg & Dairy', '11', 'Cheese', '0', 0.00, 0.00, 365.00, 10.00, 10.00, ' Ar00001', 'Arla', NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:30'),
(1127, 'FMD174220', 'Arla Sandwich Slices (200 gm)', 'Egg and dairy provide protein, calcium, and essential nutrients for health 48', '7', 'Egg & Dairy', '11', 'Cheese', '0', 0.00, 0.00, 315.00, 10.00, 10.00, ' Ar00001', 'Arla', NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:30'),
(1128, 'FMD192219', 'Feta Cheese (200 gm)', 'Egg and dairy provide protein, calcium, and essential nutrients for health 52', '7', 'Egg & Dairy', '11', 'Cheese', '0', 0.00, 0.00, 530.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:30'),
(1129, 'FMD192074', 'Yak Cheddar (200 gm)', 'Egg and dairy provide protein, calcium, and essential nutrients for health 53', '7', 'Egg & Dairy', '11', 'Cheese', '0', 0.00, 0.00, 790.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:30'),
(1130, 'FMD192076', 'Old Belkot (Cheddar)', 'Egg and dairy provide protein, calcium, and essential nutrients for health 54', '7', 'Egg & Dairy', '11', 'Cheese', '0', 0.00, 0.00, 590.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:30'),
(1131, 'FMD189234', 'Brie Cheese (125 gm)', 'Egg and dairy provide protein, calcium, and essential nutrients for health 55', '7', 'Egg & Dairy', '11', 'Cheese', '0', 0.00, 0.00, 540.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:30'),
(1132, 'FMD189341', 'Amul Cheese Cubes (200 gm)', 'Egg and dairy provide protein, calcium, and essential nutrients for health 56', '7', 'Egg & Dairy', '11', 'Cheese', '0', 0.00, 0.00, 220.00, 10.00, 10.00, ' Am00002', 'Amul', NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:30'),
(1133, 'FMD215859', 'Vitali Le Benfette Mortadella Slice 100G', 'Egg and dairy provide protein, calcium, and essential nutrients for health 57', '7', 'Egg & Dairy', '11', 'Cheese', '0', 0.00, 0.00, 500.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:30'),
(1134, 'FMD369519', 'Cheese', 'Egg and dairy provide protein, calcium, and essential nutrients for health 58', '7', 'Egg & Dairy', '11', 'Cheese', '0', 0.00, 0.00, 265.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:30'),
(1135, 'FMD233182', 'Whole Chicken -1660 Gm', 'Egg and dairy provide protein, calcium, and essential nutrients for health 59', '7', 'Egg & Dairy', '11', 'Cheese', '0', 0.00, 0.00, 1096.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:30'),
(1136, 'FMD174062', 'Brown Bread Small', 'Bakery products are made from flour, offering carbohydrates, flavor, and energy 28', '2', 'Bakery', '1', 'Fresh Bakes', '0', 0.00, 0.00, 75.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:30'),
(1137, 'FMD174007', 'Apple ( Fuzi A)- (1 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 1', '8', 'Fruits & Vegetables', '12', 'Fruits', '0', 0.00, 0.00, 390.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:30'),
(1138, 'FMD174008', 'Apple ( Medium Fuzi)- (1 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 2', '8', 'Fruits & Vegetables', '12', 'Fruits', '0', 0.00, 0.00, 315.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:30'),
(1139, 'FMD174009', 'Apple (Green) - (1 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 3', '8', 'Fruits & Vegetables', '12', 'Fruits', '0', 0.00, 0.00, 490.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:30'),
(1140, 'FMD174010', 'Began Fuli Mango - (1 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 4', '8', 'Fruits & Vegetables', '12', 'Fruits', '0', 0.00, 0.00, 180.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:30'),
(1141, 'FMD174011', 'Junar Malta - (1 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 5', '8', 'Fruits & Vegetables', '12', 'Fruits', '0', 0.00, 0.00, 290.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:30'),
(1142, 'FMD174012', 'Kerar Mango- (1 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 6', '8', 'Fruits & Vegetables', '12', 'Fruits', '0', 0.00, 0.00, 240.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:30'),
(1143, 'FMD174013', 'Kiwi ( Nepali )- (1 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 7', '8', 'Fruits & Vegetables', '12', 'Fruits', '0', 0.00, 0.00, 615.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:30');
INSERT INTO `products` (`id`, `product_code`, `product_name`, `product_description`, `category_id`, `category_name`, `subcategory_id`, `subcategory_name`, `delivery_target_days`, `discount`, `actual_price`, `sell_price`, `available_quantity`, `stock_quantity`, `brand_id`, `brand_name`, `primary_image`, `created_at`, `updated_at`) VALUES
(1144, 'FMD174014', 'Litchi  - (1kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 8', '8', 'Fruits & Vegetables', '12', 'Fruits', '0', 0.00, 0.00, 300.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:30'),
(1145, 'FMD174015', 'Mango Gulab Khas - (1 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 9', '8', 'Fruits & Vegetables', '12', 'Fruits', '0', 0.00, 0.00, 300.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:30'),
(1146, 'FMD174016', 'Mango Malda - (1 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 10', '8', 'Fruits & Vegetables', '12', 'Fruits', '0', 0.00, 0.00, 120.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:30'),
(1147, 'FMD174063', 'Mini Doughnut', 'Bakery products are made from flour, offering carbohydrates, flavor, and energy 29', '2', 'Bakery', '1', 'Fresh Bakes', '0', 0.00, 0.00, 5.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:30'),
(1148, 'FMD174017', 'Papaya (Around, (2 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 11', '8', 'Fruits & Vegetables', '12', 'Fruits', '0', 0.00, 0.00, 340.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:30'),
(1149, 'FMD174018', 'Pineapple (Per pc)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 12', '8', 'Fruits & Vegetables', '12', 'Fruits', '0', 0.00, 0.00, 240.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:30'),
(1150, 'FMD174019', 'Pomegranate( Anar ) Big size - (1 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 13', '8', 'Fruits & Vegetables', '12', 'Fruits', '0', 0.00, 0.00, 440.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:30'),
(1151, 'FMD174020', 'Watermelon ( Around 2 kg )', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 14', '8', 'Fruits & Vegetables', '12', 'Fruits', '0', 0.00, 0.00, 240.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:30'),
(1152, 'FMD174027', 'Watermelon ( Around 4.9 kg )', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 15', '8', 'Fruits & Vegetables', '12', 'Fruits', '0', 0.00, 0.00, 602.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:30'),
(1153, 'FMD173992', 'Banana  ( Jahaji) - (1 Dozen)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 16', '8', 'Fruits & Vegetables', '12', 'Fruits', '0', 0.00, 0.00, 160.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:30'),
(1154, 'FMD188101', 'Avocado (1 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 17', '8', 'Fruits & Vegetables', '12', 'Fruits', '0', 0.00, 0.00, 590.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:30'),
(1155, 'FMD188102', 'Banana Local (1 dozen)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 18', '8', 'Fruits & Vegetables', '12', 'Fruits', '0', 0.00, 0.00, 165.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:30'),
(1156, 'FMD188103', 'HS Banana Chini Champa (1 dozen)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 19', '8', 'Fruits & Vegetables', '12', 'Fruits', '0', 0.00, 0.00, 150.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:30'),
(1157, 'FMD189019', 'Green Kiwi (1 Kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 20', '8', 'Fruits & Vegetables', '12', 'Fruits', '0', 0.00, 0.00, 440.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:30'),
(1158, 'FMD174064', 'Multigrain Bread Loaf', 'Bakery products are made from flour, offering carbohydrates, flavor, and energy 30', '2', 'Bakery', '1', 'Fresh Bakes', '0', 0.00, 0.00, 125.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:30'),
(1159, 'FMD189020', 'Pomegranate ( Anar ) Small size', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 21', '8', 'Fruits & Vegetables', '12', 'Fruits', '0', 0.00, 0.00, 370.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:30'),
(1160, 'FMD191085', 'Sweet Lemon ( Mausam)  (1 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 23', '8', 'Fruits & Vegetables', '12', 'Fruits', '0', 0.00, 0.00, 200.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:30'),
(1161, 'FMD198486', 'Apple (Rolpa) - (1 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 24', '8', 'Fruits & Vegetables', '12', 'Fruits', '0', 0.00, 0.00, 240.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:30'),
(1162, 'FMD198556', 'Apple Red (Mustang) (1 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 25', '8', 'Fruits & Vegetables', '12', 'Fruits', '0', 0.00, 0.00, 340.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:30'),
(1163, 'FMD198557', 'Naspati White(White Pearl)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 26', '8', 'Fruits & Vegetables', '12', 'Fruits', '0', 0.00, 0.00, 390.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:30'),
(1164, 'FMD198558', 'Dragon Fruit (1 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 27', '8', 'Fruits & Vegetables', '12', 'Fruits', '0', 0.00, 0.00, 690.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:30'),
(1165, 'FMD198561', 'Blackberry Frozen (250 gm)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 28', '8', 'Fruits & Vegetables', '12', 'Fruits', '0', 0.00, 0.00, 465.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:30'),
(1166, 'FMD198562', 'Red Kiwi (1 Kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 29', '8', 'Fruits & Vegetables', '12', 'Fruits', '0', 0.00, 0.00, 540.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:30'),
(1167, 'FMD198563', 'Strawberry Frozen (1 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 30', '8', 'Fruits & Vegetables', '12', 'Fruits', '0', 0.00, 0.00, 590.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:30'),
(1168, 'FMD201301', 'Watermelon (Around 3 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 31', '8', 'Fruits & Vegetables', '12', 'Fruits', '0', 0.00, 0.00, 365.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:31'),
(1169, 'FMD174065', 'Plain Croissant', 'Bakery products are made from flour, offering carbohydrates, flavor, and energy 31', '2', 'Bakery', '1', 'Fresh Bakes', '0', 0.00, 0.00, 60.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:31'),
(1170, 'FMD205523', 'Apple Jumli (1 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 32', '8', 'Fruits & Vegetables', '12', 'Fruits', '0', 0.00, 0.00, 380.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:31'),
(1171, 'FMD205524', 'Strawberry Fresh (300 gm)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 33', '8', 'Fruits & Vegetables', '12', 'Fruits', '0', 0.00, 0.00, 290.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:31'),
(1172, 'FMD222849', 'Strawberry (300 gm)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 35', '8', 'Fruits & Vegetables', '12', 'Fruits', '0', 0.00, 0.00, 290.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:31'),
(1173, 'FMD293233', 'Papaya (Around 1.83 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 36', '8', 'Fruits & Vegetables', '12', 'Fruits', '0', 0.00, 0.00, 310.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:31'),
(1174, 'FMD293284', 'Papaya (1.8 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 37', '8', 'Fruits & Vegetables', '12', 'Fruits', '0', 0.00, 0.00, 305.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:31'),
(1175, 'FMD293285', 'Watermelon (3.4 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 38', '8', 'Fruits & Vegetables', '12', 'Fruits', '0', 0.00, 0.00, 415.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:31'),
(1176, 'FMD245288', 'Wellness Frozen Strawberry (1 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 39', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 590.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:31'),
(1177, 'FMD254489', 'Machhe Khursani (500 gm)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 40', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 65.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:31'),
(1178, 'FMD266421', 'Fresh Corn (1 Kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 41', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 260.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:31'),
(1179, 'FMD317372', 'Spinach', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 42', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 140.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:31'),
(1180, 'FMD215187', 'Pamper Pants  16s (XXL)', 'Basic description of Baby Care 5', '1', 'Baby Care', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 628.00, 10.00, 10.00, ' Pa00001', 'Pamper', NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:31'),
(1181, 'FMD174066', 'Plain Doughnut', 'Bakery products are made from flour, offering carbohydrates, flavor, and energy 32', '2', 'Bakery', '1', 'Fresh Bakes', '0', 0.00, 0.00, 20.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:31'),
(1182, 'FMD342737', 'Supervores Pumpkin (1.8 Gm)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 43', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 170.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:31'),
(1183, 'FMD353615', 'Carrot (Per Kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 44', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 140.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:31'),
(1184, 'FMD379748', 'Red Potato (1 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 45', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 80.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:31'),
(1185, 'FMD385428', 'Tama (350 gm) Glass Jar', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 46', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 240.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:31'),
(1186, 'FMD404279', 'Pumpkin (1.28 KG)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 47', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 118.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:31'),
(1187, 'FMD408713', 'Supervores Pumpkin (1 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 48', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 90.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:31'),
(1188, 'FMD209711', 'Sweet Potato (1 Kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 49', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 110.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:31'),
(1189, 'FMD205010', 'Asparagus (250 gm)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 50', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 570.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:32'),
(1190, 'FMD205513', 'Akabare Khursani (1 Pkt)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 51', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 200.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:52', '2024-09-15 23:39:32'),
(1191, 'FMD205514', 'Arjuna Pumpkin (1 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 52', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 140.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:32'),
(1192, 'FMD174067', 'White Bread Small', 'Bakery products are made from flour, offering carbohydrates, flavor, and energy 33', '2', 'Bakery', '1', 'Fresh Bakes', '0', 0.00, 0.00, 65.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:32'),
(1193, 'FMD205515', 'Broccoli (1 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 53', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 240.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:32'),
(1194, 'FMD205516', 'Cauliflower (1 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 54', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 190.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:32'),
(1195, 'FMD205517', 'Ginger Gorkha (500 gm)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 55', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 90.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:32'),
(1196, 'FMD205519', 'Taro Pidalu (1 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 57', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 140.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:32'),
(1197, 'FMD205520', 'Raddish (1 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 58', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 75.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:32'),
(1198, 'FMD205521', 'Turmeric Fresh (1 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 59', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 240.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:32'),
(1199, 'FMD205522', 'Yam (1 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 60', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 86.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:32'),
(1200, 'FMD198554', 'Broccoli (500 gm)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 61', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 110.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:32'),
(1201, 'FMD198555', 'Pidalu (Co-Co Yaam) (1 Kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 62', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 100.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:32'),
(1202, 'FMD198564', 'Potato Jumli White (1 Kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 63', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 110.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:32'),
(1203, 'FMD174068', 'Chocolate Chips Cookies', 'Bakery products are made from flour, offering carbohydrates, flavor, and energy 34', '2', 'Bakery', '1', 'Fresh Bakes', '0', 0.00, 0.00, 100.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:32'),
(1204, 'FMD198560', 'Colour Capsicum (500 gm)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 64', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 290.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:32'),
(1205, 'FMD185688', 'Local Red Onion (per kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 65', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 140.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:32'),
(1206, 'FMD187955', 'Sweet Corn Frozen (500 gm)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 66', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 190.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:32'),
(1207, 'FMD188104', 'Yard Beans (500 gm )', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 67', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 65.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:32'),
(1208, 'FMD188105', 'Karela Bitter Gourd (500 gm)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 68', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 65.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:32'),
(1209, 'FMD188106', 'Lauka ( Bottle Gourd) (1 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 69', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 100.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:32'),
(1210, 'FMD188185', 'Ghiraula (Sponge Gourd) (1 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 70', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 140.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:32'),
(1211, 'FMD188186', 'Ladyfinger (500 gm)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 71', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 90.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:32'),
(1212, 'FMD188187', 'Potato Purple (1 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 72', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 290.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:32'),
(1213, 'FMD188188', 'Potato Sanga (1 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 73', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 110.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:32'),
(1214, 'FMD174069', 'French Bread', 'Bakery products are made from flour, offering carbohydrates, flavor, and energy 35', '2', 'Bakery', '1', 'Fresh Bakes', '0', 0.00, 0.00, 80.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:32'),
(1215, 'FMD188194', 'Potato Gaurishanker (1 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 74', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 110.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:32'),
(1216, 'FMD188199', 'Baby Potato (1 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 75', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 80.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:32'),
(1217, 'FMD188210', 'Green Soyabean (1 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 76', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 180.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:32'),
(1218, 'FMD188216', 'Lemon (1 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 77', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 210.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:32'),
(1219, 'FMD188221', 'Chasme Lemon (1 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 78', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 110.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:32'),
(1220, 'FMD188222', 'Green Chilly (200 gm)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 79', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 30.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:32'),
(1221, 'FMD188223', 'Shitake Mushroom (200 gm)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 80', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 230.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:32'),
(1222, 'FMD188233', 'Cherry Tomato (500 gm)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 81', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 215.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:32'),
(1223, 'FMD188234', 'Tama (500 gm) Bottle', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 82', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 240.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:32'),
(1224, 'FMD183384', 'Cabbage (1.1 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 83', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 100.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:32'),
(1225, 'FMD174070', 'Italian Bread', 'Bakery products are made from flour, offering carbohydrates, flavor, and energy 36', '2', 'Bakery', '1', 'Fresh Bakes', '0', 0.00, 0.00, 90.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:32'),
(1226, 'FMD188987', 'Akabare Khorsani (200 gm)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 84', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 90.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:32'),
(1227, 'FMD188988', 'Potato (1 Dhani)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 85', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 210.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:32'),
(1228, 'FMD188989', 'Dry Onion - (1  Dhak)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 86', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 340.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:32'),
(1229, 'FMD188990', 'Potato - Normal - (1 Dhak)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 87', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 440.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:32'),
(1230, 'FMD188991', 'Baby Potato (Per/kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 88', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 80.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:32'),
(1231, 'FMD173993', 'Bhanta (Eggplant) (500 gm)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 89', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 45.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:32'),
(1232, 'FMD173994', 'Bodi (Green Bean) - (500 gm)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 90', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 80.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:32'),
(1233, 'FMD173996', 'Bhede Khursani (Capsicum) (500 gm)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 92', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 110.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:33'),
(1234, 'FMD173997', 'Bhindi (Lady’s Finger) (500 gm)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 93', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 45.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:33'),
(1235, 'FMD173999', 'Cauliflower (500 gm)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 95', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 70.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:33'),
(1236, 'FMD174252', 'Cake Mix, Strawberry (500 gm)- American Garden', 'Basic description of Baking & Cooking 1', '3', 'Baking & Cooking', '2', 'Baking Mixes', '0', 0.00, 0.00, 350.00, 10.00, 10.00, ' Am00001', 'American Garden', NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:33'),
(1237, 'FMD174000', 'Gajar ( Carrot) (500 gm)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 96', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 135.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:33'),
(1238, 'FMD174001', 'Hariyo Kursani (Green Chilli) (500 gm)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 97', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 70.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:33'),
(1239, 'FMD174002', 'Kakra (Cucumber) - Local Bhaktapure , (1 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 98', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 90.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:33'),
(1240, 'FMD174003', 'Karela ( Bitter Gourd) (500 gm)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 99', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 55.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:33'),
(1241, 'FMD174004', 'Mula ( Raddish) (1 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 100', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 50.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:33'),
(1242, 'FMD174005', 'Parwal (Pointed Gourd ) (500 gm)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 101', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 35.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:33'),
(1243, 'FMD174006', 'Tomato-Normal (1 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 102', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 80.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:33'),
(1244, 'FMD174046', 'Asparagus Selected (200 gm)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 103', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 290.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:33'),
(1245, 'FMD174047', 'Button Mushroom (200 gm)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 104', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 130.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:33'),
(1246, 'FMD174028', 'Hariyo Farsi (1 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 105', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 110.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:33'),
(1247, 'FMD174253', 'Cake Mix, Chocolate (500 gm)- American Garden', 'Basic description of Baking & Cooking 2', '3', 'Baking & Cooking', '2', 'Baking Mixes', '0', 0.00, 0.00, 350.00, 10.00, 10.00, ' Am00001', 'American Garden', NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:33'),
(1248, 'FMD174029', 'Cabbage (1 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 106', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 80.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:33'),
(1249, 'FMD174030', 'Green Beans (500 gm)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 107', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 90.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:33'),
(1250, 'FMD174031', 'Red Pumpkin (1 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 108', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 120.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:33'),
(1251, 'FMD174032', 'Cucumber (1 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 109', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 80.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:33'),
(1252, 'FMD174033', 'Green Pumpkin (1 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 110', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 110.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:33'),
(1253, 'FMD174034', 'Beetroot (500 gm)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 111', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 115.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:33'),
(1254, 'FMD174035', 'Carrot (500 gm)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 112', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 85.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:33'),
(1255, 'FMD174036', 'Tomato (1 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 113', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 140.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:33'),
(1256, 'FMD174022', 'Flat Mushroom (Oyster) (500 gm)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 115', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 190.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:33'),
(1257, 'FMD174023', 'Pakeko Farsi (Raddish Pumpkin) (1 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 116', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 60.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:33'),
(1258, 'FMD174254', 'Cake Mix, Vanilla (500 gm)- American Garden', 'Basic description of Baking & Cooking 3', '3', 'Baking & Cooking', '2', 'Baking Mixes', '0', 0.00, 0.00, 350.00, 10.00, 10.00, ' Am00001', 'American Garden', NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:33'),
(1259, 'FMD174024', 'Round Mushroom (Button ) (500 gm)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 117', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 265.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:33'),
(1260, 'FMD174025', 'Chukandar (Beet Root ) (500 gm)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 118', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 110.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:33'),
(1261, 'FMD174026', 'Kagati (Lemon) (Big Size) (500 gm)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 119', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 160.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:33'),
(1262, 'FMD173991', 'Ghiu Simi ( String Beans) (500 gm)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 120', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 70.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:33'),
(1263, 'FMD174192', 'Special Masala Tofu (200 gm)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 121', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 80.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:33'),
(1264, 'FMD174193', 'Special Tofu (200 gm)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 122', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 65.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:33'),
(1265, 'FMD174194', 'Tofu (200 gm)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 123', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 80.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:33'),
(1266, 'FMD175518', 'Ginger (500 gm)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 124', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 55.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:33'),
(1267, 'FMD175519', 'Potato - Normal (Per/kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 125', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 75.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:33'),
(1268, 'FMD175520', 'Dry Onion (Per/kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 126', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 60.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:33'),
(1269, 'FMD174255', 'Cake Mix, Orange(500 gm)- American Garden', 'Basic description of Baking & Cooking 4', '3', 'Baking & Cooking', '2', 'Baking Mixes', '0', 0.00, 0.00, 350.00, 10.00, 10.00, ' Am00001', 'American Garden', NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:33'),
(1270, 'FMD175801', 'Dry Lasun (Chinese) 500 gm', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 127', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 165.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:33'),
(1271, 'FMD175802', 'Dry Lasun (Nepali) 500 gm', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 128', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 165.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:33'),
(1272, 'FMD177393', 'Baby Amaranth (300 gm) (?g??? ???)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 129', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 65.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:34'),
(1273, 'FMD177394', 'Brinjal (500 gm)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 130', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 65.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:34'),
(1274, 'FMD177395', 'Mini Cucumber (500 gm)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 131', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 110.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:34'),
(1275, 'FMD177397', 'Farsi Ko Munta (500 gm)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 132', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 80.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:34'),
(1276, 'FMD177398', 'Rayo Saag (200 gm) (???????)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 133', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 65.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:34'),
(1277, 'FMD177399', 'Spinach (300 gm)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 134', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 50.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:34'),
(1278, 'FMD177400', 'Sweet Potato (500 gm)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 135', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 100.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:34'),
(1279, 'FMD177401', 'Garlic (1 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 136', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 340.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:34'),
(1280, 'FMD174256', 'Pancake & Waffle (460 gm)- American Garden', 'Basic description of Baking & Cooking 5', '3', 'Baking & Cooking', '2', 'Baking Mixes', '0', 0.00, 0.00, 350.00, 10.00, 10.00, ' Am00001', 'American Garden', NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:34'),
(1281, 'FMD177402', 'Hariyo Bhatamas (500 gm)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 137', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 110.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:34'),
(1282, 'FMD177403', 'Long Green Pepper (200 gm)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 138', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 30.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:34'),
(1283, 'FMD177404', 'Potato Mustang (1 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 139', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 140.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:34'),
(1284, 'FMD177405', 'Coriander (200 gm)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 140', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 90.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:34'),
(1285, 'FMD177406', 'Kale Leves (100 gm)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 141', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 90.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:34'),
(1286, 'FMD177407', 'Rocket Leave (100 gm)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 142', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 80.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:34'),
(1287, 'FMD177408', 'Spring Onion (1 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 143', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 190.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:34'),
(1288, 'FMD177820', 'Tomatoes (Acidic) (1 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 144', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 150.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:34'),
(1289, 'FMD177821', 'Carrot (1 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 145', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 150.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:34'),
(1290, 'FMD177823', 'Tomato Cherry (1 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 147', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 80.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:34'),
(1291, 'FMD215188', 'Pampers Baby Diaper Pants 76s Count (M)', 'Basic description of Baby Care 6', '1', 'Baby Care', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 1828.00, 10.00, 10.00, ' Pa00001', 'Pamper', NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:34'),
(1292, 'FMD191082', 'Trust Icing Sugar -1 kg', 'Basic description of Baking & Cooking 6', '3', 'Baking & Cooking', '2', 'Baking Mixes', '0', 0.00, 0.00, 200.00, 10.00, 10.00, ' Tr00001', 'Trust', NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:34'),
(1293, 'FMD177824', 'Bitter Gourd (1 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 148', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 45.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:34'),
(1294, 'FMD177825', 'Bottle Gourd (1 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 149', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 90.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:34'),
(1295, 'FMD177826', 'Chilli (1 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 150', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 150.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:34'),
(1296, 'FMD177828', 'Okra (1 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 152', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 90.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:34'),
(1297, 'FMD177829', 'Pumpkin (1 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 153', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 90.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:34'),
(1298, 'FMD177830', 'Sponge Gourd (1 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 154', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 65.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:34'),
(1299, 'FMD177831', 'Brinjal (1 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 155', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 80.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:34'),
(1300, 'FMD177833', 'Capsicum (1 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 157', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 140.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:34'),
(1301, 'FMD177834', 'Parwal (1 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 158', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 110.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:34'),
(1302, 'FMD177835', 'Beans (1 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 159', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 100.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:34'),
(1303, 'FMD191083', 'Weikfield Drinking Chocolate (500 gm)', 'Basic description of Baking & Cooking 7', '3', 'Baking & Cooking', '2', 'Baking Mixes', '0', 0.00, 0.00, 490.00, 10.00, 10.00, ' We00001', 'Weikfield', NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:34'),
(1304, 'FMD177836', 'Coriander (Bunch)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 160', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 45.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:34'),
(1305, 'FMD177837', 'Long Beans (1 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 161', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 90.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:34'),
(1306, 'FMD177845', 'Tomatoes (Salad) (1 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 169', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 280.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:34'),
(1307, 'FMD177865', 'Lettuce (Bunch)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 179', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 55.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:34'),
(1308, 'FMD177866', 'Beet Root (1 Kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 180', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 140.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:34'),
(1309, 'FMD177867', 'Celery (Bunch)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 181', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 30.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:34'),
(1310, 'FMD177868', 'Gantey Mula (Bunch)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 182', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 85.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:34'),
(1311, 'FMD177869', 'Pakchoy (Bunch)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 183', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 55.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:35'),
(1312, 'FMD177870', 'Rayo (Bunch)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 184', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 75.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:35'),
(1313, 'FMD177871', 'Spring Garlic (Bunch)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 185', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 40.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:35');
INSERT INTO `products` (`id`, `product_code`, `product_name`, `product_description`, `category_id`, `category_name`, `subcategory_id`, `subcategory_name`, `delivery_target_days`, `discount`, `actual_price`, `sell_price`, `available_quantity`, `stock_quantity`, `brand_id`, `brand_name`, `primary_image`, `created_at`, `updated_at`) VALUES
(1314, 'FMD283472', 'Druk Mango Slice in Syrup 850 gms', 'Basic description of Baking & Cooking 8', '3', 'Baking & Cooking', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 370.00, 10.00, 10.00, ' Te00001', 'Test Brand 1', NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:35'),
(1315, 'FMD177872', 'Spring Onion (Bunch)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 186', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 40.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:35'),
(1316, 'FMD177873', 'Neuro (Bunch)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 187', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 60.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:35'),
(1317, 'FMD177874', 'Snake Gourd (1 Kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 188', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 90.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:35'),
(1318, 'FMD177875', 'Sweet Potatoes (1 Kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 189', '8', 'Fruits & Vegetables', '13', 'Regular Vegetables', '0', 0.00, 0.00, 150.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:35'),
(1319, 'FMD174421', 'Hariyo Pyaz (Per Bunch)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 191', '8', 'Fruits & Vegetables', '14', 'Green Leafy Vegetables', '0', 0.00, 0.00, 30.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:35'),
(1320, 'FMD174037', 'Celery', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 192', '8', 'Fruits & Vegetables', '14', 'Green Leafy Vegetables', '0', 0.00, 0.00, 140.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:35'),
(1321, 'FMD174038', 'Dhaniya (Coriander)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 193', '8', 'Fruits & Vegetables', '14', 'Green Leafy Vegetables', '0', 0.00, 0.00, 90.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:35'),
(1322, 'FMD174039', 'Gante Mula (Red)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 194', '8', 'Fruits & Vegetables', '14', 'Green Leafy Vegetables', '0', 0.00, 0.00, 70.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:35'),
(1323, 'FMD174040', 'Hariyo Lasun (Green Garlic)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 195', '8', 'Fruits & Vegetables', '14', 'Green Leafy Vegetables', '0', 0.00, 0.00, 80.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:35'),
(1324, 'FMD174041', 'Hariyo Pyaaj (Spring Onion)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 196', '8', 'Fruits & Vegetables', '14', 'Green Leafy Vegetables', '0', 0.00, 0.00, 80.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:35'),
(1325, 'FMD283473', 'Druk Pineapple Slice in Syrup 850 gms', 'Basic description of Baking & Cooking 9', '3', 'Baking & Cooking', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 385.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:35'),
(1326, 'FMD174042', 'Jiri Ko Saag (Lettuce)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 197', '8', 'Fruits & Vegetables', '14', 'Green Leafy Vegetables', '0', 0.00, 0.00, 140.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:35'),
(1327, 'FMD174043', 'Palak  (Spinach)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 198', '8', 'Fruits & Vegetables', '14', 'Green Leafy Vegetables', '0', 0.00, 0.00, 70.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:35'),
(1328, 'FMD174044', 'Pudina ( Mint)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 199', '8', 'Fruits & Vegetables', '14', 'Green Leafy Vegetables', '0', 0.00, 0.00, 50.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:35'),
(1329, 'FMD174045', 'Rayo Saag ( Mustard Green)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 200', '8', 'Fruits & Vegetables', '14', 'Green Leafy Vegetables', '0', 0.00, 0.00, 70.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:35'),
(1330, 'FMD188992', 'Methi Saag (Bunch)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 201', '8', 'Fruits & Vegetables', '14', 'Green Leafy Vegetables', '0', 0.00, 0.00, 40.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:35'),
(1331, 'FMD188993', 'Parsley (Bunch)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 202', '8', 'Fruits & Vegetables', '14', 'Green Leafy Vegetables', '0', 0.00, 0.00, 150.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:35'),
(1332, 'FMD188240', 'Mix Lettuce (200 gm)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 203', '8', 'Fruits & Vegetables', '14', 'Green Leafy Vegetables', '0', 0.00, 0.00, 140.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:35'),
(1333, 'FMD191084', 'White Gante mula', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 204', '8', 'Fruits & Vegetables', '14', 'Green Leafy Vegetables', '0', 0.00, 0.00, 50.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:35'),
(1334, 'FMD192228', 'Pakchoy (200 gm)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 205', '8', 'Fruits & Vegetables', '14', 'Green Leafy Vegetables', '0', 0.00, 0.00, 65.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:35'),
(1335, 'FMD198487', 'Kimchi (200 gm)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 206', '8', 'Fruits & Vegetables', '14', 'Green Leafy Vegetables', '0', 0.00, 0.00, 160.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:35'),
(1336, 'FMD283459', 'Amul Fresh Cream 1 ltr', 'Basic description of Baking & Cooking 10', '3', 'Baking & Cooking', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 640.00, 10.00, 10.00, ' Am00002', 'Amul', NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:35'),
(1337, 'FMD345935', 'Green Peas 1Kg-Yogo Fresh-N&H', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 208', '8', 'Fruits & Vegetables', '14', 'Green Leafy Vegetables', '0', 0.00, 0.00, 260.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:35'),
(1338, 'FMD301631', 'Rayo (200 gm)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 209', '8', 'Fruits & Vegetables', '14', 'Green Leafy Vegetables', '0', 0.00, 0.00, 30.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:35'),
(1339, 'FMD256910', 'Rocket Leave (100gm)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 210', '8', 'Fruits & Vegetables', '15', 'Ozonated Vegetables', '0', 0.00, 0.00, 50.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:35'),
(1340, 'FMD254535', 'Machhey Khursani (Pointed Pepper) (Half kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 211', '8', 'Fruits & Vegetables', '15', 'Ozonated Vegetables', '0', 0.00, 0.00, 60.00, 10.00, 10.00, ' Na00001', 'Nagro', NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:35'),
(1341, 'FMD293975', 'Tomatoes (Acidic) (Half kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 213', '8', 'Fruits & Vegetables', '15', 'Ozonated Vegetables', '0', 0.00, 0.00, 55.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:35'),
(1342, 'FMD305285', 'Tomato (Half Kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 214', '8', 'Fruits & Vegetables', '15', 'Ozonated Vegetables', '0', 0.00, 0.00, 70.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:35'),
(1343, 'FMD358293', 'Bottle Gourd (2.5 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 215', '8', 'Fruits & Vegetables', '15', 'Ozonated Vegetables', '0', 0.00, 0.00, 215.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:35'),
(1344, 'FMD349998', 'Cucumber Local (1.2 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 216', '8', 'Fruits & Vegetables', '15', 'Ozonated Vegetables', '0', 0.00, 0.00, 146.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:35'),
(1345, 'FMD342315', 'Lauka (1.7 gm)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 217', '8', 'Fruits & Vegetables', '15', 'Ozonated Vegetables', '0', 0.00, 0.00, 143.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:36'),
(1346, 'FMD211306', 'Bhindi (Lady\'s Finger)- 500 gm', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 218', '8', 'Fruits & Vegetables', '15', 'Ozonated Vegetables', '0', 0.00, 0.00, 62.00, 10.00, 10.00, ' Na00001', 'Nagro', NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:36'),
(1347, 'FMD283407', 'Hershey\'s Chocolate Syrup 680 gms', 'Basic description of Baking & Cooking 11', '3', 'Baking & Cooking', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 555.00, 10.00, 10.00, ' He00001', 'Hersheys', NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:36'),
(1348, 'FMD206617', 'Cucumber Hybrid (1 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 219', '8', 'Fruits & Vegetables', '15', 'Ozonated Vegetables', '0', 0.00, 0.00, 80.00, 10.00, 10.00, ' Na00001', 'Nagro', NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:36'),
(1349, 'FMD206618', 'Sweet Potato (Half kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 220', '8', 'Fruits & Vegetables', '15', 'Ozonated Vegetables', '0', 0.00, 0.00, 70.00, 10.00, 10.00, ' Na00001', 'Nagro', NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:36'),
(1350, 'FMD196804', 'Coriander (Bunch) 200 gm', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 222', '8', 'Fruits & Vegetables', '15', 'Ozonated Vegetables', '0', 0.00, 0.00, 85.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:36'),
(1351, 'FMD196806', 'French Beans (Half kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 224', '8', 'Fruits & Vegetables', '15', 'Ozonated Vegetables', '0', 0.00, 0.00, 70.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:36'),
(1352, 'FMD196807', 'Potato Red Grades (1 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 225', '8', 'Fruits & Vegetables', '15', 'Ozonated Vegetables', '0', 0.00, 0.00, 85.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:36'),
(1353, 'FMD196808', 'Coriander (200 gm) Bunch', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 226', '8', 'Fruits & Vegetables', '15', 'Ozonated Vegetables', '0', 0.00, 0.00, 85.00, 10.00, 10.00, ' Na00001', 'Nagro', NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:36'),
(1354, 'FMD196809', 'Okra (Half Kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 227', '8', 'Fruits & Vegetables', '15', 'Ozonated Vegetables', '0', 0.00, 0.00, 50.00, 10.00, 10.00, ' Na00001', 'Nagro', NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:36'),
(1355, 'FMD196810', 'Spinach (Bunch)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 228', '8', 'Fruits & Vegetables', '15', 'Ozonated Vegetables', '0', 0.00, 0.00, 40.00, 10.00, 10.00, ' Na00001', 'Nagro', NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:36'),
(1356, 'FMD192049', 'Colored Capsicum (Red/ Green) (Half kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 233', '8', 'Fruits & Vegetables', '15', 'Ozonated Vegetables', '0', 0.00, 0.00, 375.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:36'),
(1357, 'FMD192050', 'Traffic Light Pepper (Red, Yellow, Green) (1 Pkt)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 234', '8', 'Fruits & Vegetables', '15', 'Ozonated Vegetables', '0', 0.00, 0.00, 375.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:36'),
(1358, 'FMD283408', 'Hershey\'s Strawberry Syrup 623 gms', 'Basic description of Baking & Cooking 12', '3', 'Baking & Cooking', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 550.00, 10.00, 10.00, ' He00001', 'Hersheys', NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:36'),
(1359, 'FMD180400', 'Button Mushroom (1 Kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 237', '8', 'Fruits & Vegetables', '15', 'Ozonated Vegetables', '0', 0.00, 0.00, 470.00, 10.00, 10.00, ' Na00001', 'Nagro', NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:36'),
(1360, 'FMD180401', 'Ginger( peeled)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 238', '8', 'Fruits & Vegetables', '15', 'Ozonated Vegetables', '0', 0.00, 0.00, 100.00, 10.00, 10.00, ' Na00001', 'Nagro', NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:36'),
(1361, 'FMD180402', 'King Oyster Mushroom (Pkt)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 239', '8', 'Fruits & Vegetables', '15', 'Ozonated Vegetables', '0', 0.00, 0.00, 240.00, 10.00, 10.00, ' Na00001', 'Nagro', NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:36'),
(1362, 'FMD180403', 'Garlic peeled (Pkt)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 240', '8', 'Fruits & Vegetables', '15', 'Ozonated Vegetables', '0', 0.00, 0.00, 80.00, 10.00, 10.00, ' Na00001', 'Nagro', NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:36'),
(1363, 'FMD180404', 'Oyster Mushroom (1 Kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 241', '8', 'Fruits & Vegetables', '15', 'Ozonated Vegetables', '0', 0.00, 0.00, 290.00, 10.00, 10.00, ' Na00001', 'Nagro', NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:36'),
(1364, 'FMD180409', 'Machey (Pointed Pepper) (Half kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 242', '8', 'Fruits & Vegetables', '15', 'Ozonated Vegetables', '0', 0.00, 0.00, 60.00, 10.00, 10.00, ' Na00001', 'Nagro', NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:36'),
(1365, 'FMD180573', 'Pumpkin (1.32 Kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 243', '8', 'Fruits & Vegetables', '15', 'Ozonated Vegetables', '0', 0.00, 0.00, 115.40, 10.00, 10.00, ' Na00001', 'Nagro', NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:36'),
(1366, 'FMD182407', 'Mint (Bunch)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 244', '8', 'Fruits & Vegetables', '15', 'Ozonated Vegetables', '0', 0.00, 0.00, 35.00, 10.00, 10.00, ' Na00001', 'Nagro', NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:36'),
(1367, 'FMD182408', 'Dry Garlic (1 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 245', '8', 'Fruits & Vegetables', '15', 'Ozonated Vegetables', '0', 0.00, 0.00, 260.00, 10.00, 10.00, ' Na00001', 'Nagro', NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:36'),
(1368, 'FMD182409', 'Dry Ginger (1 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 246', '8', 'Fruits & Vegetables', '15', 'Ozonated Vegetables', '0', 0.00, 0.00, 125.00, 10.00, 10.00, ' Na00001', 'Nagro', NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:36'),
(1369, 'FMD291881', 'Flexi Cooking Cream', 'Basic description of Baking & Cooking 13', '3', 'Baking & Cooking', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 455.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:36'),
(1370, 'FMD182410', 'Onion (1 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 247', '8', 'Fruits & Vegetables', '15', 'Ozonated Vegetables', '0', 0.00, 0.00, 60.00, 10.00, 10.00, ' Na00001', 'Nagro', NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:36'),
(1371, 'FMD182412', 'Asparagus (1 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 249', '8', 'Fruits & Vegetables', '15', 'Ozonated Vegetables', '0', 0.00, 0.00, 490.00, 10.00, 10.00, ' Na00001', 'Nagro', NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:36'),
(1372, 'FMD182413', 'Chilli Bullet (1 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 250', '8', 'Fruits & Vegetables', '15', 'Ozonated Vegetables', '0', 0.00, 0.00, 120.00, 10.00, 10.00, ' Na00001', 'Nagro', NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:36'),
(1373, 'FMD182414', 'Lemon A Grade (1 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 251', '8', 'Fruits & Vegetables', '15', 'Ozonated Vegetables', '0', 0.00, 0.00, 270.00, 10.00, 10.00, ' Na00001', 'Nagro', NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:36'),
(1374, 'FMD178117', 'Carrot (Half kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 252', '8', 'Fruits & Vegetables', '15', 'Ozonated Vegetables', '0', 0.00, 0.00, 80.00, 10.00, 10.00, ' Na00001', 'Nagro', NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:36'),
(1375, 'FMD178118', 'Cucumber Local (1 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 253', '8', 'Fruits & Vegetables', '15', 'Ozonated Vegetables', '0', 0.00, 0.00, 120.00, 10.00, 10.00, ' Na00001', 'Nagro', NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:36'),
(1376, 'FMD178124', 'Bitter Gourd (Half kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 259', '8', 'Fruits & Vegetables', '15', 'Ozonated Vegetables', '0', 0.00, 0.00, 80.00, 10.00, 10.00, ' Na00001', 'Nagro', NULL, '2024-09-15 22:50:53', '2024-09-15 23:39:36'),
(1377, 'FMD178125', 'Bottle Gourd (1 kg) (Lauka)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 260', '8', 'Fruits & Vegetables', '15', 'Ozonated Vegetables', '0', 0.00, 0.00, 80.00, 10.00, 10.00, ' Na00001', 'Nagro', NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:36'),
(1378, 'FMD178126', 'Brinjal (Half kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 261', '8', 'Fruits & Vegetables', '15', 'Ozonated Vegetables', '0', 0.00, 0.00, 40.00, 10.00, 10.00, ' Na00001', 'Nagro', NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:36'),
(1379, 'FMD178127', 'Capsicum (Half kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 262', '8', 'Fruits & Vegetables', '15', 'Ozonated Vegetables', '0', 0.00, 0.00, 70.00, 10.00, 10.00, ' Na00001', 'Nagro', NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:36'),
(1380, 'FMD399365', 'Golden Crown Pineapple Slice', 'Basic description of Baking & Cooking 14', '3', 'Baking & Cooking', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 385.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:37'),
(1381, 'FMD178128', 'Chilli (Half kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 263', '8', 'Fruits & Vegetables', '15', 'Ozonated Vegetables', '0', 0.00, 0.00, 40.00, 10.00, 10.00, ' Na00001', 'Nagro', NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:37'),
(1382, 'FMD178130', 'Parwal (Half kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 265', '8', 'Fruits & Vegetables', '15', 'Ozonated Vegetables', '0', 0.00, 0.00, 35.00, 10.00, 10.00, ' Na00001', 'Nagro', NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:37'),
(1383, 'FMD178134', 'Coriander (Bunch) (200gm)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 269', '8', 'Fruits & Vegetables', '15', 'Ozonated Vegetables', '0', 0.00, 0.00, 40.00, 10.00, 10.00, ' Na00001', 'Nagro', NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:37'),
(1384, 'FMD178135', 'Lettuce (Bunch) (150 gm)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 270', '8', 'Fruits & Vegetables', '15', 'Ozonated Vegetables', '0', 0.00, 0.00, 65.00, 10.00, 10.00, ' Na00001', 'Nagro', NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:37'),
(1385, 'FMD178137', 'Pakchoy (Bunch) (200 gm)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 272', '8', 'Fruits & Vegetables', '15', 'Ozonated Vegetables', '0', 0.00, 0.00, 40.00, 10.00, 10.00, ' Na00001', 'Nagro', NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:37'),
(1386, 'FMD178138', 'Beet Root (Half Kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 273', '8', 'Fruits & Vegetables', '15', 'Ozonated Vegetables', '0', 0.00, 0.00, 115.00, 10.00, 10.00, ' Na00001', 'Nagro', NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:37'),
(1387, 'FMD178146', 'Sweet Potatoes (Half Kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 281', '8', 'Fruits & Vegetables', '15', 'Ozonated Vegetables', '0', 0.00, 0.00, 70.00, 10.00, 10.00, ' Na00001', 'Nagro', NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:37'),
(1388, 'FMD189249', 'Avocado (0.740 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 282', '8', 'Fruits & Vegetables', '16', 'Fresh Avocados', '0', 0.00, 0.00, 494.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:37'),
(1389, 'FMD187310', 'Avocado (3 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 284', '8', 'Fruits & Vegetables', '16', 'Fresh Avocados', '0', 0.00, 0.00, 990.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:37'),
(1390, 'FMD199020', 'Banana Local Small Size (1 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 287', '8', 'Fruits & Vegetables', '17', 'Fruits By Vendors', '0', 0.00, 0.00, 190.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:37'),
(1391, 'FMD215871', 'Sunehra Mineral Sugar  (1 kg)', 'Basic description of Baking & Cooking 15', '3', 'Baking & Cooking', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 255.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:37'),
(1392, 'FMD199028', 'Apple (Mustang)  (1 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 293', '8', 'Fruits & Vegetables', '17', 'Fruits By Vendors', '0', 0.00, 0.00, 240.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:37'),
(1393, 'FMD199029', 'Kiwi ( Chili ) (1 Kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 294', '8', 'Fruits & Vegetables', '17', 'Fruits By Vendors', '0', 0.00, 0.00, 615.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:37'),
(1394, 'FMD199031', 'Pomegranate ( Anar ) Small size (1 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 296', '8', 'Fruits & Vegetables', '17', 'Fruits By Vendors', '0', 0.00, 0.00, 440.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:37'),
(1395, 'FMD199032', 'Red Kiwi Raw (1 pkt)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 297', '8', 'Fruits & Vegetables', '17', 'Fruits By Vendors', '0', 0.00, 0.00, 615.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:37'),
(1396, 'FMD199036', 'Watermelon ( Around 3 kg )', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 301', '8', 'Fruits & Vegetables', '17', 'Fruits By Vendors', '0', 0.00, 0.00, 240.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:37'),
(1397, 'FMD199039', 'Naspati White(White Pearl) (1 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 304', '8', 'Fruits & Vegetables', '17', 'Fruits By Vendors', '0', 0.00, 0.00, 315.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:37'),
(1398, 'FMD199045', 'Dragon Fruit (500 gm)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 307', '8', 'Fruits & Vegetables', '17', 'Fruits By Vendors', '0', 0.00, 0.00, 440.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:37'),
(1399, 'FMD242006', 'Baigan Fali Mango (1 kg)', 'Fruits and vegetables are plant products rich in vitamins, minerals, and antioxidants 309', '8', 'Fruits & Vegetables', '17', 'Fruits By Vendors', '0', 0.00, 0.00, 365.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:37'),
(1400, 'FMD254325', 'Kombucha (300 ml) Bottle', 'Made from premium Hass avocados, AVO Guacamole is 100% natural and preservative free. Now, you can enjoy the authentic flavor of pure Mexican guacamole.   Add it to your salad, spread it on your multigrain bread, create the perfect veggie dip, or simply s', '9', 'Healthy Choice', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 140.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:37'),
(1401, 'FMD214636', 'AVO Guacamole', 'Made from premium Hass avocados, AVO Guacamole is 100% natural and preservative free. Now, you can enjoy the authentic flavor of pure Mexican guacamole.   Add it to your salad, spread it on your multigrain bread, create the perfect veggie dip, or simply s', '9', 'Healthy Choice', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 1040.00, 10.00, 10.00, ' AV00001', 'AVO', NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:37'),
(1402, 'FMD215189', 'Pampers Pant 56\'s Extra Large (XL)', 'Basic description of Baby Care 7', '1', 'Baby Care', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 1908.00, 10.00, 10.00, ' Pa00001', 'Pamper', NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:37'),
(1403, 'FMD221810', 'Brown & Polson Vanilla Custard Powder 500g', 'Basic description of Baking & Cooking 16', '3', 'Baking & Cooking', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 190.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:37'),
(1404, 'FMD194070', 'AVO Guacamole (2 packs of 227g  )', 'Made from premium Hass avocados, AVO Guacamole is 100% natural and preservative free. Now, you can enjoy the authentic flavor of pure Mexican guacamole.   Add it to your salad, spread it on your multigrain bread, create the perfect veggie dip, or simply s', '9', 'Healthy Choice', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 2090.00, 10.00, 10.00, ' AV00001', 'AVO', NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:37'),
(1405, 'FMD188322', 'Chiya Seeds (200 gm)', 'Made from premium Hass avocados, AVO Guacamole is 100% natural and preservative free. Now, you can enjoy the authentic flavor of pure Mexican guacamole.   Add it to your salad, spread it on your multigrain bread, create the perfect veggie dip, or simply s', '9', 'Healthy Choice', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 240.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:37'),
(1406, 'FMD188339', 'Soy mIlk (300 ml)', 'Made from premium Hass avocados, AVO Guacamole is 100% natural and preservative free. Now, you can enjoy the authentic flavor of pure Mexican guacamole.   Add it to your salad, spread it on your multigrain bread, create the perfect veggie dip, or simply s', '9', 'Healthy Choice', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 65.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:37'),
(1407, 'FMD188340', 'Almond Milk (300 ml)', 'Made from premium Hass avocados, AVO Guacamole is 100% natural and preservative free. Now, you can enjoy the authentic flavor of pure Mexican guacamole.   Add it to your salad, spread it on your multigrain bread, create the perfect veggie dip, or simply s', '9', 'Healthy Choice', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 140.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:37'),
(1408, 'FMD183379', 'Mix Pack (1000 gms)- Blissball', 'Made from premium Hass avocados, AVO Guacamole is 100% natural and preservative free. Now, you can enjoy the authentic flavor of pure Mexican guacamole.   Add it to your salad, spread it on your multigrain bread, create the perfect veggie dip, or simply s', '9', 'Healthy Choice', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 3490.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:37'),
(1409, 'FMD183380', 'Mixed Pack (200 gms)- Blissball', 'Made from premium Hass avocados, AVO Guacamole is 100% natural and preservative free. Now, you can enjoy the authentic flavor of pure Mexican guacamole.   Add it to your salad, spread it on your multigrain bread, create the perfect veggie dip, or simply s', '9', 'Healthy Choice', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 880.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:37'),
(1410, 'FMD183381', 'Mixed Pack (500 gms)- Blissball', 'Made from premium Hass avocados, AVO Guacamole is 100% natural and preservative free. Now, you can enjoy the authentic flavor of pure Mexican guacamole.   Add it to your salad, spread it on your multigrain bread, create the perfect veggie dip, or simply s', '9', 'Healthy Choice', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 1880.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:37'),
(1411, 'FMD180392', 'Himalayan Digestive 500g', 'Made from premium Hass avocados, AVO Guacamole is 100% natural and preservative free. Now, you can enjoy the authentic flavor of pure Mexican guacamole.   Add it to your salad, spread it on your multigrain bread, create the perfect veggie dip, or simply s', '9', 'Healthy Choice', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 210.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:37'),
(1412, 'FMD180393', 'Mum_s Chia Seeds 330g', 'Made from premium Hass avocados, AVO Guacamole is 100% natural and preservative free. Now, you can enjoy the authentic flavor of pure Mexican guacamole.   Add it to your salad, spread it on your multigrain bread, create the perfect veggie dip, or simply s', '9', 'Healthy Choice', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 550.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:37'),
(1413, 'FMD180394', 'Mum_s Quinoa 400g', 'Made from premium Hass avocados, AVO Guacamole is 100% natural and preservative free. Now, you can enjoy the authentic flavor of pure Mexican guacamole.   Add it to your salad, spread it on your multigrain bread, create the perfect veggie dip, or simply s', '9', 'Healthy Choice', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 365.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:37'),
(1414, 'FMD221832', 'Rex Baking Powder 100g', 'Basic description of Baking & Cooking 17', '3', 'Baking & Cooking', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 38.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:37'),
(1415, 'FMD180395', 'Nestle Resource Diabetic Food (Vanilla Flavor) - 400g (MR)', 'Made from premium Hass avocados, AVO Guacamole is 100% natural and preservative free. Now, you can enjoy the authentic flavor of pure Mexican guacamole.   Add it to your salad, spread it on your multigrain bread, create the perfect veggie dip, or simply s', '9', 'Healthy Choice', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 1190.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:37'),
(1416, 'FMD180396', 'Nestle Resource High Protein - 400g (MR)', 'Made from premium Hass avocados, AVO Guacamole is 100% natural and preservative free. Now, you can enjoy the authentic flavor of pure Mexican guacamole.   Add it to your salad, spread it on your multigrain bread, create the perfect veggie dip, or simply s', '9', 'Healthy Choice', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 1420.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:37'),
(1417, 'FMD177556', 'Orginal (200 gms)- Blissball', 'Cashew Nuts, Almonds, Arabic Dates, Raisins, Tragacanth Gum, Butter, Himalayan Pink Salt 1', '9', 'Healthy Choice', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 680.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:37'),
(1418, 'FMD177557', 'Orginal (500 gms)- Blissball', 'Cashew Nuts, Almonds, Arabic Dates, Raisins, Tragacanth Gum, Butter, Himalayan Pink Salt 2', '9', 'Healthy Choice', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 1580.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:37'),
(1419, 'FMD177558', 'Pistachino Punch (200 gms)- Blissball', 'Pistachios, Cashew Nuts, Almonds, Arabic Dates, Raisins, Tragacanth Gum, Butter, Himalayan Pink Salt', '9', 'Healthy Choice', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 780.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:37'),
(1420, 'FMD177559', 'Twist (500 gms)- Blissball', 'Apricots, Hazel Nuts, Pistachios, Dark Chocolate, Cashew Nuts, Almonds, Arabic Dates, Raisins, Tragacanth Gum, Butter, Himalayan Pink Salt', '9', 'Healthy Choice', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 1880.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:37'),
(1421, 'FMD253946', 'Tide Plus Jasmine & Rose 4kg + 1kg Free', 'Basic description of Household 1', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 884.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:37'),
(1422, 'FMD222850', 'Bathroom Tissue 3 ply (130 gm)', 'Basic description of Household 2', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 40.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:37'),
(1423, 'FMD223076', 'Surf Excel Matic Top Load Detergent Washing Powder 4+2 kg', 'Basic description of Household 3', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 1782.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:38'),
(1424, 'FMD225667', 'Bathroom Tissue 3 ply (150 gm)', 'Basic description of Household 4', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 490.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:38'),
(1425, 'FMD174391', 'Bhanbhori Almond Essence (28 ml)', 'Basic description of Baking & Cooking 18', '3', 'Baking & Cooking', '3', 'Essence', '0', 0.00, 0.00, 50.00, 10.00, 10.00, ' Bh00001', 'Bhanbhori', NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:38'),
(1426, 'FMD286372', 'Mr Kleen Toilet Cleaner (500 ml)', 'Basic description of Household 5', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 120.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:38'),
(1427, 'FMD297056', 'Ariel (500 gm)', 'Basic description of Household 6', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 225.00, 10.00, 10.00, ' Ar00002', 'Ariel', NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:38'),
(1428, 'FMD287870', 'Xtraa Activ Detergent Powder 1kg', 'Basic description of Household 7', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 100.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:38'),
(1429, 'FMD287871', 'Xtraa Activ Detergent Powder 500 gm (Pack of 2)', 'Basic description of Household 8', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 100.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:38'),
(1430, 'FMD287872', 'Xtraa Detergent Powder 1kg', 'Basic description of Household 9', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 230.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:38'),
(1431, 'FMD287873', 'Xtraa Detergent Powder 500 gm', 'Basic description of Household 10', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 115.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:38'),
(1432, 'FMD287874', 'Dhoni Herbal Dish Wash Bar - 200 gms (Pack of 4)', 'Basic description of Household 11', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 90.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:38'),
(1433, 'FMD287875', 'Dhoni Herbal Dish Wash Bar-75 gms (Pack of 12)', 'Basic description of Household 12', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 110.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:38'),
(1434, 'FMD287876', 'Dhoni Herbal Dish Wash Liquid - 500 ml', 'Basic description of Household 13', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 160.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:38'),
(1435, 'FMD287877', 'Dhoni Herbal Dishwash Tub 250 gm (Pack of 6)', 'Basic description of Household 14', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 230.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:38'),
(1436, 'FMD174392', 'Bhanbhori Mango Essence (28 ml)', 'Basic description of Baking & Cooking 19', '3', 'Baking & Cooking', '3', 'Essence', '0', 0.00, 0.00, 50.00, 10.00, 10.00, ' Bh00001', 'Bhanbhori', NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:38'),
(1437, 'FMD287878', 'Dhoni Herbal Dishwash Tub 400 gm (Pack of 4)', 'Basic description of Household 15', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 250.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:38'),
(1438, 'FMD287879', 'Dhoni Jumbo Laundry Soap- 200 Gm (Pack of 4)', 'Basic description of Household 16', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 190.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:38'),
(1439, 'FMD287880', 'Dhoni Laundry Soap 225 Gm Each (4 Pc Pack)', 'Basic description of Household 17', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 220.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:38'),
(1440, 'FMD287881', 'Dhoni Ultra Concentrated Detergent Powder 3kg', 'Basic description of Household 18', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 290.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:38'),
(1441, 'FMD287882', 'Dhoni Ultra Concentrated Detergent Powder 500 gm', 'Basic description of Household 19', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 70.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:38'),
(1442, 'FMD287883', 'Dhoni Ultra Concentrated Detergent Powder 700 gm', 'Basic description of Household 20', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 100.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:38'),
(1443, 'FMD287884', 'Dhoni Ultra Concentrated Detergent Powder Jasmine 500 gm (Pack of 2)', 'Basic description of Household 21', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 150.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:38'),
(1444, 'FMD300474', 'Dhoni Dish Wash Bar (75 gm)', 'Basic description of Household 22', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 2.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:38'),
(1445, 'FMD300706', 'Vim Dish Wash Liquid (500 ml)', 'Basic description of Household 23', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 120.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:38'),
(1446, 'FMD304766', 'Tide Jasmine (2 kg)', 'Basic description of Household 24', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 358.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:38'),
(1447, 'FMD174393', 'Bhanbhori Pineapple Essence (28 ml)', 'Basic description of Baking & Cooking 20', '3', 'Baking & Cooking', '3', 'Essence', '0', 0.00, 0.00, 50.00, 10.00, 10.00, ' Bh00001', 'Bhanbhori', NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:38'),
(1448, 'FMD305271', 'Ariel Complete (500 gm)', 'Basic description of Household 25', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 225.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:38'),
(1449, 'FMD305461', 'Ultra Clean XL+ 15', 'Basic description of Household 26', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 270.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:38'),
(1450, 'FMD310792', 'Wheel Surf 500 gm', 'Basic description of Household 27', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 60.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:38'),
(1451, 'FMD299197', 'All Out Ultra Power Refill Floral (45 ml)', 'Basic description of Household 28', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 100.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:38'),
(1452, 'FMD299198', 'All Out Ultra Power Slider Combi (45 ml)', 'Basic description of Household 29', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 130.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:38'),
(1453, 'FMD299199', 'Air Freshner - Floral Perfection (300 ml) - Glade', 'Basic description of Household 30', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 260.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:38'),
(1454, 'FMD299200', 'Air Freshner - Wild Lavender (300 ml) - Glade', 'Basic description of Household 31', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 260.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:38'),
(1455, 'FMD299201', 'Baygon Max FIK 200 ml x 48 INR 115', 'Basic description of Household 32', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 147.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:38'),
(1456, 'FMD299202', 'CIK (200 ml) - Baygon Max', 'Basic description of Household 33', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 147.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:38'),
(1457, 'FMD299203', 'cockroach killer(CIK )400 ml- Baygon Max', 'Basic description of Household 34', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 350.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:38'),
(1458, 'FMD174394', 'Bhanbhori Strawberry Essence (28 ml)', 'Basic description of Baking & Cooking 21', '3', 'Baking & Cooking', '3', 'Essence', '0', 0.00, 0.00, 50.00, 10.00, 10.00, ' Bh00001', 'Bhanbhori', NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:38'),
(1459, 'FMD299204', 'cockroach killer(CIK )625 ml- Baygon Max', 'Basic description of Household 35', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 534.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:38'),
(1460, 'FMD299205', 'Dranex (375 gms) - Kiwi', 'Basic description of Household 36', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 310.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:38'),
(1461, 'FMD299206', 'Dranex (50 gms) - Kiwi', 'Basic description of Household 37', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 41.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:38'),
(1462, 'FMD299207', 'FIK DN (400 ml) - Baygon Max', 'Basic description of Household 38', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 350.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:38'),
(1463, 'FMD299208', 'FIK DN (625 ml) - Baygon Max', 'Basic description of Household 39', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 412.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:39'),
(1464, 'FMD299209', 'Floor Cleaner - Citrus ( 500 ml) - Mr. Muscle', 'Basic description of Household 40', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 150.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:39'),
(1465, 'FMD299210', 'Floor Cleaner - Citrus (1 ltr + 500 ml) - Mr. Muscle', 'Basic description of Household 41', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 246.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:39'),
(1466, 'FMD299211', 'Floor Cleaner - Floral (1 ltr + 500 ml) - Mr. Muscle', 'Basic description of Household 42', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 246.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:39'),
(1467, 'FMD299212', 'Floor Cleaner - Floral (500 ml) - Mr. Muscle', 'Basic description of Household 43', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 150.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:39'),
(1468, 'FMD299213', 'Floor Cleaner - Lavender (1 ltr + 500 ml) - Mr. Muscle', 'Basic description of Household 44', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 246.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:39'),
(1469, 'FMD174395', 'Bhanbhori Vanilla Essence (28 ml)', 'Basic description of Baking & Cooking 22', '3', 'Baking & Cooking', '3', 'Essence', '0', 0.00, 0.00, 50.00, 10.00, 10.00, ' Bh00001', 'Bhanbhori', NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:39'),
(1470, 'FMD299214', 'Floor Cleaner - Lavender (500 ml) - Mr. Muscle', 'Basic description of Household 45', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 147.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:39'),
(1471, 'FMD299215', 'Glass & Household Cleaner (500 ml) - Mr. Muscle', 'Basic description of Household 46', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 117.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:39'),
(1472, 'FMD299216', 'Kitchen Cleaner (500 ml) - Mr. Muscle', 'Basic description of Household 47', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 181.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:39'),
(1473, 'FMD299217', 'Liquid Shoe Polish - Black (75 ml) - Kiwi', 'Basic description of Household 48', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 152.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:39'),
(1474, 'FMD299218', 'Liquid Shoe Polish - Brown (75 ml) - Kiwi', 'Basic description of Household 49', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 152.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:39'),
(1475, 'FMD299219', 'Shoe Brush (2 in 1) - Kiwi', 'Basic description of Household 50', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 131.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:39'),
(1476, 'FMD299220', 'Shoe Brush (Mini ) - Kiwi', 'Basic description of Household 51', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 105.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:39'),
(1477, 'FMD299221', 'Shoe Polish -Black (40 gms) - Kiwi', 'Basic description of Household 52', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 102.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:39'),
(1478, 'FMD299222', 'Shoe Polish -Dark Tan (40 gms) - Kiwi', 'Basic description of Household 53', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 91.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:39'),
(1479, 'FMD299223', 'Shoe Sponge - Black (5 ml) - Kiwi', 'Basic description of Household 54', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 131.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:39'),
(1480, 'FMD334391', 'Nescafe Red Cup (380 gm)', 'Basic description of Beverages 1', '4', 'Beverages', '4', 'Coffee', '0', 0.00, 0.00, 1170.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:39');
INSERT INTO `products` (`id`, `product_code`, `product_name`, `product_description`, `category_id`, `category_name`, `subcategory_id`, `subcategory_name`, `delivery_target_days`, `discount`, `actual_price`, `sell_price`, `available_quantity`, `stock_quantity`, `brand_id`, `brand_name`, `primary_image`, `created_at`, `updated_at`) VALUES
(1481, 'FMD299224', 'Shoe Sponge - Neutral (5 ml) - Kiwi', 'Basic description of Household 55', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 131.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:39'),
(1482, 'FMD299225', 'Toilet Cleaner (500 ml) - Mr. Muscle', 'Basic description of Household 56', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 107.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:39'),
(1483, 'FMD299226', 'Touch & Fresh Combi - Floral Perfection (12 ml) - Glade', 'Basic description of Household 57', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 196.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:39'),
(1484, 'FMD299227', 'Touch & Fresh Combi - Lemon (12 ml) - Glade', 'Basic description of Household 58', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 196.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:39'),
(1485, 'FMD299228', 'Touch & Fresh Combi - Wild Lavender (12 ml) - Glade', 'Basic description of Household 59', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 196.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:39'),
(1486, 'FMD299229', 'Touch & Fresh Rfl - Floral Perfection (12 ml) - Glade', 'Basic description of Household 60', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 142.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:39'),
(1487, 'FMD299230', 'Touch & Fresh Rfl - Lavender (12 ml) - Glade', 'Basic description of Household 61', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 142.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:39'),
(1488, 'FMD299231', 'Touch & Fresh Rfl - Lemon (12 ml) - Glade', 'Basic description of Household 62', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 142.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:39'),
(1489, 'FMD299232', 'Touch & Fresh Rfl - Multi Air Freshener (12 ml) - Glade', 'Basic description of Household 63', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 358.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:39'),
(1490, 'FMD299233', 'Ultra Power Refill (45 ml) - All Out', 'Basic description of Household 64', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 110.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:39'),
(1491, 'FMD347245', 'Arsha Red Cup Coffee (380 gm)', 'Basic description of Beverages 2', '4', 'Beverages', '4', 'Coffee', '0', 0.00, 0.00, 1040.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:39'),
(1492, 'FMD344182', 'Alfa Surf Neo (500 gm)', 'Basic description of Household 65', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 50.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:39'),
(1493, 'FMD345933', 'Mr Clean Toilet Cleaner (500 ml)', 'Basic description of Household 66', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 120.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:39'),
(1494, 'FMD326386', 'FIK DN (200 ml) - Baygon Max', 'Basic description of Household 67', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 174.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:39'),
(1495, 'FMD331025', 'Tide Jasmine & Rose 1 Kg', 'Basic description of Household 68', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 245.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:39'),
(1496, 'FMD331026', 'Tide Lemon & Mint 500 gm', 'Basic description of Household 69', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 120.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:39'),
(1497, 'FMD331027', 'Xtraa Laundry soap 200 gm (pack of 4 )', 'Basic description of Household 70', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 190.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:39'),
(1498, 'FMD331028', 'Herbyukt Dishwasher Bar 150 gms (Pack of 5)', 'Basic description of Household 71', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 90.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:39'),
(1499, 'FMD307194', 'Floral Perfection (300 ml)', 'Basic description of Household 72', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 194.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:40'),
(1500, 'FMD324093', 'Tide Jasmine (500 gm)', 'Basic description of Household 73', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 115.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:40'),
(1501, 'FMD369518', 'Dhoni Surf (500 gm)', 'Basic description of Household 74', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 60.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:40'),
(1502, 'FMD174119', 'Nuwakot (Washed) Beans - (250 gm)- Kathmandu Coffee', 'Basic description of Beverages 3', '4', 'Beverages', '4', 'Coffee', '0', 0.00, 0.00, 780.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:40'),
(1503, 'FMD350439', 'Floor Cleaner (1 ltr)', 'Basic description of Household 76', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 308.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:40'),
(1504, 'FMD179575', 'Premium Tissue (100 pulls)', 'Basic description of Household 77', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 90.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:40'),
(1505, 'FMD191072', 'Lifebuoy (190 ml)', 'Basic description of Household 78', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 126.00, 10.00, 10.00, ' Li00001', 'Lifebuoy', NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:40'),
(1506, 'FMD192073', 'Passion 2 Ply 100 Pulls Tissue', 'Basic description of Household 79', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 100.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:40'),
(1507, 'FMD221833', 'Surf Excel Quick Wash 3kg+1kg free', 'Basic description of Household 80', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 950.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:40'),
(1508, 'FMD215624', 'Bathroom Tissue 3 Ply (170 gm)', 'Basic description of Household 81', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 55.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:40'),
(1509, 'FMD209878', 'Passion 2 Ply 200 Pulls Tissue', 'Basic description of Household 82', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 130.00, 10.00, 10.00, ' Ar00002', 'Ariel', NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:40'),
(1510, 'FMD215231', 'Ariel Matic Cannister Top Load 3kg', 'Basic description of Household 83', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 1539.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:40'),
(1511, 'FMD215232', 'Tide Plus Jasmine & Rose 6kg + 2kg Free', 'Basic description of Household 84', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 1382.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:40'),
(1512, 'FMD215233', 'Tide Plus Lemon 4 kg +1 kg Free', 'Basic description of Household 85', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 884.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:40'),
(1513, 'FMD241236', 'Pampers Diapers 20s (XL)', 'Basic description of Baby Care 8', '1', 'Baby Care', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 1266.00, 10.00, 10.00, ' Pa00001', 'Pamper', NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:40'),
(1514, 'FMD174120', 'Nuwakot (Washed) Beans - (1000 gm)- Kathmandu Coffee', 'Basic description of Beverages 4', '4', 'Beverages', '4', 'Coffee', '0', 0.00, 0.00, 2490.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:40'),
(1515, 'FMD215234', 'Tide plus Lemon & Mint 1 kg', 'Basic description of Household 86', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 245.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:40'),
(1516, 'FMD202215', 'Lizol (2 ltr)', 'Basic description of Household 87', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 600.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:40'),
(1517, 'FMD207548', 'Whisper Bindazz Night (XL 30)', 'Basic description of Household 88', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 534.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:40'),
(1518, 'FMD208626', 'Ariel Complete (1 kg)', 'Basic description of Household 89', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 450.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:40'),
(1519, 'FMD176508', 'Bathroom Tissue 2 Ply (160 gm)', 'Basic description of Household 90', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 590.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:40'),
(1520, 'FMD176510', 'Bathroom Tissue 3 Ply (160 gm)', 'Basic description of Household 92', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 50.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:40'),
(1521, 'FMD176511', 'Premium Tissue 2 Ply 100 pulls', 'Basic description of Household 93', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 90.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:40'),
(1522, 'FMD176512', 'Premium Tissue 2 Ply 200 pulls', 'Basic description of Household 94', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 160.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:40'),
(1523, 'FMD176564', 'Mr Muscle Floor Cleaner (500 ml)', 'Basic description of Household 95', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 155.00, 10.00, 10.00, ' Mr00001', 'Mr. Muscle', NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:40'),
(1524, 'FMD176565', 'Mr Muscle Glass Cleaner (500 ml)', 'Basic description of Household 96', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 135.00, 10.00, 10.00, ' Mr00001', 'Mr. Muscle', NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:40'),
(1525, 'FMD174121', 'Palpa (Natural) Filter Grind - (1000 gm)- Kathmandu Coffee', 'Basic description of Beverages 5', '4', 'Beverages', '4', 'Coffee', '0', 0.00, 0.00, 2490.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:40'),
(1526, 'FMD176566', 'Mr Muscle Kitchen Cleaner (150 ml)', 'Basic description of Household 97', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 214.00, 10.00, 10.00, ' Mr00001', 'Mr. Muscle', NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:40'),
(1527, 'FMD176567', 'Mr Muscle Toilet Cleaner (500 ml)', 'Basic description of Household 98', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 120.00, 10.00, 10.00, ' Mr00001', 'Mr. Muscle', NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:40'),
(1528, 'FMD177281', 'Ariel - 3 kg (Bucket Free)', 'Basic description of Household 99', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 1037.00, 10.00, 10.00, ' Ar00002', 'Ariel', NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:40'),
(1529, 'FMD177282', 'Ariel (1 kg)', 'Basic description of Household 100', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 450.00, 10.00, 10.00, ' Ar00002', 'Ariel', NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:40'),
(1530, 'FMD177283', 'Ariel Matic Front Load (1 kg)', 'Basic description of Household 101', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 485.00, 10.00, 10.00, ' Ar00002', 'Ariel', NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:40'),
(1531, 'FMD177284', 'Ariel Matic Top Load (1 kg)', 'Basic description of Household 102', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 415.00, 10.00, 10.00, ' Ar00002', 'Ariel', NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:40'),
(1532, 'FMD174767', 'Quick Wash 1 kg', 'Basic description of Household 103', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 278.00, 10.00, 10.00, ' Su00001', 'Surf Excel', NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:40'),
(1533, 'FMD174768', 'Quick Wash 500 g', 'Basic description of Household 104', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 134.00, 10.00, 10.00, ' Su00001', 'Surf Excel', NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:40'),
(1534, 'FMD174773', 'CARE Hand Sanitizer 50 ml', 'Basic description of Household 105', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 102.00, 10.00, 10.00, ' Li00001', 'Lifebuoy', NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:40'),
(1535, 'FMD174775', 'Total 10 Liquid Handwash 190 ml', 'Basic description of Household 106', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 126.00, 10.00, 10.00, ' Li00001', 'Lifebuoy', NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:40'),
(1536, 'FMD174294', 'Classic Espresso Blend 1 kg Filter Grind (Exotic/ Medium Roast)-  (Premium / Export Quality)', 'Basic description of Beverages 6', '4', 'Beverages', '4', 'Coffee', '0', 0.00, 0.00, 2090.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:40'),
(1537, 'FMD174776', 'Total 10 Liquid Handwash 400 ml', 'Basic description of Household 107', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 214.00, 10.00, 10.00, ' Li00001', 'Lifebuoy', NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:41'),
(1538, 'FMD174777', 'Total Tube 50 ml', 'Basic description of Household 108', '10', 'Household', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 115.00, 10.00, 10.00, ' Li00001', 'Lifebuoy', NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:41'),
(1539, 'FMD174228', 'Complan Chocolate (500 gm)', 'Basic description of Kids & Baby Foods 1', '11', 'Kids & Baby Foods', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 460.00, 10.00, 10.00, ' Co00002', 'Complan', NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:41'),
(1540, 'FMD174229', 'Complan Chocolate Refil (500 gm)', 'Basic description of Kids & Baby Foods 2', '11', 'Kids & Baby Foods', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 430.00, 10.00, 10.00, ' Co00002', 'Complan', NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:41'),
(1541, 'FMD174230', 'Complan Kesar Badam (500 gm) Jar', 'Basic description of Kids & Baby Foods 3', '11', 'Kids & Baby Foods', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 540.00, 10.00, 10.00, ' Co00002', 'Complan', NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:41'),
(1542, 'FMD174231', 'Complan Kesar Badam (500 gm)', 'Basic description of Kids & Baby Foods 4', '11', 'Kids & Baby Foods', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 520.00, 10.00, 10.00, ' Co00002', 'Complan', NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:41'),
(1543, 'FMD174232', 'Complan Natural (500 gm) Jar', 'Basic description of Kids & Baby Foods 5', '11', 'Kids & Baby Foods', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 440.00, 10.00, 10.00, ' Co00002', 'Complan', NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:41'),
(1544, 'FMD174233', 'Complan Pista Badam (500 gm)', 'Basic description of Kids & Baby Foods 6', '11', 'Kids & Baby Foods', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 520.00, 10.00, 10.00, ' Co00002', 'Complan', NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:41'),
(1545, 'FMD174366', 'Nestlé Lactogen 1 Infant Formula Powder (Upto 6 Months) (400 gm)', 'Basic description of Kids & Baby Foods 7', '11', 'Kids & Baby Foods', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 722.00, 10.00, 10.00, ' Ne00003', 'Nestle', NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:41'),
(1546, 'FMD174367', 'Nestlé Lactogen 2 Follow-Up Formula Powder (After 6 months) (400 gm)', 'Basic description of Kids & Baby Foods 8', '11', 'Kids & Baby Foods', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 702.00, 10.00, 10.00, ' Ne00003', 'Nestle', NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:41'),
(1547, 'FMD174295', 'Classic Espresso Blend 1 Kg Whole Beans (Exotic/ Medium Roast)-  (Premium / Export Quality)- Red Cherry Coffee Beans', 'Basic description of Beverages 7', '4', 'Beverages', '4', 'Coffee', '0', 0.00, 0.00, 2090.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:41'),
(1548, 'FMD174368', 'Nestlé Lactogen 3 Follow-Up Formula Powder (After 12 months) (400 gm)', 'Basic description of Kids & Baby Foods 9', '11', 'Kids & Baby Foods', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 671.00, 10.00, 10.00, ' Ne00003', 'Nestle', NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:41'),
(1549, 'FMD174369', 'Nestlé Lactogen 4 Follow-Up Formula Powder (After 24 months) (400 gm)', 'Basic description of Kids & Baby Foods 10', '11', 'Kids & Baby Foods', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 635.00, 10.00, 10.00, ' Ne00003', 'Nestle', NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:41'),
(1550, 'FMD174363', 'Nestlé CERELAC Stage 5, 5 Grains and Fruits (From 18 Months) (300 gm)', 'Basic description of Kids & Baby Foods 16', '11', 'Kids & Baby Foods', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 510.00, 10.00, 10.00, ' Ne00003', 'Nestle', NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:41'),
(1551, 'FMD177550', 'Mam Mam (500 gm) Nutritious Baby Food', 'Basic description of Kids & Baby Foods 18', '11', 'Kids & Baby Foods', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 180.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:54', '2024-09-15 23:39:41'),
(1552, 'FMD257343', 'Nestle Ceregrow (300 gm)', 'Basic description of Kids & Baby Foods 19', '11', 'Kids & Baby Foods', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 532.00, 10.00, 10.00, ' Ne00003', 'Nestle', NULL, '2024-09-15 22:50:55', '2024-09-15 23:39:41'),
(1553, 'FMD174060', 'Chiuri Honey (500gm)', 'Local Produces basic description 1', '12', 'Local Produces', '18', 'Honey', '0', 0.00, 0.00, 430.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:55', '2024-09-15 23:39:41'),
(1554, 'FMD174061', 'Raw Honey (1 kg) (Tori)', 'Local Produces basic description 2', '12', 'Local Produces', '18', 'Honey', '0', 0.00, 0.00, 990.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:55', '2024-09-15 23:39:41'),
(1555, 'FMD205525', 'Garden Honey (1 kg)', 'Local Produces basic description 3', '12', 'Local Produces', '18', 'Honey', '0', 0.00, 0.00, 680.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:55', '2024-09-15 23:39:41'),
(1556, 'FMD201025', 'Chiuri Honey  (1 kg)', 'Local Produces basic description 4', '12', 'Local Produces', '18', 'Honey', '0', 0.00, 0.00, 1080.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:55', '2024-09-15 23:39:41'),
(1557, 'FMD202898', 'Chiuri Honey  (450 gm)', 'Local Produces basic description 5', '12', 'Local Produces', '18', 'Honey', '0', 0.00, 0.00, 540.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:55', '2024-09-15 23:39:41'),
(1558, 'FMD174296', 'Classic Espresso Blend 250 gm Filter Grind (Exotic/ Medium Roast)-  (Premium / Export Quality)', 'Basic description of Beverages 8', '4', 'Beverages', '4', 'Coffee', '0', 0.00, 0.00, 690.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:55', '2024-09-15 23:39:41'),
(1559, 'FMD215860', 'Dabur Honey (500 gm)', 'Local Produces basic description 6', '12', 'Local Produces', '18', 'Honey', '0', 0.00, 0.00, 365.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:55', '2024-09-15 23:39:41'),
(1560, 'FMD188315', 'Raw Honey- Chiuri (1 kg)', 'Local Produces basic description 8', '12', 'Local Produces', '18', 'Honey', '0', 0.00, 0.00, 1080.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:55', '2024-09-15 23:39:41'),
(1561, 'FMD188316', 'Raw Honey- Rudilo (700 gm)', 'Local Produces basic description 9', '12', 'Local Produces', '18', 'Honey', '0', 0.00, 0.00, 690.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:55', '2024-09-15 23:39:41'),
(1562, 'FMD328519', 'Almond and Honey', 'Local Produces basic description 11', '12', 'Local Produces', '18', 'Honey', '0', 0.00, 0.00, 355.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:55', '2024-09-15 23:39:41'),
(1563, 'FMD329571', 'Gyan Honey', 'Local Produces basic description 12', '12', 'Local Produces', '18', 'Honey', '0', 0.00, 0.00, 640.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:55', '2024-09-15 23:39:41'),
(1564, 'FMD325887', 'Gyan Honey (1 kg)', 'Local Produces basic description 13', '12', 'Local Produces', '18', 'Honey', '0', 0.00, 0.00, 640.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:55', '2024-09-15 23:39:41'),
(1565, 'FMD316950', 'Dabur Honey (1kg)', 'Local Produces basic description 14', '12', 'Local Produces', '18', 'Honey', '0', 0.00, 0.00, 755.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:55', '2024-09-15 23:39:41'),
(1566, 'FMD216617', 'Maas Ko Daal (Black  Daal) (1 kg)', 'Basic description of Local Produces 1', '12', 'Local Produces', '19', 'Legume', '0', 0.00, 0.00, 205.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:55', '2024-09-15 23:39:41'),
(1567, 'FMD216618', 'Mix Daal (1 kg)', 'Basic description of Local Produces 2', '12', 'Local Produces', '19', 'Legume', '0', 0.00, 0.00, 240.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:55', '2024-09-15 23:39:41'),
(1568, 'FMD216619', 'Rahar Daal (1 kg)', 'Basic description of Local Produces 3', '12', 'Local Produces', '19', 'Legume', '0', 0.00, 0.00, 215.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:55', '2024-09-15 23:39:41'),
(1569, 'FMD174297', 'Classic Espresso Blend 250 gm Whole Beans (Exotic/ Medium Roast)-  (Premium / Export Quality)', 'Basic description of Beverages 9', '4', 'Beverages', '4', 'Coffee', '0', 0.00, 0.00, 690.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:55', '2024-09-15 23:39:41'),
(1570, 'FMD188317', 'Jumli Beans Daal (1 kg)', 'Basic description of Local Produces 4', '12', 'Local Produces', '19', 'Legume', '0', 0.00, 0.00, 275.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:55', '2024-09-15 23:39:41'),
(1571, 'FMD184189', 'Mass Ko Daal (Kalo Daal)- 1 kg', 'Basic description of Local Produces 5', '12', 'Local Produces', '19', 'Legume', '0', 0.00, 0.00, 290.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:55', '2024-09-15 23:39:41'),
(1572, 'FMD177413', 'Bhatmas (1 kg )', 'Basic description of Local Produces 6', '12', 'Local Produces', '19', 'Legume', '0', 0.00, 0.00, 190.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:55', '2024-09-15 23:39:42'),
(1573, 'FMD177415', 'Rahar Daal (Local, 1 kg)', 'Basic description of Local Produces 8', '12', 'Local Produces', '19', 'Legume', '0', 0.00, 0.00, 240.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:55', '2024-09-15 23:39:42'),
(1574, 'FMD177416', 'Rasuwa White Beans (1 kg)', 'Basic description of Local Produces 9', '12', 'Local Produces', '19', 'Legume', '0', 0.00, 0.00, 360.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:55', '2024-09-15 23:39:42'),
(1575, 'FMD174143', 'Rahar ko Daal (1 kg)', 'Basic description of Local Produces 10', '12', 'Local Produces', '19', 'Legume', '0', 0.00, 0.00, 220.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:55', '2024-09-15 23:39:42'),
(1576, 'FMD342387', 'Simi Ko Daal (1 kg)', 'Basic description of Local Produces 11', '12', 'Local Produces', '19', 'Legume', '0', 0.00, 0.00, 340.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:55', '2024-09-15 23:39:42'),
(1577, 'FMD342388', 'Khoste Mung Daal (1 kg)', 'Basic description of Local Produces 12', '12', 'Local Produces', '19', 'Legume', '0', 0.00, 0.00, 290.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:55', '2024-09-15 23:39:42'),
(1578, 'FMD316949', 'Musuro Daal (Red) 1 kg', 'Basic description of Local Produces 13', '12', 'Local Produces', '19', 'Legume', '0', 0.00, 0.00, 290.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:55', '2024-09-15 23:39:42'),
(1579, 'FMD226751', 'Kwati (500 gm)', 'Basic description of Local Produces 14', '12', 'Local Produces', '19', 'Legume', '0', 0.00, 0.00, 140.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:55', '2024-09-15 23:39:42'),
(1580, 'FMD174298', 'Classic Espresso Blend 500 gm Filter Grind (Exotic/ Medium Roast)-  (Premium / Export Quality)', 'Basic description of Beverages 10', '4', 'Beverages', '4', 'Coffee', '0', 0.00, 0.00, 1190.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:55', '2024-09-15 23:39:42'),
(1581, 'FMD233832', 'HS Rajma (1 kg)', 'Basic description of Local Produces 15', '12', 'Local Produces', '19', 'Legume', '0', 0.00, 0.00, 280.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:55', '2024-09-15 23:39:42'),
(1582, 'FMD252383', 'HS Kwati (500 gm)', 'Basic description of Local Produces 16', '12', 'Local Produces', '19', 'Legume', '0', 0.00, 0.00, 190.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:55', '2024-09-15 23:39:42'),
(1583, 'FMD254318', 'Kimchi (500 gm) Bottle', 'Basic description of Local Produces 17', '12', 'Local Produces', '20', 'Pickles', '0', 0.00, 0.00, 340.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:55', '2024-09-15 23:39:42'),
(1584, 'FMD226752', 'Radish Pickle (Bottle)', 'Basic description of Local Produces 18', '12', 'Local Produces', '20', 'Pickles', '0', 0.00, 0.00, 140.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:55', '2024-09-15 23:39:42'),
(1585, 'FMD174144', 'Sandheko Golbeda Achar (500 gm)', 'Basic description of Local Produces 19', '12', 'Local Produces', '20', 'Pickles', '0', 0.00, 0.00, 170.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:55', '2024-09-15 23:39:42'),
(1586, 'FMD174145', 'Gundruk Bhatmas Pickle (200 gm)', 'Basic description of Local Produces 20', '12', 'Local Produces', '20', 'Pickles', '0', 0.00, 0.00, 379.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:55', '2024-09-15 23:39:42'),
(1587, 'FMD174146', 'Masala Pickle  (380 gm)', 'Basic description of Local Produces 21', '12', 'Local Produces', '20', 'Pickles', '0', 0.00, 0.00, 315.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:55', '2024-09-15 23:39:42'),
(1588, 'FMD174162', 'Chicken Meat Pickle (380 gm)', 'Basic description of Local Produces 22', '12', 'Local Produces', '20', 'Pickles', '0', 0.00, 0.00, 1089.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:55', '2024-09-15 23:39:42'),
(1589, 'FMD174163', 'Timmur Chhop (100 gm)', 'Basic description of Local Produces 23', '12', 'Local Produces', '20', 'Pickles', '0', 0.00, 0.00, 217.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:55', '2024-09-15 23:39:42'),
(1590, 'FMD174164', 'Tomato Pickle (380 gm)', 'Basic description of Local Produces 24', '12', 'Local Produces', '20', 'Pickles', '0', 0.00, 0.00, 215.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:55', '2024-09-15 23:39:42'),
(1591, 'FMD174299', 'House Blend 250 gm Filter Grind (Floral/Light Roast)-  (Premium / Export Quality)', 'Basic description of Beverages 11', '4', 'Beverages', '4', 'Coffee', '0', 0.00, 0.00, 690.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:55', '2024-09-15 23:39:42'),
(1592, 'FMD177418', 'Tomato Pickle Glass Jar', 'Basic description of Local Produces 25', '12', 'Local Produces', '20', 'Pickles', '0', 0.00, 0.00, 240.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:55', '2024-09-15 23:39:42'),
(1593, 'FMD192089', 'Akabare Pickle  ( 380 gm ) Very Spicy', 'Basic description of Local Produces 26', '12', 'Local Produces', '20', 'Pickles', '0', 0.00, 0.00, 385.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:56', '2024-09-15 23:39:42'),
(1594, 'FMD192090', 'Fried Green Chillies ( 150 gm )', 'Basic description of Local Produces 27', '12', 'Local Produces', '20', 'Pickles', '0', 0.00, 0.00, 429.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:56', '2024-09-15 23:39:42'),
(1595, 'FMD192091', 'Mango Pickle ( 380 gm )', 'Basic description of Local Produces 28', '12', 'Local Produces', '20', 'Pickles', '0', 0.00, 0.00, 261.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:56', '2024-09-15 23:39:42'),
(1596, 'FMD192092', 'Tama Akabare Pickle ( 380 gm ) Very Spicy', 'Basic description of Local Produces 29', '12', 'Local Produces', '20', 'Pickles', '0', 0.00, 0.00, 395.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:56', '2024-09-15 23:39:42'),
(1597, 'FMD192093', 'Timmur & Garlic Pickle ( 200 gm )', 'Basic description of Local Produces 30', '12', 'Local Produces', '20', 'Pickles', '0', 0.00, 0.00, 272.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:56', '2024-09-15 23:39:42'),
(1598, 'FMD177417', 'Black Rice (1 kg)', 'Basic description of Local Produces 31', '12', 'Local Produces', '21', 'More Local Products', '0', 0.00, 0.00, 490.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:56', '2024-09-15 23:39:42'),
(1599, 'FMD174189', 'Gundruk (100 gm)', 'Basic description of Local Produces 32', '12', 'Local Produces', '21', 'More Local Products', '0', 0.00, 0.00, 90.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:56', '2024-09-15 23:39:42'),
(1600, 'FMD174190', 'Jaggery (1 kg)', 'Basic description of Local Produces 33', '12', 'Local Produces', '21', 'More Local Products', '0', 0.00, 0.00, 340.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:56', '2024-09-15 23:39:42'),
(1601, 'FMD188321', 'Mix Satu (400 gm)', 'Basic description of Local Produces 34', '12', 'Local Produces', '21', 'More Local Products', '0', 0.00, 0.00, 110.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:56', '2024-09-15 23:39:42'),
(1602, 'FMD174300', 'House Blend 250 gm Whole Beans (Floral/Light Roast)-  (Premium / Export Quality)', 'Basic description of Beverages 12', '4', 'Beverages', '4', 'Coffee', '0', 0.00, 0.00, 690.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:56', '2024-09-15 23:39:42'),
(1603, 'FMD179948', 'Churpi', 'Basic description of Local Produces 35', '12', 'Local Produces', '21', 'More Local Products', '0', 0.00, 0.00, 300.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:56', '2024-09-15 23:39:42'),
(1604, 'FMD179949', 'Frozen Duck Meat', 'Basic description of Local Produces 36', '12', 'Local Produces', '21', 'More Local Products', '0', 0.00, 0.00, 1990.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:56', '2024-09-15 23:39:42'),
(1605, 'FMD179950', 'Frozen Fish', 'Basic description of Local Produces 37', '12', 'Local Produces', '21', 'More Local Products', '0', 0.00, 0.00, 340.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:56', '2024-09-15 23:39:43'),
(1606, 'FMD179951', 'Manag Red Beans', 'Basic description of Local Produces 38', '12', 'Local Produces', '21', 'More Local Products', '0', 0.00, 0.00, 550.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:56', '2024-09-15 23:39:43'),
(1607, 'FMD179952', 'Marsi Rice', 'Basic description of Local Produces 39', '12', 'Local Produces', '21', 'More Local Products', '0', 0.00, 0.00, 325.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:56', '2024-09-15 23:39:43'),
(1608, 'FMD326599', 'Suji Rusk (235 gm)', 'Basic description of Local Produces 40', '12', 'Local Produces', '21', 'More Local Products', '0', 0.00, 0.00, 130.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:56', '2024-09-15 23:39:43'),
(1609, 'FMD342461', 'Buck Wheat Flour (1 kg)', 'Basic description of Local Produces 41', '12', 'Local Produces', '21', 'More Local Products', '0', 0.00, 0.00, 290.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:56', '2024-09-15 23:39:43'),
(1610, 'FMD342462', 'Jumli Wheat Flour (1 kg)', 'Basic description of Local Produces 42', '12', 'Local Produces', '21', 'More Local Products', '0', 0.00, 0.00, 140.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:56', '2024-09-15 23:39:43'),
(1611, 'FMD254323', 'Barley Satu (400 gm)', 'Basic description of Local Produces 43', '12', 'Local Produces', '21', 'More Local Products', '0', 0.00, 0.00, 90.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:56', '2024-09-15 23:39:43'),
(1612, 'FMD174071', 'Local Chicken Vaale (1 kg)', 'Basic description of Meat, Fish & Seafood 1', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 1480.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:56', '2024-09-15 23:39:43'),
(1613, 'FMD174301', 'Italian Roast 250 gm Whole Beans (Extra Bold/ Dark Roast)-  (Premium / Export Quality)', 'Basic description of Beverages 13', '4', 'Beverages', '4', 'Coffee', '0', 0.00, 0.00, 690.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:56', '2024-09-15 23:39:43'),
(1614, 'FMD174072', 'N&H B/L Chicken Skin-On  (1 kg)', 'Basic description of Meat, Fish & Seafood 2', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 940.00, 10.00, 10.00, ' Ni00001', 'Nina &amp; Hager', NULL, '2024-09-15 22:50:56', '2024-09-15 23:39:43'),
(1615, 'FMD174073', 'N&H Chicken Legs (1 kg)', 'Basic description of Meat, Fish & Seafood 3', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 890.00, 10.00, 10.00, ' Ni00001', 'Nina &amp; Hager', NULL, '2024-09-15 22:50:56', '2024-09-15 23:39:43'),
(1616, 'FMD174074', 'N&H Chicken Wings Full/ Kg', 'Basic description of Meat, Fish & Seafood 4', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 1010.00, 10.00, 10.00, ' Ni00001', 'Nina &amp; Hager', NULL, '2024-09-15 22:50:56', '2024-09-15 23:39:43'),
(1617, 'FMD174079', 'Ambrosi Parmiagiano Reggiano 200 Gm', 'Basic description of Meat, Fish & Seafood 5', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 1310.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:56', '2024-09-15 23:39:43'),
(1618, 'FMD174080', 'N&H Don Hungarian Mild Salami Roll (200 gm)', 'Basic description of Meat, Fish & Seafood 6', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 1540.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:56', '2024-09-15 23:39:43'),
(1619, 'FMD174084', 'N&H B/F Chicken Sausage (Green Chilly) (500 gms)', 'Basic description of Meat, Fish & Seafood 7', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 565.00, 10.00, 10.00, ' Ni00001', 'Nina &amp; Hager', NULL, '2024-09-15 22:50:56', '2024-09-15 23:39:43'),
(1620, 'FMD174085', 'N&H B/L Chicken Breast (500 gms)', 'Basic description of Meat, Fish & Seafood 8', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 590.00, 10.00, 10.00, ' Ni00001', 'Nina &amp; Hager', NULL, '2024-09-15 22:50:56', '2024-09-15 23:39:43'),
(1621, 'FMD174094', 'N&H Chicken Jumbo Sausage (400 gms)', 'Basic description of Meat, Fish & Seafood 9', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 470.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:56', '2024-09-15 23:39:43'),
(1622, 'FMD174095', 'N&H Chicken Mince (500 gms)', 'Basic description of Meat, Fish & Seafood 10', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 530.00, 10.00, 10.00, ' Ni00001', 'Nina &amp; Hager', NULL, '2024-09-15 22:50:56', '2024-09-15 23:39:43'),
(1623, 'FMD174091', 'N&H B/L Chicken Cubes (500 gms)', 'Basic description of Meat, Fish & Seafood 11', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 590.00, 10.00, 10.00, ' Ni00001', 'Nina &amp; Hager', NULL, '2024-09-15 22:50:56', '2024-09-15 23:39:43'),
(1624, 'FMD230988', 'Pampers Diapers 23s (LG)', 'Basic description of Baby Care 10', '1', 'Baby Care', 'NoSubCategoryCo', 'NoSubCategory', '0', 0.00, 0.00, 1266.00, 10.00, 10.00, ' Pa00001', 'Pamper', NULL, '2024-09-15 22:50:56', '2024-09-15 23:39:43'),
(1625, 'FMD174302', 'Italian Roast 250 gmFilter Grind (Extra Bold/ Dark Roast)-  (Premium / Export Quality)', 'Basic description of Beverages 14', '4', 'Beverages', '4', 'Coffee', '0', 0.00, 0.00, 690.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:56', '2024-09-15 23:39:43'),
(1626, 'FMD174099', 'N&H Hot Dog Chicken Sausage (Green Chilli) (400 gm)', 'Basic description of Meat, Fish & Seafood 12', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 450.00, 10.00, 10.00, ' Ni00001', 'Nina &amp; Hager', NULL, '2024-09-15 22:50:56', '2024-09-15 23:39:43'),
(1627, 'FMD174101', 'N&H Hot Dog Chicken Sausage (400 gms)', 'Basic description of Meat, Fish & Seafood 13', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 450.00, 10.00, 10.00, ' Ni00001', 'Nina &amp; Hager', NULL, '2024-09-15 22:50:57', '2024-09-15 23:39:43'),
(1628, 'FMD174108', 'N&H Pet Food Chicken (500 gms)', 'Basic description of Meat, Fish & Seafood 14', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 190.00, 10.00, 10.00, ' Ni00001', 'Nina &amp; Hager', NULL, '2024-09-15 22:50:57', '2024-09-15 23:39:43'),
(1629, 'FMD174114', 'N&H Salame Milano (100 gms)', 'Basic description of Meat, Fish & Seafood 15', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 620.00, 10.00, 10.00, ' Vi00001', 'Vitali', NULL, '2024-09-15 22:50:57', '2024-09-15 23:39:43'),
(1630, 'FMD174116', 'N&H Spinata Piccante (Chilli Salami) (100 gms)', 'Basic description of Meat, Fish & Seafood 16', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 490.00, 10.00, 10.00, ' Vi00001', 'Vitali', NULL, '2024-09-15 22:50:57', '2024-09-15 23:39:43'),
(1631, 'FMD174124', 'VCS Chicken BL Breast (500 gm)', 'Basic description of Meat, Fish & Seafood 17', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 390.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:57', '2024-09-15 23:39:43'),
(1632, 'FMD174125', 'VCS Chicken BL Leg (500 gm)', 'Basic description of Meat, Fish & Seafood 18', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 375.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:57', '2024-09-15 23:39:43'),
(1633, 'FMD174126', 'VCS Chicken Drumstick (700 gm)', 'Basic description of Meat, Fish & Seafood 19', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 450.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:57', '2024-09-15 23:39:43'),
(1634, 'FMD174127', 'VCS Chicken Lolly (500 gm) ( Lollipop )', 'Basic description of Meat, Fish & Seafood 20', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 290.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:57', '2024-09-15 23:39:43'),
(1635, 'FMD174128', 'VCS Chicken Mince (500 gm)', 'Basic description of Meat, Fish & Seafood 21', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 315.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:57', '2024-09-15 23:39:43'),
(1636, 'FMD174303', 'Peaberry Coffee 250 gm Filter Grind (Rare/ Limited Edition/ Sweet After After Taste/Light Roast)-  (Premium / Export Quality)', 'Basic description of Beverages 15', '4', 'Beverages', '4', 'Coffee', '0', 0.00, 0.00, 990.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:57', '2024-09-15 23:39:43'),
(1637, 'FMD174129', 'VCS Chicken Nuggets (200 gm)', 'Basic description of Meat, Fish & Seafood 22', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 220.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:57', '2024-09-15 23:39:43'),
(1638, 'FMD174130', 'VCS Chicken Salami (500gm) Per Pkt', 'Basic description of Meat, Fish & Seafood 23', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 420.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:57', '2024-09-15 23:39:43'),
(1639, 'FMD174131', 'VCS Chicken Curry Cut (500 gm)', 'Basic description of Meat, Fish & Seafood 24', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 190.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:57', '2024-09-15 23:39:43'),
(1640, 'FMD174132', 'VCS Chicken Gizzard (500 gm)', 'Basic description of Meat, Fish & Seafood 25', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 365.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:57', '2024-09-15 23:39:43'),
(1641, 'FMD174133', 'VCS Chicken Liver (500 gm)', 'Basic description of Meat, Fish & Seafood 26', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 110.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:57', '2024-09-15 23:39:43'),
(1642, 'FMD174135', 'VCS Chicken Wings (1 kg)', 'Basic description of Meat, Fish & Seafood 27', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 670.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:57', '2024-09-15 23:39:44'),
(1643, 'FMD174136', 'VCS Garlic Pepper Sausage (500 gm)', 'Basic description of Meat, Fish & Seafood 28', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 435.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:57', '2024-09-15 23:39:44'),
(1644, 'FMD174137', 'VCS Onion & Cheese Chicken Sausage (500 gm)', 'Basic description of Meat, Fish & Seafood 29', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 435.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:57', '2024-09-15 23:39:44'),
(1645, 'FMD174138', 'VCS Sausage Chicken Regular. Plain BF', 'Basic description of Meat, Fish & Seafood 30', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 375.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:57', '2024-09-15 23:39:44'),
(1646, 'FMD174139', 'VCS Sausage Chilly Chicken (500 gm)', 'Basic description of Meat, Fish & Seafood 31', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 375.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:57', '2024-09-15 23:39:44'),
(1647, 'FMD174304', 'Peaberry Coffee 250 gm Whole Beans (Rare/ Limited Edition/ Sweet After After Taste/Light Roast)-  (Premium / Export Quality)', 'Basic description of Beverages 16', '4', 'Beverages', '4', 'Coffee', '0', 0.00, 0.00, 990.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:57', '2024-09-15 23:39:44'),
(1648, 'FMD174150', 'GFM Chicken Boneless Breast (1 kg)', 'Basic description of Meat, Fish & Seafood 32', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 680.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:57', '2024-09-15 23:39:44'),
(1649, 'FMD174151', 'GFM Chicken Boneless Leg (1 kg)', 'Basic description of Meat, Fish & Seafood 33', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 685.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:57', '2024-09-15 23:39:44'),
(1650, 'FMD174152', 'GFM Chicken Bratwurst Sausage (500 gm)', 'Basic description of Meat, Fish & Seafood 34', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 615.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:57', '2024-09-15 23:39:44'),
(1651, 'FMD174153', 'GFM Chicken Breakfast Sausage (400 gm)', 'Basic description of Meat, Fish & Seafood 35', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 445.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:57', '2024-09-15 23:39:44'),
(1652, 'FMD174154', 'GFM Chicken Chilly Sausage (400 gm)', 'Basic description of Meat, Fish & Seafood 36', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 445.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:57', '2024-09-15 23:39:44'),
(1653, 'FMD174155', 'GFM Chicken Cocktail Sausage (400 gm)', 'Basic description of Meat, Fish & Seafood 37', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 445.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:57', '2024-09-15 23:39:44'),
(1654, 'FMD174156', 'GFM Chicken Drumsticks (6 pcs)', 'Basic description of Meat, Fish & Seafood 38', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 555.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:57', '2024-09-15 23:39:44'),
(1655, 'FMD174157', 'GFM Chicken Hotdog Sausage (500 gm)', 'Basic description of Meat, Fish & Seafood 39', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 615.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:57', '2024-09-15 23:39:44'),
(1656, 'FMD174158', 'GFM Chicken Lollipop (550 gm)', 'Basic description of Meat, Fish & Seafood 40', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 245.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:57', '2024-09-15 23:39:44'),
(1657, 'FMD174159', 'GFM Chicken Premium Mince Keema (1 kg)', 'Basic description of Meat, Fish & Seafood 41', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 720.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:57', '2024-09-15 23:39:44'),
(1658, 'FMD174351', 'NESCAFE Classic Pouch (50 gm)', 'Basic description of Beverages 17', '4', 'Beverages', '4', 'Coffee', '0', 0.00, 0.00, 186.00, 10.00, 10.00, ' Ne00001', 'Nescafe', NULL, '2024-09-15 22:50:57', '2024-09-15 23:39:44'),
(1659, 'FMD174160', 'GFM Chicken Salami (250 gm)', 'Basic description of Meat, Fish & Seafood 42', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 360.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:57', '2024-09-15 23:39:44'),
(1660, 'FMD174161', 'GFM Chicken Wings (1 kg)', 'Basic description of Meat, Fish & Seafood 43', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 475.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:57', '2024-09-15 23:39:44'),
(1661, 'FMD174166', 'GFM Chicken Bacon (250 gm)', 'Basic description of Meat, Fish & Seafood 44', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 360.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:57', '2024-09-15 23:39:44'),
(1662, 'FMD174168', 'GFM Chicken Ham (250 gm)', 'Basic description of Meat, Fish & Seafood 45', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 360.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:57', '2024-09-15 23:39:44'),
(1663, 'FMD176568', 'N&H Chicken-B/L Chicken Skin-On (0.84 kg)', 'Basic description of Meat, Fish & Seafood 46', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 788.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:57', '2024-09-15 23:39:44'),
(1664, 'FMD176596', 'AMP Chicken Sausage (500 gm)', 'Basic description of Meat, Fish & Seafood 47', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 365.00, 10.00, 10.00, ' Ad00001', 'Adhunik', NULL, '2024-09-15 22:50:57', '2024-09-15 23:39:44'),
(1665, 'FMD176597', 'AMP Chicken Sausage SPCL (500 gm)', 'Basic description of Meat, Fish & Seafood 48', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 440.00, 10.00, 10.00, ' Ad00001', 'Adhunik', NULL, '2024-09-15 22:50:58', '2024-09-15 23:39:44'),
(1666, 'FMD176598', 'AMP Chicken Boneless Breast (500 gm)', 'Basic description of Meat, Fish & Seafood 49', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 390.00, 10.00, 10.00, ' Ad00001', 'Adhunik', NULL, '2024-09-15 22:50:58', '2024-09-15 23:39:44'),
(1667, 'FMD176599', 'AMP Chicken Boneless Leg (500 gm)', 'Basic description of Meat, Fish & Seafood 50', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 328.00, 10.00, 10.00, ' Ad00001', 'Adhunik', NULL, '2024-09-15 22:50:58', '2024-09-15 23:39:44'),
(1668, 'FMD176600', 'AMP Chicken Drumstick (500 gm)', 'Basic description of Meat, Fish & Seafood 51', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 315.00, 10.00, 10.00, ' Ad00001', 'Adhunik', NULL, '2024-09-15 22:50:58', '2024-09-15 23:39:44'),
(1669, 'FMD174356', 'NESCAFE Classic (Two 200 gm, Packets) - 400 gm', 'Basic description of Beverages 18', '4', 'Beverages', '4', 'Coffee', '0', 0.00, 0.00, 1290.00, 10.00, 10.00, ' Ne00001', 'Nescafe', NULL, '2024-09-15 22:50:58', '2024-09-15 23:39:44'),
(1670, 'FMD176601', 'AMP Chicken Wings (500 gm)', 'Basic description of Meat, Fish & Seafood 52', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 240.00, 10.00, 10.00, ' Ad00001', 'Adhunik', NULL, '2024-09-15 22:50:58', '2024-09-15 23:39:44'),
(1671, 'FMD176602', 'AMP Chicken Dog  Biscuits (200 gm)', 'Basic description of Meat, Fish & Seafood 53', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 230.00, 10.00, 10.00, ' Ad00001', 'Adhunik', NULL, '2024-09-15 22:50:58', '2024-09-15 23:39:44'),
(1672, 'FMD176603', 'AMP Adhunik Chicken Lolly (500 gm)', 'Basic description of Meat, Fish & Seafood 54', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 265.00, 10.00, 10.00, ' Ad00001', 'Adhunik', NULL, '2024-09-15 22:50:58', '2024-09-15 23:39:44'),
(1673, 'FMD176604', 'AMP Chicken Mince (500 gm)', 'Basic description of Meat, Fish & Seafood 55', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 340.00, 10.00, 10.00, ' Ad00001', 'Adhunik', NULL, '2024-09-15 22:50:58', '2024-09-15 23:39:44'),
(1674, 'FMD176605', 'AMP Chicken Salami (500 gm)', 'Basic description of Meat, Fish & Seafood 56', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 540.00, 10.00, 10.00, ' Ad00001', 'Adhunik', NULL, '2024-09-15 22:50:58', '2024-09-15 23:39:44'),
(1675, 'FMD176606', 'AMP Chicken Whole Leg (500 gm)', 'Basic description of Meat, Fish & Seafood 57', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 315.00, 10.00, 10.00, ' Ad00001', 'Adhunik', NULL, '2024-09-15 22:50:58', '2024-09-15 23:39:44'),
(1676, 'FMD177348', 'N&H B/F Chicken Sausage (500 gms)', 'Basic description of Meat, Fish & Seafood 58', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 565.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:58', '2024-09-15 23:39:44');
INSERT INTO `products` (`id`, `product_code`, `product_name`, `product_description`, `category_id`, `category_name`, `subcategory_id`, `subcategory_name`, `delivery_target_days`, `discount`, `actual_price`, `sell_price`, `available_quantity`, `stock_quantity`, `brand_id`, `brand_name`, `primary_image`, `created_at`, `updated_at`) VALUES
(1677, 'FMD177349', 'N&H Chicken Liver (400 gms)', 'Basic description of Meat, Fish & Seafood 59', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 160.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:58', '2024-09-15 23:39:44'),
(1678, 'FMD177471', 'Chicken Leg (2.93 kg)', 'Basic description of Meat, Fish & Seafood 60', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 2334.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:58', '2024-09-15 23:39:44'),
(1679, 'FMD177472', 'Chicken Wings (1.6 kg)', 'Basic description of Meat, Fish & Seafood 61', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 1490.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:58', '2024-09-15 23:39:44'),
(1680, 'FMD174357', 'NESCAFE Classic (Frother Free) -200 gm', 'Basic description of Beverages 19', '4', 'Beverages', '4', 'Coffee', '0', 0.00, 0.00, 870.00, 10.00, 10.00, ' Ne00001', 'Nescafe', NULL, '2024-09-15 22:50:58', '2024-09-15 23:39:44'),
(1681, 'FMD177473', 'Chicken Legs (2.04 kg)', 'Basic description of Meat, Fish & Seafood 62', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 1590.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:58', '2024-09-15 23:39:44'),
(1682, 'FMD178057', 'VCS Chicken Meatballs (500 gm)', 'Basic description of Meat, Fish & Seafood 63', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 260.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:58', '2024-09-15 23:39:44'),
(1683, 'FMD175803', 'N&H Chicken Legs (0.96 kg)', 'Basic description of Meat, Fish & Seafood 64', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 758.00, 10.00, 10.00, ' Ni00001', 'Nina &amp; Hager', NULL, '2024-09-15 22:50:58', '2024-09-15 23:39:44'),
(1684, 'FMD184873', 'Chicken Wings (435 gm)', 'Basic description of Meat, Fish & Seafood 65', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 208.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:58', '2024-09-15 23:39:44'),
(1685, 'FMD185833', 'Chicken Drumsticks (435gm)', 'Basic description of Meat, Fish & Seafood 66', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 273.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:58', '2024-09-15 23:39:44'),
(1686, 'FMD184257', 'Chicken Legs (2.95 kg)', 'Basic description of Meat, Fish & Seafood 67', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 2350.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:58', '2024-09-15 23:39:44'),
(1687, 'FMD177807', 'Chicken Legs (950 gm)', 'Basic description of Meat, Fish & Seafood 68', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 750.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:58', '2024-09-15 23:39:44'),
(1688, 'FMD192051', 'Buffalo Wings  (400 gm)', 'Basic description of Meat, Fish & Seafood 69', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 485.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:58', '2024-09-15 23:39:44'),
(1689, 'FMD192052', 'Butter Chicken (300 gm)', 'Basic description of Meat, Fish & Seafood 70', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 490.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:58', '2024-09-15 23:39:44'),
(1690, 'FMD192053', 'Chicken Malai Tikka (400 gm)', 'Basic description of Meat, Fish & Seafood 71', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 560.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:58', '2024-09-15 23:39:44'),
(1691, 'FMD174365', 'NESCAFE Classic (Mason Jar Free) -100 gm', 'Basic description of Beverages 20', '4', 'Beverages', '4', 'Coffee', '0', 0.00, 0.00, 455.00, 10.00, 10.00, ' Ne00001', 'Nescafe', NULL, '2024-09-15 22:50:58', '2024-09-15 23:39:44'),
(1692, 'FMD192054', 'Chicken Tandoori Drumstick (460 gm)', 'Basic description of Meat, Fish & Seafood 72', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 575.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:58', '2024-09-15 23:39:44'),
(1693, 'FMD192055', 'Honey Glazed Wings (400 gm)', 'Basic description of Meat, Fish & Seafood 73', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 485.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:58', '2024-09-15 23:39:44'),
(1694, 'FMD191960', 'VCS Chicken Nuggets (500 gms)', 'Basic description of Meat, Fish & Seafood 74', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 305.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:58', '2024-09-15 23:39:44'),
(1695, 'FMD180682', 'Chicken Whole Leg (1.23 kg)', 'Basic description of Meat, Fish & Seafood 75', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 790.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:58', '2024-09-15 23:39:44'),
(1696, 'FMD182300', 'Chicken Wings (780 gm)', 'Basic description of Meat, Fish & Seafood 76', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 575.00, 10.00, 10.00, ' Ni00001', 'Nina &amp; Hager', NULL, '2024-09-15 22:50:58', '2024-09-15 23:39:44'),
(1697, 'FMD177805', 'Chicken Whole Leg (1.24 kg)', 'Basic description of Meat, Fish & Seafood 77', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 796.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:58', '2024-09-15 23:39:44'),
(1698, 'FMD188314', 'Quail Meat Whole Cut (1 kg)', 'Basic description of Meat, Fish & Seafood 78', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 1140.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:58', '2024-09-15 23:39:44'),
(1699, 'FMD182415', 'German Bratwurst (BBQ Chicken Sausage) (400 gm)', 'Basic description of Meat, Fish & Seafood 79', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 470.00, 10.00, 10.00, ' Ni00001', 'Nina &amp; Hager', NULL, '2024-09-15 22:50:58', '2024-09-15 23:39:44'),
(1700, 'FMD183490', 'Chicken Whole Leg (1.89 kg)', 'Basic description of Meat, Fish & Seafood 80', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 1218.50, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:58', '2024-09-15 23:39:44'),
(1701, 'FMD184120', 'Chicken Whole Leg (500 gm)', 'Basic description of Meat, Fish & Seafood 81', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 390.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:58', '2024-09-15 23:39:44'),
(1702, 'FMD174422', 'Lamjung (Washed) Beans 1000 gm', 'Basic description of Beverages 21', '4', 'Beverages', '4', 'Coffee', '0', 0.00, 0.00, 2490.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:58', '2024-09-15 23:39:44'),
(1703, 'FMD181172', 'N&H Chicken Legs (950 gm)', 'Basic description of Meat, Fish & Seafood 82', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 750.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:58', '2024-09-15 23:39:44'),
(1704, 'FMD212387', 'N&H Chicken Legs (515 gm)', 'Basic description of Meat, Fish & Seafood 83', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 334.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:58', '2024-09-15 23:39:44'),
(1705, 'FMD213352', 'N&H Chicken Wings (3.84 kg)', 'Basic description of Meat, Fish & Seafood 84', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 2870.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:58', '2024-09-15 23:39:44'),
(1706, 'FMD215086', 'N&H Chicken Legs (2.03 Kg)', 'Basic description of Meat, Fish & Seafood 85', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 1615.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:58', '2024-09-15 23:39:44'),
(1707, 'FMD218956', 'AMP Chicken Drumstick (700 gm)', 'Basic description of Meat, Fish & Seafood 86', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 450.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:58', '2024-09-15 23:39:44'),
(1708, 'FMD218931', 'N&H Chicken Wings (790 gm)', 'Basic description of Meat, Fish & Seafood 87', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 582.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:58', '2024-09-15 23:39:44'),
(1709, 'FMD220204', 'HS Boneless Chicken Breast (500 gm)', 'Basic description of Meat, Fish & Seafood 88', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 340.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:58', '2024-09-15 23:39:44'),
(1710, 'FMD221108', 'AMP Chicken Lolly (635 gm)', 'Basic description of Meat, Fish & Seafood 89', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 384.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:58', '2024-09-15 23:39:44'),
(1711, 'FMD221845', 'Chicken Drumstick  (570 gm)', 'Basic description of Meat, Fish & Seafood 90', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 360.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:58', '2024-09-15 23:39:44'),
(1712, 'FMD197266', 'Chicken Wings (970 gm)', 'Basic description of Meat, Fish & Seafood 91', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 918.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:58', '2024-09-15 23:39:44'),
(1713, 'FMD174423', 'Nuwakot (Washed) Filter Grind 250 gm', 'Basic description of Beverages 22', '4', 'Beverages', '4', 'Coffee', '0', 0.00, 0.00, 780.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:58', '2024-09-15 23:39:44'),
(1714, 'FMD197302', 'Chicken Drumstick (540 gm)', 'Basic description of Meat, Fish & Seafood 92', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 341.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:58', '2024-09-15 23:39:44'),
(1715, 'FMD199908', 'Chicken Boneless Breast (1 kg)', 'Basic description of Meat, Fish & Seafood 93', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 690.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:58', '2024-09-15 23:39:44'),
(1716, 'FMD199909', 'Chicken Whole Leg (580 gm)', 'Basic description of Meat, Fish & Seafood 94', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 367.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:58', '2024-09-15 23:39:44'),
(1717, 'FMD205772', 'Chicken Drumstick (475 gm)', 'Basic description of Meat, Fish & Seafood 95', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 298.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:58', '2024-09-15 23:39:44'),
(1718, 'FMD204310', 'Chicken Wings (810 gm)', 'Basic description of Meat, Fish & Seafood 96', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 597.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:58', '2024-09-15 23:39:44'),
(1719, 'FMD205960', 'Chicken Legs (2.03 kg)', 'Basic description of Meat, Fish & Seafood 97', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 1614.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:58', '2024-09-15 23:39:44'),
(1720, 'FMD207205', 'Chicken Boneless Breast  (500 gm) (A)', 'Basic description of Meat, Fish & Seafood 98', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 340.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:58', '2024-09-15 23:39:44'),
(1721, 'FMD207528', 'Chicken Drumstick (900 gm - 1 pc)', 'Basic description of Meat, Fish & Seafood 99', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 555.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:58', '2024-09-15 23:39:44'),
(1722, 'FMD207529', 'Chicken Wings (850 gm)', 'Basic description of Meat, Fish & Seafood 100', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 670.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:58', '2024-09-15 23:39:44'),
(1723, 'FMD207530', 'Chicken Breast (500 gm)', 'Basic description of Meat, Fish & Seafood 101', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 340.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:58', '2024-09-15 23:39:44'),
(1724, 'FMD174424', 'Lamjung (Washed) Beans 500 gm', 'Basic description of Beverages 23', '4', 'Beverages', '4', 'Coffee', '0', 0.00, 0.00, 1240.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:58', '2024-09-15 23:39:44'),
(1725, 'FMD203271', 'VCS Chicken Drumstick  (700 gm)', 'Basic description of Meat, Fish & Seafood 102', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 450.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:58', '2024-09-15 23:39:44'),
(1726, 'FMD203366', 'Chicken Whole Leg (630 gm)', 'Basic description of Meat, Fish & Seafood 103', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 399.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:58', '2024-09-15 23:39:44'),
(1727, 'FMD203851', 'N&H German Bratwurst (BBQ Chicken Sausage) (400 gms)', 'Basic description of Meat, Fish & Seafood 104', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 470.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:58', '2024-09-15 23:39:44'),
(1728, 'FMD204017', 'Chicken Drumstick (520 gm)', 'Basic description of Meat, Fish & Seafood 105', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 328.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:58', '2024-09-15 23:39:44'),
(1729, 'FMD192232', 'Chicken Wings (1.680 kg)', 'Basic description of Meat, Fish & Seafood 106', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 830.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:58', '2024-09-15 23:39:44'),
(1730, 'FMD192527', 'Chicken Drumstick (530 gm)', 'Basic description of Meat, Fish & Seafood 107', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 467.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:58', '2024-09-15 23:39:44'),
(1731, 'FMD193508', 'VCS Chicken BL Leg  (2 kg)', 'Basic description of Meat, Fish & Seafood 108', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 1470.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:58', '2024-09-15 23:39:44'),
(1732, 'FMD193715', 'Chicken Lolley (675 gm)', 'Basic description of Meat, Fish & Seafood 109', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 361.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:58', '2024-09-15 23:39:44'),
(1733, 'FMD193733', 'Chicken Drumstick (695 gm)', 'Basic description of Meat, Fish & Seafood 110', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 441.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:58', '2024-09-15 23:39:44'),
(1734, 'FMD195307', 'Chicken Wings (398 gm)', 'Basic description of Meat, Fish & Seafood 111', '13', 'Meat, Fish & Seafood', '22', 'Chicken', '0', 0.00, 0.00, 189.00, 10.00, 10.00, NULL, NULL, NULL, '2024-09-15 22:50:58', '2024-09-15 23:39:44');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) NOT NULL,
  `product_code` varchar(255) NOT NULL,
  `image_path` varchar(512) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_code`, `image_path`, `created_at`, `updated_at`) VALUES
(1, 'FMD177357', 'productimages/FMD177357/7528569220099294281145799014285214257309109.png', '2024-09-16 03:45:35', '2024-09-16 03:45:35'),
(2, 'FMD230989', 'productimages/FMD230989/263077814244302990933519472562788611160543.png', '2024-09-16 03:45:36', '2024-09-16 03:45:36'),
(3, 'FMD230989', 'productimages/FMD230989/421723784462_category.jpg', '2024-09-16 03:45:36', '2024-09-16 03:45:36'),
(4, 'FMD177357', 'productimages/FMD177357/New-Born-Care.png', '2024-09-16 03:51:39', '2024-09-16 03:51:39');

-- --------------------------------------------------------

--
-- Table structure for table `provinces`
--

CREATE TABLE `provinces` (
  `id` bigint(20) NOT NULL,
  `province_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `provinces`
--

INSERT INTO `provinces` (`id`, `province_name`, `created_at`, `updated_at`) VALUES
(1, 'Province 1', '2024-09-12 03:02:42', '2024-09-12 03:02:42'),
(2, 'Madhesh', '2024-09-12 03:07:03', '2024-09-12 03:07:03'),
(3, 'Bagmati', '2024-09-12 03:07:11', '2024-09-12 03:07:11'),
(4, 'Gandaki', '2024-09-12 03:07:21', '2024-09-12 03:07:21'),
(5, 'Lumbini', '2024-09-12 03:07:28', '2024-09-12 03:07:28'),
(6, 'Karnali', '2024-09-12 03:07:37', '2024-09-12 03:07:37'),
(7, 'Sudurpaschim', '2024-09-12 03:07:47', '2024-09-12 03:07:47');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('rLWKaqokOqTMk0hbuIPhYzv2NeXGWhWERbXeZhjk', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiVm82cDJWSFhGaW45dU5RVmpjWTZuUW5hNUpEelhjbkt1cmdydG9OZSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fXM6MzoidXJsIjthOjE6e3M6ODoiaW50ZW5kZWQiO3M6Mjk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hY2NvdW50Ijt9fQ==', 1725883856),
('xh83V75RiQKfWnOsqCETEkw3W3MNnH1KSPs0Tlaw', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiYm45NVZaUEd1VENGdXR2bEJ4T0RobHRTT2VjTE45U0gzVW9KUXQwOSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NDoiY2FydCI7YToyOntpOjMzO3M6MToiMiI7aToyNDtzOjE6IjIiO31zOjM6InVybCI7YToxOntzOjg6ImludGVuZGVkIjtzOjIxOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAiO319', 1725879230);

-- --------------------------------------------------------

--
-- Table structure for table `set_shipping`
--

CREATE TABLE `set_shipping` (
  `id` bigint(20) NOT NULL,
  `province_id` bigint(20) NOT NULL,
  `city` varchar(255) NOT NULL,
  `shipping_cost` decimal(10,2) NOT NULL DEFAULT 0.00,
  `remarks` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `set_shipping`
--

INSERT INTO `set_shipping` (`id`, `province_id`, `city`, `shipping_cost`, `remarks`, `created_at`, `updated_at`) VALUES
(1, 3, 'Kathmandu', 160.00, NULL, '2024-09-08 23:55:39', '2024-09-09 02:24:05'),
(2, 4, 'Pokhara', 310.00, NULL, '2024-09-08 23:57:08', '2024-09-09 00:10:53'),
(3, 3, 'Bhaktapur', 140.00, NULL, '2024-09-09 01:22:47', '2024-09-09 01:22:47'),
(4, 6, 'Ilam', 300.00, NULL, '2024-09-12 03:12:06', '2024-09-12 03:12:06');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `account_type` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `two_factor_secret` timestamp NULL DEFAULT NULL,
  `two_factor_recovery_codes` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `address`, `phone`, `country`, `account_type`, `email_verified_at`, `two_factor_secret`, `two_factor_recovery_codes`, `password`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
(1, 'Janam Pandey', 'jananpandey1995@gmail.com', 'Kathmandu, Nepal', '9866077949', 'Nepal', 'A', '2024-09-03 06:20:27', NULL, NULL, '$2y$12$mPMrlpDRBD4Lcjf4GaC7.O4qr0hRqent5IIyBMiI5OTHRQ4tGHA0e', 'UCXngQQubzQrKblrgi2HNxoaa82jUnpUXtNXwr7izJfnOHTfrTNJBv6lwYhs', NULL, '11725365302_profile.jpg', '2024-09-03 06:20:28', '2024-09-05 05:50:23');

-- --------------------------------------------------------

--
-- Table structure for table `website_data`
--

CREATE TABLE `website_data` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `company_logo_header` varchar(255) DEFAULT NULL,
  `company_logo_footer` varchar(255) DEFAULT NULL,
  `primary_email` varchar(255) NOT NULL,
  `secondary_email` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `primary_phone` varchar(255) DEFAULT NULL,
  `secondary_phone` varchar(255) DEFAULT NULL,
  `website_link` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `website_data`
--

INSERT INTO `website_data` (`id`, `company_name`, `company_logo_header`, `company_logo_footer`, `primary_email`, `secondary_email`, `address`, `primary_phone`, `secondary_phone`, `website_link`, `created_at`, `updated_at`) VALUES
(1, 'Global Tech Nepal Pvt. Ltd.', '1725342006_header.png', '1725342006_footer.png', 'info@globaltech.com.np', NULL, 'Teku, Kathmandu', '9866077949', '9813074888', 'https://globaltech.com.np', NULL, '2024-09-05 05:36:09');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `api`
--
ALTER TABLE `api`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `carousel_images`
--
ALTER TABLE `carousel_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `province_id` (`province_id`),
  ADD KEY `city_id` (`city_id`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_code` (`product_code`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customers_email_unique` (`email`);

--
-- Indexes for table `customer_address_book`
--
ALTER TABLE `customer_address_book`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `province` (`province_id`),
  ADD KEY `city` (`city_id`);

--
-- Indexes for table `delivery_information`
--
ALTER TABLE `delivery_information`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `inquiries`
--
ALTER TABLE `inquiries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `newsletter_subscribers_list`
--
ALTER TABLE `newsletter_subscribers_list`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `newsletter_subscribers_list_email_unique` (`email`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_code` (`product_code`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `provinces`
--
ALTER TABLE `provinces`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `set_shipping`
--
ALTER TABLE `set_shipping`
  ADD PRIMARY KEY (`id`),
  ADD KEY `province` (`province_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `website_data`
--
ALTER TABLE `website_data`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `api`
--
ALTER TABLE `api`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `carousel_images`
--
ALTER TABLE `carousel_images`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `customer_address_book`
--
ALTER TABLE `customer_address_book`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `delivery_information`
--
ALTER TABLE `delivery_information`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inquiries`
--
ALTER TABLE `inquiries`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `newsletter_subscribers_list`
--
ALTER TABLE `newsletter_subscribers_list`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1735;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `provinces`
--
ALTER TABLE `provinces`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `set_shipping`
--
ALTER TABLE `set_shipping`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `website_data`
--
ALTER TABLE `website_data`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_items_fk_1` FOREIGN KEY (`product_code`) REFERENCES `products` (`product_code`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `customer_address_book`
--
ALTER TABLE `customer_address_book`
  ADD CONSTRAINT `customer_address_book_fk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `customer_address_book_fk_2` FOREIGN KEY (`province_id`) REFERENCES `provinces` (`id`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `customer_address_book_fk_3` FOREIGN KEY (`city_id`) REFERENCES `set_shipping` (`id`) ON UPDATE NO ACTION;

--
-- Constraints for table `set_shipping`
--
ALTER TABLE `set_shipping`
  ADD CONSTRAINT `set_shipping_fk_1` FOREIGN KEY (`province_id`) REFERENCES `provinces` (`id`) ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
