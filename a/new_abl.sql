/*
 Navicat Premium Data Transfer

 Source Server         : 本地测试
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : 127.0.0.1:3306
 Source Schema         : new_abl

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 05/10/2019 22:40:17
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_access_log
-- ----------------------------
DROP TABLE IF EXISTS `t_access_log`;
CREATE TABLE `t_access_log`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `member_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '用户id',
  `real_ip` int(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '真实ip',
  `forwarded_ip` int(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '代理ip',
  `device_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '设备类型',
  `device_model` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '设备型号',
  `device_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '设备名称',
  `device_uuid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '设备唯一标识',
  `device_os` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '设备操作系统',
  `browser` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '浏览器类型',
  `app_version` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '应用版本',
  `app_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '应用名称',
  `app_build` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '应用构建次数',
  `network_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '网络类型',
  `referer_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '来源链接',
  `request_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '请求链接',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建日期',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新日期',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '删除标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '访问日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_browse_record
-- ----------------------------
DROP TABLE IF EXISTS `t_browse_record`;
CREATE TABLE `t_browse_record`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `message_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '信息id',
  `member_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '用户id',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '删除标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户浏览记录信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_business_attestation
-- ----------------------------
DROP TABLE IF EXISTS `t_business_attestation`;
CREATE TABLE `t_business_attestation`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `member_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '用户id',
  `business_type` tinyint(2) NOT NULL DEFAULT 0 COMMENT '企业类型(0：企业 1：商户 2：社会组织)',
  `business_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '企业名称',
  `business_phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '企业电话',
  `business_email` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '企业邮箱',
  `business_logo` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '企业logo',
  `business_website` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '企业网址',
  `business_certificate` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '企业证书',
  `business_scope` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '企业经营范围',
  `business_description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '企业描述',
  `province` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '省',
  `city` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '市',
  `area` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '区',
  `detail_address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '企业详细地址',
  `corporation_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '企业法人姓名',
  `corporation_phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '企业法人电话',
  `audit_status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '审核状态',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '审核备注',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建日期',
  `update_operator_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '审核操作人Id',
  `update_operator_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '审核操作人名称',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新日期',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '删除标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '企业认证信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_collection_record
-- ----------------------------
DROP TABLE IF EXISTS `t_collection_record`;
CREATE TABLE `t_collection_record`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `member_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '用户id',
  `message_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '信息id',
  `collection_status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '收藏状态',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建日期',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新日期',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '删除标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户收藏信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `message_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '信息id',
  `comment_member_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '评论用户id',
  `reply_comment_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '回复评论id',
  `reply_member_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '回复评论用户id',
  `comment_type` tinyint(2) NOT NULL DEFAULT 0 COMMENT '评论类型（0信息评论 1回复评论）',
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '评论内容',
  `read_status` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否已读',
  `audit_status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '审核状态',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '审核留言',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_operator_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '审核操作人Id',
  `update_operator_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '审核操作人名称',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '删除标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '评论信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_commission_config
-- ----------------------------
DROP TABLE IF EXISTS `t_commission_config`;
CREATE TABLE `t_commission_config`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `config_type` tinyint(2) NOT NULL DEFAULT 0 COMMENT '配置类型 1为付款 2为佣金',
  `member_type` tinyint(2) NOT NULL DEFAULT 0 COMMENT '会员类型 1为普通用户 2为运营商',
  `level` tinyint(2) NOT NULL DEFAULT 0 COMMENT '层级',
  `free_amount` bigint(10) NOT NULL DEFAULT 0 COMMENT '免费信息价格或提佣',
  `mouth_amount` bigint(10) NOT NULL DEFAULT 0 COMMENT '月付信息价格或提佣',
  `quarter_amount` bigint(10) NOT NULL DEFAULT 0 COMMENT '季付信息价格或提佣',
  `year_amount` bigint(10) NOT NULL DEFAULT 0 COMMENT '年付信息价格或提佣',
  `upgrade_operator_amount` bigint(10) NOT NULL DEFAULT 0 COMMENT '升级运营商价格或提佣',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_operator_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '操作人Id',
  `update_operator_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '操作人名称',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '删除标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '付费/提佣信息配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_commission_distribution_record
-- ----------------------------
DROP TABLE IF EXISTS `t_commission_distribution_record`;
CREATE TABLE `t_commission_distribution_record`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `member_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '用户id',
  `pay_order_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '支付记录id',
  `level` tinyint(2) NOT NULL DEFAULT 0 COMMENT '层级',
  `commission` bigint(10) NOT NULL DEFAULT 0 COMMENT '佣金分配金额',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '佣金分配备注',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建日期',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新日期',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '删除标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '佣金分配记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_config_center
-- ----------------------------
DROP TABLE IF EXISTS `t_config_center`;
CREATE TABLE `t_config_center`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `config_title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '配置标题',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '配置key',
  `config_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '配置的值',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_operator_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '操作人Id',
  `update_operator_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '操作人名称',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '删除标识（0未删除1已删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '配置中心表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_feedback_reply
-- ----------------------------
DROP TABLE IF EXISTS `t_feedback_reply`;
CREATE TABLE `t_feedback_reply`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `feedback_member_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '反馈用户id',
  `feedback_content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '反馈内容',
  `feedback_status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '反馈状态',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `reply_content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '回复内容',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_operator_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '回复操作人Id',
  `update_operator_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '回复操作人名称',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '删除标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '意见反馈和回复表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_feedback_reply_image
-- ----------------------------
DROP TABLE IF EXISTS `t_feedback_reply_image`;
CREATE TABLE `t_feedback_reply_image`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `feedback_reply_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '意见反馈回复id',
  `image_url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '意见反馈图片',
  `image_type` tinyint(2) NOT NULL DEFAULT 0 COMMENT '图片类型',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '删除标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '意见反馈及回复图片表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_file_meta
-- ----------------------------
DROP TABLE IF EXISTS `t_file_meta`;
CREATE TABLE `t_file_meta`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '文件名',
  `file_size` bigint(20) NOT NULL DEFAULT 0 COMMENT '文件大小',
  `file_ext` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '文件扩展名',
  `file_path` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '文件上传成功地址',
  `file_hash` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '文件hash值',
  `suffix` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '文件上传前缀',
  `storage_type` tinyint(2) NOT NULL DEFAULT 0 COMMENT ' 文件存储类型',
  `category` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '文件种类 消息 头像',
  `application` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '来源的服务',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '删除标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文件上传信息记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_member
-- ----------------------------
DROP TABLE IF EXISTS `t_member`;
CREATE TABLE `t_member`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `member_unique_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '会员uuid',
  `open_id` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '微信用户id',
  `union_id` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '微信union_id',
  `parent_reward_status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '是否已经给上级打赏',
  `phone_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '手机号码',
  `nick_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '昵称',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '真实姓名',
  `image_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '头像',
  `gender` tinyint(2) NOT NULL DEFAULT 0 COMMENT '性别(1：男  2:女)',
  `birthday` date NOT NULL DEFAULT '1900-01-01' COMMENT '出生日期',
  `subscribe_status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '是否关注公众号（0:未关注 1:关注）',
  `auth_status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '是否实名认证(0：未实名 1：实名 2认证中)',
  `account_type` tinyint(2) NOT NULL DEFAULT 3 COMMENT '帐号类型，默认为3:个人、1公司、2商户、4组织',
  `member_status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '会员账号状态',
  `member_type` tinyint(2) NOT NULL DEFAULT 0 COMMENT '会员类型 1为普通用户 2为运营商',
  `message_vip_type` tinyint(2) NOT NULL DEFAULT 0 COMMENT '消息会员类型：（0普通、1按月、2按季）',
  `valid_time` datetime(0) NOT NULL DEFAULT '1900-01-01 00:00:00' COMMENT '打赏过期时间',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '删除标识（0未删除1已删除）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_open_id`(`open_id`) USING BTREE,
  INDEX `idx_create_time`(`create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 123 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_member_account
-- ----------------------------
DROP TABLE IF EXISTS `t_member_account`;
CREATE TABLE `t_member_account`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `member_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '会员id',
  `balance_value` bigint(20) NOT NULL DEFAULT 0 COMMENT '余额金额 单位分',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '删除标识（0未删除1已删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员账户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_member_attestation
-- ----------------------------
DROP TABLE IF EXISTS `t_member_attestation`;
CREATE TABLE `t_member_attestation`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `member_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '用户id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户姓名',
  `phone_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户手机号',
  `id_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户身份证号',
  `id_front_image_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '身份证正面图片',
  `id_back_image_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '身份证反面图片',
  `id_hand_image_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '手持身份证图片',
  `audit_status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '审核状态',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '审核备注',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建日期',
  `update_operator_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '操作人Id',
  `update_operator_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '操作人名称',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新日期',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '删除标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户实名认证表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_member_balance_log
-- ----------------------------
DROP TABLE IF EXISTS `t_member_balance_log`;
CREATE TABLE `t_member_balance_log`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `member_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '会员Id',
  `balance_type` tinyint(2) NOT NULL DEFAULT 0 COMMENT '余额类型',
  `balance_value` bigint(20) NOT NULL DEFAULT 0 COMMENT '增减余额的值',
  `current_balance` bigint(20) NOT NULL DEFAULT 0 COMMENT '当前余额值',
  `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '增减余额描述',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '备注信息',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_operator_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '操作人Id',
  `update_operator_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '操作人名称',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '删除标识（0未删除1已删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员账户余额日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_member_login_log
-- ----------------------------
DROP TABLE IF EXISTS `t_member_login_log`;
CREATE TABLE `t_member_login_log`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `member_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '用户id',
  `member_ip` int(10) NOT NULL DEFAULT 0 COMMENT '用户ip',
  `login_type` tinyint(2) NOT NULL DEFAULT 0 COMMENT '登录类型',
  `login_platform_type` tinyint(2) NOT NULL DEFAULT 0 COMMENT '登录平台类型',
  `country` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '国家',
  `province` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '省份',
  `city` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '城市',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建日期',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新日期',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '删除标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户登录日志信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_member_notice
-- ----------------------------
DROP TABLE IF EXISTS `t_member_notice`;
CREATE TABLE `t_member_notice`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `member_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '会员ID',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '消息通知标题',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '消息通知内容',
  `message_type` tinyint(2) NOT NULL DEFAULT 0 COMMENT '消息通知类型',
  `message_url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '消息通知关联地址',
  `read_status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '阅读状态',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建日期',
  `update_operator_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '审核操作人Id',
  `update_operator_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '审核操作人名称',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新日期',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '删除标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统消息通知表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_member_relate_level
-- ----------------------------
DROP TABLE IF EXISTS `t_member_relate_level`;
CREATE TABLE `t_member_relate_level`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `member_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '会员id',
  `parent_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '上级id',
  `level` tinyint(2) NOT NULL DEFAULT 1 COMMENT '层级',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '删除标识（0未删除1已删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员多级关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_member_search_key
-- ----------------------------
DROP TABLE IF EXISTS `t_member_search_key`;
CREATE TABLE `t_member_search_key`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `member_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '用户Id',
  `search_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '搜索词',
  `latitude` decimal(20, 17) NOT NULL DEFAULT 0.00000000000000000 COMMENT '纬度',
  `longitude` decimal(20, 17) NOT NULL DEFAULT 0.00000000000000000 COMMENT '经度',
  `client_ip` int(10) NOT NULL DEFAULT 0 COMMENT 'ip地址',
  `terminal_type` tinyint(2) NOT NULL DEFAULT 0 COMMENT '客户端类型',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '删除标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '搜索关键词记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_message
-- ----------------------------
DROP TABLE IF EXISTS `t_message`;
CREATE TABLE `t_message`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `message_unique_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT ' 消息唯一uuid',
  `member_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '用户Id',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `content` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '内容',
  `address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '地址',
  `detail_address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '详细地址',
  `phone_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户手机号',
  `telephone_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户座机号',
  `pay_status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '付费状态',
  `pay_type` tinyint(2) NOT NULL DEFAULT 0 COMMENT '付费类型(0免费，1月付，2季付)',
  `view_number` bigint(20) NOT NULL DEFAULT 0 COMMENT '浏览量',
  `increase_view_number` bigint(20) NOT NULL DEFAULT 0 COMMENT '虚拟浏览量',
  `latitude` decimal(20, 17) NOT NULL DEFAULT 0.00000000000000000 COMMENT '纬度',
  `longitude` decimal(20, 17) NOT NULL DEFAULT 0.00000000000000000 COMMENT '经度',
  `message_type` tinyint(2) NOT NULL DEFAULT 0 COMMENT '信息类型(1企业，2商户 ，3个人，4其他)',
  `audit_status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '状态(0待审核、1已审核(通过奖励)、2不通过、3通过不奖励)',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '审核反馈详情',
  `release_status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '发布状态',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_operator_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '操作人Id',
  `update_operator_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '操作人名称',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '删除标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_message_image_url
-- ----------------------------
DROP TABLE IF EXISTS `t_message_image_url`;
CREATE TABLE `t_message_image_url`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `message_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '信息id',
  `imag_url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '图片地址',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '删除标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '信息图片表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_operator_advert
-- ----------------------------
DROP TABLE IF EXISTS `t_operator_advert`;
CREATE TABLE `t_operator_advert`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `member_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '用户id',
  `advert_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '广告名称',
  `advert_image_url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '广告图图片地址',
  `advert_url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '广告链接',
  `advert_text` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '广告文字',
  `audit_status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '审核状态',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '审核信息',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建日期',
  `update_operator_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '审核操作人Id',
  `update_operator_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '审核操作人名称',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新日期',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '删除标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '运营商广告图信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_pay_order
-- ----------------------------
DROP TABLE IF EXISTS `t_pay_order`;
CREATE TABLE `t_pay_order`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `member_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '会员Id',
  `order_type` tinyint(2) NOT NULL DEFAULT 0 COMMENT '订单类型 1 消息发布 2成为运营商',
  `order_num` bigint(20) NOT NULL DEFAULT 0 COMMENT '订单号',
  `biz_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '业务关联Id',
  `duration_type` tinyint(2) NOT NULL DEFAULT 0 COMMENT '购买服务时长类型',
  `payment_type` tinyint(2) NOT NULL DEFAULT 0 COMMENT '支付方式  1支付宝 2微信',
  `client_ip` int(10) NOT NULL DEFAULT 0 COMMENT '客户端Ip',
  `terminal_type` tinyint(2) NOT NULL DEFAULT 0 COMMENT '客户端类型',
  `pay_number` bigint(20) NOT NULL COMMENT '支付单号',
  `pay_order_status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '支付订单状态',
  `pay_time` datetime(0) NOT NULL DEFAULT '1900-01-01 00:00:00' COMMENT '支付成功时间',
  `total_price` bigint(10) NOT NULL DEFAULT 0 COMMENT '总金额',
  `order_price` bigint(10) NOT NULL DEFAULT 0 COMMENT '订单金额',
  `gateway_pay_money` bigint(20) NOT NULL DEFAULT 0 COMMENT '网关付款金额',
  `gateway_collection` bigint(20) NOT NULL DEFAULT 0 COMMENT '网关实收款金额',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `update_operator_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '操作人Id',
  `update_operator_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '操作人名称',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '删除标识（0未删除  1已删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '支付订单记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_payment_gateway
-- ----------------------------
DROP TABLE IF EXISTS `t_payment_gateway`;
CREATE TABLE `t_payment_gateway`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `pay_number` bigint(20) NOT NULL DEFAULT 0 COMMENT '交易单号 支付单号',
  `biz_num` bigint(20) NOT NULL DEFAULT 0 COMMENT '关联业务单号',
  `platform` tinyint(2) NOT NULL DEFAULT 0 COMMENT '平台类型',
  `consume_type` tinyint(2) NOT NULL DEFAULT 0 COMMENT '消费类型 ',
  `gateway_type` tinyint(2) NOT NULL DEFAULT 0 COMMENT '网关支付方式',
  `gateway_trade_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '网关交易单号（网关返回）',
  `gateway_prepay_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '网关预支付单号（网关支付返回）',
  `amount` bigint(20) NOT NULL DEFAULT 0 COMMENT '网关支付金额 单位分',
  `body` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '描述信息',
  `show_url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '展示URL信息',
  `trade_expire_time` datetime(0) NOT NULL DEFAULT '1900-01-01 00:00:00' COMMENT '交易有效期',
  `bank_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '银行名称',
  `pay_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '状态：PRE_PAYING,PRE_PAY_FAILED,PAYING,PAY_SUCCESS,PAY_FAILED',
  `gateway_actual_pay_amount` bigint(20) NOT NULL DEFAULT 0 COMMENT '网关实际支付金额',
  `gateway_fee` bigint(20) NOT NULL DEFAULT 0 COMMENT '网关手续费',
  `notify_url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '异步通知地址',
  `callback_url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '交易回调地址',
  `client_type` tinyint(2) NOT NULL DEFAULT 0 COMMENT '客户端类型',
  `client_ip` int(10) NOT NULL DEFAULT 0 COMMENT '客户端ip',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `gateway_actual_pay_time` datetime(0) NOT NULL DEFAULT '1900-01-01 00:00:00' COMMENT '网关实际支付时间',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `update_operator_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '操作人Id',
  `update_operator_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '操作人名称',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '删除标识 0为未删除 1为已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '支付网关信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_payment_gateway_notification
-- ----------------------------
DROP TABLE IF EXISTS `t_payment_gateway_notification`;
CREATE TABLE `t_payment_gateway_notification`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `biz_num` bigint(20) NOT NULL DEFAULT 0 COMMENT '关联业务单号',
  `notify_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '通知类型',
  `status_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '通知状态码',
  `content` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '通知内容',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '删除标识 0未删除 1已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '网关支付回调信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_platform_advert
-- ----------------------------
DROP TABLE IF EXISTS `t_platform_advert`;
CREATE TABLE `t_platform_advert`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `advert_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '广告名称',
  `advent_image_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '广告图片',
  `advent_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '广告链接',
  `advent_text` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '广告文本',
  `show_order` tinyint(2) NOT NULL DEFAULT 0 COMMENT '广告展示顺序',
  `release_status` bit(1) NOT NULL DEFAULT b'0' COMMENT '展示状态',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建日期',
  `update_operator_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '操作人Id',
  `update_operator_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '操作人名称',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新日期',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '删除标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统平台广告轮播图信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_platform_article
-- ----------------------------
DROP TABLE IF EXISTS `t_platform_article`;
CREATE TABLE `t_platform_article`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `content` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '内容',
  `show_order` tinyint(2) NOT NULL DEFAULT 0 COMMENT '展示标识',
  `article_type` tinyint(2) NOT NULL DEFAULT 0 COMMENT '类型',
  `article_status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '上下架状态',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建日期',
  `update_operator_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '操作人Id',
  `update_operator_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '操作人名称',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新日期',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '删除标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_sms_log
-- ----------------------------
DROP TABLE IF EXISTS `t_sms_log`;
CREATE TABLE `t_sms_log`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `member_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '用户Id',
  `md5` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '消息hash值',
  `business_type` tinyint(2) NOT NULL DEFAULT 0 COMMENT '业务类型',
  `platform_type` tinyint(2) NOT NULL DEFAULT 0 COMMENT '平台类型',
  `message_type` tinyint(2) NOT NULL DEFAULT 0 COMMENT '消息类型',
  `status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '消息状态',
  `reason` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '原因',
  `mobile_numbers` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '电话号码',
  `content` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '短信内容',
  `execute_nums` int(4) NOT NULL DEFAULT 0 COMMENT '循环次数',
  `template_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '模板id',
  `template_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '模板名称',
  `send_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '发送时间',
  `deliver_status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '推送状态',
  `deliver_code` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '推送码',
  `deliver_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '推送时间',
  `sign` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '短信签名',
  `placeholder_values` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '占位符内容',
  `provider_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '短信平台供应商id',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '删除标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '短信发送系统' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_system_area
-- ----------------------------
DROP TABLE IF EXISTS `t_system_area`;
CREATE TABLE `t_system_area`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `parent_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '父级ID',
  `area_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '地区名称',
  `area_other_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '其他名称',
  `post_code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '邮政编码',
  `tel_no` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '电话区号',
  `initial` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '地区首字母索引',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_operator_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '更新人ID',
  `update_operator_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '更新人名称',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '删除标识 0为未删除 1为已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '地区信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_system_ip
-- ----------------------------
DROP TABLE IF EXISTS `t_system_ip`;
CREATE TABLE `t_system_ip`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `ip_num` int(11) NOT NULL DEFAULT 0 COMMENT 'ip地址 数值存储',
  `ip_address` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'ip地址 字符存储',
  `country` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '国家',
  `province` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '省',
  `city` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '市',
  `sp` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '运营商',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '删除标识 0为未删除 1为已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'ip信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_system_log
-- ----------------------------
DROP TABLE IF EXISTS `t_system_log`;
CREATE TABLE `t_system_log`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `log_type` tinyint(2) NOT NULL DEFAULT 0 COMMENT '日志类型',
  `business_no` bigint(20) NOT NULL DEFAULT 0 COMMENT '业务关联单号',
  `log_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '日志内容',
  `operator_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '操作者Id',
  `operator_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '操作人名称',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '删除标识 0为未删除 1为已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_system_mobile
-- ----------------------------
DROP TABLE IF EXISTS `t_system_mobile`;
CREATE TABLE `t_system_mobile`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `mobile` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `province` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '所在省',
  `city` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '市',
  `sp` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '运营商',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '手机号信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_wechat_location
-- ----------------------------
DROP TABLE IF EXISTS `t_wechat_location`;
CREATE TABLE `t_wechat_location`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `to_user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '开发者微信号',
  `from_user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '发送方帐号（一个OpenID）',
  `event` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '事件类型',
  `msg_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '消息类型(event)',
  `latitude` decimal(20, 17) NOT NULL DEFAULT 0.00000000000000000 COMMENT '地理位置纬度',
  `longitude` decimal(20, 17) NOT NULL DEFAULT 0.00000000000000000 COMMENT '地理位置经度',
  `location_precision` decimal(20, 10) NOT NULL DEFAULT 0.0000000000 COMMENT '地理位置精度',
  `address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '地址',
  `address_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '地址名称',
  `address_area_text` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '地址区域文本',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新日期',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '删除标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 131 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '微信上报地理位置信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_wechat_message
-- ----------------------------
DROP TABLE IF EXISTS `t_wechat_message`;
CREATE TABLE `t_wechat_message`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `to_user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '开发者微信号',
  `from_user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '发送方帐号（一个OpenID）',
  `event` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '事件类型',
  `msg_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '消息类型(event)',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '消息内容',
  `media_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '媒体文件地址',
  `media_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '媒体id',
  `media_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '媒体文件名称',
  `url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '消息url',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '描述',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '删除标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '微信消息信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_wechat_mp_user
-- ----------------------------
DROP TABLE IF EXISTS `t_wechat_mp_user`;
CREATE TABLE `t_wechat_mp_user`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `member_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '关联的会员id',
  `subscribe_status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '是否关注公众号（0:未关注 1:关注）',
  `nick_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '昵称',
  `avatar_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '微信头像微信端',
  `head_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '微信头像本地端',
  `gender` tinyint(2) NOT NULL DEFAULT 0 COMMENT '性别',
  `province` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '省',
  `city` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '城市',
  `country` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '国家',
  `open_id` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '公众号唯一id',
  `union_id` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '开放平台id',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '删除标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '微信公众号粉丝表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_withdraw_cash_record
-- ----------------------------
DROP TABLE IF EXISTS `t_withdraw_cash_record`;
CREATE TABLE `t_withdraw_cash_record`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `member_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '用户ID',
  `amount` bigint(20) NOT NULL DEFAULT 0 COMMENT '现金值',
  `withdraw_type` tinyint(2) NOT NULL DEFAULT 0 COMMENT '提现方式（0微信 1支付宝）',
  `audit_type` tinyint(2) NOT NULL DEFAULT 0 COMMENT '审核类型(0自动审核 1人工审核)',
  `audit_status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '审核状态(0待审核 1已审核 2已拒绝)',
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_operator_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '审核操作人Id',
  `update_operator_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '审核操作人名称',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '删除标识（0未删除  1已删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户提现记录表' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
