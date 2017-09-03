/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50719
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2017-09-04 03:09:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for person
-- ----------------------------
DROP TABLE IF EXISTS `person`;
CREATE TABLE `person` (
  `ID` int(6) NOT NULL AUTO_INCREMENT,
  `USERNAME` varchar(255) NOT NULL,
  `PASSWORD` varchar(255) NOT NULL,
  `SEX` varchar(1) DEFAULT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `PHONE` varchar(20) DEFAULT NULL,
  `NEWPASS` varchar(255) DEFAULT NULL,
  `CREATETIME` datetime DEFAULT CURRENT_TIMESTAMP,
  `LASTLOGIN` datetime DEFAULT CURRENT_TIMESTAMP,
  `UPDATETIME` datetime DEFAULT CURRENT_TIMESTAMP,
  `ISADMIN` tinyint(1) NOT NULL,
  `ISDELETE` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of person
-- ----------------------------
INSERT INTO `person` VALUES ('14', 'admin', '123456', '男', '', '', null, '2017-09-03 05:14:53', '2017-09-03 05:14:53', '2017-09-04 00:55:47', '1', '0');
INSERT INTO `person` VALUES ('15', 'person', '123456', '男', '1wew3@123.com', '74555', null, '2017-09-03 14:26:40', '2017-09-03 14:26:40', '2017-09-03 14:50:56', '1', '1');
INSERT INTO `person` VALUES ('23', 'person', '123456', '女', '123@123.com', '123549498', null, '2017-09-03 15:03:04', '2017-09-03 15:03:04', '2017-09-03 15:03:04', '1', '0');
INSERT INTO `person` VALUES ('24', 'hello', 'kkkk', '男', 'iiii', 'kkkk', null, '2017-09-03 19:53:26', '2017-09-03 19:53:26', '2017-09-03 19:53:26', '0', '1');
INSERT INTO `person` VALUES ('25', '112', '222', '男', '333', '444', null, '2017-09-03 22:25:58', '2017-09-03 22:25:58', '2017-09-03 22:25:58', '0', '1');
INSERT INTO `person` VALUES ('26', 'QQ', '22', '男', 'WWW', 'EEE', null, '2017-09-03 22:26:57', '2017-09-03 22:26:57', '2017-09-03 22:26:57', '0', '1');
INSERT INTO `person` VALUES ('27', 'DD', 'SSS', '女', 'DDD', 'DDD', null, '2017-09-03 22:28:51', '2017-09-03 22:28:51', '2017-09-03 22:28:51', '0', '1');
INSERT INTO `person` VALUES ('28', '1qaz', 'ssdsd', '男', 'sdsdsd', 'ddd', null, '2017-09-03 22:31:24', '2017-09-03 22:31:24', '2017-09-03 22:31:24', '0', '1');
INSERT INTO `person` VALUES ('29', '123456789', '8753533', '男', '', '444', null, '2017-09-03 22:32:41', '2017-09-03 22:32:41', '2017-09-03 22:32:41', '0', '1');
INSERT INTO `person` VALUES ('30', 'asdaf', 'asdad', '男', 'bbbbbbbb', 'aaaaaaaaa', null, '2017-09-03 22:33:40', '2017-09-03 22:33:40', '2017-09-03 22:33:40', '0', '1');
INSERT INTO `person` VALUES ('31', 'hklelo', '121212', '男', '33333333333', '3244t4', null, '2017-09-03 22:34:36', '2017-09-03 22:34:36', '2017-09-03 22:34:36', '0', '1');
INSERT INTO `person` VALUES ('32', 'helloworld', '12345567', '男', '123456', 'ahhhhhhhh', null, '2017-09-03 22:35:31', '2017-09-03 22:35:31', '2017-09-03 22:35:31', '0', '1');
INSERT INTO `person` VALUES ('33', 'helloworld', '123456', '男', 'email', 'not phone', null, '2017-09-03 22:47:23', '2017-09-03 22:47:23', '2017-09-04 00:55:14', '0', '1');
INSERT INTO `person` VALUES ('34', '1234567890', 'asfgh', '男', 'dd', 'sda大傻大', null, '2017-09-04 00:38:55', '2017-09-04 00:38:55', '2017-09-04 00:38:55', '0', '1');
INSERT INTO `person` VALUES ('35', 'helloHHH', 'WWWW', '男', 'KKKK@1112', 'kkkk 1213213', null, '2017-09-04 00:44:04', '2017-09-04 00:44:04', '2017-09-04 00:44:04', '0', '1');
INSERT INTO `person` VALUES ('36', '中国', '1234121', '男', 'd@2', '2dsd', null, '2017-09-04 00:57:38', '2017-09-04 00:57:38', '2017-09-04 00:57:38', '0', '0');
INSERT INTO `person` VALUES ('37', 'Servlet', '12345678901234567890', '男', '', '2dd', null, '2017-09-04 01:03:09', '2017-09-04 01:03:09', '2017-09-04 01:07:08', '0', '1');
INSERT INTO `person` VALUES ('38', '1234', '11111111', '男', '', '', null, '2017-09-04 01:09:23', '2017-09-04 01:09:23', '2017-09-04 02:36:32', '0', '1');
INSERT INTO `person` VALUES ('39', '123454566', '222222222', '男', '', '', null, '2017-09-04 01:09:49', '2017-09-04 01:09:49', '2017-09-04 01:09:49', '0', '1');
INSERT INTO `person` VALUES ('40', 'CHina', '222', '男', 'kkkk@1', 'll', null, '2017-09-04 03:05:19', '2017-09-04 03:05:19', '2017-09-04 03:05:19', '0', '0');
