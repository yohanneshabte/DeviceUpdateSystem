-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 09, 2020 at 02:53 AM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dit`
--
CREATE DATABASE IF NOT EXISTS `dit` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `dit`;

-- --------------------------------------------------------

--
-- Table structure for table `drive`
--

DROP TABLE IF EXISTS `drive`;
CREATE TABLE IF NOT EXISTS `drive` (
  `DriveID` varchar(50) NOT NULL,
  `DriveSize` int(11) NOT NULL,
  `DriveSpinDate` datetime NOT NULL,
  `DriveLocation` varchar(50) NOT NULL,
  `DriveMake` varchar(50) NOT NULL COMMENT 'if network drive or hard drive',
  `DriveAge` int(11) NOT NULL,
  `DriveTypeID` int(11) NOT NULL,
  PRIMARY KEY (`DriveID`),
  KEY `DriveTypeID` (`DriveTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `drive`
--

INSERT INTO `drive` (`DriveID`, `DriveSize`, `DriveSpinDate`, `DriveLocation`, `DriveMake`, `DriveAge`, `DriveTypeID`) VALUES
('1', 12, '2020-06-08 00:00:00', 'Library Third Floor', 'Network', 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `drive type`
--

DROP TABLE IF EXISTS `drive type`;
CREATE TABLE IF NOT EXISTS `drive type` (
  `DriveTypeID` int(11) NOT NULL,
  `DriveTypeName` varchar(50) NOT NULL,
  PRIMARY KEY (`DriveTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `drive type`
--

INSERT INTO `drive type` (`DriveTypeID`, `DriveTypeName`) VALUES
(1, 'Near Storage'),
(2, 'Cold Storage'),
(3, 'Archive Storage');

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
CREATE TABLE IF NOT EXISTS `project` (
  `ProjectID` varchar(50) NOT NULL,
  `ProjectDate` datetime NOT NULL,
  `ProjectSize` float NOT NULL,
  `ProjectName` varchar(50) NOT NULL,
  `ProjectPriorityID` int(11) NOT NULL,
  `ProjectStatusID` int(11) NOT NULL,
  `ProjectTypeID` int(11) NOT NULL,
  PRIMARY KEY (`ProjectID`),
  KEY `ProjectPriorityID` (`ProjectPriorityID`,`ProjectStatusID`,`ProjectTypeID`),
  KEY `ProjectStatusID` (`ProjectStatusID`),
  KEY `ProjectTypeID` (`ProjectTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`ProjectID`, `ProjectDate`, `ProjectSize`, `ProjectName`, `ProjectPriorityID`, `ProjectStatusID`, `ProjectTypeID`) VALUES
('P2020AB328', '2020-06-08 00:00:00', 15.8, 'Douglas R. Moore ', 3, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `project priority`
--

DROP TABLE IF EXISTS `project priority`;
CREATE TABLE IF NOT EXISTS `project priority` (
  `ProjectPriorityID` int(11) NOT NULL,
  `ProjectPriorityName` varchar(50) NOT NULL,
  PRIMARY KEY (`ProjectPriorityID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `project priority`
--

INSERT INTO `project priority` (`ProjectPriorityID`, `ProjectPriorityName`) VALUES
(1, 'Low'),
(2, 'Medium'),
(3, 'High');

-- --------------------------------------------------------

--
-- Table structure for table `project status`
--

DROP TABLE IF EXISTS `project status`;
CREATE TABLE IF NOT EXISTS `project status` (
  `ProjectStatusID` int(11) NOT NULL,
  `ProjectStatusName` varchar(50) NOT NULL COMMENT 'Indicates where the project sits on the completion flow',
  PRIMARY KEY (`ProjectStatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `project status`
--

INSERT INTO `project status` (`ProjectStatusID`, `ProjectStatusName`) VALUES
(1, 'In Progress'),
(2, 'Completed'),
(3, 'Archived');

-- --------------------------------------------------------

--
-- Table structure for table `project type`
--

DROP TABLE IF EXISTS `project type`;
CREATE TABLE IF NOT EXISTS `project type` (
  `ProjectTypeID` int(11) NOT NULL,
  `ProjectTypeName` varchar(50) NOT NULL COMMENT 'Indicates whether or not the project will be deleted after a certain amount of time determined by the creative lead',
  PRIMARY KEY (`ProjectTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `project type`
--

INSERT INTO `project type` (`ProjectTypeID`, `ProjectTypeName`) VALUES
(1, 'Essential'),
(2, 'Non-Essential');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `drive`
--
ALTER TABLE `drive`
  ADD CONSTRAINT `drive_ibfk_1` FOREIGN KEY (`DriveTypeID`) REFERENCES `drive type` (`DriveTypeID`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `project`
--
ALTER TABLE `project`
  ADD CONSTRAINT `project_ibfk_1` FOREIGN KEY (`ProjectPriorityID`) REFERENCES `project priority` (`ProjectPriorityID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `project_ibfk_2` FOREIGN KEY (`ProjectStatusID`) REFERENCES `project status` (`ProjectStatusID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `project_ibfk_3` FOREIGN KEY (`ProjectTypeID`) REFERENCES `project type` (`ProjectTypeID`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
