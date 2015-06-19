/*
SQLyog Ultimate - MySQL GUI v8.22 
MySQL - 5.5.40-0ubuntu0.14.04.1-log : Database - tourism
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`tourism` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `tourism`;

/*Table structure for table `addmissionExamSeatplan` */

DROP TABLE IF EXISTS `addmissionExamSeatplan`;

CREATE TABLE `addmissionExamSeatplan` (
  `applicantId` bigint(20) unsigned NOT NULL,
  `examId` int(11) NOT NULL,
  `examRoomId` int(11) NOT NULL,
  PRIMARY KEY (`applicantId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `addmissionExamSeatplan` */

/*Table structure for table `admissionApplication` */

DROP TABLE IF EXISTS `admissionApplication`;

CREATE TABLE `admissionApplication` (
  `admissionApplicationId` double unsigned NOT NULL AUTO_INCREMENT,
  `admissionYear` int(11) DEFAULT NULL,
  `classId` int(11) NOT NULL,
  `firstName` varchar(256) NOT NULL,
  `lastName` varchar(256) NOT NULL,
  `father` varchar(256) NOT NULL,
  `mother` varchar(256) NOT NULL,
  `dateOfBirth` date NOT NULL,
  `currentSchool` varchar(512) DEFAULT NULL,
  `emailAddress` varchar(256) DEFAULT NULL,
  `currentAddress` text NOT NULL,
  `permanentAddress` text NOT NULL,
  `gurdian` varchar(256) NOT NULL,
  `relationShipWithGuardian` varchar(32) NOT NULL,
  `latestExamResult` varchar(32) DEFAULT NULL,
  `religion` varchar(64) DEFAULT NULL,
  `gender` varchar(16) NOT NULL,
  `yearlyFamilyIncome` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`admissionApplicationId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `admissionApplication` */

insert  into `admissionApplication`(`admissionApplicationId`,`admissionYear`,`classId`,`firstName`,`lastName`,`father`,`mother`,`dateOfBirth`,`currentSchool`,`emailAddress`,`currentAddress`,`permanentAddress`,`gurdian`,`relationShipWithGuardian`,`latestExamResult`,`religion`,`gender`,`yearlyFamilyIncome`) values (1,2015,1,'safayat','rahaman','ab','cd','2000-05-01','','safayat@gmail.com','rrrrrrrrrr rwsdsdsd','ssdsdsd sdsds sds dsd','ef','gh','','muslim','male','');

/*Table structure for table `admissionExam` */

DROP TABLE IF EXISTS `admissionExam`;

CREATE TABLE `admissionExam` (
  `admissionExamId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `examyear` int(11) NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  PRIMARY KEY (`admissionExamId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `admissionExam` */

/*Table structure for table `assignment` */

DROP TABLE IF EXISTS `assignment`;

CREATE TABLE `assignment` (
  `assignmentId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `courseId` int(10) unsigned NOT NULL,
  `postDateTime` datetime NOT NULL,
  `startDateTime` datetime DEFAULT NULL,
  `endDateTime` datetime DEFAULT NULL,
  `userId` int(10) unsigned DEFAULT NULL,
  `title` varchar(512) NOT NULL,
  `description` text,
  `fileUrl` varchar(512) DEFAULT NULL,
  `mark` int(11) DEFAULT NULL,
  `messageKey` varchar(16) NOT NULL,
  PRIMARY KEY (`assignmentId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `assignment` */

insert  into `assignment`(`assignmentId`,`courseId`,`postDateTime`,`startDateTime`,`endDateTime`,`userId`,`title`,`description`,`fileUrl`,`mark`,`messageKey`) values (1,1,'2015-04-09 23:32:07','2012-02-07 00:00:00','2012-02-13 00:00:00',20,'Assignment1','qqqqqqqqqqqqqqqqqqqqqqqq',NULL,50,'IgXg4z69HDG5jM/p'),(2,1,'2015-04-09 23:56:13','2012-02-13 00:00:00','2015-09-01 00:00:00',20,'Assignment2','wwwwwwwwwwwwwwwwwwwwwww',NULL,100,'yhUoAEa80FKeXYpR'),(3,1,'2015-04-10 00:35:28','2015-04-01 00:00:00','2015-12-01 00:00:00',20,'Assignment3','sdsdgfedrfed sfsdsdasawqfdfdf',NULL,56,'2SSFoY1LG7VCnvBf'),(4,1,'2015-04-11 23:56:35','2015-04-01 00:00:00','2015-04-14 00:00:00',20,'Assignment4','Based on the bestselling novel by master storyteller Nicholas Sparks, THE LONGEST RIDE centers on the star-crossed love affair between Luke, a former champion bull rider looking to make a comeback, and Sophia, a college student who is about to embark upon her dream job in New York City\'s art world. As conflicting paths and ideals test their relationship, Sophia and Luke make an unexpected and fateful connection with Ira, whose memories of his own decades-long romance with his beloved wife deeply inspire the young couple. Spanning generations and two intertwining love stories, THE LONGEST RIDE explores the challenges and infinite rewards of enduring love. Written by 20th Century Fox',NULL,50,'gTa5eyCgTCXLlczu'),(5,1,'2015-05-09 00:17:38','2015-03-01 00:00:00','2015-06-24 00:00:00',20,'newassignment','wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww',NULL,200,'CeK4MJJWw8SqFGWH'),(6,1,'2015-05-09 17:43:12','2012-02-12 00:00:00','2012-02-12 00:00:00',20,'Assignment1','A psychological thriller that examines the lives of two hunters. One is a serial killer who stalks his victims in and around Belfast and the other is a talented Detective Superintendent \r\n\r\nA psychological thriller that examines the lives of two hunters. One is a serial killer who stalks his victims in and around Belfast and the other is a talented Detective Superintendent \r\n\r\nA psychological thriller that examines the lives of two hunters. One is a serial killer who stalks his victims in and around Belfast and the other is a talented Detective Superintendent ',NULL,50,'zBD9XhrRB3YQen10'),(7,1,'2015-05-09 00:00:00','2015-05-19 00:00:00','2015-06-19 00:00:00',NULL,'Assignment10','A psychological thriller that examines the lives of two hunters. One is a serial killer who stalks his victims in and around Belfast and the other is a talented Detective Superintendent \r\n\r\nA psychological thriller that examines the lives of two hunters. One is a serial killer who stalks his victims in and around Belfast and the other is a talented Detective Superintendent \r\n\r\nA psychological thriller that examines the lives of two hunters. One is a serial killer who stalks his victims in and around Belfast and the other is a talented Detective Superintendent \r\n\r\nA psychological thriller that examines the lives of two hunters. One is a serial killer who stalks his victims in and around Belfast and the other is a talented Detective Superintendent ggggggggggggggggggggggggggggg\r\n',NULL,30,'5mNPHeUH9oE2QTPf');

/*Table structure for table `attendance` */

DROP TABLE IF EXISTS `attendance`;

CREATE TABLE `attendance` (
  `att_date` date NOT NULL,
  `att_student_id` int(11) unsigned NOT NULL,
  `att_is_present` tinyint(4) DEFAULT '0',
  `att_class_id` int(10) unsigned NOT NULL,
  `att_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`att_id`),
  UNIQUE KEY `NewIndex1` (`att_date`,`att_student_id`,`att_class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

/*Data for the table `attendance` */

insert  into `attendance`(`att_date`,`att_student_id`,`att_is_present`,`att_class_id`,`att_id`) values ('2015-03-08',2,1,1,1),('2015-03-08',3,1,1,2),('2015-03-08',4,1,1,3),('2015-03-26',2,1,1,4),('2015-03-26',3,1,1,5),('2015-05-09',2,1,1,6),('2015-05-09',3,1,1,7),('2015-05-09',4,1,1,8),('2015-06-07',2,1,1,9),('2015-06-07',3,1,1,10),('2015-06-07',4,1,1,11),('2015-06-07',10,1,1,12),('2015-06-07',11,1,1,13);

/*Table structure for table `book` */

DROP TABLE IF EXISTS `book`;

CREATE TABLE `book` (
  `bookId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bookName` varchar(512) NOT NULL,
  `author` varchar(512) DEFAULT NULL,
  `classId` int(10) unsigned DEFAULT NULL,
  `category` varchar(128) DEFAULT NULL,
  `bookCode` varchar(16) NOT NULL,
  `takenUserId` int(10) unsigned DEFAULT NULL,
  `courseId` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`bookId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `book` */

/*Table structure for table `class` */

DROP TABLE IF EXISTS `class`;

CREATE TABLE `class` (
  `cs_class_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cs_name` varchar(32) NOT NULL,
  `cs_captain_id` int(11) unsigned DEFAULT NULL,
  `cs_teacher_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`cs_class_id`),
  UNIQUE KEY `FK_class` (`cs_captain_id`),
  KEY `FK_class_teacher` (`cs_teacher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `class` */

insert  into `class`(`cs_class_id`,`cs_name`,`cs_captain_id`,`cs_teacher_id`) values (1,'Class 1',NULL,1),(2,'Class 2',NULL,2),(3,'Class 3',NULL,3),(4,'class 4',NULL,4),(5,'class 5',NULL,4);

/*Table structure for table `classRoutineConfiguration` */

DROP TABLE IF EXISTS `classRoutineConfiguration`;

CREATE TABLE `classRoutineConfiguration` (
  `classRoutineConfigurationId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `classId` int(10) unsigned NOT NULL,
  `startTime` int(11) NOT NULL COMMENT 'time in miutes',
  `endTime` int(11) NOT NULL COMMENT 'time in miutes',
  `classUnitTime` int(11) NOT NULL COMMENT 'time in miutes',
  `breakStartTime` int(11) NOT NULL COMMENT 'time in miutes',
  `breakLength` int(11) NOT NULL COMMENT 'time in miutes',
  PRIMARY KEY (`classRoutineConfigurationId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `classRoutineConfiguration` */

insert  into `classRoutineConfiguration`(`classRoutineConfigurationId`,`classId`,`startTime`,`endTime`,`classUnitTime`,`breakStartTime`,`breakLength`) values (1,1,480,810,60,660,30),(2,2,480,810,60,660,30),(3,3,480,810,60,660,30),(4,4,480,810,60,660,30),(5,5,480,810,60,660,30);

/*Table structure for table `cr_course_routine` */

DROP TABLE IF EXISTS `cr_course_routine`;

CREATE TABLE `cr_course_routine` (
  `courseRoutineId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `courseId` int(10) unsigned NOT NULL,
  `day` varchar(16) NOT NULL,
  `startTime` varchar(16) DEFAULT '00:00',
  `endTime` varchar(16) DEFAULT '00:00',
  `position` int(11) DEFAULT NULL,
  `classId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`courseRoutineId`),
  UNIQUE KEY `key_course_day_time` (`courseId`,`day`,`position`),
  KEY `key_course_id` (`courseId`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

/*Data for the table `cr_course_routine` */

insert  into `cr_course_routine`(`courseRoutineId`,`courseId`,`day`,`startTime`,`endTime`,`position`,`classId`) values (1,1,'mon','00:00','00:00',1,1),(2,2,'mon','00:00','00:00',2,1),(3,5,'mon','00:00','00:00',3,1),(4,4,'mon','00:00','00:00',4,1),(5,5,'mon','00:00','00:00',5,1),(6,6,'sun','00:00','00:00',1,1),(7,7,'sun','00:00','00:00',2,1),(8,8,'sun','00:00','00:00',3,1),(9,2,'sun','00:00','00:00',4,1),(10,3,'sun','00:00','00:00',5,1),(11,4,'tue',NULL,NULL,5,1),(12,6,'tue',NULL,NULL,3,1),(13,7,'wed',NULL,NULL,2,1),(14,8,'tue',NULL,NULL,2,1),(15,8,'wed',NULL,NULL,3,1);

/*Table structure for table `cs_course` */

DROP TABLE IF EXISTS `cs_course`;

CREATE TABLE `cs_course` (
  `courseId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `classId` int(10) unsigned NOT NULL,
  `courseName` varchar(512) NOT NULL,
  `teacherId` int(10) unsigned DEFAULT NULL,
  `courseCode` varchar(16) NOT NULL,
  `syllabus` text,
  PRIMARY KEY (`courseId`),
  UNIQUE KEY `key_course_code` (`courseCode`),
  KEY `key_class_id` (`classId`),
  KEY `key_teacher_id` (`teacherId`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;

/*Data for the table `cs_course` */

insert  into `cs_course`(`courseId`,`classId`,`courseName`,`teacherId`,`courseCode`,`syllabus`) values (1,1,'Math',1,'cs101','In the aftermath of a massive earthquake in California.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\n'),(2,1,'Bangla',2,'cs102','In the aftermath of a massive earthquake in California.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\n'),(3,1,'Religion',1,'cs103','In the aftermath of a massive earthquake in California.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\n'),(4,1,'Physics',2,'cs104','In the aftermath of a massive earthquake in California.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\n'),(5,1,'Chemistry',4,'qp103','In the aftermath of a massive earthquake in California.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\n'),(6,1,'Biology',4,'sc123','In the aftermath of a massive earthquake in California.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\n'),(7,1,'English',3,'eng123','In the aftermath of a massive earthquake in California.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\n'),(8,1,'Agriculture',3,'ag123','In the aftermath of a massive earthquake in California.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\n'),(9,2,'Math',1,'cs201','In the aftermath of a massive earthquake in California.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\n'),(10,2,'Bangla',2,'cs202','In the aftermath of a massive earthquake in California.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\n'),(11,2,'Religion',1,'cs203','In the aftermath of a massive earthquake in California.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\n'),(12,2,'Physics',2,'cs204','In the aftermath of a massive earthquake in California.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\n'),(13,2,'Chemistry',4,'qp203','In the aftermath of a massive earthquake in California.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\n'),(14,2,'Biology',4,'sc223','In the aftermath of a massive earthquake in California.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\n'),(15,2,'English',3,'eng223','In the aftermath of a massive earthquake in California.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\n'),(16,2,'Agriculture',3,'ag223','In the aftermath of a massive earthquake in California.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\n'),(17,3,'Math',1,'cs301','In the aftermath of a massive earthquake in California.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\n'),(18,3,'Bangla',2,'cs302','In the aftermath of a massive earthquake in California.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\n'),(19,3,'Religion',1,'cs303','In the aftermath of a massive earthquake in California.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\n'),(20,3,'Physics',2,'cs304','In the aftermath of a massive earthquake in California.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\n'),(21,3,'Chemistry',4,'qp303','In the aftermath of a massive earthquake in California.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\n'),(22,3,'Biology',4,'sc323','In the aftermath of a massive earthquake in California.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\n'),(23,3,'English',3,'eng323','In the aftermath of a massive earthquake in California.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\n'),(24,3,'Agriculture',3,'ag323','In the aftermath of a massive earthquake in California.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\n'),(25,4,'Math',1,'cs401','In the aftermath of a massive earthquake in California.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\n'),(26,4,'Bangla',2,'cs402','In the aftermath of a massive earthquake in California.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\n'),(27,4,'Religion',1,'cs403','In the aftermath of a massive earthquake in California.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\n'),(28,4,'Physics',2,'cs404','In the aftermath of a massive earthquake in California.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\n'),(29,4,'Chemistry',4,'qp403','In the aftermath of a massive earthquake in California.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\n'),(30,4,'Biology',4,'sc423','In the aftermath of a massive earthquake in California.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\n'),(31,4,'English',3,'eng423','In the aftermath of a massive earthquake in California.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\n'),(32,4,'Agriculture',3,'ag423','In the aftermath of a massive earthquake in California.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\n'),(33,5,'Math',1,'cs501','In the aftermath of a massive earthquake in California.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\n'),(34,5,'Bangla',2,'cs502','In the aftermath of a massive earthquake in California.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\n'),(35,5,'Religion',1,'cs503','In the aftermath of a massive earthquake in California.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\n'),(36,5,'Physics',2,'cs504','In the aftermath of a massive earthquake in California.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\n'),(37,5,'Chemistry',4,'qp503','In the aftermath of a massive earthquake in California.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\n'),(38,5,'Biology',4,'sc523','In the aftermath of a massive earthquake in California.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\n'),(39,5,'English',3,'eng523','In the aftermath of a massive earthquake in California.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\n'),(40,5,'Agriculture',3,'ag523','In the aftermath of a massive earthquake in California.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\nA rescue-chopper pilot makes a dangerous journey across the state in order to rescue his daughter.\r\n');

/*Table structure for table `employeeAttendance` */

DROP TABLE IF EXISTS `employeeAttendance`;

CREATE TABLE `employeeAttendance` (
  `employeeAttendanceId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `isPresent` tinyint(4) DEFAULT '0',
  `userId` int(10) unsigned NOT NULL,
  `rollCallDate` date NOT NULL,
  PRIMARY KEY (`employeeAttendanceId`),
  UNIQUE KEY `uniqueKey_userId_date` (`userId`,`rollCallDate`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Data for the table `employeeAttendance` */

insert  into `employeeAttendance`(`employeeAttendanceId`,`isPresent`,`userId`,`rollCallDate`) values (1,1,25,'2015-05-25'),(2,1,30,'2015-05-25'),(3,1,32,'2015-05-25'),(4,0,34,'2015-05-25'),(5,0,40,'2015-05-25'),(6,0,41,'2015-05-25'),(7,0,44,'2015-05-25'),(8,1,25,'2015-06-13'),(9,1,30,'2015-06-13'),(10,1,32,'2015-06-13'),(11,1,34,'2015-06-13'),(12,1,40,'2015-06-13'),(13,1,41,'2015-06-13'),(14,1,44,'2015-06-13');

/*Table structure for table `event` */

DROP TABLE IF EXISTS `event`;

CREATE TABLE `event` (
  `eventStartDate` date NOT NULL,
  `eventId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `eventName` varchar(256) DEFAULT NULL,
  `eventCreatedBy` int(11) NOT NULL,
  `responsibleUser` int(11) DEFAULT NULL,
  `eventEndDate` date NOT NULL,
  PRIMARY KEY (`eventId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `event` */

/*Table structure for table `examGroup` */

DROP TABLE IF EXISTS `examGroup`;

CREATE TABLE `examGroup` (
  `examGroupId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `examName` varchar(256) NOT NULL,
  `examYear` int(11) DEFAULT NULL,
  `examStartDate` date NOT NULL,
  `examEndDate` date NOT NULL,
  `classId` int(11) NOT NULL,
  `resultPublished` tinyint(1) DEFAULT '0',
  `resultPublishedDate` date DEFAULT NULL,
  PRIMARY KEY (`examGroupId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `examGroup` */

insert  into `examGroup`(`examGroupId`,`examName`,`examYear`,`examStartDate`,`examEndDate`,`classId`,`resultPublished`,`resultPublishedDate`) values (1,'Final Exam',2015,'2015-05-14','2015-05-30',2,0,NULL);

/*Table structure for table `examResult` */

DROP TABLE IF EXISTS `examResult`;

CREATE TABLE `examResult` (
  `resultId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `courseId` int(10) unsigned NOT NULL,
  `studentId` int(10) unsigned NOT NULL,
  `examGroupId` int(11) NOT NULL,
  `mark` int(11) DEFAULT '0',
  `grade` int(11) DEFAULT NULL,
  `totalMark` int(11) DEFAULT '100',
  PRIMARY KEY (`resultId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `examResult` */

insert  into `examResult`(`resultId`,`courseId`,`studentId`,`examGroupId`,`mark`,`grade`,`totalMark`) values (1,1,2,1,7,NULL,100),(2,1,3,1,5,NULL,100),(3,1,4,1,44,NULL,100),(4,1,10,1,33,NULL,100),(5,1,11,1,22,NULL,100),(6,2,2,1,76,NULL,100),(7,2,3,1,44,NULL,100),(8,2,4,1,22,NULL,100),(9,2,10,1,44,NULL,100),(10,2,11,1,90,NULL,100);

/*Table structure for table `examRoom` */

DROP TABLE IF EXISTS `examRoom`;

CREATE TABLE `examRoom` (
  `examRoomId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `roomNo` int(11) NOT NULL,
  PRIMARY KEY (`examRoomId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `examRoom` */

/*Table structure for table `leaveApplication` */

DROP TABLE IF EXISTS `leaveApplication`;

CREATE TABLE `leaveApplication` (
  `leaveId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `leaveType` varchar(36) NOT NULL DEFAULT 'casual',
  `applicantUserId` int(10) unsigned NOT NULL,
  `fromDate` date NOT NULL,
  `toDate` date NOT NULL,
  `leaveStatus` varchar(36) NOT NULL DEFAULT 'pending',
  `replacementUserId` int(10) unsigned DEFAULT NULL,
  `leaveDescription` text,
  `leaveAddress` text,
  PRIMARY KEY (`leaveId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `leaveApplication` */

insert  into `leaveApplication`(`leaveId`,`leaveType`,`applicantUserId`,`fromDate`,`toDate`,`leaveStatus`,`replacementUserId`,`leaveDescription`,`leaveAddress`) values (1,'casual',34,'2015-05-22','2015-05-26','approve',40,'dfdfer','werwewe'),(2,'medical',34,'2015-05-22','2015-05-31','pending',NULL,'Leave Description Leave Description Leave Description\r\nLeave Description Leave Description Leave Description','Leave Address Leave Address Leave Address\r\nLeave Address Leave Address Leave Address');

/*Table structure for table `menu` */

DROP TABLE IF EXISTS `menu`;

CREATE TABLE `menu` (
  `menuId` int(11) NOT NULL,
  `menuName` varchar(64) NOT NULL,
  `menuPath` varchar(256) DEFAULT NULL,
  `parentId` int(11) DEFAULT '-1',
  PRIMARY KEY (`menuId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `menu` */

insert  into `menu`(`menuId`,`menuName`,`menuPath`,`parentId`) values (1,'User Management',NULL,-1),(2,'Create Teacher','admin/private/createTeacher.web',1),(3,'Create Student','admin/private/createStudent.web',1),(4,'View Users','private/userData.web',1),(5,'Class Management',NULL,-1),(6,'Class List','private/classList.web',5),(7,'Attendance History','private/AttendanceHistory.web',5),(8,'Course Management',NULL,-1),(9,'Add Course','edu/private/addUpdateCourse.web',8),(10,'Add Assignment','private/addUpdateAssignment.web',8),(11,'Attendance',NULL,-1),(12,'View Attendance','admin/private/viewAttendance.web',11),(13,'Classes',NULL,-1),(14,'Exam Management',NULL,-1),(15,'Update Marks','edu/private/addUpdateMarkParam.web',14),(16,'View Result','edu/private/viewResultParam.web',14),(17,'View Exam List ','edu/private/viewExamList.web',14),(18,'Students','private/showStudents.web',1),(19,'View Teachers','private/showTeachers.web',1),(20,'Leave Management',NULL,-1),(21,'Apply For Leave','private/addUpdateLeaveApplication.web',20),(22,'View Leave Applications ','private/viewLeaveApplication.web',20),(23,'Create Staff','admin/private/createStaff.web',1),(24,'Calender',NULL,-1),(25,'Add Vacation','admin/private/addUpdateVaction.web',24),(26,'View Vacation','private/viewVacation.web',24),(27,'Salary',NULL,-1),(28,'Add Salary Info','admin/private/addUpdateSalary.web',27),(29,'View Sallery Sheet','admin/private/viewSalary.web',27),(30,'Roll Call','admin/private/attendance.web',11);

/*Table structure for table `message` */

DROP TABLE IF EXISTS `message`;

CREATE TABLE `message` (
  `messageId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `messageGroupKey` varchar(16) NOT NULL,
  `senderId` int(10) unsigned NOT NULL,
  `recieverId` int(10) unsigned DEFAULT NULL,
  `messageCreationTime` datetime NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (`messageId`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

/*Data for the table `message` */

insert  into `message`(`messageId`,`messageGroupKey`,`senderId`,`recieverId`,`messageCreationTime`,`message`) values (1,'gTa5eyCgTCXLlczu',20,NULL,'2015-04-12 17:04:00','dfdfdf'),(2,'/Ta5eyC/TCXLlczu',20,NULL,'2015-04-12 17:40:19','ddfdfasad'),(3,'/Ta5eyC/TCXLlczu',20,NULL,'2015-04-12 17:41:25','fgfdsdfdf'),(4,'gTa5eyCgTCXLlczu',20,NULL,'2015-04-12 17:51:47','ssdsasasa'),(5,'gTa5eyCgTCXLlczu',20,NULL,'2015-04-12 17:52:05','ssdsasasaazasasas'),(6,'gTa5eyCgTCXLlczu',20,NULL,'2015-04-12 17:56:03','dsdsdsd'),(7,'gTa5eyCgTCXLlczu',20,NULL,'2015-04-12 18:08:59','ssdsfgdfedewresasa asasas'),(8,'gTa5eyCgTCXLlczu',20,NULL,'2015-04-12 18:09:06','1qweeeeeeeeeewadsdsdaasads'),(9,'gTa5eyCgTCXLlczu',20,NULL,'2015-04-12 23:47:51','<img src=\"http://samples.fileformat.info/format/jpeg/sample/35e126905ffc400c881e8c0ffe035927/3D.JPG?AWSAccessKeyId=0V91BEFA7GM093MEVMG2&Signature=wRMRVYiSjHO%2BV9sH%2BZOune%2FWyn0%3D&Expires=1428860853\"/>'),(10,'IgXg4z69HDG5jM/+',20,NULL,'2015-05-08 00:08:26','dfdfdf'),(11,'IgXg4z69HDG5jM/+',20,NULL,'2015-05-08 00:08:50','dfdfffgghh'),(12,'IgXg4z69HDG5jM/+',20,NULL,'2015-05-08 00:49:33','dfdfdfdf'),(13,'IgXg4z69HDG5jM/+',20,NULL,'2015-05-08 00:49:42','dfdfdf'),(14,'IgXg4z69HDG5jM/+',20,NULL,'2015-05-08 00:50:25','kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk'),(15,'gTa5eyCgTCXLlczu',20,NULL,'2015-05-09 00:16:05','sdsd'),(16,'CeK4MJJWw8SqFGWH',20,NULL,'2015-05-09 00:20:07','qqqqqqqqq'),(17,'yhUoAEa80FKeXY+R',20,NULL,'2015-05-09 00:20:33','sadsd'),(18,'yhUoAEa80FKeXY+R',20,NULL,'2015-05-09 00:20:34',''),(19,'yhUoAEa80FKeXY+R',20,NULL,'2015-05-09 00:20:34',''),(20,'IgXg4z69HDG5jM/p',20,NULL,'2015-05-09 17:37:08','dfdfdf'),(21,'IgXg4z69HDG5jM/p',20,NULL,'2015-05-09 17:41:32','dfdfhghhhhhhhhhhhhhhhhh'),(22,'IgXg4z69HDG5jM/p',20,NULL,'2015-05-09 20:39:29','reredfdferer');

/*Table structure for table `profile` */

DROP TABLE IF EXISTS `profile`;

CREATE TABLE `profile` (
  `profileId` int(10) unsigned NOT NULL,
  `firstName` varchar(64) DEFAULT NULL,
  `lastName` varchar(64) DEFAULT NULL,
  `mobileNo` varchar(20) DEFAULT NULL,
  `dateOfBirth` date DEFAULT NULL,
  `profileImageUrl` varchar(512) DEFAULT 'image/Default_Profile_Picture.png',
  UNIQUE KEY `FK_profile` (`profileId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `profile` */

insert  into `profile`(`profileId`,`firstName`,`lastName`,`mobileNo`,`dateOfBirth`,`profileImageUrl`) values (12,'user12','ahmed','232323232','1987-11-17','image/Default_Profile_Picture.png'),(15,'user15','jaman',NULL,NULL,'image/Default_Profile_Picture.png'),(16,'user16','rafiq',NULL,NULL,'image/Default_Profile_Picture.png'),(17,'user17','nshid',NULL,NULL,'image/Default_Profile_Picture.png'),(18,'user18','iqbal',NULL,NULL,'image/Default_Profile_Picture.png'),(19,'user19','raihan',NULL,NULL,'image/Default_Profile_Picture.png'),(20,'user20','rahaman2','018217160567','1987-11-17','/images/20_1431355845070.jpg'),(21,'user21','haque',NULL,NULL,'image/Default_Profile_Picture.png'),(25,'user25','Goni',NULL,NULL,'image/Default_Profile_Picture.png'),(27,'user27','jafar',NULL,NULL,'image/Default_Profile_Picture.png'),(29,'user29','afrin',NULL,NULL,'image/Default_Profile_Picture.png'),(30,'user30','nusrat',NULL,NULL,'image/Default_Profile_Picture.png'),(31,'user31','yasmin',NULL,NULL,'image/Default_Profile_Picture.png'),(32,'user32','rajon',NULL,NULL,'image/Default_Profile_Picture.png'),(33,'user33','rajib',NULL,NULL,'image/Default_Profile_Picture.png'),(34,'user34','robin',NULL,NULL,'image/Default_Profile_Picture.png'),(35,'user35','pasha',NULL,NULL,'image/Default_Profile_Picture.png'),(36,'user36','aman',NULL,NULL,'image/Default_Profile_Picture.png'),(37,'user37','kaiser',NULL,NULL,'image/Default_Profile_Picture.png'),(38,'user38','raihan',NULL,NULL,'image/Default_Profile_Picture.png'),(39,'anis ','chowdhury',NULL,NULL,'image/Default_Profile_Picture.png'),(40,'animesh','mukharjee',NULL,NULL,'image/Default_Profile_Picture.png'),(41,'shadin','rahman',NULL,NULL,'image/Default_Profile_Picture.png'),(42,'onima ','khan',NULL,NULL,'image/Default_Profile_Picture.png'),(44,NULL,NULL,NULL,NULL,'image/Default_Profile_Picture.png');

/*Table structure for table `rollCall` */

DROP TABLE IF EXISTS `rollCall`;

CREATE TABLE `rollCall` (
  `rc_date` date NOT NULL,
  `rc_teacher_id` int(11) unsigned NOT NULL,
  `rc_class_id` int(11) unsigned NOT NULL,
  `rc_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`rc_id`),
  UNIQUE KEY `NewIndex1` (`rc_date`,`rc_class_id`),
  KEY `FK_rollCall` (`rc_teacher_id`),
  KEY `FK_rollCall_class` (`rc_class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `rollCall` */

insert  into `rollCall`(`rc_date`,`rc_teacher_id`,`rc_class_id`,`rc_id`) values ('2015-03-08',3,1,1),('2015-03-07',3,1,2),('2015-03-06',3,1,3),('2015-03-05',3,1,4),('2015-03-26',4,1,9),('2015-05-09',2,1,10),('2015-06-07',4,1,11);

/*Table structure for table `salaryInfo` */

DROP TABLE IF EXISTS `salaryInfo`;

CREATE TABLE `salaryInfo` (
  `userId` int(10) unsigned NOT NULL,
  `salary` int(11) DEFAULT '0',
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `salaryInfo` */

insert  into `salaryInfo`(`userId`,`salary`) values (30,20003),(40,20000);

/*Table structure for table `staff` */

DROP TABLE IF EXISTS `staff`;

CREATE TABLE `staff` (
  `staffId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `designation` varchar(256) NOT NULL,
  `employeeLevel` varchar(256) DEFAULT NULL,
  `dateOfJoin` date DEFAULT NULL,
  `userId` int(10) unsigned NOT NULL,
  `startingDesignation` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`staffId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `staff` */

insert  into `staff`(`staffId`,`designation`,`employeeLevel`,`dateOfJoin`,`userId`,`startingDesignation`) values (1,'fresher','3','2015-04-29',44,NULL);

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `st_student_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `st_user_id` int(11) unsigned NOT NULL,
  `st_class_id` int(11) unsigned NOT NULL,
  `st_admission_date` date DEFAULT NULL,
  `st_parent_user_id` int(11) unsigned DEFAULT NULL,
  `st_roll` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`st_student_id`),
  UNIQUE KEY `FK_student` (`st_user_id`,`st_student_id`,`st_class_id`,`st_parent_user_id`),
  UNIQUE KEY `FK_student_2` (`st_parent_user_id`),
  KEY `NewIndex1` (`st_class_id`),
  KEY `NewIndex2` (`st_roll`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `student` */

insert  into `student`(`st_student_id`,`st_user_id`,`st_class_id`,`st_admission_date`,`st_parent_user_id`,`st_roll`) values (2,27,1,NULL,NULL,'1'),(3,29,1,'1987-11-17',NULL,'2'),(4,31,1,'1987-11-17',NULL,'3'),(5,33,2,'2012-02-16',NULL,'5'),(6,35,2,'2012-04-04',NULL,'45'),(7,36,2,'2012-02-12',NULL,'46'),(8,37,2,'2012-02-12',NULL,'46'),(9,38,2,'2012-02-12',NULL,'47'),(10,39,1,'2015-02-01',NULL,'50'),(11,42,1,'2012-02-12',NULL,'67');

/*Table structure for table `teacher` */

DROP TABLE IF EXISTS `teacher`;

CREATE TABLE `teacher` (
  `tr_teacher_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tr_user_id` int(11) unsigned NOT NULL,
  `tr_designation` varchar(32) NOT NULL,
  `tr_joining_date` date NOT NULL,
  PRIMARY KEY (`tr_teacher_id`),
  UNIQUE KEY `FK_teacher` (`tr_user_id`),
  KEY `NewIndex1` (`tr_designation`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `teacher` */

insert  into `teacher`(`tr_teacher_id`,`tr_user_id`,`tr_designation`,`tr_joining_date`) values (1,25,'Head Master','1987-11-17'),(2,30,'lecturer','1987-11-17'),(3,32,'Assistant teacher','2015-10-02'),(4,34,'Assistant teacher','2012-02-12'),(5,40,'Assistant teacher','2012-02-12'),(6,41,'Assistant teacher','2012-02-12');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `userId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(64) NOT NULL,
  `email` varchar(128) NOT NULL,
  `userType` varchar(16) DEFAULT 'admin',
  PRIMARY KEY (`userId`) USING BTREE,
  UNIQUE KEY `UNI_USER_NAME` (`username`),
  UNIQUE KEY `UNI_EMAL` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`userId`,`username`,`password`,`email`,`userType`) values (20,'safayat','$2a$10$D8127zXcxziWTJEgYC2qRuI4GQV26KwmZVFjAUdL3LInsyhiqOKG.','saf567@cefalo.com','admin'),(25,'r','r','r@cefalo.com','teacher'),(27,'r1','$2a$10$XEqcRJ0.CgUz4vR07TRBuuiIcJNybO1E3cSV6XS6nK133hvgUYZ.2','r1@cefalo.com','student'),(29,'r2','$2a$10$2bU/Bgz.RPauQEXIAnth9uGqyQGTXhlsOF1CafABaPibzTY31aUNi','r2@cefalo.com','student'),(30,'t2','$2a$10$VGsFagFL0JwPwf./GCm4w.9SLPnp1Bx/yJi1pp9cZ8JpPhhTEcVaS','t2@cefalo.com','teacher'),(31,'s10','$2a$10$xsoMiTTnBgBnBRGd7jWck.suHDYfJWVo.g4JTq6ViyUp033cuEKJO','s10@cefalo.com','student'),(32,'safayatasa','$2a$10$D8127zXcxziWTJEgYC2qRuI4GQV26KwmZVFjAUdL3LInsyhiqOKG.','safayatzxzxz@cefalo.com','teacher'),(33,'safayatSt','$2a$10$saGNHeqUWqwoD6hHGgQ7zOld7VPLMq17w1fBxoAwUuP1IQmdjQqxq','safayatSt@cefalo.com','student'),(34,'tch100','$2a$10$BrLK7yLRNJydNZ5MgdIXUOXxVTmHRxBocV4MAUdiHvx5DyPsRh8nu','tch100@gmail.com','teacher'),(35,'st100','$2a$10$86waINa7jdsXV8TlwQ/xDOaYC4hUOu8binl17sgFIBZcKhZv.SQJ2','st@gmail.com','student'),(36,'st101','$2a$10$Rwl7rwRyyAhd5C1tshYi2uPEQFiFtmqjoFtjNOD065Go077IBTq.m','st101@gmail.com','student'),(37,'st102','$2a$10$UkavKmxBUlsVI0cFfKvmh.Csd3xWcxrHllVYISpLJ0/zuQ/whz0kG','st102@gmail.com','student'),(38,'st103','$2a$10$K3zq2L6x/ehW6C.IGMDWGe.wSNGXLzL/4B1mUJ3qt0GI9zIOm/CrW','st103@gmail.com','student'),(39,'safayat50','$2a$10$itB02amLIZr5zj2/BermAuuBG5Kf8igNCn1bnmyV/K3GrEKR5zuni','safayat50@cefalo.com','student'),(40,'safayat_t','$2a$10$Pu6f.ULOVfvyfqaGhWGsbe1pyZhrFcQqx/M.5Xe393fxB7Nq0xXdS','safayat_t@yahoo.com','teacher'),(41,'somir','$2a$10$XdeU8xr0DoZ.8jL5wysQi.cS8mbQZCyNxSS9xIiwS2YwgKmj6ZFoa','somir@yahoo.com','teacher'),(42,'student_rajib','$2a$10$KA7Wai6VVBk7sf4AhjKIEuapoF8PNR33BJ4hOGzyAcdzmqdZgJnP6','student_rajib@cefalo.com','student'),(44,'staff1','$2a$10$.PL7L9FOK8VEdbbznsvKoOjPgLVQ4pLt34DXSyQU5TBYDtCaicJmG','staff1@gmail.com','staff');

/*Table structure for table `vacation` */

DROP TABLE IF EXISTS `vacation`;

CREATE TABLE `vacation` (
  `vacationName` varchar(256) NOT NULL,
  `vacationId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  PRIMARY KEY (`vacationId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `vacation` */

insert  into `vacation`(`vacationName`,`vacationId`,`startDate`,`endDate`) values ('Eid Vacation',1,'2015-05-27','2015-05-30'),('Durga Puja',2,'2015-05-29','2015-05-30'),('Independence day  ',3,'2015-09-15','2015-05-30');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
