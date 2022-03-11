-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 22, 2021 at 07:10 PM
-- Server version: 5.7.32-cll-lve
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
-- Database: `hukosvex_pro`
--

-- --------------------------------------------------------

--
-- Table structure for table `bank_accounts`
--

CREATE TABLE `bank_accounts` (
  `id` int(11) NOT NULL,
  `bank_name` varchar(225) NOT NULL,
  `bank_sube` varchar(225) NOT NULL,
  `bank_hesap` varchar(225) NOT NULL,
  `bank_iban` text NOT NULL,
  `bank_alici` varchar(225) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` text COLLATE utf8mb4_bin NOT NULL,
  `category_line` double NOT NULL,
  `category_type` enum('1','2') CHARACTER SET utf8 NOT NULL DEFAULT '2',
  `category_secret` enum('1','2') COLLATE utf8mb4_bin NOT NULL DEFAULT '2',
  `category_icon` text COLLATE utf8mb4_bin NOT NULL,
  `is_refill` enum('true','false') COLLATE utf8mb4_bin NOT NULL DEFAULT 'false'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`, `category_line`, `category_type`, `category_secret`, `category_icon`, `is_refill`) VALUES
(1, 'faizullah', 1, '2', '2', 'faizullah', 'true');

-- --------------------------------------------------------

--
-- Table structure for table `childpanels`
--

CREATE TABLE `childpanels` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `domain` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `currency` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `child_username` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `child_password` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `charge` double NOT NULL,
  `status` enum('active','terminated','disabled') COLLATE utf8_unicode_ci NOT NULL,
  `renewal_date` date NOT NULL,
  `date_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `client_id` int(11) NOT NULL,
  `name` varchar(225) NOT NULL,
  `email` varchar(225) NOT NULL,
  `username` varchar(225) NOT NULL,
  `password` text NOT NULL,
  `telephone` varchar(225) DEFAULT NULL,
  `balance` double NOT NULL DEFAULT '0',
  `balance_type` enum('1','2') NOT NULL DEFAULT '2',
  `debit_limit` double DEFAULT NULL,
  `spent` double NOT NULL DEFAULT '0',
  `register_date` datetime NOT NULL,
  `login_date` datetime DEFAULT NULL,
  `login_ip` varchar(225) DEFAULT NULL,
  `apikey` text NOT NULL,
  `tel_type` enum('1','2') NOT NULL DEFAULT '1' COMMENT '2 -> ON, 1 -> OFF',
  `email_type` enum('1','2') NOT NULL DEFAULT '1' COMMENT '2 -> ON, 1 -> OFF',
  `client_type` enum('1','2') NOT NULL DEFAULT '2' COMMENT '2 -> ON, 1 -> OFF',
  `access` text,
  `lang` varchar(255) NOT NULL DEFAULT 'tr',
  `timezone` double NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`client_id`, `name`, `email`, `username`, `password`, `telephone`, `balance`, `balance_type`, `debit_limit`, `spent`, `register_date`, `login_date`, `login_ip`, `apikey`, `tel_type`, `email_type`, `client_type`, `access`, `lang`, `timezone`) VALUES
(182, 'Cinema Kotta', 'serverbyadarsh@gmail.com', 'serverbyadarsh', '7ced721d8e1906cdc20c94298c073e6d', '+918547679448', 0, '2', NULL, 0, '2021-06-22 18:07:42', '2021-06-22 18:08:05', '157.44.223.251', 'c955d5380c3a42d6f1257caecf45d9f7', '1', '1', '2', NULL, 'en', 0),
(181, 'test kumar', 'test@test.com', 'test123', 'd2da1e9f79c6ca6d5d60c7a2b8673c5a', '123456789', 0, '2', NULL, 0, '2021-06-22 00:12:07', '2021-06-22 00:12:39', '157.42.234.206', 'c100d6b55dade15c98ebced5a5d21b47', '1', '1', '2', NULL, 'en', 0),
(180, 'Mithun kumar', 'Marbateam@gmail.com', 'Mithun7633', '3bb5c3d6fa4eb6719dcb77cca3ee9705', '7209553972', 0, '2', NULL, 0, '2021-06-21 14:46:07', '2021-06-21 15:08:00', '223.228.237.157', 'b430b1c60f1d63b624eac5c49b359083', '1', '1', '2', NULL, 'en', 0),
(175, 'Fsp India', 'fsp@admin.com', 'Admin', 'e63f09294c1a5db4df45933a87a9e16a', '1234567890', 0, '2', NULL, 0, '2021-06-13 16:30:41', '2021-06-22 18:40:24', '47.9.236.126', '71f463f7152d42c69d5d7fbb386f7b09', '1', '1', '2', '{\"admin_access\":\"1\",\"users\":\"1\",\"orders\":\"1\",\"subscriptions\":\"1\",\"dripfeed\":\"1\",\"services\":\"1\",\"payments\":\"1\",\"tickets\":\"1\",\"reports\":\"1\",\"general_settings\":\"1\",\"pages\":\"1\",\"payments_settings\":\"1\",\"bank_accounts\":\"1\",\"payments_bonus\":\"1\",\"alert_settings\":\"1\",\"providers\":\"1\",\"themes\":\"1\",\"admins\":\"1\",\"language\":\"1\",\"meta\":\"1\",\"child-panels\":\"1\",\"proxy\":\"1\",\"kuponlar\":\"1\"}', 'en', 0);

-- --------------------------------------------------------

--
-- Table structure for table `clients_category`
--

CREATE TABLE `clients_category` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `clients_price`
--

CREATE TABLE `clients_price` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `service_price` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `clients_service`
--

CREATE TABLE `clients_service` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `client_report`
--

CREATE TABLE `client_report` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `action` text NOT NULL,
  `report_ip` varchar(225) NOT NULL,
  `report_date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `client_report`
--

