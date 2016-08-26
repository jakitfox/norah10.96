-- phpMyAdmin SQL Dump
-- version 4.6.0-dev
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 07, 2016 at 02:30 PM
-- Server version: 5.5.49-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `global`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `password` char(40) NOT NULL,
  `secret` char(16) DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT '1',
  `premdays` int(11) NOT NULL DEFAULT '0',
  `coins` int(12) NOT NULL DEFAULT '0',
  `lastday` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `email` varchar(255) NOT NULL DEFAULT '',
  `creation` int(11) NOT NULL DEFAULT '0',
  `vote` int(11) NOT NULL,
  `key` varchar(20) NOT NULL DEFAULT '0',
  `email_new` varchar(255) NOT NULL DEFAULT '',
  `email_new_time` int(11) NOT NULL DEFAULT '0',
  `rlname` varchar(255) NOT NULL DEFAULT '',
  `location` varchar(255) NOT NULL DEFAULT '',
  `page_access` int(11) NOT NULL DEFAULT '0',
  `email_code` varchar(255) NOT NULL DEFAULT '',
  `next_email` int(11) NOT NULL DEFAULT '0',
  `premium_points` int(11) NOT NULL DEFAULT '0',
  `create_date` int(11) NOT NULL DEFAULT '0',
  `create_ip` int(11) NOT NULL DEFAULT '0',
  `last_post` int(11) NOT NULL DEFAULT '0',
  `flag` varchar(80) NOT NULL DEFAULT '',
  `vip_time` int(11) NOT NULL,
  `guild_points` int(11) NOT NULL DEFAULT '0',
  `guild_points_stats` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `name`, `password`, `secret`, `type`, `premdays`, `coins`, `lastday`, `email`, `creation`, `vote`, `key`, `email_new`, `email_new_time`, `rlname`, `location`, `page_access`, `email_code`, `next_email`, `premium_points`, `create_date`, `create_ip`, `last_post`, `flag`, `vip_time`, `guild_points`, `guild_points_stats`) VALUES
