/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50027
Source Host           : localhost:3306
Source Database       : exam_appro_sys

Target Server Type    : MYSQL
Target Server Version : 50027
File Encoding         : 65001

Date: 2015-10-15 09:26:04
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `flow_approval`
-- ----------------------------
DROP TABLE IF EXISTS `flow_approval`;
CREATE TABLE `flow_approval` (
  `id` int(11) NOT NULL auto_increment,
  `operator` varchar(50) NOT NULL,
  `operateTime` varchar(50) default NULL,
  `result` varchar(50) default '2' COMMENT '0:未通过;1:通过;2:未审核;',
  `description` varchar(500) default NULL,
  `orderId` varchar(50) default NULL,
  `taskKey` varchar(100) default NULL,
  PRIMARY KEY  (`id`),
  KEY `orderId` (`orderId`),
  KEY `taskKey` (`taskKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='各个任务审批结果表';

-- ----------------------------
-- Records of flow_approval
-- ----------------------------
INSERT INTO `flow_approval` VALUES ('46', '所在单位1', '2015-10-14 19:11:39', '1', null, 'b5db2195eb804bf69be9d97ae5e808ef', 'unit');
INSERT INTO `flow_approval` VALUES ('47', '国际处工作人员1', '2015-10-14 19:20:43', '0', null, 'b5db2195eb804bf69be9d97ae5e808ef', 'internalStaff');
INSERT INTO `flow_approval` VALUES ('48', '所在单位1', '2015-10-14 20:25:21', '1', null, 'fcdc3dcd32e345749e34d1f12bf7ca7f', 'unit');

-- ----------------------------
-- Table structure for `form_teacher_basic`
-- ----------------------------
DROP TABLE IF EXISTS `form_teacher_basic`;
CREATE TABLE `form_teacher_basic` (
  `id` int(11) NOT NULL auto_increment,
  `t_work_id` varchar(255) default NULL COMMENT '职工号',
  `t_b_name` varchar(30) default NULL COMMENT '姓名',
  `t_b_sex` char(2) default NULL COMMENT '性别',
  `t_b_birth_palce` varchar(255) default NULL COMMENT '出生地',
  `t_b_household_place` varchar(255) default NULL COMMENT '户口所在地',
  `t_b_political_status` varchar(255) default NULL COMMENT '政治面貌',
  `t_b_education_degree` varchar(255) default NULL COMMENT '文化程度',
  `t_b_nation` varchar(255) default NULL COMMENT '民族',
  `t_b_unit` varchar(255) default NULL COMMENT '所在单位',
  `t_b_professional_title` varchar(255) default NULL COMMENT '职称',
  `t_b_identification` varchar(255) default NULL COMMENT '身份证号',
  `t_b_tel` varchar(255) default NULL COMMENT '联系电话',
  `t_b_email` varchar(255) default NULL COMMENT '电子邮箱',
  `t_b_job` varchar(255) default NULL COMMENT '职务',
  `t_b_level` int(255) default NULL COMMENT '级别',
  `t_is_secret_staff` char(2) default NULL COMMENT '是否为涉密人员',
  `t_recent_abroad_time` date default NULL COMMENT '最近一次因公出国(境)时间',
  `t_recent_abroad_country_task` varchar(255) default NULL COMMENT '最近一次因公出国（境）所赴国家（地区）及任务',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='教师基本信息表';

-- ----------------------------
-- Records of form_teacher_basic
-- ----------------------------
INSERT INTO `form_teacher_basic` VALUES ('1', '1', '林晓宇', '男', '福建泉州', '福建泉州', '无', '研究生', '汉', '计算机与信息学院', '教授', '350521199211174538', '155', '403266439@qq.com', '解放军', '1', '1', '2015-10-28', '黑化肥发灰');

-- ----------------------------
-- Table structure for `form_teacher_family`
-- ----------------------------
DROP TABLE IF EXISTS `form_teacher_family`;
CREATE TABLE `form_teacher_family` (
  `id` int(11) NOT NULL auto_increment,
  `t_work_id` varchar(255) default NULL,
  `t_f_call` varchar(255) default NULL,
  `t_f_name` varchar(255) default NULL,
  `t_f_age` tinyint(3) default NULL,
  `t_f_political_status` varchar(255) default NULL,
  `t_f_unit` varchar(255) default NULL,
  `t_f_job` varchar(255) default NULL,
  `t_f_residence_place` varchar(255) default NULL,
  `t_f_foreign_residence` tinyint(1) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of form_teacher_family
-- ----------------------------

-- ----------------------------
-- Table structure for `form_visit_attachment`
-- ----------------------------
DROP TABLE IF EXISTS `form_visit_attachment`;
CREATE TABLE `form_visit_attachment` (
  `id` int(11) NOT NULL auto_increment,
  `order_id` varchar(32) default NULL,
  `a_invite_letter` varchar(255) default NULL,
  `a_invite_letter_translate` varchar(255) default NULL,
  `a_detail_route` varchar(255) default NULL,
  `a_detail_route_translate` varchar(255) default NULL,
  `a_identity_card_scan` varchar(255) default NULL,
  `a_paper_hire` varchar(255) default NULL,
  `a_paper_hire_translate` varchar(255) default NULL,
  `a_paper_summary` varchar(255) default NULL,
  `a_paper_summary_translate` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of form_visit_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for `form_visit_extra_instruction`
-- ----------------------------
DROP TABLE IF EXISTS `form_visit_extra_instruction`;
CREATE TABLE `form_visit_extra_instruction` (
  `id` int(11) NOT NULL auto_increment,
  `order_id` varchar(32) default NULL,
  `e_desciption` varchar(400) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of form_visit_extra_instruction
-- ----------------------------

-- ----------------------------
-- Table structure for `form_visit_financial_budget`
-- ----------------------------
DROP TABLE IF EXISTS `form_visit_financial_budget`;
CREATE TABLE `form_visit_financial_budget` (
  `id` int(11) NOT NULL auto_increment,
  `order_id` varchar(32) default NULL,
  `f_fund_manage_unit` varchar(255) default NULL,
  `f_fund_source_unit` varchar(255) default NULL,
  `f_international_travel_fee` double default NULL,
  `f_accommodation_fee` double default NULL,
  `f_meal_fee` double default NULL,
  `f_incidental_fee` double default NULL,
  `f_traffic_fee` double default NULL,
  `f_extra_fee` double default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of form_visit_financial_budget
-- ----------------------------

-- ----------------------------
-- Table structure for `form_visit_inviter`
-- ----------------------------
DROP TABLE IF EXISTS `form_visit_inviter`;
CREATE TABLE `form_visit_inviter` (
  `id` int(11) NOT NULL auto_increment,
  `order_id` varchar(32) default NULL,
  `i_name` varchar(255) default NULL,
  `i_english_name` varchar(255) default NULL,
  `i_unit` varchar(255) default NULL,
  `i_english_unit` varchar(255) default NULL,
  `i_address` varchar(255) default NULL,
  `i_tel` varchar(255) default NULL,
  `i_fax` varchar(255) default NULL,
  `i_email` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of form_visit_inviter
-- ----------------------------

-- ----------------------------
-- Table structure for `form_visit_task`
-- ----------------------------
DROP TABLE IF EXISTS `form_visit_task`;
CREATE TABLE `form_visit_task` (
  `id` int(11) NOT NULL auto_increment,
  `order_id` varchar(32) default NULL,
  `i_t_reason` varchar(255) default NULL,
  `i_t_target_necessity` varchar(255) default NULL,
  `i_t_type` varchar(255) default NULL,
  `i_t_leave_time` date default NULL,
  `i_t_arrive_time` date default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of form_visit_task
-- ----------------------------

-- ----------------------------
-- Table structure for `form_visit_task_route`
-- ----------------------------
DROP TABLE IF EXISTS `form_visit_task_route`;
CREATE TABLE `form_visit_task_route` (
  `id` int(11) NOT NULL auto_increment,
  `t_id` int(11) default NULL,
  `i_t_r_country` varchar(255) default NULL,
  `i_t_r_city` varchar(255) default NULL,
  `i_t_arrive_time` date default NULL,
  `i_t_leave_time` date default NULL,
  `i_t_remark` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  KEY `t_id` (`t_id`),
  CONSTRAINT `form_visit_task_route_ibfk_1` FOREIGN KEY (`t_id`) REFERENCES `form_visit_task` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of form_visit_task_route
-- ----------------------------

-- ----------------------------
-- Table structure for `relation_teacher_visit`
-- ----------------------------
DROP TABLE IF EXISTS `relation_teacher_visit`;
CREATE TABLE `relation_teacher_visit` (
  `id` int(11) NOT NULL auto_increment,
  `t_work_id` varchar(255) default NULL,
  `order_id` varchar(255) default NULL,
  `visit_summary` varchar(255) default NULL COMMENT '访出摘要',
  `result` varchar(255) default '2' COMMENT '批审结果(0:未通过;1:已通过;2:未审批',
  `visit_no` varchar(255) default NULL COMMENT '访出编号',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='教师任务业务表';

-- ----------------------------
-- Records of relation_teacher_visit
-- ----------------------------
INSERT INTO `relation_teacher_visit` VALUES ('43', '1', 'b5db2195eb804bf69be9d97ae5e808ef', '林晓宇赴美国访问学者', '2', '15-10-14-1');
INSERT INTO `relation_teacher_visit` VALUES ('44', '1', 'fcdc3dcd32e345749e34d1f12bf7ca7f', '林晓宇赴美国访问学者', '2', '15-10-14-2');

-- ----------------------------
-- Table structure for `sys_level`
-- ----------------------------
DROP TABLE IF EXISTS `sys_level`;
CREATE TABLE `sys_level` (
  `id` int(11) NOT NULL auto_increment,
  `l_no` int(11) default NULL COMMENT '别级编号，可以用来排序',
  `l_name` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_level
-- ----------------------------
INSERT INTO `sys_level` VALUES ('1', '1', '正厅级');
INSERT INTO `sys_level` VALUES ('2', '2', '副厅级');
INSERT INTO `sys_level` VALUES ('3', '3', '正处级');
INSERT INTO `sys_level` VALUES ('4', '4', '副处级');
INSERT INTO `sys_level` VALUES ('5', '5', '其他');

-- ----------------------------
-- Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int(11) NOT NULL auto_increment COMMENT '角色ID',
  `role_no` int(11) default NULL COMMENT '角色编号',
  `role_name` varchar(255) default NULL COMMENT '角色名称',
  `role_desciption` varchar(255) default NULL COMMENT '角色相关描述',
  PRIMARY KEY  (`id`),
  KEY `role_no` (`role_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '1', '申请人', '申请人角色或称普通教师角色');
INSERT INTO `sys_role` VALUES ('2', '2', '所在单位', '申请人所在单位角色');
INSERT INTO `sys_role` VALUES ('3', '3', '国际处工作人员', '');
INSERT INTO `sys_role` VALUES ('4', '4', '国际处长', null);
INSERT INTO `sys_role` VALUES ('5', '5', '财务部门', null);
INSERT INTO `sys_role` VALUES ('6', '6', '经费来源部门', null);
INSERT INTO `sys_role` VALUES ('7', '7', '纪监审部门', null);
INSERT INTO `sys_role` VALUES ('8', '8', '业务分管校领导', null);
INSERT INTO `sys_role` VALUES ('9', '9', '分管外事校领导', null);
INSERT INTO `sys_role` VALUES ('10', '10', '校党委书记', null);

-- ----------------------------
-- Table structure for `sys_unit`
-- ----------------------------
DROP TABLE IF EXISTS `sys_unit`;
CREATE TABLE `sys_unit` (
  `id` int(11) NOT NULL auto_increment,
  `unit_name` varchar(255) default NULL,
  `unit_manager_id` int(255) default NULL,
  PRIMARY KEY  (`id`),
  KEY `unit_manager_id` (`unit_manager_id`),
  CONSTRAINT `sys_unit_ibfk_1` FOREIGN KEY (`unit_manager_id`) REFERENCES `sys_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='申请人坐在单位';

-- ----------------------------
-- Records of sys_unit
-- ----------------------------
INSERT INTO `sys_unit` VALUES ('1', '计算机与信息学院', '3');

-- ----------------------------
-- Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL auto_increment,
  `user_name` varchar(255) default NULL,
  `user_password` varchar(255) default NULL,
  `role_no` int(11) default NULL,
  `unit_id` int(11) default NULL,
  `t_work_id` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  KEY `unit_id` (`unit_id`),
  KEY `role_no` (`role_no`),
  CONSTRAINT `sys_user_ibfk_2` FOREIGN KEY (`unit_id`) REFERENCES `sys_unit` (`id`),
  CONSTRAINT `sys_user_ibfk_3` FOREIGN KEY (`role_no`) REFERENCES `sys_role` (`role_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '申请人1', '1', '1', '1', '1');
INSERT INTO `sys_user` VALUES ('2', '申请人2', '1', '1', '1', '');
INSERT INTO `sys_user` VALUES ('3', '所在单位1', '1', '2', null, null);
INSERT INTO `sys_user` VALUES ('4', '所在单位2', '1', '2', null, null);
INSERT INTO `sys_user` VALUES ('5', '国际处工作人员1', '1', '3', null, null);
INSERT INTO `sys_user` VALUES ('6', '国际处工作人员2', '1', '3', null, null);
INSERT INTO `sys_user` VALUES ('7', '国际处长1', '1', '4', null, null);
INSERT INTO `sys_user` VALUES ('8', '国际处长2', '1', '4', null, null);
INSERT INTO `sys_user` VALUES ('9', '财务处1', '1', '5', null, null);
INSERT INTO `sys_user` VALUES ('10', '财务处2', '1', '5', null, null);
INSERT INTO `sys_user` VALUES ('11', '经费来源部门1', '1', '6', null, null);
INSERT INTO `sys_user` VALUES ('12', '经费来源部门2', '1', '6', null, null);
INSERT INTO `sys_user` VALUES ('13', '纪监审部门1', '1', '7', null, null);
INSERT INTO `sys_user` VALUES ('14', '纪监审部门2', '1', '7', null, null);
INSERT INTO `sys_user` VALUES ('15', '业务分管校领导1', '1', '8', null, null);
INSERT INTO `sys_user` VALUES ('16', '业务分管校领导2', '1', '8', null, null);
INSERT INTO `sys_user` VALUES ('17', '外事分管校领导1', '1', '9', null, null);
INSERT INTO `sys_user` VALUES ('18', '外事分管校领导2', '1', '9', null, null);
INSERT INTO `sys_user` VALUES ('19', '校党委书记1', '1', '10', null, null);
INSERT INTO `sys_user` VALUES ('20', '校党委书记2', '1', '10', null, null);

-- ----------------------------
-- Table structure for `wf_cc_order`
-- ----------------------------
DROP TABLE IF EXISTS `wf_cc_order`;
CREATE TABLE `wf_cc_order` (
  `order_Id` varchar(32) default NULL COMMENT '流程实例ID',
  `actor_Id` varchar(50) default NULL COMMENT '参与者ID',
  `creator` varchar(50) default NULL COMMENT '发起人',
  `create_Time` varchar(50) default NULL COMMENT '抄送时间',
  `finish_Time` varchar(50) default NULL COMMENT '完成时间',
  `status` tinyint(1) default NULL COMMENT '状态',
  KEY `IDX_CCORDER_ORDER` (`order_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='抄送实例表';

-- ----------------------------
-- Records of wf_cc_order
-- ----------------------------

-- ----------------------------
-- Table structure for `wf_hist_order`
-- ----------------------------
DROP TABLE IF EXISTS `wf_hist_order`;
CREATE TABLE `wf_hist_order` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `process_Id` varchar(32) NOT NULL COMMENT '流程定义ID',
  `order_State` tinyint(1) NOT NULL COMMENT '状态（0:结束；1：活动；2：终止）',
  `creator` varchar(50) default NULL COMMENT '发起人',
  `create_Time` varchar(50) NOT NULL COMMENT '发起时间',
  `end_Time` varchar(50) default NULL COMMENT '完成时间',
  `expire_Time` varchar(50) default NULL COMMENT '期望完成时间',
  `priority` tinyint(1) default NULL COMMENT '优先级',
  `parent_Id` varchar(32) default NULL COMMENT '父流程ID',
  `order_No` varchar(50) default NULL COMMENT '流程实例编号',
  `variable` varchar(2000) default NULL COMMENT '附属变量json存储',
  PRIMARY KEY  (`id`),
  KEY `IDX_HIST_ORDER_PROCESSID` (`process_Id`),
  KEY `IDX_HIST_ORDER_NO` (`order_No`),
  KEY `FK_HIST_ORDER_PARENTID` (`parent_Id`),
  CONSTRAINT `FK_HIST_ORDER_PARENTID` FOREIGN KEY (`parent_Id`) REFERENCES `wf_hist_order` (`id`),
  CONSTRAINT `FK_HIST_ORDER_PROCESSID` FOREIGN KEY (`process_Id`) REFERENCES `wf_process` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='历史流程实例表';

-- ----------------------------
-- Records of wf_hist_order
-- ----------------------------
INSERT INTO `wf_hist_order` VALUES ('b5db2195eb804bf69be9d97ae5e808ef', 'da258db4067e4b4294dce70182d27cdc', '1', '申请人1', '2015-10-14 19:11:28', null, null, null, null, '15-10-14-0', '{\"unitPass\":1,\"l_no\":1,\"chiefPass\":0}');
INSERT INTO `wf_hist_order` VALUES ('fcdc3dcd32e345749e34d1f12bf7ca7f', 'da258db4067e4b4294dce70182d27cdc', '1', '申请人1', '2015-10-14 20:23:49', null, null, null, null, '15-10-14-1', '{\"unitPass\":1,\"l_no\":1,\"chiefPass\":0}');

-- ----------------------------
-- Table structure for `wf_hist_task`
-- ----------------------------
DROP TABLE IF EXISTS `wf_hist_task`;
CREATE TABLE `wf_hist_task` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `order_Id` varchar(32) NOT NULL COMMENT '流程实例ID',
  `task_Name` varchar(100) NOT NULL COMMENT '任务名称',
  `display_Name` varchar(200) NOT NULL COMMENT '任务显示名称',
  `task_Type` tinyint(1) NOT NULL COMMENT '任务类型',
  `perform_Type` tinyint(1) default NULL COMMENT '参与类型',
  `task_State` tinyint(1) NOT NULL COMMENT '任务状态',
  `operator` varchar(50) default NULL COMMENT '任务处理人',
  `create_Time` varchar(50) NOT NULL COMMENT '任务创建时间',
  `finish_Time` varchar(50) default NULL COMMENT '任务完成时间',
  `expire_Time` varchar(50) default NULL COMMENT '任务期望完成时间',
  `action_Url` varchar(200) default NULL COMMENT '任务处理url',
  `parent_Task_Id` varchar(32) default NULL COMMENT '父任务ID',
  `variable` varchar(2000) default NULL COMMENT '附属变量json存储',
  PRIMARY KEY  (`id`),
  KEY `IDX_HIST_TASK_ORDER` (`order_Id`),
  KEY `IDX_HIST_TASK_TASKNAME` (`task_Name`),
  KEY `IDX_HIST_TASK_PARENTTASK` (`parent_Task_Id`),
  CONSTRAINT `FK_HIST_TASK_ORDERID` FOREIGN KEY (`order_Id`) REFERENCES `wf_hist_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='历史任务表';

-- ----------------------------
-- Records of wf_hist_task
-- ----------------------------
INSERT INTO `wf_hist_task` VALUES ('14f90dd3bd1d4033b5b7dae37a3d311e', 'fcdc3dcd32e345749e34d1f12bf7ca7f', 'newApply', '教师申请', '0', '0', '0', '申请人1', '2015-10-14 20:23:49', '2015-10-14 20:23:49', null, '/newApplyController/newApply', 'start', '{\"approveUnit.operator\":\"所在单位1\"}');
INSERT INTO `wf_hist_task` VALUES ('a000db4b656148618cac4474033ff26e', 'b5db2195eb804bf69be9d97ae5e808ef', 'unit', '所在单位审批', '0', '0', '0', '所在单位1', '2015-10-14 19:11:29', '2015-10-14 19:11:39', null, '', 'f87669b69d274a7291ac4350659ef573', '{\"approveInternalUnitStaff.operator\":\"国际处工作人员1\"}');
INSERT INTO `wf_hist_task` VALUES ('a77953f8932a47bc87fa539a468bbad4', 'b5db2195eb804bf69be9d97ae5e808ef', 'newApply', '教师申请', '0', '0', '0', '申请人1', '2015-10-14 19:20:43', '2015-10-14 19:27:32', null, '/newApplyController/newApply', 'c512e85cd9044ed7a9efd537786801b9', '{\"newApply.operator\":\"申请人1\",\"l_no\":1,\"approveInternalUnitStaff.operator\":\"国际处工作人员1\"}');
INSERT INTO `wf_hist_task` VALUES ('c512e85cd9044ed7a9efd537786801b9', 'b5db2195eb804bf69be9d97ae5e808ef', 'internalStaff', '国际处工作人员审批', '0', '0', '0', '国际处工作人员1', '2015-10-14 19:11:39', '2015-10-14 19:20:43', null, '', 'a000db4b656148618cac4474033ff26e', '{}');
INSERT INTO `wf_hist_task` VALUES ('f253ba7b1fe9448f9407018f01f2bb52', 'fcdc3dcd32e345749e34d1f12bf7ca7f', 'unit', '所在单位审批', '0', '0', '0', '所在单位1', '2015-10-14 20:23:50', '2015-10-14 20:25:21', null, '', '14f90dd3bd1d4033b5b7dae37a3d311e', '{\"approveInternalUnitStaff.operator\":\"国际处工作人员1\"}');
INSERT INTO `wf_hist_task` VALUES ('f87669b69d274a7291ac4350659ef573', 'b5db2195eb804bf69be9d97ae5e808ef', 'newApply', '教师申请', '0', '0', '0', '申请人1', '2015-10-14 19:11:28', '2015-10-14 19:11:28', null, '/newApplyController/newApply', 'start', '{\"approveUnit.operator\":\"所在单位1\"}');

-- ----------------------------
-- Table structure for `wf_hist_task_actor`
-- ----------------------------
DROP TABLE IF EXISTS `wf_hist_task_actor`;
CREATE TABLE `wf_hist_task_actor` (
  `task_Id` varchar(32) NOT NULL COMMENT '任务ID',
  `actor_Id` varchar(50) NOT NULL COMMENT '参与者ID',
  KEY `IDX_HIST_TASKACTOR_TASK` (`task_Id`),
  CONSTRAINT `FK_HIST_TASKACTOR` FOREIGN KEY (`task_Id`) REFERENCES `wf_hist_task` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='历史任务参与者表';

-- ----------------------------
-- Records of wf_hist_task_actor
-- ----------------------------
INSERT INTO `wf_hist_task_actor` VALUES ('a000db4b656148618cac4474033ff26e', '所在单位1');
INSERT INTO `wf_hist_task_actor` VALUES ('c512e85cd9044ed7a9efd537786801b9', '国际处工作人员1');
INSERT INTO `wf_hist_task_actor` VALUES ('f253ba7b1fe9448f9407018f01f2bb52', '所在单位1');

-- ----------------------------
-- Table structure for `wf_order`
-- ----------------------------
DROP TABLE IF EXISTS `wf_order`;
CREATE TABLE `wf_order` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `parent_Id` varchar(32) default NULL COMMENT '父流程ID',
  `process_Id` varchar(32) NOT NULL COMMENT '流程定义ID',
  `creator` varchar(50) default NULL COMMENT '发起人',
  `create_Time` varchar(50) NOT NULL COMMENT '发起时间',
  `expire_Time` varchar(50) default NULL COMMENT '期望完成时间',
  `last_Update_Time` varchar(50) default NULL COMMENT '上次更新时间',
  `last_Updator` varchar(50) default NULL COMMENT '上次更新人',
  `priority` tinyint(1) default NULL COMMENT '优先级',
  `parent_Node_Name` varchar(100) default NULL COMMENT '父流程依赖的节点名称',
  `order_No` varchar(50) default NULL COMMENT '流程实例编号',
  `variable` varchar(2000) default NULL COMMENT '附属变量json存储',
  `version` int(3) default NULL COMMENT '版本',
  PRIMARY KEY  (`id`),
  KEY `IDX_ORDER_PROCESSID` (`process_Id`),
  KEY `IDX_ORDER_NO` (`order_No`),
  KEY `FK_ORDER_PARENTID` (`parent_Id`),
  CONSTRAINT `FK_ORDER_PARENTID` FOREIGN KEY (`parent_Id`) REFERENCES `wf_order` (`id`),
  CONSTRAINT `FK_ORDER_PROCESSID` FOREIGN KEY (`process_Id`) REFERENCES `wf_process` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='流程实例表';

-- ----------------------------
-- Records of wf_order
-- ----------------------------
INSERT INTO `wf_order` VALUES ('b5db2195eb804bf69be9d97ae5e808ef', null, 'da258db4067e4b4294dce70182d27cdc', '申请人1', '2015-10-14 19:11:28', null, '2015-10-14 19:27:32', '申请人1', null, null, '15-10-14-0', '{\"unitPass\":1,\"l_no\":1,\"chiefPass\":0}', '5');
INSERT INTO `wf_order` VALUES ('fcdc3dcd32e345749e34d1f12bf7ca7f', null, 'da258db4067e4b4294dce70182d27cdc', '申请人1', '2015-10-14 20:23:49', null, '2015-10-14 20:25:21', '所在单位1', null, null, '15-10-14-1', '{\"unitPass\":1,\"l_no\":1,\"chiefPass\":0}', '3');

-- ----------------------------
-- Table structure for `wf_process`
-- ----------------------------
DROP TABLE IF EXISTS `wf_process`;
CREATE TABLE `wf_process` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `name` varchar(100) default NULL COMMENT '流程名称',
  `display_Name` varchar(200) default NULL COMMENT '流程显示名称',
  `type` varchar(100) default NULL COMMENT '流程类型',
  `instance_Url` varchar(200) default NULL COMMENT '实例url',
  `state` tinyint(1) default NULL COMMENT '流程是否可用',
  `content` longblob COMMENT '流程模型定义',
  `version` int(2) default NULL COMMENT '版本',
  `create_Time` varchar(50) default NULL COMMENT '创建时间',
  `creator` varchar(50) default NULL COMMENT '创建人',
  PRIMARY KEY  (`id`),
  KEY `IDX_PROCESS_NAME` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='流程定义表';

-- ----------------------------
-- Records of wf_process
-- ----------------------------
INSERT INTO `wf_process` VALUES ('da258db4067e4b4294dce70182d27cdc', 'approval', '教师出国审批流程', null, '', '1', 0x3C3F786D6C2076657273696F6E3D22312E302220656E636F64696E673D225554462D3822207374616E64616C6F6E653D226E6F223F3E0D0A3C70726F6365737320646973706C61794E616D653D22E69599E5B888E587BAE59BBDE5AEA1E689B9E6B581E7A88B2220696E7374616E63654E6F436C6173733D22636F6D2E666F726569676E2E6170702E7574696C732E566973697447656E657261746522206E616D653D22617070726F76616C223E0D0A3C7461736B2061737369676E65653D22617070726F7665556E69742E6F70657261746F7222206175746F457865637574653D22592220646973706C61794E616D653D22E68980E59CA8E58D95E4BD8DE5AEA1E689B922206C61796F75743D223235352C2D35372C3130302C353222206E616D653D22756E69742220706572666F726D547970653D22414E5922207461736B547970653D224D616A6F72223E0D0A3C7472616E736974696F6E20646973706C61794E616D653D22E9809AE8BF872220673D2222206E616D653D227472616E736974696F6E3322206F66667365743D22322C2D342220746F3D22696E7465726E616C5374616666222F3E0D0A3C2F7461736B3E0D0A3C7461736B2061737369676E65653D22617070726F7665496E7465726E616C556E697443686965662E6F70657261746F7222206175746F457865637574653D22592220646973706C61794E616D653D22E59BBDE99985E5A484E995BFE5AEA1E689B922206C61796F75743D2237382C3131312C2D312C2D3122206E616D653D22696E7465726E616C43686965662220706572666F726D547970653D22414E5922207461736B547970653D224D616A6F72223E0D0A3C7472616E736974696F6E20646973706C61794E616D653D22E5AEA1E689B9E9809AE8BF872220673D223132352C33373722206E616D653D227472616E736974696F6E3522206F66667365743D22302C302220746F3D22666F726B31222F3E0D0A3C2F7461736B3E0D0A3C7461736B2061737369676E65653D2266696E616E6369616C2E6F70657261746F7222206175746F457865637574653D22592220646973706C61794E616D653D22E8B4A2E58AA122206C61796F75743D223336362C3237342C2D312C2D3122206E616D653D2266696E616E6369616C2220706572666F726D547970653D22414E5922207461736B547970653D224D616A6F72223E0D0A3C7472616E736974696F6E20646973706C61794E616D653D22E9809AE8BF872220673D223534362C32393922206E616D653D227472616E736974696F6E313022206F66667365743D22302C302220746F3D226A6F696E31222F3E0D0A3C2F7461736B3E0D0A3C7461736B2061737369676E65653D2266756E6473536F757263652E6F70657261746F7222206175746F457865637574653D22592220646973706C61794E616D653D22E7BB8FE8B4B9E69DA5E6BA90E983A8E997A822206C61796F75743D223337332C3433362C2D312C2D3122206E616D653D2266756E6473536F757263652220706572666F726D547970653D22414E5922207461736B547970653D224D616A6F72223E0D0A3C7472616E736974696F6E20673D223534372C34363122206E616D653D227472616E736974696F6E313422206F66667365743D22302C302220746F3D226A6F696E31222F3E0D0A3C2F7461736B3E0D0A3C7461736B206175746F457865637574653D22592220646973706C61794E616D653D22E69599E5B888E794B3E8AFB72220666F726D3D222F6E65774170706C79436F6E74726F6C6C65722F6E65774170706C7922206C61796F75743D222D31362C35312C3130302C353222206E616D653D226E65774170706C792220706572666F726D547970653D22414E5922207461736B547970653D224D616A6F72223E0D0A3C7472616E736974696F6E20673D2222206E616D653D227472616E736974696F6E3222206F66667365743D22302C302220746F3D226465636973696F6E33222F3E0D0A3C2F7461736B3E0D0A3C666F726B20646973706C61794E616D653D22666F726B3122206C61796F75743D223237382C3335332C2D312C2D3122206E616D653D22666F726B31223E0D0A3C7472616E736974696F6E20673D223330322C32393922206E616D653D227472616E736974696F6E3622206F66667365743D22302C302220746F3D2266696E616E6369616C222F3E0D0A3C7472616E736974696F6E20673D2222206E616D653D227472616E736974696F6E3722206F66667365743D22302C302220746F3D226469736369706C696E65222F3E0D0A3C7472616E736974696F6E20673D223330312C34363222206E616D653D227472616E736974696F6E313322206F66667365743D22302C302220746F3D2266756E6473536F75726365222F3E0D0A3C2F666F726B3E0D0A3C7461736B2061737369676E65653D22617070726F7665496E7465726E616C556E697453746166662E6F70657261746F7222206175746F457865637574653D224E2220646973706C61794E616D653D22E59BBDE99985E5A484E5B7A5E4BD9CE4BABAE59198E5AEA1E689B922206C61796F75743D223233392C34392C3132382C353222206E616D653D22696E7465726E616C53746166662220706572666F726D547970653D22414E5922207461736B547970653D224D616A6F72223E0D0A3C7472616E736974696F6E20673D2222206E616D653D227472616E736974696F6E3422206F66667365743D22302C302220746F3D226465636973696F6E34222F3E0D0A3C2F7461736B3E0D0A3C7461736B2061737369676E65653D226469736369706C696E652E6F70657261746F7222206175746F457865637574653D22592220646973706C61794E616D653D22E7BAAAE6A380E983A8E997A8E5AEA1E689B922206C61796F75743D223336382C3335312C2D312C2D3122206E616D653D226469736369706C696E652220706572666F726D547970653D22414E5922207461736B547970653D224D616A6F72223E0D0A3C7472616E736974696F6E20673D2222206E616D653D227472616E736974696F6E3922206F66667365743D22302C302220746F3D226A6F696E31222F3E0D0A3C2F7461736B3E0D0A3C6A6F696E20646973706C61794E616D653D226A6F696E3122206C61796F75743D223532332C3335342C2D312C2D3122206E616D653D226A6F696E312220706F7374496E746572636570746F72733D22636F6D2E666F726569676E2E6170702E6D6F64656C2E5465737448616E646C65223E0D0A3C7472616E736974696F6E20673D2222206E616D653D227472616E736974696F6E313622206F66667365743D22302C302220746F3D226465636973696F6E31222F3E0D0A3C2F6A6F696E3E0D0A3C7461736B2061737369676E65653D22696E7465726E616C4C65616465722E6F70657261746F7222206175746F457865637574653D22592220646973706C61794E616D653D22E58886E7AEA1E5A496E4BA8BE6A0A1E9A286E5AFBC22206C61796F75743D223635322C3236382C3131392C353222206E616D653D22696E7465726E616C4C65616465722220706572666F726D547970653D22414E5922207461736B547970653D224D616A6F72223E0D0A3C7472616E736974696F6E20673D2222206E616D653D227472616E736974696F6E313822206F66667365743D22302C302220746F3D226465636973696F6E32222F3E0D0A3C2F7461736B3E0D0A3C7461736B2061737369676E65653D22627573696E6573734C65616465722E6F70657261746F7222206175746F457865637574653D22592220646973706C61794E616D653D22E4B89AE58AA1E58886E7AEA1E6A0A1E9A286E5AFBC22206C61796F75743D223635362C3431392C3131302C353222206E616D653D22627573696E6573734C65616465722220706572666F726D547970653D22414E5922207461736B547970653D224D616A6F72223E0D0A3C7472616E736974696F6E20646973706C61794E616D653D22E9809AE8BF872220673D2222206E616D653D227472616E736974696F6E313122206F66667365743D22302C302220746F3D22696E7465726E616C4C6561646572222F3E0D0A3C2F7461736B3E0D0A3C737461727420646973706C61794E616D653D2273746172743122206C61796F75743D22392C2D33342C2D312C2D3122206E616D653D22737461727431223E0D0A3C7472616E736974696F6E20673D2222206E616D653D227472616E736974696F6E3122206F66667365743D22302C302220746F3D226E65774170706C79222F3E0D0A3C2F73746172743E0D0A3C7461736B2061737369676E65653D2270617274795365637265746172792E6F70657261746F7222206175746F457865637574653D22592220646973706C61794E616D653D22E6A0A1E5859AE5A794E4B9A6E8AEB022206C61796F75743D223930342C3334362C2D312C2D3122206E616D653D2270617274795365637265746172792220706572666F726D547970653D22414E5922207461736B547970653D224D616A6F72223E0D0A3C7472616E736974696F6E20646973706C61794E616D653D22E9809AE8BF872220673D2222206E616D653D227472616E736974696F6E323022206F66667365743D22302C302220746F3D22656E6431222F3E0D0A3C2F7461736B3E0D0A3C656E6420646973706C61794E616D653D22656E643122206C61796F75743D223932382C3139372C2D312C2D3122206E616D653D22656E6431222F3E0D0A3C6465636973696F6E20646973706C61794E616D653D226465636973696F6E312220657870723D22247B6C5F6E6F202667743B2033203F20277472616E736974696F6E313727203A20277472616E736974696F6E38277D22206C61796F75743D223538392C3335332C2D312C2D3122206E616D653D226465636973696F6E31223E0D0A3C7472616E736974696F6E20646973706C61794E616D653D22E589AFE5A484E58F8AE4BBA5E4B88B2220673D223631332C32393322206E616D653D227472616E736974696F6E313722206F66667365743D22302C302220746F3D22696E7465726E616C4C6561646572222F3E0D0A3C7472616E736974696F6E20646973706C61794E616D653D22E5A484E995BFE58F8AE4BBA5E4B88A2220673D223631322C34343522206E616D653D227472616E736974696F6E3822206F66667365743D22302C302220746F3D22627573696E6573734C6561646572222F3E0D0A3C2F6465636973696F6E3E0D0A3C6465636973696F6E20646973706C61794E616D653D226465636973696F6E322220657870723D22247B6C5F6E6F202667743B2033203F20277472616E736974696F6E313927203A20277472616E736974696F6E3234277D22206C61796F75743D223739332C3237302C2D312C2D3122206E616D653D226465636973696F6E32223E0D0A3C7472616E736974696F6E20646973706C61794E616D653D22E589AFE5A484E58F8AE4BBA5E4B88B2220673D223831372C32323022206E616D653D227472616E736974696F6E313922206F66667365743D2235312C2D31342220746F3D22656E6431222F3E0D0A3C7472616E736974696F6E20646973706C61794E616D653D22E5A484E995BFE4BBA5E4B88A2220673D223831362C33373222206E616D653D227472616E736974696F6E323422206F66667365743D2234332C32372220746F3D227061727479536563726574617279222F3E0D0A3C2F6465636973696F6E3E0D0A3C6465636973696F6E20646973706C61794E616D653D226465636973696F6E332220657870723D22247B756E697450617373203D3D2031203F20277472616E736974696F6E3236273A277472616E736974696F6E3235277D22206C61796F75743D2239372C35312C2D312C2D3122206E616D653D226465636973696F6E33223E0D0A3C7472616E736974696F6E20646973706C61794E616D653D22E58D95E4BD8DE69CAAE5AEA1E689B92220673D223132302C2D333122206E616D653D227472616E736974696F6E323522206F66667365743D22302C302220746F3D22756E6974222F3E0D0A3C7472616E736974696F6E20646973706C61794E616D653D22E58D95E4BD8DE5AEA1E689B9E8BF872220673D2222206E616D653D227472616E736974696F6E323622206F66667365743D22302C302220746F3D22696E7465726E616C5374616666222F3E0D0A3C2F6465636973696F6E3E0D0A3C6465636973696F6E20646973706C61794E616D653D226465636973696F6E342220657870723D22247B636869656650617373203D3D2031203F20277472616E736974696F6E3237273A277472616E736974696F6E3232277D22206C61796F75743D223238302C3131352C2D312C2D3122206E616D653D226465636973696F6E34223E0D0A3C7472616E736974696F6E20646973706C61794E616D653D22E5A484E995BFE69CAAE5AEA1E689B92220673D2222206E616D653D227472616E736974696F6E323222206F66667365743D22302C302220746F3D22696E7465726E616C4368696566222F3E0D0A3C7472616E736974696F6E20646973706C61794E616D653D22E5A484E995BFE5B7B2E5AEA1E689B92220673D2222206E616D653D227472616E736974696F6E313222206F66667365743D22302C302220746F3D226465636973696F6E35222F3E0D0A3C2F6465636973696F6E3E0D0A3C6465636973696F6E20646973706C61794E616D653D226465636973696F6E352220657870723D22247B746F4465706172746D656E747D222068616E646C65436C6173733D22636F6D2E6672616D65776F726B2E666C6F772E48616E646C65722E546F4F726748616E646C657222206C61796F75743D223237392C3233332C2D312C2D3122206E616D653D226465636973696F6E35223E0D0A3C7472616E736974696F6E20646973706C61794E616D653D22E8B4A2E58AA1E4BFAEE694B9E5AE8CE688902220673D223431342C32353722206E616D653D227472616E736974696F6E313522206F66667365743D22302C302220746F3D2266696E616E6369616C222F3E0D0A3C7472616E736974696F6E20646973706C61794E616D653D22E7BB8FE8B4B9E4BFAEE694B9E5AE8CE688902220673D223231352C3235373B3231352C3534323B3431382C35343222206E616D653D227472616E736974696F6E323122206F66667365743D222D33332C3138362220746F3D2266756E6473536F75726365222F3E0D0A3C2F6465636973696F6E3E0D0A3C2F70726F636573733E0D0A, '0', '2015-10-14 19:08:24', null);

-- ----------------------------
-- Table structure for `wf_surrogate`
-- ----------------------------
DROP TABLE IF EXISTS `wf_surrogate`;
CREATE TABLE `wf_surrogate` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `process_Name` varchar(100) default NULL COMMENT '流程名称',
  `operator` varchar(50) default NULL COMMENT '授权人',
  `surrogate` varchar(50) default NULL COMMENT '代理人',
  `odate` varchar(64) default NULL COMMENT '操作时间',
  `sdate` varchar(64) default NULL COMMENT '开始时间',
  `edate` varchar(64) default NULL COMMENT '结束时间',
  `state` tinyint(1) default NULL COMMENT '状态',
  PRIMARY KEY  (`id`),
  KEY `IDX_SURROGATE_OPERATOR` (`operator`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='委托代理表';

-- ----------------------------
-- Records of wf_surrogate
-- ----------------------------

-- ----------------------------
-- Table structure for `wf_task`
-- ----------------------------
DROP TABLE IF EXISTS `wf_task`;
CREATE TABLE `wf_task` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `order_Id` varchar(32) NOT NULL COMMENT '流程实例ID',
  `task_Name` varchar(100) NOT NULL COMMENT '任务名称',
  `display_Name` varchar(200) NOT NULL COMMENT '任务显示名称',
  `task_Type` tinyint(1) NOT NULL COMMENT '任务类型',
  `perform_Type` tinyint(1) default NULL COMMENT '参与类型',
  `operator` varchar(50) default NULL COMMENT '任务处理人',
  `create_Time` varchar(50) default NULL COMMENT '任务创建时间',
  `finish_Time` varchar(50) default NULL COMMENT '任务完成时间',
  `expire_Time` varchar(50) default NULL COMMENT '任务期望完成时间',
  `action_Url` varchar(200) default NULL COMMENT '任务处理的url',
  `parent_Task_Id` varchar(32) default NULL COMMENT '父任务ID',
  `variable` varchar(2000) default NULL COMMENT '附属变量json存储',
  `version` tinyint(1) default NULL COMMENT '版本',
  PRIMARY KEY  (`id`),
  KEY `IDX_TASK_ORDER` (`order_Id`),
  KEY `IDX_TASK_TASKNAME` (`task_Name`),
  KEY `IDX_TASK_PARENTTASK` (`parent_Task_Id`),
  CONSTRAINT `FK_TASK_ORDERID` FOREIGN KEY (`order_Id`) REFERENCES `wf_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务表';

-- ----------------------------
-- Records of wf_task
-- ----------------------------
INSERT INTO `wf_task` VALUES ('5e7aec1e7a954c70bdea9849a2a5429b', 'b5db2195eb804bf69be9d97ae5e808ef', 'internalStaff', '国际处工作人员审批', '0', '0', null, '2015-10-14 19:27:32', null, null, '', 'a77953f8932a47bc87fa539a468bbad4', '{\"newApply.operator\":\"申请人1\",\"S-ACTOR\":\"国际处工作人员1\",\"unitPass\":1,\"l_no\":1,\"approveInternalUnitStaff.operator\":\"国际处工作人员1\",\"chiefPass\":0}', '0');
INSERT INTO `wf_task` VALUES ('6e50c0540fb24839914e80a5f335665d', 'fcdc3dcd32e345749e34d1f12bf7ca7f', 'internalStaff', '国际处工作人员审批', '0', '0', null, '2015-10-14 20:25:21', null, null, '', 'f253ba7b1fe9448f9407018f01f2bb52', '{\"S-ACTOR\":\"国际处工作人员1\",\"unitPass\":0,\"l_no\":1,\"approveInternalUnitStaff.operator\":\"国际处工作人员1\",\"chiefPass\":0}', '0');

-- ----------------------------
-- Table structure for `wf_task_actor`
-- ----------------------------
DROP TABLE IF EXISTS `wf_task_actor`;
CREATE TABLE `wf_task_actor` (
  `task_Id` varchar(32) NOT NULL COMMENT '任务ID',
  `actor_Id` varchar(50) NOT NULL COMMENT '参与者ID',
  KEY `IDX_TASKACTOR_TASK` (`task_Id`),
  CONSTRAINT `FK_TASK_ACTOR_TASKID` FOREIGN KEY (`task_Id`) REFERENCES `wf_task` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务参与者表';

-- ----------------------------
-- Records of wf_task_actor
-- ----------------------------
INSERT INTO `wf_task_actor` VALUES ('5e7aec1e7a954c70bdea9849a2a5429b', '国际处工作人员1');
INSERT INTO `wf_task_actor` VALUES ('6e50c0540fb24839914e80a5f335665d', '国际处工作人员1');