INSERT INTO `client_report` (`id`, `client_id`, `action`, `report_ip`, `report_date`) VALUES
(1, 73, 'Kullanıcı kaydı yapıldı.', '85.98.109.42', '2020-04-19 03:32:37'),
(2, 73, 'Üye girişi yapıldı.', '85.98.109.42', '2020-04-19 03:33:04'),
(3, 73, 'Yönetici girişi yapıldı.', '85.98.109.42', '2020-04-19 03:34:51'),
(4, 73, 'Üye girişi yapıldı.', '85.98.109.42', '2020-04-19 03:42:15'),
(5, 74, 'Kullanıcı kaydı yapıldı.', '213.186.149.239', '2020-04-19 03:47:07'),
(6, 74, 'Üye girişi yapıldı.', '213.186.149.239', '2020-04-19 03:47:17'),
(7, 74, '0 TL tutarında yeni sipariş geçildi #.', '213.186.149.239', '2020-04-19 10:37:54'),
(8, 74, '0 TL tutarında yeni sipariş geçildi #.', '213.186.149.239', '2020-04-19 10:37:59'),
(9, 74, '0 TL tutarında yeni sipariş geçildi #.', '213.186.149.239', '2020-04-19 10:37:59'),
(10, 74, '0 TL tutarında yeni sipariş geçildi #.', '213.186.149.239', '2020-04-19 10:38:04'),
(11, 74, 'Üye girişi yapıldı.', '213.186.149.239', '2020-04-19 11:47:13'),
(12, 74, 'Üye girişi yapıldı.', '213.186.149.239', '2020-04-19 12:24:07'),
(13, 74, '5 TL tutarında yeni sipariş geçildi #1.', '213.186.149.239', '2020-04-19 12:44:38'),
(14, 74, '0 TL tutarında yeni sipariş geçildi #.', '213.186.149.239', '2020-04-19 12:47:52'),
(15, 74, 'API Key değiştirildi', '213.186.149.239', '2020-04-19 15:14:40'),
(16, 75, 'Kullanıcı kaydı yapıldı.', '94.123.180.209', '2020-04-19 20:50:13'),
(17, 75, 'Üye girişi yapıldı.', '94.123.180.209', '2020-04-19 20:50:31'),
(18, 75, '0 TL tutarında yeni sipariş geçildi #.', '94.123.180.209', '2020-04-19 20:50:54'),
(19, 75, '0 TL tutarında yeni sipariş geçildi #.', '94.123.180.209', '2020-04-19 20:51:12'),
(20, 75, '0 TL tutarında yeni sipariş geçildi #.', '94.123.180.209', '2020-04-19 20:51:20'),
(21, 75, 'Üye girişi yapıldı.', '94.123.180.209', '2020-04-19 20:52:03'),
(22, 75, 'Üye girişi yapıldı.', '94.123.180.209', '2020-04-19 20:52:20'),
(23, 74, 'Yönetici girişi yapıldı.', '213.186.149.239', '2020-04-20 01:30:24'),
(24, 73, 'Üye girişi yapıldı.', '85.98.109.42', '2020-04-20 01:59:21'),
(25, 73, '90 TL tutarında yeni sipariş geçildi #2.', '85.98.109.42', '2020-04-20 03:00:10'),
(26, 73, 'Üye girişi yapıldı.', '85.98.109.42', '2020-04-20 03:29:09'),
(27, 74, '0 TL tutarında yeni sipariş geçildi #.', '213.186.149.239', '2020-04-20 12:39:15'),
(28, 74, '0 TL tutarında yeni sipariş geçildi #.', '213.186.149.239', '2020-04-20 12:39:15'),
(29, 74, 'Yönetici girişi yapıldı.', '213.186.149.239', '2020-04-20 13:00:27'),
(30, 74, 'Yönetici girişi yapıldı.', '213.186.149.239', '2020-04-20 14:20:38'),
(31, 74, 'Yönetici girişi yapıldı.', '213.186.149.239', '2020-04-20 15:45:39'),
(32, 74, 'Yönetici girişi yapıldı.', '213.186.149.239', '2020-04-20 15:45:45'),
(33, 74, 'Yönetici girişi yapıldı.', '213.186.149.239', '2020-04-20 21:06:40'),
(34, 74, 'Üye girişi yapıldı.', '213.186.149.239', '2020-04-20 22:19:29'),
(35, 76, 'Kullanıcı kaydı yapıldı.', '185.32.44.114', '2020-04-20 22:59:38'),
(36, 76, 'Üye girişi yapıldı.', '185.32.44.114', '2020-04-20 23:00:00'),
(37, 76, 'Yeni destek talebi oluşturuldu #1', '185.32.44.114', '2020-04-20 23:02:29'),
(38, 74, 'Üye girişi yapıldı.', '213.186.149.239', '2020-04-20 23:22:40'),
(39, 74, 'Üye girişi yapıldı.', '213.186.149.239', '2020-04-21 02:42:45'),
(40, 74, 'Üye girişi yapıldı.', '213.186.149.239', '2020-04-21 12:25:33'),
(41, 74, 'Üye girişi yapıldı.', '213.186.149.239', '2020-04-21 12:25:49'),
(42, 74, '0.0095 TL tutarında yeni sipariş geçildi #3.', '213.186.149.239', '2020-04-21 12:26:32'),
(43, 74, '#3 numaralı sipariş iptal edildi ve 0.0095 TL ücret iade edildi Eski bakiye:0.9905 / Yeni bakiye:1', '127.0.0.1', '2020-04-21 16:50:06'),
(44, 77, 'Kullanıcı kaydı yapıldı.', '151.135.30.88', '2020-04-21 18:21:52'),
(45, 77, 'Üye girişi yapıldı.', '151.135.30.88', '2020-04-21 18:22:08'),
(46, 74, 'Yeni destek talebi oluşturuldu #2', '213.186.149.239', '2020-04-21 21:41:42'),
(47, 74, '0.987 TL tutarında yeni sipariş geçildi #4.', '213.186.149.239', '2020-04-21 23:16:59'),
(48, 74, '#4 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-04-21 23:45:11'),
(49, 74, '0.08 TL tutarında yeni sipariş geçildi #5.', '213.186.153.173', '2020-04-22 12:11:42'),
(50, 74, '#5 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-04-22 13:05:08'),
(51, 77, '9 TL tutarında yeni sipariş geçildi #6.', '31.155.157.196', '2020-04-22 23:48:37'),
(52, 77, '0.95 TL tutarında yeni sipariş geçildi #7.', '31.155.157.196', '2020-04-23 00:17:41'),
(53, 77, '4.75 TL tutarında yeni sipariş geçildi #8.', '31.155.157.196', '2020-04-23 00:18:04'),
(54, 77, '0.95 TL tutarında yeni sipariş geçildi #9.', '31.155.157.196', '2020-04-23 00:18:19'),
(55, 73, 'Üye girişi yapıldı.', '78.178.109.72', '2020-04-23 00:19:34'),
(56, 77, '12 TL tutarında yeni sipariş geçildi #10.', '31.155.157.196', '2020-04-23 00:20:36'),
(57, 77, '0.95 TL tutarında yeni sipariş geçildi #11.', '31.155.157.196', '2020-04-23 00:34:37'),
(58, 77, '0.95 TL tutarında yeni sipariş geçildi #12.', '31.155.157.196', '2020-04-23 00:35:02'),
(59, 77, '#7 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-04-23 01:10:12'),
(60, 77, '#9 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-04-23 01:10:14'),
(61, 77, '#11 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-04-23 01:10:15'),
(62, 77, '#12 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-04-23 01:50:11'),
(63, 77, '#6 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-04-23 02:05:06'),
(64, 77, '#8 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-04-23 02:05:07'),
(65, 77, '#10 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-04-23 02:35:14'),
(66, 78, 'Kullanıcı kaydı yapıldı.', '81.215.16.156', '2020-04-23 03:34:23'),
(67, 78, 'Üye girişi yapıldı.', '81.215.16.156', '2020-04-23 03:34:28'),
(68, 78, '0 TL tutarında yeni sipariş geçildi #.', '81.215.16.156', '2020-04-23 03:34:29'),
(69, 74, 'Üye girişi yapıldı.', '149.56.28.113', '2020-04-23 14:03:52'),
(70, 74, 'Yönetici girişi yapıldı.', '149.56.28.113', '2020-04-23 14:04:14'),
(71, 79, 'Kullanıcı kaydı yapıldı.', '5.176.82.224', '2020-04-23 21:00:25'),
(72, 79, 'Üye girişi yapıldı.', '5.176.82.224', '2020-04-23 21:00:50'),
(73, 80, 'Kullanıcı kaydı yapıldı.', '95.70.132.3', '2020-04-23 21:07:44'),
(74, 80, 'Üye girişi yapıldı.', '95.70.132.3', '2020-04-23 21:08:04'),
(75, 79, '0.999 TL tutarında yeni sipariş geçildi #13.', '5.176.82.224', '2020-04-23 21:08:05'),
(76, 79, '#13 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-04-23 23:05:06'),
(77, 77, '15 TL tutarında yeni sipariş geçildi #14.', '176.218.120.209', '2020-04-23 23:19:45'),
(78, 81, 'Kullanıcı kaydı yapıldı.', '78.190.190.105', '2020-04-24 01:07:10'),
(79, 81, 'Üye girişi yapıldı.', '78.190.190.105', '2020-04-24 01:07:25'),
(80, 77, '#14 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-04-24 02:15:08'),
(81, 74, 'Yönetici girişi yapıldı.', '213.186.148.176', '2020-04-24 02:23:35'),
(82, 74, 'Üye girişi yapıldı.', '213.186.148.176', '2020-04-24 13:31:42'),
(83, 73, 'Üye girişi yapıldı.', '78.178.109.72', '2020-04-25 02:38:43'),
(84, 74, '2.1 TL tutarında yeni sipariş geçildi #15.', '213.186.148.176', '2020-04-25 11:45:54'),
(85, 74, '#15 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-04-25 13:15:11'),
(86, 74, 'Üye girişi yapıldı.', '213.186.148.176', '2020-04-25 16:32:13'),
(87, 82, 'Kullanıcı kaydı yapıldı.', '85.98.238.74', '2020-04-25 16:33:07'),
(88, 82, 'Üye girişi yapıldı.', '85.98.238.74', '2020-04-25 16:33:15'),
(89, 82, '0.095 TL tutarında yeni sipariş geçildi #16.', '85.98.238.74', '2020-04-25 16:36:43'),
(90, 82, '#16 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-04-25 17:10:09'),
(91, 83, 'Kullanıcı kaydı yapıldı.', '78.190.228.75', '2020-04-25 20:09:57'),
(92, 83, 'Üye girişi yapıldı.', '78.190.228.75', '2020-04-25 20:10:12'),
(93, 73, 'Üye girişi yapıldı.', '78.178.109.72', '2020-04-25 20:38:40'),
(94, 77, '15 TL tutarında yeni sipariş geçildi #17.', '176.218.120.209', '2020-04-26 14:35:12'),
(95, 77, '0.2 TL tutarında yeni sipariş geçildi #18.', '176.218.120.209', '2020-04-26 14:51:18'),
(96, 77, '0.2 TL tutarında yeni sipariş geçildi #19.', '176.218.120.209', '2020-04-26 14:52:57'),
(97, 77, '#18 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-04-26 15:15:07'),
(98, 77, '#19 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-04-26 15:15:08'),
(99, 77, '#17 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-04-26 19:10:06'),
(100, 77, '1 TL tutarında yeni sipariş geçildi #20.', '176.218.120.209', '2020-04-26 23:19:24'),
(101, 77, '1 TL tutarında yeni sipariş geçildi #21.', '176.218.120.209', '2020-04-26 23:19:48'),
(102, 77, '1 TL tutarında yeni sipariş geçildi #22.', '176.218.120.209', '2020-04-26 23:20:28'),
(103, 77, '0.5375 TL tutarında yeni sipariş geçildi #23.', '176.218.120.209', '2020-04-26 23:21:12'),
(104, 77, '#20 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-04-27 00:05:11'),
(105, 77, '#21 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-04-27 00:05:13'),
(106, 77, '#22 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-04-27 00:05:14'),
(107, 77, '#23 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-04-27 00:05:16'),
(108, 84, 'Kullanıcı kaydı yapıldı.', '78.180.11.192', '2020-04-27 06:46:38'),
(109, 84, 'Üye girişi yapıldı.', '78.180.11.192', '2020-04-27 06:46:45'),
(110, 77, 'Üye girişi yapıldı.', '176.218.120.209', '2020-04-27 17:15:43'),
(111, 77, '0.5 TL tutarında yeni sipariş geçildi #24.', '176.218.120.209', '2020-04-27 17:16:34'),
(112, 77, '0.5 TL tutarında yeni sipariş geçildi #25.', '176.218.120.209', '2020-04-27 17:17:11'),
(113, 77, '2.75 TL tutarında yeni sipariş geçildi #26.', '176.218.120.209', '2020-04-27 17:21:22'),
(114, 77, '2.75 TL tutarında yeni sipariş geçildi #27.', '176.218.120.209', '2020-04-27 17:22:15'),
(115, 77, '0.475 TL tutarında yeni sipariş geçildi #28.', '176.218.120.209', '2020-04-27 17:39:52'),
(116, 77, '#24 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-04-27 18:05:07'),
(117, 77, '#25 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-04-27 18:05:09'),
(118, 77, '#26 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-04-27 18:10:06'),
(119, 77, '#27 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-04-27 18:10:07'),
(120, 77, '#28 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-04-27 18:10:09'),
(121, 77, '0 TL tutarında yeni sipariş geçildi #29.', '176.218.120.209', '2020-04-27 19:43:35'),
(122, 77, '28.8 TL tutarında yeni sipariş geçildi #30.', '176.218.120.209', '2020-04-27 20:02:31'),
(123, 77, '4.75 TL tutarında yeni sipariş geçildi #31.', '176.218.120.209', '2020-04-27 20:17:16'),
(124, 77, '5 TL tutarında yeni sipariş geçildi #44.', '176.218.120.209', '2020-04-27 21:09:19'),
(125, 77, '#30 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-04-27 22:10:10'),
(126, 77, '#31 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-04-27 22:10:11'),
(127, 77, '#44 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-04-28 00:05:07'),
(128, 74, '0.03 TL tutarında yeni sipariş geçildi #45.', '213.186.144.61', '2020-04-28 20:16:44'),
(129, 74, '0.03 TL tutarında yeni sipariş geçildi #46.', '213.186.144.61', '2020-04-28 20:18:25'),
(130, 74, '0.03 TL tutarında yeni sipariş geçildi #47.', '213.186.144.61', '2020-04-28 20:19:45'),
(131, 74, '0.03 TL tutarında yeni sipariş geçildi #48.', '213.186.144.61', '2020-04-28 20:20:25'),
(132, 74, '#45 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-04-28 21:05:08'),
(133, 74, '#46 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-04-28 21:05:09'),
(134, 74, '#47 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-04-28 21:05:10'),
(135, 74, '#48 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-04-28 21:10:09'),
(136, 74, '0.03 TL tutarında yeni sipariş geçildi #49.', '213.186.144.61', '2020-04-28 22:08:34'),
(137, 74, '0.02 TL tutarında yeni sipariş geçildi #50.', '213.186.144.61', '2020-04-28 22:13:53'),
(138, 74, 'Yönetici girişi yapıldı.', '213.186.144.61', '2020-04-28 23:47:51'),
(139, 74, '0.02 TL tutarında yeni sipariş geçildi #51.', '213.186.144.61', '2020-04-28 23:54:13'),
(140, 74, '#49 numaralı sipariş kısmi olarak işaretlendi ve 0.03 TL ücret iade edildi Eski bakiye:8.643 / Yeni bakiye:8.673', '127.0.0.1', '2020-04-29 02:10:09'),
(141, 74, '0.03 TL tutarında yeni sipariş geçildi #52.', '213.186.144.61', '2020-04-29 02:10:31'),
(142, 74, '0.012 TL tutarında yeni sipariş geçildi #53.', '213.186.144.61', '2020-04-29 02:11:18'),
(143, 74, '#50 numaralı sipariş kısmi olarak işaretlendi ve 0.02 TL ücret iade edildi Eski bakiye:8.661 / Yeni bakiye:8.681', '127.0.0.1', '2020-04-29 02:15:10'),
(144, 74, '#51 numaralı sipariş kısmi olarak işaretlendi ve 0.02 TL ücret iade edildi Eski bakiye:8.681 / Yeni bakiye:8.701', '127.0.0.1', '2020-04-29 03:55:08'),
(145, 74, '#53 numaralı sipariş kısmi olarak işaretlendi ve 0.012 TL ücret iade edildi Eski bakiye:8.701 / Yeni bakiye:8.713', '127.0.0.1', '2020-04-29 06:15:10'),
(146, 73, 'Üye girişi yapıldı.', '5.24.168.125', '2020-04-29 10:13:52'),
(147, 73, '0 TL tutarında yeni sipariş geçildi #54.', '5.24.168.125', '2020-04-29 10:16:22'),
(148, 73, '2 TL tutarında yeni sipariş geçildi #55.', '178.247.17.225', '2020-04-29 10:54:05'),
(149, 73, '#54 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-04-29 10:55:10'),
(150, 73, '#55 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-04-29 11:05:14'),
(151, 73, '0.02 TL tutarında yeni sipariş geçildi #56.', '178.247.17.225', '2020-04-29 11:12:06'),
(152, 73, '#56 numaralı sipariş kısmi olarak işaretlendi ve 0.003 TL ücret iade edildi Eski bakiye:-92.02 / Yeni bakiye:-92.017', '127.0.0.1', '2020-04-29 11:50:06'),
(153, 74, 'Üye girişi yapıldı.', '213.186.144.61', '2020-04-29 16:27:40'),
(154, 74, '0.03 TL tutarında yeni sipariş geçildi #57.', '213.186.144.61', '2020-04-29 16:28:02'),
(155, 74, '#57 numaralı sipariş kısmi olarak işaretlendi ve 0.03 TL ücret iade edildi Eski bakiye:8.683 / Yeni bakiye:8.713', '127.0.0.1', '2020-04-29 16:30:14'),
(156, 74, 'Üye girişi yapıldı.', '213.186.144.61', '2020-04-30 01:20:19'),
(157, 74, 'Shopier API aracılığıyla 1 TL tutarında bakiye yüklendi', '213.186.144.61', '2020-04-30 13:46:24'),
(158, 74, 'Yönetici girişi yapıldı.', '213.186.144.61', '2020-04-30 15:14:20'),
(159, 74, 'Yönetici girişi yapıldı.', '213.186.144.61', '2020-04-30 15:15:41'),
(160, 85, 'Kullanıcı kaydı yapıldı.', '88.241.47.81', '2020-04-30 15:35:34'),
(161, 85, 'Üye girişi yapıldı.', '88.241.47.81', '2020-04-30 15:35:52'),
(162, 86, 'Kullanıcı kaydı yapıldı.', '88.241.47.81', '2020-04-30 19:29:14'),
(163, 86, 'Üye girişi yapıldı.', '88.241.47.81', '2020-04-30 19:29:27'),
(164, 86, 'Shopier API aracılığıyla 7 TL tutarında bakiye yüklendi', '88.241.47.81', '2020-04-30 19:39:00'),
(165, 86, '0.95 TL tutarında yeni sipariş geçildi #58.', '88.241.47.81', '2020-04-30 19:39:16'),
(166, 86, '0.95 TL tutarında yeni sipariş geçildi #59.', '88.241.47.81', '2020-04-30 19:40:56'),
(167, 86, '0.95 TL tutarında yeni sipariş geçildi #60.', '88.241.47.81', '2020-04-30 19:41:36'),
(168, 86, '0.95 TL tutarında yeni sipariş geçildi #61.', '88.241.47.81', '2020-04-30 19:41:44'),
(169, 86, '2.25 TL tutarında yeni sipariş geçildi #62.', '88.241.47.81', '2020-04-30 19:43:03'),
(170, 86, '0.95 TL tutarında yeni sipariş geçildi #63.', '88.241.47.81', '2020-04-30 19:45:50'),
(171, 86, '#58 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-04-30 20:10:06'),
(172, 86, '#60 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-04-30 20:10:06'),
(173, 86, '#59 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-04-30 20:15:05'),
(174, 86, '#61 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-04-30 20:15:05'),
(175, 86, '#62 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-04-30 20:15:06'),
(176, 86, '#63 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-04-30 20:20:06'),
(177, 86, 'Shopier API aracılığıyla 20 TL tutarında bakiye yüklendi', '88.241.47.81', '2020-04-30 20:55:08'),
(178, 86, '2.25 TL tutarında yeni sipariş geçildi #64.', '88.241.47.81', '2020-04-30 20:59:53'),
(179, 86, '2.25 TL tutarında yeni sipariş geçildi #65.', '88.241.47.81', '2020-04-30 21:05:16'),
(180, 86, '#64 numaralı sipariş iptal edildi ve 2.25 TL ücret iade edildi Eski bakiye:15.5 / Yeni bakiye:17.75', '127.0.0.1', '2020-04-30 21:10:05'),
(181, 86, '2.25 TL tutarında yeni sipariş geçildi #66.', '88.241.47.81', '2020-04-30 21:13:12'),
(182, 86, '2.25 TL tutarında yeni sipariş geçildi #67.', '88.241.47.81', '2020-04-30 21:14:53'),
(183, 86, '#66 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-04-30 22:10:06'),
(184, 87, 'Kullanıcı kaydı yapıldı.', '213.74.84.126', '2020-04-30 22:38:12'),
(185, 87, 'Üye girişi yapıldı.', '213.74.84.126', '2020-04-30 22:38:26'),
(187, 87, '11.25 TL tutarında yeni sipariş geçildi #68.', '213.74.84.126', '2020-04-30 22:47:21'),
(188, 87, '11.25 TL tutarında yeni sipariş geçildi #69.', '213.74.84.126', '2020-04-30 22:49:01'),
(189, 87, '11.25 TL tutarında yeni sipariş geçildi #70.', '213.74.84.126', '2020-04-30 22:49:07'),
(190, 87, 'Üye girişi yapıldı.', '213.74.84.126', '2020-04-30 22:49:30'),
(191, 86, '#67 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-04-30 22:50:07'),
(192, 87, '11.25 TL tutarında yeni sipariş geçildi #71.', '213.74.84.126', '2020-04-30 22:50:24'),
(193, 87, 'Üye girişi yapıldı.', '213.74.84.126', '2020-04-30 22:51:38'),
(194, 86, '#65 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-04-30 23:20:06'),
(195, 74, 'Yönetici girişi yapıldı.', '213.186.148.102', '2020-05-01 01:26:42'),
(196, 87, '#68 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-05-01 01:50:10'),
(197, 86, '11.25 TL tutarında yeni sipariş geçildi #72.', '88.241.47.81', '2020-05-01 04:00:24'),
(198, 86, '#72 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-05-01 07:00:08'),
(199, 77, '12.8 TL tutarında yeni sipariş geçildi #73.', '176.218.120.209', '2020-05-01 13:33:19'),
(200, 77, '12.8 TL tutarında yeni sipariş geçildi #74.', '176.218.120.209', '2020-05-01 13:34:59'),
(201, 74, '1 TL tutarında yeni sipariş geçildi #75.', '213.186.148.102', '2020-05-01 15:38:53'),
(202, 86, '0.95 TL tutarında yeni sipariş geçildi #76.', '88.241.47.81', '2020-05-01 16:26:39'),
(203, 86, '0.95 TL tutarında yeni sipariş geçildi #77.', '88.241.47.81', '2020-05-01 16:26:42'),
(204, 74, '1 TL tutarında yeni sipariş geçildi #78.', '213.186.148.102', '2020-05-01 17:38:53'),
(205, 86, '#76 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-05-01 17:40:06'),
(206, 77, '#73 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-05-01 18:30:07'),
(207, 74, 'Üye girişi yapıldı.', '213.186.148.102', '2020-05-01 21:57:05'),
(208, 77, '0.3 TL tutarında yeni sipariş geçildi #.', '151.135.48.243', '2020-05-01 22:17:30'),
(209, 77, '0.2 TL tutarında yeni sipariş geçildi #.', '151.135.48.243', '2020-05-01 22:18:00'),
(210, 77, '0.2 TL tutarında yeni sipariş geçildi #.', '151.135.48.243', '2020-05-01 22:18:18'),
(211, 77, '0.3 TL tutarında yeni sipariş geçildi #.', '151.135.48.243', '2020-05-01 22:19:16'),
(212, 77, '0.3 TL tutarında yeni sipariş geçildi #.', '151.135.48.243', '2020-05-01 22:20:12'),
(213, 74, '0.01 TL tutarında yeni sipariş geçildi #79.', '213.186.148.102', '2020-05-01 22:30:15'),
(214, 74, '#79 numaralı sipariş iptal edildi ve 0.01 TL ücret iade edildi Eski bakiye:7.703 / Yeni bakiye:7.713', '127.0.0.1', '2020-05-02 00:05:16'),
(215, 74, '0 TL tutarında yeni sipariş geçildi #.', '213.186.148.102', '2020-05-02 00:31:36'),
(216, 74, '0 TL tutarında yeni sipariş geçildi #.', '213.186.148.102', '2020-05-02 00:31:38'),
(217, 74, '0 TL tutarında yeni sipariş geçildi #.', '213.186.148.102', '2020-05-02 00:31:42'),
(218, 74, '0 TL tutarında yeni sipariş geçildi #.', '213.186.148.102', '2020-05-02 00:34:46'),
(219, 88, 'Kullanıcı kaydı yapıldı.', '213.186.148.102', '2020-05-02 01:22:06'),
(220, 74, 'Yönetici girişi yapıldı.', '213.186.148.102', '2020-05-02 01:22:55'),
(221, 89, 'Kullanıcı kaydı yapıldı.', '176.33.243.62', '2020-05-02 02:01:29'),
(222, 89, 'Üye girişi yapıldı.', '176.33.243.62', '2020-05-02 02:02:01'),
(223, 89, '0 TL tutarında yeni sipariş geçildi #.', '176.33.243.62', '2020-05-02 02:03:15'),
(224, 73, 'Üye girişi yapıldı.', '85.96.123.137', '2020-05-02 02:16:10'),
(225, 73, 'Yeni destek talebi oluşturuldu #4', '85.96.123.137', '2020-05-02 02:24:37'),
(226, 73, 'Üye girişi yapıldı.', '188.57.123.232', '2020-05-02 04:06:14'),
(227, 74, 'Yönetici girişi yapıldı.', '213.186.148.102', '2020-05-02 04:35:29'),
(228, 73, 'Üye girişi yapıldı.', '85.96.123.137', '2020-05-02 15:21:49'),
(229, 73, 'Üye girişi yapıldı.', '85.96.123.137', '2020-05-02 15:23:54'),
(230, 73, 'Üye girişi yapıldı.', '85.96.123.137', '2020-05-02 15:28:21'),
(231, 73, 'Üye girişi yapıldı.', '85.96.123.137', '2020-05-02 15:33:19'),
(232, 73, 'Üye girişi yapıldı.', '85.96.123.137', '2020-05-02 15:37:48'),
(233, 73, 'Üye girişi yapıldı.', '85.96.123.137', '2020-05-02 15:42:51'),
(234, 74, '0 TL tutarında yeni sipariş geçildi #.', '213.186.148.102', '2020-05-02 15:46:07'),
(235, 73, '0 TL tutarında yeni sipariş geçildi #80.', '85.96.123.137', '2020-05-02 15:58:27'),
(236, 73, '#80 numaralı sipariş kısmi olarak işaretlendi ve 0 TL ücret iade edildi Eski bakiye:-92.017 / Yeni bakiye:-92.017', '127.0.0.1', '2020-05-02 16:05:06'),
(237, 77, '12.8 TL tutarında yeni sipariş geçildi #81.', '176.218.120.209', '2020-05-03 04:10:50'),
(238, 74, '0.15 TL tutarında yeni sipariş geçildi #82.', '213.186.148.102', '2020-05-03 14:50:09'),
(239, 77, '#81 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-05-03 15:55:05'),
(240, 74, '#82 numaralı sipariş kısmi olarak işaretlendi ve 0.15 TL ücret iade edildi Eski bakiye:7.563 / Yeni bakiye:7.713', '127.0.0.1', '2020-05-03 15:55:06'),
(241, 90, 'Kullanıcı kaydı yapıldı.', '46.155.11.124', '2020-05-03 15:59:59'),
(242, 90, 'Üye girişi yapıldı.', '46.155.11.124', '2020-05-03 16:00:17'),
(243, 77, '12.8 TL tutarında yeni sipariş geçildi #83.', '176.218.120.209', '2020-05-03 21:00:39'),
(244, 73, '0 TL tutarında yeni sipariş geçildi #84.', '85.96.123.137', '2020-05-04 01:03:55'),
(245, 73, '#84 numaralı sipariş kısmi olarak işaretlendi ve 0 TL ücret iade edildi Eski bakiye:-92.017 / Yeni bakiye:-92.017', '127.0.0.1', '2020-05-04 01:05:06'),
(246, 73, '0 TL tutarında yeni sipariş geçildi #85.', '85.96.123.137', '2020-05-04 01:52:03'),
(247, 73, '#85 numaralı sipariş kısmi olarak işaretlendi ve 0 TL ücret iade edildi Eski bakiye:-92.017 / Yeni bakiye:-92.017', '127.0.0.1', '2020-05-04 01:55:06'),
(248, 91, 'Kullanıcı kaydı yapıldı.', '46.154.244.34', '2020-05-04 02:02:57'),
(249, 91, 'Üye girişi yapıldı.', '46.154.244.34', '2020-05-04 02:03:10'),
(250, 73, '0 TL tutarında yeni sipariş geçildi #86.', '85.96.123.137', '2020-05-04 02:03:27'),
(251, 73, '#86 numaralı sipariş kısmi olarak işaretlendi ve 0 TL ücret iade edildi Eski bakiye:-92.017 / Yeni bakiye:-92.017', '127.0.0.1', '2020-05-04 02:03:56'),
(252, 73, '0 TL tutarında yeni sipariş geçildi #87.', '85.96.123.137', '2020-05-04 02:13:34'),
(253, 73, '0 TL tutarında yeni sipariş geçildi #88.', '85.96.123.137', '2020-05-04 02:13:52'),
(254, 73, '#87 numaralı sipariş kısmi olarak işaretlendi ve 0 TL ücret iade edildi Eski bakiye:-92.017 / Yeni bakiye:-92.017', '127.0.0.1', '2020-05-04 02:15:05'),
(255, 73, '#88 numaralı sipariş kısmi olarak işaretlendi ve 0 TL ücret iade edildi Eski bakiye:-92.017 / Yeni bakiye:-92.017', '127.0.0.1', '2020-05-04 02:15:06'),
(256, 73, '0 TL tutarında yeni sipariş geçildi #89.', '85.96.123.137', '2020-05-04 02:15:58'),
(257, 73, '0 TL tutarında yeni sipariş geçildi #90.', '85.96.123.137', '2020-05-04 02:16:29'),
(258, 73, '#89 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-05-04 02:19:33'),
(259, 73, '#90 numaralı sipariş kısmi olarak işaretlendi ve 0 TL ücret iade edildi Eski bakiye:-92.017 / Yeni bakiye:-92.017', '127.0.0.1', '2020-05-04 02:19:33'),
(260, 73, '0 TL tutarında yeni sipariş geçildi #91.', '85.96.123.137', '2020-05-04 02:27:57'),
(261, 73, '#91 numaralı sipariş kısmi olarak işaretlendi ve 0 TL ücret iade edildi Eski bakiye:-92.017 / Yeni bakiye:-92.017', '127.0.0.1', '2020-05-04 02:28:31'),
(262, 73, '0 TL tutarında yeni sipariş geçildi #92.', '85.96.123.137', '2020-05-04 02:38:03'),
(263, 73, '#92 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-05-04 02:40:51'),
(264, 92, 'Kullanıcı kaydı yapıldı.', '78.185.131.123', '2020-05-04 02:59:40'),
(265, 92, 'Üye girişi yapıldı.', '78.185.131.123', '2020-05-04 03:00:08'),
(266, 73, '0 TL tutarında yeni sipariş geçildi #93.', '85.96.123.137', '2020-05-04 03:46:02'),
(267, 73, '#93 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-05-04 03:50:19'),
(268, 73, '0 TL tutarında yeni sipariş geçildi #94.', '85.96.123.137', '2020-05-04 03:51:02'),
(269, 73, '0 TL tutarında yeni sipariş geçildi #95.', '85.96.123.137', '2020-05-04 04:01:37'),
(270, 73, '#95 numaralı sipariş kısmi olarak işaretlendi ve 0 TL ücret iade edildi Eski bakiye:-92.017 / Yeni bakiye:-92.017', '127.0.0.1', '2020-05-04 04:02:07'),
(271, 77, '#83 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-05-04 05:25:04'),
(272, 73, '#94 numaralı sipariş kısmi olarak işaretlendi ve 0 TL ücret iade edildi Eski bakiye:-92.017 / Yeni bakiye:-92.017', '127.0.0.1', '2020-05-04 07:55:06'),
(273, 87, '1.05 TL tutarında yeni sipariş geçildi #96.', '213.74.85.183', '2020-05-04 15:32:12'),
(274, 87, '0.478 TL tutarında yeni sipariş geçildi #97.', '213.74.85.183', '2020-05-04 15:35:29'),
(275, 87, '#96 numaralı sipariş iptal edildi ve 1.05 TL ücret iade edildi Eski bakiye:37.222 / Yeni bakiye:38.272', '127.0.0.1', '2020-05-04 16:20:06'),
(276, 87, '#97 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-05-04 17:05:23'),
(277, 74, '0.3 TL tutarında yeni sipariş geçildi #98.', '213.186.144.20', '2020-05-04 18:21:21'),
(278, 74, '#98 numaralı sipariş kısmi olarak işaretlendi ve 0.3 TL ücret iade edildi Eski bakiye:7.413 / Yeni bakiye:7.713', '127.0.0.1', '2020-05-04 18:25:07'),
(279, 77, 'Üye girişi yapıldı.', '37.154.236.97', '2020-05-04 20:34:10'),
(280, 77, '0 TL tutarında yeni sipariş geçildi #.', '37.154.236.97', '2020-05-04 20:34:20'),
(281, 77, '1 TL tutarında yeni sipariş geçildi #99.', '37.154.236.97', '2020-05-04 20:34:41'),
(282, 77, '12.8 TL tutarında yeni sipariş geçildi #100.', '37.154.236.97', '2020-05-04 20:35:56'),
(283, 77, '#99 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-05-04 21:20:06'),
(284, 74, 'Üye girişi yapıldı.', '93.177.75.174', '2020-05-05 00:15:25'),
(285, 93, 'Kullanıcı kaydı yapıldı.', '176.55.91.87', '2020-05-05 00:41:38'),
(286, 74, 'Yönetici girişi yapıldı.', '213.186.144.20', '2020-05-05 14:20:07'),
(287, 86, 'Üye girişi yapıldı.', '81.213.85.13', '2020-05-05 17:14:53'),
(288, 94, 'Kullanıcı kaydı yapıldı.', '188.3.169.27', '2020-05-06 01:20:22'),
(289, 94, 'Üye girişi yapıldı.', '188.3.169.27', '2020-05-06 01:29:00'),
(290, 77, '21.6 TL tutarında yeni sipariş geçildi #101.', '176.218.120.209', '2020-05-06 05:41:57'),
(291, 77, '0.3 TL tutarında yeni sipariş geçildi #102.', '176.218.120.209', '2020-05-06 05:44:02'),
(292, 77, '#102 numaralı sipariş kısmi olarak işaretlendi ve 0.3 TL ücret iade edildi Eski bakiye:5.5875 / Yeni bakiye:5.8875', '127.0.0.1', '2020-05-06 05:50:11'),
(293, 87, '5.22 TL tutarında yeni sipariş geçildi #103.', '213.74.84.70', '2020-05-06 17:37:01'),
(294, 87, '5.22 TL tutarında yeni sipariş geçildi #104.', '213.74.84.70', '2020-05-06 17:37:08'),
(295, 87, '5.22 TL tutarında yeni sipariş geçildi #105.', '213.74.84.70', '2020-05-06 17:37:57'),
(296, 87, '8.7 TL tutarında yeni sipariş geçildi #106.', '213.74.84.70', '2020-05-06 17:38:24'),
(297, 87, '8.7 TL tutarında yeni sipariş geçildi #107.', '213.74.84.70', '2020-05-06 17:40:09'),
(298, 87, '0.7 TL tutarında yeni sipariş geçildi #108.', '213.74.84.70', '2020-05-06 20:54:38'),
(299, 77, '#101 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-05-07 03:30:10'),
(300, 87, '13.4 TL tutarında yeni sipariş geçildi #109.', '213.74.86.123', '2020-05-07 14:05:27'),
(301, 87, '8.04 TL tutarında yeni sipariş geçildi #110.', '213.74.86.123', '2020-05-07 14:06:00'),
(302, 87, '#104 numaralı sipariş iptal edildi ve 5.22 TL ücret iade edildi Eski bakiye:0.472 / Yeni bakiye:5.692', '127.0.0.1', '2020-05-07 15:35:07'),
(303, 95, 'Kullanıcı kaydı yapıldı.', '176.55.225.128', '2020-05-07 15:38:57'),
(304, 95, 'Üye girişi yapıldı.', '176.55.225.128', '2020-05-07 15:39:12'),
(305, 95, '0 TL tutarında yeni sipariş geçildi #.', '176.55.225.128', '2020-05-07 15:41:50'),
(306, 95, '0 TL tutarında yeni sipariş geçildi #.', '176.55.225.128', '2020-05-07 15:42:06'),
(307, 95, '0 TL tutarında yeni sipariş geçildi #.', '176.55.225.128', '2020-05-07 15:42:32'),
(308, 95, '0 TL tutarında yeni sipariş geçildi #.', '176.55.225.128', '2020-05-07 15:42:32'),
(309, 95, '0 TL tutarında yeni sipariş geçildi #.', '176.55.225.128', '2020-05-07 15:42:33'),
(310, 95, '0 TL tutarında yeni sipariş geçildi #.', '176.55.225.128', '2020-05-07 15:42:33'),
(311, 95, '0 TL tutarında yeni sipariş geçildi #.', '176.55.225.128', '2020-05-07 15:42:33'),
(312, 95, '0 TL tutarında yeni sipariş geçildi #.', '176.55.225.128', '2020-05-07 15:42:34'),
(313, 95, '0 TL tutarında yeni sipariş geçildi #.', '176.55.225.128', '2020-05-07 15:42:34'),
(314, 95, '0 TL tutarında yeni sipariş geçildi #.', '176.55.225.128', '2020-05-07 15:42:34'),
(315, 95, '0 TL tutarında yeni sipariş geçildi #.', '176.55.225.128', '2020-05-07 15:42:34'),
(316, 95, '0 TL tutarında yeni sipariş geçildi #.', '176.55.225.128', '2020-05-07 15:42:35'),
(317, 95, '0 TL tutarında yeni sipariş geçildi #.', '176.55.225.128', '2020-05-07 15:42:37'),
(318, 95, '0 TL tutarında yeni sipariş geçildi #.', '176.55.225.128', '2020-05-07 15:42:37'),
(319, 95, '0 TL tutarında yeni sipariş geçildi #.', '176.55.225.128', '2020-05-07 15:42:38'),
(320, 95, '0 TL tutarında yeni sipariş geçildi #.', '176.55.225.128', '2020-05-07 15:42:39'),
(321, 95, '0 TL tutarında yeni sipariş geçildi #.', '176.55.225.128', '2020-05-07 15:42:40'),
(322, 95, '0 TL tutarında yeni sipariş geçildi #.', '176.55.225.128', '2020-05-07 15:42:44'),
(323, 95, '0 TL tutarında yeni sipariş geçildi #.', '176.55.225.128', '2020-05-07 15:42:44'),
(324, 87, '#103 numaralı sipariş kısmi olarak işaretlendi ve 5.20782 TL ücret iade edildi Eski bakiye:5.692 / Yeni bakiye:10.89982', '127.0.0.1', '2020-05-07 18:25:06'),
(325, 87, '#105 numaralı sipariş kısmi olarak işaretlendi ve 5.22 TL ücret iade edildi Eski bakiye:10.89982 / Yeni bakiye:16.11982', '127.0.0.1', '2020-05-07 18:25:07'),
(326, 73, 'Yönetici girişi yapıldı.', '88.236.53.214', '2020-05-07 18:57:48'),
(327, 74, 'Üye girişi yapıldı.', '193.109.85.14', '2020-05-07 19:24:23'),
(328, 74, 'Yönetici girişi yapıldı.', '193.109.85.14', '2020-05-07 19:27:36'),
(329, 74, 'Üye girişi yapıldı.', '213.186.147.37', '2020-05-08 00:21:24'),
(330, 74, '2.948 TL tutarında yeni sipariş geçildi #111.', '213.186.147.37', '2020-05-08 00:22:24'),
(331, 96, 'Kullanıcı kaydı yapıldı.', '2a0b:f4c2:2::1', '2020-05-08 00:33:31'),
(332, 74, 'Üye girişi yapıldı.', '213.186.147.37', '2020-05-08 00:36:17'),
(333, 97, 'Kullanıcı kaydı yapıldı.', '2a0b:f4c2:2::1', '2020-05-08 00:36:36'),
(334, 97, 'Üye girişi yapıldı.', '2a0b:f4c2:2::1', '2020-05-08 00:37:00'),
(335, 97, 'Üye girişi yapıldı.', '213.186.147.37', '2020-05-08 00:41:13'),
(336, 97, 'Üye girişi yapıldı.', '2a0b:f4c2:2::1', '2020-05-08 00:42:44'),
(337, 97, '0.35 TL tutarında yeni sipariş geçildi #112.', '2a0b:f4c2:2::1', '2020-05-08 00:46:20'),
(338, 97, '0.35 TL tutarında yeni sipariş geçildi #113.', '2a0b:f4c2:2::1', '2020-05-08 00:46:26'),
(339, 97, '0.7 TL tutarında yeni sipariş geçildi #114.', '2a0b:f4c2:2::1', '2020-05-08 00:47:05'),
(340, 97, 'Yeni destek talebi oluşturuldu #5', '2a0b:f4c2:2::1', '2020-05-08 00:49:54'),
(341, 74, '#111 numaralı sipariş tamamlandı.', '127.0.0.1', '2020-05-08 03:05:08'),
(342, 97, 'Üye girişi yapıldı.', '185.32.44.125', '2020-05-08 03:11:00'),
(343, 97, 'Destek talebine yanıt verildi #5', '185.32.44.125', '2020-05-08 03:11:27'),
(344, 97, '1.19 TL tutarında yeni sipariş geçildi #115.', '185.32.44.125', '2020-05-08 03:12:28'),
(345, 97, '1.3685 TL tutarında yeni sipariş geçildi #116.', '185.32.44.125', '2020-05-08 03:14:57'),
(346, 97, '1.3825 TL tutarında yeni sipariş geçildi #117.', '185.32.44.125', '2020-05-08 03:16:35'),
(347, 97, '0.6545 TL tutarında yeni sipariş geçildi #118.', '185.32.44.125', '2020-05-08 03:21:21'),
(348, 98, 'Kullanıcı kaydı yapıldı.', '178.246.161.235', '2020-05-08 04:36:39'),
(349, 98, 'Üye girişi yapıldı.', '178.246.161.235', '2020-05-08 04:36:45'),
(350, 73, 'Yönetici girişi yapıldı.', '88.231.202.160', '2020-06-05 04:49:58'),
(351, 99, 'Kullanıcı kaydı yapıldı.', '103.232.149.95', '2020-06-09 13:28:56'),
(352, 99, 'Üye girişi yapıldı.', '103.232.149.95', '2020-06-09 13:29:07'),
(353, 99, 'Üye girişi yapıldı.', '103.232.149.95', '2020-06-09 13:32:24'),
(354, 99, 'Üye girişi yapıldı.', '103.232.149.95', '2020-06-09 13:59:34'),
(355, 99, 'Üye girişi yapıldı.', '103.232.149.95', '2020-06-09 14:05:33'),
(356, 99, 'Üye girişi yapıldı.', '103.232.149.95', '2020-06-09 14:20:19'),
(357, 99, 'New 10  payment has been made with PayTM', '103.232.149.95', '2020-06-09 14:21:24'),
(358, 99, 'Yeni destek talebi oluşturuldu #6', '103.232.149.95', '2020-06-09 14:56:54'),
(359, 99, '7.5 TL tutarında yeni sipariş geçildi #.', '103.232.149.95', '2020-06-09 14:59:13'),
(360, 99, '0.01 TL tutarında yeni sipariş geçildi #1.', '103.232.149.95', '2020-06-09 15:05:21'),
(361, 100, 'Kullanıcı kaydı yapıldı.', '103.72.10.32', '2020-06-09 15:06:51'),
(362, 100, 'Üye girişi yapıldı.', '103.72.10.32', '2020-06-09 15:07:02'),
(363, 100, 'Yeni destek talebi oluşturuldu #7', '103.72.10.32', '2020-06-09 15:07:56'),
(364, 99, 'Üye girişi yapıldı.', '103.232.149.95', '2020-06-09 15:15:04'),
(365, 99, 'API Key değiştirildi', '103.232.149.95', '2020-06-09 15:18:57'),
(366, 99, '0.1 TL tutarında yeni sipariş geçildi #2.', '103.232.149.95', '2020-06-09 15:41:07'),
(367, 101, 'Kullanıcı kaydı yapıldı.', '137.97.122.85', '2020-06-10 10:27:02'),
(368, 101, 'Üye girişi yapıldı.', '137.97.122.85', '2020-06-10 10:27:36'),
(371, 99, 'Yönetici girişi yapıldı.', '27.56.227.239', '2020-06-16 20:17:51'),
(372, 99, 'Yönetici girişi yapıldı.', '157.47.200.173', '2020-06-16 20:41:30'),
(373, 99, 'Yönetici girişi yapıldı.', '157.47.200.173', '2020-06-16 22:54:05'),
(374, 99, 'Üye girişi yapıldı.', '157.47.215.106', '2020-06-17 05:27:51'),
(375, 99, 'Yönetici girişi yapıldı.', '27.56.227.239', '2020-06-17 07:23:54'),
(376, 99, 'Yönetici girişi yapıldı.', '27.56.227.239', '2020-06-17 07:24:37'),
(377, 99, 'Yönetici girişi yapıldı.', '157.47.215.106', '2020-06-17 07:25:05'),
(378, 99, 'Yönetici girişi yapıldı.', '27.56.227.239', '2020-06-17 07:27:14'),
(379, 99, 'Yönetici girişi yapıldı.', '157.46.153.114', '2020-06-17 12:07:38'),
(380, 99, 'Üye girişi yapıldı.', '157.46.132.85', '2020-06-17 14:02:30'),
(381, 99, '0 TL tutarında yeni sipariş geçildi #.', '157.47.217.195', '2020-06-18 07:39:00'),
(382, 99, '0.01 TL tutarında yeni sipariş geçildi #.', '157.47.217.195', '2020-06-18 07:39:14'),
(383, 99, 'Destek talebine yanıt verildi #6', '157.46.158.177', '2020-06-18 13:36:17'),
(384, 99, 'Üye girişi yapıldı.', '157.37.174.119', '2020-06-19 06:54:49'),
(385, 99, '1 TL tutarında yeni sipariş geçildi #.', '157.37.174.119', '2020-06-19 06:55:26'),
(387, 99, 'Yönetici girişi yapıldı.', '27.56.214.208', '2020-06-19 17:37:18'),
(388, 99, 'Üye girişi yapıldı.', '157.46.136.64', '2020-06-19 20:13:58'),
(389, 99, '0.01 TL tutarında yeni sipariş geçildi #.', '27.56.214.208', '2020-06-20 11:31:43'),
(390, 99, '0.1 TL tutarında yeni sipariş geçildi #.', '27.56.214.208', '2020-06-20 11:32:02'),
(391, 99, 'Yönetici girişi yapıldı.', '113.210.183.96', '2020-06-21 16:15:23'),
(392, 99, 'New 1  payment has been made with PayTM', '157.37.255.29', '2020-06-21 21:51:30'),
(393, 99, '99', '199.199.0.0', '2020-06-22 12:32:21'),
(394, 99, 'New 1  payment has been made with PayTM', '157.37.255.29', '2020-06-21 22:11:18'),
(395, 99, 'New 5  payment has been made with PayTM', '27.62.239.158', '2020-06-21 22:17:46'),
(396, 99, '0.01 TL tutarında yeni sipariş geçildi #.', '157.37.255.29', '2020-06-22 08:18:41'),
(397, 99, '0.01 TL tutarında yeni sipariş geçildi #.', '157.37.255.29', '2020-06-22 08:19:05'),
(398, 99, 'Üye girişi yapıldı.', '157.37.255.29', '2020-06-22 08:22:15'),
(399, 99, '0.01 TL tutarında yeni sipariş geçildi #.', '157.37.255.29', '2020-06-22 08:25:25'),
(400, 99, '0.01 TL tutarında yeni sipariş geçildi #.', '157.37.255.29', '2020-06-22 10:20:16'),
(401, 99, '0.01 TL tutarında yeni sipariş geçildi #.', '157.37.255.29', '2020-06-22 10:44:07'),
(402, 99, '0.01 TL tutarında yeni sipariş geçildi #4.', '157.37.255.29', '2020-06-22 11:46:57'),
(405, 99, 'Üye girişi yapıldı.', '157.46.128.198', '2020-06-22 17:54:58'),
(406, 99, 'Yönetici girişi yapıldı.', '223.188.80.137', '2020-06-22 18:01:01'),
(407, 99, 'Yönetici girişi yapıldı.', '197.53.54.131', '2020-06-23 14:39:06'),
(408, 99, 'Yönetici girişi yapıldı.', '27.62.237.23', '2020-06-23 15:18:44'),
(409, 99, 'Üye girişi yapıldı.', '157.46.143.57', '2020-06-23 15:57:18'),
(410, 99, 'Üye girişi yapıldı.', '102.184.15.44', '2020-06-23 17:59:42'),
(411, 99, 'Yönetici girişi yapıldı.', '157.37.233.130', '2020-06-23 18:05:29'),
(412, 99, 'Yönetici girişi yapıldı.', '103.40.197.147', '2020-06-23 20:52:21'),
(413, 99, 'Kullanıcı parolası değiştirildi', '157.46.143.57', '2020-06-23 21:31:33'),
(414, 99, 'Yönetici girişi yapıldı.', '157.46.143.57', '2020-06-23 21:46:12'),
(415, 99, 'Yönetici girişi yapıldı.', '157.46.128.79', '2020-06-24 19:40:19'),
(416, 99, 'Yönetici girişi yapıldı.', '157.47.202.163', '2020-06-25 12:26:13'),
(417, 99, 'Yönetici girişi yapıldı.', '27.56.192.26', '2020-06-25 13:27:48'),
(418, 99, 'Yönetici girişi yapıldı.', '27.56.249.94', '2020-09-21 14:11:36'),
(419, 99, 'Üye girişi yapıldı.', '27.56.249.94', '2020-09-21 14:14:37'),
(420, 99, 'Yönetici girişi yapıldı.', '27.56.249.94', '2020-09-21 14:15:13'),
(421, 99, 'Üye girişi yapıldı.', '27.56.249.94', '2020-09-21 14:25:42'),
(422, 99, 'Kullanıcı parolası değiştirildi', '27.56.249.94', '2020-09-21 14:26:10'),
(423, 99, 'Üye girişi yapıldı.', '27.56.249.94', '2020-09-21 14:26:39'),
(424, 99, 'Üye girişi yapıldı.', '106.193.244.133', '2020-09-21 14:28:17'),
(425, 99, 'Üye girişi yapıldı.', '106.193.244.133', '2020-09-21 14:42:12'),
(426, 99, 'Yönetici girişi yapıldı.', '83.136.106.197', '2020-09-21 17:31:46'),
(427, 99, 'Üye girişi yapıldı.', '106.193.244.133', '2020-09-21 17:32:06'),
(428, 103, 'Kullanıcı kaydı yapıldı.', '83.136.106.197', '2020-09-21 17:36:19'),
(429, 103, 'Üye girişi yapıldı.', '83.136.106.197', '2020-09-21 17:36:28'),
(430, 99, 'Yönetici girişi yapıldı.', '83.136.106.197', '2020-09-21 17:36:49'),
(431, 99, 'Yönetici girişi yapıldı.', '106.193.244.133', '2020-09-21 17:39:24'),
(432, 104, 'Kullanıcı kaydı yapıldı.', '128.199.84.170', '2020-09-21 18:23:32'),
(433, 104, 'Üye girişi yapıldı.', '128.199.84.170', '2020-09-21 18:23:46'),
(434, 99, 'Yönetici girişi yapıldı.', '106.193.244.133', '2020-09-21 18:30:20'),
(435, 105, 'Kullanıcı kaydı yapıldı.', '14.102.48.99', '2020-09-21 20:09:29'),
(436, 105, 'Üye girişi yapıldı.', '14.102.48.99', '2020-09-21 20:09:34'),
(437, 106, 'Kullanıcı kaydı yapıldı.', '106.193.244.133', '2020-09-21 20:57:51'),
(438, 106, 'Üye girişi yapıldı.', '106.193.244.133', '2020-09-21 20:58:03'),
(439, 99, 'Üye girişi yapıldı.', '106.193.244.133', '2020-09-21 21:25:30'),
(440, 107, 'Kullanıcı kaydı yapıldı.', '106.193.244.133', '2020-09-21 21:27:47'),
(441, 108, 'Kullanıcı kaydı yapıldı.', '106.193.244.133', '2020-09-21 21:30:39'),
(442, 109, 'Kullanıcı kaydı yapıldı.', '106.193.244.133', '2020-09-21 21:32:19'),
(443, 99, 'Üye girişi yapıldı.', '106.193.244.133', '2020-09-21 21:32:30'),
(444, 110, 'Kullanıcı kaydı yapıldı.', '106.193.244.133', '2020-09-21 21:33:45'),
(445, 99, 'Üye girişi yapıldı.', '106.193.244.133', '2020-09-21 21:33:51'),
(446, 111, 'Kullanıcı kaydı yapıldı.', '106.193.244.133', '2020-09-21 21:35:09'),
(447, 112, 'Kullanıcı kaydı yapıldı.', '106.193.244.133', '2020-09-21 21:37:58'),
(448, 99, 'Yönetici girişi yapıldı.', '106.207.216.248', '2020-09-21 23:04:04'),
(449, 113, 'Kullanıcı kaydı yapıldı.', '106.207.216.248', '2020-09-21 23:08:48'),
(450, 113, 'Üye girişi yapıldı.', '106.207.216.248', '2020-09-21 23:09:00'),
(451, 99, 'Yönetici girişi yapıldı.', '106.207.216.248', '2020-09-21 23:19:19'),
(452, 99, 'Üye girişi yapıldı.', '106.207.216.248', '2020-09-21 23:26:13'),
(453, 99, 'Yönetici girişi yapıldı.', '106.207.216.248', '2020-09-21 23:42:01'),
(454, 99, 'Yönetici girişi yapıldı.', '106.207.216.248', '2020-09-21 23:51:03'),
(455, 105, 'Üye girişi yapıldı.', '14.102.48.103', '2020-09-22 00:13:19'),
(456, 99, 'Yönetici girişi yapıldı.', '106.207.216.248', '2020-09-22 00:43:34'),
(457, 114, 'Kullanıcı kaydı yapıldı.', '106.193.244.133', '2020-09-22 00:47:43'),
(458, 114, 'Üye girişi yapıldı.', '106.193.244.133', '2020-09-22 00:48:04'),
(459, 99, 'Üye girişi yapıldı.', '106.208.181.248', '2020-09-22 22:37:09'),
(460, 99, 'Yönetici girişi yapıldı.', '106.208.181.248', '2020-09-22 22:38:48'),
(461, 99, 'Yönetici girişi yapıldı.', '106.210.178.38', '2020-09-23 14:33:22'),
(462, 115, 'Kullanıcı kaydı yapıldı.', '157.42.93.201', '2020-10-06 23:30:56'),
(463, 115, 'Üye girişi yapıldı.', '157.42.93.201', '2020-10-06 23:31:07'),
(464, 99, 'Yönetici girişi yapıldı.', '106.220.147.58', '2020-10-06 23:53:36'),
(465, 99, 'Üye girişi yapıldı.', '110.224.174.102', '2020-10-06 23:56:36'),
(466, 99, 'Üye girişi yapıldı.', '110.224.168.7', '2020-10-07 11:09:52'),
(467, 99, 'Yönetici girişi yapıldı.', '110.224.168.7', '2020-10-07 11:10:13'),
(468, 99, 'Yönetici girişi yapıldı.', '223.189.185.7', '2020-10-07 11:12:01'),
(469, 99, 'Üye girişi yapıldı.', '106.220.147.58', '2020-10-07 12:46:38'),
(470, 99, '24 TL tutarında yeni sipariş geçildi #.', '106.220.147.58', '2020-10-07 12:50:44'),
(471, 99, 'Yönetici girişi yapıldı.', '110.224.191.100', '2020-10-07 14:49:09'),
(472, 99, 'Yönetici girişi yapıldı.', '157.37.48.28', '2020-10-07 15:05:03'),
(473, 116, 'Kullanıcı kaydı yapıldı.', '106.220.147.58', '2020-10-07 16:25:01'),
(474, 115, '0 TL tutarında yeni sipariş geçildi #5.', '157.42.68.53', '2020-10-07 17:31:39'),
(475, 115, 'Yeni destek talebi oluşturuldu #9', '157.42.68.53', '2020-10-07 17:33:02'),
(476, 99, 'Üye girişi yapıldı.', '106.220.147.58', '2020-10-07 19:04:10'),
(477, 99, '24 TL tutarında yeni sipariş geçildi #.', '110.224.165.191', '2020-10-07 19:05:02'),
(478, 99, '24 TL tutarında yeni sipariş geçildi #.', '110.224.165.191', '2020-10-07 19:05:03'),
(479, 99, '0 TL tutarında yeni sipariş geçildi #6.', '110.224.165.191', '2020-10-07 19:05:25'),
(480, 117, 'Kullanıcı kaydı yapıldı.', '223.225.113.54', '2020-10-07 20:00:15'),
(481, 117, 'Üye girişi yapıldı.', '223.225.113.54', '2020-10-07 20:00:23'),
(482, 99, 'Üye girişi yapıldı.', '157.37.80.189', '2020-10-09 10:11:53'),
(483, 99, 'Üye girişi yapıldı.', '157.37.50.187', '2020-10-09 11:01:30'),
(484, 99, 'Üye girişi yapıldı.', '110.224.186.235', '2020-10-09 14:45:54'),
(485, 99, 'New 100  payment has been made with RazorPay', '157.37.173.98', '2020-10-10 00:31:05'),
(486, 99, 'New 50  payment has been made with RazorPay', '157.37.173.98', '2020-10-10 00:31:41'),
(487, 99, 'New 100  payment has been made with RazorPay', '110.224.173.27', '2020-10-10 00:36:49'),
(488, 99, 'New 69  payment has been made with RazorPay', '110.224.173.27', '2020-10-10 00:43:30'),
(489, 99, 'New 49000  payment has been made with RazorPay', '110.224.173.27', '2020-10-10 00:46:08'),
(490, 99, 'Üye girişi yapıldı.', '110.224.165.66', '2020-10-10 12:01:53'),
(491, 99, 'Üye girişi yapıldı.', '106.210.220.156', '2020-10-10 13:59:37'),
(492, 99, 'New 1000  payment has been made with PayTM', '110.224.166.58', '2020-10-10 14:48:34'),
(493, 99, 'New 69  payment has been made with PayTM', '110.224.166.58', '2020-10-10 14:50:36'),
(494, 99, 'New 1  payment has been made with PayTM', '110.224.166.58', '2020-10-10 15:04:19'),
(495, 99, 'New 1  payment has been made with PayTM', '110.224.166.58', '2020-10-10 15:05:05'),
(496, 118, 'Kullanıcı kaydı yapıldı.', '171.76.197.48', '2020-10-10 16:33:13'),
(497, 118, 'Üye girişi yapıldı.', '171.76.197.48', '2020-10-10 16:33:21'),
(498, 99, 'Üye girişi yapıldı.', '106.210.220.156', '2020-10-10 16:34:35'),
(499, 99, '24 TL tutarında yeni sipariş geçildi #.', '110.224.167.30', '2020-10-10 22:56:33'),
(500, 99, '0 TL tutarında yeni sipariş geçildi #7.', '110.224.167.30', '2020-10-10 22:56:47'),
(501, 99, 'Yönetici girişi yapıldı.', '110.224.167.30', '2020-10-11 00:42:04'),
(502, 99, '562.248 TL tutarında yeni sipariş geçildi #8.', '110.224.180.109', '2020-10-11 12:33:46'),
(503, 119, 'Kullanıcı kaydı yapıldı.', '47.247.91.248', '2020-10-11 23:26:01'),
(504, 119, 'Üye girişi yapıldı.', '47.247.91.248', '2020-10-11 23:26:14'),
(505, 119, 'Üye girişi yapıldı.', '47.247.91.248', '2020-10-11 23:32:15'),
(506, 119, 'Kullanıcı parolası değiştirildi', '47.247.91.248', '2020-10-11 23:34:53'),
(507, 120, 'Kullanıcı kaydı yapıldı.', '103.49.118.62', '2020-10-12 11:06:02'),
(508, 99, 'Üye girişi yapıldı.', '110.224.165.70', '2020-10-12 16:48:59'),
(509, 120, 'Üye girişi yapıldı.', '103.49.118.62', '2020-10-12 16:49:46'),
(510, 99, 'Üye girişi yapıldı.', '110.224.165.70', '2020-10-12 17:21:29'),
(511, 99, 'New 104  payment has been made with PayTM QR', '110.224.165.70', '2020-10-12 18:58:00'),
(512, 99, 'New 104  payment has been made with PayTM QR', '110.224.165.70', '2020-10-12 18:58:21'),
(513, 99, 'New 104  payment has been made with PayTM QR', '110.224.165.70', '2020-10-12 19:03:12'),
(514, 99, 'New 1  payment has been made with PayTM QR', '106.220.172.255', '2020-10-12 19:10:06'),
(515, 121, 'Kullanıcı kaydı yapıldı.', '223.187.178.103', '2020-10-12 19:14:27'),
(516, 121, 'Üye girişi yapıldı.', '223.187.178.103', '2020-10-12 19:14:51'),
(517, 121, 'New 1  payment has been made with PayTM QR', '223.187.178.103', '2020-10-12 19:16:32'),
(518, 122, 'Kullanıcı kaydı yapıldı.', '106.220.191.187', '2020-10-13 22:20:55'),
(519, 99, 'Üye girişi yapıldı.', '106.220.191.187', '2020-10-13 22:21:00'),
(520, 122, 'Yönetici girişi yapıldı.', '103.16.147.153', '2020-10-13 22:23:15'),
(521, 123, 'Kullanıcı kaydı yapıldı.', '157.39.152.136', '2020-10-14 14:31:20'),
(522, 123, 'Üye girişi yapıldı.', '157.39.152.136', '2020-10-14 14:31:37'),
(523, 124, 'Kullanıcı kaydı yapıldı.', '47.8.57.116', '2020-10-14 15:59:24'),
(524, 99, 'Üye girişi yapıldı.', '110.224.160.224', '2020-10-14 16:11:31'),
(525, 99, 'New 1  payment has been made with PayTM QR', '110.224.160.224', '2020-10-14 16:20:22'),
(526, 125, 'Kullanıcı kaydı yapıldı.', '27.62.250.217', '2020-10-14 18:47:34'),
(527, 125, 'Üye girişi yapıldı.', '27.62.250.217', '2020-10-14 18:47:42'),
(528, 126, 'Kullanıcı kaydı yapıldı.', '14.102.33.198', '2020-10-14 22:56:28'),
(529, 126, 'Üye girişi yapıldı.', '14.102.33.198', '2020-10-14 22:56:35'),
(530, 99, 'Üye girişi yapıldı.', '106.220.191.187', '2020-10-15 19:20:54'),
(531, 127, 'Kullanıcı kaydı yapıldı.', '106.220.191.187', '2020-10-16 18:48:01'),
(532, 99, 'Yönetici girişi yapıldı.', '157.37.120.177', '2020-10-18 16:08:20'),
(533, 99, 'Üye girişi yapıldı.', '106.207.215.240', '2020-10-19 19:03:36'),
(534, 99, 'Yönetici girişi yapıldı.', '106.220.190.118', '2020-10-21 11:23:45'),
(535, 128, 'Kullanıcı kaydı yapıldı.', '103.70.197.111', '2020-10-21 14:25:56'),
(536, 128, 'Üye girişi yapıldı.', '103.70.197.111', '2020-10-21 14:26:03'),
(537, 99, 'Yönetici girişi yapıldı.', '106.220.190.118', '2020-10-21 14:40:56'),
(538, 129, 'Kullanıcı kaydı yapıldı.', '49.32.7.218', '2020-10-21 23:26:29'),
(539, 129, 'Üye girişi yapıldı.', '49.32.7.218', '2020-10-21 23:26:41'),
(540, 130, 'Kullanıcı kaydı yapıldı.', '103.41.38.128', '2020-10-24 18:45:14'),
(541, 130, 'Üye girişi yapıldı.', '103.41.38.128', '2020-10-24 18:45:34'),
(542, 130, 'Üye girişi yapıldı.', '103.41.38.128', '2020-10-24 18:49:33'),
(543, 131, 'Kullanıcı kaydı yapıldı.', '106.204.28.148', '2020-10-28 13:39:19'),
(544, 131, 'Üye girişi yapıldı.', '106.204.28.148', '2020-10-28 13:40:18'),
(545, 99, 'Yönetici girişi yapıldı.', '106.220.190.118', '2020-10-28 13:40:45'),
(546, 131, 'Üye girişi yapıldı.', '106.204.28.148', '2020-10-28 13:42:25'),
(547, 131, 'Yönetici girişi yapıldı.', '106.204.28.148', '2020-10-28 13:48:00'),
(548, 128, 'Üye girişi yapıldı.', '103.99.205.43', '2020-10-29 11:32:43'),
(549, 99, 'Üye girişi yapıldı.', '27.62.181.63', '2020-11-06 23:30:58'),
(550, 128, 'Üye girişi yapıldı.', '103.70.196.190', '2020-11-07 15:59:10'),
(551, 132, 'Kullanıcı kaydı yapıldı.', '106.204.154.62', '2020-11-07 16:08:46'),
(552, 132, 'Üye girişi yapıldı.', '106.204.154.62', '2020-11-07 16:08:55'),
(553, 128, 'Yönetici girişi yapıldı.', '106.204.154.62', '2020-11-07 16:14:06'),
(554, 133, 'Kullanıcı kaydı yapıldı.', '49.35.200.94', '2020-11-07 21:31:35'),
(555, 133, 'Üye girişi yapıldı.', '49.35.200.94', '2020-11-07 21:31:57'),
(556, 133, 'New 1  payment has been made with PayTM', '103.106.101.103', '2020-11-07 21:37:09'),
(557, 133, 'Üye girişi yapıldı.', '103.106.101.103', '2020-11-07 21:44:43'),
(558, 133, 'New 1  payment has been made with PayTM', '103.106.101.103', '2020-11-07 21:47:51'),
(559, 133, 'New 1  payment has been made with PayTM', '103.106.101.103', '2020-11-07 21:50:30'),
(560, 132, 'Üye girişi yapıldı.', '106.204.42.176', '2020-11-07 21:55:36'),
(561, 133, 'Üye girişi yapıldı.', '106.204.42.176', '2020-11-07 21:56:22'),
(562, 128, 'Yönetici girişi yapıldı.', '106.204.42.176', '2020-11-07 21:57:44'),
(563, 133, 'Üye girişi yapıldı.', '106.204.42.176', '2020-11-07 21:58:52'),
(564, 128, 'Yönetici girişi yapıldı.', '106.204.42.176', '2020-11-07 22:03:17'),
(565, 133, 'Üye girişi yapıldı.', '106.204.42.176', '2020-11-07 22:09:52'),
(566, 133, '1.2 TL tutarında yeni sipariş geçildi #9.', '106.204.42.176', '2020-11-07 22:11:48'),
(567, 128, 'Üye girişi yapıldı.', '106.204.42.176', '2020-11-07 22:13:39'),
(568, 128, 'Yönetici girişi yapıldı.', '106.204.42.176', '2020-11-07 22:37:04'),
(569, 99, 'Üye girişi yapıldı.', '27.62.181.63', '2020-11-08 09:26:19'),
(570, 134, 'Kullanıcı kaydı yapıldı.', '27.62.145.160', '2020-11-12 19:18:34'),
(571, 134, 'Üye girişi yapıldı.', '27.62.145.160', '2020-11-12 19:19:33'),
(572, 99, 'Yönetici girişi yapıldı.', '106.216.167.110', '2020-11-12 19:22:20'),
(573, 135, 'Kullanıcı kaydı yapıldı.', '128.90.162.178', '2020-11-12 20:04:31'),
(574, 135, 'Üye girişi yapıldı.', '128.90.162.178', '2020-11-12 20:04:55'),
(575, 99, 'Yönetici girişi yapıldı.', '106.216.167.110', '2020-11-12 20:08:15'),
(576, 135, 'Üye girişi yapıldı.', '128.90.162.178', '2020-11-12 20:25:00'),
(577, 136, 'Kullanıcı kaydı yapıldı.', '157.44.151.165', '2020-11-14 21:40:47'),
(578, 136, 'Üye girişi yapıldı.', '157.44.151.165', '2020-11-14 21:42:19'),
(579, 99, 'Üye girişi yapıldı.', '110.224.182.181', '2020-11-16 15:48:32'),
(580, 99, 'Yönetici girişi yapıldı.', '110.224.182.181', '2020-11-16 16:04:31'),
(581, 99, 'Yönetici girişi yapıldı.', '110.224.182.181', '2020-11-16 16:08:50'),
(582, 126, 'Üye girişi yapıldı.', '14.102.33.201', '2020-11-17 22:44:24'),
(583, 137, 'Kullanıcı kaydı yapıldı.', '192.145.125.90', '2020-11-20 01:30:48');
INSERT INTO `client_report` (`id`, `client_id`, `action`, `report_ip`, `report_date`) VALUES
(584, 137, 'Üye girişi yapıldı.', '192.145.125.90', '2020-11-20 01:31:46'),
(585, 99, 'Üye girişi yapıldı.', '110.224.185.151', '2020-11-28 22:37:52'),
(586, 99, '1.2 TL tutarında yeni sipariş geçildi #10.', '110.224.185.151', '2020-11-28 23:18:31'),
(587, 99, 'Yeni destek talebi oluşturuldu #10', '110.224.162.205', '2020-11-29 00:02:12'),
(588, 99, 'Üye girişi yapıldı.', '110.224.162.205', '2020-11-29 00:13:56'),
(589, 99, 'Üye girişi yapıldı.', '110.224.162.205', '2020-11-29 00:40:32'),
(590, 99, 'Üye girişi yapıldı.', '110.224.162.205', '2020-11-29 00:42:58'),
(591, 99, 'Üye girişi yapıldı.', '110.224.162.205', '2020-11-29 00:43:40'),
(592, 99, 'Üye girişi yapıldı.', '110.224.162.205', '2020-11-29 00:49:33'),
(593, 99, 'Üye girişi yapıldı.', '110.224.162.205', '2020-11-29 00:56:07'),
(594, 138, 'Kullanıcı kaydı yapıldı.', '110.224.183.37', '2020-11-29 01:03:56'),
(595, 99, 'Üye girişi yapıldı.', '110.224.183.37', '2020-11-29 01:07:14'),
(596, 99, '0 TL tutarında yeni sipariş geçildi #.', '110.224.183.37', '2020-11-29 01:52:01'),
(597, 99, 'Üye girişi yapıldı.', '106.193.196.227', '2020-11-29 10:02:56'),
(598, 99, 'Üye girişi yapıldı.', '27.56.207.119', '2020-11-29 10:05:40'),
(599, 99, 'Üye girişi yapıldı.', '27.56.207.119', '2020-11-29 10:11:54'),
(600, 99, 'Üye girişi yapıldı.', '27.56.207.119', '2020-11-29 11:25:10'),
(601, 99, 'Üye girişi yapıldı.', '27.56.207.119', '2020-11-29 11:43:45'),
(602, 99, 'Üye girişi yapıldı.', '27.56.207.119', '2020-11-29 11:53:59'),
(603, 140, 'Kullanıcı kaydı yapıldı.', '157.42.63.169', '2020-11-29 13:52:42'),
(604, 140, 'Üye girişi yapıldı.', '157.42.63.169', '2020-11-29 13:52:56'),
(605, 141, 'Kullanıcı kaydı yapıldı.', '27.56.207.119', '2020-11-29 16:13:34'),
(606, 141, 'Üye girişi yapıldı.', '27.56.207.119', '2020-11-29 16:13:46'),
(607, 115, 'Üye girişi yapıldı.', '157.42.172.131', '2020-11-29 20:26:47'),
(608, 99, 'Üye girişi yapıldı.', '27.56.207.119', '2020-11-29 22:37:41'),
(609, 99, 'Üye girişi yapıldı.', '27.56.207.119', '2020-11-30 17:20:03'),
(610, 141, 'Üye girişi yapıldı.', '27.56.207.119', '2020-11-30 17:21:45'),
(611, 99, 'Üye girişi yapıldı.', '27.56.207.119', '2020-11-30 20:03:07'),
(612, 99, 'Üye girişi yapıldı.', '106.210.229.29', '2020-12-03 10:59:29'),
(613, 99, 'Üye girişi yapıldı.', '27.56.218.117', '2020-12-03 10:59:34'),
(614, 115, 'Üye girişi yapıldı.', '157.35.228.163', '2020-12-03 11:23:55'),
(615, 142, 'Kullanıcı kaydı yapıldı.', '157.42.84.158', '2020-12-03 19:44:29'),
(616, 142, 'Üye girişi yapıldı.', '157.42.84.158', '2020-12-03 19:44:58'),
(617, 128, 'Üye girişi yapıldı.', '103.70.197.51', '2020-12-03 19:47:03'),
(618, 99, 'Yönetici girişi yapıldı.', '106.210.191.28', '2020-12-03 19:48:58'),
(619, 142, 'Yönetici girişi yapıldı.', '157.42.84.158', '2020-12-03 19:50:15'),
(620, 143, 'Kullanıcı kaydı yapıldı.', '180.244.235.181', '2020-12-04 06:50:08'),
(621, 143, 'Üye girişi yapıldı.', '180.244.235.181', '2020-12-04 06:50:23'),
(622, 144, 'Kullanıcı kaydı yapıldı.', '117.237.208.221', '2020-12-04 09:30:13'),
(623, 144, 'Üye girişi yapıldı.', '117.237.208.221', '2020-12-04 09:30:32'),
(624, 144, '0 TL tutarında yeni sipariş geçildi #11.', '117.237.208.221', '2020-12-04 09:32:46'),
(625, 144, '0 TL tutarında yeni sipariş geçildi #12.', '117.237.208.221', '2020-12-04 09:33:13'),
(626, 144, '0 TL tutarında yeni sipariş geçildi #13.', '117.237.208.221', '2020-12-04 09:33:41'),
(627, 144, '0 TL tutarında yeni sipariş geçildi #14.', '117.237.208.221', '2020-12-04 09:34:27'),
(628, 143, 'Üye girişi yapıldı.', '114.124.130.15', '2020-12-04 11:50:51'),
(629, 99, 'Yönetici girişi yapıldı.', '106.210.191.66', '2020-12-04 11:51:42'),
(630, 145, 'Kullanıcı kaydı yapıldı.', '14.102.33.198', '2020-12-04 12:52:50'),
(631, 145, 'Üye girişi yapıldı.', '14.102.33.198', '2020-12-04 12:53:04'),
(632, 141, 'Üye girişi yapıldı.', '110.224.160.186', '2020-12-04 13:22:36'),
(633, 146, 'Kullanıcı kaydı yapıldı.', '157.36.58.13', '2020-12-04 15:04:09'),
(634, 147, 'Kullanıcı kaydı yapıldı.', '157.44.77.107', '2020-12-04 19:48:12'),
(635, 147, 'Üye girişi yapıldı.', '157.44.77.107', '2020-12-04 19:48:26'),
(636, 148, 'Kullanıcı kaydı yapıldı.', '47.31.146.50', '2020-12-04 21:36:30'),
(637, 148, 'Üye girişi yapıldı.', '47.31.146.50', '2020-12-04 21:36:53'),
(638, 149, 'Kullanıcı kaydı yapıldı.', '106.210.191.66', '2020-12-04 22:58:03'),
(639, 99, 'Yönetici girişi yapıldı.', '106.210.191.66', '2020-12-04 23:50:10'),
(640, 145, 'Üye girişi yapıldı.', '14.102.33.198', '2020-12-05 13:26:32'),
(641, 143, 'Yönetici girişi yapıldı.', '180.244.233.131', '2020-12-05 17:36:39'),
(642, 149, 'Üye girişi yapıldı.', '103.3.220.60', '2020-12-05 18:12:11'),
(643, 99, 'Yönetici girişi yapıldı.', '106.220.134.34', '2020-12-05 20:50:13'),
(644, 128, 'Yönetici girişi yapıldı.', '106.204.5.217', '2020-12-05 20:52:03'),
(645, 150, 'Kullanıcı kaydı yapıldı.', '47.9.107.140', '2020-12-08 19:22:01'),
(646, 150, 'Üye girişi yapıldı.', '47.9.107.140', '2020-12-08 19:22:23'),
(647, 149, 'Yönetici girişi yapıldı.', '106.193.231.105', '2020-12-09 12:53:20'),
(648, 149, 'Yönetici girişi yapıldı.', '171.252.155.10', '2020-12-09 12:55:36'),
(649, 99, 'Yönetici girişi yapıldı.', '106.193.231.105', '2020-12-09 13:12:34'),
(650, 151, 'Kullanıcı kaydı yapıldı.', '117.233.102.163', '2020-12-09 20:01:12'),
(651, 151, 'Üye girişi yapıldı.', '117.233.102.163', '2020-12-09 20:01:39'),
(652, 152, 'Kullanıcı kaydı yapıldı.', '206.189.143.17', '2020-12-10 17:33:41'),
(653, 152, 'Üye girişi yapıldı.', '206.189.143.17', '2020-12-10 17:33:56'),
(654, 149, 'Yönetici girişi yapıldı.', '157.36.132.217', '2020-12-11 12:20:52'),
(655, 141, 'Üye girişi yapıldı.', '110.224.164.145', '2020-12-13 10:10:17'),
(656, 141, 'Üye girişi yapıldı.', '110.224.165.183', '2020-12-13 23:04:17'),
(657, 143, 'Üye girişi yapıldı.', '36.88.128.10', '2020-12-14 05:33:22'),
(658, 143, 'Üye girişi yapıldı.', '114.124.247.6', '2020-12-14 12:30:31'),
(659, 141, 'Üye girişi yapıldı.', '110.224.170.200', '2020-12-14 14:26:23'),
(660, 141, 'Üye girişi yapıldı.', '169.149.221.84', '2020-12-14 14:33:53'),
(661, 141, 'Üye girişi yapıldı.', '47.29.133.179', '2020-12-14 14:34:27'),
(662, 141, '0 TL tutarında yeni sipariş geçildi #.', '47.29.133.179', '2020-12-14 14:39:23'),
(663, 141, 'Üye girişi yapıldı.', '47.29.133.179', '2020-12-14 14:40:44'),
(664, 141, 'New 45  payment has been made with RazorPay', '47.29.133.179', '2020-12-14 14:42:32'),
(665, 141, 'Yeni destek talebi oluşturuldu #11', '47.29.133.179', '2020-12-14 14:46:54'),
(666, 141, 'Üye girişi yapıldı.', '169.149.235.14', '2020-12-14 14:48:13'),
(667, 141, 'API Key değiştirildi', '169.149.221.84', '2020-12-14 14:58:24'),
(668, 153, 'Kullanıcı kaydı yapıldı.', '45.124.146.33', '2020-12-14 15:12:18'),
(669, 153, 'Üye girişi yapıldı.', '45.124.146.33', '2020-12-14 15:12:31'),
(670, 99, 'Üye girişi yapıldı.', '110.224.168.190', '2020-12-14 15:19:31'),
(671, 141, 'Üye girişi yapıldı.', '47.29.133.179', '2020-12-14 15:27:18'),
(672, 141, '6 TL tutarında yeni sipariş geçildi #15.', '47.29.161.38', '2020-12-14 17:28:33'),
(673, 154, 'Kullanıcı kaydı yapıldı.', '182.70.101.154', '2020-12-14 18:59:26'),
(674, 154, 'Üye girişi yapıldı.', '182.70.101.154', '2020-12-14 18:59:59'),
(675, 149, 'Üye girişi yapıldı.', '182.70.101.154', '2020-12-14 19:01:47'),
(676, 149, 'Üye girişi yapıldı.', '114.124.196.0', '2020-12-17 16:08:13'),
(677, 149, 'Üye girişi yapıldı.', '122.161.93.245', '2020-12-17 17:56:24'),
(678, 141, 'New 50  payment has been made with RazorPay', '47.29.76.188', '2020-12-19 07:19:58'),
(679, 149, 'Üye girişi yapıldı.', '210.16.94.32', '2020-12-19 10:21:02'),
(680, 149, 'New 0.1  payment has been made with Perfect Money', '210.16.94.32', '2020-12-19 11:17:41'),
(681, 149, 'New 0.1  payment has been made with Perfect Money', '78.41.203.75', '2020-12-19 13:06:45'),
(682, 149, 'Yönetici girişi yapıldı.', '210.16.94.32', '2020-12-19 18:24:14'),
(683, 149, 'Üye girişi yapıldı.', '180.245.62.191', '2020-12-19 20:50:08'),
(684, 149, 'New 0.1  payment has been made with Perfect Money', '78.41.203.75', '2020-12-19 20:50:54'),
(685, 141, 'Üye girişi yapıldı.', '47.29.188.185', '2020-12-21 16:50:23'),
(686, 141, 'New 50  payment has been made with RazorPay', '47.29.188.185', '2020-12-21 17:08:06'),
(687, 141, 'Destek talebine yanıt verildi #11', '47.29.188.185', '2020-12-21 17:24:08'),
(688, 141, 'Yönetici girişi yapıldı.', '47.29.188.185', '2020-12-21 17:45:11'),
(689, 141, 'New 11  payment has been made with RazorPay', '47.29.188.185', '2020-12-21 17:46:59'),
(690, 141, 'Üye girişi yapıldı.', '47.29.188.185', '2020-12-21 17:54:42'),
(691, 99, 'Üye girişi yapıldı.', '110.224.185.157', '2020-12-21 18:35:34'),
(692, 141, 'Üye girişi yapıldı.', '47.29.188.185', '2020-12-21 18:44:27'),
(693, 141, 'Üye girişi yapıldı.', '47.29.188.185', '2020-12-21 21:10:48'),
(694, 141, 'New 100  payment has been made with RazorPay', '47.29.188.185', '2020-12-21 21:12:16'),
(695, 141, 'Üye girişi yapıldı.', '47.29.188.185', '2020-12-21 21:18:45'),
(696, 141, 'Yönetici girişi yapıldı.', '169.149.231.72', '2020-12-22 10:16:30'),
(697, 149, 'Yönetici girişi yapıldı.', '155.94.250.83', '2020-12-22 16:47:20'),
(698, 155, 'Kullanıcı kaydı yapıldı.', '171.79.129.200', '2020-12-22 17:00:56'),
(699, 155, 'Üye girişi yapıldı.', '171.79.129.200', '2020-12-22 17:01:09'),
(700, 156, 'Kullanıcı kaydı yapıldı.', '102.52.73.63', '2020-12-22 20:56:58'),
(701, 156, 'Üye girişi yapıldı.', '102.52.73.63', '2020-12-22 20:57:09'),
(702, 126, 'Üye girişi yapıldı.', '14.102.33.198', '2020-12-22 22:59:28'),
(703, 126, 'Yeni destek talebi oluşturuldu #12', '14.102.33.198', '2020-12-22 23:01:34'),
(704, 149, 'Yönetici girişi yapıldı.', '47.9.230.98', '2020-12-23 00:41:59'),
(705, 149, 'Üye girişi yapıldı.', '47.9.230.98', '2020-12-23 00:55:58'),
(706, 149, 'Üye girişi yapıldı.', '47.9.230.98', '2020-12-23 00:58:53'),
(707, 99, 'Yönetici girişi yapıldı.', '210.16.94.32', '2020-12-23 01:08:24'),
(708, 142, 'Üye girişi yapıldı.', '157.42.119.222', '2020-12-25 10:58:31'),
(709, 149, 'Yönetici girişi yapıldı.', '157.36.64.108', '2020-12-25 13:56:26'),
(710, 147, 'Üye girişi yapıldı.', '157.47.90.36', '2020-12-25 23:49:55'),
(711, 128, 'Üye girişi yapıldı.', '103.70.197.66', '2020-12-26 09:15:46'),
(712, 118, 'Üye girişi yapıldı.', '59.153.1.83', '2020-12-26 09:52:26'),
(713, 157, 'Kullanıcı kaydı yapıldı.', '183.83.163.32', '2020-12-26 12:36:28'),
(714, 157, 'Üye girişi yapıldı.', '183.83.163.32', '2020-12-26 12:36:39'),
(765, 115, 'Üye girişi yapıldı.', '157.42.82.113', '2021-01-03 09:54:09'),
(766, 149, 'Yönetici girişi yapıldı.', '124.253.158.159', '2021-01-03 14:41:24'),
(767, 141, 'Üye girişi yapıldı.', '47.29.249.53', '2021-01-03 21:33:48'),
(768, 161, 'Üye girişi yapıldı.', '157.42.184.70', '2021-01-04 15:52:24'),
(769, 149, 'Üye girişi yapıldı.', '124.253.237.190', '2021-01-04 15:58:05'),
(770, 149, 'Üye girişi yapıldı.', '157.47.193.247', '2021-01-04 17:47:14'),
(771, 149, 'Yönetici girişi yapıldı.', '197.132.41.176', '2021-01-04 23:58:16'),
(772, 99, 'Yönetici girişi yapıldı.', '210.16.94.32', '2021-01-05 13:38:55'),
(773, 141, '2.42592 TL tutarında yeni sipariş geçildi #17.', '110.224.182.67', '2021-01-05 19:15:42'),
(774, 141, 'New Child Panel Order with id : .', '110.224.181.45', '2021-01-06 11:09:10'),
(775, 141, 'New Child Panel Order with id : .', '110.224.181.45', '2021-01-06 11:10:42'),
(776, 141, 'New Child Panel Order with id : .', '110.224.181.45', '2021-01-06 11:10:57'),
(777, 141, 'New Child Panel Order with id : .', '110.224.181.45', '2021-01-06 11:11:25'),
(778, 141, 'New Child Panel Order with id : 1.', '110.224.181.45', '2021-01-06 11:14:28'),
(779, 141, 'New Child Panel Order with id : 2.', '110.224.181.45', '2021-01-06 11:14:41'),
(780, 141, 'New Child Panel Order with id : 3.', '110.224.181.140', '2021-01-06 12:26:55'),
(781, 141, 'New Child Panel Order with id : 4.', '110.224.181.140', '2021-01-06 12:33:12'),
(782, 141, 'New Child Panel Order with id : 5.', '110.224.181.140', '2021-01-06 12:34:33'),
(783, 141, 'New Child Panel Order with id : 6.', '110.224.181.140', '2021-01-06 12:35:10'),
(784, 141, 'New Child Panel Order with id : 7.', '110.224.181.140', '2021-01-06 12:36:28'),
(785, 141, 'New Child Panel Order with id : 8.', '110.224.181.140', '2021-01-06 12:37:42'),
(786, 141, 'New Child Panel Order with id : 9.', '110.224.181.140', '2021-01-06 12:37:48'),
(787, 141, 'New Child Panel Order with id : 10.', '110.224.181.140', '2021-01-06 12:42:26'),
(788, 141, 'New Child Panel Order with id : 11.', '110.224.181.140', '2021-01-06 12:44:11'),
(789, 141, 'New Child Panel Order with id : 12.', '110.224.181.140', '2021-01-06 12:46:15'),
(790, 141, 'New Child Panel Order with id : 13.', '110.224.181.140', '2021-01-06 12:47:55'),
(791, 141, 'New Child Panel Order with id : 14.', '110.224.181.140', '2021-01-06 12:48:39'),
(792, 141, 'New Child Panel Order with id : 15.', '110.224.181.140', '2021-01-06 12:49:21'),
(793, 141, 'New Child Panel Order with id : 16.', '110.224.181.140', '2021-01-06 12:49:49'),
(794, 141, 'New Child Panel Order with id : 17.', '110.224.181.140', '2021-01-06 12:50:25'),
(795, 141, 'New Child Panel Order with id : 18.', '110.224.181.140', '2021-01-06 12:50:46'),
(796, 141, '2.42592 TL tutarında yeni sipariş geçildi #18.', '110.224.181.140', '2021-01-06 12:54:45'),
(797, 141, 'New Child Panel Order with id : 19.', '110.224.181.140', '2021-01-06 12:56:20'),
(798, 141, 'New Child Panel Order with id : 20.', '110.224.181.140', '2021-01-06 12:57:09'),
(799, 141, 'New Child Panel Order with id : 21.', '110.224.181.140', '2021-01-06 12:59:11'),
(800, 141, 'New Child Panel Order with id : 22.', '110.224.181.140', '2021-01-06 13:01:57'),
(801, 141, 'New Child Panel Order with id : 23.', '110.224.181.140', '2021-01-06 13:05:47'),
(802, 141, 'New Child Panel Order with id : 24.', '110.224.181.140', '2021-01-06 13:10:18'),
(803, 141, 'New Child Panel Order with id : 25.', '110.224.181.140', '2021-01-06 13:11:50'),
(804, 141, 'New Child Panel Order with id : 26.', '110.224.181.140', '2021-01-06 13:13:14'),
(805, 141, 'New Child Panel Order with id : 27.', '110.224.181.140', '2021-01-06 13:13:36'),
(806, 141, 'New Child Panel Order with id : 28.', '110.224.181.140', '2021-01-06 13:14:47'),
(807, 141, 'New Child Panel Order with id : 29.', '110.224.181.140', '2021-01-06 13:17:20'),
(808, 141, 'New Child Panel Order with id : 30.', '110.224.181.140', '2021-01-06 13:55:02'),
(809, 149, 'Üye girişi yapıldı.', '171.51.148.215', '2021-01-07 08:22:21'),
(810, 141, 'Üye girişi yapıldı.', '110.224.164.126', '2021-01-07 23:07:40'),
(811, 141, 'Üye girişi yapıldı.', '110.224.164.126', '2021-01-07 23:10:56'),
(812, 141, 'Üye girişi yapıldı.', '110.224.164.126', '2021-01-07 23:18:16'),
(813, 141, 'Üye girişi yapıldı.', '110.224.164.126', '2021-01-07 23:37:25'),
(814, 99, 'Üye girişi yapıldı.', '210.16.94.32', '2021-01-09 22:05:05'),
(815, 141, 'Üye girişi yapıldı.', '110.224.185.192', '2021-01-09 22:13:06'),
(816, 149, 'Üye girişi yapıldı.', '157.48.169.34', '2021-01-10 10:14:18'),
(817, 149, 'Üye girişi yapıldı.', '157.48.169.34', '2021-01-10 10:17:14'),
(818, 149, 'Yeni destek talebi oluşturuldu #14', '197.132.135.180', '2021-01-10 10:22:17'),
(819, 164, 'Kullanıcı kaydı yapıldı.', '47.9.120.208', '2021-01-10 12:10:28'),
(820, 164, 'Üye girişi yapıldı.', '47.9.120.208', '2021-01-10 12:10:41'),
(821, 99, 'Yönetici girişi yapıldı.', '210.16.94.32', '2021-01-10 19:47:10'),
(822, 128, 'Üye girişi yapıldı.', '106.204.160.105', '2021-01-10 20:29:55'),
(823, 99, 'Üye girişi yapıldı.', '210.16.94.32', '2021-01-10 20:30:22'),
(824, 149, 'Üye girişi yapıldı.', '157.48.200.50', '2021-01-11 08:09:29'),
(825, 141, 'Üye girişi yapıldı.', '47.29.185.48', '2021-01-12 11:21:40'),
(826, 99, 'Yönetici girişi yapıldı.', '210.16.94.32', '2021-01-13 12:02:15'),
(827, 99, 'Üye girişi yapıldı.', '210.16.94.32', '2021-01-15 10:26:29'),
(828, 128, 'Üye girişi yapıldı.', '117.245.154.91', '2021-01-15 10:30:26'),
(829, 149, 'Yönetici girişi yapıldı.', '157.46.141.12', '2021-01-15 14:42:28'),
(830, 165, 'Kullanıcı kaydı yapıldı.', '157.46.141.12', '2021-01-15 14:52:05'),
(831, 165, 'Üye girişi yapıldı.', '157.46.141.12', '2021-01-15 14:52:19'),
(832, 149, 'Üye girişi yapıldı.', '106.192.59.8', '2021-01-15 20:00:05'),
(833, 149, 'Üye girişi yapıldı.', '106.192.59.8', '2021-01-15 20:03:18'),
(834, 166, 'Kullanıcı kaydı yapıldı.', '102.42.59.229', '2021-01-16 13:06:30'),
(835, 99, 'New Child Panel Order with id : 31.', '210.16.94.32', '2021-01-16 19:03:15'),
(836, 99, 'New Child Panel Order with id : 32.', '210.16.94.32', '2021-01-16 19:05:22'),
(837, 118, 'Üye girişi yapıldı.', '103.197.224.71', '2021-01-16 19:34:15'),
(838, 126, 'Üye girişi yapıldı.', '14.102.33.198', '2021-01-16 20:01:59'),
(839, 149, 'Yönetici girişi yapıldı.', '14.102.33.198', '2021-01-16 20:54:07'),
(840, 167, 'Kullanıcı kaydı yapıldı.', '157.38.92.199', '2021-01-16 21:53:56'),
(841, 167, 'Üye girişi yapıldı.', '157.38.92.199', '2021-01-16 21:54:31'),
(842, 165, 'Üye girişi yapıldı.', '157.46.150.9', '2021-01-17 11:28:40'),
(843, 99, 'Yönetici girişi yapıldı.', '210.16.94.32', '2021-01-17 13:07:09'),
(844, 149, 'Üye girişi yapıldı.', '171.79.74.89', '2021-01-17 13:08:38'),
(845, 149, 'Üye girişi yapıldı.', '157.42.126.228', '2021-01-17 22:00:12'),
(846, 149, '0.2688 TL tutarında yeni sipariş geçildi #19.', '209.58.147.242', '2021-01-18 23:14:11'),
(847, 168, 'Kullanıcı kaydı yapıldı.', '47.9.90.9', '2021-01-18 23:58:19'),
(848, 168, 'Üye girişi yapıldı.', '47.9.90.9', '2021-01-18 23:58:32'),
(849, 149, 'Yönetici girişi yapıldı.', '157.48.145.149', '2021-01-19 11:49:58'),
(850, 130, 'Üye girişi yapıldı.', '114.134.24.172', '2021-01-20 00:27:59'),
(851, 99, 'Yönetici girişi yapıldı.', '106.220.138.154', '2021-01-20 00:49:34'),
(852, 149, 'Üye girişi yapıldı.', '114.134.24.172', '2021-01-20 00:53:15'),
(853, 149, 'Yönetici girişi yapıldı.', '114.134.24.172', '2021-01-20 00:53:35'),
(854, 149, 'Yönetici girişi yapıldı.', '114.134.24.172', '2021-01-20 02:49:30'),
(855, 149, 'Üye girişi yapıldı.', '47.31.49.138', '2021-01-20 15:05:43'),
(856, 149, 'Destek talebine yanıt verildi #14', '47.31.13.47', '2021-01-20 15:06:19'),
(857, 149, 'Üye girişi yapıldı.', '223.182.52.220', '2021-01-21 19:11:11'),
(858, 149, 'Üye girişi yapıldı.', '223.182.52.220', '2021-01-21 20:41:50'),
(859, 149, 'Yönetici girişi yapıldı.', '124.253.151.103', '2021-01-23 13:00:19'),
(860, 169, 'Kullanıcı kaydı yapıldı.', '47.15.103.239', '2021-01-23 17:42:28'),
(861, 169, 'Üye girişi yapıldı.', '47.15.103.239', '2021-01-23 17:42:41'),
(862, 99, 'Yönetici girişi yapıldı.', '106.220.218.128', '2021-01-23 17:56:46'),
(863, 149, 'Yönetici girişi yapıldı.', '106.220.218.128', '2021-01-23 17:56:59'),
(864, 149, 'Yönetici girişi yapıldı.', '47.15.112.119', '2021-01-23 17:58:10'),
(865, 149, 'Yönetici girişi yapıldı.', '27.255.206.253', '2021-01-23 19:02:25'),
(866, 149, 'Yönetici girişi yapıldı.', '27.255.206.253', '2021-01-23 20:51:23'),
(867, 99, 'Yönetici girişi yapıldı.', '210.16.94.32', '2021-01-23 23:08:40'),
(868, 99, 'Yönetici girişi yapıldı.', '210.16.94.32', '2021-01-23 23:09:05'),
(869, 149, 'Üye girişi yapıldı.', '27.61.165.131', '2021-01-24 20:23:38'),
(870, 99, 'Yönetici girişi yapıldı.', '210.16.94.32', '2021-01-25 13:38:20'),
(871, 99, 'Yönetici girişi yapıldı.', '210.16.94.32', '2021-01-26 00:21:23'),
(872, 99, 'Üye girişi yapıldı.', '210.16.94.32', '2021-01-26 00:23:01'),
(874, 149, 'Yönetici girişi yapıldı.', '223.182.170.191', '2021-01-27 12:22:54'),
(876, 149, 'Yönetici girişi yapıldı.', '120.89.74.163', '2021-01-27 13:54:45'),
(877, 149, 'Yönetici girişi yapıldı.', '171.252.188.168', '2021-01-27 13:56:51'),
(878, 149, 'Yeni destek talebi oluşturuldu #15', '120.89.74.163', '2021-01-27 14:17:54'),
(879, 141, 'Üye girişi yapıldı.', '110.224.187.59', '2021-01-27 14:37:44'),
(880, 99, 'Üye girişi yapıldı.', '210.16.94.32', '2021-01-27 14:38:15'),
(881, 141, 'Üye girişi yapıldı.', '110.224.187.59', '2021-01-27 14:38:24'),
(882, 99, '0.152 TL tutarında yeni sipariş geçildi #20.', '210.16.94.32', '2021-01-27 14:59:25'),
(883, 141, '1.52 TL tutarında yeni sipariş geçildi #21.', '110.224.187.59', '2021-01-27 15:00:23'),
(884, 170, 'Kullanıcı kaydı yapıldı.', '157.42.30.245', '2021-01-27 15:04:33'),
(885, 170, 'Üye girişi yapıldı.', '157.42.30.245', '2021-01-27 15:04:48'),
(886, 141, '0.152 TL tutarında yeni sipariş geçildi #22.', '110.224.187.59', '2021-01-27 15:06:11'),
(887, 149, 'Üye girişi yapıldı.', '197.132.247.181', '2021-01-28 04:59:23'),
(888, 149, 'Yönetici girişi yapıldı.', '157.46.249.134', '2021-01-28 19:21:16'),
(889, 149, 'Üye girişi yapıldı.', '106.205.9.59', '2021-01-28 19:40:44'),
(890, 149, 'Üye girişi yapıldı.', '106.76.73.124', '2021-01-28 19:41:47'),
(891, 141, 'New Child Panel Order with id : .', '110.224.169.108', '2021-01-29 12:20:20'),
(892, 141, 'New Child Panel Order with id : 33.', '110.224.169.108', '2021-01-29 12:21:22'),
(893, 149, 'Yönetici girişi yapıldı.', '202.51.88.21', '2021-01-29 12:23:52'),
(894, 141, 'New Child Panel Order with id : 34.', '110.224.169.108', '2021-01-29 13:54:24'),
(895, 141, 'Child Panel Renewed with id : 33.', '110.224.169.10', '2021-01-29 17:45:53'),
(896, 141, 'Child Panel Renewed with id : 33.', '110.224.169.10', '2021-01-29 17:51:14'),
(897, 141, 'Child Panel Renewed with id : 34.', '110.224.169.10', '2021-01-29 17:52:17'),
(898, 149, 'Üye girişi yapıldı.', '157.48.213.186', '2021-01-29 19:33:38'),
(899, 149, 'Üye girişi yapıldı.', '106.76.73.18', '2021-01-29 19:34:47'),
(900, 149, 'Üye girişi yapıldı.', '110.235.219.147', '2021-01-30 00:02:48'),
(901, 149, '0 TL tutarında yeni sipariş geçildi #.', '157.48.209.207', '2021-01-30 11:29:07'),
(902, 149, 'Yönetici girişi yapıldı.', '27.61.57.201', '2021-01-30 11:39:50'),
(903, 149, 'Üye girişi yapıldı.', '178.218.103.83', '2021-01-30 13:41:52'),
(904, 99, 'Yönetici girişi yapıldı.', '210.16.94.32', '2021-01-30 14:22:51'),
(905, 141, 'Child Panel Renewed with id : 34.', '110.224.168.107', '2021-01-30 14:48:34'),
(906, 141, 'Child Panel Renewed with id : 33.', '110.224.168.107', '2021-01-30 14:51:27'),
(907, 141, 'Child Panel Renewed with id : 34.', '110.224.168.107', '2021-01-30 14:57:00'),
(908, 141, 'Child Panel Renewed with id : 34.', '110.224.168.107', '2021-01-30 15:01:44'),
(909, 141, 'Child Panel Renewed with id : 34.', '110.224.168.107', '2021-01-30 15:02:44'),
(910, 141, 'Child Panel Renewed with id : 33.', '110.224.168.107', '2021-01-30 15:08:31'),
(911, 141, 'Child Panel Renewed with id : 33.', '110.224.168.107', '2021-01-30 15:13:18'),
(912, 141, 'New Child Panel Order with id : 35.', '110.224.168.107', '2021-01-30 15:14:18'),
(913, 141, 'Child Panel Renewed with id : 33.', '110.224.168.107', '2021-01-30 15:19:30'),
(914, 141, 'Child Panel Renewed with id : 33.', '110.224.179.26', '2021-01-30 23:39:58'),
(915, 141, '0.001 TL tutarında yeni sipariş geçildi #23.', '110.224.174.142', '2021-01-31 11:04:25'),
(916, 141, '4.5 TL tutarında yeni sipariş geçildi #24.', '110.224.174.142', '2021-01-31 11:23:42'),
(917, 141, '4.5 TL tutarında yeni sipariş geçildi #.', '110.224.174.142', '2021-01-31 11:52:02'),
(918, 141, '4.5 TL tutarında yeni sipariş geçildi #.', '110.224.174.142', '2021-01-31 11:53:23'),
(919, 141, '4.5 TL tutarında yeni sipariş geçildi #.', '110.224.174.142', '2021-01-31 11:54:56'),
(920, 141, '4.5 TL tutarında yeni sipariş geçildi #.', '110.224.174.142', '2021-01-31 11:57:34'),
(921, 141, '4.5 TL tutarında yeni sipariş geçildi #25.', '110.224.174.142', '2021-01-31 11:59:49'),
(922, 141, '4.5 TL tutarında yeni sipariş geçildi #26.', '110.224.174.142', '2021-01-31 12:09:50'),
(923, 171, 'Kullanıcı kaydı yapıldı.', '42.111.212.35', '2021-06-05 17:57:36'),
(924, 171, 'Üye girişi yapıldı.', '42.111.212.35', '2021-06-05 17:59:00'),
(925, 171, 'Üye girişi yapıldı.', '42.111.212.35', '2021-06-05 18:10:59'),
(926, 171, 'Üye girişi yapıldı.', '42.111.212.35', '2021-06-05 19:59:05'),
(927, 171, '0 TL tutarında yeni sipariş geçildi #.', '42.111.212.35', '2021-06-05 19:59:34'),
(928, 171, 'Yönetici girişi yapıldı.', '42.111.212.35', '2021-06-05 20:43:51'),
(929, 172, 'Kullanıcı kaydı yapıldı.', '42.111.220.162', '2021-06-06 11:30:36'),
(930, 172, 'Üye girişi yapıldı.', '42.111.220.162', '2021-06-06 11:30:47'),
(931, 172, 'Üye girişi yapıldı.', '42.111.220.162', '2021-06-06 11:41:40'),
(932, 172, 'Üye girişi yapıldı.', '42.111.220.162', '2021-06-06 11:48:53'),
(933, 172, 'Üye girişi yapıldı.', '42.111.220.162', '2021-06-06 12:06:28'),
(934, 173, 'Kullanıcı kaydı yapıldı.', '157.47.235.217', '2021-06-06 14:00:57'),
(935, 173, 'Üye girişi yapıldı.', '157.47.235.217', '2021-06-06 14:01:37'),
(936, 174, 'Kullanıcı kaydı yapıldı.', '157.32.126.25', '2021-06-06 19:40:32'),
(937, 174, 'Üye girişi yapıldı.', '27.61.190.245', '2021-06-06 19:41:59'),
(938, 171, 'Yönetici girişi yapıldı.', '42.111.204.16', '2021-06-09 14:11:38'),
(939, 171, 'Üye girişi yapıldı.', '157.33.41.89', '2021-06-09 14:14:18'),
(940, 172, 'Yönetici girişi yapıldı.', '42.111.216.170', '2021-06-13 08:55:52'),
(941, 172, 'Yönetici girişi yapıldı.', '106.0.38.119', '2021-06-13 09:11:33'),
(942, 172, 'Yönetici girişi yapıldı.', '106.204.235.55', '2021-06-13 09:11:38'),
(943, 172, 'Yönetici girişi yapıldı.', '106.204.235.55', '2021-06-13 09:14:43'),
(947, 176, 'Kullanıcı kaydı yapıldı.', '47.15.185.102', '2021-06-14 09:06:40'),
(948, 176, 'Üye girişi yapıldı.', '47.15.185.102', '2021-06-14 09:06:47'),
(949, 177, 'Kullanıcı kaydı yapıldı.', '223.225.171.109', '2021-06-14 11:11:03'),
(950, 177, 'Üye girişi yapıldı.', '223.225.171.109', '2021-06-14 11:11:15'),
(951, 175, 'Yönetici girişi yapıldı.', '157.37.155.193', '2021-06-14 11:27:29'),
(952, 175, 'Yönetici girişi yapıldı.', '223.225.171.109', '2021-06-14 11:28:26'),
(953, 175, 'Yönetici girişi yapıldı.', '62.201.242.60', '2021-06-14 13:10:07'),
(954, 175, 'Üye girişi yapıldı.', '106.220.107.171', '2021-06-14 18:44:55'),
(955, 178, 'Kullanıcı kaydı yapıldı.', '47.247.207.230', '2021-06-15 13:33:53'),
(956, 178, 'Üye girişi yapıldı.', '47.247.207.230', '2021-06-15 13:34:01'),
(957, 179, 'Kullanıcı kaydı yapıldı.', '157.37.157.251', '2021-06-16 09:41:54'),
(958, 179, 'Üye girişi yapıldı.', '157.37.157.251', '2021-06-16 09:42:13'),
(959, 175, 'Üye girişi yapıldı.', '47.31.210.2', '2021-06-16 13:06:22'),
(960, 175, 'Yönetici girişi yapıldı.', '42.111.204.83', '2021-06-16 13:15:05'),
(961, 175, 'Üye girişi yapıldı.', '157.37.168.140', '2021-06-21 13:33:58'),
(962, 175, 'Yönetici girişi yapıldı.', '157.37.168.140', '2021-06-21 14:36:02'),
(963, 180, 'Kullanıcı kaydı yapıldı.', '27.61.126.193', '2021-06-21 14:46:07'),
(964, 180, 'Üye girişi yapıldı.', '27.61.126.193', '2021-06-21 14:46:49'),
(965, 180, 'Üye girişi yapıldı.', '223.228.237.157', '2021-06-21 15:08:00'),
(966, 175, 'Yönetici girişi yapıldı.', '157.37.168.140', '2021-06-21 15:45:49'),
(967, 175, 'Üye girişi yapıldı.', '157.37.164.5', '2021-06-21 16:22:11'),
(968, 175, 'Yönetici girişi yapıldı.', '132.154.133.106', '2021-06-21 16:35:29'),
(969, 175, 'Yönetici girişi yapıldı.', '223.228.237.157', '2021-06-21 16:41:25'),
(970, 175, 'Üye girişi yapıldı.', '157.37.189.248', '2021-06-21 18:17:22'),
(971, 175, 'Üye girişi yapıldı.', '103.100.4.197', '2021-06-21 22:21:15'),
(972, 181, 'Kullanıcı kaydı yapıldı.', '157.42.234.206', '2021-06-22 00:12:07'),
(973, 181, 'Üye girişi yapıldı.', '157.42.234.206', '2021-06-22 00:12:39'),
(974, 182, 'Kullanıcı kaydı yapıldı.', '157.44.223.251', '2021-06-22 18:07:42'),
(975, 182, 'Üye girişi yapıldı.', '157.44.223.251', '2021-06-22 18:07:53'),
(976, 182, 'Üye girişi yapıldı.', '157.44.223.251', '2021-06-22 18:08:05'),
(977, 175, 'Yönetici girişi yapıldı.', '47.9.236.126', '2021-06-22 18:40:24');

