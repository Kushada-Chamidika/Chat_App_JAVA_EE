-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.32-log - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for chatapplicationassignment
CREATE DATABASE IF NOT EXISTS `chatapplicationassignment` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `chatapplicationassignment`;

-- Dumping structure for table chatapplicationassignment.activestatus
CREATE TABLE IF NOT EXISTS `activestatus` (
  `idactiveStatus` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `status` varchar(15) NOT NULL,
  `lastSeen` datetime NOT NULL,
  `isActive` int(11) NOT NULL,
  PRIMARY KEY (`idactiveStatus`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- Dumping data for table chatapplicationassignment.activestatus: ~8 rows (approximately)
/*!40000 ALTER TABLE `activestatus` DISABLE KEYS */;
INSERT IGNORE INTO `activestatus` (`idactiveStatus`, `email`, `status`, `lastSeen`, `isActive`) VALUES
	(1, '1999kushada@gmail.com', 'Active', '2021-04-26 17:06:00', 1),
	(2, 'saman98@gmail.com', 'Active', '2021-01-21 15:08:41', 1),
	(17, 'kassa@gmail.com', 'Inactive', '2021-01-20 16:33:58', 1),
	(18, 'amal@gmail.com', 'Inactive', '2021-01-20 16:34:18', 1),
	(19, 'sandun@gmail.com', 'Inactive', '2021-01-20 22:44:04', 1),
	(20, 'kavishka@gmail.com', 'Inactive', '2021-01-20 22:49:01', 1),
	(21, '1999kushada@gamil.com', 'Inactive', '2021-04-26 17:05:28', 1),
	(22, 'chanya@gmail.com', 'Active', '2022-01-27 21:19:49', 1);
/*!40000 ALTER TABLE `activestatus` ENABLE KEYS */;

-- Dumping structure for table chatapplicationassignment.groupchat
CREATE TABLE IF NOT EXISTS `groupchat` (
  `idgroupChat` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `content` varchar(500) NOT NULL,
  `cratedTime` datetime NOT NULL,
  `isActive` int(11) NOT NULL,
  PRIMARY KEY (`idgroupChat`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- Dumping data for table chatapplicationassignment.groupchat: ~18 rows (approximately)
/*!40000 ALTER TABLE `groupchat` DISABLE KEYS */;
INSERT IGNORE INTO `groupchat` (`idgroupChat`, `username`, `content`, `cratedTime`, `isActive`) VALUES
	(20, 'kushada99', 'Hiiii How are You?', '2021-01-20 16:12:33', 1),
	(21, 'saman98', 'Um fine', '2021-01-20 16:13:35', 1),
	(22, 'saman98', 'What about You?', '2021-01-20 16:13:44', 1),
	(23, 'kushada99', 'I also fine', '2021-01-20 16:13:52', 1),
	(24, 'kushada99', 'hiiiii', '2021-01-20 17:34:35', 1),
	(25, 'kushada99', 'komada', '2021-01-20 17:36:23', 1),
	(26, 'kushada99', 'dcsdcsd', '2021-01-20 17:41:25', 1),
	(27, 'kushada99', 'ethin ethin', '2021-01-20 17:42:16', 1),
	(28, 'saman98', 'hiii guys', '2021-01-20 22:32:47', 1),
	(29, 'kushada99', 'hellooo komada ethin', '2021-01-20 22:32:57', 1),
	(30, 'saman98', 'mokda wenne ohe', '2021-01-20 22:33:06', 1),
	(31, 'kushada99', 'aulak na ennawa', '2021-01-20 22:33:12', 1),
	(32, 'kushada99', 'helloo there', '2021-01-20 22:50:34', 1),
	(33, 'saman98', 'moko wenne', '2021-01-20 22:50:41', 1),
	(34, 'kushada99', 'kalada enne', '2021-01-20 22:50:48', 1),
	(35, 'saman98', 'ow kala enne oya moko kalanne', '2021-01-20 22:51:04', 1),
	(36, 'kushada99', 'fswferfcerfcf', '2021-01-21 13:36:04', 1),
	(37, 'chanya99', 'csdc', '2022-01-27 21:20:10', 1);
/*!40000 ALTER TABLE `groupchat` ENABLE KEYS */;

-- Dumping structure for table chatapplicationassignment.individualchat
CREATE TABLE IF NOT EXISTS `individualchat` (
  `idindividualChat` int(11) NOT NULL AUTO_INCREMENT,
  `senderUname` varchar(255) NOT NULL,
  `receiverUname` varchar(255) NOT NULL,
  `content` varchar(500) NOT NULL,
  `createdTime` datetime NOT NULL,
  `isActive` int(11) NOT NULL,
  PRIMARY KEY (`idindividualChat`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- Dumping data for table chatapplicationassignment.individualchat: ~24 rows (approximately)
/*!40000 ALTER TABLE `individualchat` DISABLE KEYS */;
INSERT IGNORE INTO `individualchat` (`idindividualChat`, `senderUname`, `receiverUname`, `content`, `createdTime`, `isActive`) VALUES
	(1, 'kushada99', 'saman98', 'Helloooooooo', '2021-01-20 17:50:17', 1),
	(2, 'kushada99', 'saman98', 'Helloooooooo', '2021-01-20 17:50:17', 1),
	(3, 'saman98', 'kushada99', 'Helloooooooo', '2021-01-20 17:50:17', 1),
	(4, 'kushada99', 'saman98', 'Helloooooooo', '2021-01-20 19:03:17', 1),
	(5, 'kushada99', 'saman98', 'hii komada ethin oyata', '2021-01-20 20:24:07', 1),
	(6, 'kushada99', 'saman98', 'hellooo there', '2021-01-20 20:39:21', 1),
	(7, 'kushada99', 'kasuu00', 'hiii brother', '2021-01-20 20:39:29', 1),
	(8, 'kushada99', 'kasuu00', 'komada ethin', '2021-01-20 20:39:35', 1),
	(9, 'kushada99', 'ama123', 'komada yalu', '2021-01-20 20:39:47', 1),
	(10, 'kushada99', 'ama123', 'mkda wenne me dawas wala', '2021-01-20 20:39:53', 1),
	(11, 'kushada99', 'saman98', 'hiiii komada oyata', '2021-01-20 21:56:47', 1),
	(12, 'saman98', 'kushada99', 'ethin', '2021-01-20 21:58:51', 1),
	(13, 'saman98', 'kushada99', 'mokda wenne', '2021-01-20 21:59:01', 1),
	(14, 'kushada99', 'saman98', 'mona wenanda hndin innawa', '2021-01-20 21:59:11', 1),
	(15, 'kushada99', 'saman98', 'kawada', '2021-01-20 22:33:29', 1),
	(16, 'saman98', 'kushada99', 'ooo kawa', '2021-01-20 22:33:48', 1),
	(17, 'kushada99', 'saman98', 'oya moko kalanne', '2021-01-20 22:33:59', 1),
	(18, 'saman98', 'kushada99', 'special mokuth na', '2021-01-20 22:34:07', 1),
	(19, 'kushada99', 'saman98', 'mmmm', '2021-01-20 22:45:43', 1),
	(20, 'saman98', 'kushada99', 'aaaaaa', '2021-01-20 22:46:50', 1),
	(21, 'saman98', 'kushada99', 'hiiii', '2021-01-20 22:51:26', 1),
	(22, 'kushada99', 'saman98', 'komda', '2021-01-20 22:51:34', 1),
	(23, 'kushada99', 'saman98', 'ssfcsfcsfsd', '2021-01-21 14:48:23', 1),
	(24, 'chanya99', 'kushada99', 'sdcdscsd', '2022-01-27 21:20:40', 1);
/*!40000 ALTER TABLE `individualchat` ENABLE KEYS */;

-- Dumping structure for table chatapplicationassignment.users
CREATE TABLE IF NOT EXISTS `users` (
  `idusers` int(11) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `isActive` int(11) DEFAULT NULL,
  PRIMARY KEY (`idusers`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;

-- Dumping data for table chatapplicationassignment.users: ~8 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT IGNORE INTO `users` (`idusers`, `fullname`, `email`, `username`, `password`, `dateCreated`, `isActive`) VALUES
	(34, 'Kushada Chamidika', '1999kushada@gmail.com', 'kushada99', '12345', '2021-01-19 16:19:06', 1),
	(35, 'Saman Kumara', 'saman98@gmail.com', 'saman98', '6789', '2021-01-19 20:07:43', 1),
	(54, 'Kasun Siripath', 'kassa@gmail.com', 'kasuu00', '234', '2021-01-20 16:33:58', 1),
	(55, 'Amal Perera', 'amal@gmail.com', 'ama123', '12345', '2021-01-20 16:34:18', 1),
	(56, 'Sandun Malsanka', 'sandun@gmail.com', 'sandun34', '12345', '2021-01-20 22:44:04', 1),
	(57, 'Kavishka Perera', 'kavishka@gmail.com', 'kavishka33', '121212', '2021-01-20 22:49:01', 1),
	(58, 'kushada', '1999kushada@gamil.com', 'kushada1234', 'abc1234', '2021-04-26 17:05:28', 1),
	(59, 'Chanithya', 'chanya@gmail.com', 'chanya99', 'chani1234', '2022-01-27 21:19:37', 1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
