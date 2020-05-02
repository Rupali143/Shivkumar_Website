-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 30, 2019 at 02:14 PM
-- Server version: 10.3.16-MariaDB
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
-- Database: `shiv`
--

-- --------------------------------------------------------

--
-- Table structure for table `nr_role`
--

CREATE TABLE `nr_role` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nr_role`
--

INSERT INTO `nr_role` (`role_id`, `role_name`) VALUES
(0, 'Administrator'),
(1, 'Secretary'),
(2, 'Chairman'),
(3, 'Member');

-- --------------------------------------------------------

--
-- Table structure for table `nr_status`
--

CREATE TABLE `nr_status` (
  `status_id` int(11) NOT NULL,
  `status` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nr_status`
--

INSERT INTO `nr_status` (`status_id`, `status`) VALUES
(0, 'Inactive'),
(1, 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `nr_users`
--

CREATE TABLE `nr_users` (
  `user_id` int(11) NOT NULL,
  `user_date` date NOT NULL,
  `role_id` int(11) NOT NULL,
  `user_name` varchar(500) NOT NULL,
  `user_password` text NOT NULL,
  `status_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nr_users`
--

INSERT INTO `nr_users` (`user_id`, `user_date`, `role_id`, `user_name`, `user_password`, `status_id`) VALUES
(1, '0000-00-00', 0, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 1);

-- --------------------------------------------------------

--
-- Table structure for table `nr_users_info`
--

CREATE TABLE `nr_users_info` (
  `userinfo_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `firstname` varchar(500) NOT NULL,
  `middlename` varchar(500) NOT NULL,
  `lastname` varchar(500) NOT NULL,
  `emailid` varchar(500) NOT NULL,
  `mobno` bigint(20) NOT NULL,
  `nom_name` varchar(50) NOT NULL,
  `wing` varchar(10) NOT NULL,
  `flatno` varchar(50) NOT NULL,
  `flattype` varchar(100) NOT NULL,
  `flat_on_rent` varchar(10) NOT NULL,
  `tenant_name` varchar(100) NOT NULL,
  `tenant_mobno` varchar(20) NOT NULL,
  `tenant_addr` varchar(100) NOT NULL,
  `role_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `shiv_categories`
--

CREATE TABLE `shiv_categories` (
  `carous_id` int(11) NOT NULL,
  `carous_image` varchar(200) NOT NULL,
  `image_caption` varchar(500) NOT NULL,
  `date` varchar(50) NOT NULL,
  `status_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shiv_categories`
--

INSERT INTO `shiv_categories` (`carous_id`, `carous_image`, `image_caption`, `date`, `status_id`) VALUES
(1, 'ppp', 'pppp', '', 0),
(2, 'folder/Main/Koala4.jpg', '11', '2019-07-30 14:57:12', 0),
(3, 'folder/Main/Koala5.jpg', '11', '2019-07-30 15:07:23', 1);

-- --------------------------------------------------------

--
-- Table structure for table `shiv_status`
--

CREATE TABLE `shiv_status` (
  `status_id` int(11) NOT NULL,
  `status` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shiv_status`
--

INSERT INTO `shiv_status` (`status_id`, `status`) VALUES
(0, 'Inactive'),
(1, 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `sl_admingallery`
--

CREATE TABLE `sl_admingallery` (
  `gallery_id` int(11) NOT NULL,
  `adv_image` varchar(500) NOT NULL,
  `image_caption` varchar(100) NOT NULL,
  `date` datetime NOT NULL,
  `status_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sl_booknow`
--

CREATE TABLE `sl_booknow` (
  `user_id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `mobile_no` varchar(20) NOT NULL,
  `no_of_pairs` varchar(50) NOT NULL,
  `category` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sp_contact`
--

CREATE TABLE `sp_contact` (
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `message` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sp_contact`
--

INSERT INTO `sp_contact` (`user_id`, `name`, `email`, `subject`, `message`) VALUES
(1, 'Rupali', 'r@yahoo.com', 'Maths', 'ewgtrggwgwg'),
(2, 'Anil', 'Kharche@yahoo.com', 'ANC', 'dfgfdgfdgdfg'),
(3, 'Rups', 'gaju@yahoo.com', 'refdd', 'sdfdfdssdffsfdf'),
(4, 'Rups', 'gaju@yahoo.com', 'refdd', 'sdfdfdssdffsfdf'),
(5, 'gdgfgdfgdgddgf', 'rahul@gmail.com', 'ewrewrerewr', 'werrefwerwergrg'),
(6, 'gdgfgdfgdgddgf', 'rahul@gmail.com', 'ewrewrerewr', 'werrefwerwergrg'),
(7, 'gdgfgdfgdgddgf', 'rahul@gmail.com', 'ewrewrerewr', 'werrefwerwergrg'),
(8, 'sdsadad', 'gaju@yahoo.com', 'asdasd', 'sadadsadadas'),
(9, 'sdsfsdfsdfsfsdfsdf', 'sdfssdfs@gmail.com', 'eerffre', 'erfeferf');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `nr_role`
--
ALTER TABLE `nr_role`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `nr_status`
--
ALTER TABLE `nr_status`
  ADD PRIMARY KEY (`status_id`);

--
-- Indexes for table `nr_users`
--
ALTER TABLE `nr_users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `nr_users_info`
--
ALTER TABLE `nr_users_info`
  ADD PRIMARY KEY (`userinfo_id`);

--
-- Indexes for table `shiv_categories`
--
ALTER TABLE `shiv_categories`
  ADD PRIMARY KEY (`carous_id`);

--
-- Indexes for table `shiv_status`
--
ALTER TABLE `shiv_status`
  ADD PRIMARY KEY (`status_id`);

--
-- Indexes for table `sl_admingallery`
--
ALTER TABLE `sl_admingallery`
  ADD PRIMARY KEY (`gallery_id`);

--
-- Indexes for table `sl_booknow`
--
ALTER TABLE `sl_booknow`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `sp_contact`
--
ALTER TABLE `sp_contact`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `nr_role`
--
ALTER TABLE `nr_role`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `nr_status`
--
ALTER TABLE `nr_status`
  MODIFY `status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `nr_users`
--
ALTER TABLE `nr_users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `nr_users_info`
--
ALTER TABLE `nr_users_info`
  MODIFY `userinfo_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shiv_categories`
--
ALTER TABLE `shiv_categories`
  MODIFY `carous_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `shiv_status`
--
ALTER TABLE `shiv_status`
  MODIFY `status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sl_admingallery`
--
ALTER TABLE `sl_admingallery`
  MODIFY `gallery_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sl_booknow`
--
ALTER TABLE `sl_booknow`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sp_contact`
--
ALTER TABLE `sp_contact`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
