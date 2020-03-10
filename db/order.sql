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

 Date: 10/03/2020 18:08:38
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of order
-- ----------------------------
BEGIN;
INSERT INTO `order` VALUES (1, '1583392214224584977', 1, '2020-03-05 15:10:14', '2020-03-05', '2020-03-07', '2', '董先生', '13559876543', 1, '586', 2, NULL, 1);
INSERT INTO `order` VALUES (2, '1583395918966706361', 1, '2020-03-05 16:11:59', '2020-03-05', '2020-03-07', '2', '李先生', '12345', 4, '340', 1, NULL, 2);
INSERT INTO `order` VALUES (3, '1583570542168631691', 1, '2020-03-07 16:42:22', '2020-03-01', '2020-03-07', '6', '李老板', '123', 13, '4180', 1, NULL, 3);
INSERT INTO `order` VALUES (4, '1583593376746222820', 3, '2020-03-09 17:20:40', '2020-03-07', '2020-03-10', '3', '董钊', '13559876543', 6, '800', 1, NULL, 4);
INSERT INTO `order` VALUES (5, '1583653121581006189', 1, '2020-03-08 15:38:42', '2020-03-08', '2020-03-10', '2', '齐麟', '13467890987', 2, '555', 1, NULL, 5);
INSERT INTO `order` VALUES (6, '1583749358244280168', 1, '2020-03-09 18:22:38', '2020-03-09', '2020-03-09', '0', '董先生', '13559876543', 3, '288', 1, NULL, 6);
INSERT INTO `order` VALUES (8, '1583759366020388955', 1, '2020-03-10 15:34:09', '2020-03-18', '2020-03-21', '3', '仓舒', '13456789098', 10, '636', 1, NULL, 8);
INSERT INTO `order` VALUES (9, '1583826756237760995', 1, '2020-03-10 18:06:10', '2020-03-10', '2020-03-11', '1', '测试', '13456789098', 2, '330', 1, NULL, 9);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
