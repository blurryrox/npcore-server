-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.5.9-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for npc_unity
CREATE DATABASE IF NOT EXISTS `npc_unity` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `npc_unity`;

-- Dumping structure for table npc_unity.characters
CREATE TABLE IF NOT EXISTS `characters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(50) DEFAULT NULL,
  `first_name` varchar(50) NOT NULL DEFAULT 'John',
  `last_name` varchar(50) NOT NULL DEFAULT 'Doe',
  `date_created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `dob` varchar(50) DEFAULT 'NULL',
  `cash` int(9) DEFAULT 500,
  `bank` int(9) NOT NULL DEFAULT 5000,
  `phone_number` varchar(50) NOT NULL DEFAULT '0',
  `story` text NOT NULL,
  `new` int(1) NOT NULL DEFAULT 1,
  `deleted` int(11) NOT NULL DEFAULT 0,
  `gender` int(1) NOT NULL DEFAULT 0,
  `jail_time` int(11) NOT NULL DEFAULT 0,
  `dirty_money` int(11) NOT NULL DEFAULT 0,
  `gang_type` int(11) NOT NULL DEFAULT 0,
  `jail_time_mobster` int(11) unsigned zerofill NOT NULL DEFAULT 00000000000,
  `judge_type` int(11) NOT NULL DEFAULT 0,
  `iswjob` int(11) NOT NULL DEFAULT 0,
  `metaData` varchar(1520) DEFAULT '{}',
  `stress_level` int(11) DEFAULT 0,
  `bones` mediumtext DEFAULT '{}',
  `emotes` varchar(4160) DEFAULT '{}',
  `paycheck` int(11) DEFAULT 0,
  `stocks` text DEFAULT '[{"value":5.0},{"value":0.0},{"value":0.0},{"value":0.0},{"value":0.0},{"value":0.0}]',
  `rehab` int(12) DEFAULT 0,
  `meta` text DEFAULT 'move_m@casual@d',
  `dna` text DEFAULT '{}',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=379 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table npc_unity.characters: ~0 rows (approximately)
/*!40000 ALTER TABLE `characters` DISABLE KEYS */;
/*!40000 ALTER TABLE `characters` ENABLE KEYS */;

-- Dumping structure for table npc_unity.characters_cars
CREATE TABLE IF NOT EXISTS `characters_cars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(50) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `purchase_price` float DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `data` text NOT NULL,
  `vehicle_state` text DEFAULT NULL,
  `fuel` int(11) DEFAULT 100,
  `name` varchar(50) DEFAULT NULL,
  `engine_damage` bigint(19) DEFAULT 1000,
  `body_damage` bigint(20) DEFAULT 1000,
  `degredation` longtext DEFAULT '100,100,100,100,100,100,100,100',
  `current_garage` varchar(50) DEFAULT NULL,
  `server_number` varchar(50) DEFAULT NULL,
  `financed` int(11) DEFAULT 0,
  `last_payment` int(11) DEFAULT 0,
  `phone_number` text DEFAULT NULL,
  `coords` varchar(255) DEFAULT NULL,
  `license_plate` varchar(255) NOT NULL DEFAULT '',
  `harness` varchar(50) DEFAULT '',
  `payments_left` int(3) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table npc_unity.characters_cars: ~0 rows (approximately)
/*!40000 ALTER TABLE `characters_cars` DISABLE KEYS */;
/*!40000 ALTER TABLE `characters_cars` ENABLE KEYS */;

-- Dumping structure for table npc_unity.characters_clothes
CREATE TABLE IF NOT EXISTS `characters_clothes` (
  `cid` int(11) DEFAULT NULL,
  `assExist` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table npc_unity.characters_clothes: ~0 rows (approximately)
/*!40000 ALTER TABLE `characters_clothes` DISABLE KEYS */;
/*!40000 ALTER TABLE `characters_clothes` ENABLE KEYS */;

-- Dumping structure for table npc_unity.characters_weapons
CREATE TABLE IF NOT EXISTS `characters_weapons` (
  `id` int(11) NOT NULL DEFAULT 0,
  `type` varchar(255) DEFAULT NULL,
  `ammo` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table npc_unity.characters_weapons: ~0 rows (approximately)
/*!40000 ALTER TABLE `characters_weapons` DISABLE KEYS */;
/*!40000 ALTER TABLE `characters_weapons` ENABLE KEYS */;

-- Dumping structure for table npc_unity.character_current
CREATE TABLE IF NOT EXISTS `character_current` (
  `cid` int(11) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `drawables` mediumtext DEFAULT NULL,
  `props` mediumtext DEFAULT NULL,
  `drawtextures` mediumtext DEFAULT NULL,
  `proptextures` mediumtext DEFAULT NULL,
  `assExists` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table npc_unity.character_current: ~0 rows (approximately)
/*!40000 ALTER TABLE `character_current` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_current` ENABLE KEYS */;

