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

 Date: 27/04/2020 16:45:51
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of admin_user
-- ----------------------------
BEGIN;
INSERT INTO `admin_user` VALUES (1, '管理员1号', '13400000000', '6789', NULL);
INSERT INTO `admin_user` VALUES (2, '管理员2号', '13825465872', '123', NULL);
INSERT INTO `admin_user` VALUES (3, '管理员3号', '13454323456', '123', NULL);
INSERT INTO `admin_user` VALUES (4, '管理员4号', '13431870348', '123456', NULL);
INSERT INTO `admin_user` VALUES (5, '管理员5号', '13467890123', '123', NULL);
INSERT INTO `admin_user` VALUES (6, '管理员6号', '13467896568', '123456', 1);
INSERT INTO `admin_user` VALUES (7, '徐锦江', '13456789012', '123456', NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
