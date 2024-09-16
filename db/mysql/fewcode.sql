-- 第一次执行
create database fewcode;

use fewcode;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`
(
    `id`                bigint                                                   NOT NULL AUTO_INCREMENT COMMENT '编号',
    `table_name`        varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT '' COMMENT '表名称',
    `table_comment`     varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT '' COMMENT '表描述',
    `sub_table_name`    varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci   NULL DEFAULT NULL COMMENT '关联子表的表名',
    `sub_table_fk_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci   NULL DEFAULT NULL COMMENT '子表关联的外键名',
    `class_name`        varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT '' COMMENT '实体类名称',
    `tpl_category`      varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
    `package_name`      varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '生成包路径',
    `module_name`       varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci   NULL DEFAULT NULL COMMENT '生成模块名',
    `business_name`     varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci   NULL DEFAULT NULL COMMENT '生成业务名',
    `function_name`     varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci   NULL DEFAULT NULL COMMENT '生成功能名',
    `function_author`   varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci   NULL DEFAULT NULL COMMENT '生成功能作者',
    `gen_type`          char(1) CHARACTER SET utf8 COLLATE utf8_general_ci       NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
    `gen_path`          varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
    `tree_code`         varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '树编码字段',
    `tree_parent_code`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '树父编码字段',
    `tree_name`         varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '树名称字段',
    `parent_menu_id`    bigint                                                   NULL DEFAULT NULL COMMENT '父菜单节点ID',
    `parent_menu_name`  varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '父菜单节点名称',
    `options`           varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
    `remark`            varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '备注',
    `create_id`         bigint                                                   NULL DEFAULT NULL COMMENT '创建人id',
    `create_time`       timestamp                                                NULL DEFAULT NULL COMMENT '创建时间',
    `update_id`         bigint                                                   NULL DEFAULT NULL COMMENT '修改人id',
    `update_time`       timestamp                                                NULL DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = '代码生成-代码生成业务表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`
(
    `id`             bigint                                                  NOT NULL AUTO_INCREMENT COMMENT '编号',
    `table_id`       bigint                                                  NULL DEFAULT NULL COMMENT '归属表编号',
    `column_name`    varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列名称',
    `column_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列描述',
    `column_type`    varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列类型',
    `java_type`      varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
    `java_field`     varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
    `is_pk`          tinyint(1)                                              NULL DEFAULT 0 COMMENT '是否主键（1是）',
    `is_increment`   tinyint(1)                                              NULL DEFAULT 0 COMMENT '是否自增（1是）',
    `is_required`    tinyint(1)                                              NULL DEFAULT 0 COMMENT '是否必填（1是）',
    `is_insert`      tinyint(1)                                              NULL DEFAULT 0 COMMENT '是否为插入字段（1是）',
    `is_edit`        tinyint(1)                                              NULL DEFAULT 0 COMMENT '是否编辑字段（1是）',
    `is_list`        tinyint(1)                                              NULL DEFAULT 0 COMMENT '是否列表字段（1是）',
    `is_query`       tinyint(1)                                              NULL DEFAULT 0 COMMENT '是否查询字段（1是）',
    `query_type`     varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
    `html_type`      varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
    `dict_type`      varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
    `sort`           int                                                     NULL DEFAULT NULL COMMENT '排序',
    `create_id`      bigint                                                  NULL DEFAULT NULL COMMENT '创建人id',
    `create_time`    datetime                                                NULL DEFAULT NULL COMMENT '创建时间',
    `update_id`      bigint                                                  NULL DEFAULT NULL COMMENT '修改人id',
    `update_time`    datetime                                                NULL DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = '代码生成-代码生成业务表字段'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`
(
    `id`             bigint                                                  NOT NULL AUTO_INCREMENT COMMENT '参数主键',
    `config_name`    varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数名称',
    `config_key`     varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键名',
    `config_value`   varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键值',
    `config_type`    tinyint(1)                                              NULL DEFAULT 0 COMMENT '是否内置',
    `belong_dept_id` bigint                                                  NULL DEFAULT NULL COMMENT '归属部门id',
    `create_id`      bigint                                                  NULL DEFAULT NULL COMMENT '创建人id',
    `create_time`    datetime                                                NULL DEFAULT NULL COMMENT '创建时间',
    `update_id`      bigint                                                  NULL DEFAULT NULL COMMENT '修改人id',
    `update_time`    datetime                                                NULL DEFAULT NULL COMMENT '更新时间',
    `remark`         varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 2
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = '系统管理-参数配置表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config`
VALUES (1, '首页轮播图地址', 'index_url', 'www.test.com', 1, NULL, 1, '2024-04-29 10:54:42', 1, '2024-08-16 13:44:36',
        '这个是备注');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`
(
    `id`          bigint                                                  NOT NULL AUTO_INCREMENT COMMENT '字典编码',
    `dict_sort`   int                                                     NULL DEFAULT 0 COMMENT '字典排序',
    `dict_label`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典标签',
    `dict_value`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典键值',
    `dict_code`   varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
    `css_class`   varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
    `list_class`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
    `is_default`  tinyint(1)                                              NULL DEFAULT 0 COMMENT '是否默认（1是 0否）',
    `status`      tinyint                                                 NULL DEFAULT 0 COMMENT '状态（0正常 1停用）',
    `create_id`   bigint                                                  NULL DEFAULT NULL COMMENT '创建人id',
    `create_time` datetime                                                NULL DEFAULT NULL COMMENT '创建时间',
    `update_id`   bigint                                                  NULL DEFAULT NULL COMMENT '修改人id',
    `update_time` datetime                                                NULL DEFAULT NULL COMMENT '更新时间',
    `remark`      varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 33
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = '系统管理-字典数据表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data`
VALUES (1, 1, '男', '0', 'sys_user_sex', '', 'primary', 1, 1, 1, '2024-02-21 16:56:12', 1, '2024-02-21 16:56:12',
        '性别男');
INSERT INTO `sys_dict_data`
VALUES (2, 2, '女', '1', 'sys_user_sex', '', 'primary', 0, 1, 1, '2024-02-21 16:56:12', 1, '2024-02-21 16:56:12',
        '性别女');
INSERT INTO `sys_dict_data`
VALUES (3, 3, '未知', '2', 'sys_user_sex', '', 'info', 0, 1, 1, '2024-02-21 16:56:12', 1, '2024-02-21 16:56:12',
        '性别未知');
INSERT INTO `sys_dict_data`
VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 1, 1, NULL, '2021-05-17 17:52:08', NULL, NULL, '显示菜单');
INSERT INTO `sys_dict_data`
VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 0, 1, NULL, '2021-05-17 17:52:08', NULL, NULL, '隐藏菜单');
INSERT INTO `sys_dict_data`
VALUES (6, 1, '正常', '1', 'sys_normal_disable', '', 'primary', 1, 1, NULL, '2021-05-17 17:52:08', NULL, NULL,
        '正常状态');
