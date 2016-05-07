/*
Navicat MySQL Data Transfer

Source Server         : Local
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : breath

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2016-04-07 11:24:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `warehouse`
-- ----------------------------
DROP TABLE IF EXISTS `warehouse`;
CREATE TABLE `warehouse` (
  `warehouse_id` int(11) NOT NULL,
  `warehouse_location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `warehouse_capacity` int(11) NOT NULL,
  `warehouse_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `warehouse_supervisor_id` int(11) NOT NULL,
  `warehouse_item_category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`warehouse_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of warehouse
-- ----------------------------
INSERT INTO `warehouse` VALUES ('1', 'location test 1;Rock Sound;Bahamas', '1000', 'qewqeq', '5', '1');
INSERT INTO `warehouse` VALUES ('2', 'location_test_23;Rock Sound;Bahamas', '1000', 'qweqwe', '6', '3');
INSERT INTO `warehouse` VALUES ('9', '123213;Ararat;Armenia', '123', 'adaad', '1', '2;3');
INSERT INTO `warehouse` VALUES ('10', '123213;Ararat;Armenia', '123', 'adaad', '1', '2;3');
INSERT INTO `warehouse` VALUES ('11', '123213123123123;Rock Sound;Bahamas', '123', 'adaad123213', '1', '2;3');
INSERT INTO `warehouse` VALUES ('12', '123213;Ararat;Armenia', '123', 'adaad', '1', '2;3');
INSERT INTO `warehouse` VALUES ('13', '123213;Noakhali;Bangladesh', '123', 'adaad', '1', '2;3');
INSERT INTO `warehouse` VALUES ('14', '1231;Mayaguana;Bahamas', '123', '12312', '2', '1;2');
INSERT INTO `warehouse` VALUES ('15', '1231;Berat;Albania', '123', '12312', '2', '1;2');
INSERT INTO `warehouse` VALUES ('16', 'qweqeqeq;Mykines;Faroe Islands', '23333', 'qeqweqwe', '10', '2');
