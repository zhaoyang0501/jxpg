/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50087
Source Host           : localhost:3306
Source Database       : pxgl

Target Server Type    : MYSQL
Target Server Version : 50087
File Encoding         : 65001

Date: 2015-12-10 22:19:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_city
-- ----------------------------
DROP TABLE IF EXISTS `t_city`;
CREATE TABLE `t_city` (
  `id` int(11) NOT NULL,
  `area` varchar(255) default NULL,
  `city` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_city
-- ----------------------------

-- ----------------------------
-- Table structure for t_fee
-- ----------------------------
DROP TABLE IF EXISTS `t_fee`;
CREATE TABLE `t_fee` (
  `id` bigint(20) NOT NULL auto_increment,
  `needa` double default NULL,
  `needb` double default NULL,
  `needc` double default NULL,
  `reala` double default NULL,
  `realb` double default NULL,
  `realc` double default NULL,
  `resta` double default NULL,
  `restb` double default NULL,
  `restc` double default NULL,
  `state` varchar(255) default NULL,
  `year` varchar(255) default NULL,
  `user` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_3msndtiwojbm9lhuhfnp0oqeq` (`user`),
  CONSTRAINT `FK_3msndtiwojbm9lhuhfnp0oqeq` FOREIGN KEY (`user`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_fee
-- ----------------------------
INSERT INTO `t_fee` VALUES ('2', '345', '43', '434', '34', '34', '3', '34', '34', '3', '未缴', '2015上学期', '1');
INSERT INTO `t_fee` VALUES ('3', '12', '123', '12', '123', '12', '123', '123', '12', '123', '未缴', '2015上学期', '5');
INSERT INTO `t_fee` VALUES ('4', '199', '123', '123', '122', '123', '123', '123', '123', '123', '已缴', '2015上学期', '8');

-- ----------------------------
-- Table structure for t_lesson
-- ----------------------------
DROP TABLE IF EXISTS `t_lesson`;
CREATE TABLE `t_lesson` (
  `id` bigint(20) NOT NULL auto_increment,
  `context` varchar(255) default NULL,
  `create_date` datetime default NULL,
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_lesson
-- ----------------------------
INSERT INTO `t_lesson` VALUES ('1', '听力', '2015-12-10 22:01:57', '听力');
INSERT INTO `t_lesson` VALUES ('2', '口语联系', '2015-12-07 20:32:36', '口语');
INSERT INTO `t_lesson` VALUES ('3', '作文', '2015-12-10 22:02:05', '作文');
INSERT INTO `t_lesson` VALUES ('4', '阅读练习', '2015-12-10 22:02:17', '阅读练习');

-- ----------------------------
-- Table structure for t_msgboard
-- ----------------------------
DROP TABLE IF EXISTS `t_msgboard`;
CREATE TABLE `t_msgboard` (
  `id` bigint(20) NOT NULL auto_increment,
  `create_date` datetime default NULL,
  `msg` varchar(255) default NULL,
  `replyfor` bigint(20) default NULL,
  `user` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_gb24swgq8md9jel9as8eho93` (`replyfor`),
  KEY `FK_o1nhfqltbcaewo266ye0kok80` (`user`),
  CONSTRAINT `FK_gb24swgq8md9jel9as8eho93` FOREIGN KEY (`replyfor`) REFERENCES `t_msgboard` (`id`),
  CONSTRAINT `FK_o1nhfqltbcaewo266ye0kok80` FOREIGN KEY (`user`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_msgboard
-- ----------------------------
INSERT INTO `t_msgboard` VALUES ('2', '2015-12-08 20:38:48', ' 3232', null, '1');
INSERT INTO `t_msgboard` VALUES ('3', '2015-12-08 20:38:50', ' 234234', null, '1');
INSERT INTO `t_msgboard` VALUES ('4', '2015-12-08 20:40:31', ' 234234', null, '1');
INSERT INTO `t_msgboard` VALUES ('5', '2015-12-10 22:18:01', '谢谢大家 我的QQ是263608237 ', null, '1');

-- ----------------------------
-- Table structure for t_notice
-- ----------------------------
DROP TABLE IF EXISTS `t_notice`;
CREATE TABLE `t_notice` (
  `id` bigint(20) NOT NULL auto_increment,
  `context` varchar(255) default NULL,
  `create_date` datetime default NULL,
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_notice
-- ----------------------------
INSERT INTO `t_notice` VALUES ('3', '\r\n高  质  量  课  程\r\n快酷英语采用，源自欧洲最大的英语学校，伦敦凯伦英语学校 运用的一种可以让你不经思考和翻译快速运用已经记住的单词和语法，快速提高英语口语能力的学习方法。凯伦学习法帮助您快速提高英语口语能力。', '2015-12-10 22:01:09', '欢迎大家报名参加培训');
INSERT INTO `t_notice` VALUES ('4', '我们学校有来自世界各地的学生，包括： 台湾、日本、韩国 学校管理很规范；老师很负责；老师的能力强。听力和口语提高很快，回答问题能形成一种本能的反应，流利程度和发音比半年前好了很多。', '2015-12-10 22:01:44', '学校简介');

-- ----------------------------
-- Table structure for t_plan
-- ----------------------------
DROP TABLE IF EXISTS `t_plan`;
CREATE TABLE `t_plan` (
  `id` bigint(20) NOT NULL auto_increment,
  `create_date` datetime default NULL,
  `date` datetime default NULL,
  `end` datetime default NULL,
  `start` datetime default NULL,
  `lesson` bigint(20) default NULL,
  `hours` double default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_nm5yvc7mb4mk3rq93uew21po5` (`lesson`),
  CONSTRAINT `FK_nm5yvc7mb4mk3rq93uew21po5` FOREIGN KEY (`lesson`) REFERENCES `t_lesson` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_plan
-- ----------------------------
INSERT INTO `t_plan` VALUES ('1', '2015-12-15 19:57:03', '2015-12-14 19:57:07', '2015-12-09 19:57:10', '2016-01-10 19:57:21', '1', '3');
INSERT INTO `t_plan` VALUES ('3', '2015-12-09 20:59:25', '2015-12-10 22:09:48', '2015-12-16 13:45:00', '2015-12-16 04:00:00', '2', '2');
INSERT INTO `t_plan` VALUES ('6', '2015-12-09 21:03:49', '2015-12-01 00:00:00', '2015-12-01 09:00:00', '2015-12-01 00:00:00', '4', '1.5');
INSERT INTO `t_plan` VALUES ('7', '2015-12-09 21:03:51', '2015-12-01 00:00:00', '2015-12-01 09:00:00', '2015-12-01 00:00:00', '2', '1');
INSERT INTO `t_plan` VALUES ('8', '2015-12-09 21:03:52', '2015-12-01 00:00:00', '2015-12-01 09:00:00', '2015-12-01 00:00:00', '3', '1');
INSERT INTO `t_plan` VALUES ('9', '2015-12-09 21:03:53', '2015-12-01 00:00:00', '2015-12-01 09:00:00', '2015-12-01 00:00:00', '2', '1');
INSERT INTO `t_plan` VALUES ('10', '2015-12-09 21:03:53', '2015-12-01 00:00:00', '2015-12-01 09:00:00', '2015-12-01 00:00:00', '3', '1');
INSERT INTO `t_plan` VALUES ('11', '2015-12-09 21:04:03', '2015-12-01 00:00:00', '2015-12-01 09:00:00', '2015-12-01 00:00:00', '1', '1');
INSERT INTO `t_plan` VALUES ('13', '2015-12-09 21:04:10', '2015-12-01 00:00:00', '2015-12-01 09:00:00', '2015-12-01 00:00:00', '4', '1');
INSERT INTO `t_plan` VALUES ('15', '2015-12-09 22:02:18', '2015-12-10 05:05:00', '2015-12-17 22:30:00', '2015-12-10 05:05:00', '2', '12');
INSERT INTO `t_plan` VALUES ('16', '2015-12-10 22:15:22', '2015-12-10 05:05:00', '2015-12-10 13:25:00', '2015-12-10 05:05:00', '4', '12');

-- ----------------------------
-- Table structure for t_score
-- ----------------------------
DROP TABLE IF EXISTS `t_score`;
CREATE TABLE `t_score` (
  `id` bigint(20) NOT NULL auto_increment,
  `score` double default NULL,
  `total` double default NULL,
  `year` varchar(255) default NULL,
  `user` bigint(20) default NULL,
  `lesson` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_kk45m10l858fa761t8jn4jijo` (`user`),
  KEY `FK_2e5h3tjut5gj2tv47gw3oplpn` (`lesson`),
  CONSTRAINT `FK_2e5h3tjut5gj2tv47gw3oplpn` FOREIGN KEY (`lesson`) REFERENCES `t_lesson` (`id`),
  CONSTRAINT `FK_kk45m10l858fa761t8jn4jijo` FOREIGN KEY (`user`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_score
-- ----------------------------
INSERT INTO `t_score` VALUES ('4', '5', '5', '2015上学期', '1', '2');
INSERT INTO `t_score` VALUES ('5', '56', '56', '2015上学期', '1', '1');
INSERT INTO `t_score` VALUES ('6', '45', '100', '2015上学期', '6', '4');

-- ----------------------------
-- Table structure for t_teacher
-- ----------------------------
DROP TABLE IF EXISTS `t_teacher`;
CREATE TABLE `t_teacher` (
  `id` bigint(20) NOT NULL auto_increment,
  `address` varchar(255) default NULL,
  `create_date` datetime default NULL,
  `email` varchar(255) default NULL,
  `grade` varchar(255) default NULL,
  `level` varchar(255) default NULL,
  `manger` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `password` varchar(255) default NULL,
  `school` varchar(255) default NULL,
  `tel` varchar(255) default NULL,
  `username` varchar(255) default NULL,
  `yyzh` varchar(255) default NULL,
  `job` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_teacher
-- ----------------------------
INSERT INTO `t_teacher` VALUES ('3', 'XX街道XX号', '2015-12-10 21:56:19', 'zhaoyang323@231.com', null, null, null, '王老师', '123456', null, '13333343434', 'teacher1', null, '高级');
INSERT INTO `t_teacher` VALUES ('4', 'XX街道XX号', '2015-12-10 21:56:27', 'zhaoyang323@231.com', null, null, null, '陈老师', '123456', null, '13333343434', 'teacher2', null, '高级');
INSERT INTO `t_teacher` VALUES ('5', 'XX街道XX号', '2015-12-10 21:56:37', 'zhaoyang323@231.com', null, null, null, '朱老师', '123456', null, '13333343434', 'teacher3', null, '高级');
INSERT INTO `t_teacher` VALUES ('6', '12312', '2015-12-10 22:14:01', '12@1245.com', null, null, null, '量老师', '123456', null, '123122', 'teacher12', null, '高级');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` bigint(20) NOT NULL auto_increment,
  `address` varchar(255) default NULL,
  `create_date` datetime default NULL,
  `email` varchar(255) default NULL,
  `level` varchar(255) default NULL,
  `manger` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `password` varchar(255) default NULL,
  `tel` varchar(255) default NULL,
  `username` varchar(255) default NULL,
  `yyzh` varchar(255) default NULL,
  `grade` varchar(255) default NULL,
  `school` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', '34', '2015-12-07 20:02:11', '34', null, null, '34', '123456', '34', 'user1', null, null, null);
INSERT INTO `t_user` VALUES ('4', '江苏无锡市XX区XX街道', '2015-12-10 21:50:19', '123123432@125.com', null, null, '谢霆锋', '123456', '010-0123123123', 'user2', null, '高二（3）班', '市一中');
INSERT INTO `t_user` VALUES ('5', '江苏无锡市XX区XX街道', '2015-12-10 21:51:36', '123123432@125.com', null, null, '程冠希', '123456', '010-0123123123', 'user3', null, '高二（3）班', '市一中');
INSERT INTO `t_user` VALUES ('6', '江苏无锡市XX区XX街道', '2015-12-10 21:51:42', '123123432@125.com', null, null, '吴彦祖', '123456', '010-0123123123', 'user4', null, '高二（3）班', '市一中');
INSERT INTO `t_user` VALUES ('7', '江苏无锡市XX区XX街道', '2015-12-10 21:51:49', '123123432@125.com', null, null, '蒋介石', '123456', '010-0123123123', 'user5', null, '高二（3）班', '市一中');
INSERT INTO `t_user` VALUES ('8', '江苏无锡市XX区XX街道', '2015-12-10 21:51:58', '123123432@125.com', null, null, '吴君如', '123456', '010-0123123123', 'user6', null, '高二（3）班', '市一中');
INSERT INTO `t_user` VALUES ('9', '江苏无锡市XX区XX街道', '2015-12-10 21:52:03', '123123432@125.com', null, null, '曾志伟', '123456', '010-0123123123', 'user7', null, '高二（3）班', '市一中');
INSERT INTO `t_user` VALUES ('10', '江苏无锡市XX区XX街道', '2015-12-10 21:52:09', '123123432@125.com', null, null, '黄家驹', '123456', '010-0123123123', 'user8', null, '高二（3）班', '市一中');
INSERT INTO `t_user` VALUES ('11', '江苏无锡市XX区XX街道', '2015-12-10 21:52:19', '123123432@125.com', null, null, '王小强', '123456', '010-0123123123', 'user9', null, '高二（3）班', '市一中');
INSERT INTO `t_user` VALUES ('12', '江苏无锡市XX区XX街道', '2015-12-10 21:53:17', '123123432@125.com', null, null, '程明', '123456', '010-0123123123', 'user10', null, '高二（3）班', '市一中');
INSERT INTO `t_user` VALUES ('13', '江苏无锡市XX区XX街道', '2015-12-10 21:53:25', '123123432@125.com', null, null, '梁爽', '123456', '010-0123123123', 'user11', null, '高二（3）班', '市一中');
INSERT INTO `t_user` VALUES ('15', '嘻嘻嘻', null, '2343@com.com', null, null, '小张', '123456', null, 'user122', null, null, null);

-- ----------------------------
-- Table structure for t_weather
-- ----------------------------
DROP TABLE IF EXISTS `t_weather`;
CREATE TABLE `t_weather` (
  `id` bigint(20) NOT NULL auto_increment,
  `aqi` double default NULL,
  `now_date` datetime default NULL,
  `pm25` double default NULL,
  `sd` double default NULL,
  `temmax` double default NULL,
  `temmin` double default NULL,
  `type` varchar(255) default NULL,
  `city` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_o4k1awy6i4051pdmtk2hxcg4u` (`city`),
  CONSTRAINT `FK_o4k1awy6i4051pdmtk2hxcg4u` FOREIGN KEY (`city`) REFERENCES `t_city` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_weather
-- ----------------------------
