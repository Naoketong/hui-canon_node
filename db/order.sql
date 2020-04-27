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

 Date: 27/04/2020 16:46:07
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
  `order_state` int(3) DEFAULT NULL COMMENT '订单状态 1：进行中 2：已完成 3：已取消 4：订单超时',
  `order_date` datetime DEFAULT NULL COMMENT '订单生成日期',
  `sat_at` varchar(255) DEFAULT NULL COMMENT '租车开始日期',
  `end_at` varchar(255) DEFAULT NULL COMMENT '租车结束日期',
  `rent_days` varchar(255) DEFAULT NULL COMMENT '租借天数',
  `name` varchar(255) DEFAULT NULL COMMENT '客户名字',
  `phone` varchar(255) DEFAULT NULL COMMENT '客户电话',
  `car_id` int(5) DEFAULT NULL COMMENT '车型信息 ',
  `cost_total` varchar(255) DEFAULT NULL COMMENT '总费用',
  `get_car` int(3) DEFAULT NULL COMMENT '取车状态：1未取车 2已取车',
  `timeout_cost` varchar(255) DEFAULT NULL COMMENT '超时费用',
  `timeout_days` varchar(255) DEFAULT NULL COMMENT '超时天数',
  `isdeleted` int(3) DEFAULT NULL,
  `order_id` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of order
-- ----------------------------
BEGIN;
INSERT INTO `order` VALUES (26, '1584791096670640164', 2, '2020-03-21 21:07:20', '2020-03-21', '2020-03-23', '1', '李明', '15078946587', 26, '1500', 2, NULL, NULL, NULL, 26);
INSERT INTO `order` VALUES (27, '1584863961872623415', 3, '2020-03-22 15:59:22', '2020-03-22', '2020-03-23', '1', '董先生', '13431870348', 27, '740', 2, NULL, NULL, NULL, 27);
INSERT INTO `order` VALUES (28, '1584956007893994004', 2, '2020-03-23 17:34:35', '2020-03-23', '2020-03-24', '1', '杨晓东', '13431313131', 28, '400', 1, NULL, NULL, NULL, 28);
INSERT INTO `order` VALUES (29, '1584960874986381335', 4, '2020-03-23 18:54:35', '2020-03-23', '2020-03-25', '2', '诸葛萌', '13457854621', 29, '3120', 2, '960', '8', NULL, 29);
INSERT INTO `order` VALUES (30, '1584961561453665803', 2, '2020-03-23 19:06:01', '2020-03-23', '2020-03-25', '2', '诸葛萌', '13457854621', 30, '840', 1, NULL, NULL, NULL, 30);
INSERT INTO `order` VALUES (31, '1584964171069534765', 3, '2020-03-23 19:49:31', '2020-03-23', '2020-03-29', '6', '诸葛萌', '13457854621', 36, '2550', 1, '', '', NULL, 31);
INSERT INTO `order` VALUES (32, '1584964265085418454', 2, '2020-03-23 19:51:05', '2020-03-23', '2020-03-25', '2', '董先生', '13431870348', 31, '670', 1, NULL, NULL, NULL, 32);
INSERT INTO `order` VALUES (33, '1585036162021644689', 3, '2020-03-24 15:49:22', '2019-03-24', '2020-03-25', '367', '董先生', '13431870348', 28, '91900', 1, NULL, NULL, NULL, 33);
INSERT INTO `order` VALUES (34, '1585036468990999696', 2, '2020-03-24 15:54:29', '2020-03-24', '2020-03-24', '1', '董先生', '13431870348', 33, '150', 1, NULL, NULL, NULL, 34);
INSERT INTO `order` VALUES (35, '1585042969764756392', 4, '2020-03-24 17:42:50', '2020-03-24', '2020-03-25', '1', '董先生', '13431870348', 33, '3390', 2, '960', '8', NULL, 35);
INSERT INTO `order` VALUES (36, '1585385024263623096', 4, '2020-03-28 16:43:44', '2020-03-28', '2020-03-29', '1', '双飞燕', '13435878745', 27, '6740', 2, '2000', '4', NULL, 36);
INSERT INTO `order` VALUES (37, '1585399630955839648', 3, '2020-03-28 20:47:11', '2020-03-29', '2020-03-30', '1', '董先生', '13431870348', 37, '261', 1, NULL, NULL, NULL, 37);
INSERT INTO `order` VALUES (38, '1585475699802802606', 4, '2020-03-29 17:55:00', '2020-03-29', '2020-03-31', '2', '徐媛婷', '15064874515', 40, '3210', 2, '540', '2', NULL, 38);
INSERT INTO `order` VALUES (39, '1585486117230257253', 3, '2020-03-29 20:48:37', '2020-03-29', '2020-03-31', '1', '徐媛婷', '15064874515', 38, '1350', 1, '700', '2', NULL, 39);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
