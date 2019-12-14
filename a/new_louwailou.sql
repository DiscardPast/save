/*
 Navicat Premium Data Transfer

 Source Server         : 本地测试
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : 127.0.0.1:3306
 Source Schema         : new_louwailou

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 20/10/2019 21:47:12
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_follow_record
-- ----------------------------
DROP TABLE IF EXISTS `t_follow_record`;
CREATE TABLE `t_follow_record`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `follow_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '跟进时间',
  `follow_content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '跟进记录',
  `follow_status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '跟进状态(0跟进中,1未开始,2已失效)',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '删除标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '跟进记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_house
-- ----------------------------
DROP TABLE IF EXISTS `t_house`;
CREATE TABLE `t_house`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `project_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '所属项目id',
  `area` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '房屋面积',
  `price` bigint(10) NOT NULL DEFAULT 0 COMMENT '房屋价格',
  `types` tinyint(2) NOT NULL DEFAULT 0 COMMENT '房屋类型(1公寓 2住宅 3商铺)',
  `structure` tinyint(2) NOT NULL DEFAULT 0 COMMENT '房屋结构',
  `address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '房屋地址',
  `open_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '开盘时间',
  `apartment` tinyint(2) NOT NULL DEFAULT 0 COMMENT '房屋户型',
  `beat` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '房屋所在区域',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '房屋标题',
  `consultant_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '房屋置业顾问所见标题',
  `content` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '房屋信息',
  `bouns` bigint(10) NOT NULL DEFAULT 0 COMMENT '房屋赏金',
  `tips` varchar(50) CHARACTER SET utf16 COLLATE utf16_general_ci NOT NULL DEFAULT '' COMMENT '房屋标识(临地铁...等等)',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '删除标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '房屋信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_house_apartment
-- ----------------------------
DROP TABLE IF EXISTS `t_house_apartment`;
CREATE TABLE `t_house_apartment`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `house_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '房屋id',
  `house_apartment_id` tinyint(2) NOT NULL DEFAULT 0 COMMENT '房屋户型id',
  `image_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '户型图片',
  `text` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '户型描述',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bigint(1) NOT NULL DEFAULT 0 COMMENT '删除标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '房屋户型信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_house_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_house_comment`;
CREATE TABLE `t_house_comment`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `house_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '房屋信息id',
  `comment_member_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '评论用户id',
  `reply_comment_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '回复评论id',
  `reply_member_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '回复评论用户id',
  `comment_type` tinyint(2) NOT NULL DEFAULT 0 COMMENT '评论类型（0信息评论 1回复评论）',
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '评论内容',
  `read_status` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否已读',
  `like` tinyint(10) NOT NULL DEFAULT 0 COMMENT '点赞数量',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '删除标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '房屋评论信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_house_image
-- ----------------------------
DROP TABLE IF EXISTS `t_house_image`;
CREATE TABLE `t_house_image`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `house_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '房屋id',
  `image_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '房屋图片地址',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '删除标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '房屋信息图片表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_project
-- ----------------------------
DROP TABLE IF EXISTS `t_project`;
CREATE TABLE `t_project`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `developer` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '开发商',
  `region` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '区域',
  `sale_status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '售卖状态(0在售,1告罄,2未开盘)',
  `property_years` tinyint(5) NOT NULL DEFAULT 0 COMMENT '产权年限',
  `property_type` tinyint(2) NOT NULL DEFAULT 0 COMMENT '物业类别(0住宅,1商铺,2公寓,3写字楼)',
  `volume_rate` tinyint(5) NOT NULL DEFAULT 0 COMMENT '容积率',
  `greening_rate` tinyint(5) NOT NULL DEFAULT 0 COMMENT '绿化率',
  `households_num` tinyint(5) NOT NULL DEFAULT 0 COMMENT '楼栋总户数',
  `property_company` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '物业公司',
  `property_costs` tinyint(5) NOT NULL DEFAULT 0 COMMENT '物业费',
  `decoration_status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '装修状况(0毛坯,1精装,2豪装)',
  `handing_house_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '交房时间',
  `parking_space` bigint(10) NOT NULL DEFAULT 0 COMMENT '车位',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '删除标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '项目信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_project_trends
-- ----------------------------
DROP TABLE IF EXISTS `t_project_trends`;
CREATE TABLE `t_project_trends`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '标签',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '内容',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '删除标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '项目动态信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_staff
-- ----------------------------
DROP TABLE IF EXISTS `t_staff`;
CREATE TABLE `t_staff`  (
  `id` tinyint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '员工编码',
  `gender` tinyint(2) NOT NULL DEFAULT 0 COMMENT '员工性别',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '员工姓名',
  `phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '员工电话',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '员工账号',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '员工密码',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '删除标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '员工表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `staff_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '员工id',
  `open_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '微信登录唯一key',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '昵称',
  `gender` tinyint(2) NOT NULL DEFAULT 0 COMMENT '性别(0未设置,1男,2女)',
  `avatar` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '头像',
  `user_type` tinyint(2) NOT NULL DEFAULT 0 COMMENT '用户类型(0普通用户,1置业顾问,2员工)',
  `language` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '语言',
  `country` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '国家',
  `province` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '省份',
  `city` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '城市',
  `id_card_front` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '身份证正面',
  `visiting_card` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '名片',
  `phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '电话',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '删除标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_collection
-- ----------------------------
DROP TABLE IF EXISTS `t_user_collection`;
CREATE TABLE `t_user_collection`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '用户id',
  `house_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '房屋id',
  `collection_status` bit(1) NOT NULL DEFAULT b'0' COMMENT '收藏状态',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '删除标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户收藏表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_intention
-- ----------------------------
DROP TABLE IF EXISTS `t_user_intention`;
CREATE TABLE `t_user_intention`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `house_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '房屋id',
  `user_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '用户id',
  `follow_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '跟进记录id',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `take_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '带看时间',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '删除标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户意向表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_recommend
-- ----------------------------
DROP TABLE IF EXISTS `t_user_recommend`;
CREATE TABLE `t_user_recommend`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '用户id',
  `house_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '房屋id',
  `staff_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '员工id',
  `follow_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '跟进记录id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '姓名',
  `phone` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '电话',
  `gender` tinyint(20) NOT NULL DEFAULT 0 COMMENT '性别(0未设置,1男,2女)',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '删除标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户推荐表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_withdraw
-- ----------------------------
DROP TABLE IF EXISTS `t_withdraw`;
CREATE TABLE `t_withdraw`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '用户id',
  `admin_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '管理员id',
  `status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '提现状态(0待提现，1已提现)',
  `amount` bigint(10) NOT NULL DEFAULT 0 COMMENT '金额',
  `counterfoil` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '票据存根',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '删除标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户提现表' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
