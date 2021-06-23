-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 31, 2021 at 10:23 AM
-- Server version: 10.5.8-MariaDB
-- PHP Version: 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `00a217-shipit-valley`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_super_admins` tinyint(1) NOT NULL DEFAULT 0,
  `type` enum('admin','company') NOT NULL,
  `role` enum('add','edit','delete') DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `phone`, `email`, `email_verified_at`, `password`, `remember_token`, `updated_at`, `is_super_admins`, `type`, `role`, `is_active`) VALUES
(1, 'demo@tatawwar.com', '159753753', 'demo@tmtgps.com', NULL, '$2y$10$M5J92MXHZ2JNGS11x1MrSemV8luqguQqJylJWUnFBAkbUgH8ZcHqy', NULL, NULL, 1, 'admin', NULL, NULL),
(13, 'El MOSTAFA', '0213513513554', 'mostafa@tmtgps.com', NULL, '$2y$10$Kb6kAQ2x9z.0P2x6dhFK9uo59WV9rcbejqw7OC6T8JPdhsKJc/m.m', NULL, NULL, 0, 'company', NULL, 1),
(14, 'super_admin', '012345612346', 'super_admin@tmtgps.com', NULL, '$2y$10$6xxTbD9p7evU0iZKFu2YIed1GzrPuBbgIKH0CkVeulPt./R6rW13i', NULL, NULL, 1, 'admin', 'add', NULL),
(15, 'admin_add', '0123123123123', 'admin_add@tmtgps.com', NULL, '$2y$10$M5J92MXHZ2JNGS11x1MrSemV8luqguQqJylJWUnFBAkbUgH8ZcHqy', NULL, NULL, 1, 'admin', 'add', NULL),
(16, 'admin_edit', '013213515138', 'admin_edit@tmtgps.com', NULL, '$2y$10$.vuCIWxemB5lwbFI.9A98OfMzCh2ur4GvLvoT6v7aqH4GVI1zp.8e', NULL, NULL, 0, 'admin', 'edit', NULL),
(17, 'admin_delete', '013513813914', 'admin_delete@tmtgps.com', NULL, '$2y$10$TU6I1cKHalNAr17qQRaEd.Xlh63HV6jqclIbHZ5fqQTtdcCS1gA9O', NULL, NULL, 0, 'admin', 'delete', NULL),
(18, 'company', '015151515151', 'company@tmtgps.com', NULL, '$2y$10$Cu8iOM9CR7dtPeVoYx5Zuu2PF43WoNqO1M0oFIQqu7eRyJqFbPkPq', NULL, NULL, 0, 'company', NULL, 1),
(20, 'admin_123', '0123456890', 'asmaa@gmail.com', NULL, '$2y$10$A/JGudK5p89HU3AUd79fxeS0aJ6qP8OR8kEO7eWkhY0YabEyRfi0C', NULL, NULL, 1, 'admin', NULL, NULL),
(21, 'company', '0122334455', 'company@tatawar.com', NULL, '$2y$10$6xxTbD9p7evU0iZKFu2YIed1GzrPuBbgIKH0CkVeulPt./R6rW13i', NULL, NULL, 0, 'company', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bank_accounts`
--

