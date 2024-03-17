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

 Date: 18/03/2024 00:09:43
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for result_classroom
-- ----------------------------
DROP TABLE IF EXISTS `result_classroom`;
CREATE TABLE `result_classroom`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `classroomNumber` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `date` date NOT NULL,
  `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `floor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `reasonRefusal` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of result_classroom
-- ----------------------------
INSERT INTO `result_classroom` VALUES (1, '22215150513', '这是一个申请原因', '第11节 20:25-21:10', 'A203', 'true', '2023-07-19', 'ALGOL 教学楼', '二楼', '');
INSERT INTO `result_classroom` VALUES (2, '22215150513', '这又是一个申请原因', '第6节 14:50-15:35', 'A201', 'true', '2023-07-19', 'ALGOL 教学楼', '二楼', '');
INSERT INTO `result_classroom` VALUES (4, '22215150516', '这怎么还是一个申请原因', '第4节 11:15-12:00', 'B202', 'true', '2023-07-31', 'BASIC 教学楼', '二楼', '');
INSERT INTO `result_classroom` VALUES (5, '22215150514', '这tm的还是一个申请原因', '第11节 20:25-21:10', 'A202', 'true', '2023-07-31', 'ALGOL 教学楼', '二楼', '');
INSERT INTO `result_classroom` VALUES (6, '22215150515', '这tm怎么还是一个申请原因', '第1节 8:30-9:15', 'A201', 'false', '2023-07-31', 'ALGOL 教学楼', '二楼', '教室已被预约');
INSERT INTO `result_classroom` VALUES (8, '22215150514', '哈哈哈', '第5节 14:00-14:45', 'D104', 'false', '2023-12-18', 'DELPHI 教学楼', '一楼', '教室已被预约');
INSERT INTO `result_classroom` VALUES (9, '22215150514', '234234', '第4节 11:15-12:00', 'B201', 'true', '2023-07-31', 'BASIC 教学楼', '二楼', '');
INSERT INTO `result_classroom` VALUES (10, '22215150514', '234234', '第4节 11:15-12:00', 'B201', 'true', '2023-12-18', 'BASIC 教学楼', '二楼', '');
INSERT INTO `result_classroom` VALUES (13, '22215150514', 'sdaf23123', '第2节 9:20-10:05', 'C202', 'true', '2024-02-22', 'C++ 教学楼', '二楼', '');
INSERT INTO `result_classroom` VALUES (21, '22215150514', '飞洒地方的方式', '第1节 8:30-9:15', 'A101', 'false', '2024-02-24', 'ALGOL 教学楼', '一楼', '第三方山东');
INSERT INTO `result_classroom` VALUES (22, '22215150514', '开班会', '第1节 8:30-9:15', 'A101', 'false', '2024-02-24', 'ALGOL 教学楼', '一楼', '');
INSERT INTO `result_classroom` VALUES (23, '22215150514', '22级xxx班开班会', '第1节 8:30-9:15', 'A101', 'true', '2024-02-25', 'ALGOL 教学楼', '一楼', '');
INSERT INTO `result_classroom` VALUES (25, '22215150513', 'sdf ', '第1节 8:30-9:15', 'A101', 'false', '2024-02-27', 'ALGOL 教学楼', '一楼', 'asd ');

-- ----------------------------
-- Table structure for result_fault
-- ----------------------------
DROP TABLE IF EXISTS `result_fault`;
CREATE TABLE `result_fault`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `item` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `contact` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `date` date NOT NULL,
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of result_fault
-- ----------------------------
INSERT INTO `result_fault` VALUES (1, '22215150514', '椅子', '26栋', '459', '12312312333', '椅子靠背坏了，需要换新', '2024-02-05', 'true');
INSERT INTO `result_fault` VALUES (2, '22215150514', '花洒', '26栋', '459', '4234243423442342434234', '无', '2024-02-05', 'true');
INSERT INTO `result_fault` VALUES (3, '22215150513', '门把手', '24栋', '151', '53464523', '门把手松了', '2024-02-07', 'true');
INSERT INTO `result_fault` VALUES (5, '22215150514', '空调', 'ALGOL教学楼', 'A302', '1903458435', '空调漏水', '2024-02-24', 'true');
INSERT INTO `result_fault` VALUES (6, '22215150515', '门把手', '宿舍楼24栋', '503', '195824739', '无', '2024-02-24', 'true');
INSERT INTO `result_fault` VALUES (7, '22215150514', '桌子', '宿舍楼25栋', '323', '12178436234', '宿舍一号桌子坏了', '2024-02-24', 'false');

-- ----------------------------
-- Table structure for result_lost_found
-- ----------------------------
DROP TABLE IF EXISTS `result_lost_found`;
CREATE TABLE `result_lost_found`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `item` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `brand` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `contact` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `switch` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `overdue` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 148 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of result_lost_found
-- ----------------------------
INSERT INTO `result_lost_found` VALUES (2, '22215150513', '寻', '手表', '小米', 'A栋203', '无', '微信989898', 'off', 'true', '2023-07-16');
INSERT INTO `result_lost_found` VALUES (4, '22215150513', '拾', 'ipad', '苹果', '图书馆三楼', '黑色保护壳', '1745683476', 'on', 'true', '2023-07-17');
INSERT INTO `result_lost_found` VALUES (5, '22215150513', '拾', '手机', '红米', '运动场', '无', '1456324534', 'on', 'false', '2023-07-17');
INSERT INTO `result_lost_found` VALUES (6, '22215150515', '寻', '书包', '无/暂不清楚', 'a栋102', '书包里有一本高等数学，一个眼镜盒，一个水杯', 'vx:325dsfdsf', 'on', 'false', '2023-07-17');
INSERT INTO `result_lost_found` VALUES (10, '22215150516', '寻', '充电宝', '紫米', '第三饭堂', '紫粉渐变色的', 'QQ343554532', 'on', 'false', '2023-07-17');
INSERT INTO `result_lost_found` VALUES (11, '22215150515', '拾', '包包', '无/暂不清楚', 'F栋302', '包里有一个钱包，内有现金300元', '微信:1247834qwe', 'on', 'false', '2023-07-18');
INSERT INTO `result_lost_found` VALUES (12, '22215150515', '寻', '高等数学', '人民出版社', 'h栋102', '无', '1895476843', 'on', 'false', '2023-07-18');
INSERT INTO `result_lost_found` VALUES (13, '22215150515', '拾', '眼镜', '无/暂不清楚', 'a栋401', '黑框眼镜', '1823496703', 'on', 'false', '2023-07-18');
INSERT INTO `result_lost_found` VALUES (15, '22215150515', '拾', 'USB充电线', '无/暂不清楚', '第一饭堂', '无', 'vx18547648xxx', 'on', 'false', '2023-07-18');
INSERT INTO `result_lost_found` VALUES (16, '22215150516', '寻', '身份证', '无/暂不清楚', '学校大门', '是小法的身份证', '1523869456', 'on', 'false', '2023-07-18');
INSERT INTO `result_lost_found` VALUES (17, '22215150516', '寻', '头戴耳机', '铁三角', 'C栋301', '外观是粉色的', 'QQ:347853283', 'on', 'false', '2023-07-18');
INSERT INTO `result_lost_found` VALUES (18, '22215150516', '拾', '无线键盘', '无/暂不清楚', 'd栋101', '无', '32146745@qq.com', 'on', 'false', '2023-07-18');
INSERT INTO `result_lost_found` VALUES (19, '22215150515', '拾', '充电头', 'IQOO', '学校大门外的共享单车车篮', '120w充电的', 'sauy23497y@gmail.com', 'on', 'false', '2023-07-18');
INSERT INTO `result_lost_found` VALUES (20, '22215150514', '拾', '钥匙', '无/暂不清楚', '湖边篮球场', '无', '17435627364', 'off', 'true', '2023-07-19');
INSERT INTO `result_lost_found` VALUES (22, '22215150514', '拾', '书包', '无/暂不清楚', '操场', '书包是白色的', '17485634853', 'off', 'false', '2023-07-19');
INSERT INTO `result_lost_found` VALUES (23, '22215150515', '拾', 'ipad', '苹果', 'd栋201', '无', '17836458358', 'on', 'false', '2023-07-19');
INSERT INTO `result_lost_found` VALUES (25, '22215150515', '寻', '鼠标', '罗技', '图书馆2楼', '是g102，紫色的', '18543652576', 'on', 'false', '2023-07-19');
INSERT INTO `result_lost_found` VALUES (26, '22215150516', '拾', '眼镜', '无/暂不清楚', 'a栋401', '黑框大眼镜', '1809132436703', 'on', 'false', '2023-07-19');
INSERT INTO `result_lost_found` VALUES (28, '22215150515', '寻', 'USB充电线', '无/暂不清楚', '第一饭堂', '无', 'vx13547648x1xx', 'on', 'false', '2023-07-20');
INSERT INTO `result_lost_found` VALUES (30, '22215150514', '拾', '手机', '荣耀', '操场', '屏幕左上方碎了', '15436364576', 'on', 'false', '2023-07-20');
INSERT INTO `result_lost_found` VALUES (32, '22215150515', '拾', '钥匙', '无/暂不清楚', '湖边篮球场', '无', '17435627364', 'on', 'false', '2023-07-20');
INSERT INTO `result_lost_found` VALUES (34, '22215150513', '拾', '包包', '无/暂不清楚', 'F栋302', '包里有一个钱包，内有现金300元', '微信:1247834qwe', 'on', 'false', '2023-07-21');
INSERT INTO `result_lost_found` VALUES (35, '22215150513', '拾', '学生证', '无/暂不清楚', '操场', '是22软工班小法的学生证', '19438539556', 'on', 'false', '2023-07-21');
INSERT INTO `result_lost_found` VALUES (147, '22215150514', '寻', '耳机', '华为', '操场', '白色的', '12437582234', 'on', 'true', '2023-08-25');

