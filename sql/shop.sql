/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50547
Source Host           : localhost:3306
Source Database       : shop

Target Server Type    : MYSQL
Target Server Version : 50547
File Encoding         : 65001

Date: 2017-05-01 12:18:19
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
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

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
INSERT INTO `categorysecond` VALUES ('44', '入门到放弃系列', '6');
INSERT INTO `categorysecond` VALUES ('45', '保健物品', '4');
INSERT INTO `categorysecond` VALUES ('46', '死亡骑士', '7');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `cdate` datetime DEFAULT NULL,
  `star` varchar(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`cid`),
  KEY `FK38A5EE5FA5F68B54` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', '沈晶秉', '100', '2017-05-01 00:00:00', '5', '3', '这东西简直帅爆了~~~~');
INSERT INTO `comment` VALUES ('2', 'aaa', '77', '2017-05-01 00:00:00', '5', '3', '这东西简直帅爆了~~~~');

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
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES ('24', '1', '3333', '84', '31');
INSERT INTO `orderitem` VALUES ('25', '1', '228', '2', '32');
INSERT INTO `orderitem` VALUES ('26', '1', '0.01', '80', '33');
INSERT INTO `orderitem` VALUES ('27', '1', '122222', '85', '34');
INSERT INTO `orderitem` VALUES ('28', '1', '2', '77', '35');
INSERT INTO `orderitem` VALUES ('29', '6', '1368', '1', '36');
INSERT INTO `orderitem` VALUES ('30', '1', '0.01', '82', '37');
INSERT INTO `orderitem` VALUES ('31', '1', '0.1', '98', '38');
INSERT INTO `orderitem` VALUES ('32', '2', '66', '99', '39');
INSERT INTO `orderitem` VALUES ('33', '2', '66', '99', '40');
INSERT INTO `orderitem` VALUES ('34', '2', '66', '99', '41');
INSERT INTO `orderitem` VALUES ('35', '2', '66', '99', '42');
INSERT INTO `orderitem` VALUES ('36', '1', '33', '99', '43');
INSERT INTO `orderitem` VALUES ('37', '2', '0.2', '98', '44');
INSERT INTO `orderitem` VALUES ('38', '1', '0.1', '98', '45');
INSERT INTO `orderitem` VALUES ('39', '1', '33', '99', '46');
INSERT INTO `orderitem` VALUES ('40', '1', '0.1', '98', '46');
INSERT INTO `orderitem` VALUES ('41', '1', '0.1', '98', '47');

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
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('31', '3333', '2017-04-15 13:43:59', '1', null, null, null, '7');
INSERT INTO `orders` VALUES ('32', '228', '2017-04-15 13:44:12', '2', '沈晶秉', '15726607618', '南极', '7');
INSERT INTO `orders` VALUES ('33', '0.01', '2017-04-15 13:44:30', '3', '沈晶秉', '15726607618', '南极', '7');
INSERT INTO `orders` VALUES ('34', '122222', '2017-04-15 13:44:49', '1', null, null, null, '7');
INSERT INTO `orders` VALUES ('35', '2', '2017-04-15 14:00:00', '4', '沈晶秉', '15726607618', '南极', '7');
INSERT INTO `orders` VALUES ('36', '1368', '2017-04-16 12:29:00', '1', null, null, null, '7');
INSERT INTO `orders` VALUES ('37', '0.01', '2017-04-16 12:48:15', '2', '沈晶秉', '15726607618', '南极', '7');
INSERT INTO `orders` VALUES ('38', '0.1', '2017-04-16 17:31:55', '2', '沈晶秉', '15726607618', '南极', '7');
INSERT INTO `orders` VALUES ('39', '66', '2017-04-26 20:10:38', '2', '沈晶秉', '15726607618', '南极', '7');
INSERT INTO `orders` VALUES ('40', '66', '2017-04-26 20:26:34', '2', '沈晶秉', '15726607618', '南极', '7');
INSERT INTO `orders` VALUES ('41', '66', '2017-04-26 20:27:44', '1', null, null, null, '7');
INSERT INTO `orders` VALUES ('42', '66', '2017-04-26 20:39:12', '2', '沈晶秉', '15726607618', '南极', '7');
INSERT INTO `orders` VALUES ('43', '33', '2017-04-26 20:45:11', '2', '沈晶秉', '15726607618', '南极', '7');
INSERT INTO `orders` VALUES ('44', '0.2', '2017-04-26 20:53:46', '2', '沈晶秉', '15726607618', '南极', '7');
INSERT INTO `orders` VALUES ('45', '0.1', '2017-04-26 21:05:09', '2', '沈晶秉', '15726607618', '南极', '7');
INSERT INTO `orders` VALUES ('46', '33.1', '2017-04-26 21:07:37', '2', '沈晶秉', '15726607618', '南极', '7');
INSERT INTO `orders` VALUES ('47', '0.1', '2017-04-26 21:13:25', '2', '沈晶秉', '15726607618', '南极', '7');

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
  `sale_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`pid`),
  KEY `FKED8DCCEFB9B74E02` (`csid`),
  CONSTRAINT `FKED8DCCEFB9B74E02` FOREIGN KEY (`csid`) REFERENCES `categorysecond` (`csid`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '日版连衣裙', '558', '228', 'products/14871-kWVIEF.jpg', '双11限量200件，拍完下架，加车享优惠，早下手早发货。。秋冬个性中长款毛衣，美丽和温度同在！限量供应，拒绝撞衫！迫于纱线和人工在不断上涨的双重压力下，产品涨价在即！少量现货出售中，手快有，手慢等哦，赶紧抢哦，绝对高大上。', '1', '2017-04-15 20:33:23', '36', '0');
INSERT INTO `product` VALUES ('2', '日版连衣裙', '558', '228', 'products/14871-kWVIEF.jpg', '双11限量200件，拍完下架，加车享优惠，早下手早发货。。秋冬个性中长款毛衣，美丽和温度同在！限量供应，拒绝撞衫！迫于纱线和人工在不断上涨的双重压力下，产品涨价在即！少量现货出售中，手快有，手慢等哦，赶紧抢哦，绝对高大上。', '1', '2017-04-16 00:55:25', '16', '0');
INSERT INTO `product` VALUES ('3', '水果套餐', '238', '2', 'products/0tq2a29-0-lp.jpg', '还没过期....', '0', '2017-04-15 20:32:22', '33', '0');
INSERT INTO `product` VALUES ('77', '黑色制服', '434', '2', 'products/1297306392-NmFCja.jpg', '黑色..........', '1', '2017-04-15 20:33:11', '6', '56');
INSERT INTO `product` VALUES ('78', '初音服装', '9999', '999', 'products/14558-XdE065.jpg', '上衣是灰色的，领带是代表色葱绿，袖子是黑色加葱绿条纹，短裙是黑色加葱绿条纹，还有黑色加葱绿条纹的长袜.....', '1', '2017-04-15 20:33:00', '4', '0');
INSERT INTO `product` VALUES ('79', '葡萄', '2', '1', 'products/1-160r61532135c.jpg', '葡萄', '0', '2017-04-15 20:32:37', '35', '0');
INSERT INTO `product` VALUES ('80', '旧衣服', '0.1', '0.01', 'products/cs50009.png', '', '0', '2017-04-15 20:32:04', '2', '0');
INSERT INTO `product` VALUES ('82', '旧衣服', '0.1', '0.01', 'products/cs50009.png', '', '0', '2017-04-15 20:32:09', '2', '0');
INSERT INTO `product` VALUES ('84', '蝴蝶', '2222', '3333', 'products/22-140G109201CD.jpg', '蝴蝶在翩跹....', '1', '2017-04-14 22:58:53', '41', '53');
INSERT INTO `product` VALUES ('85', '冰霜巨龙', '122222', '122222', 'products/frost1.jpg', '冰霜巨龙浑身散发着冰冷力量的巨龙一心一意地为它们黑暗的主人服务。冰龙拥有寒冷无比的喷吐武器，可以冻僵空中和地面的敌人。', '1', '2017-04-15 20:31:58', '1', '0');
INSERT INTO `product` VALUES ('86', '被削弱的冰霜巨龙', '12222', '12222', 'products/frostWeak.jpg', '', '1', '2017-04-15 20:31:54', '1', '0');
INSERT INTO `product` VALUES ('87', '寂寞的小蘑菇', '111', '11', 'products/mushroom1.jpg', '', '1', '2017-04-15 20:31:32', '41', '24');
INSERT INTO `product` VALUES ('88', 'swift从入门到放弃', '45', '54', 'products/u=1683705473,2632060281&fm=23&gp=0.jpg', 'linux入门到放弃....世上无难事，只要肯放弃~', '1', '2017-04-16 13:00:41', '44', '0');
INSERT INTO `product` VALUES ('89', '淘宝开店宝典', '11', '11', 'products/taobao2.jpg', '~~~~', '0', '2017-04-16 13:01:46', '44', '0');
INSERT INTO `product` VALUES ('90', 'python游戏编程', '32', '23', 'products/python11.jpg', '', '1', '2017-04-16 13:02:28', '43', '0');
INSERT INTO `product` VALUES ('91', '用青春换代码', '4443', '3344', 'products/mmexport1492315655045.jpg', '', '1', '2017-04-16 13:04:55', '43', '0');
INSERT INTO `product` VALUES ('92', '明亮的深渊巨刃', '0', '5444', 'products/AbyssBlade.jpg', '深渊巨刃\r\n拾取后绑定\r\n镶孔奖励：+4 爆击等级\r\n需要等级 70\r\n物品等级125\r\n击中时可能： 吸取敌人300点生命值，并将其转移给施法者。\r\n◇装备评分(GS): 192\r\n掉落来源:玛瑟里顿的巢穴玛瑟里顿15.7%\r\n物品等级125', '1', '2017-04-16 13:16:17', '15', '0');
INSERT INTO `product` VALUES ('93', '暗影战斧', '2232', '2090', 'products/shadow11.jpg', '.................', '1', '2017-04-16 13:17:57', '14', '0');
INSERT INTO `product` VALUES ('94', '三只公鸡', '33', '33', 'products/cock22.jpg', '', '0', '2017-04-16 13:19:32', '25', '0');
INSERT INTO `product` VALUES ('95', '两只可爱的小老鼠', '233', '233', 'products/mice2.jpg', '', '1', '2017-04-16 13:19:56', '22', '0');
INSERT INTO `product` VALUES ('96', '毛茸茸的小老鼠', '12', '12', 'products/mouse.jpg', '', '1', '2017-04-16 13:20:28', '22', '0');
INSERT INTO `product` VALUES ('97', '美媛春', '123', '321', 'products/meiyuanchun.jpg', '美媛春肾宝，他好我也好~~\r\n', '1', '2017-04-16 13:27:36', '45', '30');
INSERT INTO `product` VALUES ('98', '辣条', '0.5', '0.1', 'products/latiao.jpg', '', '1', '2017-04-16 13:28:11', '20', '1');
INSERT INTO `product` VALUES ('99', '脑白金', '333', '33', 'products/brainwhiteandgolden.jpg', '送礼就送脑白金~', '1', '2017-04-16 13:29:11', '45', '5');
INSERT INTO `product` VALUES ('100', '死亡领主', '13332', '13232', 'products/darknight.jpg', '死亡骑士曾经是正义的人民，他们曾经勇敢而无畏地对抗黑暗，但他们与之对抗的邪恶并非轻易就能驱逐。死亡之力将战死的英雄唤醒，赋予其近似永恒的力量。这些曾经的英雄披上更加强大的装甲，操纵着所向无敌的黑暗魔力，去进行他们曾经与之对抗的一切暴行....', '1', '2017-04-16 17:33:10', '46', '0');

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
INSERT INTO `user` VALUES ('7', 'aaa', 'aaa', '沈晶秉', 'aaa@shop.com', '15726607618', '南极', '1', null, '1090.400000', '13', '264');
INSERT INTO `user` VALUES ('8', 'bbb', 'bbb', '沃姚库', 'bbb@shop.com', '18726607618', '月球', '1', '', '111.000000', '1', '0');
