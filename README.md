# 小贾个人博客开源

### 开发环境

- Windows 10
- IntelliJ IDEA 2021.1 (Ultimate Edition)
- MYSQL 5.7
- jdk 1.8
- Tomcat 9.0
- Navicat Premium 15
- 用到的jar包
  - jackson-annotations-2.9.4.jar
  - jackson-core-2.9.4.jar
  - jackson-databind-2.9.4.jar
  - KCNamer.jar
  - mysql-connector-java-5.1.46-bin.jar
  - taglibs-standard-impl-1.2.5.jar
  - taglibs-standard-spec-1.2.5.jar

### 项目介绍

- 基于servlet+jsp+mysql的Java web个人博客项目
- 文章显示采用editor.md插件
- 目前实现的功能有文章发布、创建修改分类、标签等等
- 目前已知bug：分类、标签下的文章具体标签显示不正确（懒得改）



### 数据库

- admin - 管理员账号存储表
- article - 文章表
- cate - 分类表
- comment - 评论表
- danmu - 留言表
- tag - 标签表

```mysql
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `user` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `pwd` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`user`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `id` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `title` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `author` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pubdate` datetime NULL DEFAULT '1970-01-01 00:00:00',
  `moddate` datetime NULL DEFAULT NULL,
  `cateId` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tagId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `view` int(11) NULL DEFAULT NULL,
  `zan` int(11) NULL DEFAULT NULL,
  `comment` int(11) NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `img` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for cate
-- ----------------------------
DROP TABLE IF EXISTS `cate`;
CREATE TABLE `cate`  (
  `id` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `articleId` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `img` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `date` datetime NULL DEFAULT NULL,
  `header` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for danmu
-- ----------------------------
DROP TABLE IF EXISTS `danmu`;
CREATE TABLE `danmu`  (
  `id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `date` datetime NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag`  (
  `id` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- View structure for comments
-- ----------------------------
DROP VIEW IF EXISTS `comments`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `comments` AS select `comment`.`content` AS `content` from `comment` union all select `danmu`.`content` AS `content` from `danmu`;

SET FOREIGN_KEY_CHECKS = 1;

```

###  目录介绍

##### java

- bean - 实体类
- dao - 数据库连接与关闭
- filter - 过滤器
- service - 数据表增删改查操作
- servlet - 后台servlet
- servlet2 - 前端servlet
- utils - 工具包

##### web

- admin - 后台网页
- css - 样式
- img - 图片
- js - JavaScript
- fonts - 字体
- fontawesome-free-5.15.2-web - 小图标
- editormd - editor.md插件

### 图片预览

![image-20210511085141673](https://gitee.com/xiaojiaenen/blogimg/raw/master/imgs/20210511085149.png)

![image-20210511085200562](https://gitee.com/xiaojiaenen/blogimg/raw/master/imgs/20210511085201.png)

![image-20210511085225467](https://gitee.com/xiaojiaenen/blogimg/raw/master/imgs/20210511085225.png)

![image-20210511085248671](https://gitee.com/xiaojiaenen/blogimg/raw/master/imgs/20210511085249.png)
