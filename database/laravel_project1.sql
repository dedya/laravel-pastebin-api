-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 27, 2020 at 05:39 AM
-- Server version: 5.7.26-log
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel_project1`
--

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
CREATE TABLE IF NOT EXISTS `authors` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` char(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Dedy A', NULL, NULL),
(2, 'Helene A', NULL, NULL),
(3, 'Joanne E', NULL, NULL),
(4, 'Riana A\r\n', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
CREATE TABLE IF NOT EXISTS `books` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `author_id` int(10) UNSIGNED NOT NULL,
  `name` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `books_author_id_foreign` (`author_id`)
) ENGINE=MyISAM AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `author_id`, `name`) VALUES
(66, 2, 'Book 29'),
(65, 4, 'Book 28'),
(64, 1, 'Book 27'),
(63, 2, 'Book 26'),
(62, 4, 'Book 25'),
(61, 1, 'Book 24'),
(60, 3, 'Book 23'),
(59, 3, 'Book 22'),
(58, 2, 'Book 21'),
(57, 4, 'Book 20'),
(56, 2, 'Book 19'),
(55, 2, 'Book 18'),
(54, 1, 'Book 17'),
(53, 4, 'Book 16'),
(52, 2, 'Book 15'),
(51, 3, 'Book 14'),
(50, 2, 'Book 13'),
(49, 2, 'Book 12'),
(48, 3, 'Book 11'),
(47, 2, 'Book 10'),
(46, 2, 'Book 9'),
(45, 2, 'Book 8'),
(44, 1, 'Book 7'),
(43, 3, 'Book 6'),
(42, 3, 'Book 5'),
(41, 2, 'Book 4'),
(40, 3, 'Book 3'),
(39, 2, 'Book 2'),
(38, 3, 'Book 1'),
(37, 2, 'Book 0');

-- --------------------------------------------------------

--
-- Table structure for table `book_cards`
--

