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

 Date: 05/03/2020 20:42:19
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
  `isdeleted` int(3) DEFAULT NULL,
  `order_id` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of order
-- ----------------------------
BEGIN;
INSERT INTO `order` VALUES (1, '1583392214224584977', 1, '2020-03-05 15:10:14', '2020-03-05', '2020-03-07', '2', '董先生', '123', NULL, 1, '586', NULL, 23);
INSERT INTO `order` VALUES (2, '1583395918966706361', 1, '2020-03-05 16:11:59', '2020-03-05', '2020-03-07', '2', '董先生', '12345', NULL, 4, '340', NULL, NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
