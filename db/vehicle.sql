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

 Date: 24/03/2020 15:19:36
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
  `state` int(3) DEFAULT NULL COMMENT '车辆状态 0空闲 1租出 2维修保养',
  `level` int(3) DEFAULT NULL COMMENT '车型级别：0：经济型 1：SUV 2：中级车 3：豪华型 4：MPV 5：6至15座商务车',
  `car_img` varchar(500) DEFAULT NULL COMMENT '车辆照片',
  `created_time` datetime DEFAULT NULL,
  `price` varchar(10) DEFAULT NULL COMMENT '价格/日',
  `car_displacement` varchar(255) DEFAULT NULL COMMENT '汽车排量',
  `car_structure` varchar(255) DEFAULT NULL COMMENT '汽车结构',
  `isdeleted` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of vehicle
-- ----------------------------
BEGIN;
INSERT INTO `vehicle` VALUES (26, '保时捷panamera', 1, 3, 'http://q78bt83b2.bkt.clouddn.com/hui-canon/1584790645504_保时捷panamera.jpeg', '2020-03-23 15:42:47', '600', '2.9T', '掀背4座', NULL);
INSERT INTO `vehicle` VALUES (27, '奔驰S50', 0, 3, 'http://q78bt83b2.bkt.clouddn.com/hui-canon/1584790712813_奔驰S级.jpg', '2020-03-23 17:34:35', '500', '3.0T', '三厢5座', NULL);
INSERT INTO `vehicle` VALUES (28, '本田冠道', 1, 1, 'http://q78bt83b2.bkt.clouddn.com/hui-canon/1584791031066_本田冠道.jpg', '2020-03-21 19:43:55', '250', '2.0T', '5座 SUV', NULL);
INSERT INTO `vehicle` VALUES (29, '丰田卡罗拉', 1, 0, 'http://q78bt83b2.bkt.clouddn.com/hui-canon/1584864181178_丰田卡罗拉.jpg', '2020-03-22 16:03:31', '120', '1.5L', '三厢5座', NULL);
INSERT INTO `vehicle` VALUES (30, '大众帕萨特', 0, 2, 'http://q78bt83b2.bkt.clouddn.com/hui-canon/1584946800701_大众帕萨特.jpg', '2020-03-23 15:00:31', '300', '1.8T', '三厢5座', NULL);
INSERT INTO `vehicle` VALUES (31, '别克GL8', 1, 4, 'http://q78bt83b2.bkt.clouddn.com/hui-canon/1584947531873_%E5%88%AB%E5%85%8BGL8.jpg', '2020-03-23 15:16:25', '260', '2.0T', '七座MPV', NULL);
INSERT INTO `vehicle` VALUES (32, '江铃全顺', 0, 5, 'http://q78bt83b2.bkt.clouddn.com/hui-canon/1584947396950_江铃全顺.jpg', '2020-03-23 15:11:21', '180', '2.0T', '15座MPV ', NULL);
INSERT INTO `vehicle` VALUES (33, '大众速腾', 0, 0, 'http://q78bt83b2.bkt.clouddn.com/hui-canon/1584958628226_大众速腾.jpg', '2020-03-23 18:17:38', '120', '1.5T', '三厢5座', NULL);
INSERT INTO `vehicle` VALUES (34, '福田锐界', 0, 1, 'http://q78bt83b2.bkt.clouddn.com/hui-canon/1584958669362_福特锐界.jpg', '2020-03-23 18:18:29', '200', '2.0T', '七座SUV', NULL);
INSERT INTO `vehicle` VALUES (35, '丰田凯美瑞', 0, 2, 'http://q78bt83b2.bkt.clouddn.com/hui-canon/1584958718880_丰田凯美瑞.jpg', '2020-03-23 18:19:12', '180', '2.5L', '三厢5座', NULL);
INSERT INTO `vehicle` VALUES (36, '本田奥德赛', 1, 4, 'http://q78bt83b2.bkt.clouddn.com/hui-canon/1584958919006_本田奥德赛.jpg', '2020-03-23 18:22:50', '200', '2.0混动', '7座MPV', NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
