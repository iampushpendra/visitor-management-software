-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 28, 2019 at 09:44 AM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `users`
--

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `v_name` varchar(50) NOT NULL,
  `v_email` varchar(50) NOT NULL,
  `v_no` varchar(50) NOT NULL,
  `h_name` varchar(50) NOT NULL,
  `h_email` varchar(50) NOT NULL,
  `h_no` varchar(50) NOT NULL,
  `arv` timestamp NOT NULL DEFAULT current_timestamp(),
  `dep` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `v_name`, `v_email`, `v_no`, `h_name`, `h_email`, `h_no`, `arv`, `dep`, `status`) VALUES
(1, 'Raushan Kumar', '87t', 'g8', '', '', '', '2019-11-28 07:30:38', '0000-00-00 00:00:00', 1),
(2, 'raj', 'rgrdgjn', '79979', 'hbkb', 'hbk', '80', '2019-11-28 07:40:34', '2019-11-28 08:09:45', 0),
(3, 'raj', 'rgrdgjn', '79979', 'hbkb', 'hbk', '80', '2019-11-28 07:40:48', '2019-11-28 08:09:45', 0),
(4, 'rajef', 'q', 'geg', 'gerge', 'gerg', 'ergerg', '2019-11-28 08:02:12', '0000-00-00 00:00:00', 1),
(5, 'fr', 'aa', '7477740333', 'efef', 'we', 'wew', '2019-11-28 08:22:11', '2019-11-28 08:40:33', 0),
(6, 'nn', 'nn', '7477740333', 'hbkb', 'gerg', '7477740333', '2019-11-28 08:26:18', '2019-11-28 08:40:33', 0),
(7, 'uyfjj', 'rgrdgjn', '7477740333', 'hbkb', 'gerg', '7478004777', '2019-11-28 08:39:25', '2019-11-28 08:40:33', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
