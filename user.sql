
/*create database `tourism`;*/
DROP table if exists `tourism`.`user`;
Create Table `tourism`.`user`(
`userId` int unsigned not null auto_increment,
`username` varchar(20) not null,
`password` varchar(64) not null,
`email` varchar(128) not null,
 primary key (`userId`) using btree,
 unique key `UNI_USER_NAME` (`username`),
 unique key `UNI_EMAL` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

DROP table if exists `tourism`.`profile`;
Create Table `tourism`.`profile`(
`profileId` int unsigned not null auto_increment,
`firstName` varchar(64),
`lastName` varchar(64),
`mobileNo` varchar(20),
`dateOfBirth` date,
 primary key (`profileId`) using btree
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
