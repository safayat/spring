
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

















Error creating bean with name 'profileController': Injection of autowired dependencies failed; nested exception is
org.springframework.beans.factory.BeanCreationException: Could not autowire field: private com.mkyong.profile.service.ProfileService
com.mkyong.profile.controller.ProfileController.profileService; nested exception
is org.springframework.beans.factory.BeanCreationException: Error creating bean
with name 'profileService': Injection of autowired dependencies failed; nested exception
is org.springframework.beans.factory.BeanCreationException: Could not autowire field: private
com.mkyong.profile.dao.ProfileDAO com.mkyong.profile.service.ProfileService.profileDAO; nested
exception is org.springframework.beans.factory.BeanCreationException: Error creating bean with name 'profileDAO':
Injection of autowired dependencies failed; nested exception is org.springframework.beans.factory.BeanCreationException:
Could not autowire method: public void com.mkyong.common.dao.impl.CommonDaoImpl.setSessionFactory(org.hibernate.SessionFactory);
nested exception is org.springframework.beans.factory.BeanCreationException: Error creating bean with name 'sessionFactory'
defined in ServletContext resource [/WEB-INF/mvc-dispatcher-servlet.xml]: Invocation of init method failed; nested exception is org.hibernate.AnnotationException: No identifier specified for entity: com.mkyong.clazz.model.Attendance
