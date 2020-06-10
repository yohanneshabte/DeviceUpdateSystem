-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 10, 2020 at 03:46 AM
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
  `DriveSize` varchar(25) NOT NULL,
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
('Africa', '21.81TB', '2020-06-09 00:00:00', 'Third Floor Library', 'Network', 5, 1),
('America', '21.81TB', '2020-06-09 00:00:00', 'Third Floor Library', 'Network', 5, 1),
('Asia', '21.81TB', '2020-06-09 00:00:00', 'Third Floor Library', 'Network', 5, 1),
('WS 04 POST', '931.5GB', '2020-01-22 00:00:00', 'Studio 01', 'Hard Drive', 3, 2);

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
  `ProjectID` varchar(200) NOT NULL,
  `ProjectDate` datetime NOT NULL,
  `ProjectSize` varchar(20) NOT NULL,
  `ProjectName` varchar(500) NOT NULL,
  `ProjectPriorityID` int(11) NOT NULL,
  `ProjectStatusID` int(11) NOT NULL,
  `ProjectTypeID` int(11) NOT NULL,
  `projectLocation` varchar(50) NOT NULL COMMENT 'which drive project is located in',
  PRIMARY KEY (`ProjectID`),
  KEY `ProjectPriorityID` (`ProjectPriorityID`,`ProjectStatusID`,`ProjectTypeID`),
  KEY `ProjectStatusID` (`ProjectStatusID`),
  KEY `ProjectTypeID` (`ProjectTypeID`),
  KEY `projectLocation` (`projectLocation`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`ProjectID`, `ProjectDate`, `ProjectSize`, `ProjectName`, `ProjectPriorityID`, `ProjectStatusID`, `ProjectTypeID`, `projectLocation`) VALUES
