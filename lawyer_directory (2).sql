-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Jul 18, 2026 at 09:00 AM
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
-- Database: `lawyer_directory`
--

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int(11) NOT NULL,
  `city_name` varchar(100) NOT NULL,
  `slug` varchar(120) NOT NULL,
  `state` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `city_name`, `slug`, `state`, `created_at`) VALUES
(1, 'Mumbai', 'mumbai', 'Maharashtra', '2026-07-14 07:05:11'),
(2, 'Pune', 'pune', 'Maharashtra', '2026-07-14 07:05:11'),
(3, 'Delhi', 'delhi', 'Delhi', '2026-07-14 07:05:11'),
(4, 'Bangalore', 'bangalore', 'Karnataka', '2026-07-14 07:05:11'),
(5, 'Hyderabad', 'hyderabad', 'Telangana', '2026-07-14 07:05:11'),
(6, 'Chennai', 'chennai', 'Tamil Nadu', '2026-07-14 07:05:11'),
(7, 'Ahmedabad', 'ahmedabad', 'Gujarat', '2026-07-14 07:05:11');

-- --------------------------------------------------------

--
-- Table structure for table `contact_messages`
--

CREATE TABLE `contact_messages` (
  `id` int(11) NOT NULL,
  `docket` varchar(30) NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `lawyer_id` int(11) DEFAULT NULL,
  `name` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `phone` varchar(25) DEFAULT NULL,
  `subject` varchar(180) NOT NULL,
  `message` text NOT NULL,
  `reply_message` text DEFAULT NULL,
  `status` enum('pending','responded','closed') NOT NULL DEFAULT 'pending',
  `page_url` varchar(255) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `responded_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contact_messages`
--

INSERT INTO `contact_messages` (`id`, `docket`, `user_id`, `lawyer_id`, `name`, `email`, `phone`, `subject`, `message`, `reply_message`, `status`, `page_url`, `ip_address`, `user_agent`, `responded_at`, `created_at`) VALUES
(1, 'LD-2026-3CDB', 2, 3, 'soham chavan', 'soham@gmail.com', '9875643252', 'xyza', 'xyzishidlijeofjperof\'[ma', NULL, 'pending', '/lawyer-directory/?page=lawyer-detail&id=3', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', NULL, '2026-07-14 12:20:43'),
(2, 'LD-2026-3FF5', 10, 7, 'omkar Ravanang', 'omkar@gmail.com', '', 'Need help with my matter', 'djbhjkk bczjxh vbjsdhbuo dushiod ioudopjas loishiy soidj opasjo fyohfl as[sada', NULL, 'pending', '/lawyer-directory/lawyer/omkar-ravanang', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', NULL, '2026-07-15 11:26:29'),
(3, 'LD-2026-DF6B', 16, 3, 'nikhil pal', 'nikhilpal@gmail.com', '', 'Need help with my matter', 'I need help resolving a property dispute and filing a civil case regarding ownership rights.', NULL, 'pending', '/lawyer-directory/lawyer/kabir-khan', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', NULL, '2026-07-17 15:14:38'),
(4, 'LD-2026-A741', 16, 7, 'nikhil pal', 'nikhilpal@gmail.com', '', 'Need help with my matter', 'I need legal assistance with drafting business contracts, company registration, and corporate compliance.', 'Dear Nikhil,\r\n\r\nThank you for contacting us. We have received your enquiry regarding business contracts, company registration, and corporate compliance. We will review your requirements and get back to you with the appropriate legal guidance shortly. If you have any supporting documents, please share them during our consultation.\r\n\r\nKind regards,\r\nAdv. Omkar Ravanang\r\nCorporate Lawyer', 'responded', '/lawyer-directory/lawyer/omkar-ravanang', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-18 05:42:57', '2026-07-17 15:19:45'),
(5, 'LD-2026-E0CB', 17, 13, 'atharva', 'atharva@gmail.com', '', 'Need help with my matter', 'I need legal advice regarding property registration, title verification, and ownership disputes', NULL, 'pending', '/lawyer-directory/lawyer/shankar', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', NULL, '2026-07-17 16:19:18');

-- --------------------------------------------------------

--
-- Table structure for table `lawyers`
--

CREATE TABLE `lawyers` (
  `id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(150) NOT NULL,
  `slug` varchar(180) NOT NULL,
  `designation` varchar(150) DEFAULT NULL,
  `experience` int(11) NOT NULL,
  `bio` text DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `jurisdiction` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `languages` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT 'default-lawyer.png',
  `response_minutes` int(10) UNSIGNED NOT NULL DEFAULT 120,
  `verified_at` timestamp NULL DEFAULT NULL,
  `rating` decimal(3,2) NOT NULL DEFAULT 4.50,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lawyers`
--

INSERT INTO `lawyers` (`id`, `city_id`, `user_id`, `name`, `slug`, `designation`, `experience`, `bio`, `address`, `jurisdiction`, `phone`, `email`, `languages`, `photo`, `response_minutes`, `verified_at`, `rating`, `created_at`, `updated_at`) VALUES
(1, 1, 4, 'Aarav Mehta', 'aarav-mehta', 'Senior Civil Lawyer in Mumbai', 12, 'Aarav Mehta specializes in civil disputes, property documentation, and injunction matters.', 'Fort, Mumbai', NULL, '+91-9876543210', 'aarav@example.com', 'English, Hindi', 'public/uploads/lawyers/lawyer-58a29527dcf2.png', 120, NULL, 4.80, '2026-07-14 07:05:11', '2026-07-16 07:28:31'),
(2, 3, 5, 'Priya Sharma', 'priya-sharma', 'Family Lawyer in Delhi', 9, 'Priya Sharma advises on divorce, child custody, and maintenance cases with a client-first approach.', 'Saket, Delhi', NULL, '+91-9876543211', 'priya@example.com', 'English, Hindi', 'public/uploads/lawyers/lawyer-46782a22fee2.png', 120, NULL, 4.90, '2026-07-14 07:05:11', '2026-07-16 07:28:31'),
(3, 2, 6, 'Kabir Khan', 'kabir-khan', 'Criminal Defense Lawyer in Pune', 15, 'Kabir Khan handles bail, trials, and criminal defense matters in district and sessions courts.', 'Shivajinagar, Pune', NULL, '+91-9876543212', 'kabir@example.com', 'English, Hindi, Marathi', 'public/uploads/lawyers/lawyer-9193b8495f37.png', 120, NULL, 4.60, '2026-07-14 07:05:11', '2026-07-16 07:28:31'),
(4, 7, 7, 'Neha Patel', 'neha-patel', 'Property Lawyer in Ahmedabad', 8, 'Neha Patel works on property title verification, sale deeds, and registration support.', 'CG Road, Ahmedabad', NULL, '+91-9876543213', 'neha@example.com', 'English, Gujarati, Hindi', 'public/uploads/lawyers/lawyer-2a1d19ee592a.png', 120, NULL, 4.50, '2026-07-14 07:05:11', '2026-07-15 10:52:48'),
(5, 4, 8, 'Rohit Verma', 'rohit-verma', 'Corporate Lawyer in Bangalore', 11, 'Rohit Verma helps startups and SMEs with contracts, incorporation, and compliance.', 'Indiranagar, Bangalore', NULL, '+91-9876543214', 'rohit@example.com', 'English, Hindi', 'public/uploads/lawyers/lawyer-325456be2535.png', 120, NULL, 4.20, '2026-07-14 07:05:11', '2026-07-16 07:28:31'),
(6, 6, 9, 'Sara Iyer', 'sara-iyer', 'Consumer Lawyer in Chennai', 7, 'Sara Iyer represents consumers in product, service, and e-commerce disputes.', 'T Nagar, Chennai', NULL, '+91-9876543215', 'sara@example.com', 'English, Tamil', 'public/uploads/lawyers/lawyer-eb9d39696628.png', 120, NULL, 4.70, '2026-07-14 07:05:11', '2026-07-16 07:28:31'),
(7, 1, 10, 'omkar Ravanang', 'omkar-ravanang', 'Corporate Lawyer in Mumbai', 8, 'Corporate lawyer with over 8 years of experience advising businesses on company formation, mergers and acquisitions, contract drafting, regulatory compliance, and commercial disputes. Dedicated to providing practical legal solutions while protecting clients\' business interests through strategic legal guidance', 'Fort, Mumbai', NULL, '9165874123', 'omkar@gmail.com', 'English, Hindi, Marathi', 'default-lawyer.png', 120, NULL, 4.00, '2026-07-15 11:24:08', '2026-07-16 07:28:31'),
(8, 5, 11, 'Sana Qureshi', 'sana-qureshi', 'Civil Lawyer in Hyderabad', 10, 'Sana Qureshi handles contracts, recovery matters, and property disputes with a practical client-first approach.', 'Banjara Hills, Hyderabad', NULL, '+91-9876543216', 'sana@example.com', 'English, Hindi, Telugu', 'lawyer-7.jpg', 130, '2026-07-17 14:05:04', 4.50, '2026-07-17 14:05:04', '2026-07-17 14:05:04'),
(9, 1, 12, 'Vikram Singh', 'vikram-singh', 'Corporate Lawyer in Mumbai', 13, 'Vikram Singh advises startups and growing businesses on company formation, funding, and commercial contracts.', 'Andheri West, Mumbai', NULL, '+91-9876543217', 'vikram@example.com', 'English, Hindi, Marathi', 'lawyer-8.jpg', 105, '2026-07-17 14:05:04', 4.50, '2026-07-17 14:05:04', '2026-07-17 14:05:04'),
(10, 4, 13, 'Ananya Rao', 'ananya-rao', 'Property Lawyer in Bangalore', 9, 'Ananya Rao focuses on title verification, sale deed drafting, and registration support for residential and commercial properties.', 'Koramangala, Bangalore', NULL, '+91-9876543218', 'ananya@example.com', 'English, Kannada, Hindi', 'lawyer-9.jpg', 145, '2026-07-17 14:05:04', 4.50, '2026-07-17 14:05:04', '2026-07-17 14:05:04'),
(11, 6, 14, 'Faisal Ahmed', 'faisal-ahmed', 'Criminal Lawyer in Chennai', 11, 'Faisal Ahmed represents clients in bail, trial, and appeal matters with detailed preparation and strategic advocacy.', 'Anna Nagar, Chennai', NULL, '+91-9876543219', 'faisal@example.com', 'English, Tamil, Urdu', 'lawyer-10.jpg', 115, '2026-07-17 14:05:04', 4.50, '2026-07-17 14:05:04', '2026-07-17 14:05:04'),
(12, 3, 15, 'Deepika Menon', 'deepika-menon', 'Family Lawyer in Delhi', 8, 'Deepika Menon advises on divorce, custody, maintenance, and mediation matters with calm, clear communication.', 'Lajpat Nagar, Delhi', NULL, '+91-9876543220', 'deepika@example.com', 'English, Hindi, Malayalam', 'lawyer-11.jpg', 138, '2026-07-17 14:05:04', 4.50, '2026-07-17 14:05:04', '2026-07-17 14:05:04'),
(13, 2, 18, 'shankar', 'shankar', 'Corporate Lawyer in Bangalore', 7, 'Corporate lawyer with extensive experience in company formation, commercial contracts, mergers and acquisitions, regulatory compliance, corporate governance, and business advisory services. Focused on helping businesses operate legally and efficiently', 'Shivajinagar, Pune', 'high court of bombay', '9188774453', 'shankar@gmail.com', 'English, Hindi, Marathi', 'public/uploads/lawyers/lawyer-da8b92588bce.png', 120, NULL, 4.50, '2026-07-17 16:17:47', '2026-07-17 16:17:47');

-- --------------------------------------------------------

--
-- Table structure for table `lawyer_practice`
--

CREATE TABLE `lawyer_practice` (
  `lawyer_id` int(11) NOT NULL,
  `practice_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lawyer_practice`
--

INSERT INTO `lawyer_practice` (`lawyer_id`, `practice_id`) VALUES
(1, 1),
(1, 5),
(2, 3),
(2, 6),
(3, 1),
(3, 2),
(4, 5),
(5, 1),
(5, 4),
(6, 6),
(7, 4),
(8, 1),
(8, 5),
(9, 1),
(9, 4),
(10, 5),
(10, 6),
(11, 2),
(11, 6),
(12, 3),
(12, 5),
(13, 1),
(13, 2),
(13, 3),
(13, 4),
(13, 5),
(13, 6);

-- --------------------------------------------------------

--
-- Table structure for table `practice_areas`
--

CREATE TABLE `practice_areas` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(120) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `practice_areas`
--

INSERT INTO `practice_areas` (`id`, `name`, `slug`, `created_at`) VALUES
(1, 'Civil Lawyer', 'civil-lawyer', '2026-07-14 07:05:11'),
(2, 'Criminal Lawyer', 'criminal-lawyer', '2026-07-14 07:05:11'),
(3, 'Family Lawyer', 'family-lawyer', '2026-07-14 07:05:11'),
(4, 'Corporate Lawyer', 'corporate-lawyer', '2026-07-14 07:05:11'),
(5, 'Property Lawyer', 'property-lawyer', '2026-07-14 07:05:11'),
(6, 'Consumer Lawyer', 'consumer-lawyer', '2026-07-14 07:05:11');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `role` enum('client','lawyer') NOT NULL,
  `name` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `phone` varchar(25) DEFAULT NULL,
  `city_id` int(10) UNSIGNED DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `lawyer_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role`, `name`, `email`, `password_hash`, `phone`, `city_id`, `avatar`, `lawyer_id`, `created_at`, `updated_at`) VALUES
(1, 'client', 'Paras Chavan', 'paras@gmail.com', '$2y$10$vbRNZQ1t2YzqsOqEN/Y1KOFNDzrvXbnuWVYbELJ89pBze/e64FLb.', '7721331866', 1, NULL, NULL, '2026-07-14 09:55:11', '2026-07-14 12:07:00'),
(2, 'client', 'soham chavan', 'soham@gmail.com', '$2y$10$mHCbbHJxm4MyEcYgelqBK.rzs8RcsRKeGaqngF0aDAJ8NyMSPiD3S', '9177551234', 4, 'public/uploads/clients/client-8cc7bd75b195.png', NULL, '2026-07-14 12:12:39', '2026-07-15 07:29:01'),
(3, 'client', 'paras chavan', 'paras12@gmail.com', '$2y$10$4l3ZVcCZbGVfVhcN0JzjcOkpLoXe4cqawkemsUK2lKHNcLH10ihfe', '9188774455', 6, 'public/uploads/clients/client-94c516cb4ab5.png', NULL, '2026-07-15 06:34:16', '2026-07-15 07:18:13'),
(4, 'lawyer', 'Aarav Mehta', 'aarav@example.com', '$2y$10$RJ20fxWXghiGeGkUwRAZWOqMXk8TFNxNftklcTucArFxHA0zN6h4i', '+91-9876543210', 1, 'lawyer-1.jpg', 1, '2026-07-15 09:58:18', '2026-07-15 09:58:18'),
(5, 'lawyer', 'Priya Sharma', 'priya@example.com', '$2y$10$RJ20fxWXghiGeGkUwRAZWOqMXk8TFNxNftklcTucArFxHA0zN6h4i', '+91-9876543211', 3, 'lawyer-2.jpg', 2, '2026-07-15 09:58:18', '2026-07-15 09:58:18'),
(6, 'lawyer', 'Kabir Khan', 'kabir@example.com', '$2y$10$RJ20fxWXghiGeGkUwRAZWOqMXk8TFNxNftklcTucArFxHA0zN6h4i', '+91-9876543212', 2, 'lawyer-3.jpg', 3, '2026-07-15 09:58:18', '2026-07-15 09:58:18'),
(7, 'lawyer', 'Neha Patel', 'neha@example.com', '$2y$10$RJ20fxWXghiGeGkUwRAZWOqMXk8TFNxNftklcTucArFxHA0zN6h4i', '+91-9876543213', 7, 'lawyer-4.jpg', 4, '2026-07-15 09:58:18', '2026-07-15 09:58:18'),
(8, 'lawyer', 'Rohit Verma', 'rohit@example.com', '$2y$10$RJ20fxWXghiGeGkUwRAZWOqMXk8TFNxNftklcTucArFxHA0zN6h4i', '+91-9876543214', 4, 'lawyer-5.jpg', 5, '2026-07-15 09:58:18', '2026-07-15 09:58:18'),
(9, 'lawyer', 'Sara Iyer', 'sara@example.com', '$2y$10$RJ20fxWXghiGeGkUwRAZWOqMXk8TFNxNftklcTucArFxHA0zN6h4i', '+91-9876543215', 6, 'lawyer-6.jpg', 6, '2026-07-15 09:58:18', '2026-07-15 09:58:18'),
(10, 'lawyer', 'omkar Ravanang', 'omkar@gmail.com', '$2y$10$Sj0w5B27iGi0iVitsLYlr.GghjMeSPnAPn.3RjH8QOLCqCJZ57DTi', '9165874123', 1, NULL, 7, '2026-07-15 11:24:08', '2026-07-15 11:24:08'),
(11, 'lawyer', 'Sana Qureshi', 'sana@example.com', '$2y$10$Kmhb.5VyVgSTDoaiJmfwluVt3WBFEGHIZQMSSsvBEzxI9tP5IjF.e', '+91 98765 43216', 5, 'lawyer-7.jpg', 8, '2026-07-17 14:05:04', '2026-07-17 14:05:04'),
(12, 'lawyer', 'Vikram Singh', 'vikram@example.com', '$2y$10$Kmhb.5VyVgSTDoaiJmfwluVt3WBFEGHIZQMSSsvBEzxI9tP5IjF.e', '+91 98765 43217', 1, 'lawyer-8.jpg', 9, '2026-07-17 14:05:04', '2026-07-17 14:05:04'),
(13, 'lawyer', 'Ananya Rao', 'ananya@example.com', '$2y$10$Kmhb.5VyVgSTDoaiJmfwluVt3WBFEGHIZQMSSsvBEzxI9tP5IjF.e', '+91 98765 43218', 4, 'lawyer-9.jpg', 10, '2026-07-17 14:05:04', '2026-07-17 14:05:04'),
(14, 'lawyer', 'Faisal Ahmed', 'faisal@example.com', '$2y$10$Kmhb.5VyVgSTDoaiJmfwluVt3WBFEGHIZQMSSsvBEzxI9tP5IjF.e', '+91 98765 43219', 6, 'lawyer-10.jpg', 11, '2026-07-17 14:05:04', '2026-07-17 14:05:04'),
(15, 'lawyer', 'Deepika Menon', 'deepika@example.com', '$2y$10$Kmhb.5VyVgSTDoaiJmfwluVt3WBFEGHIZQMSSsvBEzxI9tP5IjF.e', '+91 98765 43220', 3, 'lawyer-11.jpg', 12, '2026-07-17 14:05:04', '2026-07-17 14:05:04'),
(16, 'client', 'nikhil pal', 'nikhilpal@gmail.com', '$2y$10$3GhA7zCDcZColgl17xpLPe99/h5F8PeIPAzsiC3fRPXsMdWNqzfk2', '9155632147', 3, NULL, NULL, '2026-07-17 15:00:12', '2026-07-17 15:00:12'),
(17, 'client', 'atharva', 'atharva@gmail.com', '$2y$10$HJDjY20joB55ohNesV1x1OrYU1T2VTrUh6uG8.Dyvs2uxsbBd7gXq', '9188774459', 5, 'public/uploads/clients/client-e72846379e97.png', NULL, '2026-07-17 16:14:24', '2026-07-17 16:15:20'),
(18, 'lawyer', 'shankar', 'shankar@gmail.com', '$2y$10$5OU/2J2yvs5cUc1Sk/vyVOhwWP//4lOzmPThrC4aSBIiBk2pzOFN6', '9188774453', 2, 'public/uploads/lawyers/lawyer-da8b92588bce.png', 13, '2026-07-17 16:17:47', '2026-07-17 16:17:47');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `idx_city_slug` (`slug`);

--
-- Indexes for table `contact_messages`
--
ALTER TABLE `contact_messages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_contact_messages_docket` (`docket`),
  ADD KEY `idx_contact_messages_lawyer` (`lawyer_id`),
  ADD KEY `idx_contact_messages_created_at` (`created_at`);

--
-- Indexes for table `lawyers`
--
ALTER TABLE `lawyers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `idx_lawyer_name` (`name`),
  ADD KEY `idx_city` (`city_id`),
  ADD KEY `idx_slug` (`slug`);

--
-- Indexes for table `lawyer_practice`
--
ALTER TABLE `lawyer_practice`
  ADD PRIMARY KEY (`lawyer_id`,`practice_id`),
  ADD KEY `fk_practice` (`practice_id`);

--
-- Indexes for table `practice_areas`
--
ALTER TABLE `practice_areas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `idx_practice_slug` (`slug`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_users_email` (`email`),
  ADD UNIQUE KEY `uq_users_lawyer_id` (`lawyer_id`),
  ADD KEY `idx_users_city` (`city_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `contact_messages`
--
ALTER TABLE `contact_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `lawyers`
--
ALTER TABLE `lawyers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `practice_areas`
--
ALTER TABLE `practice_areas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `contact_messages`
--
ALTER TABLE `contact_messages`
  ADD CONSTRAINT `fk_contact_messages_lawyer` FOREIGN KEY (`lawyer_id`) REFERENCES `lawyers` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `lawyers`
--
ALTER TABLE `lawyers`
  ADD CONSTRAINT `fk_city` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `lawyer_practice`
--
ALTER TABLE `lawyer_practice`
  ADD CONSTRAINT `fk_lawyer` FOREIGN KEY (`lawyer_id`) REFERENCES `lawyers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_practice` FOREIGN KEY (`practice_id`) REFERENCES `practice_areas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
