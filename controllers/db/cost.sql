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

 Date: 10/03/2020 18:08:24
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cost
-- ----------------------------
BEGIN;
INSERT INTO `cost` VALUES (1, 1, '100', '55', '31', '186', NULL);
INSERT INTO `cost` VALUES (2, 2, '100', '20', '30', '150', NULL);
INSERT INTO `cost` VALUES (3, 3, '122', '55', '77', '288', NULL);
INSERT INTO `cost` VALUES (4, 4, '30', '50', '30', '110', NULL);
INSERT INTO `cost` VALUES (5, 5, '40', '20', '20', '80', NULL);
INSERT INTO `cost` VALUES (6, 6, '30', '39', '41', '110', NULL);
INSERT INTO `cost` VALUES (7, 8, '43', '66', '30', '139', NULL);
INSERT INTO `cost` VALUES (8, 9, '20', '30', '30', '80', NULL);
INSERT INTO `cost` VALUES (9, 10, '25', '33', '32', '90', NULL);
INSERT INTO `cost` VALUES (10, 11, '34', '41', '40', '115', NULL);
INSERT INTO `cost` VALUES (11, 12, '20', '30', '20', '70', NULL);
INSERT INTO `cost` VALUES (12, 13, '200', '80', '300', '580', NULL);
INSERT INTO `cost` VALUES (13, 14, '40', '43', '49', '132', NULL);
INSERT INTO `cost` VALUES (14, 10, '23', '23', '23', '69', NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
