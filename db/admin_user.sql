/*
 Navicat Premium Data Transfer

 Source Server         : root
 Source Server Type    : MySQL
 Source Server Version : 50728
 Source Host           : localhost:3306
 Source Schema         : huiCanon

 Target Server Type    : MySQL
 Target Server Version : 50728
 File Encoding         : 65001

 Date: 05/03/2020 20:41:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_user
-- ----------------------------
DROP TABLE IF EXISTS `admin_user`;
CREATE TABLE `admin_user` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `isdeleted` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of admin_user
-- ----------------------------
BEGIN;
INSERT INTO `admin_user` VALUES (1, '管理员1号', '13431870348', '123', NULL);
INSERT INTO `admin_user` VALUES (2, '管理员2号', '13431870348', '123', NULL);
INSERT INTO `admin_user` VALUES (3, '管理员3号', '13431870348', '123', NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
