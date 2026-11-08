-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 22, 2024 at 09:53 AM
-- Server version: 10.11.9-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u873937860_bank_imam`
--

-- --------------------------------------------------------

--
-- Table structure for table `cms_apicustom`
--

CREATE TABLE `cms_apicustom` (
  `id` int(10) UNSIGNED NOT NULL,
  `permalink` varchar(255) DEFAULT NULL,
  `tabel` varchar(255) DEFAULT NULL,
  `aksi` varchar(255) DEFAULT NULL,
  `kolom` varchar(255) DEFAULT NULL,
  `orderby` varchar(255) DEFAULT NULL,
  `sub_query_1` varchar(255) DEFAULT NULL,
  `sql_where` varchar(255) DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `parameter` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `method_type` varchar(25) DEFAULT NULL,
  `parameters` longtext DEFAULT NULL,
  `responses` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_apikey`
--

CREATE TABLE `cms_apikey` (
  `id` int(10) UNSIGNED NOT NULL,
  `screetkey` varchar(255) DEFAULT NULL,
  `hit` int(11) DEFAULT NULL,
  `status` varchar(25) NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_dashboard`
--

CREATE TABLE `cms_dashboard` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `id_cms_privileges` int(11) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_email_queues`
--

CREATE TABLE `cms_email_queues` (
  `id` int(10) UNSIGNED NOT NULL,
  `send_at` datetime DEFAULT NULL,
  `email_recipient` varchar(255) DEFAULT NULL,
  `email_from_email` varchar(255) DEFAULT NULL,
  `email_from_name` varchar(255) DEFAULT NULL,
  `email_cc_email` varchar(255) DEFAULT NULL,
  `email_subject` varchar(255) DEFAULT NULL,
  `email_content` text DEFAULT NULL,
  `email_attachments` text DEFAULT NULL,
  `is_sent` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_logs`
--

CREATE TABLE `cms_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `ipaddress` varchar(50) DEFAULT NULL,
  `useragent` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `details` text DEFAULT NULL,
  `id_cms_users` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_logs`
--

INSERT INTO `cms_logs` (`id`, `ipaddress`, `useragent`, `url`, `description`, `details`, `id_cms_users`, `created_at`, `updated_at`) VALUES
(1, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2023-03-24 10:56:56', NULL),
(2, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/module_generator/delete/12', 'Delete data Sampah at Module Generator', '', 1, '2023-03-24 11:06:22', NULL),
(3, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/logout', 'admin@crudbooster.com logout', '', 1, '2023-03-24 11:07:19', NULL),
(4, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2023-03-24 11:07:21', NULL),
(5, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/users/add-save', 'Add New Data Admin Sadam at Users Management', '', 1, '2023-03-24 11:21:06', NULL),
(6, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/users/add-save', 'Add New Data Dimas at Users Management', '', 1, '2023-03-24 11:24:42', NULL),
(7, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/points/add-save', 'Add New Data  at Poin', '', 1, '2023-03-24 11:45:29', NULL),
(8, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/logout', 'admin@crudbooster.com logout', '', 1, '2023-03-24 11:48:30', NULL),
(9, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/login', 'sadumb7@gmail.com login with IP Address 127.0.0.1', '', 2, '2023-03-24 11:48:39', NULL),
(10, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/logout', 'sadumb7@gmail.com logout', '', 2, '2023-03-24 11:48:52', NULL),
(11, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2023-03-24 11:48:53', NULL),
(12, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/menu_management/add-save', 'Add New Data Sampah at Menu Management', '', 1, '2023-03-24 11:49:50', NULL),
(13, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/menu_management/add-save', 'Add New Data Rewards at Menu Management', '', 1, '2023-03-24 11:50:33', NULL),
(14, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/menu_management/add-save', 'Add New Data Poin at Menu Management', '', 1, '2023-03-24 11:51:00', NULL),
(15, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/logout', 'admin@crudbooster.com logout', '', 1, '2023-03-24 11:51:04', NULL),
(16, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/login', 'sadumb7@gmail.com login with IP Address 127.0.0.1', '', 2, '2023-03-24 11:51:13', NULL),
(17, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/menu_management/edit/5', 'Try edit the data Sampah at Menu Management', '', 2, '2023-03-24 11:51:23', NULL),
(18, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/menu_management/delete/7', 'Try delete the Poin data at Menu Management', '', 2, '2023-03-24 11:51:33', NULL),
(19, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/menu_management/delete/5', 'Try delete the Sampah data at Menu Management', '', 2, '2023-03-24 11:54:38', NULL),
(20, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/menu_management', 'Try view the data :name at Menu Management', '', 2, '2023-03-24 11:59:06', NULL),
(21, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/module_generator', 'Try view the data :name at Module Generator', '', 2, '2023-03-24 12:02:47', NULL),
(22, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/logout', 'sadumb7@gmail.com logout', '', 2, '2023-03-24 12:03:05', NULL),
(23, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2023-03-24 12:03:07', NULL),
(24, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/menu_management/delete/5', 'Delete data Sampah at Menu Management', '', 1, '2023-03-24 12:03:17', NULL),
(25, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/menu_management/delete/6', 'Delete data Rewards at Menu Management', '', 1, '2023-03-24 12:03:21', NULL),
(26, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/menu_management/delete/7', 'Delete data Poin at Menu Management', '', 1, '2023-03-24 12:03:23', NULL),
(27, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/menu_management/delete/2', 'Delete data Sampah at Menu Management', '', 1, '2023-03-24 12:03:33', NULL),
(28, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/sampah/add-save', 'Add New Data Plastik PET at Sampah', '', 1, '2023-03-24 12:07:37', NULL),
(29, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/menu_management/add-save', 'Add New Data Sampah at Menu Management', '', 1, '2023-03-24 12:08:10', NULL),
(30, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/menu_management/add-save', 'Add New Data Rewards at Menu Management', '', 1, '2023-03-24 12:08:33', NULL),
(31, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/menu_management/add-save', 'Add New Data Poin at Menu Management', '', 1, '2023-03-24 12:08:53', NULL),
(32, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/logout', 'admin@crudbooster.com logout', '', 1, '2023-03-24 12:09:04', NULL),
(33, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/login', 'sadumb7@gmail.com login with IP Address 127.0.0.1', '', 2, '2023-03-24 12:09:11', NULL),
(34, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/sampah', 'Try view the data :name at Sampah', '', 2, '2023-03-24 12:09:13', NULL),
(35, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/sampah', 'Try view the data :name at Sampah', '', 2, '2023-03-24 12:09:18', NULL),
(36, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/logout', 'sadumb7@gmail.com logout', '', 2, '2023-03-24 12:09:35', NULL),
(37, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2023-03-24 12:09:37', NULL),
(38, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/logout', 'admin@crudbooster.com logout', '', 1, '2023-03-24 12:10:21', NULL),
(39, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/login', 'sadumb7@gmail.com login with IP Address 127.0.0.1', '', 2, '2023-03-24 12:10:29', NULL),
(40, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/login', 'sadumb7@gmail.com login with IP Address 127.0.0.1', '', 2, '2023-03-24 12:11:10', NULL),
(41, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/logout', 'sadumb7@gmail.com logout', '', 2, '2023-03-24 12:11:17', NULL),
(42, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2023-03-24 12:11:18', NULL),
(43, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/menu_management/add-save', 'Add New Data Nasabah at Menu Management', '', 1, '2023-03-24 12:12:11', NULL),
(44, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/menu_management/edit-save/10', 'Update data Rewards at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td>green</td><td>normal</td></tr><tr><td>sorting</td><td></td><td></td></tr></tbody></table>', 1, '2023-03-24 12:12:27', NULL),
(45, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/menu_management/edit-save/11', 'Update data Poin at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td>green</td><td>normal</td></tr><tr><td>sorting</td><td></td><td></td></tr></tbody></table>', 1, '2023-03-24 12:12:33', NULL),
(46, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/menu_management/edit-save/10', 'Update data Rewards at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>sorting</td><td></td><td></td></tr></tbody></table>', 1, '2023-03-24 12:12:41', NULL),
(47, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/menu_management/edit-save/9', 'Update data Sampah at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td>green</td><td>normal</td></tr><tr><td>sorting</td><td></td><td></td></tr></tbody></table>', 1, '2023-03-24 12:12:47', NULL),
(48, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/menu_management/edit-save/12', 'Update data Nasabah at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>sorting</td><td></td><td></td></tr></tbody></table>', 1, '2023-03-24 12:12:53', NULL),
(49, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/menu_management/edit-save/11', 'Update data Poin at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>sorting</td><td></td><td></td></tr></tbody></table>', 1, '2023-03-24 12:12:58', NULL),
(50, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/menu_management/edit-save/10', 'Update data Rewards at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>sorting</td><td></td><td></td></tr></tbody></table>', 1, '2023-03-24 12:13:01', NULL),
(51, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/menu_management/edit-save/11', 'Update data Poin at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>sorting</td><td></td><td></td></tr></tbody></table>', 1, '2023-03-24 12:13:04', NULL),
(52, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/logout', 'admin@crudbooster.com logout', '', 1, '2023-03-24 12:18:42', NULL),
(53, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2023-03-24 12:18:43', NULL),
(54, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/logout', 'admin@crudbooster.com logout', '', 1, '2023-03-24 12:19:20', NULL),
(55, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2023-03-24 12:19:21', NULL),
(56, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/logout', 'sadumb7@gmail.com logout', '', 2, '2023-03-24 12:20:25', NULL),
(57, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/logout', 'admin@crudbooster.com logout', '', 1, '2023-03-24 12:21:59', NULL),
(58, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2023-03-24 12:22:47', NULL),
(59, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/delete/12', 'Delete data Nasabah at Menu Management', '', 1, '2023-03-24 12:30:31', NULL),
(60, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/delete/13', 'Delete data Nasabah at Menu Management', '', 1, '2023-03-24 12:30:35', NULL),
(61, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/add-save', 'Add New Data Nasabah at Menu Management', '', 1, '2023-03-24 12:37:26', NULL),
(62, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/login', 'sadumb7@gmail.com login with IP Address 127.0.0.1', '', 2, '2023-03-24 12:39:28', NULL),
(63, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/logout', 'sadumb7@gmail.com logout', '', 2, '2023-03-24 13:10:54', NULL),
(64, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/login', 'sadumb7@gmail.com login with IP Address 127.0.0.1', '', 2, '2023-03-24 13:11:42', NULL),
(65, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/delete/14', 'Delete data Nasabah at Menu Management', '', 1, '2023-03-24 13:13:33', NULL),
(66, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/add-save', 'Add New Data Nasabah at Menu Management', '', 1, '2023-03-24 13:13:53', NULL),
(67, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/cms_users_nasabah', 'Try view the data :name at Nasabah', '', 2, '2023-03-24 13:14:00', NULL),
(68, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/cms_users_nasabah', 'Try view the data :name at Nasabah', '', 2, '2023-03-24 13:14:03', NULL),
(69, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/cms_users_nasabah', 'Try view the data :name at Nasabah', '', 2, '2023-03-24 13:15:44', NULL),
(70, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/cms_users_nasabah', 'Try view the data :name at Nasabah', '', 2, '2023-03-24 13:15:45', NULL),
(71, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/cms_users_nasabah', 'Try view the data :name at Nasabah', '', 2, '2023-03-24 13:15:48', NULL),
(72, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/edit-save/16', 'Update data Nasabah at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>sorting</td><td></td><td></td></tr></tbody></table>', 1, '2023-03-24 13:16:25', NULL),
(73, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/logout', 'sadumb7@gmail.com logout', '', 2, '2023-03-24 13:16:32', NULL),
(74, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/login', 'sadumb7@gmail.com login with IP Address 127.0.0.1', '', 2, '2023-03-24 13:16:48', NULL),
(75, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2023-03-25 02:26:31', NULL),
(76, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/login', 'sadumb7@gmail.com login with IP Address 127.0.0.1', '', 2, '2023-03-25 02:26:55', NULL),
(77, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/points/edit-save/1', 'Update data  at Poin', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody></tbody></table>', 2, '2023-03-25 02:28:32', NULL),
(78, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/menu_management/delete/10', 'Delete data Rewards at Menu Management', '', 1, '2023-03-25 02:53:41', NULL),
(79, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/menu_management/delete/3', 'Delete data Rewards at Menu Management', '', 1, '2023-03-25 02:53:45', NULL),
(80, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/module_generator/delete/14', 'Delete data Rewards at Module Generator', '', 1, '2023-03-25 02:53:55', NULL),
(81, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/rewards/add-save', 'Add New Data Pot Gemoy at Rewards', '', 1, '2023-03-25 03:02:13', NULL),
(82, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/menu_management/delete/18', 'Delete data Penukaran Poin at Menu Management', '', 1, '2023-03-25 03:25:05', NULL),
(83, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/menu_management/add-save', 'Add New Data Penukaran Poin at Menu Management', '', 1, '2023-03-25 03:25:22', NULL),
(84, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2023-03-25 07:15:13', NULL),
(85, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', 'admin@crudbooster.com logout', '', 1, '2023-03-25 07:59:23', NULL),
(86, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2023-03-25 07:59:29', NULL),
(87, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', 'admin@crudbooster.com logout', '', 1, '2023-03-25 07:59:40', NULL),
(88, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'sadumb7@gmail.com login with IP Address 127.0.0.1', '', 2, '2023-03-25 07:59:51', NULL),
(89, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', 'sadumb7@gmail.com logout', '', 2, '2023-03-25 08:00:33', NULL),
(90, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2023-03-25 08:00:35', NULL),
(91, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', 'admin@crudbooster.com logout', '', 1, '2023-03-25 08:04:13', NULL),
(92, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2023-03-25 08:04:24', NULL),
(93, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', 'admin@crudbooster.com logout', '', 1, '2023-03-25 08:04:28', NULL),
(94, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', ' logout', '', NULL, '2023-03-25 08:04:32', NULL),
(95, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2023-03-25 08:09:38', NULL),
(96, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', 'admin@crudbooster.com logout', '', 1, '2023-03-25 08:12:52', NULL),
(97, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'sadumb7@gmail.com login with IP Address 127.0.0.1', '', 2, '2023-03-25 08:13:00', NULL),
(98, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', 'sadumb7@gmail.com logout', '', 2, '2023-03-25 08:14:42', NULL),
(99, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2023-03-26 03:30:11', NULL),
(100, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2023-03-26 03:30:21', NULL),
(101, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/module_generator/delete/20', 'Delete data Penukaran Poin at Module Generator', '', 1, '2023-03-26 03:32:21', NULL),
(102, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/menu_management/delete/19', 'Delete data Penukaran Poin at Menu Management', '', 1, '2023-03-26 03:37:33', NULL),
(103, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2023-03-26 11:22:28', NULL),
(104, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2023-03-26 12:28:11', NULL),
(105, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/tukar_poin/delete/2', 'Delete data 2 at Penukaran Poin', '', 1, '2023-03-26 12:41:19', NULL),
(106, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/tukar_poin/delete/1', 'Delete data 1 at Penukaran Poin', '', 1, '2023-03-26 12:41:21', NULL),
(107, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/tukar_poin/delete/3', 'Delete data 3 at Penukaran Poin', '', 1, '2023-03-26 12:44:23', NULL),
(108, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/tukar_poin/delete/4', 'Delete data 4 at Penukaran Poin', '', 1, '2023-03-26 12:44:25', NULL),
(109, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/tukar_poin/delete/5', 'Delete data 5 at Penukaran Poin', '', 1, '2023-03-26 12:49:26', NULL),
(110, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/tukar_poin/delete/6', 'Delete data 6 at Penukaran Poin', '', 1, '2023-03-26 12:49:28', NULL),
(111, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/tukar_poin/delete/7', 'Delete data 7 at Penukaran Poin', '', 1, '2023-03-26 12:52:52', NULL),
(112, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/tukar_poin/delete/9', 'Delete data 9 at Penukaran Poin', '', 1, '2023-03-26 12:56:20', NULL),
(113, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/tukar_poin/delete/8', 'Delete data 8 at Penukaran Poin', '', 1, '2023-03-26 12:56:22', NULL),
(114, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/tukar_poin/delete/10', 'Delete data 10 at Penukaran Poin', '', 1, '2023-03-26 13:01:01', NULL),
(115, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/tukar_poin/delete/11', 'Delete data 11 at Penukaran Poin', '', 1, '2023-03-26 13:01:03', NULL),
(116, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', 'admin@crudbooster.com logout', '', 1, '2023-03-26 13:08:46', NULL),
(117, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'sadumb7@gmail.com login with IP Address 127.0.0.1', '', 2, '2023-03-26 13:08:57', NULL),
(118, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2023-03-27 20:40:08', NULL),
(119, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/logout', 'admin@crudbooster.com logout', '', 1, '2023-03-27 20:40:13', NULL),
(120, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/login', 'sadumb7@gmail.com login with IP Address 127.0.0.1', '', 2, '2023-03-27 20:40:21', NULL),
(121, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/sampah/add-save', 'Add New Data Karton/Kertas at Sampah', '', 2, '2023-03-27 20:41:10', NULL),
(122, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/cms_users_nasabah/add-save', 'Add New Data Dwi Oktaviani at Nasabah', '', 2, '2023-03-27 22:03:26', NULL),
(123, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/points/add-save', 'Add New Data  at Poin', '', 2, '2023-03-27 22:03:39', NULL),
(124, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2023-04-09 08:54:08', NULL),
(125, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/menu_management/delete/9', 'Delete data Sampah at Menu Management', '', 1, '2023-04-09 09:21:05', NULL),
(126, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/menu_management/delete/11', 'Delete data Poin at Menu Management', '', 1, '2023-04-09 09:21:07', NULL),
(127, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/menu_management/delete/16', 'Delete data Nasabah at Menu Management', '', 1, '2023-04-09 09:21:09', NULL),
(128, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/menu_management/delete/8', 'Delete data Sampah at Menu Management', '', 1, '2023-04-09 09:21:12', NULL),
(129, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/menu_management/delete/15', 'Delete data Nasabah at Menu Management', '', 1, '2023-04-09 09:21:15', NULL),
(130, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/menu_management/delete/17', 'Delete data Rewards at Menu Management', '', 1, '2023-04-09 09:21:20', NULL),
(131, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/menu_management/delete/4', 'Delete data Poin at Menu Management', '', 1, '2023-04-09 09:21:22', NULL),
(132, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/menu_management/delete/20', 'Delete data Penukaran Poin at Menu Management', '', 1, '2023-04-09 09:21:24', NULL),
(133, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/module_generator/delete/16', 'Delete data Sampah at Module Generator', '', 1, '2023-04-09 09:21:45', NULL),
(134, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/module_generator/delete/19', 'Delete data Rewards at Module Generator', '', 1, '2023-04-09 09:21:47', NULL),
(135, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/module_generator/delete/15', 'Delete data Poin at Module Generator', '', 1, '2023-04-09 09:21:49', NULL),
(136, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/module_generator/delete/21', 'Delete data Penukaran Poin at Module Generator', '', 1, '2023-04-09 09:21:51', NULL),
(137, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/module_generator/delete/18', 'Delete data Nasabah at Module Generator', '', 1, '2023-04-09 09:21:53', NULL),
(138, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/users-we-cycle/add-save', 'Add New Data Dwi Oktaviani at User', '', 1, '2023-04-09 11:02:44', NULL),
(139, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/points/add-save', 'Add New Data  at Poin', '', 1, '2023-04-09 11:07:03', NULL),
(140, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/sampah_categories/add-save', 'Add New Data Sampah Plastik at Kategori Sampah', '', 1, '2023-04-09 11:09:16', NULL),
(141, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/sampah/add-save', 'Add New Data Plastik PET at Sampah', '', 1, '2023-04-09 11:13:37', NULL),
(142, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/module_generator/delete/26', 'Delete data Rewards at Module Generator', '', 1, '2023-04-09 11:19:39', NULL),
(143, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/rewards/add-save', 'Add New Data Pot Gemoy at Rewards', '', 1, '2023-04-09 11:24:50', NULL),
(144, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/sampah/add-save', 'Add New Data Plastik HDPE at Sampah', '', 1, '2023-04-09 11:36:56', NULL),
(145, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/sampah/add-save', 'Add New Data Plastik VPC at Sampah', '', 1, '2023-04-09 11:37:13', NULL),
(146, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/sampah/add-save', 'Add New Data Plastik PS at Sampah', '', 1, '2023-04-09 11:59:04', NULL),
(147, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/sampah/edit-save/1', 'Update data Plastik PET, apsdka, ajsdbias, jhasdb at Sampah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>name</td><td>Plastik PET</td><td>Plastik PET, apsdka, ajsdbias, jhasdb</td></tr></tbody></table>', 1, '2023-04-09 12:01:24', NULL),
(148, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/sampah/edit-save/1', 'Update data Plastik PET at Sampah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>name</td><td>Plastik PET, apsdka, ajsdbias, jhasdb</td><td>Plastik PET</td></tr></tbody></table>', 1, '2023-04-09 12:02:02', NULL),
(149, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/rewards/add-save', 'Add New Data Keranjang Magic at Rewards', '', 1, '2023-04-09 12:11:18', NULL),
(150, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/rewards/add-save', 'Add New Data Boneka Rajut at Rewards', '', 1, '2023-04-09 12:12:14', NULL),
(151, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2023-04-10 07:31:37', NULL),
(152, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/module_generator/delete/22', 'Delete data User at Module Generator', '', 1, '2023-04-10 07:31:57', NULL),
(153, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/module_generator/delete/23', 'Delete data Poin at Module Generator', '', 1, '2023-04-10 07:32:00', NULL),
(154, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/add-save', 'Add New Data Nasabah at Menu Management', '', 1, '2023-04-10 07:41:30', NULL),
(155, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/add-save', 'Add New Data Poin at Menu Management', '', 1, '2023-04-10 07:41:52', NULL),
(156, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/users/delete/4', 'Delete data Dwi Oktaviani at Users Management', '', 1, '2023-04-10 07:43:25', NULL),
(157, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/users/delete/3', 'Delete data Dimas at Users Management', '', 1, '2023-04-10 07:43:28', NULL),
(158, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2023-04-10 08:07:47', NULL),
(159, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2023-04-10 12:00:24', NULL),
(160, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/module_generator/delete/22', 'Delete data Nasabah at Module Generator', '', 1, '2023-04-10 12:00:50', NULL),
(161, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/module_generator/delete/28', 'Delete data Nasabah at Module Generator', '', 1, '2023-04-10 12:05:02', NULL),
(162, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2023-04-10 13:02:14', NULL),
(163, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/menu_management/delete/27', 'Delete data Nasabah at Menu Management', '', 1, '2023-04-10 13:02:32', NULL),
(164, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/module_generator/delete/23', 'Delete data Poin at Module Generator', '', 1, '2023-04-10 13:02:49', NULL),
(165, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/menu_management/delete/28', 'Delete data Poin at Menu Management', '', 1, '2023-04-10 13:02:56', NULL),
(166, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/sampah_categories/add-save', 'Add New Data Plastik at Kategori Sampah', '', 1, '2023-04-10 13:03:08', NULL),
(167, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/sampah/add-save', 'Add New Data Plastik VPC at Sampah', '', 1, '2023-04-10 13:03:37', NULL),
(168, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/rewards/add-save', 'Add New Data Pot Gemoy at Rewards', '', 1, '2023-04-10 13:04:06', NULL),
(169, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2023-04-10 20:07:41', NULL),
(170, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/sampah_categories/add-save', 'Add New Data Plastik at Kategori Sampah', '', 1, '2023-04-10 20:07:52', NULL),
(171, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2023-04-15 23:46:33', NULL),
(172, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/sampah/add-save', 'Add New Data Plastik PVC at Sampah', '', 1, '2023-04-15 23:58:12', NULL),
(173, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2023-04-16 11:37:24', NULL),
(174, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/sampah/add-save', 'Add New Data Plastik PVC at Sampah', '', 1, '2023-04-16 12:42:28', NULL),
(175, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions/add-save', 'Add New Data  at Transaksi', '', 1, '2023-04-16 13:42:14', NULL),
(176, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2023-04-17 03:50:32', NULL),
(177, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2023-04-17 04:57:42', NULL),
(178, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions/add-save', 'Add New Data  at Transaksi', '', 1, '2023-04-17 04:58:35', NULL),
(179, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions/add-save', 'Add New Data  at Transaksi', '', 1, '2023-04-17 05:00:29', NULL),
(180, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2023-04-17 10:30:07', NULL),
(181, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/transactions/add-save', 'Add New Data  at Transaksi', '', 1, '2023-04-17 10:30:48', NULL),
(182, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2023-04-17 12:39:52', NULL),
(183, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/transactions/add-save', 'Add New Data  at Transaksi', '', 1, '2023-04-17 12:40:24', NULL),
(184, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2023-04-18 07:30:03', NULL),
(185, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/transactions/add-save', 'Add New Data  at Transaksi', '', 1, '2023-04-18 07:30:16', NULL),
(186, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/transactions/add-save', 'Add New Data  at Transaksi', '', 1, '2023-04-18 08:21:07', NULL),
(187, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/transactions/add-save', 'Add New Data  at Transaksi', '', 1, '2023-04-18 08:22:26', NULL),
(188, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/transactions/add-save', 'Add New Data  at Transaksi', '', 1, '2023-04-18 08:22:33', NULL),
(189, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/transactions/add-save', 'Add New Data  at Transaksi', '', 1, '2023-04-18 08:22:43', NULL),
(190, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2023-04-24 23:00:28', NULL),
(191, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/rewards/add-save', 'Add New Data Pot Gemoy at Rewards', '', 1, '2023-04-24 23:01:09', NULL);
INSERT INTO `cms_logs` (`id`, `ipaddress`, `useragent`, `url`, `description`, `details`, `id_cms_users`, `created_at`, `updated_at`) VALUES
(192, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2023-04-26 16:21:48', NULL),
(193, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/sampah_categories/add-save', 'Add New Data Logam at Kategori Sampah', '', 1, '2023-04-26 16:22:02', NULL),
(194, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2023-04-26 16:24:09', NULL),
(195, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/sampah/add-save', 'Add New Data Plat Besi at Sampah', '', 1, '2023-04-26 16:25:35', NULL),
(196, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/sampah_categories/add-save', 'Add New Data Kertas at Kategori Sampah', '', 1, '2023-04-26 17:33:22', NULL),
(197, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/rewards/add-save', 'Add New Data Anyaman at Rewards', '', 1, '2023-04-26 17:37:26', NULL),
(198, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://localhost:8000/admin/rewards/add-save', 'Add New Data Kotak Tisu at Rewards', '', 1, '2023-04-26 17:40:11', NULL),
(199, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2023-04-26 19:17:22', NULL),
(200, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', 'admin@crudbooster.com logout', '', 1, '2023-04-26 19:19:39', NULL),
(201, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2023-04-26 19:20:24', NULL),
(202, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', 'admin@crudbooster.com logout', '', 1, '2023-04-26 19:34:30', NULL),
(203, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2023-04-29 22:58:08', NULL),
(204, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'http://localhost:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2023-05-08 00:46:00', NULL),
(205, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'http://localhost:8000/admin/points/edit-save/1', 'Update data  at Poin', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>total_points</td><td>4999</td><td>20000</td></tr></tbody></table>', 1, '2023-05-08 00:56:26', NULL),
(206, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'http://localhost:8000/admin/tukar_poins/edit-save/8', 'Update data  at Tukar Poin', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>admin_id</td><td></td><td>2</td></tr><tr><td>status</td><td>Pending</td><td>Sukses</td></tr></tbody></table>', 1, '2023-05-08 01:03:54', NULL),
(207, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'http://localhost:8000/admin/tukar_poins/edit-save/7', 'Update data  at Tukar Poin', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>admin_id</td><td></td><td>2</td></tr><tr><td>status</td><td>Pending</td><td>Diterima</td></tr></tbody></table>', 1, '2023-05-08 01:09:35', NULL),
(208, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'http://localhost:8000/admin/tukar_poins/edit-save/8', 'Update data  at Tukar Poin', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>status</td><td>Sukses</td><td>On Proses</td></tr></tbody></table>', 1, '2023-05-08 01:09:50', NULL),
(209, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'http://localhost:8000/admin/sampah/add-save', 'Add New Data Plastik HDPE at Sampah', '', 1, '2023-05-08 01:13:23', NULL),
(210, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'http://localhost:8000/admin/sampah/add-save', 'Add New Data Plastik PS at Sampah', '', 1, '2023-05-08 01:13:52', NULL),
(211, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'http://localhost:8000/admin/rewards/add-save', 'Add New Data Hiasan dinding at Rewards', '', 1, '2023-05-08 01:40:37', NULL),
(212, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2023-07-14 23:38:00', NULL),
(213, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2023-07-14 23:54:33', NULL),
(214, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions/add-save', 'Add New Data  at Transaksi', '', 1, '2023-07-14 23:55:32', NULL),
(215, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/edit-save/31', 'Update data Transaksi at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>sorting</td><td>7</td><td></td></tr></tbody></table>', 1, '2023-07-14 23:57:02', NULL),
(216, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions/add-save', 'Add New Data  at Transaksi', '', 1, '2023-07-15 00:01:42', NULL),
(217, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2023-07-15 00:19:06', NULL),
(218, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2023-08-30 23:19:13', NULL),
(219, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/rewards/delete/1', 'Delete data Pot Gemoy at Rewards', '', 1, '2024-05-11 07:33:01', NULL),
(220, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/rewards/delete/3', 'Delete data Kotak Tisu at Rewards', '', 1, '2024-05-11 07:33:03', NULL),
(221, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/rewards/delete/2', 'Delete data Anyaman at Rewards', '', 1, '2024-05-11 07:33:05', NULL),
(222, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/rewards/delete/4', 'Delete data Hiasan dinding at Rewards', '', 1, '2024-05-11 07:33:07', NULL),
(223, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/sampah_categories/delete/1', 'Delete data Plastik at Kategori Sampah', '', 1, '2024-05-11 07:34:59', NULL),
(224, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/sampah_categories/delete/2', 'Delete data Logam at Kategori Sampah', '', 1, '2024-05-11 07:35:02', NULL),
(225, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/sampah_categories/delete/3', 'Delete data Kertas at Kategori Sampah', '', 1, '2024-05-11 07:35:04', NULL),
(226, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/nasabah/delete/18', 'Delete data sadam123 at Nasabah', '', 1, '2024-05-11 07:35:09', NULL),
(227, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/nasabah/delete/16', 'Delete data sdmap at Nasabah', '', 1, '2024-05-11 07:35:11', NULL),
(228, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/nasabah/delete/17', 'Delete data dudum at Nasabah', '', 1, '2024-05-11 07:35:13', NULL),
(229, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2024-08-06 01:44:33', NULL),
(230, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/sampah_categories/add-save', 'Add New Data Plastik at Kategori Sampah', '', 1, '2024-08-06 01:46:44', NULL),
(231, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/sampah_categories/add-save', 'Add New Data Elektronik at Kategori Sampah', '', 1, '2024-08-06 01:46:56', NULL),
(232, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/sampah/add-save', 'Add New Data Botol Plastik at Sampah', '', 1, '2024-08-06 01:47:33', NULL),
(233, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/sampah/add-save', 'Add New Data TV Bekas at Sampah', '', 1, '2024-08-06 01:47:54', NULL),
(234, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/sampah/add-save', 'Add New Data TV Bekas at Sampah', '', 1, '2024-08-06 01:47:56', NULL),
(235, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/sampah/delete/8', 'Delete data TV Bekas at Sampah', '', 1, '2024-08-06 01:48:02', NULL),
(236, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions/add-save', 'Add New Data  at Transaksi', '', 1, '2024-08-06 01:52:30', NULL),
(237, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/sampah/delete/6', 'Delete data Botol Plastik at Sampah', '', 1, '2024-08-06 03:25:55', NULL),
(238, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/sampah/delete/7', 'Delete data TV Bekas at Sampah', '', 1, '2024-08-06 03:25:59', NULL),
(239, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/sampah/add-save', 'Add New Data Botol Bekas at Sampah', '', 1, '2024-08-06 03:26:34', NULL),
(240, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/sampah/add-save', 'Add New Data Kardus at Sampah', '', 1, '2024-08-06 03:26:58', NULL),
(241, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/sampah/add-save', 'Add New Data Koran Bekas at Sampah', '', 1, '2024-08-06 03:27:33', NULL),
(242, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/sampah/add-save', 'Add New Data Tutup Galon at Sampah', '', 1, '2024-08-06 03:27:49', NULL),
(243, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/sampah_categories/edit-save/4', 'Update data Umum at Kategori Sampah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>name</td><td>Plastik</td><td>Umum</td></tr><tr><td>description</td><td>Botol plastik</td><td>Barang umum</td></tr></tbody></table>', 1, '2024-08-06 03:28:09', NULL),
(244, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/sampah_categories/add-save', 'Add New Data Plastik at Kategori Sampah', '', 1, '2024-08-06 03:42:29', NULL),
(245, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/sampah_categories/add-save', 'Add New Data Kertas at Kategori Sampah', '', 1, '2024-08-06 03:42:45', NULL),
(246, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/sampah/edit-save/10', 'Update data Kardus at Sampah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>category_id</td><td>4</td><td>7</td></tr></tbody></table>', 1, '2024-08-06 03:42:55', NULL),
(247, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/sampah/edit-save/11', 'Update data Koran Bekas at Sampah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>category_id</td><td>4</td><td>7</td></tr></tbody></table>', 1, '2024-08-06 03:43:04', NULL),
(248, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/sampah/edit-save/9', 'Update data Botol Bekas at Sampah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>category_id</td><td>4</td><td>6</td></tr></tbody></table>', 1, '2024-08-06 03:43:20', NULL),
(249, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/sampah/edit-save/12', 'Update data Tutup Galon at Sampah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>category_id</td><td>4</td><td>6</td></tr></tbody></table>', 1, '2024-08-06 03:43:36', NULL),
(250, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/sampah_categories/delete/4', 'Delete data Umum at Kategori Sampah', '', 1, '2024-08-06 03:43:44', NULL),
(251, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions/add-save', 'Add New Data  at Transaksi', '', 1, '2024-08-06 04:38:51', NULL),
(252, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/rewards/add-save', 'Add New Data Game at Rewards', '', 1, '2024-08-06 05:46:57', NULL),
(253, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2024-08-07 06:06:50', NULL),
(254, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/sampah/add-save', 'Add New Data TV Bekas at Sampah', '', 1, '2024-08-07 06:07:39', NULL),
(255, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/sampah/add-save', 'Add New Data TV Bekas at Sampah', '', 1, '2024-08-07 06:07:40', NULL),
(256, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/sampah/add-save', 'Add New Data Radio Bekas at Sampah', '', 1, '2024-08-07 06:07:59', NULL),
(257, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/sampah/delete/14', 'Delete data TV Bekas at Sampah', '', 1, '2024-08-07 06:08:05', NULL),
(258, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2024-08-07 21:37:38', NULL),
(259, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions/add-save', 'Add New Data  at Transaksi', '', 1, '2024-08-07 21:40:14', NULL),
(260, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions/add-save', 'Add New Data  at Transaksi', '', 1, '2024-08-07 22:24:05', NULL),
(261, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions/add-save', 'Add New Data  at Transaksi', '', 1, '2024-08-07 23:27:05', NULL),
(262, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/rewards/edit-save/5', 'Update data Game at Rewards', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>price</td><td>20000</td><td>1000</td></tr></tbody></table>', 1, '2024-08-07 23:27:38', NULL),
(263, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/edit-save/30', 'Update data Nasabah at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>parent_id</td><td>0</td><td></td></tr><tr><td>is_dashboard</td><td>0</td><td>1</td></tr><tr><td>sorting</td><td>6</td><td></td></tr></tbody></table>', 1, '2024-08-08 01:21:41', NULL),
(264, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/edit-save/30', 'Update data Nasabah at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>sorting</td><td>6</td><td></td></tr></tbody></table>', 1, '2024-08-08 01:22:03', NULL),
(265, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/tukar_poins/edit-save/9', 'Update data  at Tukar Poin', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>admin_id</td><td></td><td>1</td></tr><tr><td>status</td><td>Pending</td><td>On Proses</td></tr></tbody></table>', 1, '2024-08-08 01:29:27', NULL),
(266, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/tukar_poins/edit-save/9', 'Update data  at Tukar Poin', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>status</td><td>On Proses</td><td>Diterima</td></tr></tbody></table>', 1, '2024-08-08 01:29:51', NULL),
(267, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/add-save', 'Add New Data Konten Edukasi at Menu Management', '', 1, '2024-08-08 02:37:31', NULL),
(268, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/education/add-save', 'Add New Data  at Konten Edukasi', '', 1, '2024-08-08 03:40:00', NULL),
(269, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2024-08-08 05:43:56', NULL),
(270, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/delete/34', 'Delete data Konten Edukasi at Menu Management', '', 1, '2024-08-08 05:44:23', NULL),
(271, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/education/add-save', 'Add New Data  at Konten Edukasi', '', 1, '2024-08-08 07:13:23', NULL),
(272, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2024-08-08 23:17:00', NULL),
(273, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/education/add-save', 'Add New Data  at Konten Edukasi', '', 1, '2024-08-08 23:18:23', NULL),
(274, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions/add-save', 'Add New Data  at Transaksi', '', 1, '2024-08-09 01:26:16', NULL),
(275, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions/add-save', 'Add New Data  at Transaksi', '', 1, '2024-08-09 02:27:46', NULL),
(276, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions/delete/17', 'Delete data 17 at Transaksi', '', 1, '2024-08-09 02:28:32', NULL),
(277, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions/delete/16', 'Delete data 16 at Transaksi', '', 1, '2024-08-09 02:29:17', NULL),
(278, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions/delete/26', 'Delete data 26 at Transaksi', '', 1, '2024-08-09 02:29:23', NULL),
(279, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions/delete/25', 'Delete data 25 at Transaksi', '', 1, '2024-08-09 02:29:26', NULL),
(280, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions/delete/24', 'Delete data 24 at Transaksi', '', 1, '2024-08-09 02:29:29', NULL),
(281, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions/delete/23', 'Delete data 23 at Transaksi', '', 1, '2024-08-09 02:29:32', NULL),
(282, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions/delete/22', 'Delete data 22 at Transaksi', '', 1, '2024-08-09 02:29:35', NULL),
(283, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions/delete/22', 'Delete data  at Transaksi', '', 1, '2024-08-09 02:29:36', NULL),
(284, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions/delete/21', 'Delete data 21 at Transaksi', '', 1, '2024-08-09 02:29:40', NULL),
(285, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions/delete/20', 'Delete data 20 at Transaksi', '', 1, '2024-08-09 02:29:43', NULL),
(286, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions/delete/19', 'Delete data 19 at Transaksi', '', 1, '2024-08-09 02:29:46', NULL),
(287, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions/delete/18', 'Delete data 18 at Transaksi', '', 1, '2024-08-09 02:29:49', NULL),
(288, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions/delete/15', 'Delete data 15 at Transaksi', '', 1, '2024-08-09 02:29:52', NULL),
(289, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions/delete/14', 'Delete data 14 at Transaksi', '', 1, '2024-08-09 02:29:56', NULL),
(290, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions/add-save', 'Add New Data  at Transaksi', '', 1, '2024-08-09 02:30:28', NULL),
(291, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2024-08-09 03:19:14', NULL),
(292, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/rewards/add-save', 'Add New Data Uang Cash at Rewards', '', 1, '2024-08-09 03:21:42', NULL),
(293, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/rewards/edit-save/6', 'Update data Uang Cash at Rewards', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>category</td><td>Uang</td><td>uang</td></tr></tbody></table>', 1, '2024-08-09 03:21:54', NULL),
(294, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/rewards/delete-image', 'Delete the image of Game at Rewards', '', 1, '2024-08-09 04:52:31', NULL),
(295, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/rewards/edit-save/5', 'Update data Game at Rewards', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>image</td><td></td><td>uploads/1/2024-08/pot_gemoy.png</td></tr></tbody></table>', 1, '2024-08-09 04:52:40', NULL),
(296, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/rewards/edit-save/6', 'Update data Uang Cash at Rewards', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody></tbody></table>', 1, '2024-08-09 06:53:38', NULL),
(297, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/tukar_poins/delete/10', 'Delete data 10 at Tukar Poin', '', 1, '2024-08-09 08:46:12', NULL),
(298, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/tukar_poins/delete/11', 'Delete data 11 at Tukar Poin', '', 1, '2024-08-09 08:46:16', NULL),
(299, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2024-08-09 22:40:14', NULL),
(300, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions/add-save', 'Add New Data  at Transaksi', '', 1, '2024-08-09 22:40:59', NULL),
(301, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2024-08-09 23:02:55', NULL),
(302, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions/add-save', 'Add New Data  at Transaksi', '', 1, '2024-08-09 23:03:29', NULL),
(303, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/tukar_saldo/delete/1', 'Delete data 1 at Tukar Saldo', '', 1, '2024-08-10 01:55:54', NULL),
(304, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/tukar_saldo/delete/3', 'Delete data 3 at Tukar Saldo', '', 1, '2024-08-10 01:55:57', NULL),
(305, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/tukar_saldo/delete/2', 'Delete data 2 at Tukar Saldo', '', 1, '2024-08-10 01:56:00', NULL),
(306, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions/add-save', 'Add New Data  at Transaksi', '', 1, '2024-08-10 01:56:56', NULL),
(307, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/tukar_saldo/edit-save/5', 'Update data  at Tukar Saldo', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>admin_id</td><td></td><td>1</td></tr><tr><td>status</td><td>Pending</td><td>Diterima</td></tr></tbody></table>', 1, '2024-08-10 02:29:57', NULL),
(308, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions/add-save', 'Add New Data  at Transaksi', '', 1, '2024-08-10 02:35:08', NULL),
(309, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', 'admin@crudbooster.com logout', '', 1, '2024-08-10 02:38:14', NULL),
(310, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2024-08-10 02:38:24', NULL),
(311, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', 'admin@crudbooster.com logout', '', 1, '2024-08-10 07:03:18', NULL),
(312, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2024-08-10 07:03:35', NULL),
(313, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/sampah_categories/add-save', 'Add New Data Plastik at Kategori Sampah', '', 1, '2024-08-10 07:04:37', NULL),
(314, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/sampah_categories/add-save', 'Add New Data Kertas at Kategori Sampah', '', 1, '2024-08-10 07:04:48', NULL),
(315, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/sampah/add-save', 'Add New Data Botol Plastik at Sampah', '', 1, '2024-08-10 07:05:28', NULL),
(316, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/sampah/add-save', 'Add New Data Tutup Galon at Sampah', '', 1, '2024-08-10 07:05:47', NULL),
(317, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/sampah/add-save', 'Add New Data Kardus at Sampah', '', 1, '2024-08-10 07:06:08', NULL),
(318, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/sampah/add-save', 'Add New Data Koran Bekas at Sampah', '', 1, '2024-08-10 07:06:25', NULL),
(319, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/rewards/edit-save/5', 'Update data Game at Rewards', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>stock</td><td>0</td><td>3</td></tr></tbody></table>', 1, '2024-08-10 07:53:14', NULL),
(320, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/15.0.0 Mobile/15A5370a Safari/602.1', 'http://127.0.0.1:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2024-08-10 08:09:03', NULL),
(321, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2024-08-10 22:23:02', NULL),
(322, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/education/edit-save/2', 'Update data  at Konten Edukasi', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody></tbody></table>', 1, '2024-08-10 22:23:27', NULL),
(323, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2024-08-11 06:38:01', NULL),
(324, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions/add-save', 'Add New Data  at Transaksi', '', 1, '2024-08-11 06:38:31', NULL),
(325, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2024-08-11 22:49:18', NULL),
(326, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/rewards/delete-image', 'Delete the image of Uang Cash at Rewards', '', 1, '2024-08-11 22:51:23', NULL),
(327, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/rewards/edit-save/6', 'Update data Uang Cash at Rewards', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>image</td><td></td><td>uploads/1/2024-08/uang.jpeg</td></tr></tbody></table>', 1, '2024-08-11 22:51:31', NULL),
(328, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/rewards/add-save', 'Add New Data Tempat Sampah at Rewards', '', 1, '2024-08-11 22:54:26', NULL),
(329, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/rewards/edit-save/5', 'Update data Game at Rewards', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>category</td><td>hiasan</td><td>Vas Bunga</td></tr><tr><td>description</td><td>Mainan anak</td><td>Dekorasi vas bunga</td></tr></tbody></table>', 1, '2024-08-11 23:13:36', NULL),
(330, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/rewards/edit-save/5', 'Update data Vas Bunga at Rewards', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>name</td><td>Game</td><td>Vas Bunga</td></tr></tbody></table>', 1, '2024-08-11 23:13:57', NULL),
(331, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/rewards/add-save', 'Add New Data Sapu Ijuk at Rewards', '', 1, '2024-08-11 23:15:26', NULL),
(332, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2024-08-12 08:50:18', NULL),
(333, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/tukar_poins/delete/12', 'Delete data 12 at Tukar Poin', '', 1, '2024-08-12 08:51:26', NULL),
(334, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/tukar_poins/delete/13', 'Delete data 13 at Tukar Poin', '', 1, '2024-08-12 08:51:29', NULL),
(335, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/tukar_poins/delete/14', 'Delete data 14 at Tukar Poin', '', 1, '2024-08-12 08:51:32', NULL),
(336, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/rewards/edit-save/5', 'Update data Vas Bunga at Rewards', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>stock</td><td>0</td><td>20</td></tr></tbody></table>', 1, '2024-08-12 08:51:58', NULL),
(337, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/tukar_poins/edit-save/15', 'Update data  at Tukar Poin', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>admin_id</td><td></td><td>1</td></tr><tr><td>status</td><td>Pending</td><td>Diterima</td></tr></tbody></table>', 1, '2024-08-12 08:52:14', NULL),
(338, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/rewards/edit-save/5', 'Update data Vas Bunga at Rewards', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>price</td><td>1000</td><td>100</td></tr><tr><td>stock</td><td>20</td><td>1</td></tr></tbody></table>', 1, '2024-08-12 08:53:20', NULL),
(339, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/rewards/edit-save/5', 'Update data Vas Bunga at Rewards', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>stock</td><td>1</td><td>0</td></tr></tbody></table>', 1, '2024-08-12 08:53:38', NULL),
(340, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/rewards/edit-save/5', 'Update data Vas Bunga at Rewards', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>stock</td><td>0</td><td>1</td></tr></tbody></table>', 1, '2024-08-12 08:54:19', NULL),
(341, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2024-08-12 10:17:34', NULL),
(342, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/rewards/edit-save/5', 'Update data Vas Bunga at Rewards', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>stock</td><td>0</td><td>1</td></tr></tbody></table>', 1, '2024-08-12 10:18:15', NULL),
(343, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/tukar_poins/edit-save/16', 'Update data  at Tukar Poin', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>admin_id</td><td></td><td>1</td></tr><tr><td>status</td><td>Pending</td><td>On Proses</td></tr></tbody></table>', 1, '2024-08-12 10:18:45', NULL),
(344, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/rewards/edit-save/5', 'Update data Vas Bunga at Rewards', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>stock</td><td>0</td><td>1</td></tr></tbody></table>', 1, '2024-08-12 10:42:59', NULL),
(345, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions/add-save', 'Add New Data  at Transaksi', '', 1, '2024-08-12 10:43:38', NULL),
(346, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions/add-save', 'Add New Data  at Transaksi', '', 1, '2024-08-12 10:44:23', NULL),
(347, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/tukar_poins/delete/17', 'Delete data 17 at Tukar Poin', '', 1, '2024-08-12 10:45:19', NULL),
(348, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/tukar_poins/edit-save/18', 'Update data  at Tukar Poin', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>admin_id</td><td></td><td>1</td></tr><tr><td>status</td><td>Pending</td><td>Diterima</td></tr></tbody></table>', 1, '2024-08-12 10:45:29', NULL),
(349, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/tukar_poins/edit-save/16', 'Update data  at Tukar Poin', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>status</td><td>On Proses</td><td>Diterima</td></tr></tbody></table>', 1, '2024-08-12 10:54:20', NULL),
(350, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/tukar_poins/edit-save/16', 'Update data  at Tukar Poin', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>status</td><td>Diterima</td><td>Pending</td></tr></tbody></table>', 1, '2024-08-12 10:55:02', NULL),
(351, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/tukar_poins/edit-save/16', 'Update data  at Tukar Poin', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>status</td><td>Pending</td><td>Diterima</td></tr></tbody></table>', 1, '2024-08-12 10:55:10', NULL),
(352, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/tukar_poins/delete/19', 'Delete data 19 at Tukar Poin', '', 1, '2024-08-12 10:56:14', NULL),
(353, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/rewards/edit-save/5', 'Update data Vas Bunga at Rewards', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>stock</td><td>0</td><td>1</td></tr></tbody></table>', 1, '2024-08-12 10:56:22', NULL),
(354, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/tukar_poins/edit-save/20', 'Update data  at Tukar Poin', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>admin_id</td><td></td><td>1</td></tr><tr><td>status</td><td>Pending</td><td>Diterima</td></tr></tbody></table>', 1, '2024-08-12 10:56:59', NULL),
(355, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/tukar_poins/edit-save/20', 'Update data  at Tukar Poin', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>status</td><td>Diterima</td><td>Pending</td></tr></tbody></table>', 1, '2024-08-12 10:59:35', NULL),
(356, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/tukar_poins/edit-save/20', 'Update data  at Tukar Poin', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>status</td><td>Pending</td><td>Diterima</td></tr></tbody></table>', 1, '2024-08-12 10:59:46', NULL);
INSERT INTO `cms_logs` (`id`, `ipaddress`, `useragent`, `url`, `description`, `details`, `id_cms_users`, `created_at`, `updated_at`) VALUES
(357, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/tukar_poins/edit-save/20', 'Update data  at Tukar Poin', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>status</td><td>Diterima</td><td>Pending</td></tr></tbody></table>', 1, '2024-08-12 11:02:03', NULL),
(358, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/tukar_poins/edit-save/20', 'Update data  at Tukar Poin', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>status</td><td>Pending</td><td>Diterima</td></tr></tbody></table>', 1, '2024-08-12 11:02:13', NULL),
(359, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/tukar_poins/edit-save/21', 'Update data  at Tukar Poin', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>admin_id</td><td></td><td>1</td></tr><tr><td>status</td><td>Pending</td><td>Diterima</td></tr></tbody></table>', 1, '2024-08-12 11:04:16', NULL),
(360, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/tukar_poins/edit-save/21', 'Update data  at Tukar Poin', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>status</td><td>Diterima</td><td>Pending</td></tr></tbody></table>', 1, '2024-08-12 11:09:28', NULL),
(361, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/tukar_poins/edit-save/21', 'Update data  at Tukar Poin', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>status</td><td>Pending</td><td>Diterima</td></tr></tbody></table>', 1, '2024-08-12 11:09:37', NULL),
(362, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/tukar_poins/edit-save/21', 'Update data  at Tukar Poin', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>status</td><td>Diterima</td><td>Pending</td></tr></tbody></table>', 1, '2024-08-12 11:13:42', NULL),
(363, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/tukar_poins/edit-save/21', 'Update data  at Tukar Poin', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>status</td><td>Pending</td><td>Diterima</td></tr></tbody></table>', 1, '2024-08-12 11:15:31', NULL),
(364, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/tukar_poins/edit-save/21', 'Update data  at Tukar Poin', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>status</td><td>Diterima</td><td>Pending</td></tr></tbody></table>', 1, '2024-08-12 11:18:30', NULL),
(365, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/tukar_poins/edit-save/21', 'Update data  at Tukar Poin', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>status</td><td>Pending</td><td>Diterima</td></tr></tbody></table>', 1, '2024-08-12 11:18:40', NULL),
(366, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/edit-save/24', 'Update data Sampah at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>parent_id</td><td>0</td><td></td></tr><tr><td>is_dashboard</td><td>0</td><td>1</td></tr><tr><td>sorting</td><td>2</td><td></td></tr></tbody></table>', 1, '2024-08-12 11:20:16', NULL),
(367, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/edit-save/24', 'Update data Sampah at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>path</td><td>AdminSampahControllerGetIndex</td><td>AdminSampahController</td></tr><tr><td>parent_id</td><td>0</td><td></td></tr><tr><td>sorting</td><td>2</td><td></td></tr></tbody></table>', 1, '2024-08-12 11:27:54', NULL),
(368, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/edit-save/24', 'Update data Sampah at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>path</td><td>AdminSampahController</td><td>AdminSampahControllerGetIndex</td></tr><tr><td>parent_id</td><td>0</td><td></td></tr><tr><td>sorting</td><td>2</td><td></td></tr></tbody></table>', 1, '2024-08-12 11:28:10', NULL),
(369, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/edit-save/24', 'Update data Sampah at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>sorting</td><td>2</td><td></td></tr></tbody></table>', 1, '2024-08-12 11:37:55', NULL),
(370, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/statistic_builder/add-save', 'Add New Data Dashboard at Statistic Builder', '', 1, '2024-08-12 11:38:22', NULL),
(371, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/add-save', 'Add New Data Dashboard at Menu Management', '', 1, '2024-08-12 11:38:49', NULL),
(372, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2024-08-12 12:21:40', NULL),
(373, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2024-08-12 22:08:51', NULL),
(374, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', 'admin@crudbooster.com logout', '', 1, '2024-08-12 22:13:15', NULL),
(375, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2024-08-12 22:14:28', NULL),
(376, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/education/add-save', 'Add New Data  at Konten Edukasi', '', 1, '2024-08-13 01:12:20', NULL),
(377, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/education/add-save', 'Add New Data  at Konten Edukasi', '', 1, '2024-08-13 01:21:06', NULL),
(378, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/education/delete/5', 'Delete data 5 at Konten Edukasi', '', 1, '2024-08-13 08:24:39', NULL),
(379, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/education/add-save', 'Add New Data  at Konten Edukasi', '', 1, '2024-08-13 08:24:55', NULL),
(380, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/education/edit-save/6', 'Update data  at Konten Edukasi', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>judul</td><td>Cek Kesehatan di Klinik Ini Bisa Bayar Pakai Sampah  Baca artikel detikHealth, \"Cek Kesehatan di Klinik Ini Bisa Bayar Pakai Sampah\" selengkapnya https://health.detik.com/fotohealth/d-7479009/cek-kesehatan-di-klinik-ini-bisa-bayar-pakai-sampah.  Download Apps Detikcom Sekarang https://apps.detik.com/detik/</td><td>Cek Kesehatan di Klinik Ini Bisa Bayar Pakai Sampah</td></tr></tbody></table>', 1, '2024-08-13 08:25:39', NULL),
(381, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/15.0.0 Mobile/15A5370a Safari/602.1', 'http://127.0.0.1:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2024-08-13 08:58:14', NULL),
(382, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/15.0.0 Mobile/15A5370a Safari/602.1', 'http://127.0.0.1:8000/admin/education/add-save', 'Add New Data  at Konten Edukasi', '', 1, '2024-08-13 09:23:15', NULL),
(383, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/education/delete/4', 'Delete data 4 at Konten Edukasi', '', 1, '2024-08-13 09:23:28', NULL),
(384, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/education/delete/7', 'Delete data 7 at Konten Edukasi', '', 1, '2024-08-13 09:23:33', NULL),
(385, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/education/add-save', 'Add New Data  at Konten Edukasi', '', 1, '2024-08-13 09:23:53', NULL),
(386, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/education/delete/8', 'Delete data 8 at Konten Edukasi', '', 1, '2024-08-13 09:24:02', NULL),
(387, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/edit-save/37', 'Update data Tukar Saldo at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>icon</td><td>fa fa-trademark</td><td>fa fa-trophy</td></tr><tr><td>sorting</td><td>10</td><td></td></tr></tbody></table>', 1, '2024-08-13 09:24:58', NULL),
(388, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/edit-save/35', 'Update data Konten Edukasi at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>icon</td><td>fa fa-file-o</td><td>fa fa-book</td></tr><tr><td>sorting</td><td>8</td><td></td></tr></tbody></table>', 1, '2024-08-13 09:25:27', NULL),
(389, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', ' logout', '', NULL, '2024-08-13 12:02:31', NULL),
(390, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2024-08-13 12:27:37', NULL),
(391, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions/add-save', 'Add New Data  at Transaksi', '', 1, '2024-08-13 12:29:37', NULL),
(392, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/rewards/edit-save/5', 'Update data Vas Bunga at Rewards', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>stock</td><td>0</td><td>5</td></tr></tbody></table>', 1, '2024-08-13 12:31:10', NULL),
(393, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/tukar_poins/edit-save/22', 'Update data  at Tukar Poin', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>admin_id</td><td></td><td>1</td></tr><tr><td>status</td><td>Pending</td><td>On Proses</td></tr></tbody></table>', 1, '2024-08-13 12:32:44', NULL),
(394, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/tukar_poins/edit-save/22', 'Update data  at Tukar Poin', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>status</td><td>On Proses</td><td>Diterima</td></tr></tbody></table>', 1, '2024-08-13 12:33:34', NULL),
(395, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/users/add-save', 'Add New Data BSU-1 at Users Management', '', 1, '2024-08-13 14:15:19', NULL),
(396, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/users/add-save', 'Add New Data BSU-2 at Users Management', '', 1, '2024-08-13 14:16:05', NULL),
(397, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/users/add-save', 'Add New Data BSU-3 at Users Management', '', 1, '2024-08-13 14:16:44', NULL),
(398, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/users/add-save', 'Add New Data BSU-4 at Users Management', '', 1, '2024-08-13 14:17:24', NULL),
(399, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', 'admin@crudbooster.com logout', '', 1, '2024-08-13 14:18:46', NULL),
(400, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'bsu1@gmail.com login with IP Address 127.0.0.1', '', 5, '2024-08-13 14:19:02', NULL),
(401, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/edit-save/23', 'Update data Kategori Sampah at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>sorting</td><td>2</td><td></td></tr></tbody></table>', 5, '2024-08-13 14:19:49', NULL),
(402, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/edit-save/38', 'Update data Dashboard at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody></tbody></table>', 5, '2024-08-13 14:22:02', NULL),
(403, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', 'bsu1@gmail.com logout', '', 5, '2024-08-13 14:24:26', NULL),
(404, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2024-08-13 14:24:37', NULL),
(405, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/edit-save/38', 'Update data Dashboard at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>parent_id</td><td>0</td><td></td></tr><tr><td>is_dashboard</td><td>0</td><td>1</td></tr></tbody></table>', 1, '2024-08-13 14:25:33', NULL),
(406, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/users/edit-save/8', 'Update data BSU-4 at Users Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>password</td><td>$2y$10$3t9GkneRqVZHg04m3883hOjAI2YJc8wIofWTR1G7vZVlEASDnnDji</td><td></td></tr><tr><td>status</td><td></td><td>Active</td></tr></tbody></table>', 1, '2024-08-13 14:34:01', NULL),
(407, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/users/edit-save/5', 'Update data BSU-1 at Users Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>password</td><td>$2y$10$.ZCXqpHVan85cC88nGtKneJWkZ4QxITl.L304PNjgRf5u1MMIHDau</td><td></td></tr><tr><td>status</td><td></td><td>Active</td></tr></tbody></table>', 1, '2024-08-13 14:34:15', NULL),
(408, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', 'admin@crudbooster.com logout', '', 1, '2024-08-13 14:34:19', NULL),
(409, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'bsu1@gmail.com login with IP Address 127.0.0.1', '', 5, '2024-08-13 14:34:39', NULL),
(410, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', 'bsu1@gmail.com logout', '', 5, '2024-08-13 14:35:15', NULL),
(411, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2024-08-13 14:35:33', NULL),
(412, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', 'admin@crudbooster.com logout', '', 1, '2024-08-13 14:36:30', NULL),
(413, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'bsu1@gmail.com login with IP Address 127.0.0.1', '', 5, '2024-08-13 14:36:45', NULL),
(414, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/add-save', 'Add New Data Sampah at Menu Management', '', 5, '2024-08-13 14:37:44', NULL),
(415, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/delete/39', 'Delete data Sampah at Menu Management', '', 5, '2024-08-13 14:38:17', NULL),
(416, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', 'bsu1@gmail.com logout', '', 5, '2024-08-13 14:38:22', NULL),
(417, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2024-08-13 14:38:35', NULL),
(418, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/edit-save/38', 'Update data Dashboard at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>parent_id</td><td>0</td><td></td></tr></tbody></table>', 1, '2024-08-13 14:38:51', NULL),
(419, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/edit-save/23', 'Update data Kategori Sampah at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>sorting</td><td>2</td><td></td></tr></tbody></table>', 1, '2024-08-13 14:38:58', NULL),
(420, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/edit-save/24', 'Update data Sampah at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>sorting</td><td>3</td><td></td></tr></tbody></table>', 1, '2024-08-13 14:39:04', NULL),
(421, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/edit-save/26', 'Update data Rewards at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>sorting</td><td>4</td><td></td></tr></tbody></table>', 1, '2024-08-13 14:39:10', NULL),
(422, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/edit-save/31', 'Update data Transaksi at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>sorting</td><td>5</td><td></td></tr></tbody></table>', 1, '2024-08-13 14:39:15', NULL),
(423, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/edit-save/32', 'Update data Poin at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>sorting</td><td>6</td><td></td></tr></tbody></table>', 1, '2024-08-13 14:39:22', NULL),
(424, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/edit-save/32', 'Update data Poin at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>sorting</td><td>6</td><td></td></tr></tbody></table>', 1, '2024-08-13 14:39:28', NULL),
(425, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/edit-save/36', 'Update data Saldo at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>sorting</td><td>7</td><td></td></tr></tbody></table>', 1, '2024-08-13 14:39:35', NULL),
(426, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/edit-save/35', 'Update data Konten Edukasi at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>sorting</td><td>8</td><td></td></tr></tbody></table>', 1, '2024-08-13 14:39:41', NULL),
(427, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/edit-save/33', 'Update data Tukar Poin at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>sorting</td><td>9</td><td></td></tr></tbody></table>', 1, '2024-08-13 14:39:47', NULL),
(428, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/edit-save/37', 'Update data Tukar Saldo at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>sorting</td><td>10</td><td></td></tr></tbody></table>', 1, '2024-08-13 14:39:52', NULL),
(429, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/edit-save/30', 'Update data Nasabah at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>sorting</td><td>11</td><td></td></tr></tbody></table>', 1, '2024-08-13 14:39:59', NULL),
(430, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', 'admin@crudbooster.com logout', '', 1, '2024-08-13 14:40:05', NULL),
(431, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'bsu1@gmail.com login with IP Address 127.0.0.1', '', 5, '2024-08-13 14:40:16', NULL),
(432, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', 'bsu1@gmail.com logout', '', 5, '2024-08-13 14:57:35', NULL),
(433, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2024-08-13 14:57:55', NULL),
(434, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', 'admin@crudbooster.com logout', '', 1, '2024-08-13 14:58:10', NULL),
(435, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'bsu1@gmail.com login with IP Address 127.0.0.1', '', 5, '2024-08-13 14:58:45', NULL),
(436, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions/add-save', 'Add New Data  at Transaksi', '', 5, '2024-08-13 15:00:08', NULL),
(437, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', 'bsu1@gmail.com logout', '', 5, '2024-08-13 15:02:37', NULL),
(438, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'bsu2@gmail.com login with IP Address 127.0.0.1', '', 6, '2024-08-13 15:02:49', NULL),
(439, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions/add-save', 'Add New Data  at Transaksi', '', 6, '2024-08-13 15:03:14', NULL),
(440, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/tukar_poins/edit-save/23', 'Update data  at Tukar Poin', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>admin_id</td><td></td><td>6</td></tr><tr><td>status</td><td>Pending</td><td>On Proses</td></tr></tbody></table>', 6, '2024-08-13 15:38:06', NULL),
(441, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', 'bsu2@gmail.com logout', '', 6, '2024-08-13 16:08:24', NULL),
(442, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'bsu1@gmail.com login with IP Address 127.0.0.1', '', 5, '2024-08-13 16:08:55', NULL),
(443, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions/delete/3', 'Delete data 3 at Transaksi', '', 5, '2024-08-13 16:22:27', NULL),
(444, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions/delete/1', 'Delete data 1 at Transaksi', '', 5, '2024-08-13 16:22:30', NULL),
(445, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions/delete/2', 'Delete data 2 at Transaksi', '', 5, '2024-08-13 16:22:33', NULL),
(446, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions/add-save', 'Add New Data  at Transaksi', '', 5, '2024-08-13 16:22:47', NULL),
(447, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'bsu2@gmail.com login with IP Address 127.0.0.1', '', 6, '2024-08-14 07:14:11', NULL),
(448, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/pengumuman/add-save', 'Add New Data Pengumpulan sampah at Pengumuman', '', 6, '2024-08-14 07:20:24', NULL),
(449, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/pengumuman/edit-save/1', 'Update data Pengumpulan sampah at Pengumuman', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>status</td><td></td><td>Pending</td></tr></tbody></table>', 6, '2024-08-14 07:25:33', NULL),
(450, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/pengumuman/edit-save/1', 'Update data Pengumpulan sampah at Pengumuman', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>status</td><td>Pending</td><td>On Proses</td></tr></tbody></table>', 6, '2024-08-14 07:25:41', NULL),
(451, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/pengumuman/add-save', 'Add New Data Pengumpulan sampah at Pengumuman', '', 6, '2024-08-14 07:38:06', NULL),
(452, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/pengumuman/add-save', 'Add New Data Pengumpulan sampah at Pengumuman', '', 6, '2024-08-14 07:40:11', NULL),
(453, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/pengumuman/edit-save/3', 'Update data Pengumpulan sampah at Pengumuman', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>status</td><td>Pending</td><td>On Proses</td></tr></tbody></table>', 6, '2024-08-14 07:41:17', NULL),
(454, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/pengumuman/edit-save/3', 'Update data Pengumpulan sampah at Pengumuman', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>deskripsi</td><td>Penukaran sampah akan dilaksanakan pada tanggal 17 Agustus 2024 s/d 24 Agustus 2024 di BSU terdekat!</td><td>Penukaran sampah akan dilaksanakan pada tanggal 17 Agustus 2024 s/d 24 Agustus 2024 di BSU pilihan anda!</td></tr></tbody></table>', 6, '2024-08-14 07:52:17', NULL),
(455, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/pengumuman/edit-save/3', 'Update data Pengumpulan sampah at Pengumuman', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>status</td><td>On Proses</td><td>Selesai</td></tr></tbody></table>', 6, '2024-08-14 07:53:02', NULL),
(456, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/pengumuman/edit-save/3', 'Update data Pengumpulan sampah at Pengumuman', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>status</td><td>Selesai</td><td>On Proses</td></tr></tbody></table>', 6, '2024-08-14 08:48:47', NULL),
(457, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/pengumuman/edit-save/3', 'Update data Pengumpulan sampah at Pengumuman', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>status</td><td>On Proses</td><td>Pending</td></tr></tbody></table>', 6, '2024-08-14 08:49:52', NULL),
(458, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/edit-save/31', 'Update data Transaksi Nasabah at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>name</td><td>Transaksi</td><td>Transaksi Nasabah</td></tr><tr><td>sorting</td><td>5</td><td></td></tr></tbody></table>', 6, '2024-08-14 09:43:13', NULL),
(459, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions/add-save', 'Add New Data  at Transaksi Nasabah', '', 6, '2024-08-14 10:04:25', NULL),
(460, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', 'bsu2@gmail.com logout', '', 6, '2024-08-14 10:09:35', NULL),
(461, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2024-08-14 10:09:49', NULL),
(462, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', 'admin@crudbooster.com logout', '', 1, '2024-08-14 10:17:24', NULL),
(463, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'bsu2@gmail.com login with IP Address 127.0.0.1', '', 6, '2024-08-14 10:17:33', NULL),
(464, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', 'bsu2@gmail.com logout', '', 6, '2024-08-14 10:17:44', NULL),
(465, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'bsu1@gmail.com login with IP Address 127.0.0.1', '', 5, '2024-08-14 10:17:57', NULL),
(466, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/pengumuman/add-save', 'Add New Data Pengumpulan Sampah at Pengumuman', '', 5, '2024-08-14 10:19:16', NULL),
(467, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2024-08-14 10:22:21', NULL),
(468, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/users/edit-save/1', 'Update data Super Admin at Users Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>photo</td><td></td><td>uploads/1/2024-08/image_17.png</td></tr><tr><td>password</td><td>$2y$10$bSNg2V6p.aHKKIQaAg2vpuR0E3tlE5nR3a385HYc/o6j.EyQP3soW</td><td>$2y$10$sWLmqEjUz7BcmH3tUPd/F.vpAnIWSkK5dMoHkfgbQDI8g5tDG60/m</td></tr></tbody></table>', 1, '2024-08-14 10:22:57', NULL),
(469, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', 'admin@crudbooster.com logout', '', 1, '2024-08-14 10:23:04', NULL),
(470, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2024-08-14 10:23:16', NULL),
(471, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', 'admin@crudbooster.com logout', '', 1, '2024-08-14 10:35:31', NULL),
(472, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'bsu1@gmail.com login with IP Address 127.0.0.1', '', 5, '2024-08-14 10:35:42', NULL),
(473, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions/add-save', 'Add New Data  at Transaksi Nasabah', '', 5, '2024-08-14 10:49:51', NULL),
(474, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions/add-save', 'Add New Data  at Transaksi Nasabah', '', 5, '2024-08-14 10:51:18', NULL),
(475, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions_bsi/add-save', 'Add New Data  at Transaksi BSI', '', 5, '2024-08-14 12:44:10', NULL),
(476, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions_bsi/add-save', 'Add New Data  at Transaksi BSI', '', 5, '2024-08-14 13:14:45', NULL),
(477, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions_bsi/delete/5', 'Delete data 5 at Transaksi BSI', '', 5, '2024-08-14 13:15:06', NULL),
(478, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions_bsi/add-save', 'Add New Data  at Transaksi BSI', '', 5, '2024-08-14 13:15:28', NULL),
(479, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/add-save', 'Add New Data Transaksi at Menu Management', '', 5, '2024-08-14 13:21:33', NULL),
(480, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/add-save', 'Add New Data Tukar Rewards at Menu Management', '', 5, '2024-08-14 13:23:15', NULL),
(481, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/edit-save/44', 'Update data Tukar Rewards at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>sorting</td><td>6</td><td></td></tr></tbody></table>', 5, '2024-08-14 13:24:19', NULL),
(482, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/edit-save/32', 'Update data Poin at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>sorting</td><td>7</td><td></td></tr></tbody></table>', 5, '2024-08-14 13:24:45', NULL),
(483, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/edit-save/36', 'Update data Saldo at Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>sorting</td><td>8</td><td></td></tr></tbody></table>', 5, '2024-08-14 13:24:54', NULL),
(484, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'bsu1@gmail.com login with IP Address 127.0.0.1', '', 5, '2024-09-14 06:50:09', NULL),
(485, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'http://127.0.0.1:8000/admin/login', 'admin@crudbooster.com login with IP Address 127.0.0.1', '', 1, '2024-08-14 15:51:45', NULL),
(486, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'bsu1@gmail.com login dengan IP Address 127.0.0.1', '', 5, '2024-08-15 05:57:50', NULL),
(487, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions/add-save', 'Tambah data baru  pada Transaksi Nasabah', '', 5, '2024-08-15 06:54:03', NULL),
(488, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions/add-save', 'Tambah data baru  pada Transaksi Nasabah', '', 5, '2024-08-15 06:55:17', NULL),
(489, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/delete/41', 'Menghapus data Laporan pada Menu Management', '', 5, '2024-08-15 06:57:43', NULL),
(490, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/edit-save/42', 'Memperbaharui data Transaksi BSI pada Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>icon</td><td>fa fa-search</td><td>fa fa-money</td></tr><tr><td>parent_id</td><td>43</td><td></td></tr><tr><td>sorting</td><td>2</td><td></td></tr></tbody></table>', 5, '2024-08-15 06:58:39', NULL),
(491, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions/edit-save/13', 'Memperbaharui data  pada Transaksi Nasabah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>total_pembelian</td><td>11025</td><td></td></tr><tr><td>periode</td><td></td><td>1</td></tr></tbody></table>', 5, '2024-08-15 07:06:02', NULL),
(492, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions/edit-save/12', 'Memperbaharui data  pada Transaksi Nasabah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>periode</td><td></td><td>1</td></tr></tbody></table>', 5, '2024-08-15 07:06:09', NULL),
(493, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions/edit-save/11', 'Memperbaharui data  pada Transaksi Nasabah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>total_pembelian</td><td>10950</td><td></td></tr><tr><td>periode</td><td></td><td>1</td></tr></tbody></table>', 5, '2024-08-15 07:06:14', NULL),
(494, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions/edit-save/10', 'Memperbaharui data  pada Transaksi Nasabah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>total_pembelian</td><td>10200</td><td></td></tr><tr><td>periode</td><td></td><td>1</td></tr></tbody></table>', 5, '2024-08-15 07:06:19', NULL),
(495, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions/edit-save/5', 'Memperbaharui data  pada Transaksi Nasabah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>total_pembelian</td><td></td><td></td></tr><tr><td>periode</td><td></td><td>1</td></tr></tbody></table>', 5, '2024-08-15 07:06:23', NULL),
(496, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions/edit-save/7', 'Memperbaharui data  pada Transaksi Nasabah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>total_pembelian</td><td></td><td></td></tr><tr><td>periode</td><td></td><td>1</td></tr></tbody></table>', 5, '2024-08-15 07:06:28', NULL),
(497, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions/edit-save/9', 'Memperbaharui data  pada Transaksi Nasabah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>total_pembelian</td><td></td><td></td></tr><tr><td>periode</td><td></td><td>1</td></tr></tbody></table>', 5, '2024-08-15 07:06:32', NULL),
(498, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions/edit-save/13', 'Memperbaharui data  pada Transaksi Nasabah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>total_pembelian</td><td>11025</td><td></td></tr><tr><td>periode</td><td>1</td><td>2</td></tr></tbody></table>', 5, '2024-08-15 07:06:56', NULL);
INSERT INTO `cms_logs` (`id`, `ipaddress`, `useragent`, `url`, `description`, `details`, `id_cms_users`, `created_at`, `updated_at`) VALUES
(499, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions/edit-save/11', 'Memperbaharui data  pada Transaksi Nasabah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>total_pembelian</td><td>10950</td><td></td></tr></tbody></table>', 5, '2024-08-15 07:07:01', NULL),
(500, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions/edit-save/9', 'Memperbaharui data  pada Transaksi Nasabah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>total_pembelian</td><td></td><td></td></tr><tr><td>periode</td><td>1</td><td>agustus</td></tr></tbody></table>', 5, '2024-08-15 07:21:12', NULL),
(501, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions/edit-save/9', 'Memperbaharui data  pada Transaksi Nasabah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>total_pembelian</td><td></td><td></td></tr><tr><td>periode</td><td>agustus</td><td>1</td></tr></tbody></table>', 5, '2024-08-15 07:21:29', NULL),
(502, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions/edit-save/9', 'Memperbaharui data  pada Transaksi Nasabah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>total_pembelian</td><td></td><td></td></tr><tr><td>periode</td><td>1</td><td>2</td></tr></tbody></table>', 5, '2024-08-15 07:28:35', NULL),
(503, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions/edit-save/7', 'Memperbaharui data  pada Transaksi Nasabah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>total_pembelian</td><td></td><td></td></tr></tbody></table>', 5, '2024-08-15 07:43:37', NULL),
(504, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions/add-save', 'Tambah data baru  pada Transaksi Nasabah', '', 5, '2024-08-15 07:43:57', NULL),
(505, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions_bsi/edit-save/6', 'Memperbaharui data  pada Transaksi BSI', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>profit</td><td>9550</td><td></td></tr><tr><td>periode</td><td></td><td>1</td></tr></tbody></table>', 5, '2024-08-15 07:49:46', NULL),
(506, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions_bsi/delete/6', 'Menghapus data 6 pada Transaksi BSI', '', 5, '2024-08-15 07:57:11', NULL),
(507, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions/edit-save/14', 'Memperbaharui data  pada Transaksi Nasabah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>periode</td><td></td><td>1</td></tr></tbody></table>', 5, '2024-08-15 07:58:57', NULL),
(508, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions_bsi/add-save', 'Tambah data baru  pada Transaksi BSI', '', 5, '2024-08-15 07:59:18', NULL),
(509, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions_bsi/delete/7', 'Menghapus data 7 pada Transaksi BSI', '', 5, '2024-08-15 08:01:10', NULL),
(510, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions_bsi/add-save', 'Tambah data baru  pada Transaksi BSI', '', 5, '2024-08-15 08:01:24', NULL),
(511, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions_bsi/edit-save/8', 'Memperbaharui data  pada Transaksi BSI', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>total_price</td><td>5000</td><td>10000</td></tr><tr><td>profit</td><td>1800</td><td></td></tr></tbody></table>', 5, '2024-08-15 08:01:35', NULL),
(512, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions/edit-save/14', 'Memperbaharui data  pada Transaksi Nasabah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>total_weight</td><td>4</td><td>6</td></tr><tr><td>total_income</td><td>3200</td><td>4800</td></tr><tr><td>point_received</td><td>400</td><td>600</td></tr></tbody></table>', 5, '2024-08-15 08:06:59', NULL),
(513, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions/edit-save/14', 'Memperbaharui data  pada Transaksi Nasabah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>total_weight</td><td>6</td><td>0.4</td></tr><tr><td>total_income</td><td>4800</td><td>320</td></tr><tr><td>point_received</td><td>600</td><td>40</td></tr></tbody></table>', 5, '2024-08-15 08:07:09', NULL),
(514, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions_bsi/edit-save/8', 'Memperbaharui data  pada Transaksi BSI', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>total_price</td><td>10000</td><td>400000</td></tr><tr><td>profit</td><td>1800</td><td></td></tr></tbody></table>', 5, '2024-08-15 08:07:26', NULL),
(515, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions_bsi/edit-save/8', 'Memperbaharui data  pada Transaksi BSI', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>total_price</td><td>400000</td><td>50000</td></tr><tr><td>profit</td><td>1800</td><td></td></tr></tbody></table>', 5, '2024-08-15 08:10:12', NULL),
(516, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions_bsi/edit-save/8', 'Memperbaharui data  pada Transaksi BSI', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>total_price</td><td>50000</td><td>5000</td></tr><tr><td>profit</td><td>49680</td><td></td></tr></tbody></table>', 5, '2024-08-15 08:10:27', NULL),
(517, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions_bsi/edit-save/8', 'Memperbaharui data  pada Transaksi BSI', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>profit</td><td>4680</td><td></td></tr><tr><td>periode</td><td>1</td><td>2</td></tr></tbody></table>', 5, '2024-08-15 08:10:37', NULL),
(518, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions_bsi/add-save', 'Tambah data baru  pada Transaksi BSI', '', 5, '2024-08-15 08:11:11', NULL),
(519, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions_bsi/add-save', 'Tambah data baru  pada Transaksi BSI', '', 5, '2024-08-15 08:11:11', NULL),
(520, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions_bsi/delete/9', 'Menghapus data 9 pada Transaksi BSI', '', 5, '2024-08-15 08:11:22', NULL),
(521, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions_bsi/edit-save/8', 'Memperbaharui data  pada Transaksi BSI', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>profit</td><td>4680</td><td></td></tr></tbody></table>', 5, '2024-08-15 08:13:32', NULL),
(522, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions_bsi/edit-save/8', 'Memperbaharui data  pada Transaksi BSI', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>periode</td><td>2</td><td>1</td></tr></tbody></table>', 5, '2024-08-15 08:13:39', NULL),
(523, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions_bsi/edit-save/10', 'Memperbaharui data  pada Transaksi BSI', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>periode</td><td>3</td><td>1</td></tr></tbody></table>', 5, '2024-08-15 08:13:52', NULL),
(524, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions_bsi/delete/8', 'Menghapus data 8 pada Transaksi BSI', '', 5, '2024-08-15 08:14:01', NULL),
(525, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/tukar_poins/edit-save/24', 'Memperbaharui data  pada Tukar Poin', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>admin_id</td><td></td><td>5</td></tr><tr><td>status</td><td>Pending</td><td>Diterima</td></tr></tbody></table>', 5, '2024-08-15 08:38:20', NULL),
(526, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/sampah_categories/add-save', 'Tambah data baru Elektronik pada Kategori Sampah', '', 5, '2024-08-15 09:11:40', NULL),
(527, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', 'bsu1@gmail.com keluar', '', 5, '2024-08-15 09:11:44', NULL),
(528, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'bsu2@gmail.com login dengan IP Address 127.0.0.1', '', 6, '2024-08-15 09:12:18', NULL),
(529, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/rewards/add-save', 'Tambah data baru Vas Bunga pada Rewards', '', 6, '2024-08-15 09:52:04', NULL),
(530, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', 'bsu2@gmail.com keluar', '', 6, '2024-08-15 09:52:38', NULL),
(531, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'bsu1@gmail.com login dengan IP Address 127.0.0.1', '', 5, '2024-08-15 09:52:50', NULL),
(532, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', 'bsu1@gmail.com keluar', '', 5, '2024-08-15 09:53:12', NULL),
(533, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'bsu2@gmail.com login dengan IP Address 127.0.0.1', '', 6, '2024-08-15 09:53:28', NULL),
(534, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/rewards/add-save', 'Tambah data baru vas bunga pada Rewards', '', 6, '2024-08-15 10:29:30', NULL),
(535, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', 'bsu2@gmail.com keluar', '', 6, '2024-08-15 10:46:46', NULL),
(536, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'bsu3@gmail.com login dengan IP Address 127.0.0.1', '', 7, '2024-08-15 10:47:13', NULL),
(537, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', 'bsu3@gmail.com keluar', '', 7, '2024-08-15 10:48:58', NULL),
(538, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'bsu1@gmail.com login dengan IP Address 127.0.0.1', '', 5, '2024-08-15 10:49:09', NULL),
(539, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', 'bsu1@gmail.com keluar', '', 5, '2024-08-15 10:49:53', NULL),
(540, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'bsu2@gmail.com login dengan IP Address 127.0.0.1', '', 6, '2024-08-15 10:50:01', NULL),
(541, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/rewards/edit-save/9', 'Memperbaharui data Uang Cash pada Rewards', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>name</td><td>Vas Bunga</td><td>Uang Cash</td></tr><tr><td>description</td><td>Hiasan vas bunga berwarna kuning</td><td>Uang cash</td></tr></tbody></table>', 6, '2024-08-15 10:50:40', NULL),
(542, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/rewards/delete-image', 'Menghapus gambar Uang Cash pada Rewards', '', 6, '2024-08-15 10:50:47', NULL),
(543, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/rewards/edit-save/9', 'Memperbaharui data Uang Cash pada Rewards', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>image</td><td></td><td>uploads/6/2024-08/uang.jpeg</td></tr></tbody></table>', 6, '2024-08-15 10:50:54', NULL),
(544, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', 'bsu2@gmail.com keluar', '', 6, '2024-08-15 10:52:47', NULL),
(545, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'bsu1@gmail.com login dengan IP Address 127.0.0.1', '', 5, '2024-08-15 10:52:59', NULL),
(546, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/rewards/add-save', 'Tambah data baru Vas Bunga pada Rewards', '', 5, '2024-08-15 10:57:05', NULL),
(547, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/tukar_poins/edit-save/26', 'Memperbaharui data  pada Tukar Poin', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>admin_id</td><td></td><td>5</td></tr><tr><td>status</td><td>Pending</td><td>Diterima</td></tr></tbody></table>', 5, '2024-08-15 10:58:16', NULL),
(548, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/tukar_poins/delete/25', 'Menghapus data 25 pada Tukar Poin', '', 5, '2024-08-15 11:07:01', NULL),
(549, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/tukar_poins/edit-save/27', 'Memperbaharui data  pada Tukar Poin', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>admin_id</td><td></td><td>5</td></tr><tr><td>status</td><td>Pending</td><td>Diterima</td></tr></tbody></table>', 5, '2024-08-15 11:07:46', NULL),
(550, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'bsu1@gmail.com login dengan IP Address 127.0.0.1', '', 5, '2024-08-15 11:43:33', NULL),
(551, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/tukar_poins/edit-save/29', 'Memperbaharui data  pada Tukar Poin', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>admin_id</td><td></td><td>5</td></tr><tr><td>status</td><td>Pending</td><td>Diterima</td></tr></tbody></table>', 5, '2024-08-15 11:44:08', NULL),
(552, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', 'bsu1@gmail.com keluar', '', 5, '2024-08-15 11:44:18', NULL),
(553, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'bsu2@gmail.com login dengan IP Address 127.0.0.1', '', 6, '2024-08-15 11:44:25', NULL),
(554, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/tukar_poins/edit-save/28', 'Memperbaharui data  pada Tukar Poin', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>admin_id</td><td></td><td>6</td></tr><tr><td>status</td><td>Pending</td><td>Diterima</td></tr></tbody></table>', 6, '2024-08-15 11:45:05', NULL),
(555, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', 'bsu2@gmail.com keluar', '', 6, '2024-08-15 11:45:50', NULL),
(556, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'bsu1@gmail.com login dengan IP Address 127.0.0.1', '', 5, '2024-08-15 11:45:59', NULL),
(557, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/rewards/add-save', 'Tambah data baru Uang Cash pada Rewards', '', 5, '2024-08-15 11:47:38', NULL),
(558, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/tukar_saldo/delete/8', 'Menghapus data 8 pada Tukar Saldo', '', 5, '2024-08-15 11:48:19', NULL),
(559, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', 'bsu1@gmail.com keluar', '', 5, '2024-08-15 11:48:28', NULL),
(560, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'bsu2@gmail.com login dengan IP Address 127.0.0.1', '', 6, '2024-08-15 11:48:38', NULL),
(561, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', 'bsu2@gmail.com keluar', '', 6, '2024-08-15 11:48:51', NULL),
(562, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'bsu1@gmail.com login dengan IP Address 127.0.0.1', '', 5, '2024-08-15 11:49:15', NULL),
(563, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/pengumuman/edit-save/4', 'Memperbaharui data Pengumpulan Sampah pada Pengumuman', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>status</td><td>On Proses</td><td>Pending</td></tr></tbody></table>', 5, '2024-08-15 11:50:30', NULL),
(564, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'bsu1@gmail.com login dengan IP Address 127.0.0.1', '', 5, '2024-08-15 12:03:22', NULL),
(565, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/rewards/edit-save/11', 'Memperbaharui data Vas Bunga pada Rewards', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>category</td><td>hiasan</td><td>uang</td></tr></tbody></table>', 5, '2024-08-15 12:04:14', NULL),
(566, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/rewards/edit-save/11', 'Memperbaharui data Vas Bunga pada Rewards', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>category</td><td>uang</td><td>barang</td></tr></tbody></table>', 5, '2024-08-15 12:04:21', NULL),
(567, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/tukar_poins/edit-save/30', 'Memperbaharui data  pada Tukar Poin', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>admin_id</td><td></td><td>5</td></tr><tr><td>reward_id</td><td>11</td><td></td></tr><tr><td>status</td><td>Pending</td><td>Diterima</td></tr></tbody></table>', 5, '2024-08-15 12:39:19', NULL),
(568, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/tukar_poins/edit-save/31', 'Memperbaharui data  pada Tukar Poin', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>admin_id</td><td></td><td>5</td></tr><tr><td>reward_id</td><td>11</td><td></td></tr></tbody></table>', 5, '2024-08-15 12:39:33', NULL),
(569, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/tukar_poins/edit-save/31', 'Memperbaharui data  pada Tukar Poin', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>reward_id</td><td>11</td><td></td></tr><tr><td>status</td><td>Pending</td><td>Diterima</td></tr></tbody></table>', 5, '2024-08-15 12:39:44', NULL),
(570, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/tukar_saldo/edit-save/10', 'Memperbaharui data  pada Tukar Saldo', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>admin_id</td><td></td><td>5</td></tr><tr><td>status</td><td>Pending</td><td>Diterima</td></tr></tbody></table>', 5, '2024-08-15 12:39:59', NULL),
(571, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/tukar_saldo/edit-save/9', 'Memperbaharui data  pada Tukar Saldo', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>admin_id</td><td></td><td>5</td></tr><tr><td>status</td><td>Pending</td><td>Diterima</td></tr></tbody></table>', 5, '2024-08-15 12:40:57', NULL),
(572, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/rewards/edit-save/11', 'Memperbaharui data Vas Bunga pada Rewards', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>stock</td><td>0</td><td>1</td></tr></tbody></table>', 5, '2024-08-15 12:42:58', NULL),
(573, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/rewards/edit-save/11', 'Memperbaharui data Vas Bunga pada Rewards', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>stock</td><td>1</td><td>0</td></tr></tbody></table>', 5, '2024-08-15 12:44:33', NULL),
(574, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/tukar_poins/edit-save/32', 'Memperbaharui data  pada Tukar Poin', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>admin_id</td><td></td><td>5</td></tr><tr><td>status</td><td>Pending</td><td>Diterima</td></tr></tbody></table>', 5, '2024-08-15 12:44:46', NULL),
(575, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/rewards/edit-save/11', 'Memperbaharui data Vas Bunga pada Rewards', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>stock</td><td>0</td><td>1</td></tr></tbody></table>', 5, '2024-08-15 12:49:36', NULL),
(576, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/tukar_poins/edit-save/32', 'Memperbaharui data  pada Tukar Poin', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody></tbody></table>', 5, '2024-08-15 12:49:49', NULL),
(577, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'bsu1@gmail.com login dengan IP Address 127.0.0.1', '', 5, '2024-08-15 12:56:22', NULL),
(578, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions/delete-image', 'Menghapus gambar 14 pada Transaksi Nasabah', '', 5, '2024-08-15 15:22:33', NULL),
(579, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions/edit-save/14', 'Memperbaharui data  pada Transaksi Nasabah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>photo_evidence</td><td></td><td>uploads/5/2024-08/kardus.jpeg</td></tr></tbody></table>', 5, '2024-08-15 15:22:41', NULL),
(580, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions_bsi/add-save', 'Tambah data baru  pada Transaksi BSI', '', 5, '2024-08-15 15:29:05', NULL),
(581, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions_bsi/delete/11', 'Menghapus data 11 pada Transaksi BSI', '', 5, '2024-08-15 15:29:19', NULL),
(582, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/rewards/edit-save/11', 'Memperbaharui data Vas Bunga pada Rewards', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>stock</td><td>0</td><td>5</td></tr></tbody></table>', 5, '2024-08-15 15:30:14', NULL),
(583, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions/add-save', 'Tambah data baru  pada Transaksi Nasabah', '', 5, '2024-08-15 15:52:56', NULL),
(584, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions/add-save', 'Tambah data baru  pada Transaksi Nasabah', '', 5, '2024-08-15 15:57:37', NULL),
(585, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', 'bsu1@gmail.com keluar', '', 5, '2024-08-15 16:05:28', NULL),
(586, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'bsu1@gmail.com login dengan IP Address 127.0.0.1', '', 5, '2024-08-16 07:08:08', NULL),
(587, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions/add-save', 'Tambah data baru  pada Transaksi Nasabah', '', 5, '2024-08-16 07:09:00', NULL),
(588, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'bsu1@gmail.com login dengan IP Address 127.0.0.1', '', 5, '2024-08-16 07:34:48', NULL),
(589, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/sampah_categories/add-save', 'Tambah data baru Karet pada Kategori Sampah', '', 5, '2024-08-16 07:48:46', NULL),
(590, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/sampah/add-save', 'Tambah data baru test pada Sampah', '', 5, '2024-08-16 07:49:51', NULL),
(591, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', 'bsu1@gmail.com keluar', '', 5, '2024-08-16 07:52:47', NULL),
(592, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'bsu2@gmail.com login dengan IP Address 127.0.0.1', '', 6, '2024-08-16 07:52:57', NULL),
(593, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions/add-save', 'Tambah data baru  pada Transaksi Nasabah', '', 6, '2024-08-16 08:04:52', NULL),
(594, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/rewards/edit-save/10', 'Memperbaharui data vas bunga pada Rewards', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody></tbody></table>', 6, '2024-08-16 08:16:15', NULL),
(595, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/rewards/delete/9', 'Menghapus data Uang Cash pada Rewards', '', 6, '2024-08-16 08:18:15', NULL),
(596, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'bsu1@gmail.com login dengan IP Address 127.0.0.1', '', 5, '2024-08-16 08:23:40', NULL),
(597, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/sampah_categories/add-save', 'Tambah data baru Plastik pada Kategori Sampah', '', 5, '2024-08-16 08:45:13', NULL),
(598, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/sampah_categories/delete/5', 'Menghapus data Plastik pada Kategori Sampah', '', 5, '2024-08-16 08:47:00', NULL),
(599, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/sampah_categories/add-save', 'Tambah data baru Plastik pada Kategori Sampah', '', 5, '2024-08-16 08:48:57', NULL),
(600, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/sampah_categories/add-save', 'Tambah data baru Kertas pada Kategori Sampah', '', 5, '2024-08-16 08:49:09', NULL),
(601, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/sampah/add-save', 'Tambah data baru Botol Plastik pada Sampah', '', 5, '2024-08-16 08:51:17', NULL),
(602, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/sampah/add-save', 'Tambah data baru Tutup Galon pada Sampah', '', 5, '2024-08-16 08:51:40', NULL),
(603, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/sampah/add-save', 'Tambah data baru Koran Bekas pada Sampah', '', 5, '2024-08-16 08:51:59', NULL),
(604, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/sampah/add-save', 'Tambah data baru Kardus pada Sampah', '', 5, '2024-08-16 08:52:20', NULL),
(605, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions/add-save', 'Tambah data baru  pada Transaksi Nasabah', '', 5, '2024-08-16 08:55:33', NULL),
(606, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', ' keluar', '', NULL, '2024-08-16 08:56:24', NULL),
(607, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'bsu2@gmail.com login dengan IP Address 127.0.0.1', '', 6, '2024-08-16 08:56:32', NULL),
(608, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions/delete/19', 'Menghapus data 19 pada Transaksi Nasabah', '', 6, '2024-08-16 08:56:56', NULL),
(609, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/sampah_categories/add-save', 'Tambah data baru Plastik pada Kategori Sampah', '', 6, '2024-08-16 08:57:09', NULL),
(610, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/sampah_categories/add-save', 'Tambah data baru Kertas pada Kategori Sampah', '', 6, '2024-08-16 08:57:20', NULL),
(611, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/sampah/add-save', 'Tambah data baru Botol Plastik pada Sampah', '', 6, '2024-08-16 08:57:39', NULL),
(612, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/sampah/add-save', 'Tambah data baru Tutup Galon pada Sampah', '', 6, '2024-08-16 08:58:03', NULL),
(613, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/sampah/add-save', 'Tambah data baru Tutup Galon pada Sampah', '', 6, '2024-08-16 08:58:03', NULL),
(614, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/sampah/delete/12', 'Menghapus data Tutup Galon pada Sampah', '', 6, '2024-08-16 08:58:08', NULL),
(615, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions/add-save', 'Tambah data baru  pada Transaksi Nasabah', '', 6, '2024-08-16 08:58:36', NULL),
(616, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/sampah/add-save', 'Tambah data baru Kardus Bekas pada Sampah', '', 6, '2024-08-16 09:00:06', NULL),
(617, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions/add-save', 'Tambah data baru  pada Transaksi Nasabah', '', 6, '2024-08-16 09:00:27', NULL),
(618, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', 'bsu2@gmail.com keluar', '', 6, '2024-08-16 09:00:57', NULL),
(619, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'bsu1@gmail.com login dengan IP Address 127.0.0.1', '', 5, '2024-08-16 09:01:16', NULL),
(620, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions_bsi/add-save', 'Tambah data baru  pada Transaksi BSI', '', 5, '2024-08-16 09:02:33', NULL),
(621, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', 'bsu1@gmail.com keluar', '', 5, '2024-08-16 09:04:30', NULL),
(622, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'bsu3@gmail.com login dengan IP Address 127.0.0.1', '', 7, '2024-08-16 09:04:39', NULL),
(623, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', 'bsu3@gmail.com keluar', '', 7, '2024-08-16 09:05:36', NULL),
(624, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'bsu1@gmail.com login dengan IP Address 127.0.0.1', '', 5, '2024-08-16 09:05:51', NULL),
(625, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/users/edit-save/8', 'Memperbaharui data BSU-4 pada Users Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>password</td><td>$2y$10$3t9GkneRqVZHg04m3883hOjAI2YJc8wIofWTR1G7vZVlEASDnnDji</td><td></td></tr><tr><td>no_whatsapp</td><td></td><td></td></tr></tbody></table>', 5, '2024-08-16 10:13:35', NULL),
(626, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/users/edit-save/5', 'Memperbaharui data BSU-1 pada Users Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>password</td><td>$2y$10$.ZCXqpHVan85cC88nGtKneJWkZ4QxITl.L304PNjgRf5u1MMIHDau</td><td></td></tr><tr><td>no_whatsapp</td><td></td><td>087829292952</td></tr></tbody></table>', 5, '2024-08-16 10:13:48', NULL),
(627, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', 'bsu1@gmail.com keluar', '', 5, '2024-08-16 11:00:18', NULL),
(628, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'bsu1@gmail.com login dengan IP Address 127.0.0.1', '', 5, '2024-08-16 11:00:41', NULL),
(629, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'bsu2@gmail.com login dengan IP Address 127.0.0.1', '', 6, '2024-08-16 15:52:55', NULL),
(630, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions_bsi/add-save', 'Tambah data baru  pada Transaksi BSI', '', 6, '2024-08-16 15:54:08', NULL),
(631, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/rewards/add-save', 'Tambah data baru Uang Cash pada Rewards', '', 6, '2024-08-16 15:55:26', NULL),
(632, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/tukar_saldo/edit-save/11', 'Memperbaharui data  pada Tukar Saldo', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>admin_id</td><td></td><td>6</td></tr><tr><td>status</td><td>Pending</td><td>Diterima</td></tr></tbody></table>', 6, '2024-08-16 15:56:20', NULL),
(633, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', 'bsu2@gmail.com keluar', '', 6, '2024-08-16 16:00:28', NULL),
(634, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'admin@crudbooster.com login dengan IP Address 127.0.0.1', '', 1, '2024-08-16 16:00:45', NULL),
(635, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/edit-save/42', 'Memperbaharui data Transaksi BSI pada Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>parent_id</td><td>43</td><td></td></tr><tr><td>sorting</td><td>2</td><td></td></tr></tbody></table>', 1, '2024-08-16 16:02:12', NULL),
(636, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/statistic_builder/add-save', 'Tambah data baru Dashboard super admin pada Statistic Builder', '', 1, '2024-08-16 16:04:17', NULL),
(637, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/add-save', 'Tambah data baru Dashboard super admin pada Menu Management', '', 1, '2024-08-16 16:05:24', NULL),
(638, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/edit-save/38', 'Memperbaharui data Dashboard pada Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>parent_id</td><td>0</td><td></td></tr></tbody></table>', 1, '2024-08-16 16:05:36', NULL),
(639, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/edit-save/23', 'Memperbaharui data Kategori Sampah pada Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>sorting</td><td>2</td><td></td></tr></tbody></table>', 1, '2024-08-16 16:06:02', NULL),
(640, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/edit-save/24', 'Memperbaharui data Sampah pada Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>sorting</td><td>3</td><td></td></tr></tbody></table>', 1, '2024-08-16 16:06:12', NULL),
(641, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/edit-save/26', 'Memperbaharui data Rewards pada Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>sorting</td><td>4</td><td></td></tr></tbody></table>', 1, '2024-08-16 16:06:41', NULL),
(642, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/edit-save/45', 'Memperbaharui data Dashboard super admin pada Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>sorting</td><td></td><td></td></tr></tbody></table>', 1, '2024-08-16 16:23:44', NULL),
(643, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/edit-save/45', 'Memperbaharui data Dashboard super admin pada Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>parent_id</td><td>0</td><td></td></tr><tr><td>is_dashboard</td><td>0</td><td>1</td></tr><tr><td>sorting</td><td></td><td></td></tr></tbody></table>', 1, '2024-08-16 16:23:51', NULL),
(644, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', 'admin@crudbooster.com keluar', '', 1, '2024-08-16 16:25:44', NULL),
(645, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'bsu1@gmail.com login dengan IP Address 127.0.0.1', '', 5, '2024-08-16 16:25:52', NULL),
(646, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions/add-save', 'Tambah data baru  pada Transaksi Nasabah', '', 5, '2024-08-16 16:30:50', NULL),
(647, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions/add-save', 'Tambah data baru  pada Transaksi Nasabah', '', 5, '2024-08-16 16:31:11', NULL),
(648, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions/add-save', 'Tambah data baru  pada Transaksi Nasabah', '', 5, '2024-08-16 16:31:50', NULL);
INSERT INTO `cms_logs` (`id`, `ipaddress`, `useragent`, `url`, `description`, `details`, `id_cms_users`, `created_at`, `updated_at`) VALUES
(649, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'bsu1@gmail.com login dengan IP Address 127.0.0.1', '', 5, '2024-08-17 06:50:00', NULL),
(650, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions_bsi/edit-save/10', 'Memperbaharui data  pada Transaksi BSI', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>profit</td><td>4680</td><td></td></tr><tr><td>periode</td><td>1</td><td>2</td></tr></tbody></table>', 5, '2024-08-17 07:20:26', NULL),
(651, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions_bsi/edit-save/10', 'Memperbaharui data  pada Transaksi BSI', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>total_price</td><td>5000</td><td>10000</td></tr><tr><td>profit</td><td>-2900</td><td></td></tr></tbody></table>', 5, '2024-08-17 07:20:48', NULL),
(652, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'bsu1@gmail.com login dengan IP Address 127.0.0.1', '', 5, '2024-08-17 12:02:16', NULL),
(653, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'bsu1@gmail.com login dengan IP Address 127.0.0.1', '', 5, '2024-08-17 12:08:57', NULL),
(654, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', 'bsu1@gmail.com keluar', '', 5, '2024-08-17 12:14:38', NULL),
(655, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'bsu1@gmail.com login dengan IP Address 127.0.0.1', '', 5, '2024-08-17 12:15:23', NULL),
(656, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions_bsi/add-save', 'Tambah data baru  pada Transaksi BSI', '', 5, '2024-08-17 12:22:24', NULL),
(657, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions/add-save', 'Tambah data baru  pada Transaksi Nasabah', '', 5, '2024-08-17 12:28:06', NULL),
(658, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/pengumuman/add-save', 'Tambah data baru Tukar sampah pada Pengumuman', '', 5, '2024-08-17 12:30:46', NULL),
(659, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/pengumuman/edit-save/5', 'Memperbaharui data Tukar sampah pada Pengumuman', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>status</td><td>Pending</td><td>On Proses</td></tr></tbody></table>', 5, '2024-08-17 12:31:16', NULL),
(660, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'bsu1@gmail.com login dengan IP Address 127.0.0.1', '', 5, '2024-08-17 12:32:11', NULL),
(661, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', 'bsu1@gmail.com keluar', '', 5, '2024-08-17 12:33:49', NULL),
(662, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'admin@crudbooster.com login dengan IP Address 127.0.0.1', '', 1, '2024-08-17 12:34:00', NULL),
(663, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/users/add-save', 'Tambah data baru BSU RW 6 pada Users Management', '', 1, '2024-08-17 12:36:09', NULL),
(664, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', 'admin@crudbooster.com keluar', '', 1, '2024-08-17 12:36:17', NULL),
(665, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'bsu6@gmail.com login dengan IP Address 127.0.0.1', '', 9, '2024-08-17 12:36:27', NULL),
(666, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', 'bsu6@gmail.com keluar', '', 9, '2024-08-17 13:20:03', NULL),
(667, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'admin@crudbooster.com login dengan IP Address 127.0.0.1', '', 1, '2024-08-17 13:20:15', NULL),
(668, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/users/add-save', 'Tambah data baru admin pada Users Management', '', 1, '2024-08-17 13:21:14', NULL),
(669, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', 'admin@crudbooster.com keluar', '', 1, '2024-08-17 13:22:09', NULL),
(670, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'admin_bankimam@gmail.com login dengan IP Address 127.0.0.1', '', 10, '2024-08-17 14:52:34', NULL),
(671, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', 'admin_bankimam@gmail.com keluar', '', 10, '2024-08-17 14:52:46', NULL),
(672, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'admin@crudbooster.com login dengan IP Address 127.0.0.1', '', 1, '2024-08-17 14:56:50', NULL),
(673, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/edit-save/43', 'Memperbaharui data Transaksi pada Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>sorting</td><td>5</td><td></td></tr></tbody></table>', 1, '2024-08-17 14:57:16', NULL),
(674, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/edit-save/31', 'Memperbaharui data Transaksi Nasabah pada Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>parent_id</td><td>43</td><td></td></tr></tbody></table>', 1, '2024-08-17 14:57:23', NULL),
(675, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/edit-save/42', 'Memperbaharui data Transaksi BSI pada Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>parent_id</td><td>43</td><td></td></tr><tr><td>sorting</td><td>2</td><td></td></tr></tbody></table>', 1, '2024-08-17 14:57:35', NULL),
(676, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/edit-save/45', 'Memperbaharui data Dashboard  Admin pada Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>name</td><td>Dashboard super admin</td><td>Dashboard  Admin</td></tr><tr><td>parent_id</td><td>0</td><td></td></tr><tr><td>sorting</td><td></td><td></td></tr></tbody></table>', 1, '2024-08-17 14:57:55', NULL),
(677, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/edit-save/44', 'Memperbaharui data Tukar Rewards pada Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>sorting</td><td>6</td><td></td></tr></tbody></table>', 1, '2024-08-17 14:58:16', NULL),
(678, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/edit-save/33', 'Memperbaharui data Tukar Poin pada Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>parent_id</td><td>44</td><td></td></tr></tbody></table>', 1, '2024-08-17 14:58:23', NULL),
(679, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/edit-save/37', 'Memperbaharui data Tukar Saldo pada Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>parent_id</td><td>44</td><td></td></tr><tr><td>sorting</td><td>2</td><td></td></tr></tbody></table>', 1, '2024-08-17 14:58:30', NULL),
(680, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/edit-save/32', 'Memperbaharui data Poin pada Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>sorting</td><td>7</td><td></td></tr></tbody></table>', 1, '2024-08-17 14:58:39', NULL),
(681, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/edit-save/36', 'Memperbaharui data Saldo pada Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>sorting</td><td>8</td><td></td></tr></tbody></table>', 1, '2024-08-17 14:58:46', NULL),
(682, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/edit-save/35', 'Memperbaharui data Konten Edukasi pada Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>sorting</td><td>9</td><td></td></tr></tbody></table>', 1, '2024-08-17 14:58:53', NULL),
(683, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/edit-save/30', 'Memperbaharui data Nasabah pada Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>sorting</td><td>10</td><td></td></tr></tbody></table>', 1, '2024-08-17 14:59:01', NULL),
(684, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/edit-save/40', 'Memperbaharui data Pengumuman pada Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>sorting</td><td>11</td><td></td></tr></tbody></table>', 1, '2024-08-17 14:59:13', NULL),
(685, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/edit-save/36', 'Memperbaharui data Saldo pada Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>sorting</td><td>8</td><td></td></tr></tbody></table>', 1, '2024-08-17 14:59:24', NULL),
(686, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/menu_management/edit-save/36', 'Memperbaharui data Saldo pada Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>sorting</td><td>8</td><td></td></tr></tbody></table>', 1, '2024-08-17 14:59:32', NULL),
(687, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', 'admin@crudbooster.com keluar', '', 1, '2024-08-17 14:59:59', NULL),
(688, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'admin_bankimam@gmail.com login dengan IP Address 127.0.0.1', '', 10, '2024-08-17 15:00:12', NULL),
(689, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', 'admin_bankimam@gmail.com keluar', '', 10, '2024-08-17 15:01:09', NULL),
(690, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'admin@crudbooster.com login dengan IP Address 127.0.0.1', '', 1, '2024-08-17 15:01:20', NULL),
(691, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', 'admin@crudbooster.com keluar', '', 1, '2024-08-17 15:08:03', NULL),
(692, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'bsu1@gmail.com login dengan IP Address 127.0.0.1', '', 5, '2024-08-17 15:08:15', NULL),
(693, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', 'bsu1@gmail.com keluar', '', 5, '2024-08-17 15:08:55', NULL),
(694, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'admin@crudbooster.com login dengan IP Address 127.0.0.1', '', 1, '2024-08-17 15:09:08', NULL),
(695, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', 'admin@crudbooster.com keluar', '', 1, '2024-08-17 15:11:02', NULL),
(696, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'admin_bankimam@gmail.com login dengan IP Address 127.0.0.1', '', 10, '2024-08-17 15:11:21', NULL),
(697, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', 'admin_bankimam@gmail.com keluar', '', 10, '2024-08-17 15:19:43', NULL),
(698, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'admin@crudbooster.com login dengan IP Address 127.0.0.1', '', 1, '2024-08-17 15:22:57', NULL),
(699, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'bsu1@gmail.com login dengan IP Address 127.0.0.1', '', 5, '2024-08-18 07:04:39', NULL),
(700, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', 'bsu1@gmail.com keluar', '', 5, '2024-08-18 07:04:51', NULL),
(701, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', ' keluar', '', NULL, '2024-08-18 07:04:51', NULL),
(702, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'bsu6@gmail.com login dengan IP Address 127.0.0.1', '', 9, '2024-08-18 07:05:00', NULL),
(703, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/sampah_categories/add-save', 'Tambah data baru Plastik pada Kategori Sampah', '', 9, '2024-08-18 07:09:43', NULL),
(704, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/sampah_categories/add-save', 'Tambah data baru Kertas pada Kategori Sampah', '', 9, '2024-08-18 07:10:03', NULL),
(705, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/sampah/add-save', 'Tambah data baru Botol Plastik pada Sampah', '', 9, '2024-08-18 07:10:35', NULL),
(706, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/sampah/add-save', 'Tambah data baru Koran Bekas pada Sampah', '', 9, '2024-08-18 07:11:06', NULL),
(707, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions/add-save', 'Tambah data baru  pada Transaksi Nasabah', '', 9, '2024-08-18 07:13:34', NULL),
(708, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions/add-save', 'Tambah data baru  pada Transaksi Nasabah', '', 9, '2024-08-18 07:14:27', NULL),
(709, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/pengumuman/add-save', 'Tambah data baru Penukaran Sampah periode 1 pada Pengumuman', '', 9, '2024-08-18 07:16:27', NULL),
(710, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/pengumuman/edit-save/6', 'Memperbaharui data Penukaran Sampah periode 1 pada Pengumuman', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>status</td><td>Pending</td><td>On Proses</td></tr></tbody></table>', 9, '2024-08-18 07:16:41', NULL),
(711, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/rewards/add-save', 'Tambah data baru Uang Cash pada Rewards', '', 9, '2024-08-18 07:17:59', NULL),
(712, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/rewards/add-save', 'Tambah data baru Vas Bunga pada Rewards', '', 9, '2024-08-18 07:20:08', NULL),
(713, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/tukar_poins/edit-save/34', 'Memperbaharui data  pada Tukar Poin', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>admin_id</td><td></td><td>9</td></tr><tr><td>status</td><td>Pending</td><td>On Proses</td></tr></tbody></table>', 9, '2024-08-18 07:21:36', NULL),
(714, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/tukar_poins/edit-save/34', 'Memperbaharui data  pada Tukar Poin', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>status</td><td>On Proses</td><td>Diterima</td></tr></tbody></table>', 9, '2024-08-18 07:22:11', NULL),
(715, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/rewards/edit-save/15', 'Memperbaharui data Vas Bunga pada Rewards', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>stock</td><td>2</td><td>0</td></tr></tbody></table>', 9, '2024-08-18 07:24:26', NULL),
(716, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/education/add-save', 'Tambah data baru  pada Konten Edukasi', '', 9, '2024-08-18 07:28:49', NULL),
(717, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions_bsi/add-save', 'Tambah data baru  pada Transaksi BSI', '', 9, '2024-08-18 07:37:51', NULL),
(718, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', 'bsu6@gmail.com keluar', '', 9, '2024-08-18 07:40:14', NULL),
(719, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'admin_bankimam@gmail.com login dengan IP Address 127.0.0.1', '', 10, '2024-08-18 07:40:29', NULL),
(720, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', 'admin_bankimam@gmail.com keluar', '', 10, '2024-08-18 07:43:07', NULL),
(721, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'bsu6@gmail.com login dengan IP Address 127.0.0.1', '', 9, '2024-08-18 07:43:17', NULL),
(722, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/transactions_bsi/add-save', 'Tambah data baru  pada Transaksi BSI', '', 9, '2024-08-18 07:43:41', NULL),
(723, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', 'bsu6@gmail.com keluar', '', 9, '2024-08-18 07:43:53', NULL),
(724, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'bsu1@gmail.com login dengan IP Address 127.0.0.1', '', 5, '2024-08-18 07:43:59', NULL),
(725, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/logout', 'bsu1@gmail.com keluar', '', 5, '2024-08-18 07:44:37', NULL),
(726, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'admin@crudbooster.com login dengan IP Address 127.0.0.1', '', 1, '2024-08-18 07:44:52', NULL),
(727, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin/login', 'bsu1@gmail.com login dengan IP Address 127.0.0.1', '', 5, '2024-08-18 09:17:08', NULL),
(728, '120.188.39.200', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/public/admin/login', 'bsu1@gmail.com login dengan IP Address 120.188.39.200', '', 5, '2024-08-18 16:50:09', NULL),
(729, '120.188.39.200', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/public/admin/login', 'bsu1@gmail.com login dengan IP Address 120.188.39.200', '', 5, '2024-08-18 16:52:04', NULL),
(730, '120.188.39.200', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/public/admin/logout', 'bsu1@gmail.com keluar', '', 5, '2024-08-18 17:29:44', NULL),
(731, '120.188.39.200', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/public/admin/login', 'admin@crudbooster.com login dengan IP Address 120.188.39.200', '', 1, '2024-08-18 17:29:56', NULL),
(732, '120.188.39.200', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/public/admin/logout', 'admin@crudbooster.com keluar', '', 1, '2024-08-18 17:38:30', NULL),
(733, '120.188.39.200', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/public/admin/login', 'bsu6@gmail.com login dengan IP Address 120.188.39.200', '', 9, '2024-08-18 17:38:41', NULL),
(734, '120.188.39.200', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Transaksi Nasabah', '', 9, '2024-08-18 17:39:20', NULL),
(735, '120.188.39.200', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/rewards/edit-save/15', 'Memperbaharui data Vas Bunga pada Rewards', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>stock</td><td>0</td><td>4</td></tr></tbody></table>', 9, '2024-08-18 17:40:07', NULL),
(736, '120.188.39.200', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/rewards/add-save', 'Tambah data baru Sapu pada Rewards', '', 9, '2024-08-18 17:40:36', NULL),
(737, '120.188.39.200', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/rewards/add-save', 'Tambah data baru Tempat Sampah pada Rewards', '', 9, '2024-08-18 17:42:00', NULL),
(738, '120.188.39.200', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/tukar_poins/edit-save/36', 'Memperbaharui data  pada Tukar Poin', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>admin_id</td><td></td><td>9</td></tr><tr><td>status</td><td>Pending</td><td>Diterima</td></tr></tbody></table>', 9, '2024-08-18 17:42:39', NULL),
(739, '120.188.39.200', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Transaksi Nasabah', '', 9, '2024-08-18 17:44:39', NULL),
(740, '120.188.39.200', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://www.bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 120.188.39.200', '', 5, '2024-08-18 18:30:09', NULL),
(741, '120.188.39.200', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://www.bangimam.com/admin/logout', 'bsu1@gmail.com keluar', '', 5, '2024-08-18 18:34:37', NULL),
(742, '120.188.39.200', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://www.bangimam.com/admin/login', 'admin_bankimam@gmail.com login dengan IP Address 120.188.39.200', '', 10, '2024-08-18 18:34:47', NULL),
(743, '120.188.39.200', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://www.bangimam.com/admin/logout', 'admin_bankimam@gmail.com keluar', '', 10, '2024-08-18 18:37:28', NULL),
(744, '120.188.39.200', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://www.bangimam.com/admin/login', 'admin@crudbooster.com login dengan IP Address 120.188.39.200', '', 1, '2024-08-18 18:37:38', NULL),
(745, '114.10.31.97', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://www.bangimam.com/admin/logout', 'admin@crudbooster.com keluar', '', 1, '2024-08-18 21:15:08', NULL),
(746, '114.10.31.97', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://www.bangimam.com/admin/login', 'admin_bankimam@gmail.com login dengan IP Address 114.10.31.97', '', 10, '2024-08-18 21:15:21', NULL),
(747, '114.4.213.11', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 114.4.213.11', '', 5, '2024-08-20 03:16:29', NULL),
(748, '114.4.213.11', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/public/admin/login', 'bsu1@gmail.com login dengan IP Address 114.4.213.11', '', 5, '2024-08-20 04:28:25', NULL),
(749, '114.4.213.11', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Transaksi Nasabah', '', 5, '2024-08-20 04:31:01', NULL),
(750, '114.4.213.11', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/public/admin/transactions/add-save', 'Tambah data baru  pada Transaksi Nasabah', '', 5, '2024-08-20 04:40:25', NULL),
(751, '114.4.213.11', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/public/admin/transactions/edit-save/32', 'Memperbaharui data  pada Transaksi Nasabah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>periode</td><td>agustus</td><td>agustus 24</td></tr></tbody></table>', 5, '2024-08-20 04:41:26', NULL),
(752, '114.4.213.11', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/public/admin/logout', 'bsu1@gmail.com keluar', '', 5, '2024-08-20 04:43:20', NULL),
(753, '114.4.213.11', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/public/admin/login', 'admin_bankimam@gmail.com login dengan IP Address 114.4.213.11', '', 10, '2024-08-20 04:43:35', NULL),
(754, '114.4.213.11', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/public/admin/logout', 'admin_bankimam@gmail.com keluar', '', 10, '2024-08-20 04:45:26', NULL),
(755, '114.4.213.11', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/public/admin/login', 'admin@crudbooster.com login dengan IP Address 114.4.213.11', '', 1, '2024-08-20 04:45:51', NULL),
(756, '114.4.213.11', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/public/admin/logout', 'admin@crudbooster.com keluar', '', 1, '2024-08-20 04:47:57', NULL),
(757, '114.4.213.239', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 114.4.213.239', '', 5, '2024-08-20 10:18:21', NULL),
(758, '114.4.213.239', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 114.4.213.239', '', 5, '2024-08-20 10:48:51', NULL),
(759, '114.4.213.239', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah_categories/add-save', 'Tambah data baru Besi pada Kategori Sampah', '', 5, '2024-08-20 10:49:11', NULL),
(760, '114.4.213.239', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru besi batangan pada Sampah', '', 5, '2024-08-20 10:50:10', NULL),
(761, '114.4.213.239', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/rewards/add-save', 'Tambah data baru Sapu pada Rewards', '', 5, '2024-08-20 10:51:48', NULL),
(762, '114.4.213.239', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Transaksi Nasabah', '', 5, '2024-08-20 10:54:02', NULL),
(763, '114.4.213.239', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Transaksi Nasabah', '', 5, '2024-08-20 10:55:18', NULL),
(764, '114.4.213.239', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/tukar_poins/edit-save/37', 'Memperbaharui data  pada Tukar Poin', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>admin_id</td><td></td><td>5</td></tr><tr><td>status</td><td>Pending</td><td>On Proses</td></tr></tbody></table>', 5, '2024-08-20 10:56:55', NULL),
(765, '114.4.213.239', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/tukar_poins/edit-save/37', 'Memperbaharui data  pada Tukar Poin', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>status</td><td>On Proses</td><td>Diterima</td></tr></tbody></table>', 5, '2024-08-20 10:57:38', NULL),
(766, '114.4.213.239', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions_bsi/add-save', 'Tambah data baru  pada Transaksi BSI', '', 5, '2024-08-20 10:59:33', NULL),
(767, '114.4.213.239', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/pengumuman/edit-save/5', 'Memperbaharui data Tukar sampah pada Pengumuman', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>deskripsi</td><td>Penukaran sampah akan dilaksanan pada 17 agustus 2024 s/d 24 agustus 2024 jam 08:00 - 12:00</td><td>Penukaran poin pada</td></tr><tr><td>status</td><td>On Proses</td><td>Pending</td></tr></tbody></table>', 5, '2024-08-20 11:03:52', NULL),
(768, '114.4.213.239', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/pengumuman/edit-save/5', 'Memperbaharui data Tukar sampah pada Pengumuman', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>status</td><td>Pending</td><td>On Proses</td></tr></tbody></table>', 5, '2024-08-20 11:04:15', NULL),
(769, '114.4.213.239', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'bsu1@gmail.com keluar', '', 5, '2024-08-20 11:06:24', NULL),
(770, '114.4.213.239', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'admin_bankimam@gmail.com login dengan IP Address 114.4.213.239', '', 10, '2024-08-20 11:06:54', NULL),
(771, '114.4.213.239', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'admin_bankimam@gmail.com keluar', '', 10, '2024-08-20 11:08:23', NULL),
(772, '114.4.213.239', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'admin@crudbooster.com login dengan IP Address 114.4.213.239', '', 1, '2024-08-20 11:08:38', NULL),
(773, '114.4.213.239', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'admin@crudbooster.com keluar', '', 1, '2024-08-20 11:11:05', NULL),
(774, '114.4.213.239', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 114.4.213.239', '', 5, '2024-08-20 11:11:25', NULL),
(775, '114.4.213.239', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 114.4.213.239', '', 5, '2024-08-20 11:41:30', NULL),
(776, '114.4.213.239', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 114.4.213.239', '', 5, '2024-08-20 11:55:21', NULL),
(777, '114.4.213.239', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Transaksi Nasabah', '', 5, '2024-08-20 11:56:22', NULL),
(778, '114.4.213.239', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/tukar_poins/edit-save/33', 'Memperbaharui data  pada Tukar Poin', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody></tbody></table>', 5, '2024-08-20 12:26:45', NULL),
(779, '114.4.213.239', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/tukar_poins/edit-save/33', 'Memperbaharui data  pada Tukar Poin', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>bukti_foto</td><td></td><td>uploads/5/2024-08/pot_gemoy.png</td></tr><tr><td>status</td><td>Pending</td><td>On Proses</td></tr></tbody></table>', 5, '2024-08-20 12:27:02', NULL),
(780, '114.4.213.239', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/tukar_saldo/edit-save/10', 'Memperbaharui data  pada Tukar Saldo', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>bukti_foto</td><td></td><td>uploads/5/2024-08/uang.jpeg</td></tr></tbody></table>', 5, '2024-08-20 12:28:46', NULL),
(781, '114.4.213.239', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'bsu1@gmail.com keluar', '', 5, '2024-08-20 12:30:43', NULL),
(782, '114.4.213.239', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'admin@crudbooster.com login dengan IP Address 114.4.213.239', '', 1, '2024-08-20 12:30:55', NULL),
(783, '114.4.213.239', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/menu_management/add-save', 'Tambah data baru User Management pada Menu Management', '', 1, '2024-08-20 12:46:20', NULL),
(784, '114.4.213.239', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/menu_management/add-save', 'Tambah data baru Tambah Pengguna pada Menu Management', '', 1, '2024-08-20 12:47:22', NULL),
(785, '114.4.213.239', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/menu_management/add-save', 'Tambah data baru Daftar Pengguna pada Menu Management', '', 1, '2024-08-20 12:49:01', NULL),
(786, '114.4.213.239', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'admin@crudbooster.com keluar', '', 1, '2024-08-20 12:49:21', NULL),
(787, '114.4.213.239', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'admin_bankimam@gmail.com login dengan IP Address 114.4.213.239', '', 10, '2024-08-20 12:49:31', NULL),
(788, '114.4.213.239', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/users/add-save', 'Tambah data baru BSU-7 pada Users Management', '', 10, '2024-08-20 12:50:38', NULL),
(789, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'admin_bankimam@gmail.com keluar', '', 10, '2024-08-20 13:52:22', NULL),
(790, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 103.164.223.186', '', 5, '2024-08-20 13:52:28', NULL),
(791, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Transaksi Nasabah', '', 5, '2024-08-20 13:53:12', NULL),
(792, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/tukar_saldo/edit-save/13', 'Memperbaharui data  pada Tukar Saldo', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>admin_id</td><td></td><td>5</td></tr><tr><td>bukti_foto</td><td></td><td>uploads/5/2024-08/kerajinan.jpg</td></tr><tr><td>status</td><td>Pending</td><td>On Proses</td></tr></tbody></table>', 5, '2024-08-20 13:57:11', NULL),
(793, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/tukar_saldo/edit-save/13', 'Memperbaharui data  pada Tukar Saldo', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>status</td><td>On Proses</td><td>Diterima</td></tr></tbody></table>', 5, '2024-08-20 13:58:30', NULL),
(794, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/pengumuman/add-save', 'Tambah data baru Proklamator pada Pengumuman', '', 5, '2024-08-20 14:16:56', NULL),
(795, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/pengumuman/edit-save/7', 'Memperbaharui data Proklamator pada Pengumuman', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody></tbody></table>', 5, '2024-08-20 14:17:51', NULL),
(796, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/pengumuman/edit-save/5', 'Memperbaharui data Tukar sampah pada Pengumuman', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>status</td><td>On Proses</td><td>Pending</td></tr></tbody></table>', 5, '2024-08-20 14:20:16', NULL),
(797, '2001:448a:20b1:7ff5:e555:1be8:862b:7294', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'admin@crudbooster.com login dengan IP Address 2001:448a:20b1:7ff5:e555:1be8:862b:7294', '', 1, '2024-08-20 22:32:15', NULL),
(798, '2001:448a:20b1:7ff5:e555:1be8:862b:7294', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/pengumuman/edit-save/7', 'Memperbaharui data Proklamator pada Pengumuman', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>admin_id</td><td>5</td><td>1</td></tr><tr><td>status</td><td>On Proses</td><td>Pending</td></tr></tbody></table>', 1, '2024-08-20 22:32:41', NULL),
(799, '2001:448a:20b1:7ff5:e555:1be8:862b:7294', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/pengumuman/edit-save/6', 'Memperbaharui data Penukaran Sampah periode 1 pada Pengumuman', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>admin_id</td><td>9</td><td>1</td></tr></tbody></table>', 1, '2024-08-20 22:32:58', NULL),
(800, '2001:448a:20b1:7ff5:e555:1be8:862b:7294', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/pengumuman/edit-save/6', 'Memperbaharui data Penukaran Sampah periode 1 pada Pengumuman', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>status</td><td>On Proses</td><td>Selesai</td></tr></tbody></table>', 1, '2024-08-20 22:33:20', NULL),
(801, '2001:448a:20b1:7ff5:e555:1be8:862b:7294', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/pengumuman/edit-save/6', 'Memperbaharui data Penukaran Sampah periode 1 pada Pengumuman', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>status</td><td>Selesai</td><td>On Proses</td></tr></tbody></table>', 1, '2024-08-20 22:33:34', NULL),
(802, '114.10.28.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 114.10.28.71', '', 5, '2024-08-20 22:41:19', NULL),
(803, '114.10.28.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'bsu1@gmail.com keluar', '', 5, '2024-08-20 22:41:50', NULL),
(804, '114.10.28.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'admin_bankimam@gmail.com login dengan IP Address 114.10.28.71', '', 10, '2024-08-20 22:42:13', NULL),
(805, '114.10.28.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'admin_bankimam@gmail.com keluar', '', 10, '2024-08-20 22:43:57', NULL),
(806, '114.10.28.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'admin@crudbooster.com login dengan IP Address 114.10.28.71', '', 1, '2024-08-20 22:44:03', NULL);
INSERT INTO `cms_logs` (`id`, `ipaddress`, `useragent`, `url`, `description`, `details`, `id_cms_users`, `created_at`, `updated_at`) VALUES
(807, '114.10.28.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'admin@crudbooster.com keluar', '', 1, '2024-08-20 22:44:19', NULL),
(808, '114.10.28.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'admin_bankimam@gmail.com login dengan IP Address 114.10.28.71', '', 10, '2024-08-20 22:44:25', NULL),
(809, '114.10.28.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'admin_bankimam@gmail.com keluar', '', 10, '2024-08-20 22:47:55', NULL),
(810, '114.10.28.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 114.10.28.71', '', 5, '2024-08-20 22:48:04', NULL),
(811, '114.10.28.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions_bsi/delete/14', 'Menghapus data 14 pada Transaksi BSI', '', 5, '2024-08-20 22:48:26', NULL),
(812, '114.10.28.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions_bsi/delete/17', 'Menghapus data 17 pada Transaksi BSI', '', 5, '2024-08-20 22:48:29', NULL),
(813, '114.10.28.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions_bsi/delete/12', 'Menghapus data 12 pada Transaksi BSI', '', 5, '2024-08-20 22:48:31', NULL),
(814, '114.10.28.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions_bsi/delete/10', 'Menghapus data 10 pada Transaksi BSI', '', 5, '2024-08-20 22:48:34', NULL),
(815, '2001:448a:20b1:7ff5:e555:1be8:862b:7294', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'admin@crudbooster.com login dengan IP Address 2001:448a:20b1:7ff5:e555:1be8:862b:7294', '', 1, '2024-08-20 22:55:23', NULL),
(816, '2001:448a:20b1:7ff5:e555:1be8:862b:7294', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://www.bangimam.com/admin/login', 'admin@crudbooster.com login dengan IP Address 2001:448a:20b1:7ff5:e555:1be8:862b:7294', '', 1, '2024-08-20 22:55:51', NULL),
(817, '2001:448a:20b1:7ff5:e555:1be8:862b:7294', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://www.bangimam.com/admin/logout', 'admin@crudbooster.com keluar', '', 1, '2024-08-20 23:05:54', NULL),
(818, '2001:448a:20b1:7ff5:e555:1be8:862b:7294', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://www.bangimam.com/admin/login', 'admin_bankimam@gmail.com login dengan IP Address 2001:448a:20b1:7ff5:e555:1be8:862b:7294', '', 10, '2024-08-20 23:06:00', NULL),
(819, '114.4.212.243', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 114.4.212.243', '', 5, '2024-08-21 16:07:27', NULL),
(820, '114.4.212.243', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'bsu1@gmail.com keluar', '', 5, '2024-08-21 17:43:30', NULL),
(821, '114.4.212.243', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'admin@crudbooster.com login dengan IP Address 114.4.212.243', '', 1, '2024-08-21 17:43:36', NULL),
(822, '114.4.212.243', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'admin@crudbooster.com keluar', '', 1, '2024-08-21 18:07:45', NULL),
(823, '114.4.212.243', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'admin@crudbooster.com login dengan IP Address 114.4.212.243', '', 1, '2024-08-21 18:07:47', NULL),
(824, '114.4.212.243', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/delete/34', 'Menghapus data 34 pada Transaksi Nasabah', '', 1, '2024-08-21 18:07:57', NULL),
(825, '114.4.212.243', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'admin@crudbooster.com login dengan IP Address 114.4.212.243', '', 1, '2024-08-21 18:08:25', NULL),
(826, '114.4.212.243', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/public/admin/login', 'admin@crudbooster.com login dengan IP Address 114.4.212.243', '', 1, '2024-08-21 19:44:42', NULL),
(827, '114.4.212.243', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/public/admin/logout', 'admin@crudbooster.com keluar', '', 1, '2024-08-21 20:01:37', NULL),
(828, '114.4.212.243', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/public/admin/login', 'admin_bankimam@gmail.com login dengan IP Address 114.4.212.243', '', 10, '2024-08-21 20:01:44', NULL),
(829, '114.4.212.243', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'admin_bankimam@gmail.com keluar', '', 10, '2024-08-21 20:03:24', NULL),
(830, '114.4.212.243', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'admin@crudbooster.com login dengan IP Address 114.4.212.243', '', 1, '2024-08-21 20:03:36', NULL),
(831, '114.4.212.243', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/statistic_builder/edit-save/2', 'Memperbaharui data Dashboard admin pada Statistic Builder', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>name</td><td>Dashboard super admin</td><td>Dashboard admin</td></tr><tr><td>slug</td><td>dashboard-super-admin</td><td></td></tr></tbody></table>', 1, '2024-08-21 20:04:18', NULL),
(832, '114.4.212.243', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/menu_management/edit-save/46', 'Memperbaharui data Manajemen Pengguna pada Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>name</td><td>User Management</td><td>Manajemen Pengguna</td></tr><tr><td>sorting</td><td>13</td><td></td></tr></tbody></table>', 1, '2024-08-21 20:04:34', NULL),
(833, '114.4.212.243', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/menu_management/edit-save/46', 'Memperbaharui data Manajemen Pengguna pada Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>icon</td><td>fa fa-bars</td><td>fa fa-users</td></tr><tr><td>sorting</td><td>13</td><td></td></tr></tbody></table>', 1, '2024-08-21 20:06:12', NULL),
(834, '114.4.212.243', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'admin@crudbooster.com keluar', '', 1, '2024-08-21 20:06:19', NULL),
(835, '114.4.212.243', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'admin_bankimam@gmail.com login dengan IP Address 114.4.212.243', '', 10, '2024-08-21 20:06:27', NULL),
(836, '114.4.212.243', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'admin_bankimam@gmail.com keluar', '', 10, '2024-08-21 20:06:53', NULL),
(837, '114.4.212.243', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'admin@crudbooster.com login dengan IP Address 114.4.212.243', '', 1, '2024-08-21 20:06:58', NULL),
(838, '114.10.66.73', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions_bsi/delete/13', 'Menghapus data 13 pada Transaksi BSI', '', 1, '2024-08-21 20:14:26', NULL),
(839, '2001:448a:20b1:7ff5:e555:1be8:862b:7294', 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/15.0.0 Mobile/15A5370a Safari/602.1', 'https://bangimam.com/admin/login', 'admin_bankimam@gmail.com login dengan IP Address 2001:448a:20b1:7ff5:e555:1be8:862b:7294', '', 10, '2024-08-21 22:05:07', NULL),
(840, '2001:448a:20b1:7ff5:e555:1be8:862b:7294', 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/15.0.0 Mobile/15A5370a Safari/602.1', 'https://bangimam.com/admin/logout', 'admin_bankimam@gmail.com keluar', '', 10, '2024-08-21 22:06:02', NULL),
(841, '2001:448a:20b1:7ff5:e555:1be8:862b:7294', 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/15.0.0 Mobile/15A5370a Safari/602.1', 'https://bangimam.com/admin/login', 'admin_bankimam@gmail.com login dengan IP Address 2001:448a:20b1:7ff5:e555:1be8:862b:7294', '', 10, '2024-08-21 22:06:34', NULL),
(842, '2001:448a:20b1:7ff5:e555:1be8:862b:7294', 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/15.0.0 Mobile/15A5370a Safari/602.1', 'https://bangimam.com/admin/logout', 'admin_bankimam@gmail.com keluar', '', 10, '2024-08-21 22:08:59', NULL),
(843, '2001:448a:20b1:7ff5:e555:1be8:862b:7294', 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/15.0.0 Mobile/15A5370a Safari/602.1', 'https://bangimam.com/admin/login', 'admin_bankimam@gmail.com login dengan IP Address 2001:448a:20b1:7ff5:e555:1be8:862b:7294', '', 10, '2024-08-21 22:11:39', NULL),
(844, '114.10.115.216', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/public/admin/login', 'bsu1@gmail.com login dengan IP Address 114.10.115.216', '', 5, '2024-08-22 15:10:36', NULL),
(845, '114.10.115.216', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/public/admin/login', 'bsu1@gmail.com login dengan IP Address 114.10.115.216', '', 5, '2024-08-22 15:13:05', NULL),
(846, '114.10.112.41', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/public/admin/login', 'bsu1@gmail.com login dengan IP Address 114.10.112.41', '', 5, '2024-08-22 22:01:54', NULL),
(847, '114.10.112.41', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/public/admin/login', 'bsu1@gmail.com login dengan IP Address 114.10.112.41', '', 5, '2024-08-22 22:16:08', NULL),
(848, '114.10.112.41', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/public/admin/login', 'bsu1@gmail.com login dengan IP Address 114.10.112.41', '', 5, '2024-08-22 22:18:41', NULL),
(849, '114.10.112.41', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/public/admin/login', 'bsu1@gmail.com login dengan IP Address 114.10.112.41', '', 5, '2024-08-22 22:20:51', NULL),
(850, '114.10.112.41', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/public/admin/sampah/delete/16', 'Menghapus data besi batangan pada Sampah', '', 5, '2024-08-22 22:29:37', NULL),
(851, '114.10.112.41', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/public/admin/sampah_categories/delete/12', 'Menghapus data Besi pada Kategori Sampah', '', 5, '2024-08-22 22:29:48', NULL),
(852, '114.10.112.41', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/public/admin/logout', 'bsu1@gmail.com keluar', '', 5, '2024-08-22 22:55:13', NULL),
(853, '114.10.112.41', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/public/admin/login', 'bsu1@gmail.com login dengan IP Address 114.10.112.41', '', 5, '2024-08-22 22:55:16', NULL),
(854, '114.10.112.41', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/public/admin/login', 'bsu1@gmail.com login dengan IP Address 114.10.112.41', '', 5, '2024-08-22 22:56:34', NULL),
(855, '114.10.112.41', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/public/admin/logout', 'bsu1@gmail.com keluar', '', 5, '2024-08-22 23:01:54', NULL),
(856, '114.10.112.41', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/public/admin/login', 'bsu1@gmail.com login dengan IP Address 114.10.112.41', '', 5, '2024-08-22 23:03:36', NULL),
(857, '128.1.172.89', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/public/admin/login', 'bsu1@gmail.com login dengan IP Address 128.1.172.89', '', 5, '2024-08-23 10:42:31', NULL),
(858, '128.1.172.89', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/public/admin/login', 'bsu1@gmail.com login dengan IP Address 128.1.172.89', '', 5, '2024-08-23 10:42:32', NULL),
(859, '128.1.172.89', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/public/admin/logout', 'bsu1@gmail.com keluar', '', 5, '2024-08-23 10:43:13', NULL),
(860, '114.10.30.23', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/public/admin/login', 'bsu1@gmail.com login dengan IP Address 114.10.30.23', '', 5, '2024-08-23 14:34:09', NULL),
(861, '114.10.30.23', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/public/admin/rewards/add-save', 'Tambah data baru Sayur Hidroponik pada Rewards', '', 5, '2024-08-23 14:42:41', NULL),
(862, '114.10.30.23', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 114.10.30.23', '', 5, '2024-08-23 14:43:24', NULL),
(863, '114.10.30.23', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/rewards/add-save', 'Tambah data baru Tempat Sampah pada Rewards', '', 5, '2024-08-23 14:44:12', NULL),
(864, '114.10.30.23', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'bsu1@gmail.com keluar', '', 5, '2024-08-23 14:44:28', NULL),
(865, '114.10.30.23', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu2@gmail.com login dengan IP Address 114.10.30.23', '', 6, '2024-08-23 14:44:32', NULL),
(866, '114.10.30.23', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/rewards/add-save', 'Tambah data baru Tempat Sampah pada Rewards', '', 6, '2024-08-23 14:45:12', NULL),
(867, '114.10.30.23', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/rewards/add-save', 'Tambah data baru Sapu pada Rewards', '', 6, '2024-08-23 14:45:52', NULL),
(868, '114.10.30.23', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Koran Bekas pada Sampah', '', 6, '2024-08-23 14:46:48', NULL),
(869, '114.10.30.23', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/public/admin/logout', ' keluar', '', NULL, '2024-08-23 14:47:04', NULL),
(870, '114.10.30.23', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/public/admin/login', 'bsu1@gmail.com login dengan IP Address 114.10.30.23', '', 5, '2024-08-23 14:47:06', NULL),
(871, '114.10.30.23', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/public/admin/logout', 'bsu1@gmail.com keluar', '', 5, '2024-08-23 14:47:12', NULL),
(872, '114.10.30.23', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/public/admin/login', 'bsu2@gmail.com login dengan IP Address 114.10.30.23', '', 6, '2024-08-23 14:47:29', NULL),
(873, '114.10.30.23', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/public/admin/rewards/add-save', 'Tambah data baru Sayur Hidroponik pada Rewards', '', 6, '2024-08-23 14:48:37', NULL),
(874, '112.215.251.38', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Mobile Safari/537.36', 'https://www.bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 112.215.251.38', '', 5, '2024-08-23 15:26:29', NULL),
(875, '114.4.79.99', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'admin_bankimam@gmail.com login dengan IP Address 114.4.79.99', '', 10, '2024-08-27 19:57:46', NULL),
(876, '114.4.79.99', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'admin_bankimam@gmail.com keluar', '', 10, '2024-08-27 19:58:45', NULL),
(877, '114.10.113.88', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/public/admin/login', 'admin_bankimam@gmail.com login dengan IP Address 114.10.113.88', '', 10, '2024-08-29 16:08:09', NULL),
(878, '114.10.113.88', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'admin_bankimam@gmail.com keluar', '', 10, '2024-08-29 16:09:41', NULL),
(879, '114.10.113.88', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'admin@crudbooster.com login dengan IP Address 114.10.113.88', '', 1, '2024-08-29 16:09:53', NULL),
(880, '114.10.30.132', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/public/admin/login', 'bsu1@gmail.com login dengan IP Address 114.10.30.132', '', 5, '2024-08-30 21:46:38', NULL),
(881, '180.178.96.42', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/public/admin/login', 'bsu1@gmail.com login dengan IP Address 180.178.96.42', '', 5, '2024-09-02 14:00:09', NULL),
(882, '180.178.96.42', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/public/admin/login', 'bsu1@gmail.com login dengan IP Address 180.178.96.42', '', 5, '2024-09-02 14:07:05', NULL),
(883, '180.178.96.42', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/public/admin/logout', 'bsu1@gmail.com keluar', '', 5, '2024-09-02 14:23:24', NULL),
(884, '110.50.81.197', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'https://bangimam.com/public/admin/logout', ' keluar', '', NULL, '2024-09-02 14:23:26', NULL),
(885, '180.178.96.42', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/public/admin/login', 'admin_bankimam@gmail.com login dengan IP Address 180.178.96.42', '', 10, '2024-09-02 14:23:30', NULL),
(886, '180.178.96.42', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/public/admin/transactions_bsi/add-save', 'Tambah data baru  pada Transaksi BSI', '', 5, '2024-09-02 14:35:07', NULL),
(887, '180.178.96.42', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/public/admin/transactions_bsi/add-save', 'Tambah data baru  pada Transaksi BSI', '', 5, '2024-09-02 14:53:07', NULL),
(888, '120.188.7.44', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/public/admin/login', 'bsu1@gmail.com login dengan IP Address 120.188.7.44', '', 5, '2024-09-02 20:18:32', NULL),
(889, '120.188.64.50', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/public/admin/login', 'bsu1@gmail.com login dengan IP Address 120.188.64.50', '', 5, '2024-09-02 23:38:57', NULL),
(890, '114.10.31.245', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/public/admin/login', 'bsu1@gmail.com login dengan IP Address 114.10.31.245', '', 5, '2024-09-03 03:59:57', NULL),
(891, '114.10.31.245', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/public/admin/transactions_bsi/edit-save/19', 'Memperbaharui data  pada Transaksi BSI', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>sampah_id</td><td></td><td>6</td></tr><tr><td>harga_per_kg</td><td></td><td>4000</td></tr><tr><td>total_price</td><td>7000</td><td></td></tr><tr><td>profit</td><td>-8015</td><td></td></tr></tbody></table>', 5, '2024-09-03 04:04:20', NULL),
(892, '114.10.31.245', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/public/admin/transactions_bsi/edit-save/19', 'Memperbaharui data  pada Transaksi BSI', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>total_weight</td><td>90</td><td>3</td></tr><tr><td>total_price</td><td>360000</td><td></td></tr><tr><td>profit</td><td>344985</td><td></td></tr></tbody></table>', 5, '2024-09-03 04:04:37', NULL),
(893, '114.10.31.245', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/public/admin/transactions_bsi/edit-save/18', 'Memperbaharui data  pada Transaksi BSI', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>sampah_id</td><td></td><td>8</td></tr><tr><td>total_weight</td><td>138</td><td>20</td></tr><tr><td>harga_per_kg</td><td></td><td>4500</td></tr><tr><td>total_price</td><td>323500</td><td></td></tr><tr><td>profit</td><td>308485</td><td></td></tr></tbody></table>', 5, '2024-09-03 04:05:01', NULL),
(894, '114.10.31.245', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/public/admin/transactions_bsi/edit-save/19', 'Memperbaharui data  pada Transaksi BSI', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>total_price</td><td>12000</td><td></td></tr><tr><td>profit</td><td>-3015</td><td></td></tr></tbody></table>', 5, '2024-09-03 04:07:47', NULL),
(895, '114.10.31.245', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/public/admin/login', 'bsu1@gmail.com login dengan IP Address 114.10.31.245', '', 5, '2024-09-03 04:15:56', NULL),
(896, '114.10.31.245', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/public/admin/transactions/add-save', 'Tambah data baru  pada Transaksi Nasabah', '', 5, '2024-09-03 04:39:37', NULL),
(897, '114.10.31.245', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/public/admin/transactions/add-save', 'Tambah data baru  pada Transaksi Nasabah', '', 5, '2024-09-03 04:40:00', NULL),
(898, '114.10.31.245', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/public/admin/transactions/add-save', 'Tambah data baru  pada Transaksi Nasabah', '', 5, '2024-09-03 04:40:26', NULL),
(899, '114.10.31.245', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/public/admin/transactions/add-save', 'Tambah data baru  pada Transaksi Nasabah', '', 5, '2024-09-03 04:41:52', NULL),
(900, '114.10.31.245', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/public/admin/transactions_bsi/add-save', 'Tambah data baru  pada Transaksi BSI', '', 5, '2024-09-03 04:42:59', NULL),
(901, '114.10.31.245', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/public/admin/logout', 'bsu1@gmail.com keluar', '', 5, '2024-09-03 04:43:53', NULL),
(902, '114.10.31.245', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/public/admin/login', 'admin@crudbooster.com login dengan IP Address 114.10.31.245', '', 1, '2024-09-03 04:43:59', NULL),
(903, '114.10.31.245', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/public/admin/logout', 'admin@crudbooster.com keluar', '', 1, '2024-09-03 04:44:15', NULL),
(904, '114.10.31.245', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/public/admin/login', 'admin_bankimam@gmail.com login dengan IP Address 114.10.31.245', '', 10, '2024-09-03 04:44:20', NULL),
(905, '114.10.31.245', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'admin_bankimam@gmail.com keluar', '', 10, '2024-09-03 04:48:14', NULL),
(906, '114.10.31.245', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'admin@crudbooster.com login dengan IP Address 114.10.31.245', '', 1, '2024-09-03 04:48:19', NULL),
(907, '114.10.31.245', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'admin@crudbooster.com keluar', '', 1, '2024-09-03 04:48:57', NULL),
(908, '114.10.31.245', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu2@gmail.com login dengan IP Address 114.10.31.245', '', 6, '2024-09-03 04:49:08', NULL),
(909, '114.10.31.245', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Transaksi Nasabah', '', 6, '2024-09-03 04:49:31', NULL),
(910, '114.10.31.245', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Transaksi Nasabah', '', 6, '2024-09-03 04:49:49', NULL),
(911, '114.10.31.245', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Transaksi Nasabah', '', 6, '2024-09-03 04:50:10', NULL),
(912, '114.10.31.245', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/delete/43', 'Menghapus data 43 pada Transaksi Nasabah', '', 6, '2024-09-03 04:51:38', NULL),
(913, '114.10.31.245', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/delete/42', 'Menghapus data 42 pada Transaksi Nasabah', '', 6, '2024-09-03 04:51:41', NULL),
(914, '114.10.31.245', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/delete/41', 'Menghapus data 41 pada Transaksi Nasabah', '', 6, '2024-09-03 04:51:42', NULL),
(915, '114.10.31.245', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'bsu2@gmail.com keluar', '', 6, '2024-09-03 04:55:02', NULL),
(916, '114.10.31.245', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 114.10.31.245', '', 5, '2024-09-03 04:55:09', NULL),
(917, '114.10.31.245', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'bsu1@gmail.com keluar', '', 5, '2024-09-03 04:55:18', NULL),
(918, '114.10.31.245', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu2@gmail.com login dengan IP Address 114.10.31.245', '', 6, '2024-09-03 04:55:21', NULL),
(919, '114.10.31.245', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Transaksi Nasabah', '', 6, '2024-09-03 04:55:37', NULL),
(920, '114.10.31.245', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Transaksi Nasabah', '', 6, '2024-09-03 04:55:56', NULL),
(921, '114.10.31.245', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Transaksi Nasabah', '', 6, '2024-09-03 04:56:12', NULL),
(922, '114.10.31.245', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions_bsi/add-save', 'Tambah data baru  pada Transaksi BSI', '', 6, '2024-09-03 04:56:56', NULL),
(923, '114.10.31.245', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions_bsi/add-save', 'Tambah data baru  pada Transaksi BSI', '', 6, '2024-09-03 04:57:24', NULL),
(924, '114.10.31.245', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'bsu2@gmail.com keluar', '', 6, '2024-09-03 05:00:10', NULL),
(925, '114.10.31.245', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 114.10.31.245', '', 5, '2024-09-03 05:00:13', NULL),
(926, '120.188.37.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/public/admin/login', 'bsu1@gmail.com login dengan IP Address 120.188.37.8', '', 5, '2024-09-03 12:45:45', NULL),
(927, '120.188.37.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/public/admin/transactions/add-save', 'Tambah data baru  pada Transaksi Nasabah', '', 5, '2024-09-03 12:47:29', NULL),
(928, '120.188.37.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 120.188.37.8', '', 5, '2024-09-03 13:08:03', NULL),
(929, '120.188.37.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'bsu1@gmail.com keluar', '', 5, '2024-09-03 13:08:07', NULL),
(930, '120.188.37.8', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 120.188.37.8', '', 5, '2024-09-03 13:08:50', NULL),
(931, '120.188.37.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu2@gmail.com login dengan IP Address 120.188.37.8', '', 6, '2024-09-03 13:14:47', NULL),
(932, '120.188.37.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 120.188.37.8', '', 5, '2024-09-03 14:33:54', NULL),
(933, '120.188.37.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions_bsi/add-save', 'Tambah data baru  pada Transaksi BSI', '', 5, '2024-09-03 14:36:40', NULL),
(934, '120.188.37.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 120.188.37.8', '', 5, '2024-09-03 14:41:21', NULL),
(935, '120.188.37.8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 120.188.37.8', '', 5, '2024-09-03 14:44:22', NULL),
(936, '114.10.30.117', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/tukar_poins/edit-save/40', 'Memperbaharui data  pada Tukar Poin', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>status</td><td>Pending</td><td>On Proses</td></tr></tbody></table>', 5, '2024-09-03 19:03:46', NULL),
(937, '114.10.30.117', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 114.10.30.117', '', 5, '2024-09-03 19:13:39', NULL),
(938, '114.10.30.117', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/tukar_poins/edit-save/40', 'Memperbaharui data  pada Tukar Poin', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>status</td><td>On Proses</td><td>Diterima</td></tr></tbody></table>', 5, '2024-09-03 19:18:17', NULL),
(939, '114.10.30.117', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/tukar_saldo/edit-save/18', 'Memperbaharui data  pada Tukar Saldo', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>status</td><td>Pending</td><td>On Proses</td></tr></tbody></table>', 5, '2024-09-03 19:27:30', NULL),
(940, '114.10.30.117', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 114.10.30.117', '', 5, '2024-09-03 19:45:40', NULL),
(941, '114.10.30.117', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 114.10.30.117', '', 5, '2024-09-03 19:48:09', NULL),
(942, '120.188.93.109', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 120.188.93.109', '', 5, '2024-09-04 13:42:34', NULL),
(943, '120.188.93.109', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 120.188.93.109', '', 5, '2024-09-04 13:43:16', NULL),
(944, '120.188.93.109', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 120.188.93.109', '', 5, '2024-09-04 13:43:47', NULL),
(945, '120.188.93.109', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'bsu1@gmail.com keluar', '', 5, '2024-09-04 13:45:14', NULL),
(946, '120.188.93.109', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'bsu1@gmail.com keluar', '', 5, '2024-09-04 13:45:27', NULL),
(947, '120.188.93.109', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'admin@crudbooster.com login dengan IP Address 120.188.93.109', '', 1, '2024-09-04 13:45:30', NULL),
(948, '120.188.93.109', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'admin@crudbooster.com keluar', '', 1, '2024-09-04 13:45:57', NULL),
(949, '120.188.93.109', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 120.188.93.109', '', 5, '2024-09-04 13:46:00', NULL),
(950, '120.188.93.109', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'bsu1@gmail.com keluar', '', 5, '2024-09-04 13:46:09', NULL),
(951, '120.188.93.109', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'admin@crudbooster.com login dengan IP Address 120.188.93.109', '', 1, '2024-09-04 13:46:14', NULL),
(952, '120.188.93.109', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/menu_management/edit-save/31', 'Memperbaharui data Tabungan Nasabah pada Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>name</td><td>Transaksi Nasabah</td><td>Tabungan Nasabah</td></tr><tr><td>parent_id</td><td>43</td><td></td></tr></tbody></table>', 1, '2024-09-04 13:47:05', NULL),
(953, '120.188.93.109', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/menu_management/edit-save/31', 'Memperbaharui data Tabungan Nasabah pada Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>parent_id</td><td>43</td><td></td></tr></tbody></table>', 1, '2024-09-04 13:48:01', NULL),
(954, '120.188.93.109', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'admin@crudbooster.com keluar', '', 1, '2024-09-04 13:49:44', NULL),
(955, '120.188.93.109', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'admin_bankimam@gmail.com login dengan IP Address 120.188.93.109', '', 10, '2024-09-04 13:49:48', NULL),
(956, '120.188.93.109', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'admin_bankimam@gmail.com keluar', '', 10, '2024-09-04 13:49:57', NULL),
(957, '120.188.93.109', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 120.188.93.109', '', 5, '2024-09-04 13:50:02', NULL),
(958, '120.188.93.109', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'bsu1@gmail.com keluar', '', 5, '2024-09-04 13:50:14', NULL),
(959, '120.188.93.109', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'admin@crudbooster.com login dengan IP Address 120.188.93.109', '', 1, '2024-09-04 13:50:18', NULL),
(960, '120.188.93.109', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'admin@crudbooster.com keluar', '', 1, '2024-09-04 13:53:25', NULL),
(961, '120.188.93.109', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 120.188.93.109', '', 5, '2024-09-04 13:53:29', NULL),
(962, '120.188.93.109', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions_bsi/delete/23', 'Menghapus data 23 pada Transaksi BSI', '', 5, '2024-09-04 13:53:40', NULL),
(963, '120.188.93.109', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'bsu1@gmail.com keluar', '', 5, '2024-09-04 14:01:29', NULL),
(964, '120.188.93.109', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'admin@crudbooster.com login dengan IP Address 120.188.93.109', '', 1, '2024-09-04 14:01:32', NULL),
(965, '120.188.93.109', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'admin@crudbooster.com keluar', '', 1, '2024-09-04 14:01:53', NULL),
(966, '120.188.93.109', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'admin_bankimam@gmail.com login dengan IP Address 120.188.93.109', '', 10, '2024-09-04 14:01:58', NULL),
(967, '120.188.93.109', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'admin_bankimam@gmail.com keluar', '', 10, '2024-09-04 14:04:40', NULL),
(968, '120.188.93.109', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu2@gmail.com login dengan IP Address 120.188.93.109', '', 6, '2024-09-04 14:04:45', NULL),
(969, '120.188.93.109', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'bsu2@gmail.com keluar', '', 6, '2024-09-04 14:05:17', NULL),
(970, '120.188.93.109', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'admin_bankimam@gmail.com login dengan IP Address 120.188.93.109', '', 10, '2024-09-04 14:05:23', NULL),
(971, '120.188.93.109', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'admin_bankimam@gmail.com keluar', '', 10, '2024-09-04 14:19:27', NULL),
(972, '120.188.93.109', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 120.188.93.109', '', 5, '2024-09-04 14:19:31', NULL),
(973, '120.188.93.109', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'bsu1@gmail.com keluar', '', 5, '2024-09-04 14:24:09', NULL),
(974, '120.188.93.109', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'admin@crudbooster.com login dengan IP Address 120.188.93.109', '', 1, '2024-09-04 14:24:12', NULL),
(975, '120.188.93.109', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'admin@crudbooster.com keluar', '', 1, '2024-09-04 14:30:13', NULL),
(976, '120.188.93.109', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 120.188.93.109', '', 5, '2024-09-04 14:30:16', NULL),
(977, '120.188.93.109', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'bsu1@gmail.com keluar', '', 5, '2024-09-04 14:34:59', NULL),
(978, '120.188.93.109', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu2@gmail.com login dengan IP Address 120.188.93.109', '', 6, '2024-09-04 14:35:03', NULL),
(979, '120.188.93.109', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'bsu2@gmail.com keluar', '', 6, '2024-09-04 14:35:23', NULL),
(980, '120.188.93.109', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'admin_bankimam@gmail.com login dengan IP Address 120.188.93.109', '', 10, '2024-09-04 14:35:27', NULL),
(981, '120.188.93.109', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'admin_bankimam@gmail.com keluar', '', 10, '2024-09-04 14:35:49', NULL);
INSERT INTO `cms_logs` (`id`, `ipaddress`, `useragent`, `url`, `description`, `details`, `id_cms_users`, `created_at`, `updated_at`) VALUES
(982, '120.188.93.109', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'admin@crudbooster.com login dengan IP Address 120.188.93.109', '', 1, '2024-09-04 14:36:24', NULL),
(983, '120.188.93.109', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/menu_management/edit-save/43', 'Memperbaharui data Setoran Sampah pada Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>name</td><td>Transaksi</td><td>Setoran Sampah</td></tr><tr><td>sorting</td><td>6</td><td></td></tr></tbody></table>', 1, '2024-09-04 14:36:49', NULL),
(984, '120.188.93.109', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'admin@crudbooster.com keluar', '', 1, '2024-09-04 14:56:30', NULL),
(985, '120.188.93.109', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 120.188.93.109', '', 5, '2024-09-04 14:56:33', NULL),
(986, '120.188.93.109', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/users/edit-save/5', 'Memperbaharui data BSU Kelurahan Meruya Selatan pada Users Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>name</td><td>BSU-1</td><td>BSU Kelurahan Meruya Selatan</td></tr><tr><td>password</td><td>$2y$10$.ZCXqpHVan85cC88nGtKneJWkZ4QxITl.L304PNjgRf5u1MMIHDau</td><td>$2y$10$YEJVsZJsBxazYUGlhQ0wN.7fYsjgS73YyZ7u0xgHhuq5AIyyT059m</td></tr><tr><td>id_cms_privileges</td><td>4</td><td></td></tr></tbody></table>', 5, '2024-09-04 14:56:58', NULL),
(987, '120.188.93.109', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/users/edit-save/5', 'Memperbaharui data BSU Kelurahan Meruya Selatan pada Users Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>password</td><td>$2y$10$YEJVsZJsBxazYUGlhQ0wN.7fYsjgS73YyZ7u0xgHhuq5AIyyT059m</td><td>$2y$10$IU610eI6uMwmGH2BTKLLwOkZTdblY5lam.MYfxkF5whga7uWq6ATu</td></tr><tr><td>id_cms_privileges</td><td>4</td><td></td></tr></tbody></table>', 5, '2024-09-04 14:57:20', NULL),
(988, '120.188.93.109', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'bsu1@gmail.com keluar', '', 5, '2024-09-04 14:57:26', NULL),
(989, '120.188.93.109', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 120.188.93.109', '', 5, '2024-09-04 14:57:56', NULL),
(990, '120.188.93.109', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 120.188.93.109', '', 5, '2024-09-04 15:08:09', NULL),
(991, '120.188.93.109', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/users/edit-save/5', 'Memperbaharui data BSU Kelurahan Meruya Selatan pada Users Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>password</td><td>$2y$10$IU610eI6uMwmGH2BTKLLwOkZTdblY5lam.MYfxkF5whga7uWq6ATu</td><td>$2y$10$ipSZtn2xgawLfpkT7NuhFupnSycuzVx9VfixuYrtYFd4CE5vos.6K</td></tr><tr><td>id_cms_privileges</td><td>4</td><td></td></tr></tbody></table>', 5, '2024-09-04 15:08:35', NULL),
(992, '120.188.93.109', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'bsu1@gmail.com keluar', '', 5, '2024-09-04 15:08:38', NULL),
(993, '120.188.93.109', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 120.188.93.109', '', 5, '2024-09-04 15:08:45', NULL),
(994, '120.188.93.109', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/users/edit-save/5', 'Memperbaharui data BSU Kelurahan Meruya Selatan pada Users Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>password</td><td>$2y$10$ipSZtn2xgawLfpkT7NuhFupnSycuzVx9VfixuYrtYFd4CE5vos.6K</td><td>$2y$10$2PoCQNo5xgI94Ixam4rNxu6UvGg6SyoUfPmlooL2IRXHWXICI66Pa</td></tr><tr><td>id_cms_privileges</td><td>4</td><td></td></tr></tbody></table>', 5, '2024-09-04 15:09:03', NULL),
(995, '120.188.93.109', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'bsu1@gmail.com keluar', '', 5, '2024-09-04 15:09:06', NULL),
(996, '120.188.93.109', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 120.188.93.109', '', 5, '2024-09-04 15:09:08', NULL),
(997, '120.188.93.109', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'bsu1@gmail.com keluar', '', 5, '2024-09-04 15:09:35', NULL),
(998, '120.188.93.109', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'admin@crudbooster.com login dengan IP Address 120.188.93.109', '', 1, '2024-09-04 15:09:39', NULL),
(999, '120.188.93.109', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'admin@crudbooster.com keluar', '', 1, '2024-09-04 15:11:06', NULL),
(1000, '120.188.93.109', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 120.188.93.109', '', 5, '2024-09-04 15:11:09', NULL),
(1001, '120.188.93.109', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 120.188.93.109', '', 5, '2024-09-04 15:11:50', NULL),
(1002, '120.188.93.109', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-04 15:13:16', NULL),
(1003, '120.188.93.109', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'bsu1@gmail.com keluar', '', 5, '2024-09-04 15:16:18', NULL),
(1004, '120.188.93.109', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'admin@crudbooster.com login dengan IP Address 120.188.93.109', '', 1, '2024-09-04 15:16:28', NULL),
(1005, '2001:448a:20b1:7ff5:91e5:53b0:af4a:b7e7', 'Mozilla/5.0 (iPhone; CPU iPhone OS 17_6_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.6 Mobile/15E148 Safari/604.1', 'https://bangimam.com/admin/login', 'admin_bankimam@gmail.com login dengan IP Address 2001:448a:20b1:7ff5:91e5:53b0:af4a:b7e7', '', 10, '2024-09-05 21:22:50', NULL),
(1006, '2001:448a:20b1:7ff5:5190:ad92:e8c3:d7da', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'admin_bankimam@gmail.com login dengan IP Address 2001:448a:20b1:7ff5:5190:ad92:e8c3:d7da', '', 10, '2024-09-05 21:58:38', NULL),
(1007, '114.10.115.77', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 114.10.115.77', '', 5, '2024-09-06 15:40:59', NULL),
(1008, '114.10.115.77', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 114.10.115.77', '', 5, '2024-09-06 15:41:19', NULL),
(1009, '114.10.115.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 114.10.115.77', '', 5, '2024-09-06 19:11:23', NULL),
(1010, '114.10.115.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/users/edit-save/5', 'Memperbaharui data BSU Mercubuana pada Users Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>name</td><td>BSU Kelurahan Meruya Selatan</td><td>BSU Mercubuana</td></tr><tr><td>password</td><td>$2y$10$2PoCQNo5xgI94Ixam4rNxu6UvGg6SyoUfPmlooL2IRXHWXICI66Pa</td><td>$2y$10$ANBBx7qwbnw/WmzmNybJe.tGBaFAH/EJUIjYXKG0zTIx5MtUnu.gG</td></tr><tr><td>id_cms_privileges</td><td>4</td><td></td></tr></tbody></table>', 5, '2024-09-06 19:11:47', NULL),
(1011, '114.10.115.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'bsu1@gmail.com keluar', '', 5, '2024-09-06 19:11:57', NULL),
(1012, '114.10.115.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 114.10.115.77', '', 5, '2024-09-06 19:11:59', NULL),
(1013, '114.10.29.88', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'bsu1@gmail.com keluar', '', 5, '2024-09-06 21:00:23', NULL),
(1014, '114.10.29.88', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'admin_bankimam@gmail.com login dengan IP Address 114.10.29.88', '', 10, '2024-09-06 21:00:32', NULL),
(1015, '114.10.29.88', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/users/add-save', 'Tambah data baru BSU Karya Peduli pada Users Management', '', 10, '2024-09-06 21:06:12', NULL),
(1016, '114.10.29.88', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'admin_bankimam@gmail.com keluar', '', 10, '2024-09-06 21:06:16', NULL),
(1017, '114.10.29.88', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'karyapeduli@gmail.com login dengan IP Address 114.10.29.88', '', 12, '2024-09-06 21:06:18', NULL),
(1018, '114.10.29.88', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'karyapeduli@gmail.com keluar', '', 12, '2024-09-06 21:06:40', NULL),
(1019, '114.10.29.88', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'admin_bankimam@gmail.com login dengan IP Address 114.10.29.88', '', 10, '2024-09-06 21:06:48', NULL),
(1020, '114.10.29.88', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/users/add-save', 'Tambah data baru BSU Madrasah Raudiatul Mutaalimin pada Users Management', '', 10, '2024-09-06 21:07:47', NULL),
(1021, '114.10.29.88', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/users/edit-save/13', 'Memperbaharui data BSU Madrasah Raudiatul Mutaalimin pada Users Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>password</td><td>$2y$10$i8piaro8hEQcgl3zkWoaVeQYAcPdr454qgEBBUeNVU.tO.t6fJgsK</td><td>$2y$10$6PMpDQhFnkI6j4OWI.yVm.OI.eNKYdn/3NGN3qo6wvZ9all0G.HJ.</td></tr><tr><td>no_whatsapp</td><td>admin_bankimam@gmail.com</td><td>0</td></tr></tbody></table>', 10, '2024-09-06 21:08:02', NULL),
(1022, '114.10.29.88', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/users/add-save', 'Tambah data baru BSU Melati RW 02 pada Users Management', '', 10, '2024-09-06 21:09:05', NULL),
(1023, '114.10.29.88', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/users/add-save', 'Tambah data baru BSU Melati 2 pada Users Management', '', 10, '2024-09-06 21:09:46', NULL),
(1024, '114.10.29.88', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/users/add-save', 'Tambah data baru BSU Agathis Botanical RW 02 pada Users Management', '', 10, '2024-09-06 21:10:45', NULL),
(1025, '114.10.29.88', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/users/add-save', 'Tambah data baru BSU Surya Mandiri Kel.Meruya Selatan pada Users Management', '', 10, '2024-09-06 21:11:56', NULL),
(1026, '114.10.29.88', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/users/add-save', 'Tambah data baru BSU Asri SDN Meruya Selatan 1 pada Users Management', '', 10, '2024-09-06 21:12:54', NULL),
(1027, '114.10.29.88', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/users/delete/6', 'Menghapus data BSU-2 pada Users Management', '', 10, '2024-09-06 21:13:03', NULL),
(1028, '114.10.29.88', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/users/delete/6', 'Menghapus data BSU-2 pada Users Management', '', 10, '2024-09-06 21:17:48', NULL),
(1029, '114.10.29.88', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/users/delete/6', 'Menghapus data BSU-2 pada Users Management', '', 10, '2024-09-06 21:19:16', NULL),
(1030, '114.10.29.88', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/users/delete/6', 'Menghapus data BSU-2 pada Users Management', '', 10, '2024-09-06 21:20:12', NULL),
(1031, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0', 'https://bangimam.com/admin/login', 'admin_bankimam@gmail.com login dengan IP Address 180.252.172.104', '', 10, '2024-09-06 21:21:04', NULL),
(1032, '114.10.29.88', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/users/add-save', 'Tambah data baru BSU Raflesia SDN Meruya Selatan 3 pada Users Management', '', 10, '2024-09-06 21:22:41', NULL),
(1033, '114.10.29.88', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/users/add-save', 'Tambah data baru BSU Jack RW 03 pada Users Management', '', 10, '2024-09-06 21:23:27', NULL),
(1034, '114.10.29.88', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/users/add-save', 'Tambah data baru BSU RPTRA Mahkota pada Users Management', '', 10, '2024-09-06 21:24:25', NULL),
(1035, '114.10.29.88', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/users/edit-save/14', 'Memperbaharui data BSU Melati 1 RW 02 pada Users Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>name</td><td>BSU Melati RW 02</td><td>BSU Melati 1 RW 02</td></tr><tr><td>email</td><td>melati@gmail.com</td><td>melati1@gmail.com</td></tr><tr><td>password</td><td>$2y$10$B1Vr8MQxvVYioFOLe1clMeGhy7sji9/Dq8FnewhZ9v8L.JjpAfDNq</td><td>$2y$10$.YIGt4uKcFEEPwXiDUZlzOWzF0XhC0OlmreijK/H6xIUi6VwcRCVW</td></tr></tbody></table>', 10, '2024-09-06 21:24:50', NULL),
(1036, '114.10.29.88', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/users/edit-save/15', 'Memperbaharui data BSU Melati 2 RW 02 pada Users Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>name</td><td>BSU Melati 2</td><td>BSU Melati 2 RW 02</td></tr><tr><td>password</td><td>$2y$10$pzOOfM//J0ipo16C7um4B.sznPoE2wewurI6IWUKWqn7uks4aBHwC</td><td></td></tr></tbody></table>', 10, '2024-09-06 21:25:12', NULL),
(1037, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'admin_bankimam@gmail.com keluar', '', 10, '2024-09-06 21:30:59', NULL),
(1038, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0', 'https://bangimam.com/admin/users/add-save', 'Tambah data baru BSU RPTRA Meruya Selatan pada Users Management', '', 10, '2024-09-06 21:31:27', NULL),
(1039, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'karyapeduli@gmail.com login dengan IP Address 114.10.64.247', '', 12, '2024-09-06 21:31:31', NULL),
(1040, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah_categories/add-save', 'Tambah data baru Kertas pada Kategori Sampah', '', 12, '2024-09-06 21:31:49', NULL),
(1041, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah_categories/add-save', 'Tambah data baru Plastik pada Kategori Sampah', '', 12, '2024-09-06 21:31:58', NULL),
(1042, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Kardus pada Sampah', '', 12, '2024-09-06 21:32:26', NULL),
(1043, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0', 'https://bangimam.com/admin/users/add-save', 'Tambah data baru BSU RPTRA Manuver pada Users Management', '', 10, '2024-09-06 21:32:41', NULL),
(1044, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Botol Plastik pada Sampah', '', 12, '2024-09-06 21:32:44', NULL),
(1045, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0', 'https://bangimam.com/admin/users/add-save', 'Tambah data baru BSU RPTRA Menara pada Users Management', '', 10, '2024-09-06 21:33:30', NULL),
(1046, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0', 'https://bangimam.com/admin/users/add-save', 'Tambah data baru BSU RPTRA Manunggal pada Users Management', '', 10, '2024-09-06 21:34:29', NULL),
(1047, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0', 'https://bangimam.com/admin/users/add-save', 'Tambah data baru BSU Sumber Rejeki RW 04 pada Users Management', '', 10, '2024-09-06 21:35:28', NULL),
(1048, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Buku pada Sampah', '', 12, '2024-09-06 21:35:49', NULL),
(1049, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0', 'https://bangimam.com/admin/users/add-save', 'Tambah data baru BSU Rosmerah RW 05 pada Users Management', '', 10, '2024-09-06 21:36:15', NULL),
(1050, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/rewards/add-save', 'Tambah data baru Sapu pada Rewards', '', 12, '2024-09-06 21:36:46', NULL),
(1051, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0', 'https://bangimam.com/admin/users/add-save', 'Tambah data baru BSU Anggrek Bulan RW 06 pada Users Management', '', 10, '2024-09-06 21:36:59', NULL),
(1052, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/rewards/add-save', 'Tambah data baru Vas Bunga pada Rewards', '', 12, '2024-09-06 21:37:17', NULL),
(1053, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0', 'https://bangimam.com/admin/users/add-save', 'Tambah data baru BSU Camal Jaya RW 07 pada Users Management', '', 10, '2024-09-06 21:37:41', NULL),
(1054, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'karyapeduli@gmail.com keluar', '', 12, '2024-09-06 21:38:21', NULL),
(1055, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'admin_bankimam@gmail.com login dengan IP Address 114.10.64.247', '', 10, '2024-09-06 21:38:26', NULL),
(1056, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0', 'https://bangimam.com/admin/users/add-save', 'Tambah data baru BSU Pelangi RW 08 pada Users Management', '', 10, '2024-09-06 21:38:28', NULL),
(1057, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0', 'https://bangimam.com/admin/users/add-save', 'Tambah data baru BSU Lestari RW 011 pada Users Management', '', 10, '2024-09-06 21:39:06', NULL),
(1058, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'admin_bankimam@gmail.com keluar', '', 10, '2024-09-06 21:39:11', NULL),
(1059, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'madrasahRM@gmail.com login dengan IP Address 114.10.64.247', '', 13, '2024-09-06 21:39:34', NULL),
(1060, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah_categories/add-save', 'Tambah data baru Plastik pada Kategori Sampah', '', 13, '2024-09-06 21:39:44', NULL),
(1061, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah_categories/add-save', 'Tambah data baru Kertas pada Kategori Sampah', '', 13, '2024-09-06 21:39:54', NULL),
(1062, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'madrasahRM@gmail.com keluar', '', 13, '2024-09-06 21:41:59', NULL),
(1063, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'karyapeduli@gmail.com login dengan IP Address 114.10.64.247', '', 12, '2024-09-06 21:42:05', NULL),
(1064, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'karyapeduli@gmail.com keluar', '', 12, '2024-09-06 21:43:05', NULL),
(1065, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'karyapeduli@gmail.com login dengan IP Address 114.10.64.247', '', 12, '2024-09-06 21:43:32', NULL),
(1066, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'karyapeduli@gmail.com keluar', '', 12, '2024-09-06 21:43:42', NULL),
(1067, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'karyapeduli@gmail.com login dengan IP Address 114.10.64.247', '', 12, '2024-09-06 21:44:18', NULL),
(1068, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'karyapeduli@gmail.com keluar', '', 12, '2024-09-06 21:44:50', NULL),
(1069, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'admin_bankimam@gmail.com login dengan IP Address 114.10.64.247', '', 10, '2024-09-06 21:44:56', NULL),
(1070, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/users/edit-save/13', 'Memperbaharui data BSU Madrasah Raudiatul Mutaalimin pada Users Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>password</td><td>$2y$10$6PMpDQhFnkI6j4OWI.yVm.OI.eNKYdn/3NGN3qo6wvZ9all0G.HJ.</td><td>$2y$10$9cvvUknNu8D3jLDvYUtaPuuYno5PnkuT0TThs8WwDjSWGmD6Jh8t6</td></tr></tbody></table>', 10, '2024-09-06 21:45:12', NULL),
(1071, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'admin_bankimam@gmail.com keluar', '', 10, '2024-09-06 21:45:17', NULL),
(1072, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'madrasahRM@gmail.com login dengan IP Address 114.10.64.247', '', 13, '2024-09-06 21:45:18', NULL),
(1073, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Botol Plastik pada Sampah', '', 13, '2024-09-06 21:46:09', NULL),
(1074, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0', 'https://bangimam.com/admin/statistic_builder', 'Mencoba melihat data :name pada Statistic Builder', '', 10, '2024-09-06 21:46:28', NULL),
(1075, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Buku pada Sampah', '', 13, '2024-09-06 21:46:40', NULL),
(1076, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Kardus pada Sampah', '', 13, '2024-09-06 21:46:54', NULL),
(1077, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'rptraMeruyaSelatan@gmail.com login dengan IP Address 180.252.172.104', '', 22, '2024-09-06 21:48:05', NULL),
(1078, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/rewards/add-save', 'Tambah data baru Vas Bunga pada Rewards', '', 13, '2024-09-06 21:48:42', NULL),
(1079, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/rewards/add-save', 'Tambah data baru Sapu pada Rewards', '', 13, '2024-09-06 21:49:03', NULL),
(1080, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'madrasahRM@gmail.com keluar', '', 13, '2024-09-06 21:49:20', NULL),
(1081, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'melati1@gmail.com login dengan IP Address 114.10.64.247', '', 14, '2024-09-06 21:50:02', NULL),
(1082, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah_categories/add-save', 'Tambah data baru Plastik pada Kategori Sampah', '', 14, '2024-09-06 21:50:11', NULL),
(1083, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah_categories/add-save', 'Tambah data baru Kertas pada Kategori Sampah', '', 14, '2024-09-06 21:50:20', NULL),
(1084, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah_categories/add-save', 'Tambah data baru Plastik pada Kategori Sampah', '', 22, '2024-09-06 21:50:21', NULL),
(1085, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah_categories/add-save', 'Tambah data baru Kertas pada Kategori Sampah', '', 22, '2024-09-06 21:50:34', NULL),
(1086, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Botol Plastik pada Sampah', '', 14, '2024-09-06 21:50:40', NULL),
(1087, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Kardus pada Sampah', '', 14, '2024-09-06 21:50:52', NULL),
(1088, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Buku pada Sampah', '', 14, '2024-09-06 21:51:13', NULL),
(1089, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Kardus pada Sampah', '', 22, '2024-09-06 21:51:21', NULL),
(1090, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/rewards/add-save', 'Tambah data baru Vas Bunga pada Rewards', '', 14, '2024-09-06 21:51:37', NULL),
(1091, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Botol Plastik pada Sampah', '', 22, '2024-09-06 21:51:54', NULL),
(1092, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Buku pada Sampah', '', 22, '2024-09-06 21:52:13', NULL),
(1093, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/rewards/add-save', 'Tambah data baru Sapu pada Rewards', '', 14, '2024-09-06 21:52:15', NULL),
(1094, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'melati1@gmail.com keluar', '', 14, '2024-09-06 21:52:20', NULL),
(1095, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'melati2@gmail.com login dengan IP Address 114.10.64.247', '', 15, '2024-09-06 21:52:24', NULL),
(1096, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah_categories/add-save', 'Tambah data baru Plastik pada Kategori Sampah', '', 15, '2024-09-06 21:52:33', NULL),
(1097, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah_categories/add-save', 'Tambah data baru Kertas pada Kategori Sampah', '', 15, '2024-09-06 21:52:41', NULL),
(1098, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Botol Plastik pada Sampah', '', 15, '2024-09-06 21:52:51', NULL),
(1099, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Kardus pada Sampah', '', 15, '2024-09-06 21:53:04', NULL),
(1100, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Buku pada Sampah', '', 15, '2024-09-06 21:53:17', NULL),
(1101, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/rewards/add-save', 'Tambah data baru Vas Bunga pada Rewards', '', 15, '2024-09-06 21:53:38', NULL),
(1102, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/rewards/add-save', 'Tambah data baru Sapu pada Rewards', '', 15, '2024-09-06 21:53:59', NULL),
(1103, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'melati2@gmail.com keluar', '', 15, '2024-09-06 21:54:03', NULL),
(1104, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'agathisBotanical@gmail.com login dengan IP Address 114.10.64.247', '', 16, '2024-09-06 21:54:13', NULL),
(1105, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/rewards/add-save', 'Tambah data baru Sapu pada Rewards', '', 22, '2024-09-06 21:54:20', NULL),
(1106, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah_categories/add-save', 'Tambah data baru Plastik pada Kategori Sampah', '', 16, '2024-09-06 21:54:21', NULL),
(1107, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah_categories/add-save', 'Tambah data baru Kertas pada Kategori Sampah', '', 16, '2024-09-06 21:54:26', NULL),
(1108, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Botol Plastik pada Sampah', '', 16, '2024-09-06 21:54:40', NULL),
(1109, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Kardus pada Sampah', '', 16, '2024-09-06 21:54:50', NULL),
(1110, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Buku pada Sampah', '', 16, '2024-09-06 21:55:03', NULL),
(1111, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/rewards/add-save', 'Tambah data baru Vas Bunga pada Rewards', '', 22, '2024-09-06 21:55:10', NULL),
(1112, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/rewards/add-save', 'Tambah data baru Vas Bunga pada Rewards', '', 16, '2024-09-06 21:55:21', NULL),
(1113, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'rptraMeruyaSelatan@gmail.com keluar', '', 22, '2024-09-06 21:55:25', NULL),
(1114, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/rewards/add-save', 'Tambah data baru Sapu pada Rewards', '', 16, '2024-09-06 21:55:38', NULL),
(1115, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'agathisBotanical@gmail.com keluar', '', 16, '2024-09-06 21:55:41', NULL),
(1116, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'suryaMandiri@gmail.com login dengan IP Address 114.10.64.247', '', 17, '2024-09-06 21:55:53', NULL),
(1117, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'rptraManuver@gmail.com login dengan IP Address 180.252.172.104', '', 23, '2024-09-06 21:56:05', NULL),
(1118, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah_categories/add-save', 'Tambah data baru Plastik pada Kategori Sampah', '', 23, '2024-09-06 21:56:51', NULL),
(1119, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah_categories/add-save', 'Tambah data baru Kertas pada Kategori Sampah', '', 23, '2024-09-06 21:57:00', NULL),
(1120, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah_categories/add-save', 'Tambah data baru Plastik pada Kategori Sampah', '', 17, '2024-09-06 21:57:04', NULL),
(1121, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah_categories/add-save', 'Tambah data baru Kertas pada Kategori Sampah', '', 17, '2024-09-06 21:57:18', NULL),
(1122, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Kardus pada Sampah', '', 23, '2024-09-06 21:57:31', NULL),
(1123, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Botol Plastik pada Sampah', '', 17, '2024-09-06 21:57:32', NULL),
(1124, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Kardus pada Sampah', '', 17, '2024-09-06 21:57:43', NULL),
(1125, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Botol Plastik pada Sampah', '', 23, '2024-09-06 21:57:49', NULL),
(1126, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Buku pada Sampah', '', 17, '2024-09-06 21:57:59', NULL),
(1127, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Buku pada Sampah', '', 23, '2024-09-06 21:58:04', NULL),
(1128, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/rewards/add-save', 'Tambah data baru Vas Bunga pada Rewards', '', 17, '2024-09-06 21:58:20', NULL),
(1129, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/rewards/add-save', 'Tambah data baru Sapu pada Rewards', '', 17, '2024-09-06 21:58:39', NULL),
(1130, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'suryaMandiri@gmail.com keluar', '', 17, '2024-09-06 21:58:43', NULL),
(1131, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/rewards/add-save', 'Tambah data baru Sapu pada Rewards', '', 23, '2024-09-06 21:59:00', NULL),
(1132, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'asri@gmail.com login dengan IP Address 114.10.64.247', '', 18, '2024-09-06 21:59:04', NULL),
(1133, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah_categories/add-save', 'Tambah data baru Plastik pada Kategori Sampah', '', 18, '2024-09-06 21:59:13', NULL),
(1134, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/rewards/add-save', 'Tambah data baru Vas Bunga pada Rewards', '', 23, '2024-09-06 21:59:24', NULL),
(1135, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah_categories/add-save', 'Tambah data baru Kertas pada Kategori Sampah', '', 18, '2024-09-06 21:59:24', NULL),
(1136, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Botol Plastik pada Sampah', '', 18, '2024-09-06 21:59:40', NULL),
(1137, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'rptraManuver@gmail.com keluar', '', 23, '2024-09-06 21:59:45', NULL),
(1138, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Kardus pada Sampah', '', 18, '2024-09-06 21:59:50', NULL),
(1139, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'rptraMenara@gmail.com login dengan IP Address 180.252.172.104', '', 24, '2024-09-06 22:00:01', NULL),
(1140, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Buku pada Sampah', '', 18, '2024-09-06 22:00:02', NULL),
(1141, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/rewards/add-save', 'Tambah data baru Vas Bunga pada Rewards', '', 18, '2024-09-06 22:00:24', NULL),
(1142, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/rewards/add-save', 'Tambah data baru Sapu pada Rewards', '', 24, '2024-09-06 22:00:33', NULL),
(1143, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/rewards/add-save', 'Tambah data baru Sapu pada Rewards', '', 18, '2024-09-06 22:00:40', NULL),
(1144, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'asri@gmail.com keluar', '', 18, '2024-09-06 22:00:46', NULL),
(1145, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/rewards/add-save', 'Tambah data baru Vas Bunga pada Rewards', '', 24, '2024-09-06 22:00:59', NULL),
(1146, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'admin_bankimam@gmail.com login dengan IP Address 114.10.64.247', '', 10, '2024-09-06 22:01:07', NULL),
(1147, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah_categories/add-save', 'Tambah data baru Plastik pada Kategori Sampah', '', 24, '2024-09-06 22:01:17', NULL),
(1148, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah_categories/add-save', 'Tambah data baru Kertas pada Kategori Sampah', '', 24, '2024-09-06 22:01:27', NULL),
(1149, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Kardus pada Sampah', '', 24, '2024-09-06 22:01:47', NULL),
(1150, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/users/edit-save/19', 'Memperbaharui data BSU Raflesia SDN Meruya Selatan 3 pada Users Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>password</td><td>$2y$10$N/Gt5fc8b2kvckec.uIi7Op4S8yGPLkHWJZ0fzY9gWbpTTJ.F7fqe</td><td>$2y$10$6Z0juEaRj/Jsn.MXsDdFaOODKCfNLcssqqNnGpacOICfrIscFTubi</td></tr></tbody></table>', 10, '2024-09-06 22:01:50', NULL),
(1151, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'admin_bankimam@gmail.com keluar', '', 10, '2024-09-06 22:01:56', NULL);
INSERT INTO `cms_logs` (`id`, `ipaddress`, `useragent`, `url`, `description`, `details`, `id_cms_users`, `created_at`, `updated_at`) VALUES
(1152, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'raflesia@gmail.com login dengan IP Address 114.10.64.247', '', 19, '2024-09-06 22:01:58', NULL),
(1153, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Botol Plastik pada Sampah', '', 24, '2024-09-06 22:02:04', NULL),
(1154, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah_categories/add-save', 'Tambah data baru Plastik pada Kategori Sampah', '', 19, '2024-09-06 22:02:10', NULL),
(1155, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah_categories/add-save', 'Tambah data baru Kertas pada Kategori Sampah', '', 19, '2024-09-06 22:02:15', NULL),
(1156, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Buku pada Sampah', '', 24, '2024-09-06 22:02:21', NULL),
(1157, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'rptraMenara@gmail.com keluar', '', 24, '2024-09-06 22:02:28', NULL),
(1158, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Botol Plastik pada Sampah', '', 19, '2024-09-06 22:02:29', NULL),
(1159, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Kardus pada Sampah', '', 19, '2024-09-06 22:02:40', NULL),
(1160, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'rptraManunggal@gmail.com login dengan IP Address 180.252.172.104', '', 25, '2024-09-06 22:02:47', NULL),
(1161, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Buku pada Sampah', '', 19, '2024-09-06 22:02:53', NULL),
(1162, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah_categories/add-save', 'Tambah data baru Plastik pada Kategori Sampah', '', 25, '2024-09-06 22:03:03', NULL),
(1163, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah_categories/add-save', 'Tambah data baru Kertas pada Kategori Sampah', '', 25, '2024-09-06 22:03:10', NULL),
(1164, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/rewards/add-save', 'Tambah data baru Vas Bunga pada Rewards', '', 19, '2024-09-06 22:03:20', NULL),
(1165, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Kardus pada Sampah', '', 25, '2024-09-06 22:03:34', NULL),
(1166, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/rewards/add-save', 'Tambah data baru Sapu pada Rewards', '', 19, '2024-09-06 22:03:37', NULL),
(1167, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'raflesia@gmail.com keluar', '', 19, '2024-09-06 22:03:44', NULL),
(1168, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Botol Plastik pada Sampah', '', 25, '2024-09-06 22:03:50', NULL),
(1169, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'jack@gmail.com login dengan IP Address 114.10.64.247', '', 20, '2024-09-06 22:03:57', NULL),
(1170, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Buku pada Sampah', '', 25, '2024-09-06 22:04:10', NULL),
(1171, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah_categories/add-save', 'Tambah data baru Plastik pada Kategori Sampah', '', 20, '2024-09-06 22:04:13', NULL),
(1172, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah_categories/add-save', 'Tambah data baru Kertas pada Kategori Sampah', '', 20, '2024-09-06 22:04:17', NULL),
(1173, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Botol Plastik pada Sampah', '', 20, '2024-09-06 22:04:30', NULL),
(1174, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Kardus pada Sampah', '', 20, '2024-09-06 22:04:39', NULL),
(1175, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/rewards/add-save', 'Tambah data baru Sapu pada Rewards', '', 25, '2024-09-06 22:04:45', NULL),
(1176, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Buku pada Sampah', '', 20, '2024-09-06 22:04:53', NULL),
(1177, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/rewards/add-save', 'Tambah data baru Vas Bunga pada Rewards', '', 25, '2024-09-06 22:05:10', NULL),
(1178, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/rewards/add-save', 'Tambah data baru Vas Bunga pada Rewards', '', 20, '2024-09-06 22:05:15', NULL),
(1179, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'rptraManunggal@gmail.com keluar', '', 25, '2024-09-06 22:05:18', NULL),
(1180, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/rewards/add-save', 'Tambah data baru Sapu pada Rewards', '', 20, '2024-09-06 22:05:36', NULL),
(1181, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'jack@gmail.com keluar', '', 20, '2024-09-06 22:05:40', NULL),
(1182, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'rptraMahkota@gmail.com login dengan IP Address 114.10.64.247', '', 21, '2024-09-06 22:05:52', NULL),
(1183, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'sumberRejeki@gmail.com login dengan IP Address 180.252.172.104', '', 26, '2024-09-06 22:06:01', NULL),
(1184, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah_categories/add-save', 'Tambah data baru Plastik pada Kategori Sampah', '', 21, '2024-09-06 22:06:03', NULL),
(1185, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah_categories/add-save', 'Tambah data baru Kertas pada Kategori Sampah', '', 21, '2024-09-06 22:06:13', NULL),
(1186, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Botol Plastik pada Sampah', '', 21, '2024-09-06 22:06:34', NULL),
(1187, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/rewards/add-save', 'Tambah data baru Sapu pada Rewards', '', 26, '2024-09-06 22:06:39', NULL),
(1188, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Kardus pada Sampah', '', 21, '2024-09-06 22:06:47', NULL),
(1189, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Buku pada Sampah', '', 21, '2024-09-06 22:06:58', NULL),
(1190, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/rewards/add-save', 'Tambah data baru Vas Bunga pada Rewards', '', 26, '2024-09-06 22:07:02', NULL),
(1191, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah_categories/add-save', 'Tambah data baru Plastik pada Kategori Sampah', '', 26, '2024-09-06 22:07:13', NULL),
(1192, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/rewards/add-save', 'Tambah data baru Vas Bunga pada Rewards', '', 21, '2024-09-06 22:07:21', NULL),
(1193, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah_categories/add-save', 'Tambah data baru Kertas pada Kategori Sampah', '', 26, '2024-09-06 22:07:22', NULL),
(1194, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/rewards/add-save', 'Tambah data baru Sapu pada Rewards', '', 21, '2024-09-06 22:07:39', NULL),
(1195, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Kardus pada Sampah', '', 26, '2024-09-06 22:07:42', NULL),
(1196, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'rptraMahkota@gmail.com keluar', '', 21, '2024-09-06 22:07:43', NULL),
(1197, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'admin_bankimam@gmail.com login dengan IP Address 114.10.64.247', '', 10, '2024-09-06 22:07:48', NULL),
(1198, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Botol Plastik pada Sampah', '', 26, '2024-09-06 22:07:58', NULL),
(1199, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'admin_bankimam@gmail.com keluar', '', 10, '2024-09-06 22:08:07', NULL),
(1200, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'rptraMeruyaSelatan@gmail.com login dengan IP Address 114.10.64.247', '', 22, '2024-09-06 22:08:13', NULL),
(1201, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Buku pada Sampah', '', 26, '2024-09-06 22:08:17', NULL),
(1202, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'sumberRejeki@gmail.com keluar', '', 26, '2024-09-06 22:08:28', NULL),
(1203, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'rptraMeruyaSelatan@gmail.com keluar', '', 22, '2024-09-06 22:08:31', NULL),
(1204, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'rptraManuver@gmail.com login dengan IP Address 114.10.64.247', '', 23, '2024-09-06 22:08:51', NULL),
(1205, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'rptraManuver@gmail.com keluar', '', 23, '2024-09-06 22:09:17', NULL),
(1206, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'admin_bankimam@gmail.com login dengan IP Address 114.10.64.247', '', 10, '2024-09-06 22:09:19', NULL),
(1207, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0', 'https://bangimam.com/admin/users/edit-save/27', 'Memperbaharui data BSU Rosmerah RW 05 pada Users Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>password</td><td>$2y$10$vQqdUUKVo/aH9b.WiPwE7uFmHsMPPr0tkEDpNQ4ig9zXGzrXzqYPG</td><td>$2y$10$iTCk4Z2ENc5CWDrUsMscKu7vetOnYLczBk7lg//KIrtLEl.7RpwJG</td></tr></tbody></table>', 10, '2024-09-06 22:09:20', NULL),
(1208, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'rosmerah@gmail.com login dengan IP Address 180.252.172.104', '', 27, '2024-09-06 22:09:35', NULL),
(1209, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah_categories/add-save', 'Tambah data baru Plastik pada Kategori Sampah', '', 27, '2024-09-06 22:09:51', NULL),
(1210, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah_categories/add-save', 'Tambah data baru Kertas pada Kategori Sampah', '', 27, '2024-09-06 22:09:57', NULL),
(1211, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Kardus pada Sampah', '', 27, '2024-09-06 22:10:18', NULL),
(1212, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Botol Plastik pada Sampah', '', 27, '2024-09-06 22:10:32', NULL),
(1213, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Buku pada Sampah', '', 27, '2024-09-06 22:10:47', NULL),
(1214, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/rewards/add-save', 'Tambah data baru Sapu pada Rewards', '', 27, '2024-09-06 22:11:15', NULL),
(1215, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/rewards/add-save', 'Tambah data baru Vas Bunga pada Rewards', '', 27, '2024-09-06 22:11:40', NULL),
(1216, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'rosmerah@gmail.com keluar', '', 27, '2024-09-06 22:11:46', NULL),
(1217, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'anggrekBulan@gmail.com login dengan IP Address 180.252.172.104', '', 28, '2024-09-06 22:12:03', NULL),
(1218, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/rewards/add-save', 'Tambah data baru Sapu pada Rewards', '', 28, '2024-09-06 22:12:37', NULL),
(1219, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/rewards/add-save', 'Tambah data baru Vas Bunga pada Rewards', '', 28, '2024-09-06 22:13:11', NULL),
(1220, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah_categories/add-save', 'Tambah data baru Kertas pada Kategori Sampah', '', 28, '2024-09-06 22:13:30', NULL),
(1221, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah_categories/add-save', 'Tambah data baru Plastik pada Kategori Sampah', '', 28, '2024-09-06 22:13:42', NULL),
(1222, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Kardus pada Sampah', '', 28, '2024-09-06 22:14:13', NULL),
(1223, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Botol Plastik pada Sampah', '', 28, '2024-09-06 22:14:36', NULL),
(1224, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Buku pada Sampah', '', 28, '2024-09-06 22:15:01', NULL),
(1225, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'anggrekBulan@gmail.com keluar', '', 28, '2024-09-06 22:15:08', NULL),
(1226, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'camalJaya@gmail.com login dengan IP Address 180.252.172.104', '', 29, '2024-09-06 22:15:32', NULL),
(1227, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah_categories/add-save', 'Tambah data baru Kertas pada Kategori Sampah', '', 29, '2024-09-06 22:15:45', NULL),
(1228, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah_categories/add-save', 'Tambah data baru Plastik pada Kategori Sampah', '', 29, '2024-09-06 22:15:51', NULL),
(1229, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Kardus pada Sampah', '', 29, '2024-09-06 22:16:12', NULL),
(1230, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Botol Plastik pada Sampah', '', 29, '2024-09-06 22:16:27', NULL),
(1231, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Buku pada Sampah', '', 29, '2024-09-06 22:16:45', NULL),
(1232, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/rewards/add-save', 'Tambah data baru Sapu pada Rewards', '', 29, '2024-09-06 22:17:14', NULL),
(1233, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/rewards/add-save', 'Tambah data baru Vas Bunga pada Rewards', '', 29, '2024-09-06 22:17:43', NULL),
(1234, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'camalJaya@gmail.com keluar', '', 29, '2024-09-06 22:17:48', NULL),
(1235, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0', 'https://bangimam.com/admin/users/edit-save/30', 'Memperbaharui data BSU Pelangi RW 08 pada Users Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>password</td><td>$2y$10$0hUNDVM8LjRt67tPDvjaduQjcxDODx/eAwgT4DwIfS9ZBWIl61/Va</td><td>$2y$10$gqoo2Z.xbJi/59THU4ZUj.tE.kTr/uY8zGRQSBV1nbCdoYyJntZgK</td></tr></tbody></table>', 10, '2024-09-06 22:18:24', NULL),
(1236, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'pelangi@gmail.com login dengan IP Address 180.252.172.104', '', 30, '2024-09-06 22:18:34', NULL),
(1237, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah_categories/add-save', 'Tambah data baru Kertas pada Kategori Sampah', '', 30, '2024-09-06 22:18:48', NULL),
(1238, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah_categories/add-save', 'Tambah data baru Plastik pada Kategori Sampah', '', 30, '2024-09-06 22:18:55', NULL),
(1239, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'admin_bankimam@gmail.com keluar', '', 10, '2024-09-06 22:19:00', NULL),
(1240, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'karyapeduli@gmail.com login dengan IP Address 114.10.64.247', '', 12, '2024-09-06 22:19:05', NULL),
(1241, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Kardus pada Sampah', '', 30, '2024-09-06 22:19:14', NULL),
(1242, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 12, '2024-09-06 22:19:29', NULL),
(1243, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Botol Plastik pada Sampah', '', 30, '2024-09-06 22:19:31', NULL),
(1244, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Buku pada Sampah', '', 30, '2024-09-06 22:19:47', NULL),
(1245, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/rewards/add-save', 'Tambah data baru Sapu pada Rewards', '', 30, '2024-09-06 22:20:13', NULL),
(1246, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/rewards/add-save', 'Tambah data baru Vas Bunga pada Rewards', '', 30, '2024-09-06 22:20:41', NULL),
(1247, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'pelangi@gmail.com keluar', '', 30, '2024-09-06 22:20:47', NULL),
(1248, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 Edg/128.0.0.0', 'https://bangimam.com/admin/users/edit-save/31', 'Memperbaharui data BSU Lestari RW 011 pada Users Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>password</td><td>$2y$10$PRyeh.ZWLgbbbmlfWuEQnugKxDuuipYUsqTHXb39argxgdIxiZwja</td><td>$2y$10$2WEjtjwekKO6FT8ebPTniuXaW5D4lL0amxiu9N.2i1DHpSQ7.yoA2</td></tr></tbody></table>', 10, '2024-09-06 22:21:18', NULL),
(1249, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'lestari@gmail.com login dengan IP Address 180.252.172.104', '', 31, '2024-09-06 22:21:28', NULL),
(1250, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah_categories/add-save', 'Tambah data baru Kertas pada Kategori Sampah', '', 31, '2024-09-06 22:21:40', NULL),
(1251, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah_categories/add-save', 'Tambah data baru Plastik pada Kategori Sampah', '', 31, '2024-09-06 22:21:46', NULL),
(1252, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Kardus pada Sampah', '', 31, '2024-09-06 22:22:04', NULL),
(1253, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Botol Plastik pada Sampah', '', 31, '2024-09-06 22:22:19', NULL),
(1254, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Buku pada Sampah', '', 31, '2024-09-06 22:22:52', NULL),
(1255, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/rewards/add-save', 'Tambah data baru Sapu pada Rewards', '', 31, '2024-09-06 22:23:24', NULL),
(1256, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/rewards/add-save', 'Tambah data baru Vas Bunga pada Rewards', '', 31, '2024-09-06 22:23:45', NULL),
(1257, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 31, '2024-09-06 22:27:26', NULL),
(1258, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/delete/49', 'Menghapus data 49 pada Tabungan Nasabah', '', 12, '2024-09-06 22:30:35', NULL),
(1259, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/nasabah/delete/54', 'Menghapus data rizki laksana pada Nasabah', '', 12, '2024-09-06 22:30:44', NULL),
(1260, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'karyapeduli@gmail.com keluar', '', 12, '2024-09-06 22:30:47', NULL),
(1261, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'madrasahRM@gmail.com login dengan IP Address 114.10.64.247', '', 13, '2024-09-06 22:30:54', NULL),
(1262, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/users/edit-save/13', 'Memperbaharui data BSU Madrasah Raudiatul Muta\'alimin pada Users Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>name</td><td>BSU Madrasah Raudiatul Mutaalimin</td><td>BSU Madrasah Raudiatul Muta\'alimin</td></tr><tr><td>password</td><td>$2y$10$9cvvUknNu8D3jLDvYUtaPuuYno5PnkuT0TThs8WwDjSWGmD6Jh8t6</td><td>$2y$10$nsU1uvEZbnr43u6TqCA69ePYsFxYYUoOMF3Tr3Yy5L4AHahsyv6z.</td></tr><tr><td>id_cms_privileges</td><td>4</td><td></td></tr></tbody></table>', 13, '2024-09-06 22:31:03', NULL),
(1263, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'madrasahRM@gmail.com keluar', '', 13, '2024-09-06 22:31:11', NULL),
(1264, '114.10.64.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'madrasahRM@gmail.com login dengan IP Address 114.10.64.247', '', 13, '2024-09-06 22:31:12', NULL),
(1265, '180.252.172.104', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'lestari@gmail.com keluar', '', 31, '2024-09-06 22:50:47', NULL),
(1266, '114.4.83.153', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/login', 'karyapeduli@gmail.com login dengan IP Address 114.4.83.153', '', 12, '2024-09-07 08:15:07', NULL),
(1267, '114.4.83.153', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'karyapeduli@gmail.com login dengan IP Address 114.4.83.153', '', 12, '2024-09-07 08:19:19', NULL),
(1268, '114.4.83.153', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'karyapeduli@gmail.com keluar', '', 12, '2024-09-07 08:20:01', NULL),
(1269, '114.4.83.153', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'admin_bankimam@gmail.com login dengan IP Address 114.4.83.153', '', 10, '2024-09-07 08:20:12', NULL),
(1270, '114.4.83.153', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'admin_bankimam@gmail.com keluar', '', 10, '2024-09-07 08:36:14', NULL),
(1271, '114.4.83.153', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 114.4.83.153', '', 5, '2024-09-07 08:40:08', NULL),
(1272, '114.4.83.153', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-07 08:41:07', NULL),
(1273, '114.4.83.153', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'bsu1@gmail.com keluar', '', 5, '2024-09-07 08:43:17', NULL),
(1274, '114.4.83.153', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'admin_bankimam@gmail.com login dengan IP Address 114.4.83.153', '', 10, '2024-09-07 08:43:26', NULL),
(1275, '114.4.83.153', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'admin_bankimam@gmail.com keluar', '', 10, '2024-09-07 08:44:47', NULL),
(1276, '114.4.83.153', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 114.4.83.153', '', 5, '2024-09-07 08:44:56', NULL),
(1277, '114.4.83.153', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'bsu1@gmail.com keluar', '', 5, '2024-09-07 09:01:35', NULL),
(1278, '114.4.83.153', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 114.4.83.153', '', 5, '2024-09-07 09:28:07', NULL),
(1279, '114.4.83.153', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah_categories/delete/7', 'Menghapus data Kertas pada Kategori Sampah', '', 5, '2024-09-07 09:29:37', NULL),
(1280, '114.4.83.153', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah_categories/add-save', 'Tambah data baru Kertas pada Kategori Sampah', '', 5, '2024-09-07 09:29:49', NULL),
(1281, '114.4.83.153', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Buku pada Sampah', '', 5, '2024-09-07 09:31:10', NULL),
(1282, '114.4.83.153', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-07 09:38:58', NULL),
(1283, '114.4.83.153', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-07 09:40:59', NULL),
(1284, '114.4.83.153', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-07 09:41:15', NULL),
(1285, '114.10.113.247', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/logout', 'karyapeduli@gmail.com keluar', '', 12, '2024-09-07 09:41:47', NULL),
(1286, '110.50.81.196', 'Mozilla/5.0 (Linux; Android 5.1.1; SM-G531H Build/LRX22C) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/3.0 Chrome/38.0.2125.102 Mobile Safari/537.36', 'https://bangimam.com/admin/logout', ' keluar', '', NULL, '2024-09-07 09:41:49', NULL),
(1287, '114.10.113.247', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/login', 'admin_bankimam@gmail.com login dengan IP Address 114.10.113.247', '', 10, '2024-09-07 09:41:55', NULL),
(1288, '114.4.83.153', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions_bsi/add-save', 'Tambah data baru  pada Transaksi BSI', '', 5, '2024-09-07 09:48:06', NULL),
(1289, '114.4.83.153', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions_bsi/add-save', 'Tambah data baru  pada Transaksi BSI', '', 5, '2024-09-07 09:50:00', NULL),
(1290, '114.10.113.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/rewards/delete/11', 'Menghapus data Vas Bunga pada Rewards', '', 5, '2024-09-07 10:00:15', NULL),
(1291, '114.10.113.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/rewards/add-save', 'Tambah data baru Vas Bunga pada Rewards', '', 5, '2024-09-07 10:01:33', NULL),
(1292, '114.10.113.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-07 10:17:06', NULL),
(1293, '114.10.113.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-07 10:18:17', NULL),
(1294, '114.10.113.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/rewards/edit-save/19', 'Memperbaharui data Sayur Hidroponik pada Rewards', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>description</td><td>Sayur Pakcoy</td><td>Penukaran akan dilakukan pada periode sampai dengan tanggal 19 september</td></tr></tbody></table>', 5, '2024-09-07 10:20:16', NULL),
(1295, '114.10.113.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/tukar_poins/edit-save/41', 'Memperbaharui data  pada Tukar Poin', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>status</td><td>Pending</td><td>On Proses</td></tr></tbody></table>', 5, '2024-09-07 10:37:06', NULL),
(1296, '114.10.113.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/tukar_poins/edit-save/41', 'Memperbaharui data  pada Tukar Poin', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>status</td><td>On Proses</td><td>Diterima</td></tr></tbody></table>', 5, '2024-09-07 10:38:10', NULL),
(1297, '114.10.113.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/rewards/delete/19', 'Menghapus data Sayur Hidroponik pada Rewards', '', 5, '2024-09-07 10:38:57', NULL),
(1298, '114.10.113.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/rewards/delete/12', 'Menghapus data Uang Cash pada Rewards', '', 5, '2024-09-07 10:38:58', NULL),
(1299, '114.10.113.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/rewards/delete/18', 'Menghapus data Sapu pada Rewards', '', 5, '2024-09-07 10:39:00', NULL),
(1300, '114.10.113.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/rewards/delete/20', 'Menghapus data Tempat Sampah pada Rewards', '', 5, '2024-09-07 10:39:02', NULL),
(1301, '114.10.113.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/rewards/delete/64', 'Menghapus data Vas Bunga pada Rewards', '', 5, '2024-09-07 10:39:04', NULL),
(1302, '114.10.113.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'bsu1@gmail.com keluar', '', 5, '2024-09-07 10:42:08', NULL),
(1303, '114.10.113.247', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'admin_bankimam@gmail.com login dengan IP Address 114.10.113.247', '', 10, '2024-09-07 10:44:09', NULL),
(1304, '112.215.235.66', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/login', 'sumberRejeki@gmail.com login dengan IP Address 112.215.235.66', '', 26, '2024-09-07 10:47:22', NULL),
(1305, '103.164.223.186', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/login', 'jack@gmail.com login dengan IP Address 103.164.223.186', '', 20, '2024-09-07 10:48:20', NULL),
(1306, '182.2.145.36', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/login', 'rptraMeruyaSelatan@gmail.com login dengan IP Address 182.2.145.36', '', 22, '2024-09-07 10:51:52', NULL),
(1307, '2400:9800:3b1:1610:eab:16:19d8:1b16', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/login', 'rptraManunggal@gmail.com login dengan IP Address 2400:9800:3b1:1610:eab:16:19d8:1b16', '', 25, '2024-09-07 10:52:14', NULL),
(1308, '114.10.117.127', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/login', 'rptraManuver@gmail.com login dengan IP Address 114.10.117.127', '', 23, '2024-09-07 10:52:19', NULL),
(1309, '112.215.235.66', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/login', 'sumberRejeki@gmail.com login dengan IP Address 112.215.235.66', '', 26, '2024-09-07 10:52:28', NULL),
(1310, '114.10.31.8', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/login', 'rptraMenara@gmail.com login dengan IP Address 114.10.31.8', '', 24, '2024-09-07 10:52:48', NULL),
(1311, '112.215.235.66', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/sampah_categories/add-save', 'Tambah data baru Besi pada Kategori Sampah', '', 26, '2024-09-07 10:56:00', NULL),
(1312, '112.215.235.66', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/sampah_categories/add-save', 'Tambah data baru Almunium pada Kategori Sampah', '', 26, '2024-09-07 10:56:53', NULL),
(1313, '114.10.24.131', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/login', 'anggrekBulan@gmail.com login dengan IP Address 114.10.24.131', '', 28, '2024-09-07 10:57:15', NULL),
(1314, '112.215.235.66', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/sampah_categories/add-save', 'Tambah data baru Almunium pada Kategori Sampah', '', 26, '2024-09-07 10:57:29', NULL),
(1315, '114.10.30.179', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/login', 'suryaMandiri@gmail.com login dengan IP Address 114.10.30.179', '', 17, '2024-09-07 10:58:15', NULL),
(1316, '112.215.235.66', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/sampah_categories/add-save', 'Tambah data baru Gabruk pada Kategori Sampah', '', 26, '2024-09-07 10:58:29', NULL),
(1317, '112.215.235.66', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/sampah_categories/add-save', 'Tambah data baru Kaleng pada Kategori Sampah', '', 26, '2024-09-07 10:58:55', NULL),
(1318, '112.215.235.66', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/sampah_categories/add-save', 'Tambah data baru Kabin pada Kategori Sampah', '', 26, '2024-09-07 10:59:28', NULL),
(1319, '112.215.235.66', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/sampah_categories/add-save', 'Tambah data baru Bodong A pada Kategori Sampah', '', 26, '2024-09-07 11:00:37', NULL),
(1320, '112.215.235.66', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/sampah_categories/add-save', 'Tambah data baru Gelas kopi pada Kategori Sampah', '', 26, '2024-09-07 11:02:42', NULL),
(1321, '114.10.30.179', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/login', 'suryaMandiri@gmail.com login dengan IP Address 114.10.30.179', '', 17, '2024-09-07 11:02:47', NULL),
(1322, '182.3.38.14', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/login', 'raflesia@gmail.com login dengan IP Address 182.3.38.14', '', 19, '2024-09-07 11:02:59', NULL),
(1323, '112.215.235.66', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/sampah_categories/add-save', 'Tambah data baru Gelas A pada Kategori Sampah', '', 26, '2024-09-07 11:03:20', NULL),
(1324, '112.215.235.66', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/sampah_categories/add-save', 'Tambah data baru Ember warna pada Kategori Sampah', '', 26, '2024-09-07 11:04:11', NULL),
(1325, '140.213.132.194', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/login', 'madrasahRM@gmail.com login dengan IP Address 140.213.132.194', '', 13, '2024-09-07 11:04:14', NULL),
(1326, '140.213.132.194', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/logout', 'madrasahRM@gmail.com keluar', '', 13, '2024-09-07 11:06:07', NULL),
(1327, '112.215.235.66', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/sampah_categories/add-save', 'Tambah data baru Inject pada Kategori Sampah', '', 26, '2024-09-07 11:06:13', NULL),
(1328, '120.188.6.20', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 120.188.6.20', '', 5, '2024-09-08 16:19:01', NULL),
(1329, '120.188.6.20', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 120.188.6.20', '', 5, '2024-09-08 16:19:57', NULL);
INSERT INTO `cms_logs` (`id`, `ipaddress`, `useragent`, `url`, `description`, `details`, `id_cms_users`, `created_at`, `updated_at`) VALUES
(1330, '120.188.6.20', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah_categories/add-save', 'Tambah data baru Besi pada Kategori Sampah', '', 5, '2024-09-08 16:59:08', NULL),
(1331, '120.188.6.20', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/rewards/add-save', 'Tambah data baru Vas Bunga pada Rewards', '', 5, '2024-09-08 18:51:49', NULL),
(1332, '120.188.6.20', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/delete/51', 'Menghapus data 51 pada Tabungan Nasabah', '', 5, '2024-09-08 20:50:12', NULL),
(1333, '120.188.6.20', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/delete/52', 'Menghapus data 52 pada Tabungan Nasabah', '', 5, '2024-09-08 20:50:15', NULL),
(1334, '120.188.6.20', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/delete/53', 'Menghapus data 53 pada Tabungan Nasabah', '', 5, '2024-09-08 20:50:19', NULL),
(1335, '114.10.28.38', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/tukar_poins/delete/41', 'Menghapus data 41 pada Tukar Poin', '', 5, '2024-09-08 22:19:26', NULL),
(1336, '114.10.28.38', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/tukar_poins/delete/40', 'Menghapus data 40 pada Tukar Poin', '', 5, '2024-09-08 22:19:28', NULL),
(1337, '114.10.28.38', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/tukar_poins/delete/39', 'Menghapus data 39 pada Tukar Poin', '', 5, '2024-09-08 22:19:30', NULL),
(1338, '114.10.28.38', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/tukar_poins/delete/37', 'Menghapus data 37 pada Tukar Poin', '', 5, '2024-09-08 22:19:35', NULL),
(1339, '114.10.28.38', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/tukar_saldo/delete/12', 'Menghapus data 12 pada Tukar Saldo', '', 5, '2024-09-08 22:37:04', NULL),
(1340, '114.10.28.38', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/tukar_saldo/delete/13', 'Menghapus data 13 pada Tukar Saldo', '', 5, '2024-09-08 22:37:06', NULL),
(1341, '114.10.28.38', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/tukar_saldo/delete/14', 'Menghapus data 14 pada Tukar Saldo', '', 5, '2024-09-08 22:37:09', NULL),
(1342, '114.10.28.38', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/tukar_saldo/delete/15', 'Menghapus data 15 pada Tukar Saldo', '', 5, '2024-09-08 22:37:10', NULL),
(1343, '114.10.113.98', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 114.10.113.98', '', 5, '2024-09-09 12:36:10', NULL),
(1344, '114.10.113.98', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/education/delete/1', 'Menghapus data 1 pada Konten Edukasi', '', 5, '2024-09-09 12:52:33', NULL),
(1345, '114.10.113.98', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/education/delete/3', 'Menghapus data 3 pada Konten Edukasi', '', 5, '2024-09-09 12:52:36', NULL),
(1346, '114.10.113.98', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/pengumuman/delete/5', 'Menghapus data Tukar sampah pada Pengumuman', '', 5, '2024-09-09 13:51:20', NULL),
(1347, '114.10.113.167', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 114.10.113.167', '', 5, '2024-09-11 10:45:00', NULL),
(1348, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 103.164.223.186', '', 5, '2024-09-21 08:31:08', NULL),
(1349, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/edit-save/6', 'Memperbaharui data Bodong A (botol plastik bening tanpa label dan tutup) pada Sampah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>name</td><td>Botol Plastik</td><td>Bodong A (botol plastik bening tanpa label dan tutup)</td></tr><tr><td>price_per_kg</td><td>500</td><td>5000</td></tr></tbody></table>', 5, '2024-09-21 08:47:01', NULL),
(1350, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/edit-save/7', 'Memperbaharui data Tutup Galon pada Sampah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>price_per_kg</td><td>300</td><td>6000</td></tr></tbody></table>', 5, '2024-09-21 08:52:45', NULL),
(1351, '114.10.31.115', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 114.10.31.115', '', 5, '2024-09-21 09:13:33', NULL),
(1352, '114.10.31.115', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/delete-image', 'Menghapus gambar Bodong A (botol plastik bening tanpa label dan tutup) pada Sampah', '', 5, '2024-09-21 09:14:53', NULL),
(1353, '114.10.31.115', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/rewards/delete-image', 'Menghapus gambar Vas Bunga pada Rewards', '', 5, '2024-09-21 09:15:12', NULL),
(1354, '114.10.31.115', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/rewards/edit-save/65', 'Memperbaharui data Vas Bunga pada Rewards', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>image</td><td></td><td>uploads/5/2024-09/pot_gemoy.png</td></tr></tbody></table>', 5, '2024-09-21 09:15:37', NULL),
(1355, '114.10.31.115', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/edit-save/6', 'Memperbaharui data Bodong A (botol plastik bening tanpa label dan tutup) pada Sampah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>image</td><td></td><td>uploads/5/2024-09/download.jpeg</td></tr></tbody></table>', 5, '2024-09-21 09:15:51', NULL),
(1356, '114.10.31.115', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/delete-image', 'Menghapus gambar Buku pada Sampah', '', 5, '2024-09-21 09:16:16', NULL),
(1357, '114.10.31.115', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/edit-save/78', 'Memperbaharui data Buku pada Sampah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>image</td><td></td><td>uploads/5/2024-09/buku.jpg</td></tr></tbody></table>', 5, '2024-09-21 09:16:20', NULL),
(1358, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Kertas Putih (kertas warna putih tanpa cover) pada Sampah', '', 5, '2024-09-21 11:26:44', NULL),
(1359, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Kardus pada Sampah', '', 5, '2024-09-21 11:27:56', NULL),
(1360, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Gelas A (Gelas aqua tanpa label) pada Sampah', '', 5, '2024-09-21 11:32:10', NULL),
(1361, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Gelas Kopi/B(Jenis berbahan plastik bening transparan berbentuk gelas) pada Sampah', '', 5, '2024-09-21 11:37:44', NULL),
(1362, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Bodong Kotor (Jenis botol plastik bening transparan bekas air mineral) pada Sampah', '', 5, '2024-09-21 11:40:55', NULL),
(1363, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Bodong B (Jenis botol plastik dan Label tidak bisa dihilangkan) pada Sampah', '', 5, '2024-09-21 11:42:34', NULL),
(1364, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Majalah pada Sampah', '', 5, '2024-09-21 11:43:25', NULL),
(1365, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Buku pada Sampah', '', 5, '2024-09-21 11:48:38', NULL),
(1366, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Tutup Botol pada Sampah', '', 5, '2024-09-21 11:49:25', NULL),
(1367, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah_categories/add-save', 'Tambah data baru Alumunium pada Kategori Sampah', '', 5, '2024-09-21 12:27:00', NULL),
(1368, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Alumunium Rongsok pada Sampah', '', 5, '2024-09-21 12:27:51', NULL),
(1369, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Ember Warna (Jenis berbahan plastik, lentur, bermacam-macam warna) pada Sampah', '', 5, '2024-09-21 12:28:57', NULL),
(1370, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Naso (Jenis berbahan Plastik berwarna putih susu/buram) pada Sampah', '', 5, '2024-09-21 12:30:47', NULL),
(1371, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Bodong Warna (Jenis botol plastik Berwarna biru dan hijau.) pada Sampah', '', 5, '2024-09-21 12:32:35', NULL),
(1372, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Kaleng pada Sampah', '', 5, '2024-09-21 12:34:45', NULL),
(1373, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Ember Hitam (Jenis berbahan plastik, lentur, berwarna hitam) pada Sampah', '', 5, '2024-09-21 12:35:49', NULL),
(1374, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah_categories/add-save', 'Tambah data baru lain-lain pada Kategori Sampah', '', 5, '2024-09-21 12:36:41', NULL),
(1375, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Beling pada Sampah', '', 5, '2024-09-21 12:37:31', NULL),
(1376, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Inject (Jenis berbahan plastik bening, transparan, tebal,lentur) pada Sampah', '', 5, '2024-09-21 12:38:45', NULL),
(1377, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Impact (Jenis bahan plastik padat ,keras, berwarna dan berbunyi krek) pada Sampah', '', 5, '2024-09-21 12:40:21', NULL),
(1378, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Besi pada Sampah', '', 5, '2024-09-21 12:45:41', NULL),
(1379, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Gabruk (sampah 3R campur) pada Sampah', '', 5, '2024-09-21 12:50:15', NULL),
(1380, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru boncos/duplex pada Sampah', '', 5, '2024-09-21 12:53:06', NULL),
(1381, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/edit-save/99', 'Memperbaharui data Asoy/kresek pada Sampah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>name</td><td>boncos/duplex</td><td>Asoy/kresek</td></tr></tbody></table>', 5, '2024-09-21 12:54:57', NULL),
(1382, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Duplek/Boncos (kardus nasi) pada Sampah', '', 5, '2024-09-21 12:57:30', NULL),
(1383, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Le Mineral pada Sampah', '', 5, '2024-09-21 12:59:17', NULL),
(1384, '114.10.31.115', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 114.10.31.115', '', 5, '2024-09-21 12:59:27', NULL),
(1385, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Paralon pada Sampah', '', 5, '2024-09-21 13:06:52', NULL),
(1386, '114.10.31.115', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/edit-save/6', 'Memperbaharui data Bodong A pada Sampah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>name</td><td>Bodong A (botol plastik bening tanpa label dan tutup)</td><td>Bodong A</td></tr><tr><td>deskripsi</td><td></td><td>botol plastik bening tanpa label dan tutup</td></tr></tbody></table>', 5, '2024-09-21 13:11:36', NULL),
(1387, '114.10.31.115', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/edit-save/79', 'Memperbaharui data Kertas Putih pada Sampah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>name</td><td>Kertas Putih (kertas warna putih tanpa cover)</td><td>Kertas Putih</td></tr><tr><td>deskripsi</td><td></td><td>kertas warna putih tanpa cover</td></tr></tbody></table>', 5, '2024-09-21 13:11:56', NULL),
(1388, '114.10.31.115', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/edit-save/81', 'Memperbaharui data Gelas A pada Sampah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>name</td><td>Gelas A (Gelas aqua tanpa label)</td><td>Gelas A</td></tr><tr><td>deskripsi</td><td></td><td>Gelas aqua tanpa label</td></tr></tbody></table>', 5, '2024-09-21 13:12:08', NULL),
(1389, '114.10.31.115', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/edit-save/82', 'Memperbaharui data Gelas Kopi/B pada Sampah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>name</td><td>Gelas Kopi/B(Jenis berbahan plastik bening transparan berbentuk gelas)</td><td>Gelas Kopi/B</td></tr><tr><td>deskripsi</td><td></td><td>Jenis berbahan plastik bening transparan berbentuk gelas</td></tr></tbody></table>', 5, '2024-09-21 13:12:27', NULL),
(1390, '114.10.31.115', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/edit-save/83', 'Memperbaharui data Bodong Kotor pada Sampah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>name</td><td>Bodong Kotor (Jenis botol plastik bening transparan bekas air mineral)</td><td>Bodong Kotor</td></tr><tr><td>deskripsi</td><td></td><td>Jenis botol plastik bening transparan bekas air mineral</td></tr></tbody></table>', 5, '2024-09-21 13:12:43', NULL),
(1391, '114.10.31.115', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/edit-save/84', 'Memperbaharui data Bodong B pada Sampah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>name</td><td>Bodong B (Jenis botol plastik dan Label tidak bisa dihilangkan)</td><td>Bodong B</td></tr><tr><td>deskripsi</td><td></td><td>Jenis botol plastik dan Label tidak bisa dihilangkan</td></tr></tbody></table>', 5, '2024-09-21 13:12:57', NULL),
(1392, '114.10.31.115', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/edit-save/89', 'Memperbaharui data Ember Warna pada Sampah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>name</td><td>Ember Warna (Jenis berbahan plastik, lentur, bermacam-macam warna)</td><td>Ember Warna</td></tr><tr><td>deskripsi</td><td></td><td>Jenis berbahan plastik, lentur, bermacam-macam warna</td></tr></tbody></table>', 5, '2024-09-21 13:13:08', NULL),
(1393, '114.10.31.115', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/edit-save/90', 'Memperbaharui data Naso pada Sampah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>name</td><td>Naso (Jenis berbahan Plastik berwarna putih susu/buram)</td><td>Naso</td></tr><tr><td>deskripsi</td><td></td><td>Jenis berbahan Plastik berwarna putih susu/buram</td></tr></tbody></table>', 5, '2024-09-21 13:13:20', NULL),
(1394, '114.10.31.115', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/edit-save/91', 'Memperbaharui data Bodong Warna pada Sampah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>name</td><td>Bodong Warna (Jenis botol plastik Berwarna biru dan hijau.)</td><td>Bodong Warna</td></tr><tr><td>deskripsi</td><td></td><td>Jenis botol plastik Berwarna biru dan hijau.</td></tr></tbody></table>', 5, '2024-09-21 13:13:30', NULL),
(1395, '114.10.31.115', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/edit-save/93', 'Memperbaharui data Ember Hitam pada Sampah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>name</td><td>Ember Hitam (Jenis berbahan plastik, lentur, berwarna hitam)</td><td>Ember Hitam</td></tr><tr><td>deskripsi</td><td></td><td>Jenis berbahan plastik, lentur, berwarna hitam</td></tr></tbody></table>', 5, '2024-09-21 13:13:42', NULL),
(1396, '114.10.31.115', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/edit-save/95', 'Memperbaharui data Inject pada Sampah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>name</td><td>Inject (Jenis berbahan plastik bening, transparan, tebal,lentur)</td><td>Inject</td></tr><tr><td>deskripsi</td><td></td><td>Jenis berbahan plastik bening, transparan, tebal,lentur</td></tr></tbody></table>', 5, '2024-09-21 13:14:08', NULL),
(1397, '114.10.31.115', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/edit-save/96', 'Memperbaharui data Impact pada Sampah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>name</td><td>Impact (Jenis bahan plastik padat ,keras, berwarna dan berbunyi krek)</td><td>Impact</td></tr><tr><td>deskripsi</td><td></td><td>Jenis bahan plastik padat ,keras, berwarna dan berbunyi krek</td></tr></tbody></table>', 5, '2024-09-21 13:14:17', NULL),
(1398, '114.10.31.115', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/edit-save/98', 'Memperbaharui data Gabruk pada Sampah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>name</td><td>Gabruk (sampah 3R campur)</td><td>Gabruk</td></tr><tr><td>deskripsi</td><td></td><td>sampah 3R campur</td></tr></tbody></table>', 5, '2024-09-21 13:14:28', NULL),
(1399, '114.10.31.115', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/edit-save/100', 'Memperbaharui data Duplek/Boncos pada Sampah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>name</td><td>Duplek/Boncos (kardus nasi)</td><td>Duplek/Boncos</td></tr><tr><td>deskripsi</td><td></td><td>kardus nasi</td></tr></tbody></table>', 5, '2024-09-21 13:14:37', NULL),
(1400, '114.10.31.115', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/edit-save/100', 'Memperbaharui data Duplek/Boncos pada Sampah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody></tbody></table>', 5, '2024-09-21 13:16:13', NULL),
(1401, '114.10.31.115', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/edit-save/98', 'Memperbaharui data Gabruk pada Sampah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody></tbody></table>', 5, '2024-09-21 13:17:12', NULL),
(1402, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/pengumuman/add-save', 'Tambah data baru Pengumpulan Sampah pada Pengumuman', '', 5, '2024-09-21 13:27:25', NULL),
(1403, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/nasabah/edit-save/58', 'Memperbaharui data Anton S pada Nasabah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>username</td><td>Mercu</td><td>Anton S</td></tr><tr><td>password</td><td>$2y$10$KVL9LBsHUGgfRw4mnLV10u9de3Ocqtnl8YEV8uaNch12aJAUmoJjy</td><td></td></tr><tr><td>cms_user_id</td><td>5</td><td></td></tr><tr><td>phone_number</td><td>112233122</td><td>081344198794</td></tr><tr><td>picture</td><td>/uploads/profile/1725676463_IMG_20230626_163656.jpg</td><td></td></tr></tbody></table>', 5, '2024-09-21 13:29:01', NULL),
(1404, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/nasabah/edit-save/58', 'Memperbaharui data Anton S pada Nasabah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>password</td><td>$2y$10$KVL9LBsHUGgfRw4mnLV10u9de3Ocqtnl8YEV8uaNch12aJAUmoJjy</td><td>$2y$10$eH/WCfgH9/mtSvHPyXMk1uMRD/ES8ZVOwuWfVxUc9QnOc2E3DwV9K</td></tr><tr><td>cms_user_id</td><td>5</td><td></td></tr><tr><td>picture</td><td></td><td>uploads/5/2024-09/64139_mountain_bicycle_tattoo_bike_cycling_biking_downhill.png</td></tr><tr><td>email_verified_at</td><td></td><td></td></tr><tr><td>remember_token</td><td></td><td></td></tr></tbody></table>', 5, '2024-09-21 13:30:47', NULL),
(1405, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/edit-save/80', 'Memperbaharui data Kardus pada Sampah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>deskripsi</td><td></td><td></td></tr><tr><td>price_per_kg</td><td>1500</td><td>1600</td></tr></tbody></table>', 5, '2024-09-21 13:34:16', NULL),
(1406, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-21 13:35:16', NULL),
(1407, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/edit-save/57', 'Memperbaharui data  pada Tabungan Nasabah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>sampah_id</td><td>80</td><td>6</td></tr><tr><td>total_weight</td><td>10.55</td><td>1.7</td></tr><tr><td>total_income</td><td>16880</td><td>8500</td></tr><tr><td>point_received</td><td>1055</td><td>170</td></tr></tbody></table>', 5, '2024-09-21 13:36:06', NULL),
(1408, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/delete/57', 'Menghapus data 57 pada Tabungan Nasabah', '', 5, '2024-09-21 13:36:44', NULL),
(1409, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-21 13:37:20', NULL),
(1410, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-21 13:37:58', NULL),
(1411, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-21 13:38:50', NULL),
(1412, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-21 13:39:35', NULL),
(1413, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-21 13:40:20', NULL),
(1414, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-21 13:41:05', NULL),
(1415, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-21 13:43:21', NULL),
(1416, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-21 13:52:41', NULL),
(1417, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/edit-save/79', 'Memperbaharui data Kertas Putih pada Sampah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>price_per_kg</td><td>1600</td><td>1500</td></tr></tbody></table>', 5, '2024-09-21 13:55:12', NULL),
(1418, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/edit-save/62', 'Memperbaharui data  pada Tabungan Nasabah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody></tbody></table>', 5, '2024-09-21 13:56:38', NULL),
(1419, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/delete/62', 'Menghapus data 62 pada Tabungan Nasabah', '', 5, '2024-09-21 13:56:48', NULL),
(1420, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-21 13:57:18', NULL),
(1421, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/edit-save/95', 'Memperbaharui data Inject pada Sampah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>price_per_kg</td><td>3600</td><td>3300</td></tr></tbody></table>', 5, '2024-09-21 14:13:26', NULL),
(1422, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/delete/65', 'Menghapus data 65 pada Tabungan Nasabah', '', 5, '2024-09-21 14:13:47', NULL),
(1423, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-21 14:14:23', NULL),
(1424, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/delete/55', 'Menghapus data 55 pada Tabungan Nasabah', '', 5, '2024-09-21 14:22:11', NULL),
(1425, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/delete/56', 'Menghapus data 56 pada Tabungan Nasabah', '', 5, '2024-09-21 14:22:32', NULL),
(1426, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/delete/54', 'Menghapus data 54 pada Tabungan Nasabah', '', 5, '2024-09-21 14:23:13', NULL),
(1427, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'bsu1@gmail.com keluar', '', 5, '2024-09-21 14:24:20', NULL),
(1428, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 103.164.223.186', '', 5, '2024-09-21 14:25:35', NULL),
(1429, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/pengumuman/edit-save/8', 'Memperbaharui data Pengumpulan Sampah pada Pengumuman', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>status</td><td>Selesai</td><td>On Proses</td></tr></tbody></table>', 5, '2024-09-21 14:53:58', NULL),
(1430, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'bsu1@gmail.com keluar', '', 5, '2024-09-21 15:03:12', NULL),
(1431, '114.10.115.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 114.10.115.7', '', 5, '2024-09-21 15:11:09', NULL),
(1432, '114.10.115.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/edit-save/67', 'Memperbaharui data  pada Tabungan Nasabah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>total_weight</td><td>1.2</td><td>2.4</td></tr><tr><td>total_income</td><td>3960</td><td>7920</td></tr><tr><td>point_received</td><td>120</td><td>240</td></tr></tbody></table>', 5, '2024-09-21 15:11:34', NULL),
(1433, '114.10.115.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/edit-save/67', 'Memperbaharui data  pada Tabungan Nasabah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>total_weight</td><td>2.4</td><td>5.5</td></tr><tr><td>total_income</td><td>7920</td><td>18150</td></tr><tr><td>point_received</td><td>240</td><td>550</td></tr></tbody></table>', 5, '2024-09-21 15:11:47', NULL),
(1434, '114.10.115.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/edit-save/67', 'Memperbaharui data  pada Tabungan Nasabah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>total_weight</td><td>5.5</td><td>10</td></tr><tr><td>total_income</td><td>18150</td><td>33000</td></tr><tr><td>point_received</td><td>550</td><td>1000</td></tr></tbody></table>', 5, '2024-09-21 15:11:58', NULL),
(1435, '114.10.115.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/edit-save/67', 'Memperbaharui data  pada Tabungan Nasabah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>total_weight</td><td>10</td><td>2</td></tr><tr><td>total_income</td><td>33000</td><td>6600</td></tr><tr><td>point_received</td><td>1000</td><td>200</td></tr></tbody></table>', 5, '2024-09-21 15:12:22', NULL),
(1436, '114.10.115.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/edit-save/67', 'Memperbaharui data  pada Tabungan Nasabah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>total_weight</td><td>2</td><td>2.3</td></tr><tr><td>total_income</td><td>6600</td><td>7590</td></tr><tr><td>point_received</td><td>200</td><td>230</td></tr></tbody></table>', 5, '2024-09-21 15:21:51', NULL),
(1437, '114.10.115.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-21 15:41:46', NULL),
(1438, '114.10.115.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/delete/68', 'Menghapus data 68 pada Tabungan Nasabah', '', 5, '2024-09-21 15:42:02', NULL),
(1439, '114.10.115.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-21 15:42:36', NULL),
(1440, '114.10.115.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/delete/69', 'Menghapus data 69 pada Tabungan Nasabah', '', 5, '2024-09-21 15:43:10', NULL),
(1441, '114.10.115.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-21 15:45:30', NULL),
(1442, '114.10.115.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/delete/70', 'Menghapus data 70 pada Tabungan Nasabah', '', 5, '2024-09-21 15:45:33', NULL),
(1443, '114.10.115.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-21 15:46:06', NULL),
(1444, '114.10.115.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/delete/71', 'Menghapus data 71 pada Tabungan Nasabah', '', 5, '2024-09-21 15:46:15', NULL),
(1445, '114.10.115.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-21 15:47:06', NULL),
(1446, '114.10.115.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/delete/72', 'Menghapus data 72 pada Tabungan Nasabah', '', 5, '2024-09-21 15:47:09', NULL),
(1447, '114.10.115.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-21 15:50:18', NULL),
(1448, '114.10.115.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/delete/73', 'Menghapus data 73 pada Tabungan Nasabah', '', 5, '2024-09-21 15:50:27', NULL),
(1449, '114.10.115.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/delete/73', 'Menghapus data 73 pada Tabungan Nasabah', '', 5, '2024-09-21 15:52:09', NULL),
(1450, '114.10.115.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-21 15:52:24', NULL),
(1451, '114.10.115.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/delete/74', 'Menghapus data 74 pada Tabungan Nasabah', '', 5, '2024-09-21 15:52:40', NULL),
(1452, '114.10.115.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/tukar_poins/delete/38', 'Menghapus data 38 pada Tukar Poin', '', 5, '2024-09-21 16:07:25', NULL),
(1453, '114.10.115.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/tukar_poins/delete/38', 'Menghapus data 38 pada Tukar Poin', '', 5, '2024-09-21 16:08:22', NULL),
(1454, '114.10.115.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/tukar_poins/delete/38', 'Menghapus data 38 pada Tukar Poin', '', 5, '2024-09-21 16:08:56', NULL),
(1455, '114.10.115.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/tukar_poins/delete/38', 'Menghapus data 38 pada Tukar Poin', '', 5, '2024-09-21 16:10:19', NULL),
(1456, '114.10.115.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/tukar_poins/delete/42', 'Menghapus data 42 pada Tukar Poin', '', 5, '2024-09-21 16:10:33', NULL),
(1457, '114.10.115.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/tukar_poins/delete/43', 'Menghapus data 43 pada Tukar Poin', '', 5, '2024-09-21 16:10:36', NULL),
(1458, '114.10.115.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-21 16:11:22', NULL),
(1459, '114.10.115.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/rewards/edit-save/65', 'Memperbaharui data Vas Bunga pada Rewards', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>stock</td><td>0</td><td>10</td></tr></tbody></table>', 5, '2024-09-21 16:11:56', NULL),
(1460, '114.10.115.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/tukar_poins/delete/44', 'Menghapus data 44 pada Tukar Poin', '', 5, '2024-09-21 16:15:02', NULL),
(1461, '114.10.115.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/tukar_poins/delete/45', 'Menghapus data 45 pada Tukar Poin', '', 5, '2024-09-21 16:18:32', NULL),
(1462, '114.10.115.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 114.10.115.7', '', 5, '2024-09-21 18:54:04', NULL),
(1463, '114.10.115.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/tukar_saldo/delete/16', 'Menghapus data 16 pada Tukar Saldo', '', 5, '2024-09-21 18:54:11', NULL),
(1464, '114.10.115.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/tukar_saldo/delete/18', 'Menghapus data 18 pada Tukar Saldo', '', 5, '2024-09-21 18:54:14', NULL),
(1465, '114.10.115.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/rewards/add-save', 'Tambah data baru Uang Cash pada Rewards', '', 5, '2024-09-21 18:54:44', NULL),
(1466, '114.10.115.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/rewards/delete/66', 'Menghapus data Uang Cash pada Rewards', '', 5, '2024-09-21 18:56:59', NULL),
(1467, '114.10.115.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/rewards/delete/65', 'Menghapus data Vas Bunga pada Rewards', '', 5, '2024-09-21 18:59:07', NULL),
(1468, '114.10.115.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/rewards/add-save', 'Tambah data baru Vas Bunga pada Rewards', '', 5, '2024-09-21 18:59:44', NULL),
(1469, '114.10.115.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/tukar_poins/edit-save/46', 'Memperbaharui data  pada Tukar Poin', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>reward_id</td><td>65</td><td>67</td></tr><tr><td>status</td><td>Pending</td><td>On Proses</td></tr></tbody></table>', 5, '2024-09-21 19:00:01', NULL),
(1470, '114.10.115.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/tukar_poins/edit-save/46', 'Memperbaharui data  pada Tukar Poin', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody></tbody></table>', 5, '2024-09-21 19:00:08', NULL),
(1471, '114.10.115.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/tukar_poins/delete/46', 'Menghapus data 46 pada Tukar Poin', '', 5, '2024-09-21 19:00:37', NULL),
(1472, '114.10.115.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/rewards/add-save', 'Tambah data baru Uang Cash pada Rewards', '', 5, '2024-09-21 19:01:37', NULL),
(1473, '114.10.115.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/delete/75', 'Menghapus data 75 pada Tabungan Nasabah', '', 5, '2024-09-21 19:04:50', NULL),
(1474, '114.10.115.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-21 19:08:26', NULL);
INSERT INTO `cms_logs` (`id`, `ipaddress`, `useragent`, `url`, `description`, `details`, `id_cms_users`, `created_at`, `updated_at`) VALUES
(1475, '114.10.115.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/tukar_saldo/edit-save/19', 'Memperbaharui data  pada Tukar Saldo', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>reward_id</td><td>68</td><td>67</td></tr></tbody></table>', 5, '2024-09-21 19:09:35', NULL),
(1476, '114.10.115.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/tukar_saldo/edit-save/19', 'Memperbaharui data  pada Tukar Saldo', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>reward_id</td><td>67</td><td>68</td></tr></tbody></table>', 5, '2024-09-21 19:09:42', NULL),
(1477, '114.10.115.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/tukar_saldo/edit-save/19', 'Memperbaharui data  pada Tukar Saldo', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>status</td><td>Pending</td><td>Diterima</td></tr></tbody></table>', 5, '2024-09-21 19:09:48', NULL),
(1478, '114.10.115.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/delete/76', 'Menghapus data 76 pada Tabungan Nasabah', '', 5, '2024-09-21 19:10:38', NULL),
(1479, '114.10.115.7', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/tukar_saldo/delete/19', 'Menghapus data 19 pada Tukar Saldo', '', 5, '2024-09-21 19:10:55', NULL),
(1480, '114.10.64.92', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 114.10.64.92', '', 5, '2024-09-21 21:12:15', NULL),
(1481, '114.10.64.92', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'bsu1@gmail.com keluar', '', 5, '2024-09-21 21:12:35', NULL),
(1482, '114.10.64.92', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'admin@crudbooster.com login dengan IP Address 114.10.64.92', '', 1, '2024-09-21 21:12:41', NULL),
(1483, '114.10.64.92', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'admin@crudbooster.com keluar', '', 1, '2024-09-21 21:15:17', NULL),
(1484, '114.10.64.92', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 114.10.64.92', '', 5, '2024-09-21 21:15:20', NULL),
(1485, '114.10.64.92', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 114.10.64.92', '', 5, '2024-09-21 21:27:13', NULL),
(1486, '114.4.82.223', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'admin_bankimam@gmail.com login dengan IP Address 114.4.82.223', '', 10, '2024-09-22 15:30:58', NULL),
(1487, '114.4.82.223', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'admin_bankimam@gmail.com keluar', '', 10, '2024-09-22 15:31:13', NULL),
(1488, '114.4.82.223', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'sumberRejeki@gmail.com login dengan IP Address 114.4.82.223', '', 26, '2024-09-22 15:31:20', NULL),
(1489, '114.4.82.223', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'sumberRejeki@gmail.com keluar', '', 26, '2024-09-22 15:32:14', NULL),
(1490, '114.4.82.223', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'admin_bankimam@gmail.com login dengan IP Address 114.4.82.223', '', 10, '2024-09-22 15:35:14', NULL),
(1491, '2001:448a:20b1:5227:71a1:3ce7:144d:9f2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 2001:448a:20b1:5227:71a1:3ce7:144d:9f2', '', 5, '2024-09-22 19:37:21', NULL),
(1492, '2001:448a:20b1:5227:71a1:3ce7:144d:9f2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/nasabah/edit-save/58', 'Memperbaharui data Anton S pada Nasabah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>password</td><td>$2y$10$eH/WCfgH9/mtSvHPyXMk1uMRD/ES8ZVOwuWfVxUc9QnOc2E3DwV9K</td><td>$2y$10$6m4oQAx3jlhblLzEBEtRle1TKMOLdrR/eIwg0VxJ4C/bSNg2beWuO</td></tr><tr><td>cms_user_id</td><td>5</td><td></td></tr><tr><td>email_verified_at</td><td></td><td></td></tr><tr><td>remember_token</td><td></td><td></td></tr></tbody></table>', 5, '2024-09-22 19:43:30', NULL),
(1493, '2001:448a:20b1:5227:71a1:3ce7:144d:9f2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-22 19:55:35', NULL),
(1494, '2001:448a:20b1:5227:71a1:3ce7:144d:9f2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-22 19:57:08', NULL),
(1495, '2001:448a:20b1:5227:71a1:3ce7:144d:9f2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/edit-save/98', 'Memperbaharui data Gabruk pada Sampah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>price_per_kg</td><td>800</td><td>1000</td></tr></tbody></table>', 5, '2024-09-22 19:58:16', NULL),
(1496, '2001:448a:20b1:5227:71a1:3ce7:144d:9f2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-22 19:58:43', NULL),
(1497, '2001:448a:20b1:5227:71a1:3ce7:144d:9f2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-22 19:59:12', NULL),
(1498, '2001:448a:20b1:5227:71a1:3ce7:144d:9f2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-22 19:59:52', NULL),
(1499, '2001:448a:20b1:5227:71a1:3ce7:144d:9f2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/edit-save/77', 'Memperbaharui data  pada Tabungan Nasabah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>periode</td><td>09/7/2024</td><td>09/6/2024</td></tr></tbody></table>', 5, '2024-09-22 20:00:10', NULL),
(1500, '2001:448a:20b1:5227:71a1:3ce7:144d:9f2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/rewards/edit-save/67', 'Memperbaharui data Vas Bunga pada Rewards', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>price</td><td>1000</td><td>0</td></tr></tbody></table>', 5, '2024-09-22 20:03:24', NULL),
(1501, '2001:448a:20b1:5227:71a1:3ce7:144d:9f2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-22 20:14:08', NULL),
(1502, '2001:448a:20b1:5227:71a1:3ce7:144d:9f2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-22 20:21:36', NULL),
(1503, '2001:448a:20b1:5227:71a1:3ce7:144d:9f2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-22 20:22:41', NULL),
(1504, '2001:448a:20b1:5227:71a1:3ce7:144d:9f2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/delete/78', 'Menghapus data Buku pada Sampah', '', 5, '2024-09-22 20:23:46', NULL),
(1505, '2001:448a:20b1:5227:71a1:3ce7:144d:9f2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/edit-save/86', 'Memperbaharui data Buku pada Sampah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>deskripsi</td><td></td><td></td></tr><tr><td>price_per_kg</td><td>1000</td><td>800</td></tr></tbody></table>', 5, '2024-09-22 20:24:01', NULL),
(1506, '2001:448a:20b1:5227:71a1:3ce7:144d:9f2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-22 20:24:35', NULL),
(1507, '2001:448a:20b1:5227:71a1:3ce7:144d:9f2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-22 20:25:20', NULL),
(1508, '2001:448a:20b1:5227:71a1:3ce7:144d:9f2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-22 20:25:45', NULL),
(1509, '2001:448a:20b1:5227:71a1:3ce7:144d:9f2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-22 20:26:17', NULL),
(1510, '2001:448a:20b1:5227:71a1:3ce7:144d:9f2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-22 20:26:47', NULL),
(1511, '2001:448a:20b1:5227:71a1:3ce7:144d:9f2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-22 20:27:14', NULL),
(1512, '2001:448a:20b1:5227:71a1:3ce7:144d:9f2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-22 20:27:52', NULL),
(1513, '2001:448a:20b1:5227:71a1:3ce7:144d:9f2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-22 20:28:19', NULL),
(1514, '2001:448a:20b1:5227:71a1:3ce7:144d:9f2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/tukar_saldo/add-save', 'Tambah data baru  pada Tukar Saldo', '', 5, '2024-09-22 20:32:09', NULL),
(1515, '2001:448a:20b1:5227:71a1:3ce7:144d:9f2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions_bsi/delete/19', 'Menghapus data 19 pada Transaksi BSI', '', 5, '2024-09-22 20:34:49', NULL),
(1516, '2001:448a:20b1:5227:71a1:3ce7:144d:9f2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions_bsi/delete/20', 'Menghapus data 20 pada Transaksi BSI', '', 5, '2024-09-22 20:34:52', NULL),
(1517, '2001:448a:20b1:5227:71a1:3ce7:144d:9f2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions_bsi/delete/25', 'Menghapus data 25 pada Transaksi BSI', '', 5, '2024-09-22 20:34:54', NULL),
(1518, '2001:448a:20b1:5227:71a1:3ce7:144d:9f2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/tukar_saldo/edit-save/20', 'Memperbaharui data  pada Tukar Saldo', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>quantity</td><td>4</td><td>1</td></tr></tbody></table>', 5, '2024-09-22 20:52:39', NULL),
(1519, '2001:448a:20b1:5227:71a1:3ce7:144d:9f2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/edit-save/6', 'Memperbaharui data Bodong A pada Sampah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>price_per_kg</td><td>5000</td><td>4600</td></tr></tbody></table>', 5, '2024-09-22 20:59:27', NULL),
(1520, '2001:448a:20b1:5227:71a1:3ce7:144d:9f2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-22 21:00:46', NULL),
(1521, '2001:448a:20b1:5227:71a1:3ce7:144d:9f2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-22 21:01:25', NULL),
(1522, '2001:448a:20b1:5227:71a1:3ce7:144d:9f2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-22 21:01:59', NULL),
(1523, '2001:448a:20b1:5227:71a1:3ce7:144d:9f2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-22 21:02:22', NULL),
(1524, '2001:448a:20b1:5227:71a1:3ce7:144d:9f2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-22 21:02:52', NULL),
(1525, '2001:448a:20b1:5227:71a1:3ce7:144d:9f2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-22 21:03:48', NULL),
(1526, '2001:448a:20b1:5227:71a1:3ce7:144d:9f2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-22 21:07:28', NULL),
(1527, '2001:448a:20b1:5227:71a1:3ce7:144d:9f2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-22 21:07:56', NULL),
(1528, '2001:448a:20b1:5227:71a1:3ce7:144d:9f2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-22 21:08:30', NULL),
(1529, '2001:448a:20b1:5227:71a1:3ce7:144d:9f2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-22 21:08:53', NULL),
(1530, '2001:448a:20b1:5227:71a1:3ce7:144d:9f2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-22 21:09:52', NULL),
(1531, '2001:448a:20b1:5227:71a1:3ce7:144d:9f2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-22 21:12:07', NULL),
(1532, '2001:448a:20b1:5227:71a1:3ce7:144d:9f2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-22 21:12:35', NULL),
(1533, '2001:448a:20b1:5227:71a1:3ce7:144d:9f2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-22 21:13:30', NULL),
(1534, '2001:448a:20b1:5227:71a1:3ce7:144d:9f2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-22 21:13:52', NULL),
(1535, '2001:448a:20b1:5227:71a1:3ce7:144d:9f2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-22 21:14:46', NULL),
(1536, '2001:448a:20b1:5227:71a1:3ce7:144d:9f2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-22 21:15:08', NULL),
(1537, '2001:448a:20b1:5227:71a1:3ce7:144d:9f2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-22 21:15:39', NULL),
(1538, '2001:448a:20b1:5227:71a1:3ce7:144d:9f2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-22 21:16:34', NULL),
(1539, '2001:448a:20b1:5227:71a1:3ce7:144d:9f2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-22 21:17:08', NULL),
(1540, '2001:448a:20b1:5227:71a1:3ce7:144d:9f2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/edit-save/6', 'Memperbaharui data Bodong A pada Sampah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>price_per_kg</td><td>4600</td><td>5000</td></tr></tbody></table>', 5, '2024-09-22 21:18:01', NULL),
(1541, '2001:448a:20b1:5227:71a1:3ce7:144d:9f2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-22 21:19:39', NULL),
(1542, '2001:448a:20b1:5227:71a1:3ce7:144d:9f2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-22 21:20:04', NULL),
(1543, '2001:448a:20b1:5227:71a1:3ce7:144d:9f2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-22 21:20:59', NULL),
(1544, '2001:448a:20b1:5227:71a1:3ce7:144d:9f2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-22 21:21:17', NULL),
(1545, '2001:448a:20b1:5227:71a1:3ce7:144d:9f2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-22 21:21:41', NULL),
(1546, '2001:448a:20b1:5227:71a1:3ce7:144d:9f2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-22 21:22:23', NULL),
(1547, '2001:448a:20b1:5227:71a1:3ce7:144d:9f2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/edit-save/90', 'Memperbaharui data Naso pada Sampah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>price_per_kg</td><td>3400</td><td>3200</td></tr></tbody></table>', 5, '2024-09-22 21:25:00', NULL),
(1548, '2001:448a:20b1:5227:71a1:3ce7:144d:9f2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-22 21:25:35', NULL),
(1549, '2001:448a:20b1:5227:71a1:3ce7:144d:9f2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-22 21:26:15', NULL),
(1550, '2001:448a:20b1:5227:71a1:3ce7:144d:9f2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-22 21:26:33', NULL),
(1551, '2001:448a:20b1:5227:71a1:3ce7:144d:9f2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-22 21:26:59', NULL),
(1552, '2001:448a:20b1:5227:71a1:3ce7:144d:9f2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-22 21:27:41', NULL),
(1553, '2001:448a:20b1:5227:71a1:3ce7:144d:9f2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-22 21:28:14', NULL),
(1554, '2001:448a:20b1:5227:71a1:3ce7:144d:9f2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-22 21:28:34', NULL),
(1555, '2001:448a:20b1:5227:71a1:3ce7:144d:9f2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/edit-save/100', 'Memperbaharui data Duplek/Boncos pada Sampah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>price_per_kg</td><td>500</td><td>560</td></tr></tbody></table>', 5, '2024-09-22 21:29:30', NULL),
(1556, '2001:448a:20b1:5227:71a1:3ce7:144d:9f2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-22 21:30:07', NULL),
(1557, '2001:448a:20b1:5227:71a1:3ce7:144d:9f2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-22 21:30:29', NULL),
(1558, '2001:448a:20b1:5227:71a1:3ce7:144d:9f2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-22 21:30:52', NULL),
(1559, '2001:448a:20b1:5227:71a1:3ce7:144d:9f2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-22 21:31:21', NULL),
(1560, '2001:448a:20b1:5227:71a1:3ce7:144d:9f2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/tukar_saldo/add-save', 'Tambah data baru  pada Tukar Saldo', '', 5, '2024-09-22 21:32:16', NULL),
(1561, '2001:448a:20b1:5227:71a1:3ce7:144d:9f2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/tukar_saldo/delete/21', 'Menghapus data 21 pada Tukar Saldo', '', 5, '2024-09-22 21:35:33', NULL),
(1562, '2001:448a:20b1:5227:71a1:3ce7:144d:9f2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/tukar_saldo/edit-save/22', 'Memperbaharui data  pada Tukar Saldo', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>status</td><td>Pending</td><td>Diterima</td></tr></tbody></table>', 5, '2024-09-22 21:35:43', NULL),
(1563, '2001:448a:20b1:5227:71a1:3ce7:144d:9f2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/tukar_saldo/delete/22', 'Menghapus data 22 pada Tukar Saldo', '', 5, '2024-09-22 21:42:43', NULL),
(1564, '2001:448a:20b1:5227:71a1:3ce7:144d:9f2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/tukar_saldo/delete/20', 'Menghapus data 20 pada Tukar Saldo', '', 5, '2024-09-22 21:43:55', NULL),
(1565, '2001:448a:20b1:5227:71a1:3ce7:144d:9f2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/tukar_saldo/edit-save/23', 'Memperbaharui data  pada Tukar Saldo', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>total_price</td><td>10000</td><td>210000</td></tr><tr><td>status</td><td>Pending</td><td>Diterima</td></tr></tbody></table>', 5, '2024-09-22 21:45:52', NULL),
(1566, '114.10.65.201', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', ' keluar', '', NULL, '2024-09-22 21:51:20', NULL),
(1567, '114.10.65.201', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 114.10.65.201', '', 5, '2024-09-22 21:51:24', NULL),
(1568, '2001:448a:20b1:5227:71a1:3ce7:144d:9f2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/tukar_saldo/edit-save/24', 'Memperbaharui data  pada Tukar Saldo', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>total_price</td><td>5000</td><td>10000</td></tr></tbody></table>', 5, '2024-09-22 21:54:13', NULL),
(1569, '2001:448a:20b1:5227:71a1:3ce7:144d:9f2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/tukar_saldo/edit-save/24', 'Memperbaharui data  pada Tukar Saldo', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>status</td><td>Pending</td><td>Diterima</td></tr></tbody></table>', 5, '2024-09-22 21:55:02', NULL),
(1570, '114.10.65.201', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/edit-save/100', 'Memperbaharui data Duplek/Boncos pada Sampah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>poin_per_kg</td><td>0</td><td>50</td></tr></tbody></table>', 5, '2024-09-22 21:55:48', NULL),
(1571, '2001:448a:20b1:5227:71a1:3ce7:144d:9f2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/tukar_saldo/edit-save/25', 'Memperbaharui data  pada Tukar Saldo', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>total_price</td><td>10000</td><td>5000</td></tr><tr><td>status</td><td>Pending</td><td>Diterima</td></tr></tbody></table>', 5, '2024-09-22 21:56:09', NULL),
(1572, '2001:448a:20b1:5227:71a1:3ce7:144d:9f2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/tukar_saldo/edit-save/26', 'Memperbaharui data  pada Tukar Saldo', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>total_price</td><td>5000</td><td>2000</td></tr></tbody></table>', 5, '2024-09-22 22:13:43', NULL),
(1573, '2001:448a:20b1:5227:71a1:3ce7:144d:9f2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/tukar_saldo/edit-save/26', 'Memperbaharui data  pada Tukar Saldo', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>status</td><td>Pending</td><td>Diterima</td></tr></tbody></table>', 5, '2024-09-22 22:14:31', NULL),
(1574, '114.10.65.201', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-22 22:16:22', NULL),
(1575, '114.10.65.201', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/delete/130', 'Menghapus data 130 pada Tabungan Nasabah', '', 5, '2024-09-22 22:17:26', NULL),
(1576, '2001:448a:20b1:5227:71a1:3ce7:144d:9f2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/tukar_saldo/delete/26', 'Menghapus data 26 pada Tukar Saldo', '', 5, '2024-09-22 22:21:55', NULL),
(1577, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 103.164.223.186', '', 5, '2024-09-23 12:56:56', NULL),
(1578, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/nasabah/edit-save/58', 'Memperbaharui data Anton S pada Nasabah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>password</td><td>$2y$10$6m4oQAx3jlhblLzEBEtRle1TKMOLdrR/eIwg0VxJ4C/bSNg2beWuO</td><td>$2y$10$xog.NRoH0Xa4FMgzXHxgkOEo0QGKRe2YuQb0ITF/nEyyLA7ZpGmDO</td></tr><tr><td>cms_user_id</td><td>5</td><td></td></tr><tr><td>email_verified_at</td><td></td><td></td></tr><tr><td>remember_token</td><td></td><td></td></tr></tbody></table>', 5, '2024-09-23 12:58:40', NULL),
(1579, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-23 13:05:27', NULL),
(1580, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-23 13:05:51', NULL),
(1581, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-23 13:06:36', NULL),
(1582, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-23 13:07:02', NULL),
(1583, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-23 13:07:39', NULL),
(1584, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-23 13:08:02', NULL),
(1585, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-23 13:08:23', NULL),
(1586, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-23 13:08:51', NULL),
(1587, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-23 13:09:19', NULL),
(1588, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-23 13:09:55', NULL),
(1589, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-23 13:10:13', NULL),
(1590, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-23 13:10:58', NULL),
(1591, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-23 13:11:38', NULL),
(1592, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-23 13:12:11', NULL),
(1593, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-23 13:12:30', NULL),
(1594, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-23 13:12:48', NULL),
(1595, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-23 13:13:19', NULL),
(1596, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-23 13:13:47', NULL),
(1597, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-23 13:14:27', NULL),
(1598, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-23 13:14:47', NULL),
(1599, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-23 13:15:03', NULL),
(1600, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-23 13:15:29', NULL),
(1601, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/edit-save/6', 'Memperbaharui data Bodong A pada Sampah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>price_per_kg</td><td>5000</td><td>4400</td></tr></tbody></table>', 5, '2024-09-23 13:16:58', NULL),
(1602, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-23 13:17:57', NULL),
(1603, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-23 13:20:12', NULL),
(1604, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-23 13:20:44', NULL),
(1605, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-23 13:21:10', NULL),
(1606, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/edit-save/6', 'Memperbaharui data Bodong A pada Sampah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>price_per_kg</td><td>4400</td><td>5000</td></tr></tbody></table>', 5, '2024-09-23 13:21:35', NULL),
(1607, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-23 13:23:34', NULL),
(1608, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-23 13:23:53', NULL),
(1609, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-23 13:24:20', NULL),
(1610, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-23 13:24:42', NULL),
(1611, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-23 13:25:02', NULL),
(1612, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-23 13:25:44', NULL),
(1613, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-23 13:26:04', NULL),
(1614, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-23 13:26:26', NULL),
(1615, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-23 13:27:04', NULL),
(1616, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-23 13:27:32', NULL),
(1617, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-23 13:28:00', NULL),
(1618, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-23 13:29:49', NULL),
(1619, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-23 13:30:27', NULL),
(1620, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-23 13:35:48', NULL),
(1621, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-23 13:42:49', NULL),
(1622, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-23 13:43:26', NULL),
(1623, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-23 13:43:46', NULL),
(1624, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-23 13:44:07', NULL),
(1625, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-23 13:44:49', NULL),
(1626, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-23 13:45:09', NULL),
(1627, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-23 13:45:28', NULL),
(1628, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-23 13:45:51', NULL),
(1629, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-23 13:46:20', NULL),
(1630, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-23 13:47:45', NULL),
(1631, '120.29.153.118', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-23 13:48:36', NULL),
(1632, '120.29.153.118', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-23 13:49:01', NULL),
(1633, '120.29.153.118', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-23 13:49:22', NULL);
INSERT INTO `cms_logs` (`id`, `ipaddress`, `useragent`, `url`, `description`, `details`, `id_cms_users`, `created_at`, `updated_at`) VALUES
(1634, '120.29.153.118', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-23 13:50:51', NULL),
(1635, '120.29.153.118', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/edit-save/6', 'Memperbaharui data Bodong A pada Sampah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>price_per_kg</td><td>5000</td><td>4400</td></tr></tbody></table>', 5, '2024-09-23 13:51:17', NULL),
(1636, '120.29.153.118', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/delete/184', 'Menghapus data 184 pada Tabungan Nasabah', '', 5, '2024-09-23 13:52:00', NULL),
(1637, '120.29.153.118', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-23 13:52:38', NULL),
(1638, '120.29.153.118', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-23 13:53:09', NULL),
(1639, '120.29.153.118', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/edit-save/6', 'Memperbaharui data Bodong A pada Sampah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>price_per_kg</td><td>4400</td><td>4600</td></tr></tbody></table>', 5, '2024-09-23 13:53:30', NULL),
(1640, '120.29.153.118', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-23 13:54:08', NULL),
(1641, '120.29.153.118', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-23 13:54:40', NULL),
(1642, '120.29.153.118', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-23 13:55:07', NULL),
(1643, '120.29.153.118', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/edit-save/6', 'Memperbaharui data Bodong A pada Sampah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>price_per_kg</td><td>4600</td><td>5000</td></tr></tbody></table>', 5, '2024-09-23 13:55:32', NULL),
(1644, '120.29.153.118', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-23 13:56:03', NULL),
(1645, '120.29.153.118', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-23 13:56:22', NULL),
(1646, '120.29.153.118', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-23 13:56:50', NULL),
(1647, '120.29.153.118', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-23 13:57:19', NULL),
(1648, '120.29.153.118', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-23 13:58:03', NULL),
(1649, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 114.10.113.49', '', 5, '2024-09-23 14:09:17', NULL),
(1650, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-23 15:08:21', NULL),
(1651, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/tukar_saldo/edit-save/27', 'Memperbaharui data  pada Tukar Saldo', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>status</td><td>Pending</td><td>On Proses</td></tr></tbody></table>', 5, '2024-09-23 15:08:55', NULL),
(1652, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/tukar_saldo/delete/27', 'Menghapus data 27 pada Tukar Saldo', '', 5, '2024-09-23 15:09:51', NULL),
(1653, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/tukar_saldo/delete/28', 'Menghapus data 28 pada Tukar Saldo', '', 5, '2024-09-23 15:12:23', NULL),
(1654, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/tukar_saldo/delete/28', 'Menghapus data 28 pada Tukar Saldo', '', 5, '2024-09-23 15:13:32', NULL),
(1655, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/tukar_saldo/delete/28', 'Menghapus data 28 pada Tukar Saldo', '', 5, '2024-09-23 15:14:21', NULL),
(1656, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/tukar_saldo/delete/28', 'Menghapus data 28 pada Tukar Saldo', '', 5, '2024-09-23 15:14:45', NULL),
(1657, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/tukar_saldo/delete/29', 'Menghapus data 29 pada Tukar Saldo', '', 5, '2024-09-23 15:15:29', NULL),
(1658, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/tukar_saldo/delete/29', 'Menghapus data  pada Tukar Saldo', '', 5, '2024-09-23 15:15:31', NULL),
(1659, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'bsu1@gmail.com keluar', '', 5, '2024-09-23 15:16:07', NULL),
(1660, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'admin@crudbooster.com login dengan IP Address 114.10.113.49', '', 1, '2024-09-23 15:16:10', NULL),
(1661, '120.29.153.118', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/rewards/delete/67', 'Menghapus data Vas Bunga pada Rewards', '', 5, '2024-09-23 15:42:41', NULL),
(1662, '120.29.153.118', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/delete/195', 'Menghapus data 195 pada Tabungan Nasabah', '', 5, '2024-09-23 15:43:22', NULL),
(1663, '120.29.153.118', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'bsu1@gmail.com keluar', '', 5, '2024-09-23 15:56:31', NULL),
(1664, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/tukar_saldo/delete/9', 'Menghapus data 9 pada Tukar Saldo', '', 1, '2024-09-23 16:08:14', NULL),
(1665, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/tukar_poins/delete/28', 'Menghapus data 28 pada Tukar Poin', '', 1, '2024-09-23 16:09:15', NULL),
(1666, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/tukar_poins/delete/34', 'Menghapus data 34 pada Tukar Poin', '', 1, '2024-09-23 16:11:21', NULL),
(1667, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/tukar_saldo/delete/25', 'Menghapus data 25 pada Tukar Saldo', '', 1, '2024-09-23 16:14:26', NULL),
(1668, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/tukar_saldo/delete/11', 'Menghapus data 11 pada Tukar Saldo', '', 1, '2024-09-23 16:14:29', NULL),
(1669, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/tukar_poins/delete/33', 'Menghapus data 33 pada Tukar Poin', '', 1, '2024-09-23 16:18:04', NULL),
(1670, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/tukar_poins/delete/33', 'Menghapus data  pada Tukar Poin', '', 1, '2024-09-23 16:18:26', NULL),
(1671, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'admin@crudbooster.com keluar', '', 1, '2024-09-23 16:18:54', NULL),
(1672, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 114.10.113.49', '', 5, '2024-09-23 16:18:58', NULL),
(1673, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'bsu1@gmail.com keluar', '', 5, '2024-09-23 16:21:06', NULL),
(1674, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'admin_bankimam@gmail.com login dengan IP Address 114.10.113.49', '', 10, '2024-09-23 16:21:12', NULL),
(1675, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'admin_bankimam@gmail.com keluar', '', 10, '2024-09-23 16:21:26', NULL),
(1676, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 114.10.113.49', '', 5, '2024-09-23 16:21:52', NULL),
(1677, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-23 16:22:48', NULL),
(1678, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/tukar_saldo/delete/30', 'Menghapus data 30 pada Tukar Saldo', '', 5, '2024-09-23 16:23:55', NULL),
(1679, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/delete/196', 'Menghapus data 196 pada Tabungan Nasabah', '', 5, '2024-09-23 16:36:42', NULL),
(1680, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/edit-save/194', 'Memperbaharui data  pada Tabungan Nasabah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody></tbody></table>', 5, '2024-09-23 16:39:01', NULL),
(1681, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'bsu1@gmail.com keluar', '', 5, '2024-09-23 16:40:57', NULL),
(1682, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'admin_bankimam@gmail.com login dengan IP Address 114.10.113.49', '', 10, '2024-09-23 16:41:01', NULL),
(1683, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'admin_bankimam@gmail.com keluar', '', 10, '2024-09-23 16:41:16', NULL),
(1684, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'admin@crudbooster.com login dengan IP Address 114.10.113.49', '', 1, '2024-09-23 16:41:21', NULL),
(1685, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'admin@crudbooster.com keluar', '', 1, '2024-09-23 17:07:00', NULL),
(1686, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 114.10.113.49', '', 5, '2024-09-23 17:07:03', NULL),
(1687, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'bsu1@gmail.com keluar', '', 5, '2024-09-23 17:07:09', NULL),
(1688, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'admin@crudbooster.com login dengan IP Address 114.10.113.49', '', 1, '2024-09-23 17:07:14', NULL),
(1689, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/menu_management/edit-save/49', 'Memperbaharui data laporan pada Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>color</td><td></td><td>normal</td></tr><tr><td>sorting</td><td>14</td><td></td></tr></tbody></table>', 1, '2024-09-23 17:07:25', NULL),
(1690, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'admin@crudbooster.com keluar', '', 1, '2024-09-23 17:07:30', NULL),
(1691, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 114.10.113.49', '', 5, '2024-09-23 17:07:35', NULL),
(1692, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/laporan_keuangan', 'Mencoba melihat data :name pada laporan', '', 5, '2024-09-23 17:07:36', NULL),
(1693, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/laporan_keuangan', 'Mencoba melihat data :name pada laporan', '', 5, '2024-09-23 17:07:38', NULL),
(1694, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/laporan_keuangan', 'Mencoba melihat data :name pada laporan', '', 5, '2024-09-23 17:09:26', NULL),
(1695, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/laporan_keuangan', 'Mencoba melihat data :name pada laporan', '', 5, '2024-09-23 17:09:27', NULL),
(1696, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/laporan_keuangan', 'Mencoba melihat data :name pada laporan', '', 5, '2024-09-23 17:09:29', NULL),
(1697, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/laporan_keuangan', 'Mencoba melihat data :name pada laporan', '', 5, '2024-09-23 17:09:30', NULL),
(1698, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'bsu1@gmail.com keluar', '', 5, '2024-09-23 17:09:34', NULL),
(1699, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'admin@crudbooster.com login dengan IP Address 114.10.113.49', '', 1, '2024-09-23 17:09:38', NULL),
(1700, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'admin@crudbooster.com keluar', '', 1, '2024-09-23 17:10:18', NULL),
(1701, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 114.10.113.49', '', 5, '2024-09-23 17:10:22', NULL),
(1702, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/laporan_keuangan', 'Mencoba melihat data :name pada laporan', '', 5, '2024-09-23 17:10:24', NULL),
(1703, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/laporan_keuangan', 'Mencoba melihat data :name pada laporan', '', 5, '2024-09-23 17:10:25', NULL),
(1704, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/laporan_keuangan', 'Mencoba melihat data :name pada laporan', '', 5, '2024-09-23 17:10:26', NULL),
(1705, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/laporan_keuangan', 'Mencoba melihat data :name pada laporan', '', 5, '2024-09-23 17:10:27', NULL),
(1706, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/laporan_keuangan', 'Mencoba melihat data :name pada laporan', '', 5, '2024-09-23 17:10:28', NULL),
(1707, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/laporan_keuangan', 'Mencoba melihat data :name pada laporan', '', 5, '2024-09-23 17:11:26', NULL),
(1708, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/laporan_keuangan', 'Mencoba melihat data :name pada laporan', '', 5, '2024-09-23 17:11:27', NULL),
(1709, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/laporan_keuangan', 'Mencoba melihat data :name pada laporan', '', 5, '2024-09-23 17:11:30', NULL),
(1710, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/laporan_keuangan', 'Mencoba melihat data :name pada laporan', '', 5, '2024-09-23 17:11:37', NULL),
(1711, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/laporan_keuangan', 'Mencoba melihat data :name pada laporan', '', 5, '2024-09-23 17:11:47', NULL),
(1712, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/laporan_keuangan', 'Mencoba melihat data :name pada laporan', '', 5, '2024-09-23 17:12:25', NULL),
(1713, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/laporan_keuangan', 'Mencoba melihat data :name pada laporan', '', 5, '2024-09-23 17:12:27', NULL),
(1714, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/laporan_keuangan', 'Mencoba melihat data :name pada laporan', '', 5, '2024-09-23 17:12:28', NULL),
(1715, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/laporan_keuangan', 'Mencoba melihat data :name pada laporan', '', 5, '2024-09-23 17:12:29', NULL),
(1716, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/laporan_keuangan', 'Mencoba melihat data :name pada laporan', '', 5, '2024-09-23 17:12:30', NULL),
(1717, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'bsu1@gmail.com keluar', '', 5, '2024-09-23 17:12:33', NULL),
(1718, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'admin@crudbooster.com login dengan IP Address 114.10.113.49', '', 1, '2024-09-23 17:12:37', NULL),
(1719, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'admin@crudbooster.com keluar', '', 1, '2024-09-23 17:13:18', NULL),
(1720, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 114.10.113.49', '', 5, '2024-09-23 17:13:24', NULL),
(1721, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/laporan_keuangan', 'Mencoba melihat data :name pada laporan', '', 5, '2024-09-23 17:13:25', NULL),
(1722, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/laporan_keuangan', 'Mencoba melihat data :name pada laporan', '', 5, '2024-09-23 17:13:26', NULL),
(1723, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/laporan_keuangan', 'Mencoba melihat data :name pada laporan', '', 5, '2024-09-23 17:13:28', NULL),
(1724, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/laporan_keuangan', 'Mencoba melihat data :name pada laporan', '', 5, '2024-09-23 17:13:32', NULL),
(1725, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/laporan_keuangan', 'Mencoba melihat data :name pada laporan', '', 5, '2024-09-23 19:05:29', NULL),
(1726, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/laporan_keuangan', 'Mencoba melihat data :name pada laporan', '', 5, '2024-09-23 19:05:30', NULL),
(1727, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/laporan_keuangan', 'Mencoba melihat data :name pada laporan', '', 5, '2024-09-23 19:05:31', NULL),
(1728, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'bsu1@gmail.com keluar', '', 5, '2024-09-23 19:05:35', NULL),
(1729, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'admin_bankimam@gmail.com login dengan IP Address 114.10.113.49', '', 10, '2024-09-23 19:05:42', NULL),
(1730, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/laporan_keuangan', 'Mencoba melihat data :name pada laporan', '', 10, '2024-09-23 19:05:43', NULL),
(1731, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/laporan_keuangan', 'Mencoba melihat data :name pada laporan', '', 10, '2024-09-23 19:05:44', NULL),
(1732, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'admin_bankimam@gmail.com keluar', '', 10, '2024-09-23 19:05:47', NULL),
(1733, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'admin@crudbooster.com login dengan IP Address 114.10.113.49', '', 1, '2024-09-23 19:05:53', NULL),
(1734, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'admin@crudbooster.com keluar', '', 1, '2024-09-23 19:23:22', NULL),
(1735, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 114.10.113.49', '', 5, '2024-09-23 19:23:26', NULL),
(1736, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-23 19:30:53', NULL),
(1737, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/edit-save/197', 'Memperbaharui data  pada Tabungan Nasabah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody></tbody></table>', 5, '2024-09-23 19:31:12', NULL),
(1738, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/edit-save/197', 'Memperbaharui data  pada Tabungan Nasabah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>total_weight</td><td>2.2</td><td>2.5</td></tr><tr><td>total_income</td><td>1232</td><td>1400</td></tr><tr><td>point_received</td><td>110</td><td>125</td></tr></tbody></table>', 5, '2024-09-23 19:31:39', NULL),
(1739, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/delete/197', 'Menghapus data 197 pada Tabungan Nasabah', '', 5, '2024-09-23 19:32:06', NULL),
(1740, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/laporan_keuangan', 'Mencoba melihat data :name pada laporan', '', 5, '2024-09-23 19:39:11', NULL),
(1741, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/laporan_keuangan', 'Mencoba melihat data :name pada laporan', '', 5, '2024-09-23 19:39:13', NULL),
(1742, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/laporan_keuangan', 'Mencoba melihat data :name pada laporan', '', 5, '2024-09-23 19:40:42', NULL),
(1743, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/laporan_keuangan', 'Mencoba melihat data :name pada laporan', '', 5, '2024-09-23 19:40:44', NULL),
(1744, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/laporan_keuangan', 'Mencoba melihat data :name pada laporan', '', 5, '2024-09-23 19:40:45', NULL),
(1745, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/laporan_keuangan', 'Mencoba melihat data :name pada laporan', '', 5, '2024-09-23 19:40:48', NULL),
(1746, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'bsu1@gmail.com keluar', '', 5, '2024-09-23 19:40:52', NULL),
(1747, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'admin@crudbooster.com login dengan IP Address 114.10.113.49', '', 1, '2024-09-23 19:40:58', NULL),
(1748, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 114.10.113.49', '', 5, '2024-09-23 19:43:31', NULL),
(1749, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/laporan_keuangan', 'Mencoba melihat data :name pada laporan_keuangan', '', 5, '2024-09-23 19:43:37', NULL),
(1750, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'bsu1@gmail.com keluar', '', 5, '2024-09-23 19:43:47', NULL),
(1751, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'admin@crudbooster.com login dengan IP Address 114.10.113.49', '', 1, '2024-09-23 19:43:59', NULL),
(1752, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'admin@crudbooster.com keluar', '', 1, '2024-09-23 19:45:16', NULL),
(1753, '114.10.113.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 114.10.113.49', '', 5, '2024-09-23 19:45:20', NULL),
(1754, '114.10.30.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'bsu1@gmail.com keluar', '', 5, '2024-09-23 20:05:12', NULL),
(1755, '114.10.30.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'admin@crudbooster.com login dengan IP Address 114.10.30.77', '', 1, '2024-09-23 20:05:21', NULL),
(1756, '114.10.30.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/laporan_keuangan/add-save', 'Tambah data baru  pada laporan_keuangan', '', 1, '2024-09-23 20:21:03', NULL),
(1757, '114.10.30.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/laporan_keuangan/edit-save/1', 'Memperbaharui data  pada laporan_keuangan', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>admin_id</td><td>1</td><td></td></tr><tr><td>profit</td><td>212100129</td><td>212100124</td></tr><tr><td>ambil_saldo</td><td></td><td></td></tr><tr><td>saldo_akhir</td><td></td><td></td></tr></tbody></table>', 1, '2024-09-23 20:21:13', NULL),
(1758, '114.10.30.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/laporan_keuangan/add-save', 'Tambah data baru  pada laporan_keuangan', '', 1, '2024-09-23 20:21:31', NULL),
(1759, '114.10.30.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/laporan_keuangan/edit-save/2', 'Memperbaharui data  pada laporan_keuangan', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>admin_id</td><td>1</td><td></td></tr><tr><td>ambil_saldo</td><td></td><td>0</td></tr><tr><td>saldo_akhir</td><td></td><td></td></tr></tbody></table>', 1, '2024-09-23 20:22:48', NULL),
(1760, '114.10.30.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/laporan_keuangan/edit-save/2', 'Memperbaharui data  pada laporan_keuangan', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>admin_id</td><td>1</td><td></td></tr><tr><td>saldo_akhir</td><td></td><td></td></tr></tbody></table>', 1, '2024-09-23 20:23:37', NULL),
(1761, '114.10.30.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/laporan_keuangan/edit-save/2', 'Memperbaharui data  pada laporan_keuangan', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>admin_id</td><td>1</td><td></td></tr><tr><td>saldo_akhir</td><td></td><td></td></tr></tbody></table>', 1, '2024-09-23 20:23:38', NULL),
(1762, '114.10.30.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/laporan_keuangan/edit-save/1', 'Memperbaharui data  pada laporan_keuangan', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>admin_id</td><td>1</td><td></td></tr><tr><td>ambil_saldo</td><td></td><td>12000</td></tr><tr><td>saldo_akhir</td><td></td><td></td></tr></tbody></table>', 1, '2024-09-23 20:23:45', NULL),
(1763, '114.10.30.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/laporan_keuangan/edit-save/2', 'Memperbaharui data  pada laporan_keuangan', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>admin_id</td><td>1</td><td></td></tr><tr><td>saldo_akhir</td><td></td><td>2099982</td></tr></tbody></table>', 1, '2024-09-23 20:26:35', NULL),
(1764, '114.10.30.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/laporan_keuangan/add-save', 'Tambah data baru  pada laporan_keuangan', '', 1, '2024-09-23 20:28:44', NULL),
(1765, '114.10.30.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/laporan_keuangan/edit-save/1', 'Memperbaharui data  pada laporan_keuangan', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>admin_id</td><td>1</td><td></td></tr><tr><td>ambil_saldo</td><td>12000</td><td>50000</td></tr><tr><td>saldo_akhir</td><td></td><td>212050124</td></tr></tbody></table>', 1, '2024-09-23 20:42:14', NULL),
(1766, '114.10.30.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/laporan_keuangan/edit-save/1', 'Memperbaharui data  pada laporan_keuangan', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>admin_id</td><td>1</td><td></td></tr><tr><td>ambil_saldo</td><td>50000</td><td>0</td></tr><tr><td>saldo_akhir</td><td>212050124</td><td>212100124</td></tr></tbody></table>', 1, '2024-09-23 20:43:30', NULL),
(1767, '114.10.30.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/laporan_keuangan/edit-save/3', 'Memperbaharui data  pada laporan_keuangan', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>admin_id</td><td>1</td><td></td></tr><tr><td>ambil_saldo</td><td></td><td>5000</td></tr></tbody></table>', 1, '2024-09-23 20:50:35', NULL),
(1768, '114.10.30.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/laporan_keuangan/edit-save/2', 'Memperbaharui data  pada laporan_keuangan', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>admin_id</td><td>1</td><td></td></tr><tr><td>ambil_saldo</td><td>0</td><td>10000</td></tr></tbody></table>', 1, '2024-09-23 20:50:45', NULL),
(1769, '114.10.30.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/laporan_keuangan/delete/1', 'Menghapus data 1 pada laporan_keuangan', '', 1, '2024-09-23 20:51:51', NULL),
(1770, '114.10.30.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/laporan_keuangan/delete/2', 'Menghapus data 2 pada laporan_keuangan', '', 1, '2024-09-23 20:51:54', NULL),
(1771, '114.10.30.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/laporan_keuangan/edit-save/3', 'Memperbaharui data  pada laporan_keuangan', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>admin_id</td><td>1</td><td></td></tr><tr><td>total_beli</td><td>50000</td><td>80000</td></tr><tr><td>profit</td><td>26500</td><td>-3500</td></tr><tr><td>saldo_akhir</td><td>21500</td><td>-8500</td></tr></tbody></table>', 1, '2024-09-23 20:52:41', NULL),
(1772, '114.10.30.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/laporan_keuangan/delete/3', 'Menghapus data 3 pada laporan_keuangan', '', 1, '2024-09-23 20:53:04', NULL),
(1773, '114.10.30.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'admin@crudbooster.com keluar', '', 1, '2024-09-23 20:53:07', NULL),
(1774, '114.10.30.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 114.10.30.77', '', 5, '2024-09-23 20:53:10', NULL),
(1775, '114.10.30.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/laporan_keuangan/add-save', 'Tambah data baru  pada laporan_keuangan', '', 5, '2024-09-23 20:53:49', NULL),
(1776, '114.10.30.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'bsu1@gmail.com keluar', '', 5, '2024-09-23 20:54:01', NULL),
(1777, '114.10.30.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'admin@crudbooster.com login dengan IP Address 114.10.30.77', '', 1, '2024-09-23 20:54:05', NULL),
(1778, '114.10.30.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'admin@crudbooster.com keluar', '', 1, '2024-09-23 20:54:16', NULL),
(1779, '114.10.30.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'karyapeduli@gmail.com login dengan IP Address 114.10.30.77', '', 12, '2024-09-23 20:54:21', NULL),
(1780, '114.10.30.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'karyapeduli@gmail.com keluar', '', 12, '2024-09-23 20:54:43', NULL),
(1781, '114.10.30.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 114.10.30.77', '', 5, '2024-09-23 20:54:58', NULL),
(1782, '114.10.30.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'bsu1@gmail.com keluar', '', 5, '2024-09-23 21:27:54', NULL),
(1783, '114.10.30.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'admin@crudbooster.com login dengan IP Address 114.10.30.77', '', 1, '2024-09-23 21:28:00', NULL),
(1784, '114.10.30.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'admin@crudbooster.com keluar', '', 1, '2024-09-23 21:28:10', NULL),
(1785, '114.10.30.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'madrasahRM@gmail.com login dengan IP Address 114.10.30.77', '', 13, '2024-09-23 21:28:13', NULL),
(1786, '114.10.30.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/laporan_keuangan/add-save', 'Tambah data baru  pada laporan_keuangan', '', 13, '2024-09-23 21:30:10', NULL),
(1787, '114.10.30.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'madrasahRM@gmail.com keluar', '', 13, '2024-09-23 21:30:48', NULL),
(1788, '114.10.30.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 114.10.30.77', '', 5, '2024-09-23 21:30:52', NULL),
(1789, '114.10.30.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'bsu1@gmail.com keluar', '', 5, '2024-09-23 21:30:59', NULL),
(1790, '114.10.30.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'madrasahRM@gmail.com login dengan IP Address 114.10.30.77', '', 13, '2024-09-23 21:31:03', NULL),
(1791, '114.10.30.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/laporan_keuangan/delete/5', 'Menghapus data 5 pada laporan_keuangan', '', 13, '2024-09-23 21:31:06', NULL),
(1792, '114.10.30.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'madrasahRM@gmail.com keluar', '', 13, '2024-09-23 21:31:10', NULL),
(1793, '114.10.30.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 114.10.30.77', '', 5, '2024-09-23 21:31:15', NULL),
(1794, '114.10.30.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-23 21:33:55', NULL),
(1795, '114.10.30.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/tukar_saldo/edit-save/31', 'Memperbaharui data  pada Tukar Saldo', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>status</td><td>Pending</td><td>On Proses</td></tr></tbody></table>', 5, '2024-09-23 21:35:08', NULL),
(1796, '114.10.30.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/tukar_saldo/delete/31', 'Menghapus data 31 pada Tukar Saldo', '', 5, '2024-09-23 21:35:31', NULL),
(1797, '114.10.30.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/delete/198', 'Menghapus data 198 pada Tabungan Nasabah', '', 5, '2024-09-23 21:37:57', NULL),
(1798, '114.10.30.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/laporan_keuangan/add-save', 'Tambah data baru  pada laporan_keuangan', '', 5, '2024-09-23 21:43:52', NULL),
(1799, '114.10.30.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'bsu1@gmail.com keluar', '', 5, '2024-09-23 21:47:40', NULL),
(1800, '114.10.30.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 114.10.30.77', '', 5, '2024-09-23 21:47:42', NULL),
(1801, '114.10.30.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-23 21:56:03', NULL),
(1802, '114.10.30.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/delete/199', 'Menghapus data 199 pada Tabungan Nasabah', '', 5, '2024-09-23 21:56:09', NULL),
(1803, '114.10.30.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-23 21:56:28', NULL),
(1804, '114.10.30.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/tukar_saldo/edit-save/32', 'Memperbaharui data  pada Tukar Saldo', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>status</td><td>Pending</td><td>On Proses</td></tr></tbody></table>', 5, '2024-09-23 21:57:23', NULL);
INSERT INTO `cms_logs` (`id`, `ipaddress`, `useragent`, `url`, `description`, `details`, `id_cms_users`, `created_at`, `updated_at`) VALUES
(1805, '114.10.30.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/tukar_saldo/delete/32', 'Menghapus data 32 pada Tukar Saldo', '', 5, '2024-09-23 21:57:48', NULL),
(1806, '114.10.30.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'bsu1@gmail.com keluar', '', 5, '2024-09-23 21:58:26', NULL),
(1807, '114.10.30.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'admin@crudbooster.com login dengan IP Address 114.10.30.77', '', 1, '2024-09-23 21:58:46', NULL),
(1808, '114.10.30.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/menu_management/edit-save/49', 'Memperbaharui data Laporan Keuangan pada Menu Management', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>name</td><td>laporan</td><td>Laporan Keuangan</td></tr><tr><td>sorting</td><td>14</td><td></td></tr></tbody></table>', 1, '2024-09-23 21:59:05', NULL),
(1809, '114.10.30.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'admin@crudbooster.com keluar', '', 1, '2024-09-23 21:59:23', NULL),
(1810, '114.10.30.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'admin_bankimam@gmail.com login dengan IP Address 114.10.30.77', '', 10, '2024-09-23 21:59:29', NULL),
(1811, '114.10.30.77', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 114.10.30.77', '', 5, '2024-09-24 00:10:01', NULL),
(1812, '114.10.115.185', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 114.10.115.185', '', 5, '2024-09-24 16:52:43', NULL),
(1813, '114.10.115.185', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/laporan_keuangan/edit-save/4', 'Memperbaharui data  pada laporan_keuangan', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>admin_id</td><td>5</td><td></td></tr><tr><td>periode</td><td>september</td><td>oktober</td></tr><tr><td>ambil_saldo</td><td></td><td></td></tr></tbody></table>', 5, '2024-09-24 17:02:24', NULL),
(1814, '114.10.115.185', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 114.10.115.185', '', 5, '2024-09-24 19:50:07', NULL),
(1815, '114.10.65.111', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-24 20:00:21', NULL),
(1816, '114.10.65.111', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/delete/200', 'Menghapus data 200 pada Tabungan Nasabah', '', 5, '2024-09-24 20:00:42', NULL),
(1817, '114.10.65.111', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/delete/201', 'Menghapus data 201 pada Tabungan Nasabah', '', 5, '2024-09-24 20:00:45', NULL),
(1818, '114.10.65.111', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions_bsi/add-save', 'Tambah data baru  pada Transaksi BSI', '', 5, '2024-09-24 21:08:58', NULL),
(1819, '114.10.65.111', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions_bsi/add-save', 'Tambah data baru  pada Transaksi BSI', '', 5, '2024-09-24 21:09:10', NULL),
(1820, '114.10.65.111', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions_bsi/add-save', 'Tambah data baru  pada Transaksi BSI', '', 5, '2024-09-24 21:09:57', NULL),
(1821, '114.10.65.111', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 114.10.65.111', '', 5, '2024-09-24 21:30:50', NULL),
(1822, '114.10.65.111', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 114.10.65.111', '', 5, '2024-09-24 21:35:17', NULL),
(1823, '114.10.65.111', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'bsu1@gmail.com keluar', '', 5, '2024-09-24 21:38:08', NULL),
(1824, '114.10.65.111', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'admin@crudbooster.com login dengan IP Address 114.10.65.111', '', 1, '2024-09-24 21:38:12', NULL),
(1825, '114.10.65.111', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'admin@crudbooster.com keluar', '', 1, '2024-09-24 21:39:29', NULL),
(1826, '114.10.65.111', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 114.10.65.111', '', 5, '2024-09-24 21:39:33', NULL),
(1827, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 103.164.223.186', '', 5, '2024-09-25 12:18:36', NULL),
(1828, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://www.bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 103.164.223.186', '', 5, '2024-09-26 11:13:55', NULL),
(1829, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://www.bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-26 11:19:18', NULL),
(1830, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://www.bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-26 11:23:31', NULL),
(1831, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://www.bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-26 11:24:08', NULL),
(1832, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://www.bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-26 11:24:26', NULL),
(1833, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://www.bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-26 11:25:15', NULL),
(1834, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://www.bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-26 11:25:37', NULL),
(1835, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://www.bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-26 11:26:59', NULL),
(1836, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://www.bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-26 11:27:23', NULL),
(1837, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://www.bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-26 11:28:52', NULL),
(1838, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://www.bangimam.com/admin/sampah/edit-save/6', 'Memperbaharui data Bodong A pada Sampah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>price_per_kg</td><td>5000</td><td>4400</td></tr></tbody></table>', 5, '2024-09-26 11:30:57', NULL),
(1839, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://www.bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-26 11:33:01', NULL),
(1840, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://www.bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-26 11:34:22', NULL),
(1841, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://www.bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-26 11:37:42', NULL),
(1842, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://www.bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-26 11:38:21', NULL),
(1843, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://www.bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-26 11:41:54', NULL),
(1844, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://www.bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-26 11:42:17', NULL),
(1845, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://www.bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-26 11:42:42', NULL),
(1846, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://www.bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-26 11:43:04', NULL),
(1847, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://www.bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-26 11:43:41', NULL),
(1848, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://www.bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-26 11:44:00', NULL),
(1849, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://www.bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-26 11:44:19', NULL),
(1850, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://www.bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-26 11:44:46', NULL),
(1851, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://www.bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-26 11:45:15', NULL),
(1852, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://www.bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-26 11:45:54', NULL),
(1853, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://www.bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-26 11:46:23', NULL),
(1854, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://www.bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-26 11:46:44', NULL),
(1855, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://www.bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-26 11:47:50', NULL),
(1856, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://www.bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-26 11:48:39', NULL),
(1857, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://www.bangimam.com/admin/sampah/edit-save/6', 'Memperbaharui data Bodong A pada Sampah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>price_per_kg</td><td>4400</td><td>5000</td></tr></tbody></table>', 5, '2024-09-26 11:49:41', NULL),
(1858, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://www.bangimam.com/admin/transactions/delete/228', 'Menghapus data 228 pada Tabungan Nasabah', '', 5, '2024-09-26 11:51:08', NULL),
(1859, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://www.bangimam.com/admin/transactions/delete/220', 'Menghapus data 220 pada Tabungan Nasabah', '', 5, '2024-09-26 11:51:21', NULL),
(1860, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://www.bangimam.com/admin/transactions/delete/215', 'Menghapus data 215 pada Tabungan Nasabah', '', 5, '2024-09-26 11:51:27', NULL),
(1861, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://www.bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-26 13:21:22', NULL),
(1862, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://www.bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-26 13:21:52', NULL),
(1863, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://www.bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-26 13:22:29', NULL),
(1864, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://www.bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-26 13:23:06', NULL),
(1865, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://www.bangimam.com/admin/transactions/edit-save/231', 'Memperbaharui data  pada Tabungan Nasabah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>periode</td><td>12.75</td><td>12/7/2024</td></tr></tbody></table>', 5, '2024-09-26 13:23:21', NULL),
(1866, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://www.bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-26 13:27:50', NULL),
(1867, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://www.bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-26 13:28:11', NULL),
(1868, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://www.bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-26 13:28:37', NULL),
(1869, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://www.bangimam.com/admin/transactions/edit-save/58', 'Memperbaharui data  pada Tabungan Nasabah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>periode</td><td>20/09/2024</td><td>20/6/2024</td></tr></tbody></table>', 5, '2024-09-26 13:30:22', NULL),
(1870, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://www.bangimam.com/admin/transactions/edit-save/59', 'Memperbaharui data  pada Tabungan Nasabah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>periode</td><td>20/09/2024</td><td>03/7/2024</td></tr></tbody></table>', 5, '2024-09-26 13:31:06', NULL),
(1871, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://www.bangimam.com/admin/transactions/edit-save/60', 'Memperbaharui data  pada Tabungan Nasabah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>periode</td><td>20/09/2024</td><td>11/7/2024</td></tr></tbody></table>', 5, '2024-09-26 13:32:05', NULL),
(1872, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://www.bangimam.com/admin/transactions/edit-save/61', 'Memperbaharui data  pada Tabungan Nasabah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>sampah_id</td><td>80</td><td>79</td></tr><tr><td>total_weight</td><td>3.05</td><td>7.4</td></tr><tr><td>total_income</td><td>4880</td><td>11100</td></tr><tr><td>point_received</td><td>305</td><td>0</td></tr><tr><td>periode</td><td>29/09/2024</td><td>05/8/2024</td></tr></tbody></table>', 5, '2024-09-26 13:33:09', NULL),
(1873, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://www.bangimam.com/admin/transactions/edit-save/63', 'Memperbaharui data  pada Tabungan Nasabah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>periode</td><td>20/09/2024</td><td>05/8/2024</td></tr></tbody></table>', 5, '2024-09-26 13:33:38', NULL),
(1874, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://www.bangimam.com/admin/transactions/edit-save/64', 'Memperbaharui data  pada Tabungan Nasabah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>periode</td><td>20/09/2024</td><td>26/8/2024</td></tr></tbody></table>', 5, '2024-09-26 13:34:09', NULL),
(1875, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://www.bangimam.com/admin/transactions/edit-save/66', 'Memperbaharui data  pada Tabungan Nasabah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>sampah_id</td><td>79</td><td>95</td></tr><tr><td>total_weight</td><td>7.4</td><td>1.2</td></tr><tr><td>total_income</td><td>11100</td><td>3960</td></tr><tr><td>point_received</td><td>740</td><td>0</td></tr><tr><td>periode</td><td>20/09/2024</td><td>26/8/2024</td></tr></tbody></table>', 5, '2024-09-26 13:34:59', NULL),
(1876, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://www.bangimam.com/admin/transactions/delete/67', 'Menghapus data 67 pada Tabungan Nasabah', '', 5, '2024-09-26 13:35:22', NULL),
(1877, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://www.bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 103.164.223.186', '', 5, '2024-09-26 13:36:39', NULL),
(1878, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://www.bangimam.com/admin/nasabah/edit-save/66', 'Memperbaharui data Priyo Wahyudi pada Nasabah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>password</td><td>$2y$10$hGW3JIDTXIWpLOEnFIh6JeSBPVBPrs6XNnvRiX2RsDXnZE/.DAhd.</td><td>$2y$10$LRuYRUFyi6kspUT6NGEmvueXVkNza7eFapXIGCbYtI2SFBLl/zase</td></tr><tr><td>cms_user_id</td><td>5</td><td></td></tr><tr><td>address</td><td></td><td>ciledug</td></tr><tr><td>phone_number</td><td></td><td>123</td></tr><tr><td>picture</td><td></td><td>uploads/5/2024-09/mobil3.jpg</td></tr><tr><td>email_verified_at</td><td></td><td></td></tr><tr><td>remember_token</td><td></td><td></td></tr></tbody></table>', 5, '2024-09-26 13:38:25', NULL),
(1879, '114.4.213.15', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 114.4.213.15', '', 5, '2024-09-26 13:49:43', NULL),
(1880, '114.4.213.15', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/logout', 'bsu1@gmail.com keluar', '', 5, '2024-09-26 14:01:06', NULL),
(1881, '114.4.213.15', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/login', 'sumberRejeki@gmail.com login dengan IP Address 114.4.213.15', '', 26, '2024-09-26 14:01:22', NULL),
(1882, '114.4.213.15', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/logout', 'sumberRejeki@gmail.com keluar', '', 26, '2024-09-26 14:04:50', NULL),
(1883, '114.4.213.15', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/login', 'sumberRejeki@gmail.com login dengan IP Address 114.4.213.15', '', 26, '2024-09-26 14:08:10', NULL),
(1884, '120.188.32.138', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/login', 'sumberRejeki@gmail.com login dengan IP Address 120.188.32.138', '', 26, '2024-09-26 14:09:22', NULL),
(1885, '120.188.32.138', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 26, '2024-09-26 14:11:57', NULL),
(1886, '114.4.213.15', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/login', 'sumberRejeki@gmail.com login dengan IP Address 114.4.213.15', '', 26, '2024-09-26 14:18:27', NULL),
(1887, '114.4.213.15', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/logout', 'sumberRejeki@gmail.com keluar', '', 26, '2024-09-26 14:21:22', NULL),
(1888, '114.4.213.15', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/login', 'sumberRejeki@gmail.com login dengan IP Address 114.4.213.15', '', 26, '2024-09-26 14:21:49', NULL),
(1889, '120.188.32.138', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 26, '2024-09-26 14:29:45', NULL),
(1890, '120.188.32.138', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Besi pada Sampah', '', 26, '2024-09-26 14:32:53', NULL),
(1891, '114.4.213.15', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/logout', 'sumberRejeki@gmail.com keluar', '', 26, '2024-09-26 14:34:59', NULL),
(1892, '103.189.123.7', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Mobile Safari/537.36 OPR/84.0.0.0', 'https://bangimam.com/admin/logout', ' keluar', '', NULL, '2024-09-26 14:35:07', NULL),
(1893, '120.188.32.138', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Almunium pada Sampah', '', 26, '2024-09-26 14:36:43', NULL),
(1894, '114.4.213.15', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/login', 'sumberRejeki@gmail.com login dengan IP Address 114.4.213.15', '', 26, '2024-09-26 14:36:48', NULL),
(1895, '120.188.32.138', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/sampah/edit-save/61', 'Memperbaharui data Bodong A pada Sampah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>name</td><td>Botol Plastik</td><td>Bodong A</td></tr><tr><td>deskripsi</td><td></td><td>Botol bersih</td></tr><tr><td>price_per_kg</td><td>1000</td><td>6700</td></tr><tr><td>poin_per_kg</td><td>0</td><td>25</td></tr></tbody></table>', 26, '2024-09-26 14:39:48', NULL),
(1896, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://www.bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-26 14:41:30', NULL),
(1897, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://www.bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-26 14:41:58', NULL),
(1898, '114.4.213.15', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 26, '2024-09-26 14:42:01', NULL),
(1899, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://www.bangimam.com/admin/tukar_saldo/delete/33', 'Menghapus data 33 pada Tukar Saldo', '', 5, '2024-09-26 14:44:43', NULL),
(1900, '114.4.213.15', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 26, '2024-09-26 14:45:17', NULL),
(1901, '120.188.32.138', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/nasabah/edit-save/80', 'Memperbaharui data Kusmawardani pada Nasabah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>password</td><td>$2y$10$DaRCDB3uUtW0FIjgb4vXkujugINGVr/exzA3VSQPHbPoCax8WCU92</td><td>$2y$10$vyJAP2RhsVOTqa5drqBp1e0Wwo2VaBHKiVVCQh2IiyW8lB2s28G6m</td></tr><tr><td>cms_user_id</td><td>26</td><td></td></tr><tr><td>address</td><td></td><td>Jl. Swakarya</td></tr><tr><td>phone_number</td><td></td><td>087880208746</td></tr><tr><td>picture</td><td></td><td>uploads/26/2024-09/17273367709958014523272072075946.jpg</td></tr><tr><td>email_verified_at</td><td></td><td></td></tr><tr><td>remember_token</td><td></td><td></td></tr></tbody></table>', 26, '2024-09-26 14:46:42', NULL),
(1902, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://www.bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 103.164.223.186', '', 5, '2024-09-26 14:47:12', NULL),
(1903, '120.188.32.138', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/nasabah/delete/81', 'Menghapus data Anny Kusmawardani pada Nasabah', '', 26, '2024-09-26 14:47:35', NULL),
(1904, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://www.bangimam.com/admin/nasabah/edit-save/78', 'Memperbaharui data Yahya pada Nasabah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>password</td><td>$2y$10$BW1v9k.Xp0Vkb2k3SLzPPeiPVnGf7c.exTuGnUqoctCWqvkP.C3EC</td><td>$2y$10$d3lXB/2rISXklJCdRVtz/O74UoKs2R8b08GUSoBIfrhr9jLwQ8OdG</td></tr><tr><td>cms_user_id</td><td>5</td><td></td></tr><tr><td>address</td><td></td><td>mercu buana</td></tr><tr><td>phone_number</td><td></td><td>1234</td></tr><tr><td>picture</td><td></td><td>uploads/5/2024-09/mobil4.jpg</td></tr><tr><td>email_verified_at</td><td></td><td></td></tr><tr><td>remember_token</td><td></td><td></td></tr></tbody></table>', 5, '2024-09-26 14:48:25', NULL),
(1905, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://www.bangimam.com/admin/tukar_saldo/edit-save/34', 'Memperbaharui data  pada Tukar Saldo', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>admin_id</td><td></td><td>5</td></tr><tr><td>bukti_foto</td><td></td><td>uploads/5/2024-09/whatsapp_image_2024_09_22_at_203012.jpeg</td></tr><tr><td>status</td><td>Pending</td><td>Diterima</td></tr></tbody></table>', 5, '2024-09-26 14:51:39', NULL),
(1906, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://www.bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-26 15:34:34', NULL),
(1907, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://www.bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-26 15:34:58', NULL),
(1908, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://www.bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-26 15:35:38', NULL),
(1909, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://www.bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-26 15:36:25', NULL),
(1910, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://www.bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-26 15:37:16', NULL),
(1911, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://www.bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-26 15:37:44', NULL),
(1912, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://www.bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-26 15:38:34', NULL),
(1913, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://www.bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-26 15:39:21', NULL),
(1914, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://www.bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-26 15:39:51', NULL),
(1915, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://www.bangimam.com/admin/transactions/edit-save/250', 'Memperbaharui data  pada Tabungan Nasabah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>periode</td><td>12/8/2024</td><td>27/7/2024</td></tr></tbody></table>', 5, '2024-09-26 15:40:34', NULL),
(1916, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'https://www.bangimam.com/admin/logout', 'bsu1@gmail.com keluar', '', 5, '2024-09-26 15:59:23', NULL),
(1917, '114.10.114.238', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'sumberRejeki@gmail.com login dengan IP Address 114.10.114.238', '', 26, '2024-09-26 21:48:36', NULL),
(1918, '114.10.114.238', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah_categories/delete/55', 'Menghapus data Almunium pada Kategori Sampah', '', 26, '2024-09-26 21:48:51', NULL),
(1919, '114.10.114.238', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah_categories/delete/56', 'Menghapus data Almunium pada Kategori Sampah', '', 26, '2024-09-26 21:48:54', NULL),
(1920, '114.10.114.238', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah_categories/delete/57', 'Menghapus data Gabruk pada Kategori Sampah', '', 26, '2024-09-26 21:48:56', NULL),
(1921, '114.10.114.238', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah_categories/delete/58', 'Menghapus data Kaleng pada Kategori Sampah', '', 26, '2024-09-26 21:48:59', NULL),
(1922, '114.10.114.238', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah_categories/delete/59', 'Menghapus data Kabin pada Kategori Sampah', '', 26, '2024-09-26 21:49:01', NULL),
(1923, '114.10.114.238', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah_categories/delete/60', 'Menghapus data Bodong A pada Kategori Sampah', '', 26, '2024-09-26 21:49:03', NULL),
(1924, '114.10.114.238', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah_categories/delete/61', 'Menghapus data Gelas kopi pada Kategori Sampah', '', 26, '2024-09-26 21:49:06', NULL),
(1925, '114.10.114.238', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah_categories/delete/64', 'Menghapus data Inject pada Kategori Sampah', '', 26, '2024-09-26 21:49:17', NULL),
(1926, '114.10.114.238', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah_categories/delete/63', 'Menghapus data Ember warna pada Kategori Sampah', '', 26, '2024-09-26 21:49:19', NULL),
(1927, '114.10.114.238', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah_categories/delete/62', 'Menghapus data Gelas A pada Kategori Sampah', '', 26, '2024-09-26 21:49:29', NULL),
(1928, '114.10.114.238', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'sumberRejeki@gmail.com keluar', '', 26, '2024-09-26 21:50:06', NULL),
(1929, '114.10.114.238', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 114.10.114.238', '', 5, '2024-09-26 21:50:10', NULL),
(1930, '114.10.114.238', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-26 22:03:53', NULL),
(1931, '114.10.114.238', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/delete/251', 'Menghapus data 251 pada Tabungan Nasabah', '', 5, '2024-09-26 22:05:01', NULL),
(1932, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', '', 5, '2024-09-29 13:55:48', NULL),
(1933, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 13:58:55', NULL),
(1934, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 13:59:11', NULL),
(1935, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 13:59:49', NULL),
(1936, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 14:00:40', NULL),
(1937, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 14:01:07', NULL),
(1938, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 14:01:54', NULL),
(1939, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 14:02:33', NULL),
(1940, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 14:03:12', NULL),
(1941, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 14:03:58', NULL),
(1942, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 14:04:14', NULL),
(1943, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 14:04:40', NULL),
(1944, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 14:05:25', NULL),
(1945, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 14:05:47', NULL),
(1946, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 14:06:13', NULL),
(1947, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 14:07:27', NULL),
(1948, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 14:07:53', NULL),
(1949, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 14:08:09', NULL),
(1950, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Koran pada Sampah', '', 5, '2024-09-29 14:10:15', NULL),
(1951, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 14:10:48', NULL),
(1952, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 14:12:15', NULL),
(1953, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/edit-save/86', 'Memperbaharui data Buku pada Sampah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>deskripsi</td><td></td><td></td></tr><tr><td>price_per_kg</td><td>800</td><td>1000</td></tr></tbody></table>', 5, '2024-09-29 14:12:55', NULL),
(1954, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 14:13:23', NULL),
(1955, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 14:13:56', NULL),
(1956, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/delete/272', 'Menghapus data 272 pada Tabungan Nasabah', '', 5, '2024-09-29 14:14:15', NULL),
(1957, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/nasabah/edit-save/86', 'Memperbaharui data Ade saputra pada Nasabah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>password</td><td>$2y$10$Q857eK0kWnEJdpFV5yr6i.mF6LdJ4aFH.LZqR07aVatnftcEWnD6G</td><td>$2y$10$lOehM/gGXvexGrZ2NYk.DO0OYuoqnVhjMupWhC6X/n7.aW27GbTIC</td></tr><tr><td>cms_user_id</td><td>5</td><td></td></tr><tr><td>address</td><td></td><td>mercu buana</td></tr><tr><td>phone_number</td><td></td><td>12345</td></tr><tr><td>picture</td><td></td><td>uploads/5/2024-09/batman.png</td></tr><tr><td>email_verified_at</td><td></td><td></td></tr><tr><td>remember_token</td><td></td><td></td></tr></tbody></table>', 5, '2024-09-29 14:15:41', NULL),
(1958, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 14:18:35', NULL),
(1959, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 14:18:57', NULL),
(1960, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 14:19:15', NULL),
(1961, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 14:19:34', NULL);
INSERT INTO `cms_logs` (`id`, `ipaddress`, `useragent`, `url`, `description`, `details`, `id_cms_users`, `created_at`, `updated_at`) VALUES
(1962, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 14:19:52', NULL),
(1963, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/edit-save/6', 'Memperbaharui data Bodong A pada Sampah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>price_per_kg</td><td>5000</td><td>4600</td></tr></tbody></table>', 5, '2024-09-29 14:20:54', NULL),
(1964, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 14:21:25', NULL),
(1965, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 14:33:06', NULL),
(1966, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 14:33:29', NULL),
(1967, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 14:34:36', NULL),
(1968, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 14:35:03', NULL),
(1969, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 14:35:48', NULL),
(1970, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/edit-save/281', 'Memperbaharui data  pada Tabungan Nasabah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>periode</td><td>31/8/22024</td><td>31/8/2024</td></tr></tbody></table>', 5, '2024-09-29 14:36:07', NULL),
(1971, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/edit-save/280', 'Memperbaharui data  pada Tabungan Nasabah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>periode</td><td>12/7/24</td><td>12/7/2024</td></tr></tbody></table>', 5, '2024-09-29 14:36:19', NULL),
(1972, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/edit-save/279', 'Memperbaharui data  pada Tabungan Nasabah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>periode</td><td>12/7/24</td><td>12/7/2024</td></tr></tbody></table>', 5, '2024-09-29 14:36:27', NULL),
(1973, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 14:38:38', NULL),
(1974, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/delete/284', 'Menghapus data 284 pada Tabungan Nasabah', '', 5, '2024-09-29 14:38:57', NULL),
(1975, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 14:39:40', NULL),
(1976, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 14:39:59', NULL),
(1977, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 14:40:24', NULL),
(1978, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 14:42:55', NULL),
(1979, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 14:43:15', NULL),
(1980, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 14:43:35', NULL),
(1981, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 14:44:11', NULL),
(1982, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/edit-save/6', 'Memperbaharui data Bodong A pada Sampah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>price_per_kg</td><td>4600</td><td>4400</td></tr></tbody></table>', 5, '2024-09-29 14:44:26', NULL),
(1983, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 14:45:00', NULL),
(1984, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/delete/292', 'Menghapus data 292 pada Tabungan Nasabah', '', 5, '2024-09-29 14:46:36', NULL),
(1985, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 14:47:10', NULL),
(1986, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/edit-save/6', 'Memperbaharui data Bodong A pada Sampah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>price_per_kg</td><td>4400</td><td>5000</td></tr></tbody></table>', 5, '2024-09-29 14:48:32', NULL),
(1987, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 14:49:15', NULL),
(1988, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 14:56:52', NULL),
(1989, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 14:57:09', NULL),
(1990, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 14:57:26', NULL),
(1991, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/delete/297', 'Menghapus data 297 pada Tabungan Nasabah', '', 5, '2024-09-29 14:57:58', NULL),
(1992, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/delete/297', 'Menghapus data  pada Tabungan Nasabah', '', 5, '2024-09-29 14:57:58', NULL),
(1993, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/edit-save/93', 'Memperbaharui data Ember Hitam pada Sampah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>price_per_kg</td><td>800</td><td>1000</td></tr></tbody></table>', 5, '2024-09-29 14:58:10', NULL),
(1994, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 14:58:58', NULL),
(1995, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 14:59:16', NULL),
(1996, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 14:59:34', NULL),
(1997, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 14:59:49', NULL),
(1998, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 15:01:17', NULL),
(1999, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 15:01:35', NULL),
(2000, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/edit-save/93', 'Memperbaharui data Ember Hitam pada Sampah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>price_per_kg</td><td>1000</td><td>800</td></tr></tbody></table>', 5, '2024-09-29 15:01:56', NULL),
(2001, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 15:02:21', NULL),
(2002, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 15:02:37', NULL),
(2003, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 15:03:44', NULL),
(2004, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 15:04:02', NULL),
(2005, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 15:04:21', NULL),
(2006, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 15:04:44', NULL),
(2007, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/edit-save/6', 'Memperbaharui data Bodong A pada Sampah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>price_per_kg</td><td>5000</td><td>4400</td></tr></tbody></table>', 5, '2024-09-29 15:05:15', NULL),
(2008, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/edit-save/100', 'Memperbaharui data Duplek/Boncos pada Sampah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>poin_per_kg</td><td>50</td><td>0</td></tr></tbody></table>', 5, '2024-09-29 15:05:23', NULL),
(2009, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 15:06:18', NULL),
(2010, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 15:06:48', NULL),
(2011, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 15:07:06', NULL),
(2012, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 15:07:32', NULL),
(2013, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 15:07:47', NULL),
(2014, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 15:08:05', NULL),
(2015, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 15:08:54', NULL),
(2016, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 15:09:20', NULL),
(2017, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 15:09:48', NULL),
(2018, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 15:10:11', NULL),
(2019, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/edit-save/6', 'Memperbaharui data Bodong A pada Sampah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>price_per_kg</td><td>4400</td><td>4600</td></tr></tbody></table>', 5, '2024-09-29 15:10:35', NULL),
(2020, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 15:11:10', NULL),
(2021, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 15:11:27', NULL),
(2022, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 15:15:04', NULL),
(2023, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 15:15:20', NULL),
(2024, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 15:15:34', NULL),
(2025, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 15:15:50', NULL),
(2026, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/edit-save/325', 'Memperbaharui data  pada Tabungan Nasabah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>total_weight</td><td>15.85</td><td>2.55</td></tr><tr><td>total_income</td><td>50720</td><td>8160</td></tr></tbody></table>', 5, '2024-09-29 15:16:21', NULL),
(2027, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/delete/325', 'Menghapus data 325 pada Tabungan Nasabah', '', 5, '2024-09-29 15:16:42', NULL),
(2028, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 15:17:11', NULL),
(2029, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 15:17:38', NULL),
(2030, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/edit-save/80', 'Memperbaharui data Kardus pada Sampah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>deskripsi</td><td></td><td></td></tr><tr><td>price_per_kg</td><td>1600</td><td>1700</td></tr></tbody></table>', 5, '2024-09-29 15:18:30', NULL),
(2031, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/edit-save/327', 'Memperbaharui data  pada Tabungan Nasabah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody></tbody></table>', 5, '2024-09-29 15:19:22', NULL),
(2032, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/delete/327', 'Menghapus data 327 pada Tabungan Nasabah', '', 5, '2024-09-29 15:19:34', NULL),
(2033, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 15:20:04', NULL),
(2034, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/edit-save/6', 'Memperbaharui data Bodong A pada Sampah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>price_per_kg</td><td>4600</td><td>5000</td></tr></tbody></table>', 5, '2024-09-29 15:21:01', NULL),
(2035, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/edit-save/97', 'Memperbaharui data Besi pada Sampah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>deskripsi</td><td></td><td></td></tr><tr><td>price_per_kg</td><td>3600</td><td>3500</td></tr></tbody></table>', 5, '2024-09-29 15:21:15', NULL),
(2036, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 15:21:35', NULL),
(2037, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 15:21:54', NULL),
(2038, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/edit-save/97', 'Memperbaharui data Besi pada Sampah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>deskripsi</td><td></td><td></td></tr><tr><td>price_per_kg</td><td>3500</td><td>3800</td></tr></tbody></table>', 5, '2024-09-29 15:22:06', NULL),
(2039, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 15:22:33', NULL),
(2040, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/edit-save/324', 'Memperbaharui data  pada Tabungan Nasabah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>total_weight</td><td>10.25</td><td>10.35</td></tr><tr><td>total_income</td><td>10250</td><td>10350</td></tr></tbody></table>', 5, '2024-09-29 15:25:45', NULL),
(2041, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/delete/331', 'Menghapus data 331 pada Tabungan Nasabah', '', 5, '2024-09-29 15:26:31', NULL),
(2042, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/delete/330', 'Menghapus data 330 pada Tabungan Nasabah', '', 5, '2024-09-29 15:26:33', NULL),
(2043, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/delete/329', 'Menghapus data 329 pada Tabungan Nasabah', '', 5, '2024-09-29 15:26:35', NULL),
(2044, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/delete/328', 'Menghapus data 328 pada Tabungan Nasabah', '', 5, '2024-09-29 15:26:39', NULL),
(2045, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/delete/326', 'Menghapus data 326 pada Tabungan Nasabah', '', 5, '2024-09-29 15:26:41', NULL),
(2046, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/delete/324', 'Menghapus data 324 pada Tabungan Nasabah', '', 5, '2024-09-29 15:26:44', NULL),
(2047, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/delete/323', 'Menghapus data 323 pada Tabungan Nasabah', '', 5, '2024-09-29 15:27:10', NULL),
(2048, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/delete/322', 'Menghapus data 322 pada Tabungan Nasabah', '', 5, '2024-09-29 15:27:13', NULL),
(2049, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/nasabah/delete/92', 'Menghapus data Rojak pada Nasabah', '', 5, '2024-09-29 15:40:02', NULL),
(2050, '2001:448a:20b1:56e4:4bec:d9bc:88e1:c0e9', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/login', 'sumberRejeki@gmail.com login dengan IP Address 2001:448a:20b1:56e4:4bec:d9bc:88e1:c0e9', '', 26, '2024-09-29 15:40:38', NULL),
(2051, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 15:41:50', NULL),
(2052, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/edit-save/97', 'Memperbaharui data Besi pada Sampah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>deskripsi</td><td></td><td></td></tr><tr><td>price_per_kg</td><td>3800</td><td>3500</td></tr></tbody></table>', 5, '2024-09-29 15:42:16', NULL),
(2053, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 15:43:50', NULL),
(2054, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 15:44:07', NULL),
(2055, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 15:44:37', NULL),
(2056, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 15:44:53', NULL),
(2057, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 15:45:13', NULL),
(2058, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 15:45:29', NULL),
(2059, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 15:45:48', NULL),
(2060, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 15:48:35', NULL),
(2061, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 15:48:56', NULL),
(2062, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 15:49:32', NULL),
(2063, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/edit-save/80', 'Memperbaharui data Kardus pada Sampah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>deskripsi</td><td></td><td></td></tr><tr><td>price_per_kg</td><td>1700</td><td>1600</td></tr></tbody></table>', 5, '2024-09-29 15:50:07', NULL),
(2064, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 15:50:31', NULL),
(2065, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 15:51:03', NULL),
(2066, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 15:51:23', NULL),
(2067, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 15:51:40', NULL),
(2068, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/edit-save/345', 'Memperbaharui data  pada Tabungan Nasabah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>periode</td><td>13/9/2024</td><td>12/9/2024</td></tr></tbody></table>', 5, '2024-09-29 15:51:59', NULL),
(2069, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/edit-save/346', 'Memperbaharui data  pada Tabungan Nasabah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>periode</td><td>13/9/2024</td><td>12/9/2024</td></tr></tbody></table>', 5, '2024-09-29 15:52:06', NULL),
(2070, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 15:53:19', NULL),
(2071, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 15:53:38', NULL),
(2072, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 15:53:58', NULL),
(2073, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 15:54:35', NULL),
(2074, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 15:54:53', NULL),
(2075, '2001:448a:20b1:56e4:4bec:d9bc:88e1:c0e9', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Gelas kopi pada Sampah', '', 26, '2024-09-29 15:55:03', NULL),
(2076, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 15:55:23', NULL),
(2077, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/edit-save/92', 'Memperbaharui data Kaleng pada Sampah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>deskripsi</td><td></td><td></td></tr><tr><td>price_per_kg</td><td>2400</td><td>2600</td></tr></tbody></table>', 5, '2024-09-29 15:55:54', NULL),
(2078, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 15:56:24', NULL),
(2079, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 15:56:39', NULL),
(2080, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 15:57:20', NULL),
(2081, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 15:57:36', NULL),
(2082, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 15:58:05', NULL),
(2083, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 15:59:05', NULL),
(2084, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 15:59:20', NULL),
(2085, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 15:59:38', NULL),
(2086, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 16:00:34', NULL),
(2087, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 16:02:08', NULL),
(2088, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 16:02:24', NULL),
(2089, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 16:02:54', NULL),
(2090, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 16:03:11', NULL),
(2091, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 16:03:29', NULL),
(2092, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 16:03:57', NULL),
(2093, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 16:04:18', NULL),
(2094, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 16:04:44', NULL),
(2095, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 16:05:33', NULL),
(2096, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 16:05:52', NULL),
(2097, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 16:06:12', NULL),
(2098, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 16:06:27', NULL),
(2099, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 16:06:58', NULL),
(2100, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 16:07:14', NULL),
(2101, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 16:07:39', NULL),
(2102, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 16:08:31', NULL),
(2103, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 16:08:50', NULL),
(2104, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 16:09:19', NULL),
(2105, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 16:09:56', NULL),
(2106, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 16:10:15', NULL),
(2107, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 16:10:50', NULL),
(2108, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 16:11:13', NULL),
(2109, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 16:11:25', NULL),
(2110, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 16:11:54', NULL),
(2111, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 16:12:18', NULL),
(2112, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 16:12:33', NULL),
(2113, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 16:12:54', NULL),
(2114, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 16:13:24', NULL);
INSERT INTO `cms_logs` (`id`, `ipaddress`, `useragent`, `url`, `description`, `details`, `id_cms_users`, `created_at`, `updated_at`) VALUES
(2115, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 16:13:38', NULL),
(2116, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 16:13:58', NULL),
(2117, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 16:14:28', NULL),
(2118, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 16:14:52', NULL),
(2119, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 16:15:52', NULL),
(2120, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 16:16:07', NULL),
(2121, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 16:16:31', NULL),
(2122, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 16:17:04', NULL),
(2123, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 16:17:20', NULL),
(2124, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 16:17:41', NULL),
(2125, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 16:18:37', NULL),
(2126, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 16:19:09', NULL),
(2127, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 16:19:29', NULL),
(2128, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 16:20:11', NULL),
(2129, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 16:20:41', NULL),
(2130, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 16:21:00', NULL),
(2131, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 16:21:16', NULL),
(2132, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 16:21:44', NULL),
(2133, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 16:22:18', NULL),
(2134, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 16:22:42', NULL),
(2135, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 16:23:10', NULL),
(2136, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 16:23:34', NULL),
(2137, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 16:24:16', NULL),
(2138, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 16:25:11', NULL),
(2139, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/delete/413', 'Menghapus data 413 pada Tabungan Nasabah', '', 5, '2024-09-29 16:25:53', NULL),
(2140, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/edit-save/6', 'Memperbaharui data Bodong A pada Sampah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>price_per_kg</td><td>5000</td><td>4600</td></tr></tbody></table>', 5, '2024-09-29 16:26:45', NULL),
(2141, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 16:27:22', NULL),
(2142, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 16:27:48', NULL),
(2143, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 16:28:05', NULL),
(2144, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/edit-save/81', 'Memperbaharui data Gelas A pada Sampah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>price_per_kg</td><td>3700</td><td>3500</td></tr></tbody></table>', 5, '2024-09-29 16:28:30', NULL),
(2145, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 16:28:51', NULL),
(2146, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 16:29:37', NULL),
(2147, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 16:30:01', NULL),
(2148, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 16:32:48', NULL),
(2149, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/edit-save/6', 'Memperbaharui data Bodong A pada Sampah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>price_per_kg</td><td>4600</td><td>5000</td></tr></tbody></table>', 5, '2024-09-29 16:34:04', NULL),
(2150, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 16:34:37', NULL),
(2151, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/nasabah/edit-save/68', 'Memperbaharui data Riska pada Nasabah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>password</td><td>$2y$10$FP8Xv8b2blqils298BHLi.YHPkhpvBp7thkx7o0wkaytps6KFkrai</td><td>$2y$10$V8QvGkpuHfs557IAHxIJD.j882/rjDFbIs5O6FD4CubW0RsvBqADa</td></tr><tr><td>cms_user_id</td><td>5</td><td></td></tr><tr><td>address</td><td></td><td>mercu buana</td></tr><tr><td>phone_number</td><td></td><td>12345</td></tr><tr><td>picture</td><td></td><td>uploads/5/2024-09/tasbih.jpg</td></tr><tr><td>email_verified_at</td><td></td><td></td></tr><tr><td>remember_token</td><td></td><td></td></tr></tbody></table>', 5, '2024-09-29 16:58:35', NULL),
(2152, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 16:59:28', NULL),
(2153, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 16:59:49', NULL),
(2154, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 17:00:03', NULL),
(2155, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 17:00:16', NULL),
(2156, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 17:00:30', NULL),
(2157, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 17:00:55', NULL),
(2158, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 17:01:13', NULL),
(2159, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 17:01:31', NULL),
(2160, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/edit-save/7', 'Memperbaharui data Tutup Galon pada Sampah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>deskripsi</td><td></td><td></td></tr><tr><td>price_per_kg</td><td>6000</td><td>6500</td></tr></tbody></table>', 5, '2024-09-29 17:01:55', NULL),
(2161, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 17:02:19', NULL),
(2162, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 17:02:50', NULL),
(2163, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 17:03:06', NULL),
(2164, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 17:03:20', NULL),
(2165, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 17:03:36', NULL),
(2166, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 17:04:11', NULL),
(2167, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 17:04:24', NULL),
(2168, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 17:04:42', NULL),
(2169, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 17:04:55', NULL),
(2170, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 17:05:24', NULL),
(2171, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 17:05:37', NULL),
(2172, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 17:05:51', NULL),
(2173, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 17:06:35', NULL),
(2174, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 17:06:47', NULL),
(2175, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 17:07:05', NULL),
(2176, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 17:07:16', NULL),
(2177, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 17:07:30', NULL),
(2178, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 17:07:47', NULL),
(2179, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 17:08:21', NULL),
(2180, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 17:08:38', NULL),
(2181, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 17:08:54', NULL),
(2182, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 17:12:24', NULL),
(2183, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 17:12:38', NULL),
(2184, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 17:12:55', NULL),
(2185, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 17:13:07', NULL),
(2186, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 17:13:48', NULL),
(2187, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 17:14:02', NULL),
(2188, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 17:14:18', NULL),
(2189, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 17:14:52', NULL),
(2190, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 17:15:06', NULL),
(2191, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/edit-save/99', 'Memperbaharui data Asoy/kresek pada Sampah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>deskripsi</td><td></td><td></td></tr><tr><td>price_per_kg</td><td>500</td><td>560</td></tr></tbody></table>', 5, '2024-09-29 17:15:22', NULL),
(2192, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 17:15:43', NULL),
(2193, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 17:16:12', NULL),
(2194, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 17:16:28', NULL),
(2195, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 17:16:50', NULL),
(2196, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 17:17:39', NULL),
(2197, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 17:17:55', NULL),
(2198, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 17:18:10', NULL),
(2199, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 17:18:24', NULL),
(2200, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 17:19:14', NULL),
(2201, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 17:19:29', NULL),
(2202, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 17:19:47', NULL),
(2203, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 17:20:11', NULL),
(2204, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/delete/470', 'Menghapus data 470 pada Tabungan Nasabah', '', 5, '2024-09-29 17:20:27', NULL),
(2205, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/edit-save/6', 'Memperbaharui data Bodong A pada Sampah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>price_per_kg</td><td>5000</td><td>4600</td></tr></tbody></table>', 5, '2024-09-29 17:20:41', NULL),
(2206, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 17:21:13', NULL),
(2207, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 17:22:01', NULL),
(2208, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 17:22:17', NULL),
(2209, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 17:22:34', NULL),
(2210, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 17:22:49', NULL),
(2211, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 17:23:02', NULL),
(2212, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 17:23:16', NULL),
(2213, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 17:23:32', NULL),
(2214, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 17:23:49', NULL),
(2215, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/edit-save/6', 'Memperbaharui data Bodong A pada Sampah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>price_per_kg</td><td>4600</td><td>4400</td></tr></tbody></table>', 5, '2024-09-29 17:24:21', NULL),
(2216, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 17:24:48', NULL),
(2217, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 17:25:03', NULL),
(2218, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 17:25:27', NULL),
(2219, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 17:25:52', NULL),
(2220, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 17:26:21', NULL),
(2221, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 17:26:35', NULL),
(2222, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/delete/429', 'Menghapus data 429 pada Tabungan Nasabah', '', 5, '2024-09-29 17:34:01', NULL),
(2223, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/delete/438', 'Menghapus data 438 pada Tabungan Nasabah', '', 5, '2024-09-29 17:37:08', NULL),
(2224, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/edit-save/97', 'Memperbaharui data Besi pada Sampah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>deskripsi</td><td></td><td></td></tr><tr><td>price_per_kg</td><td>3500</td><td>3600</td></tr></tbody></table>', 5, '2024-09-29 17:37:53', NULL),
(2225, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 17:38:24', NULL),
(2226, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 17:38:59', NULL),
(2227, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/nasabah/edit-save/86', 'Memperbaharui data Ade saputra pada Nasabah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>password</td><td>$2y$10$lOehM/gGXvexGrZ2NYk.DO0OYuoqnVhjMupWhC6X/n7.aW27GbTIC</td><td>$2y$10$XANiDRiaNKtdxF1YfeU00O9vFUK9/y.GCgnUbg0jEnAa/ZW.r3Zz.</td></tr><tr><td>cms_user_id</td><td>5</td><td></td></tr><tr><td>email_verified_at</td><td></td><td></td></tr><tr><td>remember_token</td><td></td><td></td></tr></tbody></table>', 5, '2024-09-29 17:41:35', NULL),
(2228, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/delete/317', 'Menghapus data 317 pada Tabungan Nasabah', '', 5, '2024-09-29 17:48:04', NULL),
(2229, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/edit-save/86', 'Memperbaharui data Buku pada Sampah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>deskripsi</td><td></td><td></td></tr><tr><td>price_per_kg</td><td>1000</td><td>800</td></tr></tbody></table>', 5, '2024-09-29 17:48:56', NULL),
(2230, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 17:49:29', NULL),
(2231, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/nasabah/delete/58', 'Menghapus data Anton S pada Nasabah', '', 5, '2024-09-29 17:51:06', NULL),
(2232, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 17:53:08', NULL),
(2233, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/edit-save/6', 'Memperbaharui data Bodong A pada Sampah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>price_per_kg</td><td>4400</td><td>5000</td></tr></tbody></table>', 5, '2024-09-29 17:53:46', NULL),
(2234, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 17:54:10', NULL),
(2235, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 17:54:40', NULL),
(2236, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 17:55:05', NULL),
(2237, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 17:55:33', NULL),
(2238, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/nasabah/edit-save/82', 'Memperbaharui data Mochamad Billy Samudra pada Nasabah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>password</td><td>$2y$10$TrOxE6LdVbaRIUGx8Nt05OTot/7I8R0.uXpzZbeUcj8QEt.d2Faru</td><td>$2y$10$Ia6ansbqw6pRmpKCW23Z6uclG5hxxSGdNiEHFqHU/2MGVaq6DEeL6</td></tr><tr><td>cms_user_id</td><td>5</td><td></td></tr><tr><td>address</td><td></td><td>meruya</td></tr><tr><td>phone_number</td><td></td><td>12345</td></tr><tr><td>picture</td><td></td><td>uploads/5/2024-09/wolverine.png</td></tr><tr><td>email_verified_at</td><td></td><td></td></tr><tr><td>remember_token</td><td></td><td></td></tr></tbody></table>', 5, '2024-09-29 17:56:42', NULL),
(2239, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/nasabah/edit-save/79', 'Memperbaharui data Feri pada Nasabah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>password</td><td>$2y$10$qpG33m1QH5kq0FsCxHQBxO8LwmAykaanUFW.X7ZtA.50h41bJHToW</td><td>$2y$10$.pFZ.Ff.S5Qmli54l3gVLeu446XIoJReAN7glvs5h83x2HXJZuyMq</td></tr><tr><td>cms_user_id</td><td>5</td><td></td></tr><tr><td>email_verified_at</td><td></td><td></td></tr><tr><td>remember_token</td><td></td><td></td></tr></tbody></table>', 5, '2024-09-29 17:58:16', NULL),
(2240, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/nasabah/edit-save/71', 'Memperbaharui data Febri Arya pada Nasabah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>password</td><td>$2y$10$8ywt8t2JSk6UCHxSeTxXGeocF5Lel80sxdkfKn62lNcMnbgifYR5O</td><td>$2y$10$wA94CsgGwwts0fFHL4e1F.zEY/pDlNYXSVgazLtid0P/aDX1cs23i</td></tr><tr><td>cms_user_id</td><td>5</td><td></td></tr><tr><td>address</td><td></td><td>meruya</td></tr><tr><td>phone_number</td><td></td><td>12345</td></tr><tr><td>picture</td><td></td><td>uploads/5/2024-09/logo_flash.png</td></tr><tr><td>email_verified_at</td><td></td><td></td></tr><tr><td>remember_token</td><td></td><td></td></tr></tbody></table>', 5, '2024-09-29 17:59:18', NULL),
(2241, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/delete/180', 'Menghapus data 180 pada Tabungan Nasabah', '', 5, '2024-09-29 18:21:01', NULL),
(2242, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/edit-save/86', 'Memperbaharui data Buku pada Sampah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>deskripsi</td><td></td><td></td></tr><tr><td>price_per_kg</td><td>800</td><td>1000</td></tr></tbody></table>', 5, '2024-09-29 18:21:49', NULL),
(2243, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 18:22:11', NULL),
(2244, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/delete/172', 'Menghapus data 172 pada Tabungan Nasabah', '', 5, '2024-09-29 18:23:52', NULL),
(2245, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 18:24:24', NULL),
(2246, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/nasabah/edit-save/76', 'Memperbaharui data Husain pada Nasabah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>password</td><td>$2y$10$84lxOR4GMkDAfGuM/jPDx.Y66AtWcclc6kaf47.5pYJYqF8DUzgLW</td><td>$2y$10$e4uaTnjCP84KOhAxJVxAgOeXQOvHFHMN7U7CendeUaVMbEqLUtCDu</td></tr><tr><td>cms_user_id</td><td>5</td><td></td></tr><tr><td>address</td><td></td><td>mercu buana</td></tr><tr><td>phone_number</td><td></td><td>12345</td></tr><tr><td>picture</td><td></td><td>uploads/5/2024-09/spiderman.jpg</td></tr><tr><td>email_verified_at</td><td></td><td></td></tr><tr><td>remember_token</td><td></td><td></td></tr></tbody></table>', 5, '2024-09-29 18:27:24', NULL),
(2247, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/tukar_saldo/edit-save/35', 'Memperbaharui data  pada Tukar Saldo', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>status</td><td>Pending</td><td>Diterima</td></tr></tbody></table>', 5, '2024-09-29 18:29:23', NULL),
(2248, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/nasabah/edit-save/69', 'Memperbaharui data ILHAM BACHRI pada Nasabah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>password</td><td>$2y$10$Rekr02Hy8/UvqgkvC5MTDe0U05XJBuVJSxkF/1sxNlyf/NLrY8Ucu</td><td>$2y$10$HEQb9Nd6PruZPdoSpa4EvOMx/jdZaJXRcksTaU8r/JJlhARSTDHH6</td></tr><tr><td>cms_user_id</td><td>5</td><td></td></tr><tr><td>address</td><td></td><td>meruya</td></tr><tr><td>phone_number</td><td></td><td>123456</td></tr><tr><td>picture</td><td></td><td>uploads/5/2024-09/naruto.jpg</td></tr><tr><td>email_verified_at</td><td></td><td></td></tr><tr><td>remember_token</td><td></td><td></td></tr></tbody></table>', 5, '2024-09-29 18:30:44', NULL),
(2249, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/delete/122', 'Menghapus data 122 pada Tabungan Nasabah', '', 5, '2024-09-29 18:33:47', NULL),
(2250, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 18:34:13', NULL),
(2251, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/nasabah/edit-save/65', 'Memperbaharui data Ikhsan pada Nasabah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>password</td><td>$2y$10$r0NJbFjG8rvydIHSgfebVe.4JlozUYjM7MWIJbQ98JaFXYBrbUcky</td><td>$2y$10$STV6eh9Nra3U2wbMGNKmGeCBufeew46Y1vOodfa0rywxMIiesPrZa</td></tr><tr><td>cms_user_id</td><td>5</td><td></td></tr><tr><td>address</td><td></td><td>mercu buana</td></tr><tr><td>phone_number</td><td></td><td>123456</td></tr><tr><td>picture</td><td></td><td>uploads/5/2024-09/motor1.jpg</td></tr><tr><td>email_verified_at</td><td></td><td></td></tr><tr><td>remember_token</td><td></td><td></td></tr></tbody></table>', 5, '2024-09-29 18:37:45', NULL),
(2252, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 18:40:44', NULL),
(2253, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 18:40:59', NULL),
(2254, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/nasabah/edit-save/67', 'Memperbaharui data Imam pada Nasabah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>password</td><td>$2y$10$avSHjxyE.W6qlljWg9965.6pW4VOZN3H9LypC9u5yO0poCHWTb76O</td><td>$2y$10$nM2WkQvGdhb0WfixUJWCCua0XOJpGfBsOqgOJ45QVBzEYuhEAuZaO</td></tr><tr><td>cms_user_id</td><td>5</td><td></td></tr><tr><td>address</td><td></td><td>meruya</td></tr><tr><td>phone_number</td><td></td><td>123456</td></tr><tr><td>picture</td><td></td><td>uploads/5/2024-09/mobil2.jpg</td></tr><tr><td>email_verified_at</td><td></td><td></td></tr><tr><td>remember_token</td><td></td><td></td></tr></tbody></table>', 5, '2024-09-29 18:42:18', NULL),
(2255, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/delete/143', 'Menghapus data 143 pada Tabungan Nasabah', '', 5, '2024-09-29 18:43:49', NULL),
(2256, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 18:46:21', NULL);
INSERT INTO `cms_logs` (`id`, `ipaddress`, `useragent`, `url`, `description`, `details`, `id_cms_users`, `created_at`, `updated_at`) VALUES
(2257, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/nasabah/edit-save/72', 'Memperbaharui data Suminar pada Nasabah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>password</td><td>$2y$10$Kbm/pydOkCT7XvqjLamZrO4nXllYJTxoiyPrUimduI8zcBOA73xSy</td><td>$2y$10$FHq5xyjh.ASZeaxDd65vf.W7y22nV2e5A1dtbI.5Gp25hZU7Vtura</td></tr><tr><td>cms_user_id</td><td>5</td><td></td></tr><tr><td>address</td><td></td><td>mercu buana</td></tr><tr><td>phone_number</td><td></td><td>12345</td></tr><tr><td>picture</td><td></td><td>uploads/5/2024-09/2013_jeep_wrangler_rubicon_front_view_in_motion.jpg</td></tr><tr><td>email_verified_at</td><td></td><td></td></tr><tr><td>remember_token</td><td></td><td></td></tr></tbody></table>', 5, '2024-09-29 18:48:10', NULL),
(2258, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/nasabah/edit-save/75', 'Memperbaharui data Munir pada Nasabah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>password</td><td>$2y$10$tn1m/koHyBVyuF5YRHEwZeBmo.HkenzfboOO6wzU9z35SkjdSkyKW</td><td>$2y$10$4qt1AXZJR/xySrbgXYRY0uP9HG1hbhK5KFIUIv62gwhVSrhzlv/5e</td></tr><tr><td>cms_user_id</td><td>5</td><td></td></tr><tr><td>address</td><td></td><td>mercu buana</td></tr><tr><td>phone_number</td><td></td><td>123445</td></tr><tr><td>picture</td><td></td><td>uploads/5/2024-09/03_jeep_rubicon_10th_anniv_la.jpg</td></tr><tr><td>email_verified_at</td><td></td><td></td></tr><tr><td>remember_token</td><td></td><td></td></tr></tbody></table>', 5, '2024-09-29 18:49:54', NULL),
(2259, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/nasabah/edit-save/74', 'Memperbaharui data Namin pada Nasabah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>password</td><td>$2y$10$fU/FaEYqppxL6st/9Lj1Mea6/mnOL3stg2ZQ/6kcatOly6szpVs3C</td><td>$2y$10$4VogAsUDttqBhYXcjx4hfOCp./u6uYZgxDr0OWzMxNA2fL248lrGS</td></tr><tr><td>cms_user_id</td><td>5</td><td></td></tr><tr><td>address</td><td></td><td>mercu buana</td></tr><tr><td>phone_number</td><td></td><td>123456</td></tr><tr><td>picture</td><td></td><td>uploads/5/2024-09/tameng_ca.jpg</td></tr><tr><td>email_verified_at</td><td></td><td></td></tr><tr><td>remember_token</td><td></td><td></td></tr></tbody></table>', 5, '2024-09-29 18:50:54', NULL),
(2260, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/delete/477', 'Menghapus data 477 pada Tabungan Nasabah', '', 5, '2024-09-29 19:01:51', NULL),
(2261, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 19:02:16', NULL),
(2262, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/nasabah/edit-save/73', 'Memperbaharui data Ahyudin pada Nasabah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>password</td><td>$2y$10$7qnm9uEIc3rC2iG7iztXGOUD4EIFF4KUo.E0u1ci3nPgl1sgHVkQq</td><td>$2y$10$vTJgHybAO4ulV7qFq6T1eO6Z/9Tzp0I6eo6YyA1ICoJcGzXbWSHla</td></tr><tr><td>cms_user_id</td><td>5</td><td></td></tr><tr><td>email_verified_at</td><td></td><td></td></tr><tr><td>remember_token</td><td></td><td></td></tr></tbody></table>', 5, '2024-09-29 19:05:15', NULL),
(2263, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/delete/261', 'Menghapus data 261 pada Tabungan Nasabah', '', 5, '2024-09-29 19:09:27', NULL),
(2264, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/edit-save/6', 'Memperbaharui data Bodong A pada Sampah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>price_per_kg</td><td>5000</td><td>4600</td></tr></tbody></table>', 5, '2024-09-29 19:10:03', NULL),
(2265, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 19:11:00', NULL),
(2266, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/delete/267', 'Menghapus data 267 pada Tabungan Nasabah', '', 5, '2024-09-29 19:12:20', NULL),
(2267, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/edit-save/6', 'Memperbaharui data Bodong A pada Sampah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>price_per_kg</td><td>4600</td><td>4400</td></tr></tbody></table>', 5, '2024-09-29 19:12:28', NULL),
(2268, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 19:12:52', NULL),
(2269, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/delete/263', 'Menghapus data 263 pada Tabungan Nasabah', '', 5, '2024-09-29 19:14:40', NULL),
(2270, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/edit-save/6', 'Memperbaharui data Bodong A pada Sampah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>price_per_kg</td><td>4400</td><td>4600</td></tr></tbody></table>', 5, '2024-09-29 19:14:50', NULL),
(2271, '2001:448a:20b1:66f3:c19f:ced7:66c4:ee5a', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-29 19:15:22', NULL),
(2272, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 103.164.223.186', '', 5, '2024-09-30 10:14:36', NULL),
(2273, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/edit-save/6', 'Memperbaharui data Bodong A pada Sampah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>price_per_kg</td><td>4600</td><td>5000</td></tr></tbody></table>', 5, '2024-09-30 10:25:20', NULL),
(2274, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-30 10:25:47', NULL),
(2275, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-30 10:26:21', NULL),
(2276, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-30 10:26:47', NULL),
(2277, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-30 10:27:07', NULL),
(2278, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-30 10:27:28', NULL),
(2279, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-30 10:28:11', NULL),
(2280, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-30 10:28:37', NULL),
(2281, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-30 10:28:59', NULL),
(2282, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-30 10:29:26', NULL),
(2283, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-30 10:29:47', NULL),
(2284, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-30 10:30:19', NULL),
(2285, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-30 10:30:54', NULL),
(2286, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-30 10:31:14', NULL),
(2287, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-30 10:32:05', NULL),
(2288, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-30 10:32:33', NULL),
(2289, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-30 10:32:58', NULL),
(2290, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-30 10:33:27', NULL),
(2291, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-30 10:33:52', NULL),
(2292, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-30 10:34:06', NULL),
(2293, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-30 10:34:28', NULL),
(2294, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-30 10:34:58', NULL),
(2295, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-30 10:35:22', NULL),
(2296, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-30 10:35:39', NULL),
(2297, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-30 10:36:07', NULL),
(2298, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-30 10:36:29', NULL),
(2299, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-30 10:36:52', NULL),
(2300, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-30 10:37:14', NULL),
(2301, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-30 10:37:35', NULL),
(2302, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-30 10:37:50', NULL),
(2303, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-30 10:38:10', NULL),
(2304, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-30 10:38:30', NULL),
(2305, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-30 10:38:46', NULL),
(2306, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-30 10:39:07', NULL),
(2307, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-30 10:39:28', NULL),
(2308, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-30 10:39:52', NULL),
(2309, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-30 10:40:12', NULL),
(2310, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-30 10:40:39', NULL),
(2311, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-30 10:40:53', NULL),
(2312, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-30 10:41:09', NULL),
(2313, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-30 10:41:24', NULL),
(2314, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-30 10:48:15', NULL),
(2315, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-30 10:48:33', NULL),
(2316, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-30 10:48:59', NULL),
(2317, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-30 10:49:21', NULL),
(2318, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/delete/540', 'Menghapus data 540 pada Tabungan Nasabah', '', 5, '2024-09-30 10:51:40', NULL),
(2319, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/edit-save/98', 'Memperbaharui data Gabruk pada Sampah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>price_per_kg</td><td>1000</td><td>800</td></tr></tbody></table>', 5, '2024-09-30 10:52:16', NULL),
(2320, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-30 10:52:41', NULL),
(2321, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/nasabah/edit-save/70', 'Memperbaharui data Aman abdu rahman pada Nasabah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>password</td><td>$2y$10$nsLT5HnbFxUlnSX/MU1IlOQaDsfBiE6YWpbH9oceDhFYVxqmsZVXG</td><td>$2y$10$eqhLbksw4UYZVBOOQecJb.CrtMQS.mICztbvYktNMPULil1KfV05.</td></tr><tr><td>cms_user_id</td><td>5</td><td></td></tr><tr><td>address</td><td></td><td>mercu buana</td></tr><tr><td>phone_number</td><td></td><td>12345</td></tr><tr><td>picture</td><td></td><td>uploads/5/2024-09/batman.png</td></tr><tr><td>email_verified_at</td><td></td><td></td></tr><tr><td>remember_token</td><td></td><td></td></tr></tbody></table>', 5, '2024-09-30 11:08:31', NULL),
(2322, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/nasabah/delete/87', 'Menghapus data Mira pada Nasabah', '', 5, '2024-09-30 11:16:50', NULL),
(2323, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-30 11:18:25', NULL),
(2324, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-30 11:18:53', NULL),
(2325, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/sampah/edit-save/98', 'Memperbaharui data Gabruk pada Sampah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>price_per_kg</td><td>800</td><td>1000</td></tr></tbody></table>', 5, '2024-09-30 11:19:13', NULL),
(2326, '103.164.223.186', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-09-30 11:19:45', NULL),
(2327, '2001:448a:20b1:66f3:7c28:2e8e:b1ff:85a3', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 2001:448a:20b1:66f3:7c28:2e8e:b1ff:85a3', '', 5, '2024-09-30 20:25:46', NULL),
(2328, '182.2.167.156', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 182.2.167.156', '', 5, '2024-10-01 15:52:04', NULL),
(2329, '182.2.167.156', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-10-01 15:53:02', NULL),
(2330, '2001:448a:20b1:7ff5:492e:5fdb:6bcb:e617', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'admin_bankimam@gmail.com login dengan IP Address 2001:448a:20b1:7ff5:492e:5fdb:6bcb:e617', '', 10, '2024-10-02 06:55:43', NULL),
(2331, '114.10.64.198', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 114.10.64.198', '', 5, '2024-10-02 11:10:58', NULL),
(2332, '120.29.153.118', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 120.29.153.118', '', 5, '2024-10-02 12:47:13', NULL),
(2333, '114.124.205.120', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 114.124.205.120', '', 5, '2024-10-02 14:41:07', NULL),
(2334, '114.124.205.120', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/sampah/edit-save/80', 'Memperbaharui data Kardus pada Sampah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>deskripsi</td><td></td><td></td></tr><tr><td>price_per_kg</td><td>1600</td><td>1500</td></tr></tbody></table>', 5, '2024-10-02 14:41:56', NULL),
(2335, '120.29.153.118', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 OPR/114.0.0.0', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 120.29.153.118', '', 5, '2024-10-04 09:52:00', NULL),
(2336, '120.29.153.118', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 OPR/114.0.0.0', 'https://bangimam.com/admin/sampah/edit-save/98', 'Memperbaharui data Gabruk pada Sampah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>price_per_kg</td><td>1000</td><td>800</td></tr></tbody></table>', 5, '2024-10-04 09:52:12', NULL),
(2337, '182.0.133.127', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 182.0.133.127', '', 5, '2024-10-04 14:23:04', NULL),
(2338, '182.0.133.127', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-10-04 14:23:53', NULL),
(2339, '182.0.133.127', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/nasabah/edit-save/77', 'Memperbaharui data Citra Sentosa pada Nasabah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>password</td><td>$2y$10$8pCPUq.CHKKpbheugyGfQ.woo9AmLd7XfggGJMJ3ejyBBoqhkD6Yi</td><td>$2y$10$Httikw9j81SMdALtE7SHMO7yHAayMZGt6KRU6NALyFf6kJb.jYl.C</td></tr><tr><td>cms_user_id</td><td>5</td><td></td></tr><tr><td>email_verified_at</td><td></td><td></td></tr><tr><td>remember_token</td><td></td><td></td></tr></tbody></table>', 5, '2024-10-04 14:27:02', NULL),
(2340, '182.0.133.127', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-10-04 14:29:59', NULL),
(2341, '182.0.133.127', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-10-04 14:30:39', NULL),
(2342, '182.0.133.127', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Lapak/sandal/sepatu pada Sampah', '', 5, '2024-10-04 14:32:57', NULL),
(2343, '182.0.133.127', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-10-04 14:33:25', NULL),
(2344, '120.29.153.118', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 OPR/114.0.0.0', 'https://bangimam.com/admin/logout', 'bsu1@gmail.com keluar', '', 5, '2024-10-04 16:17:56', NULL),
(2345, '182.0.169.80', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 182.0.169.80', '', 5, '2024-10-05 14:23:16', NULL),
(2346, '182.0.169.80', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-10-05 14:26:14', NULL),
(2347, '182.0.173.144', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-10-05 14:35:44', NULL),
(2348, '182.0.173.144', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-10-05 14:36:07', NULL),
(2349, '182.0.173.144', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-10-05 14:36:31', NULL),
(2350, '182.0.173.144', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-10-05 14:36:52', NULL),
(2351, '182.0.173.144', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-10-05 14:37:14', NULL),
(2352, '182.0.173.144', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-10-05 14:37:38', NULL),
(2353, '182.0.173.144', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-10-05 14:38:01', NULL),
(2354, '182.0.173.144', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-10-05 14:38:19', NULL),
(2355, '182.0.173.144', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/logout', 'bsu1@gmail.com keluar', '', 5, '2024-10-05 14:38:38', NULL),
(2356, '112.78.131.3', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 112.78.131.3', '', 5, '2024-10-07 09:58:34', NULL),
(2357, '182.3.42.183', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'admin_bankimam@gmail.com login dengan IP Address 182.3.42.183', '', 10, '2024-10-07 14:06:43', NULL),
(2358, '182.3.42.183', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'admin_bankimam@gmail.com keluar', '', 10, '2024-10-07 14:39:17', NULL),
(2359, '182.3.42.183', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'rptraMenara@gmail.com login dengan IP Address 182.3.42.183', '', 24, '2024-10-07 14:41:26', NULL),
(2360, '182.3.42.183', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/logout', 'rptraMenara@gmail.com keluar', '', 24, '2024-10-07 14:43:46', NULL),
(2361, '2001:448a:20b1:56e4:348d:feb3:acde:e004', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/login', 'sumberRejeki@gmail.com login dengan IP Address 2001:448a:20b1:56e4:348d:feb3:acde:e004', '', 26, '2024-10-11 11:10:16', NULL),
(2362, '114.10.65.60', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 114.10.65.60', '', 5, '2024-10-11 11:26:10', NULL),
(2363, '2001:448a:20b1:56e4:348d:feb3:acde:e004', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Gelas A pada Sampah', '', 26, '2024-10-11 11:48:31', NULL),
(2364, '182.0.143.240', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 182.0.143.240', '', 5, '2024-10-14 11:12:20', NULL),
(2365, '182.0.143.240', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/logout', 'bsu1@gmail.com keluar', '', 5, '2024-10-14 11:13:30', NULL),
(2366, '182.0.143.240', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/logout', ' keluar', '', NULL, '2024-10-14 11:14:05', NULL),
(2367, '182.0.143.240', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/logout', ' keluar', '', NULL, '2024-10-14 11:14:11', NULL),
(2368, '182.0.143.240', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/logout', ' keluar', '', NULL, '2024-10-14 11:14:17', NULL),
(2369, '120.29.153.118', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'bsu1@gmail.com login dengan IP Address 120.29.153.118', '', 5, '2024-10-15 08:18:37', NULL),
(2370, '120.29.153.118', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 5, '2024-10-15 08:19:16', NULL),
(2371, '2001:448a:20b1:56e4:1904:a114:4ab7:5907', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/login', 'sumberRejeki@gmail.com login dengan IP Address 2001:448a:20b1:56e4:1904:a114:4ab7:5907', '', 26, '2024-10-21 09:53:37', NULL),
(2372, '2001:448a:20b1:56e4:f420:98d1:6dcd:86fc', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/login', 'sumberRejeki@gmail.com login dengan IP Address 2001:448a:20b1:56e4:f420:98d1:6dcd:86fc', '', 26, '2024-10-22 13:12:42', NULL),
(2373, '2001:448a:20b1:56e4:f420:98d1:6dcd:86fc', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/login', 'sumberRejeki@gmail.com login dengan IP Address 2001:448a:20b1:56e4:f420:98d1:6dcd:86fc', '', 26, '2024-10-22 13:14:03', NULL),
(2374, '2001:448a:20b1:56e4:f420:98d1:6dcd:86fc', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/login', 'sumberRejeki@gmail.com login dengan IP Address 2001:448a:20b1:56e4:f420:98d1:6dcd:86fc', '', 26, '2024-10-22 13:14:33', NULL),
(2375, '2001:448a:20b1:56e4:f420:98d1:6dcd:86fc', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/sampah_categories/add-save', 'Tambah data baru Almunium pada Kategori Sampah', '', 26, '2024-10-22 13:24:16', NULL),
(2376, '2001:448a:20b1:56e4:f420:98d1:6dcd:86fc', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/sampah_categories/add-save', 'Tambah data baru Kabin pada Kategori Sampah', '', 26, '2024-10-22 13:27:38', NULL),
(2377, '2001:448a:20b1:56e4:f420:98d1:6dcd:86fc', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/sampah_categories/add-save', 'Tambah data baru Kaleng pada Kategori Sampah', '', 26, '2024-10-22 13:28:26', NULL),
(2378, '2001:448a:20b1:56e4:f420:98d1:6dcd:86fc', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/sampah_categories/add-save', 'Tambah data baru Beling pada Kategori Sampah', '', 26, '2024-10-22 13:29:23', NULL),
(2379, '2001:448a:20b1:56e4:f420:98d1:6dcd:86fc', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Beling pada Sampah', '', 26, '2024-10-22 13:36:08', NULL),
(2380, '2001:448a:20b1:56e4:f420:98d1:6dcd:86fc', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Putihan pada Sampah', '', 26, '2024-10-22 13:38:56', NULL),
(2381, '2001:448a:20b1:56e4:f420:98d1:6dcd:86fc', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Lemineral pada Sampah', '', 26, '2024-10-22 13:42:13', NULL),
(2382, '2001:448a:20b1:56e4:f420:98d1:6dcd:86fc', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Tutup Galon isi ulang/Aqua pada Sampah', '', 26, '2024-10-22 13:50:48', NULL),
(2383, '2001:448a:20b1:56e4:f420:98d1:6dcd:86fc', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Tutup Botol pada Sampah', '', 26, '2024-10-22 13:53:15', NULL),
(2384, '2001:448a:20b1:56e4:f420:98d1:6dcd:86fc', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Inject pada Sampah', '', 26, '2024-10-22 13:58:26', NULL),
(2385, '2001:448a:20b1:56e4:f420:98d1:6dcd:86fc', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/sampah_categories/add-save', 'Tambah data baru Karton pada Kategori Sampah', '', 26, '2024-10-22 14:00:34', NULL),
(2386, '2001:448a:20b1:56e4:f420:98d1:6dcd:86fc', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Boncos pada Sampah', '', 26, '2024-10-22 14:03:56', NULL),
(2387, '2001:448a:20b1:56e4:f420:98d1:6dcd:86fc', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Almuniun Plat pada Sampah', '', 26, '2024-10-22 14:10:09', NULL),
(2388, '2001:448a:20b1:56e4:f420:98d1:6dcd:86fc', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Almunium Rongsok pada Sampah', '', 26, '2024-10-22 14:13:27', NULL),
(2389, '2001:448a:20b1:56e4:f420:98d1:6dcd:86fc', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Keleng pada Sampah', '', 26, '2024-10-22 14:16:34', NULL),
(2390, '2001:448a:20b1:56e4:f420:98d1:6dcd:86fc', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/sampah_categories/add-save', 'Tambah data baru Gabruk pada Kategori Sampah', '', 26, '2024-10-22 14:18:25', NULL),
(2391, '2001:448a:20b1:56e4:f420:98d1:6dcd:86fc', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Gabruk pada Sampah', '', 26, '2024-10-22 14:23:29', NULL),
(2392, '2001:448a:20b1:56e4:f420:98d1:6dcd:86fc', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/sampah/edit-save/116', 'Memperbaharui data Almuniun panci pada Sampah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>name</td><td>Almuniun Plat</td><td>Almuniun panci</td></tr><tr><td>deskripsi</td><td></td><td></td></tr><tr><td>price_per_kg</td><td>15300</td><td>1955</td></tr></tbody></table>', 26, '2024-10-22 14:25:01', NULL),
(2393, '2001:448a:20b1:56e4:f420:98d1:6dcd:86fc', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Bodong Warna pada Sampah', '', 26, '2024-10-22 14:28:36', NULL),
(2394, '2001:448a:20b1:56e4:f420:98d1:6dcd:86fc', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/sampah_categories/add-save', 'Tambah data baru Karet pada Kategori Sampah', '', 26, '2024-10-22 14:30:30', NULL),
(2395, '2001:448a:20b1:56e4:f420:98d1:6dcd:86fc', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/sampah/add-save', 'Tambah data baru Karpet pada Sampah', '', 26, '2024-10-22 14:33:18', NULL),
(2396, '2001:448a:20b1:56e4:f420:98d1:6dcd:86fc', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/transactions/add-save', 'Tambah data baru  pada Tabungan Nasabah', '', 26, '2024-10-22 14:37:34', NULL),
(2397, '2001:448a:20b1:56e4:f420:98d1:6dcd:86fc', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/logout', 'sumberRejeki@gmail.com keluar', '', 26, '2024-10-22 14:38:35', NULL),
(2398, '2001:448a:20b1:56e4:f420:98d1:6dcd:86fc', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Mobile Safari/537.36', 'https://bangimam.com/admin/login', 'sumberRejeki@gmail.com login dengan IP Address 2001:448a:20b1:56e4:f420:98d1:6dcd:86fc', '', 26, '2024-10-22 14:46:54', NULL),
(2399, '114.10.65.118', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/login', 'sumberRejeki@gmail.com login dengan IP Address 114.10.65.118', '', 26, '2024-10-22 15:48:24', NULL),
(2400, '114.10.65.118', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'https://bangimam.com/admin/nasabah/edit-save/114', 'Memperbaharui data Samsi pada Nasabah', '<table class=\"table table-striped\"><thead><tr><th>Key</th><th>Old Value</th><th>New Value</th></thead><tbody><tr><td>username</td><td>Samai</td><td>Samsi</td></tr><tr><td>password</td><td>$2y$10$7tufXNtWV5py7O/RNYotDOiE46ZqD8R8HTI1KcNCaqyhSouH7HoCG</td><td></td></tr><tr><td>cms_user_id</td><td>26</td><td></td></tr><tr><td>address</td><td></td><td>jl</td></tr><tr><td>phone_number</td><td></td><td>0808080808</td></tr><tr><td>picture</td><td></td><td>uploads/26/2024-10/foto_guru.png</td></tr><tr><td>email_verified_at</td><td></td><td></td></tr><tr><td>remember_token</td><td></td><td></td></tr></tbody></table>', 26, '2024-10-22 15:51:04', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cms_menus`
--

CREATE TABLE `cms_menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'url',
  `path` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `is_dashboard` tinyint(1) NOT NULL DEFAULT 0,
  `id_cms_privileges` int(11) DEFAULT NULL,
  `sorting` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_menus`
--

INSERT INTO `cms_menus` (`id`, `name`, `type`, `path`, `color`, `icon`, `parent_id`, `is_active`, `is_dashboard`, `id_cms_privileges`, `sorting`, `created_at`, `updated_at`) VALUES
(23, 'Kategori Sampah', 'Route', 'AdminSampahCategoriesControllerGetIndex', 'normal', 'fa fa-list', 0, 1, 0, 1, 3, '2023-04-09 11:08:04', '2024-08-16 16:06:02'),
(24, 'Sampah', 'Route', 'AdminSampahControllerGetIndex', 'normal', 'fa fa-trash-o', 0, 1, 0, 1, 4, '2023-04-09 11:09:36', '2024-08-16 16:06:12'),
(26, 'Rewards', 'Route', 'AdminRewardsControllerGetIndex', 'normal', 'fa fa-gift', 0, 1, 0, 1, 5, '2023-04-09 11:21:27', '2024-08-16 16:06:40'),
(30, 'Nasabah', 'Route', 'AdminNasabahControllerGetIndex', 'normal', 'fa fa-users', 0, 1, 0, 1, 11, '2023-04-15 23:51:02', '2024-08-17 14:59:01'),
(31, 'Tabungan Nasabah', 'Route', 'AdminTransactionsControllerGetIndex', 'normal', 'fa fa-exchange', 43, 1, 0, 1, 1, '2023-04-15 23:53:36', '2024-09-04 13:48:01'),
(32, 'Poin', 'Route', 'AdminPointsControllerGetIndex', 'normal', 'fa fa-money', 0, 1, 0, 1, 8, '2023-05-08 00:47:26', '2024-08-17 14:58:39'),
(33, 'Tukar Poin', 'Route', 'AdminTukarPoinsControllerGetIndex', 'normal', 'fa fa-trophy', 44, 1, 0, 1, 1, '2023-05-08 00:59:42', '2024-08-17 14:58:23'),
(35, 'Konten Edukasi', 'Route', 'AdminEducationControllerGetIndex', 'normal', 'fa fa-book', 0, 1, 0, 1, 10, '2024-08-08 03:30:51', '2024-08-17 14:58:53'),
(36, 'Saldo', 'Route', 'AdminSaldoControllerGetIndex', 'normal', 'fa fa-money', 0, 1, 0, 1, 9, '2024-08-09 01:36:42', '2024-08-17 14:59:32'),
(37, 'Tukar Saldo', 'Route', 'AdminTukarSaldoControllerGetIndex', 'normal', 'fa fa-trophy', 44, 1, 0, 1, 2, '2024-08-09 07:22:06', '2024-08-17 14:58:29'),
(38, 'Dashboard', 'Statistic', 'statistic_builder/show/dashboard', 'red', 'fa fa-search', 0, 1, 1, 1, 2, '2024-08-12 11:38:49', '2024-08-16 16:05:36'),
(40, 'Pengumuman', 'Route', 'AdminPengumumanControllerGetIndex', 'normal', 'fa fa-envelope-o', 0, 1, 0, 4, 12, '2024-08-14 07:19:20', '2024-08-17 14:59:13'),
(42, 'Transaksi BSI', 'Route', 'AdminTransactionsBsiControllerGetIndex', 'normal', 'fa fa-money', 43, 1, 0, 4, 2, '2024-08-14 11:02:18', '2024-08-17 14:57:35'),
(43, 'Setoran Sampah', 'Module', 'transactions', 'normal', 'fa fa-arrow-right', 0, 1, 0, 4, 6, '2024-08-14 13:21:33', '2024-09-04 14:36:49'),
(44, 'Tukar Rewards', 'Module', 'tukar_poins', 'normal', 'fa fa-trophy', 0, 1, 0, 4, 7, '2024-08-14 13:23:15', '2024-08-17 14:58:15'),
(45, 'Dashboard  Admin', 'Statistic', 'statistic_builder/show/dashboard-super-admin', 'normal', 'fa fa-search', 0, 1, 1, 1, 1, '2024-08-16 16:05:24', '2024-08-17 14:57:55'),
(46, 'Manajemen Pengguna', 'URL', '#', 'normal', 'fa fa-users', 0, 1, 0, 1, 13, '2024-08-20 12:46:20', '2024-08-21 20:06:12'),
(47, 'Tambah Pengguna', 'URL', 'https://bangimam.com/admin/users/add', 'normal', 'fa fa-plus', 46, 1, 0, 1, 1, '2024-08-20 12:47:22', NULL),
(48, 'Daftar Pengguna', 'URL', 'https://bangimam.com/admin/users', 'normal', 'fa fa-navicon', 46, 1, 0, 1, 2, '2024-08-20 12:49:01', NULL),
(49, 'Laporan Keuangan', 'Route', 'AdminLaporanKeuanganControllerGetIndex', 'normal', 'fa fa-envelope-o', 0, 1, 0, 1, 14, '2024-09-23 16:55:19', '2024-09-23 21:59:05');

-- --------------------------------------------------------

--
-- Table structure for table `cms_menus_privileges`
--

CREATE TABLE `cms_menus_privileges` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_cms_menus` int(11) DEFAULT NULL,
  `id_cms_privileges` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_menus_privileges`
--

INSERT INTO `cms_menus_privileges` (`id`, `id_cms_menus`, `id_cms_privileges`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 2),
(6, 6, 2),
(7, 7, 2),
(8, 8, 1),
(16, 9, 2),
(17, 12, 2),
(19, 10, 2),
(20, 11, 2),
(21, 13, 1),
(22, 14, 2),
(23, 15, 1),
(25, 16, 2),
(26, 17, 1),
(27, 18, 1),
(28, 19, 1),
(29, 20, 1),
(30, 21, 1),
(31, 22, 1),
(34, 25, 1),
(36, 27, 1),
(37, 28, 1),
(38, 29, 1),
(46, 34, 2),
(47, 34, 1),
(61, 39, 4),
(87, 41, 4),
(103, 38, 4),
(104, 23, 4),
(105, 24, 4),
(106, 26, 4),
(115, 42, 2),
(116, 42, 4),
(117, 42, 1),
(118, 45, 2),
(119, 45, 1),
(120, 44, 2),
(121, 44, 4),
(122, 44, 1),
(123, 33, 2),
(124, 33, 4),
(125, 33, 1),
(126, 37, 2),
(127, 37, 4),
(128, 37, 1),
(129, 32, 2),
(130, 32, 1),
(133, 35, 2),
(134, 35, 4),
(135, 35, 1),
(136, 30, 2),
(137, 30, 4),
(138, 30, 1),
(139, 40, 2),
(140, 40, 4),
(141, 40, 1),
(145, 36, 2),
(146, 36, 1),
(148, 47, 2),
(149, 48, 2),
(151, 46, 2),
(155, 31, 2),
(156, 31, 4),
(157, 31, 1),
(158, 43, 2),
(159, 43, 4),
(160, 43, 1),
(165, 49, 2),
(166, 49, 4),
(167, 49, 1);

-- --------------------------------------------------------

--
-- Table structure for table `cms_moduls`
--

CREATE TABLE `cms_moduls` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `table_name` varchar(255) DEFAULT NULL,
  `controller` varchar(255) DEFAULT NULL,
  `is_protected` tinyint(1) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_moduls`
--

INSERT INTO `cms_moduls` (`id`, `name`, `icon`, `path`, `table_name`, `controller`, `is_protected`, `is_active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Notifications', 'fa fa-cog', 'notifications', 'cms_notifications', 'NotificationsController', 1, 1, '2023-03-24 10:56:41', NULL, NULL),
(2, 'Privileges', 'fa fa-cog', 'privileges', 'cms_privileges', 'PrivilegesController', 1, 1, '2023-03-24 10:56:41', NULL, NULL),
(3, 'Privileges Roles', 'fa fa-cog', 'privileges_roles', 'cms_privileges_roles', 'PrivilegesRolesController', 1, 1, '2023-03-24 10:56:41', NULL, NULL),
(4, 'Users Management', 'fa fa-users', 'users', 'cms_users', 'AdminCmsUsersController', 0, 1, '2023-03-24 10:56:41', NULL, NULL),
(5, 'Settings', 'fa fa-cog', 'settings', 'cms_settings', 'SettingsController', 1, 1, '2023-03-24 10:56:41', NULL, NULL),
(6, 'Module Generator', 'fa fa-database', 'module_generator', 'cms_moduls', 'ModulsController', 1, 1, '2023-03-24 10:56:41', NULL, NULL),
(7, 'Menu Management', 'fa fa-bars', 'menu_management', 'cms_menus', 'MenusController', 1, 1, '2023-03-24 10:56:41', NULL, NULL),
(8, 'Email Templates', 'fa fa-envelope-o', 'email_templates', 'cms_email_templates', 'EmailTemplatesController', 1, 1, '2023-03-24 10:56:41', NULL, NULL),
(9, 'Statistic Builder', 'fa fa-dashboard', 'statistic_builder', 'cms_statistics', 'StatisticBuilderController', 1, 1, '2023-03-24 10:56:41', NULL, NULL),
(10, 'API Generator', 'fa fa-cloud-download', 'api_generator', '', 'ApiCustomController', 1, 1, '2023-03-24 10:56:41', NULL, NULL),
(11, 'Log User Access', 'fa fa-flag-o', 'logs', 'cms_logs', 'LogsController', 1, 1, '2023-03-24 10:56:41', NULL, NULL),
(24, 'Kategori Sampah', 'fa fa-list', 'sampah_categories', 'sampah_categories', 'AdminSampahCategoriesController', 0, 0, '2023-04-09 11:08:04', NULL, NULL),
(25, 'Sampah', 'fa fa-trash-o', 'sampah', 'sampah', 'AdminSampahController', 0, 0, '2023-04-09 11:09:36', NULL, NULL),
(27, 'Rewards', 'fa fa-gift', 'rewards', 'rewards', 'AdminRewardsController', 0, 0, '2023-04-09 11:21:27', NULL, NULL),
(29, 'Nasabah', 'fa fa-users', 'nasabah', 'users', 'AdminNasabahController', 0, 0, '2023-04-15 23:51:02', NULL, NULL),
(30, 'Tabungan Nasabah', 'fa fa-money', 'transactions', 'transactions', 'AdminTransactionsController', 0, 0, '2023-04-15 23:53:36', NULL, NULL),
(31, 'Poin', 'fa fa-money', 'points', 'points', 'AdminPointsController', 0, 0, '2023-05-08 00:47:26', NULL, NULL),
(32, 'Tukar Poin', 'fa fa-trophy', 'tukar_poins', 'tukar_poins', 'AdminTukarPoinsController', 0, 0, '2023-05-08 00:59:42', NULL, NULL),
(33, 'Konten Edukasi', 'fa fa-file-o', 'education', 'education', 'AdminEducationController', 0, 0, '2024-08-08 03:30:51', NULL, NULL),
(34, 'Saldo', 'fa fa-money', 'saldo', 'saldo', 'AdminSaldoController', 0, 0, '2024-08-09 01:36:42', NULL, NULL),
(35, 'Tukar Saldo', 'fa fa-trademark', 'tukar_saldo', 'tukar_saldo', 'AdminTukarSaldoController', 0, 0, '2024-08-09 07:22:06', NULL, NULL),
(36, 'Pengumuman', 'fa fa-envelope-o', 'pengumuman', 'pengumuman', 'AdminPengumumanController', 0, 0, '2024-08-14 07:19:20', NULL, NULL),
(37, 'Laporan', 'fa fa-glass', 'transactions37', 'transactions', 'AdminTransactions37Controller', 0, 0, '2024-08-14 09:20:45', NULL, NULL),
(38, 'Transaksi BSI', 'fa fa-money', 'transactions_bsi', 'transactions_bsi', 'AdminTransactionsBsiController', 0, 0, '2024-08-14 11:02:18', NULL, NULL),
(39, 'laporan_keuangan', 'fa fa-envelope-o', 'laporan_keuangan', 'laporan_keuangan', 'AdminLaporanKeuanganController', 0, 0, '2024-09-23 16:55:19', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cms_notifications`
--

CREATE TABLE `cms_notifications` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_cms_users` int(11) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_privileges`
--

CREATE TABLE `cms_privileges` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `is_superadmin` tinyint(1) DEFAULT NULL,
  `theme_color` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_privileges`
--

INSERT INTO `cms_privileges` (`id`, `name`, `is_superadmin`, `theme_color`, `created_at`, `updated_at`) VALUES
(1, 'Super Administrator', 1, 'skin-green', '2023-03-24 10:56:41', NULL),
(2, 'Admin', 0, 'skin-red', NULL, NULL),
(3, 'Nasabah', 0, 'skin-green-light', NULL, NULL),
(4, 'BSU', 0, 'skin-green', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cms_privileges_roles`
--

CREATE TABLE `cms_privileges_roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `is_visible` tinyint(1) DEFAULT NULL,
  `is_create` tinyint(1) DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT NULL,
  `is_edit` tinyint(1) DEFAULT NULL,
  `is_delete` tinyint(1) DEFAULT NULL,
  `id_cms_privileges` int(11) DEFAULT NULL,
  `id_cms_moduls` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_privileges_roles`
--

INSERT INTO `cms_privileges_roles` (`id`, `is_visible`, `is_create`, `is_read`, `is_edit`, `is_delete`, `id_cms_privileges`, `id_cms_moduls`, `created_at`, `updated_at`) VALUES
(1, 1, 0, 0, 0, 0, 1, 1, '2023-03-24 10:56:41', NULL),
(2, 1, 1, 1, 1, 1, 1, 2, '2023-03-24 10:56:41', NULL),
(3, 0, 1, 1, 1, 1, 1, 3, '2023-03-24 10:56:41', NULL),
(4, 1, 1, 1, 1, 1, 1, 4, '2023-03-24 10:56:41', NULL),
(5, 1, 1, 1, 1, 1, 1, 5, '2023-03-24 10:56:41', NULL),
(6, 1, 1, 1, 1, 1, 1, 6, '2023-03-24 10:56:41', NULL),
(7, 1, 1, 1, 1, 1, 1, 7, '2023-03-24 10:56:41', NULL),
(8, 1, 1, 1, 1, 1, 1, 8, '2023-03-24 10:56:41', NULL),
(9, 1, 1, 1, 1, 1, 1, 9, '2023-03-24 10:56:41', NULL),
(10, 1, 1, 1, 1, 1, 1, 10, '2023-03-24 10:56:41', NULL),
(11, 1, 0, 1, 0, 1, 1, 11, '2023-03-24 10:56:41', NULL),
(12, 1, 1, 1, 1, 1, 1, 12, NULL, NULL),
(13, 1, 1, 1, 1, 1, 1, 13, NULL, NULL),
(14, 1, 1, 1, 1, 1, 1, 14, NULL, NULL),
(15, 1, 1, 1, 1, 1, 1, 15, NULL, NULL),
(23, 1, 1, 1, 1, 1, 1, 16, NULL, NULL),
(28, 1, 0, 1, 0, 0, 3, 15, NULL, NULL),
(29, 1, 0, 1, 0, 0, 3, 14, NULL, NULL),
(30, 1, 0, 1, 0, 0, 3, 16, NULL, NULL),
(35, 1, 1, 1, 1, 1, 1, 17, NULL, NULL),
(40, 1, 1, 1, 1, 1, 1, 18, NULL, NULL),
(49, 1, 1, 1, 1, 1, 1, 19, NULL, NULL),
(50, 1, 1, 1, 1, 1, 1, 20, NULL, NULL),
(51, 1, 1, 1, 1, 1, 1, 21, NULL, NULL),
(52, 1, 1, 1, 1, 1, 1, 22, NULL, NULL),
(53, 1, 1, 1, 1, 1, 1, 23, NULL, NULL),
(54, 1, 1, 1, 1, 1, 1, 24, NULL, NULL),
(55, 1, 1, 1, 1, 1, 1, 25, NULL, NULL),
(56, 1, 1, 1, 1, 1, 1, 26, NULL, NULL),
(57, 1, 1, 1, 1, 1, 1, 27, NULL, NULL),
(58, 1, 1, 1, 1, 1, 1, 28, NULL, NULL),
(59, 1, 1, 1, 1, 1, 1, 29, NULL, NULL),
(60, 1, 1, 1, 1, 1, 1, 30, NULL, NULL),
(61, 1, 1, 1, 1, 1, 1, 31, NULL, NULL),
(62, 1, 1, 1, 1, 1, 1, 32, NULL, NULL),
(63, 1, 1, 1, 1, 1, 1, 33, NULL, NULL),
(64, 1, 1, 1, 1, 1, 1, 34, NULL, NULL),
(65, 1, 1, 1, 1, 1, 1, 35, NULL, NULL),
(183, 1, 1, 1, 1, 1, 1, 39, NULL, NULL),
(184, 1, 1, 1, 1, 1, 4, 24, NULL, NULL),
(185, 1, 1, 1, 1, 1, 4, 33, NULL, NULL),
(186, 1, 1, 1, 1, 1, 4, 37, NULL, NULL),
(187, 1, 1, 1, 1, 1, 4, 39, NULL, NULL),
(188, 1, 1, 1, 1, 1, 4, 29, NULL, NULL),
(189, 1, 1, 1, 1, 1, 4, 36, NULL, NULL),
(190, 1, 1, 1, 1, 1, 4, 31, NULL, NULL),
(191, 1, 1, 1, 1, 1, 4, 27, NULL, NULL),
(192, 1, 1, 1, 1, 1, 4, 34, NULL, NULL),
(193, 1, 1, 1, 1, 1, 4, 25, NULL, NULL),
(194, 1, 1, 1, 1, 1, 4, 30, NULL, NULL),
(195, 1, 1, 1, 1, 1, 4, 38, NULL, NULL),
(196, 1, 1, 1, 1, 1, 4, 32, NULL, NULL),
(197, 1, 1, 1, 1, 1, 4, 35, NULL, NULL),
(198, 1, 1, 1, 1, 1, 4, 4, NULL, NULL),
(199, 1, 0, 1, 0, 0, 2, 24, NULL, NULL),
(200, 1, 1, 1, 1, 1, 2, 33, NULL, NULL),
(201, 1, 0, 1, 0, 0, 2, 37, NULL, NULL),
(202, 1, 0, 1, 0, 0, 2, 39, NULL, NULL),
(203, 1, 0, 1, 0, 0, 2, 29, NULL, NULL),
(204, 1, 0, 1, 0, 0, 2, 36, NULL, NULL),
(205, 1, 0, 1, 0, 0, 2, 31, NULL, NULL),
(206, 1, 0, 1, 0, 0, 2, 27, NULL, NULL),
(207, 1, 0, 1, 0, 0, 2, 34, NULL, NULL),
(208, 1, 0, 1, 0, 0, 2, 25, NULL, NULL),
(209, 1, 0, 1, 0, 0, 2, 30, NULL, NULL),
(210, 1, 0, 1, 0, 0, 2, 38, NULL, NULL),
(211, 1, 0, 1, 0, 0, 2, 32, NULL, NULL),
(212, 1, 0, 1, 0, 0, 2, 35, NULL, NULL),
(213, 1, 1, 1, 1, 1, 2, 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cms_settings`
--

CREATE TABLE `cms_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `content_input_type` varchar(255) DEFAULT NULL,
  `dataenum` varchar(255) DEFAULT NULL,
  `helper` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `group_setting` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_settings`
--

INSERT INTO `cms_settings` (`id`, `name`, `content`, `content_input_type`, `dataenum`, `helper`, `created_at`, `updated_at`, `group_setting`, `label`) VALUES
(1, 'login_background_color', '#4CAF50', 'text', NULL, 'Input hexacode', '2023-03-24 10:56:41', NULL, 'Login Register Style', 'Login Background Color'),
(2, 'login_font_color', NULL, 'text', NULL, 'Input hexacode', '2023-03-24 10:56:41', NULL, 'Login Register Style', 'Login Font Color'),
(3, 'login_background_image', NULL, 'upload_image', NULL, NULL, '2023-03-24 10:56:41', NULL, 'Login Register Style', 'Login Background Image'),
(4, 'email_sender', 'support@crudbooster.com', 'text', NULL, NULL, '2023-03-24 10:56:41', NULL, 'Email Setting', 'Email Sender'),
(5, 'smtp_driver', 'mail', 'select', 'smtp,mail,sendmail', NULL, '2023-03-24 10:56:41', NULL, 'Email Setting', 'Mail Driver'),
(6, 'smtp_host', '', 'text', NULL, NULL, '2023-03-24 10:56:41', NULL, 'Email Setting', 'SMTP Host'),
(7, 'smtp_port', '25', 'text', NULL, 'default 25', '2023-03-24 10:56:41', NULL, 'Email Setting', 'SMTP Port'),
(8, 'smtp_username', '', 'text', NULL, NULL, '2023-03-24 10:56:41', NULL, 'Email Setting', 'SMTP Username'),
(9, 'smtp_password', '', 'text', NULL, NULL, '2023-03-24 10:56:41', NULL, 'Email Setting', 'SMTP Password'),
(10, 'appname', 'Bank Imam', 'text', NULL, NULL, '2023-03-24 10:56:41', NULL, 'Application Setting', 'Application Name'),
(11, 'default_paper_size', 'Legal', 'text', NULL, 'Paper size, ex : A4, Legal, etc', '2023-03-24 10:56:41', NULL, 'Application Setting', 'Default Paper Print Size'),
(12, 'logo', 'uploads/2024-08/2cdfc1bbc27a75a995afda5bd4e6adb2.png', 'upload_image', NULL, NULL, '2023-03-24 10:56:41', NULL, 'Application Setting', 'Logo'),
(13, 'favicon', 'uploads/2024-08/780fc35f716310d56925b3a1de65e70b.png', 'upload_image', NULL, NULL, '2023-03-24 10:56:41', NULL, 'Application Setting', 'Favicon'),
(14, 'api_debug_mode', 'true', 'select', 'true,false', NULL, '2023-03-24 10:56:41', NULL, 'Application Setting', 'API Debug Mode'),
(15, 'google_api_key', NULL, 'text', NULL, NULL, '2023-03-24 10:56:41', NULL, 'Application Setting', 'Google API Key'),
(16, 'google_fcm_key', NULL, 'text', NULL, NULL, '2023-03-24 10:56:41', NULL, 'Application Setting', 'Google FCM Key');

-- --------------------------------------------------------

--
-- Table structure for table `cms_statistics`
--

CREATE TABLE `cms_statistics` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_statistics`
--

INSERT INTO `cms_statistics` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Dashboard', 'dashboard', '2024-08-12 11:38:22', NULL),
(2, 'Dashboard admin', 'dashboard-super-admin', '2024-08-16 16:04:17', '2024-08-21 20:04:18');

-- --------------------------------------------------------

--
-- Table structure for table `cms_statistic_components`
--

CREATE TABLE `cms_statistic_components` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_cms_statistics` int(11) DEFAULT NULL,
  `componentID` varchar(255) DEFAULT NULL,
  `component_name` varchar(255) DEFAULT NULL,
  `area_name` varchar(55) DEFAULT NULL,
  `sorting` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `config` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_statistic_components`
--

INSERT INTO `cms_statistic_components` (`id`, `id_cms_statistics`, `componentID`, `component_name`, `area_name`, `sorting`, `name`, `config`, `created_at`, `updated_at`) VALUES
(1, 1, '9773d7c88d1d22b0056a3f093ffabf88', 'smallbox', 'area1', 0, NULL, '{\"name\":\"Total Sampah Terkumpul (Kg)\",\"icon\":\"ion-arrow-swap\",\"color\":\"bg-green\",\"link\":\"\\/admin\\/transactions\",\"sql\":\"SELECT \\r\\n    COALESCE(SUM(total_weight), 0) AS total_weight_sum\\r\\nFROM \\r\\n    transactions\\r\\nWHERE \\r\\n    admin_id = \'[admin_id]\'\"}', '2024-08-12 11:39:32', NULL),
(2, 1, 'e4699bbb851132f48d2e14e0ddd7ddef', 'smallbox', 'area2', 0, NULL, '{\"name\":\"Total Nasabah Menabung\",\"icon\":\"ion-cash\",\"color\":\"bg-red\",\"link\":\"\\/admin\\/transactions\",\"sql\":\"SELECT  \\r\\n    COUNT(*) AS total_transaksi\\r\\nFROM \\r\\n    transactions\\r\\nWHERE \\r\\n    admin_id = \'[admin_id]\';\"}', '2024-08-12 11:51:55', NULL),
(3, 1, '163cca4009abf3c87ff3509e12dc896b', 'smallbox', 'area4', 1, NULL, '{\"name\":\"Total Nasabah\",\"icon\":\"ion-person-stalker\",\"color\":\"bg-aqua\",\"link\":\"\\/admin\\/nasabah\",\"sql\":\"SELECT COUNT(*) AS total_users\\r\\nFROM users\\r\\nWHERE cms_user_id = \'[admin_id]\';\"}', '2024-08-12 11:54:49', NULL),
(5, 1, 'f313a4c131a93b6d11272130cd8edd1d', 'smallbox', 'area3', 0, NULL, '{\"name\":\"Total Jenis Sampah\",\"icon\":\"ion-trash-b\",\"color\":\"bg-yellow\",\"link\":\"\\/admin\\/sampah\",\"sql\":\"SELECT COUNT(*) AS total_jenis_sampah\\r\\nFROM sampah\\r\\nWHERE admin_id = \'[admin_id]\'\"}', '2024-08-13 09:50:33', NULL),
(17, 1, 'af266b24bb35ee9ced293e3e454ee6f3', 'chartbar', 'area5', 1, NULL, '{\"name\":\"Jenis Sampah Paling Banyak Ditabung\",\"sql\":\"SELECT COALESCE(s.name, \'Belum Ada Data\') as label, \\r\\n       COALESCE(SUM(t.total_weight), 0) as value \\r\\nFROM sampah s\\r\\nLEFT JOIN transactions t ON t.sampah_id = s.id AND t.admin_id = [admin_id]\\r\\nGROUP BY s.name \\r\\nORDER BY value DESC\\r\\nLIMIT 5;\",\"area_name\":\"total\",\"goals\":null}', '2024-08-14 08:57:37', NULL),
(18, 2, 'a35a0706529984d9255c3db8c03dd95a', 'smallbox', 'area1', 0, NULL, '{\"name\":\"Total Sampah Terkumpul (Kg)\",\"icon\":\"ion-trash-b\",\"color\":\"bg-green\",\"link\":\"#\",\"sql\":\"SELECT SUM(total_weight) AS total_kg_sampah\\r\\nFROM transactions;\"}', '2024-08-16 16:07:04', NULL),
(19, 2, 'd49414102d2c06cf7ac0c4c98214f6dc', 'smallbox', 'area2', 0, NULL, '{\"name\":\"Total Nasabah Menabung\",\"icon\":\"ion-cash\",\"color\":\"bg-red\",\"link\":\"\\/admin\\/transactions\",\"sql\":\"SELECT COUNT(*) AS total_transaksi\\r\\nFROM transactions;\"}', '2024-08-16 16:07:05', NULL),
(20, 2, '680102a2b198d06f87a66e6e2ba8f8dd', 'smallbox', NULL, 0, 'Untitled', NULL, '2024-08-16 16:07:06', NULL),
(21, 2, '9d03928b395e99b38c4f2b45d6d7162d', 'smallbox', 'area4', 0, NULL, '{\"name\":\"Total Nasabah\",\"icon\":\"ion-person-stalker\",\"color\":\"bg-aqua\",\"link\":\"\\/admin\\/nasabah\",\"sql\":\"SELECT COUNT(*) AS total_nasabah\\r\\nFROM users;\"}', '2024-08-16 16:07:11', NULL),
(22, 2, '6e26582f3dee136d868bed9f0eb8d7b5', 'smallbox', 'area3', 0, NULL, '{\"name\":\"Total Transaksi BSI\",\"icon\":\"ion-cash\",\"color\":\"bg-yellow\",\"link\":\"\\/admin\\/transactions_bsi\",\"sql\":\"SELECT COUNT(*) AS total_transaksi_bsi\\r\\nFROM transactions_bsi;\"}', '2024-08-16 16:07:12', NULL),
(23, 2, '4c3ffb9dab909a9f8da053a801d47b5c', 'smallbox', 'area1', 1, NULL, '{\"name\":\"Total Tukar Poins\",\"icon\":\"ion-pricetags\",\"color\":\"bg-aqua\",\"link\":\"\\/admin\\/tukar_poins\",\"sql\":\"SELECT COUNT(*) AS total_tukar_poins\\r\\nFROM tukar_poins\"}', '2024-08-16 16:15:02', NULL),
(24, 2, 'a0ad6a192850a25cf203241593ce6de5', 'smallbox', 'area2', 1, NULL, '{\"name\":\"Total Tukar Saldo\",\"icon\":\"ion-cash\",\"color\":\"bg-yellow\",\"link\":\"\\/admin\\/tukar_saldo\",\"sql\":\"SELECT COUNT(*) AS total_tukar_saldo\\r\\nFROM tukar_saldo\"}', '2024-08-16 16:15:06', NULL),
(25, 2, '6abff0035339365767ffc89b73eb9b30', 'chartbar', 'area5', 0, NULL, '{\"name\":\"Jenis Sampah Paling Banyak Ditabung\",\"sql\":\"SELECT COALESCE(s.name, \'Belum Ada Data\') as label, \\r\\n       COALESCE(SUM(t.total_weight), 0) as value \\r\\nFROM sampah s\\r\\nLEFT JOIN transactions t ON t.sampah_id = s.id\\r\\nGROUP BY s.name \\r\\nORDER BY value DESC\\r\\nLIMIT 5;\",\"area_name\":\"Total\",\"goals\":null}', '2024-08-16 16:22:42', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cms_users`
--

CREATE TABLE `cms_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `no_whatsapp` varchar(30) DEFAULT NULL,
  `id_cms_privileges` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_users`
--

INSERT INTO `cms_users` (`id`, `name`, `photo`, `email`, `password`, `no_whatsapp`, `id_cms_privileges`, `created_at`, `updated_at`, `status`) VALUES
(1, 'Super Admin', 'uploads/1/2024-08/image_17.png', 'admin@crudbooster.com', '$2y$10$sWLmqEjUz7BcmH3tUPd/F.vpAnIWSkK5dMoHkfgbQDI8g5tDG60/m', NULL, 1, '2023-03-24 10:56:41', '2024-08-14 10:22:57', 'Active'),
(5, 'BSU Mercubuana', 'uploads/1/2024-08/profile3.png', 'bsu1@gmail.com', '$2y$10$ANBBx7qwbnw/WmzmNybJe.tGBaFAH/EJUIjYXKG0zTIx5MtUnu.gG', '087829292952', 4, '2024-08-13 14:15:19', '2024-09-06 19:11:47', 'Active'),
(10, 'admin', 'uploads/1/2024-08/profile3.png', 'admin_bankimam@gmail.com', '$2y$10$sRUzdv9onSvmBqPQSSMIXuCd5S48RtT.5a5kfEWODuiHI6agF2wSG', '0', 2, '2024-08-17 13:21:14', NULL, 'Active'),
(12, 'BSU Karya Peduli', 'uploads/10/2024-09/profile3.png', 'karyapeduli@gmail.com', '$2y$10$mfwA7KRhfEbrIk6n/jvga.LmwSUiUfNH04gq8BEtzlm6r3P5G1Wky', '0', 4, '2024-09-06 21:06:12', NULL, 'Active'),
(13, 'BSU Madrasah Raudiatul Muta\'alimin', 'uploads/10/2024-09/profile3.png', 'madrasahRM@gmail.com', '$2y$10$nsU1uvEZbnr43u6TqCA69ePYsFxYYUoOMF3Tr3Yy5L4AHahsyv6z.', '0', 4, '2024-09-06 21:07:47', '2024-09-06 22:31:03', 'Active'),
(14, 'BSU Melati 1 RW 02', 'uploads/10/2024-09/profile3.png', 'melati1@gmail.com', '$2y$10$.YIGt4uKcFEEPwXiDUZlzOWzF0XhC0OlmreijK/H6xIUi6VwcRCVW', '0', 4, '2024-09-06 21:09:05', '2024-09-06 21:24:50', 'Active'),
(15, 'BSU Melati 2 RW 02', 'uploads/10/2024-09/profile3.png', 'melati2@gmail.com', '$2y$10$pzOOfM//J0ipo16C7um4B.sznPoE2wewurI6IWUKWqn7uks4aBHwC', '0', 4, '2024-09-06 21:09:46', '2024-09-06 21:25:12', 'Active'),
(16, 'BSU Agathis Botanical RW 02', 'uploads/10/2024-09/profile3.png', 'agathisBotanical@gmail.com', '$2y$10$ljZTDrAIeV/0/F6QMXEgS.heBs1TKFalLJy.IegccHwNebDs.KXZG', '0', 4, '2024-09-06 21:10:45', NULL, 'Active'),
(17, 'BSU Surya Mandiri Kel.Meruya Selatan', 'uploads/10/2024-09/profile3.png', 'suryaMandiri@gmail.com', '$2y$10$IxqfsSivvWwgdCyPO9Aroe6ftYYPsXvIkGz/zHAZ8DMaYJBHCjYOa', '0', 4, '2024-09-06 21:11:56', NULL, 'Active'),
(18, 'BSU Asri SDN Meruya Selatan 1', 'uploads/10/2024-09/profile3.png', 'asri@gmail.com', '$2y$10$VDCYsf3neTPYFgljFIw4o.g7WAJkW.Kgd1KL4f71Gn8y55OcvmnzS', '0', 4, '2024-09-06 21:12:54', NULL, 'Active'),
(19, 'BSU Raflesia SDN Meruya Selatan 3', 'uploads/10/2024-09/profile3.png', 'raflesia@gmail.com', '$2y$10$6Z0juEaRj/Jsn.MXsDdFaOODKCfNLcssqqNnGpacOICfrIscFTubi', '0', 4, '2024-09-06 21:22:41', '2024-09-06 22:01:50', 'Active'),
(20, 'BSU Jack RW 03', 'uploads/10/2024-09/profile3.png', 'jack@gmail.com', '$2y$10$ZH8l5iUjHkXmpQ5mPxbeA.IrhG5dQQNqSv6A42PvOrCeK0OA3vHqy', '0', 4, '2024-09-06 21:23:27', NULL, 'Active'),
(21, 'BSU RPTRA Mahkota', 'uploads/10/2024-09/profile3.png', 'rptraMahkota@gmail.com', '$2y$10$zYayI3gVJSJLuTV1pMwVVuajukLKcbA.GpIPkoxe4b8vKknhE/8ni', '0', 4, '2024-09-06 21:24:25', NULL, 'Active'),
(22, 'BSU RPTRA Meruya Selatan', 'uploads/10/2024-09/bsu.jpg', 'rptraMeruyaSelatan@gmail.com', '$2y$10$emGgEYXtOIr14UFuzXC3je4NrUxRAuA5IRJvQLN9mGu7r2Qy3Wuje', '0', 4, '2024-09-06 21:31:27', NULL, 'Active'),
(23, 'BSU RPTRA Manuver', 'uploads/10/2024-09/bsu.jpg', 'rptraManuver@gmail.com', '$2y$10$NV1dWwTRi/C7TLxQtS1XdeZ7W25Y7c3XgPeVNW7jwyp3DczX5JLl.', '0', 4, '2024-09-06 21:32:41', NULL, 'Active'),
(24, 'BSU RPTRA Menara', 'uploads/10/2024-09/bsu.jpg', 'rptraMenara@gmail.com', '$2y$10$cCH7RbvCTvrRdCPD5KyG/OgTlwh5H6VYHNYh3NQCbwDcG9h8dNIl2', '0', 4, '2024-09-06 21:33:30', NULL, 'Active'),
(25, 'BSU RPTRA Manunggal', 'uploads/10/2024-09/bsu.jpg', 'rptraManunggal@gmail.com', '$2y$10$Z8VTACAWl/Pk4/W0ZnlMhOs0U01HHFVH76C3jxOy7u1tj4abjWFii', '0', 4, '2024-09-06 21:34:29', NULL, 'Active'),
(26, 'BSU Sumber Rejeki RW 04', 'uploads/10/2024-09/bsu.jpg', 'sumberRejeki@gmail.com', '$2y$10$EvLeBUr1yDgYyd6grXxl1u4.B4d1P6dpRDqniQT.MvfLbnRxfUtwa', '0', 4, '2024-09-06 21:35:28', NULL, 'Active'),
(27, 'BSU Rosmerah RW 05', 'uploads/10/2024-09/bsu.jpg', 'rosmerah@gmail.com', '$2y$10$iTCk4Z2ENc5CWDrUsMscKu7vetOnYLczBk7lg//KIrtLEl.7RpwJG', '0', 4, '2024-09-06 21:36:15', '2024-09-06 22:09:20', 'Active'),
(28, 'BSU Anggrek Bulan RW 06', 'uploads/10/2024-09/bsu.jpg', 'anggrekBulan@gmail.com', '$2y$10$TfnWX8ev.C/RCsK32wvGOu9NXPZ7b5VQMAsSxKWyqLuK/vnKCTPsa', '0', 4, '2024-09-06 21:36:59', NULL, 'Active'),
(29, 'BSU Camal Jaya RW 07', 'uploads/10/2024-09/bsu.jpg', 'camalJaya@gmail.com', '$2y$10$GDzwVoQftJcG.Xa5d2e5ZO/YmdCcci4WfOjW7QpQWgr5KjZDgVKLe', '0', 4, '2024-09-06 21:37:41', NULL, 'Active'),
(30, 'BSU Pelangi RW 08', 'uploads/10/2024-09/bsu.jpg', 'pelangi@gmail.com', '$2y$10$gqoo2Z.xbJi/59THU4ZUj.tE.kTr/uY8zGRQSBV1nbCdoYyJntZgK', '0', 4, '2024-09-06 21:38:28', '2024-09-06 22:18:24', 'Active'),
(31, 'BSU Lestari RW 011', 'uploads/10/2024-09/bsu.jpg', 'lestari@gmail.com', '$2y$10$2WEjtjwekKO6FT8ebPTniuXaW5D4lL0amxiu9N.2i1DHpSQ7.yoA2', '0', 4, '2024-09-06 21:39:06', '2024-09-06 22:21:18', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `education`
--

CREATE TABLE `education` (
  `id` int(11) NOT NULL,
  `judul` text NOT NULL,
  `url` text NOT NULL,
  `gambar` text NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `education`
--

INSERT INTO `education` (`id`, `judul`, `url`, `gambar`, `updated_at`, `created_at`) VALUES
(2, 'Viral Warga Buang Sampah ke Kereta Barang, KAI: Terancam Denda Rp 15 Juta!', 'https://finance.detik.com/berita-ekonomi-bisnis/d-7468198/viral-warga-buang-sampah-ke-kereta-barang-kai-terancam-denda-rp-15-juta', 'uploads/1/2024-08/berita2.jpeg', '2024-08-10 22:23:27', '2024-08-08 07:13:23'),
(6, 'Cek Kesehatan di Klinik Ini Bisa Bayar Pakai Sampah', 'https://health.detik.com/fotohealth/d-7479009/cek-kesehatan-di-klinik-ini-bisa-bayar-pakai-sampah/2', 'https://akcdn.detik.net.id/community/media/visual/2024/08/08/klinik-kesehatan-berbayar-sampah-1_169.jpeg?w=700&q=90', '2024-08-13 08:25:39', '2024-08-13 08:24:55'),
(9, 'Jangan Mengulang Bantargebang Jakarta, Bagaimana IKN Olah Sampah?', 'https://www.detik.com/properti/berita/d-7491050/jangan-mengulang-bantargebang-jakarta-bagaimana-ikn-olah-sampah', 'https://akcdn.detik.net.id/community/media/visual/2021/10/05/ilustrasi-sampah-plastik_43.jpeg?w=700&q=90', '2024-08-18 07:28:49', '2024-08-18 07:28:49');

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
-- Table structure for table `laporan_keuangan`
--

CREATE TABLE `laporan_keuangan` (
  `id` int(11) NOT NULL,
  `admin_id` int(10) UNSIGNED NOT NULL,
  `periode` text DEFAULT NULL,
  `total_beli` int(11) DEFAULT NULL,
  `total_jual` int(11) DEFAULT NULL,
  `profit` int(11) DEFAULT NULL,
  `ambil_saldo` int(11) DEFAULT NULL,
  `saldo_akhir` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `laporan_keuangan`
--

INSERT INTO `laporan_keuangan` (`id`, `admin_id`, `periode`, `total_beli`, `total_jual`, `profit`, `ambil_saldo`, `saldo_akhir`, `created_at`, `updated_at`) VALUES
(4, 5, 'oktober', 273000, 300000, 27000, NULL, 27000, '2024-09-23 20:53:49', '2024-09-24 17:02:24'),
(6, 5, 'september', 50000, 300000, 250000, 3000, 247000, '2024-09-23 21:43:52', '2024-09-23 14:43:52');

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_08_07_145904_add_table_cms_apicustom', 1),
(4, '2016_08_07_150834_add_table_cms_dashboard', 1),
(5, '2016_08_07_151210_add_table_cms_logs', 1),
(6, '2016_08_07_151211_add_details_cms_logs', 1),
(7, '2016_08_07_152014_add_table_cms_privileges', 1),
(8, '2016_08_07_152214_add_table_cms_privileges_roles', 1),
(9, '2016_08_07_152320_add_table_cms_settings', 1),
(10, '2016_08_07_152421_add_table_cms_users', 1),
(11, '2016_08_07_154624_add_table_cms_menus_privileges', 1),
(12, '2016_08_07_154624_add_table_cms_moduls', 1),
(13, '2016_08_17_225409_add_status_cms_users', 1),
(14, '2016_08_20_125418_add_table_cms_notifications', 1),
(15, '2016_09_04_033706_add_table_cms_email_queues', 1),
(16, '2016_09_16_035347_add_group_setting', 1),
(17, '2016_09_16_045425_add_label_setting', 1),
(18, '2016_09_17_104728_create_nullable_cms_apicustom', 1),
(19, '2016_10_01_141740_add_method_type_apicustom', 1),
(20, '2016_10_01_141846_add_parameters_apicustom', 1),
(21, '2016_10_01_141934_add_responses_apicustom', 1),
(22, '2016_10_01_144826_add_table_apikey', 1),
(23, '2016_11_14_141657_create_cms_menus', 1),
(24, '2016_11_15_132350_create_cms_email_templates', 1),
(25, '2016_11_15_190410_create_cms_statistics', 1),
(26, '2016_11_17_102740_create_cms_statistic_components', 1),
(27, '2017_06_06_164501_add_deleted_at_cms_moduls', 1),
(28, '2019_08_19_000000_create_failed_jobs_table', 1),
(29, '2023_03_24_173258_create_sampah_table', 1),
(30, '2023_03_24_173719_create_rewards_table', 1),
(31, '2023_03_24_174521_create_points_table', 1),
(32, '2023_03_24_173260_create_sampah_table', 2),
(33, '2023_03_24_173720_create_rewards_table', 2),
(34, '2023_03_24_174590_create_points_table', 2),
(35, '2023_03_24_175000_create_points_table', 3),
(36, '2023_03_24_176000_create_rewards_table', 4),
(37, '2023_03_25_100252_create_tukar_poin_table', 5),
(38, '2023_04_09_171532_create_sampah_categories_table', 6),
(39, '2023_04_09_000000_create_users_table', 7),
(40, '2023_04_09_161532_create_sampah_categories_table', 8),
(41, '2023_04_09_000001_create_users_table', 9),
(42, '2023_04_09_161535_create_sampah_categories_table', 9),
(43, '2023_04_09_173265_create_sampah_table', 9),
(44, '2023_04_09_175000_create_points_table', 10),
(45, '2023_04_09_176000_create_rewards_table', 10),
(46, '2023_04_09_182046_create_transactions_table', 11),
(47, '2023_04_09_200000_create_tukar_poin_table', 11),
(48, '2023_04_09_000002_create_users_table', 12),
(49, '2023_04_09_161539_create_sampah_categories_table', 12),
(50, '2023_04_09_173269_create_sampah_table', 12),
(51, '2023_04_09_175001_create_points_table', 12),
(52, '2023_04_09_176001_create_rewards_table', 12),
(53, '2023_04_09_182049_create_transactions_table', 12),
(54, '2023_04_09_200001_create_tukar_poin_table', 12),
(55, '2023_04_09_200002_create_tukar_poins_table', 13),
(56, '2023_04_09_000003_create_users_table', 14),
(57, '2023_04_09_176005_create_rewards_table', 14),
(58, '2023_04_09_161540_create_sampah_categories_table', 15),
(59, '2023_04_09_173270_create_sampah_table', 15),
(60, '2023_04_09_175003_create_points_table', 15),
(61, '2023_04_09_176007_create_rewards_table', 15),
(62, '2023_04_09_182050_create_transactions_table', 15),
(63, '2023_04_09_200016_create_tukar_poins_table', 16),
(64, '2023_04_09_000004_create_users_table', 17),
(65, '2023_04_09_161544_create_sampah_categories_table', 17),
(66, '2023_04_09_173275_create_sampah_table', 17),
(67, '2023_04_09_175005_create_points_table', 17),
(68, '2023_04_09_176010_create_rewards_table', 17),
(69, '2023_04_09_182055_create_transactions_table', 17),
(70, '2023_04_09_200020_create_tukar_poins_table', 17),
(71, '2023_04_09_200025_create_tukar_poins_table', 18);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pengumuman`
--

CREATE TABLE `pengumuman` (
  `id` int(11) NOT NULL,
  `admin_id` int(10) UNSIGNED DEFAULT NULL,
  `nama` varchar(100) NOT NULL,
  `deskripsi` text NOT NULL,
  `status` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pengumuman`
--

INSERT INTO `pengumuman` (`id`, `admin_id`, `nama`, `deskripsi`, `status`, `created_at`, `updated_at`) VALUES
(2, NULL, 'Pengumpulan sampah', 'Penukaran sampah akan dilaksanakan pada tanggal 17 Agustus 2024 s/d 24 Agustus 2024 di BSU terdekat!', 'Pending', '2024-08-14 07:38:06', '2024-08-14 07:38:06'),
(4, 5, 'Pengumpulan Sampah', 'Pengumpulan sampah akan dilaksanakan pada tanggal 17 Agustus 2024 s/d 24 Agustus 2024', 'Pending', '2024-08-14 10:19:16', '2024-08-15 11:50:30'),
(6, 1, 'Penukaran Sampah periode 1', 'Penukaran sampah akan dilaksanakan pada tanggal 18 Agustus s/d 24 Agustus 2024 pada pukul 08:00 - 14:00', 'On Proses', '2024-08-18 07:16:27', '2024-08-20 22:33:34'),
(7, 1, 'Proklamator', 'Kami bangsa Indonesia dengan ini menjatakan Kemerdekaan Indonesia.\r\n\r\nHal-hal jang mengenai pemindahan kekoeasaan d.l.l., di-\r\nselenggarakan dengan tjara saksama dan dalam tempo jang se-\r\nsingkat-singkatnja.\r\n\r\nDjakarta, hari 17 boelan 8 tahoen 05.\r\nAtas nama bangsa Indonesia,\r\nSoekarno/Hatta.', 'Pending', '2024-08-20 14:16:56', '2024-08-20 22:32:41'),
(8, 5, 'Pengumpulan Sampah', 'Jadwal Pengumpulan Sampah Setiap hari Senin-Jumat pada Pukul 14.00-15.00', 'On Proses', '2024-09-21 13:27:25', '2024-09-21 14:53:58');

-- --------------------------------------------------------

--
-- Table structure for table `points`
--

CREATE TABLE `points` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `total_points` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `points`
--

INSERT INTO `points` (`id`, `user_id`, `total_points`, `created_at`, `updated_at`) VALUES
(16, 38, 9000, '2024-08-18 18:24:58', '2024-09-17 19:46:48'),
(17, 39, 4070, '2024-08-20 10:44:46', '2024-09-07 09:41:15'),
(18, 40, 0, '2024-08-20 11:52:21', '2024-08-20 11:52:21'),
(19, 41, 0, '2024-08-20 11:52:33', '2024-08-20 11:52:33'),
(20, 42, 0, '2024-08-20 22:13:00', '2024-08-20 22:13:00'),
(22, 44, 0, '2024-08-23 15:14:34', '2024-08-23 15:14:34'),
(23, 45, 0, '2024-08-23 15:16:02', '2024-08-23 15:16:02'),
(24, 46, 0, '2024-08-23 15:18:36', '2024-08-23 15:18:36'),
(25, 47, 0, '2024-08-23 15:22:58', '2024-08-23 15:22:58'),
(26, 48, 0, '2024-08-23 15:26:21', '2024-08-23 15:26:21'),
(27, 49, 0, '2024-08-23 15:26:25', '2024-08-23 15:26:25'),
(28, 50, 0, '2024-08-23 15:27:02', '2024-08-23 15:27:02'),
(29, 51, 0, '2024-08-23 15:27:17', '2024-08-23 15:27:17'),
(30, 52, 450, '2024-08-23 15:32:29', '2024-09-07 08:41:07'),
(33, 55, 1000, '2024-09-06 22:26:16', '2024-09-06 22:27:26'),
(34, 56, 0, '2024-09-06 22:30:06', '2024-09-06 22:30:06'),
(35, 57, 0, '2024-09-07 09:11:38', '2024-09-07 09:11:38'),
(37, 59, 0, '2024-09-07 09:57:49', '2024-09-07 09:57:49'),
(38, 60, 7000, '2024-09-07 10:09:16', '2024-09-07 10:34:58'),
(39, 61, 0, '2024-09-07 10:44:07', '2024-09-07 10:44:07'),
(40, 62, 0, '2024-09-07 10:57:13', '2024-09-07 10:57:13'),
(41, 63, 0, '2024-09-07 10:59:13', '2024-09-07 10:59:13'),
(42, 64, 0, '2024-09-07 11:01:08', '2024-09-07 11:01:08'),
(43, 65, 10235, '2024-09-21 13:13:37', '2024-09-22 21:25:35'),
(44, 66, 4135, '2024-09-21 13:24:28', '2024-09-26 13:35:22'),
(45, 67, 7128, '2024-09-21 13:28:10', '2024-09-23 13:10:13'),
(46, 68, 0, '2024-09-21 13:37:38', '2024-09-21 13:37:38'),
(47, 69, 2545, '2024-09-21 13:39:57', '2024-09-29 18:33:47'),
(48, 70, 0, '2024-09-21 13:41:46', '2024-09-21 13:41:46'),
(49, 71, 0, '2024-09-21 13:55:29', '2024-09-21 13:55:29'),
(50, 72, 2400, '2024-09-21 14:09:53', '2024-09-22 21:31:21'),
(51, 73, 0, '2024-09-21 14:13:10', '2024-09-21 14:13:10'),
(52, 74, 0, '2024-09-21 14:14:13', '2024-09-21 14:14:13'),
(53, 75, 0, '2024-09-21 14:16:14', '2024-09-21 14:16:14'),
(55, 76, 50, '2024-09-21 15:48:12', '2024-09-23 13:25:02'),
(56, 77, 250, '2024-09-21 15:51:44', '2024-09-22 20:14:08'),
(57, 36, 0, '2024-09-21 15:52:24', '2024-09-23 19:32:06'),
(58, NULL, 0, '2024-09-21 16:10:19', '2024-09-21 16:10:33'),
(59, 78, 33760, '2024-09-22 15:04:18', '2024-09-22 20:28:19'),
(60, 79, 0, '2024-09-22 16:46:05', '2024-09-22 16:46:05'),
(61, 80, 0, '2024-09-23 11:19:14', '2024-09-23 11:19:14'),
(66, 82, 0, '2024-09-26 11:38:36', '2024-09-26 11:38:36'),
(67, 83, 0, '2024-09-26 14:02:19', '2024-09-26 14:02:19'),
(68, 84, 0, '2024-09-26 14:14:12', '2024-09-26 14:14:12'),
(69, 85, 0, '2024-09-26 14:36:20', '2024-09-26 14:36:20'),
(70, 86, 0, '2024-09-26 15:49:09', '2024-09-26 15:49:09'),
(72, 88, 0, '2024-09-29 14:28:14', '2024-09-29 14:28:14'),
(73, 89, 0, '2024-09-29 14:29:05', '2024-09-29 14:29:05'),
(74, 90, 1050, '2024-09-29 14:30:09', '2024-09-29 14:44:11'),
(75, 91, 855, '2024-09-29 14:31:57', '2024-09-29 14:40:24'),
(77, 93, 0, '2024-09-29 15:40:42', '2024-09-29 15:40:42'),
(78, 94, 0, '2024-09-29 15:47:24', '2024-09-29 15:47:24'),
(79, 95, 0, '2024-09-29 16:33:35', '2024-09-29 16:33:35'),
(80, 96, 0, '2024-09-29 17:52:15', '2024-09-29 17:52:15'),
(81, 97, 0, '2024-09-30 07:17:07', '2024-09-30 07:17:07'),
(82, 98, 0, '2024-09-30 10:46:00', '2024-09-30 10:46:00'),
(83, 99, 0, '2024-09-30 18:43:17', '2024-09-30 18:43:17'),
(84, 100, 0, '2024-10-03 11:22:18', '2024-10-03 11:22:18'),
(85, 101, 0, '2024-10-03 11:54:20', '2024-10-03 11:54:20'),
(86, 102, 0, '2024-10-11 16:40:07', '2024-10-11 16:40:07'),
(87, 103, 0, '2024-10-15 22:07:20', '2024-10-15 22:07:20'),
(88, 104, 125, '2024-10-22 13:39:16', '2024-10-22 14:37:34'),
(89, 105, 0, '2024-10-22 14:49:39', '2024-10-22 14:49:39'),
(90, 106, 0, '2024-10-22 15:43:56', '2024-10-22 15:43:56'),
(91, 107, 0, '2024-10-22 15:44:19', '2024-10-22 15:44:19'),
(92, 108, 0, '2024-10-22 15:44:46', '2024-10-22 15:44:46'),
(93, 109, 0, '2024-10-22 15:45:08', '2024-10-22 15:45:08'),
(94, 110, 0, '2024-10-22 15:45:48', '2024-10-22 15:45:48'),
(95, 111, 0, '2024-10-22 15:46:20', '2024-10-22 15:46:20'),
(96, 112, 0, '2024-10-22 15:47:15', '2024-10-22 15:47:15'),
(97, 113, 0, '2024-10-22 15:48:25', '2024-10-22 15:48:25'),
(98, 114, 0, '2024-10-22 15:48:54', '2024-10-22 15:48:54'),
(99, 115, 0, '2024-10-22 15:52:06', '2024-10-22 15:52:06'),
(100, 116, 0, '2024-10-22 15:52:17', '2024-10-22 15:52:17'),
(101, 117, 0, '2024-10-22 15:52:28', '2024-10-22 15:52:28'),
(102, 118, 0, '2024-10-22 15:52:52', '2024-10-22 15:52:52'),
(103, 119, 0, '2024-10-22 15:53:18', '2024-10-22 15:53:18'),
(104, 120, 0, '2024-10-22 15:53:22', '2024-10-22 15:53:22'),
(105, 121, 0, '2024-10-22 15:53:41', '2024-10-22 15:53:41'),
(106, 122, 0, '2024-10-22 15:53:50', '2024-10-22 15:53:50'),
(107, 123, 0, '2024-10-22 15:54:55', '2024-10-22 15:54:55'),
(108, 124, 0, '2024-10-22 15:56:00', '2024-10-22 15:56:00'),
(109, 125, 0, '2024-10-22 15:56:00', '2024-10-22 15:56:00'),
(110, 126, 0, '2024-10-22 15:56:22', '2024-10-22 15:56:22'),
(111, 127, 0, '2024-10-22 15:56:41', '2024-10-22 15:56:41'),
(112, 128, 0, '2024-10-22 15:56:46', '2024-10-22 15:56:46'),
(113, 129, 0, '2024-10-22 15:57:10', '2024-10-22 15:57:10'),
(114, 130, 0, '2024-10-22 15:57:14', '2024-10-22 15:57:14'),
(115, 131, 0, '2024-10-22 15:57:29', '2024-10-22 15:57:29'),
(116, 132, 0, '2024-10-22 15:57:46', '2024-10-22 15:57:46'),
(117, 133, 0, '2024-10-22 15:58:32', '2024-10-22 15:58:32'),
(118, 134, 0, '2024-10-22 15:59:09', '2024-10-22 15:59:09'),
(119, 135, 0, '2024-10-22 15:59:38', '2024-10-22 15:59:38'),
(120, 136, 0, '2024-10-22 16:00:01', '2024-10-22 16:00:01'),
(121, 137, 0, '2024-10-22 16:00:32', '2024-10-22 16:00:32');

-- --------------------------------------------------------

--
-- Table structure for table `rewards`
--

CREATE TABLE `rewards` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` int(11) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `stock` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rewards`
--

INSERT INTO `rewards` (`id`, `admin_id`, `name`, `category`, `description`, `price`, `image`, `stock`, `created_at`, `updated_at`) VALUES
(24, 12, 'Sapu', 'barang', 'Alat kebersihan', 5000, 'uploads/12/2024-09/sapu.jpeg', 5, '2024-09-06 21:36:46', NULL),
(25, 12, 'Vas Bunga', 'barang', 'Hiasan vas bunga berwarna kuning', 500, 'uploads/12/2024-09/pot_gemoy.png', 10, '2024-09-06 21:37:17', NULL),
(26, 13, 'Vas Bunga', 'barang', 'Hiasan vas bunga berwarna kuning', 500, 'uploads/13/2024-09/pot_gemoy.png', 10, '2024-09-06 21:48:42', NULL),
(27, 13, 'Sapu', 'barang', 'Alat kebersihan', 5000, 'uploads/13/2024-09/sapu.jpeg', 5, '2024-09-06 21:49:03', NULL),
(28, 14, 'Vas Bunga', 'barang', 'Hiasan vas bunga berwarna kuning', 500, 'uploads/14/2024-09/pot_gemoy.png', 10, '2024-09-06 21:51:37', NULL),
(29, 14, 'Sapu', 'barang', 'Alat kebersihan', 5000, 'uploads/14/2024-09/sapu.jpeg', 5, '2024-09-06 21:52:15', NULL),
(30, 15, 'Vas Bunga', 'barang', 'Hiasan vas bunga berwarna kuning', 500, 'uploads/15/2024-09/pot_gemoy.png', 10, '2024-09-06 21:53:38', NULL),
(31, 15, 'Sapu', 'barang', 'Alat kebersihan', 5000, 'uploads/15/2024-09/sapu.jpeg', 5, '2024-09-06 21:53:59', NULL),
(32, 22, 'Sapu', 'barang', 'Alat Kebersihan', 5000, 'uploads/22/2024-09/sapu.jpg', 5, '2024-09-06 21:54:20', NULL),
(33, 22, 'Vas Bunga', 'barang', 'Hiasan vas bunga berwarna kuning', 500, 'uploads/22/2024-09/vas.jpg', 10, '2024-09-06 21:55:10', NULL),
(34, 16, 'Vas Bunga', 'barang', 'Hiasan vas bunga berwarna kuning', 500, 'uploads/16/2024-09/pot_gemoy.png', 10, '2024-09-06 21:55:21', NULL),
(35, 16, 'Sapu', 'barang', 'Alat kebersihan', 5000, 'uploads/16/2024-09/sapu.jpeg', 5, '2024-09-06 21:55:38', NULL),
(36, 17, 'Vas Bunga', 'barang', 'Hiasan vas bunga berwarna kuning', 500, 'uploads/17/2024-09/pot_gemoy.png', 10, '2024-09-06 21:58:20', NULL),
(37, 17, 'Sapu', 'barang', 'Alat kebersihan', 5000, 'uploads/17/2024-09/sapu.jpeg', 5, '2024-09-06 21:58:39', NULL),
(38, 23, 'Sapu', 'barang', 'Alat Kebersihan', 5000, 'uploads/23/2024-09/sapu.jpg', 5, '2024-09-06 21:59:00', NULL),
(39, 23, 'Vas Bunga', 'barang', 'Hiasan vas bunga berwarna kuning', 500, 'uploads/23/2024-09/vas.jpg', 10, '2024-09-06 21:59:24', NULL),
(40, 18, 'Vas Bunga', 'barang', 'Hiasan vas bunga berwarna kuning', 500, 'uploads/18/2024-09/pot_gemoy.png', 10, '2024-09-06 22:00:24', NULL),
(41, 24, 'Sapu', 'barang', 'Alat Kebersihan', 5000, 'uploads/24/2024-09/sapu.jpg', 5, '2024-09-06 22:00:33', NULL),
(42, 18, 'Sapu', 'barang', 'Alat kebersihan', 5000, 'uploads/18/2024-09/sapu.jpeg', 5, '2024-09-06 22:00:40', NULL),
(43, 24, 'Vas Bunga', 'barang', 'Hiasan vas bunga berwarna kuning', 500, 'uploads/24/2024-09/vas.jpg', 10, '2024-09-06 22:00:59', NULL),
(44, 19, 'Vas Bunga', 'barang', 'Hiasan vas bunga berwarna kuning', 500, 'uploads/19/2024-09/pot_gemoy.png', 10, '2024-09-06 22:03:20', NULL),
(45, 19, 'Sapu', 'barang', 'Alat kebersihan', 5000, 'uploads/19/2024-09/sapu.jpeg', 5, '2024-09-06 22:03:37', NULL),
(46, 25, 'Sapu', 'barang', 'Alat Kebersihan', 5000, 'uploads/25/2024-09/sapu.jpg', 5, '2024-09-06 22:04:45', NULL),
(47, 25, 'Vas Bunga', 'barang', 'Hiasan vas bunga berwarna kuning', 500, 'uploads/25/2024-09/vas.jpg', 10, '2024-09-06 22:05:10', NULL),
(48, 20, 'Vas Bunga', 'barang', 'Hiasan vas bunga berwarna kuning', 500, 'uploads/20/2024-09/pot_gemoy.png', 10, '2024-09-06 22:05:15', NULL),
(49, 20, 'Sapu', 'barang', 'Alat kebersihan', 5000, 'uploads/20/2024-09/sapu.jpeg', 10, '2024-09-06 22:05:36', NULL),
(50, 26, 'Sapu', 'barang', 'Alat Kebersihan', 5000, 'uploads/26/2024-09/sapu.jpg', 5, '2024-09-06 22:06:39', NULL),
(51, 26, 'Vas Bunga', 'barang', 'Hiasan vas bunga berwarna kuning', 500, 'uploads/26/2024-09/vas.jpg', 10, '2024-09-06 22:07:02', NULL),
(52, 21, 'Vas Bunga', 'barang', 'Hiasan vas bunga berwarna kuning', 500, 'uploads/21/2024-09/pot_gemoy.png', 10, '2024-09-06 22:07:21', NULL),
(53, 21, 'Sapu', 'barang', 'Alat kebersihan', 5000, 'uploads/21/2024-09/sapu.jpeg', 5, '2024-09-06 22:07:39', NULL),
(54, 27, 'Sapu', 'barang', 'Alat Kebersihan', 5000, 'uploads/27/2024-09/sapu.jpg', 5, '2024-09-06 22:11:15', NULL),
(55, 27, 'Vas Bunga', 'barang', 'Hiasan vas bunga berwarna kuning', 500, 'uploads/27/2024-09/vas.jpg', 10, '2024-09-06 22:11:40', NULL),
(56, 28, 'Sapu', 'barang', 'Alat Kebersihan', 5000, 'uploads/28/2024-09/sapu.jpg', 5, '2024-09-06 22:12:37', NULL),
(57, 28, 'Vas Bunga', 'barang', 'Hiasan vas bunga berwarna kuning', 500, 'uploads/28/2024-09/vas.jpg', 10, '2024-09-06 22:13:11', NULL),
(58, 29, 'Sapu', 'barang', 'Alat Kebersihan', 5000, 'uploads/29/2024-09/sapu.jpg', 5, '2024-09-06 22:17:14', NULL),
(59, 29, 'Vas Bunga', 'barang', 'Hiasan vas bunga berwarna kuning', 500, 'uploads/29/2024-09/vas.jpg', 10, '2024-09-06 22:17:43', NULL),
(60, 30, 'Sapu', 'barang', 'Alat Kebersihan', 5000, 'uploads/30/2024-09/sapu.jpg', 5, '2024-09-06 22:20:13', NULL),
(61, 30, 'Vas Bunga', 'barang', 'Hiasan vas bunga berwarna kuning', 500, 'uploads/30/2024-09/vas.jpg', 10, '2024-09-06 22:20:41', NULL),
(62, 31, 'Sapu', 'barang', 'Alat Kebersihan', 5000, 'uploads/31/2024-09/sapu.jpg', 5, '2024-09-06 22:23:24', NULL),
(63, 31, 'Vas Bunga', 'barang', 'Hiasan vas bunga berwarna kuning', 500, 'uploads/31/2024-09/vas.jpg', 10, '2024-09-06 22:23:45', NULL),
(68, 5, 'Uang Cash', 'uang', 'Uang cash', 0, 'uploads/5/2024-09/uang.jpeg', 72, '2024-09-21 19:01:37', '2024-10-02 14:47:26');

-- --------------------------------------------------------

--
-- Table structure for table `saldo`
--

CREATE TABLE `saldo` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `total_saldo` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `saldo`
--

INSERT INTO `saldo` (`id`, `user_id`, `total_saldo`, `created_at`, `updated_at`) VALUES
(7, 39, 24800, '2024-08-20 10:54:02', '2024-09-07 09:41:15'),
(8, 38, 400000, '2024-08-20 11:56:22', '2024-08-20 11:56:22'),
(11, 55, 10000, '2024-09-06 22:27:26', '2024-09-06 22:27:26'),
(12, 52, 2250, '2024-09-07 08:41:07', '2024-09-07 08:41:07'),
(13, 60, 34000, '2024-09-07 10:17:06', '2024-09-07 10:18:17'),
(14, 66, 120260, '2024-09-21 13:35:16', '2024-09-30 10:37:14'),
(16, 36, 25000, '2024-09-21 15:52:24', '2024-09-29 14:38:57'),
(18, 77, 8665, '2024-09-22 20:14:08', '2024-10-15 08:19:16'),
(19, 78, 119500, '2024-09-22 20:21:36', '2024-09-26 14:49:21'),
(20, 65, 180285, '2024-09-22 21:00:46', '2024-10-04 14:23:53'),
(21, 69, 2394, '2024-09-22 21:07:28', '2024-09-30 11:01:14'),
(22, 67, 318346, '2024-09-22 21:12:07', '2024-10-02 14:47:26'),
(23, 72, 117970, '2024-09-22 21:30:07', '2024-09-30 10:32:58'),
(24, 76, 99430, '2024-09-23 13:20:12', '2024-09-30 10:52:41'),
(25, 75, 21250, '2024-09-23 13:29:49', '2024-09-23 13:35:48'),
(26, 71, 178830, '2024-09-23 13:42:49', '2024-09-30 11:11:42'),
(27, 79, 122760, '2024-09-23 13:50:51', '2024-09-23 13:58:03'),
(30, 50, 121740, '2024-09-23 21:56:03', '2024-09-26 11:38:21'),
(31, 70, 26000, '2024-09-26 11:19:18', '2024-09-26 11:19:18'),
(32, 74, 318930, '2024-09-26 11:41:54', '2024-09-30 10:39:28'),
(33, 83, 12200, '2024-09-26 14:11:57', '2024-09-26 14:29:45'),
(34, 82, 4250, '2024-09-26 14:41:30', '2024-09-30 11:10:50'),
(35, 84, 6021, '2024-09-26 14:42:01', '2024-09-26 14:45:17'),
(36, 73, 186455, '2024-09-26 15:34:34', '2024-09-30 11:02:21'),
(37, 86, 80450, '2024-09-29 14:12:15', '2024-09-30 11:09:58'),
(38, 89, 39300, '2024-09-29 14:33:06', '2024-09-29 14:33:29'),
(40, 91, 0, '2024-09-29 14:39:40', '2024-09-30 11:13:30'),
(41, 90, 247940, '2024-09-29 14:42:55', '2024-09-29 14:49:15'),
(42, 88, 20612, '2024-09-29 14:56:52', '2024-09-30 11:14:43'),
(44, 93, 0, '2024-09-29 15:41:50', '2024-09-30 11:12:39'),
(45, 94, 17890, '2024-09-29 15:48:35', '2024-09-30 11:05:38'),
(46, 95, 28750, '2024-09-29 16:34:37', '2024-09-29 16:34:37'),
(47, 68, 245554, '2024-09-29 16:59:28', '2024-10-05 14:38:19'),
(48, 96, 234000, '2024-09-29 17:53:08', '2024-09-29 17:55:33'),
(49, 98, 30380, '2024-09-30 10:48:15', '2024-09-30 10:48:59'),
(50, 97, 18000, '2024-09-30 11:18:25', '2024-10-01 15:53:02'),
(51, 101, 1500, '2024-10-05 14:26:14', '2024-10-05 14:26:14'),
(52, 104, 33500, '2024-10-22 14:37:34', '2024-10-22 14:37:34');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(11) NOT NULL,
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`items`)),
  `total_weight` int(11) NOT NULL,
  `total_price` float(10,2) NOT NULL,
  `foto` text DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `items`, `total_weight`, `total_price`, `foto`, `updated_at`, `created_at`) VALUES
(11, '[{\"id\":\"11\",\"name\":\"Koran Bekas\",\"price\":800,\"image\":\"uploads\\/1\\/2024-08\\/koran.jpeg\"},{\"id\":\"11\",\"name\":\"Koran Bekas\",\"price\":800,\"image\":\"uploads\\/1\\/2024-08\\/koran.jpeg\"}]', 2, 1600.00, '', '2024-08-06 07:08:33', '2024-08-06 07:08:33'),
(12, '[{\"id\":\"11\",\"name\":\"Koran Bekas\",\"price\":800,\"image\":\"uploads\\/1\\/2024-08\\/koran.jpeg\"},{\"id\":\"11\",\"name\":\"Koran Bekas\",\"price\":800,\"image\":\"uploads\\/1\\/2024-08\\/koran.jpeg\"}]', 2, 1600.00, NULL, '2024-08-06 07:28:31', '2024-08-06 07:28:31'),
(13, '[]', 0, 0.00, NULL, '2024-08-06 07:45:09', '2024-08-06 07:45:09'),
(14, '[{\"id\":\"9\",\"name\":\"Botol Bekas\",\"price\":750,\"image\":\"uploads\\/1\\/2024-08\\/download.jpeg\"},{\"id\":\"12\",\"name\":\"Tutup Galon\",\"price\":1500,\"image\":\"uploads\\/1\\/2024-08\\/tutupgalon.jpeg\"},{\"id\":\"9\",\"name\":\"Botol Bekas\",\"price\":750,\"image\":\"uploads\\/1\\/2024-08\\/download.jpeg\"},{\"id\":\"11\",\"name\":\"Koran Bekas\",\"price\":800,\"image\":\"uploads\\/1\\/2024-08\\/koran.jpeg\"}]', 4, 3800.00, NULL, '2024-08-07 00:14:23', '2024-08-07 00:14:23'),
(15, '[{\"id\":\"9\",\"name\":\"Botol Bekas\",\"price\":750,\"quantity\":1}]', 1, 750.00, NULL, '2024-08-07 05:49:57', '2024-08-07 05:49:57'),
(16, '[{\"id\":\"11\",\"name\":\"Koran Bekas\",\"price\":800,\"image\":\"uploads\\/1\\/2024-08\\/koran.jpeg\",\"weight\":2},{\"id\":\"12\",\"name\":\"Tutup Galon\",\"price\":1500,\"image\":\"uploads\\/1\\/2024-08\\/tutupgalon.jpeg\",\"weight\":1},{\"id\":\"9\",\"name\":\"Botol Bekas\",\"price\":750,\"image\":\"uploads\\/1\\/2024-08\\/download.jpeg\",\"weight\":1}]', 4, 3850.00, NULL, '2024-08-07 05:58:38', '2024-08-07 05:58:38'),
(17, '[{\"id\":\"10\",\"name\":\"Kardus\",\"price\":825,\"image\":\"uploads\\/1\\/2024-08\\/kardus.jpeg\",\"weight\":2},{\"id\":\"11\",\"name\":\"Koran Bekas\",\"price\":800,\"image\":\"uploads\\/1\\/2024-08\\/koran.jpeg\",\"weight\":2},{\"id\":\"9\",\"name\":\"Botol Bekas\",\"price\":750,\"image\":\"uploads\\/1\\/2024-08\\/download.jpeg\",\"weight\":1}]', 5, 4000.00, NULL, '2024-08-07 05:59:17', '2024-08-07 05:59:17'),
(18, '[{\"id\":\"10\",\"name\":\"Kardus\",\"price\":825,\"image\":\"uploads\\/1\\/2024-08\\/kardus.jpeg\",\"weight\":2}]', 2, 1650.00, NULL, '2024-08-07 05:59:36', '2024-08-07 05:59:36'),
(19, '[{\"id\":\"10\",\"name\":\"Kardus\",\"price\":825,\"image\":\"uploads\\/1\\/2024-08\\/kardus.jpeg\",\"weight\":2}]', 2, 1650.00, NULL, '2024-08-07 06:00:07', '2024-08-07 06:00:07'),
(20, '[{\"id\":\"10\",\"name\":\"Kardus\",\"price\":825,\"image\":\"uploads\\/1\\/2024-08\\/kardus.jpeg\",\"weight\":2},{\"id\":\"13\",\"name\":\"TV Bekas\",\"price\":5000,\"image\":\"uploads\\/1\\/2024-08\\/tv.jpeg\",\"weight\":1},{\"id\":\"9\",\"name\":\"Botol Bekas\",\"price\":750,\"image\":\"uploads\\/1\\/2024-08\\/download.jpeg\",\"weight\":1},{\"id\":\"11\",\"name\":\"Koran Bekas\",\"price\":800,\"image\":\"uploads\\/1\\/2024-08\\/koran.jpeg\",\"weight\":2}]', 6, 9000.00, NULL, '2024-08-07 06:20:46', '2024-08-07 06:20:46'),
(21, '[{\"id\":\"10\",\"name\":\"Kardus\",\"price\":825,\"image\":\"uploads\\/1\\/2024-08\\/kardus.jpeg\",\"weight\":2}]', 2, 1650.00, NULL, '2024-08-07 06:22:44', '2024-08-07 06:22:44'),
(22, '[{\"id\":\"10\",\"name\":\"Kardus\",\"price\":825,\"image\":\"uploads\\/1\\/2024-08\\/kardus.jpeg\",\"weight\":1},{\"id\":\"11\",\"name\":\"Koran Bekas\",\"price\":800,\"image\":\"uploads\\/1\\/2024-08\\/koran.jpeg\",\"weight\":1}]', 2, 1625.00, NULL, '2024-08-07 06:41:32', '2024-08-07 06:41:32'),
(23, '[{\"id\":\"9\",\"name\":\"Botol Bekas\",\"price\":750,\"image\":\"uploads\\/1\\/2024-08\\/download.jpeg\",\"weight\":1},{\"id\":\"12\",\"name\":\"Tutup Galon\",\"price\":1500,\"image\":\"uploads\\/1\\/2024-08\\/tutupgalon.jpeg\",\"weight\":1}]', 2, 2250.00, NULL, '2024-08-07 06:42:14', '2024-08-07 06:42:14'),
(24, '[{\"id\":\"10\",\"name\":\"Kardus\",\"price\":825,\"image\":\"uploads\\/1\\/2024-08\\/kardus.jpeg\",\"weight\":1},{\"id\":\"9\",\"name\":\"Botol Bekas\",\"price\":750,\"image\":\"uploads\\/1\\/2024-08\\/download.jpeg\",\"weight\":1}]', 2, 1575.00, NULL, '2024-08-07 07:15:37', '2024-08-07 07:15:37'),
(25, '[{\"id\":\"9\",\"name\":\"Botol Bekas\",\"price\":750,\"image\":\"uploads\\/1\\/2024-08\\/download.jpeg\",\"weight\":2},{\"id\":\"12\",\"name\":\"Tutup Galon\",\"price\":1500,\"image\":\"uploads\\/1\\/2024-08\\/tutupgalon.jpeg\",\"weight\":2}]', 4, 4500.00, NULL, '2024-08-07 07:32:40', '2024-08-07 07:32:40'),
(26, '[{\"id\":\"13\",\"name\":\"TV Bekas\",\"price\":5000,\"image\":\"uploads\\/1\\/2024-08\\/tv.jpeg\",\"weight\":1},{\"id\":\"15\",\"name\":\"Radio Bekas\",\"price\":3500,\"image\":\"uploads\\/1\\/2024-08\\/radio.jpeg\",\"weight\":1}]', 2, 8500.00, NULL, '2024-08-07 07:39:50', '2024-08-07 07:39:50'),
(27, '[{\"id\":\"13\",\"name\":\"TV Bekas\",\"price\":5000,\"image\":\"uploads\\/1\\/2024-08\\/tv.jpeg\",\"weight\":1},{\"id\":\"15\",\"name\":\"Radio Bekas\",\"price\":3500,\"image\":\"uploads\\/1\\/2024-08\\/radio.jpeg\",\"weight\":1}]', 2, 8500.00, NULL, '2024-08-07 07:41:27', '2024-08-07 07:41:27'),
(28, '[{\"id\":\"13\",\"name\":\"TV Bekas\",\"price\":5000,\"image\":\"uploads\\/1\\/2024-08\\/tv.jpeg\",\"weight\":2}]', 2, 10000.00, NULL, '2024-08-07 21:25:39', '2024-08-07 21:25:39'),
(29, '[{\"id\":\"10\",\"name\":\"Kardus\",\"price\":825,\"image\":\"uploads\\/1\\/2024-08\\/kardus.jpeg\",\"weight\":2}]', 2, 1650.00, NULL, '2024-08-07 21:26:57', '2024-08-07 21:26:57'),
(30, '[{\"id\":\"9\",\"name\":\"Botol Bekas\",\"price\":750,\"image\":\"uploads\\/1\\/2024-08\\/download.jpeg\",\"weight\":1},{\"id\":\"10\",\"name\":\"Kardus\",\"price\":825,\"image\":\"uploads\\/1\\/2024-08\\/kardus.jpeg\",\"weight\":1}]', 2, 1575.00, NULL, '2024-08-07 21:34:11', '2024-08-07 21:34:11'),
(31, '[{\"id\":\"13\",\"name\":\"TV Bekas\",\"price\":5000,\"image\":\"uploads\\/1\\/2024-08\\/tv.jpeg\",\"weight\":1},{\"id\":\"9\",\"name\":\"Botol Bekas\",\"price\":750,\"image\":\"uploads\\/1\\/2024-08\\/download.jpeg\",\"weight\":1}]', 2, 5750.00, NULL, '2024-08-07 21:35:31', '2024-08-07 21:35:31'),
(32, '[{\"id\":\"12\",\"name\":\"Tutup Galon\",\"price\":1500,\"image\":\"uploads\\/1\\/2024-08\\/tutupgalon.jpeg\",\"weight\":1},{\"id\":\"11\",\"name\":\"Koran Bekas\",\"price\":800,\"image\":\"uploads\\/1\\/2024-08\\/koran.jpeg\",\"weight\":1}]', 2, 2300.00, NULL, '2024-08-07 21:36:04', '2024-08-07 21:36:04'),
(33, '[{\"id\":\"13\",\"name\":\"TV Bekas\",\"price\":5000,\"image\":\"uploads\\/1\\/2024-08\\/tv.jpeg\",\"weight\":1},{\"id\":\"9\",\"name\":\"Botol Bekas\",\"price\":750,\"image\":\"uploads\\/1\\/2024-08\\/download.jpeg\",\"weight\":1}]', 2, 5750.00, NULL, '2024-08-07 21:36:26', '2024-08-07 21:36:26'),
(34, '[{\"id\":\"11\",\"name\":\"Koran Bekas\",\"price\":800,\"image\":\"uploads\\/1\\/2024-08\\/koran.jpeg\",\"weight\":2}]', 2, 1600.00, NULL, '2024-08-07 22:09:16', '2024-08-07 22:09:16'),
(35, '[{\"id\":\"13\",\"name\":\"TV Bekas\",\"price\":5000,\"image\":\"uploads\\/1\\/2024-08\\/tv.jpeg\",\"weight\":1},{\"id\":\"9\",\"name\":\"Botol Bekas\",\"price\":750,\"image\":\"uploads\\/1\\/2024-08\\/download.jpeg\",\"weight\":1}]', 2, 5750.00, NULL, '2024-08-07 23:22:39', '2024-08-07 23:22:39');

-- --------------------------------------------------------

--
-- Table structure for table `sampah`
--

CREATE TABLE `sampah` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `admin_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price_per_kg` int(11) NOT NULL,
  `poin_per_kg` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sampah`
--

INSERT INTO `sampah` (`id`, `category_id`, `admin_id`, `name`, `deskripsi`, `image`, `price_per_kg`, `poin_per_kg`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Botol Plastik', NULL, 'uploads/1/2024-08/download.jpeg', 750, 0, '2024-08-10 07:05:28', NULL),
(2, 1, 1, 'Tutup Galon', NULL, 'uploads/1/2024-08/tutupgalon.jpeg', 500, 0, '2024-08-10 07:05:47', NULL),
(3, 2, 1, 'Kardus', NULL, 'uploads/1/2024-08/kardus.jpeg', 800, 0, '2024-08-10 07:06:08', NULL),
(4, 2, 1, 'Koran Bekas', NULL, 'uploads/1/2024-08/koran.jpeg', 750, 0, '2024-08-10 07:06:25', NULL),
(6, 6, 5, 'Bodong A', 'botol plastik bening tanpa label dan tutup', 'uploads/5/2024-09/download.jpeg', 5000, 0, '2024-08-16 08:51:17', '2024-09-30 10:25:20'),
(7, 6, 5, 'Tutup Galon', NULL, 'uploads/5/2024-08/tutupgalon.jpeg', 6500, 0, '2024-08-16 08:51:40', '2024-09-29 17:01:55'),
(18, 13, 12, 'Kardus', NULL, 'uploads/12/2024-09/kardus.jpeg', 1100, 0, '2024-09-06 21:32:26', NULL),
(19, 14, 12, 'Botol Plastik', NULL, 'uploads/12/2024-09/download.jpeg', 1000, 0, '2024-09-06 21:32:44', NULL),
(20, 13, 12, 'Buku', NULL, 'uploads/12/2024-09/buku.jpg', 1100, 0, '2024-09-06 21:35:49', NULL),
(21, 15, 13, 'Botol Plastik', NULL, 'uploads/13/2024-09/download.jpeg', 1000, 0, '2024-09-06 21:46:09', NULL),
(22, 16, 13, 'Buku', NULL, 'uploads/13/2024-09/buku.jpg', 1100, 0, '2024-09-06 21:46:40', NULL),
(23, 16, 13, 'Kardus', NULL, 'uploads/13/2024-09/kardus.jpeg', 2100, 0, '2024-09-06 21:46:54', NULL),
(24, 17, 14, 'Botol Plastik', NULL, 'uploads/14/2024-09/download.jpeg', 1000, 0, '2024-09-06 21:50:40', NULL),
(25, 18, 14, 'Kardus', NULL, 'uploads/14/2024-09/kardus.jpeg', 2100, 0, '2024-09-06 21:50:52', NULL),
(26, 18, 14, 'Buku', NULL, 'uploads/14/2024-09/buku.jpg', 1100, 0, '2024-09-06 21:51:13', NULL),
(27, 20, 22, 'Kardus', NULL, 'uploads/22/2024-09/kardus.jpg', 1100, 0, '2024-09-06 21:51:21', NULL),
(28, 19, 22, 'Botol Plastik', NULL, 'uploads/22/2024-09/botol.jpg', 1000, 0, '2024-09-06 21:51:54', NULL),
(29, 20, 22, 'Buku', NULL, 'uploads/22/2024-09/buku.jpg', 1100, 0, '2024-09-06 21:52:13', NULL),
(30, 21, 15, 'Botol Plastik', NULL, 'uploads/15/2024-09/download.jpeg', 1000, 0, '2024-09-06 21:52:51', NULL),
(31, 22, 15, 'Kardus', NULL, 'uploads/15/2024-09/kardus.jpeg', 2100, 0, '2024-09-06 21:53:04', NULL),
(32, 22, 15, 'Buku', NULL, 'uploads/15/2024-09/buku.jpg', 1100, 0, '2024-09-06 21:53:17', NULL),
(33, 23, 16, 'Botol Plastik', NULL, 'uploads/16/2024-09/download.jpeg', 1000, 0, '2024-09-06 21:54:40', NULL),
(34, 24, 16, 'Kardus', NULL, 'uploads/16/2024-09/kardus.jpeg', 2100, 0, '2024-09-06 21:54:50', NULL),
(35, 24, 16, 'Buku', NULL, 'uploads/16/2024-09/buku.jpg', 1100, 0, '2024-09-06 21:55:03', NULL),
(36, 26, 23, 'Kardus', NULL, 'uploads/23/2024-09/kardus.jpg', 1100, 0, '2024-09-06 21:57:31', NULL),
(37, 27, 17, 'Botol Plastik', NULL, 'uploads/17/2024-09/download.jpeg', 1000, 0, '2024-09-06 21:57:32', NULL),
(38, 28, 17, 'Kardus', NULL, 'uploads/17/2024-09/kardus.jpeg', 2100, 0, '2024-09-06 21:57:43', NULL),
(39, 25, 23, 'Botol Plastik', NULL, 'uploads/23/2024-09/botol.jpg', 1000, 0, '2024-09-06 21:57:49', NULL),
(40, 28, 17, 'Buku', NULL, 'uploads/17/2024-09/buku.jpg', 1100, 0, '2024-09-06 21:57:59', NULL),
(41, 26, 23, 'Buku', NULL, 'uploads/23/2024-09/buku.jpg', 1100, 0, '2024-09-06 21:58:04', NULL),
(42, 29, 18, 'Botol Plastik', NULL, 'uploads/18/2024-09/download.jpeg', 1000, 0, '2024-09-06 21:59:40', NULL),
(43, 30, 18, 'Kardus', NULL, 'uploads/18/2024-09/kardus.jpeg', 2100, 0, '2024-09-06 21:59:50', NULL),
(44, 30, 18, 'Buku', NULL, 'uploads/18/2024-09/buku.jpg', 1100, 0, '2024-09-06 22:00:02', NULL),
(45, 32, 24, 'Kardus', NULL, 'uploads/24/2024-09/kardus.jpg', 1100, 0, '2024-09-06 22:01:47', NULL),
(46, 31, 24, 'Botol Plastik', NULL, 'uploads/24/2024-09/botol.jpg', 1000, 0, '2024-09-06 22:02:04', NULL),
(47, 32, 24, 'Buku', NULL, 'uploads/24/2024-09/buku.jpg', 1100, 0, '2024-09-06 22:02:21', NULL),
(48, 33, 19, 'Botol Plastik', NULL, 'uploads/19/2024-09/download.jpeg', 1000, 0, '2024-09-06 22:02:29', NULL),
(49, 34, 19, 'Kardus', NULL, 'uploads/19/2024-09/kardus.jpeg', 2100, 0, '2024-09-06 22:02:40', NULL),
(50, 34, 19, 'Buku', NULL, 'uploads/19/2024-09/buku.jpg', 1100, 0, '2024-09-06 22:02:53', NULL),
(51, 36, 25, 'Kardus', NULL, 'uploads/25/2024-09/kardus.jpg', 1100, 0, '2024-09-06 22:03:34', NULL),
(52, 35, 25, 'Botol Plastik', NULL, 'uploads/25/2024-09/botol.jpg', 1000, 0, '2024-09-06 22:03:50', NULL),
(53, 36, 25, 'Buku', NULL, 'uploads/25/2024-09/buku.jpg', 1100, 0, '2024-09-06 22:04:10', NULL),
(54, 37, 20, 'Botol Plastik', NULL, 'uploads/20/2024-09/download.jpeg', 1000, 0, '2024-09-06 22:04:30', NULL),
(55, 38, 20, 'Kardus', NULL, 'uploads/20/2024-09/kardus.jpeg', 2100, 0, '2024-09-06 22:04:39', NULL),
(56, 38, 20, 'Buku', NULL, 'uploads/20/2024-09/buku.jpg', 1100, 0, '2024-09-06 22:04:53', NULL),
(57, 39, 21, 'Botol Plastik', NULL, 'uploads/21/2024-09/download.jpeg', 1000, 0, '2024-09-06 22:06:34', NULL),
(58, 40, 21, 'Kardus', NULL, 'uploads/21/2024-09/kardus.jpeg', 2100, 0, '2024-09-06 22:06:47', NULL),
(59, 40, 21, 'Buku', NULL, 'uploads/21/2024-09/buku.jpg', 1100, 0, '2024-09-06 22:06:58', NULL),
(60, 42, 26, 'Kardus', NULL, 'uploads/26/2024-09/kardus.jpg', 1100, 0, '2024-09-06 22:07:42', NULL),
(61, 41, 26, 'Bodong A', 'Botol bersih', 'uploads/26/2024-09/botol.jpg', 6700, 25, '2024-09-06 22:07:58', '2024-09-26 14:39:48'),
(62, 42, 26, 'Buku', NULL, 'uploads/26/2024-09/buku.jpg', 1100, 0, '2024-09-06 22:08:17', NULL),
(63, 44, 27, 'Kardus', NULL, 'uploads/27/2024-09/kardus.jpg', 1100, 0, '2024-09-06 22:10:18', NULL),
(64, 43, 27, 'Botol Plastik', NULL, 'uploads/27/2024-09/botol.jpg', 1000, 0, '2024-09-06 22:10:32', NULL),
(65, 44, 27, 'Buku', NULL, 'uploads/27/2024-09/buku.jpg', 1100, 0, '2024-09-06 22:10:47', NULL),
(66, 45, 28, 'Kardus', NULL, 'uploads/28/2024-09/kardus.jpg', 1100, 0, '2024-09-06 22:14:13', NULL),
(67, 46, 28, 'Botol Plastik', NULL, 'uploads/28/2024-09/botol.jpg', 1000, 0, '2024-09-06 22:14:36', NULL),
(68, 45, 28, 'Buku', NULL, 'uploads/28/2024-09/buku.jpg', 1100, 0, '2024-09-06 22:15:01', NULL),
(69, 47, 29, 'Kardus', NULL, 'uploads/29/2024-09/kardus.jpg', 1100, 0, '2024-09-06 22:16:12', NULL),
(70, 48, 29, 'Botol Plastik', NULL, 'uploads/29/2024-09/botol.jpg', 1000, 0, '2024-09-06 22:16:27', NULL),
(71, 47, 29, 'Buku', NULL, 'uploads/29/2024-09/buku.jpg', 1100, 0, '2024-09-06 22:16:45', NULL),
(72, 49, 30, 'Kardus', NULL, 'uploads/30/2024-09/kardus.jpg', 1100, 0, '2024-09-06 22:19:14', NULL),
(73, 50, 30, 'Botol Plastik', NULL, 'uploads/30/2024-09/botol.jpg', 1000, 0, '2024-09-06 22:19:31', NULL),
(74, 49, 30, 'Buku', NULL, 'uploads/30/2024-09/buku.jpg', 1100, 0, '2024-09-06 22:19:47', NULL),
(75, 51, 31, 'Kardus', NULL, 'uploads/31/2024-09/kardus.jpg', 1100, 0, '2024-09-06 22:22:04', NULL),
(76, 52, 31, 'Botol Plastik', NULL, 'uploads/31/2024-09/botol.jpg', 1000, 0, '2024-09-06 22:22:19', NULL),
(77, 51, 31, 'Buku', NULL, 'uploads/31/2024-09/buku.jpg', 1100, 0, '2024-09-06 22:22:52', NULL),
(79, 53, 5, 'Kertas Putih', 'kertas warna putih tanpa cover', 'uploads/5/2024-09/putihan.jpg', 1500, 0, '2024-09-21 11:26:44', '2024-09-21 13:55:12'),
(80, 53, 5, 'Kardus', NULL, 'uploads/5/2024-09/kardus.jpg', 1500, 0, '2024-09-21 11:27:56', '2024-10-02 14:41:56'),
(81, 6, 5, 'Gelas A', 'Gelas aqua tanpa label', 'uploads/5/2024-09/gelas_a.jpg', 3500, 0, '2024-09-21 11:32:10', '2024-09-29 16:28:30'),
(82, 6, 5, 'Gelas Kopi/B', 'Jenis berbahan plastik bening transparan berbentuk gelas', 'uploads/5/2024-09/gelas_kopi.jpg', 2400, 0, '2024-09-21 11:37:44', '2024-09-21 13:12:27'),
(83, 6, 5, 'Bodong Kotor', 'Jenis botol plastik bening transparan bekas air mineral', 'uploads/5/2024-09/bodong_kotor.jpg', 2000, 0, '2024-09-21 11:40:55', '2024-09-21 13:12:43'),
(84, 6, 5, 'Bodong B', 'Jenis botol plastik dan Label tidak bisa dihilangkan', 'uploads/5/2024-09/bodong_b.jpg', 600, 0, '2024-09-21 11:42:34', '2024-09-21 13:12:57'),
(85, 53, 5, 'Majalah', NULL, 'uploads/5/2024-09/majalah.jpg', 1000, 0, '2024-09-21 11:43:25', NULL),
(86, 53, 5, 'Buku', NULL, 'uploads/5/2024-09/buku.jpg', 1000, 0, '2024-09-21 11:48:38', '2024-09-29 18:21:49'),
(87, 6, 5, 'Tutup Botol', NULL, 'uploads/5/2024-09/tutup_botol.jpg', 2800, 0, '2024-09-21 11:49:25', NULL),
(88, 66, 5, 'Alumunium Rongsok', NULL, 'uploads/5/2024-09/aluminium_rongsok.jpg', 15000, 0, '2024-09-21 12:27:51', NULL),
(89, 6, 5, 'Ember Warna', 'Jenis berbahan plastik, lentur, bermacam-macam warna', 'uploads/5/2024-09/ember_warna.jpg', 1600, 0, '2024-09-21 12:28:57', '2024-09-21 13:13:08'),
(90, 6, 5, 'Naso', 'Jenis berbahan Plastik berwarna putih susu/buram', 'uploads/5/2024-09/naso.jpg', 3200, 0, '2024-09-21 12:30:47', '2024-09-22 21:25:00'),
(91, 6, 5, 'Bodong Warna', 'Jenis botol plastik Berwarna biru dan hijau.', 'uploads/5/2024-09/bodong_warna.jpg', 1400, 0, '2024-09-21 12:32:35', '2024-09-21 13:13:30'),
(92, 65, 5, 'Kaleng', NULL, 'uploads/5/2024-09/kaleng.jpg', 2600, 0, '2024-09-21 12:34:45', '2024-09-29 15:55:54'),
(93, 6, 5, 'Ember Hitam', 'Jenis berbahan plastik, lentur, berwarna hitam', 'uploads/5/2024-09/ember_hitam.jpg', 800, 0, '2024-09-21 12:35:49', '2024-09-29 15:01:56'),
(94, 67, 5, 'Beling', NULL, 'uploads/5/2024-09/beling.jpg', 200, 0, '2024-09-21 12:37:31', NULL),
(95, 6, 5, 'Inject', 'Jenis berbahan plastik bening, transparan, tebal,lentur', 'uploads/5/2024-09/pp_inject.jpg', 3300, 0, '2024-09-21 12:38:45', '2024-09-21 14:13:26'),
(96, 6, 5, 'Impact', 'Jenis bahan plastik padat ,keras, berwarna dan berbunyi krek', 'uploads/5/2024-09/impact.jpg', 500, 0, '2024-09-21 12:40:21', '2024-09-21 13:14:17'),
(97, 65, 5, 'Besi', NULL, 'uploads/5/2024-09/besi.png', 3600, 0, '2024-09-21 12:45:41', '2024-09-29 17:37:53'),
(98, 67, 5, 'Gabruk', 'sampah 3R campur', 'uploads/5/2024-09/gabruk.jpg', 800, 0, '2024-09-21 12:50:15', '2024-10-04 09:52:12'),
(99, 6, 5, 'Asoy/kresek', NULL, 'uploads/5/2024-09/boncos.jpg', 560, 0, '2024-09-21 12:53:06', '2024-09-29 17:15:22'),
(100, 53, 5, 'Duplek/Boncos', 'kardus nasi', 'uploads/5/2024-09/duplek_boncos.jpg', 560, 0, '2024-09-21 12:57:30', '2024-09-29 15:05:23'),
(101, 6, 5, 'Le Mineral', NULL, 'uploads/5/2024-09/le_mineral.jpg', 4000, 0, '2024-09-21 12:59:17', NULL),
(102, 6, 5, 'Paralon', NULL, 'uploads/5/2024-09/paralon.jpg', 1200, 0, '2024-09-21 13:06:52', NULL),
(103, 54, 26, 'Besi', 'Besi', 'uploads/26/2024-09/1727335874576859579815477510205.jpg', 4500, 10, '2024-09-26 14:32:53', NULL),
(105, 53, 5, 'Koran', NULL, 'uploads/5/2024-09/koran.jpg', 1000, 0, '2024-09-29 14:10:15', NULL),
(106, 41, 26, 'Gelas kopi', 'Gelas gambar print', 'uploads/26/2024-09/screenshot_20240929_154843.jpg', 2550, 10, '2024-09-29 15:55:03', NULL),
(107, 67, 5, 'Lapak/sandal/sepatu', 'Semua jenis sandal dan sepatu', 'uploads/5/2024-10/17280271269423846694461621661948.jpg', 500, 0, '2024-10-04 14:32:57', NULL),
(108, 41, 26, 'Gelas A', 'Gelas plastik bersih', 'uploads/26/2024-10/17286218272241175337324306918939.jpg', 39950, 5, '2024-10-11 11:48:31', NULL),
(109, 71, 26, 'Beling', 'Sampah pecah belah', 'uploads/26/2024-10/images.jpeg', 212, 0, '2024-10-22 13:36:08', NULL),
(110, 42, 26, 'Putihan', 'Kertas Hvs', 'uploads/26/2024-10/download.jpeg', 1700, 0, '2024-10-22 13:38:56', NULL),
(111, 41, 26, 'Lemineral', 'Galon', 'uploads/26/2024-10/download_1.jpeg', 4250, 0, '2024-10-22 13:42:13', NULL),
(112, 41, 26, 'Tutup Galon isi ulang/Aqua', NULL, 'uploads/26/2024-10/download_2.jpeg', 6800, 0, '2024-10-22 13:50:48', NULL),
(113, 41, 26, 'Tutup Botol', 'Tutup botol minuman', 'uploads/26/2024-10/2efb23d1e96435d51c7dee707032b2e4jpg_720x720q80.jpg', 2975, 0, '2024-10-22 13:53:15', NULL),
(114, 41, 26, 'Inject', 'Kotak makanan', 'uploads/26/2024-10/17295801154571100467867877809116.jpg', 9825, 0, '2024-10-22 13:58:26', NULL),
(115, 72, 26, 'Boncos', NULL, 'uploads/26/2024-10/images_1.jpeg', 595, 0, '2024-10-22 14:03:56', NULL),
(116, 68, 26, 'Almuniun panci', NULL, 'uploads/26/2024-10/images_2.jpeg', 1955, 0, '2024-10-22 14:10:09', '2024-10-22 14:25:01'),
(117, 68, 26, 'Almunium Rongsok', 'Bekas minuman', 'uploads/26/2024-10/17295811456495395190495096895251.jpg', 18275, 0, '2024-10-22 14:13:27', NULL),
(118, 70, 26, 'Keleng', 'Kaleng biscuit, susu, cat, dsb', 'uploads/26/2024-10/images_3.jpeg', 2550, 0, '2024-10-22 14:16:34', NULL),
(119, 73, 26, 'Gabruk', 'Sampah campuran & rongsok', 'uploads/26/2024-10/images_4.jpeg', 1275, 0, '2024-10-22 14:23:29', NULL),
(120, 41, 26, 'Bodong Warna', 'Botol minuman berwarna', 'uploads/26/2024-10/images_5.jpeg', 1530, 0, '2024-10-22 14:28:36', NULL),
(121, 74, 26, 'Karpet', 'Karpet talang dll', 'uploads/26/2024-10/download_3.jpeg', 425, 0, '2024-10-22 14:33:18', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sampah_categories`
--

CREATE TABLE `sampah_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sampah_categories`
--

INSERT INTO `sampah_categories` (`id`, `admin_id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 'Plastik', 'sampah plastik', '2024-08-10 07:04:37', '2024-08-10 14:04:37'),
(2, 1, 'Kertas', 'Sampah kertas', '2024-08-10 07:04:48', '2024-08-10 14:04:48'),
(3, 1, 'Elektronik', 'Sampah barang elektronik', '2024-08-15 09:11:40', '2024-08-15 09:11:40'),
(6, 5, 'Plastik', 'sampah plastik', '2024-08-16 08:48:57', '2024-08-16 08:48:57'),
(13, 12, 'Kertas', 'Sampah kertas', '2024-09-06 21:31:49', '2024-09-06 14:31:49'),
(14, 12, 'Plastik', 'sampah plastik', '2024-09-06 21:31:58', '2024-09-06 14:31:58'),
(15, 13, 'Plastik', 'sampah plastik', '2024-09-06 21:39:44', '2024-09-06 14:39:44'),
(16, 13, 'Kertas', 'Sampah kertas', '2024-09-06 21:39:54', '2024-09-06 14:39:54'),
(17, 14, 'Plastik', 'sampah plastik', '2024-09-06 21:50:11', '2024-09-06 14:50:11'),
(18, 14, 'Kertas', 'Sampah kertas', '2024-09-06 21:50:20', '2024-09-06 14:50:20'),
(19, 22, 'Plastik', 'Sampah Plastik', '2024-09-06 21:50:21', '2024-09-06 14:50:21'),
(20, 22, 'Kertas', 'Sampah Kertas', '2024-09-06 21:50:34', '2024-09-06 14:50:34'),
(21, 15, 'Plastik', 'sampah plastik', '2024-09-06 21:52:33', '2024-09-06 14:52:33'),
(22, 15, 'Kertas', 'Sampah kertas', '2024-09-06 21:52:41', '2024-09-06 14:52:41'),
(23, 16, 'Plastik', 'sampah plastik', '2024-09-06 21:54:21', '2024-09-06 14:54:21'),
(24, 16, 'Kertas', 'Sampah kertas', '2024-09-06 21:54:26', '2024-09-06 14:54:26'),
(25, 23, 'Plastik', 'Sampah Plastik', '2024-09-06 21:56:51', '2024-09-06 14:56:51'),
(26, 23, 'Kertas', 'Sampah Kertas', '2024-09-06 21:57:00', '2024-09-06 14:57:00'),
(27, 17, 'Plastik', 'sampah plastik', '2024-09-06 21:57:04', '2024-09-06 14:57:04'),
(28, 17, 'Kertas', 'Sampah kertas', '2024-09-06 21:57:18', '2024-09-06 14:57:18'),
(29, 18, 'Plastik', 'sampah plastik', '2024-09-06 21:59:13', '2024-09-06 14:59:13'),
(30, 18, 'Kertas', 'Sampah kertas', '2024-09-06 21:59:24', '2024-09-06 14:59:24'),
(31, 24, 'Plastik', 'Sampah Plastik', '2024-09-06 22:01:17', '2024-09-06 15:01:17'),
(32, 24, 'Kertas', 'Sampah Kertas', '2024-09-06 22:01:27', '2024-09-06 15:01:27'),
(33, 19, 'Plastik', 'sampah plastik', '2024-09-06 22:02:10', '2024-09-06 15:02:10'),
(34, 19, 'Kertas', 'Sampah kertas', '2024-09-06 22:02:15', '2024-09-06 15:02:15'),
(35, 25, 'Plastik', 'Sampah Plastik', '2024-09-06 22:03:03', '2024-09-06 15:03:03'),
(36, 25, 'Kertas', 'Sampah Kertas', '2024-09-06 22:03:10', '2024-09-06 15:03:10'),
(37, 20, 'Plastik', 'sampah plastik', '2024-09-06 22:04:13', '2024-09-06 15:04:13'),
(38, 20, 'Kertas', 'Sampah kertas', '2024-09-06 22:04:17', '2024-09-06 15:04:17'),
(39, 21, 'Plastik', 'sampah plastik', '2024-09-06 22:06:03', '2024-09-06 15:06:03'),
(40, 21, 'Kertas', 'Sampah kertas', '2024-09-06 22:06:13', '2024-09-06 15:06:13'),
(41, 26, 'Plastik', 'Sampah Plastik', '2024-09-06 22:07:13', '2024-09-06 15:07:13'),
(42, 26, 'Kertas', 'Sampah Kertas', '2024-09-06 22:07:22', '2024-09-06 15:07:22'),
(43, 27, 'Plastik', 'Sampah Plastik', '2024-09-06 22:09:51', '2024-09-06 15:09:51'),
(44, 27, 'Kertas', 'Sampah Kertas', '2024-09-06 22:09:57', '2024-09-06 15:09:57'),
(45, 28, 'Kertas', 'Sampah Kertas', '2024-09-06 22:13:30', '2024-09-06 15:13:30'),
(46, 28, 'Plastik', 'Sampah Plastik', '2024-09-06 22:13:42', '2024-09-06 15:13:42'),
(47, 29, 'Kertas', 'Sampah Kertas', '2024-09-06 22:15:45', '2024-09-06 15:15:45'),
(48, 29, 'Plastik', 'Sampah Plastik', '2024-09-06 22:15:51', '2024-09-06 15:15:51'),
(49, 30, 'Kertas', 'Sampah Kertas', '2024-09-06 22:18:48', '2024-09-06 15:18:48'),
(50, 30, 'Plastik', 'Sampah Plastik', '2024-09-06 22:18:55', '2024-09-06 15:18:55'),
(51, 31, 'Kertas', 'Sampah Kertas', '2024-09-06 22:21:40', '2024-09-06 15:21:40'),
(52, 31, 'Plastik', 'Sampah Plastik', '2024-09-06 22:21:46', '2024-09-06 15:21:46'),
(53, 5, 'Kertas', 'Sampah Kertas', '2024-09-07 09:29:49', '2024-09-07 02:29:49'),
(54, 26, 'Besi', '-', '2024-09-07 10:56:00', '2024-09-07 03:56:00'),
(65, 5, 'Besi', 'Sampah Besi', '2024-09-08 16:59:08', '2024-09-08 09:59:08'),
(66, 5, 'Alumunium', 'Semua Jenis Alumunium', '2024-09-21 12:27:00', '2024-09-21 05:27:00'),
(67, 5, 'lain-lain', 'lain-lain', '2024-09-21 12:36:41', '2024-09-21 05:36:41'),
(68, 26, 'Almunium', 'Sampah jenis almunium', '2024-10-22 13:24:16', '2024-10-22 06:24:16'),
(69, 26, 'Kabin', '-', '2024-10-22 13:27:38', '2024-10-22 06:27:38'),
(70, 26, 'Kaleng', '-', '2024-10-22 13:28:26', '2024-10-22 06:28:26'),
(71, 26, 'Beling', 'Sampah pecah belah', '2024-10-22 13:29:23', '2024-10-22 06:29:23'),
(72, 26, 'Karton', '-', '2024-10-22 14:00:34', '2024-10-22 07:00:34'),
(73, 26, 'Gabruk', 'Sampah campuran & rongsok', '2024-10-22 14:18:25', '2024-10-22 07:18:25'),
(74, 26, 'Karet', 'Berbahan karet', '2024-10-22 14:30:30', '2024-10-22 07:30:30');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `admin_id` int(10) UNSIGNED DEFAULT NULL,
  `sampah_id` bigint(20) UNSIGNED DEFAULT NULL,
  `total_weight` double(8,2) NOT NULL,
  `total_income` int(11) NOT NULL,
  `point_received` int(11) NOT NULL,
  `periode` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `admin_id`, `sampah_id`, `total_weight`, `total_income`, `point_received`, `periode`, `created_at`, `updated_at`) VALUES
(58, 66, 5, 80, 10.55, 16880, 1055, '20/6/2024', '2024-09-21 13:37:20', '2024-09-26 13:30:22'),
(59, 66, 5, 6, 1.70, 8500, 170, '03/7/2024', '2024-09-21 13:37:58', '2024-09-26 13:31:06'),
(60, 66, 5, 80, 14.40, 23040, 1440, '11/7/2024', '2024-09-21 13:38:50', '2024-09-26 13:32:05'),
(61, 66, 5, 79, 7.40, 11100, 0, '05/8/2024', '2024-09-21 13:39:35', '2024-09-26 13:33:09'),
(63, 66, 5, 6, 2.00, 10000, 200, '05/8/2024', '2024-09-21 13:41:05', '2024-09-26 13:33:38'),
(64, 66, 5, 80, 12.70, 20320, 1270, '26/8/2024', '2024-09-21 13:43:21', '2024-09-26 13:34:09'),
(66, 66, 5, 95, 1.20, 3960, 0, '26/8/2024', '2024-09-21 13:57:18', '2024-09-26 13:34:59'),
(82, 77, 5, 80, 2.50, 4000, 250, '26/8/2024', '2024-09-22 20:14:08', NULL),
(83, 78, 5, 80, 69.70, 111520, 6970, '07/5/2024', '2024-09-22 20:21:36', NULL),
(84, 78, 5, 80, 33.20, 53120, 3320, '21/5/2024', '2024-09-22 20:22:41', NULL),
(85, 78, 5, 86, 22.70, 18160, 2270, '21/05/2024', '2024-09-22 20:24:35', NULL),
(86, 78, 5, 80, 38.15, 61040, 3815, '03/6/2024', '2024-09-22 20:25:20', NULL),
(87, 78, 5, 80, 42.40, 67840, 4240, '13/6/2024', '2024-09-22 20:25:45', NULL),
(88, 78, 5, 80, 33.20, 53120, 3320, '25/6/2024', '2024-09-22 20:26:17', NULL),
(89, 78, 5, 80, 29.35, 46960, 2935, '12/7/2024', '2024-09-22 20:26:47', NULL),
(90, 78, 5, 80, 19.85, 31760, 1985, '09/8/2024', '2024-09-22 20:27:14', NULL),
(91, 78, 5, 80, 24.25, 38800, 2425, '30/8/2024', '2024-09-22 20:27:52', NULL),
(92, 78, 5, 80, 24.80, 39680, 2480, '13/9/2024', '2024-09-22 20:28:19', NULL),
(93, 65, 5, 6, 3.65, 16790, 365, '25/5/2024', '2024-09-22 21:00:46', NULL),
(94, 65, 5, 79, 57.10, 85650, 5710, '27/5/2024', '2024-09-22 21:01:25', NULL),
(95, 65, 5, 6, 2.35, 10810, 235, '29/5/2024', '2024-09-22 21:01:59', NULL),
(96, 65, 5, 83, 5.85, 11700, 585, '29/5/2024', '2024-09-22 21:02:22', NULL),
(97, 65, 5, 87, 0.70, 1960, 70, '29/5/2024', '2024-09-22 21:02:52', NULL),
(98, 65, 5, 6, 2.15, 9890, 215, '03/6/2024', '2024-09-22 21:03:48', NULL),
(99, 69, 5, 6, 3.25, 14950, 325, '03/6/2024', '2024-09-22 21:07:28', NULL),
(100, 69, 5, 87, 0.45, 1260, 45, '03/6/2024', '2024-09-22 21:07:56', NULL),
(101, 69, 5, 6, 2.95, 13570, 295, '07/6/2024', '2024-09-22 21:08:30', NULL),
(102, 69, 5, 80, 4.60, 7360, 460, '07/6/2024', '2024-09-22 21:08:53', NULL),
(103, 69, 5, 83, 7.75, 15500, 775, '21/5/2024', '2024-09-22 21:09:52', NULL),
(104, 67, 5, 80, 9.15, 14640, 915, '07/5/2024', '2024-09-22 21:12:07', NULL),
(105, 67, 5, 83, 9.90, 19800, 990, '07/5/2024', '2024-09-22 21:12:35', NULL),
(106, 67, 5, 80, 5.25, 8400, 525, '29/5/2024', '2024-09-22 21:13:30', NULL),
(107, 67, 5, 83, 6.40, 12800, 640, '29/5/2024', '2024-09-22 21:13:52', NULL),
(108, 67, 5, 80, 14.55, 23280, 1455, '03/6/2024', '2024-09-22 21:14:46', NULL),
(109, 67, 5, 83, 4.25, 8500, 425, '03/6/2024', '2024-09-22 21:15:08', NULL),
(110, 67, 5, 6, 1.90, 8740, 190, '07/6/2024', '2024-09-22 21:15:39', NULL),
(111, 67, 5, 80, 9.30, 14880, 930, '08/6/2024', '2024-09-22 21:16:34', NULL),
(112, 67, 5, 80, 9.15, 14640, 915, '13/6/2024', '2024-09-22 21:17:08', NULL),
(113, 65, 5, 80, 8.35, 13360, 835, '26/7/2024', '2024-09-22 21:19:39', NULL),
(114, 65, 5, 6, 3.70, 18500, 370, '01/8/2024', '2024-09-22 21:20:04', NULL),
(115, 65, 5, 80, 5.05, 8080, 505, '03/8/2024', '2024-09-22 21:20:59', NULL),
(116, 65, 5, 79, 6.05, 9075, 605, '03/8/2024', '2024-09-22 21:21:17', NULL),
(117, 65, 5, 87, 0.70, 1960, 70, '03/8/2024', '2024-09-22 21:21:41', NULL),
(118, 65, 5, 80, 5.45, 8720, 545, '20/8/2024', '2024-09-22 21:22:23', NULL),
(119, 65, 5, 90, 1.25, 4000, 125, '20/7/2024', '2024-09-22 21:25:35', NULL),
(120, 69, 5, 6, 2.05, 10250, 205, '12/6/2024', '2024-09-22 21:26:14', NULL),
(121, 69, 5, 87, 0.45, 1260, 45, '12/6/2024', '2024-09-22 21:26:33', NULL),
(123, 69, 5, 6, 1.50, 7500, 150, '27/6/2024', '2024-09-22 21:27:41', NULL),
(124, 69, 5, 88, 0.30, 4500, 30, '27/6/2024', '2024-09-22 21:28:14', NULL),
(125, 69, 5, 83, 2.15, 4300, 215, '27/6/2024', '2024-09-22 21:28:34', NULL),
(126, 72, 5, 100, 4.00, 2240, 400, '20/8/2024', '2024-09-22 21:30:07', NULL),
(127, 72, 5, 80, 9.20, 14720, 920, '20/8/2024', '2024-09-22 21:30:29', NULL),
(128, 72, 5, 87, 1.00, 2800, 100, '20/8/2024', '2024-09-22 21:30:52', NULL),
(129, 72, 5, 6, 9.80, 49000, 980, '20/8/2024', '2024-09-22 21:31:21', NULL),
(131, 67, 5, 6, 3.15, 15750, 0, '14/6/2024', '2024-09-23 13:05:27', NULL),
(132, 67, 5, 79, 1.50, 2250, 0, '14/6/2024', '2024-09-23 13:05:51', NULL),
(133, 67, 5, 79, 7.00, 10500, 0, '25/6/2024', '2024-09-23 13:06:36', NULL),
(134, 67, 5, 80, 4.60, 7360, 0, '25/6/2024', '2024-09-23 13:07:02', NULL),
(135, 67, 5, 6, 2.60, 13000, 0, '04/7/2024', '2024-09-23 13:07:39', NULL),
(136, 67, 5, 87, 0.65, 1820, 0, '04/7/2024', '2024-09-23 13:08:02', NULL),
(137, 67, 5, 80, 14.65, 23440, 0, '04/7/2024', '2024-09-23 13:08:23', NULL),
(138, 67, 5, 80, 13.75, 22000, 0, '17/7/2024', '2024-09-23 13:08:51', NULL),
(139, 67, 5, 98, 3.05, 3050, 0, '20/7/2024', '2024-09-23 13:09:19', NULL),
(140, 67, 5, 79, 19.80, 29700, 0, '20/7/2024', '2024-09-23 13:09:55', NULL),
(141, 67, 5, 100, 2.85, 1596, 143, '20/7/2024', '2024-09-23 13:10:13', NULL),
(142, 67, 5, 85, 127.65, 127650, 0, '20/7/2024', '2024-09-23 13:10:58', NULL),
(144, 67, 5, 6, 7.45, 37250, 0, '02/8/2024', '2024-09-23 13:12:11', NULL),
(145, 67, 5, 80, 6.10, 9760, 0, '02/8/2024', '2024-09-23 13:12:30', NULL),
(146, 67, 5, 79, 4.50, 6750, 0, '02/8/2024', '2024-09-23 13:12:48', NULL),
(147, 67, 5, 88, 1.00, 15000, 0, '10/8/2024', '2024-09-23 13:13:19', NULL),
(148, 67, 5, 80, 11.60, 18560, 0, '10/8/2024', '2024-09-23 13:13:47', NULL),
(149, 67, 5, 6, 3.50, 17500, 0, '22/8/2024', '2024-09-23 13:14:27', NULL),
(150, 67, 5, 87, 0.90, 2520, 0, '22/8/2024', '2024-09-23 13:14:47', NULL),
(151, 67, 5, 80, 11.60, 18560, 0, '22/8/2024', '2024-09-23 13:15:03', NULL),
(152, 67, 5, 80, 7.25, 11600, 0, '27/8/2024', '2024-09-23 13:15:29', NULL),
(153, 69, 5, 6, 2.25, 9900, 0, '07/5/2024', '2024-09-23 13:17:57', NULL),
(154, 76, 5, 6, 5.00, 22000, 0, '21/5/2024', '2024-09-23 13:20:12', NULL),
(155, 76, 5, 98, 10.40, 10400, 0, '21/5/2024', '2024-09-23 13:20:44', NULL),
(156, 76, 5, 87, 0.50, 1400, 0, '21/5/2024', '2024-09-23 13:21:10', NULL),
(157, 76, 5, 6, 7.30, 36500, 0, '12/6/2024', '2024-09-23 13:23:34', NULL),
(158, 76, 5, 98, 2.10, 2100, 0, '12/6/2024', '2024-09-23 13:23:53', NULL),
(159, 76, 5, 87, 0.65, 1820, 0, '12/6/2024', '2024-09-23 13:24:20', NULL),
(160, 76, 5, 79, 3.10, 4650, 0, '12/6/2024', '2024-09-23 13:24:42', NULL),
(161, 76, 5, 100, 1.00, 560, 50, '12/6/2024', '2024-09-23 13:25:02', NULL),
(162, 76, 5, 6, 10.75, 53750, 0, '27/6/2024', '2024-09-23 13:25:44', NULL),
(163, 76, 5, 98, 2.10, 2100, 0, '27/6/2024', '2024-09-23 13:26:04', NULL),
(164, 76, 5, 87, 1.00, 2800, 0, '27/6/2024', '2024-09-23 13:26:26', NULL),
(165, 76, 5, 80, 5.45, 8720, 0, '27/6/2024', '2024-09-23 13:27:04', NULL),
(166, 76, 5, 6, 11.55, 57750, 0, '27/7/2024', '2024-09-23 13:27:32', NULL),
(167, 76, 5, 80, 6.45, 10320, 0, '27/7/2024', '2024-09-23 13:28:00', NULL),
(168, 75, 5, 98, 3.80, 3800, 0, '19/8/2024', '2024-09-23 13:29:49', NULL),
(169, 75, 5, 80, 7.00, 11200, 0, '30/8/2024', '2024-09-23 13:30:27', NULL),
(170, 75, 5, 6, 1.25, 6250, 0, '30/8/2024', '2024-09-23 13:35:48', NULL),
(171, 71, 5, 101, 1.50, 6000, 0, '11/7/2024', '2024-09-23 13:42:49', NULL),
(173, 71, 5, 90, 0.40, 1280, 0, '11/7/2024', '2024-09-23 13:43:46', NULL),
(174, 71, 5, 80, 20.45, 32720, 0, '11/7/2024', '2024-09-23 13:44:07', NULL),
(175, 71, 5, 85, 53.20, 53200, 0, '24/7/2024', '2024-09-23 13:44:49', NULL),
(176, 71, 5, 79, 45.45, 68175, 0, '24/7/2024', '2024-09-23 13:45:09', NULL),
(177, 71, 5, 86, 34.60, 27680, 0, '24/7/2024', '2024-09-23 13:45:28', NULL),
(178, 71, 5, 80, 18.30, 29280, 0, '24/7/2024', '2024-09-23 13:45:51', NULL),
(179, 71, 5, 80, 19.20, 30720, 0, '05/8/2024', '2024-09-23 13:46:20', NULL),
(181, 71, 5, 90, 3.00, 9600, 0, '05/8/2024', '2024-09-23 13:48:36', NULL),
(182, 71, 5, 6, 4.75, 23750, 0, '05/8/2024', '2024-09-23 13:49:01', NULL),
(183, 71, 5, 87, 0.15, 420, 0, '05/8/2024', '2024-09-23 13:49:22', NULL),
(185, 79, 5, 6, 5.05, 22220, 0, '13/5/2024', '2024-09-23 13:52:38', NULL),
(186, 79, 5, 80, 6.85, 10960, 0, '03/6/2024', '2024-09-23 13:53:09', NULL),
(187, 79, 5, 6, 5.50, 25300, 0, '08/6/2024', '2024-09-23 13:54:08', NULL),
(188, 79, 5, 80, 5.00, 8000, 0, '01/7/2024', '2024-09-23 13:54:40', NULL),
(189, 79, 5, 90, 4.00, 12800, 0, '11/7/2024', '2024-09-23 13:55:07', NULL),
(190, 79, 5, 80, 5.65, 9040, 0, '03/8/2024', '2024-09-23 13:56:03', NULL),
(191, 79, 5, 6, 1.10, 5500, 0, '03/8/2024', '2024-09-23 13:56:22', NULL),
(192, 79, 5, 87, 1.05, 2940, 0, '03/8/2024', '2024-09-23 13:56:50', NULL),
(193, 79, 5, 6, 2.00, 10000, 0, '13/8/2024', '2024-09-23 13:57:19', NULL),
(194, 79, 5, 80, 10.00, 16000, 0, '10/9/2024', '2024-09-23 13:58:03', '2024-09-23 16:39:01'),
(202, 70, 5, 6, 5.20, 26000, 0, '27/6/2024', '2024-09-26 11:19:18', NULL),
(203, 50, 5, 6, 3.70, 18500, 0, '27/6/2024', '2024-09-26 11:23:31', NULL),
(204, 50, 5, 6, 3.60, 18000, 0, '15/6/2024', '2024-09-26 11:24:08', NULL),
(205, 50, 5, 87, 0.45, 1260, 0, '15/6/2024', '2024-09-26 11:24:26', NULL),
(206, 50, 5, 98, 3.25, 3250, 0, '25/7/2024', '2024-09-26 11:25:15', NULL),
(207, 50, 5, 6, 1.65, 8250, 0, '25/7/2024', '2024-09-26 11:25:37', NULL),
(208, 50, 5, 87, 1.20, 3360, 0, '24/82024', '2024-09-26 11:26:59', NULL),
(209, 50, 5, 6, 4.00, 20000, 0, '24/8/2024', '2024-09-26 11:27:23', NULL),
(210, 50, 5, 6, 3.90, 19500, 0, '11/7/2024', '2024-09-26 11:28:52', NULL),
(211, 50, 5, 6, 3.05, 13420, 0, '14/5/2024', '2024-09-26 11:33:01', NULL),
(212, 50, 5, 87, 0.30, 840, 0, '14/5/2024', '2024-09-26 11:34:22', NULL),
(213, 50, 5, 6, 3.30, 14520, 0, '20/5/2024', '2024-09-26 11:37:42', NULL),
(214, 50, 5, 87, 0.30, 840, 0, '20/5/2024', '2024-09-26 11:38:21', NULL),
(216, 74, 5, 87, 0.45, 1260, 0, '04/7/2024', '2024-09-26 11:42:17', NULL),
(217, 74, 5, 80, 3.40, 5440, 0, '04/7/2024', '2024-09-26 11:42:42', NULL),
(218, 74, 5, 87, 2.45, 6860, 0, '05/7/2024', '2024-09-26 11:43:04', NULL),
(219, 74, 5, 98, 1.00, 1000, 0, '12/7/2024', '2024-09-26 11:43:41', NULL),
(221, 74, 5, 87, 0.35, 980, 0, '12/7/2024', '2024-09-26 11:44:19', NULL),
(222, 74, 5, 80, 5.80, 9280, 0, '12/7/2024', '2024-09-26 11:44:46', NULL),
(223, 74, 5, 79, 12.35, 18525, 0, '12/7/2024', '2024-09-26 11:45:15', NULL),
(224, 74, 5, 79, 3.75, 5625, 0, '01/8/2024', '2024-09-26 11:45:54', NULL),
(225, 74, 5, 90, 0.75, 2400, 0, '01/8/2024', '2024-09-26 11:46:23', NULL),
(226, 74, 5, 87, 0.80, 2240, 0, '01/8/2024', '2024-09-26 11:46:44', NULL),
(227, 74, 5, 80, 8.15, 13040, 0, '01/8/2024', '2024-09-26 11:47:50', NULL),
(229, 74, 5, 6, 4.35, 21750, 0, '24/8/20024', '2024-09-26 13:21:22', NULL),
(230, 74, 5, 6, 9.45, 47250, 0, '01/8/2024', '2024-09-26 13:21:52', NULL),
(231, 74, 5, 6, 3.45, 17250, 0, '12/7/2024', '2024-09-26 13:22:29', '2024-09-26 13:23:21'),
(232, 74, 5, 6, 5.15, 25750, 0, '04/7/2024', '2024-09-26 13:23:06', NULL),
(233, 74, 5, 87, 0.55, 1540, 0, '24/8/2024', '2024-09-26 13:27:50', NULL),
(234, 74, 5, 80, 3.10, 4960, 0, '24/8/2024', '2024-09-26 13:28:11', NULL),
(235, 74, 5, 79, 7.35, 11025, 0, '24/8/2024', '2024-09-26 13:28:37', NULL),
(236, 83, 26, 61, 10.00, 10000, 0, 'Septemver', '2024-09-26 14:11:57', NULL),
(237, 83, 26, 62, 2.00, 2200, 0, 'September', '2024-09-26 14:29:45', NULL),
(238, 82, 5, 6, 6.80, 34000, 0, '27/6/2024', '2024-09-26 14:41:30', NULL),
(239, 82, 5, 6, 4.05, 20250, 0, '27/7/2024', '2024-09-26 14:41:58', NULL),
(240, 84, 26, 61, 1.39, 1390, 0, 'Agustus24', '2024-09-26 14:42:01', NULL),
(241, 84, 26, 60, 4.21, 4631, 0, 'Agustus24', '2024-09-26 14:45:17', NULL),
(242, 73, 5, 80, 9.45, 15120, 0, '13/9/2024', '2024-09-26 15:34:34', NULL),
(243, 73, 5, 6, 4.10, 20500, 0, '13/9/2024', '2024-09-26 15:34:58', NULL),
(244, 73, 5, 80, 13.20, 21120, 0, '24/8/2024', '2024-09-26 15:35:38', NULL),
(245, 73, 5, 6, 10.25, 51250, 0, '24/8/2024', '2024-09-26 15:36:25', NULL),
(246, 73, 5, 87, 2.75, 7700, 0, '24/8/2024', '2024-09-26 15:37:16', NULL),
(247, 73, 5, 88, 0.70, 10500, 0, '24/8/2024', '2024-09-26 15:37:44', NULL),
(248, 73, 5, 6, 8.60, 43000, 0, '12/8/2024', '2024-09-26 15:38:34', NULL),
(249, 73, 5, 80, 16.00, 25600, 0, '12/8/2024', '2024-09-26 15:39:21', NULL),
(250, 73, 5, 6, 2.05, 10250, 0, '27/7/2024', '2024-09-26 15:39:51', '2024-09-26 15:40:34'),
(252, 73, 5, 80, 9.65, 15440, 0, '20/7/2024', '2024-09-29 13:58:55', NULL),
(253, 73, 5, 6, 6.15, 30750, 0, '20/7/2024', '2024-09-29 13:59:11', NULL),
(254, 73, 5, 79, 8.05, 12075, 0, '05/7/2024', '2024-09-29 13:59:49', NULL),
(255, 73, 5, 80, 7.35, 11760, 0, '05/7/2024', '2024-09-29 14:00:40', NULL),
(256, 73, 5, 6, 5.45, 27250, 0, '05/7/2024', '2024-09-29 14:01:07', NULL),
(257, 73, 5, 80, 8.05, 12880, 0, '19/6/2024', '2024-09-29 14:01:54', NULL),
(258, 73, 5, 6, 5.25, 26250, 0, '19/6/2024', '2024-09-29 14:02:33', NULL),
(259, 73, 5, 6, 4.15, 20750, 0, '25/6/2024', '2024-09-29 14:03:12', NULL),
(260, 73, 5, 80, 17.30, 27680, 0, '07/6/2024', '2024-09-29 14:03:58', NULL),
(262, 73, 5, 79, 4.00, 6000, 0, '07/6/2024', '2024-09-29 14:04:40', NULL),
(264, 73, 5, 80, 11.55, 18480, 0, '29/5/2024', '2024-09-29 14:05:47', NULL),
(265, 73, 5, 87, 1.20, 3360, 0, '29/5/2024', '2024-09-29 14:06:13', NULL),
(266, 73, 5, 80, 21.75, 34800, 0, '07/5/2024', '2024-09-29 14:07:27', NULL),
(268, 73, 5, 79, 1.90, 2850, 0, '07/5/2024', '2024-09-29 14:08:09', NULL),
(269, 73, 5, 105, 1.80, 1800, 0, '07/5/2024', '2024-09-29 14:10:48', NULL),
(270, 86, 5, 80, 34.25, 54800, 0, '03/9/2024', '2024-09-29 14:12:15', NULL),
(271, 86, 5, 86, 17.70, 17700, 0, '03/9/2024', '2024-09-29 14:13:23', NULL),
(273, 86, 5, 80, 50.65, 81040, 0, '27/6/2024', '2024-09-29 14:18:35', NULL),
(274, 86, 5, 6, 7.45, 37250, 0, '27/6/2024', '2024-09-29 14:18:57', NULL),
(275, 86, 5, 98, 6.00, 6000, 0, '27/6/2024', '2024-09-29 14:19:15', NULL),
(276, 86, 5, 87, 1.20, 3360, 0, '27/6/2024', '2024-09-29 14:19:34', NULL),
(277, 86, 5, 90, 0.80, 2560, 0, '27/6/2024', '2024-09-29 14:19:52', NULL),
(278, 86, 5, 6, 7.60, 34960, 0, '28/5/2024', '2024-09-29 14:21:25', NULL),
(279, 89, 5, 86, 13.80, 13800, 0, '12/7/2024', '2024-09-29 14:33:06', '2024-09-29 14:36:27'),
(280, 89, 5, 79, 17.00, 25500, 0, '12/7/2024', '2024-09-29 14:33:29', '2024-09-29 14:36:19'),
(285, 91, 5, 79, 104.15, 156225, 0, '20/6/2024', '2024-09-29 14:39:40', NULL),
(286, 91, 5, 86, 58.60, 58600, 0, '20/6/2024', '2024-09-29 14:39:59', NULL),
(287, 91, 5, 100, 17.10, 9576, 855, '20/6/2024', '2024-09-29 14:40:24', NULL),
(288, 90, 5, 6, 14.60, 67160, 0, '09/6/2024', '2024-09-29 14:42:55', NULL),
(289, 90, 5, 87, 1.65, 4620, 0, '09/6/2024', '2024-09-29 14:43:15', NULL),
(290, 90, 5, 88, 0.55, 8250, 0, '09/6/2024', '2024-09-29 14:43:35', NULL),
(291, 90, 5, 100, 21.00, 11760, 1050, '09/6/2024', '2024-09-29 14:44:11', NULL),
(293, 90, 5, 6, 19.75, 86900, 0, '24/5/2024', '2024-09-29 14:47:10', NULL),
(294, 90, 5, 6, 13.85, 69250, 0, '21/7/2024', '2024-09-29 14:49:15', NULL),
(295, 88, 5, 88, 7.05, 105750, 0, '18/7/2024', '2024-09-29 14:56:52', NULL),
(296, 88, 5, 6, 2.10, 10500, 0, '18/7/2024', '2024-09-29 14:57:09', NULL),
(298, 88, 5, 93, 3.25, 3250, 0, '18/7/2024', '2024-09-29 14:58:58', NULL),
(299, 88, 5, 79, 12.20, 18300, 0, '18/7/2024', '2024-09-29 14:59:16', NULL),
(300, 88, 5, 80, 15.10, 24160, 0, '18/7/2024', '2024-09-29 14:59:34', NULL),
(301, 88, 5, 6, 4.60, 23000, 0, '18/7/2024', '2024-09-29 14:59:49', NULL),
(302, 88, 5, 6, 9.15, 45750, 0, '24/7/2024', '2024-09-29 15:01:17', NULL),
(303, 88, 5, 87, 0.50, 1400, 0, '24/7/2024', '2024-09-29 15:01:35', NULL),
(304, 88, 5, 93, 0.65, 520, 0, '24/7/2024', '2024-09-29 15:02:21', NULL),
(305, 88, 5, 80, 14.00, 22400, 0, '24/7/2024', '2024-09-29 15:02:37', NULL),
(306, 88, 5, 80, 81.30, 130080, 0, '20/6/2024', '2024-09-29 15:03:44', NULL),
(307, 88, 5, 6, 8.10, 40500, 0, '20/6/2024', '2024-09-29 15:04:02', NULL),
(308, 88, 5, 87, 1.00, 2800, 0, '20/6/2024', '2024-09-29 15:04:21', NULL),
(309, 88, 5, 79, 6.15, 9225, 0, '20/6/2024', '2024-09-29 15:04:44', NULL),
(310, 88, 5, 89, 0.95, 1520, 0, '13/5/2024', '2024-09-29 15:06:18', NULL),
(311, 88, 5, 87, 0.50, 1400, 0, '13/5/2024', '2024-09-29 15:06:48', NULL),
(312, 88, 5, 90, 4.00, 12800, 0, '13/5/2024', '2024-09-29 15:07:06', NULL),
(313, 88, 5, 6, 10.25, 45100, 0, '13/5/2024', '2024-09-29 15:07:32', NULL),
(314, 88, 5, 79, 3.15, 4725, 0, '13/5/2024', '2024-09-29 15:07:47', NULL),
(315, 88, 5, 100, 28.95, 16212, 0, '13/5/2024', '2024-09-29 15:08:05', NULL),
(316, 88, 5, 80, 10.70, 17120, 0, '04/5/2024', '2024-09-29 15:08:54', NULL),
(318, 88, 5, 6, 17.05, 75020, 0, '04/5/2024', '2024-09-29 15:09:48', NULL),
(319, 88, 5, 87, 1.02, 2870, 0, '04/5/2024', '2024-09-29 15:10:11', NULL),
(320, 88, 5, 6, 25.95, 119370, 0, '25/5/2024', '2024-09-29 15:11:10', NULL),
(321, 88, 5, 87, 1.70, 4760, 0, '25/5/2024', '2024-09-29 15:11:27', NULL),
(332, 93, 5, 97, 14.00, 53200, 0, '06/8/2024', '2024-09-29 15:41:50', NULL),
(333, 93, 5, 6, 12.25, 61250, 0, '15/6/2024', '2024-09-29 15:43:50', NULL),
(334, 93, 5, 97, 9.25, 32375, 0, '15/6/2024', '2024-09-29 15:44:07', NULL),
(335, 93, 5, 80, 15.85, 26945, 0, '15/6/2024', '2024-09-29 15:44:37', NULL),
(336, 93, 5, 90, 2.55, 8160, 0, '15/6/2024', '2024-09-29 15:44:53', NULL),
(337, 93, 5, 98, 10.35, 10350, 0, '15/6/2024', '2024-09-29 15:45:13', NULL),
(338, 93, 5, 89, 1.00, 1600, 0, '15/6/2024', '2024-09-29 15:45:29', NULL),
(339, 93, 5, 87, 1.05, 2940, 0, '15/6/2024', '2024-09-29 15:45:48', NULL),
(340, 94, 5, 6, 6.15, 30750, 0, '17/9/2024', '2024-09-29 15:48:35', NULL),
(341, 94, 5, 87, 3.10, 8680, 0, '17/9/2024', '2024-09-29 15:48:56', NULL),
(342, 94, 5, 6, 14.30, 71500, 0, '14/9/2024', '2024-09-29 15:49:32', NULL),
(343, 94, 5, 80, 19.25, 30800, 0, '14/9/2024', '2024-09-29 15:50:31', NULL),
(344, 94, 5, 6, 18.50, 92500, 0, '13/9/2024', '2024-09-29 15:51:03', NULL),
(345, 94, 5, 6, 20.00, 100000, 0, '12/9/2024', '2024-09-29 15:51:23', '2024-09-29 15:51:59'),
(346, 94, 5, 87, 4.70, 13160, 0, '12/9/2024', '2024-09-29 15:51:40', '2024-09-29 15:52:06'),
(347, 94, 5, 6, 14.40, 72000, 0, '10/9/2024', '2024-09-29 15:53:19', NULL),
(348, 94, 5, 6, 14.75, 73750, 0, '09/9/2024', '2024-09-29 15:53:38', NULL),
(349, 94, 5, 6, 7.70, 38500, 0, '07/9/2024', '2024-09-29 15:53:58', NULL),
(350, 94, 5, 6, 9.25, 46250, 0, '06/9/2024', '2024-09-29 15:54:35', NULL),
(351, 94, 5, 80, 8.25, 13200, 0, '06/9/2024', '2024-09-29 15:54:53', NULL),
(352, 94, 5, 6, 6.50, 32500, 0, '03/9/2024', '2024-09-29 15:55:23', NULL),
(353, 94, 5, 92, 4.10, 10660, 0, '03/9/2024', '2024-09-29 15:56:24', NULL),
(354, 94, 5, 87, 1.50, 4200, 0, '03/9/2024', '2024-09-29 15:56:39', NULL),
(355, 94, 5, 6, 7.55, 37750, 0, '31/8/2024', '2024-09-29 15:57:20', NULL),
(356, 94, 5, 80, 9.05, 14480, 0, '31/8/2024', '2024-09-29 15:57:36', NULL),
(357, 94, 5, 6, 20.10, 100500, 0, '30/8/2024', '2024-09-29 15:58:05', NULL),
(358, 94, 5, 80, 13.25, 21200, 0, '30/8/20241', '2024-09-29 15:59:05', NULL),
(359, 94, 5, 92, 3.85, 10010, 0, '30/8/2024', '2024-09-29 15:59:20', NULL),
(360, 94, 5, 87, 2.40, 6720, 0, '30/8/2024', '2024-09-29 15:59:38', NULL),
(361, 94, 5, 6, 8.25, 41250, 0, '27/8/2024', '2024-09-29 16:00:34', NULL),
(362, 94, 5, 6, 6.10, 30500, 0, '26/8/2024', '2024-09-29 16:02:08', NULL),
(363, 94, 5, 80, 9.30, 14880, 0, '26/8/2024', '2024-09-29 16:02:24', NULL),
(364, 94, 5, 87, 3.35, 9380, 0, '24/8/2024', '2024-09-29 16:02:54', NULL),
(365, 94, 5, 80, 8.90, 14240, 0, '24/8/2024', '2024-09-29 16:03:11', NULL),
(366, 94, 5, 6, 10.90, 54500, 0, '24/8/2024', '2024-09-29 16:03:29', NULL),
(367, 94, 5, 6, 7.50, 37500, 0, '22/8/2024', '2024-09-29 16:03:57', NULL),
(368, 94, 5, 6, 6.85, 34250, 0, '21/8/2024', '2024-09-29 16:04:18', NULL),
(369, 94, 5, 6, 6.00, 30000, 0, '20/8/2024', '2024-09-29 16:04:44', NULL),
(370, 94, 5, 6, 9.00, 45000, 0, '16/8/2024', '2024-09-29 16:05:33', NULL),
(371, 94, 5, 80, 8.25, 13200, 0, '16/8/2024', '2024-09-29 16:05:52', NULL),
(372, 94, 5, 6, 6.30, 31500, 0, '14/8/2024', '2024-09-29 16:06:12', NULL),
(373, 94, 5, 87, 2.10, 5880, 0, '14/8/2024', '2024-09-29 16:06:27', NULL),
(374, 94, 5, 6, 6.35, 31750, 0, '13/8/2024', '2024-09-29 16:06:58', NULL),
(375, 94, 5, 6, 6.00, 30000, 0, '12/8/2024', '2024-09-29 16:07:14', NULL),
(376, 94, 5, 6, 7.90, 39500, 0, '10/8/2024', '2024-09-29 16:07:39', NULL),
(377, 94, 5, 6, 8.75, 43750, 0, '09/8/2024', '2024-09-29 16:08:31', NULL),
(378, 94, 5, 87, 2.05, 5740, 0, '09/8/2024', '2024-09-29 16:08:50', NULL),
(379, 94, 5, 6, 9.75, 48750, 0, '06/8/2024', '2024-09-29 16:09:19', NULL),
(380, 94, 5, 6, 5.90, 29500, 0, '05/8/2024', '2024-09-29 16:09:56', NULL),
(381, 94, 5, 80, 4.75, 7600, 0, '05/8/2024', '2024-09-29 16:10:15', NULL),
(382, 94, 5, 6, 9.10, 45500, 0, '03/8/2024', '2024-09-29 16:10:50', NULL),
(383, 94, 5, 80, 9.00, 14400, 0, '03/8/2024', '2024-09-29 16:11:13', NULL),
(384, 94, 5, 87, 1.90, 5320, 0, '03/8/2024', '2024-09-29 16:11:25', NULL),
(385, 94, 5, 6, 13.75, 68750, 0, '02/8/2024', '2024-09-29 16:11:54', NULL),
(386, 94, 5, 80, 21.70, 34720, 0, '31/7/2024', '2024-09-29 16:12:18', NULL),
(387, 94, 5, 6, 17.30, 86500, 0, '31/7/2024', '2024-09-29 16:12:33', NULL),
(388, 94, 5, 87, 1.35, 3780, 0, '31/7/2024', '2024-09-29 16:12:54', NULL),
(389, 94, 5, 6, 11.80, 59000, 0, '29/7/2024', '2024-09-29 16:13:24', NULL),
(390, 94, 5, 87, 2.00, 5600, 0, '29/7/2024', '2024-09-29 16:13:38', NULL),
(391, 94, 5, 89, 5.25, 8400, 0, '29/7/2024', '2024-09-29 16:13:58', NULL),
(392, 94, 5, 6, 6.30, 31500, 0, '27/7/2024', '2024-09-29 16:14:28', NULL),
(393, 94, 5, 80, 9.25, 14800, 0, '26/7/2024', '2024-09-29 16:14:52', NULL),
(394, 94, 5, 6, 13.70, 68500, 0, '24/7/2024', '2024-09-29 16:15:52', NULL),
(395, 94, 5, 87, 1.15, 3220, 0, '24/7/2024', '2024-09-29 16:16:07', NULL),
(396, 94, 5, 6, 6.70, 33500, 0, '23/7/2024', '2024-09-29 16:16:31', NULL),
(397, 94, 5, 6, 16.00, 80000, 0, '22/7/2024', '2024-09-29 16:17:04', NULL),
(398, 94, 5, 87, 1.55, 4340, 0, '22/7/2024', '2024-09-29 16:17:20', NULL),
(399, 94, 5, 6, 9.75, 48750, 0, '19/7/2024', '2024-09-29 16:17:41', NULL),
(400, 94, 5, 87, 2.05, 5740, 0, '19/7/2024', '2024-09-29 16:18:37', NULL),
(401, 94, 5, 6, 6.00, 30000, 0, '18/7/2024', '2024-09-29 16:19:09', NULL),
(402, 94, 5, 80, 7.20, 11520, 0, '18/7/2024', '2024-09-29 16:19:29', NULL),
(403, 94, 5, 6, 6.80, 34000, 0, '17/7/2024', '2024-09-29 16:20:11', NULL),
(404, 94, 5, 87, 2.45, 6860, 0, '16/7/2024', '2024-09-29 16:20:41', NULL),
(405, 94, 5, 80, 6.35, 10160, 0, '16/7/2024', '2024-09-29 16:21:00', NULL),
(406, 94, 5, 6, 17.50, 87500, 0, '16/7/2024', '2024-09-29 16:21:16', NULL),
(407, 94, 5, 6, 7.20, 36000, 0, '11/7/2024', '2024-09-29 16:21:44', NULL),
(408, 94, 5, 6, 5.00, 25000, 0, '10/7/2024', '2024-09-29 16:22:18', NULL),
(409, 94, 5, 80, 7.60, 12160, 0, '10/7/2024', '2024-09-29 16:22:42', NULL),
(410, 94, 5, 6, 6.40, 32000, 0, '09/7/2024', '2024-09-29 16:23:10', NULL),
(411, 94, 5, 87, 1.50, 4200, 0, '09/7/2024', '2024-09-29 16:23:34', NULL),
(412, 94, 5, 6, 8.85, 44250, 0, '08/7/2024', '2024-09-29 16:24:16', NULL),
(414, 94, 5, 6, 7.55, 34730, 0, '05/6/2024', '2024-09-29 16:27:22', NULL),
(415, 94, 5, 87, 0.60, 1680, 0, '05/6/2024', '2024-09-29 16:27:48', NULL),
(416, 94, 5, 88, 0.25, 3750, 0, '05/6/2024', '2024-09-29 16:28:05', NULL),
(417, 94, 5, 81, 1.90, 6650, 0, '05/6/2024', '2024-09-29 16:28:51', NULL),
(418, 94, 5, 83, 11.05, 22100, 0, '04/6/2024', '2024-09-29 16:29:37', NULL),
(419, 94, 5, 83, 6.00, 12000, 0, '21/5/2024', '2024-09-29 16:30:01', NULL),
(420, 94, 5, 80, 10.30, 16480, 0, '10/8/2024', '2024-09-29 16:32:48', NULL),
(421, 95, 5, 6, 5.75, 28750, 0, '27/7/2024', '2024-09-29 16:34:37', NULL),
(422, 68, 5, 80, 14.50, 23200, 0, '07/9/2024', '2024-09-29 16:59:28', NULL),
(423, 68, 5, 6, 5.50, 27500, 0, '07/9/2024', '2024-09-29 16:59:49', NULL),
(424, 68, 5, 82, 3.10, 7440, 0, '07/9/2024', '2024-09-29 17:00:03', NULL),
(425, 68, 5, 98, 1.00, 1000, 0, '07/9/2024', '2024-09-29 17:00:16', NULL),
(426, 68, 5, 87, 2.55, 7140, 0, '07/9/2024', '2024-09-29 17:00:30', NULL),
(427, 68, 5, 88, 0.65, 9750, 0, '07/9/2024', '2024-09-29 17:00:55', NULL),
(428, 68, 5, 95, 1.30, 4290, 0, '07/9/2024', '2024-09-29 17:01:13', NULL),
(430, 68, 5, 7, 0.50, 3250, 0, '07/9/2024', '2024-09-29 17:02:19', NULL),
(431, 68, 5, 98, 2.85, 2850, 0, '27/8/2024', '2024-09-29 17:02:50', NULL),
(432, 68, 5, 80, 11.45, 18320, 0, '27/8/2024', '2024-09-29 17:03:06', NULL),
(433, 68, 5, 85, 4.05, 4050, 0, '27/8/2024', '2024-09-29 17:03:20', NULL),
(434, 68, 5, 6, 8.20, 41000, 0, '27/8/2024', '2024-09-29 17:03:36', NULL),
(435, 68, 5, 80, 9.90, 15840, 0, '12/8/2024', '2024-09-29 17:04:11', NULL),
(436, 68, 5, 6, 7.80, 39000, 0, '12/8/2024', '2024-09-29 17:04:24', NULL),
(437, 68, 5, 82, 1.60, 3840, 0, '12/8/2024', '2024-09-29 17:04:42', NULL),
(439, 68, 5, 80, 2.35, 3760, 0, '02/8/2024', '2024-09-29 17:05:24', NULL),
(440, 68, 5, 6, 4.55, 22750, 0, '02/8/2024', '2024-09-29 17:05:37', NULL),
(441, 68, 5, 98, 2.10, 2100, 0, '02/8/2024', '2024-09-29 17:05:51', NULL),
(442, 68, 5, 98, 3.50, 3500, 0, '27/7/2024', '2024-09-29 17:06:35', NULL),
(443, 68, 5, 6, 3.45, 17250, 0, '27/7/2024', '2024-09-29 17:06:47', NULL),
(444, 68, 5, 7, 1.15, 7475, 0, '27/7/2024', '2024-09-29 17:07:05', NULL),
(445, 68, 5, 87, 1.50, 4200, 0, '27/7/2024', '2024-09-29 17:07:16', NULL),
(446, 68, 5, 80, 3.95, 6320, 0, '27/7/2024', '2024-09-29 17:07:30', NULL),
(447, 68, 5, 88, 0.55, 8250, 0, '27/7/2024', '2024-09-29 17:07:47', NULL),
(448, 68, 5, 6, 7.35, 36750, 0, '17/7/2024', '2024-09-29 17:08:20', NULL),
(449, 68, 5, 98, 4.35, 4350, 0, '17/7/2024', '2024-09-29 17:08:38', NULL),
(450, 68, 5, 80, 9.25, 14800, 0, '17/7/2024', '2024-09-29 17:08:54', NULL),
(451, 68, 5, 80, 11.55, 18480, 0, '05/7/2024', '2024-09-29 17:12:24', NULL),
(452, 68, 5, 6, 3.35, 16750, 0, '05/7/2024', '2024-09-29 17:12:38', NULL),
(453, 68, 5, 90, 2.55, 8160, 0, '05/7/2024', '2024-09-29 17:12:55', NULL),
(454, 68, 5, 98, 1.75, 1750, 0, '05/7/2024', '2024-09-29 17:13:07', NULL),
(455, 68, 5, 80, 7.35, 11760, 0, '27/6/2024', '2024-09-29 17:13:48', NULL),
(456, 68, 5, 87, 1.75, 4900, 0, '27/6/2024', '2024-09-29 17:14:02', NULL),
(457, 68, 5, 6, 3.85, 19250, 0, '27/6/2024', '2024-09-29 17:14:18', NULL),
(458, 68, 5, 90, 1.35, 4320, 0, '27/6/2024', '2024-09-29 17:14:52', NULL),
(459, 68, 5, 98, 1.25, 1250, 0, '27/6/2024', '2024-09-29 17:15:06', NULL),
(460, 68, 5, 99, 1.15, 644, 0, '27/6/2024', '2024-09-29 17:15:43', NULL),
(461, 68, 5, 98, 5.00, 5000, 0, '21/6/2024', '2024-09-29 17:16:12', NULL),
(462, 68, 5, 6, 3.50, 17500, 0, '21/6/2024', '2024-09-29 17:16:28', NULL),
(463, 68, 5, 80, 14.60, 23360, 0, '21/6/2024', '2024-09-29 17:16:50', NULL),
(464, 68, 5, 80, 18.85, 30160, 0, '12/6/2024', '2024-09-29 17:17:39', NULL),
(465, 68, 5, 79, 10.80, 16200, 0, '12/6/2024', '2024-09-29 17:17:55', NULL),
(466, 68, 5, 6, 2.85, 14250, 0, '12/6/2024', '2024-09-29 17:18:10', NULL),
(467, 68, 5, 100, 1.00, 560, 0, '12/6/2024', '2024-09-29 17:18:24', NULL),
(468, 68, 5, 79, 1.65, 2475, 0, '03/6/2024', '2024-09-29 17:19:14', NULL),
(469, 68, 5, 80, 8.35, 13360, 0, '03/6/2024', '2024-09-29 17:19:29', NULL),
(471, 68, 5, 98, 1.40, 1400, 0, '03/6/2024', '2024-09-29 17:20:11', NULL),
(472, 68, 5, 6, 7.05, 32430, 0, '03/6/2024', '2024-09-29 17:21:13', NULL),
(473, 68, 5, 81, 0.15, 525, 0, '27/5/2024', '2024-09-29 17:22:01', NULL),
(474, 68, 5, 6, 0.65, 2990, 0, '27/5/2024', '2024-09-29 17:22:17', NULL),
(475, 68, 5, 88, 0.25, 3750, 0, '27/5/2024', '2024-09-29 17:22:34', NULL),
(476, 68, 5, 92, 0.20, 520, 0, '27/5/2024', '2024-09-29 17:22:49', NULL),
(478, 68, 5, 7, 0.35, 2275, 0, '27/5/2024', '2024-09-29 17:23:16', NULL),
(479, 68, 5, 80, 7.20, 11520, 0, '27/5/2024', '2024-09-29 17:23:32', NULL),
(480, 68, 5, 79, 2.50, 3750, 0, '27/5/2024', '2024-09-29 17:23:49', NULL),
(481, 68, 5, 80, 11.65, 18640, 0, '21/5/2024', '2024-09-29 17:24:48', NULL),
(482, 68, 5, 6, 6.25, 27500, 0, '27/5/2024', '2024-09-29 17:25:03', NULL),
(483, 68, 5, 81, 0.65, 2275, 0, '21/5/2024', '2024-09-29 17:25:27', NULL),
(484, 68, 5, 98, 1.05, 1050, 0, '21/5/2024', '2024-09-29 17:25:52', NULL),
(485, 68, 5, 6, 2.90, 12760, 0, '13/5/2024', '2024-09-29 17:26:21', NULL),
(486, 68, 5, 80, 2.45, 3920, 0, '13/5/2024', '2024-09-29 17:26:35', NULL),
(487, 68, 5, 97, 3.80, 13680, 0, '07/9/2024', '2024-09-29 17:38:24', NULL),
(488, 68, 5, 95, 1.30, 4290, 0, '12/8/2024', '2024-09-29 17:38:59', NULL),
(489, 88, 5, 86, 40.10, 32080, 0, '04/5/2024', '2024-09-29 17:49:29', NULL),
(490, 96, 5, 79, 25.00, 37500, 0, '09/6/2024', '2024-09-29 17:53:08', NULL),
(491, 96, 5, 6, 20.00, 100000, 0, '30/6/2024', '2024-09-29 17:54:10', NULL),
(492, 96, 5, 6, 10.00, 50000, 0, '21/7/2024', '2024-09-29 17:54:40', NULL),
(493, 96, 5, 79, 15.00, 22500, 0, '12/8/2024', '2024-09-29 17:55:05', NULL),
(494, 96, 5, 6, 4.80, 24000, 0, '16/9/2024', '2024-09-29 17:55:33', NULL),
(495, 71, 5, 86, 17.80, 17800, 0, '05/8/2024', '2024-09-29 18:22:11', NULL),
(496, 71, 5, 86, 2.95, 2950, 0, '11/7/2024', '2024-09-29 18:24:24', NULL),
(497, 69, 5, 100, 3.65, 2044, 0, '12/6/2024', '2024-09-29 18:34:13', NULL),
(498, 65, 5, 6, 1.60, 8000, 0, '17/7/2024', '2024-09-29 18:40:44', NULL),
(499, 65, 5, 79, 10.15, 15225, 0, '17/7/2024', '2024-09-29 18:40:59', NULL),
(500, 67, 5, 86, 3.90, 3900, 0, '20/7/2024', '2024-09-29 18:46:21', NULL),
(501, 68, 5, 87, 1.25, 3500, 0, '27/5/2024', '2024-09-29 19:02:16', NULL),
(502, 73, 5, 6, 4.40, 20240, 0, '07/6/2024', '2024-09-29 19:11:00', NULL),
(503, 73, 5, 6, 3.60, 15840, 0, '07/5/2024', '2024-09-29 19:12:52', NULL),
(504, 73, 5, 6, 8.85, 40710, 0, '29/5/2024', '2024-09-29 19:15:22', NULL),
(505, 94, 5, 6, 7.85, 39250, 0, '18/9/2024', '2024-09-30 10:25:47', NULL),
(506, 86, 5, 90, 1.65, 5280, 0, '18/9/2024', '2024-09-30 10:26:21', NULL),
(507, 74, 5, 79, 16.05, 24075, 0, '18/9/2024', '2024-09-30 10:26:47', NULL),
(508, 74, 5, 6, 7.25, 36250, 0, '18/9/2024', '2024-09-30 10:27:07', NULL),
(509, 74, 5, 80, 4.00, 6400, 0, '18/9/2024', '2024-09-30 10:27:28', NULL),
(510, 65, 5, 79, 18.65, 27975, 0, '18/9/2024', '2024-09-30 10:28:11', NULL),
(511, 71, 5, 80, 63.30, 101280, 0, '18/9/2024', '2024-09-30 10:28:37', NULL),
(512, 71, 5, 79, 2.25, 3375, 0, '18/9/2024', '2024-09-30 10:28:59', NULL),
(513, 71, 5, 101, 3.90, 15600, 0, '18/9/2024', '2024-09-30 10:29:26', NULL),
(514, 71, 5, 6, 11.50, 57500, 0, '18/9/2024', '2024-09-30 10:29:47', NULL),
(515, 68, 5, 6, 5.85, 29250, 0, '19/9/2024', '2024-09-30 10:30:19', NULL),
(516, 68, 5, 80, 9.40, 15040, 0, '19/9/2024', '2024-09-30 10:30:54', NULL),
(517, 68, 5, 90, 1.25, 4000, 0, '19/9/2024', '2024-09-30 10:31:14', NULL),
(518, 72, 5, 87, 0.60, 1680, 0, '21/9/2024', '2024-09-30 10:32:05', NULL),
(519, 72, 5, 80, 10.80, 17280, 0, '21/9/2024', '2024-09-30 10:32:33', NULL),
(520, 72, 5, 6, 6.05, 30250, 0, '21/9/2024', '2024-09-30 10:32:58', NULL),
(521, 73, 5, 6, 6.65, 33250, 0, '21/9/2024', '2024-09-30 10:33:27', NULL),
(522, 67, 5, 6, 6.60, 33000, 0, '21/9/2024', '2024-09-30 10:33:52', NULL),
(523, 67, 5, 80, 4.75, 7600, 0, '21/9/2024', '2024-09-30 10:34:06', NULL),
(524, 67, 5, 79, 1.70, 2550, 0, '21/9/2024', '2024-09-30 10:34:28', NULL),
(525, 65, 5, 90, 2.50, 8000, 0, '26/9/2024', '2024-09-30 10:34:58', NULL),
(526, 65, 5, 6, 2.40, 12000, 0, '26/9/2024', '2024-09-30 10:35:22', NULL),
(527, 65, 5, 80, 12.40, 19840, 0, '26/9/2024', '2024-09-30 10:35:39', NULL),
(528, 73, 5, 6, 3.85, 19250, 0, '26/9/2024', '2024-09-30 10:36:07', NULL),
(529, 66, 5, 6, 3.30, 16500, 0, '26/9/2024', '2024-09-30 10:36:29', NULL),
(530, 66, 5, 81, 0.40, 1400, 0, '26/9/2024', '2024-09-30 10:36:52', NULL),
(531, 66, 5, 80, 5.35, 8560, 0, '26/9/2024', '2024-09-30 10:37:14', NULL),
(532, 68, 5, 6, 2.90, 14500, 0, '26/9/2024', '2024-09-30 10:37:35', NULL),
(533, 68, 5, 80, 4.70, 7520, 0, '26/9/2024', '2024-09-30 10:37:50', NULL),
(534, 74, 5, 6, 7.00, 35000, 0, '27/9/2024', '2024-09-30 10:38:10', NULL),
(535, 74, 5, 87, 1.35, 3780, 0, '27/9/2024', '2024-09-30 10:38:30', NULL),
(536, 74, 5, 88, 0.60, 9000, 0, '27/9/2024', '2024-09-30 10:38:46', NULL),
(537, 74, 5, 80, 3.00, 4800, 0, '27/9/2024', '2024-09-30 10:39:07', NULL),
(538, 74, 5, 79, 2.30, 3450, 0, '27/9/2024', '2024-09-30 10:39:28', NULL),
(539, 76, 5, 6, 10.05, 50250, 0, '27/9/2024', '2024-09-30 10:39:52', NULL),
(541, 76, 5, 87, 2.00, 5600, 0, '27/9/2024', '2024-09-30 10:40:39', NULL),
(542, 76, 5, 88, 0.70, 10500, 0, '27/9/2024', '2024-09-30 10:40:53', NULL),
(543, 76, 5, 80, 5.30, 8480, 0, '27/9/2024', '2024-09-30 10:41:09', NULL),
(544, 76, 5, 86, 8.25, 8250, 0, '27/9/2024', '2024-09-30 10:41:24', NULL),
(545, 98, 5, 6, 4.30, 21500, 0, '18/9/2024', '2024-09-30 10:48:15', NULL),
(546, 98, 5, 87, 0.20, 560, 0, '18/9/2024', '2024-09-30 10:48:33', NULL),
(547, 98, 5, 80, 5.20, 8320, 0, '18/9/2024', '2024-09-30 10:48:59', NULL),
(548, 68, 5, 82, 1.80, 4320, 0, '19/8/2024', '2024-09-30 10:49:21', NULL),
(549, 76, 5, 98, 1.85, 1480, 0, '27/9/2024', '2024-09-30 10:52:41', NULL),
(550, 97, 5, 83, 0.90, 1800, 0, '31/8/2024', '2024-09-30 11:18:25', NULL),
(551, 97, 5, 80, 5.25, 8400, 0, '31/8/2024', '2024-09-30 11:18:53', NULL),
(552, 97, 5, 98, 1.25, 1250, 0, '31/8/2024', '2024-09-30 11:19:45', NULL),
(553, 97, 5, 98, 6.55, 6550, 0, '01/10/2024', '2024-10-01 15:53:02', NULL),
(554, 65, 5, 6, 7.75, 38750, 0, '4/10/2024', '2024-10-04 14:23:53', NULL),
(555, 77, 5, 92, 0.90, 2340, 0, '4/10/2024', '2024-10-04 14:29:59', NULL),
(556, 77, 5, 80, 0.75, 1125, 0, '4/10/2024', '2024-10-04 14:30:39', NULL),
(557, 77, 5, 107, 0.60, 300, 0, '4/10/2024', '2024-10-04 14:33:25', NULL),
(558, 101, 5, 80, 1.00, 1500, 0, '05/10/2024', '2024-10-05 14:26:14', NULL),
(559, 68, 5, 6, 6.05, 30250, 0, '5/10/2024', '2024-10-05 14:35:44', NULL),
(560, 68, 5, 80, 7.25, 10875, 0, '5/10/2024', '2024-10-05 14:36:07', NULL),
(561, 68, 5, 100, 5.25, 2940, 0, '5/10/2024', '2024-10-05 14:36:31', NULL),
(562, 68, 5, 87, 1.80, 5040, 0, '5/10/2024', '2024-10-05 14:36:52', NULL),
(563, 68, 5, 7, 0.60, 3900, 0, '5/10/2024', '2024-10-05 14:37:14', NULL),
(564, 68, 5, 82, 2.00, 4800, 0, '5/10/2024', '2024-10-05 14:37:38', NULL),
(565, 68, 5, 98, 1.55, 1240, 0, '5/10/2024', '2024-10-05 14:38:01', NULL),
(566, 68, 5, 88, 1.00, 15000, 0, '5/10/2024', '2024-10-05 14:38:19', NULL),
(567, 77, 5, 83, 0.45, 900, 0, '14/10/2024', '2024-10-15 08:19:16', NULL),
(568, 104, 26, 61, 5.00, 33500, 125, 'Oktober 2024', '2024-10-22 14:37:34', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transactions_bsi`
--

CREATE TABLE `transactions_bsi` (
  `id` int(11) NOT NULL,
  `admin_id` int(10) UNSIGNED NOT NULL,
  `sampah_id` bigint(20) UNSIGNED DEFAULT NULL,
  `total_weight` float NOT NULL,
  `harga_per_kg` double DEFAULT NULL,
  `total_price` double DEFAULT NULL,
  `profit` double DEFAULT NULL,
  `periode` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transactions_bsi`
--

INSERT INTO `transactions_bsi` (`id`, `admin_id`, `sampah_id`, `total_weight`, `harga_per_kg`, `total_price`, `profit`, `periode`, `created_at`, `updated_at`) VALUES
(26, 5, 94, 10, 4000, 40000, 40000, 'september', '2024-09-24 21:08:58', '2024-09-24 21:08:58'),
(27, 5, 6, 30.3, 30000, 909000, 909000, '3', '2024-09-24 21:09:10', '2024-09-24 21:09:10'),
(28, 5, 99, 40, 15000, 600000, 600000, '3', '2024-09-24 21:09:57', '2024-09-24 21:09:57');

-- --------------------------------------------------------

--
-- Table structure for table `tukar_poins`
--

CREATE TABLE `tukar_poins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `admin_id` int(10) UNSIGNED DEFAULT NULL,
  `reward_id` bigint(20) UNSIGNED DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `total_price` int(11) NOT NULL,
  `bukti_foto` text DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tukar_saldo`
--

CREATE TABLE `tukar_saldo` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `admin_id` int(10) UNSIGNED DEFAULT NULL,
  `reward_id` bigint(20) UNSIGNED DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `total_price` int(11) NOT NULL,
  `bukti_foto` text DEFAULT NULL,
  `status` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tukar_saldo`
--

INSERT INTO `tukar_saldo` (`id`, `user_id`, `admin_id`, `reward_id`, `quantity`, `total_price`, `bukti_foto`, `status`, `created_at`, `updated_at`) VALUES
(23, 58, 5, 68, 1, 210000, NULL, 'Diterima', '2024-09-22 21:45:16', '2024-09-22 21:45:52'),
(24, 58, 5, 68, 1, 10000, NULL, 'Diterima', '2024-09-22 21:53:50', '2024-09-22 21:55:02'),
(34, 78, 5, 68, 1, 402500, 'uploads/5/2024-09/whatsapp_image_2024_09_22_at_203012.jpeg', 'Diterima', '2024-09-26 14:49:21', '2024-09-26 14:51:39'),
(35, 76, 5, 68, 1, 200000, NULL, 'Diterima', '2024-09-27 13:53:25', '2024-09-29 18:29:23'),
(36, 67, NULL, 68, 1, 200000, NULL, 'Pending', '2024-09-30 11:00:13', '2024-09-30 11:00:13'),
(37, 69, NULL, 68, 1, 90000, NULL, 'Pending', '2024-09-30 11:01:14', '2024-09-30 11:01:14'),
(38, 73, NULL, 68, 1, 400000, NULL, 'Pending', '2024-09-30 11:02:21', '2024-09-30 11:02:21'),
(39, 68, NULL, 68, 1, 600000, NULL, 'Pending', '2024-09-30 11:03:33', '2024-09-30 11:03:33'),
(40, 94, NULL, 68, 1, 2502500, NULL, 'Pending', '2024-09-30 11:05:38', '2024-09-30 11:05:38'),
(41, 65, NULL, 68, 1, 150000, NULL, 'Pending', '2024-09-30 11:07:03', '2024-09-30 11:07:03'),
(42, 86, NULL, 68, 1, 162500, NULL, 'Pending', '2024-09-30 11:09:58', '2024-09-30 11:09:58'),
(43, 82, NULL, 68, 1, 50000, NULL, 'Pending', '2024-09-30 11:10:50', '2024-09-30 11:10:50'),
(44, 71, NULL, 68, 1, 302500, NULL, 'Pending', '2024-09-30 11:11:42', '2024-09-30 11:11:42'),
(45, 93, NULL, 68, 1, 196820, NULL, 'Pending', '2024-09-30 11:12:39', '2024-09-30 11:12:39'),
(46, 91, NULL, 68, 1, 224401, NULL, 'Pending', '2024-09-30 11:13:30', '2024-09-30 11:13:30'),
(47, 88, NULL, 68, 1, 750000, NULL, 'Pending', '2024-09-30 11:14:43', '2024-09-30 11:14:43'),
(48, 67, NULL, 68, 1, 50000, NULL, 'Pending', '2024-10-02 14:47:26', '2024-10-02 14:47:26');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `cms_user_id` int(10) UNSIGNED NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `cms_user_id`, `address`, `phone_number`, `picture`, `email_verified_at`, `remember_token`, `created_at`, `updated_at`) VALUES
(36, 'Rengga', 'arenga@gmail.com', '$2y$10$2LO5SY6awxOXNSrdPsOPQuZULzrPTegfgp4uLwNNDU9FXC/pBBvfq', 5, 'Ciputat', '112233122', 'uploads/profile/1727101539_Screenshot 2023-12-01 142736.png', NULL, NULL, '2024-08-18 17:33:06', '2024-09-23 21:25:39'),
(38, 'suryapermadi', 'suryapermadi122@gmail.com', '$2y$10$SpgO06T20EroyfHjfpMKqORODPUscB4JGNqF/302oSzF2ThIQ6td6', 5, 'Ciputat', '112233122', NULL, NULL, NULL, '2024-08-18 18:24:58', '2024-08-20 22:54:58'),
(39, 'puji rahayu', 'puji@gmail.com', '$2y$10$gLhsUyuRZnX4WT8VuoVtVuIntebyufb5vr9qIAc4uFF7/LIZPWmcG', 5, 'Ciputat', '090822992', NULL, NULL, NULL, '2024-08-20 10:44:46', '2024-08-20 10:47:37'),
(40, 'ranaashr', 'ranaashari71@gmail.com', '$2y$10$AURqhr4hxeiXJsNOZprmR.Yb7AOqoiQNzEm461BUVXgrz64ssw4tK', 5, NULL, NULL, NULL, NULL, NULL, '2024-08-20 11:52:21', '2024-08-20 11:52:21'),
(41, 'shaanes', 'shaneslaviness@gmail.com', '$2y$10$U/pqZJnl1ZFQZY3CVuTUMubN3EM.GQ5Zzf0Jiqpjj70thgaM.8hzq', 5, NULL, NULL, NULL, NULL, NULL, '2024-08-20 11:52:33', '2024-08-20 11:52:33'),
(42, 'susanto', 'susanto@gmail.com', '$2y$10$h4kSDWnEeeqyGC3c3T/2vecZpcSVth8ipNiiKW7NUcRtXGKMVkcN.', 5, NULL, NULL, NULL, NULL, NULL, '2024-08-20 22:13:00', '2024-08-20 22:13:00'),
(44, 'RADIWAN', 'majujalan83@gmail.com', '$2y$10$L/llxOQ5NVP1uoExMMMGAekL.SeZDYd78Yv.onNxiHRNj1mmhtz.2', 5, 'Meruya Selatan', '087780347158', NULL, NULL, NULL, '2024-08-23 15:14:34', '2024-08-23 15:18:14'),
(45, 'Nenu', 'nenunurfitrianggini@gmail.com', '$2y$10$ioQxl5f0i0m.NnLYXSRuo.akMoa4AAue0SjvMk0gTXT3lWOG1MGHK', 5, NULL, NULL, NULL, NULL, NULL, '2024-08-23 15:16:02', '2024-08-23 15:16:02'),
(46, 'Sitikhadijah11', 'Sitiekhadijah11@gmail.com', '$2y$10$3z1YzUs7wBFh2l98mTkL4uKVzOAPuPpqaqnqFkWCHuc1/30GCK/5C', 5, NULL, NULL, NULL, NULL, NULL, '2024-08-23 15:18:36', '2024-08-23 15:18:36'),
(47, 'Rara', 'rararahma221@gmail.com', '$2y$10$raZ7vRkPXKIAA2aZ39VBN.CAd.CBb6Mm584rSml5/IIbYqh7VLC1S', 5, NULL, NULL, NULL, NULL, NULL, '2024-08-23 15:22:58', '2024-08-23 15:22:58'),
(48, 'cicakarmila', 'karmilacica@gmail.com', '$2y$10$7iMuSnou1fKPhhuFeUjEQ.dT3MJP1cYvuhrPO9ATtSowkO/ph7pOq', 5, NULL, NULL, NULL, NULL, NULL, '2024-08-23 15:26:21', '2024-08-23 15:26:21'),
(49, 'Atih Erawati', 'atiherawati143@gmail.com', '$2y$10$/83pPJ8IcMKXpqRvHfBkgeeKe42Y34RshHxuxC2/soRtR879qH9jW', 5, NULL, NULL, NULL, NULL, NULL, '2024-08-23 15:26:25', '2024-08-23 15:26:25'),
(50, 'ANNA Fitriana', 'ANNA12@gmail.com', '$2y$10$N8Psp7IdbQGrZVdJWtgxR.bBbTE42I9nwu0Rl8dsoNwYCcjJXsVhm', 5, 'Ciputat', '0895328357034', NULL, NULL, NULL, '2024-08-23 15:27:02', '2024-08-23 15:29:59'),
(51, 'Nurli Nurhayati', 'rumaishaaghnia@gmail.com', '$2y$10$kErUWAhuWMoqwxYRrAOGOuLBlE6XreRnib18CHhtUSUaurjDxQtxK', 5, 'Jl. Menara II RT 01 RW 05 No. 19 Meruya Selatan Kembangan Jakarta Barat', '081314143313', '/uploads/profile/1724402021_IMG_20240823_081920.jpg', NULL, NULL, '2024-08-23 15:27:17', '2024-08-23 15:33:41'),
(52, 'Muthia', 'muthia@gmail.com', '$2y$10$77Hn.e25Y7S8oPm.Qr535OpjnXhwQrD1C6OhmcuWQEb3cY4VCN1uS', 5, NULL, NULL, NULL, NULL, NULL, '2024-08-23 15:32:29', '2024-08-23 15:32:29'),
(55, 'Shabrina', 'brina@gmail.com', '$2y$10$qvRNo3UUv.jqoUdeGbiM7O5T1fo8Bmn4d2Fy5inGP0ZSbf/a1o5BW', 31, NULL, NULL, NULL, NULL, NULL, '2024-09-06 22:26:16', '2024-09-06 22:26:16'),
(56, 'Renga', 'renga@gmail.com', '$2y$10$LN8l2nzZxJFOTthtN0AmFOwX24hfRCapiKxY2iJ0pDgQrXhn.DsJK', 13, NULL, NULL, NULL, NULL, NULL, '2024-09-06 22:30:06', '2024-09-06 22:30:06'),
(57, 'M. Ghufri Fatchani', 'lrhghufri@gmail.com', '$2y$10$SWxeMBljg8lXVdt0Mb.pYekvdoOt/S1tfTvRnVMg1P8WMjoJ6lBv.', 17, 'Meruya Selatan', '087884290615', '/uploads/profile/1725676448_1000511750.jpg', NULL, NULL, '2024-09-07 09:11:38', '2024-09-07 09:34:08'),
(59, 'Marjuki', 'marjuki611@guru.sd.belajar.id', '$2y$10$Ema61vNsx50Bwwy7hKu0JuY6FxQwOtLbo0c789Hgvil3v6Oci6bNC', 19, NULL, NULL, NULL, NULL, NULL, '2024-09-07 09:57:49', '2024-09-07 09:57:49'),
(60, 'permadi', 'permadi@gmail.com', '$2y$10$I1kasTSDHmDi9RLijgGHpOoe5joNBL6BiUpOXYbRG51y5tiOFXVKy', 5, NULL, NULL, NULL, NULL, NULL, '2024-09-07 10:09:16', '2024-09-07 10:09:16'),
(61, 'Farid', 'faridcamal06@gmail.com', '$2y$10$6zxMEak94.Z9zU/UIjx4Jefb/rwkZP.Lf.BwaJWilLIf77Ny2JhBW', 13, NULL, NULL, NULL, NULL, NULL, '2024-09-07 10:44:07', '2024-09-07 10:44:07'),
(62, 'Sri', 'rahayu@gmail.com', '$2y$10$gjGB67MTAOu.Lltjpk4.6Oo6u3.EA4p1xQOnEzAFwz2fGXi8zWSmu', 20, NULL, NULL, NULL, NULL, NULL, '2024-09-07 10:57:13', '2024-09-07 10:57:13'),
(63, 'Cincinriana', 'cincinriana@gmail.com', '$2y$10$BqL1AjIut8ks6fZX.VCR/e2slfwM0TEhhS4QNHn2gWI4jQFWFMO.6', 23, NULL, NULL, NULL, NULL, NULL, '2024-09-07 10:59:13', '2024-09-07 10:59:13'),
(64, 'RPTRA MENARA', 'rptra.menara6@gmail.com', '$2y$10$Oalj13Anf2Y1I7xZJBJe0OpiWbtbu1k1f3MGuE17TG7azD3Qm8t12', 24, NULL, NULL, NULL, NULL, NULL, '2024-09-07 11:01:08', '2024-09-07 11:01:08'),
(65, 'Ikhsan', 'ikhsanikhsan0901@gmail.com', '$2y$10$STV6eh9Nra3U2wbMGNKmGeCBufeew46Y1vOodfa0rywxMIiesPrZa', 5, 'mercu buana', '123456', 'uploads/5/2024-09/motor1.jpg', NULL, NULL, '2024-09-21 13:13:37', '2024-09-29 18:37:45'),
(66, 'Priyo Wahyudi', 'priyo.wahyudi@yahoo.com', '$2y$10$LRuYRUFyi6kspUT6NGEmvueXVkNza7eFapXIGCbYtI2SFBLl/zase', 5, 'ciledug', '123', 'uploads/5/2024-09/mobil3.jpg', NULL, NULL, '2024-09-21 13:24:28', '2024-09-26 13:38:25'),
(67, 'Imam', 'imamkhumaedi1989@gmail.com', '$2y$10$nM2WkQvGdhb0WfixUJWCCua0XOJpGfBsOqgOJ45QVBzEYuhEAuZaO', 5, 'meruya', '083896758980', 'uploads/5/2024-09/mobil2.jpg', NULL, NULL, '2024-09-21 13:28:10', '2024-09-30 12:25:10'),
(68, 'Riska', 'riskairna213@gmail.com', '$2y$10$V8QvGkpuHfs557IAHxIJD.j882/rjDFbIs5O6FD4CubW0RsvBqADa', 5, 'mercu buana', '12345', 'uploads/5/2024-09/tasbih.jpg', NULL, NULL, '2024-09-21 13:37:38', '2024-09-29 16:58:35'),
(69, 'ILHAM BACHRI', 'ibasbachri@gmail.com', '$2y$10$HEQb9Nd6PruZPdoSpa4EvOMx/jdZaJXRcksTaU8r/JJlhARSTDHH6', 5, 'meruya', '123456', 'uploads/5/2024-09/naruto.jpg', NULL, NULL, '2024-09-21 13:39:57', '2024-09-29 18:30:44'),
(70, 'Aman abdu rahman', 'amanabdurahman637@gmail.com', '$2y$10$eqhLbksw4UYZVBOOQecJb.CrtMQS.mICztbvYktNMPULil1KfV05.', 5, 'mercu buana', '12345', 'uploads/5/2024-09/batman.png', NULL, NULL, '2024-09-21 13:41:46', '2024-09-30 11:08:31'),
(71, 'Febri Arya', 'aryafebri053@gmail.com', '$2y$10$wA94CsgGwwts0fFHL4e1F.zEY/pDlNYXSVgazLtid0P/aDX1cs23i', 5, 'meruya', '12345', 'uploads/5/2024-09/logo_flash.png', NULL, NULL, '2024-09-21 13:55:29', '2024-09-29 17:59:18'),
(72, 'Suminar', 'minargemilang9224@gmail.com', '$2y$10$FHq5xyjh.ASZeaxDd65vf.W7y22nV2e5A1dtbI.5Gp25hZU7Vtura', 5, 'mercu buana', '12345', 'uploads/5/2024-09/2013_jeep_wrangler_rubicon_front_view_in_motion.jpg', NULL, NULL, '2024-09-21 14:09:53', '2024-09-29 18:48:10'),
(73, 'Ahyudin', 'ahydudindin@gmail.com', '$2y$10$vTJgHybAO4ulV7qFq6T1eO6Z/9Tzp0I6eo6YyA1ICoJcGzXbWSHla', 5, 'Ciputat', '112233122', 'uploads/profile/1727178237_Screenshot_20240723_224649_Talenta.jpg', NULL, NULL, '2024-09-21 14:13:10', '2024-09-29 19:05:15'),
(74, 'Namin', 'namintoyon25@gmail.com', '$2y$10$4VogAsUDttqBhYXcjx4hfOCp./u6uYZgxDr0OWzMxNA2fL248lrGS', 5, 'mercu buana', '085691005180', 'uploads/profile/1727684540_1000014865.jpg', NULL, NULL, '2024-09-21 14:14:13', '2024-09-30 15:22:20'),
(75, 'Munir', 'misbahulmunir.100793@gmail.com', '$2y$10$4qt1AXZJR/xySrbgXYRY0uP9HG1hbhK5KFIUIv62gwhVSrhzlv/5e', 5, 'mercu buana', '123445', 'uploads/5/2024-09/03_jeep_rubicon_10th_anniv_la.jpg', NULL, NULL, '2024-09-21 14:16:14', '2024-09-29 18:49:54'),
(76, 'Husain', 'didithusain0711@gmail.com', '$2y$10$e4uaTnjCP84KOhAxJVxAgOeXQOvHFHMN7U7CendeUaVMbEqLUtCDu', 5, 'mercu buana', '12345', 'uploads/5/2024-09/spiderman.jpg', NULL, NULL, '2024-09-21 15:48:12', '2024-09-29 18:27:24'),
(77, 'Citra Sentosa', 'sentosa.citra@gmail.com', '$2y$10$Httikw9j81SMdALtE7SHMO7yHAayMZGt6KRU6NALyFf6kJb.jYl.C', 5, 'Jembatan lima,Tambora, Jakarta Barat', '081932330979', 'uploads/profile/1726908900_IMG-20191020-WA0014.jpg', NULL, NULL, '2024-09-21 15:51:44', '2024-10-04 14:27:02'),
(78, 'Yahya', 'yahyabuana4321@gmail.com', '$2y$10$d3lXB/2rISXklJCdRVtz/O74UoKs2R8b08GUSoBIfrhr9jLwQ8OdG', 5, 'mercu buana', '1234', 'uploads/5/2024-09/mobil4.jpg', NULL, NULL, '2024-09-22 15:04:18', '2024-09-26 14:48:25'),
(79, 'Feri', 'Ferei796@gmail.com', '$2y$10$.pFZ.Ff.S5Qmli54l3gVLeu446XIoJReAN7glvs5h83x2HXJZuyMq', 5, 'Tangerang', '089602220217', 'uploads/profile/1726998565_Screenshot_20240910_092608_com.instagram.android.png', NULL, NULL, '2024-09-22 16:46:05', '2024-09-29 17:58:16'),
(80, 'Kusmawardani', 'annykusmawardani868@gmail.com', '$2y$10$vyJAP2RhsVOTqa5drqBp1e0Wwo2VaBHKiVVCQh2IiyW8lB2s28G6m', 26, 'Jl. Swakarya', '087880208746', 'uploads/26/2024-09/17273367709958014523272072075946.jpg', NULL, NULL, '2024-09-23 11:19:14', '2024-09-26 14:46:42'),
(82, 'Mochamad Billy Samudra', 'mochamadbillysamudra@gmail.com', '$2y$10$Ia6ansbqw6pRmpKCW23Z6uclG5hxxSGdNiEHFqHU/2MGVaq6DEeL6', 5, 'meruya', '12345', 'uploads/5/2024-09/wolverine.png', NULL, NULL, '2024-09-26 11:38:36', '2024-09-29 17:56:42'),
(83, 'Ani', 'ani123@gmail.com', '$2y$10$aLYPWw/WWIHYEGX3OBmQnerRizKq5rI06fkW3NKf0dSVgr2T3VHI6', 26, NULL, NULL, NULL, NULL, NULL, '2024-09-26 14:02:19', '2024-09-26 14:02:19'),
(84, 'Saraswati98', 'saraswatirini90@gmail.com', '$2y$10$u9JQJruMU3SXCuCpx7CeJOK42qca9wZRB6O9QGsidlrFXtIY8LuzC', 26, 'Komp DPR NO 98 MERUYA SELATAN', '081294945344', NULL, NULL, NULL, '2024-09-26 14:14:12', '2024-09-26 14:33:14'),
(85, 'Achmad', 'parsimpi29@gmail.com', '$2y$10$7PnqzqV96AWBFJEO0wRfeuPJzu0Jl8ZTj0SQDFE9oeOuNkbD47UCG', 26, NULL, NULL, NULL, NULL, NULL, '2024-09-26 14:36:20', '2024-09-26 14:36:20'),
(86, 'Ade saputra', 'adesaputras759@gmail.com', '$2y$10$XANiDRiaNKtdxF1YfeU00O9vFUK9/y.GCgnUbg0jEnAa/ZW.r3Zz.', 5, 'mercu buana', '12345', 'uploads/5/2024-09/batman.png', NULL, NULL, '2024-09-26 15:49:09', '2024-09-29 17:41:35'),
(88, 'Aisyah', 'aisyah12@gmail.com', '$2y$10$RIDXI6k2PuDstWrXWi8MGuoFbe43vfkAfGvdLfkheOZ3zPE3vUCVa', 5, NULL, NULL, NULL, NULL, NULL, '2024-09-29 14:28:14', '2024-09-29 14:28:14'),
(89, 'birmawa', 'birmawa@mercubuana.ac.id', '$2y$10$FTJpFVJFS/gvGGB8Sd5pSOx464M/gwre67rnhnlKLpjhGFb4sS99a', 5, NULL, NULL, NULL, NULL, NULL, '2024-09-29 14:29:05', '2024-09-29 14:29:05'),
(90, 'toriq', 'toriq@gmail.com', '$2y$10$CeWmLtCItf8gSMmE5qZNUeDUVg/8viC7H.0o8W2QYpMJfJxCB4pDi', 5, NULL, NULL, NULL, NULL, NULL, '2024-09-29 14:30:09', '2024-09-29 14:30:09'),
(91, 'rengga_bils', 'rengga24@gmail.com', '$2y$10$BLqiNOPgGSNho2y1gV8u9.nWfVCiAqqQ5mKhH/QZ5lqVQUwjZ4YgK', 5, NULL, NULL, NULL, NULL, NULL, '2024-09-29 14:31:57', '2024-09-29 14:31:57'),
(93, 'Rojak', 'rojak12@gmail.com', '$2y$10$.IyRvEWB5NggbtsLtv9vO.3q08iM.50QP9tm33DYcScbQr8azmFH2', 5, NULL, NULL, NULL, NULL, NULL, '2024-09-29 15:40:42', '2024-09-29 15:40:42'),
(94, 'Rinto', 'rinto1@gmail.com', '$2y$10$Itf3IJe3x2bAq8ZLzUvLeO6KBrXvhvomYkYHhO.OUGZw9AMiVzqy6', 5, NULL, NULL, NULL, NULL, NULL, '2024-09-29 15:47:24', '2024-09-29 15:47:24'),
(95, 'Restu', 'restu12@gmail.com', '$2y$10$d46ds/3CcdpVAgbf/uO.GOT8G4xoZw7blWF9SNNMOdbGGK6ezPLVK', 5, NULL, NULL, NULL, NULL, NULL, '2024-09-29 16:33:35', '2024-09-29 16:33:35'),
(96, 'Anton', 'anton.supriyadi@mercubuana.ac.id', '$2y$10$q0nOX0Kuom.FAxpMNeMJoe/pUeMDBD7ANSqMVbj8QgpI/0GWJeUyq', 5, 'Meruya', '112233122', NULL, NULL, NULL, '2024-09-29 17:52:15', '2024-10-15 08:20:15'),
(97, 'Mira Zulia', 'mirazulia@yahoo.com', '$2y$10$EcbaEQ7Ek0D94n.J6YuCCO7m64X9RxmnH4HCZz.fFBz7EEpN6qHXW', 5, NULL, NULL, NULL, NULL, NULL, '2024-09-30 07:17:07', '2024-09-30 07:17:07'),
(98, 'Anwar', 'anwar@mercubuana.ac.id', '$2y$10$84R6JJmXlKb3TlVLgZwZp.m.gZIXlkOcwinUHBLmDqHaPHGGC5F.6', 5, NULL, NULL, NULL, NULL, NULL, '2024-09-30 10:46:00', '2024-09-30 10:46:00'),
(99, 'dedeadika', 'ddadkd30@gmail.com', '$2y$10$VP8X3l4qs7ouGIqtwb3rv.cwzPCITu6ONyG4nW.5Y/UyaHhr64HIC', 5, 'Ciputat', '112233122', 'uploads/profile/1727696677_Gemini_Generated_Image_ohc20wohc20wohc2.jpeg', NULL, NULL, '2024-09-30 18:43:17', '2024-09-30 18:44:37'),
(100, 'cTIbqrbbnFs', 'missif4252@gmail.com', '$2y$10$J/41zjYVM5CMR6glivPyeeeRUkpGovkbVab3QvExkHz34YTPnwuFC', 31, NULL, NULL, NULL, NULL, NULL, '2024-10-03 11:22:18', '2024-10-03 11:22:18'),
(101, 'ekarahmawati', 'ekarahmawati05@gmail.com', '$2y$10$pUNivQnFZaVKsF.Z5dZ8BOBRAexCSD.gO1dkhFtOBvsGI4EGRSRMC', 5, NULL, NULL, NULL, NULL, NULL, '2024-10-03 11:54:20', '2024-10-03 11:54:20'),
(102, 'hhlzyluv', 'crackllc373@gmail.com', '$2y$10$DQt8Yl299J97RCpLAl6pf.L9UNjX7uxH2kA9lVpY/c0dsflo8hsJu', 13, NULL, NULL, NULL, NULL, NULL, '2024-10-11 16:40:07', '2024-10-11 16:40:07'),
(103, 'evaaa', 'sijabatmarta96@gmail.com', '$2y$10$WMd/7vERx5rm1YaUlMhsaOH7AG3MysLVBRWMACqTb5ljtPytOiAGC', 5, NULL, NULL, NULL, NULL, NULL, '2024-10-15 22:07:20', '2024-10-15 22:07:20'),
(104, 'Apin', 'apin@gmail.com', '$2y$10$lcW6hBOui8iaOwsbNZk3HOL0nI/iuJkdcmyZt82G9Yfna8wV2p2v2', 26, NULL, NULL, NULL, NULL, NULL, '2024-10-22 13:39:16', '2024-10-22 13:39:16'),
(105, 'Dwi', 'bundaintan0@gmail.com', '$2y$10$WN0SezfkVVOVuQaKTiHPKuw7fsBDI4eyIEaAcd1vCcajVLesOP0xO', 26, NULL, NULL, NULL, NULL, NULL, '2024-10-22 14:49:39', '2024-10-22 14:49:39'),
(106, 'Sakari', 'sakari@gmail.com', '$2y$10$aBp4EH3c0HUnakuZZEq/dOi1VxhmSc36.julK4bqcxeqPa982tkrS', 26, NULL, NULL, NULL, NULL, NULL, '2024-10-22 15:43:56', '2024-10-22 15:43:56'),
(107, 'Jojo', 'jojo@gmail.com', '$2y$10$7RDb/2xlYcBCBc9VWtKV.OYzieiNSE5BZ/9PRk1065XZetefTPHE6', 26, NULL, NULL, NULL, NULL, NULL, '2024-10-22 15:44:19', '2024-10-22 15:44:19'),
(108, 'Sadun', 'sadun@gmail.com', '$2y$10$4CUhkf6WkR9qsOM2bHhpn.CHr86p6jWgtyE573E47KnUmvIBG6j/6', 26, NULL, NULL, NULL, NULL, NULL, '2024-10-22 15:44:46', '2024-10-22 15:44:46'),
(109, 'Rianto', 'rianto@gmail.com', '$2y$10$rBXiskyI4XTScy5.KoYl3.SCPSvLxlaKbREwI1d.fZZZALYjy6onS', 26, NULL, NULL, NULL, NULL, NULL, '2024-10-22 15:45:08', '2024-10-22 15:45:08'),
(110, 'Putri Jaka', 'putrijaka@gmail.com', '$2y$10$8SlRs5Ack7ONqj7EBresiOCwod5L5GCZvbcx0IFkcO/GUlSr1MLim', 26, NULL, NULL, NULL, NULL, NULL, '2024-10-22 15:45:48', '2024-10-22 15:45:48'),
(111, 'Siti Sahara', 'sitisahara@gmail.com', '$2y$10$C36VnYC85qeooYd2hNImA.HxyYUaiY48co05OvECGe7JYdjXKsuQm', 26, NULL, NULL, NULL, NULL, NULL, '2024-10-22 15:46:20', '2024-10-22 15:46:20'),
(112, 'Sri Kwatiningsih', 'srikwatiningsih@gmail.com', '$2y$10$wGcpABtqq6dBfMmlpE4mneJGzy4PhNygNjUeMszKDRYLpw3gRrawm', 26, NULL, NULL, NULL, NULL, NULL, '2024-10-22 15:47:15', '2024-10-22 15:47:15'),
(113, 'Tini', 'tini@gmail.com', '$2y$10$SjZg0fJkOwgAUFXkVVs/UO5JeFKi9IX8KMycjco8MhrLKwJkf9hAK', 26, NULL, NULL, NULL, NULL, NULL, '2024-10-22 15:48:25', '2024-10-22 15:48:25'),
(114, 'Samsi', 'samsi@gmail.com', '$2y$10$7tufXNtWV5py7O/RNYotDOiE46ZqD8R8HTI1KcNCaqyhSouH7HoCG', 26, 'jl', '0808080808', 'uploads/26/2024-10/foto_guru.png', NULL, NULL, '2024-10-22 15:48:54', '2024-10-22 15:51:04'),
(115, 'Ikhsann', 'Ikhsan@gmail.com', '$2y$10$4HKvedl/FMJsku4roKLW1O3PpxpEGfGQn2oX8nWfxmnK8uCOmGD1C', 26, NULL, NULL, NULL, NULL, NULL, '2024-10-22 15:52:06', '2024-10-22 15:52:06'),
(116, 'Siti Lestari', 'sitilestari@gmail.com', '$2y$10$GXfxvH84PB.lI9LHJZJVUesxTAOWIiFYsLTWEyzfg8TrO4xc6E7Yy', 26, NULL, NULL, NULL, NULL, NULL, '2024-10-22 15:52:17', '2024-10-22 15:52:17'),
(117, 'Masruhan', 'masruhan@gmail.com', '$2y$10$inXmx6/Ss4PQdpnePhAoheSoa/VFuph2s1V5fkZ2.GM8aAhBSn/7u', 26, NULL, NULL, NULL, NULL, NULL, '2024-10-22 15:52:28', '2024-10-22 15:52:28'),
(118, 'Repelita', 'repelita@gmail.com', '$2y$10$c5Fbu.zKg3tiQ.L.UCg4jeoS729zGi011vtgA/tT.oBqQXbgpOtoS', 26, NULL, NULL, NULL, NULL, NULL, '2024-10-22 15:52:52', '2024-10-22 15:52:52'),
(119, 'Haji May', 'hajimay@gmail.com', '$2y$10$nTungcmcCToOinwIgEYolOEvR9DGIsgnl1Q4YA4LCBi9bpSDiYmMy', 26, NULL, NULL, NULL, NULL, NULL, '2024-10-22 15:53:18', '2024-10-22 15:53:18'),
(120, 'Jumadi', 'jumadi@gmail.com', '$2y$10$367uXoYS/v7HwIDafY5gWeL2DdkA0Zu.Xa1X/UtOEyifO3PvBRexK', 26, NULL, NULL, NULL, NULL, NULL, '2024-10-22 15:53:22', '2024-10-22 15:53:22'),
(121, 'Atih', 'atih@gmail.com', '$2y$10$3N4K0dIOlkNQkDSawj4Bm.h4uY6wimofbsQSAhQnpL0iraT8oHTIy', 26, NULL, NULL, NULL, NULL, NULL, '2024-10-22 15:53:41', '2024-10-22 15:53:41'),
(122, 'Siti Saadah', 'sitisaadah@gmail.com', '$2y$10$hrAoiqkRwgOL/eGc5x6fzu.UCiNT2K.4BOp9YZBMp3./VCfsfSdcC', 26, NULL, NULL, NULL, NULL, NULL, '2024-10-22 15:53:50', '2024-10-22 15:53:50'),
(123, 'Samnuh', 'samnuh@gmail.com', '$2y$10$JRv.LqHcMwhwo9dUbW72ZO3L9UVTlXi5z4UheO2/xwLROI1AaCTca', 26, NULL, NULL, NULL, NULL, NULL, '2024-10-22 15:54:55', '2024-10-22 15:54:55'),
(124, 'Ati', 'ati@gmail.com', '$2y$10$MNal67O9OqiD/39CMPKwGesVg2hQQVSs9KPfqn3Gx42xM81pPb6wi', 26, NULL, NULL, NULL, NULL, NULL, '2024-10-22 15:56:00', '2024-10-22 15:56:00'),
(125, 'Dasman', 'dasman@gmail.com', '$2y$10$nfHhYOWsfP8NB8zZkl3dUusrF.bE2cCHOLqAzp2Sry1wwMUnJ7t5K', 26, NULL, NULL, NULL, NULL, NULL, '2024-10-22 15:56:00', '2024-10-22 15:56:00'),
(126, 'Effendi', 'effendi@gmail.com', '$2y$10$7dxOXrZHEOBFEanGsrfl.OrFAH.ye5.kg61YjJYQ6vA8DmB3uto6K', 26, NULL, NULL, NULL, NULL, NULL, '2024-10-22 15:56:22', '2024-10-22 15:56:22'),
(127, 'Enung', 'enung@gmail.com', '$2y$10$gLyqpnCyHaRjM5x0Nhx2NeR1Wo7zE4YYzGmLE5oHuwPWm429GAo0C', 26, NULL, NULL, NULL, NULL, NULL, '2024-10-22 15:56:41', '2024-10-22 15:56:41'),
(128, 'Rosmine', 'rosmine@gmail.com', '$2y$10$M0LRc4kxJVnV1YWquchvouea9.YlLIqukOhH/ZChosp1nErMh34tq', 26, NULL, NULL, NULL, NULL, NULL, '2024-10-22 15:56:46', '2024-10-22 15:56:46'),
(129, 'Eny Yuliasih', 'enyyuliasih@gmail.com', '$2y$10$8WVL0Ek3sfsASObqmpEuH..6tDpGWqHIMRc4OcyXpBtbtOcWNK.Zu', 26, NULL, NULL, NULL, NULL, NULL, '2024-10-22 15:57:10', '2024-10-22 15:57:10'),
(130, 'Yaman Coprak', 'yamancoprak@gmail.com', '$2y$10$9JkOzC9QtNOVvOCZ9u6CC.OOprpEOiyoPJ56t4/Q4C7pHOrazKXnO', 26, NULL, NULL, NULL, NULL, NULL, '2024-10-22 15:57:14', '2024-10-22 15:57:14'),
(131, 'Ros', 'ros@gmail.com', '$2y$10$oLx/HypOqZs7Tvm0il7PBO8dab9Sc7uL8ZK3Qiqt0Lqhzxw1Zicp2', 26, NULL, NULL, NULL, NULL, NULL, '2024-10-22 15:57:29', '2024-10-22 15:57:29'),
(132, 'Arya', 'arya@gmail.com', '$2y$10$Urpn5QHw7yGukfUS8gXMq.vVGN0HNH4Y.MkKGfQe2aXctPpAxEKdu', 26, NULL, NULL, NULL, NULL, NULL, '2024-10-22 15:57:46', '2024-10-22 15:57:46'),
(133, 'Aliyahman', 'aliyahman@gmail.com', '$2y$10$b5Mspkm3EWyXAqjfrqmeI.oUWi/wDLWCMLgAjDPjPYXCteZ6FQRMm', 26, NULL, NULL, NULL, NULL, NULL, '2024-10-22 15:58:32', '2024-10-22 15:58:32'),
(134, 'Agustin', 'agustin@gmail.com', '$2y$10$lQJTxEs83BulrYHXi1JGwOAVcmAo6T0zfECACj5vN45yHyaLcqYei', 26, NULL, NULL, NULL, NULL, NULL, '2024-10-22 15:59:09', '2024-10-22 15:59:09'),
(135, 'Misrohayati', 'misrohayatu@gmail.com', '$2y$10$xxU2O2aDecDJEYfGKWu7M.BtZR.iwtRR7VKaYsViDHa8EqF70/wB2', 26, NULL, NULL, NULL, NULL, NULL, '2024-10-22 15:59:38', '2024-10-22 15:59:38'),
(136, 'Suwarsa', 'suwarsa@gmail.com', '$2y$10$gS1FcWLNn8pU8AmSKZiiuu5Tk1wb2KdaARKZPY.kBCyJJl6xC0GWG', 26, NULL, NULL, NULL, NULL, NULL, '2024-10-22 16:00:01', '2024-10-22 16:00:01'),
(137, 'Kelly', 'kelly@gmail.com', '$2y$10$2ABcpZMDlB5dCu2h0JDrIuZzgA7prHrCtHGB03k848V/LnfQavi/2', 26, NULL, NULL, NULL, NULL, NULL, '2024-10-22 16:00:32', '2024-10-22 16:00:32');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cms_apicustom`
--
ALTER TABLE `cms_apicustom`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_apikey`
--
ALTER TABLE `cms_apikey`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_dashboard`
--
ALTER TABLE `cms_dashboard`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_email_queues`
--
ALTER TABLE `cms_email_queues`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_logs`
--
ALTER TABLE `cms_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_menus`
--
ALTER TABLE `cms_menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_menus_privileges`
--
ALTER TABLE `cms_menus_privileges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_moduls`
--
ALTER TABLE `cms_moduls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_notifications`
--
ALTER TABLE `cms_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_privileges`
--
ALTER TABLE `cms_privileges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_privileges_roles`
--
ALTER TABLE `cms_privileges_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_settings`
--
ALTER TABLE `cms_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_statistics`
--
ALTER TABLE `cms_statistics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_statistic_components`
--
ALTER TABLE `cms_statistic_components`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_users`
--
ALTER TABLE `cms_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `education`
--
ALTER TABLE `education`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `laporan_keuangan`
--
ALTER TABLE `laporan_keuangan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_id_foreign_laporan` (`admin_id`);

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
-- Indexes for table `pengumuman`
--
ALTER TABLE `pengumuman`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_id` (`admin_id`) USING BTREE;

--
-- Indexes for table `points`
--
ALTER TABLE `points`
  ADD PRIMARY KEY (`id`),
  ADD KEY `points_user_id_index` (`user_id`);

--
-- Indexes for table `rewards`
--
ALTER TABLE `rewards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Indexes for table `saldo`
--
ALTER TABLE `saldo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sampah`
--
ALTER TABLE `sampah`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_id` (`admin_id`),
  ADD KEY `sampah_category_id_foreign` (`category_id`);

--
-- Indexes for table `sampah_categories`
--
ALTER TABLE `sampah_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_user_id_index` (`user_id`),
  ADD KEY `transactions_admin_id_index` (`admin_id`),
  ADD KEY `transactions_sampah_id_index` (`sampah_id`);

--
-- Indexes for table `transactions_bsi`
--
ALTER TABLE `transactions_bsi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_id` (`admin_id`) USING BTREE,
  ADD KEY `sampah_id_foreign_bsi` (`sampah_id`);

--
-- Indexes for table `tukar_poins`
--
ALTER TABLE `tukar_poins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tukar_poins_user_id_index` (`user_id`),
  ADD KEY `tukar_poins_admin_id_index` (`admin_id`),
  ADD KEY `tukar_poins_reward_id_index` (`reward_id`);

--
-- Indexes for table `tukar_saldo`
--
ALTER TABLE `tukar_saldo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tukar_saldo_admin_id_foreign` (`admin_id`),
  ADD KEY `tukar_saldo_reward_id_foreign` (`reward_id`),
  ADD KEY `id_user` (`user_id`,`admin_id`,`reward_id`) USING BTREE;

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `cms_user_id` (`cms_user_id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cms_apicustom`
--
ALTER TABLE `cms_apicustom`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_apikey`
--
ALTER TABLE `cms_apikey`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_dashboard`
--
ALTER TABLE `cms_dashboard`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_email_queues`
--
ALTER TABLE `cms_email_queues`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_logs`
--
ALTER TABLE `cms_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2401;

--
-- AUTO_INCREMENT for table `cms_menus`
--
ALTER TABLE `cms_menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `cms_menus_privileges`
--
ALTER TABLE `cms_menus_privileges`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=168;

--
-- AUTO_INCREMENT for table `cms_moduls`
--
ALTER TABLE `cms_moduls`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `cms_notifications`
--
ALTER TABLE `cms_notifications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms_privileges`
--
ALTER TABLE `cms_privileges`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cms_privileges_roles`
--
ALTER TABLE `cms_privileges_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=214;

--
-- AUTO_INCREMENT for table `cms_settings`
--
ALTER TABLE `cms_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `cms_statistics`
--
ALTER TABLE `cms_statistics`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cms_statistic_components`
--
ALTER TABLE `cms_statistic_components`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `cms_users`
--
ALTER TABLE `cms_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `education`
--
ALTER TABLE `education`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `laporan_keuangan`
--
ALTER TABLE `laporan_keuangan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `pengumuman`
--
ALTER TABLE `pengumuman`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `points`
--
ALTER TABLE `points`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- AUTO_INCREMENT for table `rewards`
--
ALTER TABLE `rewards`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `saldo`
--
ALTER TABLE `saldo`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `sampah`
--
ALTER TABLE `sampah`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- AUTO_INCREMENT for table `sampah_categories`
--
ALTER TABLE `sampah_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=569;

--
-- AUTO_INCREMENT for table `transactions_bsi`
--
ALTER TABLE `transactions_bsi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `tukar_poins`
--
ALTER TABLE `tukar_poins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `tukar_saldo`
--
ALTER TABLE `tukar_saldo`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=138;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `laporan_keuangan`
--
ALTER TABLE `laporan_keuangan`
  ADD CONSTRAINT `admin_id_foreign_laporan` FOREIGN KEY (`admin_id`) REFERENCES `cms_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pengumuman`
--
ALTER TABLE `pengumuman`
  ADD CONSTRAINT `admin_id_foreign_relation` FOREIGN KEY (`admin_id`) REFERENCES `cms_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `points`
--
ALTER TABLE `points`
  ADD CONSTRAINT `points_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `rewards`
--
ALTER TABLE `rewards`
  ADD CONSTRAINT `reward_admin_id_foreign_relation` FOREIGN KEY (`admin_id`) REFERENCES `cms_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `saldo`
--
ALTER TABLE `saldo`
  ADD CONSTRAINT `saldo_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sampah`
--
ALTER TABLE `sampah`
  ADD CONSTRAINT `admin_id_foreign_sampah` FOREIGN KEY (`admin_id`) REFERENCES `cms_users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sampah_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `sampah_categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sampah_categories`
--
ALTER TABLE `sampah_categories`
  ADD CONSTRAINT `admin_id_foreign_category` FOREIGN KEY (`admin_id`) REFERENCES `cms_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `cms_users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_sampah_id_foreign` FOREIGN KEY (`sampah_id`) REFERENCES `sampah` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transactions_bsi`
--
ALTER TABLE `transactions_bsi`
  ADD CONSTRAINT `admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `cms_users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sampah_id_foreign_bsi` FOREIGN KEY (`sampah_id`) REFERENCES `sampah` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `cms_user_id_foreign` FOREIGN KEY (`cms_user_id`) REFERENCES `cms_users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
