/*
 Navicat Premium Data Transfer

 Source Server         : koni
 Source Server Type    : MySQL
 Source Server Version : 50523
 Source Host           : localhost:3306
 Source Schema         : campus_toolbox

 Target Server Type    : MySQL
 Target Server Version : 50523
 File Encoding         : 65001

 Date: 27/08/2023 13:28:53
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for check_classroom
-- ----------------------------
DROP TABLE IF EXISTS `check_classroom`;
CREATE TABLE `check_classroom`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `classroomNumber` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of check_classroom
-- ----------------------------
INSERT INTO `check_classroom` VALUES (1, '22215150514', '小明', '这是一个理由啊', '2023/07/21', '第1节', 'B201');
INSERT INTO `check_classroom` VALUES (2, '22215150514', '小明', '这是一个理由啊', '2023/07/21', '第1节', 'B201');
INSERT INTO `check_classroom` VALUES (3, '22215150515', '帕白', '理由在这', '2023/07/19', '第11节', 'A301');
INSERT INTO `check_classroom` VALUES (4, '22215150515', '帕白', '理由在这', '2023/07/19', '第11节', 'A301');
INSERT INTO `check_classroom` VALUES (5, '22215150515', '帕白', '理由在这', '2023/07/19', '第11节', 'A301');
INSERT INTO `check_classroom` VALUES (6, '22215150515', '帕白', '理由在这', '2023/07/19', '第11节', 'A301');
INSERT INTO `check_classroom` VALUES (7, '22215150515', '帕白', '理由在这', '2023/07/19', '第11节', 'A301');
INSERT INTO `check_classroom` VALUES (8, '22215150513', '请问', '理由在这啊', '2023/07/19', '第11节', 'A101');
INSERT INTO `check_classroom` VALUES (9, '22215150513', '请问', '理由在这啊', '2023/07/19', '第11节', 'A101');
INSERT INTO `check_classroom` VALUES (10, '22215150514', '卡拉米', '发发发', '2023/07/31', '第2节', 'E201');
INSERT INTO `check_classroom` VALUES (11, '22215150514', '卡拉米', '123123', '2023/07/31', '第3节', 'E201');
INSERT INTO `check_classroom` VALUES (12, '22215150514', '卡拉米', '子线程', '2023/07/31', '第5节', 'B202');
INSERT INTO `check_classroom` VALUES (13, '22215150514', '卡拉米', '子线程', '2023/07/31', '第3节', 'B102');
INSERT INTO `check_classroom` VALUES (14, '22215150514', '卡拉米', '12323', '2023/07/31', '第11节', 'B101');
INSERT INTO `check_classroom` VALUES (15, '22215150514', '卡拉米', '12323', '2023/07/31', '第11节', 'B101');
INSERT INTO `check_classroom` VALUES (16, '22215150514', '卡拉米', '12323', '2023/07/31', '第11节', 'B101');
INSERT INTO `check_classroom` VALUES (17, '22215150514', '卡拉米', '12323', '2023/07/31', '第11节', 'B101');
INSERT INTO `check_classroom` VALUES (18, '22215150514', '卡拉米', '12323', '2023/07/31', '第11节', 'B101');
INSERT INTO `check_classroom` VALUES (19, '22215150514', '卡拉米', '12323', '2023/07/31', '第11节', 'B101');
INSERT INTO `check_classroom` VALUES (20, '22215150514', '卡拉米', '12323', '2023/07/31', '第11节', 'B101');
INSERT INTO `check_classroom` VALUES (21, '22215150514', '卡拉米', '12323', '2023/07/31', '第11节', 'B101');
INSERT INTO `check_classroom` VALUES (22, '22215150514', '卡拉米', '12323', '2023/07/31', '第2节', 'B102');
INSERT INTO `check_classroom` VALUES (23, '22215150514', '卡拉米', '你你你您您', '2023/06/27', '第4节', 'A201');
INSERT INTO `check_classroom` VALUES (24, '22215150514', '卡拉米', '哈哈哈', '2023/07/13', '第3节', 'D104');
INSERT INTO `check_classroom` VALUES (25, '22215150514', '卡拉米', '子线程', '2023/08/01', '第11节', 'A101');
INSERT INTO `check_classroom` VALUES (26, '22215150514', '卡拉米', '123123', '2023/08/01', '第6节', 'A104');
INSERT INTO `check_classroom` VALUES (27, '22215150514', '卡拉米', '气温气温', '2023/08/01', '第1节', 'A101');
INSERT INTO `check_classroom` VALUES (28, '22215150514', '卡拉米', '发发发发发', '2023/08/01', '第4节', 'A101');
INSERT INTO `check_classroom` VALUES (29, '22215150514', '卡拉米', 'xx级xx班开班会', '2023/08/02', '第2节', 'A301');
INSERT INTO `check_classroom` VALUES (30, '22215150514', '卡拉米', 'xx级xx班开班会啊', '2023/08/02', '第12节', 'A301');
INSERT INTO `check_classroom` VALUES (31, '22215150514', '卡拉米', 'xx级xx班开班会啊', '2023/08/02', '第1节', 'A301');
INSERT INTO `check_classroom` VALUES (32, '22215150514', '卡拉米', 'xx级xx班开班会啊', '2023/08/02', '第6节', 'A301');
INSERT INTO `check_classroom` VALUES (33, '22215150514', '卡拉米', '撒大声地速度所', '2023/08/04', '第4节', 'A105');
INSERT INTO `check_classroom` VALUES (34, '22215150514', '卡拉米', '啥第三方撒打发是', '2023/08/07', '第1节', 'A101');
INSERT INTO `check_classroom` VALUES (35, '22215150514', '卡拉米', '发发发', '2023/08/07', '第1节', 'A105');
INSERT INTO `check_classroom` VALUES (36, '22215150514', '卡拉米', '撒大声地', '2023/08/09', '第1节', 'A101');
INSERT INTO `check_classroom` VALUES (37, '22215150514', '卡拉米', 'dfgdfg', '2023/08/09', '第1节', 'A101');
INSERT INTO `check_classroom` VALUES (38, '22215150514', '卡拉米', '啊实打实', '2023/08/11', '第2节', 'C106');
INSERT INTO `check_classroom` VALUES (39, '22215150514', '卡拉米', '的发鬼地方', '2023/08/13', '第12节', 'A101');
INSERT INTO `check_classroom` VALUES (40, '22215150514', '卡拉米', 'sssss', '2023/08/15', '第12节', 'E201');
INSERT INTO `check_classroom` VALUES (41, '22215150514', '卡拉米', '4324234', '2023/08/15', '第8节', 'C202');
INSERT INTO `check_classroom` VALUES (42, '22215150514', '卡拉米', '开班会', '2023/08/26', '第3节', 'B101');

-- ----------------------------
-- Table structure for result_classroom
-- ----------------------------
DROP TABLE IF EXISTS `result_classroom`;
CREATE TABLE `result_classroom`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `classroomNumber` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of result_classroom
-- ----------------------------
INSERT INTO `result_classroom` VALUES (1, '22215150514', '帕白', '这是一个申请原因', '2023/07/12', '第11节 20:25-21:10', 'A203', 'true');
INSERT INTO `result_classroom` VALUES (2, '22215150544', '小明', '这又是一个申请原因', '2023/07/12', '第6节 14:50-15:35', 'A201', 'true');
INSERT INTO `result_classroom` VALUES (3, '22215150514', '帕白', '这还是一个申请原因', '2023/07/12', '第4节 11:15-12:00', 'A201', 'true');
INSERT INTO `result_classroom` VALUES (4, '22215150514', '帕白', '这怎么还是一个申请原因', '2023/12/10', '第4节 11:15-12:00', 'B202', 'true');
INSERT INTO `result_classroom` VALUES (5, '22215150544', '小明', '这tm的还是一个申请原因', '2023/07/19', '第11节 20:25-21:10', 'A202', 'true');
INSERT INTO `result_classroom` VALUES (6, '22215150544', '小明', '这tm怎么还是一个申请原因', '2023/07/18', '第1节 8:30-9:15', 'A201', 'false');
INSERT INTO `result_classroom` VALUES (7, '22215150544', '小明', '这tm怎么还是一个申请原因', '2023/07/18', '第1节 8:30-9:15', 'A201', 'true');

-- ----------------------------
-- Table structure for result_lost_found
-- ----------------------------
DROP TABLE IF EXISTS `result_lost_found`;
CREATE TABLE `result_lost_found`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `item` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `brand` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `contact` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `switch` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `overdue` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 149 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of result_lost_found
-- ----------------------------
INSERT INTO `result_lost_found` VALUES (2, '22215150599', '小明', '寻', '手表', '小米', 'A栋203', '无', '微信989898', '2023/07/16', 'off', 'false');
INSERT INTO `result_lost_found` VALUES (4, '22115150514', '小王', '拾', 'ipad', '苹果', '图书馆三楼', '黑色保护壳', '1745683476', '2023/07/17', 'on', 'false');
INSERT INTO `result_lost_found` VALUES (5, '22251150514', '小吴', '拾', '手机', '红米', '运动场', '无', '1456324534', '2023/07/17', 'on', 'false');
INSERT INTO `result_lost_found` VALUES (6, '22211150514', '小鹏', '寻', '书包', '无/暂不清楚', 'a栋102', '书包里有一本高等数学，一个眼镜盒，一个水杯', 'vx:325dsfdsf', '2023/07/17', 'on', 'false');
INSERT INTO `result_lost_found` VALUES (10, '22215631514', '小智', '寻', '充电宝', '紫米', '第三饭堂', '紫粉渐变色的', 'QQ343554532', '2023/07/17', 'on', 'false');
INSERT INTO `result_lost_found` VALUES (11, '22265150514', '小编', '拾', '包包', '无/暂不清楚', 'F栋302', '包里有一个钱包，内有现金300元', '微信:1247834qwe', '2023/07/18', 'on', 'false');
INSERT INTO `result_lost_found` VALUES (12, '22215141514', '小茹', '寻', '高等数学', '人民出版社', 'h栋102', '无', '1895476843', '2023/07/18', 'on', 'false');
INSERT INTO `result_lost_found` VALUES (13, '22215197914', '小幽', '拾', '眼镜', '无/暂不清楚', 'a栋401', '黑框眼镜', '1823496703', '2023/07/18', 'on', 'false');
INSERT INTO `result_lost_found` VALUES (15, '27425150514', '小胖', '拾', 'USB充电线', '无/暂不清楚', '第一饭堂', '无', 'vx18547648xxx', '2023/07/18', 'on', 'false');
INSERT INTO `result_lost_found` VALUES (16, '22216650514', '小法', '寻', '身份证', '无/暂不清楚', '学校大门', '是小法的身份证', '1523869456', '2023/07/18', 'on', 'false');
INSERT INTO `result_lost_found` VALUES (17, '22315150514', '小飞', '寻', '头戴耳机', '铁三角', 'C栋301', '外观是粉色的', 'QQ:347853283', '2023/07/18', 'on', 'false');
INSERT INTO `result_lost_found` VALUES (18, '22215150534', '小安', '拾', '无线键盘', '无/暂不清楚', 'd栋101', '无', '32146745@qq.com', '2023/07/18', 'on', 'false');
INSERT INTO `result_lost_found` VALUES (19, '22215435514', '小蓝', '拾', '充电头', 'IQOO', '学校大门外的共享单车车篮', '120w充电的', 'sauy23497y@gmail.com', '2023/07/18', 'on', 'false');
INSERT INTO `result_lost_found` VALUES (20, '22215150514', '小爱', '拾', '钥匙', '无/暂不清楚', '湖边篮球场', '无', '17435627364', '2023/07/19', 'off', 'true');
INSERT INTO `result_lost_found` VALUES (21, '22215150514', '卡拉米', '拾', '书包', '无/暂不清楚', '图书馆1楼', '包里有一串钥匙，两本小说', '194577823433', '2023/07/19', 'on', 'false');
INSERT INTO `result_lost_found` VALUES (22, '22315150514', '小飞', '拾', '书包', '无/暂不清楚', '操场', '书包是白色的', '17485634853', '2023/07/19', 'on', 'false');
INSERT INTO `result_lost_found` VALUES (23, '22215631514', '小智', '拾', 'ipad', '苹果', 'd栋201', '无', '17836458358', '2023/07/19', 'on', 'false');
INSERT INTO `result_lost_found` VALUES (25, '22115150514', '小王', '寻', '鼠标', '罗技', '图书馆2楼', '是g102，紫色的', '18543652576', '2023/07/19', 'on', 'false');
INSERT INTO `result_lost_found` VALUES (26, '22215197914', '小幽', '拾', '眼镜', '无/暂不清楚', 'a栋401', '黑框大眼镜', '1809132436703', '2023/07/19', 'on', 'false');
INSERT INTO `result_lost_found` VALUES (28, '22251150514', '小吴', '寻', 'USB充电线', '无/暂不清楚', '第一饭堂', '无', 'vx13547648x1xx', '2023/07/20', 'on', 'false');
INSERT INTO `result_lost_found` VALUES (30, '22215150514', '卡拉米', '拾', '手机', '荣耀', '操场', '屏幕左上方碎了', '15436364576', '2023/07/20', 'on', 'false');
INSERT INTO `result_lost_found` VALUES (32, '22775150514', '小爱', '拾', '钥匙', '无/暂不清楚', '湖边篮球场', '无', '17435627364', '2023/07/20', 'on', 'false');
INSERT INTO `result_lost_found` VALUES (34, '22265150514', '小编', '拾', '包包', '无/暂不清楚', 'F栋302', '包里有一个钱包，内有现金300元', '微信:1247834qwe', '2023/07/21', 'on', 'false');
INSERT INTO `result_lost_found` VALUES (35, '22715150514', '小欧', '拾', '学生证', '无/暂不清楚', '操场', '是22软工班小法的学生证', '19438539556', '2023/07/21', 'on', 'false');
INSERT INTO `result_lost_found` VALUES (146, '22215150514', '卡拉米', '拾', '水杯', '无/暂不清楚', '操场', '灰色的', '1234352332', '2023/08/17', 'on', 'false');
INSERT INTO `result_lost_found` VALUES (147, '22215150514', '卡拉米', '寻', '耳机', '华为', '操场', '白色的', '12437582234', '2023/08/25', 'off', 'false');
INSERT INTO `result_lost_found` VALUES (148, '22215150514', '卡拉米', '拾', '高等数学', '无/暂不清楚', '操场', '无', '1231234234', '2023/08/27', 'on', 'false');

-- ----------------------------
-- Table structure for result_seat
-- ----------------------------
DROP TABLE IF EXISTS `result_seat`;
CREATE TABLE `result_seat`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `floor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `seat` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 438 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of result_seat
-- ----------------------------
INSERT INTO `result_seat` VALUES (1, '22215150555', '帕白', '一楼', '2023/08/27', 'A11', '12:10-14:20', '3座');
INSERT INTO `result_seat` VALUES (2, '22215150552', '小法', '一楼', '2023/08/27', 'A11', '12:10-14:20', '1座');
INSERT INTO `result_seat` VALUES (3, '22215150550', '小鹅', '一楼', '2023/08/27', 'A12', '08:00-12:00', '2座');
INSERT INTO `result_seat` VALUES (5, '22215150551', '小明', '一楼', '2023/08/27', 'A12', '08:30-10:20', '1座');
INSERT INTO `result_seat` VALUES (6, '22215150552', '小怪', '一楼', '2023/08/27', 'A11', '09:00-12:00', '1座');
INSERT INTO `result_seat` VALUES (140, '22215150599', '卡拉米', '一楼', '2023/08/27', 'A41', '00:00-00:47', '1座');
INSERT INTO `result_seat` VALUES (141, '22215150599', '卡拉米', '一楼', '2023/08/27', 'A42', '00:00-00:47', '2座');
INSERT INTO `result_seat` VALUES (142, '22215150599', '卡拉米', '一楼', '2023/08/27', 'A42', '00:00-00:47', '1座');
INSERT INTO `result_seat` VALUES (143, '22215150599', '卡拉米', '一楼', '2023/08/27', 'A42', '00:00-00:47', '3座');
INSERT INTO `result_seat` VALUES (144, '22215150599', '卡拉米', '一楼', '2023/08/27', 'A43', '00:00-00:47', '1座');
INSERT INTO `result_seat` VALUES (145, '22215150599', '卡拉米', '一楼', '2023/08/27', 'A43', '00:00-00:47', '2座');
INSERT INTO `result_seat` VALUES (146, '22215150599', '卡拉米', '一楼', '2023/08/27', 'A43', '00:00-00:47', '3座');
INSERT INTO `result_seat` VALUES (147, '22215150599', '卡拉米', '一楼', '2023/08/27', 'A43', '00:00-00:47', '4座');
INSERT INTO `result_seat` VALUES (148, '22215150599', '卡拉米', '一楼', '2023/08/27', 'A43', '01:00-01:47', '1座');
INSERT INTO `result_seat` VALUES (149, '22215150599', '卡拉米', '一楼', '2023/08/27', 'A44', '01:00-01:47', '1座');
INSERT INTO `result_seat` VALUES (150, '22215150599', '卡拉米', '一楼', '2023/08/27', 'A44', '01:00-01:47', '2座');
INSERT INTO `result_seat` VALUES (151, '22215150599', '卡拉米', '一楼', '2023/08/27', 'A44', '01:00-01:47', '3座');
INSERT INTO `result_seat` VALUES (152, '22215150599', '卡拉米', '一楼', '2023/08/27', 'A44', '01:00-01:47', '4座');
INSERT INTO `result_seat` VALUES (153, '22215150599', '卡拉米', '一楼', '2023/08/27', 'A44', '02:00-02:47', '1座');
INSERT INTO `result_seat` VALUES (154, '22215150599', '卡拉米', '一楼', '2023/08/27', 'A44', '02:00-02:47', '2座');
INSERT INTO `result_seat` VALUES (155, '22215150599', '卡拉米', '一楼', '2023/08/27', 'A44', '02:00-02:47', '3座');
INSERT INTO `result_seat` VALUES (156, '22215150599', '卡拉米', '一楼', '2023/08/27', 'A45', '02:00-02:47', '1座');
INSERT INTO `result_seat` VALUES (157, '22215150599', '卡拉米', '一楼', '2023/08/27', 'A45', '02:00-02:47', '2座');
INSERT INTO `result_seat` VALUES (158, '22215150599', '卡拉米', '一楼', '2023/08/27', 'A45', '02:00-02:47', '3座');
INSERT INTO `result_seat` VALUES (159, '22215150599', '卡拉米', '一楼', '2023/08/27', 'A45', '02:00-02:47', '4座');
INSERT INTO `result_seat` VALUES (160, '22215150599', '卡拉米', '一楼', '2023/08/27', 'A45', '03:00-03:47', '1座');
INSERT INTO `result_seat` VALUES (161, '22215150599', '卡拉米', '一楼', '2023/08/27', 'A45', '03:00-03:47', '2座');
INSERT INTO `result_seat` VALUES (162, '22215150599', '卡拉米', '一楼', '2023/08/27', 'A45', '03:00-03:47', '3座');
INSERT INTO `result_seat` VALUES (163, '22215150599', '卡拉米', '一楼', '2023/08/27', 'A45', '03:00-03:47', '4座');
INSERT INTO `result_seat` VALUES (164, '22215150599', '卡拉米', '一楼', '2023/08/27', 'A45', '04:00-04:47', '1座');
INSERT INTO `result_seat` VALUES (165, '22215150599', '卡拉米', '一楼', '2023/08/27', 'C32', '04:00-04:47', '1座');
INSERT INTO `result_seat` VALUES (166, '22215150599', '卡拉米', '一楼', '2023/08/27', 'B33', '08:00-12:00', '4座');
INSERT INTO `result_seat` VALUES (167, '22215150599', '卡拉米', '一楼', '2023/08/27', 'B33', '08:00-12:00', '1座');
INSERT INTO `result_seat` VALUES (168, '22215150599', '卡拉米', '一楼', '2023/08/27', 'B33', '09:00-10:00', '3座');
INSERT INTO `result_seat` VALUES (169, '22215150599', '卡拉米', '一楼', '2023/08/27', 'B33', '09:00-10:00', '2座');
INSERT INTO `result_seat` VALUES (170, '22215150599', '卡拉米', '一楼', '2023/08/27', 'B33', '13:00-14:00', '1座');
INSERT INTO `result_seat` VALUES (171, '22215150599', '卡拉米', '一楼', '2023/08/27', 'C27', '00:00-23:59', '1座');
INSERT INTO `result_seat` VALUES (172, '22215150599', '卡拉米', '一楼', '2023/08/27', 'C48', '00:00-23:59', '3座');
INSERT INTO `result_seat` VALUES (173, '22215150599', '卡拉米', '一楼', '2023/08/27', 'C48', '00:00-23:59', '2座');
INSERT INTO `result_seat` VALUES (174, '22215150599', '卡拉米', '一楼', '2023/08/27', 'C48', '00:00-23:59', '4座');
INSERT INTO `result_seat` VALUES (175, '22215150599', '卡拉米', '一楼', '2023/08/27', 'A21', '03:00-23:59', '1座');
INSERT INTO `result_seat` VALUES (176, '22215150599', '卡拉米', '一楼', '2023/08/27', 'A24', '03:00-23:59', '4座');
INSERT INTO `result_seat` VALUES (177, '22215150599', '卡拉米', '一楼', '2023/08/27', 'A36', '03:00-23:59', '1座');
INSERT INTO `result_seat` VALUES (178, '22215150599', '卡拉米', '一楼', '2023/08/27', 'A16', '03:00-23:59', '1座');
INSERT INTO `result_seat` VALUES (179, '22215150599', '卡拉米', '一楼', '2023/08/27', 'A15', '03:00-23:59', '1座');
INSERT INTO `result_seat` VALUES (180, '22215150599', '卡拉米', '一楼', '2023/08/27', 'C12', '03:00-23:59', '1座');
INSERT INTO `result_seat` VALUES (181, '22215150599', '卡拉米', '一楼', '2023/08/27', 'A48', '03:00-23:59', '1座');
INSERT INTO `result_seat` VALUES (182, '22215150599', '卡拉米', '一楼', '2023/08/27', 'A27', '03:00-23:59', '1座');
INSERT INTO `result_seat` VALUES (183, '22215150599', '卡拉米', '一楼', '2023/08/27', 'A33', '03:00-23:59', '1座');
INSERT INTO `result_seat` VALUES (184, '22215150599', '卡拉米', '一楼', '2023/08/27', 'A32', '03:00-23:59', '1座');
INSERT INTO `result_seat` VALUES (185, '22215150599', '卡拉米', '一楼', '2023/08/27', 'C13', '03:00-23:59', '1座');
INSERT INTO `result_seat` VALUES (186, '22215150599', '卡拉米', '一楼', '2023/08/27', 'C24', '03:00-23:59', '1座');
INSERT INTO `result_seat` VALUES (187, '22215150599', '卡拉米', '一楼', '2023/08/27', 'C34', '03:00-23:59', '1座');
INSERT INTO `result_seat` VALUES (188, '22215150599', '卡拉米', '一楼', '2023/08/27', 'C15', '03:00-23:59', '1座');
INSERT INTO `result_seat` VALUES (189, '22215150599', '卡拉米', '一楼', '2023/08/27', 'C41', '03:00-23:59', '1座');
INSERT INTO `result_seat` VALUES (190, '22215150599', '卡拉米', '一楼', '2023/08/27', 'C43', '03:00-23:59', '1座');
INSERT INTO `result_seat` VALUES (191, '22215150599', '卡拉米', '一楼', '2023/08/27', 'C18', '03:00-23:59', '1座');
INSERT INTO `result_seat` VALUES (192, '22215150599', '卡拉米', '一楼', '2023/08/27', 'C21', '03:00-23:59', '1座');
INSERT INTO `result_seat` VALUES (193, '22215150599', '卡拉米', '一楼', '2023/08/27', 'C36', '03:00-23:59', '1座');
INSERT INTO `result_seat` VALUES (194, '22215150599', '卡拉米', '一楼', '2023/08/27', 'C46', '03:00-23:59', '1座');
INSERT INTO `result_seat` VALUES (195, '22215150599', '卡拉米', '一楼', '2023/08/27', 'B11', '03:00-23:59', '1座');
INSERT INTO `result_seat` VALUES (196, '22215150599', '卡拉米', '一楼', '2023/08/27', 'B22', '03:00-23:59', '1座');
INSERT INTO `result_seat` VALUES (197, '22215150599', '卡拉米', '一楼', '2023/08/27', 'B26', '03:00-23:59', '1座');
INSERT INTO `result_seat` VALUES (198, '22215150599', '卡拉米', '一楼', '2023/08/27', 'B41', '03:00-23:59', '1座');
INSERT INTO `result_seat` VALUES (199, '22215150599', '卡拉米', '一楼', '2023/08/27', 'B48', '03:00-23:59', '1座');
INSERT INTO `result_seat` VALUES (200, '22215150599', '卡拉米', '一楼', '2023/08/27', 'B28', '03:00-23:59', '1座');
INSERT INTO `result_seat` VALUES (201, '22215150599', '卡拉米', '一楼', '2023/08/27', 'B35', '03:00-23:59', '1座');
INSERT INTO `result_seat` VALUES (202, '22215150599', '卡拉米', '一楼', '2023/08/27', 'B46', '03:00-23:59', '1座');
INSERT INTO `result_seat` VALUES (203, '22215150599', '卡拉米', '一楼', '2023/08/27', 'B44', '03:00-23:59', '1座');
INSERT INTO `result_seat` VALUES (204, '22215150599', '卡拉米', '一楼', '2023/08/27', 'B14', '03:00-23:59', '1座');
INSERT INTO `result_seat` VALUES (205, '22215150599', '卡拉米', '一楼', '2023/08/27', 'B16', '03:00-23:59', '1座');
INSERT INTO `result_seat` VALUES (206, '22215150599', '卡拉米', '一楼', '2023/08/27', 'B17', '03:00-23:59', '1座');
INSERT INTO `result_seat` VALUES (207, '22215150599', '卡拉米', '一楼', '2023/08/27', 'B18', '03:00-23:59', '1座');
INSERT INTO `result_seat` VALUES (208, '22215150599', '卡拉米', '一楼', '2023/08/27', 'B34', '03:00-23:59', '1座');
INSERT INTO `result_seat` VALUES (209, '22215150599', '卡拉米', '一楼', '2023/08/27', 'B13', '03:00-23:59', '1座');
INSERT INTO `result_seat` VALUES (210, '22215150599', '卡拉米', '一楼', '2023/08/27', 'D11', '03:00-23:59', '1座');
INSERT INTO `result_seat` VALUES (211, '22215150599', '卡拉米', '一楼', '2023/08/27', 'D13', '03:00-23:59', '1座');
INSERT INTO `result_seat` VALUES (212, '22215150599', '卡拉米', '一楼', '2023/08/27', 'D32', '03:00-23:59', '1座');
INSERT INTO `result_seat` VALUES (213, '22215150599', '卡拉米', '一楼', '2023/08/27', 'D25', '03:00-23:59', '1座');
INSERT INTO `result_seat` VALUES (214, '22215150599', '卡拉米', '一楼', '2023/08/27', 'D16', '03:00-23:59', '1座');
INSERT INTO `result_seat` VALUES (215, '22215150599', '卡拉米', '一楼', '2023/08/27', 'D17', '03:00-23:59', '1座');
INSERT INTO `result_seat` VALUES (216, '22215150599', '卡拉米', '一楼', '2023/08/27', 'D37', '03:00-23:59', '1座');
INSERT INTO `result_seat` VALUES (217, '22215150599', '卡拉米', '一楼', '2023/08/27', 'D34', '03:00-23:59', '1座');
INSERT INTO `result_seat` VALUES (218, '22215150599', '卡拉米', '一楼', '2023/08/27', 'D45', '03:00-23:59', '1座');
INSERT INTO `result_seat` VALUES (219, '22215150599', '卡拉米', '一楼', '2023/08/27', 'D43', '03:00-23:59', '1座');
INSERT INTO `result_seat` VALUES (220, '22215150599', '卡拉米', '一楼', '2023/08/27', 'D48', '03:00-23:59', '1座');
INSERT INTO `result_seat` VALUES (221, '22215150599', '卡拉米', '一楼', '2023/08/27', 'D18', '03:00-23:59', '1座');
INSERT INTO `result_seat` VALUES (222, '22215150599', '卡拉米', '一楼', '2023/08/27', 'D26', '03:00-23:59', '1座');
INSERT INTO `result_seat` VALUES (223, '22215150599', '卡拉米', '一楼', '2023/08/27', 'A35', '03:00-23:59', '1座');
INSERT INTO `result_seat` VALUES (224, '22215150599', '卡拉米', '一楼', '2023/08/27', 'A26', '03:00-23:59', '1座');
INSERT INTO `result_seat` VALUES (225, '22215150599', '卡拉米', '一楼', '2023/08/27', 'C12', '03:00-23:59', '2座');
INSERT INTO `result_seat` VALUES (226, '22215150599', '卡拉米', '一楼', '2023/08/27', 'C12', '03:00-23:59', '4座');
INSERT INTO `result_seat` VALUES (227, '22215150599', '卡拉米', '一楼', '2023/08/27', 'C13', '03:00-23:59', '4座');
INSERT INTO `result_seat` VALUES (228, '22215150599', '卡拉米', '一楼', '2023/08/27', 'C13', '03:00-23:59', '2座');
INSERT INTO `result_seat` VALUES (229, '22215150599', '卡拉米', '一楼', '2023/08/27', 'C13', '03:00-23:59', '3座');
INSERT INTO `result_seat` VALUES (230, '22215150599', '卡拉米', '一楼', '2023/08/27', 'C13', '00:00-00:36', '1座');
INSERT INTO `result_seat` VALUES (231, '22215150599', '卡拉米', '一楼', '2023/08/27', 'C34', '00:00-00:36', '1座');
INSERT INTO `result_seat` VALUES (232, '22215150599', '卡拉米', '一楼', '2023/08/27', 'C34', '00:00-00:36', '2座');
INSERT INTO `result_seat` VALUES (233, '22215150599', '卡拉米', '一楼', '2023/08/27', 'C34', '00:00-00:36', '3座');
INSERT INTO `result_seat` VALUES (234, '22215150599', '卡拉米', '一楼', '2023/08/27', 'C34', '00:00-00:36', '4座');
INSERT INTO `result_seat` VALUES (235, '22215150599', '卡拉米', '一楼', '2023/08/27', 'C43', '00:00-00:36', '1座');
INSERT INTO `result_seat` VALUES (236, '22215150599', '卡拉米', '一楼', '2023/08/27', 'C43', '00:00-00:36', '2座');
INSERT INTO `result_seat` VALUES (237, '22215150599', '卡拉米', '一楼', '2023/08/27', 'C43', '00:00-00:36', '3座');
INSERT INTO `result_seat` VALUES (238, '22215150599', '卡拉米', '一楼', '2023/08/27', 'C43', '00:00-00:36', '4座');
INSERT INTO `result_seat` VALUES (239, '22215150599', '卡拉米', '一楼', '2023/08/27', 'C27', '00:00-00:36', '4座');
INSERT INTO `result_seat` VALUES (240, '22215150599', '卡拉米', '一楼', '2023/08/27', 'C27', '00:00-00:36', '3座');
INSERT INTO `result_seat` VALUES (241, '22215150599', '卡拉米', '一楼', '2023/08/27', 'C27', '00:00-00:36', '2座');
INSERT INTO `result_seat` VALUES (242, '22215150599', '卡拉米', '一楼', '2023/08/27', 'C21', '00:00-00:36', '1座');
INSERT INTO `result_seat` VALUES (243, '22215150599', '卡拉米', '一楼', '2023/08/27', 'C21', '00:00-00:36', '2座');
INSERT INTO `result_seat` VALUES (244, '22215150599', '卡拉米', '一楼', '2023/08/27', 'C21', '00:00-00:36', '3座');
INSERT INTO `result_seat` VALUES (245, '22215150599', '卡拉米', '一楼', '2023/08/27', 'C21', '00:00-00:36', '4座');
INSERT INTO `result_seat` VALUES (246, '22215150599', '卡拉米', '一楼', '2023/08/27', 'C41', '00:00-00:36', '1座');
INSERT INTO `result_seat` VALUES (247, '22215150599', '卡拉米', '一楼', '2023/08/27', 'C41', '00:00-00:36', '2座');
INSERT INTO `result_seat` VALUES (248, '22215150599', '卡拉米', '一楼', '2023/08/27', 'C41', '00:00-00:36', '3座');
INSERT INTO `result_seat` VALUES (249, '22215150599', '卡拉米', '一楼', '2023/08/27', 'C41', '00:00-00:36', '4座');
INSERT INTO `result_seat` VALUES (250, '22215150599', '卡拉米', '一楼', '2023/08/27', 'C36', '00:00-00:36', '4座');
INSERT INTO `result_seat` VALUES (251, '22215150599', '卡拉米', '一楼', '2023/08/27', 'C36', '00:00-00:36', '3座');
INSERT INTO `result_seat` VALUES (252, '22215150599', '卡拉米', '一楼', '2023/08/27', 'C18', '00:00-00:36', '2座');
INSERT INTO `result_seat` VALUES (253, '22215150599', '卡拉米', '一楼', '2023/08/27', 'C36', '00:00-00:36', '1座');
INSERT INTO `result_seat` VALUES (254, '22215150599', '卡拉米', '一楼', '2023/08/27', 'C36', '00:00-00:36', '2座');
INSERT INTO `result_seat` VALUES (255, '22215150599', '卡拉米', '一楼', '2023/08/27', 'C18', '00:00-00:36', '1座');
INSERT INTO `result_seat` VALUES (256, '22215150599', '卡拉米', '一楼', '2023/08/27', 'C18', '00:00-00:36', '3座');
INSERT INTO `result_seat` VALUES (257, '22215150599', '卡拉米', '一楼', '2023/08/27', 'C15', '00:00-00:36', '3座');
INSERT INTO `result_seat` VALUES (258, '22215150599', '卡拉米', '一楼', '2023/08/27', 'C15', '00:00-00:36', '4座');
INSERT INTO `result_seat` VALUES (259, '22215150599', '卡拉米', '一楼', '2023/08/27', 'C15', '00:00-00:36', '2座');
INSERT INTO `result_seat` VALUES (260, '22215150599', '卡拉米', '一楼', '2023/08/27', 'C15', '00:00-00:36', '1座');
INSERT INTO `result_seat` VALUES (261, '22215150599', '卡拉米', '一楼', '2023/08/27', 'C17', '00:00-00:36', '1座');
INSERT INTO `result_seat` VALUES (262, '22215150599', '卡拉米', '一楼', '2023/08/27', 'B11', '00:00-00:36', '1座');
INSERT INTO `result_seat` VALUES (263, '22215150599', '卡拉米', '一楼', '2023/08/27', 'B11', '00:00-00:36', '2座');
INSERT INTO `result_seat` VALUES (264, '22215150599', '卡拉米', '一楼', '2023/08/27', 'B11', '00:00-00:36', '3座');
INSERT INTO `result_seat` VALUES (265, '22215150599', '卡拉米', '一楼', '2023/08/27', 'B11', '00:00-00:36', '4座');
INSERT INTO `result_seat` VALUES (266, '22215150599', '卡拉米', '一楼', '2023/08/27', 'B41', '00:00-00:36', '1座');
INSERT INTO `result_seat` VALUES (267, '22215150599', '卡拉米', '一楼', '2023/08/27', 'B41', '00:00-00:36', '2座');
INSERT INTO `result_seat` VALUES (268, '22215150599', '卡拉米', '一楼', '2023/08/27', 'B14', '00:00-00:36', '1座');
INSERT INTO `result_seat` VALUES (269, '22215150599', '卡拉米', '一楼', '2023/08/27', 'B14', '00:00-00:36', '2座');
INSERT INTO `result_seat` VALUES (270, '22215150599', '卡拉米', '一楼', '2023/08/27', 'B14', '00:00-00:36', '3座');
INSERT INTO `result_seat` VALUES (271, '22215150599', '卡拉米', '一楼', '2023/08/27', 'B14', '00:00-00:36', '4座');
INSERT INTO `result_seat` VALUES (272, '22215150599', '卡拉米', '一楼', '2023/08/27', 'B35', '00:00-00:36', '1座');
INSERT INTO `result_seat` VALUES (273, '22215150599', '卡拉米', '一楼', '2023/08/27', 'B35', '00:00-00:36', '2座');
INSERT INTO `result_seat` VALUES (274, '22215150599', '卡拉米', '一楼', '2023/08/27', 'B26', '00:00-00:36', '1座');
INSERT INTO `result_seat` VALUES (275, '22215150599', '卡拉米', '一楼', '2023/08/27', 'B35', '00:00-00:36', '3座');
INSERT INTO `result_seat` VALUES (276, '22215150599', '卡拉米', '一楼', '2023/08/27', 'B26', '00:00-00:36', '2座');
INSERT INTO `result_seat` VALUES (277, '22215150599', '卡拉米', '一楼', '2023/08/27', 'B26', '00:00-00:36', '3座');
INSERT INTO `result_seat` VALUES (278, '22215150599', '卡拉米', '一楼', '2023/08/27', 'B26', '00:00-00:36', '4座');
INSERT INTO `result_seat` VALUES (279, '22215150599', '卡拉米', '一楼', '2023/08/27', 'B18', '00:00-00:36', '1座');
INSERT INTO `result_seat` VALUES (280, '22215150599', '卡拉米', '一楼', '2023/08/27', 'B18', '00:00-00:36', '2座');
INSERT INTO `result_seat` VALUES (281, '22215150599', '卡拉米', '一楼', '2023/08/27', 'B18', '00:00-00:36', '3座');
INSERT INTO `result_seat` VALUES (282, '22215150599', '卡拉米', '一楼', '2023/08/27', 'B18', '00:00-00:36', '4座');
INSERT INTO `result_seat` VALUES (283, '22215150599', '卡拉米', '一楼', '2023/08/27', 'B47', '00:00-00:36', '1座');
INSERT INTO `result_seat` VALUES (284, '22215150599', '卡拉米', '一楼', '2023/08/27', 'B47', '00:00-00:36', '2座');
INSERT INTO `result_seat` VALUES (285, '22215150599', '卡拉米', '一楼', '2023/08/27', 'B47', '00:00-00:36', '3座');
INSERT INTO `result_seat` VALUES (286, '22215150599', '卡拉米', '一楼', '2023/08/27', 'B48', '00:00-00:36', '1座');
INSERT INTO `result_seat` VALUES (287, '22215150599', '卡拉米', '一楼', '2023/08/27', 'B48', '00:00-00:36', '2座');
INSERT INTO `result_seat` VALUES (288, '22215150599', '卡拉米', '一楼', '2023/08/27', 'B48', '00:00-00:36', '3座');
INSERT INTO `result_seat` VALUES (289, '22215150599', '卡拉米', '一楼', '2023/08/27', 'B48', '00:00-00:36', '4座');
INSERT INTO `result_seat` VALUES (290, '22215150599', '卡拉米', '一楼', '2023/08/27', 'B32', '00:00-00:36', '3座');
INSERT INTO `result_seat` VALUES (291, '22215150599', '卡拉米', '一楼', '2023/08/27', 'B32', '00:00-00:36', '1座');
INSERT INTO `result_seat` VALUES (292, '22215150599', '卡拉米', '一楼', '2023/08/27', 'B32', '00:00-00:36', '2座');
INSERT INTO `result_seat` VALUES (293, '22215150599', '卡拉米', '一楼', '2023/08/27', 'B32', '00:00-00:36', '4座');
INSERT INTO `result_seat` VALUES (294, '22215150599', '卡拉米', '一楼', '2023/08/27', 'D13', '00:00-00:36', '4座');
INSERT INTO `result_seat` VALUES (295, '22215150599', '卡拉米', '一楼', '2023/08/27', 'D13', '00:00-00:36', '3座');
INSERT INTO `result_seat` VALUES (296, '22215150599', '卡拉米', '一楼', '2023/08/27', 'D13', '00:00-00:36', '2座');
INSERT INTO `result_seat` VALUES (297, '22215150599', '卡拉米', '一楼', '2023/08/27', 'D13', '00:00-00:36', '1座');
INSERT INTO `result_seat` VALUES (298, '22215150599', '卡拉米', '一楼', '2023/08/27', 'D23', '00:00-00:36', '1座');
INSERT INTO `result_seat` VALUES (299, '22215150599', '卡拉米', '一楼', '2023/08/27', 'D16', '00:00-00:36', '1座');
INSERT INTO `result_seat` VALUES (300, '22215150599', '卡拉米', '一楼', '2023/08/27', 'D16', '00:00-00:36', '2座');
INSERT INTO `result_seat` VALUES (301, '22215150599', '卡拉米', '一楼', '2023/08/27', 'D16', '00:00-00:36', '3座');
INSERT INTO `result_seat` VALUES (302, '22215150599', '卡拉米', '一楼', '2023/08/27', 'D16', '00:00-00:36', '4座');
INSERT INTO `result_seat` VALUES (303, '22215150599', '卡拉米', '一楼', '2023/08/27', 'D37', '00:00-00:36', '4座');
INSERT INTO `result_seat` VALUES (304, '22215150599', '卡拉米', '一楼', '2023/08/27', 'D37', '00:00-00:36', '3座');
INSERT INTO `result_seat` VALUES (305, '22215150599', '卡拉米', '一楼', '2023/08/27', 'D37', '00:00-00:36', '2座');
INSERT INTO `result_seat` VALUES (306, '22215150599', '卡拉米', '一楼', '2023/08/27', 'D37', '00:00-00:36', '1座');
INSERT INTO `result_seat` VALUES (307, '22215150599', '卡拉米', '一楼', '2023/08/27', 'D44', '00:00-00:36', '1座');
INSERT INTO `result_seat` VALUES (308, '22215150599', '卡拉米', '一楼', '2023/08/27', 'D45', '00:00-00:36', '1座');
INSERT INTO `result_seat` VALUES (309, '22215150599', '卡拉米', '一楼', '2023/08/27', 'D34', '00:00-00:36', '2座');
INSERT INTO `result_seat` VALUES (310, '22215150599', '卡拉米', '一楼', '2023/08/27', 'D34', '00:00-00:36', '4座');
INSERT INTO `result_seat` VALUES (311, '22215150599', '卡拉米', '一楼', '2023/08/27', 'D45', '00:00-00:36', '4座');
INSERT INTO `result_seat` VALUES (312, '22215150599', '卡拉米', '一楼', '2023/08/27', 'D45', '00:00-00:36', '3座');
INSERT INTO `result_seat` VALUES (313, '22215150599', '卡拉米', '一楼', '2023/08/27', 'D45', '00:00-00:36', '2座');
INSERT INTO `result_seat` VALUES (314, '22215150599', '卡拉米', '一楼', '2023/08/27', 'D41', '00:00-00:36', '1座');
INSERT INTO `result_seat` VALUES (315, '22215150599', '卡拉米', '一楼', '2023/08/27', 'D36', '00:00-00:36', '1座');
INSERT INTO `result_seat` VALUES (316, '22215150599', '卡拉米', '一楼', '2023/08/27', 'B37', '00:00-00:36', '1座');
INSERT INTO `result_seat` VALUES (317, '22215150599', '卡拉米', '一楼', '2023/08/27', 'A18', '00:00-00:36', '1座');
INSERT INTO `result_seat` VALUES (318, '22215150599', '卡拉米', '一楼', '2023/08/27', 'A18', '00:00-00:36', '2座');
INSERT INTO `result_seat` VALUES (319, '22215150599', '卡拉米', '一楼', '2023/08/27', 'A18', '00:00-00:36', '3座');
INSERT INTO `result_seat` VALUES (320, '22215150599', '卡拉米', '一楼', '2023/08/27', 'A18', '00:00-00:36', '4座');
INSERT INTO `result_seat` VALUES (321, '22215150599', '卡拉米', '一楼', '2023/08/27', 'A32', '00:00-00:36', '1座');
INSERT INTO `result_seat` VALUES (322, '22215150599', '卡拉米', '一楼', '2023/08/27', 'A32', '00:00-00:36', '2座');
INSERT INTO `result_seat` VALUES (323, '22215150599', '卡拉米', '一楼', '2023/08/27', 'A32', '00:00-00:36', '3座');
INSERT INTO `result_seat` VALUES (324, '22215150599', '卡拉米', '一楼', '2023/08/27', 'A32', '00:00-00:36', '4座');
INSERT INTO `result_seat` VALUES (325, '22215150599', '卡拉米', '一楼', '2023/08/27', 'A33', '00:00-00:36', '1座');
INSERT INTO `result_seat` VALUES (326, '22215150599', '卡拉米', '一楼', '2023/08/27', 'A33', '00:00-00:36', '2座');
INSERT INTO `result_seat` VALUES (327, '22215150599', '卡拉米', '一楼', '2023/08/27', 'A33', '00:00-00:36', '3座');
INSERT INTO `result_seat` VALUES (328, '22215150599', '卡拉米', '一楼', '2023/08/27', 'A23', '00:00-00:36', '3座');
INSERT INTO `result_seat` VALUES (329, '22215150599', '卡拉米', '一楼', '2023/08/27', 'C26', '00:00-00:36', '3座');
INSERT INTO `result_seat` VALUES (330, '22215150599', '卡拉米', '一楼', '2023/08/27', 'A18', '00:36-00:37', '1座');
INSERT INTO `result_seat` VALUES (331, '22215150599', '卡拉米', '一楼', '2023/08/27', 'A18', '00:36-00:37', '2座');
INSERT INTO `result_seat` VALUES (332, '22215150599', '卡拉米', '一楼', '2023/08/27', 'A18', '00:36-00:37', '3座');
INSERT INTO `result_seat` VALUES (333, '22215150599', '卡拉米', '一楼', '2023/08/27', 'A18', '00:36-00:37', '4座');
INSERT INTO `result_seat` VALUES (334, '22215150599', '卡拉米', '一楼', '2023/08/27', 'A26', '00:36-00:37', '4座');
INSERT INTO `result_seat` VALUES (335, '22215150599', '卡拉米', '一楼', '2023/08/27', 'A27', '00:36-00:37', '3座');
INSERT INTO `result_seat` VALUES (336, '22215150599', '卡拉米', '一楼', '2023/08/27', 'A27', '00:36-00:37', '2座');
INSERT INTO `result_seat` VALUES (337, '22215150599', '卡拉米', '一楼', '2023/08/27', 'A27', '00:36-00:37', '1座');
INSERT INTO `result_seat` VALUES (338, '22215150599', '卡拉米', '一楼', '2023/08/27', 'A16', '00:36-00:37', '1座');
INSERT INTO `result_seat` VALUES (339, '22215150599', '卡拉米', '一楼', '2023/08/27', 'A16', '00:36-00:37', '2座');
INSERT INTO `result_seat` VALUES (340, '22215150599', '卡拉米', '一楼', '2023/08/27', 'A16', '00:36-00:37', '3座');
INSERT INTO `result_seat` VALUES (341, '22215150599', '卡拉米', '一楼', '2023/08/27', 'A16', '00:36-00:37', '4座');
INSERT INTO `result_seat` VALUES (342, '22215150599', '卡拉米', '一楼', '2023/08/27', 'A15', '00:36-00:37', '1座');
INSERT INTO `result_seat` VALUES (343, '22215150599', '卡拉米', '一楼', '2023/08/27', 'A15', '00:36-00:37', '4座');
INSERT INTO `result_seat` VALUES (344, '22215150599', '卡拉米', '一楼', '2023/08/27', 'A23', '00:36-00:37', '1座');
INSERT INTO `result_seat` VALUES (345, '22215150599', '卡拉米', '一楼', '2023/08/27', 'A23', '00:36-00:37', '2座');
INSERT INTO `result_seat` VALUES (346, '22215150599', '卡拉米', '一楼', '2023/08/27', 'A23', '00:36-00:37', '3座');
INSERT INTO `result_seat` VALUES (347, '22215150599', '卡拉米', '一楼', '2023/08/27', 'A23', '00:36-00:37', '4座');
INSERT INTO `result_seat` VALUES (348, '22215150599', '卡拉米', '一楼', '2023/08/27', 'A36', '00:36-00:37', '4座');
INSERT INTO `result_seat` VALUES (349, '22215150599', '卡拉米', '一楼', '2023/08/27', 'A36', '00:36-00:37', '3座');
INSERT INTO `result_seat` VALUES (350, '22215150599', '卡拉米', '一楼', '2023/08/27', 'A36', '00:36-00:37', '2座');
INSERT INTO `result_seat` VALUES (351, '22215150599', '卡拉米', '一楼', '2023/08/27', 'A36', '00:36-00:37', '1座');
INSERT INTO `result_seat` VALUES (352, '22215150599', '卡拉米', '一楼', '2023/08/27', 'B11', '00:36-00:37', '1座');
INSERT INTO `result_seat` VALUES (353, '22215150599', '卡拉米', '一楼', '2023/08/27', 'B11', '00:36-00:37', '2座');
INSERT INTO `result_seat` VALUES (354, '22215150599', '卡拉米', '一楼', '2023/08/27', 'B11', '00:36-00:37', '3座');
INSERT INTO `result_seat` VALUES (355, '22215150599', '卡拉米', '一楼', '2023/08/27', 'B11', '00:36-00:37', '4座');
INSERT INTO `result_seat` VALUES (356, '22215150599', '卡拉米', '一楼', '2023/08/27', 'B33', '00:36-00:37', '4座');
INSERT INTO `result_seat` VALUES (357, '22215150599', '卡拉米', '一楼', '2023/08/27', 'B33', '00:36-00:37', '3座');
INSERT INTO `result_seat` VALUES (358, '22215150599', '卡拉米', '一楼', '2023/08/27', 'B26', '00:36-00:37', '4座');
INSERT INTO `result_seat` VALUES (359, '22215150599', '卡拉米', '一楼', '2023/08/27', 'B26', '00:36-00:37', '3座');
INSERT INTO `result_seat` VALUES (360, '22215150599', '卡拉米', '一楼', '2023/08/27', 'B26', '00:36-00:37', '2座');
INSERT INTO `result_seat` VALUES (361, '22215150599', '卡拉米', '一楼', '2023/08/27', 'B26', '00:36-00:37', '1座');
INSERT INTO `result_seat` VALUES (362, '22215150599', '卡拉米', '一楼', '2023/08/27', 'B24', '00:36-00:37', '1座');
INSERT INTO `result_seat` VALUES (363, '22215150599', '卡拉米', '一楼', '2023/08/27', 'B18', '00:36-00:37', '1座');
INSERT INTO `result_seat` VALUES (364, '22215150599', '卡拉米', '一楼', '2023/08/27', 'B18', '00:36-00:37', '2座');
INSERT INTO `result_seat` VALUES (365, '22215150599', '卡拉米', '一楼', '2023/08/27', 'B18', '00:36-00:37', '3座');
INSERT INTO `result_seat` VALUES (366, '22215150599', '卡拉米', '一楼', '2023/08/27', 'B48', '00:36-00:37', '3座');
INSERT INTO `result_seat` VALUES (367, '22215150599', '卡拉米', '一楼', '2023/08/27', 'B24', '00:36-00:37', '3座');
INSERT INTO `result_seat` VALUES (368, '22215150599', '卡拉米', '一楼', '2023/08/27', 'B24', '00:36-00:37', '4座');
INSERT INTO `result_seat` VALUES (369, '22215150599', '卡拉米', '一楼', '2023/08/27', 'B24', '00:36-00:37', '2座');
INSERT INTO `result_seat` VALUES (370, '22215150599', '卡拉米', '一楼', '2023/08/27', 'D13', '00:36-00:37', '1座');
INSERT INTO `result_seat` VALUES (371, '22215150599', '卡拉米', '一楼', '2023/08/27', 'D13', '00:36-00:37', '2座');
INSERT INTO `result_seat` VALUES (372, '22215150599', '卡拉米', '一楼', '2023/08/27', 'D13', '00:36-00:37', '3座');
INSERT INTO `result_seat` VALUES (373, '22215150599', '卡拉米', '一楼', '2023/08/27', 'D13', '00:36-00:37', '4座');
INSERT INTO `result_seat` VALUES (374, '22215150599', '卡拉米', '一楼', '2023/08/27', 'D45', '00:36-00:37', '1座');
INSERT INTO `result_seat` VALUES (375, '22215150599', '卡拉米', '一楼', '2023/08/27', 'D45', '00:36-00:37', '2座');
INSERT INTO `result_seat` VALUES (376, '22215150599', '卡拉米', '一楼', '2023/08/27', 'D23', '00:36-00:37', '2座');
INSERT INTO `result_seat` VALUES (377, '22215150599', '卡拉米', '一楼', '2023/08/27', 'D23', '00:36-00:37', '1座');
INSERT INTO `result_seat` VALUES (378, '22215150599', '卡拉米', '一楼', '2023/08/27', 'D23', '00:36-00:37', '3座');
INSERT INTO `result_seat` VALUES (379, '22215150599', '卡拉米', '一楼', '2023/08/27', 'D23', '00:36-00:37', '4座');
INSERT INTO `result_seat` VALUES (380, '22215150599', '卡拉米', '一楼', '2023/08/27', 'D41', '00:36-00:37', '4座');
INSERT INTO `result_seat` VALUES (381, '22215150599', '卡拉米', '一楼', '2023/08/27', 'D41', '00:36-00:37', '2座');
INSERT INTO `result_seat` VALUES (382, '22215150599', '卡拉米', '一楼', '2023/08/27', 'C45', '00:36-00:37', '2座');
INSERT INTO `result_seat` VALUES (383, '22215150599', '卡拉米', '一楼', '2023/08/27', 'C23', '00:36-00:37', '2座');
INSERT INTO `result_seat` VALUES (384, '22215150599', '卡拉米', '一楼', '2023/08/27', 'C38', '00:36-00:37', '2座');
INSERT INTO `result_seat` VALUES (385, '22215150599', '卡拉米', '一楼', '2023/08/27', 'C28', '00:36-00:37', '2座');
INSERT INTO `result_seat` VALUES (386, '22215150599', '卡拉米', '一楼', '2023/08/27', 'C28', '00:36-00:37', '1座');
INSERT INTO `result_seat` VALUES (387, '22215150599', '卡拉米', '一楼', '2023/08/27', 'C28', '00:36-00:37', '3座');
INSERT INTO `result_seat` VALUES (388, '22215150599', '卡拉米', '一楼', '2023/08/27', 'C28', '00:36-00:37', '4座');
INSERT INTO `result_seat` VALUES (389, '22215150599', '卡拉米', '一楼', '2023/08/27', 'D26', '00:36-00:37', '4座');
INSERT INTO `result_seat` VALUES (390, '22215150599', '卡拉米', '一楼', '2023/08/27', 'D26', '00:36-00:37', '1座');
INSERT INTO `result_seat` VALUES (391, '22215150599', '卡拉米', '一楼', '2023/08/27', 'D26', '00:36-00:37', '3座');
INSERT INTO `result_seat` VALUES (392, '22215150599', '卡拉米', '一楼', '2023/08/27', 'D26', '00:36-00:37', '2座');
INSERT INTO `result_seat` VALUES (393, '22215150599', '卡拉米', '一楼', '2023/08/27', 'C46', '00:36-00:37', '2座');
INSERT INTO `result_seat` VALUES (394, '22215150599', '卡拉米', '一楼', '2023/08/27', 'C46', '00:36-00:37', '3座');
INSERT INTO `result_seat` VALUES (395, '22215150599', '卡拉米', '一楼', '2023/08/27', 'A11', '16:37-18:30', '3座');
INSERT INTO `result_seat` VALUES (396, '22215150599', '卡拉米', '一楼', '2023/08/27', 'A11', '16:37-18:30', '2座');
INSERT INTO `result_seat` VALUES (397, '22215150599', '卡拉米', '一楼', '2023/08/27', 'A23', '00:37-00:38', '1座');
INSERT INTO `result_seat` VALUES (398, '22215150599', '卡拉米', '一楼', '2023/08/27', 'A23', '00:37-00:38', '2座');
INSERT INTO `result_seat` VALUES (399, '22215150599', '卡拉米', '一楼', '2023/08/27', 'A26', '00:37-00:38', '2座');
INSERT INTO `result_seat` VALUES (400, '22215150599', '卡拉米', '一楼', '2023/08/27', 'A26', '00:37-00:38', '1座');
INSERT INTO `result_seat` VALUES (401, '22215150599', '卡拉米', '一楼', '2023/08/27', 'A26', '00:37-00:38', '3座');
INSERT INTO `result_seat` VALUES (402, '22215150599', '卡拉米', '一楼', '2023/08/27', 'A16', '00:37-00:38', '3座');
INSERT INTO `result_seat` VALUES (403, '22215150599', '卡拉米', '一楼', '2023/08/27', 'A16', '00:37-00:38', '1座');
INSERT INTO `result_seat` VALUES (404, '22215150599', '卡拉米', '一楼', '2023/08/27', 'A48', '00:37-00:38', '1座');
INSERT INTO `result_seat` VALUES (405, '22215150599', '卡拉米', '一楼', '2023/08/27', 'A48', '00:37-00:38', '4座');
INSERT INTO `result_seat` VALUES (406, '22215150599', '卡拉米', '一楼', '2023/08/27', 'C28', '00:37-00:38', '4座');
INSERT INTO `result_seat` VALUES (407, '22215150599', '卡拉米', '一楼', '2023/08/27', 'C15', '00:37-00:38', '4座');
INSERT INTO `result_seat` VALUES (408, '22215150599', '卡拉米', '一楼', '2023/08/27', 'C15', '00:37-00:38', '3座');
INSERT INTO `result_seat` VALUES (409, '22215150599', '卡拉米', '一楼', '2023/08/27', 'C13', '00:37-00:38', '3座');
INSERT INTO `result_seat` VALUES (410, '22215150599', '卡拉米', '一楼', '2023/08/27', 'C13', '00:37-00:38', '4座');
INSERT INTO `result_seat` VALUES (411, '22215150599', '卡拉米', '一楼', '2023/08/27', 'C13', '00:37-00:38', '2座');
INSERT INTO `result_seat` VALUES (412, '22215150599', '卡拉米', '一楼', '2023/08/27', 'C13', '00:37-00:38', '1座');
INSERT INTO `result_seat` VALUES (413, '22215150599', '卡拉米', '一楼', '2023/08/27', 'C41', '00:37-00:38', '1座');
INSERT INTO `result_seat` VALUES (414, '22215150599', '卡拉米', '一楼', '2023/08/27', 'C41', '00:37-00:38', '2座');
INSERT INTO `result_seat` VALUES (415, '22215150599', '卡拉米', '一楼', '2023/08/27', 'C23', '00:37-00:38', '2座');
INSERT INTO `result_seat` VALUES (416, '22215150599', '卡拉米', '一楼', '2023/08/27', 'C23', '00:37-00:38', '3座');
INSERT INTO `result_seat` VALUES (417, '22215150599', '卡拉米', '一楼', '2023/08/27', 'C34', '00:37-00:38', '3座');
INSERT INTO `result_seat` VALUES (418, '22215150599', '卡拉米', '一楼', '2023/08/27', 'C34', '00:37-00:38', '2座');
INSERT INTO `result_seat` VALUES (419, '22215150599', '卡拉米', '一楼', '2023/08/27', 'D25', '00:37-00:38', '2座');
INSERT INTO `result_seat` VALUES (420, '22215150599', '卡拉米', '一楼', '2023/08/27', 'D25', '00:37-00:38', '4座');
INSERT INTO `result_seat` VALUES (421, '22215150599', '卡拉米', '一楼', '2023/08/27', 'D37', '00:37-00:38', '3座');
INSERT INTO `result_seat` VALUES (422, '22215150599', '卡拉米', '一楼', '2023/08/27', 'D37', '00:37-00:38', '4座');
INSERT INTO `result_seat` VALUES (423, '22215150599', '卡拉米', '一楼', '2023/08/27', 'D18', '00:37-00:38', '4座');
INSERT INTO `result_seat` VALUES (424, '22215150599', '卡拉米', '一楼', '2023/08/27', 'D18', '00:37-00:38', '3座');
INSERT INTO `result_seat` VALUES (425, '22215150599', '卡拉米', '一楼', '2023/08/27', 'D18', '00:37-00:38', '2座');
INSERT INTO `result_seat` VALUES (426, '22215150599', '卡拉米', '一楼', '2023/08/27', 'D18', '00:37-00:38', '1座');
INSERT INTO `result_seat` VALUES (427, '22215150599', '卡拉米', '一楼', '2023/08/27', 'D16', '00:37-00:38', '1座');
INSERT INTO `result_seat` VALUES (428, '22215150599', '卡拉米', '一楼', '2023/08/27', 'D16', '00:37-00:38', '2座');
INSERT INTO `result_seat` VALUES (429, '22215150599', '卡拉米', '一楼', '2023/08/27', 'D43', '00:37-00:38', '2座');
INSERT INTO `result_seat` VALUES (430, '22215150599', '卡拉米', '一楼', '2023/08/27', 'D43', '00:37-00:38', '4座');
INSERT INTO `result_seat` VALUES (431, '22215150599', '卡拉米', '一楼', '2023/08/27', 'D32', '00:37-00:38', '4座');
INSERT INTO `result_seat` VALUES (432, '22215150599', '卡拉米', '一楼', '2023/08/27', 'D32', '00:37-00:38', '3座');
INSERT INTO `result_seat` VALUES (433, '22215150599', '卡拉米', '一楼', '2023/08/27', 'D32', '00:37-00:38', '2座');
INSERT INTO `result_seat` VALUES (434, '22215150599', '卡拉米', '一楼', '2023/08/27', 'D32', '00:37-00:38', '1座');
INSERT INTO `result_seat` VALUES (435, '22215150599', '卡拉米', '一楼', '2023/08/27', 'A25', '00:00-23:59', '1座');
INSERT INTO `result_seat` VALUES (436, '22215150599', '卡拉米', '一楼', '2023/08/27', 'A25', '07:00-11:59', '2座');
INSERT INTO `result_seat` VALUES (437, '22215150599', '卡拉米', '一楼', '2023/08/27', 'A11', '00:00-23:59', '4座');

SET FOREIGN_KEY_CHECKS = 1;