INSERT INTO `sys_dict_data`
VALUES (7, 2, '停用', '0', 'sys_normal_disable', '', 'danger', 0, 1, NULL, '2021-05-17 17:52:08', NULL, NULL,
        '停用状态');
INSERT INTO `sys_dict_data`
VALUES (8, 1, '启用', '1', 'sys_status', '', 'primary', 1, 1, 1, '2024-04-11 11:09:41', 1, '2024-04-11 11:09:41', '');
INSERT INTO `sys_dict_data`
VALUES (9, 2, '禁用', '0', 'sys_status', '', 'info', 0, 1, 1, '2024-04-11 11:09:41', 1, '2024-04-11 11:09:41', '');
INSERT INTO `sys_dict_data`
VALUES (10, 1, '新增', '1', 'sys_oper_type', '', 'info', 0, 1, NULL, '2021-05-17 17:52:08', NULL, NULL, '新增操作');
INSERT INTO `sys_dict_data`
VALUES (11, 2, '修改', '2', 'sys_oper_type', '', 'info', 0, 1, NULL, '2021-05-17 17:52:08', NULL, NULL, '修改操作');
INSERT INTO `sys_dict_data`
VALUES (12, 3, '删除', '3', 'sys_oper_type', '', 'danger', 0, 1, NULL, '2021-05-17 17:52:08', NULL, NULL, '删除操作');
INSERT INTO `sys_dict_data`
VALUES (13, 4, '授权', '4', 'sys_oper_type', '', 'primary', 0, 1, NULL, '2021-05-17 17:52:08', NULL, NULL, '授权操作');
INSERT INTO `sys_dict_data`
VALUES (14, 5, '导出', '5', 'sys_oper_type', '', 'warning', 0, 1, NULL, '2021-05-17 17:52:08', NULL, NULL, '导出操作');
INSERT INTO `sys_dict_data`
VALUES (15, 6, '导入', '6', 'sys_oper_type', '', 'warning', 0, 1, NULL, '2021-05-17 17:52:08', NULL, NULL, '导入操作');
INSERT INTO `sys_dict_data`
VALUES (16, 7, '强退', '7', 'sys_oper_type', '', 'danger', 0, 1, NULL, '2021-05-17 17:52:08', NULL, NULL, '强退操作');
INSERT INTO `sys_dict_data`
VALUES (17, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 0, 1, NULL, '2021-05-17 17:52:08', NULL, NULL,
        '生成操作');
