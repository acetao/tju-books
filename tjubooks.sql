# MySQL-Front 5.1  (Build 3.57)

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE */;
/*!40101 SET SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES */;
/*!40103 SET SQL_NOTES='ON' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;


# Host: localhost    Database: tjubooks
# ------------------------------------------------------
# Server version 5.5.21

DROP DATABASE IF EXISTS `tjubooks`;
CREATE DATABASE `tjubooks` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `tjubooks`;

#
# Source for table attentbook
#

DROP TABLE IF EXISTS `attentbook`;
CREATE TABLE `attentbook` (
  `attentionId` int(11) NOT NULL,
  `bookid` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `attentionTime` date DEFAULT NULL,
  PRIMARY KEY (`attentionId`),
  KEY `FK_attentionUser` (`userid`),
  KEY `FK_bookAttented` (`bookid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table attentbook
#
LOCK TABLES `attentbook` WRITE;
/*!40000 ALTER TABLE `attentbook` DISABLE KEYS */;

/*!40000 ALTER TABLE `attentbook` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table book
#

DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `bookid` int(11) NOT NULL AUTO_INCREMENT,
  `categoryid` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `bookname` varchar(50) DEFAULT NULL,
  `image` mediumblob,
  `author` varchar(100) DEFAULT NULL,
  `Publisher` varchar(50) DEFAULT NULL,
  `isbn` varchar(15) DEFAULT NULL,
  `specialStatement` varchar(500) DEFAULT NULL,
  `introduction` varchar(5000) DEFAULT NULL,
  `publishdate` date DEFAULT NULL,
  `unlinedate` date DEFAULT NULL,
  `state` varchar(10) DEFAULT NULL,
  `price` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`bookid`),
  KEY `FK_categoryRelation` (`categoryid`),
  KEY `FK_sellRelation` (`userid`),
  KEY `bookname` (`bookname`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='存放书籍的相关信息';

#
# Dumping data for table book
#
LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;

INSERT INTO `book` VALUES (1,33751552,1,'算法设计',NULL,'田飞鹏','Bird 出版社','9787111187773','',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table category
#

DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `categoryid` int(11) NOT NULL,
  `cname` varchar(40) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  PRIMARY KEY (`categoryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='存储有关分类的信息，分类的定义最多为四级，用一个32位的整数来存储，每8位存储一级分类，按从高位到低位的顺序，整数的1-';

#
# Dumping data for table category
#
LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;

INSERT INTO `category` VALUES (16777216,'公共类书籍',1);
INSERT INTO `category` VALUES (16842752,'数学类',2);
INSERT INTO `category` VALUES (16908288,'政史类',2);
INSERT INTO `category` VALUES (16973824,'公共计算机',2);
INSERT INTO `category` VALUES (17039360,'公共选修课',2);
INSERT INTO `category` VALUES (33554432,'专业性书籍',1);
INSERT INTO `category` VALUES (33619968,'化工学院',2);
INSERT INTO `category` VALUES (33620224,'化学工程与工艺',3);
INSERT INTO `category` VALUES (33620480,'过程装备与控制工程',3);
INSERT INTO `category` VALUES (33620736,'生物工程',3);
INSERT INTO `category` VALUES (33620992,'制药工程',3);
INSERT INTO `category` VALUES (33621248,'分子科学与工程',3);
INSERT INTO `category` VALUES (33621504,'应用化学（工）',3);
INSERT INTO `category` VALUES (33621760,'食品科学与工程',3);
INSERT INTO `category` VALUES (33685504,'精仪学院',2);
INSERT INTO `category` VALUES (33685760,'测控技术与仪器',3);
INSERT INTO `category` VALUES (33686016,'信息工程',3);
INSERT INTO `category` VALUES (33686272,'电子科学与技术',3);
INSERT INTO `category` VALUES (33686528,'生物医学工程',3);
INSERT INTO `category` VALUES (33686784,'光电子技术科学',3);
INSERT INTO `category` VALUES (33751040,'软件',2);
INSERT INTO `category` VALUES (33751296,'动画',3);
INSERT INTO `category` VALUES (33751552,'软件工程',3);
INSERT INTO `category` VALUES (33816576,'自动化',2);
INSERT INTO `category` VALUES (33816832,'电气工程及其自动化',3);
INSERT INTO `category` VALUES (33817088,'自动化',3);
INSERT INTO `category` VALUES (33882112,'管理与经济学部',2);
INSERT INTO `category` VALUES (33882368,'工业工程',3);
INSERT INTO `category` VALUES (33882624,'信息管理与信息系统',3);
INSERT INTO `category` VALUES (33882880,'财务管理',3);
INSERT INTO `category` VALUES (33883136,'工商管理',3);
INSERT INTO `category` VALUES (33883392,'电子商务',3);
INSERT INTO `category` VALUES (33883648,'物流工程',3);
INSERT INTO `category` VALUES (33883904,'工程管理',3);
INSERT INTO `category` VALUES (33947648,'文法学院',2);
INSERT INTO `category` VALUES (33947904,'英语',3);
INSERT INTO `category` VALUES (33948160,'汉语',3);
INSERT INTO `category` VALUES (33948416,'法学',3);
INSERT INTO `category` VALUES (34013184,'药学院',2);
INSERT INTO `category` VALUES (34013440,'药学',3);
INSERT INTO `category` VALUES (34078720,'理学院',2);
INSERT INTO `category` VALUES (34078976,'应用物理',3);
INSERT INTO `category` VALUES (34079232,'应用数学',3);
INSERT INTO `category` VALUES (34079488,'应用化学',3);
INSERT INTO `category` VALUES (34144256,'求是学部',2);
INSERT INTO `category` VALUES (34144512,'电工电子',3);
INSERT INTO `category` VALUES (34144768,'化工材料',3);
INSERT INTO `category` VALUES (34145024,'建筑工程（茅以升班）',3);
INSERT INTO `category` VALUES (34209792,'建筑',2);
INSERT INTO `category` VALUES (34210048,'建筑学',3);
INSERT INTO `category` VALUES (34210304,'城市规划',3);
INSERT INTO `category` VALUES (34210560,'艺术设计',3);
INSERT INTO `category` VALUES (34275328,'机械学院',2);
INSERT INTO `category` VALUES (34275584,'工程力学',3);
INSERT INTO `category` VALUES (34275840,'机械设计制造及其自动化',3);
INSERT INTO `category` VALUES (34276096,'工业设计',3);
INSERT INTO `category` VALUES (34276352,'热能与动力工程',3);
INSERT INTO `category` VALUES (34340864,'建工学院',2);
INSERT INTO `category` VALUES (34341120,'土木工程',3);
INSERT INTO `category` VALUES (34341376,'水利水电',3);
INSERT INTO `category` VALUES (34341632,'港口',3);
INSERT INTO `category` VALUES (34341888,'海船',3);
INSERT INTO `category` VALUES (34406400,'职教',2);
INSERT INTO `category` VALUES (34406656,'计算机科学与技术',3);
INSERT INTO `category` VALUES (34471936,'计算机学院',2);
INSERT INTO `category` VALUES (34472192,'计算机科学与技术',3);
INSERT INTO `category` VALUES (34537472,'环境',2);
INSERT INTO `category` VALUES (34537728,'环境工程',3);
INSERT INTO `category` VALUES (34537984,'环境科学',3);
INSERT INTO `category` VALUES (34538240,'建筑环境与设备工程',3);
INSERT INTO `category` VALUES (34603008,'电子信息工程学院',2);
INSERT INTO `category` VALUES (34603264,'电子信息工程 ',3);
INSERT INTO `category` VALUES (34603520,'电子科学与技术',3);
INSERT INTO `category` VALUES (34603776,'集成电路',3);
INSERT INTO `category` VALUES (34604032,'通信工程',3);
INSERT INTO `category` VALUES (34604288,'集成电路设计与集成系统',3);
INSERT INTO `category` VALUES (34604544,'物联网工程',3);
INSERT INTO `category` VALUES (34668544,'材料',2);
INSERT INTO `category` VALUES (34668800,'材料科学与工程',3);
INSERT INTO `category` VALUES (34669056,'材料成型及控制工程',3);
INSERT INTO `category` VALUES (34669312,'材料化学',3);
INSERT INTO `category` VALUES (50331648,'考研考级出国及认证考试类',1);
INSERT INTO `category` VALUES (50397184,'考研',2);
INSERT INTO `category` VALUES (50462720,'四六级',2);
INSERT INTO `category` VALUES (50528256,'托福',2);
INSERT INTO `category` VALUES (50593792,'雅思',2);
INSERT INTO `category` VALUES (50659328,'GRE',2);
INSERT INTO `category` VALUES (50724864,'商务英语',2);
INSERT INTO `category` VALUES (50790400,'专业认证考试',2);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table requestbook
#

DROP TABLE IF EXISTS `requestbook`;
CREATE TABLE `requestbook` (
  `requestId` int(11) NOT NULL,
  `userid` int(11) DEFAULT NULL,
  `reqBookName` varchar(50) DEFAULT NULL,
  `reqBookIntroduce` varchar(1000) DEFAULT NULL,
  `reqDate` date DEFAULT NULL,
  `hasResponse` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`requestId`),
  KEY `FK_reqBookUserRelation` (`userid`),
  KEY `reqBookName` (`reqBookName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table requestbook
#
LOCK TABLES `requestbook` WRITE;
/*!40000 ALTER TABLE `requestbook` DISABLE KEYS */;

