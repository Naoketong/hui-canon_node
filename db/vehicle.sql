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

 Date: 30/03/2020 15:34:02
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for vehicle
-- ----------------------------
DROP TABLE IF EXISTS `vehicle`;
CREATE TABLE `vehicle` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `car_name` varchar(255) DEFAULT NULL,
  `state` int(3) DEFAULT NULL COMMENT '车辆状态 1空闲 2租出 3维修保养',
  `level` int(3) DEFAULT NULL COMMENT '车型级别：1：经济型 2：SUV 3：中级车 4：豪华型 5：MPV 6：6至15座商务车',
  `car_img` varchar(500) DEFAULT NULL COMMENT '车辆照片',
  `created_time` datetime DEFAULT NULL,
  `price` varchar(10) DEFAULT NULL COMMENT '价格/日',
  `car_displacement` varchar(255) DEFAULT NULL COMMENT '汽车排量',
  `car_structure` varchar(255) DEFAULT NULL COMMENT '汽车结构',
  `isdeleted` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of vehicle
-- ----------------------------
BEGIN;
INSERT INTO `vehicle` VALUES (26, '保时捷panamera', 1, 4, 'http://q78bt83b2.bkt.clouddn.com/hui-canon/1584790645504_保时捷panamera.jpeg', '2020-03-23 15:42:47', '600', '2.9T', '掀背4座', NULL);
INSERT INTO `vehicle` VALUES (27, '奔驰S500', 2, 4, 'http://q78bt83b2.bkt.clouddn.com/hui-canon/1584790712813_奔驰S级.jpg', '2020-03-23 17:34:35', '500', '3.0T', '三厢5座', NULL);
INSERT INTO `vehicle` VALUES (28, '本田冠道', 1, 2, 'http://q78bt83b2.bkt.clouddn.com/hui-canon/1584791031066_本田冠道.jpg', '2020-03-21 19:43:55', '250', '2.0T', '5座 SUV', NULL);
INSERT INTO `vehicle` VALUES (29, '丰田卡罗拉', 2, 1, 'http://q78bt83b2.bkt.clouddn.com/hui-canon/1584864181178_丰田卡罗拉.jpg', '2020-03-22 16:03:31', '120', '1.5L', '三厢5座', NULL);
INSERT INTO `vehicle` VALUES (30, '大众帕萨特', 1, 3, 'http://q78bt83b2.bkt.clouddn.com/hui-canon/1584946800701_大众帕萨特.jpg', '2020-03-23 15:00:31', '300', '1.8T', '三厢5座', NULL);
INSERT INTO `vehicle` VALUES (31, '别克GL8', 1, 5, 'http://q78bt83b2.bkt.clouddn.com/hui-canon/1584947531873_%E5%88%AB%E5%85%8BGL8.jpg', '2020-03-23 15:16:25', '260', '2.0T', '七座MPV', NULL);
INSERT INTO `vehicle` VALUES (32, '江铃全顺', 1, 6, 'http://q78bt83b2.bkt.clouddn.com/hui-canon/1584947396950_江铃全顺.jpg', '2020-03-23 15:11:21', '180', '2.0T', '15座MPV ', NULL);
INSERT INTO `vehicle` VALUES (33, '大众速腾', 2, 1, 'http://q78bt83b2.bkt.clouddn.com/hui-canon/1584958628226_大众速腾.jpg', '2020-03-23 18:17:38', '120', '1.5T', '三厢5座', NULL);
INSERT INTO `vehicle` VALUES (34, '福田锐界', 1, 2, 'http://q78bt83b2.bkt.clouddn.com/hui-canon/1584958669362_福特锐界.jpg', '2020-03-23 18:18:29', '200', '2.0T', '七座SUV', NULL);
INSERT INTO `vehicle` VALUES (35, '丰田凯美瑞', 1, 3, 'http://q78bt83b2.bkt.clouddn.com/hui-canon/1584958718880_丰田凯美瑞.jpg', '2020-03-23 18:19:12', '180', '2.5L', '三厢5座', NULL);
INSERT INTO `vehicle` VALUES (36, '本田奥德赛', 2, 5, 'http://q78bt83b2.bkt.clouddn.com/hui-canon/1584958919006_本田奥德赛.jpg', '2020-03-23 18:22:50', '200', '2.0混动', '7座MPV', NULL);
INSERT INTO `vehicle` VALUES (37, '丰田雷凌', 1, 1, 'http://q78bt83b2.bkt.clouddn.com/hui-canon/1585313713807_丰田雷凌.jpg', '2020-03-27 20:55:47', '111', '1.8L', '三厢5座', NULL);
INSERT INTO `vehicle` VALUES (38, '奥迪A7', 1, 4, 'http://q78bt83b2.bkt.clouddn.com/hui-canon/1585313774691_奥迪A7.jpg', '2020-03-30 15:22:17', '350', '3.0T', '掀背5座', NULL);
INSERT INTO `vehicle` VALUES (39, '丰田汉兰达', 1, 2, 'http://q78bt83b2.bkt.clouddn.com/hui-canon/1585313832471_丰田汉兰达.jpg', '2020-03-27 20:57:42', '280', '2.0T', '7座SUV', NULL);
INSERT INTO `vehicle` VALUES (40, '雷克萨斯ES', 2, 4, 'http://q78bt83b2.bkt.clouddn.com/hui-canon/1585472421715_雷克萨斯ES.jpg', '2020-03-29 17:00:57', '270', '2.5L混动', '三厢5座', NULL);
INSERT INTO `vehicle` VALUES (41, '奔驰CLS', 3, 4, 'http://q78bt83b2.bkt.clouddn.com/hui-canon/1585539731317_奔驰CLS.jpeg', '2020-03-30 11:42:47', '280', '2.0T', '掀背5座', 1);
INSERT INTO `vehicle` VALUES (42, '奔驰CLS', 1, 4, 'http://q78bt83b2.bkt.clouddn.com/hui-canon/1585539809112_奔驰CLS.jpeg', '2020-03-30 11:44:24', '270', '2.0T', '掀背5座', NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
