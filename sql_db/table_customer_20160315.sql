/*
Navicat MySQL Data Transfer

Source Server         : Local
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : breath

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2016-03-15 00:45:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `customer`
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_long_name` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_billing_address` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_shipping_address` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_tax_code` bigint(30) NOT NULL,
  `customer_credit_limit` decimal(30,2) NOT NULL,
  `customer_payment_term` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `staff_id` int(4) NOT NULL,
  `customer_contact_person_name` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_contact_person_phone_number` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_contact_person_email` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  KEY `Customer_staff` (`staff_id`),
  CONSTRAINT `Customer_staff` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('1', 'Nguyen Hai Phong', 'Phong Nguyen VJS', '24 Banh Van Tran; Tan Binh District, Ho Chi Minh City; Vietnam', '17 Le Duan; Ho Chi Minh City; Vietnam', '2312323452', '500000.00', 'Net 30', '3', 'Hoang Hong Hanh', '+84 942444018', 'abc@gmail.com', 'Active');
INSERT INTO `customer` VALUES ('2', 'Anh Tran', 'Cong ty TNHH Anh Tran', '42 Ngo Be; Ho Chi Minh City', '105 Cach Mang Thang Tam; Ho Chi Minh City', '5801282228', '234324.00', 'Net 30', '3', 'Tran Ha Thanh', '+84 93243561', 'trg@outlook.com.vn', 'Active');
INSERT INTO `customer` VALUES ('3', 'Tamy Hotel', 'Cong ty TNHH Tamy Tran', '18 Nguyen Tri Phuong; Ho Chi Minh City', '490 An Duong Vuong; Ho Chi Minh City', '5801282342', '1133232.00', 'Net 20', '3', 'Tran Hoang Yen', '+84 934840124', 'trg@outlook.com.vn', 'Active');
INSERT INTO `customer` VALUES ('4', 'Lam Sai Gon Hotel', 'Cong ty TNHH Lam Sai Gon Hotel', '60 Ngo Be; Ho Chi Minh City', '47 Long Hung; Ho Chi Minh City', '3401282228', '513234.00', 'Net 30', '8', 'Tran Ha My', '+84 90065002', 'trg@outlook.com.vn4', 'Deleted');
INSERT INTO `customer` VALUES ('5', 'Thanh Thuy', 'Thanh Thuy Hotel & Restaurant', '26 Nguyen Thi Minh Khai; Ho Chi Minh City', '42 Mac Dinh Chi; Ho Chi Minh City', '5823482228', '12312312312.00', 'Net 30', '8', 'Pham My Duyen', '+84 123535355', 'trg@outlook.com.vn5', 'Deleted');
INSERT INTO `customer` VALUES ('6', 'Tuan Anh', 'Cong ty TNHH Tuan Anh', '19 Nam Ky Khoi Nghia; Dala City', '56 Phan Nhu Thach; Da Lat City', '1231282228', '1312314524.00', 'Net 15', '8', 'Le Song Anh Thu', '+84 957302423', 'trg@outlook.com.vn6', 'Suspended');
INSERT INTO `customer` VALUES ('7', 'Phong Be', 'Phong Be VJS', '20 Co Giang; Ho Chi Minh City', '149/33A6 Banh Van Tran; Ho Chi Minh City', '5801273338', '67867867.00', 'Net 40', '8', 'Nguyen Le Huu Tam', '+84 934512422', 'trg@outlook.com.vn7', 'Deleted');
INSERT INTO `customer` VALUES ('8', 'Cong Anh', 'Cong ty TNHH Cong Anh', '120 Dien Bien Phu; Ho Chi Minh City', '11 Tan Thanh; Ho Chi Minh City', '5801374449', '67867.00', 'Net 20', '9', 'Pham Viet Long', '+84 945624450', 'trg@outlook.com.vn8', 'Active');
INSERT INTO `customer` VALUES ('9', 'Cuong Nang', 'Phang Nang Cuong VJS', '40 Cong Hoa; Ho Chi Minh City', '60 Tran Hung Dao; Ho Chi Minh City', '7801282228', '786756.00', 'Net 10', '9', 'Tran Cong Tuan', '+84 932484019', 'trg@outlook.com.vn9', 'Active');
INSERT INTO `customer` VALUES ('10', 'Forrest   ', 'Forrest International', '49 Cong Hoa  ;   Ho Chi Minh City; Viet Nam  ', '90 Phu Dong Thien Vuong;   Ho Chi Minh City; Viet Nam   ', '6901282228', '464645654.00', 'Net 20', '9', 'Nguyen Bich Hoa   ', '+84 92451241   ', 'trg@outlook.com.vn10', 'Suspended');
INSERT INTO `customer` VALUES ('11', 'Thu Thuy', 'Thuy Thuy Restaurant', '49 Truong Trinh; Ho Chi Minh City;Vietnam', '49 Xo Viet Nghe Tinh; Ho Chi Minh City;Vietnam', '4571282228', '45647897.00', 'Net 40', '9', 'Pham Minh Ngoc', '+84 93451242', 'trg@outlook.com.vn11', 'Active');
INSERT INTO `customer` VALUES ('12', 'Tuan Hung', 'Cong ty TNHH Tuan Hung', 'RMIT Viet Nam; Ho Chi Minh city;Vietnam', 'RMIT Australia; Melbourne;Australia', '1234282228', '7573522345.00', 'net 30', '9', 'Pham Diem Thuy', '+84 93552242', 'trg@outlook.com.vn12', 'Suspended');
INSERT INTO `customer` VALUES ('13', 'dasdsa', 'adasda', 'ada;adad;adasd', 'adda;dasda;adad', '23123131', '123.00', '123123', '5', 'adasd', '12313', 'addasd@asda.adad', 'Active');
INSERT INTO `customer` VALUES ('14', 'dasdsa', 'adasda', 'ada;adad;adasd', 'adda;dasda;adad', '23123131123', '123.00', '123123', '5', 'adasd', '12313', 'addasd@asda.adad', 'Suspended');
INSERT INTO `customer` VALUES ('15', 'qeqwe', 'qweqwe', 'q13123;123123;qweqwe', '1231;1231;12312', '123123123123', '123123.00', '1231233', '5', '123', '1231', '231231', 'Suspended');
