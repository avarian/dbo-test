/*
 Navicat Premium Data Transfer

 Source Server         : docker-mysql
 Source Server Type    : MySQL
 Source Server Version : 110002 (11.0.2-MariaDB-1:11.0.2+maria~ubu2204)
 Source Host           : localhost:3306
 Source Schema         : dbo-test

 Target Server Type    : MySQL
 Target Server Version : 110002 (11.0.2-MariaDB-1:11.0.2+maria~ubu2204)
 File Encoding         : 65001

 Date: 03/08/2023 08:49:10
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for accounts
-- ----------------------------
DROP TABLE IF EXISTS `accounts`;
CREATE TABLE `accounts`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `phone_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'SYSTEM',
  `updated_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'SYSTEM',
  `deleted_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_at` datetime(3) NULL DEFAULT current_timestamp(3),
  `updated_at` datetime(3) NULL DEFAULT current_timestamp(3),
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `email`(`email` ASC) USING BTREE,
  UNIQUE INDEX `phone_number`(`phone_number` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of accounts
-- ----------------------------
INSERT INTO `accounts` VALUES (1, 'test 1', 'test@example.com', '08911111111', '$2a$05$FDbI/TzArTV.jjOa0ZDw4.f7KCgPntkiqgtC6kyabj5N.dbtvxktm', 'jl, wawawa', 'CUSTOMER', 'SYSTEM', 'SYSTEM', NULL, '2023-08-02 04:31:53.727', '2023-08-02 04:31:53.727', NULL);

-- ----------------------------
-- Table structure for brands
-- ----------------------------
DROP TABLE IF EXISTS `brands`;
CREATE TABLE `brands`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'SYSTEM',
  `updated_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'SYSTEM',
  `deleted_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_at` datetime(3) NULL DEFAULT current_timestamp(3),
  `updated_at` datetime(3) NULL DEFAULT current_timestamp(3),
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of brands
-- ----------------------------
INSERT INTO `brands` VALUES (1, 'Honda', NULL, 'SYSTEM', 'SYSTEM', NULL, '2023-08-02 08:18:53.082', '2023-08-02 08:18:53.082', NULL);
INSERT INTO `brands` VALUES (2, 'Yamaha', NULL, 'SYSTEM', 'SYSTEM', NULL, '2023-08-02 08:19:01.989', '2023-08-02 08:19:01.989', NULL);
INSERT INTO `brands` VALUES (3, 'Samsung', NULL, 'SYSTEM', 'SYSTEM', NULL, '2023-08-02 08:19:12.549', '2023-08-02 08:19:12.549', NULL);
INSERT INTO `brands` VALUES (4, 'Sekai', 'Produk Sekai setelah update', 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:35:38.774', '2023-08-03 08:36:43.512', NULL);

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'SYSTEM',
  `updated_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'SYSTEM',
  `deleted_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_at` datetime(3) NULL DEFAULT current_timestamp(3),
  `updated_at` datetime(3) NULL DEFAULT current_timestamp(3),
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (1, 'elektronik', NULL, 'SYSTEM', 'SYSTEM', NULL, '2023-08-02 08:18:53.082', '2023-08-02 08:18:53.082', NULL);
INSERT INTO `categories` VALUES (2, 'alat berat', NULL, 'SYSTEM', 'SYSTEM', NULL, '2023-08-02 08:19:01.989', '2023-08-02 08:19:01.989', NULL);
INSERT INTO `categories` VALUES (3, 'Baju', 'kategori baju', 'SYSTEM', 'SYSTEM', NULL, '2023-08-02 08:19:12.549', '2023-08-03 08:39:16.987', NULL);
INSERT INTO `categories` VALUES (4, 'komputer', 'kategori komputer', 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:40:04.691', '2023-08-03 01:40:04.691', '2023-08-03 08:41:44.965');

-- ----------------------------
-- Table structure for items
-- ----------------------------
DROP TABLE IF EXISTS `items`;
CREATE TABLE `items`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `account_id` bigint UNSIGNED NOT NULL,
  `brand_id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `price` decimal(60, 0) NOT NULL,
  `qty` int NOT NULL,
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'SYSTEM',
  `updated_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'SYSTEM',
  `deleted_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_at` datetime(3) NULL DEFAULT current_timestamp(3),
  `updated_at` datetime(3) NULL DEFAULT current_timestamp(3),
  `deleted_at` datetime(3) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_items_account`(`account_id` ASC) USING BTREE,
  INDEX `fk_items_brand`(`brand_id` ASC) USING BTREE,
  INDEX `fk_items_category`(`category_id` ASC) USING BTREE,
  CONSTRAINT `fk_items_account` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_items_brand` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_items_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 202 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of items
-- ----------------------------
INSERT INTO `items` VALUES (1, 1, 1, 1, 'item 1 cat 1 brand 1', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (2, 1, 1, 1, 'item 2 cat 1 brand 1', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (3, 1, 1, 1, 'item 3 cat 1 brand 1', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (4, 1, 1, 1, 'item 4 cat 1 brand 1', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (5, 1, 1, 1, 'item 5 cat 1 brand 1', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (6, 1, 1, 1, 'item 6 cat 1 brand 1', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (7, 1, 1, 1, 'item 7 cat 1 brand 1', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (8, 1, 1, 1, 'item 8 cat 1 brand 1', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (9, 1, 1, 1, 'item 9 cat 1 brand 1', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (10, 1, 1, 1, 'item 10 cat 1 brand 1', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (11, 1, 1, 1, 'item 11 cat 1 brand 1', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (12, 1, 1, 1, 'item 12 cat 1 brand 1', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (13, 1, 1, 1, 'item 13 cat 1 brand 1', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (14, 1, 1, 1, 'item 14 cat 1 brand 1', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (15, 1, 1, 1, 'item 15 cat 1 brand 1', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (16, 1, 1, 1, 'item 16 cat 1 brand 1', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (17, 1, 1, 1, 'item 17 cat 1 brand 1', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (18, 1, 1, 1, 'item 18 cat 1 brand 1', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (19, 1, 1, 1, 'item 19 cat 1 brand 1', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (20, 1, 1, 1, 'item 20 cat 1 brand 1', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (41, 1, 1, 2, 'item 1 cat 2 brand 1', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (42, 1, 1, 2, 'item 2 cat 2 brand 1', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (43, 1, 1, 2, 'item 3 cat 2 brand 1', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (44, 1, 1, 2, 'item 4 cat 2 brand 1', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (45, 1, 1, 2, 'item 5 cat 2 brand 1', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (46, 1, 1, 2, 'item 6 cat 2 brand 1', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (47, 1, 1, 2, 'item 7 cat 2 brand 1', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (48, 1, 1, 2, 'item 8 cat 2 brand 1', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (49, 1, 1, 2, 'item 9 cat 2 brand 1', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (50, 1, 1, 2, 'item 10 cat 2 brand 1', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (51, 1, 1, 2, 'item 11 cat 2 brand 1', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (52, 1, 1, 2, 'item 12 cat 2 brand 1', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (53, 1, 1, 2, 'item 13 cat 2 brand 1', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (54, 1, 1, 2, 'item 14 cat 2 brand 1', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (55, 1, 1, 2, 'item 15 cat 2 brand 1', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (56, 1, 1, 2, 'item 16 cat 2 brand 1', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (57, 1, 1, 2, 'item 17 cat 2 brand 1', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (58, 1, 1, 2, 'item 18 cat 2 brand 1', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (59, 1, 1, 2, 'item 19 cat 2 brand 1', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (60, 1, 1, 2, 'item 20 cat 2 brand 1', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (61, 1, 1, 3, 'item 1 cat 3 brand 1', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (62, 1, 1, 3, 'item 2 cat 3 brand 1', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (63, 1, 1, 3, 'item 3 cat 3 brand 1', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (64, 1, 1, 3, 'item 4 cat 3 brand 1', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (65, 1, 1, 3, 'item 5 cat 3 brand 1', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (66, 1, 1, 3, 'item 6 cat 3 brand 1', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (67, 1, 1, 3, 'item 7 cat 3 brand 1', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (68, 1, 1, 3, 'item 8 cat 3 brand 1', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (69, 1, 1, 3, 'item 9 cat 3 brand 1', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (70, 1, 1, 3, 'item 10 cat 3 brand 1', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (71, 1, 1, 3, 'item 11 cat 3 brand 1', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (72, 1, 1, 3, 'item 12 cat 3 brand 1', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (73, 1, 1, 3, 'item 13 cat 3 brand 1', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (74, 1, 1, 3, 'item 14 cat 3 brand 1', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (75, 1, 1, 3, 'item 15 cat 3 brand 1', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (76, 1, 1, 3, 'item 16 cat 3 brand 1', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (77, 1, 1, 3, 'item 17 cat 3 brand 1', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (78, 1, 1, 3, 'item 18 cat 3 brand 1', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (79, 1, 1, 3, 'item 19 cat 3 brand 1', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (80, 1, 1, 3, 'item 20 cat 3 brand 1', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (81, 1, 2, 1, 'item 1 cat 1 brand 2', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (82, 1, 2, 1, 'item 2 cat 1 brand 2', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (83, 1, 2, 1, 'item 3 cat 1 brand 2', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (84, 1, 2, 1, 'item 4 cat 1 brand 2', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (85, 1, 2, 1, 'item 5 cat 1 brand 2', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (86, 1, 2, 1, 'item 6 cat 1 brand 2', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (87, 1, 2, 1, 'item 7 cat 1 brand 2', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (88, 1, 2, 1, 'item 8 cat 1 brand 2', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (89, 1, 2, 1, 'item 9 cat 1 brand 2', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (90, 1, 2, 1, 'item 10 cat 1 brand 2', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (91, 1, 2, 1, 'item 11 cat 1 brand 2', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (92, 1, 2, 1, 'item 12 cat 1 brand 2', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (93, 1, 2, 1, 'item 13 cat 1 brand 2', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (94, 1, 2, 1, 'item 14 cat 1 brand 2', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (95, 1, 2, 1, 'item 15 cat 1 brand 2', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (96, 1, 2, 1, 'item 16 cat 1 brand 2', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (97, 1, 2, 1, 'item 17 cat 1 brand 2', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (98, 1, 2, 1, 'item 18 cat 1 brand 2', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (99, 1, 2, 1, 'item 19 cat 1 brand 2', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (100, 1, 2, 1, 'item 20 cat 1 brand 2', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (101, 1, 2, 2, 'item 1 cat 2 brand 2', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (102, 1, 2, 2, 'item 2 cat 2 brand 2', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (103, 1, 2, 2, 'item 3 cat 2 brand 2', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (104, 1, 2, 2, 'item 4 cat 2 brand 2', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (105, 1, 2, 2, 'item 5 cat 2 brand 2', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (106, 1, 2, 2, 'item 6 cat 2 brand 2', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (107, 1, 2, 2, 'item 7 cat 2 brand 2', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (108, 1, 2, 2, 'item 8 cat 2 brand 2', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (109, 1, 2, 2, 'item 9 cat 2 brand 2', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (110, 1, 2, 2, 'item 10 cat 2 brand 2', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (111, 1, 2, 2, 'item 11 cat 2 brand 2', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (112, 1, 2, 2, 'item 12 cat 2 brand 2', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (113, 1, 2, 2, 'item 13 cat 2 brand 2', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (114, 1, 2, 2, 'item 14 cat 2 brand 2', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (115, 1, 2, 2, 'item 15 cat 2 brand 2', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (116, 1, 2, 2, 'item 16 cat 2 brand 2', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (117, 1, 2, 2, 'item 17 cat 2 brand 2', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (118, 1, 2, 2, 'item 18 cat 2 brand 2', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (119, 1, 2, 2, 'item 19 cat 2 brand 2', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (120, 1, 2, 2, 'item 20 cat 2 brand 2', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (121, 1, 2, 3, 'item 1 cat 3 brand 2', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (122, 1, 2, 3, 'item 2 cat 3 brand 2', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (123, 1, 2, 3, 'item 3 cat 3 brand 2', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (124, 1, 2, 3, 'item 4 cat 3 brand 2', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (125, 1, 2, 3, 'item 5 cat 3 brand 2', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (126, 1, 2, 3, 'item 6 cat 3 brand 2', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (127, 1, 2, 3, 'item 7 cat 3 brand 2', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (128, 1, 2, 3, 'item 8 cat 3 brand 2', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (129, 1, 2, 3, 'item 9 cat 3 brand 2', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (130, 1, 2, 3, 'item 10 cat 3 brand 2', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (131, 1, 2, 3, 'item 11 cat 3 brand 2', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (132, 1, 2, 3, 'item 12 cat 3 brand 2', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (133, 1, 2, 3, 'item 13 cat 3 brand 2', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (134, 1, 2, 3, 'item 14 cat 3 brand 2', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (135, 1, 2, 3, 'item 15 cat 3 brand 2', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (136, 1, 2, 3, 'item 16 cat 3 brand 2', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (137, 1, 2, 3, 'item 17 cat 3 brand 2', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (138, 1, 2, 3, 'item 18 cat 3 brand 2', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (139, 1, 2, 3, 'item 19 cat 3 brand 2', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (140, 1, 2, 3, 'item 20 cat 3 brand 2', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (141, 1, 3, 1, 'item 1 cat 1 brand 3', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (142, 1, 3, 1, 'item 2 cat 1 brand 3', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (143, 1, 3, 1, 'item 3 cat 1 brand 3', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (144, 1, 3, 1, 'item 4 cat 1 brand 3', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (145, 1, 3, 1, 'item 5 cat 1 brand 3', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (146, 1, 3, 1, 'item 6 cat 1 brand 3', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (147, 1, 3, 1, 'item 7 cat 1 brand 3', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (148, 1, 3, 1, 'item 8 cat 1 brand 3', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (149, 1, 3, 1, 'item 9 cat 1 brand 3', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (150, 1, 3, 1, 'item 10 cat 1 brand 3', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (151, 1, 3, 1, 'item 11 cat 1 brand 3', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (152, 1, 3, 1, 'item 12 cat 1 brand 3', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (153, 1, 3, 1, 'item 13 cat 1 brand 3', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (154, 1, 3, 1, 'item 14 cat 1 brand 3', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (155, 1, 3, 1, 'item 15 cat 1 brand 3', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (156, 1, 3, 1, 'item 16 cat 1 brand 3', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (157, 1, 3, 1, 'item 17 cat 1 brand 3', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (158, 1, 3, 1, 'item 18 cat 1 brand 3', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (159, 1, 3, 1, 'item 19 cat 1 brand 3', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (160, 1, 3, 1, 'item 20 cat 1 brand 3', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (161, 1, 3, 2, 'item 1 cat 2 brand 3', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (162, 1, 3, 2, 'item 2 cat 2 brand 3', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (163, 1, 3, 2, 'item 3 cat 2 brand 3', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (164, 1, 3, 2, 'item 4 cat 2 brand 3', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (165, 1, 3, 2, 'item 5 cat 2 brand 3', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (166, 1, 3, 2, 'item 6 cat 2 brand 3', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (167, 1, 3, 2, 'item 7 cat 2 brand 3', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (168, 1, 3, 2, 'item 8 cat 2 brand 3', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (169, 1, 3, 2, 'item 9 cat 2 brand 3', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (170, 1, 3, 2, 'item 10 cat 2 brand 3', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (171, 1, 3, 2, 'item 11 cat 2 brand 3', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (172, 1, 3, 2, 'item 12 cat 2 brand 3', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (173, 1, 3, 2, 'item 13 cat 2 brand 3', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (174, 1, 3, 2, 'item 14 cat 2 brand 3', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (175, 1, 3, 2, 'item 15 cat 2 brand 3', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (176, 1, 3, 2, 'item 16 cat 2 brand 3', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (177, 1, 3, 2, 'item 17 cat 2 brand 3', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (178, 1, 3, 2, 'item 18 cat 2 brand 3', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (179, 1, 3, 2, 'item 19 cat 2 brand 3', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (180, 1, 3, 2, 'item 20 cat 2 brand 3', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (181, 1, 3, 3, 'item 1 cat 3 brand 3', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (182, 1, 3, 3, 'item 2 cat 3 brand 3', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (183, 1, 3, 3, 'item 3 cat 3 brand 3', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (184, 1, 3, 3, 'item 4 cat 3 brand 3', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (185, 1, 3, 3, 'item 5 cat 3 brand 3', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (186, 1, 3, 3, 'item 6 cat 3 brand 3', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (187, 1, 3, 3, 'item 7 cat 3 brand 3', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (188, 1, 3, 3, 'item 8 cat 3 brand 3', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (189, 1, 3, 3, 'item 9 cat 3 brand 3', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (190, 1, 3, 3, 'item 10 cat 3 brand 3', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (191, 1, 3, 3, 'item 11 cat 3 brand 3', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (192, 1, 3, 3, 'item 12 cat 3 brand 3', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (193, 1, 3, 3, 'item 13 cat 3 brand 3', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (194, 1, 3, 3, 'item 14 cat 3 brand 3', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (195, 1, 3, 3, 'item 15 cat 3 brand 3', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (196, 1, 3, 3, 'item 16 cat 3 brand 3', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (197, 1, 3, 3, 'item 17 cat 3 brand 3', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (198, 1, 3, 3, 'item 18 cat 3 brand 3', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (199, 1, 3, 3, 'item 19 cat 3 brand 3', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (200, 1, 3, 3, 'item 20 cat 3 brand 3', NULL, 1000, 20, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:24:22.099', '2023-08-03 01:24:22.099', NULL);
INSERT INTO `items` VALUES (201, 1, 2, 3, 'item baru di update', 'updated item baru', 3205, 54, 'SYSTEM', 'SYSTEM', NULL, '2023-08-03 01:44:48.894', '2023-08-03 08:47:48.082', NULL);

SET FOREIGN_KEY_CHECKS = 1;
