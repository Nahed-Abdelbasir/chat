-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 08, 2020 at 03:24 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chat`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `reciver_id` bigint(20) UNSIGNED NOT NULL,
  `is_seen` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `body`, `user_id`, `reciver_id`, `is_seen`, `created_at`, `updated_at`) VALUES
(1, 'السلام عليكم ورحمة الله و بركاته', 7, 1, 1, '2020-10-07 22:47:29', '2020-10-07 23:03:56'),
(2, 'وعليكم السلام ورحمة الله وبركاته', 1, 7, 1, '2020-10-07 22:48:12', '2020-10-07 23:07:40'),
(3, 'اخبارك ايه', 7, 1, 1, '2020-10-07 22:49:00', '2020-10-07 23:03:56'),
(4, 'الحمد لله بخير', 1, 7, 1, '2020-10-07 22:49:41', '2020-10-07 23:07:40'),
(5, 'انت عامل ايه', 1, 7, 1, '2020-10-07 22:49:58', '2020-10-07 23:07:40'),
(6, 'الحمد لله', 7, 1, 1, '2020-10-07 22:50:49', '2020-10-07 23:03:56'),
(7, 'hello nahed', 2, 1, 1, '2020-10-07 22:51:44', '2020-10-07 23:13:42'),
(8, 'how are you', 2, 1, 1, '2020-10-07 22:52:19', '2020-10-07 23:13:42'),
(9, 'hello ahmed', 1, 2, 1, '2020-10-07 22:52:43', '2020-10-07 23:13:00'),
(10, 'fine thanks', 1, 2, 1, '2020-10-07 22:52:49', '2020-10-07 23:13:00'),
(11, 'can you send me laravel course?', 2, 1, 1, '2020-10-07 23:00:28', '2020-10-07 23:13:42'),
(12, 'of course', 1, 2, 1, '2020-10-07 23:01:04', '2020-10-07 23:13:00'),
(13, 'i will send the link of the course now', 1, 2, 1, '2020-10-07 23:02:42', '2020-10-07 23:13:00'),
(14, 'thank you so much, nahed', 2, 1, 1, '2020-10-07 23:03:30', '2020-10-07 23:13:42'),
(15, 'you\'re welcome', 1, 2, 1, '2020-10-07 23:07:19', '2020-10-07 23:13:00'),
(16, 'hello eman , how are you?', 7, 4, 1, '2020-10-07 23:08:13', '2020-10-07 23:10:04'),
(17, 'hello mahmoud', 4, 7, 0, '2020-10-07 23:09:49', '2020-10-07 23:09:49'),
(18, 'fine thanks', 4, 7, 0, '2020-10-07 23:09:58', '2020-10-07 23:09:58'),
(19, 'hi ahmed', 4, 2, 1, '2020-10-07 23:10:39', '2020-10-07 23:21:06'),
(20, 'السلام عليكم ورحمة الله و بركاته', 4, 1, 1, '2020-10-07 23:11:03', '2020-10-07 23:20:41'),
(22, 'hi eman', 2, 4, 1, '2020-10-07 23:13:11', '2020-10-07 23:16:15'),
(23, 'وعليكم السلام ورحمة الله وبركاته', 1, 4, 1, '2020-10-07 23:14:30', '2020-10-07 23:16:15'),
(24, 'اخبارك ايه يا إيمان', 1, 4, 1, '2020-10-07 23:15:28', '2020-10-07 23:16:15'),
(25, 'الحمد لله كويسه', 4, 1, 1, '2020-10-07 23:16:02', '2020-10-07 23:20:41'),
(26, 'Let\'s go to the zoo  in the weekend', 4, 2, 1, '2020-10-07 23:18:32', '2020-10-07 23:21:06'),
(27, 'okay', 2, 4, 0, '2020-10-07 23:18:45', '2020-10-07 23:18:45'),
(28, 'hello adam how are you?', 1, 5, 0, '2020-10-07 23:20:56', '2020-10-07 23:20:56'),
(29, 'hello asmaa', 2, 6, 0, '2020-10-07 23:21:20', '2020-10-07 23:21:20');

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
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_09_28_195339_create_messages_table', 1);

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
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Nahed', 'nahed@gmail.com', NULL, '$2y$10$rOuSZ5WNRYuhMBCEG89Fe.5EFm8vr6N0wQG2AU.SafQdhfbaCw66K', NULL, '2020-10-07 22:34:27', '2020-10-07 22:34:27'),
(2, 'ahmed hassan', 'ahmed@gmail.com', NULL, '$2y$10$HAFhDNp5oa5pLdpr9PnL2e1C6mP84fMLxJIm9YC7E2j4vAz.Md9Sa', NULL, '2020-10-07 22:36:38', '2020-10-07 22:36:38'),
(3, 'yara mostafa', 'yara@yahoo.com', NULL, '$2y$10$ofDviR91LnUf5YYG9oxuEeVs5L9LbGGAiG4E8mjvsVLZD/fC/7.jm', NULL, '2020-10-07 22:37:18', '2020-10-07 22:37:18'),
(4, 'eman ali', 'eman@yahoo.com', NULL, '$2y$10$.lbbZyErWskQu.L8DojdU.OGr.HJr2G7Spa3KfMY.5LVGKGXCXpfa', NULL, '2020-10-07 22:38:12', '2020-10-07 22:38:12'),
(5, 'adam', 'adam@hotmail.com', NULL, '$2y$10$ZM0G1LfNy1Y846w/CjTb1OVmeqitZ2u1Nx8m6.qE3pG1bwGT96D7q', NULL, '2020-10-07 22:39:22', '2020-10-07 22:39:22'),
(6, 'Asmaa', 'asmaa@yahoo.com', NULL, '$2y$10$YKI/hg0GChLfZFw1b3g3HelyT9asgG4WXkxuOCBYjXqVFCDK.tsDe', NULL, '2020-10-07 22:41:46', '2020-10-07 22:41:46'),
(7, 'mahmoud', 'mody@gmail.com', NULL, '$2y$10$sKMpkYxk0oekfVCo43LFCO4mrbvwvJA/f37uVHahTcrMOsPROv0WO', NULL, '2020-10-07 22:42:27', '2020-10-07 22:42:27'),
(8, 'mona', 'mona@hotmail.com', NULL, '$2y$10$3l31pySubzM8qpdj4R6RLeHshsJm1JQf1EJyrg0r709H1d9cRI7dm', NULL, '2020-10-07 22:43:46', '2020-10-07 22:43:46'),
(9, 'malak', 'malak@yahoo.com', NULL, '$2y$10$Fbz28.cVV8/Lav3SI7xum.vimveQqR6fXTCj682rUdY63IsM8Zwqi', NULL, '2020-10-07 22:44:38', '2020-10-07 22:44:38');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `messages_user_id_foreign` (`user_id`),
  ADD KEY `messages_reciver_id_foreign` (`reciver_id`);

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
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_reciver_id_foreign` FOREIGN KEY (`reciver_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `messages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
