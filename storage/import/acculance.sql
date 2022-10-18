-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 18, 2022 at 09:36 AM
-- Server version: 5.7.33
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `acculance`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bank_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `branch_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date DEFAULT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `bank_name`, `branch_name`, `account_number`, `slug`, `date`, `note`, `status`, `created_at`, `updated_at`, `created_by`) VALUES
(4, 'Cash', 'Office', 'CASH-0001', 'cash-0001', '2022-04-30', '', 1, '2022-04-30 16:26:01', '2022-04-30 16:26:01', 1),
(2, 'Dutch Bangla Bank', 'Mirpur', 'DBBL-0003', 'dbbl-0002', '2022-04-30', '', 1, '2022-04-30 16:24:29', '2022-04-30 16:26:19', 1),
(3, 'Islami Bank Bangladesh Ltd', 'Mirpur', 'IBBL-0002', 'ibbl-0003', '2022-04-30', '', 1, '2022-04-30 16:25:41', '2022-04-30 16:26:10', 1);

-- --------------------------------------------------------

--
-- Table structure for table `account_transactions`
--

CREATE TABLE `account_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reason` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double(12,2) NOT NULL,
  `type` tinyint(1) NOT NULL COMMENT '0 is Debit and 1 is Credit',
  `cheque_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `receipt_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_date` datetime NOT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `account_id` bigint(20) UNSIGNED NOT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `account_transactions`
--

