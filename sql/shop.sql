/*
Navicat MySQL Data Transfer

Source Server         : haha
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : shop

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2017-04-16 00:56:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for adminuser
-- ----------------------------
DROP TABLE IF EXISTS `adminuser`;
CREATE TABLE `adminuser` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of adminuser
-- ----------------------------
INSERT INTO `adminuser` VALUES ('2', 'admin', 'admin');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '服装水果');
INSERT INTO `category` VALUES ('2', '鞋子背包');
INSERT INTO `category` VALUES ('3', '百度外卖');
INSERT INTO `category` VALUES ('4', '贵重物品');
INSERT INTO `category` VALUES ('5', '电子产品');
INSERT INTO `category` VALUES ('6', '一大堆书');
INSERT INTO `category` VALUES ('7', '魔兽兵团');
INSERT INTO `category` VALUES ('8', '橙色装备');

-- ----------------------------
-- Table structure for categorysecond
-- ----------------------------
DROP TABLE IF EXISTS `categorysecond`;
CREATE TABLE `categorysecond` (
  `csid` int(11) NOT NULL AUTO_INCREMENT,
  `csname` varchar(255) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  PRIMARY KEY (`csid`),
  KEY `FK936FCAF21DB1FD15` (`cid`),
  CONSTRAINT `FK936FCAF21DB1FD15` FOREIGN KEY (`cid`) REFERENCES `category` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of categorysecond
-- ----------------------------
INSERT INTO `categorysecond` VALUES ('1', '冰霜巨龙', '7');
INSERT INTO `categorysecond` VALUES ('2', '初冬羽绒', '1');
INSERT INTO `categorysecond` VALUES ('3', '死亡骑士', '7');
INSERT INTO `categorysecond` VALUES ('4', '温暖毛衣', '1');
INSERT INTO `categorysecond` VALUES ('5', '精选男装', '1');
INSERT INTO `categorysecond` VALUES ('6', '冬季外套', '1');
INSERT INTO `categorysecond` VALUES ('7', '羽绒服', '1');
INSERT INTO `categorysecond` VALUES ('9', '女鞋', '2');
INSERT INTO `categorysecond` VALUES ('10', '短靴', '2');
INSERT INTO `categorysecond` VALUES ('11', '男鞋', '2');
INSERT INTO `categorysecond` VALUES ('12', '女包', '2');
INSERT INTO `categorysecond` VALUES ('13', '男包', '2');
INSERT INTO `categorysecond` VALUES ('14', '暗影战斧', '8');
INSERT INTO `categorysecond` VALUES ('15', '深渊巨刃', '8');
INSERT INTO `categorysecond` VALUES ('16', '运动服', '1');
INSERT INTO `categorysecond` VALUES ('17', '户外运动', '1');
INSERT INTO `categorysecond` VALUES ('18', '健身装备', '1');
INSERT INTO `categorysecond` VALUES ('19', '骑行装备', '5');
INSERT INTO `categorysecond` VALUES ('20', '泡面', '3');
INSERT INTO `categorysecond` VALUES ('21', '羊', '3');
INSERT INTO `categorysecond` VALUES ('22', '鼠', '3');
INSERT INTO `categorysecond` VALUES ('23', '鹅', '3');
INSERT INTO `categorysecond` VALUES ('24', '鸭', '3');
INSERT INTO `categorysecond` VALUES ('25', '鸡', '3');
INSERT INTO `categorysecond` VALUES ('29', '群星之怒', '8');
INSERT INTO `categorysecond` VALUES ('30', '生活电器', '5');
INSERT INTO `categorysecond` VALUES ('31', '个户电器', '5');
INSERT INTO `categorysecond` VALUES ('32', '办公耗材', '5');
INSERT INTO `categorysecond` VALUES ('33', '养颜水果', '1');
INSERT INTO `categorysecond` VALUES ('34', '大背包', '2');
INSERT INTO `categorysecond` VALUES ('35', '好吃的水果', '1');
INSERT INTO `categorysecond` VALUES ('36', '花纹裙子', '1');
INSERT INTO `categorysecond` VALUES ('41', '美丽的东西', '4');
INSERT INTO `categorysecond` VALUES ('43', '编程入门系列', '6');

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem` (
  `itemid` int(11) NOT NULL AUTO_INCREMENT,
  `count` int(11) DEFAULT NULL,
  `subtotal` double DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `oid` int(11) DEFAULT NULL,
  PRIMARY KEY (`itemid`),
  KEY `FKE8B2AB6166C01961` (`oid`),
  KEY `FKE8B2AB6171DB7AE4` (`pid`),
  KEY `FKE8B2AB6140ACF87A` (`oid`),
  CONSTRAINT `FKE8B2AB6140ACF87A` FOREIGN KEY (`oid`) REFERENCES `orders` (`oid`),
  CONSTRAINT `FKE8B2AB6171DB7AE4` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES ('24', '1', '3333', '84', '31');
INSERT INTO `orderitem` VALUES ('25', '1', '228', '2', '32');
INSERT INTO `orderitem` VALUES ('26', '1', '0.01', '80', '33');
INSERT INTO `orderitem` VALUES ('27', '1', '122222', '85', '34');
INSERT INTO `orderitem` VALUES ('28', '1', '2', '77', '35');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `oid` int(11) NOT NULL AUTO_INCREMENT,
  `total` double DEFAULT NULL,
  `ordertime` datetime DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `addr` varchar(50) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`oid`),
  KEY `FKC3DF62E5AA3D9C7` (`uid`),
  CONSTRAINT `FKC3DF62E5AA3D9C7` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('31', '3333', '2017-04-15 13:43:59', '1', null, null, null, '7');
INSERT INTO `orders` VALUES ('32', '228', '2017-04-15 13:44:12', '2', '沈晶秉', '15726607618', '南极', '7');
INSERT INTO `orders` VALUES ('33', '0.01', '2017-04-15 13:44:30', '2', '沈晶秉', '15726607618', '南极', '7');
INSERT INTO `orders` VALUES ('34', '122222', '2017-04-15 13:44:49', '1', null, null, null, '7');
INSERT INTO `orders` VALUES ('35', '2', '2017-04-15 14:00:00', '3', '沈晶秉', '15726607618', '南极', '7');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `pname` varchar(255) DEFAULT NULL,
  `market_price` double DEFAULT NULL,
  `shop_price` double DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `pdesc` varchar(255) DEFAULT NULL,
  `is_hot` int(11) DEFAULT NULL,
  `pdate` datetime DEFAULT NULL,
  `csid` int(11) DEFAULT NULL,
  PRIMARY KEY (`pid`),
  KEY `FKED8DCCEFB9B74E02` (`csid`),
  CONSTRAINT `FKED8DCCEFB9B74E02` FOREIGN KEY (`csid`) REFERENCES `categorysecond` (`csid`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '日版连衣裙', '558', '228', 'products/14871-kWVIEF.jpg', '双11限量200件，拍完下架，加车享优惠，早下手早发货。。秋冬个性中长款毛衣，美丽和温度同在！限量供应，拒绝撞衫！迫于纱线和人工在不断上涨的双重压力下，产品涨价在即！少量现货出售中，手快有，手慢等哦，赶紧抢哦，绝对高大上。', '1', '2017-04-15 20:33:23', '36');
INSERT INTO `product` VALUES ('2', '日版连衣裙', '558', '228', 'products/14871-kWVIEF.jpg', '双11限量200件，拍完下架，加车享优惠，早下手早发货。。秋冬个性中长款毛衣，美丽和温度同在！限量供应，拒绝撞衫！迫于纱线和人工在不断上涨的双重压力下，产品涨价在即！少量现货出售中，手快有，手慢等哦，赶紧抢哦，绝对高大上。', '1', '2017-04-16 00:55:25', '16');
INSERT INTO `product` VALUES ('3', '水果套餐', '238', '2', 'products/0tq2a29-0-lp.jpg', '还没过期....', '0', '2017-04-15 20:32:22', '33');
INSERT INTO `product` VALUES ('77', '黑色制服', '434', '2', 'products/1297306392-NmFCja.jpg', '黑色..........', '1', '2017-04-15 20:33:11', '6');
INSERT INTO `product` VALUES ('78', '初音服装', '9999', '999', 'products/14558-XdE065.jpg', '上衣是灰色的，领带是代表色葱绿，袖子是黑色加葱绿条纹，短裙是黑色加葱绿条纹，还有黑色加葱绿条纹的长袜.....', '1', '2017-04-15 20:33:00', '4');
INSERT INTO `product` VALUES ('79', '葡萄', '2', '1', 'products/1-160r61532135c.jpg', '葡萄', '0', '2017-04-15 20:32:37', '35');
INSERT INTO `product` VALUES ('80', '旧衣服', '0.1', '0.01', 'products/cs50009.png', '', '0', '2017-04-15 20:32:04', '2');
INSERT INTO `product` VALUES ('82', '旧衣服', '0.1', '0.01', 'products/cs50009.png', '', '0', '2017-04-15 20:32:09', '2');
INSERT INTO `product` VALUES ('84', '蝴蝶', '2222', '3333', 'products/22-140G109201CD.jpg', '蝴蝶在翩跹....', '1', '2017-04-14 22:58:53', '41');
INSERT INTO `product` VALUES ('85', '冰霜巨龙', '122222', '122222', 'products/frost1.jpg', '冰霜巨龙浑身散发着冰冷力量的巨龙一心一意地为它们黑暗的主人服务。冰龙拥有寒冷无比的喷吐武器，可以冻僵空中和地面的敌人。', '1', '2017-04-15 20:31:58', '1');
INSERT INTO `product` VALUES ('86', '被削弱的冰霜巨龙', '12222', '12222', 'products/frostWeak.jpg', '', '1', '2017-04-15 20:31:54', '1');
INSERT INTO `product` VALUES ('87', '寂寞的小蘑菇', '111', '11', 'products/mushroom1.jpg', '', '1', '2017-04-15 20:31:32', '41');

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
INSERT INTO `user` VALUES ('7', 'aaa', 'aaa', '沈晶秉', 'aaa@shop.com', '15726607618', '南极', '1', null, '161.010000', '3', '14648');
INSERT INTO `user` VALUES ('8', 'bbb', 'bbb', '沃姚库', 'bbb@shop.com', '18726607618', '月球', '1', '', '111.000000', '1', '0');
SET FOREIGN_KEY_CHECKS=1;
