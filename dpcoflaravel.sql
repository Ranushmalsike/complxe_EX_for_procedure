-- phpMyAdmin SQL Dump
-- version 5.2.1deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 22, 2024 at 02:57 PM
-- Server version: 10.11.6-MariaDB-2
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dpcoflaravel`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `ProcessTimeArrangementFinal` (IN `arrangement_id` BIGINT)   BEGIN
    -- Declare variables
    DECLARE v_user_id, v_transport_id BIGINT$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `RemoveDuplicates` ()   BEGIN
    DELETE p1
    FROM permission_pageforusers p1
    JOIN permission_pageforusers p2 
      ON p1.permission_id = p2.permission_id 
     AND p1.user_id = p2.user_id
     AND p1.id > p2.id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `RemoveDuplicatesPerhourTableValue` ()   BEGIN
            DELETE ph1
            FROM per_houser_salary_for_techers ph1
            JOIN per_houser_salary_for_techers hs1 
              ON ph1.perHourSalary = hs1.perHourSalary 
             AND ph1.user_id = hs1.user_id
             AND ph1.id > hs1.id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `salaryBand_defaults` (IN `entryId` INT)   BEGIN
    DECLARE v_user_id BIGINT$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updateTransportSetDefByEntryId` (IN `entryId` INT)   BEGIN
                DECLARE transportCode VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `additional_allowances`
--

CREATE TABLE `additional_allowances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `allowance_amount` decimal(65,2) NOT NULL,
  `Description` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `allowance_for_users`
--

CREATE TABLE `allowance_for_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `allowance_id` bigint(20) NOT NULL,
  `define_month` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `allowance_tbs`
--

CREATE TABLE `allowance_tbs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `start_salary` decimal(65,2) NOT NULL,
  `end_star` decimal(65,2) NOT NULL,
  `allowance` decimal(65,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `allowance_tbs`
--

INSERT INTO `allowance_tbs` (`id`, `start_salary`, `end_star`, `allowance`, `created_at`, `updated_at`) VALUES
(1, 0.00, 500.00, 250.00, NULL, NULL),
(2, 501.00, 1000.00, 300.00, NULL, NULL),
(3, 1001.00, 1500.00, 350.00, NULL, NULL),
(4, 1501.00, 2000.00, 400.00, NULL, NULL),
(5, 2001.00, 2500.00, 450.00, NULL, NULL),
(6, 2501.00, 3000.00, 500.00, NULL, NULL),
(7, 3001.00, 3500.00, 550.00, NULL, NULL),
(8, 3501.00, 4000.00, 600.00, NULL, NULL),
(9, 4001.00, 4500.00, 650.00, NULL, NULL),
(10, 4501.00, 5000.00, 700.00, NULL, NULL),
(11, 5001.00, 5500.00, 750.00, NULL, NULL),
(12, 5501.00, 6000.00, 800.00, NULL, NULL),
(13, 6001.00, 6500.00, 850.00, NULL, NULL),
(14, 6501.00, 7000.00, 900.00, NULL, NULL),
(15, 7001.00, 7500.00, 950.00, NULL, NULL),
(16, 7501.00, 8000.00, 1000.00, NULL, NULL),
(17, 8001.00, 8500.00, 1050.00, NULL, NULL),
(18, 8501.00, 9000.00, 1100.00, NULL, NULL),
(19, 9001.00, 9500.00, 1150.00, NULL, NULL),
(20, 9501.00, 10000.00, 1200.00, NULL, NULL),
(21, 10001.00, 10500.00, 1250.00, NULL, NULL),
(22, 10501.00, 11000.00, 1300.00, NULL, NULL),
(23, 11001.00, 11500.00, 1350.00, NULL, NULL),
(24, 11501.00, 12000.00, 1400.00, NULL, NULL),
(25, 12001.00, 12500.00, 1450.00, NULL, NULL),
(26, 12501.00, 13000.00, 1500.00, NULL, NULL),
(27, 13001.00, 13500.00, 1550.00, NULL, NULL),
(28, 13501.00, 14000.00, 1600.00, NULL, NULL),
(29, 14001.00, 14500.00, 1650.00, NULL, NULL),
(30, 14501.00, 15000.00, 1700.00, NULL, NULL),
(31, 15001.00, 15500.00, 1750.00, NULL, NULL),
(32, 15501.00, 16000.00, 1800.00, NULL, NULL),
(33, 16001.00, 16500.00, 1850.00, NULL, NULL),
(34, 16501.00, 17000.00, 1900.00, NULL, NULL),
(35, 17001.00, 17500.00, 1950.00, NULL, NULL),
(36, 17501.00, 18000.00, 2000.00, NULL, NULL),
(37, 18001.00, 18500.00, 2050.00, NULL, NULL),
(38, 18501.00, 19000.00, 2100.00, NULL, NULL),
(39, 19001.00, 19500.00, 2150.00, NULL, NULL),
(40, 19501.00, 20000.00, 2200.00, NULL, NULL),
(41, 20001.00, 99999999.00, 2250.00, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `class_tbs`
--

CREATE TABLE `class_tbs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `dpcclass` varchar(255) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `class_tbs`
--