CREATE TABLE `bank_accounts` (
  `id` int(11) NOT NULL,
  `name_ar` varchar(100) NOT NULL,
  `name_en` varchar(100) NOT NULL,
  `image` varchar(255) NOT NULL,
  `number` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bank_accounts`
--

INSERT INTO `bank_accounts` (`id`, `name_ar`, `name_en`, `image`, `number`, `created_at`) VALUES
(4, 'بنك مصر', 'banq masr', 'https://shipit.projects.tmtgps.me/uploads/users/nKS3EZrTXD3HdA8mjzybCwh0tjhl1g1562071980.jpg', '1235987556', '2019-07-02 15:53:07'),
(5, 'البنك الاهلي المصري', 'Egyptian National Bank', 'https://shipit.projects.tmtgps.me/uploads/users/xnNa6NHvYnQc9xAvzvipwUjCW5YXo51566752371.png', '873928801726', '2019-08-25 19:59:08');

-- --------------------------------------------------------

--
-- Table structure for table `bills`
--

CREATE TABLE `bills` (
  `id` int(11) NOT NULL,
  `orders_id` int(11) NOT NULL,
  `cost` double NOT NULL,
  `discount` double DEFAULT NULL,
  `payment_type` enum('online','offline') DEFAULT NULL,
  `status` enum('waiting','paid','refused') NOT NULL DEFAULT 'waiting',
  `created_at` datetime NOT NULL,
  `fees` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bills`
--

INSERT INTO `bills` (`id`, `orders_id`, `cost`, `discount`, `payment_type`, `status`, `created_at`, `fees`) VALUES
(33, 50, 500, NULL, 'offline', 'paid', '2019-09-04 15:15:09', 15),
(35, 52, 500, NULL, 'offline', 'paid', '2019-09-04 16:41:09', 15),
(39, 56, 40, NULL, 'offline', 'paid', '2019-09-08 14:56:09', 15),
(40, 57, 9999, NULL, 'offline', 'waiting', '2019-09-08 15:09:09', 15),
(41, 58, 40, NULL, 'offline', 'waiting', '2019-09-08 18:18:09', 15),
(42, 59, 40, NULL, 'offline', 'waiting', '2019-09-09 15:05:09', NULL),
(43, 60, 9999, NULL, 'offline', 'paid', '2019-09-15 15:01:09', 15),
(44, 61, 500, NULL, 'offline', 'waiting', '2019-09-15 15:10:09', 15),
(45, 62, 9999, NULL, 'offline', 'paid', '2019-09-15 16:22:09', 15),
(70, 87, 500, NULL, NULL, 'waiting', '2019-09-17 18:16:09', NULL),
(73, 90, 200, NULL, 'offline', 'paid', '2019-09-23 14:18:09', 15),
(77, 94, 1000, NULL, NULL, 'waiting', '2019-09-23 18:25:09', NULL),
(224, 241, 40, NULL, 'offline', 'waiting', '2019-12-24 17:52:12', NULL),
(225, 242, 1000, NULL, 'offline', 'waiting', '2020-02-09 11:21:02', NULL),
(226, 243, 1000, NULL, 'offline', 'waiting', '2020-02-09 21:08:02', NULL),
(228, 245, 1000, 15, NULL, 'waiting', '2021-02-22 20:35:02', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(11) NOT NULL,
  `contacts_types_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `users_id` int(11) DEFAULT NULL,
  `drivers_id` int(11) DEFAULT NULL,
  `code` varchar(5) NOT NULL,
  `status` enum('open','closed') NOT NULL DEFAULT 'open',
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `contacts_types_id`, `message`, `users_id`, `drivers_id`, `code`, `status`, `created_at`) VALUES
(10, 10, 'hiii 217 project', NULL, 24, '56264', 'open', '2019-08-22 17:06:08'),
(11, 10, 'غبغبعبعبعبعبه', NULL, 24, '88151', 'open', '2019-08-22 17:29:08'),
(12, 11, 'غبغبعبعبعبعبه', NULL, 24, '47622', 'open', '2019-08-22 17:30:08'),
(13, 10, 'علاعةغى5ر5ب', NULL, 24, '35550', 'open', '2019-08-22 17:32:08'),
(14, 10, 'علععلعلب6ب6لعىنى', NULL, 24, '35269', 'open', '2019-08-22 17:35:08'),
(15, 11, 'hiii 217 project', NULL, 24, '22423', 'open', '2019-08-22 17:53:08'),
(16, 11, 'لتهاهاهانةهةهةعىغبفؤغهل6بة7ل', NULL, 24, '14409', 'open', '2019-08-22 17:56:08'),
(17, 10, 'لتهاهاهانةهةهةعىغبفؤغهل6بة7ل', NULL, 24, '78055', 'closed', '2019-08-22 17:56:08'),
(18, 11, 'wwwwwwwwww', NULL, 24, '75134', 'closed', '2019-08-22 17:58:08'),
(19, 11, 'تنبننبتؤتبن', 5, NULL, '68447', 'open', '2019-08-22 19:29:08'),
(20, 10, 'hi project 217 admin', 14, NULL, '59698', 'open', '2019-08-25 19:16:08'),
(21, 11, 'hi project 217 admin', 14, NULL, '57598', 'open', '2019-08-25 19:20:08'),
(27, 12, 'fffffffffff', NULL, 41, '11392', 'open', '2019-08-28 13:56:08'),
(28, 10, 'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff', NULL, 41, '52588', 'open', '2019-08-28 13:58:08'),
(29, 10, 'aaassssssssssssddff', 18, NULL, '39396', 'open', '2019-09-02 23:25:09'),
(30, 11, 'assddffffgghhhfghgdddfff', 18, NULL, '56944', 'open', '2019-09-02 23:30:09'),
(31, 11, 'assddffffgghhhfghgdddfff', 18, NULL, '44109', 'open', '2019-09-02 23:31:09'),
(32, 11, 'ddddddssffgggfdggfffff', 18, NULL, '20149', 'open', '2019-09-02 23:32:09'),
(33, 11, 'ssfgfdggffffffgvfffggggg', 18, NULL, '38853', 'open', '2019-09-02 23:33:09'),
(34, 11, 'ssddccsssdggffdddggv', 18, NULL, '58796', 'open', '2019-09-02 23:35:09'),
(35, 10, 'testing complaints', 28, NULL, '13344', 'open', '2019-09-15 14:05:09'),
(36, 12, 'fydtxgchcgzzrchcvhvhcgxtxycyvuvjbjbibkbjbjvycyctxgcgcyctxgchchchcyxychvhccxtxtxhchvfydyfuvuyfr6s5567fycycugjxjfzfjxhkfiydyicxhxycgc', 28, NULL, '30156', 'open', '2019-09-15 14:06:09'),
(37, 10, 'تبتبهبنبنلمىىنى', 28, NULL, '30740', 'open', '2019-09-16 00:07:09'),
(38, 10, 'The best way to get a good feel for the most important part of your business is to provide you with a good understanding of the business and business with you but it will take a few minutes to complete the process and get your business to work with your business plan and your business and your', NULL, 57, '61434', 'open', '2019-09-23 12:27:09'),
(39, 11, 'The best way to get a good feel for the most important part of your business is to provide you with a good understanding of the business and business with you but it will take a few minutes to complete the process and get your business to work with your business plan and your business and your', NULL, 57, '82085', 'open', '2019-09-23 12:27:09'),
(40, 12, 'The best way to get a good feel for the most important part of your business is to provide you with a good understanding of the business and business with you but it will take a few minutes to complete the process and get your business to work with your business plan and your business and your', NULL, 57, '84353', 'open', '2019-09-23 12:27:09'),
(41, 10, 'The only reason', NULL, 57, '28901', 'open', '2019-09-23 12:52:09'),
(42, 10, 'The only thing nly reason', NULL, 57, '26868', 'open', '2019-09-23 12:52:09'),
(43, 11, 'Nzfjhfhrujffjfj', NULL, 57, '37434', 'open', '2019-09-23 13:09:09'),
(44, 11, 'Vgvybyvyctctvyvyvt', NULL, 59, '70879', 'open', '2019-09-23 13:33:09'),
(45, 11, 'Fjfnnfnnfndb', NULL, 59, '77891', 'open', '2019-09-23 13:33:09'),
(46, 10, 'تيست ارسال شكوى', 35, NULL, '94241', 'open', '2019-09-25 15:05:09'),
(47, 11, 'I am going to try and get a few things done today', 35, NULL, '77700', 'open', '2019-09-25 15:07:09'),
(48, 10, 'I am not sure if you are aware', NULL, 61, '61321', 'open', '2019-09-29 13:21:09'),
(49, 10, 'The best way 3333', 58, NULL, '42401', 'open', '2019-12-02 13:09:12'),
(50, 11, 'Gcyugycycyvyvyvucygtctctf', NULL, 67, '69250', 'open', '2019-12-02 17:11:12'),
(51, 10, 'I\'m stuck in order page', 58, NULL, '30390', 'open', '2019-12-04 12:23:12'),
(52, 11, 'I need to change my info', NULL, 60, '65713', 'open', '2019-12-11 14:13:12'),
(53, 10, 'Xxdffggghhhhhhhgghgffddd', NULL, 46, '41705', 'open', '2020-06-28 20:09:06'),
(54, 10, 'test asdasd', 67, NULL, '59151', 'open', '2021-02-22 20:20:02');

-- --------------------------------------------------------

--
-- Table structure for table `contacts_types`
--

CREATE TABLE `contacts_types` (
  `id` int(11) NOT NULL,
  `name_ar` varchar(45) NOT NULL,
  `name_en` varchar(45) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contacts_types`
--

INSERT INTO `contacts_types` (`id`, `name_ar`, `name_en`, `created_at`) VALUES
(10, 'شكوى .', 'complains .', '2019-06-28 21:49:06'),
(11, 'اقتراح', 'Suggest', '2019-07-02 03:19:07'),
(12, 'ابلاغ', 'Report', '2019-08-26 14:44:08');

-- --------------------------------------------------------

--
-- Table structure for table `discount_code`
--

CREATE TABLE `discount_code` (
  `id` int(11) NOT NULL,
  `code` varchar(5) NOT NULL,
  `discount` double NOT NULL,
  `count` int(11) NOT NULL,
  `end_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `discount_code`
--

INSERT INTO `discount_code` (`id`, `code`, `discount`, `count`, `end_date`, `is_active`, `created_at`) VALUES
(3, '12312', 15, 0, '2019-06-18 12:46:16', 1, '2019-06-26 00:00:00'),
(4, '62012', 2, 2, '2019-01-01 00:00:00', 1, '2019-06-27 21:15:06'),
(5, '79294', 10, 10, '2019-02-01 00:00:00', 1, '2019-06-27 21:22:06'),
(6, '33418', 100, 10, '2019-01-01 00:00:00', 1, '2019-06-27 21:23:06'),
(7, '19490', 50, 55, '2019-01-01 00:00:00', 0, '2019-06-27 21:35:06'),
(9, '14464', 50, 55, '2019-01-01 00:00:00', 0, '2019-06-27 21:37:06'),
(10, '99101', 50, 55, '2019-01-01 00:00:00', 1, '2019-06-27 21:38:06'),
(12, '96278', 1, 12, '2019-01-01 00:00:00', 1, '2019-06-27 21:39:06'),
(14, '38937', 12, 12, '2019-02-01 00:00:00', 1, '2019-06-27 21:40:06'),
(15, '42732', 12, 12, '2019-02-01 00:00:00', 1, '2019-06-27 21:42:06'),
(16, '66009', 12, 12, '2019-02-01 00:00:00', 1, '2019-06-27 21:42:06'),
(17, '43528', 12, 12, '2019-02-01 00:00:00', 1, '2019-06-27 21:45:06'),
(18, '76837', 12, 12, '2019-02-01 00:00:00', 1, '2019-06-27 21:46:06'),
(19, '56142', 12, 12, '2019-02-01 00:00:00', 1, '2019-06-27 21:46:06'),
(20, '75313', 12, 12, '2019-02-01 00:00:00', 1, '2019-06-27 21:47:06'),
(21, '15675', 12, 12, '2019-02-01 00:00:00', 1, '2019-06-27 21:47:06'),
(22, '16042', 12, 12, '2019-02-01 00:00:00', 1, '2019-06-27 21:48:06'),
(23, '69606', 12, 12, '2019-02-01 00:00:00', 1, '2019-06-27 21:48:06'),
(24, '66185', 12, 12, '2019-02-01 00:00:00', 1, '2019-06-27 21:49:06'),
(25, '55459', 25, 19, '2020-04-11 00:00:00', 1, '2019-08-26 14:19:08'),
(27, '62992', 25, 13, '2020-04-11 00:00:00', 1, '2019-08-26 14:20:08'),
(28, '83377', 10, 10, '2019-12-31 23:59:00', 1, '2019-08-27 11:52:08'),
(29, '58082', 10, 10, '2019-12-31 23:59:00', 1, '2019-08-27 11:52:08'),
(30, '34917', 10, 10, '2019-12-31 23:59:00', 1, '2019-08-27 11:53:08'),
(31, '92334', 10, 10, '2019-12-31 23:59:00', 1, '2019-08-27 11:53:08'),
(32, '25623', 50, 50, '2019-01-01 00:00:00', 1, '2019-08-27 11:56:08'),
(33, '29992', 50, 50, '2019-01-01 00:00:00', 1, '2019-08-27 11:56:08'),
(34, '51419', 50, 50, '2019-01-01 00:00:00', 1, '2019-08-27 11:56:08'),
(35, '98612', 50, 50, '2019-01-01 00:00:00', 1, '2019-08-27 11:57:08');

-- --------------------------------------------------------

--
-- Table structure for table `drivers`
--

CREATE TABLE `drivers` (
  `id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `name` varchar(100) NOT NULL,
  `country_code` varchar(6) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `password` varchar(255) NOT NULL,
  `car_name` varchar(100) NOT NULL,
  `car_model` varchar(100) NOT NULL,
  `car_license_number` varchar(100) NOT NULL,
  `driving_license_image` varchar(255) NOT NULL,
  `car_license_image` varchar(255) NOT NULL,
  `id_image` varchar(255) NOT NULL,
  `car_photo` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `is_verified` tinyint(1) NOT NULL DEFAULT 0,
  `api_token` varchar(255) NOT NULL,
  `language` enum('ar','en') NOT NULL,
  `created_at` datetime NOT NULL,
  `trucks_types_id` int(11) NOT NULL,
  `locations_id` int(11) DEFAULT NULL,
  `companies_id` int(11) DEFAULT NULL,
  `fees` double DEFAULT NULL,
  `firebase_token` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `drivers`
--

INSERT INTO `drivers` (`id`, `image`, `name`, `country_code`, `phone`, `password`, `car_name`, `car_model`, `car_license_number`, `driving_license_image`, `car_license_image`, `id_image`, `car_photo`, `is_active`, `is_verified`, `api_token`, `language`, `created_at`, `trucks_types_id`, `locations_id`, `companies_id`, `fees`, `firebase_token`, `email`) VALUES
(5, 'https://shipit.projects.tmtgps.me/uploads/users/1P8nw1i3xJZ6qBql.jpg', 'mostafa', '002', '+0111320024508', '$2y$10$7sa5HAzAyHOiafCyz1eF3OVO066sZfecMcohLwPz51T9eXtOgbMIa', 'mercedes', '2010', 'nnnnnnnnnnnnnnnn', 'https://shipit.projects.tmtgps.me/uploads/users/CgBwSgfO3Zazmv2O.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/1P8nw1i3xJZ6qBql.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/Qe1I0lQDDD7yYnBE.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/umfyJvbK7VEDBV5f.jpg', 1, 1, 'ZIubPQRpZ2SqGusMMPizVYlKXD2B3nS5JJasSUQr3wS1ieBVpvkRrtttrQ8PS4derKfdi', 'en', '2019-06-29 19:48:06', 8, 62, 1, 100, 'mahmoud', 'email@emaiel.com'),
(6, 'https://shipit.projects.tmtgps.me/uploads/users/YZee2EAphVe28EfqLgRluq97Q98IQD1561993181.PNG', 'nyc', '52', '01000521545', '$2y$10$7q5EiwqmULfseJX.v6.fHO6E2c.KoBE/If2qh8fjhBp52Y0pvafRq', '12456', '1245', '029615', 'https://shipit.projects.tmtgps.me/uploads/users/4EFnKTxWJuevhrudukuE9NBJ4Z2Evf1561993181.PNG', 'https://shipit.projects.tmtgps.me/uploads/users/YZee2EAphVe28EfqLgRluq97Q98IQD1561993181.PNG', 'https://shipit.projects.tmtgps.me/uploads/users/hGYMxtaRwPHGoiHn8Yyhrh1T1EsXkL1561993181.PNG', 'https://shipit.projects.tmtgps.me/uploads/users/6DnHgpf5DHODgCohvp5iF2W2EXFA281561993181.PNG', 1, 0, 'EWaVLrJt3lnJq5lhKi0SECoUJMOAnaEXAq95oEV0a0n2dSdcvp6wvL2eYUHhjUuZ55Xnb', 'ar', '2019-07-01 17:59:07', 8, NULL, NULL, 52, NULL, NULL),
(7, 'https://shipit.projects.tmtgps.me/uploads/users/zr2jGWKOdA4J9mTw.jpg', 'mostafa ramdan', '1000', '+01112284810', '$2y$10$qyjAQlVlWmt5rXEBVEW1GO8Qxsc69WzCBDga78EfSvdaQYWXCWvDa', 'mercrdes', '2010', 'nnnnnnnnnnnnnnnn', 'https://shipit.projects.tmtgps.me/uploads/users/RuVaQaIOoXnPy8Af.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/zr2jGWKOdA4J9mTw.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/nOymi42ZkvHSo14w.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/kt30sqiuSUdYExYL.jpg', 1, 0, 'tXzG68yqbgVSWdiv9GmcUC6lx32WZRQMpmadujSEHJrHnoUrLcEkMXVMU0QmgILs0B4r5', 'ar', '2019-08-19 16:15:08', 8, NULL, NULL, NULL, NULL, NULL),
(8, 'https://shipit.projects.tmtgps.me/uploads/users/pyQo6q4HttkpAaFV.jpg', 'mostafa ramdan', '12345', '+011142284810', '$2y$10$8QHmiJ9h.7ieoCCOthmmUOGL11fmEgGjbd2SNQcNj4iwZzOLti3j6', 'mercrdes', '2010', 'nnnnnnnnnnnnnnnn', 'https://shipit.projects.tmtgps.me/uploads/users/pbuqsSHOPufkAJOw.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/pyQo6q4HttkpAaFV.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/R2Yj4zRUkLPmOcC9.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/w6Z5g7Rq1yk64vRb.jpg', 1, 1, '02B4cTeiHIEb52grLdh3iosXv7Zb3cFxXRUcIcfDz9RVnNPCJtli02jq87qvpR0Mm53z9', 'en', '2019-08-19 16:27:08', 8, NULL, NULL, NULL, NULL, NULL),
(9, 'https://shipit.projects.tmtgps.me/uploads/users/hIF2V9Y9Uh1Znw8Y.jpg', 'mostafa ramdan', '12345', '+0111422848101', '$2y$10$EUmv3Fkwumy94IQyJ5STCe.RmBOCKy4tqQNF8ZA7i8vShr.R.VwR.', 'mercrdes', '2010', 'nnnnnnnnnnnnnnnn', 'https://shipit.projects.tmtgps.me/uploads/users/jzqmRQNFaQW2ecGZ.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/hIF2V9Y9Uh1Znw8Y.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/CXs3f5NP7xq1fkSk.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/LGxnGilCsf2dt2v6.jpg', 1, 0, 'EcJ6fajC6GDNdBTi7roEEEyZBy7EzQMtWsQ7jD596DmWnwaL7RKUhOJpMoJ3WsdkUclpX', 'en', '2019-08-20 16:30:08', 8, NULL, NULL, NULL, NULL, NULL),
(10, 'https://shipit.projects.tmtgps.me/uploads/users/nhurTJkOwofaewSw.jpg', 'ghghhhhhhhhh', 'AF', '01222222223', '$2y$10$KDewHhnW55UIOpekJgw4j.zVqDM9.jcSsYtLQ03CYBfZfiFAe92yy', 'hhhhhh', 'gghhhh', 'jjjjjjj', 'https://shipit.projects.tmtgps.me/uploads/users/og0OHG8enojIojms.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/nhurTJkOwofaewSw.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/eLOmMzpIMaLu7T83.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/6u08ajbseLnSu9st.jpg', 1, 0, 'bLqVJsJtYWmMZSt2uEcEn3PpM8OHuC52pqeiVudwAFs7HIBT7FY5VGC8H2Ah4hw6QyQjq', 'en', '2019-08-20 16:40:08', 8, NULL, NULL, NULL, NULL, NULL),
(11, 'https://shipit.projects.tmtgps.me/uploads/users/4Aew3T0w09MVQVdu.jpg', 'mostafa ramdan', '12345', '+011142284812', '$2y$10$mSNJ1DhA61ncxH.x6uXBG.au5YLPwW4PM/61Y2S67F6Ct9AMeXQaC', 'mercrdes', '2010', 'nnnnnnnnnnnnnnnn', 'https://shipit.projects.tmtgps.me/uploads/users/D5VoaqlROB2cwUJV.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/4Aew3T0w09MVQVdu.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/5JhYfbXHHRLAgRw6.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/BxaeB4nPSE76RMtF.jpg', 1, 0, 'W10oa1YVl5D91bex57HuJMq1ugbNxjzWZNpU1r4IfWJES0VEnNKFnTXLPeXHGyK1trDyh', 'en', '2019-08-20 16:50:08', 8, NULL, NULL, NULL, NULL, NULL),
(12, 'https://shipit.projects.tmtgps.me/uploads/users/XgZl1FR9ZzatxbH3.jpg', 'mostafa ramdan', '12345', '+011142284814', '$2y$10$ya9HbizupHbfaGwvAoXlJ.6SSxKl9f2wgK1w1VFpRueXMiRv2AqKa', 'mercrdes', '2010', 'nnnnnnnnnnnnnnnn', 'https://shipit.projects.tmtgps.me/uploads/users/H9cr3KYRWyS5ObyC.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/XgZl1FR9ZzatxbH3.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/d80FQ39dq8ejfPIF.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/9iAsWeBlZ7kvNjvS.jpg', 1, 0, 'ZsGE3MmcXcM5ksvZibyUVTzJ68NkTblXo43fNKO2M0ca8Y4hcaEWXGkaGuYXv7jx2ZmVL', 'en', '2019-08-20 17:46:08', 8, NULL, NULL, NULL, NULL, NULL),
(13, 'https://shipit.projects.tmtgps.me/uploads/users/z21hVjvKqowSPc6Q.jpg', 'mostafa ramdan', '12345', '+011142284816', '$2y$10$kiW01r0PDGU5Nh79yiGZy.yXJ8hTK866yYSS9tLFeegdiUQ027/6u', 'mercrdes', '2010', 'nnnnnnnnnnnnnnnn', 'https://shipit.projects.tmtgps.me/uploads/users/SFxRmvZZ1W6x6BNW.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/z21hVjvKqowSPc6Q.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/yKY81Hsn7mVmugEV.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/ssD1lqE9J9kDV2dr.jpg', 1, 0, 'icacUJrIewSP689vWl9pXgQXtIv3vliEkcfBdVFTifQBZQHJwxQniPB8xNwyhS90RsrNu', 'en', '2019-08-20 17:47:08', 8, NULL, NULL, NULL, NULL, NULL),
(14, 'https://shipit.projects.tmtgps.me/uploads/users/7BqMgAMuc00QYiOp.jpg', 'mostafa ramdan', '12345', '+011142284817', '$2y$10$peANAixRWy4izSOnREqG.eqxO1rPGb9dVlf8jV374J2oRREBhDtvC', 'mercrdes', '2010', 'nnnnnnnnnnnnnnnn', 'https://shipit.projects.tmtgps.me/uploads/users/dBoMmrAg6vJMyEz9.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/7BqMgAMuc00QYiOp.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/IX0adLRTOtzo3QoC.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/3S01fkhQsTgYZ6yy.jpg', 1, 0, 'w3U7iHuB5jqIpEiJnLkpKMsYQ30AOStukncIEJLIwtoWwHUPpIAulK5AfYM9vzU74TSsf', 'en', '2019-08-20 17:47:08', 8, NULL, NULL, NULL, NULL, NULL),
(15, 'https://shipit.projects.tmtgps.me/uploads/users/j3GNbu4sB6LsUF97.jpg', 'mostafa ramdan', '12345', '+011142284845', '$2y$10$mQzVakv1FwTWeomZGtYrdutk49RYLiSP/ZNZZcaOk7QlJX2ATLG8q', 'mercrdes', '2010', 'nnnnnnnnnnnnnnnn', 'https://shipit.projects.tmtgps.me/uploads/users/88KXg0HRm3TaTDo6.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/j3GNbu4sB6LsUF97.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/FGaSl2ap6mGbCGMw.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/MEXtHU4HdwN5b46A.jpg', 1, 0, 'j9is7aNp1k3TlgCJJhy0fWRarJvdQL2zOWtzmTv7nxWXBrfVkDzJS0TMAioSGnBhx0h9q', 'en', '2019-08-20 17:47:08', 8, NULL, NULL, NULL, NULL, NULL),
(16, 'https://shipit.projects.tmtgps.me/uploads/users/pOqixAQrVA9hMxaM.jpg', 'mostafa ramdan', '12345', '+011142284842', '$2y$10$oAiXfmC3asEAHg9FkecLt.rN8K66R.QxdWKrKDNYctdEbOQEGzRXS', 'mercrdes', '2010', 'nnnnnnnnnnnnnnnn', 'https://shipit.projects.tmtgps.me/uploads/users/U5L9pnHeKR23v66n.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/pOqixAQrVA9hMxaM.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/meejekLsqOJb5UKH.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/ckP2fh5xigweQPqX.jpg', 1, 0, 'wwZsdjWsb5XueMet4MOudRANTVrtXq3sZeQhaYsIjr25caTuoN3n3DOD5FXQcODOF6ukS', 'en', '2019-08-20 17:47:08', 8, NULL, NULL, NULL, NULL, NULL),
(17, 'https://shipit.projects.tmtgps.me/uploads/users/Ka2EYiM2nAiASUJV.jpg', 'mostafa ramdan', '12345', '011142284848', '$2y$10$zHSjSxM5ZE/VMVZZmn39Z.WPQtwswqYy5Tg3FpNeVjaQqOh0uQrWe', 'mercrdes', '2010', 'nnnnnnnnnnnnnnnn', 'https://shipit.projects.tmtgps.me/uploads/users/rGGM5NjM8qQ4HVWh.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/Ka2EYiM2nAiASUJV.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/g8GmqRvlxN8BNHuF.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/xdQ8NN5EbwSnjNhG.jpg', 1, 0, 'mC1evVlfdRuaadSvO1AyTzbPJeHbHDOJKhnMuHeCZsdfQxDEOYlgpkp4vHVQ5gQJwlug5', 'en', '2019-08-20 18:00:08', 8, NULL, NULL, NULL, NULL, NULL),
(18, 'https://shipit.projects.tmtgps.me/uploads/users/LvsJ8Sq6PGi1ITLj.jpg', 'mostafa ramdan', '+123', '01114228484877', '$2y$10$PiADR1aa5kWwuggzuz6nh.925ugjw.mYAPrPmmBXuokHmxfMsk6q.', 'mercrdes', '2010', 'nnnnnnnnnnnnnnnn', 'https://shipit.projects.tmtgps.me/uploads/users/uBddnEX4Lne8bSb6.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/LvsJ8Sq6PGi1ITLj.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/UfEHCH183NrRlNBL.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/pvDtRWmZg0q7czA0.jpg', 1, 0, '86T0Uh6Gi6X083viBoGpMLdV4Ls1Ah8Z7QxrwVjcfQU4xluZGdlHRNJA1k8zzlWLMDM2f', 'en', '2019-08-20 18:20:08', 8, NULL, NULL, NULL, NULL, NULL),
(19, 'https://shipit.projects.tmtgps.me/uploads/users/eFqKahrw1tDI4PJW.jpg', 'hhhhhhhrrrrrrrr', '+358', '015566666677', '$2y$10$iKGJbMnDqZBn7X6zNzA4O.DL/wKf/WTk5hSCmojMsA1f4z68fxKoy', 'ggggyyyyfffff', 'yyyyyyyyyyy', 'yyyyyyyytttrrrrrr', 'https://shipit.projects.tmtgps.me/uploads/users/IeItXr3CHhh3egBM.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/eFqKahrw1tDI4PJW.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/eiLryad0aRUp9dbP.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/j8sbY4hN8Q8vezD1.jpg', 1, 0, 'anB7ZCTLsiVlYJkSChCnTHzsgN42YOBL806F0heyQ121zRNnu20I9paBAfmx83CSMlVN1', 'en', '2019-08-20 18:22:08', 8, NULL, NULL, NULL, NULL, NULL),
(20, 'https://shipit.projects.tmtgps.me/uploads/users/EpvGMB3DR2LwyHTi.jpg', 'qqqqqwwwwwwwwww', '+358', '01112345555', '$2y$10$MrpK5mRgL2K6/SuOWEL0melbaBpY8.uf22WP2Z6jgyPlsVjjhpaO2', 'qqqwerttttyyyyytrrr', 'wwerttttyyyyyy', 'qeetyyytrrtyyyty', 'https://shipit.projects.tmtgps.me/uploads/users/ug25KrHbzBfzcaja.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/EpvGMB3DR2LwyHTi.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/OcRnLypUsS118hPK.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/k6lQN2DsowNr5JpA.jpg', 1, 0, 'PnBdXFzctLbXSU0SdaEIiRO46j3CzBbt9loFK6d1EJkyRvjSrfrDDM0m6tsgr7VrdW5od', 'en', '2019-08-20 18:29:08', 8, NULL, NULL, NULL, NULL, NULL),
(21, 'https://shipit.projects.tmtgps.me/uploads/users/p2qVUPD9rbAxHyxg.jpg', 'qqqqqwwwwwwwwww', '+358', '01112345565', '$2y$10$XSQ.tovG9SXjd0AR6.8TYu9CoAqlQZDI5SmyQLQ7FQa4.NlHUyT7G', 'qqqwerttttyyyyytrrr', 'wwerttttyyyyyy', 'qeetyyytrrtyyyty', 'https://shipit.projects.tmtgps.me/uploads/users/eAN18FS3mjAWx89T.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/p2qVUPD9rbAxHyxg.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/6CruYndZKlvrW6Fn.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/0TOmgRuOrngg0vef.jpg', 1, 0, 'X6BkhByP7pSGuyg3ZFra1Cd43CWOLI3z7Royyj9HSVcB7K2Xa6xlObmE3RIBk5sx9Mqjy', 'en', '2019-08-20 18:38:08', 8, NULL, NULL, NULL, NULL, NULL),
(22, 'https://shipit.projects.tmtgps.me/uploads/users/ze1H0LZwgQ7vtMz5.jpg', 'ttttyyyyy', '+20', '22222222222', '$2y$10$iJGw7D/J1g1WdXfcJ06AeukCzcr0mE2g.CMByeOCQtV2.HPEyjQfG', 'tttyyyyyyyhh', 'gghghhh', 'ggggggghh', 'https://shipit.projects.tmtgps.me/uploads/users/gh1EgDSlSBmvnFPG.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/ze1H0LZwgQ7vtMz5.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/5USyNKgHl575ZlSV.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/1wK9I01p78BY3OpU.jpg', 1, 0, '4PMl9OaEkHgIsDDGMYyinc4igi8u0m2o8wee3Qbtuvg4HBBa39UVlgRH11qctAGAKbiYX', 'en', '2019-08-20 19:47:08', 8, NULL, NULL, NULL, NULL, NULL),
(23, 'https://shipit.projects.tmtgps.me/uploads/users/1BTXTJkxZUGHgXFw.jpg', 'yhhhhhhhh', '+20', '0128888888', '$2y$10$Zkh7.r59cC9rqUOAr4Q90uIHC2SmwdWETGvbSYNGKFcJxM7QwzbOC', 'vgghhhhhh', 'hnbbbbnn', 'ghhhhhhhh', 'https://shipit.projects.tmtgps.me/uploads/users/coH4xKzWRLiqUXPQ.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/1BTXTJkxZUGHgXFw.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/hdKyeMhXmYdBG7mr.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/ptPFZSB8dmWPjn5v.jpg', 1, 0, 'LTOLZQG45uJVu8R51VzK80Yd4paR51uCWe9najJshj5WkhoREHo0ARhNwj7IEHEyNAo5C', 'en', '2019-08-20 19:52:08', 8, NULL, NULL, NULL, NULL, NULL),
(24, 'https://shipit.projects.tmtgps.me/uploads/users/83djSZXWHZ2t61xB.jpg', 'Ali Maher', '+2', '0123459876', '$2y$10$oYWcJyvYyCoKJUStBrP7mOEAcQe4/2HnqP2a.CydhnsQCKhKOx6be', 'mercrdes', '2015', '902716455', 'https://shipit.projects.tmtgps.me/uploads/users/5jGvX3TVevy44t24.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/83djSZXWHZ2t61xB.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/6SdXxAuYQyF9IPHT.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/edPZhH7qrUMhXyFe.jpg', 1, 1, '880morwFDojGD6bCF114LHKzOLP4XpSOIhU0HqI52XRCoSYurTjw451SzSxwHJN1279iE', 'ar', '2019-08-21 11:58:08', 8, 60, NULL, NULL, NULL, NULL),
(25, 'https://shipit.projects.tmtgps.me/uploads/users/hF5kXBxg7t4oyXbP.jpg', 'tttyyyyyyyyyyy', '+20', '01255555', '$2y$10$Beory5LvYIWfCkHa8bDIf.glWVulwuCRcA25J9bI05BIWc0RRwnHi', 'uuuuuuuuuuu', 'yyyyyyyyyyyyy', 'yyyyyyyyyyyyyy', 'https://shipit.projects.tmtgps.me/uploads/users/ZpLhgPmdARiVVlEw.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/hF5kXBxg7t4oyXbP.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/HKSYDjPh24W0zj0R.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/RVkOlFJjwrz7prPt.jpg', 1, 0, 'ddhpHz5ms20gUg5976TDBgzPcma3ABIVlsNZKfVKZbPLZTxmcB4NV9PRHxD6LUQJYw8pX', 'en', '2019-08-21 13:22:08', 8, NULL, NULL, NULL, NULL, NULL),
(26, 'https://shipit.projects.tmtgps.me/uploads/users/UrI8CrngPtggmZDP.jpg', '65566666', '+20', '22222222', '$2y$10$vGtgoDJTuVKu48N.d0UCiuJxjGs7s6QQGzhzmNY34NxN8ZPGPw4T.', 'fdddddddff', 'ffffffffffff', 'fffffffggggg', 'https://shipit.projects.tmtgps.me/uploads/users/oKl2slqpZxGIsUrg.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/UrI8CrngPtggmZDP.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/nIHJNgqIItmotwFT.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/QgncKfveC2TtRHNQ.jpg', 1, 0, 'WTUW5XC6qYN9F63RgzgFEq0VCjfH8xVcAgO0F0wDIcPqvEqejeUc5ujs02Tw7P3YTFxzP', 'en', '2019-08-21 13:29:08', 8, NULL, NULL, NULL, NULL, NULL),
(27, 'https://shipit.projects.tmtgps.me/uploads/users/ngquqpT6LiOqoLBO.jpg', '65566666', '+20', '222222229', '$2y$10$3z6kZtPucLZjHs3v3lqhxeOs0G802R3sD7tUoGhbrRQ/wqmt9LrPG', 'fdddddddff', 'ffffffffffff', 'fffffffggggg', 'https://shipit.projects.tmtgps.me/uploads/users/ag1wrDGDvzIBXnXq.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/ngquqpT6LiOqoLBO.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/33Yr0TdaZKiEIMWU.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/GgUeMY3WXZ4Ytf9k.jpg', 1, 0, 'sqmRY6UF0vmaRQb0E3VX6CaNIE8KbATFI6yqtQdYrk5e8TX5ay5mk4etlmsz1nOWW8EJy', 'en', '2019-08-21 13:31:08', 8, NULL, NULL, NULL, NULL, NULL),
(28, 'https://shipit.projects.tmtgps.me/uploads/users/3hKLm0ziYzyDnGkg.jpg', 'yyyyyyyy', '+20', '012555888888', '$2y$10$IV6KKBRMeIFKFVhMQigMkebEhT9Y06OqAqK7NKqUbBbNLLoLtM7s.', '3eerrrer', 'dddddddddd', 'fffffffffg', 'https://shipit.projects.tmtgps.me/uploads/users/5cYB6sTCMNGvAkJ5.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/3hKLm0ziYzyDnGkg.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/znQ1tStfCPzQWRWd.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/4arZqfkHBYaYrCzL.jpg', 1, 0, 'GM8KnkfsUTAkDXLLKp5lPwovvpfDawW41dccSHrzkT4vQgnp8jyXfL4SpmmgtONvgOgmM', 'en', '2019-08-21 13:48:08', 8, NULL, NULL, NULL, NULL, NULL),
(29, 'https://shipit.projects.tmtgps.me/uploads/users/5AJ6kkYjK1aqjhTi.jpg', 'gggghhhh', '+20', '01288888886', '$2y$10$96.D2v5091wEYjQ.X0bMdeVNzCQyfW.9T6Z8dAJyLqjRqzcewZgsO', 'eeeeeeerr', 'eeeeeerr', 'eeeeerrrrr', 'https://shipit.projects.tmtgps.me/uploads/users/93MUtuvRixfBN7OH.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/5AJ6kkYjK1aqjhTi.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/8CUgY4MwsPDwssBC.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/MiflfqeUGr3Wg3CA.jpg', 1, 0, '5ysp3FNPmkL7gevvCHjJqdl8pUXZbSjLqcQU2zFeBLHSqrB6xF8PaaIUjO4CdG0mhHIQV', 'en', '2019-08-21 14:15:08', 8, NULL, NULL, NULL, NULL, NULL),
(30, 'https://shipit.projects.tmtgps.me/uploads/users/zXQRcpE0v4MJxag2.jpg', 'mostafa ramdan', '+123', '01111111111', '$2y$10$zrVmuyyqr1zj0/O2tmGPGu.S/QCetl9FOgYTL5rfVPxDmC.QnYUui', 'mercrdes', '2010', 'nnnnnnnnnnnnnnnn', 'https://shipit.projects.tmtgps.me/uploads/users/0qjePQvBnGp9wquq.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/zXQRcpE0v4MJxag2.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/s27oZuVFbsXBf7AG.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/x8myCQMr0HVOcVMn.jpg', 1, 0, '7hK7rFanSzRD373sVGvFJte2wQ65zkn1wYMCt9VlOau6k26qKc966PS3jeZ2QVsYlX7ow', 'en', '2019-08-21 15:09:08', 8, NULL, NULL, NULL, NULL, NULL),
(31, 'https://shipit.projects.tmtgps.me/uploads/users/XiMFPTC9X6LSFh0J.jpg', '122222222', '+20', '1111111111', '$2y$10$YVjmaXT85tISsAY8k88/rOpgd9cVDHRf.778/.hE45zREqTFvVCEG', 'trtttt', 'ggfgg', 'ffftt', 'https://shipit.projects.tmtgps.me/uploads/users/P3Kt1DCEvmkFVsY2.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/XiMFPTC9X6LSFh0J.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/3Wc786vtGjWYcZYb.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/8BVLMcaOIRC9HVDc.jpg', 0, 0, 'Zq80p6CtRqZcb3kAtVs1xkTxWwGiP6jm8izf6oKt83tOAhBBKabJ4GVqqnWgw3FPZSk2u', 'en', '2019-08-21 15:11:08', 8, NULL, NULL, NULL, NULL, NULL),
(32, 'https://shipit.projects.tmtgps.me/uploads/users/63ZGBjCRtCx3aQZD.jpg', 'mostafa ramdan', '+123', '012345678910', '$2y$10$ralsHqhh2XX9o8l3StcC0OLLCxDKxHE455mDEoKS2v5UE2w3AjQqK', 'mercrdes', '2010', 'nnnnnnnnnnnnnnnn', 'https://shipit.projects.tmtgps.me/uploads/users/ntHl4wDCb82dUuuD.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/63ZGBjCRtCx3aQZD.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/Hguz9wCJi8xEmWBq.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/wGqzlkKyMYhXkGgq.jpg', 1, 0, '5f4k3HwQQ1B8udhgDzlxrJ9AnIxwVR9MyanM75dnLL5j74t3X1Dxdn1lpudeULADueaOO', 'en', '2019-08-21 15:35:08', 8, NULL, NULL, NULL, NULL, NULL),
(33, 'https://shipit.projects.tmtgps.me/uploads/users/J6dZMStBtsBFrF78.jpg', '44444', '+20', '0123456780', '$2y$10$rqawBXI8c2R03I3PQJuOjuQFjw0orphTi5TEdldKw7K2IODem.moa', 'rrttttt', 'ggggggg', 'ggggggh', 'https://shipit.projects.tmtgps.me/uploads/users/o0SVJB2zapK9rPjA.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/J6dZMStBtsBFrF78.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/FSP91DY1NirOh4Ol.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/l0PuNKJlJHn4Wu22.jpg', 1, 0, 'NmWitsQ0Qe7XkLfWysbMRMgFPGb386JZTvXAiOcUaQXLHYpDOW2J0ZYdQdfP2DdZNJ8cb', 'en', '2019-08-21 17:08:08', 8, NULL, NULL, NULL, NULL, NULL),
(34, 'https://shipit.projects.tmtgps.me/uploads/users/Cn9Hpv7ObADMC5is.jpg', 'jhjhjhjhjjhjjhjhhj', '+20', '01222222222', '$2y$10$WbYAnRu2rdQVN6Lqpz.I6eollE.0KMLbjfa2WVWh4Y2s2KZDzsHBe', 'jjjjjjjjjjjjjjjjjjjjjjjjjjj', 'jjjjjjjjjjjjjjjjjjjjjjjjjjjj', 'jjjjjjjjjjjjjjj', 'https://shipit.projects.tmtgps.me/uploads/users/3zpLgAIHyNqZrhGf.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/Cn9Hpv7ObADMC5is.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/aOY8cZamSMt6l8Bs.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/Sdv747cERiOHJvDj.jpg', 1, 1, '6QcerDqUBhCVmLLGkb1Lrvjtu8ziIcgu4BKWBuFojZB5pEs61p3tJqj42M4qZgbQftvGF', 'en', '2019-08-22 12:27:08', 8, NULL, NULL, NULL, NULL, NULL),
(35, 'https://shipit.projects.tmtgps.me/uploads/users/VG6Og9HSpiOnzv7k.jpg', 'wwwwwwwwwwwwwwwwwww', '+20', '+20012333333333', '$2y$10$UgeJBa0lwWuBXNcKn41rrO/FhQoaxci7QZ31ryDkA2QpM0xqTyg2u', 'ggggggggg', 'ggggggggggg', 'rrrrrrrrrrrrr', 'https://shipit.projects.tmtgps.me/uploads/users/GxH8Ewr3OjQpxEbg.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/VG6Og9HSpiOnzv7k.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/U7Iz4Q4PrRM7Bxzw.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/zS09USYqqh57763h.jpg', 1, 1, 'gKfdOc9TBz4cKXnn6nPf43y6ADWcmQXx8IEScBCMie1JRI9dP6ukUCANeXPE75lVRohsw', 'en', '2019-08-22 12:39:08', 8, NULL, NULL, NULL, NULL, NULL),
(36, 'https://shipit.projects.tmtgps.me/uploads/users/MpLhHyQ3q1BpUnYn.jpg', 'mostafa ramdan', '+123', '01234567844', '$2y$10$usAlNbsyYINREY/owQGci.gqnAuo01.cxz4w6fzG529a1BjxBG2dW', 'mercrdes', '2010', 'nnnnnnnnnnnnnnnn', 'https://shipit.projects.tmtgps.me/uploads/users/QL67PYak2Yh8MsZO.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/MpLhHyQ3q1BpUnYn.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/ItX4UYLvnktmzcH5.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/lyNugI37VSdojGCR.jpg', 1, 0, 'QWU2jNYKTaexdZQ7Lboxu45AXNRWX3i8zGkOsqqo2icAd1IbbTBRAbxwgsFNq9uhAqNea', 'en', '2019-08-22 15:20:08', 8, NULL, NULL, NULL, NULL, NULL),
(37, 'https://shipit.projects.tmtgps.me/uploads/users/QRoEdBlARMPp0EWg.jpg', 'wwwwwwwwwwwwwwwwwwww', '+20', '1555088135', '$2y$10$uQLWpZDTE/0NGQiCP8pL8erQfQp/YNFs3LnQQ/t1JtwY/kRihHDk.', 'rrrrrrrrrrrrrr', 'rrrrrrrrrrrrrrrrr', 'rrrrrrrrrrrrrrr', 'https://shipit.projects.tmtgps.me/uploads/users/oPP7jEbGbHTe7ryA.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/QRoEdBlARMPp0EWg.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/wYkSidgGH4PENAz1.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/RJZJ1t20C6BlQXLL.jpg', 1, 1, 'PU7ZHDlzIP3RTiSFSR8CRD5QvEvQgap8GYuv3iYftxiypEFSkAmq2Nch74mt43AQ9xICA', 'en', '2019-08-22 15:25:08', 8, NULL, NULL, NULL, NULL, NULL),
(38, 'https://shipit.projects.tmtgps.me/uploads/users/5Esitp0o6DkXpmXO.jpg', 'ibrahim', '+20', '+201283614010', '$2y$10$Ntesb/GlugBXN9BmHAxduuqYj4.Da47p9uvdSfeB9rkfatar7coAy', 'car trademark', 'car model', 'car licence', 'https://shipit.projects.tmtgps.me/uploads/users/NVcT6f1uurlQZ9by.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/5Esitp0o6DkXpmXO.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/WUE4l4vHHpd6qYc7.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/ePSeDy0L1tBpB9UZ.jpg', 1, 1, 'sWHuUuunOQxNumEFBbyoJZspvx3x248McS0OPP6BqpOvV3gmXJYOWuynZApKK7umFb0nA', 'en', '2019-08-22 16:34:08', 8, NULL, NULL, NULL, NULL, NULL),
(39, 'https://shipit.projects.tmtgps.me/uploads/users/Zmefj7025JuswPdv.jpg', 'mostafa ramdan', '12345', '+0111422848105', '$2y$10$rhotfL644dJaSCVuSHshZOpt46Zi/QfXOACKjdwV3ofDQOJ3Zv7Le', 'mercrdes', '2010', 'nnnnnnnnnnnnnnnn', 'https://shipit.projects.tmtgps.me/uploads/users/MHWvfRRhayOp1QvG.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/Zmefj7025JuswPdv.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/PqX0TbOccBROBHOx.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/OL1V5ZCOcuRHaMPh.jpg', 1, 1, 'xc79YtKp9iCWe2LHeHD33UsfcLujwKA4e5ERvlQZfWMTvKw2z12KAcwmCfdspGLndf7wG', 'en', '2019-08-22 22:03:08', 8, NULL, NULL, NULL, NULL, NULL),
(40, 'https://shipit.projects.tmtgps.me/uploads/users/4D5L9wC0xZW2MTve.jpg', 'ibrahim', '+20', '+201555088134', '$2y$10$j9yoa17LRKgV1rzvlw3oP.cst1exn4/qE9tuM0MflceYW.BQuoI/.', 'toyota', '2010', '89232', 'https://shipit.projects.tmtgps.me/uploads/users/tgZ47bAC5pDbqJrJ.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/4D5L9wC0xZW2MTve.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/csOXf0uBS15yv2Px.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/VNNWrSKHmOgrl2vi.jpg', 1, 1, 'hOg9IUD1QM8SicZVGxCR0lBpmQWNXRPkHsI02veLSZX8sOLjHvz3nlYdTVdWkQRhtzWp0', 'ar', '2019-08-24 16:25:08', 8, NULL, NULL, NULL, NULL, NULL),
(41, 'https://shipit.projects.tmtgps.me/uploads/users/rEQpV920pNkaBtuj.jpg', 'Ibrahim nashat', '+20', '+201555088132', '$2y$10$uPbDK9XKnVGB74GpHKDwIO8whwnjE/ov8dD0OKg1P0SMjyXpYtTgm', 'toyota', '2009', '23409', 'https://shipit.projects.tmtgps.me/uploads/users/lacxjle9aD43S7X2.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/rEQpV920pNkaBtuj.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/LMfqhN2cr5lLIYOC.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/PimJJbFPnz8fRjLU.jpg', 1, 1, 'GTqsvqQQzQKgjqgIU2V4fiXDsrIEC2loLHTRvbaz1X1VsvLOYgEtf6VCkQJufvqYsy4n1', 'en', '2019-08-24 17:30:08', 8, 81, NULL, NULL, NULL, NULL),
(42, 'https://shipit.projects.tmtgps.me/uploads/users/U2Z6VeGIWT5xwm7q.jpg', 'ببببببببببببب', '+20', '+201128661678', '$2y$10$PZcb7rFVEo7zeXNtgel45.A0ccyXTalN8yQpz7hMN48ynUAMSuZ4i', '2223قففف5', 'فففبييبلللب', 'بببللااليييببللا', 'https://shipit.projects.tmtgps.me/uploads/users/CFjCWKpX3kRZvlMH.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/U2Z6VeGIWT5xwm7q.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/DW2Q3h20kkYF5dgV.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/M0aADx8SDATU1Q4h.jpg', 1, 1, 'JcuiHgDmwFv7PtM4vGnhIwLg3YGKCxZINJY27o0rsrOIDNyJauJ2xhDVhTpAujQ8r18WV', 'en', '2019-08-24 19:34:08', 8, 507, NULL, NULL, 'fTGosmllLcg:APA91bFhLPmAdWAL70ibRREwPTG7YuPftcZYVVgMoqvUhuwTAcpH67FByaskPq1L13XCQGld9km1XONHOvQtOgRBB564Dpk7jB2Aae2Bk5946LKXM0LvYC5mRuNviFBm0shX4bUZqYcl', 'aaaarfd@gmail.com'),
(43, 'https://shipit.projects.tmtgps.me/uploads/users/AgncbOKxWwED5cq9uqpB5iMIO4cQ6z1566811957.jpg', 'test', '002', '0112234567', '$2y$10$/29LYA9Fiih9LuUwQFmGyuvxgQa.1K2aLBakxwbt3BzczfzZX2Sim', 'Nissan', '2018', '543321686 b', 'https://shipit.projects.tmtgps.me/uploads/users/2nGlM7h0mDejR3k3qc8f4miYjqO3VP1566811957.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/AgncbOKxWwED5cq9uqpB5iMIO4cQ6z1566811957.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/pSDDygFHInu7ojSckskMtnc5tpzIfk1566811957.webp', 'https://shipit.projects.tmtgps.me/uploads/users/Mf8KPItRBHUyh6hn0W3XDoYS8DHwZa1566811957.jpg', 1, 0, 'tJ7NQkCM8650wFgbH3EereM9JDbcZ3t1RiOQIWhyLLGM5NUFw4cFIlldIoJQNKeriAJUD', 'en', '2019-08-26 12:32:08', 8, NULL, NULL, 15, NULL, NULL),
(44, 'https://shipit.projects.tmtgps.me/uploads/users/IW5oER1r0B392bRS.jpg', 'peter', '+20', '+201555088100', '$2y$10$XzN63fC7wNg2lbAuvfvZ.OwaAyCDS/XrWNqQaCTCOLSRrHUeiUB/W', 'ggggg', 'gggggg', 'ggggg', 'https://shipit.projects.tmtgps.me/uploads/users/FH4jkDZ3K3mgYZbJ.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/IW5oER1r0B392bRS.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/DYYamQYPVv8uQxy6.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/E3yXliL8RyOjl6IL.jpg', 1, 1, '44IP6WWYcMkwdgXh6Mk8DtrbM4uzSAP3mBsoNYIMLSpQwB7CQkGHgIZjLnRcVcHNc42qP', 'en', '2019-09-02 12:16:09', 8, 81, NULL, NULL, 'efUvo7PxDvo:APA91bEfcOcFv58frR2i5UnbPtsHH_lHUjkfJRoGe1NclqfThircqen5bll_Theg4e4i8EHEObVsIzE5yNAIndFbWoIOssgfhFEAo9qkqTs822CSXT7PGTvY1-CvpYTClc_wKMLSZcF9', NULL),
(45, 'https://shipit.projects.tmtgps.me/uploads/users/tK0rYD0me8n2iqtb.jpg', 'ibrahim', '+20', '+201555088101', '$2y$10$xfh0ypobg15z7KkqLP7Du.wjvNn7wdPeTXIeGCF4.pHYb38ZSyIUe', 'rrrrrr', 'rrrrrrr', 'rrrrrtt', 'https://shipit.projects.tmtgps.me/uploads/users/Wv7jIkh2bUpjmDH0.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/tK0rYD0me8n2iqtb.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/xgGzFGeAyClJ36xv.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/ReFqoaM4bEIVH9WJ.jpg', 1, 1, 't7kJSCmNlfsuyKEPIC9QxfLbYjb5F4Z7bzm0fI5I8knDiOwG7EdlF2Ps9HUjVOgvQUUFd', 'en', '2019-09-02 18:05:09', 8, 92, NULL, NULL, 'copM0BqxJec:APA91bEvZv8cJq3tRkWaGE5QjiYdbXky9IAoh9Jp99lVJ56iZqlSRwWhjPsslGboUkYPT5HYzglDYX1UFwoApbuigAnD2k04GeD0y4Wacao_FmghEHlg8VECMTbk1Ca89KInhQaHo0Js', NULL),
(46, 'https://shipit.projects.tmtgps.me/uploads/users/r4sXVzVLk6Be4mkP.jpg', 'mah driver', '+20', '+201128661654', '$2y$10$JM4C7DIllVq3bid6RK94j.W6QjLBOtlidvWldgcF7KESfqzrMpC7O', 'toyota', 'weeeeertfregt', '12345678', 'https://shipit.projects.tmtgps.me/uploads/users/wLEAcYQYpcLWxl90.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/r4sXVzVLk6Be4mkP.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/VBz07OnVw4Iangjr.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/gqLW6MudRTCiIspO.jpg', 1, 1, 'kGfL25YksNsziDH0UVGzyZvK6EzYMXX09YEGxZXgWWrMutzDKSBNy8Ufp8DqCu13I4wm7', 'en', '2019-09-04 18:00:09', 8, 115, NULL, NULL, 'eD0MsRev-mo:APA91bFdF_sutfqZ49I-cHR1Ea06T0hU5OcYouCaE-MPCaWm-lWGI6aBHxrCYH4N3irWp6QCXUG9_QsmLB3kdmOQutB3DfzChUE67f041aVNJH54TsXKzHfM6_bNLUSBCj8ul9jHVKoL', NULL),
(47, 'https://shipit.projects.tmtgps.me/uploads/users/E8VdwIOKBtR7w1WF.jpg', 'ffffgfffffffffg', '+20', '+201128661633', '$2y$10$Uc0DDEaq3j6gHqv7ZUw8hey46LcbEIK9KrCzwol4u8AzAhUK6mpEq', 'ewettgggguhj', 'errrty', '12344567', 'https://shipit.projects.tmtgps.me/uploads/users/pfFUkx6puxjG0vyR.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/E8VdwIOKBtR7w1WF.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/6QDSMkqtVGPomdnf.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/Q6oIAc7JNfzo6USD.jpg', 1, 1, 'MAvPowqFiUvQ1AM8JP0LY4b3Q5cTyDpq83GtlrgiIlxkuezSKRtCRE0QoZl2f9ngfFgsQ', 'en', '2019-09-04 19:02:09', 8, 116, NULL, NULL, NULL, NULL),
(48, 'https://shipit.projects.tmtgps.me/uploads/users/92nfS1WiINywOaCl.jpg', 'mina', '+20', '+201005361055', '$2y$10$ZZl4oaKLLsa.dQiYB5iIF.JQK8..dSeQ.v0DwfLkkF507QLdIeAXK', 'nissan', 'qashqai', '123454321', 'https://shipit.projects.tmtgps.me/uploads/users/bcf9MxbiqcCFnw65.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/92nfS1WiINywOaCl.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/BAlHJROk7MC13nq6.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/otXaSxW5TDfWhUaf.jpg', 1, 1, 'xR9V78LPVxUM7vivdkCy0c56Mlihyy2V7AlISx6J1Th9o35bDAWGGvsL1QBrwMOSTWoW3', 'en', '2019-09-08 17:36:09', 8, 127, NULL, NULL, NULL, NULL),
(49, 'https://shipit.projects.tmtgps.me/uploads/users/auhHuaeJN5g50wa3.jpg', 'koko lolo', '+20', '+201122334455', '$2y$10$A3d7ACSFkUzEHAj68DTUFe6c7XwXE/4ePVnu/I3JkMx9C/a4aOF/G', 'toyota cruz', 'gogo', '123454321', 'https://shipit.projects.tmtgps.me/uploads/users/reEucrlF0NmBqohK.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/auhHuaeJN5g50wa3.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/8UNhsvtXDcigVicr.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/tLiadnJxSaBRjvk7.jpg', 1, 1, 'miUK03FA4ZKKb8BxvSN9RF7flhBRzjYXOUSRpfgVbvX5rdThq5XtghqxNbdM4KlL1nx5g', 'ar', '2019-09-08 18:00:09', 8, 128, NULL, NULL, NULL, NULL),
(50, 'https://shipit.projects.tmtgps.me/uploads/users/P4AeZS8fVF8EeFlT.jpg', 'Mahrous', '+20', '+201003951531', '$2y$10$4KNfTfu1WlYXbosbNaPDv.u3x/2BNFLNr/PHv6h/gvJ0cEDEmRgX.', 'Nsain', '2010', '112233445566', 'https://shipit.projects.tmtgps.me/uploads/users/ThZgpTN0C5T6W3te.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/P4AeZS8fVF8EeFlT.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/z01fA1i2N55tpHav.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/uaqBcvJLfaCXpe8o.jpg', 1, 1, 'PkbJT95hPSGSnlkrrI0Gfuq7bxoLXzwfbgoKJuskvxXy8PRJz9VbIcRTJEeYoICNtBKeL', 'en', '2019-09-09 15:14:09', 8, 133, NULL, NULL, NULL, NULL),
(51, 'https://shipit.projects.tmtgps.me/uploads/users/tDFVHsh3SOaWdLTB.jpg', 'hassan', '+20', '+201007412369', '$2y$10$O45lCjtJKhdNaUw4WjFONeDf57oDR7Swh58cWEW/rOVIGzLhwWYUO', '5786653355666', '2015', '543321679yu97665', 'https://shipit.projects.tmtgps.me/uploads/users/o3MPKdLetEMdiGRi.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/tDFVHsh3SOaWdLTB.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/19BGuKM5nBLPJnNO.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/v0zqbGtLQOyPgjoV.jpg', 1, 1, 'HzQR5FbUPl72vVX9ZMEVMgLvIaboTxRKnTWaj2u3C60abOrh5fA49vCFWfIRzEeng2Toi', 'en', '2019-09-15 15:53:09', 10, 138, NULL, NULL, NULL, NULL),
(52, 'https://shipit.projects.tmtgps.me/uploads/users/ArgHlE0kKPwiqA88.jpg', 'peter', '+20', '+201555088103', '$2y$10$1L1Mcn.wY5Zq4/xQv1TRVO4PrMWijqclr3H7Yi8pUdrcRWNA8xocm', 'tyyyyyy', 'gghhhhh', 'hhhhh', 'https://shipit.projects.tmtgps.me/uploads/users/s8vMHVH94VgepqYN.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/ArgHlE0kKPwiqA88.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/NFHFQFkHc8RtCD2u.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/BuBFZHxgpet4xIDI.jpg', 1, 1, '5IyC9qViK9JjPhXBzuVguIkmQxSxfVbjxHxAjlfHsxbZibL2jFRoiTiR9etov22dHw11T', 'ar', '2019-09-16 13:13:09', 8, 143, NULL, NULL, NULL, NULL),
(53, 'https://shipit.projects.tmtgps.me/uploads/users/Fo5vYPYwvtvIEfyX.jpg', 'hhfh', '+20', '+201555088105', '$2y$10$9F5pildhCi6gHMttJBKpx.H3fFxjWoCe4sftNRZYyIZsPY/3h7YS2', 'gggg', 'vbbb', 'vvv', 'https://shipit.projects.tmtgps.me/uploads/users/JsPzOnvhYuadYiX7.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/Fo5vYPYwvtvIEfyX.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/7TgKRPB8maNv5LDl.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/3DIrZstEvyFMpRge.jpg', 1, 1, 'wQcBTDWoGdecA9Fyxe5bOR6uLCucr2YvakEb0JgN8DT4tfpeVWoNc92VojtaYxmO9kafR', 'ar', '2019-09-16 17:56:09', 8, 162, NULL, NULL, NULL, NULL),
(54, 'https://shipit.projects.tmtgps.me/uploads/users/V7p8hnAu5Lqu82nK.jpg', 'ahmed', '+20', '+201123456789', '$2y$10$9zmkaJtDJ4Q76/fsWQ1oT.KX/9iiThJ6FNYNnILYH9wZ7Lx.MeCZS', 'aaa', '2019', '123456', 'https://shipit.projects.tmtgps.me/uploads/users/7wcXyFna0G8wkRxG.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/V7p8hnAu5Lqu82nK.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/rDmqicIK74T8azPM.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/9l7wNKc3cbYSbT8E.jpg', 1, 1, 'SOzfesaWYnQlZoqas2jUWwMqnieMKCe9MQpKr9Hd7GyKUyrCyvpB3vBNsSFkp8U4R3Ehx', 'ar', '2019-09-23 11:46:09', 10, 193, NULL, NULL, NULL, NULL),
(55, 'https://shipit.projects.tmtgps.me/uploads/users/42RM936VdlSYdLMa.jpg', 'ali', '+20', '+201123456788', '$2y$10$Fe7sTZ8fTz0Pthp9yPtKKOxBLHpxgm4mmQGiFvMRAJQZQthr5f1n.', 'abab', '2018', '2020', 'https://shipit.projects.tmtgps.me/uploads/users/RqFAPFKmuEzCtj6X.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/42RM936VdlSYdLMa.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/B7sjJFdlYzPNRwb3.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/celBfxUeSkOcWo8n.jpg', 1, 0, 'o9Sj2YljgSZbn5IJskMduGf0kqJRGlSqbSrjyFZO3IiZzKTLDy9A2xmKYDI3TSKMVI67E', 'en', '2019-09-23 11:52:09', 10, 194, NULL, NULL, NULL, NULL),
(56, 'https://shipit.projects.tmtgps.me/uploads/users/azjoDgFWUmqg6BZd.jpg', 'ahhmed', '+20', '+201123456777', '$2y$10$KSvsSy5ux9B4XAGXc/h4bed1Tc/BM/8dOjmsRuaBjZ3owYIFvrgE6', 'aaaa', '2017222222255336666666666666666666666666241254021012045', '12345', 'https://shipit.projects.tmtgps.me/uploads/users/GmiAvNEwXrkXhYST.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/azjoDgFWUmqg6BZd.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/RsQcmvnuSQx3B40h.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/6P3tPeNKFKOAKo0y.jpg', 1, 1, 'zmISZ5gZES8e0vSwqW6QQVhX7lXNE7dhNMfErVgxuIlSqL343ia01pWR98byOshDGVgmE', 'en', '2019-09-23 12:12:09', 10, 195, NULL, NULL, NULL, NULL),
(57, 'https://shipit.projects.tmtgps.me/uploads/users/jdp2bwV6qtJaAcP4.jpg', 'ahmeed', '+20', '+201023456789', '$2y$10$HUIObkalH9sIoXM8Ozsiceu4ZzCAneN2nW/JhyQ6fc7VxUNEY3ihy', 'aaaaaaaaaaaaaabbbbbbbbbbbccccccccccccvdddddddff', '2017', '123', 'https://shipit.projects.tmtgps.me/uploads/users/N9VpJu6ymXvdyhk8.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/jdp2bwV6qtJaAcP4.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/LVHmGGCTd8GxNPmQ.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/ybEBpx6aKc6z6L8U.jpg', 1, 1, 'w2HUMNwhNHtVetzX8Mg3NYs3SrimDFkD21SdCdLRORa64mB6HY2VwWa0S2LKKQc75BgLN', 'ar', '2019-09-23 12:19:09', 10, 196, NULL, NULL, NULL, NULL),
(58, 'https://shipit.projects.tmtgps.me/uploads/users/63zK5NjKjIlsOiGk.jpg', 'ahmedd', '+20', '+201023456788', '$2y$10$FE4atIRXthgkFbypR5fodeIGoT5lp6OMNKISRB0F3ypeFJSamBO6y', 'aaa', '2018', '123456', 'https://shipit.projects.tmtgps.me/uploads/users/hVLcw0cYeV7RH8mD.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/63zK5NjKjIlsOiGk.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/tByqt4MFRLMUmLNY.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/G8DXnNExgDsNPbCr.jpg', 1, 1, 'jsgfGb390tTsn3mOzYCz9gr77lz1XcuWLEqcyUKPR8G7XlHBxkcilvZ199Jj6goLAksmw', 'en', '2019-09-23 12:38:09', 10, 197, NULL, NULL, NULL, NULL),
(59, 'https://shipit.projects.tmtgps.me/uploads/users/yZnI4RxCfg2r5wsH.jpg', 'ahmeeed', '+20', '+201123456576', '$2y$10$Mf..5ex8vndbMjj023WGEeKeIBpOnLH5b6AXU9u.eGwKZTZ0Pnvma', 'good', '2017', '123456', 'https://shipit.projects.tmtgps.me/uploads/users/5PtiaJTI7uzLmCqk.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/yZnI4RxCfg2r5wsH.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/RSfNrYicjhyKwK33.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/uzI9oUfJzXwckPia.jpg', 1, 1, 'V3yCMWIW0eaiVXAFWGloGoBit0mSGlwFgbFQ4CWU0iACtOwi3D9xAn90ituLclP2lpiqu', 'en', '2019-09-23 13:27:09', 10, 198, NULL, NULL, NULL, NULL),
(60, 'https://shipit.projects.tmtgps.me/uploads/users/11rxiAGR3EWeANr2.jpg', 'driver 1', '+20', '+201234567890', '$2y$10$ssiwRjpsXoZo8aGD4L7vq.TXCIWL/SSpNdVppXsyDv9al5fUjQYSW', 'Mercedes Half', '2011', '48763287467764', 'https://shipit.projects.tmtgps.me/uploads/users/KW9ctCqbJPySdIVU.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/11rxiAGR3EWeANr2.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/qdEdlFWJYElL8NRi.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/P5knhfnE9286tHKo.jpg', 1, 1, 'boAKchGYTH4WKx9bEQEYr6hhNQJuTlYSiOxNuj7YIRo8hR9FBdkjAnA2O5jRQ1USLkhWy', 'ar', '2019-09-25 15:08:09', 10, 229, NULL, NULL, 'eOFY_99HZBY:APA91bHjVgnsfyl6DwwjbvNHndhaoXMBdnG0Gb113TrFAgSD3AZ56XIJILNDIGC2G9vNGoAd2aw4pQ2eEbymrxouHx2gkg1stoMobreTkXwUGjFed4Sqo8BZhb5V687S1GAEHiWHX_p4', NULL),
(61, 'https://shipit.projects.tmtgps.me/uploads/users/VFVEGJ9pbCEqXV7N.jpg', 'heba', '+20', '+201023456781', '$2y$10$BP0LpPtEXCXi7L8ybWYCcuL3aUibn0B8qFzsO.PN8VtKS9ymXw1km', 'the car', '2017', '12345', 'https://shipit.projects.tmtgps.me/uploads/users/WyyYoEyc51yGtwzf.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/VFVEGJ9pbCEqXV7N.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/M9zePDctEB9U8Zo6.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/K0gsLcwYFK4yN78G.jpg', 1, 1, 'OAY53g6p5gQMDWmGawmBaDsI89IQuaZsaTytEPNNACIEHybxWdAGPUKVOcLuZSy83LZNk', 'en', '2019-09-29 13:02:09', 10, 230, NULL, NULL, NULL, NULL),
(62, 'https://shipit.projects.tmtgps.me/uploads/users/kwIL3Q8VdnNz9ZgW.jpg', 'fucgxtxhcjvkbkhjgufu', '+20', '+201185214793', '$2y$10$MZSv62bcTyDffmzuyH/JlOBQchyzMRPFgKhdD/hTbBoe1fudlO2Iu', '456778888hhgff66554455789iuhhyy7u7ygyu76ttggu889ojhg', '2009', '8550 5757ryryfucug8y7t7t7t7t7t7', 'https://shipit.projects.tmtgps.me/uploads/users/1BCE6Joclh9dVIZg.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/kwIL3Q8VdnNz9ZgW.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/JP5htgLiJxY0vUok.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/LK6Bd5whFRj4J0KL.jpg', 1, 0, 'aC4qeiPucE1aSCgDrclZAV5ReSB3zBzOvbuvttYv6CjcV4WzKD0CuUijjEGXrMhud2AY6', 'en', '2019-09-30 18:20:09', 8, 245, NULL, NULL, NULL, NULL),
(63, 'https://shipit.projects.tmtgps.me/uploads/users/lj3DCNGggaSGlFah.jpg', 'mahmoud walker driv', '+20', '+201000521561', '$2y$10$sDMNxIN7IgJzDSB8KL5xyeNikkD1XuimJjR29/QGe1nEngTw2fFeS', 'toyota', '2014', '123443215678', 'https://shipit.projects.tmtgps.me/uploads/users/RRskgQJBcDIuoOH3.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/lj3DCNGggaSGlFah.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/ATrsa1pOyx5zHgCv.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/JDzjiCnvw3TvU8hT.jpg', 1, 1, 's6OwjSpwlSldXq50fFFg09nshYocQDfEImDTOH5TRarwdwRLNoj0yXwj7lvZyVTSGqWjW', 'ar', '2019-10-06 14:32:10', 10, 246, NULL, NULL, 'cfGiJ2htWGs:APA91bHHFvETO4OyiZ_fT0oPISQL7BCQTL0l_a-pvGwtCDMWmNsRrf3zdGV45a-Ii8MSxDKeyf1xxQEQ3VoO2v9Q0PqqAH_vhPvD0QtKJZOXXfR2dXYfVGIicc9kcNBNcV0Pz8S6jce0', NULL),
(64, 'https://shipit.projects.tmtgps.me/uploads/users/Aqbr8casY0vVe002.jpg', 'ahmed', '+966', '+966544444736', '$2y$10$xKldaHVR3baVabKh4eHuduNihiD.7CGZphDk79Bs0G8D9I5Pz6MDS', 'marsides', '2015', '10288', 'https://shipit.projects.tmtgps.me/uploads/users/0RTdYFpZKZcTXEt8.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/Aqbr8casY0vVe002.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/rbCnyVrBE3CzMTNo.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/QDBIbTpRQJPsBGRd.jpg', 0, 1, 'SL34oFfWBQYvcKodPfX2LCtrIpwDbpMKJzYPHeh12hdSuQNLxZ37fCb6WjG0adRxqCSvl', 'en', '2019-10-22 14:40:10', 10, 251, NULL, NULL, NULL, NULL),
(65, 'https://shipit.projects.tmtgps.me/uploads/users/zYu5fl3QPSWKMDIM.jpg', 'WalkerDriver', '+20', '+201000521544', '$2y$10$78nz7shgdkgu7fGdv03BvuqWz8BuTAdkuvGMYv6kLcFCUzJmvjMH6', 'toyota', '2016', '123454321223', 'https://shipit.projects.tmtgps.me/uploads/users/OMkIsvsGLcyKh1ny.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/zYu5fl3QPSWKMDIM.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/iUfs5emZD222HpbC.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/HPc9OqZULJ4jwVar.jpg', 1, 1, 'Md0pKBdnzVqj4M39B3uJadNkAL6dv7Gm2viZfgX3nhalA1D3eh5DOd7CbliZ8Hf8qDPjO', 'ar', '2019-10-27 13:22:10', 10, 252, NULL, NULL, 'eadqpK_0sgY:APA91bFcGdcA6FlTO7q29R2fWdNoF32ljCbpUcWtWwKdp1F-ZLq5biOkXm0OicvJmr8fVqsSKrgIiM3yY6-xcUcf4clwaO4tbiSNB82jfLZ5fN2Qvb7Jzrciq6z6u_84wdRdKV778rmy', NULL),
(66, 'https://shipit.projects.tmtgps.me/uploads/users/lygdK7bYuVcwvjXp.jpg', 'aaaaasssddd', '+20', '+201128661675', '$2y$10$WwpjrCUwILDSweTR1zTc4OYSW1yH3BENuIkP87dszz9J3/ls6dgAm', 'qqqqqwwwddddf', '1980', '1222244555555', 'https://shipit.projects.tmtgps.me/uploads/users/xWePIfg3ZqSrHzDH.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/lygdK7bYuVcwvjXp.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/yYkim28BhZtVA28R.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/qKKLlBrABgliBFZY.jpg', 1, 1, 'o3QwYldadwjYdr6JudLdOELKQIPsdUUDnSEwu8sj3F4eGKGsELGmBIyhWU1p0lokBlx5j', 'en', '2019-11-24 21:50:11', 8, 261, NULL, NULL, NULL, 'aaasder@gmail.com'),
(67, 'https://shipit.projects.tmtgps.me/uploads/users/tktMwlsVOn3mCwAy.jpg', 'mohamed', '+20', '+201002701002', '$2y$10$O45lCjtJKhdNaUw4WjFONeDf57oDR7Swh58cWEW/rOVIGzLhwWYUO', 'dddsdd', '2018', '245678', 'https://shipit.projects.tmtgps.me/uploads/users/0Otc21ZDNXSsV4XP.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/tktMwlsVOn3mCwAy.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/tyU4CdHtFTB336pD.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/KkZKfUvqRBBhcfVN.jpg', 1, 1, 'eyBO4i9xeroisdJCM8JiaiDBZ4BjPeNFHF1Uyx3WHjgxEjwmWtiBWgHZBNEPQ0GClrFU7', 'en', '2019-12-02 13:40:12', 10, 274, NULL, NULL, 'eqTacIICDTM:APA91bGUQ7ezFZKUw_Ens_HWv-dKvHbcigrd-77-ZxG7jZspuZOHQC_2DzWEmmWAVn6LdD2GAGXH8npfRro6HBsCktvjjzuMu-mlN4aEH_PVqwaY36mNRMgfjXi60K7f2RQYQTJHgMDf', 'ahmed55@yahoo.com'),
(68, 'https://shipit.projects.tmtgps.me/uploads/users/abA7MtLYMzNNZqOJ.jpg', 'hhhhhvv', '+20', '+201156184785', '$2y$10$jCB03KGSYmzsmV5X4Z865u7otn8AGvlKXOmDJIHdSpAkINy1LbTxu', 'xrxrxrxrxtxtcyctcycycycyfyfyyfyycyfyyfy', '2000', '566667778888888888 i 666777', 'https://shipit.projects.tmtgps.me/uploads/users/pWH2PFDNM2KJl2Xl.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/abA7MtLYMzNNZqOJ.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/q8KKX3qMoAwom0pb.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/2sFf6H5SaIBeNKcZ.jpg', 1, 1, 'Mnx6DhBOnAyCKetJFQ0fALF8sgiSAtnWqfqTHM3xYW5QzQ7bKyr018dK1PcV2JpYlLtwx', 'en', '2019-12-02 15:24:12', 10, 291, NULL, NULL, NULL, 'cjhgf@yahoo.com'),
(69, 'https://shipit.projects.tmtgps.me/uploads/users/dDPIAyFkPA0P82D8.jpg', 'Mohamed', '+20', '+201127885195', '$2y$10$9O5hCxJXsYC3AA/fugZtielsSMW7e4EAeNBEqS9U/ei55tJTTry9S', 'tyota', '95', '123456789', 'https://shipit.projects.tmtgps.me/uploads/users/LRPTChfQg8L0apBE.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/dDPIAyFkPA0P82D8.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/gLbtEqct9654kqRO.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/ATgkOmhuHcMZA6If.jpg', 1, 1, 'q1CntJoUOkKZLBewKGXEmQY15faweg301lxBwa0hYzMSlXOcNw4iSI13duLxEFmQ16Jdc', 'en', '2019-12-04 13:22:12', 8, 312, NULL, NULL, 'eDOXyhALHHk:APA91bH4_zFTxkpeWTOrEOwx_0vVUjwmQcR6I3af7WwDEcsr-DFY9vDUzTi2As03AwMaiHGivUhOs0cOpEtkwPaWPlYPsSuo-DPesTyKkHEa--iSeh41WQba8vRfqDFeKzqyhnTmaDt1', 'Mohamed4@gmail.com'),
(70, 'https://shipit.projects.tmtgps.me/uploads/users/rhx4u46bLXlzd5jh.jpg', 'mahtest', '+20', '+201128661644', '$2y$10$JCMT6BSdxEhUWMw0jhdJhe8EgSeKTvg2Ht1dSrme2s10X.CvGkije', 'Toyota', '2000', '12345678', 'https://shipit.projects.tmtgps.me/uploads/users/RCTb43AIBXENJsnm.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/rhx4u46bLXlzd5jh.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/wv3gm3Dm715FNiJ4.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/1STpf26MXIqHgNmA.jpg', 1, 1, 'xe1WLVmWbqCkhWolEzQhAxTfh1Q1PxIHBF0UtK3qjcbtb7T80kKntDdxbPPRkT3KAQ2gW', 'en', '2019-12-23 20:33:12', 8, 508, NULL, NULL, 'fZEw8M1MEC4:APA91bGvgLYcOUPHK4TZDZLlCHKo3Gxxh_LThNRr9XrWP8yvI30YtohyFNbEnu9MSdPtk_qpFOH7UiZ47DMSjdvzeV9Q0obgAvfdxB4fKRs5B6gjy-jkLmoZkW9LiBp5q2AbyL9BQKpZ', 'aaadf@magdsoft.com'),
(71, 'https://shipit.projects.tmtgps.me/uploads/users/gkNwLHqJTiaUhbsV.jpg', 'aaaas', '+966', '+966541234562', '$2y$10$Xi8a67245HRDHZIDu1tlM.ydHggjhzOs6uai7RfiPAVu9aCq8Wd5K', 'toyota', '1980', '123456', 'https://shipit.projects.tmtgps.me/uploads/users/bXf3Xkv42ClBaIig.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/gkNwLHqJTiaUhbsV.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/IT3RdFR8SuxfICmC.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/ec8G9kvYmvaAOHqo.jpg', 1, 0, 'oT2VPfn16I2oFG3PCT7r6T9aXCWwDLyCH2rXWF5LQW949Qu6zuQAawkPUGjfRsj6BA7E2', 'en', '2020-06-28 19:49:06', 8, NULL, NULL, NULL, NULL, 'aaasd@gmail.com'),
(72, 'https://shipit.projects.tmtgps.me/uploads/users/8tVuePauCS3X6Xsy.jpg', 'wwweffffffggffdds', '+966', '+966541234569', '$2y$10$5BZi4D0TkL1z2fyJWXsgiOY13ZZXyF53md23y7I4zOPiv2N7G1kQi', 'toyota', '1990', '123456', 'https://shipit.projects.tmtgps.me/uploads/users/mGasOQ1qN7NNHCBe.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/8tVuePauCS3X6Xsy.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/JGNReKYDX01Pyo7q.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/o77FbZ5buyelAqlD.jpg', 1, 0, 'y9zQ0ArmifViW0kbWYiausYsVBalDdmRaFxXQK5TNgPatAjdXqntdidLcBlnxtqibKtcg', 'en', '2020-06-28 20:31:06', 8, 523, NULL, NULL, 'eD0MsRev-mo:APA91bFdF_sutfqZ49I-cHR1Ea06T0hU5OcYouCaE-MPCaWm-lWGI6aBHxrCYH4N3irWp6QCXUG9_QsmLB3kdmOQutB3DfzChUE67f041aVNJH54TsXKzHfM6_bNLUSBCj8ul9jHVKoL', 'aqqqw@gmail.com'),
(73, 'https://shipit.projects.tmtgps.me/uploads/users/ZrKXTpTWmntcsVnM.jpg', 'qqqwedddff', '+966', '+966541234561', '$2y$10$lJ7QssplaaLy3sEu4ejJI.3h5dyYyCfXxjn9bDmecdYlLkVzycml6', 'toyota', '1999', '123456', 'https://shipit.projects.tmtgps.me/uploads/users/UWHtTFtUd2o72YHU.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/ZrKXTpTWmntcsVnM.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/q1p4KezYqHCkqZkk.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/rkbGXm6dTUbh9RCM.jpg', 1, 0, 'ID25Z1AFWvolgCAczuo1IwVzZ3cF20UMdHUjdrj7J66EhlPZnmVrMyFLEYvMoVQw4Hr4N', 'en', '2020-06-28 20:38:06', 8, 524, NULL, NULL, 'eD0MsRev-mo:APA91bFdF_sutfqZ49I-cHR1Ea06T0hU5OcYouCaE-MPCaWm-lWGI6aBHxrCYH4N3irWp6QCXUG9_QsmLB3kdmOQutB3DfzChUE67f041aVNJH54TsXKzHfM6_bNLUSBCj8ul9jHVKoL', 'aqwer@gmail.com'),
(74, 'https://shipit.projects.tmtgps.me/uploads/users/vf3WaVFsvWToVWuA.jpg', 'mah test', '+966', '+966541234563', '$2y$10$yOryH30xagtgavEhoRU98.EjYu4cbir.9VpNg0kGo0BbChND.jOFe', 'toyota', '1999', '123456', 'https://shipit.projects.tmtgps.me/uploads/users/i3F95PeQuLHc2Flv.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/vf3WaVFsvWToVWuA.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/9qguwnrP9HkChTP0.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/SJFnNFFv3RlYk3xK.jpg', 1, 1, 'n8mfkk0lLXavznHGXLe4WSmSDlfXCW0F1LT4nW2c6WgQnptrQ4DmwueJq0oQ61y8xaeGl', 'en', '2020-06-28 21:42:06', 8, 526, NULL, NULL, 'cF5WQscVSM8:APA91bGIWFSvK6OlMUl_4KAF4Ud_Pu-qcfe_nnuQcYCQcINcFS9LZQcmjAALBadrAEXBKSFKjyavsS10S4L3jN1sOYjayW8EO4erMqrkCXYgnVEFYmG09zv_PZrCHEU_jg53TIpxEP9k', 'test@gmail.com'),
(75, 'https://shipit.projects.tmtgps.me/uploads/users/usqoWJf2SBo5GcJK.jpg', 'tedttt', '+966', '+966541234560', '$2y$10$.5uXCM9IGjSp9YVaHwbFJOurkZ8zJrU/7.wFyArHbH9lUL5e.xUTK', 'toyota', '1980', '123456', 'https://shipit.projects.tmtgps.me/uploads/users/aowZSTtW0EOPQNRn.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/usqoWJf2SBo5GcJK.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/1R4ua4cRf2R5jwI7.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/pm33iPMpujZTOv6X.jpg', 1, 1, 'yiHTLlkRsUWsl05p1wzbJB7MClvW3onCvK31izyEwlHy2DtQjsv05g6TOoJznaP5a5hvL', 'en', '2020-06-28 21:46:06', 8, 525, NULL, NULL, 'eD0MsRev-mo:APA91bFdF_sutfqZ49I-cHR1Ea06T0hU5OcYouCaE-MPCaWm-lWGI6aBHxrCYH4N3irWp6QCXUG9_QsmLB3kdmOQutB3DfzChUE67f041aVNJH54TsXKzHfM6_bNLUSBCj8ul9jHVKoL', 'email@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `drivers_temporary`
--

CREATE TABLE `drivers_temporary` (
  `id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `country_code` varchar(6) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `car_name` varchar(100) DEFAULT NULL,
  `car_model` varchar(100) DEFAULT NULL,
  `car_license_number` varchar(100) DEFAULT NULL,
  `driving_license_image` varchar(255) DEFAULT NULL,
  `car_license_image` varchar(255) DEFAULT NULL,
  `id_image` varchar(255) DEFAULT NULL,
  `car_photo` varchar(255) DEFAULT NULL,
  `trucks_types_id` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `is_approved` tinyint(1) NOT NULL DEFAULT 0,
  `drivers_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `drivers_temporary`
--

INSERT INTO `drivers_temporary` (`id`, `image`, `name`, `country_code`, `phone`, `car_name`, `car_model`, `car_license_number`, `driving_license_image`, `car_license_image`, `id_image`, `car_photo`, `trucks_types_id`, `email`, `created_at`, `is_approved`, `drivers_id`) VALUES
(13, 'https://shipit.projects.tmtgps.me/uploads/users/SFseMmw6KFDr6Ahi.jpg', 'mostafa', '002', NULL, 'mercedes', NULL, 'nnnnnnnnnnnnnnnn', 'https://shipit.projects.tmtgps.me/uploads/users/VTmDJvwmA1SEBtRy.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/SFseMmw6KFDr6Ahi.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/deJuMmh1OD9CVvb7.jpg', 'https://shipit.projects.tmtgps.me/uploads/users/CIhaYwcegbdR43p8.jpg', 8, NULL, '2019-12-24 03:54:12', 0, 5),
(15, NULL, 'mahteste', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-12-24 04:01:12', 0, 70);

-- --------------------------------------------------------

--
-- Table structure for table `emails`
--

CREATE TABLE `emails` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `emails`
--

INSERT INTO `emails` (`id`, `email`, `is_active`, `created_at`) VALUES
(5, 'demo@tatawwar.net', 1, '2019-06-27 17:35:06'),
(6, 'demoTest@magdsoft.com', 1, '2019-08-26 13:57:08');

-- --------------------------------------------------------

--
-- Table structure for table `financials`
--

CREATE TABLE `financials` (
  `id` int(11) NOT NULL,
  `total_benefit` double NOT NULL,
  `paid_money` double NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `drivers_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `financials`
--

INSERT INTO `financials` (`id`, `total_benefit`, `paid_money`, `created_at`, `updated_at`, `drivers_id`) VALUES
(6, 1000, 999, '2019-06-26 00:00:00', '2019-08-25 15:38:08', 5),
(7, 590, 3800, '2019-06-26 00:00:00', '2019-08-26 14:53:08', 5),
(8, 0, 0, '2019-09-02 13:16:09', '2019-09-08 15:15:09', 44),
(9, 0, 0, '2019-09-04 19:26:09', '2019-09-04 19:29:09', 47),
(10, 0, 0, '2019-09-08 18:24:09', NULL, 49),
(11, 0, 0, '2019-09-15 16:46:09', '2019-09-15 17:06:09', 51),
(12, 0, 0, '2019-09-16 14:11:09', '2019-09-16 17:19:09', 52),
(13, 0, 0, '2019-09-23 15:15:09', '2019-09-23 16:46:09', 59),
(14, 0, 0, '2019-09-30 16:59:09', '2019-09-30 17:53:09', 54),
(15, 0, 0, '2019-10-06 17:21:10', '2019-10-06 17:25:10', 63),
(16, 0, 0, '2019-11-23 18:23:11', NULL, 65),
(17, 7.5, 0, '2019-12-04 12:11:12', '2019-12-11 16:27:12', 60),
(18, 0, 0, '2019-12-04 16:19:12', '2019-12-11 01:50:12', 67),
(19, 0, 0, '2019-12-11 15:43:12', NULL, 40);

-- --------------------------------------------------------

--
-- Table structure for table `goods_types`
--

CREATE TABLE `goods_types` (
  `id` int(11) NOT NULL,
  `name_ar` varchar(45) NOT NULL,
  `name_en` varchar(45) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `goods_types`
--

INSERT INTO `goods_types` (`id`, `name_ar`, `name_en`, `created_at`) VALUES
(5, 'مواد غذائية', 'Food', '2019-07-02 23:45:07'),
(8, 'طرود  .', 'Packages', '2019-08-26 14:39:08'),
(11, 'موبايلات', 'mobiles', '2019-12-24 16:11:12');

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` int(11) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `address` text NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `latitude`, `longitude`, `address`, `created_at`) VALUES
(1, 3.5, 2.2, 'next to station', '2019-03-25 00:00:00'),
(2, 2.2, 3.5, 'behind the station', '2019-06-17 19:03:06'),
(3, 30.026059, 31.256337, 'behind the station', '2019-06-17 19:03:06'),
(4, 28.4991667, 30.3305511, 'behind the station', '2019-06-17 19:04:06'),
(5, 30.026059, 31.256337, 'behind the station', '2019-06-17 19:04:06'),
(6, 28.4991667, 30.3305511, 'behind the station', '2019-06-17 19:05:06'),
(7, 30.026059, 31.256337, 'behind the station', '2019-06-17 19:05:06'),
(8, 28.4991667, 30.3305511, 'behind the station', '2019-06-17 19:07:06'),
(9, 30.026059, 31.256337, 'behind the station', '2019-06-17 19:07:06'),
(10, 28.4991667, 30.3305511, 'behind the station', '2019-06-17 19:08:06'),
(11, 30.026059, 31.256337, 'behind the station', '2019-06-17 19:08:06'),
(12, 28.4991667, 30.3305511, 'behind the station', '2019-06-17 19:23:06'),
(13, 30.026059, 31.256337, 'behind the station', '2019-06-17 19:23:06'),
(14, 28.4991667, 30.3305511, 'behind the station', '2019-06-17 19:26:06'),
(15, 30.026059, 31.256337, 'behind the station', '2019-06-17 19:26:06'),
(16, 28.4991667, 30.3305511, 'behind the station', '2019-06-17 19:27:06'),
(17, 30.026059, 31.256337, 'behind the station', '2019-06-17 19:27:06'),
(18, 28.4991667, 30.3305511, 'behind the station', '2019-06-17 19:28:06'),
(19, 30.026059, 31.256337, 'behind the station', '2019-06-17 19:28:06'),
(20, 28.4991667, 30.3305511, 'behind the station', '2019-06-17 19:29:06'),
(21, 30.026059, 31.256337, 'behind the station', '2019-06-17 19:29:06'),
(22, 28.4991667, 30.3305511, 'behind the station', '2019-06-17 19:29:06'),
(23, 30.026059, 31.256337, 'behind the station', '2019-06-17 19:29:06'),
(24, 28.4991667, 30.3305511, 'behind the station', '2019-06-17 19:30:06'),
(25, 30.026059, 31.256337, 'behind the station', '2019-06-17 19:30:06'),
(26, 28.4991667, 30.3305511, 'behind the station', '2019-06-18 14:44:06'),
(27, 30.026059, 31.256337, 'behind the station', '2019-06-18 14:44:06'),
(28, 28.4991667, 30.3305511, 'behind the station', '2019-06-19 14:59:06'),
(29, 30.026059, 31.256337, 'behind the station', '2019-06-19 14:59:06'),
(30, 28.4991667, 30.3305511, 'behind the station', '2019-06-19 15:00:06'),
(31, 30.026059, 31.256337, 'behind the station', '2019-06-19 15:00:06'),
(32, 28.4991667, 30.3305511, 'behind the station', '2019-06-19 15:02:06'),
(33, 30.026059, 31.256337, 'behind the station', '2019-06-19 15:02:06'),
(34, 28.4991667, 30.3305511, 'behind the station', '2019-06-19 15:35:06'),
(35, 30.026059, 31.256337, 'behind the station', '2019-06-19 15:35:06'),
(36, 28.4991667, 30.3305511, 'behind the station', '2019-06-19 19:05:06'),
(37, 30.026059, 31.256337, 'behind the station', '2019-06-19 19:05:06'),
(38, 28.4991667, 30.3305511, 'behind the station', '2019-06-23 15:07:06'),
(39, 30.026059, 31.256337, 'behind the station', '2019-06-23 15:07:06'),
(40, 28.4991667, 30.3305511, 'behind the station', '2019-06-23 15:10:06'),
(41, 30.026059, 31.256337, 'behind the station', '2019-06-23 15:10:06'),
(42, 28.4991667, 30.3305511, 'behind the station', '2019-06-23 15:11:06'),
(43, 30.026059, 31.256337, 'behind the station', '2019-06-23 15:11:06'),
(44, 28.4991667, 30.3305511, 'behind the station', '2019-06-23 15:12:06'),
(45, 30.026059, 31.256337, 'behind the station', '2019-06-23 15:12:06'),
(46, 28.4991667, 30.3305511, 'behind the station', '2019-06-23 15:13:06'),
(47, 30.026059, 31.256337, 'behind the station', '2019-06-23 15:13:06'),
(48, 28.4991667, 30.3305511, 'behind the station', '2019-06-23 15:24:06'),
(49, 30.026059, 31.256337, 'behind the station', '2019-06-23 15:24:06'),
(50, 28.4991667, 30.3305511, 'behind the station', '2019-06-23 15:24:06'),
(51, 30.026059, 31.256337, 'behind the station', '2019-06-23 15:24:06'),
(52, 28.4991667, 30.3305511, 'behind the station', '2019-06-23 16:00:06'),
(53, 30.026059, 31.256337, 'behind the station', '2019-06-23 16:00:06'),
(54, 28.4991667, 30.3305511, 'behind the station', '2019-06-23 16:20:06'),
(55, 30.026059, 31.256337, 'behind the station', '2019-06-23 16:20:06'),
(56, 28.4991667, 30.3305511, 'behind the station', '2019-06-23 16:23:06'),
(57, 30.026059, 31.256337, 'behind the station', '2019-06-23 16:23:06'),
(58, 28.4991667, 30.3305511, 'behind the station', '2019-06-23 18:55:06'),
(59, 30.026059, 31.256337, 'behind the station', '2019-06-23 18:55:06'),
(60, 30.0985, 28.2987, 'next to train station', '2019-08-21 14:29:08'),
(61, 3.5, 2.2, 'next to station', '2019-08-22 09:13:08'),
(62, 31.0985, 29.2987, 'next to bus station', '2019-08-22 09:13:08'),
(63, 28.4991667, 30.3305511, 'behind the station', '2019-08-25 11:33:08'),
(64, 30.026059, 31.256337, 'behind the station', '2019-08-25 11:33:08'),
(65, 28.4991667, 30.3305511, 'behind the station', '2019-08-27 11:29:08'),
(66, 30.026059, 31.256337, 'behind the station', '2019-08-27 11:29:08'),
(67, 28.4991667, 30.3305511, 'behind the station', '2019-09-01 16:06:09'),
(68, 30.026059, 31.256337, 'behind the station', '2019-09-01 16:06:09'),
(69, 28.4991667, 30.3305511, 'behind the station', '2019-09-01 16:13:09'),
(70, 30.026059, 31.256337, 'behind the station', '2019-09-01 16:13:09'),
(71, 45.50135329704015, -122.67125274986029, '3030 SW Moody Ave, Portland, OR 97201, USA', '2019-09-01 17:52:09'),
(72, 27.441339584345652, 31.23695556074381, 'Asyut Desert, Assiut Governorate, Egypt', '2019-09-01 17:52:09'),
(73, 45.50135329704015, -122.67125274986029, '3030 SW Moody Ave, Portland, OR 97201, USA', '2019-09-01 18:02:09'),
(74, 27.441339584345652, 31.23695556074381, 'Asyut Desert, Assiut Governorate, Egypt', '2019-09-01 18:02:09'),
(75, 45.50135329704015, -122.67125274986029, '3030 SW Moody Ave, Portland, OR 97201, USA', '2019-09-01 18:04:09'),
(76, 27.441339584345652, 31.23695556074381, 'Asyut Desert, Assiut Governorate, Egypt', '2019-09-01 18:04:09'),
(77, 45.50135329704015, -122.67125274986029, '3030 SW Moody Ave, Portland, OR 97201, USA', '2019-09-01 18:31:09'),
(78, 27.441339584345652, 31.23695556074381, 'Asyut Desert, Assiut Governorate, Egypt', '2019-09-01 18:31:09'),
(79, 45.50135329704015, -122.67125274986029, '3030 SW Moody Ave, Portland, OR 97201, USA', '2019-09-01 18:43:09'),
(80, 27.441339584345652, 31.23695556074381, 'Asyut Desert, Assiut Governorate, Egypt', '2019-09-01 18:43:09'),
(81, 28.1210742, 30.7436318, 'المنيا برج الماسة خلف برج 10 بابراج الري بحري موقف الاخصاص \" موقف سمالوط، Menia Governorate, Egypt', '2019-09-02 12:23:09'),
(82, 45.4970217487606, -122.59812500327827, '3526 SE 63rd Ave, Portland, OR 97206, USA', '2019-09-02 13:04:09'),
(83, 27.441339584345652, 31.23695556074381, 'Asyut Desert, Assiut Governorate, Egypt', '2019-09-02 13:04:09'),
(84, 27.441339584345652, 31.23695556074381, 'Asyut Desert, Assiut Governorate, Egypt', '2019-09-02 13:09:09'),
(85, 26.07049112797317, 32.530253045260906, 'Unnamed Road, Qesm Al Wahat Al Khargah, New Valley Governorate, Egypt', '2019-09-02 13:09:09'),
(86, 27.441339584345652, 31.23695556074381, 'Asyut Desert, Assiut Governorate, Egypt', '2019-09-02 15:18:09'),
(87, 45.4970217487606, -122.59812500327827, '3526 SE 63rd Ave, Portland, OR 97206, USA', '2019-09-02 15:18:09'),
(88, 45.4970217487606, -122.59812500327827, '3526 SE 63rd Ave, Portland, OR 97206, USA', '2019-09-02 16:10:09'),
(89, 27.441339584345652, 31.23695556074381, 'Asyut Desert, Assiut Governorate, Egypt', '2019-09-02 16:10:09'),
(90, 45.4970217487606, -122.59812500327827, '3526 SE 63rd Ave, Portland, OR 97206, USA', '2019-09-02 16:11:09'),
(91, 27.441339584345652, 31.23695556074381, 'Asyut Desert, Assiut Governorate, Egypt', '2019-09-02 16:11:09'),
(92, 30.7440744, 28.120938, 'المنيا برج الماسة خلف برج 10 بابراج الري بحري موقف الاخصاص \" موقف سمالوط، Menia Governorate, Egypt', '2019-09-02 18:05:09'),
(93, 44.94945807784486, -123.11219852417707, 'Salem, OR, USA', '2019-09-03 13:31:09'),
(94, 44.94439656434437, -123.12236443161966, '4613 Eola Dr NW, Salem, OR 97304, USA', '2019-09-03 13:31:09'),
(95, 27.733771234923, 30.843202248215675, 'ملوي، قسم ملوي، ملوي،، Menia Governorate, Egypt', '2019-09-03 18:06:09'),
(96, 28.316089965615106, 30.71166504174471, 'مدينة سمالوط، شارع بورسعيد،، المنيا،، Egypt', '2019-09-03 18:06:09'),
(97, 45.60913381687895, -122.71086025983095, '10391 N Portland Rd, Portland, OR 97217, USA', '2019-09-03 18:16:09'),
(98, 45.510886135395154, -122.66663298010825, '1927 SE Water Ave, Portland, OR 97202, USA', '2019-09-03 18:16:09'),
(99, 45.58200667367831, -122.65257619321348, '8101 NE 11th Ave, Portland, OR 97211, USA', '2019-09-03 18:20:09'),
(100, 45.53227968057766, -122.67143279314041, 'N Interstate & Larrabee, Portland, OR 97227, USA', '2019-09-03 18:20:09'),
(101, 30.114665696722877, 31.27065148204565, '40 Anwar Afify, Bahtim, Shubra El Kheima 2, Al Qalyubia Governorate, Egypt', '2019-09-03 20:27:09'),
(102, 30.074592834414656, 31.204825043678284, '44 Desouky Abd El-Wahab, Abd El-Naeem, Imbaba, Giza Governorate, Egypt', '2019-09-03 20:27:09'),
(103, 30.122975045182518, 31.268937215209007, '6، بهتيم، قسم ثان شبرا الخيمة،، Al Qalyubia Governorate, Egypt', '2019-09-03 20:38:09'),
(104, 30.045195632561, 31.24596644192934, '8 El-Gomhoreya, Rahbet Abdin, Abdeen, Cairo Governorate, Egypt', '2019-09-03 20:38:09'),
(105, 28.18957964556275, 30.690108127892017, 'طحا الأعمدة، سمالوط،، Menia Governorate, Egypt', '2019-09-04 13:11:09'),
(106, 28.07587428456059, 30.757716223597527, 'Al Nagah, Qism Minya, Minya, Menia Governorate, Egypt', '2019-09-04 13:11:09'),
(107, 28.099321282042347, 30.773146636784077, 'Unnamed Road, Sawadah, Minya, Menia Governorate, Egypt', '2019-09-04 13:45:09'),
(108, 28.08358610152271, 30.752151980996132, '7 شارع صابر عبدالسلام، Shady, Qism Minya, Minya, Menia Governorate, Egypt', '2019-09-04 13:45:09'),
(109, 28.064715574362303, 30.776405185461044, 'Unnamed Road, Qism Minya, Minya, Menia Governorate, Egypt', '2019-09-04 15:15:09'),
(110, 28.18846645805111, 30.76851949095726, 'Unnamed Road, Tahna Al Gabal, Minya, Menia Governorate, Egypt', '2019-09-04 15:15:09'),
(111, 28.224462608454342, 30.711770989000797, 'Al Menya Samalout, Samalout, Menia Governorate, Egypt', '2019-09-04 16:38:09'),
(112, 28.02028343511353, 30.70160038769245, 'Unnamed Road, Saft Al Khemar Al Asleyah, Minya, Menia Governorate, Egypt', '2019-09-04 16:38:09'),
(113, 28.224462608454342, 30.711770989000797, 'Al Menya Samalout, Samalout, Menia Governorate, Egypt', '2019-09-04 16:41:09'),
(114, 28.02028343511353, 30.70160038769245, 'Unnamed Road, Saft Al Khemar Al Asleyah, Minya, Menia Governorate, Egypt', '2019-09-04 16:41:09'),
(115, 28.1209492, 30.743742, 'Bani Sweif - Dayrout, Damaris, Minya, Menia Governorate, Egypt', '2019-09-04 18:20:09'),
(116, 28.1208083, 30.7438567, 'المنيا برج الماسة خلف برج 10 بابراج الري بحري موقف الاخصاص \" موقف سمالوط، Menia Governorate, Egypt', '2019-09-04 19:05:09'),
(117, 28.229551260068032, 30.69370362907648, 'Al Menya Samalout, Nazlet Al Amoudein, Samalout, Menia Governorate, Egypt', '2019-09-04 19:18:09'),
(118, 28.186891959082143, 30.7661447301507, 'Nazlet El-Shorafaa Bani Khaled, Tahna Al Gabal, Minya, Menia Governorate, Egypt', '2019-09-04 19:18:09'),
(119, 28.229551260068032, 30.69370362907648, 'Al Menya Samalout, Nazlet Al Amoudein, Samalout, Menia Governorate, Egypt', '2019-09-04 19:27:09'),
(120, 28.186891959082143, 30.7661447301507, 'Nazlet El-Shorafaa Bani Khaled, Tahna Al Gabal, Minya, Menia Governorate, Egypt', '2019-09-04 19:27:09'),
(121, 28.315953307193514, 30.702388621866703, 'Bani Sweif - Dayrout, Madinet Samalout, Samalout, Menia Governorate, Egypt', '2019-09-08 14:29:09'),
(122, 29.334010913032735, 31.195100359618664, 'Unnamed Road, Al Masloub, Al Wasta, Beni Suef Governorate, Egypt', '2019-09-08 14:29:09'),
(123, 28.070313268360064, 30.7644609734416, 'El-Tahrir, Maqousah, Minya, Menia Governorate, Egypt', '2019-09-08 14:56:09'),
(124, 28.06223008226469, 30.774778090417385, 'Bani Sweif - Dayrout, Qism Minya, Minya, Menia Governorate, Egypt', '2019-09-08 14:56:09'),
(125, 28.22664007057943, 30.70330962538719, 'Unnamed Road, Nazali Taha, Samalout, Menia Governorate, Egypt', '2019-09-08 15:09:09'),
(126, 27.021501591365244, 31.263470202684402, 'Unnamed Road, Al Aqadmah, Markaz Abu Tig, Assiut Governorate, Egypt', '2019-09-08 15:09:09'),
(127, 30.0526136, 31.3717516, '13 الدكتور إبراهيم ناجي، التاسعة، مدينة نصر، محافظة القاهرة‬، مصر', '2019-09-08 17:36:09'),
(128, 30.0526962, 31.3715736, '٢٣ب الدكتور محمود صالح أبو زيد، التاسعة، مدينة نصر،، Cairo Governorate, Egypt', '2019-09-08 18:00:09'),
(129, 30.052660526879468, 31.371677219867706, '13 Dr Ibrahim Nagy, At Taseah, Nasr City, Cairo Governorate, Egypt', '2019-09-08 18:18:09'),
(130, 30.052660526879468, 31.371677219867706, '13 Dr Ibrahim Nagy, At Taseah, Nasr City, Cairo Governorate, Egypt', '2019-09-08 18:18:09'),
(131, 30.052660526879468, 31.371677219867706, '13 Dr Ibrahim Nagy, At Taseah, Nasr City, Cairo Governorate, Egypt', '2019-09-09 15:05:09'),
(132, 30.052660526879468, 31.371677219867706, '13 Dr Ibrahim Nagy, At Taseah, Nasr City, Cairo Governorate, Egypt', '2019-09-09 15:05:09'),
(133, 30.0526181, 31.3717791, '13 الدكتور إبراهيم ناجي، التاسعة، مدينة نصر، محافظة القاهرة‬، مصر', '2019-09-09 15:14:09'),
(134, 30.09878893050748, 31.63498029112816, 'unknown address !', '2019-09-15 15:01:09'),
(135, 29.749712603140456, 30.841342471539974, 'unknown address !', '2019-09-15 15:01:09'),
(136, 30.007045718864322, 31.430045776069164, 'unknown address !', '2019-09-15 15:10:09'),
(137, 29.974865643800367, 31.29412315785885, 'unknown address !', '2019-09-15 15:10:09'),
(138, 28.1209434, 30.7434897, 'Bani Sweif - Dayrout, Damaris, Minya, Menia Governorate, Egypt', '2019-09-15 15:53:09'),
(139, 28.123372283955426, 30.77296793460846, 'unknown address !', '2019-09-15 16:22:09'),
(140, 28.074441014752033, 30.823975168168545, 'unknown address !', '2019-09-15 16:22:09'),
(141, 30.475022685225188, 31.415730491280556, 'الحوض الطويل، مركز منيا القمح، الشرقية،، Egypt', '2019-09-16 09:33:09'),
(142, 30.475022685225188, 31.415730491280556, 'الحوض الطويل، مركز منيا القمح، الشرقية،، Egypt', '2019-09-16 09:33:09'),
(143, 37.4219983, -122.084, '1600 Amphitheatre Pkwy, Mountain View, CA 94043, USA', '2019-09-16 13:13:09'),
(144, 28.110765025586957, 30.753833390772343, 'نقابة وكافيتيريا المهندسين، Kornish Al Nile, Qism Minya, Minya, Menia Governorate, Egypt', '2019-09-16 13:25:09'),
(145, 28.0317888681191, 30.80780614167452, 'Nazlet Bani Ahmed Al Sharkawi - Manafis, Bani Hammad, Minya, Menia Governorate, Egypt', '2019-09-16 13:25:09'),
(146, 28.110765025586957, 30.753833390772343, 'نقابة وكافيتيريا المهندسين، Kornish Al Nile, Qism Minya, Minya, Menia Governorate, Egypt', '2019-09-16 13:40:09'),
(147, 26.084731061970803, 31.68232463300228, 'Al Wadi Al Gadid Desert, New Valley Governorate, Egypt', '2019-09-16 13:40:09'),
(148, 28.13036752840866, 30.731265284121037, 'Unnamed Road, مركز المنيا، المنيا، Egypt', '2019-09-16 14:58:09'),
(149, 28.033272720469956, 30.800802558660507, 'نزلة بني احمد الشرقاوي - منسافس، مركز المنيا، المنيا،، Egypt', '2019-09-16 14:58:09'),
(150, 28.0177750134629, 30.762672275304794, 'Unnamed Road, ريدة،، Menia Governorate, Egypt', '2019-09-16 16:43:09'),
(151, 27.1434516076836, 31.18865568190813, 'Unnamed Road, Nazlet Abd Allah, Asyut, Assiut Governorate, Egypt', '2019-09-16 16:43:09'),
(152, 28.0935812, 30.746489699999984, 'Minya, Qism Minya, Minya, Egypt', '2019-09-16 17:15:09'),
(153, 27.357801255533918, 30.947184450924397, 'Unnamed Road, مركز منفلوط، أسيوط،، Egypt', '2019-09-16 17:15:09'),
(154, 27.63606724455937, 31.061659455299377, 'Unnamed Road, Al Minya Desert, Red Sea Governorate, Egypt', '2019-09-16 18:16:09'),
(155, 24.349052162400984, 33.0777670070529, 'Nasr, Aswan Governorate, Egypt', '2019-09-16 18:16:09'),
(156, 27.63606724455937, 31.061659455299377, 'Unnamed Road, Al Minya Desert, Red Sea Governorate, Egypt', '2019-09-16 18:22:09'),
(157, 27.63606724455937, 31.061659455299377, 'Unnamed Road, Al Minya Desert, Red Sea Governorate, Egypt', '2019-09-16 18:22:09'),
(158, 27.63606724455937, 31.061659455299377, 'Unnamed Road, Al Minya Desert, Red Sea Governorate, Egypt', '2019-09-16 18:32:09'),
(159, 27.63606724455937, 31.061659455299377, 'Unnamed Road, Al Minya Desert, Red Sea Governorate, Egypt', '2019-09-16 18:32:09'),
(160, 27.63606724455937, 31.061659455299377, 'Unnamed Road, Al Minya Desert, Red Sea Governorate, Egypt', '2019-09-17 14:53:09'),
(161, 27.63606724455937, 31.061659455299377, 'Unnamed Road, Al Minya Desert, Red Sea Governorate, Egypt', '2019-09-17 14:53:09'),
(162, 28.0922202, 30.7465247, 'شارع بديع الزمان، Qism Minya, Minya, Menia Governorate, Egypt', '2019-09-17 14:55:09'),
(163, 28.095641990075958, 30.772273242473602, 'Unnamed Road, Sawadah, Minya, Menia Governorate, Egypt', '2019-09-17 14:59:09'),
(164, 28.043193644605626, 30.72301112115383, 'Saft Al Sharqeya - Kafr Al Foqaai, Saft Al Khemar Al Asleyah, Minya, Menia Governorate, Egypt', '2019-09-17 14:59:09'),
(165, 28.4991667, 30.3305511, 'behind the station', '2019-09-17 15:16:09'),
(166, 30.026059, 31.256337, 'behind the station', '2019-09-17 15:16:09'),
(167, 28.070856129465582, 30.75243830680847, 'Unnamed Road, Qism Minya, Minya, Menia Governorate, Egypt', '2019-09-17 15:17:09'),
(168, 27.925732862369426, 30.817856043577194, 'Gnayen Al Fabrikah, Madinet Al Fekreyah (Include Monshaat Al Fekr), Abu Qurqas, Menia Governorate, Egypt', '2019-09-17 15:17:09'),
(169, 28.070856129465582, 30.75243830680847, 'Unnamed Road, Qism Minya, Minya, Menia Governorate, Egypt', '2019-09-17 15:23:09'),
(170, 27.925732862369426, 30.817856043577194, 'Gnayen Al Fabrikah, Madinet Al Fekreyah (Include Monshaat Al Fekr), Abu Qurqas, Menia Governorate, Egypt', '2019-09-17 15:23:09'),
(171, 28.070856129465582, 30.75243830680847, 'Unnamed Road, Qism Minya, Minya, Menia Governorate, Egypt', '2019-09-17 15:24:09'),
(172, 27.925732862369426, 30.817856043577194, 'Gnayen Al Fabrikah, Madinet Al Fekreyah (Include Monshaat Al Fekr), Abu Qurqas, Menia Governorate, Egypt', '2019-09-17 15:24:09'),
(173, 28.070856129465582, 30.75243830680847, 'Unnamed Road, Qism Minya, Minya, Menia Governorate, Egypt', '2019-09-17 15:30:09'),
(174, 27.925732862369426, 30.817856043577194, 'Gnayen Al Fabrikah, Madinet Al Fekreyah (Include Monshaat Al Fekr), Abu Qurqas, Menia Governorate, Egypt', '2019-09-17 15:30:09'),
(175, 28.4991667, 30.3305511, 'behind the station', '2019-09-17 15:51:09'),
(176, 30.026059, 31.256337, 'behind the station', '2019-09-17 15:51:09'),
(177, 28.4991667, 30.3305511, 'behind the station', '2019-09-17 15:55:09'),
(178, 30.026059, 31.256337, 'behind the station', '2019-09-17 15:55:09'),
(179, 28.4991667, 30.3305511, 'behind the station', '2019-09-17 15:56:09'),
(180, 30.026059, 31.256337, 'behind the station', '2019-09-17 15:56:09'),
(181, 28.08091468669057, 30.75693804770708, 'شارع مخازن الري، قسم المنيا، مركز المنيا، المنيا،، Egypt', '2019-09-17 16:01:09'),
(182, 27.896305314741728, 30.754977017641068, 'Unnamed Road, Abou El-Safa, Abu Qurqas, Menia Governorate, Egypt', '2019-09-17 16:01:09'),
(183, 28.4991667, 30.3305511, 'behind the station', '2019-09-17 16:05:09'),
(184, 30.026059, 31.256337, 'behind the station', '2019-09-17 16:05:09'),
(185, 28.08091468669057, 30.75693804770708, 'شارع مخازن الري، قسم المنيا، مركز المنيا، المنيا،، Egypt', '2019-09-17 16:09:09'),
(186, 27.896305314741728, 30.754977017641068, 'Unnamed Road, Abou El-Safa, Abu Qurqas, Menia Governorate, Egypt', '2019-09-17 16:09:09'),
(187, 28.4991667, 30.3305511, 'behind the station', '2019-09-17 16:14:09'),
(188, 30.026059, 31.256337, 'behind the station', '2019-09-17 16:14:09'),
(189, 28.4991667, 30.3305511, 'behind the station', '2019-09-17 16:17:09'),
(190, 30.026059, 31.256337, 'behind the station', '2019-09-17 16:17:09'),
(191, 28.08091468669057, 30.75693804770708, 'شارع مخازن الري، قسم المنيا، مركز المنيا، المنيا،، Egypt', '2019-09-17 18:16:09'),
(192, 27.896305314741728, 30.754977017641068, 'Unnamed Road, Abou El-Safa, Abu Qurqas, Menia Governorate, Egypt', '2019-09-17 18:16:09'),
(193, 28.0802632, 30.8255868, 'Unnamed Road, New Minya City, Red Sea Governorate, Egypt', '2019-09-23 11:46:09'),
(194, 28.1210469, 30.7434664, 'المنيا برج الماسة خلف برج 10 بابراج الري بحري موقف الاخصاص \" موقف سمالوط، المنيا، مصر', '2019-09-23 11:52:09'),
(195, 28.1209855, 30.7435522, 'المنيا برج الماسة خلف برج 10 بابراج الري بحري موقف الاخصاص \" موقف سمالوط، المنيا، مصر', '2019-09-23 12:12:09'),
(196, 28.1209549, 30.7434878, 'المنيا برج الماسة خلف برج 10 بابراج الري بحري موقف الاخصاص \" موقف سمالوط، المنيا، مصر', '2019-09-23 12:19:09'),
(197, 28.1207195, 30.7446778, 'بني سويف - ديروط، مركز المنيا، المنيا، مصر', '2019-09-23 12:38:09'),
(198, 28.1209425, 30.7435109, 'المنيا برج الماسة خلف برج 10 بابراج الري بحري موقف الاخصاص \" موقف سمالوط، المنيا، مصر', '2019-09-23 13:27:09'),
(199, 28.08522630724274, 30.762880817055702, 'Abd El-Salam, Qism Minya, Minya, Menia Governorate, Egypt', '2019-09-23 13:40:09'),
(200, 27.924074822209715, 30.864376947283745, 'Unnamed Road, Abu Qurqas, Menia Governorate, Egypt', '2019-09-23 13:40:09'),
(201, 28.08522630724274, 30.762880817055702, 'Abd El-Salam, Qism Minya, Minya, Menia Governorate, Egypt', '2019-09-23 13:48:09'),
(202, 27.924074822209715, 30.864376947283745, 'Unnamed Road, Abu Qurqas, Menia Governorate, Egypt', '2019-09-23 13:48:09'),
(203, 28.079401910519508, 30.76354332268238, 'Al Shamandi, Qism Minya, Minya, Menia Governorate, Egypt', '2019-09-23 14:18:09'),
(204, 27.92723180121115, 30.844368673861027, 'Unnamed Road, Abu Qurqas, Menia Governorate, Egypt', '2019-09-23 14:18:09'),
(205, 28.381312046814852, 30.854913108050823, 'Al Minya Desert, Menia Governorate, Egypt', '2019-09-23 15:32:09'),
(206, 27.679754171766447, 30.873618498444557, 'Saad Zaghloul, Menia Governorate, Egypt', '2019-09-23 15:32:09'),
(207, 28.291966887060806, 30.809746719896793, 'Al Minya Desert, Menia Governorate, Egypt', '2019-09-23 16:29:09'),
(208, 28.291966887060806, 30.809746719896793, 'Al Minya Desert, Menia Governorate, Egypt', '2019-09-23 16:29:09'),
(209, 28.291966887060806, 30.809746719896793, 'Al Minya Desert, Menia Governorate, Egypt', '2019-09-23 16:41:09'),
(210, 28.291966887060806, 30.809746719896793, 'Al Minya Desert, Menia Governorate, Egypt', '2019-09-23 16:41:09'),
(211, 28.4991667, 30.3305511, 'behind the station', '2019-09-23 18:25:09'),
(212, 30.026059, 31.256337, 'behind the station', '2019-09-23 18:25:09'),
(213, 29.36091263246414, 31.026051118969917, 'Unnamed Road, El-Nasereya, Al Faiyum, Faiyum Governorate, Egypt', '2019-09-23 18:40:09'),
(214, 25.98612757886318, 32.855774983763695, 'Unnamed Road, Qift, Red Sea Governorate, Egypt', '2019-09-23 18:40:09'),
(215, 29.36091263246414, 31.026051118969917, 'Unnamed Road, El-Nasereya, Al Faiyum, Faiyum Governorate, Egypt', '2019-09-23 18:50:09'),
(216, 25.98612757886318, 32.855774983763695, 'Unnamed Road, Qift, Red Sea Governorate, Egypt', '2019-09-23 18:50:09'),
(217, 29.36091263246414, 31.026051118969917, 'Unnamed Road, El-Nasereya, Al Faiyum, Faiyum Governorate, Egypt', '2019-09-23 19:02:09'),
(218, 25.98612757886318, 32.855774983763695, 'Unnamed Road, Qift, Red Sea Governorate, Egypt', '2019-09-23 19:02:09'),
(219, 29.36091263246414, 31.026051118969917, 'Unnamed Road, El-Nasereya, Al Faiyum, Faiyum Governorate, Egypt', '2019-09-23 19:06:09'),
(220, 25.98612757886318, 32.855774983763695, 'Unnamed Road, Qift, Red Sea Governorate, Egypt', '2019-09-23 19:06:09'),
(221, 29.491790473478517, 30.44056948274374, 'Al Faiyum Governorate Desert, Faiyum Governorate, Egypt', '2019-09-23 19:14:09'),
(222, 29.36091263246414, 31.026051118969917, 'Unnamed Road, El-Nasereya, Al Faiyum, Faiyum Governorate, Egypt', '2019-09-23 19:14:09'),
(223, 27.44828006168748, 31.29633765667677, 'Asyut Desert, Assiut Governorate, Egypt', '2019-09-24 13:21:09'),
(224, 24.490043198268854, 33.169356398284435, 'Nasr, Aswan Governorate, Egypt', '2019-09-24 13:21:09'),
(225, 27.44828006168748, 31.29633765667677, 'Asyut Desert, Assiut Governorate, Egypt', '2019-09-24 13:23:09'),
(226, 27.44828006168748, 31.29633765667677, 'Asyut Desert, Assiut Governorate, Egypt', '2019-09-24 13:23:09'),
(227, 28.063175647037436, 30.78144907951355, 'Unnamed Road, Qism Minya, Minya, Menia Governorate, Egypt', '2019-09-24 14:38:09'),
(228, 27.774444906055802, 30.860081389546394, 'Unnamed Road, AR Rayramoun, Melawi, Menia Governorate, Egypt', '2019-09-24 14:38:09'),
(229, 28.1209659, 30.7437389, 'المنيا برج الماسة خلف برج 10 بابراج الري بحري موقف الاخصاص \" موقف سمالوط، Damaris, Minya, Menia Governorate, Egypt', '2019-09-25 15:17:09'),
(230, 28.1210854, 30.7436655, 'المنيا برج الماسة خلف برج 10 بابراج الري بحري موقف الاخصاص \" موقف سمالوط، المنيا، مصر', '2019-09-29 13:02:09'),
(231, 27.431158673988314, 31.03237073868513, 'unknown address !', '2019-09-29 15:37:09'),
(232, 26.47600759230884, 32.09250882267952, 'unknown address !', '2019-09-29 15:37:09'),
(233, 28.087625192399216, 30.751845203340054, 'شارع مضرب الأرز، المتفرع من شارع سكة تله، بجوار مركز صيانة المحافظة، أمام فارما أوفرسيس للأدوية، تقسيم شادي، المنيا،، Egypt', '2019-09-30 14:36:09'),
(234, 27.925756857403936, 30.850429125130177, 'Torad Al Bahar Bridge, Abu Qurqas, Menia Governorate, Egypt', '2019-09-30 14:36:09'),
(235, 27.925756857403936, 30.850429125130177, 'Torad Al Bahar Bridge, Abu Qurqas, Menia Governorate, Egypt', '2019-09-30 17:13:09'),
(236, 28.94568379669807, 30.991404689848423, 'Bani Sweif - Dayrout, Beba, Beni Suef Governorate, Egypt', '2019-09-30 17:13:09'),
(237, 27.925756857403936, 30.850429125130177, 'Torad Al Bahar Bridge, Abu Qurqas, Menia Governorate, Egypt', '2019-09-30 17:14:09'),
(238, 28.94568379669807, 30.991404689848423, 'Bani Sweif - Dayrout, Beba, Beni Suef Governorate, Egypt', '2019-09-30 17:14:09'),
(239, 30.198808859656882, 31.334870271384716, 'عزبة عربان فودة، سرياقوس، مركز الخانكة،، القليوبية، مصر', '2019-09-30 18:04:09'),
(240, 31.28385322203036, 29.983541183173656, 'مصر', '2019-09-30 18:04:09'),
(241, 30.198808859656882, 31.334870271384716, 'عزبة عربان فودة، سرياقوس، مركز الخانكة،، القليوبية، مصر', '2019-09-30 18:04:09'),
(242, 31.28385322203036, 29.983541183173656, 'مصر', '2019-09-30 18:04:09'),
(243, 25.822104771207968, 32.78093095868826, 'طريق القاهرة - أسوان الصحراوي الشرقي، قوص، قنا، مصر', '2019-09-30 18:18:09'),
(244, 28.064421791659537, 34.51226469129324, 'السعودية', '2019-09-30 18:18:09'),
(245, 30.8255868, 28.0802632, 'Unnamed Road, New Minya City, Red Sea Governorate, Egypt', '2019-09-30 18:20:09'),
(246, 24.6662972, 46.7299153, '7459 عبدالرحمن بن شقران، الملز، الرياض 12629 4212، السعودية', '2019-10-06 14:32:10'),
(247, 29.99323168299699, 31.49631779640913, 'Investor Area Ext, Industrial Area, Third New Cairo, Cairo Governorate, Egypt', '2019-10-06 14:35:10'),
(248, 30.084665372655806, 31.68896310031414, 'Unnamed Road, Second New Cairo, Cairo Governorate, Egypt', '2019-10-06 14:35:10'),
(249, 24.89940814282472, 46.61996338516474, 'Unnamed Road, الرياض 13345، السعودية', '2019-10-22 14:09:10'),
(250, 24.89940814282472, 46.61996338516474, 'Unnamed Road, الرياض 13345، السعودية', '2019-10-22 14:09:10'),
(251, 24.7527762, 46.6486289, '5166 شارع الامير تركي بن عبدالعزيز الثاني، النخيل، الرياض 12383 7963، السعودية', '2019-10-22 14:40:10'),
(252, 30.0526105, 31.3718356, '13 Dr Ibrahim Nagy, At Taseah, Nasr City, Cairo Governorate, Egypt', '2019-10-27 13:22:10'),
(253, 24.7135517, 46.67529569999999, 'Riyadh Saudi Arabia', '2019-10-27 13:36:10'),
(254, 26.420682799999998, 50.08879429999999, 'Dammam Saudi Arabia', '2019-10-27 13:36:10'),
(255, 30.233891944039105, 31.398164704442024, 'Al Khanka - Al Salam Rd, Al Khankah, Al Qalyubia Governorate, Egypt', '2019-11-23 18:15:11'),
(256, 30.0526587, 31.37167690000001, 'Magdsoft ( software house ), At Taseah, Nasr City, Egypt', '2019-11-23 18:15:11'),
(257, 27.91555285887692, 30.75668826699257, 'Unnamed Road, Mantout, Abu Qurqas, Menia Governorate, Egypt', '2019-11-24 17:23:11'),
(258, 27.91555285887692, 30.75668826699257, 'Unnamed Road, Mantout, Abu Qurqas, Menia Governorate, Egypt', '2019-11-24 17:23:11'),
(259, 28.511997081204463, 30.94376463443041, 'Al Minya Desert, Menia Governorate, Egypt', '2019-11-24 21:16:11'),
(260, 27.940396686257934, 30.750167816877365, 'Bani Ebeid Nagaa Arab El-Soultan, Al Barba, Abu Qurqas, Menia Governorate, Egypt', '2019-11-24 21:16:11'),
(261, 28.120993, 30.7437544, 'المنيا برج الماسة خلف برج 10 بابراج الري بحري موقف الاخصاص \" موقف سمالوط، Menia Governorate, Egypt', '2019-11-24 21:50:11'),
(262, 30.048584535624762, 31.228160597383976, 'Nile City Boat, Zamalek, Cairo Governorate, Egypt', '2019-11-24 22:06:11'),
(263, 30.099762104432024, 31.222541369497776, 'Al Kornish, Warraq Al Arab, El Warraq, Giza Governorate, Egypt', '2019-11-24 22:06:11'),
(264, 26.251664296991756, 45.39519600570202, '15741, Saudi Arabia', '2019-11-25 14:19:11'),
(265, 26.617567491625305, 49.742203541100025, '32785, Saudi Arabia', '2019-11-25 14:19:11'),
(266, 32.6084473397956, 46.59979149699211, 'Ali Al-Gharbi, Iraq', '2019-12-02 12:42:12'),
(267, 32.6084473397956, 46.59979149699211, 'Ali Al-Gharbi, Iraq', '2019-12-02 12:42:12'),
(268, 33.53848891732815, 36.533981412649155, 'Duma District, Syria', '2019-12-02 13:19:12'),
(269, 34.32181774369799, 32.96092763543129, 'unknown address !', '2019-12-02 13:19:12'),
(270, 27.889204470303127, 47.24248096346855, '37996, Saudi Arabia', '2019-12-02 13:22:12'),
(271, 27.889204470303127, 47.24248096346855, '37996, Saudi Arabia', '2019-12-02 13:22:12'),
(272, 26.221621514352986, 46.9978004693985, '15833, Saudi Arabia', '2019-12-02 13:25:12'),
(273, 27.889204470303127, 47.24248096346855, '37996, Saudi Arabia', '2019-12-02 13:25:12'),
(274, 28.1210088, 30.7437718, 'المنيا برج الماسة خلف برج 10 بابراج الري بحري موقف الاخصاص \" موقف سمالوط، Damaris, Minya, Menia Governorate, Egypt', '2019-12-02 13:40:12'),
(275, 24.4369546441507, -100.56732013821602, 'Galeana, N.L., Mexico', '2019-12-02 14:38:12'),
(276, 24.4369546441507, -100.56732013821602, 'Galeana, N.L., Mexico', '2019-12-02 14:38:12'),
(277, 24.4369546441507, -100.56732013821602, 'Galeana, N.L., Mexico', '2019-12-02 14:45:12'),
(278, 24.4369546441507, -100.56732013821602, 'Galeana, N.L., Mexico', '2019-12-02 14:45:12'),
(279, 24.4369546441507, -100.56732013821602, 'Galeana, N.L., Mexico', '2019-12-02 14:49:12'),
(280, 24.4369546441507, -100.56732013821602, 'Galeana, N.L., Mexico', '2019-12-02 14:49:12'),
(281, 24.4369546441507, -100.56732013821602, 'Galeana, N.L., Mexico', '2019-12-02 14:49:12'),
(282, 24.4369546441507, -100.56732013821602, 'Galeana, N.L., Mexico', '2019-12-02 14:49:12'),
(283, 24.4369546441507, -100.56732013821602, 'Galeana, N.L., Mexico', '2019-12-02 14:50:12'),
(284, 24.4369546441507, -100.56732013821602, 'Galeana, N.L., Mexico', '2019-12-02 14:50:12'),
(285, 24.4369546441507, -100.56732013821602, 'Galeana, N.L., Mexico', '2019-12-02 14:50:12'),
(286, 24.4369546441507, -100.56732013821602, 'Galeana, N.L., Mexico', '2019-12-02 14:50:12'),
(287, 24.4369546441507, -100.56732013821602, 'Galeana, N.L., Mexico', '2019-12-02 14:58:12'),
(288, 24.4369546441507, -100.56732013821602, 'Galeana, N.L., Mexico', '2019-12-02 14:58:12'),
(289, 24.4369546441507, -100.56732013821602, 'Galeana, N.L., Mexico', '2019-12-02 14:59:12'),
(290, 24.4369546441507, -100.56732013821602, 'Galeana, N.L., Mexico', '2019-12-02 14:59:12'),
(291, 28.1209194, 30.7436228, 'المنيا برج الماسة خلف برج 10 بابراج الري بحري موقف الاخصاص \" موقف سمالوط، Menia Governorate, Egypt', '2019-12-02 15:24:12'),
(292, 28.769942945225424, 47.386126667261124, '39392, Saudi Arabia', '2019-12-02 15:36:12'),
(293, 23.91558357999127, 47.00239408761263, '16318, Saudi Arabia', '2019-12-02 15:36:12'),
(294, 28.769942945225424, 47.386126667261124, '39392, Saudi Arabia', '2019-12-02 16:07:12'),
(295, 28.769942945225424, 47.386126667261124, '39392, Saudi Arabia', '2019-12-02 16:07:12'),
(296, 28.769942945225424, 47.386126667261124, '39392, Saudi Arabia', '2019-12-02 16:09:12'),
(297, 28.769942945225424, 47.386126667261124, '39392, Saudi Arabia', '2019-12-02 16:09:12'),
(298, 28.769942945225424, 47.386126667261124, '39392, Saudi Arabia', '2019-12-02 16:09:12'),
(299, 28.769942945225424, 47.386126667261124, '39392, Saudi Arabia', '2019-12-02 16:09:12'),
(300, 28.769942945225424, 47.386126667261124, '39392, Saudi Arabia', '2019-12-02 16:11:12'),
(301, 28.769942945225424, 47.386126667261124, '39392, Saudi Arabia', '2019-12-02 16:11:12'),
(302, 28.769942945225424, 47.386126667261124, '39392, Saudi Arabia', '2019-12-02 16:13:12'),
(303, 28.769942945225424, 47.386126667261124, '39392, Saudi Arabia', '2019-12-02 16:13:12'),
(304, 28.769942945225424, 47.386126667261124, '39392, Saudi Arabia', '2019-12-02 16:27:12'),
(305, 28.769942945225424, 47.386126667261124, '39392, Saudi Arabia', '2019-12-02 16:27:12'),
(306, 27.560534468701437, 44.95160322636366, '15794, Saudi Arabia', '2019-12-04 11:47:12'),
(307, 24.741769107473853, 46.778934225440025, '7261 Khalid Ibn Al Walid St, Al Andalus, Riyadh 13212 2446, Saudi Arabia', '2019-12-04 11:47:12'),
(308, 27.954389208428893, 30.9222811460495, 'Al Minya Desert, Menia Governorate, Egypt', '2019-12-04 11:51:12'),
(309, 28.010994731097945, 30.80124143511057, 'unknown address !', '2019-12-04 11:51:12'),
(310, 28.036019302631555, 30.708777979016304, 'Unnamed Road, Saft Al Khemar Al Asleyah, Minya, Menia Governorate, Egypt', '2019-12-04 12:38:12'),
(311, 28.036019302631555, 30.708777979016304, 'Unnamed Road, Saft Al Khemar Al Asleyah, Minya, Menia Governorate, Egypt', '2019-12-04 12:38:12'),
(312, 28.1210026, 30.743636, 'المنيا برج الماسة خلف برج 10 بابراج الري بحري موقف الاخصاص \" موقف سمالوط، Menia Governorate, Egypt', '2019-12-04 13:22:12'),
(313, 28.32909591477468, 30.681103952229023, 'Unnamed Road, Samalout, Menia Governorate, Egypt', '2019-12-04 13:48:12'),
(314, 28.560773982930687, 30.78823909163475, 'Unnamed Road, Saft Abu Gerg, Bani Mazar, Menia Governorate, Egypt', '2019-12-04 13:48:12'),
(315, 28.306443161670597, 30.691505894064903, 'Unnamed Road, Madinet Samalout, Samalout, Menia Governorate, Egypt', '2019-12-04 14:45:12'),
(316, 28.306443161670597, 30.691505894064903, 'Unnamed Road, Madinet Samalout, Samalout, Menia Governorate, Egypt', '2019-12-04 14:45:12'),
(317, 28.08636009034719, 30.75704600661993, 'برج المطاحن، Makousa, Qism Minya, Minya, Menia Governorate, Egypt', '2019-12-04 14:51:12'),
(318, 28.083458019480382, 30.757822170853615, 'Bani Sweif - Dayrout, Qism Minya, Minya, Menia Governorate, Egypt', '2019-12-04 14:51:12'),
(319, 28.12104013865867, 30.743734873831272, 'المنيا برج الماسة خلف برج 10 بابراج الري بحري موقف الاخصاص \" موقف سمالوط، Menia Governorate, Egypt', '2019-12-04 15:22:12'),
(320, 28.119294027347642, 30.74100572615862, 'مسجد، Qism Minya, Minya, Menia Governorate, Egypt', '2019-12-04 15:22:12'),
(321, 28.11782466964935, 30.745220482349396, 'Unnamed Road, قسم المنيا، مركز المنيا، المنيا، Egypt', '2019-12-04 15:52:12'),
(322, 28.153743789695824, 30.67285615950823, 'بني حسن الأشراف، إدمو، مركز المنيا، المنيا،، Egypt', '2019-12-04 15:52:12'),
(323, 28.12104013865867, 30.743734873831272, 'المنيا برج الماسة خلف برج 10 بابراج الري بحري موقف الاخصاص \" موقف سمالوط، Menia Governorate, Egypt', '2019-12-04 15:55:12'),
(324, 28.153743789695824, 30.67285615950823, 'بني حسن الأشراف، إدمو، مركز المنيا، المنيا،، Egypt', '2019-12-04 15:55:12'),
(325, 28.12104013865867, 30.743734873831272, 'المنيا برج الماسة خلف برج 10 بابراج الري بحري موقف الاخصاص \" موقف سمالوط، Menia Governorate, Egypt', '2019-12-04 16:10:12'),
(326, 28.153743789695824, 30.67285615950823, 'بني حسن الأشراف، إدمو، مركز المنيا، المنيا،، Egypt', '2019-12-04 16:10:12'),
(327, 27.64864167209569, 31.029840745031834, 'Al Minya Desert, Menia Governorate, Egypt', '2019-12-04 17:57:12'),
(328, 27.64864167209569, 31.029840745031834, 'Al Minya Desert, Menia Governorate, Egypt', '2019-12-04 17:57:12'),
(329, 28.15700163390997, 30.671833232045174, 'Unnamed Road, Bani Hasan Al Ashraf, Minya, Menia Governorate, Egypt', '2019-12-07 12:23:12'),
(330, 28.08878438785522, 30.75662422925234, 'Bani Sweif - Dayrout, Qism Minya, Minya, Menia Governorate, Egypt', '2019-12-07 12:23:12'),
(331, 28.15700163390997, 30.671833232045174, 'Unnamed Road, Bani Hasan Al Ashraf, Minya, Menia Governorate, Egypt', '2019-12-07 12:24:12'),
(332, 28.15700163390997, 30.671833232045174, 'Unnamed Road, Bani Hasan Al Ashraf, Minya, Menia Governorate, Egypt', '2019-12-07 12:24:12'),
(333, 28.61814709771102, 30.78133139759302, 'Abar Al Wakef - Maghagha, Maghaghah, Menia Governorate, Egypt', '2019-12-07 12:30:12'),
(334, 28.376016189586235, 30.82461353391409, 'Cairo - Aswan Eastern Desert Rd, Red Sea Governorate, Egypt', '2019-12-07 12:30:12'),
(335, 30.115965274824134, 30.77038463205099, 'Unnamed Road, Al Giza Desert, Giza Governorate, Egypt', '2019-12-07 15:07:12'),
(336, 30.115965274824134, 30.77038463205099, 'Unnamed Road, Al Giza Desert, Giza Governorate, Egypt', '2019-12-07 15:07:12'),
(337, 24.692890176976665, 46.67157579213381, '6583 التخصصي، Al Ulaya, Riyadh 12331 3802, Saudi Arabia', '2019-12-07 16:51:12'),
(338, 24.02249496701592, 47.388109154999256, 'Unnamed Road 16422, Saudi Arabia', '2019-12-07 16:51:12'),
(339, 24.692890176976665, 46.67157579213381, '6583 التخصصي، Al Ulaya, Riyadh 12331 3802, Saudi Arabia', '2019-12-07 16:58:12'),
(340, 24.692890176976665, 46.67157579213381, '6583 التخصصي، Al Ulaya, Riyadh 12331 3802, Saudi Arabia', '2019-12-07 16:58:12'),
(341, 24.692890176976665, 46.67157579213381, '6583 التخصصي، Al Ulaya, Riyadh 12331 3802, Saudi Arabia', '2019-12-07 17:01:12'),
(342, 24.692890176976665, 46.67157579213381, '6583 التخصصي، Al Ulaya, Riyadh 12331 3802, Saudi Arabia', '2019-12-07 17:01:12'),
(343, 24.692890176976665, 46.67157579213381, '6583 التخصصي، Al Ulaya, Riyadh 12331 3802, Saudi Arabia', '2019-12-07 17:04:12'),
(344, 24.692890176976665, 46.67157579213381, '6583 التخصصي، Al Ulaya, Riyadh 12331 3802, Saudi Arabia', '2019-12-07 17:04:12'),
(345, 24.692890176976665, 46.67157579213381, '6583 التخصصي، Al Ulaya, Riyadh 12331 3802, Saudi Arabia', '2019-12-07 17:08:12'),
(346, 24.692890176976665, 46.67157579213381, '6583 التخصصي، Al Ulaya, Riyadh 12331 3802, Saudi Arabia', '2019-12-07 17:08:12'),
(347, 28.345779048019015, 30.896466560661793, 'Al Minya Desert, Menia Governorate, Egypt', '2019-12-07 17:44:12'),
(348, 28.95346634225348, 31.200528144836426, 'New Bani Suef City, New Bani Suef, Beni Suef Governorate, Egypt', '2019-12-07 17:44:12'),
(349, 26.322915422785908, 46.92684531211853, '15679, Saudi Arabia', '2019-12-07 18:46:12'),
(350, 24.774108162080072, 46.70984588563442, '7444 Uthman Ibn Affan Branch Rd, At Taawun, Riyadh 12476 4333, Saudi Arabia', '2019-12-07 18:46:12'),
(351, 30.17542883959427, 31.232983209192753, 'Teraat Gesr Al Bahr, Madinet Qelyoub, Qalyub, Al Qalyubia Governorate, Egypt', '2019-12-07 18:52:12'),
(352, 29.328608145137743, 30.839673466980457, 'Al Tarlawi, Qesm Al Fayoum, Faiyum, Faiyum Governorate, Egypt', '2019-12-07 18:52:12'),
(353, 28.33327358366617, 30.706894733011723, 'Unnamed Road, Madinet Samalout, Samalout, Menia Governorate, Egypt', '2019-12-07 19:01:12'),
(354, 28.079545675459887, 30.763806849718094, 'Al Magari, Qism Minya, Minya, Menia Governorate, Egypt', '2019-12-07 19:01:12'),
(355, 28.33327358366617, 30.706894733011723, 'Unnamed Road, Madinet Samalout, Samalout, Menia Governorate, Egypt', '2019-12-07 19:07:12'),
(356, 28.33327358366617, 30.706894733011723, 'Unnamed Road, Madinet Samalout, Samalout, Menia Governorate, Egypt', '2019-12-07 19:07:12'),
(357, 28.33327358366617, 30.706894733011723, 'Unnamed Road, Madinet Samalout, Samalout, Menia Governorate, Egypt', '2019-12-07 19:13:12'),
(358, 28.33327358366617, 30.706894733011723, 'Unnamed Road, Madinet Samalout, Samalout, Menia Governorate, Egypt', '2019-12-07 19:13:12'),
(359, 28.33327358366617, 30.706894733011723, 'Unnamed Road, Madinet Samalout, Samalout, Menia Governorate, Egypt', '2019-12-07 19:23:12'),
(360, 28.33327358366617, 30.706894733011723, 'Unnamed Road, Madinet Samalout, Samalout, Menia Governorate, Egypt', '2019-12-07 19:23:12'),
(361, 28.33327358366617, 30.706894733011723, 'Unnamed Road, Madinet Samalout, Samalout, Menia Governorate, Egypt', '2019-12-07 19:28:12'),
(362, 28.33327358366617, 30.706894733011723, 'Unnamed Road, Madinet Samalout, Samalout, Menia Governorate, Egypt', '2019-12-07 19:28:12'),
(363, 28.33327358366617, 30.706894733011723, 'Unnamed Road, Madinet Samalout, Samalout, Menia Governorate, Egypt', '2019-12-07 19:43:12'),
(364, 28.33327358366617, 30.706894733011723, 'Unnamed Road, Madinet Samalout, Samalout, Menia Governorate, Egypt', '2019-12-07 19:43:12'),
(365, 28.33327358366617, 30.706894733011723, 'Unnamed Road, Madinet Samalout, Samalout, Menia Governorate, Egypt', '2019-12-07 19:47:12'),
(366, 28.33327358366617, 30.706894733011723, 'Unnamed Road, Madinet Samalout, Samalout, Menia Governorate, Egypt', '2019-12-07 19:47:12'),
(367, 28.33327358366617, 30.706894733011723, 'Unnamed Road, Madinet Samalout, Samalout, Menia Governorate, Egypt', '2019-12-07 19:55:12'),
(368, 28.33327358366617, 30.706894733011723, 'Unnamed Road, Madinet Samalout, Samalout, Menia Governorate, Egypt', '2019-12-07 19:55:12'),
(369, 28.544030187875986, 30.839222855865955, 'Unnamed Road, An Nasereyah (Al Garabia Previous), Bani Mazar, Menia Governorate, Egypt', '2019-12-08 12:13:12'),
(370, 28.409945152419635, 30.779069624841213, 'Unnamed Road, Madinet Matay, Matay, Menia Governorate, Egypt', '2019-12-08 12:13:12'),
(371, 28.544030187875986, 30.839222855865955, 'Unnamed Road, An Nasereyah (Al Garabia Previous), Bani Mazar, Menia Governorate, Egypt', '2019-12-08 12:16:12'),
(372, 28.409945152419635, 30.779069624841213, 'Unnamed Road, Madinet Matay, Matay, Menia Governorate, Egypt', '2019-12-08 12:16:12'),
(373, 26.04380111910546, 45.442143715918064, '15379, Saudi Arabia', '2019-12-08 14:02:12'),
(374, 3.072230319904707, 24.72527727484703, 'Bas-Uele, Democratic Republic of the Congo', '2019-12-08 14:02:12'),
(375, 27.732627221304913, 45.275535620749, '39752, Saudi Arabia', '2019-12-08 14:25:12'),
(376, 7.268687643783139, 30.003965198993683, 'Rumbek, South Sudan', '2019-12-08 14:25:12'),
(377, 27.732627221304913, 45.275535620749, '39752, Saudi Arabia', '2019-12-08 14:27:12'),
(378, 27.732627221304913, 45.275535620749, '39752, Saudi Arabia', '2019-12-08 14:27:12'),
(379, 27.732627221304913, 45.275535620749, '39752, Saudi Arabia', '2019-12-08 14:30:12'),
(380, 27.732627221304913, 45.275535620749, '39752, Saudi Arabia', '2019-12-08 14:30:12'),
(381, 27.732627221304913, 45.275535620749, '39752, Saudi Arabia', '2019-12-08 15:13:12'),
(382, 27.732627221304913, 45.275535620749, '39752, Saudi Arabia', '2019-12-08 15:13:12'),
(383, 27.92586616804922, 32.113869935274124, 'Al Minya Desert, Menia Governorate, Egypt', '2019-12-08 16:07:12'),
(384, 27.677232516622997, 30.77528603374958, 'Betemda - Om Qomsan, Tandah, Melawi, Menia Governorate, Egypt', '2019-12-08 16:07:12'),
(385, 27.92586616804922, 32.113869935274124, 'Al Minya Desert, Menia Governorate, Egypt', '2019-12-08 16:09:12'),
(386, 27.92586616804922, 32.113869935274124, 'Al Minya Desert, Menia Governorate, Egypt', '2019-12-08 16:09:12'),
(387, 27.92586616804922, 32.113869935274124, 'Al Minya Desert, Menia Governorate, Egypt', '2019-12-08 16:12:12'),
(388, 27.92586616804922, 32.113869935274124, 'Al Minya Desert, Menia Governorate, Egypt', '2019-12-08 16:12:12'),
(389, 27.92586616804922, 32.113869935274124, 'Al Minya Desert, Menia Governorate, Egypt', '2019-12-08 16:25:12'),
(390, 27.92586616804922, 32.113869935274124, 'Al Minya Desert, Menia Governorate, Egypt', '2019-12-08 16:25:12'),
(391, 28.47524774142907, 30.65751191228628, 'Unnamed Road, Abgag Al Hatab, Matay, Menia Governorate, Egypt', '2019-12-08 16:30:12'),
(392, 28.306485077955106, 30.68782389163971, 'Unnamed Road, Madinet Samalout, Samalout, Menia Governorate, Egypt', '2019-12-08 16:30:12'),
(393, 28.11967666619669, 30.736049003899097, 'عزبة شلبي صاروفيم، قسم المنيا، المنيا،، Qism Minya, Minya, Menia Governorate, Egypt', '2019-12-08 16:55:12'),
(394, 28.10668392358603, 30.745490714907646, 'طريق داخل كلية الهندسة، Qism Minya, Minya, Menia Governorate, Egypt', '2019-12-08 16:55:12'),
(395, 28.11967666619669, 30.736049003899097, 'عزبة شلبي صاروفيم، قسم المنيا، المنيا،، Qism Minya, Minya, Menia Governorate, Egypt', '2019-12-08 17:13:12'),
(396, 28.11967666619669, 30.736049003899097, 'عزبة شلبي صاروفيم، قسم المنيا، المنيا،، Qism Minya, Minya, Menia Governorate, Egypt', '2019-12-08 17:13:12'),
(397, 28.12103511179141, 30.743682235479355, 'المنيا برج الماسة خلف برج 10 بابراج الري بحري موقف الاخصاص \" موقف سمالوط، Damaris, Minya, Menia Governorate, Egypt', '2019-12-08 17:21:12'),
(398, 28.117140401615558, 30.74415061622858, 'Kobri Al Ehsasi, Qism Minya, Al Minya, Menia Governorate, Egypt', '2019-12-08 17:21:12'),
(399, 28.117140401615558, 30.74415061622858, 'Kobri Al Ehsasi, Qism Minya, Al Minya, Menia Governorate, Egypt', '2019-12-08 17:44:12'),
(400, 28.10668392358603, 30.745490714907646, 'طريق داخل كلية الهندسة، Qism Minya, Minya, Menia Governorate, Egypt', '2019-12-08 17:44:12'),
(401, 28.117140401615558, 30.74415061622858, 'Kobri Al Ehsasi, Qism Minya, Al Minya, Menia Governorate, Egypt', '2019-12-08 17:59:12'),
(402, 28.11967666619669, 30.736049003899097, 'عزبة شلبي صاروفيم، قسم المنيا، المنيا،، Qism Minya, Minya, Menia Governorate, Egypt', '2019-12-08 17:59:12'),
(403, 28.125212652897403, 30.732692554593086, 'طريق لكلية حاسبات ومعلومات، Damaris, Minya, Menia Governorate, Egypt', '2019-12-08 18:26:12'),
(404, 28.10124487450569, 30.745215117931366, 'Unnamed Road, Qism Minya, Minya, Menia Governorate, Egypt', '2019-12-08 18:26:12'),
(405, 28.08863767740997, 30.753118246793747, 'Tala, Qism Minya, Minya, Menia Governorate, Egypt', '2019-12-09 11:50:12'),
(406, 28.03609446939393, 30.78893445432186, 'Unnamed Road, Minya, Menia Governorate, Egypt', '2019-12-09 11:50:12'),
(407, 28.08863767740997, 30.753118246793747, 'Tala, Qism Minya, Minya, Menia Governorate, Egypt', '2019-12-09 11:59:12'),
(408, 28.08863767740997, 30.753118246793747, 'Tala, Qism Minya, Minya, Menia Governorate, Egypt', '2019-12-09 11:59:12'),
(409, 28.08863767740997, 30.753118246793747, 'Tala, Qism Minya, Minya, Menia Governorate, Egypt', '2019-12-09 12:05:12'),
(410, 28.514358966324025, 30.760081931948662, 'Unnamed Road, Bani Mazar, Menia Governorate, Egypt', '2019-12-09 12:05:12'),
(411, 28.120798848763567, 30.7408944144845, 'Bani Sweif - Dayrout, Damaris, Minya, Menia Governorate, Egypt', '2019-12-09 12:30:12'),
(412, 28.11803964837649, 30.74671983718872, 'Unnamed Road, قسم المنيا، مركز المنيا، المنيا، Egypt', '2019-12-09 12:30:12'),
(413, 28.34687761006948, 30.706111527979374, 'Unnamed Road, Dafsh, Samalout, Menia Governorate, Egypt', '2019-12-09 12:51:12'),
(414, 28.15764455942232, 30.752079896628857, 'Unnamed Road, Minya, Menia Governorate, Egypt', '2019-12-09 12:51:12'),
(415, 28.34687761006948, 30.706111527979374, 'Unnamed Road, Dafsh, Samalout, Menia Governorate, Egypt', '2019-12-09 13:02:12'),
(416, 28.34687761006948, 30.706111527979374, 'Unnamed Road, Dafsh, Samalout, Menia Governorate, Egypt', '2019-12-09 13:02:12'),
(417, 28.4991667, 30.3305511, 'behind the station', '2019-12-09 13:28:12'),
(418, 30.026059, 31.256337, 'behind the station', '2019-12-09 13:28:12'),
(419, 28.4991667, 30.3305511, 'behind the station', '2019-12-09 14:04:12'),
(420, 30.026059, 31.256337, 'behind the station', '2019-12-09 14:04:12'),
(421, 28.4991667, 30.3305511, 'behind the station', '2019-12-09 14:06:12'),
(422, 30.026059, 31.256337, 'behind the station', '2019-12-09 14:06:12'),
(423, 28.34687761006948, 30.706111527979374, 'Unnamed Road, Dafsh, Samalout, Menia Governorate, Egypt', '2019-12-09 14:16:12'),
(424, 28.34687761006948, 30.706111527979374, 'Unnamed Road, Dafsh, Samalout, Menia Governorate, Egypt', '2019-12-09 14:16:12'),
(425, 28.4991667, 30.3305511, 'behind the station', '2019-12-09 15:53:12'),
(426, 30.026059, 31.256337, 'behind the station', '2019-12-09 15:53:12'),
(427, 28.1205404077589, 30.731834582984447, 'طريق لكلية حاسبات ومعلومات، Damaris, Minya, Menia Governorate, Egypt', '2019-12-09 15:56:12'),
(428, 28.131741804625342, 30.767723880708218, 'Unnamed Road, Nazlet Hussein Ali, Minya, Menia Governorate, Egypt', '2019-12-09 15:56:12'),
(429, 28.4991667, 30.3305511, 'behind the station', '2019-12-09 15:58:12'),
(430, 30.026059, 31.256337, 'behind the station', '2019-12-09 15:58:12'),
(431, 28.4991667, 30.3305511, 'behind the station', '2019-12-09 15:59:12'),
(432, 30.026059, 31.256337, 'behind the station', '2019-12-09 15:59:12'),
(433, 28.4991667, 30.3305511, 'behind the station', '2019-12-09 16:01:12'),
(434, 30.026059, 31.256337, 'behind the station', '2019-12-09 16:01:12'),
(435, 28.4991667, 30.3305511, 'behind the station', '2019-12-09 16:04:12'),
(436, 30.026059, 31.256337, 'behind the station', '2019-12-09 16:04:12'),
(437, 28.1205404077589, 30.731834582984447, 'طريق لكلية حاسبات ومعلومات، Damaris, Minya, Menia Governorate, Egypt', '2019-12-09 16:05:12'),
(438, 28.1205404077589, 30.731834582984447, 'طريق لكلية حاسبات ومعلومات، Damaris, Minya, Menia Governorate, Egypt', '2019-12-09 16:05:12'),
(439, 28.4991667, 30.3305511, 'behind the station', '2019-12-09 16:08:12'),
(440, 30.026059, 31.256337, 'behind the station', '2019-12-09 16:08:12'),
(441, 28.4991667, 30.3305511, 'behind the station', '2019-12-09 16:08:12'),
(442, 30.026059, 31.256337, 'behind the station', '2019-12-09 16:08:12'),
(443, 28.4991667, 30.3305511, 'behind the station', '2019-12-09 16:11:12'),
(444, 30.026059, 31.256337, 'behind the station', '2019-12-09 16:11:12'),
(445, 28.4991667, 30.3305511, 'behind the station', '2019-12-09 16:12:12'),
(446, 30.026059, 31.256337, 'behind the station', '2019-12-09 16:12:12'),
(447, 28.1205404077589, 30.731834582984447, 'طريق لكلية حاسبات ومعلومات، Damaris, Minya, Menia Governorate, Egypt', '2019-12-09 16:13:12'),
(448, 28.109286383379057, 30.733263194561005, 'Unnamed Road, قسم المنيا، المنيا،، Qism Minya, Al Minya, Menia Governorate, Egypt', '2019-12-09 16:13:12'),
(449, 28.082639533168276, 30.753815285861492, 'Saif Abd El-Azeem, Qism Minya, Minya, Menia Governorate, Egypt', '2019-12-09 16:39:12'),
(450, 28.080506765765815, 30.76630298048258, 'Abd El-Nabi, Qism Minya, Minya, Menia Governorate, Egypt', '2019-12-09 16:39:12'),
(451, 28.125015725468153, 30.728287361562252, 'مبنى ادارى تابع لكلية دار علوم _جامعة المنيا، Damaris, Minya, Menia Governorate, Egypt', '2019-12-09 17:13:12'),
(452, 28.109872815317722, 30.7402503490448, 'Unnamed Road, Qism Minya, Minya, Menia Governorate, Egypt', '2019-12-09 17:13:12'),
(453, 28.337732907564234, 30.69390546530485, 'Unnamed Road, Ibrahim, Samalout, Menia Governorate, Egypt', '2019-12-09 17:22:12'),
(454, 28.337732907564234, 30.69390546530485, 'Unnamed Road, Ibrahim, Samalout, Menia Governorate, Egypt', '2019-12-09 17:22:12');
INSERT INTO `locations` (`id`, `latitude`, `longitude`, `address`, `created_at`) VALUES
(455, 28.12404823290325, 30.724229849874973, 'El-Gomhoreya, Damaris, Minya, Menia Governorate, Egypt', '2019-12-09 17:38:12'),
(456, 28.111409411483763, 30.73600374162197, 'Unnamed Road, Qism Minya, Minya, Menia Governorate, Egypt', '2019-12-09 17:38:12'),
(457, 28.121340271777697, 30.725238360464573, 'Unnamed Road, Damaris, Minya, Menia Governorate, Egypt', '2019-12-09 17:56:12'),
(458, 28.072698582562474, 30.732414945960045, 'Unnamed Road, Telah, Minya, Menia Governorate, Egypt', '2019-12-09 17:56:12'),
(459, 28.11965744557609, 30.74222881346941, 'Unnamed Road, قسم المنيا، مركز المنيا، المنيا، Egypt', '2019-12-09 18:21:12'),
(460, 28.116521481262186, 30.72592332959175, 'Unnamed Road, Qism Minya, Minya, Menia Governorate, Egypt', '2019-12-09 18:21:12'),
(461, 28.127217980382998, 30.738153532147408, 'طريق لكلية حاسبات ومعلومات، Damaris, Minya, Menia Governorate, Egypt', '2019-12-09 18:48:12'),
(462, 28.120020566871847, 30.7342391833663, 'Unnamed Road, Damaris, Minya, Menia Governorate, Egypt', '2019-12-09 18:48:12'),
(463, 28.12025210041101, 30.74816856533289, 'Damaries, Qism Minya, Minya, Menia Governorate, Egypt', '2019-12-09 20:07:12'),
(464, 28.11715932697857, 30.741589106619358, 'ش الكوثر وسط البلد، Qism Minya, Minya, Menia Governorate, Egypt', '2019-12-09 20:07:12'),
(465, 28.12025210041101, 30.74816856533289, 'Damaries, Qism Minya, Minya, Menia Governorate, Egypt', '2019-12-09 20:23:12'),
(466, 28.12085739709684, 30.732149742543697, 'Unnamed Road, Damaris, Minya, Menia Governorate, Egypt', '2019-12-09 20:23:12'),
(467, 28.117825261063242, 30.746311470866203, 'Unnamed Road, قسم المنيا، مركز المنيا، المنيا، Egypt', '2019-12-10 13:38:12'),
(468, 28.125462803434527, 30.739184841513634, 'طريق لكلية حاسبات ومعلومات، Damaris, Minya, Menia Governorate, Egypt', '2019-12-10 13:38:12'),
(469, 28.1490999857498, 30.735162869095802, 'Unnamed Road, Damaris, Minya, Menia Governorate, Egypt', '2019-12-10 15:29:12'),
(470, 28.124177449255313, 30.738998092710972, 'Unnamed Road, Damaris, Minya, Menia Governorate, Egypt', '2019-12-10 15:29:12'),
(471, 28.1490999857498, 30.735162869095802, 'Unnamed Road, Damaris, Minya, Menia Governorate, Egypt', '2019-12-10 15:35:12'),
(472, 28.124177449255313, 30.738998092710972, 'Unnamed Road, Damaris, Minya, Menia Governorate, Egypt', '2019-12-10 15:35:12'),
(473, 28.1490999857498, 30.735162869095802, 'Unnamed Road, Damaris, Minya, Menia Governorate, Egypt', '2019-12-10 17:29:12'),
(474, 28.124177449255313, 30.738998092710972, 'Unnamed Road, Damaris, Minya, Menia Governorate, Egypt', '2019-12-10 17:29:12'),
(475, 28.1490999857498, 30.735162869095802, 'Unnamed Road, Damaris, Minya, Menia Governorate, Egypt', '2019-12-10 18:04:12'),
(476, 28.124177449255313, 30.738998092710972, 'Unnamed Road, Damaris, Minya, Menia Governorate, Egypt', '2019-12-10 18:04:12'),
(477, 28.1490999857498, 30.735162869095802, 'Unnamed Road, Damaris, Minya, Menia Governorate, Egypt', '2019-12-10 18:09:12'),
(478, 28.124177449255313, 30.738998092710972, 'Unnamed Road, Damaris, Minya, Menia Governorate, Egypt', '2019-12-10 18:09:12'),
(479, 28.118753481113234, 30.73101583868265, 'Unnamed Road, المنيا،، Qism Minya, Minya, Menia Governorate, Egypt', '2019-12-10 18:28:12'),
(480, 28.10363512078147, 30.741569325327873, 'Unnamed Road, Qism Minya, Minya, Menia Governorate, Egypt', '2019-12-10 18:28:12'),
(481, 28.12124150885397, 30.742044746875763, 'Bani Sweif - Dayrout, Damaris, Minya, Menia Governorate, Egypt', '2019-12-10 19:22:12'),
(482, 28.119550401441504, 30.742398463189602, 'Bani Sweif - Dayrout, Qism Minya, Minya, Menia Governorate, Egypt', '2019-12-10 19:22:12'),
(483, 27.64830666581778, 30.604925863444805, 'Al Minya Desert, Menia Governorate, Egypt', '2019-12-10 23:45:12'),
(484, 27.651904662725418, 30.638507790863514, 'Unnamed Road, Al Minya Desert, Menia Governorate, Egypt', '2019-12-10 23:45:12'),
(485, 27.64830666581778, 30.604925863444805, 'Al Minya Desert, Menia Governorate, Egypt', '2019-12-11 01:01:12'),
(486, 27.651904662725418, 30.638507790863514, 'Unnamed Road, Al Minya Desert, Menia Governorate, Egypt', '2019-12-11 01:01:12'),
(487, 27.64830666581778, 30.604925863444805, 'Al Minya Desert, Menia Governorate, Egypt', '2019-12-11 01:17:12'),
(488, 27.651904662725418, 30.638507790863514, 'Unnamed Road, Al Minya Desert, Menia Governorate, Egypt', '2019-12-11 01:17:12'),
(489, 27.64830666581778, 30.604925863444805, 'Al Minya Desert, Menia Governorate, Egypt', '2019-12-11 01:28:12'),
(490, 27.651904662725418, 30.638507790863514, 'Unnamed Road, Al Minya Desert, Menia Governorate, Egypt', '2019-12-11 01:28:12'),
(491, 28.114944, 30.7462144, 'Damaris, Minya, Menia Governorate', '2019-12-11 14:30:12'),
(492, 30.232770621604974, 31.345596089959145, 'Unnamed Road, Al Khankah, Al Qalyubia Governorate, Egypt', '2019-12-11 14:30:12'),
(493, 30.073490589641448, 31.374766118824482, 'Al Gawya, Nasr City, Cairo Governorate, Egypt', '2019-12-11 15:01:12'),
(494, 30.036891647984515, 31.384421065449715, 'Unnamed Road, Al Hay Al Asher, Nasr City, Cairo Governorate, Egypt', '2019-12-11 15:01:12'),
(495, 28.120286105933378, 30.743275210261345, 'unknown address !', '2019-12-11 15:06:12'),
(496, 28.16722265762226, 30.72510626167059, 'Bani Sweif - Dayrout, Minya, Menia Governorate, Egypt', '2019-12-11 15:06:12'),
(497, 28.4991667, 30.3305511, 'behind the station', '2019-12-11 15:18:12'),
(498, 30.026059, 31.256337, 'behind the station', '2019-12-11 15:18:12'),
(499, 28.957080903566695, 31.1338222771883, 'New Bani Suef City, New Bani Suef, Beni Suef Governorate, Egypt', '2019-12-11 16:07:12'),
(500, 27.87520114004555, 30.816517621278763, 'Unnamed Road, Nazlet as Sarou, Abu Qurqas, Menia Governorate, Egypt', '2019-12-11 16:07:12'),
(501, 27.87520114004555, 30.816517621278763, 'Unnamed Road, Nazlet as Sarou, Abu Qurqas, Menia Governorate, Egypt', '2019-12-11 16:10:12'),
(502, 27.33168642233431, 31.36627558618784, 'Asyut Desert, Assiut Governorate, Egypt', '2019-12-11 16:10:12'),
(503, 28.08736371356196, 30.76158531010151, 'الحوميت، قسم المنيا،، Qism Minya, Al Minya, Menia Governorate, Egypt', '2019-12-11 16:18:12'),
(504, 28.083090337387706, 30.758063904941082, 'Bani Sweif - Dayrout, Qism Minya, Minya, Menia Governorate, Egypt', '2019-12-11 16:18:12'),
(505, 24.801904649990856, 46.6318117082119, '6881 وادي الرشاء، الصحافة، الرياض 13321 2963، السعودية', '2019-12-18 16:15:12'),
(506, 24.6006978, 46.6975899, 'القصر مول، السويدي العام، الرياض السعودية', '2019-12-18 16:15:12'),
(507, 28.1204748, 30.7427332, 'Bani Sweif - Dayrout, Minya, Menia Governorate, Egypt', '2019-12-23 20:23:12'),
(508, 28.3724351, 30.6640358, 'Unnamed Road, أسطال، سمالوط، المنيا،، Astal, Samalout, Menia Governorate, Egypt', '2019-12-23 21:17:12'),
(509, 25.385461815514105, 46.2836978584528, '15466، السعودية', '2019-12-24 16:23:12'),
(510, 22.45214955669376, 48.85812968015671, '38819، السعودية', '2019-12-24 16:23:12'),
(511, 26.186011110270393, 43.35294529795647, '54668، السعودية', '2019-12-24 16:37:12'),
(512, 25.475286716588794, 44.34779942035675, '17677، السعودية', '2019-12-24 16:37:12'),
(513, 25.332801216170633, 45.96143748611212, 'Unnamed Road 15253, Saudi Arabia', '2019-12-24 16:47:12'),
(514, 25.525255952544683, 46.96712505072355, '15845, Saudi Arabia', '2019-12-24 16:47:12'),
(515, 25.332801216170633, 45.96143748611212, 'Unnamed Road 15253, Saudi Arabia', '2019-12-24 16:50:12'),
(516, 25.332801216170633, 45.96143748611212, 'Unnamed Road 15253, Saudi Arabia', '2019-12-24 16:50:12'),
(517, 25.525255952544683, 46.96712505072355, '15845, Saudi Arabia', '2019-12-24 17:52:12'),
(518, 25.525255952544683, 46.96712505072355, '15845, Saudi Arabia', '2019-12-24 17:52:12'),
(519, 24.874792412092837, 46.23115003108978, '13974, Saudi Arabia', '2020-02-09 11:21:02'),
(520, 25.390781587902183, 48.01153767853975, '33739, Saudi Arabia', '2020-02-09 11:21:02'),
(521, 25.731055067320284, 46.410396695137024, '15279, Saudi Arabia', '2020-02-09 21:08:02'),
(522, 25.80519074355502, 45.276550836861134, '15332, Saudi Arabia', '2020-02-09 21:08:02'),
(523, 28.1209468, 30.7437408, 'Bani Sweif - Dayrout, Damaris, Minya, Menia Governorate, Egypt', '2020-06-28 20:35:06'),
(524, 28.1209484, 30.7437365, 'Bani Sweif - Dayrout, Damaris, Minya, Menia Governorate, Egypt', '2020-06-28 21:15:06'),
(525, 28.1209459, 30.7437387, 'Bani Sweif - Dayrout, Damaris, Minya, Menia Governorate, Egypt', '2020-06-28 21:46:06'),
(526, 28.1209485, 30.7438296, 'Bani Sweif - Dayrout, Damaris, Minya, Menia Governorate, Egypt', '2020-06-28 22:16:06'),
(527, 29.54564654, 30.54564654, 'test', '2021-02-22 20:23:02'),
(528, 29.54564654, 30.54564654, 'test', '2021-02-22 20:23:02'),
(529, 29.54564654, 30.54564654, 'test', '2021-02-22 20:34:02'),
(530, 29.54564654, 30.54564654, 'test', '2021-02-22 20:34:02'),
(531, 29.54564654, 30.54564654, 'test', '2021-02-22 20:35:02'),
(532, 29.54564654, 30.54564654, 'test', '2021-02-22 20:35:02');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `content_ar` varchar(100) NOT NULL,
  `content_en` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL,
  `orders_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `content_ar`, `content_en`, `created_at`, `orders_id`) VALUES
(76, 'تم اضافة كود خصم جديد', 'New discount code has been added', '2019-08-26 14:28:08', NULL),
(80, 'يوجد خصومات جديدة ', 'there is new discounts', '2019-08-27 11:53:08', NULL),
(84, 'يوجد خصومات جديدة ', 'there is new discounts', '2019-08-27 11:57:08', NULL),
(139, 'تم الموافقة علي طلبك بواسطة السائق', ' your order has been accepted by drivers ', '2019-09-04 15:20:09', 50),
(140, 'تم تأكيد طلبك الي الموقع المحدد', 'your order has been informed in your location ', '2019-09-04 15:21:09', 50),
(141, 'بدء عملية تحميل البضائع', 'start goods loading process', '2019-09-04 15:37:09', 50),
(142, 'طلبك يبدأ بالتحرك', 'your order is start moving ', '2019-09-04 15:37:09', 50),
(143, 'تم توصيل طلبك بنجاح في الموقع المحدد', 'your order is arrived in you location  ', '2019-09-04 15:38:09', 50),
(144, '  قام السائق بإنهاء الطلب ', 'the order has been finished by driver ', '2019-09-04 15:38:09', 50),
(145, 'تم الموافقة علي طلبك بواسطة السائق', ' your order has been accepted by drivers ', '2019-09-04 15:40:09', 50),
(146, 'تم تأكيد طلبك الي الموقع المحدد', 'your order has been informed in your location ', '2019-09-04 15:41:09', 50),
(147, 'بدء عملية تحميل البضائع', 'start goods loading process', '2019-09-04 15:45:09', 50),
(148, 'طلبك يبدأ بالتحرك', 'your order is start moving ', '2019-09-04 15:48:09', 50),
(149, 'تم توصيل طلبك بنجاح في الموقع المحدد', 'your order is arrived in you location  ', '2019-09-04 15:49:09', 50),
(150, '  قام السائق بإنهاء الطلب ', 'the order has been finished by driver ', '2019-09-04 15:51:09', 50),
(151, 'تم تأكيد طلبك الي الموقع المحدد', 'your order has been informed in your location ', '2019-09-04 15:53:09', 50),
(152, 'بدء عملية تحميل البضائع', 'start goods loading process', '2019-09-04 15:56:09', 50),
(153, 'طلبك يبدأ بالتحرك', 'your order is start moving ', '2019-09-04 15:56:09', 50),
(154, 'تم توصيل طلبك بنجاح في الموقع المحدد', 'your order is arrived in you location  ', '2019-09-04 15:58:09', 50),
(155, '  قام السائق بإنهاء الطلب ', 'the order has been finished by driver ', '2019-09-04 16:01:09', 50),
(156, '  قام المستخدم بإنهاء الطلب ', 'the order has been finished by user ', '2019-09-04 16:03:09', 50),
(157, '  قام المستخدم بإنهاء الطلب ', 'the order has been finished by user ', '2019-09-04 16:13:09', 50),
(158, '  قام المستخدم بإنهاء الطلب ', 'the order has been finished by user ', '2019-09-04 16:15:09', 50),
(159, '  قام المستخدم بإنهاء الطلب ', 'the order has been finished by user ', '2019-09-04 16:18:09', 50),
(160, '  قام المستخدم بإنهاء الطلب ', 'the order has been finished by user ', '2019-09-04 16:29:09', 50),
(161, '  قام المستخدم بإنهاء الطلب ', 'the order has been finished by user ', '2019-09-04 16:32:09', 50),
(162, 'تم الانهاء بنجاح ', 'done successfully ', '2019-09-04 16:32:09', 50),
(163, 'تم تقييم طلبك ', 'your order has been rated ', '2019-09-04 16:32:09', 50),
(164, 'تم تقييم طلبك ', 'your order has been rated ', '2019-09-04 16:32:09', 50),
(165, 'تم الموافقة علي طلبك بواسطة السائق', ' your order has been accepted by drivers ', '2019-09-04 16:42:09', 52),
(166, 'تم الموافقة علي طلبك بواسطة السائق', ' your order has been accepted by drivers ', '2019-09-04 16:45:09', 52),
(167, 'تم الموافقة علي طلبك بواسطة السائق', ' your order has been accepted by drivers ', '2019-09-04 16:49:09', 52),
(168, 'تم الموافقة علي طلبك بواسطة السائق', ' your order has been accepted by drivers ', '2019-09-04 16:56:09', 52),
(169, 'تم الموافقة علي طلبك بواسطة السائق', ' your order has been accepted by drivers ', '2019-09-04 16:59:09', 52),
(170, 'تم تأكيد طلبك الي الموقع المحدد', 'your order has been informed in your location ', '2019-09-04 17:06:09', 52),
(171, 'تم الموافقة علي طلبك بواسطة السائق', ' your order has been accepted by drivers ', '2019-09-04 17:08:09', 52),
(172, 'تم تأكيد طلبك الي الموقع المحدد', 'your order has been informed in your location ', '2019-09-04 17:09:09', 52),
(173, 'بدء عملية تحميل البضائع', 'start goods loading process', '2019-09-04 17:09:09', 52),
(174, 'طلبك يبدأ بالتحرك', 'your order is start moving ', '2019-09-04 17:10:09', 52),
(175, 'تم توصيل طلبك بنجاح في الموقع المحدد', 'your order is arrived in you location  ', '2019-09-04 17:11:09', 52),
(176, '  قام السائق بإنهاء الطلب ', 'the order has been finished by driver ', '2019-09-04 17:11:09', 52),
(177, '  قام السائق بإنهاء الطلب ', 'the order has been finished by driver ', '2019-09-04 17:12:09', 52),
(178, '  قام السائق بإنهاء الطلب ', 'the order has been finished by driver ', '2019-09-04 17:13:09', 52),
(179, '  قام السائق بإنهاء الطلب ', 'the order has been finished by driver ', '2019-09-04 17:15:09', 52),
(180, '  قام المستخدم بإنهاء الطلب ', 'the order has been finished by user ', '2019-09-04 17:16:09', 52),
(181, 'تم الانهاء بنجاح ', 'done successfully ', '2019-09-04 17:16:09', 52),
(182, 'تم تقييم طلبك ', 'your order has been rated ', '2019-09-04 17:16:09', 52),
(183, 'تم تقييم طلبك ', 'your order has been rated ', '2019-09-04 17:17:09', 52),
(228, 'تم الموافقة علي طلبك بواسطة السائق', ' your order has been accepted by drivers ', '2019-09-08 14:59:09', 56),
(229, 'تم تأكيد طلبك الي الموقع المحدد', 'your order has been informed in your location ', '2019-09-08 14:59:09', 56),
(230, 'بدء عملية تحميل البضائع', 'start goods loading process', '2019-09-08 15:00:09', 56),
(231, 'طلبك يبدأ بالتحرك', 'your order is start moving ', '2019-09-08 15:00:09', 56),
(232, 'تم توصيل طلبك بنجاح في الموقع المحدد', 'your order is arrived in you location  ', '2019-09-08 15:00:09', 56),
(233, '  قام السائق بإنهاء الطلب ', 'the order has been finished by driver ', '2019-09-08 15:00:09', 56),
(234, '  قام السائق بإنهاء الطلب ', 'the order has been finished by driver ', '2019-09-08 15:03:09', 56),
(235, '  قام المستخدم بإنهاء الطلب ', 'the order has been finished by user ', '2019-09-08 15:03:09', 56),
(236, 'تم الانهاء بنجاح ', 'done successfully ', '2019-09-08 15:04:09', 56),
(237, 'تم تقييم طلبك ', 'your order has been rated ', '2019-09-08 15:04:09', 56),
(238, 'تم تقييم طلبك ', 'your order has been rated ', '2019-09-08 15:04:09', 56),
(239, 'تم الموافقة علي طلبك بواسطة السائق', ' your order has been accepted by drivers ', '2019-09-08 15:12:09', 57),
(240, 'تم تأكيد طلبك الي الموقع المحدد', 'your order has been informed in your location ', '2019-09-08 15:13:09', 57),
(241, 'بدء عملية تحميل البضائع', 'start goods loading process', '2019-09-08 15:14:09', 57),
(242, 'طلبك يبدأ بالتحرك', 'your order is start moving ', '2019-09-08 15:14:09', 57),
(243, 'تم توصيل طلبك بنجاح في الموقع المحدد', 'your order is arrived in you location  ', '2019-09-08 15:15:09', 57),
(244, '  قام السائق بإنهاء الطلب ', 'the order has been finished by driver ', '2019-09-08 15:15:09', 57),
(245, '  قام المستخدم بإنهاء الطلب ', 'the order has been finished by user ', '2019-09-08 15:16:09', 57),
(246, 'تم الانهاء بنجاح ', 'done successfully ', '2019-09-08 15:16:09', 57),
(247, 'تم تقييم طلبك ', 'your order has been rated ', '2019-09-08 15:16:09', 57),
(248, 'تم تقييم طلبك ', 'your order has been rated ', '2019-09-08 15:16:09', 57),
(249, 'تم قبول   بنجاح', 'Your orders has been successfully accepted', '2019-09-08 18:20:09', 58),
(250, 'تم الموافقة علي طلبك بواسطة السائق', ' your order has been accepted by drivers ', '2019-09-08 18:22:09', 58),
(251, 'تم تأكيد طلبك الي الموقع المحدد', 'your order has been informed in your location ', '2019-09-08 18:23:09', 58),
(252, 'بدء عملية تحميل البضائع', 'start goods loading process', '2019-09-08 18:24:09', 58),
(253, 'طلبك يبدأ بالتحرك', 'your order is start moving ', '2019-09-08 18:24:09', 58),
(254, 'تم توصيل طلبك بنجاح في الموقع المحدد', 'your order is arrived in you location  ', '2019-09-08 18:24:09', 58),
(255, '  قام السائق بإنهاء الطلب ', 'the order has been finished by driver ', '2019-09-08 18:24:09', 58),
(256, '  قام المستخدم بإنهاء الطلب ', 'the order has been finished by user ', '2019-09-08 18:25:09', 58),
(257, 'تم الانهاء بنجاح ', 'done successfully ', '2019-09-08 18:25:09', 58),
(258, 'تم تقييم طلبك ', 'your order has been rated ', '2019-09-08 18:25:09', 58),
(259, 'تم تقييم طلبك ', 'your order has been rated ', '2019-09-08 18:26:09', 58),
(260, 'تم الغاء طلبك', 'your order has been cacelled', '2019-09-15 15:06:09', 60),
(261, 'تم دفع الفاتورة بنجاح', 'Your bill has been successfully paid', '2019-09-15 15:12:09', 60),
(262, 'تم الغاء طلبك', 'your order has been cacelled', '2019-09-15 15:13:09', 61),
(263, 'تم دفع الفاتورة بنجاح', 'Your bill has been successfully paid', '2019-09-15 16:27:09', 62),
(264, 'تم الموافقة علي طلبك بواسطة السائق', ' your order has been accepted by drivers ', '2019-09-15 16:39:09', 62),
(265, 'تم تأكيد طلبك الي الموقع المحدد', 'your order has been informed in your location ', '2019-09-15 16:43:09', 62),
(266, 'بدء عملية تحميل البضائع', 'start goods loading process', '2019-09-15 16:44:09', 62),
(267, 'طلبك يبدأ بالتحرك', 'your order is start moving ', '2019-09-15 16:46:09', 62),
(268, 'تم توصيل طلبك بنجاح في الموقع المحدد', 'your order is arrived in you location  ', '2019-09-15 16:46:09', 62),
(269, '  قام السائق بإنهاء الطلب ', 'the order has been finished by driver ', '2019-09-15 16:46:09', 62),
(270, '  قام المستخدم بإنهاء الطلب ', 'the order has been finished by user ', '2019-09-15 16:49:09', 62),
(271, '  قام السائق بإنهاء الطلب ', 'the order has been finished by driver ', '2019-09-15 17:06:09', 62),
(272, '  قام المستخدم بإنهاء الطلب ', 'the order has been finished by user ', '2019-09-15 17:07:09', 62),
(273, 'تم تقييم طلبك ', 'your order has been rated ', '2019-09-15 17:12:09', 62),
(329, 'تم دفع الفاتورة بنجاح', 'Your bill has been successfully paid', '2019-09-23 14:42:09', 90),
(330, 'تم الموافقة علي طلبك بواسطة السائق', ' your order has been accepted by drivers ', '2019-09-23 14:58:09', 90),
(331, 'تم تأكيد طلبك الي الموقع المحدد', 'your order has been informed in your location ', '2019-09-23 15:00:09', 90),
(332, 'بدء عملية تحميل البضائع', 'start goods loading process', '2019-09-23 15:13:09', 90),
(333, 'طلبك يبدأ بالتحرك', 'your order is start moving ', '2019-09-23 15:13:09', 90),
(334, 'تم توصيل طلبك بنجاح في الموقع المحدد', 'your order is arrived in you location  ', '2019-09-23 15:14:09', 90),
(335, '  قام السائق بإنهاء الطلب ', 'the order has been finished by driver ', '2019-09-23 15:15:09', 90),
(336, '  قام المستخدم بإنهاء الطلب ', 'the order has been finished by user ', '2019-09-23 15:15:09', 90),
(337, 'تم الانهاء بنجاح ', 'done successfully ', '2019-09-23 15:15:09', 90),
(338, 'تم تقييم طلبك ', 'your order has been rated ', '2019-09-23 15:16:09', 90),
(385, 'تم الموافقة علي طلبك بواسطة السائق', ' your order has been accepted by drivers ', '2019-10-06 14:33:10', 61),
(386, 'تم إلغاء  طلبك بواسطة السائق', 'your order has been canceled by drivers', '2019-10-06 14:33:10', 61),
(399, 'تم الموافقة علي طلبك بواسطة السائق', ' your order has been accepted by drivers ', '2019-10-06 17:25:10', 60),
(400, 'تم تأكيد طلبك الي الموقع المحدد', 'your order has been informed in your location ', '2019-10-06 17:25:10', 60),
(401, 'بدء عملية تحميل البضائع', 'start goods loading process', '2019-10-06 17:25:10', 60),
(402, 'طلبك يبدأ بالتحرك', 'your order is start moving ', '2019-10-06 17:25:10', 60),
(403, 'تم توصيل طلبك بنجاح في الموقع المحدد', 'your order is arrived in you location  ', '2019-10-06 17:25:10', 60),
(404, '  قام السائق بإنهاء الطلب ', 'the order has been finished by driver ', '2019-10-06 17:25:10', 60),
(406, 'تم قبول   بنجاح', 'Your orders has been successfully accepted', '2019-10-06 17:36:10', 94),
(459, 'تم إلغاء  طلبك بواسطة السائق', 'your order has been canceled by drivers', '2019-12-07 19:43:12', 50),
(460, 'تم إلغاء  طلبك بواسطة السائق', 'your order has been canceled by drivers', '2019-12-07 19:44:12', 50),
(475, 'تم تقييم طلبك ', 'your order has been rated ', '2019-12-08 16:50:12', 52);

-- --------------------------------------------------------

--
-- Table structure for table `notify_users`
--

CREATE TABLE `notify_users` (
  `id` int(11) NOT NULL,
  `notifications_id` int(11) NOT NULL,
  `is_seen` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL,
  `users_id` int(11) DEFAULT NULL,
  `drivers_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `notify_users`
--

INSERT INTO `notify_users` (`id`, `notifications_id`, `is_seen`, `created_at`, `users_id`, `drivers_id`) VALUES
(74, 76, 1, '2019-08-26 14:28:08', 67, NULL),
(76, 76, 0, '2019-08-26 14:28:08', 4, NULL),
(77, 76, 0, '2019-08-26 14:28:08', 5, NULL),
(78, 76, 0, '2019-08-26 14:28:08', 6, NULL),
(79, 76, 0, '2019-08-26 14:28:08', 7, NULL),
(80, 76, 0, '2019-08-26 14:28:08', 8, NULL),
(81, 76, 0, '2019-08-26 14:28:08', 9, NULL),
(82, 76, 0, '2019-08-26 14:28:08', 10, NULL),
(83, 76, 0, '2019-08-26 14:28:08', 11, NULL),
(84, 76, 0, '2019-08-26 14:28:08', 12, NULL),
(85, 76, 0, '2019-08-26 14:28:08', 13, NULL),
(86, 76, 0, '2019-08-26 14:28:08', 14, NULL),
(87, 80, 0, '2019-08-27 11:53:08', 2, NULL),
(89, 80, 0, '2019-08-27 11:53:08', 4, NULL),
(90, 80, 0, '2019-08-27 11:53:08', 5, NULL),
(91, 80, 0, '2019-08-27 11:53:08', 6, NULL),
(92, 80, 0, '2019-08-27 11:53:08', 7, NULL),
(93, 80, 0, '2019-08-27 11:53:08', 8, NULL),
(94, 80, 0, '2019-08-27 11:53:08', 9, NULL),
(95, 80, 0, '2019-08-27 11:53:08', 10, NULL),
(96, 80, 0, '2019-08-27 11:53:08', 11, NULL),
(97, 80, 0, '2019-08-27 11:53:08', 12, NULL),
(98, 80, 0, '2019-08-27 11:53:08', 13, NULL),
(99, 80, 0, '2019-08-27 11:53:08', 14, NULL),
(100, 80, 0, '2019-08-27 11:53:08', 15, NULL),
(101, 80, 0, '2019-08-27 11:53:08', 16, NULL),
(102, 84, 0, '2019-08-27 11:57:08', 14, NULL),
(103, 84, 0, '2019-08-27 11:57:08', 16, NULL),
(158, 139, 0, '2019-09-04 15:20:09', 18, NULL),
(159, 140, 0, '2019-09-04 15:21:09', 18, NULL),
(160, 141, 0, '2019-09-04 15:37:09', 18, NULL),
(161, 142, 0, '2019-09-04 15:37:09', 18, NULL),
(162, 143, 0, '2019-09-04 15:38:09', 18, NULL),
(163, 144, 0, '2019-09-04 15:38:09', 18, NULL),
(164, 145, 0, '2019-09-04 15:40:09', 18, NULL),
(165, 146, 0, '2019-09-04 15:41:09', 18, NULL),
(166, 147, 0, '2019-09-04 15:45:09', 18, NULL),
(167, 148, 0, '2019-09-04 15:48:09', 18, NULL),
(168, 149, 0, '2019-09-04 15:49:09', 18, NULL),
(169, 150, 0, '2019-09-04 15:51:09', 18, NULL),
(170, 151, 0, '2019-09-04 15:53:09', 18, NULL),
(171, 152, 0, '2019-09-04 15:56:09', 18, NULL),
(172, 153, 0, '2019-09-04 15:56:09', 18, NULL),
(173, 154, 0, '2019-09-04 15:58:09', 18, NULL),
(174, 155, 0, '2019-09-04 16:01:09', 18, NULL),
(175, 156, 0, '2019-09-04 16:03:09', NULL, 44),
(176, 157, 0, '2019-09-04 16:13:09', NULL, 44),
(177, 158, 0, '2019-09-04 16:15:09', NULL, 44),
(178, 159, 0, '2019-09-04 16:18:09', NULL, 44),
(179, 160, 0, '2019-09-04 16:29:09', NULL, 44),
(180, 161, 0, '2019-09-04 16:32:09', NULL, 44),
(181, 162, 0, '2019-09-04 16:32:09', 18, NULL),
(182, 163, 0, '2019-09-04 16:32:09', 18, NULL),
(183, 164, 0, '2019-09-04 16:32:09', NULL, 44),
(184, 165, 0, '2019-09-04 16:42:09', 18, NULL),
(185, 166, 0, '2019-09-04 16:45:09', 18, NULL),
(186, 167, 0, '2019-09-04 16:49:09', 18, NULL),
(187, 168, 0, '2019-09-04 16:56:09', 18, NULL),
(188, 169, 0, '2019-09-04 16:59:09', 18, NULL),
(189, 170, 0, '2019-09-04 17:06:09', 18, NULL),
(190, 171, 0, '2019-09-04 17:08:09', 18, NULL),
(191, 172, 0, '2019-09-04 17:09:09', 18, NULL),
(192, 173, 0, '2019-09-04 17:09:09', 18, NULL),
(193, 174, 0, '2019-09-04 17:10:09', 18, NULL),
(194, 175, 0, '2019-09-04 17:11:09', 18, NULL),
(195, 176, 0, '2019-09-04 17:11:09', 18, NULL),
(196, 177, 0, '2019-09-04 17:12:09', 18, NULL),
(197, 178, 0, '2019-09-04 17:13:09', 18, NULL),
(198, 179, 0, '2019-09-04 17:15:09', 18, NULL),
(199, 180, 0, '2019-09-04 17:16:09', NULL, 44),
(200, 181, 0, '2019-09-04 17:16:09', 18, NULL),
(201, 182, 0, '2019-09-04 17:16:09', NULL, 44),
(202, 183, 0, '2019-09-04 17:17:09', 18, NULL),
(247, 228, 0, '2019-09-08 14:59:09', 18, NULL),
(248, 229, 0, '2019-09-08 14:59:09', 18, NULL),
(249, 230, 0, '2019-09-08 15:00:09', 18, NULL),
(250, 231, 0, '2019-09-08 15:00:09', 18, NULL),
(251, 232, 0, '2019-09-08 15:00:09', 18, NULL),
(252, 233, 0, '2019-09-08 15:00:09', 18, NULL),
(253, 234, 0, '2019-09-08 15:03:09', 18, NULL),
(254, 235, 0, '2019-09-08 15:03:09', NULL, 44),
(255, 236, 0, '2019-09-08 15:04:09', 18, NULL),
(256, 237, 0, '2019-09-08 15:04:09', 18, NULL),
(257, 238, 0, '2019-09-08 15:04:09', NULL, 44),
(258, 239, 0, '2019-09-08 15:12:09', 18, NULL),
(259, 240, 0, '2019-09-08 15:13:09', 18, NULL),
(260, 241, 0, '2019-09-08 15:14:09', 18, NULL),
(261, 242, 0, '2019-09-08 15:14:09', 18, NULL),
(262, 243, 0, '2019-09-08 15:15:09', 18, NULL),
(263, 244, 0, '2019-09-08 15:15:09', 18, NULL),
(264, 245, 0, '2019-09-08 15:16:09', NULL, 44),
(265, 246, 0, '2019-09-08 15:16:09', 18, NULL),
(266, 247, 0, '2019-09-08 15:16:09', NULL, 44),
(267, 248, 0, '2019-09-08 15:16:09', 18, NULL),
(268, 249, 0, '2019-09-08 18:20:09', 26, NULL),
(269, 250, 0, '2019-09-08 18:22:09', 26, NULL),
(270, 251, 0, '2019-09-08 18:23:09', 26, NULL),
(271, 252, 0, '2019-09-08 18:24:09', 26, NULL),
(272, 253, 0, '2019-09-08 18:24:09', 26, NULL),
(273, 254, 0, '2019-09-08 18:24:09', 26, NULL),
(274, 255, 0, '2019-09-08 18:24:09', 26, NULL),
(275, 256, 0, '2019-09-08 18:25:09', NULL, 49),
(276, 257, 0, '2019-09-08 18:25:09', 26, NULL),
(277, 258, 0, '2019-09-08 18:25:09', NULL, 49),
(278, 259, 0, '2019-09-08 18:26:09', 26, NULL),
(279, 260, 0, '2019-09-15 15:06:09', NULL, NULL),
(280, 261, 0, '2019-09-15 15:12:09', 18, NULL),
(281, 262, 0, '2019-09-15 15:13:09', NULL, NULL),
(282, 263, 0, '2019-09-15 16:27:09', 28, NULL),
(283, 264, 0, '2019-09-15 16:39:09', 28, NULL),
(284, 265, 0, '2019-09-15 16:43:09', 28, NULL),
(285, 266, 0, '2019-09-15 16:44:09', 28, NULL),
(286, 267, 0, '2019-09-15 16:46:09', 28, NULL),
(287, 268, 0, '2019-09-15 16:46:09', 28, NULL),
(288, 269, 0, '2019-09-15 16:46:09', 28, NULL),
(289, 270, 0, '2019-09-15 16:49:09', NULL, 51),
(290, 271, 0, '2019-09-15 17:06:09', 28, NULL),
(291, 272, 0, '2019-09-15 17:07:09', NULL, 51),
(292, 273, 0, '2019-09-15 17:12:09', 28, NULL),
(348, 329, 0, '2019-09-23 14:42:09', 35, NULL),
(349, 330, 0, '2019-09-23 14:58:09', 35, NULL),
(350, 331, 0, '2019-09-23 15:00:09', 35, NULL),
(351, 332, 0, '2019-09-23 15:13:09', 35, NULL),
(352, 333, 0, '2019-09-23 15:13:09', 35, NULL),
(353, 334, 0, '2019-09-23 15:14:09', 35, NULL),
(354, 335, 0, '2019-09-23 15:15:09', 35, NULL),
(355, 336, 0, '2019-09-23 15:15:09', NULL, 59),
(356, 337, 0, '2019-09-23 15:15:09', 35, NULL),
(357, 338, 0, '2019-09-23 15:16:09', NULL, 59),
(404, 385, 0, '2019-10-06 14:33:10', 18, NULL),
(405, 386, 0, '2019-10-06 14:33:10', 18, NULL),
(418, 399, 0, '2019-10-06 17:25:10', 18, NULL),
(419, 400, 0, '2019-10-06 17:25:10', 18, NULL),
(420, 401, 0, '2019-10-06 17:25:10', 18, NULL),
(421, 402, 0, '2019-10-06 17:25:10', 18, NULL),
(422, 403, 0, '2019-10-06 17:25:10', 18, NULL),
(423, 404, 0, '2019-10-06 17:25:10', 18, NULL),
(425, 406, 0, '2019-10-06 17:36:10', 7, NULL),
(478, 459, 0, '2019-12-07 19:43:12', 18, NULL),
(479, 460, 0, '2019-12-07 19:44:12', 18, NULL),
(494, 475, 0, '2019-12-08 16:50:12', 18, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `offline_payment`
--

CREATE TABLE `offline_payment` (
  `id` int(11) NOT NULL,
  `bills_id` int(11) NOT NULL,
  `image_deposit` varchar(255) NOT NULL,
  `code` varchar(5) NOT NULL,
  `admin_approve` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `offline_payment`
--

INSERT INTO `offline_payment` (`id`, `bills_id`, `image_deposit`, `code`, `admin_approve`, `created_at`) VALUES
(12, 35, 'https://shipit.projects.tmtgps.me/uploads/users/57Xnnt4nkmqHKaws.jpg', '98392', NULL, '2019-09-04 16:41:09'),
(15, 39, 'https://shipit.projects.tmtgps.me/uploads/users/jf4PuvpO1j9CsNzI.jpg', '72574', NULL, '2019-09-08 14:56:09'),
(16, 40, 'https://shipit.projects.tmtgps.me/uploads/users/LhVeTt1Cs5fzYBoE.jpg', '95357', NULL, '2019-09-08 15:10:09'),
(17, 41, 'https://shipit.projects.tmtgps.me/uploads/users/HTbFkjL0ZMqED48E.jpg', '13669', NULL, '2019-09-08 18:19:09'),
(18, 42, 'https://shipit.projects.tmtgps.me/uploads/users/DaWmLkxUJYBVuV9F.jpg', '71183', NULL, '2019-09-09 15:07:09'),
(19, 43, 'https://shipit.projects.tmtgps.me/uploads/users/xLA01rdCjOt3trHx.jpg', '45458', 1, '2019-09-15 15:04:09'),
(20, 45, 'https://shipit.projects.tmtgps.me/uploads/users/dz7U4x41Ozo4inxr.jpg', '25522', 1, '2019-09-15 16:25:09'),
(26, 73, 'https://shipit.projects.tmtgps.me/uploads/users/QhCoxt9lEPtMThmz.jpg', '89881', 1, '2019-09-23 14:18:09'),
(82, 224, 'https://shipit.projects.tmtgps.me/uploads/users/tvIiIMZ8yrj7SAho.jpg', '86854', NULL, '2019-12-24 17:53:12'),
(83, 225, 'https://shipit.projects.tmtgps.me/uploads/users/WEynSSU3Qkfapudx.jpg', '35495', NULL, '2020-02-09 11:21:02');

-- --------------------------------------------------------

--
-- Table structure for table `online_payment`
--

CREATE TABLE `online_payment` (
  `id` int(11) NOT NULL,
  `bills_id` int(11) NOT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `payment_status` enum('waiting','completed') NOT NULL DEFAULT 'waiting',
  `payment_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `locations_pickup_id` int(11) NOT NULL,
  `locations_destination_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `goods_types_id` int(11) NOT NULL,
  `descriptions` text DEFAULT NULL,
  `i_am_recipient` tinyint(1) NOT NULL,
  `recipient_name` varchar(100) DEFAULT NULL,
  `country_code` varchar(6) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `load_weight` varchar(45) DEFAULT NULL,
  `status` enum('awaitingPayment','cancelledByUser','awaitingDriver','acceptedByDriver','cancelledByDriver','arrivedPickUpLocation','goodsLoading','startMoving','arrivedToDestinationLocation','finishedTripByDriver','fininshedTripByUser','closed','acceptedByCompany') NOT NULL DEFAULT 'awaitingPayment',
  `created_at` datetime NOT NULL,
  `users_id` int(11) NOT NULL,
  `trucks_types_id` int(11) NOT NULL,
  `code` varchar(5) NOT NULL,
  `drivers_id` int(11) DEFAULT NULL,
  `companies_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `locations_pickup_id`, `locations_destination_id`, `image`, `goods_types_id`, `descriptions`, `i_am_recipient`, `recipient_name`, `country_code`, `phone`, `load_weight`, `status`, `created_at`, `users_id`, `trucks_types_id`, `code`, `drivers_id`, `companies_id`) VALUES
(50, 109, 110, NULL, 5, NULL, 1, NULL, NULL, NULL, '5', 'closed', '2019-09-04 15:15:09', 18, 8, '41905', 44, NULL),
(52, 113, 114, NULL, 5, NULL, 1, NULL, NULL, NULL, '20', 'closed', '2019-09-04 16:41:09', 18, 8, '86897', 44, NULL),
(56, 123, 124, NULL, 5, NULL, 1, NULL, NULL, NULL, '٣٤', 'closed', '2019-09-08 14:56:09', 18, 8, '48472', 44, NULL),
(57, 125, 126, NULL, 5, NULL, 1, NULL, NULL, NULL, '55', 'closed', '2019-09-08 15:09:09', 18, 8, '35466', 44, NULL),
(58, 129, 130, 'https://shipit.projects.tmtgps.me/uploads/users/NF0u34axHzfjuvYk.jpg', 5, NULL, 1, NULL, NULL, NULL, '50', 'closed', '2019-09-08 18:18:09', 26, 8, '28691', 49, NULL),
(59, 131, 132, 'https://shipit.projects.tmtgps.me/uploads/users/NuGY8SvZQB9HqrLn.jpg', 5, NULL, 1, 'osama', '+20', '+201000523698', '65', 'closed', '2019-09-09 15:05:09', 26, 8, '42960', NULL, NULL),
(60, 134, 135, 'https://shipit.projects.tmtgps.me/uploads/users/O1dxFgcQjVRuREXi.jpg', 5, NULL, 1, 'ali', '+20', '+201002345678', '70', 'closed', '2019-09-15 15:01:09', 18, 8, '33842', 63, NULL),
(61, 136, 137, 'https://shipit.projects.tmtgps.me/uploads/users/d438T3M20e0LvlVM.jpg', 5, NULL, 1, 'ahmed', '+20', '+201002345698', '7', 'closed', '2019-09-15 15:10:09', 18, 8, '86456', 63, NULL),
(62, 139, 140, 'https://shipit.projects.tmtgps.me/uploads/users/tmB3SvvbDHN7OkLC.jpg', 8, NULL, 1, 'ali', '+20', '+201000852369', '10', 'closed', '2019-09-15 16:22:09', 28, 10, '91762', 51, NULL),
(87, 191, 192, NULL, 5, 'eeeeeeeeeeeee', 1, 'jjjjjj', '+20', '+201555088135', '333', 'closed', '2019-09-17 18:16:09', 31, 8, '66872', NULL, NULL),
(90, 203, 204, 'https://shipit.projects.tmtgps.me/uploads/users/KSqXhH8PkM8sTI78.jpg', 8, 'ay 7agaaaa', 0, 'taghreed', '+20', '+201239874560', '8', 'closed', '2019-09-23 14:18:09', 35, 10, '95986', 59, NULL),
(94, 211, 212, 'https://shipit.projects.tmtgps.me/uploads/users/fOTdgBFPApC7yiOZ.jpg', 5, 'adadad', 1, NULL, NULL, NULL, NULL, 'closed', '2019-09-23 18:25:09', 7, 10, '35720', NULL, NULL),
(241, 517, 518, 'https://shipit.projects.tmtgps.me/uploads/users/lRCXLpKW3CEl4f8m.jpg', 5, 'doggy', 1, NULL, '+20', NULL, '55', 'awaitingPayment', '2019-12-24 17:52:12', 45, 8, '42953', NULL, NULL),
(242, 519, 520, NULL, 11, 'test', 1, NULL, '+20', NULL, '50', 'closed', '2020-02-09 11:21:02', 60, 8, '13455', NULL, NULL),
(243, 521, 522, NULL, 5, 'fdssdfggg', 0, 'ssddff', '+20', '+20222888222', '12', 'awaitingPayment', '2020-02-09 21:08:02', 49, 8, '66328', NULL, NULL),
(245, 531, 532, 'https://shipit.projects.tmtgps.me/uploads/users/yIK9zUXoHiAg7GwB.jpg', 5, NULL, 1, NULL, NULL, NULL, NULL, 'awaitingPayment', '2021-02-22 20:35:02', 67, 7, '54400', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `phones`
--

CREATE TABLE `phones` (
  `id` int(11) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `phones`
--

INSERT INTO `phones` (`id`, `phone`, `is_active`, `created_at`) VALUES
(6, '0111320024', 1, '2019-06-27 17:28:06'),
(7, '0123456789', 1, '2019-08-26 13:55:08');

-- --------------------------------------------------------

--
-- Table structure for table `price_list`
--

CREATE TABLE `price_list` (
  `id` int(11) NOT NULL,
  `category` double NOT NULL,
  `price` double NOT NULL,
  `created_at` datetime NOT NULL,
  `trucks_types_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `price_list`
--

INSERT INTO `price_list` (`id`, `category`, `price`, `created_at`, `trucks_types_id`) VALUES
(5, 100, 500, '2019-06-28 22:32:06', 10),
(6, 50, 200, '2019-06-28 22:36:06', 10),
(7, 10, 40, '2019-08-26 14:46:08', 8),
(8, 500, 1000, '2019-09-23 13:45:09', 8);

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `rate` double NOT NULL,
  `created_at` datetime NOT NULL,
  `type` enum('userToDriver','driverToUser') NOT NULL,
  `drivers_id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `orders_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `rate`, `created_at`, `type`, `drivers_id`, `users_id`, `orders_id`) VALUES
(22, 2, '2019-09-04 16:32:09', 'userToDriver', 44, 18, 50),
(23, 3, '2019-09-04 16:32:09', 'driverToUser', 44, 18, 50),
(24, 5, '2019-09-04 17:16:09', 'driverToUser', 44, 18, 52),
(31, 5, '2019-09-08 15:04:09', 'userToDriver', 44, 18, 56),
(32, 3, '2019-09-08 15:04:09', 'driverToUser', 44, 18, 56),
(33, 4, '2019-09-08 15:16:09', 'driverToUser', 44, 18, 57),
(34, 5, '2019-09-08 15:16:09', 'userToDriver', 44, 18, 57),
(35, 2, '2019-09-08 18:25:09', 'driverToUser', 49, 26, 58),
(36, 5, '2019-09-08 18:26:09', 'userToDriver', 49, 26, 58),
(37, 5, '2019-09-15 17:12:09', 'userToDriver', 51, 28, 62),
(47, 4, '2019-09-23 15:16:09', 'driverToUser', 59, 35, 90),
(60, 4, '2019-12-08 16:50:12', 'userToDriver', 44, 18, 52);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL,
  `tmp_phone` varchar(45) DEFAULT NULL,
  `tmp_code` varchar(255) DEFAULT NULL,
  `code` varchar(5) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `users_id` int(11) DEFAULT NULL,
  `drivers_id` int(11) DEFAULT NULL,
  `orders_id` int(11) DEFAULT NULL,
  `is_verified` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `tmp_phone`, `tmp_code`, `code`, `created_at`, `users_id`, `drivers_id`, `orders_id`, `is_verified`) VALUES
(42, NULL, NULL, '12345', '2019-08-19 16:15:08', NULL, 7, NULL, 0),
(44, NULL, NULL, '12345', '2019-08-20 16:30:08', NULL, 9, NULL, 0),
(45, NULL, NULL, '12345', '2019-08-20 16:40:08', NULL, 10, NULL, 0),
(46, NULL, NULL, '12345', '2019-08-20 16:50:08', NULL, 11, NULL, 0),
(47, NULL, NULL, '12345', '2019-08-20 17:46:08', NULL, 12, NULL, 0),
(48, NULL, NULL, '12345', '2019-08-20 17:47:08', NULL, 13, NULL, 0),
(49, NULL, NULL, '12345', '2019-08-20 17:47:08', NULL, 14, NULL, 0),
(50, NULL, NULL, '12345', '2019-08-20 17:47:08', NULL, 15, NULL, 0),
(51, NULL, NULL, '12345', '2019-08-20 17:47:08', NULL, 16, NULL, 0),
(52, NULL, NULL, '12345', '2019-08-20 18:00:08', NULL, 17, NULL, 0),
(53, NULL, NULL, '12345', '2019-08-20 18:20:08', NULL, 18, NULL, 0),
(54, NULL, NULL, '12345', '2019-08-20 18:22:08', NULL, 19, NULL, 0),
(55, NULL, NULL, '12345', '2019-08-20 18:29:08', NULL, 20, NULL, 0),
(56, NULL, NULL, '12345', '2019-08-20 18:38:08', NULL, 21, NULL, 0),
(58, NULL, NULL, '12345', '2019-08-20 19:47:08', NULL, 22, NULL, 0),
(59, NULL, NULL, '12345', '2019-08-20 19:52:08', NULL, 23, NULL, 0),
(62, NULL, NULL, '12345', '2019-08-21 13:22:08', NULL, 25, NULL, 0),
(63, NULL, NULL, '12345', '2019-08-21 13:29:08', NULL, 26, NULL, 0),
(64, NULL, NULL, '12345', '2019-08-21 13:31:08', NULL, 27, NULL, 0),
(65, NULL, NULL, '12345', '2019-08-21 13:48:08', NULL, 28, NULL, 0),
(66, NULL, NULL, '12345', '2019-08-21 14:15:08', NULL, 29, NULL, 0),
(67, NULL, NULL, '12345', '2019-08-21 15:09:08', NULL, 30, NULL, 0),
(68, NULL, NULL, '12345', '2019-08-21 15:11:08', NULL, 31, NULL, 0),
(69, NULL, NULL, '12345', '2019-08-21 15:35:08', NULL, 32, NULL, 0),
(70, NULL, NULL, '12345', '2019-08-21 17:08:08', NULL, 33, NULL, 0),
(73, NULL, NULL, '12345', '2019-08-22 15:20:08', NULL, 36, NULL, 0),
(92, NULL, 'YtcdZtsJ6eGsvROno7hKplI7PplgL2NVzQAKRAhoDeyRSVIth0Va9GEaE7qnIA5Bp1Wjf', '12345', '2019-08-22 16:12:08', NULL, 37, NULL, 0),
(99, NULL, NULL, '12345', '2019-08-22 22:03:08', NULL, 39, NULL, 0),
(112, NULL, 'hOg9IUD1QM8SicZVGxCR0lBpmQWNXRPkHsI02veLSZX8sOLjHvz3nlYdTVdWkQRhtzWp0', '12345', '2019-08-24 17:40:08', NULL, 40, NULL, 0),
(120, NULL, 'M1QlLFwLkeNf66IEBZapIHF829XNnawuGkaCzdhlYjPBQupKgr4rYZDFQ8Jw1q9QzpfkB', '12345', '2019-08-24 19:42:08', NULL, 42, NULL, 0),
(261, NULL, NULL, '12345', '2019-09-16 17:56:09', NULL, 53, NULL, 0),
(269, NULL, 'h2Fh1L4sP0aHXfz7ggwfkpxE131IDtO08k5jCKjeEvl3h2MjI6CHxoRlDjQo2ndmqN28S', '12345', '2019-09-23 11:46:09', NULL, 52, NULL, 0),
(271, NULL, NULL, '12345', '2019-09-23 11:52:09', NULL, 55, NULL, 0),
(303, NULL, '2bXK6aYsSv1ibBpzfEAUdzkalM1OxYKyV3AQw2QmxL7tS8jspXQNZ2EtSmO6hqjkLqBR6', '12345', '2019-09-23 12:42:09', NULL, 57, NULL, 0),
(378, NULL, '92MBbaarsg7YUzTwmaenu7GY15Sq4ly815dbfK3DCfnlijdx8OjNMq8y9QpigSPoGsjv9', '12345', '2019-09-25 15:15:09', NULL, 60, NULL, 0),
(382, NULL, NULL, '12345', '2019-09-30 18:20:09', NULL, 62, NULL, 0),
(387, NULL, 'GTqsvqQQzQKgjqgIU2V4fiXDsrIEC2loLHTRvbaz1X1VsvLOYgEtf6VCkQJufvqYsy4n1', '12345', '2019-10-21 02:14:10', NULL, 41, NULL, 0),
(410, NULL, '44IP6WWYcMkwdgXh6Mk8DtrbM4uzSAP3mBsoNYIMLSpQwB7CQkGHgIZjLnRcVcHNc42qP', '12345', '2019-11-24 21:42:11', NULL, 44, NULL, 0),
(421, NULL, 'o3QwYldadwjYdr6JudLdOELKQIPsdUUDnSEwu8sj3F4eGKGsELGmBIyhWU1p0lokBlx5j', '12345', '2019-12-02 13:36:12', NULL, 66, NULL, 0),
(520, NULL, NULL, '12345', '2019-12-23 20:33:12', NULL, 70, NULL, 0),
(521, '+01113200245080', NULL, '12345', '2019-12-24 03:43:12', NULL, 5, NULL, 0),
(523, NULL, NULL, '12345', '2020-06-28 18:10:06', 61, NULL, NULL, 0),
(524, NULL, NULL, '12345', '2020-06-28 18:42:06', 62, NULL, NULL, 0),
(525, NULL, NULL, '12345', '2020-06-28 18:47:06', 63, NULL, NULL, 0),
(527, NULL, NULL, '12345', '2020-06-28 20:07:06', NULL, 71, NULL, 0),
(528, NULL, NULL, '12345', '2020-06-28 20:31:06', NULL, 72, NULL, 0),
(529, NULL, NULL, '12345', '2020-06-28 20:38:06', NULL, 73, NULL, 0),
(532, NULL, NULL, '12345', '2021-02-22 20:01:02', 65, NULL, NULL, 0),
(533, NULL, NULL, '12345', '2021-02-22 20:06:02', 66, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `about_us_ar` text NOT NULL,
  `about_us_en` text NOT NULL,
  `policy_term_ar` text NOT NULL,
  `policy_term_en` text NOT NULL,
  `radius` double NOT NULL,
  `fees` double NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `about_us_ar`, `about_us_en`, `policy_term_ar`, `policy_term_en`, `radius`, `fees`, `created_at`) VALUES
(1, 'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق. إذا كنت تحتاج إلى عدد أكبر من الفقرات يتيح لك مولد النص العربى زيادة عدد الفقرات كما تريد، النص لن يبدو مقسما ولا يحوي أخطاء لغوية، مولد النص العربى مفيد لمصممي المواقع على وجه الخصوص، حيث يحتاج العميل فى كثير من الأحيان أن يطلع على صورة حقيقية لتصميم الموقع. ومن هنا وجب على المصمم أن يضع نصوصا مؤقتة على التصميم ليظهر للعميل الشكل كاملاً،دور مولد النص العربى أن يوفر على المصمم عناء البحث عن نص بديل لا علاقة له بالموضوع الذى يتحدث عنه التصميم فيظهر بشكل لا يليق. هذا النص يمكن أن يتم تركيبه على أي تصميم دون مشكلة فلن يبدو وكأنه نص منسوخ، غير منظم، غير منسق، أو حتى غير مفهوم. لأنه مازال نصاً بديلاً ومؤقتاً.\r\nهذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق. إذا كنت تحتاج إلى عدد أكبر من الفقرات يتيح لك مولد النص العربى زيادة عدد الفقرات كما تريد، النص لن يبدو مقسما ولا يحوي أخطاء لغوية، مولد النص العربى مفيد لمصممي المواقع على وجه الخصوص، حيث يحتاج العميل فى كثير من الأحيان أن يطلع على صورة حقيقية لتصميم الموقع. ومن هنا وجب على المصمم أن يضع نصوصا مؤقتة على التصميم ليظهر للعميل الشكل كاملاً،دور مولد النص العربى أن يوفر على المصمم عناء البحث عن نص بديل لا علاقة له بالموضوع الذى يتحدث عنه التصميم فيظهر بشكل لا يليق. هذا النص يمكن أن يتم تركيبه على أي تصميم دون مشكلة فلن يبدو وكأنه نص منسوخ، غير منظم، غير منسق، أو حتى غير مفهوم. لأنه مازال نصاً بديلاً ومؤقتاً.', 'This text is an example of text that can be replaced in the same space, this text has been created from the Arabic text generator. If you need more of your first paragraphs. Web Design. From here and Rajab the designer to be temporary texts on the design of this text can be installed on any design. Is it still an alternative and temporary text?', 'سياسة الموقع', 'policy', 100, 15, '2019-06-06 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `trucks_types`
--

CREATE TABLE `trucks_types` (
  `id` int(11) NOT NULL,
  `name_ar` varchar(45) NOT NULL,
  `name_en` varchar(45) NOT NULL,
  `image` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `trucks_types_id` int(11) DEFAULT NULL,
  `descriptions_ar` text DEFAULT NULL,
  `descriptions_en` text DEFAULT NULL,
  `max_weight` varchar(45) DEFAULT NULL,
  `area` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `trucks_types`
--

INSERT INTO `trucks_types` (`id`, `name_ar`, `name_en`, `image`, `is_active`, `created_at`, `trucks_types_id`, `descriptions_ar`, `descriptions_en`, `max_weight`, `area`) VALUES
(7, 'نص نقل', 'half naql', 'https://shipit.projects.tmtgps.me/uploads/users/tTCnvhZ2RVYn3uJyasoKOoo6x2cK2K1575451703.jpg', 1, '2019-06-28 21:10:06', NULL, 'نقل', 'naql', '155', '120'),
(8, 'تويوتا', 'Toyota', 'https://shipit.projects.tmtgps.me/uploads/users/e750ywrCzuBkx65zfa9x9rB87MXXtX1561745488.jpg', 1, '2019-06-28 21:11:06', 7, 'تويوتا نصف نقل', 'half truck toyota', '200', '35'),
(9, 'مرسيدس', 'Mercedes', 'https://shipit.projects.tmtgps.me/uploads/users/ilm8ThK2fC8JJgR0XzKG5WwgcFPWCZ1575451671.jpg', 1, '2019-08-26 14:35:08', NULL, 'مرسيدس', 'Mercedes', '250', '190'),
(10, 'شاحنة مرسيدس', 'Mercedes Truck', 'https://shipit.projects.tmtgps.me/uploads/users/Rugj5TQnyVInJ8Z3R0THJfyzJ44qAl1568551781.jpg', 1, '2019-09-15 15:49:09', 9, 'شاحنة من نوع مرسيدس حمولة 200 طن', 'Mercedes Truck up to 200 Ton', '200', '350');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `country_code` varchar(6) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `name` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `is_verified` tinyint(1) NOT NULL DEFAULT 0,
  `api_token` varchar(255) NOT NULL,
  `language` enum('ar','en') NOT NULL,
  `created_at` datetime NOT NULL,
  `firebase_token` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `image`, `country_code`, `phone`, `name`, `password`, `is_active`, `is_verified`, `api_token`, `language`, `created_at`, `firebase_token`, `email`) VALUES
(2, 'https://shipit.projects.tmtgps.me/uploads/users/6ZSYIKItcvAPXMH9.jpg', '1234', '+201113200245', 'mostafa', '$2y$10$WiRasQvOS6cnmEo.ecT10OMpPxe0ojBtgcP5nj3oNbd55ZGslJSl2', 1, 1, 'hw1HGst9S65IhMwcC3lXx4X6koyVZnIoUX60PVrWus1Yva9bJKORR22Ijc5AIYjd6QcnK', 'ar', '2019-06-14 09:23:06', 'fgreO4oBSPg:APA91bEEjxfvXBvBzwu-XJgCTOeGLvB_29mAGLnhacC9yFprDOanQHRkYjIffUzWfcS29ODe4i66OJ6xaR4lxUgtPt4lmYgkDM6QqDy3qnvAMEQR0Hh98B7HaI6mch5yqfQSjpIai4x4', NULL),
(4, NULL, '+20', '0123456789', 'ahkhh', '$2y$10$bsSswX7HRHHv71sfYAF.q.D.DrYDJQAufH3vsKtRWki97rzq6D4.y', 1, 0, 'Cm5mTjVy0IEcQjfUC9FcCvT2CHfHCPtKrNQT1JnDRKmRZvXfNincvp83rhZASiM3hlBvD', 'ar', '2019-08-19 11:08:08', NULL, 'ad44400d@a9min.com'),
(5, 'https://shipit.projects.tmtgps.me/uploads/users/oHaLRDtJ2oCvh4xt.jpg', '+20', '1234567890', 'hend', '$2y$10$JQLD7EDic1P0NXyu4QGbmOqsiin55riw.x4ZnOgOc3/vW.C8bCC56', 1, 1, '4Z6OlmswJTtXC1tVUIOBphOQKBhMaU7wpShr2NGUj58jrgSAHSqE51EHDcMrP36P8IhRX', 'en', '2019-08-19 14:01:08', NULL, NULL),
(6, NULL, '123456', '+01814228487', 'jh', '$2y$10$YYhKxmSWM.cIOGP3OFTYfu19pMS4qQTGMySf.PlL8EgZPju/DQjUG', 1, 1, 'ID5SuyscxzTaSq5JiuiQNWGAQTv1EGmqKJK1ofwafvYfjUVv9MEU5V989vRFEVNjL5M3d', 'ar', '2019-08-19 15:23:08', NULL, NULL),
(7, 'https://shipit.projects.tmtgps.me/uploads/users/yScnd1GxE7YwxZtf.jpg', '+20', '00201114228487', 'mostafa ramdan\r\n\r\nmostafa', '$2y$10$YlI7sdIYCOvT6u54zIm3leHR528R8WRzOX88g8rSUOcrLvzP0A.UW', 1, 1, 'dtckY7iXlAX7dZvMwTRIT6UUJSXViQIAkyc1pY7yiV3PGNzGYN1v68PN064KTgJMmcGw5', 'ar', '2019-08-20 19:00:08', 'e06oriXdh7k:APA91bF55Kn8cI9_u0cOc0BnBs6UyrXGGXHd9c10c-fwgz9UvJScZ2_oejZFrGFrUiq9_yNymUzB4KSf8TcTx6W800s2xSHHhDhw5N7jPWQ23SHwVfAK3cYdeVzR1-KNiSG-IiShaSb3', NULL),
(8, NULL, '+20', '+201551610944', 'ali', '$2y$10$2M6LdjSHk3mtekf63W.M/OhDCf1d6r2igsGpIvPUzzhYNnbyZLHC.', 1, 0, 'FemQJBUCAtZ1oICYsGB5lPmZifpLHY6EvPHtISUq6tsS9y2r324PWLt5PWbZt5JoGQhzU', 'en', '2019-08-24 16:05:08', NULL, NULL),
(9, NULL, '+20', '+201551610945', 'ahmed', '$2y$10$kTvOBqQ49V4hxKQOLyHEvuGGKit.TEqcuyHG9fqkfoR.XfAQuIz.q', 1, 0, '474Asfl580d13sxhIoxpT6veykePkr7j2RyPFVI59NYcolVcT2vpRvDUTxnRexLtjXEZJ', 'en', '2019-08-24 16:13:08', NULL, NULL),
(10, NULL, '+20', '+201551610545', 'ahmed', '$2y$10$pvtkw8L/pQLW2/gq1NXB8ei9CyhbuPKlqCjcikCWPU8eXvOZpPEQC', 1, 0, 'MWLfGwT72Rvr7CIwTOvCw8RkY257CPfFMjITKqUH0PYaYat3ozG3WsvQXRcjXWR0IJARW', 'en', '2019-08-24 16:16:08', NULL, NULL),
(11, NULL, '+20', '+20155161844', 'esmail', '$2y$10$RLfiasFYuoygEHnpBXRDieDRvuu7PIodpB9jCM4qUw4f4knWlIDum', 1, 0, '9KEnisEYq7PxRFhKAWoGJbnfbXXGrzZDzDUXscvOgpuARDY1fC4d9gaLEBuJhSzMNQoQI', 'en', '2019-08-24 16:17:08', NULL, NULL),
(12, NULL, '+20', '+20155161925', 'محمد', '$2y$10$pckUn3Y4uPEhnE9HEBLtf.pgecGw43mNX30V04.PaAE4YHj9bmW9u', 1, 0, 'FvOAjVwNyAxJJd11r8eJvzpSNnnkhGJbhdjxlk4zPqSfO8Dp7i80xC8Bn9DpT7nDHijWg', 'en', '2019-08-24 17:43:08', NULL, NULL),
(13, NULL, '+20', '+201555088137', 'ibrahim', '$2y$10$iICyue25rvJOqrglYTfbf.tX/aN4WZMHaqSE44qX1obWn5rPO3Woq', 1, 1, 'TResVVJJSe2NWGxtZ2ZdNFPy4dXIsop5NRcC0vRp2B6NEwK3vxRrRreXSjyziMbBZZWdY', 'en', '2019-08-25 16:39:08', NULL, NULL),
(14, 'https://shipit.projects.tmtgps.me/uploads/users/WcCDfLVuyLMCP3F4.jpg', '+20', '+201114228488', 'henzzzzz', '$2y$10$EZHAQftaWG4x1YMSo6UsfO3q8hYYXgtjSlHORx.b/QK4CPFBl4g3e', 1, 1, 'zKRwxQ4nGgXZw5IUtPXJrhzCcB83hLMl9bojepPxpZlMDGQOPIhNxxNemeG4s86ZOGiQl', 'en', '2019-08-25 17:48:08', 'fDVHcyK8XHc:APA91bHyvZ9hgpSQsY7KCDeRbKifTlYaXv_w5A6YzVYUwHSl21XQJuzKH-0-UH7F30BX4Mhmcnuz_vAlf8ZW_7frkgRgK-JZyuYFgKCUEST0DktynzlUgJubvllzl_g3Ddy1y5Y-fQNU', NULL),
(15, '', '+20', '+201555088138', 'ibrahim', '$2y$10$sdmDXEX8jYHD4qGTircVLeMJzS9rReDB8nPPZvpk914/GTCddVTj.', 1, 1, '6ySFvuDyqNUSzTRugi9Ys8ZzC2ZbdNlBg6cYR9HBMSBVyZN7N2SC7USdR7ayJsiSJ1v4V', 'en', '2019-08-26 16:52:08', NULL, NULL),
(16, NULL, '+20', '1128661627', 'cccccccvhh', '$2y$10$xxsEeg1tUMFRwgxwAeoz5OoLh8WpNYdyxInnyl5iTzVAbb8VgnH2W', 1, 1, 'ru0rUgcTUzwgcjJdYqbSpXtQ2HH5wAoHfXWAOxAZ8veKrIuelZ1hVGmPNFwVoKAKEJ4qJ', 'en', '2019-08-26 19:08:08', NULL, NULL),
(17, NULL, '+20', '+201555088131', 'ibrahim232', '$2y$10$Xlzbpw1WgKOfvvXD0/1Fu.W3KzkJ1g/j2DqFkJ0kfRsvpQ2L0UnP2', 1, 1, 'IlXy0qT6qAsY1hCO0BeYuD5eBng0J8q58lrmfDpyWerlcTSsQ2TxybiXtKV7YadwBMGGB', 'ar', '2019-08-31 13:48:08', 'dn77UpLCTlA:APA91bFm3IRw50g_qsaJm1i-gD1a81wLzo-SNzCnVry2L_qbcJRS0S6VxIklrcPPQJcUCz2hNYSODJp8ceXxWANr2BLt-mVByhemMvIW7c1cEivg1ascHTxJCxv3nfcgYSUZQ-9tQcAa', NULL),
(18, 'https://shipit.projects.tmtgps.me/uploads/users/atbXcq2cA7e41WAs.jpg', '+20', '+201128661627', 'hossam', '$2y$10$5GVTrhQGKNOBnqvDaqjz8.1f3oyv4XwgCH7oducmRo9lRqrx4WEW2', 1, 1, 'qI24LHOTVYwniFGwSAW3fxjouXEqKqrdkj44V6mxyUREpGGLSvE7j1GpTDPCgXc7FWFZ2', 'ar', '2019-09-02 22:48:09', 'fDVHcyK8XHc:APA91bHyvZ9hgpSQsY7KCDeRbKifTlYaXv_w5A6YzVYUwHSl21XQJuzKH-0-UH7F30BX4Mhmcnuz_vAlf8ZW_7frkgRgK-JZyuYFgKCUEST0DktynzlUgJubvllzl_g3Ddy1y5Y-fQNU', NULL),
(21, NULL, '+20', '+201111045148', 'tony', '$2y$10$jpAmGvDGpVc.UegQnriv3OBb9Nd/aYUs89P7sSRTh.2zWwYsv7zHW', 1, 1, 'XIFFNqkmmzBm0mQbpxa80UVRGysmw8IKIDOntlE3ZG4jU6dsM0i6wnUPvwwGYOrIVZISH', 'ar', '2019-09-03 19:43:09', 'c1wrBG07y5M:APA91bEbWBqZj6RbQZt_-gfw4tH9QHKP2NlPaN6UsmJgsfd1t-nPO0QRqon0m-LXXLIc5ZBsHXcXMnSfG4og3T3SOjMHyexlv7N9gwmfAeNgUTugq2BY-GUnhbsRwSiVzvX07Z6_8ZfE', NULL),
(22, NULL, '+20', '+201128661632', 'mahmoud3333', '$2y$10$CQVO3dnoARE50WOLHf7Ku.tvHQpOdCDomlMTCcwm3GjiO2o5JZoQC', 1, 1, 'EflZuMEqIGVNlWZV4M4cU939umER5Q9IxgBQ5p7yfcgWQuvfICUEktUtVZyJrdIVWjt4v', 'ar', '2019-09-03 20:57:09', 'dn77UpLCTlA:APA91bFm3IRw50g_qsaJm1i-gD1a81wLzo-SNzCnVry2L_qbcJRS0S6VxIklrcPPQJcUCz2hNYSODJp8ceXxWANr2BLt-mVByhemMvIW7c1cEivg1ascHTxJCxv3nfcgYSUZQ-9tQcAa', NULL),
(23, NULL, '+20', '+201551610947', 'ali', '$2y$10$/diWRI6WJW0LapaA/JclB.L4F6HvBsJrGFqVXn/YQGKHbSSVvJrIG', 1, 1, '1KhHqUL4EqZleFpXInjI4L22wQYYR7rARRrgNfurn7ejbiEeKQaWexg8bFOonak8ISFpI', 'en', '2019-09-08 03:31:09', NULL, NULL),
(24, NULL, '+20', '+201000521586', 'mahrous', '$2y$10$UqHXy05qQRSQo5GbewOhiedGuq0uldE2p5CEQXhvyIY4p7h7/G2ey', 1, 1, 'y7OXpTkZqn3CkB9p4B1ByGfCJaJyIVdCleVFxunP54PzQ6GLTRw4twyJ7z49Kgn1MU1jj', 'en', '2019-09-08 15:13:09', 'fkThfwI2Lds:APA91bFDbL-jz5yv4icAWu9M9ljzpn7FCz9Fp5EBNCuhSRQgAEouWAaht1ijHWdBmOBKd0uczykYDoGH-rqXdllx6KOyrI2xo-QkFhkCdW9fTnZ2ooqAJNGbyf97uaJbuKHJOlOgRMLs', 'aliahmedcs132@gmail.com'),
(25, 'https://shipit.projects.tmtgps.me/uploads/users/rkrqLtaWqjAky9oF.jpg', '+20', '+201005361058', 'Youssef', '$2y$10$cdBWp9zrlGmKc/vsCQxnl.Oo4DIe03n3VaYDd82c1Hyhkd/kM7FS6', 1, 1, 'otayRcHlQ7ZKoZ0JyKAnvhq0io3YC5IqyB2MHLGtagfOfavc0xhHLXrwLZKNQnsuJh8An', 'en', '2019-09-08 17:33:09', NULL, NULL),
(26, 'https://shipit.projects.tmtgps.me/uploads/users/WtdbRSqE8TAQE3ZZ.jpg', '+20', '+201000521543', 'fofo toto', '$2y$10$oy4GmrweihI7Uyux5aZjNuTkiCpvpAqGqovnvTMWkaeRVYgz0dO3.', 1, 1, 'B9UhbuDKPR9jdWNu1Umv642m1m2vqaKdNCy8YuyGeB6pcvr4bLleee5rBA4xQgy1L1BFq', 'ar', '2019-09-08 18:03:09', NULL, NULL),
(27, NULL, '+20', '+201014141604', 'tawfik', '$2y$10$l3axoTC0l6BMmdAPIBgAJ.d0xEIFVsRImhzo0oa/YUsBXJtbZYy6q', 1, 0, 'kOoAleYsN7PzQcvSjY8FdHvQylMgTtNL7RC6nwtPBtjeADtfVH3oq7Hc2goNnzGAFQRwF', 'en', '2019-09-11 17:31:09', NULL, NULL),
(28, 'https://shipit.projects.tmtgps.me/uploads/users/vV7Kp2veKLP4qUiQ.jpg', '+20', '+201000741258', 'test2', '$2y$10$GnhMh7rEow6KM/QOc/9RzOCALdAEtebwEQ/h6ipWAwN1gjQLELRRS', 1, 1, 'VHIbt7rcDCQtFIuRzPCelez9bxgneE2L0FKxKJ0YAmtFXYkPTCobvKTdCwRRX5xav5jX6', 'en', '2019-09-15 13:32:09', 'epdcBgXhU-I:APA91bEjoaQtMcSa4mAYKT11laUKjLmulXRgZxZOq6j2wxSWSNViG2DIVG-Gk1PwCFud3y2RJ_vD0NhLDIOwM7ujMnaEyXicds8aL4X6chKH2Tu8rW-QYcDR-_kPJw2wLwJm0Tet-78H', NULL),
(29, NULL, '+20', '+201000852147', 'ay 7aga', '$2y$10$RlBCq7vAJwpZTxBDXXE37u08sHmWGPsa6iJ8mnqdFYr4NIHwRWeEi', 1, 1, 'TCCewmUwRqDrpV2y50UK0Nr0XRfUZFzoSgOBK2BsUgZ68XjnfsKPkZRcgB0vNaI7JGM5U', 'en', '2019-09-15 13:34:09', NULL, NULL),
(30, NULL, '+20', '+201000741259', 'udududud', '$2y$10$BARgrVkPaLKY.QTL7aB0heWBYQT6mUIE5pgkQ7fp/uYoW3tn7W6gK', 1, 1, 'bYdRnKljvrGNeYJX4sQJkjzqDF7se7JZBkJ0F2B0gClSgw7KMItcmHHvRsP1p3ZyZYOJq', 'en', '2019-09-15 23:32:09', NULL, NULL),
(31, NULL, '+20', '+201555088104', 'ali', '$2y$10$ntHphVkczR3TpGrio8PlEe6IrlO0ARY8blIkPq.YTkp.J16aKGEBO', 1, 1, 'Dh5z26PtiQ0PDhNnnI1STeC9d6MckA8Bab0DvEWXM8YQlq2ETbUDHIYrH4ST9jI2isX6r', 'en', '2019-09-16 13:14:09', 'cMX-SA7T6XE:APA91bEO9I_lIZiSs1mcuBY09ADf62LmB6MimxfUsDInO6kjunvkZBHJV_H8i6NCeBakQIZdNLc2nQI0Yl5egp8FqQojfu10g0Mz7FTiQZ0T49gM9x5MKrSszDDtShzz5tRUGFGBIm07', NULL),
(33, NULL, '+20', '+201223456788', 'hhhhh', '$2y$10$snReOsg4MsmWOVReLGkMfuMlRZ9T6NNPIqBrrWNH49JB7Qb/mE5Ay', 1, 1, 'AMawXoQV3umZzxg6yZzQVT5slJOxxdb48YJUFr4r7jPQKi4FlbWU8gAbADN1nINiW2sat', 'en', '2019-09-23 11:19:09', 'e06oriXdh7k:APA91bF55Kn8cI9_u0cOc0BnBs6UyrXGGXHd9c10c-fwgz9UvJScZ2_oejZFrGFrUiq9_yNymUzB4KSf8TcTx6W800s2xSHHhDhw5N7jPWQ23SHwVfAK3cYdeVzR1-KNiSG-IiShaSb3', NULL),
(34, NULL, '+20', '1234567899', 'hend', '$2y$10$dqeTdxFCKgTAfK2LGqHGre/GXYxPo3g06Z8quFhNZgfHcG1OUJ.gu', 1, 0, 'DLa1jjPVN48KjRjhkVdmU2m6K9FYjnZZteXnC6ZOc0UPOjOtHFmhgSE7Ne9lGRQjassHG', 'ar', '2019-09-23 11:22:09', NULL, NULL),
(35, NULL, '+20', '+201282828328', 'henz', '$2y$10$60GVhROVD2A0ercnK.0Jnecvkqq1s5aq6qEVe2NigwqbrkSEvaWz.', 1, 1, 'PzgrT3PaS1hjSS3ktkbxaXBKwBcYXUvi0hpLXyUIIqR2X3nO89CijIVuvALh1FNZdmJCd', 'en', '2019-09-23 11:26:09', 'eyp8fZ-MwDk:APA91bF8r09xBubJsPz4h3zAZEkBgimtWXkX16n-NvJaYh1la-koZtGVx75kYWrmWlcmptPKyGNujjKg9WEdTkoYjFQ4rJYUXpoDJEZoUJ8L-KIhL4Y_xm_k4g3KJYfdJOdeyhgBqI0p', NULL),
(36, NULL, '+20', '1234567891', 'hend', '$2y$10$GbE8w43Q/gVbRIkXFGBJLOYbROcjynrS9WCbCscxrXcKqvmFelm9W', 1, 1, 'bJs4kRGtrzGmgB06iY6H1nHQL0K3lrfQ1WlXLe3MnJcEpYvxxZ7RgJPyaQKJRgiRuCfmg', 'en', '2019-09-23 12:43:09', NULL, NULL),
(37, NULL, '+20', '201234567891', 'hend', '$2y$10$BG59X7MxomvyA11OEPXUwOhIF/oZ7ClTv7MXlWyoK2EmFnsTwsVQy', 1, 0, 'pgGW2Hkfa5ROOLHv4TsC8Ge3jSU4X6p7l4n2JhjMS3qWhyz81epl2O6bp05HkQ1hNWeaT', 'en', '2019-09-23 13:13:09', NULL, NULL),
(38, 'https://shipit.projects.tmtgps.me/uploads/users/ljvM0jaLJ3Ca80wf.jpg', '+20', '011142284872', 'mostafa  mahmoud', '$2y$10$FKdWY7xIPboo7K4iajzifeTb6oXoyooX.ertkSTrS19LyttEBGIEi', 1, 0, 'UkAfm9C6JwbRCssR5ir0LRrlnaiUUNcg7qBP08HIGSHu9CpkLqUdLbboHnohLsXs7ghWY', 'ar', '2019-09-23 14:20:09', NULL, NULL),
(39, 'https://shipit.projects.tmtgps.me/uploads/users/igJHDV9r363X0TMs.jpg', '+1234', '01234567891', 'mostafa', '$2y$10$7McsmMOZys7OtHCpLaMyqOW7NdyJrwxE9X4Qy5xEkArLkoZqztrAu', 1, 0, 'FYKmZ1Rc3gVv0LBXwo1CNJmNbIIzvqxUtjb73Zeqnpk7kvjsky6heNYYuma5lNbv3Xs9B', 'en', '2019-09-23 14:50:09', NULL, NULL),
(40, 'https://shipit.projects.tmtgps.me/uploads/users/HjvVqyc7NnRh4eTs.jpg', '+20', '+201234567812', 'mostafa', '$2y$10$gQNsTbd4E1xM5lB82BiSZOBla4uotQa5pn5iKFkf62hM4ZGdKTJq.', 1, 1, 'KdpRV09eA7EWBdnAX3TXgCDjQ26ukhzAkrwm25Ie6pmdMgjAZh3YiRRufo7TGNBsuObbc', 'en', '2019-09-23 15:04:09', 'e06oriXdh7k:APA91bF55Kn8cI9_u0cOc0BnBs6UyrXGGXHd9c10c-fwgz9UvJScZ2_oejZFrGFrUiq9_yNymUzB4KSf8TcTx6W800s2xSHHhDhw5N7jPWQ23SHwVfAK3cYdeVzR1-KNiSG-IiShaSb3', NULL),
(42, NULL, '+672', '+201122334477', 'test', '$2y$10$IEOXyiT17dUDM2IFwdV3JOOsll3/WDjXjSY5VbJEwENmmfQjVLy0G', 1, 1, '3Zay0rnzDtnDNmtzTIw04sKSyygP9Aprbip1w8JYCTyWUqrDSdiqU7LZUHfrkgdG5frEV', 'ar', '2019-09-23 16:04:09', 'e06oriXdh7k:APA91bF55Kn8cI9_u0cOc0BnBs6UyrXGGXHd9c10c-fwgz9UvJScZ2_oejZFrGFrUiq9_yNymUzB4KSf8TcTx6W800s2xSHHhDhw5N7jPWQ23SHwVfAK3cYdeVzR1-KNiSG-IiShaSb3', NULL),
(43, NULL, '+20', '+20111422848785', 'mostafa ramdan', '$2y$10$0YUnqETImHmyHnHvWn1PsuLVuRyHYyQ60aY917lJOm6jXPRVHh0Sy', 1, 1, 'dEIbiuX9cQxiaW5b5WFppkd1kSgIlCefZJJQA6o457dC1m4iPIdriAWFnEP6KGcqb5PPF', 'ar', '2019-09-23 16:06:09', NULL, NULL),
(44, NULL, '+20', '+201023456798', 'ahmeed', '$2y$10$z7Zh.5euhesukY17V/l7d.yUylcs/RbuLM2C.GjqLeyMSzulzs7qC', 1, 1, 'DLIF86DToxc82VoB3XUsMRJ2nsZonX10YtWHgf2QRjqcakpfTny72FJqZISvsaeMCa8TK', 'en', '2019-09-29 15:27:09', 'fDVHcyK8XHc:APA91bHyvZ9hgpSQsY7KCDeRbKifTlYaXv_w5A6YzVYUwHSl21XQJuzKH-0-UH7F30BX4Mhmcnuz_vAlf8ZW_7frkgRgK-JZyuYFgKCUEST0DktynzlUgJubvllzl_g3Ddy1y5Y-fQNU', NULL),
(45, 'https://shipit.projects.tmtgps.me/uploads/users/jFO78Pv1e5z4vcOT.jpg', '+20', '+201000521541', 'mahmoudwalker', '$2y$10$f8GCSqv6bJOGnhSrUrs0mukmpCuwvdCuN4dXrpx1LtOsdVrnTqgyG', 1, 1, 'j9z5dO8zLOeM4LPYjdnLNn6WlS5iwlsJYUZm2F3O4CdgdRL15VgaAtcbjlBRFtHR4KAae', 'ar', '2019-10-06 14:28:10', 'c9bC_glLNVE:APA91bERq-Ig_dkGBWjzsZUB8hy9gcp6it4l6sUgs8y6i0KbTziSWOsHGtIUFy27bBbPSob2KlHxgCandyVW0ua99R__-n1S82Ky1A_UaboZoy1LM_j6UEdxHzNCu3ww7UC7bGU8-bfO', 'mahmoudwalhom@gmail.com'),
(46, NULL, '+966', '+966547266664', 'AHMED', '$2y$10$n4M3wZX1jxvYsK0F8Gqrt.m.QXwK6gH6OvSTcggHhzoyVrVNzdx32', 1, 0, 'EZ2C3R4xRhJyJMBOyQiYvmCUIdGf1gtlTfrnElxdZmEuDOzXbIm4BITjnLH6xlP1CkmXr', 'en', '2019-10-22 13:22:10', NULL, NULL),
(47, NULL, '+966', '+966541444948', 'Ahmed', '$2y$10$ZnTWuGopbs1zuxGuZBiwEOvpZ3RMZBnM4U6LbzfDKMy15UohrBFiO', 1, 1, 'Yu0PMA0atrj8HVDdkLThbQJG8h5gLMf8Wd1zAXr6XRcaGxftwnikizQvJdPbLdzEgjqXG', 'en', '2019-10-22 13:42:10', 'eAFffX10xgw:APA91bFJXd-JR9XSECfXUI2L8lohKgtqj2xcTSV6OSnnaHtfUcc83TCtN3W9XIicQ_jGdnH0t__n9uw60wiqdadoLaMvFfqyuut7wAQjqFA5Zfp3MEnOkqKk0RTs2igA4PqRx92X3gXk', NULL),
(48, NULL, '+20', '+201551610948', 'ali', '$2y$10$qNhH0KPyxssqpZ//saCpR.6uvt3tFI4OFOSCQSty8Ca9hw24et2Zu', 1, 1, 'V5cqpjJsampomUdAUWK945WVruIZJMFNbjALSISnZJepb9CQbrhQojt0obJ1fh9OfMJrI', 'en', '2019-11-24 18:05:11', 'd0sP9Fiaipw:APA91bHv_-enxsExvn9M6JDjexVm5sExC-E6jaw_Cy7gkSVWayhndrTB6e3VGz_akE8OIagaG6ARqlKxNKi8jQdraK4pOFS1MX6h4xWd5CBVQG-DUrSc1VkWPJR30hxh0HELtonf-2JF', 'aliahmedcs001@gmail.com'),
(49, 'https://shipit.projects.tmtgps.me/uploads/users/pBglKR9yXViw9W3g.jpg', '+20', '+201128661677', 'mahmoud2', '$2y$10$FGyaTmkZHVd5WaJD9EwBkebU642fz/QFmZilkYj0HX6YVuuiVS22m', 1, 1, 'f5HJiGtTKOmWTDXn0xuVmuY8EUeO1qTIS6zZcfWIzMiKqLXFMSZgZCzN6JzFb6z1eOBnP', 'ar', '2019-11-24 18:17:11', 'fT9L8O28Wtk:APA91bF_hufbPmxmU2R2eZH3dFyyqUhfrUoA3mcgCgE5oQaEe283iuWY5fmVCahXxxR_NVpszjDneEIRnEllJg_A2Y8wHI0DKGgoZpsVvRpg0n0hiCgS-KuXOl90yrCJrHMZidUXUehy', 'aaaar@magdsoft.com'),
(50, NULL, '+20', '+2011500936925', 'mahmoud', '$2y$10$eDc8APrKkdu6aX9iS9a1ueHxTcnpP46rH0XIn2OIOz24.P7cQvCeu', 1, 0, 'Q1VuHwgaJ5BaKWgPil3V0pAaDZ2u0VjCY5OC89iYY11nXUoAL0yKNlB8NX8XORleJK0HO', 'en', '2019-11-24 18:23:11', NULL, NULL),
(51, NULL, '+20', '+20115036925', 'mahmoud', '$2y$10$unfGhp6QBY1MXg2Zht8uc.PMYm2/.PRnBoGYrO2Hbt2cL.3nF0D2q', 1, 0, 'I4UebBV2hybPkntIapcGaF8KFyaSkdCW442IQOXezZepJkPUO97e41LPz4O9X4K7MsMvd', 'en', '2019-11-24 18:29:11', NULL, 'alawy@gmail.com'),
(52, NULL, '+20', '+201150306925', 'mahmoud', '$2y$10$NEG.A3iSgchC8oLdWdcUX..728y9EIcW6QqB3FYrxCCP36XTqEXbi', 1, 0, 'G3gFAjBVe6HEBFKVsJfr16kbuGNpw8uWIlZ96RL0S1i9ezJpEQQ3xTzfGcPA5burxo5TT', 'en', '2019-11-24 18:29:11', NULL, 'alaw0y@gmail.com'),
(53, NULL, '+20', '+201122444477', 'hamada', '$2y$10$GjDP.VGjahv6rKhFNtscNu.Vb41IEz3tLtsJVXUBlISuHUC3LVjaO', 1, 1, 'ivSgq70LHQgzyuH5QvX4oQBl2itVAlxKirdOJ7I8zNtzME2W6tb2O9hWYLZ8Bksx3HH44', 'en', '2019-11-24 18:36:11', 'd0sP9Fiaipw:APA91bHv_-enxsExvn9M6JDjexVm5sExC-E6jaw_Cy7gkSVWayhndrTB6e3VGz_akE8OIagaG6ARqlKxNKi8jQdraK4pOFS1MX6h4xWd5CBVQG-DUrSc1VkWPJR30hxh0HELtonf-2JF', 'body@gmail.com'),
(54, NULL, '+20', '+201155122233', 'helpawy', '$2y$10$z.G3UVeaioK6BTYz3RtFPuGojhu4lz3kVyh7KNaJOK04JZTPFjnKi', 1, 1, 'az80u3AoZ19wCYaHwSqrff8g9jncZjCO2wirT1GezsMcjfo559dkROjqUAHnHPcNTuq9l', 'en', '2019-11-24 18:56:11', 'd0sP9Fiaipw:APA91bHv_-enxsExvn9M6JDjexVm5sExC-E6jaw_Cy7gkSVWayhndrTB6e3VGz_akE8OIagaG6ARqlKxNKi8jQdraK4pOFS1MX6h4xWd5CBVQG-DUrSc1VkWPJR30hxh0HELtonf-2JF', 'watan@yahoo.com'),
(55, NULL, '+20', '+201122334456', 'poplo', '$2y$10$RN4KMPEsI/39sbUnHGT0aOcv7.EyAjfR0MwIe7L2swbX8iYu2z5Ya', 1, 1, 'XVQ6G5ZqCTYMImQdNPmTvOuX7KtosXe0eXFa7LHQI5zekfNCSCsyXX77QIqUJC5zMmrap', 'en', '2019-11-24 19:05:11', 'd0sP9Fiaipw:APA91bHv_-enxsExvn9M6JDjexVm5sExC-E6jaw_Cy7gkSVWayhndrTB6e3VGz_akE8OIagaG6ARqlKxNKi8jQdraK4pOFS1MX6h4xWd5CBVQG-DUrSc1VkWPJR30hxh0HELtonf-2JF', 'enta@gmail.com'),
(56, NULL, '+20', '+201128661645', 'aaaaaaa', '$2y$10$fAyItVH4oxOQE2zGSEM9eOFRVPHXM/MzEAbM9zRUyBEJybmHrRwaS', 1, 1, 'LKJf7RHQqMjVEImE2TJrqJPUDMOEudhdOHfhQvia3lPklh21eUlXLKV1nhv17MvEMdkcS', 'en', '2019-11-24 21:41:11', 'ePPUA8hoMuI:APA91bF3ymny3UNSm320YK8UJZpUK-Cm9qx_tnSfxNiACJctRuHVXDeLZ8gKoA_q-j-d3qcY39lDGL5w-KscjTm8vtyJ8E_23hg16bPZfTvONYSj3_xGodSGRiabsTJPLyBrWq9d0fV_', 'aaaqwddde@gmail.com'),
(57, NULL, '+20', '+201128661643', 'ahmed', '$2y$10$xpo8gLKsp14EmfiNV9z7u.Dx2fE0TXkiGfofKy5h5/N88XG9hFzba', 1, 1, 'HjjTLU4As3jR2UWBNzvxaNt9BCjvLWOzWJM4phLpYfMaVmH90tQGpS26ozeRrq4rY6Bz8', 'ar', '2019-12-02 12:58:12', 'fx76-SyRGC8:APA91bFDlAkE-0Mp6VWZ8-S0dMMdlkrcp14xEMyx7d7ZryYX-RgMyW9tLV5vupEgh33yu6disvlN11ApOLYjzjBEzTEmCijZDhRgevuLC2LKgFdGi3ZOjBFDXUkhl-krjmEgZYAEXSh9', 'ahmed@yahoo.com'),
(58, 'https://shipit.projects.tmtgps.me/uploads/users/NEW4zhBl5iWJeOxL.jpg', '+20', '+201093416333', 'ahhhh', '$2y$10$q7swBun.qQsCpHrNe2y6wubby8h9i3XuaglODjuRGMPTTnVHUKgBa', 1, 1, 'dULheOVINxCVzgs24S5kVYdtDnIZjzt2VA0hhklmBKA8wfAyhvs2o4Uugsy7UnAMEWUrH', 'en', '2019-12-02 13:02:12', 'dn77UpLCTlA:APA91bGgBeY0FQCU0Kux1xcughQg4q6ppvd0psoJfS_ii5ei77oRPAdT3BOUG6K6qYSFeVDM-ZAWj1tDpIFBaLks_nWw8z-fLf124R5Ka-uiLDRQe3fTjxMZwsxDwd0mNVxub3UeAsmC', 'addd@yahoo.com'),
(59, NULL, '+20', '+201002701003', 'Mahmoud', '$2y$10$x2DncNsewZENwWx0tgNhnOFMnJK2mpIZ.rri8K1hNqgHTvbO9L0pe', 1, 1, '79KDg62h8vOPCfStlmkQ3tGKXcuXNxqyzTF1ZhinpqIvrhGD7b3mdbGUxqVqnjTenij1J', 'en', '2019-12-02 13:44:12', 'ePPUA8hoMuI:APA91bF3ymny3UNSm320YK8UJZpUK-Cm9qx_tnSfxNiACJctRuHVXDeLZ8gKoA_q-j-d3qcY39lDGL5w-KscjTm8vtyJ8E_23hg16bPZfTvONYSj3_xGodSGRiabsTJPLyBrWq9d0fV_', 'Mahmoud@yahoo.com'),
(60, 'https://shipit.projects.tmtgps.me/uploads/users/EhaFuWSMLl1sazgi.jpg', '+20', '+201002701005', 'ahmed mohamed ahmed mohamed Aly ahmed mohamedah gjjhgg', '$2y$10$GYhNAN4tiLuwcd7MJwwMluW3o3qtsG1wRUEtopmAdxOOzuAI4jSc6', 1, 1, 'TNLsi665CMraKBOrjZtqIqU6GYj6rHjJKoK8ck4dWRx9VAwbTHwatkiD9X1pLBljPgLE0', 'ar', '2019-12-02 13:55:12', 'clERR_JsfFg:APA91bH831NHDIdFQsI7saXy-D0m6mlLhWF4_V9BFSO3RVQidOewFuHrysiY4d5MzuC9ipcJ7Ndf3VzU6G_6A6K2fb1kyrZnsvGyQ0N8azuLrjpK4ANBnKwj3SQeNlFURqnaZRGUYH9g', 'bbhjjjjhv@yahoo.com'),
(61, NULL, '+966', '+966501234567', 'mahmoud ‎wahab', '$2y$10$g.63RizX.5TMBgb431/HYuvhtTFnYlAbpSjP8GKuKLXEi4QuM6QQW', 1, 0, 'taCXgs5tj3NjstwS9amAUmccQ3qNxBIGQAyR5C2vxiWGpND2XG8z6MFNGDfsu0EDf3I0Y', 'ar', '2020-06-28 18:08:06', 'c1wrBG07y5M:APA91bEbWBqZj6RbQZt_-gfw4tH9QHKP2NlPaN6UsmJgsfd1t-nPO0QRqon0m-LXXLIc5ZBsHXcXMnSfG4og3T3SOjMHyexlv7N9gwmfAeNgUTugq2BY-GUnhbsRwSiVzvX07Z6_8ZfE', 'asdf@gmail.com'),
(62, NULL, '+966', '+966541234567', 'mah ‎aa', '$2y$10$F9cMSj0tkXkRcAmox4oLVu2ZlH68kt7F9ii3Pte450NPUNJkFDc6.', 1, 0, 'D3nPcosnIhleAeSLcpomMWzwR6XP0tf8BbkAtkrpPQTSza1BfHSMiqsaRaEBVUBEHVmX2', 'en', '2020-06-28 18:42:06', NULL, 'qwe@gmail.com'),
(63, NULL, '+966', '+966541234566', 'wwwwwwww', '$2y$10$2zrq6Smz5oB5VOP3fvbUX.1Uqq4H2x.CDPA3JUi08d6VxL5g.Tcmu', 1, 0, 'QOT7Vl2d3eCEMUc478oFc9lL9Ru9F9eY5cOKJeK5GJrocjsptMi3A05JPCYyQK5Dbeqdc', 'ar', '2020-06-28 18:47:06', 'c1wrBG07y5M:APA91bEbWBqZj6RbQZt_-gfw4tH9QHKP2NlPaN6UsmJgsfd1t-nPO0QRqon0m-LXXLIc5ZBsHXcXMnSfG4og3T3SOjMHyexlv7N9gwmfAeNgUTugq2BY-GUnhbsRwSiVzvX07Z6_8ZfE', 'aaasds@gmail.com'),
(64, NULL, '+966', '+966541237896', 'qwwweee', '$2y$10$0.buoyf81ykJhwZvPvDgdue4S8fRNlaa72PLGy.WBNuLi37uxR0je', 1, 1, 'sXwHXBwWBvno2vvHDcVwyInKRtUuGzObw3SbNaGWGur6xIap2fKXzzhOaNpZxCvVQoH1z', 'ar', '2020-06-28 19:20:06', 'fgreO4oBSPg:APA91bEEjxfvXBvBzwu-XJgCTOeGLvB_29mAGLnhacC9yFprDOanQHRkYjIffUzWfcS29ODe4i66OJ6xaR4lxUgtPt4lmYgkDM6QqDy3qnvAMEQR0Hh98B7HaI6mch5yqfQSjpIai4x4', 'qwera@gmail.com'),
(65, NULL, '+232', '002011142284556', 'mostafa', '$2y$10$IJ62iKsa87B5lxta0bXgoe5PEdLIZI1lPP7ZKKFqMzN1d3bF12jRG', 1, 0, 'jPtgiQms9zMKqle0J5Y6NPP1nK328rb6v0607YcIZ2jYSVRrpZUxUg2gI6Qkzurc8iD7W', 'en', '2021-02-22 20:01:02', NULL, 'mostafaramdan5544@gmail.com'),
(66, NULL, '+232', '0020011142284556', 'mostafa', '$2y$10$gqZ.SY0qUTs3A5N/7MTWo.sSbQW0l9G0mGkX6aALJ9Vglb6a4EYsi', 1, 0, 'KTKaKBIVAhsm6EKwMTzFopnh7T9OdPgfOCnNuqOjh3uCwN7cn1kUaSNjoGy1yc5LlcWT4', 'en', '2021-02-22 20:06:02', NULL, 'mostafaramdan55440@gmail.com'),
(67, NULL, '+20', '00201114228488', 'ahmed', '$2y$10$stjOekw4woDK8NfwX7GfreW8fbGXnuUzb1787O.Ral/qXQG0uoRDG', 1, 1, 'TIN7VLb2m3FOwCv6mKUsp9bSU0wLVdWvhU9rpU91B0BlswHMNViPtbznwTZuDDWHIMsGd', 'en', '2021-02-22 20:08:02', NULL, 'mostafaramd0an55440@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `users_has_discount_code`
--

CREATE TABLE `users_has_discount_code` (
  `users_id` int(11) NOT NULL,
  `discount_code_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users_has_discount_code`
--

INSERT INTO `users_has_discount_code` (`users_id`, `discount_code_id`) VALUES
(14, 3),
(60, 25),
(60, 27),
(67, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`id`,`orders_id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `orders_id_UNIQUE` (`orders_id`),
  ADD KEY `fk_bills_orders1_idx` (`orders_id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_contacts_users1_idx` (`users_id`),
  ADD KEY `fk_contacts_drivers1_idx` (`drivers_id`),
  ADD KEY `fk_contacts_contacts_types1_idx` (`contacts_types_id`);

--
-- Indexes for table `contacts_types`
--
ALTER TABLE `contacts_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `discount_code`
--
ALTER TABLE `discount_code`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `code_UNIQUE` (`code`);

--
-- Indexes for table `drivers`
--
ALTER TABLE `drivers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_drivers_trucks_types1_idx` (`trucks_types_id`),
  ADD KEY `fk_drivers_companies1_idx` (`companies_id`),
  ADD KEY `fk_drivers_locations1_idx` (`locations_id`);

--
-- Indexes for table `drivers_temporary`
--
ALTER TABLE `drivers_temporary`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_drivers_trucks_types1_idx` (`trucks_types_id`),
  ADD KEY `drivers_id` (`drivers_id`);

--
-- Indexes for table `emails`
--
ALTER TABLE `emails`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `financials`
--
ALTER TABLE `financials`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_financials_drivers1_idx` (`drivers_id`);

--
-- Indexes for table `goods_types`
--
ALTER TABLE `goods_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_notifications_orders1_idx` (`orders_id`);

--
-- Indexes for table `notify_users`
--
ALTER TABLE `notify_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_notify_users_users1_idx` (`users_id`),
  ADD KEY `fk_notify_users_drivers1_idx` (`drivers_id`),
  ADD KEY `fk_notify_users_notifications1_idx` (`notifications_id`);

--
-- Indexes for table `offline_payment`
--
ALTER TABLE `offline_payment`
  ADD PRIMARY KEY (`id`,`bills_id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `bills_id_UNIQUE` (`bills_id`),
  ADD KEY `fk_offline_payment_bills1_idx` (`bills_id`);

--
-- Indexes for table `online_payment`
--
ALTER TABLE `online_payment`
  ADD PRIMARY KEY (`id`,`bills_id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `bills_id_UNIQUE` (`bills_id`),
  ADD KEY `fk_online_payment_bills1_idx` (`bills_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_orders_users1_idx` (`users_id`),
  ADD KEY `fk_orders_trucks_types1_idx` (`trucks_types_id`),
  ADD KEY `fk_orders_goods_types1_idx` (`goods_types_id`),
  ADD KEY `fk_orders_locations1_idx` (`locations_pickup_id`),
  ADD KEY `fk_orders_locations2_idx` (`locations_destination_id`),
  ADD KEY `fk_orders_drivers1_idx` (`drivers_id`),
  ADD KEY `fk_orders_companies1_idx` (`companies_id`);

--
-- Indexes for table `phones`
--
ALTER TABLE `phones`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `price_list`
--
ALTER TABLE `price_list`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_price_list_trucks_types1_idx` (`trucks_types_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_reviews_drivers1_idx` (`drivers_id`),
  ADD KEY `fk_reviews_users1_idx` (`users_id`),
  ADD KEY `fk_reviews_orders1_idx` (`orders_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_sessions_users_idx` (`users_id`),
  ADD KEY `fk_sessions_drivers1_idx` (`drivers_id`),
  ADD KEY `fk_sessions_orders1_idx` (`orders_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `trucks_types`
--
ALTER TABLE `trucks_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_trucks_types_trucks_types1_idx` (`trucks_types_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD UNIQUE KEY `phone_UNIQUE` (`phone`);

--
-- Indexes for table `users_has_discount_code`
--
ALTER TABLE `users_has_discount_code`
  ADD PRIMARY KEY (`users_id`,`discount_code_id`),
  ADD KEY `fk_users_has_discount_code_discount_code1_idx` (`discount_code_id`),
  ADD KEY `fk_users_has_discount_code_users1_idx` (`users_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `bills`
--
ALTER TABLE `bills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=229;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `contacts_types`
--
ALTER TABLE `contacts_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `discount_code`
--
ALTER TABLE `discount_code`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `drivers`
--
ALTER TABLE `drivers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `drivers_temporary`
--
ALTER TABLE `drivers_temporary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `emails`
--
ALTER TABLE `emails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `financials`
--
ALTER TABLE `financials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `goods_types`
--
ALTER TABLE `goods_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=533;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=753;

--
-- AUTO_INCREMENT for table `notify_users`
--
ALTER TABLE `notify_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=772;

--
-- AUTO_INCREMENT for table `offline_payment`
--
ALTER TABLE `offline_payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `online_payment`
--
ALTER TABLE `online_payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=246;

--
-- AUTO_INCREMENT for table `phones`
--
ALTER TABLE `phones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `price_list`
--
ALTER TABLE `price_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=535;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `trucks_types`
--
ALTER TABLE `trucks_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bills`
--
ALTER TABLE `bills`
  ADD CONSTRAINT `fk_bills_orders1` FOREIGN KEY (`orders_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `contacts`
--
ALTER TABLE `contacts`
  ADD CONSTRAINT `fk_contacts_contacts_types1` FOREIGN KEY (`contacts_types_id`) REFERENCES `contacts_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_contacts_drivers1` FOREIGN KEY (`drivers_id`) REFERENCES `drivers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_contacts_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `drivers`
--
ALTER TABLE `drivers`
  ADD CONSTRAINT `drivers_ibfk_1` FOREIGN KEY (`companies_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_drivers_locations1` FOREIGN KEY (`locations_id`) REFERENCES `locations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_drivers_trucks_types1` FOREIGN KEY (`trucks_types_id`) REFERENCES `trucks_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `drivers_temporary`
--
ALTER TABLE `drivers_temporary`
  ADD CONSTRAINT `drivers_temporary_ibfk_1` FOREIGN KEY (`drivers_id`) REFERENCES `drivers` (`id`),
  ADD CONSTRAINT `drivers_temporary_ibfk_2` FOREIGN KEY (`trucks_types_id`) REFERENCES `trucks_types` (`id`);

--
-- Constraints for table `financials`
--
ALTER TABLE `financials`
  ADD CONSTRAINT `fk_financials_drivers1` FOREIGN KEY (`drivers_id`) REFERENCES `drivers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `fk_notifications_orders1` FOREIGN KEY (`orders_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `notify_users`
--
ALTER TABLE `notify_users`
  ADD CONSTRAINT `fk_notify_users_drivers1` FOREIGN KEY (`drivers_id`) REFERENCES `drivers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_notify_users_notifications1` FOREIGN KEY (`notifications_id`) REFERENCES `notifications` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_notify_users_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `offline_payment`
--
ALTER TABLE `offline_payment`
  ADD CONSTRAINT `fk_offline_payment_bills1` FOREIGN KEY (`bills_id`) REFERENCES `bills` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `online_payment`
--
ALTER TABLE `online_payment`
  ADD CONSTRAINT `fk_online_payment_bills1` FOREIGN KEY (`bills_id`) REFERENCES `bills` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_orders_companies1` FOREIGN KEY (`companies_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_orders_drivers1` FOREIGN KEY (`drivers_id`) REFERENCES `drivers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_orders_goods_types1` FOREIGN KEY (`goods_types_id`) REFERENCES `goods_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_orders_locations1` FOREIGN KEY (`locations_pickup_id`) REFERENCES `locations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_orders_locations2` FOREIGN KEY (`locations_destination_id`) REFERENCES `locations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_orders_trucks_types1` FOREIGN KEY (`trucks_types_id`) REFERENCES `trucks_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_orders_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `price_list`
--
ALTER TABLE `price_list`
  ADD CONSTRAINT `fk_price_list_trucks_types1` FOREIGN KEY (`trucks_types_id`) REFERENCES `trucks_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `fk_reviews_drivers1` FOREIGN KEY (`drivers_id`) REFERENCES `drivers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_reviews_orders1` FOREIGN KEY (`orders_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_reviews_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `fk_sessions_drivers1` FOREIGN KEY (`drivers_id`) REFERENCES `drivers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_sessions_orders1` FOREIGN KEY (`orders_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_sessions_users` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `trucks_types`
--
ALTER TABLE `trucks_types`
  ADD CONSTRAINT `fk_trucks_types_trucks_types1` FOREIGN KEY (`trucks_types_id`) REFERENCES `trucks_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users_has_discount_code`
--
ALTER TABLE `users_has_discount_code`
  ADD CONSTRAINT `fk_users_has_discount_code_discount_code1` FOREIGN KEY (`discount_code_id`) REFERENCES `discount_code` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_users_has_discount_code_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