-- ----------------------------
-- Table structure for result_recruitment
-- ----------------------------
DROP TABLE IF EXISTS `result_recruitment`;
CREATE TABLE `result_recruitment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `hr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `salary` int(11) NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `contact` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `requirements` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `benefits` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of result_recruitment
-- ----------------------------
INSERT INTO `result_recruitment` VALUES (1, '广州xx电子商务有限公司', '高先生', 3000, '广州xx电子商务有限公司是一家以IT软件技术支持+电商为主营业务的国家高新技术企业、广州市高新技术企业。', '13763468284', 'java开发工程师', '负责公司软件项目的日常运维,基础模块开发||公司产品的测试,文档整理||全日制本科以上,计算机相关专业||有适当的抗压能力,能积极配合公司安排', '双休，全勤奖，零食下午茶，带薪年假，年终奖，五险一金，加班补助，节日福利，朝九晚五', '广州天河区盛大国际(东北门)盛大国际三楼xxx室');
INSERT INTO `result_recruitment` VALUES (2, '广州xx科技有限公司', '陈女士', 4000, '广州xx科技有限公司经营范围：通信设备销售;广播电视传输设备销售;光通信设备销售;电子专用设备销售;电子专用材料销售;网络与信息安全软件开发;软件外包服务;人工智能应用软件开发;计算机软硬件及外围设备制造;软件开发;', '18394572365', 'python工程师', '限广东地区，远程办公，配合开发过程中的python代码编写，熟悉TouchDesigner者优先，可独立梳理架构，独立完成简单后端开发。', '双休，全勤奖，零食下午茶，带薪年假，年终奖，五险一金，加班补助，节日福利', '广州番禺区奥园养生广场xxx');
INSERT INTO `result_recruitment` VALUES (3, '广州xx电子商务有限公司', '帕先生', 5000, '广州xx电子商务有限公司是一家以IT软件技术支持+电商为主营业务的国家高新技术企业、广州市高新技术企业。', '13763468284', 'java工程师', '负责公司软件项目的日常运维,基础模块开发||公司产品的测试,文档整理||全日制本科以上,计算机相关专业||有适当的抗压能力,能积极配合公司安排', '全勤奖，零食下午茶，带薪年假，年终奖，五险一金，加班补助，节日福利，朝九晚五', '广州天河区盛大国际(东北门)盛大国际三楼xxx室');
INSERT INTO `result_recruitment` VALUES (4, '广州xx电子商务有限公司', '王女士', 6000, '广州xx科技有限公司经营范围：通信设备销售;广播电视传输设备销售;光通信设备销售;电子专用设备销售;电子专用材料销售;网络与信息安全软件开发;软件外包服务;人工智能应用软件开发;计算机软硬件及外围设备制造;软件开发;', '15444574565', 'python后端工程师', '限广东地区，远程办公，配合开发过程中的python代码编写，熟悉TouchDesigner者优先，可独立梳理架构，独立完成简单后端开发。', '全勤奖，零食下午茶，带薪年假，年终奖，五险一金，加班补助，节日福利', '广州天河区盛大国际(东北门)盛大国际三楼xxx室');
INSERT INTO `result_recruitment` VALUES (5, '广州xx电子商务有限公司', '帕先生', 5000, '广州xx电子商务有限公司是一家以IT软件技术支持+电商为主营业务的国家高新技术企业、广州市高新技术企业。', '13763468284', 'java工程师', '负责公司软件项目的日常运维,基础模块开发||公司产品的测试,文档整理||全日制本科以上,计算机相关专业||有适当的抗压能力,能积极配合公司安排', '双休，全勤奖，零食下午茶，带薪年假，年终奖，五险一金，加班补助，节日福利，朝九晚五', '广州天河区盛大国际(东北门)盛大国际三楼xxx室');
INSERT INTO `result_recruitment` VALUES (6, '广州xx电子商务有限公司', '帕先生', 5000, '广州xx电子商务有限公司是一家以IT软件技术支持+电商为主营业务的国家高新技术企业、广州市高新技术企业。', '13763468284', 'java工程师', '负责公司软件项目的日常运维,基础模块开发||公司产品的测试,文档整理||全日制本科以上,计算机相关专业||有适当的抗压能力,能积极配合公司安排', '全勤奖，零食下午茶，带薪年假，年终奖，五险一金，加班补助，节日福利，朝九晚五', '广州天河区盛大国际(东北门)盛大国际三楼xxx室');
INSERT INTO `result_recruitment` VALUES (7, '广州xx电子商务有限公司', '帕先生', 5000, '广州xx电子商务有限公司是一家以IT软件技术支持+电商为主营业务的国家高新技术企业、广州市高新技术企业。', '13763468284', 'java工程师', '负责公司软件项目的日常运维,基础模块开发||公司产品的测试,文档整理||全日制本科以上,计算机相关专业||有适当的抗压能力,能积极配合公司安排', '双休，全勤奖，零食下午茶，带薪年假，年终奖，五险一金，加班补助，节日福利', '广州天河区盛大国际(东北门)盛大国际三楼xxx室');
INSERT INTO `result_recruitment` VALUES (8, '广州xx电子商务有限公司', '帕先生', 5000, '广州xx电子商务有限公司是一家以IT软件技术支持+电商为主营业务的国家高新技术企业、广州市高新技术企业。', '13763468284', 'java工程师', '负责公司软件项目的日常运维,基础模块开发||公司产品的测试,文档整理||全日制本科以上,计算机相关专业||有适当的抗压能力,能积极配合公司安排', '全勤奖，零食下午茶，带薪年假，年终奖，五险一金，加班补助，节日福利，朝九晚五', '广州天河区盛大国际(东北门)盛大国际三楼xxx室');
INSERT INTO `result_recruitment` VALUES (9, '广州xx电子商务有限公司', '帕先生', 5000, '广州xx电子商务有限公司是一家以IT软件技术支持+电商为主营业务的国家高新技术企业、广州市高新技术企业。', '13763468284', 'java工程师', '负责公司软件项目的日常运维,基础模块开发||公司产品的测试,文档整理||全日制本科以上,计算机相关专业||有适当的抗压能力,能积极配合公司安排', '双休，全勤奖，零食下午茶，带薪年假，年终奖，五险一金，加班补助，节日福利', '广州天河区盛大国际(东北门)盛大国际三楼xxx室');
INSERT INTO `result_recruitment` VALUES (10, '广州xx电子商务有限公司', '帕先生', 5000, '广州xx电子商务有限公司是一家以IT软件技术支持+电商为主营业务的国家高新技术企业、广州市高新技术企业。', '13763468284', 'java工程师', '负责公司软件项目的日常运维,基础模块开发||公司产品的测试,文档整理||全日制本科以上,计算机相关专业||有适当的抗压能力,能积极配合公司安排', '全勤奖，零食下午茶，带薪年假，年终奖，五险一金，加班补助，节日福利，朝九晚五', '广州天河区盛大国际(东北门)盛大国际三楼xxx室');
INSERT INTO `result_recruitment` VALUES (11, '广州xx电子商务有限公司', '帕先生', 5000, '广州xx电子商务有限公司是一家以IT软件技术支持+电商为主营业务的国家高新技术企业、广州市高新技术企业。', '13763468284', 'java工程师', '负责公司软件项目的日常运维,基础模块开发||公司产品的测试,文档整理||全日制本科以上,计算机相关专业||有适当的抗压能力,能积极配合公司安排', '双休，全勤奖，零食下午茶，带薪年假，年终奖，五险一金，加班补助，节日福利', '广州天河区盛大国际(东北门)盛大国际三楼xxx室');
INSERT INTO `result_recruitment` VALUES (12, '广州xx电子商务有限公司', '帕先生', 5000, '广州xx电子商务有限公司是一家以IT软件技术支持+电商为主营业务的国家高新技术企业、广州市高新技术企业。', '13763468284', 'java工程师', '负责公司软件项目的日常运维,基础模块开发||公司产品的测试,文档整理||全日制本科以上,计算机相关专业||有适当的抗压能力,能积极配合公司安排', '全勤奖，零食下午茶，带薪年假，年终奖，五险一金，加班补助，节日福利，朝九晚五', '广州天河区盛大国际(东北门)盛大国际三楼xxx室');
INSERT INTO `result_recruitment` VALUES (13, '广州xx电子商务有限公司', '帕先生', 5000, '广州xx电子商务有限公司是一家以IT软件技术支持+电商为主营业务的国家高新技术企业、广州市高新技术企业。', '13763468284', 'java工程师', '负责公司软件项目的日常运维,基础模块开发||公司产品的测试,文档整理||全日制本科以上,计算机相关专业||有适当的抗压能力,能积极配合公司安排', '全勤奖，零食下午茶，带薪年假，年终奖，五险一金，加班补助，节日福利，朝九晚五', '广州天河区盛大国际(东北门)盛大国际三楼xxx室');
INSERT INTO `result_recruitment` VALUES (14, '广州xx电子商务有限公司', '帕先生', 5000, '广州xx电子商务有限公司是一家以IT软件技术支持+电商为主营业务的国家高新技术企业、广州市高新技术企业。', '13763468284', 'java工程师', '负责公司软件项目的日常运维,基础模块开发||公司产品的测试,文档整理||全日制本科以上,计算机相关专业||有适当的抗压能力,能积极配合公司安排', '双休，全勤奖，零食下午茶，带薪年假，年终奖，五险一金，加班补助，节日福利', '广州天河区盛大国际(东北门)盛大国际三楼xxx室');
INSERT INTO `result_recruitment` VALUES (15, '广州xx电子商务有限公司', '帕先生', 5000, '广州xx电子商务有限公司是一家以IT软件技术支持+电商为主营业务的国家高新技术企业、广州市高新技术企业。', '13763468284', 'java工程师', '负责公司软件项目的日常运维,基础模块开发||公司产品的测试,文档整理||全日制本科以上,计算机相关专业||有适当的抗压能力,能积极配合公司安排', '全勤奖，零食下午茶，带薪年假，年终奖，五险一金，加班补助，节日福利，朝九晚五', '广州天河区盛大国际(东北门)盛大国际三楼xxx室');
INSERT INTO `result_recruitment` VALUES (16, '广州xx电子商务有限公司', '帕先生', 5000, '广州xx电子商务有限公司是一家以IT软件技术支持+电商为主营业务的国家高新技术企业、广州市高新技术企业。', '13763468284', 'java工程师', '负责公司软件项目的日常运维,基础模块开发||公司产品的测试,文档整理||全日制本科以上,计算机相关专业||有适当的抗压能力,能积极配合公司安排', '双休，全勤奖，零食下午茶，带薪年假，年终奖，五险一金，加班补助，节日福利，朝九晚五', '广州天河区盛大国际(东北门)盛大国际三楼xxx室');

