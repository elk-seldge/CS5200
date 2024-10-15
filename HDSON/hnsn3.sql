-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 02, 2023 at 11:35 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hnsn3`
--

-- --------------------------------------------------------

--
-- Table structure for table `administrator`
--

CREATE TABLE `administrator` (
  `VolunteerID` int(11) NOT NULL,
  `UserName` varchar(30) NOT NULL,
  `UserPassword` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `administrator`
--

INSERT INTO `administrator` (`VolunteerID`, `UserName`, `UserPassword`) VALUES
(1, 'user1', 'password1'),
(2, 'user2', 'password2'),
(3, 'user3', 'password3'),
(4, 'user4', 'password4'),
(5, 'user5', 'password5'),
(6, 'user6', 'password6'),
(7, 'user7', 'password7'),
(8, 'user8', 'password8'),
(9, 'user9', 'password9'),
(10, 'user10', 'password10');

-- --------------------------------------------------------

--
-- Table structure for table `admission`
--

CREATE TABLE `admission` (
  `TypeOfAdmission` varchar(30) NOT NULL,
  `Serverity` int(11) NOT NULL
) ;

--
-- Dumping data for table `admission`
--

INSERT INTO `admission` (`TypeOfAdmission`, `Serverity`) VALUES
('Critical Care', 6),
('Day Surgery', 2),
('Elective', 2),
('Emergency', 5),
('Non-Urgent', 0),
('Outpatient', 1),
('Routine', 3),
('Scheduled', 1),
('Trauma', 5),
('Urgent', 4);

-- --------------------------------------------------------

--
-- Table structure for table `approve_requests_archive`
--

CREATE TABLE `approve_requests_archive` (
  `ApprovedRequestID` int(11) NOT NULL,
  `RequestID` int(11) DEFAULT NULL,
  `InventoryID` int(11) DEFAULT NULL,
  `HospitalID` int(11) DEFAULT NULL,
  `BagID` int(11) DEFAULT NULL,
  `BLoodGroupReq` varchar(3) DEFAULT NULL,
  `BLoodGroupRec` varchar(3) DEFAULT NULL,
  `DatetimeOfDispatch` date DEFAULT NULL,
  `ApproverID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `approve_requests_archive`
--

INSERT INTO `approve_requests_archive` (`ApprovedRequestID`, `RequestID`, `InventoryID`, `HospitalID`, `BagID`, `BLoodGroupReq`, `BLoodGroupRec`, `DatetimeOfDispatch`, `ApproverID`) VALUES
(151, 121, 31, 71, 51, 'A+', 'O+', '2023-01-10', 1),
(152, 122, 32, 72, 52, 'B-', 'AB-', '2023-02-15', 2),
(153, 123, 33, 73, 53, 'O+', 'A-', '2023-03-20', 3),
(154, 124, 34, 74, 54, 'AB+', 'B+', '2023-04-25', 4),
(155, 125, 35, 75, 55, 'B+', 'A+', '2023-05-30', 5),
(156, 126, 36, 76, 56, 'O-', 'AB-', '2023-07-05', 6),
(157, 127, 37, 77, 57, 'A-', 'O-', '2023-08-10', 7),
(158, 128, 38, 78, 58, 'AB-', 'B-', '2023-09-15', 8),
(159, 129, 39, 79, 59, 'A+', 'O+', '2023-10-20', 9),
(160, 130, 40, 80, 60, 'O+', 'A+', '2023-11-25', 10);

-- --------------------------------------------------------

--
-- Table structure for table `blood_bag`
--

CREATE TABLE `blood_bag` (
  `BagID` int(11) NOT NULL,
  `BLoodGroup` varchar(3) NOT NULL,
  `DateOfIssue` date NOT NULL,
  `DateOfuse` date NOT NULL,
  `InventoryID` int(11) NOT NULL,
  `DonorID` int(11) NOT NULL,
  `Available` tinyint(1) NOT NULL DEFAULT 1
) ;

--
-- Dumping data for table `blood_bag`
--

