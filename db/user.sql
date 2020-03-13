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

 Date: 13/03/2020 15:07:11
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES (1, '董先生', '13559876543', NULL, NULL, '2020-03-05 15:04:58', NULL, NULL);
INSERT INTO `user` VALUES (2, '李老板', '13459876555', NULL, NULL, '2020-03-06 18:51:56', NULL, NULL);
INSERT INTO `user` VALUES (3, '我都要', '13523456789', NULL, NULL, '2020-03-06 18:56:47', NULL, NULL);
INSERT INTO `user` VALUES (4, '王晓敏', '123', NULL, NULL, '2020-03-07 14:32:01', NULL, NULL);
INSERT INTO `user` VALUES (5, '李希1', '13456787358', NULL, NULL, '2020-03-12 21:28:16', NULL, NULL);
INSERT INTO `user` VALUES (6, '李希2', '13456783357', NULL, NULL, '2020-03-12 21:28:59', NULL, NULL);
INSERT INTO `user` VALUES (7, '李希3', '13431870345', 'otlem5F8ZRlM8OY1qovPXVtvoAZ8', NULL, '2020-03-12 21:33:38', NULL, NULL);
INSERT INTO `user` VALUES (8, '雷克明', '13422222222', 'otlem5F8ZRlM8OY1qovPXVtvoAZ8', NULL, '2020-03-12 21:34:39', NULL, NULL);
INSERT INTO `user` VALUES (9, '齐麟', '13467890987', NULL, NULL, '2020-03-12 21:34:49', NULL, NULL);
INSERT INTO `user` VALUES (10, '舞蹈服', '15023456789', 'otlem5F8ZRlM8OY1qovPXVtvoAZ8', NULL, '2020-03-12 21:37:14', NULL, NULL);
INSERT INTO `user` VALUES (11, '网名', '13423456789', 'otlem5F8ZRlM8OY1qovPXVtvoAZ8', NULL, '2020-03-12 21:38:49', NULL, NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