-- ----------------------------
-- Table structure for result_seat
-- ----------------------------
DROP TABLE IF EXISTS `result_seat`;
CREATE TABLE `result_seat`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `floor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `seat` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 484 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of result_seat
-- ----------------------------
INSERT INTO `result_seat` VALUES (1, '22215150513', '一楼', 'A11', '12:10-14:20', '3座', '2023-08-27');
INSERT INTO `result_seat` VALUES (2, '22215150513', '一楼', 'A11', '12:10-14:20', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (6, '22215150516', '一楼', 'A11', '09:00-12:00', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (140, '22215150514', '一楼', 'A41', '00:00-00:47', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (141, '22215150514', '一楼', 'A42', '00:00-00:47', '2座', '2023-08-27');
INSERT INTO `result_seat` VALUES (142, '22215150514', '一楼', 'A42', '00:00-00:47', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (143, '22215150514', '一楼', 'A42', '00:00-00:47', '3座', '2023-08-27');
INSERT INTO `result_seat` VALUES (144, '22215150514', '一楼', 'A43', '00:00-00:47', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (145, '22215150514', '一楼', 'A43', '00:00-00:47', '2座', '2023-08-27');
INSERT INTO `result_seat` VALUES (146, '22215150514', '一楼', 'A43', '00:00-00:47', '3座', '2023-08-27');
INSERT INTO `result_seat` VALUES (147, '22215150514', '一楼', 'A43', '00:00-00:47', '4座', '2023-08-27');
INSERT INTO `result_seat` VALUES (148, '22215150514', '一楼', 'A43', '01:00-01:47', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (149, '22215150514', '一楼', 'A44', '01:00-01:47', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (150, '22215150514', '一楼', 'A44', '01:00-01:47', '2座', '2023-08-27');
INSERT INTO `result_seat` VALUES (151, '22215150514', '一楼', 'A44', '01:00-01:47', '3座', '2023-08-27');
INSERT INTO `result_seat` VALUES (152, '22215150514', '一楼', 'A44', '01:00-01:47', '4座', '2023-08-27');
INSERT INTO `result_seat` VALUES (153, '22215150514', '一楼', 'A44', '02:00-02:47', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (154, '22215150514', '一楼', 'A44', '02:00-02:47', '2座', '2023-08-27');
INSERT INTO `result_seat` VALUES (155, '22215150514', '一楼', 'A44', '02:00-02:47', '3座', '2023-08-27');
INSERT INTO `result_seat` VALUES (156, '22215150514', '一楼', 'A45', '02:00-02:47', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (157, '22215150514', '一楼', 'A45', '02:00-02:47', '2座', '2023-08-27');
INSERT INTO `result_seat` VALUES (158, '22215150514', '一楼', 'A45', '02:00-02:47', '3座', '2023-08-27');
INSERT INTO `result_seat` VALUES (159, '22215150514', '一楼', 'A45', '02:00-02:47', '4座', '2023-08-27');
INSERT INTO `result_seat` VALUES (160, '22215150514', '一楼', 'A45', '03:00-03:47', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (161, '22215150514', '一楼', 'A45', '03:00-03:47', '2座', '2023-08-27');
INSERT INTO `result_seat` VALUES (162, '22215150514', '一楼', 'A45', '03:00-03:47', '3座', '2023-08-27');
INSERT INTO `result_seat` VALUES (163, '22215150514', '一楼', 'A45', '03:00-03:47', '4座', '2023-08-27');
INSERT INTO `result_seat` VALUES (164, '22215150514', '一楼', 'A45', '04:00-04:47', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (165, '22215150514', '一楼', 'C32', '04:00-04:47', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (166, '22215150514', '一楼', 'B33', '08:00-12:00', '4座', '2023-08-27');
INSERT INTO `result_seat` VALUES (167, '22215150514', '一楼', 'B33', '08:00-12:00', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (168, '22215150514', '一楼', 'B33', '09:00-10:00', '3座', '2023-08-27');
INSERT INTO `result_seat` VALUES (169, '22215150514', '一楼', 'B33', '09:00-10:00', '2座', '2023-08-27');
INSERT INTO `result_seat` VALUES (170, '22215150514', '一楼', 'B33', '13:00-14:00', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (171, '22215150514', '一楼', 'C27', '00:00-23:59', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (172, '22215150514', '一楼', 'C48', '00:00-23:59', '3座', '2023-08-27');
INSERT INTO `result_seat` VALUES (173, '22215150514', '一楼', 'C48', '00:00-23:59', '2座', '2023-08-27');
INSERT INTO `result_seat` VALUES (174, '22215150514', '一楼', 'C48', '00:00-23:59', '4座', '2023-08-27');
INSERT INTO `result_seat` VALUES (175, '22215150514', '一楼', 'A21', '03:00-23:59', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (176, '22215150514', '一楼', 'A24', '03:00-23:59', '4座', '2023-08-27');
INSERT INTO `result_seat` VALUES (177, '22215150514', '一楼', 'A36', '03:00-23:59', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (178, '22215150514', '一楼', 'A16', '03:00-23:59', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (179, '22215150514', '一楼', 'A15', '03:00-23:59', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (180, '22215150514', '一楼', 'C12', '03:00-23:59', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (181, '22215150514', '一楼', 'A48', '03:00-23:59', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (182, '22215150514', '一楼', 'A27', '03:00-23:59', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (183, '22215150514', '一楼', 'A33', '03:00-23:59', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (184, '22215150514', '一楼', 'A32', '03:00-23:59', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (185, '22215150514', '一楼', 'C13', '03:00-23:59', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (186, '22215150514', '一楼', 'C24', '03:00-23:59', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (187, '22215150514', '一楼', 'C34', '03:00-23:59', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (188, '22215150514', '一楼', 'C15', '03:00-23:59', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (189, '22215150514', '一楼', 'C41', '03:00-23:59', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (190, '22215150514', '一楼', 'C43', '03:00-23:59', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (191, '22215150514', '一楼', 'C18', '03:00-23:59', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (192, '22215150514', '一楼', 'C21', '03:00-23:59', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (193, '22215150514', '一楼', 'C36', '03:00-23:59', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (194, '22215150514', '一楼', 'C46', '03:00-23:59', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (195, '22215150514', '一楼', 'B11', '03:00-23:59', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (196, '22215150514', '一楼', 'B22', '03:00-23:59', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (197, '22215150514', '一楼', 'B26', '03:00-23:59', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (198, '22215150514', '一楼', 'B41', '03:00-23:59', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (199, '22215150514', '一楼', 'B48', '03:00-23:59', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (200, '22215150514', '一楼', 'B28', '03:00-23:59', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (201, '22215150514', '一楼', 'B35', '03:00-23:59', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (202, '22215150514', '一楼', 'B46', '03:00-23:59', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (203, '22215150514', '一楼', 'B44', '03:00-23:59', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (204, '22215150514', '一楼', 'B14', '03:00-23:59', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (205, '22215150514', '一楼', 'B16', '03:00-23:59', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (206, '22215150514', '一楼', 'B17', '03:00-23:59', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (207, '22215150514', '一楼', 'B18', '03:00-23:59', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (208, '22215150514', '一楼', 'B34', '03:00-23:59', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (209, '22215150514', '一楼', 'B13', '03:00-23:59', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (210, '22215150514', '一楼', 'D11', '03:00-23:59', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (211, '22215150514', '一楼', 'D13', '03:00-23:59', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (212, '22215150514', '一楼', 'D32', '03:00-23:59', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (213, '22215150514', '一楼', 'D25', '03:00-23:59', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (214, '22215150514', '一楼', 'D16', '03:00-23:59', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (215, '22215150514', '一楼', 'D17', '03:00-23:59', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (216, '22215150514', '一楼', 'D37', '03:00-23:59', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (217, '22215150514', '一楼', 'D34', '03:00-23:59', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (218, '22215150514', '一楼', 'D45', '03:00-23:59', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (219, '22215150514', '一楼', 'D43', '03:00-23:59', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (220, '22215150514', '一楼', 'D48', '03:00-23:59', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (221, '22215150514', '一楼', 'D18', '03:00-23:59', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (222, '22215150514', '一楼', 'D26', '03:00-23:59', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (223, '22215150514', '一楼', 'A35', '03:00-23:59', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (224, '22215150514', '一楼', 'A26', '03:00-23:59', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (225, '22215150514', '一楼', 'C12', '03:00-23:59', '2座', '2023-08-27');
INSERT INTO `result_seat` VALUES (226, '22215150514', '一楼', 'C12', '03:00-23:59', '4座', '2023-08-27');
INSERT INTO `result_seat` VALUES (227, '22215150514', '一楼', 'C13', '03:00-23:59', '4座', '2023-08-27');
INSERT INTO `result_seat` VALUES (228, '22215150514', '一楼', 'C13', '03:00-23:59', '2座', '2023-08-27');
INSERT INTO `result_seat` VALUES (229, '22215150514', '一楼', 'C13', '03:00-23:59', '3座', '2023-08-27');
INSERT INTO `result_seat` VALUES (230, '22215150514', '一楼', 'C13', '00:00-00:36', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (231, '22215150514', '一楼', 'C34', '00:00-00:36', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (232, '22215150514', '一楼', 'C34', '00:00-00:36', '2座', '2023-08-27');
INSERT INTO `result_seat` VALUES (233, '22215150514', '一楼', 'C34', '00:00-00:36', '3座', '2023-08-27');
INSERT INTO `result_seat` VALUES (234, '22215150514', '一楼', 'C34', '00:00-00:36', '4座', '2023-08-27');
INSERT INTO `result_seat` VALUES (235, '22215150514', '一楼', 'C43', '00:00-00:36', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (236, '22215150514', '一楼', 'C43', '00:00-00:36', '2座', '2023-08-27');
INSERT INTO `result_seat` VALUES (237, '22215150514', '一楼', 'C43', '00:00-00:36', '3座', '2023-08-27');
INSERT INTO `result_seat` VALUES (238, '22215150514', '一楼', 'C43', '00:00-00:36', '4座', '2023-08-27');
INSERT INTO `result_seat` VALUES (239, '22215150514', '一楼', 'C27', '00:00-00:36', '4座', '2023-08-27');
INSERT INTO `result_seat` VALUES (240, '22215150514', '一楼', 'C27', '00:00-00:36', '3座', '2023-08-27');
INSERT INTO `result_seat` VALUES (241, '22215150514', '一楼', 'C27', '00:00-00:36', '2座', '2023-08-27');
INSERT INTO `result_seat` VALUES (242, '22215150514', '一楼', 'C21', '00:00-00:36', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (243, '22215150514', '一楼', 'C21', '00:00-00:36', '2座', '2023-08-27');
INSERT INTO `result_seat` VALUES (244, '22215150514', '一楼', 'C21', '00:00-00:36', '3座', '2023-08-27');
INSERT INTO `result_seat` VALUES (245, '22215150514', '一楼', 'C21', '00:00-00:36', '4座', '2023-08-27');
INSERT INTO `result_seat` VALUES (246, '22215150514', '一楼', 'C41', '00:00-00:36', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (247, '22215150514', '一楼', 'C41', '00:00-00:36', '2座', '2023-08-27');
INSERT INTO `result_seat` VALUES (248, '22215150514', '一楼', 'C41', '00:00-00:36', '3座', '2023-08-27');
INSERT INTO `result_seat` VALUES (249, '22215150514', '一楼', 'C41', '00:00-00:36', '4座', '2023-08-27');
INSERT INTO `result_seat` VALUES (250, '22215150514', '一楼', 'C36', '00:00-00:36', '4座', '2023-08-27');
INSERT INTO `result_seat` VALUES (251, '22215150514', '一楼', 'C36', '00:00-00:36', '3座', '2023-08-27');
INSERT INTO `result_seat` VALUES (252, '22215150514', '一楼', 'C18', '00:00-00:36', '2座', '2023-08-27');
INSERT INTO `result_seat` VALUES (253, '22215150514', '一楼', 'C36', '00:00-00:36', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (254, '22215150514', '一楼', 'C36', '00:00-00:36', '2座', '2023-08-27');
INSERT INTO `result_seat` VALUES (255, '22215150514', '一楼', 'C18', '00:00-00:36', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (256, '22215150514', '一楼', 'C18', '00:00-00:36', '3座', '2023-08-27');
INSERT INTO `result_seat` VALUES (257, '22215150514', '一楼', 'C15', '00:00-00:36', '3座', '2023-08-27');
INSERT INTO `result_seat` VALUES (258, '22215150514', '一楼', 'C15', '00:00-00:36', '4座', '2023-08-27');
INSERT INTO `result_seat` VALUES (259, '22215150514', '一楼', 'C15', '00:00-00:36', '2座', '2023-08-27');
INSERT INTO `result_seat` VALUES (260, '22215150514', '一楼', 'C15', '00:00-00:36', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (261, '22215150514', '一楼', 'C17', '00:00-00:36', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (262, '22215150514', '一楼', 'B11', '00:00-00:36', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (263, '22215150514', '一楼', 'B11', '00:00-00:36', '2座', '2023-08-27');
INSERT INTO `result_seat` VALUES (264, '22215150514', '一楼', 'B11', '00:00-00:36', '3座', '2023-08-27');
INSERT INTO `result_seat` VALUES (265, '22215150514', '一楼', 'B11', '00:00-00:36', '4座', '2023-08-27');
INSERT INTO `result_seat` VALUES (266, '22215150514', '一楼', 'B41', '00:00-00:36', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (267, '22215150514', '一楼', 'B41', '00:00-00:36', '2座', '2023-08-27');
INSERT INTO `result_seat` VALUES (268, '22215150514', '一楼', 'B14', '00:00-00:36', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (269, '22215150514', '一楼', 'B14', '00:00-00:36', '2座', '2023-08-27');
INSERT INTO `result_seat` VALUES (270, '22215150514', '一楼', 'B14', '00:00-00:36', '3座', '2023-08-27');
INSERT INTO `result_seat` VALUES (271, '22215150514', '一楼', 'B14', '00:00-00:36', '4座', '2023-08-27');
INSERT INTO `result_seat` VALUES (272, '22215150514', '一楼', 'B35', '00:00-00:36', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (273, '22215150514', '一楼', 'B35', '00:00-00:36', '2座', '2023-08-27');
INSERT INTO `result_seat` VALUES (274, '22215150514', '一楼', 'B26', '00:00-00:36', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (275, '22215150514', '一楼', 'B35', '00:00-00:36', '3座', '2023-08-27');
INSERT INTO `result_seat` VALUES (276, '22215150514', '一楼', 'B26', '00:00-00:36', '2座', '2023-08-27');
INSERT INTO `result_seat` VALUES (277, '22215150514', '一楼', 'B26', '00:00-00:36', '3座', '2023-08-27');
INSERT INTO `result_seat` VALUES (278, '22215150514', '一楼', 'B26', '00:00-00:36', '4座', '2023-08-27');
INSERT INTO `result_seat` VALUES (279, '22215150514', '一楼', 'B18', '00:00-00:36', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (280, '22215150514', '一楼', 'B18', '00:00-00:36', '2座', '2023-08-27');
INSERT INTO `result_seat` VALUES (281, '22215150514', '一楼', 'B18', '00:00-00:36', '3座', '2023-08-27');
INSERT INTO `result_seat` VALUES (282, '22215150514', '一楼', 'B18', '00:00-00:36', '4座', '2023-08-27');
INSERT INTO `result_seat` VALUES (283, '22215150514', '一楼', 'B47', '00:00-00:36', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (284, '22215150514', '一楼', 'B47', '00:00-00:36', '2座', '2023-08-27');
INSERT INTO `result_seat` VALUES (285, '22215150514', '一楼', 'B47', '00:00-00:36', '3座', '2023-08-27');
INSERT INTO `result_seat` VALUES (286, '22215150514', '一楼', 'B48', '00:00-00:36', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (287, '22215150514', '一楼', 'B48', '00:00-00:36', '2座', '2023-08-27');
INSERT INTO `result_seat` VALUES (288, '22215150514', '一楼', 'B48', '00:00-00:36', '3座', '2023-08-27');
INSERT INTO `result_seat` VALUES (289, '22215150514', '一楼', 'B48', '00:00-00:36', '4座', '2023-08-27');
INSERT INTO `result_seat` VALUES (290, '22215150514', '一楼', 'B32', '00:00-00:36', '3座', '2023-08-27');
INSERT INTO `result_seat` VALUES (291, '22215150514', '一楼', 'B32', '00:00-00:36', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (292, '22215150514', '一楼', 'B32', '00:00-00:36', '2座', '2023-08-27');
INSERT INTO `result_seat` VALUES (293, '22215150514', '一楼', 'B32', '00:00-00:36', '4座', '2023-08-27');
INSERT INTO `result_seat` VALUES (294, '22215150514', '一楼', 'D13', '00:00-00:36', '4座', '2023-08-27');
INSERT INTO `result_seat` VALUES (295, '22215150514', '一楼', 'D13', '00:00-00:36', '3座', '2023-08-27');
INSERT INTO `result_seat` VALUES (296, '22215150514', '一楼', 'D13', '00:00-00:36', '2座', '2023-08-27');
INSERT INTO `result_seat` VALUES (297, '22215150514', '一楼', 'D13', '00:00-00:36', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (298, '22215150514', '一楼', 'D23', '00:00-00:36', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (299, '22215150514', '一楼', 'D16', '00:00-00:36', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (300, '22215150514', '一楼', 'D16', '00:00-00:36', '2座', '2023-08-27');
INSERT INTO `result_seat` VALUES (301, '22215150514', '一楼', 'D16', '00:00-00:36', '3座', '2023-08-27');
INSERT INTO `result_seat` VALUES (302, '22215150514', '一楼', 'D16', '00:00-00:36', '4座', '2023-08-27');
INSERT INTO `result_seat` VALUES (303, '22215150514', '一楼', 'D37', '00:00-00:36', '4座', '2023-08-27');
INSERT INTO `result_seat` VALUES (304, '22215150514', '一楼', 'D37', '00:00-00:36', '3座', '2023-08-27');
INSERT INTO `result_seat` VALUES (305, '22215150514', '一楼', 'D37', '00:00-00:36', '2座', '2023-08-27');
INSERT INTO `result_seat` VALUES (306, '22215150514', '一楼', 'D37', '00:00-00:36', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (307, '22215150514', '一楼', 'D44', '00:00-00:36', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (308, '22215150514', '一楼', 'D45', '00:00-00:36', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (309, '22215150514', '一楼', 'D34', '00:00-00:36', '2座', '2023-08-27');
INSERT INTO `result_seat` VALUES (310, '22215150514', '一楼', 'D34', '00:00-00:36', '4座', '2023-08-27');
INSERT INTO `result_seat` VALUES (311, '22215150514', '一楼', 'D45', '00:00-00:36', '4座', '2023-08-27');
INSERT INTO `result_seat` VALUES (312, '22215150514', '一楼', 'D45', '00:00-00:36', '3座', '2023-08-27');
INSERT INTO `result_seat` VALUES (313, '22215150514', '一楼', 'D45', '00:00-00:36', '2座', '2023-08-27');
INSERT INTO `result_seat` VALUES (314, '22215150514', '一楼', 'D41', '00:00-00:36', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (315, '22215150514', '一楼', 'D36', '00:00-00:36', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (316, '22215150514', '一楼', 'B37', '00:00-00:36', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (317, '22215150514', '一楼', 'A18', '00:00-00:36', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (318, '22215150514', '一楼', 'A18', '00:00-00:36', '2座', '2023-08-27');
INSERT INTO `result_seat` VALUES (319, '22215150514', '一楼', 'A18', '00:00-00:36', '3座', '2023-08-27');
INSERT INTO `result_seat` VALUES (320, '22215150514', '一楼', 'A18', '00:00-00:36', '4座', '2023-08-27');
INSERT INTO `result_seat` VALUES (321, '22215150514', '一楼', 'A32', '00:00-00:36', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (322, '22215150514', '一楼', 'A32', '00:00-00:36', '2座', '2023-08-27');
INSERT INTO `result_seat` VALUES (323, '22215150514', '一楼', 'A32', '00:00-00:36', '3座', '2023-08-27');
INSERT INTO `result_seat` VALUES (324, '22215150514', '一楼', 'A32', '00:00-00:36', '4座', '2023-08-27');
INSERT INTO `result_seat` VALUES (325, '22215150514', '一楼', 'A33', '00:00-00:36', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (326, '22215150514', '一楼', 'A33', '00:00-00:36', '2座', '2023-08-27');
INSERT INTO `result_seat` VALUES (327, '22215150514', '一楼', 'A33', '00:00-00:36', '3座', '2023-08-27');
INSERT INTO `result_seat` VALUES (328, '22215150514', '一楼', 'A23', '00:00-00:36', '3座', '2023-08-27');
INSERT INTO `result_seat` VALUES (329, '22215150514', '一楼', 'C26', '00:00-00:36', '3座', '2023-08-27');
INSERT INTO `result_seat` VALUES (330, '22215150514', '一楼', 'A18', '00:36-00:37', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (331, '22215150514', '一楼', 'A18', '00:36-00:37', '2座', '2023-08-27');
INSERT INTO `result_seat` VALUES (332, '22215150514', '一楼', 'A18', '00:36-00:37', '3座', '2023-08-27');
INSERT INTO `result_seat` VALUES (333, '22215150514', '一楼', 'A18', '00:36-00:37', '4座', '2023-08-27');
INSERT INTO `result_seat` VALUES (334, '22215150514', '一楼', 'A26', '00:36-00:37', '4座', '2023-08-27');
INSERT INTO `result_seat` VALUES (335, '22215150514', '一楼', 'A27', '00:36-00:37', '3座', '2023-08-27');
INSERT INTO `result_seat` VALUES (336, '22215150514', '一楼', 'A27', '00:36-00:37', '2座', '2023-08-27');
INSERT INTO `result_seat` VALUES (337, '22215150514', '一楼', 'A27', '00:36-00:37', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (338, '22215150514', '一楼', 'A16', '00:36-00:37', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (339, '22215150514', '一楼', 'A16', '00:36-00:37', '2座', '2023-08-27');
INSERT INTO `result_seat` VALUES (340, '22215150514', '一楼', 'A16', '00:36-00:37', '3座', '2023-08-27');
INSERT INTO `result_seat` VALUES (341, '22215150514', '一楼', 'A16', '00:36-00:37', '4座', '2023-08-27');
INSERT INTO `result_seat` VALUES (342, '22215150514', '一楼', 'A15', '00:36-00:37', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (343, '22215150514', '一楼', 'A15', '00:36-00:37', '4座', '2023-08-27');
INSERT INTO `result_seat` VALUES (344, '22215150514', '一楼', 'A23', '00:36-00:37', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (345, '22215150514', '一楼', 'A23', '00:36-00:37', '2座', '2023-08-27');
INSERT INTO `result_seat` VALUES (346, '22215150514', '一楼', 'A23', '00:36-00:37', '3座', '2023-08-27');
INSERT INTO `result_seat` VALUES (347, '22215150514', '一楼', 'A23', '00:36-00:37', '4座', '2023-08-27');
INSERT INTO `result_seat` VALUES (348, '22215150514', '一楼', 'A36', '00:36-00:37', '4座', '2023-08-27');
INSERT INTO `result_seat` VALUES (349, '22215150514', '一楼', 'A36', '00:36-00:37', '3座', '2023-08-27');
INSERT INTO `result_seat` VALUES (350, '22215150514', '一楼', 'A36', '00:36-00:37', '2座', '2023-08-27');
INSERT INTO `result_seat` VALUES (351, '22215150514', '一楼', 'A36', '00:36-00:37', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (352, '22215150514', '一楼', 'B11', '00:36-00:37', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (353, '22215150514', '一楼', 'B11', '00:36-00:37', '2座', '2023-08-27');
INSERT INTO `result_seat` VALUES (354, '22215150514', '一楼', 'B11', '00:36-00:37', '3座', '2023-08-27');
INSERT INTO `result_seat` VALUES (355, '22215150514', '一楼', 'B11', '00:36-00:37', '4座', '2023-08-27');
INSERT INTO `result_seat` VALUES (356, '22215150514', '一楼', 'B33', '00:36-00:37', '4座', '2023-08-27');
INSERT INTO `result_seat` VALUES (357, '22215150514', '一楼', 'B33', '00:36-00:37', '3座', '2023-08-27');
INSERT INTO `result_seat` VALUES (358, '22215150514', '一楼', 'B26', '00:36-00:37', '4座', '2023-08-27');
INSERT INTO `result_seat` VALUES (359, '22215150514', '一楼', 'B26', '00:36-00:37', '3座', '2023-08-27');
INSERT INTO `result_seat` VALUES (360, '22215150514', '一楼', 'B26', '00:36-00:37', '2座', '2023-08-27');
INSERT INTO `result_seat` VALUES (361, '22215150514', '一楼', 'B26', '00:36-00:37', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (362, '22215150514', '一楼', 'B24', '00:36-00:37', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (363, '22215150514', '一楼', 'B18', '00:36-00:37', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (364, '22215150514', '一楼', 'B18', '00:36-00:37', '2座', '2023-08-27');
INSERT INTO `result_seat` VALUES (365, '22215150514', '一楼', 'B18', '00:36-00:37', '3座', '2023-08-27');
INSERT INTO `result_seat` VALUES (366, '22215150514', '一楼', 'B48', '00:36-00:37', '3座', '2023-08-27');
INSERT INTO `result_seat` VALUES (367, '22215150514', '一楼', 'B24', '00:36-00:37', '3座', '2023-08-27');
INSERT INTO `result_seat` VALUES (368, '22215150514', '一楼', 'B24', '00:36-00:37', '4座', '2023-08-27');
INSERT INTO `result_seat` VALUES (369, '22215150514', '一楼', 'B24', '00:36-00:37', '2座', '2023-08-27');
INSERT INTO `result_seat` VALUES (370, '22215150514', '一楼', 'D13', '00:36-00:37', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (371, '22215150514', '一楼', 'D13', '00:36-00:37', '2座', '2023-08-27');
INSERT INTO `result_seat` VALUES (372, '22215150514', '一楼', 'D13', '00:36-00:37', '3座', '2023-08-27');
INSERT INTO `result_seat` VALUES (373, '22215150514', '一楼', 'D13', '00:36-00:37', '4座', '2023-08-27');
INSERT INTO `result_seat` VALUES (374, '22215150514', '一楼', 'D45', '00:36-00:37', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (375, '22215150514', '一楼', 'D45', '00:36-00:37', '2座', '2023-08-27');
INSERT INTO `result_seat` VALUES (376, '22215150514', '一楼', 'D23', '00:36-00:37', '2座', '2023-08-27');
INSERT INTO `result_seat` VALUES (377, '22215150514', '一楼', 'D23', '00:36-00:37', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (378, '22215150514', '一楼', 'D23', '00:36-00:37', '3座', '2023-08-27');
INSERT INTO `result_seat` VALUES (379, '22215150514', '一楼', 'D23', '00:36-00:37', '4座', '2023-08-27');
INSERT INTO `result_seat` VALUES (380, '22215150514', '一楼', 'D41', '00:36-00:37', '4座', '2023-08-27');
INSERT INTO `result_seat` VALUES (381, '22215150514', '一楼', 'D41', '00:36-00:37', '2座', '2023-08-27');
INSERT INTO `result_seat` VALUES (382, '22215150514', '一楼', 'C45', '00:36-00:37', '2座', '2023-08-27');
INSERT INTO `result_seat` VALUES (383, '22215150514', '一楼', 'C23', '00:36-00:37', '2座', '2023-08-27');
INSERT INTO `result_seat` VALUES (384, '22215150514', '一楼', 'C38', '00:36-00:37', '2座', '2023-08-27');
INSERT INTO `result_seat` VALUES (385, '22215150514', '一楼', 'C28', '00:36-00:37', '2座', '2023-08-27');
INSERT INTO `result_seat` VALUES (386, '22215150514', '一楼', 'C28', '00:36-00:37', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (387, '22215150514', '一楼', 'C28', '00:36-00:37', '3座', '2023-08-27');
INSERT INTO `result_seat` VALUES (388, '22215150514', '一楼', 'C28', '00:36-00:37', '4座', '2023-08-27');
INSERT INTO `result_seat` VALUES (389, '22215150514', '一楼', 'D26', '00:36-00:37', '4座', '2023-08-27');
INSERT INTO `result_seat` VALUES (390, '22215150514', '一楼', 'D26', '00:36-00:37', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (391, '22215150514', '一楼', 'D26', '00:36-00:37', '3座', '2023-08-27');
INSERT INTO `result_seat` VALUES (392, '22215150514', '一楼', 'D26', '00:36-00:37', '2座', '2023-08-27');
INSERT INTO `result_seat` VALUES (393, '22215150514', '一楼', 'C46', '00:36-00:37', '2座', '2023-08-27');
INSERT INTO `result_seat` VALUES (394, '22215150514', '一楼', 'C46', '00:36-00:37', '3座', '2023-08-27');
INSERT INTO `result_seat` VALUES (395, '22215150514', '一楼', 'A11', '16:37-18:30', '3座', '2023-08-27');
INSERT INTO `result_seat` VALUES (396, '22215150514', '一楼', 'A11', '16:37-18:30', '2座', '2023-08-27');
INSERT INTO `result_seat` VALUES (397, '22215150514', '一楼', 'A23', '00:37-00:38', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (398, '22215150514', '一楼', 'A23', '00:37-00:38', '2座', '2023-08-27');
INSERT INTO `result_seat` VALUES (399, '22215150514', '一楼', 'A26', '00:37-00:38', '2座', '2023-08-27');
INSERT INTO `result_seat` VALUES (400, '22215150514', '一楼', 'A26', '00:37-00:38', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (401, '22215150514', '一楼', 'A26', '00:37-00:38', '3座', '2023-08-27');
INSERT INTO `result_seat` VALUES (402, '22215150514', '一楼', 'A16', '00:37-00:38', '3座', '2023-08-27');
INSERT INTO `result_seat` VALUES (403, '22215150514', '一楼', 'A16', '00:37-00:38', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (404, '22215150514', '一楼', 'A48', '00:37-00:38', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (405, '22215150514', '一楼', 'A48', '00:37-00:38', '4座', '2023-08-27');
INSERT INTO `result_seat` VALUES (406, '22215150514', '一楼', 'C28', '00:37-00:38', '4座', '2023-08-27');
INSERT INTO `result_seat` VALUES (407, '22215150514', '一楼', 'C15', '00:37-00:38', '4座', '2023-08-27');
INSERT INTO `result_seat` VALUES (408, '22215150514', '一楼', 'C15', '00:37-00:38', '3座', '2023-08-27');
INSERT INTO `result_seat` VALUES (409, '22215150514', '一楼', 'C13', '00:37-00:38', '3座', '2023-08-27');
INSERT INTO `result_seat` VALUES (410, '22215150514', '一楼', 'C13', '00:37-00:38', '4座', '2023-08-27');
INSERT INTO `result_seat` VALUES (411, '22215150514', '一楼', 'C13', '00:37-00:38', '2座', '2023-08-27');
INSERT INTO `result_seat` VALUES (412, '22215150514', '一楼', 'C13', '00:37-00:38', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (413, '22215150514', '一楼', 'C41', '00:37-00:38', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (414, '22215150514', '一楼', 'C41', '00:37-00:38', '2座', '2023-08-27');
INSERT INTO `result_seat` VALUES (415, '22215150514', '一楼', 'C23', '00:37-00:38', '2座', '2023-08-27');
INSERT INTO `result_seat` VALUES (416, '22215150514', '一楼', 'C23', '00:37-00:38', '3座', '2023-08-27');
INSERT INTO `result_seat` VALUES (417, '22215150514', '一楼', 'C34', '00:37-00:38', '3座', '2023-08-27');
INSERT INTO `result_seat` VALUES (418, '22215150514', '一楼', 'C34', '00:37-00:38', '2座', '2023-08-27');
INSERT INTO `result_seat` VALUES (419, '22215150514', '一楼', 'D25', '00:37-00:38', '2座', '2023-08-27');
INSERT INTO `result_seat` VALUES (420, '22215150514', '一楼', 'D25', '00:37-00:38', '4座', '2023-08-27');
INSERT INTO `result_seat` VALUES (421, '22215150514', '一楼', 'D37', '00:37-00:38', '3座', '2023-08-27');
INSERT INTO `result_seat` VALUES (422, '22215150514', '一楼', 'D37', '00:37-00:38', '4座', '2023-08-27');
INSERT INTO `result_seat` VALUES (423, '22215150514', '一楼', 'D18', '00:37-00:38', '4座', '2023-08-27');
INSERT INTO `result_seat` VALUES (424, '22215150514', '一楼', 'D18', '00:37-00:38', '3座', '2023-08-27');
INSERT INTO `result_seat` VALUES (425, '22215150514', '一楼', 'D18', '00:37-00:38', '2座', '2023-08-27');
INSERT INTO `result_seat` VALUES (426, '22215150514', '一楼', 'D18', '00:37-00:38', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (427, '22215150514', '一楼', 'D16', '00:37-00:38', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (428, '22215150514', '一楼', 'D16', '00:37-00:38', '2座', '2023-08-27');
INSERT INTO `result_seat` VALUES (429, '22215150514', '一楼', 'D43', '00:37-00:38', '2座', '2023-08-27');
INSERT INTO `result_seat` VALUES (430, '22215150514', '一楼', 'D43', '00:37-00:38', '4座', '2023-08-27');
INSERT INTO `result_seat` VALUES (431, '22215150514', '一楼', 'D32', '00:37-00:38', '4座', '2023-08-27');
INSERT INTO `result_seat` VALUES (432, '22215150514', '一楼', 'D32', '00:37-00:38', '3座', '2023-08-27');
INSERT INTO `result_seat` VALUES (433, '22215150514', '一楼', 'D32', '00:37-00:38', '2座', '2023-08-27');
INSERT INTO `result_seat` VALUES (434, '22215150514', '一楼', 'D32', '00:37-00:38', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (435, '22215150514', '一楼', 'A25', '00:00-23:59', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (436, '22215150514', '一楼', 'A25', '07:00-11:59', '2座', '2023-08-27');
INSERT INTO `result_seat` VALUES (437, '22215150514', '一楼', 'A11', '00:00-23:59', '4座', '2023-08-27');
INSERT INTO `result_seat` VALUES (438, '22215150514', '一楼', 'A34', '00:00-23:59', '1座', '2023-09-06');
INSERT INTO `result_seat` VALUES (439, '22215150514', '一楼', 'A34', '00:00-23:59', '2座', '2023-09-06');
INSERT INTO `result_seat` VALUES (440, '22215150514', '一楼', 'A34', '00:00-23:59', '3座', '2023-09-06');
INSERT INTO `result_seat` VALUES (441, '22215150514', '一楼', 'A17', '00:00-19:59', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (442, '22215150514', '一楼', 'A17', '10:00-17:59', '2座', '2023-08-27');
INSERT INTO `result_seat` VALUES (443, '22215150514', '一楼', 'A17', '10:00-17:59', '3座', '2023-08-27');
INSERT INTO `result_seat` VALUES (444, '22215150514', '一楼', 'A46', '01:00-21:49', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (445, '22215150514', '一楼', 'A16', '18:30-20:59', '4座', '2023-11-18');
INSERT INTO `result_seat` VALUES (446, '22215150514', '一楼', 'A17', '00:00-23:59', '1座', '2023-11-23');
INSERT INTO `result_seat` VALUES (447, '22215150514', '一楼', 'B13', '00:00-23:59', '1座', '2023-11-26');
INSERT INTO `result_seat` VALUES (448, '22215150514', '一楼', 'A14', '00:00-23:59', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (449, '22215150514', '一楼', 'D21', '00:00-23:59', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (450, '22215150514', '一楼', 'D21', '16:00-18:59', '2座', '2023-08-27');
INSERT INTO `result_seat` VALUES (451, '22215150514', '一楼', 'D21', '16:00-18:59', '3座', '2023-08-27');
INSERT INTO `result_seat` VALUES (452, '22215150514', '一楼', 'B13', '00:00-23:59', '1座', '2024-01-17');
INSERT INTO `result_seat` VALUES (453, '22215150514', '一楼', 'A31', '08:00-09:59', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (454, '22215150514', '一楼', 'A31', '08:00-09:59', '4座', '2023-08-27');
INSERT INTO `result_seat` VALUES (455, '22215150514', '一楼', 'A31', '08:11-09:46', '2座', '2023-08-27');
INSERT INTO `result_seat` VALUES (456, '22215150514', '一楼', 'A31', '09:11-18:46', '3座', '2023-08-27');
INSERT INTO `result_seat` VALUES (457, '22215150514', '一楼', 'A31', '07:11-09:11', '3座', '2023-08-27');
INSERT INTO `result_seat` VALUES (458, '22215150514', '一楼', 'A11', '00:00-23:59', '1座', '2024-01-23');
INSERT INTO `result_seat` VALUES (459, '22215150514', '一楼', 'A11', '00:00-23:59', '3座', '2024-01-23');
INSERT INTO `result_seat` VALUES (460, '22215150514', '一楼', 'A11', '00:00-23:59', '2座', '2024-01-23');
INSERT INTO `result_seat` VALUES (463, '22215150514', '一楼', 'A24', '00:00-23:59', '2座', '2023-08-27');
INSERT INTO `result_seat` VALUES (464, '22215150514', '一楼', 'A24', '00:00-23:59', '3座', '2023-08-27');
INSERT INTO `result_seat` VALUES (465, '22215150514', '一楼', 'A13', '00:00-23:59', '1座', '2024-01-23');
INSERT INTO `result_seat` VALUES (466, '22215150514', '一楼', 'A16', '00:00-23:59', '1座', '2024-01-24');
INSERT INTO `result_seat` VALUES (467, '22215150514', '一楼', 'A14', '00:00-23:59', '1座', '2024-01-23');
INSERT INTO `result_seat` VALUES (468, '22215150514', '一楼', 'A28', '00:00-23:59', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (470, '22215150514', '一楼', 'A16', '00:00-23:59', '1座', '2024-01-28');
INSERT INTO `result_seat` VALUES (471, '22215150514', '一楼', 'A16', '00:00-23:59', '3座', '2024-01-28');
INSERT INTO `result_seat` VALUES (472, '22215150514', '一楼', 'A48', '00:00-23:59', '4座', '2024-01-28');
INSERT INTO `result_seat` VALUES (473, '22215150514', '一楼', 'A16', '00:00-23:59', '2座', '2024-01-28');
INSERT INTO `result_seat` VALUES (476, '22215150111', '一楼', 'A11', '00:00-23:59', '1座', '2023-08-25');
INSERT INTO `result_seat` VALUES (477, '22215150513', '一楼', 'A12', '00:00-23:59', '1座', '2024-02-27');
INSERT INTO `result_seat` VALUES (478, '22215150513', '一楼', 'A12', '00:00-23:59', '2座', '2024-02-27');
INSERT INTO `result_seat` VALUES (479, '22215150514', '一楼', 'C13', '00:38-00:39', '1座', '2023-08-27');
INSERT INTO `result_seat` VALUES (480, '22215150514', '一楼', 'C13', '00:38-00:39', '2座', '2023-08-27');
INSERT INTO `result_seat` VALUES (481, '22215150514', '一楼', 'C13', '00:38-00:39', '3座', '2023-08-27');
INSERT INTO `result_seat` VALUES (482, '22215150514', '一楼', 'C13', '00:38-00:39', '4座', '2023-08-27');
INSERT INTO `result_seat` VALUES (483, '22215150514', '一楼', 'A11', '00:00-23:59', '1座', '2024-03-06');

-- ----------------------------
-- Table structure for result_sport
-- ----------------------------
DROP TABLE IF EXISTS `result_sport`;
CREATE TABLE `result_sport`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `date` date NOT NULL,
  `startTime` datetime NOT NULL,
  `endTime` datetime NOT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `court` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `collaborative` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `number` int(11) NOT NULL,
  `ownership` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `valid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of result_sport