INSERT INTO `class_tbs` (`id`, `dpcclass`, `start_date`, `end_date`, `created_at`, `updated_at`) VALUES
(1, 'dcv', '2024-03-01', NULL, NULL, NULL),
(2, 'Class A', '2024-03-18', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `credit_d3s`
--

CREATE TABLE `credit_d3s` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `credit_t_b_d1s`
--

CREATE TABLE `credit_t_b_d1s` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `amount` decimal(65,2) NOT NULL,
  `type_id` bigint(20) NOT NULL DEFAULT 1,
  `provide_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `credit_t_b_d2s`
--

CREATE TABLE `credit_t_b_d2s` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `credit_id` bigint(20) NOT NULL,
  `installment` decimal(10,2) NOT NULL,
  `type_id` bigint(20) NOT NULL DEFAULT 1,
  `installment_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `gathher_to_a_delete_date_from__time_arrangements`
--

CREATE TABLE `gathher_to_a_delete_date_from__time_arrangements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `delete_date_from_TimeArrangement` date NOT NULL,
  `Description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gathher_to_a_delete_date_from__time_arrangements`
--

INSERT INTO `gathher_to_a_delete_date_from__time_arrangements` (`id`, `delete_date_from_TimeArrangement`, `Description`, `created_at`, `updated_at`) VALUES
(1, '2024-03-29', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `how_gen_salaries`
--

CREATE TABLE `how_gen_salaries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `today_day` date NOT NULL,
  `description` text NOT NULL,
  `schedule_id` bigint(20) DEFAULT NULL,
  `trp_transport_id` bigint(20) DEFAULT NULL,
  `additional_allowance_id` bigint(20) DEFAULT NULL,
  `credit_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Triggers `how_gen_salaries`
--
DELIMITER $$
CREATE TRIGGER `schedule_calculation_by_trigger` BEFORE INSERT ON `how_gen_salaries` FOR EACH ROW BEGIN
            -- Check if schedule_id, trp_transport_id, or additional_allowance_id is present
            IF NEW.schedule_id IS NOT NULL OR NEW.trp_transport_id IS NOT NULL OR NEW.additional_allowance_id IS NOT NULL THEN
                -- Logic for credit in description
                SET NEW.description = CONCAT(NEW.description, ' - Credit Added')DELIMITER ;

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
(163, '2014_10_12_000000_create_users_table', 1),
(164, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(165, '2019_08_19_000000_create_failed_jobs_table', 1),
(166, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(167, '2024_02_22_081337_create_user_roles_table', 1),
(168, '2024_02_23_074319_create_class_tbs_table', 1),
(169, '2024_02_23_093805_create_subject_t_b_s_table', 1),
(170, '2024_02_26_062523_create_permission_pages_table', 1),
(171, '2024_02_27_070216_create_permission_pageforusers_table', 1),
(172, '2024_02_28_074002_create_user_privet_datas_table', 1),
(173, '2024_02_28_121001_after_user_insert_for_user_privet_datas', 1),
(175, '2024_02_28_123549_remove_duplicates', 2),
(286, '2024_02_29_052511_create_per_houser_salary_for_techers_table', 3),
(287, '2024_02_29_090725_remove_duplicates_perhour_table_value', 3),
(288, '2024_03_01_005413_create_transpoer_details_table', 3),
(289, '2024_03_01_005515_create_transpoer_price_details_table', 3),
(290, '2024_03_03_134034_create_allowance_tbs_table', 3),
(291, '2024_03_03_143749_create_additional_allowances_table', 3),
(292, '2024_03_05_103315_create_credit_t_b_d1s_table', 3),
(293, '2024_03_05_103403_create_credit_t_b_d2s_table', 3),
(294, '2024_03_05_155604_create_credit_d3s_table', 3),
(295, '2024_03_17_135532_create_gathher_to_a_delete_date_from__time_arrangements_table', 3),
(296, '2024_03_18_140311_create_time_arrangemtn_confirm_and_transfers_table', 3),
(297, '2024_03_19_021112_update_transport_set_def_by_entry_id', 3),
(298, '2024_03_22_021810_create_schedul_cals_table', 3),
(299, '2024_03_22_021834_create_how_gen_salaries_table', 3),
(300, '2024_03_22_024044_before_insert_how_gen_salaries', 4),
(301, '2024_03_22_044336_create_allowance_for_users_table', 4),
(302, '2024_03_22_065616_process_time_arrangement_final', 5),
(303, '2024_03_22_125857_salary_band_defualt', 6);

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
-- Table structure for table `permission_pageforusers`
--

CREATE TABLE `permission_pageforusers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `permission_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_pageforusers`
--

INSERT INTO `permission_pageforusers` (`id`, `permission_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 3, NULL, NULL),
(2, 8, 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permission_pages`
--

CREATE TABLE `permission_pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nameOfPage` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
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
-- Table structure for table `per_houser_salary_for_techers`
--

CREATE TABLE `per_houser_salary_for_techers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `perHourSalary` decimal(65,2) NOT NULL,
  `published` date NOT NULL,
  `Default_set` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `per_houser_salary_for_techers`
--

INSERT INTO `per_houser_salary_for_techers` (`id`, `user_id`, `perHourSalary`, `published`, `Default_set`) VALUES
(1, 1, 200.00, '2024-03-22', 1);

-- --------------------------------------------------------

--
-- Table structure for table `schedul_cals`
--

CREATE TABLE `schedul_cals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `schedule_id_of_cal_gen` bigint(20) NOT NULL,
  `time_duration` decimal(65,2) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `salary_on_schedul` decimal(65,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subject_t_b_s`
--

CREATE TABLE `subject_t_b_s` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subject` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subject_t_b_s`
--

INSERT INTO `subject_t_b_s` (`id`, `subject`, `created_at`, `updated_at`) VALUES
(2, 'English', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `time_arrangemtn_confirm_and_transfers`
--

CREATE TABLE `time_arrangemtn_confirm_and_transfers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `Time_arrangement` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `class_id` bigint(20) NOT NULL,
  `subject_id` bigint(20) NOT NULL,
  `transport_id` bigint(20) NOT NULL DEFAULT 1,
  `confirm` tinyint(4) NOT NULL DEFAULT 0,
  `Transfer` tinyint(4) NOT NULL DEFAULT 0,
  `Trp_for_whom_user_id` bigint(20) NOT NULL DEFAULT 0,
  `Trp_confirmed` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `time_arrangemtn_confirm_and_transfers`
--

INSERT INTO `time_arrangemtn_confirm_and_transfers` (`id`, `Time_arrangement`, `start_time`, `end_time`, `user_id`, `class_id`, `subject_id`, `transport_id`, `confirm`, `Transfer`, `Trp_for_whom_user_id`, `Trp_confirmed`, `created_at`, `updated_at`) VALUES
(1, '2024-03-22', '08:30:00', '09:30:00', 1, 2, 2, 1, 0, 0, 0, 0, NULL, '2024-03-22 08:58:51'),
(2, '2024-03-25', '08:30:00', '09:30:00', 1, 2, 2, 1, 0, 0, 0, 0, NULL, NULL),
(3, '2024-03-26', '08:30:00', '09:30:00', 1, 2, 2, 1, 0, 0, 0, 0, NULL, NULL),
(4, '2024-03-27', '08:30:00', '09:30:00', 1, 2, 2, 1, 0, 0, 0, 0, NULL, NULL),
(5, '2024-03-28', '08:30:00', '09:30:00', 1, 2, 2, 1, 0, 0, 0, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transpoer_details`
--

CREATE TABLE `transpoer_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `trasporot_code` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transpoer_details`
--

INSERT INTO `transpoer_details` (`id`, `trasporot_code`, `description`, `created_at`, `updated_at`) VALUES
(1, 'cmd', 'Colombo', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transpoer_price_details`
--

CREATE TABLE `transpoer_price_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `trasporot_code` varchar(255) NOT NULL,
  `transport_price` varchar(255) NOT NULL,
  `setDef` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transpoer_price_details`
--

INSERT INTO `transpoer_price_details` (`id`, `trasporot_code`, `transport_price`, `setDef`, `created_at`, `updated_at`) VALUES
(1, 'none', '0', 1, NULL, NULL),
(2, 'cmd', '20', 0, NULL, NULL),
(3, 'cmd', '40', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `user_role` int(11) NOT NULL DEFAULT 0,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `user_role`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'test1', NULL, 3, NULL, '$2y$12$jumlBbcxdOsbIyOVOI1ycOMnG/B3i6D8Fhy5o17heBWkmEbkUIyju', NULL, NULL, '2024-03-21 05:31:46'),
(2, 'asdgd', NULL, 3, NULL, '$2y$12$3NArCvR/zls.LK4McriAXucl5NB5uC3awD32YAnzPbvkzh.WF.ex6', NULL, NULL, NULL),
(3, 'test1c', NULL, 2, NULL, '$2y$12$AsAojmbEqDZY3oh2vJW.Zu2sSWffMtHOjGHaYZMIBchg0mh85UbYu', NULL, NULL, NULL);

--
-- Triggers `users`
--
DELIMITER $$
CREATE TRIGGER `after_user_insert_for_user_privet_datas` AFTER INSERT ON `users` FOR EACH ROW BEGIN
            -- Inserting a new record into user_private with the corresponding user_id
            INSERT INTO user_privet_datas (user_id) VALUES (NEW.id)DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user_privet_datas`
--

CREATE TABLE `user_privet_datas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `second_name` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `NIC` varchar(255) DEFAULT NULL,
  `contact_number` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_privet_datas`
--

INSERT INTO `user_privet_datas` (`id`, `user_id`, `first_name`, `second_name`, `address`, `NIC`, `contact_number`, `created_at`, `updated_at`) VALUES
(1, 1, 'amal', 'as', 'zxc', '3535355', '457', NULL, '2024-03-20 22:08:38'),
(2, 2, 'perera', 'ert', NULL, NULL, NULL, NULL, '2024-03-20 22:09:17'),
(3, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `roleType` varchar(255) NOT NULL DEFAULT 'default_value',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`id`, `roleType`, `created_at`, `updated_at`) VALUES
(1, 'admin', NULL, NULL),
(2, 'staff', NULL, NULL),
(3, 'teacher', NULL, NULL),
(4, 'admin', NULL, NULL),
(5, 'staff', NULL, NULL),
(6, 'teacher', NULL, NULL),
(7, 'admin', NULL, NULL),
(8, 'staff', NULL, NULL),
(9, 'teacher', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `additional_allowances`
--
ALTER TABLE `additional_allowances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `additional_allowances_id_index` (`id`);

--
-- Indexes for table `allowance_for_users`
--
ALTER TABLE `allowance_for_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `allowance_tbs`
--
ALTER TABLE `allowance_tbs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `allowance_tbs_start_salary_end_star_index` (`start_salary`,`end_star`);

--
-- Indexes for table `class_tbs`
--
ALTER TABLE `class_tbs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `class_tbs_dpcclass_unique` (`dpcclass`);

--
-- Indexes for table `credit_d3s`
--
ALTER TABLE `credit_d3s`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `credit_t_b_d1s`
--
ALTER TABLE `credit_t_b_d1s`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `credit_t_b_d2s`
--
ALTER TABLE `credit_t_b_d2s`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `gathher_to_a_delete_date_from__time_arrangements`
--
ALTER TABLE `gathher_to_a_delete_date_from__time_arrangements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `how_gen_salaries`
--
ALTER TABLE `how_gen_salaries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permission_pageforusers`
--
ALTER TABLE `permission_pageforusers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission_pages`
--
ALTER TABLE `permission_pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permission_pages_nameofpage_unique` (`nameOfPage`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `per_houser_salary_for_techers`
--
ALTER TABLE `per_houser_salary_for_techers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `per_houser_salary_for_techers_user_id_index` (`user_id`);

--
-- Indexes for table `schedul_cals`
--
ALTER TABLE `schedul_cals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subject_t_b_s`
--
ALTER TABLE `subject_t_b_s`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subject_t_b_s_subject_unique` (`subject`);

--
-- Indexes for table `time_arrangemtn_confirm_and_transfers`
--
ALTER TABLE `time_arrangemtn_confirm_and_transfers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transpoer_details`
--
ALTER TABLE `transpoer_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transpoer_price_details`
--
ALTER TABLE `transpoer_price_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_privet_datas`
--
ALTER TABLE `user_privet_datas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_privet_datas_user_id_unique` (`user_id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `additional_allowances`
--
ALTER TABLE `additional_allowances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `allowance_for_users`
--
ALTER TABLE `allowance_for_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `allowance_tbs`
--
ALTER TABLE `allowance_tbs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `class_tbs`
--
ALTER TABLE `class_tbs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `credit_d3s`
--
ALTER TABLE `credit_d3s`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `credit_t_b_d1s`
--
ALTER TABLE `credit_t_b_d1s`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `credit_t_b_d2s`
--
ALTER TABLE `credit_t_b_d2s`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gathher_to_a_delete_date_from__time_arrangements`
--
ALTER TABLE `gathher_to_a_delete_date_from__time_arrangements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `how_gen_salaries`
--
ALTER TABLE `how_gen_salaries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=304;

--
-- AUTO_INCREMENT for table `permission_pageforusers`
--
ALTER TABLE `permission_pageforusers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `permission_pages`
--
ALTER TABLE `permission_pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `per_houser_salary_for_techers`
--
ALTER TABLE `per_houser_salary_for_techers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `schedul_cals`
--
ALTER TABLE `schedul_cals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subject_t_b_s`
--
ALTER TABLE `subject_t_b_s`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `time_arrangemtn_confirm_and_transfers`
--
ALTER TABLE `time_arrangemtn_confirm_and_transfers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `transpoer_details`
--
ALTER TABLE `transpoer_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transpoer_price_details`
--
ALTER TABLE `transpoer_price_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_privet_datas`
--
ALTER TABLE `user_privet_datas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