INSERT INTO `sys_dict_data`
VALUES (18, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 0, 1, NULL, '2021-05-17 17:52:08', NULL, NULL,
        '清空操作');
INSERT INTO `sys_dict_data`
VALUES (19, 0, '审核中', '0', 'approve_status', '', 'info', 0, 1, NULL, '2021-05-17 17:52:08', NULL, NULL, '正常状态');
INSERT INTO `sys_dict_data`
VALUES (20, 1, '通过', '1', 'approve_status', '', 'primary', 0, 1, NULL, '2021-05-17 17:52:08', NULL, NULL, '停用状态');
INSERT INTO `sys_dict_data`
VALUES (21, 2, '拒绝', '2', 'approve_status', NULL, 'danger', 0, 1, NULL, '2024-02-26 13:39:48', NULL, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (22, 3, '删除', '3', 'approve_status', NULL, 'info', 0, 1, NULL, '2024-02-26 13:39:48', NULL, NULL, NULL);
INSERT INTO `sys_dict_data`
VALUES (23, 1, '系统用户', '1', 'system_user_type', '', 'primary', 0, 1, 1, '2024-03-25 13:30:40', 1,
        '2024-03-25 13:30:40', '');
INSERT INTO `sys_dict_data`
VALUES (24, 2, '小程序用户', '2', 'system_user_type', '', 'success', 0, 1, 1, '2024-03-25 13:30:40', 1,
        '2024-03-25 13:30:40', '');
INSERT INTO `sys_dict_data`
VALUES (25, 1, '目录', 'M', 'menu_type', '', 'success', 0, 1, 1, '2024-03-27 14:24:51', 1, '2024-03-27 14:24:51', '');
INSERT INTO `sys_dict_data`
VALUES (26, 2, '菜单', 'C', 'menu_type', '', 'warning', 0, 1, 1, '2024-03-27 14:24:51', 1, '2024-03-27 14:24:51', '');
INSERT INTO `sys_dict_data`
VALUES (27, 3, '按钮', 'F', 'menu_type', '', 'danger', 0, 1, 1, '2024-03-27 14:24:51', 1, '2024-03-27 14:24:51', '');
INSERT INTO `sys_dict_data`
VALUES (28, 1, '全部数据权限', '1', 'sys_role_data_scope', '', 'info', 0, 1, 1, '2024-05-06 14:10:04', 1,
        '2024-05-06 14:10:04', '');
INSERT INTO `sys_dict_data`
VALUES (29, 2, '自定义数据权限', '2', 'sys_role_data_scope', '', 'info', 0, 1, 1, '2024-05-06 14:10:04', 1,
        '2024-05-06 14:10:04', '');
INSERT INTO `sys_dict_data`
VALUES (30, 3, '本部门数据权限', '3', 'sys_role_data_scope', '', 'info', 0, 1, 1, '2024-05-06 14:10:04', 1,
        '2024-05-06 14:10:04', '');
INSERT INTO `sys_dict_data`
VALUES (31, 4, '本部门及以下数据权限', '4', 'sys_role_data_scope', '', 'info', 0, 1, 1, '2024-05-06 14:10:04', 1,
        '2024-05-06 14:10:04', '');
INSERT INTO `sys_dict_data`
VALUES (32, 5, '本人创建的数据权限', '5', 'sys_role_data_scope', '', 'info', 0, 1, 1, '2024-05-06 14:10:04', 1,
        '2024-05-06 14:10:04', '');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`
(
    `id`          bigint                                                  NOT NULL AUTO_INCREMENT COMMENT '字典主键',
    `dict_name`   varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典名称',
    `dict_code`   varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
    `status`      tinyint                                                 NULL DEFAULT 1 COMMENT '状态（1正常 0停用）',
    `remark`      varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
    `create_id`   bigint                                                  NULL DEFAULT NULL COMMENT '创建人id',
    `create_time` datetime                                                NULL DEFAULT NULL COMMENT '创建时间',
    `update_id`   bigint                                                  NULL DEFAULT NULL COMMENT '修改人id',
    `update_time` datetime                                                NULL DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `dict_type` (`dict_code` ASC) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 10
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = '系统管理-字典类型表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type`
VALUES (1, '性别', 'sys_user_sex', 1, '用户性别列表', NULL, '2021-05-17 17:52:08', 1, '2024-02-21 16:56:12');
INSERT INTO `sys_dict_type`
VALUES (2, '菜单状态', 'sys_show_hide', 1, '菜单状态列表', NULL, '2021-05-17 17:52:08', NULL, NULL);
INSERT INTO `sys_dict_type`
VALUES (3, '系统开关', 'sys_normal_disable', 1, '系统开关列表', NULL, '2021-05-17 17:52:08', NULL, NULL);
INSERT INTO `sys_dict_type`
VALUES (4, '系统状态', 'sys_status', 1, '系统状态列表', NULL, '2021-05-17 17:52:08', 1, '2024-04-11 11:09:41');
INSERT INTO `sys_dict_type`
VALUES (5, '操作类型', 'sys_oper_type', 1, '操作类型列表', NULL, '2021-05-17 17:52:08', NULL, NULL);
INSERT INTO `sys_dict_type`
VALUES (6, '审核状态', 'approve_status', 1, '审核状态列表', NULL, '2021-05-17 17:52:08', NULL, NULL);
INSERT INTO `sys_dict_type`
VALUES (7, '系统用户类型', 'system_user_type', 1,
        '系统用户类型，后台的为系统用户，只可登录管理系统；web端的为小程序用户，必须有openId', 1, '2024-03-25 13:29:55', 1,
        '2024-03-25 13:30:40');
INSERT INTO `sys_dict_type`
VALUES (8, '菜单类型', 'menu_type', 1, '菜单类型（M目录 C菜单 F按钮）', 1, '2024-03-27 14:24:51', 1,
        '2024-03-27 14:24:51');
INSERT INTO `sys_dict_type`
VALUES (9, '数据权限', 'sys_role_data_scope', 1,
        '1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限 5：本人创建的数据权限', 1,
        '2024-05-06 14:10:04', 1, '2024-05-06 14:10:04');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`
(
    `id`             int                                                     NOT NULL AUTO_INCREMENT COMMENT '公告ID',
    `notice_title`   varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT '公告标题',
    `notice_type`    char(1) CHARACTER SET utf8 COLLATE utf8_general_ci      NOT NULL COMMENT '公告类型（1通知 2公告）',
    `notice_content` text CHARACTER SET utf8 COLLATE utf8_general_ci         NULL COMMENT '公告内容',
    `status`         char(1) CHARACTER SET utf8 COLLATE utf8_general_ci      NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
    `create_id`      bigint                                                  NULL DEFAULT NULL COMMENT '创建人id',
    `create_name`    varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT '' COMMENT '创建者',
    `create_time`    datetime                                                NULL DEFAULT NULL COMMENT '创建时间',
    `update_id`      bigint                                                  NULL DEFAULT NULL COMMENT '修改人id',
    `update_name`    varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT '' COMMENT '更新者',
    `update_time`    datetime                                                NULL DEFAULT NULL COMMENT '更新时间',
    `remark`         varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = '系统管理-通知公告表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------

-- ----------------------------
-- Table structure for sys_operate_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_operate_log`;
CREATE TABLE `sys_operate_log`
(
    `id`               bigint                                                   NOT NULL AUTO_INCREMENT COMMENT '日志主键',
    `title`            varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci   NULL DEFAULT '' COMMENT '模块标题',
    `business_type`    int                                                      NULL DEFAULT 0 COMMENT '业务类型（0查询 1新增 2修改 3删除 4其他）',
    `method`           varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法名称',
    `resp_time`        bigint                                                   NULL DEFAULT NULL COMMENT '响应时间',
    `request_method`   varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci   NULL DEFAULT '' COMMENT '请求方式',
    `browser`          varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '浏览器类型',
    `operate_type`     int                                                      NULL DEFAULT 0 COMMENT '操作类别（0网站用户 1后台用户 2小程序 3其他）',
    `operate_url`      varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT '' COMMENT '请求URL',
    `operate_ip`       varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT '' COMMENT '主机地址',
    `operate_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT '' COMMENT '操作地点',
    `operate_param`    text CHARACTER SET utf8 COLLATE utf8_general_ci          NULL COMMENT '请求参数',
    `json_result`      text CHARACTER SET utf8 COLLATE utf8_general_ci          NULL COMMENT '返回参数',
    `status`           tinyint                                                  NULL DEFAULT NULL COMMENT '操作状态（0正常 1异常）',
    `error_msg`        text CHARACTER SET utf8 COLLATE utf8_general_ci          NULL COMMENT '错误消息',
    `create_id`        bigint                                                   NULL DEFAULT NULL COMMENT '操作人id',
    `create_time`      datetime                                                 NULL DEFAULT NULL COMMENT '操作时间',
    `update_id`        bigint                                                   NULL DEFAULT NULL COMMENT '更新人',
    `update_time`      datetime                                                 NULL DEFAULT NULL COMMENT '更新日期',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = '系统管理-操作日志记录'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_operate_log
-- ----------------------------

-- ----------------------------
-- Table structure for usc_dept
-- ----------------------------
# DROP TABLE IF EXISTS `usc_dept`;
# CREATE TABLE `usc_dept`
# (
#     `id`          bigint                                                  NOT NULL AUTO_INCREMENT COMMENT '部门id',
#     `parent_id`   bigint                                                  NULL DEFAULT 0 COMMENT '父部门id',
#     `ancestors`   varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '祖级列表',
#     `dept_name`   varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT '' COMMENT '部门名称',
#     `sort_num`    bigint                                                  NULL DEFAULT NULL COMMENT '显示顺序',
#     `leader`      varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '负责人',
#     `phone`       varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '联系电话',
#     `email`       varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '邮箱',
#     `status`      tinyint                                                 NULL DEFAULT NULL COMMENT '部门状态（0正常 1停用）',
#     `create_id`   bigint                                                  NULL DEFAULT NULL COMMENT '创建人id',
#     `create_time` datetime                                                NULL DEFAULT NULL COMMENT '创建时间',
#     `update_id`   bigint                                                  NULL DEFAULT NULL COMMENT '修改人id',
#     `update_time` datetime                                                NULL DEFAULT NULL COMMENT '更新时间',
#     `is_delete`   tinyint(1)                                              NULL DEFAULT 0 COMMENT '删除标志',
#     PRIMARY KEY (`id`) USING BTREE
# ) ENGINE = InnoDB
#   AUTO_INCREMENT = 3
#   CHARACTER SET = utf8
#   COLLATE = utf8_general_ci COMMENT = '用户中心-部门表'
#   ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of usc_dept
-- ----------------------------
# INSERT INTO `usc_dept`
# VALUES (1, 0, '0', 'FC公司', 0, 'FC', '00000000000', '1531137510@qq.com', 1, NULL, '2024-03-25 16:47:02', 1,
#         '2024-08-16 13:43:16', 0);
# INSERT INTO `usc_dept`
# VALUES (2, 1, '1', '管理部门', 1, '张三', '18888888888', NULL, 1, 1, '2024-04-11 11:06:16', 1, '2024-04-11 11:07:10',
#         0);

-- ----------------------------
-- Table structure for usc_menu
-- ----------------------------
DROP TABLE IF EXISTS `usc_menu`;
CREATE TABLE `usc_menu`
(
    `id`            bigint                                                  NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
    `name`          varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT '路由名称',
    `title`         varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT '菜单名称',
    `menu_type`     char(1) CHARACTER SET utf8 COLLATE utf8_general_ci      NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
    `parent_id`     bigint                                                  NULL DEFAULT 0 COMMENT '父菜单ID',
    `ancestors`     varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '祖级菜单',
    `sort_num`      bigint                                                  NULL DEFAULT NULL COMMENT '显示顺序',
    `path`          varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '路由地址',
    `component`     varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件路径',
    `redirect`      varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '重定向地址',
    `link_url`      varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '链接地址',
    `is_iframe`     tinyint(1)                                              NULL DEFAULT 0 COMMENT '是否内嵌窗口',
    `is_link`       tinyint(1)                                              NULL DEFAULT 0 COMMENT '是否外链',
    `is_keep_alive` tinyint(1)                                              NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
    `is_hide`       tinyint(1)                                              NULL DEFAULT 0 COMMENT '是否隐藏',
    `is_affix`      tinyint(1)                                              NULL DEFAULT 0 COMMENT '是否固定',
    `status`        tinyint                                                 NULL DEFAULT NULL COMMENT '菜单状态（0正常 1停用）',
    `perms`         varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
    `icon`          varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
    `remark`        varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
    `create_id`     bigint                                                  NULL DEFAULT NULL COMMENT '创建人id',
    `create_time`   datetime                                                NULL DEFAULT NULL COMMENT '创建时间',
    `update_id`     bigint                                                  NULL DEFAULT NULL COMMENT '修改人id',
    `update_time`   datetime                                                NULL DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 12
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = '用户中心-菜单权限表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of usc_menu
-- ----------------------------
INSERT INTO `usc_menu`
VALUES (1, 'home', '首页', 'C', 0, '', 1, '/home', 'home/index', '/home', '', 0, 0, 1, 0, 1, 1, '',
        'iconfont icon-shouye', '', 1, '2024-03-28 11:09:37', 1, '2024-03-28 13:04:26');
INSERT INTO `usc_menu`
VALUES (2, 'system', '系统设置', 'M', 0, '', 2, '/system', 'system/user/index', '/system/user', '', 0, 0, 1, 0, 0, 1,
        '', 'iconfont icon-xitongshezhi', '', 1, '2024-03-28 13:06:21', 1, '2024-04-29 09:44:53');
INSERT INTO `usc_menu`
VALUES (3, 'systemUser', '用户管理', 'C', 2, '2', 1, '/system/user', 'system/user/index', NULL, '', 0, 0, 1, 0, 0, 1,
        '', 'iconfont icon-icon-', '', 1, '2024-03-28 13:19:11', 1, '2024-03-28 13:21:01');
# INSERT INTO `usc_menu`
# VALUES (4, 'systemRole', '角色管理', 'C', 2, '2', 2, '/system/role', 'system/role/index', NULL, '', 0, 0, 1, 0, 0, 1,
#         '', 'iconfont icon-shuxingtu', '', 1, '2024-03-28 15:11:42', 1, '2024-03-28 15:13:00');
INSERT INTO `usc_menu`
VALUES (5, 'systemMenu', '菜单管理', 'C', 2, '2', 3, '/system/menu', 'system/menu/index', NULL, '', 0, 0, 1, 0, 0, 1,
        '', 'iconfont icon-juxingkaobei', '', 1, '2024-03-28 15:11:42', 1, '2024-03-28 15:21:57');
# INSERT INTO `usc_menu`
# VALUES (6, 'systemDept', '部门管理', 'C', 2, '2', 4, '/system/dept', 'system/dept/index', NULL, '', 0, 0, 1, 0, 0, 1,
#         '', 'ele-OfficeBuilding', '', 1, '2024-03-28 15:11:42', 1, '2024-03-28 15:13:00');
INSERT INTO `usc_menu`
VALUES (7, 'systemDic', '字典管理', 'C', 2, '2', 5, '/system/dic', 'system/dic/index', NULL, '', 0, 0, 1, 0, 0, 1, '',
        'ele-SetUp', '', 1, '2024-03-28 15:11:42', 1, '2024-03-28 15:13:00');
INSERT INTO `usc_menu`
VALUES (8, 'tool', '生成工具', 'M', 0, '', 3, '/tool', 'tool/gen/index', '/tool/gen', '', 0, 0, 1, 0, 0, 1, '',
        'iconfont icon-shouye_dongtaihui', '', 1, '2024-03-28 13:06:21', 1, '2024-04-29 09:45:00');
INSERT INTO `usc_menu`
VALUES (9, 'toolGen', '代码生成', 'C', 8, '8', 1, '/tool/gen', 'tool/gen/index', NULL, '', 0, 0, 1, 0, 0, 1, '',
        'iconfont icon-zujian', '', 1, '2024-03-28 13:19:11', 1, '2024-03-28 16:13:10');
INSERT INTO `usc_menu`
VALUES (10, 'config', '参数配置', 'C', 2, '2', 6, '/system/config', 'system/config/index', NULL, '', 0, 0, 1, 0, 0, 1,
        '', 'iconfont icon-icon-', '', 1, '2024-04-29 10:34:17', 1, '2024-04-29 10:44:24');
INSERT INTO `usc_menu`
VALUES (11, '', '修改', 'F', 3, '2,3', 0, '', '', '', '', 0, 0, 1, 0, 0, 1, 'system:user:update', '', '', 1,
        '2024-04-29 14:25:41', 1, '2024-04-29 14:25:41');
INSERT INTO `usc_menu`
VALUES (12, 'personal', '个人中心', 'C', 0, '0', 4, '/personal', 'personal/index', '', '', 0, 0, 1, 1, 0, 1, '', '', '',
        1, '2024-06-14 16:53:15', 1, '2024-06-14 16:55:41');

-- ----------------------------
-- Table structure for usc_role
-- ----------------------------
# DROP TABLE IF EXISTS `usc_role`;
# CREATE TABLE `usc_role`
# (
#     `id`                  bigint                                                  NOT NULL AUTO_INCREMENT COMMENT '角色ID',
#     `role_name`           varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT '角色名称',
#     `role_key`            varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色编码',
#     `sort_num`            bigint                                                  NOT NULL DEFAULT 0 COMMENT '显示顺序',
#     `data_scope`          char(1) CHARACTER SET utf8 COLLATE utf8_general_ci      NULL     DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
#     `menu_check_strictly` tinyint(1)                                              NULL     DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
#     `dept_check_strictly` tinyint(1)                                              NULL     DEFAULT 1 COMMENT '部门树选择项是否关联显示',
#     `status`              tinyint                                                 NOT NULL DEFAULT 0 COMMENT '角色状态（0正常 1停用）',
#     `remark`              varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL     DEFAULT NULL COMMENT '备注',
#     `create_id`           bigint                                                  NULL     DEFAULT NULL COMMENT '创建人id',
#     `create_time`         datetime                                                NULL     DEFAULT NULL COMMENT '创建时间',
#     `update_id`           bigint                                                  NULL     DEFAULT NULL COMMENT '修改人id',
#     `update_time`         datetime                                                NULL     DEFAULT NULL COMMENT '更新时间',
#     `is_delete`           tinyint(1)                                              NULL     DEFAULT 0 COMMENT '删除标志',
#     PRIMARY KEY (`id`) USING BTREE
# ) ENGINE = InnoDB
#   AUTO_INCREMENT = 4
#   CHARACTER SET = utf8
#   COLLATE = utf8_general_ci COMMENT = '用户中心-角色信息表'
#   ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of usc_role
-- ----------------------------
# INSERT INTO `usc_role`
# VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, 1, '超级管理员', NULL, '2021-05-17 14:03:57', 1, '2024-08-16 13:40:52',
#         0);
# INSERT INTO `usc_role`
# VALUES (3, '普通用户', 'person', 2, '1', 1, 1, 1, '个人普通用户', 1, '2024-05-06 16:12:53', 1, '2024-08-16 13:41:06',
#         0);

-- ----------------------------
-- Table structure for usc_role_dept
-- ----------------------------
# DROP TABLE IF EXISTS `usc_role_dept`;
# CREATE TABLE `usc_role_dept`
# (
#     `id`      bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
#     `role_id` bigint NOT NULL COMMENT '角色ID',
#     `dept_id` bigint NOT NULL COMMENT '部门ID',
#     PRIMARY KEY (`id`) USING BTREE
# ) ENGINE = InnoDB
#   CHARACTER SET = utf8
#   COLLATE = utf8_general_ci COMMENT = '用户中心-角色和部门关联表'
#   ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of usc_role_dept
-- ----------------------------

-- ----------------------------
-- Table structure for usc_role_menu
-- ----------------------------
# DROP TABLE IF EXISTS `usc_role_menu`;
# CREATE TABLE `usc_role_menu`
# (
#     `id`      bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
#     `role_id` bigint NOT NULL COMMENT '角色ID',
#     `menu_id` bigint NOT NULL COMMENT '菜单ID',
#     PRIMARY KEY (`id`) USING BTREE
# ) ENGINE = InnoDB
#   AUTO_INCREMENT = 75
#   CHARACTER SET = utf8
#   COLLATE = utf8_general_ci COMMENT = '用户中心-角色和菜单关联表'
#   ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of usc_role_menu
-- ----------------------------
# INSERT INTO `usc_role_menu`
# VALUES (75, 1, 1);
# INSERT INTO `usc_role_menu`
# VALUES (76, 1, 2);
# INSERT INTO `usc_role_menu`
# VALUES (77, 1, 3);
# INSERT INTO `usc_role_menu`
# VALUES (78, 1, 11);
# INSERT INTO `usc_role_menu`
# VALUES (79, 1, 4);
# INSERT INTO `usc_role_menu`
# VALUES (80, 1, 5);
# INSERT INTO `usc_role_menu`
# VALUES (81, 1, 6);
# INSERT INTO `usc_role_menu`
# VALUES (82, 1, 7);
# INSERT INTO `usc_role_menu`
# VALUES (83, 1, 10);
# INSERT INTO `usc_role_menu`
# VALUES (84, 1, 8);
# INSERT INTO `usc_role_menu`
# VALUES (85, 1, 9);
# INSERT INTO `usc_role_menu`
# VALUES (86, 1, 12);
# INSERT INTO `usc_role_menu`
# VALUES (87, 3, 1);
# INSERT INTO `usc_role_menu`
# VALUES (88, 3, 2);
# INSERT INTO `usc_role_menu`
# VALUES (89, 3, 3);
# INSERT INTO `usc_role_menu`
# VALUES (90, 3, 11);
# INSERT INTO `usc_role_menu`
# VALUES (91, 3, 4);
# INSERT INTO `usc_role_menu`
# VALUES (92, 3, 5);
# INSERT INTO `usc_role_menu`
# VALUES (93, 3, 6);
# INSERT INTO `usc_role_menu`
# VALUES (94, 3, 7);
# INSERT INTO `usc_role_menu`
# VALUES (95, 3, 10);
# INSERT INTO `usc_role_menu`
# VALUES (96, 3, 8);
# INSERT INTO `usc_role_menu`
# VALUES (97, 3, 9);
# INSERT INTO `usc_role_menu`
# VALUES (98, 3, 12);

-- ----------------------------
-- Table structure for usc_user
-- ----------------------------
DROP TABLE IF EXISTS `usc_user`;
CREATE TABLE `usc_user`
(
    `id`          bigint                                                  NOT NULL AUTO_INCREMENT COMMENT '用户ID',
    `open_id`     varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '小程序的openId',
#     `dept_id`     bigint                                                  NULL DEFAULT NULL COMMENT '部门ID',
    `account`     varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '用户账号',
    `user_name`   varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '用户姓名',
    `nick_name`   varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '用户昵称',
    `user_type`   varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci   NULL DEFAULT '00' COMMENT '用户类型（00系统用户,01小程序用户）',
    `email`       varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT '' COMMENT '用户邮箱',
    `phone`       varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT '' COMMENT '手机号码',
    `sex`         char(1) CHARACTER SET utf8 COLLATE utf8_general_ci      NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
    `avatar`      varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像地址',
    `salt`        varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '用户加密盐值',
    `password`    varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
    `status`      tinyint                                                 NULL DEFAULT NULL COMMENT '帐号状态（0正常 1停用）',
    `login_ip`    varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
    `login_date`  datetime                                                NULL DEFAULT NULL COMMENT '最后登录时间',
    `create_id`   bigint                                                  NULL DEFAULT NULL COMMENT '创建人id',
    `create_time` datetime                                                NULL DEFAULT NULL COMMENT '创建时间',
    `update_id`   bigint                                                  NULL DEFAULT NULL COMMENT '更新人id',
    `update_time` datetime                                                NULL DEFAULT NULL COMMENT '更新时间',
    `is_delete`   tinyint(1)                                              NULL DEFAULT 0 COMMENT '删除标志',
    `remark`      varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 3
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = '用户中心-用户信息表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of usc_user
-- ----------------------------
INSERT INTO `usc_user`
VALUES (1, NULL, 'admin', '管理员', 'FewCode', '1', '1531137510@qq.com', '00000000000', '0',
        'http://47.100.198.147:7791/picture/logo.png', '439495', '27c3b87192fdaf6c54a0c3de1f339f1d', 1, '127.0.0.1',
        '2020-10-22 00:00:00', 1, '2020-10-22 14:27:04', 1, '2024-04-11 16:51:27', 0, '管理员');
INSERT INTO `usc_user`
VALUES (2, '', 'zhangfuzeng', '普通用户', 'FewCode', '1', '', '', '0', 'http://47.100.198.147:7791/picture/logo.png',
        '816295', '89fd444c0e41275bc23082e82875c1ef', 1, '', NULL, 1, '2024-05-06 16:13:39', 1, '2024-05-06 16:13:39',
        0, '');

-- ----------------------------
-- Table structure for usc_user_role
-- ----------------------------
# DROP TABLE IF EXISTS `usc_user_role`;
# CREATE TABLE `usc_user_role`
# (
#     `id`      bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
#     `user_id` bigint NOT NULL COMMENT '用户ID',
#     `role_id` bigint NOT NULL COMMENT '角色ID',
#     PRIMARY KEY (`id`) USING BTREE,
#     UNIQUE INDEX `UNI_USER_ROLE` (`user_id` ASC, `role_id` ASC) USING BTREE
# ) ENGINE = InnoDB
#   AUTO_INCREMENT = 6
#   CHARACTER SET = utf8
#   COLLATE = utf8_general_ci COMMENT = '用户中心-用户和角色关联表'
#   ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of usc_user_role
-- ----------------------------
# INSERT INTO `usc_user_role`
# VALUES (4, 1, 1);
# INSERT INTO `usc_user_role`
# VALUES (5, 2, 3);

SET FOREIGN_KEY_CHECKS = 1;
