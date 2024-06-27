-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 27, 2024 at 08:44 AM
-- Server version: 10.11.8-MariaDB-cll-lve
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u646358860_aquac`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `cid` int(11) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `middlename` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `birthdate` varchar(20) NOT NULL,
  `address` varchar(255) NOT NULL,
  `contact_number` varchar(20) NOT NULL,
  `barangay` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`cid`, `firstname`, `middlename`, `lastname`, `birthdate`, `address`, `contact_number`, `barangay`, `username`, `email`, `password`, `date_created`) VALUES
(1, 'Charmaine', '', 'Cator', '1999-06-22', 'Pateros', '09392878727', 'Barangay 1', 'cha', 'charmaine.l.d.cator@gmail.com', 'cha', '2024-05-26 00:17:16'),
(2, 'Andrea', 'Lopez', 'Mendres', '2003-07-28', 'Pasig', '099323404532', 'Barangay 2', 'ammendres', 'ammendres28@gmail.com', 'ammendres', '2024-05-26 10:28:14'),
(3, 'Rick', 'Olats', 'Sugarol', '1998-03-28', 'Pinagsama 69', '091548596135', 'Barangay 4', 'Rickjack', 'rickpiso@gmail.com', 'rick123', '2024-05-27 00:05:09'),
(4, 'Clinton David', 'Graio', 'Abarico', '1999-04-16', 'Blk 12 Lot 68 Kodak st. Pasong Camachile 1', '09770665936', 'Barangay 2', 'Okiks', 'kikoabarico1999@gmail.com', 'okiks1999', '2024-05-27 00:49:29');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `sid` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) NOT NULL,
  `water_station_name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `contact_number` varchar(20) DEFAULT NULL,
  `barangay` varchar(100) DEFAULT NULL,
  `valid_id_path` varchar(255) DEFAULT NULL,
  `business_permit_path` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_approved` int(11) NOT NULL DEFAULT 0 COMMENT '0 = for approval, 1 = approved, 2 = declined\r\n',
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`sid`, `first_name`, `middle_name`, `last_name`, `water_station_name`, `address`, `contact_number`, `barangay`, `valid_id_path`, `business_permit_path`, `username`, `email`, `password`, `is_approved`, `created_at`) VALUES
(1, 'Charmaine', '', 'Cator', 'AQUAHEALTH', 'PATEROS', '0929838', 'Barangay 2', 'lib/ids/1716693694165_valid_id.jpg', 'lib/permits/1716693694180_business_permit.jpg', 'testsup', 'testsup@sample.com', 'testsup', 1, '2024-05-26 03:21:37'),
(2, 'Test', '', 'Supplier', 'Test Water', 'PATEROS', '0129321', 'Barangay 4', 'lib/ids/1716702254504_valid_id.jpg', 'lib/permits/1716702254510_business_permit.jpg', 'test', 'test@sample.com', 'test', 0, '2024-05-26 05:44:18'),
(3, 'andrea', 'marie', 'mendres', 'sample', 'pasig', '9034343322', 'Barangay 2', 'lib/ids/1716720069669_valid_id.jpg', 'lib/permits/1716720069679_business_permit.jpg', 'ammendres1', 'ammendres@gmail.com', 'ammendres1', 0, '2024-05-26 10:41:10');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `uid` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_type` int(2) NOT NULL,
  `supplier_id` int(10) NOT NULL,
  `customer_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`uid`, `name`, `username`, `password`, `user_type`, `supplier_id`, `customer_id`) VALUES
(1, 'Charmaine', 'cha', 'cha', 1, 0, 1),
(2, 'Charmaine Cator', 'testsup', 'testsup', 2, 1, 0),
(3, 'Test Supplier', 'test', 'test', 2, 2, 0),
(4, 'Andrea Mendres', 'ammendres', 'ammendres', 1, 0, 2),
(5, 'andrea mendres', 'ammendres1', 'ammendres1', 2, 3, 0),
(6, 'Rick Sugarol', 'Rickjack', 'rick123', 1, 0, 3),
(7, 'Clinton David Abarico', 'Okiks', 'okiks1999', 1, 0, 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`sid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`uid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
