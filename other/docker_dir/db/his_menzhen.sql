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

create database `his_menzhen` default character set utf8 collate utf8_general_ci;

USE his_menzhen;


SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `case_history`
-- ----------------------------
DROP TABLE IF EXISTS `case_history`;
CREATE TABLE `case_history` (
  `id` varchar(12) NOT NULL COMMENT '��������Ϊ����������201907080001',
  `p_name` varchar(32) DEFAULT NULL COMMENT '��������',
  `gender` char(1) DEFAULT NULL COMMENT '���ֵ�gender�������Ա�0��Ů 1���� 2��δ֪',
  `age` int(11) DEFAULT NULL COMMENT '��������',
  `birthday` datetime DEFAULT NULL COMMENT '��������',
  `identity_card` varchar(20) DEFAULT NULL COMMENT '���֤',
  `home_address` varchar(100) DEFAULT NULL COMMENT '��ͥסַ',
  `attend_time` date DEFAULT NULL COMMENT '��������',
  `depart_id` varchar(32) DEFAULT NULL COMMENT '�Һſ���id',
  `doctor_id` varchar(32) DEFAULT NULL COMMENT '����ҽ��id',
  `update_time` datetime DEFAULT NULL COMMENT '��������',
  `del_flag` char(1) DEFAULT '0' COMMENT '�߼�ɾ�����λ��0��normal 1��ɾ��',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='������';

-- ----------------------------
-- Records of case_history
-- ----------------------------

-- ----------------------------
-- Table structure for `charge_item_info`
-- ----------------------------
DROP TABLE IF EXISTS `charge_item_info`;
CREATE TABLE `charge_item_info` (
  `id` varchar(32) NOT NULL COMMENT '����id�����item_type��ҩƷ����������ҩƷ��Ϣ���������ͬ',
  `item_type` varchar(10) DEFAULT NULL COMMENT '��Ŀ���ͣ� general��һ�� ��drug��ҩ��registration���Һţ�check:��飬 cure�����Ƶ�',
  `item_name` varchar(32) DEFAULT NULL COMMENT '��Ŀ����',
  `join_id` varchar(32) DEFAULT NULL COMMENT '����ҵ���߼����id',
  `category` varchar(20) DEFAULT NULL COMMENT '���',
  `unit` varchar(10) DEFAULT NULL COMMENT '��λ���磺ƿ���У�����',
  `price` decimal(7,2) DEFAULT NULL COMMENT '��Ŀԭ��',
  `care_rate` double(7,2) DEFAULT NULL COMMENT 'ҽ���е�����',
  `update_time` datetime DEFAULT NULL COMMENT '��������',
  `del_flag` char(1) DEFAULT '0' COMMENT '�߼�ɾ�����λ��0��normal 1��ɾ��',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='������Ŀ��Ϣ������Һţ�ҩƷ��ҽ��һ������Ʒ�ȣ�';

-- ----------------------------
-- Records of charge_item_info
-- ----------------------------

-- ----------------------------
-- Table structure for `depart_info`
-- ----------------------------
DROP TABLE IF EXISTS `depart_info`;
CREATE TABLE `depart_info` (
  `id` varchar(32) NOT NULL COMMENT '����id',
  `depart_name` varchar(32) DEFAULT NULL COMMENT '���һ�������',
  `depart_type` varchar(10) DEFAULT NULL COMMENT '�������ͣ�medical��ҽ��\r\n               administration������\r\n���ֵ��ֶ� depart_type��\r\n',
  `depart_level` char(1) DEFAULT '1' COMMENT '���ֵ�depart_level�����Ҽ���1,2,3 ����',
  `pid` varchar(32) DEFAULT NULL COMMENT '�����Ż��߿��ҵ�id',
  `update_time` datetime DEFAULT NULL COMMENT '��������',
  `del_flag` char(1) DEFAULT '0' COMMENT '�߼�ɾ�����λ��0��normal 1��ɾ��',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='������Ϣ';

-- ----------------------------
-- Records of depart_info
-- ----------------------------
INSERT INTO `depart_info` VALUES ('086f698d4e6d46e5bacbd29e6a374ca6', '���Ǻ��', 'medical', '1', null, '2019-07-16 19:48:08', '1');
INSERT INTO `depart_info` VALUES ('1', '���¿�', 'admin', '3', null, '2019-07-11 02:11:27', '0');
INSERT INTO `depart_info` VALUES ('1c97c12df2d1472cbac66342207cb906', '�����ڿ�', 'medical', '1', null, '2019-07-17 10:40:10', '0');
INSERT INTO `depart_info` VALUES ('2', '������', 'medical', '1', null, '2019-07-11 02:11:38', '0');
INSERT INTO `depart_info` VALUES ('3', 'ҩ��', 'medical', '1', null, '2019-07-11 02:11:42', '0');
INSERT INTO `depart_info` VALUES ('4', '�ڿ�', 'medical', '1', null, '2019-07-11 02:11:43', '0');
INSERT INTO `depart_info` VALUES ('5', '�س���', 'medical', '2', null, '2019-07-17 10:08:01', '0');
INSERT INTO `depart_info` VALUES ('6', '�����', 'admin', '3', null, '2019-07-11 02:11:45', '0');
INSERT INTO `depart_info` VALUES ('f3ece718e2244acb9aba8a867e9893a6', '�ǿ�', 'medical', '3', null, '2019-07-16 15:27:24', '1');

-- ----------------------------
-- Table structure for `drug_info`
-- ----------------------------
DROP TABLE IF EXISTS `drug_info`;
CREATE TABLE `drug_info` (
  `id` varchar(32) NOT NULL COMMENT '����id����Ӧ�����շ���Ŀ������һ��һһ��Ӧ���շ���Ŀ',
  `drug_name` varchar(32) DEFAULT NULL COMMENT 'ҩƷ����',
  `composition` varchar(255) DEFAULT NULL COMMENT '�ɷ�',
  `category` varchar(20) DEFAULT NULL COMMENT '���',
  `unit` varchar(10) DEFAULT NULL COMMENT '���۵�λ������У��飬�壬ƿ��',
  `p_unit` varchar(10) DEFAULT NULL COMMENT '����������λ��ml ��g�� mg��',
  `approval_no` varchar(12) DEFAULT NULL COMMENT 'ҩƷ׼�ֺ�',
  `update_time` datetime DEFAULT NULL COMMENT '��������',
  `del_flag` char(1) DEFAULT '0' COMMENT '�߼�ɾ�����λ��0��normal 1��ɾ��',
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
  `id` varchar(32) NOT NULL COMMENT '����id',
  `drug_depart_id` varchar(32) DEFAULT NULL COMMENT 'ҩ��id������depart_info',
  `send_time` datetime DEFAULT NULL COMMENT '��������',
  `operator_id` varchar(32) DEFAULT NULL COMMENT '������id',
  `status` char(1) DEFAULT NULL COMMENT '���ֵ�send_drug_status������״̬:0:δ���ͣ������Ѻ�����ϵͳֱ��������Ϣ��ҩ�����ɷ�ҩ������1���ѷ���',
  `pres_id` varchar(32) DEFAULT NULL COMMENT '����id',
  `update_time` datetime DEFAULT NULL COMMENT '��������',
  `del_flag` char(1) DEFAULT '0' COMMENT '�߼�ɾ�����λ��0��normal 1��ɾ��',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��ҩ��Ϣ��';

-- ----------------------------
-- Records of drug_send_info
-- ----------------------------

-- ----------------------------
-- Table structure for `employee_info`
-- ----------------------------
DROP TABLE IF EXISTS `employee_info`;
CREATE TABLE `employee_info` (
  `id` varchar(32) NOT NULL COMMENT '����id',
  `e_name` varchar(32) DEFAULT NULL COMMENT '��Ա����',
  `phone` varchar(20) DEFAULT NULL COMMENT '�绰����',
  `gender` char(1) DEFAULT NULL COMMENT '�Ա�',
  `age` int(11) DEFAULT NULL COMMENT '����',
  `emp_type` char(1) DEFAULT NULL COMMENT '���ֵ�emp_type��Ա�����ͣ�0��ҽ�� 1����ʿ 2������ 3��Ժ��',
  `update_time` datetime DEFAULT NULL COMMENT '��������',
  `del_flag` char(1) DEFAULT '0' COMMENT '�߼�ɾ�����λ��0��normal 1��ɾ��',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��Ա��Ϣ��';

-- ----------------------------
-- Records of employee_info
-- ----------------------------
INSERT INTO `employee_info` VALUES ('1', '������', '1388888888', '��', '21', '1', '2019-07-12 07:53:27', '0');
INSERT INTO `employee_info` VALUES ('2', '���ෲ', '1399999999', '1', '29', '1', '2019-07-12 07:54:08', '0');

-- ----------------------------
-- Table structure for `prescription_detail`
-- ----------------------------
DROP TABLE IF EXISTS `prescription_detail`;
CREATE TABLE `prescription_detail` (
  `id` varchar(32) NOT NULL COMMENT '����id',
  `p_id` varchar(32) DEFAULT NULL COMMENT '����id',
  `item_id` varchar(21) DEFAULT NULL COMMENT 'ҩƷ��������Ŀid\r\n',
  `advice` varchar(100) DEFAULT NULL COMMENT '��ҩ����',
  `p_usage` varchar(10) DEFAULT NULL COMMENT '�����÷�(�ֵ�prescription_usage):0:�ڷ� 1��Ƥ��ע�� 2��Ƥ�� 3������ע��  4������ע��',
  `dosage` double(10,2) DEFAULT NULL COMMENT '����',
  `frequency` char(1) DEFAULT NULL COMMENT '���ֵ� frequency��Ƶ�ʣ�1��һ��һ�� 2��һ����� 3��һ������ 4 һ���Ĵ�',
  `day_count` int(11) DEFAULT NULL COMMENT '��ҩ����',
  `item_count` int(11) DEFAULT NULL COMMENT '������������',
  `detail_type` char(1) DEFAULT NULL COMMENT '(�ֵ�detail_type)��ϸ���ͣ�0������ 1����ҩ�����Ϊ��ҩ״̬��֤��������¼�������ҩ����δ����˷ѣ���ʱ�������е��ܼ۵���Ϣ��δ���£���ϸ���е���ϢҲδ���£�����˷��ˣ�ֱ��ɾ��������¼��',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='������ϸ��';

-- ----------------------------
-- Records of prescription_detail
-- ----------------------------

-- ----------------------------
-- Table structure for `prescription_info`
-- ----------------------------
DROP TABLE IF EXISTS `prescription_info`;
CREATE TABLE `prescription_info` (
  `id` varchar(32) NOT NULL COMMENT '����id',
  `doctor_id` varchar(32) DEFAULT NULL COMMENT '���ߴ���ҽ��id',
  `p_type` varchar(10) DEFAULT ':0' COMMENT '�������ͣ�0�����ﴦ��:1�����ﴦ��:2�������������������ֵ�prescription_type��',
  `total_charge` double(7,2) DEFAULT NULL COMMENT '�ܼۣ�����ҽ��֧�����֣�������ҩƷԭʼ�۸�*����',
  `care_charge` double(7,2) DEFAULT NULL COMMENT 'ҽ���е�',
  `charge_time` datetime DEFAULT NULL COMMENT '����ʱ��',
  `operator_id` varchar(32) DEFAULT NULL COMMENT '��������ְԱid��Ĭ��Ϊ��¼����ϵͳ��',
  `receipt` double(7,2) DEFAULT NULL COMMENT 'ʵ���տ�����',
  `cash_change` double(7,2) DEFAULT NULL COMMENT '����',
  `receipt_type` char(1) DEFAULT NULL COMMENT '���ֵ�receipt_type���տʽ��1���ֽ� 2����ǿ�',
  `case_id` varchar(32) DEFAULT NULL COMMENT '��������id��һ�Զ��ϵ��һ�����������ж�δ���',
  `p_status` char(1) DEFAULT NULL COMMENT '���ֵ�prescription_status������״̬��0��������  1���ѷ��ʹ����� 2�����ۣ������ݴ棩, 3:�����ȡҩ 4��ȡҩ���״̬�������˷�״̬�� 5������ҩ  ',
  `update_time` datetime DEFAULT NULL COMMENT '��������',
  `del_flag` char(1) DEFAULT '0' COMMENT '�߼�ɾ�����λ��0��normal 1��ɾ��',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='������Ϣ��';

-- ----------------------------
-- Records of prescription_info
-- ----------------------------

-- ----------------------------
-- Table structure for `registration_info`
-- ----------------------------
DROP TABLE IF EXISTS `registration_info`;
CREATE TABLE `registration_info` (
  `id` varchar(12) NOT NULL COMMENT '�Һ�Ʊ�ݺţ���Ʊ�ţ���Ϊ��������201808190001',
  `reg_level` char(1) DEFAULT '0' COMMENT '���ֵ䣺reg_level���Һż��� 0����ͨ 1:ר�� 2�߼�ר��',
  `settle_type` varchar(10) DEFAULT NULL COMMENT '(�ֵ䣺settle_type)��������:0:�Է�  1��ҽ��',
  `case_id` varchar(12) DEFAULT NULL COMMENT '��������id',
  `charge_status` char(1) DEFAULT NULL COMMENT '(�ֵ�charge_status)�Һ�״̬��0��δ���� 1���Ѹ��� 2���˷�',
  `update_time` datetime DEFAULT NULL COMMENT '��������',
  `del_flag` char(1) DEFAULT '0' COMMENT '�߼�ɾ�����λ��0��normal 1��ɾ��',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�Һ���Ϣ���벡��һ�Զ��ϵ�����µ�һ��Ϊ��Ч';

-- ----------------------------
-- Records of registration_info
-- ----------------------------

-- ----------------------------
-- Table structure for `regist_detail`
-- ----------------------------
DROP TABLE IF EXISTS `regist_detail`;
CREATE TABLE `regist_detail` (
  `reg_id` varchar(12) NOT NULL COMMENT '�Һ�id',
  `item_id` varchar(32) NOT NULL COMMENT '�շ���Ŀid',
  `item_count` int(11) DEFAULT NULL COMMENT '�շ���Ŀ����',
  `detail_type` char(1) DEFAULT NULL COMMENT '���ֵ�detail_type����ϸ���ͣ�0:���� 1���˷�',
  PRIMARY KEY (`reg_id`,`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�Һ��շ���ϸ';

-- ----------------------------
-- Records of regist_detail
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_dict`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` varchar(32) NOT NULL COMMENT '����',
  `dict_type` varchar(32) DEFAULT NULL COMMENT '�ֵ�����',
  `keyword` varchar(32) DEFAULT NULL COMMENT '��',
  `val` varchar(32) DEFAULT NULL COMMENT 'ֵ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�ֵ��';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('1', 'depart_type', 'medical', 'ҽ��');
INSERT INTO `sys_dict` VALUES ('2', 'depart_type', 'admin', '����');
INSERT INTO `sys_dict` VALUES ('3', 'depart_level', '1', 'һ��');
INSERT INTO `sys_dict` VALUES ('4', 'depart_level', '2', '����');
INSERT INTO `sys_dict` VALUES ('5', 'depart_level', '3', '����');
INSERT INTO `sys_dict` VALUES ('6', 'gender', '0', 'Ů');
INSERT INTO `sys_dict` VALUES ('7', 'gender', '1', '��');
INSERT INTO `sys_dict` VALUES ('8', 'gender', '2', 'δ֪');
INSERT INTO `sys_dict` VALUES ('9', 'gender', '3', '˫��');

-- ----------------------------
-- Table structure for `user_info`
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `id` varchar(32) NOT NULL COMMENT '����id',
  `emp_id` varchar(32) DEFAULT NULL COMMENT 'Ա��id',
  `username` varchar(32) DEFAULT NULL COMMENT '�û���',
  `password` varchar(64) DEFAULT NULL COMMENT '����',
  `update_time` datetime DEFAULT NULL COMMENT '��������',
  `del_flag` char(1) DEFAULT '0' COMMENT '�߼�ɾ�����λ��0��normal 1��ɾ��',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��ǰģ���û���Ϣ��';

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('1', '1', 'cxk', '1234', '2019-07-12 07:55:27', '0');
INSERT INTO `user_info` VALUES ('2', '2', 'kris', '1234', '2019-07-12 07:55:28', '0');
