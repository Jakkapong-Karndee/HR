-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 08, 2021 at 12:51 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hr`
--

-- --------------------------------------------------------

--
-- Table structure for table `company_event`
--

CREATE TABLE `company_event` (
  `Event_ID` int(11) NOT NULL,
  `Event_Name` varchar(45) NOT NULL,
  `Event_Date_Start` datetime NOT NULL,
  `Event_Date_End` datetime NOT NULL,
  `Event_Detail` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `company_event`
--

INSERT INTO `company_event` (`Event_ID`, `Event_Name`, `Event_Date_Start`, `Event_Date_End`, `Event_Detail`) VALUES
(1, 'Holiday1', '2021-11-16 00:00:00', '2021-11-17 00:00:00', '');

-- --------------------------------------------------------

--
-- Table structure for table `hr_staff`
--

CREATE TABLE `hr_staff` (
  `HR_ID` int(11) NOT NULL,
  `HR_Role` varchar(25) NOT NULL,
  `HR_WorkDate` varchar(25) NOT NULL,
  `HR_WorkTimeStart` time NOT NULL,
  `HR_WorkTimeEnd` time NOT NULL,
  `User_ID` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `leaving_form`
--

CREATE TABLE `leaving_form` (
  `Form_ID` int(8) NOT NULL,
  `Form_Title` varchar(45) NOT NULL,
  `Form_detail` text NOT NULL,
  `Form_status` varchar(16) NOT NULL,
  `Form_DateStart` date NOT NULL,
  `Form_DateEnd` date NOT NULL,
  `User_ID` int(8) NOT NULL,
  `Form_EL` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `User_ID` int(8) NOT NULL,
  `User_FNAME` varchar(45) NOT NULL,
  `User_LName` varchar(45) NOT NULL,
  `User_Gender` varchar(6) NOT NULL,
  `User_DOB` date NOT NULL,
  `User_Department` varchar(25) NOT NULL,
  `User_Position` varchar(25) NOT NULL,
  `User_Email` varchar(25) NOT NULL,
  `User_Tel` varchar(25) NOT NULL,
  `User_Address` text NOT NULL,
  `User_Username` varchar(25) NOT NULL,
  `User_Password` varchar(25) NOT NULL,
  `User_Quota` int(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`User_ID`, `User_FNAME`, `User_LName`, `User_Gender`, `User_DOB`, `User_Department`, `User_Position`, `User_Email`, `User_Tel`, `User_Address`, `User_Username`, `User_Password`, `User_Quota`) VALUES
(1, 'adminname', 'adminlast', 'Male', '1990-11-21', 'admin', 'admin', 'admin@mail.com', '0433456634565', 'admin house, admin captial, adminland, adminworld', 'admin', 'admin', 0),
(2, 'hrname', 'hrlast', 'Female', '2021-11-03', 'hr', 'hr', 'hr', 'hr', 'hr', 'hr', 'hr', 0),
(3, 'username', 'userlast', 'Male', '2021-11-01', 'Sell', 'staff', 'staff', 'staff', 'staff', 'staff', 'staff', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_has_company_event`
--

CREATE TABLE `user_has_company_event` (
  `User_ID` int(8) NOT NULL,
  `Event_ID` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `company_event`
--
ALTER TABLE `company_event`
  ADD PRIMARY KEY (`Event_ID`);

--
-- Indexes for table `hr_staff`
--
ALTER TABLE `hr_staff`
  ADD PRIMARY KEY (`HR_ID`),
  ADD KEY `User_User_ID` (`User_ID`);

--
-- Indexes for table `leaving_form`
--
ALTER TABLE `leaving_form`
  ADD PRIMARY KEY (`Form_ID`),
  ADD KEY `User_ID` (`User_ID`) USING BTREE;

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`User_ID`);

--
-- Indexes for table `user_has_company_event`
--
ALTER TABLE `user_has_company_event`
  ADD KEY `Company Event_Event_ID` (`Event_ID`),
  ADD KEY `User_User_ID` (`User_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `company_event`
--
ALTER TABLE `company_event`
  MODIFY `Event_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `hr_staff`
--
ALTER TABLE `hr_staff`
  MODIFY `HR_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leaving_form`
--
ALTER TABLE `leaving_form`
  MODIFY `Form_ID` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `User_ID` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `hr_staff`
--
ALTER TABLE `hr_staff`
  ADD CONSTRAINT `hr_staff_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`);

--
-- Constraints for table `leaving_form`
--
ALTER TABLE `leaving_form`
  ADD CONSTRAINT `leaving_form_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`);

--
-- Constraints for table `user_has_company_event`
--
ALTER TABLE `user_has_company_event`
  ADD CONSTRAINT `user_has_company_event_ibfk_1` FOREIGN KEY (`Event_ID`) REFERENCES `company_event` (`Event_ID`),
  ADD CONSTRAINT `user_has_company_event_ibfk_2` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
