/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 10.4.21-MariaDB : Database - colegio
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`colegio` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `colegio`;

/*Table structure for table `academicperiodgroups` */

DROP TABLE IF EXISTS `academicperiodgroups`;

CREATE TABLE `academicperiodgroups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `quota` varchar(255) NOT NULL,
  `groupId` bigint(20) NOT NULL,
  `degreeId` bigint(20) NOT NULL,
  `journeyId` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `groupId` (`groupId`),
  KEY `degreeId` (`degreeId`),
  KEY `jurneyId` (`journeyId`),
  CONSTRAINT `academicperiodgroups_ibfk_1` FOREIGN KEY (`groupId`) REFERENCES `groups` (`id`),
  CONSTRAINT `academicperiodgroups_ibfk_2` FOREIGN KEY (`degreeId`) REFERENCES `degrees` (`id`),
  CONSTRAINT `academicperiodgroups_ibfk_3` FOREIGN KEY (`journeyId`) REFERENCES `journeys` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `academicperiodgroups` */

/*Table structure for table `degrees` */

DROP TABLE IF EXISTS `degrees`;

CREATE TABLE `degrees` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `abbreviation` varchar(20) NOT NULL,
  `updatedAt` varchar(255) NOT NULL,
  `levelId` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `levelId` (`levelId`),
  CONSTRAINT `degrees_ibfk_3` FOREIGN KEY (`levelId`) REFERENCES `levels` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `degrees` */

/*Table structure for table `groups` */

DROP TABLE IF EXISTS `groups`;

CREATE TABLE `groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varbinary(255) NOT NULL,
  `updatedAt` datetime NOT NULL,
  `createdAt` datetime NOT NULL,
  `abbreviation` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `groups` */

/*Table structure for table `journeys` */

DROP TABLE IF EXISTS `journeys`;

CREATE TABLE `journeys` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `abbreviation` varchar(20) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `journeys` */

insert  into `journeys`(`id`,`name`,`abbreviation`,`createdAt`,`updatedAt`) values 
(16,'matutina','mat.','2021-11-19 19:42:18','0000-00-00 00:00:00');

/*Table structure for table `levels` */

DROP TABLE IF EXISTS `levels`;

CREATE TABLE `levels` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `abbreviation` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `levels` */

insert  into `levels`(`id`,`name`,`createdAt`,`updatedAt`,`abbreviation`) values 
(11,'preprimaria y primaria baja','2021-11-19 19:42:18','0000-00-00 00:00:00',''),
(12,'primaria alta','2021-11-19 19:42:18','0000-00-00 00:00:00',''),
(13,'secundaria','2021-11-19 19:42:18','0000-00-00 00:00:00','');

/*Table structure for table `matriculates` */

DROP TABLE IF EXISTS `matriculates`;

CREATE TABLE `matriculates` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `academicPeriodGroupId` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `academicPeriodGroupId` (`academicPeriodGroupId`),
  CONSTRAINT `matriculates_ibfk_1` FOREIGN KEY (`academicPeriodGroupId`) REFERENCES `academicperiodgroups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `matriculates` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
