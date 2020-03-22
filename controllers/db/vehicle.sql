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

 Date: 15/03/2020 18:18:47
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of vehicle
-- ----------------------------
BEGIN;
INSERT INTO `vehicle` VALUES (1, '本田 冠道', 1, 1, 'http://q78bt83b2.bkt.clouddn.com/hui-canon/1584266888750_%E6%9C%AC%E7%94%B0%E5%86%A0%E9%81%93.jpg', '2020-03-10 15:31:53', '150', '2.0T', 'SUV5座', NULL);
INSERT INTO `vehicle` VALUES (2, '别克 GL8', 1, 5, 'http://q78bt83b2.bkt.clouddn.com/hui-canon/1584266899818_%E5%88%AB%E5%85%8BGL8.jpg', '2020-03-10 18:10:51', '180', '2.5L', 'SUV7座', NULL);
INSERT INTO `vehicle` VALUES (3, '奔驰E级', 1, 3, 'http://q78bt83b2.bkt.clouddn.com/hui-canon/1584266872146_%E5%A5%94%E9%A9%B0E%E7%BA%A7.jpg', '2020-03-10 20:13:52', '250', '1.5T', '三厢5座', NULL);
INSERT INTO `vehicle` VALUES (4, '大众速腾', 0, 0, 'http://q78bt83b2.bkt.clouddn.com/hui-canon/1584266917233_%E5%A4%A7%E4%BC%97%E9%80%9F%E8%85%BE.jpg', '2020-03-14 10:49:23', '115', '1.8L', '三厢5座', NULL);
INSERT INTO `vehicle` VALUES (5, '大众 帕萨特', 1, 2, 'http://q78bt83b2.bkt.clouddn.com/hui-canon/1584266908336_%E5%A4%A7%E4%BC%97%E5%B8%95%E8%90%A8%E7%89%B9.jpg', '2020-02-12 17:29:19', '250', '1.8T', '三厢5座', NULL);
INSERT INTO `vehicle` VALUES (6, '雷克萨斯 ES', 1, 3, 'http://q78bt83b2.bkt.clouddn.com/hui-canon/1584267012091_%E9%9B%B7%E5%85%8B%E8%90%A8%E6%96%AFES.jpg', '2020-02-22 15:43:30', '230', '2.5L', '三厢5座', NULL);
INSERT INTO `vehicle` VALUES (7, '丰田 汉兰达', 0, 1, 'http://q78bt83b2.bkt.clouddn.com/hui-canon/1584266959577_%E4%B8%B0%E7%94%B0%E6%B1%89%E5%85%B0%E8%BE%BE.jpg', '2020-02-29 15:04:34', '250', '2.0T', 'SUV7座', NULL);
INSERT INTO `vehicle` VALUES (8, '捷豹XF', 1, 3, 'http://q78bt83b2.bkt.clouddn.com/hui-canon/1584267005088_%E6%8D%B7%E8%B1%B9XF.jpg', '2020-02-29 15:05:02', '300', '2.0T', '三厢5座', NULL);
INSERT INTO `vehicle` VALUES (9, '丰田 卡罗拉', 1, 4, 'http://q78bt83b2.bkt.clouddn.com/hui-canon/1584266967326_%E4%B8%B0%E7%94%B0%E5%8D%A1%E7%BD%97%E6%8B%89.jpg', '2020-02-29 15:05:28', '130', '1.8L', '三厢5座', NULL);
INSERT INTO `vehicle` VALUES (10, '丰田 凯美瑞', 1, 2, 'http://q78bt83b2.bkt.clouddn.com/hui-canon/1584266979301_%E4%B8%B0%E7%94%B0%E5%87%AF%E7%BE%8E%E7%91%9E.jpg', '2020-02-29 15:05:51', '180', '2.5混动', '三厢5座', NULL);
INSERT INTO `vehicle` VALUES (11, '福特 锐界', 0, 1, 'http://q78bt83b2.bkt.clouddn.com/hui-canon/1584266997568_%E7%A6%8F%E7%89%B9%E9%94%90%E7%95%8C.jpg', '2020-03-10 18:06:10', '200', '2.0T', 'SUV7座', NULL);
INSERT INTO `vehicle` VALUES (12, '广汽 雷凌', 0, 0, 'http://q78bt83b2.bkt.clouddn.com/hui-canon/1584266987351_%E4%B8%B0%E7%94%B0%E9%9B%B7%E5%87%8C.jpg', '2020-03-13 15:51:01', '150', '1.8L', '三厢5座', NULL);
INSERT INTO `vehicle` VALUES (13, 'panamera', 2, 3, 'http://q78bt83b2.bkt.clouddn.com/hui-canon/1584266854793_%E4%BF%9D%E6%97%B6%E6%8D%B7panamera.jpeg', '2020-03-01 17:34:08', '600', '2.9T', '掀背4座', NULL);
INSERT INTO `vehicle` VALUES (14, '奥迪A6', 0, 3, 'http://q78bt83b2.bkt.clouddn.com/hui-canon/1584266783184_%E5%A5%A5%E8%BF%AAA6.jpeg', '2020-03-01 17:34:42', '310', '2.0T', '三厢5座', NULL);
INSERT INTO `vehicle` VALUES (15, '奔驰CLS', 0, 3, 'http://q78bt83b2.bkt.clouddn.com/hui-canon/1584266863593_%E5%A5%94%E9%A9%B0CLS.jpeg', '2020-03-06 11:18:05', '300', '2.0T', '掀背5座', NULL);
INSERT INTO `vehicle` VALUES (16, '奥迪A7', 0, 3, 'http://q78bt83b2.bkt.clouddn.com/hui-canon/1584266793953_%E5%A5%A5%E8%BF%AAA7.jpg', '2020-03-06 11:21:07', '330', '3.0T', '掀背5座', NULL);
INSERT INTO `vehicle` VALUES (17, '奔驰S级', 0, 3, 'http://q78bt83b2.bkt.clouddn.com/hui-canon/1584266880881_%E5%A5%94%E9%A9%B0S%E7%BA%A7.jpg', '2020-03-06 11:24:52', '450', '2.0T', '三厢5座', 1);
INSERT INTO `vehicle` VALUES (18, '奔驰S级', 0, 3, 'http://q78bt83b2.bkt.clouddn.com/hui-canon/1584266880881_%E5%A5%94%E9%A9%B0S%E7%BA%A7.jpg', '2020-03-11 17:28:16', '600', '4.7T', '三厢4座', 1);
INSERT INTO `vehicle` VALUES (19, '奔驰S级', 0, 3, 'http://q78bt83b2.bkt.clouddn.com/hui-canon/1584266880881_%E5%A5%94%E9%A9%B0S%E7%BA%A7.jpg', '2020-03-11 17:33:59', '500', '4.7T', '三厢4座', 1);
INSERT INTO `vehicle` VALUES (20, '奔驰s 级', 0, 3, 'http://q78bt83b2.bkt.clouddn.com/hui-canon/1584266880881_%E5%A5%94%E9%A9%B0S%E7%BA%A7.jpg', '2020-03-11 17:35:02', '600', '4.7T', '三厢4座', 1);
INSERT INTO `vehicle` VALUES (25, '奔驰CLS', 0, 3, 'http://q78bt83b2.bkt.clouddn.com/hui-canon/1584266863593_%E5%A5%94%E9%A9%B0CLS.jpeg', '2020-03-11 17:41:39', '500', '2.0T', '掀背5座', NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
