SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for `d_admin`
-- ----------------------------
DROP TABLE IF EXISTS `d_admin`;
CREATE TABLE `d_admin`
(
    `a_id`       int(11)     NOT NULL AUTO_INCREMENT,
    `a_username` varchar(10) NOT NULL,
    `a_password` varchar(40) NOT NULL,
    `a_name`     varchar(10) NOT NULL,
    `a_phone`    bigint(20)  NOT NULL,
    `a_power`    int(11)     NOT NULL,
    `a_describe` varchar(10) DEFAULT NULL,
    PRIMARY KEY (`a_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 13
  DEFAULT CHARSET = utf8mb4;

-- ----------------------------
-- Records of d_admin
-- ----------------------------
INSERT INTO `d_admin`
VALUES ('1', 'zx', '202CB962AC59075B964B07152D234B70', '张鑫', '13813813813', '1', '高');
INSERT INTO `d_admin`
VALUES ('2', 'zj', '202CB962AC59075B964B07152D234B70', '张杰', '13813813813', '2', '低');
INSERT INTO `d_admin`
VALUES ('3', 'zh', '202CB962AC59075B964B07152D234B70', '张欢', '13813813813', '1', '高');
INSERT INTO `d_admin`
VALUES ('4', 'zk', '202CB962AC59075B964B07152D234B70', '赵凯', '13813813813', '2', '低');
INSERT INTO `d_admin`
VALUES ('5', 'ywj', '202CB962AC59075B964B07152D234B70', '杨雯雯', '13813813813', '1', '高');
INSERT INTO `d_admin`
VALUES ('6', 'wh', '202CB962AC59075B964B07152D234B70', '王皓', '13813813813', '1', '高');
INSERT INTO `d_admin`
VALUES ('7', 'zw', '202CB962AC59075B964B07152D234B70', '张伟', '13813813813', '2', '低');
INSERT INTO `d_admin`
VALUES ('8', 'zs', '202CB962AC59075B964B07152D234B70', '张硕', '13813813813', '2', '低');
INSERT INTO `d_admin`
VALUES ('9', 'wf', '202CB962AC59075B964B07152D234B70', '王凡', '13813813813', '1', '高');
INSERT INTO `d_admin`
VALUES ('10', 'zn', '202CB962AC59075B964B07152D234B70', '张娜', '13813813813', '1', '高');
INSERT INTO `d_admin`
VALUES ('11', 'jzh', '202CB962AC59075B964B07152D234B70', '蒋子华', '13813813813', '2', '低');
INSERT INTO `d_admin`
VALUES ('12', 'xl', '202CB962AC59075B964B07152D234B70', '薛磊', '13813813813', '2', '低');

-- ----------------------------
-- Table structure for `d_class`
-- ----------------------------
DROP TABLE IF EXISTS `d_class`;
CREATE TABLE `d_class`
(
    `c_id`         int(11) NOT NULL AUTO_INCREMENT,
    `c_classid`    int(11) NOT NULL,
    `c_classname`  varchar(10) DEFAULT NULL,
    `c_counsellor` varchar(10) DEFAULT NULL,
    PRIMARY KEY (`c_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 11
  DEFAULT CHARSET = utf8mb4;

-- ----------------------------
-- Records of d_class
-- ----------------------------
INSERT INTO `d_class`
VALUES ('1', '141', '生物', '徐超');
INSERT INTO `d_class`
VALUES ('2', '151', '应化', '刘晨');
INSERT INTO `d_class`
VALUES ('3', '142', '土木', '孙玲');
INSERT INTO `d_class`
VALUES ('4', '161', '物流', '刘阳');
INSERT INTO `d_class`
VALUES ('5', '153', '数师', '张宇');
INSERT INTO `d_class`
VALUES ('6', '162', '物流', '刘阳');
INSERT INTO `d_class`
VALUES ('7', '171', '自动化', '周涵涵');
INSERT INTO `d_class`
VALUES ('8', '154', '土木', '孙玲');
INSERT INTO `d_class`
VALUES ('9', '151', '纺织', '赵凯');
INSERT INTO `d_class`
VALUES ('10', '153', '金融', '刘培');

-- ----------------------------
-- Table structure for `d_dormgrade`
-- ----------------------------
DROP TABLE IF EXISTS `d_dormgrade`;
CREATE TABLE `d_dormgrade`
(
    `g_id`           int(11)     NOT NULL AUTO_INCREMENT,
    `d_dormitoryid`  int(11)     NOT NULL,
    `d_dormbuilding` varchar(10) NOT NULL,
    `d_grade`        int(11)     NOT NULL,
    `create_time`    datetime    NOT NULL,
    `update_time`    datetime    NOT NULL,
    PRIMARY KEY (`g_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 8
  DEFAULT CHARSET = utf8mb4;

-- ----------------------------
-- Records of d_dormgrade
-- ----------------------------
INSERT INTO `d_dormgrade`
VALUES ('1', '301', '24号楼', '6', '2019-04-25 10:51:17', '2019-05-12 17:28:38');
INSERT INTO `d_dormgrade`
VALUES ('2', '302', '24号楼', '7', '2019-05-01 16:36:47', '2019-05-01 16:36:55');
INSERT INTO `d_dormgrade`
VALUES ('3', '322', '24号楼', '8', '2019-05-04 16:37:42', '2019-05-04 16:37:47');
INSERT INTO `d_dormgrade`
VALUES ('4', '602', '23号楼', '7', '2019-05-08 16:38:25', '2019-05-08 16:38:30');
INSERT INTO `d_dormgrade`
VALUES ('5', '112', '22号楼', '7', '2019-05-12 16:38:53', '2019-05-12 16:39:00');
INSERT INTO `d_dormgrade`
VALUES ('6', '222', '27号楼', '9', '2019-05-09 16:39:37', '2019-05-09 16:39:41');
INSERT INTO `d_dormgrade`
VALUES ('7', '213', '27号楼', '8', '2019-05-10 16:40:02', '2019-05-10 16:40:08');

-- ----------------------------
-- Table structure for `d_dormitoryinfo`
-- ----------------------------
DROP TABLE IF EXISTS `d_dormitoryinfo`;
CREATE TABLE `d_dormitoryinfo`
(
    `d_id`           int(11)     NOT NULL AUTO_INCREMENT,
    `d_dormitoryid`  int(11)     NOT NULL,
    `d_dormbuilding` varchar(10) NOT NULL,
    `d_bedtotal`     int(11)     DEFAULT NULL,
    `d_bed`          int(11)     DEFAULT NULL,
    `a_name`         varchar(10) DEFAULT NULL,
    PRIMARY KEY (`d_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 15
  DEFAULT CHARSET = utf8mb4;

-- ----------------------------
-- Records of d_dormitoryinfo
-- ----------------------------
INSERT INTO `d_dormitoryinfo`
VALUES ('1', '311', '24号楼', '4', '3', '周凯');
INSERT INTO `d_dormitoryinfo`
VALUES ('2', '322', '24号楼', '4', '4', '周凯');
INSERT INTO `d_dormitoryinfo`
VALUES ('3', '601', '23号楼', '6', '6', '张杰');
INSERT INTO `d_dormitoryinfo`
VALUES ('4', '602', '23号楼', '6', '5', '张杰');
INSERT INTO `d_dormitoryinfo`
VALUES ('5', '111', '22号楼', '4', '4', '杨雯雯');
INSERT INTO `d_dormitoryinfo`
VALUES ('6', '112', '22号楼', '4', '3', '杨雯雯');
INSERT INTO `d_dormitoryinfo`
VALUES ('7', '222', '27号楼', '6', '6', '张伟');
INSERT INTO `d_dormitoryinfo`
VALUES ('8', '213', '27号楼', '4', '4', '张伟');
INSERT INTO `d_dormitoryinfo`
VALUES ('9', '312', '26号楼', '6', '6', '薛磊');
INSERT INTO `d_dormitoryinfo`
VALUES ('10', '313', '22号楼', '4', '4', '张磊');
INSERT INTO `d_dormitoryinfo`
VALUES ('11', '323', '22号楼', '6', '5', '张磊');
INSERT INTO `d_dormitoryinfo`
VALUES ('12', '301', '24号楼', '6', '6', '周凯');
INSERT INTO `d_dormitoryinfo`
VALUES ('13', '302', '24号楼', '6', '6', '周凯');
INSERT INTO `d_dormitoryinfo`
VALUES ('14', '423', '29号楼', '4', '3', '郭浩然');

-- ----------------------------
-- Table structure for `d_dormrepair`
-- ----------------------------
DROP TABLE IF EXISTS `d_dormrepair`;
CREATE TABLE `d_dormrepair`
(
    `r_id`           int(11)     NOT NULL AUTO_INCREMENT,
    `d_dormitoryid`  int(11)     NOT NULL,
    `d_dormbuilding` varchar(10) NOT NULL,
    `r_name`         varchar(10) DEFAULT NULL,
    `reason`         varchar(50) NOT NULL,
    `create_time`    datetime    NOT NULL,
    `update_time`    datetime    NOT NULL,
    PRIMARY KEY (`r_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 7
  DEFAULT CHARSET = utf8mb4;

-- ----------------------------
-- Records of d_dormrepair
-- ----------------------------
INSERT INTO `d_dormrepair`
VALUES ('1', '301', '24号楼', '王涛', '水池', '2019-05-13 22:39:58', '2019-05-13 22:39:58');
INSERT INTO `d_dormrepair`
VALUES ('2', '322', '24号楼', '王涛', '灯管', '2019-05-11 16:29:20', '2019-05-14 16:29:35');
INSERT INTO `d_dormrepair`
VALUES ('3', '601', '23号楼', '冯军', '水龙头', '2019-05-15 16:31:14', '2019-05-14 16:31:20');
INSERT INTO `d_dormrepair`
VALUES ('4', '601', '23号楼', '冯军', '插孔', '2019-05-15 16:31:56', '2019-05-15 16:32:04');
INSERT INTO `d_dormrepair`
VALUES ('5', '213', '27号楼', '冯军', '排风扇', '2019-05-18 16:32:54', '2019-05-14 16:33:00');
INSERT INTO `d_dormrepair`
VALUES ('6', '312', '26号楼', '彭建国', '空调', '2019-05-20 16:33:56', '2019-05-20 16:34:01');

-- ----------------------------
-- Table structure for `d_stgrade`
-- ----------------------------
DROP TABLE IF EXISTS `d_stgrade`;
CREATE TABLE `d_stgrade`
(
    `g_id`        int(11)  NOT NULL AUTO_INCREMENT,
    `s_studentid` varchar(20) NOT NULL,
    `s_grade`     int(11)  NOT NULL,
    `create_time` datetime NOT NULL,
    `update_time` datetime NOT NULL,
    PRIMARY KEY (`g_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 11
  DEFAULT CHARSET = utf8mb4;

-- ----------------------------
-- Records of d_stgrade
-- ----------------------------
INSERT INTO `d_stgrade`
VALUES ('1', '1413032001', '6', '2019-04-26 09:56:51', '2019-04-26 11:02:13');
INSERT INTO `d_stgrade`
VALUES ('2', '1413032002', '7', '2019-05-01 17:00:05', '2019-05-01 17:00:13');
INSERT INTO `d_stgrade`
VALUES ('3', '1413032003', '6', '2019-05-06 17:00:54', '2019-05-06 17:01:01');
INSERT INTO `d_stgrade`
VALUES ('4', '1413032004', '7', '2019-05-16 17:01:33', '2019-05-16 17:02:15');
INSERT INTO `d_stgrade`
VALUES ('5', '1413032005', '7', '2019-05-10 17:03:03', '2019-05-10 17:03:09');
INSERT INTO `d_stgrade`
VALUES ('6', '1413032006', '8', '2019-05-14 17:03:53', '2019-05-14 17:03:56');
INSERT INTO `d_stgrade`
VALUES ('7', '1513112412', '9', '2019-05-08 17:05:04', '2019-05-08 17:05:07');
INSERT INTO `d_stgrade`
VALUES ('8', '1513112413', '9', '2019-05-17 17:05:34', '2019-05-17 17:05:39');
INSERT INTO `d_stgrade`
VALUES ('9', '1513122418', '8', '2019-05-15 17:06:28', '2019-05-15 17:06:35');
INSERT INTO `d_stgrade`
VALUES ('10', '1513122419', '8', '2019-05-15 17:07:09', '2019-05-15 17:07:13');

-- ----------------------------
-- Table structure for `d_student`
-- ----------------------------
DROP TABLE IF EXISTS `d_student`;
CREATE TABLE `d_student`
(
    `s_id`           int(11)     NOT NULL AUTO_INCREMENT,
    `s_studentid`    int(11)     NOT NULL,
    `s_name`         varchar(10) NOT NULL,
    `s_sex`          varchar(10) DEFAULT NULL,
    `s_phone`        bigint(20)  DEFAULT NULL,
    `s_classid`      int(11)     NOT NULL,
    `s_classname`    varchar(10) NOT NULL,
    `s_dormbuilding` varchar(10) NOT NULL,
    `s_dormitoryid`  int(11)     NOT NULL,
    `s_password`     varchar(40) DEFAULT '202CB962AC59075B964B07152D234B70',
    PRIMARY KEY (`s_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 14
  DEFAULT CHARSET = utf8mb4;

-- ----------------------------
-- Records of d_student
-- ----------------------------
INSERT INTO `d_student`
VALUES ('1', '1413032001', '张杰', '男', '13813813813', '141', '生物', '23号楼', '301',
        '202CB962AC59075B964B07152D234B70');
INSERT INTO `d_student`
VALUES ('2', '1413032002', '赵凯', '男', '13813813813', '141', '生物', '23号楼', '301',
        '202CB962AC59075B964B07152D234B70');
INSERT INTO `d_student`
VALUES ('3', '1413032003', '许文文', '男', '13813813813', '141', '生物', '23号楼', '301',
        '202CB962AC59075B964B07152D234B70');
INSERT INTO `d_student`
VALUES ('4', '1413032004', '王浩', '男', '13813813813', '141', '生物', '23号楼', '301',
        '202CB962AC59075B964B07152D234B70');
INSERT INTO `d_student`
VALUES ('5', '1413032005', '张伟', '男', '13813813813', '141', '土木', '24号楼', '301',
        '202CB962AC59075B964B07152D234B70');
INSERT INTO `d_student`
VALUES ('6', '1413032006', '郭顶', '男', '13813813813', '141', '土木', '24号楼', '301',
        '202CB962AC59075B964B07152D234B70');
INSERT INTO `d_student`
VALUES ('7', '1513112411', '曹原', '男', '13813813813', '151', '应化', '24号楼', '112',
        '202CB962AC59075B964B07152D234B70');
INSERT INTO `d_student`
VALUES ('8', '1513112412', '赵跃', '男', '13813813813', '151', '纺织', '24号楼', '112',
        '202CB962AC59075B964B07152D234B70');
INSERT INTO `d_student`
VALUES ('9', '1513112413', '孙畅', '男', '13813813813', '151', '纺织', '24号楼', '112',
        '202CB962AC59075B964B07152D234B70');
INSERT INTO `d_student`
VALUES ('10', '1513122417', '周帆', '男', '13813813813', '161', '物流', '24号楼', '213',
        '202CB962AC59075B964B07152D234B70');
INSERT INTO `d_student`
VALUES ('11', '1513122418', '田野', '男', '13813813813', '153', '数师', '24号楼', '213',
        '202CB962AC59075B964B07152D234B70');
INSERT INTO `d_student`
VALUES ('12', '1513122419', '张嘉佳', '男', '13813813813', '153', '金融', '24号楼', '213',
        '202CB962AC59075B964B07152D234B70');
INSERT INTO `d_student`
VALUES ('13', '1513122420', '陈昊', '男', '13813813813', '153', '金融', '24号楼', '213',
        '202CB962AC59075B964B07152D234B70');

-- ----------------------------
-- Table structure for `d_visitor`
-- ----------------------------
DROP TABLE IF EXISTS `d_visitor`;
CREATE TABLE `d_visitor`
(
    `v_id`           int(11)     NOT NULL AUTO_INCREMENT,
    `v_name`         varchar(10) NOT NULL,
    `v_phone`        bigint(20)  NOT NULL,
    `v_dormitoryid`  int(11)     NOT NULL,
    `v_dormbuilding` varchar(10) NOT NULL,
    `create_time`    datetime    NOT NULL,
    PRIMARY KEY (`v_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 10
  DEFAULT CHARSET = utf8mb4;

-- ----------------------------
-- Records of d_visitor
-- ----------------------------
INSERT INTO `d_visitor`
VALUES ('1', '郑杰', '13813813813', '301', '24号楼', '2019-05-14 13:26:13');
INSERT INTO `d_visitor`
VALUES ('2', '李博', '13813813813', '322', '24号楼', '2019-05-12 19:36:23');
INSERT INTO `d_visitor`
VALUES ('3', '张盈盈', '13813813813', '601', '23号楼', '2019-05-13 19:37:11');
INSERT INTO `d_visitor`
VALUES ('4', '王涛', '13813813813', '111', '22号楼', '2019-05-15 19:37:46');
INSERT INTO `d_visitor`
VALUES ('5', '胡浩', '13813813813', '222', '27号楼', '2019-05-16 19:38:27');
INSERT INTO `d_visitor`
VALUES ('6', '陈昊', '13813813813', '213', '27号楼', '2019-05-18 19:39:03');
INSERT INTO `d_visitor`
VALUES ('7', '刘军', '13813813813', '213', '27号楼', '2019-05-20 19:39:42');
INSERT INTO `d_visitor`
VALUES ('8', '黄智', '13813813813', '312', '26号楼', '2019-05-22 19:46:38');
INSERT INTO `d_visitor`
VALUES ('9', '郑杰', '13813813813', '311', '24号楼', '2019-05-16 16:59:06');