DROP TABLE IF EXISTS `book_cards`;
CREATE TABLE IF NOT EXISTS `book_cards` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `author_id` int(10) UNSIGNED NOT NULL,
  `book_id` int(10) UNSIGNED NOT NULL,
  `time_borrow` datetime NOT NULL,
  `time_return` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `book_cards_author_id_foreign` (`author_id`),
  KEY `book_cards_book_id_foreign` (`book_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 2),
(4, '2020_11_27_034346_author', 2),
(5, '2020_11_27_034355_books', 2),
(6, '2020_11_27_035109_book_cards', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('admin','user') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `active`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, '0hKkkPLC4a', 'JYkOcoCYpz@gmail.com', NULL, '$2y$10$WuaCAKtyMGImnNoWaD2zO.o4k8qW6hwRV1OJqogEaZzSsHjXkXwgq', 'user', 1, NULL, NULL, NULL),
(2, 'o14YzQpaxl', 'HhHJ4dJVep@gmail.com', NULL, '$2y$10$2y7iRS5WuFULNrYbnOMF8.hcxmS6WNgOP1WufjIRNOGVAJwMbPqLO', 'user', 1, NULL, NULL, NULL),
(3, 'pepJsof0SF', 'QaRkfwUMIw@gmail.com', NULL, '$2y$10$HDp80XbeeZPk6adzk9b.I.hX4HDEBcsy3DMVsWiE3y1h/Fcurbihi', 'user', 1, NULL, NULL, NULL),
(4, 'WOMiGh4dKM', 'smINvgEGYe@gmail.com', NULL, '$2y$10$GoSB/bjZEUbCzS/WOMX4gulcdfCMWIqXq4T.w4wKKD0/HIJLfQKEe', 'user', 1, NULL, NULL, NULL),
(5, 'HkaRm2yI73', 'HUNNe1Ae6X@gmail.com', NULL, '$2y$10$vXIQsF7Ig2RRaQnlok5If./4tW9UVygMMbSANh7O1xs/JP24G7DNa', 'user', 1, NULL, NULL, NULL),
(6, 'ICwp0nAoS1', '3sMc8BnBHZ@gmail.com', NULL, '$2y$10$1tNGSD1khUNZu8z7hHOAEe46waVxM8RK/slhB/jX20l4RYyaiA95y', 'user', 1, NULL, NULL, NULL),
(7, 'aXKFeDlepB', 'WYe2V03nMQ@gmail.com', NULL, '$2y$10$J6e/FPqdnW0Ajkeg2sGYz.Y/h1jye2L8MlntY3z6ztESJejWtUwqu', 'user', 1, NULL, NULL, NULL),
(8, 'GolMpvDRt2', 'w8FWVP4Q9b@gmail.com', NULL, '$2y$10$LZ/ZxlOlgZTfm60zZuJB/ugi8oMxF1ZrWBvy3HOKJ2Ktt3H4d3Xdy', 'user', 1, NULL, NULL, NULL),
(9, 'AyvYEl3Sog', 'xqFPiXI1uU@gmail.com', NULL, '$2y$10$twcqQTEyd/jXcX.YLGWKee/yjnoU.gshhyL3kx1FpfNbyf7r5dfp6', 'user', 1, NULL, NULL, NULL),
(10, 'ENWsjSW0Lq', 'furG716xkC@gmail.com', NULL, '$2y$10$qGlTQuplpPsFxd9F/G0Mlu1jSYe2pb2opeb6AOQnP.3L1M/UGJdb6', 'user', 1, NULL, NULL, NULL),
(11, 'D1TMyG2J5s', '9JbGVsKQaT@gmail.com', NULL, '$2y$10$Hw.bZbCRLMjSLnsVYOkGOeqOq6rZVnH.vrF0u0sSuh3NghC.ouFKa', 'user', 1, NULL, NULL, NULL),
(12, 'p17GbeBhqP', 'FFg9CWn8Lz@gmail.com', NULL, '$2y$10$73h6kAbaeoUBXdwi9i1.DeNdkGPdt3MvXwONwasi4tWjUyZ3.yNdG', 'user', 1, NULL, NULL, NULL),
(13, 'GrjGzItSmD', 'dWHBcVtDQr@gmail.com', NULL, '$2y$10$6dVxKTkdNeqLs8rMGdysleX/3bV2kzwpeZ4oYogxlGNq8jNha.tsy', 'user', 1, NULL, NULL, NULL),
(14, 'XhOBRNi2pH', 'DYznxZvoOp@gmail.com', NULL, '$2y$10$DdZ2WPFNj93dq9ewjlS21eDQwrQVvOMe.fbjfc/ePn7F5jKZEG3XG', 'user', 1, NULL, NULL, NULL),
(15, 'O7qTmd1TaR', 'eWcpTMohV4@gmail.com', NULL, '$2y$10$aaXRPPZEuR7fcWi/3V8WAeggwm2.9FX5EpRs5q9gUEO/qqWx6g8vO', 'user', 1, NULL, NULL, NULL),
(16, 'j7QYvK4zHJ', 'JFz3haAGu1@gmail.com', NULL, '$2y$10$8pIZoutRJq5ISyRp0bCLg.5W/R.NsCY0X92P/Bu37mlYMxeuy1uVu', 'user', 1, NULL, NULL, NULL),
(17, 'khoSm0OhuS', 'puKq2KBz27@gmail.com', NULL, '$2y$10$bjQ7pyn/9us1WxoMaXMCSez5R5Dc2D4ZRlphFXs331iwu7X5YXXAm', 'user', 1, NULL, NULL, NULL),
(18, '2vDcyMmGjL', 'Va14Kg66MO@gmail.com', NULL, '$2y$10$YjrtG1bICFT.AyvRI4PjIuU1S3v3xgTFt7/TIAhl1sFx96fG834TG', 'user', 1, NULL, NULL, NULL),
(19, 'QkYYhk37FV', 'R4hCQiibqU@gmail.com', NULL, '$2y$10$qVgnNpFNTGrmBhSWUeaVFOo1ERnGIzum80Z03i8S.NoeezckAaVMG', 'user', 1, NULL, NULL, NULL),
(20, 'JDjgDUOyzm', 'PdzI73Qq3m@gmail.com', NULL, '$2y$10$KazihQZ4yJc3m4QfLVBJV.D83373e64loJ15k9N4KvPygkCSUvuim', 'user', 1, NULL, NULL, NULL),
(21, 'IJIEqAwmWC', 'JfQ9zZhVQK@gmail.com', NULL, '$2y$10$et5BMs/M50FHT7gWHeG4fuIhNSzlPNFRkCHK.p3K473zCXissvVhu', 'user', 1, NULL, NULL, NULL),
(22, 'FNNB6zPn3e', '8mhZUChuag@gmail.com', NULL, '$2y$10$gDAIi8gaNo7.ERaEMOHPZ.iEa2k4zgoeu3dW.VgbBdgVyO8haCzA6', 'user', 1, NULL, NULL, NULL),
(23, 'lF77iNjbkI', 'FsRf1HrBcH@gmail.com', NULL, '$2y$10$cxq4xD7Gei0nVgbh0PgxhuEo/2HucNkAcDxRTLakEyzkEMyDgkmUq', 'user', 1, NULL, NULL, NULL),
(24, 'B4JyEoGzta', 'UnqfIt7SAP@gmail.com', NULL, '$2y$10$us1XYRg3r6j514bDmeMbseiwMcbS6YNmFl9NzB1WQeKhQw4EvmQZO', 'user', 1, NULL, NULL, NULL),
(25, 'n0qRlWcgMr', 'tfsEGSB7SR@gmail.com', NULL, '$2y$10$XzgQ0xt4m7cnoX4dGyr6nOiRZzSKYjIB.0NMKSrL6X07g9qIk7wba', 'user', 1, NULL, NULL, NULL),
(26, 'EZnbU3QXPF', 'qseOWRMFf0@gmail.com', NULL, '$2y$10$MUG7wIjaYnSX4Fspl1BZyeAmHjew.1c9UObYlV7GT3iWUuJegGc1G', 'user', 1, NULL, NULL, NULL),
(27, 'lPQ7rTU4hO', 'LWNrI3TNYw@gmail.com', NULL, '$2y$10$5.85PsYtq8SgiKT/.fDPnep8yoB/GmQilJrl.ABQ/mQzjto4Vl/xm', 'user', 1, NULL, NULL, NULL),
(28, '5lwSkr61v3', 'aHdQrVI9QE@gmail.com', NULL, '$2y$10$BHQxSkKex77mhOKbllNomOclHwJjahIv7Efjy42GttwnBLIkZlHYG', 'user', 1, NULL, NULL, NULL),
(29, 'v4a3JpYFnF', 'TMs7jb2B9Y@gmail.com', NULL, '$2y$10$O7S/emNMJv0Bn8lQ58NsTu23tPHmnXCk7ZYcqWvt0nUOPXEI7X31O', 'user', 1, NULL, NULL, NULL),
(30, 'DaDXjlxtt9', '0c205NDJIC@gmail.com', NULL, '$2y$10$1YkwSOGi2FDhT7s6raxC5ub2f8cjZkPXnIbf4Q8CDT3n2S54lPe5i', 'user', 1, NULL, NULL, NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
