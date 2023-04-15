/*
 Navicat Premium Data Transfer

 Source Server         : docker mysql
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : 192.168.1.2:3306
 Source Schema         : danspro

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 15/04/2023 16:52:47
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ACCOUNT
-- ----------------------------
DROP TABLE IF EXISTS `ACCOUNT`;
CREATE TABLE `ACCOUNT`  (
  `ACC_NUMBER` char(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ACC_OWNER` int(0) NULL DEFAULT NULL,
  `ACC_DATE_CREATED` datetime(0) NULL DEFAULT NULL,
  `ACC_BALANCE` decimal(10, 0) NULL DEFAULT NULL,
  INDEX `FK_CUSTOMER`(`ACC_OWNER`) USING BTREE,
  INDEX `ACC_NUMBER`(`ACC_NUMBER`) USING BTREE,
  CONSTRAINT `FK_CUSTOMER` FOREIGN KEY (`ACC_OWNER`) REFERENCES `CUSTOMER` (`CUST_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ACCOUNT
-- ----------------------------
INSERT INTO `ACCOUNT` VALUES ('112233', 1, '2023-04-13 15:49:35', 1000000);
INSERT INTO `ACCOUNT` VALUES ('112244', 1, '2023-04-12 15:49:52', 150000);
INSERT INTO `ACCOUNT` VALUES ('332211', 2, '2023-04-29 16:01:22', 250000);
INSERT INTO `ACCOUNT` VALUES ('554433', 2, '2023-04-13 16:01:44', 10000000);
INSERT INTO `ACCOUNT` VALUES ('588665', 2, '2023-04-20 16:02:00', 550000);

-- ----------------------------
-- Table structure for CUSTOMER
-- ----------------------------
DROP TABLE IF EXISTS `CUSTOMER`;
CREATE TABLE `CUSTOMER`  (
  `CUST_ID` int(0) NOT NULL AUTO_INCREMENT,
  `CUST_FIRSTNAME` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `CUST_LASTNAME` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `CUST_BIRTHDATE` datetime(0) NULL DEFAULT NULL,
  `CUST_GENDER` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `CUST_ADDRESS` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `CUST_CITY` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `CUST_POSTCODE` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`CUST_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of CUSTOMER
-- ----------------------------
INSERT INTO `CUSTOMER` VALUES (1, 'Yogi', 'Lestari', '1995-06-01 15:47:25', 'L', 'Bogor', 'Bogor', '112');
INSERT INTO `CUSTOMER` VALUES (2, 'John', 'Michael', '1998-07-01 15:48:26', 'L', 'Jakarta', 'jakarta', '2233');

-- ----------------------------
-- Table structure for TRANSACTION
-- ----------------------------
DROP TABLE IF EXISTS `TRANSACTION`;
CREATE TABLE `TRANSACTION`  (
  `TRS_ID` int(0) NOT NULL AUTO_INCREMENT,
  `TRS_FROM_ACCOUNT` char(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `TRS_DATE` datetime(0) NULL DEFAULT NULL,
  `TRS_AMOUNT` decimal(10, 0) NULL DEFAULT NULL,
  `TRS_TYPE` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`TRS_ID`) USING BTREE,
  INDEX `FK_ACCOUNT`(`TRS_FROM_ACCOUNT`) USING BTREE,
  CONSTRAINT `FK_ACCOUNT` FOREIGN KEY (`TRS_FROM_ACCOUNT`) REFERENCES `ACCOUNT` (`ACC_NUMBER`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of TRANSACTION
-- ----------------------------
INSERT INTO `TRANSACTION` VALUES (1, '112233', '2023-04-04 15:50:52', 500000, 'DB');
INSERT INTO `TRANSACTION` VALUES (2, '112233', '2023-04-14 15:51:29', 100000, 'CR');
INSERT INTO `TRANSACTION` VALUES (3, '112244', '2023-04-16 15:51:59', 500000, 'TF');
INSERT INTO `TRANSACTION` VALUES (4, '332211', '2023-04-24 15:50:52', 1500000, 'DB');
INSERT INTO `TRANSACTION` VALUES (5, '554433', '2023-04-10 15:51:29', 1100000, 'CR');
INSERT INTO `TRANSACTION` VALUES (6, '588665', '2023-04-26 15:51:59', 1500000, 'TF');
INSERT INTO `TRANSACTION` VALUES (7, '588665', '2023-04-16 15:51:59', 200000, 'TF');

-- ----------------------------
-- Table structure for TRANSACTION_TRASFER
-- ----------------------------
DROP TABLE IF EXISTS `TRANSACTION_TRASFER`;
CREATE TABLE `TRANSACTION_TRASFER`  (
  `TRS_ID` int(0) NOT NULL,
  `TRS_TO_ACCOUNT` char(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `TRS_STATUS` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`TRS_ID`) USING BTREE,
  INDEX `FK_ACCOUNT_TF`(`TRS_TO_ACCOUNT`) USING BTREE,
  CONSTRAINT `FK_TRANSACTION` FOREIGN KEY (`TRS_ID`) REFERENCES `TRANSACTION` (`TRS_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_ACCOUNT_TF` FOREIGN KEY (`TRS_TO_ACCOUNT`) REFERENCES `ACCOUNT` (`ACC_NUMBER`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of TRANSACTION_TRASFER
-- ----------------------------
INSERT INTO `TRANSACTION_TRASFER` VALUES (3, '112233', '1');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, 'USER');
INSERT INTO `roles` VALUES (2, 'ADMIN');

-- ----------------------------
-- Table structure for user_roles
-- ----------------------------
DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE `user_roles`  (
  `user_id` bigint(0) NOT NULL,
  `role_id` int(0) NOT NULL,
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE,
  INDEX `FKh8ciramu9cc9q3qcqiv4ue8a6`(`role_id`) USING BTREE,
  CONSTRAINT `FKh8ciramu9cc9q3qcqiv4ue8a6` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKhfh9dx7w3ubf1co1vdev94g3f` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_roles
-- ----------------------------
INSERT INTO `user_roles` VALUES (1, 1);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `password` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UKr43af9ap4edm43mmtq01oddj6`(`username`) USING BTREE,
  UNIQUE INDEX `UK6dotkott2kjsp8vw4d0m25fb7`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'ogilestari45@gmail.com', '$2a$10$mSpa0NG791WZZDvEg3Rxg.Pwe50UYVgGlsU86i2lE9lOnx9FDjRS6', 'yogi1213');

SET FOREIGN_KEY_CHECKS = 1;
