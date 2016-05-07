-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 12, 2016 at 08:19 PM
-- Server version: 5.5.47-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.14

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
-- Table structure for table `customer_order`
--

CREATE TABLE IF NOT EXISTS `customer_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `order_create_date` datetime NOT NULL,
  `order_create_time` time NOT NULL,
  `order_close_date` datetime DEFAULT NULL,
  `order_close_time` time DEFAULT NULL,
  `order_status` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `order_net_total` int(50) NOT NULL,
  `order_tax` int(50) NOT NULL,
  `order_total` decimal(30,2) NOT NULL,
  `order_reference` int(11) NOT NULL,
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `customer_order_id` (`order_id`),
  KEY `User_Order` (`user_id`),
  KEY `customer_order` (`customer_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `customer_order`
--

INSERT INTO `customer_order` (`order_id`, `user_id`, `order_create_date`, `order_create_time`, `order_close_date`, `order_close_time`, `order_status`, `order_note`, `customer_id`, `order_net_total`, `order_tax`, `order_total`, `order_reference`) VALUES
(1, 1, '2016-04-11 17:07:37', '16:55:47', '0000-00-00 00:00:00', NULL, '', '', 1, 284100000, 14555000, '298655000.00', 0),
(2, 1, '2016-03-23 12:58:54', '16:57:03', '0000-00-00 00:00:00', NULL, 'Processed', '', 1, 0, 0, '24570000.00', 1),
(3, 1, '2016-03-23 12:10:51', '16:57:03', '0000-00-00 00:00:00', NULL, 'Shipped', '', 1, 0, 0, '14735000.00', 2),
(4, 1, '2016-03-23 12:28:53', '16:57:03', '0000-00-00 00:00:00', NULL, 'Processed', '', 1, 0, 0, '0.00', 0),
(5, 1, '2016-03-23 13:13:59', '00:00:00', '0000-00-00 00:00:00', '00:00:00', 'Processed', '', 10, 0, 0, '6300000.00', 0),
(6, 1, '2016-03-23 13:14:33', '00:00:00', '0000-00-00 00:00:00', '00:00:00', 'Processed', '', 10, 0, 0, '6300000.00', 0),
(7, 1, '2016-04-11 13:32:50', '00:00:00', '0000-00-00 00:00:00', '00:00:00', 'Processed', '', 3, 0, 0, '173043200.00', 0);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer_order`
--
ALTER TABLE `customer_order`
  ADD CONSTRAINT `User_Order` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `customer_order` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
