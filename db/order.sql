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

 Date: 22/03/2020 16:57:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `order_number` varchar(255) DEFAULT NULL COMMENT '订单号',
  `order_state` int(3) DEFAULT NULL COMMENT '订单状态 1：进行中 2：已完成 3：已取消',
  `order_date` datetime DEFAULT NULL COMMENT '订单生成日期',
  `sat_at` varchar(255) DEFAULT NULL COMMENT '租车开始日期',
  `end_at` varchar(255) DEFAULT NULL COMMENT '租车结束日期',
  `rent_days` varchar(255) DEFAULT NULL COMMENT '租借天数',
  `name` varchar(255) DEFAULT NULL COMMENT '客户名字',
  `phone` varchar(255) DEFAULT NULL COMMENT '客户电话',
  `car_id` int(5) DEFAULT NULL COMMENT '车型信息 ',
  `cost_total` varchar(255) DEFAULT NULL COMMENT '总费用',
  `get_car` int(3) DEFAULT NULL COMMENT '取车状态：1未取车 2已取车',
  `isdeleted` int(3) DEFAULT NULL,
  `order_id` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of order
-- ----------------------------
BEGIN;
INSERT INTO `order` VALUES (26, '1584791096670640164', 2, '2020-03-21 21:07:20', '2020-03-21', '2020-03-23', '2', '李明', '15078946587', 26, '1500', 2, NULL, 26);
INSERT INTO `order` VALUES (27, '1584863961872623415', 1, '2020-03-22 15:59:22', '2020-03-22', '2020-03-23', '1', '董先生', '13431870348', 27, '740', 1, NULL, NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