INSERT INTO `account_transactions` (`id`, `reason`, `slug`, `amount`, `type`, `cheque_no`, `receipt_no`, `transaction_date`, `note`, `status`, `created_at`, `updated_at`, `account_id`, `created_by`) VALUES
(1, 'Non invoice balance added to [CASH-0001]', 'non-invoice-balance-added-to-cash-0001', 100000.00, 1, NULL, NULL, '2022-01-01 00:00:00', NULL, 1, '2022-04-30 16:26:33', '2022-04-30 23:28:33', 4, 1),
(2, 'Non invoice balance added to [IBBL-0002]', 'non-invoice-balance-added-to-ibbl-0002', 100000.00, 1, NULL, NULL, '2022-01-01 00:00:00', NULL, 1, '2022-04-30 16:26:41', '2022-04-30 23:28:24', 3, 1),
(3, 'Non invoice balance added to [DBBL-0003]', 'non-invoice-balance-added-to-dbbl-0003', 100000.00, 1, NULL, NULL, '2022-01-01 00:00:00', NULL, 1, '2022-04-30 16:26:49', '2022-04-30 23:28:15', 2, 1),
(4, 'Balance transfer from [CASH-0001]', 'balance-transfer-from-cash-0001', 20000.00, 0, NULL, NULL, '2022-04-30 00:00:00', NULL, 1, '2022-04-30 16:27:56', '2022-04-30 16:27:56', 4, 1),
(5, 'Balance transfer to [IBBL-0002]', 'balance-transfer-to-ibbl-0002', 20000.00, 1, NULL, NULL, '2022-04-30 00:00:00', NULL, 1, '2022-04-30 16:27:56', '2022-04-30 16:27:56', 3, 1),
(6, 'Balance transfer from [CASH-0001]', 'balance-transfer-from-cash-0001-2', 10000.00, 0, NULL, NULL, '2022-04-30 00:00:00', NULL, 1, '2022-04-30 16:28:30', '2022-04-30 16:28:30', 4, 1),
(7, 'Balance transfer to [DBBL-0003]', 'balance-transfer-to-dbbl-0003', 10000.00, 1, NULL, NULL, '2022-04-30 00:00:00', NULL, 1, '2022-04-30 16:28:30', '2022-04-30 16:28:30', 2, 1),
(8, '[AES-2] Expense payment', 'aes-2-expense-payment', 1000.00, 0, 'AHGF5670987', 'VN-001', '2022-04-30 00:00:00', NULL, 1, '2022-04-30 16:29:48', '2022-04-30 16:29:48', 4, 1),
(9, '[AES-1] Expense payment', 'aes-1-expense-payment', 20000.00, 0, 'CN-00001', 'VN-00001', '2022-04-30 00:00:00', NULL, 1, '2022-04-30 16:30:56', '2022-04-30 16:30:56', 3, 1),
(10, '[APP-2] Purchase Payment sent from [IBBL-0002]', 'app-2-purchase-payment-sent-from-ibbl-0002', 25000.00, 0, 'CN-001834', 'RN-00122', '2022-02-01 00:00:00', NULL, 1, '2022-04-30 16:54:03', '2022-04-30 16:54:03', 3, 1),
(11, '[APP-3] Purchase Payment sent from [CASH-0001]', 'app-3-purchase-payment-sent-from-cash-0001', 30000.00, 0, 'CN-004234', 'RN-97854', '2022-04-30 00:00:00', NULL, 1, '2022-04-30 16:55:52', '2022-04-30 16:55:52', 4, 1),
(12, '[APP-4] Purchase Payment sent from [DBBL-0003]', 'app-4-purchase-payment-sent-from-dbbl-0003', 31377.50, 0, 'CN-0043245', 'Receipt No-5435543', '2022-04-30 00:00:00', NULL, 1, '2022-04-30 16:56:59', '2022-04-30 16:56:59', 2, 1),
(13, '[APR-2] Purchase Return receivable added to [CASH-0001]', 'apr-2-purchase-return-receivable-added-to-cash-0001', 8610.00, 1, 'CN-001', 'RN-012143', '2022-04-30 00:00:00', NULL, 1, '2022-04-30 16:59:28', '2022-04-30 16:59:28', 4, 1),
(14, '[AI-1] Invoice Payment added to [CASH-0001]', 'ai-1-invoice-payment-added-to-cash-0001', 15000.00, 1, 'CN-001231', 'RN-053456', '2022-01-05 00:00:00', NULL, 1, '2022-04-30 17:01:29', '2022-04-30 17:01:29', 4, 1),
(15, '[AI-5] Invoice Payment added to [CASH-0001]', 'ai-5-invoice-payment-added-to-cash-0001', 20000.00, 1, 'CN-05345', 'RN-42365', '2022-04-30 00:00:00', NULL, 1, '2022-04-30 22:57:44', '2022-04-30 22:57:44', 4, 1),
(16, '[AI-6] Invoice Payment added to [DBBL-0003]', 'ai-6-invoice-payment-added-to-dbbl-0003', 35000.00, 1, 'CN-001', 'Receipt No-0001', '2022-04-07 00:00:00', NULL, 1, '2022-04-30 23:06:05', '2022-04-30 23:06:05', 2, 1),
(17, '[AIR-2] Invoice Return payable sent from [CASH-0001]', 'air-2-invoice-return-payable-sent-from-cash-0001', 6163.50, 0, 'CN-52345', 'RN-5342', '2022-04-30 00:00:00', NULL, 1, '2022-04-30 23:10:01', '2022-04-30 23:10:01', 4, 1),
(18, '[AC-5] Non inovice payment added to [IBBL-0002]', 'ac-5-non-inovice-payment-added-to-ibbl-0002', 5000.00, 1, 'CN-05435', 'RN-54255', '2022-04-30 00:00:00', NULL, 1, '2022-04-30 23:11:07', '2022-04-30 23:11:07', 3, 1),
(19, '[AC-4] Non inovice payment added to [DBBL-0003]', 'ac-4-non-inovice-payment-added-to-dbbl-0003', 10000.00, 1, 'CN-5425', 'RN-5425', '2022-04-30 00:00:00', NULL, 1, '2022-04-30 23:11:35', '2022-04-30 23:11:35', 2, 1),
(20, '[AS-1] Non purchase due sent from [DBBL-0003]', 'as-1-non-purchase-due-sent-from-dbbl-0003', 10000.00, 0, 'CN-5425', 'RN-52345', '2022-04-30 00:00:00', NULL, 1, '2022-04-30 23:13:22', '2022-04-30 23:13:22', 2, 1),
(21, '[AS-2] Non purchase due sent from [IBBL-0002]', 'as-2-non-purchase-due-sent-from-ibbl-0002', 5000.00, 0, 'CN-52435', 'RN-54235', '2022-04-30 00:00:00', NULL, 1, '2022-04-30 23:14:00', '2022-04-30 23:14:00', 3, 1),
(22, '[AE-2] February Payroll sent from [CASH-0001]', 'ae-2-february-payroll-sent-from-cash-0001', 9800.00, 0, 'CN-3535', NULL, '2022-04-30 00:00:00', NULL, 1, '2022-04-30 23:26:29', '2022-04-30 23:26:29', 4, 1),
(23, '[AE-1] February Payroll sent from [IBBL-0002]', 'ae-1-february-payroll-sent-from-ibbl-0002', 12300.00, 0, 'CN-4325', NULL, '2022-04-30 00:00:00', NULL, 1, '2022-04-30 23:26:57', '2022-04-30 23:26:57', 3, 1),
(24, '[DBBL-0001] Loan added to [DBBL-0003]', 'dbbl-0001-loan-added-to-dbbl-0003', 100000.00, 1, NULL, NULL, '2022-02-01 00:00:00', NULL, 1, '2022-04-30 23:52:00', '2022-04-30 23:52:00', 2, 1),
(25, '[IBBL-0001] Loan added to [IBBL-0002]', 'ibbl-0001-loan-added-to-ibbl-0002', 100000.00, 1, NULL, NULL, '2022-03-09 00:00:00', NULL, 1, '2022-04-30 23:52:35', '2022-04-30 23:53:06', 3, 1),
(26, '[DBBL-0001] Loan Payment sent from [DBBL-0003]', 'dbbl-0001-loan-payment-sent-from-dbbl-0003', 4522.73, 0, NULL, NULL, '2022-01-28 00:00:00', NULL, 1, '2022-04-30 23:53:39', '2022-04-30 23:53:39', 2, 1),
(27, '[DBBL-0001] Loan Payment sent from [DBBL-0003]', 'dbbl-0001-loan-payment-sent-from-dbbl-0003-2', 4522.73, 0, NULL, NULL, '2022-02-17 00:00:00', NULL, 1, '2022-04-30 23:54:08', '2022-04-30 23:54:08', 2, 1),
(28, '[DBBL-0001] Loan Payment sent from [DBBL-0003]', 'dbbl-0001-loan-payment-sent-from-dbbl-0003-3', 4522.73, 0, NULL, NULL, '2022-02-17 00:00:00', NULL, 1, '2022-04-30 23:54:33', '2022-04-30 23:54:33', 2, 1),
(29, '[DBBL-0001] Loan Payment sent from [DBBL-0003]', 'dbbl-0001-loan-payment-sent-from-dbbl-0003-4', 4522.73, 0, NULL, NULL, '2022-04-22 00:00:00', NULL, 1, '2022-04-30 23:54:52', '2022-04-30 23:54:52', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `adjustment_products`
--

CREATE TABLE `adjustment_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` tinyint(1) DEFAULT NULL COMMENT '1 is increment and 0 is decrement',
  `purchase_price` double(12,2) DEFAULT NULL,
  `quantity` double(12,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `adjustment_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `adjustment_products`
--

INSERT INTO `adjustment_products` (`id`, `type`, `purchase_price`, `quantity`, `created_at`, `updated_at`, `adjustment_id`, `product_id`) VALUES
(1, 1, 1145.89, 1.00, '2022-05-01 00:04:24', '2022-05-01 00:04:24', 1, 3),
(2, 0, 953.03, 1.00, '2022-05-01 00:04:24', '2022-05-01 00:04:24', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `assets`
--

CREATE TABLE `assets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `asset_cost` double(12,2) NOT NULL,
  `depreciation` tinyint(1) DEFAULT '0',
  `depreciation_type` tinyint(1) DEFAULT '0',
  `salvage_value` double(12,2) DEFAULT NULL,
  `useful_life` double(5,2) DEFAULT NULL,
  `daily_depreciation` double(12,2) DEFAULT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cat_id` bigint(20) UNSIGNED NOT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `assets`
--

INSERT INTO `assets` (`id`, `name`, `slug`, `asset_cost`, `depreciation`, `depreciation_type`, `salvage_value`, `useful_life`, `daily_depreciation`, `note`, `image_path`, `date`, `expire_date`, `status`, `created_at`, `updated_at`, `cat_id`, `created_by`) VALUES
(1, 'Work Station', 'work-station', 50000.00, 0, NULL, NULL, NULL, NULL, 'This is a note', 'workstation.jpeg', '2022-04-30', NULL, 1, '2022-04-30 23:23:40', '2022-04-30 23:23:40', 1, 1),
(2, 'Office Rent Advance', 'office-rent-advance', 200000.00, 1, 0, 0.00, 36.00, 182.48, 'This is a note!', '', '2022-04-30', '2025-04-30', 1, '2022-04-30 23:25:27', '2022-04-30 23:25:27', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `asset_types`
--

CREATE TABLE `asset_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `asset_types`
--

INSERT INTO `asset_types` (`id`, `name`, `slug`, `note`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Furniture', 'furniture', '', 1, '2022-04-30 23:22:32', '2022-04-30 23:22:32'),
(2, 'Advance Payment', 'advance-payment', '', 1, '2022-04-30 23:22:54', '2022-04-30 23:22:54');

-- --------------------------------------------------------

--
-- Table structure for table `balance_tansfers`
--

CREATE TABLE `balance_tansfers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reason` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(12,2) NOT NULL,
  `date` date DEFAULT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `debit_id` bigint(20) UNSIGNED NOT NULL,
  `credit_id` bigint(20) UNSIGNED NOT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `balance_tansfers`
--

INSERT INTO `balance_tansfers` (`id`, `reason`, `slug`, `amount`, `date`, `note`, `status`, `created_at`, `updated_at`, `debit_id`, `credit_id`, `created_by`) VALUES
(1, 'Office Cash Transfer', 'office-cash-transfer', 20000.00, '2022-04-30', '', 1, '2022-04-30 16:27:56', '2022-04-30 16:27:56', 4, 5, 1),
(2, 'Regular Transfer', 'regular-transfer', 10000.00, '2022-04-30', '', 1, '2022-04-30 16:28:30', '2022-04-30 16:28:30', 6, 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `slug`, `code`, `image`, `note`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Hewlett-Packard', 'hewlett-packard', 'HP', '1651321208.png', '', 1, '2022-04-30 16:20:08', '2022-04-30 16:20:08'),
(2, 'Dell', 'dell', 'Dell', '1651321265.jpeg', '', 1, '2022-04-30 16:21:05', '2022-04-30 16:21:05');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `image_path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `name`, `client_id`, `slug`, `email`, `phone`, `company_name`, `address`, `status`, `image_path`, `created_at`, `updated_at`) VALUES
(1, 'Lila Fisher', '1', 'lila-fisher', 'lumunoj@mailinator.com', '+1 (199) 869-3106', 'Joyner Trading', 'Molestias veniam qu', 1, 'avatar.png', '2022-04-30 16:42:22', '2022-04-30 16:42:22'),
(2, 'Ruth Miles', '2', 'ruth-miles', 'diji@mailinator.com', '+1 (579) 416-3689', 'Woodard Traders', 'Dolores eiusmod Nam', 1, 'avatar.png', '2022-04-30 16:42:43', '2022-04-30 16:42:49'),
(3, 'Reed Montoya', '3', 'reed-montoya', 'cilegubapo@mailinator.com', '+1 (857) 968-5584', 'Petersen LLC', 'Consectetur est sed', 1, 'avatar.png', '2022-04-30 16:43:20', '2022-04-30 16:43:20'),
(4, 'Ciaran Buck', '4', 'ciaran-buck', 'becubahyfi@mailinator.com', '+1 (898) 921-8127', 'Ballard Rosa Plc', 'Aut odio natus ipsum', 1, 'avatar.png', '2022-04-30 16:43:40', '2022-04-30 16:43:40'),
(5, 'Troy Walker', '5', 'troy-walker', 'namygyjyxe@mailinator.com', '+1 (642) 971-4148', 'Velasquez Plc', 'Consequatur voluptat', 1, 'avatar.png', '2022-04-30 16:44:14', '2022-04-30 23:06:31');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `slug`, `code`, `symbol`, `position`, `note`, `status`, `created_at`, `updated_at`) VALUES
(1, 'United States Dollar', 'united-states-dollar', 'US Dollar', '$', 'left', 'This is default currency', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `slug`, `note`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Marketing', 'marketing', NULL, 1, '2022-04-30 23:17:28', '2022-04-30 23:17:28'),
(2, 'Sales', 'sales', NULL, 1, '2022-04-30 23:17:34', '2022-04-30 23:17:34');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `emp_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `designation` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `salary` double(12,2) DEFAULT NULL,
  `commission` double(12,2) DEFAULT NULL,
  `mobile_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birth_date` date DEFAULT NULL,
  `gender` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blood_group` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `religion` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `appointment_date` date DEFAULT NULL,
  `joining_date` date DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `image_path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `department_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `name`, `emp_id`, `slug`, `designation`, `salary`, `commission`, `mobile_number`, `birth_date`, `gender`, `blood_group`, `religion`, `appointment_date`, `joining_date`, `address`, `status`, `image_path`, `created_at`, `updated_at`, `department_id`, `user_id`) VALUES
(1, 'Whilemina Watts', '1', 'whilemina-watts', 'Sales Manager', 10000.00, 2.00, '017000000', '1990-08-07', 'Female', 'AB+', 'Christians', '2022-01-01', '2022-01-01', 'Dhaka, Bangladesh', 1, 'avatar.png', '2022-04-30 23:19:28', '2022-04-30 23:19:28', 2, 2),
(2, 'Paki Wolf', '2', 'paki-wolf', 'Marketing Manager', 8000.00, 9.00, '018000000', '1990-07-11', 'Male', 'B-', 'Buddhists', '2022-01-01', '2022-01-01', 'A eligendi et aut pr', 1, 'avatar.png', '2022-04-30 23:20:46', '2022-05-15 04:28:43', 1, 4),
(3, 'Mari Johns', '3', 'mari-johns', 'Salesman', 1000.00, 3.00, '017000000', '1990-09-11', 'Male', 'B+', 'Christians', '2022-02-01', '2022-02-01', 'Nulla quaerat aliqua', 1, '', '2022-05-14 08:14:40', '2022-05-14 08:14:40', 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reason` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date DEFAULT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `image_path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `sub_cat_id` bigint(20) UNSIGNED NOT NULL,
  `transaction_id` bigint(20) UNSIGNED NOT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `reason`, `slug`, `date`, `note`, `status`, `image_path`, `created_at`, `updated_at`, `sub_cat_id`, `transaction_id`, `created_by`) VALUES
(1, 'Sticky Notes Purchase', 'sticky-notes-purchase', '2022-04-30', 'Sticky Notes Purchase for office use', 1, '', '2022-04-30 16:29:48', '2022-04-30 16:29:48', 2, 8, 1),
(2, 'April Office Rent', 'april-office-rent', '2022-04-30', 'This is a note', 1, '', '2022-04-30 16:30:56', '2022-04-30 16:30:56', 1, 9, 1);

-- --------------------------------------------------------

--
-- Table structure for table `expense_categories`
--

CREATE TABLE `expense_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` int(11) DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expense_categories`
--

INSERT INTO `expense_categories` (`id`, `name`, `code`, `slug`, `note`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Rent', 1, 'rent', '', 1, '2022-04-30 16:21:29', '2022-04-30 16:21:29'),
(2, 'Stationary', 2, 'stationary', '', 1, '2022-04-30 16:22:12', '2022-04-30 16:22:12');

-- --------------------------------------------------------

--
-- Table structure for table `expense_sub_categories`
--

CREATE TABLE `expense_sub_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` int(11) DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `exp_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expense_sub_categories`
--

INSERT INTO `expense_sub_categories` (`id`, `name`, `code`, `slug`, `note`, `status`, `created_at`, `updated_at`, `exp_id`) VALUES
(1, 'Office Rent', 1, 'office-rent', '', 1, '2022-04-30 16:21:40', '2022-04-30 16:21:40', 1),
(2, 'Office Stationary', 2, 'office-stationary', '', 1, '2022-04-30 16:23:23', '2022-04-30 16:23:23', 2);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `general_settings`
--

CREATE TABLE `general_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `general_settings`
--

INSERT INTO `general_settings` (`id`, `key`, `display_name`, `value`, `created_at`, `updated_at`) VALUES
(1, 'company_name', 'Company Name', 'Acculance', NULL, NULL),
(2, 'company_tagline', 'Company Tagline', 'Ultimate Sales, Inventory, Accounting Management System', NULL, NULL),
(3, 'email_address', 'Email Address', 'support@codeshape.net', NULL, NULL),
(4, 'phone_number', 'Phone Number', '0170000000', NULL, NULL),
(5, 'address', 'Address', 'Ground Floor, Road# 24, House# 339, New DOHS, Mohakhali, Dhaka - 1206, Bangladesh', NULL, NULL),
(6, 'client_prefix', 'Client Prefix', 'AC', NULL, NULL),
(7, 'supplier_prefix', 'Supplier Prefix', 'AS', NULL, NULL),
(8, 'employee_prefix', 'Employee Prefix', 'AE', NULL, NULL),
(9, 'product_cat_prefix', 'Product Cat Prefix', 'APC', NULL, NULL),
(10, 'product_sub_cat_prefix', 'Product Sub Cat Prefix', 'APS', NULL, NULL),
(11, 'product_prefix', 'Product Prefix', 'AP', NULL, NULL),
(12, 'exp_cat_prefix', 'Exp Cat Prefix', 'AEC', NULL, NULL),
(13, 'exp_sub_cat_prefix', 'Exp Sub Cat Prefix', 'AES', NULL, NULL),
(14, 'pur_prefix', 'Pur Prefix', 'APP', NULL, NULL),
(15, 'pur_return_prefix', 'Pur Return Prefix', 'APR', NULL, NULL),
(16, 'quotation_prefix', 'Quotation Prefix', 'APQ', NULL, NULL),
(17, 'invoice_prefix', 'Invoice Prefix', 'AI', NULL, NULL),
(18, 'invoice_return_prefix', 'Invoice Return Prefix', 'AIR', NULL, NULL),
(19, 'adjustment_prefix', 'Adjustment Prefix', 'AIA', NULL, NULL),
(20, 'default_currency', 'Default Currency', '1', NULL, NULL),
(21, 'default_language', 'Default Language', 'en', NULL, NULL),
(22, 'logo', 'Logo', 'logo.png', NULL, NULL),
(23, 'logo_black', 'Logo Black', 'logo-black.png', NULL, NULL),
(24, 'small_logo', 'Small Logo', 'small-logo.png', NULL, NULL),
(25, 'favicon', 'Favicon', 'favicon.png', NULL, NULL),
(26, 'copyright', 'Copyright', 'Copyright', NULL, '2022-05-18 03:30:44');

-- --------------------------------------------------------

--
-- Table structure for table `inventory_adjustments`
--

CREATE TABLE `inventory_adjustments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reason` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `inventory_adjustments`
--

INSERT INTO `inventory_adjustments` (`id`, `reason`, `slug`, `code`, `date`, `note`, `status`, `created_at`, `updated_at`, `created_by`) VALUES
(1, 'Warehouse cleanup', 'warehouse-cleanup', 1, '2022-04-30', 'This is a note', 1, '2022-05-01 00:04:24', '2022-05-01 00:04:24', 1);

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transport` double(12,2) DEFAULT NULL,
  `discount_type` tinyint(1) DEFAULT NULL COMMENT '0 means fixed and 1 means percentage',
  `discount` double(12,2) DEFAULT NULL,
  `sub_total` double(12,2) DEFAULT NULL,
  `po_reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_terms` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_place` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_date` date DEFAULT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `is_paid` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `tax_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `invoice_no`, `slug`, `reference`, `transport`, `discount_type`, `discount`, `sub_total`, `po_reference`, `payment_terms`, `delivery_place`, `invoice_date`, `note`, `status`, `is_paid`, `created_at`, `updated_at`, `client_id`, `tax_id`, `created_by`) VALUES
(1, '1', '626d33293b3db', 'Reference-001', NULL, 0, NULL, 18725.00, 'PO Reference-1', 'Payment Terms-1', 'Dhaka, Bangladesh', '2022-01-05', 'This is a note!', 1, 0, '2022-04-30 17:01:29', '2022-04-30 17:01:29', 5, 2, 1),
(2, '2', '626d33af24fd8', 'Reference-002', NULL, 0, NULL, 18725.00, NULL, NULL, 'Dhaka, Bangladesh', '2022-02-10', 'This is a note!', 1, 0, '2022-04-30 17:03:43', '2022-04-30 17:03:43', 4, 2, 1),
(3, '3', '626d33d2aa232', 'Reference-003', NULL, 0, NULL, 18725.00, NULL, NULL, 'Dhaka, Bangladesh', '2022-03-12', 'This is a note!', 1, 0, '2022-04-30 17:04:18', '2022-04-30 17:04:18', 5, 2, 1),
(4, '4', '626d33fc734c9', 'Reference-001', NULL, 0, NULL, 18725.00, NULL, NULL, 'Dhaka, Bangladesh', '2022-04-15', 'This is a note!', 1, 0, '2022-04-30 17:05:00', '2022-04-30 17:05:00', 2, 2, 1),
(5, '5', '626d86a82bec0', 'Reference-0005', 500.00, 1, 561.75, 18725.00, 'PO Reference-0004', 'Payment Terms-0005', 'Dhaka, Bangladesh', '2022-04-30', 'This is a note!', 1, 0, '2022-04-30 22:57:44', '2022-04-30 22:57:44', 1, 1, 1),
(6, '6', '626d889de5502', 'Reference-006', NULL, 0, NULL, 37450.00, NULL, NULL, 'Dhaka', '2022-04-07', '', 1, 1, '2022-04-30 23:06:05', '2022-04-30 23:10:01', 3, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `invoice_payments`
--

CREATE TABLE `invoice_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(12,2) DEFAULT NULL,
  `discount` double(12,2) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `invoice_id` bigint(20) UNSIGNED NOT NULL,
  `transaction_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_payments`
--

INSERT INTO `invoice_payments` (`id`, `slug`, `amount`, `discount`, `date`, `note`, `status`, `created_at`, `updated_at`, `invoice_id`, `transaction_id`, `created_by`) VALUES
(1, '626d33294389d', 15000.00, NULL, '2022-01-05', 'This is a note!', 1, '2022-04-30 17:01:29', '2022-04-30 17:01:29', 1, 14, 1),
(2, '626d86a83b9db', 20000.00, NULL, '2022-04-30', 'This is a note!', 1, '2022-04-30 22:57:44', '2022-04-30 22:57:44', 5, 15, 1),
(3, '626d889df18b1', 35000.00, NULL, '2022-04-07', '', 1, '2022-04-30 23:06:05', '2022-04-30 23:06:05', 6, 16, 1);

-- --------------------------------------------------------

--
-- Table structure for table `invoice_products`
--

CREATE TABLE `invoice_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `quantity` double(12,2) DEFAULT NULL,
  `purchase_price` double(12,2) DEFAULT NULL,
  `sale_price` double(12,2) DEFAULT NULL,
  `unit_cost` double(12,2) DEFAULT NULL,
  `tax_amount` double(12,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `invoice_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_products`
--

INSERT INTO `invoice_products` (`id`, `quantity`, `purchase_price`, `sale_price`, `unit_cost`, `tax_amount`, `created_at`, `updated_at`, `invoice_id`, `product_id`) VALUES
(1, 5.00, 872.49, 950.00, 1045.00, 95.00, '2022-04-30 17:01:29', '2022-04-30 17:01:29', 1, 1),
(2, 5.00, 960.60, 1200.00, 1200.00, 109.09, '2022-04-30 17:01:29', '2022-04-30 17:01:29', 1, 2),
(3, 5.00, 1260.60, 1500.00, 1500.00, 0.00, '2022-04-30 17:01:29', '2022-04-30 17:01:29', 1, 3),
(4, 5.00, 872.49, 950.00, 1045.00, 95.00, '2022-04-30 17:03:43', '2022-04-30 17:03:43', 2, 1),
(5, 5.00, 960.60, 1200.00, 1200.00, 109.09, '2022-04-30 17:03:43', '2022-04-30 17:03:43', 2, 2),
(6, 5.00, 1260.60, 1500.00, 1500.00, 0.00, '2022-04-30 17:03:43', '2022-04-30 17:03:43', 2, 3),
(7, 5.00, 872.49, 950.00, 1045.00, 95.00, '2022-04-30 17:04:18', '2022-04-30 17:04:18', 3, 1),
(8, 5.00, 960.60, 1200.00, 1200.00, 109.09, '2022-04-30 17:04:18', '2022-04-30 17:04:18', 3, 2),
(9, 5.00, 1260.60, 1500.00, 1500.00, 0.00, '2022-04-30 17:04:18', '2022-04-30 17:04:18', 3, 3),
(10, 5.00, 872.49, 950.00, 1045.00, 95.00, '2022-04-30 17:05:00', '2022-04-30 17:05:00', 4, 1),
(11, 5.00, 960.60, 1200.00, 1200.00, 109.09, '2022-04-30 17:05:00', '2022-04-30 17:05:00', 4, 2),
(12, 5.00, 1260.60, 1500.00, 1500.00, 0.00, '2022-04-30 17:05:00', '2022-04-30 17:05:00', 4, 3),
(13, 5.00, 872.49, 950.00, 1045.00, 95.00, '2022-04-30 22:57:44', '2022-04-30 22:57:44', 5, 1),
(14, 5.00, 960.60, 1200.00, 1200.00, 109.09, '2022-04-30 22:57:44', '2022-04-30 22:57:44', 5, 2),
(15, 5.00, 1260.60, 1500.00, 1500.00, 0.00, '2022-04-30 22:57:44', '2022-04-30 22:57:44', 5, 3),
(16, 10.00, 877.85, 950.00, 1045.00, 95.00, '2022-04-30 23:06:05', '2022-04-30 23:06:05', 6, 1),
(17, 10.00, 953.03, 1200.00, 1200.00, 109.09, '2022-04-30 23:06:05', '2022-04-30 23:06:05', 6, 2),
(18, 10.00, 1145.89, 1500.00, 1500.00, 0.00, '2022-04-30 23:06:05', '2022-04-30 23:06:05', 6, 3);

-- --------------------------------------------------------

--
-- Table structure for table `invoice_returns`
--

CREATE TABLE `invoice_returns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `return_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reason` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_return` double(12,2) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `invoice_id` bigint(20) UNSIGNED NOT NULL,
  `transaction_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_returns`
--

INSERT INTO `invoice_returns` (`id`, `return_no`, `reason`, `slug`, `total_return`, `date`, `note`, `status`, `created_at`, `updated_at`, `invoice_id`, `transaction_id`, `created_by`) VALUES
(1, '1', 'Product Damage', 'product-damage', 3745.00, '2022-04-30', '', 1, '2022-04-30 23:08:14', '2022-04-30 23:08:14', 4, NULL, 1),
(2, '2', 'Product damage', 'product-damage-2', 11235.00, '2022-04-30', 'This is a note!', 1, '2022-04-30 23:10:01', '2022-04-30 23:10:01', 6, 17, 1);

-- --------------------------------------------------------

--
-- Table structure for table `invoice_return_products`
--

CREATE TABLE `invoice_return_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sale_price` double(12,2) DEFAULT NULL,
  `purchase_price` double(12,2) DEFAULT NULL,
  `quantity` double(12,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `return_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_return_products`
--

INSERT INTO `invoice_return_products` (`id`, `sale_price`, `purchase_price`, `quantity`, `created_at`, `updated_at`, `return_id`, `product_id`) VALUES
(1, 1045.00, 872.49, 1.00, '2022-04-30 23:08:14', '2022-04-30 23:08:14', 1, 1),
(2, 1200.00, 960.60, 1.00, '2022-04-30 23:08:14', '2022-04-30 23:08:14', 1, 2),
(3, 1500.00, 1260.60, 1.00, '2022-04-30 23:08:14', '2022-04-30 23:08:14', 1, 3),
(4, 1045.00, 877.85, 3.00, '2022-04-30 23:10:01', '2022-04-30 23:10:01', 2, 1),
(5, 1200.00, 953.03, 3.00, '2022-04-30 23:10:01', '2022-04-30 23:10:01', 2, 2),
(6, 1500.00, 1145.89, 3.00, '2022-04-30 23:10:01', '2022-04-30 23:10:01', 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `loans`
--

CREATE TABLE `loans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reason` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `loan_type` tinyint(1) DEFAULT NULL,
  `interest` double(12,2) DEFAULT NULL,
  `payable` double(12,2) DEFAULT NULL,
  `payment_type` tinyint(1) DEFAULT NULL COMMENT '0 is Daily 1 is Monthly and 2 is Yearly',
  `duration` tinyint(3) UNSIGNED DEFAULT NULL,
  `date` date DEFAULT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `is_paid` tinyint(1) DEFAULT '0',
  `image_path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `authority_id` bigint(20) UNSIGNED NOT NULL,
  `transaction_id` bigint(20) UNSIGNED NOT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `loans`
--

INSERT INTO `loans` (`id`, `reason`, `slug`, `reference_no`, `loan_type`, `interest`, `payable`, `payment_type`, `duration`, `date`, `note`, `status`, `is_paid`, `image_path`, `created_at`, `updated_at`, `authority_id`, `transaction_id`, `created_by`) VALUES
(1, 'business invest', 'dbbl-0001', 'DBBL-0001', 1, 8.00, 108545.52, 1, 24, '2022-02-01', '', 1, 0, '', '2022-04-30 23:52:01', '2022-04-30 23:52:01', 2, 24, 1),
(2, 'Business invest', 'ibbl-0001', 'IBBL-0001', 0, 0.00, 100000.00, 1, 0, '2022-03-09', '', 1, 0, '', '2022-04-30 23:52:35', '2022-04-30 23:53:06', 1, 25, 1);

-- --------------------------------------------------------

--
-- Table structure for table `loan_authorities`
--

CREATE TABLE `loan_authorities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cc_limit` decimal(14,2) DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `loan_authorities`
--

INSERT INTO `loan_authorities` (`id`, `name`, `slug`, `email`, `contact_number`, `cc_limit`, `address`, `note`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Islami Bank Bangladesh Ltd', 'islami-bank-bangladesh-ltd', 'ibbl@bank.com', '017000000', '10000000.00', 'Dhaka, Bangladesh', '', 1, '2022-04-30 23:14:42', '2022-04-30 23:14:42'),
(2, 'Dutch Bangla Bank', 'dutch-bangla-bank', 'dbbl@bank.com', '018000000', '10000000.00', 'Dhaka, Bangladesh', '', 1, '2022-04-30 23:15:10', '2022-04-30 23:15:10');

-- --------------------------------------------------------

--
-- Table structure for table `loan_payments`
--

CREATE TABLE `loan_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reference_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(12,2) DEFAULT NULL,
  `interest` double(12,2) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `image_path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `loan_id` bigint(20) UNSIGNED NOT NULL,
  `transaction_id` bigint(20) UNSIGNED NOT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `loan_payments`
--

INSERT INTO `loan_payments` (`id`, `reference_no`, `slug`, `amount`, `interest`, `date`, `note`, `status`, `image_path`, `created_at`, `updated_at`, `loan_id`, `transaction_id`, `created_by`) VALUES
(1, 'DBBL-PAYMENT-1', 'dbbl-payment-1', 4522.73, 356.06, '2022-01-28', NULL, 1, '', '2022-04-30 23:53:39', '2022-04-30 23:53:39', 1, 26, 1),
(2, 'DBBL-PAYMENT-2', 'dbbl-payment-2', 4522.73, 356.06, '2022-02-17', NULL, 1, '', '2022-04-30 23:54:08', '2022-04-30 23:54:08', 1, 27, 1),
(3, 'DBBL-PAYMENT-3', 'dbbl-payment-3', 4522.73, 356.06, '2022-02-17', NULL, 1, '', '2022-04-30 23:54:33', '2022-04-30 23:54:33', 1, 28, 1),
(4, 'DBBL-PAYMENT-4', 'dbbl-payment-4', 4522.73, 356.06, '2022-04-22', NULL, 1, '', '2022-04-30 23:54:52', '2022-04-30 23:54:52', 1, 29, 1);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2017_12_07_122845_create_oauth_providers_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2021_02_13_095716_create_roles_table', 1),
(6, '2021_02_13_102015_create_permissions_table', 1),
(7, '2021_02_13_104235_create_user_permission_table', 1),
(8, '2021_02_13_104245_create_user_role_table', 1),
(9, '2021_02_13_104407_create_role_permission_table', 1),
(10, '2021_02_13_104412_create_currencies_table', 1),
(11, '2021_02_13_104414_create_payment_methods_table', 1),
(12, '2021_02_13_104418_create_units_table', 1),
(13, '2021_02_13_104420_create_vat_rates_table', 1),
(14, '2021_02_13_104424_create_general_settings_table', 1),
(15, '2021_02_13_104428_create_brands_table', 1),
(16, '2021_02_13_104430_create_product_categories_table', 1),
(17, '2021_02_13_104432_create_product_sub_categories_table', 1),
(18, '2021_02_13_104434_create_products_table', 1),
(19, '2021_02_13_104437_create_accounts_table', 1),
(20, '2021_02_13_104439_create_account_transactions_table', 1),
(21, '2021_02_13_104440_create_balance_tansfers_table', 1),
(22, '2021_02_13_104442_create_asset_types_table', 1),
(23, '2021_02_13_104445_create_assets_table', 1),
(24, '2021_02_13_104480_create_expense_categories_table', 1),
(25, '2021_02_13_104485_create_expense_sub_categories_table', 1),
(26, '2021_02_13_104485_create_expenses_table', 1),
(27, '2021_02_13_104490_create_clients_table', 1),
(28, '2021_02_13_104495_create_suppliers_table', 1),
(29, '2021_03_03_080732_create_purchases_table', 1),
(30, '2021_03_03_080734_create_purchase_products_table', 1),
(31, '2021_03_03_080736_create_purchase_payments_table', 1),
(32, '2021_03_03_080750_create_purchase_returns_table', 1),
(33, '2021_03_03_080760_create_purchase_return_products_table', 1),
(34, '2021_03_10_085743_create_loan_authorities_table', 1),
(35, '2021_03_10_085748_create_loans_table', 1),
(36, '2021_03_10_085751_create_loan_payments_table', 1),
(37, '2021_03_10_191817_create_departments_table', 1),
(38, '2021_05_02_170213_create_employees_table', 1),
(39, '2021_05_03_120828_create_salary_increments_table', 1),
(40, '2021_05_05_145647_create_payrolls_table', 1),
(41, '2021_05_23_035457_create_quotations_table', 1),
(42, '2021_05_23_170721_create_quotation_products_table', 1),
(43, '2021_05_23_193319_create_invoices_table', 1),
(44, '2021_05_23_193527_create_invoice_products_table', 1),
(45, '2021_05_23_193535_create_invoice_payments_table', 1),
(46, '2021_05_24_114000_create_invoice_returns_table', 1),
(47, '2021_05_25_114159_create_invoice_return_products_table', 1),
(48, '2021_07_29_132545_create_inventory_adjustments_table', 1),
(49, '2021_07_29_133109_create_adjustment_products_table', 1),
(50, '2022_01_02_164016_create_non_invoice_payments_table', 1),
(51, '2022_01_02_164415_create_non_purchase_payments_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `non_invoice_payments`
--

CREATE TABLE `non_invoice_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(12,2) DEFAULT NULL,
  `type` tinyint(1) NOT NULL COMMENT '0 is Debit and 1 is Credit',
  `date` date DEFAULT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `transaction_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `non_invoice_payments`
--

INSERT INTO `non_invoice_payments` (`id`, `slug`, `amount`, `type`, `date`, `note`, `status`, `created_at`, `updated_at`, `client_id`, `transaction_id`, `created_by`) VALUES
(1, '626d89b69b881', 20000.00, 0, '2022-04-30', NULL, 1, '2022-04-30 23:10:46', '2022-04-30 23:10:46', 5, NULL, 1),
(2, '626d89cb3d5a2', 5000.00, 1, '2022-04-30', NULL, 1, '2022-04-30 23:11:07', '2022-04-30 23:11:07', 5, 18, 1),
(3, '626d89d4e7134', 30000.00, 0, '2022-04-30', NULL, 1, '2022-04-30 23:11:16', '2022-04-30 23:11:16', 4, NULL, 1),
(4, '626d89e7cf4c2', 10000.00, 1, '2022-04-30', NULL, 1, '2022-04-30 23:11:35', '2022-04-30 23:11:35', 4, 19, 1);

-- --------------------------------------------------------

--
-- Table structure for table `non_purchase_payments`
--

CREATE TABLE `non_purchase_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(12,2) DEFAULT NULL,
  `type` tinyint(1) NOT NULL COMMENT '0 is Debit and 1 is Credit',
  `date` date DEFAULT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `supplier_id` bigint(20) UNSIGNED NOT NULL,
  `transaction_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `non_purchase_payments`
--

INSERT INTO `non_purchase_payments` (`id`, `slug`, `amount`, `type`, `date`, `note`, `status`, `created_at`, `updated_at`, `supplier_id`, `transaction_id`, `created_by`) VALUES
(1, '626d8a3c9f0d2', 20000.00, 0, '2022-04-30', NULL, 1, '2022-04-30 23:13:00', '2022-04-30 23:13:00', 1, NULL, 1),
(2, '626d8a5278c92', 10000.00, 1, '2022-04-30', NULL, 1, '2022-04-30 23:13:22', '2022-04-30 23:13:22', 1, 20, 1),
(3, '626d8a5f74ca7', 15000.00, 0, '2022-04-30', NULL, 1, '2022-04-30 23:13:35', '2022-04-30 23:13:35', 2, NULL, 1),
(4, '626d8a78ece00', 5000.00, 1, '2022-04-30', 'This is a note!', 1, '2022-04-30 23:14:00', '2022-04-30 23:14:00', 2, 21, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_providers`
--

CREATE TABLE `oauth_providers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider_user_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `refresh_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `name`, `slug`, `code`, `note`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Cash Payment', 'cash-payment', 'Cash', NULL, 1, '2022-04-30 16:18:30', '2022-04-30 16:18:30'),
(2, 'Account Payment', 'account-payment', 'Account', NULL, 1, '2022-04-30 16:18:44', '2022-04-30 16:18:44'),
(3, 'Bank Transfer', 'bank-transfer', 'Bank Transfer', NULL, 1, '2022-04-30 16:18:54', '2022-04-30 16:18:54');

-- --------------------------------------------------------

--
-- Table structure for table `payrolls`
--

CREATE TABLE `payrolls` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `salary_month` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deduction_reason` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deduction_amount` double(12,2) DEFAULT NULL,
  `mobile_bill` double(12,2) DEFAULT NULL,
  `food_bill` double(12,2) DEFAULT NULL,
  `bonus` double(12,2) DEFAULT NULL,
  `commission` double(12,2) DEFAULT NULL,
  `advance` double(12,2) DEFAULT NULL,
  `festival_bonus` double(12,2) DEFAULT NULL,
  `travel_allowance` double(12,2) DEFAULT NULL,
  `others` double(12,2) DEFAULT NULL,
  `salary_date` date DEFAULT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `image_path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `transaction_id` bigint(20) UNSIGNED NOT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payrolls`
--

INSERT INTO `payrolls` (`id`, `slug`, `salary_month`, `deduction_reason`, `deduction_amount`, `mobile_bill`, `food_bill`, `bonus`, `commission`, `advance`, `festival_bonus`, `travel_allowance`, `others`, `salary_date`, `note`, `status`, `image_path`, `created_at`, `updated_at`, `employee_id`, `transaction_id`, `created_by`) VALUES
(1, '626d8d65958b3', 'February', NULL, NULL, 100.00, 100.00, 100.00, 100.00, 100.00, 100.00, 100.00, 100.00, '2022-04-30', 'This is a note', 1, '1651346789.png', '2022-04-30 23:26:29', '2022-04-30 23:26:29', 2, 22, 1),
(2, '626d8d819b8b9', 'February', NULL, NULL, 100.00, 100.00, 100.00, 100.00, 100.00, 100.00, 100.00, 100.00, '2022-04-30', NULL, 1, '', '2022-04-30 23:26:57', '2022-04-30 23:26:57', 1, 23, 1);

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Create', 'Expense Category Management', 'expense-category-create', NULL, NULL),
(2, 'List', 'Expense Category Management', 'expense-category-list', NULL, NULL),
(3, 'Edit', 'Expense Category Management', 'expense-category-edit', NULL, NULL),
(4, 'Delete', 'Expense Category Management', 'expense-category-delete', NULL, NULL),
(5, 'Create', 'Expense Subcategory Management', 'expense-sub-category-create', NULL, NULL),
(6, 'List', 'Expense Subcategory Management', 'expense-sub-category-list', NULL, NULL),
(7, 'Edit', 'Expense Subcategory Management', 'expense-sub-category-edit', NULL, NULL),
(8, 'Delete', 'Expense Subcategory Management', 'expense-sub-category-delete', NULL, NULL),
(9, 'Create', 'Expense Management', 'expense-create', NULL, NULL),
(10, 'List', 'Expense Management', 'expense-list', NULL, NULL),
(11, 'Edit', 'Expense Management', 'expense-edit', NULL, NULL),
(12, 'View', 'Expense Management', 'expense-view', NULL, NULL),
(13, 'Delete', 'Expense Management', 'expense-delete', NULL, '2022-05-15 03:21:37'),
(14, 'Create', 'Purchase Management', 'purchase-create', NULL, NULL),
(15, 'List', 'Purchase Management', 'purchase-list', NULL, NULL),
(16, 'Edit', 'Purchase Management', 'purchase-edit', NULL, NULL),
(17, 'View', 'Purchase Management', 'purchase-view', NULL, NULL),
(18, 'Delete', 'Purchase Management', 'purchase-delete', NULL, NULL),
(19, 'Create', 'Purchase Return Management', 'purchase-return-create', NULL, NULL),
(20, 'List', 'Purchase Return Management', 'purchase-return-list', NULL, NULL),
(21, 'Edit', 'Purchase Return Management', 'purchase-return-edit', NULL, NULL),
(22, 'View', 'Purchase Return Management', 'purchase-return-view', NULL, NULL),
(23, 'Delete', 'Purchase Return Management', 'purchase-return-delete', NULL, NULL),
(24, 'Create', 'Quotation Management', 'quotation-create', NULL, NULL),
(25, 'List', 'Quotation Management', 'quotation-list', NULL, NULL),
(26, 'Edit', 'Quotation Management', 'quotation-edit', NULL, NULL),
(27, 'View', 'Quotation Management', 'quotation-view', NULL, NULL),
(28, 'Delete', 'Quotation Management', 'quotation-delete', NULL, NULL),
(29, 'Quotation to Invoice', 'Quotation Management', 'quotation-to-invoice', NULL, NULL),
(30, 'Create', 'Invoice Management', 'invoice-create', NULL, NULL),
(31, 'List', 'Invoice Management', 'invoice-list', NULL, NULL),
(32, 'Edit', 'Invoice Management', 'invoice-edit', NULL, NULL),
(33, 'View', 'Invoice Management', 'invoice-view', NULL, NULL),
(34, 'Delete', 'Invoice Management', 'invoice-delete', NULL, NULL),
(35, 'Create', 'Invoice Return Management', 'invoice-return-create', NULL, NULL),
(36, 'List', 'Invoice Return Management', 'invoice-return-list', NULL, NULL),
(37, 'Edit', 'Invoice Return Management', 'invoice-return-edit', NULL, NULL),
(38, 'View', 'Invoice Return Management', 'invoice-return-view', NULL, NULL),
(39, 'Delete', 'Invoice Return Management', 'invoice-return-delete', NULL, NULL),
(40, 'Create', 'Account Management', 'account-create', NULL, NULL),
(41, 'List', 'Account Management', 'account-list', NULL, NULL),
(42, 'Edit', 'Account Management', 'account-edit', NULL, NULL),
(43, 'View', 'Account Management', 'account-view', NULL, NULL),
(44, 'Delete', 'Account Management', 'account-delete', NULL, NULL),
(45, 'Create', 'Account Balance Management', 'account-balance-create', NULL, NULL),
(46, 'List', 'Account Balance Management', 'account-balance-list', NULL, NULL),
(47, 'Edit', 'Account Balance Management', 'account-balance-edit', NULL, NULL),
(48, 'Delete', 'Account Balance Management', 'account-balance-delete', NULL, NULL),
(49, 'Create', 'Balance Transfer Management', 'account-transfer-balance-create', NULL, NULL),
(50, 'List', 'Balance Transfer Management', 'account-transfer-balance-list', NULL, NULL),
(51, 'Edit', 'Balance Transfer Management', 'account-transfer-balance-edit', NULL, NULL),
(52, 'View', 'Balance Transfer Management', 'account-transfer-balance-view', NULL, NULL),
(53, 'Delete', 'Balance Transfer Management', 'account-transfer-balance-delete', NULL, NULL),
(54, 'Create', 'Non Purchase Payment Management', 'non-purchase-payment-create', NULL, NULL),
(55, 'List', 'Non Purchase Payment Management', 'non-purchase-payment-list', NULL, NULL),
(56, 'Edit', 'Non Purchase Payment Management', 'non-purchase-payment-edit', NULL, NULL),
(57, 'View', 'Non Purchase Payment Management', 'non-purchase-payment-view', NULL, NULL),
(58, 'Delete', 'Non Purchase Payment Management', 'non-purchase-payment-delete', NULL, NULL),
(59, 'Create', 'Purchase Payment Management', 'purchase-payment-create', NULL, NULL),
(60, 'List', 'Purchase Payment Management', 'purchase-payment-list', NULL, NULL),
(61, 'Edit', 'Purchase Payment Management', 'purchase-payment-edit', NULL, NULL),
(62, 'View', 'Purchase Payment Management', 'purchase-payment-view', NULL, NULL),
(63, 'Delete', 'Purchase Payment Management', 'purchase-payment-delete', NULL, NULL),
(64, 'Create', 'Non Invoice Payment Management', 'non-invoice-payment-create', NULL, NULL),
(65, 'List', 'Non Invoice Payment Management', 'non-invoice-payment-list', NULL, NULL),
(66, 'Edit', 'Non Invoice Payment Management', 'non-invoice-payment-edit', NULL, NULL),
(67, 'View', 'Non Invoice Payment Management', 'non-invoice-payment-view', NULL, NULL),
(68, 'Delete', 'Non Invoice Payment Management', 'non-invoice-payment-delete', NULL, NULL),
(69, 'Create', 'Invoice Payment Management', 'invoice-payment-create', NULL, NULL),
(70, 'List', 'Invoice Payment Management', 'invoice-payment-list', NULL, NULL),
(71, 'Edit', 'Invoice Payment Management', 'invoice-payment-edit', NULL, NULL),
(72, 'View', 'Invoice Payment Management', 'invoice-payment-view', NULL, NULL),
(73, 'Delete', 'Invoice Payment Management', 'invoice-payment-delete', NULL, NULL),
(74, 'Create', 'Loan Authority Management', 'loan-authority-create', NULL, NULL),
(75, 'List', 'Loan Authority Management', 'loan-authority-list', NULL, NULL),
(76, 'Edit', 'Loan Authority Management', 'loan-authority-edit', NULL, NULL),
(77, 'View', 'Loan Authority Management', 'loan-authority-view', NULL, NULL),
(78, 'Delete', 'Loan Authority Management', 'loan-authority-delete', NULL, NULL),
(79, 'Create', 'Loan Management', 'loan-create', NULL, NULL),
(80, 'List', 'Loan Management', 'loan-list', NULL, NULL),
(81, 'Edit', 'Loan Management', 'loan-edit', NULL, NULL),
(82, 'View', 'Loan Management', 'loan-view', NULL, NULL),
(83, 'Delete', 'Loan Management', 'loan-delete', NULL, NULL),
(84, 'Create', 'Loan Payment Management', 'loan-payment-create', NULL, NULL),
(85, 'List', 'Loan Payment Management', 'loan-payment-list', NULL, NULL),
(86, 'Edit', 'Loan Payment Management', 'loan-payment-edit', NULL, NULL),
(87, 'View', 'Loan Payment Management', 'loan-payment-view', NULL, NULL),
(88, 'Delete', 'Loan Payment Management', 'loan-payment-delete', NULL, NULL),
(89, 'Create', 'Asset Type Management', 'asset-type-create', NULL, NULL),
(90, 'List', 'Asset Type Management', 'asset-type-list', NULL, NULL),
(91, 'Edit', 'Asset Type Management', 'asset-type-edit', NULL, NULL),
(92, 'Delete', 'Asset Type Management', 'asset-type-delete', NULL, NULL),
(93, 'Create', 'Asset Management', 'asset-create', NULL, NULL),
(94, 'List', 'Asset Management', 'asset-list', NULL, NULL),
(95, 'Edit', 'Asset Management', 'asset-edit', NULL, NULL),
(96, 'View', 'Asset Management', 'asset-view', NULL, NULL),
(97, 'Delete', 'Asset Management', 'asset-delete', NULL, NULL),
(98, 'Create', 'Payroll Management', 'payroll-create', NULL, NULL),
(99, 'List', 'Payroll Management', 'payroll-list', NULL, NULL),
(100, 'Edit', 'Payroll Management', 'payroll-edit', NULL, NULL),
(101, 'View', 'Payroll Management', 'payroll-view', NULL, NULL),
(102, 'Delete', 'Payroll Management', 'payroll-delete', NULL, NULL),
(103, 'Create', 'Client Management', 'client-create', NULL, NULL),
(104, 'List', 'Client Management', 'client-list', NULL, NULL),
(105, 'Edit', 'Client Management', 'client-edit', NULL, NULL),
(106, 'View', 'Client Management', 'client-view', NULL, NULL),
(107, 'Delete', 'Client Management', 'client-delete', NULL, NULL),
(108, 'Create', 'Supplier Management', 'supplier-create', NULL, NULL),
(109, 'List', 'Supplier Management', 'supplier-list', NULL, NULL),
(110, 'Edit', 'Supplier Management', 'supplier-edit', NULL, NULL),
(111, 'View', 'Supplier Management', 'supplier-view', NULL, NULL),
(112, 'Delete', 'Supplier Management', 'supplier-delete', NULL, NULL),
(113, 'Create', 'Department Management', 'department-create', NULL, NULL),
(114, 'List', 'Department Management', 'department-list', NULL, NULL),
(115, 'Edit', 'Department Management', 'department-edit', NULL, NULL),
(116, 'Delete', 'Department Management', 'department-delete', NULL, NULL),
(117, 'Create', 'Employee Management', 'employee-create', NULL, NULL),
(118, 'List', 'Employee Management', 'employee-list', NULL, NULL),
(119, 'Edit', 'Employee Management', 'employee-edit', NULL, NULL),
(120, 'View', 'Employee Management', 'employee-view', NULL, NULL),
(121, 'Delete', 'Employee Management', 'employee-delete', NULL, NULL),
(122, 'Create', 'Increment Management', 'increment-create', NULL, NULL),
(123, 'List', 'Increment Management', 'increment-list', NULL, NULL),
(124, 'Edit', 'Increment Management', 'increment-edit', NULL, NULL),
(125, 'View', 'Increment Management', 'increment-view', NULL, NULL),
(126, 'Delete', 'Increment Management', 'increment-delete', NULL, NULL),
(127, 'Create', 'Product Category Management', 'product-category-create', NULL, NULL),
(128, 'List', 'Product Category Management', 'product-category-list', NULL, NULL),
(129, 'Edit', 'Product Category Management', 'product-category-edit', NULL, NULL),
(130, 'Delete', 'Product Category Management', 'product-category-delete', NULL, NULL),
(131, 'Create', 'Product Subcategory Management', 'product-sub-category-create', NULL, NULL),
(132, 'List', 'Product Subcategory Management', 'product-sub-category-list', NULL, NULL),
(133, 'Edit', 'Product Subcategory Management', 'product-sub-category-edit', NULL, NULL),
(134, 'Delete', 'Product Subcategory Management', 'product-sub-category-delete', NULL, NULL),
(135, 'Create', 'Product Management', 'product-create', NULL, NULL),
(136, 'List', 'Product Management', 'product-list', NULL, NULL),
(137, 'Edit', 'Product Management', 'product-edit', NULL, NULL),
(138, 'View', 'Product Management', 'product-view', NULL, NULL),
(139, 'Delete', 'Product Management', 'product-delete', NULL, NULL),
(140, 'History', 'Inventory Management', 'inventory-history', NULL, NULL),
(141, 'View', 'Inventory Management', 'inventory-view', NULL, NULL),
(142, 'Create', 'Inventory Adjustment Management', 'adjustment-create', NULL, NULL),
(143, 'List', 'Inventory Adjustment Management', 'adjustment-list', NULL, NULL),
(144, 'Edit', 'Inventory Adjustment Management', 'adjustment-edit', NULL, NULL),
(145, 'View', 'Inventory Adjustment Management', 'adjustment-view', NULL, NULL),
(146, 'Delete', 'Inventory Adjustment Management', 'adjustment-delete', NULL, NULL),
(147, 'Print Barcode', 'Extra Management', 'print-barcode', NULL, NULL),
(148, 'Transaction History', 'Extra Management', 'transaction-history', NULL, NULL),
(149, 'Database Backup', 'Extra Management', 'database-backup', NULL, NULL),
(150, 'Update Profile', 'Extra Management', 'update-profile', NULL, NULL),
(151, 'Balance Sheet', 'Report View', 'balance-sheet', NULL, NULL),
(152, 'Summary Report', 'Report View', 'summary-report', NULL, NULL),
(153, 'Profit/Loss', 'Report View', 'profit-loss', NULL, NULL),
(154, 'Expense Report', 'Report View', 'expense-report', NULL, NULL),
(155, 'Item Report', 'Report View', 'item-report', NULL, NULL),
(156, 'Inventory Report', 'Report View', 'inventory-report', NULL, NULL),
(157, 'General settings', 'Setup', 'general-settings', NULL, NULL),
(158, 'Permissions management', 'Setup', 'user-permission', NULL, NULL),
(159, 'Roles Management', 'Setup', 'user-role', NULL, NULL),
(160, 'Units management', 'Setup', 'units-management', NULL, NULL),
(161, 'Currencies Management', 'Setup', 'currencies-management', NULL, NULL),
(162, 'Brands Management', 'Setup', 'brands-management', NULL, NULL),
(163, 'Payment Method Management', 'Setup', 'payment-method-management', NULL, NULL),
(164, 'VAT Rate Management', 'Setup', 'vat-rate-management', NULL, NULL),
(165, 'Account Summery', 'Dashboard View', 'account-summery', NULL, NULL),
(166, 'Top Selling Products', 'Dashboard View', 'top-selling-products', NULL, NULL),
(167, 'Recent Activities', 'Dashboard View', 'recent-activities', NULL, NULL),
(168, 'Payment Sent vs Payment Received', 'Dashboard View', 'payment-sent-vs-payment-received', NULL, NULL),
(169, 'Top Clients', 'Dashboard View', 'top-clients', NULL, NULL),
(170, 'Stock Alert', 'Dashboard View', 'stock-alert', NULL, NULL),
(171, 'Sales vs Purchases', 'Dashboard View', 'sales-vs-purchases', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `barcode_symbology` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_price` double(12,2) DEFAULT NULL,
  `regular_price` double(12,2) DEFAULT NULL,
  `discount` double(5,2) DEFAULT NULL,
  `inventory_count` double(12,2) DEFAULT NULL,
  `alert_qty` tinyint(3) UNSIGNED DEFAULT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `image_path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `sub_cat_id` bigint(20) UNSIGNED NOT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `unit_id` bigint(20) UNSIGNED DEFAULT NULL,
  `tax_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `code`, `model`, `barcode_symbology`, `tax_type`, `purchase_price`, `regular_price`, `discount`, `inventory_count`, `alert_qty`, `note`, `status`, `image_path`, `created_at`, `updated_at`, `sub_cat_id`, `brand_id`, `unit_id`, `tax_id`) VALUES
(1, 'Pentium Silver N5030 15.6\"', 'pentium-silver-n5030-15-6-hd-laptop', '000001', 'HP 15s-du1117TU', 'CODE128', 'Exclusive', 877.85, 1000.00, 5.00, 22.00, 10, '', 1, 'product-01.jpeg', '2022-04-30 16:47:47', '2022-04-30 23:10:01', 1, 1, 1, 2),
(2, 'Celeron Silver N5030 15.6\"', 'pentium-silver-n5030-15-6', '000002', 'HP 15s-du1116TU', 'CODE128', 'Inclusive', 953.03, 1200.00, NULL, 21.00, 10, '', 1, 'product-02.jpeg', '2022-04-30 16:48:46', '2022-05-01 00:04:24', 1, 1, 1, 2),
(3, 'Inspiron 15 3510 Intel Celeron', 'inspiron-15-3510-intel-celeron', '000003', 'Inspiron-3510', 'CODE128', 'Exclusive', 1145.89, 1500.00, NULL, 23.00, 10, '', 1, 'product-03.jpeg', '2022-04-30 16:51:07', '2022-05-01 00:04:24', 1, 2, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` int(11) DEFAULT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`id`, `name`, `slug`, `code`, `note`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Electronics', 'electronics', 1, NULL, 1, '2022-04-30 16:45:59', '2022-04-30 16:45:59'),
(2, 'Accessories', 'accessories', 2, NULL, 1, '2022-04-30 16:46:12', '2022-04-30 16:46:12');

-- --------------------------------------------------------

--
-- Table structure for table `product_sub_categories`
--

CREATE TABLE `product_sub_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` int(11) DEFAULT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cat_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_sub_categories`
--

INSERT INTO `product_sub_categories` (`id`, `name`, `slug`, `code`, `note`, `status`, `created_at`, `updated_at`, `cat_id`) VALUES
(1, 'Laptop', 'laptop', 1, '', 1, '2022-04-30 16:46:30', '2022-04-30 16:46:30', 1),
(2, 'Mobile', 'mobile', 2, '', 1, '2022-04-30 16:46:41', '2022-04-30 16:46:41', 1);

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` double(12,2) DEFAULT NULL,
  `transport` double(12,2) DEFAULT NULL,
  `sub_total` double(12,2) DEFAULT NULL,
  `po_reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_terms` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `po_date` date DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `is_paid` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `supplier_id` bigint(20) UNSIGNED NOT NULL,
  `tax_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`id`, `purchase_no`, `slug`, `discount`, `transport`, `sub_total`, `po_reference`, `payment_terms`, `po_date`, `purchase_date`, `note`, `status`, `is_paid`, `created_at`, `updated_at`, `supplier_id`, `tax_id`, `created_by`) VALUES
(1, '1', '626d3115d5c23', 500.00, 1000.00, 29800.00, 'PO Reference-1', 'Payment Terms-1', '2022-04-30', '2022-01-01', 'This is a note!', 1, 0, '2022-04-30 16:52:37', '2022-04-30 16:58:16', 5, 2, 1),
(2, '2', '626d316b7bdd0', NULL, NULL, 29800.00, 'PO Reference-2', 'Payment Terms-2', '2022-04-30', '2022-02-01', 'This is a note!', 1, 1, '2022-04-30 16:54:03', '2022-04-30 16:59:28', 4, 2, 1),
(3, '3', '626d31d82a276', 200.00, 500.00, 31250.00, 'PO Reference-3', 'Payment Terms-3', '2022-04-30', '2022-03-01', 'This is a  note!', 1, 1, '2022-04-30 16:55:52', '2022-04-30 16:56:08', 3, 2, 1),
(4, '4', '626d321b0a902', NULL, NULL, 31377.50, 'PO Reference-4', 'Payment Terms-4', '2022-04-30', '2022-04-30', '', 1, 1, '2022-04-30 16:56:59', '2022-04-30 16:56:59', 2, 3, 1),
(5, '5', '626d873f389ac', NULL, NULL, 58600.00, NULL, NULL, '2022-04-30', '2022-04-20', '', 1, 0, '2022-04-30 23:00:15', '2022-04-30 23:00:15', 2, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `purchase_payments`
--

CREATE TABLE `purchase_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(12,2) DEFAULT NULL,
  `discount` double(12,2) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `purchase_id` bigint(20) UNSIGNED NOT NULL,
  `transaction_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_payments`
--

INSERT INTO `purchase_payments` (`id`, `slug`, `amount`, `discount`, `date`, `note`, `status`, `purchase_id`, `transaction_id`, `created_by`, `created_at`, `updated_at`) VALUES
(1, '626d316b863fe', 25000.00, NULL, '2022-02-01', 'This is a note!', 1, 2, 10, 1, '2022-04-30 16:54:03', '2022-04-30 16:54:03'),
(2, '626d31d837a1b', 30000.00, NULL, '2022-04-30', 'This is a  note!', 1, 3, 11, 1, '2022-04-30 16:55:52', '2022-04-30 16:55:52'),
(3, '626d321b0f5d2', 31377.50, NULL, '2022-04-30', '', 1, 4, 12, 1, '2022-04-30 16:56:59', '2022-04-30 16:56:59');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_products`
--

CREATE TABLE `purchase_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `quantity` double(12,2) DEFAULT NULL,
  `purchase_price` double(12,2) DEFAULT NULL,
  `unit_cost` double(12,2) DEFAULT NULL,
  `tax_amount` double(12,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `purchase_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_products`
--

INSERT INTO `purchase_products` (`id`, `quantity`, `purchase_price`, `unit_cost`, `tax_amount`, `created_at`, `updated_at`, `purchase_id`, `product_id`) VALUES
(6, 10.00, 1200.00, 1200.00, 0.00, '2022-04-30 16:52:51', '2022-04-30 16:52:51', 1, 3),
(5, 10.00, 900.00, 900.00, 81.82, '2022-04-30 16:52:51', '2022-04-30 16:52:51', 1, 2),
(4, 10.00, 800.00, 880.00, 80.00, '2022-04-30 16:52:51', '2022-04-30 16:52:51', 1, 1),
(7, 10.00, 800.00, 880.00, 80.00, '2022-04-30 16:54:03', '2022-04-30 16:54:03', 2, 1),
(8, 10.00, 900.00, 900.00, 81.82, '2022-04-30 16:54:03', '2022-04-30 16:54:03', 2, 2),
(9, 10.00, 1200.00, 1200.00, 0.00, '2022-04-30 16:54:03', '2022-04-30 16:54:03', 2, 3),
(15, 10.00, 1300.00, 1300.00, 0.00, '2022-04-30 16:56:08', '2022-04-30 16:56:08', 3, 3),
(14, 10.00, 1000.00, 1000.00, 90.91, '2022-04-30 16:56:08', '2022-04-30 16:56:08', 3, 2),
(13, 10.00, 750.00, 825.00, 75.00, '2022-04-30 16:56:08', '2022-04-30 16:56:08', 3, 1),
(16, 10.00, 852.50, 937.75, 85.25, '2022-04-30 16:56:59', '2022-04-30 16:56:59', 4, 1),
(17, 10.00, 950.00, 950.00, 86.36, '2022-04-30 16:56:59', '2022-04-30 16:56:59', 4, 2),
(18, 10.00, 1250.00, 1250.00, 0.00, '2022-04-30 16:56:59', '2022-04-30 16:56:59', 4, 3),
(19, 20.00, 800.00, 880.00, 80.00, '2022-04-30 23:00:15', '2022-04-30 23:00:15', 5, 1),
(20, 20.00, 950.00, 950.00, 86.36, '2022-04-30 23:00:15', '2022-04-30 23:00:15', 5, 2),
(21, 20.00, 1100.00, 1100.00, 0.00, '2022-04-30 23:00:15', '2022-04-30 23:00:15', 5, 3);

-- --------------------------------------------------------

--
-- Table structure for table `purchase_returns`
--

CREATE TABLE `purchase_returns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reason` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` int(11) DEFAULT NULL,
  `total_return` double(12,2) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `purchase_id` bigint(20) UNSIGNED NOT NULL,
  `transaction_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_returns`
--

INSERT INTO `purchase_returns` (`id`, `reason`, `slug`, `code`, `total_return`, `date`, `note`, `status`, `created_at`, `updated_at`, `purchase_id`, `transaction_id`, `created_by`) VALUES
(1, 'Broken product', 'product-expired', 1, 5960.00, '2022-04-30', 'This is a note!', 1, '2022-04-30 16:58:16', '2022-04-30 16:58:43', 1, NULL, 1),
(2, 'Damage product', 'damage-product', 2, 14900.00, '2022-04-30', 'This is a note!', 1, '2022-04-30 16:59:28', '2022-04-30 16:59:28', 2, 13, 1);

-- --------------------------------------------------------

--
-- Table structure for table `purchase_return_products`
--

CREATE TABLE `purchase_return_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_price` double(12,2) DEFAULT NULL,
  `quantity` double(12,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `return_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_return_products`
--

INSERT INTO `purchase_return_products` (`id`, `purchase_price`, `quantity`, `created_at`, `updated_at`, `return_id`, `product_id`) VALUES
(6, 880.00, 2.00, '2022-04-30 16:58:43', '2022-04-30 16:58:43', 1, 1),
(5, 900.00, 2.00, '2022-04-30 16:58:43', '2022-04-30 16:58:43', 1, 2),
(4, 1200.00, 2.00, '2022-04-30 16:58:43', '2022-04-30 16:58:43', 1, 3),
(7, 880.00, 5.00, '2022-04-30 16:59:28', '2022-04-30 16:59:28', 2, 1),
(8, 900.00, 5.00, '2022-04-30 16:59:28', '2022-04-30 16:59:28', 2, 2),
(9, 1200.00, 5.00, '2022-04-30 16:59:28', '2022-04-30 16:59:28', 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `quotations`
--

CREATE TABLE `quotations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `quotation_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transport` double(12,2) DEFAULT NULL,
  `discount_type` tinyint(1) DEFAULT NULL COMMENT '0 means fixed and 1 means percentage',
  `discount` double(12,2) DEFAULT NULL,
  `total_tax` double(12,2) DEFAULT NULL,
  `sub_total` double(12,2) DEFAULT NULL,
  `po_reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_terms` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_place` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quotation_date` date DEFAULT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `tax_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quotations`
--

INSERT INTO `quotations` (`id`, `quotation_no`, `slug`, `reference`, `transport`, `discount_type`, `discount`, `total_tax`, `sub_total`, `po_reference`, `payment_terms`, `delivery_place`, `quotation_date`, `note`, `status`, `created_at`, `updated_at`, `client_id`, `tax_id`, `created_by`) VALUES
(1, '1', '626d32f19370e', 'Reference-001', NULL, 0, NULL, 1872.50, 18725.00, NULL, NULL, 'Dhaka, Bangladesh', '2022-04-30', 'This is a note!', 1, '2022-04-30 17:00:33', '2022-04-30 17:00:33', 5, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `quotation_products`
--

CREATE TABLE `quotation_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `quantity` double(12,2) DEFAULT NULL,
  `purchase_price` double(12,2) DEFAULT NULL,
  `sale_price` double(12,2) DEFAULT NULL,
  `unit_cost` double(12,2) DEFAULT NULL,
  `tax_amount` double(12,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `quotation_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `quotation_products`
--

INSERT INTO `quotation_products` (`id`, `quantity`, `purchase_price`, `sale_price`, `unit_cost`, `tax_amount`, `created_at`, `updated_at`, `quotation_id`, `product_id`) VALUES
(1, 5.00, 872.49, 950.00, 1045.00, 95.00, '2022-04-30 17:00:33', '2022-04-30 17:00:33', 1, 1),
(2, 5.00, 960.60, 1200.00, 1200.00, 109.09, '2022-04-30 17:00:33', '2022-04-30 17:00:33', 1, 2),
(3, 5.00, 1260.60, 1500.00, 1500.00, 0.00, '2022-04-30 17:00:33', '2022-04-30 17:00:33', 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Developer', 'developer', NULL, NULL),
(2, 'Super Admin', 'super-admin', NULL, NULL),
(3, 'Manager', 'manager', '2022-04-30 16:14:14', '2022-04-30 16:14:14'),
(4, 'Salesman', 'salesman', '2022-05-14 08:11:36', '2022-05-14 08:11:36');

-- --------------------------------------------------------

--
-- Table structure for table `role_permission`
--

CREATE TABLE `role_permission` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `permission_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_permission`
--

INSERT INTO `role_permission` (`role_id`, `permission_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(1, 13),
(1, 14),
(1, 15),
(1, 16),
(1, 17),
(1, 18),
(1, 19),
(1, 20),
(1, 21),
(1, 22),
(1, 23),
(1, 24),
(1, 25),
(1, 26),
(1, 27),
(1, 28),
(1, 29),
(1, 30),
(1, 31),
(1, 32),
(1, 33),
(1, 34),
(1, 35),
(1, 36),
(1, 37),
(1, 38),
(1, 39),
(1, 40),
(1, 41),
(1, 42),
(1, 43),
(1, 44),
(1, 45),
(1, 46),
(1, 47),
(1, 48),
(1, 49),
(1, 50),
(1, 51),
(1, 52),
(1, 53),
(1, 54),
(1, 55),
(1, 56),
(1, 57),
(1, 58),
(1, 59),
(1, 60),
(1, 61),
(1, 62),
(1, 63),
(1, 64),
(1, 65),
(1, 66),
(1, 67),
(1, 68),
(1, 69),
(1, 70),
(1, 71),
(1, 72),
(1, 73),
(1, 74),
(1, 75),
(1, 76),
(1, 77),
(1, 78),
(1, 79),
(1, 80),
(1, 81),
(1, 82),
(1, 83),
(1, 84),
(1, 85),
(1, 86),
(1, 87),
(1, 88),
(1, 89),
(1, 90),
(1, 91),
(1, 92),
(1, 93),
(1, 94),
(1, 95),
(1, 96),
(1, 97),
(1, 98),
(1, 99),
(1, 100),
(1, 101),
(1, 102),
(1, 103),
(1, 104),
(1, 105),
(1, 106),
(1, 107),
(1, 108),
(1, 109),
(1, 110),
(1, 111),
(1, 112),
(1, 113),
(1, 114),
(1, 115),
(1, 116),
(1, 117),
(1, 118),
(1, 119),
(1, 120),
(1, 121),
(1, 122),
(1, 123),
(1, 124),
(1, 125),
(1, 126),
(1, 127),
(1, 128),
(1, 129),
(1, 130),
(1, 131),
(1, 132),
(1, 133),
(1, 134),
(1, 135),
(1, 136),
(1, 137),
(1, 138),
(1, 139),
(1, 140),
(1, 141),
(1, 142),
(1, 143),
(1, 144),
(1, 145),
(1, 146),
(1, 147),
(1, 148),
(1, 149),
(1, 150),
(1, 151),
(1, 152),
(1, 153),
(1, 154),
(1, 155),
(1, 156),
(1, 157),
(1, 158),
(1, 159),
(1, 160),
(1, 161),
(1, 162),
(1, 163),
(1, 164),
(1, 165),
(1, 166),
(1, 167),
(1, 168),
(1, 169),
(1, 170),
(1, 171),
(2, 171),
(2, 170),
(2, 169),
(2, 168),
(2, 167),
(2, 166),
(2, 165),
(2, 164),
(2, 163),
(2, 162),
(2, 161),
(2, 160),
(2, 159),
(2, 158),
(2, 157),
(2, 156),
(2, 155),
(2, 154),
(2, 153),
(2, 152),
(2, 151),
(2, 150),
(2, 149),
(2, 148),
(2, 147),
(2, 145),
(2, 144),
(2, 143),
(2, 142),
(2, 141),
(2, 140),
(2, 138),
(2, 137),
(2, 136),
(2, 135),
(2, 133),
(2, 132),
(2, 131),
(2, 130),
(2, 129),
(2, 128),
(2, 127),
(2, 125),
(2, 124),
(2, 123),
(2, 122),
(2, 120),
(2, 119),
(2, 118),
(2, 117),
(2, 115),
(2, 114),
(2, 113),
(2, 111),
(2, 110),
(2, 109),
(2, 108),
(2, 106),
(2, 105),
(2, 104),
(2, 103),
(2, 101),
(2, 100),
(2, 99),
(2, 98),
(2, 96),
(2, 95),
(2, 94),
(2, 93),
(2, 91),
(2, 90),
(2, 89),
(2, 87),
(2, 86),
(2, 85),
(2, 84),
(2, 82),
(2, 81),
(2, 80),
(2, 79),
(2, 77),
(2, 76),
(2, 75),
(2, 74),
(2, 72),
(2, 71),
(2, 70),
(2, 69),
(2, 67),
(2, 66),
(2, 65),
(2, 64),
(2, 62),
(2, 61),
(2, 60),
(2, 59),
(2, 57),
(2, 56),
(2, 55),
(2, 54),
(2, 52),
(2, 51),
(2, 50),
(2, 49),
(2, 47),
(2, 46),
(2, 45),
(2, 43),
(2, 42),
(2, 41),
(2, 40),
(2, 38),
(2, 37),
(2, 36),
(2, 35),
(2, 33),
(2, 32),
(2, 31),
(2, 30),
(2, 29),
(2, 27),
(2, 26),
(2, 25),
(2, 24),
(2, 22),
(2, 21),
(2, 20),
(2, 19),
(2, 17),
(2, 16),
(2, 15),
(2, 14),
(2, 12),
(2, 11),
(2, 10),
(2, 9),
(2, 7),
(2, 6),
(2, 5),
(2, 3),
(2, 2),
(2, 1),
(3, 171),
(3, 170),
(3, 169),
(3, 168),
(3, 167),
(3, 166),
(3, 165),
(3, 164),
(3, 163),
(3, 162),
(3, 161),
(3, 160),
(3, 159),
(3, 158),
(3, 157),
(3, 156),
(3, 155),
(3, 154),
(3, 153),
(3, 152),
(3, 151),
(3, 150),
(3, 149),
(3, 148),
(3, 147),
(3, 145),
(3, 144),
(3, 143),
(3, 142),
(3, 141),
(3, 140),
(3, 138),
(3, 137),
(3, 136),
(3, 135),
(3, 133),
(3, 132),
(3, 131),
(3, 129),
(3, 128),
(3, 127),
(3, 125),
(3, 124),
(3, 123),
(3, 122),
(3, 120),
(3, 119),
(3, 118),
(3, 117),
(3, 115),
(3, 114),
(3, 113),
(3, 111),
(3, 110),
(3, 109),
(3, 108),
(3, 106),
(3, 105),
(3, 104),
(3, 103),
(3, 101),
(3, 100),
(3, 99),
(3, 98),
(3, 96),
(3, 95),
(3, 94),
(3, 93),
(3, 91),
(3, 90),
(3, 89),
(3, 87),
(3, 86),
(3, 85),
(3, 84),
(3, 82),
(3, 81),
(3, 80),
(3, 79),
(3, 77),
(3, 76),
(3, 75),
(3, 74),
(3, 72),
(3, 71),
(3, 70),
(3, 69),
(3, 67),
(3, 66),
(3, 65),
(3, 64),
(3, 62),
(3, 61),
(3, 60),
(3, 59),
(3, 57),
(3, 56),
(3, 55),
(3, 54),
(3, 52),
(3, 51),
(3, 50),
(3, 49),
(3, 47),
(3, 46),
(3, 45),
(3, 43),
(3, 42),
(3, 41),
(3, 40),
(3, 38),
(3, 37),
(3, 36),
(3, 35),
(3, 33),
(3, 32),
(3, 31),
(3, 30),
(3, 29),
(3, 27),
(3, 26),
(3, 25),
(3, 24),
(3, 22),
(3, 21),
(3, 20),
(3, 19),
(3, 17),
(3, 16),
(3, 15),
(3, 14),
(3, 12),
(3, 11),
(3, 10),
(3, 9),
(3, 7),
(3, 6),
(3, 5),
(3, 3),
(3, 2),
(3, 1),
(4, 171),
(4, 170),
(4, 169),
(4, 168),
(4, 167),
(4, 166),
(4, 165),
(4, 163),
(4, 162),
(4, 160),
(4, 156),
(4, 155),
(4, 154),
(4, 150),
(4, 148),
(4, 147),
(4, 145),
(4, 144),
(4, 143),
(4, 142),
(4, 141),
(4, 140),
(4, 138),
(4, 137),
(4, 136),
(4, 135),
(4, 133),
(4, 132),
(4, 131),
(4, 129),
(4, 128),
(4, 127),
(4, 125),
(4, 124),
(4, 123),
(4, 122),
(4, 120),
(4, 119),
(4, 118),
(4, 117),
(4, 111),
(4, 110),
(4, 109),
(4, 108),
(4, 105),
(4, 104),
(4, 103),
(4, 93),
(4, 73),
(4, 72),
(4, 71),
(4, 70),
(4, 69),
(4, 67),
(4, 66),
(4, 65),
(4, 64),
(4, 62),
(4, 61),
(4, 60),
(4, 59),
(4, 58),
(4, 57),
(4, 56),
(4, 55),
(4, 54),
(4, 43),
(4, 42),
(4, 41),
(4, 40),
(4, 38),
(4, 37),
(4, 36),
(4, 35),
(4, 33),
(4, 32),
(4, 31),
(4, 30),
(4, 29),
(4, 27),
(4, 26),
(4, 25),
(4, 24),
(4, 22),
(4, 21),
(4, 20),
(4, 19),
(4, 17),
(4, 16),
(4, 15),
(4, 14),
(4, 12),
(4, 11),
(4, 10),
(4, 9),
(4, 7),
(4, 6),
(4, 5),
(4, 3),
(4, 2),
(4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `salary_increments`
--

CREATE TABLE `salary_increments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reason` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `increment_amount` double(12,2) DEFAULT NULL,
  `increment_date` date DEFAULT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `empolyee_id` bigint(20) UNSIGNED NOT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `salary_increments`
--

INSERT INTO `salary_increments` (`id`, `reason`, `slug`, `increment_amount`, `increment_date`, `note`, `status`, `created_at`, `updated_at`, `empolyee_id`, `created_by`) VALUES
(1, 'Good performance', 'good-performance', 1500.00, '2022-04-30', NULL, 1, '2022-04-30 23:21:23', '2022-04-30 23:21:23', 1, 1),
(2, 'Good performance', 'good-performance-2', 1000.00, '2022-04-30', NULL, 1, '2022-04-30 23:21:39', '2022-04-30 23:21:39', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `supplier_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `image_path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `slug`, `supplier_id`, `email`, `phone`, `company_name`, `address`, `status`, `image_path`, `created_at`, `updated_at`) VALUES
(1, 'Yvonne Melendez', 'yvonne-melendez', '1', 'novuty@mailinator.com', '+1 (654) 921-9435', 'Newton Traders', 'Et deleniti alias do', 1, 'avatar.png', '2022-04-30 16:39:34', '2022-04-30 16:39:34'),
(2, 'Carla Bender', 'carla-bender', '2', 'xabexived@mailinator.com', '+1 (546) 502-6344', 'Richardson Inc', 'Eos perferendis aut', 1, 'avatar.png', '2022-04-30 16:40:00', '2022-04-30 16:40:00'),
(3, 'Quyn Erickson', 'quyn-erickson', '3', 'qihykiwos@mailinator.com', '+1 (951) 281-5524', 'Johns & Mcneil Co', 'Reprehenderit et lib', 1, 'avatar.png', '2022-04-30 16:40:26', '2022-04-30 16:40:26'),
(4, 'Amir Vega', 'amir-vega', '4', 'birevagiv@mailinator.com', '+1 (115) 102-4307', 'Huber Associates', 'Omnis adipisicing od', 1, 'avatar.png', '2022-04-30 16:40:47', '2022-04-30 16:40:55'),
(5, 'Jemima Hoffman', 'jemima-hoffman', '5', 'hafyryhica@mailinator.com', '+1 (403) 725-6412', 'Lawrence Plc', 'Voluptatibus esse ex', 1, 'avatar.png', '2022-04-30 16:41:35', '2022-04-30 16:41:35');

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `name`, `slug`, `code`, `note`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Piece', 'piece', 'Pcs', NULL, 1, '2022-04-30 16:16:48', '2022-04-30 16:18:07'),
(2, '12 Pcs', '12-pcs', 'Pack', NULL, 1, '2022-04-30 16:17:43', '2022-04-30 16:17:43');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_role` tinyint(4) NOT NULL DEFAULT '1',
  `is_active` tinyint(4) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `account_role`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'superadmin@acculance.com', '2022-04-30 16:13:36', '$2y$10$m.UuOomrzepx2oWcTxzhv.bfzyH4nPqEO7VoNgxK3xIpMyqzTm4uy', NULL, 1, 1, NULL, NULL),
(2, 'Whilemina Watts', 'rura@mailinator.com', NULL, '$2y$10$jn0Si9GEEspQCwBtK1U19e398DDfSw0Iq/UrOobFj1XY9sfn8/R9q', NULL, 0, 1, '2022-04-30 23:19:28', '2022-04-30 23:19:28'),
(3, 'Mari Johns', 'sales@acculance.com', NULL, '$2y$10$PuLuGojoP6frvUXjxWGHPegTk.ayyeIC0aBWLGS5ST.k1Chby9TPK', NULL, 0, 1, '2022-05-14 08:14:40', '2022-05-14 08:14:40'),
(4, 'Paki Wolf', 'manager@acculance.com', NULL, '$2y$10$vN.8.hi/ShH7rjjdUe0Xz./5l8sZ9K/4nopOhPNBR4jjGs5tP/YOC', NULL, 0, 1, '2022-05-15 04:28:43', '2022-05-15 04:28:43'),
(5, 'Rafsan', 'developer@acculance.com', NULL, '$2y$10$PWExVPMeeRvy7c1su9ZwTONGS4ZFJCj6lSWPgJMAEfbYgY.axJtNu', NULL, 1, 1, '2022-05-15 03:14:11', '2022-05-15 03:14:11');

-- --------------------------------------------------------

--
-- Table structure for table `user_permission`
--

CREATE TABLE `user_permission` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `permission_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_permission`
--

INSERT INTO `user_permission` (`user_id`, `permission_id`) VALUES
(1, 171),
(1, 170),
(1, 169),
(1, 168),
(1, 167),
(1, 166),
(1, 165),
(1, 164),
(1, 163),
(1, 162),
(1, 161),
(1, 160),
(1, 159),
(1, 158),
(1, 157),
(1, 156),
(1, 155),
(1, 154),
(1, 153),
(1, 152),
(1, 151),
(1, 150),
(1, 149),
(1, 148),
(1, 147),
(1, 145),
(1, 144),
(1, 143),
(1, 142),
(1, 141),
(1, 140),
(1, 138),
(1, 137),
(1, 136),
(1, 135),
(1, 133),
(1, 132),
(1, 131),
(1, 130),
(1, 129),
(1, 128),
(1, 127),
(1, 125),
(1, 124),
(1, 123),
(1, 122),
(1, 120),
(1, 119),
(1, 118),
(1, 117),
(1, 115),
(1, 114),
(1, 113),
(1, 111),
(1, 110),
(1, 109),
(1, 108),
(1, 106),
(1, 105),
(1, 104),
(1, 103),
(1, 101),
(1, 100),
(1, 99),
(1, 98),
(1, 96),
(1, 95),
(1, 94),
(1, 93),
(1, 91),
(1, 90),
(1, 89),
(1, 87),
(1, 86),
(1, 85),
(1, 84),
(1, 82),
(1, 81),
(1, 80),
(1, 79),
(1, 77),
(1, 76),
(1, 75),
(1, 74),
(1, 72),
(1, 71),
(1, 70),
(1, 69),
(1, 67),
(1, 66),
(1, 65),
(1, 64),
(1, 62),
(1, 61),
(1, 60),
(1, 59),
(1, 57),
(1, 56),
(1, 55),
(1, 54),
(1, 52),
(1, 51),
(1, 50),
(1, 49),
(1, 47),
(1, 46),
(1, 45),
(1, 43),
(1, 42),
(1, 41),
(1, 40),
(1, 38),
(1, 37),
(1, 36),
(1, 35),
(1, 33),
(1, 32),
(1, 31),
(1, 30),
(1, 29),
(1, 27),
(1, 26),
(1, 25),
(1, 24),
(1, 22),
(1, 21),
(1, 20),
(1, 19),
(1, 17),
(1, 16),
(1, 15),
(1, 14),
(1, 12),
(1, 11),
(1, 10),
(1, 9),
(1, 7),
(1, 6),
(1, 5),
(1, 3),
(1, 2),
(1, 1),
(4, 171),
(4, 170),
(4, 169),
(4, 168),
(4, 167),
(4, 166),
(4, 165),
(4, 164),
(4, 163),
(4, 162),
(4, 161),
(4, 160),
(4, 159),
(4, 158),
(4, 157),
(4, 156),
(4, 155),
(4, 154),
(4, 153),
(4, 152),
(4, 151),
(4, 150),
(4, 149),
(4, 148),
(4, 147),
(4, 145),
(4, 144),
(4, 143),
(4, 142),
(4, 141),
(4, 140),
(4, 138),
(4, 137),
(4, 136),
(4, 135),
(4, 133),
(4, 132),
(4, 131),
(4, 129),
(4, 128),
(4, 127),
(4, 125),
(4, 124),
(4, 123),
(4, 122),
(4, 120),
(4, 119),
(4, 118),
(4, 117),
(4, 115),
(4, 114),
(4, 113),
(4, 111),
(4, 110),
(4, 109),
(4, 108),
(4, 106),
(4, 105),
(4, 104),
(4, 103),
(4, 101),
(4, 100),
(4, 99),
(4, 98),
(4, 96),
(4, 95),
(4, 94),
(4, 93),
(4, 91),
(4, 90),
(4, 89),
(4, 87),
(4, 86),
(4, 85),
(4, 84),
(4, 82),
(4, 81),
(4, 80),
(4, 79),
(4, 77),
(4, 76),
(4, 75),
(4, 74),
(4, 72),
(4, 71),
(4, 70),
(4, 69),
(4, 67),
(4, 66),
(4, 65),
(4, 64),
(4, 62),
(4, 61),
(4, 60),
(4, 59),
(4, 57),
(4, 56),
(4, 55),
(4, 54),
(4, 52),
(4, 51),
(4, 50),
(4, 49),
(4, 47),
(4, 46),
(4, 45),
(4, 43),
(4, 42),
(4, 41),
(4, 40),
(4, 38),
(3, 171),
(3, 170),
(3, 169),
(3, 168),
(3, 167),
(3, 166),
(3, 165),
(3, 163),
(3, 162),
(3, 160),
(3, 156),
(3, 155),
(3, 154),
(3, 150),
(3, 148),
(3, 147),
(3, 145),
(3, 144),
(3, 143),
(3, 142),
(3, 141),
(3, 140),
(3, 138),
(3, 137),
(3, 136),
(3, 135),
(3, 133),
(3, 132),
(3, 131),
(3, 129),
(3, 128),
(3, 127),
(3, 125),
(3, 124),
(3, 123),
(3, 122),
(3, 120),
(3, 119),
(3, 118),
(3, 117),
(3, 111),
(3, 110),
(3, 109),
(3, 108),
(3, 105),
(3, 104),
(3, 103),
(3, 93),
(3, 73),
(3, 72),
(3, 71),
(3, 70),
(3, 69),
(3, 67),
(3, 66),
(3, 65),
(3, 64),
(3, 62),
(3, 61),
(3, 60),
(3, 59),
(3, 58),
(3, 57),
(3, 56),
(3, 55),
(3, 54),
(3, 43),
(3, 42),
(3, 41),
(3, 40),
(3, 38),
(3, 37),
(3, 36),
(3, 35),
(3, 33),
(3, 32),
(3, 31),
(3, 30),
(3, 29),
(3, 27),
(3, 26),
(3, 25),
(3, 24),
(3, 22),
(3, 21),
(3, 20),
(3, 19),
(3, 17),
(3, 16),
(3, 15),
(3, 14),
(3, 12),
(3, 11),
(3, 10),
(3, 9),
(3, 7),
(3, 6),
(3, 5),
(3, 3),
(3, 2),
(3, 1),
(4, 37),
(4, 36),
(4, 35),
(4, 33),
(4, 32),
(4, 31),
(4, 30),
(4, 29),
(4, 27),
(4, 26),
(4, 25),
(4, 24),
(4, 22),
(4, 21),
(4, 20),
(4, 19),
(4, 17),
(4, 16),
(4, 15),
(4, 14),
(4, 12),
(4, 11),
(4, 10),
(4, 9),
(4, 7),
(4, 6),
(4, 5),
(4, 3),
(4, 2),
(4, 1),
(2, 171),
(2, 170),
(2, 169),
(2, 168),
(2, 167),
(2, 166),
(2, 165),
(2, 164),
(2, 163),
(2, 162),
(2, 161),
(2, 160),
(2, 159),
(2, 158),
(2, 157),
(2, 156),
(2, 155),
(2, 154),
(2, 153),
(2, 152),
(2, 151),
(2, 150),
(2, 149),
(2, 148),
(2, 147),
(2, 145),
(2, 144),
(2, 143),
(2, 142),
(2, 141),
(2, 140),
(2, 138),
(2, 137),
(2, 136),
(2, 135),
(2, 133),
(2, 132),
(2, 131),
(2, 129),
(2, 128),
(2, 127),
(2, 125),
(2, 124),
(2, 123),
(2, 122),
(2, 120),
(2, 119),
(2, 118),
(2, 117),
(2, 115),
(2, 114),
(2, 113),
(2, 111),
(2, 110),
(2, 109),
(2, 108),
(2, 106),
(2, 105),
(2, 104),
(2, 103),
(2, 101),
(2, 100),
(2, 99),
(2, 98),
(2, 96),
(2, 95),
(2, 94),
(2, 93),
(2, 91),
(2, 90),
(2, 89),
(2, 87),
(2, 86),
(2, 85),
(2, 84),
(2, 82),
(2, 81),
(2, 80),
(2, 79),
(2, 77),
(2, 76),
(2, 75),
(2, 74),
(2, 72),
(2, 71),
(2, 70),
(2, 69),
(2, 67),
(2, 66),
(2, 65),
(2, 64),
(2, 62),
(2, 61),
(2, 60),
(2, 59),
(2, 57),
(2, 56),
(2, 55),
(2, 54),
(2, 52),
(2, 51),
(2, 50),
(2, 49),
(2, 47),
(2, 46),
(2, 45),
(2, 43),
(2, 42),
(2, 41),
(2, 40),
(2, 38),
(2, 37),
(2, 36),
(2, 35),
(2, 33),
(2, 32),
(2, 31),
(2, 30),
(2, 29),
(2, 27),
(2, 26),
(2, 25),
(2, 24),
(2, 22),
(2, 21),
(2, 20),
(2, 19),
(2, 17),
(2, 16),
(2, 15),
(2, 14),
(2, 12),
(2, 11),
(2, 10),
(2, 9),
(2, 7),
(2, 6),
(2, 5),
(2, 3),
(2, 2),
(2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`user_id`, `role_id`) VALUES
(1, 2),
(2, 3),
(3, 4),
(4, 3),
(5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vat_rates`
--

CREATE TABLE `vat_rates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` double(4,2) NOT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vat_rates`
--

INSERT INTO `vat_rates` (`id`, `name`, `slug`, `code`, `rate`, `note`, `status`, `created_at`, `updated_at`) VALUES
(1, 'VAT 20%', 'vat-20', 'VAT@20', 20.00, 'This is a note!', 1, '2022-04-30 16:14:59', '2022-04-30 16:14:59'),
(2, 'VAT 10%', 'vat-10', 'VAT@10', 10.00, NULL, 1, '2022-04-30 16:15:14', '2022-04-30 16:15:14'),
(3, 'VAT 0%', 'vat-0', 'VAT@0', 0.00, NULL, 1, '2022-04-30 16:15:33', '2022-04-30 16:15:33');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accounts_created_by_foreign` (`created_by`);

--
-- Indexes for table `account_transactions`
--
ALTER TABLE `account_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_transactions_account_id_foreign` (`account_id`),
  ADD KEY `account_transactions_created_by_foreign` (`created_by`);

--
-- Indexes for table `adjustment_products`
--
ALTER TABLE `adjustment_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adjustment_products_adjustment_id_foreign` (`adjustment_id`),
  ADD KEY `adjustment_products_product_id_foreign` (`product_id`);

--
-- Indexes for table `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assets_cat_id_foreign` (`cat_id`),
  ADD KEY `assets_created_by_foreign` (`created_by`);

--
-- Indexes for table `asset_types`
--
ALTER TABLE `asset_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `balance_tansfers`
--
ALTER TABLE `balance_tansfers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `balance_tansfers_debit_id_foreign` (`debit_id`),
  ADD KEY `balance_tansfers_credit_id_foreign` (`credit_id`),
  ADD KEY `balance_tansfers_created_by_foreign` (`created_by`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employees_department_id_foreign` (`department_id`),
  ADD KEY `employees_user_id_foreign` (`user_id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expenses_sub_cat_id_foreign` (`sub_cat_id`),
  ADD KEY `expenses_transaction_id_foreign` (`transaction_id`),
  ADD KEY `expenses_created_by_foreign` (`created_by`);

--
-- Indexes for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expense_sub_categories`
--
ALTER TABLE `expense_sub_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expense_sub_categories_exp_id_foreign` (`exp_id`);

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
-- Indexes for table `inventory_adjustments`
--
ALTER TABLE `inventory_adjustments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inventory_adjustments_created_by_foreign` (`created_by`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoices_client_id_foreign` (`client_id`),
  ADD KEY `invoices_tax_id_foreign` (`tax_id`),
  ADD KEY `invoices_created_by_foreign` (`created_by`);

--
-- Indexes for table `invoice_payments`
--
ALTER TABLE `invoice_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_payments_invoice_id_foreign` (`invoice_id`),
  ADD KEY `invoice_payments_transaction_id_foreign` (`transaction_id`),
  ADD KEY `invoice_payments_created_by_foreign` (`created_by`);

--
-- Indexes for table `invoice_products`
--
ALTER TABLE `invoice_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_products_invoice_id_foreign` (`invoice_id`),
  ADD KEY `invoice_products_product_id_foreign` (`product_id`);

--
-- Indexes for table `invoice_returns`
--
ALTER TABLE `invoice_returns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_returns_invoice_id_foreign` (`invoice_id`),
  ADD KEY `invoice_returns_transaction_id_foreign` (`transaction_id`),
  ADD KEY `invoice_returns_created_by_foreign` (`created_by`);

--
-- Indexes for table `invoice_return_products`
--
ALTER TABLE `invoice_return_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_return_products_return_id_foreign` (`return_id`),
  ADD KEY `invoice_return_products_product_id_foreign` (`product_id`);

--
-- Indexes for table `loans`
--
ALTER TABLE `loans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `loans_authority_id_foreign` (`authority_id`),
  ADD KEY `loans_transaction_id_foreign` (`transaction_id`),
  ADD KEY `loans_created_by_foreign` (`created_by`);

--
-- Indexes for table `loan_authorities`
--
ALTER TABLE `loan_authorities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loan_payments`
--
ALTER TABLE `loan_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `loan_payments_loan_id_foreign` (`loan_id`),
  ADD KEY `loan_payments_transaction_id_foreign` (`transaction_id`),
  ADD KEY `loan_payments_created_by_foreign` (`created_by`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `non_invoice_payments`
--
ALTER TABLE `non_invoice_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `non_invoice_payments_client_id_foreign` (`client_id`),
  ADD KEY `non_invoice_payments_transaction_id_foreign` (`transaction_id`),
  ADD KEY `non_invoice_payments_created_by_foreign` (`created_by`);

--
-- Indexes for table `non_purchase_payments`
--
ALTER TABLE `non_purchase_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `non_purchase_payments_supplier_id_foreign` (`supplier_id`),
  ADD KEY `non_purchase_payments_transaction_id_foreign` (`transaction_id`),
  ADD KEY `non_purchase_payments_created_by_foreign` (`created_by`);

--
-- Indexes for table `oauth_providers`
--
ALTER TABLE `oauth_providers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_providers_user_id_foreign` (`user_id`),
  ADD KEY `oauth_providers_provider_user_id_index` (`provider_user_id`);

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
-- Indexes for table `payrolls`
--
ALTER TABLE `payrolls`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payrolls_employee_id_foreign` (`employee_id`),
  ADD KEY `payrolls_transaction_id_foreign` (`transaction_id`),
  ADD KEY `payrolls_created_by_foreign` (`created_by`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_sub_cat_id_foreign` (`sub_cat_id`),
  ADD KEY `products_brand_id_foreign` (`brand_id`),
  ADD KEY `products_unit_id_foreign` (`unit_id`),
  ADD KEY `products_tax_id_foreign` (`tax_id`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_sub_categories`
--
ALTER TABLE `product_sub_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_sub_categories_cat_id_foreign` (`cat_id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchases_supplier_id_foreign` (`supplier_id`),
  ADD KEY `purchases_tax_id_foreign` (`tax_id`),
  ADD KEY `purchases_created_by_foreign` (`created_by`);

--
-- Indexes for table `purchase_payments`
--
ALTER TABLE `purchase_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_payments_purchase_id_foreign` (`purchase_id`),
  ADD KEY `purchase_payments_transaction_id_foreign` (`transaction_id`),
  ADD KEY `purchase_payments_created_by_foreign` (`created_by`);

--
-- Indexes for table `purchase_products`
--
ALTER TABLE `purchase_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_products_purchase_id_foreign` (`purchase_id`),
  ADD KEY `purchase_products_product_id_foreign` (`product_id`);

--
-- Indexes for table `purchase_returns`
--
ALTER TABLE `purchase_returns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_returns_purchase_id_foreign` (`purchase_id`),
  ADD KEY `purchase_returns_transaction_id_foreign` (`transaction_id`),
  ADD KEY `purchase_returns_created_by_foreign` (`created_by`);

--
-- Indexes for table `purchase_return_products`
--
ALTER TABLE `purchase_return_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_return_products_return_id_foreign` (`return_id`),
  ADD KEY `purchase_return_products_product_id_foreign` (`product_id`);

--
-- Indexes for table `quotations`
--
ALTER TABLE `quotations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quotations_client_id_foreign` (`client_id`),
  ADD KEY `quotations_tax_id_foreign` (`tax_id`),
  ADD KEY `quotations_created_by_foreign` (`created_by`);

--
-- Indexes for table `quotation_products`
--
ALTER TABLE `quotation_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quotation_products_quotation_id_foreign` (`quotation_id`),
  ADD KEY `quotation_products_product_id_foreign` (`product_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_permission`
--
ALTER TABLE `role_permission`
  ADD KEY `role_permission_role_id_foreign` (`role_id`),
  ADD KEY `role_permission_permission_id_foreign` (`permission_id`);

--
-- Indexes for table `salary_increments`
--
ALTER TABLE `salary_increments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `salary_increments_empolyee_id_foreign` (`empolyee_id`),
  ADD KEY `salary_increments_created_by_foreign` (`created_by`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_permission`
--
ALTER TABLE `user_permission`
  ADD KEY `user_permission_user_id_foreign` (`user_id`),
  ADD KEY `user_permission_permission_id_foreign` (`permission_id`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD KEY `user_role_user_id_foreign` (`user_id`),
  ADD KEY `user_role_role_id_foreign` (`role_id`);

--
-- Indexes for table `vat_rates`
--
ALTER TABLE `vat_rates`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `account_transactions`
--
ALTER TABLE `account_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `adjustment_products`
--
ALTER TABLE `adjustment_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `assets`
--
ALTER TABLE `assets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `asset_types`
--
ALTER TABLE `asset_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `balance_tansfers`
--
ALTER TABLE `balance_tansfers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `expense_categories`
--
ALTER TABLE `expense_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `expense_sub_categories`
--
ALTER TABLE `expense_sub_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `general_settings`
--
ALTER TABLE `general_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `inventory_adjustments`
--
ALTER TABLE `inventory_adjustments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `invoice_payments`
--
ALTER TABLE `invoice_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `invoice_products`
--
ALTER TABLE `invoice_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `invoice_returns`
--
ALTER TABLE `invoice_returns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `invoice_return_products`
--
ALTER TABLE `invoice_return_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `loans`
--
ALTER TABLE `loans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `loan_authorities`
--
ALTER TABLE `loan_authorities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `loan_payments`
--
ALTER TABLE `loan_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `non_invoice_payments`
--
ALTER TABLE `non_invoice_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `non_purchase_payments`
--
ALTER TABLE `non_purchase_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `oauth_providers`
--
ALTER TABLE `oauth_providers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `payrolls`
--
ALTER TABLE `payrolls`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=172;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `product_sub_categories`
--
ALTER TABLE `product_sub_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `purchase_payments`
--
ALTER TABLE `purchase_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `purchase_products`
--
ALTER TABLE `purchase_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `purchase_returns`
--
ALTER TABLE `purchase_returns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `purchase_return_products`
--
ALTER TABLE `purchase_return_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `quotations`
--
ALTER TABLE `quotations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `quotation_products`
--
ALTER TABLE `quotation_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `salary_increments`
--
ALTER TABLE `salary_increments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `vat_rates`
--
ALTER TABLE `vat_rates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