(1, '1', '060d38973b4ba4051fa6ca22f9acd4be7d1557fe', NULL, 1, 0, 0, 0, '', 0, 0, '0', '', 0, '', '', 9999, '', 0, 0, 0, 0, 0, 'unknown', 0, 0, 0),
(8, 'god', '21298df8a3277357ee55b01df9530b535cf08ec1', NULL, 5, 0, 0, 1467596963, 'mitsuig@xtibia.com', 1465696163, 0, '', '', 0, '', '', 9999, '', 0, 0, 0, 0, 1467772450, '', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `account_bans`
--

CREATE TABLE `account_bans` (
  `account_id` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `banned_at` bigint(20) NOT NULL,
  `expires_at` bigint(20) NOT NULL,
  `banned_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `account_ban_history`
--

CREATE TABLE `account_ban_history` (
  `id` int(10) UNSIGNED NOT NULL,
  `account_id` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `banned_at` bigint(20) NOT NULL,
  `expired_at` bigint(20) NOT NULL,
  `banned_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `account_viplist`
--

CREATE TABLE `account_viplist` (
  `account_id` int(11) NOT NULL COMMENT 'id of account whose viplist entry it is',
  `player_id` int(11) NOT NULL COMMENT 'id of target player of viplist entry',
  `description` varchar(128) NOT NULL DEFAULT '',
  `icon` tinyint(2) UNSIGNED NOT NULL DEFAULT '0',
  `notify` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `id` int(10) NOT NULL,
  `title` varchar(50) NOT NULL,
  `text` varchar(255) NOT NULL,
  `date` varchar(20) NOT NULL,
  `author` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `global_storage`
--

CREATE TABLE `global_storage` (
  `key` varchar(32) NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `guilds`
--

CREATE TABLE `guilds` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `ownerid` int(11) NOT NULL,
  `creationdata` int(11) NOT NULL,
  `motd` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `guild_logo` mediumblob,
  `create_ip` int(11) NOT NULL DEFAULT '0',
  `balance` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `last_execute_points` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `guilds`
--
DELIMITER $$
CREATE TRIGGER `oncreate_guilds` AFTER INSERT ON `guilds` FOR EACH ROW BEGIN
    INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('the Leader', 3, NEW.`id`);
    INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('a Vice-Leader', 2, NEW.`id`);
    INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('a Member', 1, NEW.`id`);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `guildwar_kills`
--

CREATE TABLE `guildwar_kills` (
  `id` int(11) NOT NULL,
  `killer` varchar(50) NOT NULL,
  `target` varchar(50) NOT NULL,
  `killerguild` int(11) NOT NULL DEFAULT '0',
  `targetguild` int(11) NOT NULL DEFAULT '0',
  `warid` int(11) NOT NULL DEFAULT '0',
  `time` bigint(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `guild_invites`
--

CREATE TABLE `guild_invites` (
  `player_id` int(11) NOT NULL DEFAULT '0',
  `guild_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `guild_membership`
--

CREATE TABLE `guild_membership` (
  `player_id` int(11) NOT NULL,
  `guild_id` int(11) NOT NULL,
  `rank_id` int(11) NOT NULL,
  `nick` varchar(15) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `guild_ranks`
--

CREATE TABLE `guild_ranks` (
  `id` int(11) NOT NULL,
  `guild_id` int(11) NOT NULL COMMENT 'guild',
  `name` varchar(255) NOT NULL COMMENT 'rank name',
  `level` int(11) NOT NULL COMMENT 'rank level - leader, vice, member, maybe something else'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `guild_wars`
--

CREATE TABLE `guild_wars` (
  `id` int(11) NOT NULL,
  `guild1` int(11) NOT NULL DEFAULT '0',
  `guild2` int(11) NOT NULL DEFAULT '0',
  `name1` varchar(255) NOT NULL,
  `name2` varchar(255) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '0',
  `started` bigint(15) NOT NULL DEFAULT '0',
  `ended` bigint(15) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `houses`
--

CREATE TABLE `houses` (
  `id` int(11) NOT NULL,
  `owner` int(11) NOT NULL,
  `paid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `warnings` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `rent` int(11) NOT NULL DEFAULT '0',
  `town_id` int(11) NOT NULL DEFAULT '0',
  `bid` int(11) NOT NULL DEFAULT '0',
  `bid_end` int(11) NOT NULL DEFAULT '0',
  `last_bid` int(11) NOT NULL DEFAULT '0',
  `highest_bidder` int(11) NOT NULL DEFAULT '0',
  `size` int(11) NOT NULL DEFAULT '0',
  `beds` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `house_lists`
--

CREATE TABLE `house_lists` (
  `house_id` int(11) NOT NULL,
  `listid` int(11) NOT NULL,
  `list` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ip_bans`
--

CREATE TABLE `ip_bans` (
  `ip` int(10) UNSIGNED NOT NULL,
  `reason` varchar(255) NOT NULL,
  `banned_at` bigint(20) NOT NULL,
  `expires_at` bigint(20) NOT NULL,
  `banned_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `live_casts`
--

CREATE TABLE `live_casts` (
  `player_id` int(11) NOT NULL,
  `cast_name` varchar(255) NOT NULL,
  `password` tinyint(1) NOT NULL DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  `spectators` smallint(5) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `market_history`
--

CREATE TABLE `market_history` (
  `id` int(10) UNSIGNED NOT NULL,
  `player_id` int(11) NOT NULL,
  `sale` tinyint(1) NOT NULL DEFAULT '0',
  `itemtype` int(10) UNSIGNED NOT NULL,
  `amount` smallint(5) UNSIGNED NOT NULL,
  `price` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `expires_at` bigint(20) UNSIGNED NOT NULL,
  `inserted` bigint(20) UNSIGNED NOT NULL,
  `state` tinyint(1) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `market_offers`
--

CREATE TABLE `market_offers` (
  `id` int(10) UNSIGNED NOT NULL,
  `player_id` int(11) NOT NULL,
  `sale` tinyint(1) NOT NULL DEFAULT '0',
  `itemtype` int(10) UNSIGNED NOT NULL,
  `amount` smallint(5) UNSIGNED NOT NULL,
  `created` bigint(20) UNSIGNED NOT NULL,
  `anonymous` tinyint(1) NOT NULL DEFAULT '0',
  `price` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE `players` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `group_id` int(11) NOT NULL DEFAULT '1',
  `account_id` int(11) NOT NULL DEFAULT '0',
  `level` int(11) NOT NULL DEFAULT '1',
  `vocation` int(11) NOT NULL DEFAULT '0',
  `health` int(11) NOT NULL DEFAULT '150',
  `healthmax` int(11) NOT NULL DEFAULT '150',
  `experience` bigint(20) NOT NULL DEFAULT '0',
  `lookbody` int(11) NOT NULL DEFAULT '0',
  `lookfeet` int(11) NOT NULL DEFAULT '0',
  `lookhead` int(11) NOT NULL DEFAULT '0',
  `looklegs` int(11) NOT NULL DEFAULT '0',
  `looktype` int(11) NOT NULL DEFAULT '136',
  `lookaddons` int(11) NOT NULL DEFAULT '0',
  `maglevel` int(11) NOT NULL DEFAULT '0',
  `mana` int(11) NOT NULL DEFAULT '0',
  `manamax` int(11) NOT NULL DEFAULT '0',
  `manaspent` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `soul` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `town_id` int(11) NOT NULL DEFAULT '0',
  `posx` int(11) NOT NULL DEFAULT '0',
  `posy` int(11) NOT NULL DEFAULT '0',
  `posz` int(11) NOT NULL DEFAULT '0',
  `conditions` blob NOT NULL,
  `cap` int(11) NOT NULL DEFAULT '0',
  `sex` int(11) NOT NULL DEFAULT '0',
  `lastlogin` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `lastip` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `save` tinyint(1) NOT NULL DEFAULT '1',
  `skull` tinyint(1) NOT NULL DEFAULT '0',
  `skulltime` int(11) NOT NULL DEFAULT '0',
  `lastlogout` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `blessings` tinyint(2) NOT NULL DEFAULT '0',
  `onlinetime` int(11) NOT NULL DEFAULT '0',
  `deletion` bigint(15) NOT NULL DEFAULT '0',
  `balance` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `offlinetraining_time` smallint(5) UNSIGNED NOT NULL DEFAULT '43200',
  `offlinetraining_skill` int(11) NOT NULL DEFAULT '-1',
  `stamina` smallint(5) UNSIGNED NOT NULL DEFAULT '2520',
  `skill_fist` int(10) UNSIGNED NOT NULL DEFAULT '10',
  `skill_fist_tries` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `skill_club` int(10) UNSIGNED NOT NULL DEFAULT '10',
  `skill_club_tries` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `skill_sword` int(10) UNSIGNED NOT NULL DEFAULT '10',
  `skill_sword_tries` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `skill_axe` int(10) UNSIGNED NOT NULL DEFAULT '10',
  `skill_axe_tries` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `skill_dist` int(10) UNSIGNED NOT NULL DEFAULT '10',
  `skill_dist_tries` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `skill_shielding` int(10) UNSIGNED NOT NULL DEFAULT '10',
  `skill_shielding_tries` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `skill_fishing` int(10) UNSIGNED NOT NULL DEFAULT '10',
  `skill_fishing_tries` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL DEFAULT '',
  `comment` text NOT NULL,
  `create_ip` int(11) NOT NULL DEFAULT '0',
  `create_date` int(11) NOT NULL DEFAULT '0',
  `hide_char` int(11) NOT NULL DEFAULT '0',
  `cast` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `players`
--

INSERT INTO `players` (`id`, `name`, `group_id`, `account_id`, `level`, `vocation`, `health`, `healthmax`, `experience`, `lookbody`, `lookfeet`, `lookhead`, `looklegs`, `looktype`, `lookaddons`, `maglevel`, `mana`, `manamax`, `manaspent`, `soul`, `town_id`, `posx`, `posy`, `posz`, `conditions`, `cap`, `sex`, `lastlogin`, `lastip`, `save`, `skull`, `skulltime`, `lastlogout`, `blessings`, `onlinetime`, `deletion`, `balance`, `offlinetraining_time`, `offlinetraining_skill`, `stamina`, `skill_fist`, `skill_fist_tries`, `skill_club`, `skill_club_tries`, `skill_sword`, `skill_sword_tries`, `skill_axe`, `skill_axe_tries`, `skill_dist`, `skill_dist_tries`, `skill_shielding`, `skill_shielding_tries`, `skill_fishing`, `skill_fishing_tries`, `deleted`, `description`, `comment`, `create_ip`, `create_date`, `hide_char`, `cast`) VALUES
(1, 'Rook Sample', 1, 1, 8, 0, 180, 180, 4200, 0, 95, 78, 115, 128, 0, 0, 35, 35, 0, 0, 2, 32104, 32191, 6, '', 400, 0, 1407021967, 1793873073, 1, 0, 0, 1407021968, 0, 203, 0, 0, 43200, -1, 2520, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 0, '', '', 0, 0, 0, 0),
(2, 'Sorcerer Sample', 1, 1, 8, 1, 180, 180, 4200, 0, 95, 78, 115, 128, 0, 0, 35, 35, 0, 100, 2, 32104, 32191, 6, '', 400, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 43200, -1, 2520, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 0, '', '', 0, 0, 0, 0),
(3, 'Druid Sample', 1, 1, 8, 2, 180, 180, 4200, 0, 95, 78, 115, 128, 0, 0, 35, 35, 0, 100, 2, 32104, 32191, 6, 0x010004000002ffffffff0360ea00001a001b00000000fe, 400, 0, 1407021516, 255183537, 1, 0, 0, 1407021548, 0, 32, 0, 0, 43200, -1, 2520, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 0, '', '', 0, 0, 0, 0),
(4, 'Paladin Sample', 1, 1, 8, 3, 180, 180, 4200, 0, 95, 78, 115, 128, 0, 0, 35, 35, 0, 100, 2, 32104, 32191, 6, '', 400, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 43200, -1, 2520, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 0, '', '', 0, 0, 0, 0),
(5, 'Knight Sample', 1, 1, 8, 4, 180, 180, 4200, 0, 95, 78, 115, 128, 0, 0, 35, 35, 0, 100, 2, 32104, 32191, 6, '', 400, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 43200, -1, 2520, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 0, '', '', 0, 0, 0, 0),
(13, 'Mitsuig', 3, 8, 8, 0, 180, 180, 4200, 78, 125, 0, 113, 75, 0, 0, 35, 35, 0, 0, 2, 33254, 31838, 6, '', 400, 1, 1467640507, 3539523514, 1, 0, 0, 1467643311, 63, 30842, 0, 0, 43200, -1, 2520, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 0, '', '', 0, 1465696208, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `players_online`
--

CREATE TABLE `players_online` (
  `player_id` int(11) NOT NULL
) ENGINE=MEMORY DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `player_deaths`
--

CREATE TABLE `player_deaths` (
  `player_id` int(11) NOT NULL,
  `time` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `level` int(11) NOT NULL DEFAULT '1',
  `killed_by` varchar(255) NOT NULL,
  `is_player` tinyint(1) NOT NULL DEFAULT '1',
  `mostdamage_by` varchar(100) NOT NULL,
  `mostdamage_is_player` tinyint(1) NOT NULL DEFAULT '0',
  `unjustified` tinyint(1) NOT NULL DEFAULT '0',
  `mostdamage_unjustified` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `player_depotitems`
--

CREATE TABLE `player_depotitems` (
  `player_id` int(11) NOT NULL,
  `sid` int(11) NOT NULL COMMENT 'any given range eg 0-100 will be reserved for depot lockers and all > 100 will be then normal items inside depots',
  `pid` int(11) NOT NULL DEFAULT '0',
  `itemtype` smallint(6) NOT NULL,
  `count` smallint(5) NOT NULL DEFAULT '0',
  `attributes` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `player_inboxitems`
--

CREATE TABLE `player_inboxitems` (
  `player_id` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0',
  `itemtype` smallint(6) NOT NULL,
  `count` smallint(5) NOT NULL DEFAULT '0',
  `attributes` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `player_items`
--

CREATE TABLE `player_items` (
  `player_id` int(11) NOT NULL DEFAULT '0',
  `pid` int(11) NOT NULL DEFAULT '0',
  `sid` int(11) NOT NULL DEFAULT '0',
  `itemtype` smallint(6) NOT NULL DEFAULT '0',
  `count` smallint(5) NOT NULL DEFAULT '0',
  `attributes` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `player_namelocks`
--

CREATE TABLE `player_namelocks` (
  `player_id` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `namelocked_at` bigint(20) NOT NULL,
  `namelocked_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `player_rewards`
--

CREATE TABLE `player_rewards` (
  `player_id` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0',
  `itemtype` smallint(6) NOT NULL,
  `count` smallint(5) NOT NULL DEFAULT '0',
  `attributes` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `player_spells`
--

CREATE TABLE `player_spells` (
  `player_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `player_storage`
--

CREATE TABLE `player_storage` (
  `player_id` int(11) NOT NULL DEFAULT '0',
  `key` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `value` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `server_config`
--

CREATE TABLE `server_config` (
  `config` varchar(50) NOT NULL,
  `value` varchar(256) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `store_history`
--

CREATE TABLE `store_history` (
  `account_id` int(11) NOT NULL,
  `mode` smallint(2) NOT NULL DEFAULT '0',
  `description` varchar(3500) NOT NULL,
  `coin_amount` int(12) NOT NULL,
  `time` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tile_store`
--

CREATE TABLE `tile_store` (
  `house_id` int(11) NOT NULL,
  `data` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE `videos` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descricao` text NOT NULL,
  `categoria` int(11) NOT NULL,
  `link` varchar(11) NOT NULL,
  `ativo` int(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `videos_categorias`
--

CREATE TABLE `videos_categorias` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `videos_comentarios`
--

CREATE TABLE `videos_comentarios` (
  `id` int(11) NOT NULL,
  `mensagem` text NOT NULL,
  `character` varchar(255) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `topico` int(11) NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ativo` int(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `z_forum`
--

CREATE TABLE `z_forum` (
  `id` int(11) NOT NULL,
  `first_post` int(11) NOT NULL DEFAULT '0',
  `last_post` int(11) NOT NULL DEFAULT '0',
  `section` int(3) NOT NULL DEFAULT '0',
  `replies` int(20) NOT NULL DEFAULT '0',
  `views` int(20) NOT NULL DEFAULT '0',
  `author_aid` int(20) NOT NULL DEFAULT '0',
  `author_guid` int(20) NOT NULL DEFAULT '0',
  `post_text` text NOT NULL,
  `post_topic` varchar(255) NOT NULL,
  `post_smile` tinyint(1) NOT NULL DEFAULT '0',
  `post_date` int(20) NOT NULL DEFAULT '0',
  `last_edit_aid` int(20) NOT NULL DEFAULT '0',
  `edit_date` int(20) NOT NULL DEFAULT '0',
  `post_ip` varchar(15) NOT NULL DEFAULT '0.0.0.0',
  `icon_id` int(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `z_network_box`
--

CREATE TABLE `z_network_box` (
  `id` int(11) NOT NULL,
  `network_name` varchar(10) NOT NULL,
  `network_link` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `z_network_box`
--

INSERT INTO `z_network_box` (`id`, `network_name`, `network_link`) VALUES
(1, 'facebook', 'pages/Globalzhao/351502481668782'),
(2, 'twitter', 'tibia');

-- --------------------------------------------------------

--
-- Table structure for table `z_news_tickers`
--

CREATE TABLE `z_news_tickers` (
  `date` int(11) NOT NULL DEFAULT '1',
  `author` int(11) NOT NULL,
  `image_id` int(3) NOT NULL DEFAULT '0',
  `text` text NOT NULL,
  `hide_ticker` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `z_ots_comunication`
--

CREATE TABLE `z_ots_comunication` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `param1` varchar(255) NOT NULL,
  `param2` varchar(255) NOT NULL,
  `param3` varchar(255) NOT NULL,
  `param4` varchar(255) NOT NULL,
  `param5` varchar(255) NOT NULL,
  `param6` varchar(255) NOT NULL,
  `param7` varchar(255) NOT NULL,
  `delete_it` int(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `z_ots_guildcomunication`
--

CREATE TABLE `z_ots_guildcomunication` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `param1` varchar(255) NOT NULL,
  `param2` varchar(255) NOT NULL,
  `param3` varchar(255) NOT NULL,
  `param4` varchar(255) NOT NULL,
  `param5` varchar(255) NOT NULL,
  `param6` varchar(255) NOT NULL,
  `param7` varchar(255) NOT NULL,
  `delete_it` int(2) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `z_polls`
--

CREATE TABLE `z_polls` (
  `id` int(11) NOT NULL,
  `question` varchar(255) NOT NULL,
  `end` int(11) NOT NULL,
  `start` int(11) NOT NULL,
  `answers` int(11) NOT NULL,
  `votes_all` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `z_polls_answers`
--

CREATE TABLE `z_polls_answers` (
  `poll_id` int(11) NOT NULL,
  `answer_id` int(11) NOT NULL,
  `answer` varchar(255) NOT NULL,
  `votes` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `z_shopguild_history_item`
--

CREATE TABLE `z_shopguild_history_item` (
  `id` int(11) NOT NULL,
  `to_name` varchar(255) NOT NULL DEFAULT '0',
  `to_account` int(11) NOT NULL DEFAULT '0',
  `from_nick` varchar(255) NOT NULL,
  `from_account` int(11) NOT NULL DEFAULT '0',
  `price` int(11) NOT NULL DEFAULT '0',
  `offer_id` int(11) NOT NULL DEFAULT '0',
  `trans_state` varchar(255) NOT NULL,
  `trans_start` int(11) NOT NULL DEFAULT '0',
  `trans_real` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `z_shopguild_history_pacc`
--

CREATE TABLE `z_shopguild_history_pacc` (
  `id` int(11) NOT NULL,
  `to_name` varchar(255) NOT NULL DEFAULT '0',
  `to_account` int(11) NOT NULL DEFAULT '0',
  `from_nick` varchar(255) NOT NULL,
  `from_account` int(11) NOT NULL DEFAULT '0',
  `price` int(11) NOT NULL DEFAULT '0',
  `pacc_days` int(11) NOT NULL DEFAULT '0',
  `trans_state` varchar(255) NOT NULL,
  `trans_start` int(11) NOT NULL DEFAULT '0',
  `trans_real` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `z_shopguild_offer`
--

CREATE TABLE `z_shopguild_offer` (
  `id` int(11) NOT NULL,
  `points` int(11) NOT NULL DEFAULT '0',
  `itemid1` int(11) NOT NULL DEFAULT '0',
  `count1` int(11) NOT NULL DEFAULT '0',
  `itemid2` int(11) NOT NULL DEFAULT '0',
  `count2` int(11) NOT NULL DEFAULT '0',
  `offer_type` varchar(255) DEFAULT NULL,
  `offer_description` text NOT NULL,
  `offer_name` varchar(255) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `z_shopguild_offer`
--

INSERT INTO `z_shopguild_offer` (`id`, `points`, `itemid1`, `count1`, `itemid2`, `count2`, `offer_type`, `offer_description`, `offer_name`, `pid`) VALUES
(1, 1, 2160, 10, 0, 0, 'item', '10 crystal coin para seu char.', 'Crystal Coin', 0),
(2, 10, 2640, 1, 0, 0, 'item', 'Soft Boots regenerate 10 health per 2 seconds and 15 mana per 2 seconds.', 'Pair of Soft Boots', 0),
(3, 2, 2195, 1, 0, 0, 'item', 'boots of haste (speed +20).', 'Boots of Haste', 0),
(4, 5, 18409, 1, 0, 0, 'item', 'Fire ataque max 85 e magic +1.', 'Wand of Everblazing', 0),
(5, 5, 18411, 1, 0, 0, 'item', 'Earth ataque max 85 e magic +1.', 'Muck Rod', 0),
(6, 5, 2400, 1, 0, 0, 'item', 'Atributos (Atk:48, Def:35 +3).', 'Magic Sword', 0),
(7, 7, 2431, 1, 0, 0, 'item', 'Atributos (Atk:50, Def:30 +3).', 'Stonecutter Axe', 0),
(8, 6, 8928, 1, 0, 0, 'item', 'Atributos (Atk:50, Def:30 +2).', 'Obsidian Truncheon', 0),
(9, 5, 18453, 1, 0, 0, 'item', 'Atributos (Range:6, Atk+4, Hit%+3).', 'Crystal Crossbow', 0);

-- --------------------------------------------------------

--
-- Table structure for table `z_shop_history_item`
--

CREATE TABLE `z_shop_history_item` (
  `id` int(11) NOT NULL,
  `to_name` varchar(255) NOT NULL DEFAULT '0',
  `to_account` int(11) NOT NULL DEFAULT '0',
  `from_nick` varchar(255) NOT NULL,
  `from_account` int(11) NOT NULL DEFAULT '0',
  `price` int(11) NOT NULL DEFAULT '0',
  `offer_id` varchar(255) NOT NULL DEFAULT '',
  `trans_state` varchar(255) NOT NULL,
  `trans_start` int(11) NOT NULL DEFAULT '0',
  `trans_real` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `z_shop_offer`
--

CREATE TABLE `z_shop_offer` (
  `id` int(11) NOT NULL,
  `points` int(11) NOT NULL DEFAULT '0',
  `itemid1` int(11) NOT NULL DEFAULT '0',
  `count1` int(11) NOT NULL DEFAULT '0',
  `itemid2` int(11) NOT NULL DEFAULT '0',
  `count2` int(11) NOT NULL DEFAULT '0',
  `offer_type` varchar(255) DEFAULT NULL,
  `offer_description` text NOT NULL,
  `offer_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `z_shop_offer`
--

INSERT INTO `z_shop_offer` (`id`, `points`, `itemid1`, `count1`, `itemid2`, `count2`, `offer_type`, `offer_description`, `offer_name`) VALUES
(12, 10, 12649, 1, 0, 0, 'item', 'A decent sword-weapon. Attack: 48. Defense: 29 +2. Weight: 64 oz.', 'Blade of Corruption'),
(13, 2, 2160, 50, 0, 0, 'item', '500k direto para seu personagem', '50 crystal coins'),
(14, 5, 8927, 1, 0, 0, 'item', 'You see a dark trinity mace (Atk:51, Def:32 -1).\r\nIt can only be wielded properly by players of level 120 or higher.\r\nIt weighs 99.00 oz.', 'Dark Trinity Mace'),
(15, 4, 2494, 1, 0, 0, 'item', 'You see a demon armor (Arm:16).\r\nIt weighs 80.00 oz.', 'Demon Armor'),
(16, 4, 2495, 1, 0, 0, 'item', 'You see demon legs (Arm:9).\r\nIt weighs 70.00 oz.', 'Demon Legs'),
(17, 8, 15410, 1, 0, 0, 'item', 'You see a depth calcei (Arm:3, protection physical +5%, speed -5).\r\nIt can only be wielded properly by knights of level 150 or higher.\r\nIt weighs 37.00 oz.', 'Depth Calcei'),
(18, 8, 15408, 1, 0, 0, 'item', 'You see a depth galea (Arm:8, protection drown +100%).\r\nIt can only be wielded properly by players of level 150 or higher.\r\nIt weighs 46.00 oz.\r\nEnables underwater exploration.', 'Depth Galea'),
(19, 8, 15407, 1, 0, 0, 'item', 'You see a depth lorica (Arm:16, distance fighting +3, protection death +5%).\r\nIt can only be wielded properly by royal paladins and elite knights of level 80 or higher.\r\nIt weighs 145.00 oz.', 'Depth Lorica'),
(20, 8, 15409, 1, 0, 0, 'item', 'You see a depth ocrea (Arm:8, protection mana drain +15%).\r\nIt can only be wielded properly by sorcerers and druids of level 80 or higher.\r\nIt weighs 48.00 oz.', 'Depth Ocrea'),
(21, 6, 15411, 1, 0, 0, 'item', 'You see a depth scutum (Def:25, magic level +2).\r\nIt can only be wielded properly by sorcerers and druids of level 120 or higher.\r\nIt weighs 30.00 oz.', 'Depth Scutum'),
(22, 2, 2472, 1, 0, 0, 'item', 'You see a magic plate armor (Arm:17).\r\nIt can only be wielded properly by knights and paladins.\r\nIt weighs 85.00 oz.', 'Magic Plate Armor'),
(23, 4, 2646, 1, 0, 0, 'item', 'You see golden boots (Arm:4).\r\nIt weighs 31.00 oz.', 'Golden Boots'),
(24, 8, 2471, 1, 0, 0, 'item', 'You see a golden helmet (Arm:12).\r\nIt weighs 32.00 oz.\r\nIt''s the famous Helmet of the Stars.', 'Golden Helmet'),
(25, 4, 12642, 1, 0, 0, 'item', 'You see a royal draken mail (Arm:16, shielding +3, protection physical +5%).\r\nIt can only be wielded properly by knights of level 100 or higher.\r\nIt weighs 130.00 oz.', 'Royal Draken Mail'),
(26, 4, 12643, 1, 0, 0, 'item', 'You see a royal scale robe (Arm:12, magic level +2, protection fire +5%).\r\nIt can only be wielded properly by sorcerers and druids of level 100 or higher.\r\nIt weighs 45.00 oz.', 'Royal Scale Robe'),
(27, 5, 8884, 1, 0, 0, 'item', 'You see an oceanborn leviathan armor (Arm:15, shielding +1, protection energy -5%, ice +5%).\r\nIt can only be wielded properly by knights of level 100 or higher.\r\nIt weighs 100.00 oz.', 'Oceanborn Leviathan Armor '),
(28, 4, 12645, 1, 0, 0, 'item', 'You see an elite draken helmet (Arm:9, distance fighting +1, protection death +3%).\r\nIt can only be wielded properly by paladins of level 100 or higher.\r\nIt weighs 43.00 oz.', 'Elite Draken Helmet'),
(29, 5, 18465, 1, 0, 0, 'item', 'You see a shiny blade (Atk:50, Def:35 +3, sword fighting +1).\r\nIt can only be wielded properly by knights of level 120 or higher.\r\nIt weighs 45.00 oz.', 'Shiny Blade'),
(30, 5, 8882, 1, 0, 0, 'item', 'You see an earthborn titan armor (Arm:15, axe fighting +2, protection earth +5%, fire -5%).\r\nIt can only be wielded properly by knights of level 100 or higher.\r\nIt weighs 120.00 oz.', 'Earthborn Titan Armor'),
(31, 5, 8883, 1, 0, 0, 'item', 'You see a windborn colossus armor (Arm:15, club fighting +2, protection energy +5%, earth -5%).\r\nIt can only be wielded properly by knights of level 100 or higher.\r\nIt weighs 120.00 oz.', 'Windborn Colossus Armor'),
(32, 5, 8881, 1, 0, 0, 'item', 'You see a fireborn giant armor (Arm:15, sword fighting +2, protection fire +5%, ice -5%).\r\nIt can only be wielded properly by knights of level 100 or higher.\r\nIt weighs 120.00 oz.', 'Fireborn Giant Armor'),
(33, 7, 6132, 1, 0, 0, 'item', 'You see a pair of soft boots that is brand-new.\r\nIt weighs 8.00 oz.', 'Soft Boots'),
(34, 5, 18451, 1, 0, 0, 'item', 'You see the crystalline axe (Atk:51, Def:29 +3, axe fighting +1).\r\nIt can only be wielded properly by knights of level 120 or higher.\r\nIt weighs 76.00 oz.\r\nEven in the light of day, the stars seem to reflect in each facet of this crystalline axe.', 'Crystalline Axe'),
(35, 5, 8888, 1, 0, 0, 'item', 'You see a master archer''s armor (Arm:15, distance fighting +3).\r\nIt can only be wielded properly by paladins of level 100 or higher.\r\nIt weighs 69.00 oz.', 'Master Archer''s Armor'),
(36, 5, 18452, 1, 0, 0, 'item', 'You see the mycological mace (Atk:50, Def:31 +3, club fighting +1).\r\nIt can only be wielded properly by knights of level 120 or higher.\r\nIt weighs 48.00 oz.', 'Mycological Mace'),
(37, 10, 2798, 100, 0, 0, 'decoracao', 'You see 100 blood herbs.\r\nThey weigh 120.00 oz.', '100 Blood Herb'),
(38, 6, 2798, 50, 0, 0, 'decoracao', 'You see 50 blood herbs.\r\nThey weigh 120.00 oz.', '50 Blood Herb'),
(39, 4, 2361, 1, 0, 0, 'decoracao', 'You see a frozen starlight.\r\nIt weighs 0.20 oz.', 'Frozen Starlight'),
(40, 4, 2365, 1, 0, 0, 'mix', 'You see a backpack of holding (Vol:50).\r\nIt weighs 1411.20 oz.', 'Backpack of Holding'),
(41, 5, 6500, 100, 0, 0, 'mix', 'You see demonic essence.\r\nIt weighs 10.00 oz.\r\nSomeone might be interested in trading this.', '100 Demonic Essences'),
(42, 5, 8851, 1, 0, 0, 'item', 'You see a royal crossbow (Range:6, Atk+5, Hit%+3).\r\nIt can only be wielded properly by paladins of level 130 or higher.\r\nIt weighs 120.00 oz.', 'Royal Crossbow'),
(43, 5, 22398, 1, 0, 0, 'item', 'You see a crude umbral blade (Atk:48, Def:26 +1).\r\nIt can only be wielded properly by knights of level 75 or higher.\r\nIt weighs 63.00 oz.', 'Crude Umbral Blade'),
(44, 7, 22399, 1, 0, 0, 'item', 'umbral blade (Atk:50, Def:29 +2).\r\nIt can only be wielded properly by knights of level 120 or higher.\r\nIt weighs 59.00 oz.', 'Umbral Blade'),
(45, 10, 22400, 1, 0, 0, 'item', 'You see a Umbral Masterblade (Atk:52, Def:31 +3, sword fighting +1).\r\nIt can only be wielded properly by knights of level 250 or higher.\r\nIt weighs 55.00 oz.', 'Umbral Masterblade'),
(46, 3, 22401, 1, 0, 0, 'item', 'You see a crude umbral slayer (Atk:51, Def:29).\r\nIt can only be wielded properly by knights of level 75 or higher.\r\nIt weighs 100.00 oz.', 'Crude Umbral Slayer'),
(47, 5, 22402, 1, 0, 0, 'item', 'You see a Umbral Slayer (Atk:52, Def:31).\r\nIt can only be wielded properly by knights of level 120 or higher.\r\nIt weighs 95.00 oz.', 'Umbral Slayer'),
(48, 1, 2160, 20, 0, 0, 'mix', '200k direto para seu personagem', '20 crystal coins'),
(49, 8, 22403, 1, 0, 0, 'item', 'You see a umbral master slayer (Atk:54, Def:35, sword fighting +3).\r\nIt can only be wielded properly by knights of level 250 or higher.\r\nIt weighs 90.00 oz', 'Umbral Master Slayer'),
(50, 5, 22404, 1, 0, 0, 'item', 'You see a crude umbral axe (Atk:49, Def:24 +1).\r\nIt can only be wielded properly by knights of level 75 or higher.\r\nIt weighs 90.00 oz.', 'Crude Umbral Axe'),
(51, 7, 22405, 1, 0, 0, 'item', 'You see a Umbral Axe (Atk:51, Def:27 +2).\r\nIt can only be wielded properly by knights of level 120 or higher.\r\nIt weighs 85.00 oz.', 'Umbral Axe'),
(52, 10, 22406, 1, 0, 0, 'item', 'You see a Umbral Master Axe (Atk:53, Def:30 +3, axe fighting +1).\r\nIt can only be wielded properly by knights of level 250 or higher.\r\nIt weighs 80.00 oz', 'Umbral Master Axe'),
(53, 3, 22407, 1, 0, 0, 'item', 'You see a crude umbral chopper (Atk:51, Def:27).\r\nIt can only be wielded properly by knights of level 75 or higher.\r\nIt weighs 120.00 oz.', 'Crude Umbral Chopper'),
(54, 5, 22408, 1, 0, 0, 'item', 'You see a umbral chopper (Atk:52, Def:30).\r\nIt can only be wielded properly by knights of level 120 or higher.\r\nIt weighs 115.00 oz.', 'Umbral Chopper'),
(55, 8, 22409, 1, 0, 0, 'item', 'You see a umbral master chopper (Atk:54, Def:34, axe fighting +3).\r\nIt can only be wielded properly by knights of level 250 or higher.\r\nIt weighs 110.00 oz.', 'Umbral Master Chopper'),
(56, 5, 22410, 1, 0, 0, 'item', 'You see a crude umbral mace (Atk:48, Def:22 +1).\r\nIt can only be wielded properly by knights of level 75 or higher.\r\nIt weighs 90.00 oz.', 'Crude Umbral Mace'),
(57, 7, 22411, 1, 0, 0, 'item', 'You see a umbral mace (Atk:50, Def:26 +2).\r\nIt can only be wielded properly by knights of level 120 or higher.\r\nIt weighs 85.00 oz.', 'Umbral Mace'),
(58, 10, 22412, 1, 0, 0, 'item', 'You see a umbral master mace (Atk:52, Def:30 +3, club fighting +1).\r\nIt can only be wielded properly by knights of level 250 or higher.\r\nIt weighs 80.00 oz.', 'Umbral Master Mace'),
(59, 3, 22413, 1, 0, 0, 'item', 'You see a crude umbral hammer (Atk:51, Def:27).\r\nIt can only be wielded properly by knights of level 75 or higher.\r\nIt weighs 170.00 oz.', 'Crude Umbral Hammer'),
(60, 5, 22414, 1, 0, 0, 'item', 'You see a umbral hammer (Atk:53, Def:30).\r\nIt can only be wielded properly by knights of level 120 or higher.\r\nIt weighs 165.00 oz.', 'Umbral Hammer'),
(61, 8, 22415, 1, 0, 0, 'item', 'You see a umbral master hammer (Atk:55, Def:34, club fighting +3).\r\nIt can only be wielded properly by knights of level 250 or higher.\r\nIt weighs 160.00 oz.', 'Umbral Master Hammer'),
(62, 10, 22421, 1, 0, 0, 'item', 'You see a umbral master crossbow (Range:5, Atk+9, Hit%+4).\r\nIt can only be wielded properly by paladins of level 250 or higher.\r\nIt weighs 120.00 oz.', 'Umbral Master Crossbow'),
(63, 10, 22418, 1, 0, 0, 'item', 'You see a umbral master bow (Range:7, Atk+6, Hit%+5).\r\nIt can only be wielded properly by paladins of level 250 or higher.\r\nIt weighs 40.00 oz.', 'Umbral Master Bow'),
(64, 5, 22420, 1, 0, 0, 'item', 'You see a umbral crossbow (Range:5, Atk+6, Hit%+3).\r\nIt can only be wielded properly by paladins of level 120 or higher.\r\nIt weighs 125.00 oz.', 'Umbral Crossbow'),
(65, 5, 22417, 1, 0, 0, 'item', 'You see a umbral bow (Range:7, Atk+4, Hit%+5).\r\nIt can only be wielded properly by paladins of level 120 or higher.\r\nIt weighs 45.00 oz.', 'Umbral Bow'),
(66, 3, 22419, 1, 0, 0, 'item', 'You see a crude umbral crossbow (Range:5, Atk+3, Hit%+3).\r\nIt can only be wielded properly by paladins of level 75 or higher.\r\nIt weighs 130.00 oz.', 'Crude Umbral Crossbow'),
(67, 3, 22416, 1, 0, 0, 'item', 'You see a crude umbral bow (Range:7, Atk+2, Hit%+5).\r\nIt can only be wielded properly by paladins of level 75 or higher.\r\nIt weighs 50.00 oz.', 'Crude Umbral Bow'),
(68, 7, 16111, 1, 0, 0, 'item', 'You see a thorn spitter (Range:6, Atk+9, Hit%+1).\r\nIt can only be wielded properly by paladins of level 150 or higher.\r\nIt weighs 126.00 oz.', 'Thorn Spitter'),
(69, 10, 22424, 1, 0, 0, 'item', 'You see a umbral master spellbook (Def:20, magic level +4, protection energy +5%, earth +5%, fire +5%, ice +5%).\r\nIt can only be wielded properly by sorcerers and druids of level 250 or higher.\r\nIt weighs 30.00 oz.', 'Umbral Master Spellbook'),
(70, 7, 16112, 1, 0, 0, 'item', 'You see a spellbook of ancient arcana (Def:19, magic level +4, protection death +5%).\r\nIt can only be wielded properly by sorcerers and druids of level 150 or higher.\r\nIt weighs 25.00 oz.\r\nIt shows your spells and can also shield against attacks when worn.', 'Spellbook of Ancient Arcana'),
(71, 5, 22423, 1, 0, 0, 'item', 'You see a umbral spellbook (Def:16, magic level +2, protection energy +3%, earth +3%, fire +3%, ice +3%).\r\nIt can only be wielded properly by sorcerers and druids of level 120 or higher.\r\nIt weighs 35.00 oz.', 'Umbral Spellbook'),
(72, 10, 18423, 20, 0, 0, 'item', 'You see 20 major crystalline tokens.\r\nThey weigh 70.00 oz.', 'Major Crystalline Tokens'),
(73, 4, 9777, 1, 0, 0, 'item', 'You see a yalahari leg piece (Arm:8, distance fighting +2, protection death +5%).\r\nIt can only be wielded properly by paladins of level 80 or higher.\r\nIt weighs 65.00 oz.', 'Yalahari Leg Piece'),
(74, 4, 9776, 1, 0, 0, 'item', 'You see a yalahari armor (Arm:16, protection death +3%).\r\nIt can only be wielded properly by knights of level 80 or higher.\r\nIt weighs 70.00 oz.', 'Yalahari Armor'),
(75, 4, 9778, 1, 0, 0, 'item', 'You see a yalahari mask (Arm:5, magic level +2).\r\nIt can only be wielded properly by sorcerers and druids of level 80 or higher.\r\nIt weighs 35.00 oz.', 'Yalahari Mask'),
(76, 15, 11101, 1, 0, 0, 'addon', 'Voce recebera o addon male e female full no jogo.', 'Barbarian Addon'),
(77, 15, 11101, 1, 0, 0, 'addon', 'Voce recebera o addon male e female full no jogo.', 'Warrior Addon'),
(78, 15, 11101, 1, 0, 0, 'addon', 'Voce recebera o addon male e female full no jogo.', 'Assassin Addon'),
(79, 15, 11101, 1, 0, 0, 'addon', 'Voce recebera o addon male e female full no jogo.', 'Insectoid Addon'),
(80, 5, 11101, 1, 0, 0, 'mount', 'Voce recebera a montaria no jogo.', 'Draptor'),
(81, 3, 11101, 1, 0, 0, 'mount', 'Voce recebera a montaria no jogo.', 'Dromedary'),
(82, 5, 11101, 1, 0, 0, 'mount', 'Voce recebera a montaria no jogo.', 'Iron Blight'),
(83, 5, 11101, 1, 0, 0, 'mount', 'Voce recebera a montaria no jogo.', 'Magma Crawler'),
(84, 10, 11101, 1, 0, 0, 'mount', 'Voce recebera a montaria no jogo.', 'Lady Bug'),
(85, 10, 11101, 1, 0, 0, 'mount', 'Voce recebera a montaria no jogo.', 'Scorpion King'),
(87, 20, 11101, 1, 0, 0, 'addon', 'Voce recebera o addon male e female full no jogo.', 'Summoner Addon'),
(88, 20, 11101, 1, 0, 0, 'addon', 'Voce recebera o addon male e female full no jogo.', 'Red Baron Addon'),
(90, 30, 11101, 1, 0, 0, 'mount', 'Voce recebera a montaria no jogo.', 'Shadow Draptor'),
(91, 20, 11101, 1, 0, 0, 'mount', 'Voce recebera a montaria no jogo.', 'Red Manta'),
(92, 30, 11101, 1, 0, 0, 'mount', 'Voce recebera a montaria no jogo.', 'Golden Lion'),
(93, 25, 11101, 1, 0, 0, 'mount', 'Voce recebera a montaria no jogo.', 'Armoured War Horse'),
(94, 20, 11101, 1, 0, 0, 'mount', 'Voce recebera a montaria no jogo.', 'Blazebringer'),
(95, 25, 11101, 1, 0, 0, 'mount', 'Voce recebera a montaria no jogo.', 'Armoured Dragonling'),
(96, 20, 11101, 1, 0, 0, 'mount', 'Voce recebera a montaria no jogo.', 'Steelbeak'),
(97, 25, 11101, 1, 0, 0, 'mount', 'Voce recebera a montaria no jogo.', 'Armoured Scorpion'),
(98, 25, 11101, 1, 0, 0, 'mount', 'Voce recebera a montaria no jogo.', 'Armoured Cavebear'),
(99, 30, 11101, 1, 0, 0, 'mount', 'Voce recebera a montaria no jogo.', 'Lion'),
(100, 30, 11101, 1, 0, 0, 'addon', 'Voce recebera o addon male e female full no jogo.', 'Mage Addon'),
(103, 4, 2798, 10, 0, 0, 'item', 'You see 10 blood herbs.\r\nThey weigh 12.00 oz.', '10 Blood Herb'),
(104, 2, 2151, 10, 0, 0, 'item', 'You see 10 talons.\r\nThey weigh 2.00 oz.\r\nThere are many rumours about these magic gems.', '10 Talons'),
(105, 8, 2504, 1, 0, 0, 'item', 'You see dwarven legs (Arm:7, protection physical +3%).\r\nIt weighs 49.00 oz.', 'Dwarven Legs'),
(106, 8, 2503, 1, 0, 0, 'item', 'You see a dwarven armor (Arm:10, protection physical +5%).\r\nIt weighs 130.00 oz.', 'Dwarven Armor'),
(108, 5, 12644, 1, 0, 0, 'item', 'You see a shield of corruption (Def:36, sword fighting +3).\r\nIt can only be wielded properly by knights of level 80 or higher.\r\nIt weighs 49.00 oz.', 'Shield of Corruption'),
(109, 4, 15413, 1, 0, 0, 'item', 'You see an ornate shield (Def:36, protection physical +5%).\r\nIt can only be wielded properly by knights of level 130 or higher.\r\nIt weighs 71.00 oz.', 'Ornate Shield'),
(110, 5, 6391, 1, 0, 0, 'item', 'You see a nightmare shield (Def:37).\r\nIt weighs 32.00 oz.\r\nIt was crafted by the ancient order of the nightmare knights.', 'Nightmare Shield '),
(111, 6, 6433, 1, 0, 0, 'item', 'You see a necromancer shield (Def:37).\r\nIt weighs 32.00 oz.\r\nIt is enchanted with unholy, necromantic powers.', 'Necromancer Shield'),
(112, 6, 18410, 1, 0, 0, 'item', 'You see a prismatic shield (Def:37, shielding +2, protection physical +4%).\r\nIt can only be wielded properly by knights of level 150 or higher.\r\nIt weighs 72.00 oz.', 'Prismatic Shield'),
(113, 5, 8918, 1, 0, 0, 'item', 'You see a spellbook of dark mysteries (Def:16, magic level +3).\r\nIt can only be wielded properly by sorcerers and druids of level 80 or higher.\r\nIt weighs 28.50 oz.\r\nIt shows your spells and can also shield against attacks when worn.', 'Spellbook of Dark Mysteries'),
(114, 7, 18422, 20, 0, 0, 'item', 'You see 20 minor crystalline tokens.\r\nThey weigh 50.00 oz.', 'Minor Crystalline Tokens'),
(115, 4, 21725, 1, 0, 0, 'item', 'You see a furious frock (Arm:12, magic level +2, protection fire +5%).\r\nIt can only be wielded properly by sorcerers and druids of level 130 or higher.\r\nIt weighs 34.00 oz.', 'Furious Frock'),
(116, 30, 11101, 1, 0, 0, 'mount', 'Voce recebera a montaria no jogo.', 'Walker'),
(117, 30, 11101, 1, 0, 0, 'mount', 'Voce recebera a montaria no jogo.', 'Azudocus'),
(118, 30, 11101, 1, 0, 0, 'mount', 'Voce recebera a montaria no jogo.', 'Carpacosaurus'),
(119, 30, 11101, 1, 0, 0, 'mount', 'Voce recebera a montaria no jogo.', 'Death Crawler'),
(120, 30, 11101, 1, 0, 0, 'mount', 'Voce recebera a montaria no jogo.', 'Flamesteed'),
(121, 30, 11101, 1, 0, 0, 'mount', 'Voce recebera a montaria no jogo.', 'Jade Lion'),
(122, 30, 11101, 1, 0, 0, 'mount', 'Voce recebera a montaria no jogo.', 'Jade Pincer'),
(123, 30, 11101, 1, 0, 0, 'mount', 'Voce recebera a montaria no jogo.', 'Nethersteed'),
(124, 30, 11101, 1, 0, 0, 'mount', 'Voce recebera a montaria no jogo.', 'Tempest'),
(125, 30, 11101, 1, 0, 0, 'mount', 'Voce recebera a montaria no jogo.', 'Winter King'),
(126, 20, 11101, 1, 0, 0, 'addon', 'Voce recebera o addon male e female full no jogo.', 'Glooth Engineer Addon'),
(127, 40, 11101, 1, 0, 0, 'addon', 'Voce recebera o addon male e female full no jogo.', 'Champion Addon'),
(128, 50, 11101, 1, 0, 0, 'addon', 'Voce recebera o addon male e female full no jogo.', 'Conjurer Addon'),
(129, 40, 11101, 1, 0, 0, 'addon', 'Voce recebera o addon male e female full no jogo.', 'Beastmaster Addon'),
(130, 20, 2523, 1, 0, 0, 'item', 'You see a blessed shield (Def:40).\r\nIt weighs 68.00 oz.\r\nThe shield grants divine protection.', 'Blessed Shield'),
(131, 20, 2390, 1, 0, 0, 'item', 'You see a magic longsword (Atk:55, Def:40).\r\nIt can only be wielded properly by knights of level 140 or higher.\r\nIt weighs 43.00 oz.\r\nIt''s the magic Cyclopmania Sword.', 'Magic Longsword'),
(132, 20, 2408, 1, 0, 0, 'item', 'You see a warlord sword (Atk:53, Def:38).\r\nIt can only be wielded properly by knights of level 120 or higher.\r\nIt weighs 64.00 oz.\r\nStrong powers flow in this magic sword.', 'Warlord Sword'),
(133, 15, 8925, 1, 0, 0, 'item', 'You see a solar axe (Atk:52, Def:29 +3).\nIt can only be wielded properly by players of level 130 or higher.\nIt weighs 110.00 oz.', 'Solar Axe'),
(134, 12, 8931, 1, 0, 0, 'item', 'You see the epiphany (Atk:50, Def:35 +3).\r\nIt can only be wielded properly by players of level 120 or higher.\r\nIt weighs 45.00 oz.', 'The Epiphany'),
(135, 13, 8932, 1, 0, 0, 'item', 'You see the calamity (Atk:51, Def:35).\r\nIt can only be wielded properly by knights of level 100 or higher.\r\nIt weighs 68.00 oz.', 'The Calamity');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `name_2` (`name`),
  ADD UNIQUE KEY `name_3` (`name`);

--
-- Indexes for table `account_bans`
--
ALTER TABLE `account_bans`
  ADD PRIMARY KEY (`account_id`),
  ADD KEY `banned_by` (`banned_by`);

--
-- Indexes for table `account_ban_history`
--
ALTER TABLE `account_ban_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `banned_by` (`banned_by`),
  ADD KEY `account_id_2` (`account_id`),
  ADD KEY `account_id_3` (`account_id`),
  ADD KEY `account_id_4` (`account_id`);

--
-- Indexes for table `account_viplist`
--
ALTER TABLE `account_viplist`
  ADD UNIQUE KEY `account_player_index` (`account_id`,`player_id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `player_id` (`player_id`);

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `global_storage`
--
ALTER TABLE `global_storage`
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `guilds`
--
ALTER TABLE `guilds`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `ownerid` (`ownerid`);

--
-- Indexes for table `guildwar_kills`
--
ALTER TABLE `guildwar_kills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `warid` (`warid`);

--
-- Indexes for table `guild_invites`
--
ALTER TABLE `guild_invites`
  ADD PRIMARY KEY (`player_id`,`guild_id`),
  ADD KEY `guild_id` (`guild_id`);

--
-- Indexes for table `guild_membership`
--
ALTER TABLE `guild_membership`
  ADD PRIMARY KEY (`player_id`),
  ADD KEY `guild_id` (`guild_id`),
  ADD KEY `rank_id` (`rank_id`);

--
-- Indexes for table `guild_ranks`
--
ALTER TABLE `guild_ranks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `guild_id` (`guild_id`);

--
-- Indexes for table `guild_wars`
--
ALTER TABLE `guild_wars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `guild1` (`guild1`),
  ADD KEY `guild2` (`guild2`);

--
-- Indexes for table `houses`
--
ALTER TABLE `houses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `owner` (`owner`),
  ADD KEY `town_id` (`town_id`);

--
-- Indexes for table `house_lists`
--
ALTER TABLE `house_lists`
  ADD KEY `house_id` (`house_id`);

--
-- Indexes for table `ip_bans`
--
ALTER TABLE `ip_bans`
  ADD PRIMARY KEY (`ip`),
  ADD KEY `banned_by` (`banned_by`);

--
-- Indexes for table `live_casts`
--
ALTER TABLE `live_casts`
  ADD UNIQUE KEY `player_id_2` (`player_id`);

--
-- Indexes for table `market_history`
--
ALTER TABLE `market_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `player_id` (`player_id`,`sale`);

--
-- Indexes for table `market_offers`
--
ALTER TABLE `market_offers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale` (`sale`,`itemtype`),
  ADD KEY `created` (`created`),
  ADD KEY `player_id` (`player_id`);

--
-- Indexes for table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `vocation` (`vocation`);

--
-- Indexes for table `players_online`
--
ALTER TABLE `players_online`
  ADD PRIMARY KEY (`player_id`);

--
-- Indexes for table `player_deaths`
--
ALTER TABLE `player_deaths`
  ADD KEY `player_id` (`player_id`),
  ADD KEY `killed_by` (`killed_by`),
  ADD KEY `mostdamage_by` (`mostdamage_by`);

--
-- Indexes for table `player_depotitems`
--
ALTER TABLE `player_depotitems`
  ADD UNIQUE KEY `player_id_2` (`player_id`,`sid`);

--
-- Indexes for table `player_inboxitems`
--
ALTER TABLE `player_inboxitems`
  ADD UNIQUE KEY `player_id_2` (`player_id`,`sid`);

--
-- Indexes for table `player_items`
--
ALTER TABLE `player_items`
  ADD KEY `player_id` (`player_id`),
  ADD KEY `sid` (`sid`);

--
-- Indexes for table `player_namelocks`
--
ALTER TABLE `player_namelocks`
  ADD PRIMARY KEY (`player_id`),
  ADD KEY `namelocked_by` (`namelocked_by`);

--
-- Indexes for table `player_rewards`
--
ALTER TABLE `player_rewards`
  ADD UNIQUE KEY `player_id_2` (`player_id`,`sid`);

--
-- Indexes for table `player_spells`
--
ALTER TABLE `player_spells`
  ADD KEY `player_id` (`player_id`);

--
-- Indexes for table `player_storage`
--
ALTER TABLE `player_storage`
  ADD PRIMARY KEY (`player_id`,`key`);

--
-- Indexes for table `server_config`
--
ALTER TABLE `server_config`
  ADD PRIMARY KEY (`config`);

--
-- Indexes for table `store_history`
--
ALTER TABLE `store_history`
  ADD KEY `account_id` (`account_id`);

--
-- Indexes for table `tile_store`
--
ALTER TABLE `tile_store`
  ADD KEY `house_id` (`house_id`);

--
-- Indexes for table `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `videos_categorias`
--
ALTER TABLE `videos_categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `videos_comentarios`
--
ALTER TABLE `videos_comentarios`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `z_forum`
--
ALTER TABLE `z_forum`
  ADD PRIMARY KEY (`id`),
  ADD KEY `section` (`section`);

--
-- Indexes for table `z_network_box`
--
ALTER TABLE `z_network_box`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `z_ots_comunication`
--
ALTER TABLE `z_ots_comunication`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `z_ots_guildcomunication`
--
ALTER TABLE `z_ots_guildcomunication`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `z_polls`
--
ALTER TABLE `z_polls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `z_shopguild_history_item`
--
ALTER TABLE `z_shopguild_history_item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `z_shopguild_history_pacc`
--
ALTER TABLE `z_shopguild_history_pacc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `z_shopguild_offer`
--
ALTER TABLE `z_shopguild_offer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `z_shop_history_item`
--
ALTER TABLE `z_shop_history_item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `z_shop_offer`
--
ALTER TABLE `z_shop_offer`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;
--
-- AUTO_INCREMENT for table `account_ban_history`
--
ALTER TABLE `account_ban_history`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `guilds`
--
ALTER TABLE `guilds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `guildwar_kills`
--
ALTER TABLE `guildwar_kills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `guild_ranks`
--
ALTER TABLE `guild_ranks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `guild_wars`
--
ALTER TABLE `guild_wars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `houses`
--
ALTER TABLE `houses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `market_history`
--
ALTER TABLE `market_history`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `market_offers`
--
ALTER TABLE `market_offers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `players`
--
ALTER TABLE `players`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=150;
--
-- AUTO_INCREMENT for table `videos`
--
ALTER TABLE `videos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `videos_categorias`
--
ALTER TABLE `videos_categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `videos_comentarios`
--
ALTER TABLE `videos_comentarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `z_forum`
--
ALTER TABLE `z_forum`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `z_network_box`
--
ALTER TABLE `z_network_box`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `z_ots_comunication`
--
ALTER TABLE `z_ots_comunication`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `z_ots_guildcomunication`
--
ALTER TABLE `z_ots_guildcomunication`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13382;
--
-- AUTO_INCREMENT for table `z_polls`
--
ALTER TABLE `z_polls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `z_shopguild_history_item`
--
ALTER TABLE `z_shopguild_history_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `z_shopguild_history_pacc`
--
ALTER TABLE `z_shopguild_history_pacc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `z_shopguild_offer`
--
ALTER TABLE `z_shopguild_offer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `z_shop_history_item`
--
ALTER TABLE `z_shop_history_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `z_shop_offer`
--
ALTER TABLE `z_shop_offer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `account_bans`
--
ALTER TABLE `account_bans`
  ADD CONSTRAINT `account_bans_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `account_bans_ibfk_2` FOREIGN KEY (`banned_by`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `account_ban_history`
--
ALTER TABLE `account_ban_history`
  ADD CONSTRAINT `account_ban_history_ibfk_2` FOREIGN KEY (`banned_by`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `account_ban_history_ibfk_3` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `account_ban_history_ibfk_4` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `account_ban_history_ibfk_5` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `account_viplist`
--
ALTER TABLE `account_viplist`
  ADD CONSTRAINT `account_viplist_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `account_viplist_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `guilds`
--
ALTER TABLE `guilds`
  ADD CONSTRAINT `guilds_ibfk_1` FOREIGN KEY (`ownerid`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `guildwar_kills`
--
ALTER TABLE `guildwar_kills`
  ADD CONSTRAINT `guildwar_kills_ibfk_1` FOREIGN KEY (`warid`) REFERENCES `guild_wars` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `guild_invites`
--
ALTER TABLE `guild_invites`
  ADD CONSTRAINT `guild_invites_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `guild_invites_ibfk_2` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `guild_membership`
--
ALTER TABLE `guild_membership`
  ADD CONSTRAINT `guild_membership_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `guild_membership_ibfk_2` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `guild_membership_ibfk_3` FOREIGN KEY (`rank_id`) REFERENCES `guild_ranks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `guild_ranks`
--
ALTER TABLE `guild_ranks`
  ADD CONSTRAINT `guild_ranks_ibfk_1` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `house_lists`
--
ALTER TABLE `house_lists`
  ADD CONSTRAINT `house_lists_ibfk_1` FOREIGN KEY (`house_id`) REFERENCES `houses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ip_bans`
--
ALTER TABLE `ip_bans`
  ADD CONSTRAINT `ip_bans_ibfk_1` FOREIGN KEY (`banned_by`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `live_casts`
--
ALTER TABLE `live_casts`
  ADD CONSTRAINT `live_casts_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `market_history`
--
ALTER TABLE `market_history`
  ADD CONSTRAINT `market_history_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `market_offers`
--
ALTER TABLE `market_offers`
  ADD CONSTRAINT `market_offers_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `players`
--
ALTER TABLE `players`
  ADD CONSTRAINT `players_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `player_deaths`
--
ALTER TABLE `player_deaths`
  ADD CONSTRAINT `player_deaths_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `player_depotitems`
--
ALTER TABLE `player_depotitems`
  ADD CONSTRAINT `player_depotitems_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `player_inboxitems`
--
ALTER TABLE `player_inboxitems`
  ADD CONSTRAINT `player_inboxitems_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `player_items`
--
ALTER TABLE `player_items`
  ADD CONSTRAINT `player_items_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `player_namelocks`
--
ALTER TABLE `player_namelocks`
  ADD CONSTRAINT `player_namelocks_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `player_namelocks_ibfk_2` FOREIGN KEY (`namelocked_by`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `player_rewards`
--
ALTER TABLE `player_rewards`
  ADD CONSTRAINT `player_rewards_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `player_spells`
--
ALTER TABLE `player_spells`
  ADD CONSTRAINT `player_spells_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `player_storage`
--
ALTER TABLE `player_storage`
  ADD CONSTRAINT `player_storage_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `store_history`
--
ALTER TABLE `store_history`
  ADD CONSTRAINT `store_history_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tile_store`
--
ALTER TABLE `tile_store`
  ADD CONSTRAINT `tile_store_ibfk_1` FOREIGN KEY (`house_id`) REFERENCES `houses` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
