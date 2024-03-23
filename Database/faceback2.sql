/*
SQLyog - Free MySQL GUI v5.17
Host - 5.0.24-community-nt : Database - faceback
*********************************************************************
Server version : 5.0.24-community-nt
*/

SET NAMES utf8;

SET SQL_MODE='';

create database if not exists `faceback`;

USE `faceback`;

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';

/*Table structure for table `admin_info` */

DROP TABLE IF EXISTS `admin_info`;

CREATE TABLE `admin_info` (
  `Username` varchar(200) NOT NULL,
  `Password` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `admin_info` */

insert into `admin_info` (`Username`,`Password`) values ('98d34c1758b15b5a359b69c2b08c5767','98d34c1758b15b5a359b69c2b08c5767');

/*Table structure for table `feedback` */

DROP TABLE IF EXISTS `feedback`;

CREATE TABLE `feedback` (
  `feedback_id` int(7) NOT NULL auto_increment,
  `user_id` int(7) NOT NULL,
  `feedback_txt` varchar(120) NOT NULL,
  `star` varchar(1) NOT NULL,
  `Date` varchar(30) NOT NULL,
  PRIMARY KEY  (`feedback_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `feedback` */

insert into `feedback` (`feedback_id`,`user_id`,`feedback_txt`,`star`,`Date`) values (2,8,'Thanks Rohan','5','30-9-2013 11:34');

/*Table structure for table `group_chat` */

DROP TABLE IF EXISTS `group_chat`;

CREATE TABLE `group_chat` (
  `chat_id` int(10) NOT NULL auto_increment,
  `user_id` int(7) NOT NULL,
  `chat_txt` text NOT NULL,
  `time` varchar(30) NOT NULL,
  PRIMARY KEY  (`chat_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `group_chat_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `group_chat` */

insert into `group_chat` (`chat_id`,`user_id`,`chat_txt`,`time`) values (1,8,'Hello Friends How are you ? ','30-9-2013 11:35');

/*Table structure for table `user_cover_pic` */

DROP TABLE IF EXISTS `user_cover_pic`;

CREATE TABLE `user_cover_pic` (
  `cover_id` int(7) NOT NULL auto_increment,
  `user_id` int(7) NOT NULL,
  `image` varchar(150) NOT NULL,
  PRIMARY KEY  (`cover_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_cover_pic_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user_cover_pic` */

insert into `user_cover_pic` (`cover_id`,`user_id`,`image`) values (7,8,'999584_496501817111249_1587007043_n.jpg');

/*Table structure for table `user_info` */

DROP TABLE IF EXISTS `user_info`;

CREATE TABLE `user_info` (
  `user_id` int(7) NOT NULL,
  `job` varchar(100) NOT NULL,
  `school_or_collage` varchar(100) NOT NULL,
  `current_city` varchar(100) NOT NULL,
  `hometown` varchar(100) NOT NULL,
  `relationship_status` varchar(30) NOT NULL,
  `mobile_no` varchar(15) NOT NULL,
  `mobile_no_priority` varchar(10) NOT NULL,
  `website` varchar(100) NOT NULL,
  `Facebook_ID` varchar(100) NOT NULL,
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_info_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user_info` */

insert into `user_info` (`user_id`,`job`,`school_or_collage`,`current_city`,`hometown`,`relationship_status`,`mobile_no`,`mobile_no_priority`,`website`,`Facebook_ID`) values (8,'','vccm','Rajkot','Rajkot','Single','7600898210','Public','www.wix.com/amitad1i4/amit','www.facebook.com/Amit.000002');

/*Table structure for table `user_post` */

DROP TABLE IF EXISTS `user_post`;

CREATE TABLE `user_post` (
  `post_id` int(7) NOT NULL auto_increment,
  `user_id` int(7) NOT NULL,
  `post_txt` text NOT NULL,
  `post_pic` varchar(150) NOT NULL,
  `post_time` varchar(30) NOT NULL,
  `priority` varchar(8) NOT NULL,
  PRIMARY KEY  (`post_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_post_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user_post` */

insert into `user_post` (`post_id`,`user_id`,`post_txt`,`post_pic`,`post_time`,`priority`) values (46,8,'Join Faceback','','18-9-2013 22:10','Public');

/*Table structure for table `user_post_comment` */

DROP TABLE IF EXISTS `user_post_comment`;

CREATE TABLE `user_post_comment` (
  `comment_id` int(7) NOT NULL auto_increment,
  `post_id` int(7) NOT NULL,
  `user_id` int(7) NOT NULL,
  `comment` text NOT NULL,
  PRIMARY KEY  (`comment_id`),
  KEY `user_id` (`user_id`),
  KEY `post_id` (`post_id`),
  CONSTRAINT `user_post_comment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `user_post_comment_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `user_post` (`post_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user_post_comment` */

/*Table structure for table `user_post_status` */

DROP TABLE IF EXISTS `user_post_status`;

CREATE TABLE `user_post_status` (
  `status_id` int(7) NOT NULL auto_increment,
  `post_id` int(7) NOT NULL,
  `user_id` int(7) NOT NULL,
  `status` varchar(7) NOT NULL,
  PRIMARY KEY  (`status_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_post_status_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `user_post_status_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user_post` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user_post_status` */

/*Table structure for table `user_profile_pic` */

DROP TABLE IF EXISTS `user_profile_pic`;

CREATE TABLE `user_profile_pic` (
  `profile_id` int(7) NOT NULL auto_increment,
  `user_id` int(7) NOT NULL,
  `image` varchar(150) NOT NULL,
  PRIMARY KEY  (`profile_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_profile_pic_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user_profile_pic` */

insert into `user_profile_pic` (`profile_id`,`user_id`,`image`) values (6,8,'my.jpg');

/*Table structure for table `user_secret_quotes` */

DROP TABLE IF EXISTS `user_secret_quotes`;

CREATE TABLE `user_secret_quotes` (
  `user_id` int(7) NOT NULL,
  `Question1` varchar(50) NOT NULL,
  `Answer1` varchar(20) NOT NULL,
  `Question2` varchar(50) NOT NULL,
  `Answer2` varchar(20) NOT NULL,
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_secret_quotes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user_secret_quotes` */

insert into `user_secret_quotes` (`user_id`,`Question1`,`Answer1`,`Question2`,`Answer2`) values (8,'what is the first name of your oldest nephew?','OneRaj','who is your all-time favorite movie character?','Amir Khan');

/*Table structure for table `user_status` */

DROP TABLE IF EXISTS `user_status`;

CREATE TABLE `user_status` (
  `user_id` int(7) NOT NULL,
  `status` varchar(8) NOT NULL,
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_status_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `user_status_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user_status` */

insert into `user_status` (`user_id`,`status`) values (8,'Online');

/*Table structure for table `user_warning` */

DROP TABLE IF EXISTS `user_warning`;

CREATE TABLE `user_warning` (
  `user_id` int(7) NOT NULL,
  `warning_txt` varchar(200) NOT NULL,
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_warning_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user_warning` */

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `user_id` int(7) NOT NULL auto_increment,
  `Name` varchar(25) NOT NULL,
  `Email` varchar(30) NOT NULL,
  `Password` varchar(30) NOT NULL,
  `Gender` varchar(6) NOT NULL,
  `Birthday_Date` varchar(11) NOT NULL,
  `FB_Join_Date` varchar(30) NOT NULL,
  PRIMARY KEY  (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `users` */

insert into `users` (`user_id`,`Name`,`Email`,`Password`,`Gender`,`Birthday_Date`,`FB_Join_Date`) values (8,'Amit Dodiya','amit.ad1i4@yahoo.com','myfaceback','Male','14-1-1994','18-9-2013 22:10');

/*Table structure for table `users_notice` */

DROP TABLE IF EXISTS `users_notice`;

CREATE TABLE `users_notice` (
  `notice_id` int(7) NOT NULL auto_increment,
  `user_id` int(7) NOT NULL,
  `notice_txt` varchar(120) NOT NULL,
  `notice_time` varchar(30) NOT NULL,
  PRIMARY KEY  (`notice_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `users_notice_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `users_notice` */

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
