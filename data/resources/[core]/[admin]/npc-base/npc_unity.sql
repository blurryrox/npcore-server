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

CREATE TABLE `users` (
  `id` INT(11) NULL AUTO_INCREMENT,
  `hex_id` VARCHAR(100) DEFAULT NULL,
  `steam_id` VARCHAR(50) DEFAULT NULL,
  `community_id` VARCHAR(100) DEFAULT NULL,
  `license` VARCHAR(255) DEFAULT NULL,
  `name` VARCHAR(255) NOT NULL DEFAULT 'Uknown',
  `ip` VARCHAR(50) NOT NULL DEFAULT 'Uknown',
  `rank` VARCHAR(50) NOT NULL DEFAULT 'user',
  `date_created` TIMESTAMP NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (id)
);

CREATE TABLE `users_whitelist` (
  `id` INT(11) NULL AUTO_INCREMENT,
  `steam_id` VARCHAR(50) DEFAULT NULL,
  `power` INT(11) NOT NULL DEFAULT 0,
  `admin_name` TEXT NOT NULL,
  `user_name` TEXT NOT NULL,
  `user_ip` TEXT NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE `user_bans` (
  `id` INT(11) NULL AUTO_INCREMENT,
  `admin` VARCHAR(255) NOT NULL,
  `name` VARCHAR(255) NOT NULL DEFAULT 'Unknown',
  `ip` VARCHAR(255) NOT NULL,
  `steam_id` VARCHAR(100) NOT NULL,
  `license` VARCHAR(255) NOT NULL,
  `bandate` INT(11) NOT NULL,
  `unbandate` INT(11) NOT NULL,
  `length` INT(11) NOT NULL,
  `reason` VARCHAR(255) NOT NULL DEFAULT 'No Reason',
  `removed` INT(11) NOT NULL DEFAULT 0,
   PRIMARY KEY (id)
);

ALTER TABLE `users_whitelist`
  ADD UNIQUE INDEX `steamid(steamid)`;





