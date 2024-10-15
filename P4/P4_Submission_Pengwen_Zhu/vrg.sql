-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 21, 2023 at 01:32 AM
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
-- Database: `vrg`
--
CREATE DATABASE IF NOT EXISTS `vrg` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `vrg`;

DELIMITER $$
--
-- Procedures
--
DROP PROCEDURE IF EXISTS `InsertCustomerAndInterests`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertCustomerAndInterests` (IN `newLastName` CHAR(25), IN `newFirstName` CHAR(25), IN `newEmailAddress` VARCHAR(100), IN `newAreaCode` CHAR(3), IN `newPhoneNumber` CHAR(8), IN `newNationality` CHAR(30))   BEGIN
    DECLARE varRowCount     Int;
    DECLARE varArtistID     Int;
    DECLARE varCustomerID   Int;
    DECLARE done            Int DEFAULT 0;
    DECLARE ArtistCursor    CURSOR FOR
        SELECT  ArtistID
        FROM    ARTIST
        WHERE   Nationality=newNationality; 
    DECLARE continue    HANDLER FOR NOT FOUND SET done = 1;

    SELECT  COUNT(*) INTO varRowCount 
    FROM    CUSTOMER 
    WHERE   LastName= newLastName AND FirstName = newFirstName AND EmailAddress = newEmailAddress AND AreaCode= newAreaCode AND PhoneNumber= newPhoneNumber;
    IF (varRowCount > 0) THEN
        ROLLBACK;
        SELECT 'Customer already exists'; 
        END IF;
    IF (varRowCount=0) THEN
        INSERT INTO CUSTOMER (LastName, FirstName, EmailAddress, AreaCode, PhoneNumber) VALUES (newLastName, newFirstName, newEmailAddress, newAreaCode, newPhoneNumber);
        SET varCustomerID =LAST_INSERT_ID();
        OPEN    ArtistCursor; 
                REPEAT
                FETCH ArtistCursor INTO varArtistID; 
                IF NOT done THEN
                    INSERT INTO CUSTOMER_ARTIST_INT (ArtistID, CustomerID) VALUES (varArtistID, varCustomerID);
                END IF;
                UNTIL done END REPEAT; 
        CLOSE   ArtistCursor; 
        SELECT 'New customer and artist interest data added to database.' AS InsertCustomerAndInterstsResults;
        END IF; 
END$$

--
-- Functions
--
DROP FUNCTION IF EXISTS `FirstNameFirst`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `FirstNameFirst` (`FrstNm` VARCHAR(25), `LstNm` VARCHAR(25)) RETURNS VARCHAR(60) CHARSET utf8mb4 COLLATE utf8mb4_general_ci DETERMINISTIC BEGIN
	DECLARE
    FllNm varchar(60);
	SET FllNm = CONCAT(FrstNm, ' ', LstNm);
	RETURN FllNm;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `artist`
--

DROP TABLE IF EXISTS `artist`;
CREATE TABLE IF NOT EXISTS `artist` (
  `ArtistID` int(11) NOT NULL AUTO_INCREMENT,
  `LastName` char(25) NOT NULL,
  `FirstName` char(25) NOT NULL,
  `Nationality` char(30) DEFAULT NULL,
  `DateOfBirth` decimal(4,0) DEFAULT NULL,
  `DateDeceased` decimal(4,0) DEFAULT NULL,
  PRIMARY KEY (`ArtistID`),
  UNIQUE KEY `ArtistAK1` (`LastName`,`FirstName`)
) ;

--
-- Dumping data for table `artist`
--

INSERT DELAYED IGNORE INTO `artist` (`ArtistID`, `LastName`, `FirstName`, `Nationality`, `DateOfBirth`, `DateDeceased`) VALUES
(1, 'Miro', 'Joan', 'Spanish', 1893, 1983),
(2, 'Kandinsky', 'Wassily', 'Russian', 1866, 1944),
(3, 'Klee', 'Paul', 'German', 1879, 1940),
(4, 'Matisse', 'Henri', 'French', 1869, 1954),
(5, 'Chagall', 'Marc', 'French', 1887, 1985),
(11, 'Sargent', 'John Singer', 'United States', 1856, 1925),
(17, 'Tobey', 'Mark', 'United States', 1890, 1976),
(18, 'Horiuchi', 'Paul', 'United States', 1906, 1999),
(19, 'Graves', 'Morris', 'United States', 1920, 2001);

-- --------------------------------------------------------

--
-- Stand-in structure for view `artistworknetview`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `artistworknetview`;
CREATE TABLE IF NOT EXISTS `artistworknetview` (
`ArtistLastName` char(25)
,`ArtistFirstName` char(25)
,`WorkID` int(11)
,`Title` char(35)
,`Copy` char(12)
,`DateSold` date
,`AcquisitionPrice` decimal(8,2)
,`SalesPrice` decimal(8,2)
,`NetProfit` decimal(9,2)
);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `CustomerID` int(11) NOT NULL AUTO_INCREMENT,
  `LastName` char(25) NOT NULL,
  `FirstName` char(25) NOT NULL,
  `EmailAddress` varchar(100) DEFAULT NULL,
  `EncryptedPassword` varchar(50) DEFAULT NULL,
  `Street` char(30) DEFAULT NULL,
  `City` char(35) DEFAULT NULL,
  `State` char(2) DEFAULT NULL,
  `ZIPorPostalCode` char(9) DEFAULT NULL,
  `Country` char(50) DEFAULT NULL,
  `AreaCode` char(3) DEFAULT NULL,
  `PhoneNumber` char(8) DEFAULT NULL,
  PRIMARY KEY (`CustomerID`),
  UNIQUE KEY `EmailAK1` (`EmailAddress`)
) ENGINE=InnoDB AUTO_INCREMENT=1053 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT DELAYED IGNORE INTO `customer` (`CustomerID`, `LastName`, `FirstName`, `EmailAddress`, `EncryptedPassword`, `Street`, `City`, `State`, `ZIPorPostalCode`, `Country`, `AreaCode`, `PhoneNumber`) VALUES
(1000, 'Janes', 'Jeffrey', 'Jeffrey.Janes@somewhere.com', 'ng76tG9E', '123 W. Elm St', 'Renton', 'WA', '98055', 'USA', '425', '543-2345'),
(1001, 'Smith', 'David', 'David.Smith@somewhere.com', 'ttr67i23', '813 Tumbleweed Lane', 'Loveland', 'CO', '81201', 'USA', '970', '654-9876'),
(1015, 'Twilight', 'Tiffany', 'Tiffany.Twilight@somewhere.com', 'gr44t5uz', '88 1st Avenue', 'Langley', 'WA', '98260', 'USA', '360', '765-5566'),
(1033, 'Smathers', 'Fred', 'Fred.Smathers@somewhere.com', 'mnF3D00Q', '10899 88th Ave', 'Bainbridge Island', 'WA', '98110', 'USA', '206', '876-9911'),
(1034, 'Frederickson', 'Mary Beth', 'MaryBeth.Frederickson@somewhere.com', 'Nd5qr4Tv', '25 South Lafayette', 'Denver', 'CO', '80201', 'USA', '303', '513-8822'),
(1036, 'Warning', 'Selma', 'Selma.Warning@somewhere.com', 'CAe3Gh98', '205 Burnaby', 'Vancouver', 'BC', 'V6Z 1W2', 'Canada', '604', '988-0512'),
(1037, 'Wu', 'Susan', 'Susan.Wu@somewhere.com', 'Ues3thQ2', '105 Locust Ave', 'Atlanta', 'GA', '30322', 'USA', '404', '653-3465'),
(1040, 'Gray', 'Donald', 'Donald.Gray@somewhere.com', NULL, '55 Bodega Ave', 'Bodega Bay', 'CA', '94923', 'USA', '707', '568-4839'),
(1041, 'Johnson', 'Lynda', NULL, NULL, '117 C Street', 'Washington', 'DC', '20003', 'USA', '202', '438-5498'),
(1051, 'Wilkens', 'Chris', 'Chris.Wilkens@somewhere.com', '45QZjx59', '87 Highland Drive', 'Olympia', 'WA', '98508', 'USA', '360', '876-8822'),
(1052, 'Captain', 'Empire', 'aaa@test.com', NULL, NULL, NULL, NULL, NULL, NULL, '500', '1000-250');

-- --------------------------------------------------------

--
-- Table structure for table `customer_artist_int`
--

DROP TABLE IF EXISTS `customer_artist_int`;
CREATE TABLE IF NOT EXISTS `customer_artist_int` (
  `ArtistID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  PRIMARY KEY (`ArtistID`,`CustomerID`),
  KEY `CAInt_CustomerFK` (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer_artist_int`
--

INSERT DELAYED IGNORE INTO `customer_artist_int` (`ArtistID`, `CustomerID`) VALUES
(1, 1001),
(1, 1034),
(2, 1001),
(2, 1034),
(4, 1001),
(4, 1034),
(5, 1001),
(5, 1034),
(5, 1036),
(11, 1001),
(11, 1015),
(11, 1036),
(17, 1000),
(17, 1015),
(17, 1033),
(17, 1040),
(17, 1051),
(18, 1000),
(18, 1015),
(18, 1033),
(18, 1040),
(18, 1051),
(19, 1000),
(19, 1015),
(19, 1033),
(19, 1036),
(19, 1040),
(19, 1051);

-- --------------------------------------------------------

--
-- Table structure for table `pricelist`
--

DROP TABLE IF EXISTS `pricelist`;
CREATE TABLE IF NOT EXISTS `pricelist` (
  `TransactionID` int(11) DEFAULT NULL,
  `AskingPrice` decimal(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pricelist`
--

INSERT DELAYED IGNORE INTO `pricelist` (`TransactionID`, `AskingPrice`) VALUES
(100, 45000.00),
(101, 500.00),
(102, 250.00),
(103, 500.00),
(104, 250.00),
(105, 500.00),
(115, 3000.00),
(121, 30000.00),
(125, 250.00),
(126, 400.00),
(127, 500.00),
(128, 250.00),
(129, 250.00),
(151, 20000.00),
(152, 250.00),
(153, 400.00),
(154, 500.00),
(155, 500.00),
(156, 500.00),
(161, 15000.00),
(171, 60000.00),
(175, 75000.00),
(181, 500.00),
(201, 3500.00),
(202, 3500.00),
(225, 250.00),
(226, 400.00),
(227, 500.00),
(228, 500.00),
(229, 500.00),
(241, 5000.00),
(251, 50000.00),
(252, 500.00),
(253, 500.00),
(254, 500.00),
(255, 22700.00);

-- --------------------------------------------------------

--
-- Table structure for table `trans`
--

DROP TABLE IF EXISTS `trans`;
CREATE TABLE IF NOT EXISTS `trans` (
  `TransactionID` int(11) NOT NULL AUTO_INCREMENT,
  `DateAcquired` date NOT NULL,
  `AcquisitionPrice` decimal(8,2) NOT NULL,
  `AskingPrice` decimal(8,2) DEFAULT NULL,
  `DateSold` date DEFAULT NULL,
  `SalesPrice` decimal(8,2) DEFAULT NULL,
  `CustomerID` int(11) DEFAULT NULL,
  `WorkID` int(11) NOT NULL,
  PRIMARY KEY (`TransactionID`),
  KEY `TransWorkFK` (`WorkID`),
  KEY `TransCustomerFK` (`CustomerID`)
) ;

--
-- Dumping data for table `trans`
--

INSERT DELAYED IGNORE INTO `trans` (`TransactionID`, `DateAcquired`, `AcquisitionPrice`, `AskingPrice`, `DateSold`, `SalesPrice`, `CustomerID`, `WorkID`) VALUES
(100, '2017-11-04', 30000.00, 45000.00, '2017-12-14', 42500.00, 1000, 500),
(101, '2017-11-07', 250.00, 500.00, '2017-12-19', 500.00, 1015, 511),
(102, '2017-11-17', 125.00, 250.00, '2018-01-18', 200.00, 1001, 521),
(103, '2017-11-17', 250.00, 500.00, '2018-12-12', 400.00, 1034, 522),
(104, '2017-11-17', 250.00, 250.00, '2018-01-18', 200.00, 1001, 523),
(105, '2017-11-17', 200.00, 500.00, '2018-12-12', 400.00, 1034, 524),
(115, '2018-03-03', 1500.00, 3000.00, '2018-06-07', 2750.00, 1033, 537),
(121, '2018-09-21', 15000.00, 30000.00, '2018-11-28', 27500.00, 1015, 548),
(125, '2018-11-21', 125.00, 250.00, '2018-12-18', 200.00, 1001, 551),
(126, '2018-11-21', 200.00, 400.00, NULL, NULL, NULL, 552),
(127, '2018-11-21', 125.00, 500.00, '2018-12-22', 400.00, 1034, 553),
(128, '2018-11-21', 125.00, 250.00, '2019-03-16', 225.00, 1036, 554),
(129, '2018-11-21', 125.00, 250.00, '2019-03-16', 225.00, 1036, 555),
(151, '2019-05-07', 10000.00, 20000.00, '2019-06-28', 17500.00, 1036, 561),
(152, '2019-05-18', 125.00, 250.00, '2019-08-15', 225.00, 1001, 562),
(153, '2019-05-18', 200.00, 400.00, '2019-08-15', 350.00, 1001, 563),
(154, '2019-05-18', 250.00, 500.00, '2019-09-28', 400.00, 1040, 564),
(155, '2019-05-18', 250.00, 500.00, NULL, NULL, NULL, 565),
(156, '2019-05-18', 250.00, 500.00, '2019-09-27', 400.00, 1040, 566),
(161, '2019-06-28', 7500.00, 15000.00, '2019-09-29', 13750.00, 1033, 570),
(171, '2019-08-23', 35000.00, 60000.00, '2019-09-29', 55000.00, 1000, 571),
(175, '2019-09-29', 40000.00, 75000.00, '2019-12-18', 72500.00, 1036, 500),
(181, '2019-10-11', 250.00, 500.00, NULL, NULL, NULL, 578),
(201, '2020-02-28', 2000.00, 3500.00, '2020-04-26', 3250.00, 1040, 580),
(202, '2020-02-28', 2000.00, 3500.00, '2020-04-26', 3250.00, 1040, 581),
(225, '2020-06-08', 125.00, 250.00, '2020-09-27', 225.00, 1051, 585),
(226, '2020-06-08', 200.00, 400.00, NULL, NULL, NULL, 586),
(227, '2020-06-08', 250.00, 500.00, '2020-09-27', 475.00, 1051, 587),
(228, '2020-06-08', 250.00, 500.00, NULL, NULL, NULL, 588),
(229, '2020-06-08', 250.00, 500.00, NULL, NULL, NULL, 589),
(241, '2020-08-29', 2500.00, 5000.00, '2020-09-27', 4750.00, 1015, 590),
(251, '2020-10-25', 25000.00, 50000.00, NULL, NULL, NULL, 593),
(252, '2020-10-27', 250.00, 500.00, NULL, NULL, NULL, 594),
(253, '2020-10-27', 250.00, 500.00, NULL, NULL, NULL, 595),
(254, '2020-10-27', 250.00, 500.00, NULL, NULL, NULL, 596),
(255, '2014-11-08', 200.00, NULL, NULL, NULL, NULL, 500);

--
-- Triggers `trans`
--
DROP TRIGGER IF EXISTS `TRANS_AskingPriceInitialValue`;
DELIMITER $$
CREATE TRIGGER `TRANS_AskingPriceInitialValue` AFTER INSERT ON `trans` FOR EACH ROW BEGIN
	DECLARE		varRowCOunt					Int;
    DECLARE		varPriorRowCount			Int;
    DECLARE		varWorkID					Int;
    DECLARE		varTransactionID			Int;
    DECLARE		varAcquisitionPrice			Numeric(8, 2);
    DECLARE		varNewAskingPrice			Numeric(8, 2);
    DECLARE		varSumNetProfit				Numeric(8, 2);
    DECLARE		varAvgNetProfit				Numeric(8, 2);
    
    SET varTransactionID = NEW.TransactionID;
    SET varAcquisitionPrice = NEW.AcquisitionPrice;
    SET varWorkID = NEW.WorkID;
    
    SELECT COUNT(*) INTO varRowCount
    FROM TRANS
    WHERE WorkID = varWorkID;
    
    SET varPriorRowCount = (varRowCount - 1);
    IF (varPriorRowCount = 0) THEN
    	SET varNewAskingPrice = (2* varAcquisitionPrice);
    ELSE
    	SELECT	SUM(NetProfit) INTO VarSumNetProfit
        FROM ArtistWorkNetView AS AWNV
        WHERE AWNV.WorkID = varWorkID
        GROUP BY AWNV.WorkID;
    
    SET varAvgNetProfit = (varSumNetProfit / varPriorRowCount);
    IF ((varAcquisitionPrice + varAvgNetProfit) > (2* varAcquisitionPrice)) THEN
    	SET varNewAskingPrice = (varAcquisitionPrice + varAvgNetProfit);
    ELSE
    	SET varNewAskingPrice = (2* varAcquisitionPrice);
        END IF;
    END IF;
    INSERT INTO PRICELIST VALUES (varTransactionID, 0);
    UPDATE PRICELIST 
    	SET AskingPrice = varNewAskingPrice
        WHERE TransactionID = varTransactionID;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `work`
--

DROP TABLE IF EXISTS `work`;
CREATE TABLE IF NOT EXISTS `work` (
  `WorkID` int(11) NOT NULL AUTO_INCREMENT,
  `Title` char(35) NOT NULL,
  `Copy` char(12) NOT NULL,
  `Medium` char(35) DEFAULT NULL,
  `Description` varchar(1000) DEFAULT 'Unknown provenance',
  `ArtistID` int(11) NOT NULL,
  PRIMARY KEY (`WorkID`),
  UNIQUE KEY `WorkAK1` (`Title`,`Copy`),
  KEY `ArtistFK` (`ArtistID`)
) ENGINE=InnoDB AUTO_INCREMENT=597 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `work`
--

INSERT DELAYED IGNORE INTO `work` (`WorkID`, `Title`, `Copy`, `Medium`, `Description`, `ArtistID`) VALUES
(500, 'Memories IV', 'Unique', 'Casein rice paper collage', '31 x 24.8 in.', 18),
(511, 'Surf and Bird', '142/500', 'High Quality Limited Print', 'Northwest School Expressionist style', 19),
(521, 'The Tilled Field', '788/1000', 'High Quality Limited Print', 'Early Surrealist style', 1),
(522, 'La Lecon de Ski', '353/500', 'High Quality Limited Print', 'Surrealist style', 1),
(523, 'On White II', '435/500', 'High Quality Limited Print', 'Bauhaus style of Kandinsky', 2),
(524, 'Woman with a Hat', '596/750', 'High Quality Limited Print', 'A very colorful Impressionist piece', 4),
(537, 'The Woven World', '17/750', 'Color lithograph', 'Signed', 17),
(548, 'Night Bird', 'Unique', 'Watercolor on Paper', '50 x 72.5 cm. - Signed', 19),
(551, 'Der Blaue Reiter', '236/1000', 'High Quality Limited Print', 'The Blue Rider-Early Pointilism influence', 2),
(552, 'Angelus Novus', '659/750', 'High Quality Limited Print', 'Bauhaus style of Klee', 3),
(553, 'The Dance', '734/1000', 'High Quality Limited Print', 'An Impressionist masterpiece', 4),
(554, 'I and the Village', '834/1000', 'High Quality Limited Print', 'Shows Belarusian folk-life themes and symbology', 5),
(555, 'Claude Monet Painting', '684/1000', 'High Quality Limited Print', 'Shows French Impressionist influence of Monet', 11),
(561, 'Sunflower', 'Unique', 'Watercolor and ink', '33.3 x 16.1 cm. - Signed', 19),
(562, 'The Fiddler', '251/1000', 'High Quality Limited Print', 'Shows Belarusian folk-life themes and symbology', 5),
(563, 'Spanish Dancer', '583/750', 'High Quality Limited Print', 'American realist style - From work in Spain', 11),
(564, 'Farmer\'s Market #2', '267/500', 'High Quality Limited Print', 'Northwest School Abstract Expressionist style', 17),
(565, 'Farmer\'s Market #2', '268/500', 'High Quality Limited Print', 'Northwest School Abstract Expressionist style', 17),
(566, 'Into Time', '323/500', 'High Quality Limited Print', 'Northwest School Abstract Expressionist style', 18),
(570, 'Untitled Number 1', 'Unique', 'Monotype with tempera', '4.3 x 6.1 in. Signed', 17),
(571, 'Yellow Covers Blue', 'Unique', 'Oil and collage', '71 x 78 in. - Signed', 18),
(578, 'Mid-Century Hibernation', '362/500', 'High Quality Limited Print', 'Northwest School Expressionist style', 19),
(580, 'Forms in Progress I', 'Unique', 'Color aquatint', '19.3 x 24.4 in. - Signed', 17),
(581, 'Forms in Progress II', 'Unique', 'Color aquatint', '19.3 x 24.4 in. - Signed', 17),
(585, 'The Fiddler', '252/1000', 'High Quality Limited Print', 'Shows Belarusian folk-life themes and symbology', 5),
(586, 'Spanish Dancer', '588/750', 'High Quality Limited Print', 'American Realist style - From work in Spain', 11),
(587, 'Broadway Boggie', '433/500', 'High Quality Limited Print', 'Northwest School Abstract Expressionist style', 17),
(588, 'Universal Field', '114/500', 'High Quality Limited Print', 'Northwest School Abstract Expressionist style', 17),
(589, 'Color Floating in Time', '487/500', 'High Quality Limited Print', 'Northwest School Abstract Expressionist style', 18),
(590, 'Blue Interior', 'Unique', 'Tempera on card', '43.9 x 28 in.', 17),
(593, 'Surf and Bird', 'Unique', 'Gouache', '26.5 x 29.75 in. - Signed', 19),
(594, 'Surf and Bird', '362/500', 'High Quality Limited Print', 'Northwest School Expressionist style', 19),
(595, 'Surf and Bird', '365/500', 'High Quality Limited Print', 'Northwest School Expressionist style', 19),
(596, 'Surf and Bird', '366/500', 'High Quality Limited Print', 'Northwest School Expressionist style', 19);

-- --------------------------------------------------------

--
-- Structure for view `artistworknetview`
--
DROP TABLE IF EXISTS `artistworknetview`;

DROP VIEW IF EXISTS `artistworknetview`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `artistworknetview`  AS SELECT `a`.`LastName` AS `ArtistLastName`, `a`.`FirstName` AS `ArtistFirstName`, `w`.`WorkID` AS `WorkID`, `w`.`Title` AS `Title`, `w`.`Copy` AS `Copy`, `t`.`DateSold` AS `DateSold`, `t`.`AcquisitionPrice` AS `AcquisitionPrice`, `t`.`SalesPrice` AS `SalesPrice`, `t`.`SalesPrice`- `t`.`AcquisitionPrice` AS `NetProfit` FROM ((`trans` `t` join `work` `w` on(`t`.`WorkID` = `w`.`WorkID`)) join `artist` `a` on(`w`.`ArtistID` = `a`.`ArtistID`)) ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer_artist_int`
--
ALTER TABLE `customer_artist_int`
  ADD CONSTRAINT `CAInt_ArtistFK` FOREIGN KEY (`ArtistID`) REFERENCES `artist` (`ArtistID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `CAInt_CustomerFK` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `trans`
--
ALTER TABLE `trans`
  ADD CONSTRAINT `TransCustomerFK` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `TransWorkFK` FOREIGN KEY (`WorkID`) REFERENCES `work` (`WorkID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `work`
--
ALTER TABLE `work`
  ADD CONSTRAINT `ArtistFK` FOREIGN KEY (`ArtistID`) REFERENCES `artist` (`ArtistID`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
