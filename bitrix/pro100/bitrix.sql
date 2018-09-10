/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 50635
 Source Host           : localhost
 Source Database       : bitrix

 Target Server Type    : MySQL
 Target Server Version : 50635
 File Encoding         : utf-8

 Date: 05/10/2017 15:27:44 PM
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `b_admin_notify`
-- ----------------------------
DROP TABLE IF EXISTS `b_admin_notify`;
CREATE TABLE `b_admin_notify` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TAG` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MESSAGE` text COLLATE utf8_unicode_ci,
  `ENABLE_CLOSE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `PUBLIC_SECTION` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `IX_AD_TAG` (`TAG`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_admin_notify_lang`
-- ----------------------------
DROP TABLE IF EXISTS `b_admin_notify_lang`;
CREATE TABLE `b_admin_notify_lang` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `NOTIFY_ID` int(18) NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_ADM_NTFY_LANG` (`NOTIFY_ID`,`LID`),
  KEY `IX_ADM_NTFY_LID` (`LID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_agent`
-- ----------------------------
DROP TABLE IF EXISTS `b_agent`;
CREATE TABLE `b_agent` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(18) NOT NULL DEFAULT '100',
  `NAME` text COLLATE utf8_unicode_ci,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `LAST_EXEC` datetime DEFAULT NULL,
  `NEXT_EXEC` datetime NOT NULL,
  `DATE_CHECK` datetime DEFAULT NULL,
  `AGENT_INTERVAL` int(18) DEFAULT '86400',
  `IS_PERIOD` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `USER_ID` int(18) DEFAULT NULL,
  `RUNNING` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `ix_act_next_exec` (`ACTIVE`,`NEXT_EXEC`),
  KEY `ix_agent_user_id` (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `b_agent`
-- ----------------------------
BEGIN;
INSERT INTO `b_agent` VALUES ('1', 'main', '100', 'CEvent::CleanUpAgent();', 'Y', '2017-05-10 15:24:01', '2017-05-11 00:00:00', null, '86400', 'Y', null, 'N'), ('2', 'main', '100', 'CUser::CleanUpHitAuthAgent();', 'Y', '2017-05-10 15:24:01', '2017-05-11 00:00:00', null, '86400', 'Y', null, 'N'), ('3', 'main', '100', 'CCaptchaAgent::DeleteOldCaptcha(3600);', 'Y', '2017-05-10 15:15:44', '2017-05-10 16:15:44', null, '3600', 'N', null, 'N'), ('4', 'main', '100', 'CUndo::CleanUpOld();', 'Y', '2017-05-10 15:24:01', '2017-05-11 00:00:00', null, '86400', 'Y', null, 'N'), ('5', 'main', '100', 'CSiteCheckerTest::CommonTest();', 'Y', '2017-05-10 15:15:44', '2017-05-11 15:15:44', null, '86400', 'N', null, 'N'), ('6', 'main', '100', '\\Bitrix\\Main\\Analytics\\CounterDataTable::submitData();', 'Y', '2017-05-10 15:26:43', '2017-05-10 15:27:43', null, '60', 'N', null, 'N'), ('7', 'forum', '100', 'CForumStat::CleanUp();', 'Y', '2017-05-10 15:15:44', '2017-05-11 15:15:44', null, '86400', 'N', null, 'N'), ('8', 'forum', '100', 'CForumFiles::CleanUp();', 'Y', '2017-05-10 15:15:44', '2017-05-11 15:15:44', null, '86400', 'N', null, 'N'), ('9', 'search', '10', 'CSearchSuggest::CleanUpAgent();', 'Y', '2017-05-10 15:15:45', '2017-05-11 15:15:45', null, '86400', 'N', null, 'N'), ('10', 'search', '10', 'CSearchStatistic::CleanUpAgent();', 'Y', '2017-05-10 15:15:45', '2017-05-11 15:15:45', null, '86400', 'N', null, 'N'), ('11', 'security', '100', 'CSecuritySession::CleanUpAgent();', 'Y', '2017-05-10 15:15:45', '2017-05-10 15:45:45', null, '1800', 'N', null, 'N'), ('12', 'security', '100', 'CSecurityIPRule::CleanUpAgent();', 'Y', '2017-05-10 15:15:45', '2017-05-10 16:15:45', null, '3600', 'N', null, 'N'), ('13', 'seo', '100', 'Bitrix\\Seo\\Engine\\YandexDirect::updateAgent();', 'Y', '2017-05-10 15:15:45', '2017-05-10 16:15:45', null, '3600', 'N', null, 'N'), ('14', 'seo', '100', 'Bitrix\\Seo\\Adv\\LogTable::clean();', 'Y', '2017-05-10 15:15:45', '2017-05-11 15:15:45', null, '86400', 'N', null, 'N'), ('15', 'seo', '100', 'Bitrix\\Seo\\Adv\\Auto::checkQuantityAgent();', 'Y', '2017-05-10 15:15:45', '2017-05-10 16:15:45', null, '3600', 'N', null, 'N'), ('16', 'subscribe', '100', 'CSubscription::CleanUp();', 'Y', '2017-05-10 15:24:01', '2017-05-11 03:00:00', null, '86400', 'Y', null, 'N');
COMMIT;

-- ----------------------------
--  Table structure for `b_app_password`
-- ----------------------------
DROP TABLE IF EXISTS `b_app_password`;
CREATE TABLE `b_app_password` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `APPLICATION_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PASSWORD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DIGEST_PASSWORD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `DATE_LOGIN` datetime DEFAULT NULL,
  `LAST_IP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COMMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SYSCOMMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_app_password_user` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_bitrixcloud_option`
-- ----------------------------
DROP TABLE IF EXISTS `b_bitrixcloud_option`;
CREATE TABLE `b_bitrixcloud_option` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int(11) NOT NULL,
  `PARAM_KEY` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PARAM_VALUE` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_bitrixcloud_option_1` (`NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `b_bitrixcloud_option`
-- ----------------------------
BEGIN;
INSERT INTO `b_bitrixcloud_option` VALUES ('1', 'backup_quota', '0', '0', '0'), ('2', 'backup_total_size', '0', '0', '0'), ('3', 'backup_last_backup_time', '0', '0', '1493988756'), ('4', 'monitoring_expire_time', '0', '0', '1494417234');
COMMIT;

-- ----------------------------
--  Table structure for `b_blog`
-- ----------------------------
DROP TABLE IF EXISTS `b_blog`;
CREATE TABLE `b_blog` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `DATE_CREATE` datetime NOT NULL,
  `DATE_UPDATE` datetime NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `OWNER_ID` int(11) DEFAULT NULL,
  `SOCNET_GROUP_ID` int(11) DEFAULT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `REAL_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GROUP_ID` int(11) NOT NULL,
  `ENABLE_COMMENTS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ENABLE_IMG_VERIF` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ENABLE_RSS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `LAST_POST_ID` int(11) DEFAULT NULL,
  `LAST_POST_DATE` datetime DEFAULT NULL,
  `AUTO_GROUPS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL_NOTIFY` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_HTML` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SEARCH_INDEX` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `USE_SOCNET` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_BLOG_4` (`URL`),
  KEY `IX_BLOG_BLOG_1` (`GROUP_ID`,`ACTIVE`),
  KEY `IX_BLOG_BLOG_2` (`OWNER_ID`),
  KEY `IX_BLOG_BLOG_5` (`LAST_POST_DATE`),
  KEY `IX_BLOG_BLOG_6` (`SOCNET_GROUP_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_blog_category`
-- ----------------------------
DROP TABLE IF EXISTS `b_blog_category`;
CREATE TABLE `b_blog_category` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BLOG_ID` int(11) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_CAT_1` (`BLOG_ID`,`NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_blog_comment`
-- ----------------------------
DROP TABLE IF EXISTS `b_blog_comment`;
CREATE TABLE `b_blog_comment` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BLOG_ID` int(11) NOT NULL,
  `POST_ID` int(11) NOT NULL,
  `PARENT_ID` int(11) DEFAULT NULL,
  `AUTHOR_ID` int(11) DEFAULT NULL,
  `ICON_ID` int(11) DEFAULT NULL,
  `AUTHOR_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUTHOR_EMAIL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUTHOR_IP` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUTHOR_IP1` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATE_CREATE` datetime NOT NULL,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `POST_TEXT` text COLLATE utf8_unicode_ci NOT NULL,
  `PUBLISH_STATUS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'P',
  `HAS_PROPS` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SHARE_DEST` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PATH` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_COMM_1` (`BLOG_ID`,`POST_ID`),
  KEY `IX_BLOG_COMM_2` (`AUTHOR_ID`),
  KEY `IX_BLOG_COMM_3` (`DATE_CREATE`,`AUTHOR_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_blog_group`
-- ----------------------------
DROP TABLE IF EXISTS `b_blog_group`;
CREATE TABLE `b_blog_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_GROUP_1` (`SITE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_blog_image`
-- ----------------------------
DROP TABLE IF EXISTS `b_blog_image`;
CREATE TABLE `b_blog_image` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FILE_ID` int(11) NOT NULL DEFAULT '0',
  `BLOG_ID` int(11) NOT NULL DEFAULT '0',
  `POST_ID` int(11) NOT NULL DEFAULT '0',
  `USER_ID` int(11) NOT NULL DEFAULT '0',
  `TIMESTAMP_X` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IMAGE_SIZE` int(11) NOT NULL DEFAULT '0',
  `IS_COMMENT` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `COMMENT_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_IMAGE_1` (`POST_ID`,`BLOG_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_blog_post`
-- ----------------------------
DROP TABLE IF EXISTS `b_blog_post`;
CREATE TABLE `b_blog_post` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `BLOG_ID` int(11) NOT NULL,
  `AUTHOR_ID` int(11) NOT NULL,
  `PREVIEW_TEXT` text COLLATE utf8_unicode_ci,
  `PREVIEW_TEXT_TYPE` char(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `DETAIL_TEXT` text COLLATE utf8_unicode_ci NOT NULL,
  `DETAIL_TEXT_TYPE` char(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `DATE_CREATE` datetime NOT NULL,
  `DATE_PUBLISH` datetime NOT NULL,
  `KEYWORDS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PUBLISH_STATUS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'P',
  `CATEGORY_ID` char(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ATRIBUTE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ENABLE_TRACKBACK` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ENABLE_COMMENTS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ATTACH_IMG` int(11) DEFAULT NULL,
  `NUM_COMMENTS` int(11) NOT NULL DEFAULT '0',
  `NUM_TRACKBACKS` int(11) NOT NULL DEFAULT '0',
  `VIEWS` int(11) DEFAULT NULL,
  `FAVORITE_SORT` int(11) DEFAULT NULL,
  `PATH` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MICRO` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `HAS_IMAGES` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HAS_PROPS` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HAS_TAGS` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HAS_COMMENT_IMAGES` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HAS_SOCNET_ALL` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SEO_TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SEO_TAGS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SEO_DESCRIPTION` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_POST_1` (`BLOG_ID`,`PUBLISH_STATUS`,`DATE_PUBLISH`),
  KEY `IX_BLOG_POST_2` (`BLOG_ID`,`DATE_PUBLISH`,`PUBLISH_STATUS`),
  KEY `IX_BLOG_POST_3` (`BLOG_ID`,`CATEGORY_ID`),
  KEY `IX_BLOG_POST_4` (`PUBLISH_STATUS`,`DATE_PUBLISH`),
  KEY `IX_BLOG_POST_5` (`DATE_PUBLISH`,`AUTHOR_ID`),
  KEY `IX_BLOG_POST_CODE` (`BLOG_ID`,`CODE`),
  KEY `IX_BLOG_POST_6` (`CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_blog_post_category`
-- ----------------------------
DROP TABLE IF EXISTS `b_blog_post_category`;
CREATE TABLE `b_blog_post_category` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BLOG_ID` int(11) NOT NULL,
  `POST_ID` int(11) NOT NULL,
  `CATEGORY_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_POST_CATEGORY` (`POST_ID`,`CATEGORY_ID`),
  KEY `IX_BLOG_POST_CATEGORY_CAT_ID` (`CATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_blog_post_param`
-- ----------------------------
DROP TABLE IF EXISTS `b_blog_post_param`;
CREATE TABLE `b_blog_post_param` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `POST_ID` int(11) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_PP_1` (`POST_ID`,`USER_ID`),
  KEY `IX_BLOG_PP_2` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_blog_site_path`
-- ----------------------------
DROP TABLE IF EXISTS `b_blog_site_path`;
CREATE TABLE `b_blog_site_path` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `PATH` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_SITE_PATH_2` (`SITE_ID`,`TYPE`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `b_blog_site_path`
-- ----------------------------
BEGIN;
INSERT INTO `b_blog_site_path` VALUES ('1', 's1', '/', 'B'), ('2', 's1', '/#post_id#/', 'P');
COMMIT;

-- ----------------------------
--  Table structure for `b_blog_smile`
-- ----------------------------
DROP TABLE IF EXISTS `b_blog_smile`;
CREATE TABLE `b_blog_smile` (
  `ID` smallint(3) NOT NULL AUTO_INCREMENT,
  `SMILE_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'S',
  `TYPING` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IMAGE` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CLICKABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SORT` int(10) NOT NULL DEFAULT '150',
  `IMAGE_WIDTH` int(11) NOT NULL DEFAULT '0',
  `IMAGE_HEIGHT` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `b_blog_smile`
-- ----------------------------
BEGIN;
INSERT INTO `b_blog_smile` VALUES ('1', 'S', ':D :-D', 'icon_biggrin.png', null, 'Y', '120', '16', '16'), ('2', 'S', ':) :-)', 'icon_smile.png', null, 'Y', '100', '16', '16'), ('3', 'S', ':( :-(', 'icon_sad.png', null, 'Y', '140', '16', '16'), ('4', 'S', ':o :-o :shock:', 'icon_eek.png', null, 'Y', '180', '16', '16'), ('5', 'S', '8) 8-)', 'icon_cool.png', null, 'Y', '130', '16', '16'), ('6', 'S', ':{} :-{}', 'icon_kiss.png', null, 'Y', '200', '16', '16'), ('7', 'S', ':oops:', 'icon_redface.png', null, 'Y', '190', '16', '16'), ('8', 'S', ':cry: :~(', 'icon_cry.png', null, 'Y', '160', '16', '16'), ('9', 'S', ':evil: >:-<', 'icon_evil.png', null, 'Y', '170', '16', '16'), ('10', 'S', ';) ;-)', 'icon_wink.png', null, 'Y', '110', '16', '16'), ('11', 'S', ':!:', 'icon_exclaim.png', null, 'Y', '220', '16', '16'), ('12', 'S', ':?:', 'icon_question.png', null, 'Y', '210', '16', '16'), ('13', 'S', ':idea:', 'icon_idea.png', null, 'Y', '230', '16', '16'), ('14', 'S', ':| :-|', 'icon_neutral.png', null, 'Y', '150', '16', '16');
COMMIT;

-- ----------------------------
--  Table structure for `b_blog_smile_lang`
-- ----------------------------
DROP TABLE IF EXISTS `b_blog_smile_lang`;
CREATE TABLE `b_blog_smile_lang` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SMILE_ID` int(11) NOT NULL DEFAULT '0',
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_SMILE_K` (`SMILE_ID`,`LID`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `b_blog_smile_lang`
-- ----------------------------
BEGIN;
INSERT INTO `b_blog_smile_lang` VALUES ('1', '1', 'ru', 'Широкая улыбка'), ('2', '1', 'en', 'Big grin'), ('3', '2', 'ru', 'С улыбкой'), ('4', '2', 'en', 'Smile'), ('5', '3', 'ru', 'Печально'), ('6', '3', 'en', 'Sad'), ('7', '4', 'ru', 'Удивленно'), ('8', '4', 'en', 'Surprised'), ('9', '5', 'ru', 'Здорово'), ('10', '5', 'en', 'Cool'), ('11', '6', 'ru', 'Поцелуй'), ('12', '6', 'en', 'Kiss'), ('13', '7', 'ru', 'Смущенный'), ('14', '7', 'en', 'Embarrassed'), ('15', '8', 'ru', 'Очень грустно'), ('16', '8', 'en', 'Crying'), ('17', '9', 'ru', 'Со злостью'), ('18', '9', 'en', 'Angry'), ('19', '10', 'ru', 'Шутливо'), ('20', '10', 'en', 'Wink'), ('21', '11', 'ru', 'Восклицание'), ('22', '11', 'en', 'Exclamation'), ('23', '12', 'ru', 'Вопрос'), ('24', '12', 'en', 'Question'), ('25', '13', 'ru', 'Идея'), ('26', '13', 'en', 'Idea'), ('27', '14', 'ru', 'Скептически'), ('28', '14', 'en', 'Skeptic');
COMMIT;

-- ----------------------------
--  Table structure for `b_blog_socnet`
-- ----------------------------
DROP TABLE IF EXISTS `b_blog_socnet`;
CREATE TABLE `b_blog_socnet` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BLOG_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_SOCNET` (`BLOG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_blog_socnet_rights`
-- ----------------------------
DROP TABLE IF EXISTS `b_blog_socnet_rights`;
CREATE TABLE `b_blog_socnet_rights` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `POST_ID` int(11) NOT NULL,
  `ENTITY_TYPE` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `ENTITY` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_SR_1` (`POST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_blog_trackback`
-- ----------------------------
DROP TABLE IF EXISTS `b_blog_trackback`;
CREATE TABLE `b_blog_trackback` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PREVIEW_TEXT` text COLLATE utf8_unicode_ci NOT NULL,
  `BLOG_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `POST_DATE` datetime NOT NULL,
  `BLOG_ID` int(11) NOT NULL,
  `POST_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_TRBK_1` (`BLOG_ID`,`POST_ID`),
  KEY `IX_BLOG_TRBK_2` (`POST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_blog_user`
-- ----------------------------
DROP TABLE IF EXISTS `b_blog_user`;
CREATE TABLE `b_blog_user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `ALIAS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `AVATAR` int(11) DEFAULT NULL,
  `INTERESTS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_VISIT` datetime DEFAULT NULL,
  `DATE_REG` datetime NOT NULL,
  `ALLOW_POST` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_USER_1` (`USER_ID`),
  KEY `IX_BLOG_USER_2` (`ALIAS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_blog_user2blog`
-- ----------------------------
DROP TABLE IF EXISTS `b_blog_user2blog`;
CREATE TABLE `b_blog_user2blog` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `BLOG_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_USER2GROUP_1` (`BLOG_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_blog_user2user_group`
-- ----------------------------
DROP TABLE IF EXISTS `b_blog_user2user_group`;
CREATE TABLE `b_blog_user2user_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `BLOG_ID` int(11) NOT NULL,
  `USER_GROUP_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_USER2GROUP_1` (`USER_ID`,`BLOG_ID`,`USER_GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_blog_user_group`
-- ----------------------------
DROP TABLE IF EXISTS `b_blog_user_group`;
CREATE TABLE `b_blog_user_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BLOG_ID` int(11) DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_USER_GROUP_1` (`BLOG_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `b_blog_user_group`
-- ----------------------------
BEGIN;
INSERT INTO `b_blog_user_group` VALUES ('1', null, 'all'), ('2', null, 'registered');
COMMIT;

-- ----------------------------
--  Table structure for `b_blog_user_group_perms`
-- ----------------------------
DROP TABLE IF EXISTS `b_blog_user_group_perms`;
CREATE TABLE `b_blog_user_group_perms` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BLOG_ID` int(11) NOT NULL,
  `USER_GROUP_ID` int(11) NOT NULL,
  `PERMS_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'P',
  `POST_ID` int(11) DEFAULT NULL,
  `PERMS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'D',
  `AUTOSET` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_UG_PERMS_1` (`BLOG_ID`,`USER_GROUP_ID`,`PERMS_TYPE`,`POST_ID`),
  KEY `IX_BLOG_UG_PERMS_2` (`USER_GROUP_ID`,`PERMS_TYPE`,`POST_ID`),
  KEY `IX_BLOG_UG_PERMS_3` (`POST_ID`,`USER_GROUP_ID`,`PERMS_TYPE`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_cache_tag`
-- ----------------------------
DROP TABLE IF EXISTS `b_cache_tag`;
CREATE TABLE `b_cache_tag` (
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CACHE_SALT` char(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RELATIVE_PATH` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TAG` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `ix_b_cache_tag_0` (`SITE_ID`,`CACHE_SALT`,`RELATIVE_PATH`(50)),
  KEY `ix_b_cache_tag_1` (`TAG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `b_cache_tag`
-- ----------------------------
BEGIN;
INSERT INTO `b_cache_tag` VALUES (null, null, '0:1494415622', '**'), ('s1', '/e25', '/s1/bitrix/search.tags.cloud/345', 'bitrix:search.tags.cloud');
COMMIT;

-- ----------------------------
--  Table structure for `b_captcha`
-- ----------------------------
DROP TABLE IF EXISTS `b_captcha`;
CREATE TABLE `b_captcha` (
  `ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `IP` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_CREATE` datetime NOT NULL,
  UNIQUE KEY `UX_B_CAPTCHA` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_checklist`
-- ----------------------------
DROP TABLE IF EXISTS `b_checklist`;
CREATE TABLE `b_checklist` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_CREATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TESTER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COMPANY_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PICTURE` int(11) DEFAULT NULL,
  `TOTAL` int(11) DEFAULT NULL,
  `SUCCESS` int(11) DEFAULT NULL,
  `FAILED` int(11) DEFAULT NULL,
  `PENDING` int(11) DEFAULT NULL,
  `SKIP` int(11) DEFAULT NULL,
  `STATE` longtext COLLATE utf8_unicode_ci,
  `REPORT_COMMENT` text COLLATE utf8_unicode_ci,
  `REPORT` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `EMAIL` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PHONE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SENDED_TO_BITRIX` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `HIDDEN` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_clouds_file_bucket`
-- ----------------------------
DROP TABLE IF EXISTS `b_clouds_file_bucket`;
CREATE TABLE `b_clouds_file_bucket` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `SORT` int(11) DEFAULT '500',
  `READ_ONLY` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `SERVICE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BUCKET` varchar(63) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LOCATION` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CNAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILE_COUNT` int(11) DEFAULT '0',
  `FILE_SIZE` float DEFAULT '0',
  `LAST_FILE_ID` int(11) DEFAULT NULL,
  `PREFIX` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SETTINGS` text COLLATE utf8_unicode_ci,
  `FILE_RULES` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_clouds_file_resize`
-- ----------------------------
DROP TABLE IF EXISTS `b_clouds_file_resize`;
CREATE TABLE `b_clouds_file_resize` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ERROR_CODE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `FILE_ID` int(11) DEFAULT NULL,
  `PARAMS` text COLLATE utf8_unicode_ci,
  `FROM_PATH` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TO_PATH` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_file_resize_ts` (`TIMESTAMP_X`),
  KEY `ix_b_file_resize_path` (`TO_PATH`(100)),
  KEY `ix_b_file_resize_file` (`FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_clouds_file_upload`
-- ----------------------------
DROP TABLE IF EXISTS `b_clouds_file_upload`;
CREATE TABLE `b_clouds_file_upload` (
  `ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `FILE_PATH` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `FILE_SIZE` int(11) DEFAULT NULL,
  `TMP_FILE` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BUCKET_ID` int(11) NOT NULL,
  `PART_SIZE` int(11) NOT NULL,
  `PART_NO` int(11) NOT NULL,
  `PART_FAIL_COUNTER` int(11) NOT NULL,
  `NEXT_STEP` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_component_params`
-- ----------------------------
DROP TABLE IF EXISTS `b_component_params`;
CREATE TABLE `b_component_params` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `COMPONENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TEMPLATE_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REAL_PATH` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SEF_MODE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SEF_FOLDER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `START_CHAR` int(11) NOT NULL,
  `END_CHAR` int(11) NOT NULL,
  `PARAMETERS` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `ix_comp_params_name` (`COMPONENT_NAME`),
  KEY `ix_comp_params_path` (`SITE_ID`,`REAL_PATH`),
  KEY `ix_comp_params_sname` (`SITE_ID`,`COMPONENT_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_counter_data`
-- ----------------------------
DROP TABLE IF EXISTS `b_counter_data`;
CREATE TABLE `b_counter_data` (
  `ID` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `TYPE` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `DATA` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_culture`
-- ----------------------------
DROP TABLE IF EXISTS `b_culture`;
CREATE TABLE `b_culture` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_DATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_DATETIME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WEEK_START` int(1) DEFAULT '1',
  `CHARSET` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DIRECTION` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `b_culture`
-- ----------------------------
BEGIN;
INSERT INTO `b_culture` VALUES ('1', 'ru', 'ru', 'DD.MM.YYYY', 'DD.MM.YYYY HH:MI:SS', '#NAME# #LAST_NAME#', '1', 'UTF-8', 'Y'), ('2', 'en', 'en', 'MM/DD/YYYY', 'MM/DD/YYYY H:MI:SS T', '#NAME# #LAST_NAME#', '0', 'UTF-8', 'Y');
COMMIT;

-- ----------------------------
--  Table structure for `b_event`
-- ----------------------------
DROP TABLE IF EXISTS `b_event`;
CREATE TABLE `b_event` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `EVENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE_ID` int(18) DEFAULT NULL,
  `LID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `C_FIELDS` longtext COLLATE utf8_unicode_ci,
  `DATE_INSERT` datetime DEFAULT NULL,
  `DATE_EXEC` datetime DEFAULT NULL,
  `SUCCESS_EXEC` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DUPLICATE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`ID`),
  KEY `ix_success` (`SUCCESS_EXEC`),
  KEY `ix_b_event_date_exec` (`DATE_EXEC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_event_attachment`
-- ----------------------------
DROP TABLE IF EXISTS `b_event_attachment`;
CREATE TABLE `b_event_attachment` (
  `EVENT_ID` int(18) NOT NULL,
  `FILE_ID` int(18) NOT NULL,
  `IS_FILE_COPIED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`EVENT_ID`,`FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_event_log`
-- ----------------------------
DROP TABLE IF EXISTS `b_event_log`;
CREATE TABLE `b_event_log` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `SEVERITY` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `AUDIT_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ITEM_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `REMOTE_ADDR` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_AGENT` text COLLATE utf8_unicode_ci,
  `REQUEST_URI` text COLLATE utf8_unicode_ci,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_ID` int(18) DEFAULT NULL,
  `GUEST_ID` int(18) DEFAULT NULL,
  `DESCRIPTION` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `ix_b_event_log_time` (`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_event_message`
-- ----------------------------
DROP TABLE IF EXISTS `b_event_message`;
CREATE TABLE `b_event_message` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `EVENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `EMAIL_FROM` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '#EMAIL_FROM#',
  `EMAIL_TO` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '#EMAIL_TO#',
  `SUBJECT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MESSAGE` longtext COLLATE utf8_unicode_ci,
  `MESSAGE_PHP` longtext COLLATE utf8_unicode_ci,
  `BODY_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `BCC` text COLLATE utf8_unicode_ci,
  `REPLY_TO` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CC` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IN_REPLY_TO` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PRIORITY` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD1_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD1_VALUE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD2_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD2_VALUE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SITE_TEMPLATE_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ADDITIONAL_FIELD` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `ix_b_event_message_name` (`EVENT_NAME`(50))
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `b_event_message`
-- ----------------------------
BEGIN;
INSERT INTO `b_event_message` VALUES ('1', '2017-05-05 16:49:55', 'NEW_USER', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#DEFAULT_EMAIL_FROM#', '#SITE_NAME#: Зарегистрировался новый пользователь', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНа сайте #SERVER_NAME# успешно зарегистрирован новый пользователь.\n\nДанные пользователя:\nID пользователя: #USER_ID#\n\nИмя: #NAME#\nФамилия: #LAST_NAME#\nE-Mail: #EMAIL#\n\nLogin: #LOGIN#\n\nПисьмо сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nНа сайте <?=$arParams[\"SERVER_NAME\"];?> успешно зарегистрирован новый пользователь.\n\nДанные пользователя:\nID пользователя: <?=$arParams[\"USER_ID\"];?>\n\n\nИмя: <?=$arParams[\"NAME\"];?>\n\nФамилия: <?=$arParams[\"LAST_NAME\"];?>\n\nE-Mail: <?=$arParams[\"EMAIL\"];?>\n\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nПисьмо сгенерировано автоматически.', 'text', null, null, null, null, null, null, null, null, null, null, null), ('2', '2017-05-05 16:49:55', 'USER_INFO', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Регистрационная информация', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n#NAME# #LAST_NAME#,\n\n#MESSAGE#\n\nВаша регистрационная информация:\n\nID пользователя: #USER_ID#\nСтатус профиля: #STATUS#\nLogin: #LOGIN#\n\nВы можете изменить пароль, перейдя по следующей ссылке:\nhttp://#SERVER_NAME#/auth/index.php?change_password=yes&lang=ru&USER_CHECKWORD=#CHECKWORD#&USER_LOGIN=#URL_LOGIN#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n<?=$arParams[\"NAME\"];?> <?=$arParams[\"LAST_NAME\"];?>,\n\n<?=$arParams[\"MESSAGE\"];?>\n\n\nВаша регистрационная информация:\n\nID пользователя: <?=$arParams[\"USER_ID\"];?>\n\nСтатус профиля: <?=$arParams[\"STATUS\"];?>\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nВы можете изменить пароль, перейдя по следующей ссылке:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/auth/index.php?change_password=yes&lang=ru&USER_CHECKWORD=<?=$arParams[\"CHECKWORD\"];?>&USER_LOGIN=<?=$arParams[\"URL_LOGIN\"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', null, null, null, null, null, null, null, null, null, null, null), ('3', '2017-05-05 16:49:55', 'USER_PASS_REQUEST', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Запрос на смену пароля', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n#NAME# #LAST_NAME#,\n\n#MESSAGE#\n\nДля смены пароля перейдите по следующей ссылке:\nhttp://#SERVER_NAME#/auth/index.php?change_password=yes&lang=ru&USER_CHECKWORD=#CHECKWORD#&USER_LOGIN=#URL_LOGIN#\n\nВаша регистрационная информация:\n\nID пользователя: #USER_ID#\nСтатус профиля: #STATUS#\nLogin: #LOGIN#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n<?=$arParams[\"NAME\"];?> <?=$arParams[\"LAST_NAME\"];?>,\n\n<?=$arParams[\"MESSAGE\"];?>\n\n\nДля смены пароля перейдите по следующей ссылке:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/auth/index.php?change_password=yes&lang=ru&USER_CHECKWORD=<?=$arParams[\"CHECKWORD\"];?>&USER_LOGIN=<?=$arParams[\"URL_LOGIN\"];?>\n\n\nВаша регистрационная информация:\n\nID пользователя: <?=$arParams[\"USER_ID\"];?>\n\nСтатус профиля: <?=$arParams[\"STATUS\"];?>\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', null, null, null, null, null, null, null, null, null, null, null), ('4', '2017-05-05 16:49:55', 'USER_PASS_CHANGED', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Подтверждение смены пароля', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n#NAME# #LAST_NAME#,\n\n#MESSAGE#\n\nВаша регистрационная информация:\n\nID пользователя: #USER_ID#\nСтатус профиля: #STATUS#\nLogin: #LOGIN#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n<?=$arParams[\"NAME\"];?> <?=$arParams[\"LAST_NAME\"];?>,\n\n<?=$arParams[\"MESSAGE\"];?>\n\n\nВаша регистрационная информация:\n\nID пользователя: <?=$arParams[\"USER_ID\"];?>\n\nСтатус профиля: <?=$arParams[\"STATUS\"];?>\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', null, null, null, null, null, null, null, null, null, null, null), ('5', '2017-05-05 16:49:55', 'NEW_USER_CONFIRM', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Подтверждение регистрации нового пользователя', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nЗдравствуйте,\n\nВы получили это сообщение, так как ваш адрес был использован при регистрации нового пользователя на сервере #SERVER_NAME#.\n\nВаш код для подтверждения регистрации: #CONFIRM_CODE#\n\nДля подтверждения регистрации перейдите по следующей ссылке:\nhttp://#SERVER_NAME#/auth/index.php?confirm_registration=yes&confirm_user_id=#USER_ID#&confirm_code=#CONFIRM_CODE#\n\nВы также можете ввести код для подтверждения регистрации на странице:\nhttp://#SERVER_NAME#/auth/index.php?confirm_registration=yes&confirm_user_id=#USER_ID#\n\nВнимание! Ваш профиль не будет активным, пока вы не подтвердите свою регистрацию.\n\n---------------------------------------------------------------------\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nЗдравствуйте,\n\nВы получили это сообщение, так как ваш адрес был использован при регистрации нового пользователя на сервере <?=$arParams[\"SERVER_NAME\"];?>.\n\nВаш код для подтверждения регистрации: <?=$arParams[\"CONFIRM_CODE\"];?>\n\n\nДля подтверждения регистрации перейдите по следующей ссылке:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/auth/index.php?confirm_registration=yes&confirm_user_id=<?=$arParams[\"USER_ID\"];?>&confirm_code=<?=$arParams[\"CONFIRM_CODE\"];?>\n\n\nВы также можете ввести код для подтверждения регистрации на странице:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/auth/index.php?confirm_registration=yes&confirm_user_id=<?=$arParams[\"USER_ID\"];?>\n\n\nВнимание! Ваш профиль не будет активным, пока вы не подтвердите свою регистрацию.\n\n---------------------------------------------------------------------\n\nСообщение сгенерировано автоматически.', 'text', null, null, null, null, null, null, null, null, null, null, null), ('6', '2017-05-05 16:49:55', 'USER_INVITE', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Приглашение на сайт', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\nЗдравствуйте, #NAME# #LAST_NAME#!\n\nАдминистратором сайта вы добавлены в число зарегистрированных пользователей.\n\nПриглашаем Вас на наш сайт.\n\nВаша регистрационная информация:\n\nID пользователя: #ID#\nLogin: #LOGIN#\n\nРекомендуем вам сменить установленный автоматически пароль.\n\nДля смены пароля перейдите по следующей ссылке:\nhttp://#SERVER_NAME#/auth.php?change_password=yes&USER_LOGIN=#URL_LOGIN#&USER_CHECKWORD=#CHECKWORD#\n', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\nЗдравствуйте, <?=$arParams[\"NAME\"];?> <?=$arParams[\"LAST_NAME\"];?>!\n\nАдминистратором сайта вы добавлены в число зарегистрированных пользователей.\n\nПриглашаем Вас на наш сайт.\n\nВаша регистрационная информация:\n\nID пользователя: <?=$arParams[\"ID\"];?>\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nРекомендуем вам сменить установленный автоматически пароль.\n\nДля смены пароля перейдите по следующей ссылке:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/auth.php?change_password=yes&USER_LOGIN=<?=$arParams[\"URL_LOGIN\"];?>&USER_CHECKWORD=<?=$arParams[\"CHECKWORD\"];?>\n\n', 'text', null, null, null, null, null, null, null, null, null, null, null), ('7', '2017-05-05 16:49:55', 'FEEDBACK_FORM', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: Сообщение из формы обратной связи', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nВам было отправлено сообщение через форму обратной связи\n\nАвтор: #AUTHOR#\nE-mail автора: #AUTHOR_EMAIL#\n\nТекст сообщения:\n#TEXT#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nВам было отправлено сообщение через форму обратной связи\n\nАвтор: <?=$arParams[\"AUTHOR\"];?>\n\nE-mail автора: <?=$arParams[\"AUTHOR_EMAIL\"];?>\n\n\nТекст сообщения:\n<?=$arParams[\"TEXT\"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', null, null, null, null, null, null, null, null, null, null, null), ('8', '2017-05-05 16:50:06', 'NEW_BLOG_MESSAGE', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [B] #BLOG_NAME# : #MESSAGE_TITLE#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНовое сообщение в блоге \"#BLOG_NAME#\"\n\nТема:\n#MESSAGE_TITLE#\n\nАвтор: #AUTHOR#\nДата: #MESSAGE_DATE#\n\nТекст сообщения:\n#MESSAGE_TEXT#\n\nАдрес сообщения:\n#MESSAGE_PATH#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nНовое сообщение в блоге \"<?=$arParams[\"BLOG_NAME\"];?>\"\n\nТема:\n<?=$arParams[\"MESSAGE_TITLE\"];?>\n\n\nАвтор: <?=$arParams[\"AUTHOR\"];?>\n\nДата: <?=$arParams[\"MESSAGE_DATE\"];?>\n\n\nТекст сообщения:\n<?=$arParams[\"MESSAGE_TEXT\"];?>\n\n\nАдрес сообщения:\n<?=$arParams[\"MESSAGE_PATH\"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', null, null, null, null, null, null, null, null, null, null, null), ('9', '2017-05-05 16:50:06', 'NEW_BLOG_COMMENT', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [B] #MESSAGE_TITLE# : #COMMENT_TITLE#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНовый комментарий в блоге \"#BLOG_NAME#\" на сообщение \"#MESSAGE_TITLE#\"\n\nТема:\n#COMMENT_TITLE#\nАвтор: #AUTHOR#\nДата: #COMMENT_DATE#\n\nТекст сообщения:\n#COMMENT_TEXT#\n\nАдрес сообщения:\n#COMMENT_PATH#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nНовый комментарий в блоге \"<?=$arParams[\"BLOG_NAME\"];?>\" на сообщение \"<?=$arParams[\"MESSAGE_TITLE\"];?>\"\n\nТема:\n<?=$arParams[\"COMMENT_TITLE\"];?>\n\nАвтор: <?=$arParams[\"AUTHOR\"];?>\n\nДата: <?=$arParams[\"COMMENT_DATE\"];?>\n\n\nТекст сообщения:\n<?=$arParams[\"COMMENT_TEXT\"];?>\n\n\nАдрес сообщения:\n<?=$arParams[\"COMMENT_PATH\"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', null, null, null, null, null, null, null, null, null, null, null), ('10', '2017-05-05 16:50:06', 'NEW_BLOG_COMMENT2COMMENT', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [B] #MESSAGE_TITLE# : #COMMENT_TITLE#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНовый комментарий на ваш комментарий в блоге \"#BLOG_NAME#\" на сообщение \"#MESSAGE_TITLE#\".\n\nТема:\n#COMMENT_TITLE#\nАвтор: #AUTHOR#\nДата: #COMMENT_DATE#\n\nТекст сообщения:\n#COMMENT_TEXT#\n\nАдрес сообщения:\n#COMMENT_PATH#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nНовый комментарий на ваш комментарий в блоге \"<?=$arParams[\"BLOG_NAME\"];?>\" на сообщение \"<?=$arParams[\"MESSAGE_TITLE\"];?>\".\n\nТема:\n<?=$arParams[\"COMMENT_TITLE\"];?>\n\nАвтор: <?=$arParams[\"AUTHOR\"];?>\n\nДата: <?=$arParams[\"COMMENT_DATE\"];?>\n\n\nТекст сообщения:\n<?=$arParams[\"COMMENT_TEXT\"];?>\n\n\nАдрес сообщения:\n<?=$arParams[\"COMMENT_PATH\"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', null, null, null, null, null, null, null, null, null, null, null), ('11', '2017-05-05 16:50:06', 'NEW_BLOG_COMMENT_WITHOUT_TITLE', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [B] #MESSAGE_TITLE#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНовый комментарий в блоге \"#BLOG_NAME#\" на сообщение \"#MESSAGE_TITLE#\"\n\nАвтор: #AUTHOR#\nДата: #COMMENT_DATE#\n\nТекст сообщения:\n#COMMENT_TEXT#\n\nАдрес сообщения:\n#COMMENT_PATH#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nНовый комментарий в блоге \"<?=$arParams[\"BLOG_NAME\"];?>\" на сообщение \"<?=$arParams[\"MESSAGE_TITLE\"];?>\"\n\nАвтор: <?=$arParams[\"AUTHOR\"];?>\n\nДата: <?=$arParams[\"COMMENT_DATE\"];?>\n\n\nТекст сообщения:\n<?=$arParams[\"COMMENT_TEXT\"];?>\n\n\nАдрес сообщения:\n<?=$arParams[\"COMMENT_PATH\"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', null, null, null, null, null, null, null, null, null, null, null), ('12', '2017-05-05 16:50:06', 'NEW_BLOG_COMMENT2COMMENT_WITHOUT_TITLE', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [B] #MESSAGE_TITLE#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНовый комментарий на ваш комментарий в блоге \"#BLOG_NAME#\" на сообщение \"#MESSAGE_TITLE#\".\n\nАвтор: #AUTHOR#\nДата: #COMMENT_DATE#\n\nТекст сообщения:\n#COMMENT_TEXT#\n\nАдрес сообщения:\n#COMMENT_PATH#\n\nСообщение сгенерировано автоматически.\n', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nНовый комментарий на ваш комментарий в блоге \"<?=$arParams[\"BLOG_NAME\"];?>\" на сообщение \"<?=$arParams[\"MESSAGE_TITLE\"];?>\".\n\nАвтор: <?=$arParams[\"AUTHOR\"];?>\n\nДата: <?=$arParams[\"COMMENT_DATE\"];?>\n\n\nТекст сообщения:\n<?=$arParams[\"COMMENT_TEXT\"];?>\n\n\nАдрес сообщения:\n<?=$arParams[\"COMMENT_PATH\"];?>\n\n\nСообщение сгенерировано автоматически.\n', 'text', null, null, null, null, null, null, null, null, null, null, null), ('13', '2017-05-05 16:50:06', 'BLOG_YOUR_BLOG_TO_USER', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [B] Ваш блог \"#BLOG_NAME#\" был добавлен в друзья к #USER#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nВаш блог \"#BLOG_NAME#\" был добавлен в друзья к #USER#.\n\nПрофиль пользователя: #USER_URL#\n\nАдрес вашего блога: #BLOG_ADR#\n\nСообщение сгенерировано автоматически.\n', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nВаш блог \"<?=$arParams[\"BLOG_NAME\"];?>\" был добавлен в друзья к <?=$arParams[\"USER\"];?>.\n\nПрофиль пользователя: <?=$arParams[\"USER_URL\"];?>\n\n\nАдрес вашего блога: <?=$arParams[\"BLOG_ADR\"];?>\n\n\nСообщение сгенерировано автоматически.\n', 'text', null, null, null, null, null, null, null, null, null, null, null), ('14', '2017-05-05 16:50:06', 'BLOG_YOU_TO_BLOG', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [B] Вы были добавлены в друзья блога \"#BLOG_NAME#\"', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nВы были добавлены в друзья блога \"#BLOG_NAME#\".\n\nАдрес блога: #BLOG_ADR#\n\nВаш профиль: #USER_URL#\n\nСообщение сгенерировано автоматически.\n', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nВы были добавлены в друзья блога \"<?=$arParams[\"BLOG_NAME\"];?>\".\n\nАдрес блога: <?=$arParams[\"BLOG_ADR\"];?>\n\n\nВаш профиль: <?=$arParams[\"USER_URL\"];?>\n\n\nСообщение сгенерировано автоматически.\n', 'text', null, null, null, null, null, null, null, null, null, null, null), ('15', '2017-05-05 16:50:06', 'BLOG_BLOG_TO_YOU', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [B] К вам в друзья был добавлен блог \"#BLOG_NAME#\"', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nК вам в друзья был добавлен блог \"#BLOG_NAME#\".\n\nАдрес блога: #BLOG_ADR#\n\nВаш профиль: #USER_URL#\n\nСообщение сгенерировано автоматически.\n', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nК вам в друзья был добавлен блог \"<?=$arParams[\"BLOG_NAME\"];?>\".\n\nАдрес блога: <?=$arParams[\"BLOG_ADR\"];?>\n\n\nВаш профиль: <?=$arParams[\"USER_URL\"];?>\n\n\nСообщение сгенерировано автоматически.\n', 'text', null, null, null, null, null, null, null, null, null, null, null), ('16', '2017-05-05 16:50:06', 'BLOG_USER_TO_YOUR_BLOG', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [B] В ваш блог \"#BLOG_NAME#\" был добавлен друг #USER#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nВ ваш блог \"#BLOG_NAME#\" был добавлен друг #USER#.\n\nПрофиль пользователя: #USER_URL#\n\nАдрес вашего блога: #BLOG_ADR#\n\nСообщение сгенерировано автоматически.\n', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nВ ваш блог \"<?=$arParams[\"BLOG_NAME\"];?>\" был добавлен друг <?=$arParams[\"USER\"];?>.\n\nПрофиль пользователя: <?=$arParams[\"USER_URL\"];?>\n\n\nАдрес вашего блога: <?=$arParams[\"BLOG_ADR\"];?>\n\n\nСообщение сгенерировано автоматически.\n', 'text', null, null, null, null, null, null, null, null, null, null, null), ('17', '2017-05-05 16:50:06', 'BLOG_SONET_NEW_POST', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#POST_TITLE#', '<?EventMessageThemeCompiler::includeComponent(\"bitrix:socialnetwork.blog.post.mail\",\"\",Array(\"EMAIL_TO\" => \"{#EMAIL_TO#}\",\"RECIPIENT_ID\" => \"{#RECIPIENT_ID#}\",\"POST_ID\" => \"{#POST_ID#}\",\"URL\" => \"{#URL#}\"));?>', '<?EventMessageThemeCompiler::includeComponent(\"bitrix:socialnetwork.blog.post.mail\",\"\",Array(\"EMAIL_TO\" => \"{$arParams[\'EMAIL_TO\']}\",\"RECIPIENT_ID\" => \"{$arParams[\'RECIPIENT_ID\']}\",\"POST_ID\" => \"{$arParams[\'POST_ID\']}\",\"URL\" => \"{$arParams[\'URL\']}\"));?>', 'html', null, null, null, null, null, null, null, null, null, 'mail_user', null), ('18', '2017-05-05 16:50:06', 'BLOG_SONET_NEW_COMMENT', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', 'Re: #POST_TITLE#', '<?EventMessageThemeCompiler::includeComponent(\"bitrix:socialnetwork.blog.post.comment.mail\",\"\",Array(\"COMMENT_ID\" => \"{#COMMENT_ID#}\",\"RECIPIENT_ID\" => \"{#RECIPIENT_ID#}\",\"EMAIL_TO\" => \"{#EMAIL_TO#}\",\"POST_ID\" => \"{#POST_ID#}\",\"URL\" => \"{#URL#}\"));?>', '<?EventMessageThemeCompiler::includeComponent(\"bitrix:socialnetwork.blog.post.comment.mail\",\"\",Array(\"COMMENT_ID\" => \"{$arParams[\'COMMENT_ID\']}\",\"RECIPIENT_ID\" => \"{$arParams[\'RECIPIENT_ID\']}\",\"EMAIL_TO\" => \"{$arParams[\'EMAIL_TO\']}\",\"POST_ID\" => \"{$arParams[\'POST_ID\']}\",\"URL\" => \"{$arParams[\'URL\']}\"));?>', 'html', null, null, null, null, null, null, null, null, null, 'mail_user', null), ('19', '2017-05-05 16:50:06', 'BLOG_SONET_POST_SHARE', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#POST_TITLE#', '<?EventMessageThemeCompiler::includeComponent(\"bitrix:socialnetwork.blog.post_share.mail\",\"\",Array(\"EMAIL_TO\" => \"{#EMAIL_TO#}\",\"RECIPIENT_ID\" => \"{#RECIPIENT_ID#}\",\"POST_ID\" => \"{#POST_ID#}\",\"URL\" => \"{#URL#}\"));?>', '<?EventMessageThemeCompiler::includeComponent(\"bitrix:socialnetwork.blog.post_share.mail\",\"\",Array(\"EMAIL_TO\" => \"{$arParams[\'EMAIL_TO\']}\",\"RECIPIENT_ID\" => \"{$arParams[\'RECIPIENT_ID\']}\",\"POST_ID\" => \"{$arParams[\'POST_ID\']}\",\"URL\" => \"{$arParams[\'URL\']}\"));?>', 'html', null, null, null, null, null, null, null, null, null, 'mail_user', null), ('20', '2017-05-05 16:50:06', 'BLOG_POST_BROADCAST', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: #MESSAGE_TITLE#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНа сайте добавлено новое сообщение.\n\nТема:\n#MESSAGE_TITLE#\n\nАвтор: #AUTHOR#\n\nТекст сообщения:\n#MESSAGE_TEXT#\n\nАдрес сообщения:\n#MESSAGE_PATH#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nНа сайте добавлено новое сообщение.\n\nТема:\n<?=$arParams[\"MESSAGE_TITLE\"];?>\n\n\nАвтор: <?=$arParams[\"AUTHOR\"];?>\n\n\nТекст сообщения:\n<?=$arParams[\"MESSAGE_TEXT\"];?>\n\n\nАдрес сообщения:\n<?=$arParams[\"MESSAGE_PATH\"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', null, null, null, null, null, null, null, null, null, null, null), ('21', '2017-05-05 16:50:20', 'NEW_FORUM_MESSAGE', 's1', 'Y', '#FROM_EMAIL#', '#RECIPIENT#', '#SITE_NAME#: [F] #TOPIC_TITLE# : #FORUM_NAME#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНовое сообщение на форуме #SERVER_NAME#.\n\nТема:\n#TOPIC_TITLE#\n\nАвтор: #AUTHOR#\nДата : #MESSAGE_DATE#\nТекст сообщения:\n\n#MESSAGE_TEXT#\n\nАдрес сообщения:\nhttp://#SERVER_NAME##PATH2FORUM#\n\nСообщение сгенерировано автоматически.\n', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nНовое сообщение на форуме <?=$arParams[\"SERVER_NAME\"];?>.\n\nТема:\n<?=$arParams[\"TOPIC_TITLE\"];?>\n\n\nАвтор: <?=$arParams[\"AUTHOR\"];?>\n\nДата : <?=$arParams[\"MESSAGE_DATE\"];?>\n\nТекст сообщения:\n\n<?=$arParams[\"MESSAGE_TEXT\"];?>\n\n\nАдрес сообщения:\nhttp://<?=$arParams[\"SERVER_NAME\"];?><?=$arParams[\"PATH2FORUM\"];?>\n\n\nСообщение сгенерировано автоматически.\n', 'text', null, null, null, null, null, null, null, null, null, null, null), ('22', '2017-05-05 16:50:20', 'NEW_FORUM_PRIV', 's1', 'Y', '#FROM_EMAIL#', '#TO_EMAIL#', '#SITE_NAME#: [private] #SUBJECT#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nВы получили персональное сообщение с форума на сайте #SERVER_NAME#.\n\nТема: #SUBJECT#\n\nАвтор: #FROM_NAME# #FROM_EMAIL#\nДата : #MESSAGE_DATE#\nСообщение:\n\n#MESSAGE#\n\nСообщение сгенерировано автоматически.\n', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nВы получили персональное сообщение с форума на сайте <?=$arParams[\"SERVER_NAME\"];?>.\n\nТема: <?=$arParams[\"SUBJECT\"];?>\n\n\nАвтор: <?=$arParams[\"FROM_NAME\"];?> <?=$arParams[\"FROM_EMAIL\"];?>\n\nДата : <?=$arParams[\"MESSAGE_DATE\"];?>\n\nСообщение:\n\n<?=$arParams[\"MESSAGE\"];?>\n\n\nСообщение сгенерировано автоматически.\n', 'text', null, null, null, null, null, null, null, null, null, null, null), ('23', '2017-05-05 16:50:20', 'NEW_FORUM_PRIVATE_MESSAGE', 's1', 'Y', '#FROM_EMAIL#', '#TO_EMAIL#', '#SITE_NAME#: [private] #SUBJECT#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nВы получили персональное сообщение с форума на сайте #SERVER_NAME#.\n\nТема: #SUBJECT#\n\nАвтор: #FROM_NAME#\nДата: #MESSAGE_DATE#\nСообщение:\n\n#MESSAGE#\n\nСсылка на сообщение: #MESSAGE_LINK#Сообщение сгенерировано автоматически.\n', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nВы получили персональное сообщение с форума на сайте <?=$arParams[\"SERVER_NAME\"];?>.\n\nТема: <?=$arParams[\"SUBJECT\"];?>\n\n\nАвтор: <?=$arParams[\"FROM_NAME\"];?>\n\nДата: <?=$arParams[\"MESSAGE_DATE\"];?>\n\nСообщение:\n\n<?=$arParams[\"MESSAGE\"];?>\n\n\nСсылка на сообщение: <?=$arParams[\"MESSAGE_LINK\"];?>Сообщение сгенерировано автоматически.\n', 'text', null, null, null, null, null, null, null, null, null, null, null), ('24', '2017-05-05 16:50:20', 'EDIT_FORUM_MESSAGE', 's1', 'Y', '#FROM_EMAIL#', '#RECIPIENT#', '#SITE_NAME#: [F] #TOPIC_TITLE# : #FORUM_NAME#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nИзменение сообщения на форуме #SERVER_NAME#.\n\nТема:\n#TOPIC_TITLE#\n\nАвтор: #AUTHOR#\nДата : #MESSAGE_DATE#\nТекст сообщения:\n\n#MESSAGE_TEXT#\n\nАдрес сообщения:\nhttp://#SERVER_NAME##PATH2FORUM#\n\nСообщение сгенерировано автоматически.\n', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nИзменение сообщения на форуме <?=$arParams[\"SERVER_NAME\"];?>.\n\nТема:\n<?=$arParams[\"TOPIC_TITLE\"];?>\n\n\nАвтор: <?=$arParams[\"AUTHOR\"];?>\n\nДата : <?=$arParams[\"MESSAGE_DATE\"];?>\n\nТекст сообщения:\n\n<?=$arParams[\"MESSAGE_TEXT\"];?>\n\n\nАдрес сообщения:\nhttp://<?=$arParams[\"SERVER_NAME\"];?><?=$arParams[\"PATH2FORUM\"];?>\n\n\nСообщение сгенерировано автоматически.\n', 'text', null, null, null, null, null, null, null, null, null, null, null), ('25', '2017-05-05 16:50:20', 'FORUM_NEW_MESSAGE_MAIL', 's1', 'Y', '#FROM_EMAIL#', '#RECIPIENT#', '#TOPIC_TITLE#', '#MESSAGE_TEXT#\n\n------------------------------------------  \nВы получили это сообщение, так как выподписаны на форум #FORUM_NAME#.\n\nОтветить на сообщение можно по электронной почте или через форму на сайте:\nhttp://#SERVER_NAME##PATH2FORUM#\n\nНаписать новое сообщение: #FORUM_EMAIL#\n\nАвтор сообщения: #AUTHOR#\n\nСообщение сгенерировано автоматически на сайте #SITE_NAME#.\n', '<?=$arParams[\"MESSAGE_TEXT\"];?>\n\n\n------------------------------------------  \nВы получили это сообщение, так как выподписаны на форум <?=$arParams[\"FORUM_NAME\"];?>.\n\nОтветить на сообщение можно по электронной почте или через форму на сайте:\nhttp://<?=$arParams[\"SERVER_NAME\"];?><?=$arParams[\"PATH2FORUM\"];?>\n\n\nНаписать новое сообщение: <?=$arParams[\"FORUM_EMAIL\"];?>\n\n\nАвтор сообщения: <?=$arParams[\"AUTHOR\"];?>\n\n\nСообщение сгенерировано автоматически на сайте <?=$arParams[\"SITE_NAME\"];?>.\n', 'text', null, null, null, null, null, null, null, null, null, null, null), ('26', '2017-05-05 16:50:40', 'VIRUS_DETECTED', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Обнаружен вирус', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nЗдравствуйте!\n\nВы получили это сообщение, так как модуль проактивной защиты сервера #SERVER_NAME# обнаружил код, похожий на вирус.\n\n1. Подозрительный код был вырезан из html.\n2. Проверьте журнал вторжений и убедитесь, что код действительно вредоносный, а не является кодом какого-либо счетчика или фреймворка.\n (ссылка: http://#SERVER_NAME#/bitrix/admin/event_log.php?lang=ru&set_filter=Y&find_type=audit_type_id&find_audit_type[]=SECURITY_VIRUS )\n3. В случае, если код не является опасным, добавьте его в исключения на странице настройки антивируса.\n (ссылка: http://#SERVER_NAME#/bitrix/admin/security_antivirus.php?lang=ru&tabControl_active_tab=exceptions )\n4. Если код является вирусным, то необходимо выполнить следующие действия:\n\n а) Смените пароли доступа к сайту у администраторов и ответственных сотрудников.\n б) Смените пароли доступа по ssh и ftp.\n в) Проверьте и вылечите компьютеры администраторов, имевших доступ к сайту по ssh или ftp.\n г) В программах доступа к сайту по ssh и ftp отключите сохранение паролей.\n д) Удалите вредоносный код из зараженных файлов. Например, восстановите поврежденные файлы из самой свежей резервной копии.\n\n---------------------------------------------------------------------\nСообщение сгенерировано автоматически.\n', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nЗдравствуйте!\n\nВы получили это сообщение, так как модуль проактивной защиты сервера <?=$arParams[\"SERVER_NAME\"];?> обнаружил код, похожий на вирус.\n\n1. Подозрительный код был вырезан из html.\n2. Проверьте журнал вторжений и убедитесь, что код действительно вредоносный, а не является кодом какого-либо счетчика или фреймворка.\n (ссылка: http://<?=$arParams[\"SERVER_NAME\"];?>/bitrix/admin/event_log.php?lang=ru&set_filter=Y&find_type=audit_type_id&find_audit_type[]=SECURITY_VIRUS )\n3. В случае, если код не является опасным, добавьте его в исключения на странице настройки антивируса.\n (ссылка: http://<?=$arParams[\"SERVER_NAME\"];?>/bitrix/admin/security_antivirus.php?lang=ru&tabControl_active_tab=exceptions )\n4. Если код является вирусным, то необходимо выполнить следующие действия:\n\n а) Смените пароли доступа к сайту у администраторов и ответственных сотрудников.\n б) Смените пароли доступа по ssh и ftp.\n в) Проверьте и вылечите компьютеры администраторов, имевших доступ к сайту по ssh или ftp.\n г) В программах доступа к сайту по ssh и ftp отключите сохранение паролей.\n д) Удалите вредоносный код из зараженных файлов. Например, восстановите поврежденные файлы из самой свежей резервной копии.\n\n---------------------------------------------------------------------\nСообщение сгенерировано автоматически.\n', 'text', '', null, null, null, null, null, null, null, null, null, null), ('27', '2017-05-05 16:50:47', 'SUBSCRIBE_CONFIRM', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Подтверждение подписки', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nЗдравствуйте,\n\nВы получили это сообщение, так как ваш адрес был подписан\nна список рассылки сервера #SERVER_NAME#.\n\nДополнительная информация о подписке:\n\nАдрес подписки (email) ............ #EMAIL#\nДата добавления/редактирования .... #DATE_SUBSCR#\n\nВаш код для подтверждения подписки: #CONFIRM_CODE#\n\nДля подтверждения подписки перейдите по следующей ссылке:\nhttp://#SERVER_NAME##SUBSCR_SECTION#subscr_edit.php?ID=#ID#&CONFIRM_CODE=#CONFIRM_CODE#\n\nВы также можете ввести код для подтверждения подписки на странице:\nhttp://#SERVER_NAME##SUBSCR_SECTION#subscr_edit.php?ID=#ID#\n\nВнимание! Вы не будете получать сообщения рассылки, пока не подтвердите\nсвою подписку.\n\n---------------------------------------------------------------------\nСохраните это письмо, так как оно содержит информацию для авторизации.\nИспользуя код подтверждения подписки, вы cможете изменить параметры\nподписки или отписаться от рассылки.\n\nИзменить параметры:\nhttp://#SERVER_NAME##SUBSCR_SECTION#subscr_edit.php?ID=#ID#&CONFIRM_CODE=#CONFIRM_CODE#\n\nОтписаться:\nhttp://#SERVER_NAME##SUBSCR_SECTION#subscr_edit.php?ID=#ID#&CONFIRM_CODE=#CONFIRM_CODE#&action=unsubscribe\n---------------------------------------------------------------------\n\nСообщение сгенерировано автоматически.\n', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nЗдравствуйте,\n\nВы получили это сообщение, так как ваш адрес был подписан\nна список рассылки сервера <?=$arParams[\"SERVER_NAME\"];?>.\n\nДополнительная информация о подписке:\n\nАдрес подписки (email) ............ <?=$arParams[\"EMAIL\"];?>\n\nДата добавления/редактирования .... <?=$arParams[\"DATE_SUBSCR\"];?>\n\n\nВаш код для подтверждения подписки: <?=$arParams[\"CONFIRM_CODE\"];?>\n\n\nДля подтверждения подписки перейдите по следующей ссылке:\nhttp://<?=$arParams[\"SERVER_NAME\"];?><?=$arParams[\"SUBSCR_SECTION\"];?>subscr_edit.php?ID=<?=$arParams[\"ID\"];?>&CONFIRM_CODE=<?=$arParams[\"CONFIRM_CODE\"];?>\n\n\nВы также можете ввести код для подтверждения подписки на странице:\nhttp://<?=$arParams[\"SERVER_NAME\"];?><?=$arParams[\"SUBSCR_SECTION\"];?>subscr_edit.php?ID=<?=$arParams[\"ID\"];?>\n\n\nВнимание! Вы не будете получать сообщения рассылки, пока не подтвердите\nсвою подписку.\n\n---------------------------------------------------------------------\nСохраните это письмо, так как оно содержит информацию для авторизации.\nИспользуя код подтверждения подписки, вы cможете изменить параметры\nподписки или отписаться от рассылки.\n\nИзменить параметры:\nhttp://<?=$arParams[\"SERVER_NAME\"];?><?=$arParams[\"SUBSCR_SECTION\"];?>subscr_edit.php?ID=<?=$arParams[\"ID\"];?>&CONFIRM_CODE=<?=$arParams[\"CONFIRM_CODE\"];?>\n\n\nОтписаться:\nhttp://<?=$arParams[\"SERVER_NAME\"];?><?=$arParams[\"SUBSCR_SECTION\"];?>subscr_edit.php?ID=<?=$arParams[\"ID\"];?>&CONFIRM_CODE=<?=$arParams[\"CONFIRM_CODE\"];?>&action=unsubscribe\n---------------------------------------------------------------------\n\nСообщение сгенерировано автоматически.\n', 'text', '', null, null, null, null, null, null, null, null, null, null), ('28', '2017-05-05 16:50:50', 'VOTE_FOR', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [V] #VOTE_TITLE#', '#USER_NAME# принял участие в опросе \"#VOTE_TITLE#\":\n#VOTE_STATISTIC#\n\nhttp://#SERVER_NAME##URL#\nСообщение сгенерировано автоматически.', '<?=$arParams[\"USER_NAME\"];?> принял участие в опросе \"<?=$arParams[\"VOTE_TITLE\"];?>\":\n<?=$arParams[\"VOTE_STATISTIC\"];?>\n\n\nhttp://<?=$arParams[\"SERVER_NAME\"];?><?=$arParams[\"URL\"];?>\n\nСообщение сгенерировано автоматически.', 'text', null, null, null, null, null, null, null, null, null, null, null);
COMMIT;

-- ----------------------------
--  Table structure for `b_event_message_attachment`
-- ----------------------------
DROP TABLE IF EXISTS `b_event_message_attachment`;
CREATE TABLE `b_event_message_attachment` (
  `EVENT_MESSAGE_ID` int(18) NOT NULL,
  `FILE_ID` int(18) NOT NULL,
  PRIMARY KEY (`EVENT_MESSAGE_ID`,`FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_event_message_site`
-- ----------------------------
DROP TABLE IF EXISTS `b_event_message_site`;
CREATE TABLE `b_event_message_site` (
  `EVENT_MESSAGE_ID` int(11) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`EVENT_MESSAGE_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `b_event_message_site`
-- ----------------------------
BEGIN;
INSERT INTO `b_event_message_site` VALUES ('1', 's1'), ('2', 's1'), ('3', 's1'), ('4', 's1'), ('5', 's1'), ('6', 's1'), ('7', 's1'), ('8', 's1'), ('9', 's1'), ('10', 's1'), ('11', 's1'), ('12', 's1'), ('13', 's1'), ('14', 's1'), ('15', 's1'), ('16', 's1'), ('17', 's1'), ('18', 's1'), ('19', 's1'), ('20', 's1'), ('21', 's1'), ('22', 's1'), ('23', 's1'), ('24', 's1'), ('25', 's1'), ('26', 's1'), ('27', 's1'), ('28', 's1');
COMMIT;

-- ----------------------------
--  Table structure for `b_event_type`
-- ----------------------------
DROP TABLE IF EXISTS `b_event_type`;
CREATE TABLE `b_event_type` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `EVENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `SORT` int(18) NOT NULL DEFAULT '150',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_1` (`EVENT_NAME`,`LID`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `b_event_type`
-- ----------------------------
BEGIN;
INSERT INTO `b_event_type` VALUES ('1', 'ru', 'NEW_USER', 'Зарегистрировался новый пользователь', '\n\n#USER_ID# - ID пользователя\n#LOGIN# - Логин\n#EMAIL# - EMail\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#USER_IP# - IP пользователя\n#USER_HOST# - Хост пользователя\n', '1'), ('2', 'ru', 'USER_INFO', 'Информация о пользователе', '\n\n#USER_ID# - ID пользователя\n#STATUS# - Статус логина\n#MESSAGE# - Сообщение пользователю\n#LOGIN# - Логин\n#URL_LOGIN# - Логин, закодированный для использования в URL\n#CHECKWORD# - Контрольная строка для смены пароля\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#EMAIL# - E-Mail пользователя\n', '2'), ('3', 'ru', 'NEW_USER_CONFIRM', 'Подтверждение регистрации нового пользователя', '\n\n\n#USER_ID# - ID пользователя\n#LOGIN# - Логин\n#EMAIL# - EMail\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#USER_IP# - IP пользователя\n#USER_HOST# - Хост пользователя\n#CONFIRM_CODE# - Код подтверждения\n', '3'), ('4', 'ru', 'USER_PASS_REQUEST', 'Запрос на смену пароля', '\n\n#USER_ID# - ID пользователя\n#STATUS# - Статус логина\n#MESSAGE# - Сообщение пользователю\n#LOGIN# - Логин\n#URL_LOGIN# - Логин, закодированный для использования в URL\n#CHECKWORD# - Контрольная строка для смены пароля\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#EMAIL# - E-Mail пользователя\n', '4'), ('5', 'ru', 'USER_PASS_CHANGED', 'Подтверждение смены пароля', '\n\n#USER_ID# - ID пользователя\n#STATUS# - Статус логина\n#MESSAGE# - Сообщение пользователю\n#LOGIN# - Логин\n#URL_LOGIN# - Логин, закодированный для использования в URL\n#CHECKWORD# - Контрольная строка для смены пароля\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#EMAIL# - E-Mail пользователя\n', '5'), ('6', 'ru', 'USER_INVITE', 'Приглашение на сайт нового пользователя', '#ID# - ID пользователя\n#LOGIN# - Логин\n#URL_LOGIN# - Логин, закодированный для использования в URL\n#EMAIL# - EMail\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#PASSWORD# - пароль пользователя \n#CHECKWORD# - Контрольная строка для смены пароля\n#XML_ID# - ID пользователя для связи с внешними источниками\n', '6'), ('7', 'ru', 'FEEDBACK_FORM', 'Отправка сообщения через форму обратной связи', '#AUTHOR# - Автор сообщения\n#AUTHOR_EMAIL# - Email автора сообщения\n#TEXT# - Текст сообщения\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма', '7'), ('8', 'en', 'NEW_USER', 'New user was registered', '\n\n#USER_ID# - User ID\n#LOGIN# - Login\n#EMAIL# - EMail\n#NAME# - Name\n#LAST_NAME# - Last Name\n#USER_IP# - User IP\n#USER_HOST# - User Host\n', '1'), ('9', 'en', 'USER_INFO', 'Account Information', '\n\n#USER_ID# - User ID\n#STATUS# - Account status\n#MESSAGE# - Message for user\n#LOGIN# - Login\n#URL_LOGIN# - Encoded login for use in URL\n#CHECKWORD# - Check string for password change\n#NAME# - Name\n#LAST_NAME# - Last Name\n#EMAIL# - User E-Mail\n', '2'), ('10', 'en', 'NEW_USER_CONFIRM', 'New user registration confirmation', '\n\n#USER_ID# - User ID\n#LOGIN# - Login\n#EMAIL# - E-mail\n#NAME# - First name\n#LAST_NAME# - Last name\n#USER_IP# - User IP\n#USER_HOST# - User host\n#CONFIRM_CODE# - Confirmation code\n', '3'), ('11', 'en', 'USER_PASS_REQUEST', 'Password Change Request', '\n\n#USER_ID# - User ID\n#STATUS# - Account status\n#MESSAGE# - Message for user\n#LOGIN# - Login\n#URL_LOGIN# - Encoded login for use in URL\n#CHECKWORD# - Check string for password change\n#NAME# - Name\n#LAST_NAME# - Last Name\n#EMAIL# - User E-Mail\n', '4'), ('12', 'en', 'USER_PASS_CHANGED', 'Password Change Confirmation', '\n\n#USER_ID# - User ID\n#STATUS# - Account status\n#MESSAGE# - Message for user\n#LOGIN# - Login\n#URL_LOGIN# - Encoded login for use in URL\n#CHECKWORD# - Check string for password change\n#NAME# - Name\n#LAST_NAME# - Last Name\n#EMAIL# - User E-Mail\n', '5'), ('13', 'en', 'USER_INVITE', 'Invitation of a new site user', '#ID# - User ID\n#LOGIN# - Login\n#URL_LOGIN# - Encoded login for use in URL\n#EMAIL# - EMail\n#NAME# - Name\n#LAST_NAME# - Last Name\n#PASSWORD# - User password \n#CHECKWORD# - Password check string\n#XML_ID# - User ID to link with external data sources\n\n', '6'), ('14', 'en', 'FEEDBACK_FORM', 'Sending a message using a feedback form', '#AUTHOR# - Message author\n#AUTHOR_EMAIL# - Author\'s e-mail address\n#TEXT# - Message text\n#EMAIL_FROM# - Sender\'s e-mail address\n#EMAIL_TO# - Recipient\'s e-mail address', '7'), ('15', 'ru', 'NEW_BLOG_MESSAGE', 'Новое сообщение в блоге', '#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#MESSAGE_TITLE# - Тема сообщения\n#MESSAGE_TEXT# - Текст сообщения\n#MESSAGE_DATE# - Дата сообщения\n#MESSAGE_PATH# - URL адрес сообщения\n#AUTHOR# - Автор сообщения\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма', '100'), ('16', 'ru', 'NEW_BLOG_COMMENT', 'Новый комментарий в блоге', '#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#MESSAGE_TITLE# - Тема сообщения\n#COMMENT_TITLE# - Заголовок комментария\n#COMMENT_TEXT# - Текст комментария\n#COMMENT_DATE# - Текст комментария\n#COMMENT_PATH# - URL адрес сообщения\n#AUTHOR# - Автор сообщения\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма', '100'), ('17', 'ru', 'NEW_BLOG_COMMENT2COMMENT', 'Новый комментарий на ваш комментарий в блоге', '#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#MESSAGE_TITLE# - Тема сообщения\n#COMMENT_TITLE# - Заголовок комментария\n#COMMENT_TEXT# - Текст комментария\n#COMMENT_DATE# - Текст комментария\n#COMMENT_PATH# - URL адрес сообщения\n#AUTHOR# - Автор сообщения\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма', '100'), ('18', 'ru', 'NEW_BLOG_COMMENT_WITHOUT_TITLE', 'Новый комментарий в блоге (без темы)', '#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#MESSAGE_TITLE# - Тема сообщения\n#COMMENT_TEXT# - Текст комментария\n#COMMENT_DATE# - Текст комментария\n#COMMENT_PATH# - URL адрес сообщения\n#AUTHOR# - Автор сообщения\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма', '100'), ('19', 'ru', 'NEW_BLOG_COMMENT2COMMENT_WITHOUT_TITLE', 'Новый комментарий на ваш комментарий в блоге (без темы)', '#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#COMMENT_TITLE# - Заголовок комментария\n#COMMENT_TEXT# - Текст комментария\n#COMMENT_DATE# - Текст комментария\n#COMMENT_PATH# - URL адрес сообщения\n#AUTHOR# - Автор сообщения\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма', '100'), ('20', 'ru', 'BLOG_YOUR_BLOG_TO_USER', 'Ваш блог был добавлен в друзья', '#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#BLOG_ADR# - Адрес блога\n#USER_ID# - ID пользователя\n#USER# - Пользователь\n#USER_URL# - Адрес пользователя\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма\n', '100'), ('21', 'ru', 'BLOG_YOU_TO_BLOG', 'Вы были добавлены в друзья блога', '#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#BLOG_ADR# - Адрес блога\n#USER_ID# - ID пользователя\n#USER# - Пользователь\n#USER_URL# - Адрес пользователя\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма\n', '100'), ('22', 'ru', 'BLOG_BLOG_TO_YOU', 'К вам в друзья был добавлен блог', '#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#BLOG_ADR# - Адрес блога\n#USER_ID# - ID пользователя\n#USER# - Пользователь\n#USER_URL# - Адрес пользователя\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма\n', '100'), ('23', 'ru', 'BLOG_USER_TO_YOUR_BLOG', 'В ваш блог был добавлен друг', '#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#BLOG_ADR# - Адрес блога\n#USER_ID# - ID пользователя\n#USER# - Пользователь\n#USER_URL# - Адрес пользователя\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма\n', '100'), ('24', 'ru', 'BLOG_SONET_NEW_POST', 'Добавлено новое сообщение', '#EMAIL_TO# - Email получателя письма\n#POST_ID# - ID сообщения\n#RECIPIENT_ID# - ID получателя\n#URL_ID# - URL страницы сообщения\n', '100'), ('25', 'ru', 'BLOG_SONET_NEW_COMMENT', 'Добавлен новый комментарий', '#EMAIL_TO# - Email получателя письма\n#COMMENT_ID# - ID комментария\n#POST_ID# - ID сообщения\n#RECIPIENT_ID# - ID получателя\n#URL_ID# - URL страницы сообщения\n', '100'), ('26', 'ru', 'BLOG_SONET_POST_SHARE', 'Добавлен новый получатель сообщения', '#EMAIL_TO# - Email получателя письма\n#POST_ID# - ID сообщения\n#RECIPIENT_ID# - ID получателя\n#URL_ID# - URL страницы сообщения\n', '100'), ('27', 'ru', 'BLOG_POST_BROADCAST', 'Добавлено новое сообщение', '\n#MESSAGE_TITLE# - Тема сообщения\n#MESSAGE_TEXT# - Текст сообщения\n#MESSAGE_PATH# - URL адрес сообщения\n#AUTHOR# - Автор сообщения\n#EMAIL_TO# - Email получателя письма', '100'), ('28', 'en', 'NEW_BLOG_MESSAGE', 'New blog message', '#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog title\n#BLOG_URL# - Blog url\n#MESSAGE_TITLE# - Message title\n#MESSAGE_TEXT# - Message text\n#MESSAGE_DATE# - Message date\n#MESSAGE_PATH# - URL to message\n#AUTHOR# - Message author\n#EMAIL_FROM# - Sender email\n#EMAIL_TO# - Recipient email', '100'), ('29', 'en', 'NEW_BLOG_COMMENT', 'New comment in blog', '#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog title\n#BLOG_URL# - Blog url\n#MESSAGE_TITLE# - Message title\n#COMMENT_TITLE# - Comment title\n#COMMENT_TEXT# - Comment text\n#COMMENT_DATE# - Comment date\n#COMMENT_PATH# - Comment URL\n#AUTHOR# - Comment author\n#EMAIL_FROM# - Sender email\n#EMAIL_TO# - Recipient email', '100'), ('30', 'en', 'NEW_BLOG_COMMENT2COMMENT', 'New comment for your in blog', '#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog title\n#BLOG_URL# - Blog url\n#MESSAGE_TITLE# - Message title\n#COMMENT_TITLE# - Comment title\n#COMMENT_TEXT# - Comment text\n#COMMENT_DATE# - Comment date\n#COMMENT_PATH# - Comment URL\n#AUTHOR# - Comment author\n#EMAIL_FROM# - Sender email\n#EMAIL_TO# - Recipient email', '100'), ('31', 'en', 'NEW_BLOG_COMMENT_WITHOUT_TITLE', 'New comment in blog (without subject)', '#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog title\n#BLOG_URL# - Blog url\n#MESSAGE_TITLE# - Message title\n#COMMENT_TEXT# - Comment text\n#COMMENT_DATE# - Comment date\n#COMMENT_PATH# - Comment URL\n#AUTHOR# - Comment author\n#EMAIL_FROM# - Sender email\n#EMAIL_TO# - Recipient email', '100'), ('32', 'en', 'NEW_BLOG_COMMENT2COMMENT_WITHOUT_TITLE', 'New comment for your in blog (without subject)', '#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog title\n#BLOG_URL# - Blog url\n#MESSAGE_TITLE# - Message title\n#COMMENT_TEXT# - Comment text\n#COMMENT_DATE# - Comment date\n#COMMENT_PATH# - Comment URL\n#AUTHOR# - Comment author\n#EMAIL_FROM# - Sender email\n#EMAIL_TO# - Recipient email', '100'), ('33', 'en', 'BLOG_YOUR_BLOG_TO_USER', 'Your blog has been added to friends', '#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog name\n#BLOG_URL# - Blog name, Latin letters only\n#BLOG_ADR# - Blog address\n#USER_ID# - User ID\n#USER# - User\n#USER_URL# - User URL\n#EMAIL_FROM# - Sender E-mail\n#EMAIL_TO# - Recipient E-mail', '100'), ('34', 'en', 'BLOG_YOU_TO_BLOG', 'You have been added to blog friends', '#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog name\n#BLOG_URL# - Blog name, Latin letters only\n#BLOG_ADR# - Blog address\n#USER_ID# - User ID\n#USER# - User\n#USER_URL# - User URL\n#EMAIL_FROM# - Sender E-mail\n#EMAIL_TO# - Recipient E-mail', '100'), ('35', 'en', 'BLOG_BLOG_TO_YOU', 'A blog has been added to your friends', '#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog name\n#BLOG_URL# - Blog name, Latin letters only\n#BLOG_ADR# - Blog address\n#USER_ID# - User ID\n#USER# - User\n#USER_URL# - User URL\n#EMAIL_FROM# - Sender E-mail\n#EMAIL_TO# - Recipient E-mail', '100'), ('36', 'en', 'BLOG_USER_TO_YOUR_BLOG', 'A friend has been added to your blog', '#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog name\n#BLOG_URL# - Blog name, Latin letters only\n#BLOG_ADR# - Blog address\n#USER_ID# - User ID\n#USER# - User\n#USER_URL# - User URL\n#EMAIL_FROM# - Sender E-mail\n#EMAIL_TO# - Recipient E-mail', '100'), ('37', 'en', 'BLOG_SONET_NEW_POST', 'New post added', '#EMAIL_TO# - Recipient email\n#POST_ID# - Post ID\n#URL_ID# - Post URL', '100'), ('38', 'en', 'BLOG_SONET_NEW_COMMENT', 'Comment added', '#EMAIL_TO# - Recipient email\n#COMMENT_ID# - Comment ID\n#POST_ID# - Post ID\n#URL_ID# - Post URL', '100'), ('39', 'en', 'BLOG_SONET_POST_SHARE', 'New recipient added', '#EMAIL_TO# - Recipient email\n#POST_ID# - Post ID\n#URL_ID# - Post URL', '100'), ('40', 'en', 'BLOG_POST_BROADCAST', 'New post added', '\n#MESSAGE_TITLE# - Post subject\n#MESSAGE_TEXT# - Post text \n#MESSAGE_PATH# - Post URL\n#AUTHOR# - Post author\n#EMAIL_TO# - E-mail recipient', '100'), ('41', 'ru', 'NEW_FORUM_MESSAGE', 'Новое сообщение на форуме', '\n			#FORUM_ID# - ID форума\n			#FORUM_NAME# - Название форума\n			#TOPIC_ID# - ID темы\n			#MESSAGE_ID# - ID сообщения\n			#TOPIC_TITLE# - Тема сообщения\n			#MESSAGE_TEXT# - Текст сообщения\n			#MESSAGE_DATE# - Дата сообщения\n			#AUTHOR# - Автор сообщения\n			#RECIPIENT# - Получатель сообщения\n			#TAPPROVED# - Тема сообщения показывается\n			#MAPPROVED# - Тело сообщения показывается\n			#PATH2FORUM# - Адрес сообщения\n			#FROM_EMAIL# - E-Mail для поля From письма', '100'), ('42', 'ru', 'NEW_FORUM_PRIV', 'Приватное письмо посетителю форума', '\n			#FROM_NAME# - Автор сообщения\n			#FROM_EMAIL# - E-Mail автора сообщения\n			#TO_NAME# - Имя получателя сообщения\n			#TO_EMAIL# - E-Mail получателя сообщения\n			#SUBJECT# - Тема сообщения\n			#MESSAGE# - Тело сообщения\n			#MESSAGE_DATE# - Дата сообщения', '100'), ('43', 'ru', 'NEW_FORUM_PRIVATE_MESSAGE', 'Приватное сообщение', '\n			#FROM_NAME# - Имя автора сообщения\n			#FROM_USER_ID# - ID автора сообщения\n			#FROM_EMAIL# - E-Mail автора сообщения\n			#TO_NAME# - Имя получателя сообщения\n			#TO_USER_ID# - ID получателя сообщения\n			#TO_EMAIL# - E-Mail получателя сообщения\n			#SUBJECT# - Тема сообщения\n			#MESSAGE# - Текст сообщения\n			#MESSAGE_DATE# - Дата сообщения\n			#MESSAGE_LINK# - Ссылка на сообщение', '100'), ('44', 'ru', 'EDIT_FORUM_MESSAGE', 'Изменение сообщения на форуме', '\n			#FORUM_ID# - ID форума\n			#FORUM_NAME# - Название форума\n			#TOPIC_ID# - ID темы\n			#MESSAGE_ID# - ID сообщения\n			#TOPIC_TITLE# - Тема сообщения\n			#MESSAGE_TEXT# - Текст сообщения\n			#MESSAGE_DATE# - Дата сообщения\n			#AUTHOR# - Автор сообщения\n			#RECIPIENT# - Получатель сообщения\n			#TAPPROVED# - Тема сообщения показывается\n			#MAPPROVED# - Тело сообщения показывается\n			#PATH2FORUM# - Адрес сообщения\n			#FROM_EMAIL# - E-Mail для поля From письма', '100'), ('45', 'en', 'NEW_FORUM_MESSAGE', 'New forum message', '\n			#FORUM_ID# - Forum ID\n			#FORUM_NAME# - Forum name\n			#TOPIC_ID# - Topic ID\n			#MESSAGE_ID# - Message ID\n			#TOPIC_TITLE# - Topic title\n			#MESSAGE_TEXT# - Message text\n			#MESSAGE_DATE# - Message date\n			#AUTHOR# - Message author\n			#RECIPIENT# - E-Mail recipient\n			#TAPPROVED# - Message topic is approved\n			#MAPPROVED# - Message is approved\n			#PATH2FORUM# - Message Url\n			#FROM_EMAIL# - E-Mail for From field of the EMail', '100'), ('46', 'en', 'NEW_FORUM_PRIV', 'Private message for forum user', '\n			#FROM_NAME# - Name of the sender\n			#FROM_EMAIL# - E-Mail of the sender\n			#TO_NAME# - Name of recipient\n			#TO_EMAIL# - E-Mail of recipient\n			#SUBJECT# - Topic\n			#MESSAGE# - Message\n			#MESSAGE_DATE# - Date', '100'), ('47', 'en', 'NEW_FORUM_PRIVATE_MESSAGE', 'Private message for forum user', '\n			#FROM_NAME# - Name of the sender\n			#FROM_USER_ID# - ID of the sender\n			#FROM_EMAIL# - E-Mail of the sender\n			#TO_NAME# - Name of recipient\n			#TO_USER_ID# - ID of recipient\n			#TO_EMAIL# - E-Mail of recipient\n			#SUBJECT# - Topic\n			#MESSAGE# - Message\n			#MESSAGE_DATE# - Date\n			#MESSAGE_LINK# - Link to message', '100'), ('48', 'en', 'EDIT_FORUM_MESSAGE', 'Changing forum message', '\n			#FORUM_ID# - Forum ID\n			#FORUM_NAME# - Forum name\n			#TOPIC_ID# - Topic ID\n			#MESSAGE_ID# - Message ID\n			#TOPIC_TITLE# - Topic title\n			#MESSAGE_TEXT# - Message text\n			#MESSAGE_DATE# - Message date\n			#AUTHOR# - Message author\n			#RECIPIENT# - E-Mail recipient\n			#TAPPROVED# - Message topic is approved\n			#MAPPROVED# - Message is approved\n			#PATH2FORUM# - Message Url\n			#FROM_EMAIL# - E-Mail for From field of the EMail', '100'), ('49', 'ru', 'FORUM_NEW_MESSAGE_MAIL', 'Новое сообщение на форуме в режиме общения по E-Mail', '#FORUM_NAME# - Название форума\n#AUTHOR# - Автор сообщения\n#FROM_EMAIL# - E-Mail для поля From письма\n#RECIPIENT# - Получатель сообщения\n#TOPIC_TITLE# - Тема сообщения\n#MESSAGE_TEXT# - Текст сообщения\n#PATH2FORUM# - Адрес сообщения\n#MESSAGE_DATE# - Дата сообщения\n#FORUM_EMAIL# - Е-Mail адрес для добавления сообщений на форум\n#FORUM_ID# - ID форума\n#TOPIC_ID# - ID темы \n#MESSAGE_ID# - ID сообщения\n#TAPPROVED# - Тема опубликована\n#MAPPROVED# - Сообщение опубликовано\n', '100'), ('50', 'en', 'FORUM_NEW_MESSAGE_MAIL', 'New message at the forum (e-mail messaging mode)', '#FORUM_NAME# - Forum name\n#AUTHOR# - Message author\n#FROM_EMAIL# - E-Mail in the &amp;From&amp; field\n#RECIPIENT# - Message recipient\n#TOPIC_TITLE# - Message subject\n#MESSAGE_TEXT# - Message text\n#PATH2FORUM# - Message URL\n#MESSAGE_DATE# - Message date\n#FORUM_EMAIL# - E-Mail to add messages to the forum \n#FORUM_ID# - Forum ID\n#TOPIC_ID# - Topic ID \n#MESSAGE_ID# - Message ID\n#TAPPROVED# - Topic approved and published\n#MAPPROVED# - Message approved and published\n', '100'), ('51', 'ru', 'VIRUS_DETECTED', 'Обнаружен вирус', '#EMAIL# - E-Mail администратора сайта (из настроек главного модуля)', '100'), ('52', 'en', 'VIRUS_DETECTED', 'Virus detected', '#EMAIL# - Site administrator\'s e-mail address (from the Kernel module settings)', '100'), ('53', 'ru', 'SUBSCRIBE_CONFIRM', 'Подтверждение подписки', '#ID# - идентификатор подписки\n#EMAIL# - адрес подписки\n#CONFIRM_CODE# - код подтверждения\n#SUBSCR_SECTION# - раздел, где находится страница редактирования подписки (задается в настройках)\n#USER_NAME# - имя подписчика (может отсутствовать)\n#DATE_SUBSCR# - дата добавления/изменения адреса\n', '100'), ('54', 'en', 'SUBSCRIBE_CONFIRM', 'Confirmation of subscription', '#ID# - subscription ID\n#EMAIL# - subscription email\n#CONFIRM_CODE# - confirmation code\n#SUBSCR_SECTION# - section with subscription edit page (specifies in the settings)\n#USER_NAME# - subscriber\'s name (optional)\n#DATE_SUBSCR# - date of adding/change of address\n', '100'), ('55', 'ru', 'VOTE_FOR', 'Новый голос', '#ID# - ID результата голосования\n#TIME# - время голосования\n#VOTE_TITLE# - наименование опроса\n#VOTE_DESCRIPTION# - описание опроса\n#VOTE_ID# - ID опроса\n#CHANNEL# - наименование группы опроса\n#CHANNEL_ID# - ID группы опроса\n#VOTER_ID# - ID проголосовавшего посетителя\n#USER_NAME# - ФИО пользователя\n#LOGIN# - логин\n#USER_ID# - ID пользователя\n#STAT_GUEST_ID# - ID посетителя модуля статистики\n#SESSION_ID# - ID сессии модуля статистики\n#IP# - IP адрес\n#VOTE_STATISTIC# - Сводная статистика опроса типа ( - Вопрос - Ответ )\n#URL# - Путь к опросу\n', '100'), ('56', 'en', 'VOTE_FOR', 'New vote', '#ID# - Vote result ID\n#TIME# - Time of vote\n#VOTE_TITLE# - Poll name\n#VOTE_DESCRIPTION# - Poll description\n#VOTE_ID# - Poll ID\n#CHANNEL# - Poll group name\n#CHANNEL_ID# - Poll group ID\n#VOTER_ID# - Voter\'s user ID\n#USER_NAME# - User full name\n#LOGIN# - login\n#USER_ID# - User ID\n#STAT_GUEST_ID# - Visitor ID in web analytics module\n#SESSION_ID# - Session ID in web analytics module\n#IP# - IP address\n#VOTE_STATISTIC# - Summary statistics of this poll type ( - Question - Answer)\n#URL# - Poll URL', '100');
COMMIT;

-- ----------------------------
--  Table structure for `b_favorite`
-- ----------------------------
DROP TABLE IF EXISTS `b_favorite`;
CREATE TABLE `b_favorite` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `C_SORT` int(18) NOT NULL DEFAULT '100',
  `MODIFIED_BY` int(18) DEFAULT NULL,
  `CREATED_BY` int(18) DEFAULT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL` text COLLATE utf8_unicode_ci,
  `COMMENTS` text COLLATE utf8_unicode_ci,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `CODE_ID` int(18) DEFAULT NULL,
  `COMMON` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `MENU_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_file`
-- ----------------------------
DROP TABLE IF EXISTS `b_file`;
CREATE TABLE `b_file` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HEIGHT` int(18) DEFAULT NULL,
  `WIDTH` int(18) DEFAULT NULL,
  `FILE_SIZE` bigint(20) DEFAULT NULL,
  `CONTENT_TYPE` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'IMAGE',
  `SUBDIR` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILE_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ORIGINAL_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HANDLER_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EXTERNAL_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FILE_EXTERNAL_ID` (`EXTERNAL_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_file_search`
-- ----------------------------
DROP TABLE IF EXISTS `b_file_search`;
CREATE TABLE `b_file_search` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SESS_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `F_PATH` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `B_DIR` int(11) NOT NULL DEFAULT '0',
  `F_SIZE` int(11) NOT NULL DEFAULT '0',
  `F_TIME` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_filters`
-- ----------------------------
DROP TABLE IF EXISTS `b_filters`;
CREATE TABLE `b_filters` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(18) DEFAULT NULL,
  `FILTER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `FIELDS` text COLLATE utf8_unicode_ci NOT NULL,
  `COMMON` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PRESET` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PRESET_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(18) DEFAULT NULL,
  `SORT_FIELD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_finder_dest`
-- ----------------------------
DROP TABLE IF EXISTS `b_finder_dest`;
CREATE TABLE `b_finder_dest` (
  `USER_ID` int(11) NOT NULL,
  `CODE` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `CODE_USER_ID` int(11) DEFAULT NULL,
  `CODE_TYPE` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTEXT` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_USE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`USER_ID`,`CODE`,`CONTEXT`),
  KEY `IX_FINDER_DEST` (`CODE_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_form`
-- ----------------------------
DROP TABLE IF EXISTS `b_form`;
CREATE TABLE `b_form` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `BUTTON` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `C_SORT` int(18) DEFAULT '100',
  `FIRST_SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IMAGE_ID` int(18) DEFAULT NULL,
  `USE_CAPTCHA` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `DESCRIPTION_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'html',
  `FORM_TEMPLATE` text COLLATE utf8_unicode_ci,
  `USE_DEFAULT_TEMPLATE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `SHOW_TEMPLATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MAIL_EVENT_TYPE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SHOW_RESULT_TEMPLATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PRINT_RESULT_TEMPLATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EDIT_RESULT_TEMPLATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILTER_RESULT_TEMPLATE` text COLLATE utf8_unicode_ci,
  `TABLE_RESULT_TEMPLATE` text COLLATE utf8_unicode_ci,
  `USE_RESTRICTIONS` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `RESTRICT_USER` int(5) DEFAULT '0',
  `RESTRICT_TIME` int(10) DEFAULT '0',
  `RESTRICT_STATUS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STAT_EVENT1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STAT_EVENT2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STAT_EVENT3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_SID` (`SID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_form_2_group`
-- ----------------------------
DROP TABLE IF EXISTS `b_form_2_group`;
CREATE TABLE `b_form_2_group` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FORM_ID` int(18) NOT NULL DEFAULT '0',
  `GROUP_ID` int(18) NOT NULL DEFAULT '0',
  `PERMISSION` int(5) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`),
  KEY `IX_FORM_ID` (`FORM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_form_2_mail_template`
-- ----------------------------
DROP TABLE IF EXISTS `b_form_2_mail_template`;
CREATE TABLE `b_form_2_mail_template` (
  `FORM_ID` int(18) NOT NULL DEFAULT '0',
  `MAIL_TEMPLATE_ID` int(18) NOT NULL DEFAULT '0',
  PRIMARY KEY (`FORM_ID`,`MAIL_TEMPLATE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_form_2_site`
-- ----------------------------
DROP TABLE IF EXISTS `b_form_2_site`;
CREATE TABLE `b_form_2_site` (
  `FORM_ID` int(18) NOT NULL DEFAULT '0',
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`FORM_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_form_answer`
-- ----------------------------
DROP TABLE IF EXISTS `b_form_answer`;
CREATE TABLE `b_form_answer` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FIELD_ID` int(18) NOT NULL DEFAULT '0',
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `MESSAGE` text COLLATE utf8_unicode_ci,
  `C_SORT` int(18) NOT NULL DEFAULT '100',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `VALUE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD_TYPE` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `FIELD_WIDTH` int(18) DEFAULT NULL,
  `FIELD_HEIGHT` int(18) DEFAULT NULL,
  `FIELD_PARAM` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `IX_FIELD_ID` (`FIELD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_form_crm`
-- ----------------------------
DROP TABLE IF EXISTS `b_form_crm`;
CREATE TABLE `b_form_crm` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `URL` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `AUTH_HASH` varchar(32) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_form_crm_field`
-- ----------------------------
DROP TABLE IF EXISTS `b_form_crm_field`;
CREATE TABLE `b_form_crm_field` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `LINK_ID` int(18) NOT NULL DEFAULT '0',
  `FIELD_ID` int(18) DEFAULT '0',
  `FIELD_ALT` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `CRM_FIELD` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `ix_b_form_crm_field_1` (`LINK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_form_crm_link`
-- ----------------------------
DROP TABLE IF EXISTS `b_form_crm_link`;
CREATE TABLE `b_form_crm_link` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FORM_ID` int(18) NOT NULL DEFAULT '0',
  `CRM_ID` int(18) NOT NULL DEFAULT '0',
  `LINK_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'M',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_form_crm_link_1` (`FORM_ID`,`CRM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_form_field`
-- ----------------------------
DROP TABLE IF EXISTS `b_form_field`;
CREATE TABLE `b_form_field` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FORM_ID` int(18) NOT NULL DEFAULT '0',
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `TITLE` text COLLATE utf8_unicode_ci,
  `TITLE_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `SID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `C_SORT` int(18) NOT NULL DEFAULT '100',
  `ADDITIONAL` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `REQUIRED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IN_FILTER` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IN_RESULTS_TABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IN_EXCEL_TABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `FIELD_TYPE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IMAGE_ID` int(18) DEFAULT NULL,
  `COMMENTS` text COLLATE utf8_unicode_ci,
  `FILTER_TITLE` text COLLATE utf8_unicode_ci,
  `RESULTS_TABLE_TITLE` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `IX_FORM_ID` (`FORM_ID`),
  KEY `IX_SID` (`SID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_form_field_filter`
-- ----------------------------
DROP TABLE IF EXISTS `b_form_field_filter`;
CREATE TABLE `b_form_field_filter` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FIELD_ID` int(18) NOT NULL DEFAULT '0',
  `PARAMETER_NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `FILTER_TYPE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FIELD_ID` (`FIELD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_form_field_validator`
-- ----------------------------
DROP TABLE IF EXISTS `b_form_field_validator`;
CREATE TABLE `b_form_field_validator` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FORM_ID` int(18) NOT NULL DEFAULT '0',
  `FIELD_ID` int(18) NOT NULL DEFAULT '0',
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'y',
  `C_SORT` int(18) DEFAULT '100',
  `VALIDATOR_SID` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `PARAMS` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `IX_FORM_ID` (`FORM_ID`),
  KEY `IX_FIELD_ID` (`FIELD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_form_menu`
-- ----------------------------
DROP TABLE IF EXISTS `b_form_menu`;
CREATE TABLE `b_form_menu` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FORM_ID` int(18) NOT NULL DEFAULT '0',
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `MENU` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FORM_ID` (`FORM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_form_result`
-- ----------------------------
DROP TABLE IF EXISTS `b_form_result`;
CREATE TABLE `b_form_result` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `STATUS_ID` int(18) NOT NULL DEFAULT '0',
  `FORM_ID` int(18) NOT NULL DEFAULT '0',
  `USER_ID` int(18) DEFAULT NULL,
  `USER_AUTH` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `STAT_GUEST_ID` int(18) DEFAULT NULL,
  `STAT_SESSION_ID` int(18) DEFAULT NULL,
  `SENT_TO_CRM` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `IX_FORM_ID` (`FORM_ID`),
  KEY `IX_STATUS_ID` (`STATUS_ID`),
  KEY `IX_SENT_TO_CRM` (`SENT_TO_CRM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_form_result_answer`
-- ----------------------------
DROP TABLE IF EXISTS `b_form_result_answer`;
CREATE TABLE `b_form_result_answer` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `RESULT_ID` int(18) NOT NULL DEFAULT '0',
  `FORM_ID` int(18) NOT NULL DEFAULT '0',
  `FIELD_ID` int(18) NOT NULL DEFAULT '0',
  `ANSWER_ID` int(18) DEFAULT NULL,
  `ANSWER_TEXT` text COLLATE utf8_unicode_ci,
  `ANSWER_TEXT_SEARCH` longtext COLLATE utf8_unicode_ci,
  `ANSWER_VALUE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ANSWER_VALUE_SEARCH` longtext COLLATE utf8_unicode_ci,
  `USER_TEXT` longtext COLLATE utf8_unicode_ci,
  `USER_TEXT_SEARCH` longtext COLLATE utf8_unicode_ci,
  `USER_DATE` datetime DEFAULT NULL,
  `USER_FILE_ID` int(18) DEFAULT NULL,
  `USER_FILE_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_FILE_IS_IMAGE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_FILE_HASH` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_FILE_SUFFIX` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_FILE_SIZE` int(18) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_RESULT_ID` (`RESULT_ID`),
  KEY `IX_FIELD_ID` (`FIELD_ID`),
  KEY `IX_ANSWER_ID` (`ANSWER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_form_status`
-- ----------------------------
DROP TABLE IF EXISTS `b_form_status`;
CREATE TABLE `b_form_status` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FORM_ID` int(18) NOT NULL DEFAULT '0',
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `C_SORT` int(18) NOT NULL DEFAULT '100',
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `DEFAULT_VALUE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `CSS` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'statusgreen',
  `HANDLER_OUT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HANDLER_IN` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MAIL_EVENT_TYPE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FORM_ID` (`FORM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_form_status_2_group`
-- ----------------------------
DROP TABLE IF EXISTS `b_form_status_2_group`;
CREATE TABLE `b_form_status_2_group` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `STATUS_ID` int(18) NOT NULL DEFAULT '0',
  `GROUP_ID` int(18) NOT NULL DEFAULT '0',
  `PERMISSION` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FORM_STATUS_GROUP` (`STATUS_ID`,`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_form_status_2_mail_template`
-- ----------------------------
DROP TABLE IF EXISTS `b_form_status_2_mail_template`;
CREATE TABLE `b_form_status_2_mail_template` (
  `STATUS_ID` int(18) NOT NULL DEFAULT '0',
  `MAIL_TEMPLATE_ID` int(18) NOT NULL DEFAULT '0',
  PRIMARY KEY (`STATUS_ID`,`MAIL_TEMPLATE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_forum`
-- ----------------------------
DROP TABLE IF EXISTS `b_forum`;
CREATE TABLE `b_forum` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `FORUM_GROUP_ID` int(11) DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `SORT` int(10) NOT NULL DEFAULT '150',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_HTML` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ALLOW_ANCHOR` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_BIU` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_IMG` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_VIDEO` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_LIST` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_QUOTE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_CODE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_FONT` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_SMILES` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_UPLOAD` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ALLOW_TABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ALLOW_ALIGN` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_UPLOAD_EXT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ALLOW_MOVE_TOPIC` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_TOPIC_TITLED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ALLOW_NL2BR` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ALLOW_SIGNATURE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `PATH2FORUM_MESSAGE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ASK_GUEST_EMAIL` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `USE_CAPTCHA` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `INDEXATION` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `DEDUPLICATION` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `MODERATION` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ORDER_BY` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'P',
  `ORDER_DIRECTION` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'DESC',
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'ru',
  `TOPICS` int(11) NOT NULL DEFAULT '0',
  `POSTS` int(11) NOT NULL DEFAULT '0',
  `LAST_POSTER_ID` int(11) DEFAULT NULL,
  `LAST_POSTER_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_POST_DATE` datetime DEFAULT NULL,
  `LAST_MESSAGE_ID` bigint(20) DEFAULT NULL,
  `POSTS_UNAPPROVED` int(11) DEFAULT '0',
  `ABS_LAST_POSTER_ID` int(11) DEFAULT NULL,
  `ABS_LAST_POSTER_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ABS_LAST_POST_DATE` datetime DEFAULT NULL,
  `ABS_LAST_MESSAGE_ID` bigint(20) DEFAULT NULL,
  `EVENT1` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'forum',
  `EVENT2` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'message',
  `EVENT3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HTML` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FORUM_SORT` (`SORT`),
  KEY `IX_FORUM_ACTIVE` (`ACTIVE`),
  KEY `IX_FORUM_GROUP_ID` (`FORUM_GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_forum2site`
-- ----------------------------
DROP TABLE IF EXISTS `b_forum2site`;
CREATE TABLE `b_forum2site` (
  `FORUM_ID` int(11) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `PATH2FORUM_MESSAGE` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`FORUM_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_forum_dictionary`
-- ----------------------------
DROP TABLE IF EXISTS `b_forum_dictionary`;
CREATE TABLE `b_forum_dictionary` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `b_forum_dictionary`
-- ----------------------------
BEGIN;
INSERT INTO `b_forum_dictionary` VALUES ('1', '[ru] Словарь слов', 'W'), ('2', '[ru] Словарь транслита', 'T'), ('3', '[en] Bad words', 'W'), ('4', '[en] Transliteration', 'T');
COMMIT;

-- ----------------------------
--  Table structure for `b_forum_email`
-- ----------------------------
DROP TABLE IF EXISTS `b_forum_email`;
CREATE TABLE `b_forum_email` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EMAIL_FORUM_ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `FORUM_ID` int(11) NOT NULL,
  `SOCNET_GROUP_ID` int(11) DEFAULT NULL,
  `MAIL_FILTER_ID` int(11) NOT NULL,
  `EMAIL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `USE_EMAIL` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL_GROUP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SUBJECT_SUF` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USE_SUBJECT` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL_TEMPLATES_MESSAGE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NOT_MEMBER_POST` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FORUM_EMAIL_FORUM_SOC` (`FORUM_ID`,`SOCNET_GROUP_ID`),
  KEY `IX_B_FORUM_EMAIL_FILTER_ID` (`MAIL_FILTER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_forum_file`
-- ----------------------------
DROP TABLE IF EXISTS `b_forum_file`;
CREATE TABLE `b_forum_file` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FORUM_ID` int(18) DEFAULT NULL,
  `TOPIC_ID` int(20) DEFAULT NULL,
  `MESSAGE_ID` int(20) DEFAULT NULL,
  `FILE_ID` int(18) NOT NULL,
  `USER_ID` int(18) DEFAULT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `HITS` int(18) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FORUM_FILE_FILE` (`FILE_ID`),
  KEY `IX_FORUM_FILE_FORUM` (`FORUM_ID`),
  KEY `IX_FORUM_FILE_TOPIC` (`TOPIC_ID`),
  KEY `IX_FORUM_FILE_MESSAGE` (`MESSAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_forum_filter`
-- ----------------------------
DROP TABLE IF EXISTS `b_forum_filter`;
CREATE TABLE `b_forum_filter` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DICTIONARY_ID` int(11) DEFAULT NULL,
  `WORDS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PATTERN` text COLLATE utf8_unicode_ci,
  `REPLACEMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `USE_IT` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PATTERN_CREATE` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FORUM_FILTER_2` (`USE_IT`),
  KEY `IX_B_FORUM_FILTER_3` (`PATTERN_CREATE`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `b_forum_filter`
-- ----------------------------
BEGIN;
INSERT INTO `b_forum_filter` VALUES ('1', '1', '*пизд*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])([^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*([ПпPp]+)([ИиIi]+)([ЗзZz3]+)([ДдDd]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('2', '1', '*пизж*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])([^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*([ПпPp]+)([ИиIi]+)([ЗзZz3]+)([ЖжGg]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('3', '1', '*сра%', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])([^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*([СсCc]+)([РрPpRr]+)([АаAa]+)([[Цц]+([Аа]+|[Оо]+)]+|[[Тт]+([Ьь]+|)[Сс]+[Яя]+]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('4', '1', 'анобляд*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([АаAa]+)([НнNn]+)([ОоOo]+)([БбBb]+)([ЛлLl]+)([Яя]+)([ДдDd]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('5', '1', 'взъеб*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвVv]+)([ЗзZz3]+)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('6', '1', 'бля', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([БбBb]+)([ЛлLl]+)([Яя]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('7', '1', 'долбоеб*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ДдDd]+)([ОоOo]+)([ЛлLl]+)([БбBb]+)([ОоOo]+)([ЁёЕеEe]+)([БбBb]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('8', '1', 'дуроеб*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ДдDd]+)([УуUu]+)([РрPpRr]+)([ОоOo]+)([ЁёЕеEe]+)([БбBb]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('9', '1', 'еби', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([ИиIi]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('10', '1', 'ебисти*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([ИиIi]+)([СсCc]+)([ТтTt]+)([ИиIi]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('11', '1', 'ебическ*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([ИиIi]+)([Чч]+)([ЁёЕеEe]+)([СсCc]+)([КкKk]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('12', '1', 'еблив*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([ЛлLl]+)([ИиIi]+)([ВвVv]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('13', '1', 'ебло*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([ЛлLl]+)([ОоOo]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('14', '1', 'еблыс*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([ЛлLl]+)([Ыы]+)([СсCc]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('15', '1', 'ебля', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([ЛлLl]+)([Яя]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('16', '1', 'ебс', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([СсCc]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('17', '1', 'ебукент*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([УуUu]+)([КкKk]+)([ЁёЕеEe]+)([НнNn]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('18', '1', 'ебурген*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([УуUu]+)([РрPpRr]+)([Гг]+)([ЁёЕеEe]+)([НнNn]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('19', '1', 'коноебит*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([КкKk]+)([ОоOo]+)([НнNn]+)([ОоOo]+)([ЁёЕеEe]+)([БбBb]+)([ИиIi]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('20', '1', 'мозгоеб*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([МмMm]+)([ОоOo]+)([ЗзZz3]+)([Гг]+)([ОоOo]+)([ЁёЕеEe]+)([БбBb]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('21', '1', 'мудоеб*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([МмMm]+)([УуUu]+)([ДдDd]+)([ОоOo]+)([ЁёЕеEe]+)([БбBb]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('22', '1', 'однохуйствен*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ОоOo]+)([ДдDd]+)([НнNn]+)([ОоOo]+)([ХхXx]+)([УуUu]+)([ЙйИиYy]+)([СсCc]+)([ТтTt]+)([ВвVv]+)([ЁёЕеEe]+)([НнNn]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('23', '1', 'охуе*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ОоOo]+)([ХхXx]+)([УуUu]+)([ЁёЕеEe]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('24', '1', 'охуи*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ОоOo]+)([ХхXx]+)([УуUu]+)([ИиIi]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('25', '1', 'охуя*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ОоOo]+)([ХхXx]+)([УуUu]+)([Яя]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('26', '1', 'разъеба*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([РрPpRr]+)([АаAa]+)([ЗзZz3]+)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)([АаAa]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('27', '1', 'распиздон*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([РрPpRr]+)([АаAa]+)([СсCc]+)([ПпPp]+)([ИиIi]+)([ЗзZz3]+)([ДдDd]+)([ОоOo]+)([НнNn]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('28', '1', 'расхуюж*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([РрPpRr]+)([АаAa]+)([СсCc]+)([ХхXx]+)([УуUu]+)([Юю]+|[[Йй]+[Оо]+]+)([ЖжGg]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('29', '1', 'худоебин*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ДдDd]+)([ОоOo]+)([ЁёЕеEe]+)([БбBb]+)([ИиIi]+)([НнNn]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('30', '1', 'хуе', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ЁёЕеEe]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('31', '1', 'хуебрат*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ЁёЕеEe]+)([БбBb]+)([РрPpRr]+)([АаAa]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('32', '1', 'хуеглот*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ЁёЕеEe]+)([Гг]+)([ЛлLl]+)([ОоOo]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('33', '1', 'хуеплёт*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ЁёЕеEe]+)([ПпPp]+)([ЛлLl]+)([ЁёЕеEe]+|[[Йй]+[Оо]+]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('34', '1', 'хует*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ЁёЕеEe]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('35', '1', 'хуила', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ИиIi]+)([ЛлLl]+)([АаAa]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('36', '1', 'хул?', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ЛлLl]+).?)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('37', '1', 'хуя', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([Яя]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('38', '1', '^бляд*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([БбBb]+)([ЛлLl]+)([Яя]+)([ДдDd]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('39', '1', '^пидор*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ПпPp]+)([ИиIi]+)([ДдDd]+)([ОоOo]+)([РрPpRr]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('40', '1', '^хуев*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ХхXx]+)([УуUu]+)([ЁёЕеEe]+)([ВвVv]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('41', '1', '^хуем*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ХхXx]+)([УуUu]+)([ЁёЕеEe]+)([МмMm]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('42', '1', '^хуй*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ХхXx]+)([УуUu]+)([ЙйИиYy]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('43', '1', '^хуяк*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ХхXx]+)([УуUu]+)([Яя]+)([КкKk]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('44', '1', '^хуям*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ХхXx]+)([УуUu]+)([Яя]+)([МмMm]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('45', '1', '^хуяр*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ХхXx]+)([УуUu]+)([Яя]+)([РрPpRr]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('46', '1', '^хуяч*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ХхXx]+)([УуUu]+)([Яя]+)([Чч]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('47', '1', '^ъебал*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)([АаAa]+)([ЛлLl]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('48', '1', '^ъебан*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)([АаAa]+)([НнNn]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('49', '1', '^ъебар*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)([АаAa]+)([РрPpRr]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('50', '1', '^ъебат*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)([АаAa]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('51', '1', '^ъебен*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)([ЁёЕеEe]+)([НнNn]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('52', '1', '^ъеби', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)([ИиIi]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('53', '1', '^ъебис*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)([ИиIi]+)([СсCc]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('54', '1', '^ъебит*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)([ИиIi]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('55', '1', '^ъёбля*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+|[[Йй]+[Оо]+]+)([БбBb]+)([ЛлLl]+)([Яя]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('56', '1', '^ъёбну*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+|[[Йй]+[Оо]+]+)([БбBb]+)([НнNn]+)([УуUu]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('57', '1', '^ъебу', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)([УуUu]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('58', '1', '^ъебуч*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)([УуUu]+)([Чч]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('59', '1', '^ъебыв*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь\"\']+|)([ЁёЕеEe]+)([БбBb]+)([Ыы]+)([ВвVv]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('60', '1', '/(?<=[s.,;:!?-#*|[]()])(?![Вв][ЕеЁё][Бб])(([ВвЗзСс]+|[Ввы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)|)([ЬьЪъ]+|)([ЁёЕеEe]+|[Йй]+[Оо]+|[Yy]+[Oo]+)([BbБб]+))(?=[s.,;:!?-#*|[]()])/is', '', '', '', 'Y', 'PTTRN'), ('61', '3', 'angry', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(a+n+g+r+y+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('62', '3', 'ass', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(a+s+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('63', '3', 'asshole', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(a+s+s+h+o+l+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('64', '3', 'banger', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+a+n+g+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('65', '3', 'bastard', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+a+s+t+a+r+d+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('66', '3', 'batter', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+a+t+t+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('67', '3', 'bicho', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+i+c+h+o+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('68', '3', 'bisexual', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+i+s+e+x+u+a+l+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('69', '3', 'bitch', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+i+t+c+h+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('70', '3', 'blumpkin', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+l+u+m+p+k+i+n+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('71', '3', 'booger', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+o+o+g+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('72', '3', 'bugger*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+u+g+g+e+r+[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('73', '3', 'bukakke', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+u+k+a+k+k+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('74', '3', 'bull', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+u+l+l+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('75', '3', 'bulldyke', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+u+l+l+d+y+k+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('76', '3', 'bullshit', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+u+l+l+s+h+i+t+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('77', '3', 'bunny', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+u+n+n+y+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('78', '3', 'bunnyfuck', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+u+n+n+y+f+u+c+k+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('79', '3', 'chocha', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+h+o+c+h+a+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('80', '3', 'chode', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+h+o+d+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('81', '3', 'clap', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+l+a+p+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('82', '3', 'coconuts', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+o+c+o+n+u+t+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('83', '3', 'cohones', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+o+h+o+n+e+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('84', '3', 'cojones', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+o+j+o+n+e+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('85', '3', 'coon', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+o+o+n+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('86', '3', 'cootch', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+o+o+t+c+h+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('87', '3', 'cooter', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+o+o+t+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('88', '3', 'cornhole', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+o+r+n+h+o+l+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('89', '3', 'cracka', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+r+a+c+k+a+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('90', '3', 'crap', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+r+a+p+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('91', '3', 'cum', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+u+m+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('92', '3', 'cunnilingus', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+u+n+n+i+l+i+n+g+u+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('93', '3', 'cunt*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+u+n+t+[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('94', '3', 'damn*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+a+m+n+[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('95', '3', 'dark*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+a+r+k+[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('96', '3', 'dick', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+i+c+k+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('97', '3', 'dickhead', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+i+c+k+h+e+a+d+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('98', '3', 'diddle', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+i+d+d+l+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('99', '3', 'dildo', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+i+l+d+o+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('100', '3', 'dilhole', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+i+l+h+o+l+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('101', '3', 'dingleberry', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+i+n+g+l+e+b+e+r+r+y+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('102', '3', 'doodle', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+o+o+d+l+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('103', '3', 'dork', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+o+r+k+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('104', '3', 'dumpster', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+u+m+p+s+t+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('105', '3', 'faggot', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(f+a+g+g+o+t+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('106', '3', 'fart', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(f+a+r+t+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('107', '3', 'frig', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(f+r+i+g+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('108', '3', 'fuck*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(f+u+c+k+[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('109', '3', 'fucker', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(f+u+c+k+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('110', '3', 'giz', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(g+i+z+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('111', '3', 'goatse', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(g+o+a+t+s+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('112', '3', 'gook', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(g+o+o+k+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('113', '3', 'gringo', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(g+r+i+n+g+o+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('114', '3', 'hobo', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(h+o+b+o+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('115', '3', 'honky', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(h+o+n+k+y+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('116', '3', 'jackass', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(j+a+c+k+a+s+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('117', '3', 'jackoff', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(j+a+c+k+o+f+f+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('118', '3', 'jerkoff', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(j+e+r+k+o+f+f+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('119', '3', 'jiggaboo', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(j+i+g+g+a+b+o+o+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('120', '3', 'jizz', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(j+i+z+z+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('121', '3', 'kike', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(k+i+k+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('122', '3', 'mayo', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(m+a+y+o+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('123', '3', 'moose', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(m+o+o+s+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('124', '3', 'nigg*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(n+i+g+g+[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('125', '3', 'paki', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(p+a+k+i+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('126', '3', 'pecker', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(p+e+c+k+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('127', '3', 'piss', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(p+i+s+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('128', '3', 'poonanni', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(p+o+o+n+a+n+n+i+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('129', '3', 'poontang', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(p+o+o+n+t+a+n+g+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('130', '3', 'prick', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(p+r+i+c+k+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('131', '3', 'punch', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(p+u+n+c+h+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('132', '3', 'queef', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(q+u+e+e+f+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('133', '3', 'rogue', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(r+o+g+u+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('134', '3', 'sanchez', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(s+a+n+c+h+e+z+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('135', '3', 'schlong', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(s+c+h+l+o+n+g+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('136', '3', 'shit', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(s+h+i+t+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('137', '3', 'skank', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(s+k+a+n+k+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('138', '3', 'spaz', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(s+p+a+z+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('139', '3', 'spic', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(s+p+i+c+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('140', '3', 'teabag*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(t+e+a+b+a+g+[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('141', '3', 'tits', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(t+i+t+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('142', '3', 'twat', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(t+w+a+t+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('143', '3', 'twot', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(t+w+o+t+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('144', '3', 'vart', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(v+a+r+t+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('145', '3', 'wanker', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(w+a+n+k+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('146', '3', 'waste', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(w+a+s+t+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('147', '3', 'wetback', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(w+e+t+b+a+c+k+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('148', '3', 'whore', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(w+h+o+r+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('149', '3', 'wigger', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(w+i+g+g+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('150', '3', 'wog', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(w+o+g+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'), ('151', '3', 'wop', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(w+o+p+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL');
COMMIT;

-- ----------------------------
--  Table structure for `b_forum_group`
-- ----------------------------
DROP TABLE IF EXISTS `b_forum_group`;
CREATE TABLE `b_forum_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SORT` int(11) NOT NULL DEFAULT '150',
  `PARENT_ID` int(11) DEFAULT NULL,
  `LEFT_MARGIN` int(11) DEFAULT NULL,
  `RIGHT_MARGIN` int(11) DEFAULT NULL,
  `DEPTH_LEVEL` int(11) DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_forum_group_lang`
-- ----------------------------
DROP TABLE IF EXISTS `b_forum_group_lang`;
CREATE TABLE `b_forum_group_lang` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FORUM_GROUP_ID` int(11) NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_FORUM_GROUP` (`FORUM_GROUP_ID`,`LID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_forum_letter`
-- ----------------------------
DROP TABLE IF EXISTS `b_forum_letter`;
CREATE TABLE `b_forum_letter` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DICTIONARY_ID` int(11) DEFAULT '0',
  `LETTER` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REPLACEMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `b_forum_letter`
-- ----------------------------
BEGIN;
INSERT INTO `b_forum_letter` VALUES ('1', '2', 'а', 'АаAa'), ('2', '2', 'б', 'БбBb'), ('3', '2', 'в', 'ВвVv'), ('4', '2', 'г', 'Гг'), ('5', '2', 'д', 'ДдDd'), ('6', '2', 'е', 'ЁёЕеEe'), ('7', '2', 'ё', 'ЁёЕеEe, [Йй]+[Оо]+'), ('8', '2', 'ж', 'ЖжGg'), ('9', '2', 'з', 'ЗзZz3'), ('10', '2', 'и', 'ИиIi'), ('11', '2', 'й', 'ЙйИиYy'), ('12', '2', 'к', 'КкKk'), ('13', '2', 'л', 'ЛлLl'), ('14', '2', 'м', 'МмMm'), ('15', '2', 'н', 'НнNn'), ('16', '2', 'о', 'ОоOo'), ('17', '2', 'п', 'ПпPp'), ('18', '2', 'р', 'РрPpRr'), ('19', '2', 'с', 'СсCc'), ('20', '2', 'т', 'ТтTt'), ('21', '2', 'у', 'УуUu'), ('22', '2', 'ф', 'ФфFf'), ('23', '2', 'х', 'ХхXx'), ('24', '2', 'ц', 'ЦцCc'), ('25', '2', 'ч', 'Чч'), ('26', '2', 'ш', 'Шш'), ('27', '2', 'щ', 'Щщ'), ('28', '2', 'ь', 'ЪъЬь\"\','), ('29', '2', 'ы', 'Ыы'), ('30', '2', 'ъ', 'ЪъЬь\"\','), ('31', '2', 'э', 'Ээ'), ('32', '2', 'ю', 'Юю, [Йй]+[Оо]+'), ('33', '2', 'я', 'Яя'), ('34', '2', '%', '[Цц]+([Аа]+|[Оо]+), [Тт]+([Ьь]+|)[Сс]+[Яя]+'), ('35', '2', '^', ',ВвЗзСс,ВвЫы,ДдОо,ЗзАа,ИиЗзСс,НнАа,НнЕе,ОоТт,([Пп]*[Ее]+[Рр]+[Ее]+)'), ('36', '2', 'тся', '%'), ('37', '2', 'ться', '%');
COMMIT;

-- ----------------------------
--  Table structure for `b_forum_message`
-- ----------------------------
DROP TABLE IF EXISTS `b_forum_message`;
CREATE TABLE `b_forum_message` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `FORUM_ID` int(10) NOT NULL,
  `TOPIC_ID` bigint(20) NOT NULL,
  `USE_SMILES` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NEW_TOPIC` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `APPROVED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SOURCE_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'WEB',
  `POST_DATE` datetime NOT NULL,
  `POST_MESSAGE` text COLLATE utf8_unicode_ci,
  `POST_MESSAGE_HTML` text COLLATE utf8_unicode_ci,
  `POST_MESSAGE_FILTER` text COLLATE utf8_unicode_ci,
  `POST_MESSAGE_CHECK` char(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ATTACH_IMG` int(11) DEFAULT NULL,
  `PARAM1` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PARAM2` int(11) DEFAULT NULL,
  `AUTHOR_ID` int(10) DEFAULT NULL,
  `AUTHOR_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUTHOR_EMAIL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUTHOR_IP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUTHOR_REAL_IP` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GUEST_ID` int(10) DEFAULT NULL,
  `EDITOR_ID` int(10) DEFAULT NULL,
  `EDITOR_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EDITOR_EMAIL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EDIT_REASON` text COLLATE utf8_unicode_ci,
  `EDIT_DATE` datetime DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HTML` text COLLATE utf8_unicode_ci,
  `MAIL_HEADER` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `IX_FORUM_MESSAGE_FORUM` (`FORUM_ID`,`APPROVED`),
  KEY `IX_FORUM_MESSAGE_TOPIC` (`TOPIC_ID`,`APPROVED`,`ID`),
  KEY `IX_FORUM_MESSAGE_AUTHOR` (`AUTHOR_ID`,`APPROVED`,`FORUM_ID`,`ID`),
  KEY `IX_FORUM_MESSAGE_APPROVED` (`APPROVED`),
  KEY `IX_FORUM_MESSAGE_PARAM2` (`PARAM2`),
  KEY `IX_FORUM_MESSAGE_XML_ID` (`XML_ID`),
  KEY `IX_FORUM_MESSAGE_DATE_AUTHOR_ID` (`POST_DATE`,`AUTHOR_ID`),
  KEY `IX_FORUM_MESSAGE_AUTHOR_TOPIC_ID` (`AUTHOR_ID`,`TOPIC_ID`,`ID`),
  KEY `IX_FORUM_MESSAGE_AUTHOR_FORUM_ID` (`AUTHOR_ID`,`FORUM_ID`,`ID`,`APPROVED`,`TOPIC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_forum_perms`
-- ----------------------------
DROP TABLE IF EXISTS `b_forum_perms`;
CREATE TABLE `b_forum_perms` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FORUM_ID` int(11) NOT NULL,
  `GROUP_ID` int(11) NOT NULL,
  `PERMISSION` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'M',
  PRIMARY KEY (`ID`),
  KEY `IX_FORUM_PERMS_FORUM` (`FORUM_ID`,`GROUP_ID`),
  KEY `IX_FORUM_PERMS_GROUP` (`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_forum_pm_folder`
-- ----------------------------
DROP TABLE IF EXISTS `b_forum_pm_folder`;
CREATE TABLE `b_forum_pm_folder` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `SORT` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FORUM_PM_FOLDER_USER_IST` (`USER_ID`,`ID`,`SORT`,`TITLE`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `b_forum_pm_folder`
-- ----------------------------
BEGIN;
INSERT INTO `b_forum_pm_folder` VALUES ('1', 'SYSTEM_FOLDER_1', '0', '0'), ('2', 'SYSTEM_FOLDER_2', '0', '0'), ('3', 'SYSTEM_FOLDER_3', '0', '0'), ('4', 'SYSTEM_FOLDER_4', '0', '0');
COMMIT;

-- ----------------------------
--  Table structure for `b_forum_points`
-- ----------------------------
DROP TABLE IF EXISTS `b_forum_points`;
CREATE TABLE `b_forum_points` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MIN_POINTS` int(11) NOT NULL,
  `CODE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VOTES` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_FORUM_P_MP` (`MIN_POINTS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_forum_points2post`
-- ----------------------------
DROP TABLE IF EXISTS `b_forum_points2post`;
CREATE TABLE `b_forum_points2post` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MIN_NUM_POSTS` int(11) NOT NULL,
  `POINTS_PER_POST` decimal(18,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_FORUM_P2P_MNP` (`MIN_NUM_POSTS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_forum_points_lang`
-- ----------------------------
DROP TABLE IF EXISTS `b_forum_points_lang`;
CREATE TABLE `b_forum_points_lang` (
  `POINTS_ID` int(11) NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`POINTS_ID`,`LID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_forum_private_message`
-- ----------------------------
DROP TABLE IF EXISTS `b_forum_private_message`;
CREATE TABLE `b_forum_private_message` (
  `ID` bigint(10) NOT NULL AUTO_INCREMENT,
  `AUTHOR_ID` int(11) DEFAULT '0',
  `RECIPIENT_ID` int(11) DEFAULT '0',
  `POST_DATE` datetime DEFAULT NULL,
  `POST_SUBJ` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `POST_MESSAGE` text COLLATE utf8_unicode_ci NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `FOLDER_ID` int(11) NOT NULL,
  `IS_READ` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REQUEST_IS_READ` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USE_SMILES` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FORUM_PM_USER` (`USER_ID`),
  KEY `IX_B_FORUM_PM_AFR` (`AUTHOR_ID`,`FOLDER_ID`,`IS_READ`),
  KEY `IX_B_FORUM_PM_UFP` (`USER_ID`,`FOLDER_ID`,`POST_DATE`),
  KEY `IX_B_FORUM_PM_POST_DATE` (`POST_DATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_forum_rank`
-- ----------------------------
DROP TABLE IF EXISTS `b_forum_rank`;
CREATE TABLE `b_forum_rank` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MIN_NUM_POSTS` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_forum_rank_lang`
-- ----------------------------
DROP TABLE IF EXISTS `b_forum_rank_lang`;
CREATE TABLE `b_forum_rank_lang` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RANK_ID` int(11) NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_FORUM_RANK` (`RANK_ID`,`LID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_forum_stat`
-- ----------------------------
DROP TABLE IF EXISTS `b_forum_stat`;
CREATE TABLE `b_forum_stat` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(10) DEFAULT NULL,
  `IP_ADDRESS` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PHPSESSID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_VISIT` datetime DEFAULT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORUM_ID` smallint(5) NOT NULL DEFAULT '0',
  `TOPIC_ID` int(10) DEFAULT NULL,
  `SHOW_NAME` varchar(101) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FORUM_STAT_SITE_ID` (`SITE_ID`,`LAST_VISIT`),
  KEY `IX_B_FORUM_STAT_TOPIC_ID` (`TOPIC_ID`,`LAST_VISIT`),
  KEY `IX_B_FORUM_STAT_FORUM_ID` (`FORUM_ID`,`LAST_VISIT`),
  KEY `IX_B_FORUM_STAT_PHPSESSID` (`PHPSESSID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_forum_subscribe`
-- ----------------------------
DROP TABLE IF EXISTS `b_forum_subscribe`;
CREATE TABLE `b_forum_subscribe` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(10) NOT NULL,
  `FORUM_ID` int(10) NOT NULL,
  `TOPIC_ID` int(10) DEFAULT NULL,
  `START_DATE` datetime NOT NULL,
  `LAST_SEND` int(10) DEFAULT NULL,
  `NEW_TOPIC_ONLY` char(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'ru',
  `SOCNET_GROUP_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_FORUM_SUBSCRIBE_USER` (`USER_ID`,`FORUM_ID`,`TOPIC_ID`,`SOCNET_GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_forum_topic`
-- ----------------------------
DROP TABLE IF EXISTS `b_forum_topic`;
CREATE TABLE `b_forum_topic` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `FORUM_ID` int(10) NOT NULL,
  `TOPIC_ID` bigint(20) DEFAULT NULL,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TITLE_SEO` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TAGS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ICON` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STATE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `APPROVED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SORT` int(10) NOT NULL DEFAULT '150',
  `VIEWS` int(10) NOT NULL DEFAULT '0',
  `USER_START_ID` int(10) DEFAULT NULL,
  `USER_START_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `START_DATE` datetime NOT NULL,
  `POSTS` int(10) NOT NULL DEFAULT '0',
  `LAST_POSTER_ID` int(10) DEFAULT NULL,
  `LAST_POSTER_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_POST_DATE` datetime NOT NULL,
  `LAST_MESSAGE_ID` bigint(20) DEFAULT NULL,
  `POSTS_UNAPPROVED` int(11) DEFAULT '0',
  `ABS_LAST_POSTER_ID` int(10) DEFAULT NULL,
  `ABS_LAST_POSTER_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ABS_LAST_POST_DATE` datetime DEFAULT NULL,
  `ABS_LAST_MESSAGE_ID` bigint(20) DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HTML` text COLLATE utf8_unicode_ci,
  `SOCNET_GROUP_ID` int(10) DEFAULT NULL,
  `OWNER_ID` int(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FORUM_TOPIC_FORUM` (`FORUM_ID`,`APPROVED`),
  KEY `IX_FORUM_TOPIC_APPROVED` (`APPROVED`),
  KEY `IX_FORUM_TOPIC_ABS_L_POST_DATE` (`ABS_LAST_POST_DATE`),
  KEY `IX_FORUM_TOPIC_LAST_POST_DATE` (`LAST_POST_DATE`),
  KEY `IX_FORUM_TOPIC_USER_START_ID` (`USER_START_ID`),
  KEY `IX_FORUM_TOPIC_DATE_USER_START_ID` (`START_DATE`,`USER_START_ID`),
  KEY `IX_FORUM_TOPIC_XML_ID` (`XML_ID`),
  KEY `IX_FORUM_TOPIC_TITLE_SEO` (`FORUM_ID`,`TITLE_SEO`),
  KEY `IX_FORUM_TOPIC_TITLE_SEO2` (`TITLE_SEO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_forum_user`
-- ----------------------------
DROP TABLE IF EXISTS `b_forum_user`;
CREATE TABLE `b_forum_user` (
  `ID` bigint(10) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(10) NOT NULL,
  `ALIAS` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IP_ADDRESS` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AVATAR` int(10) DEFAULT NULL,
  `NUM_POSTS` int(10) DEFAULT '0',
  `INTERESTS` text COLLATE utf8_unicode_ci,
  `LAST_POST` int(10) DEFAULT NULL,
  `ALLOW_POST` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `LAST_VISIT` datetime NOT NULL,
  `DATE_REG` date NOT NULL,
  `REAL_IP_ADDRESS` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SIGNATURE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SHOW_NAME` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `RANK_ID` int(11) DEFAULT NULL,
  `POINTS` int(11) NOT NULL DEFAULT '0',
  `HIDE_FROM_ONLINE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SUBSC_GROUP_MESSAGE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SUBSC_GET_MY_MESSAGE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_FORUM_USER_USER6` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_forum_user_forum`
-- ----------------------------
DROP TABLE IF EXISTS `b_forum_user_forum`;
CREATE TABLE `b_forum_user_forum` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) DEFAULT NULL,
  `FORUM_ID` int(11) DEFAULT NULL,
  `LAST_VISIT` datetime DEFAULT NULL,
  `MAIN_LAST_VISIT` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FORUM_USER_FORUM_ID1` (`USER_ID`,`FORUM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_forum_user_points`
-- ----------------------------
DROP TABLE IF EXISTS `b_forum_user_points`;
CREATE TABLE `b_forum_user_points` (
  `FROM_USER_ID` int(11) NOT NULL,
  `TO_USER_ID` int(11) NOT NULL,
  `POINTS` int(11) NOT NULL DEFAULT '0',
  `DATE_UPDATE` datetime DEFAULT NULL,
  PRIMARY KEY (`FROM_USER_ID`,`TO_USER_ID`),
  KEY `IX_B_FORUM_USER_POINTS_TO_USER` (`TO_USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_forum_user_topic`
-- ----------------------------
DROP TABLE IF EXISTS `b_forum_user_topic`;
CREATE TABLE `b_forum_user_topic` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TOPIC_ID` int(11) NOT NULL DEFAULT '0',
  `USER_ID` int(11) NOT NULL DEFAULT '0',
  `FORUM_ID` int(11) DEFAULT NULL,
  `LAST_VISIT` datetime DEFAULT NULL,
  PRIMARY KEY (`TOPIC_ID`,`USER_ID`),
  KEY `ID` (`ID`),
  KEY `IX_B_FORUM_USER_FORUM_ID2` (`USER_ID`,`FORUM_ID`,`TOPIC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_group`
-- ----------------------------
DROP TABLE IF EXISTS `b_group`;
CREATE TABLE `b_group` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `C_SORT` int(18) NOT NULL DEFAULT '100',
  `ANONYMOUS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECURITY_POLICY` text COLLATE utf8_unicode_ci,
  `STRING_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `b_group`
-- ----------------------------
BEGIN;
INSERT INTO `b_group` VALUES ('1', '2017-05-05 16:49:53', 'Y', '1', 'N', 'Администраторы', 'Полный доступ к управлению сайтом.', null, null), ('2', '2017-05-05 16:49:53', 'Y', '2', 'Y', 'Все пользователи (в том числе неавторизованные)', 'Все пользователи, включая неавторизованных.', null, null), ('3', '2017-05-05 16:49:53', 'Y', '3', 'N', 'Пользователи, имеющие право голосовать за рейтинг', 'В эту группу пользователи добавляются автоматически.', null, 'RATING_VOTE'), ('4', '2017-05-05 16:49:53', 'Y', '4', 'N', 'Пользователи имеющие право голосовать за авторитет', 'В эту группу пользователи добавляются автоматически.', null, 'RATING_VOTE_AUTHORITY');
COMMIT;

-- ----------------------------
--  Table structure for `b_group_collection_task`
-- ----------------------------
DROP TABLE IF EXISTS `b_group_collection_task`;
CREATE TABLE `b_group_collection_task` (
  `GROUP_ID` int(11) NOT NULL,
  `TASK_ID` int(11) NOT NULL,
  `COLLECTION_ID` int(11) NOT NULL,
  PRIMARY KEY (`GROUP_ID`,`TASK_ID`,`COLLECTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_group_subordinate`
-- ----------------------------
DROP TABLE IF EXISTS `b_group_subordinate`;
CREATE TABLE `b_group_subordinate` (
  `ID` int(18) NOT NULL,
  `AR_SUBGROUP_ID` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_group_task`
-- ----------------------------
DROP TABLE IF EXISTS `b_group_task`;
CREATE TABLE `b_group_task` (
  `GROUP_ID` int(18) NOT NULL,
  `TASK_ID` int(18) NOT NULL,
  `EXTERNAL_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`GROUP_ID`,`TASK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_hlblock_entity`
-- ----------------------------
DROP TABLE IF EXISTS `b_hlblock_entity`;
CREATE TABLE `b_hlblock_entity` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `TABLE_NAME` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_hot_keys`
-- ----------------------------
DROP TABLE IF EXISTS `b_hot_keys`;
CREATE TABLE `b_hot_keys` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `KEYS_STRING` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `CODE_ID` int(18) NOT NULL,
  `USER_ID` int(18) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ix_b_hot_keys_co_u` (`CODE_ID`,`USER_ID`),
  KEY `ix_hot_keys_code` (`CODE_ID`),
  KEY `ix_hot_keys_user` (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `b_hot_keys`
-- ----------------------------
BEGIN;
INSERT INTO `b_hot_keys` VALUES ('1', 'Ctrl+Alt+85', '139', '0'), ('2', 'Ctrl+Alt+80', '17', '0'), ('3', 'Ctrl+Alt+70', '120', '0'), ('4', 'Ctrl+Alt+68', '117', '0'), ('5', 'Ctrl+Alt+81', '3', '0'), ('6', 'Ctrl+Alt+75', '106', '0'), ('7', 'Ctrl+Alt+79', '133', '0'), ('8', 'Ctrl+Alt+70', '121', '0'), ('9', 'Ctrl+Alt+69', '118', '0'), ('10', 'Ctrl+Shift+83', '87', '0'), ('11', 'Ctrl+Shift+88', '88', '0'), ('12', 'Ctrl+Shift+76', '89', '0');
COMMIT;

-- ----------------------------
--  Table structure for `b_hot_keys_code`
-- ----------------------------
DROP TABLE IF EXISTS `b_hot_keys_code`;
CREATE TABLE `b_hot_keys_code` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CLASS_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COMMENTS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TITLE_OBJ` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IS_CUSTOM` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`),
  KEY `ix_hot_keys_code_cn` (`CLASS_NAME`),
  KEY `ix_hot_keys_code_url` (`URL`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `b_hot_keys_code`
-- ----------------------------
BEGIN;
INSERT INTO `b_hot_keys_code` VALUES ('3', 'CAdminTabControl', 'NextTab();', 'HK_DB_CADMINTC', 'HK_DB_CADMINTC_C', 'tab-container', '', '0'), ('5', 'btn_new', 'var d=BX (\'btn_new\'); if (d) location.href = d.href;', 'HK_DB_BUT_ADD', 'HK_DB_BUT_ADD_C', 'btn_new', '', '0'), ('6', 'btn_excel', 'var d=BX(\'btn_excel\'); if (d) location.href = d.href;', 'HK_DB_BUT_EXL', 'HK_DB_BUT_EXL_C', 'btn_excel', '', '0'), ('7', 'btn_settings', 'var d=BX(\'btn_settings\'); if (d) location.href = d.href;', 'HK_DB_BUT_OPT', 'HK_DB_BUT_OPT_C', 'btn_settings', '', '0'), ('8', 'btn_list', 'var d=BX(\'btn_list\'); if (d) location.href = d.href;', 'HK_DB_BUT_LST', 'HK_DB_BUT_LST_C', 'btn_list', '', '0'), ('9', 'Edit_Save_Button', 'var d=BX .findChild(document, {attribute: {\'name\': \'save\'}}, true );  if (d) d.click();', 'HK_DB_BUT_SAVE', 'HK_DB_BUT_SAVE_C', 'Edit_Save_Button', '', '0'), ('10', 'btn_delete', 'var d=BX(\'btn_delete\'); if (d) location.href = d.href;', 'HK_DB_BUT_DEL', 'HK_DB_BUT_DEL_C', 'btn_delete', '', '0'), ('12', 'CAdminFilter', 'var d=BX .findChild(document, {attribute: {\'name\': \'find\'}}, true ); if (d) d.focus();', 'HK_DB_FLT_FND', 'HK_DB_FLT_FND_C', 'find', '', '0'), ('13', 'CAdminFilter', 'var d=BX .findChild(document, {attribute: {\'name\': \'set_filter\'}}, true );  if (d) d.click();', 'HK_DB_FLT_BUT_F', 'HK_DB_FLT_BUT_F_C', 'set_filter', '', '0'), ('14', 'CAdminFilter', 'var d=BX .findChild(document, {attribute: {\'name\': \'del_filter\'}}, true );  if (d) d.click();', 'HK_DB_FLT_BUT_CNL', 'HK_DB_FLT_BUT_CNL_C', 'del_filter', '', '0'), ('15', 'bx-panel-admin-button-help-icon-id', 'var d=BX(\'bx-panel-admin-button-help-icon-id\'); if (d) location.href = d.href;', 'HK_DB_BUT_HLP', 'HK_DB_BUT_HLP_C', 'bx-panel-admin-button-help-icon-id', '', '0'), ('17', 'Global', 'BXHotKeys.ShowSettings();', 'HK_DB_SHW_L', 'HK_DB_SHW_L_C', 'bx-panel-hotkeys', '', '0'), ('19', 'Edit_Apply_Button', 'var d=BX .findChild(document, {attribute: {\'name\': \'apply\'}}, true );  if (d) d.click();', 'HK_DB_BUT_APPL', 'HK_DB_BUT_APPL_C', 'Edit_Apply_Button', '', '0'), ('20', 'Edit_Cancel_Button', 'var d=BX .findChild(document, {attribute: {\'name\': \'cancel\'}}, true );  if (d) d.click();', 'HK_DB_BUT_CANCEL', 'HK_DB_BUT_CANCEL_C', 'Edit_Cancel_Button', '', '0'), ('54', 'top_panel_org_fav', '', '-=AUTONAME=-', null, 'top_panel_org_fav', null, '0'), ('55', 'top_panel_module_settings', '', '-=AUTONAME=-', null, 'top_panel_module_settings', '', '0'), ('56', 'top_panel_interface_settings', '', '-=AUTONAME=-', null, 'top_panel_interface_settings', '', '0'), ('57', 'top_panel_help', '', '-=AUTONAME=-', null, 'top_panel_help', '', '0'), ('58', 'top_panel_bizproc_tasks', '', '-=AUTONAME=-', null, 'top_panel_bizproc_tasks', '', '0'), ('59', 'top_panel_add_fav', '', '-=AUTONAME=-', null, 'top_panel_add_fav', null, '0'), ('60', 'top_panel_create_page', '', '-=AUTONAME=-', null, 'top_panel_create_page', '', '0'), ('62', 'top_panel_create_folder', '', '-=AUTONAME=-', null, 'top_panel_create_folder', '', '0'), ('63', 'top_panel_edit_page', '', '-=AUTONAME=-', null, 'top_panel_edit_page', '', '0'), ('64', 'top_panel_page_prop', '', '-=AUTONAME=-', null, 'top_panel_page_prop', '', '0'), ('65', 'top_panel_edit_page_html', '', '-=AUTONAME=-', null, 'top_panel_edit_page_html', '', '0'), ('67', 'top_panel_edit_page_php', '', '-=AUTONAME=-', null, 'top_panel_edit_page_php', '', '0'), ('68', 'top_panel_del_page', '', '-=AUTONAME=-', null, 'top_panel_del_page', '', '0'), ('69', 'top_panel_folder_prop', '', '-=AUTONAME=-', null, 'top_panel_folder_prop', '', '0'), ('70', 'top_panel_access_folder_new', '', '-=AUTONAME=-', null, 'top_panel_access_folder_new', '', '0'), ('71', 'main_top_panel_struct_panel', '', '-=AUTONAME=-', null, 'main_top_panel_struct_panel', '', '0'), ('72', 'top_panel_cache_page', '', '-=AUTONAME=-', null, 'top_panel_cache_page', '', '0'), ('73', 'top_panel_cache_comp', '', '-=AUTONAME=-', null, 'top_panel_cache_comp', '', '0'), ('74', 'top_panel_cache_not', '', '-=AUTONAME=-', null, 'top_panel_cache_not', '', '0'), ('75', 'top_panel_edit_mode', '', '-=AUTONAME=-', null, 'top_panel_edit_mode', '', '0'), ('76', 'top_panel_templ_site_css', '', '-=AUTONAME=-', null, 'top_panel_templ_site_css', '', '0'), ('77', 'top_panel_templ_templ_css', '', '-=AUTONAME=-', null, 'top_panel_templ_templ_css', '', '0'), ('78', 'top_panel_templ_site', '', '-=AUTONAME=-', null, 'top_panel_templ_site', '', '0'), ('81', 'top_panel_debug_time', '', '-=AUTONAME=-', null, 'top_panel_debug_time', '', '0'), ('82', 'top_panel_debug_incl', '', '-=AUTONAME=-', null, 'top_panel_debug_incl', '', '0'), ('83', 'top_panel_debug_sql', '', '-=AUTONAME=-', null, 'top_panel_debug_sql', null, '0'), ('84', 'top_panel_debug_compr', '', '-=AUTONAME=-', null, 'top_panel_debug_compr', '', '0'), ('85', 'MTP_SHORT_URI1', '', '-=AUTONAME=-', null, 'MTP_SHORT_URI1', '', '0'), ('86', 'MTP_SHORT_URI_LIST', '', '-=AUTONAME=-', null, 'MTP_SHORT_URI_LIST', '', '0'), ('87', 'FMST_PANEL_STICKER_ADD', '', '-=AUTONAME=-', null, 'FMST_PANEL_STICKER_ADD', '', '0'), ('88', 'FMST_PANEL_STICKERS_SHOW', '', '-=AUTONAME=-', null, 'FMST_PANEL_STICKERS_SHOW', '', '0'), ('89', 'FMST_PANEL_CUR_STICKER_LIST', '', '-=AUTONAME=-', null, 'FMST_PANEL_CUR_STICKER_LIST', '', '0'), ('90', 'FMST_PANEL_ALL_STICKER_LIST', '', '-=AUTONAME=-', null, 'FMST_PANEL_ALL_STICKER_LIST', '', '0'), ('91', 'top_panel_menu', 'var d=BX(\"bx-panel-menu\"); if (d) d.click();', '-=AUTONAME=-', null, 'bx-panel-menu', '', '0'), ('92', 'top_panel_admin', 'var d=BX(\'bx-panel-admin-tab\'); if (d) location.href = d.href;', '-=AUTONAME=-', null, 'bx-panel-admin-tab', '', '0'), ('93', 'admin_panel_site', 'var d=BX(\'bx-panel-view-tab\'); if (d) location.href = d.href;', '-=AUTONAME=-', null, 'bx-panel-view-tab', '', '0'), ('94', 'admin_panel_admin', 'var d=BX(\'bx-panel-admin-tab\'); if (d) location.href = d.href;', '-=AUTONAME=-', null, 'bx-panel-admin-tab', '', '0'), ('96', 'top_panel_folder_prop_new', '', '-=AUTONAME=-', null, 'top_panel_folder_prop_new', '', '0'), ('97', 'main_top_panel_structure', '', '-=AUTONAME=-', null, 'main_top_panel_structure', '', '0'), ('98', 'top_panel_clear_cache', '', '-=AUTONAME=-', null, 'top_panel_clear_cache', '', '0'), ('99', 'top_panel_templ', '', '-=AUTONAME=-', null, 'top_panel_templ', '', '0'), ('100', 'top_panel_debug', '', '-=AUTONAME=-', null, 'top_panel_debug', '', '0'), ('101', 'MTP_SHORT_URI', '', '-=AUTONAME=-', null, 'MTP_SHORT_URI', '', '0'), ('102', 'FMST_PANEL_STICKERS', '', '-=AUTONAME=-', null, 'FMST_PANEL_STICKERS', '', '0'), ('103', 'top_panel_settings', '', '-=AUTONAME=-', null, 'top_panel_settings', '', '0'), ('104', 'top_panel_fav', '', '-=AUTONAME=-', null, 'top_panel_fav', '', '0'), ('106', 'Global', 'location.href=\'/bitrix/admin/hot_keys_list.php?lang=ru\';', 'HK_DB_SHW_HK', '', '', '', '0'), ('107', 'top_panel_edit_new', '', '-=AUTONAME=-', null, 'top_panel_edit_new', '', '0'), ('108', 'FLOW_PANEL_CREATE_WITH_WF', '', '-=AUTONAME=-', null, 'FLOW_PANEL_CREATE_WITH_WF', '', '0'), ('109', 'FLOW_PANEL_EDIT_WITH_WF', '', '-=AUTONAME=-', null, 'FLOW_PANEL_EDIT_WITH_WF', '', '0'), ('110', 'FLOW_PANEL_HISTORY', '', '-=AUTONAME=-', null, 'FLOW_PANEL_HISTORY', '', '0'), ('111', 'top_panel_create_new', '', '-=AUTONAME=-', null, 'top_panel_create_new', '', '0'), ('112', 'top_panel_create_folder_new', '', '-=AUTONAME=-', null, 'top_panel_create_folder_new', '', '0'), ('116', 'bx-panel-toggle', '', '-=AUTONAME=-', null, 'bx-panel-toggle', '', '0'), ('117', 'bx-panel-small-toggle', '', '-=AUTONAME=-', null, 'bx-panel-small-toggle', '', '0'), ('118', 'bx-panel-expander', 'var d=BX(\'bx-panel-expander\'); if (d) BX.fireEvent(d, \'click\');', '-=AUTONAME=-', null, 'bx-panel-expander', '', '0'), ('119', 'bx-panel-hider', 'var d=BX(\'bx-panel-hider\'); if (d) d.click();', '-=AUTONAME=-', null, 'bx-panel-hider', '', '0'), ('120', 'search-textbox-input', 'var d=BX(\'search-textbox-input\'); if (d) { d.click(); d.focus();}', '-=AUTONAME=-', '', 'search', '', '0'), ('121', 'bx-search-input', 'var d=BX(\'bx-search-input\'); if (d) { d.click(); d.focus(); }', '-=AUTONAME=-', '', 'bx-search-input', '', '0'), ('133', 'bx-panel-logout', 'var d=BX(\'bx-panel-logout\'); if (d) location.href = d.href;', '-=AUTONAME=-', '', 'bx-panel-logout', '', '0'), ('135', 'CDialog', 'var d=BX(\'cancel\'); if (d) d.click();', 'HK_DB_D_CANCEL', '', 'cancel', '', '0'), ('136', 'CDialog', 'var d=BX(\'close\'); if (d) d.click();', 'HK_DB_D_CLOSE', '', 'close', '', '0'), ('137', 'CDialog', 'var d=BX(\'savebtn\'); if (d) d.click();', 'HK_DB_D_SAVE', '', 'savebtn', '', '0'), ('138', 'CDialog', 'var d=BX(\'btn_popup_save\'); if (d) d.click();', 'HK_DB_D_EDIT_SAVE', '', 'btn_popup_save', '', '0'), ('139', 'Global', 'location.href=\'/bitrix/admin/user_admin.php?lang=\'+phpVars.LANGUAGE_ID;', 'HK_DB_SHW_U', '', '', '', '0');
COMMIT;

-- ----------------------------
--  Table structure for `b_iblock`
-- ----------------------------
DROP TABLE IF EXISTS `b_iblock`;
CREATE TABLE `b_iblock` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `IBLOCK_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `LIST_PAGE_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DETAIL_PAGE_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECTION_PAGE_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CANONICAL_PAGE_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PICTURE` int(18) DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `DESCRIPTION_TYPE` char(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `RSS_TTL` int(11) NOT NULL DEFAULT '24',
  `RSS_ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `RSS_FILE_ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `RSS_FILE_LIMIT` int(11) DEFAULT NULL,
  `RSS_FILE_DAYS` int(11) DEFAULT NULL,
  `RSS_YANDEX_ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TMP_ID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INDEX_ELEMENT` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `INDEX_SECTION` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `WORKFLOW` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `BIZPROC` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SECTION_CHOOSER` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LIST_MODE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RIGHTS_MODE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECTION_PROPERTY` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PROPERTY_INDEX` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VERSION` int(11) NOT NULL DEFAULT '1',
  `LAST_CONV_ELEMENT` int(11) NOT NULL DEFAULT '0',
  `SOCNET_GROUP_ID` int(18) DEFAULT NULL,
  `EDIT_FILE_BEFORE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EDIT_FILE_AFTER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECTIONS_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECTION_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ELEMENTS_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ELEMENT_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_iblock` (`IBLOCK_TYPE_ID`,`LID`,`ACTIVE`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_iblock_cache`
-- ----------------------------
DROP TABLE IF EXISTS `b_iblock_cache`;
CREATE TABLE `b_iblock_cache` (
  `CACHE_KEY` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `CACHE` longtext COLLATE utf8_unicode_ci NOT NULL,
  `CACHE_DATE` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`CACHE_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_iblock_element`
-- ----------------------------
DROP TABLE IF EXISTS `b_iblock_element`;
CREATE TABLE `b_iblock_element` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `MODIFIED_BY` int(18) DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `CREATED_BY` int(18) DEFAULT NULL,
  `IBLOCK_ID` int(11) NOT NULL DEFAULT '0',
  `IBLOCK_SECTION_ID` int(11) DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ACTIVE_FROM` datetime DEFAULT NULL,
  `ACTIVE_TO` datetime DEFAULT NULL,
  `SORT` int(11) NOT NULL DEFAULT '500',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PREVIEW_PICTURE` int(18) DEFAULT NULL,
  `PREVIEW_TEXT` text COLLATE utf8_unicode_ci,
  `PREVIEW_TEXT_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `DETAIL_PICTURE` int(18) DEFAULT NULL,
  `DETAIL_TEXT` longtext COLLATE utf8_unicode_ci,
  `DETAIL_TEXT_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `SEARCHABLE_CONTENT` text COLLATE utf8_unicode_ci,
  `WF_STATUS_ID` int(18) DEFAULT '1',
  `WF_PARENT_ELEMENT_ID` int(11) DEFAULT NULL,
  `WF_NEW` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WF_LOCKED_BY` int(18) DEFAULT NULL,
  `WF_DATE_LOCK` datetime DEFAULT NULL,
  `WF_COMMENTS` text COLLATE utf8_unicode_ci,
  `IN_SECTIONS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TAGS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TMP_ID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WF_LAST_HISTORY_ID` int(11) DEFAULT NULL,
  `SHOW_COUNTER` int(18) DEFAULT NULL,
  `SHOW_COUNTER_START` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_iblock_element_1` (`IBLOCK_ID`,`IBLOCK_SECTION_ID`),
  KEY `ix_iblock_element_4` (`IBLOCK_ID`,`XML_ID`,`WF_PARENT_ELEMENT_ID`),
  KEY `ix_iblock_element_3` (`WF_PARENT_ELEMENT_ID`),
  KEY `ix_iblock_element_code` (`IBLOCK_ID`,`CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_iblock_element_iprop`
-- ----------------------------
DROP TABLE IF EXISTS `b_iblock_element_iprop`;
CREATE TABLE `b_iblock_element_iprop` (
  `IBLOCK_ID` int(11) NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  `ELEMENT_ID` int(11) NOT NULL,
  `IPROP_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ELEMENT_ID`,`IPROP_ID`),
  KEY `ix_b_iblock_element_iprop_0` (`IPROP_ID`),
  KEY `ix_b_iblock_element_iprop_1` (`IBLOCK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_iblock_element_lock`
-- ----------------------------
DROP TABLE IF EXISTS `b_iblock_element_lock`;
CREATE TABLE `b_iblock_element_lock` (
  `IBLOCK_ELEMENT_ID` int(11) NOT NULL,
  `DATE_LOCK` datetime DEFAULT NULL,
  `LOCKED_BY` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`IBLOCK_ELEMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_iblock_element_property`
-- ----------------------------
DROP TABLE IF EXISTS `b_iblock_element_property`;
CREATE TABLE `b_iblock_element_property` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IBLOCK_PROPERTY_ID` int(11) NOT NULL,
  `IBLOCK_ELEMENT_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci NOT NULL,
  `VALUE_TYPE` char(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `VALUE_ENUM` int(11) DEFAULT NULL,
  `VALUE_NUM` decimal(18,4) DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_iblock_element_property_1` (`IBLOCK_ELEMENT_ID`,`IBLOCK_PROPERTY_ID`),
  KEY `ix_iblock_element_property_2` (`IBLOCK_PROPERTY_ID`),
  KEY `ix_iblock_element_prop_enum` (`VALUE_ENUM`,`IBLOCK_PROPERTY_ID`),
  KEY `ix_iblock_element_prop_num` (`VALUE_NUM`,`IBLOCK_PROPERTY_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_iblock_element_right`
-- ----------------------------
DROP TABLE IF EXISTS `b_iblock_element_right`;
CREATE TABLE `b_iblock_element_right` (
  `IBLOCK_ID` int(11) NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  `ELEMENT_ID` int(11) NOT NULL,
  `RIGHT_ID` int(11) NOT NULL,
  `IS_INHERITED` char(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`RIGHT_ID`,`ELEMENT_ID`,`SECTION_ID`),
  KEY `ix_b_iblock_element_right_1` (`ELEMENT_ID`,`IBLOCK_ID`),
  KEY `ix_b_iblock_element_right_2` (`IBLOCK_ID`,`RIGHT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_iblock_fields`
-- ----------------------------
DROP TABLE IF EXISTS `b_iblock_fields`;
CREATE TABLE `b_iblock_fields` (
  `IBLOCK_ID` int(18) NOT NULL,
  `FIELD_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `IS_REQUIRED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DEFAULT_VALUE` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`IBLOCK_ID`,`FIELD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_iblock_group`
-- ----------------------------
DROP TABLE IF EXISTS `b_iblock_group`;
CREATE TABLE `b_iblock_group` (
  `IBLOCK_ID` int(11) NOT NULL,
  `GROUP_ID` int(11) NOT NULL,
  `PERMISSION` char(1) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `ux_iblock_group_1` (`IBLOCK_ID`,`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_iblock_iblock_iprop`
-- ----------------------------
DROP TABLE IF EXISTS `b_iblock_iblock_iprop`;
CREATE TABLE `b_iblock_iblock_iprop` (
  `IBLOCK_ID` int(11) NOT NULL,
  `IPROP_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`IPROP_ID`),
  KEY `ix_b_iblock_iblock_iprop_0` (`IPROP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_iblock_iproperty`
-- ----------------------------
DROP TABLE IF EXISTS `b_iblock_iproperty`;
CREATE TABLE `b_iblock_iproperty` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IBLOCK_ID` int(11) NOT NULL,
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `TEMPLATE` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_iblock_iprop_0` (`IBLOCK_ID`,`ENTITY_TYPE`,`ENTITY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_iblock_messages`
-- ----------------------------
DROP TABLE IF EXISTS `b_iblock_messages`;
CREATE TABLE `b_iblock_messages` (
  `IBLOCK_ID` int(18) NOT NULL,
  `MESSAGE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE_TEXT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`MESSAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_iblock_offers_tmp`
-- ----------------------------
DROP TABLE IF EXISTS `b_iblock_offers_tmp`;
CREATE TABLE `b_iblock_offers_tmp` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `PRODUCT_IBLOCK_ID` int(11) unsigned NOT NULL,
  `OFFERS_IBLOCK_ID` int(11) unsigned NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_iblock_property`
-- ----------------------------
DROP TABLE IF EXISTS `b_iblock_property`;
CREATE TABLE `b_iblock_property` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `IBLOCK_ID` int(11) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `CODE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DEFAULT_VALUE` text COLLATE utf8_unicode_ci,
  `PROPERTY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'S',
  `ROW_COUNT` int(11) NOT NULL DEFAULT '1',
  `COL_COUNT` int(11) NOT NULL DEFAULT '30',
  `LIST_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'L',
  `MULTIPLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `XML_ID` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILE_TYPE` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MULTIPLE_CNT` int(11) DEFAULT NULL,
  `TMP_ID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LINK_IBLOCK_ID` int(18) DEFAULT NULL,
  `WITH_DESCRIPTION` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SEARCHABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `FILTRABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IS_REQUIRED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VERSION` int(11) NOT NULL DEFAULT '1',
  `USER_TYPE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_TYPE_SETTINGS` text COLLATE utf8_unicode_ci,
  `HINT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_iblock_property_1` (`IBLOCK_ID`),
  KEY `ix_iblock_property_3` (`LINK_IBLOCK_ID`),
  KEY `ix_iblock_property_2` (`CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_iblock_property_enum`
-- ----------------------------
DROP TABLE IF EXISTS `b_iblock_property_enum`;
CREATE TABLE `b_iblock_property_enum` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PROPERTY_ID` int(11) NOT NULL,
  `VALUE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DEF` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `XML_ID` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `TMP_ID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_iblock_property_enum` (`PROPERTY_ID`,`XML_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_iblock_right`
-- ----------------------------
DROP TABLE IF EXISTS `b_iblock_right`;
CREATE TABLE `b_iblock_right` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IBLOCK_ID` int(11) NOT NULL,
  `GROUP_CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_TYPE` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `DO_INHERIT` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `TASK_ID` int(11) NOT NULL,
  `OP_SREAD` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `OP_EREAD` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `XML_ID` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_iblock_right_iblock_id` (`IBLOCK_ID`,`ENTITY_TYPE`,`ENTITY_ID`),
  KEY `ix_b_iblock_right_group_code` (`GROUP_CODE`,`IBLOCK_ID`),
  KEY `ix_b_iblock_right_entity` (`ENTITY_ID`,`ENTITY_TYPE`),
  KEY `ix_b_iblock_right_op_eread` (`ID`,`OP_EREAD`,`GROUP_CODE`),
  KEY `ix_b_iblock_right_op_sread` (`ID`,`OP_SREAD`,`GROUP_CODE`),
  KEY `ix_b_iblock_right_task_id` (`TASK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_iblock_rss`
-- ----------------------------
DROP TABLE IF EXISTS `b_iblock_rss`;
CREATE TABLE `b_iblock_rss` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IBLOCK_ID` int(11) NOT NULL,
  `NODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NODE_VALUE` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_iblock_section`
-- ----------------------------
DROP TABLE IF EXISTS `b_iblock_section`;
CREATE TABLE `b_iblock_section` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `MODIFIED_BY` int(18) DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `CREATED_BY` int(18) DEFAULT NULL,
  `IBLOCK_ID` int(11) NOT NULL,
  `IBLOCK_SECTION_ID` int(11) DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `GLOBAL_ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PICTURE` int(18) DEFAULT NULL,
  `LEFT_MARGIN` int(18) DEFAULT NULL,
  `RIGHT_MARGIN` int(18) DEFAULT NULL,
  `DEPTH_LEVEL` int(18) DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `DESCRIPTION_TYPE` char(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `SEARCHABLE_CONTENT` text COLLATE utf8_unicode_ci,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TMP_ID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DETAIL_PICTURE` int(18) DEFAULT NULL,
  `SOCNET_GROUP_ID` int(18) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_iblock_section_1` (`IBLOCK_ID`,`IBLOCK_SECTION_ID`),
  KEY `ix_iblock_section_depth_level` (`IBLOCK_ID`,`DEPTH_LEVEL`),
  KEY `ix_iblock_section_left_margin` (`IBLOCK_ID`,`LEFT_MARGIN`,`RIGHT_MARGIN`),
  KEY `ix_iblock_section_right_margin` (`IBLOCK_ID`,`RIGHT_MARGIN`,`LEFT_MARGIN`),
  KEY `ix_iblock_section_code` (`IBLOCK_ID`,`CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_iblock_section_element`
-- ----------------------------
DROP TABLE IF EXISTS `b_iblock_section_element`;
CREATE TABLE `b_iblock_section_element` (
  `IBLOCK_SECTION_ID` int(11) NOT NULL,
  `IBLOCK_ELEMENT_ID` int(11) NOT NULL,
  `ADDITIONAL_PROPERTY_ID` int(18) DEFAULT NULL,
  UNIQUE KEY `ux_iblock_section_element` (`IBLOCK_SECTION_ID`,`IBLOCK_ELEMENT_ID`,`ADDITIONAL_PROPERTY_ID`),
  KEY `UX_IBLOCK_SECTION_ELEMENT2` (`IBLOCK_ELEMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_iblock_section_iprop`
-- ----------------------------
DROP TABLE IF EXISTS `b_iblock_section_iprop`;
CREATE TABLE `b_iblock_section_iprop` (
  `IBLOCK_ID` int(11) NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  `IPROP_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`SECTION_ID`,`IPROP_ID`),
  KEY `ix_b_iblock_section_iprop_0` (`IPROP_ID`),
  KEY `ix_b_iblock_section_iprop_1` (`IBLOCK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_iblock_section_property`
-- ----------------------------
DROP TABLE IF EXISTS `b_iblock_section_property`;
CREATE TABLE `b_iblock_section_property` (
  `IBLOCK_ID` int(11) NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  `PROPERTY_ID` int(11) NOT NULL,
  `SMART_FILTER` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DISPLAY_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DISPLAY_EXPANDED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILTER_HINT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`SECTION_ID`,`PROPERTY_ID`),
  KEY `ix_b_iblock_section_property_1` (`PROPERTY_ID`),
  KEY `ix_b_iblock_section_property_2` (`SECTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_iblock_section_right`
-- ----------------------------
DROP TABLE IF EXISTS `b_iblock_section_right`;
CREATE TABLE `b_iblock_section_right` (
  `IBLOCK_ID` int(11) NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  `RIGHT_ID` int(11) NOT NULL,
  `IS_INHERITED` char(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`RIGHT_ID`,`SECTION_ID`),
  KEY `ix_b_iblock_section_right_1` (`SECTION_ID`,`IBLOCK_ID`),
  KEY `ix_b_iblock_section_right_2` (`IBLOCK_ID`,`RIGHT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_iblock_sequence`
-- ----------------------------
DROP TABLE IF EXISTS `b_iblock_sequence`;
CREATE TABLE `b_iblock_sequence` (
  `IBLOCK_ID` int(18) NOT NULL,
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SEQ_VALUE` int(11) DEFAULT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_iblock_site`
-- ----------------------------
DROP TABLE IF EXISTS `b_iblock_site`;
CREATE TABLE `b_iblock_site` (
  `IBLOCK_ID` int(18) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_iblock_type`
-- ----------------------------
DROP TABLE IF EXISTS `b_iblock_type`;
CREATE TABLE `b_iblock_type` (
  `ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SECTIONS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `EDIT_FILE_BEFORE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EDIT_FILE_AFTER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IN_RSS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SORT` int(18) NOT NULL DEFAULT '500',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_iblock_type_lang`
-- ----------------------------
DROP TABLE IF EXISTS `b_iblock_type_lang`;
CREATE TABLE `b_iblock_type_lang` (
  `IBLOCK_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `SECTION_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ELEMENT_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_lang`
-- ----------------------------
DROP TABLE IF EXISTS `b_lang`;
CREATE TABLE `b_lang` (
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int(18) NOT NULL DEFAULT '100',
  `DEF` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `DIR` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `FORMAT_DATE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_DATETIME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WEEK_START` int(11) DEFAULT NULL,
  `CHARSET` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `DOC_ROOT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DOMAIN_LIMITED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SERVER_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SITE_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CULTURE_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`LID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `b_lang`
-- ----------------------------
BEGIN;
INSERT INTO `b_lang` VALUES ('s1', '1', 'Y', 'Y', 'Персональный сайт (Сайт по умолчанию)', '/', null, null, null, null, null, 'ru', null, 'N', null, 'Персональный сайт', null, '1');
COMMIT;

-- ----------------------------
--  Table structure for `b_lang_domain`
-- ----------------------------
DROP TABLE IF EXISTS `b_lang_domain`;
CREATE TABLE `b_lang_domain` (
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `DOMAIN` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`LID`,`DOMAIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_language`
-- ----------------------------
DROP TABLE IF EXISTS `b_language`;
CREATE TABLE `b_language` (
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int(11) NOT NULL DEFAULT '100',
  `DEF` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `FORMAT_DATE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_DATETIME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WEEK_START` int(11) DEFAULT NULL,
  `CHARSET` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DIRECTION` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CULTURE_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`LID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `b_language`
-- ----------------------------
BEGIN;
INSERT INTO `b_language` VALUES ('en', '2', 'N', 'Y', 'English', null, null, null, null, null, null, '2'), ('ru', '1', 'Y', 'Y', 'Russian', null, null, null, null, null, null, '1');
COMMIT;

-- ----------------------------
--  Table structure for `b_list_rubric`
-- ----------------------------
DROP TABLE IF EXISTS `b_list_rubric`;
CREATE TABLE `b_list_rubric` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `SORT` int(11) NOT NULL DEFAULT '100',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `AUTO` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DAYS_OF_MONTH` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DAYS_OF_WEEK` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TIMES_OF_DAY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TEMPLATE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_EXECUTED` datetime DEFAULT NULL,
  `VISIBLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `FROM_FIELD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_medialib_collection`
-- ----------------------------
DROP TABLE IF EXISTS `b_medialib_collection`;
CREATE TABLE `b_medialib_collection` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `DATE_UPDATE` datetime NOT NULL,
  `OWNER_ID` int(11) DEFAULT NULL,
  `PARENT_ID` int(11) DEFAULT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `KEYWORDS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ITEMS_COUNT` int(11) DEFAULT NULL,
  `ML_TYPE` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_medialib_collection_item`
-- ----------------------------
DROP TABLE IF EXISTS `b_medialib_collection_item`;
CREATE TABLE `b_medialib_collection_item` (
  `COLLECTION_ID` int(11) NOT NULL,
  `ITEM_ID` int(11) NOT NULL,
  PRIMARY KEY (`ITEM_ID`,`COLLECTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_medialib_item`
-- ----------------------------
DROP TABLE IF EXISTS `b_medialib_item`;
CREATE TABLE `b_medialib_item` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ITEM_TYPE` char(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `DATE_CREATE` datetime NOT NULL,
  `DATE_UPDATE` datetime NOT NULL,
  `SOURCE_ID` int(11) NOT NULL,
  `KEYWORDS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SEARCHABLE_CONTENT` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_medialib_type`
-- ----------------------------
DROP TABLE IF EXISTS `b_medialib_type`;
CREATE TABLE `b_medialib_type` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `EXT` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SYSTEM` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `b_medialib_type`
-- ----------------------------
BEGIN;
INSERT INTO `b_medialib_type` VALUES ('1', 'image_name', 'image', 'jpg,jpeg,gif,png', 'Y', 'image_desc'), ('2', 'video_name', 'video', 'flv,mp4,wmv', 'Y', 'video_desc'), ('3', 'sound_name', 'sound', 'mp3,wma,aac', 'Y', 'sound_desc');
COMMIT;

-- ----------------------------
--  Table structure for `b_mobileapp_app`
-- ----------------------------
DROP TABLE IF EXISTS `b_mobileapp_app`;
CREATE TABLE `b_mobileapp_app` (
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SHORT_NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci NOT NULL,
  `FILES` text COLLATE utf8_unicode_ci NOT NULL,
  `LAUNCH_ICONS` text COLLATE utf8_unicode_ci NOT NULL,
  `LAUNCH_SCREENS` text COLLATE utf8_unicode_ci NOT NULL,
  `FOLDER` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_CREATE` datetime NOT NULL,
  PRIMARY KEY (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_mobileapp_config`
-- ----------------------------
DROP TABLE IF EXISTS `b_mobileapp_config`;
CREATE TABLE `b_mobileapp_config` (
  `APP_CODE` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `PLATFORM` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `PARAMS` text COLLATE utf8_unicode_ci NOT NULL,
  `DATE_CREATE` datetime NOT NULL,
  PRIMARY KEY (`APP_CODE`,`PLATFORM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_module`
-- ----------------------------
DROP TABLE IF EXISTS `b_module`;
CREATE TABLE `b_module` (
  `ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_ACTIVE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `b_module`
-- ----------------------------
BEGIN;
INSERT INTO `b_module` VALUES ('bitrix.sitecorporate', '2017-05-05 16:50:00'), ('bitrix.siteinfoportal', '2017-05-05 16:50:01'), ('bitrix.sitepersonal', '2017-05-05 16:50:03'), ('bitrixcloud', '2017-05-05 16:50:04'), ('blog', '2017-05-05 16:50:06'), ('clouds', '2017-05-05 16:50:10'), ('compression', '2017-05-05 16:50:12'), ('fileman', '2017-05-05 16:50:13'), ('form', '2017-05-05 16:50:17'), ('forum', '2017-05-05 16:50:19'), ('highloadblock', '2017-05-05 16:50:23'), ('iblock', '2017-05-05 16:50:26'), ('main', '2017-05-05 16:49:54'), ('mobileapp', '2017-05-05 16:50:30'), ('perfmon', '2017-05-05 16:50:32'), ('photogallery', '2017-05-05 16:50:33'), ('scale', '2017-05-05 16:50:36'), ('search', '2017-05-05 16:50:37'), ('security', '2017-05-05 16:50:40'), ('seo', '2017-05-05 16:50:42'), ('socialservices', '2017-05-05 16:50:44'), ('subscribe', '2017-05-05 16:50:46'), ('translate', '2017-05-05 16:50:48'), ('vote', '2017-05-05 16:50:50');
COMMIT;

-- ----------------------------
--  Table structure for `b_module_group`
-- ----------------------------
DROP TABLE IF EXISTS `b_module_group`;
CREATE TABLE `b_module_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `GROUP_ID` int(11) NOT NULL,
  `G_ACCESS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_GROUP_MODULE` (`MODULE_ID`,`GROUP_ID`,`SITE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `b_module_group`
-- ----------------------------
BEGIN;
INSERT INTO `b_module_group` VALUES ('1', 'blog', '1', 'W', null);
COMMIT;

-- ----------------------------
--  Table structure for `b_module_to_module`
-- ----------------------------
DROP TABLE IF EXISTS `b_module_to_module`;
CREATE TABLE `b_module_to_module` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `SORT` int(18) NOT NULL DEFAULT '100',
  `FROM_MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TO_MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `TO_PATH` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TO_CLASS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TO_METHOD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TO_METHOD_ARG` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VERSION` int(18) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_module_to_module` (`FROM_MODULE_ID`(20),`MESSAGE_ID`(20),`TO_MODULE_ID`(20),`TO_CLASS`(20),`TO_METHOD`(20))
) ENGINE=InnoDB AUTO_INCREMENT=234 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `b_module_to_module`
-- ----------------------------
BEGIN;
INSERT INTO `b_module_to_module` VALUES ('1', '2017-05-05 16:49:54', '100', 'iblock', 'OnIBlockPropertyBuildList', 'main', '/modules/main/tools/prop_userid.php', 'CIBlockPropertyUserID', 'GetUserTypeDescription', '', '1'), ('2', '2017-05-05 16:49:54', '100', 'main', 'OnUserDelete', 'main', '/modules/main/classes/mysql/favorites.php', 'CFavorites', 'OnUserDelete', '', '1'), ('3', '2017-05-05 16:49:54', '100', 'main', 'OnLanguageDelete', 'main', '/modules/main/classes/mysql/favorites.php', 'CFavorites', 'OnLanguageDelete', '', '1'), ('4', '2017-05-05 16:49:54', '100', 'main', 'OnUserDelete', 'main', '', 'CUserOptions', 'OnUserDelete', '', '1'), ('5', '2017-05-05 16:49:54', '100', 'main', 'OnChangeFile', 'main', '', 'CMain', 'OnChangeFileComponent', '', '1'), ('6', '2017-05-05 16:49:54', '100', 'main', 'OnUserTypeRightsCheck', 'main', '', 'CUser', 'UserTypeRightsCheck', '', '1'), ('7', '2017-05-05 16:49:54', '100', 'main', 'OnUserLogin', 'main', '', 'UpdateTools', 'CheckUpdates', '', '1'), ('8', '2017-05-05 16:49:54', '100', 'main', 'OnModuleUpdate', 'main', '', 'UpdateTools', 'SetUpdateResult', '', '1'), ('9', '2017-05-05 16:49:54', '100', 'main', 'OnUpdateCheck', 'main', '', 'UpdateTools', 'SetUpdateError', '', '1'), ('10', '2017-05-05 16:49:54', '100', 'main', 'OnPanelCreate', 'main', '', 'CUndo', 'CheckNotifyMessage', '', '1'), ('11', '2017-05-05 16:49:54', '100', 'main', 'OnAfterAddRating', 'main', '', 'CRatingsComponentsMain', 'OnAfterAddRating', '', '1'), ('12', '2017-05-05 16:49:54', '100', 'main', 'OnAfterUpdateRating', 'main', '', 'CRatingsComponentsMain', 'OnAfterUpdateRating', '', '1'), ('13', '2017-05-05 16:49:54', '100', 'main', 'OnSetRatingsConfigs', 'main', '', 'CRatingsComponentsMain', 'OnSetRatingConfigs', '', '1'), ('14', '2017-05-05 16:49:54', '100', 'main', 'OnGetRatingsConfigs', 'main', '', 'CRatingsComponentsMain', 'OnGetRatingConfigs', '', '1'), ('15', '2017-05-05 16:49:54', '100', 'main', 'OnGetRatingsObjects', 'main', '', 'CRatingsComponentsMain', 'OnGetRatingObject', '', '1'), ('16', '2017-05-05 16:49:54', '100', 'main', 'OnGetRatingContentOwner', 'main', '', 'CRatingsComponentsMain', 'OnGetRatingContentOwner', '', '1'), ('17', '2017-05-05 16:49:54', '100', 'main', 'OnAfterAddRatingRule', 'main', '', 'CRatingRulesMain', 'OnAfterAddRatingRule', '', '1'), ('18', '2017-05-05 16:49:54', '100', 'main', 'OnAfterUpdateRatingRule', 'main', '', 'CRatingRulesMain', 'OnAfterUpdateRatingRule', '', '1'), ('19', '2017-05-05 16:49:54', '100', 'main', 'OnGetRatingRuleObjects', 'main', '', 'CRatingRulesMain', 'OnGetRatingRuleObjects', '', '1'), ('20', '2017-05-05 16:49:54', '100', 'main', 'OnGetRatingRuleConfigs', 'main', '', 'CRatingRulesMain', 'OnGetRatingRuleConfigs', '', '1'), ('21', '2017-05-05 16:49:54', '100', 'main', 'OnAfterUserAdd', 'main', '', 'CRatings', 'OnAfterUserRegister', '', '1'), ('22', '2017-05-05 16:49:54', '100', 'main', 'OnUserDelete', 'main', '', 'CRatings', 'OnUserDelete', '', '1'), ('23', '2017-05-05 16:49:54', '100', 'main', 'OnUserDelete', 'main', '', 'CAccess', 'OnUserDelete', '', '1'), ('24', '2017-05-05 16:49:54', '100', 'main', 'OnAfterGroupAdd', 'main', '', 'CGroupAuthProvider', 'OnAfterGroupAdd', '', '1'), ('25', '2017-05-05 16:49:54', '100', 'main', 'OnBeforeGroupUpdate', 'main', '', 'CGroupAuthProvider', 'OnBeforeGroupUpdate', '', '1'), ('26', '2017-05-05 16:49:54', '100', 'main', 'OnBeforeGroupDelete', 'main', '', 'CGroupAuthProvider', 'OnBeforeGroupDelete', '', '1'), ('27', '2017-05-05 16:49:54', '100', 'main', 'OnAfterSetUserGroup', 'main', '', 'CGroupAuthProvider', 'OnAfterSetUserGroup', '', '1'), ('28', '2017-05-05 16:49:54', '100', 'main', 'OnUserLogin', 'main', '', 'CGroupAuthProvider', 'OnUserLogin', '', '1'), ('29', '2017-05-05 16:49:54', '100', 'main', 'OnEventLogGetAuditTypes', 'main', '', 'CEventMain', 'GetAuditTypes', '', '1'), ('30', '2017-05-05 16:49:54', '100', 'main', 'OnEventLogGetAuditHandlers', 'main', '', 'CEventMain', 'MakeMainObject', '', '1'), ('31', '2017-05-05 16:49:54', '100', 'perfmon', 'OnGetTableSchema', 'main', '', 'CTableSchema', 'OnGetTableSchema', '', '1'), ('32', '2017-05-05 16:49:54', '100', 'sender', 'OnConnectorList', 'main', '', '\\Bitrix\\Main\\SenderEventHandler', 'onConnectorListUser', '', '1'), ('33', '2017-05-05 16:49:54', '110', 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeString', 'GetUserTypeDescription', '', '1'), ('34', '2017-05-05 16:49:54', '120', 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeInteger', 'GetUserTypeDescription', '', '1'), ('35', '2017-05-05 16:49:54', '130', 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeDouble', 'GetUserTypeDescription', '', '1'), ('36', '2017-05-05 16:49:54', '140', 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeDateTime', 'GetUserTypeDescription', '', '1'), ('37', '2017-05-05 16:49:54', '145', 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeDate', 'GetUserTypeDescription', '', '1'), ('38', '2017-05-05 16:49:54', '150', 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeBoolean', 'GetUserTypeDescription', '', '1'), ('39', '2017-05-05 16:49:54', '160', 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeFile', 'GetUserTypeDescription', '', '1'), ('40', '2017-05-05 16:49:54', '170', 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeEnum', 'GetUserTypeDescription', '', '1'), ('41', '2017-05-05 16:49:54', '180', 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeIBlockSection', 'GetUserTypeDescription', '', '1'), ('42', '2017-05-05 16:49:54', '190', 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeIBlockElement', 'GetUserTypeDescription', '', '1'), ('43', '2017-05-05 16:49:54', '200', 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeStringFormatted', 'GetUserTypeDescription', '', '1'), ('44', '2017-05-05 16:49:54', '210', 'main', 'OnUserTypeBuildList', 'main', '', '\\Bitrix\\Main\\UrlPreview\\UrlPreviewUserType', 'getUserTypeDescription', '', '1'), ('45', '2017-05-05 16:49:54', '100', 'main', 'OnBeforeEndBufferContent', 'main', '', '\\Bitrix\\Main\\Analytics\\Counter', 'onBeforeEndBufferContent', '', '1'), ('46', '2017-05-05 16:49:54', '100', 'main', 'OnBeforeRestartBuffer', 'main', '', '\\Bitrix\\Main\\Analytics\\Counter', 'onBeforeRestartBuffer', '', '1'), ('47', '2017-05-05 16:49:54', '100', 'disk', 'onAfterAjaxActionCreateFolderWithSharing', 'main', '', '\\Bitrix\\Main\\FinderDestTable', 'onAfterDiskAjaxAction', '', '1'), ('48', '2017-05-05 16:49:54', '100', 'disk', 'onAfterAjaxActionAppendSharing', 'main', '', '\\Bitrix\\Main\\FinderDestTable', 'onAfterDiskAjaxAction', '', '1'), ('49', '2017-05-05 16:49:54', '100', 'disk', 'onAfterAjaxActionChangeSharingAndRights', 'main', '', '\\Bitrix\\Main\\FinderDestTable', 'onAfterDiskAjaxAction', '', '1'), ('50', '2017-05-05 16:49:54', '100', 'socialnetwork', 'OnSocNetLogDelete', 'main', '', 'CUserCounter', 'OnSocNetLogDelete', '', '1'), ('51', '2017-05-05 16:49:54', '100', 'socialnetwork', 'OnSocNetLogCommentDelete', 'main', '', 'CUserCounter', 'OnSocNetLogCommentDelete', '', '1'), ('52', '2017-05-05 16:49:54', '100', 'sale', 'OnSaleBasketItemSaved', 'main', '', '\\Bitrix\\Main\\Analytics\\Catalog', 'catchCatalogBasket', '', '2'), ('53', '2017-05-05 16:49:54', '100', 'sale', 'OnSaleOrderSaved', 'main', '', '\\Bitrix\\Main\\Analytics\\Catalog', 'catchCatalogOrder', '', '2'), ('54', '2017-05-05 16:49:54', '100', 'sale', 'OnSaleOrderPaid', 'main', '', '\\Bitrix\\Main\\Analytics\\Catalog', 'catchCatalogOrderPayment', '', '2'), ('55', '2017-05-05 16:50:00', '100', 'main', 'OnBeforeProlog', 'bitrix.sitecorporate', '', 'CSiteCorporate', 'ShowPanel', '', '1'), ('56', '2017-05-05 16:50:01', '100', 'main', 'OnBeforeProlog', 'bitrix.siteinfoportal', '', 'CSiteInfoportal', 'ShowPanel', '', '1'), ('57', '2017-05-05 16:50:03', '100', 'main', 'OnBeforeProlog', 'bitrix.sitepersonal', '', 'CSitePersonal', 'ShowPanel', '', '1'), ('58', '2017-05-05 16:50:04', '100', 'main', 'OnAdminInformerInsertItems', 'bitrixcloud', '', 'CBitrixCloudCDN', 'OnAdminInformerInsertItems', '', '1'), ('59', '2017-05-05 16:50:04', '100', 'main', 'OnAdminInformerInsertItems', 'bitrixcloud', '', 'CBitrixCloudBackup', 'OnAdminInformerInsertItems', '', '1'), ('60', '2017-05-05 16:50:04', '100', 'mobileapp', 'OnBeforeAdminMobileMenuBuild', 'bitrixcloud', '', 'CBitrixCloudMobile', 'OnBeforeAdminMobileMenuBuild', '', '1'), ('61', '2017-05-05 16:50:06', '100', 'search', 'OnReindex', 'blog', '', 'CBlogSearch', 'OnSearchReindex', '', '1'), ('62', '2017-05-05 16:50:06', '100', 'main', 'OnUserDelete', 'blog', '', 'CBlogUser', 'Delete', '', '1'), ('63', '2017-05-05 16:50:06', '100', 'main', 'OnSiteDelete', 'blog', '', 'CBlogSitePath', 'DeleteBySiteID', '', '1'), ('64', '2017-05-05 16:50:06', '100', 'socialnetwork', 'OnSocNetGroupDelete', 'blog', '', 'CBlogSoNetPost', 'OnGroupDelete', '', '1'), ('65', '2017-05-05 16:50:06', '100', 'socialnetwork', 'OnSocNetFeaturesAdd', 'blog', '', 'CBlogSearch', 'SetSoNetFeatureIndexSearch', '', '1'), ('66', '2017-05-05 16:50:06', '100', 'socialnetwork', 'OnSocNetFeaturesUpdate', 'blog', '', 'CBlogSearch', 'SetSoNetFeatureIndexSearch', '', '1'), ('67', '2017-05-05 16:50:06', '100', 'socialnetwork', 'OnSocNetFeaturesPermsAdd', 'blog', '', 'CBlogSearch', 'SetSoNetFeaturePermIndexSearch', '', '1'), ('68', '2017-05-05 16:50:06', '100', 'socialnetwork', 'OnSocNetFeaturesPermsUpdate', 'blog', '', 'CBlogSearch', 'SetSoNetFeaturePermIndexSearch', '', '1'), ('69', '2017-05-05 16:50:06', '200', 'main', 'OnAfterAddRating', 'blog', '', 'CRatingsComponentsBlog', 'OnAfterAddRating', '', '1'), ('70', '2017-05-05 16:50:06', '200', 'main', 'OnAfterUpdateRating', 'blog', '', 'CRatingsComponentsBlog', 'OnAfterUpdateRating', '', '1'), ('71', '2017-05-05 16:50:06', '200', 'main', 'OnSetRatingsConfigs', 'blog', '', 'CRatingsComponentsBlog', 'OnSetRatingConfigs', '', '1'), ('72', '2017-05-05 16:50:06', '200', 'main', 'OnGetRatingsConfigs', 'blog', '', 'CRatingsComponentsBlog', 'OnGetRatingConfigs', '', '1'), ('73', '2017-05-05 16:50:06', '200', 'main', 'OnGetRatingsObjects', 'blog', '', 'CRatingsComponentsBlog', 'OnGetRatingObject', '', '1'), ('74', '2017-05-05 16:50:06', '200', 'main', 'OnGetRatingContentOwner', 'blog', '', 'CRatingsComponentsBlog', 'OnGetRatingContentOwner', '', '1'), ('75', '2017-05-05 16:50:06', '100', 'im', 'OnGetNotifySchema', 'blog', '', 'CBlogNotifySchema', 'OnGetNotifySchema', '', '1'), ('76', '2017-05-05 16:50:06', '100', 'main', 'OnAfterRegisterModule', 'main', '/modules/blog/install/index.php', 'blog', 'installUserFields', '', '1'), ('77', '2017-05-05 16:50:06', '100', 'conversion', 'OnGetCounterTypes', 'blog', '', '\\Bitrix\\Blog\\Internals\\ConversionHandlers', 'onGetCounterTypes', '', '1'), ('78', '2017-05-05 16:50:06', '100', 'conversion', 'OnGetRateTypes', 'blog', '', '\\Bitrix\\Blog\\Internals\\ConversionHandlers', 'onGetRateTypes', '', '1'), ('79', '2017-05-05 16:50:06', '100', 'blog', 'OnPostAdd', 'blog', '', '\\Bitrix\\Blog\\Internals\\ConversionHandlers', 'onPostAdd', '', '1'), ('80', '2017-05-05 16:50:06', '100', 'mail', 'onReplyReceivedBLOG_POST', 'blog', '', '\\Bitrix\\Blog\\Internals\\MailHandler', 'handleReplyReceivedBlogPost', '', '2'), ('81', '2017-05-05 16:50:06', '100', 'mail', 'onForwardReceivedBLOG_POST', 'blog', '', '\\Bitrix\\Blog\\Internals\\MailHandler', 'handleForwardReceivedBlogPost', '', '2'), ('82', '2017-05-05 16:50:10', '100', 'main', 'OnEventLogGetAuditTypes', 'clouds', '', 'CCloudStorage', 'GetAuditTypes', '', '1'), ('83', '2017-05-05 16:50:10', '100', 'main', 'OnBeforeProlog', 'clouds', '', 'CCloudStorage', 'OnBeforeProlog', '', '1'), ('84', '2017-05-05 16:50:10', '100', 'main', 'OnAdminListDisplay', 'clouds', '', 'CCloudStorage', 'OnAdminListDisplay', '', '1'), ('85', '2017-05-05 16:50:10', '100', 'main', 'OnBuildGlobalMenu', 'clouds', '', 'CCloudStorage', 'OnBuildGlobalMenu', '', '1'), ('86', '2017-05-05 16:50:10', '100', 'main', 'OnFileSave', 'clouds', '', 'CCloudStorage', 'OnFileSave', '', '1'), ('87', '2017-05-05 16:50:10', '100', 'main', 'OnGetFileSRC', 'clouds', '', 'CCloudStorage', 'OnGetFileSRC', '', '1'), ('88', '2017-05-05 16:50:10', '100', 'main', 'OnFileCopy', 'clouds', '', 'CCloudStorage', 'OnFileCopy', '', '1'), ('89', '2017-05-05 16:50:10', '100', 'main', 'OnFileDelete', 'clouds', '', 'CCloudStorage', 'OnFileDelete', '', '1'), ('90', '2017-05-05 16:50:10', '100', 'main', 'OnMakeFileArray', 'clouds', '', 'CCloudStorage', 'OnMakeFileArray', '', '1'), ('91', '2017-05-05 16:50:10', '100', 'main', 'OnBeforeResizeImage', 'clouds', '', 'CCloudStorage', 'OnBeforeResizeImage', '', '1'), ('92', '2017-05-05 16:50:10', '100', 'main', 'OnAfterResizeImage', 'clouds', '', 'CCloudStorage', 'OnAfterResizeImage', '', '1'), ('93', '2017-05-05 16:50:10', '100', 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_AmazonS3', 'GetObject', '', '1'), ('94', '2017-05-05 16:50:10', '100', 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_GoogleStorage', 'GetObject', '', '1'), ('95', '2017-05-05 16:50:10', '100', 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_OpenStackStorage', 'GetObject', '', '1'), ('96', '2017-05-05 16:50:10', '100', 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_RackSpaceCloudFiles', 'GetObject', '', '1'), ('97', '2017-05-05 16:50:10', '100', 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_ClodoRU', 'GetObject', '', '1'), ('98', '2017-05-05 16:50:10', '100', 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_Selectel', 'GetObject', '', '1'), ('99', '2017-05-05 16:50:12', '1', 'main', 'OnPageStart', 'compression', '', 'CCompress', 'OnPageStart', '', '1'), ('100', '2017-05-05 16:50:12', '10000', 'main', 'OnAfterEpilog', 'compression', '', 'CCompress', 'OnAfterEpilog', '', '1'), ('101', '2017-05-05 16:50:13', '100', 'main', 'OnGroupDelete', 'fileman', '', 'CFileman', 'OnGroupDelete', '', '1'), ('102', '2017-05-05 16:50:13', '100', 'main', 'OnPanelCreate', 'fileman', '', 'CFileman', 'OnPanelCreate', '', '1'), ('103', '2017-05-05 16:50:13', '100', 'main', 'OnModuleUpdate', 'fileman', '', 'CFileman', 'OnModuleUpdate', '', '1'), ('104', '2017-05-05 16:50:13', '100', 'main', 'OnModuleInstalled', 'fileman', '', 'CFileman', 'ClearComponentsListCache', '', '1'), ('105', '2017-05-05 16:50:13', '100', 'iblock', 'OnIBlockPropertyBuildList', 'fileman', '', 'CIBlockPropertyMapGoogle', 'GetUserTypeDescription', '', '1'), ('106', '2017-05-05 16:50:13', '100', 'iblock', 'OnIBlockPropertyBuildList', 'fileman', '', 'CIBlockPropertyMapYandex', 'GetUserTypeDescription', '', '1'), ('107', '2017-05-05 16:50:13', '100', 'iblock', 'OnIBlockPropertyBuildList', 'fileman', '', 'CIBlockPropertyVideo', 'GetUserTypeDescription', '', '1'), ('108', '2017-05-05 16:50:13', '100', 'main', 'OnUserTypeBuildList', 'fileman', '', 'CUserTypeVideo', 'GetUserTypeDescription', '', '1'), ('109', '2017-05-05 16:50:13', '100', 'main', 'OnEventLogGetAuditTypes', 'fileman', '', 'CEventFileman', 'GetAuditTypes', '', '1'), ('110', '2017-05-05 16:50:13', '100', 'main', 'OnEventLogGetAuditHandlers', 'fileman', '', 'CEventFileman', 'MakeFilemanObject', '', '1'), ('111', '2017-05-05 16:50:17', '100', 'sender', 'OnConnectorList', 'form', '', '\\Bitrix\\Form\\SenderEventHandler', 'onConnectorListForm', '', '1'), ('112', '2017-05-05 16:50:19', '100', 'main', 'OnAfterUserUpdate', 'forum', '', 'CForumUser', 'OnAfterUserUpdate', '', '1'), ('113', '2017-05-05 16:50:19', '100', 'main', 'OnGroupDelete', 'forum', '', 'CForumNew', 'OnGroupDelete', '', '1'), ('114', '2017-05-05 16:50:19', '100', 'main', 'OnBeforeLangDelete', 'forum', '', 'CForumNew', 'OnBeforeLangDelete', '', '1'), ('115', '2017-05-05 16:50:19', '100', 'main', 'OnFileDelete', 'forum', '', 'CForumFiles', 'OnFileDelete', '', '1'), ('116', '2017-05-05 16:50:19', '100', 'search', 'OnReindex', 'forum', '', 'CForumNew', 'OnReindex', '', '1'), ('117', '2017-05-05 16:50:19', '100', 'main', 'OnUserDelete', 'forum', '', 'CForumUser', 'OnUserDelete', '', '1'), ('118', '2017-05-05 16:50:19', '100', 'iblock', 'OnIBlockPropertyBuildList', 'main', '/modules/forum/tools/prop_topicid.php', 'CIBlockPropertyTopicID', 'GetUserTypeDescription', '', '1'), ('119', '2017-05-05 16:50:19', '100', 'iblock', 'OnBeforeIBlockElementDelete', 'forum', '', 'CForumTopic', 'OnBeforeIBlockElementDelete', '', '1'), ('120', '2017-05-05 16:50:19', '100', 'main', 'OnEventLogGetAuditTypes', 'forum', '', 'CForumEventLog', 'GetAuditTypes', '', '1'), ('121', '2017-05-05 16:50:19', '100', 'main', 'OnEventLogGetAuditHandlers', 'forum', '', 'CEventForum', 'MakeForumObject', '', '1'), ('122', '2017-05-05 16:50:19', '100', 'socialnetwork', 'OnSocNetGroupDelete', 'forum', '', 'CForumUser', 'OnSocNetGroupDelete', '', '1'), ('123', '2017-05-05 16:50:19', '100', 'socialnetwork', 'OnSocNetLogFormatEvent', 'forum', '', 'CForumMessage', 'OnSocNetLogFormatEvent', '', '1'), ('124', '2017-05-05 16:50:19', '100', 'mail', 'OnGetFilterList', 'forum', '', 'CForumEMail', 'OnGetSocNetFilterList', '', '1'), ('125', '2017-05-05 16:50:19', '100', 'main', 'OnAfterAddRating', 'forum', '', 'CRatingsComponentsForum', 'OnAfterAddRating', '', '1'), ('126', '2017-05-05 16:50:19', '100', 'main', 'OnAfterUpdateRating', 'forum', '', 'CRatingsComponentsForum', 'OnAfterUpdateRating', '', '1'), ('127', '2017-05-05 16:50:19', '100', 'main', 'OnSetRatingsConfigs', 'forum', '', 'CRatingsComponentsForum', 'OnSetRatingConfigs', '', '1'), ('128', '2017-05-05 16:50:19', '100', 'main', 'OnGetRatingsConfigs', 'forum', '', 'CRatingsComponentsForum', 'OnGetRatingConfigs', '', '1'), ('129', '2017-05-05 16:50:19', '100', 'main', 'OnGetRatingsObjects', 'forum', '', 'CRatingsComponentsForum', 'OnGetRatingObject', '', '1'), ('130', '2017-05-05 16:50:19', '100', 'main', 'OnGetRatingContentOwner', 'forum', '', 'CRatingsComponentsForum', 'OnGetRatingContentOwner', '', '1'), ('131', '2017-05-05 16:50:19', '100', 'im', 'OnGetNotifySchema', 'forum', '', 'CForumNotifySchema', 'OnGetNotifySchema', '', '1'), ('132', '2017-05-05 16:50:19', '100', 'main', 'OnAfterRegisterModule', 'main', '/modules/forum/install/index.php', 'forum', 'InstallUserFields', '', '1'), ('133', '2017-05-05 16:50:19', '100', 'conversion', 'OnGetCounterTypes', 'forum', '', '\\Bitrix\\Forum\\Internals\\ConversionHandlers', 'onGetCounterTypes', '', '1'), ('134', '2017-05-05 16:50:19', '100', 'conversion', 'OnGetRateTypes', 'forum', '', '\\Bitrix\\Forum\\Internals\\ConversionHandlers', 'onGetRateTypes', '', '1'), ('135', '2017-05-05 16:50:19', '100', 'forum', 'onAfterTopicAdd', 'forum', '', '\\Bitrix\\Forum\\Internals\\ConversionHandlers', 'onTopicAdd', '', '1'), ('136', '2017-05-05 16:50:19', '100', 'forum', 'onAfterMessageAdd', 'forum', '', '\\Bitrix\\Forum\\Internals\\ConversionHandlers', 'onMessageAdd', '', '1'), ('137', '2017-05-05 16:50:23', '100', 'main', 'OnBeforeUserTypeAdd', 'highloadblock', '', '\\Bitrix\\Highloadblock\\HighloadBlockTable', 'OnBeforeUserTypeAdd', '', '1'), ('138', '2017-05-05 16:50:23', '100', 'main', 'OnAfterUserTypeAdd', 'highloadblock', '', '\\Bitrix\\Highloadblock\\HighloadBlockTable', 'onAfterUserTypeAdd', '', '1'), ('139', '2017-05-05 16:50:23', '100', 'main', 'OnBeforeUserTypeDelete', 'highloadblock', '', '\\Bitrix\\Highloadblock\\HighloadBlockTable', 'OnBeforeUserTypeDelete', '', '1'), ('140', '2017-05-05 16:50:23', '100', 'main', 'OnUserTypeBuildList', 'highloadblock', '', 'CUserTypeHlblock', 'GetUserTypeDescription', '', '1'), ('141', '2017-05-05 16:50:23', '100', 'iblock', 'OnIBlockPropertyBuildList', 'highloadblock', '', 'CIBlockPropertyDirectory', 'GetUserTypeDescription', '', '1'), ('142', '2017-05-05 16:50:26', '100', 'main', 'OnGroupDelete', 'iblock', '', 'CIBlock', 'OnGroupDelete', '', '1'), ('143', '2017-05-05 16:50:26', '100', 'main', 'OnBeforeLangDelete', 'iblock', '', 'CIBlock', 'OnBeforeLangDelete', '', '1'), ('144', '2017-05-05 16:50:26', '100', 'main', 'OnLangDelete', 'iblock', '', 'CIBlock', 'OnLangDelete', '', '1'), ('145', '2017-05-05 16:50:26', '100', 'main', 'OnUserTypeRightsCheck', 'iblock', '', 'CIBlockSection', 'UserTypeRightsCheck', '', '1'), ('146', '2017-05-05 16:50:26', '100', 'search', 'OnReindex', 'iblock', '', 'CIBlock', 'OnSearchReindex', '', '1'), ('147', '2017-05-05 16:50:26', '100', 'search', 'OnSearchGetURL', 'iblock', '', 'CIBlock', 'OnSearchGetURL', '', '1'), ('148', '2017-05-05 16:50:26', '100', 'main', 'OnEventLogGetAuditTypes', 'iblock', '', 'CIBlock', 'GetAuditTypes', '', '1'), ('149', '2017-05-05 16:50:26', '100', 'main', 'OnEventLogGetAuditHandlers', 'iblock', '', 'CEventIBlock', 'MakeIBlockObject', '', '1'), ('150', '2017-05-05 16:50:26', '200', 'main', 'OnGetRatingContentOwner', 'iblock', '', 'CRatingsComponentsIBlock', 'OnGetRatingContentOwner', '', '1'), ('151', '2017-05-05 16:50:26', '100', 'main', 'OnTaskOperationsChanged', 'iblock', '', 'CIBlockRightsStorage', 'OnTaskOperationsChanged', '', '1'), ('152', '2017-05-05 16:50:26', '100', 'main', 'OnGroupDelete', 'iblock', '', 'CIBlockRightsStorage', 'OnGroupDelete', '', '1'), ('153', '2017-05-05 16:50:26', '100', 'main', 'OnUserDelete', 'iblock', '', 'CIBlockRightsStorage', 'OnUserDelete', '', '1'), ('154', '2017-05-05 16:50:26', '100', 'perfmon', 'OnGetTableSchema', 'iblock', '', 'iblock', 'OnGetTableSchema', '', '1'), ('155', '2017-05-05 16:50:26', '100', 'sender', 'OnConnectorList', 'iblock', '', '\\Bitrix\\Iblock\\SenderEventHandler', 'onConnectorListIblock', '', '1'), ('156', '2017-05-05 16:50:26', '10', 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockProperty', '_Date_GetUserTypeDescription', '', '1'), ('157', '2017-05-05 16:50:26', '20', 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockProperty', '_DateTime_GetUserTypeDescription', '', '1'), ('158', '2017-05-05 16:50:26', '30', 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockProperty', '_XmlID_GetUserTypeDescription', '', '1'), ('159', '2017-05-05 16:50:26', '40', 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockProperty', '_FileMan_GetUserTypeDescription', '', '1'), ('160', '2017-05-05 16:50:26', '50', 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockProperty', '_HTML_GetUserTypeDescription', '', '1'), ('161', '2017-05-05 16:50:26', '60', 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockProperty', '_ElementList_GetUserTypeDescription', '', '1'), ('162', '2017-05-05 16:50:26', '70', 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockProperty', '_Sequence_GetUserTypeDescription', '', '1'), ('163', '2017-05-05 16:50:26', '80', 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockProperty', '_ElementAutoComplete_GetUserTypeDescription', '', '1'), ('164', '2017-05-05 16:50:26', '90', 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockProperty', '_SKU_GetUserTypeDescription', '', '1'), ('165', '2017-05-05 16:50:26', '100', 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockProperty', '_SectionAutoComplete_GetUserTypeDescription', '', '1'), ('166', '2017-05-05 16:50:30', '100', 'pull', 'OnGetDependentModule', 'mobileapp', '', 'CMobileAppPullSchema', 'OnGetDependentModule', '', '1'), ('167', '2017-05-05 16:50:32', '100', 'perfmon', 'OnGetTableSchema', 'perfmon', '', 'perfmon', 'OnGetTableSchema', '', '1'), ('168', '2017-05-05 16:50:33', '100', 'iblock', 'OnBeforeIBlockElementDelete', 'photogallery', '', 'CPhotogalleryElement', 'OnBeforeIBlockElementDelete', '', '1'), ('169', '2017-05-05 16:50:33', '100', 'iblock', 'OnAfterIBlockElementAdd', 'photogallery', '', 'CPhotogalleryElement', 'OnAfterIBlockElementAdd', '', '1'), ('170', '2017-05-05 16:50:33', '100', 'search', 'BeforeIndex', 'photogallery', '', 'CRatingsComponentsPhotogallery', 'BeforeIndex', '', '1'), ('171', '2017-05-05 16:50:33', '100', 'im', 'OnGetNotifySchema', 'photogallery', '', 'CPhotogalleryNotifySchema', 'OnGetNotifySchema', '', '1'), ('172', '2017-05-05 16:50:36', '100', 'main', 'OnEventLogGetAuditTypes', 'scale', '', '\\Bitrix\\Scale\\Logger', 'onEventLogGetAuditTypes', '', '1'), ('173', '2017-05-05 16:50:37', '100', 'main', 'OnChangePermissions', 'search', '', 'CSearch', 'OnChangeFilePermissions', '', '1'), ('174', '2017-05-05 16:50:37', '100', 'main', 'OnChangeFile', 'search', '', 'CSearch', 'OnChangeFile', '', '1'), ('175', '2017-05-05 16:50:38', '100', 'main', 'OnGroupDelete', 'search', '', 'CSearch', 'OnGroupDelete', '', '1'), ('176', '2017-05-05 16:50:38', '100', 'main', 'OnLangDelete', 'search', '', 'CSearch', 'OnLangDelete', '', '1'), ('177', '2017-05-05 16:50:38', '100', 'main', 'OnAfterUserUpdate', 'search', '', 'CSearchUser', 'OnAfterUserUpdate', '', '1'), ('178', '2017-05-05 16:50:38', '100', 'main', 'OnUserDelete', 'search', '', 'CSearchUser', 'DeleteByUserID', '', '1'), ('179', '2017-05-05 16:50:38', '100', 'cluster', 'OnGetTableList', 'search', '', 'search', 'OnGetTableList', '', '1'), ('180', '2017-05-05 16:50:38', '100', 'perfmon', 'OnGetTableSchema', 'search', '', 'search', 'OnGetTableSchema', '', '1'), ('181', '2017-05-05 16:50:38', '90', 'main', 'OnEpilog', 'search', '', 'CSearchStatistic', 'OnEpilog', '', '1'), ('182', '2017-05-05 16:50:40', '100', 'main', 'OnUserDelete', 'security', '', 'CSecurityUser', 'OnUserDelete', '', '1'), ('183', '2017-05-05 16:50:40', '100', 'main', 'OnEventLogGetAuditTypes', 'security', '', 'CSecurityFilter', 'GetAuditTypes', '', '1'), ('184', '2017-05-05 16:50:40', '100', 'main', 'OnEventLogGetAuditTypes', 'security', '', 'CSecurityAntiVirus', 'GetAuditTypes', '', '1'), ('185', '2017-05-05 16:50:40', '100', 'main', 'OnAdminInformerInsertItems', 'security', '', 'CSecurityFilter', 'OnAdminInformerInsertItems', '', '1'), ('186', '2017-05-05 16:50:40', '100', 'main', 'OnAdminInformerInsertItems', 'security', '', 'CSecuritySiteChecker', 'OnAdminInformerInsertItems', '', '1'), ('187', '2017-05-05 16:50:40', '5', 'main', 'OnBeforeProlog', 'security', '', 'CSecurityFilter', 'OnBeforeProlog', '', '1'), ('188', '2017-05-05 16:50:40', '9999', 'main', 'OnEndBufferContent', 'security', '', 'CSecurityXSSDetect', 'OnEndBufferContent', '', '1'), ('189', '2017-05-05 16:50:40', '1', 'main', 'OnBeforeLocalRedirect', 'security', '', 'CSecurityRedirect', 'BeforeLocalRedirect', '', '1'), ('190', '2017-05-05 16:50:40', '1', 'main', 'OnEndBufferContent', 'security', '', 'CSecurityRedirect', 'EndBufferContent', '', '1'), ('191', '2017-05-05 16:50:42', '100', 'main', 'OnPanelCreate', 'seo', '', 'CSeoEventHandlers', 'SeoOnPanelCreate', '', '2'), ('192', '2017-05-05 16:50:42', '100', 'fileman', 'OnIncludeHTMLEditorScript', 'seo', '', 'CSeoEventHandlers', 'OnIncludeHTMLEditorScript', '', '2'), ('193', '2017-05-05 16:50:42', '100', 'fileman', 'OnBeforeHTMLEditorScriptRuns', 'seo', '', 'CSeoEventHandlers', 'OnBeforeHTMLEditorScriptRuns', '', '2'), ('194', '2017-05-05 16:50:42', '100', 'iblock', 'OnAfterIBlockSectionAdd', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'addSection', '', '2'), ('195', '2017-05-05 16:50:42', '100', 'iblock', 'OnAfterIBlockElementAdd', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'addElement', '', '2'), ('196', '2017-05-05 16:50:42', '100', 'iblock', 'OnBeforeIBlockSectionDelete', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'beforeDeleteSection', '', '2'), ('197', '2017-05-05 16:50:42', '100', 'iblock', 'OnBeforeIBlockElementDelete', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'beforeDeleteElement', '', '2'), ('198', '2017-05-05 16:50:42', '100', 'iblock', 'OnAfterIBlockSectionDelete', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'deleteSection', '', '2'), ('199', '2017-05-05 16:50:42', '100', 'iblock', 'OnAfterIBlockElementDelete', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'deleteElement', '', '2'), ('200', '2017-05-05 16:50:42', '100', 'iblock', 'OnBeforeIBlockSectionUpdate', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'beforeUpdateSection', '', '2'), ('201', '2017-05-05 16:50:42', '100', 'iblock', 'OnBeforeIBlockElementUpdate', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'beforeUpdateElement', '', '2'), ('202', '2017-05-05 16:50:42', '100', 'iblock', 'OnAfterIBlockSectionUpdate', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'updateSection', '', '2'), ('203', '2017-05-05 16:50:42', '100', 'iblock', 'OnAfterIBlockElementUpdate', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'updateElement', '', '2'), ('204', '2017-05-05 16:50:42', '100', 'forum', 'onAfterTopicAdd', 'seo', '', '\\Bitrix\\Seo\\SitemapForum', 'addTopic', '', '2'), ('205', '2017-05-05 16:50:42', '100', 'forum', 'onAfterTopicUpdate', 'seo', '', '\\Bitrix\\Seo\\SitemapForum', 'updateTopic', '', '2'), ('206', '2017-05-05 16:50:42', '100', 'forum', 'onAfterTopicDelete', 'seo', '', '\\Bitrix\\Seo\\SitemapForum', 'deleteTopic', '', '2'), ('207', '2017-05-05 16:50:42', '100', 'main', 'OnAdminIBlockElementEdit', 'seo', '', '\\Bitrix\\Seo\\AdvTabEngine', 'eventHandler', '', '2'), ('208', '2017-05-05 16:50:42', '100', 'main', 'OnBeforeProlog', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'checkSession', '', '2'), ('209', '2017-05-05 16:50:42', '100', 'sale', 'OnOrderSave', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'onOrderSave', '', '2'), ('210', '2017-05-05 16:50:42', '100', 'sale', 'OnBasketOrder', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'onBasketOrder', '', '2'), ('211', '2017-05-05 16:50:42', '100', 'sale', 'onSalePayOrder', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'onSalePayOrder', '', '2'), ('212', '2017-05-05 16:50:42', '100', 'sale', 'onSaleDeductOrder', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'onSaleDeductOrder', '', '2'), ('213', '2017-05-05 16:50:42', '100', 'sale', 'onSaleDeliveryOrder', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'onSaleDeliveryOrder', '', '2'), ('214', '2017-05-05 16:50:42', '100', 'sale', 'onSaleStatusOrder', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'onSaleStatusOrder', '', '2'), ('215', '2017-05-05 16:50:42', '100', 'conversion', 'OnSetDayContextAttributes', 'seo', '', '\\Bitrix\\Seo\\ConversionHandler', 'onSetDayContextAttributes', '', '2'), ('216', '2017-05-05 16:50:42', '100', 'conversion', 'OnGetAttributeTypes', 'seo', '', '\\Bitrix\\Seo\\ConversionHandler', 'onGetAttributeTypes', '', '2'), ('217', '2017-05-05 16:50:42', '100', 'catalog', 'OnProductUpdate', 'seo', '', '\\Bitrix\\Seo\\Adv\\Auto', 'checkQuantity', '', '2'), ('218', '2017-05-05 16:50:42', '100', 'catalog', 'OnProductSetAvailableUpdate', 'seo', '', '\\Bitrix\\Seo\\Adv\\Auto', 'checkQuantity', '', '2'), ('219', '2017-05-05 16:50:44', '100', 'main', 'OnUserDelete', 'socialservices', '', 'CSocServAuthDB', 'OnUserDelete', '', '1'), ('220', '2017-05-05 16:50:44', '100', 'timeman', 'OnAfterTMReportDailyAdd', 'socialservices', '', 'CSocServAuthDB', 'OnAfterTMReportDailyAdd', '', '1'), ('221', '2017-05-05 16:50:44', '100', 'timeman', 'OnAfterTMDayStart', 'socialservices', '', 'CSocServAuthDB', 'OnAfterTMDayStart', '', '1'), ('222', '2017-05-05 16:50:44', '100', 'timeman', 'OnTimeManShow', 'socialservices', '', 'CSocServEventHandlers', 'OnTimeManShow', '', '1'), ('223', '2017-05-05 16:50:44', '100', 'main', 'OnFindExternalUser', 'socialservices', '', 'CSocServAuthDB', 'OnFindExternalUser', '', '1'), ('224', '2017-05-05 16:50:46', '100', 'main', 'OnBeforeLangDelete', 'subscribe', '', 'CRubric', 'OnBeforeLangDelete', '', '1'), ('225', '2017-05-05 16:50:46', '100', 'main', 'OnUserDelete', 'subscribe', '', 'CSubscription', 'OnUserDelete', '', '1'), ('226', '2017-05-05 16:50:46', '100', 'main', 'OnUserLogout', 'subscribe', '', 'CSubscription', 'OnUserLogout', '', '1'), ('227', '2017-05-05 16:50:46', '100', 'main', 'OnGroupDelete', 'subscribe', '', 'CPosting', 'OnGroupDelete', '', '1'), ('228', '2017-05-05 16:50:46', '100', 'sender', 'OnConnectorList', 'subscribe', '', 'Bitrix\\Subscribe\\SenderEventHandler', 'onConnectorListSubscriber', '', '1'), ('229', '2017-05-05 16:50:48', '100', 'main', 'OnPanelCreate', 'translate', '', 'CTranslateEventHandlers', 'TranslatOnPanelCreate', '', '1'), ('230', '2017-05-05 16:50:50', '100', 'main', 'OnBeforeProlog', 'main', '/modules/vote/keepvoting.php', '', '', '', '1'), ('231', '2017-05-05 16:50:50', '200', 'main', 'OnUserTypeBuildList', 'vote', '', 'CUserTypeVote', 'GetUserTypeDescription', '', '1'), ('232', '2017-05-05 16:50:50', '200', 'main', 'OnUserLogin', 'vote', '', 'CVoteUser', 'OnUserLogin', '', '1'), ('233', '2017-05-05 16:50:50', '100', 'im', 'OnGetNotifySchema', 'vote', '', 'CVoteNotifySchema', 'OnGetNotifySchema', '', '1');
COMMIT;

-- ----------------------------
--  Table structure for `b_operation`
-- ----------------------------
DROP TABLE IF EXISTS `b_operation`;
CREATE TABLE `b_operation` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BINDING` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'module',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `b_operation`
-- ----------------------------
BEGIN;
INSERT INTO `b_operation` VALUES ('1', 'edit_php', 'main', null, 'module'), ('2', 'view_own_profile', 'main', null, 'module'), ('3', 'edit_own_profile', 'main', null, 'module'), ('4', 'view_all_users', 'main', null, 'module'), ('5', 'view_groups', 'main', null, 'module'), ('6', 'view_tasks', 'main', null, 'module'), ('7', 'view_other_settings', 'main', null, 'module'), ('8', 'view_subordinate_users', 'main', null, 'module'), ('9', 'edit_subordinate_users', 'main', null, 'module'), ('10', 'edit_all_users', 'main', null, 'module'), ('11', 'edit_groups', 'main', null, 'module'), ('12', 'edit_tasks', 'main', null, 'module'), ('13', 'edit_other_settings', 'main', null, 'module'), ('14', 'cache_control', 'main', null, 'module'), ('15', 'lpa_template_edit', 'main', null, 'module'), ('16', 'view_event_log', 'main', null, 'module'), ('17', 'edit_ratings', 'main', null, 'module'), ('18', 'manage_short_uri', 'main', null, 'module'), ('19', 'fm_view_permission', 'main', null, 'file'), ('20', 'fm_view_file', 'main', null, 'file'), ('21', 'fm_view_listing', 'main', null, 'file'), ('22', 'fm_edit_existent_folder', 'main', null, 'file'), ('23', 'fm_create_new_file', 'main', null, 'file'), ('24', 'fm_edit_existent_file', 'main', null, 'file'), ('25', 'fm_create_new_folder', 'main', null, 'file'), ('26', 'fm_delete_file', 'main', null, 'file'), ('27', 'fm_delete_folder', 'main', null, 'file'), ('28', 'fm_edit_in_workflow', 'main', null, 'file'), ('29', 'fm_rename_file', 'main', null, 'file'), ('30', 'fm_rename_folder', 'main', null, 'file'), ('31', 'fm_upload_file', 'main', null, 'file'), ('32', 'fm_add_to_menu', 'main', null, 'file'), ('33', 'fm_download_file', 'main', null, 'file'), ('34', 'fm_lpa', 'main', null, 'file'), ('35', 'fm_edit_permission', 'main', null, 'file'), ('36', 'clouds_browse', 'clouds', null, 'module'), ('37', 'clouds_upload', 'clouds', null, 'module'), ('38', 'clouds_config', 'clouds', null, 'module'), ('39', 'fileman_view_all_settings', 'fileman', '', 'module'), ('40', 'fileman_edit_menu_types', 'fileman', '', 'module'), ('41', 'fileman_add_element_to_menu', 'fileman', '', 'module'), ('42', 'fileman_edit_menu_elements', 'fileman', '', 'module'), ('43', 'fileman_edit_existent_files', 'fileman', '', 'module'), ('44', 'fileman_edit_existent_folders', 'fileman', '', 'module'), ('45', 'fileman_admin_files', 'fileman', '', 'module'), ('46', 'fileman_admin_folders', 'fileman', '', 'module'), ('47', 'fileman_view_permissions', 'fileman', '', 'module'), ('48', 'fileman_edit_all_settings', 'fileman', '', 'module'), ('49', 'fileman_upload_files', 'fileman', '', 'module'), ('50', 'fileman_view_file_structure', 'fileman', '', 'module'), ('51', 'fileman_install_control', 'fileman', '', 'module'), ('52', 'medialib_view_collection', 'fileman', '', 'medialib'), ('53', 'medialib_new_collection', 'fileman', '', 'medialib'), ('54', 'medialib_edit_collection', 'fileman', '', 'medialib'), ('55', 'medialib_del_collection', 'fileman', '', 'medialib'), ('56', 'medialib_access', 'fileman', '', 'medialib'), ('57', 'medialib_new_item', 'fileman', '', 'medialib'), ('58', 'medialib_edit_item', 'fileman', '', 'medialib'), ('59', 'medialib_del_item', 'fileman', '', 'medialib'), ('60', 'sticker_view', 'fileman', '', 'stickers'), ('61', 'sticker_edit', 'fileman', '', 'stickers'), ('62', 'sticker_new', 'fileman', '', 'stickers'), ('63', 'sticker_del', 'fileman', '', 'stickers'), ('64', 'section_read', 'iblock', null, 'iblock'), ('65', 'element_read', 'iblock', null, 'iblock'), ('66', 'section_element_bind', 'iblock', null, 'iblock'), ('67', 'iblock_admin_display', 'iblock', null, 'iblock'), ('68', 'element_edit', 'iblock', null, 'iblock'), ('69', 'element_edit_price', 'iblock', null, 'iblock'), ('70', 'element_delete', 'iblock', null, 'iblock'), ('71', 'element_bizproc_start', 'iblock', null, 'iblock'), ('72', 'section_edit', 'iblock', null, 'iblock'), ('73', 'section_delete', 'iblock', null, 'iblock'), ('74', 'section_section_bind', 'iblock', null, 'iblock'), ('75', 'element_edit_any_wf_status', 'iblock', null, 'iblock'), ('76', 'iblock_edit', 'iblock', null, 'iblock'), ('77', 'iblock_delete', 'iblock', null, 'iblock'), ('78', 'iblock_rights_edit', 'iblock', null, 'iblock'), ('79', 'iblock_export', 'iblock', null, 'iblock'), ('80', 'section_rights_edit', 'iblock', null, 'iblock'), ('81', 'element_rights_edit', 'iblock', null, 'iblock'), ('82', 'security_filter_bypass', 'security', null, 'module'), ('83', 'security_edit_user_otp', 'security', null, 'module'), ('84', 'security_module_settings_read', 'security', null, 'module'), ('85', 'security_panel_view', 'security', null, 'module'), ('86', 'security_filter_settings_read', 'security', null, 'module'), ('87', 'security_otp_settings_read', 'security', null, 'module'), ('88', 'security_iprule_admin_settings_read', 'security', null, 'module'), ('89', 'security_session_settings_read', 'security', null, 'module'), ('90', 'security_redirect_settings_read', 'security', null, 'module'), ('91', 'security_stat_activity_settings_read', 'security', null, 'module'), ('92', 'security_iprule_settings_read', 'security', null, 'module'), ('93', 'security_antivirus_settings_read', 'security', null, 'module'), ('94', 'security_frame_settings_read', 'security', null, 'module'), ('95', 'security_module_settings_write', 'security', null, 'module'), ('96', 'security_filter_settings_write', 'security', null, 'module'), ('97', 'security_otp_settings_write', 'security', null, 'module'), ('98', 'security_iprule_admin_settings_write', 'security', null, 'module'), ('99', 'security_session_settings_write', 'security', null, 'module'), ('100', 'security_redirect_settings_write', 'security', null, 'module'), ('101', 'security_stat_activity_settings_write', 'security', null, 'module'), ('102', 'security_iprule_settings_write', 'security', null, 'module'), ('103', 'security_file_verifier_sign', 'security', null, 'module'), ('104', 'security_file_verifier_collect', 'security', null, 'module'), ('105', 'security_file_verifier_verify', 'security', null, 'module'), ('106', 'security_antivirus_settings_write', 'security', null, 'module'), ('107', 'security_frame_settings_write', 'security', null, 'module'), ('108', 'seo_settings', 'seo', '', 'module'), ('109', 'seo_tools', 'seo', '', 'module');
COMMIT;

-- ----------------------------
--  Table structure for `b_option`
-- ----------------------------
DROP TABLE IF EXISTS `b_option`;
CREATE TABLE `b_option` (
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  UNIQUE KEY `ix_option` (`MODULE_ID`,`NAME`,`SITE_ID`),
  KEY `ix_option_name` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `b_option`
-- ----------------------------
BEGIN;
INSERT INTO `b_option` VALUES ('main', 'rating_authority_rating', '2', null, null), ('main', 'rating_assign_rating_group_add', '1', null, null), ('main', 'rating_assign_rating_group_delete', '1', null, null), ('main', 'rating_assign_rating_group', '3', null, null), ('main', 'rating_assign_authority_group_add', '2', null, null), ('main', 'rating_assign_authority_group_delete', '2', null, null), ('main', 'rating_assign_authority_group', '4', null, null), ('main', 'rating_community_size', '1', null, null), ('main', 'rating_community_authority', '30', null, null), ('main', 'rating_vote_weight', '10', null, null), ('main', 'rating_normalization_type', 'auto', null, null), ('main', 'rating_normalization', '10', null, null), ('main', 'rating_count_vote', '10', null, null), ('main', 'rating_authority_weight_formula', 'Y', null, null), ('main', 'rating_community_last_visit', '90', null, null), ('main', 'rating_text_like_y', 'Нравится', null, null), ('main', 'rating_text_like_n', 'Не нравится', null, null), ('main', 'rating_text_like_d', 'Это нравится', null, null), ('main', 'rating_assign_type', 'auto', null, null), ('main', 'rating_vote_type', 'like', null, null), ('main', 'rating_self_vote', 'Y', null, null), ('main', 'rating_vote_show', 'Y', null, null), ('main', 'rating_vote_template', 'like', null, null), ('main', 'rating_start_authority', '3', null, null), ('main', 'PARAM_MAX_SITES', '2', null, null), ('main', 'PARAM_MAX_USERS', '0', null, null), ('main', 'distributive6', 'Y', null, null), ('main', '~new_license11_sign', 'Y', null, null), ('main', 'GROUP_DEFAULT_TASK', '1', null, null), ('main', 'vendor', '1c_bitrix', null, null), ('main', 'admin_lid', 'ru', null, null), ('main', 'update_site', 'www.bitrixsoft.com', null, null), ('main', 'update_site_ns', 'Y', null, null), ('main', 'optimize_css_files', 'Y', null, null), ('main', 'optimize_js_files', 'Y', null, null), ('main', 'server_uniq_id', 'cfd2b11f3abf1b9e43c48abfaee78290', null, null), ('blog', 'socNetNewPerms', 'Y', null, null), ('fileman', 'use_editor_3', 'Y', null, null), ('forum', 'FILTER_DICT_W', '1', null, 'ru'), ('forum', 'FILTER_DICT_T', '2', null, 'ru'), ('forum', 'FILTER_DICT_W', '3', null, 'en'), ('forum', 'FILTER_DICT_T', '4', null, 'en'), ('forum', 'FILTER', 'N', null, null), ('search', 'version', 'v2.0', null, null), ('search', 'dbnode_id', 'N', null, null), ('search', 'dbnode_status', 'ok', null, null), ('security', 'ipcheck_disable_file', '/bitrix/modules/ipcheck_disable_d35cf5f54f4599f60b28ddf8266ffdaf', null, null), ('security', 'redirect_sid', 'kbskryr0o2ak20kethmfqtmprv9rrys3', null, null), ('socialservices', 'bitrix24net_domain', 'http://bitrix', null, null), ('socialservices', 'bitrix24net_id', 'ext.590c7524cda320.07084668', null, null), ('socialservices', 'bitrix24net_secret', '3sjsTHnlm2dThbYSuHMb9t2DD4hYGIafyQREHrHIYVQ1S50JII', null, null), ('vote', 'VOTE_DIR', '', null, null), ('vote', 'VOTE_COMPATIBLE_OLD_TEMPLATE', 'N', null, null), ('main', 'email_from', 'shog@3val.ru', null, null), ('main', 'site_personal_name', 'PRO100 - Bitrix core', null, null), ('main', 'site_copyright', 'PRO100 - Bitrix core', null, null), ('fileman', 'different_set', 'Y', null, null), ('fileman', 'menutypes', 'a:3:{s:4:\\\"left\\\";s:19:\\\"Левое меню\\\";s:3:\\\"top\\\";s:23:\\\"Верхнее меню\\\";s:6:\\\"bottom\\\";s:21:\\\"Нижнее меню\\\";}', null, 's1'), ('main', 'new_user_registration', 'N', null, null), ('socialnetwork', 'allow_tooltip', 'N', null, null), ('main', 'wizard_template_id', 'minimal', null, 's1'), ('main', 'wizard_minimal_theme_id', 'red', null, null), ('fileman', 'propstypes', 'a:4:{s:11:\"description\";s:33:\"Описание страницы\";s:8:\"keywords\";s:27:\"Ключевые слова\";s:5:\"title\";s:44:\"Заголовок окна браузера\";s:14:\"keywords_inner\";s:35:\"Продвигаемые слова\";}', null, 's1'), ('search', 'suggest_save_days', '250', null, null), ('search', 'use_tf_cache', 'Y', null, null), ('search', 'use_word_distance', 'Y', null, null), ('search', 'use_social_rating', 'Y', null, null), ('iblock', 'use_htmledit', 'Y', null, null), ('socialservices', 'auth_services', 'a:12:{s:9:\"VKontakte\";s:1:\"N\";s:8:\"MyMailRu\";s:1:\"N\";s:7:\"Twitter\";s:1:\"N\";s:8:\"Facebook\";s:1:\"N\";s:11:\"Livejournal\";s:1:\"Y\";s:12:\"YandexOpenID\";s:1:\"Y\";s:7:\"Rambler\";s:1:\"Y\";s:12:\"MailRuOpenID\";s:1:\"Y\";s:12:\"Liveinternet\";s:1:\"Y\";s:7:\"Blogger\";s:1:\"Y\";s:6:\"OpenID\";s:1:\"Y\";s:6:\"LiveID\";s:1:\"N\";}', null, null), ('photogallery', 'UF_GALLERY_SIZE', 'a:1:{i:1;a:7:{s:6:\"status\";s:4:\"done\";s:4:\"step\";i:1;s:12:\"elements_cnt\";i:13;s:14:\"element_number\";i:13;s:10:\"element_id\";s:0:\"\";s:2:\"id\";s:6:\"123456\";s:4:\"date\";s:0:\"\";}}', null, null), ('blog', 'avatar_max_size', '30000', null, null), ('blog', 'avatar_max_width', '100', null, null), ('blog', 'avatar_max_height', '100', null, null), ('blog', 'image_max_width', '600', null, null), ('blog', 'image_max_height', '600', null, null), ('blog', 'allow_alias', 'Y', null, null), ('blog', 'block_url_change', 'Y', null, null), ('blog', 'GROUP_DEFAULT_RIGHT', 'D', null, null), ('blog', 'show_ip', 'N', null, null), ('blog', 'enable_trackback', 'N', null, null), ('blog', 'allow_html', 'Y', null, null), ('main', 'wizard_firstdemo_personal_s1', 'Y', null, null), ('main', 'wizard_solution', 'personal', null, 's1'), ('fileman', 'stickers_use_hotkeys', 'N', null, null);
COMMIT;

-- ----------------------------
--  Table structure for `b_perf_cache`
-- ----------------------------
DROP TABLE IF EXISTS `b_perf_cache`;
CREATE TABLE `b_perf_cache` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `HIT_ID` int(18) DEFAULT NULL,
  `COMPONENT_ID` int(18) DEFAULT NULL,
  `NN` int(18) DEFAULT NULL,
  `CACHE_SIZE` float DEFAULT NULL,
  `OP_MODE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MODULE_NAME` text COLLATE utf8_unicode_ci,
  `COMPONENT_NAME` text COLLATE utf8_unicode_ci,
  `BASE_DIR` text COLLATE utf8_unicode_ci,
  `INIT_DIR` text COLLATE utf8_unicode_ci,
  `FILE_NAME` text COLLATE utf8_unicode_ci,
  `FILE_PATH` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_PERF_CACHE_0` (`HIT_ID`,`NN`),
  KEY `IX_B_PERF_CACHE_1` (`COMPONENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_perf_cluster`
-- ----------------------------
DROP TABLE IF EXISTS `b_perf_cluster`;
CREATE TABLE `b_perf_cluster` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `THREADS` int(11) DEFAULT NULL,
  `HITS` int(11) DEFAULT NULL,
  `ERRORS` int(11) DEFAULT NULL,
  `PAGES_PER_SECOND` float DEFAULT NULL,
  `PAGE_EXEC_TIME` float DEFAULT NULL,
  `PAGE_RESP_TIME` float DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_perf_component`
-- ----------------------------
DROP TABLE IF EXISTS `b_perf_component`;
CREATE TABLE `b_perf_component` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `HIT_ID` int(18) DEFAULT NULL,
  `NN` int(18) DEFAULT NULL,
  `CACHE_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CACHE_SIZE` int(11) DEFAULT NULL,
  `CACHE_COUNT_R` int(11) DEFAULT NULL,
  `CACHE_COUNT_W` int(11) DEFAULT NULL,
  `CACHE_COUNT_C` int(11) DEFAULT NULL,
  `COMPONENT_TIME` float DEFAULT NULL,
  `QUERIES` int(11) DEFAULT NULL,
  `QUERIES_TIME` float DEFAULT NULL,
  `COMPONENT_NAME` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_PERF_COMPONENT_0` (`HIT_ID`,`NN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_perf_error`
-- ----------------------------
DROP TABLE IF EXISTS `b_perf_error`;
CREATE TABLE `b_perf_error` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `HIT_ID` int(18) DEFAULT NULL,
  `ERRNO` int(18) DEFAULT NULL,
  `ERRSTR` text COLLATE utf8_unicode_ci,
  `ERRFILE` text COLLATE utf8_unicode_ci,
  `ERRLINE` int(18) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_PERF_ERROR_0` (`HIT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_perf_history`
-- ----------------------------
DROP TABLE IF EXISTS `b_perf_history`;
CREATE TABLE `b_perf_history` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TOTAL_MARK` float DEFAULT NULL,
  `ACCELERATOR_ENABLED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_perf_hit`
-- ----------------------------
DROP TABLE IF EXISTS `b_perf_hit`;
CREATE TABLE `b_perf_hit` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_HIT` datetime DEFAULT NULL,
  `IS_ADMIN` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REQUEST_METHOD` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SERVER_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SERVER_PORT` int(11) DEFAULT NULL,
  `SCRIPT_NAME` text COLLATE utf8_unicode_ci,
  `REQUEST_URI` text COLLATE utf8_unicode_ci,
  `INCLUDED_FILES` int(11) DEFAULT NULL,
  `MEMORY_PEAK_USAGE` int(11) DEFAULT NULL,
  `CACHE_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CACHE_SIZE` int(11) DEFAULT NULL,
  `CACHE_COUNT_R` int(11) DEFAULT NULL,
  `CACHE_COUNT_W` int(11) DEFAULT NULL,
  `CACHE_COUNT_C` int(11) DEFAULT NULL,
  `QUERIES` int(11) DEFAULT NULL,
  `QUERIES_TIME` float DEFAULT NULL,
  `COMPONENTS` int(11) DEFAULT NULL,
  `COMPONENTS_TIME` float DEFAULT NULL,
  `SQL_LOG` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PAGE_TIME` float DEFAULT NULL,
  `PROLOG_TIME` float DEFAULT NULL,
  `PROLOG_BEFORE_TIME` float DEFAULT NULL,
  `AGENTS_TIME` float DEFAULT NULL,
  `PROLOG_AFTER_TIME` float DEFAULT NULL,
  `WORK_AREA_TIME` float DEFAULT NULL,
  `EPILOG_TIME` float DEFAULT NULL,
  `EPILOG_BEFORE_TIME` float DEFAULT NULL,
  `EVENTS_TIME` float DEFAULT NULL,
  `EPILOG_AFTER_TIME` float DEFAULT NULL,
  `MENU_RECALC` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_PERF_HIT_0` (`DATE_HIT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_perf_index_ban`
-- ----------------------------
DROP TABLE IF EXISTS `b_perf_index_ban`;
CREATE TABLE `b_perf_index_ban` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BAN_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TABLE_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COLUMN_NAMES` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_perf_index_complete`
-- ----------------------------
DROP TABLE IF EXISTS `b_perf_index_complete`;
CREATE TABLE `b_perf_index_complete` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BANNED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TABLE_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COLUMN_NAMES` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INDEX_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_perf_index_complete_0` (`TABLE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_perf_index_suggest`
-- ----------------------------
DROP TABLE IF EXISTS `b_perf_index_suggest`;
CREATE TABLE `b_perf_index_suggest` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SQL_MD5` char(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SQL_COUNT` int(11) DEFAULT NULL,
  `SQL_TIME` float DEFAULT NULL,
  `TABLE_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TABLE_ALIAS` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COLUMN_NAMES` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SQL_TEXT` text COLLATE utf8_unicode_ci,
  `SQL_EXPLAIN` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `ix_b_perf_index_suggest_0` (`SQL_MD5`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_perf_index_suggest_sql`
-- ----------------------------
DROP TABLE IF EXISTS `b_perf_index_suggest_sql`;
CREATE TABLE `b_perf_index_suggest_sql` (
  `SUGGEST_ID` int(11) NOT NULL DEFAULT '0',
  `SQL_ID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`SUGGEST_ID`,`SQL_ID`),
  KEY `ix_b_perf_index_suggest_sql_0` (`SQL_ID`,`SUGGEST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_perf_sql`
-- ----------------------------
DROP TABLE IF EXISTS `b_perf_sql`;
CREATE TABLE `b_perf_sql` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `HIT_ID` int(18) DEFAULT NULL,
  `COMPONENT_ID` int(18) DEFAULT NULL,
  `NN` int(18) DEFAULT NULL,
  `QUERY_TIME` float DEFAULT NULL,
  `NODE_ID` int(18) DEFAULT NULL,
  `MODULE_NAME` text COLLATE utf8_unicode_ci,
  `COMPONENT_NAME` text COLLATE utf8_unicode_ci,
  `SQL_TEXT` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_PERF_SQL_0` (`HIT_ID`,`NN`),
  KEY `IX_B_PERF_SQL_1` (`COMPONENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_perf_sql_backtrace`
-- ----------------------------
DROP TABLE IF EXISTS `b_perf_sql_backtrace`;
CREATE TABLE `b_perf_sql_backtrace` (
  `SQL_ID` int(18) NOT NULL DEFAULT '0',
  `NN` int(18) NOT NULL DEFAULT '0',
  `FILE_NAME` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LINE_NO` int(18) DEFAULT NULL,
  `CLASS_NAME` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FUNCTION_NAME` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`SQL_ID`,`NN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_perf_tab_column_stat`
-- ----------------------------
DROP TABLE IF EXISTS `b_perf_tab_column_stat`;
CREATE TABLE `b_perf_tab_column_stat` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TABLE_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COLUMN_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TABLE_ROWS` float DEFAULT NULL,
  `COLUMN_ROWS` float DEFAULT NULL,
  `VALUE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_perf_tab_column_stat` (`TABLE_NAME`,`COLUMN_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_perf_tab_stat`
-- ----------------------------
DROP TABLE IF EXISTS `b_perf_tab_stat`;
CREATE TABLE `b_perf_tab_stat` (
  `TABLE_NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `TABLE_SIZE` float DEFAULT NULL,
  `TABLE_ROWS` float DEFAULT NULL,
  PRIMARY KEY (`TABLE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_perf_test`
-- ----------------------------
DROP TABLE IF EXISTS `b_perf_test`;
CREATE TABLE `b_perf_test` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `REFERENCE_ID` int(18) DEFAULT NULL,
  `NAME` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_PERF_TEST_0` (`REFERENCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_posting`
-- ----------------------------
DROP TABLE IF EXISTS `b_posting`;
CREATE TABLE `b_posting` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `STATUS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'D',
  `VERSION` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATE_SENT` datetime DEFAULT NULL,
  `SENT_BCC` mediumtext COLLATE utf8_unicode_ci,
  `FROM_FIELD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TO_FIELD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BCC_FIELD` mediumtext COLLATE utf8_unicode_ci,
  `EMAIL_FILTER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SUBJECT` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `BODY_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `BODY` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `DIRECT_SEND` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `CHARSET` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MSG_CHARSET` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SUBSCR_FORMAT` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ERROR_EMAIL` mediumtext COLLATE utf8_unicode_ci,
  `AUTO_SEND_TIME` datetime DEFAULT NULL,
  `BCC_TO_SEND` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_posting_email`
-- ----------------------------
DROP TABLE IF EXISTS `b_posting_email`;
CREATE TABLE `b_posting_email` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `POSTING_ID` int(11) NOT NULL,
  `STATUS` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `EMAIL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SUBSCRIPTION_ID` int(11) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_posting_email_status` (`POSTING_ID`,`STATUS`),
  KEY `ix_posting_email_email` (`POSTING_ID`,`EMAIL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_posting_file`
-- ----------------------------
DROP TABLE IF EXISTS `b_posting_file`;
CREATE TABLE `b_posting_file` (
  `POSTING_ID` int(11) NOT NULL,
  `FILE_ID` int(11) NOT NULL,
  UNIQUE KEY `UK_POSTING_POSTING_FILE` (`POSTING_ID`,`FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_posting_group`
-- ----------------------------
DROP TABLE IF EXISTS `b_posting_group`;
CREATE TABLE `b_posting_group` (
  `POSTING_ID` int(11) NOT NULL,
  `GROUP_ID` int(11) NOT NULL,
  UNIQUE KEY `UK_POSTING_POSTING_GROUP` (`POSTING_ID`,`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_posting_rubric`
-- ----------------------------
DROP TABLE IF EXISTS `b_posting_rubric`;
CREATE TABLE `b_posting_rubric` (
  `POSTING_ID` int(11) NOT NULL,
  `LIST_RUBRIC_ID` int(11) NOT NULL,
  UNIQUE KEY `UK_POSTING_POSTING_RUBRIC` (`POSTING_ID`,`LIST_RUBRIC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_rating`
-- ----------------------------
DROP TABLE IF EXISTS `b_rating`;
CREATE TABLE `b_rating` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CALCULATION_METHOD` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'SUM',
  `CREATED` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `LAST_CALCULATED` datetime DEFAULT NULL,
  `POSITION` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `AUTHORITY` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `CALCULATED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `CONFIGS` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `b_rating`
-- ----------------------------
BEGIN;
INSERT INTO `b_rating` VALUES ('1', 'N', 'Рейтинг', 'USER', 'SUM', '2017-05-05 16:49:53', null, null, 'Y', 'N', 'N', 'a:3:{s:4:\"MAIN\";a:2:{s:4:\"VOTE\";a:1:{s:4:\"USER\";a:2:{s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:2:\"30\";}}s:6:\"RATING\";a:1:{s:5:\"BONUS\";a:2:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:1:\"1\";}}}s:5:\"FORUM\";a:2:{s:4:\"VOTE\";a:2:{s:5:\"TOPIC\";a:3:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:3:\"0.5\";s:5:\"LIMIT\";s:2:\"30\";}s:4:\"POST\";a:3:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:3:\"0.1\";s:5:\"LIMIT\";s:2:\"30\";}}s:6:\"RATING\";a:1:{s:8:\"ACTIVITY\";a:9:{s:6:\"ACTIVE\";s:1:\"Y\";s:16:\"TODAY_TOPIC_COEF\";s:3:\"0.4\";s:15:\"WEEK_TOPIC_COEF\";s:3:\"0.2\";s:16:\"MONTH_TOPIC_COEF\";s:3:\"0.1\";s:14:\"ALL_TOPIC_COEF\";s:1:\"0\";s:15:\"TODAY_POST_COEF\";s:3:\"0.2\";s:14:\"WEEK_POST_COEF\";s:3:\"0.1\";s:15:\"MONTH_POST_COEF\";s:4:\"0.05\";s:13:\"ALL_POST_COEF\";s:1:\"0\";}}}s:4:\"BLOG\";a:2:{s:4:\"VOTE\";a:2:{s:4:\"POST\";a:3:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:3:\"0.5\";s:5:\"LIMIT\";s:2:\"30\";}s:7:\"COMMENT\";a:3:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:3:\"0.1\";s:5:\"LIMIT\";s:2:\"30\";}}s:6:\"RATING\";a:1:{s:8:\"ACTIVITY\";a:9:{s:6:\"ACTIVE\";s:1:\"Y\";s:15:\"TODAY_POST_COEF\";s:3:\"0.4\";s:14:\"WEEK_POST_COEF\";s:3:\"0.2\";s:15:\"MONTH_POST_COEF\";s:3:\"0.1\";s:13:\"ALL_POST_COEF\";s:1:\"0\";s:18:\"TODAY_COMMENT_COEF\";s:3:\"0.2\";s:17:\"WEEK_COMMENT_COEF\";s:3:\"0.1\";s:18:\"MONTH_COMMENT_COEF\";s:4:\"0.05\";s:16:\"ALL_COMMENT_COEF\";s:1:\"0\";}}}}'), ('2', 'N', 'Авторитет', 'USER', 'SUM', '2017-05-05 16:49:53', null, null, 'Y', 'Y', 'N', 'a:3:{s:4:\"MAIN\";a:2:{s:4:\"VOTE\";a:1:{s:4:\"USER\";a:3:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:1:\"0\";}}s:6:\"RATING\";a:1:{s:5:\"BONUS\";a:2:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:1:\"1\";}}}s:5:\"FORUM\";a:2:{s:4:\"VOTE\";a:2:{s:5:\"TOPIC\";a:2:{s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:2:\"30\";}s:4:\"POST\";a:2:{s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:2:\"30\";}}s:6:\"RATING\";a:1:{s:8:\"ACTIVITY\";a:8:{s:16:\"TODAY_TOPIC_COEF\";s:2:\"20\";s:15:\"WEEK_TOPIC_COEF\";s:2:\"10\";s:16:\"MONTH_TOPIC_COEF\";s:1:\"5\";s:14:\"ALL_TOPIC_COEF\";s:1:\"0\";s:15:\"TODAY_POST_COEF\";s:3:\"0.4\";s:14:\"WEEK_POST_COEF\";s:3:\"0.2\";s:15:\"MONTH_POST_COEF\";s:3:\"0.1\";s:13:\"ALL_POST_COEF\";s:1:\"0\";}}}s:4:\"BLOG\";a:2:{s:4:\"VOTE\";a:2:{s:4:\"POST\";a:2:{s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:2:\"30\";}s:7:\"COMMENT\";a:2:{s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:2:\"30\";}}s:6:\"RATING\";a:1:{s:8:\"ACTIVITY\";a:8:{s:15:\"TODAY_POST_COEF\";s:3:\"0.4\";s:14:\"WEEK_POST_COEF\";s:3:\"0.2\";s:15:\"MONTH_POST_COEF\";s:3:\"0.1\";s:13:\"ALL_POST_COEF\";s:1:\"0\";s:18:\"TODAY_COMMENT_COEF\";s:3:\"0.2\";s:17:\"WEEK_COMMENT_COEF\";s:3:\"0.1\";s:18:\"MONTH_COMMENT_COEF\";s:4:\"0.05\";s:16:\"ALL_COMMENT_COEF\";s:1:\"0\";}}}}');
COMMIT;

-- ----------------------------
--  Table structure for `b_rating_component`
-- ----------------------------
DROP TABLE IF EXISTS `b_rating_component`;
CREATE TABLE `b_rating_component` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_ID` int(11) NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ENTITY_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `RATING_TYPE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `COMPLEX_NAME` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `CLASS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CALC_METHOD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `EXCEPTION_METHOD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `LAST_CALCULATED` datetime DEFAULT NULL,
  `NEXT_CALCULATION` datetime DEFAULT NULL,
  `REFRESH_INTERVAL` int(11) NOT NULL,
  `CONFIG` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `IX_RATING_ID_1` (`RATING_ID`,`ACTIVE`,`NEXT_CALCULATION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_rating_component_results`
-- ----------------------------
DROP TABLE IF EXISTS `b_rating_component_results`;
CREATE TABLE `b_rating_component_results` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_ID` int(11) NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `RATING_TYPE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `COMPLEX_NAME` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `CURRENT_VALUE` decimal(18,4) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_ENTITY_TYPE_ID` (`ENTITY_TYPE_ID`),
  KEY `IX_COMPLEX_NAME` (`COMPLEX_NAME`),
  KEY `IX_RATING_ID_2` (`RATING_ID`,`COMPLEX_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_rating_prepare`
-- ----------------------------
DROP TABLE IF EXISTS `b_rating_prepare`;
CREATE TABLE `b_rating_prepare` (
  `ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_rating_results`
-- ----------------------------
DROP TABLE IF EXISTS `b_rating_results`;
CREATE TABLE `b_rating_results` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_ID` int(11) NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `CURRENT_VALUE` decimal(18,4) DEFAULT NULL,
  `PREVIOUS_VALUE` decimal(18,4) DEFAULT NULL,
  `CURRENT_POSITION` int(11) DEFAULT '0',
  `PREVIOUS_POSITION` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IX_RATING_3` (`RATING_ID`,`ENTITY_TYPE_ID`,`ENTITY_ID`),
  KEY `IX_RATING_4` (`RATING_ID`,`ENTITY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_rating_rule`
-- ----------------------------
DROP TABLE IF EXISTS `b_rating_rule`;
CREATE TABLE `b_rating_rule` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `NAME` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CONDITION_NAME` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `CONDITION_MODULE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONDITION_CLASS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CONDITION_METHOD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CONDITION_CONFIG` text COLLATE utf8_unicode_ci,
  `ACTION_NAME` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `ACTION_CONFIG` text COLLATE utf8_unicode_ci,
  `ACTIVATE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ACTIVATE_CLASS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVATE_METHOD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DEACTIVATE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DEACTIVATE_CLASS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DEACTIVATE_METHOD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CREATED` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `LAST_APPLIED` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `b_rating_rule`
-- ----------------------------
BEGIN;
INSERT INTO `b_rating_rule` VALUES ('1', 'N', 'Добавление в группу пользователей, имеющих право голосовать за рейтинг', 'USER', 'AUTHORITY', null, 'CRatingRulesMain', 'ratingCheck', 'a:1:{s:9:\"AUTHORITY\";a:2:{s:16:\"RATING_CONDITION\";i:1;s:12:\"RATING_VALUE\";i:1;}}', 'ADD_TO_GROUP', 'a:1:{s:12:\"ADD_TO_GROUP\";a:1:{s:8:\"GROUP_ID\";s:1:\"3\";}}', 'N', 'CRatingRulesMain', 'addToGroup', 'N', 'CRatingRulesMain ', 'addToGroup', '2017-05-05 16:49:53', '2017-05-05 16:49:53', null), ('2', 'N', 'Удаление из группы пользователей, не имеющих права голосовать за рейтинг', 'USER', 'AUTHORITY', null, 'CRatingRulesMain', 'ratingCheck', 'a:1:{s:9:\"AUTHORITY\";a:2:{s:16:\"RATING_CONDITION\";i:2;s:12:\"RATING_VALUE\";i:1;}}', 'REMOVE_FROM_GROUP', 'a:1:{s:17:\"REMOVE_FROM_GROUP\";a:1:{s:8:\"GROUP_ID\";s:1:\"3\";}}', 'N', 'CRatingRulesMain', 'removeFromGroup', 'N', 'CRatingRulesMain ', 'removeFromGroup', '2017-05-05 16:49:53', '2017-05-05 16:49:53', null), ('3', 'N', 'Добавление в группу пользователей, имеющих право голосовать за авторитет', 'USER', 'AUTHORITY', null, 'CRatingRulesMain', 'ratingCheck', 'a:1:{s:9:\"AUTHORITY\";a:2:{s:16:\"RATING_CONDITION\";i:1;s:12:\"RATING_VALUE\";i:2;}}', 'ADD_TO_GROUP', 'a:1:{s:12:\"ADD_TO_GROUP\";a:1:{s:8:\"GROUP_ID\";s:1:\"4\";}}', 'N', 'CRatingRulesMain', 'addToGroup', 'N', 'CRatingRulesMain ', 'addToGroup', '2017-05-05 16:49:53', '2017-05-05 16:49:53', null), ('4', 'N', 'Удаление из группы пользователей, не имеющих права голосовать за авторитет', 'USER', 'AUTHORITY', null, 'CRatingRulesMain', 'ratingCheck', 'a:1:{s:9:\"AUTHORITY\";a:2:{s:16:\"RATING_CONDITION\";i:2;s:12:\"RATING_VALUE\";i:2;}}', 'REMOVE_FROM_GROUP', 'a:1:{s:17:\"REMOVE_FROM_GROUP\";a:1:{s:8:\"GROUP_ID\";s:1:\"4\";}}', 'N', 'CRatingRulesMain', 'removeFromGroup', 'N', 'CRatingRulesMain ', 'removeFromGroup', '2017-05-05 16:49:53', '2017-05-05 16:49:53', null), ('5', 'Y', 'Автоматическое голосование за авторитет пользователя', 'USER', 'VOTE', null, 'CRatingRulesMain', 'voteCheck', 'a:1:{s:4:\"VOTE\";a:6:{s:10:\"VOTE_LIMIT\";i:90;s:11:\"VOTE_RESULT\";i:10;s:16:\"VOTE_FORUM_TOPIC\";d:0.5;s:15:\"VOTE_FORUM_POST\";d:0.1000000000000000055511151231257827021181583404541015625;s:14:\"VOTE_BLOG_POST\";d:0.5;s:17:\"VOTE_BLOG_COMMENT\";d:0.1000000000000000055511151231257827021181583404541015625;}}', 'empty', 'a:0:{}', 'N', 'empty', 'empty', 'N', 'empty ', 'empty', '2017-05-05 16:49:53', '2017-05-05 16:49:53', null);
COMMIT;

-- ----------------------------
--  Table structure for `b_rating_rule_vetting`
-- ----------------------------
DROP TABLE IF EXISTS `b_rating_rule_vetting`;
CREATE TABLE `b_rating_rule_vetting` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RULE_ID` int(11) NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `ACTIVATE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `APPLIED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `RULE_ID` (`RULE_ID`,`ENTITY_TYPE_ID`,`ENTITY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_rating_user`
-- ----------------------------
DROP TABLE IF EXISTS `b_rating_user`;
CREATE TABLE `b_rating_user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_ID` int(11) NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `BONUS` decimal(18,4) DEFAULT '0.0000',
  `VOTE_WEIGHT` decimal(18,4) DEFAULT '0.0000',
  `VOTE_COUNT` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `RATING_ID` (`RATING_ID`,`ENTITY_ID`),
  KEY `IX_B_RAT_USER_2` (`ENTITY_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `b_rating_user`
-- ----------------------------
BEGIN;
INSERT INTO `b_rating_user` VALUES ('1', '2', '1', '3.0000', '30.0000', '13');
COMMIT;

-- ----------------------------
--  Table structure for `b_rating_vote`
-- ----------------------------
DROP TABLE IF EXISTS `b_rating_vote`;
CREATE TABLE `b_rating_vote` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_VOTING_ID` int(11) NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `OWNER_ID` int(11) NOT NULL,
  `VALUE` decimal(18,4) NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `CREATED` datetime NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `USER_IP` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_RAT_VOTE_ID` (`RATING_VOTING_ID`,`USER_ID`),
  KEY `IX_RAT_VOTE_ID_2` (`ENTITY_TYPE_ID`,`ENTITY_ID`,`USER_ID`),
  KEY `IX_RAT_VOTE_ID_3` (`OWNER_ID`,`CREATED`),
  KEY `IX_RAT_VOTE_ID_4` (`USER_ID`),
  KEY `IX_RAT_VOTE_ID_5` (`CREATED`,`VALUE`),
  KEY `IX_RAT_VOTE_ID_6` (`ACTIVE`),
  KEY `IX_RAT_VOTE_ID_7` (`RATING_VOTING_ID`,`CREATED`),
  KEY `IX_RAT_VOTE_ID_8` (`ENTITY_TYPE_ID`,`CREATED`),
  KEY `IX_RAT_VOTE_ID_9` (`CREATED`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_rating_vote_group`
-- ----------------------------
DROP TABLE IF EXISTS `b_rating_vote_group`;
CREATE TABLE `b_rating_vote_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `GROUP_ID` int(11) NOT NULL,
  `TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `RATING_ID` (`GROUP_ID`,`TYPE`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `b_rating_vote_group`
-- ----------------------------
BEGIN;
INSERT INTO `b_rating_vote_group` VALUES ('5', '1', 'A'), ('1', '1', 'R'), ('3', '1', 'R'), ('2', '3', 'R'), ('4', '3', 'R'), ('6', '4', 'A');
COMMIT;

-- ----------------------------
--  Table structure for `b_rating_voting`
-- ----------------------------
DROP TABLE IF EXISTS `b_rating_voting`;
CREATE TABLE `b_rating_voting` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `OWNER_ID` int(11) NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `CREATED` datetime DEFAULT NULL,
  `LAST_CALCULATED` datetime DEFAULT NULL,
  `TOTAL_VALUE` decimal(18,4) NOT NULL,
  `TOTAL_VOTES` int(11) NOT NULL,
  `TOTAL_POSITIVE_VOTES` int(11) NOT NULL,
  `TOTAL_NEGATIVE_VOTES` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_ENTITY_TYPE_ID_2` (`ENTITY_TYPE_ID`,`ENTITY_ID`,`ACTIVE`),
  KEY `IX_ENTITY_TYPE_ID_4` (`TOTAL_VALUE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_rating_voting_prepare`
-- ----------------------------
DROP TABLE IF EXISTS `b_rating_voting_prepare`;
CREATE TABLE `b_rating_voting_prepare` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_VOTING_ID` int(11) NOT NULL,
  `TOTAL_VALUE` decimal(18,4) NOT NULL,
  `TOTAL_VOTES` int(11) NOT NULL,
  `TOTAL_POSITIVE_VOTES` int(11) NOT NULL,
  `TOTAL_NEGATIVE_VOTES` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_RATING_VOTING_ID` (`RATING_VOTING_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_rating_weight`
-- ----------------------------
DROP TABLE IF EXISTS `b_rating_weight`;
CREATE TABLE `b_rating_weight` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_FROM` decimal(18,4) NOT NULL,
  `RATING_TO` decimal(18,4) NOT NULL,
  `WEIGHT` decimal(18,4) DEFAULT '0.0000',
  `COUNT` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `b_rating_weight`
-- ----------------------------
BEGIN;
INSERT INTO `b_rating_weight` VALUES ('1', '-1000000.0000', '1000000.0000', '1.0000', '10');
COMMIT;

-- ----------------------------
--  Table structure for `b_search_content`
-- ----------------------------
DROP TABLE IF EXISTS `b_search_content`;
CREATE TABLE `b_search_content` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_CHANGE` datetime NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ITEM_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CUSTOM_RANK` int(11) NOT NULL DEFAULT '0',
  `USER_ID` int(11) DEFAULT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ENTITY_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL` text COLLATE utf8_unicode_ci,
  `TITLE` text COLLATE utf8_unicode_ci,
  `BODY` longtext COLLATE utf8_unicode_ci,
  `TAGS` text COLLATE utf8_unicode_ci,
  `PARAM1` text COLLATE utf8_unicode_ci,
  `PARAM2` text COLLATE utf8_unicode_ci,
  `UPD` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATE_FROM` datetime DEFAULT NULL,
  `DATE_TO` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_B_SEARCH_CONTENT` (`MODULE_ID`,`ITEM_ID`),
  KEY `IX_B_SEARCH_CONTENT_1` (`MODULE_ID`,`PARAM1`(50),`PARAM2`(50)),
  KEY `IX_B_SEARCH_CONTENT_2` (`ENTITY_ID`(50),`ENTITY_TYPE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_search_content_freq`
-- ----------------------------
DROP TABLE IF EXISTS `b_search_content_freq`;
CREATE TABLE `b_search_content_freq` (
  `STEM` int(11) NOT NULL DEFAULT '0',
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FREQ` float DEFAULT NULL,
  `TF` float DEFAULT NULL,
  UNIQUE KEY `UX_B_SEARCH_CONTENT_FREQ` (`STEM`,`LANGUAGE_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_search_content_param`
-- ----------------------------
DROP TABLE IF EXISTS `b_search_content_param`;
CREATE TABLE `b_search_content_param` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `PARAM_NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `PARAM_VALUE` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  KEY `IX_B_SEARCH_CONTENT_PARAM` (`SEARCH_CONTENT_ID`,`PARAM_NAME`),
  KEY `IX_B_SEARCH_CONTENT_PARAM_1` (`PARAM_NAME`,`PARAM_VALUE`(50),`SEARCH_CONTENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_search_content_right`
-- ----------------------------
DROP TABLE IF EXISTS `b_search_content_right`;
CREATE TABLE `b_search_content_right` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `GROUP_CODE` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `UX_B_SEARCH_CONTENT_RIGHT` (`SEARCH_CONTENT_ID`,`GROUP_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_search_content_site`
-- ----------------------------
DROP TABLE IF EXISTS `b_search_content_site`;
CREATE TABLE `b_search_content_site` (
  `SEARCH_CONTENT_ID` int(18) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `URL` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`SEARCH_CONTENT_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_search_content_stem`
-- ----------------------------
DROP TABLE IF EXISTS `b_search_content_stem`;
CREATE TABLE `b_search_content_stem` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `STEM` int(11) NOT NULL,
  `TF` float NOT NULL,
  `PS` float NOT NULL,
  UNIQUE KEY `UX_B_SEARCH_CONTENT_STEM` (`STEM`,`LANGUAGE_ID`,`TF`,`PS`,`SEARCH_CONTENT_ID`),
  KEY `IND_B_SEARCH_CONTENT_STEM` (`SEARCH_CONTENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci DELAY_KEY_WRITE=1;

-- ----------------------------
--  Table structure for `b_search_content_text`
-- ----------------------------
DROP TABLE IF EXISTS `b_search_content_text`;
CREATE TABLE `b_search_content_text` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `SEARCH_CONTENT_MD5` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `SEARCHABLE_CONTENT` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`SEARCH_CONTENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_search_content_title`
-- ----------------------------
DROP TABLE IF EXISTS `b_search_content_title`;
CREATE TABLE `b_search_content_title` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `POS` int(11) NOT NULL,
  `WORD` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `UX_B_SEARCH_CONTENT_TITLE` (`SITE_ID`,`WORD`,`SEARCH_CONTENT_ID`,`POS`),
  KEY `IND_B_SEARCH_CONTENT_TITLE` (`SEARCH_CONTENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci DELAY_KEY_WRITE=1;

-- ----------------------------
--  Table structure for `b_search_custom_rank`
-- ----------------------------
DROP TABLE IF EXISTS `b_search_custom_rank`;
CREATE TABLE `b_search_custom_rank` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `APPLIED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `RANK` int(11) NOT NULL DEFAULT '0',
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE_ID` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `PARAM1` text COLLATE utf8_unicode_ci,
  `PARAM2` text COLLATE utf8_unicode_ci,
  `ITEM_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IND_B_SEARCH_CUSTOM_RANK` (`SITE_ID`,`MODULE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_search_phrase`
-- ----------------------------
DROP TABLE IF EXISTS `b_search_phrase`;
CREATE TABLE `b_search_phrase` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` datetime NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `RESULT_COUNT` int(11) NOT NULL,
  `PAGES` int(11) NOT NULL,
  `SESSION_ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `PHRASE` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TAGS` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL_TO` text COLLATE utf8_unicode_ci,
  `URL_TO_404` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL_TO_SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STAT_SESS_ID` int(18) DEFAULT NULL,
  `EVENT1` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IND_PK_B_SEARCH_PHRASE_SESS_PH` (`SESSION_ID`,`PHRASE`(50)),
  KEY `IND_PK_B_SEARCH_PHRASE_SESS_TG` (`SESSION_ID`,`TAGS`(50)),
  KEY `IND_PK_B_SEARCH_PHRASE_TIME` (`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_search_stem`
-- ----------------------------
DROP TABLE IF EXISTS `b_search_stem`;
CREATE TABLE `b_search_stem` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `STEM` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_B_SEARCH_STEM` (`STEM`)
) ENGINE=InnoDB AUTO_INCREMENT=641 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `b_search_stem`
-- ----------------------------
BEGIN;
INSERT INTO `b_search_stem` VALUES ('593', '00'), ('362', '100'), ('508', '12'), ('8', '13'), ('43', '15'), ('9', '18'), ('580', '2000'), ('352', '22'), ('10', '25'), ('279', '300'), ('11', '36'), ('12', '38'), ('13', '40'), ('14', '46'), ('15', '48'), ('16', '50'), ('321', '560'), ('194', 'IBICA'), ('7', 'JPG'), ('20', 'NAOKI'), ('19', 'NOA'), ('24', 'S1'), ('193', 'SEAT'), ('191', 'АВТ'), ('573', 'АГЕНТСТВ'), ('530', 'АЛЬП'), ('298', 'АНАЛИЗ'), ('215', 'АНАЛИЗИРУ'), ('224', 'АНГЛИЙСК'), ('259', 'АНГЛОЯЗЫЧН'), ('210', 'АНДОРР'), ('202', 'АПАРТАМЕНТ'), ('201', 'АРЕНД'), ('308', 'АРЕНДОДАТЕЛ'), ('551', 'АЭРОПОРТ'), ('392', 'БАГАЖНИК'), ('42', 'БАЙК'), ('323', 'БАК'), ('61', 'БАНСА'), ('577', 'БАР'), ('365', 'БАРСЕЛОН'), ('376', 'БЕНЗИН'), ('479', 'БЕРГАМ'), ('134', 'БЛИЖАЙШ'), ('17', 'БЛОГ'), ('166', 'БОГ'), ('165', 'БОГОВ'), ('176', 'БОЖЕСТВ'), ('540', 'БОЛ'), ('218', 'БОЛЬШ'), ('431', 'БУД'), ('220', 'БУДЕТ'), ('547', 'БУДУЧ'), ('452', 'БУДУЩ'), ('482', 'ВАРИАНТ'), ('520', 'ВЕ'), ('404', 'ВЕДЕТ'), ('394', 'ВЕЛ'), ('267', 'ВЕЛИК'), ('624', 'ВЕЛОМАНЬЯК'), ('623', 'ВЕЛОМАНЬЯКОВ'), ('582', 'ВЕЛОПРОБЕГ'), ('584', 'ВЕЛОСИПЕД'), ('322', 'ВЕРНУЛ'), ('515', 'ВЕРХН'), ('523', 'ВЕРШИН'), ('79', 'ВЕСЬМ'), ('45', 'ВЕТЕРК'), ('153', 'ВЗНОС'), ('152', 'ВЗНОСОВ'), ('38', 'ВЗЯВ'), ('451', 'ВЗЯЛ'), ('463', 'ВЗЯТ'), ('139', 'ВИД'), ('556', 'ВИДЕЛ'), ('142', 'ВЛАДЕЛЕЦ'), ('242', 'ВЛЕТЕТ'), ('454', 'ВНИМАТЕЛЬН'), ('314', 'ВНОС'), ('174', 'ВНУТРЕН'), ('85', 'ВОД'), ('598', 'ВОДИТЕЛ'), ('337', 'ВОЗВРАТ'), ('529', 'ВОЗДУХ'), ('570', 'ВОЗМОЖН'), ('548', 'ВООБЩ'), ('200', 'ВОПРОС'), ('486', 'ВОСКРЕСЕН'), ('251', 'ВОСПОЛЬЗОВА'), ('329', 'ВОШЛ'), ('66', 'ВПЕРВ'), ('591', 'ВПЕРЕД'), ('616', 'ВПЕЧАТЛЕН'), ('123', 'ВПЕЧАТЛЯ'), ('348', 'ВПОСЛЕДСТВ'), ('430', 'ВПРЕД'), ('496', 'ВРЕМЕН'), ('625', 'ВСЕГ'), ('460', 'ВСЕГД'), ('199', 'ВСТАЛ'), ('400', 'ВТОР'), ('456', 'ВЫБОР'), ('380', 'ВЫБРА'), ('453', 'ВЫВОД'), ('212', 'ВЫГЛЯДЕЛ'), ('300', 'ВЫГОДН'), ('2', 'ВЫЕЗД'), ('354', 'ВЫИГРА'), ('167', 'ВЫПОЛН'), ('75', 'ВЫПУСК'), ('316', 'ВЫСВОБОД'), ('263', 'ВЫСОТ'), ('550', 'ВЫХОД'), ('161', 'ГИД'), ('274', 'ГЛАВН'), ('564', 'ГОВОР'), ('629', 'ГОНЩИК'), ('462', 'ГОР'), ('383', 'ГОРОД'), ('503', 'ГОРОДК'), ('549', 'ГОРОДОВ'), ('607', 'ГРУПП'), ('350', 'ДАВА'), ('587', 'ДАВН'), ('569', 'ДАЕТ'), ('589', 'ДАЛЬН'), ('389', 'ДВИЖК'), ('471', 'ДВУХ'), ('476', 'ДЕВУШК'), ('368', 'ДЕЛА'), ('560', 'ДЕМОКРАТИЧН'), ('4', 'ДЕН'), ('275', 'ДЕНЕГ'), ('315', 'ДЕНЬГ'), ('302', 'ДЕПОЗ'), ('335', 'ДЕПОЗИТ'), ('55', 'ДЕРЕВ'), ('269', 'ДЕТАЛЬН'), ('260', 'ДЕШЕВЛ'), ('405', 'ДИНАМИК'), ('281', 'ДНЕ'), ('512', 'ДНЯ'), ('35', 'ДОБРА'), ('347', 'ДОВОЛЬН'), ('307', 'ДОГОВОР'), ('301', 'ДОГОВОРЕН'), ('610', 'ДОЛГ'), ('146', 'ДОЛЛАР'), ('145', 'ДОЛЛАРОВ'), ('505', 'ДОЛЬШ'), ('386', 'ДОМ'), ('374', 'ДОПОЛНИТЕЛЬН'), ('378', 'ДОРОГ'), ('278', 'ДОРОЖ'), ('483', 'ДОСИДЕТ'), ('470', 'ДОСТАТОЧН'), ('229', 'ДРУГ'), ('357', 'ДУМА'), ('532', 'ДЫША'), ('280', 'ЕВР'), ('422', 'ЕВРОП'), ('637', 'ЕЗД'), ('494', 'ЕХА'), ('466', 'ЖАЛЕТ'), ('421', 'ЖАНР'), ('317', 'ЖДЕМ'), ('207', 'ЖЕЛАН'), ('121', 'ЖИВ'), ('205', 'ЖИРОН'), ('391', 'ЗАБИТ'), ('390', 'ЗАГРУЖЕН'), ('293', 'ЗАДН'), ('234', 'ЗАКАЗ'), ('282', 'ЗАКАЗЫВ'), ('258', 'ЗАКАЗЫВА'), ('179', 'ЗАЛ'), ('297', 'ЗАЛЕЗА'), ('96', 'ЗАНИМА'), ('104', 'ЗАНЯТ'), ('140', 'ЗАПАД'), ('433', 'ЗАПЛАТ'), ('185', 'ЗАПОМИНА'), ('26', 'ЗАРИСОВК'), ('91', 'ЗДЕ'), ('615', 'ЗДОРОВ'), ('639', 'ЗЕЛЕНОГРАДСК'), ('632', 'ЗЕРКА'), ('450', 'ЗНАЛ'), ('223', 'ЗНАН'), ('326', 'ЗНАЧЕН'), ('292', 'ИБИЦ'), ('154', 'ИДЕ'), ('155', 'ИДЕАЛИСТИЧЕСК'), ('312', 'ИЗВЕСТН'), ('418', 'ИЗВОРАЧИВА'), ('417', 'ИЗГИБА'), ('583', 'ИМЕ'), ('325', 'ИМЕЕТ'), ('164', 'ИМЕЮТ'), ('384', 'ИМЕЮЩ'), ('186', 'ИНГЛИШ'), ('138', 'ИНД'), ('233', 'ИНТЕРФЕЙС'), ('192', 'ИСПАН'), ('238', 'ИСПАНСК'), ('631', 'ИСПОЛЬЗОВА'), ('128', 'ИСТИН'), ('545', 'ИТАЛ'), ('478', 'ИТАЛЬЯНСК'), ('487', 'ИТАЛЬЯНЦ'), ('288', 'КА'), ('393', 'КАВКАЗ'), ('169', 'КАЖД'), ('565', 'КАКИХ-Т'), ('243', 'КАКУЮ-Т'), ('638', 'КАЛИНИНГРАД'), ('136', 'КАМБОДЖ'), ('29', 'КАМН'), ('473', 'КАНИКУЛ'), ('303', 'КЕШ'), ('446', 'КИЛОМЕТРАЖ'), ('137', 'КИТ'), ('285', 'КЛАСС'), ('420', 'КЛАССИК'), ('596', 'КОЛЛЕКТ'), ('603', 'КОЛОН'), ('594', 'КОМАНД'), ('22', 'КОММЕНТАР'), ('21', 'КОММЕНТАРИЕВ'), ('6', 'КОМПАН'), ('81', 'КОМПОЗИЦ'), ('289', 'КОНЕЧН'), ('241', 'КОНТОР'), ('171', 'КОНЦ'), ('170', 'КОНЦОВ'), ('90', 'КОРМ'), ('1', 'КОРПОРАТИВН'), ('296', 'КОРЯЧ'), ('3', 'КОС'), ('305', 'КОТОР'), ('47', 'КРАСИВ'), ('120', 'КРАСОТ'), ('522', 'КРЕПОСТ'), ('168', 'КРЕСТ'), ('109', 'КРОКОД'), ('98', 'КРОКОДИЛ'), ('30', 'КРОКОДИЛОВ'), ('94', 'КРОМ'), ('437', 'КСТАТ'), ('346', 'КУДА-Т'), ('106', 'КУРИЦ'), ('533', 'ЛЕГК'), ('342', 'ЛИВЕН'), ('77', 'ЛИСТ'), ('76', 'ЛИСТЬЕВ'), ('213', 'ЛОГИЧН'), ('622', 'ЛОС'), ('62', 'ЛОТОС'), ('235', 'ЛУЧШ'), ('228', 'ЛЮБ'), ('190', 'ЛЮБОВА'), ('133', 'ЛЮД'), ('539', 'МАГАЗИН'), ('538', 'МАГАЗИНОВ'), ('332', 'МАЖОР'), ('510', 'МАЛ'), ('256', 'МАЛЕНЬК'), ('636', 'МАРШРУТ'), ('283', 'МАШИН'), ('381', 'МАШИНК'), ('118', 'МЕДИТАЦ'), ('306', 'МЕНЕДЖЕР'), ('449', 'МЕНЬШ'), ('46', 'МЕСТ'), ('240', 'МЕСТН'), ('119', 'МЕЧТАН'), ('536', 'МИЛА'), ('484', 'МИЛАН'), ('557', 'МИЛАНСК'), ('28', 'МИЛЛИОНОЛЕТН'), ('93', 'МИНИЗООПАРК'), ('468', 'МИНУС'), ('467', 'МИНУСОВ'), ('44', 'МИНУТ'), ('144', 'МЛН'), ('537', 'МНОЖЕСТВ'), ('630', 'МОГУТ'), ('268', 'МОГУЧ'), ('158', 'МОЖЕТ'), ('37', 'МОЖН'), ('635', 'МОЛОДЦ'), ('310', 'МОМЕНТ'), ('387', 'МОНДЕ'), ('88', 'МОР'), ('41', 'МОТОСА'), ('162', 'НАЗВА'), ('525', 'НАЗЫВА'), ('70', 'НАЙТ'), ('385', 'НАЛИЧ'), ('249', 'НАМ'), ('559', 'НАМН'), ('588', 'НАПРАШИВА'), ('511', 'НАРОД'), ('273', 'НАС'), ('543', 'НАСТОЯ'), ('147', 'НАЧАЛЬН'), ('490', 'НАЧАНА'), ('160', 'НАШ'), ('254', 'НАШЛ'), ('578', 'НЕАПОЛ'), ('56', 'НЕБОЛЬШ'), ('36', 'НЕГ'), ('34', 'НЕДАЛЕК'), ('227', 'НЕЗНАН'), ('53', 'НЕКОТОР'), ('461', 'НЕМ'), ('320', 'НЕМН'), ('585', 'НЕОБХОДИМ'), ('122', 'НЕПОВТОРИМ'), ('340', 'НЕСМОТР'), ('621', 'НЕСМОТРЕЛ'), ('379', 'НЕУДАЧН'), ('409', 'НЕУДОБН'), ('527', 'НИЖН'), ('184', 'НИЧ'), ('501', 'НОВ'), ('221', 'НОВИЧК'), ('558', 'НОМЕР'), ('108', 'НОС'), ('359', 'НУЖДА'), ('313', 'НУЖН'), ('272', 'НЮАНС'), ('271', 'НЮАНСОВ'), ('492', 'ОБЕД'), ('413', 'ОБЗОР'), ('339', 'ОБОШЛ'), ('519', 'ОБХОД'), ('265', 'ОБЩ'), ('369', 'ОБЩЕСТВЕН'), ('132', 'ОБЪЕДИНЕН'), ('571', 'ОБЫЧН'), ('521', 'ОГРОМН'), ('173', 'ОДН'), ('262', 'ОКАЗА'), ('54', 'ОКАМЕНЕВШ'), ('373', 'ОКУПА'), ('472', 'ОПИСА'), ('328', 'ОПЛАТ'), ('442', 'ОПРОШЕН'), ('253', 'ОПЫТ'), ('575', 'ОПЯ'), ('517', 'ОСТА'), ('189', 'ОСТАВА'), ('634', 'ОТД'), ('175', 'ОТДЕЛК'), ('187', 'ОТДЕЛЬН'), ('116', 'ОТДЫХ'), ('217', 'ОТЗЫВ'), ('485', 'ОТЛЕТ'), ('474', 'ОТЛИЧН'), ('599', 'ОТНОС'), ('613', 'ОТСТА'), ('65', 'ОФОРМЛ'), ('59', 'ПАЛЬМ'), ('246', 'ПАР'), ('27', 'ПАРК'), ('434', 'ПАРКИНГ'), ('419', 'ПАРКОВК'), ('33', 'ПАТТАЙ'), ('107', 'ПЕРЕД'), ('401', 'ПЕРЕДАЧ'), ('356', 'ПЕРЕДВИЖЕН'), ('410', 'ПЕРЕДН'), ('412', 'ПЕРЕКРЫВА'), ('611', 'ПЕРЕКУС'), ('64', 'ПЕРЕПЛЕТ'), ('552', 'ПЕРЕХОД'), ('344', 'ПЕРИНЕЙСК'), ('366', 'ПЕРПИНЬЯ'), ('423', 'ПЕРПИНЬЯН'), ('425', 'ПЕШ'), ('458', 'ПЛАН'), ('195', 'ПЛАНИРОВАН'), ('377', 'ПЛАТН'), ('181', 'ПЛОХ'), ('428', 'ПЛОЩАДК'), ('248', 'ПЛЮНУТ'), ('206', 'ПЛЮС'), ('469', 'ПЛЮСОВ'), ('367', 'ПОБЕРЕЖ'), ('513', 'ПОВАЛ'), ('250', 'ПОВЕЗЛ'), ('324', 'ПОВРЕЖД'), ('609', 'ПОДГОТОВК'), ('612', 'ПОДЖИДАН'), ('464', 'ПОДОРОЖ'), ('371', 'ПОДСЧЕТ'), ('455', 'ПОДХОД'), ('618', 'ПОЕД'), ('196', 'ПОЕЗДК'), ('459', 'ПОЕЗДОК'), ('475', 'ПОЗДРАВЛЯ'), ('72', 'ПОКАЗА'), ('211', 'ПОКАТА'), ('102', 'ПОКОРМ'), ('566', 'ПОКУПК'), ('445', 'ПОЛИЦЕСК'), ('605', 'ПОЛКИЛОМЕТР'), ('226', 'ПОЛН'), ('276', 'ПОЛНОСТ'), ('264', 'ПОЛУЧ'), ('586', 'ПОЛЬЗОВА'), ('18', 'ПОЛЬЗОВАТЕЛ'), ('465', 'ПОМОЩН'), ('542', 'ПОНИЖ'), ('180', 'ПОНИМА'), ('159', 'ПОНЯ'), ('424', 'ПОПЛАТ'), ('112', 'ПОПРОБ'), ('156', 'ПОПЫТК'), ('172', 'ПОСВЯЩ'), ('151', 'ПОСЕТИТЕЛ'), ('309', 'ПОСЛЕДН'), ('619', 'ПОСЛЕДОК'), ('500', 'ПОСМОТРЕЛ'), ('255', 'ПОСРЕДНИК'), ('416', 'ПОСТОЯ'), ('182', 'ПОТ'), ('143', 'ПОТРАТ'), ('277', 'ПОТРЕБН'), ('535', 'ПОХОЖ'), ('183', 'ПОЧТ'), ('358', 'ПОЯСНЕН'), ('499', 'ПРАВ'), ('231', 'ПРЕДОСТАВЛЯ'), ('95', 'ПРЕДПРИЯТ'), ('440', 'ПРЕДСТАВЛЕН'), ('115', 'ПРЕКРАСН'), ('130', 'ПРИЗВА'), ('626', 'ПРИКОЛОЛ'), ('204', 'ПРИЛЕТА'), ('395', 'ПРИЛИЧН'), ('457', 'ПРИМЕРН'), ('415', 'ПРИХОД'), ('63', 'ПРИЧУДЛИВ'), ('245', 'ПРОБЛ'), ('219', 'ПРОБЛЕМ'), ('498', 'ПРОБУЖДЕН'), ('502', 'ПРОВИНЦИАЛЬН'), ('427', 'ПРОГУЛК'), ('129', 'ПРОЕКТ'), ('105', 'ПРОНЕСТ'), ('87', 'ПРОСТ'), ('304', 'ПРОСЬБ'), ('100', 'ПРОХОД'), ('84', 'ПРУД'), ('480', 'ПУНКТ'), ('397', 'ПУСТ'), ('124', 'ПУТЕШЕСТВ'), ('290', 'ПЯТИДВЕРН'), ('488', 'РАБОТА'), ('247', 'РАЗ'), ('318', 'РАЗБЛОКИРОВАН'), ('97', 'РАЗВЕДЕН'), ('188', 'РАЗГОВОР'), ('554', 'РАЗМЕР'), ('51', 'РАЗН'), ('58', 'РАЗНОЦВЕТ'), ('606', 'РАЗНОШЕРСТН'), ('270', 'РАЗЪЯСНЕН'), ('32', 'РАСПОЛОЖ'), ('178', 'РАССКАЗЫВА'), ('239', 'РАССМАТРИВА'), ('441', 'РАССТОЯН'), ('604', 'РАССТЯНУВШ'), ('49', 'РАСТИТЕЛЬН'), ('68', 'РАСЦВЕТА'), ('353', 'РЕАЛЬН'), ('99', 'РЕГУЛЯРН'), ('114', 'РЕЗЮМ'), ('157', 'РЕЛИГ'), ('493', 'РЕШ'), ('214', 'РЕШЕН'), ('592', 'РОВН'), ('5', 'РОЖДЕН'), ('562', 'РОЖДЕСТВЕНСК'), ('232', 'РУССКОЯЗЫЧН'), ('89', 'РЫБ'), ('86', 'РЫБК'), ('216', 'САЙТ'), ('203', 'САМОЛЕТ'), ('197', 'САНТ'), ('355', 'СВОБОД'), ('546', 'СДЕЛА'), ('291', 'СЕАТ'), ('148', 'СЕЙЧАС'), ('257', 'СЕКРЕТ'), ('261', 'СЕРВИС'), ('345', 'СЕРПАНТИН'), ('567', 'СЕРЬЕЗН'), ('294', 'СИДЕН'), ('531', 'СИЛ'), ('341', 'СИЛЬН'), ('80', 'СИМПАТИЧН'), ('266', 'СКАЙП'), ('563', 'СКИДОК'), ('579', 'СКОЛЬК'), ('83', 'СКУЛЬПТУР'), ('222', 'СЛАБ'), ('396', 'СЛАБОВАТ'), ('402', 'СЛАЗ'), ('414', 'СЛЕВ'), ('574', 'СЛЕД'), ('436', 'СЛОВ'), ('131', 'СЛУЖ'), ('236', 'СЛУЧА'), ('481', 'СЛУЧАЙН'), ('334', 'СНИМА'), ('399', 'СО'), ('489', 'СОВС'), ('135', 'СОСЕД'), ('117', 'СОСРЕДОТОЧЕН'), ('590', 'СОСТОЯ'), ('477', 'СПАСИБ'), ('363', 'СПИСЫВА'), ('504', 'СПЯТ'), ('364', 'СРАЗ'), ('319', 'СРЕДСТВ'), ('311', 'СТАЛ'), ('640', 'СТАР'), ('595', 'СТАРТАНУЛ'), ('60', 'СТИЛ'), ('361', 'СТО'), ('299', 'СТОИМОСТ'), ('411', 'СТОЙК'), ('447', 'СТОЯНК'), ('406', 'СТРАДА'), ('163', 'СТРАН'), ('338', 'СТРАХОВ'), ('330', 'СТРАХОВК'), ('343', 'СУМАСШЕДШ'), ('336', 'СУММ'), ('633', 'СУПЕРСК'), ('111', 'СХВАТ'), ('150', 'СЧЕТ'), ('208', 'СЪЕЗД'), ('295', 'СЫН'), ('497', 'СЭКОНОМ'), ('198', 'СЮСАН'), ('125', 'ТАИЛАНД'), ('25', 'ТАЙСК'), ('92', 'ТАКЖ'), ('360', 'ТАКС'), ('327', 'ТЕ'), ('620', 'ТЕХНИК'), ('286', 'ТИП'), ('617', 'ТОГ'), ('514', 'ТОЛП'), ('443', 'ТОМ'), ('555', 'ТОРГОВ'), ('597', 'ТОТ'), ('71', 'ТОЧК'), ('370', 'ТРАНСПОРТ'), ('403', 'ТРАСС'), ('375', 'ТРАТ'), ('73', 'ТРИ'), ('518', 'ТРОЙК'), ('48', 'ТРОПИЧЕСК'), ('601', 'ТРУДН'), ('40', 'ТУК-ТУК'), ('572', 'ТУРПОЕЗДК'), ('349', 'УБЕД'), ('398', 'УВ'), ('602', 'УВАЖА'), ('600', 'УВАЖИТЕЛЬН'), ('67', 'УВИДЕЛ'), ('103', 'УВЛЕКАТЕЛЬН'), ('69', 'УДА'), ('568', 'УДАЧН'), ('408', 'УЖАСН'), ('50', 'УКРАШЕН'), ('509', 'УЛИЦ'), ('432', 'УМН'), ('388', 'УНИВЕРСА'), ('608', 'УРОВН'), ('230', 'УСЛОВ'), ('553', 'УСЛУГ'), ('110', 'УСПЕЛ'), ('614', 'УСТА'), ('528', 'УСТАЛ'), ('57', 'УХОЖЕН'), ('628', 'УЧАСТНИК'), ('561', 'УЧЕТ'), ('526', 'УЮТН'), ('491', 'ФАКТИЧЕСК'), ('31', 'ФЕРМ'), ('149', 'ФИНАНСИР'), ('333', 'ФИРМ'), ('82', 'ФОНТА'), ('287', 'ФОРД'), ('52', 'ФОРМ'), ('331', 'ФОРС'), ('126', 'ФОТ'), ('23', 'ФОТОГРАФ'), ('209', 'ФРАНЦ'), ('439', 'ФРАНЦУЗ'), ('438', 'ФРАНЦУЗОВ'), ('177', 'ХОД'), ('524', 'ХОЛМ'), ('382', 'ХОРОШ'), ('516', 'ХОТЕЛ'), ('127', 'ХРАМ'), ('237', 'ХУДШ'), ('541', 'ЦЕН'), ('78', 'ЦЕНТР'), ('507', 'ЧАС'), ('506', 'ЧАСОВ'), ('495', 'ЧАСТ'), ('141', 'ЧАСТН'), ('581', 'ЧЕЛОВЕК'), ('534', 'ЧЕМ-Т'), ('435', 'ЧЕСТН'), ('448', 'ЧЕТЫР'), ('444', 'ЧИСЛ'), ('252', 'ЧУЖ'), ('351', 'ЧУТ'), ('627', 'ШЛЕМ'), ('101', 'ШО'), ('544', 'ШОПИНГ'), ('113', 'ШУСТР'), ('429', 'ЭВАКУАТОР'), ('284', 'ЭКОН'), ('407', 'ЭКОНОМИЧН'), ('39', 'ЭКСКУРС'), ('426', 'ЭРОТИЧЕСК'), ('74', 'ЭТАП'), ('576', 'ЮГ'), ('244', 'ЮРИДИЧЕСК'), ('372', 'ЯВН'), ('225', 'ЯЗЫК');
COMMIT;

-- ----------------------------
--  Table structure for `b_search_suggest`
-- ----------------------------
DROP TABLE IF EXISTS `b_search_suggest`;
CREATE TABLE `b_search_suggest` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `FILTER_MD5` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `PHRASE` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `RATE` float NOT NULL,
  `TIMESTAMP_X` datetime NOT NULL,
  `RESULT_COUNT` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IND_B_SEARCH_SUGGEST` (`FILTER_MD5`,`PHRASE`(50),`RATE`),
  KEY `IND_B_SEARCH_SUGGEST_PHRASE` (`PHRASE`(50),`RATE`),
  KEY `IND_B_SEARCH_SUGGEST_TIME` (`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_search_tags`
-- ----------------------------
DROP TABLE IF EXISTS `b_search_tags`;
CREATE TABLE `b_search_tags` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`SEARCH_CONTENT_ID`,`SITE_ID`,`NAME`),
  KEY `IX_B_SEARCH_TAGS_0` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci DELAY_KEY_WRITE=1;

-- ----------------------------
--  Table structure for `b_search_user_right`
-- ----------------------------
DROP TABLE IF EXISTS `b_search_user_right`;
CREATE TABLE `b_search_user_right` (
  `USER_ID` int(11) NOT NULL,
  `GROUP_CODE` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `UX_B_SEARCH_USER_RIGHT` (`USER_ID`,`GROUP_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_sec_filter_mask`
-- ----------------------------
DROP TABLE IF EXISTS `b_sec_filter_mask`;
CREATE TABLE `b_sec_filter_mask` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SORT` int(11) NOT NULL DEFAULT '10',
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILTER_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LIKE_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PREG_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_sec_frame_mask`
-- ----------------------------
DROP TABLE IF EXISTS `b_sec_frame_mask`;
CREATE TABLE `b_sec_frame_mask` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SORT` int(11) NOT NULL DEFAULT '10',
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FRAME_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LIKE_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PREG_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_sec_iprule`
-- ----------------------------
DROP TABLE IF EXISTS `b_sec_iprule`;
CREATE TABLE `b_sec_iprule` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RULE_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'M',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ADMIN_SECTION` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(11) NOT NULL DEFAULT '500',
  `ACTIVE_FROM` datetime DEFAULT NULL,
  `ACTIVE_FROM_TIMESTAMP` int(11) DEFAULT NULL,
  `ACTIVE_TO` datetime DEFAULT NULL,
  `ACTIVE_TO_TIMESTAMP` int(11) DEFAULT NULL,
  `NAME` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_sec_iprule_active_to` (`ACTIVE_TO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_sec_iprule_excl_ip`
-- ----------------------------
DROP TABLE IF EXISTS `b_sec_iprule_excl_ip`;
CREATE TABLE `b_sec_iprule_excl_ip` (
  `IPRULE_ID` int(11) NOT NULL,
  `RULE_IP` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int(11) NOT NULL DEFAULT '500',
  `IP_START` bigint(18) DEFAULT NULL,
  `IP_END` bigint(18) DEFAULT NULL,
  PRIMARY KEY (`IPRULE_ID`,`RULE_IP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_sec_iprule_excl_mask`
-- ----------------------------
DROP TABLE IF EXISTS `b_sec_iprule_excl_mask`;
CREATE TABLE `b_sec_iprule_excl_mask` (
  `IPRULE_ID` int(11) NOT NULL,
  `RULE_MASK` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `LIKE_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PREG_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`IPRULE_ID`,`RULE_MASK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_sec_iprule_incl_ip`
-- ----------------------------
DROP TABLE IF EXISTS `b_sec_iprule_incl_ip`;
CREATE TABLE `b_sec_iprule_incl_ip` (
  `IPRULE_ID` int(11) NOT NULL,
  `RULE_IP` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int(11) NOT NULL DEFAULT '500',
  `IP_START` bigint(18) DEFAULT NULL,
  `IP_END` bigint(18) DEFAULT NULL,
  PRIMARY KEY (`IPRULE_ID`,`RULE_IP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_sec_iprule_incl_mask`
-- ----------------------------
DROP TABLE IF EXISTS `b_sec_iprule_incl_mask`;
CREATE TABLE `b_sec_iprule_incl_mask` (
  `IPRULE_ID` int(11) NOT NULL,
  `RULE_MASK` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `LIKE_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PREG_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`IPRULE_ID`,`RULE_MASK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_sec_recovery_codes`
-- ----------------------------
DROP TABLE IF EXISTS `b_sec_recovery_codes`;
CREATE TABLE `b_sec_recovery_codes` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `USED` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `USING_DATE` datetime DEFAULT NULL,
  `USING_IP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_sec_recovery_codes_user_id` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_sec_redirect_url`
-- ----------------------------
DROP TABLE IF EXISTS `b_sec_redirect_url`;
CREATE TABLE `b_sec_redirect_url` (
  `IS_SYSTEM` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `URL` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `PARAMETER_NAME` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `b_sec_redirect_url`
-- ----------------------------
BEGIN;
INSERT INTO `b_sec_redirect_url` VALUES ('Y', '10', '/bitrix/redirect.php', 'goto'), ('Y', '20', '/bitrix/rk.php', 'goto'), ('Y', '30', '/bitrix/click.php', 'goto');
COMMIT;

-- ----------------------------
--  Table structure for `b_sec_session`
-- ----------------------------
DROP TABLE IF EXISTS `b_sec_session`;
CREATE TABLE `b_sec_session` (
  `SESSION_ID` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `SESSION_DATA` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`SESSION_ID`),
  KEY `ix_b_sec_session_time` (`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_sec_user`
-- ----------------------------
DROP TABLE IF EXISTS `b_sec_user`;
CREATE TABLE `b_sec_user` (
  `USER_ID` int(11) NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SECRET` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TYPE` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `PARAMS` text COLLATE utf8_unicode_ci,
  `ATTEMPTS` int(18) DEFAULT NULL,
  `INITIAL_DATE` datetime DEFAULT NULL,
  `SKIP_MANDATORY` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DEACTIVATE_UNTIL` datetime DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_sec_virus`
-- ----------------------------
DROP TABLE IF EXISTS `b_sec_virus`;
CREATE TABLE `b_sec_virus` (
  `ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `TIMESTAMP_X` datetime NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SENT` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `INFO` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_sec_white_list`
-- ----------------------------
DROP TABLE IF EXISTS `b_sec_white_list`;
CREATE TABLE `b_sec_white_list` (
  `ID` int(11) NOT NULL,
  `WHITE_SUBSTR` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_security_sitecheck`
-- ----------------------------
DROP TABLE IF EXISTS `b_security_sitecheck`;
CREATE TABLE `b_security_sitecheck` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TEST_DATE` datetime DEFAULT NULL,
  `RESULTS` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_seo_adv_autolog`
-- ----------------------------
DROP TABLE IF EXISTS `b_seo_adv_autolog`;
CREATE TABLE `b_seo_adv_autolog` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CAMPAIGN_ID` int(11) NOT NULL,
  `CAMPAIGN_XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `BANNER_ID` int(11) NOT NULL,
  `BANNER_XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CAUSE_CODE` int(11) DEFAULT '0',
  `SUCCESS` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  PRIMARY KEY (`ID`),
  KEY `ix_b_seo_adv_autolog1` (`ENGINE_ID`),
  KEY `ix_b_seo_adv_autolog2` (`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_seo_adv_banner`
-- ----------------------------
DROP TABLE IF EXISTS `b_seo_adv_banner`;
CREATE TABLE `b_seo_adv_banner` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `OWNER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `OWNER_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_UPDATE` timestamp NULL DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SETTINGS` text COLLATE utf8_unicode_ci,
  `CAMPAIGN_ID` int(11) NOT NULL,
  `GROUP_ID` int(11) DEFAULT NULL,
  `AUTO_QUANTITY_OFF` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `AUTO_QUANTITY_ON` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_adv_banner` (`ENGINE_ID`,`XML_ID`),
  KEY `ix_b_seo_adv_banner1` (`CAMPAIGN_ID`),
  KEY `ix_b_seo_adv_banner2` (`AUTO_QUANTITY_OFF`,`AUTO_QUANTITY_ON`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_seo_adv_campaign`
-- ----------------------------
DROP TABLE IF EXISTS `b_seo_adv_campaign`;
CREATE TABLE `b_seo_adv_campaign` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `OWNER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `OWNER_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_UPDATE` timestamp NULL DEFAULT NULL,
  `SETTINGS` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_adv_campaign` (`ENGINE_ID`,`XML_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_seo_adv_group`
-- ----------------------------
DROP TABLE IF EXISTS `b_seo_adv_group`;
CREATE TABLE `b_seo_adv_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `OWNER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `OWNER_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_UPDATE` timestamp NULL DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SETTINGS` text COLLATE utf8_unicode_ci,
  `CAMPAIGN_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_adv_group` (`ENGINE_ID`,`XML_ID`),
  KEY `ix_b_seo_adv_group1` (`CAMPAIGN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_seo_adv_link`
-- ----------------------------
DROP TABLE IF EXISTS `b_seo_adv_link`;
CREATE TABLE `b_seo_adv_link` (
  `LINK_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `LINK_ID` int(18) NOT NULL,
  `BANNER_ID` int(11) NOT NULL,
  PRIMARY KEY (`LINK_TYPE`,`LINK_ID`,`BANNER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_seo_adv_log`
-- ----------------------------
DROP TABLE IF EXISTS `b_seo_adv_log`;
CREATE TABLE `b_seo_adv_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `REQUEST_URI` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `REQUEST_DATA` text COLLATE utf8_unicode_ci,
  `RESPONSE_TIME` float NOT NULL,
  `RESPONSE_STATUS` int(5) DEFAULT NULL,
  `RESPONSE_DATA` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `ix_b_seo_adv_log1` (`ENGINE_ID`),
  KEY `ix_b_seo_adv_log2` (`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_seo_adv_order`
-- ----------------------------
DROP TABLE IF EXISTS `b_seo_adv_order`;
CREATE TABLE `b_seo_adv_order` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CAMPAIGN_ID` int(11) NOT NULL,
  `BANNER_ID` int(11) NOT NULL,
  `ORDER_ID` int(11) NOT NULL,
  `SUM` float DEFAULT '0',
  `PROCESSED` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_adv_order` (`ENGINE_ID`,`CAMPAIGN_ID`,`BANNER_ID`,`ORDER_ID`),
  KEY `ix_b_seo_adv_order1` (`ORDER_ID`,`PROCESSED`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_seo_adv_region`
-- ----------------------------
DROP TABLE IF EXISTS `b_seo_adv_region`;
CREATE TABLE `b_seo_adv_region` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `OWNER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `OWNER_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_UPDATE` timestamp NULL DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SETTINGS` text COLLATE utf8_unicode_ci,
  `PARENT_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_adv_region` (`ENGINE_ID`,`XML_ID`),
  KEY `ix_b_seo_adv_region1` (`PARENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_seo_keywords`
-- ----------------------------
DROP TABLE IF EXISTS `b_seo_keywords`;
CREATE TABLE `b_seo_keywords` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `KEYWORDS` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `ix_b_seo_keywords_url` (`URL`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_seo_search_engine`
-- ----------------------------
DROP TABLE IF EXISTS `b_seo_search_engine`;
CREATE TABLE `b_seo_search_engine` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `SORT` int(5) DEFAULT '100',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CLIENT_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CLIENT_SECRET` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REDIRECT_URI` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SETTINGS` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_search_engine_code` (`CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `b_seo_search_engine`
-- ----------------------------
BEGIN;
INSERT INTO `b_seo_search_engine` VALUES ('1', 'google', 'Y', '200', 'Google', '868942902147-qrrd6ce1ajfkpse8ieq4gkpdeanvtnno.apps.googleusercontent.com', 'EItMlJpZLC2WRPKB6QsA5bV9', 'urn:ietf:wg:oauth:2.0:oob', null), ('2', 'yandex', 'Y', '300', 'Yandex', 'f848c7bfc1d34a94ba6d05439f81bbd7', 'da0e73b2d9cc4e809f3170e49cb9df01', 'https://oauth.yandex.ru/verification_code', null), ('3', 'yandex_direct', 'Y', '400', 'Yandex.Direct', '', '', 'https://oauth.yandex.ru/verification_code', null);
COMMIT;

-- ----------------------------
--  Table structure for `b_seo_sitemap`
-- ----------------------------
DROP TABLE IF EXISTS `b_seo_sitemap`;
CREATE TABLE `b_seo_sitemap` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `DATE_RUN` datetime DEFAULT NULL,
  `SETTINGS` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_seo_sitemap_entity`
-- ----------------------------
DROP TABLE IF EXISTS `b_seo_sitemap_entity`;
CREATE TABLE `b_seo_sitemap_entity` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENTITY_TYPE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `SITEMAP_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_seo_sitemap_entity_1` (`ENTITY_TYPE`,`ENTITY_ID`),
  KEY `ix_b_seo_sitemap_entity_2` (`SITEMAP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_seo_sitemap_iblock`
-- ----------------------------
DROP TABLE IF EXISTS `b_seo_sitemap_iblock`;
CREATE TABLE `b_seo_sitemap_iblock` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IBLOCK_ID` int(11) NOT NULL,
  `SITEMAP_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_seo_sitemap_iblock_1` (`IBLOCK_ID`),
  KEY `ix_b_seo_sitemap_iblock_2` (`SITEMAP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_seo_sitemap_runtime`
-- ----------------------------
DROP TABLE IF EXISTS `b_seo_sitemap_runtime`;
CREATE TABLE `b_seo_sitemap_runtime` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PID` int(11) NOT NULL,
  `PROCESSED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ITEM_PATH` varchar(700) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ITEM_ID` int(11) DEFAULT NULL,
  `ITEM_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'D',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `ACTIVE_ELEMENT` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  PRIMARY KEY (`ID`),
  KEY `ix_seo_sitemap_runtime1` (`PID`,`PROCESSED`,`ITEM_TYPE`,`ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_seo_yandex_direct_stat`
-- ----------------------------
DROP TABLE IF EXISTS `b_seo_yandex_direct_stat`;
CREATE TABLE `b_seo_yandex_direct_stat` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CAMPAIGN_ID` int(11) NOT NULL,
  `BANNER_ID` int(11) NOT NULL,
  `DATE_DAY` date NOT NULL,
  `CURRENCY` char(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SUM` float DEFAULT '0',
  `SUM_SEARCH` float DEFAULT '0',
  `SUM_CONTEXT` float DEFAULT '0',
  `CLICKS` int(7) DEFAULT '0',
  `CLICKS_SEARCH` int(7) DEFAULT '0',
  `CLICKS_CONTEXT` int(7) DEFAULT '0',
  `SHOWS` int(7) DEFAULT '0',
  `SHOWS_SEARCH` int(7) DEFAULT '0',
  `SHOWS_CONTEXT` int(7) DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_seo_yandex_direct_stat` (`BANNER_ID`,`DATE_DAY`),
  KEY `ix_seo_yandex_direct_stat1` (`CAMPAIGN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_short_uri`
-- ----------------------------
DROP TABLE IF EXISTS `b_short_uri`;
CREATE TABLE `b_short_uri` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `URI` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `URI_CRC` int(18) NOT NULL,
  `SHORT_URI` varbinary(250) NOT NULL,
  `SHORT_URI_CRC` int(18) NOT NULL,
  `STATUS` int(18) NOT NULL DEFAULT '301',
  `MODIFIED` datetime NOT NULL,
  `LAST_USED` datetime DEFAULT NULL,
  `NUMBER_USED` int(18) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ux_b_short_uri_1` (`SHORT_URI_CRC`),
  KEY `ux_b_short_uri_2` (`URI_CRC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_site_template`
-- ----------------------------
DROP TABLE IF EXISTS `b_site_template`;
CREATE TABLE `b_site_template` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `CONDITION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(11) NOT NULL DEFAULT '500',
  `TEMPLATE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_site_template_site` (`SITE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `b_site_template`
-- ----------------------------
BEGIN;
INSERT INTO `b_site_template` VALUES ('1', 's1', '', '150', 'minimal_red');
COMMIT;

-- ----------------------------
--  Table structure for `b_smile`
-- ----------------------------
DROP TABLE IF EXISTS `b_smile`;
CREATE TABLE `b_smile` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'S',
  `SET_ID` int(18) NOT NULL DEFAULT '0',
  `SORT` int(10) NOT NULL DEFAULT '150',
  `TYPING` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CLICKABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `HIDDEN` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IMAGE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `IMAGE_DEFINITION` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'SD',
  `IMAGE_WIDTH` int(11) NOT NULL DEFAULT '0',
  `IMAGE_HEIGHT` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `b_smile`
-- ----------------------------
BEGIN;
INSERT INTO `b_smile` VALUES ('1', 'S', '2', '100', ':) :-)', 'Y', 'N', 'bx_smile_smile.png', 'UHD', '20', '20'), ('2', 'S', '2', '105', ';) ;-)', 'Y', 'N', 'bx_smile_wink.png', 'UHD', '20', '20'), ('3', 'S', '2', '110', ':D :-D', 'Y', 'N', 'bx_smile_biggrin.png', 'UHD', '20', '20'), ('4', 'S', '2', '115', '8) 8-)', 'Y', 'N', 'bx_smile_cool.png', 'UHD', '20', '20'), ('5', 'S', '2', '120', ':facepalm:', 'Y', 'N', 'bx_smile_facepalm.png', 'UHD', '20', '20'), ('6', 'S', '2', '125', ':{} :-{}', 'Y', 'N', 'bx_smile_kiss.png', 'UHD', '20', '20'), ('7', 'S', '2', '130', ':( :-(', 'Y', 'N', 'bx_smile_sad.png', 'UHD', '20', '20'), ('8', 'S', '2', '135', ':| :-|', 'Y', 'N', 'bx_smile_neutral.png', 'UHD', '20', '20'), ('9', 'S', '2', '140', ':oops:', 'Y', 'N', 'bx_smile_redface.png', 'UHD', '20', '20'), ('10', 'S', '2', '145', ':cry: :~(', 'Y', 'N', 'bx_smile_cry.png', 'UHD', '20', '20'), ('11', 'S', '2', '150', ':evil: >:-<', 'Y', 'N', 'bx_smile_evil.png', 'UHD', '20', '20'), ('12', 'S', '2', '155', ':o :-o :shock:', 'Y', 'N', 'bx_smile_eek.png', 'UHD', '20', '20'), ('13', 'S', '2', '160', ':/ :-/', 'Y', 'N', 'bx_smile_confuse.png', 'UHD', '20', '20'), ('14', 'S', '2', '165', ':idea:', 'Y', 'N', 'bx_smile_idea.png', 'UHD', '20', '20'), ('15', 'S', '2', '170', ':?:', 'Y', 'N', 'bx_smile_question.png', 'UHD', '20', '20'), ('16', 'S', '2', '175', ':!:', 'Y', 'N', 'bx_smile_exclaim.png', 'UHD', '20', '20'), ('17', 'S', '2', '180', ':like:', 'Y', 'N', 'bx_smile_like.png', 'UHD', '20', '20'), ('18', 'I', '2', '175', 'ICON_NOTE', 'Y', 'N', 'bx_icon_1.gif', 'SD', '15', '15'), ('19', 'I', '2', '180', 'ICON_DIRRECTION', 'Y', 'N', 'bx_icon_2.gif', 'SD', '15', '15'), ('20', 'I', '2', '185', 'ICON_IDEA', 'Y', 'N', 'bx_icon_3.gif', 'SD', '15', '15'), ('21', 'I', '2', '190', 'ICON_ATTANSION', 'Y', 'N', 'bx_icon_4.gif', 'SD', '15', '15'), ('22', 'I', '2', '195', 'ICON_QUESTION', 'Y', 'N', 'bx_icon_5.gif', 'SD', '15', '15'), ('23', 'I', '2', '200', 'ICON_BAD', 'Y', 'N', 'bx_icon_6.gif', 'SD', '15', '15'), ('24', 'I', '2', '205', 'ICON_GOOD', 'Y', 'N', 'bx_icon_7.gif', 'SD', '15', '15');
COMMIT;

-- ----------------------------
--  Table structure for `b_smile_lang`
-- ----------------------------
DROP TABLE IF EXISTS `b_smile_lang`;
CREATE TABLE `b_smile_lang` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'S',
  `SID` int(11) NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_SMILE_SL` (`TYPE`,`SID`,`LID`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `b_smile_lang`
-- ----------------------------
BEGIN;
INSERT INTO `b_smile_lang` VALUES ('1', 'P', '1', 'ru', 'Стандартная галерея'), ('2', 'P', '1', 'en', 'Standard gallery'), ('3', 'G', '2', 'ru', 'Основной набор'), ('4', 'G', '2', 'en', 'Default pack'), ('5', 'S', '1', 'ru', 'С улыбкой'), ('6', 'S', '1', 'en', 'Smile'), ('7', 'S', '2', 'ru', 'Шутливо'), ('8', 'S', '2', 'en', 'Wink'), ('9', 'S', '3', 'ru', 'Широкая улыбка'), ('10', 'S', '3', 'en', 'Big grin'), ('11', 'S', '4', 'ru', 'Здорово'), ('12', 'S', '4', 'en', 'Cool'), ('13', 'S', '5', 'ru', 'Разочарование'), ('14', 'S', '5', 'en', 'Facepalm'), ('15', 'S', '6', 'ru', 'Поцелуй'), ('16', 'S', '6', 'en', 'Kiss'), ('17', 'S', '7', 'ru', 'Печально'), ('18', 'S', '7', 'en', 'Sad'), ('19', 'S', '8', 'ru', 'Скептически'), ('20', 'S', '8', 'en', 'Skeptic'), ('21', 'S', '9', 'ru', 'Смущенный'), ('22', 'S', '9', 'en', 'Embarrassed'), ('23', 'S', '10', 'ru', 'Очень грустно'), ('24', 'S', '10', 'en', 'Crying'), ('25', 'S', '11', 'ru', 'Со злостью'), ('26', 'S', '11', 'en', 'Angry'), ('27', 'S', '12', 'ru', 'Удивленно'), ('28', 'S', '12', 'en', 'Surprised'), ('29', 'S', '13', 'ru', 'Смущенно'), ('30', 'S', '13', 'en', 'Confused'), ('31', 'S', '14', 'ru', 'Идея'), ('32', 'S', '14', 'en', 'Idea'), ('33', 'S', '15', 'ru', 'Вопрос'), ('34', 'S', '15', 'en', 'Question'), ('35', 'S', '16', 'ru', 'Восклицание'), ('36', 'S', '16', 'en', 'Exclamation'), ('37', 'S', '17', 'ru', 'Нравится'), ('38', 'S', '17', 'en', 'Like');
COMMIT;

-- ----------------------------
--  Table structure for `b_smile_set`
-- ----------------------------
DROP TABLE IF EXISTS `b_smile_set`;
CREATE TABLE `b_smile_set` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'G',
  `PARENT_ID` int(18) NOT NULL DEFAULT '0',
  `STRING_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(10) NOT NULL DEFAULT '150',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `b_smile_set`
-- ----------------------------
BEGIN;
INSERT INTO `b_smile_set` VALUES ('1', 'P', '0', 'bitrix', '150'), ('2', 'G', '1', 'bitrix_main', '150');
COMMIT;

-- ----------------------------
--  Table structure for `b_socialservices_contact`
-- ----------------------------
DROP TABLE IF EXISTS `b_socialservices_contact`;
CREATE TABLE `b_socialservices_contact` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `USER_ID` int(11) NOT NULL,
  `CONTACT_USER_ID` int(11) DEFAULT NULL,
  `CONTACT_XML_ID` int(11) DEFAULT NULL,
  `CONTACT_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTACT_LAST_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTACT_PHOTO` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_AUTHORIZE` datetime DEFAULT NULL,
  `NOTIFY` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `ix_b_socialservices_contact1` (`USER_ID`),
  KEY `ix_b_socialservices_contact2` (`CONTACT_USER_ID`),
  KEY `ix_b_socialservices_contact3` (`TIMESTAMP_X`),
  KEY `ix_b_socialservices_contact4` (`LAST_AUTHORIZE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_socialservices_contact_connect`
-- ----------------------------
DROP TABLE IF EXISTS `b_socialservices_contact_connect`;
CREATE TABLE `b_socialservices_contact_connect` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `CONTACT_ID` int(11) DEFAULT NULL,
  `LINK_ID` int(11) DEFAULT NULL,
  `CONTACT_PROFILE_ID` int(11) NOT NULL,
  `CONTACT_PORTAL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CONNECT_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT 'P',
  `LAST_AUTHORIZE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_socialservices_contact_connect1` (`CONTACT_ID`),
  KEY `ix_b_socialservices_contact_connect2` (`LINK_ID`),
  KEY `ix_b_socialservices_contact_connect3` (`LAST_AUTHORIZE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_socialservices_message`
-- ----------------------------
DROP TABLE IF EXISTS `b_socialservices_message`;
CREATE TABLE `b_socialservices_message` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `SOCSERV_USER_ID` int(11) NOT NULL,
  `PROVIDER` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INSERT_DATE` datetime DEFAULT NULL,
  `SUCCES_SENT` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_socialservices_user`
-- ----------------------------
DROP TABLE IF EXISTS `b_socialservices_user`;
CREATE TABLE `b_socialservices_user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LOGIN` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_PHOTO` int(11) DEFAULT NULL,
  `EXTERNAL_AUTH_ID` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `XML_ID` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `CAN_DELETE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `PERSONAL_WWW` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERMISSIONS` varchar(555) COLLATE utf8_unicode_ci DEFAULT NULL,
  `OATOKEN` varchar(3000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `OATOKEN_EXPIRES` int(11) DEFAULT NULL,
  `OASECRET` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REFRESH_TOKEN` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SEND_ACTIVITY` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `SITE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INITIALIZED` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_SOCIALSERVICES_USER` (`XML_ID`,`EXTERNAL_AUTH_ID`),
  KEY `IX_B_SOCIALSERVICES_US_1` (`USER_ID`),
  KEY `IX_B_SOCIALSERVICES_US_3` (`LOGIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_socialservices_user_link`
-- ----------------------------
DROP TABLE IF EXISTS `b_socialservices_user_link`;
CREATE TABLE `b_socialservices_user_link` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `SOCSERV_USER_ID` int(11) NOT NULL,
  `LINK_USER_ID` int(11) DEFAULT NULL,
  `LINK_UID` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `LINK_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LINK_LAST_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LINK_PICTURE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LINK_EMAIL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_socialservices_user_link_5` (`SOCSERV_USER_ID`),
  KEY `ix_b_socialservices_user_link_6` (`LINK_USER_ID`,`TIMESTAMP_X`),
  KEY `ix_b_socialservices_user_link_7` (`LINK_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_sticker`
-- ----------------------------
DROP TABLE IF EXISTS `b_sticker`;
CREATE TABLE `b_sticker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PAGE_URL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PAGE_TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_CREATE` datetime NOT NULL,
  `DATE_UPDATE` datetime NOT NULL,
  `MODIFIED_BY` int(18) NOT NULL,
  `CREATED_BY` int(18) NOT NULL,
  `PERSONAL` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `CONTENT` text COLLATE utf8_unicode_ci,
  `POS_TOP` int(11) DEFAULT NULL,
  `POS_LEFT` int(11) DEFAULT NULL,
  `WIDTH` int(11) DEFAULT NULL,
  `HEIGHT` int(11) DEFAULT NULL,
  `COLOR` int(11) DEFAULT NULL,
  `COLLAPSED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `COMPLETED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `CLOSED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DELETED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `MARKER_TOP` int(11) DEFAULT NULL,
  `MARKER_LEFT` int(11) DEFAULT NULL,
  `MARKER_WIDTH` int(11) DEFAULT NULL,
  `MARKER_HEIGHT` int(11) DEFAULT NULL,
  `MARKER_ADJUST` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_sticker_group_task`
-- ----------------------------
DROP TABLE IF EXISTS `b_sticker_group_task`;
CREATE TABLE `b_sticker_group_task` (
  `GROUP_ID` int(11) NOT NULL,
  `TASK_ID` int(11) NOT NULL,
  PRIMARY KEY (`GROUP_ID`,`TASK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_subscription`
-- ----------------------------
DROP TABLE IF EXISTS `b_subscription`;
CREATE TABLE `b_subscription` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_INSERT` datetime NOT NULL,
  `DATE_UPDATE` datetime DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `EMAIL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `FORMAT` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `CONFIRM_CODE` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONFIRMED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DATE_CONFIRM` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_SUBSCRIPTION_EMAIL` (`EMAIL`,`USER_ID`),
  KEY `IX_DATE_CONFIRM` (`CONFIRMED`,`DATE_CONFIRM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_subscription_rubric`
-- ----------------------------
DROP TABLE IF EXISTS `b_subscription_rubric`;
CREATE TABLE `b_subscription_rubric` (
  `SUBSCRIPTION_ID` int(11) NOT NULL,
  `LIST_RUBRIC_ID` int(11) NOT NULL,
  UNIQUE KEY `UK_SUBSCRIPTION_RUBRIC` (`SUBSCRIPTION_ID`,`LIST_RUBRIC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_task`
-- ----------------------------
DROP TABLE IF EXISTS `b_task`;
CREATE TABLE `b_task` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `LETTER` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SYS` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BINDING` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'module',
  PRIMARY KEY (`ID`),
  KEY `ix_task` (`MODULE_ID`,`BINDING`,`LETTER`,`SYS`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `b_task`
-- ----------------------------
BEGIN;
INSERT INTO `b_task` VALUES ('1', 'main_denied', 'D', 'main', 'Y', null, 'module'), ('2', 'main_change_profile', 'P', 'main', 'Y', null, 'module'), ('3', 'main_view_all_settings', 'R', 'main', 'Y', null, 'module'), ('4', 'main_view_all_settings_change_profile', 'T', 'main', 'Y', null, 'module'), ('5', 'main_edit_subordinate_users', 'V', 'main', 'Y', null, 'module'), ('6', 'main_full_access', 'W', 'main', 'Y', null, 'module'), ('7', 'fm_folder_access_denied', 'D', 'main', 'Y', null, 'file'), ('8', 'fm_folder_access_read', 'R', 'main', 'Y', null, 'file'), ('9', 'fm_folder_access_write', 'W', 'main', 'Y', null, 'file'), ('10', 'fm_folder_access_full', 'X', 'main', 'Y', null, 'file'), ('11', 'fm_folder_access_workflow', 'U', 'main', 'Y', null, 'file'), ('12', 'clouds_denied', 'D', 'clouds', 'Y', null, 'module'), ('13', 'clouds_browse', 'F', 'clouds', 'Y', null, 'module'), ('14', 'clouds_upload', 'U', 'clouds', 'Y', null, 'module'), ('15', 'clouds_full_access', 'W', 'clouds', 'Y', null, 'module'), ('16', 'fileman_denied', 'D', 'fileman', 'Y', '', 'module'), ('17', 'fileman_allowed_folders', 'F', 'fileman', 'Y', '', 'module'), ('18', 'fileman_full_access', 'W', 'fileman', 'Y', '', 'module'), ('19', 'medialib_denied', 'D', 'fileman', 'Y', '', 'medialib'), ('20', 'medialib_view', 'F', 'fileman', 'Y', '', 'medialib'), ('21', 'medialib_only_new', 'R', 'fileman', 'Y', '', 'medialib'), ('22', 'medialib_edit_items', 'V', 'fileman', 'Y', '', 'medialib'), ('23', 'medialib_editor', 'W', 'fileman', 'Y', '', 'medialib'), ('24', 'medialib_full', 'X', 'fileman', 'Y', '', 'medialib'), ('25', 'stickers_denied', 'D', 'fileman', 'Y', '', 'stickers'), ('26', 'stickers_read', 'R', 'fileman', 'Y', '', 'stickers'), ('27', 'stickers_edit', 'W', 'fileman', 'Y', '', 'stickers'), ('28', 'iblock_deny', 'D', 'iblock', 'Y', null, 'iblock'), ('29', 'iblock_read', 'R', 'iblock', 'Y', null, 'iblock'), ('30', 'iblock_element_add', 'E', 'iblock', 'Y', null, 'iblock'), ('31', 'iblock_admin_read', 'S', 'iblock', 'Y', null, 'iblock'), ('32', 'iblock_admin_add', 'T', 'iblock', 'Y', null, 'iblock'), ('33', 'iblock_limited_edit', 'U', 'iblock', 'Y', null, 'iblock'), ('34', 'iblock_full_edit', 'W', 'iblock', 'Y', null, 'iblock'), ('35', 'iblock_full', 'X', 'iblock', 'Y', null, 'iblock'), ('36', 'security_denied', 'D', 'security', 'Y', null, 'module'), ('37', 'security_filter', 'F', 'security', 'Y', null, 'module'), ('38', 'security_otp', 'S', 'security', 'Y', null, 'module'), ('39', 'security_view_all_settings', 'T', 'security', 'Y', null, 'module'), ('40', 'security_full_access', 'W', 'security', 'Y', null, 'module'), ('41', 'seo_denied', 'D', 'seo', 'Y', '', 'module'), ('42', 'seo_edit', 'F', 'seo', 'Y', '', 'module'), ('43', 'seo_full_access', 'W', 'seo', 'Y', '', 'module');
COMMIT;

-- ----------------------------
--  Table structure for `b_task_operation`
-- ----------------------------
DROP TABLE IF EXISTS `b_task_operation`;
CREATE TABLE `b_task_operation` (
  `TASK_ID` int(18) NOT NULL,
  `OPERATION_ID` int(18) NOT NULL,
  PRIMARY KEY (`TASK_ID`,`OPERATION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `b_task_operation`
-- ----------------------------
BEGIN;
INSERT INTO `b_task_operation` VALUES ('2', '2'), ('2', '3'), ('3', '2'), ('3', '4'), ('3', '5'), ('3', '6'), ('3', '7'), ('4', '2'), ('4', '3'), ('4', '4'), ('4', '5'), ('4', '6'), ('4', '7'), ('5', '2'), ('5', '3'), ('5', '5'), ('5', '6'), ('5', '7'), ('5', '8'), ('5', '9'), ('6', '2'), ('6', '3'), ('6', '4'), ('6', '5'), ('6', '6'), ('6', '7'), ('6', '10'), ('6', '11'), ('6', '12'), ('6', '13'), ('6', '14'), ('6', '15'), ('6', '16'), ('6', '17'), ('6', '18'), ('8', '19'), ('8', '20'), ('8', '21'), ('9', '19'), ('9', '20'), ('9', '21'), ('9', '22'), ('9', '23'), ('9', '24'), ('9', '25'), ('9', '26'), ('9', '27'), ('9', '28'), ('9', '29'), ('9', '30'), ('9', '31'), ('9', '32'), ('9', '33'), ('9', '34'), ('10', '19'), ('10', '20'), ('10', '21'), ('10', '22'), ('10', '23'), ('10', '24'), ('10', '25'), ('10', '26'), ('10', '27'), ('10', '28'), ('10', '29'), ('10', '30'), ('10', '31'), ('10', '32'), ('10', '33'), ('10', '34'), ('10', '35'), ('11', '19'), ('11', '20'), ('11', '21'), ('11', '24'), ('11', '28'), ('13', '36'), ('14', '36'), ('14', '37'), ('15', '36'), ('15', '37'), ('15', '38'), ('17', '41'), ('17', '42'), ('17', '43'), ('17', '44'), ('17', '45'), ('17', '46'), ('17', '47'), ('17', '49'), ('17', '50'), ('18', '39'), ('18', '40'), ('18', '41'), ('18', '42'), ('18', '43'), ('18', '44'), ('18', '45'), ('18', '46'), ('18', '47'), ('18', '48'), ('18', '49'), ('18', '50'), ('18', '51'), ('20', '52'), ('21', '52'), ('21', '53'), ('21', '57'), ('22', '52'), ('22', '57'), ('22', '58'), ('22', '59'), ('23', '52'), ('23', '53'), ('23', '54'), ('23', '55'), ('23', '57'), ('23', '58'), ('23', '59'), ('24', '52'), ('24', '53'), ('24', '54'), ('24', '55'), ('24', '56'), ('24', '57'), ('24', '58'), ('24', '59'), ('26', '60'), ('27', '60'), ('27', '61'), ('27', '62'), ('27', '63'), ('29', '64'), ('29', '65'), ('30', '66'), ('31', '64'), ('31', '65'), ('31', '67'), ('32', '64'), ('32', '65'), ('32', '66'), ('32', '67'), ('33', '64'), ('33', '65'), ('33', '66'), ('33', '67'), ('33', '68'), ('33', '69'), ('33', '70'), ('33', '71'), ('34', '64'), ('34', '65'), ('34', '66'), ('34', '67'), ('34', '68'), ('34', '69'), ('34', '70'), ('34', '71'), ('34', '72'), ('34', '73'), ('34', '74'), ('34', '75'), ('35', '64'), ('35', '65'), ('35', '66'), ('35', '67'), ('35', '68'), ('35', '69'), ('35', '70'), ('35', '71'), ('35', '72'), ('35', '73'), ('35', '74'), ('35', '75'), ('35', '76'), ('35', '77'), ('35', '78'), ('35', '79'), ('35', '80'), ('35', '81'), ('37', '82'), ('38', '83'), ('39', '84'), ('39', '85'), ('39', '86'), ('39', '87'), ('39', '88'), ('39', '89'), ('39', '90'), ('39', '91'), ('39', '92'), ('39', '93'), ('39', '94'), ('40', '82'), ('40', '83'), ('40', '84'), ('40', '85'), ('40', '86'), ('40', '87'), ('40', '88'), ('40', '89'), ('40', '90'), ('40', '91'), ('40', '92'), ('40', '93'), ('40', '94'), ('40', '95'), ('40', '96'), ('40', '97'), ('40', '98'), ('40', '99'), ('40', '100'), ('40', '101'), ('40', '102'), ('40', '103'), ('40', '104'), ('40', '105'), ('40', '106'), ('40', '107'), ('42', '109'), ('43', '108'), ('43', '109');
COMMIT;

-- ----------------------------
--  Table structure for `b_undo`
-- ----------------------------
DROP TABLE IF EXISTS `b_undo`;
CREATE TABLE `b_undo` (
  `ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UNDO_TYPE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UNDO_HANDLER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTENT` mediumtext COLLATE utf8_unicode_ci,
  `USER_ID` int(11) DEFAULT NULL,
  `TIMESTAMP_X` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_urlpreview_metadata`
-- ----------------------------
DROP TABLE IF EXISTS `b_urlpreview_metadata`;
CREATE TABLE `b_urlpreview_metadata` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `URL` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'S',
  `DATE_INSERT` datetime NOT NULL,
  `DATE_EXPIRE` datetime DEFAULT NULL,
  `TITLE` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `IMAGE_ID` int(11) DEFAULT NULL,
  `IMAGE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMBED` mediumtext COLLATE utf8_unicode_ci,
  `EXTRA` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `IX_URLPREVIEW_METADATA_URL` (`URL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_urlpreview_route`
-- ----------------------------
DROP TABLE IF EXISTS `b_urlpreview_route`;
CREATE TABLE `b_urlpreview_route` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ROUTE` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CLASS` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `PARAMETERS` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_URLPREVIEW_ROUTE_ROUTE` (`ROUTE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_user`
-- ----------------------------
DROP TABLE IF EXISTS `b_user`;
CREATE TABLE `b_user` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LOGIN` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `PASSWORD` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CHECKWORD` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_LOGIN` datetime DEFAULT NULL,
  `DATE_REGISTER` datetime NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_PROFESSION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_WWW` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_ICQ` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_GENDER` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_BIRTHDATE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_PHOTO` int(18) DEFAULT NULL,
  `PERSONAL_PHONE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_FAX` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_MOBILE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_PAGER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_STREET` text COLLATE utf8_unicode_ci,
  `PERSONAL_MAILBOX` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_CITY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_STATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_ZIP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_COUNTRY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_NOTES` text COLLATE utf8_unicode_ci,
  `WORK_COMPANY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_DEPARTMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_POSITION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_WWW` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_PHONE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_FAX` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_PAGER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_STREET` text COLLATE utf8_unicode_ci,
  `WORK_MAILBOX` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_CITY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_STATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_ZIP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_COUNTRY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_PROFILE` text COLLATE utf8_unicode_ci,
  `WORK_LOGO` int(18) DEFAULT NULL,
  `WORK_NOTES` text COLLATE utf8_unicode_ci,
  `ADMIN_NOTES` text COLLATE utf8_unicode_ci,
  `STORED_HASH` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_BIRTHDAY` date DEFAULT NULL,
  `EXTERNAL_AUTH_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CHECKWORD_TIME` datetime DEFAULT NULL,
  `SECOND_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONFIRM_CODE` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LOGIN_ATTEMPTS` int(18) DEFAULT NULL,
  `LAST_ACTIVITY_DATE` datetime DEFAULT NULL,
  `AUTO_TIME_ZONE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TIME_ZONE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TIME_ZONE_OFFSET` int(18) DEFAULT NULL,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BX_USER_ID` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ix_login` (`LOGIN`,`EXTERNAL_AUTH_ID`),
  KEY `ix_b_user_email` (`EMAIL`),
  KEY `ix_b_user_activity_date` (`LAST_ACTIVITY_DATE`),
  KEY `IX_B_USER_XML_ID` (`XML_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `b_user`
-- ----------------------------
BEGIN;
INSERT INTO `b_user` VALUES ('1', '2017-05-05 16:51:13', 'admin', 'Fy9g0k709e29d9d2a61174c1b0b92e009b7030ef', 'ygM6Ylnd6645b34d4bf78dacd5c935df9fa3ac90', 'Y', 'Noa', 'Naoki', 'shog@3val.ru', '2017-05-10 15:15:45', '2017-05-05 16:51:13', null, null, null, null, '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2017-05-05 16:51:13', null, null, '0', null, null, null, null, null, null, null);
COMMIT;

-- ----------------------------
--  Table structure for `b_user_access`
-- ----------------------------
DROP TABLE IF EXISTS `b_user_access`;
CREATE TABLE `b_user_access` (
  `USER_ID` int(11) DEFAULT NULL,
  `PROVIDER_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACCESS_CODE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `ix_ua_user_provider` (`USER_ID`,`PROVIDER_ID`),
  KEY `ix_ua_user_access` (`USER_ID`,`ACCESS_CODE`),
  KEY `ix_ua_access` (`ACCESS_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `b_user_access`
-- ----------------------------
BEGIN;
INSERT INTO `b_user_access` VALUES ('0', 'group', 'G2'), ('1', 'group', 'G1'), ('1', 'group', 'G3'), ('1', 'group', 'G4'), ('1', 'group', 'G2'), ('1', 'user', 'U1');
COMMIT;

-- ----------------------------
--  Table structure for `b_user_access_check`
-- ----------------------------
DROP TABLE IF EXISTS `b_user_access_check`;
CREATE TABLE `b_user_access_check` (
  `USER_ID` int(11) DEFAULT NULL,
  `PROVIDER_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `ix_uac_user_provider` (`USER_ID`,`PROVIDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `b_user_access_check`
-- ----------------------------
BEGIN;
INSERT INTO `b_user_access_check` VALUES ('1', 'group'), ('1', 'user');
COMMIT;

-- ----------------------------
--  Table structure for `b_user_counter`
-- ----------------------------
DROP TABLE IF EXISTS `b_user_counter`;
CREATE TABLE `b_user_counter` (
  `USER_ID` int(18) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '**',
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CNT` int(18) NOT NULL DEFAULT '0',
  `LAST_DATE` datetime DEFAULT NULL,
  `TIMESTAMP_X` datetime NOT NULL DEFAULT '3000-01-01 00:00:00',
  `TAG` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PARAMS` text COLLATE utf8_unicode_ci,
  `SENT` char(1) COLLATE utf8_unicode_ci DEFAULT '0',
  PRIMARY KEY (`USER_ID`,`SITE_ID`,`CODE`),
  KEY `ix_buc_tag` (`TAG`),
  KEY `ix_buc_code` (`CODE`),
  KEY `ix_buc_ts` (`TIMESTAMP_X`),
  KEY `ix_buc_sent_userid` (`SENT`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_user_digest`
-- ----------------------------
DROP TABLE IF EXISTS `b_user_digest`;
CREATE TABLE `b_user_digest` (
  `USER_ID` int(11) NOT NULL,
  `DIGEST_HA1` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_user_field`
-- ----------------------------
DROP TABLE IF EXISTS `b_user_field`;
CREATE TABLE `b_user_field` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENTITY_ID` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD_NAME` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(11) DEFAULT NULL,
  `MULTIPLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `MANDATORY` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SHOW_FILTER` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SHOW_IN_LIST` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `EDIT_IN_LIST` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `IS_SEARCHABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SETTINGS` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_user_type_entity` (`ENTITY_ID`,`FIELD_NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `b_user_field`
-- ----------------------------
BEGIN;
INSERT INTO `b_user_field` VALUES ('1', 'BLOG_POST', 'UF_BLOG_POST_DOC', 'file', 'UF_BLOG_POST_DOC', '100', 'Y', 'N', 'N', 'N', 'Y', 'Y', 'a:0:{}'), ('2', 'BLOG_COMMENT', 'UF_BLOG_COMMENT_DOC', 'file', 'UF_BLOG_COMMENT_DOC', '100', 'Y', 'N', 'N', 'N', 'Y', 'Y', 'a:0:{}'), ('3', 'BLOG_POST', 'UF_BLOG_POST_URL_PRV', 'url_preview', 'UF_BLOG_POST_URL_PRV', '100', 'N', 'N', 'N', 'N', 'Y', 'Y', 'a:0:{}'), ('4', 'BLOG_COMMENT', 'UF_BLOG_COMM_URL_PRV', 'url_preview', 'UF_BLOG_COMM_URL_PRV', '100', 'N', 'N', 'N', 'N', 'Y', 'Y', 'a:0:{}'), ('5', 'BLOG_POST', 'UF_GRATITUDE', 'integer', 'UF_GRATITUDE', '100', 'N', 'N', 'N', 'N', 'Y', 'N', 'a:0:{}'), ('6', 'FORUM_MESSAGE', 'UF_FORUM_MES_URL_PRV', 'url_preview', 'UF_FORUM_MES_URL_PRV', '100', 'N', 'N', 'N', 'N', 'Y', 'N', 'a:0:{}');
COMMIT;

-- ----------------------------
--  Table structure for `b_user_field_confirm`
-- ----------------------------
DROP TABLE IF EXISTS `b_user_field_confirm`;
CREATE TABLE `b_user_field_confirm` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(18) NOT NULL,
  `DATE_CHANGE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `FIELD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `FIELD_VALUE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CONFIRM_CODE` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_user_field_confirm1` (`USER_ID`,`CONFIRM_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_user_field_enum`
-- ----------------------------
DROP TABLE IF EXISTS `b_user_field_enum`;
CREATE TABLE `b_user_field_enum` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_FIELD_ID` int(11) DEFAULT NULL,
  `VALUE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DEF` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_user_field_enum` (`USER_FIELD_ID`,`XML_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_user_field_lang`
-- ----------------------------
DROP TABLE IF EXISTS `b_user_field_lang`;
CREATE TABLE `b_user_field_lang` (
  `USER_FIELD_ID` int(11) NOT NULL DEFAULT '0',
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `EDIT_FORM_LABEL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LIST_COLUMN_LABEL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LIST_FILTER_LABEL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ERROR_MESSAGE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HELP_MESSAGE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`USER_FIELD_ID`,`LANGUAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_user_group`
-- ----------------------------
DROP TABLE IF EXISTS `b_user_group`;
CREATE TABLE `b_user_group` (
  `USER_ID` int(18) NOT NULL,
  `GROUP_ID` int(18) NOT NULL,
  `DATE_ACTIVE_FROM` datetime DEFAULT NULL,
  `DATE_ACTIVE_TO` datetime DEFAULT NULL,
  UNIQUE KEY `ix_user_group` (`USER_ID`,`GROUP_ID`),
  KEY `ix_user_group_group` (`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `b_user_group`
-- ----------------------------
BEGIN;
INSERT INTO `b_user_group` VALUES ('1', '1', null, null), ('1', '3', null, null), ('1', '4', null, null);
COMMIT;

-- ----------------------------
--  Table structure for `b_user_hit_auth`
-- ----------------------------
DROP TABLE IF EXISTS `b_user_hit_auth`;
CREATE TABLE `b_user_hit_auth` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(18) NOT NULL,
  `HASH` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `IX_USER_HIT_AUTH_1` (`HASH`),
  KEY `IX_USER_HIT_AUTH_2` (`USER_ID`),
  KEY `IX_USER_HIT_AUTH_3` (`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_user_option`
-- ----------------------------
DROP TABLE IF EXISTS `b_user_option`;
CREATE TABLE `b_user_option` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `CATEGORY` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` mediumtext COLLATE utf8_unicode_ci,
  `COMMON` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_user_category_name` (`USER_ID`,`CATEGORY`,`NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `b_user_option`
-- ----------------------------
BEGIN;
INSERT INTO `b_user_option` VALUES ('1', '0', 'intranet', '~gadgets_admin_index', 'a:1:{i:0;a:1:{s:7:\"GADGETS\";a:7:{s:20:\"ADMIN_INFO@333333333\";a:3:{s:6:\"COLUMN\";i:0;s:3:\"ROW\";i:0;s:4:\"HIDE\";s:1:\"N\";}s:19:\"HTML_AREA@444444444\";a:5:{s:6:\"COLUMN\";i:0;s:3:\"ROW\";i:1;s:4:\"HIDE\";s:1:\"N\";s:8:\"USERDATA\";a:1:{s:7:\"content\";s:797:\"<table class=\"bx-gadgets-info-site-table\" cellspacing=\"0\"><tr>	<td class=\"bx-gadget-gray\">Создатель сайта:</td>	<td>Группа компаний &laquo;1С-Битрикс&raquo;.</td>	<td class=\"bx-gadgets-info-site-logo\" rowspan=\"5\"><img src=\"/bitrix/components/bitrix/desktop/templates/admin/images/site_logo.png\"></td></tr><tr>	<td class=\"bx-gadget-gray\">Адрес сайта:</td>	<td><a href=\"http://www.1c-bitrix.ru\">www.1c-bitrix.ru</a></td></tr><tr>	<td class=\"bx-gadget-gray\">Сайт сдан:</td>	<td>12 декабря 2010 г.</td></tr><tr>	<td class=\"bx-gadget-gray\">Ответственное лицо:</td>	<td>Иван Иванов</td></tr><tr>	<td class=\"bx-gadget-gray\">E-mail:</td>	<td><a href=\"mailto:info@1c-bitrix.ru\">info@1c-bitrix.ru</a></td></tr></table>\";}s:8:\"SETTINGS\";a:1:{s:9:\"TITLE_STD\";s:34:\"Информация о сайте\";}}s:25:\"ADMIN_CHECKLIST@777888999\";a:3:{s:6:\"COLUMN\";i:0;s:3:\"ROW\";i:2;s:4:\"HIDE\";s:1:\"N\";}s:19:\"RSSREADER@777777777\";a:4:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:3;s:4:\"HIDE\";s:1:\"N\";s:8:\"SETTINGS\";a:3:{s:9:\"TITLE_STD\";s:33:\"Новости 1С-Битрикс\";s:3:\"CNT\";i:10;s:7:\"RSS_URL\";s:45:\"https://www.1c-bitrix.ru/about/life/news/rss/\";}}s:24:\"ADMIN_SECURITY@555555555\";a:3:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:0;s:4:\"HIDE\";s:1:\"N\";}s:23:\"ADMIN_PERFMON@666666666\";a:3:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:1;s:4:\"HIDE\";s:1:\"N\";}s:23:\"ADMIN_MARKETPALCE@22549\";a:3:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:2;s:4:\"HIDE\";s:1:\"N\";}}}}', 'Y'), ('2', '0', 'main.interface', 'global', 'a:1:{s:5:\"theme\";s:3:\"red\";}', 'Y'), ('3', '0', 'form', 'form_element_1', 'a:1:{s:4:\"tabs\";s:960:\"edit1--#--Фотография--,--ACTIVE--#--  Запись активна--,--NAME--#--*Название--,--IBLOCK_ELEMENT_PROP_VALUE--#----Значения свойств--,--PREVIEW_PICTURE--#--  Картинка для анонса--,--DETAIL_PICTURE--#--  Детальная картинка--,--PROPERTY_2--#--  Оригинал--,--PROPERTY_8--#--  Рейтинг--,--PROPERTY_6--#--  Количество голосов--,--PROPERTY_7--#--  Сумма голосов--,--PROPERTY_1--#--  Элемент одобрен--,--PROPERTY_3--#--  Элемент опубликован--;--edit6--#--Описание--,--PREVIEW_TEXT--#--  Описание для анонса--,--DETAIL_TEXT--#--  Детальное описание--;--edit2--#--Разделы--,--SECTIONS--#--  Разделы--;--edit3--#--Дополнительно--,--SORT--#--  Индекс сортировки--,--CODE--#--  Символьный код--,--TAGS--#--  Теги--;--\";}', 'Y'), ('4', '1', 'admin_panel', 'settings', 'a:2:{s:4:\"edit\";s:3:\"off\";s:9:\"collapsed\";s:2:\"on\";}', 'N'), ('5', '1', 'favorite', 'favorite_menu', 'a:1:{s:5:\"stick\";s:1:\"N\";}', 'N'), ('6', '1', 'main', 'helper_hero_admin', 'a:1:{s:4:\"time\";s:10:\"1494415432\";}', 'N'), ('8', '1', 'socialservices', 'networkPopup', 'a:1:{s:9:\"showcount\";s:1:\"1\";}', 'N'), ('10', '1', 'admin_menu', 'pos', 'a:1:{s:8:\"sections\";s:34:\"menu_iblock,menu_fileman,menu_blog\";}', 'N');
COMMIT;

-- ----------------------------
--  Table structure for `b_user_stored_auth`
-- ----------------------------
DROP TABLE IF EXISTS `b_user_stored_auth`;
CREATE TABLE `b_user_stored_auth` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(18) NOT NULL,
  `DATE_REG` datetime NOT NULL,
  `LAST_AUTH` datetime NOT NULL,
  `STORED_HASH` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `TEMP_HASH` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IP_ADDR` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ux_user_hash` (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `b_user_stored_auth`
-- ----------------------------
BEGIN;
INSERT INTO `b_user_stored_auth` VALUES ('1', '1', '2017-05-05 16:51:13', '2017-05-10 15:15:45', 'fca2f9bef0b210fdb6f1a439609f83e4', 'N', '0');
COMMIT;

-- ----------------------------
--  Table structure for `b_utm_blog_comment`
-- ----------------------------
DROP TABLE IF EXISTS `b_utm_blog_comment`;
CREATE TABLE `b_utm_blog_comment` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `VALUE_ID` int(11) NOT NULL,
  `FIELD_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci,
  `VALUE_INT` int(11) DEFAULT NULL,
  `VALUE_DOUBLE` float DEFAULT NULL,
  `VALUE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_utm_BLOG_COMMENT_1` (`FIELD_ID`),
  KEY `ix_utm_BLOG_COMMENT_2` (`VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_utm_blog_post`
-- ----------------------------
DROP TABLE IF EXISTS `b_utm_blog_post`;
CREATE TABLE `b_utm_blog_post` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `VALUE_ID` int(11) NOT NULL,
  `FIELD_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci,
  `VALUE_INT` int(11) DEFAULT NULL,
  `VALUE_DOUBLE` float DEFAULT NULL,
  `VALUE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_utm_BLOG_POST_1` (`FIELD_ID`),
  KEY `ix_utm_BLOG_POST_2` (`VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_utm_forum_message`
-- ----------------------------
DROP TABLE IF EXISTS `b_utm_forum_message`;
CREATE TABLE `b_utm_forum_message` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `VALUE_ID` int(11) NOT NULL,
  `FIELD_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci,
  `VALUE_INT` int(11) DEFAULT NULL,
  `VALUE_DOUBLE` float DEFAULT NULL,
  `VALUE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_utm_FORUM_MESSAGE_1` (`FIELD_ID`),
  KEY `ix_utm_FORUM_MESSAGE_2` (`VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_uts_blog_comment`
-- ----------------------------
DROP TABLE IF EXISTS `b_uts_blog_comment`;
CREATE TABLE `b_uts_blog_comment` (
  `VALUE_ID` int(11) NOT NULL,
  `UF_BLOG_COMMENT_DOC` text COLLATE utf8_unicode_ci,
  `UF_BLOG_COMM_URL_PRV` int(11) DEFAULT NULL,
  PRIMARY KEY (`VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_uts_blog_post`
-- ----------------------------
DROP TABLE IF EXISTS `b_uts_blog_post`;
CREATE TABLE `b_uts_blog_post` (
  `VALUE_ID` int(11) NOT NULL,
  `UF_BLOG_POST_DOC` text COLLATE utf8_unicode_ci,
  `UF_BLOG_POST_URL_PRV` int(11) DEFAULT NULL,
  `UF_GRATITUDE` int(18) DEFAULT NULL,
  PRIMARY KEY (`VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_uts_forum_message`
-- ----------------------------
DROP TABLE IF EXISTS `b_uts_forum_message`;
CREATE TABLE `b_uts_forum_message` (
  `VALUE_ID` int(11) NOT NULL,
  `UF_FORUM_MES_URL_PRV` int(11) DEFAULT NULL,
  PRIMARY KEY (`VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_vote`
-- ----------------------------
DROP TABLE IF EXISTS `b_vote`;
CREATE TABLE `b_vote` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CHANNEL_ID` int(18) NOT NULL DEFAULT '0',
  `C_SORT` int(18) DEFAULT '100',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NOTIFY` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `AUTHOR_ID` int(18) DEFAULT NULL,
  `TIMESTAMP_X` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DATE_START` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DATE_END` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COUNTER` int(11) NOT NULL DEFAULT '0',
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `DESCRIPTION_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'html',
  `IMAGE_ID` int(18) DEFAULT NULL,
  `EVENT1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EVENT2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EVENT3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UNIQUE_TYPE` int(18) NOT NULL DEFAULT '2',
  `KEEP_IP_SEC` int(18) DEFAULT NULL,
  `DELAY` int(18) DEFAULT NULL,
  `DELAY_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TEMPLATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RESULT_TEMPLATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_CHANNEL_ID` (`CHANNEL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_vote_answer`
-- ----------------------------
DROP TABLE IF EXISTS `b_vote_answer`;
CREATE TABLE `b_vote_answer` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `TIMESTAMP_X` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `QUESTION_ID` int(18) NOT NULL DEFAULT '0',
  `C_SORT` int(18) DEFAULT '100',
  `MESSAGE` text COLLATE utf8_unicode_ci,
  `MESSAGE_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'html',
  `COUNTER` int(18) NOT NULL DEFAULT '0',
  `FIELD_TYPE` int(5) NOT NULL DEFAULT '0',
  `FIELD_WIDTH` int(18) DEFAULT NULL,
  `FIELD_HEIGHT` int(18) DEFAULT NULL,
  `FIELD_PARAM` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COLOR` varchar(7) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_QUESTION_ID` (`QUESTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_vote_channel`
-- ----------------------------
DROP TABLE IF EXISTS `b_vote_channel`;
CREATE TABLE `b_vote_channel` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `SYMBOLIC_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `C_SORT` int(18) DEFAULT '100',
  `FIRST_SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `HIDDEN` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `TIMESTAMP_X` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `VOTE_SINGLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `USE_CAPTCHA` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_vote_channel_2_group`
-- ----------------------------
DROP TABLE IF EXISTS `b_vote_channel_2_group`;
CREATE TABLE `b_vote_channel_2_group` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CHANNEL_ID` int(18) NOT NULL DEFAULT '0',
  `GROUP_ID` int(18) NOT NULL DEFAULT '0',
  `PERMISSION` int(18) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IX_VOTE_CHANNEL_ID_GROUP_ID` (`CHANNEL_ID`,`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_vote_channel_2_site`
-- ----------------------------
DROP TABLE IF EXISTS `b_vote_channel_2_site`;
CREATE TABLE `b_vote_channel_2_site` (
  `CHANNEL_ID` int(18) NOT NULL DEFAULT '0',
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`CHANNEL_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_vote_event`
-- ----------------------------
DROP TABLE IF EXISTS `b_vote_event`;
CREATE TABLE `b_vote_event` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `VOTE_ID` int(18) NOT NULL DEFAULT '0',
  `VOTE_USER_ID` int(18) NOT NULL DEFAULT '0',
  `DATE_VOTE` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `STAT_SESSION_ID` int(18) DEFAULT NULL,
  `IP` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VALID` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`ID`),
  KEY `IX_USER_ID` (`VOTE_USER_ID`),
  KEY `IX_B_VOTE_EVENT_2` (`VOTE_ID`,`IP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_vote_event_answer`
-- ----------------------------
DROP TABLE IF EXISTS `b_vote_event_answer`;
CREATE TABLE `b_vote_event_answer` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `EVENT_QUESTION_ID` int(18) NOT NULL DEFAULT '0',
  `ANSWER_ID` int(18) NOT NULL DEFAULT '0',
  `MESSAGE` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `IX_EVENT_QUESTION_ID` (`EVENT_QUESTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_vote_event_question`
-- ----------------------------
DROP TABLE IF EXISTS `b_vote_event_question`;
CREATE TABLE `b_vote_event_question` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `EVENT_ID` int(18) NOT NULL DEFAULT '0',
  `QUESTION_ID` int(18) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IX_EVENT_ID` (`EVENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_vote_question`
-- ----------------------------
DROP TABLE IF EXISTS `b_vote_question`;
CREATE TABLE `b_vote_question` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `TIMESTAMP_X` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `VOTE_ID` int(18) NOT NULL DEFAULT '0',
  `C_SORT` int(18) DEFAULT '100',
  `COUNTER` int(11) NOT NULL DEFAULT '0',
  `QUESTION` text COLLATE utf8_unicode_ci NOT NULL,
  `QUESTION_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'html',
  `IMAGE_ID` int(18) DEFAULT NULL,
  `DIAGRAM` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `REQUIRED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DIAGRAM_TYPE` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'histogram',
  `TEMPLATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TEMPLATE_NEW` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_VOTE_ID` (`VOTE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_vote_user`
-- ----------------------------
DROP TABLE IF EXISTS `b_vote_user`;
CREATE TABLE `b_vote_user` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `STAT_GUEST_ID` int(18) DEFAULT NULL,
  `AUTH_USER_ID` int(18) DEFAULT NULL,
  `COUNTER` int(18) NOT NULL DEFAULT '0',
  `DATE_FIRST` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DATE_LAST` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `LAST_IP` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `b_xml_tree`
-- ----------------------------
DROP TABLE IF EXISTS `b_xml_tree`;
CREATE TABLE `b_xml_tree` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PARENT_ID` int(11) DEFAULT NULL,
  `LEFT_MARGIN` int(11) DEFAULT NULL,
  `RIGHT_MARGIN` int(11) DEFAULT NULL,
  `DEPTH_LEVEL` int(11) DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VALUE` longtext COLLATE utf8_unicode_ci,
  `ATTRIBUTES` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `ix_b_xml_tree_parent` (`PARENT_ID`),
  KEY `ix_b_xml_tree_left` (`LEFT_MARGIN`)
) ENGINE=InnoDB AUTO_INCREMENT=1042 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `b_xml_tree`
-- ----------------------------
BEGIN;
INSERT INTO `b_xml_tree` VALUES ('1', '0', '1', '2056', '0', 'КоммерческаяИнформация', null, 'a:2:{s:22:\"ВерсияСхемы\";s:5:\"2.021\";s:32:\"ДатаФормирования\";s:19:\"2008-09-27T15:33:51\";}'), ('2', '1', '2', '381', '1', 'Классификатор', null, null), ('3', '2', '3', '4', '2', 'Ид', '26', null), ('4', '2', '5', '6', '2', 'Наименование', 'Фотогалерея пользователей', null), ('5', '2', '7', '360', '2', 'Свойства', null, null), ('6', '5', '8', '15', '3', 'Свойство', null, null), ('7', '6', '9', '10', '4', 'Ид', 'CML2_CODE', null), ('8', '6', '11', '12', '4', 'Наименование', 'Символьный код', null), ('9', '6', '13', '14', '4', 'Множественное', 'false', null), ('10', '5', '16', '23', '3', 'Свойство', null, null), ('11', '10', '17', '18', '4', 'Ид', 'CML2_SORT', null), ('12', '10', '19', '20', '4', 'Наименование', 'Сортировка', null), ('13', '10', '21', '22', '4', 'Множественное', 'false', null), ('14', '5', '24', '31', '3', 'Свойство', null, null), ('15', '14', '25', '26', '4', 'Ид', 'CML2_ACTIVE_FROM', null), ('16', '14', '27', '28', '4', 'Наименование', 'Начало активности', null), ('17', '14', '29', '30', '4', 'Множественное', 'false', null), ('18', '5', '32', '39', '3', 'Свойство', null, null), ('19', '18', '33', '34', '4', 'Ид', 'CML2_ACTIVE_TO', null), ('20', '18', '35', '36', '4', 'Наименование', 'Окончание активности', null), ('21', '18', '37', '38', '4', 'Множественное', 'false', null), ('22', '5', '40', '47', '3', 'Свойство', null, null), ('23', '22', '41', '42', '4', 'Ид', 'CML2_PREVIEW_TEXT', null), ('24', '22', '43', '44', '4', 'Наименование', 'Анонс', null), ('25', '22', '45', '46', '4', 'Множественное', 'false', null), ('26', '5', '48', '55', '3', 'Свойство', null, null), ('27', '26', '49', '50', '4', 'Ид', 'CML2_PREVIEW_PICTURE', null), ('28', '26', '51', '52', '4', 'Наименование', 'Картинка анонса', null), ('29', '26', '53', '54', '4', 'Множественное', 'false', null), ('30', '5', '56', '93', '3', 'Свойство', null, null), ('31', '30', '57', '58', '4', 'Ид', '69', null), ('32', '30', '59', '60', '4', 'Наименование', 'Элемент одобрен', null), ('33', '30', '61', '62', '4', 'Множественное', 'false', null), ('34', '30', '63', '64', '4', 'БитриксСортировка', '500', null), ('35', '30', '65', '66', '4', 'БитриксКод', 'APPROVE_ELEMENT', null), ('36', '30', '67', '68', '4', 'БитриксЗначениеПоУмолчанию', null, null), ('37', '30', '69', '70', '4', 'БитриксТипСвойства', 'S', null), ('38', '30', '71', '72', '4', 'БитриксСтрок', '1', null), ('39', '30', '73', '74', '4', 'БитриксКолонок', '30', null), ('40', '30', '75', '76', '4', 'БитриксТипСписка', 'L', null), ('41', '30', '77', '78', '4', 'БитриксТипыФайлов', null, null), ('42', '30', '79', '80', '4', 'БитриксКоличествоПолей', '0', null), ('43', '30', '81', '82', '4', 'БитриксСвязанныйИнфоблок', null, null), ('44', '30', '83', '84', '4', 'БитриксОписаниеРазрешено', 'false', null), ('45', '30', '85', '86', '4', 'БитриксПоискРазрешен', 'false', null), ('46', '30', '87', '88', '4', 'БитриксФильтрРазрешен', 'false', null), ('47', '30', '89', '90', '4', 'БитриксРасширениеТипа', null, null), ('48', '30', '91', '92', '4', 'БитриксОбязательное', 'false', null), ('49', '5', '94', '131', '3', 'Свойство', null, null), ('50', '49', '95', '96', '4', 'Ид', '67', null), ('51', '49', '97', '98', '4', 'Наименование', 'Оригинал', null), ('52', '49', '99', '100', '4', 'Множественное', 'false', null), ('53', '49', '101', '102', '4', 'БитриксСортировка', '500', null), ('54', '49', '103', '104', '4', 'БитриксКод', 'REAL_PICTURE', null), ('55', '49', '105', '106', '4', 'БитриксЗначениеПоУмолчанию', null, null), ('56', '49', '107', '108', '4', 'БитриксТипСвойства', 'F', null), ('57', '49', '109', '110', '4', 'БитриксСтрок', '1', null), ('58', '49', '111', '112', '4', 'БитриксКолонок', '30', null), ('59', '49', '113', '114', '4', 'БитриксТипСписка', 'L', null), ('60', '49', '115', '116', '4', 'БитриксТипыФайлов', 'jpg, gif, bmp, png, jpeg', null), ('61', '49', '117', '118', '4', 'БитриксКоличествоПолей', '0', null), ('62', '49', '119', '120', '4', 'БитриксСвязанныйИнфоблок', null, null), ('63', '49', '121', '122', '4', 'БитриксОписаниеРазрешено', 'false', null), ('64', '49', '123', '124', '4', 'БитриксПоискРазрешен', 'false', null), ('65', '49', '125', '126', '4', 'БитриксФильтрРазрешен', 'false', null), ('66', '49', '127', '128', '4', 'БитриксРасширениеТипа', null, null), ('67', '49', '129', '130', '4', 'БитриксОбязательное', 'false', null), ('68', '5', '132', '169', '3', 'Свойство', null, null), ('69', '68', '133', '134', '4', 'Ид', '68', null), ('70', '68', '135', '136', '4', 'Наименование', 'Элемент опубликован', null), ('71', '68', '137', '138', '4', 'Множественное', 'false', null), ('72', '68', '139', '140', '4', 'БитриксСортировка', '500', null), ('73', '68', '141', '142', '4', 'БитриксКод', 'PUBLIC_ELEMENT', null), ('74', '68', '143', '144', '4', 'БитриксЗначениеПоУмолчанию', null, null), ('75', '68', '145', '146', '4', 'БитриксТипСвойства', 'S', null), ('76', '68', '147', '148', '4', 'БитриксСтрок', '1', null), ('77', '68', '149', '150', '4', 'БитриксКолонок', '30', null), ('78', '68', '151', '152', '4', 'БитриксТипСписка', 'L', null), ('79', '68', '153', '154', '4', 'БитриксТипыФайлов', null, null), ('80', '68', '155', '156', '4', 'БитриксКоличествоПолей', '0', null), ('81', '68', '157', '158', '4', 'БитриксСвязанныйИнфоблок', null, null), ('82', '68', '159', '160', '4', 'БитриксОписаниеРазрешено', 'false', null), ('83', '68', '161', '162', '4', 'БитриксПоискРазрешен', 'false', null), ('84', '68', '163', '164', '4', 'БитриксФильтрРазрешен', 'false', null), ('85', '68', '165', '166', '4', 'БитриксРасширениеТипа', null, null), ('86', '68', '167', '168', '4', 'БитриксОбязательное', 'false', null), ('87', '5', '170', '207', '3', 'Свойство', null, null), ('88', '87', '171', '172', '4', 'Ид', '70', null), ('89', '87', '173', '174', '4', 'Наименование', 'Тема форума для комментариев', null), ('90', '87', '175', '176', '4', 'Множественное', 'false', null), ('91', '87', '177', '178', '4', 'БитриксСортировка', '500', null), ('92', '87', '179', '180', '4', 'БитриксКод', 'FORUM_TOPIC_ID', null), ('93', '87', '181', '182', '4', 'БитриксЗначениеПоУмолчанию', null, null), ('94', '87', '183', '184', '4', 'БитриксТипСвойства', 'S', null), ('95', '87', '185', '186', '4', 'БитриксСтрок', '1', null), ('96', '87', '187', '188', '4', 'БитриксКолонок', '30', null), ('97', '87', '189', '190', '4', 'БитриксТипСписка', 'L', null), ('98', '87', '191', '192', '4', 'БитриксТипыФайлов', null, null), ('99', '87', '193', '194', '4', 'БитриксКоличествоПолей', '0', null), ('100', '87', '195', '196', '4', 'БитриксСвязанныйИнфоблок', null, null), ('101', '87', '197', '198', '4', 'БитриксОписаниеРазрешено', 'false', null), ('102', '87', '199', '200', '4', 'БитриксПоискРазрешен', 'false', null), ('103', '87', '201', '202', '4', 'БитриксФильтрРазрешен', 'false', null), ('104', '87', '203', '204', '4', 'БитриксРасширениеТипа', 'TopicID', null), ('105', '87', '205', '206', '4', 'БитриксОбязательное', 'false', null), ('106', '5', '208', '245', '3', 'Свойство', null, null), ('107', '106', '209', '210', '4', 'Ид', '71', null), ('108', '106', '211', '212', '4', 'Наименование', 'Количество комментариев к элементу', null), ('109', '106', '213', '214', '4', 'Множественное', 'false', null), ('110', '106', '215', '216', '4', 'БитриксСортировка', '500', null), ('111', '106', '217', '218', '4', 'БитриксКод', 'FORUM_MESSAGE_CNT', null), ('112', '106', '219', '220', '4', 'БитриксЗначениеПоУмолчанию', null, null), ('113', '106', '221', '222', '4', 'БитриксТипСвойства', 'N', null), ('114', '106', '223', '224', '4', 'БитриксСтрок', '1', null), ('115', '106', '225', '226', '4', 'БитриксКолонок', '30', null), ('116', '106', '227', '228', '4', 'БитриксТипСписка', 'L', null), ('117', '106', '229', '230', '4', 'БитриксТипыФайлов', null, null), ('118', '106', '231', '232', '4', 'БитриксКоличествоПолей', '0', null), ('119', '106', '233', '234', '4', 'БитриксСвязанныйИнфоблок', null, null), ('120', '106', '235', '236', '4', 'БитриксОписаниеРазрешено', 'false', null), ('121', '106', '237', '238', '4', 'БитриксПоискРазрешен', 'false', null), ('122', '106', '239', '240', '4', 'БитриксФильтрРазрешен', 'false', null), ('123', '106', '241', '242', '4', 'БитриксРасширениеТипа', null, null), ('124', '106', '243', '244', '4', 'БитриксОбязательное', 'false', null), ('125', '5', '246', '283', '3', 'Свойство', null, null), ('126', '125', '247', '248', '4', 'Ид', '72', null), ('127', '125', '249', '250', '4', 'Наименование', 'Количество голосов', null), ('128', '125', '251', '252', '4', 'Множественное', 'false', null), ('129', '125', '253', '254', '4', 'БитриксСортировка', '500', null), ('130', '125', '255', '256', '4', 'БитриксКод', 'vote_count', null), ('131', '125', '257', '258', '4', 'БитриксЗначениеПоУмолчанию', null, null), ('132', '125', '259', '260', '4', 'БитриксТипСвойства', 'N', null), ('133', '125', '261', '262', '4', 'БитриксСтрок', '1', null), ('134', '125', '263', '264', '4', 'БитриксКолонок', '30', null), ('135', '125', '265', '266', '4', 'БитриксТипСписка', 'L', null), ('136', '125', '267', '268', '4', 'БитриксТипыФайлов', null, null), ('137', '125', '269', '270', '4', 'БитриксКоличествоПолей', '0', null), ('138', '125', '271', '272', '4', 'БитриксСвязанныйИнфоблок', null, null), ('139', '125', '273', '274', '4', 'БитриксОписаниеРазрешено', 'false', null), ('140', '125', '275', '276', '4', 'БитриксПоискРазрешен', 'false', null), ('141', '125', '277', '278', '4', 'БитриксФильтрРазрешен', 'false', null), ('142', '125', '279', '280', '4', 'БитриксРасширениеТипа', null, null), ('143', '125', '281', '282', '4', 'БитриксОбязательное', 'false', null), ('144', '5', '284', '321', '3', 'Свойство', null, null), ('145', '144', '285', '286', '4', 'Ид', '73', null), ('146', '144', '287', '288', '4', 'Наименование', 'Сумма голосов', null), ('147', '144', '289', '290', '4', 'Множественное', 'false', null), ('148', '144', '291', '292', '4', 'БитриксСортировка', '500', null), ('149', '144', '293', '294', '4', 'БитриксКод', 'vote_sum', null), ('150', '144', '295', '296', '4', 'БитриксЗначениеПоУмолчанию', null, null), ('151', '144', '297', '298', '4', 'БитриксТипСвойства', 'N', null), ('152', '144', '299', '300', '4', 'БитриксСтрок', '1', null), ('153', '144', '301', '302', '4', 'БитриксКолонок', '30', null), ('154', '144', '303', '304', '4', 'БитриксТипСписка', 'L', null), ('155', '144', '305', '306', '4', 'БитриксТипыФайлов', null, null), ('156', '144', '307', '308', '4', 'БитриксКоличествоПолей', '0', null), ('157', '144', '309', '310', '4', 'БитриксСвязанныйИнфоблок', null, null), ('158', '144', '311', '312', '4', 'БитриксОписаниеРазрешено', 'false', null), ('159', '144', '313', '314', '4', 'БитриксПоискРазрешен', 'false', null), ('160', '144', '315', '316', '4', 'БитриксФильтрРазрешен', 'false', null), ('161', '144', '317', '318', '4', 'БитриксРасширениеТипа', null, null), ('162', '144', '319', '320', '4', 'БитриксОбязательное', 'false', null), ('163', '5', '322', '359', '3', 'Свойство', null, null), ('164', '163', '323', '324', '4', 'Ид', '74', null), ('165', '163', '325', '326', '4', 'Наименование', 'Рейтинг', null), ('166', '163', '327', '328', '4', 'Множественное', 'false', null), ('167', '163', '329', '330', '4', 'БитриксСортировка', '500', null), ('168', '163', '331', '332', '4', 'БитриксКод', 'rating', null), ('169', '163', '333', '334', '4', 'БитриксЗначениеПоУмолчанию', null, null), ('170', '163', '335', '336', '4', 'БитриксТипСвойства', 'N', null), ('171', '163', '337', '338', '4', 'БитриксСтрок', '1', null), ('172', '163', '339', '340', '4', 'БитриксКолонок', '30', null), ('173', '163', '341', '342', '4', 'БитриксТипСписка', 'L', null), ('174', '163', '343', '344', '4', 'БитриксТипыФайлов', null, null), ('175', '163', '345', '346', '4', 'БитриксКоличествоПолей', '0', null), ('176', '163', '347', '348', '4', 'БитриксСвязанныйИнфоблок', null, null), ('177', '163', '349', '350', '4', 'БитриксОписаниеРазрешено', 'false', null), ('178', '163', '351', '352', '4', 'БитриксПоискРазрешен', 'false', null), ('179', '163', '353', '354', '4', 'БитриксФильтрРазрешен', 'false', null), ('180', '163', '355', '356', '4', 'БитриксРасширениеТипа', null, null), ('181', '163', '357', '358', '4', 'БитриксОбязательное', 'false', null), ('182', '2', '361', '380', '2', 'Группы', null, null), ('183', '182', '362', '379', '3', 'Группа', null, null), ('184', '183', '363', '364', '4', 'Ид', '751', null), ('185', '183', '365', '366', '4', 'Наименование', 'Корпоративный выезд на косу', null), ('186', '183', '367', '368', '4', 'Описание', 'День рождения компании на косе.', null), ('187', '183', '369', '370', '4', 'БитриксСортировка', '500', null), ('188', '183', '371', '372', '4', 'БитриксКод', null, null), ('189', '183', '373', '374', '4', 'БитриксКартинка', 'user_photogallery_files/iblock/7a4/7a488362c2e0f0bc584012624d519232.jpg', null), ('190', '183', '375', '376', '4', 'БитриксКартинкаДетальная', 'user_photogallery_files/iblock/9e7/9e79156cc17203589bc3f86da271515e.jpg', null), ('191', '183', '377', '378', '4', 'Группы', null, null), ('192', '1', '382', '2055', '1', 'Каталог', null, null), ('193', '192', '383', '384', '2', 'Ид', 'photogallery_personal', null), ('194', '192', '385', '386', '2', 'ИдКлассификатора', '26', null), ('195', '192', '387', '388', '2', 'Наименование', 'Фотогалерея пользователей', null), ('196', '192', '389', '390', '2', 'БитриксКод', 'photogallery_personal', null), ('197', '192', '391', '392', '2', 'БитриксСортировка', '500', null), ('198', '192', '393', '394', '2', 'БитриксURLСписок', '#SITE_DIR#/photo/', null), ('199', '192', '395', '396', '2', 'БитриксURLДеталь', '#SITE_DIR#/photo/#SECTION_ID#/#ID#/', null), ('200', '192', '397', '398', '2', 'БитриксURLРаздел', '#SITE_DIR#/photo/#ID#/', null), ('201', '192', '399', '400', '2', 'БитриксКартинка', null, null), ('202', '192', '401', '402', '2', 'БитриксИндексироватьЭлементы', 'true', null), ('203', '192', '403', '404', '2', 'БитриксИндексироватьРазделы', 'true', null), ('204', '192', '405', '406', '2', 'БитриксДокументооборот', 'false', null), ('205', '192', '407', '468', '2', 'БитриксПодписи', null, null), ('206', '205', '408', '413', '3', 'БитриксПодпись', null, null), ('207', '206', '409', '410', '4', 'Ид', 'ELEMENT_NAME', null), ('208', '206', '411', '412', '4', 'Значение', 'Фотография', null), ('209', '205', '414', '419', '3', 'БитриксПодпись', null, null), ('210', '209', '415', '416', '4', 'Ид', 'ELEMENTS_NAME', null), ('211', '209', '417', '418', '4', 'Значение', 'Фотографии', null), ('212', '205', '420', '425', '3', 'БитриксПодпись', null, null), ('213', '212', '421', '422', '4', 'Ид', 'ELEMENT_ADD', null), ('214', '212', '423', '424', '4', 'Значение', 'Добавить фотографию', null), ('215', '205', '426', '431', '3', 'БитриксПодпись', null, null), ('216', '215', '427', '428', '4', 'Ид', 'ELEMENT_EDIT', null), ('217', '215', '429', '430', '4', 'Значение', 'Изменить фотографию', null), ('218', '205', '432', '437', '3', 'БитриксПодпись', null, null), ('219', '218', '433', '434', '4', 'Ид', 'ELEMENT_DELETE', null), ('220', '218', '435', '436', '4', 'Значение', 'Удалить фотографию', null), ('221', '205', '438', '443', '3', 'БитриксПодпись', null, null), ('222', '221', '439', '440', '4', 'Ид', 'SECTION_NAME', null), ('223', '221', '441', '442', '4', 'Значение', 'Альбом', null), ('224', '205', '444', '449', '3', 'БитриксПодпись', null, null), ('225', '224', '445', '446', '4', 'Ид', 'SECTIONS_NAME', null), ('226', '224', '447', '448', '4', 'Значение', 'Альбомы', null), ('227', '205', '450', '455', '3', 'БитриксПодпись', null, null), ('228', '227', '451', '452', '4', 'Ид', 'SECTION_ADD', null), ('229', '227', '453', '454', '4', 'Значение', 'Добавить альбом', null), ('230', '205', '456', '461', '3', 'БитриксПодпись', null, null), ('231', '230', '457', '458', '4', 'Ид', 'SECTION_EDIT', null), ('232', '230', '459', '460', '4', 'Значение', 'Изменить альбом', null), ('233', '205', '462', '467', '3', 'БитриксПодпись', null, null), ('234', '233', '463', '464', '4', 'Ид', 'SECTION_DELETE', null), ('235', '233', '465', '466', '4', 'Значение', 'Удалить альбом', null), ('236', '192', '469', '2054', '2', 'Товары', null, null), ('237', '236', '470', '601', '3', 'Товар', null, null), ('238', '237', '471', '472', '4', 'Ид', '2865', null), ('239', '237', '473', '474', '4', 'Наименование', '1.jpg', null), ('240', '237', '475', '476', '4', 'БитриксТеги', null, null), ('241', '237', '477', '480', '4', 'Группы', null, null), ('242', '241', '478', '479', '5', 'Ид', '751', null), ('243', '237', '481', '482', '4', 'Картинка', 'user_photogallery_files/iblock/de5/de52cc8287925a1bdb1e0d448d916c84.jpg', null), ('244', '237', '483', '600', '4', 'ЗначенияСвойств', null, null), ('245', '244', '484', '489', '5', 'ЗначенияСвойства', null, null), ('246', '245', '485', '486', '6', 'Ид', 'CML2_CODE', null), ('247', '245', '487', '488', '6', 'Значение', '1.jpg', null), ('248', '244', '490', '495', '5', 'ЗначенияСвойства', null, null), ('249', '248', '491', '492', '6', 'Ид', 'CML2_SORT', null), ('250', '248', '493', '494', '6', 'Значение', '500', null), ('251', '244', '496', '501', '5', 'ЗначенияСвойства', null, null), ('252', '251', '497', '498', '6', 'Ид', 'CML2_ACTIVE_FROM', null), ('253', '251', '499', '500', '6', 'Значение', null, null), ('254', '244', '502', '507', '5', 'ЗначенияСвойства', null, null), ('255', '254', '503', '504', '6', 'Ид', 'CML2_ACTIVE_TO', null), ('256', '254', '505', '506', '6', 'Значение', null, null), ('257', '244', '508', '513', '5', 'ЗначенияСвойства', null, null), ('258', '257', '509', '510', '6', 'Ид', 'CML2_PREVIEW_TEXT', null), ('259', '257', '511', '512', '6', 'Значение', null, null), ('260', '244', '514', '519', '5', 'ЗначенияСвойства', null, null), ('261', '260', '515', '516', '6', 'Ид', 'CML2_PREVIEW_PICTURE', null), ('262', '260', '517', '518', '6', 'Значение', 'user_photogallery_files/iblock/5ac/5ac6130998bb588933d8ede4c48a7c2c.jpg', null), ('263', '244', '520', '531', '5', 'ЗначенияСвойства', null, null), ('264', '263', '521', '522', '6', 'Ид', '67', null), ('265', '263', '523', '524', '6', 'Значение', 'user_photogallery_files/iblock/f53/f53e5a3a3c800df22e3b6c20a7bfb90a.jpg', null), ('266', '263', '525', '530', '6', 'ЗначениеСвойства', null, null), ('267', '266', '526', '527', '7', 'Значение', 'user_photogallery_files/iblock/f53/f53e5a3a3c800df22e3b6c20a7bfb90a.jpg', null), ('268', '266', '528', '529', '7', 'Описание', null, null), ('269', '244', '532', '543', '5', 'ЗначенияСвойства', null, null), ('270', '269', '533', '534', '6', 'Ид', '68', null), ('271', '269', '535', '536', '6', 'Значение', 'Y', null), ('272', '269', '537', '542', '6', 'ЗначениеСвойства', null, null), ('273', '272', '538', '539', '7', 'Значение', 'Y', null), ('274', '272', '540', '541', '7', 'Описание', null, null), ('275', '244', '544', '555', '5', 'ЗначенияСвойства', null, null), ('276', '275', '545', '546', '6', 'Ид', '69', null), ('277', '275', '547', '548', '6', 'Значение', 'Y', null), ('278', '275', '549', '554', '6', 'ЗначениеСвойства', null, null), ('279', '278', '550', '551', '7', 'Значение', 'Y', null), ('280', '278', '552', '553', '7', 'Описание', null, null), ('281', '244', '556', '559', '5', 'ЗначенияСвойства', null, null), ('282', '281', '557', '558', '6', 'Ид', '70', null), ('283', '244', '560', '563', '5', 'ЗначенияСвойства', null, null), ('284', '283', '561', '562', '6', 'Ид', '71', null), ('285', '244', '564', '575', '5', 'ЗначенияСвойства', null, null), ('286', '285', '565', '566', '6', 'Ид', '72', null), ('287', '285', '567', '568', '6', 'Значение', '3', null), ('288', '285', '569', '574', '6', 'ЗначениеСвойства', null, null), ('289', '288', '570', '571', '7', 'Значение', '3', null), ('290', '288', '572', '573', '7', 'Описание', null, null), ('291', '244', '576', '587', '5', 'ЗначенияСвойства', null, null), ('292', '291', '577', '578', '6', 'Ид', '73', null), ('293', '291', '579', '580', '6', 'Значение', '15', null), ('294', '291', '581', '586', '6', 'ЗначениеСвойства', null, null), ('295', '294', '582', '583', '7', 'Значение', '15', null), ('296', '294', '584', '585', '7', 'Описание', null, null), ('297', '244', '588', '599', '5', 'ЗначенияСвойства', null, null), ('298', '297', '589', '590', '6', 'Ид', '74', null), ('299', '297', '591', '592', '6', 'Значение', '3.56', null), ('300', '297', '593', '598', '6', 'ЗначениеСвойства', null, null), ('301', '300', '594', '595', '7', 'Значение', '3.56', null), ('302', '300', '596', '597', '7', 'Описание', null, null), ('303', '236', '602', '733', '3', 'Товар', null, null), ('304', '303', '603', '604', '4', 'Ид', '2867', null), ('305', '303', '605', '606', '4', 'Наименование', '13.jpg', null), ('306', '303', '607', '608', '4', 'БитриксТеги', null, null), ('307', '303', '609', '612', '4', 'Группы', null, null), ('308', '307', '610', '611', '5', 'Ид', '751', null), ('309', '303', '613', '614', '4', 'Картинка', 'user_photogallery_files/iblock/7e3/7e329851bc766e085bdde04be4d0581d.jpg', null), ('310', '303', '615', '732', '4', 'ЗначенияСвойств', null, null), ('311', '310', '616', '621', '5', 'ЗначенияСвойства', null, null), ('312', '311', '617', '618', '6', 'Ид', 'CML2_CODE', null), ('313', '311', '619', '620', '6', 'Значение', '13.jpg', null), ('314', '310', '622', '627', '5', 'ЗначенияСвойства', null, null), ('315', '314', '623', '624', '6', 'Ид', 'CML2_SORT', null), ('316', '314', '625', '626', '6', 'Значение', '500', null), ('317', '310', '628', '633', '5', 'ЗначенияСвойства', null, null), ('318', '317', '629', '630', '6', 'Ид', 'CML2_ACTIVE_FROM', null), ('319', '317', '631', '632', '6', 'Значение', null, null), ('320', '310', '634', '639', '5', 'ЗначенияСвойства', null, null), ('321', '320', '635', '636', '6', 'Ид', 'CML2_ACTIVE_TO', null), ('322', '320', '637', '638', '6', 'Значение', null, null), ('323', '310', '640', '645', '5', 'ЗначенияСвойства', null, null), ('324', '323', '641', '642', '6', 'Ид', 'CML2_PREVIEW_TEXT', null), ('325', '323', '643', '644', '6', 'Значение', null, null), ('326', '310', '646', '651', '5', 'ЗначенияСвойства', null, null), ('327', '326', '647', '648', '6', 'Ид', 'CML2_PREVIEW_PICTURE', null), ('328', '326', '649', '650', '6', 'Значение', 'user_photogallery_files/iblock/318/3185031406b120a27a8f3899688c494b.jpg', null), ('329', '310', '652', '663', '5', 'ЗначенияСвойства', null, null), ('330', '329', '653', '654', '6', 'Ид', '67', null), ('331', '329', '655', '656', '6', 'Значение', 'user_photogallery_files/iblock/6ea/6ea12b9bafdbda8065819bd8e13dd49e.jpg', null), ('332', '329', '657', '662', '6', 'ЗначениеСвойства', null, null), ('333', '332', '658', '659', '7', 'Значение', 'user_photogallery_files/iblock/6ea/6ea12b9bafdbda8065819bd8e13dd49e.jpg', null), ('334', '332', '660', '661', '7', 'Описание', null, null), ('335', '310', '664', '675', '5', 'ЗначенияСвойства', null, null), ('336', '335', '665', '666', '6', 'Ид', '68', null), ('337', '335', '667', '668', '6', 'Значение', 'Y', null), ('338', '335', '669', '674', '6', 'ЗначениеСвойства', null, null), ('339', '338', '670', '671', '7', 'Значение', 'Y', null), ('340', '338', '672', '673', '7', 'Описание', null, null), ('341', '310', '676', '687', '5', 'ЗначенияСвойства', null, null), ('342', '341', '677', '678', '6', 'Ид', '69', null), ('343', '341', '679', '680', '6', 'Значение', 'Y', null), ('344', '341', '681', '686', '6', 'ЗначениеСвойства', null, null), ('345', '344', '682', '683', '7', 'Значение', 'Y', null), ('346', '344', '684', '685', '7', 'Описание', null, null), ('347', '310', '688', '691', '5', 'ЗначенияСвойства', null, null), ('348', '347', '689', '690', '6', 'Ид', '70', null), ('349', '310', '692', '695', '5', 'ЗначенияСвойства', null, null), ('350', '349', '693', '694', '6', 'Ид', '71', null), ('351', '310', '696', '707', '5', 'ЗначенияСвойства', null, null), ('352', '351', '697', '698', '6', 'Ид', '72', null), ('353', '351', '699', '700', '6', 'Значение', '3', null), ('354', '351', '701', '706', '6', 'ЗначениеСвойства', null, null), ('355', '354', '702', '703', '7', 'Значение', '3', null), ('356', '354', '704', '705', '7', 'Описание', null, null), ('357', '310', '708', '719', '5', 'ЗначенияСвойства', null, null), ('358', '357', '709', '710', '6', 'Ид', '73', null), ('359', '357', '711', '712', '6', 'Значение', '15', null), ('360', '357', '713', '718', '6', 'ЗначениеСвойства', null, null), ('361', '360', '714', '715', '7', 'Значение', '15', null), ('362', '360', '716', '717', '7', 'Описание', null, null), ('363', '310', '720', '731', '5', 'ЗначенияСвойства', null, null), ('364', '363', '721', '722', '6', 'Ид', '74', null), ('365', '363', '723', '724', '6', 'Значение', '3.56', null), ('366', '363', '725', '730', '6', 'ЗначениеСвойства', null, null), ('367', '366', '726', '727', '7', 'Значение', '3.56', null), ('368', '366', '728', '729', '7', 'Описание', null, null), ('369', '236', '734', '865', '3', 'Товар', null, null), ('370', '369', '735', '736', '4', 'Ид', '2868', null), ('371', '369', '737', '738', '4', 'Наименование', '18.jpg', null), ('372', '369', '739', '740', '4', 'БитриксТеги', null, null), ('373', '369', '741', '744', '4', 'Группы', null, null), ('374', '373', '742', '743', '5', 'Ид', '751', null), ('375', '369', '745', '746', '4', 'Картинка', 'user_photogallery_files/iblock/e34/e343dc670d0a57b362defd42ebb19e23.jpg', null), ('376', '369', '747', '864', '4', 'ЗначенияСвойств', null, null), ('377', '376', '748', '753', '5', 'ЗначенияСвойства', null, null), ('378', '377', '749', '750', '6', 'Ид', 'CML2_CODE', null), ('379', '377', '751', '752', '6', 'Значение', '18.jpg', null), ('380', '376', '754', '759', '5', 'ЗначенияСвойства', null, null), ('381', '380', '755', '756', '6', 'Ид', 'CML2_SORT', null), ('382', '380', '757', '758', '6', 'Значение', '500', null), ('383', '376', '760', '765', '5', 'ЗначенияСвойства', null, null), ('384', '383', '761', '762', '6', 'Ид', 'CML2_ACTIVE_FROM', null), ('385', '383', '763', '764', '6', 'Значение', null, null), ('386', '376', '766', '771', '5', 'ЗначенияСвойства', null, null), ('387', '386', '767', '768', '6', 'Ид', 'CML2_ACTIVE_TO', null), ('388', '386', '769', '770', '6', 'Значение', null, null), ('389', '376', '772', '777', '5', 'ЗначенияСвойства', null, null), ('390', '389', '773', '774', '6', 'Ид', 'CML2_PREVIEW_TEXT', null), ('391', '389', '775', '776', '6', 'Значение', null, null), ('392', '376', '778', '783', '5', 'ЗначенияСвойства', null, null), ('393', '392', '779', '780', '6', 'Ид', 'CML2_PREVIEW_PICTURE', null), ('394', '392', '781', '782', '6', 'Значение', 'user_photogallery_files/iblock/c67/c6776a9b695722ff440801ff6d664348.jpg', null), ('395', '376', '784', '795', '5', 'ЗначенияСвойства', null, null), ('396', '395', '785', '786', '6', 'Ид', '67', null), ('397', '395', '787', '788', '6', 'Значение', 'user_photogallery_files/iblock/a3d/a3d076dc9c2719c5a4197b3a656d0f51.jpg', null), ('398', '395', '789', '794', '6', 'ЗначениеСвойства', null, null), ('399', '398', '790', '791', '7', 'Значение', 'user_photogallery_files/iblock/a3d/a3d076dc9c2719c5a4197b3a656d0f51.jpg', null), ('400', '398', '792', '793', '7', 'Описание', null, null), ('401', '376', '796', '807', '5', 'ЗначенияСвойства', null, null), ('402', '401', '797', '798', '6', 'Ид', '68', null), ('403', '401', '799', '800', '6', 'Значение', 'Y', null), ('404', '401', '801', '806', '6', 'ЗначениеСвойства', null, null), ('405', '404', '802', '803', '7', 'Значение', 'Y', null), ('406', '404', '804', '805', '7', 'Описание', null, null), ('407', '376', '808', '819', '5', 'ЗначенияСвойства', null, null), ('408', '407', '809', '810', '6', 'Ид', '69', null), ('409', '407', '811', '812', '6', 'Значение', 'Y', null), ('410', '407', '813', '818', '6', 'ЗначениеСвойства', null, null), ('411', '410', '814', '815', '7', 'Значение', 'Y', null), ('412', '410', '816', '817', '7', 'Описание', null, null), ('413', '376', '820', '823', '5', 'ЗначенияСвойства', null, null), ('414', '413', '821', '822', '6', 'Ид', '70', null), ('415', '376', '824', '827', '5', 'ЗначенияСвойства', null, null), ('416', '415', '825', '826', '6', 'Ид', '71', null), ('417', '376', '828', '839', '5', 'ЗначенияСвойства', null, null), ('418', '417', '829', '830', '6', 'Ид', '72', null), ('419', '417', '831', '832', '6', 'Значение', '3', null), ('420', '417', '833', '838', '6', 'ЗначениеСвойства', null, null), ('421', '420', '834', '835', '7', 'Значение', '3', null), ('422', '420', '836', '837', '7', 'Описание', null, null), ('423', '376', '840', '851', '5', 'ЗначенияСвойства', null, null), ('424', '423', '841', '842', '6', 'Ид', '73', null), ('425', '423', '843', '844', '6', 'Значение', '15', null), ('426', '423', '845', '850', '6', 'ЗначениеСвойства', null, null), ('427', '426', '846', '847', '7', 'Значение', '15', null), ('428', '426', '848', '849', '7', 'Описание', null, null), ('429', '376', '852', '863', '5', 'ЗначенияСвойства', null, null), ('430', '429', '853', '854', '6', 'Ид', '74', null), ('431', '429', '855', '856', '6', 'Значение', '3.56', null), ('432', '429', '857', '862', '6', 'ЗначениеСвойства', null, null), ('433', '432', '858', '859', '7', 'Значение', '3.56', null), ('434', '432', '860', '861', '7', 'Описание', null, null), ('435', '236', '866', '997', '3', 'Товар', null, null), ('436', '435', '867', '868', '4', 'Ид', '2869', null), ('437', '435', '869', '870', '4', 'Наименование', '2.jpg', null), ('438', '435', '871', '872', '4', 'БитриксТеги', null, null), ('439', '435', '873', '876', '4', 'Группы', null, null), ('440', '439', '874', '875', '5', 'Ид', '751', null), ('441', '435', '877', '878', '4', 'Картинка', 'user_photogallery_files/iblock/c71/c71a0b858b3df5d15c4b8331f7aa4186.jpg', null), ('442', '435', '879', '996', '4', 'ЗначенияСвойств', null, null), ('443', '442', '880', '885', '5', 'ЗначенияСвойства', null, null), ('444', '443', '881', '882', '6', 'Ид', 'CML2_CODE', null), ('445', '443', '883', '884', '6', 'Значение', '2.jpg', null), ('446', '442', '886', '891', '5', 'ЗначенияСвойства', null, null), ('447', '446', '887', '888', '6', 'Ид', 'CML2_SORT', null), ('448', '446', '889', '890', '6', 'Значение', '500', null), ('449', '442', '892', '897', '5', 'ЗначенияСвойства', null, null), ('450', '449', '893', '894', '6', 'Ид', 'CML2_ACTIVE_FROM', null), ('451', '449', '895', '896', '6', 'Значение', null, null), ('452', '442', '898', '903', '5', 'ЗначенияСвойства', null, null), ('453', '452', '899', '900', '6', 'Ид', 'CML2_ACTIVE_TO', null), ('454', '452', '901', '902', '6', 'Значение', null, null), ('455', '442', '904', '909', '5', 'ЗначенияСвойства', null, null), ('456', '455', '905', '906', '6', 'Ид', 'CML2_PREVIEW_TEXT', null), ('457', '455', '907', '908', '6', 'Значение', null, null), ('458', '442', '910', '915', '5', 'ЗначенияСвойства', null, null), ('459', '458', '911', '912', '6', 'Ид', 'CML2_PREVIEW_PICTURE', null), ('460', '458', '913', '914', '6', 'Значение', 'user_photogallery_files/iblock/043/04394cddf6b6ed096ab44b99058c15ce.jpg', null), ('461', '442', '916', '927', '5', 'ЗначенияСвойства', null, null), ('462', '461', '917', '918', '6', 'Ид', '67', null), ('463', '461', '919', '920', '6', 'Значение', 'user_photogallery_files/iblock/7bc/7bc98e3aa0bb874f3662e097ea125363.jpg', null), ('464', '461', '921', '926', '6', 'ЗначениеСвойства', null, null), ('465', '464', '922', '923', '7', 'Значение', 'user_photogallery_files/iblock/7bc/7bc98e3aa0bb874f3662e097ea125363.jpg', null), ('466', '464', '924', '925', '7', 'Описание', null, null), ('467', '442', '928', '939', '5', 'ЗначенияСвойства', null, null), ('468', '467', '929', '930', '6', 'Ид', '68', null), ('469', '467', '931', '932', '6', 'Значение', 'Y', null), ('470', '467', '933', '938', '6', 'ЗначениеСвойства', null, null), ('471', '470', '934', '935', '7', 'Значение', 'Y', null), ('472', '470', '936', '937', '7', 'Описание', null, null), ('473', '442', '940', '951', '5', 'ЗначенияСвойства', null, null), ('474', '473', '941', '942', '6', 'Ид', '69', null), ('475', '473', '943', '944', '6', 'Значение', 'Y', null), ('476', '473', '945', '950', '6', 'ЗначениеСвойства', null, null), ('477', '476', '946', '947', '7', 'Значение', 'Y', null), ('478', '476', '948', '949', '7', 'Описание', null, null), ('479', '442', '952', '955', '5', 'ЗначенияСвойства', null, null), ('480', '479', '953', '954', '6', 'Ид', '70', null), ('481', '442', '956', '959', '5', 'ЗначенияСвойства', null, null), ('482', '481', '957', '958', '6', 'Ид', '71', null), ('483', '442', '960', '971', '5', 'ЗначенияСвойства', null, null), ('484', '483', '961', '962', '6', 'Ид', '72', null), ('485', '483', '963', '964', '6', 'Значение', '3', null), ('486', '483', '965', '970', '6', 'ЗначениеСвойства', null, null), ('487', '486', '966', '967', '7', 'Значение', '3', null), ('488', '486', '968', '969', '7', 'Описание', null, null), ('489', '442', '972', '983', '5', 'ЗначенияСвойства', null, null), ('490', '489', '973', '974', '6', 'Ид', '73', null), ('491', '489', '975', '976', '6', 'Значение', '15', null), ('492', '489', '977', '982', '6', 'ЗначениеСвойства', null, null), ('493', '492', '978', '979', '7', 'Значение', '15', null), ('494', '492', '980', '981', '7', 'Описание', null, null), ('495', '442', '984', '995', '5', 'ЗначенияСвойства', null, null), ('496', '495', '985', '986', '6', 'Ид', '74', null), ('497', '495', '987', '988', '6', 'Значение', '3.56', null), ('498', '495', '989', '994', '6', 'ЗначениеСвойства', null, null), ('499', '498', '990', '991', '7', 'Значение', '3.56', null), ('500', '498', '992', '993', '7', 'Описание', null, null), ('501', '236', '998', '1129', '3', 'Товар', null, null), ('502', '501', '999', '1000', '4', 'Ид', '2871', null), ('503', '501', '1001', '1002', '4', 'Наименование', '25.jpg', null), ('504', '501', '1003', '1004', '4', 'БитриксТеги', null, null), ('505', '501', '1005', '1008', '4', 'Группы', null, null), ('506', '505', '1006', '1007', '5', 'Ид', '751', null), ('507', '501', '1009', '1010', '4', 'Картинка', 'user_photogallery_files/iblock/ead/ead0ddd340f9a24132f488d0502e1de0.jpg', null), ('508', '501', '1011', '1128', '4', 'ЗначенияСвойств', null, null), ('509', '508', '1012', '1017', '5', 'ЗначенияСвойства', null, null), ('510', '509', '1013', '1014', '6', 'Ид', 'CML2_CODE', null), ('511', '509', '1015', '1016', '6', 'Значение', '25.jpg', null), ('512', '508', '1018', '1023', '5', 'ЗначенияСвойства', null, null), ('513', '512', '1019', '1020', '6', 'Ид', 'CML2_SORT', null), ('514', '512', '1021', '1022', '6', 'Значение', '500', null), ('515', '508', '1024', '1029', '5', 'ЗначенияСвойства', null, null), ('516', '515', '1025', '1026', '6', 'Ид', 'CML2_ACTIVE_FROM', null), ('517', '515', '1027', '1028', '6', 'Значение', null, null), ('518', '508', '1030', '1035', '5', 'ЗначенияСвойства', null, null), ('519', '518', '1031', '1032', '6', 'Ид', 'CML2_ACTIVE_TO', null), ('520', '518', '1033', '1034', '6', 'Значение', null, null), ('521', '508', '1036', '1041', '5', 'ЗначенияСвойства', null, null), ('522', '521', '1037', '1038', '6', 'Ид', 'CML2_PREVIEW_TEXT', null), ('523', '521', '1039', '1040', '6', 'Значение', null, null), ('524', '508', '1042', '1047', '5', 'ЗначенияСвойства', null, null), ('525', '524', '1043', '1044', '6', 'Ид', 'CML2_PREVIEW_PICTURE', null), ('526', '524', '1045', '1046', '6', 'Значение', 'user_photogallery_files/iblock/c31/c31796d752dcc444bffb554045a01dab.jpg', null), ('527', '508', '1048', '1059', '5', 'ЗначенияСвойства', null, null), ('528', '527', '1049', '1050', '6', 'Ид', '67', null), ('529', '527', '1051', '1052', '6', 'Значение', 'user_photogallery_files/iblock/fba/fba6364f1e882725de70fa6fa0570fcd.jpg', null), ('530', '527', '1053', '1058', '6', 'ЗначениеСвойства', null, null), ('531', '530', '1054', '1055', '7', 'Значение', 'user_photogallery_files/iblock/fba/fba6364f1e882725de70fa6fa0570fcd.jpg', null), ('532', '530', '1056', '1057', '7', 'Описание', null, null), ('533', '508', '1060', '1071', '5', 'ЗначенияСвойства', null, null), ('534', '533', '1061', '1062', '6', 'Ид', '68', null), ('535', '533', '1063', '1064', '6', 'Значение', 'Y', null), ('536', '533', '1065', '1070', '6', 'ЗначениеСвойства', null, null), ('537', '536', '1066', '1067', '7', 'Значение', 'Y', null), ('538', '536', '1068', '1069', '7', 'Описание', null, null), ('539', '508', '1072', '1083', '5', 'ЗначенияСвойства', null, null), ('540', '539', '1073', '1074', '6', 'Ид', '69', null), ('541', '539', '1075', '1076', '6', 'Значение', 'Y', null), ('542', '539', '1077', '1082', '6', 'ЗначениеСвойства', null, null), ('543', '542', '1078', '1079', '7', 'Значение', 'Y', null), ('544', '542', '1080', '1081', '7', 'Описание', null, null), ('545', '508', '1084', '1087', '5', 'ЗначенияСвойства', null, null), ('546', '545', '1085', '1086', '6', 'Ид', '70', null), ('547', '508', '1088', '1091', '5', 'ЗначенияСвойства', null, null), ('548', '547', '1089', '1090', '6', 'Ид', '71', null), ('549', '508', '1092', '1103', '5', 'ЗначенияСвойства', null, null), ('550', '549', '1093', '1094', '6', 'Ид', '72', null), ('551', '549', '1095', '1096', '6', 'Значение', '2', null), ('552', '549', '1097', '1102', '6', 'ЗначениеСвойства', null, null), ('553', '552', '1098', '1099', '7', 'Значение', '2', null), ('554', '552', '1100', '1101', '7', 'Описание', null, null), ('555', '508', '1104', '1115', '5', 'ЗначенияСвойства', null, null), ('556', '555', '1105', '1106', '6', 'Ид', '73', null), ('557', '555', '1107', '1108', '6', 'Значение', '10', null), ('558', '555', '1109', '1114', '6', 'ЗначениеСвойства', null, null), ('559', '558', '1110', '1111', '7', 'Значение', '10', null), ('560', '558', '1112', '1113', '7', 'Описание', null, null), ('561', '508', '1116', '1127', '5', 'ЗначенияСвойства', null, null), ('562', '561', '1117', '1118', '6', 'Ид', '74', null), ('563', '561', '1119', '1120', '6', 'Значение', '3.44', null), ('564', '561', '1121', '1126', '6', 'ЗначениеСвойства', null, null), ('565', '564', '1122', '1123', '7', 'Значение', '3.44', null), ('566', '564', '1124', '1125', '7', 'Описание', null, null), ('567', '236', '1130', '1261', '3', 'Товар', null, null), ('568', '567', '1131', '1132', '4', 'Ид', '2873', null), ('569', '567', '1133', '1134', '4', 'Наименование', '36.jpg', null), ('570', '567', '1135', '1136', '4', 'БитриксТеги', null, null), ('571', '567', '1137', '1140', '4', 'Группы', null, null), ('572', '571', '1138', '1139', '5', 'Ид', '751', null), ('573', '567', '1141', '1142', '4', 'Картинка', 'user_photogallery_files/iblock/2c8/2c813b79919e3287b6259d2e457db83e.jpg', null), ('574', '567', '1143', '1260', '4', 'ЗначенияСвойств', null, null), ('575', '574', '1144', '1149', '5', 'ЗначенияСвойства', null, null), ('576', '575', '1145', '1146', '6', 'Ид', 'CML2_CODE', null), ('577', '575', '1147', '1148', '6', 'Значение', '36.jpg', null), ('578', '574', '1150', '1155', '5', 'ЗначенияСвойства', null, null), ('579', '578', '1151', '1152', '6', 'Ид', 'CML2_SORT', null), ('580', '578', '1153', '1154', '6', 'Значение', '500', null), ('581', '574', '1156', '1161', '5', 'ЗначенияСвойства', null, null), ('582', '581', '1157', '1158', '6', 'Ид', 'CML2_ACTIVE_FROM', null), ('583', '581', '1159', '1160', '6', 'Значение', null, null), ('584', '574', '1162', '1167', '5', 'ЗначенияСвойства', null, null), ('585', '584', '1163', '1164', '6', 'Ид', 'CML2_ACTIVE_TO', null), ('586', '584', '1165', '1166', '6', 'Значение', null, null), ('587', '574', '1168', '1173', '5', 'ЗначенияСвойства', null, null), ('588', '587', '1169', '1170', '6', 'Ид', 'CML2_PREVIEW_TEXT', null), ('589', '587', '1171', '1172', '6', 'Значение', null, null), ('590', '574', '1174', '1179', '5', 'ЗначенияСвойства', null, null), ('591', '590', '1175', '1176', '6', 'Ид', 'CML2_PREVIEW_PICTURE', null), ('592', '590', '1177', '1178', '6', 'Значение', 'user_photogallery_files/iblock/34d/34d5d51b7d67475d846eefaa329827d7.jpg', null), ('593', '574', '1180', '1191', '5', 'ЗначенияСвойства', null, null), ('594', '593', '1181', '1182', '6', 'Ид', '67', null), ('595', '593', '1183', '1184', '6', 'Значение', 'user_photogallery_files/iblock/5ff/5ff0db8f24ecf84c2f17842e827672b0.jpg', null), ('596', '593', '1185', '1190', '6', 'ЗначениеСвойства', null, null), ('597', '596', '1186', '1187', '7', 'Значение', 'user_photogallery_files/iblock/5ff/5ff0db8f24ecf84c2f17842e827672b0.jpg', null), ('598', '596', '1188', '1189', '7', 'Описание', null, null), ('599', '574', '1192', '1203', '5', 'ЗначенияСвойства', null, null), ('600', '599', '1193', '1194', '6', 'Ид', '68', null), ('601', '599', '1195', '1196', '6', 'Значение', 'Y', null), ('602', '599', '1197', '1202', '6', 'ЗначениеСвойства', null, null), ('603', '602', '1198', '1199', '7', 'Значение', 'Y', null), ('604', '602', '1200', '1201', '7', 'Описание', null, null), ('605', '574', '1204', '1215', '5', 'ЗначенияСвойства', null, null), ('606', '605', '1205', '1206', '6', 'Ид', '69', null), ('607', '605', '1207', '1208', '6', 'Значение', 'Y', null), ('608', '605', '1209', '1214', '6', 'ЗначениеСвойства', null, null), ('609', '608', '1210', '1211', '7', 'Значение', 'Y', null), ('610', '608', '1212', '1213', '7', 'Описание', null, null), ('611', '574', '1216', '1219', '5', 'ЗначенияСвойства', null, null), ('612', '611', '1217', '1218', '6', 'Ид', '70', null), ('613', '574', '1220', '1223', '5', 'ЗначенияСвойства', null, null), ('614', '613', '1221', '1222', '6', 'Ид', '71', null), ('615', '574', '1224', '1235', '5', 'ЗначенияСвойства', null, null), ('616', '615', '1225', '1226', '6', 'Ид', '72', null), ('617', '615', '1227', '1228', '6', 'Значение', '2', null), ('618', '615', '1229', '1234', '6', 'ЗначениеСвойства', null, null), ('619', '618', '1230', '1231', '7', 'Значение', '2', null), ('620', '618', '1232', '1233', '7', 'Описание', null, null), ('621', '574', '1236', '1247', '5', 'ЗначенияСвойства', null, null), ('622', '621', '1237', '1238', '6', 'Ид', '73', null), ('623', '621', '1239', '1240', '6', 'Значение', '10', null), ('624', '621', '1241', '1246', '6', 'ЗначениеСвойства', null, null), ('625', '624', '1242', '1243', '7', 'Значение', '10', null), ('626', '624', '1244', '1245', '7', 'Описание', null, null), ('627', '574', '1248', '1259', '5', 'ЗначенияСвойства', null, null), ('628', '627', '1249', '1250', '6', 'Ид', '74', null), ('629', '627', '1251', '1252', '6', 'Значение', '3.44', null), ('630', '627', '1253', '1258', '6', 'ЗначениеСвойства', null, null), ('631', '630', '1254', '1255', '7', 'Значение', '3.44', null), ('632', '630', '1256', '1257', '7', 'Описание', null, null), ('633', '236', '1262', '1393', '3', 'Товар', null, null), ('634', '633', '1263', '1264', '4', 'Ид', '2874', null), ('635', '633', '1265', '1266', '4', 'Наименование', '38.jpg', null), ('636', '633', '1267', '1268', '4', 'БитриксТеги', null, null), ('637', '633', '1269', '1272', '4', 'Группы', null, null), ('638', '637', '1270', '1271', '5', 'Ид', '751', null), ('639', '633', '1273', '1274', '4', 'Картинка', 'user_photogallery_files/iblock/a4e/a4efc2b07b0276d30890ad1ba7908c25.jpg', null), ('640', '633', '1275', '1392', '4', 'ЗначенияСвойств', null, null), ('641', '640', '1276', '1281', '5', 'ЗначенияСвойства', null, null), ('642', '641', '1277', '1278', '6', 'Ид', 'CML2_CODE', null), ('643', '641', '1279', '1280', '6', 'Значение', '38.jpg', null), ('644', '640', '1282', '1287', '5', 'ЗначенияСвойства', null, null), ('645', '644', '1283', '1284', '6', 'Ид', 'CML2_SORT', null), ('646', '644', '1285', '1286', '6', 'Значение', '500', null), ('647', '640', '1288', '1293', '5', 'ЗначенияСвойства', null, null), ('648', '647', '1289', '1290', '6', 'Ид', 'CML2_ACTIVE_FROM', null), ('649', '647', '1291', '1292', '6', 'Значение', null, null), ('650', '640', '1294', '1299', '5', 'ЗначенияСвойства', null, null), ('651', '650', '1295', '1296', '6', 'Ид', 'CML2_ACTIVE_TO', null), ('652', '650', '1297', '1298', '6', 'Значение', null, null), ('653', '640', '1300', '1305', '5', 'ЗначенияСвойства', null, null), ('654', '653', '1301', '1302', '6', 'Ид', 'CML2_PREVIEW_TEXT', null), ('655', '653', '1303', '1304', '6', 'Значение', null, null), ('656', '640', '1306', '1311', '5', 'ЗначенияСвойства', null, null), ('657', '656', '1307', '1308', '6', 'Ид', 'CML2_PREVIEW_PICTURE', null), ('658', '656', '1309', '1310', '6', 'Значение', 'user_photogallery_files/iblock/d01/d0148f9672466e9209ac55ca948d002b.jpg', null), ('659', '640', '1312', '1323', '5', 'ЗначенияСвойства', null, null), ('660', '659', '1313', '1314', '6', 'Ид', '67', null), ('661', '659', '1315', '1316', '6', 'Значение', 'user_photogallery_files/iblock/07d/07de49ce9069307ffb4611656061e94a.jpg', null), ('662', '659', '1317', '1322', '6', 'ЗначениеСвойства', null, null), ('663', '662', '1318', '1319', '7', 'Значение', 'user_photogallery_files/iblock/07d/07de49ce9069307ffb4611656061e94a.jpg', null), ('664', '662', '1320', '1321', '7', 'Описание', null, null), ('665', '640', '1324', '1335', '5', 'ЗначенияСвойства', null, null), ('666', '665', '1325', '1326', '6', 'Ид', '68', null), ('667', '665', '1327', '1328', '6', 'Значение', 'Y', null), ('668', '665', '1329', '1334', '6', 'ЗначениеСвойства', null, null), ('669', '668', '1330', '1331', '7', 'Значение', 'Y', null), ('670', '668', '1332', '1333', '7', 'Описание', null, null), ('671', '640', '1336', '1347', '5', 'ЗначенияСвойства', null, null), ('672', '671', '1337', '1338', '6', 'Ид', '69', null), ('673', '671', '1339', '1340', '6', 'Значение', 'Y', null), ('674', '671', '1341', '1346', '6', 'ЗначениеСвойства', null, null), ('675', '674', '1342', '1343', '7', 'Значение', 'Y', null), ('676', '674', '1344', '1345', '7', 'Описание', null, null), ('677', '640', '1348', '1351', '5', 'ЗначенияСвойства', null, null), ('678', '677', '1349', '1350', '6', 'Ид', '70', null), ('679', '640', '1352', '1355', '5', 'ЗначенияСвойства', null, null), ('680', '679', '1353', '1354', '6', 'Ид', '71', null), ('681', '640', '1356', '1367', '5', 'ЗначенияСвойства', null, null), ('682', '681', '1357', '1358', '6', 'Ид', '72', null), ('683', '681', '1359', '1360', '6', 'Значение', '2', null), ('684', '681', '1361', '1366', '6', 'ЗначениеСвойства', null, null), ('685', '684', '1362', '1363', '7', 'Значение', '2', null), ('686', '684', '1364', '1365', '7', 'Описание', null, null), ('687', '640', '1368', '1379', '5', 'ЗначенияСвойства', null, null), ('688', '687', '1369', '1370', '6', 'Ид', '73', null), ('689', '687', '1371', '1372', '6', 'Значение', '10', null), ('690', '687', '1373', '1378', '6', 'ЗначениеСвойства', null, null), ('691', '690', '1374', '1375', '7', 'Значение', '10', null), ('692', '690', '1376', '1377', '7', 'Описание', null, null), ('693', '640', '1380', '1391', '5', 'ЗначенияСвойства', null, null), ('694', '693', '1381', '1382', '6', 'Ид', '74', null), ('695', '693', '1383', '1384', '6', 'Значение', '3.44', null), ('696', '693', '1385', '1390', '6', 'ЗначениеСвойства', null, null), ('697', '696', '1386', '1387', '7', 'Значение', '3.44', null), ('698', '696', '1388', '1389', '7', 'Описание', null, null), ('699', '236', '1394', '1525', '3', 'Товар', null, null), ('700', '699', '1395', '1396', '4', 'Ид', '2875', null), ('701', '699', '1397', '1398', '4', 'Наименование', '40.jpg', null), ('702', '699', '1399', '1400', '4', 'БитриксТеги', null, null), ('703', '699', '1401', '1404', '4', 'Группы', null, null), ('704', '703', '1402', '1403', '5', 'Ид', '751', null), ('705', '699', '1405', '1406', '4', 'Картинка', 'user_photogallery_files/iblock/013/01374c23f9ec15758f738a3de5c50765.jpg', null), ('706', '699', '1407', '1524', '4', 'ЗначенияСвойств', null, null), ('707', '706', '1408', '1413', '5', 'ЗначенияСвойства', null, null), ('708', '707', '1409', '1410', '6', 'Ид', 'CML2_CODE', null), ('709', '707', '1411', '1412', '6', 'Значение', '40.jpg', null), ('710', '706', '1414', '1419', '5', 'ЗначенияСвойства', null, null), ('711', '710', '1415', '1416', '6', 'Ид', 'CML2_SORT', null), ('712', '710', '1417', '1418', '6', 'Значение', '500', null), ('713', '706', '1420', '1425', '5', 'ЗначенияСвойства', null, null), ('714', '713', '1421', '1422', '6', 'Ид', 'CML2_ACTIVE_FROM', null), ('715', '713', '1423', '1424', '6', 'Значение', null, null), ('716', '706', '1426', '1431', '5', 'ЗначенияСвойства', null, null), ('717', '716', '1427', '1428', '6', 'Ид', 'CML2_ACTIVE_TO', null), ('718', '716', '1429', '1430', '6', 'Значение', null, null), ('719', '706', '1432', '1437', '5', 'ЗначенияСвойства', null, null), ('720', '719', '1433', '1434', '6', 'Ид', 'CML2_PREVIEW_TEXT', null), ('721', '719', '1435', '1436', '6', 'Значение', null, null), ('722', '706', '1438', '1443', '5', 'ЗначенияСвойства', null, null), ('723', '722', '1439', '1440', '6', 'Ид', 'CML2_PREVIEW_PICTURE', null), ('724', '722', '1441', '1442', '6', 'Значение', 'user_photogallery_files/iblock/e59/e592427eab7f35d794429bac173fb4c5.jpg', null), ('725', '706', '1444', '1455', '5', 'ЗначенияСвойства', null, null), ('726', '725', '1445', '1446', '6', 'Ид', '67', null), ('727', '725', '1447', '1448', '6', 'Значение', 'user_photogallery_files/iblock/c02/c02924cbfe9cd8104161e30de9b9afd7.jpg', null), ('728', '725', '1449', '1454', '6', 'ЗначениеСвойства', null, null), ('729', '728', '1450', '1451', '7', 'Значение', 'user_photogallery_files/iblock/c02/c02924cbfe9cd8104161e30de9b9afd7.jpg', null), ('730', '728', '1452', '1453', '7', 'Описание', null, null), ('731', '706', '1456', '1467', '5', 'ЗначенияСвойства', null, null), ('732', '731', '1457', '1458', '6', 'Ид', '68', null), ('733', '731', '1459', '1460', '6', 'Значение', 'Y', null), ('734', '731', '1461', '1466', '6', 'ЗначениеСвойства', null, null), ('735', '734', '1462', '1463', '7', 'Значение', 'Y', null), ('736', '734', '1464', '1465', '7', 'Описание', null, null), ('737', '706', '1468', '1479', '5', 'ЗначенияСвойства', null, null), ('738', '737', '1469', '1470', '6', 'Ид', '69', null), ('739', '737', '1471', '1472', '6', 'Значение', 'Y', null), ('740', '737', '1473', '1478', '6', 'ЗначениеСвойства', null, null), ('741', '740', '1474', '1475', '7', 'Значение', 'Y', null), ('742', '740', '1476', '1477', '7', 'Описание', null, null), ('743', '706', '1480', '1483', '5', 'ЗначенияСвойства', null, null), ('744', '743', '1481', '1482', '6', 'Ид', '70', null), ('745', '706', '1484', '1487', '5', 'ЗначенияСвойства', null, null), ('746', '745', '1485', '1486', '6', 'Ид', '71', null), ('747', '706', '1488', '1499', '5', 'ЗначенияСвойства', null, null), ('748', '747', '1489', '1490', '6', 'Ид', '72', null), ('749', '747', '1491', '1492', '6', 'Значение', '2', null), ('750', '747', '1493', '1498', '6', 'ЗначениеСвойства', null, null), ('751', '750', '1494', '1495', '7', 'Значение', '2', null), ('752', '750', '1496', '1497', '7', 'Описание', null, null), ('753', '706', '1500', '1511', '5', 'ЗначенияСвойства', null, null), ('754', '753', '1501', '1502', '6', 'Ид', '73', null), ('755', '753', '1503', '1504', '6', 'Значение', '10', null), ('756', '753', '1505', '1510', '6', 'ЗначениеСвойства', null, null), ('757', '756', '1506', '1507', '7', 'Значение', '10', null), ('758', '756', '1508', '1509', '7', 'Описание', null, null), ('759', '706', '1512', '1523', '5', 'ЗначенияСвойства', null, null), ('760', '759', '1513', '1514', '6', 'Ид', '74', null), ('761', '759', '1515', '1516', '6', 'Значение', '3.44', null), ('762', '759', '1517', '1522', '6', 'ЗначениеСвойства', null, null), ('763', '762', '1518', '1519', '7', 'Значение', '3.44', null), ('764', '762', '1520', '1521', '7', 'Описание', null, null), ('765', '236', '1526', '1657', '3', 'Товар', null, null), ('766', '765', '1527', '1528', '4', 'Ид', '2876', null), ('767', '765', '1529', '1530', '4', 'Наименование', '46.jpg', null), ('768', '765', '1531', '1532', '4', 'БитриксТеги', null, null), ('769', '765', '1533', '1536', '4', 'Группы', null, null), ('770', '769', '1534', '1535', '5', 'Ид', '751', null), ('771', '765', '1537', '1538', '4', 'Картинка', 'user_photogallery_files/iblock/b2d/b2d0868bae56f45e80c5a6d52626b5f2.jpg', null), ('772', '765', '1539', '1656', '4', 'ЗначенияСвойств', null, null), ('773', '772', '1540', '1545', '5', 'ЗначенияСвойства', null, null), ('774', '773', '1541', '1542', '6', 'Ид', 'CML2_CODE', null), ('775', '773', '1543', '1544', '6', 'Значение', '46.jpg', null), ('776', '772', '1546', '1551', '5', 'ЗначенияСвойства', null, null), ('777', '776', '1547', '1548', '6', 'Ид', 'CML2_SORT', null), ('778', '776', '1549', '1550', '6', 'Значение', '500', null), ('779', '772', '1552', '1557', '5', 'ЗначенияСвойства', null, null), ('780', '779', '1553', '1554', '6', 'Ид', 'CML2_ACTIVE_FROM', null), ('781', '779', '1555', '1556', '6', 'Значение', null, null), ('782', '772', '1558', '1563', '5', 'ЗначенияСвойства', null, null), ('783', '782', '1559', '1560', '6', 'Ид', 'CML2_ACTIVE_TO', null), ('784', '782', '1561', '1562', '6', 'Значение', null, null), ('785', '772', '1564', '1569', '5', 'ЗначенияСвойства', null, null), ('786', '785', '1565', '1566', '6', 'Ид', 'CML2_PREVIEW_TEXT', null), ('787', '785', '1567', '1568', '6', 'Значение', null, null), ('788', '772', '1570', '1575', '5', 'ЗначенияСвойства', null, null), ('789', '788', '1571', '1572', '6', 'Ид', 'CML2_PREVIEW_PICTURE', null), ('790', '788', '1573', '1574', '6', 'Значение', 'user_photogallery_files/iblock/437/437563e3bb585cf6da5098f993d87c9a.jpg', null), ('791', '772', '1576', '1587', '5', 'ЗначенияСвойства', null, null), ('792', '791', '1577', '1578', '6', 'Ид', '67', null), ('793', '791', '1579', '1580', '6', 'Значение', 'user_photogallery_files/iblock/e23/e23aec2e2cb88a7839b09d9f8aefa74e.jpg', null), ('794', '791', '1581', '1586', '6', 'ЗначениеСвойства', null, null), ('795', '794', '1582', '1583', '7', 'Значение', 'user_photogallery_files/iblock/e23/e23aec2e2cb88a7839b09d9f8aefa74e.jpg', null), ('796', '794', '1584', '1585', '7', 'Описание', null, null), ('797', '772', '1588', '1599', '5', 'ЗначенияСвойства', null, null), ('798', '797', '1589', '1590', '6', 'Ид', '68', null), ('799', '797', '1591', '1592', '6', 'Значение', 'Y', null), ('800', '797', '1593', '1598', '6', 'ЗначениеСвойства', null, null), ('801', '800', '1594', '1595', '7', 'Значение', 'Y', null), ('802', '800', '1596', '1597', '7', 'Описание', null, null), ('803', '772', '1600', '1611', '5', 'ЗначенияСвойства', null, null), ('804', '803', '1601', '1602', '6', 'Ид', '69', null), ('805', '803', '1603', '1604', '6', 'Значение', 'Y', null), ('806', '803', '1605', '1610', '6', 'ЗначениеСвойства', null, null), ('807', '806', '1606', '1607', '7', 'Значение', 'Y', null), ('808', '806', '1608', '1609', '7', 'Описание', null, null), ('809', '772', '1612', '1615', '5', 'ЗначенияСвойства', null, null), ('810', '809', '1613', '1614', '6', 'Ид', '70', null), ('811', '772', '1616', '1619', '5', 'ЗначенияСвойства', null, null), ('812', '811', '1617', '1618', '6', 'Ид', '71', null), ('813', '772', '1620', '1631', '5', 'ЗначенияСвойства', null, null), ('814', '813', '1621', '1622', '6', 'Ид', '72', null), ('815', '813', '1623', '1624', '6', 'Значение', '2', null), ('816', '813', '1625', '1630', '6', 'ЗначениеСвойства', null, null), ('817', '816', '1626', '1627', '7', 'Значение', '2', null), ('818', '816', '1628', '1629', '7', 'Описание', null, null), ('819', '772', '1632', '1643', '5', 'ЗначенияСвойства', null, null), ('820', '819', '1633', '1634', '6', 'Ид', '73', null), ('821', '819', '1635', '1636', '6', 'Значение', '10', null), ('822', '819', '1637', '1642', '6', 'ЗначениеСвойства', null, null), ('823', '822', '1638', '1639', '7', 'Значение', '10', null), ('824', '822', '1640', '1641', '7', 'Описание', null, null), ('825', '772', '1644', '1655', '5', 'ЗначенияСвойства', null, null), ('826', '825', '1645', '1646', '6', 'Ид', '74', null), ('827', '825', '1647', '1648', '6', 'Значение', '3.44', null), ('828', '825', '1649', '1654', '6', 'ЗначениеСвойства', null, null), ('829', '828', '1650', '1651', '7', 'Значение', '3.44', null), ('830', '828', '1652', '1653', '7', 'Описание', null, null), ('831', '236', '1658', '1789', '3', 'Товар', null, null), ('832', '831', '1659', '1660', '4', 'Ид', '2877', null), ('833', '831', '1661', '1662', '4', 'Наименование', '48.jpg', null), ('834', '831', '1663', '1664', '4', 'БитриксТеги', null, null), ('835', '831', '1665', '1668', '4', 'Группы', null, null), ('836', '835', '1666', '1667', '5', 'Ид', '751', null), ('837', '831', '1669', '1670', '4', 'Картинка', 'user_photogallery_files/iblock/f1f/f1f627091745907851b2efc3ac6c3d69.jpg', null), ('838', '831', '1671', '1788', '4', 'ЗначенияСвойств', null, null), ('839', '838', '1672', '1677', '5', 'ЗначенияСвойства', null, null), ('840', '839', '1673', '1674', '6', 'Ид', 'CML2_CODE', null), ('841', '839', '1675', '1676', '6', 'Значение', '48.jpg', null), ('842', '838', '1678', '1683', '5', 'ЗначенияСвойства', null, null), ('843', '842', '1679', '1680', '6', 'Ид', 'CML2_SORT', null), ('844', '842', '1681', '1682', '6', 'Значение', '500', null), ('845', '838', '1684', '1689', '5', 'ЗначенияСвойства', null, null), ('846', '845', '1685', '1686', '6', 'Ид', 'CML2_ACTIVE_FROM', null), ('847', '845', '1687', '1688', '6', 'Значение', null, null), ('848', '838', '1690', '1695', '5', 'ЗначенияСвойства', null, null), ('849', '848', '1691', '1692', '6', 'Ид', 'CML2_ACTIVE_TO', null), ('850', '848', '1693', '1694', '6', 'Значение', null, null), ('851', '838', '1696', '1701', '5', 'ЗначенияСвойства', null, null), ('852', '851', '1697', '1698', '6', 'Ид', 'CML2_PREVIEW_TEXT', null), ('853', '851', '1699', '1700', '6', 'Значение', null, null), ('854', '838', '1702', '1707', '5', 'ЗначенияСвойства', null, null), ('855', '854', '1703', '1704', '6', 'Ид', 'CML2_PREVIEW_PICTURE', null), ('856', '854', '1705', '1706', '6', 'Значение', 'user_photogallery_files/iblock/baf/bafc10c43d9d489c98227238b89d480b.jpg', null), ('857', '838', '1708', '1719', '5', 'ЗначенияСвойства', null, null), ('858', '857', '1709', '1710', '6', 'Ид', '67', null), ('859', '857', '1711', '1712', '6', 'Значение', 'user_photogallery_files/iblock/3ce/3ce7864deca81a8f76da6bfb3cad3431.jpg', null), ('860', '857', '1713', '1718', '6', 'ЗначениеСвойства', null, null), ('861', '860', '1714', '1715', '7', 'Значение', 'user_photogallery_files/iblock/3ce/3ce7864deca81a8f76da6bfb3cad3431.jpg', null), ('862', '860', '1716', '1717', '7', 'Описание', null, null), ('863', '838', '1720', '1731', '5', 'ЗначенияСвойства', null, null), ('864', '863', '1721', '1722', '6', 'Ид', '68', null), ('865', '863', '1723', '1724', '6', 'Значение', 'Y', null), ('866', '863', '1725', '1730', '6', 'ЗначениеСвойства', null, null), ('867', '866', '1726', '1727', '7', 'Значение', 'Y', null), ('868', '866', '1728', '1729', '7', 'Описание', null, null), ('869', '838', '1732', '1743', '5', 'ЗначенияСвойства', null, null), ('870', '869', '1733', '1734', '6', 'Ид', '69', null), ('871', '869', '1735', '1736', '6', 'Значение', 'Y', null), ('872', '869', '1737', '1742', '6', 'ЗначениеСвойства', null, null), ('873', '872', '1738', '1739', '7', 'Значение', 'Y', null), ('874', '872', '1740', '1741', '7', 'Описание', null, null), ('875', '838', '1744', '1747', '5', 'ЗначенияСвойства', null, null), ('876', '875', '1745', '1746', '6', 'Ид', '70', null), ('877', '838', '1748', '1751', '5', 'ЗначенияСвойства', null, null), ('878', '877', '1749', '1750', '6', 'Ид', '71', null), ('879', '838', '1752', '1763', '5', 'ЗначенияСвойства', null, null), ('880', '879', '1753', '1754', '6', 'Ид', '72', null), ('881', '879', '1755', '1756', '6', 'Значение', '1', null), ('882', '879', '1757', '1762', '6', 'ЗначениеСвойства', null, null), ('883', '882', '1758', '1759', '7', 'Значение', '1', null), ('884', '882', '1760', '1761', '7', 'Описание', null, null), ('885', '838', '1764', '1775', '5', 'ЗначенияСвойства', null, null), ('886', '885', '1765', '1766', '6', 'Ид', '73', null), ('887', '885', '1767', '1768', '6', 'Значение', '5', null), ('888', '885', '1769', '1774', '6', 'ЗначениеСвойства', null, null), ('889', '888', '1770', '1771', '7', 'Значение', '5', null), ('890', '888', '1772', '1773', '7', 'Описание', null, null), ('891', '838', '1776', '1787', '5', 'ЗначенияСвойства', null, null), ('892', '891', '1777', '1778', '6', 'Ид', '74', null), ('893', '891', '1779', '1780', '6', 'Значение', '3.3', null), ('894', '891', '1781', '1786', '6', 'ЗначениеСвойства', null, null), ('895', '894', '1782', '1783', '7', 'Значение', '3.3', null), ('896', '894', '1784', '1785', '7', 'Описание', null, null), ('897', '236', '1790', '1921', '3', 'Товар', null, null), ('898', '897', '1791', '1792', '4', 'Ид', '2878', null), ('899', '897', '1793', '1794', '4', 'Наименование', '50.jpg', null), ('900', '897', '1795', '1796', '4', 'БитриксТеги', null, null), ('901', '897', '1797', '1800', '4', 'Группы', null, null), ('902', '901', '1798', '1799', '5', 'Ид', '751', null), ('903', '897', '1801', '1802', '4', 'Картинка', 'user_photogallery_files/iblock/175/1750ca30210af6d002932007b9f2c199.jpg', null), ('904', '897', '1803', '1920', '4', 'ЗначенияСвойств', null, null), ('905', '904', '1804', '1809', '5', 'ЗначенияСвойства', null, null), ('906', '905', '1805', '1806', '6', 'Ид', 'CML2_CODE', null), ('907', '905', '1807', '1808', '6', 'Значение', '50.jpg', null), ('908', '904', '1810', '1815', '5', 'ЗначенияСвойства', null, null), ('909', '908', '1811', '1812', '6', 'Ид', 'CML2_SORT', null), ('910', '908', '1813', '1814', '6', 'Значение', '500', null), ('911', '904', '1816', '1821', '5', 'ЗначенияСвойства', null, null), ('912', '911', '1817', '1818', '6', 'Ид', 'CML2_ACTIVE_FROM', null), ('913', '911', '1819', '1820', '6', 'Значение', null, null), ('914', '904', '1822', '1827', '5', 'ЗначенияСвойства', null, null), ('915', '914', '1823', '1824', '6', 'Ид', 'CML2_ACTIVE_TO', null), ('916', '914', '1825', '1826', '6', 'Значение', null, null), ('917', '904', '1828', '1833', '5', 'ЗначенияСвойства', null, null), ('918', '917', '1829', '1830', '6', 'Ид', 'CML2_PREVIEW_TEXT', null), ('919', '917', '1831', '1832', '6', 'Значение', null, null), ('920', '904', '1834', '1839', '5', 'ЗначенияСвойства', null, null), ('921', '920', '1835', '1836', '6', 'Ид', 'CML2_PREVIEW_PICTURE', null), ('922', '920', '1837', '1838', '6', 'Значение', 'user_photogallery_files/iblock/4a6/4a6be213d9a82c6146a7cd1094764015.jpg', null), ('923', '904', '1840', '1851', '5', 'ЗначенияСвойства', null, null), ('924', '923', '1841', '1842', '6', 'Ид', '67', null), ('925', '923', '1843', '1844', '6', 'Значение', 'user_photogallery_files/iblock/546/546d289c986f5db6863f06c209a51f5b.jpg', null), ('926', '923', '1845', '1850', '6', 'ЗначениеСвойства', null, null), ('927', '926', '1846', '1847', '7', 'Значение', 'user_photogallery_files/iblock/546/546d289c986f5db6863f06c209a51f5b.jpg', null), ('928', '926', '1848', '1849', '7', 'Описание', null, null), ('929', '904', '1852', '1863', '5', 'ЗначенияСвойства', null, null), ('930', '929', '1853', '1854', '6', 'Ид', '68', null), ('931', '929', '1855', '1856', '6', 'Значение', 'Y', null), ('932', '929', '1857', '1862', '6', 'ЗначениеСвойства', null, null), ('933', '932', '1858', '1859', '7', 'Значение', 'Y', null), ('934', '932', '1860', '1861', '7', 'Описание', null, null), ('935', '904', '1864', '1875', '5', 'ЗначенияСвойства', null, null), ('936', '935', '1865', '1866', '6', 'Ид', '69', null), ('937', '935', '1867', '1868', '6', 'Значение', 'Y', null), ('938', '935', '1869', '1874', '6', 'ЗначениеСвойства', null, null), ('939', '938', '1870', '1871', '7', 'Значение', 'Y', null), ('940', '938', '1872', '1873', '7', 'Описание', null, null), ('941', '904', '1876', '1879', '5', 'ЗначенияСвойства', null, null), ('942', '941', '1877', '1878', '6', 'Ид', '70', null), ('943', '904', '1880', '1883', '5', 'ЗначенияСвойства', null, null), ('944', '943', '1881', '1882', '6', 'Ид', '71', null), ('945', '904', '1884', '1895', '5', 'ЗначенияСвойства', null, null), ('946', '945', '1885', '1886', '6', 'Ид', '72', null), ('947', '945', '1887', '1888', '6', 'Значение', '1', null), ('948', '945', '1889', '1894', '6', 'ЗначениеСвойства', null, null), ('949', '948', '1890', '1891', '7', 'Значение', '1', null), ('950', '948', '1892', '1893', '7', 'Описание', null, null), ('951', '904', '1896', '1907', '5', 'ЗначенияСвойства', null, null), ('952', '951', '1897', '1898', '6', 'Ид', '73', null), ('953', '951', '1899', '1900', '6', 'Значение', '5', null), ('954', '951', '1901', '1906', '6', 'ЗначениеСвойства', null, null), ('955', '954', '1902', '1903', '7', 'Значение', '5', null), ('956', '954', '1904', '1905', '7', 'Описание', null, null), ('957', '904', '1908', '1919', '5', 'ЗначенияСвойства', null, null), ('958', '957', '1909', '1910', '6', 'Ид', '74', null), ('959', '957', '1911', '1912', '6', 'Значение', '3.3', null), ('960', '957', '1913', '1918', '6', 'ЗначениеСвойства', null, null), ('961', '960', '1914', '1915', '7', 'Значение', '3.3', null), ('962', '960', '1916', '1917', '7', 'Описание', null, null), ('963', '236', '1922', '2053', '3', 'Товар', null, null), ('964', '963', '1923', '1924', '4', 'Ид', '2879', null), ('965', '963', '1925', '1926', '4', 'Наименование', '8.jpg', null), ('966', '963', '1927', '1928', '4', 'БитриксТеги', null, null), ('967', '963', '1929', '1932', '4', 'Группы', null, null), ('968', '967', '1930', '1931', '5', 'Ид', '751', null), ('969', '963', '1933', '1934', '4', 'Картинка', 'user_photogallery_files/iblock/ed7/ed716b8ba553ff8a42780c3c11f37ca5.jpg', null), ('970', '963', '1935', '2052', '4', 'ЗначенияСвойств', null, null), ('971', '970', '1936', '1941', '5', 'ЗначенияСвойства', null, null), ('972', '971', '1937', '1938', '6', 'Ид', 'CML2_CODE', null), ('973', '971', '1939', '1940', '6', 'Значение', '8.jpg', null), ('974', '970', '1942', '1947', '5', 'ЗначенияСвойства', null, null), ('975', '974', '1943', '1944', '6', 'Ид', 'CML2_SORT', null);
INSERT INTO `b_xml_tree` VALUES ('976', '974', '1945', '1946', '6', 'Значение', '500', null), ('977', '970', '1948', '1953', '5', 'ЗначенияСвойства', null, null), ('978', '977', '1949', '1950', '6', 'Ид', 'CML2_ACTIVE_FROM', null), ('979', '977', '1951', '1952', '6', 'Значение', null, null), ('980', '970', '1954', '1959', '5', 'ЗначенияСвойства', null, null), ('981', '980', '1955', '1956', '6', 'Ид', 'CML2_ACTIVE_TO', null), ('982', '980', '1957', '1958', '6', 'Значение', null, null), ('983', '970', '1960', '1965', '5', 'ЗначенияСвойства', null, null), ('984', '983', '1961', '1962', '6', 'Ид', 'CML2_PREVIEW_TEXT', null), ('985', '983', '1963', '1964', '6', 'Значение', null, null), ('986', '970', '1966', '1971', '5', 'ЗначенияСвойства', null, null), ('987', '986', '1967', '1968', '6', 'Ид', 'CML2_PREVIEW_PICTURE', null), ('988', '986', '1969', '1970', '6', 'Значение', 'user_photogallery_files/iblock/0ad/0adffa1c0cc376da0e281a8aa4bfb6ae.jpg', null), ('989', '970', '1972', '1983', '5', 'ЗначенияСвойства', null, null), ('990', '989', '1973', '1974', '6', 'Ид', '67', null), ('991', '989', '1975', '1976', '6', 'Значение', 'user_photogallery_files/iblock/1af/1afe6fe0d6f65941fc9571e017b9167d.jpg', null), ('992', '989', '1977', '1982', '6', 'ЗначениеСвойства', null, null), ('993', '992', '1978', '1979', '7', 'Значение', 'user_photogallery_files/iblock/1af/1afe6fe0d6f65941fc9571e017b9167d.jpg', null), ('994', '992', '1980', '1981', '7', 'Описание', null, null), ('995', '970', '1984', '1995', '5', 'ЗначенияСвойства', null, null), ('996', '995', '1985', '1986', '6', 'Ид', '68', null), ('997', '995', '1987', '1988', '6', 'Значение', 'Y', null), ('998', '995', '1989', '1994', '6', 'ЗначениеСвойства', null, null), ('999', '998', '1990', '1991', '7', 'Значение', 'Y', null), ('1000', '998', '1992', '1993', '7', 'Описание', null, null), ('1001', '970', '1996', '2007', '5', 'ЗначенияСвойства', null, null), ('1002', '1001', '1997', '1998', '6', 'Ид', '69', null), ('1003', '1001', '1999', '2000', '6', 'Значение', 'Y', null), ('1004', '1001', '2001', '2006', '6', 'ЗначениеСвойства', null, null), ('1005', '1004', '2002', '2003', '7', 'Значение', 'Y', null), ('1006', '1004', '2004', '2005', '7', 'Описание', null, null), ('1007', '970', '2008', '2011', '5', 'ЗначенияСвойства', null, null), ('1008', '1007', '2009', '2010', '6', 'Ид', '70', null), ('1009', '970', '2012', '2015', '5', 'ЗначенияСвойства', null, null), ('1010', '1009', '2013', '2014', '6', 'Ид', '71', null), ('1011', '970', '2016', '2027', '5', 'ЗначенияСвойства', null, null), ('1012', '1011', '2017', '2018', '6', 'Ид', '72', null), ('1013', '1011', '2019', '2020', '6', 'Значение', '1', null), ('1014', '1011', '2021', '2026', '6', 'ЗначениеСвойства', null, null), ('1015', '1014', '2022', '2023', '7', 'Значение', '1', null), ('1016', '1014', '2024', '2025', '7', 'Описание', null, null), ('1017', '970', '2028', '2039', '5', 'ЗначенияСвойства', null, null), ('1018', '1017', '2029', '2030', '6', 'Ид', '73', null), ('1019', '1017', '2031', '2032', '6', 'Значение', '5', null), ('1020', '1017', '2033', '2038', '6', 'ЗначениеСвойства', null, null), ('1021', '1020', '2034', '2035', '7', 'Значение', '5', null), ('1022', '1020', '2036', '2037', '7', 'Описание', null, null), ('1023', '970', '2040', '2051', '5', 'ЗначенияСвойства', null, null), ('1024', '1023', '2041', '2042', '6', 'Ид', '74', null), ('1025', '1023', '2043', '2044', '6', 'Значение', '3.3', null), ('1026', '1023', '2045', '2050', '6', 'ЗначениеСвойства', null, null), ('1027', '1026', '2046', '2047', '7', 'Значение', '3.3', null), ('1028', '1026', '2048', '2049', '7', 'Описание', null, null), ('1029', '0', '1', '0', '0', '', null, null), ('1030', '0', '1', '0', '0', '', null, null), ('1031', '0', '2', '0', '0', '', null, null), ('1032', '0', '3', '0', '0', '', null, null), ('1033', '0', '4', '0', '0', '', null, null), ('1034', '0', '5', '0', '0', '', null, null), ('1035', '0', '6', '0', '0', '', null, null), ('1036', '0', '7', '0', '0', '', null, null), ('1037', '0', '8', '0', '0', '', null, null), ('1038', '0', '9', '0', '0', '', null, null), ('1039', '0', '10', '0', '0', '', null, null), ('1040', '0', '11', '0', '0', '', null, null), ('1041', '0', '12', '0', '0', '', null, null);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
