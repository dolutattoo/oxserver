/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE DATABASE IF NOT EXISTS `overextended` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `overextended`;

CREATE TABLE IF NOT EXISTS `characters` (
  `charid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` mediumint(8) unsigned NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `dateofbirth` date NOT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `last_played` date NOT NULL DEFAULT curdate(),
  `is_dead` bit(1) NOT NULL DEFAULT b'0',
  `x` float DEFAULT NULL,
  `y` float DEFAULT NULL,
  `z` float DEFAULT NULL,
  `heading` float DEFAULT NULL,
  `health` tinyint(3) unsigned DEFAULT NULL,
  `armour` tinyint(3) unsigned DEFAULT NULL,
  `statuses` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT json_object() CHECK (json_valid(`statuses`)),
  `deleted` date DEFAULT NULL,
  PRIMARY KEY (`charid`) USING BTREE,
  KEY `FK_character_users` (`userid`) USING BTREE,
  CONSTRAINT `FK_characters_users` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE IF NOT EXISTS `character_groups` (
  `charid` int(10) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `grade` tinyint(3) unsigned NOT NULL,
  UNIQUE KEY `name` (`name`,`charid`) USING BTREE,
  KEY `FK_character_groups_characters` (`charid`) USING BTREE,
  CONSTRAINT `FK_character_groups_characters` FOREIGN KEY (`charid`) REFERENCES `characters` (`charid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE IF NOT EXISTS `character_inventory` (
  `charid` int(10) unsigned NOT NULL,
  `inventory` longtext DEFAULT NULL,
  PRIMARY KEY (`charid`),
  KEY `FK_inventory_characters` (`charid`),
  CONSTRAINT `FK_inventory_characters` FOREIGN KEY (`charid`) REFERENCES `characters` (`charid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE IF NOT EXISTS `character_licenses` (
  `charid` int(10) unsigned NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `issued` date DEFAULT NULL,
  UNIQUE KEY `name` (`name`,`charid`) USING BTREE,
  KEY `FK_character_licences_characters` (`charid`) USING BTREE,
  CONSTRAINT `FK_character_licences_characters` FOREIGN KEY (`charid`) REFERENCES `characters` (`charid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE IF NOT EXISTS `npwd_calls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(48) DEFAULT NULL,
  `transmitter` varchar(255) NOT NULL,
  `receiver` varchar(255) NOT NULL,
  `is_accepted` tinyint(4) DEFAULT 0,
  `start` varchar(255) DEFAULT NULL,
  `end` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE IF NOT EXISTS `npwd_darkchat_channels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_identifier` varchar(255) NOT NULL,
  `label` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `darkchat_channels_channel_identifier_uindex` (`channel_identifier`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;


CREATE TABLE IF NOT EXISTS `npwd_darkchat_channel_members` (
  `channel_id` int(11) NOT NULL,
  `user_identifier` varchar(255) NOT NULL,
  `is_owner` tinyint(4) NOT NULL DEFAULT 0,
  KEY `npwd_darkchat_channel_members_npwd_darkchat_channels_id_fk` (`channel_id`) USING BTREE,
  CONSTRAINT `npwd_darkchat_channel_members_npwd_darkchat_channels_id_fk` FOREIGN KEY (`channel_id`) REFERENCES `npwd_darkchat_channels` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE IF NOT EXISTS `npwd_darkchat_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_id` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `user_identifier` varchar(255) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_image` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `darkchat_messages_darkchat_channels_id_fk` (`channel_id`) USING BTREE,
  CONSTRAINT `darkchat_messages_darkchat_channels_id_fk` FOREIGN KEY (`channel_id`) REFERENCES `npwd_darkchat_channels` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4;


CREATE TABLE IF NOT EXISTS `npwd_marketplace_listings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(48) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `number` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `reported` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE IF NOT EXISTS `npwd_match_profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(48) NOT NULL,
  `name` varchar(90) NOT NULL,
  `image` varchar(255) NOT NULL,
  `bio` varchar(512) DEFAULT NULL,
  `location` varchar(45) DEFAULT NULL,
  `job` varchar(45) DEFAULT NULL,
  `tags` varchar(255) NOT NULL DEFAULT '',
  `voiceMessage` varchar(512) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `identifier_UNIQUE` (`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

INSERT INTO `npwd_match_profiles` (`id`, `identifier`, `name`, `image`, `bio`, `location`, `job`, `tags`, `voiceMessage`, `createdAt`, `updatedAt`) VALUES
	(1, '1', 'Dolu Fonzi', 'https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg', '', '', '', '', NULL, '2022-11-06 18:01:31', '2022-11-06 18:01:31'),
	(2, '2', 'Corantin Gomez', 'https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg', '', '', '', '', NULL, '2022-11-17 00:13:33', '2022-11-17 00:13:33'),
	(3, '3', 'Rico Maldero', 'https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg', '', '', '', '', NULL, '2022-12-04 22:05:44', '2022-12-04 22:05:44');

CREATE TABLE IF NOT EXISTS `npwd_match_views` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(48) NOT NULL,
  `profile` int(11) NOT NULL,
  `liked` tinyint(4) DEFAULT 0,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `match_profile_idx` (`profile`),
  KEY `identifier` (`identifier`),
  CONSTRAINT `match_profile` FOREIGN KEY (`profile`) REFERENCES `npwd_match_profiles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE IF NOT EXISTS `npwd_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(512) NOT NULL,
  `user_identifier` varchar(48) NOT NULL,
  `conversation_id` varchar(512) NOT NULL,
  `isRead` tinyint(4) NOT NULL DEFAULT 0,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `visible` tinyint(4) NOT NULL DEFAULT 1,
  `author` varchar(255) NOT NULL,
  `is_embed` tinyint(4) NOT NULL DEFAULT 0,
  `embed` varchar(512) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `user_identifier` (`user_identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE IF NOT EXISTS `npwd_messages_conversations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `conversation_list` varchar(225) NOT NULL,
  `label` varchar(60) DEFAULT '',
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_message_id` int(11) DEFAULT NULL,
  `is_group_chat` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE IF NOT EXISTS `npwd_messages_participants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `conversation_id` int(11) NOT NULL,
  `participant` varchar(225) NOT NULL,
  `unread_count` int(11) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `message_participants_npwd_messages_conversations_id_fk` (`conversation_id`) USING BTREE,
  CONSTRAINT `message_participants_npwd_messages_conversations_id_fk` FOREIGN KEY (`conversation_id`) REFERENCES `npwd_messages_conversations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE IF NOT EXISTS `npwd_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(48) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE IF NOT EXISTS `npwd_phone_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(48) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `number` varchar(20) DEFAULT NULL,
  `display` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE IF NOT EXISTS `npwd_phone_gallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(48) DEFAULT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE IF NOT EXISTS `npwd_twitter_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_id` int(11) NOT NULL,
  `tweet_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_combination` (`profile_id`,`tweet_id`),
  KEY `profile_idx` (`profile_id`),
  KEY `tweet_idx` (`tweet_id`),
  CONSTRAINT `profile` FOREIGN KEY (`profile_id`) REFERENCES `npwd_twitter_profiles` (`id`),
  CONSTRAINT `tweet` FOREIGN KEY (`tweet_id`) REFERENCES `npwd_twitter_tweets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE IF NOT EXISTS `npwd_twitter_profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_name` varchar(90) NOT NULL,
  `identifier` varchar(48) NOT NULL,
  `avatar_url` varchar(255) DEFAULT 'https://i.file.glass/QrEvq.png',
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `profile_name_UNIQUE` (`profile_name`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

INSERT INTO `npwd_twitter_profiles` (`id`, `profile_name`, `identifier`, `avatar_url`, `createdAt`, `updatedAt`) VALUES
	(1, 'Dolu_Fonzi', '1', 'https://i.file.glass/QrEvq.png', '2022-11-06 18:01:31', '2022-11-06 18:01:31'),
	(2, 'Corantin_Gomez', '2', 'https://i.file.glass/QrEvq.png', '2022-11-17 00:13:33', '2022-11-17 00:13:33'),
	(3, 'Rico_Maldero', '3', 'https://i.file.glass/QrEvq.png', '2022-12-04 22:05:44', '2022-12-04 22:05:44');

CREATE TABLE IF NOT EXISTS `npwd_twitter_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_id` int(11) NOT NULL,
  `tweet_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_combination` (`profile_id`,`tweet_id`),
  KEY `profile_idx` (`profile_id`),
  KEY `tweet_idx` (`tweet_id`),
  CONSTRAINT `report_profile` FOREIGN KEY (`profile_id`) REFERENCES `npwd_twitter_profiles` (`id`),
  CONSTRAINT `report_tweet` FOREIGN KEY (`tweet_id`) REFERENCES `npwd_twitter_tweets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE IF NOT EXISTS `npwd_twitter_tweets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(1000) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `likes` int(11) NOT NULL DEFAULT 0,
  `identifier` varchar(48) NOT NULL,
  `visible` tinyint(4) NOT NULL DEFAULT 1,
  `images` varchar(1000) DEFAULT '',
  `retweet` int(11) DEFAULT NULL,
  `profile_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `npwd_twitter_tweets_npwd_twitter_profiles_id_fk` (`profile_id`) USING BTREE,
  CONSTRAINT `npwd_twitter_tweets_npwd_twitter_profiles_id_fk` FOREIGN KEY (`profile_id`) REFERENCES `npwd_twitter_profiles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE IF NOT EXISTS `ox_doorlock` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

INSERT INTO `ox_doorlock` (`id`, `name`, `data`) VALUES
	(1, 'mrpd locker rooms', '{"maxDistance":2,"heading":90,"coords":{"x":450.1041259765625,"y":-985.7384033203125,"z":30.83930206298828},"groups":{"police":0},"state":1,"model":1557126584,"hideUi":false}'),
	(2, 'mrpd cells/briefing', '{"maxDistance":2,"coords":{"x":444.7078552246094,"y":-989.4454345703125,"z":30.83930206298828},"doors":[{"model":185711165,"coords":{"x":446.0079345703125,"y":-989.4454345703125,"z":30.83930206298828},"heading":0},{"model":185711165,"coords":{"x":443.40777587890627,"y":-989.4454345703125,"z":30.83930206298828},"heading":180}],"groups":{"police":0},"state":1,"hideUi":false}'),
	(3, 'mrpd cell 3', '{"maxDistance":2,"heading":90,"coords":{"x":461.8065185546875,"y":-1001.9515380859375,"z":25.06442832946777},"lockSound":"metal-locker","groups":{"police":0},"state":1,"unlockSound":"metallic-creak","model":631614199,"hideUi":false}'),
	(4, 'mrpd back entrance', '{"maxDistance":2,"coords":{"x":468.6697692871094,"y":-1014.4520263671875,"z":26.5362319946289},"doors":[{"model":-2023754432,"coords":{"x":467.37164306640627,"y":-1014.4520263671875,"z":26.5362319946289},"heading":0},{"model":-2023754432,"coords":{"x":469.9678955078125,"y":-1014.4520263671875,"z":26.5362319946289},"heading":180}],"groups":{"police":0},"state":1,"hideUi":false}'),
	(5, 'mrpd cells security door', '{"maxDistance":2,"heading":0,"coords":{"x":464.1282958984375,"y":-1003.5386962890625,"z":25.00598907470703},"autolock":5,"groups":{"police":0},"state":1,"model":-1033001619,"hideUi":false}'),
	(6, 'mrpd cell 2', '{"maxDistance":2,"heading":90,"coords":{"x":461.8064880371094,"y":-998.3082885742188,"z":25.06442832946777},"lockSound":"metal-locker","groups":{"police":0},"state":1,"unlockSound":"metallic-creak","model":631614199,"hideUi":false}'),
	(7, 'mrpd captain\'s office', '{"maxDistance":2,"heading":180,"coords":{"x":446.57281494140627,"y":-980.0105590820313,"z":30.83930206298828},"groups":{"police":0},"state":1,"model":-1320876379,"hideUi":false}'),
	(8, 'mrpd gate', '{"maxDistance":6,"heading":90,"coords":{"x":488.894775390625,"y":-1017.2102661132813,"z":27.14714050292968},"groups":{"police":0},"auto":true,"state":1,"model":-1603817716,"hideUi":false}'),
	(9, 'mrpd cell 1', '{"maxDistance":2,"heading":270,"coords":{"x":461.8065185546875,"y":-993.7586059570313,"z":25.06442832946777},"lockSound":"metal-locker","groups":{"police":0},"state":1,"unlockSound":"metallic-creak","model":631614199,"hideUi":false}'),
	(10, 'mrpd cells main', '{"maxDistance":2,"heading":360,"coords":{"x":463.92010498046877,"y":-992.6640625,"z":25.06442832946777},"lockSound":"metal-locker","groups":{"police":0},"state":1,"unlockSound":"metallic-creak","model":631614199,"hideUi":false}'),
	(11, 'mrpd armoury', '{"maxDistance":2,"heading":270,"coords":{"x":453.08428955078127,"y":-982.5794677734375,"z":30.81926536560058},"autolock":5,"groups":{"police":0},"state":1,"model":749848321,"hideUi":false}');

CREATE TABLE IF NOT EXISTS `ox_groups` (
  `name` varchar(20) NOT NULL,
  `label` varchar(50) NOT NULL,
  `grades` longtext NOT NULL,
  `hasAccount` bit(1) NOT NULL DEFAULT b'0',
  `adminGrade` tinyint(3) unsigned NOT NULL DEFAULT json_length(`grades`),
  PRIMARY KEY (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `ox_groups` (`name`, `label`, `grades`, `hasAccount`, `adminGrade`) VALUES
	('police', 'Los Santos Police Department', '["Cadet", "Officer", "Sergeant", "Captain", "Commander", "Chief"]', b'0', 6);

CREATE TABLE IF NOT EXISTS `ox_inventory` (
  `owner` varchar(60) DEFAULT NULL,
  `name` varchar(60) NOT NULL,
  `data` longtext DEFAULT NULL,
  `lastupdated` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  UNIQUE KEY `owner` (`owner`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE IF NOT EXISTS `ox_licenses` (
  `name` varchar(20) NOT NULL,
  `label` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `ox_licenses` (`name`, `label`) VALUES
	('weapons', 'Weapons License'),
	('drivers', 'Drivers License');

CREATE TABLE IF NOT EXISTS `ox_property` (
  `name` varchar(50) NOT NULL,
  `owner` int(11) unsigned DEFAULT NULL,
  `group` varchar(50) DEFAULT NULL,
  `permissions` text NOT NULL DEFAULT '[{}]',
  KEY `FK_ox_property_characters` (`owner`) USING BTREE,
  KEY `FK_ox_property_groups` (`group`) USING BTREE,
  CONSTRAINT `FK_ox_property_characters` FOREIGN KEY (`owner`) REFERENCES `characters` (`charid`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_ox_property_groups` FOREIGN KEY (`group`) REFERENCES `ox_groups` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `ox_property` (`name`, `owner`, `group`, `permissions`) VALUES
	('the_de_santa_residence', NULL, NULL, '[{}]'),
	('pillbox_hill_parking', NULL, NULL, '[{}]'),
	('the_crest_residence', NULL, NULL, '[{}]'),
	('3671_whispymound_drive', NULL, NULL, '[{}]'),
	('the_clinton_residence', NULL, NULL, '[{}]'),
	('7611_goma_street', NULL, NULL, '[{}]'),
	('casa_philips', NULL, NULL, '[{}]'),
	('puerto_del_sol_pegasus', NULL, NULL, '[{}]'),
	('premium_deluxe_motorsport', NULL, NULL, '[{}]'),
	('devin_weston_aircraft', NULL, NULL, '[{}]'),
	('mosley_auto_service', NULL, NULL, '[{}]'),
	('terminal', NULL, NULL, '[{}]');

CREATE TABLE IF NOT EXISTS `ox_statuses` (
  `name` varchar(20) NOT NULL,
  `default` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `ontick` decimal(4,3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `ox_statuses` (`name`, `default`, `ontick`) VALUES
	('hunger', 0, 0.020),
	('thirst', 0, 0.050),
	('stress', 0, -0.100);

CREATE TABLE IF NOT EXISTS `pefcl_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(255) DEFAULT NULL,
  `accountName` varchar(255) DEFAULT NULL,
  `isDefault` tinyint(1) DEFAULT 0,
  `ownerIdentifier` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT 'owner',
  `balance` int(11) DEFAULT 25000,
  `type` varchar(255) DEFAULT 'personal',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `number` (`number`),
  UNIQUE KEY `number_2` (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

INSERT INTO `pefcl_accounts` (`id`, `number`, `accountName`, `isDefault`, `ownerIdentifier`, `role`, `balance`, `type`, `createdAt`, `updatedAt`, `deletedAt`) VALUES
	(1, '920,2301-3206-3773', 'Personal account', 1, 'license:e9be42f986365d66236ad96d4d0193de526fd1eb', 'owner', 2500, 'personal', '2022-11-06 17:57:37', '2022-11-06 17:57:37', NULL),
	(2, '920,1724-3428-3227', 'Personal account', 1, '1', 'owner', 2500, 'personal', '2022-11-06 18:01:30', '2022-11-06 18:01:30', NULL),
	(3, '920,8032-3205-3378', 'Personal account', 1, 'license:b473b0bc1a17ba892c80794bfc1c4a9e785f6184', 'owner', 2500, 'personal', '2022-11-17 00:12:40', '2022-11-17 00:12:40', NULL),
	(4, '920,6471-3713-3100', 'Personal account', 1, '2', 'owner', 2500, 'personal', '2022-11-17 00:13:33', '2022-11-17 00:13:33', NULL),
	(5, '920,8105-3811-0738', 'Personal account', 1, '3', 'owner', 2500, 'personal', '2022-12-04 22:05:44', '2022-12-04 22:05:44', NULL);

CREATE TABLE IF NOT EXISTS `pefcl_cash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` int(11) DEFAULT 2000,
  `ownerIdentifier` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ownerIdentifier` (`ownerIdentifier`),
  UNIQUE KEY `ownerIdentifier_2` (`ownerIdentifier`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

INSERT INTO `pefcl_cash` (`id`, `amount`, `ownerIdentifier`, `createdAt`, `updatedAt`) VALUES
	(1, 2000, 'license:e9be42f986365d66236ad96d4d0193de526fd1eb', '2022-11-06 17:57:37', '2022-11-06 17:57:37'),
	(2, 2000, '1', '2022-11-06 18:01:30', '2022-11-06 18:01:30'),
	(3, 2000, 'license:b473b0bc1a17ba892c80794bfc1c4a9e785f6184', '2022-11-17 00:12:40', '2022-11-17 00:12:40'),
	(4, 2000, '2', '2022-11-17 00:13:33', '2022-11-17 00:13:33');

CREATE TABLE IF NOT EXISTS `pefcl_external_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `userId` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pefcl_external_accounts_user_id_number` (`userId`,`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE IF NOT EXISTS `pefcl_invoices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(255) NOT NULL,
  `from` varchar(255) NOT NULL,
  `to` varchar(255) NOT NULL,
  `fromIdentifier` varchar(255) NOT NULL,
  `toIdentifier` varchar(255) NOT NULL,
  `receiverAccountIdentifier` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT 0,
  `status` varchar(255) DEFAULT 'PENDING',
  `expiresAt` datetime NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE IF NOT EXISTS `pefcl_shared_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userIdentifier` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT 'contributor',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `deletedAt` datetime DEFAULT NULL,
  `accountId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `accountId` (`accountId`),
  CONSTRAINT `pefcl_shared_accounts_ibfk_1` FOREIGN KEY (`accountId`) REFERENCES `pefcl_accounts` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE IF NOT EXISTS `pefcl_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT 0,
  `type` varchar(255) DEFAULT 'Outgoing',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `toAccountId` int(11) DEFAULT NULL,
  `fromAccountId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `toAccountId` (`toAccountId`),
  KEY `fromAccountId` (`fromAccountId`),
  CONSTRAINT `pefcl_transactions_ibfk_1` FOREIGN KEY (`toAccountId`) REFERENCES `pefcl_accounts` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `pefcl_transactions_ibfk_2` FOREIGN KEY (`fromAccountId`) REFERENCES `pefcl_accounts` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE IF NOT EXISTS `users` (
  `userid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `license2` varchar(50) DEFAULT NULL,
  `steam` varchar(20) DEFAULT NULL,
  `fivem` varchar(10) DEFAULT NULL,
  `discord` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`userid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE IF NOT EXISTS `vehicles` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `plate` char(8) NOT NULL DEFAULT '',
  `vin` char(17) NOT NULL,
  `owner` int(10) unsigned DEFAULT NULL,
  `group` varchar(50) DEFAULT NULL,
  `model` varchar(20) NOT NULL,
  `class` tinyint(3) unsigned DEFAULT NULL,
  `data` longtext NOT NULL,
  `trunk` longtext DEFAULT NULL,
  `glovebox` longtext DEFAULT NULL,
  `stored` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `plate` (`plate`) USING BTREE,
  UNIQUE KEY `vin` (`vin`) USING BTREE,
  KEY `FK_vehicles_characters` (`owner`) USING BTREE,
  KEY `FK_vehicles_groups` (`group`),
  CONSTRAINT `FK_vehicles_characters` FOREIGN KEY (`owner`) REFERENCES `characters` (`charid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_vehicles_groups` FOREIGN KEY (`group`) REFERENCES `ox_groups` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER `characters_after_insert`
AFTER
INSERT ON `characters` FOR EACH ROW
INSERT INTO `character_inventory` (charid)
VALUES (NEW.charid)//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