('Africa_00000', '2020-06-09 22:18:00', '38.36GB', 'Default', 2, 1, 1, 'Africa'),
('Africa_000000 LIBRARY', '2020-06-09 22:18:08', '0B', 'Default', 2, 1, 1, 'Africa'),
('Africa_000000 MSU Sports Lower Thirds', '2020-06-09 22:18:08', '7.4GB', 'Default', 2, 1, 1, 'Africa'),
('Africa_0000000 Style Guide for titles', '2020-06-09 22:18:10', '1.64GB', 'Default', 2, 1, 1, 'Africa'),
('Africa_0000000 Style Guide of organization folders', '2020-06-09 22:18:10', '97.38GB', 'Default', 2, 1, 1, 'Africa'),
('Africa_0000000000Africa', '2020-06-09 22:18:11', '1.84MB', 'Default', 2, 1, 1, 'Africa'),
('Africa_2016AA385 ', '2020-06-09 22:18:11', '745.45GB', ' Jason Burns STEM opputunities in Agriculture', 2, 1, 1, 'Africa'),
('Africa_2018AA649', '2020-06-09 22:18:15', '257.85KB', ' MNSU vs Minnesota Crookston', 2, 1, 1, 'Africa'),
('Africa_2018AA662 ', '2020-06-09 22:18:15', '230.29GB', ' Graphics FY18', 2, 1, 1, 'Africa'),
('Africa_2018AA663 ', '2020-06-09 22:18:37', '17.02GB', ' Worlds Got Talent 3', 2, 1, 1, 'Africa'),
('Africa_2019AA007', '2020-06-09 22:18:37', '3.46MB', 'Default', 2, 1, 1, 'Africa'),
('Africa_2019AA814', '2020-06-09 22:18:37', '3.81GB', 'Lunch-Walks-V001', 2, 1, 1, 'Africa'),
('Africa_2019AA815 ', '2020-06-09 22:18:37', '37.09GB', ' GX FY19', 2, 1, 1, 'Africa'),
('Africa_2019AA857', '2020-06-09 22:18:40', '144.15GB', ' Does the Christian God Exist', 2, 1, 1, 'Africa'),
('Africa_2019AA858 ', '2020-06-09 22:18:41', '306.58GB', ' SBDC Promos', 2, 1, 1, 'Africa'),
('Africa_2019AA884 ', '2020-06-09 22:18:41', '116.94GB', ' MBB vs Concordia-St Paul', 2, 1, 1, 'Africa'),
('Africa_2019AA887 ', '2020-06-09 22:18:41', '97.18GB', ' MBB vs North Central University', 2, 1, 1, 'Africa'),
('Africa_2019AA888 ', '2020-06-09 22:18:41', '32.81GB', ' MBB vs Sioux Falls', 2, 1, 1, 'Africa'),
('Africa_2019AA890 ', '2020-06-09 22:18:41', '61.48GB', ' MBB vs Minnesota Dultuh', 2, 1, 1, 'Africa'),
('Africa_2019AA897', '2020-06-09 22:18:42', '0B', 'Graphic-Design', 2, 1, 1, 'Africa'),
('Africa_2019AA900', '2020-06-09 22:18:42', '9.27MB', 'Default', 2, 1, 1, 'Africa'),
('Africa_2019AA915', '2020-06-09 22:18:42', '222.07KB', 'MAVRIK-Production-Plans-MK-V001', 2, 1, 1, 'Africa'),
('Africa_2019AA917', '2020-06-09 22:18:42', '785.3GB', 'ISA-Orientation-Post', 2, 1, 1, 'Africa'),
('Africa_2019AA920 ', '2020-06-09 22:18:42', '15.97GB', ' FA Fall General Meeting', 2, 1, 1, 'Africa'),
('Africa_2019AA921 ', '2020-06-09 22:18:42', '42.73GB', ' Graduate Faculty Meeting', 2, 1, 1, 'Africa'),
('Africa_2019AA922 ', '2020-06-09 22:18:42', '8.37GB', ' MSSA Meeting', 2, 1, 1, 'Africa'),
('Africa_2019AA928 ', '2020-06-09 22:18:42', '41.0GB', ' MSSA Meeting (09-26-18)', 2, 1, 1, 'Africa'),
('Africa_2019AA930 ', '2020-06-09 22:18:42', '62.31GB', ' Two Weeks in May Showing', 2, 1, 1, 'Africa'),
('Africa_2019AA932 ', '2020-06-09 22:18:42', '16.37GB', ' DREAM- Multivariate Calculus for Datra Science', 2, 1, 1, 'Africa'),
('Africa_2019AA934 ', '2020-06-09 22:18:42', '72.25GB', ' A survivor Remembers the Holocaust', 2, 1, 1, 'Africa'),
('Africa_2019AA940 ', '2020-06-09 22:18:42', '125.01GB', ' WoSo- NSIC TOURNAMENT ( 1st Round )', 2, 1, 1, 'Africa'),
('Africa_2019AA951 ', '2020-06-09 22:18:43', '145.38GB', ' NSIC Finals', 2, 1, 1, 'Africa'),
('Africa_2019AA952 ', '2020-06-09 22:18:43', '153.55GB', ' Fall Fashion Show', 2, 1, 1, 'Africa'),
('Africa_2019AA954 ', '2020-06-09 22:18:43', '12.16GB', ' MSSA Meeting (11-14-18)', 2, 1, 1, 'Africa'),
('Africa_2019AA958 ', '2020-06-09 22:18:43', '273.56GB', 'Football vs Tarleton', 2, 1, 1, 'Africa'),
('Africa_2019AA964', '2020-06-09 22:18:43', '34.07GB', 'ITSV-BTS_Promo', 2, 1, 1, 'Africa'),
('Africa_2019AA968 ', '2020-06-09 22:18:43', '178.78GB', ' Wrestling vs Upper Iowa', 2, 1, 1, 'Africa'),
('Africa_2019AA969 ', '2020-06-09 22:18:43', '110.77GB', ' Wrestling vs Northern State', 2, 1, 1, 'Africa'),
('Africa_2019AA979 ', '2020-06-09 22:18:43', '2.66GB', ' Richard Schmitz Food Entrepreneurship Series', 2, 1, 1, 'Africa'),
('Africa_2019AA986 ', '2020-06-09 22:18:43', '7.1MB', 'Video Production Packages', 2, 1, 1, 'Africa'),
('Africa_2019AB034 ', '2020-06-09 22:18:44', '35.72MB', ' Still from the 3D Printing Shoot', 2, 1, 1, 'Africa'),
('Africa_2019AB084', '2020-06-09 22:18:44', '176.79GB', 'Professional Science Masters Programs', 2, 1, 1, 'Africa'),
('Africa_2019AB100', '2020-06-09 22:18:44', '130.62GB', 'Default', 2, 1, 1, 'Africa'),
('Africa_2020AB039 ', '2020-06-09 22:18:44', '473.21GB', ' Football - MNSU VS UNIVERSITY OF MARY', 2, 1, 1, 'Africa'),
('Africa_2020AB040 ', '2020-06-09 22:18:44', '5.36GB', ' Football - MINNESOTA STATE VS WAYNE STATE', 2, 1, 1, 'Africa'),
('Africa_2020AB042 ', '2020-06-09 22:18:44', '0B', ' Hockey - MNSU VS ARIZONA STATE', 2, 1, 1, 'Africa'),
('Africa_2020AB043 ', '2020-06-09 22:18:44', '0B', ' Hockey - MNSU vs ARIZONA STATE', 2, 1, 1, 'Africa'),
('Africa_2020AB050 ', '2020-06-09 22:18:44', '17.05GB', ' Hockey', 2, 1, 1, 'Africa'),
('Africa_2020AB053', '2020-06-09 22:18:44', '53.14GB', 'Hockey - MINNESOTA STATE VS ALASKA', 2, 1, 1, 'Africa'),
('Africa_2020AB054', '2020-06-09 22:18:44', '110.78GB', ' Hockey - Mavericks Vs Bemidji State', 2, 1, 1, 'Africa'),
('Africa_2020AB055', '2020-06-09 22:18:44', '127.76GB', 'Hockey-Minnesota State Vs Bemiji State', 2, 1, 1, 'Africa'),
('Africa_2020AB057 ', '2020-06-09 22:18:44', '129.14GB', ' Hockey - MINNESOTA STATE VS NORTHERN MICHIGAN', 2, 1, 1, 'Africa'),
('Africa_2020AB058 ', '2020-06-09 22:18:44', '136.13GB', ' Hockey - MINNESOTA STATE VS ALABAMA HUNTSVILLE', 2, 1, 1, 'Africa'),
('Africa_2020AB059', '2020-06-09 22:18:44', '141.08GB', 'Hockey Minnesota state vs Alabama H', 2, 1, 1, 'Africa'),
('Africa_2020AB070', '2020-06-09 22:18:44', '0B', 'Hockey-MSU VS St CLOUD', 2, 1, 1, 'Africa'),
('Africa_2020AB071', '2020-06-09 22:18:44', '90.92GB', 'Hockey-Minnesota State University Vs St. Cloud', 2, 1, 1, 'Africa'),
('Africa_2020AB073 ', '2020-06-09 22:18:45', '12.0KB', ' Hockey - MINNESOTA STATE VS WISCONSIN', 2, 1, 1, 'Africa'),
('Africa_2020AB074', '2020-06-09 22:18:45', '133.77GB', 'Hockey- MAVRIK_Vs_DULUTH', 2, 1, 1, 'Africa'),
('Africa_2020AB075 ', '2020-06-09 22:18:45', '116.51GB', ' Hockey - MINNESOTA STATE VS MINNESOTA DULUTH', 2, 1, 1, 'Africa'),
('Africa_2020AB079 ', '2020-06-09 22:18:45', '75.36GB', ' WoSo vs Duluth', 2, 1, 1, 'Africa'),
('Africa_2020AB081 ', '2020-06-09 22:18:45', '177.22GB', ' WoSo vs SMSU', 2, 1, 1, 'Africa'),
('Africa_2020AB082 ', '2020-06-09 22:18:45', '145.23GB', ' MNSU VS SIOUX FALLS', 2, 1, 1, 'Africa'),
('Africa_2020AB083 ', '2020-06-09 22:18:45', '121.91GB', ' WoSo vs Crookston', 2, 1, 1, 'Africa'),
('Africa_2020AB086 ', '2020-06-09 22:18:45', '264.69GB', ' SOCCER - MNSU VS BEMIDJI STATE', 2, 1, 1, 'Africa'),
('Africa_2020AB091 ', '2020-06-09 22:18:45', '150.2GB', ' MINNESOTA STATE VS MINNESOTA DULUTH', 2, 1, 1, 'Africa'),
('Africa_2020AB092 ', '2020-06-09 22:18:45', '69.51GB', ' VB vs Sioux', 2, 1, 1, 'Africa'),
('Africa_2020AB093', '2020-06-09 22:18:46', '49.11GB', ' VB vs SMSU', 2, 1, 1, 'Africa'),
('Africa_2020AB095 ', '2020-06-09 22:18:46', '211.51GB', ' VB vs Moorhead', 2, 1, 1, 'Africa'),
('Africa_2020AB104', '2020-06-09 22:18:46', '4.13GB', 'MAVRIK-MAVLIFE-APP-PROMO-01-V001', 2, 1, 1, 'Africa'),
('Africa_2020AB107', '2020-06-09 22:18:46', '52.79GB', 'ITSV-Promo-Welcome-International-Students', 2, 1, 1, 'Africa'),
('Africa_2020AB108', '2020-06-09 22:18:46', '952.26MB', 'ITSV-Promo-Bumper', 2, 1, 1, 'Africa'),
('Africa_2020AB109', '2020-06-09 22:18:46', '417.65GB', 'Disaster Drill fall 2019', 2, 1, 1, 'Africa'),
('Africa_2020AB112 ', '2020-06-09 22:18:46', '718.52MB', ' MSSA MEETING (09.11.19)', 2, 1, 1, 'Africa'),
('Africa_2020AB113', '2020-06-09 22:18:46', '74.19GB', 'Leadership U', 2, 1, 1, 'Africa'),
('Africa_2020AB115 ', '2020-06-09 22:18:46', '106.48GB', ' WoSo - Bemidji vs Grand Vaalley', 2, 1, 1, 'Africa'),
('Africa_2020AB116 ', '2020-06-09 22:18:47', '165.61GB', ' WoSo - Bemidji vs Central Missouri', 2, 1, 1, 'Africa'),
('Africa_2020AB119 ', '2020-06-09 22:18:47', '103.88GB', ' MSSA Meeting (09.25.19)', 2, 1, 1, 'Africa'),
('Africa_2020AB121', '2020-06-09 22:18:47', '4.11GB', 'IT-Solutions-Cyber-Security-Promo-N001-V001', 2, 1, 1, 'Africa'),
('Africa_2020AB122', '2020-06-09 22:18:47', '145.33GB', 'Telemental Health', 2, 1, 1, 'Africa'),
('Africa_2020AB127', '2020-06-09 22:18:47', '76.57GB', 'Default', 2, 1, 1, 'Africa'),
('Africa_2020AB128', '2020-06-09 22:18:47', '57.97GB', 'LeadershipU (10.01.19)', 2, 1, 1, 'Africa'),
('Africa_2020AB129 ', '2020-06-09 22:18:47', '96.75GB', ' MSSA Meeting (10.02.19)', 2, 1, 1, 'Africa'),
('Africa_2020AB130 ', '2020-06-09 22:18:47', '73.02GB', ' Alcohol and Safety Panel (Health Services)', 2, 1, 1, 'Africa'),
('Africa_2020AB131 ', '2020-06-09 22:18:47', '12.0KB', ' Nepali Concert', 2, 1, 1, 'Africa'),
('Africa_2020AB132 ', '2020-06-09 22:18:47', '132.29GB', ' MSSA', 2, 1, 1, 'Africa'),
('Africa_2020AB133 ', '2020-06-09 22:18:47', '38.06GB', ' LeadershipU', 2, 1, 1, 'Africa'),
('Africa_2020AB135 ', '2020-06-09 22:18:47', '132.39GB', ' Japanese Night', 2, 1, 1, 'Africa'),
('Africa_2020AB136 ', '2020-06-09 22:18:47', '5.1GB', ' ITS Fall Update', 2, 1, 1, 'Africa'),
('Africa_2020AB137', '2020-06-09 22:18:48', '140.36GB', 'Athletic-Blog-Test', 2, 1, 1, 'Africa'),
('Africa_2020AB138 ', '2020-06-09 22:18:48', '1.68GB', ' Good Thunder Reading (October)', 2, 1, 1, 'Africa'),
('Africa_2020AB141 ', '2020-06-09 22:18:48', '98.6GB', ' Women in STEM', 2, 1, 1, 'Africa'),
('Africa_2020AB142 ', '2020-06-09 22:18:48', '55.32GB', ' LeadershipU', 2, 1, 1, 'Africa'),
('Africa_2020AB143 ', '2020-06-09 22:18:48', '151.34GB', ' MSSA', 2, 1, 1, 'Africa'),
('Africa_2020AB144 ', '2020-06-09 22:18:48', '68.77GB', ' MSSA Meeting (10.23.19)', 2, 1, 1, 'Africa'),
('Africa_2020AB146 ', '2020-06-09 22:18:48', '48.0GB', ' LeadershipU (10292019)', 2, 1, 1, 'Africa'),
('Africa_2020AB147 ', '2020-06-09 22:18:48', '117.83GB', 'MSSA Meeting', 2, 1, 1, 'Africa'),
('Africa_2020AB148 ', '2020-06-09 22:18:48', '88.11GB', ' Tenure and Promotion Workshop Fall 2019', 2, 1, 1, 'Africa'),
('Africa_2020AB151 ', '2020-06-09 22:18:48', '8.17GB', ' LeadershipU', 2, 1, 1, 'Africa'),
('Africa_2020AB152 ', '2020-06-09 22:18:49', '1.06GB', 'MSSA Meeting', 2, 1, 1, 'Africa'),
('Africa_2020AB153 ', '2020-06-09 22:18:49', '179.69GB', ' Festival of Asia', 2, 1, 1, 'Africa'),
('Africa_2020AB156 ', '2020-06-09 22:18:49', '43.32GB', ' Soccer - Minnesota State VS University of Mary', 2, 1, 1, 'Africa'),
('Africa_2020AB158 ', '2020-06-09 22:18:49', '164.58GB', ' LeadershipU', 2, 1, 1, 'Africa'),
('Africa_2020AB159 ', '2020-06-09 22:18:49', '36.77GB', ' Aging Studies Faculty', 2, 1, 1, 'Africa'),
('Africa_2020AB160 MSSA', '2020-06-09 22:18:49', '207.08GB', 'Default', 2, 1, 1, 'Africa'),
('Africa_2020AB165 ', '2020-06-09 22:18:49', '110.68GB', ' MAVRIK - Global Education Stole & Certificate Cermony', 2, 1, 1, 'Africa'),
('Africa_2020AB166 ', '2020-06-09 22:18:49', '27.59GB', ' Student Government Meeting', 2, 1, 1, 'Africa'),
('Africa_2020AB167 GV vs Uindy WSOC', '2020-06-09 22:18:49', '83.88GB', 'Default', 2, 1, 1, 'Africa'),
('Africa_2020AB168', '2020-06-09 22:18:49', '92.9GB', ' Minnesota State Mankato Vs Central Missouri', 2, 1, 1, 'Africa'),
('Africa_2020AB169 ', '2020-06-09 22:18:49', '140.98GB', ' GVSU-INDY Winner Vs MSU-UCM Winner', 2, 1, 1, 'Africa'),
('Africa_2020AB170 ', '2020-06-09 22:18:49', '100.16GB', ' Football vs TAMU', 2, 1, 1, 'Africa'),
('Africa_2020AB171', '2020-06-09 22:18:49', '535.78GB', ' Fall Commencement 2019', 2, 1, 1, 'Africa'),
('Africa_2020AB172 ', '2020-06-09 22:18:49', '32.48GB', ' Football players graduation', 2, 1, 1, 'Africa'),
('Africa_2020AB173 ', '2020-06-09 22:18:49', '267.24GB', ' Minnesota State VS UW-PARKSIDE', 2, 1, 1, 'Africa'),
('Africa_2020AB174', '2020-06-09 22:18:50', '92.38GB', 'Wrestling VS WESTERN COLORADO', 2, 1, 1, 'Africa'),
('Africa_2020AB175 ', '2020-06-09 22:18:50', '0B', ' SAMPLE Project - Environment Congress Spring 2020', 2, 1, 1, 'Africa'),
('Africa_2020AB176', '2020-06-09 22:18:50', '87.34GB', 'Student Government', 2, 1, 1, 'Africa'),
('Africa_2020AB178 ', '2020-06-09 22:18:50', '161.03GB', ' Opioid Event Spring 2020', 2, 1, 1, 'Africa'),
('Africa_2020AB180 ', '2020-06-09 22:18:50', '292.31GB', ' Wrestling - Minnesota State Mankato VS ST. CLOUD STATE', 2, 1, 1, 'Africa'),
('Africa_2020AB181 ', '2020-06-09 22:18:50', '150.85GB', ' Student Government', 2, 1, 1, 'Africa'),
('Africa_2020AB182 ', '2020-06-09 22:18:50', '179.43GB', ' Student Government (12th Feb 2020)', 2, 1, 1, 'Africa'),
('Africa_2020AB183 ', '2020-06-09 22:18:50', '207.34GB', ' Student Government (19th Feb 2020)', 2, 1, 1, 'Africa'),
('Africa_2020AB184 ', '2020-06-09 22:18:50', '232.24GB', ' Student Government 26th Feb', 2, 1, 1, 'Africa'),
('Africa_2020AB185', '2020-06-09 22:18:50', '328.29GB', ' Student Government', 2, 1, 1, 'Africa'),
('Africa_2020AB193 ', '2020-06-09 22:18:50', '94.2GB', ' Wrestling -MNSU Vs MSU Moorhead', 2, 1, 1, 'Africa'),
('Africa_2020AB195 ', '2020-06-09 22:18:50', '330.97GB', ' Wrestling- Minnesota State Mankato vs AUGUSTANA', 2, 1, 1, 'Africa'),
('Africa_2020AB196 ', '2020-06-09 22:18:50', '495.67GB', ' Wrestling- Minnesota State Mankato vs NORTHERN STATE', 2, 1, 1, 'Africa'),
('Africa_2020AB197', '2020-06-09 22:18:50', '340.44GB', '198 - MAVERICK- Maverick Open handball tournament', 2, 1, 1, 'Africa'),
('Africa_2020AB205', '2020-06-09 22:18:50', '43.21GB', ' Maverick Insider Podcast- 20-02-12', 2, 1, 1, 'Africa'),
('Africa_2020AB206', '2020-06-09 22:18:51', '49.54GB', 'Mav-Insider-EP-20-02-18', 2, 1, 1, 'Africa'),
('Africa_2020AB207', '2020-06-09 22:18:51', '0B', 'MAVRIK PODCAST', 2, 1, 1, 'Africa'),
('Africa_2020AB208', '2020-06-09 22:18:51', '0B', 'MAVRIK PODCAST', 2, 1, 1, 'Africa'),
('Africa_2020AB225 ', '2020-06-09 22:18:51', '121.4GB', ' Yoga Spring 2020', 2, 1, 1, 'Africa'),
('Africa_2020AB226 ', '2020-06-09 22:18:51', '129.99GB', ' Hockey - Minnesota State Mankato VS ALASKA ANCHORAGE', 2, 1, 1, 'Africa'),
('Africa_2020AB227 ', '2020-06-09 22:18:51', '0B', ' Hockey - Minnesota State Mankato VS ALASKA ANCHORAGE', 2, 1, 1, 'Africa'),
('Africa_2020AB228 ', '2020-06-09 22:18:51', '16.0KB', ' Hockey - Minnesota State Mankato VS ALASKA ANCHORAGE', 2, 1, 1, 'Africa'),
('Africa_2020AB238', '2020-06-09 22:18:51', '1.67GB', 'MAVRIK-Financial Aid Orientation', 2, 1, 1, 'Africa'),
('Africa_2020AB240', '2020-06-09 22:18:51', '4.61GB', 'MAVRIK-Douglas R. Moore Lecture 2020', 2, 1, 1, 'Africa'),
('Africa_360 Video Software', '2020-06-09 22:18:51', '1.09GB', 'Default', 2, 1, 1, 'Africa'),
('Africa_896', '2020-06-09 22:18:51', '13.73MB', 'Default', 2, 1, 1, 'Africa'),
('Africa_P2017AA000', '2020-06-09 22:18:51', '33.5KB', 'MAVRIK-STOCK-Basic-Video-Project- Folder- Structure-V001', 2, 1, 1, 'Africa'),
('Africa_P2018AB773', '2020-06-09 22:18:51', '2.86GB', 'PRFIRE-MSUM-Heroes-EP1-V001', 2, 1, 1, 'Africa'),
('Africa_P2020AB173 ', '2020-06-09 22:18:51', '83.94GB', ' Wrestling vs Parkside', 2, 1, 1, 'Africa'),
('Africa_Picutres', '2020-06-09 22:18:51', '214.37MB', 'Default', 2, 1, 1, 'Africa'),
('Africa_postproduction_database', '2020-06-09 22:18:51', '2.73MB', 'Default', 2, 1, 1, 'Africa'),
('Africa_Practice', '2020-06-09 22:18:51', '318.0KB', 'Default', 2, 1, 1, 'Africa'),
('Africa_Projectgraphics soccer', '2020-06-09 22:18:51', '683.0MB', 'Default', 2, 1, 1, 'Africa'),
('Africa_promo music', '2020-06-09 22:18:52', '34.99MB', 'Default', 2, 1, 1, 'Africa'),
('Africa_PTZ Optics', '2020-06-09 22:18:52', '3.74MB', 'Default', 2, 1, 1, 'Africa'),
('America_00000', '2020-06-09 22:21:03', '38.36GB', 'Default', 2, 1, 1, 'America'),
('America_0000000 Style Guide for titles', '2020-06-09 22:21:07', '12.87GB', 'Default', 2, 1, 1, 'America'),
('America_0000000 Style Guide of organization folders', '2020-06-09 22:21:07', '158.62GB', 'Default', 2, 1, 1, 'America'),
('America_0000000000000America', '2020-06-09 22:21:09', '0B', 'Default', 2, 1, 1, 'America'),
('America_00000000TV', '2020-06-09 22:21:09', '42.77GB', 'Default', 2, 1, 1, 'America'),
('America_2017AA585 ', '2020-06-09 22:21:09', '9.15GB', ' Bangladesh Night', 2, 1, 1, 'America'),
('America_2018', '2020-06-09 22:21:09', '101.0KB', '0604-TriCaster-Bravo-Temp', 2, 1, 1, 'America'),
('America_2018AA662 ', '2020-06-09 22:21:09', '232.58GB', ' Graphics FY18', 2, 1, 1, 'America'),
('America_2018AA663 ', '2020-06-09 22:21:38', '93.65GB', ' World Got Talent 3', 2, 1, 1, 'America'),
('America_2018AA666 Behind the scene', '2020-06-09 22:21:38', '33.89GB', 'Default', 2, 1, 1, 'America'),
('America_2018AA690 ', '2020-06-09 22:21:38', '14.23MB', ' MSSA Meeting', 2, 1, 1, 'America'),
('America_2018AA734 ', '2020-06-09 22:21:38', '115.08GB', ' WSoccer Southwestern Oklahoma vs Missouri Western', 2, 1, 1, 'America'),
('America_2018AA735 ', '2020-06-09 22:21:38', '130.4GB', ' Graduate Online Application Presentation', 2, 1, 1, 'America'),
('America_2018AA737 ', '2020-06-09 22:21:38', '7.79MB', ' MSSA Meeting', 2, 1, 1, 'America'),
('America_2018AA743 ', '2020-06-09 22:21:38', '7.85GB', ' Football vs Texas A&M - Commerce', 2, 1, 1, 'America'),
('America_2018AA755 ', '2020-06-09 22:21:38', '92.42GB', ' FA General Meeting', 2, 1, 1, 'America'),
('America_2018AA796 ', '2020-06-09 22:21:38', '43.68GB', ' Douglas R Moore Lecture', 2, 1, 1, 'America'),
('America_2018AA811 ', '2020-06-09 22:21:38', '6.58GB', ' COE Hooding', 2, 1, 1, 'America'),
('America_2018AA813', '2020-06-09 22:21:39', '311.17GB', 'ITS-Video-Demo-Reel', 2, 1, 1, 'America'),
('America_2018AA925 ', '2020-06-09 22:21:39', '3.47MB', ' MSSA Meeting', 2, 1, 1, 'America'),
('America_2019AA817 ', '2020-06-09 22:21:39', '52.42GB', ' WoSo vs Gustavus', 2, 1, 1, 'America'),
('America_2019AA820 ', '2020-06-09 22:21:39', '182.94GB', ' WoSo vs Winona State', 2, 1, 1, 'America'),
('America_2019AA821 ', '2020-06-09 22:21:40', '126.22GB', ' WoSo vs Upper Iowa', 2, 1, 1, 'America'),
('America_2019AA824 ', '2020-06-09 22:21:40', '143.22GB', ' WoSo vs Northern State', 2, 1, 1, 'America'),
('America_2019AA825 ', '2020-06-09 22:21:40', '143.57GB', ' WoSo vs Moorhead', 2, 1, 1, 'America'),
('America_2019AA827 ', '2020-06-09 22:21:40', '214.94GB', ' Football vs Southwest Minnesota State', 2, 1, 1, 'America'),
('America_2019AA842 ', '2020-06-09 22:21:42', '92.75GB', ' Volleyball vs Wayne State', 2, 1, 1, 'America'),
('America_2019AA859 ', '2020-06-09 22:21:42', '10.0KB', ' MHockey vs Mount Royal University', 2, 1, 1, 'America'),
('America_2019AA861 ', '2020-06-09 22:21:42', '414.78GB', ' MHockey vs Boston University', 2, 1, 1, 'America'),
('America_2019AA878 ', '2020-06-09 22:21:42', '21.57GB', ' New Student Rally', 2, 1, 1, 'America'),
('America_2019AA879 ', '2020-06-09 22:21:42', '103.84GB', ' MSSA Meeting', 2, 1, 1, 'America'),
('America_2019AA880 ', '2020-06-09 22:21:42', '199.4GB', ' MBB Missouri Southern vs St Cloud State', 2, 1, 1, 'America'),
('America_2019AA881 ', '2020-06-09 22:21:43', '112.42GB', ' MBB vs Lindenwood', 2, 1, 1, 'America'),
('America_2019AA882 ', '2020-06-09 22:21:43', '3.95GB', ' MBB Lindenwood vs St Cloud State', 2, 1, 1, 'America'),
('America_2019AA883 ', '2020-06-09 22:21:43', '4.01GB', ' MBB vs Missouri Southern', 2, 1, 1, 'America'),
('America_2019AA897', '2020-06-09 22:21:43', '0B', 'Graphic-Design', 2, 1, 1, 'America'),
('America_2019AA900 ', '2020-06-09 22:21:43', '9.27MB', ' WHockey vs Rensselaer', 2, 1, 1, 'America'),
('America_2019AA915', '2020-06-09 22:21:44', '209.57KB', 'MAVRIK-Production-Plans-MK-V001', 2, 1, 1, 'America'),
('America_2019AA917', '2020-06-09 22:21:44', '785.29GB', 'ISA-Orientation-Post', 2, 1, 1, 'America'),
('America_2019AA919 ', '2020-06-09 22:21:44', '190.16GB', ' Orientation - Thursday', 2, 1, 1, 'America'),
('America_2019AA920 ', '2020-06-09 22:21:44', '15.97GB', ' FA Fall General Meeting', 2, 1, 1, 'America'),
('America_2019AA921 ', '2020-06-09 22:21:44', '45.82GB', ' Graduate Faculty Meeting', 2, 1, 1, 'America'),
('America_2019AA922 ', '2020-06-09 22:21:44', '16.74GB', ' MSSA Meeting', 2, 1, 1, 'America'),
('America_2019AA924 ', '2020-06-09 22:21:44', '70.65GB', ' MSSA Meeting', 2, 1, 1, 'America'),
('America_2019AA926 ', '2020-06-09 22:21:44', '99.09GB', ' Dave Wellston Lecture', 2, 1, 1, 'America'),
('America_2019AA928 ', '2020-06-09 22:21:44', '41.0GB', ' MSSA Meeting', 2, 1, 1, 'America'),
('America_2019AA929 ', '2020-06-09 22:21:44', '57.29GB', ' Celebrating 150 years of University History due OCT 15', 2, 1, 1, 'America'),
('America_2019AA930 ', '2020-06-09 22:21:44', '62.31GB', ' Two Weeks in May Film Showing', 2, 1, 1, 'America'),
('America_2019AA932 ', '2020-06-09 22:21:45', '16.37GB', ' DREAM - Multivariate Calculus for Data Science', 2, 1, 1, 'America'),
('America_2019AA933 ', '2020-06-09 22:21:45', '47.84GB', ' MSSA Meeting', 2, 1, 1, 'America'),
('America_2019AA934 ', '2020-06-09 22:21:45', '69.1GB', ' Holocaust Survivor', 2, 1, 1, 'America'),
('America_2019AA935 ', '2020-06-09 22:21:45', '141.46GB', ' Law Enforcement Training', 2, 1, 1, 'America'),
('America_2019AA936 ', '2020-06-09 22:21:45', '41.99GB', ' Consent and Respect Training', 2, 1, 1, 'America'),
('America_2019AA937 ', '2020-06-09 22:21:45', '46.05GB', ' MSSA Meeting', 2, 1, 1, 'America'),
('America_2019AA938 ', '2020-06-09 22:21:45', '32.39GB', ' MSSA Meeting', 2, 1, 1, 'America'),
('America_2019AA939 ', '2020-06-09 22:21:45', '84.12GB', ' MSSA Meeting', 2, 1, 1, 'America'),
('America_2019AA940 ', '2020-06-09 22:21:45', '105.02GB', ' WoSo - NSIC Tournament (1ST ROUND)', 2, 1, 1, 'America'),
('America_2019AA941 ', '2020-06-09 22:21:45', '40.58GB', ' Reporter Elections Roundtable', 2, 1, 1, 'America'),
('America_2019AA942 ', '2020-06-09 22:21:45', '14.09GB', ' Maverick Handball Open - 1st game', 2, 1, 1, 'America'),
('America_2019AA945 ', '2020-06-09 22:21:45', '25.28GB', ' Maverick Handball Open - 4th game', 2, 1, 1, 'America'),
('America_2019AA946 ', '2020-06-09 22:21:46', '3.44MB', ' Salary Equity Presentation', 2, 1, 1, 'America'),
('America_2019AA947 ', '2020-06-09 22:21:46', '77.23GB', ' MBB vs UW-RIVER FALLS (EX.)', 2, 1, 1, 'America'),
('America_2019AA949 ', '2020-06-09 22:21:46', '192.31GB', ' WoSo vs Augustana', 2, 1, 1, 'America'),
('America_2019AA950 ', '2020-06-09 22:21:46', '158.48GB', ' UMary vs Minot State', 2, 1, 1, 'America'),
('America_2019AA951 ', '2020-06-09 22:21:46', '151.68GB', ' NSIC Finals', 2, 1, 1, 'America'),
('America_2019AA952 ', '2020-06-09 22:21:47', '0B', ' Fall Fashion Show', 2, 1, 1, 'America'),
('America_2019AA953 ', '2020-06-09 22:21:47', '0B', ' MSSA Meeting', 2, 1, 1, 'America'),
('America_2019AA982', '2020-06-09 22:21:47', '34.22GB', 'MAVRIK-Gear_Test-20180211-V001', 2, 1, 1, 'America'),
('America_2019AA987 ', '2020-06-09 22:21:47', '71.78GB', ' MBB vs Bemidji State', 2, 1, 1, 'America'),
('America_2019AB010 ', '2020-06-09 22:21:47', '56.23GB', ' 2019 AMUNC Opening Plenary (MUN - Day 1)', 2, 1, 1, 'America'),
('America_2019AB012 ', '2020-06-09 22:21:47', '46.59GB', ' AMUNC - Mark Ritchie on Global Minnesota', 2, 1, 1, 'America'),
('America_2019AB014 ', '2020-06-09 22:21:47', '131.17GB', ' MSSA Meeting', 2, 1, 1, 'America'),
('America_2019AB015 ', '2020-06-09 22:21:47', '100.46GB', ' Video shot for Human motion study', 2, 1, 1, 'America'),
('America_2019AB016 ', '2020-06-09 22:21:47', '624.07MB', ' Reporter Trial', 2, 1, 1, 'America'),
('America_2019AB020 ', '2020-06-09 22:21:47', '21.83GB', ' Gladys B. Olson International', 2, 1, 1, 'America'),
('America_2019AB022 ', '2020-06-09 22:21:48', '61.61GB', ' MSSA Meeting', 2, 1, 1, 'America'),
('America_2019AB028 ', '2020-06-09 22:21:48', '4.96GB', ' Meet the Candidate', 2, 1, 1, 'America'),
('America_2020AB086 Soccer ', '2020-06-09 22:21:48', '0B', ' MSU vs BEMIDJI STATE', 2, 1, 1, 'America'),
('America_2020AB104', '2020-06-09 22:21:48', '575.32MB', 'MAVRIK-MAVLIFE-APP-PROMO-01-V001', 2, 1, 1, 'America'),
('America_360 Video Software', '2020-06-09 22:21:48', '1.09GB', 'Default', 2, 1, 1, 'America'),
('America_98765', '2020-06-09 22:21:48', '2.22GB', 'Default', 2, 1, 1, 'America'),
('America_P2017AA000', '2020-06-09 22:21:48', '2.31MB', 'MAVRIK-STOCK-Basic-Video-Project- Folder- Structure-V001', 2, 1, 1, 'America'),
('America_Practice', '2020-06-09 22:21:48', '12.87GB', 'Default', 2, 1, 1, 'America'),
('America_promo music', '2020-06-09 22:21:48', '34.99MB', 'Default', 2, 1, 1, 'America'),
('America_PTZ Optics', '2020-06-09 22:21:48', '3.74MB', 'Default', 2, 1, 1, 'America'),
('Asia_000 IT Support Files 2019', '2020-06-09 22:22:44', '919.84MB', 'Default', 2, 1, 1, 'Asia'),
('Asia_0000000000000Asia', '2020-06-09 22:22:44', '0B', 'Default', 2, 1, 1, 'Asia'),
('Asia_2016AA382 ', '2020-06-09 22:22:44', '296.16GB', ' Womens-Basketball-vs-Northern-State', 2, 1, 1, 'Asia'),
('Asia_2016AA404', '2020-06-09 22:22:44', '89.07GB', 'ADMISSIONS VIDEO', 2, 1, 1, 'Asia'),
('Asia_2017AA436', '2020-06-09 22:22:45', '0B', 'MAVRIK-TV-CHANNEL-HDMI-UNIT-TESTS-V001', 2, 1, 1, 'Asia'),
('Asia_2017AA461 ', '2020-06-09 22:22:45', '11.88GB', ' Steering Clair of Cybersecurity', 2, 1, 1, 'Asia'),
('Asia_2017AA464 ', '2020-06-09 22:22:45', '29.11GB', ' Cyber Security', 2, 1, 1, 'Asia'),
('Asia_2017AA465 ', '2020-06-09 22:22:45', '191.33GB', ' Wrestling-Vs-Northern-State', 2, 1, 1, 'Asia'),
('Asia_2017AA466 ', '2020-06-09 22:22:45', '31.22GB', ' An Evening with Julie Otsuka', 2, 1, 1, 'Asia'),
('Asia_2017AA483', '2020-06-09 22:22:45', '0B', 'Default', 2, 1, 1, 'Asia'),
('Asia_2017AA494 ', '2020-06-09 22:22:45', '244.46GB', ' WVolleyball vs UMC', 2, 1, 1, 'Asia'),
('Asia_2017AA528 ', '2020-06-09 22:22:46', '234.7GB', ' Wrestling vs Mary', 2, 1, 1, 'Asia'),
('Asia_2017AA535', '2020-06-09 22:22:46', '12.0KB', 'Default', 2, 1, 1, 'Asia'),
('Asia_2017AA565', '2020-06-09 22:22:46', '0B', 'Default', 2, 1, 1, 'Asia'),
('Asia_2017AA568 ', '2020-06-09 22:22:46', '254.05GB', ' African Night', 2, 1, 1, 'Asia'),
('Asia_2017AA577 ', '2020-06-09 22:22:46', '158.31GB', ' WBasketball vs Minot State', 2, 1, 1, 'Asia'),
('Asia_2017AA583 ', '2020-06-09 22:22:46', '423.57GB', ' Spring Commencement', 2, 1, 1, 'Asia'),
('Asia_2017AA584 ', '2020-06-09 22:22:46', '18.88GB', ' Bangladesh Night', 2, 1, 1, 'Asia'),
('Asia_2017AA586 ', '2020-06-09 22:22:46', '106.79GB', ' Student Teacher Evaluation', 2, 1, 1, 'Asia'),
('Asia_2017AA587', '2020-06-09 22:22:47', '59.68GB', 'Default', 2, 1, 1, 'Asia'),
('Asia_2017AA591 ', '2020-06-09 22:22:47', '101.22MB', ' Maverick TV Bumper Short', 2, 1, 1, 'Asia'),
('Asia_2017AA593 ', '2020-06-09 22:22:47', '14.64GB', ' WBB Sports Opener', 2, 1, 1, 'Asia'),
('Asia_2017AA595 ', '2020-06-09 22:22:47', '196.17GB', ' Womens Soccer Opener', 2, 1, 1, 'Asia'),
('Asia_2018', '2020-06-09 22:22:47', '581.75GB', '0604-TriCaster-Bravo-Temp', 2, 1, 1, 'Asia'),
('Asia_2018AA602 ', '2020-06-09 22:22:47', '266.09GB', ' WSoccer vs Wisconsin Parkside', 2, 1, 1, 'Asia'),
('Asia_2018AA609 ', '2020-06-09 22:22:47', '2.47GB', ' WSoccer vs Concordia University of St. Paul', 2, 1, 1, 'Asia'),
('Asia_2018AA611 ', '2020-06-09 22:22:47', '172.25GB', ' WSoccer vs Bemidji State', 2, 1, 1, 'Asia'),
('Asia_2018AA612 ', '2020-06-09 22:22:47', '215.35GB', ' Football vs Augustana S.D', 2, 1, 1, 'Asia'),
('Asia_2018AA614 Volleyball Crookston', '2020-06-09 22:22:49', '210.16GB', 'Default', 2, 1, 1, 'Asia'),
('Asia_2018AA615 ', '2020-06-09 22:22:49', '3.97GB', ' WSoccer vs Northern State', 2, 1, 1, 'Asia'),
('Asia_2018AA620 ', '2020-06-09 22:22:49', '20.32GB', ' Football vs Winona', 2, 1, 1, 'Asia'),
('Asia_2018AA621 ', '2020-06-09 22:22:49', '185.02GB', ' WVolleyball vs Concordia', 2, 1, 1, 'Asia'),
('Asia_2018AA623 ', '2020-06-09 22:22:49', '118.39GB', ' WVolleyball vs Minnesota State University Moorhead', 2, 1, 1, 'Asia'),
('Asia_2018AA624 ', '2020-06-09 22:22:49', '270.56GB', ' Football vs Wayne State College', 2, 1, 1, 'Asia'),
('Asia_2018AA628 ', '2020-06-09 22:22:50', '23.73GB', ' WVolleyball vs Northern State', 2, 1, 1, 'Asia'),
('Asia_2018AA630 ', '2020-06-09 22:22:50', '29.86GB', ' Rock Climbing', 2, 1, 1, 'Asia'),
('Asia_2018AA631 ', '2020-06-09 22:22:53', '28.7GB', ' ITS Retreat', 2, 1, 1, 'Asia'),
('Asia_2018AA632', '2020-06-09 22:22:54', '25.0KB', 'Default', 2, 1, 1, 'Asia'),
('Asia_2018AA633', '2020-06-09 22:22:54', '18.93GB', 'MAVRIK-Student-Training-Practice-V001', 2, 1, 1, 'Asia'),
('Asia_2018AA634 ', '2020-06-09 22:22:54', '38.42GB', ' MBasketball vs St. Cloud State', 2, 1, 1, 'Asia'),
('Asia_2018AA635', '2020-06-09 22:22:54', '1.71MB', 'Default', 2, 1, 1, 'Asia'),
('Asia_2018AA636 ', '2020-06-09 22:22:54', '240.99GB', ' WBasketball vs Wayne State', 2, 1, 1, 'Asia'),
('Asia_2018AA637 ', '2020-06-09 22:22:55', '237.05GB', ' MBasketball vs Augustana', 2, 1, 1, 'Asia'),
('Asia_2018AA638 ', '2020-06-09 22:22:55', '195.04GB', ' WBasketball vs Augustana', 2, 1, 1, 'Asia'),
('Asia_2018AA639 ', '2020-06-09 22:22:55', '81.44GB', ' WBasketball vs Concordia State', 2, 1, 1, 'Asia'),
('Asia_2018AA640 ', '2020-06-09 22:22:55', '68.79GB', ' MBasketball vs Concordia - St. Paul', 2, 1, 1, 'Asia'),
('Asia_2018AA641 ', '2020-06-09 22:22:55', '12.41GB', ' MBasketball vs Minnesota State Moorhead', 2, 1, 1, 'Asia'),
('Asia_2018AA642 ', '2020-06-09 22:22:55', '139.7GB', ' WBasketball vs Minnesota State Moorhead', 2, 1, 1, 'Asia'),
('Asia_2018AA643 ', '2020-06-09 22:22:55', '7.71GB', ' MBasketball vs Northern State', 2, 1, 1, 'Asia'),
('Asia_2018AA644 ', '2020-06-09 22:22:56', '4.77GB', ' WBasketball vs Northern State', 2, 1, 1, 'Asia'),
('Asia_2018AA645 ', '2020-06-09 22:22:56', '72.07GB', ' MBasketball vs Sioux Fall', 2, 1, 1, 'Asia'),
('Asia_2018AA647 ', '2020-06-09 22:22:56', '277.76GB', 'MBasketball vs Southwest Minnesota', 2, 1, 1, 'Asia'),
('Asia_2018AA647(from america)', '2020-06-09 22:22:56', '280.53GB', 'Default', 2, 1, 1, 'Asia'),
('Asia_2018AA753', '2020-06-09 22:22:56', '108.74GB', 'Nursing-360-Video-Test-V001-ty2017-12-10', 2, 1, 1, 'Asia'),
('Asia_2018AA759 ', '2020-06-09 22:22:57', '8.92GB', ' 360 Photo Innovative Spaces', 2, 1, 1, 'Asia'),
('Asia_2018AA776 ', '2020-06-09 22:23:33', '96.27GB', ' Maverick Sustainability', 2, 1, 1, 'Asia'),
('Asia_2018AA777 ', '2020-06-09 22:23:33', '104.13GB', ' SCC Graduation', 2, 1, 1, 'Asia'),
('Asia_2018AA809 ', '2020-06-09 22:23:33', '63.6GB', ' Maverick Event Promo', 2, 1, 1, 'Asia'),
('Asia_2019AA000 Graphics', '2020-06-09 22:23:56', '24.5MB', 'Default', 2, 1, 1, 'Asia'),
('Asia_2019AA816 ', '2020-06-09 22:23:56', '40.87GB', ' WoSo vs LaCrosse', 2, 1, 1, 'Asia'),
('Asia_2019AA821 ', '2020-06-09 22:23:56', '225.86GB', ' WoSo vs Upper Iowa', 2, 1, 1, 'Asia'),
('Asia_2019AA824 ', '2020-06-09 22:23:56', '243.58GB', ' WoSo vs Northern State', 2, 1, 1, 'Asia'),
('Asia_2019AA830 ', '2020-06-09 22:23:56', '421.7GB', ' Football vs Minot State', 2, 1, 1, 'Asia'),
('Asia_2019AA834 ', '2020-06-09 22:23:57', '224.85GB', ' Volleyball vs Upper Iowa', 2, 1, 1, 'Asia'),
('Asia_2019AA835 ', '2020-06-09 22:23:57', '38.5KB', ' Volleyball vs Concordia - St. Paul', 2, 1, 1, 'Asia'),
('Asia_2019AA836 ', '2020-06-09 22:23:57', '235.27GB', ' Volleyball vs Southwest Minnesota State', 2, 1, 1, 'Asia'),
('Asia_2019AA838 ', '2020-06-09 22:23:57', '154.29GB', ' Volleyball vs Minot State', 2, 1, 1, 'Asia'),
('Asia_2019AA843 ', '2020-06-09 22:23:58', '241.7GB', ' Volleyball vs Augustana', 2, 1, 1, 'Asia'),
('Asia_2019AA846 ', '2020-06-09 22:23:58', '64.7GB', ' WBB vs Concordia - St. Paul', 2, 1, 1, 'Asia'),
('Asia_2019AA849 ', '2020-06-09 22:23:59', '196.68GB', ' WBB vs Sioux Fall', 2, 1, 1, 'Asia'),
('Asia_2019AA850 ', '2020-06-09 22:23:59', '146.86GB', ' WBB vs Southwest Minnesota State', 2, 1, 1, 'Asia'),
('Asia_2019AA851 ', '2020-06-09 22:24:00', '321.49GB', ' WBB vs Minnesota Duluth', 2, 1, 1, 'Asia'),
('Asia_2019AA854 ', '2020-06-09 22:24:00', '858.95GB', ' WBB vs Northern State', 2, 1, 1, 'Asia'),
('Asia_2019AA860 ', '2020-06-09 22:24:01', '6.89GB', ' Fall Commencement', 2, 1, 1, 'Asia'),
('Asia_2019AA878 ', '2020-06-09 22:24:01', '76.56GB', ' New Student Rally', 2, 1, 1, 'Asia'),
('Asia_2019AA879 ', '2020-06-09 22:24:01', '24.82GB', ' MSSA Meeting', 2, 1, 1, 'Asia'),
('Asia_2019AA955 ', '2020-06-09 22:24:01', '11.64GB', ' ResLife 360 Production-ABANDONED', 2, 1, 1, 'Asia'),
('Asia_2019AA963 ', '2020-06-09 22:24:01', '54.19GB', ' Football Highlights for NCAA', 2, 1, 1, 'Asia'),
('Asia_2019AB001 ', '2020-06-09 22:24:02', '9.67MB', ' COE Hooding Ceremony', 2, 1, 1, 'Asia'),
('Asia_2019AB002 ', '2020-06-09 22:24:02', '4.69GB', ' Spring Commencement', 2, 1, 1, 'Asia'),
('Asia_2019AB008 ', '2020-06-09 22:24:02', '19.89GB', ' IT solutions Website Photos', 2, 1, 1, 'Asia'),
('Asia_2019AB009 ', '2020-06-09 22:24:02', '190.5GB', ' Saudi Night', 2, 1, 1, 'Asia'),
('Asia_2019AB013 ', '2020-06-09 22:24:02', '3.61GB', ' SCC Graduation', 2, 1, 1, 'Asia'),
('Asia_2019AB014 ', '2020-06-09 22:24:02', '34.1GB', ' Student Government', 2, 1, 1, 'Asia'),
('Asia_2019AB016', '2020-06-09 22:24:02', '0B', 'Default', 2, 1, 1, 'Asia'),
('Asia_2019AB017 ', '2020-06-09 22:24:02', '94.94GB', ' Psychology Student', 2, 1, 1, 'Asia'),
('Asia_2019AB019 ', '2020-06-09 22:24:02', '27.88GB', ' The Maverick Report', 2, 1, 1, 'Asia'),
('Asia_2019AB020 ', '2020-06-09 22:24:04', '25.45GB', ' Gladys B. Olson International Endowment Awards Ceremony', 2, 1, 1, 'Asia'),
('Asia_2019AB021', '2020-06-09 22:24:04', '976.26MB', 'MAVRIK-Holy-Festival-V001', 2, 1, 1, 'Asia'),
('Asia_2019AB025', '2020-06-09 22:24:04', '201.25GB', 'Default', 2, 1, 1, 'Asia'),
('Asia_2020AB040 ', '2020-06-09 22:24:05', '203.7GB', ' Football-Vs-Wayne State', 2, 1, 1, 'Asia'),
('Asia_2020AB047', '2020-06-09 22:24:05', '87.24GB', 'Default', 2, 1, 1, 'Asia'),
('Asia_2020AB048 ', '2020-06-09 22:24:05', '123.87GB', ' Hockey vs Ancorage', 2, 1, 1, 'Asia'),
('Asia_2020AB053', '2020-06-09 22:24:05', '71.8GB', 'Hockey - MINNESOTA STATE VS ALASKA', 2, 1, 1, 'Asia'),
('Asia_2020AB056', '2020-06-09 22:24:05', '120.42GB', 'MAVRIK-HOCKEY-MSU VS NOTHERN MICHIGAN', 2, 1, 1, 'Asia'),
('Asia_2020AB066 ', '2020-06-09 22:24:05', '93.75GB', ' Whockey-vs-Bemidji', 2, 1, 1, 'Asia'),
('Asia_2020AB067 ', '2020-06-09 22:24:05', '180.44GB', ' Hockey vs Bemidji', 2, 1, 1, 'Asia'),
('Asia_2020AB068 ', '2020-06-09 22:24:05', '104.41GB', ' Hockey - MINNESOTA STATE VS LINDENWOOD', 2, 1, 1, 'Asia'),
('Asia_2020AB069', '2020-06-09 22:24:05', '88.07GB', 'Hockey-MINNESOTA STATE UNVERSITY VS LINDERWOOD', 2, 1, 1, 'Asia'),
('Asia_2020AB072', '2020-06-09 22:24:06', '100.68GB', ' Hockey - Minnesota State Vs Wisconsin', 2, 1, 1, 'Asia'),
('Asia_2020AB081 ', '2020-06-09 22:24:06', '20.86GB', ' WoSo-Vs Southwest Minnesota', 2, 1, 1, 'Asia'),
('Asia_2020AB087 ', '2020-06-09 22:24:06', '313.26GB', ' Soccer - MINNESOTA STATE VS AUGUSTANA', 2, 1, 1, 'Asia'),
('Asia_2020AB088 ', '2020-06-09 22:24:06', '178.65GB', 'MAVRIK-Soccer-vs-Concordia', 2, 1, 1, 'Asia'),
('Asia_2020AB091 ', '2020-06-09 22:24:06', '17.84GB', ' VOLLEYBALL-VS-DULUTH', 2, 1, 1, 'Asia'),
('Asia_2020AB094 ', '2020-06-09 22:24:06', '166.78GB', ' VB vs Northern', 2, 1, 1, 'Asia'),
('Asia_2020AB096 ', '2020-06-09 22:24:06', '91.36GB', ' Volleyball - MINNESOTA STATE VS CONCORDIA-ST. PAUL', 2, 1, 1, 'Asia'),
('Asia_2020AB097 ', '2020-06-09 22:24:06', '159.58GB', ' Volleyball - MINNESOTA STATE VS UPPER IOWA', 2, 1, 1, 'Asia'),
('Asia_2020AB098 ', '2020-06-09 22:24:06', '165.09GB', ' Volleyball - MINNESOTA STATE VS BEMIDJI STATE', 2, 1, 1, 'Asia'),
('Asia_2020AB139 ', '2020-06-09 22:24:06', '175.14GB', ' Environment Congress', 2, 1, 1, 'Asia'),
('Asia_2020AB151 ', '2020-06-09 22:24:06', '98.75GB', ' Leadership U', 2, 1, 1, 'Asia'),
('Asia_2020AB154', '2020-06-09 22:24:06', '10.16GB', 'Athletic-Blog-Maverick-Insider-Ep003', 2, 1, 1, 'Asia'),
('Asia_2020AB155 ', '2020-06-09 22:24:06', '208.85GB', ' VB vs Crookston', 2, 1, 1, 'Asia'),
('Asia_2020AB156 ', '2020-06-09 22:24:06', '278.31GB', ' Soccer - Minnesota State VS University of Mary', 2, 1, 1, 'Asia'),
('Asia_2020AB157 MSSA meeting', '2020-06-09 22:24:06', '35.31GB', 'Default', 2, 1, 1, 'Asia'),
('Asia_2020AB161 ', '2020-06-09 22:24:07', '130.64GB', 'Soccer - CENTRAL OKLAHOMA VS AUGUSTANA', 2, 1, 1, 'Asia'),
('Asia_2020AB162 ', '2020-06-09 22:24:07', '145.77GB', ' Soccer - Minnesota State VS AUGUSTANA', 2, 1, 1, 'Asia'),
('Asia_2020AB163 ', '2020-06-09 22:24:07', '208.97GB', 'Football-MSU vs CSU Pueblo', 2, 1, 1, 'Asia'),
('Asia_2020AB164 ', '2020-06-09 22:24:07', '46.68MB', ' Football vs Texas A&M', 2, 1, 1, 'Asia'),
('Asia_2020AB167 ', '2020-06-09 22:24:07', '83.88GB', 'soccer- GRAND VALLEY STATE VS. INDIANAPOLIS', 2, 1, 1, 'Asia'),
('Asia_2020AB177', '2020-06-09 22:24:07', '80.83GB', 'Master-Faculty Association Meeting Spring 2020', 2, 1, 1, 'Asia'),
('Asia_2020AB179 ', '2020-06-09 22:24:07', '81.3GB', ' Student Government (1-29-2020)', 2, 1, 1, 'Asia'),
('Asia_2020AB194 ', '2020-06-09 22:24:07', '157.42GB', ' Wrestling -MNSU Vs Upper Iowa', 2, 1, 1, 'Asia'),
('Asia_2020AB199 ', '2020-06-09 22:24:07', '225.55GB', ' Maverick Open handball tournament SUNDAY( Feb 9 2020 -10am)', 2, 1, 1, 'Asia'),
('Asia_2020AB201 ', '2020-06-09 22:24:07', '0B', ' Good Thunder Reading Series', 2, 1, 1, 'Asia'),
('Asia_promo music', '2020-06-09 22:24:07', '34.99MB', 'Default', 2, 1, 1, 'Asia'),
('WS 04 POST_1', '2020-06-09 22:36:29', '219.18GB', '06-2020- Transcoding', 2, 2, 1, 'WS 04 POST'),
('WS 04 POST_2020AB122', '2020-06-09 22:36:28', '145.33GB', 'Telemental Health', 2, 2, 1, 'WS 04 POST'),
('WS 04 POST_2020AB161', '2020-06-09 22:36:29', '120.06GB', 'Default', 2, 2, 1, 'WS 04 POST'),
('WS 04 POST_2020AB173', '2020-06-09 22:36:29', '1.15KB', 'Default', 2, 2, 1, 'WS 04 POST'),
('WS 04 POST_PD4', '2020-06-09 22:36:29', '3.4MB', 'Default', 2, 2, 1, 'WS 04 POST');

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
  ADD CONSTRAINT `drive_ibfk_1` FOREIGN KEY (`DriveTypeID`) REFERENCES `drive type` (`DriveTypeID`) ON UPDATE CASCADE;

--
-- Constraints for table `project`
--
ALTER TABLE `project`
  ADD CONSTRAINT `project_ibfk_1` FOREIGN KEY (`ProjectPriorityID`) REFERENCES `project priority` (`ProjectPriorityID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `project_ibfk_2` FOREIGN KEY (`ProjectStatusID`) REFERENCES `project status` (`ProjectStatusID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `project_ibfk_3` FOREIGN KEY (`ProjectTypeID`) REFERENCES `project type` (`ProjectTypeID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `project_ibfk_4` FOREIGN KEY (`projectLocation`) REFERENCES `drive` (`DriveID`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
