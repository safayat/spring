
create database `tourism`;
Create Table `tourism`.`login`(
`userId` int unsigned not null auto_increment,
`userName` varchar(20) not null,
`password` varchar(64) not null,
 primary key (`userId`) using btree,
 unique key `UNI_USER_NAME` (`userName`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

Create Table `tourism`.`userInfo`(
`userInfoId` int unsigned not null auto_increment,
`loginId` int unsigned not null,
`firstName` varchar(64),
`lastName` varchar(64),
`mobileNo` varchar(20),
 primary key (`userInfoId`) using btree,
 unique key `UNI_USER_NAME` (`loginId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
