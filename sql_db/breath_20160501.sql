-- phpMyAdmin SQL Dump
-- version 4.5.0.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 01, 2016 at 05:42 PM
-- Server version: 10.0.17-MariaDB
-- PHP Version: 5.6.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `breath`
--

-- --------------------------------------------------------

--
-- Table structure for table `authority`
--

CREATE TABLE `authority` (
  `authority_code` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `authority_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `authority_create_date` date NOT NULL,
  `authority_deactivate_date` date DEFAULT NULL
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

CREATE TABLE `authorization` (
  `authorization_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `authority_code` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `authorization_create_date` date NOT NULL,
  `authorization_deactivate_date` date DEFAULT NULL,
  `authorization_status` char(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_long_name` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_billing_address` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_shipping_address` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_tax_code` bigint(30) NOT NULL,
  `customer_credit_limit` decimal(30,2) NOT NULL,
  `customer_current_credit` bigint(20) NOT NULL DEFAULT '0',
  `customer_payment_term` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_phone_number` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `staff_id` int(4) NOT NULL,
  `customer_contact_person_name` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_contact_person_phone_number` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_contact_person_email` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `customer_name`, `customer_long_name`, `customer_billing_address`, `customer_shipping_address`, `customer_tax_code`, `customer_credit_limit`, `customer_current_credit`, `customer_payment_term`, `customer_phone_number`, `staff_id`, `customer_contact_person_name`, `customer_contact_person_phone_number`, `customer_contact_person_email`, `customer_status`) VALUES
(1, 'Nguyen Hai Phong', 'Phong Nguyen VJS', '24 Banh Van Tran; Tan Binh District, Ho Chi Minh City; Vietnam', '17 Le Duan; Ho Chi Minh City; Vietnam', 2312323452, '500000.00', 0, 'Net 30', '202-555-0194', 3, 'Hoang Hong Hanh', '+84 942444018', 'abc@gmail.com', 'Deleted'),
(2, 'Anh Tran', 'Cong ty TNHH Anh Tran', '42 Ngo Be; Ho Chi Minh City', '105 Cach Mang Thang Tam; Ho Chi Minh City', 5801282228, '234324.00', 0, 'Net 30', '1900 654 321', 3, 'Tran Ha Thanh', '+84 93243561', 'trg@outlook.com.vn', 'Deleted'),
(3, 'Tamy Hotel', 'Cong ty TNHH Tamy Tran', '18 Nguyen Tri Phuong;Can Tho;Vietnam', '490 An Duong Vuong;Dong Thap;Vietnam', 5801282342, '1133232.00', 0, 'Net 50', '202-555-0109', 3, 'Tran Hoang Yen', '+84 934840124', 'trg@outlook.com.vn', 'Active'),
(4, 'Lam Sai Gon Hotel', 'Cong ty TNHH Lam Sai Gon Hotel', '60 Ngo Be; Ho Chi Minh City', '47 Long Hung; Ho Chi Minh City', 3401282228, '513234.00', 0, 'Net 30', '202-555-0137', 8, 'Tran Ha My', '+84 90065002', 'trg@outlook.com.vn4', 'Deleted'),
(5, 'Thanh Thuy', 'Thanh Thuy Hotel & Restaurant', '26 Nguyen Thi Minh Khai; Ho Chi Minh City', '42 Mac Dinh Chi; Ho Chi Minh City', 5823482228, '12312312312.00', 0, 'Net 30', '202-555-0109', 8, 'Pham My Duyen', '+84 123535355', 'trg@outlook.com.vn5', 'Deleted'),
(6, 'Tuan Anh', 'Cong ty TNHH Tuan Anh', '19 Nam Ky Khoi Nghia;Binh Phuoc;Vietnam', '56 Phan Nhu Thach;Dong Thap;Vietnam', 1231282228, '1312314524.00', 0, 'Net 30', '202-555-0131', 8, 'Le Song Anh Thu', '+84 957302423', 'trg@outlook.com.vn', 'Suspended'),
(7, 'Phong Be', 'Phong Be VJS', '20 Co Giang; Ho Chi Minh City', '149/33A6 Banh Van Tran; Ho Chi Minh City', 5801273338, '67867867.00', 0, 'Net 40', '202-555-0131', 8, 'Nguyen Le Huu Tam', '+84 934512422', 'trg@outlook.com.vn7', 'Deleted'),
(8, 'Cong Anh', 'Cong ty TNHH Cong Anh', '120 Dien Bien Phu;Thua Thien-Hue;Vietnam', '11 Tan Thanh;Thanh Hoa;Vietnam', 5801374449, '67867.00', 0, 'Net 15', '202-555-0109', 9, 'Pham Viet Long', '+84 945624450', 'trg@outlook.com.vn', 'Active'),
(9, 'Cuong Nang', 'Phang Nang Cuong VJS', '40 Cong Hoa;Phu Tho;Vietnam', '60 Tran Hung Dao;Da Nang;Vietnam', 7801282228, '786756.00', 0, 'Net 40', '202-555-0128', 9, 'Tran Cong Tuan', '+84 932484019', 'trg@outlook.com.vn', 'Active'),
(10, 'Forrest   ', 'Forrest International', '49 Cong Hoa  ;Binh Duong;Vietnam', '90 Phu Dong Thien Vuong;La Rioja;Argentina', 6901282228, '464645654.00', 12312, 'Net 40', '202-555-0178', 9, 'Nguyen Bich Hoa   ', '+84 92451241   ', 'trg.12@outlook.com.vn', 'Suspended'),
(11, 'Thu Thuy', 'Thuy Thuy Restaurant', '49 Truong Trinh;Can Tho;Vietnam', '49 Xo Viet Nghe Tinh;Ben Tre;Vietnam', 4571282228, '45647897.00', 0, 'Net 15', '+1-202-555-0137', 9, 'Pham Minh Ngoc', '+84 93451242', 'trg@outlook.com.vn', 'Active'),
(12, 'Tuan Hung', 'Cong ty TNHH Tuan Hung', 'RMIT Viet Nam;Quang Tri;Vietnam', 'RMIT Australia;New South Wales;Australia', 1234282228, '7573522345.00', 0, '123123', '+1-202-555-0131', 9, 'Pham Diem Thuy', '+84 93552242', 'trg@outlook.com.vn', 'Suspended'),
(13, 'ABC ', 'ABC Company', '123 Nguyen Thai Binh;Vinh Long;Vietnam', '12 Cu Chi;Vinh Long;Vietnam', 23123131, '123.00', 0, 'Net 15', '+1-202-555-0109', 5, 'Tran Thanh Tung', '093241223', 'thanhtung@yahoo.com', 'Active'),
(14, 'Vinpearl', 'VinGroup', '123 abc street;Ho Chi Minh;Viet Nam', '45 Thai Binh;Nha Trang;VIet Nam', 23123131123, '123.00', 0, '123123', '+1-202-555-0128', 5, 'Pham Hong Thai', '023412344', 'thai.pham@vingroup.com', 'Suspended'),
(15, 'qeqwe', 'qweqwe', 'q13123;123123;qweqwe', '1231;1231;12312', 123123123123, '123123.00', 0, '1231233', '+1-202-555-0131', 5, '123', '1231', '231231', 'Deleted'),
(16, 'Test', 'Test Long', 'Test Street;HCM;Vietnam', 'Te;T;T', 99999999, '50000000.00', 0, 'Te', '202-555-0131', 5, 'TestCP', '0909090909', 'Test@gmail.com', 'Deleted'),
(17, 'Cuong Anh', 'Tran Cuong Anh VJS', '124 Nguyen Van Linh;Ho Chi Minh;Vietnam', 'abc street;Dong Nai;Vietnam', 321321321, '1000000.00', 0, 'Net 15', '+1-202-555-0109', 1, 'Tuan Anh Tran', '0123456789', 'tuananh@tr.vn', 'Active'),
(18, 'Lam', 'Cong ty TNHH Lam ltd', '12 Ngo Be;HCM;Viet nam', '60 Cong Hoa;HCM;Viet Nam', 214214241, '10000000.00', 0, 'Net 30', '202-555-0128', 2, 'Hoang', '093422441', 'abc@g.com', 'Deleted'),
(19, 'Test', 'Lams', 'TE;Ain Defla;Algeria', 'TEst;Tv;Te', 33333, '3452.00', 0, 'Net 30', '202-555-0128', 2, 'TEstT', '2345323453', 'dlam@gmail.com', 'Deleted');

-- --------------------------------------------------------

--
-- Table structure for table `customer_order`
--

CREATE TABLE `customer_order` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_create_date` datetime NOT NULL,
  `order_close_date` datetime DEFAULT NULL,
  `order_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `order_net_total` int(50) NOT NULL,
  `order_tax` int(50) NOT NULL,
  `order_total` bigint(30) NOT NULL,
  `order_shipping_address` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default street; default city; default country',
  `order_reference` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_order`
--

INSERT INTO `customer_order` (`order_id`, `user_id`, `order_create_date`, `order_close_date`, `order_status`, `order_note`, `customer_id`, `order_net_total`, `order_tax`, `order_total`, `order_shipping_address`, `order_reference`) VALUES
(1, 3, '2015-12-24 00:00:00', NULL, 'Deleted', NULL, 1, 900000, 0, 9898978900000, 'default street; default city; default country', 0),
(2, 1, '2016-03-23 12:58:54', '0000-00-00 00:00:00', 'Deleted', '', 1, 0, 0, 24570000, 'default street; default city; default country', 1),
(3, 1, '2016-04-13 04:03:17', '0000-00-00 00:00:00', 'Shipped', 'Test', 1, 0, 0, 107765000, 'default street; default city; default country', 2),
(4, 1, '2016-03-23 12:28:53', '0000-00-00 00:00:00', 'Deleted', '', 1, 0, 0, 0, 'default street; default city; default country', 0),
(5, 1, '2016-03-23 13:13:59', '0000-00-00 00:00:00', 'Deleted', '', 10, 0, 0, 6300000, 'default street; default city; default country', 0),
(6, 1, '2016-03-23 13:14:33', '0000-00-00 00:00:00', 'Processed', '', 10, 0, 0, 6300000, 'default street; default city; default country', 0),
(7, 1, '2016-04-13 03:55:08', '0000-00-00 00:00:00', 'Deleted', '', 3, 0, 0, 374640000, 'default street; default city; default country', 0),
(8, 1, '2016-03-23 14:21:31', '0000-00-00 00:00:00', 'Shipped', '', 3, 0, 0, 23625000, 'default street; default city; default country', 0),
(9, 1, '2016-04-12 20:47:52', '0000-00-00 00:00:00', 'Processed', '', 6, 0, 0, 0, 'default street; default city; default country', 0),
(10, 1, '2016-04-13 03:13:20', '0000-00-00 00:00:00', 'Processed', 'TEST LAM', 7, 0, 0, 26599998, 'default street; default city; default country', 0),
(11, 1, '2016-04-13 03:14:29', '0000-00-00 00:00:00', 'Shipped', 'Test', 2, 0, 0, 228502992, 'default street; default city; default country', 0),
(12, 1, '2016-04-18 23:26:43', '0000-00-00 00:00:00', 'Converted F', 'qweqweqeqqqqqqqqqqqqq', 3, 198000000, 9900000, 207900000, 'default street; default city; default country', 0),
(13, 1, '2016-04-18 23:28:10', '0000-00-00 00:00:00', 'Converted F', 'TEst123124124', 6, 72000000, 3600000, 75600000, 'default street; default city; default country', 0),
(14, 1, '2016-04-18 23:33:58', '0000-00-00 00:00:00', 'Converted F', 'TEst213123', 6, 72000000, 3600000, 75600000, 'default street; default city; default country', 5),
(15, 1, '2016-04-18 23:34:22', '0000-00-00 00:00:00', 'Converted F', 'TEst213123', 6, 72000000, 3600000, 75600000, 'default street; default city; default country', 5),
(16, 1, '2016-04-18 23:35:47', '0000-00-00 00:00:00', 'Converted F', '53533553535', 3, 1998000000, 99900000, 2097900000, 'default street; default city; default country', 4),
(17, 1, '2016-04-18 23:37:56', '0000-00-00 00:00:00', 'Shipped', '1312312312321231212312313123', 4, 773660229, 38683011, 812343240, 'default street; default city; default country', 0),
(18, 1, '2016-04-20 16:05:54', '0000-00-00 00:00:00', 'Shipped', '12213213123123', 3, 34800000, 1740000, 36540000, 'default street; default city; default country', 0),
(19, 1, '2016-05-01 01:35:51', '0000-00-00 00:00:00', 'Processed', 'asdsadsadadasdad', 8, 1041399926, 52069996, 1093469922, '11 Tan Thanh;Vinh Long;Vietnam', 7),
(20, 1, '2016-04-29 16:25:03', '0000-00-00 00:00:00', '', 'testttttttttttttttt', 3, 621000000, 42600000, 663600000, 'default street; default city; default country', 0),
(21, 1, '2016-04-29 16:27:33', '0000-00-00 00:00:00', '', 'testttttttttttttttt', 3, 621000000, 42600000, 663600000, 'default street; default city; default country', 0),
(22, 1, '2016-04-29 16:45:02', '0000-00-00 00:00:00', 'Processed', '123123123123qewqeqweqwewq', 3, 396000000, 26100000, 396000000, '490 An Duong Vuong;Ba Ria-Vung Tau;Vietnam', 0),
(23, 1, '2016-05-01 01:55:18', '0000-00-00 00:00:00', 'Processed', 'adsadasdsad', 13, 279232553, 13961628, 293194181, '12 Cu Chi;Portuguesa;Venezuela', 0);

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `Invoice_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `item_id` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_category_id` int(11) NOT NULL DEFAULT '1',
  `item_name` varchar(90) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_unit_of_measurement` set('pcs') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pcs',
  `item_expiry_period` datetime DEFAULT NULL,
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
  `item_status` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_photo` varchar(70) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`item_id`, `item_category_id`, `item_name`, `item_unit_of_measurement`, `item_expiry_period`, `item_cost`, `item_unit_price`, `item_power`, `item_power_unit`, `item_phase`, `item_voltage_low`, `item_voltage_high`, `item_frequency`, `item_diameter`, `item_capacity`, `item_area`, `item_description`, `item_VAT`, `item_vendor`, `item_manufacturer`, `item_quantity`, `item_allocated_to_customer_order`, `item_status`, `item_photo`) VALUES
('000000222', 1, 'Pump water', 'pcs', '2016-04-11 00:00:00', '10000', '1111', 12.00, 'kwh', 12, 12.00, 12.00, 12.00, 112.00, 12.00, 122.00, 'Description', '10%', 'Pump VJS', 'Black eyes', 1212.00, '0.00', 'Active', 'pump2.jpg'),
('011012', 1, 'Intellflo Pumps', 'pcs', '0000-00-00 00:00:00', '2000000', '3500000', 3.20, 'kW', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'VFD Drive Pool pump', '10%', 'Nguyen Kim', 'Toshiba', 20.00, '0.00', 'Active', NULL),
('011516', 1, 'Whisperflo Pumps', 'pcs', NULL, '1000000', '3000000', 3.00, 'HP', NULL, 203.00, 230.00, NULL, NULL, NULL, NULL, 'PMP WFE-12 Full rated Energy efficient', '5%', 'Phong Vu', 'Hitachi', 30.00, '0.00', 'Active', NULL),
('22011', 1, 'Whisperflo Pumps', 'pcs', NULL, '1000000', '4000000', 5.00, 'HP', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Whisperflo XP Pumps', '5%', 'ABC', 'Toshiba', 0.00, '0.00', 'Active', NULL),
('2433', 1, 'Test', 'pcs', '0000-00-00 00:00:00', '500004', '5000', 2.00, 'kW', 1, 1.00, 2.00, 1.00, 3.00, 1.00, 4.00, 'Test Lam', '4', 'W', 'TEst', 333.00, '0.00', 'Active', ''),
('247928', 1, 'Whisperflo Pumps', 'pcs', NULL, '2000000', '2244244', 1.00, 'HP', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '5%', 'ABC', 'Toshiba', 0.00, '0.00', 'Deleted', NULL),
('340056', 1, 'OPTIFLO PUMPS', 'pcs', NULL, '2000000', '550000', 0.75, 'HP', 1, NULL, 220.00, NULL, NULL, NULL, NULL, NULL, '5%', 'ABC', 'Toshiba', 0.00, '0.00', 'Active', NULL),
('340057', 1, 'OPTIFLO PUMPS', 'pcs', NULL, '200000', '5555000', 1.00, 'HP', 1, NULL, 220.00, NULL, NULL, NULL, NULL, NULL, '5%', 'ABC', 'Toshiba', 0.00, '0.00', 'Active', NULL),
('340058', 1, 'OPTIFLO PUMPS', 'pcs', NULL, '200000', '6000000', 1.50, 'HP', 1, 0.00, 220.00, 50.00, NULL, NULL, NULL, NULL, '5%', 'ABC', 'Toshiba', 0.00, '0.00', 'Active', NULL),
('340095', 1, 'SUPERFLO PUMPS', 'pcs', NULL, '200000', '7000000', 1.00, 'HP', 1, NULL, 220.00, 50.00, NULL, NULL, NULL, NULL, '5%', 'ABC', 'Toshiba', 0.00, '0.00', 'Active', NULL),
('340096', 1, 'SUPERFLO PUMPS', 'pcs', NULL, '200000', '8000000', 1.50, 'HP', 1, NULL, 220.00, 50.00, NULL, NULL, NULL, NULL, '5%', 'ABC', 'Toshiba', 0.00, '0.00', 'Active', NULL),
('340097', 1, 'SUPERFLO PUMPS', 'pcs', NULL, '200000', '4000000', 2.00, 'HP', 1, NULL, 220.00, 50.00, NULL, NULL, NULL, NULL, '5%', 'ABC', 'Toshiba', 0.00, '0.00', 'Active', NULL),
('347926', 1, 'Whisperflo Pumps', 'pcs', NULL, '200000', '6000000', 0.50, 'HP', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '5%', 'ABC', 'Sanyo', 0.00, '0.00', 'Active', NULL),
('347927', 1, 'Whisperflo Pumps', 'pcs', NULL, '200000', '9000000', 0.75, 'HP', 3, NULL, 220.00, 50.00, NULL, NULL, NULL, NULL, '5%', 'ABC', 'Sanyo', 0.00, '0.00', 'Active', NULL),
('347929', 1, 'Whisperflo Pumps', 'pcs', NULL, '200000', '5000000', 1.50, 'HP', 3, NULL, 220.00, 50.00, NULL, NULL, NULL, NULL, '5%', 'ABC', 'Sanyo', 0.00, '0.00', 'Active', 'washer.jpg'),
('347930', 1, 'Whisperflo Pumps', 'pcs', NULL, '200000', '4000000', 2.00, 'HP', 3, NULL, 220.00, 50.00, NULL, NULL, NULL, NULL, '5%', 'ABC', 'Sanyo', 0.00, '0.00', 'Active', NULL),
('F-15TF-AZ', 2, 'Triton II CleatPro - Side Mount - Fiberglass with Valve', 'pcs', NULL, '200000', '2900000', NULL, NULL, NULL, NULL, NULL, NULL, 380.00, 6.00, NULL, NULL, '5%', 'VFC', 'Sanyo', 0.00, '0.00', 'Active', 'pump.jpg'),
('F-19S8-TRV', 2, 'Triton Side Mount-Fiberglass with Valve', 'pcs', NULL, '200000', '4500000', NULL, NULL, NULL, NULL, NULL, NULL, 480.00, 8.50, NULL, NULL, '5%', 'VFC', 'Sanyo', 0.00, '0.00', 'Active', NULL),
('F-19SF-AZ', 2, 'Triton II CleatPro - Side Mount - Fiberglass with Valve', 'pcs', NULL, '200000', '6000000', NULL, NULL, NULL, NULL, NULL, NULL, 480.00, 9.00, NULL, NULL, '5%', 'VFC', 'Sanyo', 0.00, '0.00', 'Active', NULL),
('F-19T6-TAG', 2, 'Tagelus Top Mount- Fiberglass with Valve', 'pcs', NULL, '200000', '3455111', NULL, NULL, NULL, NULL, NULL, NULL, 480.00, 8.50, NULL, NULL, '5%', 'VFC', 'Sanyo', 0.00, '0.00', 'Active', NULL),
('F-19T8-TACP', 2, 'Triton II CleatPro - Side Mount - Fiberglass with Valve', 'pcs', NULL, '200000', '5600000', NULL, NULL, NULL, NULL, NULL, NULL, 480.00, 8.50, NULL, NULL, '5%', 'VFC', 'Sanyo', 0.00, '0.00', 'Active', NULL),
('F-19TF-AZ', 2, 'Triton II CleatPro - Side Mount - Fiberglass with Valve', 'pcs', NULL, '200000', '5000000', NULL, NULL, NULL, NULL, NULL, NULL, 480.00, 9.00, NULL, NULL, '5%', 'VFC', 'Sanyo', 0.00, '0.00', 'Active', NULL),
('F-22SF-AZ', 2, 'Triton II CleatPro - Side Mount - Fiberglass with Valve', 'pcs', NULL, '200000', '5300000', NULL, NULL, NULL, NULL, NULL, NULL, 560.00, 12.00, NULL, NULL, '5%', 'VFC', 'Sanyo', 0.00, '0.00', 'Active', NULL),
('F-22TF-AZ', 2, 'Triton II CleatPro - Side Mount - Fiberglass with Valve', 'pcs', NULL, '200000', '5004565', NULL, NULL, NULL, NULL, NULL, NULL, 560.00, 12.00, NULL, NULL, '5%', 'VFC', 'Samsung', 0.00, '0.00', 'Active', NULL),
('F-24S8-TRCP', 2, 'Triton II CleatPro - Side Mount - Fiberglass with Valve', 'pcs', NULL, '200000', '5000000', NULL, NULL, NULL, NULL, NULL, NULL, 610.00, 14.00, NULL, NULL, '5%', 'VFC', 'Samsung', 0.00, '0.00', 'Active', NULL),
('F-24S8-TRV', 2, 'Triton Side Mount-Fiberglass with Valve', 'pcs', NULL, '200000', '5000000', NULL, NULL, NULL, NULL, NULL, NULL, 610.00, 14.00, NULL, NULL, '5%', 'VFC', 'Samsung', 0.00, '0.00', 'Active', NULL),
('F-24T6-TAG', 2, 'Tagelus Top Mount-Fiberglass with Valve', 'pcs', NULL, '200000', '5000000', NULL, NULL, NULL, NULL, NULL, NULL, 762.00, 22.00, NULL, NULL, '5%', 'VFC', 'Samsung', 0.00, '0.00', 'Active', NULL),
('F-24T8-TACP', 2, 'Triton II CleatPro - Side Mount - Fiberglass with Valve', 'pcs', NULL, '200000', '5000000', NULL, NULL, NULL, NULL, NULL, NULL, 610.00, 14.00, NULL, NULL, '5%', 'VFC', 'Samsung', 0.00, '0.00', 'Active', NULL),
('F-26TF-AZ', 2, 'Triton II CleatPro - Side Mount - Fiberglass with Valve', 'pcs', NULL, '200000', '5000000', NULL, NULL, NULL, NULL, NULL, NULL, 660.00, 16.50, NULL, NULL, '5%', 'VFC', 'Samsung', 0.00, '0.00', 'Active', NULL),
('F-30S-TRV', 2, 'Triton Side Mount-Fiberglass with Valve', 'pcs', NULL, '200000', '5000000', NULL, NULL, NULL, NULL, NULL, NULL, 762.00, 22.00, NULL, NULL, '5%', 'VFC', 'Panasonic', 0.00, '0.00', 'Active', NULL),
('F-30S8-TRCP', 2, 'Triton II CleatPro - Side Mount - Fiberglass with Valve', 'pcs', NULL, '200000', '5000000', NULL, NULL, NULL, NULL, NULL, NULL, 762.00, 22.00, NULL, NULL, '5%', 'VFC', 'Panasonic', 0.00, '0.00', 'Active', NULL),
('F-30SF-AZ', 2, 'Triton II CleatPro - Side Mount - Fiberglass with Valve', 'pcs', NULL, '200000', '5000000', NULL, NULL, NULL, NULL, NULL, NULL, 660.00, 16.50, NULL, NULL, '5%', 'VFC', 'Panasonic', 0.00, '0.00', NULL, NULL),
('F-30T8-TACP', 2, 'Triton II CleatPro - Side Mount - Fiberglass with Valve', 'pcs', NULL, '200000', '5000000', NULL, NULL, NULL, NULL, NULL, NULL, 762.00, 22.00, NULL, NULL, '5%', 'VFC', 'Panasonic', 0.00, '0.00', NULL, NULL),
('F-36S8-TRCP', 2, 'Triton II CleatPro - Side Mount - Fiberglass with Valve', 'pcs', NULL, '200000', '5000000', NULL, NULL, NULL, NULL, NULL, NULL, 914.00, 32.00, NULL, NULL, '5%', 'VFC', 'Panasonic', 0.00, '0.00', NULL, NULL),
('F-36S8-TRV', 2, 'Triton Side Mount-Fiberglass with Valve', 'pcs', NULL, '200000', '5000000', NULL, NULL, NULL, NULL, NULL, NULL, 914.00, 32.00, NULL, NULL, '5%', 'VFC', 'Panasonic', 0.00, '0.00', NULL, NULL),
('F19S8-TRCP', 1, 'TRITON II CleatPro - Side Mount - Fiberglass With Valve', 'pcs', NULL, '200000', '5000000', NULL, '', NULL, NULL, NULL, NULL, 480.00, 8.50, NULL, NULL, '5%', 'VFC', 'Panasonic', 0.00, '0.00', NULL, NULL),
('H-16-0301', 2, 'Triton II CleatPro - Side Mount - Fiberglass with Valve', 'pcs', NULL, '200000', '5000000', NULL, NULL, NULL, NULL, NULL, NULL, 39.00, 39.00, NULL, NULL, '5%', 'VFC', 'Panasonic', 0.00, '0.00', NULL, NULL),
('H-16-0310', 2, 'Triton II CleatPro - Side Mount - Fiberglass with Valve', 'pcs', NULL, '200000', '6700000', NULL, NULL, NULL, NULL, NULL, NULL, 22.30, 20.50, NULL, NULL, '5%', 'VFC', 'Panasonic', 0.00, '0.00', NULL, NULL),
('H-16-0314', 2, 'Triton II CleatPro - Side Mount - Fiberglass with Valve', 'pcs', NULL, '200000', '5000000', NULL, NULL, NULL, NULL, NULL, NULL, 4.60, 11.30, NULL, NULL, '5%', 'VFC', 'Panasonic', 0.00, '0.00', NULL, NULL),
('H-16-0315', 2, 'Triton II CleatPro - Side Mount - Fiberglass with Valve', 'pcs', NULL, '200000', '5000000', NULL, NULL, NULL, NULL, NULL, NULL, 7.00, 17.00, NULL, NULL, '5%', 'VFC', 'Panasonic', 0.00, '0.00', NULL, NULL),
('H-16-0316', 2, 'Triton II CleatPro - Side Mount - Fiberglass with Valve', 'pcs', NULL, '200000', '5000000', NULL, NULL, NULL, NULL, NULL, NULL, 9.30, 22.70, NULL, NULL, '5%', 'VFC', 'Panasonic', 0.00, '0.00', NULL, NULL),
('H-16-0317', 2, 'Triton II CleatPro - Side Mount - Fiberglass with Valve', 'pcs', NULL, '200000', '6700000', NULL, NULL, NULL, NULL, NULL, NULL, 13.90, 34.00, NULL, NULL, '5%', 'VFC', 'Panasonic', 0.00, '0.00', NULL, NULL),
('H-16-0318', 2, 'Triton II CleatPro - Side Mount - Fiberglass with Valve', 'pcs', NULL, '0', '6700000', NULL, NULL, NULL, NULL, NULL, NULL, 18.60, 34.00, NULL, NULL, '5%', 'VFC', 'Panasonic', 0.00, '0.00', NULL, NULL),
('H-16-0332', 2, 'Triton II CleatPro - Side Mount - Fiberglass with Valve', 'pcs', NULL, '0', '6700000', NULL, NULL, NULL, NULL, NULL, NULL, 48.30, 48.30, NULL, NULL, '5%', 'VFC', 'Panasonic', 0.00, '0.00', NULL, NULL),
('H-16-0340', 2, 'Triton II CleatPro - Side Mount - Fiberglass with Valve', 'pcs', NULL, '0', '6700000', NULL, NULL, NULL, NULL, NULL, NULL, 29.70, 29.70, NULL, NULL, '5%', 'VFC', 'Panasonic', 0.00, '0.00', NULL, NULL),
('P-UFLB-071', 1, 'ULTRAFLO- Pentair Pool Product', 'pcs', NULL, '0', '6700000', 0.55, 'kW', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '5%', 'VFC', 'Panasonic', 0.00, '0.00', NULL, NULL),
('P-UFLB-073', 1, 'ULTRAFLO BOOSTER - Pentair Pool Products', 'pcs', NULL, '0', '6700000', 0.55, 'kW', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '5%', 'AFC', 'LG', 0.00, '0.00', NULL, NULL),
('P-UFLB-101', 1, 'ULTRAFLO BOOSTER - Pentair Pool Products', 'pcs', NULL, '0', '6700000', 0.75, 'kW', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '5%', 'AFC', 'LG', 0.00, '0.00', NULL, NULL),
('P-UFLB-103E2*', 1, 'ULTRAFLO BOOSTER - Pentair Pool Products', 'pcs', NULL, '0', '6700000', 0.75, 'kW', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '5%', 'AFC', 'LG', 0.00, '0.00', NULL, NULL),
('P-UFLB-151', 1, 'ULTRAFLO BOOSTER - Pentair Pool Products', 'pcs', NULL, '0', '6700000', 1.10, 'kW', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '5%', 'AFC', 'LG', 0.00, '0.00', NULL, NULL),
('P-UFLB-153E2*', 1, 'ULTRAFLO BOOSTER - Pentair Pool Products', 'pcs', NULL, '0', '670000', 1.10, 'kW', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '5%', 'AFC', 'LG', 0.00, '0.00', NULL, NULL),
('P-UFLB-201', 1, 'ULTRAFLO BOOSTER - Pentair Pool Products', 'pcs', NULL, '0', '670000', 1.50, 'kW', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '5%', 'AFC', 'LG', 0.00, '0.00', NULL, NULL),
('P-UFLB-203E2*', 1, 'ULTRAFLO BOOSTER - Pentair Pool Products', 'pcs', NULL, '0', '970000', 1.50, 'kW', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '5%', 'AFC', 'LG', 0.00, '0.00', NULL, NULL),
('P-UFLB-301', 1, 'ULTRAFLO BOOSTER - Pentair Pool Products', 'pcs', NULL, '0', '670000', 2.20, 'kW', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '5%', 'AFC', 'LG', 0.00, '0.00', NULL, NULL),
('P-UFLB-303E2*', 1, 'ULTRAFLO BOOSTER - Pentair Pool Products', 'pcs', NULL, '0', '670000', 2.20, 'kW', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '5%', 'AFC', 'LG', 0.00, '0.00', NULL, NULL),
('P-WFL-071', 1, 'WHISPERFLO- Pentair Pool Product', 'pcs', NULL, '0', '670000', 0.55, 'kW', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '5%', 'AFC', 'LG', 0.00, '0.00', NULL, NULL),
('P-WFL-073', 1, 'WHISPERFLO- Pentair Pool Product', 'pcs', NULL, '0', '670000', 0.55, 'kW', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '5%', 'AFC', 'LG', 0.00, '0.00', NULL, NULL),
('P-WFL-101', 1, 'WHISPERFLO- Pentair Pool Product', 'pcs', NULL, '0', '670000', 0.75, 'kW', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '5%', 'AFC', 'LG', 0.00, '0.00', NULL, NULL),
('P-WFL-103E2*', 1, 'WHISPERFLO- Pentair Pool Product', 'pcs', NULL, '0', '670000', 0.75, 'kW', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '5%', 'AFC', 'LG', 0.00, '0.00', NULL, NULL),
('P-WFL-151', 1, 'WHISPERFLO- Pentair Pool Product', 'pcs', NULL, '0', '670000', 1.10, 'kW', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '5%', 'AFC', 'LG', 0.00, '0.00', NULL, NULL),
('P-WFL-153E2*', 1, 'WHISPERFLO- Pentair Pool Product', 'pcs', NULL, '0', '670000', 1.10, 'kW', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '5%', 'AFC', 'LG', 0.00, '0.00', NULL, NULL),
('P-WFL-201', 1, 'WHISPERFLO- Pentair Pool Product', 'pcs', NULL, '0', '670000', 1.50, 'kW', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '5%', 'AFC', 'LG', 0.00, '0.00', NULL, NULL),
('P-WFL-203E2*', 1, 'WHISPERFLO- Pentair Pool Product', 'pcs', NULL, '0', '670000', 1.50, 'kW', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '5%', 'AFC', 'LG', 0.00, '0.00', NULL, NULL),
('P-WFL-301', 1, 'WHISPERFLO- Pentair Pool Product', 'pcs', NULL, '0', '6700000', 2.20, 'kW', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '5%', 'AFC', 'LG', 0.00, '0.00', NULL, NULL),
('P-WFL-303E2*', 1, 'WHISPERFLO- Pentair Pool Product', 'pcs', NULL, '0', '6700000', 2.20, 'kW', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '5%', 'AFC', 'Sharp', 0.00, '0.00', NULL, NULL),
('R111316', 3, 'Maintenance and Safety equipment', 'pcs', NULL, '0', '6700000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Pool Brush, aluminum back 18"', '5%', 'AFC', 'Sharp', 0.00, '0.00', NULL, NULL),
('R111366', 3, 'Maintenance and Safety equipment', 'pcs', NULL, '0', '6700000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Pool Brush, molded plastic back 18"', '5%', 'AFC', 'Sharp', 0.00, '0.00', NULL, NULL),
('R111616', 3, 'Maintenance and Safety equipment', 'pcs', NULL, '0', '6700000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Algae Brush, Aluminum back 6"', '5%', 'AFC', 'Sharp', 0.00, '0.00', NULL, NULL),
('R12126', 3, 'Maintenance and Safety equipment', 'pcs', NULL, '0', '6700000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Leaf rake 123', '5%', 'AFC', 'Sharp', 0.00, '0.00', NULL, NULL),
('R12166', 3, 'Maintenance and Safety equipment', 'pcs', NULL, '0', '6700000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Leaf skimmer 142S magnet', '5%', 'AFC', 'Sharp', 0.00, '0.00', NULL, NULL),
('R141106', 3, 'Maintenance and Safety equipment', 'pcs', NULL, '0', '6700000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Floating themometer', '5%', 'AFC', 'Sharp', 0.00, '0.00', NULL, NULL),
('R151076', 3, 'Maintenance and Safety equipment', 'pcs', NULL, '0', '670000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Test kit 2 in 1', '5%', 'AFC', 'Sharp', 0.00, '0.00', NULL, NULL),
('R161018', 3, 'Maintenance and Safety equipment', 'pcs', NULL, '0', '6700000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1/2 ounce Penol red Solution', '5%', 'AFC', 'Sharp', 0.00, '0.00', NULL, NULL),
('R17086', 3, 'Maintenance and Safety equipment', 'pcs', NULL, '0', '6700000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Floating tablet dispenser', '5%', 'AFC', 'Sharp', 0.00, '0.00', NULL, NULL),
('R191306', 3, 'Maintenance and Safety equipment', 'pcs', NULL, '0', '6700000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Telescopic handle 2-pc 8-15.5 ft', '5%', 'AFC', 'Sharp', 0.00, '0.00', NULL, NULL),
('R1913880', 3, 'Maintenance and Safety equipment', 'pcs', NULL, '0', '7700000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Telescopic handle 2-pc 12-36 ft, -3pcs', '5%', 'AFC', 'Sharp', 0.00, '0.00', NULL, NULL),
('R201060', 3, 'Maintenance and Safety equipment', 'pcs', NULL, '0', '6700000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Vaccum head 201 Flex-A-Vac', '5%', 'AFC', 'Sharp', 0.00, '0.00', NULL, NULL),
('R201350', 3, 'Maintenance and Safety equipment', 'pcs', NULL, '0', '6700000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Vaccum head 193 brush', '5%', 'AFC', 'Sharp', 0.00, '0.00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `item_category`
--

CREATE TABLE `item_category` (
  `item_category_id` int(11) NOT NULL,
  `item_category_name` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL
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

CREATE TABLE `item_storage_location` (
  `item_storage_location_id` int(11) NOT NULL,
  `item_id` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `storage_location_id` int(11) NOT NULL,
  `item_storage_location_quantity` int(50) NOT NULL DEFAULT '15'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `item_storage_location`
--

INSERT INTO `item_storage_location` (`item_storage_location_id`, `item_id`, `storage_location_id`, `item_storage_location_quantity`) VALUES
(1, '340056', 1, 15),
(2, '340057', 2, 15),
(3, '340058', 3, 15),
(4, '340095', 4, 15),
(5, '340096', 5, 15),
(6, '340097', 6, 15),
(7, 'F19S8-TRCP', 7, 15),
(8, 'P-UFLB-071', 8, 15),
(9, 'P-UFLB-073', 9, 15),
(10, 'P-UFLB-101', 10, 15),
(11, 'P-UFLB-103E2*', 11, 15),
(12, 'P-UFLB-151', 12, 15),
(15, '340096', 11, 15),
(16, '347930', 1, 15);

-- --------------------------------------------------------

--
-- Table structure for table `item_warehouse`
--

CREATE TABLE `item_warehouse` (
  `warehouse_id` int(11) NOT NULL,
  `item_id` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL
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

CREATE TABLE `order_line` (
  `order_line_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_line_create_date` datetime NOT NULL,
  `order_line_item_id` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_line_item_quantity` int(11) NOT NULL,
  `order_line_item_issued_quantity` int(11) NOT NULL DEFAULT '0',
  `order_line_deliver_date` datetime NOT NULL,
  `order_line_selling_price` decimal(30,2) NOT NULL,
  `order_line_net_selling_price` decimal(30,2) NOT NULL,
  `order_line_deliver_status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'partially'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_line`
--

INSERT INTO `order_line` (`order_line_id`, `order_id`, `order_line_create_date`, `order_line_item_id`, `order_line_item_quantity`, `order_line_item_issued_quantity`, `order_line_deliver_date`, `order_line_selling_price`, `order_line_net_selling_price`, `order_line_deliver_status`) VALUES
(1, 1, '2015-12-24 00:00:00', '340056', 2, 0, '2015-12-31 00:00:00', '0.00', '0.00', 'partially'),
(2, 1, '2016-03-23 12:27:53', '011012', 2, 0, '0000-00-00 00:00:00', '3500000.00', '7000000.00', 'partially'),
(3, 1, '2015-12-31 00:00:00', 'F19S8-TRCP', 5, 0, '2016-01-14 00:00:00', '0.00', '0.00', 'partially'),
(4, 2, '2016-03-23 12:58:54', 'H-16-0316', 2, 0, '2016-01-13 00:00:00', '5000000.00', '10000000.00', 'partially'),
(5, 2, '2016-03-23 12:58:54', 'P-UFLB-103E2*', 2, 0, '2015-12-30 00:00:00', '6700000.00', '13400000.00', 'partially'),
(6, 3, '2016-04-13 04:03:17', 'H-16-0340', 2, 0, '2015-12-30 00:00:00', '6700000.00', '13400000.00', 'partially'),
(7, 3, '2016-04-13 04:03:17', '011012', 2, 0, '2015-12-30 00:00:00', '3500000.00', '7000000.00', 'partially'),
(8, 4, '2016-03-23 12:28:53', '340058', 2, 0, '2015-12-30 00:00:00', '6000000.00', '12000000.00', 'partially'),
(9, 7, '2016-04-13 03:55:08', 'F-15TF-AZ', 123, 0, '2016-04-20 00:00:00', '2900000.00', '356800000.00', 'partially'),
(10, 8, '2016-03-23 14:21:31', 'F-19S8-TRV', 5, 0, '2016-03-23 00:00:00', '4500000.00', '22500000.00', 'partially'),
(11, 9, '2016-04-12 20:47:52', 'F-19T8-TACP', 3, 0, '0000-00-00 00:00:00', '5600000.00', '16800000.00', 'partially'),
(12, 10, '2016-04-13 03:13:20', 'F-19SF-AZ', 4, 0, '2016-04-20 00:00:00', '6000000.00', '24000000.00', 'partially'),
(13, 11, '2016-04-13 03:14:29', '22011', 22, 0, '2016-04-04 00:00:00', '33333.00', '733326.00', 'partially'),
(14, 11, '2016-04-13 03:26:59', 'H-16-0318', 21, 0, '0000-00-00 00:00:00', '6700000.00', '140700000.00', 'partially'),
(15, 3, '2016-04-13 04:03:17', 'H-16-0340', 5, 0, '2015-12-30 00:00:00', '6700000.00', '33500000.00', 'partially'),
(16, 3, '2016-04-13 04:03:17', 'H-16-0340', 2, 0, '2015-12-30 00:00:00', '6700000.00', '13400000.00', 'partially'),
(17, 3, '2016-04-13 04:03:17', 'F-30T8-TACP', 4, 0, '2016-04-06 00:00:00', '5000000.00', '20000000.00', 'partially'),
(18, 3, '2016-04-13 04:03:13', 'H-16-0316', 3, 0, '2016-04-26 00:00:00', '5000000.00', '15000000.00', 'partially'),
(19, 3, '2016-04-13 04:03:17', 'H-16-0316', 3, 0, '2016-04-26 00:00:00', '5000000.00', '15000000.00', 'partially'),
(20, 12, '2016-04-18 23:26:43', '000000222', 66, 0, '2016-04-30 00:00:00', '3000000.00', '198000000.00', 'partially'),
(21, 13, '2016-04-18 23:28:10', '000000222', 12, 0, '2016-04-30 00:00:00', '6000000.00', '72000000.00', 'partially'),
(22, 14, '2016-04-18 23:33:58', '000000222', 12, 0, '2016-04-30 00:00:00', '6000000.00', '72000000.00', 'partially'),
(23, 15, '2016-04-18 23:34:22', '000000222', 12, 0, '2016-04-30 00:00:00', '6000000.00', '72000000.00', 'partially'),
(24, 16, '2016-04-18 23:35:47', '000000222', 666, 0, '0000-00-00 00:00:00', '3000000.00', '1998000000.00', 'partially'),
(25, 17, '2016-04-18 23:37:56', 'F-19S8-TRV', 89, 0, '0000-00-00 00:00:00', '4500000.00', '400500000.00', 'partially'),
(26, 17, '2016-04-18 23:37:56', '247928', 21, 0, '0000-00-00 00:00:00', '2244244.00', '47129124.00', 'partially'),
(27, 17, '2016-04-18 23:37:56', '340097', 34, 0, '0000-00-00 00:00:00', '4000000.00', '136000000.00', 'partially'),
(28, 17, '2016-04-18 23:37:56', 'F-19T6-TAG', 55, 0, '0000-00-00 00:00:00', '3455111.00', '190031105.00', 'partially'),
(29, 18, '2016-04-20 16:05:54', 'F-15TF-AZ', 12, 0, '2016-04-30 00:00:00', '2900000.00', '34800000.00', 'partially'),
(30, 19, '2016-05-01 01:35:51', 'F-19S8-TRV', 13, 0, '2016-05-04 00:00:00', '4500000.00', '200000000.00', 'partially'),
(31, 19, '2016-05-01 01:35:51', '347930', 222, 0, '2016-05-24 00:00:00', '4000000.00', '7399926.00', 'partially'),
(32, 19, '2016-05-01 01:35:51', 'F-19S8-TRV', 13, 0, '2016-05-17 00:00:00', '4500000.00', '200000000.00', 'partially'),
(33, 19, '2016-05-01 01:35:51', '347930', 222, 0, '2016-05-03 00:00:00', '4000000.00', '7399926.00', 'partially'),
(34, 19, '2016-05-01 01:35:51', '340058', 123, 0, '2016-05-12 00:00:00', '6000000.00', '738000000.00', 'partially'),
(35, 19, '2016-05-01 01:35:51', '340096', 12, 0, '2016-05-06 00:00:00', '8000000.00', '96000000.00', 'partially'),
(36, 19, '2016-05-01 01:35:51', 'F-19S8-TRV', 13, 0, '2016-05-12 00:00:00', '4500000.00', '200000000.00', 'partially'),
(37, 19, '2016-05-01 01:35:51', '347930', 222, 0, '2016-05-25 00:00:00', '4000000.00', '7399926.00', 'partially'),
(38, 19, '2016-05-01 01:35:51', 'F-19S8-TRV', 13, 0, '2016-05-10 00:00:00', '4500000.00', '200000000.00', 'partially'),
(39, 19, '2016-05-01 01:35:51', '347930', 222, 0, '2016-05-25 00:00:00', '4000000.00', '7399926.00', 'partially'),
(40, 19, '2016-05-01 01:35:51', '340058', 123, 0, '2016-05-31 00:00:00', '6000000.00', '738000000.00', 'partially'),
(41, 19, '2016-05-01 01:35:51', '340096', 12, 0, '2016-05-31 00:00:00', '8000000.00', '96000000.00', 'partially'),
(42, 22, '2016-04-29 16:45:02', '011012', 11, 0, '2016-05-01 00:00:00', '3500000.00', '38500000.00', 'partially'),
(43, 22, '2016-04-29 16:45:02', '011012', 12, 0, '2016-05-02 00:00:00', '3500000.00', '42000000.00', 'partially'),
(44, 22, '2016-04-29 16:45:02', '011012', 13, 0, '2016-05-03 00:00:00', '3500000.00', '45500000.00', 'partially'),
(45, 22, '2016-04-29 16:45:02', '011516', 21, 0, '2016-05-01 00:00:00', '3000000.00', '63000000.00', 'partially'),
(46, 22, '2016-04-29 16:45:02', '011516', 22, 0, '2016-05-02 00:00:00', '3000000.00', '66000000.00', 'partially'),
(47, 22, '2016-04-29 16:45:02', '011516', 23, 0, '2016-05-03 00:00:00', '3000000.00', '69000000.00', 'partially'),
(48, 22, '2016-04-29 16:45:02', '011516', 24, 0, '2016-05-04 00:00:00', '3000000.00', '72000000.00', 'partially'),
(49, 23, '2016-05-01 01:55:18', '340057', 23, 0, '2016-05-11 00:00:00', '5555000.00', '127765000.00', 'Delivered'),
(50, 23, '2016-05-01 01:55:18', 'F-19T6-TAG', 23, 0, '2016-05-19 00:00:00', '3455111.00', '79467553.00', 'Shipped'),
(51, 23, '2016-05-01 01:55:18', '340058', 12, 0, '2016-05-14 00:00:00', '6000000.00', '72000000.00', 'partially');

-- --------------------------------------------------------

--
-- Table structure for table `quotation`
--

CREATE TABLE `quotation` (
  `quotation_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `quotation_create_date` datetime NOT NULL,
  `quotation_close_date` datetime DEFAULT NULL,
  `quotation_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `quotation_note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quotation_net_total` int(50) NOT NULL,
  `quotation_tax` int(50) NOT NULL,
  `quotation_total` double(70,2) NOT NULL,
  `quotation_shipping_address` varchar(250) NOT NULL DEFAULT '	default street; default city; default country'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `quotation`
--

INSERT INTO `quotation` (`quotation_id`, `user_id`, `customer_id`, `quotation_create_date`, `quotation_close_date`, `quotation_status`, `quotation_note`, `quotation_net_total`, `quotation_tax`, `quotation_total`, `quotation_shipping_address`) VALUES
(1, 1, 4, '2016-04-21 12:55:09', '0000-00-00 00:00:00', 'Converted', '8798789789798789789789', 522550000, 26127500, 548677500.00, '	default street; default city; default country'),
(2, 1, 4, '2016-04-13 04:04:12', '0000-00-00 00:00:00', 'Deleted', '', 0, 0, 2315669922.00, '	default street; default city; default country'),
(3, 1, 2, '2016-03-23 00:52:58', '0000-00-00 00:00:00', 'Deleted', '', 0, 0, 0.00, '	default street; default city; default country'),
(4, 1, 3, '2016-04-18 23:35:40', '0000-00-00 00:00:00', 'Deleted', '53533553535', 1998000000, 99900000, 2097900000.00, '	default street; default city; default country'),
(5, 1, 6, '2016-04-13 03:11:48', '0000-00-00 00:00:00', 'Deleted', 'TEst', 0, 0, 7428154.00, '	default street; default city; default country'),
(6, 1, 6, '2016-04-13 03:17:03', '0000-00-00 00:00:00', 'Deleted', 'Test Lam 2', 0, 0, 0.00, '	default street; default city; default country'),
(7, 1, 8, '2016-04-23 23:07:36', '0000-00-00 00:00:00', 'Converted', 'asdsadsadadasdad', 1041399926, 52069996, 1093469922.30, '	default street; default city; default country'),
(8, 1, 11, '2016-04-20 15:27:11', '0000-00-00 00:00:00', 'Waiting', 'ererererererer', 540420000, 27021000, 567441000.00, '	default street; default city; default country'),
(9, 1, 3, '2016-04-20 15:28:55', '0000-00-00 00:00:00', 'Deleted', 'yuyiuyiuyiuyiuyuiy', 206360000, 10318000, 216678000.00, '	default street; default city; default country'),
(10, 1, 2, '2016-04-20 15:32:47', '0000-00-00 00:00:00', 'Converted', 'testfihlkjlk', 1092720000, 54636000, 1147356000.00, '	default street; default city; default country'),
(11, 1, 2, '2016-04-20 15:41:39', '0000-00-00 00:00:00', 'Waiting', '111111111111111111', 34800000, 1740000, 36540000.00, '	default street; default city; default country'),
(12, 1, 13, '2016-04-20 15:47:50', '0000-00-00 00:00:00', 'Closed', '4524525245245', 130500000, 6525000, 137025000.00, '	default street; default city; default country'),
(13, 1, 16, '2016-04-20 15:48:50', '0000-00-00 00:00:00', 'Deleted', 'okokokok', 4950000, 247500, 5197500.00, '	default street; default city; default country'),
(14, 1, 5, '2016-04-20 15:50:49', '0000-00-00 00:00:00', 'Closed', '123213123123', 54000000, 2700000, 56700000.00, '	default street; default city; default country'),
(15, 1, 3, '2016-04-20 16:06:53', '0000-00-00 00:00:00', 'Converted', '123123123', 48000000, 2400000, 50400000.00, '	default street; default city; default country'),
(16, 1, 10, '2016-04-20 16:11:13', '0000-00-00 00:00:00', 'Converted', '1231231231', 738000000, 36900000, 774900000.00, '	default street; default city; default country'),
(17, 1, 8, '2016-05-01 01:38:50', '0000-00-00 00:00:00', 'Deleted', 'qeqweqe', 309250000, 15462500, 324712500.00, '	default street; default city; default country'),
(18, 1, 8, '2016-05-01 01:45:21', '0000-00-00 00:00:00', 'Deleted', '1213123', 287000000, 14350000, 301350000.00, '11 Tan Thanh;Miranda;Venezuela'),
(19, 1, 11, '2016-05-01 01:47:43', '0000-00-00 00:00:00', 'Waiting', '22112211', 192000000, 9600000, 201600000.00, '49 Xo Viet Nghe Tinh;Nueva Esparta;Venezuela');

-- --------------------------------------------------------

--
-- Table structure for table `quotation_line`
--

CREATE TABLE `quotation_line` (
  `quotation_line_id` int(11) NOT NULL,
  `quotation_line_estimate_price` double(30,2) NOT NULL,
  `quotation_line_estimate_net_price` double(30,2) NOT NULL,
  `quotation_line_item_total_value` int(11) NOT NULL,
  `quotation_id` int(11) NOT NULL,
  `quotation_line_create_date` date NOT NULL,
  `quotation_line_item_id` varchar(25) NOT NULL,
  `quotation_line_item_quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `quotation_line`
--

INSERT INTO `quotation_line` (`quotation_line_id`, `quotation_line_estimate_price`, `quotation_line_estimate_net_price`, `quotation_line_item_total_value`, `quotation_id`, `quotation_line_create_date`, `quotation_line_item_id`, `quotation_line_item_quantity`) VALUES
(1, 5000000.00, 180000000.00, 0, 1, '2016-04-21', '347929', 36),
(2, 2900000.00, 29000000.00, 0, 1, '2016-04-21', 'F-15TF-AZ', 10),
(3, 4500000.00, 200000000.00, 0, 7, '2016-04-23', 'F-19S8-TRV', 13),
(4, 4000000.00, 7399926.00, 0, 7, '2016-04-23', '347930', 222),
(5, 3000000.00, 1998000000.00, 0, 8, '2016-04-18', '011516', 666),
(6, 6000000.00, 26884.00, 0, 8, '2016-04-13', 'F-19SF-AZ', 1222),
(35, 4500000.00, 200000000.00, 0, 7, '2016-04-23', 'F-19S8-TRV', 13),
(36, 4000000.00, 7399926.00, 0, 7, '2016-04-23', '347930', 222),
(37, 6000000.00, 738000000.00, 0, 7, '2016-04-23', '340058', 123),
(38, 8000000.00, 96000000.00, 0, 7, '2016-04-23', '340096', 12),
(39, 4500000.00, 200000000.00, 0, 7, '2016-04-23', 'F-19S8-TRV', 13),
(40, 4000000.00, 7399926.00, 0, 7, '2016-04-23', '347930', 222),
(41, 4500000.00, 200000000.00, 0, 7, '2016-04-23', 'F-19S8-TRV', 13),
(42, 4000000.00, 7399926.00, 0, 7, '2016-04-23', '347930', 222),
(43, 6000000.00, 738000000.00, 0, 7, '2016-04-23', '340058', 123),
(44, 8000000.00, 96000000.00, 0, 7, '2016-04-23', '340096', 12),
(45, 0.00, 0.00, 0, 17, '2016-05-01', 'Array', 0),
(46, 0.00, 0.00, 0, 17, '2016-05-01', 'Array', 0),
(47, 0.00, 0.00, 0, 17, '2016-05-01', 'Array', 0),
(48, 0.00, 0.00, 0, 18, '2016-05-01', 'Array', 0),
(49, 0.00, 0.00, 0, 18, '2016-05-01', 'Array', 0),
(50, 0.00, 0.00, 0, 18, '2016-05-01', 'Array', 0),
(51, 5000000.00, 60000000.00, 0, 19, '2016-05-01', '347929', 12),
(52, 6000000.00, 132000000.00, 0, 19, '2016-05-01', 'F-19SF-AZ', 22);

-- --------------------------------------------------------

--
-- Table structure for table `sale_transaction`
--

CREATE TABLE `sale_transaction` (
  `sale_transaction_id` int(11) NOT NULL,
  `order_line_id` int(11) NOT NULL,
  `sale_transaction_create_date` date NOT NULL,
  `sale_transaction_close_date` date DEFAULT NULL,
  `sale_transaction_status` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sale_transaction_level` int(11) DEFAULT NULL,
  `sale_transaction_note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sale_transaction_user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

CREATE TABLE `staff` (
  `staff_id` int(4) NOT NULL,
  `staff_name` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `staff_position` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `staff_start_date` date NOT NULL,
  `staff_end_date` date DEFAULT NULL,
  `staff_supervisor_id` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

CREATE TABLE `storage_location` (
  `storage_location_id` int(11) NOT NULL,
  `storage_location_shelf` int(11) NOT NULL,
  `storage_location_row` int(11) NOT NULL,
  `storage_location_column` int(11) NOT NULL,
  `storage_location_condition` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `storage_location_warehouse_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `storage_location`
--

INSERT INTO `storage_location` (`storage_location_id`, `storage_location_shelf`, `storage_location_row`, `storage_location_column`, `storage_location_condition`, `storage_location_warehouse_id`) VALUES
(1, 1, 1, 1, 'Deleted', 1),
(2, 2, 12, 2, 'Active', 1),
(3, 1, 1, 3, 'Active', 1),
(4, 2, 1, 1, 'Active', 1),
(5, 2, 1, 2, 'Active', 1),
(6, 2, 1, 3, 'Active', 1),
(7, 1, 1, 1, 'Active', 2),
(8, 1, 2, 1, 'Active', 2),
(9, 1, 3, 1, 'Active', 2),
(10, 2, 1, 1, 'Active', 2),
(11, 2, 2, 1, 'Active', 2),
(12, 2, 3, 1, 'Active', 2),
(13, 5, 5, 5, 'Active', 14),
(14, 1, 1, 2, 'Active', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_password` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `staff_id` int(11) NOT NULL,
  `user_create_date` date NOT NULL,
  `user_delete_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

CREATE TABLE `warehouse` (
  `warehouse_id` int(11) NOT NULL,
  `warehouse_location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `warehouse_capacity` int(11) NOT NULL,
  `warehouse_current_capacity` int(11) NOT NULL DEFAULT '0',
  `warehouse_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `warehouse_supervisor_id` int(11) NOT NULL,
  `warehouse_item_category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `warehouse`
--

INSERT INTO `warehouse` (`warehouse_id`, `warehouse_location`, `warehouse_capacity`, `warehouse_current_capacity`, `warehouse_name`, `warehouse_supervisor_id`, `warehouse_item_category`) VALUES
(1, 'location test 1;Rock Sound;Bahamas', 1000, 212, 'Warehouse 1', 5, '1'),
(2, 'location_test_23;Rock Sound;Bahamas', 1000, 599, 'Warehouse 2', 6, '3'),
(9, '123213;Ararat;Armenia', 123, 68, 'Warehouse 3', 1, '2;3'),
(10, '123213;Ararat;Armenia', 123, 67, 'Warehouse 4', 1, '2;3'),
(11, '123213123123123;Rock Sound;Bahamas', 123, 10, 'Warehouse 5', 1, '2;3'),
(12, '123213;Ararat;Armenia', 123, 32, 'Warehouse 11', 1, '2;3'),
(13, '123213;Noakhali;Bangladesh', 123, 41, 'Warehouse 14', 1, '2;3'),
(14, '1231;Mayaguana;Bahamas', 123, 51, 'Warehouse 897', 2, '1;2'),
(15, '1231;Berat;Albania', 123, 23, 'Warehouse 367', 2, '1;2'),
(16, 'qweqeqeq;Mykines;Faroe Islands', 23333, 1800, 'Warehouse 211', 10, '2'),
(17, 'Test;Delvine;Albania', 100, 90, 'Warehouse 113', 9, '1;3');

-- --------------------------------------------------------

--
-- Table structure for table `warehouse_transaction`
--

CREATE TABLE `warehouse_transaction` (
  `warehouse_transaction_id` int(11) NOT NULL,
  `warehouse_transaction_create_date` datetime NOT NULL,
  `warehouse_transaction_close_date` datetime DEFAULT NULL,
  `warehouse_transaction_user_id` int(11) NOT NULL,
  `warehouse_transaction_order_id` int(11) DEFAULT NULL,
  `warehouse_transaction_status` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `warehouse_transaction_type` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `warehouse_transaction_total_value` double(70,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `warehouse_transaction`
--

INSERT INTO `warehouse_transaction` (`warehouse_transaction_id`, `warehouse_transaction_create_date`, `warehouse_transaction_close_date`, `warehouse_transaction_user_id`, `warehouse_transaction_order_id`, `warehouse_transaction_status`, `warehouse_transaction_type`, `warehouse_transaction_total_value`) VALUES
(1, '2015-12-28 00:00:00', NULL, 1, 0, 'pending', 'normal', 0),
(2, '2015-12-28 00:00:00', NULL, 3, 0, 'pending', 'normal', 0),
(3, '2015-12-28 00:00:00', NULL, 1, 0, 'pending', 'normal', 0),
(4, '2015-12-28 00:00:00', '2015-12-31 00:00:00', 1, 0, 'closed', 'normal', 0),
(5, '2015-12-28 00:00:00', NULL, 4, 0, 'pending', 'normal', 0),
(6, '2015-12-28 00:00:00', '0000-00-00 00:00:00', 1, 0, 'abc', 'Receipt', 900000),
(7, '2015-12-28 00:00:00', '0000-00-00 00:00:00', 1, 0, 'abc', 'Receipt', 900000),
(8, '2016-04-10 15:51:27', '0000-00-00 00:00:00', 1, 0, 'pending', 'Receipt', 264),
(9, '2016-04-10 16:03:22', '0000-00-00 00:00:00', 1, 0, NULL, 'Receipt', 264),
(10, '2016-04-10 16:03:52', '0000-00-00 00:00:00', 1, 0, NULL, 'Receipt', 264),
(11, '2016-04-10 16:04:46', '0000-00-00 00:00:00', 1, 0, NULL, 'Receipt', 264),
(12, '2016-04-10 16:05:34', '0000-00-00 00:00:00', 1, 0, NULL, 'Receipt', 264),
(13, '2016-04-10 16:14:58', '0000-00-00 00:00:00', 1, 0, NULL, 'Receipt', 486220),
(14, '2016-04-10 16:17:26', '0000-00-00 00:00:00', 1, 0, NULL, 'Receipt', 61000),
(15, '2016-04-29 00:00:00', NULL, 2, 19, 'active', 'issue', 12000000);

-- --------------------------------------------------------

--
-- Table structure for table `warehouse_transaction_line`
--

CREATE TABLE `warehouse_transaction_line` (
  `warehouse_transaction_line_id` int(90) NOT NULL,
  `warehouse_transaction_line_item_id` varchar(25) NOT NULL,
  `warehouse_transaction_line_quantity` int(11) NOT NULL,
  `warehouse_transaction_line_date` datetime NOT NULL DEFAULT '2016-04-29 00:00:00',
  `warehouse_transaction_line_cost` decimal(65,0) DEFAULT NULL,
  `warehouse_transaction_line_total_cost` decimal(65,0) DEFAULT NULL,
  `warehouse_transaction_id` int(11) NOT NULL,
  `warehouse_transaction_line_order_line_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `warehouse_transaction_line`
--

INSERT INTO `warehouse_transaction_line` (`warehouse_transaction_line_id`, `warehouse_transaction_line_item_id`, `warehouse_transaction_line_quantity`, `warehouse_transaction_line_date`, `warehouse_transaction_line_cost`, `warehouse_transaction_line_total_cost`, `warehouse_transaction_id`, `warehouse_transaction_line_order_line_id`) VALUES
(1, '22011', 12, '2016-04-29 00:00:00', '22', '264', 12, 0),
(2, '22011', 12, '2016-04-29 00:00:00', '22000', '264000', 13, 0),
(3, '0000000', 10, '2016-04-29 00:00:00', '22222', '222220', 13, 0),
(4, '011012', 5, '2016-04-29 00:00:00', '5000', '25000', 14, 0),
(5, 'F-15TF-AZ', 6, '2016-04-29 00:00:00', '6000', '36000', 14, 0),
(6, '20', 1234000, '2016-04-29 00:00:00', '900000', '10000001', 15, 40);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authority`
--
ALTER TABLE `authority`
  ADD PRIMARY KEY (`authority_code`),
  ADD KEY `authority_name` (`authority_code`);

--
-- Indexes for table `authorization`
--
ALTER TABLE `authorization`
  ADD PRIMARY KEY (`authorization_id`),
  ADD KEY `authorization_user` (`user_id`),
  ADD KEY `authorization_authority` (`authority_code`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `Customer_staff` (`staff_id`);

--
-- Indexes for table `customer_order`
--
ALTER TABLE `customer_order`
  ADD PRIMARY KEY (`order_id`),
  ADD UNIQUE KEY `customer_order_id` (`order_id`),
  ADD KEY `User_Order` (`user_id`),
  ADD KEY `customer_order` (`customer_id`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `item_item_category` (`item_category_id`);

--
-- Indexes for table `item_category`
--
ALTER TABLE `item_category`
  ADD PRIMARY KEY (`item_category_id`);

--
-- Indexes for table `item_storage_location`
--
ALTER TABLE `item_storage_location`
  ADD PRIMARY KEY (`item_storage_location_id`),
  ADD KEY `item_storage_location_storage_location` (`storage_location_id`),
  ADD KEY `item_storagea_location_item` (`item_id`);

--
-- Indexes for table `item_warehouse`
--
ALTER TABLE `item_warehouse`
  ADD PRIMARY KEY (`warehouse_id`,`item_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `order_line`
--
ALTER TABLE `order_line`
  ADD PRIMARY KEY (`order_line_id`),
  ADD KEY `order_order_line` (`order_id`),
  ADD KEY `order_line_item` (`order_line_item_id`);

--
-- Indexes for table `quotation`
--
ALTER TABLE `quotation`
  ADD PRIMARY KEY (`quotation_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `quotation_line`
--
ALTER TABLE `quotation_line`
  ADD PRIMARY KEY (`quotation_line_id`),
  ADD KEY `quotation_line_estimate_price` (`quotation_line_estimate_price`),
  ADD KEY `quotation_id` (`quotation_id`);

--
-- Indexes for table `sale_transaction`
--
ALTER TABLE `sale_transaction`
  ADD PRIMARY KEY (`sale_transaction_id`),
  ADD KEY `Sale_Transaction_User` (`sale_transaction_user_id`),
  ADD KEY `sale_transaction_order_line` (`order_line_id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staff_id`),
  ADD UNIQUE KEY `staff_id` (`staff_id`);

--
-- Indexes for table `storage_location`
--
ALTER TABLE `storage_location`
  ADD PRIMARY KEY (`storage_location_id`),
  ADD KEY `storage_location_warehouse` (`storage_location_warehouse_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `user_staff` (`staff_id`);

--
-- Indexes for table `warehouse`
--
ALTER TABLE `warehouse`
  ADD PRIMARY KEY (`warehouse_id`);

--
-- Indexes for table `warehouse_transaction`
--
ALTER TABLE `warehouse_transaction`
  ADD PRIMARY KEY (`warehouse_transaction_id`),
  ADD KEY `Warehouse_Transaction_User` (`warehouse_transaction_user_id`);

--
-- Indexes for table `warehouse_transaction_line`
--
ALTER TABLE `warehouse_transaction_line`
  ADD PRIMARY KEY (`warehouse_transaction_line_id`),
  ADD KEY `warehouse_transaction_id` (`warehouse_transaction_id`),
  ADD KEY `warehouse_transaction_line_item_id` (`warehouse_transaction_line_item_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `authorization`
--
ALTER TABLE `authorization`
  MODIFY `authorization_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `customer_order`
--
ALTER TABLE `customer_order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `item_storage_location`
--
ALTER TABLE `item_storage_location`
  MODIFY `item_storage_location_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `quotation`
--
ALTER TABLE `quotation`
  MODIFY `quotation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `quotation_line`
--
ALTER TABLE `quotation_line`
  MODIFY `quotation_line_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;
--
-- AUTO_INCREMENT for table `sale_transaction`
--
ALTER TABLE `sale_transaction`
  MODIFY `sale_transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `staff_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `warehouse_transaction`
--
ALTER TABLE `warehouse_transaction`
  MODIFY `warehouse_transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `warehouse_transaction_line`
--
ALTER TABLE `warehouse_transaction_line`
  MODIFY `warehouse_transaction_line_id` int(90) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
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
  ADD CONSTRAINT `User_Order` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `customer_order` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`);

--
-- Constraints for table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `item_item_category` FOREIGN KEY (`item_category_id`) REFERENCES `item_category` (`item_category_id`);

--
-- Constraints for table `item_storage_location`
--
ALTER TABLE `item_storage_location`
  ADD CONSTRAINT `item_storage_location_storage_location` FOREIGN KEY (`storage_location_id`) REFERENCES `storage_location` (`storage_location_id`),
  ADD CONSTRAINT `item_storagea_location_item` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`);

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
-- Constraints for table `quotation`
--
ALTER TABLE `quotation`
  ADD CONSTRAINT `quotation_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `quotation_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `quotation_line`
--
ALTER TABLE `quotation_line`
  ADD CONSTRAINT `quotation_line_ibfk_1` FOREIGN KEY (`quotation_id`) REFERENCES `quotation` (`quotation_id`);

--
-- Constraints for table `sale_transaction`
--
ALTER TABLE `sale_transaction`
  ADD CONSTRAINT `Sale_Transaction_User` FOREIGN KEY (`sale_transaction_user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `sale_transaction_order_line` FOREIGN KEY (`order_line_id`) REFERENCES `order_line` (`order_line_id`);

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

--
-- Constraints for table `warehouse_transaction`
--
ALTER TABLE `warehouse_transaction`
  ADD CONSTRAINT `warehouse_transaction_ibfk_2` FOREIGN KEY (`warehouse_transaction_user_id`) REFERENCES `user` (`user_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
