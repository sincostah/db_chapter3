-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 09, 2021 at 03:14 AM
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
-- Database: `chapter3`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `CustomerID` int(11) NOT NULL,
  `LastName` varchar(10) NOT NULL,
  `FirstName` varchar(10) NOT NULL,
  `Phone` varchar(13) NOT NULL,
  `EmailAdress` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`CustomerID`, `LastName`, `FirstName`, `Phone`, `EmailAdress`) VALUES
(1, 'Stanley', 'Elizabeth', '555-236-7789', 'Elizabeth.Stanley@somewhere.com'),
(2, 'Price', 'Fred', '555-236-0091', 'Fred.Price@somewhere.com'),
(3, 'Becky', 'Linda', '555-236-0392', 'Lina.Becky@somewhere.com'),
(4, 'Birch', 'Pamela', '555-236-4493', 'Pamela.Birch@somewhere.com'),
(5, 'Romez', 'Richardo', '555-236-3334', 'Richardo.Romez@somewhere.com'),
(6, 'Jackson', 'Samantha', '555-236-1095', 'Samantha.Jackson@somewhere.com');

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `ItemNumber` int(11) NOT NULL,
  `ItemDescription` varchar(20) NOT NULL,
  `Cost` decimal(5,2) DEFAULT NULL,
  `ArtistLastName` varchar(20) NOT NULL,
  `ArtistFirstName` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`ItemNumber`, `ItemDescription`, `Cost`, `ArtistLastName`, `ArtistFirstName`) VALUES
(1, 'Gold Bracelet', '120.00', 'Josephson', 'Mary'),
(2, 'Gold Neklace', '160.00', 'Baker', 'Samantha'),
(3, 'Bead Earrings', '50.00', 'Josephson', 'Mary'),
(4, 'Gold Bracelet', '180.00', 'Baker', 'Samantha'),
(5, 'Silver Neklace', '135.00', 'Baker', 'Sam'),
(6, 'Bead Earrings', '25.00', 'Josephson', 'Mary'),
(7, 'Bead Earrings', '22.50', 'Josephson', 'Mary'),
(8, 'Gold Earrings', '50.00', 'Lintz', 'John'),
(9, 'Gold Neklace', '160.00', 'Lintz', 'John'),
(10, 'Bead Earrings', '20.00', 'Josephson', 'Mary'),
(11, 'Bead Earrings', '35.00', 'Josephson', 'Mary'),
(12, 'Bead Earrings', '45.00', 'Josephson', 'Mary'),
(13, 'Gold Neklace', '225.00', 'Lintz', 'John'),
(14, 'Silver Earrings', '55.00', 'Lintz', 'John'),
(15, 'Gold Bracelet', '200.00', 'Lintz', 'John'),
(16, 'Bead Earrings', '25.00', 'Josephson', 'Mary'),
(17, 'Bead Earrings', '45.00', 'Josephson', 'Mary'),
(18, 'Gold Bracelet', '210.00', 'Baker', 'Samantha'),
(19, 'Silver Neklace', '165.00', 'Baker', 'Sam');

-- --------------------------------------------------------

--
-- Table structure for table `purchase`
--

CREATE TABLE `purchase` (
  `InvoiceNumber` int(4) NOT NULL,
  `InvoiceDate` date DEFAULT NULL,
  `PreTaxAmount` decimal(5,2) DEFAULT NULL,
  `CustomerID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `purchase`
--

INSERT INTO `purchase` (`InvoiceNumber`, `InvoiceDate`, `PreTaxAmount`, `CustomerID`) VALUES
(1001, '0000-00-00', '155.00', 1),
(1002, '0000-00-00', '203.00', 2),
(1003, '0000-00-00', '75.00', 3),
(1004, '0000-00-00', '67.00', 4),
(1005, '0000-00-00', '330.00', 5),
(1006, '0000-00-00', '25.00', 1),
(1007, '0000-00-00', '45.00', 3),
(1008, '0000-00-00', '445.00', 1),
(1009, '0000-00-00', '72.00', 6);

-- --------------------------------------------------------

--
-- Table structure for table `purchase_item`
--

CREATE TABLE `purchase_item` (
  `InvoiceNumber` int(4) NOT NULL,
  `InvoiceLineNumber` int(1) NOT NULL,
  `ItemNumber` int(2) NOT NULL,
  `RetailPrice` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `purchase_item`
--

INSERT INTO `purchase_item` (`InvoiceNumber`, `InvoiceLineNumber`, `ItemNumber`, `RetailPrice`) VALUES
(1001, 1, 1, '155.00'),
(1002, 1, 2, '203.00'),
(1003, 1, 3, '75.00'),
(1004, 1, 6, '35.00'),
(1004, 2, 7, '32.00'),
(1005, 1, 4, '240.00'),
(1005, 2, 8, '90.00'),
(1006, 1, 10, '25.00'),
(1007, 1, 11, '45.00'),
(1008, 1, 5, '175.00'),
(1008, 2, 9, '215.00'),
(1008, 3, 12, '55.00'),
(1009, 1, 14, '72.00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CustomerID`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`ItemNumber`);

--
-- Indexes for table `purchase`
--
ALTER TABLE `purchase`
  ADD PRIMARY KEY (`InvoiceNumber`),
  ADD KEY `FKCust` (`CustomerID`);

--
-- Indexes for table `purchase_item`
--
ALTER TABLE `purchase_item`
  ADD KEY `FKPurchase` (`InvoiceNumber`),
  ADD KEY `FKItem` (`ItemNumber`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `CustomerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `ItemNumber` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `purchase`
--
ALTER TABLE `purchase`
  MODIFY `InvoiceNumber` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1010;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `purchase`
--
ALTER TABLE `purchase`
  ADD CONSTRAINT `FKCust` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`);

--
-- Constraints for table `purchase_item`
--
ALTER TABLE `purchase_item`
  ADD CONSTRAINT `FKItem` FOREIGN KEY (`ItemNumber`) REFERENCES `item` (`ItemNumber`),
  ADD CONSTRAINT `FKPurchase` FOREIGN KEY (`InvoiceNumber`) REFERENCES `purchase` (`InvoiceNumber`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
