-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 03, 2021 at 12:43 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `course_registration`
--

-- --------------------------------------------------------

--
-- Table structure for table `antireq1`
--

CREATE TABLE `antireq1` (
  `DESIG1` char(5) NOT NULL,
  `DESIG2` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `antireq2`
--

CREATE TABLE `antireq2` (
  `DESIG1` char(5) NOT NULL,
  `DESIG2` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `antireq2`
--

INSERT INTO `antireq2` (`DESIG1`, `DESIG2`) VALUES
('IF213', 'IF212');

-- --------------------------------------------------------

--
-- Table structure for table `antireq3`
--

CREATE TABLE `antireq3` (
  `DESIG1` char(5) NOT NULL,
  `DESIG2` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `antireq4`
--

CREATE TABLE `antireq4` (
  `DESIG1` char(5) NOT NULL,
  `DESIG2` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `DESIG` char(5) NOT NULL,
  `TITLE` char(30) NOT NULL,
  `DESCR` char(150) NOT NULL,
  `CLASSROOM` char(5) NOT NULL,
  `YEAR` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`DESIG`, `TITLE`, `DESCR`, `CLASSROOM`, `YEAR`) VALUES
('IF101', 'Pemrograman Dasar', 'TEST', 'L111', '1'),
('IF211', 'Kecerdasan Buatan', '....', 'L201', '2'),
('IF212', 'ISBD', '....', 'L202', '2'),
('IF213', 'Patriotisme', '....', 'L204', '2'),
('IF301', 'Pengembangan Sistem Cerdas', '...', 'L301', '3');

--
-- Triggers `course`
--
DELIMITER $$
CREATE TRIGGER `insert_yxCourse` AFTER INSERT ON `course` FOR EACH ROW BEGIN
	IF NEW.YEAR = 1 THEN
    	INSERT y1course
        SET DESIG = NEW.DESIG;
	ELSEIF NEW.YEAR = 2 THEN
    	INSERT y2course
        SET DESIG = NEW.DESIG;
    ELSEIF NEW.YEAR = 3 THEN
    	INSERT y3course
        SET DESIG = NEW.DESIG;
    ELSEIF NEW.YEAR = 4 THEN
    	INSERT y4course
        SET DESIG = NEW.DESIG;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `hasi`
--

CREATE TABLE `hasi` (
  `DESIG` char(5) NOT NULL,
  `ID` char(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hasi`
--

INSERT INTO `hasi` (`DESIG`, `ID`) VALUES
('IF101', 'P000004'),
('IF212', 'P000004'),
('IF213', 'P000004'),
('IF211', 'P000005'),
('IF301', 'P000005');

-- --------------------------------------------------------

--
-- Table structure for table `hasla`
--

CREATE TABLE `hasla` (
  `DESIG` char(5) NOT NULL,
  `SECTION` int(11) NOT NULL,
  `ID` char(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `hasta`
--

CREATE TABLE `hasta` (
  `DESIG` char(5) NOT NULL,
  `SECTION` int(11) NOT NULL,
  `ID` char(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `instructor`
--

CREATE TABLE `instructor` (
  `ID` char(7) NOT NULL,
  `DEPT` char(4) NOT NULL,
  `ROOM` char(5) NOT NULL,
  `EXTENSION` char(5) NOT NULL,
  `EMAIL` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `instructor`
--

INSERT INTO `instructor` (`ID`, `DEPT`, `ROOM`, `EXTENSION`, `EMAIL`) VALUES
('P000004', 'IFR', 'L399', '61999', 'rifki@gmail.com'),
('P000005', 'IFR', 'L398', '61998', 'anggi@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `l1`
--

CREATE TABLE `l1` (
  `ID` char(7) NOT NULL,
  `DESIG` char(5) NOT NULL,
  `STATUS` char(1) NOT NULL CHECK (`STATUS` in ('P','F','R'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `l2`
--

CREATE TABLE `l2` (
  `ID` char(7) NOT NULL,
  `DESIG` char(5) NOT NULL,
  `STATUS` char(1) NOT NULL CHECK (`STATUS` in ('P','F','R'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `l3`
--

CREATE TABLE `l3` (
  `ID` char(7) NOT NULL,
  `DESIG` char(5) NOT NULL,
  `STATUS` char(1) NOT NULL CHECK (`STATUS` in ('P','F','R'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `l4`
--

CREATE TABLE `l4` (
  `ID` char(7) NOT NULL,
  `DESIG` char(5) NOT NULL,
  `STATUS` char(1) NOT NULL CHECK (`STATUS` in ('P','F','R'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `la`
--

CREATE TABLE `la` (
  `ID` char(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `lab`
--

CREATE TABLE `lab` (
  `DESIG` char(5) NOT NULL,
  `SECTION` int(11) NOT NULL,
  `LABROOM` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `ID` char(7) NOT NULL,
  `NAME` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`ID`, `NAME`) VALUES
('P000001', 'safri'),
('P000002', 'nabil'),
('P000003', 'imron'),
('P000004', 'rifki'),
('P000005', 'anggi');

-- --------------------------------------------------------

--
-- Table structure for table `prereq11`
--

CREATE TABLE `prereq11` (
  `DESIG1` char(5) NOT NULL,
  `DESIG2` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `prereq12`
--

CREATE TABLE `prereq12` (
  `DESIG1` char(5) NOT NULL,
  `DESIG2` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `prereq13`
--

CREATE TABLE `prereq13` (
  `DESIG1` char(5) NOT NULL,
  `DESIG2` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `prereq14`
--

CREATE TABLE `prereq14` (
  `DESIG1` char(5) NOT NULL,
  `DESIG2` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `prereq22`
--

CREATE TABLE `prereq22` (
  `DESIG1` char(5) NOT NULL,
  `DESIG2` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `prereq23`
--

CREATE TABLE `prereq23` (
  `DESIG1` char(5) NOT NULL,
  `DESIG2` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `prereq23`
--

INSERT INTO `prereq23` (`DESIG1`, `DESIG2`) VALUES
('IF211', 'IF301');

-- --------------------------------------------------------

--
-- Table structure for table `prereq24`
--

CREATE TABLE `prereq24` (
  `DESIG1` char(5) NOT NULL,
  `DESIG2` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `prereq33`
--

CREATE TABLE `prereq33` (
  `DESIG1` char(5) NOT NULL,
  `DESIG2` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `prereq34`
--

CREATE TABLE `prereq34` (
  `DESIG1` char(5) NOT NULL,
  `DESIG2` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `prereq44`
--

CREATE TABLE `prereq44` (
  `DESIG1` char(5) NOT NULL,
  `DESIG2` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `ID` char(7) NOT NULL,
  `DEPT` char(4) NOT NULL,
  `ROOM` char(5) NOT NULL,
  `EXTENSION` char(5) NOT NULL,
  `EMAIL` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `ID` char(7) NOT NULL,
  `YEAR` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`ID`, `YEAR`) VALUES
('P000001', 1),
('P000002', 2),
('P000003', 3);

-- --------------------------------------------------------

--
-- Table structure for table `ta`
--

CREATE TABLE `ta` (
  `ID` char(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tutorial`
--

CREATE TABLE `tutorial` (
  `DESIG` char(5) NOT NULL,
  `SECTION` int(11) NOT NULL,
  `CLASSROOM` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `y1course`
--

CREATE TABLE `y1course` (
  `DESIG` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `y1course`
--

INSERT INTO `y1course` (`DESIG`) VALUES
('IF101');

-- --------------------------------------------------------

--
-- Table structure for table `y2course`
--

CREATE TABLE `y2course` (
  `DESIG` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `y2course`
--

INSERT INTO `y2course` (`DESIG`) VALUES
('IF211'),
('IF212'),
('IF213');

-- --------------------------------------------------------

--
-- Table structure for table `y3course`
--

CREATE TABLE `y3course` (
  `DESIG` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `y3course`
--

INSERT INTO `y3course` (`DESIG`) VALUES
('IF301');

-- --------------------------------------------------------

--
-- Table structure for table `y4course`
--

CREATE TABLE `y4course` (
  `DESIG` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `antireq1`
--
ALTER TABLE `antireq1`
  ADD PRIMARY KEY (`DESIG1`,`DESIG2`),
  ADD KEY `DESIG2` (`DESIG2`);

--
-- Indexes for table `antireq2`
--
ALTER TABLE `antireq2`
  ADD PRIMARY KEY (`DESIG1`,`DESIG2`),
  ADD KEY `DESIG2` (`DESIG2`);

--
-- Indexes for table `antireq3`
--
ALTER TABLE `antireq3`
  ADD PRIMARY KEY (`DESIG1`,`DESIG2`),
  ADD KEY `DESIG2` (`DESIG2`);

--
-- Indexes for table `antireq4`
--
ALTER TABLE `antireq4`
  ADD PRIMARY KEY (`DESIG1`,`DESIG2`),
  ADD KEY `DESIG2` (`DESIG2`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`DESIG`);

--
-- Indexes for table `hasi`
--
ALTER TABLE `hasi`
  ADD PRIMARY KEY (`DESIG`),
  ADD KEY `ID` (`ID`);

--
-- Indexes for table `hasla`
--
ALTER TABLE `hasla`
  ADD PRIMARY KEY (`DESIG`,`SECTION`),
  ADD KEY `ID` (`ID`);

--
-- Indexes for table `hasta`
--
ALTER TABLE `hasta`
  ADD PRIMARY KEY (`DESIG`,`SECTION`),
  ADD KEY `ID` (`ID`);

--
-- Indexes for table `instructor`
--
ALTER TABLE `instructor`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `INSTRUCTOR_C2` (`EMAIL`);

--
-- Indexes for table `l1`
--
ALTER TABLE `l1`
  ADD PRIMARY KEY (`ID`,`DESIG`),
  ADD KEY `DESIG` (`DESIG`);

--
-- Indexes for table `l2`
--
ALTER TABLE `l2`
  ADD PRIMARY KEY (`ID`,`DESIG`),
  ADD KEY `DESIG` (`DESIG`);

--
-- Indexes for table `l3`
--
ALTER TABLE `l3`
  ADD PRIMARY KEY (`ID`,`DESIG`),
  ADD KEY `DESIG` (`DESIG`);

--
-- Indexes for table `l4`
--
ALTER TABLE `l4`
  ADD PRIMARY KEY (`ID`,`DESIG`),
  ADD KEY `DESIG` (`DESIG`);

--
-- Indexes for table `la`
--
ALTER TABLE `la`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `lab`
--
ALTER TABLE `lab`
  ADD PRIMARY KEY (`DESIG`,`SECTION`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `prereq11`
--
ALTER TABLE `prereq11`
  ADD PRIMARY KEY (`DESIG1`,`DESIG2`);

--
-- Indexes for table `prereq12`
--
ALTER TABLE `prereq12`
  ADD PRIMARY KEY (`DESIG1`,`DESIG2`),
  ADD KEY `DESIG2` (`DESIG2`);

--
-- Indexes for table `prereq13`
--
ALTER TABLE `prereq13`
  ADD PRIMARY KEY (`DESIG1`,`DESIG2`),
  ADD KEY `DESIG2` (`DESIG2`);

--
-- Indexes for table `prereq14`
--
ALTER TABLE `prereq14`
  ADD PRIMARY KEY (`DESIG1`,`DESIG2`),
  ADD KEY `DESIG2` (`DESIG2`);

--
-- Indexes for table `prereq22`
--
ALTER TABLE `prereq22`
  ADD PRIMARY KEY (`DESIG1`,`DESIG2`),
  ADD KEY `DESIG2` (`DESIG2`);

--
-- Indexes for table `prereq23`
--
ALTER TABLE `prereq23`
  ADD PRIMARY KEY (`DESIG1`,`DESIG2`),
  ADD KEY `DESIG2` (`DESIG2`);

--
-- Indexes for table `prereq24`
--
ALTER TABLE `prereq24`
  ADD PRIMARY KEY (`DESIG1`,`DESIG2`),
  ADD KEY `DESIG2` (`DESIG2`);

--
-- Indexes for table `prereq33`
--
ALTER TABLE `prereq33`
  ADD PRIMARY KEY (`DESIG1`,`DESIG2`),
  ADD KEY `DESIG2` (`DESIG2`);

--
-- Indexes for table `prereq34`
--
ALTER TABLE `prereq34`
  ADD PRIMARY KEY (`DESIG1`,`DESIG2`),
  ADD KEY `DESIG2` (`DESIG2`);

--
-- Indexes for table `prereq44`
--
ALTER TABLE `prereq44`
  ADD PRIMARY KEY (`DESIG1`,`DESIG2`),
  ADD KEY `DESIG2` (`DESIG2`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `STAFF_C2` (`EMAIL`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `ta`
--
ALTER TABLE `ta`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tutorial`
--
ALTER TABLE `tutorial`
  ADD PRIMARY KEY (`DESIG`,`SECTION`);

--
-- Indexes for table `y1course`
--
ALTER TABLE `y1course`
  ADD PRIMARY KEY (`DESIG`);

--
-- Indexes for table `y2course`
--
ALTER TABLE `y2course`
  ADD PRIMARY KEY (`DESIG`);

--
-- Indexes for table `y3course`
--
ALTER TABLE `y3course`
  ADD PRIMARY KEY (`DESIG`);

--
-- Indexes for table `y4course`
--
ALTER TABLE `y4course`
  ADD PRIMARY KEY (`DESIG`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `antireq1`
--
ALTER TABLE `antireq1`
  ADD CONSTRAINT `antireq1_ibfk_1` FOREIGN KEY (`DESIG1`) REFERENCES `y1course` (`DESIG`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `antireq1_ibfk_2` FOREIGN KEY (`DESIG2`) REFERENCES `y1course` (`DESIG`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `antireq2`
--
ALTER TABLE `antireq2`
  ADD CONSTRAINT `antireq2_ibfk_1` FOREIGN KEY (`DESIG1`) REFERENCES `y2course` (`DESIG`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `antireq2_ibfk_2` FOREIGN KEY (`DESIG2`) REFERENCES `y2course` (`DESIG`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `antireq3`
--
ALTER TABLE `antireq3`
  ADD CONSTRAINT `antireq3_ibfk_1` FOREIGN KEY (`DESIG1`) REFERENCES `y3course` (`DESIG`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `antireq3_ibfk_2` FOREIGN KEY (`DESIG2`) REFERENCES `y3course` (`DESIG`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `antireq4`
--
ALTER TABLE `antireq4`
  ADD CONSTRAINT `antireq4_ibfk_1` FOREIGN KEY (`DESIG1`) REFERENCES `y4course` (`DESIG`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `antireq4_ibfk_2` FOREIGN KEY (`DESIG2`) REFERENCES `y4course` (`DESIG`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hasi`
--
ALTER TABLE `hasi`
  ADD CONSTRAINT `hasi_ibfk_1` FOREIGN KEY (`DESIG`) REFERENCES `course` (`DESIG`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hasi_ibfk_2` FOREIGN KEY (`ID`) REFERENCES `instructor` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hasla`
--
ALTER TABLE `hasla`
  ADD CONSTRAINT `hasla_ibfk_1` FOREIGN KEY (`DESIG`,`SECTION`) REFERENCES `lab` (`DESIG`, `SECTION`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hasla_ibfk_2` FOREIGN KEY (`ID`) REFERENCES `la` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hasta`
--
ALTER TABLE `hasta`
  ADD CONSTRAINT `hasta_ibfk_1` FOREIGN KEY (`DESIG`,`SECTION`) REFERENCES `tutorial` (`DESIG`, `SECTION`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hasta_ibfk_2` FOREIGN KEY (`ID`) REFERENCES `ta` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `instructor`
--
ALTER TABLE `instructor`
  ADD CONSTRAINT `instructor_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `person` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `l1`
--
ALTER TABLE `l1`
  ADD CONSTRAINT `l1_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `student` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `l1_ibfk_2` FOREIGN KEY (`DESIG`) REFERENCES `y1course` (`DESIG`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `l2`
--
ALTER TABLE `l2`
  ADD CONSTRAINT `l2_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `student` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `l2_ibfk_2` FOREIGN KEY (`DESIG`) REFERENCES `y2course` (`DESIG`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `l3`
--
ALTER TABLE `l3`
  ADD CONSTRAINT `l3_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `student` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `l3_ibfk_2` FOREIGN KEY (`DESIG`) REFERENCES `y3course` (`DESIG`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `l4`
--
ALTER TABLE `l4`
  ADD CONSTRAINT `l4_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `student` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `l4_ibfk_2` FOREIGN KEY (`DESIG`) REFERENCES `y4course` (`DESIG`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `la`
--
ALTER TABLE `la`
  ADD CONSTRAINT `la_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `staff` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lab`
--
ALTER TABLE `lab`
  ADD CONSTRAINT `lab_ibfk_1` FOREIGN KEY (`DESIG`) REFERENCES `course` (`DESIG`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `prereq12`
--
ALTER TABLE `prereq12`
  ADD CONSTRAINT `prereq12_ibfk_1` FOREIGN KEY (`DESIG1`) REFERENCES `y1course` (`DESIG`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `prereq12_ibfk_2` FOREIGN KEY (`DESIG2`) REFERENCES `y2course` (`DESIG`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `prereq13`
--
ALTER TABLE `prereq13`
  ADD CONSTRAINT `prereq13_ibfk_1` FOREIGN KEY (`DESIG1`) REFERENCES `y1course` (`DESIG`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `prereq13_ibfk_2` FOREIGN KEY (`DESIG2`) REFERENCES `y3course` (`DESIG`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `prereq14`
--
ALTER TABLE `prereq14`
  ADD CONSTRAINT `prereq14_ibfk_1` FOREIGN KEY (`DESIG1`) REFERENCES `y1course` (`DESIG`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `prereq14_ibfk_2` FOREIGN KEY (`DESIG2`) REFERENCES `y4course` (`DESIG`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `prereq22`
--
ALTER TABLE `prereq22`
  ADD CONSTRAINT `prereq22_ibfk_1` FOREIGN KEY (`DESIG1`) REFERENCES `y2course` (`DESIG`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `prereq22_ibfk_2` FOREIGN KEY (`DESIG2`) REFERENCES `y2course` (`DESIG`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `prereq23`
--
ALTER TABLE `prereq23`
  ADD CONSTRAINT `prereq23_ibfk_1` FOREIGN KEY (`DESIG1`) REFERENCES `y2course` (`DESIG`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `prereq23_ibfk_2` FOREIGN KEY (`DESIG2`) REFERENCES `y3course` (`DESIG`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `prereq24`
--
ALTER TABLE `prereq24`
  ADD CONSTRAINT `prereq24_ibfk_1` FOREIGN KEY (`DESIG1`) REFERENCES `y2course` (`DESIG`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `prereq24_ibfk_2` FOREIGN KEY (`DESIG2`) REFERENCES `y4course` (`DESIG`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `prereq33`
--
ALTER TABLE `prereq33`
  ADD CONSTRAINT `prereq33_ibfk_1` FOREIGN KEY (`DESIG1`) REFERENCES `y3course` (`DESIG`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `prereq33_ibfk_2` FOREIGN KEY (`DESIG2`) REFERENCES `y3course` (`DESIG`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `prereq34`
--
ALTER TABLE `prereq34`
  ADD CONSTRAINT `prereq34_ibfk_1` FOREIGN KEY (`DESIG1`) REFERENCES `y3course` (`DESIG`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `prereq34_ibfk_2` FOREIGN KEY (`DESIG2`) REFERENCES `y4course` (`DESIG`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `prereq44`
--
ALTER TABLE `prereq44`
  ADD CONSTRAINT `prereq44_ibfk_1` FOREIGN KEY (`DESIG1`) REFERENCES `y4course` (`DESIG`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `prereq44_ibfk_2` FOREIGN KEY (`DESIG2`) REFERENCES `y4course` (`DESIG`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `person` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `person` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ta`
--
ALTER TABLE `ta`
  ADD CONSTRAINT `ta_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `staff` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tutorial`
--
ALTER TABLE `tutorial`
  ADD CONSTRAINT `tutorial_ibfk_1` FOREIGN KEY (`DESIG`) REFERENCES `course` (`DESIG`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `y1course`
--
ALTER TABLE `y1course`
  ADD CONSTRAINT `y1_course` FOREIGN KEY (`DESIG`) REFERENCES `course` (`DESIG`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `y2course`
--
ALTER TABLE `y2course`
  ADD CONSTRAINT `y2_course` FOREIGN KEY (`DESIG`) REFERENCES `course` (`DESIG`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `y3course`
--
ALTER TABLE `y3course`
  ADD CONSTRAINT `y3_course` FOREIGN KEY (`DESIG`) REFERENCES `course` (`DESIG`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `y4course`
--
ALTER TABLE `y4course`
  ADD CONSTRAINT `y4_course` FOREIGN KEY (`DESIG`) REFERENCES `course` (`DESIG`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
