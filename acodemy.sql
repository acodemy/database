-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.13 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL version:             7.0.0.4093
-- Date/time:                    2012-03-23 01:33:34
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;

-- Dumping database structure for acodemy
CREATE DATABASE IF NOT EXISTS `acodemy` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `acodemy`;


-- Dumping structure for table acodemy.codestyles
CREATE TABLE IF NOT EXISTS `codestyles` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `plang_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_codestyles_plangs` (`plang_id`),
  CONSTRAINT `FK_codestyles_plangs` FOREIGN KEY (`plang_id`) REFERENCES `plangs` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Codestyles';

-- Data exporting was unselected.


-- Dumping structure for table acodemy.codestyles_content
CREATE TABLE IF NOT EXISTS `codestyles_content` (
  `id` smallint(5) unsigned NOT NULL,
  `lang_id` char(2) NOT NULL,
  `html` text NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`id`,`lang_id`),
  KEY `id` (`id`),
  KEY `FK_codestyles_content_langs` (`lang_id`),
  CONSTRAINT `FK_codestyles_content_codestyles` FOREIGN KEY (`id`) REFERENCES `codestyles` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FK_codestyles_content_langs` FOREIGN KEY (`lang_id`) REFERENCES `langs` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Codestyles content';

-- Data exporting was unselected.


-- Dumping structure for table acodemy.langs
CREATE TABLE IF NOT EXISTS `langs` (
  `id` char(2) NOT NULL,
  `title` varchar(32) NOT NULL,
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Languages';

-- Data exporting was unselected.


-- Dumping structure for table acodemy.pages
CREATE TABLE IF NOT EXISTS `pages` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Pages';

-- Data exporting was unselected.


-- Dumping structure for table acodemy.pages_content
CREATE TABLE IF NOT EXISTS `pages_content` (
  `id` smallint(5) unsigned NOT NULL,
  `lang_id` char(2) NOT NULL,
  `title` varchar(255) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`id`,`lang_id`),
  KEY `lang` (`lang_id`),
  CONSTRAINT `lang` FOREIGN KEY (`lang_id`) REFERENCES `langs` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `page` FOREIGN KEY (`id`) REFERENCES `pages` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Pages content';

-- Data exporting was unselected.


-- Dumping structure for table acodemy.plangs
CREATE TABLE IF NOT EXISTS `plangs` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Programming languages';

-- Data exporting was unselected.
/*!40014 SET FOREIGN_KEY_CHECKS=1 */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
