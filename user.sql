/*
Navicat MySQL Data Transfer

Source Server         : haha
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : shop

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2017-04-11 13:26:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `addr` varchar(255) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `code` varchar(64) DEFAULT NULL,
  `balance` double(44,6) DEFAULT NULL,
  `coupon` int(12) DEFAULT NULL,
  `points` int(23) DEFAULT '0',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('7', 'aaa', 'aaa', '沈晶秉', 'aaa@shop.com', '15726607618', '南极', '1', null, '333.000000', '13', '77119');
INSERT INTO `user` VALUES ('8', 'bbb', 'bbb', '沃姚库', 'bbb@shop.com', '18726607618', '月球', '1', '', '111.000000', '1', '0');
SET FOREIGN_KEY_CHECKS=1;
