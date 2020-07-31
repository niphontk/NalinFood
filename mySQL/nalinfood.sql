/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : nalinfood

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2020-07-31 13:01:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for foodtable
-- ----------------------------
DROP TABLE IF EXISTS `foodtable`;
CREATE TABLE `foodtable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idShop` text DEFAULT NULL,
  `NameFood` text DEFAULT NULL,
  `PathImage` text DEFAULT NULL,
  `Price` text DEFAULT NULL,
  `Detail` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of foodtable
-- ----------------------------
INSERT INTO `foodtable` VALUES ('2', '6', 'Sugar', '/nalinfood/Food/food146296.jpg', '200', 'Sugar Detail');
INSERT INTO `foodtable` VALUES ('3', '6', 'Noodle', '/nalinfood/Food/food326833.jpg', '100', 'VeryGood');
INSERT INTO `foodtable` VALUES ('4', '6', 'Crab', '/nalinfood/Food/food905636.jpg', '500', 'Crap Food');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ChooseType` text DEFAULT NULL,
  `Name` text DEFAULT NULL,
  `User` text DEFAULT NULL,
  `Password` text DEFAULT NULL,
  `NameShop` text DEFAULT NULL,
  `Address` text DEFAULT NULL,
  `Phone` text DEFAULT NULL,
  `urlPicture` text DEFAULT NULL,
  `Lat` text DEFAULT NULL,
  `Lng` text DEFAULT NULL,
  `Token` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'User', 'นิพนธ์', 'user1', '1234', 'NalinFood', null, null, null, null, null, null);
INSERT INTO `user` VALUES ('5', 'Rider', 'ผู้ส่งอาหาร', 'rider', '1234', null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('6', 'Shop', 'เจ้าของร้าน', 'shop', '1234', 'NalinShop Huana', '207 หมู่ที่ 8 โรงพยาบาลตระการพืชผล\r\nต.ขุหลุ  อ.ตระการพืชผล\r\nจ.อุบลราชธานี  34130', '0910139660', '/nalinfood/Shop/editShop97441.jpg', '15.613199', '105.025965', null);
INSERT INTO `user` VALUES ('14', 'Shop', 'Niphon', 'niphon', '1234', 'NalinShop', '207 หมู่ที่ 8 โรงพยาบาลตระการพืชผล\r\nต.ขุหลุ  อ.ตระการพืชผล\r\nจ.อุบลราชธานี  34130', '0910139660', '/nalinfood/Shop/shop900814.jpg', '15.605501', '105.034139', '');
INSERT INTO `user` VALUES ('15', 'Shop', 'Salisa', 'salisa', '1234', 'Suksoomboon', 'Huana', '0885717810', '/nalinfood/Shop/shop838553.jpg', '15.612296', '105.043702', '');
