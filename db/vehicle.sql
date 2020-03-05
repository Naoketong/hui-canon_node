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

 Date: 05/03/2020 20:42:39
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
  `level` int(3) DEFAULT NULL COMMENT '车型级别：0：经济型 1：SUV 2：中级车 3：豪华型 4：商务型 5：6至15座商务车',
  `car_img` varchar(500) DEFAULT NULL COMMENT '车辆照片',
  `created_time` datetime DEFAULT NULL,
  `price` varchar(10) DEFAULT NULL COMMENT '价格/日',
  `car_displacement` varchar(255) DEFAULT NULL COMMENT '汽车排量',
  `car_structure` varchar(255) DEFAULT NULL COMMENT '汽车结构',
  `isdeleted` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of vehicle
-- ----------------------------
BEGIN;
INSERT INTO `vehicle` VALUES (1, '本田 冠道', 0, 1, 'http://q5ipb3766.bkt.clouddn.com/hui-canon/1581499892227_本田冠道.jpg', '2020-02-12 17:31:50', '200', '2.0T', 'SUV5座', NULL);
INSERT INTO `vehicle` VALUES (2, '别克 GL8', 0, 5, 'http://q5ipb3766.bkt.clouddn.com/hui-canon/1581499930984_别克GL8.jpg', '2020-02-12 17:32:23', '180', '2.5L', 'SUV7座', NULL);
INSERT INTO `vehicle` VALUES (3, '奔驰E级', 2, 3, 'http://q5ipb3766.bkt.clouddn.com/hui-canon/1581499835502_奔驰E级.jpg', '2020-02-12 17:30:49', '250', '1.5T', '三厢5座', NULL);
INSERT INTO `vehicle` VALUES (4, '大众速腾', 2, 0, 'http://q5ipb3766.bkt.clouddn.com/hui-canon/1581499998126_大众速腾.jpg', '2020-02-12 17:33:29', '115', '1.8L', '三厢5座', NULL);
INSERT INTO `vehicle` VALUES (5, '大众 帕萨特', 1, 2, 'http://q5ipb3766.bkt.clouddn.com/hui-canon/1581499757057_大众帕萨特.jpg', '2020-02-12 17:29:19', '250', '1.8T', '三厢5座', NULL);
INSERT INTO `vehicle` VALUES (6, '雷克萨斯 ES', 0, 3, 'http://q5ipb3766.bkt.clouddn.com/hui-canon/1582357408385_雷克萨斯ES.jpg', '2020-02-22 15:43:30', '230', '2.5L', '三厢5座', NULL);
INSERT INTO `vehicle` VALUES (7, '丰田 汉兰达', 0, 1, 'http://q5ipb3766.bkt.clouddn.com/hui-canon/1582959860940_丰田汉兰达.jpg', '2020-02-29 15:04:34', '250', '2.0T', 'SUV7座', NULL);
INSERT INTO `vehicle` VALUES (8, '捷豹XF', 0, 3, 'http://q5ipb3766.bkt.clouddn.com/hui-canon/1582959891152_捷豹XF.jpg', '2020-02-29 15:05:02', '300', '2.0T', '三厢5座', NULL);
INSERT INTO `vehicle` VALUES (9, '丰田 卡罗拉', 0, 4, 'http://q5ipb3766.bkt.clouddn.com/hui-canon/1582959917751_丰田卡罗拉.jpg', '2020-02-29 15:05:28', '130', '1.8L', '三厢5座', NULL);
INSERT INTO `vehicle` VALUES (10, '丰田 凯美瑞', 0, 2, 'http://q5ipb3766.bkt.clouddn.com/hui-canon/1582959943013_丰田凯美瑞.jpg', '2020-02-29 15:05:51', '180', '2.5混动', '三厢5座', NULL);
INSERT INTO `vehicle` VALUES (11, '福特 锐界', 0, 1, 'http://q5ipb3766.bkt.clouddn.com/hui-canon/1582959977299_福特锐界.jpg', '2020-02-29 15:06:25', '200', '2.0T', 'SUV7座', NULL);
INSERT INTO `vehicle` VALUES (12, '广汽 雷凌', 0, 0, 'http://q5ipb3766.bkt.clouddn.com/hui-canon/1582960008139_丰田雷凌.jpg', '2020-02-29 15:06:55', '150', '1.8L', '三厢5座', NULL);
INSERT INTO `vehicle` VALUES (13, 'panamera', 2, 3, 'http://q5ipb3766.bkt.clouddn.com/hui-canon/1583054650577_保时捷panamera.jpeg', '2020-03-01 17:34:08', '600', '2.9T', '掀背4座', NULL);
INSERT INTO `vehicle` VALUES (14, '奥迪A6', 0, 3, 'http://q5ipb3766.bkt.clouddn.com/hui-canon/1583055055577_奥迪A6.jpeg', '2020-03-01 17:34:42', '310', '2.0T', '三厢5座', NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