-- Dumping structure for table npc_unity.character_face
CREATE TABLE IF NOT EXISTS `character_face` (
  `cid` int(11) DEFAULT NULL,
  `hairColor` mediumtext DEFAULT NULL,
  `headBlend` mediumtext DEFAULT NULL,
  `headOverlay` mediumtext DEFAULT NULL,
  `headStructure` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table npc_unity.character_face: ~0 rows (approximately)
/*!40000 ALTER TABLE `character_face` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_face` ENABLE KEYS */;

-- Dumping structure for table npc_unity.character_outfits
CREATE TABLE IF NOT EXISTS `character_outfits` (
  `cid` int(11) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `name` text DEFAULT NULL,
  `slot` int(11) DEFAULT NULL,
  `drawables` text DEFAULT '{}',
  `props` text DEFAULT '{}',
  `drawtextures` text DEFAULT '{}',
  `proptextures` text DEFAULT '{}',
  `hairColor` text DEFAULT '{}'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table npc_unity.character_outfits: ~0 rows (approximately)
/*!40000 ALTER TABLE `character_outfits` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_outfits` ENABLE KEYS */;

-- Dumping structure for table npc_unity.character_passes
CREATE TABLE IF NOT EXISTS `character_passes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  `rank` int(11) NOT NULL DEFAULT 1,
  `name` text NOT NULL,
  `giver` text NOT NULL,
  `pass_type` text NOT NULL,
  `business_name` text NOT NULL,
  `bank` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table npc_unity.character_passes: ~0 rows (approximately)
/*!40000 ALTER TABLE `character_passes` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_passes` ENABLE KEYS */;

-- Dumping structure for table npc_unity.contracts
CREATE TABLE IF NOT EXISTS `contracts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender` int(11) DEFAULT 0,
  `reciever` int(11) DEFAULT 0,
  `amount` int(11) DEFAULT 0,
  `info` text DEFAULT '',
  `paid` varchar(255) DEFAULT 'false',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table npc_unity.contracts: ~0 rows (approximately)
/*!40000 ALTER TABLE `contracts` DISABLE KEYS */;
/*!40000 ALTER TABLE `contracts` ENABLE KEYS */;

-- Dumping structure for table npc_unity.delivery_job
CREATE TABLE IF NOT EXISTS `delivery_job` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` float DEFAULT NULL,
  `jobType` varchar(50) DEFAULT NULL,
  `dropAmount` int(2) DEFAULT NULL,
  `pickup` varchar(255) DEFAULT NULL,
  `drop` varchar(255) DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table npc_unity.delivery_job: ~5 rows (approximately)
/*!40000 ALTER TABLE `delivery_job` DISABLE KEYS */;
INSERT INTO `delivery_job` (`id`, `active`, `jobType`, `dropAmount`, `pickup`, `drop`) VALUES
	(1, 1, 'trucker', 5, '{2747.82, 3454.10,56.01}', '{-441.81, -75.55, 41.18}'),
	(2, 1, 'trucker', 6, '{2747.82, 3454.10,56.01}', '{1170.60, -291.72, 69.02}'),
	(3, 1, 'trucker', 4, '{2747.82, 3454.10,56.01}', '{-45.31, -1662.97, 29.28}'),
	(4, 0, 'trucker', 5, '{2747.82, 3454.10,56.01}', '{378.23, -1028.82, 29.33}'),
	(5, 0, 'trucker', 3, '{2747.82, 3454.10,56.01}', '{-580.60, -1008.78, 22.32}');
/*!40000 ALTER TABLE `delivery_job` ENABLE KEYS */;

-- Dumping structure for table npc_unity.dispatch_code
CREATE TABLE IF NOT EXISTS `dispatch_code` (
  `id` int(11) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `display_code` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `is_important` varchar(255) DEFAULT NULL,
  `priority` varchar(255) DEFAULT NULL,
  `playsound` varchar(255) DEFAULT NULL,
  `soundname` varchar(255) DEFAULT NULL,
  `blip_color` varchar(255) DEFAULT NULL,
  `is_police` varchar(255) DEFAULT NULL,
  `is_ems` varchar(255) DEFAULT NULL,
  `is_news` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table npc_unity.dispatch_code: ~0 rows (approximately)
/*!40000 ALTER TABLE `dispatch_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `dispatch_code` ENABLE KEYS */;

-- Dumping structure for table npc_unity.dispatch_log
CREATE TABLE IF NOT EXISTS `dispatch_log` (
  `dispatch_id` varchar(255) DEFAULT NULL,
  `cid` varchar(255) DEFAULT NULL,
  `first_street` varchar(255) DEFAULT NULL,
  `second_street` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `event_id` varchar(255) DEFAULT NULL,
  `origin_x` varchar(255) DEFAULT NULL,
  `origin_y` varchar(255) DEFAULT NULL,
  `origin_z` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table npc_unity.dispatch_log: ~0 rows (approximately)
/*!40000 ALTER TABLE `dispatch_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `dispatch_log` ENABLE KEYS */;

-- Dumping structure for table npc_unity.dispatch_vehicle
CREATE TABLE IF NOT EXISTS `dispatch_vehicle` (
  `id` int(11) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `first_color` varchar(255) DEFAULT NULL,
  `second_color` varchar(255) DEFAULT NULL,
  `plate` varchar(255) DEFAULT NULL,
  `heading` varchar(255) DEFAULT NULL,
  `event_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table npc_unity.dispatch_vehicle: ~0 rows (approximately)
/*!40000 ALTER TABLE `dispatch_vehicle` DISABLE KEYS */;
/*!40000 ALTER TABLE `dispatch_vehicle` ENABLE KEYS */;

-- Dumping structure for table npc_unity.driving_tests
CREATE TABLE IF NOT EXISTS `driving_tests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) DEFAULT NULL,
  `icid` int(11) DEFAULT NULL,
  `instructor` varchar(255) DEFAULT NULL,
  `timestamp` text DEFAULT NULL,
  `points` varchar(255) DEFAULT '0',
  `passed` varchar(255) DEFAULT 'false',
  `results` text DEFAULT '{}',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table npc_unity.driving_tests: ~0 rows (approximately)
/*!40000 ALTER TABLE `driving_tests` DISABLE KEYS */;
/*!40000 ALTER TABLE `driving_tests` ENABLE KEYS */;

-- Dumping structure for table npc_unity.exploiters
CREATE TABLE IF NOT EXISTS `exploiters` (
  `type` text DEFAULT NULL,
  `log` text DEFAULT NULL,
  `data` text DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `steam_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table npc_unity.exploiters: ~0 rows (approximately)
/*!40000 ALTER TABLE `exploiters` DISABLE KEYS */;
/*!40000 ALTER TABLE `exploiters` ENABLE KEYS */;

-- Dumping structure for table npc_unity.general_variables
CREATE TABLE IF NOT EXISTS `general_variables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` text DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table npc_unity.general_variables: ~0 rows (approximately)
/*!40000 ALTER TABLE `general_variables` DISABLE KEYS */;
/*!40000 ALTER TABLE `general_variables` ENABLE KEYS */;

-- Dumping structure for table npc_unity.group_banking
CREATE TABLE IF NOT EXISTS `group_banking` (
  `group_type` mediumtext DEFAULT NULL,
  `bank` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table npc_unity.group_banking: ~0 rows (approximately)
/*!40000 ALTER TABLE `group_banking` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_banking` ENABLE KEYS */;

-- Dumping structure for table npc_unity.hospital_patients
CREATE TABLE IF NOT EXISTS `hospital_patients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `illness` text NOT NULL DEFAULT '',
  `time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table npc_unity.hospital_patients: ~0 rows (approximately)
/*!40000 ALTER TABLE `hospital_patients` DISABLE KEYS */;
/*!40000 ALTER TABLE `hospital_patients` ENABLE KEYS */;

-- Dumping structure for table npc_unity.houses
CREATE TABLE IF NOT EXISTS `houses` (
  `id` int(11) NOT NULL DEFAULT 0,
  `cid` int(11) NOT NULL DEFAULT 0,
  `model` text DEFAULT '',
  `data` text DEFAULT '{}',
  `furniture` text DEFAULT '{}',
  `mykeys` text NOT NULL DEFAULT '{}',
  `house_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table npc_unity.houses: ~0 rows (approximately)
/*!40000 ALTER TABLE `houses` DISABLE KEYS */;
/*!40000 ALTER TABLE `houses` ENABLE KEYS */;

-- Dumping structure for table npc_unity.jobs_whitelist
CREATE TABLE IF NOT EXISTS `jobs_whitelist` (
  `id` int(11) NOT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `job` varchar(50) DEFAULT 'unemployed',
  `rank` int(11) DEFAULT 0,
  `callsign` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table npc_unity.jobs_whitelist: ~0 rows (approximately)
/*!40000 ALTER TABLE `jobs_whitelist` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs_whitelist` ENABLE KEYS */;

-- Dumping structure for table npc_unity.logs
CREATE TABLE IF NOT EXISTS `logs` (
  `type` text DEFAULT NULL,
  `log` text DEFAULT NULL,
  `data` text DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `steam_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table npc_unity.logs: ~0 rows (approximately)
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;

-- Dumping structure for table npc_unity.mech_materials
CREATE TABLE IF NOT EXISTS `mech_materials` (
  `garage` text DEFAULT 'Tow Garage',
  `Scrap` int(11) DEFAULT 0,
  `Plastic` int(11) DEFAULT 0,
  `Glass` int(11) DEFAULT 0,
  `Steel` int(11) DEFAULT 0,
  `Aluminium` int(11) DEFAULT 0,
  `Rubber` int(11) DEFAULT 0,
  `Copper` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table npc_unity.mech_materials: ~5 rows (approximately)
/*!40000 ALTER TABLE `mech_materials` DISABLE KEYS */;
INSERT INTO `mech_materials` (`garage`, `Scrap`, `Plastic`, `Glass`, `Steel`, `Aluminium`, `Rubber`, `Copper`) VALUES
	('Tow Garage 1', 250, 52, 0, 0, 0, 0, 0),
	('Tow Garage 2', 250, 12, 0, 0, 0, 0, 11),
	('Tow Garage 3', 250, 12, 0, 11, 11, 0, 0),
	('Tow Garage 4', 215, 245, 235, 243, 20, 20, 15),
	('Tow Garage 5', 12, 0, 0, 0, 0, 0, 11);
/*!40000 ALTER TABLE `mech_materials` ENABLE KEYS */;

-- Dumping structure for table npc_unity.modded_cars
CREATE TABLE IF NOT EXISTS `modded_cars` (
  `id` int(11) DEFAULT NULL,
  `license_plate` varchar(255) DEFAULT NULL,
  `Extractors` varchar(255) DEFAULT '{}',
  `Filter` varchar(255) DEFAULT '{}',
  `Suspension` varchar(255) DEFAULT '{}',
  `Rollbars` varchar(255) DEFAULT '{}',
  `Bored` varchar(255) DEFAULT '{}',
  `Carbon` varchar(255) DEFAULT '{}',
  `LFront` varchar(255) DEFAULT '{}',
  `RFront` varchar(255) DEFAULT '{}',
  `LBack` varchar(255) DEFAULT '{}',
  `RBack` varchar(255) DEFAULT '{}'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table npc_unity.modded_cars: ~0 rows (approximately)
/*!40000 ALTER TABLE `modded_cars` DISABLE KEYS */;
/*!40000 ALTER TABLE `modded_cars` ENABLE KEYS */;

-- Dumping structure for table npc_unity.phone_yp
CREATE TABLE IF NOT EXISTS `phone_yp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `job` varchar(500) DEFAULT NULL,
  `phonenumber` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table npc_unity.phone_yp: ~0 rows (approximately)
/*!40000 ALTER TABLE `phone_yp` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_yp` ENABLE KEYS */;

-- Dumping structure for table npc_unity.playerstattoos
CREATE TABLE IF NOT EXISTS `playerstattoos` (
  `identifier` int(11) DEFAULT NULL,
  `tattoos` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table npc_unity.playerstattoos: ~0 rows (approximately)
/*!40000 ALTER TABLE `playerstattoos` DISABLE KEYS */;
/*!40000 ALTER TABLE `playerstattoos` ENABLE KEYS */;

-- Dumping structure for table npc_unity.racing_tracks
CREATE TABLE IF NOT EXISTS `racing_tracks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `checkPoints` text DEFAULT NULL,
  `track_names` text DEFAULT NULL,
  `creator` text DEFAULT NULL,
  `distance` text DEFAULT NULL,
  `races` text DEFAULT NULL,
  `fastest_car` text DEFAULT NULL,
  `fastest_name` text DEFAULT NULL,
  `fastest_lap` int(11) DEFAULT NULL,
  `fastest_sprint` int(11) DEFAULT NULL,
  `fastest_sprint_name` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `data` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table npc_unity.racing_tracks: ~0 rows (approximately)
/*!40000 ALTER TABLE `racing_tracks` DISABLE KEYS */;
/*!40000 ALTER TABLE `racing_tracks` ENABLE KEYS */;

-- Dumping structure for table npc_unity.secondary_jobs
CREATE TABLE IF NOT EXISTS `secondary_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) DEFAULT NULL,
  `job` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table npc_unity.secondary_jobs: ~0 rows (approximately)
/*!40000 ALTER TABLE `secondary_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `secondary_jobs` ENABLE KEYS */;

-- Dumping structure for table npc_unity.stash
CREATE TABLE IF NOT EXISTS `stash` (
  `owner_cid` int(11) DEFAULT NULL,
  `admin` int(11) DEFAULT NULL,
  `x` int(122) DEFAULT NULL,
  `y` int(122) DEFAULT NULL,
  `z` int(122) DEFAULT NULL,
  `g_x` int(122) DEFAULT NULL,
  `g_y` int(122) DEFAULT NULL,
  `g_z` int(122) DEFAULT NULL,
  `owner_pin` int(11) DEFAULT NULL,
  `guest_pin` int(11) DEFAULT NULL,
  `useGarage` int(11) DEFAULT NULL,
  `tier` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table npc_unity.stash: ~0 rows (approximately)
/*!40000 ALTER TABLE `stash` DISABLE KEYS */;
/*!40000 ALTER TABLE `stash` ENABLE KEYS */;

-- Dumping structure for table npc_unity.tweets
CREATE TABLE IF NOT EXISTS `tweets` (
  `handle` longtext NOT NULL,
  `message` varchar(500) NOT NULL,
  `time` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table npc_unity.tweets: ~0 rows (approximately)
/*!40000 ALTER TABLE `tweets` DISABLE KEYS */;
/*!40000 ALTER TABLE `tweets` ENABLE KEYS */;

-- Dumping structure for table npc_unity.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hex_id` varchar(100) DEFAULT NULL,
  `steam_id` varchar(50) DEFAULT NULL,
  `community_id` varchar(100) DEFAULT NULL,
  `license` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT 'Uknown',
  `ip` varchar(50) NOT NULL DEFAULT 'Uknown',
  `rank` varchar(50) NOT NULL DEFAULT 'user',
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `controls` text DEFAULT '{}',
  `settings` text DEFAULT '{}',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table npc_unity.users: ~0 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table npc_unity.users_whitelist
CREATE TABLE IF NOT EXISTS `users_whitelist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `steam_id` varchar(50) DEFAULT NULL,
  `power` int(11) NOT NULL DEFAULT 0,
  `admin_name` text NOT NULL,
  `user_name` text NOT NULL,
  `user_ip` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table npc_unity.users_whitelist: ~0 rows (approximately)
/*!40000 ALTER TABLE `users_whitelist` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_whitelist` ENABLE KEYS */;

-- Dumping structure for table npc_unity.user_apartment
CREATE TABLE IF NOT EXISTS `user_apartment` (
  `room` int(11) NOT NULL AUTO_INCREMENT,
  `roomType` int(1) DEFAULT NULL,
  `cid` mediumtext NOT NULL,
  `mykeys` varchar(50) NOT NULL DEFAULT '[]',
  `ilness` mediumtext NOT NULL DEFAULT 'Alive',
  `isImprisoned` mediumtext NOT NULL DEFAULT '0',
  `isClothesSpawn` mediumtext NOT NULL DEFAULT 'true',
  `cash` int(11) DEFAULT 0,
  PRIMARY KEY (`room`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table npc_unity.user_apartment: ~0 rows (approximately)
/*!40000 ALTER TABLE `user_apartment` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_apartment` ENABLE KEYS */;

-- Dumping structure for table npc_unity.user_bans
CREATE TABLE IF NOT EXISTS `user_bans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT 'Unknown',
  `ip` varchar(255) NOT NULL,
  `steam_id` varchar(100) NOT NULL,
  `license` varchar(255) NOT NULL,
  `bandate` int(11) NOT NULL,
  `unbandate` int(11) NOT NULL,
  `length` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL DEFAULT 'No Reason',
  `removed` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table npc_unity.user_bans: ~0 rows (approximately)
/*!40000 ALTER TABLE `user_bans` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_bans` ENABLE KEYS */;

-- Dumping structure for table npc_unity.user_boat
CREATE TABLE IF NOT EXISTS `user_boat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) DEFAULT '{}',
  `boat_name` varchar(255) DEFAULT '{}',
  `boat_model` varchar(255) DEFAULT '{}',
  `boat_price` varchar(255) DEFAULT '{}',
  `boat_plate` varchar(255) DEFAULT '{}',
  `boat_state` varchar(255) DEFAULT '{}',
  `boat_colorprimary` varchar(255) DEFAULT '{}',
  `boat_colorsecondary` varchar(255) DEFAULT '{}',
  `boat_pearlescentcolor` varchar(255) DEFAULT '{}',
  `boat_wheelcolor` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table npc_unity.user_boat: ~0 rows (approximately)
/*!40000 ALTER TABLE `user_boat` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_boat` ENABLE KEYS */;

-- Dumping structure for table npc_unity.user_contacts
CREATE TABLE IF NOT EXISTS `user_contacts` (
  `identifier` varchar(40) NOT NULL,
  `name` longtext NOT NULL,
  `number` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table npc_unity.user_contacts: ~1 rows (approximately)
/*!40000 ALTER TABLE `user_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_contacts` ENABLE KEYS */;

-- Dumping structure for table npc_unity.user_controls
CREATE TABLE IF NOT EXISTS `user_controls` (
  `hex_id` varchar(255) NOT NULL DEFAULT '',
  `controls` varchar(255) DEFAULT '{}',
  PRIMARY KEY (`hex_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table npc_unity.user_controls: ~0 rows (approximately)
/*!40000 ALTER TABLE `user_controls` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_controls` ENABLE KEYS */;

-- Dumping structure for table npc_unity.user_inventory
CREATE TABLE IF NOT EXISTS `user_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `name` varchar(500) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `information` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `slot` int(11) NOT NULL,
  `dropped` tinyint(4) NOT NULL DEFAULT 0,
  `creationDate` bigint(20) NOT NULL DEFAULT 0,
  `quality` int(11) DEFAULT 100,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2861 DEFAULT CHARSET=latin1;

-- Dumping data for table npc_unity.user_inventory: ~0 rows (approximately)
/*!40000 ALTER TABLE `user_inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_inventory` ENABLE KEYS */;

-- Dumping structure for table npc_unity.user_inventory2
CREATE TABLE IF NOT EXISTS `user_inventory2` (
  `item_id` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `information` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `slot` int(11) NOT NULL,
  `dropped` tinyint(4) NOT NULL DEFAULT 0,
  `creationDate` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5489 DEFAULT CHARSET=latin1;

-- Dumping structure for table npc_unity.user_messages
CREATE TABLE IF NOT EXISTS `user_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender` varchar(10) NOT NULL,
  `receiver` varchar(10) NOT NULL,
  `message` varchar(255) NOT NULL DEFAULT '0',
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `isRead` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7517 DEFAULT CHARSET=utf8;

-- Dumping data for table npc_unity.user_messages: 0 rows
/*!40000 ALTER TABLE `user_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_messages` ENABLE KEYS */;

-- Dumping structure for table npc_unity.user_settings
CREATE TABLE IF NOT EXISTS `user_settings` (
  `hex_id` varchar(255) NOT NULL DEFAULT '',
  `settings` varchar(255) DEFAULT '{}',
  PRIMARY KEY (`hex_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table npc_unity.user_settings: ~0 rows (approximately)
/*!40000 ALTER TABLE `user_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_settings` ENABLE KEYS */;

-- Dumping structure for table npc_unity.vehicle_display
CREATE TABLE IF NOT EXISTS `vehicle_display` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(60) COLLATE utf8mb4_turkish_ci NOT NULL,
  `name` varchar(60) COLLATE utf8mb4_turkish_ci NOT NULL,
  `commission` int(11) NOT NULL DEFAULT 10,
  `baseprice` int(11) NOT NULL DEFAULT 25,
  `price` int(11) DEFAULT 25000,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

-- Dumping data for table npc_unity.vehicle_display: ~9 rows (approximately)
/*!40000 ALTER TABLE `vehicle_display` DISABLE KEYS */;
INSERT INTO `vehicle_display` (`id`, `model`, `name`, `commission`, `baseprice`, `price`) VALUES
	(1, 'gauntlet', 'Gauntlet', 15, 100000, 35000),
	(2, 'dubsta3', 'Dubsta3', 15, 100000, 100000),
	(3, 'landstalker', 'landstalker', 15, 100000, 100000),
	(4, 'bobcatxl', 'bobcatxl', 15, 100000, 100000),
	(5, 'surfer', 'surfer', 15, 100000, 100000),
	(6, 'glendale', 'glendale', 15, 100000, 100000),
	(7, 'washington', 'washington', 15, 100000, 100000),
	(8, 'fixter', 'Fixter (velo)', 10, 25, 25),
	(9, 'trophytruck', 'Trophy Truck', 10, 25, 25);
/*!40000 ALTER TABLE `vehicle_display` ENABLE KEYS */;

-- Dumping structure for table npc_unity.vip_list
CREATE TABLE IF NOT EXISTS `vip_list` (
  `id` int(11) DEFAULT NULL,
  `steamid` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table npc_unity.vip_list: ~0 rows (approximately)
/*!40000 ALTER TABLE `vip_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `vip_list` ENABLE KEYS */;

-- Dumping structure for table npc_unity.websites
CREATE TABLE IF NOT EXISTS `websites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` int(11) DEFAULT 0,
  `name` varchar(50) DEFAULT '',
  `keywords` text DEFAULT '',
  `description` text DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table npc_unity.websites: ~0 rows (approximately)
/*!40000 ALTER TABLE `websites` DISABLE KEYS */;
/*!40000 ALTER TABLE `websites` ENABLE KEYS */;

-- Dumping structure for table npc_unity.weed_plants
CREATE TABLE IF NOT EXISTS `weed_plants` (
  `id` int(11) DEFAULT 0,
  `coords` varchar(500) DEFAULT '',
  `seed` varchar(255) DEFAULT NULL,
  `growth` varchar(50) DEFAULT '0',
  `owner` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table npc_unity.weed_plants: ~0 rows (approximately)
/*!40000 ALTER TABLE `weed_plants` DISABLE KEYS */;
/*!40000 ALTER TABLE `weed_plants` ENABLE KEYS */;

-- Dumping structure for table npc_unity._character_crypto_wallet
CREATE TABLE IF NOT EXISTS `_character_crypto_wallet` (
  `id` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table npc_unity._character_crypto_wallet: ~0 rows (approximately)
/*!40000 ALTER TABLE `_character_crypto_wallet` DISABLE KEYS */;
/*!40000 ALTER TABLE `_character_crypto_wallet` ENABLE KEYS */;

-- Dumping structure for table npc_unity._vehicle
CREATE TABLE IF NOT EXISTS `_vehicle` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(11) unsigned NOT NULL,
  `vin` varchar(50) NOT NULL DEFAULT '',
  `type` varchar(50) NOT NULL DEFAULT '',
  `size` int(11) NOT NULL,
  `plate` varchar(50) NOT NULL DEFAULT '',
  `model` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(50) DEFAULT NULL,
  `garage` varchar(59) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `appearance` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid('appearance')),
  `mods` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid('mods')),
  `data` longtext DEFAULT NULL,
  `damage` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid('damage')),
  `degredation` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid('degredation')),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table npc_unity._vehicle: ~0 rows (approximately)
/*!40000 ALTER TABLE `_vehicle` DISABLE KEYS */;
/*!40000 ALTER TABLE `_vehicle` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;













