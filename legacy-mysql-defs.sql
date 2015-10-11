-- MySQL dump 10.13  Distrib 5.6.26, for osx10.11 (x86_64)
--
-- Host: localhost    Database: legacy
-- ------------------------------------------------------
-- Server version	5.6.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accACTION`
--

DROP TABLE IF EXISTS `accACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accACTION` (
  `id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `allowedkeywords` varchar(255) DEFAULT NULL,
  `optional` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `accARGUMENT`
--

DROP TABLE IF EXISTS `accARGUMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accARGUMENT` (
  `id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `keyword` varchar(32) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `KEYVAL` (`keyword`,`value`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `accMAILCOOKIE`
--

DROP TABLE IF EXISTS `accMAILCOOKIE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accMAILCOOKIE` (
  `id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `data` blob NOT NULL,
  `expiration` datetime NOT NULL DEFAULT '9999-12-31 23:59:59',
  `kind` varchar(32) NOT NULL,
  `onetime` tinyint(1) NOT NULL DEFAULT '0',
  `status` char(1) NOT NULL DEFAULT 'W',
  PRIMARY KEY (`id`),
  KEY `expiration` (`expiration`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `accROLE`
--

DROP TABLE IF EXISTS `accROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accROLE` (
  `id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `firerole_def_ser` blob,
  `firerole_def_src` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `accROLE_accACTION_accARGUMENT`
--

DROP TABLE IF EXISTS `accROLE_accACTION_accARGUMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accROLE_accACTION_accARGUMENT` (
  `id_accROLE` int(15) DEFAULT NULL,
  `id_accACTION` int(15) DEFAULT NULL,
  `id_accARGUMENT` int(15) DEFAULT NULL,
  `argumentlistid` mediumint(8) DEFAULT NULL,
  KEY `id_accROLE` (`id_accROLE`),
  KEY `id_accACTION` (`id_accACTION`),
  KEY `id_accARGUMENT` (`id_accARGUMENT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aidCACHE`
--

DROP TABLE IF EXISTS `aidCACHE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aidCACHE` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `object_name` varchar(120) NOT NULL,
  `object_key` varchar(120) NOT NULL,
  `object_value` text,
  `last_updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name-b` (`object_name`),
  KEY `key-b` (`object_key`),
  KEY `last_updated-b` (`last_updated`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aidDENSEINDEX`
--

DROP TABLE IF EXISTS `aidDENSEINDEX`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aidDENSEINDEX` (
  `name_id` int(10) NOT NULL,
  `person_name` varchar(256) NOT NULL,
  `personids` longblob NOT NULL,
  PRIMARY KEY (`name_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aidINVERTEDLISTS`
--

DROP TABLE IF EXISTS `aidINVERTEDLISTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aidINVERTEDLISTS` (
  `qgram` varchar(4) NOT NULL,
  `inverted_list` longblob NOT NULL,
  `list_cardinality` int(10) NOT NULL,
  PRIMARY KEY (`qgram`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aidPERSONIDDATA`
--

DROP TABLE IF EXISTS `aidPERSONIDDATA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aidPERSONIDDATA` (
  `personid` bigint(16) unsigned NOT NULL,
  `tag` varchar(64) NOT NULL,
  `data` varchar(256) DEFAULT NULL,
  `datablob` longblob,
  `opt1` mediumint(8) DEFAULT NULL,
  `opt2` mediumint(8) DEFAULT NULL,
  `opt3` varchar(256) DEFAULT NULL,
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `personid-b` (`personid`),
  KEY `tag-b` (`tag`),
  KEY `data-b` (`data`),
  KEY `opt1` (`opt1`),
  KEY `timestamp-b` (`last_updated`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aidPERSONIDPAPERS`
--

DROP TABLE IF EXISTS `aidPERSONIDPAPERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aidPERSONIDPAPERS` (
  `personid` bigint(16) unsigned NOT NULL,
  `bibref_table` enum('100','700') NOT NULL,
  `bibref_value` mediumint(8) unsigned NOT NULL,
  `bibrec` mediumint(8) unsigned NOT NULL,
  `name` varchar(256) NOT NULL,
  `flag` smallint(2) NOT NULL DEFAULT '0',
  `lcul` smallint(2) NOT NULL DEFAULT '0',
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `personid-b` (`personid`),
  KEY `reftable-b` (`bibref_table`),
  KEY `refvalue-b` (`bibref_value`),
  KEY `rec-b` (`bibrec`),
  KEY `name-b` (`name`),
  KEY `pn-b` (`personid`,`name`),
  KEY `timestamp-b` (`last_updated`),
  KEY `flag-b` (`flag`),
  KEY `personid-flag-b` (`personid`,`flag`),
  KEY `ptvrf-b` (`personid`,`bibref_table`,`bibref_value`,`bibrec`,`flag`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aidRESULTS`
--

DROP TABLE IF EXISTS `aidRESULTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aidRESULTS` (
  `personid` varchar(256) NOT NULL,
  `bibref_table` enum('100','700') NOT NULL,
  `bibref_value` mediumint(8) unsigned NOT NULL,
  `bibrec` mediumint(8) unsigned NOT NULL,
  KEY `personid-b` (`personid`),
  KEY `reftable-b` (`bibref_table`),
  KEY `refvalue-b` (`bibref_value`),
  KEY `rec-b` (`bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aidUSERINPUTLOG`
--

DROP TABLE IF EXISTS `aidUSERINPUTLOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aidUSERINPUTLOG` (
  `id` bigint(15) NOT NULL AUTO_INCREMENT,
  `transactionid` bigint(15) NOT NULL,
  `timestamp` datetime NOT NULL,
  `userid` int(11) DEFAULT NULL,
  `userinfo` varchar(255) NOT NULL,
  `personid` bigint(15) NOT NULL,
  `action` varchar(50) NOT NULL,
  `tag` varchar(50) NOT NULL,
  `value` varchar(200) NOT NULL,
  `comment` text,
  PRIMARY KEY (`id`),
  KEY `transactionid-b` (`transactionid`),
  KEY `timestamp-b` (`timestamp`),
  KEY `userinfo-b` (`userinfo`),
  KEY `userid-b` (`userid`),
  KEY `personid-b` (`personid`),
  KEY `action-b` (`action`),
  KEY `tag-b` (`tag`),
  KEY `value-b` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aulAFFILIATIONS`
--

DROP TABLE IF EXISTS `aulAFFILIATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aulAFFILIATIONS` (
  `item` int(15) unsigned NOT NULL,
  `acronym` varchar(120) NOT NULL,
  `umbrella` varchar(120) NOT NULL,
  `name_and_address` varchar(255) NOT NULL,
  `domain` varchar(120) NOT NULL,
  `member` tinyint(1) NOT NULL,
  `spires_id` varchar(60) NOT NULL,
  `paper_id` int(15) unsigned NOT NULL,
  PRIMARY KEY (`item`,`paper_id`),
  KEY `item` (`item`),
  KEY `paper_id` (`paper_id`),
  KEY `acronym` (`acronym`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aulAUTHORS`
--

DROP TABLE IF EXISTS `aulAUTHORS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aulAUTHORS` (
  `item` int(15) unsigned NOT NULL,
  `family_name` varchar(255) NOT NULL,
  `given_name` varchar(255) NOT NULL,
  `name_on_paper` varchar(255) NOT NULL,
  `status` varchar(30) NOT NULL,
  `paper_id` int(15) unsigned NOT NULL,
  PRIMARY KEY (`item`,`paper_id`),
  KEY `item` (`item`),
  KEY `paper_id` (`paper_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aulAUTHOR_AFFILIATIONS`
--

DROP TABLE IF EXISTS `aulAUTHOR_AFFILIATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aulAUTHOR_AFFILIATIONS` (
  `item` int(15) unsigned NOT NULL,
  `affiliation_acronym` varchar(120) NOT NULL,
  `affiliation_status` varchar(120) NOT NULL,
  `author_item` int(15) unsigned NOT NULL,
  `paper_id` int(15) unsigned NOT NULL,
  PRIMARY KEY (`item`,`author_item`,`paper_id`),
  KEY `item` (`item`),
  KEY `author_item` (`author_item`),
  KEY `paper_id` (`paper_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aulAUTHOR_IDENTIFIERS`
--

DROP TABLE IF EXISTS `aulAUTHOR_IDENTIFIERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aulAUTHOR_IDENTIFIERS` (
  `item` int(15) unsigned NOT NULL,
  `identifier_number` varchar(120) NOT NULL,
  `identifier_name` varchar(120) NOT NULL,
  `author_item` int(15) unsigned NOT NULL,
  `paper_id` int(15) unsigned NOT NULL,
  PRIMARY KEY (`item`,`author_item`,`paper_id`),
  KEY `item` (`item`),
  KEY `author_item` (`author_item`),
  KEY `paper_id` (`paper_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aulPAPERS`
--

DROP TABLE IF EXISTS `aulPAPERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aulPAPERS` (
  `id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `id_user` int(15) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `collaboration` varchar(255) NOT NULL,
  `experiment_number` varchar(255) NOT NULL,
  `last_modified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_user` (`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `aulREFERENCES`
--

DROP TABLE IF EXISTS `aulREFERENCES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aulREFERENCES` (
  `item` int(15) unsigned NOT NULL,
  `reference` varchar(120) NOT NULL,
  `paper_id` int(15) unsigned NOT NULL,
  PRIMARY KEY (`item`,`paper_id`),
  KEY `item` (`item`),
  KEY `paper_id` (`paper_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib00x`
--

DROP TABLE IF EXISTS `bib00x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib00x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib01x`
--

DROP TABLE IF EXISTS `bib01x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib01x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib02x`
--

DROP TABLE IF EXISTS `bib02x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib02x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib03x`
--

DROP TABLE IF EXISTS `bib03x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib03x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM AUTO_INCREMENT=152 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib04x`
--

DROP TABLE IF EXISTS `bib04x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib04x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib05x`
--

DROP TABLE IF EXISTS `bib05x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib05x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib06x`
--

DROP TABLE IF EXISTS `bib06x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib06x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib07x`
--

DROP TABLE IF EXISTS `bib07x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib07x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib08x`
--

DROP TABLE IF EXISTS `bib08x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib08x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM AUTO_INCREMENT=95 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib09x`
--

DROP TABLE IF EXISTS `bib09x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib09x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib10x`
--

DROP TABLE IF EXISTS `bib10x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib10x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM AUTO_INCREMENT=183 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib11x`
--

DROP TABLE IF EXISTS `bib11x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib11x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib12x`
--

DROP TABLE IF EXISTS `bib12x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib12x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib13x`
--

DROP TABLE IF EXISTS `bib13x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib13x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib14x`
--

DROP TABLE IF EXISTS `bib14x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib14x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib15x`
--

DROP TABLE IF EXISTS `bib15x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib15x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib16x`
--

DROP TABLE IF EXISTS `bib16x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib16x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib17x`
--

DROP TABLE IF EXISTS `bib17x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib17x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib18x`
--

DROP TABLE IF EXISTS `bib18x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib18x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib19x`
--

DROP TABLE IF EXISTS `bib19x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib19x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib20x`
--

DROP TABLE IF EXISTS `bib20x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib20x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib21x`
--

DROP TABLE IF EXISTS `bib21x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib21x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib22x`
--

DROP TABLE IF EXISTS `bib22x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib22x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib23x`
--

DROP TABLE IF EXISTS `bib23x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib23x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib24x`
--

DROP TABLE IF EXISTS `bib24x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib24x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM AUTO_INCREMENT=133 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib25x`
--

DROP TABLE IF EXISTS `bib25x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib25x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib26x`
--

DROP TABLE IF EXISTS `bib26x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib26x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM AUTO_INCREMENT=162 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib27x`
--

DROP TABLE IF EXISTS `bib27x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib27x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib28x`
--

DROP TABLE IF EXISTS `bib28x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib28x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib29x`
--

DROP TABLE IF EXISTS `bib29x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib29x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib30x`
--

DROP TABLE IF EXISTS `bib30x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib30x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib31x`
--

DROP TABLE IF EXISTS `bib31x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib31x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib32x`
--

DROP TABLE IF EXISTS `bib32x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib32x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib33x`
--

DROP TABLE IF EXISTS `bib33x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib33x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib34x`
--

DROP TABLE IF EXISTS `bib34x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib34x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib35x`
--

DROP TABLE IF EXISTS `bib35x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib35x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib36x`
--

DROP TABLE IF EXISTS `bib36x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib36x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib37x`
--

DROP TABLE IF EXISTS `bib37x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib37x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib38x`
--

DROP TABLE IF EXISTS `bib38x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib38x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib39x`
--

DROP TABLE IF EXISTS `bib39x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib39x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib40x`
--

DROP TABLE IF EXISTS `bib40x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib40x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib41x`
--

DROP TABLE IF EXISTS `bib41x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib41x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib42x`
--

DROP TABLE IF EXISTS `bib42x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib42x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib43x`
--

DROP TABLE IF EXISTS `bib43x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib43x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib44x`
--

DROP TABLE IF EXISTS `bib44x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib44x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib45x`
--

DROP TABLE IF EXISTS `bib45x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib45x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib46x`
--

DROP TABLE IF EXISTS `bib46x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib46x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib47x`
--

DROP TABLE IF EXISTS `bib47x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib47x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib48x`
--

DROP TABLE IF EXISTS `bib48x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib48x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib49x`
--

DROP TABLE IF EXISTS `bib49x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib49x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib50x`
--

DROP TABLE IF EXISTS `bib50x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib50x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib51x`
--

DROP TABLE IF EXISTS `bib51x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib51x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib52x`
--

DROP TABLE IF EXISTS `bib52x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib52x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib53x`
--

DROP TABLE IF EXISTS `bib53x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib53x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib54x`
--

DROP TABLE IF EXISTS `bib54x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib54x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib55x`
--

DROP TABLE IF EXISTS `bib55x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib55x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib56x`
--

DROP TABLE IF EXISTS `bib56x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib56x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib57x`
--

DROP TABLE IF EXISTS `bib57x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib57x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib58x`
--

DROP TABLE IF EXISTS `bib58x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib58x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib59x`
--

DROP TABLE IF EXISTS `bib59x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib59x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib60x`
--

DROP TABLE IF EXISTS `bib60x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib60x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib61x`
--

DROP TABLE IF EXISTS `bib61x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib61x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib62x`
--

DROP TABLE IF EXISTS `bib62x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib62x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib63x`
--

DROP TABLE IF EXISTS `bib63x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib63x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib64x`
--

DROP TABLE IF EXISTS `bib64x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib64x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib65x`
--

DROP TABLE IF EXISTS `bib65x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib65x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM AUTO_INCREMENT=83 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib66x`
--

DROP TABLE IF EXISTS `bib66x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib66x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib67x`
--

DROP TABLE IF EXISTS `bib67x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib67x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib68x`
--

DROP TABLE IF EXISTS `bib68x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib68x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib69x`
--

DROP TABLE IF EXISTS `bib69x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib69x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib70x`
--

DROP TABLE IF EXISTS `bib70x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib70x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM AUTO_INCREMENT=571 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib71x`
--

DROP TABLE IF EXISTS `bib71x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib71x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib72x`
--

DROP TABLE IF EXISTS `bib72x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib72x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib73x`
--

DROP TABLE IF EXISTS `bib73x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib73x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib74x`
--

DROP TABLE IF EXISTS `bib74x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib74x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib75x`
--

DROP TABLE IF EXISTS `bib75x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib75x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib76x`
--

DROP TABLE IF EXISTS `bib76x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib76x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib77x`
--

DROP TABLE IF EXISTS `bib77x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib77x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib78x`
--

DROP TABLE IF EXISTS `bib78x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib78x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib79x`
--

DROP TABLE IF EXISTS `bib79x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib79x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib80x`
--

DROP TABLE IF EXISTS `bib80x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib80x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib81x`
--

DROP TABLE IF EXISTS `bib81x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib81x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib82x`
--

DROP TABLE IF EXISTS `bib82x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib82x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib83x`
--

DROP TABLE IF EXISTS `bib83x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib83x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib84x`
--

DROP TABLE IF EXISTS `bib84x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib84x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib85x`
--

DROP TABLE IF EXISTS `bib85x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib85x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(100))
) ENGINE=MyISAM AUTO_INCREMENT=425 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib86x`
--

DROP TABLE IF EXISTS `bib86x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib86x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib87x`
--

DROP TABLE IF EXISTS `bib87x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib87x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib88x`
--

DROP TABLE IF EXISTS `bib88x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib88x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib89x`
--

DROP TABLE IF EXISTS `bib89x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib89x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib90x`
--

DROP TABLE IF EXISTS `bib90x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib90x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM AUTO_INCREMENT=361 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib91x`
--

DROP TABLE IF EXISTS `bib91x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib91x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib92x`
--

DROP TABLE IF EXISTS `bib92x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib92x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib93x`
--

DROP TABLE IF EXISTS `bib93x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib93x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib94x`
--

DROP TABLE IF EXISTS `bib94x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib94x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib95x`
--

DROP TABLE IF EXISTS `bib95x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib95x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib96x`
--

DROP TABLE IF EXISTS `bib96x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib96x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM AUTO_INCREMENT=86 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib97x`
--

DROP TABLE IF EXISTS `bib97x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib97x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib98x`
--

DROP TABLE IF EXISTS `bib98x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib98x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bib99x`
--

DROP TABLE IF EXISTS `bib99x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bib99x` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(6) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kt` (`tag`),
  KEY `kv` (`value`(35))
) ENGINE=MyISAM AUTO_INCREMENT=5120 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibARXIVPDF`
--

DROP TABLE IF EXISTS `bibARXIVPDF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibARXIVPDF` (
  `id_bibrec` mediumint(8) unsigned NOT NULL,
  `status` enum('ok','missing') NOT NULL,
  `date_harvested` datetime NOT NULL,
  `version` tinyint(2) NOT NULL,
  PRIMARY KEY (`id_bibrec`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibEDITCACHE`
--

DROP TABLE IF EXISTS `bibEDITCACHE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibEDITCACHE` (
  `id_bibrec` mediumint(8) unsigned NOT NULL,
  `uid` int(15) unsigned NOT NULL,
  `data` longblob,
  `post_date` datetime NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_bibrec`,`uid`),
  KEY `post_date` (`post_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibHOLDINGPEN`
--

DROP TABLE IF EXISTS `bibHOLDINGPEN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibHOLDINGPEN` (
  `changeset_id` int(11) NOT NULL AUTO_INCREMENT,
  `changeset_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `changeset_xml` longblob NOT NULL,
  `oai_id` varchar(40) NOT NULL DEFAULT '',
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`changeset_id`),
  KEY `changeset_date` (`changeset_date`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibcheck_rules`
--

DROP TABLE IF EXISTS `bibcheck_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibcheck_rules` (
  `name` varchar(150) NOT NULL,
  `last_run` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibdoc`
--

DROP TABLE IF EXISTS `bibdoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibdoc` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `status` text NOT NULL,
  `docname` varchar(250) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `creation_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modification_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `text_extraction_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `doctype` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `docname` (`docname`),
  KEY `creation_date` (`creation_date`),
  KEY `modification_date` (`modification_date`)
) ENGINE=MyISAM AUTO_INCREMENT=107 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibdoc_bibdoc`
--

DROP TABLE IF EXISTS `bibdoc_bibdoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibdoc_bibdoc` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `id_bibdoc1` mediumint(9) unsigned DEFAULT NULL,
  `version1` tinyint(4) unsigned DEFAULT NULL,
  `format1` varchar(50) DEFAULT NULL,
  `id_bibdoc2` mediumint(9) unsigned DEFAULT NULL,
  `version2` tinyint(4) unsigned DEFAULT NULL,
  `format2` varchar(50) DEFAULT NULL,
  `rel_type` varchar(255) DEFAULT NULL,
  KEY `id_bibdoc1` (`id_bibdoc1`),
  KEY `id_bibdoc2` (`id_bibdoc2`),
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibdocfsinfo`
--

DROP TABLE IF EXISTS `bibdocfsinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibdocfsinfo` (
  `id_bibdoc` mediumint(9) unsigned NOT NULL,
  `version` tinyint(4) unsigned NOT NULL,
  `format` varchar(50) NOT NULL,
  `last_version` tinyint(1) NOT NULL,
  `cd` datetime NOT NULL,
  `md` datetime NOT NULL,
  `checksum` char(32) NOT NULL,
  `filesize` bigint(15) unsigned NOT NULL,
  `mime` varchar(100) NOT NULL,
  `master_format` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_bibdoc`,`version`,`format`),
  KEY `last_version` (`last_version`),
  KEY `format` (`format`),
  KEY `cd` (`cd`),
  KEY `md` (`md`),
  KEY `filesize` (`filesize`),
  KEY `mime` (`mime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibdocmoreinfo`
--

DROP TABLE IF EXISTS `bibdocmoreinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibdocmoreinfo` (
  `id_bibdoc` mediumint(9) unsigned DEFAULT NULL,
  `version` tinyint(4) unsigned DEFAULT NULL,
  `format` varchar(50) DEFAULT NULL,
  `id_rel` mediumint(9) unsigned DEFAULT NULL,
  `namespace` varchar(25) DEFAULT NULL,
  `data_key` varchar(25) DEFAULT NULL,
  `data_value` mediumblob,
  KEY `id_bibdoc` (`id_bibdoc`,`version`,`format`,`id_rel`,`namespace`,`data_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibfmt`
--

DROP TABLE IF EXISTS `bibfmt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibfmt` (
  `id_bibrec` int(8) unsigned NOT NULL DEFAULT '0',
  `format` varchar(10) NOT NULL DEFAULT '',
  `last_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `value` longblob,
  `needs_2nd_pass` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id_bibrec`,`format`),
  KEY `format` (`format`),
  KEY `last_updated` (`last_updated`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec`
--

DROP TABLE IF EXISTS `bibrec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `creation_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modification_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `master_format` varchar(16) NOT NULL DEFAULT 'marc',
  PRIMARY KEY (`id`),
  KEY `creation_date` (`creation_date`),
  KEY `modification_date` (`modification_date`)
) ENGINE=MyISAM AUTO_INCREMENT=142 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib00x`
--

DROP TABLE IF EXISTS `bibrec_bib00x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib00x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib01x`
--

DROP TABLE IF EXISTS `bibrec_bib01x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib01x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib02x`
--

DROP TABLE IF EXISTS `bibrec_bib02x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib02x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib03x`
--

DROP TABLE IF EXISTS `bibrec_bib03x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib03x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib04x`
--

DROP TABLE IF EXISTS `bibrec_bib04x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib04x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib05x`
--

DROP TABLE IF EXISTS `bibrec_bib05x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib05x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib06x`
--

DROP TABLE IF EXISTS `bibrec_bib06x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib06x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib07x`
--

DROP TABLE IF EXISTS `bibrec_bib07x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib07x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib08x`
--

DROP TABLE IF EXISTS `bibrec_bib08x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib08x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib09x`
--

DROP TABLE IF EXISTS `bibrec_bib09x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib09x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib10x`
--

DROP TABLE IF EXISTS `bibrec_bib10x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib10x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib11x`
--

DROP TABLE IF EXISTS `bibrec_bib11x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib11x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib12x`
--

DROP TABLE IF EXISTS `bibrec_bib12x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib12x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib13x`
--

DROP TABLE IF EXISTS `bibrec_bib13x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib13x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib14x`
--

DROP TABLE IF EXISTS `bibrec_bib14x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib14x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib15x`
--

DROP TABLE IF EXISTS `bibrec_bib15x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib15x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib16x`
--

DROP TABLE IF EXISTS `bibrec_bib16x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib16x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib17x`
--

DROP TABLE IF EXISTS `bibrec_bib17x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib17x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib18x`
--

DROP TABLE IF EXISTS `bibrec_bib18x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib18x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib19x`
--

DROP TABLE IF EXISTS `bibrec_bib19x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib19x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib20x`
--

DROP TABLE IF EXISTS `bibrec_bib20x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib20x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib21x`
--

DROP TABLE IF EXISTS `bibrec_bib21x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib21x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib22x`
--

DROP TABLE IF EXISTS `bibrec_bib22x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib22x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib23x`
--

DROP TABLE IF EXISTS `bibrec_bib23x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib23x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib24x`
--

DROP TABLE IF EXISTS `bibrec_bib24x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib24x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib25x`
--

DROP TABLE IF EXISTS `bibrec_bib25x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib25x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib26x`
--

DROP TABLE IF EXISTS `bibrec_bib26x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib26x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib27x`
--

DROP TABLE IF EXISTS `bibrec_bib27x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib27x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib28x`
--

DROP TABLE IF EXISTS `bibrec_bib28x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib28x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib29x`
--

DROP TABLE IF EXISTS `bibrec_bib29x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib29x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib30x`
--

DROP TABLE IF EXISTS `bibrec_bib30x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib30x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib31x`
--

DROP TABLE IF EXISTS `bibrec_bib31x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib31x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib32x`
--

DROP TABLE IF EXISTS `bibrec_bib32x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib32x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib33x`
--

DROP TABLE IF EXISTS `bibrec_bib33x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib33x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib34x`
--

DROP TABLE IF EXISTS `bibrec_bib34x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib34x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib35x`
--

DROP TABLE IF EXISTS `bibrec_bib35x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib35x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib36x`
--

DROP TABLE IF EXISTS `bibrec_bib36x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib36x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib37x`
--

DROP TABLE IF EXISTS `bibrec_bib37x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib37x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib38x`
--

DROP TABLE IF EXISTS `bibrec_bib38x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib38x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib39x`
--

DROP TABLE IF EXISTS `bibrec_bib39x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib39x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib40x`
--

DROP TABLE IF EXISTS `bibrec_bib40x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib40x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib41x`
--

DROP TABLE IF EXISTS `bibrec_bib41x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib41x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib42x`
--

DROP TABLE IF EXISTS `bibrec_bib42x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib42x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib43x`
--

DROP TABLE IF EXISTS `bibrec_bib43x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib43x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib44x`
--

DROP TABLE IF EXISTS `bibrec_bib44x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib44x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib45x`
--

DROP TABLE IF EXISTS `bibrec_bib45x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib45x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib46x`
--

DROP TABLE IF EXISTS `bibrec_bib46x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib46x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib47x`
--

DROP TABLE IF EXISTS `bibrec_bib47x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib47x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib48x`
--

DROP TABLE IF EXISTS `bibrec_bib48x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib48x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib49x`
--

DROP TABLE IF EXISTS `bibrec_bib49x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib49x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib50x`
--

DROP TABLE IF EXISTS `bibrec_bib50x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib50x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib51x`
--

DROP TABLE IF EXISTS `bibrec_bib51x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib51x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib52x`
--

DROP TABLE IF EXISTS `bibrec_bib52x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib52x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib53x`
--

DROP TABLE IF EXISTS `bibrec_bib53x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib53x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib54x`
--

DROP TABLE IF EXISTS `bibrec_bib54x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib54x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib55x`
--

DROP TABLE IF EXISTS `bibrec_bib55x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib55x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib56x`
--

DROP TABLE IF EXISTS `bibrec_bib56x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib56x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib57x`
--

DROP TABLE IF EXISTS `bibrec_bib57x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib57x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib58x`
--

DROP TABLE IF EXISTS `bibrec_bib58x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib58x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib59x`
--

DROP TABLE IF EXISTS `bibrec_bib59x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib59x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib60x`
--

DROP TABLE IF EXISTS `bibrec_bib60x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib60x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib61x`
--

DROP TABLE IF EXISTS `bibrec_bib61x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib61x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib62x`
--

DROP TABLE IF EXISTS `bibrec_bib62x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib62x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib63x`
--

DROP TABLE IF EXISTS `bibrec_bib63x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib63x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib64x`
--

DROP TABLE IF EXISTS `bibrec_bib64x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib64x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib65x`
--

DROP TABLE IF EXISTS `bibrec_bib65x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib65x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib66x`
--

DROP TABLE IF EXISTS `bibrec_bib66x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib66x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib67x`
--

DROP TABLE IF EXISTS `bibrec_bib67x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib67x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib68x`
--

DROP TABLE IF EXISTS `bibrec_bib68x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib68x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib69x`
--

DROP TABLE IF EXISTS `bibrec_bib69x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib69x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib70x`
--

DROP TABLE IF EXISTS `bibrec_bib70x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib70x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib71x`
--

DROP TABLE IF EXISTS `bibrec_bib71x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib71x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib72x`
--

DROP TABLE IF EXISTS `bibrec_bib72x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib72x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib73x`
--

DROP TABLE IF EXISTS `bibrec_bib73x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib73x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib74x`
--

DROP TABLE IF EXISTS `bibrec_bib74x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib74x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib75x`
--

DROP TABLE IF EXISTS `bibrec_bib75x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib75x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib76x`
--

DROP TABLE IF EXISTS `bibrec_bib76x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib76x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib77x`
--

DROP TABLE IF EXISTS `bibrec_bib77x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib77x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib78x`
--

DROP TABLE IF EXISTS `bibrec_bib78x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib78x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib79x`
--

DROP TABLE IF EXISTS `bibrec_bib79x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib79x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib80x`
--

DROP TABLE IF EXISTS `bibrec_bib80x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib80x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib81x`
--

DROP TABLE IF EXISTS `bibrec_bib81x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib81x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib82x`
--

DROP TABLE IF EXISTS `bibrec_bib82x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib82x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib83x`
--

DROP TABLE IF EXISTS `bibrec_bib83x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib83x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib84x`
--

DROP TABLE IF EXISTS `bibrec_bib84x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib84x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib85x`
--

DROP TABLE IF EXISTS `bibrec_bib85x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib85x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib86x`
--

DROP TABLE IF EXISTS `bibrec_bib86x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib86x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib87x`
--

DROP TABLE IF EXISTS `bibrec_bib87x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib87x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib88x`
--

DROP TABLE IF EXISTS `bibrec_bib88x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib88x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib89x`
--

DROP TABLE IF EXISTS `bibrec_bib89x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib89x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib90x`
--

DROP TABLE IF EXISTS `bibrec_bib90x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib90x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib91x`
--

DROP TABLE IF EXISTS `bibrec_bib91x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib91x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib92x`
--

DROP TABLE IF EXISTS `bibrec_bib92x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib92x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib93x`
--

DROP TABLE IF EXISTS `bibrec_bib93x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib93x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib94x`
--

DROP TABLE IF EXISTS `bibrec_bib94x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib94x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib95x`
--

DROP TABLE IF EXISTS `bibrec_bib95x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib95x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib96x`
--

DROP TABLE IF EXISTS `bibrec_bib96x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib96x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib97x`
--

DROP TABLE IF EXISTS `bibrec_bib97x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib97x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib98x`
--

DROP TABLE IF EXISTS `bibrec_bib98x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib98x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bib99x`
--

DROP TABLE IF EXISTS `bibrec_bib99x`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bib99x` (
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `id_bibxxx` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field_number` smallint(5) unsigned DEFAULT NULL,
  KEY `id_bibxxx` (`id_bibxxx`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bibrec_bibdoc`
--

DROP TABLE IF EXISTS `bibrec_bibdoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibrec_bibdoc` (
  `id_bibrec` mediumint(9) unsigned NOT NULL DEFAULT '0',
  `id_bibdoc` mediumint(9) unsigned NOT NULL DEFAULT '0',
  `docname` varchar(250) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'file',
  `type` varchar(255) DEFAULT NULL,
  KEY `docname` (`docname`),
  KEY `id_bibrec` (`id_bibrec`),
  KEY `id_bibdoc` (`id_bibdoc`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bskBASKET`
--

DROP TABLE IF EXISTS `bskBASKET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bskBASKET` (
  `id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `id_owner` int(15) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '',
  `date_modification` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `nb_views` int(15) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id_owner` (`id_owner`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bskEXTFMT`
--

DROP TABLE IF EXISTS `bskEXTFMT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bskEXTFMT` (
  `id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `id_bskEXTREC` int(15) unsigned NOT NULL DEFAULT '0',
  `format` varchar(10) NOT NULL DEFAULT '',
  `last_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `value` longblob,
  PRIMARY KEY (`id`),
  KEY `id_bskEXTREC` (`id_bskEXTREC`),
  KEY `format` (`format`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bskEXTREC`
--

DROP TABLE IF EXISTS `bskEXTREC`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bskEXTREC` (
  `id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `external_id` int(15) NOT NULL DEFAULT '0',
  `collection_id` int(15) unsigned NOT NULL DEFAULT '0',
  `original_url` text,
  `creation_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modification_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bskREC`
--

DROP TABLE IF EXISTS `bskREC`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bskREC` (
  `id_bibrec_or_bskEXTREC` int(16) NOT NULL DEFAULT '0',
  `id_bskBASKET` int(15) unsigned NOT NULL DEFAULT '0',
  `id_user_who_added_item` int(15) NOT NULL DEFAULT '0',
  `score` int(15) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id_bibrec_or_bskEXTREC`,`id_bskBASKET`),
  KEY `id_bibrec_or_bskEXTREC` (`id_bibrec_or_bskEXTREC`),
  KEY `id_bskBASKET` (`id_bskBASKET`),
  KEY `score` (`score`),
  KEY `date_added` (`date_added`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bskRECORDCOMMENT`
--

DROP TABLE IF EXISTS `bskRECORDCOMMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bskRECORDCOMMENT` (
  `id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `id_bibrec_or_bskEXTREC` int(16) NOT NULL DEFAULT '0',
  `id_bskBASKET` int(15) unsigned NOT NULL DEFAULT '0',
  `id_user` int(15) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  `date_creation` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `priority` int(15) NOT NULL DEFAULT '0',
  `in_reply_to_id_bskRECORDCOMMENT` int(15) unsigned NOT NULL DEFAULT '0',
  `reply_order_cached_data` blob,
  PRIMARY KEY (`id`),
  KEY `id_bskBASKET` (`id_bskBASKET`),
  KEY `id_bibrec_or_bskEXTREC` (`id_bibrec_or_bskEXTREC`),
  KEY `date_creation` (`date_creation`),
  KEY `in_reply_to_id_bskRECORDCOMMENT` (`in_reply_to_id_bskRECORDCOMMENT`),
  KEY `reply_order_cached_data` (`reply_order_cached_data`(40))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bsrMETHOD`
--

DROP TABLE IF EXISTS `bsrMETHOD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bsrMETHOD` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `definition` varchar(255) NOT NULL,
  `washer` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bsrMETHODDATA`
--

DROP TABLE IF EXISTS `bsrMETHODDATA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bsrMETHODDATA` (
  `id_bsrMETHOD` mediumint(8) unsigned NOT NULL,
  `data_dict` longblob,
  `data_dict_ordered` longblob,
  `data_list_sorted` longblob,
  `last_updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id_bsrMETHOD`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bsrMETHODDATABUCKET`
--

DROP TABLE IF EXISTS `bsrMETHODDATABUCKET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bsrMETHODDATABUCKET` (
  `id_bsrMETHOD` mediumint(8) unsigned NOT NULL,
  `bucket_no` tinyint(2) NOT NULL,
  `bucket_data` longblob,
  `bucket_last_value` varchar(255) DEFAULT NULL,
  `last_updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id_bsrMETHOD`,`bucket_no`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bsrMETHODNAME`
--

DROP TABLE IF EXISTS `bsrMETHODNAME`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bsrMETHODNAME` (
  `id_bsrMETHOD` mediumint(8) unsigned NOT NULL,
  `ln` char(5) NOT NULL DEFAULT '',
  `type` char(3) NOT NULL DEFAULT 'sn',
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id_bsrMETHOD`,`ln`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `clsMETHOD`
--

DROP TABLE IF EXISTS `clsMETHOD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clsMETHOD` (
  `id` mediumint(9) unsigned NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `location` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `last_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmtACTIONHISTORY`
--

DROP TABLE IF EXISTS `cmtACTIONHISTORY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmtACTIONHISTORY` (
  `id_cmtRECORDCOMMENT` int(15) unsigned DEFAULT NULL,
  `id_bibrec` int(15) unsigned DEFAULT NULL,
  `id_user` int(15) unsigned DEFAULT NULL,
  `client_host` int(10) unsigned DEFAULT NULL,
  `action_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `action_code` char(1) NOT NULL,
  KEY `id_cmtRECORDCOMMENT` (`id_cmtRECORDCOMMENT`),
  KEY `client_host` (`client_host`),
  KEY `id_user` (`id_user`),
  KEY `action_code` (`action_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmtCOLLAPSED`
--

DROP TABLE IF EXISTS `cmtCOLLAPSED`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmtCOLLAPSED` (
  `id_bibrec` int(15) unsigned NOT NULL DEFAULT '0',
  `id_cmtRECORDCOMMENT` int(15) unsigned NOT NULL DEFAULT '0',
  `id_user` int(15) unsigned NOT NULL,
  PRIMARY KEY (`id_user`,`id_bibrec`,`id_cmtRECORDCOMMENT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmtRECORDCOMMENT`
--

DROP TABLE IF EXISTS `cmtRECORDCOMMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmtRECORDCOMMENT` (
  `id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `id_bibrec` int(15) unsigned NOT NULL DEFAULT '0',
  `id_user` int(15) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  `date_creation` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `star_score` tinyint(5) unsigned NOT NULL DEFAULT '0',
  `nb_votes_yes` int(10) NOT NULL DEFAULT '0',
  `nb_votes_total` int(10) unsigned NOT NULL DEFAULT '0',
  `nb_abuse_reports` int(10) NOT NULL DEFAULT '0',
  `status` char(2) NOT NULL DEFAULT 'ok',
  `round_name` varchar(255) NOT NULL DEFAULT '',
  `restriction` varchar(50) NOT NULL DEFAULT '',
  `in_reply_to_id_cmtRECORDCOMMENT` int(15) unsigned NOT NULL DEFAULT '0',
  `reply_order_cached_data` blob,
  PRIMARY KEY (`id`),
  KEY `id_bibrec` (`id_bibrec`),
  KEY `id_user` (`id_user`),
  KEY `status` (`status`),
  KEY `in_reply_to_id_cmtRECORDCOMMENT` (`in_reply_to_id_cmtRECORDCOMMENT`),
  KEY `reply_order_cached_data` (`reply_order_cached_data`(40))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmtSUBSCRIPTION`
--

DROP TABLE IF EXISTS `cmtSUBSCRIPTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmtSUBSCRIPTION` (
  `id_bibrec` mediumint(8) unsigned NOT NULL,
  `id_user` int(15) unsigned NOT NULL,
  `creation_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  KEY `id_user` (`id_bibrec`,`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `collection`
--

DROP TABLE IF EXISTS `collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collection` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dbquery` text,
  `nbrecs` int(10) unsigned DEFAULT '0',
  `reclist` longblob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `dbquery` (`dbquery`(50))
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `collection_bsrMETHOD`
--

DROP TABLE IF EXISTS `collection_bsrMETHOD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collection_bsrMETHOD` (
  `id_collection` mediumint(9) unsigned NOT NULL,
  `id_bsrMETHOD` mediumint(9) unsigned NOT NULL,
  `score` tinyint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_collection`,`id_bsrMETHOD`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `collection_clsMETHOD`
--

DROP TABLE IF EXISTS `collection_clsMETHOD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collection_clsMETHOD` (
  `id_collection` mediumint(9) unsigned NOT NULL,
  `id_clsMETHOD` mediumint(9) unsigned NOT NULL,
  PRIMARY KEY (`id_collection`,`id_clsMETHOD`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `collection_collection`
--

DROP TABLE IF EXISTS `collection_collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collection_collection` (
  `id_dad` mediumint(9) unsigned NOT NULL,
  `id_son` mediumint(9) unsigned NOT NULL,
  `type` char(1) NOT NULL DEFAULT 'r',
  `score` tinyint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_dad`,`id_son`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `collection_example`
--

DROP TABLE IF EXISTS `collection_example`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collection_example` (
  `id_collection` mediumint(9) unsigned NOT NULL,
  `id_example` mediumint(9) unsigned NOT NULL,
  `score` tinyint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_collection`,`id_example`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `collection_externalcollection`
--

DROP TABLE IF EXISTS `collection_externalcollection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collection_externalcollection` (
  `id_collection` mediumint(9) unsigned NOT NULL DEFAULT '0',
  `id_externalcollection` mediumint(9) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_collection`,`id_externalcollection`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `collection_field_fieldvalue`
--

DROP TABLE IF EXISTS `collection_field_fieldvalue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collection_field_fieldvalue` (
  `id_collection` mediumint(9) unsigned NOT NULL,
  `id_field` mediumint(9) unsigned NOT NULL,
  `id_fieldvalue` mediumint(9) unsigned DEFAULT NULL,
  `type` char(3) NOT NULL DEFAULT 'src',
  `score` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `score_fieldvalue` tinyint(4) unsigned NOT NULL DEFAULT '0',
  KEY `id_collection` (`id_collection`),
  KEY `id_field` (`id_field`),
  KEY `id_fieldvalue` (`id_fieldvalue`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `collection_format`
--

DROP TABLE IF EXISTS `collection_format`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collection_format` (
  `id_collection` mediumint(9) unsigned NOT NULL,
  `id_format` mediumint(9) unsigned NOT NULL,
  `score` tinyint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_collection`,`id_format`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `collection_portalbox`
--

DROP TABLE IF EXISTS `collection_portalbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collection_portalbox` (
  `id_collection` mediumint(9) unsigned NOT NULL,
  `id_portalbox` mediumint(9) unsigned NOT NULL,
  `ln` char(5) NOT NULL DEFAULT '',
  `position` char(3) NOT NULL DEFAULT 'top',
  `score` tinyint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_collection`,`id_portalbox`,`ln`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `collection_rnkMETHOD`
--

DROP TABLE IF EXISTS `collection_rnkMETHOD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collection_rnkMETHOD` (
  `id_collection` mediumint(9) unsigned NOT NULL,
  `id_rnkMETHOD` mediumint(9) unsigned NOT NULL,
  `score` tinyint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_collection`,`id_rnkMETHOD`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `collectionboxname`
--

DROP TABLE IF EXISTS `collectionboxname`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collectionboxname` (
  `id_collection` mediumint(9) unsigned NOT NULL,
  `ln` char(5) NOT NULL DEFAULT '',
  `type` char(1) NOT NULL DEFAULT 'r',
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id_collection`,`ln`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `collectiondetailedrecordpagetabs`
--

DROP TABLE IF EXISTS `collectiondetailedrecordpagetabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collectiondetailedrecordpagetabs` (
  `id_collection` mediumint(9) unsigned NOT NULL,
  `tabs` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_collection`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `collectionname`
--

DROP TABLE IF EXISTS `collectionname`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collectionname` (
  `id_collection` mediumint(9) unsigned NOT NULL,
  `ln` char(5) NOT NULL DEFAULT '',
  `type` char(3) NOT NULL DEFAULT 'sn',
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id_collection`,`ln`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `crcBORROWER`
--

DROP TABLE IF EXISTS `crcBORROWER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crcBORROWER` (
  `id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `ccid` int(15) unsigned DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `phone` varchar(60) DEFAULT NULL,
  `address` varchar(60) DEFAULT NULL,
  `mailbox` varchar(30) DEFAULT NULL,
  `borrower_since` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `borrower_until` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `notes` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ccid` (`ccid`),
  KEY `name` (`name`),
  KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `crcILLREQUEST`
--

DROP TABLE IF EXISTS `crcILLREQUEST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crcILLREQUEST` (
  `id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `id_crcBORROWER` int(15) unsigned NOT NULL DEFAULT '0',
  `barcode` varchar(30) NOT NULL DEFAULT '',
  `period_of_interest_from` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `period_of_interest_to` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `id_crcLIBRARY` int(15) unsigned NOT NULL DEFAULT '0',
  `request_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `expected_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `arrival_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `due_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `return_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` varchar(20) NOT NULL DEFAULT '',
  `cost` varchar(30) NOT NULL DEFAULT '',
  `budget_code` varchar(60) NOT NULL DEFAULT '',
  `item_info` text,
  `request_type` text,
  `borrower_comments` text,
  `only_this_edition` varchar(10) NOT NULL DEFAULT '',
  `library_notes` text,
  `overdue_letter_number` int(3) unsigned NOT NULL DEFAULT '0',
  `overdue_letter_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `id_crcborrower` (`id_crcBORROWER`),
  KEY `id_crclibrary` (`id_crcLIBRARY`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `crcITEM`
--

DROP TABLE IF EXISTS `crcITEM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crcITEM` (
  `barcode` varchar(30) NOT NULL DEFAULT '',
  `id_bibrec` int(15) unsigned NOT NULL DEFAULT '0',
  `id_crcLIBRARY` int(15) unsigned NOT NULL DEFAULT '0',
  `collection` varchar(60) DEFAULT NULL,
  `location` varchar(60) DEFAULT NULL,
  `description` varchar(60) DEFAULT NULL,
  `loan_period` varchar(30) NOT NULL DEFAULT '',
  `status` varchar(20) NOT NULL DEFAULT '',
  `expected_arrival_date` varchar(60) NOT NULL DEFAULT '',
  `creation_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modification_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `number_of_requests` int(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`barcode`),
  KEY `id_bibrec` (`id_bibrec`),
  KEY `id_crclibrary` (`id_crcLIBRARY`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `crcLIBRARY`
--

DROP TABLE IF EXISTS `crcLIBRARY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crcLIBRARY` (
  `id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL DEFAULT '',
  `address` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `phone` varchar(30) NOT NULL DEFAULT '',
  `type` varchar(30) NOT NULL DEFAULT 'main',
  `notes` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `crcLOAN`
--

DROP TABLE IF EXISTS `crcLOAN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crcLOAN` (
  `id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `id_crcBORROWER` int(15) unsigned NOT NULL DEFAULT '0',
  `id_bibrec` int(15) unsigned NOT NULL DEFAULT '0',
  `barcode` varchar(30) NOT NULL DEFAULT '',
  `loaned_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `returned_on` date NOT NULL DEFAULT '0000-00-00',
  `due_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `number_of_renewals` int(3) unsigned NOT NULL DEFAULT '0',
  `overdue_letter_number` int(3) unsigned NOT NULL DEFAULT '0',
  `overdue_letter_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` varchar(20) NOT NULL DEFAULT '',
  `type` varchar(20) NOT NULL DEFAULT '',
  `notes` text,
  PRIMARY KEY (`id`),
  KEY `id_crcborrower` (`id_crcBORROWER`),
  KEY `id_bibrec` (`id_bibrec`),
  KEY `barcode` (`barcode`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `crcLOANREQUEST`
--

DROP TABLE IF EXISTS `crcLOANREQUEST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crcLOANREQUEST` (
  `id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `id_crcBORROWER` int(15) unsigned NOT NULL DEFAULT '0',
  `id_bibrec` int(15) unsigned NOT NULL DEFAULT '0',
  `barcode` varchar(30) NOT NULL DEFAULT '',
  `period_of_interest_from` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `period_of_interest_to` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` varchar(20) NOT NULL DEFAULT '',
  `notes` text,
  `request_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `id_crcborrower` (`id_crcBORROWER`),
  KEY `id_bibrec` (`id_bibrec`),
  KEY `barcode` (`barcode`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `crcPURCHASE`
--

DROP TABLE IF EXISTS `crcPURCHASE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crcPURCHASE` (
  `id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `id_bibrec` int(15) unsigned NOT NULL DEFAULT '0',
  `id_crcVENDOR` int(15) unsigned NOT NULL DEFAULT '0',
  `ordered_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `expected_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `price` varchar(20) NOT NULL DEFAULT '0',
  `status` varchar(20) NOT NULL DEFAULT '',
  `notes` text,
  PRIMARY KEY (`id`),
  KEY `id_bibrec` (`id_bibrec`),
  KEY `id_crcVENDOR` (`id_crcVENDOR`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `crcVENDOR`
--

DROP TABLE IF EXISTS `crcVENDOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crcVENDOR` (
  `id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL DEFAULT '',
  `address` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `phone` varchar(30) NOT NULL DEFAULT '',
  `notes` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `example`
--

DROP TABLE IF EXISTS `example`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `example` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `type` text NOT NULL,
  `body` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `expJOB`
--

DROP TABLE IF EXISTS `expJOB`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expJOB` (
  `id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `jobname` varchar(50) NOT NULL DEFAULT '',
  `jobfreq` mediumint(12) NOT NULL DEFAULT '0',
  `output_format` mediumint(12) NOT NULL DEFAULT '0',
  `deleted` mediumint(12) NOT NULL DEFAULT '0',
  `lastrun` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `output_directory` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `jobname` (`jobname`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `expJOBRESULT`
--

DROP TABLE IF EXISTS `expJOBRESULT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expJOBRESULT` (
  `id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `id_expJOB` int(15) NOT NULL,
  `execution_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` mediumint(12) NOT NULL DEFAULT '0',
  `status_message` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `expJOBRESULT_expQUERYRESULT`
--

DROP TABLE IF EXISTS `expJOBRESULT_expQUERYRESULT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expJOBRESULT_expQUERYRESULT` (
  `id_expJOBRESULT` int(15) NOT NULL,
  `id_expQUERYRESULT` int(15) NOT NULL,
  PRIMARY KEY (`id_expJOBRESULT`,`id_expQUERYRESULT`),
  KEY `id_expJOBRESULT` (`id_expJOBRESULT`),
  KEY `id_expQUERYRESULT` (`id_expQUERYRESULT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `expJOB_expQUERY`
--

DROP TABLE IF EXISTS `expJOB_expQUERY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expJOB_expQUERY` (
  `id_expJOB` int(15) NOT NULL,
  `id_expQUERY` int(15) NOT NULL,
  PRIMARY KEY (`id_expJOB`,`id_expQUERY`),
  KEY `id_expJOB` (`id_expJOB`),
  KEY `id_expQUERY` (`id_expQUERY`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `expQUERY`
--

DROP TABLE IF EXISTS `expQUERY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expQUERY` (
  `id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `search_criteria` text NOT NULL,
  `output_fields` text NOT NULL,
  `notes` text,
  `deleted` mediumint(12) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `expQUERYRESULT`
--

DROP TABLE IF EXISTS `expQUERYRESULT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expQUERYRESULT` (
  `id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `id_expQUERY` int(15) NOT NULL,
  `result` text NOT NULL,
  `status` mediumint(12) NOT NULL DEFAULT '0',
  `status_message` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `externalcollection`
--

DROP TABLE IF EXISTS `externalcollection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `externalcollection` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `field`
--

DROP TABLE IF EXISTS `field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `field_tag`
--

DROP TABLE IF EXISTS `field_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_tag` (
  `id_field` mediumint(9) unsigned NOT NULL,
  `id_tag` mediumint(9) unsigned NOT NULL,
  `score` tinyint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_field`,`id_tag`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldname`
--

DROP TABLE IF EXISTS `fieldname`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldname` (
  `id_field` mediumint(9) unsigned NOT NULL,
  `ln` char(5) NOT NULL DEFAULT '',
  `type` char(3) NOT NULL DEFAULT 'sn',
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id_field`,`ln`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldvalue`
--

DROP TABLE IF EXISTS `fieldvalue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldvalue` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `format`
--

DROP TABLE IF EXISTS `format`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `format` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(20) NOT NULL,
  `description` varchar(255) DEFAULT '',
  `content_type` varchar(255) DEFAULT '',
  `visibility` tinyint(4) NOT NULL DEFAULT '1',
  `last_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `formatname`
--

DROP TABLE IF EXISTS `formatname`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formatname` (
  `id_format` mediumint(9) unsigned NOT NULL,
  `ln` char(5) NOT NULL DEFAULT '',
  `type` char(3) NOT NULL DEFAULT 'sn',
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id_format`,`ln`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `goto`
--

DROP TABLE IF EXISTS `goto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goto` (
  `label` varchar(150) NOT NULL,
  `plugin` varchar(150) NOT NULL,
  `parameters` text NOT NULL,
  `creation_date` datetime NOT NULL,
  `modification_date` datetime NOT NULL,
  PRIMARY KEY (`label`),
  KEY `creation_date` (`creation_date`),
  KEY `modification_date` (`modification_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hstBATCHUPLOAD`
--

DROP TABLE IF EXISTS `hstBATCHUPLOAD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hstBATCHUPLOAD` (
  `id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `user` varchar(50) NOT NULL,
  `submitdate` datetime NOT NULL,
  `filename` varchar(255) NOT NULL,
  `execdate` datetime NOT NULL,
  `id_schTASK` int(15) unsigned NOT NULL,
  `batch_mode` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user` (`user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hstDOCUMENT`
--

DROP TABLE IF EXISTS `hstDOCUMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hstDOCUMENT` (
  `id_bibdoc` mediumint(9) unsigned NOT NULL,
  `docname` varchar(250) NOT NULL,
  `docformat` varchar(50) NOT NULL,
  `docversion` tinyint(4) unsigned NOT NULL,
  `docsize` bigint(15) unsigned NOT NULL,
  `docchecksum` char(32) NOT NULL,
  `doctimestamp` datetime NOT NULL,
  `action` varchar(50) NOT NULL,
  `job_id` mediumint(15) unsigned DEFAULT NULL,
  `job_name` varchar(255) DEFAULT NULL,
  `job_person` varchar(255) DEFAULT NULL,
  `job_date` datetime DEFAULT NULL,
  `job_details` blob,
  KEY `action` (`action`),
  KEY `id_bibdoc` (`id_bibdoc`),
  KEY `docname` (`docname`),
  KEY `docformat` (`docformat`),
  KEY `doctimestamp` (`doctimestamp`),
  KEY `job_id` (`job_id`),
  KEY `job_name` (`job_name`),
  KEY `job_person` (`job_person`),
  KEY `job_date` (`job_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hstEXCEPTION`
--

DROP TABLE IF EXISTS `hstEXCEPTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hstEXCEPTION` (
  `id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `line` int(9) DEFAULT NULL,
  `last_seen` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_notified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `counter` int(15) NOT NULL DEFAULT '0',
  `total` int(15) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`filename`,`line`),
  KEY `last_seen` (`last_seen`),
  KEY `last_notified` (`last_notified`),
  KEY `total` (`total`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hstRECORD`
--

DROP TABLE IF EXISTS `hstRECORD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hstRECORD` (
  `id_bibrec` mediumint(8) unsigned NOT NULL,
  `marcxml` longblob NOT NULL,
  `job_id` mediumint(15) unsigned NOT NULL,
  `job_name` varchar(255) NOT NULL,
  `job_person` varchar(255) NOT NULL,
  `job_date` datetime NOT NULL,
  `job_details` blob NOT NULL,
  `affected_fields` text NOT NULL,
  KEY `id_bibrec` (`id_bibrec`),
  KEY `job_id` (`job_id`),
  KEY `job_name` (`job_name`),
  KEY `job_person` (`job_person`),
  KEY `job_date` (`job_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hstTASK`
--

DROP TABLE IF EXISTS `hstTASK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hstTASK` (
  `id` int(15) unsigned NOT NULL,
  `proc` varchar(255) NOT NULL,
  `host` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(50) NOT NULL,
  `runtime` datetime NOT NULL,
  `sleeptime` varchar(20) DEFAULT NULL,
  `arguments` mediumblob,
  `status` varchar(50) DEFAULT NULL,
  `progress` varchar(255) DEFAULT NULL,
  `priority` tinyint(4) NOT NULL DEFAULT '0',
  `sequenceid` int(8) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `runtime` (`runtime`),
  KEY `priority` (`priority`),
  KEY `sequenceid` (`sequenceid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxINDEX`
--

DROP TABLE IF EXISTS `idxINDEX`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxINDEX` (
  `id` mediumint(9) unsigned NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `last_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `stemming_language` varchar(10) NOT NULL DEFAULT '',
  `indexer` varchar(10) NOT NULL DEFAULT 'native',
  `synonym_kbrs` varchar(255) NOT NULL DEFAULT '',
  `remove_stopwords` varchar(255) NOT NULL DEFAULT '',
  `remove_html_markup` varchar(10) NOT NULL DEFAULT '',
  `remove_latex_markup` varchar(10) NOT NULL DEFAULT '',
  `tokenizer` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxINDEXNAME`
--

DROP TABLE IF EXISTS `idxINDEXNAME`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxINDEXNAME` (
  `id_idxINDEX` mediumint(9) unsigned NOT NULL,
  `ln` char(5) NOT NULL DEFAULT '',
  `type` char(3) NOT NULL DEFAULT 'sn',
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id_idxINDEX`,`ln`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxINDEX_field`
--

DROP TABLE IF EXISTS `idxINDEX_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxINDEX_field` (
  `id_idxINDEX` mediumint(9) unsigned NOT NULL,
  `id_field` mediumint(9) unsigned NOT NULL,
  `regexp_punctuation` varchar(255) NOT NULL DEFAULT '[.,:;?!"]',
  `regexp_alphanumeric_separators` varchar(255) NOT NULL DEFAULT '[!"#$\\%&''()*+,-./:;<=>?@[\\]^\\_`{|}~]',
  PRIMARY KEY (`id_idxINDEX`,`id_field`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxINDEX_idxINDEX`
--

DROP TABLE IF EXISTS `idxINDEX_idxINDEX`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxINDEX_idxINDEX` (
  `id_virtual` mediumint(9) unsigned NOT NULL,
  `id_normal` mediumint(9) unsigned NOT NULL,
  PRIMARY KEY (`id_virtual`,`id_normal`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPAIR01F`
--

DROP TABLE IF EXISTS `idxPAIR01F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPAIR01F` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(100) DEFAULT NULL,
  `hitlist` longblob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `term` (`term`)
) ENGINE=MyISAM AUTO_INCREMENT=13438 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPAIR01Q`
--

DROP TABLE IF EXISTS `idxPAIR01Q`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPAIR01Q` (
  `id` mediumint(10) unsigned NOT NULL AUTO_INCREMENT,
  `runtime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `id_bibrec_low` mediumint(9) unsigned NOT NULL,
  `id_bibrec_high` mediumint(9) unsigned NOT NULL,
  `index_name` varchar(50) NOT NULL DEFAULT '',
  `mode` varchar(50) NOT NULL DEFAULT 'update',
  PRIMARY KEY (`id`),
  KEY `index_name` (`index_name`),
  KEY `runtime` (`runtime`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPAIR01R`
--

DROP TABLE IF EXISTS `idxPAIR01R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPAIR01R` (
  `id_bibrec` mediumint(9) unsigned NOT NULL,
  `termlist` longblob,
  `type` enum('CURRENT','FUTURE','TEMPORARY') NOT NULL DEFAULT 'CURRENT',
  PRIMARY KEY (`id_bibrec`,`type`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPAIR02F`
--

DROP TABLE IF EXISTS `idxPAIR02F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPAIR02F` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(100) DEFAULT NULL,
  `hitlist` longblob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `term` (`term`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPAIR02R`
--

DROP TABLE IF EXISTS `idxPAIR02R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPAIR02R` (
  `id_bibrec` mediumint(9) unsigned NOT NULL,
  `termlist` longblob,
  `type` enum('CURRENT','FUTURE','TEMPORARY') NOT NULL DEFAULT 'CURRENT',
  PRIMARY KEY (`id_bibrec`,`type`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPAIR03F`
--

DROP TABLE IF EXISTS `idxPAIR03F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPAIR03F` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(100) DEFAULT NULL,
  `hitlist` longblob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `term` (`term`)
) ENGINE=MyISAM AUTO_INCREMENT=9654 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPAIR03R`
--

DROP TABLE IF EXISTS `idxPAIR03R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPAIR03R` (
  `id_bibrec` mediumint(9) unsigned NOT NULL,
  `termlist` longblob,
  `type` enum('CURRENT','FUTURE','TEMPORARY') NOT NULL DEFAULT 'CURRENT',
  PRIMARY KEY (`id_bibrec`,`type`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPAIR04F`
--

DROP TABLE IF EXISTS `idxPAIR04F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPAIR04F` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(100) DEFAULT NULL,
  `hitlist` longblob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `term` (`term`)
) ENGINE=MyISAM AUTO_INCREMENT=812 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPAIR04R`
--

DROP TABLE IF EXISTS `idxPAIR04R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPAIR04R` (
  `id_bibrec` mediumint(9) unsigned NOT NULL,
  `termlist` longblob,
  `type` enum('CURRENT','FUTURE','TEMPORARY') NOT NULL DEFAULT 'CURRENT',
  PRIMARY KEY (`id_bibrec`,`type`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPAIR05F`
--

DROP TABLE IF EXISTS `idxPAIR05F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPAIR05F` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(100) DEFAULT NULL,
  `hitlist` longblob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `term` (`term`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPAIR05R`
--

DROP TABLE IF EXISTS `idxPAIR05R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPAIR05R` (
  `id_bibrec` mediumint(9) unsigned NOT NULL,
  `termlist` longblob,
  `type` enum('CURRENT','FUTURE','TEMPORARY') NOT NULL DEFAULT 'CURRENT',
  PRIMARY KEY (`id_bibrec`,`type`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPAIR06F`
--

DROP TABLE IF EXISTS `idxPAIR06F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPAIR06F` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(100) DEFAULT NULL,
  `hitlist` longblob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `term` (`term`)
) ENGINE=MyISAM AUTO_INCREMENT=12453 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPAIR06R`
--

DROP TABLE IF EXISTS `idxPAIR06R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPAIR06R` (
  `id_bibrec` mediumint(9) unsigned NOT NULL,
  `termlist` longblob,
  `type` enum('CURRENT','FUTURE','TEMPORARY') NOT NULL DEFAULT 'CURRENT',
  PRIMARY KEY (`id_bibrec`,`type`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPAIR07F`
--

DROP TABLE IF EXISTS `idxPAIR07F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPAIR07F` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(100) DEFAULT NULL,
  `hitlist` longblob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `term` (`term`)
) ENGINE=MyISAM AUTO_INCREMENT=246 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPAIR07R`
--

DROP TABLE IF EXISTS `idxPAIR07R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPAIR07R` (
  `id_bibrec` mediumint(9) unsigned NOT NULL,
  `termlist` longblob,
  `type` enum('CURRENT','FUTURE','TEMPORARY') NOT NULL DEFAULT 'CURRENT',
  PRIMARY KEY (`id_bibrec`,`type`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPAIR08F`
--

DROP TABLE IF EXISTS `idxPAIR08F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPAIR08F` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(100) DEFAULT NULL,
  `hitlist` longblob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `term` (`term`)
) ENGINE=MyISAM AUTO_INCREMENT=855 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPAIR08R`
--

DROP TABLE IF EXISTS `idxPAIR08R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPAIR08R` (
  `id_bibrec` mediumint(9) unsigned NOT NULL,
  `termlist` longblob,
  `type` enum('CURRENT','FUTURE','TEMPORARY') NOT NULL DEFAULT 'CURRENT',
  PRIMARY KEY (`id_bibrec`,`type`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPAIR09F`
--

DROP TABLE IF EXISTS `idxPAIR09F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPAIR09F` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(100) DEFAULT NULL,
  `hitlist` longblob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `term` (`term`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPAIR09R`
--

DROP TABLE IF EXISTS `idxPAIR09R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPAIR09R` (
  `id_bibrec` mediumint(9) unsigned NOT NULL,
  `termlist` longblob,
  `type` enum('CURRENT','FUTURE','TEMPORARY') NOT NULL DEFAULT 'CURRENT',
  PRIMARY KEY (`id_bibrec`,`type`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPAIR10F`
--

DROP TABLE IF EXISTS `idxPAIR10F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPAIR10F` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(100) DEFAULT NULL,
  `hitlist` longblob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `term` (`term`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPAIR10R`
--

DROP TABLE IF EXISTS `idxPAIR10R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPAIR10R` (
  `id_bibrec` mediumint(9) unsigned NOT NULL,
  `termlist` longblob,
  `type` enum('CURRENT','FUTURE','TEMPORARY') NOT NULL DEFAULT 'CURRENT',
  PRIMARY KEY (`id_bibrec`,`type`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPAIR11F`
--

DROP TABLE IF EXISTS `idxPAIR11F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPAIR11F` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(100) DEFAULT NULL,
  `hitlist` longblob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `term` (`term`)
) ENGINE=MyISAM AUTO_INCREMENT=135 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPAIR11R`
--

DROP TABLE IF EXISTS `idxPAIR11R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPAIR11R` (
  `id_bibrec` mediumint(9) unsigned NOT NULL,
  `termlist` longblob,
  `type` enum('CURRENT','FUTURE','TEMPORARY') NOT NULL DEFAULT 'CURRENT',
  PRIMARY KEY (`id_bibrec`,`type`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPAIR12F`
--

DROP TABLE IF EXISTS `idxPAIR12F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPAIR12F` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(100) DEFAULT NULL,
  `hitlist` longblob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `term` (`term`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPAIR12R`
--

DROP TABLE IF EXISTS `idxPAIR12R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPAIR12R` (
  `id_bibrec` mediumint(9) unsigned NOT NULL,
  `termlist` longblob,
  `type` enum('CURRENT','FUTURE','TEMPORARY') NOT NULL DEFAULT 'CURRENT',
  PRIMARY KEY (`id_bibrec`,`type`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPAIR13F`
--

DROP TABLE IF EXISTS `idxPAIR13F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPAIR13F` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(100) DEFAULT NULL,
  `hitlist` longblob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `term` (`term`)
) ENGINE=MyISAM AUTO_INCREMENT=118 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPAIR13R`
--

DROP TABLE IF EXISTS `idxPAIR13R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPAIR13R` (
  `id_bibrec` mediumint(9) unsigned NOT NULL,
  `termlist` longblob,
  `type` enum('CURRENT','FUTURE','TEMPORARY') NOT NULL DEFAULT 'CURRENT',
  PRIMARY KEY (`id_bibrec`,`type`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPAIR14F`
--

DROP TABLE IF EXISTS `idxPAIR14F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPAIR14F` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(100) DEFAULT NULL,
  `hitlist` longblob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `term` (`term`)
) ENGINE=MyISAM AUTO_INCREMENT=812 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPAIR14R`
--

DROP TABLE IF EXISTS `idxPAIR14R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPAIR14R` (
  `id_bibrec` mediumint(9) unsigned NOT NULL,
  `termlist` longblob,
  `type` enum('CURRENT','FUTURE','TEMPORARY') NOT NULL DEFAULT 'CURRENT',
  PRIMARY KEY (`id_bibrec`,`type`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPAIR15F`
--

DROP TABLE IF EXISTS `idxPAIR15F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPAIR15F` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(100) DEFAULT NULL,
  `hitlist` longblob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `term` (`term`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPAIR15R`
--

DROP TABLE IF EXISTS `idxPAIR15R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPAIR15R` (
  `id_bibrec` mediumint(9) unsigned NOT NULL,
  `termlist` longblob,
  `type` enum('CURRENT','FUTURE','TEMPORARY') NOT NULL DEFAULT 'CURRENT',
  PRIMARY KEY (`id_bibrec`,`type`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPAIR16F`
--

DROP TABLE IF EXISTS `idxPAIR16F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPAIR16F` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(100) DEFAULT NULL,
  `hitlist` longblob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `term` (`term`)
) ENGINE=MyISAM AUTO_INCREMENT=153 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPAIR16R`
--

DROP TABLE IF EXISTS `idxPAIR16R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPAIR16R` (
  `id_bibrec` mediumint(9) unsigned NOT NULL,
  `termlist` longblob,
  `type` enum('CURRENT','FUTURE','TEMPORARY') NOT NULL DEFAULT 'CURRENT',
  PRIMARY KEY (`id_bibrec`,`type`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPAIR17F`
--

DROP TABLE IF EXISTS `idxPAIR17F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPAIR17F` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(100) DEFAULT NULL,
  `hitlist` longblob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `term` (`term`)
) ENGINE=MyISAM AUTO_INCREMENT=153 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPAIR17R`
--

DROP TABLE IF EXISTS `idxPAIR17R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPAIR17R` (
  `id_bibrec` mediumint(9) unsigned NOT NULL,
  `termlist` longblob,
  `type` enum('CURRENT','FUTURE','TEMPORARY') NOT NULL DEFAULT 'CURRENT',
  PRIMARY KEY (`id_bibrec`,`type`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPAIR18F`
--

DROP TABLE IF EXISTS `idxPAIR18F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPAIR18F` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(100) DEFAULT NULL,
  `hitlist` longblob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `term` (`term`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPAIR18R`
--

DROP TABLE IF EXISTS `idxPAIR18R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPAIR18R` (
  `id_bibrec` mediumint(9) unsigned NOT NULL,
  `termlist` longblob,
  `type` enum('CURRENT','FUTURE','TEMPORARY') NOT NULL DEFAULT 'CURRENT',
  PRIMARY KEY (`id_bibrec`,`type`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPAIR19F`
--

DROP TABLE IF EXISTS `idxPAIR19F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPAIR19F` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(100) DEFAULT NULL,
  `hitlist` longblob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `term` (`term`)
) ENGINE=MyISAM AUTO_INCREMENT=859 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPAIR19R`
--

DROP TABLE IF EXISTS `idxPAIR19R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPAIR19R` (
  `id_bibrec` mediumint(9) unsigned NOT NULL,
  `termlist` longblob,
  `type` enum('CURRENT','FUTURE','TEMPORARY') NOT NULL DEFAULT 'CURRENT',
  PRIMARY KEY (`id_bibrec`,`type`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPAIR20F`
--

DROP TABLE IF EXISTS `idxPAIR20F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPAIR20F` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(100) DEFAULT NULL,
  `hitlist` longblob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `term` (`term`)
) ENGINE=MyISAM AUTO_INCREMENT=171 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPAIR20R`
--

DROP TABLE IF EXISTS `idxPAIR20R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPAIR20R` (
  `id_bibrec` mediumint(9) unsigned NOT NULL,
  `termlist` longblob,
  `type` enum('CURRENT','FUTURE','TEMPORARY') NOT NULL DEFAULT 'CURRENT',
  PRIMARY KEY (`id_bibrec`,`type`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPAIR21F`
--

DROP TABLE IF EXISTS `idxPAIR21F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPAIR21F` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(100) DEFAULT NULL,
  `hitlist` longblob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `term` (`term`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPAIR21R`
--

DROP TABLE IF EXISTS `idxPAIR21R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPAIR21R` (
  `id_bibrec` mediumint(9) unsigned NOT NULL,
  `termlist` longblob,
  `type` enum('CURRENT','FUTURE','TEMPORARY') NOT NULL DEFAULT 'CURRENT',
  PRIMARY KEY (`id_bibrec`,`type`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPAIR22F`
--

DROP TABLE IF EXISTS `idxPAIR22F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPAIR22F` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(100) DEFAULT NULL,
  `hitlist` longblob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `term` (`term`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPAIR22R`
--

DROP TABLE IF EXISTS `idxPAIR22R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPAIR22R` (
  `id_bibrec` mediumint(9) unsigned NOT NULL,
  `termlist` longblob,
  `type` enum('CURRENT','FUTURE','TEMPORARY') NOT NULL DEFAULT 'CURRENT',
  PRIMARY KEY (`id_bibrec`,`type`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPAIR23F`
--

DROP TABLE IF EXISTS `idxPAIR23F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPAIR23F` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(100) DEFAULT NULL,
  `hitlist` longblob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `term` (`term`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPAIR23R`
--

DROP TABLE IF EXISTS `idxPAIR23R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPAIR23R` (
  `id_bibrec` mediumint(9) unsigned NOT NULL,
  `termlist` longblob,
  `type` enum('CURRENT','FUTURE','TEMPORARY') NOT NULL DEFAULT 'CURRENT',
  PRIMARY KEY (`id_bibrec`,`type`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPAIR24F`
--

DROP TABLE IF EXISTS `idxPAIR24F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPAIR24F` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(100) DEFAULT NULL,
  `hitlist` longblob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `term` (`term`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPAIR24R`
--

DROP TABLE IF EXISTS `idxPAIR24R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPAIR24R` (
  `id_bibrec` mediumint(9) unsigned NOT NULL,
  `termlist` longblob,
  `type` enum('CURRENT','FUTURE','TEMPORARY') NOT NULL DEFAULT 'CURRENT',
  PRIMARY KEY (`id_bibrec`,`type`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPAIR25F`
--

DROP TABLE IF EXISTS `idxPAIR25F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPAIR25F` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(100) DEFAULT NULL,
  `hitlist` longblob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `term` (`term`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPAIR25R`
--

DROP TABLE IF EXISTS `idxPAIR25R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPAIR25R` (
  `id_bibrec` mediumint(9) unsigned NOT NULL,
  `termlist` longblob,
  `type` enum('CURRENT','FUTURE','TEMPORARY') NOT NULL DEFAULT 'CURRENT',
  PRIMARY KEY (`id_bibrec`,`type`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPAIR26F`
--

DROP TABLE IF EXISTS `idxPAIR26F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPAIR26F` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(100) DEFAULT NULL,
  `hitlist` longblob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `term` (`term`)
) ENGINE=MyISAM AUTO_INCREMENT=2475 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPAIR26R`
--

DROP TABLE IF EXISTS `idxPAIR26R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPAIR26R` (
  `id_bibrec` mediumint(9) unsigned NOT NULL,
  `termlist` longblob,
  `type` enum('CURRENT','FUTURE','TEMPORARY') NOT NULL DEFAULT 'CURRENT',
  PRIMARY KEY (`id_bibrec`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPAIR27F`
--

DROP TABLE IF EXISTS `idxPAIR27F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPAIR27F` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(100) DEFAULT NULL,
  `hitlist` longblob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `term` (`term`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPAIR27R`
--

DROP TABLE IF EXISTS `idxPAIR27R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPAIR27R` (
  `id_bibrec` mediumint(9) unsigned NOT NULL,
  `termlist` longblob,
  `type` enum('CURRENT','FUTURE','TEMPORARY') NOT NULL DEFAULT 'CURRENT',
  PRIMARY KEY (`id_bibrec`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPAIR28F`
--

DROP TABLE IF EXISTS `idxPAIR28F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPAIR28F` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(100) DEFAULT NULL,
  `hitlist` longblob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `term` (`term`)
) ENGINE=MyISAM AUTO_INCREMENT=350 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPAIR28R`
--

DROP TABLE IF EXISTS `idxPAIR28R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPAIR28R` (
  `id_bibrec` mediumint(9) unsigned NOT NULL,
  `termlist` longblob,
  `type` enum('CURRENT','FUTURE','TEMPORARY') NOT NULL DEFAULT 'CURRENT',
  PRIMARY KEY (`id_bibrec`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPHRASE01F`
--

DROP TABLE IF EXISTS `idxPHRASE01F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPHRASE01F` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `term` text,
  `hitlist` longblob,
  PRIMARY KEY (`id`),
  KEY `term` (`term`(50))
) ENGINE=MyISAM AUTO_INCREMENT=2412 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPHRASE01Q`
--

DROP TABLE IF EXISTS `idxPHRASE01Q`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPHRASE01Q` (
  `id` mediumint(10) unsigned NOT NULL AUTO_INCREMENT,
  `runtime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `id_bibrec_low` mediumint(9) unsigned NOT NULL,
  `id_bibrec_high` mediumint(9) unsigned NOT NULL,
  `index_name` varchar(50) NOT NULL DEFAULT '',
  `mode` varchar(50) NOT NULL DEFAULT 'update',
  PRIMARY KEY (`id`),
  KEY `index_name` (`index_name`),
  KEY `runtime` (`runtime`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPHRASE01R`
--

DROP TABLE IF EXISTS `idxPHRASE01R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPHRASE01R` (
  `id_bibrec` mediumint(9) unsigned NOT NULL,
  `termlist` longblob,
  `type` enum('CURRENT','FUTURE','TEMPORARY') NOT NULL DEFAULT 'CURRENT',
  PRIMARY KEY (`id_bibrec`,`type`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPHRASE02F`
--

DROP TABLE IF EXISTS `idxPHRASE02F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPHRASE02F` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `term` text,
  `hitlist` longblob,
  PRIMARY KEY (`id`),
  KEY `term` (`term`(50))
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPHRASE02R`
--

DROP TABLE IF EXISTS `idxPHRASE02R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPHRASE02R` (
  `id_bibrec` mediumint(9) unsigned NOT NULL,
  `termlist` longblob,
  `type` enum('CURRENT','FUTURE','TEMPORARY') NOT NULL DEFAULT 'CURRENT',
  PRIMARY KEY (`id_bibrec`,`type`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPHRASE03F`
--

DROP TABLE IF EXISTS `idxPHRASE03F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPHRASE03F` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `term` text,
  `hitlist` longblob,
  PRIMARY KEY (`id`),
  KEY `term` (`term`(50))
) ENGINE=MyISAM AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPHRASE03R`
--

DROP TABLE IF EXISTS `idxPHRASE03R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPHRASE03R` (
  `id_bibrec` mediumint(9) unsigned NOT NULL,
  `termlist` longblob,
  `type` enum('CURRENT','FUTURE','TEMPORARY') NOT NULL DEFAULT 'CURRENT',
  PRIMARY KEY (`id_bibrec`,`type`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPHRASE04F`
--

DROP TABLE IF EXISTS `idxPHRASE04F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPHRASE04F` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `term` text,
  `hitlist` longblob,
  PRIMARY KEY (`id`),
  KEY `term` (`term`(50))
) ENGINE=MyISAM AUTO_INCREMENT=2388 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPHRASE04R`
--

DROP TABLE IF EXISTS `idxPHRASE04R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPHRASE04R` (
  `id_bibrec` mediumint(9) unsigned NOT NULL,
  `termlist` longblob,
  `type` enum('CURRENT','FUTURE','TEMPORARY') NOT NULL DEFAULT 'CURRENT',
  PRIMARY KEY (`id_bibrec`,`type`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPHRASE05F`
--

DROP TABLE IF EXISTS `idxPHRASE05F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPHRASE05F` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `term` text,
  `hitlist` longblob,
  PRIMARY KEY (`id`),
  KEY `term` (`term`(50))
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPHRASE05R`
--

DROP TABLE IF EXISTS `idxPHRASE05R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPHRASE05R` (
  `id_bibrec` mediumint(9) unsigned NOT NULL,
  `termlist` longblob,
  `type` enum('CURRENT','FUTURE','TEMPORARY') NOT NULL DEFAULT 'CURRENT',
  PRIMARY KEY (`id_bibrec`,`type`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPHRASE06F`
--

DROP TABLE IF EXISTS `idxPHRASE06F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPHRASE06F` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `term` text,
  `hitlist` longblob,
  PRIMARY KEY (`id`),
  KEY `term` (`term`(50))
) ENGINE=MyISAM AUTO_INCREMENT=4928 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPHRASE06R`
--

DROP TABLE IF EXISTS `idxPHRASE06R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPHRASE06R` (
  `id_bibrec` mediumint(9) unsigned NOT NULL,
  `termlist` longblob,
  `type` enum('CURRENT','FUTURE','TEMPORARY') NOT NULL DEFAULT 'CURRENT',
  PRIMARY KEY (`id_bibrec`,`type`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPHRASE07F`
--

DROP TABLE IF EXISTS `idxPHRASE07F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPHRASE07F` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `term` text,
  `hitlist` longblob,
  PRIMARY KEY (`id`),
  KEY `term` (`term`(50))
) ENGINE=MyISAM AUTO_INCREMENT=139 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPHRASE07R`
--

DROP TABLE IF EXISTS `idxPHRASE07R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPHRASE07R` (
  `id_bibrec` mediumint(9) unsigned NOT NULL,
  `termlist` longblob,
  `type` enum('CURRENT','FUTURE','TEMPORARY') NOT NULL DEFAULT 'CURRENT',
  PRIMARY KEY (`id_bibrec`,`type`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPHRASE08F`
--

DROP TABLE IF EXISTS `idxPHRASE08F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPHRASE08F` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `term` text,
  `hitlist` longblob,
  PRIMARY KEY (`id`),
  KEY `term` (`term`(50))
) ENGINE=MyISAM AUTO_INCREMENT=131 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPHRASE08R`
--

DROP TABLE IF EXISTS `idxPHRASE08R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPHRASE08R` (
  `id_bibrec` mediumint(9) unsigned NOT NULL,
  `termlist` longblob,
  `type` enum('CURRENT','FUTURE','TEMPORARY') NOT NULL DEFAULT 'CURRENT',
  PRIMARY KEY (`id_bibrec`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPHRASE09F`
--

DROP TABLE IF EXISTS `idxPHRASE09F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPHRASE09F` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `term` text,
  `hitlist` longblob,
  PRIMARY KEY (`id`),
  KEY `term` (`term`(50))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPHRASE09R`
--

DROP TABLE IF EXISTS `idxPHRASE09R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPHRASE09R` (
  `id_bibrec` mediumint(9) unsigned NOT NULL,
  `termlist` longblob,
  `type` enum('CURRENT','FUTURE','TEMPORARY') NOT NULL DEFAULT 'CURRENT',
  PRIMARY KEY (`id_bibrec`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPHRASE10F`
--

DROP TABLE IF EXISTS `idxPHRASE10F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPHRASE10F` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `term` text,
  `hitlist` longblob,
  PRIMARY KEY (`id`),
  KEY `term` (`term`(50))
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPHRASE10R`
--

DROP TABLE IF EXISTS `idxPHRASE10R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPHRASE10R` (
  `id_bibrec` mediumint(9) unsigned NOT NULL,
  `termlist` longblob,
  `type` enum('CURRENT','FUTURE','TEMPORARY') NOT NULL DEFAULT 'CURRENT',
  PRIMARY KEY (`id_bibrec`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPHRASE11F`
--

DROP TABLE IF EXISTS `idxPHRASE11F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPHRASE11F` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `term` text,
  `hitlist` longblob,
  PRIMARY KEY (`id`),
  KEY `term` (`term`(50))
) ENGINE=MyISAM AUTO_INCREMENT=135 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPHRASE11R`
--

DROP TABLE IF EXISTS `idxPHRASE11R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPHRASE11R` (
  `id_bibrec` mediumint(9) unsigned NOT NULL,
  `termlist` longblob,
  `type` enum('CURRENT','FUTURE','TEMPORARY') NOT NULL DEFAULT 'CURRENT',
  PRIMARY KEY (`id_bibrec`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPHRASE12F`
--

DROP TABLE IF EXISTS `idxPHRASE12F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPHRASE12F` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `term` text,
  `hitlist` longblob,
  PRIMARY KEY (`id`),
  KEY `term` (`term`(50))
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPHRASE12R`
--

DROP TABLE IF EXISTS `idxPHRASE12R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPHRASE12R` (
  `id_bibrec` mediumint(9) unsigned NOT NULL,
  `termlist` longblob,
  `type` enum('CURRENT','FUTURE','TEMPORARY') NOT NULL DEFAULT 'CURRENT',
  PRIMARY KEY (`id_bibrec`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPHRASE13F`
--

DROP TABLE IF EXISTS `idxPHRASE13F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPHRASE13F` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `term` text,
  `hitlist` longblob,
  PRIMARY KEY (`id`),
  KEY `term` (`term`(50))
) ENGINE=MyISAM AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPHRASE13R`
--

DROP TABLE IF EXISTS `idxPHRASE13R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPHRASE13R` (
  `id_bibrec` mediumint(9) unsigned NOT NULL,
  `termlist` longblob,
  `type` enum('CURRENT','FUTURE','TEMPORARY') NOT NULL DEFAULT 'CURRENT',
  PRIMARY KEY (`id_bibrec`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPHRASE14F`
--

DROP TABLE IF EXISTS `idxPHRASE14F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPHRASE14F` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `term` text,
  `hitlist` longblob,
  PRIMARY KEY (`id`),
  KEY `term` (`term`(50))
) ENGINE=MyISAM AUTO_INCREMENT=649 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPHRASE14R`
--

DROP TABLE IF EXISTS `idxPHRASE14R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPHRASE14R` (
  `id_bibrec` mediumint(9) unsigned NOT NULL,
  `termlist` longblob,
  `type` enum('CURRENT','FUTURE','TEMPORARY') NOT NULL DEFAULT 'CURRENT',
  PRIMARY KEY (`id_bibrec`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPHRASE15F`
--

DROP TABLE IF EXISTS `idxPHRASE15F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPHRASE15F` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `term` text,
  `hitlist` longblob,
  PRIMARY KEY (`id`),
  KEY `term` (`term`(50))
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPHRASE15R`
--

DROP TABLE IF EXISTS `idxPHRASE15R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPHRASE15R` (
  `id_bibrec` mediumint(9) unsigned NOT NULL,
  `termlist` longblob,
  `type` enum('CURRENT','FUTURE','TEMPORARY') NOT NULL DEFAULT 'CURRENT',
  PRIMARY KEY (`id_bibrec`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPHRASE16F`
--

DROP TABLE IF EXISTS `idxPHRASE16F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPHRASE16F` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `term` text,
  `hitlist` longblob,
  PRIMARY KEY (`id`),
  KEY `term` (`term`(50))
) ENGINE=MyISAM AUTO_INCREMENT=661 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPHRASE16R`
--

DROP TABLE IF EXISTS `idxPHRASE16R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPHRASE16R` (
  `id_bibrec` mediumint(9) unsigned NOT NULL,
  `termlist` longblob,
  `type` enum('CURRENT','FUTURE','TEMPORARY') NOT NULL DEFAULT 'CURRENT',
  PRIMARY KEY (`id_bibrec`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPHRASE17F`
--

DROP TABLE IF EXISTS `idxPHRASE17F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPHRASE17F` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `term` text,
  `hitlist` longblob,
  PRIMARY KEY (`id`),
  KEY `term` (`term`(50))
) ENGINE=MyISAM AUTO_INCREMENT=110 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPHRASE17R`
--

DROP TABLE IF EXISTS `idxPHRASE17R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPHRASE17R` (
  `id_bibrec` mediumint(9) unsigned NOT NULL,
  `termlist` longblob,
  `type` enum('CURRENT','FUTURE','TEMPORARY') NOT NULL DEFAULT 'CURRENT',
  PRIMARY KEY (`id_bibrec`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPHRASE18F`
--

DROP TABLE IF EXISTS `idxPHRASE18F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPHRASE18F` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `term` text,
  `hitlist` longblob,
  PRIMARY KEY (`id`),
  KEY `term` (`term`(50))
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPHRASE18R`
--

DROP TABLE IF EXISTS `idxPHRASE18R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPHRASE18R` (
  `id_bibrec` mediumint(9) unsigned NOT NULL,
  `termlist` longblob,
  `type` enum('CURRENT','FUTURE','TEMPORARY') NOT NULL DEFAULT 'CURRENT',
  PRIMARY KEY (`id_bibrec`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPHRASE19F`
--

DROP TABLE IF EXISTS `idxPHRASE19F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPHRASE19F` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `term` text,
  `hitlist` longblob,
  PRIMARY KEY (`id`),
  KEY `term` (`term`(50))
) ENGINE=MyISAM AUTO_INCREMENT=131 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPHRASE19R`
--

DROP TABLE IF EXISTS `idxPHRASE19R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPHRASE19R` (
  `id_bibrec` mediumint(9) unsigned NOT NULL,
  `termlist` longblob,
  `type` enum('CURRENT','FUTURE','TEMPORARY') NOT NULL DEFAULT 'CURRENT',
  PRIMARY KEY (`id_bibrec`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPHRASE20F`
--

DROP TABLE IF EXISTS `idxPHRASE20F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPHRASE20F` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `term` text,
  `hitlist` longblob,
  PRIMARY KEY (`id`),
  KEY `term` (`term`(50))
) ENGINE=MyISAM AUTO_INCREMENT=849 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPHRASE20R`
--

DROP TABLE IF EXISTS `idxPHRASE20R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPHRASE20R` (
  `id_bibrec` mediumint(9) unsigned NOT NULL,
  `termlist` longblob,
  `type` enum('CURRENT','FUTURE','TEMPORARY') NOT NULL DEFAULT 'CURRENT',
  PRIMARY KEY (`id_bibrec`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPHRASE21F`
--

DROP TABLE IF EXISTS `idxPHRASE21F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPHRASE21F` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `term` text,
  `hitlist` longblob,
  PRIMARY KEY (`id`),
  KEY `term` (`term`(50))
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPHRASE21R`
--

DROP TABLE IF EXISTS `idxPHRASE21R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPHRASE21R` (
  `id_bibrec` mediumint(9) unsigned NOT NULL,
  `termlist` longblob,
  `type` enum('CURRENT','FUTURE','TEMPORARY') NOT NULL DEFAULT 'CURRENT',
  PRIMARY KEY (`id_bibrec`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPHRASE22F`
--

DROP TABLE IF EXISTS `idxPHRASE22F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPHRASE22F` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `term` text,
  `hitlist` longblob,
  PRIMARY KEY (`id`),
  KEY `term` (`term`(50))
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPHRASE22R`
--

DROP TABLE IF EXISTS `idxPHRASE22R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPHRASE22R` (
  `id_bibrec` mediumint(9) unsigned NOT NULL,
  `termlist` longblob,
  `type` enum('CURRENT','FUTURE','TEMPORARY') NOT NULL DEFAULT 'CURRENT',
  PRIMARY KEY (`id_bibrec`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPHRASE23F`
--

DROP TABLE IF EXISTS `idxPHRASE23F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPHRASE23F` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `term` text,
  `hitlist` longblob,
  PRIMARY KEY (`id`),
  KEY `term` (`term`(50))
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPHRASE23R`
--

DROP TABLE IF EXISTS `idxPHRASE23R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPHRASE23R` (
  `id_bibrec` mediumint(9) unsigned NOT NULL,
  `termlist` longblob,
  `type` enum('CURRENT','FUTURE','TEMPORARY') NOT NULL DEFAULT 'CURRENT',
  PRIMARY KEY (`id_bibrec`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPHRASE24F`
--

DROP TABLE IF EXISTS `idxPHRASE24F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPHRASE24F` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `term` text,
  `hitlist` longblob,
  PRIMARY KEY (`id`),
  KEY `term` (`term`(50))
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPHRASE24R`
--

DROP TABLE IF EXISTS `idxPHRASE24R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPHRASE24R` (
  `id_bibrec` mediumint(9) unsigned NOT NULL,
  `termlist` longblob,
  `type` enum('CURRENT','FUTURE','TEMPORARY') NOT NULL DEFAULT 'CURRENT',
  PRIMARY KEY (`id_bibrec`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPHRASE25F`
--

DROP TABLE IF EXISTS `idxPHRASE25F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPHRASE25F` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `term` text,
  `hitlist` longblob,
  PRIMARY KEY (`id`),
  KEY `term` (`term`(50))
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPHRASE25R`
--

DROP TABLE IF EXISTS `idxPHRASE25R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPHRASE25R` (
  `id_bibrec` mediumint(9) unsigned NOT NULL,
  `termlist` longblob,
  `type` enum('CURRENT','FUTURE','TEMPORARY') NOT NULL DEFAULT 'CURRENT',
  PRIMARY KEY (`id_bibrec`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPHRASE26F`
--

DROP TABLE IF EXISTS `idxPHRASE26F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPHRASE26F` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `term` text,
  `hitlist` longblob,
  PRIMARY KEY (`id`),
  KEY `term` (`term`(50))
) ENGINE=MyISAM AUTO_INCREMENT=1899 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPHRASE26R`
--

DROP TABLE IF EXISTS `idxPHRASE26R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPHRASE26R` (
  `id_bibrec` mediumint(9) unsigned NOT NULL,
  `termlist` longblob,
  `type` enum('CURRENT','FUTURE','TEMPORARY') NOT NULL DEFAULT 'CURRENT',
  PRIMARY KEY (`id_bibrec`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPHRASE27F`
--

DROP TABLE IF EXISTS `idxPHRASE27F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPHRASE27F` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `term` text,
  `hitlist` longblob,
  PRIMARY KEY (`id`),
  KEY `term` (`term`(50))
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPHRASE27R`
--

DROP TABLE IF EXISTS `idxPHRASE27R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPHRASE27R` (
  `id_bibrec` mediumint(9) unsigned NOT NULL,
  `termlist` longblob,
  `type` enum('CURRENT','FUTURE','TEMPORARY') NOT NULL DEFAULT 'CURRENT',
  PRIMARY KEY (`id_bibrec`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPHRASE28F`
--

DROP TABLE IF EXISTS `idxPHRASE28F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPHRASE28F` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `term` text,
  `hitlist` longblob,
  PRIMARY KEY (`id`),
  KEY `term` (`term`(50))
) ENGINE=MyISAM AUTO_INCREMENT=350 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxPHRASE28R`
--

DROP TABLE IF EXISTS `idxPHRASE28R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxPHRASE28R` (
  `id_bibrec` mediumint(9) unsigned NOT NULL,
  `termlist` longblob,
  `type` enum('CURRENT','FUTURE','TEMPORARY') NOT NULL DEFAULT 'CURRENT',
  PRIMARY KEY (`id_bibrec`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxWORD01F`
--

DROP TABLE IF EXISTS `idxWORD01F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxWORD01F` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(50) DEFAULT NULL,
  `hitlist` longblob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `term` (`term`)
) ENGINE=MyISAM AUTO_INCREMENT=6646 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxWORD01Q`
--

DROP TABLE IF EXISTS `idxWORD01Q`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxWORD01Q` (
  `id` mediumint(10) unsigned NOT NULL AUTO_INCREMENT,
  `runtime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `id_bibrec_low` mediumint(9) unsigned NOT NULL,
  `id_bibrec_high` mediumint(9) unsigned NOT NULL,
  `index_name` varchar(50) NOT NULL DEFAULT '',
  `mode` varchar(50) NOT NULL DEFAULT 'update',
  PRIMARY KEY (`id`),
  KEY `index_name` (`index_name`),
  KEY `runtime` (`runtime`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxWORD01R`
--

DROP TABLE IF EXISTS `idxWORD01R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxWORD01R` (
  `id_bibrec` mediumint(9) unsigned NOT NULL,
  `termlist` longblob,
  `type` enum('CURRENT','FUTURE','TEMPORARY') NOT NULL DEFAULT 'CURRENT',
  PRIMARY KEY (`id_bibrec`,`type`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxWORD02F`
--

DROP TABLE IF EXISTS `idxWORD02F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxWORD02F` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(50) DEFAULT NULL,
  `hitlist` longblob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `term` (`term`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxWORD02R`
--

DROP TABLE IF EXISTS `idxWORD02R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxWORD02R` (
  `id_bibrec` mediumint(9) unsigned NOT NULL,
  `termlist` longblob,
  `type` enum('CURRENT','FUTURE','TEMPORARY') NOT NULL DEFAULT 'CURRENT',
  PRIMARY KEY (`id_bibrec`,`type`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxWORD03F`
--

DROP TABLE IF EXISTS `idxWORD03F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxWORD03F` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(50) DEFAULT NULL,
  `hitlist` longblob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `term` (`term`)
) ENGINE=MyISAM AUTO_INCREMENT=3517 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxWORD03R`
--

DROP TABLE IF EXISTS `idxWORD03R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxWORD03R` (
  `id_bibrec` mediumint(9) unsigned NOT NULL,
  `termlist` longblob,
  `type` enum('CURRENT','FUTURE','TEMPORARY') NOT NULL DEFAULT 'CURRENT',
  PRIMARY KEY (`id_bibrec`,`type`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxWORD04F`
--

DROP TABLE IF EXISTS `idxWORD04F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxWORD04F` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(50) DEFAULT NULL,
  `hitlist` longblob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `term` (`term`)
) ENGINE=MyISAM AUTO_INCREMENT=723 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxWORD04R`
--

DROP TABLE IF EXISTS `idxWORD04R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxWORD04R` (
  `id_bibrec` mediumint(9) unsigned NOT NULL,
  `termlist` longblob,
  `type` enum('CURRENT','FUTURE','TEMPORARY') NOT NULL DEFAULT 'CURRENT',
  PRIMARY KEY (`id_bibrec`,`type`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxWORD05F`
--

DROP TABLE IF EXISTS `idxWORD05F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxWORD05F` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(50) DEFAULT NULL,
  `hitlist` longblob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `term` (`term`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxWORD05R`
--

DROP TABLE IF EXISTS `idxWORD05R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxWORD05R` (
  `id_bibrec` mediumint(9) unsigned NOT NULL,
  `termlist` longblob,
  `type` enum('CURRENT','FUTURE','TEMPORARY') NOT NULL DEFAULT 'CURRENT',
  PRIMARY KEY (`id_bibrec`,`type`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxWORD06F`
--

DROP TABLE IF EXISTS `idxWORD06F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxWORD06F` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(50) DEFAULT NULL,
  `hitlist` longblob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `term` (`term`)
) ENGINE=MyISAM AUTO_INCREMENT=7263 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxWORD06R`
--

DROP TABLE IF EXISTS `idxWORD06R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxWORD06R` (
  `id_bibrec` mediumint(9) unsigned NOT NULL,
  `termlist` longblob,
  `type` enum('CURRENT','FUTURE','TEMPORARY') NOT NULL DEFAULT 'CURRENT',
  PRIMARY KEY (`id_bibrec`,`type`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxWORD07F`
--

DROP TABLE IF EXISTS `idxWORD07F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxWORD07F` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(50) DEFAULT NULL,
  `hitlist` longblob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `term` (`term`)
) ENGINE=MyISAM AUTO_INCREMENT=375 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxWORD07R`
--

DROP TABLE IF EXISTS `idxWORD07R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxWORD07R` (
  `id_bibrec` mediumint(9) unsigned NOT NULL,
  `termlist` longblob,
  `type` enum('CURRENT','FUTURE','TEMPORARY') NOT NULL DEFAULT 'CURRENT',
  PRIMARY KEY (`id_bibrec`,`type`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxWORD08F`
--

DROP TABLE IF EXISTS `idxWORD08F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxWORD08F` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(50) DEFAULT NULL,
  `hitlist` longblob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `term` (`term`)
) ENGINE=MyISAM AUTO_INCREMENT=666 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxWORD08R`
--

DROP TABLE IF EXISTS `idxWORD08R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxWORD08R` (
  `id_bibrec` mediumint(9) unsigned NOT NULL,
  `termlist` longblob,
  `type` enum('CURRENT','FUTURE','TEMPORARY') NOT NULL DEFAULT 'CURRENT',
  PRIMARY KEY (`id_bibrec`,`type`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxWORD09F`
--

DROP TABLE IF EXISTS `idxWORD09F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxWORD09F` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(50) DEFAULT NULL,
  `hitlist` longblob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `term` (`term`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxWORD09R`
--

DROP TABLE IF EXISTS `idxWORD09R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxWORD09R` (
  `id_bibrec` mediumint(9) unsigned NOT NULL,
  `termlist` longblob,
  `type` enum('CURRENT','FUTURE','TEMPORARY') NOT NULL DEFAULT 'CURRENT',
  PRIMARY KEY (`id_bibrec`,`type`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxWORD10F`
--

DROP TABLE IF EXISTS `idxWORD10F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxWORD10F` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(50) DEFAULT NULL,
  `hitlist` longblob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `term` (`term`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxWORD10R`
--

DROP TABLE IF EXISTS `idxWORD10R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxWORD10R` (
  `id_bibrec` mediumint(9) unsigned NOT NULL,
  `termlist` longblob,
  `type` enum('CURRENT','FUTURE','TEMPORARY') NOT NULL DEFAULT 'CURRENT',
  PRIMARY KEY (`id_bibrec`,`type`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxWORD11F`
--

DROP TABLE IF EXISTS `idxWORD11F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxWORD11F` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(50) DEFAULT NULL,
  `hitlist` longblob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `term` (`term`)
) ENGINE=MyISAM AUTO_INCREMENT=135 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxWORD11R`
--

DROP TABLE IF EXISTS `idxWORD11R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxWORD11R` (
  `id_bibrec` mediumint(9) unsigned NOT NULL,
  `termlist` longblob,
  `type` enum('CURRENT','FUTURE','TEMPORARY') NOT NULL DEFAULT 'CURRENT',
  PRIMARY KEY (`id_bibrec`,`type`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxWORD12F`
--

DROP TABLE IF EXISTS `idxWORD12F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxWORD12F` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(50) DEFAULT NULL,
  `hitlist` longblob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `term` (`term`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxWORD12R`
--

DROP TABLE IF EXISTS `idxWORD12R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxWORD12R` (
  `id_bibrec` mediumint(9) unsigned NOT NULL,
  `termlist` longblob,
  `type` enum('CURRENT','FUTURE','TEMPORARY') NOT NULL DEFAULT 'CURRENT',
  PRIMARY KEY (`id_bibrec`,`type`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxWORD13F`
--

DROP TABLE IF EXISTS `idxWORD13F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxWORD13F` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(50) DEFAULT NULL,
  `hitlist` longblob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `term` (`term`)
) ENGINE=MyISAM AUTO_INCREMENT=127 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxWORD13R`
--

DROP TABLE IF EXISTS `idxWORD13R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxWORD13R` (
  `id_bibrec` mediumint(9) unsigned NOT NULL,
  `termlist` longblob,
  `type` enum('CURRENT','FUTURE','TEMPORARY') NOT NULL DEFAULT 'CURRENT',
  PRIMARY KEY (`id_bibrec`,`type`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxWORD14F`
--

DROP TABLE IF EXISTS `idxWORD14F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxWORD14F` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(50) DEFAULT NULL,
  `hitlist` longblob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `term` (`term`)
) ENGINE=MyISAM AUTO_INCREMENT=723 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxWORD14R`
--

DROP TABLE IF EXISTS `idxWORD14R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxWORD14R` (
  `id_bibrec` mediumint(9) unsigned NOT NULL,
  `termlist` longblob,
  `type` enum('CURRENT','FUTURE','TEMPORARY') NOT NULL DEFAULT 'CURRENT',
  PRIMARY KEY (`id_bibrec`,`type`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxWORD15F`
--

DROP TABLE IF EXISTS `idxWORD15F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxWORD15F` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(50) DEFAULT NULL,
  `hitlist` longblob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `term` (`term`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxWORD15R`
--

DROP TABLE IF EXISTS `idxWORD15R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxWORD15R` (
  `id_bibrec` mediumint(9) unsigned NOT NULL,
  `termlist` longblob,
  `type` enum('CURRENT','FUTURE','TEMPORARY') NOT NULL DEFAULT 'CURRENT',
  PRIMARY KEY (`id_bibrec`,`type`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxWORD16F`
--

DROP TABLE IF EXISTS `idxWORD16F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxWORD16F` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(50) DEFAULT NULL,
  `hitlist` longblob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `term` (`term`)
) ENGINE=MyISAM AUTO_INCREMENT=178 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxWORD16R`
--

DROP TABLE IF EXISTS `idxWORD16R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxWORD16R` (
  `id_bibrec` mediumint(9) unsigned NOT NULL,
  `termlist` longblob,
  `type` enum('CURRENT','FUTURE','TEMPORARY') NOT NULL DEFAULT 'CURRENT',
  PRIMARY KEY (`id_bibrec`,`type`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxWORD17F`
--

DROP TABLE IF EXISTS `idxWORD17F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxWORD17F` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(50) DEFAULT NULL,
  `hitlist` longblob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `term` (`term`)
) ENGINE=MyISAM AUTO_INCREMENT=178 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxWORD17R`
--

DROP TABLE IF EXISTS `idxWORD17R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxWORD17R` (
  `id_bibrec` mediumint(9) unsigned NOT NULL,
  `termlist` longblob,
  `type` enum('CURRENT','FUTURE','TEMPORARY') NOT NULL DEFAULT 'CURRENT',
  PRIMARY KEY (`id_bibrec`,`type`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxWORD18F`
--

DROP TABLE IF EXISTS `idxWORD18F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxWORD18F` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(50) DEFAULT NULL,
  `hitlist` longblob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `term` (`term`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxWORD18R`
--

DROP TABLE IF EXISTS `idxWORD18R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxWORD18R` (
  `id_bibrec` mediumint(9) unsigned NOT NULL,
  `termlist` longblob,
  `type` enum('CURRENT','FUTURE','TEMPORARY') NOT NULL DEFAULT 'CURRENT',
  PRIMARY KEY (`id_bibrec`,`type`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxWORD19F`
--

DROP TABLE IF EXISTS `idxWORD19F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxWORD19F` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(50) DEFAULT NULL,
  `hitlist` longblob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `term` (`term`)
) ENGINE=MyISAM AUTO_INCREMENT=708 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxWORD19R`
--

DROP TABLE IF EXISTS `idxWORD19R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxWORD19R` (
  `id_bibrec` mediumint(9) unsigned NOT NULL,
  `termlist` longblob,
  `type` enum('CURRENT','FUTURE','TEMPORARY') NOT NULL DEFAULT 'CURRENT',
  PRIMARY KEY (`id_bibrec`,`type`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxWORD20F`
--

DROP TABLE IF EXISTS `idxWORD20F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxWORD20F` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(50) DEFAULT NULL,
  `hitlist` longblob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `term` (`term`)
) ENGINE=MyISAM AUTO_INCREMENT=197 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxWORD20R`
--

DROP TABLE IF EXISTS `idxWORD20R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxWORD20R` (
  `id_bibrec` mediumint(9) unsigned NOT NULL,
  `termlist` longblob,
  `type` enum('CURRENT','FUTURE','TEMPORARY') NOT NULL DEFAULT 'CURRENT',
  PRIMARY KEY (`id_bibrec`,`type`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxWORD21F`
--

DROP TABLE IF EXISTS `idxWORD21F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxWORD21F` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(50) DEFAULT NULL,
  `hitlist` longblob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `term` (`term`)
) ENGINE=MyISAM AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxWORD21R`
--

DROP TABLE IF EXISTS `idxWORD21R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxWORD21R` (
  `id_bibrec` mediumint(9) unsigned NOT NULL,
  `termlist` longblob,
  `type` enum('CURRENT','FUTURE','TEMPORARY') NOT NULL DEFAULT 'CURRENT',
  PRIMARY KEY (`id_bibrec`,`type`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxWORD22F`
--

DROP TABLE IF EXISTS `idxWORD22F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxWORD22F` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(50) DEFAULT NULL,
  `hitlist` longblob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `term` (`term`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxWORD22R`
--

DROP TABLE IF EXISTS `idxWORD22R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxWORD22R` (
  `id_bibrec` mediumint(9) unsigned NOT NULL,
  `termlist` longblob,
  `type` enum('CURRENT','FUTURE','TEMPORARY') NOT NULL DEFAULT 'CURRENT',
  PRIMARY KEY (`id_bibrec`,`type`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxWORD23F`
--

DROP TABLE IF EXISTS `idxWORD23F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxWORD23F` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(50) DEFAULT NULL,
  `hitlist` longblob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `term` (`term`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxWORD23R`
--

DROP TABLE IF EXISTS `idxWORD23R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxWORD23R` (
  `id_bibrec` mediumint(9) unsigned NOT NULL,
  `termlist` longblob,
  `type` enum('CURRENT','FUTURE','TEMPORARY') NOT NULL DEFAULT 'CURRENT',
  PRIMARY KEY (`id_bibrec`,`type`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxWORD24F`
--

DROP TABLE IF EXISTS `idxWORD24F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxWORD24F` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(50) DEFAULT NULL,
  `hitlist` longblob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `term` (`term`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxWORD24R`
--

DROP TABLE IF EXISTS `idxWORD24R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxWORD24R` (
  `id_bibrec` mediumint(9) unsigned NOT NULL,
  `termlist` longblob,
  `type` enum('CURRENT','FUTURE','TEMPORARY') NOT NULL DEFAULT 'CURRENT',
  PRIMARY KEY (`id_bibrec`,`type`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxWORD25F`
--

DROP TABLE IF EXISTS `idxWORD25F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxWORD25F` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(50) DEFAULT NULL,
  `hitlist` longblob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `term` (`term`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxWORD25R`
--

DROP TABLE IF EXISTS `idxWORD25R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxWORD25R` (
  `id_bibrec` mediumint(9) unsigned NOT NULL,
  `termlist` longblob,
  `type` enum('CURRENT','FUTURE','TEMPORARY') NOT NULL DEFAULT 'CURRENT',
  PRIMARY KEY (`id_bibrec`,`type`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxWORD26F`
--

DROP TABLE IF EXISTS `idxWORD26F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxWORD26F` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(50) DEFAULT NULL,
  `hitlist` longblob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `term` (`term`)
) ENGINE=MyISAM AUTO_INCREMENT=2726 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxWORD26R`
--

DROP TABLE IF EXISTS `idxWORD26R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxWORD26R` (
  `id_bibrec` mediumint(9) unsigned NOT NULL,
  `termlist` longblob,
  `type` enum('CURRENT','FUTURE','TEMPORARY') NOT NULL DEFAULT 'CURRENT',
  PRIMARY KEY (`id_bibrec`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxWORD27F`
--

DROP TABLE IF EXISTS `idxWORD27F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxWORD27F` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(50) DEFAULT NULL,
  `hitlist` longblob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `term` (`term`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxWORD27R`
--

DROP TABLE IF EXISTS `idxWORD27R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxWORD27R` (
  `id_bibrec` mediumint(9) unsigned NOT NULL,
  `termlist` longblob,
  `type` enum('CURRENT','FUTURE','TEMPORARY') NOT NULL DEFAULT 'CURRENT',
  PRIMARY KEY (`id_bibrec`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxWORD28F`
--

DROP TABLE IF EXISTS `idxWORD28F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxWORD28F` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(50) DEFAULT NULL,
  `hitlist` longblob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `term` (`term`)
) ENGINE=MyISAM AUTO_INCREMENT=350 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idxWORD28R`
--

DROP TABLE IF EXISTS `idxWORD28R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idxWORD28R` (
  `id_bibrec` mediumint(9) unsigned NOT NULL,
  `termlist` longblob,
  `type` enum('CURRENT','FUTURE','TEMPORARY') NOT NULL DEFAULT 'CURRENT',
  PRIMARY KEY (`id_bibrec`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jrnISSUE`
--

DROP TABLE IF EXISTS `jrnISSUE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jrnISSUE` (
  `id_jrnJOURNAL` mediumint(9) unsigned NOT NULL,
  `issue_number` varchar(50) NOT NULL DEFAULT '',
  `issue_display` varchar(50) NOT NULL DEFAULT '',
  `date_released` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_announced` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id_jrnJOURNAL`,`issue_number`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `jrnJOURNAL`
--

DROP TABLE IF EXISTS `jrnJOURNAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jrnJOURNAL` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `knwKB`
--

DROP TABLE IF EXISTS `knwKB`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `knwKB` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT '',
  `description` text,
  `kbtype` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `knwKBDDEF`
--

DROP TABLE IF EXISTS `knwKBDDEF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `knwKBDDEF` (
  `id_knwKB` mediumint(8) unsigned NOT NULL,
  `id_collection` mediumint(9) DEFAULT NULL,
  `output_tag` text,
  `search_expression` text,
  PRIMARY KEY (`id_knwKB`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `knwKBRVAL`
--

DROP TABLE IF EXISTS `knwKBRVAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `knwKBRVAL` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `m_key` varchar(255) NOT NULL DEFAULT '',
  `m_value` text NOT NULL,
  `id_knwKB` mediumint(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id_knwKB` (`id_knwKB`),
  KEY `m_key` (`m_key`(30)),
  KEY `m_value` (`m_value`(30))
) ENGINE=MyISAM AUTO_INCREMENT=358 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lnkADMINURL`
--

DROP TABLE IF EXISTS `lnkADMINURL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lnkADMINURL` (
  `id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(100) NOT NULL,
  `list` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `url` (`url`),
  KEY `list` (`list`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lnkADMINURLLOG`
--

DROP TABLE IF EXISTS `lnkADMINURLLOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lnkADMINURLLOG` (
  `id_lnkADMINURL` int(15) unsigned NOT NULL,
  `id_lnkLOG` int(15) unsigned NOT NULL,
  KEY `id_lnkADMINURL` (`id_lnkADMINURL`),
  KEY `id_lnkLOG` (`id_lnkLOG`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lnkENTRY`
--

DROP TABLE IF EXISTS `lnkENTRY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lnkENTRY` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `origin_url` varchar(100) NOT NULL,
  `id_bibrec` mediumint(8) unsigned NOT NULL,
  `additional_properties` longblob,
  `type` varchar(30) NOT NULL,
  `status` varchar(30) NOT NULL DEFAULT 'PENDING',
  `insert_time` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `id_bibrec` (`id_bibrec`),
  KEY `type` (`type`),
  KEY `status` (`status`),
  KEY `insert_time` (`insert_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lnkENTRYLOG`
--

DROP TABLE IF EXISTS `lnkENTRYLOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lnkENTRYLOG` (
  `id_lnkENTRY` int(15) unsigned NOT NULL,
  `id_lnkLOG` int(15) unsigned NOT NULL,
  KEY `id_lnkENTRY` (`id_lnkENTRY`),
  KEY `id_lnkLOG` (`id_lnkLOG`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lnkENTRYURLTITLE`
--

DROP TABLE IF EXISTS `lnkENTRYURLTITLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lnkENTRYURLTITLE` (
  `id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `manual_set` tinyint(1) NOT NULL DEFAULT '0',
  `broken_count` int(5) DEFAULT '0',
  `broken` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `url` (`url`),
  KEY `title` (`title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lnkLOG`
--

DROP TABLE IF EXISTS `lnkLOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lnkLOG` (
  `id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `id_user` int(15) unsigned DEFAULT NULL,
  `action` varchar(30) NOT NULL,
  `log_time` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `id_user` (`id_user`),
  KEY `action` (`action`),
  KEY `log_time` (`log_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `msgMESSAGE`
--

DROP TABLE IF EXISTS `msgMESSAGE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msgMESSAGE` (
  `id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `id_user_from` int(15) unsigned NOT NULL DEFAULT '0',
  `sent_to_user_nicks` text NOT NULL,
  `sent_to_group_names` text NOT NULL,
  `subject` text NOT NULL,
  `body` text,
  `sent_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `received_date` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `id_user_from` (`id_user_from`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oaiHARVEST`
--

DROP TABLE IF EXISTS `oaiHARVEST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oaiHARVEST` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `baseurl` varchar(255) NOT NULL DEFAULT '',
  `metadataprefix` varchar(255) NOT NULL DEFAULT 'oai_dc',
  `arguments` blob,
  `comment` text,
  `name` varchar(255) NOT NULL,
  `lastrun` datetime DEFAULT NULL,
  `frequency` mediumint(12) NOT NULL DEFAULT '0',
  `postprocess` varchar(20) NOT NULL DEFAULT 'h',
  `setspecs` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oaiHARVESTLOG`
--

DROP TABLE IF EXISTS `oaiHARVESTLOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oaiHARVESTLOG` (
  `id_oaiHARVEST` mediumint(9) unsigned NOT NULL,
  `id_bibrec` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `bibupload_task_id` int(11) NOT NULL DEFAULT '0',
  `oai_id` varchar(40) NOT NULL DEFAULT '',
  `date_harvested` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_inserted` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `inserted_to_db` char(1) NOT NULL DEFAULT 'P',
  PRIMARY KEY (`bibupload_task_id`,`oai_id`,`date_harvested`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oaiREPOSITORY`
--

DROP TABLE IF EXISTS `oaiREPOSITORY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oaiREPOSITORY` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `setName` varchar(255) NOT NULL DEFAULT '',
  `setSpec` varchar(255) NOT NULL DEFAULT 'GLOBAL_SET',
  `setCollection` varchar(255) NOT NULL DEFAULT '',
  `setDescription` text NOT NULL,
  `setDefinition` text NOT NULL,
  `setRecList` longblob,
  `last_updated` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `p1` text NOT NULL,
  `f1` text NOT NULL,
  `m1` text NOT NULL,
  `p2` text NOT NULL,
  `f2` text NOT NULL,
  `m2` text NOT NULL,
  `p3` text NOT NULL,
  `f3` text NOT NULL,
  `m3` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oauth1_storage`
--

DROP TABLE IF EXISTS `oauth1_storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth1_storage` (
  `token` varchar(255) NOT NULL,
  `secret` varchar(255) NOT NULL,
  `date_creation` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `portalbox`
--

DROP TABLE IF EXISTS `portalbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portalbox` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `body` text NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=98 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `publreq`
--

DROP TABLE IF EXISTS `publreq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publreq` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `host` varchar(255) NOT NULL DEFAULT '',
  `date` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `address` text NOT NULL,
  `publication` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `query`
--

DROP TABLE IF EXISTS `query`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `query` (
  `id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `type` char(1) NOT NULL DEFAULT 'r',
  `urlargs` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `urlargs` (`urlargs`(100))
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rnkAUTHORDATA`
--

DROP TABLE IF EXISTS `rnkAUTHORDATA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rnkAUTHORDATA` (
  `aterm` varchar(50) DEFAULT NULL,
  `hitlist` longblob,
  UNIQUE KEY `aterm` (`aterm`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rnkCITATIONDATAERR`
--

DROP TABLE IF EXISTS `rnkCITATIONDATAERR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rnkCITATIONDATAERR` (
  `type` enum('multiple-matches','not-well-formed') NOT NULL DEFAULT 'multiple-matches',
  `citinfo` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`type`,`citinfo`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rnkCITATIONDATAEXT`
--

DROP TABLE IF EXISTS `rnkCITATIONDATAEXT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rnkCITATIONDATAEXT` (
  `id_bibrec` int(8) unsigned NOT NULL DEFAULT '0',
  `extcitepubinfo` varchar(255) NOT NULL,
  PRIMARY KEY (`id_bibrec`,`extcitepubinfo`),
  KEY `extcitepubinfo` (`extcitepubinfo`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rnkCITATIONDICT`
--

DROP TABLE IF EXISTS `rnkCITATIONDICT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rnkCITATIONDICT` (
  `citee` int(10) unsigned NOT NULL,
  `citer` int(10) unsigned NOT NULL,
  `last_updated` datetime NOT NULL,
  PRIMARY KEY (`citee`,`citer`),
  KEY `reverse` (`citer`,`citee`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rnkCITATIONLOG`
--

DROP TABLE IF EXISTS `rnkCITATIONLOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rnkCITATIONLOG` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `citee` int(10) unsigned NOT NULL,
  `citer` int(10) unsigned NOT NULL,
  `type` enum('added','removed') DEFAULT NULL,
  `action_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `citee` (`citee`),
  KEY `citer` (`citer`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rnkDOWNLOADS`
--

DROP TABLE IF EXISTS `rnkDOWNLOADS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rnkDOWNLOADS` (
  `id_bibrec` mediumint(8) unsigned DEFAULT NULL,
  `download_time` datetime DEFAULT '0000-00-00 00:00:00',
  `client_host` int(10) unsigned DEFAULT NULL,
  `id_user` int(15) unsigned DEFAULT NULL,
  `id_bibdoc` mediumint(9) unsigned DEFAULT NULL,
  `file_version` smallint(2) unsigned DEFAULT NULL,
  `file_format` varchar(50) DEFAULT NULL,
  KEY `download_time` (`download_time`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rnkEXTENDEDAUTHORS`
--

DROP TABLE IF EXISTS `rnkEXTENDEDAUTHORS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rnkEXTENDEDAUTHORS` (
  `id` int(10) unsigned NOT NULL,
  `authorid` bigint(10) NOT NULL,
  PRIMARY KEY (`id`,`authorid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rnkMETHOD`
--

DROP TABLE IF EXISTS `rnkMETHOD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rnkMETHOD` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '',
  `last_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rnkMETHODDATA`
--

DROP TABLE IF EXISTS `rnkMETHODDATA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rnkMETHODDATA` (
  `id_rnkMETHOD` mediumint(9) unsigned NOT NULL,
  `relevance_data` longblob,
  PRIMARY KEY (`id_rnkMETHOD`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rnkMETHODNAME`
--

DROP TABLE IF EXISTS `rnkMETHODNAME`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rnkMETHODNAME` (
  `id_rnkMETHOD` mediumint(9) unsigned NOT NULL,
  `ln` char(5) NOT NULL DEFAULT '',
  `type` char(3) NOT NULL DEFAULT 'sn',
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id_rnkMETHOD`,`ln`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rnkPAGEVIEWS`
--

DROP TABLE IF EXISTS `rnkPAGEVIEWS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rnkPAGEVIEWS` (
  `id_bibrec` mediumint(8) unsigned DEFAULT NULL,
  `id_user` int(15) unsigned DEFAULT '0',
  `client_host` int(10) unsigned DEFAULT NULL,
  `view_time` datetime DEFAULT '0000-00-00 00:00:00',
  KEY `view_time` (`view_time`),
  KEY `id_bibrec` (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rnkRECORDSCACHE`
--

DROP TABLE IF EXISTS `rnkRECORDSCACHE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rnkRECORDSCACHE` (
  `id_bibrec` int(10) unsigned NOT NULL,
  `authorid` bigint(10) NOT NULL,
  PRIMARY KEY (`id_bibrec`,`authorid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rnkSELFCITEDICT`
--

DROP TABLE IF EXISTS `rnkSELFCITEDICT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rnkSELFCITEDICT` (
  `citee` int(10) unsigned NOT NULL,
  `citer` int(10) unsigned NOT NULL,
  `last_updated` datetime NOT NULL,
  PRIMARY KEY (`citee`,`citer`),
  KEY `reverse` (`citer`,`citee`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rnkSELFCITES`
--

DROP TABLE IF EXISTS `rnkSELFCITES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rnkSELFCITES` (
  `id_bibrec` int(10) unsigned NOT NULL,
  `count` int(10) unsigned NOT NULL,
  `references` text NOT NULL,
  `last_updated` datetime NOT NULL,
  PRIMARY KEY (`id_bibrec`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rnkWORD01F`
--

DROP TABLE IF EXISTS `rnkWORD01F`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rnkWORD01F` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(50) DEFAULT NULL,
  `hitlist` longblob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `term` (`term`)
) ENGINE=MyISAM AUTO_INCREMENT=3468 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rnkWORD01R`
--

DROP TABLE IF EXISTS `rnkWORD01R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rnkWORD01R` (
  `id_bibrec` mediumint(9) unsigned NOT NULL,
  `termlist` longblob,
  `type` enum('CURRENT','FUTURE','TEMPORARY') NOT NULL DEFAULT 'CURRENT',
  PRIMARY KEY (`id_bibrec`,`type`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sbmACTION`
--

DROP TABLE IF EXISTS `sbmACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sbmACTION` (
  `lactname` text,
  `sactname` char(3) NOT NULL DEFAULT '',
  `dir` text,
  `cd` date DEFAULT NULL,
  `md` date DEFAULT NULL,
  `actionbutton` text,
  `statustext` text,
  PRIMARY KEY (`sactname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sbmALLFUNCDESCR`
--

DROP TABLE IF EXISTS `sbmALLFUNCDESCR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sbmALLFUNCDESCR` (
  `function` varchar(40) NOT NULL DEFAULT '',
  `description` tinytext,
  PRIMARY KEY (`function`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sbmAPPROVAL`
--

DROP TABLE IF EXISTS `sbmAPPROVAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sbmAPPROVAL` (
  `doctype` varchar(10) NOT NULL DEFAULT '',
  `categ` varchar(50) NOT NULL DEFAULT '',
  `rn` varchar(50) NOT NULL DEFAULT '',
  `status` varchar(10) NOT NULL DEFAULT '',
  `dFirstReq` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `dLastReq` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `dAction` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access` varchar(20) NOT NULL DEFAULT '0',
  `note` text NOT NULL,
  PRIMARY KEY (`rn`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sbmCATEGORIES`
--

DROP TABLE IF EXISTS `sbmCATEGORIES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sbmCATEGORIES` (
  `doctype` varchar(10) NOT NULL DEFAULT '',
  `sname` varchar(75) NOT NULL DEFAULT '',
  `lname` varchar(75) NOT NULL DEFAULT '',
  `score` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`doctype`,`sname`),
  KEY `doctype` (`doctype`),
  KEY `sname` (`sname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sbmCHECKS`
--

DROP TABLE IF EXISTS `sbmCHECKS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sbmCHECKS` (
  `chname` varchar(15) NOT NULL DEFAULT '',
  `chdesc` text,
  `cd` date DEFAULT NULL,
  `md` date DEFAULT NULL,
  `chefi1` text,
  `chefi2` text,
  PRIMARY KEY (`chname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sbmCOLLECTION`
--

DROP TABLE IF EXISTS `sbmCOLLECTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sbmCOLLECTION` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sbmCOLLECTION_sbmCOLLECTION`
--

DROP TABLE IF EXISTS `sbmCOLLECTION_sbmCOLLECTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sbmCOLLECTION_sbmCOLLECTION` (
  `id_father` int(11) NOT NULL DEFAULT '0',
  `id_son` int(11) NOT NULL DEFAULT '0',
  `catalogue_order` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sbmCOLLECTION_sbmDOCTYPE`
--

DROP TABLE IF EXISTS `sbmCOLLECTION_sbmDOCTYPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sbmCOLLECTION_sbmDOCTYPE` (
  `id_father` int(11) NOT NULL DEFAULT '0',
  `id_son` char(10) NOT NULL DEFAULT '0',
  `catalogue_order` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sbmCOOKIES`
--

DROP TABLE IF EXISTS `sbmCOOKIES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sbmCOOKIES` (
  `id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `value` text,
  `uid` int(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sbmCPLXAPPROVAL`
--

DROP TABLE IF EXISTS `sbmCPLXAPPROVAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sbmCPLXAPPROVAL` (
  `doctype` varchar(10) NOT NULL DEFAULT '',
  `categ` varchar(50) NOT NULL DEFAULT '',
  `rn` varchar(50) NOT NULL DEFAULT '',
  `type` varchar(10) NOT NULL,
  `status` varchar(10) NOT NULL,
  `id_group` int(15) unsigned NOT NULL DEFAULT '0',
  `id_bskBASKET` int(15) unsigned NOT NULL DEFAULT '0',
  `id_EdBoardGroup` int(15) unsigned NOT NULL DEFAULT '0',
  `dFirstReq` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `dLastReq` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `dEdBoardSel` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `dRefereeSel` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `dRefereeRecom` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `dEdBoardRecom` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `dPubComRecom` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `dProjectLeaderAction` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`rn`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sbmDOCTYPE`
--

DROP TABLE IF EXISTS `sbmDOCTYPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sbmDOCTYPE` (
  `ldocname` text,
  `sdocname` varchar(10) DEFAULT NULL,
  `cd` date DEFAULT NULL,
  `md` date DEFAULT NULL,
  `description` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sbmFIELD`
--

DROP TABLE IF EXISTS `sbmFIELD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sbmFIELD` (
  `subname` varchar(13) DEFAULT NULL,
  `pagenb` int(11) DEFAULT NULL,
  `fieldnb` int(11) DEFAULT NULL,
  `fidesc` varchar(15) DEFAULT NULL,
  `fitext` text,
  `level` char(1) DEFAULT NULL,
  `sdesc` text,
  `checkn` text,
  `cd` date DEFAULT NULL,
  `md` date DEFAULT NULL,
  `fiefi1` text,
  `fiefi2` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sbmFIELDDESC`
--

DROP TABLE IF EXISTS `sbmFIELDDESC`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sbmFIELDDESC` (
  `name` varchar(15) NOT NULL DEFAULT '',
  `alephcode` varchar(50) DEFAULT NULL,
  `marccode` varchar(50) NOT NULL DEFAULT '',
  `type` char(1) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `rows` int(11) DEFAULT NULL,
  `cols` int(11) DEFAULT NULL,
  `maxlength` int(11) DEFAULT NULL,
  `val` text,
  `fidesc` text,
  `cd` date DEFAULT NULL,
  `md` date DEFAULT NULL,
  `modifytext` text,
  `fddfi2` text,
  `cookie` int(11) DEFAULT '0',
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sbmFORMATEXTENSION`
--

DROP TABLE IF EXISTS `sbmFORMATEXTENSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sbmFORMATEXTENSION` (
  `FILE_FORMAT` text NOT NULL,
  `FILE_EXTENSION` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sbmFUNCTIONS`
--

DROP TABLE IF EXISTS `sbmFUNCTIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sbmFUNCTIONS` (
  `action` varchar(10) NOT NULL DEFAULT '',
  `doctype` varchar(10) NOT NULL DEFAULT '',
  `function` varchar(40) NOT NULL DEFAULT '',
  `score` int(11) NOT NULL DEFAULT '0',
  `step` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sbmFUNDESC`
--

DROP TABLE IF EXISTS `sbmFUNDESC`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sbmFUNDESC` (
  `function` varchar(40) NOT NULL DEFAULT '',
  `param` varchar(40) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sbmGFILERESULT`
--

DROP TABLE IF EXISTS `sbmGFILERESULT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sbmGFILERESULT` (
  `FORMAT` text NOT NULL,
  `RESULT` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sbmIMPLEMENT`
--

DROP TABLE IF EXISTS `sbmIMPLEMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sbmIMPLEMENT` (
  `docname` varchar(10) DEFAULT NULL,
  `actname` char(3) DEFAULT NULL,
  `displayed` char(1) DEFAULT NULL,
  `subname` varchar(13) DEFAULT NULL,
  `nbpg` int(11) DEFAULT NULL,
  `cd` date DEFAULT NULL,
  `md` date DEFAULT NULL,
  `buttonorder` int(11) DEFAULT NULL,
  `statustext` text,
  `level` char(1) NOT NULL DEFAULT '',
  `score` int(11) NOT NULL DEFAULT '0',
  `stpage` int(11) NOT NULL DEFAULT '0',
  `endtxt` varchar(100) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sbmPARAMETERS`
--

DROP TABLE IF EXISTS `sbmPARAMETERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sbmPARAMETERS` (
  `doctype` varchar(10) NOT NULL DEFAULT '',
  `name` varchar(40) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`doctype`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sbmPUBLICATION`
--

DROP TABLE IF EXISTS `sbmPUBLICATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sbmPUBLICATION` (
  `doctype` varchar(10) NOT NULL DEFAULT '',
  `categ` varchar(50) NOT NULL DEFAULT '',
  `rn` varchar(50) NOT NULL DEFAULT '',
  `status` varchar(10) NOT NULL DEFAULT '',
  `dFirstReq` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `dLastReq` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `dAction` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `accessref` varchar(20) NOT NULL DEFAULT '',
  `accessedi` varchar(20) NOT NULL DEFAULT '',
  `access` varchar(20) NOT NULL DEFAULT '',
  `referees` varchar(50) NOT NULL DEFAULT '',
  `authoremail` varchar(50) NOT NULL DEFAULT '',
  `dRefSelection` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `dRefRec` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `dEdiRec` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `accessspo` varchar(20) NOT NULL DEFAULT '',
  `journal` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`doctype`,`categ`,`rn`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sbmPUBLICATIONCOMM`
--

DROP TABLE IF EXISTS `sbmPUBLICATIONCOMM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sbmPUBLICATIONCOMM` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_parent` int(11) DEFAULT '0',
  `rn` varchar(100) NOT NULL DEFAULT '',
  `firstname` varchar(100) DEFAULT NULL,
  `secondname` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `date` varchar(40) NOT NULL DEFAULT '',
  `synopsis` varchar(255) NOT NULL DEFAULT '',
  `commentfulltext` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sbmPUBLICATIONDATA`
--

DROP TABLE IF EXISTS `sbmPUBLICATIONDATA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sbmPUBLICATIONDATA` (
  `doctype` varchar(10) NOT NULL DEFAULT '',
  `editoboard` varchar(250) NOT NULL DEFAULT '',
  `base` varchar(10) NOT NULL DEFAULT '',
  `logicalbase` varchar(10) NOT NULL DEFAULT '',
  `spokesperson` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`doctype`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sbmREFEREES`
--

DROP TABLE IF EXISTS `sbmREFEREES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sbmREFEREES` (
  `doctype` varchar(10) NOT NULL DEFAULT '',
  `categ` varchar(10) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `address` varchar(50) NOT NULL DEFAULT '',
  `rid` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sbmSUBMISSIONS`
--

DROP TABLE IF EXISTS `sbmSUBMISSIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sbmSUBMISSIONS` (
  `email` varchar(50) NOT NULL DEFAULT '',
  `doctype` varchar(10) NOT NULL DEFAULT '',
  `action` varchar(10) NOT NULL DEFAULT '',
  `status` varchar(10) NOT NULL DEFAULT '',
  `id` varchar(30) NOT NULL DEFAULT '',
  `reference` varchar(40) NOT NULL DEFAULT '',
  `cd` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `md` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `schSTATUS`
--

DROP TABLE IF EXISTS `schSTATUS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schSTATUS` (
  `name` varchar(50) NOT NULL DEFAULT '',
  `value` mediumblob,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `schTASK`
--

DROP TABLE IF EXISTS `schTASK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schTASK` (
  `id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `proc` varchar(255) NOT NULL,
  `host` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(50) NOT NULL,
  `runtime` datetime NOT NULL,
  `sleeptime` varchar(20) DEFAULT NULL,
  `arguments` mediumblob,
  `status` varchar(50) DEFAULT NULL,
  `progress` varchar(255) DEFAULT NULL,
  `priority` tinyint(4) NOT NULL DEFAULT '0',
  `sequenceid` int(8) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `runtime` (`runtime`),
  KEY `priority` (`priority`),
  KEY `sequenceid` (`sequenceid`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seqSTORE`
--

DROP TABLE IF EXISTS `seqSTORE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seqSTORE` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `seq_name` varchar(15) DEFAULT NULL,
  `seq_value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `seq_name_value` (`seq_name`,`seq_value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `session`
--

DROP TABLE IF EXISTS `session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `session` (
  `session_key` varchar(32) NOT NULL DEFAULT '',
  `session_expiry` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `session_object` longblob,
  `uid` int(15) unsigned NOT NULL,
  UNIQUE KEY `session_key` (`session_key`),
  KEY `uid` (`uid`),
  KEY `session_expiry` (`session_expiry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `staEVENT`
--

DROP TABLE IF EXISTS `staEVENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staEVENT` (
  `id` varchar(255) NOT NULL,
  `number` smallint(2) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `creation_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cols` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `number` (`number`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `staEVENT01`
--

DROP TABLE IF EXISTS `staEVENT01`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staEVENT01` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `creation_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `action` mediumtext,
  `basket` mediumtext,
  `user` mediumtext,
  PRIMARY KEY (`id`),
  KEY `action` (`action`(50)),
  KEY `basket` (`basket`(50)),
  KEY `user` (`user`(50))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `staEVENT02`
--

DROP TABLE IF EXISTS `staEVENT02`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staEVENT02` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `creation_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `action` mediumtext,
  `alert` mediumtext,
  `user` mediumtext,
  PRIMARY KEY (`id`),
  KEY `action` (`action`(50)),
  KEY `alert` (`alert`(50)),
  KEY `user` (`user`(50))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `staEVENT03`
--

DROP TABLE IF EXISTS `staEVENT03`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staEVENT03` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `creation_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `action` mediumtext,
  `journal_name` mediumtext,
  `issue_number` mediumtext,
  `category` mediumtext,
  `language` mediumtext,
  `articleid` mediumtext,
  PRIMARY KEY (`id`),
  KEY `action` (`action`(50)),
  KEY `journal_name` (`journal_name`(50)),
  KEY `issue_number` (`issue_number`(50)),
  KEY `category` (`category`(50)),
  KEY `language` (`language`(50)),
  KEY `articleid` (`articleid`(50))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `staEVENT04`
--

DROP TABLE IF EXISTS `staEVENT04`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staEVENT04` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `creation_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `doctype` mediumtext,
  PRIMARY KEY (`id`),
  KEY `doctype` (`doctype`(50))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `staEVENT05`
--

DROP TABLE IF EXISTS `staEVENT05`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staEVENT05` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `creation_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `request_id` mediumtext,
  `loan_id` mediumtext,
  PRIMARY KEY (`id`),
  KEY `request_id` (`request_id`(50)),
  KEY `loan_id` (`loan_id`(50))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `staEVENT06`
--

DROP TABLE IF EXISTS `staEVENT06`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staEVENT06` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `creation_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `IP` mediumtext,
  `UID` mediumtext,
  `email` mediumtext,
  PRIMARY KEY (`id`),
  KEY `IP` (`IP`(50)),
  KEY `UID` (`UID`(50)),
  KEY `email` (`email`(50))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `staEVENT07`
--

DROP TABLE IF EXISTS `staEVENT07`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staEVENT07` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `creation_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` mediumtext,
  `key_id` mediumtext,
  `path` mediumtext,
  `query` mediumtext,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`(50)),
  KEY `key_id` (`key_id`(50)),
  KEY `path` (`path`(50)),
  KEY `query` (`query`(50))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `swrCLIENTDATA`
--

DROP TABLE IF EXISTS `swrCLIENTDATA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `swrCLIENTDATA` (
  `id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `id_swrREMOTESERVER` int(15) NOT NULL,
  `id_record` int(15) NOT NULL,
  `report_no` varchar(50) NOT NULL,
  `id_remote` varchar(50) NOT NULL,
  `id_user` int(15) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `xml_media_deposit` longblob NOT NULL,
  `xml_metadata_submit` longblob NOT NULL,
  `submission_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publication_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `removal_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_medias` varchar(150) NOT NULL,
  `link_metadata` varchar(150) NOT NULL,
  `link_status` varchar(150) NOT NULL,
  `status` varchar(150) NOT NULL DEFAULT 'submitted',
  `last_update` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `swrREMOTESERVER`
--

DROP TABLE IF EXISTS `swrREMOTESERVER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `swrREMOTESERVER` (
  `id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `host` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `realm` varchar(50) NOT NULL,
  `url_base_record` varchar(50) NOT NULL,
  `url_servicedocument` varchar(80) NOT NULL,
  `xml_servicedocument` longblob,
  `last_update` int(15) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `value` varchar(6) DEFAULT '',
  `recjson_value` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=227 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `upgrade`
--

DROP TABLE IF EXISTS `upgrade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `upgrade` (
  `upgrade` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`upgrade`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL DEFAULT '',
  `password` blob NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `settings` blob,
  `nickname` varchar(255) NOT NULL DEFAULT '',
  `last_login` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `email` (`email`),
  KEY `nickname` (`nickname`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userEXT`
--

DROP TABLE IF EXISTS `userEXT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userEXT` (
  `id` varbinary(255) NOT NULL,
  `method` varchar(50) NOT NULL,
  `id_user` int(15) unsigned NOT NULL,
  PRIMARY KEY (`id`,`method`),
  UNIQUE KEY `id_user` (`id_user`,`method`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_accROLE`
--

DROP TABLE IF EXISTS `user_accROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_accROLE` (
  `id_user` int(15) unsigned NOT NULL,
  `id_accROLE` int(15) unsigned NOT NULL,
  `expiration` datetime NOT NULL DEFAULT '9999-12-31 23:59:59',
  PRIMARY KEY (`id_user`,`id_accROLE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_bskBASKET`
--

DROP TABLE IF EXISTS `user_bskBASKET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_bskBASKET` (
  `id_user` int(15) unsigned NOT NULL DEFAULT '0',
  `id_bskBASKET` int(15) unsigned NOT NULL DEFAULT '0',
  `topic` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_user`,`id_bskBASKET`),
  KEY `id_user` (`id_user`),
  KEY `id_bskBASKET` (`id_bskBASKET`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_expJOB`
--

DROP TABLE IF EXISTS `user_expJOB`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_expJOB` (
  `id_user` int(15) NOT NULL,
  `id_expJOB` int(15) NOT NULL,
  PRIMARY KEY (`id_user`,`id_expJOB`),
  KEY `id_user` (`id_user`),
  KEY `id_expJOB` (`id_expJOB`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_msgMESSAGE`
--

DROP TABLE IF EXISTS `user_msgMESSAGE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_msgMESSAGE` (
  `id_user_to` int(15) unsigned NOT NULL DEFAULT '0',
  `id_msgMESSAGE` int(15) unsigned NOT NULL DEFAULT '0',
  `status` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id_user_to`,`id_msgMESSAGE`),
  KEY `id_user_to` (`id_user_to`),
  KEY `id_msgMESSAGE` (`id_msgMESSAGE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_query`
--

DROP TABLE IF EXISTS `user_query`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_query` (
  `id_user` int(15) unsigned NOT NULL DEFAULT '0',
  `id_query` int(15) unsigned NOT NULL DEFAULT '0',
  `hostname` varchar(50) DEFAULT 'unknown host',
  `date` datetime DEFAULT NULL,
  KEY `id_user` (`id_user`,`id_query`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_query_basket`
--

DROP TABLE IF EXISTS `user_query_basket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_query_basket` (
  `id_user` int(15) unsigned NOT NULL DEFAULT '0',
  `id_query` int(15) unsigned NOT NULL DEFAULT '0',
  `id_basket` int(15) unsigned NOT NULL DEFAULT '0',
  `frequency` varchar(5) NOT NULL DEFAULT '',
  `date_creation` date DEFAULT NULL,
  `date_lastrun` date DEFAULT '0000-00-00',
  `alert_name` varchar(30) NOT NULL DEFAULT '',
  `alert_desc` text,
  `alert_recipient` text,
  `notification` char(1) NOT NULL DEFAULT 'y',
  PRIMARY KEY (`id_user`,`id_query`,`frequency`,`id_basket`),
  KEY `alert_name` (`alert_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_usergroup`
--

DROP TABLE IF EXISTS `user_usergroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_usergroup` (
  `id_user` int(15) unsigned NOT NULL DEFAULT '0',
  `id_usergroup` int(15) unsigned NOT NULL DEFAULT '0',
  `user_status` char(1) NOT NULL DEFAULT '',
  `user_status_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  KEY `id_user` (`id_user`),
  KEY `id_usergroup` (`id_usergroup`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroup`
--

DROP TABLE IF EXISTS `usergroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroup` (
  `id` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `join_policy` char(2) NOT NULL DEFAULT '',
  `login_method` varchar(255) NOT NULL DEFAULT 'INTERNAL',
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_method_name` (`login_method`(70),`name`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroup_bskBASKET`
--

DROP TABLE IF EXISTS `usergroup_bskBASKET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroup_bskBASKET` (
  `id_usergroup` int(15) unsigned NOT NULL DEFAULT '0',
  `id_bskBASKET` int(15) unsigned NOT NULL DEFAULT '0',
  `topic` varchar(50) NOT NULL DEFAULT '',
  `date_shared` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `share_level` char(2) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_usergroup`,`id_bskBASKET`),
  KEY `id_usergroup` (`id_usergroup`),
  KEY `id_bskBASKET` (`id_bskBASKET`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `wapCACHE`
--

DROP TABLE IF EXISTS `wapCACHE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wapCACHE` (
  `object_name` varchar(120) NOT NULL,
  `object_key` varchar(120) NOT NULL,
  `object_value` longblob,
  `object_status` varchar(120) DEFAULT NULL,
  `last_updated` datetime NOT NULL,
  PRIMARY KEY (`object_name`,`object_key`),
  KEY `last_updated-b` (`last_updated`),
  KEY `status-b` (`object_status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `webapikey`
--

DROP TABLE IF EXISTS `webapikey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webapikey` (
  `id` varchar(150) NOT NULL,
  `secret` varchar(150) NOT NULL,
  `id_user` int(15) NOT NULL,
  `status` varchar(25) NOT NULL DEFAULT 'OK',
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_user` (`id_user`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `xtrJOB`
--

DROP TABLE IF EXISTS `xtrJOB`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xtrJOB` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `last_updated` datetime NOT NULL,
  `last_recid` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-10-11 15:20:33
