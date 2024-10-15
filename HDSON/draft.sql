CREATE DATABASE HNSON2;
CREATE TABLE `administrator` (
    `VolunteerID` Int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `UserName` VARCHAR(30) NOT NULL,
    `Password` VARCHAR(20) NOT NULL
    ) AUTO_INCREMENT = 1;

CREATE TABLE `blood_group` (
      `BloodGroupType` VARCHAR(3) NOT NULL,
      `TextDescription` TEXT DEFAULT NULL
      );
-- `DateOfBirth` decimal(4,0) DEFAULT NULL,
--  `DateDeceased` decimal(4,0) DEFAULT NULL

CREATE TABLE `donor` ( -- add trigger
    `DonorID` int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `FirstName` CHAR(30) NOT NULL,
    `LastName` CHAR(30) NOT NULL,
    `Street` CHAR(30) DEFAULT NULL,
    `State` CHAR(30) DEFAULT NULL,
    `ZipCode` CHAR(5) NOT NULL,
    `Phone` VARCHAR(10) NOT NULL,
    `Gender` CHAR(15) NOT NULL,
    `Age` Int NOT NULL,
    `MedicalRemarks` TEXT DEFAULT NULL,
    'BLoodGroup' VARCHAR(3),
    'DateOfRegistration' DATE,
    'RegistrarID' Int,
    FOREIGN KEY ('BLoodGroup') REFERENCES blood_group(`BloodGroupType`),
    FOREIGN KEY ('RegistrarID') REFERENCES administrator(`VolunteerID`)  
) AUTO_INCREMENT = 1;

CREATE TABLE `inventory` (
    `InventoryID` int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `FirstName` CHAR(30) NOT NULL,
    `LastName` CHAR(30) NOT NULL,
    `Street` CHAR(30) DEFAULT NULL,
    `State` CHAR(30) DEFAULT NULL,
    `ZipCode` CHAR(5) NOT NULL,
    `Phone` VARCHAR(10) NOT NULL,
    `Gender` CHAR(15) NOT NULL,
    `Age` Int NOT NULL,
    `MedicalRemarks` TEXT DEFAULT NULL,
    'BLoodGroup' VARCHAR(3),
    'DateOfRegistration' DATE,
    'RegistrarID' Int,
    FOREIGN KEY ('BLoodGroup') REFERENCES blood_group(`BloodGroupType`),
    FOREIGN KEY ('RegistrarID') REFERENCES administrator(`VolunteerID`)  
) AUTO_INCREMENT = 1;

CREATE TABLE `blood_bag` ( -- add trigger
    `DonorID` int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `FirstName` CHAR(30) NOT NULL,
    `LastName` CHAR(30) NOT NULL,
    `Street` CHAR(30) DEFAULT NULL,
    `State` CHAR(30) DEFAULT NULL,
    `ZipCode` CHAR(5) NOT NULL,
    `Phone` VARCHAR(10) NOT NULL,
    `Gender` CHAR(15) NOT NULL,
    `Age` Int NOT NULL,
    `MedicalRemarks` TEXT DEFAULT NULL,
    'BLoodGroup' VARCHAR(3),
    'DateOfRegistration' DATE,
    'RegistrarID' Int,
    FOREIGN KEY ('BLoodGroup') REFERENCES blood_group(`BloodGroupType`),
    FOREIGN KEY ('RegistrarID') REFERENCES administrator(`VolunteerID`)  
) AUTO_INCREMENT = 1;


