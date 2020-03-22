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

 Date: 22/03/2020 16:58:05
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
  `is_online` int(3) NOT NULL COMMENT '是否线上用户： 1是 2否',
  `isdeleted` int(3) DEFAULT NULL,
  `user_id` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES (20, '王小明', '13556289888', NULL, NULL, '2020-03-21 18:06:45', 2, NULL, 20);
INSERT INTO `user` VALUES (22, '李明', '15078946587', NULL, NULL, '2020-03-21 19:44:57', 2, NULL, 22);
INSERT INTO `user` VALUES (23, '董先生', '13431870348', 'otlem5F8ZRlM8OY1qovPXVtvoAZ8', NULL, '2020-03-21 21:07:49', 1, NULL, 23);
INSERT INTO `user` VALUES (24, '徐媛婷', '15064874515', NULL, NULL, '2020-03-21 21:37:17', 2, NULL, NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