-- --------------------------------------------------------

--
-- Table structure for table `kuponlar`
--

CREATE TABLE `kuponlar` (
  `id` int(11) NOT NULL,
  `kuponadi` varchar(255) NOT NULL,
  `adet` int(11) NOT NULL,
  `tutar` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kuponlar`
--

INSERT INTO `kuponlar` (`id`, `kuponadi`, `adet`, `tutar`) VALUES
(14, 'codeclub', 9, 1000),
(15, 'codeclub1', 142, 42);

-- --------------------------------------------------------

--
-- Table structure for table `kupon_kullananlar`
--

CREATE TABLE `kupon_kullananlar` (
  `id` int(11) NOT NULL,
  `uye_id` int(11) NOT NULL,
  `kuponadi` varchar(255) NOT NULL,
  `tutar` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(11) NOT NULL,
  `language_name` varchar(225) NOT NULL,
  `language_code` varchar(225) NOT NULL,
  `language_type` enum('2','1') NOT NULL DEFAULT '2',
  `default_language` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `language_name`, `language_code`, `language_type`, `default_language`) VALUES
(1, 'Türkçe', 'tr', '1', '0'),
(2, 'English', 'en', '2', '1');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `api_orderid` int(11) NOT NULL DEFAULT '0',
  `order_error` text NOT NULL,
  `order_detail` text,
  `order_api` int(11) NOT NULL DEFAULT '0',
  `api_serviceid` int(11) NOT NULL DEFAULT '0',
  `api_charge` double NOT NULL DEFAULT '0',
  `api_currencycharge` double DEFAULT '1',
  `order_profit` double NOT NULL,
  `order_quantity` double NOT NULL,
  `order_extras` text NOT NULL,
  `order_charge` double NOT NULL,
  `dripfeed` enum('1','2','3') DEFAULT '1' COMMENT '2 -> ON, 1 -> OFF',
  `dripfeed_id` double NOT NULL DEFAULT '0',
  `subscriptions_id` double NOT NULL DEFAULT '0',
  `subscriptions_type` enum('1','2') NOT NULL DEFAULT '1' COMMENT '2 -> ON, 1 -> OFF',
  `dripfeed_totalcharges` double DEFAULT NULL,
  `dripfeed_runs` double DEFAULT NULL,
  `dripfeed_delivery` double NOT NULL DEFAULT '0',
  `dripfeed_interval` double DEFAULT NULL,
  `dripfeed_totalquantity` double DEFAULT NULL,
  `dripfeed_status` enum('active','completed','canceled') NOT NULL DEFAULT 'active',
  `order_url` text NOT NULL,
  `order_start` double NOT NULL DEFAULT '0',
  `order_finish` double NOT NULL DEFAULT '0',
  `order_remains` double NOT NULL DEFAULT '0',
  `order_create` datetime NOT NULL,
  `order_status` enum('pending','inprogress','completed','partial','processing','canceled') NOT NULL DEFAULT 'pending',
  `subscriptions_status` enum('active','paused','completed','canceled','expired','limit') NOT NULL DEFAULT 'active',
  `subscriptions_username` text,
  `subscriptions_posts` double DEFAULT NULL,
  `subscriptions_delivery` double NOT NULL DEFAULT '0',
  `subscriptions_delay` double DEFAULT NULL,
  `subscriptions_min` double DEFAULT NULL,
  `subscriptions_max` double DEFAULT NULL,
  `subscriptions_expiry` date DEFAULT NULL,
  `is_refill` enum('true','false') NOT NULL DEFAULT 'false',
  `last_check` datetime NOT NULL,
  `order_where` enum('site','api') NOT NULL DEFAULT 'site'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `page_id` int(11) NOT NULL,
  `page_name` varchar(225) NOT NULL,
  `page_get` varchar(225) NOT NULL,
  `page_content` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`page_id`, `page_name`, `page_get`, `page_content`) VALUES
(1, 'Login', 'auth', '<p>BEST CHEAPEST SMM PANEL</p>'),
(2, 'New Order', 'neworder', '<div class=\"alert alert-danger\" role=\"alert\">\r\n  100% Drop in Bot Followers</div>'),
(3, 'Services', 'services', ''),
(4, 'Add Funds', 'addfunds', '<p><br></p>'),
(5, 'Tickets', 'tickets', '<p><font style=\"vertical-align: inherit;\"><font style=\"vertical-align: inherit;\">faf</font></font></p>'),
(6, 'Terms', 'terms', '<p><label style=\"font-size: 30px; font-family: &quot;Visby Round Cf&quot;;\">1. Genel</label><br style=\"font-family: &quot;Visby Round Cf&quot;;\"><span style=\"font-family: &quot;Visby Round Cf&quot;;\">● Varsayılan minimum ödeme tutarı 5TL\'dir.</span><br style=\"font-family: &quot;Visby Round Cf&quot;;\"><span style=\"font-family: &quot;Visby Round Cf&quot;;\">● Atm ile bakiye yatıranlar kesintiyi karşılamalıdır, hesabımıza geçen ücret kadar bakiyeleri olacaktır.</span><br style=\"font-family: &quot;Visby Round Cf&quot;;\"><span style=\"font-family: &quot;Visby Round Cf&quot;;\">●&nbsp;</span><a href=\"https://takipcimedyasi.com/\" style=\"background-color: rgb(255, 255, 255); color: rgb(42, 100, 150); text-decoration-line: underline; outline: 0px;\">takipcimedyasi.com</a><span style=\"font-family: &quot;Visby Round Cf&quot;;\">&nbsp;servis fiyatlarını önceden haber vermeksizin herhangi bir zamanda değiştirebilir. Ödeme / Geri Ödeme politikası sabit kalır.</span><br style=\"font-family: &quot;Visby Round Cf&quot;;\"><span style=\"font-family: &quot;Visby Round Cf&quot;;\">●</span><a href=\"https://takipcimedyasi.com/\" style=\"background-color: rgb(255, 255, 255); color: rgb(42, 100, 150); text-decoration-line: underline; outline: 0px;\">takipcimedyasi.com</a><span style=\"font-family: &quot;Visby Round Cf&quot;;\">&nbsp;herhangi bir hizmet için teslimat süresini garanti etmez. Servislerde yazılı olan başlama süreleri belirttiğimiz en yakın tahminlerdir.</span><br style=\"font-family: &quot;Visby Round Cf&quot;;\"><span style=\"font-family: &quot;Visby Round Cf&quot;;\">● 1 Link için aynı anda sadece 1 sipariş girilebilir, 2 sipariş birden girildiğinde eksik gönderimler olabilir, sorumlusu&nbsp;</span><a href=\"https://takipcimedyasi.com/\" style=\"background-color: rgb(255, 255, 255); color: rgb(42, 100, 150); text-decoration-line: underline; outline: 0px;\">takipcimedyasi.com</a><span style=\"font-family: &quot;Visby Round Cf&quot;;\">&nbsp;değildir.</span><br style=\"font-family: &quot;Visby Round Cf&quot;;\"><span style=\"font-family: &quot;Visby Round Cf&quot;;\">●&nbsp;</span><a href=\"https://takipcimedyasi.com/\">takipcimedyasi.com</a>&nbsp;<span style=\"font-family: &quot;Visby Round Cf&quot;;\">Instagram, Facebook, Twitter veya sunduğu herhangi bir hizmet için, işlem yapılan hesabın askıya alınması, kapatılması gibi olası durumlarda mesuliyet kabul etmez.</span><br style=\"font-family: &quot;Visby Round Cf&quot;;\"><span style=\"font-family: &quot;Visby Round Cf&quot;;\">● Her servise verilen limit, hesap başına verilen limittir. Max 3k limitli bir servisten yararlanan hesap 4k çekim yapamaz.</span><br style=\"font-family: &quot;Visby Round Cf&quot;;\"><span style=\"font-family: &quot;Visby Round Cf&quot;;\">● Ürünlerin karşılarında belirtilen ücretler 1.000 (1K) ücretidir.</span><br style=\"font-family: &quot;Visby Round Cf&quot;;\"><span style=\"font-family: &quot;Visby Round Cf&quot;;\">● Sipariş girdiğiniz taktirde ürünün altındaki bilgilendirme varsa bilgilendirmeyi okumuş ve kabul etmiş olduğunuz anlamına gelir. Bu durum ile ilgili iade adminin insiyatifine bırakılmıştır.</span><br style=\"font-family: &quot;Visby Round Cf&quot;;\"><span style=\"font-family: &quot;Visby Round Cf&quot;;\">● </span><a href=\"https://takipcimedyasi.com/\" style=\"background-color: rgb(255, 255, 255); color: rgb(42, 100, 150); text-decoration-line: underline; outline: 0px;\">takipcimedyasi.com</a><span style=\"font-family: &quot;Visby Round Cf&quot;;\">\'dan aldığınız tüm hizmetler adınıza faturalandırılır. ●&nbsp;</span><br style=\"font-family: &quot;Visby Round Cf&quot;;\"><br style=\"font-family: &quot;Visby Round Cf&quot;;\"><br style=\"font-family: &quot;Visby Round Cf&quot;;\"><label style=\"font-size: 30px; font-family: &quot;Visby Round Cf&quot;;\">2. Hizmet</label><br style=\"font-family: &quot;Visby Round Cf&quot;;\"><span style=\"font-family: &quot;Visby Round Cf&quot;;\">●</span><a href=\"https://takipcimedyasi.com/\" style=\"background-color: rgb(255, 255, 255); color: rgb(42, 100, 150); text-decoration-line: underline; outline: 0px;\">takipcimedyasi.com</a><span style=\"font-family: &quot;Visby Round Cf&quot;;\">&nbsp;İnstagram/Twitter/Facebook veya başka bir Sosyal Medya hesabı için sadece \"Görünüm\" artırmaya yardımcı olmak için kullanılacaktır.</span><br style=\"font-family: &quot;Visby Round Cf&quot;;\"><span style=\"font-family: &quot;Visby Round Cf&quot;;\">●&nbsp;</span><a href=\"https://takipcimedyasi.com/\" style=\"background-color: rgb(255, 255, 255); color: rgb(42, 100, 150); text-decoration-line: underline; outline: 0px;\">takipcimedyasi.com</a><span style=\"font-family: &quot;Visby Round Cf&quot;;\">&nbsp;yeni takipçiler ve etkileşim garantisi vermez, sadece ödeme yapılarak alınan miktarı garanti eder.</span><br style=\"font-family: &quot;Visby Round Cf&quot;;\"><span style=\"font-family: &quot;Visby Round Cf&quot;;\">● Tüm bot hesapları gerçek görünüme dönüştürmek için çalışıyoruz, ancak hesaplarımızın %100 profil resimli, biyografili ve paylaşımlı hesaplar olacağının garantisini vermiyoruz.</span><br style=\"font-family: &quot;Visby Round Cf&quot;;\"><span style=\"font-family: &quot;Visby Round Cf&quot;;\">● Gizli hesaplara işlem yapıldığında sorumluluk üyeye aittir. Sipariş vermeden önce lütfen hesabın herkese açık olduğundan emin olun.</span><br style=\"font-family: &quot;Visby Round Cf&quot;;\"><br style=\"font-family: &quot;Visby Round Cf&quot;;\"><label style=\"font-size: 30px; font-family: &quot;Visby Round Cf&quot;;\">İade politikası</label><br style=\"font-family: &quot;Visby Round Cf&quot;;\"><span style=\"font-family: &quot;Visby Round Cf&quot;;\">● Yapılan ödemelerde geri iade mümkün değildir,&nbsp;</span><a href=\"https://takipcimedyasi.com/\" style=\"background-color: rgb(255, 255, 255); color: rgb(42, 100, 150); text-decoration-line: underline; outline: 0px;\">takipcimedyasi.com</a><span style=\"font-family: &quot;Visby Round Cf&quot;;\">&nbsp;hizmetlerinde kullanılması gerekir.</span><br style=\"font-family: &quot;Visby Round Cf&quot;;\"><span style=\"font-family: &quot;Visby Round Cf&quot;;\">● Instagram/Twitter/Facebook vb. servislerin ne zaman güncelleme yapabileceğini bilemeyiz, herhangi bir düşüş yaşanması halinde servis sağlayıcısı telafi yapmadığı sürece iade yapılamaz.</span><br style=\"font-family: &quot;Visby Round Cf&quot;;\"><span style=\"font-family: &quot;Visby Round Cf&quot;;\">● Siparişler sisteme girildikten sonra iptal/iade talebiniz kabul edilmeyecektir. Eğer sipariş tamamlanmazsa/kısmen tamamlanırsa sistem otomatik olarak geri ödeme yapacaktır.</span><br style=\"font-family: &quot;Visby Round Cf&quot;;\"><span style=\"font-family: &quot;Visby Round Cf&quot;;\">●</span><a href=\"https://takipcimedyasi.com/\" style=\"background-color: rgb(255, 255, 255); color: rgb(42, 100, 150); text-decoration-line: underline; outline: 0px;\">takipcimedyasi.com</a><span style=\"font-family: &quot;Visby Round Cf&quot;;\">&nbsp;yapılan ödemelerde herhangi bir ters ibraz, geri çekme söz konusu olursa üyeyi uzaklaştırma hakkını saklı tutar.</span><br style=\"font-family: &quot;Visby Round Cf&quot;;\"><span style=\"font-family: &quot;Visby Round Cf&quot;;\">● Yetkisiz işlem veya çalıntı kredi kartı, herhangi bir hileli faaliyette üye hesabı istisnasız kapatılacaktır.</span><br style=\"font-family: &quot;Visby Round Cf&quot;;\"><br style=\"font-family: &quot;Visby Round Cf&quot;;\"><br style=\"font-family: &quot;Visby Round Cf&quot;;\"><label style=\"font-size: 30px; font-family: &quot;Visby Round Cf&quot;;\">Gizlilik politikası</label><br style=\"font-family: &quot;Visby Round Cf&quot;;\"><span style=\"font-family: &quot;Visby Round Cf&quot;;\">● Bu politika kişisel bilgilerinizin nasıl kullanacağını kapsar. Gizliliğiniz bizim için önemlidir ve korumak için her türlü önlem alınmaktadır.</span><br style=\"font-family: &quot;Visby Round Cf&quot;;\"><span style=\"font-family: &quot;Visby Round Cf&quot;;\">● Sisteme girilen tüm bilgiler şifreli ve güvenli sunucularda barındırılır.</span><br style=\"font-family: &quot;Visby Round Cf&quot;;\"><span style=\"font-family: &quot;Visby Round Cf&quot;;\">● Bilgileriniz hiçbir şekilde 3. kişiler ile paylaşılmaz.</span><br style=\"font-family: &quot;Visby Round Cf&quot;;\"><span style=\"font-family: &quot;Visby Round Cf&quot;;\">● Firma tarafından kampanyalar hakkında bilgi sms gelebilmektedir</span><br></p>'),
(7, 'FAQ', 'faq', '<p>Who is Devolper FinalSmmPanel?</p><p>Ans: <b>Abusaleh Infotech</b></p>'),
(10, 'Child Panel', 'child-panels', '<div class=\"alert alert-danger\" role=\"alert\">\r\n  </div>');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL DEFAULT '0',
  `client_balance` double NOT NULL DEFAULT '0',
  `payment_amount` double NOT NULL DEFAULT '0',
  `payment_privatecode` double DEFAULT NULL,
  `payment_method` int(11) NOT NULL DEFAULT '-1',
  `payment_status` enum('1','2','3') NOT NULL DEFAULT '1',
  `payment_delivery` enum('1','2') NOT NULL DEFAULT '1',
  `payment_note` text,
  `payment_mode` enum('Manuel','Otomatik') NOT NULL DEFAULT 'Otomatik',
  `payment_create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `payment_update_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `payment_ip` varchar(225) DEFAULT NULL,
  `payment_extra` text,
  `payment_bank` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `client_id`, `client_balance`, `payment_amount`, `payment_privatecode`, `payment_method`, `payment_status`, `payment_delivery`, `payment_note`, `payment_mode`, `payment_create_date`, `payment_update_date`, `payment_ip`, `payment_extra`, `payment_bank`) VALUES
(1, 175, 0, 100, NULL, 15, '1', '1', NULL, 'Otomatik', '2021-06-14 12:38:19', '2021-06-14 12:38:19', '157.37.155.193', '1623654499', 0),
(2, 175, 0, 100, NULL, 13, '1', '1', NULL, 'Otomatik', '2021-06-14 12:38:43', '2021-06-14 12:38:43', '157.37.155.193', 'ec823bbbd6506cf8e809e7941c2647fc', 0),
(3, 175, 0, 100, NULL, 15, '1', '1', NULL, 'Otomatik', '2021-06-21 13:37:17', '2021-06-21 13:37:17', '157.37.168.140', '1624262837', 0);

-- --------------------------------------------------------

--
-- Table structure for table `payments_bonus`
--

CREATE TABLE `payments_bonus` (
  `bonus_id` int(11) NOT NULL,
  `bonus_method` int(11) NOT NULL,
  `bonus_from` double NOT NULL,
  `bonus_amount` double NOT NULL,
  `bonus_type` enum('1','2') NOT NULL DEFAULT '2'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payments_bonus`
--

INSERT INTO `payments_bonus` (`bonus_id`, `bonus_method`, `bonus_from`, `bonus_amount`, `bonus_type`) VALUES
(1, 1, 1, 10, '2'),
(2, 13, 1000, 1, '2');

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` int(11) NOT NULL,
  `method_name` varchar(225) NOT NULL,
  `method_get` varchar(225) NOT NULL,
  `method_min` double NOT NULL,
  `method_max` double NOT NULL,
  `method_type` enum('1','2') NOT NULL DEFAULT '2' COMMENT '2 -> ON, 1 -> OFF	',
  `method_extras` text NOT NULL,
  `method_line` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `method_name`, `method_get`, `method_min`, `method_max`, `method_type`, `method_extras`, `method_line`) VALUES
(1, 'Paypal', 'paypal', 1, 0, '2', '{\"method_type\":\"2\",\"name\":\"Paypal\",\"min\":\"1\",\"max\":\"0\",\"client_id\":\"dfsdffsfsdfdsfsdfsdfs\",\"client_secret\":\"sdasdadada4cqKLXaNZh1ruiAEmqynjwUuV7moFI6D4Y8JQiF6lv30cJXPvbDZtov3hBBg\",\"fee\":\"10\"}', 4),
(12, 'PayTM', 'paytm', 1, 10000, '2', '{\"method_type\":\"2\",\"name\":\"PayTM\",\"min\":\"1\",\"max\":\"10000\",\"merchant_key\":\"\",\"merchant_mid\":\"\",\"merchant_website\":\"DEFAULT\",\"fee\":\"0\"}', 1),
(13, 'RazorPay', 'razorpay', 1, 0, '2', '{\"method_type\":\"2\",\"name\":\"Razorpay\",\"min\":\"1\",\"max\":\"0\",\"public_key\":\"rzp_test_i2FFGuIEvPDig7\",\"key_secret\":\"djBffjsBkWHWjSbCoNRGIg60\",\"merchant_website\":\"https:\\/\\/api.razorpay.com\\/v1\\/orders\",\"fee\":\"0\"}', 3),
(14, 'PayTM QR', 'paytmqr', 1, 0, '2', '{\"method_type\":\"2\",\"name\":\"PayTMQR\",\"min\":\"1\",\"max\":\"0\",\"merchant_key\":\"\\/img\\/paytm_qr.png\",\"merchant_mid\":\"yhGaPK21364483087044\",\"merchant_website\":\"DEFAULT\",\"fee\":\"0\"}', 2),
(15, 'Perfect Money', 'perfectmoney', 0, 10000, '2', '{\"method_type\":\"2\",\"name\":\"Perfect Money\",\"min\":\"0\",\"max\":\"10000\",\"passphrase\":\"B8h3EV2OG52mkXxVWZWXOKuot\",\"usd\":\"U27083432\",\"merchant_website\":\"FinalSmmPanel\",\"fee\":\"0\"}', 5);

-- --------------------------------------------------------

--
-- Table structure for table `serviceapi_alert`
--

CREATE TABLE `serviceapi_alert` (
  `id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `serviceapi_alert` text NOT NULL,
  `servicealert_extra` text NOT NULL,
  `servicealert_date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `service_id` int(11) NOT NULL,
  `service_api` int(11) NOT NULL DEFAULT '0',
  `api_service` int(11) NOT NULL DEFAULT '0',
  `api_servicetype` enum('1','2') NOT NULL DEFAULT '2',
  `api_detail` text NOT NULL,
  `category_id` int(11) NOT NULL,
  `service_line` double NOT NULL,
  `service_type` enum('1','2') NOT NULL DEFAULT '2',
  `service_package` enum('1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17') NOT NULL,
  `service_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `service_description` text,
  `service_price` double NOT NULL DEFAULT '0',
  `service_min` double NOT NULL,
  `service_max` double NOT NULL,
  `service_dripfeed` enum('1','2') NOT NULL DEFAULT '1',
  `service_autotime` double NOT NULL DEFAULT '0',
  `service_autopost` double NOT NULL DEFAULT '0',
  `service_speed` enum('1','2','3','4') NOT NULL,
  `want_username` enum('1','2') NOT NULL DEFAULT '1',
  `service_secret` enum('1','2') NOT NULL DEFAULT '2',
  `price_type` enum('normal','percent','amount') NOT NULL DEFAULT 'normal',
  `price_cal` text,
  `instagram_second` enum('1','2') NOT NULL DEFAULT '2',
  `start_count` enum('none','instagram_follower','instagram_photo','') NOT NULL,
  `instagram_private` enum('1','2') NOT NULL,
  `name_lang` text,
  `description_lang` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`service_id`, `service_api`, `api_service`, `api_servicetype`, `api_detail`, `category_id`, `service_line`, `service_type`, `service_package`, `service_name`, `service_description`, `service_price`, `service_min`, `service_max`, `service_dripfeed`, `service_autotime`, `service_autopost`, `service_speed`, `want_username`, `service_secret`, `price_type`, `price_cal`, `instagram_second`, `start_count`, `instagram_private`, `name_lang`, `description_lang`) VALUES
