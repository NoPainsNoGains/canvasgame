/*
Navicat MySQL Data Transfer

Source Server         : Game
Source Server Version : 50151
Source Host           : 121.49.107.150:3306
Source Database       : game

Target Server Type    : MYSQL
Target Server Version : 50151
File Encoding         : 65001

Date: 2016-04-30 21:10:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `sys_admin`
-- ----------------------------
DROP TABLE IF EXISTS `sys_admin`;
CREATE TABLE `sys_admin` (
  `ADMIN_ID` int(4) NOT NULL AUTO_INCREMENT,
  `ADMIN_NAME` varchar(32) NOT NULL,
  `ADMIN_PASSWORD` varchar(32) NOT NULL,
  `ADMIN_TYPE` int(1) NOT NULL COMMENT '0-visitor 1-loginUser 2-admin',
  `ADMIN_SEX` int(1) NOT NULL COMMENT '0-boy 1-girl',
  `ADMIN_TEL` varchar(32) NOT NULL,
  `ADMIN_BIRTH` datetime NOT NULL,
  `ADMIN_REMARKS` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`ADMIN_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_admin
-- ----------------------------
INSERT INTO `sys_admin` VALUES ('1', 'ymh', '1234', '1', '1', '11111111', '2016-04-01 10:56:36', '12345');
INSERT INTO `sys_admin` VALUES ('2', 'lxq', '1234', '2', '1', '1234567', '2016-04-12 21:28:09', null);
INSERT INTO `sys_admin` VALUES ('3', 'root', '1234', '2', '0', '12345678', '2016-04-01 12:45:43', 'root');

-- ----------------------------
-- Table structure for `sys_score`
-- ----------------------------
DROP TABLE IF EXISTS `sys_score`;
CREATE TABLE `sys_score` (
  `SCORE_ID` int(4) NOT NULL AUTO_INCREMENT,
  `ADMIN_ID` int(4) NOT NULL,
  `SCORE_NUMBER` int(4) NOT NULL,
  `SCORE_GRADE` int(4) NOT NULL,
  `SCORE_DATE` datetime NOT NULL,
  PRIMARY KEY (`SCORE_ID`),
  KEY `ADMIN_ID` (`ADMIN_ID`),
  CONSTRAINT `sys_score_ibfk_1` FOREIGN KEY (`ADMIN_ID`) REFERENCES `sys_admin` (`ADMIN_ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_score
-- ----------------------------
INSERT INTO `sys_score` VALUES ('4', '1', '0', '0', '2016-04-21 14:58:46');
INSERT INTO `sys_score` VALUES ('5', '1', '2', '10', '2016-04-21 14:59:57');
INSERT INTO `sys_score` VALUES ('6', '1', '0', '0', '2016-04-21 15:03:00');
INSERT INTO `sys_score` VALUES ('7', '1', '0', '0', '2016-04-21 15:13:42');
INSERT INTO `sys_score` VALUES ('8', '1', '0', '0', '2016-04-21 20:19:51');
INSERT INTO `sys_score` VALUES ('9', '1', '1', '5', '2016-04-27 20:13:08');
INSERT INTO `sys_score` VALUES ('10', '1', '0', '0', '2016-04-27 20:13:15');
INSERT INTO `sys_score` VALUES ('11', '1', '2', '100', '2016-04-20 16:04:51');
INSERT INTO `sys_score` VALUES ('12', '2', '3', '200', '2016-04-19 16:05:05');
INSERT INTO `sys_score` VALUES ('13', '1', '4', '50', '2016-04-01 16:47:59');
INSERT INTO `sys_score` VALUES ('14', '1', '0', '0', '2016-04-28 20:17:44');
INSERT INTO `sys_score` VALUES ('15', '1', '0', '0', '2016-04-28 20:17:47');
INSERT INTO `sys_score` VALUES ('16', '1', '0', '0', '2016-04-28 20:31:22');
INSERT INTO `sys_score` VALUES ('17', '1', '0', '0', '2016-04-28 20:31:36');
INSERT INTO `sys_score` VALUES ('18', '1', '0', '0', '2016-04-28 20:58:24');
INSERT INTO `sys_score` VALUES ('19', '1', '1', '5', '2016-04-28 20:58:53');
INSERT INTO `sys_score` VALUES ('20', '1', '1', '5', '2016-04-28 20:59:27');
INSERT INTO `sys_score` VALUES ('21', '1', '1', '5', '2016-04-28 21:03:29');
INSERT INTO `sys_score` VALUES ('22', '1', '1', '5', '2016-04-28 21:04:50');
INSERT INTO `sys_score` VALUES ('23', '1', '1', '5', '2016-04-28 21:05:54');
INSERT INTO `sys_score` VALUES ('24', '1', '1', '5', '2016-04-28 21:07:26');
INSERT INTO `sys_score` VALUES ('25', '1', '3', '6', '2016-04-30 19:09:38');