INSERT INTO `blood_bag` (`BagID`, `BLoodGroup`, `DateOfIssue`, `DateOfuse`, `InventoryID`, `DonorID`, `Available`) VALUES
(51, 'A+', '2023-01-01', '2023-01-10', 31, 11, 1),
(52, 'B-', '2023-02-05', '2023-02-15', 32, 12, 1),
(53, 'O+', '2023-03-10', '2023-03-20', 33, 13, 0),
(54, 'AB+', '2023-04-15', '2023-04-25', 34, 14, 1),
(55, 'B+', '2023-05-20', '2023-05-30', 35, 15, 0),
(56, 'O-', '2023-06-25', '2023-07-05', 36, 16, 1),
(57, 'A-', '2023-07-30', '2023-08-10', 37, 17, 1),
(58, 'AB-', '2023-09-05', '2023-09-15', 38, 18, 0),
(59, 'A+', '2023-10-10', '2023-10-20', 39, 19, 1),
(60, 'O+', '2023-11-15', '2023-11-25', 40, 20, 1);

-- --------------------------------------------------------

--
-- Table structure for table `blood_group`
--

CREATE TABLE `blood_group` (
  `BloodGroupType` varchar(3) NOT NULL,
  `TextDescription` text DEFAULT NULL
) ;

--
-- Dumping data for table `blood_group`
--

INSERT INTO `blood_group` (`BloodGroupType`, `TextDescription`) VALUES
('A+', 'positive A'),
('A-', 'negative A'),
('AB+', 'positive AB'),
('AB-', 'negative AB'),
('B+', 'positive B'),
('B-', 'negative B'),
('O+', 'positive O'),
('O-', 'negative O');

-- --------------------------------------------------------

--
-- Table structure for table `blood_group_receiver`
--