/*!40000 ALTER TABLE `requestbook` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table user
#

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL DEFAULT '0',
  `password` varchar(20) DEFAULT NULL,
  `gender` char(2) DEFAULT NULL,
  `college` varchar(30) DEFAULT NULL,
  `marjor` varchar(30) DEFAULT NULL,
  `grade` varchar(20) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `qq` varchar(20) DEFAULT NULL,
  `cellphone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `username` (`username`),
  KEY `AK_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='users'' imformation';

#
# Dumping data for table user
#
LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;

INSERT INTO `user` VALUES (1,'flybirdtian','123456','男','软件学院','软件工程','2009级','flybirdtian@163.com','1061903350','13821178532');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

#
#  Foreign keys for table attentbook
#

ALTER TABLE `attentbook`
ADD CONSTRAINT `FK_attentionUser` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`),
ADD CONSTRAINT `FK_bookAttented` FOREIGN KEY (`bookid`) REFERENCES `book` (`bookid`);

#
#  Foreign keys for table book
#

ALTER TABLE `book`
ADD CONSTRAINT `FK_categoryRelation` FOREIGN KEY (`categoryid`) REFERENCES `category` (`categoryid`),
ADD CONSTRAINT `FK_sellRelation` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`);

#
#  Foreign keys for table requestbook
#

ALTER TABLE `requestbook`
ADD CONSTRAINT `FK_reqBookUserRelation` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`);


/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
