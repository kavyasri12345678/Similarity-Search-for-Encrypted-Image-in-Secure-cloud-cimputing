/*
SQLyog Enterprise - MySQL GUI v6.56
MySQL - 5.0.67-community-nt : Database - similarity
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`similarity` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `similarity`;

/*Table structure for table `cloud` */

DROP TABLE IF EXISTS `cloud`;

CREATE TABLE `cloud` (
  `username` text,
  `password` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cloud` */

insert  into `cloud`(`username`,`password`) values ('Cloud','Cloud');

/*Table structure for table `decryptkey` */

DROP TABLE IF EXISTS `decryptkey`;

CREATE TABLE `decryptkey` (
  `id` int(11) NOT NULL auto_increment,
  `uid` text,
  `oid` text,
  `image_id` text,
  `decryptkey` text,
  `status` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `decryptkey` */

insert  into `decryptkey`(`id`,`uid`,`oid`,`image_id`,`decryptkey`,`status`) values (8,'3','3','11','4jHeOiCmR8','waiting');

/*Table structure for table `gkey` */

DROP TABLE IF EXISTS `gkey`;

CREATE TABLE `gkey` (
  `id` int(11) NOT NULL auto_increment,
  `owner_id` text,
  `user_id` text,
  `user_key` text,
  `owner_key` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `gkey` */

/*Table structure for table `image` */

DROP TABLE IF EXISTS `image`;

CREATE TABLE `image` (
  `id` int(11) NOT NULL auto_increment,
  `owner_id` text,
  `owner_name` text,
  `index_keyword` text,
  `skey` text,
  `title` text,
  `description` text,
  `cipher_index` text,
  `image` longblob,
  `date` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `image` */

/*Table structure for table `owner` */

DROP TABLE IF EXISTS `owner`;

CREATE TABLE `owner` (
  `id` int(11) NOT NULL auto_increment,
  `name` text,
  `email` text,
  `mobile` text,
  `address` text,
  `username` text,
  `password` text,
  `date` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `owner` */

/*Table structure for table `trapdoor` */

DROP TABLE IF EXISTS `trapdoor`;

CREATE TABLE `trapdoor` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` text,
  `username` text,
  `image_id` text,
  `trapdoor` text,
  `status` text,
  `status1` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `trapdoor` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL auto_increment,
  `name` text,
  `email` text,
  `mobile` text,
  `address` text,
  `username` text,
  `password` text,
  `date` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `user` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