CREATE TABLE `blood_group_receiver` (
  `BloodGroupDonor` varchar(3) NOT NULL,
  `BloodGroupReceiver` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blood_group_receiver`
--

INSERT INTO `blood_group_receiver` (`BloodGroupDonor`, `BloodGroupReceiver`) VALUES
('A+', 'A+'),
('A+', 'AB+'),
('A-', 'A+'),
('A-', 'O-'),
('AB+', 'O-'),
('AB-', 'A-'),
('B+', 'A-'),
('B-', 'O+'),
('O+', 'AB-'),
('O-', 'B+');

-- --------------------------------------------------------

--
-- Table structure for table `donor`
--

CREATE TABLE `donor` (
  `DonorID` int(11) NOT NULL,
  `FirstName` char(30) NOT NULL,
  `LastName` char(30) NOT NULL,
  `Street` varchar(30) DEFAULT NULL,
  `State` char(30) DEFAULT NULL,
  `ZipCode` char(5) NOT NULL,
  `Phone` varchar(10) NOT NULL,
  `Gender` char(15) NOT NULL,
  `Age` int(11) NOT NULL,
  `MedicalRemarks` text DEFAULT NULL,
  `BLoodGroup` varchar(3) NOT NULL,
  `DateOfRegistration` date NOT NULL,
  `RegistrarID` int(11) NOT NULL
) ;

--
-- Dumping data for table `donor`
--

INSERT INTO `donor` (`DonorID`, `FirstName`, `LastName`, `Street`, `State`, `ZipCode`, `Phone`, `Gender`, `Age`, `MedicalRemarks`, `BLoodGroup`, `DateOfRegistration`, `RegistrarID`) VALUES
(11, 'John', 'Doe', '123 Main St', 'California', '90210', '1234567890', 'Male', 25, 'None', 'A+', '2023-01-01', 1),
(12, 'Jane', 'Smith', '456 Oak St', 'New York', '10001', '9876543210', 'Female', 30, 'Allergic to penicillin', 'B-', '2023-01-02', 2),
(13, 'Mike', 'Johnson', '789 Pine St', 'Texas', '75001', '5551234567', 'Male', 40, 'None', 'O+', '2023-01-03', 3),
(14, 'Sara', 'Williams', '101 Cedar St', 'Florida', '33101', '7890123456', 'Female', 28, 'High blood pressure', 'AB+', '2023-01-04', 4),
(15, 'David', 'Brown', '202 Elm St', 'Ohio', '44101', '3210987654', 'Male', 35, 'None', 'B+', '2023-01-05', 5),
(16, 'Emily', 'Davis', '303 Maple St', 'Illinois', '60601', '2345678901', 'Female', 22, 'None', 'O-', '2023-01-06', 6),
(17, 'Chris', 'Jones', '404 Birch St', 'Georgia', '30301', '8765432109', 'Male', 45, 'Diabetic', 'A-', '2023-01-07', 7),
(18, 'Olivia', 'Taylor', '505 Walnut St', 'Michigan', '48201', '1357924680', 'Female', 32, 'None', 'AB-', '2023-01-08', 8),
(19, 'Daniel', 'Miller', '606 Spruce St', 'Washington', '98101', '9870123456', 'Male', 27, 'None', 'A+', '2023-01-09', 9),
(20, 'Mia', 'Lee', '707 Fir St', 'Arizona', '85001', '8765432101', 'Female', 38, 'None', 'O+', '2023-01-10', 10);

-- --------------------------------------------------------

--
-- Table structure for table `hospital`
--

CREATE TABLE `hospital` (
  `HospitalID` int(11) NOT NULL,
  `HospitalName` varchar(30) DEFAULT NULL,
  `Street` varchar(30) NOT NULL,
  `State` char(30) NOT NULL,
  `ZipCode` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hospital`
--

INSERT INTO `hospital` (`HospitalID`, `HospitalName`, `Street`, `State`, `ZipCode`) VALUES
(71, 'General Hospital', '123 Main St', 'California', '90210'),
(72, 'City Medical Center', '456 Oak St', 'New York', '10001'),
(73, 'Community Health Clinic', '789 Pine St', 'Texas', '75001'),
(74, 'Sunshine Hospital', '101 Cedar St', 'Florida', '33101'),
(75, 'Metropolitan Medical Center', '202 Elm St', 'Ohio', '44101'),
(76, 'Unity Health Services', '303 Maple St', 'Illinois', '60601'),
(77, 'Peachtree Hospital', '404 Birch St', 'Georgia', '30301'),
(78, 'Lakeview Medical Center', '505 Walnut St', 'Michigan', '48201'),
(79, 'Evergreen Hospital', '606 Spruce St', 'Washington', '98101'),
(80, 'Desert Regional Medical Center', '707 Fir St', 'Arizona', '85001');

-- --------------------------------------------------------

--
-- Table structure for table `hospital_requests_blood`
--

CREATE TABLE `hospital_requests_blood` (
  `RequestID` int(11) NOT NULL,
  `InventoryID` int(11) NOT NULL,
  `HospitalID` int(11) NOT NULL,
  `BagID` int(11) NOT NULL,
  `BLoodGroupReq` varchar(3) NOT NULL,
  `BLoodGroupRec` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hospital_requests_blood`
--

INSERT INTO `hospital_requests_blood` (`RequestID`, `InventoryID`, `HospitalID`, `BagID`, `BLoodGroupReq`, `BLoodGroupRec`) VALUES
(121, 31, 71, 51, 'A+', 'O+'),
(122, 32, 72, 52, 'B-', 'AB-'),
(123, 33, 73, 53, 'O+', 'A-'),
(124, 34, 74, 54, 'AB+', 'B+'),
(125, 35, 75, 55, 'B+', 'A+'),
(126, 36, 76, 56, 'O-', 'AB-'),
(127, 37, 77, 57, 'A-', 'O-'),
(128, 38, 78, 58, 'AB-', 'B-'),
(129, 39, 79, 59, 'A+', 'O+'),
(130, 40, 80, 60, 'O+', 'A+');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `InventoryID` int(11) NOT NULL,
  `Street` varchar(30) NOT NULL,
  `State` char(30) NOT NULL,
  `ZipCode` char(5) NOT NULL,
  `BloodBagQtn` int(11) DEFAULT NULL
) ;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`InventoryID`, `Street`, `State`, `ZipCode`, `BloodBagQtn`) VALUES
(31, '123 Main St', 'California', '90210', 100),
(32, '456 Oak St', 'New York', '10001', 75),
(33, '789 Pine St', 'Texas', '75001', 120),
(34, '101 Cedar St', 'Florida', '33101', 50),
(35, '202 Elm St', 'Ohio', '44101', 90),
(36, '303 Maple St', 'Illinois', '60601', 60),
(37, '404 Birch St', 'Georgia', '30301', 80),
(38, '505 Walnut St', 'Michigan', '48201', 110),
(39, '606 Spruce St', 'Washington', '98101', 95),
(40, '707 Fir St', 'Arizona', '85001', 70);

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `PatientID` int(11) NOT NULL,
  `FirstName` char(30) DEFAULT NULL,
  `LastName` char(30) DEFAULT NULL,
  `BLoodGroup` varchar(3) NOT NULL,
  `Remarks` text DEFAULT NULL,
  `HospitalID` int(11) NOT NULL,
  `AdmissionReason` varchar(30) NOT NULL,
  `Serverity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`PatientID`, `FirstName`, `LastName`, `BLoodGroup`, `Remarks`, `HospitalID`, `AdmissionReason`, `Serverity`) VALUES
(91, 'John', 'Doe', 'A+', 'None', 71, 'Emergency', 5),
(92, 'Jane', 'Smith', 'B-', 'Allergic to penicillin', 72, 'Routine', 3),
(93, 'Mike', 'Johnson', 'O+', 'None', 73, 'Critical Care', 6),
(94, 'Sara', 'Williams', 'AB+', 'High blood pressure', 74, 'Elective', 2),
(95, 'David', 'Brown', 'B+', 'None', 75, 'Urgent', 4),
(96, 'Emily', 'Davis', 'O-', 'None', 76, 'Scheduled', 1),
(97, 'Chris', 'Jones', 'A-', 'Diabetic', 77, 'Non-Urgent', 0),
(98, 'Olivia', 'Taylor', 'AB-', 'None', 78, 'Day Surgery', 2),
(99, 'Daniel', 'Miller', 'A+', 'None', 79, 'Trauma', 5),
(100, 'Mia', 'Lee', 'O+', 'None', 80, 'Outpatient', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administrator`
--
ALTER TABLE `administrator`
  ADD PRIMARY KEY (`VolunteerID`),
  ADD UNIQUE KEY `AK_ADMN` (`UserName`);

--
-- Indexes for table `admission`
--
ALTER TABLE `admission`
  ADD PRIMARY KEY (`TypeOfAdmission`,`Serverity`);

--
-- Indexes for table `approve_requests_archive`
--
ALTER TABLE `approve_requests_archive`
  ADD PRIMARY KEY (`ApprovedRequestID`);

--
-- Indexes for table `blood_bag`
--
ALTER TABLE `blood_bag`
  ADD PRIMARY KEY (`BagID`),
  ADD KEY `FK1_BB` (`BLoodGroup`),
  ADD KEY `FK2_BB` (`InventoryID`),
  ADD KEY `FK3_BB` (`DonorID`);

--
-- Indexes for table `blood_group`
--
ALTER TABLE `blood_group`
  ADD PRIMARY KEY (`BloodGroupType`);

--
-- Indexes for table `blood_group_receiver`
--
ALTER TABLE `blood_group_receiver`
  ADD PRIMARY KEY (`BloodGroupDonor`,`BloodGroupReceiver`),
  ADD KEY `BG_FK2` (`BloodGroupReceiver`);

--
-- Indexes for table `donor`
--
ALTER TABLE `donor`
  ADD PRIMARY KEY (`DonorID`),
  ADD UNIQUE KEY `AK_DNR` (`Phone`),
  ADD KEY `BG_FK` (`BLoodGroup`),
  ADD KEY `ADMN_FK` (`RegistrarID`);

--
-- Indexes for table `hospital`
--
ALTER TABLE `hospital`
  ADD PRIMARY KEY (`HospitalID`),
  ADD UNIQUE KEY `AK_HSPTL` (`HospitalName`);

--
-- Indexes for table `hospital_requests_blood`
--
ALTER TABLE `hospital_requests_blood`
  ADD PRIMARY KEY (`RequestID`),
  ADD KEY `Req_BG_FK1` (`BLoodGroupReq`),
  ADD KEY `Req_BG_FK2` (`BLoodGroupRec`),
  ADD KEY `INVNTRY_FK1` (`InventoryID`),
  ADD KEY `HSPTL_FK1` (`HospitalID`),
  ADD KEY `BB_FK1` (`BagID`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`InventoryID`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`PatientID`),
  ADD KEY `Ptnt_BG_FK1` (`BLoodGroup`),
  ADD KEY `ADM_FK1` (`AdmissionReason`,`Serverity`),
  ADD KEY `Ptnt_HSPTL_FK1` (`HospitalID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `administrator`
--
ALTER TABLE `administrator`
  MODIFY `VolunteerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `approve_requests_archive`
--
ALTER TABLE `approve_requests_archive`
  MODIFY `ApprovedRequestID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=161;

--
-- AUTO_INCREMENT for table `blood_bag`
--
ALTER TABLE `blood_bag`
  MODIFY `BagID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `donor`
--
ALTER TABLE `donor`
  MODIFY `DonorID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hospital`
--
ALTER TABLE `hospital`
  MODIFY `HospitalID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `hospital_requests_blood`
--
ALTER TABLE `hospital_requests_blood`
  MODIFY `RequestID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `InventoryID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `PatientID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blood_bag`
--
ALTER TABLE `blood_bag`
  ADD CONSTRAINT `FK1_BB` FOREIGN KEY (`BLoodGroup`) REFERENCES `blood_group` (`BloodGroupType`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK2_BB` FOREIGN KEY (`InventoryID`) REFERENCES `inventory` (`InventoryID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK3_BB` FOREIGN KEY (`DonorID`) REFERENCES `donor` (`DonorID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `blood_group_receiver`
--
ALTER TABLE `blood_group_receiver`
  ADD CONSTRAINT `BG_FK1` FOREIGN KEY (`BloodGroupDonor`) REFERENCES `blood_group` (`BloodGroupType`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `BG_FK2` FOREIGN KEY (`BloodGroupReceiver`) REFERENCES `blood_group` (`BloodGroupType`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `donor`
--
ALTER TABLE `donor`
  ADD CONSTRAINT `ADMN_FK` FOREIGN KEY (`RegistrarID`) REFERENCES `administrator` (`VolunteerID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `BG_FK` FOREIGN KEY (`BLoodGroup`) REFERENCES `blood_group` (`BloodGroupType`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `hospital_requests_blood`
--
ALTER TABLE `hospital_requests_blood`
  ADD CONSTRAINT `BB_FK1` FOREIGN KEY (`BagID`) REFERENCES `blood_bag` (`BagID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `HSPTL_FK1` FOREIGN KEY (`HospitalID`) REFERENCES `hospital` (`HospitalID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `INVNTRY_FK1` FOREIGN KEY (`InventoryID`) REFERENCES `inventory` (`InventoryID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Req_BG_FK1` FOREIGN KEY (`BLoodGroupReq`) REFERENCES `blood_group` (`BloodGroupType`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Req_BG_FK2` FOREIGN KEY (`BLoodGroupRec`) REFERENCES `blood_group` (`BloodGroupType`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `patient`
--
ALTER TABLE `patient`
  ADD CONSTRAINT `ADM_FK1` FOREIGN KEY (`AdmissionReason`,`Serverity`) REFERENCES `admission` (`TypeOfAdmission`, `Serverity`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Ptnt_BG_FK1` FOREIGN KEY (`BLoodGroup`) REFERENCES `blood_group` (`BloodGroupType`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Ptnt_HSPTL_FK1` FOREIGN KEY (`HospitalID`) REFERENCES `hospital` (`HospitalID`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
