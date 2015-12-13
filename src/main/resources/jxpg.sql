/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50087
Source Host           : localhost:3306
Source Database       : jxpg

Target Server Type    : MYSQL
Target Server Version : 50087
File Encoding         : 65001

Date: 2015-12-13 22:45:10
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_fee
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_lesson
-- ----------------------------
INSERT INTO `t_lesson` VALUES ('2', '计算机基础', '2015-12-13 09:53:23', '计算机基础');
INSERT INTO `t_lesson` VALUES ('3', 'c语言程序设计', '2015-12-13 09:53:32', 'c语言程序设计');
INSERT INTO `t_lesson` VALUES ('4', '编译原理', '2015-12-13 09:53:39', '编译原理');
INSERT INTO `t_lesson` VALUES ('5', '软件工程', '2015-12-13 09:53:49', '软件工程');
INSERT INTO `t_lesson` VALUES ('6', '大学英语', '2015-12-13 09:53:59', '大学英语');

-- ----------------------------
-- Table structure for t_major
-- ----------------------------
DROP TABLE IF EXISTS `t_major`;
CREATE TABLE `t_major` (
  `id` bigint(20) NOT NULL auto_increment,
  `context` varchar(255) default NULL,
  `create_date` datetime default NULL,
  `name` varchar(255) default NULL,
  `school` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_5kcvha978es294ajbqrtelqvx` (`school`),
  CONSTRAINT `FK_5kcvha978es294ajbqrtelqvx` FOREIGN KEY (`school`) REFERENCES `t_school` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_major
-- ----------------------------
INSERT INTO `t_major` VALUES ('2', '自动化', '2015-12-13 09:42:17', '自动化', '6');
INSERT INTO `t_major` VALUES ('3', '电子信息工程', '2015-12-13 09:42:50', '电子信息工程', '6');
INSERT INTO `t_major` VALUES ('4', '通信工程', '2015-12-13 09:42:59', '通信工程', '6');
INSERT INTO `t_major` VALUES ('5', '计算机科学与技术', '2015-12-13 09:43:06', '计算机科学与技术', '6');
INSERT INTO `t_major` VALUES ('6', '信息管理与信息系统', '2015-12-13 09:44:09', '信息管理与信息系统', '6');
INSERT INTO `t_major` VALUES ('7', '建筑学', '2015-12-13 09:44:29', '建筑学', '7');
INSERT INTO `t_major` VALUES ('8', '土木工程', '2015-12-13 09:44:37', '土木工程', '7');
INSERT INTO `t_major` VALUES ('9', '工程管理', '2015-12-13 09:44:44', '工程管理', '7');
INSERT INTO `t_major` VALUES ('10', '交通工程', '2015-12-13 09:44:52', '交通工程', '7');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_msgboard
-- ----------------------------
INSERT INTO `t_msgboard` VALUES ('1', '2015-12-13 10:04:47', '我喜欢XX老师', null, '11');
INSERT INTO `t_msgboard` VALUES ('2', '2015-12-13 22:01:03', ' 天天', null, '5');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_notice
-- ----------------------------
INSERT INTO `t_notice` VALUES ('1', '2015年下学期的测评开始啦', '2015-12-13 22:00:10', 'test');

-- ----------------------------
-- Table structure for t_plan
-- ----------------------------
DROP TABLE IF EXISTS `t_plan`;
CREATE TABLE `t_plan` (
  `id` bigint(20) NOT NULL auto_increment,
  `create_date` datetime default NULL,
  `date` datetime default NULL,
  `end` datetime default NULL,
  `hours` double default NULL,
  `start` datetime default NULL,
  `lesson` bigint(20) default NULL,
  `year` varchar(255) default NULL,
  `major` bigint(20) default NULL,
  `teacher` bigint(20) default NULL,
  `state` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_nm5yvc7mb4mk3rq93uew21po5` (`lesson`),
  KEY `FK_r73s90vb9sw8gdma08n2yl8pt` (`major`),
  KEY `FK_9hqnuff1ytyraj27kpflpl98m` (`teacher`),
  CONSTRAINT `FK_9hqnuff1ytyraj27kpflpl98m` FOREIGN KEY (`teacher`) REFERENCES `t_teacher` (`id`),
  CONSTRAINT `FK_nm5yvc7mb4mk3rq93uew21po5` FOREIGN KEY (`lesson`) REFERENCES `t_lesson` (`id`),
  CONSTRAINT `FK_r73s90vb9sw8gdma08n2yl8pt` FOREIGN KEY (`major`) REFERENCES `t_major` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_plan
-- ----------------------------
INSERT INTO `t_plan` VALUES ('3', null, null, null, null, null, '4', '2015-上学期', '5', '1', null);
INSERT INTO `t_plan` VALUES ('4', null, null, null, null, null, '6', '2015-下学期', '5', '2', null);
INSERT INTO `t_plan` VALUES ('5', null, null, null, null, null, '5', '2015-下学期', '5', '3', null);
INSERT INTO `t_plan` VALUES ('6', null, null, null, null, null, '3', '2015-下学期', '5', '7', null);
INSERT INTO `t_plan` VALUES ('7', null, null, null, null, null, '2', '2015-下学期', '5', '6', null);

-- ----------------------------
-- Table structure for t_result
-- ----------------------------
DROP TABLE IF EXISTS `t_result`;
CREATE TABLE `t_result` (
  `id` bigint(20) NOT NULL auto_increment,
  `create_date` datetime default NULL,
  `plan` bigint(20) default NULL,
  `user` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_lkqtpnjqeccv8638sdiny8gf3` (`plan`),
  KEY `FK_9vvs67v8wqs8e83xr5csfwj94` (`user`),
  CONSTRAINT `FK_9vvs67v8wqs8e83xr5csfwj94` FOREIGN KEY (`user`) REFERENCES `t_user` (`id`),
  CONSTRAINT `FK_lkqtpnjqeccv8638sdiny8gf3` FOREIGN KEY (`plan`) REFERENCES `t_plan` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_result
-- ----------------------------
INSERT INTO `t_result` VALUES ('1', '2015-12-13 21:11:21', '5', '5');
INSERT INTO `t_result` VALUES ('2', '2015-12-13 21:15:15', '5', '5');
INSERT INTO `t_result` VALUES ('3', '2015-12-13 21:57:11', '6', '5');
INSERT INTO `t_result` VALUES ('4', '2015-12-13 21:58:38', '6', '5');
INSERT INTO `t_result` VALUES ('5', '2015-12-13 21:59:40', '6', '5');

-- ----------------------------
-- Table structure for t_resultdetail
-- ----------------------------
DROP TABLE IF EXISTS `t_resultdetail`;
CREATE TABLE `t_resultdetail` (
  `id` bigint(20) NOT NULL auto_increment,
  `score` int(11) default NULL,
  `result_id` bigint(20) default NULL,
  `testitem` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_mfpk4l6sxy95ifu3myw1vfgyn` (`result_id`),
  KEY `FK_60w5vh0xdu0r8le9rln0ov758` (`testitem`),
  CONSTRAINT `FK_60w5vh0xdu0r8le9rln0ov758` FOREIGN KEY (`testitem`) REFERENCES `t_testitem` (`id`),
  CONSTRAINT `FK_mfpk4l6sxy95ifu3myw1vfgyn` FOREIGN KEY (`result_id`) REFERENCES `t_result` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_resultdetail
-- ----------------------------
INSERT INTO `t_resultdetail` VALUES ('1', '4', null, '9');
INSERT INTO `t_resultdetail` VALUES ('2', '4', null, '8');
INSERT INTO `t_resultdetail` VALUES ('3', '4', null, '7');
INSERT INTO `t_resultdetail` VALUES ('4', '4', null, '6');
INSERT INTO `t_resultdetail` VALUES ('5', '4', null, '5');
INSERT INTO `t_resultdetail` VALUES ('6', '4', null, '4');
INSERT INTO `t_resultdetail` VALUES ('7', '5', null, '3');
INSERT INTO `t_resultdetail` VALUES ('8', '4', null, '1');
INSERT INTO `t_resultdetail` VALUES ('9', '4', null, '2');
INSERT INTO `t_resultdetail` VALUES ('10', '4', '2', '9');
INSERT INTO `t_resultdetail` VALUES ('11', '4', '2', '8');
INSERT INTO `t_resultdetail` VALUES ('12', '4', '2', '7');
INSERT INTO `t_resultdetail` VALUES ('13', '4', '2', '6');
INSERT INTO `t_resultdetail` VALUES ('14', '4', '2', '5');
INSERT INTO `t_resultdetail` VALUES ('15', '4', '2', '4');
INSERT INTO `t_resultdetail` VALUES ('16', '5', '2', '3');
INSERT INTO `t_resultdetail` VALUES ('17', '4', '2', '1');
INSERT INTO `t_resultdetail` VALUES ('18', '4', '2', '2');
INSERT INTO `t_resultdetail` VALUES ('19', '4', '3', '9');
INSERT INTO `t_resultdetail` VALUES ('20', '4', '3', '8');
INSERT INTO `t_resultdetail` VALUES ('21', '4', '3', '7');
INSERT INTO `t_resultdetail` VALUES ('22', '4', '3', '6');
INSERT INTO `t_resultdetail` VALUES ('23', '4', '3', '5');
INSERT INTO `t_resultdetail` VALUES ('24', '4', '3', '4');
INSERT INTO `t_resultdetail` VALUES ('25', '4', '3', '3');
INSERT INTO `t_resultdetail` VALUES ('26', '4', '3', '1');
INSERT INTO `t_resultdetail` VALUES ('27', '4', '3', '2');
INSERT INTO `t_resultdetail` VALUES ('28', '1', '4', '9');
INSERT INTO `t_resultdetail` VALUES ('29', '1', '4', '8');
INSERT INTO `t_resultdetail` VALUES ('30', '1', '4', '7');
INSERT INTO `t_resultdetail` VALUES ('31', '1', '4', '6');
INSERT INTO `t_resultdetail` VALUES ('32', '1', '4', '5');
INSERT INTO `t_resultdetail` VALUES ('33', '1', '4', '4');
INSERT INTO `t_resultdetail` VALUES ('34', '1', '4', '3');
INSERT INTO `t_resultdetail` VALUES ('35', '1', '4', '1');
INSERT INTO `t_resultdetail` VALUES ('36', '1', '4', '2');
INSERT INTO `t_resultdetail` VALUES ('37', '1', '5', '9');
INSERT INTO `t_resultdetail` VALUES ('38', '1', '5', '8');
INSERT INTO `t_resultdetail` VALUES ('39', '1', '5', '7');
INSERT INTO `t_resultdetail` VALUES ('40', '1', '5', '6');
INSERT INTO `t_resultdetail` VALUES ('41', '1', '5', '5');
INSERT INTO `t_resultdetail` VALUES ('42', '1', '5', '4');
INSERT INTO `t_resultdetail` VALUES ('43', '1', '5', '3');
INSERT INTO `t_resultdetail` VALUES ('44', '1', '5', '1');
INSERT INTO `t_resultdetail` VALUES ('45', '1', '5', '2');

-- ----------------------------
-- Table structure for t_school
-- ----------------------------
DROP TABLE IF EXISTS `t_school`;
CREATE TABLE `t_school` (
  `id` bigint(20) NOT NULL auto_increment,
  `context` varchar(255) default NULL,
  `create_date` datetime default NULL,
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_school
-- ----------------------------
INSERT INTO `t_school` VALUES ('1', '计算机学院1', '2015-12-12 19:57:43', '计算机学院1');
INSERT INTO `t_school` VALUES ('2', '文学院', '2015-12-13 09:32:55', '文学院');
INSERT INTO `t_school` VALUES ('3', '社会发展学院', '2015-12-13 09:33:03', '社会发展学院');
INSERT INTO `t_school` VALUES ('4', '外国语学院', '2015-12-13 09:33:11', '外国语学院');
INSERT INTO `t_school` VALUES ('5', '数学科学学院', '2015-12-13 09:33:18', '数学科学学院');
INSERT INTO `t_school` VALUES ('6', '信息工程学院', '2015-12-13 09:33:27', '信息工程学院');
INSERT INTO `t_school` VALUES ('7', '建筑科学与工程学院', '2015-12-13 09:33:36', '建筑科学与工程学院');
INSERT INTO `t_school` VALUES ('8', '农学院', '2015-12-13 09:33:44', '农学院');
INSERT INTO `t_school` VALUES ('9', '医学院', '2015-12-13 09:33:52', '医学院');
INSERT INTO `t_school` VALUES ('10', '美术与设计学院', '2015-12-13 09:34:07', '美术与设计学院');

-- ----------------------------
-- Table structure for t_score
-- ----------------------------
DROP TABLE IF EXISTS `t_score`;
CREATE TABLE `t_score` (
  `id` bigint(20) NOT NULL auto_increment,
  `score` double default NULL,
  `total` double default NULL,
  `year` varchar(255) default NULL,
  `lesson` bigint(20) default NULL,
  `user` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_2e5h3tjut5gj2tv47gw3oplpn` (`lesson`),
  KEY `FK_kk45m10l858fa761t8jn4jijo` (`user`),
  CONSTRAINT `FK_2e5h3tjut5gj2tv47gw3oplpn` FOREIGN KEY (`lesson`) REFERENCES `t_lesson` (`id`),
  CONSTRAINT `FK_kk45m10l858fa761t8jn4jijo` FOREIGN KEY (`user`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_score
-- ----------------------------

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
  `job` varchar(255) default NULL,
  `level` varchar(255) default NULL,
  `manger` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `password` varchar(255) default NULL,
  `school` varchar(255) default NULL,
  `tel` varchar(255) default NULL,
  `username` varchar(255) default NULL,
  `yyzh` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_teacher
-- ----------------------------
INSERT INTO `t_teacher` VALUES ('1', 'XX区', '2015-12-13 10:21:18', '2343@com.com', null, '教授', null, null, '王老师', '123456', null, '1344544444', 'teacher1', null);
INSERT INTO `t_teacher` VALUES ('2', '北京市', '2015-12-13 10:21:46', '2343@com.com', null, '讲师', null, null, '陈老师', '123456', null, '1344544444', 'teacher2', null);
INSERT INTO `t_teacher` VALUES ('3', '', '2015-12-13 10:33:26', '', null, '高级', null, null, '朱老师', '123456', null, '', 'teacher3', null);
INSERT INTO `t_teacher` VALUES ('4', '江苏', '2015-12-13 10:33:48', '', null, '高级', null, null, '孙老师', '123456', null, '', 'teacher4', null);
INSERT INTO `t_teacher` VALUES ('5', '江苏', '2015-12-13 10:34:10', '', null, '高级', null, null, '项老师', '123456', null, '', 'teacher5', null);
INSERT INTO `t_teacher` VALUES ('6', '江苏', '2015-12-13 10:34:15', '', null, '高级', null, null, '徐老师', '123456', null, '', 'teacher6', null);
INSERT INTO `t_teacher` VALUES ('7', '江苏', '2015-12-13 10:34:20', '', null, '高级', null, null, '张老师', '123456', null, '', 'teacher7', null);

-- ----------------------------
-- Table structure for t_testitem
-- ----------------------------
DROP TABLE IF EXISTS `t_testitem`;
CREATE TABLE `t_testitem` (
  `id` bigint(20) NOT NULL auto_increment,
  `context` varchar(255) default NULL,
  `create_date` datetime default NULL,
  `name` varchar(255) default NULL,
  `ordernum` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_testitem
-- ----------------------------
INSERT INTO `t_testitem` VALUES ('1', '教师教学方法灵活，能合理并有效利用了多样化的教学素材，富于启发性。', '2015-12-13 09:55:27', '教师教学方法灵活，能合理并有效利用了多样化的教学素材，富于启发性。', '2');
INSERT INTO `t_testitem` VALUES ('2', '教师上课准时，教学态度认真负责，热情高', '2015-12-13 09:55:14', '教师上课准时，教学态度认真负责，热情高', '1');
INSERT INTO `t_testitem` VALUES ('3', '教学内容重点突出，有针对性？', '2015-12-13 09:55:54', '教学内容重点突出，有针对性？', '2');
INSERT INTO `t_testitem` VALUES ('4', '', '2015-12-13 09:56:09', '难度适中，内容安排合理，不陈旧，适合学习？', '3');
INSERT INTO `t_testitem` VALUES ('5', '教师对本课程所属领域非常熟悉，其授课具有前瞻性？', '2015-12-13 09:56:23', '教师对本课程所属领域非常熟悉，其授课具有前瞻性？', '3');
INSERT INTO `t_testitem` VALUES ('6', '课堂中有适当的交流互动，老师鼓励学生发问，并耐心解答和引导？', '2015-12-13 09:56:40', '课堂中有适当的交流互动，老师鼓励学生发问，并耐心解答和引导？', '3');
INSERT INTO `t_testitem` VALUES ('7', '课堂中有适当的交流互动，老师鼓励学生发问，并耐心解答和引导？', '2015-12-13 09:56:51', '老师能有效调节课堂气氛，避免单调乏味？', '3');
INSERT INTO `t_testitem` VALUES ('8', '老师语言通俗易懂，思路清晰？', '2015-12-13 09:57:10', '老师语言通俗易懂，思路清晰？', '4');
INSERT INTO `t_testitem` VALUES ('9', '课堂后勤服务工作到位，保证了课堂的顺利进行。？', '2015-12-13 09:57:29', '课堂后勤服务工作到位，保证了课堂的顺利进行？', '4');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
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
  `major` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK_jt289otio7j11p9w7kt2ogppw` (`major`),
  CONSTRAINT `FK_jt289otio7j11p9w7kt2ogppw` FOREIGN KEY (`major`) REFERENCES `t_major` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('5', '北京XX区XX街道', '2015-12-13 09:51:55', '2343@com.com', null, null, null, '古力娜扎', '123456', '', '123343434', 'user1', null, '5');
INSERT INTO `t_user` VALUES ('6', '北京XX区XX街道', '2015-12-13 09:52:04', '2343@com.com', null, null, null, '蔡健雅', '123456', '', '123343434', 'user2', null, '5');
INSERT INTO `t_user` VALUES ('7', '北京XX区XX街道', '2015-12-13 09:52:11', '2343@com.com', null, null, null, '黄雅莉', '123456', '', '123343434', 'user2', null, '5');
INSERT INTO `t_user` VALUES ('8', '北京XX区XX街道', '2015-12-13 09:52:19', '2343@com.com', null, null, null, '周杰伦', '123456', '', '123343434', 'user2', null, '5');
INSERT INTO `t_user` VALUES ('9', '北京XX区XX街道', '2015-12-13 09:52:34', '2343@com.com', null, null, null, '吴忠宪', '123456', '', '123343434', 'user2', null, '4');
INSERT INTO `t_user` VALUES ('10', '', null, 'admin', null, null, null, '', '123456', null, null, 'user', null, '6');
INSERT INTO `t_user` VALUES ('11', '台湾XX街道', null, 'sfa@tw.com', null, null, null, '马英九', '123456', null, null, 'user5', null, '3');

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
