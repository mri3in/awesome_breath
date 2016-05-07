-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 12, 2016 at 02:29 PM
-- Server version: 5.5.44-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `breath`
--

-- --------------------------------------------------------

--
-- Table structure for table `warehouse`
--

DROP TABLE `warehouse`;

CREATE TABLE IF NOT EXISTS `warehouse` (
  `warehouse_id` int(11) NOT NULL,
  `warehouse_location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `warehouse_capacity` int(11) NOT NULL,
  `warehouse_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `warehouse_supervisor_id` int(11) NOT NULL,
  `warehouse_item_category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`warehouse_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `warehouse`
--

INSERT INTO `warehouse` (`warehouse_id`, `warehouse_location`, `warehouse_capacity`, `warehouse_name`, `warehouse_supervisor_id`, `warehouse_item_category`) VALUES
(1, 'location test 1;Rock Sound;Bahamas', 1000, 'qewqeq', 5, '1'),
(2, 'location_test_23;Rock Sound;Bahamas', 1000, 'qweqwe', 6, '3'),
(9, '123213;Ararat;Armenia', 123, 'adaad', 1, '2;3'),
(10, '123213;Ararat;Armenia', 123, 'adaad', 1, '2;3'),
(11, '123213123123123;Rock Sound;Bahamas', 123, 'adaad123213', 1, '2;3'),
(12, '123213;Ararat;Armenia', 123, 'adaad', 1, '2;3'),
(13, '123213;Noakhali;Bangladesh', 123, 'adaad', 1, '2;3'),
(14, '1231;Mayaguana;Bahamas', 123, '12312', 2, '1;2'),
(15, '1231;Berat;Albania', 123, '12312', 2, '1;2'),
(16, 'qweqeqeq;Mykines;Faroe Islands', 23333, 'qeqweqwe', 10, '2');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
