/*
 Navicat Premium Data Transfer

 Source Server         : server
 Source Server Type    : MySQL
 Source Server Version : 80403
 Source Host           : 47.109.76.15:3306
 Source Schema         : mysystem

 Target Server Type    : MySQL
 Target Server Version : 80403
 File Encoding         : 65001

 Date: 17/12/2024 22:51:25
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id` ASC, `permission_id` ASC) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id` ASC) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id` ASC, `codename` ASC) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add permission', 1, 'add_permission');
INSERT INTO `auth_permission` VALUES (2, 'Can change permission', 1, 'change_permission');
INSERT INTO `auth_permission` VALUES (3, 'Can delete permission', 1, 'delete_permission');
INSERT INTO `auth_permission` VALUES (4, 'Can view permission', 1, 'view_permission');
INSERT INTO `auth_permission` VALUES (5, 'Can add group', 2, 'add_group');
INSERT INTO `auth_permission` VALUES (6, 'Can change group', 2, 'change_group');
INSERT INTO `auth_permission` VALUES (7, 'Can delete group', 2, 'delete_group');
INSERT INTO `auth_permission` VALUES (8, 'Can view group', 2, 'view_group');
INSERT INTO `auth_permission` VALUES (9, 'Can add user', 3, 'add_user');
INSERT INTO `auth_permission` VALUES (10, 'Can change user', 3, 'change_user');
INSERT INTO `auth_permission` VALUES (11, 'Can delete user', 3, 'delete_user');
INSERT INTO `auth_permission` VALUES (12, 'Can view user', 3, 'view_user');
INSERT INTO `auth_permission` VALUES (13, 'Can add content type', 4, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (14, 'Can change content type', 4, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (15, 'Can delete content type', 4, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (16, 'Can view content type', 4, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (17, 'Can add session', 5, 'add_session');
INSERT INTO `auth_permission` VALUES (18, 'Can change session', 5, 'change_session');
INSERT INTO `auth_permission` VALUES (19, 'Can delete session', 5, 'delete_session');
INSERT INTO `auth_permission` VALUES (20, 'Can view session', 5, 'view_session');
INSERT INTO `auth_permission` VALUES (21, 'Can add sys user', 6, 'add_sysuser');
INSERT INTO `auth_permission` VALUES (22, 'Can change sys user', 6, 'change_sysuser');
INSERT INTO `auth_permission` VALUES (23, 'Can delete sys user', 6, 'delete_sysuser');
INSERT INTO `auth_permission` VALUES (24, 'Can view sys user', 6, 'view_sysuser');
INSERT INTO `auth_permission` VALUES (25, 'Can add teacher', 7, 'add_teacher');
INSERT INTO `auth_permission` VALUES (26, 'Can change teacher', 7, 'change_teacher');
INSERT INTO `auth_permission` VALUES (27, 'Can delete teacher', 7, 'delete_teacher');
INSERT INTO `auth_permission` VALUES (28, 'Can view teacher', 7, 'view_teacher');
INSERT INTO `auth_permission` VALUES (29, 'Can add comment', 8, 'add_comment');
INSERT INTO `auth_permission` VALUES (30, 'Can change comment', 8, 'change_comment');
INSERT INTO `auth_permission` VALUES (31, 'Can delete comment', 8, 'delete_comment');
INSERT INTO `auth_permission` VALUES (32, 'Can view comment', 8, 'view_comment');
INSERT INTO `auth_permission` VALUES (33, 'Can add classification', 9, 'add_classification');
INSERT INTO `auth_permission` VALUES (34, 'Can change classification', 9, 'change_classification');
INSERT INTO `auth_permission` VALUES (35, 'Can delete classification', 9, 'delete_classification');
INSERT INTO `auth_permission` VALUES (36, 'Can view classification', 9, 'view_classification');
INSERT INTO `auth_permission` VALUES (37, 'Can add tag', 10, 'add_tag');
INSERT INTO `auth_permission` VALUES (38, 'Can change tag', 10, 'change_tag');
INSERT INTO `auth_permission` VALUES (39, 'Can delete tag', 10, 'delete_tag');
INSERT INTO `auth_permission` VALUES (40, 'Can view tag', 10, 'view_tag');
INSERT INTO `auth_permission` VALUES (41, 'Can add post', 11, 'add_post');
INSERT INTO `auth_permission` VALUES (42, 'Can change post', 11, 'change_post');
INSERT INTO `auth_permission` VALUES (43, 'Can delete post', 11, 'delete_post');
INSERT INTO `auth_permission` VALUES (44, 'Can view post', 11, 'view_post');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id` ASC, `group_id` ASC) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id` ASC) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id` ASC, `permission_id` ASC) USING BTREE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`(`permission_id` ASC) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for classfication
-- ----------------------------
DROP TABLE IF EXISTS `classfication`;
CREATE TABLE `classfication`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `classname` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of classfication
-- ----------------------------
INSERT INTO `classfication` VALUES (1, '小学');
INSERT INTO `classfication` VALUES (2, '初中');
INSERT INTO `classfication` VALUES (3, '高中');
INSERT INTO `classfication` VALUES (4, '美术');
INSERT INTO `classfication` VALUES (5, '书法');
INSERT INTO `classfication` VALUES (6, '体育');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `comment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `teacher_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `comment_teacher_id_9b7e6e84_fk_teacher_id`(`teacher_id` ASC) USING BTREE,
  INDEX `comment_user_id_2224f9d1_fk_sys_user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `comment_teacher_id_9b7e6e84_fk_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `comment_user_id_2224f9d1_fk_sys_user_id` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (1, '2024-12-09 14:53:52.096859', '?', 3, 1);
INSERT INTO `comment` VALUES (2, '2024-12-09 14:53:52.209544', '非常好', 11, 22);
INSERT INTO `comment` VALUES (3, '2024-12-09 14:53:52.320100', '非常好', 7, 13);
INSERT INTO `comment` VALUES (4, '2024-12-09 14:53:52.435132', '老师讲的很认真', 1, 19);
INSERT INTO `comment` VALUES (5, '2024-12-09 14:53:52.551970', '?', 7, 3);
INSERT INTO `comment` VALUES (6, '2024-12-09 14:53:52.658564', '老师讲的很认真', 3, 25);
INSERT INTO `comment` VALUES (7, '2024-12-09 14:53:52.760084', '这个老师很负责', 1, 9);
INSERT INTO `comment` VALUES (8, '2024-12-09 14:53:52.876213', '?', 4, 29);
INSERT INTO `comment` VALUES (9, '2024-12-09 14:53:52.989174', '老师讲的很认真', 7, 27);
INSERT INTO `comment` VALUES (10, '2024-12-09 14:53:53.104642', '老师讲的很认真', 11, 15);
INSERT INTO `comment` VALUES (11, '2024-12-09 14:53:53.232635', '非常负责人的老师', 2, 10);
INSERT INTO `comment` VALUES (12, '2024-12-09 14:53:53.349040', '?', 4, 3);
INSERT INTO `comment` VALUES (13, '2024-12-09 14:53:53.462931', '非常负责人的老师', 8, 18);
INSERT INTO `comment` VALUES (14, '2024-12-09 14:53:53.569729', '老师讲的很认真', 3, 6);
INSERT INTO `comment` VALUES (15, '2024-12-09 14:53:53.668743', '老师讲的很认真', 7, 28);
INSERT INTO `comment` VALUES (16, '2024-12-09 14:53:53.785085', '?', 9, 21);
INSERT INTO `comment` VALUES (17, '2024-12-09 14:53:53.891063', '非常好', 5, 25);
INSERT INTO `comment` VALUES (18, '2024-12-09 14:53:53.998916', '非常棒', 7, 29);
INSERT INTO `comment` VALUES (19, '2024-12-09 14:53:54.099828', '这个老师很负责', 7, 11);
INSERT INTO `comment` VALUES (20, '2024-12-09 14:53:54.197190', '非常棒', 8, 24);

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label` ASC, `model` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (2, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (1, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (4, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (5, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (9, 'system', 'classification');
INSERT INTO `django_content_type` VALUES (8, 'system', 'comment');
INSERT INTO `django_content_type` VALUES (11, 'system', 'post');
INSERT INTO `django_content_type` VALUES (6, 'system', 'sysuser');
INSERT INTO `django_content_type` VALUES (10, 'system', 'tag');
INSERT INTO `django_content_type` VALUES (7, 'system', 'teacher');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'system', '0001_initial', '2024-12-09 14:45:44.190627');
INSERT INTO `django_migrations` VALUES (2, 'contenttypes', '0001_initial', '2024-12-09 14:52:10.172888');
INSERT INTO `django_migrations` VALUES (3, 'contenttypes', '0002_remove_content_type_name', '2024-12-09 14:52:10.241464');
INSERT INTO `django_migrations` VALUES (4, 'auth', '0001_initial', '2024-12-09 14:52:11.044697');
INSERT INTO `django_migrations` VALUES (5, 'auth', '0002_alter_permission_name_max_length', '2024-12-09 14:52:11.120311');
INSERT INTO `django_migrations` VALUES (6, 'auth', '0003_alter_user_email_max_length', '2024-12-09 14:52:11.147109');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0004_alter_user_username_opts', '2024-12-09 14:52:11.159060');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0005_alter_user_last_login_null', '2024-12-09 14:52:11.218851');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0006_require_contenttypes_0002', '2024-12-09 14:52:11.224577');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0007_alter_validators_add_error_messages', '2024-12-09 14:52:11.236849');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0008_alter_user_username_max_length', '2024-12-09 14:52:11.305965');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0009_alter_user_last_name_max_length', '2024-12-09 14:52:11.375842');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0010_alter_group_name_max_length', '2024-12-09 14:52:11.399970');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0011_update_proxy_permissions', '2024-12-09 14:52:11.415910');
INSERT INTO `django_migrations` VALUES (15, 'auth', '0012_alter_user_first_name_max_length', '2024-12-09 14:52:11.487645');
INSERT INTO `django_migrations` VALUES (16, 'sessions', '0001_initial', '2024-12-09 14:52:11.535319');
INSERT INTO `django_migrations` VALUES (17, 'system', '0002_classification_tag', '2024-12-09 16:25:01.853058');
INSERT INTO `django_migrations` VALUES (18, 'system', '0003_rename_classname_classification_class_id', '2024-12-09 16:27:49.685840');
INSERT INTO `django_migrations` VALUES (19, 'system', '0004_rename_class_id_classification_classname', '2024-12-10 04:27:33.501114');
INSERT INTO `django_migrations` VALUES (20, 'system', '0005_alter_classification_classname', '2024-12-10 04:27:33.525937');
INSERT INTO `django_migrations` VALUES (21, 'system', '0006_alter_tag_tagname', '2024-12-10 05:05:37.772762');
INSERT INTO `django_migrations` VALUES (22, 'system', '0007_teacher_classification', '2024-12-10 09:55:16.178663');
INSERT INTO `django_migrations` VALUES (23, 'system', '0008_alter_teacher_classification', '2024-12-10 09:56:24.087449');
INSERT INTO `django_migrations` VALUES (24, 'system', '0009_teacher_popularity', '2024-12-10 11:51:41.252633');
INSERT INTO `django_migrations` VALUES (25, 'system', '0010_teacher_city', '2024-12-11 05:53:36.210335');
INSERT INTO `django_migrations` VALUES (26, 'system', '0011_post', '2024-12-11 08:35:45.720053');
INSERT INTO `django_migrations` VALUES (27, 'system', '0012_remove_post_hourly_rate_post_hprice_sysuser_age', '2024-12-11 08:42:02.012801');
INSERT INTO `django_migrations` VALUES (28, 'system', '0013_remove_post_student_age_remove_post_subject_post_tag_and_more', '2024-12-11 08:45:26.766840');
INSERT INTO `django_migrations` VALUES (29, 'system', '0014_teacher_tags', '2024-12-11 09:58:54.967881');
INSERT INTO `django_migrations` VALUES (30, 'system', '0015_alter_teacher_tags', '2024-12-11 10:00:59.447485');
INSERT INTO `django_migrations` VALUES (31, 'system', '0016_alter_teacher_tags', '2024-12-11 10:00:59.486293');
INSERT INTO `django_migrations` VALUES (32, 'system', '0017_remove_teacher_tags_teacher_tags', '2024-12-11 10:02:11.908830');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------

-- ----------------------------
-- Table structure for post
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `grade_id` int NULL DEFAULT NULL,
  `weekly_lessons` int NOT NULL,
  `lesson_duration` int NOT NULL,
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `require` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `teacher_id` int NULL DEFAULT NULL,
  `user_id` int NOT NULL,
  `hprice` int NOT NULL,
  `tag_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `post_teacher_id_5f649805_fk_teacher_id`(`teacher_id` ASC) USING BTREE,
  INDEX `post_user_id_e5dbe93c_fk_sys_user_id`(`user_id` ASC) USING BTREE,
  INDEX `post_tag_id_7ed024ab_fk_tag_id`(`tag_id` ASC) USING BTREE,
  INDEX `post_grade_id_2dd75089`(`grade_id` ASC) USING BTREE,
  CONSTRAINT `post_grade_id_2dd75089_fk_classfication_id` FOREIGN KEY (`grade_id`) REFERENCES `classfication` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `post_tag_id_7ed024ab_fk_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `post_teacher_id_5f649805_fk_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `post_user_id_e5dbe93c_fk_sys_user_id` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of post
-- ----------------------------
INSERT INTO `post` VALUES (1, '2024-12-11 12:40:00.284736', 3, 2, 90, '重庆市', '1', NULL, 1, 100, 4);
INSERT INTO `post` VALUES (2, '2024-12-11 12:49:53.938647', 2, 2, 90, '北京市', '123', NULL, 1, 100, 5);
INSERT INTO `post` VALUES (3, '2024-12-16 10:45:37.690230', 3, 3, 120, '北京市', '无', NULL, 2, 100, 4);
INSERT INTO `post` VALUES (4, '2024-12-16 11:25:36.227078', 3, 2, 90, '上海市', '1', NULL, 1, 300, 2);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nickname` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `phonenumber` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `role` int NOT NULL,
  `status` int NOT NULL,
  `email` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime(6) NOT NULL,
  `age` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', 'pbkdf2_sha256$600000$rbGv8sLqqbhaP2ldkXSD3P$a473VBqkDgs06B9khlMhkbFa9wU60HNTJ1KoiE92Y+Y=', 'admin', NULL, NULL, 0, 0, 'qXOq6uUr@gmail.com', '2024-12-05 07:01:42.360365', 16);
INSERT INTO `sys_user` VALUES (2, 'LK7RJk1', 'pbkdf2_sha256$600000$1F93t2xdUcuup4RRwE8p3G$+p5bJTs49vXdOHdheu8FN6vwj9r/JUGaurZv8+Oigy0=', 'LK7RJk1', NULL, NULL, 1, 0, 'RTaeE@gmail.com', '2024-12-05 07:01:42.824020', 16);
INSERT INTO `sys_user` VALUES (3, 'FZ63V5T', 'pbkdf2_sha256$600000$QOzapLjzayRRpLqK8EawDR$S74TXumOgv+xsZ+0sEOF4KcCJAN8fstj1cOwIuyUAT0=', 'FZ63V5T', NULL, NULL, 1, 0, 'PUcyM@qq.com', '2024-12-05 07:01:43.280198', 16);
INSERT INTO `sys_user` VALUES (4, 'rjh6R', 'pbkdf2_sha256$600000$GHMTojMxBkKGucJERI77vH$MK60Cq8IZj4yyx3fYaPPFYlqjHbkAzCk8uPXsmcrbuI=', 'rjh6R', NULL, NULL, 1, 0, '3oZYDkS43A@qq.com', '2024-12-05 07:01:43.738989', 16);
INSERT INTO `sys_user` VALUES (5, 's6CPO9L3', 'pbkdf2_sha256$600000$BYfwqQWNHicllWf41tUO8V$fs+jETYSNoafVR8KGMjWm/R31ABxoVYLdRK6mrp8pHc=', 's6CPO9L3', NULL, NULL, 1, 0, 'XvzIKM2g@163.com', '2024-12-05 07:01:44.186331', 16);
INSERT INTO `sys_user` VALUES (6, 'JcBbvSi', 'pbkdf2_sha256$600000$LdBg43bo7d7d612hd5cIwi$uobL0OrwnH+5nAOgU4Z8fUHWLhOBBH0jYyb/kKhQt7Y=', 'JcBbvSi', NULL, NULL, 1, 0, 'v5N7vYfd9@163.com', '2024-12-05 07:01:44.629776', 16);
INSERT INTO `sys_user` VALUES (7, '4qZBi5W', 'pbkdf2_sha256$600000$eNM5yJqy0KgBWJ3w48vYmW$L4a48Yr5mqzy/AUxdN3vpDl932CsCu4Z3nArq7ilJgc=', '4qZBi5W', NULL, NULL, 1, 0, 'i26pGT4c@qq.com', '2024-12-05 07:01:45.139864', 16);
INSERT INTO `sys_user` VALUES (8, 'hXi1wB', 'pbkdf2_sha256$600000$bLPtMKJRy7sdLNLLeC7liW$Z4QIX78RBRlElyAT/XS5Fdf633q94yQiHISDNZsE7Hs=', 'hXi1wB', NULL, NULL, 1, 0, 'm391CO29O4@163.com', '2024-12-05 07:01:45.882996', 16);
INSERT INTO `sys_user` VALUES (9, 'rS6hKYm', 'pbkdf2_sha256$600000$stSgRPa0l050KQJC9aufcZ$mMoYA5+saDlJHMJstb8/ow/sEILpZ4wxbMT0ct29zxs=', 'rS6hKYm', NULL, NULL, 1, 0, 'KjRyTWm7q@qq.com', '2024-12-05 07:01:46.672366', 16);
INSERT INTO `sys_user` VALUES (10, '5qq8b', 'pbkdf2_sha256$600000$fjvHmE2KRGtbMfwEvOHier$LuB9IiooLUtH5UJyviqM9lVw1Ro5QpYIxEWOHFsWPTU=', '5qq8b', NULL, NULL, 1, 0, 'iXqID3akwu@gmail.com', '2024-12-05 07:01:47.229477', 16);
INSERT INTO `sys_user` VALUES (11, 'y9RL5psk', 'pbkdf2_sha256$600000$3K9UrDeBTil5co7NUPnTvc$u/nR4kvm4bMUxwayKsaBm/da6k66m+EnuZAdfhOvthc=', 'y9RL5psk', NULL, NULL, 1, 0, '3aaunsi@163.com', '2024-12-05 07:01:47.939915', 16);
INSERT INTO `sys_user` VALUES (12, 'Olhiss6', 'pbkdf2_sha256$600000$yos98X7ZTiobKlG5lew29y$smC8gA7hLEgAE85jvUkoLqU65dgSA/DQ1VVcTKay+3w=', 'Olhiss6', NULL, NULL, 1, 0, '6rIuBYTxW@qq.com', '2024-12-05 07:01:48.392499', 16);
INSERT INTO `sys_user` VALUES (13, 'iFLrFu', 'pbkdf2_sha256$600000$VyQTXmuttybkNTdY0ysjGH$MH13OWmt6VHHV1EvUNvLLsNCDjoLS+Tu+ok31fn2Nfc=', 'iFLrFu', NULL, NULL, 1, 0, 'FZM07NK@163.com', '2024-12-05 07:01:48.846268', 16);
INSERT INTO `sys_user` VALUES (14, '8JC1P0jF', 'pbkdf2_sha256$600000$2ToVSNbcLCyGY81QVwetk9$DET1u/JwlXd/Hw1fExY2ejqja1MTQiRVFwQvy9yXYgg=', '8JC1P0jF', NULL, NULL, 1, 0, '7c21a1q@qq.com', '2024-12-05 07:01:49.298317', 16);
INSERT INTO `sys_user` VALUES (15, '3FjLh', 'pbkdf2_sha256$600000$msFjbpMhh3OyucXplqhNck$/Ku/yZ0F4ry7AYI1LvLlxtyO0Auc5+3Jiecw0KrV9rk=', '3FjLh', NULL, NULL, 1, 0, 'AXuPvyQ91H@qq.com', '2024-12-05 07:01:49.765640', 16);
INSERT INTO `sys_user` VALUES (16, 'TGHB7', 'pbkdf2_sha256$600000$JnoZSPgkKpkfl7ccZUfQGk$OajL2rOYgy6cpTspSS2ZUzlalUB3J1WOlgPo8+hkzGg=', 'TGHB7', NULL, NULL, 1, 0, 'RwlrcJ@163.com', '2024-12-05 07:01:50.249640', 16);
INSERT INTO `sys_user` VALUES (17, '1em8R3DT', 'pbkdf2_sha256$600000$smnAWjOZOUlQSIfiIeW9cE$pCkUpTG5AF+SrEisCi2WJ0aUcpyke001v6dcBq3Z9y8=', '1em8R3DT', NULL, NULL, 1, 0, '9IWxv8d@163.com', '2024-12-05 07:01:50.735292', 16);
INSERT INTO `sys_user` VALUES (18, 'aJP0dqW', 'pbkdf2_sha256$600000$94cRrG7kfdHXgsSH5jVtz1$S0jixcRiDzHg3Xdl/adaluuRZ38WuC8HjaSIX4pma0Q=', 'aJP0dqW', NULL, NULL, 1, 0, 'Ybur3fUuEG@qq.com', '2024-12-05 07:01:51.218106', 16);
INSERT INTO `sys_user` VALUES (19, 'HqaZtIJ', 'pbkdf2_sha256$600000$x2QOD3DRZFlCPdG3rS4Z5R$cm7UNGUUZTIDJNjjcUIYkHzL5vhGI/ecIn1CwRicBms=', 'HqaZtIJ', NULL, NULL, 1, 0, 'E2PkV@qq.com', '2024-12-05 07:01:51.676208', 16);
INSERT INTO `sys_user` VALUES (20, 'xb3Rv', 'pbkdf2_sha256$600000$4VG9TpjCstFFrTdo9fhCcT$/1crqtYJHhyJLl4LLeAjsvc7kmLXrIeBxhBCdz/OKu0=', 'xb3Rv', NULL, NULL, 1, 0, 'wjp4b7Oo@163.com', '2024-12-05 07:01:52.153861', 16);
INSERT INTO `sys_user` VALUES (21, 'aHn4Idp3', 'pbkdf2_sha256$600000$NyyVpeWTEGKjBdpyFwxE6l$y06RO1M8x4jXoWMiCe569uLt/LOeBv9KP5IYSPI5g2I=', 'aHn4Idp3', NULL, NULL, 1, 0, 'paLK6a@gmail.com', '2024-12-05 07:01:52.617123', 16);
INSERT INTO `sys_user` VALUES (22, 'KoAmm', 'pbkdf2_sha256$600000$SM9kUfKxl0iFrCmZJN2xQO$en4GsY1OcW9VUTaiYXTFBs/zZz1fw3+J8VF3Wh6bp9w=', 'KoAmm', NULL, NULL, 1, 0, 'JGhotYG1S@gmail.com', '2024-12-05 07:01:53.059095', 16);
INSERT INTO `sys_user` VALUES (23, 'vgvoHwe', 'pbkdf2_sha256$600000$glBhV7QB5bjXSGKoYXi3Rv$mqQr9J6fqbiT1mkzoX2mqYx3y7P+oDIyz7wZ4YxehPY=', 'vgvoHwe', NULL, NULL, 1, 0, 'wrn7owZFS@163.com', '2024-12-05 07:01:53.507955', 16);
INSERT INTO `sys_user` VALUES (24, '61cq1qQ', 'pbkdf2_sha256$600000$rdyDwL6mCncO9LClrNB7Ok$SuTpj7xhr2uQb2A8MAcmwiqpnvq3EDnPj4zyGo+JmbI=', '61cq1qQ', NULL, NULL, 1, 0, '1g9rZ38YA@gmail.com', '2024-12-05 07:01:53.968763', 16);
INSERT INTO `sys_user` VALUES (25, 'e0Ky5', 'pbkdf2_sha256$600000$hpZjsKWpE4hWa8T5Q8eT9d$xalWTOaB3gyboX1PwaT9/aQIH+BFbFkiYPx22d1hJ9I=', 'e0Ky5', NULL, NULL, 1, 0, '709SawR@163.com', '2024-12-05 07:01:54.425311', 16);
INSERT INTO `sys_user` VALUES (26, 'SUNjOEM', 'pbkdf2_sha256$600000$DtWdmWwq4uT3pAuvDXZKm8$+fzesVvV45n7Ri9buPBD5wfCfiSpww+IdJ++7dK+JQs=', 'SUNjOEM', NULL, NULL, 1, 0, '70mGhlLGF@gmail.com', '2024-12-05 07:01:54.885232', 16);
INSERT INTO `sys_user` VALUES (27, 'vVoLt', 'pbkdf2_sha256$600000$tCeL4LfwGukarOVFRtTysZ$6RC4uldjiyIuuoBDwasGlJ8AuvN4aF0Gzk9NgD66pDk=', 'vVoLt', NULL, NULL, 1, 0, 'yQBfM@qq.com', '2024-12-05 07:01:55.365549', 16);
INSERT INTO `sys_user` VALUES (28, 'fqObm', 'pbkdf2_sha256$600000$8zlNhkitnMMNp186Qvc7zc$puyCSJSv3qGaBLazx29eI7hi25QYZO3cSRPTmrrmNJk=', 'fqObm', NULL, NULL, 1, 0, 'uetTdCt@qq.com', '2024-12-05 07:01:55.850524', 16);
INSERT INTO `sys_user` VALUES (29, 'iy5C2K5s', 'pbkdf2_sha256$600000$9NUVbhFpNgij8VwFEhBvAK$gqOoFrj45RkhZT14Y4p7tXtbdF5DIhNezej086Bg+Pg=', 'iy5C2K5s', NULL, NULL, 1, 0, 'd81Y2r@gmail.com', '2024-12-05 07:01:56.303744', 16);
INSERT INTO `sys_user` VALUES (30, 'VghZDiyL', 'pbkdf2_sha256$600000$16gc7Q95HfoIF5VQOqjtYb$K60NCdJgAPSDg8VTsIZd8ixDE7aUzdZfPHWeIePQTKs=', 'VghZDiyL', NULL, NULL, 1, 0, 'TU5aC9ennQ@gmail.com', '2024-12-05 07:01:57.142216', 16);
INSERT INTO `sys_user` VALUES (31, 'ChMec', 'pbkdf2_sha256$600000$cbPLHKONpG6XLemw0BOeir$m64TqkwcOJLeAf5AYKnNddYsqWdGajm95r1bLIOpcSQ=', 'ChMec', NULL, NULL, 1, 0, 'f7m8MQrH@qq.com', '2024-12-05 07:01:57.717866', 16);
INSERT INTO `sys_user` VALUES (32, 'zX2aKha7', 'pbkdf2_sha256$600000$mZhwMhJrtecFOBKnAAMJEd$27hqoSoMV4JXSQ5gONfNq7jZuqfT7KCXEwRMy57t+jM=', 'zX2aKha7', NULL, NULL, 1, 0, 'cR7yiuKHhz@163.com', '2024-12-05 07:01:58.215224', 16);
INSERT INTO `sys_user` VALUES (33, 'GmoKu', 'pbkdf2_sha256$600000$1HxEmTHNbwHHAJpMhTrB2E$3qoHPcZ0b0wiIt/pOK0vE2rMrfERuZjYCnea4hLEc6Q=', 'GmoKu', NULL, NULL, 1, 0, 'bh59tD6QeQ@163.com', '2024-12-05 07:01:58.706194', 16);
INSERT INTO `sys_user` VALUES (34, '7sMEMfJE', 'pbkdf2_sha256$600000$uKkujqZz9mfZCr05kfWwXW$2tygSdy7MjVwvxW3EDUbGeMjgAuDDcZNZs3mP3swohI=', '7sMEMfJE', NULL, NULL, 1, 0, '9usJNuK25@gmail.com', '2024-12-05 07:01:59.183832', 16);
INSERT INTO `sys_user` VALUES (35, 'VJCfti', 'pbkdf2_sha256$600000$fyS8uuAedZUInXNNCgmlfN$HBTfq2FxCBLX5AGr9SJ+cvtSs+Lq0OV30bs0aEz7lsA=', 'VJCfti', NULL, NULL, 1, 0, 'mHqtB8k@qq.com', '2024-12-05 07:01:59.629739', 16);
INSERT INTO `sys_user` VALUES (36, 'Y0Amb2', 'pbkdf2_sha256$600000$ympqOIvEraUpM9FPzLrLv0$zbSfd7feQDJWkVsXfduIsFy9UAYVHnBAP9ByLk1u2O4=', 'Y0Amb2', NULL, NULL, 1, 0, '2pJ4bDPoK@gmail.com', '2024-12-05 07:02:00.144386', 16);
INSERT INTO `sys_user` VALUES (37, 'zBfOv7hI', 'pbkdf2_sha256$600000$my1KsNoDSRujDMSB00S0OY$8nolJHYVRhbEeBq1NFKQgFlHiRJnCfv0mhZiVqIL44M=', 'zBfOv7hI', NULL, NULL, 1, 0, 'nHpDC8EpX@gmail.com', '2024-12-05 07:02:00.635055', 16);
INSERT INTO `sys_user` VALUES (38, 'rOWjjVc', 'pbkdf2_sha256$600000$iTkBeNGM254NjAM2XgSGqy$SRtcLc/CPio7hY0FP5ZjaCQ2V3AotSiNrVSeHMhiN2Y=', 'rOWjjVc', NULL, NULL, 1, 0, 'gwInC8q@gmail.com', '2024-12-05 07:02:01.093018', 16);
INSERT INTO `sys_user` VALUES (39, 'hCVBpAGj', 'pbkdf2_sha256$600000$02LasFknY190xsddVkNrjK$t7rc7NQWMW/FiSQOaGkKoWScVZ60rvSbgVa+uQhVSfI=', 'hCVBpAGj', NULL, NULL, 1, 0, '2dabd@gmail.com', '2024-12-05 07:02:01.552199', 16);
INSERT INTO `sys_user` VALUES (40, 'RAZHARZP', 'pbkdf2_sha256$600000$ACw2ZaN1s5X2wetjFvm5ZU$kiAWUq0ps7Ak7x+eUT6i+/hJtAgtozMSbVRPl9fKm3U=', 'RAZHARZP', NULL, NULL, 1, 0, 'j6zly3@qq.com', '2024-12-05 07:02:02.027271', 16);
INSERT INTO `sys_user` VALUES (41, 'wc1cBz', 'pbkdf2_sha256$600000$Pn1ZVktYUzBBA3aY6J6IqY$+yXD6kQMx0znRdb90RMz6bj1hseQBuUY/U1t6M4btfw=', 'wc1cBz', NULL, NULL, 1, 0, 'tCLen@163.com', '2024-12-05 07:02:02.471984', 16);
INSERT INTO `sys_user` VALUES (42, 'AlVwSa', 'pbkdf2_sha256$600000$YpbNMjQBsZHAp0JyxbjE8G$gV3ndH/1o9t4QF9kUhin3uXReCs0yy5Zbfwa+lrvPCc=', 'AlVwSa', NULL, NULL, 1, 0, 'aZlSIDiTE@163.com', '2024-12-05 07:02:02.928451', 16);
INSERT INTO `sys_user` VALUES (43, '3fOKXORZ', 'pbkdf2_sha256$600000$2t1F862SQ6TttDUEjD2VMO$rsK5iokrOF0uTqd9wfMR96BbsDGsLMGmH/CWSRwYWho=', '3fOKXORZ', NULL, NULL, 1, 0, 'T0nD3Hr@qq.com', '2024-12-05 07:02:03.375045', 16);
INSERT INTO `sys_user` VALUES (44, 'ZvxK9Sv', 'pbkdf2_sha256$600000$8G2WHhb2QojdpfyVssb57C$4vSxyu0hfCQ7bwmqB9dOlYzEsB1j48o+Qene5VaqTIo=', 'ZvxK9Sv', NULL, NULL, 1, 0, 'KukuvK@163.com', '2024-12-05 07:02:03.828470', 16);
INSERT INTO `sys_user` VALUES (45, 'j2hEhmeI', 'pbkdf2_sha256$600000$C0sgDtHoPnKRZiautanb6t$wKUxaa3kxXOagkXAga/p/u+kQVDCVwuf++k8nHBIL24=', 'j2hEhmeI', NULL, NULL, 1, 0, 'rymF1rL6A@163.com', '2024-12-05 07:02:04.281911', 16);
INSERT INTO `sys_user` VALUES (46, 'q4yHyW9', 'pbkdf2_sha256$600000$zfnWXB592gGWRorizMzZxG$WzuX5ukfFl3iqgR1RYvtDpQp1k5t1JVBwGhEreP1Vj8=', 'q4yHyW9', NULL, NULL, 1, 0, 'x2dOF@163.com', '2024-12-05 07:02:04.727621', 16);
INSERT INTO `sys_user` VALUES (47, 'TWs0atTu', 'pbkdf2_sha256$600000$GJW2FpQny87MmMlqoUKznE$EFuDcHlvT1x23vj5TN3KBHmVtPNw7jpL7+dz5KhIBPg=', 'TWs0atTu', NULL, NULL, 1, 0, 'Qzb6ALA@qq.com', '2024-12-05 07:02:05.169991', 16);
INSERT INTO `sys_user` VALUES (48, 'kdtdEf2B', 'pbkdf2_sha256$600000$a8gD9ziWZhy10X5Jg4L1CX$FMWPGZH9FKKPFPZO7M1NhyrfecnVJdofr8T3g/pKcNg=', 'kdtdEf2B', NULL, NULL, 1, 0, 'nqmKx@gmail.com', '2024-12-05 07:02:05.623846', 16);
INSERT INTO `sys_user` VALUES (49, 'gxWPT', 'pbkdf2_sha256$600000$eI7KsYM6ztYNR8QAfadZ5z$67NsliA2eWD8oThfKwd33GABKOG7gEcFDvfshpczUBU=', 'gxWPT', NULL, NULL, 1, 0, 'OP875p0tFm@gmail.com', '2024-12-05 07:02:06.192070', 16);
INSERT INTO `sys_user` VALUES (50, 'xXbvXz', 'pbkdf2_sha256$600000$EMnoEJqOTLnrtuREvAQ1Az$QrwY1Esbd+jM7LXU17KLikyH1ipoZaID1CN/KonwqKY=', 'xXbvXz', NULL, NULL, 1, 0, 'yXu7oQwJe8@163.com', '2024-12-05 07:02:06.666482', 16);
INSERT INTO `sys_user` VALUES (51, 'HBQLiSA', 'pbkdf2_sha256$600000$VbMsHWcl4Hu1iA3SA5q1RD$xLgko5NWvNpmJ90ynYW4LwsdHNrzZAERzfsTuh5YSC8=', 'HBQLiSA', NULL, NULL, 1, 0, 'QmHkcnDrM@gmail.com', '2024-12-05 07:02:07.111997', 16);
INSERT INTO `sys_user` VALUES (52, 'unQwBUbJ', 'pbkdf2_sha256$600000$43H88eK7eJvqiUEtKHUAqI$5f+W7d76rc6kupe+JNxclvaDnPC62EaZaPQv3ySyaW8=', 'unQwBUbJ', NULL, NULL, 1, 0, 'TvgPzy@gmail.com', '2024-12-05 07:02:07.558503', 16);
INSERT INTO `sys_user` VALUES (53, 'KtDldN', 'pbkdf2_sha256$600000$htQX9EvZQtv9JF3UI6haLh$mJnAsTo4igc/TjjEDy7vdCDATGjvc/4aBFMlXdcfUYM=', 'KtDldN', NULL, NULL, 1, 0, 'e4V6DpE@163.com', '2024-12-05 07:02:08.018948', 16);
INSERT INTO `sys_user` VALUES (54, '1rRp8w', 'pbkdf2_sha256$600000$zWOTQbWycpPruDK26zj6T8$M0pR47GkFGCX2p+qHxvxL2wIHkKVeDDeNkzxVpRuk6A=', '1rRp8w', NULL, NULL, 1, 0, '37VG0@qq.com', '2024-12-05 07:02:08.470923', 16);
INSERT INTO `sys_user` VALUES (55, 'qI62ZyDH', 'pbkdf2_sha256$600000$tv9HNVwYJ7fs7eSmSo85ez$4a0FjRaF9c55sey7AJpwS41dXgQCntPjJOLXtJL4vSA=', 'qI62ZyDH', NULL, NULL, 1, 0, 'T465iK@163.com', '2024-12-05 07:02:08.935971', 16);
INSERT INTO `sys_user` VALUES (56, 'UWUx7', 'pbkdf2_sha256$600000$aksXFuVk9DqY7fH3r6J9kX$wDXUdWSidvkc6QABWqfyYVgUiTwMJeMMZNRmbOomlwQ=', 'UWUx7', NULL, NULL, 1, 0, '0Ui6fsLJ8w@gmail.com', '2024-12-05 07:02:09.379427', 16);
INSERT INTO `sys_user` VALUES (57, 'puGZ1a5v', 'pbkdf2_sha256$600000$tgbzdjby3j58qicymwMrSj$qJVhc1bCnp3Jck2BBn2DJEhlvGD2K2rIqTvA1BqYTKY=', 'puGZ1a5v', NULL, NULL, 1, 0, '1WyGMiet@qq.com', '2024-12-05 07:02:09.890760', 16);
INSERT INTO `sys_user` VALUES (58, '4e0GY0qC', 'pbkdf2_sha256$600000$hNCCwYSm0vwdXqefTqJ2qH$krvNGy9x4hW+RVRE9igqnYX6l96y7PooKe9i33AhEwk=', '4e0GY0qC', NULL, NULL, 1, 0, 'Uy1Bv3Bnc@qq.com', '2024-12-05 07:02:10.351862', 16);
INSERT INTO `sys_user` VALUES (59, 'V81xX', 'pbkdf2_sha256$600000$ca8R4TgQt0CBN5DPZ51aiA$4ctBF5eDnc9znuzKhWdds9gun6XK9ouRUrtUIqaCtAs=', 'V81xX', NULL, NULL, 1, 0, 'k7dovFZY@qq.com', '2024-12-05 07:02:10.799152', 16);
INSERT INTO `sys_user` VALUES (60, 'z1Pz5hAT', 'pbkdf2_sha256$600000$zDAggURt34HOni4UG0o0Tn$+9tgQ9hvvxu4JBunaqDaE3YKfbb8Qj4U2RO86gVByKY=', 'z1Pz5hAT', NULL, NULL, 1, 0, '1kS3tj@163.com', '2024-12-05 07:02:11.283612', 16);
INSERT INTO `sys_user` VALUES (61, 'wegYUM', 'pbkdf2_sha256$600000$rA10ScVEwwa69R42rJ4L4p$E86WpacZhdjrtINYaAWmTKY2JbLX2GEXQWc+7hyEq5c=', 'wegYUM', NULL, NULL, 1, 0, 'lSCXYbOPF7@163.com', '2024-12-05 07:02:11.764033', 16);
INSERT INTO `sys_user` VALUES (62, '0UIkBC', 'pbkdf2_sha256$600000$Z9aAL99umEsTGik6oLuoaF$9to6tTiJyWIxca2vHj6n7S3i/HAN2+NMbzC0P9VTymc=', '0UIkBC', NULL, NULL, 1, 0, 'HTBVRL50@163.com', '2024-12-05 07:02:12.222140', 16);
INSERT INTO `sys_user` VALUES (63, 'zG39b', 'pbkdf2_sha256$600000$QIVAESb7Dr86W0De0rkP39$vkVUUcPaWfoHo6wbKQloHUVk8rfjDjfY3HD0XS5P9+4=', 'zG39b', NULL, NULL, 1, 0, 'frb8FLZGFP@gmail.com', '2024-12-05 07:02:12.667785', 16);
INSERT INTO `sys_user` VALUES (64, 'dF6hl7', 'pbkdf2_sha256$600000$RthsSjX8WquqvVVCTznEpv$NaXbmHnNVCos8qpD/IrVd2BepWjaEiayV1TfsJbi+ek=', 'dF6hl7', NULL, NULL, 1, 0, 'qmXSjJnLWa@163.com', '2024-12-05 07:02:13.111492', 16);
INSERT INTO `sys_user` VALUES (65, '86odW', 'pbkdf2_sha256$600000$gCrWqrUQ3DxwBLPaW4J4yc$uHwqSpWLuAX7B9B0Dte9kH+/QafQf3fNve8kDRFIKO0=', '86odW', NULL, NULL, 1, 0, 'UhKebEj@qq.com', '2024-12-05 07:02:13.856581', 16);
INSERT INTO `sys_user` VALUES (66, 'eBaO7Ac', 'pbkdf2_sha256$600000$w5QC0dIiyKaXoxtmaUvdNe$k8P+caZJiejj40YYrRdmMignQlsaMl4MtuuFiDr203k=', 'eBaO7Ac', NULL, NULL, 1, 0, 'FuKj1Ktq@qq.com', '2024-12-05 07:02:14.330946', 16);
INSERT INTO `sys_user` VALUES (67, 'wctT0Zl', 'pbkdf2_sha256$600000$zHeuho8qlDfENJwLoH3Nmf$agWW90s+pOR/YtpAu3bdX5xRvkweVxARzdm5X2/0bNQ=', 'wctT0Zl', NULL, NULL, 1, 0, 'FJwIyHzNP@163.com', '2024-12-05 07:02:14.774359', 16);
INSERT INTO `sys_user` VALUES (68, '0ocCkr', 'pbkdf2_sha256$600000$RNUnEkmmyoY6ZnxwoxU8OE$lLUWt976nGhKUtwd2OMzr9iLDkTHhuy1pxgiPDvwL4I=', '0ocCkr', NULL, NULL, 1, 0, 'XUN5db@qq.com', '2024-12-05 07:02:15.230180', 16);
INSERT INTO `sys_user` VALUES (69, 'lWTQdufc', 'pbkdf2_sha256$600000$gCCsdYjgCStSDIjwIhkskK$l3lAUYP8vHS/rdhoRCsPikVn6rb95mRJlg5WQ76aAb0=', 'lWTQdufc', NULL, NULL, 1, 0, 'p09frFesdG@qq.com', '2024-12-05 07:02:15.677552', 16);
INSERT INTO `sys_user` VALUES (70, 'NZhBK', 'pbkdf2_sha256$600000$7l0a5BEuCBBNmC5cjo9fQ3$Ci7PBwHaY6zAeLE4EkVTZ3Hkw7UOu4JJulh0JEtl2ao=', 'NZhBK', NULL, NULL, 1, 0, 'xKEAv@gmail.com', '2024-12-05 07:02:16.129399', 16);
INSERT INTO `sys_user` VALUES (71, 'lPBo4R', 'pbkdf2_sha256$600000$3W87sm0HLtHvrQxv0ri45s$lq85UI8LISLoHfS1fVlzl951DNiNtFKBRkvddsFh5iI=', 'lPBo4R', NULL, NULL, 1, 0, 'eBOfdvy@qq.com', '2024-12-05 07:02:16.585533', 16);
INSERT INTO `sys_user` VALUES (72, 'CQdnSk1h', 'pbkdf2_sha256$600000$3wHoWnHrPTBVjjs2Dbiywh$xuiyPQbhRe+VSv7mSHmTHi/sH41a1Gq27aSLmI1x7gc=', 'CQdnSk1h', NULL, NULL, 1, 0, 'X3U7QE8@gmail.com', '2024-12-05 07:02:17.047859', 16);
INSERT INTO `sys_user` VALUES (73, 'Flr47we', 'pbkdf2_sha256$600000$ncbl6vNlla23UmE4hzB4Ib$QmnFqhmkwsvJmFo9kKYwbq7DSwJ1CcYYtbpXvoaGSWo=', 'Flr47we', NULL, NULL, 1, 0, 'Ek5aVSpEkp@gmail.com', '2024-12-05 07:02:17.492129', 16);
INSERT INTO `sys_user` VALUES (74, 'bpmmlE', 'pbkdf2_sha256$600000$yA5fmdXNQ0j8N5328uIT4d$NMlY3UzFnQoLK4XBZyX9aDoW3M9oWHRsvIwF1kyGBMA=', 'bpmmlE', NULL, NULL, 1, 0, 'jXMzwqo@163.com', '2024-12-05 07:02:17.926425', 16);
INSERT INTO `sys_user` VALUES (75, 'DBOo5', 'pbkdf2_sha256$600000$SoNplFhpO88sgm99ia4uLn$N9dpJd4g2WfpB6sRUJSYIKI9Njx8VBybqurG+a79Mu0=', 'DBOo5', NULL, NULL, 1, 0, 'C9rEs40E@gmail.com', '2024-12-05 07:02:18.364418', 16);
INSERT INTO `sys_user` VALUES (76, 'XeNsTT', 'pbkdf2_sha256$600000$YjJ2nUPQ11Bd3BPZ7fByfa$0cobei9JA1euXDmuMP2/T8s+XcISTwT/pLBsi47kUq4=', 'XeNsTT', NULL, NULL, 1, 0, 'SCQ2FcL58@163.com', '2024-12-05 07:02:18.814568', 16);
INSERT INTO `sys_user` VALUES (77, 'ArTbd', 'pbkdf2_sha256$600000$2kKrsWj58BsnPBQcvkhsdu$wMxBiFf5HyYWISq3P+o+SbxcCRgKpIyz/d1ga4mjUj8=', 'ArTbd', NULL, NULL, 1, 0, 'SNbncTCO@gmail.com', '2024-12-05 07:02:19.257258', 16);
INSERT INTO `sys_user` VALUES (78, 'lW2QOh0', 'pbkdf2_sha256$600000$ZblMEr8pz6spTmR6XZ8t1O$BduKw2LdmZ40iug6+jMGWjlYftKDcmT39pysvhEOD+A=', 'lW2QOh0', NULL, NULL, 1, 0, 'Icsgjawl@163.com', '2024-12-05 07:02:19.726640', 16);
INSERT INTO `sys_user` VALUES (79, 'EfA5qC', 'pbkdf2_sha256$600000$MnFntLxFXCFHBcW6EpLls8$A+FBKhD7BDh2D2eiqMu0vQZo3MIzS0gXYGxW4TvByWU=', 'EfA5qC', NULL, NULL, 1, 0, 'wNmq3@gmail.com', '2024-12-05 07:02:20.177628', 16);
INSERT INTO `sys_user` VALUES (80, 'I2bMGry1', 'pbkdf2_sha256$600000$eWDrQAvyzAnqs7xQZx4cwF$2eRpG1VDnQCOzDpIsjoQwUESvAxP5paEKFyPWuom5t4=', 'I2bMGry1', NULL, NULL, 1, 0, 'N68Uqhy@163.com', '2024-12-05 07:02:20.627831', 16);
INSERT INTO `sys_user` VALUES (81, 'gqKUZjHP', 'pbkdf2_sha256$600000$7Sfpc9ZCjYhFIwKPZVMoWY$YpEXvQqSDJ0i0o9Joyh/CrbYMLokVbnormOc2L2cKcs=', 'gqKUZjHP', NULL, NULL, 1, 0, 'AVOl8bCTb@163.com', '2024-12-05 07:02:21.079545', 16);
INSERT INTO `sys_user` VALUES (82, 'ZT22Pm', 'pbkdf2_sha256$600000$GCBeyY36ondVjxsWImzW6h$2AkUBi9p/NnwNGGxUd9l9egLVwpuLb8BYc7bc+sdPaE=', 'ZT22Pm', NULL, NULL, 1, 0, 'kz6POf@163.com', '2024-12-05 07:02:21.527533', 16);
INSERT INTO `sys_user` VALUES (83, '5L5qQs', 'pbkdf2_sha256$600000$HjCDUnQ8eQHXeJUDtarNvL$SpQzVX3UJEiodfd/Nh8Cacko2i6UPFSSSQL1+c3kCME=', '5L5qQs', NULL, NULL, 1, 0, 'QFuH41ykZQ@gmail.com', '2024-12-05 07:02:21.970230', 16);
INSERT INTO `sys_user` VALUES (84, 'riTDxrm9', 'pbkdf2_sha256$600000$qg7O8ppqvCi6C3jOYM7OPx$4JRkgke0GejXqOYYJoXOuBJy54oqsx71he6kH3Y8kbg=', 'riTDxrm9', NULL, NULL, 1, 0, 'sc9YTj4UN@163.com', '2024-12-05 07:02:22.411045', 16);
INSERT INTO `sys_user` VALUES (85, 'UOY6p7T', 'pbkdf2_sha256$600000$EUf1SWGGN90xz4Y8BxyjWE$Yssw89J5sqlLY9bX7iojCSA5B3QMu/Nf/Ridk/+1TVQ=', 'UOY6p7T', NULL, NULL, 1, 0, '04t7OEW@qq.com', '2024-12-05 07:02:22.887678', 16);
INSERT INTO `sys_user` VALUES (86, '3l7CV', 'pbkdf2_sha256$600000$O2X4AQUDf8uy9KRj1WPPNs$fIVoatOdBGc+V6f32VPkfRWu8+liMvFMAXM5CiQhRr8=', '3l7CV', NULL, NULL, 1, 0, '9fvmjWu@163.com', '2024-12-05 07:02:23.325019', 16);
INSERT INTO `sys_user` VALUES (87, 'fytOGa', 'pbkdf2_sha256$600000$aBUAQ7ck8TYuqSpIu5DCq1$a0q0Zn3y3xCFRKvt/PSJQwvD+UzlTeKkHc6QKNocLww=', 'fytOGa', NULL, NULL, 1, 0, 'f6FZNmDLlH@qq.com', '2024-12-05 07:02:23.774186', 16);
INSERT INTO `sys_user` VALUES (88, 'pAAolSqN', 'pbkdf2_sha256$600000$Odvp5npotQY2U1VWy5zs0W$ftM2Rzqyov+10akMfn5svij/NgV/CUkJTGThkkKjz6E=', 'pAAolSqN', NULL, NULL, 1, 0, 'aJ5EO@qq.com', '2024-12-05 07:02:24.219299', 16);
INSERT INTO `sys_user` VALUES (89, 'k0TU6g3', 'pbkdf2_sha256$600000$fxqhyma96iobRjy98ISILX$lhrqELA6HDsl8BSR4vPPz7sZV2iUyovMgKqOeko9XCk=', 'k0TU6g3', NULL, NULL, 1, 0, 'XjnRlBbZJ3@qq.com', '2024-12-05 07:02:24.670378', 16);
INSERT INTO `sys_user` VALUES (90, '6OUJDo37', 'pbkdf2_sha256$600000$rmzP7e172qagdhKSEMqEZ5$jZ6NOnekQ7fBvCQCSWvoqYdTL2GsVk0f3iKq+Ego/lg=', '6OUJDo37', NULL, NULL, 1, 0, '7am6ZQ@qq.com', '2024-12-05 07:02:25.120180', 16);
INSERT INTO `sys_user` VALUES (91, '4ZfXVHP', 'pbkdf2_sha256$600000$1TM3kSZtEVZan3SLEZpVLh$D5VarU6nFdJYo3ckHhTjswEJOtpTiXEQ0WzxasMvCWM=', '4ZfXVHP', NULL, NULL, 1, 0, 'QjB9UrIC@gmail.com', '2024-12-05 07:02:25.561101', 16);
INSERT INTO `sys_user` VALUES (92, 'diJeVXqL', 'pbkdf2_sha256$600000$XYNuiHWXTLtfjx6QuPctsW$DIqI+p2/QE6+fIRejmbvVQf3fDepyVrs/bNQVHP+ecU=', 'diJeVXqL', NULL, NULL, 1, 0, '0o6uCG@gmail.com', '2024-12-05 07:02:26.012623', 16);
INSERT INTO `sys_user` VALUES (93, 'cUeBS', 'pbkdf2_sha256$600000$fJBgoTWesMRomhVXedxYPA$lScD1uo0P2MmVCmGDU0PkBurubcOTPJPOXg9vK2Py90=', 'cUeBS', NULL, NULL, 1, 0, 'AlsfBE2@gmail.com', '2024-12-05 07:02:26.450429', 16);
INSERT INTO `sys_user` VALUES (94, 'RODPu', 'pbkdf2_sha256$600000$2SwPVNboqyM4a7b86jwRAH$axiwdXiqcw3th2eQNsBUx11+7gvEoHxyxFbyxuAokZc=', 'RODPu', NULL, NULL, 1, 0, 'SIRswfog@163.com', '2024-12-05 07:02:26.886659', 16);
INSERT INTO `sys_user` VALUES (95, 'wv8f4Hj', 'pbkdf2_sha256$600000$NS1TdrhPm0GjMyIPoqLgly$rv/t8MVZceQGUUjiUK+Z9rfJXta/bra0XEHHjIoEOKs=', 'wv8f4Hj', NULL, NULL, 1, 0, 'gYqmhaW@gmail.com', '2024-12-05 07:02:27.328624', 16);
INSERT INTO `sys_user` VALUES (96, 'AiXUb', 'pbkdf2_sha256$600000$4clELsDxwn9BxklHFphehC$9uqr5W/g8EUQbo/7kwDcOqWuGHOcQpzkmQti8gSly/o=', 'AiXUb', NULL, NULL, 1, 0, '31wYIB@163.com', '2024-12-05 07:02:27.780904', 16);
INSERT INTO `sys_user` VALUES (97, 'ICRvsB', 'pbkdf2_sha256$600000$9H3nYQEYnIuNE5HHPH7ToE$YJqMUXSKjcoBZRPBH5WIuL/1QWDz+/5hU4dYbcVsmbk=', 'ICRvsB', NULL, NULL, 1, 0, 'gk91aGbs0O@163.com', '2024-12-05 07:02:28.227224', 16);
INSERT INTO `sys_user` VALUES (98, 'VlXUJ', 'pbkdf2_sha256$600000$xvullHlW68GnXJqlXO5GbO$A7rSmTWpuM8KjY9qQDdwBD2WccNr8dDM1XQqlQgfltU=', 'VlXUJ', NULL, NULL, 1, 0, 'cTAz3q@163.com', '2024-12-05 07:02:28.677452', 16);
INSERT INTO `sys_user` VALUES (99, '2cPvf', 'pbkdf2_sha256$600000$SbSROIWWKettCIm1MLCCi9$jHGinwvO6Z8H/cSDUkXzql1GGOA9Aw8KoUjIzSh0EXc=', '2cPvf', NULL, NULL, 1, 0, 'uzcz96@qq.com', '2024-12-05 07:02:29.168376', 16);
INSERT INTO `sys_user` VALUES (100, 'eruaZ', 'pbkdf2_sha256$600000$ztSmRCYotubI3wCC9NvrJY$IosO4zzlRPlCSy2vXAAZM+UkJWS3x6FybSQ/Uo/WM14=', 'eruaZ', NULL, NULL, 1, 0, 'wAGlaiaK@gmail.com', '2024-12-05 07:02:29.623403', 16);
INSERT INTO `sys_user` VALUES (101, '123', 'pbkdf2_sha256$600000$vYtSfD2L8MOR16lIACYJ4K$4CfTyBcrduZggYoT74xzBWtmtdIaF3BiF+jQR8LLhjI=', '123', NULL, NULL, 1, 0, NULL, '2024-12-17 06:48:13.060374', 16);

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `tagname` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tag
-- ----------------------------
INSERT INTO `tag` VALUES (1, '语文');
INSERT INTO `tag` VALUES (2, '数学');
INSERT INTO `tag` VALUES (3, '英语');
INSERT INTO `tag` VALUES (4, '物理');
INSERT INTO `tag` VALUES (5, '生物');
INSERT INTO `tag` VALUES (6, '化学');
INSERT INTO `tag` VALUES (7, '历史');
INSERT INTO `tag` VALUES (8, '政治');
INSERT INTO `tag` VALUES (9, '地理');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nickname` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `age` int NOT NULL,
  `gender` int NOT NULL,
  `status` int NOT NULL,
  `email` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `phonenumber` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `hprice` int NOT NULL,
  `province` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `county` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `area` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `eq` int NOT NULL,
  `remark` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_time` datetime(6) NOT NULL,
  `classification_id` int NULL DEFAULT NULL,
  `popularity` int NOT NULL,
  `city` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tags_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE,
  INDEX `teacher_classification_id_6ae433b8`(`classification_id` ASC) USING BTREE,
  INDEX `teacher_tags_id_743a7ec6_fk_tag_id`(`tags_id` ASC) USING BTREE,
  CONSTRAINT `teacher_classification_id_6ae433b8_fk_classfication_id` FOREIGN KEY (`classification_id`) REFERENCES `classfication` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `teacher_tags_id_743a7ec6_fk_tag_id` FOREIGN KEY (`tags_id`) REFERENCES `tag` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES (1, 'test', 'pbkdf2_sha256$600000$TMo8c84zbsXL5fSqbvaNRR$dmIOlZdWqHuhNoyvsYbW1ce8x+OMW/xGaGyBtVl3p9Q=', '王老师', 'https://www.eduease.com/gateway/admin/eduease/beijin/pic_card/teacher_picnet_type-0-id-55634-size-360x360-sex-0.jpg', 23, 0, 0, '123@gmail.com', '123456', 100, '重庆市', '渝中区', NULL, 4, '擅长音乐教学11', '2024-12-05 06:58:59.568654', 1, 10, NULL, 1);
INSERT INTO `teacher` VALUES (2, 'ttttt', 'pbkdf2_sha256$600000$TMo8c84zbsXL5fSqbvaNRR$dmIOlZdWqHuhNoyvsYbW1ce8x+OMW/xGaGyBtVl3p9Q=', '徐老师', 'https://www.eduease.com/gateway/admin/eduease/beijin/pic_card/teacher_picnet_type-0-id-77463-size-360x360-sex-1.jpg', 22, 1, 0, NULL, '123456', 200, '北京市', '海淀区', NULL, 4, NULL, '2024-12-05 13:38:41.000000', 3, 8, NULL, 2);
INSERT INTO `teacher` VALUES (3, 'xmyyy', 'pbkdf2_sha256$600000$adsP3OaaxVgh2PCaayqkac$rMx59IyQBdI2loqygsQ/HuISsAEQvqk7cZlLLrezDnM=', '徐一凡', 'https://www.eduease.com/gateway/admin/eduease/beijin/pic_card/teacher_picnet_type-0-id-120072-size-360x360-sex-1.jpg', 24, 0, 0, '123@gmail.com', '1111111', 300, '上海市', '浦东区', NULL, 3, NULL, '2024-12-09 11:51:09.736243', 4, 2, NULL, NULL);
INSERT INTO `teacher` VALUES (4, 'test123', 'pbkdf2_sha256$600000$AOBe57Q4FuWbciXiaFB7pa$wHiLqc2MLD5sK/klOL82GM30y2LOcg0WxetkN4PmzmI=', '肖夏', 'https://www.eduease.com/gateway/admin/eduease/beijin/pic_card/teacher_picnet_type-0-id-120068-size-360x360-sex-1.jpg', 24, 1, 0, '1123@gmail.com', '22222', 300, '上海市', '浦西区', NULL, 3, NULL, '2024-12-09 11:51:46.356681', 2, 4, NULL, 3);
INSERT INTO `teacher` VALUES (5, 'test1123123', 'pbkdf2_sha256$600000$BuCZye9T6LQG6SYWAOYugT$8gHh7W9FVU+3ZK7SfQheFb/JZZypt6zbL2M2qmNXOPk=', '陈老师', 'https://www.eduease.com/gateway/admin/eduease/beijin/pic_card/teacher_picnet_type-0-id-68185-size-360x360-sex-1.jpg', 24, 1, 0, '1123@gmail.com', '22222', 300, '山东省', '淄博市', NULL, 3, NULL, '2024-12-09 11:53:27.465385', 1, 9, NULL, 4);
INSERT INTO `teacher` VALUES (6, 'apap123', 'pbkdf2_sha256$600000$HqAp66FyUbOfFJTNnXJ1VE$Q7D9hPk1ensgt28nYjztEW/D75Pd3fVbegB3o4WHHuY=', '李力', 'https://www.eduease.com/gateway/admin/eduease/beijin/pic_card/teacher_picnet_type-0-id-118594-size-360x360-sex-0.jpg', 30, 0, 0, 'xmy@qq.com', '22222', 100, '山东省', '淄博市', NULL, 3, NULL, '2024-12-09 11:55:17.854500', 5, 3, NULL, NULL);
INSERT INTO `teacher` VALUES (7, 'adsdf', 'pbkdf2_sha256$600000$fIO2T1CFwjUi59sLbLnK4o$fjBr6yopU/No1V/QYslbcPuO87gSt5owOWy1WjCZDvo=', '赵强', 'https://www.eduease.com/gateway/admin/eduease/beijin/pic_card/teacher_picnet_type-0-id-117481-size-360x360-sex-1.jpg', 30, 0, 0, 'xmy@qq.com', '22222', 100, '青海省', '西宁市', NULL, 3, NULL, '2024-12-09 12:02:32.789709', 6, 8, NULL, NULL);
INSERT INTO `teacher` VALUES (8, 'adsdf123', 'pbkdf2_sha256$600000$Bu1LknUh0sbuC1XKIQuBiu$2pfcrqOO7Xejwr3ekxTEFcRRTQ85U+qcJRh6WxOSWZI=', '李四', 'https://www.eduease.com/gateway/admin/eduease/beijin/pic_card/teacher_picnet_type-0-id-120650-size-360x360-sex-1.jpg', 30, 0, 0, 'xmy@qq.com', '22222', 100, '四川省', '成都市', NULL, 3, NULL, '2024-12-09 12:02:59.075421', 3, 1, NULL, 5);
INSERT INTO `teacher` VALUES (9, 'adsasdf', 'pbkdf2_sha256$600000$3npPTJSnBkhyj4iMdfbKTJ$cWsmY1RrFKCq7x+ryLQzCLlnKdU05VT7UeAOyQQSECs=', '张三', NULL, 30, 0, 0, 'xmy@qq.com', '22222', 100, '四川省', '成都市', NULL, 3, NULL, '2024-12-09 12:03:23.802933', 3, 1, NULL, 6);
INSERT INTO `teacher` VALUES (10, 'adsasa', 'pbkdf2_sha256$600000$wf93MjYADhatWdasdCe4cu$ITxPUIdei4/aloFN/LFHtsPZAaG/32h1eTwJhMAMJlM=', '赵晓梅', NULL, 18, 1, 0, 'xmy@qq.com', '22222', 100, '四川省', '成都市', NULL, 4, NULL, '2024-12-09 12:03:55.721457', 6, 1, NULL, NULL);
INSERT INTO `teacher` VALUES (11, 'limei123', 'pbkdf2_sha256$600000$zdBVFb1g9dDCspW0OsDEjw$qbANL2d2hCXWuIoYr8N1C0O8PIyHMKCHIzB8wHDAp/M=', '李梅', NULL, 18, 1, 0, 'xx@qq.com', '22222', 100, '江西省', '南昌市', NULL, 4, NULL, '2024-12-09 12:04:41.995575', 4, 1, NULL, NULL);
INSERT INTO `teacher` VALUES (12, 'xmy', 'pbkdf2_sha256$600000$Y7KMrdOhxZrFoA6mdKlbAV$clmK3qKrtKsSCAdqsyJIysufH/I4VR2kPB/X27o9GUM=', 'xu', 'https://www.eduease.com/gateway/admin/eduease/beijin/pic_card/teacher_picnet_type-0-id-89732-size-360x360-sex-0.jpg', 18, 0, 0, '123@qq.com', '15823456789', 100, '北京市', '东城区', NULL, 3, NULL, '2024-12-11 06:04:35.456240', 3, 22, NULL, 7);
INSERT INTO `teacher` VALUES (13, 'admin', 'pbkdf2_sha256$600000$tK9i0s2DiNhtuJzTsDyYcd$HBdFNPChvYfJfMPlNrhCNPf3NMNi1ioovUblE4p3D0o=', '阿达', NULL, 18, 0, 0, '1796868170@qq.com', '15023538470', 100, '北京市', '东城区', NULL, 3, NULL, '2024-12-11 14:12:16.255513', NULL, 0, NULL, NULL);
INSERT INTO `teacher` VALUES (14, 'aaa', '$clmK3qKrtKsSCAdqsyJIysufH/I4VR2kPB/X27o9GUM=', '123', 'https://www.eduease.com/gateway/admin/eduease/beijin/pic_card/teacher_picnet_type-0-id-29115-size-360x360-sex-0.jpg', 23, 0, 0, NULL, '12312312', 220, '重庆市', '渝中区', NULL, 4, NULL, '2024-12-16 12:11:49.000000', 3, 22, NULL, 8);
INSERT INTO `teacher` VALUES (17, '123', '123', '123', 'https://www.eduease.com/gateway/admin/eduease/beijin/pic_card/teacher_picnet_type-0-id-81136-size-360x360-sex-0.jpg', 23, 0, 0, NULL, '123123', 2222, '重庆市', '渝北区', NULL, 3, NULL, '2024-12-16 12:14:32.000000', 2, 222, NULL, 9);

SET FOREIGN_KEY_CHECKS = 1;
