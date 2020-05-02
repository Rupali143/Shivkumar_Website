-- phpMyAdmin SQL Dump
-- version 3.5.8.2
-- http://www.phpmyadmin.net
--
-- Host: sql312.byethost.com
-- Generation Time: Aug 31, 2018 at 06:07 AM
-- Server version: 5.6.41-84.1
-- PHP Version: 5.3.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `b11_22278125_studbizz`
--

-- --------------------------------------------------------

--
-- Table structure for table `blog_vote`
--

CREATE TABLE IF NOT EXISTS `blog_vote` (
  `vote_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `blog_vote` float unsigned NOT NULL,
  `blog_id` int(10) unsigned NOT NULL,
  `ip_address` varchar(20) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`vote_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

CREATE TABLE IF NOT EXISTS `chats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topic` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `admin` varchar(200) NOT NULL,
  `admin_uid` int(10) NOT NULL,
  `messages` int(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `chats`
--

INSERT INTO `chats` (`id`, `topic`, `created_at`, `admin`, `admin_uid`, `messages`) VALUES
(1, 'Thermodynamics', '2018-07-30 08:51:05', 'Manjusha  Praveen', 50, 60),
(2, 'Aker', '2018-07-30 08:54:16', 'Manjusha  Praveen', 50, 35),
(4, '4964', '2018-08-01 09:44:37', '', 0, 3),
(5, '4962', '2018-08-01 09:49:14', '', 0, 12),
(6, 'dsfsdfsfsfd', '2018-08-29 09:58:07', 'Manjusha Praveen', 6, 0),
(7, 'de', '2018-08-29 09:59:18', 'Manjusha Praveen', 6, 0);

-- --------------------------------------------------------

--
-- Table structure for table `chats_details`
--

CREATE TABLE IF NOT EXISTS `chats_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `chat_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `chats_messages`
--

CREATE TABLE IF NOT EXISTS `chats_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chat_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `content` text,
  `is_image` tinyint(1) NOT NULL DEFAULT '0',
  `is_read` enum('0','1') NOT NULL DEFAULT '0',
  `is_doc` enum('0','1') DEFAULT NULL,
  `is_blocked` int(10) NOT NULL DEFAULT '0',
  `is_liked` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=117 ;

--
-- Dumping data for table `chats_messages`
--

INSERT INTO `chats_messages` (`id`, `chat_id`, `user_id`, `content`, `is_image`, `is_read`, `is_doc`, `is_blocked`, `is_liked`, `created_at`) VALUES
(1, 1, 50, 'helloo', 0, '1', NULL, 1, 0, '2018-07-30 08:51:11'),
(2, 1, 50, 'grr', 0, '1', NULL, 0, 0, '2018-07-30 08:52:22'),
(3, 1, 50, 'hello folkss!!!', 0, '1', NULL, 0, 0, '2018-07-30 08:53:44'),
(4, 2, 50, 'greerr', 0, '1', NULL, 0, 0, '2018-07-30 08:55:53'),
(5, 2, 50, 'zddfsdfd', 0, '1', NULL, 0, 0, '2018-07-30 08:57:12'),
(6, 1, 50, 'baaaaabuuu', 0, '1', NULL, 0, 0, '2018-07-30 08:59:06'),
(7, 1, 50, 'ewrwrw', 0, '1', NULL, 0, 0, '2018-07-30 10:08:45'),
(8, 1, 50, 'erwrw', 0, '1', NULL, 0, 0, '2018-07-30 10:08:46'),
(9, 1, 50, 'rwerwr', 0, '1', NULL, 0, 0, '2018-07-30 10:08:47'),
(10, 1, 50, 'erwre', 0, '1', NULL, 0, 0, '2018-07-30 10:08:47'),
(11, 1, 50, 'rwerwer', 0, '1', NULL, 1, 0, '2018-07-30 10:08:48'),
(12, 1, 50, 'werwer', 0, '1', NULL, 0, 0, '2018-07-30 10:08:49'),
(13, 1, 50, 'ewr', 0, '1', NULL, 0, 0, '2018-07-30 10:08:49'),
(14, 1, 50, 'rwerwr', 0, '1', NULL, 0, 0, '2018-07-30 10:08:50'),
(15, 1, 50, 'werw', 0, '1', NULL, 0, 0, '2018-07-30 10:08:51'),
(16, 1, 50, 'rwerwer', 0, '1', NULL, 1, 0, '2018-07-30 10:08:51'),
(17, 2, 50, 'jsafhlkhdsfg', 0, '1', NULL, 0, 0, '2018-07-30 10:08:58'),
(18, 2, 50, 'dkhgsdjkhgdsf', 0, '1', NULL, 0, 0, '2018-07-30 10:08:59'),
(19, 2, 50, 'fgksdhkfdsg', 0, '1', NULL, 0, 0, '2018-07-30 10:09:01'),
(20, 2, 50, 'fdsfgdf', 0, '1', NULL, 0, 0, '2018-07-30 10:09:01'),
(21, 2, 50, 'fd', 0, '1', NULL, 0, 0, '2018-07-30 10:09:02'),
(22, 2, 50, 'f', 0, '1', NULL, 0, 0, '2018-07-30 10:09:02'),
(23, 2, 50, 'f', 0, '1', NULL, 0, 0, '2018-07-30 10:09:02'),
(24, 2, 50, 'f', 0, '1', NULL, 0, 0, '2018-07-30 10:09:02'),
(25, 2, 50, 'f', 0, '1', NULL, 0, 0, '2018-07-30 10:09:03'),
(26, 2, 50, 'f', 0, '1', NULL, 0, 0, '2018-07-30 10:09:03'),
(27, 2, 50, 'f', 0, '1', NULL, 0, 0, '2018-07-30 10:09:03'),
(28, 2, 50, 'f', 0, '1', NULL, 0, 0, '2018-07-30 10:09:03'),
(29, 2, 50, 'f', 0, '1', NULL, 0, 0, '2018-07-30 10:09:04'),
(30, 2, 50, 'f', 0, '1', NULL, 0, 0, '2018-07-30 10:09:04'),
(31, 2, 50, 'f', 0, '1', NULL, 0, 0, '2018-07-30 10:09:04'),
(32, 2, 50, 'fgdsfgdfsg', 0, '1', NULL, 0, 0, '2018-07-30 10:09:05'),
(33, 2, 50, 'ffsgfd', 0, '1', NULL, 0, 0, '2018-07-30 10:09:06'),
(34, 2, 50, 'fdgdsfgsdf', 0, '1', NULL, 0, 0, '2018-07-30 10:09:07'),
(35, 2, 50, 'gfdgsd', 0, '1', NULL, 0, 0, '2018-07-30 10:09:07'),
(36, 2, 50, 'fgfdsg', 0, '1', NULL, 0, 0, '2018-07-30 10:09:07'),
(37, 2, 50, 'sdfg', 0, '1', NULL, 9, 0, '2018-07-30 10:09:08'),
(38, 2, 50, 'dfsgsfd', 0, '1', NULL, 0, 0, '2018-07-30 10:09:08'),
(39, 2, 50, 'gfdg', 0, '1', NULL, 0, 0, '2018-07-30 10:09:08'),
(40, 2, 50, 'sdfg', 0, '1', NULL, 9, 0, '2018-07-30 10:09:09'),
(41, 2, 50, 'sdfg', 0, '1', NULL, 9, 0, '2018-07-30 10:09:09'),
(48, 1, 50, 'fdsfs', 0, '1', NULL, 0, 0, '2018-07-30 10:14:08'),
(49, 1, 50, 'sdfdsf', 0, '1', NULL, 0, 0, '2018-07-30 10:14:09'),
(50, 1, 50, 'dsf', 0, '1', NULL, 0, 0, '2018-07-30 10:14:10'),
(51, 1, 50, 'fsdf', 0, '1', NULL, 0, 0, '2018-07-30 10:14:10'),
(52, 1, 50, 'dsfs', 0, '1', NULL, 0, 0, '2018-07-30 10:14:10'),
(53, 1, 50, 'f', 0, '1', NULL, 0, 0, '2018-07-30 10:14:11'),
(54, 1, 50, 'f', 0, '1', NULL, 0, 0, '2018-07-30 10:14:11'),
(55, 1, 50, 'f', 0, '1', NULL, 0, 0, '2018-07-30 10:14:11'),
(56, 1, 50, 'f', 0, '1', NULL, 0, 0, '2018-07-30 10:14:12'),
(57, 1, 50, 'f', 0, '1', NULL, 0, 0, '2018-07-30 10:14:12'),
(58, 1, 50, 'f', 0, '1', NULL, 0, 0, '2018-07-30 10:14:12'),
(59, 1, 50, 'f', 0, '1', NULL, 0, 0, '2018-07-30 10:14:12'),
(60, 1, 50, 'f', 0, '1', NULL, 0, 0, '2018-07-30 10:14:12'),
(61, 1, 50, 'f', 0, '1', NULL, 0, 0, '2018-07-30 10:14:13'),
(62, 1, 50, 'f', 0, '1', NULL, 0, 0, '2018-07-30 10:14:13'),
(63, 1, 50, 'f', 0, '1', NULL, 0, 0, '2018-07-30 10:14:13'),
(64, 1, 50, 'f', 0, '1', NULL, 0, 0, '2018-07-30 10:14:13'),
(65, 1, 50, 'f', 0, '1', NULL, 0, 0, '2018-07-30 10:14:14'),
(66, 1, 50, 'f', 0, '1', NULL, 0, 0, '2018-07-30 10:14:14'),
(67, 1, 50, 'sdfsadf', 0, '1', NULL, 0, 0, '2018-07-30 10:14:15'),
(68, 1, 50, 'fdsf', 0, '1', NULL, 0, 0, '2018-07-30 10:14:15'),
(69, 1, 50, 'dsf', 0, '1', NULL, 0, 0, '2018-07-30 10:14:15'),
(70, 1, 50, 'dsfasdf', 0, '1', NULL, 0, 0, '2018-07-30 10:14:16'),
(71, 1, 50, 'fdsfasf', 0, '1', NULL, 0, 0, '2018-07-30 10:14:17'),
(72, 1, 50, 'dsfasd', 0, '1', NULL, 0, 0, '2018-07-30 10:14:17'),
(73, 1, 50, 'fdsfsdafsafd', 0, '1', NULL, 0, 0, '2018-07-30 10:14:18'),
(74, 1, 50, 'dsfsafdsad', 0, '1', NULL, 0, 0, '2018-07-30 10:14:19'),
(75, 1, 50, 'fsdf', 0, '1', NULL, 0, 0, '2018-07-30 10:14:19'),
(76, 1, 50, 'sdfsadf', 0, '1', NULL, 0, 0, '2018-07-30 10:14:20'),
(77, 1, 50, 'adsfs', 0, '1', NULL, 0, 0, '2018-07-30 10:14:20'),
(78, 1, 50, 'dfsaf', 0, '1', NULL, 1, 0, '2018-07-30 10:14:21'),
(102, 5, 49, 'gfghfghf', 0, '0', NULL, 0, 0, '2018-08-01 09:49:19'),
(103, 5, 49, 'fghfghfgh', 0, '0', NULL, 0, 0, '2018-08-01 09:49:20'),
(104, 5, 49, 'ghfhf', 0, '0', NULL, 0, 0, '2018-08-01 09:49:21'),
(105, 5, 49, 'fghfgh', 0, '0', NULL, 0, 0, '2018-08-01 09:49:22'),
(106, 5, 49, 'fghfh', 0, '0', NULL, 0, 0, '2018-08-01 09:49:23'),
(107, 5, 49, 'fghfghfg', 0, '0', NULL, 0, 0, '2018-08-01 09:49:24'),
(108, 5, 49, 'gfhfh', 0, '0', NULL, 0, 0, '2018-08-01 09:49:25'),
(109, 5, 49, 'gfhfgh', 0, '0', NULL, 0, 0, '2018-08-01 09:49:26'),
(110, 5, 49, 'fghfghfg', 0, '0', NULL, 0, 0, '2018-08-01 09:49:28'),
(111, 5, 49, 'fghfg', 0, '0', NULL, 0, 0, '2018-08-01 09:49:29'),
(112, 5, 49, 'fghfh', 0, '0', NULL, 0, 0, '2018-08-01 09:49:30'),
(113, 5, 49, 'fghf', 0, '0', NULL, 1, 0, '2018-08-01 09:49:32'),
(114, 2, 49, 'juju', 0, '1', NULL, 1, 0, '2018-08-01 10:22:12'),
(115, 4, 49, 'kj', 0, '0', NULL, 0, 0, '2018-08-07 10:54:04'),
(116, 7, 49, 'fghfgh', 0, '1', NULL, 1, 0, '2018-08-09 07:54:58');

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE IF NOT EXISTS `ci_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ci_sessions`
--

INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('0074d1cbc04dbea9b65e751939fdf6f6a2e0ae4e', '::1', 1529401682, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393430313537353b),
('05c3a9421e5aec733e0e116ed819cf42b8e9f6a7', '::1', 1529396704, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393339363639313b),
('07645f7cf67e380f01754955cd54ee6ed8479870', '::1', 1529385142, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393338353134323b),
('0e4ab7f09307745206f7301c388f400d3af4e60c', '::1', 1529471740, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393437313733393b),
('0e53e97173aec749cc26ab084b146e40f0a23785', '::1', 1529325357, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393332353333353b),
('10cf3c2cd3a4342f8d34611146cc88713a2ffcf4', '::1', 1529472788, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393437323636303b),
('17f25cbe46059d66c076396cc761609acbcb7f09', '::1', 1529473513, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393437333333303b),
('19a20e30418dd1c637be96ce26c56fbfddc8a7cc', '::1', 1529471916, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393437313931363b),
('19a792fdd95a4ad263d2552b00bec573e90cc684', '192.168.1.6', 1530510150, 0x5f5f63695f6c6173745f726567656e65726174657c693a313533303531303130313b757365725f69647c693a323b757365726e616d657c733a353a224d616e6a75223b6c6f676765645f696e7c623a313b69735f636f6e6669726d65647c623a303b69735f61646d696e7c623a303b),
('1a181a754b82f2334f22f176b3b1993cc00acaa4', '::1', 1529479090, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393437393034343b),
('1ab0404839f38bd4ac0e85224333526bc90398c9', '::1', 1529322471, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393332323437313b),
('20dfc1c8316cd107ec1b775aeda6073cfe436343', '::1', 1529392945, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393339323934343b),
('2fe7fec8e61848768e8ffb199c79f4ebdc47b2d1', '::1', 1529383899, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393338333639303b),
('3135e59dfba5e6deb784e5d7d42bd6a7bce2ca68', '::1', 1529389265, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393338393230393b),
('3771c4cb31b817439d47ab52e1ae0c6969d3ade9', '::1', 1529471780, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393437313736373b),
('37f6c703d540dabbff3705e2c6b2d72781119e7c', '::1', 1529388043, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393338383034333b),
('38c3ab1626446434019570ba013bbb2500523a9a', '::1', 1529477605, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393437373537373b),
('39d5e0a30e814f2d42986e21dbe2c97f3446948c', '::1', 1529302297, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393330323239303b),
('3b394fc06a0a49fdf119f710d9de9db97f5a89c5', '::1', 1529387652, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393338373635323b),
('3cb4db818edf69c27f0d427b0333f65b19348f05', '::1', 1529381938, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393338313933383b),
('3d6f03fd6ac56fdd251295037160f27aa6270626', '192.168.1.9', 1529482446, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393438323434303b),
('3d8e97ed8f2d52923270b1b86f44b98af41c486e', '::1', 1529408706, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393430383533323b),
('421fb9ee671772a82b27b8f2381cdd0b2e16a559', '::1', 1529402767, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393430323736303b),
('42699f425156bb53126c710ce49e101ff80fd122', '::1', 1529314385, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393331343336343b),
('4328f045f4c41c7f4d2d4e057ca9429262b0b8e2', '::1', 1529326099, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393332363039393b),
('4393df68213d92ad50cb672b356966b0fee4fa62', '::1', 1529473237, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393437333233373b),
('45c7bf9921680d3650f1921babcf3834a1aa9f45', '192.168.1.6', 1530507728, 0x5f5f63695f6c6173745f726567656e65726174657c693a313533303530373536373b),
('4a64a72b635d4416d5978ae35b090d089a370af0', '::1', 1529147476, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393134373332353b757365725f69647c693a313b757365726e616d657c733a343a2252757073223b6c6f676765645f696e7c623a313b69735f636f6e6669726d65647c623a313b69735f61646d696e7c623a303b),
('4df17b9f0f7c329716b24ebc05cce3279e29f32c', '::1', 1529402170, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393430313939313b),
('4ea11549214cbd356a63cc910448ab304ffe7637', '::1', 1529392353, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393339323239363b),
('509c68e189d5787e1f77c5b29eda35fd00bb01d0', '::1', 1529472465, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393437323430393b),
('537821abc54d5a2a74f51512e6d5d83887176384', '::1', 1529473551, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393437333534333b),
('578b7e2dc1f1bd575812bc0276e2596f06ce0c03', '::1', 1529405679, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393430353531343b),
('5a1ed891db6361833155c8bf01adb84971f41b5b', '::1', 1529476491, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393437363436353b),
('5be22fca1a5dd2cfef77488e10afd5de65286f91', '::1', 1529303126, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393330333132363b),
('61463babf09ce79bbb8afb873c93431270d83de4', '::1', 1529477195, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393437373037373b),
('62f05430b58d81eeea9f16ac5778e67824923b34', '::1', 1529496131, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393439363133313b),
('654b7593414d58504eb37831f5998180c75b7246', '::1', 1529398152, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393339383135323b),
('65fc9b30220e88d17d8b14cedef8e8a5b868eb83', '::1', 1529384544, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393338343435373b),
('66ef9119dc902b61a9f9e8a8b21ae2f492d608a1', '::1', 1529389103, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393338393033373b),
('69870b85b2105c8a8ff6e846cd764d3e5ca9871d', '::1', 1529394116, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393339343035323b),
('6ae268b595a284d8174e71b5d5fd91520992f781', '::1', 1529477304, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393437373330313b),
('6dbc5906c1f91d11196f0d74272400573b5dedec', '::1', 1529391156, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393339313039393b),
('7304749965d95702e246e205a3be12ef447bdcea', '192.168.1.6', 1530511073, 0x5f5f63695f6c6173745f726567656e65726174657c693a313533303531313034353b757365725f69647c693a313b757365726e616d657c733a343a2252757073223b6c6f676765645f696e7c623a313b69735f636f6e6669726d65647c623a313b69735f61646d696e7c623a303b),
('73812e881cb66de61638f1197afff72a453d29b9', '::1', 1529471229, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393437313036323b),
('738dd1ec64a2d730b59522f0db92c9ba6f7fe9fa', '::1', 1529476661, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393437363636303b),
('73jaqjhsf8opeklbhdvid5kph1soo8nk', '192.168.1.6', 1529483029, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393438323735353b),
('7562f15a09937ac9a00863fc53ab5d0a0e2958df', '::1', 1529397483, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393339373438303b),
('77b5fd55e14e1af6b9cded090628de0e04983023', '::1', 1529391628, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393339313632383b),
('79c7e0d6df258c78f30d667e5e508a746214cd20', '::1', 1529385634, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393338353533313b),
('7b1969062f5ee600d36f563001eb0aa5dcf01cca', '::1', 1529400835, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393430303832313b),
('7dfd197d3b79bb4609f31dfd381ae2d40630ea6f', '192.168.1.9', 1529479899, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393437393839363b),
('8144fea483fe276d960441f6285df75f6a3a8945', '::1', 1529471855, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393437313833373b),
('8253ad0c121abb30c7dde8e83c0a1d7a0b526939', '::1', 1529399424, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393339393332393b757365725f69647c693a313b757365726e616d657c733a343a2252757073223b6c6f676765645f696e7c623a313b69735f636f6e6669726d65647c623a313b69735f61646d696e7c623a303b),
('87d8444c273cc935144de195b76aff329db9c057', '::1', 1529398063, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393339373833363b),
('970ad533c3b5639c26902a2a660a91389b48911d', '::1', 1529399896, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393339393835313b),
('9b4bb8e7a5c8e01114f9a6f896066934f6e3730c', '::1', 1529383510, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393338333432393b),
('9dc9afe993526053e8fa44e40cb160ba81da6c54', '192.168.1.9', 1529482379, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393438323337393b),
('9e071974c8dab2cf523e1ed8cb13d6258526d5bb', '::1', 1529472577, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393437323437343b),
('9ff898745dda2d6ce8d7d40ecb7edcaf8fd0e353', '::1', 1529302197, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393330323030323b757365725f69647c693a323b757365726e616d657c733a353a224d616e6a75223b6c6f676765645f696e7c623a313b69735f636f6e6669726d65647c623a303b69735f61646d696e7c623a303b),
('a1b957ab862df4f87d2515ada7ee92e5c0db151c', '::1', 1529475667, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393437353635353b),
('a45848b230dccb0c699eb478d9ccc59ee0dfabbc', '::1', 1530507563, 0x5f5f63695f6c6173745f726567656e65726174657c693a313533303530373536333b),
('a696113627d30c06ef17dba88af8357054aa990c', '::1', 1529469445, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393436393335343b757365725f69647c693a313b757365726e616d657c733a343a2252757073223b6c6f676765645f696e7c623a313b69735f636f6e6669726d65647c623a313b69735f61646d696e7c623a303b),
('aaa6aabd3b11c95a9339482a142baea3b3e21a6e', '::1', 1529471668, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393437313633343b),
('ac53dc39ca4db21936157700fcf66a61c65fe210', '::1', 1529146854, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393134363835343b),
('acbef2903445b66dfd9452bd7e0f09b1bca9f06e', '::1', 1529471684, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393437313637373b),
('ae1dd116a24dc0b0ed3b73723ea2b65ecd3b2e17', '::1', 1529384288, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393338343238383b),
('b10ae0a224a1c2a37dc930af4210215dd89180cc', '::1', 1529389776, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393338393737363b),
('b717d7069c2f0562adf0f2e21dcb0f0efc25e5b5', '::1', 1529295488, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393239353334323b757365725f69647c693a313b757365726e616d657c733a343a2252757073223b6c6f676765645f696e7c623a313b69735f636f6e6669726d65647c623a313b69735f61646d696e7c623a303b),
('b8a4180c211bb59eb60d99f1a6b7dd127d0650b8', '::1', 1529403079, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393430323834383b757365725f69647c693a313b757365726e616d657c733a343a2252757073223b6c6f676765645f696e7c623a313b69735f636f6e6669726d65647c623a313b69735f61646d696e7c623a303b),
('b972ce54c446853d25155290d9fc2d7f4e1a0849', '::1', 1529390192, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393339303030383b),
('c82ef0c633dcdf1ad555a534f7ab4330fee0214a', '::1', 1529471302, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393437313237393b757365725f69647c693a313b757365726e616d657c733a343a2252757073223b6c6f676765645f696e7c623a313b69735f636f6e6669726d65647c623a313b69735f61646d696e7c623a303b),
('ccfbe1c17460e18cd3144ba50075939a924998f1', '::1', 1529147801, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393134373739373b757365725f69647c693a313b757365726e616d657c733a343a2252757073223b6c6f676765645f696e7c623a313b69735f636f6e6669726d65647c623a313b69735f61646d696e7c623a303b),
('d60556d3599bc41820e41e2f18893902d32ffe50', '::1', 1529474608, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393437343630353b),
('d846e17504b71632162d42f87cbf9d20aeb5addb', '::1', 1529320450, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393332303339353b),
('d88301f4875100d843c0196b37bb5e1120dc294a', '::1', 1529496132, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393439363133323b),
('d933bb3acb9d3b0b4c4b041fa53b5fddb50e13f6', '::1', 1529382693, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393338323434333b),
('da7dd930faa82e822ba43d71525e57ad00ad8535', '::1', 1529397256, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393339373030363b),
('dc575095d7cb31d795394943d20da958f6b9add7', '192.168.1.6', 1529496405, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393439363430303b),
('dc98d47942cfaf4d2307f1ef905c8ee9455812a4', '::1', 1529470440, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393437303231303b),
('df806db083db835e256575c13d420450ced34d23', '192.168.1.9', 1529484395, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393438343339353b),
('dfc7afa1b6f67bd04f697d97e869056d0ad07013', '::1', 1529408828, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393430383735323b),
('e2ab9e5594e58f0c048e80f69f097bb72d9a00e1', '::1', 1529391051, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393339303735353b),
('e56dacfc53c0170c9934209cc1e20732bc1bfe27', '::1', 1529478100, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393437373936383b),
('e8f1ad2765bead9ce35969651d099f042b1c8db6', '::1', 1529471872, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393437313837313b),
('ea773dfc9b746b7a90a70ff75b04272b4ebe7ab6', '::1', 1529409609, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393430393630393b),
('ec24e341df797cf0b72d5bc34fd95b8379aa6f59', '::1', 1529387707, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393338373730303b),
('ed6pl6q3rdu1gleu4l8qtkdjkf7punio', '192.168.1.6', 1529482341, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393438323331313b),
('ee97bbc3aa09d219b15511cad023095f5253adf1', '::1', 1529387132, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393338373039313b),
('eefdd6335c405af8a39c44356c6661378dd0f664', '::1', 1529391491, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393339313435353b),
('f2582147cb3febcf14a0dbd9aaeee52ab64a2592', '::1', 1529471039, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393437303735303b),
('f413a758a7204064627326b5b64d4dd16512a4f1', '::1', 1529469905, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393436393835383b757365725f69647c693a313b757365726e616d657c733a343a2252757073223b6c6f676765645f696e7c623a313b69735f636f6e6669726d65647c623a313b69735f61646d696e7c623a303b),
('f4c8b16d7b3f49efc1374a918666a75d44a0ecc8', '::1', 1529144758, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393134343732303b),
('f83f6d6d85f0898656feb89d1ea5e669058b41f3', '::1', 1529470093, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393437303034333b757365725f69647c693a323b757365726e616d657c733a353a224d616e6a75223b6c6f676765645f696e7c623a313b69735f636f6e6669726d65647c623a303b69735f61646d696e7c623a303b),
('f9913345a2cecac200364680a3039fff9fa1f3bc', '::1', 1529394932, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393339343933323b),
('f9914f2e000da04818726731b9466273b11f4f6e', '192.168.1.9', 1529482552, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393438323530383b),
('fabc12e2b6d755993491bf837e1740bb142b929c', '::1', 1529471886, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393437313838353b),
('fb6378d3b1450f5b4db710f0b80b3187efcbf3b2', '::1', 1529317198, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393331373139383b),
('fb724998aac4398b8096dd91fd981b9a07e4f768', '::1', 1529474775, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393437343737343b),
('fc184de8885b46223731f7b7b20493a731ba371e', '::1', 1529392016, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393339323031363b),
('rtg87kk60naa7ngtvnm0v4ofg1peg58p', '192.168.1.6', 1529483246, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393438333035383b757365725f69647c693a323b757365726e616d657c733a353a224d616e6a75223b6c6f676765645f696e7c623a313b69735f636f6e6669726d65647c623a303b69735f61646d696e7c623a303b),
('t2cecn3h3pslhdebsbt8jsg12k7vn4ii', '192.168.1.9', 1529482452, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393438323434393b),
('v3tdkndh8ukd144hli63sh7ba6qatim7', '192.168.1.9', 1529482571, 0x5f5f63695f6c6173745f726567656e65726174657c693a313532393438323536383b);

-- --------------------------------------------------------

--
-- Table structure for table `comment_subject`
--

CREATE TABLE IF NOT EXISTS `comment_subject` (
  `Id_comment` int(11) NOT NULL,
  `Comments` text NOT NULL,
  `Id_subject` int(11) NOT NULL,
  `Id_user` int(11) NOT NULL,
  `Date_comment` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dashboard`
--

CREATE TABLE IF NOT EXISTS `dashboard` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `messages` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `dashboard`
--

INSERT INTO `dashboard` (`id`, `user_id`, `messages`, `created_at`) VALUES
(1, 1, 'Hello World', '2017-09-04 07:20:54'),
(2, 1, 'pengumuman a', '2017-09-04 07:42:29'),
(3, 1, 'i am here', '2017-09-04 07:42:35'),
(4, 6, 'gardening here', '2017-09-04 07:43:15'),
(5, 6, 'haloo', '2017-09-04 07:44:00'),
(6, 1, 'rapat jam 3 di lantai 3', '2017-09-04 07:49:23');

-- --------------------------------------------------------

--
-- Table structure for table `forums`
--

CREATE TABLE IF NOT EXISTS `forums` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `slug` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `forums`
--

INSERT INTO `forums` (`id`, `title`, `slug`, `description`, `created_at`, `updated_at`) VALUES
(1, 'beti bachao beti padhao', 'beti-bachao-beti-padhao', 'everyone will added its own opinion', '2018-06-15 12:24:56', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `groups_chats`
--

CREATE TABLE IF NOT EXISTS `groups_chats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chat_id` int(11) NOT NULL,
  `group_name` varchar(200) NOT NULL,
  `created_by` int(11) NOT NULL,
  `total_member` int(11) NOT NULL,
  `user` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `groups_chats`
--

INSERT INTO `groups_chats` (`id`, `chat_id`, `group_name`, `created_by`, `total_member`, `user`, `created_at`) VALUES
(1, 1, 'Thermodynamics', 50, 2, 'Manjusha  Praveen', '2018-07-30 08:51:05'),
(2, 2, 'Aker', 50, 2, 'Manjusha  Praveen', '2018-07-30 08:54:16'),
(3, 6, 'dsfsdfsfsfd', 6, 1, 'Manjusha Praveen', '2018-08-29 09:58:07'),
(4, 7, 'de', 6, 1, 'Manjusha Praveen', '2018-08-29 09:59:18');

-- --------------------------------------------------------

--
-- Table structure for table `groups_members`
--

CREATE TABLE IF NOT EXISTS `groups_members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chat_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `username` varchar(200) NOT NULL,
  `is_admin` enum('0','1') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `groups_members`
--

INSERT INTO `groups_members` (`id`, `chat_id`, `user_id`, `created_at`, `username`, `is_admin`) VALUES
(1, 1, 50, '2018-07-30 08:51:05', 'Manjusha  Praveen', '1'),
(2, 2, 50, '2018-07-30 08:54:16', 'Manjusha  Praveen', '1'),
(6, 2, 49, '2018-08-01 09:45:29', 'anil1 Kharche', '0'),
(7, 1, 49, '2018-08-01 09:47:21', 'anil1 Kharche', '0'),
(8, 6, 6, '2018-08-29 09:58:07', 'Manjusha Praveen', '1'),
(9, 7, 6, '2018-08-29 09:59:18', 'Manjusha Praveen', '1');

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE IF NOT EXISTS `options` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `content` longtext NOT NULL,
  `sb_user_id` int(11) unsigned NOT NULL,
  `topic_id` int(11) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=43 ;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `content`, `sb_user_id`, `topic_id`, `created_at`, `updated_at`) VALUES
(7, 'sadadsdadsasdsadasdasdasd', 13, 4, '2018-07-05 12:10:22', NULL),
(8, 'hnnhgngnghnghngnghn', 2, 4, '2018-07-05 14:24:15', NULL),
(9, 'hiiii', 13, 4, '2018-07-05 15:16:41', NULL),
(10, 'AAAAAAAAAAAAAAAAAAAAAAAAAAA', 13, 5, '2018-07-05 18:07:10', NULL),
(11, 'vvvc c c  vc c c  vc ', 2, 5, '2018-07-06 15:12:32', NULL),
(12, 'vvvc c c  vc c c  vc ', 2, 5, '2018-07-06 15:12:33', NULL),
(13, 'cvxcvcxv', 2, 5, '2018-07-06 15:12:42', NULL),
(14, 'ABC', 48, 1, '2018-07-13 18:08:23', NULL),
(15, 'sdeggdfgfdg', 48, 1, '2018-07-13 18:13:39', NULL),
(16, 'dfgfdgfdgdfgfd', 48, 1, '2018-07-13 18:13:51', NULL),
(17, 'm,mn,mn,', 48, 1, '2018-07-13 18:16:16', NULL),
(18, 'fghfghfh', 48, 1, '2018-07-13 18:17:26', NULL),
(19, 'cbvbcbv', 48, 1, '2018-07-13 18:18:57', NULL),
(20, 'fghfghfghgfhgf', 48, 1, '2018-07-13 18:20:43', NULL),
(21, 'dfgfdgdfgfdg', 48, 2, '2018-07-13 18:22:57', NULL),
(22, 'asdsadad', 49, 1, '2018-07-19 16:23:14', NULL),
(23, 'to much good\r\n', 49, 4, '2018-07-19 16:25:55', NULL),
(24, 'vbcbcbcvbcb', 49, 1, '2018-07-25 15:24:25', NULL),
(25, 'hiii', 1, 6, '2018-08-14 14:40:02', NULL),
(26, 'gdgfgdgdfg', 1, 7, '2018-08-16 10:45:07', NULL),
(27, 'hello', 1, 7, '2018-08-16 10:51:20', NULL),
(28, 'hiiiii', 1, 7, '2018-08-16 10:56:03', NULL),
(29, 'fhfhggfhheushger krg s gugydfggsjhfjhgsjhfdfjhsdgfjhgjhjdshgf nhh hggfs fkfgfd lgjnslgjdnfgjndsjgnsdfgjkdngfsdg', 1, 7, '2018-08-16 11:00:07', NULL),
(30, 'www.google.com', 1, 7, '2018-08-16 11:04:03', NULL),
(31, 'xzvzxfhfhggfhheushger krg s gugydfggsjhfjhgsjhfdfjhsdgfjhgjhjdshgf nhh hggfs fkfgfd lgjnslgjdnfgjndsjgnsdfgjkdngfsdgfhfhggfhheushger krg s gugydfggsjhfjhgsjhfdfjhsdgfjhgjhjdshgf nhh hggfs fkfgfd lgjnslgjdnfgjndsjgnsdfgjkdngfsdg', 1, 7, '2018-08-16 11:06:53', NULL),
(32, 'hello', 1, 7, '2018-08-16 11:24:46', NULL),
(33, 'sadasdasdadsasd', 1, 7, '2018-08-16 11:39:24', NULL),
(34, 'a hiiiiiiii', 1, 7, '2018-08-16 11:39:37', NULL),
(35, 'gfhfhfhfhfhfhmnm7898797897', 1, 7, '2018-08-16 11:44:11', NULL),
(36, 'xzvzxfhfhggfhheushger krg s gugydfggsjhfjhgsjhfdfjhsdgfjhgjhjdshgf nhh hggfs fkfgfd lgjnslgjdnfgjndsjgnsdfgjkdngfsdgfhfhggfhheushger krg s gugydfggsjhfjhgsjhfdfjhsdgfjhgjhjdshgf nhh hggfs fkfgfd lgjnslgjdnfgjndsjgnsdfgjkdngfsdgxzvzxfhfhggfhheushger krg s gugydfggsjhfjhgsjhfdfjhsdgfjhgjhjdshgf nhh hggfs fkfgfd lgjnslgjdnfgjndsjgnsdfgjkdngfsdgfhfhggfhheushger krg s gugydfggsjhfjhgsjhfdfjhsdgfjhgjhjdshgf nhh hggfs fkfgfd lgjnslgjdnfgjndsjgnsdfgjkdngfsdg', 1, 7, '2018-08-16 11:45:25', NULL),
(37, 'kyky r u ok', 1, 7, '2018-08-16 11:49:02', NULL),
(38, 'zxczczc', 1, 7, '2018-08-16 12:11:09', NULL),
(39, 'ghjhgjghjgjghj', 1, 6, '2018-08-16 12:58:30', NULL),
(40, 'guuuyiyuitfytityitfi', 1, 7, '2018-08-16 13:14:00', NULL),
(41, 'dasdsadadsasda', 6, 8, '2018-08-29 15:18:05', NULL),
(42, 'dfsdfsdf', 6, 8, '2018-08-29 15:18:16', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sb_adminaddadvertisement`
--

CREATE TABLE IF NOT EXISTS `sb_adminaddadvertisement` (
  `adv_id` int(11) NOT NULL AUTO_INCREMENT,
  `adv_image` varchar(500) NOT NULL,
  `image_caption` varchar(100) NOT NULL,
  `date` datetime NOT NULL,
  `city_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  PRIMARY KEY (`adv_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `sb_adminaddadvertisement`
--

INSERT INTO `sb_adminaddadvertisement` (`adv_id`, `adv_image`, `image_caption`, `date`, `city_id`, `status_id`) VALUES
(4, 'public/advertisement/Desert.jpg', 'TWo', '2018-07-20 10:25:15', 489, 1),
(5, 'public/advertisement/Chrysanthemum.jpg', 'Two', '2018-07-20 11:24:30', 654, 1),
(6, 'public/advertisement/Publication26_3.png', 'AB', '2018-07-20 11:31:08', 489, 1),
(7, 'public/advertisement/Publication25.png', 'BB', '2018-07-20 11:31:37', 489, 1),
(8, 'public/advertisement/login.jpg', 'c', '2018-07-20 11:32:27', 489, 1),
(10, 'public/advertisement/download_(1).jpg', 'E', '2018-07-20 11:33:22', 652, 1),
(11, 'public/advertisement/download_(2).jpg', 'RR', '2018-07-20 11:33:55', 654, 1),
(12, 'public/advertisement/download_(1).jpg', 'SS', '2018-07-20 11:34:17', 654, 1),
(13, 'public/advertisement/download_(2).jpg', 'AAA', '2018-07-20 11:34:44', 652, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sb_alert`
--

CREATE TABLE IF NOT EXISTS `sb_alert` (
  `flash_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(500) NOT NULL,
  `company_address` varchar(500) NOT NULL,
  `altlocation` varchar(100) NOT NULL,
  `des_person_name` varchar(100) NOT NULL,
  `des_designation` varchar(200) NOT NULL,
  `des_landline` varchar(250) NOT NULL,
  `des_mobile` varchar(100) NOT NULL,
  `des_email` varchar(100) NOT NULL,
  `company_pan` varchar(50) NOT NULL,
  `gst_number` varchar(100) NOT NULL,
  `pan_attachment` varchar(500) NOT NULL,
  `flash` varchar(1000) NOT NULL,
  `amt_per_day` varchar(255) NOT NULL,
  `num_of_days` int(11) NOT NULL,
  `flash_position` varchar(50) NOT NULL,
  `amount` varchar(2500) NOT NULL,
  `payment_mode` varchar(200) NOT NULL,
  `payment_status` varchar(200) NOT NULL,
  `tax_amt` double NOT NULL,
  `final_tot` varchar(500) NOT NULL,
  `terms_cond_check` varchar(50) NOT NULL,
  `status_id` int(11) NOT NULL,
  `eol` date NOT NULL,
  `notify_status` int(11) NOT NULL,
  PRIMARY KEY (`flash_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `sb_alert`
--

INSERT INTO `sb_alert` (`flash_id`, `company_name`, `company_address`, `altlocation`, `des_person_name`, `des_designation`, `des_landline`, `des_mobile`, `des_email`, `company_pan`, `gst_number`, `pan_attachment`, `flash`, `amt_per_day`, `num_of_days`, `flash_position`, `amount`, `payment_mode`, `payment_status`, `tax_amt`, `final_tot`, `terms_cond_check`, `status_id`, `eol`, `notify_status`) VALUES
(2, 'Praveen Truckers23232323', 'punesadffds', 'kdfsfsfsd', 'Manjusha Praveen', 'Manager', '9898566523', '9970036351', 'manjupraveen6689@gmail.com', 'GS456456M', '123456987456332', '', 'dfs', '300', 1, 'Top', '300', '', 'success', 0, '', 'on', 0, '2018-07-13', 1),
(3, 'itconsultantprovider', 'mumbai', 'aaaaa', 'Manjusha Praveen', 'Manager', '2026993214', '9895654566', 'vijayk@gmail.com', '7888888888', '123456987456332', '', 'xczczxz', '300', 1, 'Top', '300', '', 'success', 0, '', 'on', 0, '2018-07-13', 1),
(4, 'itconsultantprovider', 'mumbai', 'k', 'vijay khatal', 'Owner', '9898566523', '9970036351', 'mehataa@gmail.com', 'GS456456M', '78888888888', '', 'rtur', '300', 3, 'Top', '900', '', 'success', 0, '', 'on', 0, '2018-07-15', 1),
(5, 'itconsultantprovider222222222222222222', 'pune', 'k', 'vijay khatal', 'Owner', '2026993214', '9970036351', 'manjupraveen6689@gmail.com', 'GS456456M', '4456663131333', '', 'hnjghj', '300', 1, 'Top', '300', 'online', 'success', 54, '354', 'on', 0, '2018-07-13', 1),
(6, 'akenterprisefdgdfgd', 'mumbai', 'aaaaa', 'Praveen Rajan', 'Manager', '2026993214', '9895562790', 'vijayk@gmail.com', '7888888888', '4456663131333', '', 'fdgdgdf', '300', 2, 'Top', '600', 'online', 'success', 108, '708', 'on', 1, '2018-07-14', 1),
(7, 'Praveen Truckers', 'fdgggggggggg', 'aaaaa', 'vijay khatal', 'Manager', '2026993214', '9895654566', 'vijayk@gmail.com', 'GS456456M', '123456987456332', '', 'yututyu', '300', 1, 'Top', '300', 'online', 'success', 54, '354', 'on', 0, '2018-07-13', 1),
(8, 'Praveen Truckers252525', 'pune', 'Hyderabad, Telangana, India', 'tgryrt', 'rtyrtyrt', '9898566523', '9970036351', 'manjupraveen6689@gmail.com', '1234567891', '123456987456332', '', 'tryrtyrtyrty', '300', 1, 'Top', '300', 'online', 'success', 54, '354', 'on', 0, '2018-07-13', 1),
(9, 'vzfgfdg', 'gffdgdgdfg', 'Lucknow, Uttar Pradesh, India', 'sdfsfsadf', 'dfsadfasdf', '9898566523', '9895654566', 'vijayk@gmail.com', 'dsfsdfs', 'sdfsfsdf', '', 'fsdfsfds', '300', 1, 'Top', '300', 'online', 'success', 54, '354', 'on', 1, '2018-07-13', 1),
(10, 'itconsultantprovider', 'mumbai', 'Indian Immunologicals Colony, Gachibowli, Hyderabad, Telangana, India', 'vijay khatal', 'Manager', '02026991287', '9895654566', 'manjupraveen6689@gmail.com', '7888888888', '4456663131333', '', 'vbhfhj', '300', 2, 'Top', '600', 'online', 'success', 108, '708', 'on', 0, '2018-07-14', 1),
(11, 'yuiyui', 'rtrt', 'Mumbai, Maharashtra, India', 'rerer', 'ererer', '32345345345', '5464645645', 'rupalisatpute289@gmail.com', 'asdsdfasf', '4564646', '', '456456456456', '300', 1, 'Top', '300', '', '', 0, '', 'on', 0, '2018-07-15', 1),
(12, 'yuiyui', 'rtrt', 'Mumbai, Maharashtra, India', 'rerer', 'ererer', '32345345345', '5464645645', 'rupalisatpute289@gmail.com', 'asdsdfasf', '4564646', '', '456456456456', '300', 3, 'Top', '900', 'online', '', 162, '1062', 'on', 1, '2018-07-17', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sb_chain`
--

CREATE TABLE IF NOT EXISTS `sb_chain` (
  `chain_id` int(11) NOT NULL AUTO_INCREMENT,
  `child` varchar(100) NOT NULL,
  `parent` varchar(100) NOT NULL,
  `c_prim_id` int(11) NOT NULL,
  `c_which_prim_id` varchar(100) NOT NULL,
  `p_prim_id` int(11) NOT NULL,
  `p_which_prim_id` varchar(100) NOT NULL,
  PRIMARY KEY (`chain_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `sb_chain`
--

INSERT INTO `sb_chain` (`chain_id`, `child`, `parent`, `c_prim_id`, `c_which_prim_id`, `p_prim_id`, `p_which_prim_id`) VALUES
(1, 'ND24006K', 'ND83991S', 19, 'Network', 17, 'Network'),
(2, 'ND87995E', 'StUdBiZz', 20, 'Network', 0, 'StUdBiZz'),
(3, 'ND49953X', 'ND24006K', 21, 'Network', 19, 'Network');

-- --------------------------------------------------------

--
-- Table structure for table `sb_child_course`
--

CREATE TABLE IF NOT EXISTS `sb_child_course` (
  `childcourse_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NOT NULL,
  `childcourse_name` varchar(200) NOT NULL,
  `status_id` int(11) NOT NULL,
  PRIMARY KEY (`childcourse_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `sb_child_course`
--

INSERT INTO `sb_child_course` (`childcourse_id`, `course_id`, `childcourse_name`, `status_id`) VALUES
(2, 2, 'B.E (Computer )', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sb_city`
--

CREATE TABLE IF NOT EXISTS `sb_city` (
  `city_id` int(11) NOT NULL AUTO_INCREMENT,
  `city_name` varchar(100) NOT NULL,
  PRIMARY KEY (`city_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=655 ;

--
-- Dumping data for table `sb_city`
--

INSERT INTO `sb_city` (`city_id`, `city_name`) VALUES
(1, 'Adilabad'),
(2, 'Agra'),
(3, 'Ahmedabad'),
(4, 'Ahmednagar'),
(5, 'Aizawl'),
(6, 'Ajmer'),
(7, 'Akola'),
(8, 'Alappuzha'),
(9, 'Aligarh'),
(10, 'Alirajpur'),
(11, 'Allahabad'),
(12, 'Almora'),
(13, 'Alwar'),
(14, 'Ambala'),
(15, 'Ambedkar'),
(16, 'Amethi'),
(17, 'Amravati'),
(18, 'Amreli'),
(19, 'Amritsar'),
(20, 'Amroha'),
(21, 'Anand'),
(22, 'Anantapur'),
(23, 'Anantnag'),
(24, 'Angul'),
(25, 'Anjaw'),
(26, 'Anuppur'),
(27, 'Araria'),
(28, 'Aravalli'),
(29, 'Ariyalur'),
(30, 'Arwal'),
(31, 'Ashoknagar'),
(32, 'Auraiya'),
(33, 'Aurangabad'),
(34, 'Aurangabad'),
(35, 'Azamgarh'),
(36, 'Bagalkot'),
(37, 'Bageshwar'),
(38, 'Baghpat'),
(39, 'Bahraich'),
(40, 'Baksa'),
(41, 'Balaghat'),
(42, 'Balangir'),
(43, 'Balasore'),
(44, 'Ballia'),
(45, 'Balod'),
(46, 'Baloda'),
(47, 'Balrampur'),
(48, 'Balrampur'),
(49, 'Banaskantha'),
(50, 'Banda'),
(51, 'Bandipora'),
(52, 'Bangalore'),
(53, 'Bangalore'),
(54, 'Banka'),
(55, 'Bankura'),
(56, 'Banswara'),
(57, 'Barabanki'),
(58, 'Baramulla'),
(59, 'Baran'),
(60, 'Bareilly'),
(61, 'Bargarh'),
(62, 'Barmer'),
(63, 'Barnala'),
(64, 'Barpeta'),
(65, 'Barwani'),
(66, 'Bastar'),
(67, 'Basti'),
(68, 'Bathinda'),
(69, 'Beed'),
(70, 'Begusarai'),
(71, 'Belgaum'),
(72, 'Bellary'),
(73, 'Bemetara'),
(74, 'Betul'),
(75, 'Bhadrak'),
(76, 'Bhagalpur'),
(77, 'Bhandara'),
(78, 'Bharatpur'),
(79, 'Bharuch'),
(80, 'Bhavnagar'),
(81, 'Bhilwara'),
(82, 'Bhind'),
(83, 'Bhiwani'),
(84, 'Bhojpur'),
(85, 'Bhopal'),
(86, 'Bhor'),
(87, 'Bidar'),
(88, 'Bijapur'),
(89, 'Bijapur'),
(90, 'Bijnor'),
(91, 'Bikaner'),
(92, 'Bilaspur'),
(93, 'Bilaspur'),
(94, 'Birbhum'),
(95, 'Bishnupur'),
(96, 'Bokaro'),
(97, 'Bongaigaon'),
(98, 'Botad'),
(99, 'Boudh'),
(100, 'Budaun'),
(101, 'Budgam'),
(102, 'Bulandshahr'),
(103, 'Buldhana'),
(104, 'Bundi'),
(105, 'Burdwan'),
(106, 'Burhanpur'),
(107, 'Buxar'),
(108, 'Cachar'),
(109, 'Central'),
(110, 'Chamarajanagar'),
(111, 'Chamba'),
(112, 'Chamoli'),
(113, 'Champawat'),
(114, 'Champhai'),
(115, 'Chandauli'),
(116, 'Chandel'),
(117, 'Chandigarh'),
(118, 'Chandrapur'),
(119, 'Changlang'),
(120, 'Chatra'),
(121, 'Chennai'),
(122, 'Chhatarpur'),
(123, 'Chhindwara'),
(124, 'Chhota'),
(125, 'Chickmagalur'),
(126, 'Chikballapur'),
(127, 'Chirang'),
(128, 'Chitradurga'),
(129, 'Chitrakoot'),
(130, 'Chittoor'),
(131, 'Chittorgarh'),
(132, 'Churachandpur'),
(133, 'Churu'),
(134, 'Coimbatore'),
(135, 'Cooch'),
(136, 'Cuddalore'),
(137, 'Cuddapah'),
(138, 'Cuttack'),
(139, 'Dadra'),
(140, 'Dahod'),
(141, 'Dakshin'),
(142, 'Dakshina'),
(143, 'Daman'),
(144, 'Damoh'),
(145, 'Dangs'),
(146, 'Dantewada'),
(147, 'Darbhanga'),
(148, 'Darjeeling'),
(149, 'Darrang'),
(150, 'Datia'),
(151, 'Dausa'),
(152, 'Davangere'),
(153, 'Dehradun'),
(154, 'Deogarh'),
(155, 'Deoghar'),
(156, 'Deoria'),
(157, 'Devbhoomi'),
(158, 'Dewas'),
(159, 'Dhalai'),
(160, 'Dhamtari'),
(161, 'Dhanbad'),
(162, 'Dhar'),
(163, 'Dharmapuri'),
(164, 'Dharwad'),
(165, 'Dhemaji'),
(166, 'Dhenkanal'),
(167, 'Dholpur'),
(168, 'Dhubri'),
(169, 'Dhule'),
(170, 'Dibang'),
(171, 'Dibrugarh'),
(172, 'Dima'),
(173, 'Dimapur'),
(174, 'Dindigul'),
(175, 'Dindori'),
(176, 'Diu'),
(177, 'Doda'),
(178, 'Dumka'),
(179, 'Dungarpur'),
(180, 'Durg'),
(181, 'Ernakulam'),
(182, 'Erode'),
(183, 'Etah'),
(184, 'Etawah'),
(185, 'Faizabad'),
(186, 'Faridabad'),
(187, 'Faridkot'),
(188, 'Farrukhabad'),
(189, 'Fatehabad'),
(190, 'Fatehgarh'),
(191, 'Fatehpur'),
(192, 'Fazilka'),
(193, 'Ferozepur'),
(194, 'Firozabad'),
(195, 'Gadag'),
(196, 'Gadchiroli'),
(197, 'Gajapati'),
(198, 'Ganderbal'),
(199, 'Gandhinagar'),
(200, 'Ganjam'),
(201, 'Garhwa'),
(202, 'Gariaband'),
(203, 'Gautam'),
(204, 'Gaya'),
(205, 'Ghaziabad'),
(206, 'Ghazipur'),
(207, 'Gir'),
(208, 'Giridih'),
(209, 'Goalpara'),
(210, 'Godda'),
(211, 'Golaghat'),
(212, 'Gomati'),
(213, 'Gonda'),
(214, 'Gondia'),
(215, 'Gopalganj'),
(216, 'Gorakhpur'),
(217, 'Gulbarga'),
(218, 'Gumla'),
(219, 'Guna'),
(220, 'Guntur'),
(221, 'Gurdaspur'),
(222, 'Gurgaon'),
(223, 'Gwalior'),
(224, 'Hailakandi'),
(225, 'Hamirpur'),
(226, 'Hamirpur'),
(227, 'Hanumangarh'),
(228, 'Hapur'),
(229, 'Harda'),
(230, 'Hardoi'),
(231, 'Haridwar'),
(232, 'Hassan'),
(233, 'Hathras'),
(234, 'Haveri'),
(235, 'Hazaribag'),
(236, 'Hingoli'),
(237, 'Hisar'),
(238, 'Hooghly'),
(239, 'Hoshangabad'),
(240, 'Hoshiarpur'),
(241, 'Howrah'),
(242, 'Hyderabad'),
(243, 'Ichalkaranji'),
(244, 'Idukki'),
(245, 'Imphal'),
(246, 'Imphal'),
(247, 'Indore'),
(248, 'Jabalpur'),
(249, 'Jagatsinghapur'),
(250, 'Jaipur'),
(251, 'Jaisalmer'),
(252, 'Jajpur'),
(253, 'Jalandhar'),
(254, 'Jalaun'),
(255, 'Jalgaon'),
(256, 'Jalna'),
(257, 'Jalore'),
(258, 'Jalpaiguri'),
(259, 'Jammu'),
(260, 'Jamnagar'),
(261, 'Jamtara'),
(262, 'Jamui'),
(263, 'Janjgir-Champa'),
(264, 'Jashpur'),
(265, 'Jaunpur'),
(266, 'Jehanabad'),
(267, 'Jhabua'),
(268, 'Jhajjar'),
(269, 'Jhalawar'),
(270, 'Jhansi'),
(271, 'Jharsuguda'),
(272, 'Jhunjhunu'),
(273, 'Jind'),
(274, 'Jodhpur'),
(275, 'Jorhat'),
(276, 'Junagadh'),
(277, 'Kabirdham'),
(278, 'Kachchh'),
(279, 'Kagal'),
(280, 'Kaimur'),
(281, 'Kaithal'),
(282, 'Kalahandi'),
(283, 'Kamrup'),
(284, 'Kamrup'),
(285, 'Kamtee'),
(286, 'Kanchipuram'),
(287, 'Kandhamal'),
(288, 'Kangra'),
(289, 'Kanker'),
(290, 'Kannauj'),
(291, 'Kannur'),
(292, 'Kanpur'),
(293, 'Kanpur'),
(294, 'Kanshiram'),
(295, 'Kanyakumari'),
(296, 'Kapurthala'),
(297, 'Karaikal'),
(298, 'Karauli'),
(299, 'Karbi'),
(300, 'Kargil'),
(301, 'Karimganj'),
(302, 'Karimnagar'),
(303, 'Karnal'),
(304, 'Karur'),
(305, 'Kasaragod'),
(306, 'Kathua'),
(307, 'Katihar'),
(308, 'Katni'),
(309, 'Kaushambi'),
(310, 'Kendrapara'),
(311, 'Kendujhar'),
(312, 'Khadewadi'),
(313, 'Khagaria'),
(314, 'Khammam'),
(315, 'Khandwa'),
(316, 'Khargone'),
(317, 'Khed-Shivapur'),
(318, 'Kheda'),
(319, 'Khordha'),
(320, 'Khowai'),
(321, 'Khunti'),
(322, 'Kinnaur'),
(323, 'Kiphire'),
(324, 'Kishanganj'),
(325, 'Kishtwar'),
(326, 'Kodagu'),
(327, 'Koderma'),
(328, 'Kohima'),
(329, 'Kohinoor'),
(330, 'Kokrajhar'),
(331, 'Kolar'),
(332, 'Kolasib'),
(333, 'Kolhapur'),
(334, 'Kolkata'),
(335, 'Kollam'),
(336, 'Kondagaon'),
(337, 'Koppal'),
(338, 'Koraput'),
(339, 'Korba'),
(340, 'Korea'),
(341, 'Kota'),
(342, 'Kottayam'),
(343, 'Kozhikode'),
(344, 'Krishna'),
(345, 'Krishnagiri'),
(346, 'Kulgam'),
(347, 'Kullu'),
(348, 'Kupwara'),
(349, 'Kurnool'),
(350, 'Kurukshetra'),
(351, 'Kurung'),
(352, 'Kushinagar'),
(353, 'Lahaul'),
(354, 'Lakhimpur'),
(355, 'Lakhimpur'),
(356, 'Lakhisarai'),
(357, 'Lakshadweep'),
(358, 'Lalitpur'),
(359, 'Latehar'),
(360, 'Latur'),
(361, 'Lawngtlai'),
(362, 'Leh'),
(363, 'Lohardaga'),
(364, 'Lohit'),
(365, 'Longding'),
(366, 'Longleng'),
(367, 'Lower'),
(368, 'Lower'),
(369, 'Lucknow'),
(370, 'Ludhiana'),
(371, 'Lunglei'),
(372, 'Madhepura'),
(373, 'Madhubani'),
(374, 'Madurai'),
(375, 'Mahabubnagar'),
(376, 'Maharajganj'),
(377, 'Mahasamund'),
(378, 'Mahe'),
(379, 'Mahendragarh'),
(380, 'Mahisagar'),
(381, 'Mahoba'),
(382, 'Mainpuri'),
(383, 'Malappuram'),
(384, 'Malda'),
(385, 'Malkangiri'),
(386, 'Mamit'),
(387, 'Mandi'),
(388, 'Mandla'),
(389, 'Mandsaur'),
(390, 'Mandya'),
(391, 'Mansa'),
(392, 'Mathura'),
(393, 'Mau'),
(394, 'Mayurbhanj'),
(395, 'Medak'),
(396, 'Meerut'),
(397, 'Mehsana'),
(398, 'Mewat'),
(399, 'Mirzapur'),
(400, 'Moga'),
(401, 'Mokarwadi'),
(402, 'Mokokchung'),
(403, 'Mon'),
(404, 'Moradabad'),
(405, 'Morbi'),
(406, 'Morena'),
(407, 'Morigaon'),
(408, 'Muktsar'),
(409, 'Mumbai'),
(410, 'Mumbai'),
(411, 'Mumbai'),
(412, 'Mungeli'),
(413, 'Munger'),
(414, 'Murshidabad'),
(415, 'Muzaffarnagar'),
(416, 'Muzaffarpur'),
(417, 'Mysore'),
(418, 'Nabarangpur'),
(419, 'Nadia'),
(420, 'Nagaon'),
(421, 'Nagapattinam'),
(422, 'Nagaur'),
(423, 'Nagpur'),
(424, 'Nainital'),
(425, 'Nalanda'),
(426, 'Nalbari'),
(427, 'Nalgonda'),
(428, 'Namakkal'),
(429, 'Nanded'),
(430, 'Nandurbar'),
(431, 'Narayanpur'),
(432, 'Narmada'),
(433, 'Narsinghpur'),
(434, 'Nashik'),
(435, 'Navsari'),
(436, 'Nawada'),
(437, 'Nawanshahr'),
(438, 'Nayagarh'),
(439, 'Neemuch'),
(440, 'Nellore'),
(441, 'New'),
(442, 'Nicobar'),
(443, 'Nilgiris'),
(444, 'Nizamabad'),
(445, 'North'),
(446, 'North'),
(447, 'North'),
(448, 'North'),
(449, 'North'),
(450, 'North'),
(451, 'North'),
(452, 'North'),
(453, 'North'),
(454, 'Nuapada'),
(455, 'Osmanabad'),
(456, 'Pakur'),
(457, 'Palakkad'),
(458, 'Palamu'),
(459, 'Pali'),
(460, 'Palwal'),
(461, 'Panchkula'),
(462, 'Panchmahal'),
(463, 'Panipat'),
(464, 'Panna'),
(465, 'Papum'),
(466, 'Parbhani'),
(467, 'Paschim'),
(468, 'Patan'),
(469, 'Patan'),
(470, 'Pathanamthitta'),
(471, 'Pathankot'),
(472, 'Patiala'),
(473, 'Patna'),
(474, 'Pauri'),
(475, 'Perambalur'),
(476, 'Peren'),
(477, 'Phek'),
(478, 'Pilibhit'),
(479, 'Pimpri-Chinchwad'),
(480, 'Pithoragarh'),
(481, 'Pondicherry'),
(482, 'Poonch'),
(483, 'Porbandar'),
(484, 'Prakasam'),
(485, 'Pratapgarh'),
(486, 'Pratapgarh'),
(487, 'Pudukkottai'),
(488, 'Pulwama'),
(489, 'Pune'),
(490, 'Purba'),
(491, 'Puri'),
(492, 'Purnia'),
(493, 'Purulia'),
(494, 'RaeBareli'),
(495, 'Raichur'),
(496, 'Raigad'),
(497, 'Raigarh'),
(498, 'Raipur'),
(499, 'Raisen'),
(500, 'Rajgarh'),
(501, 'Rajkot'),
(502, 'Rajnandgaon'),
(503, 'Rajouri'),
(504, 'Rajsamand'),
(505, 'Ramanathapuram'),
(506, 'Ramban'),
(507, 'Ramgarh'),
(508, 'Ramnagara'),
(509, 'Rampur'),
(510, 'Ranchi'),
(511, 'Rangareddy'),
(512, 'Ratlam'),
(513, 'Ratnagiri'),
(514, 'Rayagada'),
(515, 'Reasi'),
(516, 'Rewa'),
(517, 'Rewari'),
(518, 'Ri'),
(519, 'Rohtak'),
(520, 'Rohtas'),
(521, 'Rudraprayag'),
(522, 'Rupnagar'),
(523, 'Sabarkantha'),
(524, 'Sagar'),
(525, 'Saharanpur'),
(526, 'Saharsa'),
(527, 'Sahibganj'),
(528, 'Saiha'),
(529, 'Salem'),
(530, 'Samastipur'),
(531, 'Samba'),
(532, 'Sambalpur'),
(533, 'Sambhal'),
(534, 'Sangli'),
(535, 'Sangrur'),
(536, 'Sangvi'),
(537, 'Sant'),
(538, 'Sant'),
(539, 'Saran'),
(540, 'SAS'),
(541, 'Satara'),
(542, 'Satna'),
(543, 'Sawai'),
(544, 'Sehore'),
(545, 'Senapati'),
(546, 'Seoni'),
(547, 'Sepahijala'),
(548, 'Seraikela-Kharsawan'),
(549, 'Serchhip'),
(550, 'Shahdol'),
(551, 'Shahjahanpur'),
(552, 'Shajapur'),
(553, 'Shamali'),
(554, 'Sheikhpura'),
(555, 'Sheohar'),
(556, 'Sheopur'),
(557, 'Shimla'),
(558, 'Shimoga'),
(559, 'Shirdi'),
(560, 'Shivpuri'),
(561, 'Shopian'),
(562, 'Shravasti'),
(563, 'Siddharth'),
(564, 'Sidhi'),
(565, 'Sikar'),
(566, 'Simdega'),
(567, 'Sindhudurg'),
(568, 'Singrauli'),
(569, 'Sirmaur'),
(570, 'Sirohi'),
(571, 'Sirsa'),
(572, 'Sitamarhi'),
(573, 'Sitapur'),
(574, 'Sivaganga'),
(575, 'Sivasagar'),
(576, 'Siwan'),
(577, 'Solan'),
(578, 'Solapur'),
(579, 'Sonbhadra'),
(580, 'Sonepur'),
(581, 'Sonipat'),
(582, 'Sonitpur'),
(583, 'Sri'),
(584, 'Srikakulam'),
(585, 'Srinagar'),
(586, 'Sukma'),
(587, 'Sultanpur'),
(588, 'Sundargarh'),
(589, 'Supaul'),
(590, 'Surajpur'),
(591, 'Surat'),
(592, 'Surendranagar'),
(593, 'Surguja'),
(594, 'Tamenglong'),
(595, 'Tapi'),
(596, 'Tarn'),
(597, 'Tawang'),
(598, 'Tehri'),
(599, 'Thane'),
(600, 'Thanjavur'),
(601, 'Theni'),
(602, 'Thiruvananthapuram'),
(603, 'Thoothukudi'),
(604, 'Thoubal'),
(605, 'Thrissur'),
(606, 'Tikamgarh'),
(607, 'Tinsukia'),
(608, 'Tirap'),
(609, 'Tiruchirappalli'),
(610, 'Tirunelveli'),
(611, 'Tiruppur'),
(612, 'Tiruvallur'),
(613, 'Tiruvannamalai'),
(614, 'Tiruvarur'),
(615, 'Tonk'),
(616, 'Tuensang'),
(617, 'Tumkur'),
(618, 'Udaipur'),
(619, 'Udalguri'),
(620, 'Udham'),
(621, 'Udhampur'),
(622, 'Udupi'),
(623, 'Ujjain'),
(624, 'Ukhrul'),
(625, 'Umaria'),
(626, 'Una'),
(627, 'Unakoti'),
(628, 'Unnao'),
(629, 'Upper'),
(630, 'Upper'),
(631, 'Uttar'),
(632, 'Uttara'),
(633, 'Uttarkashi'),
(634, 'Vadodara'),
(635, 'Vaishali'),
(636, 'Valsad'),
(637, 'Varanasi'),
(638, 'Vellore'),
(639, 'Vidisha'),
(640, 'Viluppuram'),
(641, 'Virudhunagar'),
(642, 'Visakhapatnam'),
(643, 'Vizianagaram'),
(644, 'Warangal'),
(645, 'Wardha'),
(646, 'Washim'),
(647, 'Wayanad'),
(648, 'Wokha'),
(649, 'Yadgir'),
(650, 'Yamunanagar'),
(651, 'Yanam'),
(652, 'Yavatmal'),
(653, 'Zunheboto'),
(654, 'All');

-- --------------------------------------------------------

--
-- Table structure for table `sb_comment`
--

CREATE TABLE IF NOT EXISTS `sb_comment` (
  `comm_id` int(11) NOT NULL AUTO_INCREMENT,
  `up_id` int(11) NOT NULL,
  `comment` varchar(500) NOT NULL,
  `date` varchar(100) NOT NULL,
  PRIMARY KEY (`comm_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `sb_comment`
--

INSERT INTO `sb_comment` (`comm_id`, `up_id`, `comment`, `date`) VALUES
(1, 39, '898989', '2018-07-31 15:05:02'),
(2, 42, 'ABC', '2018-07-31 15:05:46'),
(3, 42, 'ABC', '2018-07-31 15:06:35'),
(4, 42, 'ABC6767', '2018-07-31 15:06:42'),
(5, 42, 'ABC6767', '2018-07-31 15:07:36'),
(6, 42, 'ABC6767', '2018-07-31 15:08:21'),
(7, 42, 'ABC6767', '2018-07-31 15:08:23'),
(8, 41, 'trtrtrt', '2018-07-31 15:19:52'),
(9, 41, 'trtrtrt', '2018-07-31 15:20:15'),
(10, 46, 'trtrtrt111', '2018-07-31 15:20:26'),
(11, 41, '1234567890', '2018-07-31 15:21:39'),
(12, 29, 'opopopp', '2018-07-31 15:22:02'),
(13, 29, '232323232323', '2018-07-31 15:22:17'),
(14, 39, '123456', '2018-07-31 15:24:12'),
(15, 39, '123456', '2018-07-31 15:25:16'),
(16, 39, 'rtrtrt', '2018-07-31 15:27:16'),
(17, 39, 'rtrtrt', '2018-07-31 15:27:33'),
(18, 39, '2323232', '2018-07-31 15:28:59'),
(19, 39, '232323', '2018-07-31 15:30:49');

-- --------------------------------------------------------

--
-- Table structure for table `sb_contact`
--

CREATE TABLE IF NOT EXISTS `sb_contact` (
  `cont_id` int(11) NOT NULL AUTO_INCREMENT,
  `cont_name` varchar(200) NOT NULL,
  `cont_email` varchar(200) NOT NULL,
  `cont_mobile` int(100) NOT NULL,
  `cont_message` varchar(200) NOT NULL,
  PRIMARY KEY (`cont_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sb_directory`
--

CREATE TABLE IF NOT EXISTS `sb_directory` (
  `dir_id` int(11) NOT NULL AUTO_INCREMENT,
  `reg_date` datetime NOT NULL,
  `active_date` date NOT NULL,
  `dir_parent_id` int(11) NOT NULL,
  `dir_sub_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(500) NOT NULL,
  `person_name` varchar(100) NOT NULL,
  `mobile_no` bigint(10) NOT NULL,
  `land_no` bigint(20) NOT NULL,
  `email_id` varchar(100) NOT NULL,
  `location` varchar(500) NOT NULL,
  `pincode` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `pan_no` varchar(20) NOT NULL,
  `gst_number` varchar(20) NOT NULL,
  `pk_directiory_validity_max` int(100) NOT NULL,
  `pk_directiory_amt` double NOT NULL,
  `payment_mode` varchar(100) NOT NULL,
  `payment_status` varchar(100) NOT NULL,
  `tax_amt` varchar(100) NOT NULL,
  `final_tot` double NOT NULL,
  `terms_cond_check` varchar(20) NOT NULL,
  `status_id` int(11) NOT NULL,
  `eol` date NOT NULL,
  `notify_status` int(11) NOT NULL,
  PRIMARY KEY (`dir_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `sb_directory`
--

INSERT INTO `sb_directory` (`dir_id`, `reg_date`, `active_date`, `dir_parent_id`, `dir_sub_id`, `name`, `address`, `person_name`, `mobile_no`, `land_no`, `email_id`, `location`, `pincode`, `city_id`, `pan_no`, `gst_number`, `pk_directiory_validity_max`, `pk_directiory_amt`, `payment_mode`, `payment_status`, `tax_amt`, `final_tot`, `terms_cond_check`, `status_id`, `eol`, `notify_status`) VALUES
(1, '2018-07-25 12:55:24', '0000-00-00', 1, 1, 'MJ', 'Pune', 'Anil', 9960809335, 54646464, 'anilvkharche@gmail.com', 'Pune, Maharashtra, India', 411011, 489, '6546456464', '654646464646464', 730, 1800, '', '', '', 0, 'on', 0, '0000-00-00', 0),
(2, '2018-07-25 13:04:00', '0000-00-00', 1, 1, 'Anil', 'Pune', 'Anil', 9960809335, 25658995555, 'anilvkharche@gmail.com', 'Pune, Maharashtra, India', 411011, 489, '9854964949', '949494949494494', 730, 1800, '', '', '', 0, 'on', 0, '0000-00-00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sb_directory_parent_cat`
--

CREATE TABLE IF NOT EXISTS `sb_directory_parent_cat` (
  `dir_parent_id` int(11) NOT NULL AUTO_INCREMENT,
  `dir_parent_name` varchar(100) NOT NULL,
  PRIMARY KEY (`dir_parent_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `sb_directory_parent_cat`
--

INSERT INTO `sb_directory_parent_cat` (`dir_parent_id`, `dir_parent_name`) VALUES
(1, 'Hostels'),
(2, 'Mess'),
(3, 'Book Store');

-- --------------------------------------------------------

--
-- Table structure for table `sb_directory_sub_cat`
--

CREATE TABLE IF NOT EXISTS `sb_directory_sub_cat` (
  `dir_sub_id` int(11) NOT NULL AUTO_INCREMENT,
  `dir_sub_name` varchar(100) NOT NULL,
  `dir_parent_id` int(11) NOT NULL,
  PRIMARY KEY (`dir_sub_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `sb_directory_sub_cat`
--

INSERT INTO `sb_directory_sub_cat` (`dir_sub_id`, `dir_sub_name`, `dir_parent_id`) VALUES
(1, 'Girls Hostel', 1),
(2, 'Boys Hostel', 1),
(3, 'paying Guest', 1),
(4, 'Cot Basis', 1),
(5, 'Private Room', 1),
(6, 'Veg', 2),
(7, 'Non-Veg', 2),
(8, 'Both', 2),
(9, 'Engineering', 3),
(10, 'Medical', 3),
(11, 'Law', 3),
(12, 'Commerce', 3),
(13, 'Art', 3),
(14, 'Science', 3),
(15, 'Computer', 3),
(16, 'Management', 3),
(17, 'Media studies', 3);

-- --------------------------------------------------------

--
-- Table structure for table `sb_employee_zone`
--

CREATE TABLE IF NOT EXISTS `sb_employee_zone` (
  `sb_emp_id` int(11) NOT NULL AUTO_INCREMENT,
  `sb_user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `cname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobile_no` varchar(20) NOT NULL,
  `location` varchar(200) NOT NULL,
  `password` varchar(50) NOT NULL,
  `cpassword` varchar(50) NOT NULL,
  PRIMARY KEY (`sb_emp_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `sb_employee_zone`
--

INSERT INTO `sb_employee_zone` (`sb_emp_id`, `sb_user_id`, `name`, `cname`, `email`, `mobile_no`, `location`, `password`, `cpassword`) VALUES
(1, 26, 'ngfhfgh', 'fghfh', 'gaju@yahoo.com', '8989898989', 'Pune, Maharashtra, India', '123456', ''),
(2, 34, 'ffghfgh', 'fghfgh', 'gaju@yahoo.com', '982304256', 'Pune, Maharashtra, India', '123456', ''),
(3, 40, 'Manjusha', 'Manju', 'M@yahoo.com', '9865321545', 'Pune, Maharashtra, India', '123456', ''),
(4, 47, 'Manjusha Praveen', 'Symbiol Mobitech LLP', 'manjushapraveen31@gmail.com', '9604556639', 'Dehu Road, Maharashtra, India', '123456', ''),
(5, 53, 'Rupali', 'LoadXone', 'rupalisatpute289@gmail.com', '8652154125', 'Pune, Maharashtra, India', '123456', '');

-- --------------------------------------------------------

--
-- Table structure for table `sb_feedback`
--

CREATE TABLE IF NOT EXISTS `sb_feedback` (
  `fb_id` int(11) NOT NULL AUTO_INCREMENT,
  `fb_first_name` varchar(200) NOT NULL,
  `fb_last_name` varchar(200) NOT NULL,
  `fb_email` varchar(200) NOT NULL,
  `fb_mobile` int(100) NOT NULL,
  `fb_message` varchar(200) NOT NULL,
  PRIMARY KEY (`fb_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sb_invoice`
--

CREATE TABLE IF NOT EXISTS `sb_invoice` (
  `inv_id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_no` varchar(100) NOT NULL,
  `which_inv` varchar(100) NOT NULL,
  `prim_id` int(11) NOT NULL,
  `total_amt` varchar(100) NOT NULL,
  PRIMARY KEY (`inv_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=394 ;

--
-- Dumping data for table `sb_invoice`
--

INSERT INTO `sb_invoice` (`inv_id`, `invoice_no`, `which_inv`, `prim_id`, `total_amt`) VALUES
(51, 'LDX/0001/17-18', 'Directory', 87, '590'),
(52, 'LDX/0002/17-18', 'Directory', 87, '590'),
(53, 'LDX/0003/17-18', 'Directory', 87, '590'),
(54, 'LDX/0004/17-18', 'Flash', 27, '118'),
(55, 'LDX/0005/17-18', 'Directory', 88, '590'),
(56, 'LDX/0006/17-18', 'ProviderIndividual', 455, '10621.18'),
(57, 'LDX/0007/17-18', 'ProviderIndividual', 455, '10621.18'),
(58, 'LDX/0008/17-18', 'ProviderIndividual', 455, '10621.18'),
(59, 'LDX/0009/17-18', 'ProviderIndividual', 455, '10621.18'),
(60, 'LDX/00010/17-18', 'ProviderIndividual', 455, '10621.18'),
(61, 'LDX/00011/17-18', 'ProviderIndividual', 455, '10621.18'),
(62, 'LDX/00012/17-18', 'ProviderIndividual', 455, '10621.18'),
(63, 'LDX/00013/17-18', 'ProviderIndividual', 455, '10621.18'),
(64, 'LDX/00014/17-18', 'ProviderIndividual', 455, '10621.18'),
(65, 'LDX/00015/17-18', 'ProviderIndividual', 455, '10621.18'),
(66, 'LDX/00016/17-18', 'ProviderIndividual', 455, '10621.18'),
(67, 'LDX/00017/17-18', 'ProviderCompany', 466, '10621.18'),
(68, 'LDX/00018/17-18', 'ProviderCompany', 466, '10621.18'),
(69, 'LDX/00019/17-18', 'ProviderCompany', 467, '10621.18'),
(70, 'LDX/00020/17-18', 'Directory', 102, '590'),
(71, 'LDX/00021/17-18', 'ProviderIndividual', 468, '16521.18'),
(72, 'LDX/00022/17-18', 'Directory', 103, '590'),
(73, 'LDX/00023/17-18', 'Directory', 105, '590'),
(74, 'LDX/00024/17-18', 'Directory', 106, '590'),
(75, 'LDX/00025/17-18', 'Flash', 28, '236'),
(76, 'LDX/00026/17-18', 'Flash', 28, '236'),
(77, 'LDX/00027/17-18', 'Flash', 28, '236'),
(78, 'LDX/00028/17-18', 'ProviderCompany', 476, '12981.18'),
(79, 'LDX/00029/17-18', 'Flash', 29, '118'),
(80, 'LDX/00030/17-18', 'Directory', 109, '590'),
(81, 'LDX/00031/17-18', 'Flash', 31, '118'),
(82, 'LDX/00032/17-18', 'Flash', 32, '236'),
(83, 'LDX/00033/17-18', 'Directory', 111, '590'),
(84, 'LDX/00034/17-18', 'Flash', 33, '236'),
(85, 'LDX/00035/17-18', 'Flash', 38, '236'),
(86, 'LDX/00036/17-18', 'Flash', 38, '236'),
(87, 'LDX/00037/17-18', 'Flash', 38, '236'),
(88, 'LDX/00038/17-18', 'Flash', 38, '236'),
(89, 'LDX/00039/17-18', 'Flash', 39, '354'),
(90, 'LDX/00040/17-18', 'ProviderCompany', 488, '12981.18'),
(91, 'LDX/00041/17-18', 'Directory', 118, '590'),
(92, 'LDX/00042/17-18', 'Directory', 120, '590'),
(93, 'LDX/00043/17-18', 'Directory', 121, '590'),
(94, 'LDX/00044/17-18', 'ProviderCompany', 495, '10620'),
(95, 'LDX/00045/17-18', 'ProviderCompany', 495, '10620'),
(96, 'LDX/00046/17-18', 'Directory', 123, '590'),
(97, 'LDX/00047/17-18', 'Directory', 123, '590'),
(98, 'LDX/00048/17-18', 'Directory', 126, '590'),
(99, 'LDX/00049/17-18', 'Directory', 126, '590'),
(100, 'LDX/00050/17-18', 'Directory', 126, '590'),
(101, 'LDX/00051/17-18', 'Directory', 129, '590'),
(102, 'LDX/00052/17-18', 'Flash', 45, '236'),
(103, 'LDX/00053/17-18', 'Flash', 45, '236'),
(104, 'LDX/00054/17-18', 'Flash', 45, '236'),
(105, 'LDX/00055/17-18', 'Flash', 45, '236'),
(106, 'LDX/00056/17-18', 'Flash', 45, '236'),
(107, 'LDX/00057/17-18', 'Flash', 45, '236'),
(108, 'LDX/00058/17-18', 'Flash', 45, '236'),
(109, 'LDX/00059/17-18', 'Flash', 45, '236'),
(110, 'LDX/00060/17-18', 'Directory', 132, '590'),
(111, 'LDX/00061/17-18', 'Directory', 132, '590'),
(112, 'LDX/00062/17-18', 'Flash', 46, '118'),
(113, 'LDX/00063/17-18', 'Directory', 134, '590'),
(114, 'LDX/00064/17-18', 'Flash', 48, '236'),
(115, 'LDX/00065/17-18', 'Flash', 48, '236'),
(116, 'LDX/00066/17-18', 'Flash', 48, '236'),
(117, 'LDX/00067/17-18', 'Flash', 48, '236'),
(118, 'LDX/00068/17-18', 'ProviderCompany', 513, '438960'),
(119, 'LDX/00069/17-18', 'ProviderIndividual', 514, '35400'),
(120, 'LDX/00070/17-18', 'ProviderIndividual', 514, '70800'),
(121, 'LDX/00071/17-18', 'ProviderIndividual', 514, '17700'),
(122, 'LDX/00072/17-18', 'ProviderIndividual', 514, '17700'),
(123, 'LDX/00073/17-18', 'ProviderIndividual', 514, '17700'),
(124, 'LDX/00074/17-18', 'ProviderIndividual', 514, '1770'),
(125, 'LDX/00075/17-18', 'ProviderIndividual', 514, '1770'),
(126, 'LDX/00076/17-18', 'ProviderIndividual', 514, '1770'),
(127, 'LDX/00077/17-18', 'ProviderCompany', 516, '3551800'),
(128, 'LDX/00078/17-18', 'ProviderIndividual', 517, '3551800'),
(129, 'LDX/00079/17-18', 'Flash', 54, '354'),
(130, 'LDX/00080/17-18', 'Flash', 54, '354'),
(131, 'LDX/00081/17-18', 'Directory', 141, '590'),
(132, 'LDX/00082/17-18', 'Directory', 142, '590'),
(133, 'LDX/00083/17-18', 'Directory', 142, '590'),
(134, 'LDX/00084/17-18', 'Directory', 142, '590'),
(135, 'LDX/00085/17-18', 'Directory', 142, '590'),
(136, 'LDX/00086/17-18', 'Flash', 55, '118'),
(137, 'LDX/00087/17-18', 'Flash', 56, '118'),
(138, 'LDX/00088/17-18', 'Flash', 56, '118'),
(139, 'LDX/00089/17-18', 'PostYourFleet', 34, '826'),
(140, 'LDX/00090/17-18', 'PostYourFleet', 34, '826'),
(141, 'LDX/00091/17-18', 'PostYourFleet', 34, '826'),
(142, 'LDX/00092/17-18', 'ProviderIndividual', 526, '438960'),
(143, 'LDX/00093/17-18', 'PostYourFleet', 38, '354'),
(144, 'LDX/00094/17-18', 'ProviderIndividual', 536, '3551800'),
(145, 'LDX/00095/17-18', 'Directory', 152, '590'),
(146, 'LDX/00096/17-18', 'Flash', 63, '236'),
(147, 'LDX/00097/17-18', 'Flash', 63, '236'),
(148, 'LDX/00098/17-18', 'Flash', 63, '236'),
(149, 'LDX/00099/17-18', 'Flash', 63, '236'),
(150, 'LDX/000100/17-18', 'Flash', 63, '236'),
(151, 'LDX/000101/17-18', 'PostYourFleet', 40, '354'),
(152, 'LDX/000102/17-18', 'Flash', 77, '1180'),
(153, 'LDX/000103/17-18', 'ProviderCompany', 542, '3551800'),
(154, 'LDX/000104/17-18', 'ProviderCompany', 544, '3551800'),
(155, 'LDX/000105/17-18', 'ProviderCompany', 544, '3551800'),
(156, 'LDX/000106/17-18', 'ProviderIndividual', 556, '438960'),
(157, 'LDX/000107/17-18', 'Directory', 169, '590'),
(158, 'LDX/000108/17-18', 'ProviderIndividual', 521, '17700'),
(159, 'LDX/000109/17-18', 'ProviderIndividual', 521, '3540'),
(160, 'LDX/000110/17-18', 'ProviderIndividual', 521, '2360'),
(161, 'LDX/000111/17-18', 'Directory', 170, '590'),
(162, 'LDX/000112/17-18', 'Flash', 80, '236'),
(163, 'LDX/000113/17-18', 'ProviderCompany', 522, '59000'),
(164, 'LDX/000114/17-18', 'ProviderCompany', 522, '1180'),
(165, 'LDX/000115/17-18', 'ProviderCompany', 522, '11800'),
(166, 'LDX/000116/17-18', 'ProviderCompany', 522, '1180'),
(167, 'LDX/000117/17-18', 'ProviderCompany', 522, '1180'),
(168, 'LDX/000118/17-18', 'Flash', 81, '354'),
(169, 'LDX/000119/17-18', 'Flash', 82, '354'),
(170, 'LDX/000120/17-18', 'Flash', 82, '354'),
(171, 'LDX/000121/17-18', 'Directory', 171, '590'),
(172, 'LDX/000122/17-18', 'Directory', 171, '590'),
(173, 'LDX/000123/17-18', 'Directory', 171, '590'),
(174, 'LDX/000124/17-18', 'Directory', 171, '590'),
(175, 'LDX/000125/17-18', 'Directory', 172, '590'),
(176, 'LDX/000126/17-18', 'ProviderCompany', 522, '47200'),
(177, 'LDX/000127/17-18', 'Directory', 173, '590'),
(178, 'LDX/000128/17-18', 'PostYourFleet', 41, '590'),
(179, 'LDX/000129/17-18', 'Directory', 174, '590'),
(180, 'LDX/000130/17-18', 'Flash', 82, '236'),
(181, 'LDX/000131/17-18', 'ProviderCompany', 564, '438960'),
(182, 'LDX/000132/17-18', 'Flash', 89, '236'),
(183, 'LDX/000133/17-18', 'Flash', 89, '236'),
(184, 'LDX/000134/17-18', 'Directory', 180, '590'),
(185, 'LDX/000135/17-18', 'ProviderCompany', 522, '23600'),
(186, 'LDX/000136/17-18', 'Directory', 182, '590'),
(187, 'LDX/000137/17-18', 'Directory', 182, '590'),
(188, 'LDX/000138/17-18', 'Directory', 182, '590'),
(189, 'LDX/000139/17-18', 'Directory', 182, '590'),
(190, 'LDX/000140/17-18', 'Directory', 182, '590'),
(191, 'LDX/000141/17-18', 'Directory', 182, '590'),
(192, 'LDX/000142/17-18', 'Directory', 182, '590'),
(193, 'LDX/000143/17-18', 'Directory', 182, '590'),
(194, 'LDX/000144/17-18', 'Directory', 182, '590'),
(195, 'LDX/000145/17-18', 'Directory', 182, '590'),
(196, 'LDX/000146/17-18', 'Directory', 182, '590'),
(197, 'LDX/000147/17-18', 'Directory', 182, '590'),
(198, 'LDX/000148/17-18', 'Directory', 182, '590'),
(199, 'LDX/000149/17-18', 'Directory', 182, '590'),
(200, 'LDX/000150/17-18', 'Directory', 182, '590'),
(201, 'LDX/000151/17-18', 'Directory', 182, '590'),
(202, 'LDX/000152/17-18', 'Directory', 182, '590'),
(203, 'LDX/000153/17-18', 'Directory', 182, '590'),
(204, 'LDX/000154/17-18', 'Directory', 182, '590'),
(205, 'LDX/000155/17-18', 'Directory', 184, '590'),
(206, 'LDX/000156/17-18', 'Flash', 96, '590'),
(207, 'LDX/000157/17-18', 'PostYourFleet', 42, '826'),
(208, 'LDX/000158/17-18', 'Directory', 185, '590'),
(209, 'LDX/000159/17-18', 'Directory', 185, '590'),
(210, 'LDX/000160/17-18', 'Directory', 185, '590'),
(211, 'LDX/000161/17-18', 'Directory', 185, '590'),
(212, 'LDX/000162/17-18', 'Directory', 185, '590'),
(213, 'LDX/000163/17-18', 'Directory', 185, '590'),
(214, 'LDX/000164/17-18', 'Directory', 185, '590'),
(215, 'LDX/000165/17-18', 'Directory', 185, '590'),
(216, 'LDX/000166/17-18', 'Directory', 185, '590'),
(217, 'LDX/000167/17-18', 'Directory', 185, '590'),
(218, 'LDX/000168/17-18', 'Directory', 185, '590'),
(219, 'LDX/000169/17-18', 'Directory', 185, '590'),
(220, 'LDX/000170/17-18', 'Directory', 185, '590'),
(221, 'LDX/000171/17-18', 'Directory', 185, '590'),
(222, 'LDX/000172/17-18', 'Directory', 185, '590'),
(223, 'LDX/000173/17-18', 'Directory', 185, '590'),
(224, 'LDX/000174/17-18', 'ProviderCompany', 522, '47200'),
(225, 'LDX/000175/17-18', 'Directory', 185, '590'),
(226, 'LDX/000176/17-18', 'Directory', 185, '590'),
(227, 'LDX/000177/17-18', 'Directory', 185, '590'),
(228, 'LDX/000178/17-18', 'Directory', 185, '590'),
(229, 'LDX/000179/17-18', 'Directory', 185, '590'),
(230, 'LDX/000180/17-18', 'Directory', 185, '590'),
(231, 'LDX/000181/17-18', 'Directory', 185, '590'),
(232, 'LDX/000182/17-18', 'Directory', 185, '590'),
(233, 'LDX/000183/17-18', 'Directory', 185, '590'),
(234, 'LDX/000184/17-18', 'Directory', 185, '590'),
(235, 'LDX/000185/17-18', 'Directory', 185, '590'),
(236, 'LDX/000186/17-18', 'Directory', 185, '590'),
(237, 'LDX/000187/17-18', 'Directory', 185, '590'),
(238, 'LDX/000188/17-18', 'Directory', 185, '590'),
(239, 'LDX/000189/17-18', 'Flash', 97, '826'),
(240, 'LDX/000190/17-18', 'Flash', 97, '826'),
(241, 'LDX/000191/17-18', 'Flash', 97, '826'),
(242, 'LDX/000192/17-18', 'Flash', 97, '826'),
(243, 'LDX/000193/17-18', 'Flash', 97, '826'),
(244, 'LDX/000194/17-18', 'Flash', 97, '826'),
(245, 'LDX/000195/17-18', 'Flash', 97, '826'),
(246, 'LDX/000196/17-18', 'Flash', 97, '826'),
(247, 'LDX/000197/17-18', 'Flash', 97, '826'),
(248, 'LDX/000198/17-18', 'Flash', 97, '826'),
(249, 'LDX/000199/17-18', 'PostYourFleet', 43, '590'),
(250, 'LDX/000200/17-18', 'PostYourFleet', 43, '590'),
(251, 'LDX/000201/17-18', 'PostYourFleet', 43, '590'),
(252, 'LDX/000202/17-18', 'PostYourFleet', 43, '590'),
(253, 'LDX/000203/17-18', 'ProviderIndividual', 577, '3551800'),
(254, 'LDX/000204/17-18', 'PostYourFleet', 43, '590'),
(255, 'LDX/000205/17-18', 'ProviderIndividual', 577, '3551800'),
(256, 'LDX/000206/17-18', 'Directory', 187, '590'),
(257, 'LDX/000207/17-18', 'PostYourFleet', 45, '826'),
(258, 'LDX/000208/17-18', 'Flash', 100, '236'),
(259, 'LDX/000209/17-18', 'Flash', 100, '236'),
(260, 'LDX/000210/17-18', 'Directory', 188, '590'),
(261, 'LDX/000211/17-18', 'Directory', 188, '590'),
(262, 'LDX/000212/17-18', 'Directory', 188, '590'),
(263, 'LDX/000213/17-18', 'Directory', 188, '590'),
(264, 'LDX/000214/17-18', 'Directory', 188, '590'),
(265, 'LDX/000215/17-18', 'Directory', 188, '590'),
(266, 'LDX/000216/17-18', 'Directory', 188, '590'),
(267, 'LDX/000217/17-18', 'Directory', 188, '590'),
(268, 'LDX/000218/17-18', 'Directory', 188, '590'),
(269, 'LDX/000219/17-18', 'Directory', 188, '590'),
(270, 'LDX/000220/17-18', 'Directory', 188, '590'),
(271, 'LDX/000221/17-18', 'Directory', 188, '590'),
(272, 'LDX/000222/17-18', 'Directory', 188, '590'),
(273, 'LDX/000223/17-18', 'Directory', 188, '590'),
(274, 'LDX/000224/17-18', 'Directory', 188, '590'),
(275, 'LDX/000225/17-18', 'Directory', 188, '590'),
(276, 'LDX/000226/17-18', 'Directory', 188, '590'),
(277, 'LDX/000227/17-18', 'Directory', 188, '590'),
(278, 'LDX/000228/17-18', 'Directory', 188, '590'),
(279, 'LDX/000229/17-18', 'Flash', 100, '236'),
(280, 'LDX/000230/17-18', 'Flash', 100, '236'),
(281, 'LDX/000231/17-18', 'Flash', 100, '236'),
(282, 'LDX/000232/17-18', 'Flash', 100, '236'),
(283, 'LDX/000233/17-18', 'PostYourFleet', 49, '826'),
(284, 'LDX/000234/17-18', 'ProviderCompany', 592, '3575400'),
(285, 'LDX/000235/17-18', 'Flash', 127, '118'),
(286, 'LDX/000236/17-18', 'Flash', 127, '118'),
(287, 'LDX/000237/17-18', 'Flash', 127, '118'),
(288, 'LDX/000238/17-18', 'PostYourFleet', 52, '590'),
(289, 'LDX/000239/17-18', 'PostYourFleet', 52, '590'),
(290, 'LDX/000240/17-18', 'Directory', 230, '1180'),
(291, 'LDX/000241/17-18', 'Directory', 230, '1180'),
(292, 'LDX/000242/17-18', 'ProviderIndividual', 646, '2183'),
(293, 'LDX/000243/17-18', 'Network', 1, '4130'),
(294, 'LDX/000244/17-18', 'Network', 1, '4130'),
(295, 'LDX/000245/17-18', 'Network', 1, '4130'),
(296, 'LDX/000246/17-18', 'Network', 1, '4130'),
(297, 'LDX/000247/17-18', 'Network', 1, '4130'),
(298, 'LDX/000248/17-18', 'Network', 1, '4130'),
(299, 'LDX/000249/17-18', 'Network', 1, '4130'),
(300, 'LDX/000250/17-18', 'Network', 1, '4130'),
(301, 'LDX/000251/17-18', 'Network', 1, '4130'),
(302, 'LDX/000252/17-18', 'Network', 1, '4130'),
(303, 'LDX/000253/17-18', 'Network', 1, '4130'),
(304, 'LDX/000254/17-18', 'Network', 1, '4130'),
(305, 'LDX/000255/17-18', 'Network', 1, '4130'),
(306, 'LDX/000256/17-18', 'Network', 1, '4130'),
(307, 'LDX/000257/17-18', 'Network', 1, '4130'),
(308, 'LDX/000258/17-18', 'Network', 1, '4130'),
(309, 'LDX/000259/17-18', 'Network', 1, '4130'),
(310, 'LDX/000260/17-18', 'Network', 1, '4130'),
(311, 'LDX/000261/17-18', 'Network', 1, '4130'),
(312, 'LDX/000262/17-18', 'Network', 9, '1770'),
(313, 'LDX/000263/17-18', 'Network', 1, '4130'),
(314, 'LDX/000264/17-18', 'Network', 1, '4130'),
(315, 'LDX/000265/17-18', 'Network', 9, '1770'),
(316, 'LDX/000266/17-18', 'Network', 9, '1770'),
(317, 'LDX/000267/17-18', 'Network', 9, '1770'),
(318, 'LDX/000268/17-18', 'Network', 9, '1770'),
(319, 'LDX/000269/17-18', 'Network', 11, '1770'),
(320, 'LDX/000270/17-18', 'Network', 9, '1770'),
(321, 'LDX/000271/17-18', 'Network', 11, '1770'),
(322, 'LDX/000272/17-18', 'Network', 24, '1770'),
(323, 'LDX/000273/17-18', 'Network', 11, '1770'),
(324, 'LDX/000274/17-18', 'Flash', 143, '1062'),
(325, 'LDX/000275/17-18', 'Network', 24, '1770'),
(326, 'LDX/000276/17-18', 'Network', 24, '1770'),
(327, 'LDX/000277/17-18', 'Network', 26, '1770'),
(328, 'LDX/000278/17-18', 'Network', 28, '1770'),
(329, 'LDX/000279/17-18', 'Network', 2, '1770'),
(330, 'LDX/000280/17-18', 'Network', 3, '1770'),
(331, 'LDX/000281/17-18', 'ProviderIndividual', 721, '66080'),
(332, 'LDX/000282/17-18', 'ProviderIndividual', 721, '33040'),
(333, 'LDX/000283/17-18', 'ProviderIndividual', 722, '82600'),
(334, 'LDX/000284/17-18', 'ProviderIndividual', 722, '82600'),
(335, 'LDX/000285/17-18', 'ProviderIndividual', 722, '82600'),
(336, 'LDX/000286/17-18', 'ProviderIndividual', 721, '49560'),
(337, 'LDX/000287/17-18', 'ProviderIndividual', 721, '49560'),
(338, 'LDX/000288/17-18', 'ProviderIndividual', 721, '49560'),
(339, 'LDX/000289/17-18', 'ProviderIndividual', 721, '49560'),
(340, 'LDX/000290/17-18', 'ProviderIndividual', 721, '49560'),
(341, 'LDX/000291/17-18', 'ProviderIndividual', 721, '49560'),
(342, 'LDX/000292/17-18', 'Network', 6, '1770'),
(343, 'LDX/000293/17-18', 'ProviderCompany', 727, '16520'),
(344, 'LDX/000294/17-18', 'Directory', 245, '3894'),
(345, 'LDX/000295/17-18', 'Directory', 245, '3894'),
(346, 'LDX/000296/17-18', 'Directory', 245, '3894'),
(347, 'LDX/000297/17-18', 'Directory', 250, '2124'),
(348, 'LDX/000298/17-18', 'Directory', 250, '2124'),
(349, 'LDX/000299/17-18', 'Directory', 250, '2124'),
(350, 'LDX/000300/17-18', 'Directory', 250, '2124'),
(351, 'LDX/000301/17-18', 'Directory', 250, '2124'),
(352, 'LDX/000302/17-18', 'Directory', 250, '2124'),
(353, 'LDX/000303/17-18', 'Directory', 250, '2124'),
(354, 'LDX/000304/17-18', 'Directory', 250, '2124'),
(355, 'LDX/000305/17-18', 'Directory', 250, '2124'),
(356, 'LDX/000306/17-18', 'Directory', 250, '2124'),
(357, 'LDX/000307/17-18', 'Directory', 250, '2124'),
(358, 'LDX/000308/17-18', 'Directory', 250, '2124'),
(359, 'LDX/000309/17-18', 'Directory', 250, '2124'),
(360, 'LDX/000310/17-18', 'Directory', 250, '2124'),
(361, 'LDX/000311/17-18', 'Directory', 250, '2124'),
(362, 'LDX/000312/17-18', 'Directory', 250, '2124'),
(363, 'LDX/000313/17-18', 'Directory', 250, '2124'),
(364, 'LDX/000314/17-18', 'Directory', 250, '2124'),
(365, 'LDX/000315/17-18', 'Directory', 250, '2124'),
(366, 'LDX/000316/17-18', 'Directory', 250, '2124'),
(367, 'LDX/000317/17-18', 'Directory', 250, '2124'),
(368, 'LDX/000318/17-18', 'Directory', 250, '2124'),
(369, 'LDX/000319/17-18', 'Directory', 250, '2124'),
(370, 'LDX/000320/17-18', 'Directory', 251, '2124'),
(371, 'LDX/000321/17-18', 'Network', 25, '1770'),
(372, 'LDX/000322/17-18', 'ProviderIndividual', 767, '16520'),
(373, 'LDX/000323/17-18', 'Flash', 147, '708'),
(374, 'LDX/000324/17-18', 'ProviderCompany', 768, '16520'),
(375, 'LDX/000325/17-18', 'Flash', 147, '708'),
(376, 'LDX/000326/17-18', 'Flash', 147, '708'),
(377, 'LDX/000327/17-18', 'Flash', 148, '1062'),
(378, 'LDX/000328/17-18', 'Flash', 149, '1062'),
(379, 'LDX/000329/17-18', 'PostYourFleet', 57, '354'),
(380, 'LDX/000330/17-18', 'PostYourFleet', 58, '236'),
(381, 'LDX/00000/18-19', 'Admin', 0, '1'),
(382, 'LDX/0001/18-19', 'PostYourFleet', 59, '236'),
(383, 'LDX/0002/18-19', 'ProviderIndividual', 521, '66080'),
(384, 'LDX/0003/18-19', 'ProviderIndividual', 521, '66080'),
(385, 'LDX/0004/18-19', 'AssetRegister', 521, '66080'),
(386, 'LDX/0005/18-19', 'AssetRegister', 521, '66080'),
(387, 'LDX/0006/18-19', 'AssetRegister', 521, '66080'),
(388, 'LDX/0007/18-19', 'AssetRegister', 521, '49560'),
(389, 'LDX/0008/18-19', 'AssetRegister', 521, '49560'),
(390, 'LDX/0009/18-19', 'AssetRegister', 521, '49560'),
(391, 'LDX/00010/18-19', 'AssetRegister', 721, '16520'),
(392, 'LDX/00011/18-19', 'Flash', 9, '354'),
(393, 'LDX/00012/18-19', 'Flash', 10, '708');

-- --------------------------------------------------------

--
-- Table structure for table `sb_job`
--

CREATE TABLE IF NOT EXISTS `sb_job` (
  `job_id` int(10) NOT NULL AUTO_INCREMENT,
  `sb_user_id` int(11) NOT NULL,
  `job_title` text NOT NULL,
  `job_profile` text NOT NULL,
  `job_edu_req` text NOT NULL,
  `job_location` varchar(200) NOT NULL,
  `job_exp` text NOT NULL,
  `job_skills` text NOT NULL,
  `status_id` int(11) NOT NULL,
  PRIMARY KEY (`job_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `sb_job`
--

INSERT INTO `sb_job` (`job_id`, `sb_user_id`, `job_title`, `job_profile`, `job_edu_req`, `job_location`, `job_exp`, `job_skills`, `status_id`) VALUES
(1, 0, 'Python  Programmer', 'To work on System Development', 'MCA', 'Pune', '3yrs', 'Python', 1),
(2, 0, 'ghjgj', 'ghjghj', 'ghjghj', 'Mumbai, Maharashtra, India', '1', 'dfgdfgdfgdf', 0),
(3, 0, 'PHP Developer', 'Dev $ test', 'BE', 'Pune, Maharashtra, India', '2', 'fhggfhghghfhfgh', 0),
(4, 0, 'dfhdfhfdh', 'dfhdfh', 'dfhdh', 'Mumbai, Maharashtra, India', '4', 'fghfghfghfgh', 0),
(5, 39, 'fghfgh', 'fghfh', 'fghfgh', 'Maharashtra, India', 'vbn', 'bvnvbn', 0),
(6, 0, 'PHP Developer', 'dfgdfdg', 'dfgdfgd', 'New Delhi, Delhi, India', '1', 'erherheyhet', 0),
(7, 0, 'ghjgj', 'ghjghj', 'BE', 'Mumbai, Maharashtra, India', '1', 'fdgdgdg', 0),
(11, 34, 'PHP', 'Developer', 'BE', 'Pune, Maharashtra, India', '1yr', 'Php,Cake Php,Javascript', 0),
(12, 53, 'PHP Developer', 'PHP Developer', 'MCA', 'Pune, Maharashtra, India', '2 Years', 'Javascript ,jquery,php,mysql,any framework', 0),
(13, 53, 'PHP Developer', 'Developer', 'BE', 'Mumbai, Maharashtra, India', '2 yr', 'Php,Cake Php,Javascript', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sb_job_application`
--

CREATE TABLE IF NOT EXISTS `sb_job_application` (
  `job_app_id` int(10) NOT NULL AUTO_INCREMENT,
  `job_app_fname` varchar(200) NOT NULL,
  `job_app_lname` varchar(200) NOT NULL,
  `job_app_email` varchar(200) NOT NULL,
  `job_app_contact` varchar(200) NOT NULL,
  `job_app_country` varchar(200) NOT NULL,
  `job_app_exp_yrs` varchar(200) NOT NULL,
  `job_app_exp_mnths` varchar(200) NOT NULL,
  `job_app_pref_profile` varchar(200) NOT NULL,
  `job_app_pref_loc` varchar(200) NOT NULL,
  `job_skills` varchar(200) NOT NULL,
  `job_app_resume` varchar(200) NOT NULL,
  PRIMARY KEY (`job_app_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `sb_job_application`
--

INSERT INTO `sb_job_application` (`job_app_id`, `job_app_fname`, `job_app_lname`, `job_app_email`, `job_app_contact`, `job_app_country`, `job_app_exp_yrs`, `job_app_exp_mnths`, `job_app_pref_profile`, `job_app_pref_loc`, `job_skills`, `job_app_resume`) VALUES
(1, 'Manjusha', 'Praveen', 'manjushapraveen31@gmail.com', '9556654212', 'India', '3', '13', '-Select Your Profile-', 'India', 'Code Igniter,Php', 'D:/xampp/htdocs/studbizz/public/images2/Available_Business_-_West_Zone_-_(_09-06-2018_Between_19-06-2018)_.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `sb_lecturer_reg`
--

CREATE TABLE IF NOT EXISTS `sb_lecturer_reg` (
  `sb_lect_id` int(11) NOT NULL AUTO_INCREMENT,
  `sb_user_id` int(11) NOT NULL,
  `photo` varchar(200) NOT NULL,
  `firstName` varchar(100) NOT NULL,
  `lastName` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(25) NOT NULL,
  `department` varchar(50) NOT NULL,
  `college` varchar(500) NOT NULL,
  `birthDate` date NOT NULL,
  `mobile_no` varchar(20) NOT NULL,
  `radio` varchar(30) NOT NULL,
  `desg` varchar(200) NOT NULL,
  `org` varchar(500) NOT NULL,
  `sub_exp` varchar(200) NOT NULL,
  `fav_topics` varchar(500) NOT NULL,
  `notify_status` int(11) NOT NULL,
  PRIMARY KEY (`sb_lect_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `sb_lecturer_reg`
--

INSERT INTO `sb_lecturer_reg` (`sb_lect_id`, `sb_user_id`, `photo`, `firstName`, `lastName`, `email`, `password`, `department`, `college`, `birthDate`, `mobile_no`, `radio`, `desg`, `org`, `sub_exp`, `fav_topics`, `notify_status`) VALUES
(1, 48, '', 'rupali', 'Satpute', 'rs@gmail.com', '123456', '15', 'AES', '1994-03-14', '8989898989', 'Female', '', '', '', '', 1),
(2, 62, 'uploads/profile/Koala.jpg', 'Radha124', 'Madhav', 'radha@yahoo.com', '123456', '-----Select------', 'AES', '1254-02-14', '9823042381', 'Female', 'AAAA', 'BB', '3', 'maths', 0),
(3, 63, '', 'ghkhg', 'kghkgk', 'a@gmail.com', '111', '6', 'BHor', '2010-02-10', '982304256', 'Female', '', '', '', '', 0),
(4, 64, '', 'm,.m,', '.m,.m,.', 's14@yahoo.com', '.m', '14', 'AES', '2222-02-10', '982304256', 'Female', '', '', '', '', 0),
(5, 76, '', 'kkkk', 'kkk', 'kk@gmail.com', '123456', '16', 'try', '1200-02-10', '9822538848', 'Female', 'rtryrty', 'trytry', 'trytry', 'trytry', 0),
(6, 80, 'uploads/profile/Penguins.jpg', 'rupa', 'Nikam', 'a@yahoo.com', '123456', '3', 'rtrtrt', '2014-08-10', '9895602541', 'Female', 'MMM', 'Symbiol', 'Maths', 'MAths', 0),
(7, 1, 'uploads/profile/Chrysanthemum.jpg', 'rupa', 'Nikam', 'r@yahoo.com', '123456', '8', 'Abhinav', '1994-03-14', '9822538848', 'Female', 'Manager', 'Loadxone', '2yr', 'maths', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sb_network`
--

CREATE TABLE IF NOT EXISTS `sb_network` (
  `nw_id` int(11) NOT NULL AUTO_INCREMENT,
  `sb_user_id` int(11) NOT NULL,
  `nw_uname` varchar(100) NOT NULL,
  `reg_date` date NOT NULL,
  `active_date` date NOT NULL,
  `comp_name` varchar(50) NOT NULL,
  `comp_address` varchar(200) NOT NULL,
  `person_name` varchar(150) NOT NULL,
  `email_id` varchar(40) NOT NULL,
  `land_no` varchar(20) NOT NULL,
  `mobile_no` varchar(20) NOT NULL,
  `location` varchar(500) NOT NULL,
  `hub_id` varchar(100) NOT NULL,
  `pincode` int(11) NOT NULL,
  `company_pan` varchar(200) NOT NULL,
  `gst_number` varchar(200) NOT NULL,
  `adhaar_number` varchar(255) NOT NULL,
  `annual` varchar(200) NOT NULL,
  `profession` varchar(200) NOT NULL,
  `refcode` varchar(25) NOT NULL,
  `nw_validity` varchar(100) NOT NULL,
  `nw_amount` double NOT NULL,
  `tax_amt` varchar(100) NOT NULL,
  `payment_mode` varchar(100) NOT NULL,
  `payment_status` varchar(100) NOT NULL,
  `final_tot` double NOT NULL,
  `status_id` int(11) NOT NULL,
  `eol` date NOT NULL,
  `notify_status` int(11) NOT NULL,
  PRIMARY KEY (`nw_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `sb_network`
--

INSERT INTO `sb_network` (`nw_id`, `sb_user_id`, `nw_uname`, `reg_date`, `active_date`, `comp_name`, `comp_address`, `person_name`, `email_id`, `land_no`, `mobile_no`, `location`, `hub_id`, `pincode`, `company_pan`, `gst_number`, `adhaar_number`, `annual`, `profession`, `refcode`, `nw_validity`, `nw_amount`, `tax_amt`, `payment_mode`, `payment_status`, `final_tot`, `status_id`, `eol`, `notify_status`) VALUES
(2, 19, 'ND24006K', '2018-06-26', '0000-00-00', 'rups', 'gdgdgsadFSGSFD', 'dfgfdgfdg', 'r@yahoo.com', '5645646', '9823042381', 'Vivekananda Kendra, Joshi Wada, Sadashiv Peth, Pune, Maharashtra, India', '', 411030, 'dfgdgfdgdg', 'eytryrty565', 'dsgdfdg', 'ghjgjgjgj', 'ghjgjgjhhgj', '', 'rtyrtyrtyrt', 0, '', '', '', 0, 0, '0000-00-00', 0),
(3, 20, 'ND87995E', '2018-06-26', '0000-00-00', 'rupali', 'pune', 'rp', 'anilvkharche@gmail.com', '546464', '9960809335', 'Pune Railway Station, Agarkar Nagar, Pune, Maharashtra', '', 411001, '7978987979', '9879797', '', '', '', '', '', 0, '', '', '', 0, 0, '0000-00-00', 1),
(4, 21, 'ND49953X', '2018-06-30', '0000-00-00', 'Rups', 'Pune', 'Rk', 'anilvkharche@gmail.com', '546464', '9960809335', 'Pune, Maharashtra, India', '', 411011, '654646464', '646464646', '64646464644', '', '', 'ND24006K', '', 0, '', '', '', 0, 0, '0000-00-00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sb_news`
--

CREATE TABLE IF NOT EXISTS `sb_news` (
  `news_id` int(11) NOT NULL AUTO_INCREMENT,
  `news_title` varchar(200) NOT NULL,
  `news_image` varchar(500) NOT NULL,
  `news_description` text NOT NULL,
  `create_date` datetime NOT NULL,
  `status_id` int(11) NOT NULL,
  PRIMARY KEY (`news_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `sb_news`
--

INSERT INTO `sb_news` (`news_id`, `news_title`, `news_image`, `news_description`, `create_date`, `status_id`) VALUES
(2, 'One', 'public/News/Chrysanthemum.jpg', 'When you use Event Viewer to troubleshoot a problem, you need to locate events related to the problem, regardless of which event log they appear in. Event Viewer enables you to filter for specific events across multiple logs. That makes it easy to display all events potentially related to an issue that you are investigating. To specify a filter that spans multiple logs, you need to create a custom view.When you use Event Viewer to troubleshoot a problem, you need to locate events related to the problem, regardless of which event log they appear in. Event Viewer enables you to filter for specific events across multiple logs. That makes it easy to display all events potentially related to an issue that you are investigating. To specify a filter that spans multiple logs, you need to create a custom view.', '2018-07-12 15:40:30', 1),
(3, 'Two', 'public/News/Desert.jpg', 'When you use Event Viewer to troubleshoot a problem, you need to locate events related to the problem, regardless of which event log they appear in. Event Viewer enables you to filter for specific events across multiple logs. That makes it easy to display all events potentially related to an issue that you are investigating. To specify a filter that spans multiple logs, you need to create a custom view.', '2018-07-12 15:40:55', 1),
(4, 'Three', 'public/News/Koala.jpg', 'When you use Event Viewer to troubleshoot a problem, you need to locate events related to the problem, regardless of which event log they appear in. Event Viewer enables you to filter for specific events across multiple logs. That makes it easy to display all events potentially related to an issue that you are investigating. To specify a filter that spans multiple logs, you need to create a custom view.When you use Event Viewer to troubleshoot a problem, you need to locate events related to the problem, regardless of which event log they appear in. Event Viewer enables you to filter for specific events across multiple logs. That makes it easy to display all events potentially related to an issue that you are investigating. To specify a filter that spans multiple logs, you need to create a custom view.When you use Event Viewer to troubleshoot a problem, you need to locate events related to the problem, regardless of which event log they appear in. Event Viewer enables you to filter for specific events across multiple logs. That makes it easy to display all events potentially related to an issue that you are investigating. To specify a filter that spans multiple logs, you need to create a custom view.', '2018-07-12 15:41:16', 1),
(5, 'Four1', 'public/News/Jellyfish.jpg', 'When you use Event Viewer to troubleshoot a problem, you need to locate events related to the problem, regardless of which event log they appear in. Event Viewer enables you to filter for specific events across multiple logs. That makes it easy to display all events potentially related to an issue that you are investigating. To specify a filter that spans multiple logs, you need to create a custom view.When you use Event Viewer to troubleshoot a problem, you need to locate events related to the problem, regardless of which event log they appear in. Event Viewer enables you to filter for specific events across multiple logs. That makes it easy to display all events potentially related to an issue that you are investigating. To specify a filter that spans multiple logs, you need to create a custom view.', '2018-08-01 11:35:04', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sb_order_alert_history`
--

CREATE TABLE IF NOT EXISTS `sb_order_alert_history` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `flash_id` int(11) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `amount` varchar(200) NOT NULL,
  `txnid` varchar(200) NOT NULL,
  `productinfo` varchar(200) NOT NULL,
  `key` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `hash` varchar(1000) NOT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=162 ;

--
-- Dumping data for table `sb_order_alert_history`
--

INSERT INTO `sb_order_alert_history` (`order_id`, `flash_id`, `firstname`, `amount`, `txnid`, `productinfo`, `key`, `email`, `hash`, `status`) VALUES
(2, 3, 'rupali', '1.0', 'ac2c0d8f6ba7741c821a', 'Flash', 'hDkYGPQe', 'rupali@gmail.com', '2cb83552ab9eba5d6af3ee1ecdbad89cfdeb518ed62b85c3a44a3926e4a86ba945b2345154d76338cac3b25aa0679d12a390c55b5e298eae7b123300092b970b', 'success'),
(3, 5, '7587486788', '1.0', '14d3ed658d2f760eca6b', 'Flash', 'hDkYGPQe', 'satpute_rupali@yahoo.com', '9e793d122d910ba06c5836a1a175cecb44be280e44c7b58f55c1232e78631657512a2b3f254e81434b97e0937a30fdc317970190302f840d903d80c7a4e6d6fe', 'success'),
(4, 6, 'anil', '1.0', '81056e5ab58447dcd081', 'Flash', 'hDkYGPQe', 'aaaaa@gmail.com', '17c407fd94f7669353ea557b31d65e6eb73f731e74799d2e9094c1dad239450ad8a5e7c54e9b2b9298ed26a235b1a2decaab49194af231130f0f8013532bf2bf', 'success'),
(5, 16, 'Narendra Joshi', '1.0', '3ac831e35a492296bb3f', 'Flash', 'hDkYGPQe', 'njoshii@gmail.com', '73b0f67388abdd8176aac36438860cc199bc45055ba95cc1f35475b02d2a5201b9f3f36c7c99069ba809baa9d1c8f3115b9658d45519d95c30d162ec0953cf8a', 'failure'),
(6, 16, 'Narendra Joshi', '1.0', '3ac831e35a492296bb3f', 'Flash', 'hDkYGPQe', 'njoshii@gmail.com', '73b0f67388abdd8176aac36438860cc199bc45055ba95cc1f35475b02d2a5201b9f3f36c7c99069ba809baa9d1c8f3115b9658d45519d95c30d162ec0953cf8a', 'failure'),
(7, 16, 'Narendra Joshi', '1.0', '3ac831e35a492296bb3f', 'Flash', 'hDkYGPQe', 'njoshii@gmail.com', '73b0f67388abdd8176aac36438860cc199bc45055ba95cc1f35475b02d2a5201b9f3f36c7c99069ba809baa9d1c8f3115b9658d45519d95c30d162ec0953cf8a', 'failure'),
(8, 16, 'Narendra Joshi', '1.0', '3ac831e35a492296bb3f', 'Flash', 'hDkYGPQe', 'njoshii@gmail.com', '73b0f67388abdd8176aac36438860cc199bc45055ba95cc1f35475b02d2a5201b9f3f36c7c99069ba809baa9d1c8f3115b9658d45519d95c30d162ec0953cf8a', 'failure'),
(9, 16, 'Narendra Joshi', '1.0', '3ac831e35a492296bb3f', 'Flash', 'hDkYGPQe', 'njoshii@gmail.com', '73b0f67388abdd8176aac36438860cc199bc45055ba95cc1f35475b02d2a5201b9f3f36c7c99069ba809baa9d1c8f3115b9658d45519d95c30d162ec0953cf8a', 'failure'),
(10, 18, 'Rahul Naik', '1.0', '812c9cc20e3d52f42adb', 'Flash', 'hDkYGPQe', 'rahulnaik@gmail.com', '23e47d81d2c08069b4fdc97e8a1dcf7f4978e05ce4b2eb606f13f383854fa0cdaa01c0ec51afafce6ed28bcf09ce6401f13c7cac0aa4ead6c1d2832aa6f8a6f3', 'failure'),
(11, 18, 'Rahul Naik', '1.0', '812c9cc20e3d52f42adb', 'Flash', 'hDkYGPQe', 'rahulnaik@gmail.com', '23e47d81d2c08069b4fdc97e8a1dcf7f4978e05ce4b2eb606f13f383854fa0cdaa01c0ec51afafce6ed28bcf09ce6401f13c7cac0aa4ead6c1d2832aa6f8a6f3', 'failure'),
(12, 18, 'Rahul Naik', '1.0', '812c9cc20e3d52f42adb', 'Flash', 'hDkYGPQe', 'rahulnaik@gmail.com', '23e47d81d2c08069b4fdc97e8a1dcf7f4978e05ce4b2eb606f13f383854fa0cdaa01c0ec51afafce6ed28bcf09ce6401f13c7cac0aa4ead6c1d2832aa6f8a6f3', 'failure'),
(13, 19, 'jhgjkhgkjg', '1.0', '2ba47fa9ea7ae1f7d306', 'Flash', 'hDkYGPQe', 'rahulnaik@gmail.com', 'bc7be11368d9c378bf741e08efd5b42419d59576928775d4a2145d238a1309e883fd58a5243b30df186f96e61705114ca57fbee1862bf5ac9f605914f5e18503', 'failure'),
(14, 21, 'jhgjghjg', '1.0', '7707059720a38daae2bb', 'Flash', 'hDkYGPQe', 'abc@yahoo.com', '93959d259ee697780c56136f26fbc3d5851ebe998581fe1e02c7c1687cf5b87418fe419ba7c4c473d521c79cbd9af8ee41ec5ff0cb1a98c02c362a8446cd79bb', 'success'),
(15, 21, 'jhgjghjg', '1.0', '7707059720a38daae2bb', 'Flash', 'hDkYGPQe', 'abc@yahoo.com', '93959d259ee697780c56136f26fbc3d5851ebe998581fe1e02c7c1687cf5b87418fe419ba7c4c473d521c79cbd9af8ee41ec5ff0cb1a98c02c362a8446cd79bb', 'success'),
(16, 21, 'jhgjghjg', '1.0', '7707059720a38daae2bb', 'Flash', 'hDkYGPQe', 'abc@yahoo.com', '93959d259ee697780c56136f26fbc3d5851ebe998581fe1e02c7c1687cf5b87418fe419ba7c4c473d521c79cbd9af8ee41ec5ff0cb1a98c02c362a8446cd79bb', 'success'),
(17, 21, 'jhgjghjg', '1.0', '7707059720a38daae2bb', 'Flash', 'hDkYGPQe', 'abc@yahoo.com', '93959d259ee697780c56136f26fbc3d5851ebe998581fe1e02c7c1687cf5b87418fe419ba7c4c473d521c79cbd9af8ee41ec5ff0cb1a98c02c362a8446cd79bb', 'success'),
(18, 21, 'jhgjghjg', '1.0', '7707059720a38daae2bb', 'Flash', 'hDkYGPQe', 'abc@yahoo.com', '93959d259ee697780c56136f26fbc3d5851ebe998581fe1e02c7c1687cf5b87418fe419ba7c4c473d521c79cbd9af8ee41ec5ff0cb1a98c02c362a8446cd79bb', 'success'),
(19, 22, 'madhura', '1.0', '6420e04fc2c1b39d0426', 'Flash', 'hDkYGPQe', 'madhura@gmail.com', 'a6abbe555a6922e8d7737c62df0cb7d1be9740275669374bb6020ede1986621628966ef26bf5b58ba78e9325af2b5b94c399405f862722b8a5d7842a30e1f749', 'success'),
(20, 22, 'madhura', '1.0', '6420e04fc2c1b39d0426', 'Flash', 'hDkYGPQe', 'madhura@gmail.com', 'a6abbe555a6922e8d7737c62df0cb7d1be9740275669374bb6020ede1986621628966ef26bf5b58ba78e9325af2b5b94c399405f862722b8a5d7842a30e1f749', 'success'),
(21, 22, 'madhura', '1.0', '6420e04fc2c1b39d0426', 'Flash', 'hDkYGPQe', 'madhura@gmail.com', 'a6abbe555a6922e8d7737c62df0cb7d1be9740275669374bb6020ede1986621628966ef26bf5b58ba78e9325af2b5b94c399405f862722b8a5d7842a30e1f749', 'success'),
(22, 22, 'madhura', '1.0', '6420e04fc2c1b39d0426', 'Flash', 'hDkYGPQe', 'madhura@gmail.com', 'a6abbe555a6922e8d7737c62df0cb7d1be9740275669374bb6020ede1986621628966ef26bf5b58ba78e9325af2b5b94c399405f862722b8a5d7842a30e1f749', 'success'),
(23, 23, 'akash', '1.0', '2d6ae210d3af0ef71536', 'Flash', 'hDkYGPQe', 'akash@gmail.com', 'd48ca83ceb90f9347d7619574d4b02997131784a5dc7624c9dbf7fcfff5127c4083c04159d1b04315ed4418d20af9a49b7017fa5495db1c67ec29647aca8f714', 'success'),
(24, 23, 'akash', '1.0', '2d6ae210d3af0ef71536', 'Flash', 'hDkYGPQe', 'akash@gmail.com', 'd48ca83ceb90f9347d7619574d4b02997131784a5dc7624c9dbf7fcfff5127c4083c04159d1b04315ed4418d20af9a49b7017fa5495db1c67ec29647aca8f714', 'success'),
(25, 23, 'akash', '1.0', '2d6ae210d3af0ef71536', 'Flash', 'hDkYGPQe', 'akash@gmail.com', 'd48ca83ceb90f9347d7619574d4b02997131784a5dc7624c9dbf7fcfff5127c4083c04159d1b04315ed4418d20af9a49b7017fa5495db1c67ec29647aca8f714', 'success'),
(26, 23, 'akash', '1.0', '2d6ae210d3af0ef71536', 'Flash', 'hDkYGPQe', 'akash@gmail.com', 'd48ca83ceb90f9347d7619574d4b02997131784a5dc7624c9dbf7fcfff5127c4083c04159d1b04315ed4418d20af9a49b7017fa5495db1c67ec29647aca8f714', 'success'),
(27, 23, 'akash', '1.0', '2d6ae210d3af0ef71536', 'Flash', 'hDkYGPQe', 'akash@gmail.com', 'd48ca83ceb90f9347d7619574d4b02997131784a5dc7624c9dbf7fcfff5127c4083c04159d1b04315ed4418d20af9a49b7017fa5495db1c67ec29647aca8f714', 'success'),
(28, 23, 'akash', '1.0', '2d6ae210d3af0ef71536', 'Flash', 'hDkYGPQe', 'akash@gmail.com', 'd48ca83ceb90f9347d7619574d4b02997131784a5dc7624c9dbf7fcfff5127c4083c04159d1b04315ed4418d20af9a49b7017fa5495db1c67ec29647aca8f714', 'success'),
(29, 23, 'akash', '1.0', '2d6ae210d3af0ef71536', 'Flash', 'hDkYGPQe', 'akash@gmail.com', 'd48ca83ceb90f9347d7619574d4b02997131784a5dc7624c9dbf7fcfff5127c4083c04159d1b04315ed4418d20af9a49b7017fa5495db1c67ec29647aca8f714', 'success'),
(30, 23, 'akash', '1.0', '2d6ae210d3af0ef71536', 'Flash', 'hDkYGPQe', 'akash@gmail.com', 'd48ca83ceb90f9347d7619574d4b02997131784a5dc7624c9dbf7fcfff5127c4083c04159d1b04315ed4418d20af9a49b7017fa5495db1c67ec29647aca8f714', 'success'),
(31, 23, 'akash', '1.0', '2d6ae210d3af0ef71536', 'Flash', 'hDkYGPQe', 'akash@gmail.com', 'd48ca83ceb90f9347d7619574d4b02997131784a5dc7624c9dbf7fcfff5127c4083c04159d1b04315ed4418d20af9a49b7017fa5495db1c67ec29647aca8f714', 'success'),
(32, 23, 'akash', '1.0', '2d6ae210d3af0ef71536', 'Flash', 'hDkYGPQe', 'akash@gmail.com', 'd48ca83ceb90f9347d7619574d4b02997131784a5dc7624c9dbf7fcfff5127c4083c04159d1b04315ed4418d20af9a49b7017fa5495db1c67ec29647aca8f714', 'success'),
(33, 23, 'akash', '1.0', '2d6ae210d3af0ef71536', 'Flash', 'hDkYGPQe', 'akash@gmail.com', 'd48ca83ceb90f9347d7619574d4b02997131784a5dc7624c9dbf7fcfff5127c4083c04159d1b04315ed4418d20af9a49b7017fa5495db1c67ec29647aca8f714', 'success'),
(34, 23, 'akash', '1.0', '2d6ae210d3af0ef71536', 'Flash', 'hDkYGPQe', 'akash@gmail.com', 'd48ca83ceb90f9347d7619574d4b02997131784a5dc7624c9dbf7fcfff5127c4083c04159d1b04315ed4418d20af9a49b7017fa5495db1c67ec29647aca8f714', 'success'),
(35, 23, 'akash', '1.0', '2d6ae210d3af0ef71536', 'Flash', 'hDkYGPQe', 'akash@gmail.com', 'd48ca83ceb90f9347d7619574d4b02997131784a5dc7624c9dbf7fcfff5127c4083c04159d1b04315ed4418d20af9a49b7017fa5495db1c67ec29647aca8f714', 'success'),
(36, 23, 'akash', '1.0', '2d6ae210d3af0ef71536', 'Flash', 'hDkYGPQe', 'akash@gmail.com', 'd48ca83ceb90f9347d7619574d4b02997131784a5dc7624c9dbf7fcfff5127c4083c04159d1b04315ed4418d20af9a49b7017fa5495db1c67ec29647aca8f714', 'success'),
(37, 23, 'akash', '1.0', '2d6ae210d3af0ef71536', 'Flash', 'hDkYGPQe', 'akash@gmail.com', 'd48ca83ceb90f9347d7619574d4b02997131784a5dc7624c9dbf7fcfff5127c4083c04159d1b04315ed4418d20af9a49b7017fa5495db1c67ec29647aca8f714', 'success'),
(38, 23, 'akash', '1.0', '2d6ae210d3af0ef71536', 'Flash', 'hDkYGPQe', 'akash@gmail.com', 'd48ca83ceb90f9347d7619574d4b02997131784a5dc7624c9dbf7fcfff5127c4083c04159d1b04315ed4418d20af9a49b7017fa5495db1c67ec29647aca8f714', 'success'),
(39, 23, 'akash', '1.0', '2d6ae210d3af0ef71536', 'Flash', 'hDkYGPQe', 'akash@gmail.com', 'd48ca83ceb90f9347d7619574d4b02997131784a5dc7624c9dbf7fcfff5127c4083c04159d1b04315ed4418d20af9a49b7017fa5495db1c67ec29647aca8f714', 'success'),
(40, 23, 'akash', '1.0', '2d6ae210d3af0ef71536', 'Flash', 'hDkYGPQe', 'akash@gmail.com', 'd48ca83ceb90f9347d7619574d4b02997131784a5dc7624c9dbf7fcfff5127c4083c04159d1b04315ed4418d20af9a49b7017fa5495db1c67ec29647aca8f714', 'success'),
(41, 23, 'akash', '1.0', '2d6ae210d3af0ef71536', 'Flash', 'hDkYGPQe', 'akash@gmail.com', 'd48ca83ceb90f9347d7619574d4b02997131784a5dc7624c9dbf7fcfff5127c4083c04159d1b04315ed4418d20af9a49b7017fa5495db1c67ec29647aca8f714', 'success'),
(42, 24, 'Rana shingh', '1.0', 'e421c3323c6b2a3090c7', 'Flash', 'hDkYGPQe', 'ranasingh@gmail.com', 'fd65621df5b81ec1f94b62be9c32a3ad442c26f8d058dfe42c182a2102a8d0cf5e0f6a2647c16a2d442d606f2024f93b6a305fe8ce187f60a68f93b6818a1eb5', 'success'),
(43, 24, 'Rana shingh', '1.0', 'e421c3323c6b2a3090c7', 'Flash', 'hDkYGPQe', 'ranasingh@gmail.com', 'fd65621df5b81ec1f94b62be9c32a3ad442c26f8d058dfe42c182a2102a8d0cf5e0f6a2647c16a2d442d606f2024f93b6a305fe8ce187f60a68f93b6818a1eb5', 'success'),
(44, 24, 'Rana shingh', '1.0', 'e421c3323c6b2a3090c7', 'Flash', 'hDkYGPQe', 'ranasingh@gmail.com', 'fd65621df5b81ec1f94b62be9c32a3ad442c26f8d058dfe42c182a2102a8d0cf5e0f6a2647c16a2d442d606f2024f93b6a305fe8ce187f60a68f93b6818a1eb5', 'success'),
(45, 24, 'Rana shingh', '1.0', 'e421c3323c6b2a3090c7', 'Flash', 'hDkYGPQe', 'ranasingh@gmail.com', 'fd65621df5b81ec1f94b62be9c32a3ad442c26f8d058dfe42c182a2102a8d0cf5e0f6a2647c16a2d442d606f2024f93b6a305fe8ce187f60a68f93b6818a1eb5', 'success'),
(46, 24, 'Rana shingh', '1.0', 'e421c3323c6b2a3090c7', 'Flash', 'hDkYGPQe', 'ranasingh@gmail.com', 'fd65621df5b81ec1f94b62be9c32a3ad442c26f8d058dfe42c182a2102a8d0cf5e0f6a2647c16a2d442d606f2024f93b6a305fe8ce187f60a68f93b6818a1eb5', 'success'),
(47, 24, 'Rana shingh', '1.0', 'e421c3323c6b2a3090c7', 'Flash', 'hDkYGPQe', 'ranasingh@gmail.com', 'fd65621df5b81ec1f94b62be9c32a3ad442c26f8d058dfe42c182a2102a8d0cf5e0f6a2647c16a2d442d606f2024f93b6a305fe8ce187f60a68f93b6818a1eb5', 'success'),
(48, 24, 'Rana shingh', '1.0', 'e421c3323c6b2a3090c7', 'Flash', 'hDkYGPQe', 'ranasingh@gmail.com', 'fd65621df5b81ec1f94b62be9c32a3ad442c26f8d058dfe42c182a2102a8d0cf5e0f6a2647c16a2d442d606f2024f93b6a305fe8ce187f60a68f93b6818a1eb5', 'success'),
(49, 24, 'Rana shingh', '1.0', 'e421c3323c6b2a3090c7', 'Flash', 'hDkYGPQe', 'ranasingh@gmail.com', 'fd65621df5b81ec1f94b62be9c32a3ad442c26f8d058dfe42c182a2102a8d0cf5e0f6a2647c16a2d442d606f2024f93b6a305fe8ce187f60a68f93b6818a1eb5', 'success'),
(50, 24, 'Rana shingh', '1.0', 'e421c3323c6b2a3090c7', 'Flash', 'hDkYGPQe', 'ranasingh@gmail.com', 'fd65621df5b81ec1f94b62be9c32a3ad442c26f8d058dfe42c182a2102a8d0cf5e0f6a2647c16a2d442d606f2024f93b6a305fe8ce187f60a68f93b6818a1eb5', 'success'),
(51, 24, 'Rana shingh', '1.0', 'e421c3323c6b2a3090c7', 'Flash', 'hDkYGPQe', 'ranasingh@gmail.com', 'fd65621df5b81ec1f94b62be9c32a3ad442c26f8d058dfe42c182a2102a8d0cf5e0f6a2647c16a2d442d606f2024f93b6a305fe8ce187f60a68f93b6818a1eb5', 'success'),
(52, 24, 'Rana shingh', '1.0', 'e421c3323c6b2a3090c7', 'Flash', 'hDkYGPQe', 'ranasingh@gmail.com', 'fd65621df5b81ec1f94b62be9c32a3ad442c26f8d058dfe42c182a2102a8d0cf5e0f6a2647c16a2d442d606f2024f93b6a305fe8ce187f60a68f93b6818a1eb5', 'success'),
(53, 24, 'Rana shingh', '1.0', 'e421c3323c6b2a3090c7', 'Flash', 'hDkYGPQe', 'ranasingh@gmail.com', 'fd65621df5b81ec1f94b62be9c32a3ad442c26f8d058dfe42c182a2102a8d0cf5e0f6a2647c16a2d442d606f2024f93b6a305fe8ce187f60a68f93b6818a1eb5', 'success'),
(54, 24, 'Rana shingh', '1.0', 'e421c3323c6b2a3090c7', 'Flash', 'hDkYGPQe', 'ranasingh@gmail.com', 'fd65621df5b81ec1f94b62be9c32a3ad442c26f8d058dfe42c182a2102a8d0cf5e0f6a2647c16a2d442d606f2024f93b6a305fe8ce187f60a68f93b6818a1eb5', 'success'),
(55, 24, 'Rana shingh', '1.0', 'e421c3323c6b2a3090c7', 'Flash', 'hDkYGPQe', 'ranasingh@gmail.com', 'fd65621df5b81ec1f94b62be9c32a3ad442c26f8d058dfe42c182a2102a8d0cf5e0f6a2647c16a2d442d606f2024f93b6a305fe8ce187f60a68f93b6818a1eb5', 'success'),
(56, 24, 'Rana shingh', '1.0', 'e421c3323c6b2a3090c7', 'Flash', 'hDkYGPQe', 'ranasingh@gmail.com', 'fd65621df5b81ec1f94b62be9c32a3ad442c26f8d058dfe42c182a2102a8d0cf5e0f6a2647c16a2d442d606f2024f93b6a305fe8ce187f60a68f93b6818a1eb5', 'success'),
(57, 24, 'Rana shingh', '1.0', 'e421c3323c6b2a3090c7', 'Flash', 'hDkYGPQe', 'ranasingh@gmail.com', 'fd65621df5b81ec1f94b62be9c32a3ad442c26f8d058dfe42c182a2102a8d0cf5e0f6a2647c16a2d442d606f2024f93b6a305fe8ce187f60a68f93b6818a1eb5', 'success'),
(58, 24, 'Rana shingh', '1.0', 'e421c3323c6b2a3090c7', 'Flash', 'hDkYGPQe', 'ranasingh@gmail.com', 'fd65621df5b81ec1f94b62be9c32a3ad442c26f8d058dfe42c182a2102a8d0cf5e0f6a2647c16a2d442d606f2024f93b6a305fe8ce187f60a68f93b6818a1eb5', 'success'),
(59, 24, 'Rana shingh', '1.0', 'e421c3323c6b2a3090c7', 'Flash', 'hDkYGPQe', 'ranasingh@gmail.com', 'fd65621df5b81ec1f94b62be9c32a3ad442c26f8d058dfe42c182a2102a8d0cf5e0f6a2647c16a2d442d606f2024f93b6a305fe8ce187f60a68f93b6818a1eb5', 'success'),
(60, 24, 'Rana shingh', '1.0', 'e421c3323c6b2a3090c7', 'Flash', 'hDkYGPQe', 'ranasingh@gmail.com', 'fd65621df5b81ec1f94b62be9c32a3ad442c26f8d058dfe42c182a2102a8d0cf5e0f6a2647c16a2d442d606f2024f93b6a305fe8ce187f60a68f93b6818a1eb5', 'success'),
(61, 24, 'Rana shingh', '1.0', 'e421c3323c6b2a3090c7', 'Flash', 'hDkYGPQe', 'ranasingh@gmail.com', 'fd65621df5b81ec1f94b62be9c32a3ad442c26f8d058dfe42c182a2102a8d0cf5e0f6a2647c16a2d442d606f2024f93b6a305fe8ce187f60a68f93b6818a1eb5', 'success'),
(62, 24, 'Rana shingh', '1.0', 'e421c3323c6b2a3090c7', 'Flash', 'hDkYGPQe', 'ranasingh@gmail.com', 'fd65621df5b81ec1f94b62be9c32a3ad442c26f8d058dfe42c182a2102a8d0cf5e0f6a2647c16a2d442d606f2024f93b6a305fe8ce187f60a68f93b6818a1eb5', 'success'),
(63, 24, 'Rana shingh', '1.0', 'e421c3323c6b2a3090c7', 'Flash', 'hDkYGPQe', 'ranasingh@gmail.com', 'fd65621df5b81ec1f94b62be9c32a3ad442c26f8d058dfe42c182a2102a8d0cf5e0f6a2647c16a2d442d606f2024f93b6a305fe8ce187f60a68f93b6818a1eb5', 'success'),
(64, 24, 'Rana shingh', '1.0', 'e421c3323c6b2a3090c7', 'Flash', 'hDkYGPQe', 'ranasingh@gmail.com', 'fd65621df5b81ec1f94b62be9c32a3ad442c26f8d058dfe42c182a2102a8d0cf5e0f6a2647c16a2d442d606f2024f93b6a305fe8ce187f60a68f93b6818a1eb5', 'success'),
(65, 24, 'Rana shingh', '1.0', 'e421c3323c6b2a3090c7', 'Flash', 'hDkYGPQe', 'ranasingh@gmail.com', 'fd65621df5b81ec1f94b62be9c32a3ad442c26f8d058dfe42c182a2102a8d0cf5e0f6a2647c16a2d442d606f2024f93b6a305fe8ce187f60a68f93b6818a1eb5', 'success'),
(66, 24, 'Rana shingh', '1.0', 'e421c3323c6b2a3090c7', 'Flash', 'hDkYGPQe', 'ranasingh@gmail.com', 'fd65621df5b81ec1f94b62be9c32a3ad442c26f8d058dfe42c182a2102a8d0cf5e0f6a2647c16a2d442d606f2024f93b6a305fe8ce187f60a68f93b6818a1eb5', 'success'),
(67, 24, 'Rana shingh', '1.0', 'e421c3323c6b2a3090c7', 'Flash', 'hDkYGPQe', 'ranasingh@gmail.com', 'fd65621df5b81ec1f94b62be9c32a3ad442c26f8d058dfe42c182a2102a8d0cf5e0f6a2647c16a2d442d606f2024f93b6a305fe8ce187f60a68f93b6818a1eb5', 'success'),
(68, 24, 'Rana shingh', '1.0', 'e421c3323c6b2a3090c7', 'Flash', 'hDkYGPQe', 'ranasingh@gmail.com', 'fd65621df5b81ec1f94b62be9c32a3ad442c26f8d058dfe42c182a2102a8d0cf5e0f6a2647c16a2d442d606f2024f93b6a305fe8ce187f60a68f93b6818a1eb5', 'success'),
(69, 24, 'Rana shingh', '1.0', 'e421c3323c6b2a3090c7', 'Flash', 'hDkYGPQe', 'ranasingh@gmail.com', 'fd65621df5b81ec1f94b62be9c32a3ad442c26f8d058dfe42c182a2102a8d0cf5e0f6a2647c16a2d442d606f2024f93b6a305fe8ce187f60a68f93b6818a1eb5', 'success'),
(70, 24, 'Rana shingh', '1.0', 'e421c3323c6b2a3090c7', 'Flash', 'hDkYGPQe', 'ranasingh@gmail.com', 'fd65621df5b81ec1f94b62be9c32a3ad442c26f8d058dfe42c182a2102a8d0cf5e0f6a2647c16a2d442d606f2024f93b6a305fe8ce187f60a68f93b6818a1eb5', 'success'),
(71, 24, 'Rana shingh', '1.0', 'e421c3323c6b2a3090c7', 'Flash', 'hDkYGPQe', 'ranasingh@gmail.com', 'fd65621df5b81ec1f94b62be9c32a3ad442c26f8d058dfe42c182a2102a8d0cf5e0f6a2647c16a2d442d606f2024f93b6a305fe8ce187f60a68f93b6818a1eb5', 'success'),
(72, 24, 'Rana shingh', '1.0', 'e421c3323c6b2a3090c7', 'Flash', 'hDkYGPQe', 'ranasingh@gmail.com', 'fd65621df5b81ec1f94b62be9c32a3ad442c26f8d058dfe42c182a2102a8d0cf5e0f6a2647c16a2d442d606f2024f93b6a305fe8ce187f60a68f93b6818a1eb5', 'success'),
(73, 24, 'Rana shingh', '1.0', 'e421c3323c6b2a3090c7', 'Flash', 'hDkYGPQe', 'ranasingh@gmail.com', 'fd65621df5b81ec1f94b62be9c32a3ad442c26f8d058dfe42c182a2102a8d0cf5e0f6a2647c16a2d442d606f2024f93b6a305fe8ce187f60a68f93b6818a1eb5', 'success'),
(74, 24, 'Rana shingh', '1.0', 'e421c3323c6b2a3090c7', 'Flash', 'hDkYGPQe', 'ranasingh@gmail.com', 'fd65621df5b81ec1f94b62be9c32a3ad442c26f8d058dfe42c182a2102a8d0cf5e0f6a2647c16a2d442d606f2024f93b6a305fe8ce187f60a68f93b6818a1eb5', 'success'),
(75, 24, 'Rana shingh', '1.0', 'e421c3323c6b2a3090c7', 'Flash', 'hDkYGPQe', 'ranasingh@gmail.com', 'fd65621df5b81ec1f94b62be9c32a3ad442c26f8d058dfe42c182a2102a8d0cf5e0f6a2647c16a2d442d606f2024f93b6a305fe8ce187f60a68f93b6818a1eb5', 'success'),
(76, 24, 'Rana shingh', '1.0', 'e421c3323c6b2a3090c7', 'Flash', 'hDkYGPQe', 'ranasingh@gmail.com', 'fd65621df5b81ec1f94b62be9c32a3ad442c26f8d058dfe42c182a2102a8d0cf5e0f6a2647c16a2d442d606f2024f93b6a305fe8ce187f60a68f93b6818a1eb5', 'success'),
(77, 24, 'Rana shingh', '1.0', 'e421c3323c6b2a3090c7', 'Flash', 'hDkYGPQe', 'ranasingh@gmail.com', 'fd65621df5b81ec1f94b62be9c32a3ad442c26f8d058dfe42c182a2102a8d0cf5e0f6a2647c16a2d442d606f2024f93b6a305fe8ce187f60a68f93b6818a1eb5', 'success'),
(78, 24, 'Rana shingh', '1.0', 'e421c3323c6b2a3090c7', 'Flash', 'hDkYGPQe', 'ranasingh@gmail.com', 'fd65621df5b81ec1f94b62be9c32a3ad442c26f8d058dfe42c182a2102a8d0cf5e0f6a2647c16a2d442d606f2024f93b6a305fe8ce187f60a68f93b6818a1eb5', 'success'),
(79, 24, 'Rana shingh', '1.0', 'e421c3323c6b2a3090c7', 'Flash', 'hDkYGPQe', 'ranasingh@gmail.com', 'fd65621df5b81ec1f94b62be9c32a3ad442c26f8d058dfe42c182a2102a8d0cf5e0f6a2647c16a2d442d606f2024f93b6a305fe8ce187f60a68f93b6818a1eb5', 'success'),
(80, 24, 'Rana shingh', '1.0', 'e421c3323c6b2a3090c7', 'Flash', 'hDkYGPQe', 'ranasingh@gmail.com', 'fd65621df5b81ec1f94b62be9c32a3ad442c26f8d058dfe42c182a2102a8d0cf5e0f6a2647c16a2d442d606f2024f93b6a305fe8ce187f60a68f93b6818a1eb5', 'success'),
(81, 24, 'Rana shingh', '1.0', 'e421c3323c6b2a3090c7', 'Flash', 'hDkYGPQe', 'ranasingh@gmail.com', 'fd65621df5b81ec1f94b62be9c32a3ad442c26f8d058dfe42c182a2102a8d0cf5e0f6a2647c16a2d442d606f2024f93b6a305fe8ce187f60a68f93b6818a1eb5', 'success'),
(82, 24, 'Rana shingh', '1.0', 'e421c3323c6b2a3090c7', 'Flash', 'hDkYGPQe', 'ranasingh@gmail.com', 'fd65621df5b81ec1f94b62be9c32a3ad442c26f8d058dfe42c182a2102a8d0cf5e0f6a2647c16a2d442d606f2024f93b6a305fe8ce187f60a68f93b6818a1eb5', 'success'),
(83, 24, 'Rana shingh', '1.0', 'e421c3323c6b2a3090c7', 'Flash', 'hDkYGPQe', 'ranasingh@gmail.com', 'fd65621df5b81ec1f94b62be9c32a3ad442c26f8d058dfe42c182a2102a8d0cf5e0f6a2647c16a2d442d606f2024f93b6a305fe8ce187f60a68f93b6818a1eb5', 'success'),
(84, 24, 'Rana shingh', '1.0', 'e421c3323c6b2a3090c7', 'Flash', 'hDkYGPQe', 'ranasingh@gmail.com', 'fd65621df5b81ec1f94b62be9c32a3ad442c26f8d058dfe42c182a2102a8d0cf5e0f6a2647c16a2d442d606f2024f93b6a305fe8ce187f60a68f93b6818a1eb5', 'success'),
(85, 24, 'Rana shingh', '1.0', 'e421c3323c6b2a3090c7', 'Flash', 'hDkYGPQe', 'ranasingh@gmail.com', 'fd65621df5b81ec1f94b62be9c32a3ad442c26f8d058dfe42c182a2102a8d0cf5e0f6a2647c16a2d442d606f2024f93b6a305fe8ce187f60a68f93b6818a1eb5', 'success'),
(86, 24, 'Rana shingh', '1.0', 'e421c3323c6b2a3090c7', 'Flash', 'hDkYGPQe', 'ranasingh@gmail.com', 'fd65621df5b81ec1f94b62be9c32a3ad442c26f8d058dfe42c182a2102a8d0cf5e0f6a2647c16a2d442d606f2024f93b6a305fe8ce187f60a68f93b6818a1eb5', 'success'),
(87, 27, 'abc', '1.0', '7bd4697694dcbf88672c', 'Flash', 'hDkYGPQe', 'rupalisatpute289@gmail.com', 'd16b0db1904b394f9c035873b00d8b3b739e0f5c1b01dbbd9bed647ee60e4cec93a74a12d3bb018b58997c6c6eaf7b7a304163e088f0cb3acfc06e6d6e838887', 'success'),
(88, 28, 'Radhey', '1.0', '7d96ebc3ce77e5d3a2c7', 'Flash', 'hDkYGPQe', 'radhaey@gmail.com', '0fa193aa35c6ae3be8162efe8466afd5724a340c112ea1848fc222b54987340a377ff2575315a3d4aa51cc1ea48411ff4bb7ae9de9221d1050545839f3a50741', 'success'),
(89, 28, 'Radhey', '1.0', '7d96ebc3ce77e5d3a2c7', 'Flash', 'hDkYGPQe', 'radhaey@gmail.com', '0fa193aa35c6ae3be8162efe8466afd5724a340c112ea1848fc222b54987340a377ff2575315a3d4aa51cc1ea48411ff4bb7ae9de9221d1050545839f3a50741', 'success'),
(90, 28, 'Radhey', '1.0', '7d96ebc3ce77e5d3a2c7', 'Flash', 'hDkYGPQe', 'radhaey@gmail.com', '0fa193aa35c6ae3be8162efe8466afd5724a340c112ea1848fc222b54987340a377ff2575315a3d4aa51cc1ea48411ff4bb7ae9de9221d1050545839f3a50741', 'success'),
(91, 29, 'chotu', '1.0', '7f6901669d446b544470', 'Flash', 'hDkYGPQe', 'chotu@gmail.com', 'f4c1568a06c9ac7ca29ceb0b1c26bba3435af016d43224886207e581ef71a5cd7f5ba6faceb877cf9b804c7d835393f45b545d8199dfcc6f6349d4c2f9887cdf', 'success'),
(92, 31, 'uygyug', '1.0', '15352c63827a19a75b5d', 'Flash', 'hDkYGPQe', 'hh@gmail.com', '97553d9e9058385cbe0371a577851932b53047228d9ab4d315eabdaf9b3569424014439886e984cdf3d154c737bb54415e2fb58a4c25d91dbb0f8ddbea26e231', 'success'),
(93, 32, 'appa', '1.0', '3f1a9bbabcf98a260c74', 'Flash', 'hDkYGPQe', 'uuyuiuiu@gmail.com', 'c7e9e775a73d39188bddb68b07f69ddebc322912086d739c40049efc553bc43677de72b36c9525eb41ec0c0614cef27fe0eab1fb49130103cdae4f38c8ea9ef9', 'success'),
(94, 33, 'Rupali', '1.0', 'aed392e62df1f9f12715', 'Flash', 'hDkYGPQe', 'rups@gmail.com', '66289a2a1e6c5552c2f987c805a8bb256edc6002cb3b85735fec3c23637c37fdac23605a30204f2c50e7751b74319ead11b2eb223fc34936840d46fc20dd1293', 'success'),
(95, 38, 'klhwqkkqhwd', '1.0', '64da85b2ddbbe2b99756', 'Flash', 'hDkYGPQe', 'msdsa@gmail.com', 'f66f628ffc0504a16b3ee7b4be65c5f14bcceb8730719c33da786b250a74a65edd87d989dd41ba0c6ff6dc089559ed78b2045db836ff860553e13d4dc122b3ea', 'success'),
(96, 38, 'klhwqkkqhwd', '1.0', '64da85b2ddbbe2b99756', 'Flash', 'hDkYGPQe', 'msdsa@gmail.com', 'f66f628ffc0504a16b3ee7b4be65c5f14bcceb8730719c33da786b250a74a65edd87d989dd41ba0c6ff6dc089559ed78b2045db836ff860553e13d4dc122b3ea', 'success'),
(97, 38, 'klhwqkkqhwd', '1.0', '64da85b2ddbbe2b99756', 'Flash', 'hDkYGPQe', 'msdsa@gmail.com', 'f66f628ffc0504a16b3ee7b4be65c5f14bcceb8730719c33da786b250a74a65edd87d989dd41ba0c6ff6dc089559ed78b2045db836ff860553e13d4dc122b3ea', 'success'),
(98, 39, 'RRRRRRRRRRRRRRRRRRRRR', '1.0', 'b83ed2369804199e9624', 'Flash', 'hDkYGPQe', 'yggygygyg@gmail.com', '8306fe1d92b367f2e937f69c67e2a9b21c55e8bf273f8a7e471f6c9c2dab6e01f7f3e1ca0c3a15849d441f60420273c0925c77bb5837328dbc9b6b38b6c9cb4b', 'success'),
(99, 44, 'yugyugyuyu', '1.0', '3566b3f83f035c3c920e', 'Flash', 'hDkYGPQe', 'hbyhbu@yahoo.com', 'd2ed78cf6ef796626672e6f1e446e4e5326b00928958db903e827223245eb51c3bdda6ceab218647d5c8fb6ca15e28add485fdb4dec58e4e955c23f136a1b614', 'success'),
(100, 44, 'yugyugyuyu', '1.0', '3566b3f83f035c3c920e', 'Flash', 'hDkYGPQe', 'hbyhbu@yahoo.com', 'd2ed78cf6ef796626672e6f1e446e4e5326b00928958db903e827223245eb51c3bdda6ceab218647d5c8fb6ca15e28add485fdb4dec58e4e955c23f136a1b614', 'success'),
(101, 45, 'jfdwfsdf', '1.0', '25f28254039af925cbcf', 'Flash', 'hDkYGPQe', 'cvgvdf@yahoo.com', '881a8c204bf837da340c9fb483d458338e8ea96eea281ae5dc9f78cbc94ef60fe9f64cbd622f9f027dcd367cae019f6d6caf3c94f39a4de73bf1cd94bf56b8bd', 'success'),
(102, 45, 'jfdwfsdf', '1.0', '25f28254039af925cbcf', 'Flash', 'hDkYGPQe', 'cvgvdf@yahoo.com', '881a8c204bf837da340c9fb483d458338e8ea96eea281ae5dc9f78cbc94ef60fe9f64cbd622f9f027dcd367cae019f6d6caf3c94f39a4de73bf1cd94bf56b8bd', 'success'),
(103, 45, 'jfdwfsdf', '1.0', '25f28254039af925cbcf', 'Flash', 'hDkYGPQe', 'cvgvdf@yahoo.com', '881a8c204bf837da340c9fb483d458338e8ea96eea281ae5dc9f78cbc94ef60fe9f64cbd622f9f027dcd367cae019f6d6caf3c94f39a4de73bf1cd94bf56b8bd', 'success'),
(104, 45, 'jfdwfsdf', '1.0', '25f28254039af925cbcf', 'Flash', 'hDkYGPQe', 'cvgvdf@yahoo.com', '881a8c204bf837da340c9fb483d458338e8ea96eea281ae5dc9f78cbc94ef60fe9f64cbd622f9f027dcd367cae019f6d6caf3c94f39a4de73bf1cd94bf56b8bd', 'success'),
(105, 45, 'jfdwfsdf', '1.0', '25f28254039af925cbcf', 'Flash', 'hDkYGPQe', 'cvgvdf@yahoo.com', '881a8c204bf837da340c9fb483d458338e8ea96eea281ae5dc9f78cbc94ef60fe9f64cbd622f9f027dcd367cae019f6d6caf3c94f39a4de73bf1cd94bf56b8bd', 'success'),
(106, 45, 'jfdwfsdf', '1.0', '25f28254039af925cbcf', 'Flash', 'hDkYGPQe', 'cvgvdf@yahoo.com', '881a8c204bf837da340c9fb483d458338e8ea96eea281ae5dc9f78cbc94ef60fe9f64cbd622f9f027dcd367cae019f6d6caf3c94f39a4de73bf1cd94bf56b8bd', 'success'),
(107, 45, 'jfdwfsdf', '1.0', '25f28254039af925cbcf', 'Flash', 'hDkYGPQe', 'cvgvdf@yahoo.com', '881a8c204bf837da340c9fb483d458338e8ea96eea281ae5dc9f78cbc94ef60fe9f64cbd622f9f027dcd367cae019f6d6caf3c94f39a4de73bf1cd94bf56b8bd', 'success'),
(108, 45, 'jfdwfsdf', '1.0', '25f28254039af925cbcf', 'Flash', 'hDkYGPQe', 'cvgvdf@yahoo.com', '881a8c204bf837da340c9fb483d458338e8ea96eea281ae5dc9f78cbc94ef60fe9f64cbd622f9f027dcd367cae019f6d6caf3c94f39a4de73bf1cd94bf56b8bd', 'success'),
(109, 46, 'gyuuuuuuuuuuu', '1.0', '723e1059f2eb96532623', 'Flash', 'hDkYGPQe', '888@yahoo.com', '61e0a6bc38c727eb015d1f1a96f6b7ed934da0bc599a1b2917e4b4e66320a8a803f0a0438d0d19c13889edfc4a6803fc9084bb7e281707a5eb9033953c0a0e8c', 'success'),
(110, 48, 'abc', '1.0', '2181b312fa40d7af0588', 'Flash', 'hDkYGPQe', 'sagar@gmail.com', 'f0754391211a278c0ce624aefd72a20787f6358e1947c185957b067c424b1c1062704b0018d0066abe59bfa2eaa8c5bba5bbdc48d9cdfdeee4fbf2bd0bbd87ee', 'success'),
(111, 48, 'abc', '1.0', '2181b312fa40d7af0588', 'Flash', 'hDkYGPQe', 'sagar@gmail.com', 'f0754391211a278c0ce624aefd72a20787f6358e1947c185957b067c424b1c1062704b0018d0066abe59bfa2eaa8c5bba5bbdc48d9cdfdeee4fbf2bd0bbd87ee', 'success'),
(112, 48, 'abc', '1.0', '2181b312fa40d7af0588', 'Flash', 'hDkYGPQe', 'sagar@gmail.com', 'f0754391211a278c0ce624aefd72a20787f6358e1947c185957b067c424b1c1062704b0018d0066abe59bfa2eaa8c5bba5bbdc48d9cdfdeee4fbf2bd0bbd87ee', 'success'),
(113, 48, 'abc', '1.0', '2181b312fa40d7af0588', 'Flash', 'hDkYGPQe', 'sagar@gmail.com', 'f0754391211a278c0ce624aefd72a20787f6358e1947c185957b067c424b1c1062704b0018d0066abe59bfa2eaa8c5bba5bbdc48d9cdfdeee4fbf2bd0bbd87ee', 'success'),
(114, 48, 'abc', '1.0', '2181b312fa40d7af0588', 'Flash', 'hDkYGPQe', 'sagar@gmail.com', 'f0754391211a278c0ce624aefd72a20787f6358e1947c185957b067c424b1c1062704b0018d0066abe59bfa2eaa8c5bba5bbdc48d9cdfdeee4fbf2bd0bbd87ee', 'success'),
(115, 54, 'fgdfg', '1.0', 'efc197758c7ea67b47a1', 'Flash', 'hDkYGPQe', '888@yahoo.com', '1844f68ff3325496acfa88ae760dddf15670651ebb137b3a644238141cf39f26d8f789ca29513a059eb12fbffa518a5ed7a669b7203f4f17393e7594059f8fcf', 'success'),
(116, 54, 'fgdfg', '1.0', 'efc197758c7ea67b47a1', 'Flash', 'hDkYGPQe', '888@yahoo.com', '1844f68ff3325496acfa88ae760dddf15670651ebb137b3a644238141cf39f26d8f789ca29513a059eb12fbffa518a5ed7a669b7203f4f17393e7594059f8fcf', 'success'),
(117, 55, 'Praveen Rajan', '1.0', 'a6a5a341a979baf8d9fc', 'Flash', 'hDkYGPQe', 'praveenraj@gmail.com', '5be77bac9cbeea034dfc67bdf5b257d75189d5233cd89d2e7a9d30dda3e112becf83de3f7586604067f9319a4b09df994c9b2ffa64c31273aea803fb013b095b', 'success'),
(118, 56, 'fdhfdh', '1.0', '0c59b8a68b10ecb66a58', 'Flash', 'hDkYGPQe', 'R@yahoo.com', 'dbccc523fea1cfb9ec6380fd81edcf53bfbf450ec2fe35a830c8337952b765961bcac9061fe3c084b50b3d7a3ceb9702fa290ff285b3b392e4358d58bbe2901c', 'success'),
(119, 56, 'fdhfdh', '1.0', '0c59b8a68b10ecb66a58', 'Flash', 'hDkYGPQe', 'R@yahoo.com', 'dbccc523fea1cfb9ec6380fd81edcf53bfbf450ec2fe35a830c8337952b765961bcac9061fe3c084b50b3d7a3ceb9702fa290ff285b3b392e4358d58bbe2901c', 'success'),
(120, 63, 'gfdgdg', '1.0', '998faabc1a27e139ad16', 'Flash', 'hDkYGPQe', 'rtrt@yahoo.com', 'b63251bc7f542384e5b7f09742a0a1de8547952878950c3632c439f9f5420ff0ed0db0ea6368a13a51850ae28855d867b4717e4e1ca2c8427d24be6c8d043604', 'success'),
(121, 63, 'gfdgdg', '1.0', '998faabc1a27e139ad16', 'Flash', 'hDkYGPQe', 'rtrt@yahoo.com', 'b63251bc7f542384e5b7f09742a0a1de8547952878950c3632c439f9f5420ff0ed0db0ea6368a13a51850ae28855d867b4717e4e1ca2c8427d24be6c8d043604', 'success'),
(122, 63, 'gfdgdg', '1.0', '998faabc1a27e139ad16', 'Flash', 'hDkYGPQe', 'rtrt@yahoo.com', 'b63251bc7f542384e5b7f09742a0a1de8547952878950c3632c439f9f5420ff0ed0db0ea6368a13a51850ae28855d867b4717e4e1ca2c8427d24be6c8d043604', 'success'),
(123, 63, 'gfdgdg', '1.0', '998faabc1a27e139ad16', 'Flash', 'hDkYGPQe', 'rtrt@yahoo.com', 'b63251bc7f542384e5b7f09742a0a1de8547952878950c3632c439f9f5420ff0ed0db0ea6368a13a51850ae28855d867b4717e4e1ca2c8427d24be6c8d043604', 'success'),
(124, 63, 'gfdgdg', '1.0', '998faabc1a27e139ad16', 'Flash', 'hDkYGPQe', 'rtrt@yahoo.com', 'b63251bc7f542384e5b7f09742a0a1de8547952878950c3632c439f9f5420ff0ed0db0ea6368a13a51850ae28855d867b4717e4e1ca2c8427d24be6c8d043604', 'success'),
(125, 77, 'dfsdfds', '1.0', 'a64f46a45bd27b670d44', 'Flash', 'hDkYGPQe', 'vcc@yahoo.com', '3fa49163431ae715594f1473519ba52ec4c90ce1a12d932a761083c08c6ea229ad3ac1408461aea0c927a6e8767b372ebe41bdb8cdc7d4003f1490a51f517db0', 'success'),
(126, 78, 'ewtwt', '1.0', '58c5c14f1b7677c3feb5', 'Flash', 'hDkYGPQe', 'fdsfs@yahoo.com', '5613cf5fc4733e839ceb43c8f975e7f07b1cbe8cf0d19dabc4d667d077a79d9b0aa88891f33620f11f53e46000a5d1fdf2914c69fef173828d382d25652e0b57', 'success'),
(127, 80, 'anil', '1.0', 'c421eb3efbc49e9ecb01', 'Flash', 'hDkYGPQe', 'anilkkkkkk@gmail.com', 'f0a5db53237323d478fcf92f0483699e29703563ee559ad24db0b87b7e2831b6a03a997f38d138768146a1814c8b309f814a86f88487664bcd61c6675d9eb99d', 'success'),
(128, 81, 'anil', '1.0', '7bbb461a6db11967e071', 'Flash', 'hDkYGPQe', 'anikkk@gnmail.com', 'df394cc95e1525296ccfbfe4da5a3adf8da606595a9b01fac3faf402ad849e8ed86c773b24b26e6b60e5d83c302f6932fbad993c1e3f1733e4500d7dbc956acd', 'success'),
(129, 82, 'ANil', '1.0', 'b94d9312c0402b32559d', 'Flash', 'hDkYGPQe', 'anillll@gmail.com', '0bc9b0ef18368f103a646e5cd2fb7ee34e3bcbeaecab9c61cfeafd7649a575e6198500d14bacb6105766587e958f6c62bd709bbd11be03f417e12da2c68924df', 'success'),
(130, 82, 'ANil', '1.0', 'b94d9312c0402b32559d', 'Flash', 'hDkYGPQe', 'anillll@gmail.com', '0bc9b0ef18368f103a646e5cd2fb7ee34e3bcbeaecab9c61cfeafd7649a575e6198500d14bacb6105766587e958f6c62bd709bbd11be03f417e12da2c68924df', 'success'),
(131, 82, 'Raj', '1.0', '8940a13344a4b2321e64', 'Flash', 'hDkYGPQe', 'raj@gmail.com', '1abf6897cdf662a5b0005c17f1f806ae0cc69a9f0162cee3298bed1f7f89b062c60a573834a5428622136d69f1416940724da1f23491d9a0acd80cbff623127c', 'success'),
(132, 89, 'Bablu', '1.0', '6eb9b8a6e878b378592d', 'Flash', 'hDkYGPQe', 'bablu@gmail.com', 'c38f030dbe11074cd030c3778e7574283c13bc7739d8b68919f0ffaf3619a87be375fe9999e26b2498bdc81a45947d9ecf9bb0f21d186f3997ce59d19fed838b', 'success'),
(133, 96, 'Raman', '1.0', '49aaf3c95c33ed23d28b', 'Flash', 'hDkYGPQe', 'ramana@yahoo.com', '8eb87a1f7740f424fbe3f122dccee3edafdc1ad9fa4bf80ad9f16a288862f9a2d3044e7d6a59e6ec13697d699581ca837ff0f308fee10973c1930bcb8ac7bcf8', 'success'),
(134, 97, 'Manikchand', '1.0', 'e65a06a3858a8f3a41c8', 'Flash', 'hDkYGPQe', 'manikchand@gmail.com', '742aa368f905d3959e9dc0cbfc72e5a11836388019b358099d71568c81879b35b0b19aa6e65f51466822bddf8bc93a2b02c9c59989d088d68341b1154b0aff14', 'success'),
(135, 97, 'Manikchand', '1.0', 'e65a06a3858a8f3a41c8', 'Flash', 'hDkYGPQe', 'manikchand@gmail.com', '742aa368f905d3959e9dc0cbfc72e5a11836388019b358099d71568c81879b35b0b19aa6e65f51466822bddf8bc93a2b02c9c59989d088d68341b1154b0aff14', 'success'),
(136, 97, 'Manikchand', '1.0', 'e65a06a3858a8f3a41c8', 'Flash', 'hDkYGPQe', 'manikchand@gmail.com', '742aa368f905d3959e9dc0cbfc72e5a11836388019b358099d71568c81879b35b0b19aa6e65f51466822bddf8bc93a2b02c9c59989d088d68341b1154b0aff14', 'success'),
(137, 97, 'Manikchand', '1.0', 'e65a06a3858a8f3a41c8', 'Flash', 'hDkYGPQe', 'manikchand@gmail.com', '742aa368f905d3959e9dc0cbfc72e5a11836388019b358099d71568c81879b35b0b19aa6e65f51466822bddf8bc93a2b02c9c59989d088d68341b1154b0aff14', 'success'),
(138, 97, 'Manikchand', '1.0', 'e65a06a3858a8f3a41c8', 'Flash', 'hDkYGPQe', 'manikchand@gmail.com', '742aa368f905d3959e9dc0cbfc72e5a11836388019b358099d71568c81879b35b0b19aa6e65f51466822bddf8bc93a2b02c9c59989d088d68341b1154b0aff14', 'success'),
(139, 97, 'Manikchand', '1.0', 'e65a06a3858a8f3a41c8', 'Flash', 'hDkYGPQe', 'manikchand@gmail.com', '742aa368f905d3959e9dc0cbfc72e5a11836388019b358099d71568c81879b35b0b19aa6e65f51466822bddf8bc93a2b02c9c59989d088d68341b1154b0aff14', 'success'),
(140, 97, 'Manikchand', '1.0', 'e65a06a3858a8f3a41c8', 'Flash', 'hDkYGPQe', 'manikchand@gmail.com', '742aa368f905d3959e9dc0cbfc72e5a11836388019b358099d71568c81879b35b0b19aa6e65f51466822bddf8bc93a2b02c9c59989d088d68341b1154b0aff14', 'success'),
(141, 97, 'Manikchand', '1.0', 'e65a06a3858a8f3a41c8', 'Flash', 'hDkYGPQe', 'manikchand@gmail.com', '742aa368f905d3959e9dc0cbfc72e5a11836388019b358099d71568c81879b35b0b19aa6e65f51466822bddf8bc93a2b02c9c59989d088d68341b1154b0aff14', 'success'),
(142, 97, 'Manikchand', '1.0', 'e65a06a3858a8f3a41c8', 'Flash', 'hDkYGPQe', 'manikchand@gmail.com', '742aa368f905d3959e9dc0cbfc72e5a11836388019b358099d71568c81879b35b0b19aa6e65f51466822bddf8bc93a2b02c9c59989d088d68341b1154b0aff14', 'success'),
(143, 97, 'Manikchand', '1.0', 'e65a06a3858a8f3a41c8', 'Flash', 'hDkYGPQe', 'manikchand@gmail.com', '742aa368f905d3959e9dc0cbfc72e5a11836388019b358099d71568c81879b35b0b19aa6e65f51466822bddf8bc93a2b02c9c59989d088d68341b1154b0aff14', 'success'),
(144, 100, 'anil', '1.0', '7eb485518b0a53dc6c7c', 'Flash', 'ppXw25Oc', 'ashishrathi_13@yahoo.co.in', 'f1fee3c145269e122df7a2b574d55c90f63ce4767660686a7724165ed1eb1d5f81dd25c40dd1c0fab2343914cfa96f9bb86e3610f14076b9f48eb1785580c014', 'success'),
(145, 100, 'anil', '1.0', '7eb485518b0a53dc6c7c', 'Flash', 'ppXw25Oc', 'ashishrathi_13@yahoo.co.in', 'f1fee3c145269e122df7a2b574d55c90f63ce4767660686a7724165ed1eb1d5f81dd25c40dd1c0fab2343914cfa96f9bb86e3610f14076b9f48eb1785580c014', 'success'),
(146, 101, 'abC', '1.0', '5b6f13360b3c310387bf', 'Flash', 'ppXw25Oc', 'BUYYUB@GMAIL.COM', 'e4e9e46148335c2d822a2a805d9b6b3177c88b932947ac0818fa27d37964de0d6aff0d6b99c029472914152f09275cd88457a6f5f2505d87c6bf5939a2274d3f', 'failure'),
(147, 100, 'anil', '1.0', '7eb485518b0a53dc6c7c', 'Flash', 'ppXw25Oc', 'ashishrathi_13@yahoo.co.in', 'f1fee3c145269e122df7a2b574d55c90f63ce4767660686a7724165ed1eb1d5f81dd25c40dd1c0fab2343914cfa96f9bb86e3610f14076b9f48eb1785580c014', 'success'),
(148, 100, 'anil', '1.0', '7eb485518b0a53dc6c7c', 'Flash', 'ppXw25Oc', 'ashishrathi_13@yahoo.co.in', 'f1fee3c145269e122df7a2b574d55c90f63ce4767660686a7724165ed1eb1d5f81dd25c40dd1c0fab2343914cfa96f9bb86e3610f14076b9f48eb1785580c014', 'success'),
(149, 100, 'anil', '1.0', '7eb485518b0a53dc6c7c', 'Flash', 'ppXw25Oc', 'ashishrathi_13@yahoo.co.in', 'f1fee3c145269e122df7a2b574d55c90f63ce4767660686a7724165ed1eb1d5f81dd25c40dd1c0fab2343914cfa96f9bb86e3610f14076b9f48eb1785580c014', 'success'),
(150, 100, 'anil', '1.0', '7eb485518b0a53dc6c7c', 'Flash', 'ppXw25Oc', 'ashishrathi_13@yahoo.co.in', 'f1fee3c145269e122df7a2b574d55c90f63ce4767660686a7724165ed1eb1d5f81dd25c40dd1c0fab2343914cfa96f9bb86e3610f14076b9f48eb1785580c014', 'success'),
(151, 102, 'dffsf', '1.0', 'fcccad14fcf2a9102fa0', 'Flash', 'fB7m8s', 'hgjuhgjg@gmail.com', 'cab03e9c51c7df629d7a06022765e0c8be11e46e2114e301f0f7593d76a702d5cd5178da6180601a54c0a03a6c750d978e6f33f10a0d1e3933e38318e082f4f7', 'failure'),
(152, 127, 'Akk', '1.0', '8cda93cc2128f088aeeb', 'Flash', 'hDkYGPQe', 'avkharche11@gmail.com', 'd51f3a4d3796e2b541448b9f12b1909208579d04c7f95b4e3072a279716a520cd090c5af259616d6d5452672b6d39e37bee4713b151ed21950b54fbf71de94f2', 'success'),
(153, 127, 'Akk', '1.0', '8cda93cc2128f088aeeb', 'Flash', 'hDkYGPQe', 'avkharche11@gmail.com', 'd51f3a4d3796e2b541448b9f12b1909208579d04c7f95b4e3072a279716a520cd090c5af259616d6d5452672b6d39e37bee4713b151ed21950b54fbf71de94f2', 'success'),
(154, 127, 'Akk', '1.0', '8cda93cc2128f088aeeb', 'Flash', 'hDkYGPQe', 'avkharche11@gmail.com', 'd51f3a4d3796e2b541448b9f12b1909208579d04c7f95b4e3072a279716a520cd090c5af259616d6d5452672b6d39e37bee4713b151ed21950b54fbf71de94f2', 'success'),
(155, 137, 'Manav', '1.0', '7c900a6bbb6975710172', 'Flash', 'hDkYGPQe', 'mandlik@yahoo.com', 'fcc3ace4d05efd0674452d5b14d03633611b7dac8a8892784e62d85cd269f6eac34345920e1276ce66ff6398dc7321d5eb60e6c5b923e5cc813fed0d9e82d501', 'failure'),
(156, 143, 'segsdgs', '1.0', '6c9adca360360c2f67bc', 'Flash', 'hDkYGPQe', '9@gmail.com', 'dec5cd924656b782c75b4e15bd621125a100b726ac5a51d142fc77ccc54fd7f1387d852ffbb5d959f3b39cf2174072b61220816a4583fa4db09b7033b249c8b0', 'success'),
(157, 147, 'vdfg', '1.0', '7710bd5e89ff9ffea72c', 'Flash', 'hDkYGPQe', 'kjhjkhjkhj@jkhjk.ccc', 'dde44b6aff78300ca89d4a4b5ccdadb78d913a2203bb924f9ccd039dd18d4153577c4e714d5f070826611504fdcf6a826c427a3451c3e9465272263b24a09342', 'success'),
(158, 147, 'vdfg', '1.0', '7710bd5e89ff9ffea72c', 'Flash', 'hDkYGPQe', 'kjhjkhjkhj@jkhjk.ccc', 'dde44b6aff78300ca89d4a4b5ccdadb78d913a2203bb924f9ccd039dd18d4153577c4e714d5f070826611504fdcf6a826c427a3451c3e9465272263b24a09342', 'success'),
(159, 148, 'fcvbxcvbvcvb', '1.0', 'f5ffb273b6a10d782e16', 'Flash', 'hDkYGPQe', 'manjupraveen6689@gmail.com', '1fb69534c554ea9b3efe76e941c8872298077ec1e59d9d6cf5e727d095eb4f6b4f02efb8a37b278e9abf14f4cfe45b553be1aaf8b3bb1f8876b80f32f93517c2', 'success'),
(160, 149, 'anil', '1.0', 'f35d1c1cd349dc49e1aa', 'Flash', 'hDkYGPQe', 'avkharche11@gmail.com', 'bcc3d7e56fb28187323a09801049cfd93a1f52d9ca1932b30ecb3e3730a23cf566034adc2ef08d6c81cb12ad331200db675460112c285c237a08e2e27d2f085f', 'success'),
(161, 10, 'vijay khatal', '1.0', '13c5e98c9710bc00917b', 'Flash', 'hDkYGPQe', 'manjupraveen6689@gmail.com', '6cf3814b43547663970a65a61e4af651b55b8984a5d25c7107b86d013ecaeadc3f28d7525785047c42e837babd52f1c86dd1b47cb7b3e302b0b97a6e6197a29b', 'success');

-- --------------------------------------------------------

--
-- Table structure for table `sb_paraent_course`
--

CREATE TABLE IF NOT EXISTS `sb_paraent_course` (
  `course_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_name` varchar(200) NOT NULL,
  `status_id` int(11) NOT NULL,
  PRIMARY KEY (`course_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `sb_paraent_course`
--

INSERT INTO `sb_paraent_course` (`course_id`, `course_name`, `status_id`) VALUES
(1, 'Business & Management Studies', 1),
(2, 'Engineering', 1),
(3, 'Design', 1),
(4, 'Hospitality & Travel', 1),
(5, 'Law', 1),
(6, 'Animation', 1),
(7, 'Mass Communication & Media', 1),
(8, 'IT & Software', 1),
(9, 'Humanities & Social Sciences', 1),
(10, 'Arts ( Fine / Visual / Performing )', 1),
(11, 'Science', 1),
(12, 'Architecture & Planning', 1),
(13, 'Accounting & Commerce', 1),
(14, 'Banking, Finance & Insurance', 1),
(15, 'Aviation', 1),
(16, 'Teaching & Education', 1),
(17, 'Nursing', 1),
(18, 'Medicine & Health Sciences', 1),
(19, 'Beauty & Fitness', 1),
(20, 'Environmental Studies', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sb_phd_registration`
--

CREATE TABLE IF NOT EXISTS `sb_phd_registration` (
  `sb_php_id` int(11) NOT NULL AUTO_INCREMENT,
  `sb_user_id` int(11) NOT NULL,
  `photo` varchar(200) NOT NULL,
  `firstName` varchar(500) NOT NULL,
  `lastName` varchar(500) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `department` varchar(200) NOT NULL,
  `college` varchar(500) NOT NULL,
  `birthDate` date NOT NULL,
  `mobile_no` int(11) NOT NULL,
  `radio` varchar(30) NOT NULL,
  `desg` varchar(200) NOT NULL,
  `org` varchar(500) NOT NULL,
  `sub_exp` varchar(200) NOT NULL,
  `fav_topics` varchar(500) NOT NULL,
  `notify_status` int(11) NOT NULL,
  PRIMARY KEY (`sb_php_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `sb_phd_registration`
--

INSERT INTO `sb_phd_registration` (`sb_php_id`, `sb_user_id`, `photo`, `firstName`, `lastName`, `email`, `password`, `department`, `college`, `birthDate`, `mobile_no`, `radio`, `desg`, `org`, `sub_exp`, `fav_topics`, `notify_status`) VALUES
(1, 68, '0', 'hgm', 'ghmgm', 'a@yahoo.com', '5656', '18', 'hjhgjg', '5555-07-07', 2147483647, 'Female', 'MMM', 'kk', 'ghjhgjg', 'jghjhgjghj', 0),
(2, 69, '0', 'hgm', 'ghmgm', 'a@yahoo.com', '5656', '18', 'hjhgjg', '5555-07-07', 2147483647, 'Female', 'MMM', 'kk', 'ghjhgjg', 'jghjhgjghj', 0),
(3, 70, '0', 'bvnbvnv', 'vbnvbn', 'admin@bladephp.co', '456789', '17', 'ghjghjghj', '2120-12-10', 2147483647, 'Female', 'hgjghjghj', 'gjhghj', 'gjh', 'ghj', 0),
(4, 72, 'uploads/profile/Koala.jpg', 'jklljkl', 'jkljkl', 'a@yahoo.com', '8888', '18', 'kjljl', '1022-02-10', 2147483647, 'Female', 'kjkjljl', 'jkljkl', 'jkljkl', 'jkljl', 0),
(5, 75, 'uploads/profile/Hydrangeas.jpg', 'rupa', 'Nikam', 'rupa@gmail.com', '11111', '8', 'Abhinav', '2041-02-10', 2147483647, 'Female', 'MMM', 'mmm', 'Maths', 'MAths', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sb_postview`
--

CREATE TABLE IF NOT EXISTS `sb_postview` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT,
  `sb_user_id` int(11) NOT NULL,
  `postText` varchar(500) NOT NULL,
  `like_post` int(11) NOT NULL,
  `comment` varchar(200) NOT NULL,
  PRIMARY KEY (`post_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=67 ;

--
-- Dumping data for table `sb_postview`
--

INSERT INTO `sb_postview` (`post_id`, `sb_user_id`, `postText`, `like_post`, `comment`) VALUES
(1, 0, 'hgfhfhfhg', 0, ''),
(2, 0, 'hgfhfhfhg', 0, ''),
(3, 0, 'hghgghg', 0, ''),
(4, 0, 'hello', 0, ''),
(5, 0, 'hello', 0, ''),
(6, 0, 'hello', 0, ''),
(7, 0, 'hiiiii', 0, ''),
(8, 0, 'hiiiii', 0, ''),
(9, 0, 'radha', 0, ''),
(10, 0, 'radha', 0, ''),
(11, 0, 'radha', 0, ''),
(12, 0, 'radha', 0, ''),
(13, 0, 'radha', 0, ''),
(14, 0, 'radha', 0, ''),
(15, 0, 'radha', 0, ''),
(16, 0, 'radha', 0, ''),
(17, 0, 'radha', 0, ''),
(18, 0, 'fgdgdfg', 0, ''),
(19, 0, 'fgdgdfg', 0, ''),
(20, 0, 'radha', 0, ''),
(21, 0, '', 0, 'hhgjghjghj'),
(22, 0, '', 0, 'bnmbmbnm'),
(23, 0, '', 0, 'bnmbmbnm'),
(24, 0, '', 0, 'bnmbmbnm'),
(25, 0, '', 0, 'bnmbmbmbnm'),
(26, 0, '', 0, 'bnmbmbmbnm'),
(27, 0, '', 0, 'bnmbmbmbnm'),
(28, 0, '', 0, 'bnmbmbmbnm'),
(29, 0, '', 0, 'bnmbmbmbnm'),
(30, 0, '', 0, 'bnmbmbmbnm56'),
(31, 0, '', 0, 'bnmbmbmbnm56'),
(32, 0, '', 0, 'bnmbmbmbnm56'),
(33, 0, '', 0, 'bnmbmbmbnm56'),
(34, 0, '', 0, 'bnmbmbmbnm56'),
(35, 0, '', 0, 'bnmbmbmbnm56'),
(36, 0, '', 0, 'bnmbmbmbnm56'),
(37, 0, '', 0, 'bnmbmbmbnm56'),
(38, 0, '', 0, 'bnmbmbmbnm56'),
(39, 0, '', 0, 'bnmbmbmbnm56'),
(40, 0, '', 0, 'bnmbmbmbnm56'),
(41, 0, '', 0, 'trtrrty'),
(42, 0, '', 0, 'trtrrtytryrty'),
(43, 0, '', 0, 'trtrrtytryrty'),
(44, 0, '', 0, 'trtrrtytryrty'),
(45, 0, '', 0, 'trtrrtytryrty'),
(46, 0, '', 0, 'trtrrtytryrty'),
(47, 0, '', 0, 'trtrrtytryrty'),
(48, 0, '', 0, 'trtrrtytryrty'),
(49, 0, '', 0, 'fhfhfh'),
(50, 0, '', 0, '1212121'),
(51, 0, '', 0, 'jhkhjkhk'),
(52, 0, '', 0, 'jhkhjkhkjhkhjkhjk'),
(53, 0, '', 0, 'hjlhlhjl'),
(54, 0, '', 0, 'hjlhlhjlhjhjl'),
(55, 0, '', 0, 'jhkhjkhjk'),
(56, 0, '', 0, 'jhkhjkhjkjhkhjk'),
(57, 0, '', 0, 'hgjghj'),
(58, 0, '', 0, 'jhkjhkhjk'),
(59, 0, '', 0, 'jhkjhkhjkyyyyy'),
(60, 0, '', 0, 'jhkjhkhjkyyyyy'),
(61, 0, '', 0, 'jhkjhkhjkyyyyygfhfh'),
(62, 0, '', 0, 'jhkjhkhjkyyyyygfhfh'),
(63, 0, '', 0, 'jhkjhkhjkyyyyygfhfhgfhfh'),
(64, 0, '', 0, 'jhkjhkhjkyyyyygfhfhgfhfh'),
(65, 0, '', 0, 'jhkjhkhjkyyyyygfhfhgfhfhhjhgj'),
(66, 0, '', 0, 'jhkjhkhjkyyyyygfhfhgfhfhhjhgj1212');

-- --------------------------------------------------------

--
-- Table structure for table `sb_role`
--

CREATE TABLE IF NOT EXISTS `sb_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(500) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `sb_role`
--

INSERT INTO `sb_role` (`role_id`, `role_name`) VALUES
(1, 'Admin'),
(2, 'Student'),
(3, 'Lecturer'),
(4, 'Customer'),
(5, 'Network'),
(6, 'Employer'),
(7, 'Phd');

-- --------------------------------------------------------

--
-- Table structure for table `sb_status`
--

CREATE TABLE IF NOT EXISTS `sb_status` (
  `status_id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(500) NOT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `sb_status`
--

INSERT INTO `sb_status` (`status_id`, `status`) VALUES
(0, 'Inactive'),
(1, 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `sb_stud_reg`
--

CREATE TABLE IF NOT EXISTS `sb_stud_reg` (
  `sb_stud_id` int(11) NOT NULL AUTO_INCREMENT,
  `sb_user_id` int(11) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `firstName` varchar(100) NOT NULL,
  `lastName` varchar(100) NOT NULL,
  `fullName` varchar(200) NOT NULL,
  `pursuing` varchar(50) NOT NULL,
  `year` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `cnf_password` varchar(50) NOT NULL,
  `department` varchar(100) NOT NULL,
  `college` varchar(500) NOT NULL,
  `college_loc` varchar(100) NOT NULL,
  `birthDate` date NOT NULL,
  `mobile_no` varchar(50) NOT NULL,
  `notify_status` int(11) NOT NULL,
  PRIMARY KEY (`sb_stud_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `sb_stud_reg`
--

INSERT INTO `sb_stud_reg` (`sb_stud_id`, `sb_user_id`, `photo`, `firstName`, `lastName`, `fullName`, `pursuing`, `year`, `email`, `password`, `cnf_password`, `department`, `college`, `college_loc`, `birthDate`, `mobile_no`, `notify_status`) VALUES
(7, 49, '', 'anil1', 'Kharche', 'anilKharche', 'ME1', '2018', 'a@yahoo.com', '123456', '123456', '-----Select------', 'Chinchwad', 'Pune, Maharashtra, India', '1994-03-10', '8855555555', 0),
(8, 50, '', 'Manjusha ', 'Praveen', 'ManjushaPraveen', 'MCM', '2018', 'manjushapraveen31@gmail.com', '123456', '123456', '12', 'Allana Institute Of Management Sciences', 'Maharashtra, India', '1989-07-18', '9556654212', 1),
(9, 51, '', 'Prejisha ', 'Anil', 'PrejishaAnil ', 'cvcxv', '2018', 'p@yahoo.com', '123456', '123456', '11', 'D.Y.Patil', 'Pune, Maharashtra, India', '1988-01-19', '9822538847', 1),
(10, 52, '', 'Rupali', 'Satpute', 'RupaliSatpute', 'B.E', '2017', 'rups@gmail.com', '123456', '123456', '16', 'D.Y.Patil', 'Hyderabad, Telangana, India', '1980-05-18', '9822538847', 1),
(11, 53, '', 'Rupali', 'Satpute', 'RupaliSatpute', 'B.E', '2017', 'rups@gmail.com', '', '', '16', 'D.Y.Patil', '', '1980-05-18', '9822538847', 1),
(12, 54, '', 'Praneeta', 'Mukherji', 'PraneetaMukherji', 'cvcxv', '2000', 'manjushapraveen31@gmail.com', '123456', '123456', '17', 'D.Y.Patil', 'Pune, Maharashtra, India', '1989-06-06', '9822538847', 0),
(13, 55, '', 'sdaS', 'AsA', 'sdaSAsA', 'AsA', 'AsA', 'r@yahoo.com', '123', '123', '18', 'AsaS', 'asA', '2016-01-30', '9823042381', 0),
(14, 56, '', 'rupali', 'Satpute', 'rupaliSatpute', 'ME', '2018', '1a@yahoo.com', '111', '111', '8', 'AES', 'Mumbai, Maharashtra, India', '1230-11-11', '982304256', 0),
(15, 60, 'uploads/profile/p2.png', 'rupali12', 'Satpute', 'rupaliSatpute', 'ME', '2018', 'gaju@yahoo.com', 'rrr', 'rrr', '-----Select------', 'AES', 'Maharashtra, India', '2014-02-10', '9823042381', 0),
(16, 65, '', 'mbnm', 'bnmbnm', 'mbnmbnmbnm', 'mbnmbnm', 'nmbnmbnm', 'r@yahoo.com', 'mmm', 'mmm', '18', 'bnm', 'Mumbai, Maharashtra, India', '2144-01-10', '9823042381', 0),
(17, 73, 'uploads/profile/Tulips.jpg', 'rrr', 'rrr', 'rrrrrr', 'rr', '2015', 'rr@yahoo.com', '123456', '123456', '8', 'hhhhh', 'Pune, Maharashtra, India', '2014-02-10', '9822538848', 0),
(18, 6, '', 'Manjusha', 'Praveen', 'ManjushaPraveen', 'MCM', '2011', 'manjushapraveen31@gmail.com', '123456', '123456', '16', 'Allana Institute Of Management Sciences', 'Pune, Maharashtra, India', '1989-06-06', '9604556639', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sb_testimonial`
--

CREATE TABLE IF NOT EXISTS `sb_testimonial` (
  `testimonial_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `designation` varchar(100) NOT NULL,
  `profile_img` varchar(500) NOT NULL,
  `message` text NOT NULL,
  `date` datetime NOT NULL,
  `status_id` int(11) NOT NULL,
  PRIMARY KEY (`testimonial_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `sb_testimonial`
--

INSERT INTO `sb_testimonial` (`testimonial_id`, `name`, `designation`, `profile_img`, `message`, `date`, `status_id`) VALUES
(2, 'Anil', 'PHP Developer', 'public/testimonial/Chrysanthemum.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis mauris ex, gravida ut leo eu, rhoncus porta orci. Fusce vitae rutrum nulla.', '2018-07-11 16:54:30', 1),
(3, 'Ashish Rathi', 'Partner', 'public/testimonial/hat.png', 'Symbiol Mobitech LLP , India is an innovation and incubation centre focussed on nurturing ideas that have potential impact on Indian economy.', '2018-07-11 16:58:59', 1),
(4, 'Parin Parekh', 'Partner', 'public/testimonial/login.jpg', 'For creating high velocity organisations , delivering extra-ordinary quality results , we have backed ourselves with Next knowledge in various fields .', '2018-07-11 16:59:49', 1),
(5, 'Manoj Bakshi', 'Partner', 'public/testimonial/login.jpg', 'For creating high velocity organisations , delivering extra-ordinary quality results , we have backed ourselves with Next knowledge in various fields .', '2018-07-11 17:00:19', 1),
(6, 'Manjusha', 'Employee', 'public/testimonial/p2.png', 'very goood', '2018-07-11 17:00:56', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sb_upload`
--

CREATE TABLE IF NOT EXISTS `sb_upload` (
  `up_id` int(11) NOT NULL AUTO_INCREMENT,
  `sb_user_id` int(11) NOT NULL,
  `video_Name` varchar(200) NOT NULL,
  `description` varchar(500) NOT NULL,
  `img_img` varchar(200) DEFAULT NULL,
  `img_pdf` varchar(500) DEFAULT NULL,
  `img_video` varchar(700) DEFAULT NULL,
  `status_id` int(11) NOT NULL,
  `captcha` varchar(200) NOT NULL,
  `reviews` varchar(200) NOT NULL,
  `rating` int(11) NOT NULL,
  `comment` varchar(500) NOT NULL,
  PRIMARY KEY (`up_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=52 ;

--
-- Dumping data for table `sb_upload`
--

INSERT INTO `sb_upload` (`up_id`, `sb_user_id`, `video_Name`, `description`, `img_img`, `img_pdf`, `img_video`, `status_id`, `captcha`, `reviews`, `rating`, `comment`) VALUES
(31, 49, 'fghfgh', 'fghgfhgfhfghfghfgh', NULL, 'public/img/tatdocomo.pdf', NULL, 1, 'sOWh8M2D', '52', 2, ''),
(33, 49, 'nvbnbv', 'nvbnb', 'public/img/jquery.png', NULL, NULL, 1, 'bvnvbnvbnvbnvbn', '5', 4, ''),
(35, 49, 'gfhf', 'ghfhfghfh', 'public/img/p2.png', NULL, NULL, 1, 'b9Ra73AQ', '8', 2, ''),
(36, 49, 'uyiyui', 'yuiyuiyui', 'public/img/login1.jpg', NULL, NULL, 1, 'geLHrfjA', '9', 4, ''),
(38, 49, 'ppt', 'ppt', NULL, 'public/img/wheel.pptx', NULL, 1, '8ytE8N4A', '114', 3, 'hello'),
(39, 49, 'oipiop', 'ipoipiop', NULL, NULL, 'public/img/opening_page_LOADXONE2.mp4', 1, 'diaTroAI', '22', 2, ''),
(41, 49, 'CCC', 'CCCC', 'public/img/jquery1.png', NULL, NULL, 1, 'SBMBphed', '3', 2, ''),
(42, 49, 'fvdv', 'dfv', 'public/img/Chrysanthemum.jpg', NULL, NULL, 1, '2sB26KUg', '10', 2, ''),
(43, 49, 'dfgdf', 'gdfgdfg', NULL, NULL, 'public/img/opening_page_LOADXONE3.mp4', 1, 'F10H3mHa', '32', 3, ''),
(44, 49, 'fghfg', 'hfghfgh', NULL, NULL, 'public/img/opening_page_LOADXONE4.mp4', 1, 'Y4G6biC8', '21', 4, ''),
(45, 49, 'vbnvbn', 'bvnvbn', NULL, NULL, 'public/img/opening_page_LOADXONE5.mp4', 1, 'TDERtfvt', '10', 4, ''),
(46, 49, 'jkljk', 'lkljjkl', NULL, 'public/img/TataDocomo11.pdf', NULL, 1, 'Yci2iUso', '70', 3, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'),
(47, 49, 'RRR', 'RRR', 'public/img/jquery2.png', NULL, NULL, 0, 'ScXtEdBf', '', 0, ''),
(48, 49, 'Demo', 'Ads', NULL, NULL, 'public/img/small.mp4', 0, '4SrCdmbI', '', 0, ''),
(49, 62, 'Demo', 'AAA', 'public/img/Koala.jpg', NULL, NULL, 0, 'VYe5Y2XR', '', 0, ''),
(50, 6, 'General', 'dfddfg', 'public/img/ad-11.png', NULL, NULL, 0, 'FE89ykiZ', '', 0, ''),
(51, 6, 'Video', 'edwerwre', NULL, NULL, 'public/img/Chrysanthemum1.jpg', 0, 'zsGCbAiM', '', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `sb_users`
--

CREATE TABLE IF NOT EXISTS `sb_users` (
  `sb_user_id` int(11) NOT NULL AUTO_INCREMENT,
  `sb_user_name` varchar(100) NOT NULL,
  `sb_user_password` varchar(500) NOT NULL,
  `sb_user_pwd` varchar(100) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `surname` varchar(100) NOT NULL,
  `mob` varchar(10) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `reg_date` datetime NOT NULL,
  `active_date` datetime NOT NULL,
  `sb_user_type` varchar(100) NOT NULL,
  `role_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `chat_role` tinyint(1) NOT NULL,
  `is_logged_in` tinyint(1) NOT NULL,
  `last_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`sb_user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `sb_users`
--

INSERT INTO `sb_users` (`sb_user_id`, `sb_user_name`, `sb_user_password`, `sb_user_pwd`, `firstname`, `surname`, `mob`, `gender`, `reg_date`, `active_date`, `sb_user_type`, `role_id`, `status_id`, `chat_role`, `is_logged_in`, `last_login`) VALUES
(1, 'r@yahoo.com', 'e10adc3949ba59abbe56e057f20f883e', '123456', '', '', '', '', '2018-08-14 13:32:18', '0000-00-00 00:00:00', 'Lecturer', 3, 1, 1, 1, '2018-08-15 18:30:00'),
(2, 'avkharche11@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'Anil', 'Kharche', '9960809335', 'Male', '2018-08-14 14:34:15', '0000-00-00 00:00:00', '', 0, 1, 0, 0, '2018-08-14 09:15:58'),
(5, 'rupalisatpute289@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '123456', 'Rupali', 'Satpute', '9960809335', 'Female', '2018-08-14 14:49:32', '0000-00-00 00:00:00', '', 0, 1, 0, 0, '2018-08-14 09:19:32'),
(6, 'manjushapraveen31@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '123456', '', '', '', '', '2018-08-29 14:56:45', '0000-00-00 00:00:00', 'Student', 2, 1, 1, 0, '2018-08-31 10:10:40');

-- --------------------------------------------------------

--
-- Table structure for table `sellbook`
--

CREATE TABLE IF NOT EXISTS `sellbook` (
  `sb_user_id` int(11) NOT NULL AUTO_INCREMENT,
  `Book_Name` varchar(500) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `price` varchar(100) NOT NULL,
  `file1` varchar(500) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`sb_user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `sellbook`
--

INSERT INTO `sellbook` (`sb_user_id`, `Book_Name`, `description`, `price`, `file1`, `date`) VALUES
(3, 'Yayati', 'xdvxdfgdfg', '150', '', '2018-06-26'),
(4, 'Yayati', 'xdvxdfgdfg', '150', '', '2018-06-26'),
(5, 'rtuyu', 'ruyr', 'ryuru', '', '2018-06-26'),
(6, 'dfgfdg', 'ytjtyjjtj', '120', '', '2018-06-27');

-- --------------------------------------------------------

--
-- Table structure for table `studnew_users`
--

CREATE TABLE IF NOT EXISTS `studnew_users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) NOT NULL,
  `surname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mob` int(12) NOT NULL,
  `password` varchar(100) NOT NULL,
  `gender` varchar(10) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `studnew_users`
--

INSERT INTO `studnew_users` (`user_id`, `firstname`, `surname`, `email`, `mob`, `password`, `gender`) VALUES
(1, 'Manjusha', 'Praveen', 'manjushapraveen31@gmail.com', 2147483647, '123456', 'Female'),
(2, 'Manjusha', 'Praveen', 'manjushapraveen31@gmail.com', 2147483647, '123456', 'Female'),
(3, 'Manjusha', 'Praveen', 'manjushapraveen31@gmail.com', 2147483647, '', 'Female'),
(4, 'Prejisha', 'Anil', 'preju@gmail.com', 2147483647, '123456', 'Female'),
(5, 'Prejisha', 'Anil', 'preju@gmail.com', 2147483647, '1234568564566545', 'Female'),
(6, 'Prejisha', 'Anil', 'preju@gmail.com', 2147483647, '568695565', 'Female'),
(7, 'Prejisha', 'Anil', 'manjuhappy3@gmail.com', 2147483647, '123456', 'Female'),
(8, 'Prejisha', 'Anil', 'manjuhappy3@gmail.com', 2147483647, '123456', 'Female'),
(9, 'Prejisha', 'Anil', 'manjuhappy3@gmail.com', 2147483647, '123456', 'Female'),
(10, 'Prejisha', 'Anil', 'manjushapraveen31@gmail.com', 2147483647, '123456', 'Female'),
(11, 'Prejisha', 'Anil', 'manjushapraveen31@gmail.com', 2147483647, '123456', 'Female'),
(12, 'Prejisha', 'Anil', 'manjushapraveen31@gmail.com', 2147483647, '123456', 'Female'),
(13, 'Prejisha', 'Anil', 'manjushapraveen31@gmail.com', 2147483647, '123456', 'Female'),
(14, 'Prejisha', 'Anil', 'manjushapraveen31@gmail.com', 2147483647, '', 'Female'),
(15, 'Prejisha', 'Anil', 'manjushapraveen31@gmail.com', 2147483647, '123456', 'Female'),
(16, 'Prejisha', 'Anil', 'manjushapraveen31@gmail.com', 2147483647, '', 'Female'),
(17, 'Prejisha', 'Anil', 'manjushapraveen31@gmail.com', 2147483647, '', 'Female'),
(18, 'Prejisha', 'Anil', 'manjushapraveen31@gmail.com', 2147483647, '', 'Female'),
(19, 'Prejisha', 'Anil', 'manjushapraveen31@gmail.com', 2147483647, '', 'Female'),
(20, 'Prejisha', 'Anil', 'manjushapraveen31@gmail.com', 2147483647, '', 'Female');

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE IF NOT EXISTS `subject` (
  `Id_subject` int(11) NOT NULL,
  `Lib_subject` varchar(255) NOT NULL,
  `Desc_subject` text NOT NULL,
  `Number_comment` int(11) NOT NULL DEFAULT '0',
  `Id_user` int(11) NOT NULL,
  `Date_subject` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`Id_subject`, `Lib_subject`, `Desc_subject`, `Number_comment`, `Id_user`, `Date_subject`) VALUES
(0, 'fdgdf', 'gdfgdfg', 0, 1, '2018-06-28 04:30:05'),
(0, 'dfgdg', 'dfgdfgdfgd', 0, 1, '2018-06-28 04:30:12'),
(0, 'vcxvxv', 'xvxcvxvxv', 0, 1, '2018-06-29 10:49:20'),
(0, 'sdfsf', 'dsfsdfsf', 0, 1, '2018-06-29 11:01:23'),
(0, 'rturtu', 'ryuytu', 0, 1, '2018-07-02 05:01:33');

-- --------------------------------------------------------

--
-- Table structure for table `topics`
--

CREATE TABLE IF NOT EXISTS `topics` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `slug` varchar(255) NOT NULL DEFAULT '',
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `sb_user_id` int(11) unsigned NOT NULL,
  `username` varchar(200) NOT NULL,
  `forum_id` int(11) unsigned NOT NULL,
  `is_sticky` tinyint(1) NOT NULL DEFAULT '0',
  `content` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `topics`
--

INSERT INTO `topics` (`id`, `title`, `slug`, `created_at`, `updated_at`, `sb_user_id`, `username`, `forum_id`, `is_sticky`, `content`) VALUES
(1, 'ghjgj', '', '2018-07-13 17:35:52', '2018-07-25 15:24:25', 48, 'rupaliSatpute', 0, 0, 'ghjghjgh'),
(2, 'ghjgj', '', '2018-07-13 17:36:02', '2018-07-13 18:22:57', 48, 'rupaliSatpute', 0, 0, 'ghjghjgh'),
(3, 'ghjgj', '', '2018-07-13 17:36:11', NULL, 48, 'rupaliSatpute', 0, 0, 'ghjghjgh'),
(4, 'Jai Maharashtra', '', '2018-07-19 16:25:14', '2018-07-19 16:25:55', 49, 'anilKharche', 0, 0, 'AVCC'),
(5, 'jkljkl', '', '2018-07-20 15:58:04', NULL, 51, 'Prejisha Anil', 0, 0, 'jklkjl'),
(6, 'Student', '', '2018-08-14 14:31:14', '2018-08-16 12:58:30', 1, 'rupaNikam', 0, 0, 'rrr'),
(7, 'Teacher', '', '2018-08-16 10:41:09', '2018-08-16 13:14:00', 1, 'rupaNikam', 0, 0, 'Good'),
(8, 'Moving  background image', '', '2018-08-29 15:17:43', '2018-08-29 15:18:16', 6, 'ManjushaPraveen', 0, 0, 'sdadsadsaddsadas');

-- --------------------------------------------------------

--
-- Table structure for table `tutorial`
--

CREATE TABLE IF NOT EXISTS `tutorial` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `rating` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `tutorial`
--

INSERT INTO `tutorial` (`id`, `title`, `description`, `rating`) VALUES
(1, 'Favorite Star Rating with jQuery', 'This tutorial is for doing favorite star rating using jQuery. It displays list of HTML stars by using li tags. These stars are highlighted by using CSS and jQuery based on the favorite rating selected by the user.', 1),
(2, 'PHP RSS Feed Read and List', 'PHP''s simplexml_load_file() function is used for reading data from xml file. Using this function, we can parse RSS feed to get item object array.', 3),
(3, 'jQuery AJAX Autocomplete – Country Example', 'Autocomplete feature is used to provide auto suggestion for users while entering input. It suggests country names for the users based on the keyword they entered into the input field by using jQuery AJAX.', 5);

-- --------------------------------------------------------

--
-- Table structure for table `uri_segments`
--

CREATE TABLE IF NOT EXISTS `uri_segments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first` int(11) NOT NULL,
  `second` int(11) NOT NULL,
  `chat_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `uri_segments`
--

INSERT INTO `uri_segments` (`id`, `first`, `second`, `chat_id`, `created_at`) VALUES
(1, 22, 2, 1, '2018-06-30 12:02:49'),
(2, 2, 13, 2, '2018-07-02 04:28:37'),
(3, 2, 23, 3, '2018-07-13 08:44:00'),
(4, 49, 48, 7, '2018-07-16 05:11:37'),
(5, 50, 48, 8, '2018-07-16 05:49:22'),
(6, 48, 51, 2, '2018-07-16 06:52:46'),
(7, 52, 48, 1, '2018-07-16 08:40:17'),
(8, 49, 64, 4, '2018-08-01 09:44:37'),
(9, 49, 62, 5, '2018-08-01 09:49:14');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  `avatar` varchar(255) DEFAULT 'default.jpg',
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) unsigned NOT NULL,
  `is_admin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_moderator` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_confirmed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `avatar`, `created_at`, `updated_at`, `updated_by`, `is_admin`, `is_moderator`, `is_confirmed`, `is_deleted`) VALUES
(1, 'Rups', 'rupalisatpute289@gmail.com', '$2y$10$sbAnagfiWpKxR3qKn.oEaOWh5GOCOM9Xdms6yMVKEym9utont8Q5.', '6fe39e6b2ae3b9b41e512d318bbacb17.png', '2018-06-15 12:09:59', '2018-06-15 12:22:02', 1, 0, 0, 1, 0),
(2, 'Manju', 'r@yahoo.com', '$2y$10$PrdPvEKEg69P0IVqDrym4uU8oUAeN2EcqXuiN4P.X6sG9maPcoduO', 'default.jpg', '2018-06-15 12:33:25', NULL, 0, 0, 0, 0, 0),
(3, 'Manju12', 'ghjghj@yahoo.com', '$2y$10$zLbe07XblQshF2nh9l0ZL.Jzj.MirtoxHPqG/WmQGU1GPHUo2C90m', 'default.jpg', '2018-06-19 11:10:16', NULL, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `view_rating`
--

CREATE TABLE IF NOT EXISTS `view_rating` (
  `rating_id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `rating_number` int(11) NOT NULL,
  `total_points` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 = Block, 0 = Unblock',
  PRIMARY KEY (`rating_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
