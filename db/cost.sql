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

 Date: 24/03/2020 15:19:15
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cost
-- ----------------------------
DROP TABLE IF EXISTS `cost`;
CREATE TABLE `cost` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `car_id` int(100) DEFAULT NULL COMMENT '车型id',
  `cost_basis` varchar(255) DEFAULT NULL COMMENT '基础服务费',
  `cost_servic` varchar(255) DEFAULT NULL COMMENT '车辆整备费',
  `cost_insurance` varchar(255) DEFAULT NULL COMMENT '车辆保险费',
  `cost_total` varchar(255) DEFAULT NULL COMMENT '除租赁费以外总费用',
  `isdeleted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cost
-- ----------------------------
BEGIN;
INSERT INTO `cost` VALUES (17, 26, '120', '120', '120', '360', NULL);
INSERT INTO `cost` VALUES (18, 27, '80', '80', '80', '240', NULL);
INSERT INTO `cost` VALUES (19, 28, '50', '50', '50', '150', NULL);
INSERT INTO `cost` VALUES (20, 29, '50', '40', '30', '120', NULL);
INSERT INTO `cost` VALUES (21, 30, '80', '80', '80', '240', NULL);
INSERT INTO `cost` VALUES (22, 31, '50', '50', '50', '150', NULL);
INSERT INTO `cost` VALUES (23, 32, '50', '50', '50', '150', NULL);
INSERT INTO `cost` VALUES (24, 33, '50', '50', '50', '150', NULL);
INSERT INTO `cost` VALUES (25, 34, '80', '80', '80', '240', NULL);
INSERT INTO `cost` VALUES (26, 35, '60', '60', '60', '180', NULL);
INSERT INTO `cost` VALUES (27, 36, '50', '50', '50', '150', NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
