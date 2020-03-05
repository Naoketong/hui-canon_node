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

 Date: 05/03/2020 20:42:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `open_id` varchar(255) DEFAULT NULL,
  `car_id` int(3) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `isdeleted` int(3) DEFAULT NULL,
  `user_id` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES (1, '董先生', '123', 'otlem5F8ZRlM8OY1qovPXVtvoAZ8', NULL, '2020-03-05 15:04:58', NULL, NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
