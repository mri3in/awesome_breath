-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 13, 2016 at 04:15 PM
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
-- Table structure for table `authority`
--

CREATE TABLE IF NOT EXISTS `authority` (
  `authority_code` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `authority_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `authority_create_date` date NOT NULL,
  `authority_deactivate_date` date DEFAULT NULL,
  PRIMARY KEY (`authority_code`),
  KEY `authority_name` (`authority_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `authority`
--

INSERT INTO `authority` (`authority_code`, `authority_description`, `authority_create_date`, `authority_deactivate_date`) VALUES
('AUTHORIZATION_CRUD', 'Manage authorization', '0000-00-00', NULL),
('AUTHORIZATION_R', 'Manage authorization', '2015-12-05', NULL),
('AUTHORIZATION_RU', 'Manage authorization', '2015-12-06', NULL),
('AUTHORIZATION_RUD', 'Manage authorization', '2015-12-07', NULL),
('CUSTOMER_DETAIL_CRUD', 'Manage customer detail', '2015-12-08', NULL),
('CUSTOMER_DETAIL_R', 'Manage customer detail', '2015-12-09', NULL),
('CUSTOMER_DETAIL_RU', 'Manage customer detail', '2015-12-10', NULL),
('CUSTOMER_DETAIL_RUD', 'Manage customer detail', '2015-12-11', NULL),
('ITEM_CATEGORY_CRUD', 'Manage item category', '2015-12-12', NULL),
('ITEM_CATEGORY_R', 'Manage item category', '2015-12-13', NULL),
('ITEM_CATEGORY_RU', 'Manage item category', '2015-12-14', NULL),
('ITEM_CATEGORY_RUD', 'Manage item category', '2015-12-15', NULL),
('ITEM_CRUD', 'Manage item', '2015-12-16', NULL),
('ITEM_R', 'Manage item', '2015-12-17', NULL),
('ITEM_RU', 'Manage item', '2015-12-18', NULL),
('ITEM_RUD', 'Manage item', '2015-12-19', NULL),
('ITEM_STORAGE_LOCATION_CRUD', 'Manage item storage location', '2015-12-20', NULL),
('ITEM_STORAGE_LOCATION_R', 'Manage item storage location', '2015-12-21', NULL),
('ITEM_STORAGE_LOCATION_RU', 'Manage item storage location', '2015-12-22', NULL),
('ITEM_STORAGE_LOCATION_RUD', 'Manage item storage location', '2015-12-23', NULL),
('ITEM_WAREHOUSE_CRUD', 'Manage item warehouse', '2015-12-24', NULL),
('ITEM_WAREHOUSE_R', 'Manage item warehouse', '2015-12-25', NULL),
('ITEM_WAREHOUSE_RU', 'Manage item warehouse', '2015-12-26', NULL),
('ITEM_WAREHOUSE_RUD', 'Manage item warehouse', '2015-12-27', NULL),
('ORDER_CRUD', 'Manage order', '2015-12-28', NULL),
('ORDER_LINE_CRUD', 'Manage order line', '2015-12-29', NULL),
('ORDER_LINE_R', 'Manage order line', '2015-12-30', NULL),
('ORDER_LINE_RU', 'Manage order line', '2015-12-31', NULL),
('ORDER_LINE_RUD', 'Manage order line', '0000-00-00', NULL),
('ORDER_R', 'Manage order', '0000-00-00', NULL),
('ORDER_RU', 'Manage order', '0000-00-00', NULL),
('ORDER_RUD', 'Manage order', '0000-00-00', NULL),
('SALE_TRANSACTION_CRUD', 'Manage sale transaction', '0000-00-00', NULL),
('SALE_TRANSACTION_R', 'Manage sale transaction', '0000-00-00', NULL),
('SALE_TRANSACTION_RU', 'Manage sale transaction', '0000-00-00', NULL),
('SALE_TRANSACTION_RUD', 'Manage sale transaction', '0000-00-00', NULL),
('STAFF_DETAIL_CRUD', 'Manage staff details', '0000-00-00', NULL),
('STAFF_DETAIL_R', 'Manage staff details', '0000-00-00', NULL),
('STAFF_DETAIL_RU', 'Manage staff details', '0000-00-00', NULL),
('STAFF_DETAIL_RUD', 'Manage staff details', '0000-00-00', NULL),
('STORAGE_LOCATION_CRUD', 'Manage storage location', '0000-00-00', NULL),
('STORAGE_LOCATION_R', 'Manage storage location', '0000-00-00', NULL),
('STORAGE_LOCATION_RU', 'Manage storage location', '0000-00-00', NULL),
('STORAGE_LOCATION_RUD', 'Manage storage location', '0000-00-00', NULL),
('USER_AUTHORITY_CRUD', 'Manage user authority', '0000-00-00', NULL),
('USER_AUTHORITY_R', 'Manage user authority', '0000-00-00', NULL),
('USER_AUTHORITY_RU', 'Manage user authority', '0000-00-00', NULL),
('USER_AUTHORITY_RUD', 'Manage user authority', '0000-00-00', NULL),
('USER_DETAIL_CRUD', 'Manage user''s details', '2015-12-24', NULL),
('USER_DETAIL_R', 'Manage user''s details', '2015-12-24', NULL),
('USER_DETAIL_RU', 'Manage user''s details', '2015-12-24', NULL),
('USER_DETAIL_RUD', 'Manage user''s details', '2015-12-24', NULL),
('WAREHOUSE_CRUD', 'Manage warehouse', '0000-00-00', NULL),
('WAREHOUSE_R', 'Manage warehouse', '0000-00-00', NULL),
('WAREHOUSE_RU', 'Manage warehouse', '0000-00-00', NULL),
('WAREHOUSE_RUD', 'Manage warehouse', '0000-00-00', NULL),
('WAREHOUSE_TRANSACTION_CRUD', 'Manage warehouse transaction', '0000-00-00', NULL),
('WAREHOUSE_TRANSACTION_R', 'Manage warehouse transaction', '0000-00-00', NULL),
('WAREHOUSE_TRANSACTION_RU', 'Manage warehouse transaction', '0000-00-00', NULL),
('WAREHOUSE_TRANSACTION_RUD', 'Manage warehouse transaction', '0000-00-00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `authorization`
--

CREATE TABLE IF NOT EXISTS `authorization` (
  `authorization_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `authority_code` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `authorization_create_date` date NOT NULL,
  `authorization_deactivate_date` date DEFAULT NULL,
  `authorization_status` char(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`authorization_id`),
  KEY `authorization_user` (`user_id`),
  KEY `authorization_authority` (`authority_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `authorization`
--

INSERT INTO `authorization` (`authorization_id`, `user_id`, `authority_code`, `authorization_create_date`, `authorization_deactivate_date`, `authorization_status`) VALUES
(1, 1, 'ORDER_CRUD', '2015-12-24', NULL, NULL),
(2, 1, 'USER_DETAIL_CRUD', '2015-12-24', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_long_name` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_billing_address` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_shipping_address` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_tax_code` bigint(30) NOT NULL,
  `customer_credit_limit` decimal(30,2) NOT NULL,
  `customer_payment_term` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `staff_id` int(4) NOT NULL,
  `staff_supervisor_id` int(4) NOT NULL,
  `customer_contact_person_name` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_contact_person_phone_number` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_contact_person_email` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  KEY `Customer_staff` (`staff_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=13 ;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `customer_name`, `customer_long_name`, `customer_billing_address`, `customer_shipping_address`, `customer_tax_code`, `customer_credit_limit`, `customer_payment_term`, `staff_id`, `staff_supervisor_id`, `customer_contact_person_name`, `customer_contact_person_phone_number`, `customer_contact_person_email`, `customer_status`) VALUES
(1, 'Nguyen Hai Phong', 'Phong Nguyen VJS', '24 Banh Van Tran; Tan Binh District, Ho Chi Minh City', '17 Le Duan; Ho Chi Minh City', 2312323452, '500000.00', 'Net 30', 3, 1, 'Hoang Hong Hanh', '+84 942444018', 'abc@gmail.com', 'Active'),
(2, 'Anh Tran', 'Cong ty TNHH Anh Tran', '42 Ngo Be; Ho Chi Minh City', '105 Cach Mang Thang Tam; Ho Chi Minh City', 5801282228, '234324.00', 'Net 30', 3, 1, 'Tran Ha Thanh', '+84 93243561', 'trg@outlook.com.vn', 'Active'),
(3, 'Tamy Hotel', 'Cong ty TNHH Tamy Tran', '18 Nguyen Tri Phuong; Ho Chi Minh City', '490 An Duong Vuong; Ho Chi Minh City', 5801282342, '1133232.00', 'Net 20', 3, 1, 'Tran Hoang Yen', '+84 934840124', 'trg@outlook.com.vn', 'Active'),
(4, 'Lam Sai Gon Hotel', 'Cong ty TNHH Lam Sai Gon Hotel', '60 Ngo Be; Ho Chi Minh City', '47 Long Hung; Ho Chi Minh City', 3401282228, '513234.00', 'Net 30', 8, 3, 'Tran Ha My', '+84 90065002', 'trg@outlook.com.vn4', 'Deleted'),
(5, 'Thanh Thuy', 'Thanh Thuy Hotel & Restaurant', '26 Nguyen Thi Minh Khai; Ho Chi Minh City', '42 Mac Dinh Chi; Ho Chi Minh City', 5823482228, '12312312312.00', 'Net 30', 8, 3, 'Pham My Duyen', '+84 123535355', 'trg@outlook.com.vn5', 'Deleted'),
(6, 'Tuan Anh', 'Cong ty TNHH Tuan Anh', '19 Nam Ky Khoi Nghia; Dala City', '56 Phan Nhu Thach; Da Lat City', 1231282228, '1312314524.00', 'Net 15', 8, 3, 'Le Song Anh Thu', '+84 957302423', 'trg@outlook.com.vn6', 'Suspended'),
(7, 'Phong Be', 'Phong Be VJS', '20 Co Giang; Ho Chi Minh City', '149/33A6 Banh Van Tran; Ho Chi Minh City', 5801273338, '67867867.00', 'Net 40', 8, 3, 'Nguyen Le Huu Tam', '+84 934512422', 'trg@outlook.com.vn7', 'Deleted'),
(8, 'Cong Anh', 'Cong ty TNHH Cong Anh', '120 Dien Bien Phu; Ho Chi Minh City', '11 Tan Thanh; Ho Chi Minh City', 5801374449, '67867.00', 'Net 20', 9, 8, 'Pham Viet Long', '+84 945624450', 'trg@outlook.com.vn8', 'Active'),
(9, 'Cuong Nang', 'Phang Nang Cuong VJS', '40 Cong Hoa; Ho Chi Minh City', '60 Tran Hung Dao; Ho Chi Minh City', 7801282228, '786756.00', 'Net 10', 9, 8, 'Tran Cong Tuan', '+84 932484019', 'trg@outlook.com.vn9', 'Active'),
(10, 'Forrest   ', 'Forrest International', '49 Cong Hoa  ;   Ho Chi Minh City; Viet Nam  ', '90 Phu Dong Thien Vuong;   Ho Chi Minh City; Viet Nam   ', 6901282228, '464645654.00', 'Net 20', 9, 8, 'Nguyen Bich Hoa   ', '+84 92451241   ', 'trg@outlook.com.vn10', 'Suspended'),
(11, 'Thu Thuy', 'Thuy Thuy Restaurant', '49 Truong Trinh; Ho Chi Minh City', '49 Xo Viet Nghe Tinh; Ho Chi Minh City', 4571282228, '45647897.00', 'Net 40', 9, 8, 'Pham Minh Ngoc', '+84 93451242', 'trg@outlook.com.vn11', 'Deleted'),
(12, 'Tuan Hung', 'Cong ty TNHH Tuan Hung', 'RMIT Viet Nam; Ho Chi Minh city', 'RMIT Australia; Melbourne', 1234282228, '7573522345.00', 'net 30', 9, 8, 'Pham Diem Thuy', '+84 93552242', 'trg@outlook.com.vn12', 'Deleted');

-- --------------------------------------------------------

--
-- Table structure for table `customer_order`
--

CREATE TABLE IF NOT EXISTS `customer_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `order_create_date` date NOT NULL,
  `order_create_time` time NOT NULL,
  `order_close_date` date DEFAULT NULL,
  `order_close_time` time DEFAULT NULL,
  `order_status` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `order_total` decimal(30,2) NOT NULL,
  `order_reference` int(255) NOT NULL,
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `customer_order_id` (`order_id`),
  KEY `User_Order` (`user_id`),
  KEY `customer_order` (`customer_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `customer_order`
--

INSERT INTO `customer_order` (`order_id`, `user_id`, `order_create_date`, `order_create_time`, `order_close_date`, `order_close_time`, `order_status`, `order_note`, `customer_id`, `order_total`, `order_reference`) VALUES
(1, 3, '2015-12-24', '16:55:47', NULL, NULL, '', NULL, 1, '0.00', 0),
(2, 5, '2015-12-23', '16:57:03', NULL, NULL, 'processed', NULL, 1, '0.00', 0),
(3, 6, '2015-12-23', '16:57:03', NULL, NULL, 'shipped', NULL, 1, '0.00', 0),
(4, 6, '2015-12-23', '16:57:03', NULL, NULL, 'delivered', NULL, 1, '0.00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE IF NOT EXISTS `invoice` (
  `Invoice_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE IF NOT EXISTS `item` (
  `item_id` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_category_id` int(11) NOT NULL DEFAULT '1',
  `item_name` varchar(90) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_unit_of_measurement` set('pcs') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pcs',
  `item_expiry_period` double(11,2) DEFAULT NULL,
  `item_cost` decimal(20,0) NOT NULL,
  `item_unit_price` decimal(20,0) NOT NULL,
  `item_power` double(11,2) DEFAULT NULL,
  `item_power_unit` char(5) COLLATE utf8mb4_unicode_ci DEFAULT 'kW',
  `item_phase` int(1) DEFAULT '1',
  `item_voltage_low` double(11,2) DEFAULT NULL,
  `item_voltage_high` double(11,2) DEFAULT NULL,
  `item_frequency` double(11,2) DEFAULT NULL,
  `item_diameter` double(10,2) DEFAULT NULL,
  `item_capacity` double(11,2) DEFAULT NULL,
  `item_area` double(10,2) DEFAULT NULL,
  `item_description` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_VAT` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_vendor` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_manufacturer` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_quantity` double(20,2) NOT NULL,
  `item_allocated_to_customer_order` decimal(20,2) NOT NULL,
  PRIMARY KEY (`item_id`),
  KEY `item_item_category` (`item_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`item_id`, `item_category_id`, `item_name`, `item_unit_of_measurement`, `item_expiry_period`, `item_cost`, `item_unit_price`, `item_power`, `item_power_unit`, `item_phase`, `item_voltage_low`, `item_voltage_high`, `item_frequency`, `item_diameter`, `item_capacity`, `item_area`, `item_description`, `item_VAT`, `item_vendor`, `item_manufacturer`, `item_quantity`, `item_allocated_to_customer_order`) VALUES
('011012', 1, 'Intellflo Pumps', 'pcs', NULL, '2000000', '3500000', 3.20, 'kW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'VFD Drive Pool pump', '10%', 'Halo', 'Toshiba', 20.00, '0.00'),
('011516', 1, 'Whisperflo Pumps', 'pcs', NULL, '1000000', '3000000', 3.00, 'HP', NULL, 203.00, 230.00, NULL, NULL, NULL, NULL, 'PMP WFE-12 Full rated Energy efficient', '5%', 'Phong Vu', 'Hitachi', 30.00, '0.00'),
('22011', 1, 'Whisperflo Pumps', 'pcs', NULL, '0', '0', 5.00, 'HP', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Whisperflo XP Pumps', '', '', '', 0.00, '0.00'),
('247928', 1, 'Whisperflo Pumps', 'pcs', NULL, '0', '0', 1.00, 'HP', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', 0.00, '0.00'),
('340056', 1, 'OPTIFLO PUMPS', 'pcs', NULL, '0', '0', 0.75, 'HP', 1, NULL, 220.00, NULL, NULL, NULL, NULL, NULL, '', '', '', 0.00, '0.00'),
('340057', 1, 'OPTIFLO PUMPS', 'pcs', NULL, '0', '0', 1.00, 'HP', 1, NULL, 220.00, NULL, NULL, NULL, NULL, NULL, '', '', '', 0.00, '0.00'),
('340058', 1, 'OPTIFLO PUMPS', 'pcs', NULL, '0', '0', 1.50, 'HP', 1, NULL, 220.00, 50.00, NULL, NULL, NULL, NULL, '', '', '', 0.00, '0.00'),
('340095', 1, 'SUPERFLO PUMPS', 'pcs', NULL, '0', '0', 1.00, 'HP', 1, NULL, 220.00, 50.00, NULL, NULL, NULL, NULL, '', '', '', 0.00, '0.00'),
('340096', 1, 'SUPERFLO PUMPS', 'pcs', NULL, '0', '0', 1.50, 'HP', 1, NULL, 220.00, 50.00, NULL, NULL, NULL, NULL, '', '', '', 0.00, '0.00'),
('340097', 1, 'SUPERFLO PUMPS', 'pcs', NULL, '0', '0', 2.00, 'HP', 1, NULL, 220.00, 50.00, NULL, NULL, NULL, NULL, '', '', '', 0.00, '0.00'),
('347926', 1, 'Whisperflo Pumps', 'pcs', NULL, '0', '0', 0.50, 'HP', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', 0.00, '0.00'),
('347927', 1, 'Whisperflo Pumps', 'pcs', NULL, '0', '0', 0.75, 'HP', 3, NULL, 220.00, 50.00, NULL, NULL, NULL, NULL, '', '', '', 0.00, '0.00'),
('347929', 1, 'Whisperflo Pumps', 'pcs', NULL, '0', '0', 1.50, 'HP', 3, NULL, 220.00, 50.00, NULL, NULL, NULL, NULL, '', '', '', 0.00, '0.00'),
('347930', 1, 'Whisperflo Pumps', 'pcs', NULL, '0', '0', 2.00, 'HP', 3, NULL, 220.00, 50.00, NULL, NULL, NULL, NULL, '', '', '', 0.00, '0.00'),
('F-15TF-AZ', 2, 'Triton II CleatPro - Side Mount - Fiberglass with Valve', 'pcs', NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, 380.00, 6.00, NULL, NULL, '', '', '', 0.00, '0.00'),
('F-19S8-TRV', 2, 'Triton Side Mount-Fiberglass with Valve', 'pcs', NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, 480.00, 8.50, NULL, NULL, '', '', '', 0.00, '0.00'),
('F-19SF-AZ', 2, 'Triton II CleatPro - Side Mount - Fiberglass with Valve', 'pcs', NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, 480.00, 9.00, NULL, NULL, '', '', '', 0.00, '0.00'),
('F-19T6-TAG', 2, 'Tagelus Top Mount- Fiberglass with Valve', 'pcs', NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, 480.00, 8.50, NULL, NULL, '', '', '', 0.00, '0.00'),
('F-19T8-TACP', 2, 'Triton II CleatPro - Side Mount - Fiberglass with Valve', 'pcs', NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, 480.00, 8.50, NULL, NULL, '', '', '', 0.00, '0.00'),
('F-19TF-AZ', 2, 'Triton II CleatPro - Side Mount - Fiberglass with Valve', 'pcs', NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, 480.00, 9.00, NULL, NULL, '', '', '', 0.00, '0.00'),
('F-22SF-AZ', 2, 'Triton II CleatPro - Side Mount - Fiberglass with Valve', 'pcs', NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, 560.00, 12.00, NULL, NULL, '', '', '', 0.00, '0.00'),
('F-22TF-AZ', 2, 'Triton II CleatPro - Side Mount - Fiberglass with Valve', 'pcs', NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, 560.00, 12.00, NULL, NULL, '', '', '', 0.00, '0.00'),
('F-24S8-TRCP', 2, 'Triton II CleatPro - Side Mount - Fiberglass with Valve', 'pcs', NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, 610.00, 14.00, NULL, NULL, '', '', '', 0.00, '0.00'),
('F-24S8-TRV', 2, 'Triton Side Mount-Fiberglass with Valve', 'pcs', NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, 610.00, 14.00, NULL, NULL, '', '', '', 0.00, '0.00'),
('F-24T6-TAG', 2, 'Tagelus Top Mount-Fiberglass with Valve', 'pcs', NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, 762.00, 22.00, NULL, NULL, '', '', '', 0.00, '0.00'),
('F-24T8-TACP', 2, 'Triton II CleatPro - Side Mount - Fiberglass with Valve', 'pcs', NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, 610.00, 14.00, NULL, NULL, '', '', '', 0.00, '0.00'),
('F-26TF-AZ', 2, 'Triton II CleatPro - Side Mount - Fiberglass with Valve', 'pcs', NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, 660.00, 16.50, NULL, NULL, '', '', '', 0.00, '0.00'),
('F-30S-TRV', 2, 'Triton Side Mount-Fiberglass with Valve', 'pcs', NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, 762.00, 22.00, NULL, NULL, '', '', '', 0.00, '0.00'),
('F-30S8-TRCP', 2, 'Triton II CleatPro - Side Mount - Fiberglass with Valve', 'pcs', NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, 762.00, 22.00, NULL, NULL, '', '', '', 0.00, '0.00'),
('F-30SF-AZ', 2, 'Triton II CleatPro - Side Mount - Fiberglass with Valve', 'pcs', NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, 660.00, 16.50, NULL, NULL, '', '', '', 0.00, '0.00'),
('F-30T8-TACP', 2, 'Triton II CleatPro - Side Mount - Fiberglass with Valve', 'pcs', NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, 762.00, 22.00, NULL, NULL, '', '', '', 0.00, '0.00'),
('F-36S8-TRCP', 2, 'Triton II CleatPro - Side Mount - Fiberglass with Valve', 'pcs', NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, 914.00, 32.00, NULL, NULL, '', '', '', 0.00, '0.00'),
('F-36S8-TRV', 2, 'Triton Side Mount-Fiberglass with Valve', 'pcs', NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, 914.00, 32.00, NULL, NULL, '', '', '', 0.00, '0.00'),
('F19S8-TRCP', 1, 'TRITON II CleatPro - Side Mount - Fiberglass With Valve', 'pcs', NULL, '0', '0', NULL, '', NULL, NULL, NULL, NULL, 480.00, 8.50, NULL, NULL, '', '', '', 0.00, '0.00'),
('H-16-0301', 2, 'Triton II CleatPro - Side Mount - Fiberglass with Valve', 'pcs', NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, 39.00, 39.00, NULL, NULL, '', '', '', 0.00, '0.00'),
('H-16-0310', 2, 'Triton II CleatPro - Side Mount - Fiberglass with Valve', 'pcs', NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, 22.30, 20.50, NULL, NULL, '', '', '', 0.00, '0.00'),
('H-16-0314', 2, 'Triton II CleatPro - Side Mount - Fiberglass with Valve', 'pcs', NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, 4.60, 11.30, NULL, NULL, '', '', '', 0.00, '0.00'),
('H-16-0315', 2, 'Triton II CleatPro - Side Mount - Fiberglass with Valve', 'pcs', NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, 7.00, 17.00, NULL, NULL, '', '', '', 0.00, '0.00'),
('H-16-0316', 2, 'Triton II CleatPro - Side Mount - Fiberglass with Valve', 'pcs', NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, 9.30, 22.70, NULL, NULL, '', '', '', 0.00, '0.00'),
('H-16-0317', 2, 'Triton II CleatPro - Side Mount - Fiberglass with Valve', 'pcs', NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, 13.90, 34.00, NULL, NULL, '', '', '', 0.00, '0.00'),
('H-16-0318', 2, 'Triton II CleatPro - Side Mount - Fiberglass with Valve', 'pcs', NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, 18.60, 34.00, NULL, NULL, '', '', '', 0.00, '0.00'),
('H-16-0332', 2, 'Triton II CleatPro - Side Mount - Fiberglass with Valve', 'pcs', NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, 48.30, 48.30, NULL, NULL, '', '', '', 0.00, '0.00'),
('H-16-0340', 2, 'Triton II CleatPro - Side Mount - Fiberglass with Valve', 'pcs', NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, 29.70, 29.70, NULL, NULL, '', '', '', 0.00, '0.00'),
('P-UFLB-071', 1, 'ULTRAFLO- Pentair Pool Product', 'pcs', NULL, '0', '0', 0.55, 'kW', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', 0.00, '0.00'),
('P-UFLB-073', 1, 'ULTRAFLO BOOSTER - Pentair Pool Products', 'pcs', NULL, '0', '0', 0.55, 'kW', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', 0.00, '0.00'),
('P-UFLB-101', 1, 'ULTRAFLO BOOSTER - Pentair Pool Products', 'pcs', NULL, '0', '0', 0.75, 'kW', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', 0.00, '0.00'),
('P-UFLB-103E2*', 1, 'ULTRAFLO BOOSTER - Pentair Pool Products', 'pcs', NULL, '0', '0', 0.75, 'kW', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', 0.00, '0.00'),
('P-UFLB-151', 1, 'ULTRAFLO BOOSTER - Pentair Pool Products', 'pcs', NULL, '0', '0', 1.10, 'kW', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', 0.00, '0.00'),
('P-UFLB-153E2*', 1, 'ULTRAFLO BOOSTER - Pentair Pool Products', 'pcs', NULL, '0', '0', 1.10, 'kW', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', 0.00, '0.00'),
('P-UFLB-201', 1, 'ULTRAFLO BOOSTER - Pentair Pool Products', 'pcs', NULL, '0', '0', 1.50, 'kW', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', 0.00, '0.00'),
('P-UFLB-203E2*', 1, 'ULTRAFLO BOOSTER - Pentair Pool Products', 'pcs', NULL, '0', '0', 1.50, 'kW', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', 0.00, '0.00'),
('P-UFLB-301', 1, 'ULTRAFLO BOOSTER - Pentair Pool Products', 'pcs', NULL, '0', '0', 2.20, 'kW', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', 0.00, '0.00'),
('P-UFLB-303E2*', 1, 'ULTRAFLO BOOSTER - Pentair Pool Products', 'pcs', NULL, '0', '0', 2.20, 'kW', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', 0.00, '0.00'),
('P-WFL-071', 1, 'WHISPERFLO- Pentair Pool Product', 'pcs', NULL, '0', '0', 0.55, 'kW', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', 0.00, '0.00'),
('P-WFL-073', 1, 'WHISPERFLO- Pentair Pool Product', 'pcs', NULL, '0', '0', 0.55, 'kW', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', 0.00, '0.00'),
('P-WFL-101', 1, 'WHISPERFLO- Pentair Pool Product', 'pcs', NULL, '0', '0', 0.75, 'kW', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', 0.00, '0.00'),
('P-WFL-103E2*', 1, 'WHISPERFLO- Pentair Pool Product', 'pcs', NULL, '0', '0', 0.75, 'kW', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', 0.00, '0.00'),
('P-WFL-151', 1, 'WHISPERFLO- Pentair Pool Product', 'pcs', NULL, '0', '0', 1.10, 'kW', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', 0.00, '0.00'),
('P-WFL-153E2*', 1, 'WHISPERFLO- Pentair Pool Product', 'pcs', NULL, '0', '0', 1.10, 'kW', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', 0.00, '0.00'),
('P-WFL-201', 1, 'WHISPERFLO- Pentair Pool Product', 'pcs', NULL, '0', '0', 1.50, 'kW', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', 0.00, '0.00'),
('P-WFL-203E2*', 1, 'WHISPERFLO- Pentair Pool Product', 'pcs', NULL, '0', '0', 1.50, 'kW', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', 0.00, '0.00'),
('P-WFL-301', 1, 'WHISPERFLO- Pentair Pool Product', 'pcs', NULL, '0', '0', 2.20, 'kW', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', 0.00, '0.00'),
('P-WFL-303E2*', 1, 'WHISPERFLO- Pentair Pool Product', 'pcs', NULL, '0', '0', 2.20, 'kW', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', 0.00, '0.00'),
('R111316', 3, 'Maintenance and Safety equipment', 'pcs', NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Pool Brush, aluminum back 18"', '', '', '', 0.00, '0.00'),
('R111366', 3, 'Maintenance and Safety equipment', 'pcs', NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Pool Brush, molded plastic back 18"', '', '', '', 0.00, '0.00'),
('R111616', 3, 'Maintenance and Safety equipment', 'pcs', NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Algae Brush, Aluminum back 6"', '', '', '', 0.00, '0.00'),
('R12126', 3, 'Maintenance and Safety equipment', 'pcs', NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Leaf rake 123', '', '', '', 0.00, '0.00'),
('R12166', 3, 'Maintenance and Safety equipment', 'pcs', NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Leaf skimmer 142S magnet', '', '', '', 0.00, '0.00'),
('R141106', 3, 'Maintenance and Safety equipment', 'pcs', NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Floating themometer', '', '', '', 0.00, '0.00'),
('R151076', 3, 'Maintenance and Safety equipment', 'pcs', NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Test kit 2 in 1', '', '', '', 0.00, '0.00'),
('R161018', 3, 'Maintenance and Safety equipment', 'pcs', NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1/2 ounce Penol red Solution', '', '', '', 0.00, '0.00'),
('R17086', 3, 'Maintenance and Safety equipment', 'pcs', NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Floating tablet dispenser', '', '', '', 0.00, '0.00'),
('R191306', 3, 'Maintenance and Safety equipment', 'pcs', NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Telescopic handle 2-pc 8-15.5 ft', '', '', '', 0.00, '0.00'),
('R1913880', 3, 'Maintenance and Safety equipment', 'pcs', NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Telescopic handle 2-pc 12-36 ft, -3pcs', '', '', '', 0.00, '0.00'),
('R201060', 3, 'Maintenance and Safety equipment', 'pcs', NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Vaccum head 201 Flex-A-Vac', '', '', '', 0.00, '0.00'),
('R201350', 3, 'Maintenance and Safety equipment', 'pcs', NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Vaccum head 193 brush', '', '', '', 0.00, '0.00');

-- --------------------------------------------------------

--
-- Table structure for table `item_category`
--

CREATE TABLE IF NOT EXISTS `item_category` (
  `item_category_id` int(11) NOT NULL,
  `item_category_name` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`item_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `item_category`
--

INSERT INTO `item_category` (`item_category_id`, `item_category_name`) VALUES
(1, 'Pump'),
(2, 'Filter'),
(3, 'Maintenance and Safety equipment');

-- --------------------------------------------------------

--
-- Table structure for table `item_storage_location`
--

CREATE TABLE IF NOT EXISTS `item_storage_location` (
  `item_storage_location_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `storage_location_id` int(11) NOT NULL,
  PRIMARY KEY (`item_storage_location_id`),
  KEY `item_storage_location_storage_location` (`storage_location_id`),
  KEY `item_storagea_location_item` (`item_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=13 ;

--
-- Dumping data for table `item_storage_location`
--

INSERT INTO `item_storage_location` (`item_storage_location_id`, `item_id`, `storage_location_id`) VALUES
(1, '340056', 1),
(2, '340057', 2),
(3, '340058', 3),
(4, '340095', 4),
(5, '340096', 5),
(6, '340097', 6),
(7, 'F19S8-TRCP', 7),
(8, 'P-UFLB-071', 8),
(9, 'P-UFLB-073', 9),
(10, 'P-UFLB-101', 10),
(11, 'P-UFLB-103E2*', 11),
(12, 'P-UFLB-151', 12);

-- --------------------------------------------------------

--
-- Table structure for table `item_warehouse`
--

CREATE TABLE IF NOT EXISTS `item_warehouse` (
  `warehouse_id` int(11) NOT NULL,
  `item_id` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`warehouse_id`,`item_id`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `item_warehouse`
--

INSERT INTO `item_warehouse` (`warehouse_id`, `item_id`) VALUES
(1, '340056'),
(1, '340057'),
(1, '340058'),
(2, 'F19S8-TRCP'),
(2, 'P-UFLB-071'),
(2, 'P-UFLB-073');

-- --------------------------------------------------------

--
-- Table structure for table `order_line`
--

CREATE TABLE IF NOT EXISTS `order_line` (
  `order_line_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_line_create_time` time NOT NULL,
  `order_line_create_date` date NOT NULL,
  `order_line_item_id` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_line_item_quantity` int(11) NOT NULL,
  `order_line_item_total_value` int(11) DEFAULT NULL,
  `order_line_item_vendor_id` int(11) DEFAULT NULL,
  `order_line_deliver_date` date NOT NULL,
  `order_line_selling_price` decimal(30,2) NOT NULL,
  `order_line_net_selling_price` decimal(30,2) NOT NULL,
  PRIMARY KEY (`order_line_id`),
  KEY `order_order_line` (`order_id`),
  KEY `order_line_item` (`order_line_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_line`
--

INSERT INTO `order_line` (`order_line_id`, `order_id`, `order_line_create_time`, `order_line_create_date`, `order_line_item_id`, `order_line_item_quantity`, `order_line_item_total_value`, `order_line_item_vendor_id`, `order_line_deliver_date`, `order_line_selling_price`, `order_line_net_selling_price`) VALUES
(1, 1, '16:59:00', '2015-12-24', '340056', 2, NULL, NULL, '2015-12-31', '0.00', '0.00'),
(2, 1, '16:59:55', '2015-12-24', '340095', 3, NULL, NULL, '2016-01-07', '0.00', '0.00'),
(3, 1, '17:00:24', '2015-12-31', 'F19S8-TRCP', 5, NULL, NULL, '2016-01-14', '0.00', '0.00'),
(4, 2, '17:01:20', '2015-12-23', 'P-UFLB-151', 4, NULL, NULL, '2016-01-13', '0.00', '0.00'),
(5, 2, '17:01:53', '2015-12-23', 'P-UFLB-103E2*', 1, NULL, NULL, '2015-12-30', '0.00', '0.00');

-- --------------------------------------------------------

--
-- Table structure for table `quotation`
--

CREATE TABLE IF NOT EXISTS `quotation` (
  `quotation_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `quotation_create_date` date NOT NULL,
  `quotation_close_date` date NOT NULL,
  `quotation_status` varchar(20) NOT NULL,
  `quotation_note` varchar(255) NOT NULL,
  `quotation_total` double(70,2) NOT NULL,
  PRIMARY KEY (`quotation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `quotation_line`
--

CREATE TABLE IF NOT EXISTS `quotation_line` (
  `quotation_line_id` int(11) NOT NULL AUTO_INCREMENT,
  `quotation_line_estimate_price` double(30,2) NOT NULL,
  `quotation_line_estimate_net_price` int(11) NOT NULL,
  `quotation_id` int(11) NOT NULL,
  `quotation_line_create_date` date NOT NULL,
  `quotation_line_item_id` varchar(25) NOT NULL,
  `quotation_line_item_quantity` int(11) NOT NULL,
  PRIMARY KEY (`quotation_line_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sale_transaction`
--

CREATE TABLE IF NOT EXISTS `sale_transaction` (
  `sale_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_line_id` int(11) NOT NULL,
  `sale_transaction_create_date` date NOT NULL,
  `sale_transaction_close_date` date DEFAULT NULL,
  `sale_transaction_status` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sale_transaction_level` int(11) DEFAULT NULL,
  `sale_transaction_note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sale_transaction_user_id` int(11) NOT NULL,
  PRIMARY KEY (`sale_transaction_id`),
  KEY `Sale_Transaction_User` (`sale_transaction_user_id`),
  KEY `sale_transaction_order_line` (`order_line_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `sale_transaction`
--

INSERT INTO `sale_transaction` (`sale_transaction_id`, `order_line_id`, `sale_transaction_create_date`, `sale_transaction_close_date`, `sale_transaction_status`, `sale_transaction_level`, `sale_transaction_note`, `sale_transaction_user_id`) VALUES
(1, 1, '2015-12-24', NULL, 'processing', NULL, NULL, 3),
(2, 2, '2015-12-24', NULL, 'processing', NULL, NULL, 3),
(5, 5, '2015-12-25', NULL, 'transferred', NULL, NULL, 3);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE IF NOT EXISTS `staff` (
  `staff_id` int(4) NOT NULL AUTO_INCREMENT,
  `staff_name` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `staff_position` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `staff_start_date` date NOT NULL,
  `staff_end_date` date DEFAULT NULL,
  `staff_supervisor_id` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`staff_id`),
  UNIQUE KEY `staff_id` (`staff_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=12 ;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staff_id`, `staff_name`, `staff_position`, `staff_start_date`, `staff_end_date`, `staff_supervisor_id`) VALUES
(1, 'Tuan Anh', 'CEO', '2015-12-18', NULL, ''),
(2, 'Minh Hoang', 'Warehouse Manager', '2015-12-18', NULL, '1'),
(3, 'Xuan Thanh', 'Sales Manager', '2015-12-18', NULL, '1'),
(4, 'Thoa', 'Accounting', '2015-12-18', NULL, '1'),
(5, 'The Hanh', 'Technical Support', '2015-12-18', NULL, '1'),
(6, 'Hai Phong', 'Warehouse staff', '2015-12-18', NULL, '2'),
(7, 'Hoang Anh', 'warehouse team leader', '2015-12-18', NULL, '2'),
(8, 'Nang Cuong', 'sales team leader', '2015-12-18', NULL, '3'),
(9, 'Dang Lam', 'sales staff', '2015-12-18', NULL, '3'),
(10, 'Anh Tuan', 'HR staff', '2015-12-18', NULL, '1'),
(11, 'Tri Binh', 'HR team leader', '2015-12-18', NULL, '1');

-- --------------------------------------------------------

--
-- Table structure for table `storage_location`
--

CREATE TABLE IF NOT EXISTS `storage_location` (
  `storage_location_id` int(11) NOT NULL,
  `storage_location_shelf` int(11) NOT NULL,
  `storage_location_row` int(11) NOT NULL,
  `storage_location_column` int(11) NOT NULL,
  `storage_location_condition` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `storage_location_warehouse_id` int(11) NOT NULL,
  PRIMARY KEY (`storage_location_id`),
  KEY `storage_location_warehouse` (`storage_location_warehouse_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `storage_location`
--

INSERT INTO `storage_location` (`storage_location_id`, `storage_location_shelf`, `storage_location_row`, `storage_location_column`, `storage_location_condition`, `storage_location_warehouse_id`) VALUES
(1, 1, 1, 1, 'active', 1),
(2, 1, 1, 2, 'active', 1),
(3, 1, 1, 3, 'active', 1),
(4, 2, 1, 1, 'active', 1),
(5, 2, 1, 2, 'active', 1),
(6, 2, 1, 3, 'active', 1),
(7, 1, 1, 1, 'active', 2),
(8, 1, 2, 1, 'active', 2),
(9, 1, 3, 1, 'active', 2),
(10, 2, 1, 1, 'active', 2),
(11, 2, 2, 1, 'active', 2),
(12, 2, 3, 1, 'active', 2);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_password` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `staff_id` int(11) NOT NULL,
  `user_create_date` date NOT NULL,
  `user_delete_date` date DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `user_staff` (`staff_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=12 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_name`, `user_password`, `staff_id`, `user_create_date`, `user_delete_date`) VALUES
(1, 'tuananhceo', 'tuananhceo', 1, '2015-12-18', NULL),
(2, 'minhhoangwm', 'minhhoangwm', 2, '2015-12-18', NULL),
(3, 'xuanthanhsm', 'xuanthanhsm', 3, '2015-12-18', NULL),
(4, 'thoaacc', 'thoaacc', 4, '2015-12-18', NULL),
(5, 'thehanhts', 'thehanhts', 5, '2015-12-18', NULL),
(6, 'haiphongws', 'haiphongws', 6, '2015-12-18', NULL),
(7, 'hoanganhwtl', 'hoanganhwtl', 7, '2015-12-18', NULL),
(8, 'nangcuongstl', 'nangcuongstl', 8, '2015-12-18', NULL),
(9, 'danglamss', 'danglamss', 9, '2015-12-18', NULL),
(10, 'anhtuanhrs', 'anhtuanhrs', 10, '2015-12-18', NULL),
(11, 'tribinhhrtl', 'tribinhhrtl', 11, '2015-12-18', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `warehouse`
--

CREATE TABLE IF NOT EXISTS `warehouse` (
  `warehouse_id` int(11) NOT NULL,
  `warehouse_location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `warehouse_capacity` int(11) NOT NULL,
  PRIMARY KEY (`warehouse_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `warehouse`
--

INSERT INTO `warehouse` (`warehouse_id`, `warehouse_location`, `warehouse_capacity`) VALUES
(1, 'location_test', 1000),
(2, 'location_test_2', 1000);

-- --------------------------------------------------------

--
-- Table structure for table `warehouse_transaction`
--

CREATE TABLE IF NOT EXISTS `warehouse_transaction` (
  `warehouse_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `warehouse_transaction_create_date` date NOT NULL,
  `warehouse_transaction_close_date` date DEFAULT NULL,
  `warehouse_transaction_item_storage_location_id` int(11) NOT NULL,
  `warehouse_transaction_user_id` int(11) NOT NULL,
  `warehouse_transaction_status` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `warehouse_transaction_type` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'normal',
  PRIMARY KEY (`warehouse_transaction_id`),
  KEY `Warehouse_Transaction_User` (`warehouse_transaction_user_id`),
  KEY `warehouse_transaction_item_storage_location` (`warehouse_transaction_item_storage_location_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `warehouse_transaction`
--

INSERT INTO `warehouse_transaction` (`warehouse_transaction_id`, `warehouse_transaction_create_date`, `warehouse_transaction_close_date`, `warehouse_transaction_item_storage_location_id`, `warehouse_transaction_user_id`, `warehouse_transaction_status`, `warehouse_transaction_type`) VALUES
(1, '2015-12-28', NULL, 1, 1, 'pending', 'normal'),
(2, '2015-12-28', NULL, 2, 3, 'pending', 'normal'),
(3, '2015-12-28', NULL, 3, 1, 'pending', 'normal'),
(4, '2015-12-28', '2015-12-31', 4, 1, 'closed', 'normal'),
(5, '2015-12-28', NULL, 5, 4, 'pending', 'normal');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `authorization`
--
ALTER TABLE `authorization`
  ADD CONSTRAINT `authorization_authority` FOREIGN KEY (`authority_code`) REFERENCES `authority` (`authority_code`),
  ADD CONSTRAINT `authorization_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `Customer_staff` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`);

--
-- Constraints for table `customer_order`
--
ALTER TABLE `customer_order`
  ADD CONSTRAINT `customer_order` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `User_Order` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `item_item_category` FOREIGN KEY (`item_category_id`) REFERENCES `item_category` (`item_category_id`);

--
-- Constraints for table `item_storage_location`
--
ALTER TABLE `item_storage_location`
  ADD CONSTRAINT `item_storagea_location_item` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`),
  ADD CONSTRAINT `item_storage_location_storage_location` FOREIGN KEY (`storage_location_id`) REFERENCES `storage_location` (`storage_location_id`);

--
-- Constraints for table `item_warehouse`
--
ALTER TABLE `item_warehouse`
  ADD CONSTRAINT `item_warehouse_item` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`),
  ADD CONSTRAINT `item_warehouse_warehouse` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`warehouse_id`);

--
-- Constraints for table `order_line`
--
ALTER TABLE `order_line`
  ADD CONSTRAINT `order_line_item` FOREIGN KEY (`order_line_item_id`) REFERENCES `item` (`item_id`),
  ADD CONSTRAINT `order_order_line` FOREIGN KEY (`order_id`) REFERENCES `customer_order` (`order_id`);

--
-- Constraints for table `sale_transaction`
--
ALTER TABLE `sale_transaction`
  ADD CONSTRAINT `sale_transaction_order_line` FOREIGN KEY (`order_line_id`) REFERENCES `order_line` (`order_line_id`),
  ADD CONSTRAINT `Sale_Transaction_User` FOREIGN KEY (`sale_transaction_user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `storage_location`
--
ALTER TABLE `storage_location`
  ADD CONSTRAINT `storage_location_warehouse` FOREIGN KEY (`storage_location_warehouse_id`) REFERENCES `warehouse` (`warehouse_id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_staff` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
