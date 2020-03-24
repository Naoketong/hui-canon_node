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

 Date: 24/03/2020 15:19:22
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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of order
-- ----------------------------
BEGIN;
INSERT INTO `order` VALUES (26, '1584791096670640164', 2, '2020-03-21 21:07:20', '2020-03-21', '2020-03-23', '2', '李明', '15078946587', 26, '1500', 2, NULL, 26);
INSERT INTO `order` VALUES (27, '1584863961872623415', 3, '2020-03-22 15:59:22', '2020-03-22', '2020-03-23', '1', '董先生', '13431870348', 27, '740', 2, NULL, 27);
INSERT INTO `order` VALUES (28, '1584956007893994004', 1, '2020-03-23 17:34:35', '2020-03-23', '2020-03-24', '1', '杨晓东', '13431313131', 28, '400', 1, NULL, 28);
INSERT INTO `order` VALUES (29, '1584960874986381335', 1, '2020-03-23 18:54:35', '2020-03-23', '2020-03-25', '2', '诸葛萌', '13457854621', 29, '360', 2, NULL, 29);
INSERT INTO `order` VALUES (30, '1584961561453665803', 2, '2020-03-23 19:06:01', '2020-03-23', '2020-03-25', '2', '诸葛萌', '13457854621', 30, '840', 1, NULL, 30);
INSERT INTO `order` VALUES (31, '1584964171069534765', 1, '2020-03-23 19:49:31', '2020-03-23', '2020-03-29', '6', '诸葛萌', '13457854621', 36, '1350', 1, NULL, NULL);
INSERT INTO `order` VALUES (32, '1584964265085418454', 1, '2020-03-23 19:51:05', '2020-03-23', '2020-03-25', '2', '董先生', '13431870348', 31, '670', 1, NULL, NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