-- ----------------------------
INSERT INTO `result_sport` VALUES (2, '22215150514', '2024-01-30', '2024-01-30 09:00:00', '2024-01-30 12:00:00', '篮球场', 'A', 'b半', '否', 1, 'true', 'true');
INSERT INTO `result_sport` VALUES (3, '22215150514', '2024-01-30', '2024-01-30 08:10:00', '2024-01-30 12:30:00', '篮球场', 'A', 'a半', '是', 2, 'false', 'false');
INSERT INTO `result_sport` VALUES (4, '22215150514', '2024-01-30', '2024-01-30 08:00:00', '2024-01-30 09:00:00', '篮球场', 'A', 'b半', '否', 1, 'true', 'true');
INSERT INTO `result_sport` VALUES (5, '22215150514', '2024-01-30', '2024-01-30 08:00:00', '2024-01-30 09:30:00', '篮球场', 'B', 'a半', '是', 17, 'true', 'true');
INSERT INTO `result_sport` VALUES (6, '22215150514', '2024-01-30', '2024-01-30 08:00:00', '2024-01-30 09:30:00', '篮球场', 'B', 'b半', '否', 1, 'true', 'true');
INSERT INTO `result_sport` VALUES (7, '22215150514', '2024-01-30', '2024-01-30 08:00:00', '2024-01-30 09:30:00', '篮球场', 'B', 'a半', '是', 3, 'false', 'true');
INSERT INTO `result_sport` VALUES (8, '22215150514', '2024-01-30', '2024-01-30 08:00:00', '2024-01-30 09:30:00', '篮球场', 'B', 'a半', '是', 4, 'false', 'true');
INSERT INTO `result_sport` VALUES (9, '22215150514', '2024-01-30', '2024-01-30 08:00:00', '2024-01-30 09:30:00', '篮球场', 'C', 'a半', '否', 1, 'true', 'true');
INSERT INTO `result_sport` VALUES (41, '22215150514', '2024-02-23', '2024-02-23 00:00:00', '2024-02-23 23:59:00', '足球场', 'A', 'a半', '是', 2, 'false', 'false');
INSERT INTO `result_sport` VALUES (43, '22215150513', '2024-02-27', '2024-02-27 00:00:00', '2024-02-27 23:59:00', '足球场', 'A', '全场', '否', 1, 'true', 'true');
INSERT INTO `result_sport` VALUES (44, '22215150513', '2024-02-27', '2024-02-27 00:00:00', '2024-02-27 23:59:00', '篮球场', 'A', '全场', '否', 1, 'true', 'true');
INSERT INTO `result_sport` VALUES (45, '22215150514', '2024-02-28', '2024-02-28 12:00:00', '2024-02-28 14:00:00', '足球场', 'A', 'a半', '是', 5, 'true', 'true');
INSERT INTO `result_sport` VALUES (46, '22215150514', '2024-02-28', '2024-02-28 19:00:00', '2024-02-28 21:00:00', '足球场', 'A', 'b半', '是', 3, 'true', 'true');
INSERT INTO `result_sport` VALUES (47, '22215150514', '2024-02-28', '2024-02-28 20:00:00', '2024-02-28 22:00:00', '足球场', 'A', 'a半', '否', 1, 'true', 'true');
INSERT INTO `result_sport` VALUES (48, '22215150514', '2024-03-02', '2024-03-02 09:00:00', '2024-03-02 12:00:00', '篮球场', 'A', '全场', '是', 6, 'true', 'true');
INSERT INTO `result_sport` VALUES (49, '22215150514', '2024-03-02', '2024-03-02 19:00:00', '2024-03-02 21:00:00', '篮球场', 'A', '全场', '否', 1, 'true', 'true');
INSERT INTO `result_sport` VALUES (50, '22215150514', '2024-03-02', '2024-03-02 12:00:00', '2024-03-02 13:00:00', '篮球场', 'A', 'a半', '否', 1, 'true', 'true');
INSERT INTO `result_sport` VALUES (51, '22215150514', '2024-03-02', '2024-03-02 12:00:00', '2024-03-02 14:30:00', '篮球场', 'A', 'b半', '否', 1, 'true', 'true');
INSERT INTO `result_sport` VALUES (52, '22215150514', '2024-03-02', '2024-03-02 13:30:00', '2024-03-02 18:20:00', '篮球场', 'A', 'a半', '是', 10, 'true', 'true');

-- ----------------------------
-- Table structure for result_user
-- ----------------------------
DROP TABLE IF EXISTS `result_user`;
CREATE TABLE `result_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `class` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `administrator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of result_user
-- ----------------------------
INSERT INTO `result_user` VALUES (1, '22215150513', '小明', '20商务英语3班', '76d80224611fc919a5d54f0ff9fba446', 'false');
INSERT INTO `result_user` VALUES (2, '22215150514', '小白', '22软工5班', '76d80224611fc919a5d54f0ff9fba446', 'true');
INSERT INTO `result_user` VALUES (3, '22215150515', '小王', '22大数据1班', '7815696ecbf1c96e6894b779456d330e', 'false');
INSERT INTO `result_user` VALUES (5, '22215150516', '小飞', '21网络工程2班', '5fa72358f0b4fb4f2c5d7de8c9a41846', 'false');

SET FOREIGN_KEY_CHECKS = 1;