(1, 0, 0, '2', '', 1, 1, '2', '1', 'faizullah', '', 0, 50, 1000, '1', 0, 0, '1', '1', '2', 'normal', NULL, '2', 'none', '1', '\"faizullah\"', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `service_api`
--

CREATE TABLE `service_api` (
  `id` int(11) NOT NULL,
  `api_name` varchar(225) NOT NULL,
  `api_url` text NOT NULL,
  `api_key` varchar(225) NOT NULL,
  `api_type` int(11) NOT NULL,
  `api_limit` double NOT NULL DEFAULT '0',
  `currency` enum('INR','USD') DEFAULT NULL,
  `api_alert` enum('1','2') NOT NULL DEFAULT '2' COMMENT '2 -> Gönder, 1 -> Gönderildi'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `site_seo` text NOT NULL,
  `site_title` text,
  `site_description` text,
  `site_keywords` text,
  `site_logo` text,
  `site_name` text,
  `site_currency` varchar(2555) NOT NULL DEFAULT 'try',
  `favicon` text,
  `site_language` varchar(225) NOT NULL DEFAULT 'tr',
  `site_theme` text NOT NULL,
  `site_theme_alt` text,
  `recaptcha` enum('1','2') NOT NULL DEFAULT '1',
  `recaptcha_key` text,
  `recaptcha_secret` text,
  `custom_header` text,
  `custom_footer` text,
  `ticket_system` enum('1','2') NOT NULL DEFAULT '2',
  `register_page` enum('1','2') NOT NULL DEFAULT '2',
  `service_speed` enum('1','2') NOT NULL,
  `service_list` enum('1','2') NOT NULL,
  `dolar_charge` double NOT NULL,
  `euro_charge` double NOT NULL,
  `smtp_user` text NOT NULL,
  `smtp_pass` text NOT NULL,
  `smtp_server` text NOT NULL,
  `smtp_port` varchar(225) NOT NULL,
  `smtp_protocol` enum('0','ssl','tls') NOT NULL,
  `alert_type` enum('1','2','3') NOT NULL,
  `alert_newbankpayment` enum('1','2') NOT NULL,
  `alert_newmanuelservice` enum('1','2') NOT NULL,
  `alert_newticket` enum('1','2') NOT NULL,
  `alert_apibalance` enum('1','2') NOT NULL,
  `alert_serviceapialert` enum('1','2') NOT NULL,
  `sms_provider` varchar(225) NOT NULL,
  `sms_title` varchar(225) NOT NULL,
  `sms_user` varchar(225) NOT NULL,
  `sms_pass` varchar(225) NOT NULL,
  `sms_validate` enum('0','1') NOT NULL DEFAULT '0' COMMENT '1 -> OK, 0 -> NO',
  `admin_mail` varchar(225) NOT NULL,
  `admin_telephone` varchar(225) NOT NULL,
  `resetpass_page` enum('1','2') NOT NULL,
  `resetpass_sms` enum('1','2') NOT NULL,
  `resetpass_email` enum('1','2') NOT NULL,
  `site_maintenance` enum('1','2') NOT NULL DEFAULT '2',
  `servis_siralama` varchar(255) NOT NULL,
  `bronz_statu` int(11) NOT NULL,
  `silver_statu` int(11) NOT NULL,
  `gold_statu` int(11) NOT NULL,
  `bayi_statu` int(11) NOT NULL,
  `ns1` varchar(191) DEFAULT NULL,
  `ns2` varchar(191) DEFAULT NULL,
  `childpanel_price` double DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `site_seo`, `site_title`, `site_description`, `site_keywords`, `site_logo`, `site_name`, `site_currency`, `favicon`, `site_language`, `site_theme`, `site_theme_alt`, `recaptcha`, `recaptcha_key`, `recaptcha_secret`, `custom_header`, `custom_footer`, `ticket_system`, `register_page`, `service_speed`, `service_list`, `dolar_charge`, `euro_charge`, `smtp_user`, `smtp_pass`, `smtp_server`, `smtp_port`, `smtp_protocol`, `alert_type`, `alert_newbankpayment`, `alert_newmanuelservice`, `alert_newticket`, `alert_apibalance`, `alert_serviceapialert`, `sms_provider`, `sms_title`, `sms_user`, `sms_pass`, `sms_validate`, `admin_mail`, `admin_telephone`, `resetpass_page`, `resetpass_sms`, `resetpass_email`, `site_maintenance`, `servis_siralama`, `bronz_statu`, `silver_statu`, `gold_statu`, `bayi_statu`, `ns1`, `ns2`, `childpanel_price`) VALUES
(1, 'FinalSmmPanel - SMM Panel Reseller Tool', 'FinalSmmPanel', 'smm panel, fsp , smm reseller panel, smm provider panel, reseller panel, instagram panel, resellerpanel, abusalehinfotech,social media reseller panel, smmpanel, panelsmm, smm, panel, socialmedia, instagram reseller panel', 'smm panel, fsp , smm reseller panel, smm provider panel, reseller panel, instagram panel, resellerpanel, abusalehinfotech,social media reseller panel, smmpanel, panelsmm, smm, panel, socialmedia, instagram reseller panel', '', 'FinalSmmPanel', 'INR', '', 'en', 'Eternity-cyan', 'Readable', '1', '', '', '', '', '2', '2', '1', '2', 1, 1, 'support@no1scripts.store', '9826719669aA', 'mail.no1scripts.store', '465', 'ssl', '1', '2', '2', '2', '2', '1', 'bizimsms', 'finalsmmpanel', 'finalsmmpanel', 'finalsmmpanel', '1', 'test@example.com', '+1 296-2449', '2', '1', '2', '2', 'desc', 2147483647, 2147483647, 2147483647, 52, 'https://youtube.com/c/abusalehinfotech', 'https://youtube.com/c/abusalehinfotech', 1000);

-- --------------------------------------------------------

--
-- Table structure for table `themes`
--

CREATE TABLE `themes` (
  `id` int(11) NOT NULL,
  `theme_name` text NOT NULL,
  `theme_dirname` text NOT NULL,
  `theme_extras` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `themes`
--

INSERT INTO `themes` (`id`, `theme_name`, `theme_dirname`, `theme_extras`) VALUES
(3, 'Engaging-cyan', 'Engaging-cyan', '{\"stylesheets\":[\"public/pro/panel/1607327652/bootstrap.css\",\"public/pro/pro/panel/style.css\",\"https:\\/\\/stackpath.bootstrapcdn.com\\/font-awesome\\/4.7.0\\/css\\/font-awesome.min.css\",\"public\\/datepicker\\/css\\/bootstrap-datepicker3.min.css\"],\"scripts\":[\"https:\\/\\/code.jquery.com\\/jquery-3.3.1.min.js\",\"public/pro/script.js\",\"public/ajax.js\",\"public/pro/bootstrap.js\",\"public\\/datepicker\\/js\\/bootstrap-datepicker.min.js\",\"public\\/datepicker\\/locales\\/bootstrap-datepicker.en.min.js\"]}'),
(255, 'FSP-Blue', 'Engaging-Blue', '{\"stylesheets\":[\"public/pro/panel/1607327652/bootstrap.css\",\"public/pro/pro/panel/style.css\",\"https:\\/\\/stackpath.bootstrapcdn.com\\/font-awesome\\/4.7.0\\/css\\/font-awesome.min.css\",\"public\\/datepicker\\/css\\/bootstrap-datepicker3.min.css\"],\"scripts\":[\"https:\\/\\/code.jquery.com\\/jquery-3.3.1.min.js\",\"public/pro/script.js\",\"public/ajax.js\",\"public/pro/bootstrap.js\",\"public\\/datepicker\\/js\\/bootstrap-datepicker.min.js\",\"public\\/datepicker\\/locales\\/bootstrap-datepicker.en.min.js\"]}'),
(256, 'YELLOW PRO', 'Engaging-Yellow', '{\"stylesheets\":[\"public/pro/panel/1607327652/bootstrap.css\",\"public/pro/pro/panel/style.css\",\"https:\\/\\/stackpath.bootstrapcdn.com\\/font-awesome\\/4.7.0\\/css\\/font-awesome.min.css\",\"public\\/datepicker\\/css\\/bootstrap-datepicker3.min.css\"],\"scripts\":[\"https:\\/\\/code.jquery.com\\/jquery-3.3.1.min.js\",\"public/pro/script.js\",\"public/ajax.js\",\"public/pro/bootstrap.js\",\"public\\/datepicker\\/js\\/bootstrap-datepicker.min.js\",\"public\\/datepicker\\/locales\\/bootstrap-datepicker.en.min.js\"]}'),
(257, 'FSP PRO', 'Engaging-Dark', '{\"stylesheets\":[\"public/pro/panel/1607327652/bootstrap.css\",\"public/pro/pro/panel/style.css\",\"https:\\/\\/stackpath.bootstrapcdn.com\\/font-awesome\\/4.7.0\\/css\\/font-awesome.min.css\",\"public\\/datepicker\\/css\\/bootstrap-datepicker3.min.css\"],\"scripts\":[\"https:\\/\\/code.jquery.com\\/jquery-3.3.1.min.js\",\"public/pro/script.js\",\"public/ajax.js\",\"public/pro/bootstrap.js\",\"public\\/datepicker\\/js\\/bootstrap-datepicker.min.js\",\"public\\/datepicker\\/locales\\/bootstrap-datepicker.en.min.js\"]}'),
(258, 'Engaging-Grey', 'Engaging-Grey', '{\"stylesheets\":[\"public/pro/panel/1607327652/bootstrap.css\",\"public/pro/pro/panel/style.css\",\"https:\\/\\/stackpath.bootstrapcdn.com\\/font-awesome\\/4.7.0\\/css\\/font-awesome.min.css\",\"public\\/datepicker\\/css\\/bootstrap-datepicker3.min.css\"],\"scripts\":[\"https:\\/\\/code.jquery.com\\/jquery-3.3.1.min.js\",\"public/pro/script.js\",\"public/ajax.js\",\"public/pro/bootstrap.js\",\"public\\/datepicker\\/js\\/bootstrap-datepicker.min.js\",\"public\\/datepicker\\/locales\\/bootstrap-datepicker.en.min.js\"]}'),
(259, 'Engaging-Orange', 'Engaging-Orange', '{\"stylesheets\":[\"public/pro/panel/1607327652/bootstrap.css\",\"public/pro/pro/panel/style.css\",\"https:\\/\\/stackpath.bootstrapcdn.com\\/font-awesome\\/4.7.0\\/css\\/font-awesome.min.css\",\"public\\/datepicker\\/css\\/bootstrap-datepicker3.min.css\"],\"scripts\":[\"https:\\/\\/code.jquery.com\\/jquery-3.3.1.min.js\",\"public/pro/script.js\",\"public/ajax.js\",\"public/pro/bootstrap.js\",\"public\\/datepicker\\/js\\/bootstrap-datepicker.min.js\",\"public\\/datepicker\\/locales\\/bootstrap-datepicker.en.min.js\"]}'),
(260, 'Engaging-Red', 'Engaging-Red', '{\"stylesheets\":[\"public/pro/panel/1607327652/bootstrap.css\",\"public/pro/pro/panel/style.css\",\"https:\\/\\/stackpath.bootstrapcdn.com\\/font-awesome\\/4.7.0\\/css\\/font-awesome.min.css\",\"public\\/datepicker\\/css\\/bootstrap-datepicker3.min.css\"],\"scripts\":[\"https:\\/\\/code.jquery.com\\/jquery-3.3.1.min.js\",\"public/pro/script.js\",\"public/ajax.js\",\"public/pro/bootstrap.js\",\"public\\/datepicker\\/js\\/bootstrap-datepicker.min.js\",\"public\\/datepicker\\/locales\\/bootstrap-datepicker.en.min.js\"]}'),
(261, 'Engaging-violet', 'Engaging-violet', '{\"stylesheets\":[\"public/pro/panel/1607327652/bootstrap.css\",\"public/pro/pro/panel/style.css\",\"https:\\/\\/stackpath.bootstrapcdn.com\\/font-awesome\\/4.7.0\\/css\\/font-awesome.min.css\",\"public\\/datepicker\\/css\\/bootstrap-datepicker3.min.css\"],\"scripts\":[\"https:\\/\\/code.jquery.com\\/jquery-3.3.1.min.js\",\"public/pro/script.js\",\"public/ajax.js\",\"public/pro/bootstrap.js\",\"public\\/datepicker\\/js\\/bootstrap-datepicker.min.js\",\"public\\/datepicker\\/locales\\/bootstrap-datepicker.en.min.js\"]}'),
(262, 'pro-dark', 'pro', '{\"stylesheets\":[\"public/pro/panel/1607327652/bootstrap.css\",\"public/pro/pro/panel/style.css\",\"https:\\/\\/stackpath.bootstrapcdn.com\\/font-awesome\\/4.7.0\\/css\\/font-awesome.min.css\",\"public\\/datepicker\\/css\\/bootstrap-datepicker3.min.css\"],\"scripts\":[\"https:\\/\\/code.jquery.com\\/jquery-3.3.1.min.js\",\"public/pro/script.js\",\"public/ajax.js\",\"public/pro/bootstrap.js\",\"public\\/datepicker\\/js\\/bootstrap-datepicker.min.js\",\"public\\/datepicker\\/locales\\/bootstrap-datepicker.en.min.js\"]}'),
(263, 'pro-blue', 'pro-blue', '{\"stylesheets\":[\"public/pro/panel/1607327652/bootstrap.css\",\"public/pro/pro/panel/style.css\",\"https:\\/\\/stackpath.bootstrapcdn.com\\/font-awesome\\/4.7.0\\/css\\/font-awesome.min.css\",\"public\\/datepicker\\/css\\/bootstrap-datepicker3.min.css\"],\"scripts\":[\"https:\\/\\/code.jquery.com\\/jquery-3.3.1.min.js\",\"public/pro/script.js\",\"public/ajax.js\",\"public/pro/bootstrap.js\",\"public\\/datepicker\\/js\\/bootstrap-datepicker.min.js\",\"public\\/datepicker\\/locales\\/bootstrap-datepicker.en.min.js\"]}'),
(264, 'pro-red', 'pro-red', '{\"stylesheets\":[\"public/pro/panel/1607327652/bootstrap.css\",\"public/pro/pro/panel/style.css\",\"https:\\/\\/stackpath.bootstrapcdn.com\\/font-awesome\\/4.7.0\\/css\\/font-awesome.min.css\",\"public\\/datepicker\\/css\\/bootstrap-datepicker3.min.css\"],\"scripts\":[\"https:\\/\\/code.jquery.com\\/jquery-3.3.1.min.js\",\"public/pro/script.js\",\"public/ajax.js\",\"public/pro/bootstrap.js\",\"public\\/datepicker\\/js\\/bootstrap-datepicker.min.js\",\"public\\/datepicker\\/locales\\/bootstrap-datepicker.en.min.js\"]}'),
(265, 'Eternity-Asurze', 'Eternity-Asurze', '{\"stylesheets\":[\"public/pro/panel/1607327652/bootstrap.css\",\"public/pro/pro/panel/style.css\",\"https:\\/\\/stackpath.bootstrapcdn.com\\/font-awesome\\/4.7.0\\/css\\/font-awesome.min.css\",\"public\\/datepicker\\/css\\/bootstrap-datepicker3.min.css\"],\"scripts\":[\"https:\\/\\/code.jquery.com\\/jquery-3.3.1.min.js\",\"public/pro/script.js\",\"public/ajax.js\",\"public/pro/bootstrap.js\",\"public\\/datepicker\\/js\\/bootstrap-datepicker.min.js\",\"public\\/datepicker\\/locales\\/bootstrap-datepicker.en.min.js\"]}'),
(266, 'Eternity-coral', 'Eternity-coral', '{\"stylesheets\":[\"public/pro/panel/1607327652/bootstrap.css\",\"public/pro/pro/panel/style.css\",\"https:\\/\\/stackpath.bootstrapcdn.com\\/font-awesome\\/4.7.0\\/css\\/font-awesome.min.css\",\"public\\/datepicker\\/css\\/bootstrap-datepicker3.min.css\"],\"scripts\":[\"https:\\/\\/code.jquery.com\\/jquery-3.3.1.min.js\",\"public/pro/script.js\",\"public/ajax.js\",\"public/pro/bootstrap.js\",\"public\\/datepicker\\/js\\/bootstrap-datepicker.min.js\",\"public\\/datepicker\\/locales\\/bootstrap-datepicker.en.min.js\"]}'),
(267, 'Eternity-cyan', 'Eternity-cyan', '{\"stylesheets\":[\"public/pro/panel/1607327652/bootstrap.css\",\"public/pro/pro/panel/style.css\",\"https:\\/\\/stackpath.bootstrapcdn.com\\/font-awesome\\/4.7.0\\/css\\/font-awesome.min.css\",\"public\\/datepicker\\/css\\/bootstrap-datepicker3.min.css\"],\"scripts\":[\"https:\\/\\/code.jquery.com\\/jquery-3.3.1.min.js\",\"public/pro/script.js\",\"public/ajax.js\",\"public/pro/bootstrap.js\",\"public\\/datepicker\\/js\\/bootstrap-datepicker.min.js\",\"public\\/datepicker\\/locales\\/bootstrap-datepicker.en.min.js\"]}'),
(268, 'FSP GREY', 'Eternity-Grey', '{\"stylesheets\":[\"public/pro/panel/1607327652/bootstrap.css\",\"public/pro/pro/panel/style.css\",\"https:\\/\\/stackpath.bootstrapcdn.com\\/font-awesome\\/4.7.0\\/css\\/font-awesome.min.css\",\"public\\/datepicker\\/css\\/bootstrap-datepicker3.min.css\"],\"scripts\":[\"https:\\/\\/code.jquery.com\\/jquery-3.3.1.min.js\",\"public/pro/script.js\",\"public/ajax.js\",\"public/pro/bootstrap.js\",\"public\\/datepicker\\/js\\/bootstrap-datepicker.min.js\",\"public\\/datepicker\\/locales\\/bootstrap-datepicker.en.min.js\"]}'),
(269, 'Eternity-Lilac', 'Eternity-Lilac', '{\"stylesheets\":[\"public/pro/panel/1607327652/bootstrap.css\",\"public/pro/pro/panel/style.css\",\"https:\\/\\/stackpath.bootstrapcdn.com\\/font-awesome\\/4.7.0\\/css\\/font-awesome.min.css\",\"public\\/datepicker\\/css\\/bootstrap-datepicker3.min.css\"],\"scripts\":[\"https:\\/\\/code.jquery.com\\/jquery-3.3.1.min.js\",\"public/pro/script.js\",\"public/ajax.js\",\"public/pro/bootstrap.js\",\"public\\/datepicker\\/js\\/bootstrap-datepicker.min.js\",\"public\\/datepicker\\/locales\\/bootstrap-datepicker.en.min.js\"]}'),
(270, 'Eternity-Navy', 'Eternity-Navy', '{\"stylesheets\":[\"public/pro/panel/1607327652/bootstrap.css\",\"public/pro/pro/panel/style.css\",\"https:\\/\\/stackpath.bootstrapcdn.com\\/font-awesome\\/4.7.0\\/css\\/font-awesome.min.css\",\"public\\/datepicker\\/css\\/bootstrap-datepicker3.min.css\"],\"scripts\":[\"https:\\/\\/code.jquery.com\\/jquery-3.3.1.min.js\",\"public/pro/script.js\",\"public/ajax.js\",\"public/pro/bootstrap.js\",\"public\\/datepicker\\/js\\/bootstrap-datepicker.min.js\",\"public\\/datepicker\\/locales\\/bootstrap-datepicker.en.min.js\"]}'),
(271, 'FSP PURPLE', 'Eternity-Purple', '{\"stylesheets\":[\"public/pro/panel/1607327652/bootstrap.css\",\"public/pro/pro/panel/style.css\",\"https:\\/\\/stackpath.bootstrapcdn.com\\/font-awesome\\/4.7.0\\/css\\/font-awesome.min.css\",\"public\\/datepicker\\/css\\/bootstrap-datepicker3.min.css\"],\"scripts\":[\"https:\\/\\/code.jquery.com\\/jquery-3.3.1.min.js\",\"public/pro/script.js\",\"public/ajax.js\",\"public/pro/bootstrap.js\",\"public\\/datepicker\\/js\\/bootstrap-datepicker.min.js\",\"public\\/datepicker\\/locales\\/bootstrap-datepicker.en.min.js\"]}');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `ticket_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `subject` varchar(225) NOT NULL,
  `time` datetime NOT NULL,
  `lastupdate_time` datetime NOT NULL,
  `client_new` enum('1','2') NOT NULL DEFAULT '2',
  `status` enum('pending','answered','closed') NOT NULL DEFAULT 'pending',
  `support_new` enum('1','2') NOT NULL DEFAULT '1',
  `canmessage` enum('1','2') NOT NULL DEFAULT '2'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_reply`
--

CREATE TABLE `ticket_reply` (
  `id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `support` enum('1','2') NOT NULL DEFAULT '1',
  `message` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `childpanels`
--
ALTER TABLE `childpanels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`client_id`);

--
-- Indexes for table `clients_category`
--
ALTER TABLE `clients_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients_price`
--
ALTER TABLE `clients_price`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients_service`
--
ALTER TABLE `clients_service`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client_report`
--
ALTER TABLE `client_report`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kuponlar`
--
ALTER TABLE `kuponlar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kupon_kullananlar`
--
ALTER TABLE `kupon_kullananlar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`page_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `payments_bonus`
--
ALTER TABLE `payments_bonus`
  ADD PRIMARY KEY (`bonus_id`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `serviceapi_alert`
--
ALTER TABLE `serviceapi_alert`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`service_id`);

--
-- Indexes for table `service_api`
--
ALTER TABLE `service_api`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `themes`
--
ALTER TABLE `themes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`ticket_id`);

--
-- Indexes for table `ticket_reply`
--
ALTER TABLE `ticket_reply`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `childpanels`
--
ALTER TABLE `childpanels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `client_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=183;

--
-- AUTO_INCREMENT for table `clients_category`
--
ALTER TABLE `clients_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clients_price`
--
ALTER TABLE `clients_price`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `clients_service`
--
ALTER TABLE `clients_service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client_report`
--
ALTER TABLE `client_report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=978;

--
-- AUTO_INCREMENT for table `kuponlar`
--
ALTER TABLE `kuponlar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `kupon_kullananlar`
--
ALTER TABLE `kupon_kullananlar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `page_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `payments_bonus`
--
ALTER TABLE `payments_bonus`
  MODIFY `bonus_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `serviceapi_alert`
--
ALTER TABLE `serviceapi_alert`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `service_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `service_api`
--
ALTER TABLE `service_api`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `themes`
--
ALTER TABLE `themes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=272;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `ticket_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_reply`
--
ALTER TABLE `ticket_reply`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
