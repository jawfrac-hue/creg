SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `login` varchar(30) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `password` varchar(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `social_id` varchar(13) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_testor` tinyint(1) NOT NULL DEFAULT 0,
  `status` varchar(8) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT 'OK',
  `newsletter` tinyint(1) NULL DEFAULT 0,
  `empire` tinyint(4) NOT NULL DEFAULT 0,
  `name_checked` tinyint(1) NOT NULL DEFAULT 0,
  `availDt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `mileage` int(11) NOT NULL DEFAULT 0,
  `cash` int(11) NOT NULL DEFAULT 0,
  `gold_expire` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `silver_expire` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `safebox_expire` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `autoloot_expire` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `fish_mind_expire` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `marriage_fast_expire` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `money_drop_rate_expire` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `total_cash` int(11) NOT NULL DEFAULT 0,
  `total_mileage` int(11) NOT NULL DEFAULT 0,
  `channel_company` varchar(30) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL DEFAULT '',
  `ip` varchar(45) CHARACTER SET ascii COLLATE ascii_general_ci NULL DEFAULT NULL,
  `last_play` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `login`(`login` ASC) USING BTREE,
  INDEX `social_id`(`social_id` ASC) USING BTREE,
  UNIQUE INDEX `account_email`(`email` ASC) USING BTREE,
  UNIQUE INDEX `account_id`(`id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = ascii COLLATE = ascii_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES (1, 'admin', '$argon2id$v=19$m=12288,t=3,p=1$OUo2azMvdGRyeDZ2NkZGNg$xoXMX5OKjQfs2Pc03s8cKlNwht7GebOTCJY4B1d85Co', '1234567', 'admin@example.com', '0000-00-00 00:00:00', 0, 'OK', 0, 0, 0, '0000-00-00 00:00:00', 0, 1650, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, '', NULL, '2021-11-21 20:10:46');
INSERT INTO `account` VALUES (2, 'test', '$argon2id$v=19$m=12288,t=3,p=1$OUo2azMvdGRyeDZ2NkZGNg$xoXMX5OKjQfs2Pc03s8cKlNwht7GebOTCJY4B1d85Co', '1234567', 'test@example.com', '0000-00-00 00:00:00', 0, 'OK', 0, 0, 0, '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, '', NULL, '2021-08-06 11:42:12');

-- ----------------------------
-- Table structure for gametime
-- ----------------------------
DROP TABLE IF EXISTS `gametime`;
CREATE TABLE `gametime`  (
  `UserID` varchar(50) CHARACTER SET euckr COLLATE euckr_korean_ci NOT NULL DEFAULT '',
  `paymenttype` tinyint(2) NOT NULL DEFAULT 1,
  `LimitTime` int(11) NULL DEFAULT 0,
  `LimitDt` datetime NULL DEFAULT '1990-01-01 00:00:00',
  `Scores` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`UserID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = euckr COLLATE = euckr_korean_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gametime
-- ----------------------------

-- ----------------------------
-- Table structure for gametimeip
-- ----------------------------
DROP TABLE IF EXISTS `gametimeip`;
CREATE TABLE `gametimeip`  (
  `ipid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET euckr COLLATE euckr_korean_ci NULL DEFAULT NULL,
  `ip` varchar(11) CHARACTER SET euckr COLLATE euckr_korean_ci NOT NULL DEFAULT '000.000.000',
  `startIP` int(11) NOT NULL DEFAULT 0,
  `endIP` int(11) NOT NULL DEFAULT 255,
  `paymenttype` tinyint(2) NOT NULL DEFAULT 1,
  `LimitTime` int(11) NOT NULL DEFAULT 0,
  `LimitDt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `readme` varchar(128) CHARACTER SET euckr COLLATE euckr_korean_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ipid`) USING BTREE,
  UNIQUE INDEX `ip_uniq`(`ip` ASC, `startIP` ASC, `endIP` ASC) USING BTREE,
  INDEX `ip_idx`(`ip` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = euckr COLLATE = euckr_korean_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gametimeip
-- ----------------------------

-- ----------------------------
-- Table structure for gametimelog
-- ----------------------------
DROP TABLE IF EXISTS `gametimelog`;
CREATE TABLE `gametimelog`  (
  `login` varchar(16) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `type` enum('IP_FREE','FREE','IP_TIME','IP_DAY','TIME','DAY') CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NULL DEFAULT NULL,
  `logon_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `logout_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `use_time` int(11) NULL DEFAULT NULL,
  `ip` varchar(15) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL DEFAULT '000.000.000.000',
  `server` varchar(32) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci NOT NULL DEFAULT '',
  INDEX `login_key`(`login` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = gb2312 COLLATE = gb2312_chinese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gametimelog
-- ----------------------------

-- ----------------------------
-- Table structure for string
-- ----------------------------
DROP TABLE IF EXISTS `string`;
CREATE TABLE `string`  (
  `name` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `text` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of string
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
