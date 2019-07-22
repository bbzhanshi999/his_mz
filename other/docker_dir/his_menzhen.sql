/*
Navicat MySQL Data Transfer

Source Server         : mytestdb
Source Server Version : 50562
Source Host           : localhost:3306
Source Database       : his_menzhen

Target Server Type    : MYSQL
Target Server Version : 50562
File Encoding         : 65001

Date: 2019-07-22 09:30:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `case_history`
-- ----------------------------
DROP TABLE IF EXISTS `case_history`;
CREATE TABLE `case_history` (
  `id` varchar(12) NOT NULL COMMENT '病历号作为主键：例如201907080001',
  `p_name` varchar(32) DEFAULT NULL COMMENT '病人姓名',
  `gender` char(1) DEFAULT NULL COMMENT '（字典gender）患者性别：0：女 1：男 2：未知',
  `age` int(11) DEFAULT NULL COMMENT '患者年龄',
  `birthday` datetime DEFAULT NULL COMMENT '出生日期',
  `identity_card` varchar(20) DEFAULT NULL COMMENT '身份证',
  `home_address` varchar(100) DEFAULT NULL COMMENT '家庭住址',
  `attend_time` date DEFAULT NULL COMMENT '就诊日期',
  `depart_id` varchar(32) DEFAULT NULL COMMENT '挂号科室id',
  `doctor_id` varchar(32) DEFAULT NULL COMMENT '看诊医生id',
  `update_time` datetime DEFAULT NULL COMMENT '更新日期',
  `del_flag` char(1) DEFAULT '0' COMMENT '逻辑删除标记位：0：normal 1：删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='病历表';

-- ----------------------------
-- Records of case_history
-- ----------------------------

-- ----------------------------
-- Table structure for `charge_item_info`
-- ----------------------------
DROP TABLE IF EXISTS `charge_item_info`;
CREATE TABLE `charge_item_info` (
  `id` varchar(32) NOT NULL COMMENT '主键id，如果item_type是药品，该主键与药品信息表的主键相同',
  `item_type` varchar(10) DEFAULT NULL COMMENT '项目类型： general：一般 ，drug：药，registration：挂号，check:检查， cure：诊疗等',
  `item_name` varchar(32) DEFAULT NULL COMMENT '项目名称',
  `join_id` varchar(32) DEFAULT NULL COMMENT '关联业务逻辑表的id',
  `category` varchar(20) DEFAULT NULL COMMENT '规格',
  `unit` varchar(10) DEFAULT NULL COMMENT '单位，如：瓶，盒，根等',
  `price` decimal(7,2) DEFAULT NULL COMMENT '项目原价',
  `care_rate` double(7,2) DEFAULT NULL COMMENT '医保承担比例',
  `update_time` datetime DEFAULT NULL COMMENT '更新日期',
  `del_flag` char(1) DEFAULT '0' COMMENT '逻辑删除标记位：0：normal 1：删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='结算项目信息表（例如挂号，药品，医用一次性用品等）';

-- ----------------------------
-- Records of charge_item_info
-- ----------------------------

-- ----------------------------
-- Table structure for `depart_info`
-- ----------------------------
DROP TABLE IF EXISTS `depart_info`;
CREATE TABLE `depart_info` (
  `id` varchar(32) NOT NULL COMMENT '主键id',
  `depart_name` varchar(32) DEFAULT NULL COMMENT '科室或部门名称',
  `depart_type` varchar(10) DEFAULT NULL COMMENT '科室类型：medical：医疗\r\n               administration：行政\r\n（字典字段 depart_type）\r\n',
  `depart_level` char(1) DEFAULT '1' COMMENT '（字典depart_level）科室级别：1,2,3 三类',
  `pid` varchar(32) DEFAULT NULL COMMENT '父部门或者科室的id',
  `update_time` datetime DEFAULT NULL COMMENT '更新日期',
  `del_flag` char(1) DEFAULT '0' COMMENT '逻辑删除标记位：0：normal 1：删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='部门信息';

-- ----------------------------
-- Records of depart_info
-- ----------------------------
INSERT INTO `depart_info` VALUES ('086f698d4e6d46e5bacbd29e6a374ca6', '耳鼻喉科', 'medical', '1', null, '2019-07-16 19:48:08', '1');
INSERT INTO `depart_info` VALUES ('1', '人事科', 'admin', '3', null, '2019-07-11 02:11:27', '0');
INSERT INTO `depart_info` VALUES ('1c97c12df2d1472cbac66342207cb906', '消化内科', 'medical', '1', null, '2019-07-17 10:40:10', '0');
INSERT INTO `depart_info` VALUES ('2', '妇产科', 'medical', '1', null, '2019-07-11 02:11:38', '0');
INSERT INTO `depart_info` VALUES ('3', '药房', 'medical', '1', null, '2019-07-11 02:11:42', '0');
INSERT INTO `depart_info` VALUES ('4', '内科', 'medical', '1', null, '2019-07-11 02:11:43', '0');
INSERT INTO `depart_info` VALUES ('5', '肛肠科', 'medical', '2', null, '2019-07-17 10:08:01', '0');
INSERT INTO `depart_info` VALUES ('6', '财务科', 'admin', '3', null, '2019-07-11 02:11:45', '0');
INSERT INTO `depart_info` VALUES ('f3ece718e2244acb9aba8a867e9893a6', '骨科', 'medical', '3', null, '2019-07-16 15:27:24', '1');

-- ----------------------------
-- Table structure for `drug_info`
-- ----------------------------
DROP TABLE IF EXISTS `drug_info`;
CREATE TABLE `drug_info` (
  `id` varchar(32) NOT NULL COMMENT '主键id，对应会在收费项目中增加一条一一对应的收费项目',
  `drug_name` varchar(32) DEFAULT NULL COMMENT '药品名称',
  `composition` varchar(255) DEFAULT NULL COMMENT '成份',
  `category` varchar(20) DEFAULT NULL COMMENT '规格',
  `unit` varchar(10) DEFAULT NULL COMMENT '出售单位：比如盒，块，板，瓶等',
  `p_unit` varchar(10) DEFAULT NULL COMMENT '处方剂量单位：ml ，g， mg等',
  `approval_no` varchar(12) DEFAULT NULL COMMENT '药品准字号',
  `update_time` datetime DEFAULT NULL COMMENT '更新日期',
  `del_flag` char(1) DEFAULT '0' COMMENT '逻辑删除标记位：0：normal 1：删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of drug_info
-- ----------------------------

-- ----------------------------
-- Table structure for `drug_send_info`
-- ----------------------------
DROP TABLE IF EXISTS `drug_send_info`;
CREATE TABLE `drug_send_info` (
  `id` varchar(32) NOT NULL COMMENT '主键id',
  `drug_depart_id` varchar(32) DEFAULT NULL COMMENT '药房id，关联depart_info',
  `send_time` datetime DEFAULT NULL COMMENT '发送日期',
  `operator_id` varchar(32) DEFAULT NULL COMMENT '操作者id',
  `status` char(1) DEFAULT NULL COMMENT '（字典send_drug_status）发送状态:0:未发送（当付费后，门诊系统直接推送信息到药房生成发药单），1：已发送',
  `pres_id` varchar(32) DEFAULT NULL COMMENT '处方id',
  `update_time` datetime DEFAULT NULL COMMENT '更新日期',
  `del_flag` char(1) DEFAULT '0' COMMENT '逻辑删除标记位：0：normal 1：删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='发药信息表';

-- ----------------------------
-- Records of drug_send_info
-- ----------------------------

-- ----------------------------
-- Table structure for `employee_info`
-- ----------------------------
DROP TABLE IF EXISTS `employee_info`;
CREATE TABLE `employee_info` (
  `id` varchar(32) NOT NULL COMMENT '主键id',
  `e_name` varchar(32) DEFAULT NULL COMMENT '雇员姓名',
  `phone` varchar(20) DEFAULT NULL COMMENT '电话号码',
  `gender` char(1) DEFAULT NULL COMMENT '性别',
  `age` int(11) DEFAULT NULL COMMENT '年龄',
  `emp_type` char(1) DEFAULT NULL COMMENT '（字典emp_type）员工类型：0：医生 1：护士 2：行政 3：院工',
  `update_time` datetime DEFAULT NULL COMMENT '更新日期',
  `del_flag` char(1) DEFAULT '0' COMMENT '逻辑删除标记位：0：normal 1：删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='雇员信息表';

-- ----------------------------
-- Records of employee_info
-- ----------------------------
INSERT INTO `employee_info` VALUES ('1', '蔡徐坤', '1388888888', '男', '21', '1', '2019-07-12 07:53:27', '0');
INSERT INTO `employee_info` VALUES ('2', '吴亦凡', '1399999999', '男', '29', '1', '2019-07-12 07:54:08', '0');

-- ----------------------------
-- Table structure for `prescription_detail`
-- ----------------------------
DROP TABLE IF EXISTS `prescription_detail`;
CREATE TABLE `prescription_detail` (
  `id` varchar(32) NOT NULL COMMENT '主键id',
  `p_id` varchar(32) DEFAULT NULL COMMENT '处方id',
  `item_id` varchar(21) DEFAULT NULL COMMENT '药品或其他项目id\r\n',
  `advice` varchar(100) DEFAULT NULL COMMENT '用药嘱托',
  `p_usage` varchar(10) DEFAULT NULL COMMENT '处方用法(字典prescription_usage):0:口服 1：皮下注射 2：皮试 3：静脉注射  4：肌肉注射',
  `dosage` double(10,2) DEFAULT NULL COMMENT '用量',
  `frequency` char(1) DEFAULT NULL COMMENT '（字典 frequency）频率：1：一天一次 2：一天二次 3：一天三次 4 一天四次',
  `day_count` int(11) DEFAULT NULL COMMENT '服药天数',
  `item_count` int(11) DEFAULT NULL COMMENT '处方开具数量',
  `detail_type` char(1) DEFAULT NULL COMMENT '(字典detail_type)明细类型：0：正常 1：退药（如果为退药状态，证明本条记录已完成退药，单未完成退费，此时处方表中的总价等信息还未更新，明细表中的信息也未更新，如果退费了，直接删除该条记录）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='处方明细单';

-- ----------------------------
-- Records of prescription_detail
-- ----------------------------

-- ----------------------------
-- Table structure for `prescription_info`
-- ----------------------------
DROP TABLE IF EXISTS `prescription_info`;
CREATE TABLE `prescription_info` (
  `id` varchar(32) NOT NULL COMMENT '处方id',
  `doctor_id` varchar(32) DEFAULT NULL COMMENT '开具处方医生id',
  `p_type` varchar(10) DEFAULT ':0' COMMENT '处方类型：0：门诊处方:1：急诊处方:2：病房处方（保存在字典prescription_type）',
  `total_charge` double(7,2) DEFAULT NULL COMMENT '总价（包括医保支付部分）：等于药品原始价格*数量',
  `care_charge` double(7,2) DEFAULT NULL COMMENT '医保承担',
  `charge_time` datetime DEFAULT NULL COMMENT '付款时间',
  `operator_id` varchar(32) DEFAULT NULL COMMENT '操作付款职员id，默认为登录门诊系统者',
  `receipt` double(7,2) DEFAULT NULL COMMENT '实际收款数量',
  `cash_change` double(7,2) DEFAULT NULL COMMENT '找零',
  `receipt_type` char(1) DEFAULT NULL COMMENT '（字典receipt_type）收款方式：1：现金 2：借记卡',
  `case_id` varchar(32) DEFAULT NULL COMMENT '关联病历id：一对多关系，一个病历可以有多次处方',
  `p_status` char(1) DEFAULT NULL COMMENT '（字典prescription_status）处方状态：0：待发送  1：已发送待划价 2：划价（类似暂存）, 3:付款待取药 4：取药完成状态（或已退费状态） 5：已退药  ',
  `update_time` datetime DEFAULT NULL COMMENT '更新日期',
  `del_flag` char(1) DEFAULT '0' COMMENT '逻辑删除标记位：0：normal 1：删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='处方信息表';

-- ----------------------------
-- Records of prescription_info
-- ----------------------------

-- ----------------------------
-- Table structure for `registration_info`
-- ----------------------------
DROP TABLE IF EXISTS `registration_info`;
CREATE TABLE `registration_info` (
  `id` varchar(12) NOT NULL COMMENT '挂号票据号（或发票号）作为主键：如201808190001',
  `reg_level` char(1) DEFAULT '0' COMMENT '（字典：reg_level）挂号级别： 0：普通 1:专家 2高级专家',
  `settle_type` varchar(10) DEFAULT NULL COMMENT '(字典：settle_type)结算类型:0:自费  1：医保',
  `case_id` varchar(12) DEFAULT NULL COMMENT '关联病历id',
  `charge_status` char(1) DEFAULT NULL COMMENT '(字典charge_status)挂号状态：0：未付款 1：已付款 2：退费',
  `update_time` datetime DEFAULT NULL COMMENT '更新日期',
  `del_flag` char(1) DEFAULT '0' COMMENT '逻辑删除标记位：0：normal 1：删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='挂号信息表：与病历一对多关系，最新的一条为有效';

-- ----------------------------
-- Records of registration_info
-- ----------------------------

-- ----------------------------
-- Table structure for `regist_detail`
-- ----------------------------
DROP TABLE IF EXISTS `regist_detail`;
CREATE TABLE `regist_detail` (
  `reg_id` varchar(12) NOT NULL COMMENT '挂号id',
  `item_id` varchar(32) NOT NULL COMMENT '收费项目id',
  `item_count` int(11) DEFAULT NULL COMMENT '收费项目数量',
  `detail_type` char(1) DEFAULT NULL COMMENT '（字典detail_type）明细类型：0:正常 1：退费',
  PRIMARY KEY (`reg_id`,`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='挂号收费明细';

-- ----------------------------
-- Records of regist_detail
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_dict`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `dict_type` varchar(32) DEFAULT NULL COMMENT '字典种类',
  `keyword` varchar(32) DEFAULT NULL COMMENT '键',
  `val` varchar(32) DEFAULT NULL COMMENT '值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典表';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('1', 'depart_type', 'medical', '医疗');
INSERT INTO `sys_dict` VALUES ('2', 'depart_type', 'admin', '行政');
INSERT INTO `sys_dict` VALUES ('3', 'depart_level', '1', '一级');
INSERT INTO `sys_dict` VALUES ('4', 'depart_level', '2', '二级');
INSERT INTO `sys_dict` VALUES ('5', 'depart_level', '3', '三级');
INSERT INTO `sys_dict` VALUES ('6', 'gender', '0', '女');
INSERT INTO `sys_dict` VALUES ('7', 'gender', '1', '男');
INSERT INTO `sys_dict` VALUES ('8', 'gender', '2', '未知');
INSERT INTO `sys_dict` VALUES ('9', 'gender', '3', '双性');

-- ----------------------------
-- Table structure for `user_info`
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `id` varchar(32) NOT NULL COMMENT '主键id',
  `emp_id` varchar(32) DEFAULT NULL COMMENT '员工id',
  `username` varchar(32) DEFAULT NULL COMMENT '用户名',
  `password` varchar(64) DEFAULT NULL COMMENT '密码',
  `update_time` datetime DEFAULT NULL COMMENT '更新日期',
  `del_flag` char(1) DEFAULT '0' COMMENT '逻辑删除标记位：0：normal 1：删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='当前模块用户信息表';

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('1', '1', 'cxk', '1234', '2019-07-12 07:55:27', '0');
INSERT INTO `user_info` VALUES ('2', '2', 'kris', '1234', '2019-07-12 07:55:28', '0');
