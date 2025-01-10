-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 09, 2025 at 08:39 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `real_estate_business`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_agents`
--

CREATE TABLE `tbl_agents` (
  `Agent_ID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Contact_Number` varchar(15) DEFAULT NULL,
  `Commission_Rate` decimal(5,2) DEFAULT NULL CHECK (`Commission_Rate` > 0)
) ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_clients`
--

CREATE TABLE `tbl_clients` (
  `Client_ID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Contact_Number` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Prefrences` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_properties;`
--

CREATE TABLE `tbl_properties;` (
  `Property_ID` int(11) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `City` varchar(100) NOT NULL,
  `Type` varchar(50) NOT NULL,
  `Size` int(11) NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  `Status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_properties;`
--

INSERT INTO `tbl_properties;` (`Property_ID`, `Address`, `City`, `Type`, `Size`, `Price`, `Status`) VALUES
(1, 'Andrews Kakiika', 'Mbarara', 'Commercial', 500, 500000.00, 'Rented'),
(2, '101 old park', 'Kampala', 'Residential', 5000, 170000.00, 'Available'),
(3, '50 Main St', 'Entebbe', 'Commercial', 3000, 5640000.00, 'Sold'),
(4, '22 Oak Ln', 'Kampala', 'Residential', 3900, 600000.00, 'Rented'),
(5, 'Industrial area', 'Jinja', 'Industrial', 5600, 1000000.00, 'Available'),
(6, 'Amazon High Street', 'Mbarara', 'Residential', 1200, 4000000.00, 'Sold'),
(7, 'Nakasero Market', 'Kampala', 'Residential', 300, 40000.00, 'Sold'),
(8, '7 Velm St', 'Entebbe', 'Commercial', 3800, 2900000.00, 'Available'),
(9, '300 Park Ave', 'Kampala', 'Industrial', 5800, 500000.00, 'Sold'),
(10, '15 Industrial Rd', 'Kampala', 'Industrial', 8900, 490000.00, 'Rented');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_transactions`
--

CREATE TABLE `tbl_transactions` (
  `Tansaction_ID` int(11) NOT NULL,
  `Property_ID` int(11) NOT NULL,
  `Agent_ID` int(11) NOT NULL,
  `Client_ID` int(11) NOT NULL,
  `Transaction_Type` varchar(10) DEFAULT NULL CHECK (`Transaction_Type` in ('Buy','Sell','Rent')),
  `Date` date NOT NULL,
  `Amount` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_agents`
--
ALTER TABLE `tbl_agents`
  ADD PRIMARY KEY (`Agent_ID`),
  ADD UNIQUE KEY `Contact_Number` (`Contact_Number`);

--
-- Indexes for table `tbl_clients`
--
ALTER TABLE `tbl_clients`
  ADD PRIMARY KEY (`Client_ID`),
  ADD UNIQUE KEY `Contact_Number` (`Contact_Number`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `tbl_properties;`
--
ALTER TABLE `tbl_properties;`
  ADD PRIMARY KEY (`Property_ID`);
ALTER TABLE `tbl_properties;` ADD FULLTEXT KEY `CHECK(Status IN ('Available', 'Sold', 'Rented'))` (`Status`);
ALTER TABLE `tbl_properties;` ADD FULLTEXT KEY `CHECK (Type IN ('Residential', 'Commercial', 'Industrial'))` (`Type`);

--
-- Indexes for table `tbl_transactions`
--
ALTER TABLE `tbl_transactions`
  ADD PRIMARY KEY (`Tansaction_ID`),
  ADD UNIQUE KEY `Property_ID` (`Property_ID`),
  ADD UNIQUE KEY `Agent_ID` (`Agent_ID`,`Client_ID`),
  ADD KEY `Client_ID` (`Client_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_agents`
--
ALTER TABLE `tbl_agents`
  MODIFY `Agent_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_clients`
--
ALTER TABLE `tbl_clients`
  MODIFY `Client_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_properties;`
--
ALTER TABLE `tbl_properties;`
  MODIFY `Property_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_transactions`
--
ALTER TABLE `tbl_transactions`
  MODIFY `Tansaction_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_transactions`
--
ALTER TABLE `tbl_transactions`
  ADD CONSTRAINT `tbl_transactions_ibfk_1` FOREIGN KEY (`Property_ID`) REFERENCES `tbl_properties;` (`Property_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_transactions_ibfk_2` FOREIGN KEY (`Agent_ID`) REFERENCES `tbl_agents` (`Agent_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_transactions_ibfk_3` FOREIGN KEY (`Client_ID`) REFERENCES `tbl_clients` (`Client_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
